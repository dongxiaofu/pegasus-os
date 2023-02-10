
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001100 <_start>:
c0001100:	c7 05 c0 07 01 c0 00 	movl   $0x0,0xc00107c0
c0001107:	00 00 00 
c000110a:	b4 0b                	mov    $0xb,%ah
c000110c:	b0 4c                	mov    $0x4c,%al
c000110e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001115:	66 c7 05 c0 07 01 c0 	movw   $0x0,0xc00107c0
c000111c:	00 00 
c000111e:	0f 01 05 e8 16 01 c0 	sgdtl  0xc00116e8
c0001125:	e8 30 3a 00 00       	call   c0004b5a <ReloadGDT>
c000112a:	0f 01 15 e8 16 01 c0 	lgdtl  0xc00116e8
c0001131:	0f 01 1d a8 07 01 c0 	lidtl  0xc00107a8
c0001138:	0f a8                	push   %gs
c000113a:	0f a9                	pop    %gs
c000113c:	ea 43 11 00 c0 08 00 	ljmp   $0x8,$0xc0001143

c0001143 <csinit>:
c0001143:	31 c0                	xor    %eax,%eax
c0001145:	66 b8 40 00          	mov    $0x40,%ax
c0001149:	0f 00 d8             	ltr    %ax
c000114c:	31 c0                	xor    %eax,%eax
c000114e:	e9 52 03 00 00       	jmp    c00014a5 <kernel_main>
c0001153:	f4                   	hlt    
c0001154:	eb fe                	jmp    c0001154 <csinit+0x11>
c0001156:	fb                   	sti    
c0001157:	b4 0b                	mov    $0xb,%ah
c0001159:	b0 4d                	mov    $0x4d,%al
c000115b:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
c0001162:	eb fe                	jmp    c0001162 <csinit+0x1f>
c0001164:	f4                   	hlt    
c0001165:	6a 00                	push   $0x0
c0001167:	9d                   	popf   
c0001168:	eb fe                	jmp    c0001168 <csinit+0x25>
c000116a:	e8 64 74 00 00       	call   c00085d3 <test>
c000116f:	6a 01                	push   $0x1
c0001171:	6a 02                	push   $0x2
c0001173:	6a 03                	push   $0x3
c0001175:	f4                   	hlt    
c0001176:	66 90                	xchg   %ax,%ax
c0001178:	66 90                	xchg   %ax,%ax
c000117a:	66 90                	xchg   %ax,%ax
c000117c:	66 90                	xchg   %ax,%ax
c000117e:	66 90                	xchg   %ax,%ax

c0001180 <InterruptTest>:
c0001180:	b4 0d                	mov    $0xd,%ah
c0001182:	b0 54                	mov    $0x54,%al
c0001184:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
c000118b:	c3                   	ret    

c000118c <disp_str>:
c000118c:	55                   	push   %ebp
c000118d:	89 e5                	mov    %esp,%ebp
c000118f:	b4 0d                	mov    $0xd,%ah
c0001191:	8b 75 08             	mov    0x8(%ebp),%esi
c0001194:	8b 3d c0 07 01 c0    	mov    0xc00107c0,%edi

c000119a <disp_str.1>:
c000119a:	ac                   	lods   %ds:(%esi),%al
c000119b:	84 c0                	test   %al,%al
c000119d:	74 1e                	je     c00011bd <disp_str.4>
c000119f:	3c 0a                	cmp    $0xa,%al
c00011a1:	75 11                	jne    c00011b4 <disp_str.3>
c00011a3:	50                   	push   %eax
c00011a4:	89 f8                	mov    %edi,%eax
c00011a6:	b3 a0                	mov    $0xa0,%bl
c00011a8:	f6 f3                	div    %bl
c00011aa:	40                   	inc    %eax
c00011ab:	b3 a0                	mov    $0xa0,%bl
c00011ad:	f6 e3                	mul    %bl
c00011af:	89 c7                	mov    %eax,%edi
c00011b1:	58                   	pop    %eax
c00011b2:	eb e6                	jmp    c000119a <disp_str.1>

c00011b4 <disp_str.3>:
c00011b4:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00011b8:	83 c7 02             	add    $0x2,%edi
c00011bb:	eb dd                	jmp    c000119a <disp_str.1>

c00011bd <disp_str.4>:
c00011bd:	89 3d c0 07 01 c0    	mov    %edi,0xc00107c0
c00011c3:	89 ec                	mov    %ebp,%esp
c00011c5:	5d                   	pop    %ebp
c00011c6:	c3                   	ret    

c00011c7 <disp_str_colour>:
c00011c7:	55                   	push   %ebp
c00011c8:	89 e5                	mov    %esp,%ebp
c00011ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00011cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00011d0:	8b 3d c0 07 01 c0    	mov    0xc00107c0,%edi

c00011d6 <disp_str_colour.1>:
c00011d6:	ac                   	lods   %ds:(%esi),%al
c00011d7:	84 c0                	test   %al,%al
c00011d9:	74 1e                	je     c00011f9 <disp_str_colour.4>
c00011db:	3c 0a                	cmp    $0xa,%al
c00011dd:	75 11                	jne    c00011f0 <disp_str_colour.3>
c00011df:	50                   	push   %eax
c00011e0:	89 f8                	mov    %edi,%eax
c00011e2:	b3 a0                	mov    $0xa0,%bl
c00011e4:	f6 f3                	div    %bl
c00011e6:	40                   	inc    %eax
c00011e7:	b3 a0                	mov    $0xa0,%bl
c00011e9:	f6 e3                	mul    %bl
c00011eb:	89 c7                	mov    %eax,%edi
c00011ed:	58                   	pop    %eax
c00011ee:	eb e6                	jmp    c00011d6 <disp_str_colour.1>

c00011f0 <disp_str_colour.3>:
c00011f0:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00011f4:	83 c7 02             	add    $0x2,%edi
c00011f7:	eb dd                	jmp    c00011d6 <disp_str_colour.1>

c00011f9 <disp_str_colour.4>:
c00011f9:	89 3d c0 07 01 c0    	mov    %edi,0xc00107c0
c00011ff:	89 ec                	mov    %ebp,%esp
c0001201:	5d                   	pop    %ebp
c0001202:	c3                   	ret    

c0001203 <divide_zero_fault>:
c0001203:	6a ff                	push   $0xffffffff
c0001205:	6a 00                	push   $0x0
c0001207:	eb 5f                	jmp    c0001268 <exception>

c0001209 <single_step_fault>:
c0001209:	6a ff                	push   $0xffffffff
c000120b:	6a 01                	push   $0x1
c000120d:	eb 59                	jmp    c0001268 <exception>

c000120f <non_maskable_interrupt>:
c000120f:	6a ff                	push   $0xffffffff
c0001211:	6a 02                	push   $0x2
c0001213:	eb 53                	jmp    c0001268 <exception>

c0001215 <breakpoint_trap>:
c0001215:	6a ff                	push   $0xffffffff
c0001217:	6a 03                	push   $0x3
c0001219:	eb 4d                	jmp    c0001268 <exception>

c000121b <overflow_trap>:
c000121b:	6a ff                	push   $0xffffffff
c000121d:	6a 04                	push   $0x4
c000121f:	eb 47                	jmp    c0001268 <exception>

c0001221 <bound_range_exceeded_fault>:
c0001221:	6a ff                	push   $0xffffffff
c0001223:	6a 05                	push   $0x5
c0001225:	eb 41                	jmp    c0001268 <exception>

c0001227 <invalid_opcode_fault>:
c0001227:	6a ff                	push   $0xffffffff
c0001229:	6a 06                	push   $0x6
c000122b:	eb 3b                	jmp    c0001268 <exception>

c000122d <coprocessor_not_available_fault>:
c000122d:	6a ff                	push   $0xffffffff
c000122f:	6a 07                	push   $0x7
c0001231:	eb 35                	jmp    c0001268 <exception>

c0001233 <double_fault_exception_abort>:
c0001233:	6a 08                	push   $0x8
c0001235:	eb 31                	jmp    c0001268 <exception>

c0001237 <coprocessor_segment_overrun>:
c0001237:	6a ff                	push   $0xffffffff
c0001239:	6a 09                	push   $0x9
c000123b:	eb 2b                	jmp    c0001268 <exception>

c000123d <invalid_task_state_segment_fault>:
c000123d:	6a 0a                	push   $0xa
c000123f:	eb 27                	jmp    c0001268 <exception>

c0001241 <segment_not_present_fault>:
c0001241:	6a 0b                	push   $0xb
c0001243:	eb 23                	jmp    c0001268 <exception>

c0001245 <stack_exception_fault>:
c0001245:	6a 0c                	push   $0xc
c0001247:	eb 1f                	jmp    c0001268 <exception>

c0001249 <general_protection_exception_fault>:
c0001249:	6a 0d                	push   $0xd
c000124b:	e8 86 6e 00 00       	call   c00080d6 <exception_handler>
c0001250:	83 c4 08             	add    $0x8,%esp
c0001253:	cf                   	iret   

c0001254 <page_fault>:
c0001254:	6a 0e                	push   $0xe
c0001256:	eb 10                	jmp    c0001268 <exception>

c0001258 <coprocessor_error_fault>:
c0001258:	6a ff                	push   $0xffffffff
c000125a:	6a 10                	push   $0x10
c000125c:	eb 0a                	jmp    c0001268 <exception>

c000125e <align_check_fault>:
c000125e:	6a 11                	push   $0x11
c0001260:	eb 06                	jmp    c0001268 <exception>

c0001262 <simd_float_exception_fault>:
c0001262:	6a ff                	push   $0xffffffff
c0001264:	6a 12                	push   $0x12
c0001266:	eb 00                	jmp    c0001268 <exception>

c0001268 <exception>:
c0001268:	e8 69 6e 00 00       	call   c00080d6 <exception_handler>
c000126d:	83 c4 08             	add    $0x8,%esp
c0001270:	f4                   	hlt    

c0001271 <hwint0>:
c0001271:	60                   	pusha  
c0001272:	1e                   	push   %ds
c0001273:	06                   	push   %es
c0001274:	0f a0                	push   %fs
c0001276:	0f a8                	push   %gs
c0001278:	66 8c d2             	mov    %ss,%dx
c000127b:	8e da                	mov    %edx,%ds
c000127d:	8e c2                	mov    %edx,%es
c000127f:	8e e2                	mov    %edx,%fs
c0001281:	b0 20                	mov    $0x20,%al
c0001283:	e6 20                	out    %al,$0x20
c0001285:	ff 05 c4 07 01 c0    	incl   0xc00107c4
c000128b:	83 3d c4 07 01 c0 00 	cmpl   $0x0,0xc00107c4
c0001292:	75 00                	jne    c0001294 <hwint0.1>

c0001294 <hwint0.1>:
c0001294:	e8 b3 34 00 00       	call   c000474c <clock_handler>
c0001299:	e9 e1 00 00 00       	jmp    c000137f <reenter_restore>

c000129e <hwint1>:
c000129e:	60                   	pusha  
c000129f:	1e                   	push   %ds
c00012a0:	06                   	push   %es
c00012a1:	0f a0                	push   %fs
c00012a3:	0f a8                	push   %gs
c00012a5:	66 8c d2             	mov    %ss,%dx
c00012a8:	8e da                	mov    %edx,%ds
c00012aa:	8e c2                	mov    %edx,%es
c00012ac:	8e e2                	mov    %edx,%fs
c00012ae:	b0 fa                	mov    $0xfa,%al
c00012b0:	e6 21                	out    %al,$0x21
c00012b2:	b0 20                	mov    $0x20,%al
c00012b4:	e6 20                	out    %al,$0x20
c00012b6:	ff 05 c4 07 01 c0    	incl   0xc00107c4
c00012bc:	83 3d c4 07 01 c0 00 	cmpl   $0x0,0xc00107c4
c00012c3:	75 00                	jne    c00012c5 <hwint1.1>

c00012c5 <hwint1.1>:
c00012c5:	e8 e5 43 00 00       	call   c00056af <keyboard_handler>
c00012ca:	b0 f8                	mov    $0xf8,%al
c00012cc:	e6 21                	out    %al,$0x21
c00012ce:	83 3d c4 07 01 c0 00 	cmpl   $0x0,0xc00107c4
c00012d5:	0f 85 a4 00 00 00    	jne    c000137f <reenter_restore>
c00012db:	e9 9f 00 00 00       	jmp    c000137f <reenter_restore>

c00012e0 <hwint14>:
c00012e0:	60                   	pusha  
c00012e1:	1e                   	push   %ds
c00012e2:	06                   	push   %es
c00012e3:	0f a0                	push   %fs
c00012e5:	0f a8                	push   %gs
c00012e7:	66 8c d2             	mov    %ss,%dx
c00012ea:	8e da                	mov    %edx,%ds
c00012ec:	8e c2                	mov    %edx,%es
c00012ee:	8e e2                	mov    %edx,%fs
c00012f0:	b0 ff                	mov    $0xff,%al
c00012f2:	e6 a1                	out    %al,$0xa1
c00012f4:	b0 20                	mov    $0x20,%al
c00012f6:	e6 20                	out    %al,$0x20
c00012f8:	90                   	nop
c00012f9:	e6 a0                	out    %al,$0xa0
c00012fb:	ff 05 c4 07 01 c0    	incl   0xc00107c4
c0001301:	83 3d c4 07 01 c0 00 	cmpl   $0x0,0xc00107c4
c0001308:	75 00                	jne    c000130a <hwint14.1>

c000130a <hwint14.1>:
c000130a:	e8 a4 10 00 00       	call   c00023b3 <hd_handler>
c000130f:	b0 bf                	mov    $0xbf,%al
c0001311:	e6 a1                	out    %al,$0xa1
c0001313:	83 3d c4 07 01 c0 00 	cmpl   $0x0,0xc00107c4
c000131a:	75 63                	jne    c000137f <reenter_restore>
c000131c:	eb 61                	jmp    c000137f <reenter_restore>

c000131e <sys_call>:
c000131e:	60                   	pusha  
c000131f:	1e                   	push   %ds
c0001320:	06                   	push   %es
c0001321:	0f a0                	push   %fs
c0001323:	0f a8                	push   %gs
c0001325:	89 e6                	mov    %esp,%esi
c0001327:	89 e5                	mov    %esp,%ebp
c0001329:	66 8c d2             	mov    %ss,%dx
c000132c:	8e da                	mov    %edx,%ds
c000132e:	8e c2                	mov    %edx,%es
c0001330:	8e e2                	mov    %edx,%fs
c0001332:	ff 05 c4 07 01 c0    	incl   0xc00107c4
c0001338:	83 3d c4 07 01 c0 00 	cmpl   $0x0,0xc00107c4
c000133f:	75 00                	jne    c0001341 <sys_call.1>

c0001341 <sys_call.1>:
c0001341:	56                   	push   %esi
c0001342:	ff 35 e0 0b 01 c0    	pushl  0xc0010be0
c0001348:	53                   	push   %ebx
c0001349:	51                   	push   %ecx
c000134a:	ff 14 85 2c f1 00 c0 	call   *-0x3fff0ed4(,%eax,4)
c0001351:	83 c4 0c             	add    $0xc,%esp
c0001354:	5e                   	pop    %esi
c0001355:	89 45 2c             	mov    %eax,0x2c(%ebp)
c0001358:	83 3d c4 07 01 c0 00 	cmpl   $0x0,0xc00107c4
c000135f:	75 1e                	jne    c000137f <reenter_restore>
c0001361:	eb 1c                	jmp    c000137f <reenter_restore>

c0001363 <fork_restart>:
c0001363:	fa                   	cli    
c0001364:	0f a9                	pop    %gs
c0001366:	0f a1                	pop    %fs
c0001368:	07                   	pop    %es
c0001369:	1f                   	pop    %ds
c000136a:	61                   	popa   
c000136b:	cf                   	iret   

c000136c <restart>:
c000136c:	ff 0d c4 07 01 c0    	decl   0xc00107c4
c0001372:	89 e5                	mov    %esp,%ebp
c0001374:	8b 65 04             	mov    0x4(%ebp),%esp
c0001377:	0f a9                	pop    %gs
c0001379:	0f a1                	pop    %fs
c000137b:	07                   	pop    %es
c000137c:	1f                   	pop    %ds
c000137d:	61                   	popa   
c000137e:	cf                   	iret   

c000137f <reenter_restore>:
c000137f:	ff 0d c4 07 01 c0    	decl   0xc00107c4
c0001385:	0f a9                	pop    %gs
c0001387:	0f a1                	pop    %fs
c0001389:	07                   	pop    %es
c000138a:	1f                   	pop    %ds
c000138b:	61                   	popa   
c000138c:	cf                   	iret   

c000138d <in_byte>:
c000138d:	31 d2                	xor    %edx,%edx
c000138f:	8b 54 24 04          	mov    0x4(%esp),%edx
c0001393:	31 c0                	xor    %eax,%eax
c0001395:	ec                   	in     (%dx),%al
c0001396:	90                   	nop
c0001397:	90                   	nop
c0001398:	c3                   	ret    

c0001399 <out_byte>:
c0001399:	31 d2                	xor    %edx,%edx
c000139b:	31 c0                	xor    %eax,%eax
c000139d:	8b 54 24 04          	mov    0x4(%esp),%edx
c00013a1:	8a 44 24 08          	mov    0x8(%esp),%al
c00013a5:	ee                   	out    %al,(%dx)
c00013a6:	90                   	nop
c00013a7:	90                   	nop
c00013a8:	c3                   	ret    

c00013a9 <in_byte2>:
c00013a9:	55                   	push   %ebp
c00013aa:	89 e5                	mov    %esp,%ebp
c00013ac:	52                   	push   %edx
c00013ad:	31 d2                	xor    %edx,%edx
c00013af:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00013b3:	31 c0                	xor    %eax,%eax
c00013b5:	ec                   	in     (%dx),%al
c00013b6:	90                   	nop
c00013b7:	90                   	nop
c00013b8:	5b                   	pop    %ebx
c00013b9:	5d                   	pop    %ebp
c00013ba:	c3                   	ret    

c00013bb <disable_int>:
c00013bb:	fa                   	cli    
c00013bc:	c3                   	ret    

c00013bd <enable_int>:
c00013bd:	fb                   	sti    
c00013be:	c3                   	ret    

c00013bf <check_tss_esp0>:
c00013bf:	55                   	push   %ebp
c00013c0:	89 e5                	mov    %esp,%ebp
c00013c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00013c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00013c8:	83 c0 44             	add    $0x44,%eax
c00013cb:	8b 15 64 16 01 c0    	mov    0xc0011664,%edx
c00013d1:	39 d0                	cmp    %edx,%eax
c00013d3:	74 7c                	je     c0001451 <check_tss_esp0.2>

c00013d5 <check_tss_esp0.1>:
c00013d5:	50                   	push   %eax
c00013d6:	52                   	push   %edx
c00013d7:	68 10 f0 00 c0       	push   $0xc000f010
c00013dc:	e8 ab fd ff ff       	call   c000118c <disp_str>
c00013e1:	83 c4 04             	add    $0x4,%esp
c00013e4:	5a                   	pop    %edx
c00013e5:	58                   	pop    %eax
c00013e6:	52                   	push   %edx
c00013e7:	50                   	push   %eax
c00013e8:	53                   	push   %ebx
c00013e9:	e8 82 6b 00 00       	call   c0007f70 <disp_int>
c00013ee:	83 c4 04             	add    $0x4,%esp
c00013f1:	58                   	pop    %eax
c00013f2:	5a                   	pop    %edx
c00013f3:	52                   	push   %edx
c00013f4:	50                   	push   %eax
c00013f5:	e8 76 6b 00 00       	call   c0007f70 <disp_int>
c00013fa:	58                   	pop    %eax
c00013fb:	5a                   	pop    %edx
c00013fc:	52                   	push   %edx
c00013fd:	50                   	push   %eax
c00013fe:	ff 35 c4 07 01 c0    	pushl  0xc00107c4
c0001404:	e8 67 6b 00 00       	call   c0007f70 <disp_int>
c0001409:	83 c4 04             	add    $0x4,%esp
c000140c:	58                   	pop    %eax
c000140d:	5a                   	pop    %edx
c000140e:	52                   	push   %edx
c000140f:	50                   	push   %eax
c0001410:	ff 72 ec             	pushl  -0x14(%edx)
c0001413:	e8 58 6b 00 00       	call   c0007f70 <disp_int>
c0001418:	83 c4 04             	add    $0x4,%esp
c000141b:	58                   	pop    %eax
c000141c:	5a                   	pop    %edx
c000141d:	52                   	push   %edx
c000141e:	50                   	push   %eax
c000141f:	ff 70 ec             	pushl  -0x14(%eax)
c0001422:	e8 49 6b 00 00       	call   c0007f70 <disp_int>
c0001427:	83 c4 04             	add    $0x4,%esp
c000142a:	58                   	pop    %eax
c000142b:	5a                   	pop    %edx
c000142c:	52                   	push   %edx
c000142d:	50                   	push   %eax
c000142e:	ff 35 e0 0b 01 c0    	pushl  0xc0010be0
c0001434:	e8 37 6b 00 00       	call   c0007f70 <disp_int>
c0001439:	83 c4 04             	add    $0x4,%esp
c000143c:	58                   	pop    %eax
c000143d:	5a                   	pop    %edx
c000143e:	52                   	push   %edx
c000143f:	50                   	push   %eax
c0001440:	68 80 07 01 c0       	push   $0xc0010780
c0001445:	e8 26 6b 00 00       	call   c0007f70 <disp_int>
c000144a:	83 c4 04             	add    $0x4,%esp
c000144d:	58                   	pop    %eax
c000144e:	5a                   	pop    %edx
c000144f:	5d                   	pop    %ebp
c0001450:	c3                   	ret    

c0001451 <check_tss_esp0.2>:
c0001451:	5d                   	pop    %ebp
c0001452:	c3                   	ret    

c0001453 <enable_8259A_casecade_irq>:
c0001453:	9c                   	pushf  
c0001454:	fa                   	cli    
c0001455:	e4 21                	in     $0x21,%al
c0001457:	24 fb                	and    $0xfb,%al
c0001459:	e6 21                	out    %al,$0x21
c000145b:	9d                   	popf   
c000145c:	c3                   	ret    

c000145d <disable_8259A_casecade_irq>:
c000145d:	9c                   	pushf  
c000145e:	fa                   	cli    
c000145f:	e4 21                	in     $0x21,%al
c0001461:	0c 04                	or     $0x4,%al
c0001463:	e6 21                	out    %al,$0x21
c0001465:	9c                   	pushf  
c0001466:	c3                   	ret    

c0001467 <enable_8259A_slave_winchester_irq>:
c0001467:	9c                   	pushf  
c0001468:	fa                   	cli    
c0001469:	e4 a1                	in     $0xa1,%al
c000146b:	24 bf                	and    $0xbf,%al
c000146d:	e6 a1                	out    %al,$0xa1
c000146f:	9d                   	popf   
c0001470:	c3                   	ret    

c0001471 <disable_8259A_slave_winchester_irq>:
c0001471:	9c                   	pushf  
c0001472:	fa                   	cli    
c0001473:	e4 a1                	in     $0xa1,%al
c0001475:	0c 40                	or     $0x40,%al
c0001477:	e6 a1                	out    %al,$0xa1
c0001479:	9d                   	popf   
c000147a:	c3                   	ret    

c000147b <update_cr3>:
c000147b:	55                   	push   %ebp
c000147c:	89 e5                	mov    %esp,%ebp
c000147e:	8b 45 08             	mov    0x8(%ebp),%eax
c0001481:	0f 22 d8             	mov    %eax,%cr3
c0001484:	89 ec                	mov    %ebp,%esp
c0001486:	5d                   	pop    %ebp
c0001487:	c3                   	ret    

c0001488 <update_tss>:
c0001488:	55                   	push   %ebp
c0001489:	89 e5                	mov    %esp,%ebp
c000148b:	8b 45 08             	mov    0x8(%ebp),%eax
c000148e:	a3 64 16 01 c0       	mov    %eax,0xc0011664
c0001493:	89 ec                	mov    %ebp,%esp
c0001495:	5d                   	pop    %ebp
c0001496:	c3                   	ret    

c0001497 <get_running_thread_pcb>:
c0001497:	89 e0                	mov    %esp,%eax
c0001499:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000149e:	c3                   	ret    

c000149f <sys_call_test>:
c000149f:	9c                   	pushf  
c00014a0:	66 87 db             	xchg   %bx,%bx
c00014a3:	9d                   	popf   
c00014a4:	c3                   	ret    

c00014a5 <kernel_main>:
c00014a5:	55                   	push   %ebp
c00014a6:	89 e5                	mov    %esp,%ebp
c00014a8:	83 ec 08             	sub    $0x8,%esp
c00014ab:	e8 d0 00 00 00       	call   c0001580 <init>
c00014b0:	e8 e2 ff ff ff       	call   c0001497 <get_running_thread_pcb>
c00014b5:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c00014ba:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00014bf:	05 00 01 00 00       	add    $0x100,%eax
c00014c4:	83 ec 08             	sub    $0x8,%esp
c00014c7:	50                   	push   %eax
c00014c8:	68 0c 0e 01 c0       	push   $0xc0010e0c
c00014cd:	e8 7e 9b 00 00       	call   c000b050 <appendToDoubleLinkList>
c00014d2:	83 c4 10             	add    $0x10,%esp
c00014d5:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00014da:	05 08 01 00 00       	add    $0x108,%eax
c00014df:	83 ec 08             	sub    $0x8,%esp
c00014e2:	50                   	push   %eax
c00014e3:	68 0c 0e 01 c0       	push   $0xc0010e0c
c00014e8:	e8 63 9b 00 00       	call   c000b050 <appendToDoubleLinkList>
c00014ed:	83 c4 10             	add    $0x10,%esp
c00014f0:	6a 00                	push   $0x0
c00014f2:	68 00 b4 00 c0       	push   $0xc000b400
c00014f7:	68 07 b4 00 c0       	push   $0xc000b407
c00014fc:	68 ac 61 00 c0       	push   $0xc00061ac
c0001501:	e8 90 98 00 00       	call   c000ad96 <process_execute>
c0001506:	83 c4 10             	add    $0x10,%esp
c0001509:	6a 00                	push   $0x0
c000150b:	68 10 b4 00 c0       	push   $0xc000b410
c0001510:	68 18 b4 00 c0       	push   $0xc000b418
c0001515:	68 f1 25 00 c0       	push   $0xc00025f1
c000151a:	e8 77 98 00 00       	call   c000ad96 <process_execute>
c000151f:	83 c4 10             	add    $0x10,%esp
c0001522:	6a 00                	push   $0x0
c0001524:	68 21 b4 00 c0       	push   $0xc000b421
c0001529:	68 28 b4 00 c0       	push   $0xc000b428
c000152e:	68 2b 17 00 c0       	push   $0xc000172b
c0001533:	e8 5e 98 00 00       	call   c000ad96 <process_execute>
c0001538:	83 c4 10             	add    $0x10,%esp
c000153b:	6a 00                	push   $0x0
c000153d:	68 31 b4 00 c0       	push   $0xc000b431
c0001542:	68 39 b4 00 c0       	push   $0xc000b439
c0001547:	68 ac 55 00 c0       	push   $0xc00055ac
c000154c:	e8 45 98 00 00       	call   c000ad96 <process_execute>
c0001551:	83 c4 10             	add    $0x10,%esp
c0001554:	6a 01                	push   $0x1
c0001556:	68 43 b4 00 c0       	push   $0xc000b443
c000155b:	68 4d b4 00 c0       	push   $0xc000b44d
c0001560:	68 f6 16 00 c0       	push   $0xc00016f6
c0001565:	e8 2c 98 00 00       	call   c000ad96 <process_execute>
c000156a:	83 c4 10             	add    $0x10,%esp
c000156d:	83 ec 0c             	sub    $0xc,%esp
c0001570:	68 5a b4 00 c0       	push   $0xc000b45a
c0001575:	e8 12 fc ff ff       	call   c000118c <disp_str>
c000157a:	83 c4 10             	add    $0x10,%esp
c000157d:	fb                   	sti    
c000157e:	eb fe                	jmp    c000157e <kernel_main+0xd9>

c0001580 <init>:
c0001580:	55                   	push   %ebp
c0001581:	89 e5                	mov    %esp,%ebp
c0001583:	83 ec 18             	sub    $0x18,%esp
c0001586:	c7 05 c0 07 01 c0 00 	movl   $0x0,0xc00107c0
c000158d:	00 00 00 
c0001590:	c7 05 b0 07 01 c0 00 	movl   $0x0,0xc00107b0
c0001597:	00 00 00 
c000159a:	c7 05 1c 0e 01 c0 09 	movl   $0x9,0xc0010e1c
c00015a1:	00 00 00 
c00015a4:	c7 05 e0 0b 01 c0 00 	movl   $0x0,0xc0010be0
c00015ab:	00 00 00 
c00015ae:	83 ec 0c             	sub    $0xc,%esp
c00015b1:	68 64 b4 00 c0       	push   $0xc000b464
c00015b6:	e8 d1 fb ff ff       	call   c000118c <disp_str>
c00015bb:	83 c4 10             	add    $0x10,%esp
c00015be:	e8 cd 70 00 00       	call   c0008690 <init_keyboard>
c00015c3:	83 ec 0c             	sub    $0xc,%esp
c00015c6:	68 00 00 00 04       	push   $0x4000000
c00015cb:	e8 e1 63 00 00       	call   c00079b1 <init_memory>
c00015d0:	83 c4 10             	add    $0x10,%esp
c00015d3:	83 ec 0c             	sub    $0xc,%esp
c00015d6:	68 0c 0e 01 c0       	push   $0xc0010e0c
c00015db:	e8 45 99 00 00       	call   c000af25 <initDoubleLinkList>
c00015e0:	83 c4 10             	add    $0x10,%esp
c00015e3:	83 ec 0c             	sub    $0xc,%esp
c00015e6:	68 24 1f 01 c0       	push   $0xc0011f24
c00015eb:	e8 35 99 00 00       	call   c000af25 <initDoubleLinkList>
c00015f0:	83 c4 10             	add    $0x10,%esp
c00015f3:	c7 05 c0 07 01 c0 00 	movl   $0x0,0xc00107c0
c00015fa:	00 00 00 
c00015fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001604:	eb 14                	jmp    c000161a <init+0x9a>
c0001606:	83 ec 0c             	sub    $0xc,%esp
c0001609:	68 6a b4 00 c0       	push   $0xc000b46a
c000160e:	e8 79 fb ff ff       	call   c000118c <disp_str>
c0001613:	83 c4 10             	add    $0x10,%esp
c0001616:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000161a:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0001621:	7e e3                	jle    c0001606 <init+0x86>
c0001623:	c7 05 c0 07 01 c0 00 	movl   $0x0,0xc00107c0
c000162a:	00 00 00 
c000162d:	90                   	nop
c000162e:	c9                   	leave  
c000162f:	c3                   	ret    

c0001630 <kernel_thread_a>:
c0001630:	55                   	push   %ebp
c0001631:	89 e5                	mov    %esp,%ebp
c0001633:	83 ec 18             	sub    $0x18,%esp
c0001636:	83 ec 0c             	sub    $0xc,%esp
c0001639:	ff 75 08             	pushl  0x8(%ebp)
c000163c:	e8 4b fb ff ff       	call   c000118c <disp_str>
c0001641:	83 c4 10             	add    $0x10,%esp
c0001644:	a1 c0 07 01 c0       	mov    0xc00107c0,%eax
c0001649:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000164c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001653:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001656:	a3 c0 07 01 c0       	mov    %eax,0xc00107c0
c000165b:	83 ec 0c             	sub    $0xc,%esp
c000165e:	68 6b b4 00 c0       	push   $0xc000b46b
c0001663:	e8 24 fb ff ff       	call   c000118c <disp_str>
c0001668:	83 c4 10             	add    $0x10,%esp
c000166b:	83 ec 0c             	sub    $0xc,%esp
c000166e:	68 74 b4 00 c0       	push   $0xc000b474
c0001673:	e8 14 fb ff ff       	call   c000118c <disp_str>
c0001678:	83 c4 10             	add    $0x10,%esp
c000167b:	eb d6                	jmp    c0001653 <kernel_thread_a+0x23>

c000167d <kernel_thread_b>:
c000167d:	55                   	push   %ebp
c000167e:	89 e5                	mov    %esp,%ebp
c0001680:	83 ec 18             	sub    $0x18,%esp
c0001683:	83 ec 0c             	sub    $0xc,%esp
c0001686:	ff 75 08             	pushl  0x8(%ebp)
c0001689:	e8 fe fa ff ff       	call   c000118c <disp_str>
c000168e:	83 c4 10             	add    $0x10,%esp
c0001691:	a1 c0 07 01 c0       	mov    0xc00107c0,%eax
c0001696:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001699:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00016a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00016a3:	a3 c0 07 01 c0       	mov    %eax,0xc00107c0
c00016a8:	83 ec 0c             	sub    $0xc,%esp
c00016ab:	68 76 b4 00 c0       	push   $0xc000b476
c00016b0:	e8 d7 fa ff ff       	call   c000118c <disp_str>
c00016b5:	83 c4 10             	add    $0x10,%esp
c00016b8:	83 ec 0c             	sub    $0xc,%esp
c00016bb:	68 74 b4 00 c0       	push   $0xc000b474
c00016c0:	e8 c7 fa ff ff       	call   c000118c <disp_str>
c00016c5:	83 c4 10             	add    $0x10,%esp
c00016c8:	eb d6                	jmp    c00016a0 <kernel_thread_b+0x23>

c00016ca <kernel_thread_c>:
c00016ca:	55                   	push   %ebp
c00016cb:	89 e5                	mov    %esp,%ebp
c00016cd:	83 ec 08             	sub    $0x8,%esp
c00016d0:	83 ec 0c             	sub    $0xc,%esp
c00016d3:	ff 75 08             	pushl  0x8(%ebp)
c00016d6:	e8 b1 fa ff ff       	call   c000118c <disp_str>
c00016db:	83 c4 10             	add    $0x10,%esp
c00016de:	eb fe                	jmp    c00016de <kernel_thread_c+0x14>

c00016e0 <kernel_thread_d>:
c00016e0:	55                   	push   %ebp
c00016e1:	89 e5                	mov    %esp,%ebp
c00016e3:	83 ec 08             	sub    $0x8,%esp
c00016e6:	83 ec 0c             	sub    $0xc,%esp
c00016e9:	ff 75 08             	pushl  0x8(%ebp)
c00016ec:	e8 9b fa ff ff       	call   c000118c <disp_str>
c00016f1:	83 c4 10             	add    $0x10,%esp
c00016f4:	eb fe                	jmp    c00016f4 <kernel_thread_d+0x14>

c00016f6 <user_proc_a>:
c00016f6:	55                   	push   %ebp
c00016f7:	89 e5                	mov    %esp,%ebp
c00016f9:	83 ec 08             	sub    $0x8,%esp
c00016fc:	83 ec 0c             	sub    $0xc,%esp
c00016ff:	68 7f b4 00 c0       	push   $0xc000b47f
c0001704:	e8 83 fa ff ff       	call   c000118c <disp_str>
c0001709:	83 c4 10             	add    $0x10,%esp
c000170c:	e8 bf 7e 00 00       	call   c00095d0 <test_exec>
c0001711:	eb fe                	jmp    c0001711 <user_proc_a+0x1b>

c0001713 <user_proc_b>:
c0001713:	55                   	push   %ebp
c0001714:	89 e5                	mov    %esp,%ebp
c0001716:	83 ec 08             	sub    $0x8,%esp
c0001719:	83 ec 0c             	sub    $0xc,%esp
c000171c:	68 91 b4 00 c0       	push   $0xc000b491
c0001721:	e8 66 fa ff ff       	call   c000118c <disp_str>
c0001726:	83 c4 10             	add    $0x10,%esp
c0001729:	eb fe                	jmp    c0001729 <user_proc_b+0x16>

c000172b <TaskHD>:
c000172b:	55                   	push   %ebp
c000172c:	89 e5                	mov    %esp,%ebp
c000172e:	83 ec 18             	sub    $0x18,%esp
c0001731:	e8 61 fd ff ff       	call   c0001497 <get_running_thread_pcb>
c0001736:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001739:	e8 32 00 00 00       	call   c0001770 <init_hd>
c000173e:	83 ec 0c             	sub    $0xc,%esp
c0001741:	6a 7c                	push   $0x7c
c0001743:	e8 7c 0e 00 00       	call   c00025c4 <sys_malloc>
c0001748:	83 c4 10             	add    $0x10,%esp
c000174b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000174e:	83 ec 04             	sub    $0x4,%esp
c0001751:	6a 7c                	push   $0x7c
c0001753:	6a 00                	push   $0x0
c0001755:	ff 75 f0             	pushl  -0x10(%ebp)
c0001758:	e8 6a ab 00 00       	call   c000c2c7 <Memset>
c000175d:	83 c4 10             	add    $0x10,%esp
c0001760:	83 ec 0c             	sub    $0xc,%esp
c0001763:	ff 75 f0             	pushl  -0x10(%ebp)
c0001766:	e8 1f 00 00 00       	call   c000178a <hd_handle>
c000176b:	83 c4 10             	add    $0x10,%esp
c000176e:	eb de                	jmp    c000174e <TaskHD+0x23>

c0001770 <init_hd>:
c0001770:	55                   	push   %ebp
c0001771:	89 e5                	mov    %esp,%ebp
c0001773:	83 ec 18             	sub    $0x18,%esp
c0001776:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c000177d:	e8 d1 fc ff ff       	call   c0001453 <enable_8259A_casecade_irq>
c0001782:	e8 e0 fc ff ff       	call   c0001467 <enable_8259A_slave_winchester_irq>
c0001787:	90                   	nop
c0001788:	c9                   	leave  
c0001789:	c3                   	ret    

c000178a <hd_handle>:
c000178a:	55                   	push   %ebp
c000178b:	89 e5                	mov    %esp,%ebp
c000178d:	83 ec 18             	sub    $0x18,%esp
c0001790:	83 ec 04             	sub    $0x4,%esp
c0001793:	6a 12                	push   $0x12
c0001795:	ff 75 08             	pushl  0x8(%ebp)
c0001798:	6a 02                	push   $0x2
c000179a:	e8 dc 8c 00 00       	call   c000a47b <send_rec>
c000179f:	83 c4 10             	add    $0x10,%esp
c00017a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00017a5:	8b 40 78             	mov    0x78(%eax),%eax
c00017a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00017ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00017af:	0f 84 d4 00 00 00    	je     c0001889 <hd_handle+0xff>
c00017b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00017b8:	8b 00                	mov    (%eax),%eax
c00017ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00017bd:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c00017c1:	74 28                	je     c00017eb <hd_handle+0x61>
c00017c3:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00017c7:	74 22                	je     c00017eb <hd_handle+0x61>
c00017c9:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c00017cd:	74 1c                	je     c00017eb <hd_handle+0x61>
c00017cf:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c00017d3:	74 16                	je     c00017eb <hd_handle+0x61>
c00017d5:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c00017dc:	74 0d                	je     c00017eb <hd_handle+0x61>
c00017de:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00017e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00017e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00017eb:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c00017ef:	74 34                	je     c0001825 <hd_handle+0x9b>
c00017f1:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00017f5:	74 2e                	je     c0001825 <hd_handle+0x9b>
c00017f7:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c00017fb:	74 28                	je     c0001825 <hd_handle+0x9b>
c00017fd:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001801:	74 22                	je     c0001825 <hd_handle+0x9b>
c0001803:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c000180a:	74 19                	je     c0001825 <hd_handle+0x9b>
c000180c:	6a 6d                	push   $0x6d
c000180e:	68 a4 b4 00 c0       	push   $0xc000b4a4
c0001813:	68 a4 b4 00 c0       	push   $0xc000b4a4
c0001818:	68 ac b4 00 c0       	push   $0xc000b4ac
c000181d:	e8 1c 83 00 00       	call   c0009b3e <assertion_failure>
c0001822:	83 c4 10             	add    $0x10,%esp
c0001825:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001829:	74 2c                	je     c0001857 <hd_handle+0xcd>
c000182b:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c000182f:	77 0e                	ja     c000183f <hd_handle+0xb5>
c0001831:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001835:	74 19                	je     c0001850 <hd_handle+0xc6>
c0001837:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c000183b:	74 1a                	je     c0001857 <hd_handle+0xcd>
c000183d:	eb 37                	jmp    c0001876 <hd_handle+0xec>
c000183f:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001843:	74 22                	je     c0001867 <hd_handle+0xdd>
c0001845:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c000184c:	74 3e                	je     c000188c <hd_handle+0x102>
c000184e:	eb 26                	jmp    c0001876 <hd_handle+0xec>
c0001850:	e8 e6 06 00 00       	call   c0001f3b <hd_open>
c0001855:	eb 36                	jmp    c000188d <hd_handle+0x103>
c0001857:	83 ec 0c             	sub    $0xc,%esp
c000185a:	ff 75 08             	pushl  0x8(%ebp)
c000185d:	e8 b2 08 00 00       	call   c0002114 <hd_rdwt>
c0001862:	83 c4 10             	add    $0x10,%esp
c0001865:	eb 26                	jmp    c000188d <hd_handle+0x103>
c0001867:	83 ec 0c             	sub    $0xc,%esp
c000186a:	6a 00                	push   $0x0
c000186c:	e8 71 07 00 00       	call   c0001fe2 <get_hd_ioctl>
c0001871:	83 c4 10             	add    $0x10,%esp
c0001874:	eb 17                	jmp    c000188d <hd_handle+0x103>
c0001876:	83 ec 0c             	sub    $0xc,%esp
c0001879:	68 06 b5 00 c0       	push   $0xc000b506
c000187e:	e8 77 82 00 00       	call   c0009afa <spin>
c0001883:	83 c4 10             	add    $0x10,%esp
c0001886:	90                   	nop
c0001887:	eb 04                	jmp    c000188d <hd_handle+0x103>
c0001889:	90                   	nop
c000188a:	eb 01                	jmp    c000188d <hd_handle+0x103>
c000188c:	90                   	nop
c000188d:	c9                   	leave  
c000188e:	c3                   	ret    

c000188f <hd_cmd_out>:
c000188f:	55                   	push   %ebp
c0001890:	89 e5                	mov    %esp,%ebp
c0001892:	83 ec 08             	sub    $0x8,%esp
c0001895:	83 ec 04             	sub    $0x4,%esp
c0001898:	68 18 73 01 00       	push   $0x17318
c000189d:	6a 00                	push   $0x0
c000189f:	68 80 00 00 00       	push   $0x80
c00018a4:	e8 36 0b 00 00       	call   c00023df <waitfor>
c00018a9:	83 c4 10             	add    $0x10,%esp
c00018ac:	85 c0                	test   %eax,%eax
c00018ae:	75 10                	jne    c00018c0 <hd_cmd_out+0x31>
c00018b0:	83 ec 0c             	sub    $0xc,%esp
c00018b3:	68 18 b5 00 c0       	push   $0xc000b518
c00018b8:	e8 63 82 00 00       	call   c0009b20 <panic>
c00018bd:	83 c4 10             	add    $0x10,%esp
c00018c0:	83 ec 08             	sub    $0x8,%esp
c00018c3:	6a 00                	push   $0x0
c00018c5:	68 f6 03 00 00       	push   $0x3f6
c00018ca:	e8 ca fa ff ff       	call   c0001399 <out_byte>
c00018cf:	83 c4 10             	add    $0x10,%esp
c00018d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00018d5:	0f b6 00             	movzbl (%eax),%eax
c00018d8:	0f b6 c0             	movzbl %al,%eax
c00018db:	83 ec 08             	sub    $0x8,%esp
c00018de:	50                   	push   %eax
c00018df:	68 f1 01 00 00       	push   $0x1f1
c00018e4:	e8 b0 fa ff ff       	call   c0001399 <out_byte>
c00018e9:	83 c4 10             	add    $0x10,%esp
c00018ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00018ef:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c00018f3:	0f b6 c0             	movzbl %al,%eax
c00018f6:	83 ec 08             	sub    $0x8,%esp
c00018f9:	50                   	push   %eax
c00018fa:	68 f2 01 00 00       	push   $0x1f2
c00018ff:	e8 95 fa ff ff       	call   c0001399 <out_byte>
c0001904:	83 c4 10             	add    $0x10,%esp
c0001907:	8b 45 08             	mov    0x8(%ebp),%eax
c000190a:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c000190e:	0f b6 c0             	movzbl %al,%eax
c0001911:	83 ec 08             	sub    $0x8,%esp
c0001914:	50                   	push   %eax
c0001915:	68 f3 01 00 00       	push   $0x1f3
c000191a:	e8 7a fa ff ff       	call   c0001399 <out_byte>
c000191f:	83 c4 10             	add    $0x10,%esp
c0001922:	8b 45 08             	mov    0x8(%ebp),%eax
c0001925:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001929:	0f b6 c0             	movzbl %al,%eax
c000192c:	83 ec 08             	sub    $0x8,%esp
c000192f:	50                   	push   %eax
c0001930:	68 f4 01 00 00       	push   $0x1f4
c0001935:	e8 5f fa ff ff       	call   c0001399 <out_byte>
c000193a:	83 c4 10             	add    $0x10,%esp
c000193d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001940:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001944:	0f b6 c0             	movzbl %al,%eax
c0001947:	83 ec 08             	sub    $0x8,%esp
c000194a:	50                   	push   %eax
c000194b:	68 f5 01 00 00       	push   $0x1f5
c0001950:	e8 44 fa ff ff       	call   c0001399 <out_byte>
c0001955:	83 c4 10             	add    $0x10,%esp
c0001958:	8b 45 08             	mov    0x8(%ebp),%eax
c000195b:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c000195f:	0f b6 c0             	movzbl %al,%eax
c0001962:	83 ec 08             	sub    $0x8,%esp
c0001965:	50                   	push   %eax
c0001966:	68 f6 01 00 00       	push   $0x1f6
c000196b:	e8 29 fa ff ff       	call   c0001399 <out_byte>
c0001970:	83 c4 10             	add    $0x10,%esp
c0001973:	8b 45 08             	mov    0x8(%ebp),%eax
c0001976:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c000197a:	0f b6 c0             	movzbl %al,%eax
c000197d:	83 ec 08             	sub    $0x8,%esp
c0001980:	50                   	push   %eax
c0001981:	68 f7 01 00 00       	push   $0x1f7
c0001986:	e8 0e fa ff ff       	call   c0001399 <out_byte>
c000198b:	83 c4 10             	add    $0x10,%esp
c000198e:	90                   	nop
c000198f:	c9                   	leave  
c0001990:	c3                   	ret    

c0001991 <hd_identify>:
c0001991:	55                   	push   %ebp
c0001992:	89 e5                	mov    %esp,%ebp
c0001994:	53                   	push   %ebx
c0001995:	83 ec 24             	sub    $0x24,%esp
c0001998:	89 e0                	mov    %esp,%eax
c000199a:	89 c3                	mov    %eax,%ebx
c000199c:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c00019a0:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c00019a4:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c00019a8:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c00019ac:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00019b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00019b3:	c1 e0 04             	shl    $0x4,%eax
c00019b6:	83 c8 e0             	or     $0xffffffe0,%eax
c00019b9:	88 45 ea             	mov    %al,-0x16(%ebp)
c00019bc:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c00019c0:	83 ec 0c             	sub    $0xc,%esp
c00019c3:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c00019c6:	50                   	push   %eax
c00019c7:	e8 c3 fe ff ff       	call   c000188f <hd_cmd_out>
c00019cc:	83 c4 10             	add    $0x10,%esp
c00019cf:	e8 f0 06 00 00       	call   c00020c4 <interrupt_wait>
c00019d4:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c00019db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00019de:	8d 50 ff             	lea    -0x1(%eax),%edx
c00019e1:	89 55 f0             	mov    %edx,-0x10(%ebp)
c00019e4:	89 c2                	mov    %eax,%edx
c00019e6:	b8 10 00 00 00       	mov    $0x10,%eax
c00019eb:	83 e8 01             	sub    $0x1,%eax
c00019ee:	01 d0                	add    %edx,%eax
c00019f0:	b9 10 00 00 00       	mov    $0x10,%ecx
c00019f5:	ba 00 00 00 00       	mov    $0x0,%edx
c00019fa:	f7 f1                	div    %ecx
c00019fc:	6b c0 10             	imul   $0x10,%eax,%eax
c00019ff:	29 c4                	sub    %eax,%esp
c0001a01:	89 e0                	mov    %esp,%eax
c0001a03:	83 c0 00             	add    $0x0,%eax
c0001a06:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001a09:	83 ec 04             	sub    $0x4,%esp
c0001a0c:	ff 75 f4             	pushl  -0xc(%ebp)
c0001a0f:	6a 00                	push   $0x0
c0001a11:	ff 75 ec             	pushl  -0x14(%ebp)
c0001a14:	e8 ae a8 00 00       	call   c000c2c7 <Memset>
c0001a19:	83 c4 10             	add    $0x10,%esp
c0001a1c:	83 ec 04             	sub    $0x4,%esp
c0001a1f:	ff 75 f4             	pushl  -0xc(%ebp)
c0001a22:	ff 75 ec             	pushl  -0x14(%ebp)
c0001a25:	68 f0 01 00 00       	push   $0x1f0
c0001a2a:	e8 ec a8 00 00       	call   c000c31b <read_port>
c0001a2f:	83 c4 10             	add    $0x10,%esp
c0001a32:	83 ec 0c             	sub    $0xc,%esp
c0001a35:	ff 75 ec             	pushl  -0x14(%ebp)
c0001a38:	e8 0b 00 00 00       	call   c0001a48 <print_hdinfo>
c0001a3d:	83 c4 10             	add    $0x10,%esp
c0001a40:	89 dc                	mov    %ebx,%esp
c0001a42:	90                   	nop
c0001a43:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001a46:	c9                   	leave  
c0001a47:	c3                   	ret    

c0001a48 <print_hdinfo>:
c0001a48:	55                   	push   %ebp
c0001a49:	89 e5                	mov    %esp,%ebp
c0001a4b:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001a51:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001a57:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001a5d:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001a64:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001a6b:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001a72:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001a79:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001a80:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001a86:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001a8c:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001a93:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001a9a:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001aa1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001aa8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001aaf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001ab6:	e9 8f 00 00 00       	jmp    c0001b4a <print_hdinfo+0x102>
c0001abb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001ac2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001ac5:	89 d0                	mov    %edx,%eax
c0001ac7:	01 c0                	add    %eax,%eax
c0001ac9:	01 d0                	add    %edx,%eax
c0001acb:	c1 e0 03             	shl    $0x3,%eax
c0001ace:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001ad1:	01 c8                	add    %ecx,%eax
c0001ad3:	83 e8 44             	sub    $0x44,%eax
c0001ad6:	0f b7 00             	movzwl (%eax),%eax
c0001ad9:	0f b7 c0             	movzwl %ax,%eax
c0001adc:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001adf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ae2:	01 d0                	add    %edx,%eax
c0001ae4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001ae7:	eb 30                	jmp    c0001b19 <print_hdinfo+0xd1>
c0001ae9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001aec:	8d 50 01             	lea    0x1(%eax),%edx
c0001aef:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001af2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001af5:	83 c2 01             	add    $0x1,%edx
c0001af8:	0f b6 00             	movzbl (%eax),%eax
c0001afb:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001aff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001b02:	8d 50 01             	lea    0x1(%eax),%edx
c0001b05:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001b08:	0f b6 00             	movzbl (%eax),%eax
c0001b0b:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001b0e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001b11:	01 ca                	add    %ecx,%edx
c0001b13:	88 02                	mov    %al,(%edx)
c0001b15:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001b19:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001b1c:	89 d0                	mov    %edx,%eax
c0001b1e:	01 c0                	add    %eax,%eax
c0001b20:	01 d0                	add    %edx,%eax
c0001b22:	c1 e0 03             	shl    $0x3,%eax
c0001b25:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001b28:	01 c8                	add    %ecx,%eax
c0001b2a:	83 e8 42             	sub    $0x42,%eax
c0001b2d:	0f b7 00             	movzwl (%eax),%eax
c0001b30:	66 d1 e8             	shr    %ax
c0001b33:	0f b7 c0             	movzwl %ax,%eax
c0001b36:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001b39:	7c ae                	jl     c0001ae9 <print_hdinfo+0xa1>
c0001b3b:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001b3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001b41:	01 d0                	add    %edx,%eax
c0001b43:	c6 00 00             	movb   $0x0,(%eax)
c0001b46:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001b4a:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001b4e:	0f 8e 67 ff ff ff    	jle    c0001abb <print_hdinfo+0x73>
c0001b54:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b57:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001b5b:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001b5f:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001b63:	66 c1 e8 08          	shr    $0x8,%ax
c0001b67:	66 85 c0             	test   %ax,%ax
c0001b6a:	0f 95 c0             	setne  %al
c0001b6d:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001b70:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001b77:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001b7d:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001b81:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001b85:	75 15                	jne    c0001b9c <print_hdinfo+0x154>
c0001b87:	83 ec 08             	sub    $0x8,%esp
c0001b8a:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001b8d:	50                   	push   %eax
c0001b8e:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001b91:	50                   	push   %eax
c0001b92:	e8 4f a7 00 00       	call   c000c2e6 <Strcpy>
c0001b97:	83 c4 10             	add    $0x10,%esp
c0001b9a:	eb 13                	jmp    c0001baf <print_hdinfo+0x167>
c0001b9c:	83 ec 08             	sub    $0x8,%esp
c0001b9f:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001ba2:	50                   	push   %eax
c0001ba3:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001ba6:	50                   	push   %eax
c0001ba7:	e8 3a a7 00 00       	call   c000c2e6 <Strcpy>
c0001bac:	83 c4 10             	add    $0x10,%esp
c0001baf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bb2:	83 c0 7a             	add    $0x7a,%eax
c0001bb5:	0f b7 00             	movzwl (%eax),%eax
c0001bb8:	0f b7 d0             	movzwl %ax,%edx
c0001bbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bbe:	83 c0 78             	add    $0x78,%eax
c0001bc1:	0f b7 00             	movzwl (%eax),%eax
c0001bc4:	0f b7 c0             	movzwl %ax,%eax
c0001bc7:	83 c0 10             	add    $0x10,%eax
c0001bca:	89 c1                	mov    %eax,%ecx
c0001bcc:	d3 e2                	shl    %cl,%edx
c0001bce:	89 d0                	mov    %edx,%eax
c0001bd0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001bd3:	90                   	nop
c0001bd4:	c9                   	leave  
c0001bd5:	c3                   	ret    

c0001bd6 <print_dpt_entry>:
c0001bd6:	55                   	push   %ebp
c0001bd7:	89 e5                	mov    %esp,%ebp
c0001bd9:	83 ec 08             	sub    $0x8,%esp
c0001bdc:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bdf:	8b 40 08             	mov    0x8(%eax),%eax
c0001be2:	83 ec 08             	sub    $0x8,%esp
c0001be5:	50                   	push   %eax
c0001be6:	68 22 b5 00 c0       	push   $0xc000b522
c0001beb:	e8 f1 7b 00 00       	call   c00097e1 <Printf>
c0001bf0:	83 c4 10             	add    $0x10,%esp
c0001bf3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bf6:	8b 40 0c             	mov    0xc(%eax),%eax
c0001bf9:	83 ec 08             	sub    $0x8,%esp
c0001bfc:	50                   	push   %eax
c0001bfd:	68 2a b5 00 c0       	push   $0xc000b52a
c0001c02:	e8 da 7b 00 00       	call   c00097e1 <Printf>
c0001c07:	83 c4 10             	add    $0x10,%esp
c0001c0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c0d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001c11:	0f b6 c0             	movzbl %al,%eax
c0001c14:	83 ec 08             	sub    $0x8,%esp
c0001c17:	50                   	push   %eax
c0001c18:	68 3b b5 00 c0       	push   $0xc000b53b
c0001c1d:	e8 bf 7b 00 00       	call   c00097e1 <Printf>
c0001c22:	83 c4 10             	add    $0x10,%esp
c0001c25:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c28:	0f b6 00             	movzbl (%eax),%eax
c0001c2b:	0f b6 c0             	movzbl %al,%eax
c0001c2e:	83 ec 08             	sub    $0x8,%esp
c0001c31:	50                   	push   %eax
c0001c32:	68 49 b5 00 c0       	push   $0xc000b549
c0001c37:	e8 a5 7b 00 00       	call   c00097e1 <Printf>
c0001c3c:	83 c4 10             	add    $0x10,%esp
c0001c3f:	90                   	nop
c0001c40:	c9                   	leave  
c0001c41:	c3                   	ret    

c0001c42 <get_partition_table>:
c0001c42:	55                   	push   %ebp
c0001c43:	89 e5                	mov    %esp,%ebp
c0001c45:	53                   	push   %ebx
c0001c46:	83 ec 24             	sub    $0x24,%esp
c0001c49:	89 e0                	mov    %esp,%eax
c0001c4b:	89 c3                	mov    %eax,%ebx
c0001c4d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001c51:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001c55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001c58:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001c5b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001c5e:	c1 f8 08             	sar    $0x8,%eax
c0001c61:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001c64:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001c67:	c1 f8 10             	sar    $0x10,%eax
c0001c6a:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001c70:	c1 f8 18             	sar    $0x18,%eax
c0001c73:	89 c2                	mov    %eax,%edx
c0001c75:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c78:	c1 e0 04             	shl    $0x4,%eax
c0001c7b:	09 d0                	or     %edx,%eax
c0001c7d:	83 c8 e0             	or     $0xffffffe0,%eax
c0001c80:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001c83:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0001c87:	83 ec 0c             	sub    $0xc,%esp
c0001c8a:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0001c8d:	50                   	push   %eax
c0001c8e:	e8 fc fb ff ff       	call   c000188f <hd_cmd_out>
c0001c93:	83 c4 10             	add    $0x10,%esp
c0001c96:	e8 29 04 00 00       	call   c00020c4 <interrupt_wait>
c0001c9b:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001ca2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ca5:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001ca8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001cab:	89 c2                	mov    %eax,%edx
c0001cad:	b8 10 00 00 00       	mov    $0x10,%eax
c0001cb2:	83 e8 01             	sub    $0x1,%eax
c0001cb5:	01 d0                	add    %edx,%eax
c0001cb7:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001cbc:	ba 00 00 00 00       	mov    $0x0,%edx
c0001cc1:	f7 f1                	div    %ecx
c0001cc3:	6b c0 10             	imul   $0x10,%eax,%eax
c0001cc6:	29 c4                	sub    %eax,%esp
c0001cc8:	89 e0                	mov    %esp,%eax
c0001cca:	83 c0 00             	add    $0x0,%eax
c0001ccd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001cd0:	83 ec 04             	sub    $0x4,%esp
c0001cd3:	ff 75 f4             	pushl  -0xc(%ebp)
c0001cd6:	6a 00                	push   $0x0
c0001cd8:	ff 75 ec             	pushl  -0x14(%ebp)
c0001cdb:	e8 e7 a5 00 00       	call   c000c2c7 <Memset>
c0001ce0:	83 c4 10             	add    $0x10,%esp
c0001ce3:	83 ec 04             	sub    $0x4,%esp
c0001ce6:	ff 75 f4             	pushl  -0xc(%ebp)
c0001ce9:	ff 75 ec             	pushl  -0x14(%ebp)
c0001cec:	68 f0 01 00 00       	push   $0x1f0
c0001cf1:	e8 25 a6 00 00       	call   c000c31b <read_port>
c0001cf6:	83 c4 10             	add    $0x10,%esp
c0001cf9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001cfc:	05 be 01 00 00       	add    $0x1be,%eax
c0001d01:	83 ec 04             	sub    $0x4,%esp
c0001d04:	6a 40                	push   $0x40
c0001d06:	50                   	push   %eax
c0001d07:	ff 75 10             	pushl  0x10(%ebp)
c0001d0a:	e8 78 5e 00 00       	call   c0007b87 <Memcpy>
c0001d0f:	83 c4 10             	add    $0x10,%esp
c0001d12:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0001d19:	89 dc                	mov    %ebx,%esp
c0001d1b:	90                   	nop
c0001d1c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001d1f:	c9                   	leave  
c0001d20:	c3                   	ret    

c0001d21 <partition>:
c0001d21:	55                   	push   %ebp
c0001d22:	89 e5                	mov    %esp,%ebp
c0001d24:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001d2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001d2d:	88 45 84             	mov    %al,-0x7c(%ebp)
c0001d30:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0001d34:	7f 19                	jg     c0001d4f <partition+0x2e>
c0001d36:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001d39:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001d3e:	89 c8                	mov    %ecx,%eax
c0001d40:	f7 ea                	imul   %edx
c0001d42:	d1 fa                	sar    %edx
c0001d44:	89 c8                	mov    %ecx,%eax
c0001d46:	c1 f8 1f             	sar    $0x1f,%eax
c0001d49:	29 c2                	sub    %eax,%edx
c0001d4b:	89 d0                	mov    %edx,%eax
c0001d4d:	eb 11                	jmp    c0001d60 <partition+0x3f>
c0001d4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d52:	83 e8 10             	sub    $0x10,%eax
c0001d55:	8d 50 3f             	lea    0x3f(%eax),%edx
c0001d58:	85 c0                	test   %eax,%eax
c0001d5a:	0f 48 c2             	cmovs  %edx,%eax
c0001d5d:	c1 f8 06             	sar    $0x6,%eax
c0001d60:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001d63:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0001d67:	0f 85 cc 00 00 00    	jne    c0001e39 <partition+0x118>
c0001d6d:	83 ec 04             	sub    $0x4,%esp
c0001d70:	6a 40                	push   $0x40
c0001d72:	6a 00                	push   $0x0
c0001d74:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001d77:	50                   	push   %eax
c0001d78:	e8 4a a5 00 00       	call   c000c2c7 <Memset>
c0001d7d:	83 c4 10             	add    $0x10,%esp
c0001d80:	83 ec 04             	sub    $0x4,%esp
c0001d83:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001d86:	50                   	push   %eax
c0001d87:	6a 00                	push   $0x0
c0001d89:	ff 75 e8             	pushl  -0x18(%ebp)
c0001d8c:	e8 b1 fe ff ff       	call   c0001c42 <get_partition_table>
c0001d91:	83 c4 10             	add    $0x10,%esp
c0001d94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001d9b:	e9 8a 00 00 00       	jmp    c0001e2a <partition+0x109>
c0001da0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001da3:	83 c0 01             	add    $0x1,%eax
c0001da6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001da9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001dac:	c1 e0 04             	shl    $0x4,%eax
c0001daf:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001db2:	01 c8                	add    %ecx,%eax
c0001db4:	83 e8 5c             	sub    $0x5c,%eax
c0001db7:	8b 00                	mov    (%eax),%eax
c0001db9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001dbc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001dbf:	c1 e1 03             	shl    $0x3,%ecx
c0001dc2:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001dc8:	01 ca                	add    %ecx,%edx
c0001dca:	81 c2 64 1f 01 c0    	add    $0xc0011f64,%edx
c0001dd0:	89 02                	mov    %eax,(%edx)
c0001dd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001dd5:	c1 e0 04             	shl    $0x4,%eax
c0001dd8:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001ddb:	01 c8                	add    %ecx,%eax
c0001ddd:	83 e8 58             	sub    $0x58,%eax
c0001de0:	8b 00                	mov    (%eax),%eax
c0001de2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001de5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001de8:	c1 e1 03             	shl    $0x3,%ecx
c0001deb:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001df1:	01 ca                	add    %ecx,%edx
c0001df3:	81 c2 68 1f 01 c0    	add    $0xc0011f68,%edx
c0001df9:	89 02                	mov    %eax,(%edx)
c0001dfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001dfe:	c1 e0 04             	shl    $0x4,%eax
c0001e01:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001e04:	01 c8                	add    %ecx,%eax
c0001e06:	83 e8 60             	sub    $0x60,%eax
c0001e09:	0f b6 00             	movzbl (%eax),%eax
c0001e0c:	3c 05                	cmp    $0x5,%al
c0001e0e:	75 16                	jne    c0001e26 <partition+0x105>
c0001e10:	8b 55 08             	mov    0x8(%ebp),%edx
c0001e13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0001e16:	01 d0                	add    %edx,%eax
c0001e18:	83 ec 08             	sub    $0x8,%esp
c0001e1b:	6a 01                	push   $0x1
c0001e1d:	50                   	push   %eax
c0001e1e:	e8 fe fe ff ff       	call   c0001d21 <partition>
c0001e23:	83 c4 10             	add    $0x10,%esp
c0001e26:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001e2a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0001e2e:	0f 8e 6c ff ff ff    	jle    c0001da0 <partition+0x7f>
c0001e34:	e9 ff 00 00 00       	jmp    c0001f38 <partition+0x217>
c0001e39:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0001e3d:	0f 85 f5 00 00 00    	jne    c0001f38 <partition+0x217>
c0001e43:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001e46:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001e4b:	89 c8                	mov    %ecx,%eax
c0001e4d:	f7 ea                	imul   %edx
c0001e4f:	d1 fa                	sar    %edx
c0001e51:	89 c8                	mov    %ecx,%eax
c0001e53:	c1 f8 1f             	sar    $0x1f,%eax
c0001e56:	29 c2                	sub    %eax,%edx
c0001e58:	89 d0                	mov    %edx,%eax
c0001e5a:	c1 e0 02             	shl    $0x2,%eax
c0001e5d:	01 d0                	add    %edx,%eax
c0001e5f:	29 c1                	sub    %eax,%ecx
c0001e61:	89 c8                	mov    %ecx,%eax
c0001e63:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0001e66:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0001e69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001e6c:	c1 e2 03             	shl    $0x3,%edx
c0001e6f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001e75:	01 d0                	add    %edx,%eax
c0001e77:	05 64 1f 01 c0       	add    $0xc0011f64,%eax
c0001e7c:	8b 00                	mov    (%eax),%eax
c0001e7e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0001e81:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0001e84:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001e87:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0001e8a:	83 e8 01             	sub    $0x1,%eax
c0001e8d:	c1 e0 04             	shl    $0x4,%eax
c0001e90:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0001e93:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0001e9a:	e9 8c 00 00 00       	jmp    c0001f2b <partition+0x20a>
c0001e9f:	83 ec 04             	sub    $0x4,%esp
c0001ea2:	6a 40                	push   $0x40
c0001ea4:	6a 00                	push   $0x0
c0001ea6:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001ea9:	50                   	push   %eax
c0001eaa:	e8 18 a4 00 00       	call   c000c2c7 <Memset>
c0001eaf:	83 c4 10             	add    $0x10,%esp
c0001eb2:	83 ec 04             	sub    $0x4,%esp
c0001eb5:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001eb8:	50                   	push   %eax
c0001eb9:	ff 75 f0             	pushl  -0x10(%ebp)
c0001ebc:	ff 75 e8             	pushl  -0x18(%ebp)
c0001ebf:	e8 7e fd ff ff       	call   c0001c42 <get_partition_table>
c0001ec4:	83 c4 10             	add    $0x10,%esp
c0001ec7:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0001eca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001ecd:	01 d0                	add    %edx,%eax
c0001ecf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0001ed2:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0001ed5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001ed8:	01 c2                	add    %eax,%edx
c0001eda:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0001edd:	8d 48 04             	lea    0x4(%eax),%ecx
c0001ee0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001ee3:	c1 e1 03             	shl    $0x3,%ecx
c0001ee6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001eec:	01 c8                	add    %ecx,%eax
c0001eee:	05 64 1f 01 c0       	add    $0xc0011f64,%eax
c0001ef3:	89 10                	mov    %edx,(%eax)
c0001ef5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0001ef8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0001efb:	8d 4a 04             	lea    0x4(%edx),%ecx
c0001efe:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001f01:	c1 e1 03             	shl    $0x3,%ecx
c0001f04:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001f0a:	01 ca                	add    %ecx,%edx
c0001f0c:	81 c2 68 1f 01 c0    	add    $0xc0011f68,%edx
c0001f12:	89 02                	mov    %eax,(%edx)
c0001f14:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0001f18:	84 c0                	test   %al,%al
c0001f1a:	74 1b                	je     c0001f37 <partition+0x216>
c0001f1c:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0001f1f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0001f22:	01 d0                	add    %edx,%eax
c0001f24:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001f27:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0001f2b:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0001f2f:	0f 8e 6a ff ff ff    	jle    c0001e9f <partition+0x17e>
c0001f35:	eb 01                	jmp    c0001f38 <partition+0x217>
c0001f37:	90                   	nop
c0001f38:	90                   	nop
c0001f39:	c9                   	leave  
c0001f3a:	c3                   	ret    

c0001f3b <hd_open>:
c0001f3b:	55                   	push   %ebp
c0001f3c:	89 e5                	mov    %esp,%ebp
c0001f3e:	83 ec 18             	sub    $0x18,%esp
c0001f41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001f48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001f4b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001f51:	05 60 1f 01 c0       	add    $0xc0011f60,%eax
c0001f56:	8b 00                	mov    (%eax),%eax
c0001f58:	8d 50 01             	lea    0x1(%eax),%edx
c0001f5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001f5e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001f64:	05 60 1f 01 c0       	add    $0xc0011f60,%eax
c0001f69:	89 10                	mov    %edx,(%eax)
c0001f6b:	83 ec 0c             	sub    $0xc,%esp
c0001f6e:	6a 00                	push   $0x0
c0001f70:	e8 1c fa ff ff       	call   c0001991 <hd_identify>
c0001f75:	83 c4 10             	add    $0x10,%esp
c0001f78:	83 ec 08             	sub    $0x8,%esp
c0001f7b:	6a 00                	push   $0x0
c0001f7d:	6a 00                	push   $0x0
c0001f7f:	e8 9d fd ff ff       	call   c0001d21 <partition>
c0001f84:	83 c4 10             	add    $0x10,%esp
c0001f87:	83 ec 0c             	sub    $0xc,%esp
c0001f8a:	6a 7c                	push   $0x7c
c0001f8c:	e8 33 06 00 00       	call   c00025c4 <sys_malloc>
c0001f91:	83 c4 10             	add    $0x10,%esp
c0001f94:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001f97:	83 ec 04             	sub    $0x4,%esp
c0001f9a:	6a 7c                	push   $0x7c
c0001f9c:	6a 00                	push   $0x0
c0001f9e:	ff 75 f0             	pushl  -0x10(%ebp)
c0001fa1:	e8 21 a3 00 00       	call   c000c2c7 <Memset>
c0001fa6:	83 c4 10             	add    $0x10,%esp
c0001fa9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001fac:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0001fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001fb6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001fbd:	83 ec 04             	sub    $0x4,%esp
c0001fc0:	6a 02                	push   $0x2
c0001fc2:	ff 75 f0             	pushl  -0x10(%ebp)
c0001fc5:	6a 01                	push   $0x1
c0001fc7:	e8 af 84 00 00       	call   c000a47b <send_rec>
c0001fcc:	83 c4 10             	add    $0x10,%esp
c0001fcf:	83 ec 08             	sub    $0x8,%esp
c0001fd2:	6a 7c                	push   $0x7c
c0001fd4:	ff 75 f0             	pushl  -0x10(%ebp)
c0001fd7:	e8 fd 05 00 00       	call   c00025d9 <sys_free>
c0001fdc:	83 c4 10             	add    $0x10,%esp
c0001fdf:	90                   	nop
c0001fe0:	c9                   	leave  
c0001fe1:	c3                   	ret    

c0001fe2 <get_hd_ioctl>:
c0001fe2:	55                   	push   %ebp
c0001fe3:	89 e5                	mov    %esp,%ebp
c0001fe5:	83 ec 18             	sub    $0x18,%esp
c0001fe8:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0001fec:	7f 19                	jg     c0002007 <get_hd_ioctl+0x25>
c0001fee:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001ff1:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001ff6:	89 c8                	mov    %ecx,%eax
c0001ff8:	f7 ea                	imul   %edx
c0001ffa:	d1 fa                	sar    %edx
c0001ffc:	89 c8                	mov    %ecx,%eax
c0001ffe:	c1 f8 1f             	sar    $0x1f,%eax
c0002001:	29 c2                	sub    %eax,%edx
c0002003:	89 d0                	mov    %edx,%eax
c0002005:	eb 11                	jmp    c0002018 <get_hd_ioctl+0x36>
c0002007:	8b 45 08             	mov    0x8(%ebp),%eax
c000200a:	83 e8 10             	sub    $0x10,%eax
c000200d:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002010:	85 c0                	test   %eax,%eax
c0002012:	0f 48 c2             	cmovs  %edx,%eax
c0002015:	c1 f8 06             	sar    $0x6,%eax
c0002018:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000201b:	8b 55 08             	mov    0x8(%ebp),%edx
c000201e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002021:	c1 e2 03             	shl    $0x3,%edx
c0002024:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000202a:	01 d0                	add    %edx,%eax
c000202c:	05 68 1f 01 c0       	add    $0xc0011f68,%eax
c0002031:	8b 00                	mov    (%eax),%eax
c0002033:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002036:	83 ec 0c             	sub    $0xc,%esp
c0002039:	6a 7c                	push   $0x7c
c000203b:	e8 84 05 00 00       	call   c00025c4 <sys_malloc>
c0002040:	83 c4 10             	add    $0x10,%esp
c0002043:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002046:	83 ec 04             	sub    $0x4,%esp
c0002049:	6a 7c                	push   $0x7c
c000204b:	6a 00                	push   $0x0
c000204d:	ff 75 ec             	pushl  -0x14(%ebp)
c0002050:	e8 72 a2 00 00       	call   c000c2c7 <Memset>
c0002055:	83 c4 10             	add    $0x10,%esp
c0002058:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000205b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002062:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002065:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000206c:	83 ec 04             	sub    $0x4,%esp
c000206f:	6a 02                	push   $0x2
c0002071:	ff 75 ec             	pushl  -0x14(%ebp)
c0002074:	6a 01                	push   $0x1
c0002076:	e8 00 84 00 00       	call   c000a47b <send_rec>
c000207b:	83 c4 10             	add    $0x10,%esp
c000207e:	83 ec 08             	sub    $0x8,%esp
c0002081:	6a 7c                	push   $0x7c
c0002083:	ff 75 ec             	pushl  -0x14(%ebp)
c0002086:	e8 4e 05 00 00       	call   c00025d9 <sys_free>
c000208b:	83 c4 10             	add    $0x10,%esp
c000208e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002091:	c9                   	leave  
c0002092:	c3                   	ret    

c0002093 <wait_for>:
c0002093:	55                   	push   %ebp
c0002094:	89 e5                	mov    %esp,%ebp
c0002096:	83 ec 08             	sub    $0x8,%esp
c0002099:	83 ec 04             	sub    $0x4,%esp
c000209c:	68 50 c3 00 00       	push   $0xc350
c00020a1:	6a 08                	push   $0x8
c00020a3:	6a 08                	push   $0x8
c00020a5:	e8 35 03 00 00       	call   c00023df <waitfor>
c00020aa:	83 c4 10             	add    $0x10,%esp
c00020ad:	85 c0                	test   %eax,%eax
c00020af:	75 10                	jne    c00020c1 <wait_for+0x2e>
c00020b1:	83 ec 0c             	sub    $0xc,%esp
c00020b4:	68 54 b5 00 c0       	push   $0xc000b554
c00020b9:	e8 62 7a 00 00       	call   c0009b20 <panic>
c00020be:	83 c4 10             	add    $0x10,%esp
c00020c1:	90                   	nop
c00020c2:	c9                   	leave  
c00020c3:	c3                   	ret    

c00020c4 <interrupt_wait>:
c00020c4:	55                   	push   %ebp
c00020c5:	89 e5                	mov    %esp,%ebp
c00020c7:	83 ec 18             	sub    $0x18,%esp
c00020ca:	83 ec 0c             	sub    $0xc,%esp
c00020cd:	6a 7c                	push   $0x7c
c00020cf:	e8 f0 04 00 00       	call   c00025c4 <sys_malloc>
c00020d4:	83 c4 10             	add    $0x10,%esp
c00020d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00020da:	83 ec 04             	sub    $0x4,%esp
c00020dd:	6a 7c                	push   $0x7c
c00020df:	6a 00                	push   $0x0
c00020e1:	ff 75 f4             	pushl  -0xc(%ebp)
c00020e4:	e8 de a1 00 00       	call   c000c2c7 <Memset>
c00020e9:	83 c4 10             	add    $0x10,%esp
c00020ec:	83 ec 04             	sub    $0x4,%esp
c00020ef:	68 13 02 00 00       	push   $0x213
c00020f4:	ff 75 f4             	pushl  -0xc(%ebp)
c00020f7:	6a 02                	push   $0x2
c00020f9:	e8 7d 83 00 00       	call   c000a47b <send_rec>
c00020fe:	83 c4 10             	add    $0x10,%esp
c0002101:	83 ec 08             	sub    $0x8,%esp
c0002104:	6a 7c                	push   $0x7c
c0002106:	ff 75 f4             	pushl  -0xc(%ebp)
c0002109:	e8 cb 04 00 00       	call   c00025d9 <sys_free>
c000210e:	83 c4 10             	add    $0x10,%esp
c0002111:	90                   	nop
c0002112:	c9                   	leave  
c0002113:	c3                   	ret    

c0002114 <hd_rdwt>:
c0002114:	55                   	push   %ebp
c0002115:	89 e5                	mov    %esp,%ebp
c0002117:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c000211d:	8b 45 08             	mov    0x8(%ebp),%eax
c0002120:	8b 40 18             	mov    0x18(%eax),%eax
c0002123:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002126:	8b 45 08             	mov    0x8(%ebp),%eax
c0002129:	8b 40 14             	mov    0x14(%eax),%eax
c000212c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000212f:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002133:	7f 19                	jg     c000214e <hd_rdwt+0x3a>
c0002135:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002138:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000213d:	89 c8                	mov    %ecx,%eax
c000213f:	f7 ea                	imul   %edx
c0002141:	d1 fa                	sar    %edx
c0002143:	89 c8                	mov    %ecx,%eax
c0002145:	c1 f8 1f             	sar    $0x1f,%eax
c0002148:	29 c2                	sub    %eax,%edx
c000214a:	89 d0                	mov    %edx,%eax
c000214c:	eb 11                	jmp    c000215f <hd_rdwt+0x4b>
c000214e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002151:	83 e8 10             	sub    $0x10,%eax
c0002154:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002157:	85 c0                	test   %eax,%eax
c0002159:	0f 48 c2             	cmovs  %edx,%eax
c000215c:	c1 f8 06             	sar    $0x6,%eax
c000215f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002162:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002165:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002168:	89 d0                	mov    %edx,%eax
c000216a:	c1 f8 1f             	sar    $0x1f,%eax
c000216d:	c1 e8 1a             	shr    $0x1a,%eax
c0002170:	01 c2                	add    %eax,%edx
c0002172:	83 e2 3f             	and    $0x3f,%edx
c0002175:	29 c2                	sub    %eax,%edx
c0002177:	89 d0                	mov    %edx,%eax
c0002179:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000217c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000217f:	c1 e8 09             	shr    $0x9,%eax
c0002182:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002185:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002189:	7f 1a                	jg     c00021a5 <hd_rdwt+0x91>
c000218b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000218e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002191:	c1 e2 03             	shl    $0x3,%edx
c0002194:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000219a:	01 d0                	add    %edx,%eax
c000219c:	05 64 1f 01 c0       	add    $0xc0011f64,%eax
c00021a1:	8b 00                	mov    (%eax),%eax
c00021a3:	eb 1b                	jmp    c00021c0 <hd_rdwt+0xac>
c00021a5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00021a8:	8d 50 04             	lea    0x4(%eax),%edx
c00021ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00021ae:	c1 e2 03             	shl    $0x3,%edx
c00021b1:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00021b7:	01 d0                	add    %edx,%eax
c00021b9:	05 64 1f 01 c0       	add    $0xc0011f64,%eax
c00021be:	8b 00                	mov    (%eax),%eax
c00021c0:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00021c3:	01 d0                	add    %edx,%eax
c00021c5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00021c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00021cb:	8b 40 0c             	mov    0xc(%eax),%eax
c00021ce:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00021d1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00021d4:	05 ff 01 00 00       	add    $0x1ff,%eax
c00021d9:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00021df:	85 c0                	test   %eax,%eax
c00021e1:	0f 48 c2             	cmovs  %edx,%eax
c00021e4:	c1 f8 09             	sar    $0x9,%eax
c00021e7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00021ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00021ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00021f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00021f3:	8b 40 10             	mov    0x10(%eax),%eax
c00021f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00021f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00021fc:	8b 00                	mov    (%eax),%eax
c00021fe:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002201:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0002204:	83 ec 08             	sub    $0x8,%esp
c0002207:	50                   	push   %eax
c0002208:	ff 75 d0             	pushl  -0x30(%ebp)
c000220b:	e8 3b 4c 00 00       	call   c0006e4b <alloc_virtual_memory>
c0002210:	83 c4 10             	add    $0x10,%esp
c0002213:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002216:	8b 45 08             	mov    0x8(%ebp),%eax
c0002219:	8b 40 78             	mov    0x78(%eax),%eax
c000221c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000221f:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002223:	74 22                	je     c0002247 <hd_rdwt+0x133>
c0002225:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002229:	74 1c                	je     c0002247 <hd_rdwt+0x133>
c000222b:	68 b7 01 00 00       	push   $0x1b7
c0002230:	68 a4 b4 00 c0       	push   $0xc000b4a4
c0002235:	68 a4 b4 00 c0       	push   $0xc000b4a4
c000223a:	68 66 b5 00 c0       	push   $0xc000b566
c000223f:	e8 fa 78 00 00       	call   c0009b3e <assertion_failure>
c0002244:	83 c4 10             	add    $0x10,%esp
c0002247:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c000224b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000224e:	88 45 be             	mov    %al,-0x42(%ebp)
c0002251:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002254:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002257:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000225a:	c1 f8 08             	sar    $0x8,%eax
c000225d:	88 45 c0             	mov    %al,-0x40(%ebp)
c0002260:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002263:	c1 f8 10             	sar    $0x10,%eax
c0002266:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002269:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000226c:	c1 f8 18             	sar    $0x18,%eax
c000226f:	83 e0 0f             	and    $0xf,%eax
c0002272:	83 c8 e0             	or     $0xffffffe0,%eax
c0002275:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002278:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000227c:	75 07                	jne    c0002285 <hd_rdwt+0x171>
c000227e:	b8 20 00 00 00       	mov    $0x20,%eax
c0002283:	eb 05                	jmp    c000228a <hd_rdwt+0x176>
c0002285:	b8 30 00 00 00       	mov    $0x30,%eax
c000228a:	88 45 c3             	mov    %al,-0x3d(%ebp)
c000228d:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002291:	3c 20                	cmp    $0x20,%al
c0002293:	74 24                	je     c00022b9 <hd_rdwt+0x1a5>
c0002295:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002299:	3c 30                	cmp    $0x30,%al
c000229b:	74 1c                	je     c00022b9 <hd_rdwt+0x1a5>
c000229d:	68 c5 01 00 00       	push   $0x1c5
c00022a2:	68 a4 b4 00 c0       	push   $0xc000b4a4
c00022a7:	68 a4 b4 00 c0       	push   $0xc000b4a4
c00022ac:	68 84 b5 00 c0       	push   $0xc000b584
c00022b1:	e8 88 78 00 00       	call   c0009b3e <assertion_failure>
c00022b6:	83 c4 10             	add    $0x10,%esp
c00022b9:	83 ec 0c             	sub    $0xc,%esp
c00022bc:	8d 45 bd             	lea    -0x43(%ebp),%eax
c00022bf:	50                   	push   %eax
c00022c0:	e8 ca f5 ff ff       	call   c000188f <hd_cmd_out>
c00022c5:	83 c4 10             	add    $0x10,%esp
c00022c8:	e9 9c 00 00 00       	jmp    c0002369 <hd_rdwt+0x255>
c00022cd:	b8 00 02 00 00       	mov    $0x200,%eax
c00022d2:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00022d9:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00022dd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00022e0:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00022e4:	75 51                	jne    c0002337 <hd_rdwt+0x223>
c00022e6:	e8 a8 fd ff ff       	call   c0002093 <wait_for>
c00022eb:	e8 d4 fd ff ff       	call   c00020c4 <interrupt_wait>
c00022f0:	83 ec 04             	sub    $0x4,%esp
c00022f3:	ff 75 c4             	pushl  -0x3c(%ebp)
c00022f6:	6a 00                	push   $0x0
c00022f8:	68 a0 21 01 c0       	push   $0xc00121a0
c00022fd:	e8 c5 9f 00 00       	call   c000c2c7 <Memset>
c0002302:	83 c4 10             	add    $0x10,%esp
c0002305:	83 ec 04             	sub    $0x4,%esp
c0002308:	68 00 02 00 00       	push   $0x200
c000230d:	68 a0 21 01 c0       	push   $0xc00121a0
c0002312:	68 f0 01 00 00       	push   $0x1f0
c0002317:	e8 ff 9f 00 00       	call   c000c31b <read_port>
c000231c:	83 c4 10             	add    $0x10,%esp
c000231f:	83 ec 04             	sub    $0x4,%esp
c0002322:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002325:	68 a0 21 01 c0       	push   $0xc00121a0
c000232a:	ff 75 f0             	pushl  -0x10(%ebp)
c000232d:	e8 55 58 00 00       	call   c0007b87 <Memcpy>
c0002332:	83 c4 10             	add    $0x10,%esp
c0002335:	eb 26                	jmp    c000235d <hd_rdwt+0x249>
c0002337:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000233b:	75 20                	jne    c000235d <hd_rdwt+0x249>
c000233d:	e8 51 fd ff ff       	call   c0002093 <wait_for>
c0002342:	83 ec 04             	sub    $0x4,%esp
c0002345:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002348:	ff 75 f0             	pushl  -0x10(%ebp)
c000234b:	68 f0 01 00 00       	push   $0x1f0
c0002350:	e8 da 9f 00 00       	call   c000c32f <write_port>
c0002355:	83 c4 10             	add    $0x10,%esp
c0002358:	e8 67 fd ff ff       	call   c00020c4 <interrupt_wait>
c000235d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002360:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002363:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002366:	01 45 f0             	add    %eax,-0x10(%ebp)
c0002369:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000236d:	0f 85 5a ff ff ff    	jne    c00022cd <hd_rdwt+0x1b9>
c0002373:	83 ec 04             	sub    $0x4,%esp
c0002376:	6a 7c                	push   $0x7c
c0002378:	6a 00                	push   $0x0
c000237a:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0002380:	50                   	push   %eax
c0002381:	e8 41 9f 00 00       	call   c000c2c7 <Memset>
c0002386:	83 c4 10             	add    $0x10,%esp
c0002389:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0002390:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0002397:	00 00 00 
c000239a:	83 ec 04             	sub    $0x4,%esp
c000239d:	6a 02                	push   $0x2
c000239f:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c00023a5:	50                   	push   %eax
c00023a6:	6a 01                	push   $0x1
c00023a8:	e8 ce 80 00 00       	call   c000a47b <send_rec>
c00023ad:	83 c4 10             	add    $0x10,%esp
c00023b0:	90                   	nop
c00023b1:	c9                   	leave  
c00023b2:	c3                   	ret    

c00023b3 <hd_handler>:
c00023b3:	55                   	push   %ebp
c00023b4:	89 e5                	mov    %esp,%ebp
c00023b6:	83 ec 18             	sub    $0x18,%esp
c00023b9:	83 ec 0c             	sub    $0xc,%esp
c00023bc:	68 f7 01 00 00       	push   $0x1f7
c00023c1:	e8 c7 ef ff ff       	call   c000138d <in_byte>
c00023c6:	83 c4 10             	add    $0x10,%esp
c00023c9:	0f b6 c0             	movzbl %al,%eax
c00023cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00023cf:	83 ec 0c             	sub    $0xc,%esp
c00023d2:	6a 03                	push   $0x3
c00023d4:	e8 3d 83 00 00       	call   c000a716 <inform_int>
c00023d9:	83 c4 10             	add    $0x10,%esp
c00023dc:	90                   	nop
c00023dd:	c9                   	leave  
c00023de:	c3                   	ret    

c00023df <waitfor>:
c00023df:	55                   	push   %ebp
c00023e0:	89 e5                	mov    %esp,%ebp
c00023e2:	83 ec 18             	sub    $0x18,%esp
c00023e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00023ec:	eb 26                	jmp    c0002414 <waitfor+0x35>
c00023ee:	83 ec 0c             	sub    $0xc,%esp
c00023f1:	68 f7 01 00 00       	push   $0x1f7
c00023f6:	e8 92 ef ff ff       	call   c000138d <in_byte>
c00023fb:	83 c4 10             	add    $0x10,%esp
c00023fe:	0f b6 c0             	movzbl %al,%eax
c0002401:	23 45 08             	and    0x8(%ebp),%eax
c0002404:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0002407:	75 07                	jne    c0002410 <waitfor+0x31>
c0002409:	b8 01 00 00 00       	mov    $0x1,%eax
c000240e:	eb 11                	jmp    c0002421 <waitfor+0x42>
c0002410:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002414:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002417:	3b 45 10             	cmp    0x10(%ebp),%eax
c000241a:	7c d2                	jl     c00023ee <waitfor+0xf>
c000241c:	b8 00 00 00 00       	mov    $0x0,%eax
c0002421:	c9                   	leave  
c0002422:	c3                   	ret    

c0002423 <print_hd_info>:
c0002423:	55                   	push   %ebp
c0002424:	89 e5                	mov    %esp,%ebp
c0002426:	83 ec 18             	sub    $0x18,%esp
c0002429:	83 ec 0c             	sub    $0xc,%esp
c000242c:	68 b8 b5 00 c0       	push   $0xc000b5b8
c0002431:	e8 ab 73 00 00       	call   c00097e1 <Printf>
c0002436:	83 c4 10             	add    $0x10,%esp
c0002439:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002440:	eb 3b                	jmp    c000247d <print_hd_info+0x5a>
c0002442:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002445:	8b 04 c5 68 1f 01 c0 	mov    -0x3ffee098(,%eax,8),%eax
c000244c:	85 c0                	test   %eax,%eax
c000244e:	74 28                	je     c0002478 <print_hd_info+0x55>
c0002450:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002453:	8b 14 c5 68 1f 01 c0 	mov    -0x3ffee098(,%eax,8),%edx
c000245a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000245d:	8b 04 c5 64 1f 01 c0 	mov    -0x3ffee09c(,%eax,8),%eax
c0002464:	ff 75 f4             	pushl  -0xc(%ebp)
c0002467:	52                   	push   %edx
c0002468:	50                   	push   %eax
c0002469:	68 d5 b5 00 c0       	push   $0xc000b5d5
c000246e:	e8 6e 73 00 00       	call   c00097e1 <Printf>
c0002473:	83 c4 10             	add    $0x10,%esp
c0002476:	eb 01                	jmp    c0002479 <print_hd_info+0x56>
c0002478:	90                   	nop
c0002479:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000247d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002481:	7e bf                	jle    c0002442 <print_hd_info+0x1f>
c0002483:	83 ec 0c             	sub    $0xc,%esp
c0002486:	68 ed b5 00 c0       	push   $0xc000b5ed
c000248b:	e8 51 73 00 00       	call   c00097e1 <Printf>
c0002490:	83 c4 10             	add    $0x10,%esp
c0002493:	83 ec 0c             	sub    $0xc,%esp
c0002496:	68 08 b6 00 c0       	push   $0xc000b608
c000249b:	e8 41 73 00 00       	call   c00097e1 <Printf>
c00024a0:	83 c4 10             	add    $0x10,%esp
c00024a3:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c00024aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00024b1:	eb 44                	jmp    c00024f7 <print_hd_info+0xd4>
c00024b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00024b6:	83 c0 04             	add    $0x4,%eax
c00024b9:	8b 04 c5 68 1f 01 c0 	mov    -0x3ffee098(,%eax,8),%eax
c00024c0:	85 c0                	test   %eax,%eax
c00024c2:	74 2e                	je     c00024f2 <print_hd_info+0xcf>
c00024c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00024c7:	83 c0 04             	add    $0x4,%eax
c00024ca:	8b 14 c5 68 1f 01 c0 	mov    -0x3ffee098(,%eax,8),%edx
c00024d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00024d4:	83 c0 04             	add    $0x4,%eax
c00024d7:	8b 04 c5 64 1f 01 c0 	mov    -0x3ffee09c(,%eax,8),%eax
c00024de:	ff 75 f0             	pushl  -0x10(%ebp)
c00024e1:	52                   	push   %edx
c00024e2:	50                   	push   %eax
c00024e3:	68 d5 b5 00 c0       	push   $0xc000b5d5
c00024e8:	e8 f4 72 00 00       	call   c00097e1 <Printf>
c00024ed:	83 c4 10             	add    $0x10,%esp
c00024f0:	eb 01                	jmp    c00024f3 <print_hd_info+0xd0>
c00024f2:	90                   	nop
c00024f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00024f7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00024fb:	7e b6                	jle    c00024b3 <print_hd_info+0x90>
c00024fd:	83 ec 0c             	sub    $0xc,%esp
c0002500:	68 25 b6 00 c0       	push   $0xc000b625
c0002505:	e8 d7 72 00 00       	call   c00097e1 <Printf>
c000250a:	83 c4 10             	add    $0x10,%esp
c000250d:	90                   	nop
c000250e:	c9                   	leave  
c000250f:	c3                   	ret    

c0002510 <is_empty>:
c0002510:	55                   	push   %ebp
c0002511:	89 e5                	mov    %esp,%ebp
c0002513:	83 ec 10             	sub    $0x10,%esp
c0002516:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000251d:	eb 1a                	jmp    c0002539 <is_empty+0x29>
c000251f:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0002522:	8b 45 08             	mov    0x8(%ebp),%eax
c0002525:	01 d0                	add    %edx,%eax
c0002527:	0f b6 00             	movzbl (%eax),%eax
c000252a:	84 c0                	test   %al,%al
c000252c:	74 07                	je     c0002535 <is_empty+0x25>
c000252e:	b8 00 00 00 00       	mov    $0x0,%eax
c0002533:	eb 11                	jmp    c0002546 <is_empty+0x36>
c0002535:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0002539:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000253c:	3b 45 0c             	cmp    0xc(%ebp),%eax
c000253f:	7c de                	jl     c000251f <is_empty+0xf>
c0002541:	b8 01 00 00 00       	mov    $0x1,%eax
c0002546:	c9                   	leave  
c0002547:	c3                   	ret    
c0002548:	66 90                	xchg   %ax,%ax
c000254a:	66 90                	xchg   %ax,%ax
c000254c:	66 90                	xchg   %ax,%ax
c000254e:	66 90                	xchg   %ax,%ax

c0002550 <get_ticks>:
c0002550:	b8 00 00 00 00       	mov    $0x0,%eax
c0002555:	cd 90                	int    $0x90
c0002557:	c3                   	ret    

c0002558 <write2>:
c0002558:	b8 01 00 00 00       	mov    $0x1,%eax
c000255d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002561:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002565:	cd 90                	int    $0x90
c0002567:	c3                   	ret    

c0002568 <write_debug>:
c0002568:	b8 02 00 00 00       	mov    $0x2,%eax
c000256d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002571:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002575:	cd 90                	int    $0x90
c0002577:	c3                   	ret    

c0002578 <send_msg2>:
c0002578:	b8 03 00 00 00       	mov    $0x3,%eax
c000257d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002581:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002585:	cd 90                	int    $0x90
c0002587:	c3                   	ret    

c0002588 <send_msg>:
c0002588:	55                   	push   %ebp
c0002589:	89 e5                	mov    %esp,%ebp
c000258b:	53                   	push   %ebx
c000258c:	51                   	push   %ecx
c000258d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002592:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002595:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002598:	cd 90                	int    $0x90
c000259a:	59                   	pop    %ecx
c000259b:	5b                   	pop    %ebx
c000259c:	5d                   	pop    %ebp
c000259d:	c3                   	ret    

c000259e <receive_msg2>:
c000259e:	b8 04 00 00 00       	mov    $0x4,%eax
c00025a3:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00025a7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00025ab:	cd 90                	int    $0x90
c00025ad:	c3                   	ret    

c00025ae <receive_msg>:
c00025ae:	55                   	push   %ebp
c00025af:	89 e5                	mov    %esp,%ebp
c00025b1:	53                   	push   %ebx
c00025b2:	51                   	push   %ecx
c00025b3:	b8 04 00 00 00       	mov    $0x4,%eax
c00025b8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00025bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00025be:	cd 90                	int    $0x90
c00025c0:	59                   	pop    %ecx
c00025c1:	5b                   	pop    %ebx
c00025c2:	5d                   	pop    %ebp
c00025c3:	c3                   	ret    

c00025c4 <sys_malloc>:
c00025c4:	56                   	push   %esi
c00025c5:	57                   	push   %edi
c00025c6:	53                   	push   %ebx
c00025c7:	55                   	push   %ebp
c00025c8:	89 e5                	mov    %esp,%ebp
c00025ca:	b8 05 00 00 00       	mov    $0x5,%eax
c00025cf:	8b 4d 14             	mov    0x14(%ebp),%ecx
c00025d2:	cd 90                	int    $0x90
c00025d4:	5d                   	pop    %ebp
c00025d5:	5b                   	pop    %ebx
c00025d6:	5f                   	pop    %edi
c00025d7:	5e                   	pop    %esi
c00025d8:	c3                   	ret    

c00025d9 <sys_free>:
c00025d9:	56                   	push   %esi
c00025da:	57                   	push   %edi
c00025db:	53                   	push   %ebx
c00025dc:	55                   	push   %ebp
c00025dd:	89 e5                	mov    %esp,%ebp
c00025df:	b8 06 00 00 00       	mov    $0x6,%eax
c00025e4:	8b 4d 14             	mov    0x14(%ebp),%ecx
c00025e7:	8b 5d 18             	mov    0x18(%ebp),%ebx
c00025ea:	cd 90                	int    $0x90
c00025ec:	5d                   	pop    %ebp
c00025ed:	5b                   	pop    %ebx
c00025ee:	5f                   	pop    %edi
c00025ef:	5e                   	pop    %esi
c00025f0:	c3                   	ret    

c00025f1 <task_fs>:
c00025f1:	55                   	push   %ebp
c00025f2:	89 e5                	mov    %esp,%ebp
c00025f4:	83 ec 28             	sub    $0x28,%esp
c00025f7:	e8 bb 08 00 00       	call   c0002eb7 <init_fs>
c00025fc:	83 ec 0c             	sub    $0xc,%esp
c00025ff:	6a 7c                	push   $0x7c
c0002601:	e8 be ff ff ff       	call   c00025c4 <sys_malloc>
c0002606:	83 c4 10             	add    $0x10,%esp
c0002609:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000260c:	83 ec 0c             	sub    $0xc,%esp
c000260f:	6a 7c                	push   $0x7c
c0002611:	e8 ae ff ff ff       	call   c00025c4 <sys_malloc>
c0002616:	83 c4 10             	add    $0x10,%esp
c0002619:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000261c:	83 ec 04             	sub    $0x4,%esp
c000261f:	6a 7c                	push   $0x7c
c0002621:	6a 00                	push   $0x0
c0002623:	ff 75 f4             	pushl  -0xc(%ebp)
c0002626:	e8 9c 9c 00 00       	call   c000c2c7 <Memset>
c000262b:	83 c4 10             	add    $0x10,%esp
c000262e:	83 ec 04             	sub    $0x4,%esp
c0002631:	6a 12                	push   $0x12
c0002633:	ff 75 f4             	pushl  -0xc(%ebp)
c0002636:	6a 02                	push   $0x2
c0002638:	e8 3e 7e 00 00       	call   c000a47b <send_rec>
c000263d:	83 c4 10             	add    $0x10,%esp
c0002640:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002643:	8b 40 78             	mov    0x78(%eax),%eax
c0002646:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002649:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000264c:	8b 00                	mov    (%eax),%eax
c000264e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002651:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002654:	8b 40 50             	mov    0x50(%eax),%eax
c0002657:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000265a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000265d:	8b 40 68             	mov    0x68(%eax),%eax
c0002660:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002663:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002666:	8b 00                	mov    (%eax),%eax
c0002668:	85 c0                	test   %eax,%eax
c000266a:	75 07                	jne    c0002673 <task_fs+0x82>
c000266c:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0002673:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000267a:	83 ec 0c             	sub    $0xc,%esp
c000267d:	ff 75 e8             	pushl  -0x18(%ebp)
c0002680:	e8 37 21 00 00       	call   c00047bc <pid2proc>
c0002685:	83 c4 10             	add    $0x10,%esp
c0002688:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c000268d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002691:	74 37                	je     c00026ca <task_fs+0xd9>
c0002693:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002697:	74 31                	je     c00026ca <task_fs+0xd9>
c0002699:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c000269d:	74 2b                	je     c00026ca <task_fs+0xd9>
c000269f:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c00026a3:	74 25                	je     c00026ca <task_fs+0xd9>
c00026a5:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c00026a9:	74 1f                	je     c00026ca <task_fs+0xd9>
c00026ab:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c00026af:	74 19                	je     c00026ca <task_fs+0xd9>
c00026b1:	6a 7a                	push   $0x7a
c00026b3:	68 44 b6 00 c0       	push   $0xc000b644
c00026b8:	68 44 b6 00 c0       	push   $0xc000b644
c00026bd:	68 54 b6 00 c0       	push   $0xc000b654
c00026c2:	e8 77 74 00 00       	call   c0009b3e <assertion_failure>
c00026c7:	83 c4 10             	add    $0x10,%esp
c00026ca:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c00026ce:	74 3a                	je     c000270a <task_fs+0x119>
c00026d0:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c00026d4:	7f 19                	jg     c00026ef <task_fs+0xfe>
c00026d6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00026da:	0f 84 10 01 00 00    	je     c00027f0 <task_fs+0x1ff>
c00026e0:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c00026e4:	0f 84 a1 00 00 00    	je     c000278b <task_fs+0x19a>
c00026ea:	e9 ef 00 00 00       	jmp    c00027de <task_fs+0x1ed>
c00026ef:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c00026f3:	74 50                	je     c0002745 <task_fs+0x154>
c00026f5:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c00026f9:	0f 84 c6 00 00 00    	je     c00027c5 <task_fs+0x1d4>
c00026ff:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002703:	74 40                	je     c0002745 <task_fs+0x154>
c0002705:	e9 d4 00 00 00       	jmp    c00027de <task_fs+0x1ed>
c000270a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000270d:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002714:	83 ec 0c             	sub    $0xc,%esp
c0002717:	ff 75 f4             	pushl  -0xc(%ebp)
c000271a:	e8 ec 07 00 00       	call   c0002f0b <do_open>
c000271f:	83 c4 10             	add    $0x10,%esp
c0002722:	89 c2                	mov    %eax,%edx
c0002724:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002727:	89 50 50             	mov    %edx,0x50(%eax)
c000272a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000272d:	8b 00                	mov    (%eax),%eax
c000272f:	83 ec 04             	sub    $0x4,%esp
c0002732:	50                   	push   %eax
c0002733:	ff 75 f4             	pushl  -0xc(%ebp)
c0002736:	6a 01                	push   $0x1
c0002738:	e8 3e 7d 00 00       	call   c000a47b <send_rec>
c000273d:	83 c4 10             	add    $0x10,%esp
c0002740:	e9 b2 00 00 00       	jmp    c00027f7 <task_fs+0x206>
c0002745:	83 ec 0c             	sub    $0xc,%esp
c0002748:	ff 75 f4             	pushl  -0xc(%ebp)
c000274b:	e8 f9 18 00 00       	call   c0004049 <do_rdwt>
c0002750:	83 c4 10             	add    $0x10,%esp
c0002753:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002756:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c000275a:	0f 84 96 00 00 00    	je     c00027f6 <task_fs+0x205>
c0002760:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002763:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c000276a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000276d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002770:	89 50 60             	mov    %edx,0x60(%eax)
c0002773:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002776:	8b 00                	mov    (%eax),%eax
c0002778:	83 ec 04             	sub    $0x4,%esp
c000277b:	50                   	push   %eax
c000277c:	ff 75 f4             	pushl  -0xc(%ebp)
c000277f:	6a 01                	push   $0x1
c0002781:	e8 f5 7c 00 00       	call   c000a47b <send_rec>
c0002786:	83 c4 10             	add    $0x10,%esp
c0002789:	eb 6b                	jmp    c00027f6 <task_fs+0x205>
c000278b:	83 ec 0c             	sub    $0xc,%esp
c000278e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002791:	e8 d0 1d 00 00       	call   c0004566 <do_close>
c0002796:	83 c4 10             	add    $0x10,%esp
c0002799:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000279c:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c00027a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00027a6:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c00027ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00027b0:	8b 00                	mov    (%eax),%eax
c00027b2:	83 ec 04             	sub    $0x4,%esp
c00027b5:	50                   	push   %eax
c00027b6:	ff 75 f4             	pushl  -0xc(%ebp)
c00027b9:	6a 01                	push   $0x1
c00027bb:	e8 bb 7c 00 00       	call   c000a47b <send_rec>
c00027c0:	83 c4 10             	add    $0x10,%esp
c00027c3:	eb 32                	jmp    c00027f7 <task_fs+0x206>
c00027c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00027c8:	8b 40 68             	mov    0x68(%eax),%eax
c00027cb:	83 ec 04             	sub    $0x4,%esp
c00027ce:	50                   	push   %eax
c00027cf:	ff 75 f4             	pushl  -0xc(%ebp)
c00027d2:	6a 01                	push   $0x1
c00027d4:	e8 a2 7c 00 00       	call   c000a47b <send_rec>
c00027d9:	83 c4 10             	add    $0x10,%esp
c00027dc:	eb 19                	jmp    c00027f7 <task_fs+0x206>
c00027de:	83 ec 0c             	sub    $0xc,%esp
c00027e1:	68 b7 b6 00 c0       	push   $0xc000b6b7
c00027e6:	e8 35 73 00 00       	call   c0009b20 <panic>
c00027eb:	83 c4 10             	add    $0x10,%esp
c00027ee:	eb 07                	jmp    c00027f7 <task_fs+0x206>
c00027f0:	90                   	nop
c00027f1:	e9 26 fe ff ff       	jmp    c000261c <task_fs+0x2b>
c00027f6:	90                   	nop
c00027f7:	e9 20 fe ff ff       	jmp    c000261c <task_fs+0x2b>

c00027fc <rd_wt>:
c00027fc:	55                   	push   %ebp
c00027fd:	89 e5                	mov    %esp,%ebp
c00027ff:	83 ec 18             	sub    $0x18,%esp
c0002802:	83 ec 0c             	sub    $0xc,%esp
c0002805:	6a 7c                	push   $0x7c
c0002807:	e8 b8 fd ff ff       	call   c00025c4 <sys_malloc>
c000280c:	83 c4 10             	add    $0x10,%esp
c000280f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002812:	83 ec 04             	sub    $0x4,%esp
c0002815:	6a 7c                	push   $0x7c
c0002817:	6a 00                	push   $0x0
c0002819:	ff 75 f4             	pushl  -0xc(%ebp)
c000281c:	e8 a6 9a 00 00       	call   c000c2c7 <Memset>
c0002821:	83 c4 10             	add    $0x10,%esp
c0002824:	8b 55 18             	mov    0x18(%ebp),%edx
c0002827:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000282a:	89 50 78             	mov    %edx,0x78(%eax)
c000282d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002830:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002833:	89 50 14             	mov    %edx,0x14(%eax)
c0002836:	8b 55 10             	mov    0x10(%ebp),%edx
c0002839:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000283c:	89 50 10             	mov    %edx,0x10(%eax)
c000283f:	8b 55 14             	mov    0x14(%ebp),%edx
c0002842:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002845:	89 50 0c             	mov    %edx,0xc(%eax)
c0002848:	8b 45 08             	mov    0x8(%ebp),%eax
c000284b:	c1 e0 09             	shl    $0x9,%eax
c000284e:	89 c2                	mov    %eax,%edx
c0002850:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002853:	89 50 18             	mov    %edx,0x18(%eax)
c0002856:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c000285a:	74 22                	je     c000287e <rd_wt+0x82>
c000285c:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002860:	74 1c                	je     c000287e <rd_wt+0x82>
c0002862:	68 b1 00 00 00       	push   $0xb1
c0002867:	68 44 b6 00 c0       	push   $0xc000b644
c000286c:	68 44 b6 00 c0       	push   $0xc000b644
c0002871:	68 ca b6 00 c0       	push   $0xc000b6ca
c0002876:	e8 c3 72 00 00       	call   c0009b3e <assertion_failure>
c000287b:	83 c4 10             	add    $0x10,%esp
c000287e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002881:	8b 40 78             	mov    0x78(%eax),%eax
c0002884:	83 f8 07             	cmp    $0x7,%eax
c0002887:	74 27                	je     c00028b0 <rd_wt+0xb4>
c0002889:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000288c:	8b 40 78             	mov    0x78(%eax),%eax
c000288f:	83 f8 0a             	cmp    $0xa,%eax
c0002892:	74 1c                	je     c00028b0 <rd_wt+0xb4>
c0002894:	68 b2 00 00 00       	push   $0xb2
c0002899:	68 44 b6 00 c0       	push   $0xc000b644
c000289e:	68 44 b6 00 c0       	push   $0xc000b644
c00028a3:	68 e8 b6 00 c0       	push   $0xc000b6e8
c00028a8:	e8 91 72 00 00       	call   c0009b3e <assertion_failure>
c00028ad:	83 c4 10             	add    $0x10,%esp
c00028b0:	83 ec 04             	sub    $0x4,%esp
c00028b3:	6a 03                	push   $0x3
c00028b5:	ff 75 f4             	pushl  -0xc(%ebp)
c00028b8:	6a 03                	push   $0x3
c00028ba:	e8 bc 7b 00 00       	call   c000a47b <send_rec>
c00028bf:	83 c4 10             	add    $0x10,%esp
c00028c2:	83 ec 08             	sub    $0x8,%esp
c00028c5:	6a 7c                	push   $0x7c
c00028c7:	ff 75 f4             	pushl  -0xc(%ebp)
c00028ca:	e8 0a fd ff ff       	call   c00025d9 <sys_free>
c00028cf:	83 c4 10             	add    $0x10,%esp
c00028d2:	90                   	nop
c00028d3:	c9                   	leave  
c00028d4:	c3                   	ret    

c00028d5 <mkfs>:
c00028d5:	55                   	push   %ebp
c00028d6:	89 e5                	mov    %esp,%ebp
c00028d8:	57                   	push   %edi
c00028d9:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c00028df:	83 ec 0c             	sub    $0xc,%esp
c00028e2:	68 00 80 00 00       	push   $0x8000
c00028e7:	e8 d8 fc ff ff       	call   c00025c4 <sys_malloc>
c00028ec:	83 c4 10             	add    $0x10,%esp
c00028ef:	a3 c4 31 01 c0       	mov    %eax,0xc00131c4
c00028f4:	83 ec 0c             	sub    $0xc,%esp
c00028f7:	6a 24                	push   $0x24
c00028f9:	e8 c6 fc ff ff       	call   c00025c4 <sys_malloc>
c00028fe:	83 c4 10             	add    $0x10,%esp
c0002901:	a3 c0 31 01 c0       	mov    %eax,0xc00131c0
c0002906:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c000290b:	83 ec 0c             	sub    $0xc,%esp
c000290e:	50                   	push   %eax
c000290f:	e8 05 46 00 00       	call   c0006f19 <get_physical_address>
c0002914:	83 c4 10             	add    $0x10,%esp
c0002917:	a3 a4 27 01 c0       	mov    %eax,0xc00127a4
c000291c:	a1 c0 31 01 c0       	mov    0xc00131c0,%eax
c0002921:	83 ec 0c             	sub    $0xc,%esp
c0002924:	50                   	push   %eax
c0002925:	e8 ef 45 00 00       	call   c0006f19 <get_physical_address>
c000292a:	83 c4 10             	add    $0x10,%esp
c000292d:	a3 a0 27 01 c0       	mov    %eax,0xc00127a0
c0002932:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002937:	83 ec 04             	sub    $0x4,%esp
c000293a:	68 00 02 00 00       	push   $0x200
c000293f:	6a 00                	push   $0x0
c0002941:	50                   	push   %eax
c0002942:	e8 80 99 00 00       	call   c000c2c7 <Memset>
c0002947:	83 c4 10             	add    $0x10,%esp
c000294a:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c000294f:	83 ec 0c             	sub    $0xc,%esp
c0002952:	6a 0a                	push   $0xa
c0002954:	68 00 02 00 00       	push   $0x200
c0002959:	50                   	push   %eax
c000295a:	6a 20                	push   $0x20
c000295c:	6a 00                	push   $0x0
c000295e:	e8 99 fe ff ff       	call   c00027fc <rd_wt>
c0002963:	83 c4 20             	add    $0x20,%esp
c0002966:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c000296b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000296e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002971:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002978:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000297b:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002982:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002985:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c000298c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000298f:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002996:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002999:	8b 40 04             	mov    0x4(%eax),%eax
c000299c:	8d 50 02             	lea    0x2(%eax),%edx
c000299f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00029a2:	8b 40 08             	mov    0x8(%eax),%eax
c00029a5:	01 c2                	add    %eax,%edx
c00029a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00029aa:	8b 40 0c             	mov    0xc(%eax),%eax
c00029ad:	01 c2                	add    %eax,%edx
c00029af:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00029b2:	89 10                	mov    %edx,(%eax)
c00029b4:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00029bb:	b8 00 02 00 00       	mov    $0x200,%eax
c00029c0:	2b 45 d8             	sub    -0x28(%ebp),%eax
c00029c3:	8b 0d c4 31 01 c0    	mov    0xc00131c4,%ecx
c00029c9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00029cc:	01 ca                	add    %ecx,%edx
c00029ce:	83 ec 04             	sub    $0x4,%esp
c00029d1:	50                   	push   %eax
c00029d2:	6a 80                	push   $0xffffff80
c00029d4:	52                   	push   %edx
c00029d5:	e8 ed 98 00 00       	call   c000c2c7 <Memset>
c00029da:	83 c4 10             	add    $0x10,%esp
c00029dd:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c00029e2:	83 ec 0c             	sub    $0xc,%esp
c00029e5:	6a 0a                	push   $0xa
c00029e7:	68 00 02 00 00       	push   $0x200
c00029ec:	50                   	push   %eax
c00029ed:	6a 20                	push   $0x20
c00029ef:	6a 01                	push   $0x1
c00029f1:	e8 06 fe ff ff       	call   c00027fc <rd_wt>
c00029f6:	83 c4 20             	add    $0x20,%esp
c00029f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00029fc:	8b 10                	mov    (%eax),%edx
c00029fe:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002a01:	8b 50 04             	mov    0x4(%eax),%edx
c0002a04:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002a07:	8b 50 08             	mov    0x8(%eax),%edx
c0002a0a:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002a0d:	8b 50 0c             	mov    0xc(%eax),%edx
c0002a10:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002a13:	8b 50 10             	mov    0x10(%eax),%edx
c0002a16:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002a19:	8b 50 14             	mov    0x14(%eax),%edx
c0002a1c:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002a1f:	8b 50 18             	mov    0x18(%eax),%edx
c0002a22:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002a25:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002a28:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002a2b:	8b 40 20             	mov    0x20(%eax),%eax
c0002a2e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002a31:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002a35:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002a39:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002a3e:	83 ec 04             	sub    $0x4,%esp
c0002a41:	6a 01                	push   $0x1
c0002a43:	52                   	push   %edx
c0002a44:	50                   	push   %eax
c0002a45:	e8 7d 98 00 00       	call   c000c2c7 <Memset>
c0002a4a:	83 c4 10             	add    $0x10,%esp
c0002a4d:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002a52:	83 c0 01             	add    $0x1,%eax
c0002a55:	83 ec 04             	sub    $0x4,%esp
c0002a58:	68 ff 01 00 00       	push   $0x1ff
c0002a5d:	6a 80                	push   $0xffffff80
c0002a5f:	50                   	push   %eax
c0002a60:	e8 62 98 00 00       	call   c000c2c7 <Memset>
c0002a65:	83 c4 10             	add    $0x10,%esp
c0002a68:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0002a6d:	83 ec 0c             	sub    $0xc,%esp
c0002a70:	6a 0a                	push   $0xa
c0002a72:	68 00 02 00 00       	push   $0x200
c0002a77:	50                   	push   %eax
c0002a78:	6a 20                	push   $0x20
c0002a7a:	6a 02                	push   $0x2
c0002a7c:	e8 7b fd ff ff       	call   c00027fc <rd_wt>
c0002a81:	83 c4 20             	add    $0x20,%esp
c0002a84:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002a8b:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002a90:	83 ec 04             	sub    $0x4,%esp
c0002a93:	68 00 02 00 00       	push   $0x200
c0002a98:	6a ff                	push   $0xffffffff
c0002a9a:	50                   	push   %eax
c0002a9b:	e8 27 98 00 00       	call   c000c2c7 <Memset>
c0002aa0:	83 c4 10             	add    $0x10,%esp
c0002aa3:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0002aa8:	83 ec 0c             	sub    $0xc,%esp
c0002aab:	6a 0a                	push   $0xa
c0002aad:	68 00 02 00 00       	push   $0x200
c0002ab2:	50                   	push   %eax
c0002ab3:	6a 20                	push   $0x20
c0002ab5:	ff 75 d0             	pushl  -0x30(%ebp)
c0002ab8:	e8 3f fd ff ff       	call   c00027fc <rd_wt>
c0002abd:	83 c4 20             	add    $0x20,%esp
c0002ac0:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002ac5:	83 ec 04             	sub    $0x4,%esp
c0002ac8:	6a 01                	push   $0x1
c0002aca:	6a 01                	push   $0x1
c0002acc:	50                   	push   %eax
c0002acd:	e8 f5 97 00 00       	call   c000c2c7 <Memset>
c0002ad2:	83 c4 10             	add    $0x10,%esp
c0002ad5:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002ada:	83 c0 01             	add    $0x1,%eax
c0002add:	83 ec 04             	sub    $0x4,%esp
c0002ae0:	68 ff 01 00 00       	push   $0x1ff
c0002ae5:	6a 00                	push   $0x0
c0002ae7:	50                   	push   %eax
c0002ae8:	e8 da 97 00 00       	call   c000c2c7 <Memset>
c0002aed:	83 c4 10             	add    $0x10,%esp
c0002af0:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0002af5:	89 c2                	mov    %eax,%edx
c0002af7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002afa:	83 c0 01             	add    $0x1,%eax
c0002afd:	83 ec 0c             	sub    $0xc,%esp
c0002b00:	6a 0a                	push   $0xa
c0002b02:	68 00 02 00 00       	push   $0x200
c0002b07:	52                   	push   %edx
c0002b08:	6a 20                	push   $0x20
c0002b0a:	50                   	push   %eax
c0002b0b:	e8 ec fc ff ff       	call   c00027fc <rd_wt>
c0002b10:	83 c4 20             	add    $0x20,%esp
c0002b13:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002b16:	83 e8 02             	sub    $0x2,%eax
c0002b19:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002b1c:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002b23:	eb 04                	jmp    c0002b29 <mkfs+0x254>
c0002b25:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002b29:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002b2c:	83 c0 01             	add    $0x1,%eax
c0002b2f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002b32:	7e f1                	jle    c0002b25 <mkfs+0x250>
c0002b34:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0002b39:	89 c2                	mov    %eax,%edx
c0002b3b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002b3e:	83 c0 03             	add    $0x3,%eax
c0002b41:	83 ec 0c             	sub    $0xc,%esp
c0002b44:	6a 0a                	push   $0xa
c0002b46:	68 00 02 00 00       	push   $0x200
c0002b4b:	52                   	push   %edx
c0002b4c:	6a 20                	push   $0x20
c0002b4e:	50                   	push   %eax
c0002b4f:	e8 a8 fc ff ff       	call   c00027fc <rd_wt>
c0002b54:	83 c4 20             	add    $0x20,%esp
c0002b57:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0002b5c:	89 c2                	mov    %eax,%edx
c0002b5e:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002b61:	83 c0 03             	add    $0x3,%eax
c0002b64:	83 ec 0c             	sub    $0xc,%esp
c0002b67:	6a 07                	push   $0x7
c0002b69:	68 00 02 00 00       	push   $0x200
c0002b6e:	52                   	push   %edx
c0002b6f:	6a 20                	push   $0x20
c0002b71:	50                   	push   %eax
c0002b72:	e8 85 fc ff ff       	call   c00027fc <rd_wt>
c0002b77:	83 c4 20             	add    $0x20,%esp
c0002b7a:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002b7f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002b82:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b85:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002b8b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b8e:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002b95:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002b98:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002b9b:	89 50 08             	mov    %edx,0x8(%eax)
c0002b9e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ba1:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002ba8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bab:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002bb2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002bb5:	8b 10                	mov    (%eax),%edx
c0002bb7:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002bbd:	8b 50 04             	mov    0x4(%eax),%edx
c0002bc0:	89 15 e4 31 01 c0    	mov    %edx,0xc00131e4
c0002bc6:	8b 50 08             	mov    0x8(%eax),%edx
c0002bc9:	89 15 e8 31 01 c0    	mov    %edx,0xc00131e8
c0002bcf:	8b 50 0c             	mov    0xc(%eax),%edx
c0002bd2:	89 15 ec 31 01 c0    	mov    %edx,0xc00131ec
c0002bd8:	8b 50 10             	mov    0x10(%eax),%edx
c0002bdb:	89 15 f0 31 01 c0    	mov    %edx,0xc00131f0
c0002be1:	8b 50 14             	mov    0x14(%eax),%edx
c0002be4:	89 15 f4 31 01 c0    	mov    %edx,0xc00131f4
c0002bea:	8b 50 18             	mov    0x18(%eax),%edx
c0002bed:	89 15 f8 31 01 c0    	mov    %edx,0xc00131f8
c0002bf3:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002bf6:	89 15 fc 31 01 c0    	mov    %edx,0xc00131fc
c0002bfc:	8b 50 20             	mov    0x20(%eax),%edx
c0002bff:	89 15 00 32 01 c0    	mov    %edx,0xc0013200
c0002c05:	8b 40 24             	mov    0x24(%eax),%eax
c0002c08:	a3 04 32 01 c0       	mov    %eax,0xc0013204
c0002c0d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002c14:	eb 4c                	jmp    c0002c62 <mkfs+0x38d>
c0002c16:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002c1b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002c1e:	83 c2 01             	add    $0x1,%edx
c0002c21:	c1 e2 05             	shl    $0x5,%edx
c0002c24:	01 d0                	add    %edx,%eax
c0002c26:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002c29:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c2c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002c32:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c35:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002c3c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c3f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002c46:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002c4d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002c50:	c1 e0 08             	shl    $0x8,%eax
c0002c53:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002c56:	89 c2                	mov    %eax,%edx
c0002c58:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c5b:	89 50 08             	mov    %edx,0x8(%eax)
c0002c5e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002c62:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002c66:	7e ae                	jle    c0002c16 <mkfs+0x341>
c0002c68:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002c6f:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002c75:	b8 00 00 00 00       	mov    $0x0,%eax
c0002c7a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002c7f:	89 d7                	mov    %edx,%edi
c0002c81:	f3 ab                	rep stos %eax,%es:(%edi)
c0002c83:	c7 85 70 ff ff ff 10 	movl   $0xc000b710,-0x90(%ebp)
c0002c8a:	b7 00 c0 
c0002c8d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002c94:	eb 54                	jmp    c0002cea <mkfs+0x415>
c0002c96:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002c9b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002c9e:	83 c2 04             	add    $0x4,%edx
c0002ca1:	c1 e2 05             	shl    $0x5,%edx
c0002ca4:	01 d0                	add    %edx,%eax
c0002ca6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002ca9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cac:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002cb2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cb5:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002cbc:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002cbf:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002cc2:	83 c2 01             	add    $0x1,%edx
c0002cc5:	c1 e2 0b             	shl    $0xb,%edx
c0002cc8:	01 c2                	add    %eax,%edx
c0002cca:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ccd:	89 50 08             	mov    %edx,0x8(%eax)
c0002cd0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cd3:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002cda:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002cdd:	8d 50 05             	lea    0x5(%eax),%edx
c0002ce0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ce3:	89 50 10             	mov    %edx,0x10(%eax)
c0002ce6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002cea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ced:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002cf0:	7c a4                	jl     c0002c96 <mkfs+0x3c1>
c0002cf2:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0002cf7:	89 c2                	mov    %eax,%edx
c0002cf9:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002cfc:	83 c0 03             	add    $0x3,%eax
c0002cff:	83 ec 0c             	sub    $0xc,%esp
c0002d02:	6a 0a                	push   $0xa
c0002d04:	68 00 02 00 00       	push   $0x200
c0002d09:	52                   	push   %edx
c0002d0a:	6a 20                	push   $0x20
c0002d0c:	50                   	push   %eax
c0002d0d:	e8 ea fa ff ff       	call   c00027fc <rd_wt>
c0002d12:	83 c4 20             	add    $0x20,%esp
c0002d15:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0002d1a:	89 c2                	mov    %eax,%edx
c0002d1c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002d1f:	83 ec 0c             	sub    $0xc,%esp
c0002d22:	6a 07                	push   $0x7
c0002d24:	68 00 02 00 00       	push   $0x200
c0002d29:	52                   	push   %edx
c0002d2a:	6a 20                	push   $0x20
c0002d2c:	50                   	push   %eax
c0002d2d:	e8 ca fa ff ff       	call   c00027fc <rd_wt>
c0002d32:	83 c4 20             	add    $0x20,%esp
c0002d35:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002d3c:	00 00 00 
c0002d3f:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002d46:	2e 00 
c0002d48:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0002d4d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002d50:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002d53:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002d59:	83 ec 0c             	sub    $0xc,%esp
c0002d5c:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002d62:	50                   	push   %eax
c0002d63:	e8 98 95 00 00       	call   c000c300 <Strlen>
c0002d68:	83 c4 10             	add    $0x10,%esp
c0002d6b:	89 c1                	mov    %eax,%ecx
c0002d6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002d70:	8d 50 04             	lea    0x4(%eax),%edx
c0002d73:	83 ec 04             	sub    $0x4,%esp
c0002d76:	51                   	push   %ecx
c0002d77:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002d7d:	50                   	push   %eax
c0002d7e:	52                   	push   %edx
c0002d7f:	e8 03 4e 00 00       	call   c0007b87 <Memcpy>
c0002d84:	83 c4 10             	add    $0x10,%esp
c0002d87:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002d8d:	b8 00 00 00 00       	mov    $0x0,%eax
c0002d92:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002d97:	89 d7                	mov    %edx,%edi
c0002d99:	f3 ab                	rep stos %eax,%es:(%edi)
c0002d9b:	c7 85 34 ff ff ff 1c 	movl   $0xc000b71c,-0xcc(%ebp)
c0002da2:	b7 00 c0 
c0002da5:	c7 85 38 ff ff ff 25 	movl   $0xc000b725,-0xc8(%ebp)
c0002dac:	b7 00 c0 
c0002daf:	c7 85 3c ff ff ff 2e 	movl   $0xc000b72e,-0xc4(%ebp)
c0002db6:	b7 00 c0 
c0002db9:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002dc0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002dc7:	eb 49                	jmp    c0002e12 <mkfs+0x53d>
c0002dc9:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002dcd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002dd0:	8d 50 02             	lea    0x2(%eax),%edx
c0002dd3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002dd6:	89 10                	mov    %edx,(%eax)
c0002dd8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002ddb:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002de2:	83 ec 0c             	sub    $0xc,%esp
c0002de5:	50                   	push   %eax
c0002de6:	e8 15 95 00 00       	call   c000c300 <Strlen>
c0002deb:	83 c4 10             	add    $0x10,%esp
c0002dee:	89 c1                	mov    %eax,%ecx
c0002df0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002df3:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002dfa:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002dfd:	83 c2 04             	add    $0x4,%edx
c0002e00:	83 ec 04             	sub    $0x4,%esp
c0002e03:	51                   	push   %ecx
c0002e04:	50                   	push   %eax
c0002e05:	52                   	push   %edx
c0002e06:	e8 7c 4d 00 00       	call   c0007b87 <Memcpy>
c0002e0b:	83 c4 10             	add    $0x10,%esp
c0002e0e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002e12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002e15:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0002e18:	7c af                	jl     c0002dc9 <mkfs+0x4f4>
c0002e1a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0002e21:	eb 66                	jmp    c0002e89 <mkfs+0x5b4>
c0002e23:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e26:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002e2d:	83 ec 0c             	sub    $0xc,%esp
c0002e30:	50                   	push   %eax
c0002e31:	e8 ca 94 00 00       	call   c000c300 <Strlen>
c0002e36:	83 c4 10             	add    $0x10,%esp
c0002e39:	85 c0                	test   %eax,%eax
c0002e3b:	74 47                	je     c0002e84 <mkfs+0x5af>
c0002e3d:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002e41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e44:	8d 50 05             	lea    0x5(%eax),%edx
c0002e47:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002e4a:	89 10                	mov    %edx,(%eax)
c0002e4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e4f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002e56:	83 ec 0c             	sub    $0xc,%esp
c0002e59:	50                   	push   %eax
c0002e5a:	e8 a1 94 00 00       	call   c000c300 <Strlen>
c0002e5f:	83 c4 10             	add    $0x10,%esp
c0002e62:	89 c1                	mov    %eax,%ecx
c0002e64:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e67:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002e6e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002e71:	83 c2 04             	add    $0x4,%edx
c0002e74:	83 ec 04             	sub    $0x4,%esp
c0002e77:	51                   	push   %ecx
c0002e78:	50                   	push   %eax
c0002e79:	52                   	push   %edx
c0002e7a:	e8 08 4d 00 00       	call   c0007b87 <Memcpy>
c0002e7f:	83 c4 10             	add    $0x10,%esp
c0002e82:	eb 01                	jmp    c0002e85 <mkfs+0x5b0>
c0002e84:	90                   	nop
c0002e85:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0002e89:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002e8c:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002e8f:	7c 92                	jl     c0002e23 <mkfs+0x54e>
c0002e91:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0002e96:	89 c2                	mov    %eax,%edx
c0002e98:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002e9b:	83 ec 0c             	sub    $0xc,%esp
c0002e9e:	6a 0a                	push   $0xa
c0002ea0:	68 00 02 00 00       	push   $0x200
c0002ea5:	52                   	push   %edx
c0002ea6:	6a 20                	push   $0x20
c0002ea8:	50                   	push   %eax
c0002ea9:	e8 4e f9 ff ff       	call   c00027fc <rd_wt>
c0002eae:	83 c4 20             	add    $0x20,%esp
c0002eb1:	90                   	nop
c0002eb2:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0002eb5:	c9                   	leave  
c0002eb6:	c3                   	ret    

c0002eb7 <init_fs>:
c0002eb7:	55                   	push   %ebp
c0002eb8:	89 e5                	mov    %esp,%ebp
c0002eba:	83 ec 18             	sub    $0x18,%esp
c0002ebd:	83 ec 0c             	sub    $0xc,%esp
c0002ec0:	6a 7c                	push   $0x7c
c0002ec2:	e8 fd f6 ff ff       	call   c00025c4 <sys_malloc>
c0002ec7:	83 c4 10             	add    $0x10,%esp
c0002eca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002ecd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ed0:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0002ed7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002eda:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0002ee1:	83 ec 04             	sub    $0x4,%esp
c0002ee4:	6a 03                	push   $0x3
c0002ee6:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ee9:	6a 03                	push   $0x3
c0002eeb:	e8 8b 75 00 00       	call   c000a47b <send_rec>
c0002ef0:	83 c4 10             	add    $0x10,%esp
c0002ef3:	e8 dd f9 ff ff       	call   c00028d5 <mkfs>
c0002ef8:	83 ec 08             	sub    $0x8,%esp
c0002efb:	6a 7c                	push   $0x7c
c0002efd:	ff 75 f4             	pushl  -0xc(%ebp)
c0002f00:	e8 d4 f6 ff ff       	call   c00025d9 <sys_free>
c0002f05:	83 c4 10             	add    $0x10,%esp
c0002f08:	90                   	nop
c0002f09:	c9                   	leave  
c0002f0a:	c3                   	ret    

c0002f0b <do_open>:
c0002f0b:	55                   	push   %ebp
c0002f0c:	89 e5                	mov    %esp,%ebp
c0002f0e:	83 ec 68             	sub    $0x68,%esp
c0002f11:	83 ec 04             	sub    $0x4,%esp
c0002f14:	6a 0c                	push   $0xc
c0002f16:	6a 00                	push   $0x0
c0002f18:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002f1b:	50                   	push   %eax
c0002f1c:	e8 a6 93 00 00       	call   c000c2c7 <Memset>
c0002f21:	83 c4 10             	add    $0x10,%esp
c0002f24:	8b 45 08             	mov    0x8(%ebp),%eax
c0002f27:	8b 40 44             	mov    0x44(%eax),%eax
c0002f2a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002f2d:	83 ec 08             	sub    $0x8,%esp
c0002f30:	6a 0c                	push   $0xc
c0002f32:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002f35:	e8 11 3f 00 00       	call   c0006e4b <alloc_virtual_memory>
c0002f3a:	83 c4 10             	add    $0x10,%esp
c0002f3d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002f40:	8b 45 08             	mov    0x8(%ebp),%eax
c0002f43:	8b 40 40             	mov    0x40(%eax),%eax
c0002f46:	89 c2                	mov    %eax,%edx
c0002f48:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f4b:	83 ec 04             	sub    $0x4,%esp
c0002f4e:	52                   	push   %edx
c0002f4f:	50                   	push   %eax
c0002f50:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0002f53:	50                   	push   %eax
c0002f54:	e8 2e 4c 00 00       	call   c0007b87 <Memcpy>
c0002f59:	83 c4 10             	add    $0x10,%esp
c0002f5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0002f5f:	8b 40 40             	mov    0x40(%eax),%eax
c0002f62:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0002f67:	8b 45 08             	mov    0x8(%ebp),%eax
c0002f6a:	8b 40 74             	mov    0x74(%eax),%eax
c0002f6d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002f70:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0002f77:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002f7e:	eb 1f                	jmp    c0002f9f <do_open+0x94>
c0002f80:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0002f85:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002f88:	83 c2 50             	add    $0x50,%edx
c0002f8b:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0002f8f:	85 c0                	test   %eax,%eax
c0002f91:	75 08                	jne    c0002f9b <do_open+0x90>
c0002f93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002f96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002f99:	eb 0a                	jmp    c0002fa5 <do_open+0x9a>
c0002f9b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002f9f:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0002fa3:	7e db                	jle    c0002f80 <do_open+0x75>
c0002fa5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0002fa9:	75 1c                	jne    c0002fc7 <do_open+0xbc>
c0002fab:	68 c6 01 00 00       	push   $0x1c6
c0002fb0:	68 44 b6 00 c0       	push   $0xc000b644
c0002fb5:	68 44 b6 00 c0       	push   $0xc000b644
c0002fba:	68 37 b7 00 c0       	push   $0xc000b737
c0002fbf:	e8 7a 6b 00 00       	call   c0009b3e <assertion_failure>
c0002fc4:	83 c4 10             	add    $0x10,%esp
c0002fc7:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0002fce:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0002fd5:	eb 1d                	jmp    c0002ff4 <do_open+0xe9>
c0002fd7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002fda:	c1 e0 04             	shl    $0x4,%eax
c0002fdd:	05 a8 23 01 c0       	add    $0xc00123a8,%eax
c0002fe2:	8b 00                	mov    (%eax),%eax
c0002fe4:	85 c0                	test   %eax,%eax
c0002fe6:	75 08                	jne    c0002ff0 <do_open+0xe5>
c0002fe8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002feb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002fee:	eb 0a                	jmp    c0002ffa <do_open+0xef>
c0002ff0:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0002ff4:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0002ff8:	7e dd                	jle    c0002fd7 <do_open+0xcc>
c0002ffa:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0002ffe:	75 1c                	jne    c000301c <do_open+0x111>
c0003000:	68 d2 01 00 00       	push   $0x1d2
c0003005:	68 44 b6 00 c0       	push   $0xc000b644
c000300a:	68 44 b6 00 c0       	push   $0xc000b644
c000300f:	68 3f b7 00 c0       	push   $0xc000b73f
c0003014:	e8 25 6b 00 00       	call   c0009b3e <assertion_failure>
c0003019:	83 c4 10             	add    $0x10,%esp
c000301c:	83 ec 0c             	sub    $0xc,%esp
c000301f:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003022:	50                   	push   %eax
c0003023:	e8 b2 00 00 00       	call   c00030da <search_file>
c0003028:	83 c4 10             	add    $0x10,%esp
c000302b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000302e:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0003032:	75 2b                	jne    c000305f <do_open+0x154>
c0003034:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0003038:	7e 10                	jle    c000304a <do_open+0x13f>
c000303a:	83 ec 0c             	sub    $0xc,%esp
c000303d:	68 47 b7 00 c0       	push   $0xc000b747
c0003042:	e8 d9 6a 00 00       	call   c0009b20 <panic>
c0003047:	83 c4 10             	add    $0x10,%esp
c000304a:	83 ec 08             	sub    $0x8,%esp
c000304d:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003050:	50                   	push   %eax
c0003051:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0003054:	50                   	push   %eax
c0003055:	e8 40 04 00 00       	call   c000349a <create_file>
c000305a:	83 c4 10             	add    $0x10,%esp
c000305d:	eb 22                	jmp    c0003081 <do_open+0x176>
c000305f:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0003063:	75 07                	jne    c000306c <do_open+0x161>
c0003065:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000306a:	eb 6c                	jmp    c00030d8 <do_open+0x1cd>
c000306c:	83 ec 08             	sub    $0x8,%esp
c000306f:	ff 75 d8             	pushl  -0x28(%ebp)
c0003072:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0003075:	50                   	push   %eax
c0003076:	e8 5d 02 00 00       	call   c00032d8 <get_inode>
c000307b:	83 c4 10             	add    $0x10,%esp
c000307e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003081:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0003086:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003089:	c1 e2 04             	shl    $0x4,%edx
c000308c:	8d 8a a0 23 01 c0    	lea    -0x3ffedc60(%edx),%ecx
c0003092:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003095:	83 c2 50             	add    $0x50,%edx
c0003098:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c000309c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000309f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00030a2:	c1 e2 04             	shl    $0x4,%edx
c00030a5:	81 c2 a8 23 01 c0    	add    $0xc00123a8,%edx
c00030ab:	89 02                	mov    %eax,(%edx)
c00030ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030b0:	c1 e0 04             	shl    $0x4,%eax
c00030b3:	05 a4 23 01 c0       	add    $0xc00123a4,%eax
c00030b8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00030be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030c1:	c1 e0 04             	shl    $0x4,%eax
c00030c4:	05 a0 23 01 c0       	add    $0xc00123a0,%eax
c00030c9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00030cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00030d5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00030d8:	c9                   	leave  
c00030d9:	c3                   	ret    

c00030da <search_file>:
c00030da:	55                   	push   %ebp
c00030db:	89 e5                	mov    %esp,%ebp
c00030dd:	83 ec 68             	sub    $0x68,%esp
c00030e0:	83 ec 04             	sub    $0x4,%esp
c00030e3:	6a 0c                	push   $0xc
c00030e5:	6a 00                	push   $0x0
c00030e7:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00030ea:	50                   	push   %eax
c00030eb:	e8 d7 91 00 00       	call   c000c2c7 <Memset>
c00030f0:	83 c4 10             	add    $0x10,%esp
c00030f3:	83 ec 04             	sub    $0x4,%esp
c00030f6:	6a 28                	push   $0x28
c00030f8:	6a 00                	push   $0x0
c00030fa:	8d 45 98             	lea    -0x68(%ebp),%eax
c00030fd:	50                   	push   %eax
c00030fe:	e8 c4 91 00 00       	call   c000c2c7 <Memset>
c0003103:	83 c4 10             	add    $0x10,%esp
c0003106:	83 ec 04             	sub    $0x4,%esp
c0003109:	8d 45 98             	lea    -0x68(%ebp),%eax
c000310c:	50                   	push   %eax
c000310d:	ff 75 08             	pushl  0x8(%ebp)
c0003110:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003113:	50                   	push   %eax
c0003114:	e8 f3 00 00 00       	call   c000320c <strip_path>
c0003119:	83 c4 10             	add    $0x10,%esp
c000311c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000311f:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c0003123:	75 0a                	jne    c000312f <search_file+0x55>
c0003125:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000312a:	e9 db 00 00 00       	jmp    c000320a <search_file+0x130>
c000312f:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003132:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003135:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003138:	05 00 02 00 00       	add    $0x200,%eax
c000313d:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003143:	85 c0                	test   %eax,%eax
c0003145:	0f 48 c2             	cmovs  %edx,%eax
c0003148:	c1 f8 09             	sar    $0x9,%eax
c000314b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000314e:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003151:	c1 e8 04             	shr    $0x4,%eax
c0003154:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003157:	e8 5c 14 00 00       	call   c00045b8 <get_super_block>
c000315c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000315f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003162:	8b 00                	mov    (%eax),%eax
c0003164:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003167:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c000316e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003175:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000317c:	eb 7b                	jmp    c00031f9 <search_file+0x11f>
c000317e:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003183:	89 c1                	mov    %eax,%ecx
c0003185:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003188:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000318b:	01 d0                	add    %edx,%eax
c000318d:	83 ec 0c             	sub    $0xc,%esp
c0003190:	6a 07                	push   $0x7
c0003192:	68 00 02 00 00       	push   $0x200
c0003197:	51                   	push   %ecx
c0003198:	ff 75 cc             	pushl  -0x34(%ebp)
c000319b:	50                   	push   %eax
c000319c:	e8 5b f6 ff ff       	call   c00027fc <rd_wt>
c00031a1:	83 c4 20             	add    $0x20,%esp
c00031a4:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c00031a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00031ac:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00031b3:	eb 35                	jmp    c00031ea <search_file+0x110>
c00031b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00031b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00031bc:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00031bf:	7f 33                	jg     c00031f4 <search_file+0x11a>
c00031c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00031c4:	83 c0 04             	add    $0x4,%eax
c00031c7:	83 ec 08             	sub    $0x8,%esp
c00031ca:	50                   	push   %eax
c00031cb:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00031ce:	50                   	push   %eax
c00031cf:	e8 0f 76 00 00       	call   c000a7e3 <strcmp>
c00031d4:	83 c4 10             	add    $0x10,%esp
c00031d7:	85 c0                	test   %eax,%eax
c00031d9:	75 07                	jne    c00031e2 <search_file+0x108>
c00031db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00031de:	8b 00                	mov    (%eax),%eax
c00031e0:	eb 28                	jmp    c000320a <search_file+0x130>
c00031e2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00031e6:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c00031ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00031ed:	83 f8 1f             	cmp    $0x1f,%eax
c00031f0:	76 c3                	jbe    c00031b5 <search_file+0xdb>
c00031f2:	eb 01                	jmp    c00031f5 <search_file+0x11b>
c00031f4:	90                   	nop
c00031f5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00031f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00031fc:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c00031ff:	0f 8c 79 ff ff ff    	jl     c000317e <search_file+0xa4>
c0003205:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000320a:	c9                   	leave  
c000320b:	c3                   	ret    

c000320c <strip_path>:
c000320c:	55                   	push   %ebp
c000320d:	89 e5                	mov    %esp,%ebp
c000320f:	83 ec 10             	sub    $0x10,%esp
c0003212:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003216:	75 0a                	jne    c0003222 <strip_path+0x16>
c0003218:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000321d:	e9 b4 00 00 00       	jmp    c00032d6 <strip_path+0xca>
c0003222:	8b 45 08             	mov    0x8(%ebp),%eax
c0003225:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003228:	8b 45 0c             	mov    0xc(%ebp),%eax
c000322b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000322e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003231:	0f b6 00             	movzbl (%eax),%eax
c0003234:	3c 2f                	cmp    $0x2f,%al
c0003236:	75 2d                	jne    c0003265 <strip_path+0x59>
c0003238:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000323c:	eb 27                	jmp    c0003265 <strip_path+0x59>
c000323e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003241:	0f b6 00             	movzbl (%eax),%eax
c0003244:	3c 2f                	cmp    $0x2f,%al
c0003246:	75 0a                	jne    c0003252 <strip_path+0x46>
c0003248:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000324d:	e9 84 00 00 00       	jmp    c00032d6 <strip_path+0xca>
c0003252:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003255:	0f b6 10             	movzbl (%eax),%edx
c0003258:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000325b:	88 10                	mov    %dl,(%eax)
c000325d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003261:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003265:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003268:	0f b6 00             	movzbl (%eax),%eax
c000326b:	84 c0                	test   %al,%al
c000326d:	75 cf                	jne    c000323e <strip_path+0x32>
c000326f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003272:	c6 00 00             	movb   $0x0,(%eax)
c0003275:	8b 45 10             	mov    0x10(%ebp),%eax
c0003278:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c000327e:	89 10                	mov    %edx,(%eax)
c0003280:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003286:	89 50 04             	mov    %edx,0x4(%eax)
c0003289:	8b 15 e8 31 01 c0    	mov    0xc00131e8,%edx
c000328f:	89 50 08             	mov    %edx,0x8(%eax)
c0003292:	8b 15 ec 31 01 c0    	mov    0xc00131ec,%edx
c0003298:	89 50 0c             	mov    %edx,0xc(%eax)
c000329b:	8b 15 f0 31 01 c0    	mov    0xc00131f0,%edx
c00032a1:	89 50 10             	mov    %edx,0x10(%eax)
c00032a4:	8b 15 f4 31 01 c0    	mov    0xc00131f4,%edx
c00032aa:	89 50 14             	mov    %edx,0x14(%eax)
c00032ad:	8b 15 f8 31 01 c0    	mov    0xc00131f8,%edx
c00032b3:	89 50 18             	mov    %edx,0x18(%eax)
c00032b6:	8b 15 fc 31 01 c0    	mov    0xc00131fc,%edx
c00032bc:	89 50 1c             	mov    %edx,0x1c(%eax)
c00032bf:	8b 15 00 32 01 c0    	mov    0xc0013200,%edx
c00032c5:	89 50 20             	mov    %edx,0x20(%eax)
c00032c8:	8b 15 04 32 01 c0    	mov    0xc0013204,%edx
c00032ce:	89 50 24             	mov    %edx,0x24(%eax)
c00032d1:	b8 00 00 00 00       	mov    $0x0,%eax
c00032d6:	c9                   	leave  
c00032d7:	c3                   	ret    

c00032d8 <get_inode>:
c00032d8:	55                   	push   %ebp
c00032d9:	89 e5                	mov    %esp,%ebp
c00032db:	56                   	push   %esi
c00032dc:	53                   	push   %ebx
c00032dd:	83 ec 20             	sub    $0x20,%esp
c00032e0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00032e4:	75 0a                	jne    c00032f0 <get_inode+0x18>
c00032e6:	b8 00 00 00 00       	mov    $0x0,%eax
c00032eb:	e9 a3 01 00 00       	jmp    c0003493 <get_inode+0x1bb>
c00032f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00032f7:	c7 45 f0 c0 27 01 c0 	movl   $0xc00127c0,-0x10(%ebp)
c00032fe:	eb 69                	jmp    c0003369 <get_inode+0x91>
c0003300:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003303:	8b 40 24             	mov    0x24(%eax),%eax
c0003306:	85 c0                	test   %eax,%eax
c0003308:	7e 53                	jle    c000335d <get_inode+0x85>
c000330a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000330d:	8b 40 10             	mov    0x10(%eax),%eax
c0003310:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003313:	75 50                	jne    c0003365 <get_inode+0x8d>
c0003315:	8b 45 08             	mov    0x8(%ebp),%eax
c0003318:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000331b:	8b 0a                	mov    (%edx),%ecx
c000331d:	89 08                	mov    %ecx,(%eax)
c000331f:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003322:	89 48 04             	mov    %ecx,0x4(%eax)
c0003325:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003328:	89 48 08             	mov    %ecx,0x8(%eax)
c000332b:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000332e:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003331:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003334:	89 48 10             	mov    %ecx,0x10(%eax)
c0003337:	8b 4a 14             	mov    0x14(%edx),%ecx
c000333a:	89 48 14             	mov    %ecx,0x14(%eax)
c000333d:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003340:	89 48 18             	mov    %ecx,0x18(%eax)
c0003343:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003346:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003349:	8b 4a 20             	mov    0x20(%edx),%ecx
c000334c:	89 48 20             	mov    %ecx,0x20(%eax)
c000334f:	8b 52 24             	mov    0x24(%edx),%edx
c0003352:	89 50 24             	mov    %edx,0x24(%eax)
c0003355:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003358:	e9 36 01 00 00       	jmp    c0003493 <get_inode+0x1bb>
c000335d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003360:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003363:	eb 0d                	jmp    c0003372 <get_inode+0x9a>
c0003365:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003369:	81 7d f0 c0 31 01 c0 	cmpl   $0xc00131c0,-0x10(%ebp)
c0003370:	76 8e                	jbe    c0003300 <get_inode+0x28>
c0003372:	e8 41 12 00 00       	call   c00045b8 <get_super_block>
c0003377:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000337a:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003381:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003384:	8b 40 04             	mov    0x4(%eax),%eax
c0003387:	8d 50 02             	lea    0x2(%eax),%edx
c000338a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000338d:	8b 40 08             	mov    0x8(%eax),%eax
c0003390:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0003393:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003396:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003399:	b8 00 02 00 00       	mov    $0x200,%eax
c000339e:	99                   	cltd   
c000339f:	f7 7d e8             	idivl  -0x18(%ebp)
c00033a2:	89 c6                	mov    %eax,%esi
c00033a4:	89 c8                	mov    %ecx,%eax
c00033a6:	99                   	cltd   
c00033a7:	f7 fe                	idiv   %esi
c00033a9:	01 d8                	add    %ebx,%eax
c00033ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00033ae:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c00033b5:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c00033ba:	83 ec 0c             	sub    $0xc,%esp
c00033bd:	6a 07                	push   $0x7
c00033bf:	68 00 02 00 00       	push   $0x200
c00033c4:	50                   	push   %eax
c00033c5:	ff 75 e0             	pushl  -0x20(%ebp)
c00033c8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00033cb:	e8 2c f4 ff ff       	call   c00027fc <rd_wt>
c00033d0:	83 c4 20             	add    $0x20,%esp
c00033d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00033d6:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00033d9:	b8 00 02 00 00       	mov    $0x200,%eax
c00033de:	99                   	cltd   
c00033df:	f7 7d e8             	idivl  -0x18(%ebp)
c00033e2:	89 c3                	mov    %eax,%ebx
c00033e4:	89 c8                	mov    %ecx,%eax
c00033e6:	99                   	cltd   
c00033e7:	f7 fb                	idiv   %ebx
c00033e9:	89 55 dc             	mov    %edx,-0x24(%ebp)
c00033ec:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00033f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00033f5:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c00033f9:	01 d0                	add    %edx,%eax
c00033fb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00033fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003401:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003404:	8b 0a                	mov    (%edx),%ecx
c0003406:	89 08                	mov    %ecx,(%eax)
c0003408:	8b 4a 04             	mov    0x4(%edx),%ecx
c000340b:	89 48 04             	mov    %ecx,0x4(%eax)
c000340e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003411:	89 48 08             	mov    %ecx,0x8(%eax)
c0003414:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003417:	89 48 0c             	mov    %ecx,0xc(%eax)
c000341a:	8b 4a 10             	mov    0x10(%edx),%ecx
c000341d:	89 48 10             	mov    %ecx,0x10(%eax)
c0003420:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003423:	89 48 14             	mov    %ecx,0x14(%eax)
c0003426:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003429:	89 48 18             	mov    %ecx,0x18(%eax)
c000342c:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000342f:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003432:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003435:	89 48 20             	mov    %ecx,0x20(%eax)
c0003438:	8b 52 24             	mov    0x24(%edx),%edx
c000343b:	89 50 24             	mov    %edx,0x24(%eax)
c000343e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003441:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003444:	89 50 10             	mov    %edx,0x10(%eax)
c0003447:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000344a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000344d:	89 50 20             	mov    %edx,0x20(%eax)
c0003450:	8b 45 08             	mov    0x8(%ebp),%eax
c0003453:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003456:	8b 0a                	mov    (%edx),%ecx
c0003458:	89 08                	mov    %ecx,(%eax)
c000345a:	8b 4a 04             	mov    0x4(%edx),%ecx
c000345d:	89 48 04             	mov    %ecx,0x4(%eax)
c0003460:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003463:	89 48 08             	mov    %ecx,0x8(%eax)
c0003466:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003469:	89 48 0c             	mov    %ecx,0xc(%eax)
c000346c:	8b 4a 10             	mov    0x10(%edx),%ecx
c000346f:	89 48 10             	mov    %ecx,0x10(%eax)
c0003472:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003475:	89 48 14             	mov    %ecx,0x14(%eax)
c0003478:	8b 4a 18             	mov    0x18(%edx),%ecx
c000347b:	89 48 18             	mov    %ecx,0x18(%eax)
c000347e:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003481:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003484:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003487:	89 48 20             	mov    %ecx,0x20(%eax)
c000348a:	8b 52 24             	mov    0x24(%edx),%edx
c000348d:	89 50 24             	mov    %edx,0x24(%eax)
c0003490:	8b 45 08             	mov    0x8(%ebp),%eax
c0003493:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0003496:	5b                   	pop    %ebx
c0003497:	5e                   	pop    %esi
c0003498:	5d                   	pop    %ebp
c0003499:	c3                   	ret    

c000349a <create_file>:
c000349a:	55                   	push   %ebp
c000349b:	89 e5                	mov    %esp,%ebp
c000349d:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00034a3:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00034a6:	50                   	push   %eax
c00034a7:	ff 75 0c             	pushl  0xc(%ebp)
c00034aa:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00034ad:	50                   	push   %eax
c00034ae:	e8 59 fd ff ff       	call   c000320c <strip_path>
c00034b3:	83 c4 0c             	add    $0xc,%esp
c00034b6:	83 f8 ff             	cmp    $0xffffffff,%eax
c00034b9:	75 0a                	jne    c00034c5 <create_file+0x2b>
c00034bb:	b8 00 00 00 00       	mov    $0x0,%eax
c00034c0:	e9 de 00 00 00       	jmp    c00035a3 <create_file+0x109>
c00034c5:	e8 db 00 00 00       	call   c00035a5 <alloc_imap_bit>
c00034ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00034cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00034d1:	75 0a                	jne    c00034dd <create_file+0x43>
c00034d3:	b8 00 00 00 00       	mov    $0x0,%eax
c00034d8:	e9 c6 00 00 00       	jmp    c00035a3 <create_file+0x109>
c00034dd:	e8 d6 10 00 00       	call   c00045b8 <get_super_block>
c00034e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00034e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034e8:	8b 40 10             	mov    0x10(%eax),%eax
c00034eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00034ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00034f1:	83 ec 08             	sub    $0x8,%esp
c00034f4:	50                   	push   %eax
c00034f5:	ff 75 f4             	pushl  -0xc(%ebp)
c00034f8:	e8 a5 01 00 00       	call   c00036a2 <alloc_smap_bit>
c00034fd:	83 c4 10             	add    $0x10,%esp
c0003500:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0003503:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003507:	75 0a                	jne    c0003513 <create_file+0x79>
c0003509:	b8 00 00 00 00       	mov    $0x0,%eax
c000350e:	e9 90 00 00 00       	jmp    c00035a3 <create_file+0x109>
c0003513:	83 ec 04             	sub    $0x4,%esp
c0003516:	ff 75 e8             	pushl  -0x18(%ebp)
c0003519:	ff 75 f4             	pushl  -0xc(%ebp)
c000351c:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000351f:	50                   	push   %eax
c0003520:	e8 1e 03 00 00       	call   c0003843 <new_inode>
c0003525:	83 c4 10             	add    $0x10,%esp
c0003528:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000352b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c000352f:	75 07                	jne    c0003538 <create_file+0x9e>
c0003531:	b8 00 00 00 00       	mov    $0x0,%eax
c0003536:	eb 6b                	jmp    c00035a3 <create_file+0x109>
c0003538:	ff 75 f4             	pushl  -0xc(%ebp)
c000353b:	8d 45 ac             	lea    -0x54(%ebp),%eax
c000353e:	50                   	push   %eax
c000353f:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003542:	50                   	push   %eax
c0003543:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003549:	50                   	push   %eax
c000354a:	e8 12 04 00 00       	call   c0003961 <new_dir_entry>
c000354f:	83 c4 10             	add    $0x10,%esp
c0003552:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003555:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003559:	75 07                	jne    c0003562 <create_file+0xc8>
c000355b:	b8 00 00 00 00       	mov    $0x0,%eax
c0003560:	eb 41                	jmp    c00035a3 <create_file+0x109>
c0003562:	8b 45 08             	mov    0x8(%ebp),%eax
c0003565:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0003568:	89 10                	mov    %edx,(%eax)
c000356a:	8b 55 88             	mov    -0x78(%ebp),%edx
c000356d:	89 50 04             	mov    %edx,0x4(%eax)
c0003570:	8b 55 8c             	mov    -0x74(%ebp),%edx
c0003573:	89 50 08             	mov    %edx,0x8(%eax)
c0003576:	8b 55 90             	mov    -0x70(%ebp),%edx
c0003579:	89 50 0c             	mov    %edx,0xc(%eax)
c000357c:	8b 55 94             	mov    -0x6c(%ebp),%edx
c000357f:	89 50 10             	mov    %edx,0x10(%eax)
c0003582:	8b 55 98             	mov    -0x68(%ebp),%edx
c0003585:	89 50 14             	mov    %edx,0x14(%eax)
c0003588:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000358b:	89 50 18             	mov    %edx,0x18(%eax)
c000358e:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0003591:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003594:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0003597:	89 50 20             	mov    %edx,0x20(%eax)
c000359a:	8b 55 a8             	mov    -0x58(%ebp),%edx
c000359d:	89 50 24             	mov    %edx,0x24(%eax)
c00035a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00035a3:	c9                   	leave  
c00035a4:	c3                   	ret    

c00035a5 <alloc_imap_bit>:
c00035a5:	55                   	push   %ebp
c00035a6:	89 e5                	mov    %esp,%ebp
c00035a8:	53                   	push   %ebx
c00035a9:	83 ec 24             	sub    $0x24,%esp
c00035ac:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00035b3:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00035ba:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c00035bf:	83 ec 0c             	sub    $0xc,%esp
c00035c2:	6a 07                	push   $0x7
c00035c4:	68 00 02 00 00       	push   $0x200
c00035c9:	50                   	push   %eax
c00035ca:	ff 75 e8             	pushl  -0x18(%ebp)
c00035cd:	ff 75 ec             	pushl  -0x14(%ebp)
c00035d0:	e8 27 f2 ff ff       	call   c00027fc <rd_wt>
c00035d5:	83 c4 20             	add    $0x20,%esp
c00035d8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00035df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00035e6:	e9 a5 00 00 00       	jmp    c0003690 <alloc_imap_bit+0xeb>
c00035eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00035f2:	e9 8b 00 00 00       	jmp    c0003682 <alloc_imap_bit+0xdd>
c00035f7:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00035fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003600:	01 d0                	add    %edx,%eax
c0003602:	0f b6 00             	movzbl (%eax),%eax
c0003605:	0f be d0             	movsbl %al,%edx
c0003608:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000360b:	89 c1                	mov    %eax,%ecx
c000360d:	d3 fa                	sar    %cl,%edx
c000360f:	89 d0                	mov    %edx,%eax
c0003611:	83 e0 01             	and    $0x1,%eax
c0003614:	85 c0                	test   %eax,%eax
c0003616:	74 06                	je     c000361e <alloc_imap_bit+0x79>
c0003618:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000361c:	eb 64                	jmp    c0003682 <alloc_imap_bit+0xdd>
c000361e:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003624:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003627:	01 d0                	add    %edx,%eax
c0003629:	0f b6 18             	movzbl (%eax),%ebx
c000362c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000362f:	ba 01 00 00 00       	mov    $0x1,%edx
c0003634:	89 c1                	mov    %eax,%ecx
c0003636:	d3 e2                	shl    %cl,%edx
c0003638:	89 d0                	mov    %edx,%eax
c000363a:	89 c1                	mov    %eax,%ecx
c000363c:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003642:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003645:	01 d0                	add    %edx,%eax
c0003647:	09 cb                	or     %ecx,%ebx
c0003649:	89 da                	mov    %ebx,%edx
c000364b:	88 10                	mov    %dl,(%eax)
c000364d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003650:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003657:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000365a:	01 d0                	add    %edx,%eax
c000365c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000365f:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003664:	83 ec 0c             	sub    $0xc,%esp
c0003667:	6a 0a                	push   $0xa
c0003669:	68 00 02 00 00       	push   $0x200
c000366e:	50                   	push   %eax
c000366f:	ff 75 e8             	pushl  -0x18(%ebp)
c0003672:	ff 75 ec             	pushl  -0x14(%ebp)
c0003675:	e8 82 f1 ff ff       	call   c00027fc <rd_wt>
c000367a:	83 c4 20             	add    $0x20,%esp
c000367d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003680:	eb 1b                	jmp    c000369d <alloc_imap_bit+0xf8>
c0003682:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c0003686:	0f 8e 6b ff ff ff    	jle    c00035f7 <alloc_imap_bit+0x52>
c000368c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003690:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0003697:	0f 8e 4e ff ff ff    	jle    c00035eb <alloc_imap_bit+0x46>
c000369d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00036a0:	c9                   	leave  
c00036a1:	c3                   	ret    

c00036a2 <alloc_smap_bit>:
c00036a2:	55                   	push   %ebp
c00036a3:	89 e5                	mov    %esp,%ebp
c00036a5:	53                   	push   %ebx
c00036a6:	83 ec 34             	sub    $0x34,%esp
c00036a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00036ad:	75 1c                	jne    c00036cb <alloc_smap_bit+0x29>
c00036af:	68 fc 02 00 00       	push   $0x2fc
c00036b4:	68 44 b6 00 c0       	push   $0xc000b644
c00036b9:	68 44 b6 00 c0       	push   $0xc000b644
c00036be:	68 54 b7 00 c0       	push   $0xc000b754
c00036c3:	e8 76 64 00 00       	call   c0009b3e <assertion_failure>
c00036c8:	83 c4 10             	add    $0x10,%esp
c00036cb:	e8 e8 0e 00 00       	call   c00045b8 <get_super_block>
c00036d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00036d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00036d6:	8b 40 08             	mov    0x8(%eax),%eax
c00036d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00036dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00036df:	8b 40 04             	mov    0x4(%eax),%eax
c00036e2:	83 c0 02             	add    $0x2,%eax
c00036e5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00036e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00036ef:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00036f6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00036fd:	e9 20 01 00 00       	jmp    c0003822 <alloc_smap_bit+0x180>
c0003702:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003705:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003708:	01 d0                	add    %edx,%eax
c000370a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000370d:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003712:	83 ec 0c             	sub    $0xc,%esp
c0003715:	6a 07                	push   $0x7
c0003717:	68 00 02 00 00       	push   $0x200
c000371c:	50                   	push   %eax
c000371d:	ff 75 d8             	pushl  -0x28(%ebp)
c0003720:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003723:	e8 d4 f0 ff ff       	call   c00027fc <rd_wt>
c0003728:	83 c4 20             	add    $0x20,%esp
c000372b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003732:	e9 b0 00 00 00       	jmp    c00037e7 <alloc_smap_bit+0x145>
c0003737:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000373e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003742:	0f 85 8c 00 00 00    	jne    c00037d4 <alloc_smap_bit+0x132>
c0003748:	eb 45                	jmp    c000378f <alloc_smap_bit+0xed>
c000374a:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003750:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003753:	01 d0                	add    %edx,%eax
c0003755:	0f b6 00             	movzbl (%eax),%eax
c0003758:	0f be d0             	movsbl %al,%edx
c000375b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000375e:	89 c1                	mov    %eax,%ecx
c0003760:	d3 fa                	sar    %cl,%edx
c0003762:	89 d0                	mov    %edx,%eax
c0003764:	83 e0 01             	and    $0x1,%eax
c0003767:	85 c0                	test   %eax,%eax
c0003769:	74 06                	je     c0003771 <alloc_smap_bit+0xcf>
c000376b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000376f:	eb 1e                	jmp    c000378f <alloc_smap_bit+0xed>
c0003771:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003774:	c1 e0 09             	shl    $0x9,%eax
c0003777:	89 c2                	mov    %eax,%edx
c0003779:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000377c:	01 d0                	add    %edx,%eax
c000377e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003785:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003788:	01 d0                	add    %edx,%eax
c000378a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000378d:	eb 06                	jmp    c0003795 <alloc_smap_bit+0xf3>
c000378f:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003793:	7e b5                	jle    c000374a <alloc_smap_bit+0xa8>
c0003795:	eb 3d                	jmp    c00037d4 <alloc_smap_bit+0x132>
c0003797:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000379b:	74 45                	je     c00037e2 <alloc_smap_bit+0x140>
c000379d:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00037a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00037a6:	01 d0                	add    %edx,%eax
c00037a8:	0f b6 18             	movzbl (%eax),%ebx
c00037ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00037ae:	ba 01 00 00 00       	mov    $0x1,%edx
c00037b3:	89 c1                	mov    %eax,%ecx
c00037b5:	d3 e2                	shl    %cl,%edx
c00037b7:	89 d0                	mov    %edx,%eax
c00037b9:	89 c1                	mov    %eax,%ecx
c00037bb:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00037c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00037c4:	01 d0                	add    %edx,%eax
c00037c6:	09 cb                	or     %ecx,%ebx
c00037c8:	89 da                	mov    %ebx,%edx
c00037ca:	88 10                	mov    %dl,(%eax)
c00037cc:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00037d0:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00037d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00037d8:	74 09                	je     c00037e3 <alloc_smap_bit+0x141>
c00037da:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00037de:	7e b7                	jle    c0003797 <alloc_smap_bit+0xf5>
c00037e0:	eb 01                	jmp    c00037e3 <alloc_smap_bit+0x141>
c00037e2:	90                   	nop
c00037e3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00037e7:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c00037ee:	0f 8e 43 ff ff ff    	jle    c0003737 <alloc_smap_bit+0x95>
c00037f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00037f8:	74 1e                	je     c0003818 <alloc_smap_bit+0x176>
c00037fa:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c00037ff:	83 ec 0c             	sub    $0xc,%esp
c0003802:	6a 0a                	push   $0xa
c0003804:	68 00 02 00 00       	push   $0x200
c0003809:	50                   	push   %eax
c000380a:	ff 75 d8             	pushl  -0x28(%ebp)
c000380d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003810:	e8 e7 ef ff ff       	call   c00027fc <rd_wt>
c0003815:	83 c4 20             	add    $0x20,%esp
c0003818:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000381c:	74 12                	je     c0003830 <alloc_smap_bit+0x18e>
c000381e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003822:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003825:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003828:	0f 8c d4 fe ff ff    	jl     c0003702 <alloc_smap_bit+0x60>
c000382e:	eb 01                	jmp    c0003831 <alloc_smap_bit+0x18f>
c0003830:	90                   	nop
c0003831:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003834:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003837:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000383a:	8b 00                	mov    (%eax),%eax
c000383c:	01 d0                	add    %edx,%eax
c000383e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003841:	c9                   	leave  
c0003842:	c3                   	ret    

c0003843 <new_inode>:
c0003843:	55                   	push   %ebp
c0003844:	89 e5                	mov    %esp,%ebp
c0003846:	83 ec 38             	sub    $0x38,%esp
c0003849:	83 ec 08             	sub    $0x8,%esp
c000384c:	ff 75 0c             	pushl  0xc(%ebp)
c000384f:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003852:	50                   	push   %eax
c0003853:	e8 80 fa ff ff       	call   c00032d8 <get_inode>
c0003858:	83 c4 10             	add    $0x10,%esp
c000385b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000385e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003862:	75 0a                	jne    c000386e <new_inode+0x2b>
c0003864:	b8 00 00 00 00       	mov    $0x0,%eax
c0003869:	e9 f1 00 00 00       	jmp    c000395f <new_inode+0x11c>
c000386e:	8b 45 10             	mov    0x10(%ebp),%eax
c0003871:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003874:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c000387b:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003882:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003889:	8b 45 0c             	mov    0xc(%ebp),%eax
c000388c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000388f:	83 ec 0c             	sub    $0xc,%esp
c0003892:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003895:	50                   	push   %eax
c0003896:	e8 39 0b 00 00       	call   c00043d4 <sync_inode>
c000389b:	83 c4 10             	add    $0x10,%esp
c000389e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00038a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00038ac:	eb 1d                	jmp    c00038cb <new_inode+0x88>
c00038ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00038b1:	89 d0                	mov    %edx,%eax
c00038b3:	c1 e0 02             	shl    $0x2,%eax
c00038b6:	01 d0                	add    %edx,%eax
c00038b8:	c1 e0 03             	shl    $0x3,%eax
c00038bb:	05 d0 27 01 c0       	add    $0xc00127d0,%eax
c00038c0:	8b 00                	mov    (%eax),%eax
c00038c2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00038c5:	74 0c                	je     c00038d3 <new_inode+0x90>
c00038c7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00038cb:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00038cf:	7e dd                	jle    c00038ae <new_inode+0x6b>
c00038d1:	eb 01                	jmp    c00038d4 <new_inode+0x91>
c00038d3:	90                   	nop
c00038d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00038d7:	89 d0                	mov    %edx,%eax
c00038d9:	c1 e0 02             	shl    $0x2,%eax
c00038dc:	01 d0                	add    %edx,%eax
c00038de:	c1 e0 03             	shl    $0x3,%eax
c00038e1:	05 c0 27 01 c0       	add    $0xc00127c0,%eax
c00038e6:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00038e9:	89 10                	mov    %edx,(%eax)
c00038eb:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00038ee:	89 50 04             	mov    %edx,0x4(%eax)
c00038f1:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00038f4:	89 50 08             	mov    %edx,0x8(%eax)
c00038f7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00038fa:	89 50 0c             	mov    %edx,0xc(%eax)
c00038fd:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003900:	89 50 10             	mov    %edx,0x10(%eax)
c0003903:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003906:	89 50 14             	mov    %edx,0x14(%eax)
c0003909:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000390c:	89 50 18             	mov    %edx,0x18(%eax)
c000390f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003912:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003915:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003918:	89 50 20             	mov    %edx,0x20(%eax)
c000391b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000391e:	89 50 24             	mov    %edx,0x24(%eax)
c0003921:	8b 45 08             	mov    0x8(%ebp),%eax
c0003924:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003927:	89 10                	mov    %edx,(%eax)
c0003929:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000392c:	89 50 04             	mov    %edx,0x4(%eax)
c000392f:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003932:	89 50 08             	mov    %edx,0x8(%eax)
c0003935:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003938:	89 50 0c             	mov    %edx,0xc(%eax)
c000393b:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000393e:	89 50 10             	mov    %edx,0x10(%eax)
c0003941:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003944:	89 50 14             	mov    %edx,0x14(%eax)
c0003947:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000394a:	89 50 18             	mov    %edx,0x18(%eax)
c000394d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003950:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003953:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003956:	89 50 20             	mov    %edx,0x20(%eax)
c0003959:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000395c:	89 50 24             	mov    %edx,0x24(%eax)
c000395f:	c9                   	leave  
c0003960:	c3                   	ret    

c0003961 <new_dir_entry>:
c0003961:	55                   	push   %ebp
c0003962:	89 e5                	mov    %esp,%ebp
c0003964:	83 ec 48             	sub    $0x48,%esp
c0003967:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c000396e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003971:	8b 40 04             	mov    0x4(%eax),%eax
c0003974:	99                   	cltd   
c0003975:	f7 7d dc             	idivl  -0x24(%ebp)
c0003978:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000397b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000397e:	8b 40 0c             	mov    0xc(%eax),%eax
c0003981:	99                   	cltd   
c0003982:	f7 7d dc             	idivl  -0x24(%ebp)
c0003985:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003988:	e8 2b 0c 00 00       	call   c00045b8 <get_super_block>
c000398d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003990:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003993:	8b 00                	mov    (%eax),%eax
c0003995:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003998:	8b 45 0c             	mov    0xc(%ebp),%eax
c000399b:	8b 40 0c             	mov    0xc(%eax),%eax
c000399e:	05 00 02 00 00       	add    $0x200,%eax
c00039a3:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00039a9:	85 c0                	test   %eax,%eax
c00039ab:	0f 48 c2             	cmovs  %edx,%eax
c00039ae:	c1 f8 09             	sar    $0x9,%eax
c00039b1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00039b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00039bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00039c2:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c00039c9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00039d0:	eb 7f                	jmp    c0003a51 <new_dir_entry+0xf0>
c00039d2:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c00039d7:	89 c1                	mov    %eax,%ecx
c00039d9:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00039dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00039df:	01 d0                	add    %edx,%eax
c00039e1:	83 ec 0c             	sub    $0xc,%esp
c00039e4:	6a 07                	push   $0x7
c00039e6:	68 00 02 00 00       	push   $0x200
c00039eb:	51                   	push   %ecx
c00039ec:	ff 75 c4             	pushl  -0x3c(%ebp)
c00039ef:	50                   	push   %eax
c00039f0:	e8 07 ee ff ff       	call   c00027fc <rd_wt>
c00039f5:	83 c4 20             	add    $0x20,%esp
c00039f8:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c00039fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a00:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003a07:	eb 25                	jmp    c0003a2e <new_dir_entry+0xcd>
c0003a09:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003a0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003a10:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003a13:	7f 29                	jg     c0003a3e <new_dir_entry+0xdd>
c0003a15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a18:	8b 00                	mov    (%eax),%eax
c0003a1a:	85 c0                	test   %eax,%eax
c0003a1c:	75 08                	jne    c0003a26 <new_dir_entry+0xc5>
c0003a1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a21:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003a24:	eb 19                	jmp    c0003a3f <new_dir_entry+0xde>
c0003a26:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003a2a:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003a2e:	b8 00 02 00 00       	mov    $0x200,%eax
c0003a33:	99                   	cltd   
c0003a34:	f7 7d dc             	idivl  -0x24(%ebp)
c0003a37:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003a3a:	7c cd                	jl     c0003a09 <new_dir_entry+0xa8>
c0003a3c:	eb 01                	jmp    c0003a3f <new_dir_entry+0xde>
c0003a3e:	90                   	nop
c0003a3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003a42:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003a45:	7f 16                	jg     c0003a5d <new_dir_entry+0xfc>
c0003a47:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003a4b:	75 10                	jne    c0003a5d <new_dir_entry+0xfc>
c0003a4d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003a51:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003a54:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003a57:	0f 8c 75 ff ff ff    	jl     c00039d2 <new_dir_entry+0x71>
c0003a5d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003a60:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003a63:	75 0a                	jne    c0003a6f <new_dir_entry+0x10e>
c0003a65:	b8 00 00 00 00       	mov    $0x0,%eax
c0003a6a:	e9 fc 00 00 00       	jmp    c0003b6b <new_dir_entry+0x20a>
c0003a6f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003a76:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003a7a:	75 1e                	jne    c0003a9a <new_dir_entry+0x139>
c0003a7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003a82:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a85:	8b 50 04             	mov    0x4(%eax),%edx
c0003a88:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003a8b:	01 c2                	add    %eax,%edx
c0003a8d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a90:	89 50 04             	mov    %edx,0x4(%eax)
c0003a93:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a9d:	8b 55 14             	mov    0x14(%ebp),%edx
c0003aa0:	89 10                	mov    %edx,(%eax)
c0003aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003aa5:	83 c0 04             	add    $0x4,%eax
c0003aa8:	83 ec 08             	sub    $0x8,%esp
c0003aab:	ff 75 10             	pushl  0x10(%ebp)
c0003aae:	50                   	push   %eax
c0003aaf:	e8 32 88 00 00       	call   c000c2e6 <Strcpy>
c0003ab4:	83 c4 10             	add    $0x10,%esp
c0003ab7:	8b 45 08             	mov    0x8(%ebp),%eax
c0003aba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003abd:	8b 0a                	mov    (%edx),%ecx
c0003abf:	89 08                	mov    %ecx,(%eax)
c0003ac1:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003ac4:	89 48 04             	mov    %ecx,0x4(%eax)
c0003ac7:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003aca:	89 48 08             	mov    %ecx,0x8(%eax)
c0003acd:	8b 52 0c             	mov    0xc(%edx),%edx
c0003ad0:	89 50 0c             	mov    %edx,0xc(%eax)
c0003ad3:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003ad8:	89 c1                	mov    %eax,%ecx
c0003ada:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003add:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003ae0:	01 d0                	add    %edx,%eax
c0003ae2:	83 ec 0c             	sub    $0xc,%esp
c0003ae5:	6a 0a                	push   $0xa
c0003ae7:	68 00 02 00 00       	push   $0x200
c0003aec:	51                   	push   %ecx
c0003aed:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003af0:	50                   	push   %eax
c0003af1:	e8 06 ed ff ff       	call   c00027fc <rd_wt>
c0003af6:	83 c4 20             	add    $0x20,%esp
c0003af9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003afd:	74 69                	je     c0003b68 <new_dir_entry+0x207>
c0003aff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b02:	8b 10                	mov    (%eax),%edx
c0003b04:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003b0a:	8b 50 04             	mov    0x4(%eax),%edx
c0003b0d:	89 15 e4 31 01 c0    	mov    %edx,0xc00131e4
c0003b13:	8b 50 08             	mov    0x8(%eax),%edx
c0003b16:	89 15 e8 31 01 c0    	mov    %edx,0xc00131e8
c0003b1c:	8b 50 0c             	mov    0xc(%eax),%edx
c0003b1f:	89 15 ec 31 01 c0    	mov    %edx,0xc00131ec
c0003b25:	8b 50 10             	mov    0x10(%eax),%edx
c0003b28:	89 15 f0 31 01 c0    	mov    %edx,0xc00131f0
c0003b2e:	8b 50 14             	mov    0x14(%eax),%edx
c0003b31:	89 15 f4 31 01 c0    	mov    %edx,0xc00131f4
c0003b37:	8b 50 18             	mov    0x18(%eax),%edx
c0003b3a:	89 15 f8 31 01 c0    	mov    %edx,0xc00131f8
c0003b40:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003b43:	89 15 fc 31 01 c0    	mov    %edx,0xc00131fc
c0003b49:	8b 50 20             	mov    0x20(%eax),%edx
c0003b4c:	89 15 00 32 01 c0    	mov    %edx,0xc0013200
c0003b52:	8b 40 24             	mov    0x24(%eax),%eax
c0003b55:	a3 04 32 01 c0       	mov    %eax,0xc0013204
c0003b5a:	83 ec 0c             	sub    $0xc,%esp
c0003b5d:	ff 75 0c             	pushl  0xc(%ebp)
c0003b60:	e8 6f 08 00 00       	call   c00043d4 <sync_inode>
c0003b65:	83 c4 10             	add    $0x10,%esp
c0003b68:	8b 45 08             	mov    0x8(%ebp),%eax
c0003b6b:	c9                   	leave  
c0003b6c:	c3                   	ret    

c0003b6d <do_unlink>:
c0003b6d:	55                   	push   %ebp
c0003b6e:	89 e5                	mov    %esp,%ebp
c0003b70:	53                   	push   %ebx
c0003b71:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003b77:	83 ec 08             	sub    $0x8,%esp
c0003b7a:	ff 75 08             	pushl  0x8(%ebp)
c0003b7d:	68 69 b7 00 c0       	push   $0xc000b769
c0003b82:	e8 5c 6c 00 00       	call   c000a7e3 <strcmp>
c0003b87:	83 c4 10             	add    $0x10,%esp
c0003b8a:	85 c0                	test   %eax,%eax
c0003b8c:	75 10                	jne    c0003b9e <do_unlink+0x31>
c0003b8e:	83 ec 0c             	sub    $0xc,%esp
c0003b91:	68 6b b7 00 c0       	push   $0xc000b76b
c0003b96:	e8 85 5f 00 00       	call   c0009b20 <panic>
c0003b9b:	83 c4 10             	add    $0x10,%esp
c0003b9e:	83 ec 0c             	sub    $0xc,%esp
c0003ba1:	ff 75 08             	pushl  0x8(%ebp)
c0003ba4:	e8 31 f5 ff ff       	call   c00030da <search_file>
c0003ba9:	83 c4 10             	add    $0x10,%esp
c0003bac:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003baf:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003bb3:	75 10                	jne    c0003bc5 <do_unlink+0x58>
c0003bb5:	83 ec 0c             	sub    $0xc,%esp
c0003bb8:	68 87 b7 00 c0       	push   $0xc000b787
c0003bbd:	e8 5e 5f 00 00       	call   c0009b20 <panic>
c0003bc2:	83 c4 10             	add    $0x10,%esp
c0003bc5:	83 ec 08             	sub    $0x8,%esp
c0003bc8:	ff 75 d0             	pushl  -0x30(%ebp)
c0003bcb:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003bd1:	50                   	push   %eax
c0003bd2:	e8 01 f7 ff ff       	call   c00032d8 <get_inode>
c0003bd7:	83 c4 10             	add    $0x10,%esp
c0003bda:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003bdd:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003be1:	75 10                	jne    c0003bf3 <do_unlink+0x86>
c0003be3:	83 ec 0c             	sub    $0xc,%esp
c0003be6:	68 87 b7 00 c0       	push   $0xc000b787
c0003beb:	e8 30 5f 00 00       	call   c0009b20 <panic>
c0003bf0:	83 c4 10             	add    $0x10,%esp
c0003bf3:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003bf6:	85 c0                	test   %eax,%eax
c0003bf8:	7e 10                	jle    c0003c0a <do_unlink+0x9d>
c0003bfa:	83 ec 0c             	sub    $0xc,%esp
c0003bfd:	68 a0 b7 00 c0       	push   $0xc000b7a0
c0003c02:	e8 19 5f 00 00       	call   c0009b20 <panic>
c0003c07:	83 c4 10             	add    $0x10,%esp
c0003c0a:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003c10:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003c13:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003c16:	8d 50 07             	lea    0x7(%eax),%edx
c0003c19:	85 c0                	test   %eax,%eax
c0003c1b:	0f 48 c2             	cmovs  %edx,%eax
c0003c1e:	c1 f8 03             	sar    $0x3,%eax
c0003c21:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003c24:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003c27:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003c2d:	85 c0                	test   %eax,%eax
c0003c2f:	0f 48 c2             	cmovs  %edx,%eax
c0003c32:	c1 f8 09             	sar    $0x9,%eax
c0003c35:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003c38:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003c3b:	99                   	cltd   
c0003c3c:	c1 ea 1d             	shr    $0x1d,%edx
c0003c3f:	01 d0                	add    %edx,%eax
c0003c41:	83 e0 07             	and    $0x7,%eax
c0003c44:	29 d0                	sub    %edx,%eax
c0003c46:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003c49:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003c50:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003c55:	89 c2                	mov    %eax,%edx
c0003c57:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003c5a:	83 c0 02             	add    $0x2,%eax
c0003c5d:	83 ec 0c             	sub    $0xc,%esp
c0003c60:	6a 07                	push   $0x7
c0003c62:	68 00 02 00 00       	push   $0x200
c0003c67:	52                   	push   %edx
c0003c68:	ff 75 b8             	pushl  -0x48(%ebp)
c0003c6b:	50                   	push   %eax
c0003c6c:	e8 8b eb ff ff       	call   c00027fc <rd_wt>
c0003c71:	83 c4 20             	add    $0x20,%esp
c0003c74:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003c7a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003c7d:	01 d0                	add    %edx,%eax
c0003c7f:	0f b6 10             	movzbl (%eax),%edx
c0003c82:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003c85:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003c8a:	89 c1                	mov    %eax,%ecx
c0003c8c:	d3 e3                	shl    %cl,%ebx
c0003c8e:	89 d8                	mov    %ebx,%eax
c0003c90:	f7 d0                	not    %eax
c0003c92:	89 c3                	mov    %eax,%ebx
c0003c94:	8b 0d c4 31 01 c0    	mov    0xc00131c4,%ecx
c0003c9a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003c9d:	01 c8                	add    %ecx,%eax
c0003c9f:	21 da                	and    %ebx,%edx
c0003ca1:	88 10                	mov    %dl,(%eax)
c0003ca3:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003ca8:	89 c2                	mov    %eax,%edx
c0003caa:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003cad:	83 c0 02             	add    $0x2,%eax
c0003cb0:	83 ec 0c             	sub    $0xc,%esp
c0003cb3:	6a 0a                	push   $0xa
c0003cb5:	68 00 02 00 00       	push   $0x200
c0003cba:	52                   	push   %edx
c0003cbb:	ff 75 b8             	pushl  -0x48(%ebp)
c0003cbe:	50                   	push   %eax
c0003cbf:	e8 38 eb ff ff       	call   c00027fc <rd_wt>
c0003cc4:	83 c4 20             	add    $0x20,%esp
c0003cc7:	e8 ec 08 00 00       	call   c00045b8 <get_super_block>
c0003ccc:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003ccf:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003cd5:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003cd8:	8b 00                	mov    (%eax),%eax
c0003cda:	29 c2                	sub    %eax,%edx
c0003cdc:	89 d0                	mov    %edx,%eax
c0003cde:	83 c0 01             	add    $0x1,%eax
c0003ce1:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003ce4:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003ce7:	8d 50 07             	lea    0x7(%eax),%edx
c0003cea:	85 c0                	test   %eax,%eax
c0003cec:	0f 48 c2             	cmovs  %edx,%eax
c0003cef:	c1 f8 03             	sar    $0x3,%eax
c0003cf2:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003cf5:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003cf8:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003cfe:	85 c0                	test   %eax,%eax
c0003d00:	0f 48 c2             	cmovs  %edx,%eax
c0003d03:	c1 f8 09             	sar    $0x9,%eax
c0003d06:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003d09:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003d0c:	99                   	cltd   
c0003d0d:	c1 ea 1d             	shr    $0x1d,%edx
c0003d10:	01 d0                	add    %edx,%eax
c0003d12:	83 e0 07             	and    $0x7,%eax
c0003d15:	29 d0                	sub    %edx,%eax
c0003d17:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003d1a:	b8 08 00 00 00       	mov    $0x8,%eax
c0003d1f:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003d22:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003d25:	29 c2                	sub    %eax,%edx
c0003d27:	89 d0                	mov    %edx,%eax
c0003d29:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003d2f:	8d 50 07             	lea    0x7(%eax),%edx
c0003d32:	85 c0                	test   %eax,%eax
c0003d34:	0f 48 c2             	cmovs  %edx,%eax
c0003d37:	c1 f8 03             	sar    $0x3,%eax
c0003d3a:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003d3d:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003d42:	89 c1                	mov    %eax,%ecx
c0003d44:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003d47:	8b 40 04             	mov    0x4(%eax),%eax
c0003d4a:	8d 50 02             	lea    0x2(%eax),%edx
c0003d4d:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003d50:	01 d0                	add    %edx,%eax
c0003d52:	83 ec 0c             	sub    $0xc,%esp
c0003d55:	6a 07                	push   $0x7
c0003d57:	68 00 02 00 00       	push   $0x200
c0003d5c:	51                   	push   %ecx
c0003d5d:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d60:	50                   	push   %eax
c0003d61:	e8 96 ea ff ff       	call   c00027fc <rd_wt>
c0003d66:	83 c4 20             	add    $0x20,%esp
c0003d69:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003d6f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003d72:	01 d0                	add    %edx,%eax
c0003d74:	0f b6 10             	movzbl (%eax),%edx
c0003d77:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003d7a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003d7f:	89 c1                	mov    %eax,%ecx
c0003d81:	d3 e3                	shl    %cl,%ebx
c0003d83:	89 d8                	mov    %ebx,%eax
c0003d85:	f7 d0                	not    %eax
c0003d87:	89 c3                	mov    %eax,%ebx
c0003d89:	8b 0d c4 31 01 c0    	mov    0xc00131c4,%ecx
c0003d8f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003d92:	01 c8                	add    %ecx,%eax
c0003d94:	21 da                	and    %ebx,%edx
c0003d96:	88 10                	mov    %dl,(%eax)
c0003d98:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003d9f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003da2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003da5:	eb 6b                	jmp    c0003e12 <do_unlink+0x2a5>
c0003da7:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003dae:	75 4c                	jne    c0003dfc <do_unlink+0x28f>
c0003db0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003db7:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003dbc:	83 ec 0c             	sub    $0xc,%esp
c0003dbf:	6a 0a                	push   $0xa
c0003dc1:	68 00 02 00 00       	push   $0x200
c0003dc6:	50                   	push   %eax
c0003dc7:	ff 75 b8             	pushl  -0x48(%ebp)
c0003dca:	ff 75 ec             	pushl  -0x14(%ebp)
c0003dcd:	e8 2a ea ff ff       	call   c00027fc <rd_wt>
c0003dd2:	83 c4 20             	add    $0x20,%esp
c0003dd5:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003dda:	89 c1                	mov    %eax,%ecx
c0003ddc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003ddf:	8d 50 01             	lea    0x1(%eax),%edx
c0003de2:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003de5:	83 ec 0c             	sub    $0xc,%esp
c0003de8:	6a 07                	push   $0x7
c0003dea:	68 00 02 00 00       	push   $0x200
c0003def:	51                   	push   %ecx
c0003df0:	ff 75 b8             	pushl  -0x48(%ebp)
c0003df3:	50                   	push   %eax
c0003df4:	e8 03 ea ff ff       	call   c00027fc <rd_wt>
c0003df9:	83 c4 20             	add    $0x20,%esp
c0003dfc:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003e02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e05:	01 d0                	add    %edx,%eax
c0003e07:	c6 00 00             	movb   $0x0,(%eax)
c0003e0a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003e0e:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0003e12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e15:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0003e18:	7c 8d                	jl     c0003da7 <do_unlink+0x23a>
c0003e1a:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003e21:	75 4c                	jne    c0003e6f <do_unlink+0x302>
c0003e23:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003e2a:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003e2f:	83 ec 0c             	sub    $0xc,%esp
c0003e32:	6a 0a                	push   $0xa
c0003e34:	68 00 02 00 00       	push   $0x200
c0003e39:	50                   	push   %eax
c0003e3a:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e3d:	ff 75 ec             	pushl  -0x14(%ebp)
c0003e40:	e8 b7 e9 ff ff       	call   c00027fc <rd_wt>
c0003e45:	83 c4 20             	add    $0x20,%esp
c0003e48:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003e4d:	89 c1                	mov    %eax,%ecx
c0003e4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003e52:	8d 50 01             	lea    0x1(%eax),%edx
c0003e55:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003e58:	83 ec 0c             	sub    $0xc,%esp
c0003e5b:	6a 07                	push   $0x7
c0003e5d:	68 00 02 00 00       	push   $0x200
c0003e62:	51                   	push   %ecx
c0003e63:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e66:	50                   	push   %eax
c0003e67:	e8 90 e9 ff ff       	call   c00027fc <rd_wt>
c0003e6c:	83 c4 20             	add    $0x20,%esp
c0003e6f:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003e75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e78:	01 d0                	add    %edx,%eax
c0003e7a:	0f b6 10             	movzbl (%eax),%edx
c0003e7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e80:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003e85:	89 c1                	mov    %eax,%ecx
c0003e87:	d3 e3                	shl    %cl,%ebx
c0003e89:	89 d8                	mov    %ebx,%eax
c0003e8b:	89 c3                	mov    %eax,%ebx
c0003e8d:	8b 0d c4 31 01 c0    	mov    0xc00131c4,%ecx
c0003e93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e96:	01 c8                	add    %ecx,%eax
c0003e98:	21 da                	and    %ebx,%edx
c0003e9a:	88 10                	mov    %dl,(%eax)
c0003e9c:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003ea1:	83 ec 0c             	sub    $0xc,%esp
c0003ea4:	6a 0a                	push   $0xa
c0003ea6:	68 00 02 00 00       	push   $0x200
c0003eab:	50                   	push   %eax
c0003eac:	ff 75 b8             	pushl  -0x48(%ebp)
c0003eaf:	ff 75 ec             	pushl  -0x14(%ebp)
c0003eb2:	e8 45 e9 ff ff       	call   c00027fc <rd_wt>
c0003eb7:	83 c4 20             	add    $0x20,%esp
c0003eba:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0003ec1:	00 00 00 
c0003ec4:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0003ecb:	00 00 00 
c0003ece:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0003ed5:	00 00 00 
c0003ed8:	83 ec 0c             	sub    $0xc,%esp
c0003edb:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003ee1:	50                   	push   %eax
c0003ee2:	e8 ed 04 00 00       	call   c00043d4 <sync_inode>
c0003ee7:	83 c4 10             	add    $0x10,%esp
c0003eea:	83 ec 0c             	sub    $0xc,%esp
c0003eed:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003ef3:	50                   	push   %eax
c0003ef4:	e8 2f 06 00 00       	call   c0004528 <put_inode>
c0003ef9:	83 c4 10             	add    $0x10,%esp
c0003efc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003eff:	8b 00                	mov    (%eax),%eax
c0003f01:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0003f04:	c7 45 98 e0 31 01 c0 	movl   $0xc00131e0,-0x68(%ebp)
c0003f0b:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003f0e:	8b 40 04             	mov    0x4(%eax),%eax
c0003f11:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0003f14:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003f17:	8b 40 0c             	mov    0xc(%eax),%eax
c0003f1a:	89 45 90             	mov    %eax,-0x70(%ebp)
c0003f1d:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0003f20:	c1 e8 04             	shr    $0x4,%eax
c0003f23:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0003f26:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003f2d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003f34:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003f3b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0003f42:	e9 a5 00 00 00       	jmp    c0003fec <do_unlink+0x47f>
c0003f47:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0003f4c:	89 c1                	mov    %eax,%ecx
c0003f4e:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003f51:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003f54:	01 d0                	add    %edx,%eax
c0003f56:	83 ec 0c             	sub    $0xc,%esp
c0003f59:	6a 07                	push   $0x7
c0003f5b:	68 00 02 00 00       	push   $0x200
c0003f60:	51                   	push   %ecx
c0003f61:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f64:	50                   	push   %eax
c0003f65:	e8 92 e8 ff ff       	call   c00027fc <rd_wt>
c0003f6a:	83 c4 20             	add    $0x20,%esp
c0003f6d:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c0003f72:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003f75:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0003f7c:	eb 51                	jmp    c0003fcf <do_unlink+0x462>
c0003f7e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003f82:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003f85:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003f88:	7f 4f                	jg     c0003fd9 <do_unlink+0x46c>
c0003f8a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003f8d:	83 c0 10             	add    $0x10,%eax
c0003f90:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003f93:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003f96:	83 c0 04             	add    $0x4,%eax
c0003f99:	83 ec 08             	sub    $0x8,%esp
c0003f9c:	ff 75 08             	pushl  0x8(%ebp)
c0003f9f:	50                   	push   %eax
c0003fa0:	e8 3e 68 00 00       	call   c000a7e3 <strcmp>
c0003fa5:	83 c4 10             	add    $0x10,%esp
c0003fa8:	85 c0                	test   %eax,%eax
c0003faa:	75 1b                	jne    c0003fc7 <do_unlink+0x45a>
c0003fac:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0003fb3:	83 ec 04             	sub    $0x4,%esp
c0003fb6:	6a 10                	push   $0x10
c0003fb8:	6a 00                	push   $0x0
c0003fba:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003fbd:	e8 05 83 00 00       	call   c000c2c7 <Memset>
c0003fc2:	83 c4 10             	add    $0x10,%esp
c0003fc5:	eb 13                	jmp    c0003fda <do_unlink+0x46d>
c0003fc7:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0003fcb:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0003fcf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003fd2:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003fd5:	7c a7                	jl     c0003f7e <do_unlink+0x411>
c0003fd7:	eb 01                	jmp    c0003fda <do_unlink+0x46d>
c0003fd9:	90                   	nop
c0003fda:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003fdd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003fe0:	7f 16                	jg     c0003ff8 <do_unlink+0x48b>
c0003fe2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003fe6:	75 10                	jne    c0003ff8 <do_unlink+0x48b>
c0003fe8:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0003fec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003fef:	3b 45 90             	cmp    -0x70(%ebp),%eax
c0003ff2:	0f 8c 4f ff ff ff    	jl     c0003f47 <do_unlink+0x3da>
c0003ff8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003ffb:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0003ffe:	75 17                	jne    c0004017 <do_unlink+0x4aa>
c0004000:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004003:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0004006:	89 50 04             	mov    %edx,0x4(%eax)
c0004009:	83 ec 0c             	sub    $0xc,%esp
c000400c:	ff 75 98             	pushl  -0x68(%ebp)
c000400f:	e8 c0 03 00 00       	call   c00043d4 <sync_inode>
c0004014:	83 c4 10             	add    $0x10,%esp
c0004017:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000401b:	74 26                	je     c0004043 <do_unlink+0x4d6>
c000401d:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0004022:	89 c1                	mov    %eax,%ecx
c0004024:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004027:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000402a:	01 d0                	add    %edx,%eax
c000402c:	83 ec 0c             	sub    $0xc,%esp
c000402f:	6a 0a                	push   $0xa
c0004031:	68 00 02 00 00       	push   $0x200
c0004036:	51                   	push   %ecx
c0004037:	ff 75 b8             	pushl  -0x48(%ebp)
c000403a:	50                   	push   %eax
c000403b:	e8 bc e7 ff ff       	call   c00027fc <rd_wt>
c0004040:	83 c4 20             	add    $0x20,%esp
c0004043:	90                   	nop
c0004044:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004047:	c9                   	leave  
c0004048:	c3                   	ret    

c0004049 <do_rdwt>:
c0004049:	55                   	push   %ebp
c000404a:	89 e5                	mov    %esp,%ebp
c000404c:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0004052:	8b 45 08             	mov    0x8(%ebp),%eax
c0004055:	8b 40 78             	mov    0x78(%eax),%eax
c0004058:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000405b:	8b 45 08             	mov    0x8(%ebp),%eax
c000405e:	8b 40 60             	mov    0x60(%eax),%eax
c0004061:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004064:	8b 45 08             	mov    0x8(%ebp),%eax
c0004067:	8b 40 6c             	mov    0x6c(%eax),%eax
c000406a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000406d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004070:	8b 00                	mov    (%eax),%eax
c0004072:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004075:	8b 45 08             	mov    0x8(%ebp),%eax
c0004078:	8b 40 10             	mov    0x10(%eax),%eax
c000407b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000407e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004081:	8b 40 50             	mov    0x50(%eax),%eax
c0004084:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004087:	83 ec 0c             	sub    $0xc,%esp
c000408a:	ff 75 d0             	pushl  -0x30(%ebp)
c000408d:	e8 2a 07 00 00       	call   c00047bc <pid2proc>
c0004092:	83 c4 10             	add    $0x10,%esp
c0004095:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004098:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000409b:	8b 55 c8             	mov    -0x38(%ebp),%edx
c000409e:	83 c2 50             	add    $0x50,%edx
c00040a1:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00040a5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00040a8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00040ab:	8b 40 08             	mov    0x8(%eax),%eax
c00040ae:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00040b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00040b4:	8b 00                	mov    (%eax),%eax
c00040b6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00040b9:	83 ec 08             	sub    $0x8,%esp
c00040bc:	ff 75 bc             	pushl  -0x44(%ebp)
c00040bf:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00040c5:	50                   	push   %eax
c00040c6:	e8 0d f2 ff ff       	call   c00032d8 <get_inode>
c00040cb:	83 c4 10             	add    $0x10,%esp
c00040ce:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00040d1:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c00040d5:	75 10                	jne    c00040e7 <do_rdwt+0x9e>
c00040d7:	83 ec 0c             	sub    $0xc,%esp
c00040da:	68 d8 b7 00 c0       	push   $0xc000b7d8
c00040df:	e8 3c 5a 00 00       	call   c0009b20 <panic>
c00040e4:	83 c4 10             	add    $0x10,%esp
c00040e7:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00040ed:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00040f0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00040f3:	8b 40 04             	mov    0x4(%eax),%eax
c00040f6:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00040f9:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00040fd:	74 22                	je     c0004121 <do_rdwt+0xd8>
c00040ff:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004103:	74 1c                	je     c0004121 <do_rdwt+0xd8>
c0004105:	68 a7 04 00 00       	push   $0x4a7
c000410a:	68 44 b6 00 c0       	push   $0xc000b644
c000410f:	68 44 b6 00 c0       	push   $0xc000b644
c0004114:	68 e8 b7 00 c0       	push   $0xc000b7e8
c0004119:	e8 20 5a 00 00       	call   c0009b3e <assertion_failure>
c000411e:	83 c4 10             	add    $0x10,%esp
c0004121:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0004127:	83 f8 01             	cmp    $0x1,%eax
c000412a:	0f 85 86 00 00 00    	jne    c00041b6 <do_rdwt+0x16d>
c0004130:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004134:	75 09                	jne    c000413f <do_rdwt+0xf6>
c0004136:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c000413d:	eb 0d                	jmp    c000414c <do_rdwt+0x103>
c000413f:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004143:	75 07                	jne    c000414c <do_rdwt+0x103>
c0004145:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c000414c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000414f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004152:	89 50 78             	mov    %edx,0x78(%eax)
c0004155:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0004158:	8b 45 08             	mov    0x8(%ebp),%eax
c000415b:	89 50 68             	mov    %edx,0x68(%eax)
c000415e:	83 ec 04             	sub    $0x4,%esp
c0004161:	6a 04                	push   $0x4
c0004163:	ff 75 08             	pushl  0x8(%ebp)
c0004166:	6a 03                	push   $0x3
c0004168:	e8 0e 63 00 00       	call   c000a47b <send_rec>
c000416d:	83 c4 10             	add    $0x10,%esp
c0004170:	8b 45 08             	mov    0x8(%ebp),%eax
c0004173:	8b 40 78             	mov    0x78(%eax),%eax
c0004176:	83 f8 66             	cmp    $0x66,%eax
c0004179:	75 13                	jne    c000418e <do_rdwt+0x145>
c000417b:	83 ec 04             	sub    $0x4,%esp
c000417e:	ff 75 b8             	pushl  -0x48(%ebp)
c0004181:	ff 75 08             	pushl  0x8(%ebp)
c0004184:	6a 01                	push   $0x1
c0004186:	e8 f0 62 00 00       	call   c000a47b <send_rec>
c000418b:	83 c4 10             	add    $0x10,%esp
c000418e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004191:	8b 40 78             	mov    0x78(%eax),%eax
c0004194:	83 f8 65             	cmp    $0x65,%eax
c0004197:	75 13                	jne    c00041ac <do_rdwt+0x163>
c0004199:	83 ec 04             	sub    $0x4,%esp
c000419c:	ff 75 b8             	pushl  -0x48(%ebp)
c000419f:	ff 75 08             	pushl  0x8(%ebp)
c00041a2:	6a 01                	push   $0x1
c00041a4:	e8 d2 62 00 00       	call   c000a47b <send_rec>
c00041a9:	83 c4 10             	add    $0x10,%esp
c00041ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00041b1:	e9 1c 02 00 00       	jmp    c00043d2 <do_rdwt+0x389>
c00041b6:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00041ba:	75 18                	jne    c00041d4 <do_rdwt+0x18b>
c00041bc:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00041c2:	c1 e0 09             	shl    $0x9,%eax
c00041c5:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c00041c8:	75 0a                	jne    c00041d4 <do_rdwt+0x18b>
c00041ca:	b8 00 00 00 00       	mov    $0x0,%eax
c00041cf:	e9 fe 01 00 00       	jmp    c00043d2 <do_rdwt+0x389>
c00041d4:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00041d8:	75 14                	jne    c00041ee <do_rdwt+0x1a5>
c00041da:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00041dd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00041e0:	01 d0                	add    %edx,%eax
c00041e2:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c00041e5:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c00041e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00041ec:	eb 19                	jmp    c0004207 <do_rdwt+0x1be>
c00041ee:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00041f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00041f4:	01 c2                	add    %eax,%edx
c00041f6:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00041fc:	c1 e0 09             	shl    $0x9,%eax
c00041ff:	39 c2                	cmp    %eax,%edx
c0004201:	0f 4e c2             	cmovle %edx,%eax
c0004204:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004207:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000420a:	99                   	cltd   
c000420b:	c1 ea 17             	shr    $0x17,%edx
c000420e:	01 d0                	add    %edx,%eax
c0004210:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004215:	29 d0                	sub    %edx,%eax
c0004217:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000421a:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0004220:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0004223:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004229:	85 c0                	test   %eax,%eax
c000422b:	0f 48 c1             	cmovs  %ecx,%eax
c000422e:	c1 f8 09             	sar    $0x9,%eax
c0004231:	01 d0                	add    %edx,%eax
c0004233:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004236:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000423c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000423f:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004245:	85 c0                	test   %eax,%eax
c0004247:	0f 48 c1             	cmovs  %ecx,%eax
c000424a:	c1 f8 09             	sar    $0x9,%eax
c000424d:	01 d0                	add    %edx,%eax
c000424f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004252:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004255:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004258:	ba 00 00 10 00       	mov    $0x100000,%edx
c000425d:	39 d0                	cmp    %edx,%eax
c000425f:	7d 0b                	jge    c000426c <do_rdwt+0x223>
c0004261:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004264:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004267:	83 c0 01             	add    $0x1,%eax
c000426a:	eb 05                	jmp    c0004271 <do_rdwt+0x228>
c000426c:	b8 00 00 10 00       	mov    $0x100000,%eax
c0004271:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004274:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004277:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000427a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004281:	8b 45 08             	mov    0x8(%ebp),%eax
c0004284:	8b 00                	mov    (%eax),%eax
c0004286:	83 ec 0c             	sub    $0xc,%esp
c0004289:	50                   	push   %eax
c000428a:	e8 2d 05 00 00       	call   c00047bc <pid2proc>
c000428f:	83 c4 10             	add    $0x10,%esp
c0004292:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004295:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004298:	83 ec 08             	sub    $0x8,%esp
c000429b:	50                   	push   %eax
c000429c:	ff 75 cc             	pushl  -0x34(%ebp)
c000429f:	e8 a7 2b 00 00       	call   c0006e4b <alloc_virtual_memory>
c00042a4:	83 c4 10             	add    $0x10,%esp
c00042a7:	89 45 98             	mov    %eax,-0x68(%ebp)
c00042aa:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00042ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00042b0:	e9 c5 00 00 00       	jmp    c000437a <do_rdwt+0x331>
c00042b5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00042b8:	c1 e0 09             	shl    $0x9,%eax
c00042bb:	2b 45 ec             	sub    -0x14(%ebp),%eax
c00042be:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00042c1:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c00042c5:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00042c8:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c00042cf:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00042d3:	75 46                	jne    c000431b <do_rdwt+0x2d2>
c00042d5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00042d8:	c1 e0 09             	shl    $0x9,%eax
c00042db:	8b 15 a4 27 01 c0    	mov    0xc00127a4,%edx
c00042e1:	83 ec 0c             	sub    $0xc,%esp
c00042e4:	6a 07                	push   $0x7
c00042e6:	50                   	push   %eax
c00042e7:	52                   	push   %edx
c00042e8:	ff 75 90             	pushl  -0x70(%ebp)
c00042eb:	ff 75 e0             	pushl  -0x20(%ebp)
c00042ee:	e8 09 e5 ff ff       	call   c00027fc <rd_wt>
c00042f3:	83 c4 20             	add    $0x20,%esp
c00042f6:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00042fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00042ff:	01 d0                	add    %edx,%eax
c0004301:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0004304:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0004307:	01 ca                	add    %ecx,%edx
c0004309:	83 ec 04             	sub    $0x4,%esp
c000430c:	ff 75 94             	pushl  -0x6c(%ebp)
c000430f:	50                   	push   %eax
c0004310:	52                   	push   %edx
c0004311:	e8 71 38 00 00       	call   c0007b87 <Memcpy>
c0004316:	83 c4 10             	add    $0x10,%esp
c0004319:	eb 46                	jmp    c0004361 <do_rdwt+0x318>
c000431b:	8b 55 98             	mov    -0x68(%ebp),%edx
c000431e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004321:	01 d0                	add    %edx,%eax
c0004323:	89 c1                	mov    %eax,%ecx
c0004325:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c000432b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000432e:	01 d0                	add    %edx,%eax
c0004330:	83 ec 04             	sub    $0x4,%esp
c0004333:	ff 75 94             	pushl  -0x6c(%ebp)
c0004336:	51                   	push   %ecx
c0004337:	50                   	push   %eax
c0004338:	e8 4a 38 00 00       	call   c0007b87 <Memcpy>
c000433d:	83 c4 10             	add    $0x10,%esp
c0004340:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004343:	c1 e0 09             	shl    $0x9,%eax
c0004346:	8b 15 a4 27 01 c0    	mov    0xc00127a4,%edx
c000434c:	83 ec 0c             	sub    $0xc,%esp
c000434f:	6a 0a                	push   $0xa
c0004351:	50                   	push   %eax
c0004352:	52                   	push   %edx
c0004353:	ff 75 90             	pushl  -0x70(%ebp)
c0004356:	ff 75 e0             	pushl  -0x20(%ebp)
c0004359:	e8 9e e4 ff ff       	call   c00027fc <rd_wt>
c000435e:	83 c4 20             	add    $0x20,%esp
c0004361:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004364:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0004367:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000436a:	01 45 e4             	add    %eax,-0x1c(%ebp)
c000436d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0004374:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004377:	01 45 e0             	add    %eax,-0x20(%ebp)
c000437a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000437d:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0004380:	7f 0a                	jg     c000438c <do_rdwt+0x343>
c0004382:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004386:	0f 85 29 ff ff ff    	jne    c00042b5 <do_rdwt+0x26c>
c000438c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000438f:	8b 50 04             	mov    0x4(%eax),%edx
c0004392:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004395:	01 c2                	add    %eax,%edx
c0004397:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000439a:	89 50 04             	mov    %edx,0x4(%eax)
c000439d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00043a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00043a3:	01 c2                	add    %eax,%edx
c00043a5:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00043ab:	39 c2                	cmp    %eax,%edx
c00043ad:	7e 20                	jle    c00043cf <do_rdwt+0x386>
c00043af:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00043b2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00043b5:	01 d0                	add    %edx,%eax
c00043b7:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00043bd:	83 ec 0c             	sub    $0xc,%esp
c00043c0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00043c6:	50                   	push   %eax
c00043c7:	e8 08 00 00 00       	call   c00043d4 <sync_inode>
c00043cc:	83 c4 10             	add    $0x10,%esp
c00043cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00043d2:	c9                   	leave  
c00043d3:	c3                   	ret    

c00043d4 <sync_inode>:
c00043d4:	55                   	push   %ebp
c00043d5:	89 e5                	mov    %esp,%ebp
c00043d7:	53                   	push   %ebx
c00043d8:	83 ec 34             	sub    $0x34,%esp
c00043db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00043e2:	eb 74                	jmp    c0004458 <sync_inode+0x84>
c00043e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00043e7:	89 d0                	mov    %edx,%eax
c00043e9:	c1 e0 02             	shl    $0x2,%eax
c00043ec:	01 d0                	add    %edx,%eax
c00043ee:	c1 e0 03             	shl    $0x3,%eax
c00043f1:	05 d0 27 01 c0       	add    $0xc00127d0,%eax
c00043f6:	8b 10                	mov    (%eax),%edx
c00043f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00043fb:	8b 40 10             	mov    0x10(%eax),%eax
c00043fe:	39 c2                	cmp    %eax,%edx
c0004400:	75 52                	jne    c0004454 <sync_inode+0x80>
c0004402:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004405:	89 d0                	mov    %edx,%eax
c0004407:	c1 e0 02             	shl    $0x2,%eax
c000440a:	01 d0                	add    %edx,%eax
c000440c:	c1 e0 03             	shl    $0x3,%eax
c000440f:	8d 90 c0 27 01 c0    	lea    -0x3ffed840(%eax),%edx
c0004415:	8b 45 08             	mov    0x8(%ebp),%eax
c0004418:	8b 08                	mov    (%eax),%ecx
c000441a:	89 0a                	mov    %ecx,(%edx)
c000441c:	8b 48 04             	mov    0x4(%eax),%ecx
c000441f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004422:	8b 48 08             	mov    0x8(%eax),%ecx
c0004425:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004428:	8b 48 0c             	mov    0xc(%eax),%ecx
c000442b:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000442e:	8b 48 10             	mov    0x10(%eax),%ecx
c0004431:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004434:	8b 48 14             	mov    0x14(%eax),%ecx
c0004437:	89 4a 14             	mov    %ecx,0x14(%edx)
c000443a:	8b 48 18             	mov    0x18(%eax),%ecx
c000443d:	89 4a 18             	mov    %ecx,0x18(%edx)
c0004440:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0004443:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004446:	8b 48 20             	mov    0x20(%eax),%ecx
c0004449:	89 4a 20             	mov    %ecx,0x20(%edx)
c000444c:	8b 40 24             	mov    0x24(%eax),%eax
c000444f:	89 42 24             	mov    %eax,0x24(%edx)
c0004452:	eb 0a                	jmp    c000445e <sync_inode+0x8a>
c0004454:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004458:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c000445c:	7e 86                	jle    c00043e4 <sync_inode+0x10>
c000445e:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0004465:	8b 45 08             	mov    0x8(%ebp),%eax
c0004468:	8b 40 10             	mov    0x10(%eax),%eax
c000446b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000446e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004471:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004474:	b8 00 02 00 00       	mov    $0x200,%eax
c0004479:	99                   	cltd   
c000447a:	f7 7d f0             	idivl  -0x10(%ebp)
c000447d:	89 c3                	mov    %eax,%ebx
c000447f:	89 c8                	mov    %ecx,%eax
c0004481:	99                   	cltd   
c0004482:	f7 fb                	idiv   %ebx
c0004484:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004487:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000448a:	8d 48 ff             	lea    -0x1(%eax),%ecx
c000448d:	b8 00 02 00 00       	mov    $0x200,%eax
c0004492:	99                   	cltd   
c0004493:	f7 7d f0             	idivl  -0x10(%ebp)
c0004496:	89 c3                	mov    %eax,%ebx
c0004498:	89 c8                	mov    %ecx,%eax
c000449a:	99                   	cltd   
c000449b:	f7 fb                	idiv   %ebx
c000449d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00044a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00044a3:	8b 40 20             	mov    0x20(%eax),%eax
c00044a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00044a9:	e8 0a 01 00 00       	call   c00045b8 <get_super_block>
c00044ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00044b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00044b4:	8b 40 04             	mov    0x4(%eax),%eax
c00044b7:	8d 50 02             	lea    0x2(%eax),%edx
c00044ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00044bd:	8b 40 08             	mov    0x8(%eax),%eax
c00044c0:	01 c2                	add    %eax,%edx
c00044c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00044c5:	01 d0                	add    %edx,%eax
c00044c7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00044ca:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c00044cf:	83 ec 0c             	sub    $0xc,%esp
c00044d2:	6a 07                	push   $0x7
c00044d4:	68 00 02 00 00       	push   $0x200
c00044d9:	50                   	push   %eax
c00044da:	ff 75 e0             	pushl  -0x20(%ebp)
c00044dd:	ff 75 d8             	pushl  -0x28(%ebp)
c00044e0:	e8 17 e3 ff ff       	call   c00027fc <rd_wt>
c00044e5:	83 c4 20             	add    $0x20,%esp
c00044e8:	a1 c4 31 01 c0       	mov    0xc00131c4,%eax
c00044ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00044f0:	83 ec 04             	sub    $0x4,%esp
c00044f3:	ff 75 f0             	pushl  -0x10(%ebp)
c00044f6:	ff 75 08             	pushl  0x8(%ebp)
c00044f9:	ff 75 d4             	pushl  -0x2c(%ebp)
c00044fc:	e8 86 36 00 00       	call   c0007b87 <Memcpy>
c0004501:	83 c4 10             	add    $0x10,%esp
c0004504:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c0004509:	83 ec 0c             	sub    $0xc,%esp
c000450c:	6a 0a                	push   $0xa
c000450e:	68 00 02 00 00       	push   $0x200
c0004513:	50                   	push   %eax
c0004514:	ff 75 e0             	pushl  -0x20(%ebp)
c0004517:	ff 75 d8             	pushl  -0x28(%ebp)
c000451a:	e8 dd e2 ff ff       	call   c00027fc <rd_wt>
c000451f:	83 c4 20             	add    $0x20,%esp
c0004522:	90                   	nop
c0004523:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004526:	c9                   	leave  
c0004527:	c3                   	ret    

c0004528 <put_inode>:
c0004528:	55                   	push   %ebp
c0004529:	89 e5                	mov    %esp,%ebp
c000452b:	83 ec 08             	sub    $0x8,%esp
c000452e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004531:	8b 40 24             	mov    0x24(%eax),%eax
c0004534:	85 c0                	test   %eax,%eax
c0004536:	7f 1c                	jg     c0004554 <put_inode+0x2c>
c0004538:	68 4c 05 00 00       	push   $0x54c
c000453d:	68 44 b6 00 c0       	push   $0xc000b644
c0004542:	68 44 b6 00 c0       	push   $0xc000b644
c0004547:	68 1c b8 00 c0       	push   $0xc000b81c
c000454c:	e8 ed 55 00 00       	call   c0009b3e <assertion_failure>
c0004551:	83 c4 10             	add    $0x10,%esp
c0004554:	8b 45 08             	mov    0x8(%ebp),%eax
c0004557:	8b 40 24             	mov    0x24(%eax),%eax
c000455a:	8d 50 ff             	lea    -0x1(%eax),%edx
c000455d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004560:	89 50 24             	mov    %edx,0x24(%eax)
c0004563:	90                   	nop
c0004564:	c9                   	leave  
c0004565:	c3                   	ret    

c0004566 <do_close>:
c0004566:	55                   	push   %ebp
c0004567:	89 e5                	mov    %esp,%ebp
c0004569:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c000456e:	8b 55 08             	mov    0x8(%ebp),%edx
c0004571:	83 c2 50             	add    $0x50,%edx
c0004574:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004578:	8b 50 0c             	mov    0xc(%eax),%edx
c000457b:	83 ea 01             	sub    $0x1,%edx
c000457e:	89 50 0c             	mov    %edx,0xc(%eax)
c0004581:	8b 40 0c             	mov    0xc(%eax),%eax
c0004584:	85 c0                	test   %eax,%eax
c0004586:	75 16                	jne    c000459e <do_close+0x38>
c0004588:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c000458d:	8b 55 08             	mov    0x8(%ebp),%edx
c0004590:	83 c2 50             	add    $0x50,%edx
c0004593:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004597:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000459e:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00045a3:	8b 55 08             	mov    0x8(%ebp),%edx
c00045a6:	83 c2 50             	add    $0x50,%edx
c00045a9:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c00045b0:	00 
c00045b1:	b8 00 00 00 00       	mov    $0x0,%eax
c00045b6:	5d                   	pop    %ebp
c00045b7:	c3                   	ret    

c00045b8 <get_super_block>:
c00045b8:	55                   	push   %ebp
c00045b9:	89 e5                	mov    %esp,%ebp
c00045bb:	83 ec 08             	sub    $0x8,%esp
c00045be:	a1 a4 27 01 c0       	mov    0xc00127a4,%eax
c00045c3:	83 ec 0c             	sub    $0xc,%esp
c00045c6:	6a 07                	push   $0x7
c00045c8:	68 00 02 00 00       	push   $0x200
c00045cd:	50                   	push   %eax
c00045ce:	6a 20                	push   $0x20
c00045d0:	6a 01                	push   $0x1
c00045d2:	e8 25 e2 ff ff       	call   c00027fc <rd_wt>
c00045d7:	83 c4 20             	add    $0x20,%esp
c00045da:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00045e0:	a1 c0 31 01 c0       	mov    0xc00131c0,%eax
c00045e5:	8b 0a                	mov    (%edx),%ecx
c00045e7:	89 08                	mov    %ecx,(%eax)
c00045e9:	8b 4a 04             	mov    0x4(%edx),%ecx
c00045ec:	89 48 04             	mov    %ecx,0x4(%eax)
c00045ef:	8b 4a 08             	mov    0x8(%edx),%ecx
c00045f2:	89 48 08             	mov    %ecx,0x8(%eax)
c00045f5:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00045f8:	89 48 0c             	mov    %ecx,0xc(%eax)
c00045fb:	8b 4a 10             	mov    0x10(%edx),%ecx
c00045fe:	89 48 10             	mov    %ecx,0x10(%eax)
c0004601:	8b 4a 14             	mov    0x14(%edx),%ecx
c0004604:	89 48 14             	mov    %ecx,0x14(%eax)
c0004607:	8b 4a 18             	mov    0x18(%edx),%ecx
c000460a:	89 48 18             	mov    %ecx,0x18(%eax)
c000460d:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0004610:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004613:	8b 52 20             	mov    0x20(%edx),%edx
c0004616:	89 50 20             	mov    %edx,0x20(%eax)
c0004619:	a1 c0 31 01 c0       	mov    0xc00131c0,%eax
c000461e:	c9                   	leave  
c000461f:	c3                   	ret    

c0004620 <check>:
c0004620:	55                   	push   %ebp
c0004621:	89 e5                	mov    %esp,%ebp
c0004623:	83 ec 10             	sub    $0x10,%esp
c0004626:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000462d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004634:	eb 08                	jmp    c000463e <check+0x1e>
c0004636:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000463a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000463e:	83 7d f8 03          	cmpl   $0x3,-0x8(%ebp)
c0004642:	7e f2                	jle    c0004636 <check+0x16>
c0004644:	90                   	nop
c0004645:	c9                   	leave  
c0004646:	c3                   	ret    

c0004647 <schedule_process>:
c0004647:	55                   	push   %ebp
c0004648:	89 e5                	mov    %esp,%ebp
c000464a:	83 ec 18             	sub    $0x18,%esp
c000464d:	c7 45 f4 00 00 10 00 	movl   $0x100000,-0xc(%ebp)
c0004654:	e8 3e ce ff ff       	call   c0001497 <get_running_thread_pcb>
c0004659:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000465c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000465f:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004666:	84 c0                	test   %al,%al
c0004668:	75 30                	jne    c000469a <schedule_process+0x53>
c000466a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000466d:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c0004674:	00 00 00 
c0004677:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000467a:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004681:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004684:	05 00 01 00 00       	add    $0x100,%eax
c0004689:	83 ec 08             	sub    $0x8,%esp
c000468c:	50                   	push   %eax
c000468d:	68 0c 0e 01 c0       	push   $0xc0010e0c
c0004692:	e8 a0 6a 00 00       	call   c000b137 <insertToDoubleLinkList>
c0004697:	83 c4 10             	add    $0x10,%esp
c000469a:	83 ec 0c             	sub    $0xc,%esp
c000469d:	68 0c 0e 01 c0       	push   $0xc0010e0c
c00046a2:	e8 ac 68 00 00       	call   c000af53 <isListEmpty>
c00046a7:	83 c4 10             	add    $0x10,%esp
c00046aa:	84 c0                	test   %al,%al
c00046ac:	74 19                	je     c00046c7 <schedule_process+0x80>
c00046ae:	6a 28                	push   $0x28
c00046b0:	68 2b b8 00 c0       	push   $0xc000b82b
c00046b5:	68 2b b8 00 c0       	push   $0xc000b82b
c00046ba:	68 35 b8 00 c0       	push   $0xc000b835
c00046bf:	e8 7a 54 00 00       	call   c0009b3e <assertion_failure>
c00046c4:	83 c4 10             	add    $0x10,%esp
c00046c7:	83 ec 0c             	sub    $0xc,%esp
c00046ca:	68 0c 0e 01 c0       	push   $0xc0010e0c
c00046cf:	e8 e6 6a 00 00       	call   c000b1ba <popFromDoubleLinkList>
c00046d4:	83 c4 10             	add    $0x10,%esp
c00046d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00046da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00046e2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00046e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00046e8:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00046ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00046f2:	8b 40 08             	mov    0x8(%eax),%eax
c00046f5:	85 c0                	test   %eax,%eax
c00046f7:	74 28                	je     c0004721 <schedule_process+0xda>
c00046f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00046fc:	05 00 10 00 00       	add    $0x1000,%eax
c0004701:	83 ec 0c             	sub    $0xc,%esp
c0004704:	50                   	push   %eax
c0004705:	e8 7e cd ff ff       	call   c0001488 <update_tss>
c000470a:	83 c4 10             	add    $0x10,%esp
c000470d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004710:	8b 40 08             	mov    0x8(%eax),%eax
c0004713:	83 ec 0c             	sub    $0xc,%esp
c0004716:	50                   	push   %eax
c0004717:	e8 5f cd ff ff       	call   c000147b <update_cr3>
c000471c:	83 c4 10             	add    $0x10,%esp
c000471f:	eb 0f                	jmp    c0004730 <schedule_process+0xe9>
c0004721:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004724:	83 ec 0c             	sub    $0xc,%esp
c0004727:	50                   	push   %eax
c0004728:	e8 4e cd ff ff       	call   c000147b <update_cr3>
c000472d:	83 c4 10             	add    $0x10,%esp
c0004730:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004733:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0004738:	83 ec 08             	sub    $0x8,%esp
c000473b:	ff 75 e8             	pushl  -0x18(%ebp)
c000473e:	ff 75 f0             	pushl  -0x10(%ebp)
c0004741:	e8 ca 67 00 00       	call   c000af10 <switch_to>
c0004746:	83 c4 10             	add    $0x10,%esp
c0004749:	90                   	nop
c000474a:	c9                   	leave  
c000474b:	c3                   	ret    

c000474c <clock_handler>:
c000474c:	55                   	push   %ebp
c000474d:	89 e5                	mov    %esp,%ebp
c000474f:	83 ec 18             	sub    $0x18,%esp
c0004752:	e8 40 cd ff ff       	call   c0001497 <get_running_thread_pcb>
c0004757:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000475a:	a1 e0 16 01 c0       	mov    0xc00116e0,%eax
c000475f:	85 c0                	test   %eax,%eax
c0004761:	74 0d                	je     c0004770 <clock_handler+0x24>
c0004763:	83 ec 0c             	sub    $0xc,%esp
c0004766:	6a 04                	push   $0x4
c0004768:	e8 a9 5f 00 00       	call   c000a716 <inform_int>
c000476d:	83 c4 10             	add    $0x10,%esp
c0004770:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004773:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004779:	83 f8 05             	cmp    $0x5,%eax
c000477c:	75 13                	jne    c0004791 <clock_handler+0x45>
c000477e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004781:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004787:	83 f8 01             	cmp    $0x1,%eax
c000478a:	75 05                	jne    c0004791 <clock_handler+0x45>
c000478c:	e8 8f fe ff ff       	call   c0004620 <check>
c0004791:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004794:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c000479a:	85 c0                	test   %eax,%eax
c000479c:	74 16                	je     c00047b4 <clock_handler+0x68>
c000479e:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00047a3:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c00047a9:	83 ea 01             	sub    $0x1,%edx
c00047ac:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c00047b2:	eb 05                	jmp    c00047b9 <clock_handler+0x6d>
c00047b4:	e8 8e fe ff ff       	call   c0004647 <schedule_process>
c00047b9:	90                   	nop
c00047ba:	c9                   	leave  
c00047bb:	c3                   	ret    

c00047bc <pid2proc>:
c00047bc:	55                   	push   %ebp
c00047bd:	89 e5                	mov    %esp,%ebp
c00047bf:	83 ec 20             	sub    $0x20,%esp
c00047c2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00047c9:	a1 24 1f 01 c0       	mov    0xc0011f24,%eax
c00047ce:	8b 15 28 1f 01 c0    	mov    0xc0011f28,%edx
c00047d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00047d7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00047da:	a1 2c 1f 01 c0       	mov    0xc0011f2c,%eax
c00047df:	8b 15 30 1f 01 c0    	mov    0xc0011f30,%edx
c00047e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00047e8:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00047eb:	a1 28 1f 01 c0       	mov    0xc0011f28,%eax
c00047f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00047f3:	eb 29                	jmp    c000481e <pid2proc+0x62>
c00047f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00047f8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00047fd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004800:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004803:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004809:	8b 45 08             	mov    0x8(%ebp),%eax
c000480c:	39 c2                	cmp    %eax,%edx
c000480e:	75 05                	jne    c0004815 <pid2proc+0x59>
c0004810:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004813:	eb 17                	jmp    c000482c <pid2proc+0x70>
c0004815:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004818:	8b 40 04             	mov    0x4(%eax),%eax
c000481b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000481e:	81 7d fc 2c 1f 01 c0 	cmpl   $0xc0011f2c,-0x4(%ebp)
c0004825:	75 ce                	jne    c00047f5 <pid2proc+0x39>
c0004827:	b8 00 00 00 00       	mov    $0x0,%eax
c000482c:	c9                   	leave  
c000482d:	c3                   	ret    

c000482e <proc2pid>:
c000482e:	55                   	push   %ebp
c000482f:	89 e5                	mov    %esp,%ebp
c0004831:	83 ec 10             	sub    $0x10,%esp
c0004834:	8b 45 08             	mov    0x8(%ebp),%eax
c0004837:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000483d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004840:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004843:	c9                   	leave  
c0004844:	c3                   	ret    

c0004845 <InitDescriptor>:
c0004845:	55                   	push   %ebp
c0004846:	89 e5                	mov    %esp,%ebp
c0004848:	83 ec 04             	sub    $0x4,%esp
c000484b:	8b 45 14             	mov    0x14(%ebp),%eax
c000484e:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004852:	8b 45 10             	mov    0x10(%ebp),%eax
c0004855:	89 c2                	mov    %eax,%edx
c0004857:	8b 45 08             	mov    0x8(%ebp),%eax
c000485a:	66 89 10             	mov    %dx,(%eax)
c000485d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004860:	89 c2                	mov    %eax,%edx
c0004862:	8b 45 08             	mov    0x8(%ebp),%eax
c0004865:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004869:	8b 45 0c             	mov    0xc(%ebp),%eax
c000486c:	c1 e8 10             	shr    $0x10,%eax
c000486f:	89 c2                	mov    %eax,%edx
c0004871:	8b 45 08             	mov    0x8(%ebp),%eax
c0004874:	88 50 04             	mov    %dl,0x4(%eax)
c0004877:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c000487b:	89 c2                	mov    %eax,%edx
c000487d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004880:	88 50 05             	mov    %dl,0x5(%eax)
c0004883:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004887:	66 c1 e8 08          	shr    $0x8,%ax
c000488b:	c1 e0 04             	shl    $0x4,%eax
c000488e:	89 c2                	mov    %eax,%edx
c0004890:	8b 45 10             	mov    0x10(%ebp),%eax
c0004893:	c1 e8 10             	shr    $0x10,%eax
c0004896:	83 e0 0f             	and    $0xf,%eax
c0004899:	09 c2                	or     %eax,%edx
c000489b:	8b 45 08             	mov    0x8(%ebp),%eax
c000489e:	88 50 06             	mov    %dl,0x6(%eax)
c00048a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00048a4:	c1 e8 18             	shr    $0x18,%eax
c00048a7:	89 c2                	mov    %eax,%edx
c00048a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00048ac:	88 50 07             	mov    %dl,0x7(%eax)
c00048af:	90                   	nop
c00048b0:	c9                   	leave  
c00048b1:	c3                   	ret    

c00048b2 <Seg2PhyAddr>:
c00048b2:	55                   	push   %ebp
c00048b3:	89 e5                	mov    %esp,%ebp
c00048b5:	83 ec 10             	sub    $0x10,%esp
c00048b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00048bb:	c1 e8 03             	shr    $0x3,%eax
c00048be:	8b 14 c5 e4 07 01 c0 	mov    -0x3ffef81c(,%eax,8),%edx
c00048c5:	8b 04 c5 e0 07 01 c0 	mov    -0x3ffef820(,%eax,8),%eax
c00048cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00048cf:	89 55 f8             	mov    %edx,-0x8(%ebp)
c00048d2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c00048d6:	0f b7 c0             	movzwl %ax,%eax
c00048d9:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c00048dd:	0f b6 d2             	movzbl %dl,%edx
c00048e0:	c1 e2 10             	shl    $0x10,%edx
c00048e3:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c00048e9:	09 d0                	or     %edx,%eax
c00048eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00048ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00048f1:	c9                   	leave  
c00048f2:	c3                   	ret    

c00048f3 <Seg2PhyAddrLDT>:
c00048f3:	55                   	push   %ebp
c00048f4:	89 e5                	mov    %esp,%ebp
c00048f6:	83 ec 10             	sub    $0x10,%esp
c00048f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00048fc:	c1 e8 03             	shr    $0x3,%eax
c00048ff:	89 c2                	mov    %eax,%edx
c0004901:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004904:	83 c2 22             	add    $0x22,%edx
c0004907:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c000490b:	8b 02                	mov    (%edx),%eax
c000490d:	8b 52 04             	mov    0x4(%edx),%edx
c0004910:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004913:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004916:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000491a:	0f b7 c0             	movzwl %ax,%eax
c000491d:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004921:	0f b6 d2             	movzbl %dl,%edx
c0004924:	c1 e2 10             	shl    $0x10,%edx
c0004927:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c000492d:	09 d0                	or     %edx,%eax
c000492f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004932:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004935:	c9                   	leave  
c0004936:	c3                   	ret    

c0004937 <VirAddr2PhyAddr>:
c0004937:	55                   	push   %ebp
c0004938:	89 e5                	mov    %esp,%ebp
c000493a:	83 ec 10             	sub    $0x10,%esp
c000493d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004940:	8b 45 08             	mov    0x8(%ebp),%eax
c0004943:	01 d0                	add    %edx,%eax
c0004945:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004948:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000494b:	c9                   	leave  
c000494c:	c3                   	ret    

c000494d <v2l>:
c000494d:	55                   	push   %ebp
c000494e:	89 e5                	mov    %esp,%ebp
c0004950:	83 ec 18             	sub    $0x18,%esp
c0004953:	83 ec 0c             	sub    $0xc,%esp
c0004956:	ff 75 08             	pushl  0x8(%ebp)
c0004959:	e8 5e fe ff ff       	call   c00047bc <pid2proc>
c000495e:	83 c4 10             	add    $0x10,%esp
c0004961:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004964:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000496b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000496e:	83 ec 08             	sub    $0x8,%esp
c0004971:	ff 75 f4             	pushl  -0xc(%ebp)
c0004974:	50                   	push   %eax
c0004975:	e8 79 ff ff ff       	call   c00048f3 <Seg2PhyAddrLDT>
c000497a:	83 c4 10             	add    $0x10,%esp
c000497d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004980:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004983:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004986:	01 d0                	add    %edx,%eax
c0004988:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000498b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000498e:	c9                   	leave  
c000498f:	c3                   	ret    

c0004990 <init_propt>:
c0004990:	55                   	push   %ebp
c0004991:	89 e5                	mov    %esp,%ebp
c0004993:	83 ec 38             	sub    $0x38,%esp
c0004996:	6a 0e                	push   $0xe
c0004998:	6a 08                	push   $0x8
c000499a:	68 71 12 00 c0       	push   $0xc0001271
c000499f:	6a 20                	push   $0x20
c00049a1:	e8 58 01 00 00       	call   c0004afe <InitInterruptDesc>
c00049a6:	83 c4 10             	add    $0x10,%esp
c00049a9:	6a 0e                	push   $0xe
c00049ab:	6a 08                	push   $0x8
c00049ad:	68 9e 12 00 c0       	push   $0xc000129e
c00049b2:	6a 21                	push   $0x21
c00049b4:	e8 45 01 00 00       	call   c0004afe <InitInterruptDesc>
c00049b9:	83 c4 10             	add    $0x10,%esp
c00049bc:	6a 0e                	push   $0xe
c00049be:	6a 08                	push   $0x8
c00049c0:	68 e0 12 00 c0       	push   $0xc00012e0
c00049c5:	6a 2e                	push   $0x2e
c00049c7:	e8 32 01 00 00       	call   c0004afe <InitInterruptDesc>
c00049cc:	83 c4 10             	add    $0x10,%esp
c00049cf:	83 ec 04             	sub    $0x4,%esp
c00049d2:	68 a0 15 00 00       	push   $0x15a0
c00049d7:	6a 00                	push   $0x0
c00049d9:	68 20 32 08 c0       	push   $0xc0083220
c00049de:	e8 e4 78 00 00       	call   c000c2c7 <Memset>
c00049e3:	83 c4 10             	add    $0x10,%esp
c00049e6:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c00049ed:	83 ec 04             	sub    $0x4,%esp
c00049f0:	ff 75 f4             	pushl  -0xc(%ebp)
c00049f3:	6a 00                	push   $0x0
c00049f5:	68 60 16 01 c0       	push   $0xc0011660
c00049fa:	e8 c8 78 00 00       	call   c000c2c7 <Memset>
c00049ff:	83 c4 10             	add    $0x10,%esp
c0004a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004a05:	a3 c8 16 01 c0       	mov    %eax,0xc00116c8
c0004a0a:	c7 05 68 16 01 c0 30 	movl   $0x30,0xc0011668
c0004a11:	00 00 00 
c0004a14:	83 ec 0c             	sub    $0xc,%esp
c0004a17:	6a 30                	push   $0x30
c0004a19:	e8 94 fe ff ff       	call   c00048b2 <Seg2PhyAddr>
c0004a1e:	83 c4 10             	add    $0x10,%esp
c0004a21:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004a24:	c7 45 ec 60 16 01 c0 	movl   $0xc0011660,-0x14(%ebp)
c0004a2b:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004a32:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a35:	0f b7 d0             	movzwl %ax,%edx
c0004a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004a3b:	83 e8 01             	sub    $0x1,%eax
c0004a3e:	89 c1                	mov    %eax,%ecx
c0004a40:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004a43:	52                   	push   %edx
c0004a44:	51                   	push   %ecx
c0004a45:	50                   	push   %eax
c0004a46:	68 20 08 01 c0       	push   $0xc0010820
c0004a4b:	e8 f5 fd ff ff       	call   c0004845 <InitDescriptor>
c0004a50:	83 c4 10             	add    $0x10,%esp
c0004a53:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004a5a:	68 f2 00 00 00       	push   $0xf2
c0004a5f:	68 ff ff 00 00       	push   $0xffff
c0004a64:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004a67:	68 18 08 01 c0       	push   $0xc0010818
c0004a6c:	e8 d4 fd ff ff       	call   c0004845 <InitDescriptor>
c0004a71:	83 c4 10             	add    $0x10,%esp
c0004a74:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004a7b:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004a82:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004a89:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004a8c:	0f b7 c0             	movzwl %ax,%eax
c0004a8f:	50                   	push   %eax
c0004a90:	ff 75 d8             	pushl  -0x28(%ebp)
c0004a93:	6a 00                	push   $0x0
c0004a95:	68 28 08 01 c0       	push   $0xc0010828
c0004a9a:	e8 a6 fd ff ff       	call   c0004845 <InitDescriptor>
c0004a9f:	83 c4 10             	add    $0x10,%esp
c0004aa2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004aa5:	0f b7 c0             	movzwl %ax,%eax
c0004aa8:	50                   	push   %eax
c0004aa9:	ff 75 d8             	pushl  -0x28(%ebp)
c0004aac:	6a 00                	push   $0x0
c0004aae:	68 30 08 01 c0       	push   $0xc0010830
c0004ab3:	e8 8d fd ff ff       	call   c0004845 <InitDescriptor>
c0004ab8:	83 c4 10             	add    $0x10,%esp
c0004abb:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0004ac2:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0004ac9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004acc:	0f b7 c0             	movzwl %ax,%eax
c0004acf:	50                   	push   %eax
c0004ad0:	ff 75 d8             	pushl  -0x28(%ebp)
c0004ad3:	6a 00                	push   $0x0
c0004ad5:	68 38 08 01 c0       	push   $0xc0010838
c0004ada:	e8 66 fd ff ff       	call   c0004845 <InitDescriptor>
c0004adf:	83 c4 10             	add    $0x10,%esp
c0004ae2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004ae5:	0f b7 c0             	movzwl %ax,%eax
c0004ae8:	50                   	push   %eax
c0004ae9:	ff 75 d8             	pushl  -0x28(%ebp)
c0004aec:	6a 00                	push   $0x0
c0004aee:	68 40 08 01 c0       	push   $0xc0010840
c0004af3:	e8 4d fd ff ff       	call   c0004845 <InitDescriptor>
c0004af8:	83 c4 10             	add    $0x10,%esp
c0004afb:	90                   	nop
c0004afc:	c9                   	leave  
c0004afd:	c3                   	ret    

c0004afe <InitInterruptDesc>:
c0004afe:	55                   	push   %ebp
c0004aff:	89 e5                	mov    %esp,%ebp
c0004b01:	83 ec 10             	sub    $0x10,%esp
c0004b04:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b07:	c1 e0 03             	shl    $0x3,%eax
c0004b0a:	05 00 17 01 c0       	add    $0xc0011700,%eax
c0004b0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b12:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b15:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004b19:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b1c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004b1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004b22:	89 c2                	mov    %eax,%edx
c0004b24:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b27:	66 89 10             	mov    %dx,(%eax)
c0004b2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b2d:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004b33:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004b36:	c1 f8 10             	sar    $0x10,%eax
c0004b39:	89 c2                	mov    %eax,%edx
c0004b3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b3e:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004b42:	8b 45 10             	mov    0x10(%ebp),%eax
c0004b45:	c1 e0 04             	shl    $0x4,%eax
c0004b48:	89 c2                	mov    %eax,%edx
c0004b4a:	8b 45 14             	mov    0x14(%ebp),%eax
c0004b4d:	09 d0                	or     %edx,%eax
c0004b4f:	89 c2                	mov    %eax,%edx
c0004b51:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b54:	88 50 05             	mov    %dl,0x5(%eax)
c0004b57:	90                   	nop
c0004b58:	c9                   	leave  
c0004b59:	c3                   	ret    

c0004b5a <ReloadGDT>:
c0004b5a:	55                   	push   %ebp
c0004b5b:	89 e5                	mov    %esp,%ebp
c0004b5d:	83 ec 28             	sub    $0x28,%esp
c0004b60:	b8 e8 16 01 c0       	mov    $0xc00116e8,%eax
c0004b65:	0f b7 00             	movzwl (%eax),%eax
c0004b68:	98                   	cwtl   
c0004b69:	ba ea 16 01 c0       	mov    $0xc00116ea,%edx
c0004b6e:	8b 12                	mov    (%edx),%edx
c0004b70:	83 ec 04             	sub    $0x4,%esp
c0004b73:	50                   	push   %eax
c0004b74:	52                   	push   %edx
c0004b75:	68 e0 07 01 c0       	push   $0xc00107e0
c0004b7a:	e8 1a 77 00 00       	call   c000c299 <Memcpy2>
c0004b7f:	83 c4 10             	add    $0x10,%esp
c0004b82:	c7 45 f0 e8 16 01 c0 	movl   $0xc00116e8,-0x10(%ebp)
c0004b89:	c7 45 ec ea 16 01 c0 	movl   $0xc00116ea,-0x14(%ebp)
c0004b90:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004b93:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004b98:	ba e0 07 01 c0       	mov    $0xc00107e0,%edx
c0004b9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004ba0:	89 10                	mov    %edx,(%eax)
c0004ba2:	c7 45 e8 a8 07 01 c0 	movl   $0xc00107a8,-0x18(%ebp)
c0004ba9:	c7 45 e4 aa 07 01 c0 	movl   $0xc00107aa,-0x1c(%ebp)
c0004bb0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004bb3:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004bb8:	ba 00 17 01 c0       	mov    $0xc0011700,%edx
c0004bbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004bc0:	89 10                	mov    %edx,(%eax)
c0004bc2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004bc9:	eb 04                	jmp    c0004bcf <ReloadGDT+0x75>
c0004bcb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004bcf:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004bd6:	7e f3                	jle    c0004bcb <ReloadGDT+0x71>
c0004bd8:	e8 81 38 00 00       	call   c000845e <init_internal_interrupt>
c0004bdd:	e8 ae fd ff ff       	call   c0004990 <init_propt>
c0004be2:	90                   	nop
c0004be3:	c9                   	leave  
c0004be4:	c3                   	ret    

c0004be5 <select_console>:
c0004be5:	55                   	push   %ebp
c0004be6:	89 e5                	mov    %esp,%ebp
c0004be8:	83 ec 18             	sub    $0x18,%esp
c0004beb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bee:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004bf1:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0004bf5:	75 27                	jne    c0004c1e <select_console+0x39>
c0004bf7:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004bfb:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004c01:	05 20 0e 01 c0       	add    $0xc0010e20,%eax
c0004c06:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c0004c0b:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0004c10:	83 ec 0c             	sub    $0xc,%esp
c0004c13:	50                   	push   %eax
c0004c14:	e8 08 00 00 00       	call   c0004c21 <flush>
c0004c19:	83 c4 10             	add    $0x10,%esp
c0004c1c:	eb 01                	jmp    c0004c1f <select_console+0x3a>
c0004c1e:	90                   	nop
c0004c1f:	c9                   	leave  
c0004c20:	c3                   	ret    

c0004c21 <flush>:
c0004c21:	55                   	push   %ebp
c0004c22:	89 e5                	mov    %esp,%ebp
c0004c24:	83 ec 08             	sub    $0x8,%esp
c0004c27:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c2a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c30:	8b 40 0c             	mov    0xc(%eax),%eax
c0004c33:	83 ec 0c             	sub    $0xc,%esp
c0004c36:	50                   	push   %eax
c0004c37:	e8 1e 00 00 00       	call   c0004c5a <set_cursor>
c0004c3c:	83 c4 10             	add    $0x10,%esp
c0004c3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c42:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004c48:	8b 40 08             	mov    0x8(%eax),%eax
c0004c4b:	83 ec 0c             	sub    $0xc,%esp
c0004c4e:	50                   	push   %eax
c0004c4f:	e8 64 00 00 00       	call   c0004cb8 <set_console_start_video_addr>
c0004c54:	83 c4 10             	add    $0x10,%esp
c0004c57:	90                   	nop
c0004c58:	c9                   	leave  
c0004c59:	c3                   	ret    

c0004c5a <set_cursor>:
c0004c5a:	55                   	push   %ebp
c0004c5b:	89 e5                	mov    %esp,%ebp
c0004c5d:	83 ec 08             	sub    $0x8,%esp
c0004c60:	83 ec 08             	sub    $0x8,%esp
c0004c63:	6a 0e                	push   $0xe
c0004c65:	68 d4 03 00 00       	push   $0x3d4
c0004c6a:	e8 2a c7 ff ff       	call   c0001399 <out_byte>
c0004c6f:	83 c4 10             	add    $0x10,%esp
c0004c72:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c75:	c1 e8 08             	shr    $0x8,%eax
c0004c78:	0f b7 c0             	movzwl %ax,%eax
c0004c7b:	83 ec 08             	sub    $0x8,%esp
c0004c7e:	50                   	push   %eax
c0004c7f:	68 d5 03 00 00       	push   $0x3d5
c0004c84:	e8 10 c7 ff ff       	call   c0001399 <out_byte>
c0004c89:	83 c4 10             	add    $0x10,%esp
c0004c8c:	83 ec 08             	sub    $0x8,%esp
c0004c8f:	6a 0f                	push   $0xf
c0004c91:	68 d4 03 00 00       	push   $0x3d4
c0004c96:	e8 fe c6 ff ff       	call   c0001399 <out_byte>
c0004c9b:	83 c4 10             	add    $0x10,%esp
c0004c9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ca1:	0f b7 c0             	movzwl %ax,%eax
c0004ca4:	83 ec 08             	sub    $0x8,%esp
c0004ca7:	50                   	push   %eax
c0004ca8:	68 d5 03 00 00       	push   $0x3d5
c0004cad:	e8 e7 c6 ff ff       	call   c0001399 <out_byte>
c0004cb2:	83 c4 10             	add    $0x10,%esp
c0004cb5:	90                   	nop
c0004cb6:	c9                   	leave  
c0004cb7:	c3                   	ret    

c0004cb8 <set_console_start_video_addr>:
c0004cb8:	55                   	push   %ebp
c0004cb9:	89 e5                	mov    %esp,%ebp
c0004cbb:	83 ec 08             	sub    $0x8,%esp
c0004cbe:	83 ec 08             	sub    $0x8,%esp
c0004cc1:	6a 0c                	push   $0xc
c0004cc3:	68 d4 03 00 00       	push   $0x3d4
c0004cc8:	e8 cc c6 ff ff       	call   c0001399 <out_byte>
c0004ccd:	83 c4 10             	add    $0x10,%esp
c0004cd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cd3:	c1 e8 08             	shr    $0x8,%eax
c0004cd6:	0f b7 c0             	movzwl %ax,%eax
c0004cd9:	83 ec 08             	sub    $0x8,%esp
c0004cdc:	50                   	push   %eax
c0004cdd:	68 d5 03 00 00       	push   $0x3d5
c0004ce2:	e8 b2 c6 ff ff       	call   c0001399 <out_byte>
c0004ce7:	83 c4 10             	add    $0x10,%esp
c0004cea:	83 ec 08             	sub    $0x8,%esp
c0004ced:	6a 0d                	push   $0xd
c0004cef:	68 d4 03 00 00       	push   $0x3d4
c0004cf4:	e8 a0 c6 ff ff       	call   c0001399 <out_byte>
c0004cf9:	83 c4 10             	add    $0x10,%esp
c0004cfc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cff:	0f b7 c0             	movzwl %ax,%eax
c0004d02:	83 ec 08             	sub    $0x8,%esp
c0004d05:	50                   	push   %eax
c0004d06:	68 d5 03 00 00       	push   $0x3d5
c0004d0b:	e8 89 c6 ff ff       	call   c0001399 <out_byte>
c0004d10:	83 c4 10             	add    $0x10,%esp
c0004d13:	90                   	nop
c0004d14:	c9                   	leave  
c0004d15:	c3                   	ret    

c0004d16 <put_key>:
c0004d16:	55                   	push   %ebp
c0004d17:	89 e5                	mov    %esp,%ebp
c0004d19:	83 ec 04             	sub    $0x4,%esp
c0004d1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004d1f:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004d22:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d25:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004d2b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004d30:	77 4d                	ja     c0004d7f <put_key+0x69>
c0004d32:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d35:	8b 00                	mov    (%eax),%eax
c0004d37:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004d3b:	89 10                	mov    %edx,(%eax)
c0004d3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d40:	8b 00                	mov    (%eax),%eax
c0004d42:	8d 50 04             	lea    0x4(%eax),%edx
c0004d45:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d48:	89 10                	mov    %edx,(%eax)
c0004d4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d4d:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004d53:	8d 50 01             	lea    0x1(%eax),%edx
c0004d56:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d59:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004d5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d62:	8b 00                	mov    (%eax),%eax
c0004d64:	8b 55 08             	mov    0x8(%ebp),%edx
c0004d67:	83 c2 08             	add    $0x8,%edx
c0004d6a:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004d70:	39 d0                	cmp    %edx,%eax
c0004d72:	75 0b                	jne    c0004d7f <put_key+0x69>
c0004d74:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d77:	8d 50 08             	lea    0x8(%eax),%edx
c0004d7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d7d:	89 10                	mov    %edx,(%eax)
c0004d7f:	90                   	nop
c0004d80:	c9                   	leave  
c0004d81:	c3                   	ret    

c0004d82 <scroll_up>:
c0004d82:	55                   	push   %ebp
c0004d83:	89 e5                	mov    %esp,%ebp
c0004d85:	83 ec 08             	sub    $0x8,%esp
c0004d88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d8b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d91:	8b 40 08             	mov    0x8(%eax),%eax
c0004d94:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004d97:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d9a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004da0:	8b 00                	mov    (%eax),%eax
c0004da2:	39 c2                	cmp    %eax,%edx
c0004da4:	76 1b                	jbe    c0004dc1 <scroll_up+0x3f>
c0004da6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004da9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004daf:	8b 40 08             	mov    0x8(%eax),%eax
c0004db2:	83 e8 50             	sub    $0x50,%eax
c0004db5:	83 ec 0c             	sub    $0xc,%esp
c0004db8:	50                   	push   %eax
c0004db9:	e8 fa fe ff ff       	call   c0004cb8 <set_console_start_video_addr>
c0004dbe:	83 c4 10             	add    $0x10,%esp
c0004dc1:	90                   	nop
c0004dc2:	c9                   	leave  
c0004dc3:	c3                   	ret    

c0004dc4 <scroll_down>:
c0004dc4:	55                   	push   %ebp
c0004dc5:	89 e5                	mov    %esp,%ebp
c0004dc7:	83 ec 08             	sub    $0x8,%esp
c0004dca:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dcd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004dd3:	8b 40 08             	mov    0x8(%eax),%eax
c0004dd6:	8d 48 50             	lea    0x50(%eax),%ecx
c0004dd9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ddc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004de2:	8b 10                	mov    (%eax),%edx
c0004de4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004de7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ded:	8b 40 04             	mov    0x4(%eax),%eax
c0004df0:	01 d0                	add    %edx,%eax
c0004df2:	39 c1                	cmp    %eax,%ecx
c0004df4:	73 36                	jae    c0004e2c <scroll_down+0x68>
c0004df6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004df9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004dff:	8b 40 08             	mov    0x8(%eax),%eax
c0004e02:	83 c0 50             	add    $0x50,%eax
c0004e05:	83 ec 0c             	sub    $0xc,%esp
c0004e08:	50                   	push   %eax
c0004e09:	e8 aa fe ff ff       	call   c0004cb8 <set_console_start_video_addr>
c0004e0e:	83 c4 10             	add    $0x10,%esp
c0004e11:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e14:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e1a:	8b 50 08             	mov    0x8(%eax),%edx
c0004e1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e20:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e26:	83 c2 50             	add    $0x50,%edx
c0004e29:	89 50 08             	mov    %edx,0x8(%eax)
c0004e2c:	90                   	nop
c0004e2d:	c9                   	leave  
c0004e2e:	c3                   	ret    

c0004e2f <out_char>:
c0004e2f:	55                   	push   %ebp
c0004e30:	89 e5                	mov    %esp,%ebp
c0004e32:	83 ec 28             	sub    $0x28,%esp
c0004e35:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004e38:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004e3b:	e8 e3 2c 00 00       	call   c0007b23 <intr_disable>
c0004e40:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004e43:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e46:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e4c:	8b 40 0c             	mov    0xc(%eax),%eax
c0004e4f:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0004e54:	01 c0                	add    %eax,%eax
c0004e56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004e59:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0004e5d:	83 f8 08             	cmp    $0x8,%eax
c0004e60:	0f 84 8d 00 00 00    	je     c0004ef3 <out_char+0xc4>
c0004e66:	83 f8 0a             	cmp    $0xa,%eax
c0004e69:	0f 85 c9 00 00 00    	jne    c0004f38 <out_char+0x109>
c0004e6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e72:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e78:	8b 50 0c             	mov    0xc(%eax),%edx
c0004e7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e7e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e84:	8b 08                	mov    (%eax),%ecx
c0004e86:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e89:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e8f:	8b 40 04             	mov    0x4(%eax),%eax
c0004e92:	01 c8                	add    %ecx,%eax
c0004e94:	83 e8 50             	sub    $0x50,%eax
c0004e97:	39 c2                	cmp    %eax,%edx
c0004e99:	0f 83 f4 00 00 00    	jae    c0004f93 <out_char+0x164>
c0004e9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ea2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ea8:	8b 08                	mov    (%eax),%ecx
c0004eaa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ead:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004eb3:	8b 50 0c             	mov    0xc(%eax),%edx
c0004eb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eb9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ebf:	8b 00                	mov    (%eax),%eax
c0004ec1:	29 c2                	sub    %eax,%edx
c0004ec3:	89 d0                	mov    %edx,%eax
c0004ec5:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0004eca:	f7 e2                	mul    %edx
c0004ecc:	89 d0                	mov    %edx,%eax
c0004ece:	c1 e8 06             	shr    $0x6,%eax
c0004ed1:	8d 50 01             	lea    0x1(%eax),%edx
c0004ed4:	89 d0                	mov    %edx,%eax
c0004ed6:	c1 e0 02             	shl    $0x2,%eax
c0004ed9:	01 d0                	add    %edx,%eax
c0004edb:	c1 e0 04             	shl    $0x4,%eax
c0004ede:	89 c2                	mov    %eax,%edx
c0004ee0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ee3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ee9:	01 ca                	add    %ecx,%edx
c0004eeb:	89 50 0c             	mov    %edx,0xc(%eax)
c0004eee:	e9 a0 00 00 00       	jmp    c0004f93 <out_char+0x164>
c0004ef3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004efc:	8b 50 0c             	mov    0xc(%eax),%edx
c0004eff:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f02:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f08:	8b 00                	mov    (%eax),%eax
c0004f0a:	39 c2                	cmp    %eax,%edx
c0004f0c:	0f 86 84 00 00 00    	jbe    c0004f96 <out_char+0x167>
c0004f12:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f15:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f1b:	8b 50 0c             	mov    0xc(%eax),%edx
c0004f1e:	83 ea 01             	sub    $0x1,%edx
c0004f21:	89 50 0c             	mov    %edx,0xc(%eax)
c0004f24:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004f27:	83 e8 02             	sub    $0x2,%eax
c0004f2a:	c6 00 20             	movb   $0x20,(%eax)
c0004f2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004f30:	83 e8 01             	sub    $0x1,%eax
c0004f33:	c6 00 00             	movb   $0x0,(%eax)
c0004f36:	eb 5e                	jmp    c0004f96 <out_char+0x167>
c0004f38:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f3b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f41:	8b 40 0c             	mov    0xc(%eax),%eax
c0004f44:	8d 48 01             	lea    0x1(%eax),%ecx
c0004f47:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f4a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f50:	8b 10                	mov    (%eax),%edx
c0004f52:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f55:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f5b:	8b 40 04             	mov    0x4(%eax),%eax
c0004f5e:	01 d0                	add    %edx,%eax
c0004f60:	39 c1                	cmp    %eax,%ecx
c0004f62:	73 35                	jae    c0004f99 <out_char+0x16a>
c0004f64:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004f67:	8d 50 01             	lea    0x1(%eax),%edx
c0004f6a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0004f6d:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0004f71:	88 10                	mov    %dl,(%eax)
c0004f73:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004f76:	8d 50 01             	lea    0x1(%eax),%edx
c0004f79:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0004f7c:	c6 00 0a             	movb   $0xa,(%eax)
c0004f7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f82:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f88:	8b 50 0c             	mov    0xc(%eax),%edx
c0004f8b:	83 c2 01             	add    $0x1,%edx
c0004f8e:	89 50 0c             	mov    %edx,0xc(%eax)
c0004f91:	eb 06                	jmp    c0004f99 <out_char+0x16a>
c0004f93:	90                   	nop
c0004f94:	eb 14                	jmp    c0004faa <out_char+0x17b>
c0004f96:	90                   	nop
c0004f97:	eb 11                	jmp    c0004faa <out_char+0x17b>
c0004f99:	90                   	nop
c0004f9a:	eb 0e                	jmp    c0004faa <out_char+0x17b>
c0004f9c:	83 ec 0c             	sub    $0xc,%esp
c0004f9f:	ff 75 08             	pushl  0x8(%ebp)
c0004fa2:	e8 1d fe ff ff       	call   c0004dc4 <scroll_down>
c0004fa7:	83 c4 10             	add    $0x10,%esp
c0004faa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fad:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fb3:	8b 50 0c             	mov    0xc(%eax),%edx
c0004fb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fbf:	8b 40 08             	mov    0x8(%eax),%eax
c0004fc2:	29 c2                	sub    %eax,%edx
c0004fc4:	89 d0                	mov    %edx,%eax
c0004fc6:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0004fcb:	77 cf                	ja     c0004f9c <out_char+0x16d>
c0004fcd:	83 ec 0c             	sub    $0xc,%esp
c0004fd0:	ff 75 08             	pushl  0x8(%ebp)
c0004fd3:	e8 49 fc ff ff       	call   c0004c21 <flush>
c0004fd8:	83 c4 10             	add    $0x10,%esp
c0004fdb:	83 ec 0c             	sub    $0xc,%esp
c0004fde:	ff 75 f4             	pushl  -0xc(%ebp)
c0004fe1:	e8 66 2b 00 00       	call   c0007b4c <intr_set_status>
c0004fe6:	83 c4 10             	add    $0x10,%esp
c0004fe9:	90                   	nop
c0004fea:	c9                   	leave  
c0004feb:	c3                   	ret    

c0004fec <tty_dev_read>:
c0004fec:	55                   	push   %ebp
c0004fed:	89 e5                	mov    %esp,%ebp
c0004fef:	83 ec 08             	sub    $0x8,%esp
c0004ff2:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0004ff7:	39 45 08             	cmp    %eax,0x8(%ebp)
c0004ffa:	75 17                	jne    c0005013 <tty_dev_read+0x27>
c0004ffc:	a1 08 0c 01 c0       	mov    0xc0010c08,%eax
c0005001:	85 c0                	test   %eax,%eax
c0005003:	7e 0e                	jle    c0005013 <tty_dev_read+0x27>
c0005005:	83 ec 0c             	sub    $0xc,%esp
c0005008:	ff 75 08             	pushl  0x8(%ebp)
c000500b:	e8 89 07 00 00       	call   c0005799 <keyboard_read>
c0005010:	83 c4 10             	add    $0x10,%esp
c0005013:	90                   	nop
c0005014:	c9                   	leave  
c0005015:	c3                   	ret    

c0005016 <tty_dev_write>:
c0005016:	55                   	push   %ebp
c0005017:	89 e5                	mov    %esp,%ebp
c0005019:	83 ec 28             	sub    $0x28,%esp
c000501c:	8b 45 08             	mov    0x8(%ebp),%eax
c000501f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005025:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005028:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000502f:	e9 88 01 00 00       	jmp    c00051bc <tty_dev_write+0x1a6>
c0005034:	8b 45 08             	mov    0x8(%ebp),%eax
c0005037:	8b 40 04             	mov    0x4(%eax),%eax
c000503a:	8b 00                	mov    (%eax),%eax
c000503c:	88 45 e7             	mov    %al,-0x19(%ebp)
c000503f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005042:	8b 40 04             	mov    0x4(%eax),%eax
c0005045:	8d 50 04             	lea    0x4(%eax),%edx
c0005048:	8b 45 08             	mov    0x8(%ebp),%eax
c000504b:	89 50 04             	mov    %edx,0x4(%eax)
c000504e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005051:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005057:	8d 50 ff             	lea    -0x1(%eax),%edx
c000505a:	8b 45 08             	mov    0x8(%ebp),%eax
c000505d:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0005063:	8b 45 08             	mov    0x8(%ebp),%eax
c0005066:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000506c:	8d 50 01             	lea    0x1(%eax),%edx
c000506f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005072:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005078:	8b 45 08             	mov    0x8(%ebp),%eax
c000507b:	8b 40 04             	mov    0x4(%eax),%eax
c000507e:	8b 55 08             	mov    0x8(%ebp),%edx
c0005081:	83 c2 08             	add    $0x8,%edx
c0005084:	81 c2 00 08 00 00    	add    $0x800,%edx
c000508a:	39 d0                	cmp    %edx,%eax
c000508c:	75 0c                	jne    c000509a <tty_dev_write+0x84>
c000508e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005091:	8d 50 08             	lea    0x8(%eax),%edx
c0005094:	8b 45 08             	mov    0x8(%ebp),%eax
c0005097:	89 50 04             	mov    %edx,0x4(%eax)
c000509a:	8b 45 08             	mov    0x8(%ebp),%eax
c000509d:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00050a3:	85 c0                	test   %eax,%eax
c00050a5:	0f 84 11 01 00 00    	je     c00051bc <tty_dev_write+0x1a6>
c00050ab:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00050af:	3c 20                	cmp    $0x20,%al
c00050b1:	76 08                	jbe    c00050bb <tty_dev_write+0xa5>
c00050b3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00050b7:	3c 7e                	cmp    $0x7e,%al
c00050b9:	76 10                	jbe    c00050cb <tty_dev_write+0xb5>
c00050bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00050bf:	3c 20                	cmp    $0x20,%al
c00050c1:	74 08                	je     c00050cb <tty_dev_write+0xb5>
c00050c3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00050c7:	84 c0                	test   %al,%al
c00050c9:	75 58                	jne    c0005123 <tty_dev_write+0x10d>
c00050cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ce:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c00050d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00050d7:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00050dd:	01 d0                	add    %edx,%eax
c00050df:	83 e8 01             	sub    $0x1,%eax
c00050e2:	89 c2                	mov    %eax,%edx
c00050e4:	83 ec 04             	sub    $0x4,%esp
c00050e7:	6a 01                	push   $0x1
c00050e9:	8d 45 e7             	lea    -0x19(%ebp),%eax
c00050ec:	50                   	push   %eax
c00050ed:	52                   	push   %edx
c00050ee:	e8 94 2a 00 00       	call   c0007b87 <Memcpy>
c00050f3:	83 c4 10             	add    $0x10,%esp
c00050f6:	8b 45 08             	mov    0x8(%ebp),%eax
c00050f9:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00050ff:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005102:	8b 45 08             	mov    0x8(%ebp),%eax
c0005105:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000510b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000510f:	0f b6 c0             	movzbl %al,%eax
c0005112:	83 ec 08             	sub    $0x8,%esp
c0005115:	50                   	push   %eax
c0005116:	ff 75 08             	pushl  0x8(%ebp)
c0005119:	e8 11 fd ff ff       	call   c0004e2f <out_char>
c000511e:	83 c4 10             	add    $0x10,%esp
c0005121:	eb 7c                	jmp    c000519f <tty_dev_write+0x189>
c0005123:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005127:	3c 08                	cmp    $0x8,%al
c0005129:	75 42                	jne    c000516d <tty_dev_write+0x157>
c000512b:	8b 45 08             	mov    0x8(%ebp),%eax
c000512e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005134:	8d 50 01             	lea    0x1(%eax),%edx
c0005137:	8b 45 08             	mov    0x8(%ebp),%eax
c000513a:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005140:	8b 45 08             	mov    0x8(%ebp),%eax
c0005143:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005149:	8d 50 fe             	lea    -0x2(%eax),%edx
c000514c:	8b 45 08             	mov    0x8(%ebp),%eax
c000514f:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005155:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005159:	0f b6 c0             	movzbl %al,%eax
c000515c:	83 ec 08             	sub    $0x8,%esp
c000515f:	50                   	push   %eax
c0005160:	ff 75 08             	pushl  0x8(%ebp)
c0005163:	e8 c7 fc ff ff       	call   c0004e2f <out_char>
c0005168:	83 c4 10             	add    $0x10,%esp
c000516b:	eb 32                	jmp    c000519f <tty_dev_write+0x189>
c000516d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005171:	3c 0a                	cmp    $0xa,%al
c0005173:	75 2a                	jne    c000519f <tty_dev_write+0x189>
c0005175:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005179:	0f b6 c0             	movzbl %al,%eax
c000517c:	83 ec 08             	sub    $0x8,%esp
c000517f:	50                   	push   %eax
c0005180:	ff 75 08             	pushl  0x8(%ebp)
c0005183:	e8 a7 fc ff ff       	call   c0004e2f <out_char>
c0005188:	83 c4 10             	add    $0x10,%esp
c000518b:	8b 45 08             	mov    0x8(%ebp),%eax
c000518e:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0005195:	00 00 00 
c0005198:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000519f:	8b 45 08             	mov    0x8(%ebp),%eax
c00051a2:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00051a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00051ab:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00051b1:	39 c2                	cmp    %eax,%edx
c00051b3:	75 07                	jne    c00051bc <tty_dev_write+0x1a6>
c00051b5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00051bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00051bf:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00051c5:	85 c0                	test   %eax,%eax
c00051c7:	0f 85 67 fe ff ff    	jne    c0005034 <tty_dev_write+0x1e>
c00051cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00051d1:	74 6d                	je     c0005240 <tty_dev_write+0x22a>
c00051d3:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c00051da:	83 ec 0c             	sub    $0xc,%esp
c00051dd:	ff 75 ec             	pushl  -0x14(%ebp)
c00051e0:	e8 df d3 ff ff       	call   c00025c4 <sys_malloc>
c00051e5:	83 c4 10             	add    $0x10,%esp
c00051e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00051eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00051ee:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c00051f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00051f8:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00051fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005201:	89 50 60             	mov    %edx,0x60(%eax)
c0005204:	8b 45 08             	mov    0x8(%ebp),%eax
c0005207:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c000520d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005210:	89 50 68             	mov    %edx,0x68(%eax)
c0005213:	8b 45 08             	mov    0x8(%ebp),%eax
c0005216:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000521c:	83 ec 04             	sub    $0x4,%esp
c000521f:	50                   	push   %eax
c0005220:	ff 75 e8             	pushl  -0x18(%ebp)
c0005223:	6a 01                	push   $0x1
c0005225:	e8 51 52 00 00       	call   c000a47b <send_rec>
c000522a:	83 c4 10             	add    $0x10,%esp
c000522d:	83 ec 08             	sub    $0x8,%esp
c0005230:	ff 75 ec             	pushl  -0x14(%ebp)
c0005233:	ff 75 e8             	pushl  -0x18(%ebp)
c0005236:	e8 9e d3 ff ff       	call   c00025d9 <sys_free>
c000523b:	83 c4 10             	add    $0x10,%esp
c000523e:	eb 01                	jmp    c0005241 <tty_dev_write+0x22b>
c0005240:	90                   	nop
c0005241:	c9                   	leave  
c0005242:	c3                   	ret    

c0005243 <tty_do_read>:
c0005243:	55                   	push   %ebp
c0005244:	89 e5                	mov    %esp,%ebp
c0005246:	83 ec 08             	sub    $0x8,%esp
c0005249:	8b 45 08             	mov    0x8(%ebp),%eax
c000524c:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005253:	00 00 00 
c0005256:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005259:	8b 50 68             	mov    0x68(%eax),%edx
c000525c:	8b 45 08             	mov    0x8(%ebp),%eax
c000525f:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0005265:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005268:	8b 00                	mov    (%eax),%eax
c000526a:	89 c2                	mov    %eax,%edx
c000526c:	8b 45 08             	mov    0x8(%ebp),%eax
c000526f:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0005275:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005278:	8b 50 60             	mov    0x60(%eax),%edx
c000527b:	8b 45 08             	mov    0x8(%ebp),%eax
c000527e:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005284:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005287:	8b 50 60             	mov    0x60(%eax),%edx
c000528a:	8b 45 08             	mov    0x8(%ebp),%eax
c000528d:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005293:	8b 45 08             	mov    0x8(%ebp),%eax
c0005296:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c000529c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000529f:	8b 40 10             	mov    0x10(%eax),%eax
c00052a2:	83 ec 08             	sub    $0x8,%esp
c00052a5:	52                   	push   %edx
c00052a6:	50                   	push   %eax
c00052a7:	e8 9f 1b 00 00       	call   c0006e4b <alloc_virtual_memory>
c00052ac:	83 c4 10             	add    $0x10,%esp
c00052af:	89 c2                	mov    %eax,%edx
c00052b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00052b4:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00052ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00052bd:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00052c3:	83 f8 02             	cmp    $0x2,%eax
c00052c6:	74 1c                	je     c00052e4 <tty_do_read+0xa1>
c00052c8:	68 3b 01 00 00       	push   $0x13b
c00052cd:	68 51 b8 00 c0       	push   $0xc000b851
c00052d2:	68 51 b8 00 c0       	push   $0xc000b851
c00052d7:	68 5b b8 00 c0       	push   $0xc000b85b
c00052dc:	e8 5d 48 00 00       	call   c0009b3e <assertion_failure>
c00052e1:	83 c4 10             	add    $0x10,%esp
c00052e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00052e7:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c00052ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00052f1:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00052f7:	83 ec 04             	sub    $0x4,%esp
c00052fa:	50                   	push   %eax
c00052fb:	ff 75 0c             	pushl  0xc(%ebp)
c00052fe:	6a 01                	push   $0x1
c0005300:	e8 76 51 00 00       	call   c000a47b <send_rec>
c0005305:	83 c4 10             	add    $0x10,%esp
c0005308:	90                   	nop
c0005309:	c9                   	leave  
c000530a:	c3                   	ret    

c000530b <tty_do_write>:
c000530b:	55                   	push   %ebp
c000530c:	89 e5                	mov    %esp,%ebp
c000530e:	53                   	push   %ebx
c000530f:	83 ec 24             	sub    $0x24,%esp
c0005312:	89 e0                	mov    %esp,%eax
c0005314:	89 c3                	mov    %eax,%ebx
c0005316:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000531d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005320:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005323:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005326:	89 c2                	mov    %eax,%edx
c0005328:	b8 10 00 00 00       	mov    $0x10,%eax
c000532d:	83 e8 01             	sub    $0x1,%eax
c0005330:	01 d0                	add    %edx,%eax
c0005332:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005337:	ba 00 00 00 00       	mov    $0x0,%edx
c000533c:	f7 f1                	div    %ecx
c000533e:	6b c0 10             	imul   $0x10,%eax,%eax
c0005341:	29 c4                	sub    %eax,%esp
c0005343:	89 e0                	mov    %esp,%eax
c0005345:	83 c0 00             	add    $0x0,%eax
c0005348:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000534b:	83 ec 04             	sub    $0x4,%esp
c000534e:	ff 75 e8             	pushl  -0x18(%ebp)
c0005351:	6a 00                	push   $0x0
c0005353:	ff 75 e0             	pushl  -0x20(%ebp)
c0005356:	e8 6c 6f 00 00       	call   c000c2c7 <Memset>
c000535b:	83 c4 10             	add    $0x10,%esp
c000535e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005361:	8b 40 60             	mov    0x60(%eax),%eax
c0005364:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005367:	8b 45 08             	mov    0x8(%ebp),%eax
c000536a:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005371:	00 00 00 
c0005374:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005377:	8b 45 0c             	mov    0xc(%ebp),%eax
c000537a:	8b 40 10             	mov    0x10(%eax),%eax
c000537d:	83 ec 08             	sub    $0x8,%esp
c0005380:	52                   	push   %edx
c0005381:	50                   	push   %eax
c0005382:	e8 c4 1a 00 00       	call   c0006e4b <alloc_virtual_memory>
c0005387:	83 c4 10             	add    $0x10,%esp
c000538a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000538d:	eb 7e                	jmp    c000540d <tty_do_write+0x102>
c000538f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005392:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005395:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005399:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000539c:	8b 45 08             	mov    0x8(%ebp),%eax
c000539f:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00053a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00053a8:	01 d0                	add    %edx,%eax
c00053aa:	83 ec 04             	sub    $0x4,%esp
c00053ad:	ff 75 f0             	pushl  -0x10(%ebp)
c00053b0:	50                   	push   %eax
c00053b1:	ff 75 e0             	pushl  -0x20(%ebp)
c00053b4:	e8 ce 27 00 00       	call   c0007b87 <Memcpy>
c00053b9:	83 c4 10             	add    $0x10,%esp
c00053bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00053bf:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00053c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00053c5:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00053cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00053ce:	01 c2                	add    %eax,%edx
c00053d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00053d3:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00053d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00053e0:	eb 25                	jmp    c0005407 <tty_do_write+0xfc>
c00053e2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00053e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00053e8:	01 d0                	add    %edx,%eax
c00053ea:	0f b6 00             	movzbl (%eax),%eax
c00053ed:	0f b6 c0             	movzbl %al,%eax
c00053f0:	83 ec 08             	sub    $0x8,%esp
c00053f3:	50                   	push   %eax
c00053f4:	ff 75 08             	pushl  0x8(%ebp)
c00053f7:	e8 33 fa ff ff       	call   c0004e2f <out_char>
c00053fc:	83 c4 10             	add    $0x10,%esp
c00053ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005403:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005407:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000540b:	75 d5                	jne    c00053e2 <tty_do_write+0xd7>
c000540d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005411:	0f 85 78 ff ff ff    	jne    c000538f <tty_do_write+0x84>
c0005417:	83 ec 0c             	sub    $0xc,%esp
c000541a:	6a 7c                	push   $0x7c
c000541c:	e8 a3 d1 ff ff       	call   c00025c4 <sys_malloc>
c0005421:	83 c4 10             	add    $0x10,%esp
c0005424:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005427:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000542a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0005431:	8b 45 08             	mov    0x8(%ebp),%eax
c0005434:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000543a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000543d:	89 50 58             	mov    %edx,0x58(%eax)
c0005440:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005443:	8b 00                	mov    (%eax),%eax
c0005445:	83 ec 04             	sub    $0x4,%esp
c0005448:	50                   	push   %eax
c0005449:	ff 75 d8             	pushl  -0x28(%ebp)
c000544c:	6a 01                	push   $0x1
c000544e:	e8 28 50 00 00       	call   c000a47b <send_rec>
c0005453:	83 c4 10             	add    $0x10,%esp
c0005456:	83 ec 08             	sub    $0x8,%esp
c0005459:	6a 7c                	push   $0x7c
c000545b:	ff 75 d8             	pushl  -0x28(%ebp)
c000545e:	e8 76 d1 ff ff       	call   c00025d9 <sys_free>
c0005463:	83 c4 10             	add    $0x10,%esp
c0005466:	89 dc                	mov    %ebx,%esp
c0005468:	90                   	nop
c0005469:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000546c:	c9                   	leave  
c000546d:	c3                   	ret    

c000546e <init_screen>:
c000546e:	55                   	push   %ebp
c000546f:	89 e5                	mov    %esp,%ebp
c0005471:	83 ec 10             	sub    $0x10,%esp
c0005474:	8b 45 08             	mov    0x8(%ebp),%eax
c0005477:	2d 20 0e 01 c0       	sub    $0xc0010e20,%eax
c000547c:	c1 f8 03             	sar    $0x3,%eax
c000547f:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005485:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005488:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000548b:	c1 e0 04             	shl    $0x4,%eax
c000548e:	8d 90 34 1f 01 c0    	lea    -0x3ffee0cc(%eax),%edx
c0005494:	8b 45 08             	mov    0x8(%ebp),%eax
c0005497:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c000549d:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c00054a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00054a7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054ad:	8b 55 f8             	mov    -0x8(%ebp),%edx
c00054b0:	89 50 04             	mov    %edx,0x4(%eax)
c00054b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00054b6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054bc:	8b 50 04             	mov    0x4(%eax),%edx
c00054bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00054c2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054c8:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00054cc:	89 10                	mov    %edx,(%eax)
c00054ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00054d1:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c00054d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00054da:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00054e0:	8b 12                	mov    (%edx),%edx
c00054e2:	89 50 08             	mov    %edx,0x8(%eax)
c00054e5:	8b 55 08             	mov    0x8(%ebp),%edx
c00054e8:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c00054ee:	8b 40 08             	mov    0x8(%eax),%eax
c00054f1:	89 42 0c             	mov    %eax,0xc(%edx)
c00054f4:	90                   	nop
c00054f5:	c9                   	leave  
c00054f6:	c3                   	ret    

c00054f7 <init_tty>:
c00054f7:	55                   	push   %ebp
c00054f8:	89 e5                	mov    %esp,%ebp
c00054fa:	83 ec 18             	sub    $0x18,%esp
c00054fd:	c7 45 f4 20 0e 01 c0 	movl   $0xc0010e20,-0xc(%ebp)
c0005504:	e9 92 00 00 00       	jmp    c000559b <init_tty+0xa4>
c0005509:	83 ec 04             	sub    $0x4,%esp
c000550c:	68 28 08 00 00       	push   $0x828
c0005511:	6a 00                	push   $0x0
c0005513:	ff 75 f4             	pushl  -0xc(%ebp)
c0005516:	e8 ac 6d 00 00       	call   c000c2c7 <Memset>
c000551b:	83 c4 10             	add    $0x10,%esp
c000551e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005521:	8d 50 08             	lea    0x8(%eax),%edx
c0005524:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005527:	89 50 04             	mov    %edx,0x4(%eax)
c000552a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000552d:	8b 50 04             	mov    0x4(%eax),%edx
c0005530:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005533:	89 10                	mov    %edx,(%eax)
c0005535:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005538:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c000553f:	00 00 00 
c0005542:	83 ec 0c             	sub    $0xc,%esp
c0005545:	ff 75 f4             	pushl  -0xc(%ebp)
c0005548:	e8 21 ff ff ff       	call   c000546e <init_screen>
c000554d:	83 c4 10             	add    $0x10,%esp
c0005550:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005553:	2d 20 0e 01 c0       	sub    $0xc0010e20,%eax
c0005558:	85 c0                	test   %eax,%eax
c000555a:	7e 38                	jle    c0005594 <init_tty+0x9d>
c000555c:	83 ec 08             	sub    $0x8,%esp
c000555f:	6a 23                	push   $0x23
c0005561:	ff 75 f4             	pushl  -0xc(%ebp)
c0005564:	e8 c6 f8 ff ff       	call   c0004e2f <out_char>
c0005569:	83 c4 10             	add    $0x10,%esp
c000556c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000556f:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005574:	2d 20 0e 01 c0       	sub    $0xc0010e20,%eax
c0005579:	c1 f8 03             	sar    $0x3,%eax
c000557c:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005582:	0f b6 c0             	movzbl %al,%eax
c0005585:	83 ec 08             	sub    $0x8,%esp
c0005588:	50                   	push   %eax
c0005589:	ff 75 f4             	pushl  -0xc(%ebp)
c000558c:	e8 9e f8 ff ff       	call   c0004e2f <out_char>
c0005591:	83 c4 10             	add    $0x10,%esp
c0005594:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c000559b:	b8 48 16 01 c0       	mov    $0xc0011648,%eax
c00055a0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00055a3:	0f 82 60 ff ff ff    	jb     c0005509 <init_tty+0x12>
c00055a9:	90                   	nop
c00055aa:	c9                   	leave  
c00055ab:	c3                   	ret    

c00055ac <TaskTTY>:
c00055ac:	55                   	push   %ebp
c00055ad:	89 e5                	mov    %esp,%ebp
c00055af:	83 ec 28             	sub    $0x28,%esp
c00055b2:	e8 40 ff ff ff       	call   c00054f7 <init_tty>
c00055b7:	83 ec 0c             	sub    $0xc,%esp
c00055ba:	6a 00                	push   $0x0
c00055bc:	e8 24 f6 ff ff       	call   c0004be5 <select_console>
c00055c1:	83 c4 10             	add    $0x10,%esp
c00055c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00055cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00055d2:	83 ec 0c             	sub    $0xc,%esp
c00055d5:	6a 7c                	push   $0x7c
c00055d7:	e8 e8 cf ff ff       	call   c00025c4 <sys_malloc>
c00055dc:	83 c4 10             	add    $0x10,%esp
c00055df:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00055e2:	c7 45 f4 20 0e 01 c0 	movl   $0xc0010e20,-0xc(%ebp)
c00055e9:	eb 30                	jmp    c000561b <TaskTTY+0x6f>
c00055eb:	83 ec 0c             	sub    $0xc,%esp
c00055ee:	ff 75 f4             	pushl  -0xc(%ebp)
c00055f1:	e8 f6 f9 ff ff       	call   c0004fec <tty_dev_read>
c00055f6:	83 c4 10             	add    $0x10,%esp
c00055f9:	83 ec 0c             	sub    $0xc,%esp
c00055fc:	ff 75 f4             	pushl  -0xc(%ebp)
c00055ff:	e8 12 fa ff ff       	call   c0005016 <tty_dev_write>
c0005604:	83 c4 10             	add    $0x10,%esp
c0005607:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000560a:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005610:	85 c0                	test   %eax,%eax
c0005612:	75 d7                	jne    c00055eb <TaskTTY+0x3f>
c0005614:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c000561b:	b8 48 16 01 c0       	mov    $0xc0011648,%eax
c0005620:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005623:	72 c6                	jb     c00055eb <TaskTTY+0x3f>
c0005625:	83 ec 04             	sub    $0x4,%esp
c0005628:	6a 12                	push   $0x12
c000562a:	ff 75 e8             	pushl  -0x18(%ebp)
c000562d:	6a 02                	push   $0x2
c000562f:	e8 47 4e 00 00       	call   c000a47b <send_rec>
c0005634:	83 c4 10             	add    $0x10,%esp
c0005637:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000563a:	8b 40 78             	mov    0x78(%eax),%eax
c000563d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005640:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005647:	74 28                	je     c0005671 <TaskTTY+0xc5>
c0005649:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005650:	7f 0b                	jg     c000565d <TaskTTY+0xb1>
c0005652:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005659:	74 4e                	je     c00056a9 <TaskTTY+0xfd>
c000565b:	eb 4d                	jmp    c00056aa <TaskTTY+0xfe>
c000565d:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005664:	74 21                	je     c0005687 <TaskTTY+0xdb>
c0005666:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c000566d:	74 2e                	je     c000569d <TaskTTY+0xf1>
c000566f:	eb 39                	jmp    c00056aa <TaskTTY+0xfe>
c0005671:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0005676:	83 ec 08             	sub    $0x8,%esp
c0005679:	ff 75 e8             	pushl  -0x18(%ebp)
c000567c:	50                   	push   %eax
c000567d:	e8 c1 fb ff ff       	call   c0005243 <tty_do_read>
c0005682:	83 c4 10             	add    $0x10,%esp
c0005685:	eb 23                	jmp    c00056aa <TaskTTY+0xfe>
c0005687:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c000568c:	83 ec 08             	sub    $0x8,%esp
c000568f:	ff 75 e8             	pushl  -0x18(%ebp)
c0005692:	50                   	push   %eax
c0005693:	e8 73 fc ff ff       	call   c000530b <tty_do_write>
c0005698:	83 c4 10             	add    $0x10,%esp
c000569b:	eb 0d                	jmp    c00056aa <TaskTTY+0xfe>
c000569d:	c7 05 e0 16 01 c0 00 	movl   $0x0,0xc00116e0
c00056a4:	00 00 00 
c00056a7:	eb 01                	jmp    c00056aa <TaskTTY+0xfe>
c00056a9:	90                   	nop
c00056aa:	e9 33 ff ff ff       	jmp    c00055e2 <TaskTTY+0x36>

c00056af <keyboard_handler>:
c00056af:	55                   	push   %ebp
c00056b0:	89 e5                	mov    %esp,%ebp
c00056b2:	83 ec 18             	sub    $0x18,%esp
c00056b5:	c7 05 e0 16 01 c0 01 	movl   $0x1,0xc00116e0
c00056bc:	00 00 00 
c00056bf:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c00056c6:	a1 08 0c 01 c0       	mov    0xc0010c08,%eax
c00056cb:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00056d0:	7f 5e                	jg     c0005730 <keyboard_handler+0x81>
c00056d2:	e8 e4 bc ff ff       	call   c00013bb <disable_int>
c00056d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00056da:	0f b7 c0             	movzwl %ax,%eax
c00056dd:	83 ec 0c             	sub    $0xc,%esp
c00056e0:	50                   	push   %eax
c00056e1:	e8 a7 bc ff ff       	call   c000138d <in_byte>
c00056e6:	83 c4 10             	add    $0x10,%esp
c00056e9:	88 45 f3             	mov    %al,-0xd(%ebp)
c00056ec:	a1 00 0c 01 c0       	mov    0xc0010c00,%eax
c00056f1:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c00056f5:	88 10                	mov    %dl,(%eax)
c00056f7:	a1 00 0c 01 c0       	mov    0xc0010c00,%eax
c00056fc:	83 c0 01             	add    $0x1,%eax
c00056ff:	a3 00 0c 01 c0       	mov    %eax,0xc0010c00
c0005704:	a1 08 0c 01 c0       	mov    0xc0010c08,%eax
c0005709:	83 c0 01             	add    $0x1,%eax
c000570c:	a3 08 0c 01 c0       	mov    %eax,0xc0010c08
c0005711:	a1 00 0c 01 c0       	mov    0xc0010c00,%eax
c0005716:	ba 0c 0e 01 c0       	mov    $0xc0010e0c,%edx
c000571b:	39 d0                	cmp    %edx,%eax
c000571d:	72 0a                	jb     c0005729 <keyboard_handler+0x7a>
c000571f:	c7 05 00 0c 01 c0 0c 	movl   $0xc0010c0c,0xc0010c00
c0005726:	0c 01 c0 
c0005729:	e8 8f bc ff ff       	call   c00013bd <enable_int>
c000572e:	eb 01                	jmp    c0005731 <keyboard_handler+0x82>
c0005730:	90                   	nop
c0005731:	c9                   	leave  
c0005732:	c3                   	ret    

c0005733 <read_from_keyboard_buf>:
c0005733:	55                   	push   %ebp
c0005734:	89 e5                	mov    %esp,%ebp
c0005736:	83 ec 18             	sub    $0x18,%esp
c0005739:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c000573d:	a1 08 0c 01 c0       	mov    0xc0010c08,%eax
c0005742:	85 c0                	test   %eax,%eax
c0005744:	7f 06                	jg     c000574c <read_from_keyboard_buf+0x19>
c0005746:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c000574a:	eb 4b                	jmp    c0005797 <read_from_keyboard_buf+0x64>
c000574c:	e8 6a bc ff ff       	call   c00013bb <disable_int>
c0005751:	a1 04 0c 01 c0       	mov    0xc0010c04,%eax
c0005756:	0f b6 00             	movzbl (%eax),%eax
c0005759:	88 45 f7             	mov    %al,-0x9(%ebp)
c000575c:	a1 04 0c 01 c0       	mov    0xc0010c04,%eax
c0005761:	83 c0 01             	add    $0x1,%eax
c0005764:	a3 04 0c 01 c0       	mov    %eax,0xc0010c04
c0005769:	a1 08 0c 01 c0       	mov    0xc0010c08,%eax
c000576e:	83 e8 01             	sub    $0x1,%eax
c0005771:	a3 08 0c 01 c0       	mov    %eax,0xc0010c08
c0005776:	a1 04 0c 01 c0       	mov    0xc0010c04,%eax
c000577b:	ba 0c 0e 01 c0       	mov    $0xc0010e0c,%edx
c0005780:	39 d0                	cmp    %edx,%eax
c0005782:	72 0a                	jb     c000578e <read_from_keyboard_buf+0x5b>
c0005784:	c7 05 04 0c 01 c0 0c 	movl   $0xc0010c0c,0xc0010c04
c000578b:	0c 01 c0 
c000578e:	e8 2a bc ff ff       	call   c00013bd <enable_int>
c0005793:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005797:	c9                   	leave  
c0005798:	c3                   	ret    

c0005799 <keyboard_read>:
c0005799:	55                   	push   %ebp
c000579a:	89 e5                	mov    %esp,%ebp
c000579c:	83 ec 28             	sub    $0x28,%esp
c000579f:	90                   	nop
c00057a0:	a1 08 0c 01 c0       	mov    0xc0010c08,%eax
c00057a5:	85 c0                	test   %eax,%eax
c00057a7:	7e f7                	jle    c00057a0 <keyboard_read+0x7>
c00057a9:	e8 85 ff ff ff       	call   c0005733 <read_from_keyboard_buf>
c00057ae:	88 45 ea             	mov    %al,-0x16(%ebp)
c00057b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00057b8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00057bc:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c00057c0:	75 5a                	jne    c000581c <keyboard_read+0x83>
c00057c2:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c00057c6:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c00057ca:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c00057ce:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c00057d2:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c00057d6:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c00057da:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c00057de:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00057e5:	eb 20                	jmp    c0005807 <keyboard_read+0x6e>
c00057e7:	e8 47 ff ff ff       	call   c0005733 <read_from_keyboard_buf>
c00057ec:	89 c1                	mov    %eax,%ecx
c00057ee:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c00057f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00057f4:	01 d0                	add    %edx,%eax
c00057f6:	0f b6 00             	movzbl (%eax),%eax
c00057f9:	38 c1                	cmp    %al,%cl
c00057fb:	74 06                	je     c0005803 <keyboard_read+0x6a>
c00057fd:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005801:	eb 0a                	jmp    c000580d <keyboard_read+0x74>
c0005803:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005807:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c000580b:	7e da                	jle    c00057e7 <keyboard_read+0x4e>
c000580d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005811:	74 68                	je     c000587b <keyboard_read+0xe2>
c0005813:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c000581a:	eb 5f                	jmp    c000587b <keyboard_read+0xe2>
c000581c:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005820:	75 59                	jne    c000587b <keyboard_read+0xe2>
c0005822:	e8 0c ff ff ff       	call   c0005733 <read_from_keyboard_buf>
c0005827:	3c 2a                	cmp    $0x2a,%al
c0005829:	75 1d                	jne    c0005848 <keyboard_read+0xaf>
c000582b:	e8 03 ff ff ff       	call   c0005733 <read_from_keyboard_buf>
c0005830:	3c e0                	cmp    $0xe0,%al
c0005832:	75 14                	jne    c0005848 <keyboard_read+0xaf>
c0005834:	e8 fa fe ff ff       	call   c0005733 <read_from_keyboard_buf>
c0005839:	3c 37                	cmp    $0x37,%al
c000583b:	75 0b                	jne    c0005848 <keyboard_read+0xaf>
c000583d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005844:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005848:	e8 e6 fe ff ff       	call   c0005733 <read_from_keyboard_buf>
c000584d:	3c b7                	cmp    $0xb7,%al
c000584f:	75 1d                	jne    c000586e <keyboard_read+0xd5>
c0005851:	e8 dd fe ff ff       	call   c0005733 <read_from_keyboard_buf>
c0005856:	3c e0                	cmp    $0xe0,%al
c0005858:	75 14                	jne    c000586e <keyboard_read+0xd5>
c000585a:	e8 d4 fe ff ff       	call   c0005733 <read_from_keyboard_buf>
c000585f:	3c aa                	cmp    $0xaa,%al
c0005861:	75 0b                	jne    c000586e <keyboard_read+0xd5>
c0005863:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c000586a:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c000586e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005872:	75 07                	jne    c000587b <keyboard_read+0xe2>
c0005874:	c6 05 a4 07 01 c0 01 	movb   $0x1,0xc00107a4
c000587b:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005882:	0f 84 8d 00 00 00    	je     c0005915 <keyboard_read+0x17c>
c0005888:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c000588f:	0f 84 80 00 00 00    	je     c0005915 <keyboard_read+0x17c>
c0005895:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005899:	0f 94 c2             	sete   %dl
c000589c:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c00058a0:	0f 94 c0             	sete   %al
c00058a3:	09 d0                	or     %edx,%eax
c00058a5:	84 c0                	test   %al,%al
c00058a7:	74 07                	je     c00058b0 <keyboard_read+0x117>
c00058a9:	c6 05 e4 16 01 c0 01 	movb   $0x1,0xc00116e4
c00058b0:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c00058b4:	f7 d0                	not    %eax
c00058b6:	c0 e8 07             	shr    $0x7,%al
c00058b9:	88 45 e9             	mov    %al,-0x17(%ebp)
c00058bc:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c00058c0:	74 53                	je     c0005915 <keyboard_read+0x17c>
c00058c2:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c00058c6:	74 4d                	je     c0005915 <keyboard_read+0x17c>
c00058c8:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c00058cc:	0f b6 05 e4 16 01 c0 	movzbl 0xc00116e4,%eax
c00058d3:	3c 01                	cmp    $0x1,%al
c00058d5:	75 04                	jne    c00058db <keyboard_read+0x142>
c00058d7:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c00058db:	0f b6 05 a4 07 01 c0 	movzbl 0xc00107a4,%eax
c00058e2:	84 c0                	test   %al,%al
c00058e4:	74 04                	je     c00058ea <keyboard_read+0x151>
c00058e6:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c00058ea:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c00058ee:	89 d0                	mov    %edx,%eax
c00058f0:	01 c0                	add    %eax,%eax
c00058f2:	01 c2                	add    %eax,%edx
c00058f4:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00058f8:	01 d0                	add    %edx,%eax
c00058fa:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005901:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005904:	83 ec 08             	sub    $0x8,%esp
c0005907:	ff 75 f4             	pushl  -0xc(%ebp)
c000590a:	ff 75 08             	pushl  0x8(%ebp)
c000590d:	e8 1a 00 00 00       	call   c000592c <in_process>
c0005912:	83 c4 10             	add    $0x10,%esp
c0005915:	90                   	nop
c0005916:	c9                   	leave  
c0005917:	c3                   	ret    

c0005918 <init_keyboard_handler>:
c0005918:	55                   	push   %ebp
c0005919:	89 e5                	mov    %esp,%ebp
c000591b:	c6 05 a4 07 01 c0 00 	movb   $0x0,0xc00107a4
c0005922:	c6 05 e4 16 01 c0 00 	movb   $0x0,0xc00116e4
c0005929:	90                   	nop
c000592a:	5d                   	pop    %ebp
c000592b:	c3                   	ret    

c000592c <in_process>:
c000592c:	55                   	push   %ebp
c000592d:	89 e5                	mov    %esp,%ebp
c000592f:	83 ec 18             	sub    $0x18,%esp
c0005932:	83 ec 04             	sub    $0x4,%esp
c0005935:	6a 02                	push   $0x2
c0005937:	6a 00                	push   $0x0
c0005939:	8d 45 f6             	lea    -0xa(%ebp),%eax
c000593c:	50                   	push   %eax
c000593d:	e8 85 69 00 00       	call   c000c2c7 <Memset>
c0005942:	83 c4 10             	add    $0x10,%esp
c0005945:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005948:	25 00 01 00 00       	and    $0x100,%eax
c000594d:	85 c0                	test   %eax,%eax
c000594f:	75 28                	jne    c0005979 <in_process+0x4d>
c0005951:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005954:	0f b6 c0             	movzbl %al,%eax
c0005957:	83 ec 08             	sub    $0x8,%esp
c000595a:	50                   	push   %eax
c000595b:	ff 75 08             	pushl  0x8(%ebp)
c000595e:	e8 b3 f3 ff ff       	call   c0004d16 <put_key>
c0005963:	83 c4 10             	add    $0x10,%esp
c0005966:	c6 05 a4 07 01 c0 00 	movb   $0x0,0xc00107a4
c000596d:	c6 05 e4 16 01 c0 00 	movb   $0x0,0xc00116e4
c0005974:	e9 42 01 00 00       	jmp    c0005abb <in_process+0x18f>
c0005979:	0f b6 05 e4 16 01 c0 	movzbl 0xc00116e4,%eax
c0005980:	84 c0                	test   %al,%al
c0005982:	0f 84 a9 00 00 00    	je     c0005a31 <in_process+0x105>
c0005988:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c000598c:	0f 84 9f 00 00 00    	je     c0005a31 <in_process+0x105>
c0005992:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005996:	0f 84 95 00 00 00    	je     c0005a31 <in_process+0x105>
c000599c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00059a3:	74 64                	je     c0005a09 <in_process+0xdd>
c00059a5:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c00059ac:	77 0b                	ja     c00059b9 <in_process+0x8d>
c00059ae:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c00059b5:	74 64                	je     c0005a1b <in_process+0xef>
c00059b7:	eb 73                	jmp    c0005a2c <in_process+0x100>
c00059b9:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c00059c0:	74 0b                	je     c00059cd <in_process+0xa1>
c00059c2:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c00059c9:	74 20                	je     c00059eb <in_process+0xbf>
c00059cb:	eb 5f                	jmp    c0005a2c <in_process+0x100>
c00059cd:	83 ec 0c             	sub    $0xc,%esp
c00059d0:	ff 75 08             	pushl  0x8(%ebp)
c00059d3:	e8 aa f3 ff ff       	call   c0004d82 <scroll_up>
c00059d8:	83 c4 10             	add    $0x10,%esp
c00059db:	c6 05 e4 16 01 c0 00 	movb   $0x0,0xc00116e4
c00059e2:	c6 05 a4 07 01 c0 00 	movb   $0x0,0xc00107a4
c00059e9:	eb 41                	jmp    c0005a2c <in_process+0x100>
c00059eb:	83 ec 0c             	sub    $0xc,%esp
c00059ee:	ff 75 08             	pushl  0x8(%ebp)
c00059f1:	e8 ce f3 ff ff       	call   c0004dc4 <scroll_down>
c00059f6:	83 c4 10             	add    $0x10,%esp
c00059f9:	c6 05 e4 16 01 c0 00 	movb   $0x0,0xc00116e4
c0005a00:	c6 05 a4 07 01 c0 00 	movb   $0x0,0xc00107a4
c0005a07:	eb 23                	jmp    c0005a2c <in_process+0x100>
c0005a09:	83 ec 08             	sub    $0x8,%esp
c0005a0c:	6a 0a                	push   $0xa
c0005a0e:	ff 75 08             	pushl  0x8(%ebp)
c0005a11:	e8 19 f4 ff ff       	call   c0004e2f <out_char>
c0005a16:	83 c4 10             	add    $0x10,%esp
c0005a19:	eb 11                	jmp    c0005a2c <in_process+0x100>
c0005a1b:	83 ec 08             	sub    $0x8,%esp
c0005a1e:	6a 08                	push   $0x8
c0005a20:	ff 75 08             	pushl  0x8(%ebp)
c0005a23:	e8 07 f4 ff ff       	call   c0004e2f <out_char>
c0005a28:	83 c4 10             	add    $0x10,%esp
c0005a2b:	90                   	nop
c0005a2c:	e9 8a 00 00 00       	jmp    c0005abb <in_process+0x18f>
c0005a31:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005a38:	74 55                	je     c0005a8f <in_process+0x163>
c0005a3a:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005a41:	77 14                	ja     c0005a57 <in_process+0x12b>
c0005a43:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005a4a:	74 31                	je     c0005a7d <in_process+0x151>
c0005a4c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005a53:	74 16                	je     c0005a6b <in_process+0x13f>
c0005a55:	eb 64                	jmp    c0005abb <in_process+0x18f>
c0005a57:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005a5e:	74 3e                	je     c0005a9e <in_process+0x172>
c0005a60:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005a67:	74 44                	je     c0005aad <in_process+0x181>
c0005a69:	eb 50                	jmp    c0005abb <in_process+0x18f>
c0005a6b:	83 ec 08             	sub    $0x8,%esp
c0005a6e:	6a 0a                	push   $0xa
c0005a70:	ff 75 08             	pushl  0x8(%ebp)
c0005a73:	e8 9e f2 ff ff       	call   c0004d16 <put_key>
c0005a78:	83 c4 10             	add    $0x10,%esp
c0005a7b:	eb 3e                	jmp    c0005abb <in_process+0x18f>
c0005a7d:	83 ec 08             	sub    $0x8,%esp
c0005a80:	6a 08                	push   $0x8
c0005a82:	ff 75 08             	pushl  0x8(%ebp)
c0005a85:	e8 8c f2 ff ff       	call   c0004d16 <put_key>
c0005a8a:	83 c4 10             	add    $0x10,%esp
c0005a8d:	eb 2c                	jmp    c0005abb <in_process+0x18f>
c0005a8f:	83 ec 0c             	sub    $0xc,%esp
c0005a92:	6a 00                	push   $0x0
c0005a94:	e8 4c f1 ff ff       	call   c0004be5 <select_console>
c0005a99:	83 c4 10             	add    $0x10,%esp
c0005a9c:	eb 1d                	jmp    c0005abb <in_process+0x18f>
c0005a9e:	83 ec 0c             	sub    $0xc,%esp
c0005aa1:	6a 01                	push   $0x1
c0005aa3:	e8 3d f1 ff ff       	call   c0004be5 <select_console>
c0005aa8:	83 c4 10             	add    $0x10,%esp
c0005aab:	eb 0e                	jmp    c0005abb <in_process+0x18f>
c0005aad:	83 ec 0c             	sub    $0xc,%esp
c0005ab0:	6a 02                	push   $0x2
c0005ab2:	e8 2e f1 ff ff       	call   c0004be5 <select_console>
c0005ab7:	83 c4 10             	add    $0x10,%esp
c0005aba:	90                   	nop
c0005abb:	90                   	nop
c0005abc:	c9                   	leave  
c0005abd:	c3                   	ret    

c0005abe <open>:
c0005abe:	55                   	push   %ebp
c0005abf:	89 e5                	mov    %esp,%ebp
c0005ac1:	83 ec 18             	sub    $0x18,%esp
c0005ac4:	83 ec 0c             	sub    $0xc,%esp
c0005ac7:	6a 7c                	push   $0x7c
c0005ac9:	e8 f6 ca ff ff       	call   c00025c4 <sys_malloc>
c0005ace:	83 c4 10             	add    $0x10,%esp
c0005ad1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005ad4:	83 ec 04             	sub    $0x4,%esp
c0005ad7:	6a 7c                	push   $0x7c
c0005ad9:	6a 00                	push   $0x0
c0005adb:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ade:	e8 e4 67 00 00       	call   c000c2c7 <Memset>
c0005ae3:	83 c4 10             	add    $0x10,%esp
c0005ae6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ae9:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0005af0:	83 ec 0c             	sub    $0xc,%esp
c0005af3:	ff 75 08             	pushl  0x8(%ebp)
c0005af6:	e8 1e 14 00 00       	call   c0006f19 <get_physical_address>
c0005afb:	83 c4 10             	add    $0x10,%esp
c0005afe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b04:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005b07:	89 50 44             	mov    %edx,0x44(%eax)
c0005b0a:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005b0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b10:	89 50 74             	mov    %edx,0x74(%eax)
c0005b13:	83 ec 0c             	sub    $0xc,%esp
c0005b16:	ff 75 08             	pushl  0x8(%ebp)
c0005b19:	e8 e2 67 00 00       	call   c000c300 <Strlen>
c0005b1e:	83 c4 10             	add    $0x10,%esp
c0005b21:	89 c2                	mov    %eax,%edx
c0005b23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b26:	89 50 40             	mov    %edx,0x40(%eax)
c0005b29:	83 ec 04             	sub    $0x4,%esp
c0005b2c:	6a 02                	push   $0x2
c0005b2e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b31:	6a 03                	push   $0x3
c0005b33:	e8 43 49 00 00       	call   c000a47b <send_rec>
c0005b38:	83 c4 10             	add    $0x10,%esp
c0005b3b:	83 ec 08             	sub    $0x8,%esp
c0005b3e:	6a 7c                	push   $0x7c
c0005b40:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b43:	e8 91 ca ff ff       	call   c00025d9 <sys_free>
c0005b48:	83 c4 10             	add    $0x10,%esp
c0005b4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005b4e:	8b 40 50             	mov    0x50(%eax),%eax
c0005b51:	c9                   	leave  
c0005b52:	c3                   	ret    

c0005b53 <read>:
c0005b53:	55                   	push   %ebp
c0005b54:	89 e5                	mov    %esp,%ebp
c0005b56:	83 ec 38             	sub    $0x38,%esp
c0005b59:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0005b60:	83 ec 0c             	sub    $0xc,%esp
c0005b63:	ff 75 dc             	pushl  -0x24(%ebp)
c0005b66:	e8 59 ca ff ff       	call   c00025c4 <sys_malloc>
c0005b6b:	83 c4 10             	add    $0x10,%esp
c0005b6e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005b71:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b74:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0005b79:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005b7c:	83 ec 0c             	sub    $0xc,%esp
c0005b7f:	ff 75 0c             	pushl  0xc(%ebp)
c0005b82:	e8 92 13 00 00       	call   c0006f19 <get_physical_address>
c0005b87:	83 c4 10             	add    $0x10,%esp
c0005b8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005b8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005b90:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0005b95:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005b98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005b9b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0005ba0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005ba3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005baa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005bb1:	8b 55 10             	mov    0x10(%ebp),%edx
c0005bb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005bb7:	01 d0                	add    %edx,%eax
c0005bb9:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0005bbc:	0f 83 a8 00 00 00    	jae    c0005c6a <read+0x117>
c0005bc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005bc5:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0005bc8:	05 00 10 00 00       	add    $0x1000,%eax
c0005bcd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005bd0:	8b 45 10             	mov    0x10(%ebp),%eax
c0005bd3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005bd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005bd9:	83 ec 04             	sub    $0x4,%esp
c0005bdc:	50                   	push   %eax
c0005bdd:	6a 00                	push   $0x0
c0005bdf:	ff 75 d8             	pushl  -0x28(%ebp)
c0005be2:	e8 e0 66 00 00       	call   c000c2c7 <Memset>
c0005be7:	83 c4 10             	add    $0x10,%esp
c0005bea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005bed:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0005bf4:	8b 55 08             	mov    0x8(%ebp),%edx
c0005bf7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005bfa:	89 50 50             	mov    %edx,0x50(%eax)
c0005bfd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c00:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005c03:	89 50 10             	mov    %edx,0x10(%eax)
c0005c06:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c09:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0005c0c:	89 50 60             	mov    %edx,0x60(%eax)
c0005c0f:	83 ec 04             	sub    $0x4,%esp
c0005c12:	6a 02                	push   $0x2
c0005c14:	ff 75 d8             	pushl  -0x28(%ebp)
c0005c17:	6a 03                	push   $0x3
c0005c19:	e8 5d 48 00 00       	call   c000a47b <send_rec>
c0005c1e:	83 c4 10             	add    $0x10,%esp
c0005c21:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c24:	8b 40 60             	mov    0x60(%eax),%eax
c0005c27:	01 45 e8             	add    %eax,-0x18(%ebp)
c0005c2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005c2d:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0005c30:	8b 45 10             	mov    0x10(%ebp),%eax
c0005c33:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0005c36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005c39:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005c3c:	89 45 10             	mov    %eax,0x10(%ebp)
c0005c3f:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0005c46:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0005c4d:	83 ec 0c             	sub    $0xc,%esp
c0005c50:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c53:	e8 c1 12 00 00       	call   c0006f19 <get_physical_address>
c0005c58:	83 c4 10             	add    $0x10,%esp
c0005c5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005c5e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0005c62:	0f 85 6e ff ff ff    	jne    c0005bd6 <read+0x83>
c0005c68:	eb 54                	jmp    c0005cbe <read+0x16b>
c0005c6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005c6d:	83 ec 04             	sub    $0x4,%esp
c0005c70:	50                   	push   %eax
c0005c71:	6a 00                	push   $0x0
c0005c73:	ff 75 d8             	pushl  -0x28(%ebp)
c0005c76:	e8 4c 66 00 00       	call   c000c2c7 <Memset>
c0005c7b:	83 c4 10             	add    $0x10,%esp
c0005c7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c81:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0005c88:	8b 55 08             	mov    0x8(%ebp),%edx
c0005c8b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c8e:	89 50 50             	mov    %edx,0x50(%eax)
c0005c91:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005c94:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005c97:	89 50 10             	mov    %edx,0x10(%eax)
c0005c9a:	8b 55 10             	mov    0x10(%ebp),%edx
c0005c9d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ca0:	89 50 60             	mov    %edx,0x60(%eax)
c0005ca3:	83 ec 04             	sub    $0x4,%esp
c0005ca6:	6a 02                	push   $0x2
c0005ca8:	ff 75 d8             	pushl  -0x28(%ebp)
c0005cab:	6a 03                	push   $0x3
c0005cad:	e8 c9 47 00 00       	call   c000a47b <send_rec>
c0005cb2:	83 c4 10             	add    $0x10,%esp
c0005cb5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005cb8:	8b 40 60             	mov    0x60(%eax),%eax
c0005cbb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005cbe:	83 ec 08             	sub    $0x8,%esp
c0005cc1:	ff 75 dc             	pushl  -0x24(%ebp)
c0005cc4:	ff 75 d8             	pushl  -0x28(%ebp)
c0005cc7:	e8 0d c9 ff ff       	call   c00025d9 <sys_free>
c0005ccc:	83 c4 10             	add    $0x10,%esp
c0005ccf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005cd2:	c9                   	leave  
c0005cd3:	c3                   	ret    

c0005cd4 <write>:
c0005cd4:	55                   	push   %ebp
c0005cd5:	89 e5                	mov    %esp,%ebp
c0005cd7:	83 ec 18             	sub    $0x18,%esp
c0005cda:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0005ce1:	83 ec 0c             	sub    $0xc,%esp
c0005ce4:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ce7:	e8 d8 c8 ff ff       	call   c00025c4 <sys_malloc>
c0005cec:	83 c4 10             	add    $0x10,%esp
c0005cef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005cf2:	83 ec 0c             	sub    $0xc,%esp
c0005cf5:	ff 75 0c             	pushl  0xc(%ebp)
c0005cf8:	e8 1c 12 00 00       	call   c0006f19 <get_physical_address>
c0005cfd:	83 c4 10             	add    $0x10,%esp
c0005d00:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005d03:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d06:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0005d0d:	8b 55 08             	mov    0x8(%ebp),%edx
c0005d10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d13:	89 50 50             	mov    %edx,0x50(%eax)
c0005d16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d19:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005d1c:	89 50 10             	mov    %edx,0x10(%eax)
c0005d1f:	8b 55 10             	mov    0x10(%ebp),%edx
c0005d22:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d25:	89 50 60             	mov    %edx,0x60(%eax)
c0005d28:	83 ec 04             	sub    $0x4,%esp
c0005d2b:	6a 02                	push   $0x2
c0005d2d:	ff 75 f0             	pushl  -0x10(%ebp)
c0005d30:	6a 03                	push   $0x3
c0005d32:	e8 44 47 00 00       	call   c000a47b <send_rec>
c0005d37:	83 c4 10             	add    $0x10,%esp
c0005d3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d3d:	8b 40 60             	mov    0x60(%eax),%eax
c0005d40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005d43:	83 ec 08             	sub    $0x8,%esp
c0005d46:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d49:	ff 75 f0             	pushl  -0x10(%ebp)
c0005d4c:	e8 88 c8 ff ff       	call   c00025d9 <sys_free>
c0005d51:	83 c4 10             	add    $0x10,%esp
c0005d54:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005d57:	c9                   	leave  
c0005d58:	c3                   	ret    

c0005d59 <close>:
c0005d59:	55                   	push   %ebp
c0005d5a:	89 e5                	mov    %esp,%ebp
c0005d5c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005d62:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005d69:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d6c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005d6f:	83 ec 04             	sub    $0x4,%esp
c0005d72:	6a 02                	push   $0x2
c0005d74:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005d7a:	50                   	push   %eax
c0005d7b:	6a 03                	push   $0x3
c0005d7d:	e8 f9 46 00 00       	call   c000a47b <send_rec>
c0005d82:	83 c4 10             	add    $0x10,%esp
c0005d85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d88:	83 f8 65             	cmp    $0x65,%eax
c0005d8b:	74 19                	je     c0005da6 <close+0x4d>
c0005d8d:	6a 13                	push   $0x13
c0005d8f:	68 73 b8 00 c0       	push   $0xc000b873
c0005d94:	68 73 b8 00 c0       	push   $0xc000b873
c0005d99:	68 7f b8 00 c0       	push   $0xc000b87f
c0005d9e:	e8 9b 3d 00 00       	call   c0009b3e <assertion_failure>
c0005da3:	83 c4 10             	add    $0x10,%esp
c0005da6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005da9:	c9                   	leave  
c0005daa:	c3                   	ret    

c0005dab <wait>:
c0005dab:	55                   	push   %ebp
c0005dac:	89 e5                	mov    %esp,%ebp
c0005dae:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005db4:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005dbb:	83 ec 04             	sub    $0x4,%esp
c0005dbe:	6a 01                	push   $0x1
c0005dc0:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005dc6:	50                   	push   %eax
c0005dc7:	6a 03                	push   $0x3
c0005dc9:	e8 ad 46 00 00       	call   c000a47b <send_rec>
c0005dce:	83 c4 10             	add    $0x10,%esp
c0005dd1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005dd4:	89 c2                	mov    %eax,%edx
c0005dd6:	8b 45 08             	mov    0x8(%ebp),%eax
c0005dd9:	89 10                	mov    %edx,(%eax)
c0005ddb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005dde:	83 f8 21             	cmp    $0x21,%eax
c0005de1:	74 05                	je     c0005de8 <wait+0x3d>
c0005de3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005de6:	eb 05                	jmp    c0005ded <wait+0x42>
c0005de8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005ded:	c9                   	leave  
c0005dee:	c3                   	ret    

c0005def <exit>:
c0005def:	55                   	push   %ebp
c0005df0:	89 e5                	mov    %esp,%ebp
c0005df2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005df8:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005dff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e02:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005e05:	83 ec 04             	sub    $0x4,%esp
c0005e08:	6a 01                	push   $0x1
c0005e0a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005e10:	50                   	push   %eax
c0005e11:	6a 03                	push   $0x3
c0005e13:	e8 63 46 00 00       	call   c000a47b <send_rec>
c0005e18:	83 c4 10             	add    $0x10,%esp
c0005e1b:	90                   	nop
c0005e1c:	c9                   	leave  
c0005e1d:	c3                   	ret    

c0005e1e <fork>:
c0005e1e:	55                   	push   %ebp
c0005e1f:	89 e5                	mov    %esp,%ebp
c0005e21:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005e27:	83 ec 04             	sub    $0x4,%esp
c0005e2a:	6a 7c                	push   $0x7c
c0005e2c:	6a 00                	push   $0x0
c0005e2e:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005e34:	50                   	push   %eax
c0005e35:	e8 8d 64 00 00       	call   c000c2c7 <Memset>
c0005e3a:	83 c4 10             	add    $0x10,%esp
c0005e3d:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005e44:	83 ec 04             	sub    $0x4,%esp
c0005e47:	6a 01                	push   $0x1
c0005e49:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005e4f:	50                   	push   %eax
c0005e50:	6a 03                	push   $0x3
c0005e52:	e8 24 46 00 00       	call   c000a47b <send_rec>
c0005e57:	83 c4 10             	add    $0x10,%esp
c0005e5a:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005e61:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005e64:	85 c0                	test   %eax,%eax
c0005e66:	74 19                	je     c0005e81 <fork+0x63>
c0005e68:	6a 14                	push   $0x14
c0005e6a:	68 97 b8 00 c0       	push   $0xc000b897
c0005e6f:	68 97 b8 00 c0       	push   $0xc000b897
c0005e74:	68 a2 b8 00 c0       	push   $0xc000b8a2
c0005e79:	e8 c0 3c 00 00       	call   c0009b3e <assertion_failure>
c0005e7e:	83 c4 10             	add    $0x10,%esp
c0005e81:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005e84:	c9                   	leave  
c0005e85:	c3                   	ret    

c0005e86 <getpid>:
c0005e86:	55                   	push   %ebp
c0005e87:	89 e5                	mov    %esp,%ebp
c0005e89:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005e8f:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005e96:	83 ec 04             	sub    $0x4,%esp
c0005e99:	6a 05                	push   $0x5
c0005e9b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005ea1:	50                   	push   %eax
c0005ea2:	6a 03                	push   $0x3
c0005ea4:	e8 d2 45 00 00       	call   c000a47b <send_rec>
c0005ea9:	83 c4 10             	add    $0x10,%esp
c0005eac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005eaf:	c9                   	leave  
c0005eb0:	c3                   	ret    

c0005eb1 <exec>:
c0005eb1:	55                   	push   %ebp
c0005eb2:	89 e5                	mov    %esp,%ebp
c0005eb4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005eba:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005ec1:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ec4:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005ec7:	83 ec 0c             	sub    $0xc,%esp
c0005eca:	ff 75 08             	pushl  0x8(%ebp)
c0005ecd:	e8 2e 64 00 00       	call   c000c300 <Strlen>
c0005ed2:	83 c4 10             	add    $0x10,%esp
c0005ed5:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005ed8:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0005edf:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0005ee6:	83 ec 04             	sub    $0x4,%esp
c0005ee9:	6a 01                	push   $0x1
c0005eeb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005ef1:	50                   	push   %eax
c0005ef2:	6a 03                	push   $0x3
c0005ef4:	e8 82 45 00 00       	call   c000a47b <send_rec>
c0005ef9:	83 c4 10             	add    $0x10,%esp
c0005efc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005eff:	83 f8 65             	cmp    $0x65,%eax
c0005f02:	74 19                	je     c0005f1d <exec+0x6c>
c0005f04:	6a 19                	push   $0x19
c0005f06:	68 b2 b8 00 c0       	push   $0xc000b8b2
c0005f0b:	68 b2 b8 00 c0       	push   $0xc000b8b2
c0005f10:	68 bd b8 00 c0       	push   $0xc000b8bd
c0005f15:	e8 24 3c 00 00       	call   c0009b3e <assertion_failure>
c0005f1a:	83 c4 10             	add    $0x10,%esp
c0005f1d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005f20:	c9                   	leave  
c0005f21:	c3                   	ret    

c0005f22 <execv>:
c0005f22:	55                   	push   %ebp
c0005f23:	89 e5                	mov    %esp,%ebp
c0005f25:	57                   	push   %edi
c0005f26:	81 ec d4 04 00 00    	sub    $0x4d4,%esp
c0005f2c:	83 ec 04             	sub    $0x4,%esp
c0005f2f:	68 00 04 00 00       	push   $0x400
c0005f34:	6a 00                	push   $0x0
c0005f36:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c0005f3c:	50                   	push   %eax
c0005f3d:	e8 85 63 00 00       	call   c000c2c7 <Memset>
c0005f42:	83 c4 10             	add    $0x10,%esp
c0005f45:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005f48:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005f4b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005f52:	eb 23                	jmp    c0005f77 <execv+0x55>
c0005f54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f57:	8b 00                	mov    (%eax),%eax
c0005f59:	83 ec 08             	sub    $0x8,%esp
c0005f5c:	50                   	push   %eax
c0005f5d:	68 d5 b8 00 c0       	push   $0xc000b8d5
c0005f62:	e8 7a 38 00 00       	call   c00097e1 <Printf>
c0005f67:	83 c4 10             	add    $0x10,%esp
c0005f6a:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0005f6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f71:	83 c0 04             	add    $0x4,%eax
c0005f74:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f7a:	8b 00                	mov    (%eax),%eax
c0005f7c:	85 c0                	test   %eax,%eax
c0005f7e:	75 d4                	jne    c0005f54 <execv+0x32>
c0005f80:	8d 95 d4 fb ff ff    	lea    -0x42c(%ebp),%edx
c0005f86:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f89:	01 d0                	add    %edx,%eax
c0005f8b:	c6 00 00             	movb   $0x0,(%eax)
c0005f8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f91:	83 c0 04             	add    $0x4,%eax
c0005f94:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f97:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c0005f9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005fa0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005fa3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005fa6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005fad:	eb 64                	jmp    c0006013 <execv+0xf1>
c0005faf:	8d 95 d4 fb ff ff    	lea    -0x42c(%ebp),%edx
c0005fb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fb8:	01 c2                	add    %eax,%edx
c0005fba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005fbd:	89 10                	mov    %edx,(%eax)
c0005fbf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005fc2:	8b 00                	mov    (%eax),%eax
c0005fc4:	8d 8d d4 fb ff ff    	lea    -0x42c(%ebp),%ecx
c0005fca:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005fcd:	01 ca                	add    %ecx,%edx
c0005fcf:	83 ec 08             	sub    $0x8,%esp
c0005fd2:	50                   	push   %eax
c0005fd3:	52                   	push   %edx
c0005fd4:	e8 0d 63 00 00       	call   c000c2e6 <Strcpy>
c0005fd9:	83 c4 10             	add    $0x10,%esp
c0005fdc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005fdf:	8b 00                	mov    (%eax),%eax
c0005fe1:	83 ec 0c             	sub    $0xc,%esp
c0005fe4:	50                   	push   %eax
c0005fe5:	e8 16 63 00 00       	call   c000c300 <Strlen>
c0005fea:	83 c4 10             	add    $0x10,%esp
c0005fed:	01 45 f0             	add    %eax,-0x10(%ebp)
c0005ff0:	8d 95 d4 fb ff ff    	lea    -0x42c(%ebp),%edx
c0005ff6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ff9:	01 d0                	add    %edx,%eax
c0005ffb:	c6 00 00             	movb   $0x0,(%eax)
c0005ffe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006001:	83 c0 01             	add    $0x1,%eax
c0006004:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006007:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c000600b:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000600f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006013:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006016:	8b 00                	mov    (%eax),%eax
c0006018:	85 c0                	test   %eax,%eax
c000601a:	75 93                	jne    c0005faf <execv+0x8d>
c000601c:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c0006022:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006025:	eb 04                	jmp    c000602b <execv+0x109>
c0006027:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c000602b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000602e:	8b 00                	mov    (%eax),%eax
c0006030:	85 c0                	test   %eax,%eax
c0006032:	75 f3                	jne    c0006027 <execv+0x105>
c0006034:	8d 95 30 fb ff ff    	lea    -0x4d0(%ebp),%edx
c000603a:	b8 00 00 00 00       	mov    $0x0,%eax
c000603f:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0006044:	89 d7                	mov    %edx,%edi
c0006046:	f3 ab                	rep stos %eax,%es:(%edi)
c0006048:	c7 85 30 fb ff ff df 	movl   $0xc000b8df,-0x4d0(%ebp)
c000604f:	b8 00 c0 
c0006052:	c7 85 34 fb ff ff e6 	movl   $0xc000b8e6,-0x4cc(%ebp)
c0006059:	b8 00 c0 
c000605c:	83 ec 0c             	sub    $0xc,%esp
c000605f:	ff 75 08             	pushl  0x8(%ebp)
c0006062:	e8 b2 0e 00 00       	call   c0006f19 <get_physical_address>
c0006067:	83 c4 10             	add    $0x10,%esp
c000606a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000606d:	83 ec 0c             	sub    $0xc,%esp
c0006070:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c0006076:	50                   	push   %eax
c0006077:	e8 9d 0e 00 00       	call   c0006f19 <get_physical_address>
c000607c:	83 c4 10             	add    $0x10,%esp
c000607f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006082:	83 ec 0c             	sub    $0xc,%esp
c0006085:	68 00 00 00 c0       	push   $0xc0000000
c000608a:	e8 8a 0e 00 00       	call   c0006f19 <get_physical_address>
c000608f:	83 c4 10             	add    $0x10,%esp
c0006092:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006095:	c7 85 d0 fb ff ff 02 	movl   $0x2,-0x430(%ebp)
c000609c:	00 00 00 
c000609f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00060a2:	89 85 9c fb ff ff    	mov    %eax,-0x464(%ebp)
c00060a8:	83 ec 0c             	sub    $0xc,%esp
c00060ab:	ff 75 08             	pushl  0x8(%ebp)
c00060ae:	e8 4d 62 00 00       	call   c000c300 <Strlen>
c00060b3:	83 c4 10             	add    $0x10,%esp
c00060b6:	89 85 98 fb ff ff    	mov    %eax,-0x468(%ebp)
c00060bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00060bf:	89 85 68 fb ff ff    	mov    %eax,-0x498(%ebp)
c00060c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060c8:	89 85 74 fb ff ff    	mov    %eax,-0x48c(%ebp)
c00060ce:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c00060d4:	89 85 78 fb ff ff    	mov    %eax,-0x488(%ebp)
c00060da:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00060dd:	89 85 7c fb ff ff    	mov    %eax,-0x484(%ebp)
c00060e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060e6:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c00060eb:	29 c2                	sub    %eax,%edx
c00060ed:	89 d0                	mov    %edx,%eax
c00060ef:	89 85 80 fb ff ff    	mov    %eax,-0x480(%ebp)
c00060f5:	8d 95 d4 fb ff ff    	lea    -0x42c(%ebp),%edx
c00060fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060fe:	01 d0                	add    %edx,%eax
c0006100:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0006105:	29 c2                	sub    %eax,%edx
c0006107:	89 d0                	mov    %edx,%eax
c0006109:	89 85 84 fb ff ff    	mov    %eax,-0x47c(%ebp)
c000610f:	83 ec 0c             	sub    $0xc,%esp
c0006112:	68 ed b8 00 c0       	push   $0xc000b8ed
c0006117:	e8 c5 36 00 00       	call   c00097e1 <Printf>
c000611c:	83 c4 10             	add    $0x10,%esp
c000611f:	83 ec 04             	sub    $0x4,%esp
c0006122:	6a 01                	push   $0x1
c0006124:	8d 85 58 fb ff ff    	lea    -0x4a8(%ebp),%eax
c000612a:	50                   	push   %eax
c000612b:	6a 03                	push   $0x3
c000612d:	e8 49 43 00 00       	call   c000a47b <send_rec>
c0006132:	83 c4 10             	add    $0x10,%esp
c0006135:	83 ec 0c             	sub    $0xc,%esp
c0006138:	68 fe b8 00 c0       	push   $0xc000b8fe
c000613d:	e8 9f 36 00 00       	call   c00097e1 <Printf>
c0006142:	83 c4 10             	add    $0x10,%esp
c0006145:	83 ec 0c             	sub    $0xc,%esp
c0006148:	68 10 b9 00 c0       	push   $0xc000b910
c000614d:	e8 8f 36 00 00       	call   c00097e1 <Printf>
c0006152:	83 c4 10             	add    $0x10,%esp
c0006155:	8b 85 d0 fb ff ff    	mov    -0x430(%ebp),%eax
c000615b:	83 f8 65             	cmp    $0x65,%eax
c000615e:	74 1c                	je     c000617c <execv+0x25a>
c0006160:	68 98 00 00 00       	push   $0x98
c0006165:	68 b2 b8 00 c0       	push   $0xc000b8b2
c000616a:	68 b2 b8 00 c0       	push   $0xc000b8b2
c000616f:	68 bd b8 00 c0       	push   $0xc000b8bd
c0006174:	e8 c5 39 00 00       	call   c0009b3e <assertion_failure>
c0006179:	83 c4 10             	add    $0x10,%esp
c000617c:	8b 85 b0 fb ff ff    	mov    -0x450(%ebp),%eax
c0006182:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0006185:	c9                   	leave  
c0006186:	c3                   	ret    

c0006187 <execl>:
c0006187:	55                   	push   %ebp
c0006188:	89 e5                	mov    %esp,%ebp
c000618a:	83 ec 18             	sub    $0x18,%esp
c000618d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0006190:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006193:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006196:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006199:	83 ec 08             	sub    $0x8,%esp
c000619c:	ff 75 f0             	pushl  -0x10(%ebp)
c000619f:	ff 75 08             	pushl  0x8(%ebp)
c00061a2:	e8 7b fd ff ff       	call   c0005f22 <execv>
c00061a7:	83 c4 10             	add    $0x10,%esp
c00061aa:	c9                   	leave  
c00061ab:	c3                   	ret    

c00061ac <TaskMM>:
c00061ac:	55                   	push   %ebp
c00061ad:	89 e5                	mov    %esp,%ebp
c00061af:	83 ec 28             	sub    $0x28,%esp
c00061b2:	83 ec 0c             	sub    $0xc,%esp
c00061b5:	6a 7c                	push   $0x7c
c00061b7:	e8 08 c4 ff ff       	call   c00025c4 <sys_malloc>
c00061bc:	83 c4 10             	add    $0x10,%esp
c00061bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061c2:	83 ec 0c             	sub    $0xc,%esp
c00061c5:	6a 7c                	push   $0x7c
c00061c7:	e8 f8 c3 ff ff       	call   c00025c4 <sys_malloc>
c00061cc:	83 c4 10             	add    $0x10,%esp
c00061cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00061d2:	83 ec 04             	sub    $0x4,%esp
c00061d5:	6a 12                	push   $0x12
c00061d7:	ff 75 f0             	pushl  -0x10(%ebp)
c00061da:	6a 02                	push   $0x2
c00061dc:	e8 9a 42 00 00       	call   c000a47b <send_rec>
c00061e1:	83 c4 10             	add    $0x10,%esp
c00061e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061e7:	8b 40 78             	mov    0x78(%eax),%eax
c00061ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00061ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061f0:	8b 00                	mov    (%eax),%eax
c00061f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00061f5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00061fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00061ff:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0006206:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006209:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0006210:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0006214:	74 4e                	je     c0006264 <TaskMM+0xb8>
c0006216:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c000621a:	7f 08                	jg     c0006224 <TaskMM+0x78>
c000621c:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0006220:	74 28                	je     c000624a <TaskMM+0x9e>
c0006222:	eb 71                	jmp    c0006295 <TaskMM+0xe9>
c0006224:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0006228:	74 08                	je     c0006232 <TaskMM+0x86>
c000622a:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c000622e:	74 4e                	je     c000627e <TaskMM+0xd2>
c0006230:	eb 63                	jmp    c0006295 <TaskMM+0xe9>
c0006232:	83 ec 0c             	sub    $0xc,%esp
c0006235:	ff 75 f0             	pushl  -0x10(%ebp)
c0006238:	e8 f2 04 00 00       	call   c000672f <do_fork>
c000623d:	83 c4 10             	add    $0x10,%esp
c0006240:	89 c2                	mov    %eax,%edx
c0006242:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006245:	89 50 5c             	mov    %edx,0x5c(%eax)
c0006248:	eb 5c                	jmp    c00062a6 <TaskMM+0xfa>
c000624a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006251:	66 87 db             	xchg   %bx,%bx
c0006254:	83 ec 0c             	sub    $0xc,%esp
c0006257:	ff 75 f0             	pushl  -0x10(%ebp)
c000625a:	e8 95 00 00 00       	call   c00062f4 <do_exec>
c000625f:	83 c4 10             	add    $0x10,%esp
c0006262:	eb 42                	jmp    c00062a6 <TaskMM+0xfa>
c0006264:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000626b:	83 ec 08             	sub    $0x8,%esp
c000626e:	ff 75 e0             	pushl  -0x20(%ebp)
c0006271:	ff 75 f0             	pushl  -0x10(%ebp)
c0006274:	e8 24 05 00 00       	call   c000679d <do_exit>
c0006279:	83 c4 10             	add    $0x10,%esp
c000627c:	eb 28                	jmp    c00062a6 <TaskMM+0xfa>
c000627e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006285:	83 ec 0c             	sub    $0xc,%esp
c0006288:	ff 75 f0             	pushl  -0x10(%ebp)
c000628b:	e8 09 06 00 00       	call   c0006899 <do_wait>
c0006290:	83 c4 10             	add    $0x10,%esp
c0006293:	eb 11                	jmp    c00062a6 <TaskMM+0xfa>
c0006295:	83 ec 0c             	sub    $0xc,%esp
c0006298:	68 20 b9 00 c0       	push   $0xc000b920
c000629d:	e8 7e 38 00 00       	call   c0009b20 <panic>
c00062a2:	83 c4 10             	add    $0x10,%esp
c00062a5:	90                   	nop
c00062a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00062aa:	0f 84 22 ff ff ff    	je     c00061d2 <TaskMM+0x26>
c00062b0:	83 ec 0c             	sub    $0xc,%esp
c00062b3:	6a 03                	push   $0x3
c00062b5:	e8 f3 33 00 00       	call   c00096ad <delay>
c00062ba:	83 c4 10             	add    $0x10,%esp
c00062bd:	83 ec 04             	sub    $0x4,%esp
c00062c0:	ff 75 e4             	pushl  -0x1c(%ebp)
c00062c3:	ff 75 ec             	pushl  -0x14(%ebp)
c00062c6:	6a 01                	push   $0x1
c00062c8:	e8 ae 41 00 00       	call   c000a47b <send_rec>
c00062cd:	83 c4 10             	add    $0x10,%esp
c00062d0:	e9 fd fe ff ff       	jmp    c00061d2 <TaskMM+0x26>

c00062d5 <alloc_mem>:
c00062d5:	55                   	push   %ebp
c00062d6:	89 e5                	mov    %esp,%ebp
c00062d8:	83 ec 10             	sub    $0x10,%esp
c00062db:	8b 45 08             	mov    0x8(%ebp),%eax
c00062de:	83 e8 08             	sub    $0x8,%eax
c00062e1:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c00062e7:	05 00 00 a0 00       	add    $0xa00000,%eax
c00062ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00062ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00062f2:	c9                   	leave  
c00062f3:	c3                   	ret    

c00062f4 <do_exec>:
c00062f4:	55                   	push   %ebp
c00062f5:	89 e5                	mov    %esp,%ebp
c00062f7:	81 ec 38 01 00 00    	sub    $0x138,%esp
c00062fd:	c7 85 52 ff ff ff 64 	movl   $0x5f766564,-0xae(%ebp)
c0006304:	65 76 5f 
c0006307:	c7 85 56 ff ff ff 74 	movl   $0x31797474,-0xaa(%ebp)
c000630e:	74 79 31 
c0006311:	66 c7 85 5a ff ff ff 	movw   $0x0,-0xa6(%ebp)
c0006318:	00 00 
c000631a:	83 ec 08             	sub    $0x8,%esp
c000631d:	6a 00                	push   $0x0
c000631f:	8d 85 52 ff ff ff    	lea    -0xae(%ebp),%eax
c0006325:	50                   	push   %eax
c0006326:	e8 93 f7 ff ff       	call   c0005abe <open>
c000632b:	83 c4 10             	add    $0x10,%esp
c000632e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006331:	8b 45 08             	mov    0x8(%ebp),%eax
c0006334:	8b 00                	mov    (%eax),%eax
c0006336:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006339:	c7 45 c4 90 43 02 00 	movl   $0x24390,-0x3c(%ebp)
c0006340:	c7 45 c0 80 45 03 00 	movl   $0x34580,-0x40(%ebp)
c0006347:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000634a:	83 ec 0c             	sub    $0xc,%esp
c000634d:	50                   	push   %eax
c000634e:	e8 71 c2 ff ff       	call   c00025c4 <sys_malloc>
c0006353:	83 c4 10             	add    $0x10,%esp
c0006356:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006359:	83 ec 04             	sub    $0x4,%esp
c000635c:	ff 75 c0             	pushl  -0x40(%ebp)
c000635f:	6a 00                	push   $0x0
c0006361:	ff 75 bc             	pushl  -0x44(%ebp)
c0006364:	e8 5e 5f 00 00       	call   c000c2c7 <Memset>
c0006369:	83 c4 10             	add    $0x10,%esp
c000636c:	83 ec 04             	sub    $0x4,%esp
c000636f:	6a 0c                	push   $0xc
c0006371:	6a 00                	push   $0x0
c0006373:	8d 85 46 ff ff ff    	lea    -0xba(%ebp),%eax
c0006379:	50                   	push   %eax
c000637a:	e8 48 5f 00 00       	call   c000c2c7 <Memset>
c000637f:	83 c4 10             	add    $0x10,%esp
c0006382:	8b 45 08             	mov    0x8(%ebp),%eax
c0006385:	8b 40 44             	mov    0x44(%eax),%eax
c0006388:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000638b:	8b 45 08             	mov    0x8(%ebp),%eax
c000638e:	8b 40 40             	mov    0x40(%eax),%eax
c0006391:	83 ec 08             	sub    $0x8,%esp
c0006394:	50                   	push   %eax
c0006395:	ff 75 b8             	pushl  -0x48(%ebp)
c0006398:	e8 ae 0a 00 00       	call   c0006e4b <alloc_virtual_memory>
c000639d:	83 c4 10             	add    $0x10,%esp
c00063a0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00063a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00063a6:	8b 40 40             	mov    0x40(%eax),%eax
c00063a9:	89 c2                	mov    %eax,%edx
c00063ab:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00063ae:	83 ec 04             	sub    $0x4,%esp
c00063b1:	52                   	push   %edx
c00063b2:	50                   	push   %eax
c00063b3:	8d 85 46 ff ff ff    	lea    -0xba(%ebp),%eax
c00063b9:	50                   	push   %eax
c00063ba:	e8 c8 17 00 00       	call   c0007b87 <Memcpy>
c00063bf:	83 c4 10             	add    $0x10,%esp
c00063c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00063c5:	8b 40 40             	mov    0x40(%eax),%eax
c00063c8:	c6 84 05 46 ff ff ff 	movb   $0x0,-0xba(%ebp,%eax,1)
c00063cf:	00 
c00063d0:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c00063d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00063de:	83 ec 08             	sub    $0x8,%esp
c00063e1:	6a 00                	push   $0x0
c00063e3:	8d 85 46 ff ff ff    	lea    -0xba(%ebp),%eax
c00063e9:	50                   	push   %eax
c00063ea:	e8 cf f6 ff ff       	call   c0005abe <open>
c00063ef:	83 c4 10             	add    $0x10,%esp
c00063f2:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00063f5:	83 7d ac ff          	cmpl   $0xffffffff,-0x54(%ebp)
c00063f9:	75 15                	jne    c0006410 <do_exec+0x11c>
c00063fb:	83 ec 0c             	sub    $0xc,%esp
c00063fe:	68 6a b9 00 c0       	push   $0xc000b96a
c0006403:	e8 d9 33 00 00       	call   c00097e1 <Printf>
c0006408:	83 c4 10             	add    $0x10,%esp
c000640b:	e9 1d 03 00 00       	jmp    c000672d <do_exec+0x439>
c0006410:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006417:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000641b:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000641f:	75 07                	jne    c0006428 <do_exec+0x134>
c0006421:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c0006428:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000642b:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000642e:	01 d0                	add    %edx,%eax
c0006430:	83 ec 04             	sub    $0x4,%esp
c0006433:	68 00 10 00 00       	push   $0x1000
c0006438:	50                   	push   %eax
c0006439:	ff 75 ac             	pushl  -0x54(%ebp)
c000643c:	e8 12 f7 ff ff       	call   c0005b53 <read>
c0006441:	83 c4 10             	add    $0x10,%esp
c0006444:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0006447:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000644a:	01 45 f0             	add    %eax,-0x10(%ebp)
c000644d:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0006451:	74 24                	je     c0006477 <do_exec+0x183>
c0006453:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006457:	74 14                	je     c000646d <do_exec+0x179>
c0006459:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000645c:	83 c0 02             	add    $0x2,%eax
c000645f:	0f b6 00             	movzbl (%eax),%eax
c0006462:	3c 4c                	cmp    $0x4c,%al
c0006464:	74 07                	je     c000646d <do_exec+0x179>
c0006466:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
c000646d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006470:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0006473:	7d 05                	jge    c000647a <do_exec+0x186>
c0006475:	eb a0                	jmp    c0006417 <do_exec+0x123>
c0006477:	90                   	nop
c0006478:	eb 01                	jmp    c000647b <do_exec+0x187>
c000647a:	90                   	nop
c000647b:	83 ec 0c             	sub    $0xc,%esp
c000647e:	ff 75 ac             	pushl  -0x54(%ebp)
c0006481:	e8 d3 f8 ff ff       	call   c0005d59 <close>
c0006486:	83 c4 10             	add    $0x10,%esp
c0006489:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000648c:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c000648f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006496:	e9 cc 00 00 00       	jmp    c0006567 <do_exec+0x273>
c000649b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000649e:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00064a2:	0f b7 d0             	movzwl %ax,%edx
c00064a5:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00064a8:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00064ac:	0f b7 c0             	movzwl %ax,%eax
c00064af:	0f af 45 ec          	imul   -0x14(%ebp),%eax
c00064b3:	01 c2                	add    %eax,%edx
c00064b5:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00064b8:	01 d0                	add    %edx,%eax
c00064ba:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00064bd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00064c0:	8b 40 10             	mov    0x10(%eax),%eax
c00064c3:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00064c6:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00064c9:	05 ff 0f 00 00       	add    $0xfff,%eax
c00064ce:	c1 e8 0c             	shr    $0xc,%eax
c00064d1:	89 45 98             	mov    %eax,-0x68(%ebp)
c00064d4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00064d7:	8b 40 08             	mov    0x8(%eax),%eax
c00064da:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00064dd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00064e4:	83 7d 9c 00          	cmpl   $0x0,-0x64(%ebp)
c00064e8:	74 78                	je     c0006562 <do_exec+0x26e>
c00064ea:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00064f1:	eb 41                	jmp    c0006534 <do_exec+0x240>
c00064f3:	83 ec 08             	sub    $0x8,%esp
c00064f6:	ff 75 c8             	pushl  -0x38(%ebp)
c00064f9:	ff 75 e8             	pushl  -0x18(%ebp)
c00064fc:	e8 4a 0a 00 00       	call   c0006f4b <alloc_physical_memory_of_proc>
c0006501:	83 c4 10             	add    $0x10,%esp
c0006504:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0006507:	83 ec 08             	sub    $0x8,%esp
c000650a:	68 00 10 00 00       	push   $0x1000
c000650f:	ff 75 94             	pushl  -0x6c(%ebp)
c0006512:	e8 34 09 00 00       	call   c0006e4b <alloc_virtual_memory>
c0006517:	83 c4 10             	add    $0x10,%esp
c000651a:	89 45 90             	mov    %eax,-0x70(%ebp)
c000651d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0006521:	75 06                	jne    c0006529 <do_exec+0x235>
c0006523:	8b 45 90             	mov    -0x70(%ebp),%eax
c0006526:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006529:	81 45 e8 00 10 00 00 	addl   $0x1000,-0x18(%ebp)
c0006530:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0006534:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006537:	39 45 98             	cmp    %eax,-0x68(%ebp)
c000653a:	77 b7                	ja     c00064f3 <do_exec+0x1ff>
c000653c:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000653f:	8b 40 10             	mov    0x10(%eax),%eax
c0006542:	89 c1                	mov    %eax,%ecx
c0006544:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0006547:	8b 50 04             	mov    0x4(%eax),%edx
c000654a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000654d:	01 c2                	add    %eax,%edx
c000654f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006552:	83 ec 04             	sub    $0x4,%esp
c0006555:	51                   	push   %ecx
c0006556:	52                   	push   %edx
c0006557:	50                   	push   %eax
c0006558:	e8 2a 16 00 00       	call   c0007b87 <Memcpy>
c000655d:	83 c4 10             	add    $0x10,%esp
c0006560:	eb 01                	jmp    c0006563 <do_exec+0x26f>
c0006562:	90                   	nop
c0006563:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0006567:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000656a:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c000656e:	0f b7 c0             	movzwl %ax,%eax
c0006571:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006574:	0f 8c 21 ff ff ff    	jl     c000649b <do_exec+0x1a7>
c000657a:	8b 45 08             	mov    0x8(%ebp),%eax
c000657d:	8b 40 10             	mov    0x10(%eax),%eax
c0006580:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0006583:	8b 45 08             	mov    0x8(%ebp),%eax
c0006586:	8b 40 1c             	mov    0x1c(%eax),%eax
c0006589:	89 45 88             	mov    %eax,-0x78(%ebp)
c000658c:	8b 45 08             	mov    0x8(%ebp),%eax
c000658f:	8b 40 24             	mov    0x24(%eax),%eax
c0006592:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0006595:	83 ec 0c             	sub    $0xc,%esp
c0006598:	ff 75 c8             	pushl  -0x38(%ebp)
c000659b:	e8 1c e2 ff ff       	call   c00047bc <pid2proc>
c00065a0:	83 c4 10             	add    $0x10,%esp
c00065a3:	89 45 80             	mov    %eax,-0x80(%ebp)
c00065a6:	83 ec 08             	sub    $0x8,%esp
c00065a9:	68 00 10 00 00       	push   $0x1000
c00065ae:	ff 75 84             	pushl  -0x7c(%ebp)
c00065b1:	e8 95 08 00 00       	call   c0006e4b <alloc_virtual_memory>
c00065b6:	83 c4 10             	add    $0x10,%esp
c00065b9:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c00065bf:	8b 45 88             	mov    -0x78(%ebp),%eax
c00065c2:	f7 d8                	neg    %eax
c00065c4:	01 85 7c ff ff ff    	add    %eax,-0x84(%ebp)
c00065ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00065cd:	8b 40 10             	mov    0x10(%eax),%eax
c00065d0:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c00065d6:	83 ec 08             	sub    $0x8,%esp
c00065d9:	ff 75 88             	pushl  -0x78(%ebp)
c00065dc:	ff b5 78 ff ff ff    	pushl  -0x88(%ebp)
c00065e2:	e8 64 08 00 00       	call   c0006e4b <alloc_virtual_memory>
c00065e7:	83 c4 10             	add    $0x10,%esp
c00065ea:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c00065f0:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00065f6:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c00065fc:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0006602:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006605:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000660c:	eb 08                	jmp    c0006616 <do_exec+0x322>
c000660e:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0006612:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c0006616:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006619:	8b 00                	mov    (%eax),%eax
c000661b:	85 c0                	test   %eax,%eax
c000661d:	75 ef                	jne    c000660e <do_exec+0x31a>
c000661f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006622:	8b 40 2c             	mov    0x2c(%eax),%eax
c0006625:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c000662b:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006632:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0006638:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000663b:	eb 1a                	jmp    c0006657 <do_exec+0x363>
c000663d:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
c0006641:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006644:	8b 10                	mov    (%eax),%edx
c0006646:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c000664c:	01 c2                	add    %eax,%edx
c000664e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006651:	89 10                	mov    %edx,(%eax)
c0006653:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
c0006657:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000665a:	8b 00                	mov    (%eax),%eax
c000665c:	85 c0                	test   %eax,%eax
c000665e:	75 dd                	jne    c000663d <do_exec+0x349>
c0006660:	8b 45 08             	mov    0x8(%ebp),%eax
c0006663:	8b 40 28             	mov    0x28(%eax),%eax
c0006666:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c000666c:	83 ec 0c             	sub    $0xc,%esp
c000666f:	ff 75 80             	pushl  -0x80(%ebp)
c0006672:	e8 a2 08 00 00       	call   c0006f19 <get_physical_address>
c0006677:	83 c4 10             	add    $0x10,%esp
c000667a:	89 85 64 ff ff ff    	mov    %eax,-0x9c(%ebp)
c0006680:	83 ec 08             	sub    $0x8,%esp
c0006683:	68 00 10 00 00       	push   $0x1000
c0006688:	ff b5 64 ff ff ff    	pushl  -0x9c(%ebp)
c000668e:	e8 b8 07 00 00       	call   c0006e4b <alloc_virtual_memory>
c0006693:	83 c4 10             	add    $0x10,%esp
c0006696:	89 85 60 ff ff ff    	mov    %eax,-0xa0(%ebp)
c000669c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
c00066a2:	05 bc 0f 00 00       	add    $0xfbc,%eax
c00066a7:	89 85 5c ff ff ff    	mov    %eax,-0xa4(%ebp)
c00066ad:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c00066b3:	8b 95 68 ff ff ff    	mov    -0x98(%ebp),%edx
c00066b9:	89 50 2c             	mov    %edx,0x2c(%eax)
c00066bc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00066bf:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c00066c5:	89 50 28             	mov    %edx,0x28(%eax)
c00066c8:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00066cb:	8b 40 18             	mov    0x18(%eax),%eax
c00066ce:	89 c2                	mov    %eax,%edx
c00066d0:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c00066d6:	89 50 30             	mov    %edx,0x30(%eax)
c00066d9:	8b 85 5c ff ff ff    	mov    -0xa4(%ebp),%eax
c00066df:	8b 95 68 ff ff ff    	mov    -0x98(%ebp),%edx
c00066e5:	89 50 3c             	mov    %edx,0x3c(%eax)
c00066e8:	8b 45 80             	mov    -0x80(%ebp),%eax
c00066eb:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00066f2:	00 00 00 
c00066f5:	c7 85 40 ff ff ff 65 	movl   $0x65,-0xc0(%ebp)
c00066fc:	00 00 00 
c00066ff:	c7 85 20 ff ff ff 00 	movl   $0x0,-0xe0(%ebp)
c0006706:	00 00 00 
c0006709:	c7 85 24 ff ff ff 00 	movl   $0x0,-0xdc(%ebp)
c0006710:	00 00 00 
c0006713:	83 ec 04             	sub    $0x4,%esp
c0006716:	ff 75 c8             	pushl  -0x38(%ebp)
c0006719:	8d 85 c8 fe ff ff    	lea    -0x138(%ebp),%eax
c000671f:	50                   	push   %eax
c0006720:	6a 01                	push   $0x1
c0006722:	e8 54 3d 00 00       	call   c000a47b <send_rec>
c0006727:	83 c4 10             	add    $0x10,%esp
c000672a:	66 87 db             	xchg   %bx,%bx
c000672d:	c9                   	leave  
c000672e:	c3                   	ret    

c000672f <do_fork>:
c000672f:	55                   	push   %ebp
c0006730:	89 e5                	mov    %esp,%ebp
c0006732:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0006738:	8b 45 08             	mov    0x8(%ebp),%eax
c000673b:	8b 00                	mov    (%eax),%eax
c000673d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006740:	83 ec 0c             	sub    $0xc,%esp
c0006743:	ff 75 f4             	pushl  -0xc(%ebp)
c0006746:	e8 a0 45 00 00       	call   c000aceb <fork_process>
c000674b:	83 c4 10             	add    $0x10,%esp
c000674e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006751:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006754:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000675a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000675d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006760:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0006766:	8b 45 08             	mov    0x8(%ebp),%eax
c0006769:	89 50 5c             	mov    %edx,0x5c(%eax)
c000676c:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006773:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c000677a:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006781:	83 ec 04             	sub    $0x4,%esp
c0006784:	ff 75 ec             	pushl  -0x14(%ebp)
c0006787:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c000678d:	50                   	push   %eax
c000678e:	6a 01                	push   $0x1
c0006790:	e8 e6 3c 00 00       	call   c000a47b <send_rec>
c0006795:	83 c4 10             	add    $0x10,%esp
c0006798:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000679b:	c9                   	leave  
c000679c:	c3                   	ret    

c000679d <do_exit>:
c000679d:	55                   	push   %ebp
c000679e:	89 e5                	mov    %esp,%ebp
c00067a0:	83 ec 18             	sub    $0x18,%esp
c00067a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00067a6:	8b 00                	mov    (%eax),%eax
c00067a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00067ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00067ae:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00067b4:	05 20 32 08 c0       	add    $0xc0083220,%eax
c00067b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00067bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00067bf:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c00067c5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00067c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00067cb:	8b 40 54             	mov    0x54(%eax),%eax
c00067ce:	89 c2                	mov    %eax,%edx
c00067d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00067d3:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c00067d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00067dc:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00067e2:	05 69 34 08 c0       	add    $0xc0083469,%eax
c00067e7:	0f b6 00             	movzbl (%eax),%eax
c00067ea:	3c 04                	cmp    $0x4,%al
c00067ec:	75 21                	jne    c000680f <do_exit+0x72>
c00067ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00067f1:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00067f7:	05 69 34 08 c0       	add    $0xc0083469,%eax
c00067fc:	c6 00 fb             	movb   $0xfb,(%eax)
c00067ff:	83 ec 0c             	sub    $0xc,%esp
c0006802:	ff 75 ec             	pushl  -0x14(%ebp)
c0006805:	e8 5c 01 00 00       	call   c0006966 <cleanup>
c000680a:	83 c4 10             	add    $0x10,%esp
c000680d:	eb 0a                	jmp    c0006819 <do_exit+0x7c>
c000680f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006812:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0006819:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006820:	eb 6e                	jmp    c0006890 <do_exit+0xf3>
c0006822:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006825:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000682b:	05 84 34 08 c0       	add    $0xc0083484,%eax
c0006830:	8b 00                	mov    (%eax),%eax
c0006832:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006835:	75 55                	jne    c000688c <do_exit+0xef>
c0006837:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000683a:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006840:	05 84 34 08 c0       	add    $0xc0083484,%eax
c0006845:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c000684b:	0f b6 05 a1 44 08 c0 	movzbl 0xc00844a1,%eax
c0006852:	3c 04                	cmp    $0x4,%al
c0006854:	75 36                	jne    c000688c <do_exit+0xef>
c0006856:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006859:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000685f:	05 69 34 08 c0       	add    $0xc0083469,%eax
c0006864:	0f b6 00             	movzbl (%eax),%eax
c0006867:	3c 03                	cmp    $0x3,%al
c0006869:	75 21                	jne    c000688c <do_exit+0xef>
c000686b:	c6 05 a1 44 08 c0 fb 	movb   $0xfb,0xc00844a1
c0006872:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006875:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000687b:	05 20 32 08 c0       	add    $0xc0083220,%eax
c0006880:	83 ec 0c             	sub    $0xc,%esp
c0006883:	50                   	push   %eax
c0006884:	e8 dd 00 00 00       	call   c0006966 <cleanup>
c0006889:	83 c4 10             	add    $0x10,%esp
c000688c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006890:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006894:	7e 8c                	jle    c0006822 <do_exit+0x85>
c0006896:	90                   	nop
c0006897:	c9                   	leave  
c0006898:	c3                   	ret    

c0006899 <do_wait>:
c0006899:	55                   	push   %ebp
c000689a:	89 e5                	mov    %esp,%ebp
c000689c:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00068a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00068a5:	8b 00                	mov    (%eax),%eax
c00068a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00068aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00068b1:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c00068b8:	eb 5f                	jmp    c0006919 <do_wait+0x80>
c00068ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068bd:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00068c3:	05 84 34 08 c0       	add    $0xc0083484,%eax
c00068c8:	8b 00                	mov    (%eax),%eax
c00068ca:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c00068cd:	75 46                	jne    c0006915 <do_wait+0x7c>
c00068cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00068d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068d6:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00068dc:	05 69 34 08 c0       	add    $0xc0083469,%eax
c00068e1:	0f b6 00             	movzbl (%eax),%eax
c00068e4:	3c 03                	cmp    $0x3,%al
c00068e6:	75 2d                	jne    c0006915 <do_wait+0x7c>
c00068e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068eb:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00068f1:	05 69 34 08 c0       	add    $0xc0083469,%eax
c00068f6:	c6 00 fb             	movb   $0xfb,(%eax)
c00068f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068fc:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006902:	05 20 32 08 c0       	add    $0xc0083220,%eax
c0006907:	83 ec 0c             	sub    $0xc,%esp
c000690a:	50                   	push   %eax
c000690b:	e8 56 00 00 00       	call   c0006966 <cleanup>
c0006910:	83 c4 10             	add    $0x10,%esp
c0006913:	eb 4f                	jmp    c0006964 <do_wait+0xcb>
c0006915:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006919:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000691d:	7e 9b                	jle    c00068ba <do_wait+0x21>
c000691f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006923:	74 13                	je     c0006938 <do_wait+0x9f>
c0006925:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006928:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000692e:	05 69 34 08 c0       	add    $0xc0083469,%eax
c0006933:	c6 00 04             	movb   $0x4,(%eax)
c0006936:	eb 2c                	jmp    c0006964 <do_wait+0xcb>
c0006938:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c000693f:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006946:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c000694d:	83 ec 04             	sub    $0x4,%esp
c0006950:	ff 75 ec             	pushl  -0x14(%ebp)
c0006953:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0006959:	50                   	push   %eax
c000695a:	6a 01                	push   $0x1
c000695c:	e8 1a 3b 00 00       	call   c000a47b <send_rec>
c0006961:	83 c4 10             	add    $0x10,%esp
c0006964:	c9                   	leave  
c0006965:	c3                   	ret    

c0006966 <cleanup>:
c0006966:	55                   	push   %ebp
c0006967:	89 e5                	mov    %esp,%ebp
c0006969:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000696f:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006976:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c000697d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006980:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006986:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006989:	8b 45 08             	mov    0x8(%ebp),%eax
c000698c:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006992:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006995:	8b 45 08             	mov    0x8(%ebp),%eax
c0006998:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c000699e:	83 ec 04             	sub    $0x4,%esp
c00069a1:	50                   	push   %eax
c00069a2:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c00069a8:	50                   	push   %eax
c00069a9:	6a 01                	push   $0x1
c00069ab:	e8 cb 3a 00 00       	call   c000a47b <send_rec>
c00069b0:	83 c4 10             	add    $0x10,%esp
c00069b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00069b6:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c00069bd:	90                   	nop
c00069be:	c9                   	leave  
c00069bf:	c3                   	ret    

c00069c0 <init_bitmap>:
c00069c0:	55                   	push   %ebp
c00069c1:	89 e5                	mov    %esp,%ebp
c00069c3:	83 ec 08             	sub    $0x8,%esp
c00069c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00069c9:	8b 50 04             	mov    0x4(%eax),%edx
c00069cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00069cf:	8b 00                	mov    (%eax),%eax
c00069d1:	83 ec 04             	sub    $0x4,%esp
c00069d4:	52                   	push   %edx
c00069d5:	6a 00                	push   $0x0
c00069d7:	50                   	push   %eax
c00069d8:	e8 ea 58 00 00       	call   c000c2c7 <Memset>
c00069dd:	83 c4 10             	add    $0x10,%esp
c00069e0:	90                   	nop
c00069e1:	c9                   	leave  
c00069e2:	c3                   	ret    

c00069e3 <test_bit_val>:
c00069e3:	55                   	push   %ebp
c00069e4:	89 e5                	mov    %esp,%ebp
c00069e6:	53                   	push   %ebx
c00069e7:	83 ec 10             	sub    $0x10,%esp
c00069ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069ed:	8d 50 07             	lea    0x7(%eax),%edx
c00069f0:	85 c0                	test   %eax,%eax
c00069f2:	0f 48 c2             	cmovs  %edx,%eax
c00069f5:	c1 f8 03             	sar    $0x3,%eax
c00069f8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069fb:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069fe:	99                   	cltd   
c00069ff:	c1 ea 1d             	shr    $0x1d,%edx
c0006a02:	01 d0                	add    %edx,%eax
c0006a04:	83 e0 07             	and    $0x7,%eax
c0006a07:	29 d0                	sub    %edx,%eax
c0006a09:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a0f:	8b 10                	mov    (%eax),%edx
c0006a11:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a14:	01 d0                	add    %edx,%eax
c0006a16:	0f b6 00             	movzbl (%eax),%eax
c0006a19:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006a1c:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006a20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a23:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006a28:	89 c1                	mov    %eax,%ecx
c0006a2a:	d3 e3                	shl    %cl,%ebx
c0006a2c:	89 d8                	mov    %ebx,%eax
c0006a2e:	21 c2                	and    %eax,%edx
c0006a30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a33:	89 c1                	mov    %eax,%ecx
c0006a35:	d3 fa                	sar    %cl,%edx
c0006a37:	89 d0                	mov    %edx,%eax
c0006a39:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a3c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006a40:	0f 9f c0             	setg   %al
c0006a43:	0f b6 c0             	movzbl %al,%eax
c0006a46:	83 c4 10             	add    $0x10,%esp
c0006a49:	5b                   	pop    %ebx
c0006a4a:	5d                   	pop    %ebp
c0006a4b:	c3                   	ret    

c0006a4c <set_bit_val>:
c0006a4c:	55                   	push   %ebp
c0006a4d:	89 e5                	mov    %esp,%ebp
c0006a4f:	83 ec 10             	sub    $0x10,%esp
c0006a52:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a55:	8d 50 07             	lea    0x7(%eax),%edx
c0006a58:	85 c0                	test   %eax,%eax
c0006a5a:	0f 48 c2             	cmovs  %edx,%eax
c0006a5d:	c1 f8 03             	sar    $0x3,%eax
c0006a60:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a66:	99                   	cltd   
c0006a67:	c1 ea 1d             	shr    $0x1d,%edx
c0006a6a:	01 d0                	add    %edx,%eax
c0006a6c:	83 e0 07             	and    $0x7,%eax
c0006a6f:	29 d0                	sub    %edx,%eax
c0006a71:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a74:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a77:	8b 10                	mov    (%eax),%edx
c0006a79:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a7c:	01 d0                	add    %edx,%eax
c0006a7e:	0f b6 00             	movzbl (%eax),%eax
c0006a81:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006a84:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006a88:	7e 13                	jle    c0006a9d <set_bit_val+0x51>
c0006a8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a8d:	ba 01 00 00 00       	mov    $0x1,%edx
c0006a92:	89 c1                	mov    %eax,%ecx
c0006a94:	d3 e2                	shl    %cl,%edx
c0006a96:	89 d0                	mov    %edx,%eax
c0006a98:	08 45 ff             	or     %al,-0x1(%ebp)
c0006a9b:	eb 13                	jmp    c0006ab0 <set_bit_val+0x64>
c0006a9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006aa0:	ba 01 00 00 00       	mov    $0x1,%edx
c0006aa5:	89 c1                	mov    %eax,%ecx
c0006aa7:	d3 e2                	shl    %cl,%edx
c0006aa9:	89 d0                	mov    %edx,%eax
c0006aab:	f7 d0                	not    %eax
c0006aad:	20 45 ff             	and    %al,-0x1(%ebp)
c0006ab0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ab3:	8b 10                	mov    (%eax),%edx
c0006ab5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006ab8:	01 c2                	add    %eax,%edx
c0006aba:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006abe:	88 02                	mov    %al,(%edx)
c0006ac0:	b8 01 00 00 00       	mov    $0x1,%eax
c0006ac5:	c9                   	leave  
c0006ac6:	c3                   	ret    

c0006ac7 <set_bits>:
c0006ac7:	55                   	push   %ebp
c0006ac8:	89 e5                	mov    %esp,%ebp
c0006aca:	83 ec 10             	sub    $0x10,%esp
c0006acd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006ad4:	eb 1c                	jmp    c0006af2 <set_bits+0x2b>
c0006ad6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ad9:	8d 50 01             	lea    0x1(%eax),%edx
c0006adc:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006adf:	ff 75 10             	pushl  0x10(%ebp)
c0006ae2:	50                   	push   %eax
c0006ae3:	ff 75 08             	pushl  0x8(%ebp)
c0006ae6:	e8 61 ff ff ff       	call   c0006a4c <set_bit_val>
c0006aeb:	83 c4 0c             	add    $0xc,%esp
c0006aee:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006af2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006af5:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006af8:	7c dc                	jl     c0006ad6 <set_bits+0xf>
c0006afa:	b8 01 00 00 00       	mov    $0x1,%eax
c0006aff:	c9                   	leave  
c0006b00:	c3                   	ret    

c0006b01 <get_first_free_bit>:
c0006b01:	55                   	push   %ebp
c0006b02:	89 e5                	mov    %esp,%ebp
c0006b04:	83 ec 10             	sub    $0x10,%esp
c0006b07:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b0a:	8b 40 04             	mov    0x4(%eax),%eax
c0006b0d:	c1 e0 03             	shl    $0x3,%eax
c0006b10:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b13:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b16:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b19:	eb 1b                	jmp    c0006b36 <get_first_free_bit+0x35>
c0006b1b:	ff 75 fc             	pushl  -0x4(%ebp)
c0006b1e:	ff 75 08             	pushl  0x8(%ebp)
c0006b21:	e8 bd fe ff ff       	call   c00069e3 <test_bit_val>
c0006b26:	83 c4 08             	add    $0x8,%esp
c0006b29:	85 c0                	test   %eax,%eax
c0006b2b:	75 05                	jne    c0006b32 <get_first_free_bit+0x31>
c0006b2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006b30:	eb 11                	jmp    c0006b43 <get_first_free_bit+0x42>
c0006b32:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006b36:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006b39:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006b3c:	7c dd                	jl     c0006b1b <get_first_free_bit+0x1a>
c0006b3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006b43:	c9                   	leave  
c0006b44:	c3                   	ret    

c0006b45 <get_bits>:
c0006b45:	55                   	push   %ebp
c0006b46:	89 e5                	mov    %esp,%ebp
c0006b48:	83 ec 20             	sub    $0x20,%esp
c0006b4b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006b52:	ff 75 f0             	pushl  -0x10(%ebp)
c0006b55:	ff 75 08             	pushl  0x8(%ebp)
c0006b58:	e8 a4 ff ff ff       	call   c0006b01 <get_first_free_bit>
c0006b5d:	83 c4 08             	add    $0x8,%esp
c0006b60:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b63:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b66:	8b 40 04             	mov    0x4(%eax),%eax
c0006b69:	c1 e0 03             	shl    $0x3,%eax
c0006b6c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b6f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b72:	83 e8 01             	sub    $0x1,%eax
c0006b75:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b78:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006b7c:	75 08                	jne    c0006b86 <get_bits+0x41>
c0006b7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b81:	e9 85 00 00 00       	jmp    c0006c0b <get_bits+0xc6>
c0006b86:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b89:	83 c0 01             	add    $0x1,%eax
c0006b8c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b92:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b95:	eb 58                	jmp    c0006bef <get_bits+0xaa>
c0006b97:	ff 75 f8             	pushl  -0x8(%ebp)
c0006b9a:	ff 75 08             	pushl  0x8(%ebp)
c0006b9d:	e8 41 fe ff ff       	call   c00069e3 <test_bit_val>
c0006ba2:	83 c4 08             	add    $0x8,%esp
c0006ba5:	85 c0                	test   %eax,%eax
c0006ba7:	75 0a                	jne    c0006bb3 <get_bits+0x6e>
c0006ba9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006bad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006bb1:	eb 2b                	jmp    c0006bde <get_bits+0x99>
c0006bb3:	6a 00                	push   $0x0
c0006bb5:	ff 75 08             	pushl  0x8(%ebp)
c0006bb8:	e8 44 ff ff ff       	call   c0006b01 <get_first_free_bit>
c0006bbd:	83 c4 08             	add    $0x8,%esp
c0006bc0:	83 c0 01             	add    $0x1,%eax
c0006bc3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006bc6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006bc9:	83 c0 01             	add    $0x1,%eax
c0006bcc:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006bcf:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006bd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bd5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006bd8:	83 e8 01             	sub    $0x1,%eax
c0006bdb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006bde:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006be1:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006be4:	7c 09                	jl     c0006bef <get_bits+0xaa>
c0006be6:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006bed:	eb 0d                	jmp    c0006bfc <get_bits+0xb7>
c0006bef:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006bf2:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006bf5:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006bf8:	85 c0                	test   %eax,%eax
c0006bfa:	7f 9b                	jg     c0006b97 <get_bits+0x52>
c0006bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006bff:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006c02:	83 c0 01             	add    $0x1,%eax
c0006c05:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c08:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c0b:	c9                   	leave  
c0006c0c:	c3                   	ret    

c0006c0d <get_a_page2>:
c0006c0d:	55                   	push   %ebp
c0006c0e:	89 e5                	mov    %esp,%ebp
c0006c10:	83 ec 18             	sub    $0x18,%esp
c0006c13:	83 ec 0c             	sub    $0xc,%esp
c0006c16:	ff 75 0c             	pushl  0xc(%ebp)
c0006c19:	e8 1e 00 00 00       	call   c0006c3c <get_a_page>
c0006c1e:	83 c4 10             	add    $0x10,%esp
c0006c21:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c24:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006c27:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c2a:	83 ec 08             	sub    $0x8,%esp
c0006c2d:	52                   	push   %edx
c0006c2e:	50                   	push   %eax
c0006c2f:	e8 86 01 00 00       	call   c0006dba <add_map_entry>
c0006c34:	83 c4 10             	add    $0x10,%esp
c0006c37:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c3a:	c9                   	leave  
c0006c3b:	c3                   	ret    

c0006c3c <get_a_page>:
c0006c3c:	55                   	push   %ebp
c0006c3d:	89 e5                	mov    %esp,%ebp
c0006c3f:	83 ec 28             	sub    $0x28,%esp
c0006c42:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006c46:	75 22                	jne    c0006c6a <get_a_page+0x2e>
c0006c48:	a1 cc 16 01 c0       	mov    0xc00116cc,%eax
c0006c4d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c50:	a1 d0 16 01 c0       	mov    0xc00116d0,%eax
c0006c55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c58:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c0006c5d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c60:	a1 d8 16 01 c0       	mov    0xc00116d8,%eax
c0006c65:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c68:	eb 20                	jmp    c0006c8a <get_a_page+0x4e>
c0006c6a:	a1 14 1f 01 c0       	mov    0xc0011f14,%eax
c0006c6f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c72:	a1 18 1f 01 c0       	mov    0xc0011f18,%eax
c0006c77:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c7a:	a1 1c 1f 01 c0       	mov    0xc0011f1c,%eax
c0006c7f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c82:	a1 20 1f 01 c0       	mov    0xc0011f20,%eax
c0006c87:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c8a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006c8d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006c90:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006c93:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006c96:	6a 01                	push   $0x1
c0006c98:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006c9b:	50                   	push   %eax
c0006c9c:	e8 a4 fe ff ff       	call   c0006b45 <get_bits>
c0006ca1:	83 c4 08             	add    $0x8,%esp
c0006ca4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ca7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0006cab:	75 1c                	jne    c0006cc9 <get_a_page+0x8d>
c0006cad:	68 8c 00 00 00       	push   $0x8c
c0006cb2:	68 7a b9 00 c0       	push   $0xc000b97a
c0006cb7:	68 7a b9 00 c0       	push   $0xc000b97a
c0006cbc:	68 84 b9 00 c0       	push   $0xc000b984
c0006cc1:	e8 78 2e 00 00       	call   c0009b3e <assertion_failure>
c0006cc6:	83 c4 10             	add    $0x10,%esp
c0006cc9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ccc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006ccf:	c1 e2 0c             	shl    $0xc,%edx
c0006cd2:	01 d0                	add    %edx,%eax
c0006cd4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006cd7:	83 ec 04             	sub    $0x4,%esp
c0006cda:	6a 01                	push   $0x1
c0006cdc:	ff 75 f4             	pushl  -0xc(%ebp)
c0006cdf:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006ce2:	50                   	push   %eax
c0006ce3:	e8 64 fd ff ff       	call   c0006a4c <set_bit_val>
c0006ce8:	83 c4 10             	add    $0x10,%esp
c0006ceb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006cee:	c9                   	leave  
c0006cef:	c3                   	ret    

c0006cf0 <get_virtual_address>:
c0006cf0:	55                   	push   %ebp
c0006cf1:	89 e5                	mov    %esp,%ebp
c0006cf3:	83 ec 28             	sub    $0x28,%esp
c0006cf6:	e8 9c a7 ff ff       	call   c0001497 <get_running_thread_pcb>
c0006cfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006cfe:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006d02:	75 1a                	jne    c0006d1e <get_virtual_address+0x2e>
c0006d04:	a1 b4 07 01 c0       	mov    0xc00107b4,%eax
c0006d09:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006d0c:	a1 b8 07 01 c0       	mov    0xc00107b8,%eax
c0006d11:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006d14:	a1 bc 07 01 c0       	mov    0xc00107bc,%eax
c0006d19:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006d1c:	eb 18                	jmp    c0006d36 <get_virtual_address+0x46>
c0006d1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d21:	8b 40 0c             	mov    0xc(%eax),%eax
c0006d24:	83 ec 04             	sub    $0x4,%esp
c0006d27:	6a 0c                	push   $0xc
c0006d29:	50                   	push   %eax
c0006d2a:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006d2d:	50                   	push   %eax
c0006d2e:	e8 54 0e 00 00       	call   c0007b87 <Memcpy>
c0006d33:	83 c4 10             	add    $0x10,%esp
c0006d36:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006d39:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006d3c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006d3f:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006d42:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d45:	83 ec 08             	sub    $0x8,%esp
c0006d48:	50                   	push   %eax
c0006d49:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006d4c:	50                   	push   %eax
c0006d4d:	e8 f3 fd ff ff       	call   c0006b45 <get_bits>
c0006d52:	83 c4 10             	add    $0x10,%esp
c0006d55:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d58:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006d5b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006d5e:	c1 e2 0c             	shl    $0xc,%edx
c0006d61:	01 d0                	add    %edx,%eax
c0006d63:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d66:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d69:	50                   	push   %eax
c0006d6a:	6a 01                	push   $0x1
c0006d6c:	ff 75 f0             	pushl  -0x10(%ebp)
c0006d6f:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006d72:	50                   	push   %eax
c0006d73:	e8 4f fd ff ff       	call   c0006ac7 <set_bits>
c0006d78:	83 c4 10             	add    $0x10,%esp
c0006d7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d7e:	c9                   	leave  
c0006d7f:	c3                   	ret    

c0006d80 <ptr_pde>:
c0006d80:	55                   	push   %ebp
c0006d81:	89 e5                	mov    %esp,%ebp
c0006d83:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d86:	c1 e8 16             	shr    $0x16,%eax
c0006d89:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006d8e:	c1 e0 02             	shl    $0x2,%eax
c0006d91:	5d                   	pop    %ebp
c0006d92:	c3                   	ret    

c0006d93 <ptr_pte>:
c0006d93:	55                   	push   %ebp
c0006d94:	89 e5                	mov    %esp,%ebp
c0006d96:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d99:	c1 e8 0a             	shr    $0xa,%eax
c0006d9c:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006da1:	89 c2                	mov    %eax,%edx
c0006da3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006da6:	c1 e8 0c             	shr    $0xc,%eax
c0006da9:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006dae:	c1 e0 02             	shl    $0x2,%eax
c0006db1:	01 d0                	add    %edx,%eax
c0006db3:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006db8:	5d                   	pop    %ebp
c0006db9:	c3                   	ret    

c0006dba <add_map_entry>:
c0006dba:	55                   	push   %ebp
c0006dbb:	89 e5                	mov    %esp,%ebp
c0006dbd:	83 ec 18             	sub    $0x18,%esp
c0006dc0:	ff 75 08             	pushl  0x8(%ebp)
c0006dc3:	e8 b8 ff ff ff       	call   c0006d80 <ptr_pde>
c0006dc8:	83 c4 04             	add    $0x4,%esp
c0006dcb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006dce:	ff 75 08             	pushl  0x8(%ebp)
c0006dd1:	e8 bd ff ff ff       	call   c0006d93 <ptr_pte>
c0006dd6:	83 c4 04             	add    $0x4,%esp
c0006dd9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ddc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ddf:	8b 00                	mov    (%eax),%eax
c0006de1:	83 e0 01             	and    $0x1,%eax
c0006de4:	85 c0                	test   %eax,%eax
c0006de6:	74 1b                	je     c0006e03 <add_map_entry+0x49>
c0006de8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006deb:	8b 00                	mov    (%eax),%eax
c0006ded:	83 e0 01             	and    $0x1,%eax
c0006df0:	85 c0                	test   %eax,%eax
c0006df2:	75 54                	jne    c0006e48 <add_map_entry+0x8e>
c0006df4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006df7:	83 c8 07             	or     $0x7,%eax
c0006dfa:	89 c2                	mov    %eax,%edx
c0006dfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006dff:	89 10                	mov    %edx,(%eax)
c0006e01:	eb 45                	jmp    c0006e48 <add_map_entry+0x8e>
c0006e03:	83 ec 0c             	sub    $0xc,%esp
c0006e06:	6a 00                	push   $0x0
c0006e08:	e8 2f fe ff ff       	call   c0006c3c <get_a_page>
c0006e0d:	83 c4 10             	add    $0x10,%esp
c0006e10:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e13:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e16:	83 c8 07             	or     $0x7,%eax
c0006e19:	89 c2                	mov    %eax,%edx
c0006e1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e1e:	89 10                	mov    %edx,(%eax)
c0006e20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e23:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e28:	83 ec 04             	sub    $0x4,%esp
c0006e2b:	68 00 10 00 00       	push   $0x1000
c0006e30:	6a 00                	push   $0x0
c0006e32:	50                   	push   %eax
c0006e33:	e8 8f 54 00 00       	call   c000c2c7 <Memset>
c0006e38:	83 c4 10             	add    $0x10,%esp
c0006e3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e3e:	83 c8 07             	or     $0x7,%eax
c0006e41:	89 c2                	mov    %eax,%edx
c0006e43:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e46:	89 10                	mov    %edx,(%eax)
c0006e48:	90                   	nop
c0006e49:	c9                   	leave  
c0006e4a:	c3                   	ret    

c0006e4b <alloc_virtual_memory>:
c0006e4b:	55                   	push   %ebp
c0006e4c:	89 e5                	mov    %esp,%ebp
c0006e4e:	83 ec 28             	sub    $0x28,%esp
c0006e51:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e54:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e59:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e5f:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0006e62:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006e65:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e68:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0006e6b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006e6e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006e73:	c1 e8 0c             	shr    $0xc,%eax
c0006e76:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006e79:	e8 19 a6 ff ff       	call   c0001497 <get_running_thread_pcb>
c0006e7e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006e81:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006e84:	8b 40 08             	mov    0x8(%eax),%eax
c0006e87:	85 c0                	test   %eax,%eax
c0006e89:	75 09                	jne    c0006e94 <alloc_virtual_memory+0x49>
c0006e8b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006e92:	eb 07                	jmp    c0006e9b <alloc_virtual_memory+0x50>
c0006e94:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006e9b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006ea2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006ea9:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0006eb0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006eb7:	eb 47                	jmp    c0006f00 <alloc_virtual_memory+0xb5>
c0006eb9:	83 ec 08             	sub    $0x8,%esp
c0006ebc:	ff 75 f0             	pushl  -0x10(%ebp)
c0006ebf:	6a 01                	push   $0x1
c0006ec1:	e8 2a fe ff ff       	call   c0006cf0 <get_virtual_address>
c0006ec6:	83 c4 10             	add    $0x10,%esp
c0006ec9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006ecc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006ed0:	74 13                	je     c0006ee5 <alloc_virtual_memory+0x9a>
c0006ed2:	83 ec 0c             	sub    $0xc,%esp
c0006ed5:	ff 75 f0             	pushl  -0x10(%ebp)
c0006ed8:	e8 5f fd ff ff       	call   c0006c3c <get_a_page>
c0006edd:	83 c4 10             	add    $0x10,%esp
c0006ee0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ee3:	eb 06                	jmp    c0006eeb <alloc_virtual_memory+0xa0>
c0006ee5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006ee8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006eeb:	83 ec 08             	sub    $0x8,%esp
c0006eee:	ff 75 f4             	pushl  -0xc(%ebp)
c0006ef1:	ff 75 d8             	pushl  -0x28(%ebp)
c0006ef4:	e8 c1 fe ff ff       	call   c0006dba <add_map_entry>
c0006ef9:	83 c4 10             	add    $0x10,%esp
c0006efc:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006f00:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006f03:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0006f06:	72 b1                	jb     c0006eb9 <alloc_virtual_memory+0x6e>
c0006f08:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f0b:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006f10:	89 c2                	mov    %eax,%edx
c0006f12:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f15:	01 d0                	add    %edx,%eax
c0006f17:	c9                   	leave  
c0006f18:	c3                   	ret    

c0006f19 <get_physical_address>:
c0006f19:	55                   	push   %ebp
c0006f1a:	89 e5                	mov    %esp,%ebp
c0006f1c:	83 ec 10             	sub    $0x10,%esp
c0006f1f:	ff 75 08             	pushl  0x8(%ebp)
c0006f22:	e8 6c fe ff ff       	call   c0006d93 <ptr_pte>
c0006f27:	83 c4 04             	add    $0x4,%esp
c0006f2a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f30:	8b 00                	mov    (%eax),%eax
c0006f32:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006f37:	89 c2                	mov    %eax,%edx
c0006f39:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f3c:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006f41:	09 d0                	or     %edx,%eax
c0006f43:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f46:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006f49:	c9                   	leave  
c0006f4a:	c3                   	ret    

c0006f4b <alloc_physical_memory_of_proc>:
c0006f4b:	55                   	push   %ebp
c0006f4c:	89 e5                	mov    %esp,%ebp
c0006f4e:	83 ec 38             	sub    $0x38,%esp
c0006f51:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f54:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006f59:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f5c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006f63:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006f66:	83 ec 0c             	sub    $0xc,%esp
c0006f69:	50                   	push   %eax
c0006f6a:	e8 4d d8 ff ff       	call   c00047bc <pid2proc>
c0006f6f:	83 c4 10             	add    $0x10,%esp
c0006f72:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f75:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f78:	8b 40 0c             	mov    0xc(%eax),%eax
c0006f7b:	83 ec 04             	sub    $0x4,%esp
c0006f7e:	6a 0c                	push   $0xc
c0006f80:	50                   	push   %eax
c0006f81:	8d 45 d0             	lea    -0x30(%ebp),%eax
c0006f84:	50                   	push   %eax
c0006f85:	e8 fd 0b 00 00       	call   c0007b87 <Memcpy>
c0006f8a:	83 c4 10             	add    $0x10,%esp
c0006f8d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f90:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0006f93:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006f96:	89 55 cc             	mov    %edx,-0x34(%ebp)
c0006f99:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006f9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006f9f:	29 c2                	sub    %eax,%edx
c0006fa1:	89 d0                	mov    %edx,%eax
c0006fa3:	c1 e8 0c             	shr    $0xc,%eax
c0006fa6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fa9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006fac:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006faf:	c1 e2 0c             	shl    $0xc,%edx
c0006fb2:	01 d0                	add    %edx,%eax
c0006fb4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006fb7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006fba:	6a 01                	push   $0x1
c0006fbc:	6a 01                	push   $0x1
c0006fbe:	50                   	push   %eax
c0006fbf:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0006fc2:	50                   	push   %eax
c0006fc3:	e8 ff fa ff ff       	call   c0006ac7 <set_bits>
c0006fc8:	83 c4 10             	add    $0x10,%esp
c0006fcb:	83 ec 0c             	sub    $0xc,%esp
c0006fce:	ff 75 f0             	pushl  -0x10(%ebp)
c0006fd1:	e8 66 fc ff ff       	call   c0006c3c <get_a_page>
c0006fd6:	83 c4 10             	add    $0x10,%esp
c0006fd9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006fdc:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006fdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fe2:	01 d0                	add    %edx,%eax
c0006fe4:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006fe9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006fec:	83 ec 08             	sub    $0x8,%esp
c0006fef:	ff 75 dc             	pushl  -0x24(%ebp)
c0006ff2:	ff 75 08             	pushl  0x8(%ebp)
c0006ff5:	e8 c0 fd ff ff       	call   c0006dba <add_map_entry>
c0006ffa:	83 c4 10             	add    $0x10,%esp
c0006ffd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007000:	c9                   	leave  
c0007001:	c3                   	ret    

c0007002 <alloc_physical_memory>:
c0007002:	55                   	push   %ebp
c0007003:	89 e5                	mov    %esp,%ebp
c0007005:	83 ec 38             	sub    $0x38,%esp
c0007008:	8b 45 08             	mov    0x8(%ebp),%eax
c000700b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007010:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007013:	e8 7f a4 ff ff       	call   c0001497 <get_running_thread_pcb>
c0007018:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000701b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000701f:	75 1a                	jne    c000703b <alloc_physical_memory+0x39>
c0007021:	a1 b4 07 01 c0       	mov    0xc00107b4,%eax
c0007026:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007029:	a1 b8 07 01 c0       	mov    0xc00107b8,%eax
c000702e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007031:	a1 bc 07 01 c0       	mov    0xc00107bc,%eax
c0007036:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007039:	eb 18                	jmp    c0007053 <alloc_physical_memory+0x51>
c000703b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000703e:	8b 40 0c             	mov    0xc(%eax),%eax
c0007041:	83 ec 04             	sub    $0x4,%esp
c0007044:	6a 0c                	push   $0xc
c0007046:	50                   	push   %eax
c0007047:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c000704a:	50                   	push   %eax
c000704b:	e8 37 0b 00 00       	call   c0007b87 <Memcpy>
c0007050:	83 c4 10             	add    $0x10,%esp
c0007053:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007056:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0007059:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000705c:	89 55 d0             	mov    %edx,-0x30(%ebp)
c000705f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007062:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007065:	29 c2                	sub    %eax,%edx
c0007067:	89 d0                	mov    %edx,%eax
c0007069:	c1 e8 0c             	shr    $0xc,%eax
c000706c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000706f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007072:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0007075:	c1 e2 0c             	shl    $0xc,%edx
c0007078:	01 d0                	add    %edx,%eax
c000707a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000707d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007080:	6a 01                	push   $0x1
c0007082:	6a 01                	push   $0x1
c0007084:	50                   	push   %eax
c0007085:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0007088:	50                   	push   %eax
c0007089:	e8 39 fa ff ff       	call   c0006ac7 <set_bits>
c000708e:	83 c4 10             	add    $0x10,%esp
c0007091:	83 ec 0c             	sub    $0xc,%esp
c0007094:	ff 75 0c             	pushl  0xc(%ebp)
c0007097:	e8 a0 fb ff ff       	call   c0006c3c <get_a_page>
c000709c:	83 c4 10             	add    $0x10,%esp
c000709f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00070a2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00070a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00070a8:	01 d0                	add    %edx,%eax
c00070aa:	25 ff 0f 00 00       	and    $0xfff,%eax
c00070af:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00070b2:	83 ec 08             	sub    $0x8,%esp
c00070b5:	ff 75 e0             	pushl  -0x20(%ebp)
c00070b8:	ff 75 08             	pushl  0x8(%ebp)
c00070bb:	e8 fa fc ff ff       	call   c0006dba <add_map_entry>
c00070c0:	83 c4 10             	add    $0x10,%esp
c00070c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00070c6:	c9                   	leave  
c00070c7:	c3                   	ret    

c00070c8 <alloc_memory>:
c00070c8:	55                   	push   %ebp
c00070c9:	89 e5                	mov    %esp,%ebp
c00070cb:	83 ec 18             	sub    $0x18,%esp
c00070ce:	83 ec 08             	sub    $0x8,%esp
c00070d1:	ff 75 0c             	pushl  0xc(%ebp)
c00070d4:	ff 75 08             	pushl  0x8(%ebp)
c00070d7:	e8 14 fc ff ff       	call   c0006cf0 <get_virtual_address>
c00070dc:	83 c4 10             	add    $0x10,%esp
c00070df:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070e5:	2d 00 10 00 00       	sub    $0x1000,%eax
c00070ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070ed:	eb 29                	jmp    c0007118 <alloc_memory+0x50>
c00070ef:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c00070f6:	83 ec 0c             	sub    $0xc,%esp
c00070f9:	ff 75 0c             	pushl  0xc(%ebp)
c00070fc:	e8 3b fb ff ff       	call   c0006c3c <get_a_page>
c0007101:	83 c4 10             	add    $0x10,%esp
c0007104:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007107:	83 ec 08             	sub    $0x8,%esp
c000710a:	ff 75 ec             	pushl  -0x14(%ebp)
c000710d:	ff 75 f4             	pushl  -0xc(%ebp)
c0007110:	e8 a5 fc ff ff       	call   c0006dba <add_map_entry>
c0007115:	83 c4 10             	add    $0x10,%esp
c0007118:	8b 45 08             	mov    0x8(%ebp),%eax
c000711b:	8d 50 ff             	lea    -0x1(%eax),%edx
c000711e:	89 55 08             	mov    %edx,0x8(%ebp)
c0007121:	85 c0                	test   %eax,%eax
c0007123:	75 ca                	jne    c00070ef <alloc_memory+0x27>
c0007125:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007128:	c9                   	leave  
c0007129:	c3                   	ret    

c000712a <get_a_virtual_page>:
c000712a:	55                   	push   %ebp
c000712b:	89 e5                	mov    %esp,%ebp
c000712d:	83 ec 18             	sub    $0x18,%esp
c0007130:	83 ec 0c             	sub    $0xc,%esp
c0007133:	ff 75 08             	pushl  0x8(%ebp)
c0007136:	e8 01 fb ff ff       	call   c0006c3c <get_a_page>
c000713b:	83 c4 10             	add    $0x10,%esp
c000713e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007141:	83 ec 08             	sub    $0x8,%esp
c0007144:	ff 75 f4             	pushl  -0xc(%ebp)
c0007147:	ff 75 0c             	pushl  0xc(%ebp)
c000714a:	e8 6b fc ff ff       	call   c0006dba <add_map_entry>
c000714f:	83 c4 10             	add    $0x10,%esp
c0007152:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007155:	c9                   	leave  
c0007156:	c3                   	ret    

c0007157 <block2arena>:
c0007157:	55                   	push   %ebp
c0007158:	89 e5                	mov    %esp,%ebp
c000715a:	83 ec 10             	sub    $0x10,%esp
c000715d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007160:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007165:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007168:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000716b:	c9                   	leave  
c000716c:	c3                   	ret    

c000716d <sys_malloc2>:
c000716d:	55                   	push   %ebp
c000716e:	89 e5                	mov    %esp,%ebp
c0007170:	83 ec 68             	sub    $0x68,%esp
c0007173:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000717a:	e8 18 a3 ff ff       	call   c0001497 <get_running_thread_pcb>
c000717f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007182:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007185:	8b 40 08             	mov    0x8(%eax),%eax
c0007188:	85 c0                	test   %eax,%eax
c000718a:	75 10                	jne    c000719c <sys_malloc2+0x2f>
c000718c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007193:	c7 45 ec c0 47 08 c0 	movl   $0xc00847c0,-0x14(%ebp)
c000719a:	eb 10                	jmp    c00071ac <sys_malloc2+0x3f>
c000719c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00071a3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00071a6:	83 c0 10             	add    $0x10,%eax
c00071a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00071ac:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c00071b3:	76 52                	jbe    c0007207 <sys_malloc2+0x9a>
c00071b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00071b8:	05 0b 10 00 00       	add    $0x100b,%eax
c00071bd:	c1 e8 0c             	shr    $0xc,%eax
c00071c0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00071c3:	83 ec 08             	sub    $0x8,%esp
c00071c6:	ff 75 f0             	pushl  -0x10(%ebp)
c00071c9:	ff 75 d8             	pushl  -0x28(%ebp)
c00071cc:	e8 f7 fe ff ff       	call   c00070c8 <alloc_memory>
c00071d1:	83 c4 10             	add    $0x10,%esp
c00071d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00071d7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00071da:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00071dd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00071e6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071e9:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c00071f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071f3:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c00071f7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071fa:	05 90 00 00 00       	add    $0x90,%eax
c00071ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007202:	e9 f0 01 00 00       	jmp    c00073f7 <sys_malloc2+0x28a>
c0007207:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000720e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007215:	eb 26                	jmp    c000723d <sys_malloc2+0xd0>
c0007217:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000721a:	89 d0                	mov    %edx,%eax
c000721c:	01 c0                	add    %eax,%eax
c000721e:	01 d0                	add    %edx,%eax
c0007220:	c1 e0 03             	shl    $0x3,%eax
c0007223:	89 c2                	mov    %eax,%edx
c0007225:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007228:	01 d0                	add    %edx,%eax
c000722a:	8b 00                	mov    (%eax),%eax
c000722c:	39 45 08             	cmp    %eax,0x8(%ebp)
c000722f:	77 08                	ja     c0007239 <sys_malloc2+0xcc>
c0007231:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007234:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007237:	eb 0a                	jmp    c0007243 <sys_malloc2+0xd6>
c0007239:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000723d:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0007241:	7e d4                	jle    c0007217 <sys_malloc2+0xaa>
c0007243:	83 ec 08             	sub    $0x8,%esp
c0007246:	ff 75 f0             	pushl  -0x10(%ebp)
c0007249:	6a 01                	push   $0x1
c000724b:	e8 78 fe ff ff       	call   c00070c8 <alloc_memory>
c0007250:	83 c4 10             	add    $0x10,%esp
c0007253:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007256:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007259:	89 d0                	mov    %edx,%eax
c000725b:	01 c0                	add    %eax,%eax
c000725d:	01 d0                	add    %edx,%eax
c000725f:	c1 e0 03             	shl    $0x3,%eax
c0007262:	89 c2                	mov    %eax,%edx
c0007264:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007267:	01 d0                	add    %edx,%eax
c0007269:	83 ec 04             	sub    $0x4,%esp
c000726c:	6a 18                	push   $0x18
c000726e:	50                   	push   %eax
c000726f:	ff 75 cc             	pushl  -0x34(%ebp)
c0007272:	e8 10 09 00 00       	call   c0007b87 <Memcpy>
c0007277:	83 c4 10             	add    $0x10,%esp
c000727a:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0007281:	e8 9d 08 00 00       	call   c0007b23 <intr_disable>
c0007286:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007289:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000728c:	89 d0                	mov    %edx,%eax
c000728e:	01 c0                	add    %eax,%eax
c0007290:	01 d0                	add    %edx,%eax
c0007292:	c1 e0 03             	shl    $0x3,%eax
c0007295:	89 c2                	mov    %eax,%edx
c0007297:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000729a:	01 d0                	add    %edx,%eax
c000729c:	83 c0 08             	add    $0x8,%eax
c000729f:	83 ec 0c             	sub    $0xc,%esp
c00072a2:	50                   	push   %eax
c00072a3:	e8 ab 3c 00 00       	call   c000af53 <isListEmpty>
c00072a8:	83 c4 10             	add    $0x10,%esp
c00072ab:	3c 01                	cmp    $0x1,%al
c00072ad:	0f 85 c1 00 00 00    	jne    c0007374 <sys_malloc2+0x207>
c00072b3:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c00072ba:	83 ec 08             	sub    $0x8,%esp
c00072bd:	ff 75 f0             	pushl  -0x10(%ebp)
c00072c0:	6a 01                	push   $0x1
c00072c2:	e8 01 fe ff ff       	call   c00070c8 <alloc_memory>
c00072c7:	83 c4 10             	add    $0x10,%esp
c00072ca:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00072cd:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00072d0:	83 ec 0c             	sub    $0xc,%esp
c00072d3:	50                   	push   %eax
c00072d4:	e8 7e fe ff ff       	call   c0007157 <block2arena>
c00072d9:	83 c4 10             	add    $0x10,%esp
c00072dc:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00072df:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00072e2:	89 d0                	mov    %edx,%eax
c00072e4:	01 c0                	add    %eax,%eax
c00072e6:	01 d0                	add    %edx,%eax
c00072e8:	c1 e0 03             	shl    $0x3,%eax
c00072eb:	89 c2                	mov    %eax,%edx
c00072ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00072f0:	01 d0                	add    %edx,%eax
c00072f2:	8b 50 04             	mov    0x4(%eax),%edx
c00072f5:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00072f8:	89 50 04             	mov    %edx,0x4(%eax)
c00072fb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00072fe:	8b 00                	mov    (%eax),%eax
c0007300:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007303:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c000730a:	b8 00 10 00 00       	mov    $0x1000,%eax
c000730f:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0007312:	ba 00 00 00 00       	mov    $0x0,%edx
c0007317:	f7 75 b8             	divl   -0x48(%ebp)
c000731a:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000731d:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0007320:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0007323:	01 d0                	add    %edx,%eax
c0007325:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0007328:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000732f:	eb 3b                	jmp    c000736c <sys_malloc2+0x1ff>
c0007331:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007334:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0007338:	89 c2                	mov    %eax,%edx
c000733a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000733d:	01 d0                	add    %edx,%eax
c000733f:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0007342:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0007345:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007348:	89 d0                	mov    %edx,%eax
c000734a:	01 c0                	add    %eax,%eax
c000734c:	01 d0                	add    %edx,%eax
c000734e:	c1 e0 03             	shl    $0x3,%eax
c0007351:	89 c2                	mov    %eax,%edx
c0007353:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007356:	01 d0                	add    %edx,%eax
c0007358:	83 c0 08             	add    $0x8,%eax
c000735b:	83 ec 08             	sub    $0x8,%esp
c000735e:	51                   	push   %ecx
c000735f:	50                   	push   %eax
c0007360:	e8 eb 3c 00 00       	call   c000b050 <appendToDoubleLinkList>
c0007365:	83 c4 10             	add    $0x10,%esp
c0007368:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000736c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000736f:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0007372:	77 bd                	ja     c0007331 <sys_malloc2+0x1c4>
c0007374:	83 ec 0c             	sub    $0xc,%esp
c0007377:	ff 75 c4             	pushl  -0x3c(%ebp)
c000737a:	e8 cd 07 00 00       	call   c0007b4c <intr_set_status>
c000737f:	83 c4 10             	add    $0x10,%esp
c0007382:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007385:	89 d0                	mov    %edx,%eax
c0007387:	01 c0                	add    %eax,%eax
c0007389:	01 d0                	add    %edx,%eax
c000738b:	c1 e0 03             	shl    $0x3,%eax
c000738e:	89 c2                	mov    %eax,%edx
c0007390:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007393:	01 d0                	add    %edx,%eax
c0007395:	83 c0 08             	add    $0x8,%eax
c0007398:	83 ec 0c             	sub    $0xc,%esp
c000739b:	50                   	push   %eax
c000739c:	e8 19 3e 00 00       	call   c000b1ba <popFromDoubleLinkList>
c00073a1:	83 c4 10             	add    $0x10,%esp
c00073a4:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00073a7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00073aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00073ad:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c00073b1:	75 1c                	jne    c00073cf <sys_malloc2+0x262>
c00073b3:	68 ca 01 00 00       	push   $0x1ca
c00073b8:	68 7a b9 00 c0       	push   $0xc000b97a
c00073bd:	68 7a b9 00 c0       	push   $0xc000b97a
c00073c2:	68 90 b9 00 c0       	push   $0xc000b990
c00073c7:	e8 72 27 00 00       	call   c0009b3e <assertion_failure>
c00073cc:	83 c4 10             	add    $0x10,%esp
c00073cf:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00073d2:	83 ec 0c             	sub    $0xc,%esp
c00073d5:	50                   	push   %eax
c00073d6:	e8 7c fd ff ff       	call   c0007157 <block2arena>
c00073db:	83 c4 10             	add    $0x10,%esp
c00073de:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00073e1:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00073e4:	8b 40 04             	mov    0x4(%eax),%eax
c00073e7:	8d 50 ff             	lea    -0x1(%eax),%edx
c00073ea:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00073ed:	89 50 04             	mov    %edx,0x4(%eax)
c00073f0:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c00073f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00073fb:	75 1c                	jne    c0007419 <sys_malloc2+0x2ac>
c00073fd:	68 d1 01 00 00       	push   $0x1d1
c0007402:	68 7a b9 00 c0       	push   $0xc000b97a
c0007407:	68 7a b9 00 c0       	push   $0xc000b97a
c000740c:	68 a2 b9 00 c0       	push   $0xc000b9a2
c0007411:	e8 28 27 00 00       	call   c0009b3e <assertion_failure>
c0007416:	83 c4 10             	add    $0x10,%esp
c0007419:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000741c:	c9                   	leave  
c000741d:	c3                   	ret    

c000741e <remove_map_entry>:
c000741e:	55                   	push   %ebp
c000741f:	89 e5                	mov    %esp,%ebp
c0007421:	83 ec 10             	sub    $0x10,%esp
c0007424:	ff 75 08             	pushl  0x8(%ebp)
c0007427:	e8 67 f9 ff ff       	call   c0006d93 <ptr_pte>
c000742c:	83 c4 04             	add    $0x4,%esp
c000742f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007432:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007435:	8b 10                	mov    (%eax),%edx
c0007437:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000743a:	89 10                	mov    %edx,(%eax)
c000743c:	90                   	nop
c000743d:	c9                   	leave  
c000743e:	c3                   	ret    

c000743f <free_a_page>:
c000743f:	55                   	push   %ebp
c0007440:	89 e5                	mov    %esp,%ebp
c0007442:	83 ec 20             	sub    $0x20,%esp
c0007445:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007449:	75 21                	jne    c000746c <free_a_page+0x2d>
c000744b:	a1 b4 07 01 c0       	mov    0xc00107b4,%eax
c0007450:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007453:	a1 b8 07 01 c0       	mov    0xc00107b8,%eax
c0007458:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000745b:	a1 bc 07 01 c0       	mov    0xc00107bc,%eax
c0007460:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007463:	c7 45 fc cc 16 01 c0 	movl   $0xc00116cc,-0x4(%ebp)
c000746a:	eb 1f                	jmp    c000748b <free_a_page+0x4c>
c000746c:	a1 b4 07 01 c0       	mov    0xc00107b4,%eax
c0007471:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007474:	a1 b8 07 01 c0       	mov    0xc00107b8,%eax
c0007479:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000747c:	a1 bc 07 01 c0       	mov    0xc00107bc,%eax
c0007481:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007484:	c7 45 fc 14 1f 01 c0 	movl   $0xc0011f14,-0x4(%ebp)
c000748b:	8b 45 08             	mov    0x8(%ebp),%eax
c000748e:	c1 e8 0c             	shr    $0xc,%eax
c0007491:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007494:	6a 00                	push   $0x0
c0007496:	ff 75 f8             	pushl  -0x8(%ebp)
c0007499:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000749c:	50                   	push   %eax
c000749d:	e8 aa f5 ff ff       	call   c0006a4c <set_bit_val>
c00074a2:	83 c4 0c             	add    $0xc,%esp
c00074a5:	ff 75 08             	pushl  0x8(%ebp)
c00074a8:	e8 6c fa ff ff       	call   c0006f19 <get_physical_address>
c00074ad:	83 c4 04             	add    $0x4,%esp
c00074b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00074b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00074b6:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00074bc:	85 c0                	test   %eax,%eax
c00074be:	0f 48 c2             	cmovs  %edx,%eax
c00074c1:	c1 f8 0c             	sar    $0xc,%eax
c00074c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00074c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00074ca:	6a 00                	push   $0x0
c00074cc:	ff 75 f0             	pushl  -0x10(%ebp)
c00074cf:	50                   	push   %eax
c00074d0:	e8 77 f5 ff ff       	call   c0006a4c <set_bit_val>
c00074d5:	83 c4 0c             	add    $0xc,%esp
c00074d8:	ff 75 08             	pushl  0x8(%ebp)
c00074db:	e8 3e ff ff ff       	call   c000741e <remove_map_entry>
c00074e0:	83 c4 04             	add    $0x4,%esp
c00074e3:	90                   	nop
c00074e4:	c9                   	leave  
c00074e5:	c3                   	ret    

c00074e6 <sys_free2>:
c00074e6:	55                   	push   %ebp
c00074e7:	89 e5                	mov    %esp,%ebp
c00074e9:	83 ec 58             	sub    $0x58,%esp
c00074ec:	e8 a6 9f ff ff       	call   c0001497 <get_running_thread_pcb>
c00074f1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00074f4:	e8 2a 06 00 00       	call   c0007b23 <intr_disable>
c00074f9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00074fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00074ff:	8b 40 08             	mov    0x8(%eax),%eax
c0007502:	85 c0                	test   %eax,%eax
c0007504:	75 10                	jne    c0007516 <sys_free2+0x30>
c0007506:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000750d:	c7 45 f0 c0 47 08 c0 	movl   $0xc00847c0,-0x10(%ebp)
c0007514:	eb 10                	jmp    c0007526 <sys_free2+0x40>
c0007516:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000751d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007520:	83 c0 10             	add    $0x10,%eax
c0007523:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007526:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c000752d:	76 4d                	jbe    c000757c <sys_free2+0x96>
c000752f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007532:	83 e8 0c             	sub    $0xc,%eax
c0007535:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007538:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c000753c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000753f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007544:	c1 e8 0c             	shr    $0xc,%eax
c0007547:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000754a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007551:	eb 1c                	jmp    c000756f <sys_free2+0x89>
c0007553:	83 ec 08             	sub    $0x8,%esp
c0007556:	ff 75 f4             	pushl  -0xc(%ebp)
c0007559:	ff 75 ec             	pushl  -0x14(%ebp)
c000755c:	e8 de fe ff ff       	call   c000743f <free_a_page>
c0007561:	83 c4 10             	add    $0x10,%esp
c0007564:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c000756b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000756f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007572:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0007575:	77 dc                	ja     c0007553 <sys_free2+0x6d>
c0007577:	e9 dc 00 00 00       	jmp    c0007658 <sys_free2+0x172>
c000757c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007583:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000758a:	eb 26                	jmp    c00075b2 <sys_free2+0xcc>
c000758c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000758f:	89 d0                	mov    %edx,%eax
c0007591:	01 c0                	add    %eax,%eax
c0007593:	01 d0                	add    %edx,%eax
c0007595:	c1 e0 03             	shl    $0x3,%eax
c0007598:	89 c2                	mov    %eax,%edx
c000759a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000759d:	01 d0                	add    %edx,%eax
c000759f:	8b 00                	mov    (%eax),%eax
c00075a1:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00075a4:	77 08                	ja     c00075ae <sys_free2+0xc8>
c00075a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00075a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00075ac:	eb 0a                	jmp    c00075b8 <sys_free2+0xd2>
c00075ae:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00075b2:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c00075b6:	7e d4                	jle    c000758c <sys_free2+0xa6>
c00075b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00075bb:	89 d0                	mov    %edx,%eax
c00075bd:	01 c0                	add    %eax,%eax
c00075bf:	01 d0                	add    %edx,%eax
c00075c1:	c1 e0 03             	shl    $0x3,%eax
c00075c4:	89 c2                	mov    %eax,%edx
c00075c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00075c9:	01 d0                	add    %edx,%eax
c00075cb:	8b 10                	mov    (%eax),%edx
c00075cd:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c00075d0:	8b 50 04             	mov    0x4(%eax),%edx
c00075d3:	89 55 b8             	mov    %edx,-0x48(%ebp)
c00075d6:	8b 50 08             	mov    0x8(%eax),%edx
c00075d9:	89 55 bc             	mov    %edx,-0x44(%ebp)
c00075dc:	8b 50 0c             	mov    0xc(%eax),%edx
c00075df:	89 55 c0             	mov    %edx,-0x40(%ebp)
c00075e2:	8b 50 10             	mov    0x10(%eax),%edx
c00075e5:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c00075e8:	8b 40 14             	mov    0x14(%eax),%eax
c00075eb:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00075ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00075f1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00075f4:	83 ec 0c             	sub    $0xc,%esp
c00075f7:	ff 75 d0             	pushl  -0x30(%ebp)
c00075fa:	e8 58 fb ff ff       	call   c0007157 <block2arena>
c00075ff:	83 c4 10             	add    $0x10,%esp
c0007602:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007605:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007608:	89 d0                	mov    %edx,%eax
c000760a:	01 c0                	add    %eax,%eax
c000760c:	01 d0                	add    %edx,%eax
c000760e:	c1 e0 03             	shl    $0x3,%eax
c0007611:	89 c2                	mov    %eax,%edx
c0007613:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007616:	01 d0                	add    %edx,%eax
c0007618:	83 c0 08             	add    $0x8,%eax
c000761b:	83 ec 08             	sub    $0x8,%esp
c000761e:	ff 75 d0             	pushl  -0x30(%ebp)
c0007621:	50                   	push   %eax
c0007622:	e8 29 3a 00 00       	call   c000b050 <appendToDoubleLinkList>
c0007627:	83 c4 10             	add    $0x10,%esp
c000762a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000762d:	8b 40 04             	mov    0x4(%eax),%eax
c0007630:	8d 50 01             	lea    0x1(%eax),%edx
c0007633:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007636:	89 50 04             	mov    %edx,0x4(%eax)
c0007639:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000763c:	8b 50 04             	mov    0x4(%eax),%edx
c000763f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007642:	39 c2                	cmp    %eax,%edx
c0007644:	75 12                	jne    c0007658 <sys_free2+0x172>
c0007646:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007649:	83 ec 08             	sub    $0x8,%esp
c000764c:	ff 75 f4             	pushl  -0xc(%ebp)
c000764f:	50                   	push   %eax
c0007650:	e8 ea fd ff ff       	call   c000743f <free_a_page>
c0007655:	83 c4 10             	add    $0x10,%esp
c0007658:	83 ec 0c             	sub    $0xc,%esp
c000765b:	ff 75 d8             	pushl  -0x28(%ebp)
c000765e:	e8 e9 04 00 00       	call   c0007b4c <intr_set_status>
c0007663:	83 c4 10             	add    $0x10,%esp
c0007666:	90                   	nop
c0007667:	c9                   	leave  
c0007668:	c3                   	ret    

c0007669 <init_memory_block_desc>:
c0007669:	55                   	push   %ebp
c000766a:	89 e5                	mov    %esp,%ebp
c000766c:	83 ec 18             	sub    $0x18,%esp
c000766f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007676:	e9 b2 00 00 00       	jmp    c000772d <init_memory_block_desc+0xc4>
c000767b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000767f:	75 1b                	jne    c000769c <init_memory_block_desc+0x33>
c0007681:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007684:	89 d0                	mov    %edx,%eax
c0007686:	01 c0                	add    %eax,%eax
c0007688:	01 d0                	add    %edx,%eax
c000768a:	c1 e0 03             	shl    $0x3,%eax
c000768d:	89 c2                	mov    %eax,%edx
c000768f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007692:	01 d0                	add    %edx,%eax
c0007694:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000769a:	eb 2e                	jmp    c00076ca <init_memory_block_desc+0x61>
c000769c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000769f:	89 d0                	mov    %edx,%eax
c00076a1:	01 c0                	add    %eax,%eax
c00076a3:	01 d0                	add    %edx,%eax
c00076a5:	c1 e0 03             	shl    $0x3,%eax
c00076a8:	8d 50 e8             	lea    -0x18(%eax),%edx
c00076ab:	8b 45 08             	mov    0x8(%ebp),%eax
c00076ae:	01 d0                	add    %edx,%eax
c00076b0:	8b 08                	mov    (%eax),%ecx
c00076b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076b5:	89 d0                	mov    %edx,%eax
c00076b7:	01 c0                	add    %eax,%eax
c00076b9:	01 d0                	add    %edx,%eax
c00076bb:	c1 e0 03             	shl    $0x3,%eax
c00076be:	89 c2                	mov    %eax,%edx
c00076c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00076c3:	01 d0                	add    %edx,%eax
c00076c5:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c00076c8:	89 10                	mov    %edx,(%eax)
c00076ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076cd:	89 d0                	mov    %edx,%eax
c00076cf:	01 c0                	add    %eax,%eax
c00076d1:	01 d0                	add    %edx,%eax
c00076d3:	c1 e0 03             	shl    $0x3,%eax
c00076d6:	89 c2                	mov    %eax,%edx
c00076d8:	8b 45 08             	mov    0x8(%ebp),%eax
c00076db:	01 d0                	add    %edx,%eax
c00076dd:	8b 00                	mov    (%eax),%eax
c00076df:	89 c1                	mov    %eax,%ecx
c00076e1:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c00076e6:	ba 00 00 00 00       	mov    $0x0,%edx
c00076eb:	f7 f1                	div    %ecx
c00076ed:	89 c1                	mov    %eax,%ecx
c00076ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076f2:	89 d0                	mov    %edx,%eax
c00076f4:	01 c0                	add    %eax,%eax
c00076f6:	01 d0                	add    %edx,%eax
c00076f8:	c1 e0 03             	shl    $0x3,%eax
c00076fb:	89 c2                	mov    %eax,%edx
c00076fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0007700:	01 d0                	add    %edx,%eax
c0007702:	89 ca                	mov    %ecx,%edx
c0007704:	89 50 04             	mov    %edx,0x4(%eax)
c0007707:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000770a:	89 d0                	mov    %edx,%eax
c000770c:	01 c0                	add    %eax,%eax
c000770e:	01 d0                	add    %edx,%eax
c0007710:	c1 e0 03             	shl    $0x3,%eax
c0007713:	89 c2                	mov    %eax,%edx
c0007715:	8b 45 08             	mov    0x8(%ebp),%eax
c0007718:	01 d0                	add    %edx,%eax
c000771a:	83 c0 08             	add    $0x8,%eax
c000771d:	83 ec 0c             	sub    $0xc,%esp
c0007720:	50                   	push   %eax
c0007721:	e8 ff 37 00 00       	call   c000af25 <initDoubleLinkList>
c0007726:	83 c4 10             	add    $0x10,%esp
c0007729:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000772d:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0007731:	0f 8e 44 ff ff ff    	jle    c000767b <init_memory_block_desc+0x12>
c0007737:	90                   	nop
c0007738:	c9                   	leave  
c0007739:	c3                   	ret    

c000773a <init_memory2>:
c000773a:	55                   	push   %ebp
c000773b:	89 e5                	mov    %esp,%ebp
c000773d:	83 ec 38             	sub    $0x38,%esp
c0007740:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0007747:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c000774e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007751:	a3 d4 16 01 c0       	mov    %eax,0xc00116d4
c0007756:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007759:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c000775e:	29 c2                	sub    %eax,%edx
c0007760:	89 d0                	mov    %edx,%eax
c0007762:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007765:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007768:	89 c2                	mov    %eax,%edx
c000776a:	c1 ea 1f             	shr    $0x1f,%edx
c000776d:	01 d0                	add    %edx,%eax
c000776f:	d1 f8                	sar    %eax
c0007771:	a3 d8 16 01 c0       	mov    %eax,0xc00116d8
c0007776:	a1 d8 16 01 c0       	mov    0xc00116d8,%eax
c000777b:	83 ec 0c             	sub    $0xc,%esp
c000777e:	50                   	push   %eax
c000777f:	e8 ec 07 00 00       	call   c0007f70 <disp_int>
c0007784:	83 c4 10             	add    $0x10,%esp
c0007787:	a1 d8 16 01 c0       	mov    0xc00116d8,%eax
c000778c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000778f:	29 c2                	sub    %eax,%edx
c0007791:	89 d0                	mov    %edx,%eax
c0007793:	a3 20 1f 01 c0       	mov    %eax,0xc0011f20
c0007798:	83 ec 0c             	sub    $0xc,%esp
c000779b:	68 ae b9 00 c0       	push   $0xc000b9ae
c00077a0:	e8 e7 99 ff ff       	call   c000118c <disp_str>
c00077a5:	83 c4 10             	add    $0x10,%esp
c00077a8:	a1 20 1f 01 c0       	mov    0xc0011f20,%eax
c00077ad:	83 ec 0c             	sub    $0xc,%esp
c00077b0:	50                   	push   %eax
c00077b1:	e8 ba 07 00 00       	call   c0007f70 <disp_int>
c00077b6:	83 c4 10             	add    $0x10,%esp
c00077b9:	83 ec 0c             	sub    $0xc,%esp
c00077bc:	68 ae b9 00 c0       	push   $0xc000b9ae
c00077c1:	e8 c6 99 ff ff       	call   c000118c <disp_str>
c00077c6:	83 c4 10             	add    $0x10,%esp
c00077c9:	a1 d8 16 01 c0       	mov    0xc00116d8,%eax
c00077ce:	05 ff 0f 00 00       	add    $0xfff,%eax
c00077d3:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00077d9:	85 c0                	test   %eax,%eax
c00077db:	0f 48 c2             	cmovs  %edx,%eax
c00077de:	c1 f8 0c             	sar    $0xc,%eax
c00077e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00077e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077e7:	83 c0 07             	add    $0x7,%eax
c00077ea:	8d 50 07             	lea    0x7(%eax),%edx
c00077ed:	85 c0                	test   %eax,%eax
c00077ef:	0f 48 c2             	cmovs  %edx,%eax
c00077f2:	c1 f8 03             	sar    $0x3,%eax
c00077f5:	a3 d0 16 01 c0       	mov    %eax,0xc00116d0
c00077fa:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c00077ff:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0007804:	a3 cc 16 01 c0       	mov    %eax,0xc00116cc
c0007809:	8b 15 d0 16 01 c0    	mov    0xc00116d0,%edx
c000780f:	a1 cc 16 01 c0       	mov    0xc00116cc,%eax
c0007814:	83 ec 04             	sub    $0x4,%esp
c0007817:	52                   	push   %edx
c0007818:	6a 00                	push   $0x0
c000781a:	50                   	push   %eax
c000781b:	e8 a7 4a 00 00       	call   c000c2c7 <Memset>
c0007820:	83 c4 10             	add    $0x10,%esp
c0007823:	a1 d0 16 01 c0       	mov    0xc00116d0,%eax
c0007828:	05 ff 0f 00 00       	add    $0xfff,%eax
c000782d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007833:	85 c0                	test   %eax,%eax
c0007835:	0f 48 c2             	cmovs  %edx,%eax
c0007838:	c1 f8 0c             	sar    $0xc,%eax
c000783b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000783e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007841:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007844:	ff 75 e8             	pushl  -0x18(%ebp)
c0007847:	6a 01                	push   $0x1
c0007849:	6a 00                	push   $0x0
c000784b:	68 cc 16 01 c0       	push   $0xc00116cc
c0007850:	e8 72 f2 ff ff       	call   c0006ac7 <set_bits>
c0007855:	83 c4 10             	add    $0x10,%esp
c0007858:	a1 20 1f 01 c0       	mov    0xc0011f20,%eax
c000785d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007862:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007868:	85 c0                	test   %eax,%eax
c000786a:	0f 48 c2             	cmovs  %edx,%eax
c000786d:	c1 f8 0c             	sar    $0xc,%eax
c0007870:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007873:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007876:	83 c0 07             	add    $0x7,%eax
c0007879:	8d 50 07             	lea    0x7(%eax),%edx
c000787c:	85 c0                	test   %eax,%eax
c000787e:	0f 48 c2             	cmovs  %edx,%eax
c0007881:	c1 f8 03             	sar    $0x3,%eax
c0007884:	a3 18 1f 01 c0       	mov    %eax,0xc0011f18
c0007889:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c000788e:	8b 15 d0 16 01 c0    	mov    0xc00116d0,%edx
c0007894:	01 d0                	add    %edx,%eax
c0007896:	a3 14 1f 01 c0       	mov    %eax,0xc0011f14
c000789b:	8b 15 18 1f 01 c0    	mov    0xc0011f18,%edx
c00078a1:	a1 14 1f 01 c0       	mov    0xc0011f14,%eax
c00078a6:	83 ec 04             	sub    $0x4,%esp
c00078a9:	52                   	push   %edx
c00078aa:	6a 00                	push   $0x0
c00078ac:	50                   	push   %eax
c00078ad:	e8 15 4a 00 00       	call   c000c2c7 <Memset>
c00078b2:	83 c4 10             	add    $0x10,%esp
c00078b5:	a1 18 1f 01 c0       	mov    0xc0011f18,%eax
c00078ba:	05 ff 0f 00 00       	add    $0xfff,%eax
c00078bf:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078c5:	85 c0                	test   %eax,%eax
c00078c7:	0f 48 c2             	cmovs  %edx,%eax
c00078ca:	c1 f8 0c             	sar    $0xc,%eax
c00078cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00078d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00078d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00078d6:	ff 75 e8             	pushl  -0x18(%ebp)
c00078d9:	6a 01                	push   $0x1
c00078db:	ff 75 e0             	pushl  -0x20(%ebp)
c00078de:	68 cc 16 01 c0       	push   $0xc00116cc
c00078e3:	e8 df f1 ff ff       	call   c0006ac7 <set_bits>
c00078e8:	83 c4 10             	add    $0x10,%esp
c00078eb:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c00078f2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00078f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078fb:	83 c0 07             	add    $0x7,%eax
c00078fe:	8d 50 07             	lea    0x7(%eax),%edx
c0007901:	85 c0                	test   %eax,%eax
c0007903:	0f 48 c2             	cmovs  %edx,%eax
c0007906:	c1 f8 03             	sar    $0x3,%eax
c0007909:	a3 b8 07 01 c0       	mov    %eax,0xc00107b8
c000790e:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c0007913:	8b 15 d0 16 01 c0    	mov    0xc00116d0,%edx
c0007919:	01 c2                	add    %eax,%edx
c000791b:	a1 18 1f 01 c0       	mov    0xc0011f18,%eax
c0007920:	01 d0                	add    %edx,%eax
c0007922:	a3 b4 07 01 c0       	mov    %eax,0xc00107b4
c0007927:	8b 15 b8 07 01 c0    	mov    0xc00107b8,%edx
c000792d:	a1 b4 07 01 c0       	mov    0xc00107b4,%eax
c0007932:	83 ec 04             	sub    $0x4,%esp
c0007935:	52                   	push   %edx
c0007936:	6a 00                	push   $0x0
c0007938:	50                   	push   %eax
c0007939:	e8 89 49 00 00       	call   c000c2c7 <Memset>
c000793e:	83 c4 10             	add    $0x10,%esp
c0007941:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007944:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007947:	01 d0                	add    %edx,%eax
c0007949:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000794c:	a1 b8 07 01 c0       	mov    0xc00107b8,%eax
c0007951:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007956:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000795c:	85 c0                	test   %eax,%eax
c000795e:	0f 48 c2             	cmovs  %edx,%eax
c0007961:	c1 f8 0c             	sar    $0xc,%eax
c0007964:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007967:	ff 75 e8             	pushl  -0x18(%ebp)
c000796a:	6a 01                	push   $0x1
c000796c:	ff 75 e0             	pushl  -0x20(%ebp)
c000796f:	68 cc 16 01 c0       	push   $0xc00116cc
c0007974:	e8 4e f1 ff ff       	call   c0006ac7 <set_bits>
c0007979:	83 c4 10             	add    $0x10,%esp
c000797c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000797f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007982:	01 d0                	add    %edx,%eax
c0007984:	c1 e0 0c             	shl    $0xc,%eax
c0007987:	a3 bc 07 01 c0       	mov    %eax,0xc00107bc
c000798c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000798f:	83 c0 02             	add    $0x2,%eax
c0007992:	c1 e0 0c             	shl    $0xc,%eax
c0007995:	89 c2                	mov    %eax,%edx
c0007997:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000799a:	01 d0                	add    %edx,%eax
c000799c:	a3 bc 07 01 c0       	mov    %eax,0xc00107bc
c00079a1:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00079a8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00079ab:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00079ae:	90                   	nop
c00079af:	c9                   	leave  
c00079b0:	c3                   	ret    

c00079b1 <init_memory>:
c00079b1:	55                   	push   %ebp
c00079b2:	89 e5                	mov    %esp,%ebp
c00079b4:	83 ec 38             	sub    $0x38,%esp
c00079b7:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c00079be:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c00079c5:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c00079cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00079cf:	05 00 00 10 00       	add    $0x100000,%eax
c00079d4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00079d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00079da:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00079dd:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00079e3:	85 c0                	test   %eax,%eax
c00079e5:	0f 48 c2             	cmovs  %edx,%eax
c00079e8:	c1 f8 0c             	sar    $0xc,%eax
c00079eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00079ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00079f1:	89 c2                	mov    %eax,%edx
c00079f3:	c1 ea 1f             	shr    $0x1f,%edx
c00079f6:	01 d0                	add    %edx,%eax
c00079f8:	d1 f8                	sar    %eax
c00079fa:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00079fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007a00:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007a03:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007a06:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007a09:	8d 50 07             	lea    0x7(%eax),%edx
c0007a0c:	85 c0                	test   %eax,%eax
c0007a0e:	0f 48 c2             	cmovs  %edx,%eax
c0007a11:	c1 f8 03             	sar    $0x3,%eax
c0007a14:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007a17:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007a1a:	8d 50 07             	lea    0x7(%eax),%edx
c0007a1d:	85 c0                	test   %eax,%eax
c0007a1f:	0f 48 c2             	cmovs  %edx,%eax
c0007a22:	c1 f8 03             	sar    $0x3,%eax
c0007a25:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007a28:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a2b:	a3 d4 16 01 c0       	mov    %eax,0xc00116d4
c0007a30:	a1 d4 16 01 c0       	mov    0xc00116d4,%eax
c0007a35:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007a38:	c1 e2 0c             	shl    $0xc,%edx
c0007a3b:	01 d0                	add    %edx,%eax
c0007a3d:	a3 1c 1f 01 c0       	mov    %eax,0xc0011f1c
c0007a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a45:	a3 cc 16 01 c0       	mov    %eax,0xc00116cc
c0007a4a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a4d:	a3 d0 16 01 c0       	mov    %eax,0xc00116d0
c0007a52:	a1 cc 16 01 c0       	mov    0xc00116cc,%eax
c0007a57:	83 ec 04             	sub    $0x4,%esp
c0007a5a:	ff 75 d8             	pushl  -0x28(%ebp)
c0007a5d:	6a 00                	push   $0x0
c0007a5f:	50                   	push   %eax
c0007a60:	e8 62 48 00 00       	call   c000c2c7 <Memset>
c0007a65:	83 c4 10             	add    $0x10,%esp
c0007a68:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007a6b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a6e:	01 d0                	add    %edx,%eax
c0007a70:	a3 14 1f 01 c0       	mov    %eax,0xc0011f14
c0007a75:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007a78:	a3 18 1f 01 c0       	mov    %eax,0xc0011f18
c0007a7d:	a1 14 1f 01 c0       	mov    0xc0011f14,%eax
c0007a82:	83 ec 04             	sub    $0x4,%esp
c0007a85:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007a88:	6a 00                	push   $0x0
c0007a8a:	50                   	push   %eax
c0007a8b:	e8 37 48 00 00       	call   c000c2c7 <Memset>
c0007a90:	83 c4 10             	add    $0x10,%esp
c0007a93:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a96:	a3 b8 07 01 c0       	mov    %eax,0xc00107b8
c0007a9b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007a9e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007aa1:	01 c2                	add    %eax,%edx
c0007aa3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007aa6:	01 d0                	add    %edx,%eax
c0007aa8:	a3 b4 07 01 c0       	mov    %eax,0xc00107b4
c0007aad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007ab0:	05 00 00 10 00       	add    $0x100000,%eax
c0007ab5:	a3 bc 07 01 c0       	mov    %eax,0xc00107bc
c0007aba:	a1 b4 07 01 c0       	mov    0xc00107b4,%eax
c0007abf:	83 ec 04             	sub    $0x4,%esp
c0007ac2:	ff 75 d8             	pushl  -0x28(%ebp)
c0007ac5:	6a 00                	push   $0x0
c0007ac7:	50                   	push   %eax
c0007ac8:	e8 fa 47 00 00       	call   c000c2c7 <Memset>
c0007acd:	83 c4 10             	add    $0x10,%esp
c0007ad0:	83 ec 04             	sub    $0x4,%esp
c0007ad3:	68 f0 00 00 00       	push   $0xf0
c0007ad8:	6a 00                	push   $0x0
c0007ada:	68 c0 47 08 c0       	push   $0xc00847c0
c0007adf:	e8 e3 47 00 00       	call   c000c2c7 <Memset>
c0007ae4:	83 c4 10             	add    $0x10,%esp
c0007ae7:	83 ec 0c             	sub    $0xc,%esp
c0007aea:	68 c0 47 08 c0       	push   $0xc00847c0
c0007aef:	e8 75 fb ff ff       	call   c0007669 <init_memory_block_desc>
c0007af4:	83 c4 10             	add    $0x10,%esp
c0007af7:	90                   	nop
c0007af8:	c9                   	leave  
c0007af9:	c3                   	ret    

c0007afa <intr_enable>:
c0007afa:	55                   	push   %ebp
c0007afb:	89 e5                	mov    %esp,%ebp
c0007afd:	83 ec 18             	sub    $0x18,%esp
c0007b00:	e8 65 00 00 00       	call   c0007b6a <intr_get_status>
c0007b05:	83 f8 01             	cmp    $0x1,%eax
c0007b08:	75 0c                	jne    c0007b16 <intr_enable+0x1c>
c0007b0a:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b14:	eb 0b                	jmp    c0007b21 <intr_enable+0x27>
c0007b16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b1d:	fb                   	sti    
c0007b1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b21:	c9                   	leave  
c0007b22:	c3                   	ret    

c0007b23 <intr_disable>:
c0007b23:	55                   	push   %ebp
c0007b24:	89 e5                	mov    %esp,%ebp
c0007b26:	83 ec 18             	sub    $0x18,%esp
c0007b29:	e8 3c 00 00 00       	call   c0007b6a <intr_get_status>
c0007b2e:	83 f8 01             	cmp    $0x1,%eax
c0007b31:	75 0d                	jne    c0007b40 <intr_disable+0x1d>
c0007b33:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b3a:	fa                   	cli    
c0007b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b3e:	eb 0a                	jmp    c0007b4a <intr_disable+0x27>
c0007b40:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b4a:	c9                   	leave  
c0007b4b:	c3                   	ret    

c0007b4c <intr_set_status>:
c0007b4c:	55                   	push   %ebp
c0007b4d:	89 e5                	mov    %esp,%ebp
c0007b4f:	83 ec 08             	sub    $0x8,%esp
c0007b52:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b55:	83 e0 01             	and    $0x1,%eax
c0007b58:	85 c0                	test   %eax,%eax
c0007b5a:	74 07                	je     c0007b63 <intr_set_status+0x17>
c0007b5c:	e8 99 ff ff ff       	call   c0007afa <intr_enable>
c0007b61:	eb 05                	jmp    c0007b68 <intr_set_status+0x1c>
c0007b63:	e8 bb ff ff ff       	call   c0007b23 <intr_disable>
c0007b68:	c9                   	leave  
c0007b69:	c3                   	ret    

c0007b6a <intr_get_status>:
c0007b6a:	55                   	push   %ebp
c0007b6b:	89 e5                	mov    %esp,%ebp
c0007b6d:	83 ec 10             	sub    $0x10,%esp
c0007b70:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007b77:	9c                   	pushf  
c0007b78:	58                   	pop    %eax
c0007b79:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007b7c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007b7f:	c1 e8 09             	shr    $0x9,%eax
c0007b82:	83 e0 01             	and    $0x1,%eax
c0007b85:	c9                   	leave  
c0007b86:	c3                   	ret    

c0007b87 <Memcpy>:
c0007b87:	55                   	push   %ebp
c0007b88:	89 e5                	mov    %esp,%ebp
c0007b8a:	83 ec 18             	sub    $0x18,%esp
c0007b8d:	e8 91 ff ff ff       	call   c0007b23 <intr_disable>
c0007b92:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007b95:	83 ec 04             	sub    $0x4,%esp
c0007b98:	ff 75 10             	pushl  0x10(%ebp)
c0007b9b:	ff 75 0c             	pushl  0xc(%ebp)
c0007b9e:	ff 75 08             	pushl  0x8(%ebp)
c0007ba1:	e8 f3 46 00 00       	call   c000c299 <Memcpy2>
c0007ba6:	83 c4 10             	add    $0x10,%esp
c0007ba9:	83 ec 0c             	sub    $0xc,%esp
c0007bac:	ff 75 f4             	pushl  -0xc(%ebp)
c0007baf:	e8 98 ff ff ff       	call   c0007b4c <intr_set_status>
c0007bb4:	83 c4 10             	add    $0x10,%esp
c0007bb7:	90                   	nop
c0007bb8:	c9                   	leave  
c0007bb9:	c3                   	ret    

c0007bba <untar>:
c0007bba:	55                   	push   %ebp
c0007bbb:	89 e5                	mov    %esp,%ebp
c0007bbd:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0007bc3:	83 ec 08             	sub    $0x8,%esp
c0007bc6:	6a 00                	push   $0x0
c0007bc8:	ff 75 08             	pushl  0x8(%ebp)
c0007bcb:	e8 ee de ff ff       	call   c0005abe <open>
c0007bd0:	83 c4 10             	add    $0x10,%esp
c0007bd3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007bd6:	83 ec 0c             	sub    $0xc,%esp
c0007bd9:	68 c0 b9 00 c0       	push   $0xc000b9c0
c0007bde:	e8 fe 1b 00 00       	call   c00097e1 <Printf>
c0007be3:	83 c4 10             	add    $0x10,%esp
c0007be6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007bed:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0007bf4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007bfb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007c02:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007c09:	e9 5e 02 00 00       	jmp    c0007e6c <untar+0x2b2>
c0007c0e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007c12:	7e 58                	jle    c0007c6c <untar+0xb2>
c0007c14:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c17:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007c1c:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007c22:	85 c0                	test   %eax,%eax
c0007c24:	0f 48 c2             	cmovs  %edx,%eax
c0007c27:	c1 f8 09             	sar    $0x9,%eax
c0007c2a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007c2d:	83 ec 04             	sub    $0x4,%esp
c0007c30:	68 00 02 00 00       	push   $0x200
c0007c35:	6a 00                	push   $0x0
c0007c37:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c3d:	50                   	push   %eax
c0007c3e:	e8 84 46 00 00       	call   c000c2c7 <Memset>
c0007c43:	83 c4 10             	add    $0x10,%esp
c0007c46:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007c49:	c1 e0 09             	shl    $0x9,%eax
c0007c4c:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007c4f:	83 ec 04             	sub    $0x4,%esp
c0007c52:	50                   	push   %eax
c0007c53:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c59:	50                   	push   %eax
c0007c5a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c5d:	e8 f1 de ff ff       	call   c0005b53 <read>
c0007c62:	83 c4 10             	add    $0x10,%esp
c0007c65:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c6c:	83 ec 04             	sub    $0x4,%esp
c0007c6f:	68 00 02 00 00       	push   $0x200
c0007c74:	6a 00                	push   $0x0
c0007c76:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c7c:	50                   	push   %eax
c0007c7d:	e8 45 46 00 00       	call   c000c2c7 <Memset>
c0007c82:	83 c4 10             	add    $0x10,%esp
c0007c85:	83 ec 04             	sub    $0x4,%esp
c0007c88:	68 00 02 00 00       	push   $0x200
c0007c8d:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c93:	50                   	push   %eax
c0007c94:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c97:	e8 b7 de ff ff       	call   c0005b53 <read>
c0007c9c:	83 c4 10             	add    $0x10,%esp
c0007c9f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007ca2:	83 ec 0c             	sub    $0xc,%esp
c0007ca5:	68 d2 b9 00 c0       	push   $0xc000b9d2
c0007caa:	e8 32 1b 00 00       	call   c00097e1 <Printf>
c0007caf:	83 c4 10             	add    $0x10,%esp
c0007cb2:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007cb6:	0f 84 bc 01 00 00    	je     c0007e78 <untar+0x2be>
c0007cbc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007cbf:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007cc2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007cc9:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007ccf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007cd2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007cd5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007cd8:	83 ec 08             	sub    $0x8,%esp
c0007cdb:	6a 07                	push   $0x7
c0007cdd:	ff 75 cc             	pushl  -0x34(%ebp)
c0007ce0:	e8 d9 dd ff ff       	call   c0005abe <open>
c0007ce5:	83 c4 10             	add    $0x10,%esp
c0007ce8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007ceb:	83 ec 0c             	sub    $0xc,%esp
c0007cee:	68 e4 b9 00 c0       	push   $0xc000b9e4
c0007cf3:	e8 e9 1a 00 00       	call   c00097e1 <Printf>
c0007cf8:	83 c4 10             	add    $0x10,%esp
c0007cfb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007d02:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007d05:	83 c0 7c             	add    $0x7c,%eax
c0007d08:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007d0b:	83 ec 0c             	sub    $0xc,%esp
c0007d0e:	ff 75 cc             	pushl  -0x34(%ebp)
c0007d11:	e8 ea 45 00 00       	call   c000c300 <Strlen>
c0007d16:	83 c4 10             	add    $0x10,%esp
c0007d19:	85 c0                	test   %eax,%eax
c0007d1b:	75 28                	jne    c0007d45 <untar+0x18b>
c0007d1d:	83 ec 0c             	sub    $0xc,%esp
c0007d20:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007d23:	e8 d8 45 00 00       	call   c000c300 <Strlen>
c0007d28:	83 c4 10             	add    $0x10,%esp
c0007d2b:	85 c0                	test   %eax,%eax
c0007d2d:	75 16                	jne    c0007d45 <untar+0x18b>
c0007d2f:	83 ec 0c             	sub    $0xc,%esp
c0007d32:	68 f6 b9 00 c0       	push   $0xc000b9f6
c0007d37:	e8 a5 1a 00 00       	call   c00097e1 <Printf>
c0007d3c:	83 c4 10             	add    $0x10,%esp
c0007d3f:	90                   	nop
c0007d40:	e9 34 01 00 00       	jmp    c0007e79 <untar+0x2bf>
c0007d45:	83 ec 0c             	sub    $0xc,%esp
c0007d48:	68 fd b9 00 c0       	push   $0xc000b9fd
c0007d4d:	e8 8f 1a 00 00       	call   c00097e1 <Printf>
c0007d52:	83 c4 10             	add    $0x10,%esp
c0007d55:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007d58:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007d5b:	eb 1f                	jmp    c0007d7c <untar+0x1c2>
c0007d5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d60:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007d67:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007d6a:	0f b6 00             	movzbl (%eax),%eax
c0007d6d:	0f be c0             	movsbl %al,%eax
c0007d70:	83 e8 30             	sub    $0x30,%eax
c0007d73:	01 d0                	add    %edx,%eax
c0007d75:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007d78:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007d7c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007d7f:	0f b6 00             	movzbl (%eax),%eax
c0007d82:	84 c0                	test   %al,%al
c0007d84:	75 d7                	jne    c0007d5d <untar+0x1a3>
c0007d86:	83 ec 0c             	sub    $0xc,%esp
c0007d89:	68 0b ba 00 c0       	push   $0xc000ba0b
c0007d8e:	e8 4e 1a 00 00       	call   c00097e1 <Printf>
c0007d93:	83 c4 10             	add    $0x10,%esp
c0007d96:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d99:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007d9c:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0007da3:	83 ec 08             	sub    $0x8,%esp
c0007da6:	ff 75 c0             	pushl  -0x40(%ebp)
c0007da9:	68 19 ba 00 c0       	push   $0xc000ba19
c0007dae:	e8 2e 1a 00 00       	call   c00097e1 <Printf>
c0007db3:	83 c4 10             	add    $0x10,%esp
c0007db6:	83 ec 08             	sub    $0x8,%esp
c0007db9:	ff 75 c0             	pushl  -0x40(%ebp)
c0007dbc:	68 2b ba 00 c0       	push   $0xc000ba2b
c0007dc1:	e8 1b 1a 00 00       	call   c00097e1 <Printf>
c0007dc6:	83 c4 10             	add    $0x10,%esp
c0007dc9:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007dcc:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0007dcf:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0007dd3:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007dd6:	83 ec 04             	sub    $0x4,%esp
c0007dd9:	ff 75 b8             	pushl  -0x48(%ebp)
c0007ddc:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007de2:	50                   	push   %eax
c0007de3:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007de6:	e8 68 dd ff ff       	call   c0005b53 <read>
c0007deb:	83 c4 10             	add    $0x10,%esp
c0007dee:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007df1:	83 ec 04             	sub    $0x4,%esp
c0007df4:	ff 75 b8             	pushl  -0x48(%ebp)
c0007df7:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007dfd:	50                   	push   %eax
c0007dfe:	ff 75 c8             	pushl  -0x38(%ebp)
c0007e01:	e8 ce de ff ff       	call   c0005cd4 <write>
c0007e06:	83 c4 10             	add    $0x10,%esp
c0007e09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007e0c:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0007e0f:	7d 02                	jge    c0007e13 <untar+0x259>
c0007e11:	eb c3                	jmp    c0007dd6 <untar+0x21c>
c0007e13:	90                   	nop
c0007e14:	83 ec 08             	sub    $0x8,%esp
c0007e17:	ff 75 f4             	pushl  -0xc(%ebp)
c0007e1a:	68 3d ba 00 c0       	push   $0xc000ba3d
c0007e1f:	e8 bd 19 00 00       	call   c00097e1 <Printf>
c0007e24:	83 c4 10             	add    $0x10,%esp
c0007e27:	83 ec 08             	sub    $0x8,%esp
c0007e2a:	ff 75 c0             	pushl  -0x40(%ebp)
c0007e2d:	68 4f ba 00 c0       	push   $0xc000ba4f
c0007e32:	e8 aa 19 00 00       	call   c00097e1 <Printf>
c0007e37:	83 c4 10             	add    $0x10,%esp
c0007e3a:	83 ec 0c             	sub    $0xc,%esp
c0007e3d:	68 60 ba 00 c0       	push   $0xc000ba60
c0007e42:	e8 9a 19 00 00       	call   c00097e1 <Printf>
c0007e47:	83 c4 10             	add    $0x10,%esp
c0007e4a:	83 ec 0c             	sub    $0xc,%esp
c0007e4d:	ff 75 c8             	pushl  -0x38(%ebp)
c0007e50:	e8 04 df ff ff       	call   c0005d59 <close>
c0007e55:	83 c4 10             	add    $0x10,%esp
c0007e58:	83 ec 0c             	sub    $0xc,%esp
c0007e5b:	68 6e ba 00 c0       	push   $0xc000ba6e
c0007e60:	e8 7c 19 00 00       	call   c00097e1 <Printf>
c0007e65:	83 c4 10             	add    $0x10,%esp
c0007e68:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007e6c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007e70:	0f 8f 98 fd ff ff    	jg     c0007c0e <untar+0x54>
c0007e76:	eb 01                	jmp    c0007e79 <untar+0x2bf>
c0007e78:	90                   	nop
c0007e79:	83 ec 0c             	sub    $0xc,%esp
c0007e7c:	68 7b ba 00 c0       	push   $0xc000ba7b
c0007e81:	e8 5b 19 00 00       	call   c00097e1 <Printf>
c0007e86:	83 c4 10             	add    $0x10,%esp
c0007e89:	83 ec 0c             	sub    $0xc,%esp
c0007e8c:	68 8d ba 00 c0       	push   $0xc000ba8d
c0007e91:	e8 4b 19 00 00       	call   c00097e1 <Printf>
c0007e96:	83 c4 10             	add    $0x10,%esp
c0007e99:	83 ec 0c             	sub    $0xc,%esp
c0007e9c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007e9f:	e8 b5 de ff ff       	call   c0005d59 <close>
c0007ea4:	83 c4 10             	add    $0x10,%esp
c0007ea7:	83 ec 0c             	sub    $0xc,%esp
c0007eaa:	68 9d ba 00 c0       	push   $0xc000ba9d
c0007eaf:	e8 2d 19 00 00       	call   c00097e1 <Printf>
c0007eb4:	83 c4 10             	add    $0x10,%esp
c0007eb7:	83 ec 0c             	sub    $0xc,%esp
c0007eba:	68 b0 ba 00 c0       	push   $0xc000bab0
c0007ebf:	e8 1d 19 00 00       	call   c00097e1 <Printf>
c0007ec4:	83 c4 10             	add    $0x10,%esp
c0007ec7:	90                   	nop
c0007ec8:	c9                   	leave  
c0007ec9:	c3                   	ret    

c0007eca <atoi>:
c0007eca:	55                   	push   %ebp
c0007ecb:	89 e5                	mov    %esp,%ebp
c0007ecd:	83 ec 10             	sub    $0x10,%esp
c0007ed0:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ed3:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007ed6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ed9:	8d 50 01             	lea    0x1(%eax),%edx
c0007edc:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007edf:	c6 00 30             	movb   $0x30,(%eax)
c0007ee2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ee5:	8d 50 01             	lea    0x1(%eax),%edx
c0007ee8:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007eeb:	c6 00 78             	movb   $0x78,(%eax)
c0007eee:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007ef2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007ef6:	75 0e                	jne    c0007f06 <atoi+0x3c>
c0007ef8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007efb:	8d 50 01             	lea    0x1(%eax),%edx
c0007efe:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007f01:	c6 00 30             	movb   $0x30,(%eax)
c0007f04:	eb 61                	jmp    c0007f67 <atoi+0x9d>
c0007f06:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007f0d:	eb 52                	jmp    c0007f61 <atoi+0x97>
c0007f0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007f12:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007f15:	89 c1                	mov    %eax,%ecx
c0007f17:	d3 fa                	sar    %cl,%edx
c0007f19:	89 d0                	mov    %edx,%eax
c0007f1b:	83 e0 0f             	and    $0xf,%eax
c0007f1e:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f21:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007f25:	75 06                	jne    c0007f2d <atoi+0x63>
c0007f27:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007f2b:	74 2f                	je     c0007f5c <atoi+0x92>
c0007f2d:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007f31:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007f35:	83 c0 30             	add    $0x30,%eax
c0007f38:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f3b:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007f3f:	7e 0a                	jle    c0007f4b <atoi+0x81>
c0007f41:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007f45:	83 c0 07             	add    $0x7,%eax
c0007f48:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007f4e:	8d 50 01             	lea    0x1(%eax),%edx
c0007f51:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007f54:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007f58:	88 10                	mov    %dl,(%eax)
c0007f5a:	eb 01                	jmp    c0007f5d <atoi+0x93>
c0007f5c:	90                   	nop
c0007f5d:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007f61:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007f65:	79 a8                	jns    c0007f0f <atoi+0x45>
c0007f67:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007f6a:	c6 00 00             	movb   $0x0,(%eax)
c0007f6d:	90                   	nop
c0007f6e:	c9                   	leave  
c0007f6f:	c3                   	ret    

c0007f70 <disp_int>:
c0007f70:	55                   	push   %ebp
c0007f71:	89 e5                	mov    %esp,%ebp
c0007f73:	83 ec 18             	sub    $0x18,%esp
c0007f76:	ff 75 08             	pushl  0x8(%ebp)
c0007f79:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f7c:	50                   	push   %eax
c0007f7d:	e8 48 ff ff ff       	call   c0007eca <atoi>
c0007f82:	83 c4 08             	add    $0x8,%esp
c0007f85:	83 ec 08             	sub    $0x8,%esp
c0007f88:	6a 0b                	push   $0xb
c0007f8a:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f8d:	50                   	push   %eax
c0007f8e:	e8 34 92 ff ff       	call   c00011c7 <disp_str_colour>
c0007f93:	83 c4 10             	add    $0x10,%esp
c0007f96:	90                   	nop
c0007f97:	c9                   	leave  
c0007f98:	c3                   	ret    

c0007f99 <do_page_fault>:
c0007f99:	55                   	push   %ebp
c0007f9a:	89 e5                	mov    %esp,%ebp
c0007f9c:	83 ec 28             	sub    $0x28,%esp
c0007f9f:	0f 20 d0             	mov    %cr2,%eax
c0007fa2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007fa5:	c7 05 c0 07 01 c0 00 	movl   $0x0,0xc00107c0
c0007fac:	00 00 00 
c0007faf:	83 ec 0c             	sub    $0xc,%esp
c0007fb2:	68 bb ba 00 c0       	push   $0xc000babb
c0007fb7:	e8 d0 91 ff ff       	call   c000118c <disp_str>
c0007fbc:	83 c4 10             	add    $0x10,%esp
c0007fbf:	83 ec 0c             	sub    $0xc,%esp
c0007fc2:	68 ca ba 00 c0       	push   $0xc000baca
c0007fc7:	e8 c0 91 ff ff       	call   c000118c <disp_str>
c0007fcc:	83 c4 10             	add    $0x10,%esp
c0007fcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007fd2:	83 ec 0c             	sub    $0xc,%esp
c0007fd5:	50                   	push   %eax
c0007fd6:	e8 95 ff ff ff       	call   c0007f70 <disp_int>
c0007fdb:	83 c4 10             	add    $0x10,%esp
c0007fde:	83 ec 0c             	sub    $0xc,%esp
c0007fe1:	68 cf ba 00 c0       	push   $0xc000bacf
c0007fe6:	e8 a1 91 ff ff       	call   c000118c <disp_str>
c0007feb:	83 c4 10             	add    $0x10,%esp
c0007fee:	83 ec 0c             	sub    $0xc,%esp
c0007ff1:	ff 75 f4             	pushl  -0xc(%ebp)
c0007ff4:	e8 87 ed ff ff       	call   c0006d80 <ptr_pde>
c0007ff9:	83 c4 10             	add    $0x10,%esp
c0007ffc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007fff:	83 ec 0c             	sub    $0xc,%esp
c0008002:	ff 75 f4             	pushl  -0xc(%ebp)
c0008005:	e8 89 ed ff ff       	call   c0006d93 <ptr_pte>
c000800a:	83 c4 10             	add    $0x10,%esp
c000800d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008010:	83 ec 0c             	sub    $0xc,%esp
c0008013:	68 d1 ba 00 c0       	push   $0xc000bad1
c0008018:	e8 6f 91 ff ff       	call   c000118c <disp_str>
c000801d:	83 c4 10             	add    $0x10,%esp
c0008020:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008023:	83 ec 0c             	sub    $0xc,%esp
c0008026:	50                   	push   %eax
c0008027:	e8 44 ff ff ff       	call   c0007f70 <disp_int>
c000802c:	83 c4 10             	add    $0x10,%esp
c000802f:	83 ec 0c             	sub    $0xc,%esp
c0008032:	68 d6 ba 00 c0       	push   $0xc000bad6
c0008037:	e8 50 91 ff ff       	call   c000118c <disp_str>
c000803c:	83 c4 10             	add    $0x10,%esp
c000803f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008042:	8b 00                	mov    (%eax),%eax
c0008044:	83 ec 0c             	sub    $0xc,%esp
c0008047:	50                   	push   %eax
c0008048:	e8 23 ff ff ff       	call   c0007f70 <disp_int>
c000804d:	83 c4 10             	add    $0x10,%esp
c0008050:	83 ec 0c             	sub    $0xc,%esp
c0008053:	68 cf ba 00 c0       	push   $0xc000bacf
c0008058:	e8 2f 91 ff ff       	call   c000118c <disp_str>
c000805d:	83 c4 10             	add    $0x10,%esp
c0008060:	83 ec 0c             	sub    $0xc,%esp
c0008063:	68 df ba 00 c0       	push   $0xc000badf
c0008068:	e8 1f 91 ff ff       	call   c000118c <disp_str>
c000806d:	83 c4 10             	add    $0x10,%esp
c0008070:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008073:	83 ec 0c             	sub    $0xc,%esp
c0008076:	50                   	push   %eax
c0008077:	e8 f4 fe ff ff       	call   c0007f70 <disp_int>
c000807c:	83 c4 10             	add    $0x10,%esp
c000807f:	83 ec 0c             	sub    $0xc,%esp
c0008082:	68 e4 ba 00 c0       	push   $0xc000bae4
c0008087:	e8 00 91 ff ff       	call   c000118c <disp_str>
c000808c:	83 c4 10             	add    $0x10,%esp
c000808f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008092:	8b 00                	mov    (%eax),%eax
c0008094:	83 ec 0c             	sub    $0xc,%esp
c0008097:	50                   	push   %eax
c0008098:	e8 d3 fe ff ff       	call   c0007f70 <disp_int>
c000809d:	83 c4 10             	add    $0x10,%esp
c00080a0:	83 ec 0c             	sub    $0xc,%esp
c00080a3:	68 cf ba 00 c0       	push   $0xc000bacf
c00080a8:	e8 df 90 ff ff       	call   c000118c <disp_str>
c00080ad:	83 c4 10             	add    $0x10,%esp
c00080b0:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c00080b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00080ba:	8b 00                	mov    (%eax),%eax
c00080bc:	83 e0 01             	and    $0x1,%eax
c00080bf:	85 c0                	test   %eax,%eax
c00080c1:	74 09                	je     c00080cc <do_page_fault+0x133>
c00080c3:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c00080ca:	eb 07                	jmp    c00080d3 <do_page_fault+0x13a>
c00080cc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00080d3:	90                   	nop
c00080d4:	c9                   	leave  
c00080d5:	c3                   	ret    

c00080d6 <exception_handler>:
c00080d6:	55                   	push   %ebp
c00080d7:	89 e5                	mov    %esp,%ebp
c00080d9:	57                   	push   %edi
c00080da:	56                   	push   %esi
c00080db:	53                   	push   %ebx
c00080dc:	83 ec 6c             	sub    $0x6c,%esp
c00080df:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00080e2:	bb 60 bd 00 c0       	mov    $0xc000bd60,%ebx
c00080e7:	ba 13 00 00 00       	mov    $0x13,%edx
c00080ec:	89 c7                	mov    %eax,%edi
c00080ee:	89 de                	mov    %ebx,%esi
c00080f0:	89 d1                	mov    %edx,%ecx
c00080f2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00080f4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00080fb:	eb 04                	jmp    c0008101 <exception_handler+0x2b>
c00080fd:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008101:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008108:	7e f3                	jle    c00080fd <exception_handler+0x27>
c000810a:	c7 05 c0 07 01 c0 00 	movl   $0x0,0xc00107c0
c0008111:	00 00 00 
c0008114:	83 ec 0c             	sub    $0xc,%esp
c0008117:	68 ed ba 00 c0       	push   $0xc000baed
c000811c:	e8 6b 90 ff ff       	call   c000118c <disp_str>
c0008121:	83 c4 10             	add    $0x10,%esp
c0008124:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c000812b:	8b 45 08             	mov    0x8(%ebp),%eax
c000812e:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0008132:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008135:	83 ec 0c             	sub    $0xc,%esp
c0008138:	ff 75 dc             	pushl  -0x24(%ebp)
c000813b:	e8 4c 90 ff ff       	call   c000118c <disp_str>
c0008140:	83 c4 10             	add    $0x10,%esp
c0008143:	83 ec 0c             	sub    $0xc,%esp
c0008146:	68 fb ba 00 c0       	push   $0xc000bafb
c000814b:	e8 3c 90 ff ff       	call   c000118c <disp_str>
c0008150:	83 c4 10             	add    $0x10,%esp
c0008153:	83 ec 0c             	sub    $0xc,%esp
c0008156:	68 fe ba 00 c0       	push   $0xc000bafe
c000815b:	e8 2c 90 ff ff       	call   c000118c <disp_str>
c0008160:	83 c4 10             	add    $0x10,%esp
c0008163:	8b 45 08             	mov    0x8(%ebp),%eax
c0008166:	83 ec 0c             	sub    $0xc,%esp
c0008169:	50                   	push   %eax
c000816a:	e8 01 fe ff ff       	call   c0007f70 <disp_int>
c000816f:	83 c4 10             	add    $0x10,%esp
c0008172:	83 ec 0c             	sub    $0xc,%esp
c0008175:	68 fb ba 00 c0       	push   $0xc000bafb
c000817a:	e8 0d 90 ff ff       	call   c000118c <disp_str>
c000817f:	83 c4 10             	add    $0x10,%esp
c0008182:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008186:	74 2f                	je     c00081b7 <exception_handler+0xe1>
c0008188:	83 ec 0c             	sub    $0xc,%esp
c000818b:	68 06 bb 00 c0       	push   $0xc000bb06
c0008190:	e8 f7 8f ff ff       	call   c000118c <disp_str>
c0008195:	83 c4 10             	add    $0x10,%esp
c0008198:	8b 45 0c             	mov    0xc(%ebp),%eax
c000819b:	83 ec 0c             	sub    $0xc,%esp
c000819e:	50                   	push   %eax
c000819f:	e8 cc fd ff ff       	call   c0007f70 <disp_int>
c00081a4:	83 c4 10             	add    $0x10,%esp
c00081a7:	83 ec 0c             	sub    $0xc,%esp
c00081aa:	68 fb ba 00 c0       	push   $0xc000bafb
c00081af:	e8 d8 8f ff ff       	call   c000118c <disp_str>
c00081b4:	83 c4 10             	add    $0x10,%esp
c00081b7:	83 ec 0c             	sub    $0xc,%esp
c00081ba:	68 10 bb 00 c0       	push   $0xc000bb10
c00081bf:	e8 c8 8f ff ff       	call   c000118c <disp_str>
c00081c4:	83 c4 10             	add    $0x10,%esp
c00081c7:	83 ec 0c             	sub    $0xc,%esp
c00081ca:	ff 75 14             	pushl  0x14(%ebp)
c00081cd:	e8 9e fd ff ff       	call   c0007f70 <disp_int>
c00081d2:	83 c4 10             	add    $0x10,%esp
c00081d5:	83 ec 0c             	sub    $0xc,%esp
c00081d8:	68 fb ba 00 c0       	push   $0xc000bafb
c00081dd:	e8 aa 8f ff ff       	call   c000118c <disp_str>
c00081e2:	83 c4 10             	add    $0x10,%esp
c00081e5:	83 ec 0c             	sub    $0xc,%esp
c00081e8:	68 14 bb 00 c0       	push   $0xc000bb14
c00081ed:	e8 9a 8f ff ff       	call   c000118c <disp_str>
c00081f2:	83 c4 10             	add    $0x10,%esp
c00081f5:	8b 45 10             	mov    0x10(%ebp),%eax
c00081f8:	83 ec 0c             	sub    $0xc,%esp
c00081fb:	50                   	push   %eax
c00081fc:	e8 6f fd ff ff       	call   c0007f70 <disp_int>
c0008201:	83 c4 10             	add    $0x10,%esp
c0008204:	83 ec 0c             	sub    $0xc,%esp
c0008207:	68 fb ba 00 c0       	push   $0xc000bafb
c000820c:	e8 7b 8f ff ff       	call   c000118c <disp_str>
c0008211:	83 c4 10             	add    $0x10,%esp
c0008214:	83 ec 0c             	sub    $0xc,%esp
c0008217:	68 19 bb 00 c0       	push   $0xc000bb19
c000821c:	e8 6b 8f ff ff       	call   c000118c <disp_str>
c0008221:	83 c4 10             	add    $0x10,%esp
c0008224:	83 ec 0c             	sub    $0xc,%esp
c0008227:	ff 75 18             	pushl  0x18(%ebp)
c000822a:	e8 41 fd ff ff       	call   c0007f70 <disp_int>
c000822f:	83 c4 10             	add    $0x10,%esp
c0008232:	83 ec 0c             	sub    $0xc,%esp
c0008235:	68 fb ba 00 c0       	push   $0xc000bafb
c000823a:	e8 4d 8f ff ff       	call   c000118c <disp_str>
c000823f:	83 c4 10             	add    $0x10,%esp
c0008242:	83 ec 0c             	sub    $0xc,%esp
c0008245:	68 24 bb 00 c0       	push   $0xc000bb24
c000824a:	e8 3d 8f ff ff       	call   c000118c <disp_str>
c000824f:	83 c4 10             	add    $0x10,%esp
c0008252:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0008256:	75 45                	jne    c000829d <exception_handler+0x1c7>
c0008258:	0f 20 d0             	mov    %cr2,%eax
c000825b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000825e:	83 ec 0c             	sub    $0xc,%esp
c0008261:	68 43 bb 00 c0       	push   $0xc000bb43
c0008266:	e8 21 8f ff ff       	call   c000118c <disp_str>
c000826b:	83 c4 10             	add    $0x10,%esp
c000826e:	83 ec 0c             	sub    $0xc,%esp
c0008271:	68 ca ba 00 c0       	push   $0xc000baca
c0008276:	e8 11 8f ff ff       	call   c000118c <disp_str>
c000827b:	83 c4 10             	add    $0x10,%esp
c000827e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008281:	83 ec 0c             	sub    $0xc,%esp
c0008284:	50                   	push   %eax
c0008285:	e8 e6 fc ff ff       	call   c0007f70 <disp_int>
c000828a:	83 c4 10             	add    $0x10,%esp
c000828d:	83 ec 0c             	sub    $0xc,%esp
c0008290:	68 cf ba 00 c0       	push   $0xc000bacf
c0008295:	e8 f2 8e ff ff       	call   c000118c <disp_str>
c000829a:	83 c4 10             	add    $0x10,%esp
c000829d:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c00082a1:	75 11                	jne    c00082b4 <exception_handler+0x1de>
c00082a3:	83 ec 0c             	sub    $0xc,%esp
c00082a6:	68 4f bb 00 c0       	push   $0xc000bb4f
c00082ab:	e8 dc 8e ff ff       	call   c000118c <disp_str>
c00082b0:	83 c4 10             	add    $0x10,%esp
c00082b3:	90                   	nop
c00082b4:	90                   	nop
c00082b5:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00082b8:	5b                   	pop    %ebx
c00082b9:	5e                   	pop    %esi
c00082ba:	5f                   	pop    %edi
c00082bb:	5d                   	pop    %ebp
c00082bc:	c3                   	ret    

c00082bd <exception_handler2>:
c00082bd:	55                   	push   %ebp
c00082be:	89 e5                	mov    %esp,%ebp
c00082c0:	57                   	push   %edi
c00082c1:	56                   	push   %esi
c00082c2:	53                   	push   %ebx
c00082c3:	83 ec 6c             	sub    $0x6c,%esp
c00082c6:	8d 45 90             	lea    -0x70(%ebp),%eax
c00082c9:	bb 60 bd 00 c0       	mov    $0xc000bd60,%ebx
c00082ce:	ba 13 00 00 00       	mov    $0x13,%edx
c00082d3:	89 c7                	mov    %eax,%edi
c00082d5:	89 de                	mov    %ebx,%esi
c00082d7:	89 d1                	mov    %edx,%ecx
c00082d9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00082db:	c7 05 c0 07 01 c0 6a 	movl   $0x2e6a,0xc00107c0
c00082e2:	2e 00 00 
c00082e5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00082ec:	eb 14                	jmp    c0008302 <exception_handler2+0x45>
c00082ee:	83 ec 0c             	sub    $0xc,%esp
c00082f1:	68 ac bd 00 c0       	push   $0xc000bdac
c00082f6:	e8 91 8e ff ff       	call   c000118c <disp_str>
c00082fb:	83 c4 10             	add    $0x10,%esp
c00082fe:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008302:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008309:	7e e3                	jle    c00082ee <exception_handler2+0x31>
c000830b:	c7 05 c0 07 01 c0 6a 	movl   $0x2e6a,0xc00107c0
c0008312:	2e 00 00 
c0008315:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c000831c:	8b 45 08             	mov    0x8(%ebp),%eax
c000831f:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0008323:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008326:	83 ec 08             	sub    $0x8,%esp
c0008329:	ff 75 e0             	pushl  -0x20(%ebp)
c000832c:	ff 75 dc             	pushl  -0x24(%ebp)
c000832f:	e8 93 8e ff ff       	call   c00011c7 <disp_str_colour>
c0008334:	83 c4 10             	add    $0x10,%esp
c0008337:	83 ec 0c             	sub    $0xc,%esp
c000833a:	68 fb ba 00 c0       	push   $0xc000bafb
c000833f:	e8 48 8e ff ff       	call   c000118c <disp_str>
c0008344:	83 c4 10             	add    $0x10,%esp
c0008347:	83 ec 08             	sub    $0x8,%esp
c000834a:	ff 75 e0             	pushl  -0x20(%ebp)
c000834d:	68 fe ba 00 c0       	push   $0xc000bafe
c0008352:	e8 70 8e ff ff       	call   c00011c7 <disp_str_colour>
c0008357:	83 c4 10             	add    $0x10,%esp
c000835a:	83 ec 0c             	sub    $0xc,%esp
c000835d:	ff 75 08             	pushl  0x8(%ebp)
c0008360:	e8 0b fc ff ff       	call   c0007f70 <disp_int>
c0008365:	83 c4 10             	add    $0x10,%esp
c0008368:	83 ec 0c             	sub    $0xc,%esp
c000836b:	68 fb ba 00 c0       	push   $0xc000bafb
c0008370:	e8 17 8e ff ff       	call   c000118c <disp_str>
c0008375:	83 c4 10             	add    $0x10,%esp
c0008378:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c000837c:	74 44                	je     c00083c2 <exception_handler2+0x105>
c000837e:	83 ec 08             	sub    $0x8,%esp
c0008381:	ff 75 e0             	pushl  -0x20(%ebp)
c0008384:	68 06 bb 00 c0       	push   $0xc000bb06
c0008389:	e8 39 8e ff ff       	call   c00011c7 <disp_str_colour>
c000838e:	83 c4 10             	add    $0x10,%esp
c0008391:	83 ec 08             	sub    $0x8,%esp
c0008394:	ff 75 e0             	pushl  -0x20(%ebp)
c0008397:	68 06 bb 00 c0       	push   $0xc000bb06
c000839c:	e8 26 8e ff ff       	call   c00011c7 <disp_str_colour>
c00083a1:	83 c4 10             	add    $0x10,%esp
c00083a4:	83 ec 0c             	sub    $0xc,%esp
c00083a7:	ff 75 0c             	pushl  0xc(%ebp)
c00083aa:	e8 c1 fb ff ff       	call   c0007f70 <disp_int>
c00083af:	83 c4 10             	add    $0x10,%esp
c00083b2:	83 ec 0c             	sub    $0xc,%esp
c00083b5:	68 fb ba 00 c0       	push   $0xc000bafb
c00083ba:	e8 cd 8d ff ff       	call   c000118c <disp_str>
c00083bf:	83 c4 10             	add    $0x10,%esp
c00083c2:	83 ec 08             	sub    $0x8,%esp
c00083c5:	ff 75 e0             	pushl  -0x20(%ebp)
c00083c8:	68 10 bb 00 c0       	push   $0xc000bb10
c00083cd:	e8 f5 8d ff ff       	call   c00011c7 <disp_str_colour>
c00083d2:	83 c4 10             	add    $0x10,%esp
c00083d5:	83 ec 0c             	sub    $0xc,%esp
c00083d8:	ff 75 14             	pushl  0x14(%ebp)
c00083db:	e8 90 fb ff ff       	call   c0007f70 <disp_int>
c00083e0:	83 c4 10             	add    $0x10,%esp
c00083e3:	83 ec 0c             	sub    $0xc,%esp
c00083e6:	68 fb ba 00 c0       	push   $0xc000bafb
c00083eb:	e8 9c 8d ff ff       	call   c000118c <disp_str>
c00083f0:	83 c4 10             	add    $0x10,%esp
c00083f3:	83 ec 08             	sub    $0x8,%esp
c00083f6:	ff 75 e0             	pushl  -0x20(%ebp)
c00083f9:	68 14 bb 00 c0       	push   $0xc000bb14
c00083fe:	e8 c4 8d ff ff       	call   c00011c7 <disp_str_colour>
c0008403:	83 c4 10             	add    $0x10,%esp
c0008406:	83 ec 0c             	sub    $0xc,%esp
c0008409:	ff 75 10             	pushl  0x10(%ebp)
c000840c:	e8 5f fb ff ff       	call   c0007f70 <disp_int>
c0008411:	83 c4 10             	add    $0x10,%esp
c0008414:	83 ec 0c             	sub    $0xc,%esp
c0008417:	68 fb ba 00 c0       	push   $0xc000bafb
c000841c:	e8 6b 8d ff ff       	call   c000118c <disp_str>
c0008421:	83 c4 10             	add    $0x10,%esp
c0008424:	83 ec 08             	sub    $0x8,%esp
c0008427:	ff 75 e0             	pushl  -0x20(%ebp)
c000842a:	68 19 bb 00 c0       	push   $0xc000bb19
c000842f:	e8 93 8d ff ff       	call   c00011c7 <disp_str_colour>
c0008434:	83 c4 10             	add    $0x10,%esp
c0008437:	83 ec 0c             	sub    $0xc,%esp
c000843a:	ff 75 18             	pushl  0x18(%ebp)
c000843d:	e8 2e fb ff ff       	call   c0007f70 <disp_int>
c0008442:	83 c4 10             	add    $0x10,%esp
c0008445:	83 ec 0c             	sub    $0xc,%esp
c0008448:	68 fb ba 00 c0       	push   $0xc000bafb
c000844d:	e8 3a 8d ff ff       	call   c000118c <disp_str>
c0008452:	83 c4 10             	add    $0x10,%esp
c0008455:	90                   	nop
c0008456:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008459:	5b                   	pop    %ebx
c000845a:	5e                   	pop    %esi
c000845b:	5f                   	pop    %edi
c000845c:	5d                   	pop    %ebp
c000845d:	c3                   	ret    

c000845e <init_internal_interrupt>:
c000845e:	55                   	push   %ebp
c000845f:	89 e5                	mov    %esp,%ebp
c0008461:	83 ec 08             	sub    $0x8,%esp
c0008464:	6a 0e                	push   $0xe
c0008466:	6a 08                	push   $0x8
c0008468:	68 03 12 00 c0       	push   $0xc0001203
c000846d:	6a 00                	push   $0x0
c000846f:	e8 8a c6 ff ff       	call   c0004afe <InitInterruptDesc>
c0008474:	83 c4 10             	add    $0x10,%esp
c0008477:	6a 0e                	push   $0xe
c0008479:	6a 08                	push   $0x8
c000847b:	68 09 12 00 c0       	push   $0xc0001209
c0008480:	6a 01                	push   $0x1
c0008482:	e8 77 c6 ff ff       	call   c0004afe <InitInterruptDesc>
c0008487:	83 c4 10             	add    $0x10,%esp
c000848a:	6a 0e                	push   $0xe
c000848c:	6a 08                	push   $0x8
c000848e:	68 0f 12 00 c0       	push   $0xc000120f
c0008493:	6a 02                	push   $0x2
c0008495:	e8 64 c6 ff ff       	call   c0004afe <InitInterruptDesc>
c000849a:	83 c4 10             	add    $0x10,%esp
c000849d:	6a 0e                	push   $0xe
c000849f:	6a 08                	push   $0x8
c00084a1:	68 15 12 00 c0       	push   $0xc0001215
c00084a6:	6a 03                	push   $0x3
c00084a8:	e8 51 c6 ff ff       	call   c0004afe <InitInterruptDesc>
c00084ad:	83 c4 10             	add    $0x10,%esp
c00084b0:	6a 0e                	push   $0xe
c00084b2:	6a 08                	push   $0x8
c00084b4:	68 1b 12 00 c0       	push   $0xc000121b
c00084b9:	6a 04                	push   $0x4
c00084bb:	e8 3e c6 ff ff       	call   c0004afe <InitInterruptDesc>
c00084c0:	83 c4 10             	add    $0x10,%esp
c00084c3:	6a 0e                	push   $0xe
c00084c5:	6a 08                	push   $0x8
c00084c7:	68 21 12 00 c0       	push   $0xc0001221
c00084cc:	6a 05                	push   $0x5
c00084ce:	e8 2b c6 ff ff       	call   c0004afe <InitInterruptDesc>
c00084d3:	83 c4 10             	add    $0x10,%esp
c00084d6:	6a 0e                	push   $0xe
c00084d8:	6a 08                	push   $0x8
c00084da:	68 27 12 00 c0       	push   $0xc0001227
c00084df:	6a 06                	push   $0x6
c00084e1:	e8 18 c6 ff ff       	call   c0004afe <InitInterruptDesc>
c00084e6:	83 c4 10             	add    $0x10,%esp
c00084e9:	6a 0e                	push   $0xe
c00084eb:	6a 08                	push   $0x8
c00084ed:	68 2d 12 00 c0       	push   $0xc000122d
c00084f2:	6a 07                	push   $0x7
c00084f4:	e8 05 c6 ff ff       	call   c0004afe <InitInterruptDesc>
c00084f9:	83 c4 10             	add    $0x10,%esp
c00084fc:	6a 0e                	push   $0xe
c00084fe:	6a 08                	push   $0x8
c0008500:	68 33 12 00 c0       	push   $0xc0001233
c0008505:	6a 08                	push   $0x8
c0008507:	e8 f2 c5 ff ff       	call   c0004afe <InitInterruptDesc>
c000850c:	83 c4 10             	add    $0x10,%esp
c000850f:	6a 0e                	push   $0xe
c0008511:	6a 08                	push   $0x8
c0008513:	68 37 12 00 c0       	push   $0xc0001237
c0008518:	6a 09                	push   $0x9
c000851a:	e8 df c5 ff ff       	call   c0004afe <InitInterruptDesc>
c000851f:	83 c4 10             	add    $0x10,%esp
c0008522:	6a 0e                	push   $0xe
c0008524:	6a 08                	push   $0x8
c0008526:	68 3d 12 00 c0       	push   $0xc000123d
c000852b:	6a 0a                	push   $0xa
c000852d:	e8 cc c5 ff ff       	call   c0004afe <InitInterruptDesc>
c0008532:	83 c4 10             	add    $0x10,%esp
c0008535:	6a 0e                	push   $0xe
c0008537:	6a 08                	push   $0x8
c0008539:	68 41 12 00 c0       	push   $0xc0001241
c000853e:	6a 0b                	push   $0xb
c0008540:	e8 b9 c5 ff ff       	call   c0004afe <InitInterruptDesc>
c0008545:	83 c4 10             	add    $0x10,%esp
c0008548:	6a 0e                	push   $0xe
c000854a:	6a 08                	push   $0x8
c000854c:	68 45 12 00 c0       	push   $0xc0001245
c0008551:	6a 0c                	push   $0xc
c0008553:	e8 a6 c5 ff ff       	call   c0004afe <InitInterruptDesc>
c0008558:	83 c4 10             	add    $0x10,%esp
c000855b:	6a 0e                	push   $0xe
c000855d:	6a 08                	push   $0x8
c000855f:	68 49 12 00 c0       	push   $0xc0001249
c0008564:	6a 0d                	push   $0xd
c0008566:	e8 93 c5 ff ff       	call   c0004afe <InitInterruptDesc>
c000856b:	83 c4 10             	add    $0x10,%esp
c000856e:	6a 0e                	push   $0xe
c0008570:	6a 08                	push   $0x8
c0008572:	68 54 12 00 c0       	push   $0xc0001254
c0008577:	6a 0e                	push   $0xe
c0008579:	e8 80 c5 ff ff       	call   c0004afe <InitInterruptDesc>
c000857e:	83 c4 10             	add    $0x10,%esp
c0008581:	6a 0e                	push   $0xe
c0008583:	6a 08                	push   $0x8
c0008585:	68 58 12 00 c0       	push   $0xc0001258
c000858a:	6a 10                	push   $0x10
c000858c:	e8 6d c5 ff ff       	call   c0004afe <InitInterruptDesc>
c0008591:	83 c4 10             	add    $0x10,%esp
c0008594:	6a 0e                	push   $0xe
c0008596:	6a 08                	push   $0x8
c0008598:	68 5e 12 00 c0       	push   $0xc000125e
c000859d:	6a 11                	push   $0x11
c000859f:	e8 5a c5 ff ff       	call   c0004afe <InitInterruptDesc>
c00085a4:	83 c4 10             	add    $0x10,%esp
c00085a7:	6a 0e                	push   $0xe
c00085a9:	6a 08                	push   $0x8
c00085ab:	68 62 12 00 c0       	push   $0xc0001262
c00085b0:	6a 12                	push   $0x12
c00085b2:	e8 47 c5 ff ff       	call   c0004afe <InitInterruptDesc>
c00085b7:	83 c4 10             	add    $0x10,%esp
c00085ba:	6a 0e                	push   $0xe
c00085bc:	6a 0e                	push   $0xe
c00085be:	68 1e 13 00 c0       	push   $0xc000131e
c00085c3:	68 90 00 00 00       	push   $0x90
c00085c8:	e8 31 c5 ff ff       	call   c0004afe <InitInterruptDesc>
c00085cd:	83 c4 10             	add    $0x10,%esp
c00085d0:	90                   	nop
c00085d1:	c9                   	leave  
c00085d2:	c3                   	ret    

c00085d3 <test>:
c00085d3:	55                   	push   %ebp
c00085d4:	89 e5                	mov    %esp,%ebp
c00085d6:	83 ec 08             	sub    $0x8,%esp
c00085d9:	83 ec 0c             	sub    $0xc,%esp
c00085dc:	68 ae bd 00 c0       	push   $0xc000bdae
c00085e1:	e8 a6 8b ff ff       	call   c000118c <disp_str>
c00085e6:	83 c4 10             	add    $0x10,%esp
c00085e9:	83 ec 0c             	sub    $0xc,%esp
c00085ec:	68 cf ba 00 c0       	push   $0xc000bacf
c00085f1:	e8 96 8b ff ff       	call   c000118c <disp_str>
c00085f6:	83 c4 10             	add    $0x10,%esp
c00085f9:	90                   	nop
c00085fa:	c9                   	leave  
c00085fb:	c3                   	ret    

c00085fc <disp_str_colour3>:
c00085fc:	55                   	push   %ebp
c00085fd:	89 e5                	mov    %esp,%ebp
c00085ff:	90                   	nop
c0008600:	5d                   	pop    %ebp
c0008601:	c3                   	ret    

c0008602 <spurious_irq>:
c0008602:	55                   	push   %ebp
c0008603:	89 e5                	mov    %esp,%ebp
c0008605:	83 ec 08             	sub    $0x8,%esp
c0008608:	83 ec 08             	sub    $0x8,%esp
c000860b:	6a 0b                	push   $0xb
c000860d:	68 b0 bd 00 c0       	push   $0xc000bdb0
c0008612:	e8 b0 8b ff ff       	call   c00011c7 <disp_str_colour>
c0008617:	83 c4 10             	add    $0x10,%esp
c000861a:	83 ec 0c             	sub    $0xc,%esp
c000861d:	ff 75 08             	pushl  0x8(%ebp)
c0008620:	e8 4b f9 ff ff       	call   c0007f70 <disp_int>
c0008625:	83 c4 10             	add    $0x10,%esp
c0008628:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c000862d:	8b 15 0c 1f 01 c0    	mov    0xc0011f0c,%edx
c0008633:	83 c0 01             	add    $0x1,%eax
c0008636:	83 d2 00             	adc    $0x0,%edx
c0008639:	a3 08 1f 01 c0       	mov    %eax,0xc0011f08
c000863e:	89 15 0c 1f 01 c0    	mov    %edx,0xc0011f0c
c0008644:	83 ec 0c             	sub    $0xc,%esp
c0008647:	68 d7 bd 00 c0       	push   $0xc000bdd7
c000864c:	e8 3b 8b ff ff       	call   c000118c <disp_str>
c0008651:	83 c4 10             	add    $0x10,%esp
c0008654:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0008659:	8b 15 0c 1f 01 c0    	mov    0xc0011f0c,%edx
c000865f:	83 ec 0c             	sub    $0xc,%esp
c0008662:	50                   	push   %eax
c0008663:	e8 08 f9 ff ff       	call   c0007f70 <disp_int>
c0008668:	83 c4 10             	add    $0x10,%esp
c000866b:	83 ec 0c             	sub    $0xc,%esp
c000866e:	68 d9 bd 00 c0       	push   $0xc000bdd9
c0008673:	e8 14 8b ff ff       	call   c000118c <disp_str>
c0008678:	83 c4 10             	add    $0x10,%esp
c000867b:	83 ec 08             	sub    $0x8,%esp
c000867e:	6a 0c                	push   $0xc
c0008680:	68 dc bd 00 c0       	push   $0xc000bddc
c0008685:	e8 3d 8b ff ff       	call   c00011c7 <disp_str_colour>
c000868a:	83 c4 10             	add    $0x10,%esp
c000868d:	90                   	nop
c000868e:	c9                   	leave  
c000868f:	c3                   	ret    

c0008690 <init_keyboard>:
c0008690:	55                   	push   %ebp
c0008691:	89 e5                	mov    %esp,%ebp
c0008693:	83 ec 18             	sub    $0x18,%esp
c0008696:	83 ec 04             	sub    $0x4,%esp
c0008699:	68 00 02 00 00       	push   $0x200
c000869e:	6a 00                	push   $0x0
c00086a0:	68 0c 0c 01 c0       	push   $0xc0010c0c
c00086a5:	e8 1d 3c 00 00       	call   c000c2c7 <Memset>
c00086aa:	83 c4 10             	add    $0x10,%esp
c00086ad:	c7 05 00 0c 01 c0 0c 	movl   $0xc0010c0c,0xc0010c00
c00086b4:	0c 01 c0 
c00086b7:	a1 00 0c 01 c0       	mov    0xc0010c00,%eax
c00086bc:	a3 04 0c 01 c0       	mov    %eax,0xc0010c04
c00086c1:	c7 05 08 0c 01 c0 00 	movl   $0x0,0xc0010c08
c00086c8:	00 00 00 
c00086cb:	c7 05 c0 07 01 c0 00 	movl   $0x0,0xc00107c0
c00086d2:	00 00 00 
c00086d5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00086dc:	eb 04                	jmp    c00086e2 <init_keyboard+0x52>
c00086de:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00086e2:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00086e9:	7e f3                	jle    c00086de <init_keyboard+0x4e>
c00086eb:	c7 05 c0 07 01 c0 00 	movl   $0x0,0xc00107c0
c00086f2:	00 00 00 
c00086f5:	e8 1e d2 ff ff       	call   c0005918 <init_keyboard_handler>
c00086fa:	90                   	nop
c00086fb:	c9                   	leave  
c00086fc:	c3                   	ret    

c00086fd <u_thread_a>:
c00086fd:	55                   	push   %ebp
c00086fe:	89 e5                	mov    %esp,%ebp
c0008700:	83 ec 08             	sub    $0x8,%esp
c0008703:	83 ec 0c             	sub    $0xc,%esp
c0008706:	68 01 be 00 c0       	push   $0xc000be01
c000870b:	e8 7c 8a ff ff       	call   c000118c <disp_str>
c0008710:	83 c4 10             	add    $0x10,%esp
c0008713:	eb fe                	jmp    c0008713 <u_thread_a+0x16>

c0008715 <kernel_main2>:
c0008715:	55                   	push   %ebp
c0008716:	89 e5                	mov    %esp,%ebp
c0008718:	57                   	push   %edi
c0008719:	56                   	push   %esi
c000871a:	53                   	push   %ebx
c000871b:	83 ec 3c             	sub    $0x3c,%esp
c000871e:	83 ec 0c             	sub    $0xc,%esp
c0008721:	68 0f be 00 c0       	push   $0xc000be0f
c0008726:	e8 61 8a ff ff       	call   c000118c <disp_str>
c000872b:	83 c4 10             	add    $0x10,%esp
c000872e:	e8 4d 8e ff ff       	call   c0001580 <init>
c0008733:	c7 05 08 1f 01 c0 00 	movl   $0x0,0xc0011f08
c000873a:	00 00 00 
c000873d:	c7 05 0c 1f 01 c0 00 	movl   $0x0,0xc0011f0c
c0008744:	00 00 00 
c0008747:	c7 05 dc 16 01 c0 00 	movl   $0x0,0xc00116dc
c000874e:	00 00 00 
c0008751:	c7 05 c4 07 01 c0 00 	movl   $0x0,0xc00107c4
c0008758:	00 00 00 
c000875b:	c7 45 dc 20 32 08 c0 	movl   $0xc0083220,-0x24(%ebp)
c0008762:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008769:	e9 01 02 00 00       	jmp    c000896f <kernel_main2+0x25a>
c000876e:	83 ec 08             	sub    $0x8,%esp
c0008771:	6a 00                	push   $0x0
c0008773:	6a 01                	push   $0x1
c0008775:	e8 4e e9 ff ff       	call   c00070c8 <alloc_memory>
c000877a:	83 c4 10             	add    $0x10,%esp
c000877d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008780:	83 ec 04             	sub    $0x4,%esp
c0008783:	68 b4 02 00 00       	push   $0x2b4
c0008788:	6a 00                	push   $0x0
c000878a:	ff 75 d8             	pushl  -0x28(%ebp)
c000878d:	e8 35 3b 00 00       	call   c000c2c7 <Memset>
c0008792:	83 c4 10             	add    $0x10,%esp
c0008795:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008798:	05 00 10 00 00       	add    $0x1000,%eax
c000879d:	89 c2                	mov    %eax,%edx
c000879f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087a2:	89 10                	mov    %edx,(%eax)
c00087a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087a7:	66 c7 80 10 01 00 00 	movw   $0x0,0x110(%eax)
c00087ae:	00 00 
c00087b0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00087b3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087b6:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c00087bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087bf:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00087c6:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c00087ca:	7e 0f                	jle    c00087db <kernel_main2+0xc6>
c00087cc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087cf:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c00087d6:	e9 90 01 00 00       	jmp    c000896b <kernel_main2+0x256>
c00087db:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087de:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00087e5:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c00087e9:	7f 73                	jg     c000885e <kernel_main2+0x149>
c00087eb:	c7 45 e4 20 f0 00 c0 	movl   $0xc000f020,-0x1c(%ebp)
c00087f2:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c00087f9:	c7 45 d0 2c 00 00 00 	movl   $0x2c,-0x30(%ebp)
c0008800:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008803:	8b 00                	mov    (%eax),%eax
c0008805:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c0008808:	89 c2                	mov    %eax,%edx
c000880a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000880d:	89 10                	mov    %edx,(%eax)
c000880f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008812:	8b 00                	mov    (%eax),%eax
c0008814:	2b 45 d0             	sub    -0x30(%ebp),%eax
c0008817:	89 c2                	mov    %eax,%edx
c0008819:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000881c:	89 10                	mov    %edx,(%eax)
c000881e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008821:	8b 00                	mov    (%eax),%eax
c0008823:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008826:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008829:	8b 50 14             	mov    0x14(%eax),%edx
c000882c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000882f:	89 50 28             	mov    %edx,0x28(%eax)
c0008832:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008835:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000883b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000883e:	8b 10                	mov    (%eax),%edx
c0008840:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008843:	89 50 04             	mov    %edx,0x4(%eax)
c0008846:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008849:	8b 50 04             	mov    0x4(%eax),%edx
c000884c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000884f:	89 50 08             	mov    %edx,0x8(%eax)
c0008852:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008855:	8b 50 08             	mov    0x8(%eax),%edx
c0008858:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000885b:	89 50 0c             	mov    %edx,0xc(%eax)
c000885e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008861:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0008864:	81 c2 34 01 00 00    	add    $0x134,%edx
c000886a:	83 ec 08             	sub    $0x8,%esp
c000886d:	50                   	push   %eax
c000886e:	52                   	push   %edx
c000886f:	e8 72 3a 00 00       	call   c000c2e6 <Strcpy>
c0008874:	83 c4 10             	add    $0x10,%esp
c0008877:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c000887b:	83 c8 04             	or     $0x4,%eax
c000887e:	0f b6 c0             	movzbl %al,%eax
c0008881:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c0008885:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008889:	83 c8 0c             	or     $0xc,%eax
c000888c:	0f b6 c0             	movzbl %al,%eax
c000888f:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c0008893:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c0008897:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000889a:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00088a0:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088a7:	89 90 78 02 00 00    	mov    %edx,0x278(%eax)
c00088ad:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088b1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088b4:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c00088ba:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088be:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088c1:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c00088c7:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088cb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088ce:	89 90 ac 02 00 00    	mov    %edx,0x2ac(%eax)
c00088d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088d7:	c7 80 6c 02 00 00 39 	movl   $0x39,0x26c(%eax)
c00088de:	00 00 00 
c00088e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00088e4:	8b 50 14             	mov    0x14(%eax),%edx
c00088e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088ea:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c00088f0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088f3:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00088f6:	89 90 a4 02 00 00    	mov    %edx,0x2a4(%eax)
c00088fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088ff:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0008906:	00 00 00 
c0008909:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000890c:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0008913:	00 00 00 
c0008916:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008919:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0008920:	00 00 00 
c0008923:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008926:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000892d:	00 00 00 
c0008930:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008933:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000893a:	00 00 00 
c000893d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008940:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0008947:	00 00 00 
c000894a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000894d:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0008953:	8d 90 20 32 08 c0    	lea    -0x3ff7cde0(%eax),%edx
c0008959:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000895c:	89 c3                	mov    %eax,%ebx
c000895e:	b8 ad 00 00 00       	mov    $0xad,%eax
c0008963:	89 d7                	mov    %edx,%edi
c0008965:	89 de                	mov    %ebx,%esi
c0008967:	89 c1                	mov    %eax,%ecx
c0008969:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c000896b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000896f:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c0008973:	0f 8e f5 fd ff ff    	jle    c000876e <kernel_main2+0x59>
c0008979:	c7 05 e0 0b 01 c0 20 	movl   $0xc0083220,0xc0010be0
c0008980:	32 08 c0 
c0008983:	eb fe                	jmp    c0008983 <kernel_main2+0x26e>

c0008985 <TestTTY>:
c0008985:	55                   	push   %ebp
c0008986:	89 e5                	mov    %esp,%ebp
c0008988:	83 ec 28             	sub    $0x28,%esp
c000898b:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008992:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008999:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000899f:	83 ec 08             	sub    $0x8,%esp
c00089a2:	6a 02                	push   $0x2
c00089a4:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089a7:	50                   	push   %eax
c00089a8:	e8 11 d1 ff ff       	call   c0005abe <open>
c00089ad:	83 c4 10             	add    $0x10,%esp
c00089b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00089b3:	83 ec 08             	sub    $0x8,%esp
c00089b6:	6a 02                	push   $0x2
c00089b8:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089bb:	50                   	push   %eax
c00089bc:	e8 fd d0 ff ff       	call   c0005abe <open>
c00089c1:	83 c4 10             	add    $0x10,%esp
c00089c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00089c7:	83 ec 0c             	sub    $0xc,%esp
c00089ca:	68 1b be 00 c0       	push   $0xc000be1b
c00089cf:	e8 0d 0e 00 00       	call   c00097e1 <Printf>
c00089d4:	83 c4 10             	add    $0x10,%esp
c00089d7:	83 ec 0c             	sub    $0xc,%esp
c00089da:	6a 0a                	push   $0xa
c00089dc:	e8 e3 9b ff ff       	call   c00025c4 <sys_malloc>
c00089e1:	83 c4 10             	add    $0x10,%esp
c00089e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00089e7:	83 ec 04             	sub    $0x4,%esp
c00089ea:	6a 0a                	push   $0xa
c00089ec:	6a 00                	push   $0x0
c00089ee:	ff 75 ec             	pushl  -0x14(%ebp)
c00089f1:	e8 d1 38 00 00       	call   c000c2c7 <Memset>
c00089f6:	83 c4 10             	add    $0x10,%esp
c00089f9:	83 ec 04             	sub    $0x4,%esp
c00089fc:	6a 0a                	push   $0xa
c00089fe:	ff 75 ec             	pushl  -0x14(%ebp)
c0008a01:	ff 75 f0             	pushl  -0x10(%ebp)
c0008a04:	e8 4a d1 ff ff       	call   c0005b53 <read>
c0008a09:	83 c4 10             	add    $0x10,%esp
c0008a0c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008a0f:	83 ec 08             	sub    $0x8,%esp
c0008a12:	ff 75 ec             	pushl  -0x14(%ebp)
c0008a15:	68 2d be 00 c0       	push   $0xc000be2d
c0008a1a:	e8 c2 0d 00 00       	call   c00097e1 <Printf>
c0008a1f:	83 c4 10             	add    $0x10,%esp
c0008a22:	eb c3                	jmp    c00089e7 <TestTTY+0x62>

c0008a24 <TestFS>:
c0008a24:	55                   	push   %ebp
c0008a25:	89 e5                	mov    %esp,%ebp
c0008a27:	81 ec 28 01 00 00    	sub    $0x128,%esp
c0008a2d:	83 ec 0c             	sub    $0xc,%esp
c0008a30:	68 37 be 00 c0       	push   $0xc000be37
c0008a35:	e8 52 87 ff ff       	call   c000118c <disp_str>
c0008a3a:	83 c4 10             	add    $0x10,%esp
c0008a3d:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0008a44:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c0008a4b:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0008a51:	66 87 db             	xchg   %bx,%bx
c0008a54:	83 ec 08             	sub    $0x8,%esp
c0008a57:	6a 02                	push   $0x2
c0008a59:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008a5c:	50                   	push   %eax
c0008a5d:	e8 5c d0 ff ff       	call   c0005abe <open>
c0008a62:	83 c4 10             	add    $0x10,%esp
c0008a65:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a68:	66 87 db             	xchg   %bx,%bx
c0008a6b:	83 ec 08             	sub    $0x8,%esp
c0008a6e:	6a 02                	push   $0x2
c0008a70:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008a73:	50                   	push   %eax
c0008a74:	e8 45 d0 ff ff       	call   c0005abe <open>
c0008a79:	83 c4 10             	add    $0x10,%esp
c0008a7c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008a7f:	66 87 db             	xchg   %bx,%bx
c0008a82:	83 ec 0c             	sub    $0xc,%esp
c0008a85:	68 1b be 00 c0       	push   $0xc000be1b
c0008a8a:	e8 52 0d 00 00       	call   c00097e1 <Printf>
c0008a8f:	83 c4 10             	add    $0x10,%esp
c0008a92:	66 87 db             	xchg   %bx,%bx
c0008a95:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c0008a9c:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0008aa0:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0008aa7:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c0008aab:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0008ab2:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0008ab9:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0008abf:	66 87 db             	xchg   %bx,%bx
c0008ac2:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008ac9:	66 87 db             	xchg   %bx,%bx
c0008acc:	83 ec 0c             	sub    $0xc,%esp
c0008acf:	68 3f be 00 c0       	push   $0xc000be3f
c0008ad4:	e8 08 0d 00 00       	call   c00097e1 <Printf>
c0008ad9:	83 c4 10             	add    $0x10,%esp
c0008adc:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0008ae0:	0f 85 43 03 00 00    	jne    c0008e29 <TestFS+0x405>
c0008ae6:	83 ec 08             	sub    $0x8,%esp
c0008ae9:	6a 07                	push   $0x7
c0008aeb:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0008aee:	50                   	push   %eax
c0008aef:	e8 ca cf ff ff       	call   c0005abe <open>
c0008af4:	83 c4 10             	add    $0x10,%esp
c0008af7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008afa:	83 ec 08             	sub    $0x8,%esp
c0008afd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b00:	68 57 be 00 c0       	push   $0xc000be57
c0008b05:	e8 d7 0c 00 00       	call   c00097e1 <Printf>
c0008b0a:	83 c4 10             	add    $0x10,%esp
c0008b0d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008b14:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0008b1b:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0008b22:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0008b29:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0008b30:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008b37:	83 ec 0c             	sub    $0xc,%esp
c0008b3a:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008b3d:	50                   	push   %eax
c0008b3e:	e8 bd 37 00 00       	call   c000c300 <Strlen>
c0008b43:	83 c4 10             	add    $0x10,%esp
c0008b46:	83 ec 04             	sub    $0x4,%esp
c0008b49:	50                   	push   %eax
c0008b4a:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008b4d:	50                   	push   %eax
c0008b4e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b51:	e8 7e d1 ff ff       	call   c0005cd4 <write>
c0008b56:	83 c4 10             	add    $0x10,%esp
c0008b59:	83 ec 04             	sub    $0x4,%esp
c0008b5c:	6a 14                	push   $0x14
c0008b5e:	6a 00                	push   $0x0
c0008b60:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008b63:	50                   	push   %eax
c0008b64:	e8 5e 37 00 00       	call   c000c2c7 <Memset>
c0008b69:	83 c4 10             	add    $0x10,%esp
c0008b6c:	83 ec 04             	sub    $0x4,%esp
c0008b6f:	6a 12                	push   $0x12
c0008b71:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008b74:	50                   	push   %eax
c0008b75:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b78:	e8 d6 cf ff ff       	call   c0005b53 <read>
c0008b7d:	83 c4 10             	add    $0x10,%esp
c0008b80:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008b83:	83 ec 08             	sub    $0x8,%esp
c0008b86:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008b89:	50                   	push   %eax
c0008b8a:	68 60 be 00 c0       	push   $0xc000be60
c0008b8f:	e8 4d 0c 00 00       	call   c00097e1 <Printf>
c0008b94:	83 c4 10             	add    $0x10,%esp
c0008b97:	66 87 db             	xchg   %bx,%bx
c0008b9a:	83 ec 0c             	sub    $0xc,%esp
c0008b9d:	6a 0a                	push   $0xa
c0008b9f:	e8 09 0b 00 00       	call   c00096ad <delay>
c0008ba4:	83 c4 10             	add    $0x10,%esp
c0008ba7:	83 ec 08             	sub    $0x8,%esp
c0008baa:	6a 07                	push   $0x7
c0008bac:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0008baf:	50                   	push   %eax
c0008bb0:	e8 09 cf ff ff       	call   c0005abe <open>
c0008bb5:	83 c4 10             	add    $0x10,%esp
c0008bb8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008bbb:	83 ec 08             	sub    $0x8,%esp
c0008bbe:	ff 75 dc             	pushl  -0x24(%ebp)
c0008bc1:	68 6b be 00 c0       	push   $0xc000be6b
c0008bc6:	e8 16 0c 00 00       	call   c00097e1 <Printf>
c0008bcb:	83 c4 10             	add    $0x10,%esp
c0008bce:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008bd5:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0008bdc:	67 3a 68 
c0008bdf:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0008be6:	77 20 61 
c0008be9:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0008bf0:	65 20 79 
c0008bf3:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0008bfa:	75 3f 00 
c0008bfd:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0008c04:	00 00 00 
c0008c07:	83 ec 0c             	sub    $0xc,%esp
c0008c0a:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008c10:	50                   	push   %eax
c0008c11:	e8 ea 36 00 00       	call   c000c300 <Strlen>
c0008c16:	83 c4 10             	add    $0x10,%esp
c0008c19:	83 ec 04             	sub    $0x4,%esp
c0008c1c:	50                   	push   %eax
c0008c1d:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008c23:	50                   	push   %eax
c0008c24:	ff 75 dc             	pushl  -0x24(%ebp)
c0008c27:	e8 a8 d0 ff ff       	call   c0005cd4 <write>
c0008c2c:	83 c4 10             	add    $0x10,%esp
c0008c2f:	83 ec 04             	sub    $0x4,%esp
c0008c32:	6a 14                	push   $0x14
c0008c34:	6a 00                	push   $0x0
c0008c36:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008c3c:	50                   	push   %eax
c0008c3d:	e8 85 36 00 00       	call   c000c2c7 <Memset>
c0008c42:	83 c4 10             	add    $0x10,%esp
c0008c45:	83 ec 04             	sub    $0x4,%esp
c0008c48:	6a 12                	push   $0x12
c0008c4a:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008c50:	50                   	push   %eax
c0008c51:	ff 75 dc             	pushl  -0x24(%ebp)
c0008c54:	e8 fa ce ff ff       	call   c0005b53 <read>
c0008c59:	83 c4 10             	add    $0x10,%esp
c0008c5c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008c5f:	83 ec 08             	sub    $0x8,%esp
c0008c62:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008c68:	50                   	push   %eax
c0008c69:	68 75 be 00 c0       	push   $0xc000be75
c0008c6e:	e8 6e 0b 00 00       	call   c00097e1 <Printf>
c0008c73:	83 c4 10             	add    $0x10,%esp
c0008c76:	83 ec 08             	sub    $0x8,%esp
c0008c79:	6a 07                	push   $0x7
c0008c7b:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0008c7e:	50                   	push   %eax
c0008c7f:	e8 3a ce ff ff       	call   c0005abe <open>
c0008c84:	83 c4 10             	add    $0x10,%esp
c0008c87:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008c8a:	83 ec 08             	sub    $0x8,%esp
c0008c8d:	ff 75 dc             	pushl  -0x24(%ebp)
c0008c90:	68 6b be 00 c0       	push   $0xc000be6b
c0008c95:	e8 47 0b 00 00       	call   c00097e1 <Printf>
c0008c9a:	83 c4 10             	add    $0x10,%esp
c0008c9d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008ca4:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0008cab:	20 77 69 
c0008cae:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0008cb5:	6c 20 73 
c0008cb8:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0008cbf:	63 63 65 
c0008cc2:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0008cc9:	73 20 61 
c0008ccc:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0008cd3:	20 6c 61 
c0008cd6:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0008cdd:	74 2e 00 
c0008ce0:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0008ce7:	00 00 00 
c0008cea:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0008cf1:	00 00 
c0008cf3:	83 ec 0c             	sub    $0xc,%esp
c0008cf6:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008cfc:	50                   	push   %eax
c0008cfd:	e8 fe 35 00 00       	call   c000c300 <Strlen>
c0008d02:	83 c4 10             	add    $0x10,%esp
c0008d05:	83 ec 04             	sub    $0x4,%esp
c0008d08:	50                   	push   %eax
c0008d09:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008d0f:	50                   	push   %eax
c0008d10:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008d13:	e8 bc cf ff ff       	call   c0005cd4 <write>
c0008d18:	83 c4 10             	add    $0x10,%esp
c0008d1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008d22:	eb 5c                	jmp    c0008d80 <TestFS+0x35c>
c0008d24:	83 ec 04             	sub    $0x4,%esp
c0008d27:	6a 1e                	push   $0x1e
c0008d29:	6a 00                	push   $0x0
c0008d2b:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008d31:	50                   	push   %eax
c0008d32:	e8 90 35 00 00       	call   c000c2c7 <Memset>
c0008d37:	83 c4 10             	add    $0x10,%esp
c0008d3a:	83 ec 0c             	sub    $0xc,%esp
c0008d3d:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008d43:	50                   	push   %eax
c0008d44:	e8 b7 35 00 00       	call   c000c300 <Strlen>
c0008d49:	83 c4 10             	add    $0x10,%esp
c0008d4c:	83 ec 04             	sub    $0x4,%esp
c0008d4f:	50                   	push   %eax
c0008d50:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008d56:	50                   	push   %eax
c0008d57:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008d5a:	e8 f4 cd ff ff       	call   c0005b53 <read>
c0008d5f:	83 c4 10             	add    $0x10,%esp
c0008d62:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008d65:	83 ec 08             	sub    $0x8,%esp
c0008d68:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008d6e:	50                   	push   %eax
c0008d6f:	68 80 be 00 c0       	push   $0xc000be80
c0008d74:	e8 68 0a 00 00       	call   c00097e1 <Printf>
c0008d79:	83 c4 10             	add    $0x10,%esp
c0008d7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008d80:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008d84:	7e 9e                	jle    c0008d24 <TestFS+0x300>
c0008d86:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0008d8d:	6e 73 74 
c0008d90:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0008d97:	6c 6c 2e 
c0008d9a:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0008da1:	61 72 00 
c0008da4:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0008dab:	00 00 00 
c0008dae:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0008db5:	00 00 00 
c0008db8:	83 ec 08             	sub    $0x8,%esp
c0008dbb:	6a 00                	push   $0x0
c0008dbd:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0008dc3:	50                   	push   %eax
c0008dc4:	e8 f5 cc ff ff       	call   c0005abe <open>
c0008dc9:	83 c4 10             	add    $0x10,%esp
c0008dcc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008dcf:	83 ec 08             	sub    $0x8,%esp
c0008dd2:	ff 75 cc             	pushl  -0x34(%ebp)
c0008dd5:	68 8b be 00 c0       	push   $0xc000be8b
c0008dda:	e8 02 0a 00 00       	call   c00097e1 <Printf>
c0008ddf:	83 c4 10             	add    $0x10,%esp
c0008de2:	83 ec 04             	sub    $0x4,%esp
c0008de5:	6a 28                	push   $0x28
c0008de7:	6a 00                	push   $0x0
c0008de9:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008def:	50                   	push   %eax
c0008df0:	e8 d2 34 00 00       	call   c000c2c7 <Memset>
c0008df5:	83 c4 10             	add    $0x10,%esp
c0008df8:	83 ec 04             	sub    $0x4,%esp
c0008dfb:	6a 28                	push   $0x28
c0008dfd:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008e03:	50                   	push   %eax
c0008e04:	ff 75 cc             	pushl  -0x34(%ebp)
c0008e07:	e8 47 cd ff ff       	call   c0005b53 <read>
c0008e0c:	83 c4 10             	add    $0x10,%esp
c0008e0f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008e12:	83 ec 08             	sub    $0x8,%esp
c0008e15:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008e1b:	50                   	push   %eax
c0008e1c:	68 95 be 00 c0       	push   $0xc000be95
c0008e21:	e8 bb 09 00 00       	call   c00097e1 <Printf>
c0008e26:	83 c4 10             	add    $0x10,%esp
c0008e29:	90                   	nop
c0008e2a:	c9                   	leave  
c0008e2b:	c3                   	ret    

c0008e2c <wait_exit>:
c0008e2c:	55                   	push   %ebp
c0008e2d:	89 e5                	mov    %esp,%ebp
c0008e2f:	83 ec 28             	sub    $0x28,%esp
c0008e32:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008e39:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008e40:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008e46:	83 ec 08             	sub    $0x8,%esp
c0008e49:	6a 02                	push   $0x2
c0008e4b:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008e4e:	50                   	push   %eax
c0008e4f:	e8 6a cc ff ff       	call   c0005abe <open>
c0008e54:	83 c4 10             	add    $0x10,%esp
c0008e57:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008e5a:	83 ec 08             	sub    $0x8,%esp
c0008e5d:	6a 02                	push   $0x2
c0008e5f:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008e62:	50                   	push   %eax
c0008e63:	e8 56 cc ff ff       	call   c0005abe <open>
c0008e68:	83 c4 10             	add    $0x10,%esp
c0008e6b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e6e:	e8 ab cf ff ff       	call   c0005e1e <fork>
c0008e73:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008e76:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008e7a:	7e 25                	jle    c0008ea1 <wait_exit+0x75>
c0008e7c:	83 ec 0c             	sub    $0xc,%esp
c0008e7f:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0008e82:	50                   	push   %eax
c0008e83:	e8 23 cf ff ff       	call   c0005dab <wait>
c0008e88:	83 c4 10             	add    $0x10,%esp
c0008e8b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008e8e:	83 ec 08             	sub    $0x8,%esp
c0008e91:	50                   	push   %eax
c0008e92:	68 a0 be 00 c0       	push   $0xc000bea0
c0008e97:	e8 45 09 00 00       	call   c00097e1 <Printf>
c0008e9c:	83 c4 10             	add    $0x10,%esp
c0008e9f:	eb fe                	jmp    c0008e9f <wait_exit+0x73>
c0008ea1:	83 ec 0c             	sub    $0xc,%esp
c0008ea4:	68 bb be 00 c0       	push   $0xc000bebb
c0008ea9:	e8 33 09 00 00       	call   c00097e1 <Printf>
c0008eae:	83 c4 10             	add    $0x10,%esp
c0008eb1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008eb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ebb:	8d 50 01             	lea    0x1(%eax),%edx
c0008ebe:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008ec1:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008ec6:	7f 02                	jg     c0008eca <wait_exit+0x9e>
c0008ec8:	eb ee                	jmp    c0008eb8 <wait_exit+0x8c>
c0008eca:	90                   	nop
c0008ecb:	83 ec 0c             	sub    $0xc,%esp
c0008ece:	68 c7 be 00 c0       	push   $0xc000bec7
c0008ed3:	e8 09 09 00 00       	call   c00097e1 <Printf>
c0008ed8:	83 c4 10             	add    $0x10,%esp
c0008edb:	83 ec 0c             	sub    $0xc,%esp
c0008ede:	6a 09                	push   $0x9
c0008ee0:	e8 0a cf ff ff       	call   c0005def <exit>
c0008ee5:	83 c4 10             	add    $0x10,%esp
c0008ee8:	83 ec 0c             	sub    $0xc,%esp
c0008eeb:	68 d5 be 00 c0       	push   $0xc000bed5
c0008ef0:	e8 ec 08 00 00       	call   c00097e1 <Printf>
c0008ef5:	83 c4 10             	add    $0x10,%esp
c0008ef8:	eb fe                	jmp    c0008ef8 <wait_exit+0xcc>

c0008efa <INIT_fork>:
c0008efa:	55                   	push   %ebp
c0008efb:	89 e5                	mov    %esp,%ebp
c0008efd:	83 ec 78             	sub    $0x78,%esp
c0008f00:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008f07:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008f0e:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008f14:	83 ec 08             	sub    $0x8,%esp
c0008f17:	6a 02                	push   $0x2
c0008f19:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008f1c:	50                   	push   %eax
c0008f1d:	e8 9c cb ff ff       	call   c0005abe <open>
c0008f22:	83 c4 10             	add    $0x10,%esp
c0008f25:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f28:	83 ec 08             	sub    $0x8,%esp
c0008f2b:	6a 02                	push   $0x2
c0008f2d:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008f30:	50                   	push   %eax
c0008f31:	e8 88 cb ff ff       	call   c0005abe <open>
c0008f36:	83 c4 10             	add    $0x10,%esp
c0008f39:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f3c:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0008f43:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008f4a:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008f51:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008f58:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008f5f:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008f66:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008f6d:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008f74:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008f7b:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008f82:	83 ec 0c             	sub    $0xc,%esp
c0008f85:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008f88:	50                   	push   %eax
c0008f89:	e8 53 08 00 00       	call   c00097e1 <Printf>
c0008f8e:	83 c4 10             	add    $0x10,%esp
c0008f91:	83 ec 0c             	sub    $0xc,%esp
c0008f94:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008f97:	50                   	push   %eax
c0008f98:	e8 63 33 00 00       	call   c000c300 <Strlen>
c0008f9d:	83 c4 10             	add    $0x10,%esp
c0008fa0:	83 ec 04             	sub    $0x4,%esp
c0008fa3:	50                   	push   %eax
c0008fa4:	6a 00                	push   $0x0
c0008fa6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fa9:	50                   	push   %eax
c0008faa:	e8 18 33 00 00       	call   c000c2c7 <Memset>
c0008faf:	83 c4 10             	add    $0x10,%esp
c0008fb2:	83 ec 04             	sub    $0x4,%esp
c0008fb5:	6a 28                	push   $0x28
c0008fb7:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fba:	50                   	push   %eax
c0008fbb:	ff 75 f0             	pushl  -0x10(%ebp)
c0008fbe:	e8 90 cb ff ff       	call   c0005b53 <read>
c0008fc3:	83 c4 10             	add    $0x10,%esp
c0008fc6:	83 ec 0c             	sub    $0xc,%esp
c0008fc9:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fcc:	50                   	push   %eax
c0008fcd:	e8 0f 08 00 00       	call   c00097e1 <Printf>
c0008fd2:	83 c4 10             	add    $0x10,%esp
c0008fd5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008fdc:	e8 3d ce ff ff       	call   c0005e1e <fork>
c0008fe1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008fe4:	66 87 db             	xchg   %bx,%bx
c0008fe7:	83 ec 0c             	sub    $0xc,%esp
c0008fea:	6a 01                	push   $0x1
c0008fec:	e8 bc 06 00 00       	call   c00096ad <delay>
c0008ff1:	83 c4 10             	add    $0x10,%esp
c0008ff4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008ff8:	0f 8e c5 00 00 00    	jle    c00090c3 <INIT_fork+0x1c9>
c0008ffe:	83 ec 0c             	sub    $0xc,%esp
c0009001:	68 e3 be 00 c0       	push   $0xc000bee3
c0009006:	e8 d6 07 00 00       	call   c00097e1 <Printf>
c000900b:	83 c4 10             	add    $0x10,%esp
c000900e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0009012:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0009019:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0009020:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0009027:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c000902e:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0009035:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c000903c:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0009043:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c000904a:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0009051:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0009058:	83 ec 0c             	sub    $0xc,%esp
c000905b:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000905e:	50                   	push   %eax
c000905f:	e8 9c 32 00 00       	call   c000c300 <Strlen>
c0009064:	83 c4 10             	add    $0x10,%esp
c0009067:	83 ec 04             	sub    $0x4,%esp
c000906a:	50                   	push   %eax
c000906b:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000906e:	50                   	push   %eax
c000906f:	ff 75 f4             	pushl  -0xc(%ebp)
c0009072:	e8 5d cc ff ff       	call   c0005cd4 <write>
c0009077:	83 c4 10             	add    $0x10,%esp
c000907a:	83 ec 0c             	sub    $0xc,%esp
c000907d:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009080:	50                   	push   %eax
c0009081:	e8 7a 32 00 00       	call   c000c300 <Strlen>
c0009086:	83 c4 10             	add    $0x10,%esp
c0009089:	83 ec 04             	sub    $0x4,%esp
c000908c:	50                   	push   %eax
c000908d:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009090:	50                   	push   %eax
c0009091:	ff 75 f4             	pushl  -0xc(%ebp)
c0009094:	e8 3b cc ff ff       	call   c0005cd4 <write>
c0009099:	83 c4 10             	add    $0x10,%esp
c000909c:	83 ec 0c             	sub    $0xc,%esp
c000909f:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00090a2:	50                   	push   %eax
c00090a3:	e8 58 32 00 00       	call   c000c300 <Strlen>
c00090a8:	83 c4 10             	add    $0x10,%esp
c00090ab:	83 ec 04             	sub    $0x4,%esp
c00090ae:	50                   	push   %eax
c00090af:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00090b2:	50                   	push   %eax
c00090b3:	ff 75 f4             	pushl  -0xc(%ebp)
c00090b6:	e8 19 cc ff ff       	call   c0005cd4 <write>
c00090bb:	83 c4 10             	add    $0x10,%esp
c00090be:	e9 c6 00 00 00       	jmp    c0009189 <INIT_fork+0x28f>
c00090c3:	83 ec 0c             	sub    $0xc,%esp
c00090c6:	6a 01                	push   $0x1
c00090c8:	e8 e0 05 00 00       	call   c00096ad <delay>
c00090cd:	83 c4 10             	add    $0x10,%esp
c00090d0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00090d4:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c00090d8:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c00090df:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c00090e6:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c00090ed:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c00090f4:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c00090fb:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0009102:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0009109:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0009110:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0009117:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c000911e:	66 87 db             	xchg   %bx,%bx
c0009121:	83 ec 0c             	sub    $0xc,%esp
c0009124:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009127:	50                   	push   %eax
c0009128:	e8 d3 31 00 00       	call   c000c300 <Strlen>
c000912d:	83 c4 10             	add    $0x10,%esp
c0009130:	83 ec 04             	sub    $0x4,%esp
c0009133:	50                   	push   %eax
c0009134:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009137:	50                   	push   %eax
c0009138:	ff 75 f4             	pushl  -0xc(%ebp)
c000913b:	e8 94 cb ff ff       	call   c0005cd4 <write>
c0009140:	83 c4 10             	add    $0x10,%esp
c0009143:	83 ec 0c             	sub    $0xc,%esp
c0009146:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009149:	50                   	push   %eax
c000914a:	e8 b1 31 00 00       	call   c000c300 <Strlen>
c000914f:	83 c4 10             	add    $0x10,%esp
c0009152:	83 ec 04             	sub    $0x4,%esp
c0009155:	50                   	push   %eax
c0009156:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009159:	50                   	push   %eax
c000915a:	ff 75 f4             	pushl  -0xc(%ebp)
c000915d:	e8 72 cb ff ff       	call   c0005cd4 <write>
c0009162:	83 c4 10             	add    $0x10,%esp
c0009165:	83 ec 0c             	sub    $0xc,%esp
c0009168:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000916b:	50                   	push   %eax
c000916c:	e8 8f 31 00 00       	call   c000c300 <Strlen>
c0009171:	83 c4 10             	add    $0x10,%esp
c0009174:	83 ec 04             	sub    $0x4,%esp
c0009177:	50                   	push   %eax
c0009178:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000917b:	50                   	push   %eax
c000917c:	ff 75 f4             	pushl  -0xc(%ebp)
c000917f:	e8 50 cb ff ff       	call   c0005cd4 <write>
c0009184:	83 c4 10             	add    $0x10,%esp
c0009187:	eb fe                	jmp    c0009187 <INIT_fork+0x28d>
c0009189:	83 ec 04             	sub    $0x4,%esp
c000918c:	6a 28                	push   $0x28
c000918e:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0009191:	50                   	push   %eax
c0009192:	ff 75 f0             	pushl  -0x10(%ebp)
c0009195:	e8 b9 c9 ff ff       	call   c0005b53 <read>
c000919a:	83 c4 10             	add    $0x10,%esp
c000919d:	83 ec 0c             	sub    $0xc,%esp
c00091a0:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091a3:	50                   	push   %eax
c00091a4:	e8 38 06 00 00       	call   c00097e1 <Printf>
c00091a9:	83 c4 10             	add    $0x10,%esp
c00091ac:	83 ec 0c             	sub    $0xc,%esp
c00091af:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091b2:	50                   	push   %eax
c00091b3:	e8 29 06 00 00       	call   c00097e1 <Printf>
c00091b8:	83 c4 10             	add    $0x10,%esp
c00091bb:	83 ec 0c             	sub    $0xc,%esp
c00091be:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091c1:	50                   	push   %eax
c00091c2:	e8 1a 06 00 00       	call   c00097e1 <Printf>
c00091c7:	83 c4 10             	add    $0x10,%esp
c00091ca:	83 ec 0c             	sub    $0xc,%esp
c00091cd:	68 e9 be 00 c0       	push   $0xc000bee9
c00091d2:	e8 23 09 00 00       	call   c0009afa <spin>
c00091d7:	83 c4 10             	add    $0x10,%esp
c00091da:	90                   	nop
c00091db:	c9                   	leave  
c00091dc:	c3                   	ret    

c00091dd <simple_shell>:
c00091dd:	55                   	push   %ebp
c00091de:	89 e5                	mov    %esp,%ebp
c00091e0:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c00091e6:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c00091ed:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c00091f4:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c00091fa:	83 ec 08             	sub    $0x8,%esp
c00091fd:	6a 02                	push   $0x2
c00091ff:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0009202:	50                   	push   %eax
c0009203:	e8 b6 c8 ff ff       	call   c0005abe <open>
c0009208:	83 c4 10             	add    $0x10,%esp
c000920b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000920e:	83 ec 08             	sub    $0x8,%esp
c0009211:	6a 02                	push   $0x2
c0009213:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0009216:	50                   	push   %eax
c0009217:	e8 a2 c8 ff ff       	call   c0005abe <open>
c000921c:	83 c4 10             	add    $0x10,%esp
c000921f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009222:	83 ec 04             	sub    $0x4,%esp
c0009225:	68 80 00 00 00       	push   $0x80
c000922a:	6a 00                	push   $0x0
c000922c:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0009232:	50                   	push   %eax
c0009233:	e8 8f 30 00 00       	call   c000c2c7 <Memset>
c0009238:	83 c4 10             	add    $0x10,%esp
c000923b:	83 ec 04             	sub    $0x4,%esp
c000923e:	68 80 00 00 00       	push   $0x80
c0009243:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0009249:	50                   	push   %eax
c000924a:	ff 75 e0             	pushl  -0x20(%ebp)
c000924d:	e8 01 c9 ff ff       	call   c0005b53 <read>
c0009252:	83 c4 10             	add    $0x10,%esp
c0009255:	83 ec 08             	sub    $0x8,%esp
c0009258:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000925e:	50                   	push   %eax
c000925f:	68 f1 be 00 c0       	push   $0xc000bef1
c0009264:	e8 78 05 00 00       	call   c00097e1 <Printf>
c0009269:	83 c4 10             	add    $0x10,%esp
c000926c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009273:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000927a:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0009280:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009283:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009286:	0f b6 00             	movzbl (%eax),%eax
c0009289:	88 45 db             	mov    %al,-0x25(%ebp)
c000928c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000928f:	0f b6 00             	movzbl (%eax),%eax
c0009292:	3c 20                	cmp    $0x20,%al
c0009294:	74 1d                	je     c00092b3 <simple_shell+0xd6>
c0009296:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009299:	0f b6 00             	movzbl (%eax),%eax
c000929c:	84 c0                	test   %al,%al
c000929e:	74 13                	je     c00092b3 <simple_shell+0xd6>
c00092a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00092a4:	75 0d                	jne    c00092b3 <simple_shell+0xd6>
c00092a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092a9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00092ac:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00092b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092b6:	0f b6 00             	movzbl (%eax),%eax
c00092b9:	3c 20                	cmp    $0x20,%al
c00092bb:	74 0a                	je     c00092c7 <simple_shell+0xea>
c00092bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092c0:	0f b6 00             	movzbl (%eax),%eax
c00092c3:	84 c0                	test   %al,%al
c00092c5:	75 26                	jne    c00092ed <simple_shell+0x110>
c00092c7:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00092cb:	75 20                	jne    c00092ed <simple_shell+0x110>
c00092cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00092d0:	8d 50 01             	lea    0x1(%eax),%edx
c00092d3:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00092d6:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00092d9:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c00092e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092e3:	c6 00 00             	movb   $0x0,(%eax)
c00092e6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00092ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00092f1:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c00092f5:	75 8c                	jne    c0009283 <simple_shell+0xa6>
c00092f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00092fa:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0009301:	00 00 00 00 
c0009305:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c000930c:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0009312:	83 ec 08             	sub    $0x8,%esp
c0009315:	6a 02                	push   $0x2
c0009317:	50                   	push   %eax
c0009318:	e8 a1 c7 ff ff       	call   c0005abe <open>
c000931d:	83 c4 10             	add    $0x10,%esp
c0009320:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009323:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0009327:	75 54                	jne    c000937d <simple_shell+0x1a0>
c0009329:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0009330:	eb 29                	jmp    c000935b <simple_shell+0x17e>
c0009332:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0009338:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000933b:	01 d0                	add    %edx,%eax
c000933d:	0f b6 00             	movzbl (%eax),%eax
c0009340:	0f be c0             	movsbl %al,%eax
c0009343:	83 ec 04             	sub    $0x4,%esp
c0009346:	50                   	push   %eax
c0009347:	ff 75 e4             	pushl  -0x1c(%ebp)
c000934a:	68 00 bf 00 c0       	push   $0xc000bf00
c000934f:	e8 8d 04 00 00       	call   c00097e1 <Printf>
c0009354:	83 c4 10             	add    $0x10,%esp
c0009357:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000935b:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c000935f:	7e d1                	jle    c0009332 <simple_shell+0x155>
c0009361:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0009367:	83 ec 08             	sub    $0x8,%esp
c000936a:	50                   	push   %eax
c000936b:	68 07 bf 00 c0       	push   $0xc000bf07
c0009370:	e8 6c 04 00 00       	call   c00097e1 <Printf>
c0009375:	83 c4 10             	add    $0x10,%esp
c0009378:	e9 a5 fe ff ff       	jmp    c0009222 <simple_shell+0x45>
c000937d:	e8 9c ca ff ff       	call   c0005e1e <fork>
c0009382:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009385:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0009389:	7e 17                	jle    c00093a2 <simple_shell+0x1c5>
c000938b:	83 ec 0c             	sub    $0xc,%esp
c000938e:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0009394:	50                   	push   %eax
c0009395:	e8 11 ca ff ff       	call   c0005dab <wait>
c000939a:	83 c4 10             	add    $0x10,%esp
c000939d:	e9 80 fe ff ff       	jmp    c0009222 <simple_shell+0x45>
c00093a2:	83 ec 0c             	sub    $0xc,%esp
c00093a5:	68 0d bf 00 c0       	push   $0xc000bf0d
c00093aa:	e8 32 04 00 00       	call   c00097e1 <Printf>
c00093af:	83 c4 10             	add    $0x10,%esp
c00093b2:	83 ec 0c             	sub    $0xc,%esp
c00093b5:	ff 75 d0             	pushl  -0x30(%ebp)
c00093b8:	e8 9c c9 ff ff       	call   c0005d59 <close>
c00093bd:	83 c4 10             	add    $0x10,%esp
c00093c0:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00093c6:	83 ec 08             	sub    $0x8,%esp
c00093c9:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c00093cf:	52                   	push   %edx
c00093d0:	50                   	push   %eax
c00093d1:	e8 4c cb ff ff       	call   c0005f22 <execv>
c00093d6:	83 c4 10             	add    $0x10,%esp
c00093d9:	eb fe                	jmp    c00093d9 <simple_shell+0x1fc>

c00093db <test_split_str>:
c00093db:	55                   	push   %ebp
c00093dc:	89 e5                	mov    %esp,%ebp
c00093de:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c00093e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00093eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00093f2:	c7 45 ec 29 bf 00 c0 	movl   $0xc000bf29,-0x14(%ebp)
c00093f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00093fd:	75 1a                	jne    c0009419 <test_split_str+0x3e>
c00093ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009402:	0f b6 00             	movzbl (%eax),%eax
c0009405:	0f be c0             	movsbl %al,%eax
c0009408:	83 ec 08             	sub    $0x8,%esp
c000940b:	50                   	push   %eax
c000940c:	68 3a bf 00 c0       	push   $0xc000bf3a
c0009411:	e8 cb 03 00 00       	call   c00097e1 <Printf>
c0009416:	83 c4 10             	add    $0x10,%esp
c0009419:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000941c:	0f b6 00             	movzbl (%eax),%eax
c000941f:	3c 20                	cmp    $0x20,%al
c0009421:	75 0a                	jne    c000942d <test_split_str+0x52>
c0009423:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009426:	0f b6 00             	movzbl (%eax),%eax
c0009429:	84 c0                	test   %al,%al
c000942b:	74 13                	je     c0009440 <test_split_str+0x65>
c000942d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009431:	75 0d                	jne    c0009440 <test_split_str+0x65>
c0009433:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009436:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009439:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0009440:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009443:	0f b6 00             	movzbl (%eax),%eax
c0009446:	3c 20                	cmp    $0x20,%al
c0009448:	74 0a                	je     c0009454 <test_split_str+0x79>
c000944a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000944d:	0f b6 00             	movzbl (%eax),%eax
c0009450:	84 c0                	test   %al,%al
c0009452:	75 26                	jne    c000947a <test_split_str+0x9f>
c0009454:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0009458:	75 20                	jne    c000947a <test_split_str+0x9f>
c000945a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000945d:	8d 50 01             	lea    0x1(%eax),%edx
c0009460:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009463:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009466:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c000946d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009470:	c6 00 00             	movb   $0x0,(%eax)
c0009473:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000947a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000947e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009481:	0f b6 00             	movzbl (%eax),%eax
c0009484:	84 c0                	test   %al,%al
c0009486:	0f 85 6d ff ff ff    	jne    c00093f9 <test_split_str+0x1e>
c000948c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000948f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009492:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0009499:	83 ec 08             	sub    $0x8,%esp
c000949c:	ff 75 f4             	pushl  -0xc(%ebp)
c000949f:	68 43 bf 00 c0       	push   $0xc000bf43
c00094a4:	e8 38 03 00 00       	call   c00097e1 <Printf>
c00094a9:	83 c4 10             	add    $0x10,%esp
c00094ac:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00094b3:	eb 22                	jmp    c00094d7 <test_split_str+0xfc>
c00094b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00094b8:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c00094bf:	83 ec 04             	sub    $0x4,%esp
c00094c2:	50                   	push   %eax
c00094c3:	ff 75 e4             	pushl  -0x1c(%ebp)
c00094c6:	68 5a bf 00 c0       	push   $0xc000bf5a
c00094cb:	e8 11 03 00 00       	call   c00097e1 <Printf>
c00094d0:	83 c4 10             	add    $0x10,%esp
c00094d3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00094d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00094da:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c00094dd:	7e d6                	jle    c00094b5 <test_split_str+0xda>
c00094df:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c00094e5:	83 ec 08             	sub    $0x8,%esp
c00094e8:	68 69 bf 00 c0       	push   $0xc000bf69
c00094ed:	50                   	push   %eax
c00094ee:	e8 f0 12 00 00       	call   c000a7e3 <strcmp>
c00094f3:	83 c4 10             	add    $0x10,%esp
c00094f6:	85 c0                	test   %eax,%eax
c00094f8:	75 10                	jne    c000950a <test_split_str+0x12f>
c00094fa:	83 ec 0c             	sub    $0xc,%esp
c00094fd:	68 6e bf 00 c0       	push   $0xc000bf6e
c0009502:	e8 da 02 00 00       	call   c00097e1 <Printf>
c0009507:	83 c4 10             	add    $0x10,%esp
c000950a:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0009510:	83 ec 08             	sub    $0x8,%esp
c0009513:	50                   	push   %eax
c0009514:	68 7a bf 00 c0       	push   $0xc000bf7a
c0009519:	e8 c3 02 00 00       	call   c00097e1 <Printf>
c000951e:	83 c4 10             	add    $0x10,%esp
c0009521:	83 ec 0c             	sub    $0xc,%esp
c0009524:	68 88 bf 00 c0       	push   $0xc000bf88
c0009529:	e8 b3 02 00 00       	call   c00097e1 <Printf>
c000952e:	83 c4 10             	add    $0x10,%esp
c0009531:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009538:	eb 26                	jmp    c0009560 <test_split_str+0x185>
c000953a:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0009540:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0009543:	01 d0                	add    %edx,%eax
c0009545:	0f b6 00             	movzbl (%eax),%eax
c0009548:	0f be c0             	movsbl %al,%eax
c000954b:	83 ec 08             	sub    $0x8,%esp
c000954e:	50                   	push   %eax
c000954f:	68 97 bf 00 c0       	push   $0xc000bf97
c0009554:	e8 88 02 00 00       	call   c00097e1 <Printf>
c0009559:	83 c4 10             	add    $0x10,%esp
c000955c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0009560:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0009564:	7e d4                	jle    c000953a <test_split_str+0x15f>
c0009566:	c9                   	leave  
c0009567:	c3                   	ret    

c0009568 <test_shell>:
c0009568:	55                   	push   %ebp
c0009569:	89 e5                	mov    %esp,%ebp
c000956b:	83 ec 38             	sub    $0x38,%esp
c000956e:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0009575:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c000957c:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0009582:	83 ec 08             	sub    $0x8,%esp
c0009585:	6a 02                	push   $0x2
c0009587:	8d 45 ea             	lea    -0x16(%ebp),%eax
c000958a:	50                   	push   %eax
c000958b:	e8 2e c5 ff ff       	call   c0005abe <open>
c0009590:	83 c4 10             	add    $0x10,%esp
c0009593:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009596:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c000959d:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c00095a4:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c00095ab:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00095b2:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c00095b9:	83 ec 0c             	sub    $0xc,%esp
c00095bc:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c00095bf:	50                   	push   %eax
c00095c0:	e8 f5 e5 ff ff       	call   c0007bba <untar>
c00095c5:	83 c4 10             	add    $0x10,%esp
c00095c8:	e8 10 fc ff ff       	call   c00091dd <simple_shell>
c00095cd:	90                   	nop
c00095ce:	c9                   	leave  
c00095cf:	c3                   	ret    

c00095d0 <test_exec>:
c00095d0:	55                   	push   %ebp
c00095d1:	89 e5                	mov    %esp,%ebp
c00095d3:	83 ec 38             	sub    $0x38,%esp
c00095d6:	83 ec 0c             	sub    $0xc,%esp
c00095d9:	68 d7 bd 00 c0       	push   $0xc000bdd7
c00095de:	e8 a9 7b ff ff       	call   c000118c <disp_str>
c00095e3:	83 c4 10             	add    $0x10,%esp
c00095e6:	83 ec 0c             	sub    $0xc,%esp
c00095e9:	68 d9 bd 00 c0       	push   $0xc000bdd9
c00095ee:	e8 99 7b ff ff       	call   c000118c <disp_str>
c00095f3:	83 c4 10             	add    $0x10,%esp
c00095f6:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c00095fd:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0009604:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c000960a:	83 ec 08             	sub    $0x8,%esp
c000960d:	6a 02                	push   $0x2
c000960f:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0009612:	50                   	push   %eax
c0009613:	e8 a6 c4 ff ff       	call   c0005abe <open>
c0009618:	83 c4 10             	add    $0x10,%esp
c000961b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000961e:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0009625:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c000962c:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0009633:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c000963a:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0009641:	83 ec 0c             	sub    $0xc,%esp
c0009644:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0009647:	50                   	push   %eax
c0009648:	e8 6d e5 ff ff       	call   c0007bba <untar>
c000964d:	83 c4 10             	add    $0x10,%esp
c0009650:	6a 00                	push   $0x0
c0009652:	68 a0 bf 00 c0       	push   $0xc000bfa0
c0009657:	68 69 bf 00 c0       	push   $0xc000bf69
c000965c:	68 a6 bf 00 c0       	push   $0xc000bfa6
c0009661:	e8 21 cb ff ff       	call   c0006187 <execl>
c0009666:	83 c4 10             	add    $0x10,%esp
c0009669:	eb fe                	jmp    c0009669 <test_exec+0x99>

c000966b <INIT>:
c000966b:	55                   	push   %ebp
c000966c:	89 e5                	mov    %esp,%ebp
c000966e:	83 ec 08             	sub    $0x8,%esp
c0009671:	e8 f2 fe ff ff       	call   c0009568 <test_shell>
c0009676:	eb fe                	jmp    c0009676 <INIT+0xb>

c0009678 <TestA>:
c0009678:	55                   	push   %ebp
c0009679:	89 e5                	mov    %esp,%ebp
c000967b:	83 ec 08             	sub    $0x8,%esp
c000967e:	83 ec 0c             	sub    $0xc,%esp
c0009681:	6a 05                	push   $0x5
c0009683:	e8 e8 e8 ff ff       	call   c0007f70 <disp_int>
c0009688:	83 c4 10             	add    $0x10,%esp
c000968b:	83 ec 0c             	sub    $0xc,%esp
c000968e:	68 cf ba 00 c0       	push   $0xc000bacf
c0009693:	e8 f4 7a ff ff       	call   c000118c <disp_str>
c0009698:	83 c4 10             	add    $0x10,%esp
c000969b:	83 ec 0c             	sub    $0xc,%esp
c000969e:	68 ac bf 00 c0       	push   $0xc000bfac
c00096a3:	e8 e4 7a ff ff       	call   c000118c <disp_str>
c00096a8:	83 c4 10             	add    $0x10,%esp
c00096ab:	eb fe                	jmp    c00096ab <TestA+0x33>

c00096ad <delay>:
c00096ad:	55                   	push   %ebp
c00096ae:	89 e5                	mov    %esp,%ebp
c00096b0:	83 ec 10             	sub    $0x10,%esp
c00096b3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00096ba:	eb 2a                	jmp    c00096e6 <delay+0x39>
c00096bc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00096c3:	eb 17                	jmp    c00096dc <delay+0x2f>
c00096c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00096cc:	eb 04                	jmp    c00096d2 <delay+0x25>
c00096ce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00096d2:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00096d6:	7e f6                	jle    c00096ce <delay+0x21>
c00096d8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00096dc:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c00096e0:	7e e3                	jle    c00096c5 <delay+0x18>
c00096e2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00096e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00096e9:	3b 45 08             	cmp    0x8(%ebp),%eax
c00096ec:	7c ce                	jl     c00096bc <delay+0xf>
c00096ee:	90                   	nop
c00096ef:	c9                   	leave  
c00096f0:	c3                   	ret    

c00096f1 <TestB>:
c00096f1:	55                   	push   %ebp
c00096f2:	89 e5                	mov    %esp,%ebp
c00096f4:	83 ec 08             	sub    $0x8,%esp
c00096f7:	83 ec 0c             	sub    $0xc,%esp
c00096fa:	68 b3 bf 00 c0       	push   $0xc000bfb3
c00096ff:	e8 88 7a ff ff       	call   c000118c <disp_str>
c0009704:	83 c4 10             	add    $0x10,%esp
c0009707:	eb fe                	jmp    c0009707 <TestB+0x16>

c0009709 <TestC>:
c0009709:	55                   	push   %ebp
c000970a:	89 e5                	mov    %esp,%ebp
c000970c:	83 ec 18             	sub    $0x18,%esp
c000970f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009716:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c000971a:	77 1a                	ja     c0009736 <TestC+0x2d>
c000971c:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0009723:	83 ec 08             	sub    $0x8,%esp
c0009726:	ff 75 f0             	pushl  -0x10(%ebp)
c0009729:	68 b6 bf 00 c0       	push   $0xc000bfb6
c000972e:	e8 ae 00 00 00       	call   c00097e1 <Printf>
c0009733:	83 c4 10             	add    $0x10,%esp
c0009736:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000973a:	eb da                	jmp    c0009716 <TestC+0xd>

c000973c <sys_get_ticks>:
c000973c:	55                   	push   %ebp
c000973d:	89 e5                	mov    %esp,%ebp
c000973f:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0009744:	8b 15 0c 1f 01 c0    	mov    0xc0011f0c,%edx
c000974a:	5d                   	pop    %ebp
c000974b:	c3                   	ret    

c000974c <sys_write>:
c000974c:	55                   	push   %ebp
c000974d:	89 e5                	mov    %esp,%ebp
c000974f:	83 ec 18             	sub    $0x18,%esp
c0009752:	8b 45 10             	mov    0x10(%ebp),%eax
c0009755:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c000975b:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009761:	05 20 0e 01 c0       	add    $0xc0010e20,%eax
c0009766:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009769:	8b 45 0c             	mov    0xc(%ebp),%eax
c000976c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000976f:	8b 45 08             	mov    0x8(%ebp),%eax
c0009772:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009775:	eb 20                	jmp    c0009797 <sys_write+0x4b>
c0009777:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000977a:	0f b6 00             	movzbl (%eax),%eax
c000977d:	0f b6 c0             	movzbl %al,%eax
c0009780:	83 ec 08             	sub    $0x8,%esp
c0009783:	50                   	push   %eax
c0009784:	ff 75 ec             	pushl  -0x14(%ebp)
c0009787:	e8 a3 b6 ff ff       	call   c0004e2f <out_char>
c000978c:	83 c4 10             	add    $0x10,%esp
c000978f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009793:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0009797:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000979b:	7f da                	jg     c0009777 <sys_write+0x2b>
c000979d:	90                   	nop
c000979e:	c9                   	leave  
c000979f:	c3                   	ret    

c00097a0 <milli_delay>:
c00097a0:	55                   	push   %ebp
c00097a1:	89 e5                	mov    %esp,%ebp
c00097a3:	83 ec 18             	sub    $0x18,%esp
c00097a6:	e8 58 0e 00 00       	call   c000a603 <get_ticks_ipc>
c00097ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00097ae:	90                   	nop
c00097af:	e8 4f 0e 00 00       	call   c000a603 <get_ticks_ipc>
c00097b4:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00097b7:	89 c1                	mov    %eax,%ecx
c00097b9:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c00097be:	89 c8                	mov    %ecx,%eax
c00097c0:	f7 ea                	imul   %edx
c00097c2:	c1 fa 05             	sar    $0x5,%edx
c00097c5:	89 c8                	mov    %ecx,%eax
c00097c7:	c1 f8 1f             	sar    $0x1f,%eax
c00097ca:	29 c2                	sub    %eax,%edx
c00097cc:	89 d0                	mov    %edx,%eax
c00097ce:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c00097d4:	39 45 08             	cmp    %eax,0x8(%ebp)
c00097d7:	77 d6                	ja     c00097af <milli_delay+0xf>
c00097d9:	90                   	nop
c00097da:	c9                   	leave  
c00097db:	c3                   	ret    

c00097dc <TaskSys>:
c00097dc:	55                   	push   %ebp
c00097dd:	89 e5                	mov    %esp,%ebp
c00097df:	eb fe                	jmp    c00097df <TaskSys+0x3>

c00097e1 <Printf>:
c00097e1:	55                   	push   %ebp
c00097e2:	89 e5                	mov    %esp,%ebp
c00097e4:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00097ea:	83 ec 04             	sub    $0x4,%esp
c00097ed:	68 00 01 00 00       	push   $0x100
c00097f2:	6a 00                	push   $0x0
c00097f4:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00097fa:	50                   	push   %eax
c00097fb:	e8 c7 2a 00 00       	call   c000c2c7 <Memset>
c0009800:	83 c4 10             	add    $0x10,%esp
c0009803:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009806:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009809:	8b 45 08             	mov    0x8(%ebp),%eax
c000980c:	83 ec 04             	sub    $0x4,%esp
c000980f:	ff 75 f4             	pushl  -0xc(%ebp)
c0009812:	50                   	push   %eax
c0009813:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009819:	50                   	push   %eax
c000981a:	e8 20 00 00 00       	call   c000983f <vsprintf>
c000981f:	83 c4 10             	add    $0x10,%esp
c0009822:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009825:	83 ec 04             	sub    $0x4,%esp
c0009828:	ff 75 f0             	pushl  -0x10(%ebp)
c000982b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009831:	50                   	push   %eax
c0009832:	6a 00                	push   $0x0
c0009834:	e8 9b c4 ff ff       	call   c0005cd4 <write>
c0009839:	83 c4 10             	add    $0x10,%esp
c000983c:	90                   	nop
c000983d:	c9                   	leave  
c000983e:	c3                   	ret    

c000983f <vsprintf>:
c000983f:	55                   	push   %ebp
c0009840:	89 e5                	mov    %esp,%ebp
c0009842:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0009848:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000984e:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0009854:	83 ec 04             	sub    $0x4,%esp
c0009857:	6a 40                	push   $0x40
c0009859:	6a 00                	push   $0x0
c000985b:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009861:	50                   	push   %eax
c0009862:	e8 60 2a 00 00       	call   c000c2c7 <Memset>
c0009867:	83 c4 10             	add    $0x10,%esp
c000986a:	8b 45 10             	mov    0x10(%ebp),%eax
c000986d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009870:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009877:	8b 45 08             	mov    0x8(%ebp),%eax
c000987a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000987d:	e9 53 01 00 00       	jmp    c00099d5 <vsprintf+0x196>
c0009882:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009885:	0f b6 00             	movzbl (%eax),%eax
c0009888:	3c 25                	cmp    $0x25,%al
c000988a:	74 16                	je     c00098a2 <vsprintf+0x63>
c000988c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000988f:	8d 50 01             	lea    0x1(%eax),%edx
c0009892:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009895:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009898:	0f b6 12             	movzbl (%edx),%edx
c000989b:	88 10                	mov    %dl,(%eax)
c000989d:	e9 2f 01 00 00       	jmp    c00099d1 <vsprintf+0x192>
c00098a2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00098a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00098a9:	0f b6 00             	movzbl (%eax),%eax
c00098ac:	0f be c0             	movsbl %al,%eax
c00098af:	83 f8 64             	cmp    $0x64,%eax
c00098b2:	74 26                	je     c00098da <vsprintf+0x9b>
c00098b4:	83 f8 64             	cmp    $0x64,%eax
c00098b7:	7f 0e                	jg     c00098c7 <vsprintf+0x88>
c00098b9:	83 f8 63             	cmp    $0x63,%eax
c00098bc:	0f 84 f2 00 00 00    	je     c00099b4 <vsprintf+0x175>
c00098c2:	e9 0a 01 00 00       	jmp    c00099d1 <vsprintf+0x192>
c00098c7:	83 f8 73             	cmp    $0x73,%eax
c00098ca:	0f 84 b0 00 00 00    	je     c0009980 <vsprintf+0x141>
c00098d0:	83 f8 78             	cmp    $0x78,%eax
c00098d3:	74 5d                	je     c0009932 <vsprintf+0xf3>
c00098d5:	e9 f7 00 00 00       	jmp    c00099d1 <vsprintf+0x192>
c00098da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00098dd:	8b 00                	mov    (%eax),%eax
c00098df:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00098e2:	83 ec 04             	sub    $0x4,%esp
c00098e5:	6a 0a                	push   $0xa
c00098e7:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c00098ed:	50                   	push   %eax
c00098ee:	ff 75 e8             	pushl  -0x18(%ebp)
c00098f1:	e8 64 0d 00 00       	call   c000a65a <itoa>
c00098f6:	83 c4 10             	add    $0x10,%esp
c00098f9:	83 ec 08             	sub    $0x8,%esp
c00098fc:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009902:	50                   	push   %eax
c0009903:	ff 75 f4             	pushl  -0xc(%ebp)
c0009906:	e8 db 29 00 00       	call   c000c2e6 <Strcpy>
c000990b:	83 c4 10             	add    $0x10,%esp
c000990e:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009912:	83 ec 0c             	sub    $0xc,%esp
c0009915:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000991b:	50                   	push   %eax
c000991c:	e8 df 29 00 00       	call   c000c300 <Strlen>
c0009921:	83 c4 10             	add    $0x10,%esp
c0009924:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009927:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000992a:	01 45 f4             	add    %eax,-0xc(%ebp)
c000992d:	e9 9f 00 00 00       	jmp    c00099d1 <vsprintf+0x192>
c0009932:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009935:	8b 00                	mov    (%eax),%eax
c0009937:	83 ec 08             	sub    $0x8,%esp
c000993a:	50                   	push   %eax
c000993b:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009941:	50                   	push   %eax
c0009942:	e8 83 e5 ff ff       	call   c0007eca <atoi>
c0009947:	83 c4 10             	add    $0x10,%esp
c000994a:	83 ec 08             	sub    $0x8,%esp
c000994d:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009953:	50                   	push   %eax
c0009954:	ff 75 f4             	pushl  -0xc(%ebp)
c0009957:	e8 8a 29 00 00       	call   c000c2e6 <Strcpy>
c000995c:	83 c4 10             	add    $0x10,%esp
c000995f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009963:	83 ec 0c             	sub    $0xc,%esp
c0009966:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000996c:	50                   	push   %eax
c000996d:	e8 8e 29 00 00       	call   c000c300 <Strlen>
c0009972:	83 c4 10             	add    $0x10,%esp
c0009975:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009978:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000997b:	01 45 f4             	add    %eax,-0xc(%ebp)
c000997e:	eb 51                	jmp    c00099d1 <vsprintf+0x192>
c0009980:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009983:	8b 00                	mov    (%eax),%eax
c0009985:	83 ec 08             	sub    $0x8,%esp
c0009988:	50                   	push   %eax
c0009989:	ff 75 f4             	pushl  -0xc(%ebp)
c000998c:	e8 55 29 00 00       	call   c000c2e6 <Strcpy>
c0009991:	83 c4 10             	add    $0x10,%esp
c0009994:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009997:	8b 00                	mov    (%eax),%eax
c0009999:	83 ec 0c             	sub    $0xc,%esp
c000999c:	50                   	push   %eax
c000999d:	e8 5e 29 00 00       	call   c000c300 <Strlen>
c00099a2:	83 c4 10             	add    $0x10,%esp
c00099a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00099a8:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00099ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099af:	01 45 f4             	add    %eax,-0xc(%ebp)
c00099b2:	eb 1d                	jmp    c00099d1 <vsprintf+0x192>
c00099b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099b7:	0f b6 10             	movzbl (%eax),%edx
c00099ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00099bd:	88 10                	mov    %dl,(%eax)
c00099bf:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00099c3:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00099ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099cd:	01 45 f4             	add    %eax,-0xc(%ebp)
c00099d0:	90                   	nop
c00099d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00099d5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00099d8:	0f b6 00             	movzbl (%eax),%eax
c00099db:	84 c0                	test   %al,%al
c00099dd:	0f 85 9f fe ff ff    	jne    c0009882 <vsprintf+0x43>
c00099e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00099e6:	2b 45 08             	sub    0x8(%ebp),%eax
c00099e9:	c9                   	leave  
c00099ea:	c3                   	ret    

c00099eb <printx>:
c00099eb:	55                   	push   %ebp
c00099ec:	89 e5                	mov    %esp,%ebp
c00099ee:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00099f4:	8d 45 0c             	lea    0xc(%ebp),%eax
c00099f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00099fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00099fd:	83 ec 04             	sub    $0x4,%esp
c0009a00:	ff 75 f4             	pushl  -0xc(%ebp)
c0009a03:	50                   	push   %eax
c0009a04:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009a0a:	50                   	push   %eax
c0009a0b:	e8 2f fe ff ff       	call   c000983f <vsprintf>
c0009a10:	83 c4 10             	add    $0x10,%esp
c0009a13:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a16:	83 ec 08             	sub    $0x8,%esp
c0009a19:	ff 75 f0             	pushl  -0x10(%ebp)
c0009a1c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009a22:	50                   	push   %eax
c0009a23:	e8 40 8b ff ff       	call   c0002568 <write_debug>
c0009a28:	83 c4 10             	add    $0x10,%esp
c0009a2b:	90                   	nop
c0009a2c:	c9                   	leave  
c0009a2d:	c3                   	ret    

c0009a2e <sys_printx>:
c0009a2e:	55                   	push   %ebp
c0009a2f:	89 e5                	mov    %esp,%ebp
c0009a31:	83 ec 28             	sub    $0x28,%esp
c0009a34:	a1 c4 07 01 c0       	mov    0xc00107c4,%eax
c0009a39:	85 c0                	test   %eax,%eax
c0009a3b:	75 15                	jne    c0009a52 <sys_printx+0x24>
c0009a3d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a40:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009a46:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009a49:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009a50:	eb 10                	jmp    c0009a62 <sys_printx+0x34>
c0009a52:	a1 c4 07 01 c0       	mov    0xc00107c4,%eax
c0009a57:	85 c0                	test   %eax,%eax
c0009a59:	74 07                	je     c0009a62 <sys_printx+0x34>
c0009a5b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009a62:	8b 55 08             	mov    0x8(%ebp),%edx
c0009a65:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a68:	01 d0                	add    %edx,%eax
c0009a6a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009a6d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a70:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009a76:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009a7c:	05 20 0e 01 c0       	add    $0xc0010e20,%eax
c0009a81:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009a84:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009a87:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009a8d:	0f b6 00             	movzbl (%eax),%eax
c0009a90:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0009a93:	eb 3a                	jmp    c0009acf <sys_printx+0xa1>
c0009a95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009a98:	0f b6 00             	movzbl (%eax),%eax
c0009a9b:	3c 3b                	cmp    $0x3b,%al
c0009a9d:	74 0a                	je     c0009aa9 <sys_printx+0x7b>
c0009a9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009aa2:	0f b6 00             	movzbl (%eax),%eax
c0009aa5:	3c 3a                	cmp    $0x3a,%al
c0009aa7:	75 06                	jne    c0009aaf <sys_printx+0x81>
c0009aa9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009aad:	eb 20                	jmp    c0009acf <sys_printx+0xa1>
c0009aaf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ab2:	0f b6 00             	movzbl (%eax),%eax
c0009ab5:	0f b6 c0             	movzbl %al,%eax
c0009ab8:	83 ec 08             	sub    $0x8,%esp
c0009abb:	50                   	push   %eax
c0009abc:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009abf:	e8 6b b3 ff ff       	call   c0004e2f <out_char>
c0009ac4:	83 c4 10             	add    $0x10,%esp
c0009ac7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009acb:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009acf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009ad3:	7f c0                	jg     c0009a95 <sys_printx+0x67>
c0009ad5:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009ad9:	75 10                	jne    c0009aeb <sys_printx+0xbd>
c0009adb:	a1 c4 07 01 c0       	mov    0xc00107c4,%eax
c0009ae0:	85 c0                	test   %eax,%eax
c0009ae2:	74 13                	je     c0009af7 <sys_printx+0xc9>
c0009ae4:	e8 d2 78 ff ff       	call   c00013bb <disable_int>
c0009ae9:	eb 0c                	jmp    c0009af7 <sys_printx+0xc9>
c0009aeb:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009aef:	75 06                	jne    c0009af7 <sys_printx+0xc9>
c0009af1:	e8 c5 78 ff ff       	call   c00013bb <disable_int>
c0009af6:	90                   	nop
c0009af7:	90                   	nop
c0009af8:	c9                   	leave  
c0009af9:	c3                   	ret    

c0009afa <spin>:
c0009afa:	55                   	push   %ebp
c0009afb:	89 e5                	mov    %esp,%ebp
c0009afd:	83 ec 08             	sub    $0x8,%esp
c0009b00:	83 ec 0c             	sub    $0xc,%esp
c0009b03:	ff 75 08             	pushl  0x8(%ebp)
c0009b06:	e8 81 76 ff ff       	call   c000118c <disp_str>
c0009b0b:	83 c4 10             	add    $0x10,%esp
c0009b0e:	83 ec 0c             	sub    $0xc,%esp
c0009b11:	68 cf ba 00 c0       	push   $0xc000bacf
c0009b16:	e8 71 76 ff ff       	call   c000118c <disp_str>
c0009b1b:	83 c4 10             	add    $0x10,%esp
c0009b1e:	eb fe                	jmp    c0009b1e <spin+0x24>

c0009b20 <panic>:
c0009b20:	55                   	push   %ebp
c0009b21:	89 e5                	mov    %esp,%ebp
c0009b23:	83 ec 08             	sub    $0x8,%esp
c0009b26:	83 ec 04             	sub    $0x4,%esp
c0009b29:	ff 75 08             	pushl  0x8(%ebp)
c0009b2c:	6a 3a                	push   $0x3a
c0009b2e:	68 c3 bf 00 c0       	push   $0xc000bfc3
c0009b33:	e8 b3 fe ff ff       	call   c00099eb <printx>
c0009b38:	83 c4 10             	add    $0x10,%esp
c0009b3b:	90                   	nop
c0009b3c:	c9                   	leave  
c0009b3d:	c3                   	ret    

c0009b3e <assertion_failure>:
c0009b3e:	55                   	push   %ebp
c0009b3f:	89 e5                	mov    %esp,%ebp
c0009b41:	83 ec 08             	sub    $0x8,%esp
c0009b44:	83 ec 08             	sub    $0x8,%esp
c0009b47:	ff 75 14             	pushl  0x14(%ebp)
c0009b4a:	ff 75 10             	pushl  0x10(%ebp)
c0009b4d:	ff 75 0c             	pushl  0xc(%ebp)
c0009b50:	ff 75 08             	pushl  0x8(%ebp)
c0009b53:	6a 3b                	push   $0x3b
c0009b55:	68 cc bf 00 c0       	push   $0xc000bfcc
c0009b5a:	e8 8c fe ff ff       	call   c00099eb <printx>
c0009b5f:	83 c4 20             	add    $0x20,%esp
c0009b62:	83 ec 0c             	sub    $0xc,%esp
c0009b65:	68 ff bf 00 c0       	push   $0xc000bfff
c0009b6a:	e8 8b ff ff ff       	call   c0009afa <spin>
c0009b6f:	83 c4 10             	add    $0x10,%esp
c0009b72:	90                   	nop
c0009b73:	c9                   	leave  
c0009b74:	c3                   	ret    

c0009b75 <dead_lock>:
c0009b75:	55                   	push   %ebp
c0009b76:	89 e5                	mov    %esp,%ebp
c0009b78:	b8 00 00 00 00       	mov    $0x0,%eax
c0009b7d:	5d                   	pop    %ebp
c0009b7e:	c3                   	ret    

c0009b7f <sys_send_msg>:
c0009b7f:	55                   	push   %ebp
c0009b80:	89 e5                	mov    %esp,%ebp
c0009b82:	83 ec 38             	sub    $0x38,%esp
c0009b85:	83 ec 0c             	sub    $0xc,%esp
c0009b88:	ff 75 0c             	pushl  0xc(%ebp)
c0009b8b:	e8 2c ac ff ff       	call   c00047bc <pid2proc>
c0009b90:	83 c4 10             	add    $0x10,%esp
c0009b93:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009b96:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009b9a:	74 2c                	je     c0009bc8 <sys_send_msg+0x49>
c0009b9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009b9f:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009ba5:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009baa:	74 1c                	je     c0009bc8 <sys_send_msg+0x49>
c0009bac:	68 fd 05 00 00       	push   $0x5fd
c0009bb1:	68 0b c0 00 c0       	push   $0xc000c00b
c0009bb6:	68 0b c0 00 c0       	push   $0xc000c00b
c0009bbb:	68 1c c0 00 c0       	push   $0xc000c01c
c0009bc0:	e8 79 ff ff ff       	call   c0009b3e <assertion_failure>
c0009bc5:	83 c4 10             	add    $0x10,%esp
c0009bc8:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bcb:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009bd1:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009bd6:	74 1c                	je     c0009bf4 <sys_send_msg+0x75>
c0009bd8:	68 ff 05 00 00       	push   $0x5ff
c0009bdd:	68 0b c0 00 c0       	push   $0xc000c00b
c0009be2:	68 0b c0 00 c0       	push   $0xc000c00b
c0009be7:	68 44 c0 00 c0       	push   $0xc000c044
c0009bec:	e8 4d ff ff ff       	call   c0009b3e <assertion_failure>
c0009bf1:	83 c4 10             	add    $0x10,%esp
c0009bf4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009bf8:	75 22                	jne    c0009c1c <sys_send_msg+0x9d>
c0009bfa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009bfe:	75 1c                	jne    c0009c1c <sys_send_msg+0x9d>
c0009c00:	68 02 06 00 00       	push   $0x602
c0009c05:	68 0b c0 00 c0       	push   $0xc000c00b
c0009c0a:	68 0b c0 00 c0       	push   $0xc000c00b
c0009c0f:	68 67 c0 00 c0       	push   $0xc000c067
c0009c14:	e8 25 ff ff ff       	call   c0009b3e <assertion_failure>
c0009c19:	83 c4 10             	add    $0x10,%esp
c0009c1c:	83 ec 0c             	sub    $0xc,%esp
c0009c1f:	ff 75 10             	pushl  0x10(%ebp)
c0009c22:	e8 07 ac ff ff       	call   c000482e <proc2pid>
c0009c27:	83 c4 10             	add    $0x10,%esp
c0009c2a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009c2d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c30:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009c36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009c39:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009c40:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c43:	83 ec 08             	sub    $0x8,%esp
c0009c46:	6a 7c                	push   $0x7c
c0009c48:	50                   	push   %eax
c0009c49:	e8 fd d1 ff ff       	call   c0006e4b <alloc_virtual_memory>
c0009c4e:	83 c4 10             	add    $0x10,%esp
c0009c51:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009c54:	c7 45 d8 7c 00 00 00 	movl   $0x7c,-0x28(%ebp)
c0009c5b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009c5e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009c61:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009c64:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009c67:	89 10                	mov    %edx,(%eax)
c0009c69:	83 ec 08             	sub    $0x8,%esp
c0009c6c:	ff 75 0c             	pushl  0xc(%ebp)
c0009c6f:	ff 75 e8             	pushl  -0x18(%ebp)
c0009c72:	e8 fe fe ff ff       	call   c0009b75 <dead_lock>
c0009c77:	83 c4 10             	add    $0x10,%esp
c0009c7a:	83 f8 01             	cmp    $0x1,%eax
c0009c7d:	75 10                	jne    c0009c8f <sys_send_msg+0x110>
c0009c7f:	83 ec 0c             	sub    $0xc,%esp
c0009c82:	68 77 c0 00 c0       	push   $0xc000c077
c0009c87:	e8 94 fe ff ff       	call   c0009b20 <panic>
c0009c8c:	83 c4 10             	add    $0x10,%esp
c0009c8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009c92:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009c99:	3c 02                	cmp    $0x2,%al
c0009c9b:	0f 85 99 01 00 00    	jne    c0009e3a <sys_send_msg+0x2bb>
c0009ca1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ca4:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009caa:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0009cad:	74 12                	je     c0009cc1 <sys_send_msg+0x142>
c0009caf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cb2:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009cb8:	83 f8 12             	cmp    $0x12,%eax
c0009cbb:	0f 85 79 01 00 00    	jne    c0009e3a <sys_send_msg+0x2bb>
c0009cc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cc4:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009cca:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009ccd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cd0:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009cd6:	83 ec 08             	sub    $0x8,%esp
c0009cd9:	6a 7c                	push   $0x7c
c0009cdb:	50                   	push   %eax
c0009cdc:	e8 6a d1 ff ff       	call   c0006e4b <alloc_virtual_memory>
c0009ce1:	83 c4 10             	add    $0x10,%esp
c0009ce4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009ce7:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009cea:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009ced:	83 ec 04             	sub    $0x4,%esp
c0009cf0:	ff 75 d8             	pushl  -0x28(%ebp)
c0009cf3:	52                   	push   %edx
c0009cf4:	50                   	push   %eax
c0009cf5:	e8 8d de ff ff       	call   c0007b87 <Memcpy>
c0009cfa:	83 c4 10             	add    $0x10,%esp
c0009cfd:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d00:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d07:	00 00 00 
c0009d0a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d0d:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009d14:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d17:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009d1e:	00 00 00 
c0009d21:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d24:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d2b:	00 00 00 
c0009d2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d31:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009d38:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d3b:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009d42:	00 00 00 
c0009d45:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d48:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009d4f:	00 00 00 
c0009d52:	83 ec 0c             	sub    $0xc,%esp
c0009d55:	ff 75 ec             	pushl  -0x14(%ebp)
c0009d58:	e8 56 08 00 00       	call   c000a5b3 <unblock>
c0009d5d:	83 c4 10             	add    $0x10,%esp
c0009d60:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d63:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009d6a:	84 c0                	test   %al,%al
c0009d6c:	74 1c                	je     c0009d8a <sys_send_msg+0x20b>
c0009d6e:	68 33 06 00 00       	push   $0x633
c0009d73:	68 0b c0 00 c0       	push   $0xc000c00b
c0009d78:	68 0b c0 00 c0       	push   $0xc000c00b
c0009d7d:	68 82 c0 00 c0       	push   $0xc000c082
c0009d82:	e8 b7 fd ff ff       	call   c0009b3e <assertion_failure>
c0009d87:	83 c4 10             	add    $0x10,%esp
c0009d8a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d8d:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d93:	83 f8 21             	cmp    $0x21,%eax
c0009d96:	74 1c                	je     c0009db4 <sys_send_msg+0x235>
c0009d98:	68 34 06 00 00       	push   $0x634
c0009d9d:	68 0b c0 00 c0       	push   $0xc000c00b
c0009da2:	68 0b c0 00 c0       	push   $0xc000c00b
c0009da7:	68 96 c0 00 c0       	push   $0xc000c096
c0009dac:	e8 8d fd ff ff       	call   c0009b3e <assertion_failure>
c0009db1:	83 c4 10             	add    $0x10,%esp
c0009db4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009db7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009dbd:	85 c0                	test   %eax,%eax
c0009dbf:	74 1c                	je     c0009ddd <sys_send_msg+0x25e>
c0009dc1:	68 36 06 00 00       	push   $0x636
c0009dc6:	68 0b c0 00 c0       	push   $0xc000c00b
c0009dcb:	68 0b c0 00 c0       	push   $0xc000c00b
c0009dd0:	68 b3 c0 00 c0       	push   $0xc000c0b3
c0009dd5:	e8 64 fd ff ff       	call   c0009b3e <assertion_failure>
c0009dda:	83 c4 10             	add    $0x10,%esp
c0009ddd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009de0:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009de7:	84 c0                	test   %al,%al
c0009de9:	74 1c                	je     c0009e07 <sys_send_msg+0x288>
c0009deb:	68 37 06 00 00       	push   $0x637
c0009df0:	68 0b c0 00 c0       	push   $0xc000c00b
c0009df5:	68 0b c0 00 c0       	push   $0xc000c00b
c0009dfa:	68 c8 c0 00 c0       	push   $0xc000c0c8
c0009dff:	e8 3a fd ff ff       	call   c0009b3e <assertion_failure>
c0009e04:	83 c4 10             	add    $0x10,%esp
c0009e07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e0a:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009e10:	83 f8 21             	cmp    $0x21,%eax
c0009e13:	0f 84 45 01 00 00    	je     c0009f5e <sys_send_msg+0x3df>
c0009e19:	68 38 06 00 00       	push   $0x638
c0009e1e:	68 0b c0 00 c0       	push   $0xc000c00b
c0009e23:	68 0b c0 00 c0       	push   $0xc000c00b
c0009e28:	68 e0 c0 00 c0       	push   $0xc000c0e0
c0009e2d:	e8 0c fd ff ff       	call   c0009b3e <assertion_failure>
c0009e32:	83 c4 10             	add    $0x10,%esp
c0009e35:	e9 24 01 00 00       	jmp    c0009f5e <sys_send_msg+0x3df>
c0009e3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009e41:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e44:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009e47:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e4a:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009e50:	85 c0                	test   %eax,%eax
c0009e52:	75 1b                	jne    c0009e6f <sys_send_msg+0x2f0>
c0009e54:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e57:	8b 55 10             	mov    0x10(%ebp),%edx
c0009e5a:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009e60:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e63:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009e6a:	00 00 00 
c0009e6d:	eb 3f                	jmp    c0009eae <sys_send_msg+0x32f>
c0009e6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e72:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009e78:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009e7b:	eb 12                	jmp    c0009e8f <sys_send_msg+0x310>
c0009e7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e80:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009e83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e86:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009e8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009e8f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009e93:	75 e8                	jne    c0009e7d <sys_send_msg+0x2fe>
c0009e95:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e98:	8b 55 10             	mov    0x10(%ebp),%edx
c0009e9b:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009ea1:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ea4:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009eab:	00 00 00 
c0009eae:	8b 45 10             	mov    0x10(%ebp),%eax
c0009eb1:	8b 55 08             	mov    0x8(%ebp),%edx
c0009eb4:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009eba:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ebd:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009ec0:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009ec6:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ec9:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c0009ed0:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ed3:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009eda:	3c 01                	cmp    $0x1,%al
c0009edc:	74 1c                	je     c0009efa <sys_send_msg+0x37b>
c0009ede:	68 59 06 00 00       	push   $0x659
c0009ee3:	68 0b c0 00 c0       	push   $0xc000c00b
c0009ee8:	68 0b c0 00 c0       	push   $0xc000c00b
c0009eed:	68 04 c1 00 c0       	push   $0xc000c104
c0009ef2:	e8 47 fc ff ff       	call   c0009b3e <assertion_failure>
c0009ef7:	83 c4 10             	add    $0x10,%esp
c0009efa:	8b 45 10             	mov    0x10(%ebp),%eax
c0009efd:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009f03:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0009f06:	74 1c                	je     c0009f24 <sys_send_msg+0x3a5>
c0009f08:	68 5a 06 00 00       	push   $0x65a
c0009f0d:	68 0b c0 00 c0       	push   $0xc000c00b
c0009f12:	68 0b c0 00 c0       	push   $0xc000c00b
c0009f17:	68 20 c1 00 c0       	push   $0xc000c120
c0009f1c:	e8 1d fc ff ff       	call   c0009b3e <assertion_failure>
c0009f21:	83 c4 10             	add    $0x10,%esp
c0009f24:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f27:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009f2d:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009f30:	74 1c                	je     c0009f4e <sys_send_msg+0x3cf>
c0009f32:	68 5b 06 00 00       	push   $0x65b
c0009f37:	68 0b c0 00 c0       	push   $0xc000c00b
c0009f3c:	68 0b c0 00 c0       	push   $0xc000c00b
c0009f41:	68 42 c1 00 c0       	push   $0xc000c142
c0009f46:	e8 f3 fb ff ff       	call   c0009b3e <assertion_failure>
c0009f4b:	83 c4 10             	add    $0x10,%esp
c0009f4e:	83 ec 0c             	sub    $0xc,%esp
c0009f51:	ff 75 10             	pushl  0x10(%ebp)
c0009f54:	e8 1e 06 00 00       	call   c000a577 <block>
c0009f59:	83 c4 10             	add    $0x10,%esp
c0009f5c:	eb 01                	jmp    c0009f5f <sys_send_msg+0x3e0>
c0009f5e:	90                   	nop
c0009f5f:	b8 00 00 00 00       	mov    $0x0,%eax
c0009f64:	c9                   	leave  
c0009f65:	c3                   	ret    

c0009f66 <sys_receive_msg>:
c0009f66:	55                   	push   %ebp
c0009f67:	89 e5                	mov    %esp,%ebp
c0009f69:	83 ec 48             	sub    $0x48,%esp
c0009f6c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009f73:	83 ec 0c             	sub    $0xc,%esp
c0009f76:	ff 75 0c             	pushl  0xc(%ebp)
c0009f79:	e8 3e a8 ff ff       	call   c00047bc <pid2proc>
c0009f7e:	83 c4 10             	add    $0x10,%esp
c0009f81:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009f84:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0009f88:	74 2c                	je     c0009fb6 <sys_receive_msg+0x50>
c0009f8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009f8d:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009f93:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009f98:	74 1c                	je     c0009fb6 <sys_receive_msg+0x50>
c0009f9a:	68 6f 06 00 00       	push   $0x66f
c0009f9f:	68 0b c0 00 c0       	push   $0xc000c00b
c0009fa4:	68 0b c0 00 c0       	push   $0xc000c00b
c0009fa9:	68 44 c0 00 c0       	push   $0xc000c044
c0009fae:	e8 8b fb ff ff       	call   c0009b3e <assertion_failure>
c0009fb3:	83 c4 10             	add    $0x10,%esp
c0009fb6:	8b 45 10             	mov    0x10(%ebp),%eax
c0009fb9:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009fbf:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009fc4:	74 1c                	je     c0009fe2 <sys_receive_msg+0x7c>
c0009fc6:	68 71 06 00 00       	push   $0x671
c0009fcb:	68 0b c0 00 c0       	push   $0xc000c00b
c0009fd0:	68 0b c0 00 c0       	push   $0xc000c00b
c0009fd5:	68 1c c0 00 c0       	push   $0xc000c01c
c0009fda:	e8 5f fb ff ff       	call   c0009b3e <assertion_failure>
c0009fdf:	83 c4 10             	add    $0x10,%esp
c0009fe2:	83 ec 0c             	sub    $0xc,%esp
c0009fe5:	ff 75 10             	pushl  0x10(%ebp)
c0009fe8:	e8 41 a8 ff ff       	call   c000482e <proc2pid>
c0009fed:	83 c4 10             	add    $0x10,%esp
c0009ff0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009ff3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0009ffa:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ffd:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c000a003:	85 c0                	test   %eax,%eax
c000a005:	0f 84 c6 00 00 00    	je     c000a0d1 <sys_receive_msg+0x16b>
c000a00b:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a00f:	74 0d                	je     c000a01e <sys_receive_msg+0xb8>
c000a011:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c000a018:	0f 85 b3 00 00 00    	jne    c000a0d1 <sys_receive_msg+0x16b>
c000a01e:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c000a025:	83 ec 0c             	sub    $0xc,%esp
c000a028:	ff 75 dc             	pushl  -0x24(%ebp)
c000a02b:	e8 94 85 ff ff       	call   c00025c4 <sys_malloc>
c000a030:	83 c4 10             	add    $0x10,%esp
c000a033:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a036:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a039:	83 ec 04             	sub    $0x4,%esp
c000a03c:	50                   	push   %eax
c000a03d:	6a 00                	push   $0x0
c000a03f:	ff 75 d8             	pushl  -0x28(%ebp)
c000a042:	e8 80 22 00 00       	call   c000c2c7 <Memset>
c000a047:	83 c4 10             	add    $0x10,%esp
c000a04a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a04d:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a053:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a056:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c000a05d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a060:	83 ec 08             	sub    $0x8,%esp
c000a063:	ff 75 dc             	pushl  -0x24(%ebp)
c000a066:	50                   	push   %eax
c000a067:	e8 df cd ff ff       	call   c0006e4b <alloc_virtual_memory>
c000a06c:	83 c4 10             	add    $0x10,%esp
c000a06f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a072:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000a075:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000a078:	83 ec 04             	sub    $0x4,%esp
c000a07b:	52                   	push   %edx
c000a07c:	ff 75 d8             	pushl  -0x28(%ebp)
c000a07f:	50                   	push   %eax
c000a080:	e8 02 db ff ff       	call   c0007b87 <Memcpy>
c000a085:	83 c4 10             	add    $0x10,%esp
c000a088:	8b 45 10             	mov    0x10(%ebp),%eax
c000a08b:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a092:	00 00 00 
c000a095:	8b 45 10             	mov    0x10(%ebp),%eax
c000a098:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a09f:	00 00 00 
c000a0a2:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0a5:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a0ac:	00 00 00 
c000a0af:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0b2:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a0b9:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000a0c0:	83 ec 08             	sub    $0x8,%esp
c000a0c3:	ff 75 dc             	pushl  -0x24(%ebp)
c000a0c6:	ff 75 d8             	pushl  -0x28(%ebp)
c000a0c9:	e8 0b 85 ff ff       	call   c00025d9 <sys_free>
c000a0ce:	83 c4 10             	add    $0x10,%esp
c000a0d1:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000a0d5:	0f 84 96 03 00 00    	je     c000a471 <sys_receive_msg+0x50b>
c000a0db:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a0df:	75 26                	jne    c000a107 <sys_receive_msg+0x1a1>
c000a0e1:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0e4:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a0ea:	85 c0                	test   %eax,%eax
c000a0ec:	0f 84 8a 00 00 00    	je     c000a17c <sys_receive_msg+0x216>
c000a0f2:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0f5:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a0fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0fe:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a105:	eb 75                	jmp    c000a17c <sys_receive_msg+0x216>
c000a107:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a10b:	78 6f                	js     c000a17c <sys_receive_msg+0x216>
c000a10d:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c000a111:	7f 69                	jg     c000a17c <sys_receive_msg+0x216>
c000a113:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a116:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a11d:	3c 01                	cmp    $0x1,%al
c000a11f:	75 5b                	jne    c000a17c <sys_receive_msg+0x216>
c000a121:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a124:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a12a:	83 f8 12             	cmp    $0x12,%eax
c000a12d:	74 0e                	je     c000a13d <sys_receive_msg+0x1d7>
c000a12f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a132:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a138:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c000a13b:	75 3f                	jne    c000a17c <sys_receive_msg+0x216>
c000a13d:	8b 45 10             	mov    0x10(%ebp),%eax
c000a140:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a146:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a149:	eb 2b                	jmp    c000a176 <sys_receive_msg+0x210>
c000a14b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a14e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a151:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a154:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c000a15a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a15d:	39 c2                	cmp    %eax,%edx
c000a15f:	75 09                	jne    c000a16a <sys_receive_msg+0x204>
c000a161:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a168:	eb 12                	jmp    c000a17c <sys_receive_msg+0x216>
c000a16a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a16d:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c000a173:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a176:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a17a:	75 cf                	jne    c000a14b <sys_receive_msg+0x1e5>
c000a17c:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000a180:	0f 85 21 02 00 00    	jne    c000a3a7 <sys_receive_msg+0x441>
c000a186:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a189:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a18c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a18f:	83 ec 08             	sub    $0x8,%esp
c000a192:	6a 7c                	push   $0x7c
c000a194:	50                   	push   %eax
c000a195:	e8 b1 cc ff ff       	call   c0006e4b <alloc_virtual_memory>
c000a19a:	83 c4 10             	add    $0x10,%esp
c000a19d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a1a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a1a3:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a1a9:	83 ec 08             	sub    $0x8,%esp
c000a1ac:	6a 7c                	push   $0x7c
c000a1ae:	50                   	push   %eax
c000a1af:	e8 97 cc ff ff       	call   c0006e4b <alloc_virtual_memory>
c000a1b4:	83 c4 10             	add    $0x10,%esp
c000a1b7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a1ba:	83 ec 04             	sub    $0x4,%esp
c000a1bd:	6a 7c                	push   $0x7c
c000a1bf:	ff 75 c8             	pushl  -0x38(%ebp)
c000a1c2:	ff 75 cc             	pushl  -0x34(%ebp)
c000a1c5:	e8 bd d9 ff ff       	call   c0007b87 <Memcpy>
c000a1ca:	83 c4 10             	add    $0x10,%esp
c000a1cd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a1d0:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a1d3:	8b 45 10             	mov    0x10(%ebp),%eax
c000a1d6:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a1dc:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000a1df:	75 21                	jne    c000a202 <sys_receive_msg+0x29c>
c000a1e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1e4:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a1ea:	8b 45 10             	mov    0x10(%ebp),%eax
c000a1ed:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000a1f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1f6:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a1fd:	00 00 00 
c000a200:	eb 1f                	jmp    c000a221 <sys_receive_msg+0x2bb>
c000a202:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a205:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a20b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a20e:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000a214:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a217:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a21e:	00 00 00 
c000a221:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a224:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a22b:	00 00 00 
c000a22e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a231:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a238:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a23b:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a242:	00 00 00 
c000a245:	8b 45 10             	mov    0x10(%ebp),%eax
c000a248:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a24f:	00 00 00 
c000a252:	8b 45 10             	mov    0x10(%ebp),%eax
c000a255:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a25c:	00 00 00 
c000a25f:	8b 45 10             	mov    0x10(%ebp),%eax
c000a262:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a269:	00 00 00 
c000a26c:	83 ec 0c             	sub    $0xc,%esp
c000a26f:	ff 75 d0             	pushl  -0x30(%ebp)
c000a272:	e8 3c 03 00 00       	call   c000a5b3 <unblock>
c000a277:	83 c4 10             	add    $0x10,%esp
c000a27a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a27d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a283:	85 c0                	test   %eax,%eax
c000a285:	74 1c                	je     c000a2a3 <sys_receive_msg+0x33d>
c000a287:	68 db 06 00 00       	push   $0x6db
c000a28c:	68 0b c0 00 c0       	push   $0xc000c00b
c000a291:	68 0b c0 00 c0       	push   $0xc000c00b
c000a296:	68 57 c1 00 c0       	push   $0xc000c157
c000a29b:	e8 9e f8 ff ff       	call   c0009b3e <assertion_failure>
c000a2a0:	83 c4 10             	add    $0x10,%esp
c000a2a3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a2a6:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a2ad:	84 c0                	test   %al,%al
c000a2af:	74 1c                	je     c000a2cd <sys_receive_msg+0x367>
c000a2b1:	68 dc 06 00 00       	push   $0x6dc
c000a2b6:	68 0b c0 00 c0       	push   $0xc000c00b
c000a2bb:	68 0b c0 00 c0       	push   $0xc000c00b
c000a2c0:	68 6f c1 00 c0       	push   $0xc000c16f
c000a2c5:	e8 74 f8 ff ff       	call   c0009b3e <assertion_failure>
c000a2ca:	83 c4 10             	add    $0x10,%esp
c000a2cd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a2d0:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a2d6:	83 f8 21             	cmp    $0x21,%eax
c000a2d9:	74 1c                	je     c000a2f7 <sys_receive_msg+0x391>
c000a2db:	68 dd 06 00 00       	push   $0x6dd
c000a2e0:	68 0b c0 00 c0       	push   $0xc000c00b
c000a2e5:	68 0b c0 00 c0       	push   $0xc000c00b
c000a2ea:	68 88 c1 00 c0       	push   $0xc000c188
c000a2ef:	e8 4a f8 ff ff       	call   c0009b3e <assertion_failure>
c000a2f4:	83 c4 10             	add    $0x10,%esp
c000a2f7:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2fa:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a300:	85 c0                	test   %eax,%eax
c000a302:	74 1c                	je     c000a320 <sys_receive_msg+0x3ba>
c000a304:	68 df 06 00 00       	push   $0x6df
c000a309:	68 0b c0 00 c0       	push   $0xc000c00b
c000a30e:	68 0b c0 00 c0       	push   $0xc000c00b
c000a313:	68 b3 c0 00 c0       	push   $0xc000c0b3
c000a318:	e8 21 f8 ff ff       	call   c0009b3e <assertion_failure>
c000a31d:	83 c4 10             	add    $0x10,%esp
c000a320:	8b 45 10             	mov    0x10(%ebp),%eax
c000a323:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a32a:	84 c0                	test   %al,%al
c000a32c:	74 1c                	je     c000a34a <sys_receive_msg+0x3e4>
c000a32e:	68 e0 06 00 00       	push   $0x6e0
c000a333:	68 0b c0 00 c0       	push   $0xc000c00b
c000a338:	68 0b c0 00 c0       	push   $0xc000c00b
c000a33d:	68 c8 c0 00 c0       	push   $0xc000c0c8
c000a342:	e8 f7 f7 ff ff       	call   c0009b3e <assertion_failure>
c000a347:	83 c4 10             	add    $0x10,%esp
c000a34a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a34d:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a353:	83 f8 21             	cmp    $0x21,%eax
c000a356:	74 1c                	je     c000a374 <sys_receive_msg+0x40e>
c000a358:	68 e1 06 00 00       	push   $0x6e1
c000a35d:	68 0b c0 00 c0       	push   $0xc000c00b
c000a362:	68 0b c0 00 c0       	push   $0xc000c00b
c000a367:	68 e0 c0 00 c0       	push   $0xc000c0e0
c000a36c:	e8 cd f7 ff ff       	call   c0009b3e <assertion_failure>
c000a371:	83 c4 10             	add    $0x10,%esp
c000a374:	8b 45 10             	mov    0x10(%ebp),%eax
c000a377:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a37d:	83 f8 21             	cmp    $0x21,%eax
c000a380:	0f 84 e4 00 00 00    	je     c000a46a <sys_receive_msg+0x504>
c000a386:	68 e2 06 00 00       	push   $0x6e2
c000a38b:	68 0b c0 00 c0       	push   $0xc000c00b
c000a390:	68 0b c0 00 c0       	push   $0xc000c00b
c000a395:	68 ac c1 00 c0       	push   $0xc000c1ac
c000a39a:	e8 9f f7 ff ff       	call   c0009b3e <assertion_failure>
c000a39f:	83 c4 10             	add    $0x10,%esp
c000a3a2:	e9 c3 00 00 00       	jmp    c000a46a <sys_receive_msg+0x504>
c000a3a7:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3aa:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c000a3b1:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3b4:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a3bb:	3c 02                	cmp    $0x2,%al
c000a3bd:	74 1c                	je     c000a3db <sys_receive_msg+0x475>
c000a3bf:	68 e7 06 00 00       	push   $0x6e7
c000a3c4:	68 0b c0 00 c0       	push   $0xc000c00b
c000a3c9:	68 0b c0 00 c0       	push   $0xc000c00b
c000a3ce:	68 cb c1 00 c0       	push   $0xc000c1cb
c000a3d3:	e8 66 f7 ff ff       	call   c0009b3e <assertion_failure>
c000a3d8:	83 c4 10             	add    $0x10,%esp
c000a3db:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3de:	8b 55 08             	mov    0x8(%ebp),%edx
c000a3e1:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c000a3e7:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3ea:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a3f1:	3c 02                	cmp    $0x2,%al
c000a3f3:	74 1c                	je     c000a411 <sys_receive_msg+0x4ab>
c000a3f5:	68 e9 06 00 00       	push   $0x6e9
c000a3fa:	68 0b c0 00 c0       	push   $0xc000c00b
c000a3ff:	68 0b c0 00 c0       	push   $0xc000c00b
c000a404:	68 cb c1 00 c0       	push   $0xc000c1cb
c000a409:	e8 30 f7 ff ff       	call   c0009b3e <assertion_failure>
c000a40e:	83 c4 10             	add    $0x10,%esp
c000a411:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a415:	75 0f                	jne    c000a426 <sys_receive_msg+0x4c0>
c000a417:	8b 45 10             	mov    0x10(%ebp),%eax
c000a41a:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c000a421:	00 00 00 
c000a424:	eb 0c                	jmp    c000a432 <sys_receive_msg+0x4cc>
c000a426:	8b 45 10             	mov    0x10(%ebp),%eax
c000a429:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a42c:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c000a432:	8b 45 10             	mov    0x10(%ebp),%eax
c000a435:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a43c:	3c 02                	cmp    $0x2,%al
c000a43e:	74 1c                	je     c000a45c <sys_receive_msg+0x4f6>
c000a440:	68 f4 06 00 00       	push   $0x6f4
c000a445:	68 0b c0 00 c0       	push   $0xc000c00b
c000a44a:	68 0b c0 00 c0       	push   $0xc000c00b
c000a44f:	68 cb c1 00 c0       	push   $0xc000c1cb
c000a454:	e8 e5 f6 ff ff       	call   c0009b3e <assertion_failure>
c000a459:	83 c4 10             	add    $0x10,%esp
c000a45c:	83 ec 0c             	sub    $0xc,%esp
c000a45f:	ff 75 10             	pushl  0x10(%ebp)
c000a462:	e8 10 01 00 00       	call   c000a577 <block>
c000a467:	83 c4 10             	add    $0x10,%esp
c000a46a:	b8 00 00 00 00       	mov    $0x0,%eax
c000a46f:	eb 02                	jmp    c000a473 <sys_receive_msg+0x50d>
c000a471:	90                   	nop
c000a472:	90                   	nop
c000a473:	c9                   	leave  
c000a474:	c3                   	ret    

c000a475 <disp_str_colour_debug>:
c000a475:	55                   	push   %ebp
c000a476:	89 e5                	mov    %esp,%ebp
c000a478:	90                   	nop
c000a479:	5d                   	pop    %ebp
c000a47a:	c3                   	ret    

c000a47b <send_rec>:
c000a47b:	55                   	push   %ebp
c000a47c:	89 e5                	mov    %esp,%ebp
c000a47e:	83 ec 18             	sub    $0x18,%esp
c000a481:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a484:	83 ec 0c             	sub    $0xc,%esp
c000a487:	50                   	push   %eax
c000a488:	e8 8c ca ff ff       	call   c0006f19 <get_physical_address>
c000a48d:	83 c4 10             	add    $0x10,%esp
c000a490:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a493:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a497:	74 28                	je     c000a4c1 <send_rec+0x46>
c000a499:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a49d:	74 22                	je     c000a4c1 <send_rec+0x46>
c000a49f:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a4a3:	74 1c                	je     c000a4c1 <send_rec+0x46>
c000a4a5:	68 14 07 00 00       	push   $0x714
c000a4aa:	68 0b c0 00 c0       	push   $0xc000c00b
c000a4af:	68 0b c0 00 c0       	push   $0xc000c00b
c000a4b4:	68 ec c1 00 c0       	push   $0xc000c1ec
c000a4b9:	e8 80 f6 ff ff       	call   c0009b3e <assertion_failure>
c000a4be:	83 c4 10             	add    $0x10,%esp
c000a4c1:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a4c5:	75 12                	jne    c000a4d9 <send_rec+0x5e>
c000a4c7:	83 ec 04             	sub    $0x4,%esp
c000a4ca:	6a 7c                	push   $0x7c
c000a4cc:	6a 00                	push   $0x0
c000a4ce:	ff 75 0c             	pushl  0xc(%ebp)
c000a4d1:	e8 f1 1d 00 00       	call   c000c2c7 <Memset>
c000a4d6:	83 c4 10             	add    $0x10,%esp
c000a4d9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a4dd:	74 23                	je     c000a502 <send_rec+0x87>
c000a4df:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a4e3:	74 34                	je     c000a519 <send_rec+0x9e>
c000a4e5:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a4e9:	75 72                	jne    c000a55d <send_rec+0xe2>
c000a4eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4ee:	83 ec 08             	sub    $0x8,%esp
c000a4f1:	ff 75 10             	pushl  0x10(%ebp)
c000a4f4:	50                   	push   %eax
c000a4f5:	e8 8e 80 ff ff       	call   c0002588 <send_msg>
c000a4fa:	83 c4 10             	add    $0x10,%esp
c000a4fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a500:	eb 6e                	jmp    c000a570 <send_rec+0xf5>
c000a502:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a505:	83 ec 08             	sub    $0x8,%esp
c000a508:	ff 75 10             	pushl  0x10(%ebp)
c000a50b:	50                   	push   %eax
c000a50c:	e8 9d 80 ff ff       	call   c00025ae <receive_msg>
c000a511:	83 c4 10             	add    $0x10,%esp
c000a514:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a517:	eb 57                	jmp    c000a570 <send_rec+0xf5>
c000a519:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a51c:	83 ec 08             	sub    $0x8,%esp
c000a51f:	ff 75 10             	pushl  0x10(%ebp)
c000a522:	50                   	push   %eax
c000a523:	e8 60 80 ff ff       	call   c0002588 <send_msg>
c000a528:	83 c4 10             	add    $0x10,%esp
c000a52b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a52e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a532:	75 3b                	jne    c000a56f <send_rec+0xf4>
c000a534:	83 ec 04             	sub    $0x4,%esp
c000a537:	6a 7c                	push   $0x7c
c000a539:	6a 00                	push   $0x0
c000a53b:	ff 75 0c             	pushl  0xc(%ebp)
c000a53e:	e8 84 1d 00 00       	call   c000c2c7 <Memset>
c000a543:	83 c4 10             	add    $0x10,%esp
c000a546:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a549:	83 ec 08             	sub    $0x8,%esp
c000a54c:	ff 75 10             	pushl  0x10(%ebp)
c000a54f:	50                   	push   %eax
c000a550:	e8 59 80 ff ff       	call   c00025ae <receive_msg>
c000a555:	83 c4 10             	add    $0x10,%esp
c000a558:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a55b:	eb 12                	jmp    c000a56f <send_rec+0xf4>
c000a55d:	83 ec 0c             	sub    $0xc,%esp
c000a560:	68 28 c2 00 c0       	push   $0xc000c228
c000a565:	e8 b6 f5 ff ff       	call   c0009b20 <panic>
c000a56a:	83 c4 10             	add    $0x10,%esp
c000a56d:	eb 01                	jmp    c000a570 <send_rec+0xf5>
c000a56f:	90                   	nop
c000a570:	b8 00 00 00 00       	mov    $0x0,%eax
c000a575:	c9                   	leave  
c000a576:	c3                   	ret    

c000a577 <block>:
c000a577:	55                   	push   %ebp
c000a578:	89 e5                	mov    %esp,%ebp
c000a57a:	83 ec 08             	sub    $0x8,%esp
c000a57d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a580:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a587:	84 c0                	test   %al,%al
c000a589:	75 1c                	jne    c000a5a7 <block+0x30>
c000a58b:	68 43 07 00 00       	push   $0x743
c000a590:	68 0b c0 00 c0       	push   $0xc000c00b
c000a595:	68 0b c0 00 c0       	push   $0xc000c00b
c000a59a:	68 3d c2 00 c0       	push   $0xc000c23d
c000a59f:	e8 9a f5 ff ff       	call   c0009b3e <assertion_failure>
c000a5a4:	83 c4 10             	add    $0x10,%esp
c000a5a7:	e8 9b a0 ff ff       	call   c0004647 <schedule_process>
c000a5ac:	b8 00 00 00 00       	mov    $0x0,%eax
c000a5b1:	c9                   	leave  
c000a5b2:	c3                   	ret    

c000a5b3 <unblock>:
c000a5b3:	55                   	push   %ebp
c000a5b4:	89 e5                	mov    %esp,%ebp
c000a5b6:	83 ec 08             	sub    $0x8,%esp
c000a5b9:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5bc:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a5c3:	84 c0                	test   %al,%al
c000a5c5:	74 1c                	je     c000a5e3 <unblock+0x30>
c000a5c7:	68 4c 07 00 00       	push   $0x74c
c000a5cc:	68 0b c0 00 c0       	push   $0xc000c00b
c000a5d1:	68 0b c0 00 c0       	push   $0xc000c00b
c000a5d6:	68 55 c2 00 c0       	push   $0xc000c255
c000a5db:	e8 5e f5 ff ff       	call   c0009b3e <assertion_failure>
c000a5e0:	83 c4 10             	add    $0x10,%esp
c000a5e3:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5e6:	05 00 01 00 00       	add    $0x100,%eax
c000a5eb:	83 ec 08             	sub    $0x8,%esp
c000a5ee:	50                   	push   %eax
c000a5ef:	68 0c 0e 01 c0       	push   $0xc0010e0c
c000a5f4:	e8 57 0a 00 00       	call   c000b050 <appendToDoubleLinkList>
c000a5f9:	83 c4 10             	add    $0x10,%esp
c000a5fc:	b8 00 00 00 00       	mov    $0x0,%eax
c000a601:	c9                   	leave  
c000a602:	c3                   	ret    

c000a603 <get_ticks_ipc>:
c000a603:	55                   	push   %ebp
c000a604:	89 e5                	mov    %esp,%ebp
c000a606:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000a60c:	83 ec 04             	sub    $0x4,%esp
c000a60f:	6a 7c                	push   $0x7c
c000a611:	6a 00                	push   $0x0
c000a613:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a619:	50                   	push   %eax
c000a61a:	e8 a8 1c 00 00       	call   c000c2c7 <Memset>
c000a61f:	83 c4 10             	add    $0x10,%esp
c000a622:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c000a629:	00 00 00 
c000a62c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a633:	83 ec 04             	sub    $0x4,%esp
c000a636:	6a 01                	push   $0x1
c000a638:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a63e:	50                   	push   %eax
c000a63f:	6a 03                	push   $0x3
c000a641:	e8 35 fe ff ff       	call   c000a47b <send_rec>
c000a646:	83 c4 10             	add    $0x10,%esp
c000a649:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a64c:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c000a652:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a655:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a658:	c9                   	leave  
c000a659:	c3                   	ret    

c000a65a <itoa>:
c000a65a:	55                   	push   %ebp
c000a65b:	89 e5                	mov    %esp,%ebp
c000a65d:	53                   	push   %ebx
c000a65e:	83 ec 14             	sub    $0x14,%esp
c000a661:	8b 45 08             	mov    0x8(%ebp),%eax
c000a664:	99                   	cltd   
c000a665:	f7 7d 10             	idivl  0x10(%ebp)
c000a668:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a66b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a66e:	99                   	cltd   
c000a66f:	f7 7d 10             	idivl  0x10(%ebp)
c000a672:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a675:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a679:	74 14                	je     c000a68f <itoa+0x35>
c000a67b:	83 ec 04             	sub    $0x4,%esp
c000a67e:	ff 75 10             	pushl  0x10(%ebp)
c000a681:	ff 75 0c             	pushl  0xc(%ebp)
c000a684:	ff 75 f0             	pushl  -0x10(%ebp)
c000a687:	e8 ce ff ff ff       	call   c000a65a <itoa>
c000a68c:	83 c4 10             	add    $0x10,%esp
c000a68f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a692:	8d 58 30             	lea    0x30(%eax),%ebx
c000a695:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a698:	8b 00                	mov    (%eax),%eax
c000a69a:	8d 48 01             	lea    0x1(%eax),%ecx
c000a69d:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a6a0:	89 0a                	mov    %ecx,(%edx)
c000a6a2:	89 da                	mov    %ebx,%edx
c000a6a4:	88 10                	mov    %dl,(%eax)
c000a6a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a6a9:	8b 00                	mov    (%eax),%eax
c000a6ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a6ae:	c9                   	leave  
c000a6af:	c3                   	ret    

c000a6b0 <i2a>:
c000a6b0:	55                   	push   %ebp
c000a6b1:	89 e5                	mov    %esp,%ebp
c000a6b3:	53                   	push   %ebx
c000a6b4:	83 ec 14             	sub    $0x14,%esp
c000a6b7:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6ba:	99                   	cltd   
c000a6bb:	f7 7d 0c             	idivl  0xc(%ebp)
c000a6be:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a6c1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6c4:	99                   	cltd   
c000a6c5:	f7 7d 0c             	idivl  0xc(%ebp)
c000a6c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a6cb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a6cf:	74 14                	je     c000a6e5 <i2a+0x35>
c000a6d1:	83 ec 04             	sub    $0x4,%esp
c000a6d4:	ff 75 10             	pushl  0x10(%ebp)
c000a6d7:	ff 75 0c             	pushl  0xc(%ebp)
c000a6da:	ff 75 f0             	pushl  -0x10(%ebp)
c000a6dd:	e8 ce ff ff ff       	call   c000a6b0 <i2a>
c000a6e2:	83 c4 10             	add    $0x10,%esp
c000a6e5:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a6e9:	7f 0a                	jg     c000a6f5 <i2a+0x45>
c000a6eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6ee:	83 c0 30             	add    $0x30,%eax
c000a6f1:	89 c3                	mov    %eax,%ebx
c000a6f3:	eb 08                	jmp    c000a6fd <i2a+0x4d>
c000a6f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6f8:	83 c0 37             	add    $0x37,%eax
c000a6fb:	89 c3                	mov    %eax,%ebx
c000a6fd:	8b 45 10             	mov    0x10(%ebp),%eax
c000a700:	8b 00                	mov    (%eax),%eax
c000a702:	8d 48 01             	lea    0x1(%eax),%ecx
c000a705:	8b 55 10             	mov    0x10(%ebp),%edx
c000a708:	89 0a                	mov    %ecx,(%edx)
c000a70a:	88 18                	mov    %bl,(%eax)
c000a70c:	8b 45 10             	mov    0x10(%ebp),%eax
c000a70f:	8b 00                	mov    (%eax),%eax
c000a711:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a714:	c9                   	leave  
c000a715:	c3                   	ret    

c000a716 <inform_int>:
c000a716:	55                   	push   %ebp
c000a717:	89 e5                	mov    %esp,%ebp
c000a719:	83 ec 18             	sub    $0x18,%esp
c000a71c:	83 ec 0c             	sub    $0xc,%esp
c000a71f:	ff 75 08             	pushl  0x8(%ebp)
c000a722:	e8 95 a0 ff ff       	call   c00047bc <pid2proc>
c000a727:	83 c4 10             	add    $0x10,%esp
c000a72a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a72d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a730:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a737:	0f be c0             	movsbl %al,%eax
c000a73a:	83 e0 02             	and    $0x2,%eax
c000a73d:	85 c0                	test   %eax,%eax
c000a73f:	0f 84 8e 00 00 00    	je     c000a7d3 <inform_int+0xbd>
c000a745:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a748:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a74e:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a753:	74 0e                	je     c000a763 <inform_int+0x4d>
c000a755:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a758:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a75e:	83 f8 12             	cmp    $0x12,%eax
c000a761:	75 7d                	jne    c000a7e0 <inform_int+0xca>
c000a763:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c000a76a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a76d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a773:	83 ec 08             	sub    $0x8,%esp
c000a776:	ff 75 f0             	pushl  -0x10(%ebp)
c000a779:	50                   	push   %eax
c000a77a:	e8 cc c6 ff ff       	call   c0006e4b <alloc_virtual_memory>
c000a77f:	83 c4 10             	add    $0x10,%esp
c000a782:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a785:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a788:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a78e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a791:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c000a798:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a79b:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a7a2:	00 00 00 
c000a7a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7a8:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a7af:	00 00 00 
c000a7b2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a7b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7bc:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a7c3:	83 ec 0c             	sub    $0xc,%esp
c000a7c6:	ff 75 f4             	pushl  -0xc(%ebp)
c000a7c9:	e8 e5 fd ff ff       	call   c000a5b3 <unblock>
c000a7ce:	83 c4 10             	add    $0x10,%esp
c000a7d1:	eb 0d                	jmp    c000a7e0 <inform_int+0xca>
c000a7d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7d6:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a7dd:	00 00 00 
c000a7e0:	90                   	nop
c000a7e1:	c9                   	leave  
c000a7e2:	c3                   	ret    

c000a7e3 <strcmp>:
c000a7e3:	55                   	push   %ebp
c000a7e4:	89 e5                	mov    %esp,%ebp
c000a7e6:	83 ec 10             	sub    $0x10,%esp
c000a7e9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a7ed:	74 06                	je     c000a7f5 <strcmp+0x12>
c000a7ef:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a7f3:	75 08                	jne    c000a7fd <strcmp+0x1a>
c000a7f5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7f8:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a7fb:	eb 53                	jmp    c000a850 <strcmp+0x6d>
c000a7fd:	8b 45 08             	mov    0x8(%ebp),%eax
c000a800:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a803:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a806:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a809:	eb 18                	jmp    c000a823 <strcmp+0x40>
c000a80b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a80e:	0f b6 10             	movzbl (%eax),%edx
c000a811:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a814:	0f b6 00             	movzbl (%eax),%eax
c000a817:	38 c2                	cmp    %al,%dl
c000a819:	75 1e                	jne    c000a839 <strcmp+0x56>
c000a81b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a81f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a823:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a826:	0f b6 00             	movzbl (%eax),%eax
c000a829:	84 c0                	test   %al,%al
c000a82b:	74 0d                	je     c000a83a <strcmp+0x57>
c000a82d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a830:	0f b6 00             	movzbl (%eax),%eax
c000a833:	84 c0                	test   %al,%al
c000a835:	75 d4                	jne    c000a80b <strcmp+0x28>
c000a837:	eb 01                	jmp    c000a83a <strcmp+0x57>
c000a839:	90                   	nop
c000a83a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a83d:	0f b6 00             	movzbl (%eax),%eax
c000a840:	0f be d0             	movsbl %al,%edx
c000a843:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a846:	0f b6 00             	movzbl (%eax),%eax
c000a849:	0f be c0             	movsbl %al,%eax
c000a84c:	29 c2                	sub    %eax,%edx
c000a84e:	89 d0                	mov    %edx,%eax
c000a850:	c9                   	leave  
c000a851:	c3                   	ret    

c000a852 <create_user_process_address_space>:
c000a852:	55                   	push   %ebp
c000a853:	89 e5                	mov    %esp,%ebp
c000a855:	83 ec 18             	sub    $0x18,%esp
c000a858:	83 ec 08             	sub    $0x8,%esp
c000a85b:	6a 00                	push   $0x0
c000a85d:	6a 01                	push   $0x1
c000a85f:	e8 64 c8 ff ff       	call   c00070c8 <alloc_memory>
c000a864:	83 c4 10             	add    $0x10,%esp
c000a867:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a86a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a86d:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a874:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a87b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a87e:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a883:	c1 e8 0c             	shr    $0xc,%eax
c000a886:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a889:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a88c:	83 c0 07             	add    $0x7,%eax
c000a88f:	c1 e8 03             	shr    $0x3,%eax
c000a892:	89 c2                	mov    %eax,%edx
c000a894:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a897:	89 50 04             	mov    %edx,0x4(%eax)
c000a89a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a89d:	8b 40 04             	mov    0x4(%eax),%eax
c000a8a0:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a8a5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a8ab:	85 c0                	test   %eax,%eax
c000a8ad:	0f 48 c2             	cmovs  %edx,%eax
c000a8b0:	c1 f8 0c             	sar    $0xc,%eax
c000a8b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a8b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a8b9:	83 ec 08             	sub    $0x8,%esp
c000a8bc:	6a 00                	push   $0x0
c000a8be:	50                   	push   %eax
c000a8bf:	e8 04 c8 ff ff       	call   c00070c8 <alloc_memory>
c000a8c4:	83 c4 10             	add    $0x10,%esp
c000a8c7:	89 c2                	mov    %eax,%edx
c000a8c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8cc:	89 10                	mov    %edx,(%eax)
c000a8ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8d1:	83 ec 0c             	sub    $0xc,%esp
c000a8d4:	50                   	push   %eax
c000a8d5:	e8 e6 c0 ff ff       	call   c00069c0 <init_bitmap>
c000a8da:	83 c4 10             	add    $0x10,%esp
c000a8dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8e0:	c9                   	leave  
c000a8e1:	c3                   	ret    

c000a8e2 <user_process>:
c000a8e2:	55                   	push   %ebp
c000a8e3:	89 e5                	mov    %esp,%ebp
c000a8e5:	83 ec 38             	sub    $0x38,%esp
c000a8e8:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000a8ef:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000a8f6:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000a8fd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000a901:	75 0e                	jne    c000a911 <user_process+0x2f>
c000a903:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000a909:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000a90f:	eb 0c                	jmp    c000a91d <user_process+0x3b>
c000a911:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000a917:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000a91d:	e8 75 6b ff ff       	call   c0001497 <get_running_thread_pcb>
c000a922:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a925:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a928:	05 00 10 00 00       	add    $0x1000,%eax
c000a92d:	89 c2                	mov    %eax,%edx
c000a92f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a932:	89 10                	mov    %edx,(%eax)
c000a934:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a937:	8b 00                	mov    (%eax),%eax
c000a939:	83 e8 44             	sub    $0x44,%eax
c000a93c:	89 c2                	mov    %eax,%edx
c000a93e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a941:	89 10                	mov    %edx,(%eax)
c000a943:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a946:	8b 00                	mov    (%eax),%eax
c000a948:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a94b:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a94f:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a955:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a959:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a95d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a961:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a965:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a969:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a96d:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a973:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000a977:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a97a:	89 50 34             	mov    %edx,0x34(%eax)
c000a97d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a981:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a984:	89 50 0c             	mov    %edx,0xc(%eax)
c000a987:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a98b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a98e:	89 50 04             	mov    %edx,0x4(%eax)
c000a991:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a995:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a998:	89 50 08             	mov    %edx,0x8(%eax)
c000a99b:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a99f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9a2:	89 50 40             	mov    %edx,0x40(%eax)
c000a9a5:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a9a9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9ac:	89 10                	mov    %edx,(%eax)
c000a9ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9b1:	8b 55 08             	mov    0x8(%ebp),%edx
c000a9b4:	89 50 30             	mov    %edx,0x30(%eax)
c000a9b7:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a9bb:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9be:	89 50 38             	mov    %edx,0x38(%eax)
c000a9c1:	83 ec 08             	sub    $0x8,%esp
c000a9c4:	6a 01                	push   $0x1
c000a9c6:	68 00 f0 ff bf       	push   $0xbffff000
c000a9cb:	e8 32 c6 ff ff       	call   c0007002 <alloc_physical_memory>
c000a9d0:	83 c4 10             	add    $0x10,%esp
c000a9d3:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000a9d9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9dc:	89 50 3c             	mov    %edx,0x3c(%eax)
c000a9df:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9e2:	83 ec 0c             	sub    $0xc,%esp
c000a9e5:	50                   	push   %eax
c000a9e6:	e8 81 69 ff ff       	call   c000136c <restart>
c000a9eb:	83 c4 10             	add    $0x10,%esp
c000a9ee:	90                   	nop
c000a9ef:	c9                   	leave  
c000a9f0:	c3                   	ret    

c000a9f1 <clone_pcb>:
c000a9f1:	55                   	push   %ebp
c000a9f2:	89 e5                	mov    %esp,%ebp
c000a9f4:	83 ec 18             	sub    $0x18,%esp
c000a9f7:	83 ec 08             	sub    $0x8,%esp
c000a9fa:	6a 00                	push   $0x0
c000a9fc:	6a 01                	push   $0x1
c000a9fe:	e8 c5 c6 ff ff       	call   c00070c8 <alloc_memory>
c000aa03:	83 c4 10             	add    $0x10,%esp
c000aa06:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000aa09:	83 ec 04             	sub    $0x4,%esp
c000aa0c:	68 00 10 00 00       	push   $0x1000
c000aa11:	6a 00                	push   $0x0
c000aa13:	ff 75 f4             	pushl  -0xc(%ebp)
c000aa16:	e8 ac 18 00 00       	call   c000c2c7 <Memset>
c000aa1b:	83 c4 10             	add    $0x10,%esp
c000aa1e:	83 ec 04             	sub    $0x4,%esp
c000aa21:	68 00 10 00 00       	push   $0x1000
c000aa26:	ff 75 08             	pushl  0x8(%ebp)
c000aa29:	ff 75 f4             	pushl  -0xc(%ebp)
c000aa2c:	e8 56 d1 ff ff       	call   c0007b87 <Memcpy>
c000aa31:	83 c4 10             	add    $0x10,%esp
c000aa34:	a1 b0 07 01 c0       	mov    0xc00107b0,%eax
c000aa39:	83 c0 01             	add    $0x1,%eax
c000aa3c:	a3 b0 07 01 c0       	mov    %eax,0xc00107b0
c000aa41:	8b 15 b0 07 01 c0    	mov    0xc00107b0,%edx
c000aa47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa4a:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000aa50:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa53:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000aa59:	89 c2                	mov    %eax,%edx
c000aa5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa5e:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000aa64:	83 ec 08             	sub    $0x8,%esp
c000aa67:	6a 00                	push   $0x0
c000aa69:	6a 01                	push   $0x1
c000aa6b:	e8 58 c6 ff ff       	call   c00070c8 <alloc_memory>
c000aa70:	83 c4 10             	add    $0x10,%esp
c000aa73:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa76:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aa79:	05 00 0c 00 00       	add    $0xc00,%eax
c000aa7e:	83 ec 04             	sub    $0x4,%esp
c000aa81:	68 00 04 00 00       	push   $0x400
c000aa86:	68 00 fc ff ff       	push   $0xfffffc00
c000aa8b:	50                   	push   %eax
c000aa8c:	e8 f6 d0 ff ff       	call   c0007b87 <Memcpy>
c000aa91:	83 c4 10             	add    $0x10,%esp
c000aa94:	83 ec 0c             	sub    $0xc,%esp
c000aa97:	ff 75 f0             	pushl  -0x10(%ebp)
c000aa9a:	e8 7a c4 ff ff       	call   c0006f19 <get_physical_address>
c000aa9f:	83 c4 10             	add    $0x10,%esp
c000aaa2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000aaa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aaa8:	05 fc 0f 00 00       	add    $0xffc,%eax
c000aaad:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aab0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000aab3:	83 c8 07             	or     $0x7,%eax
c000aab6:	89 c2                	mov    %eax,%edx
c000aab8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aabb:	89 10                	mov    %edx,(%eax)
c000aabd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aac0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000aac3:	89 50 08             	mov    %edx,0x8(%eax)
c000aac6:	e8 87 fd ff ff       	call   c000a852 <create_user_process_address_space>
c000aacb:	89 c2                	mov    %eax,%edx
c000aacd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aad0:	89 50 0c             	mov    %edx,0xc(%eax)
c000aad3:	8b 45 08             	mov    0x8(%ebp),%eax
c000aad6:	8b 40 0c             	mov    0xc(%eax),%eax
c000aad9:	89 c2                	mov    %eax,%edx
c000aadb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aade:	8b 40 0c             	mov    0xc(%eax),%eax
c000aae1:	83 ec 04             	sub    $0x4,%esp
c000aae4:	6a 0c                	push   $0xc
c000aae6:	52                   	push   %edx
c000aae7:	50                   	push   %eax
c000aae8:	e8 9a d0 ff ff       	call   c0007b87 <Memcpy>
c000aaed:	83 c4 10             	add    $0x10,%esp
c000aaf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aaf3:	c9                   	leave  
c000aaf4:	c3                   	ret    

c000aaf5 <build_body_stack>:
c000aaf5:	55                   	push   %ebp
c000aaf6:	89 e5                	mov    %esp,%ebp
c000aaf8:	83 ec 48             	sub    $0x48,%esp
c000aafb:	8b 45 08             	mov    0x8(%ebp),%eax
c000aafe:	8b 40 0c             	mov    0xc(%eax),%eax
c000ab01:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ab04:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab07:	8b 50 04             	mov    0x4(%eax),%edx
c000ab0a:	8b 00                	mov    (%eax),%eax
c000ab0c:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000ab0f:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000ab12:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000ab15:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ab18:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000ab1b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000ab1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab21:	8b 40 08             	mov    0x8(%eax),%eax
c000ab24:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000ab27:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000ab2e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000ab35:	e8 e9 cf ff ff       	call   c0007b23 <intr_disable>
c000ab3a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000ab3d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000ab44:	e9 c2 00 00 00       	jmp    c000ac0b <build_body_stack+0x116>
c000ab49:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000ab4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab4f:	01 d0                	add    %edx,%eax
c000ab51:	0f b6 00             	movzbl (%eax),%eax
c000ab54:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000ab57:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000ab5e:	e9 9a 00 00 00       	jmp    c000abfd <build_body_stack+0x108>
c000ab63:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000ab67:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ab6a:	89 c1                	mov    %eax,%ecx
c000ab6c:	d3 fa                	sar    %cl,%edx
c000ab6e:	89 d0                	mov    %edx,%eax
c000ab70:	83 e0 01             	and    $0x1,%eax
c000ab73:	85 c0                	test   %eax,%eax
c000ab75:	75 06                	jne    c000ab7d <build_body_stack+0x88>
c000ab77:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000ab7b:	eb 7c                	jmp    c000abf9 <build_body_stack+0x104>
c000ab7d:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab80:	8b 40 08             	mov    0x8(%eax),%eax
c000ab83:	83 ec 0c             	sub    $0xc,%esp
c000ab86:	50                   	push   %eax
c000ab87:	e8 ef 68 ff ff       	call   c000147b <update_cr3>
c000ab8c:	83 c4 10             	add    $0x10,%esp
c000ab8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ab92:	c1 e0 0c             	shl    $0xc,%eax
c000ab95:	89 c2                	mov    %eax,%edx
c000ab97:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000ab9a:	01 d0                	add    %edx,%eax
c000ab9c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000ab9f:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000aba2:	8b 45 10             	mov    0x10(%ebp),%eax
c000aba5:	83 ec 04             	sub    $0x4,%esp
c000aba8:	68 00 10 00 00       	push   $0x1000
c000abad:	52                   	push   %edx
c000abae:	50                   	push   %eax
c000abaf:	e8 d3 cf ff ff       	call   c0007b87 <Memcpy>
c000abb4:	83 c4 10             	add    $0x10,%esp
c000abb7:	8b 45 0c             	mov    0xc(%ebp),%eax
c000abba:	8b 40 08             	mov    0x8(%eax),%eax
c000abbd:	83 ec 0c             	sub    $0xc,%esp
c000abc0:	50                   	push   %eax
c000abc1:	e8 b5 68 ff ff       	call   c000147b <update_cr3>
c000abc6:	83 c4 10             	add    $0x10,%esp
c000abc9:	83 ec 08             	sub    $0x8,%esp
c000abcc:	ff 75 cc             	pushl  -0x34(%ebp)
c000abcf:	6a 01                	push   $0x1
c000abd1:	e8 54 c5 ff ff       	call   c000712a <get_a_virtual_page>
c000abd6:	83 c4 10             	add    $0x10,%esp
c000abd9:	8b 55 10             	mov    0x10(%ebp),%edx
c000abdc:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000abdf:	83 ec 04             	sub    $0x4,%esp
c000abe2:	68 00 10 00 00       	push   $0x1000
c000abe7:	52                   	push   %edx
c000abe8:	50                   	push   %eax
c000abe9:	e8 99 cf ff ff       	call   c0007b87 <Memcpy>
c000abee:	83 c4 10             	add    $0x10,%esp
c000abf1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000abf5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000abf9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000abfd:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000ac01:	0f 8e 5c ff ff ff    	jle    c000ab63 <build_body_stack+0x6e>
c000ac07:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000ac0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000ac0e:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000ac11:	0f 87 32 ff ff ff    	ja     c000ab49 <build_body_stack+0x54>
c000ac17:	83 ec 0c             	sub    $0xc,%esp
c000ac1a:	ff 75 d4             	pushl  -0x2c(%ebp)
c000ac1d:	e8 2a cf ff ff       	call   c0007b4c <intr_set_status>
c000ac22:	83 c4 10             	add    $0x10,%esp
c000ac25:	90                   	nop
c000ac26:	c9                   	leave  
c000ac27:	c3                   	ret    

c000ac28 <build_process_kernel_stack>:
c000ac28:	55                   	push   %ebp
c000ac29:	89 e5                	mov    %esp,%ebp
c000ac2b:	83 ec 28             	sub    $0x28,%esp
c000ac2e:	e8 f0 ce ff ff       	call   c0007b23 <intr_disable>
c000ac33:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac36:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac39:	05 00 10 00 00       	add    $0x1000,%eax
c000ac3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac44:	8b 00                	mov    (%eax),%eax
c000ac46:	83 f8 38             	cmp    $0x38,%eax
c000ac49:	74 06                	je     c000ac51 <build_process_kernel_stack+0x29>
c000ac4b:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000ac4f:	eb f0                	jmp    c000ac41 <build_process_kernel_stack+0x19>
c000ac51:	90                   	nop
c000ac52:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac55:	05 00 10 00 00       	add    $0x1000,%eax
c000ac5a:	89 c2                	mov    %eax,%edx
c000ac5c:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac5f:	89 50 04             	mov    %edx,0x4(%eax)
c000ac62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac65:	83 c0 2c             	add    $0x2c,%eax
c000ac68:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ac6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac6e:	83 e8 04             	sub    $0x4,%eax
c000ac71:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000ac74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac77:	83 e8 08             	sub    $0x8,%eax
c000ac7a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ac7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac80:	83 e8 0c             	sub    $0xc,%eax
c000ac83:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ac86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac89:	83 e8 10             	sub    $0x10,%eax
c000ac8c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000ac8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac92:	83 e8 14             	sub    $0x14,%eax
c000ac95:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000ac98:	ba 63 13 00 c0       	mov    $0xc0001363,%edx
c000ac9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aca0:	89 10                	mov    %edx,(%eax)
c000aca2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000aca5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000acab:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000acae:	8b 10                	mov    (%eax),%edx
c000acb0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000acb3:	89 10                	mov    %edx,(%eax)
c000acb5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000acb8:	8b 10                	mov    (%eax),%edx
c000acba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000acbd:	89 10                	mov    %edx,(%eax)
c000acbf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000acc2:	8b 10                	mov    (%eax),%edx
c000acc4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000acc7:	89 10                	mov    %edx,(%eax)
c000acc9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000accc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000acd2:	8b 45 08             	mov    0x8(%ebp),%eax
c000acd5:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000acd8:	89 10                	mov    %edx,(%eax)
c000acda:	83 ec 0c             	sub    $0xc,%esp
c000acdd:	ff 75 f0             	pushl  -0x10(%ebp)
c000ace0:	e8 67 ce ff ff       	call   c0007b4c <intr_set_status>
c000ace5:	83 c4 10             	add    $0x10,%esp
c000ace8:	90                   	nop
c000ace9:	c9                   	leave  
c000acea:	c3                   	ret    

c000aceb <fork_process>:
c000aceb:	55                   	push   %ebp
c000acec:	89 e5                	mov    %esp,%ebp
c000acee:	83 ec 18             	sub    $0x18,%esp
c000acf1:	8b 45 08             	mov    0x8(%ebp),%eax
c000acf4:	83 ec 0c             	sub    $0xc,%esp
c000acf7:	50                   	push   %eax
c000acf8:	e8 bf 9a ff ff       	call   c00047bc <pid2proc>
c000acfd:	83 c4 10             	add    $0x10,%esp
c000ad00:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad03:	83 ec 0c             	sub    $0xc,%esp
c000ad06:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad09:	e8 e3 fc ff ff       	call   c000a9f1 <clone_pcb>
c000ad0e:	83 c4 10             	add    $0x10,%esp
c000ad11:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ad14:	83 ec 08             	sub    $0x8,%esp
c000ad17:	6a 00                	push   $0x0
c000ad19:	6a 01                	push   $0x1
c000ad1b:	e8 a8 c3 ff ff       	call   c00070c8 <alloc_memory>
c000ad20:	83 c4 10             	add    $0x10,%esp
c000ad23:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ad26:	83 ec 04             	sub    $0x4,%esp
c000ad29:	ff 75 ec             	pushl  -0x14(%ebp)
c000ad2c:	ff 75 f0             	pushl  -0x10(%ebp)
c000ad2f:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad32:	e8 be fd ff ff       	call   c000aaf5 <build_body_stack>
c000ad37:	83 c4 10             	add    $0x10,%esp
c000ad3a:	83 ec 0c             	sub    $0xc,%esp
c000ad3d:	ff 75 f0             	pushl  -0x10(%ebp)
c000ad40:	e8 e3 fe ff ff       	call   c000ac28 <build_process_kernel_stack>
c000ad45:	83 c4 10             	add    $0x10,%esp
c000ad48:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad4b:	05 00 01 00 00       	add    $0x100,%eax
c000ad50:	83 ec 04             	sub    $0x4,%esp
c000ad53:	6a 08                	push   $0x8
c000ad55:	6a 00                	push   $0x0
c000ad57:	50                   	push   %eax
c000ad58:	e8 6a 15 00 00       	call   c000c2c7 <Memset>
c000ad5d:	83 c4 10             	add    $0x10,%esp
c000ad60:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad63:	05 08 01 00 00       	add    $0x108,%eax
c000ad68:	83 ec 04             	sub    $0x4,%esp
c000ad6b:	6a 08                	push   $0x8
c000ad6d:	6a 00                	push   $0x0
c000ad6f:	50                   	push   %eax
c000ad70:	e8 52 15 00 00       	call   c000c2c7 <Memset>
c000ad75:	83 c4 10             	add    $0x10,%esp
c000ad78:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad7b:	05 08 01 00 00       	add    $0x108,%eax
c000ad80:	83 ec 08             	sub    $0x8,%esp
c000ad83:	50                   	push   %eax
c000ad84:	68 24 1f 01 c0       	push   $0xc0011f24
c000ad89:	e8 c2 02 00 00       	call   c000b050 <appendToDoubleLinkList>
c000ad8e:	83 c4 10             	add    $0x10,%esp
c000ad91:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad94:	c9                   	leave  
c000ad95:	c3                   	ret    

c000ad96 <process_execute>:
c000ad96:	55                   	push   %ebp
c000ad97:	89 e5                	mov    %esp,%ebp
c000ad99:	83 ec 28             	sub    $0x28,%esp
c000ad9c:	e8 c5 04 00 00       	call   c000b266 <thread_init>
c000ada1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ada4:	83 ec 0c             	sub    $0xc,%esp
c000ada7:	ff 75 f4             	pushl  -0xc(%ebp)
c000adaa:	e8 64 05 00 00       	call   c000b313 <thread_create>
c000adaf:	83 c4 10             	add    $0x10,%esp
c000adb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adb5:	05 34 01 00 00       	add    $0x134,%eax
c000adba:	83 ec 08             	sub    $0x8,%esp
c000adbd:	ff 75 10             	pushl  0x10(%ebp)
c000adc0:	50                   	push   %eax
c000adc1:	e8 20 15 00 00       	call   c000c2e6 <Strcpy>
c000adc6:	83 c4 10             	add    $0x10,%esp
c000adc9:	83 ec 08             	sub    $0x8,%esp
c000adcc:	6a 00                	push   $0x0
c000adce:	6a 01                	push   $0x1
c000add0:	e8 f3 c2 ff ff       	call   c00070c8 <alloc_memory>
c000add5:	83 c4 10             	add    $0x10,%esp
c000add8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000addb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adde:	05 00 0c 00 00       	add    $0xc00,%eax
c000ade3:	83 ec 04             	sub    $0x4,%esp
c000ade6:	68 00 04 00 00       	push   $0x400
c000adeb:	68 00 fc ff ff       	push   $0xfffffc00
c000adf0:	50                   	push   %eax
c000adf1:	e8 91 cd ff ff       	call   c0007b87 <Memcpy>
c000adf6:	83 c4 10             	add    $0x10,%esp
c000adf9:	83 ec 0c             	sub    $0xc,%esp
c000adfc:	ff 75 f0             	pushl  -0x10(%ebp)
c000adff:	e8 15 c1 ff ff       	call   c0006f19 <get_physical_address>
c000ae04:	83 c4 10             	add    $0x10,%esp
c000ae07:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ae0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae0d:	05 fc 0f 00 00       	add    $0xffc,%eax
c000ae12:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000ae15:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000ae18:	83 c8 07             	or     $0x7,%eax
c000ae1b:	89 c2                	mov    %eax,%edx
c000ae1d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ae20:	89 10                	mov    %edx,(%eax)
c000ae22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae25:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000ae28:	89 50 08             	mov    %edx,0x8(%eax)
c000ae2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae2e:	83 c0 10             	add    $0x10,%eax
c000ae31:	83 ec 0c             	sub    $0xc,%esp
c000ae34:	50                   	push   %eax
c000ae35:	e8 2f c8 ff ff       	call   c0007669 <init_memory_block_desc>
c000ae3a:	83 c4 10             	add    $0x10,%esp
c000ae3d:	e8 10 fa ff ff       	call   c000a852 <create_user_process_address_space>
c000ae42:	89 c2                	mov    %eax,%edx
c000ae44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae47:	89 50 0c             	mov    %edx,0xc(%eax)
c000ae4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae4d:	8b 00                	mov    (%eax),%eax
c000ae4f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ae52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae55:	c7 40 10 e2 a8 00 c0 	movl   $0xc000a8e2,0x10(%eax)
c000ae5c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae5f:	8b 55 08             	mov    0x8(%ebp),%edx
c000ae62:	89 50 18             	mov    %edx,0x18(%eax)
c000ae65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae68:	8b 55 0c             	mov    0xc(%ebp),%edx
c000ae6b:	89 50 1c             	mov    %edx,0x1c(%eax)
c000ae6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae71:	8b 55 14             	mov    0x14(%ebp),%edx
c000ae74:	89 50 20             	mov    %edx,0x20(%eax)
c000ae77:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000ae7a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae7d:	89 50 24             	mov    %edx,0x24(%eax)
c000ae80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae83:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000ae89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae8c:	8b 10                	mov    (%eax),%edx
c000ae8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae91:	89 50 04             	mov    %edx,0x4(%eax)
c000ae94:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae97:	8b 50 04             	mov    0x4(%eax),%edx
c000ae9a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae9d:	89 50 08             	mov    %edx,0x8(%eax)
c000aea0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aea3:	8b 50 08             	mov    0x8(%eax),%edx
c000aea6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aea9:	89 50 0c             	mov    %edx,0xc(%eax)
c000aeac:	83 ec 0c             	sub    $0xc,%esp
c000aeaf:	68 0c 0e 01 c0       	push   $0xc0010e0c
c000aeb4:	e8 9a 00 00 00       	call   c000af53 <isListEmpty>
c000aeb9:	83 c4 10             	add    $0x10,%esp
c000aebc:	e8 62 cc ff ff       	call   c0007b23 <intr_disable>
c000aec1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aec4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aec7:	05 00 01 00 00       	add    $0x100,%eax
c000aecc:	83 ec 08             	sub    $0x8,%esp
c000aecf:	50                   	push   %eax
c000aed0:	68 0c 0e 01 c0       	push   $0xc0010e0c
c000aed5:	e8 76 01 00 00       	call   c000b050 <appendToDoubleLinkList>
c000aeda:	83 c4 10             	add    $0x10,%esp
c000aedd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aee0:	05 08 01 00 00       	add    $0x108,%eax
c000aee5:	83 ec 08             	sub    $0x8,%esp
c000aee8:	50                   	push   %eax
c000aee9:	68 24 1f 01 c0       	push   $0xc0011f24
c000aeee:	e8 5d 01 00 00       	call   c000b050 <appendToDoubleLinkList>
c000aef3:	83 c4 10             	add    $0x10,%esp
c000aef6:	83 ec 0c             	sub    $0xc,%esp
c000aef9:	ff 75 e0             	pushl  -0x20(%ebp)
c000aefc:	e8 4b cc ff ff       	call   c0007b4c <intr_set_status>
c000af01:	83 c4 10             	add    $0x10,%esp
c000af04:	90                   	nop
c000af05:	c9                   	leave  
c000af06:	c3                   	ret    
c000af07:	66 90                	xchg   %ax,%ax
c000af09:	66 90                	xchg   %ax,%ax
c000af0b:	66 90                	xchg   %ax,%ax
c000af0d:	66 90                	xchg   %ax,%ax
c000af0f:	90                   	nop

c000af10 <switch_to>:
c000af10:	56                   	push   %esi
c000af11:	57                   	push   %edi
c000af12:	53                   	push   %ebx
c000af13:	55                   	push   %ebp
c000af14:	89 e5                	mov    %esp,%ebp
c000af16:	8b 45 14             	mov    0x14(%ebp),%eax
c000af19:	89 20                	mov    %esp,(%eax)
c000af1b:	8b 45 18             	mov    0x18(%ebp),%eax
c000af1e:	8b 20                	mov    (%eax),%esp
c000af20:	5d                   	pop    %ebp
c000af21:	5b                   	pop    %ebx
c000af22:	5f                   	pop    %edi
c000af23:	5e                   	pop    %esi
c000af24:	c3                   	ret    

c000af25 <initDoubleLinkList>:
c000af25:	55                   	push   %ebp
c000af26:	89 e5                	mov    %esp,%ebp
c000af28:	8b 45 08             	mov    0x8(%ebp),%eax
c000af2b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000af31:	8b 45 08             	mov    0x8(%ebp),%eax
c000af34:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000af3b:	8b 45 08             	mov    0x8(%ebp),%eax
c000af3e:	8d 50 08             	lea    0x8(%eax),%edx
c000af41:	8b 45 08             	mov    0x8(%ebp),%eax
c000af44:	89 50 04             	mov    %edx,0x4(%eax)
c000af47:	8b 55 08             	mov    0x8(%ebp),%edx
c000af4a:	8b 45 08             	mov    0x8(%ebp),%eax
c000af4d:	89 50 08             	mov    %edx,0x8(%eax)
c000af50:	90                   	nop
c000af51:	5d                   	pop    %ebp
c000af52:	c3                   	ret    

c000af53 <isListEmpty>:
c000af53:	55                   	push   %ebp
c000af54:	89 e5                	mov    %esp,%ebp
c000af56:	8b 45 08             	mov    0x8(%ebp),%eax
c000af59:	8b 40 04             	mov    0x4(%eax),%eax
c000af5c:	8b 55 08             	mov    0x8(%ebp),%edx
c000af5f:	83 c2 08             	add    $0x8,%edx
c000af62:	39 d0                	cmp    %edx,%eax
c000af64:	75 07                	jne    c000af6d <isListEmpty+0x1a>
c000af66:	b8 01 00 00 00       	mov    $0x1,%eax
c000af6b:	eb 05                	jmp    c000af72 <isListEmpty+0x1f>
c000af6d:	b8 00 00 00 00       	mov    $0x0,%eax
c000af72:	5d                   	pop    %ebp
c000af73:	c3                   	ret    

c000af74 <findElementInList>:
c000af74:	55                   	push   %ebp
c000af75:	89 e5                	mov    %esp,%ebp
c000af77:	83 ec 28             	sub    $0x28,%esp
c000af7a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000af7e:	75 19                	jne    c000af99 <findElementInList+0x25>
c000af80:	6a 60                	push   $0x60
c000af82:	68 6d c2 00 c0       	push   $0xc000c26d
c000af87:	68 6d c2 00 c0       	push   $0xc000c26d
c000af8c:	68 80 c2 00 c0       	push   $0xc000c280
c000af91:	e8 a8 eb ff ff       	call   c0009b3e <assertion_failure>
c000af96:	83 c4 10             	add    $0x10,%esp
c000af99:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000af9d:	75 19                	jne    c000afb8 <findElementInList+0x44>
c000af9f:	6a 61                	push   $0x61
c000afa1:	68 6d c2 00 c0       	push   $0xc000c26d
c000afa6:	68 6d c2 00 c0       	push   $0xc000c26d
c000afab:	68 8c c2 00 c0       	push   $0xc000c28c
c000afb0:	e8 89 eb ff ff       	call   c0009b3e <assertion_failure>
c000afb5:	83 c4 10             	add    $0x10,%esp
c000afb8:	e8 66 cb ff ff       	call   c0007b23 <intr_disable>
c000afbd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000afc0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000afc7:	8b 45 08             	mov    0x8(%ebp),%eax
c000afca:	8b 40 08             	mov    0x8(%eax),%eax
c000afcd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000afd0:	8b 45 08             	mov    0x8(%ebp),%eax
c000afd3:	8b 40 04             	mov    0x4(%eax),%eax
c000afd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000afd9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000afdd:	75 07                	jne    c000afe6 <findElementInList+0x72>
c000afdf:	b8 00 00 00 00       	mov    $0x0,%eax
c000afe4:	eb 68                	jmp    c000b04e <findElementInList+0xda>
c000afe6:	8b 45 0c             	mov    0xc(%ebp),%eax
c000afe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000afec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000afef:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000aff2:	c1 f8 03             	sar    $0x3,%eax
c000aff5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aff8:	eb 36                	jmp    c000b030 <findElementInList+0xbc>
c000affa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000affd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000b000:	75 07                	jne    c000b009 <findElementInList+0x95>
c000b002:	b8 01 00 00 00       	mov    $0x1,%eax
c000b007:	eb 45                	jmp    c000b04e <findElementInList+0xda>
c000b009:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b00d:	75 07                	jne    c000b016 <findElementInList+0xa2>
c000b00f:	b8 00 00 00 00       	mov    $0x0,%eax
c000b014:	eb 38                	jmp    c000b04e <findElementInList+0xda>
c000b016:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b019:	8b 40 04             	mov    0x4(%eax),%eax
c000b01c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b01f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b023:	75 07                	jne    c000b02c <findElementInList+0xb8>
c000b025:	b8 00 00 00 00       	mov    $0x0,%eax
c000b02a:	eb 22                	jmp    c000b04e <findElementInList+0xda>
c000b02c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000b030:	8b 45 08             	mov    0x8(%ebp),%eax
c000b033:	83 c0 08             	add    $0x8,%eax
c000b036:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000b039:	75 bf                	jne    c000affa <findElementInList+0x86>
c000b03b:	83 ec 0c             	sub    $0xc,%esp
c000b03e:	ff 75 ec             	pushl  -0x14(%ebp)
c000b041:	e8 06 cb ff ff       	call   c0007b4c <intr_set_status>
c000b046:	83 c4 10             	add    $0x10,%esp
c000b049:	b8 00 00 00 00       	mov    $0x0,%eax
c000b04e:	c9                   	leave  
c000b04f:	c3                   	ret    

c000b050 <appendToDoubleLinkList>:
c000b050:	55                   	push   %ebp
c000b051:	89 e5                	mov    %esp,%ebp
c000b053:	83 ec 18             	sub    $0x18,%esp
c000b056:	83 ec 08             	sub    $0x8,%esp
c000b059:	ff 75 0c             	pushl  0xc(%ebp)
c000b05c:	ff 75 08             	pushl  0x8(%ebp)
c000b05f:	e8 10 ff ff ff       	call   c000af74 <findElementInList>
c000b064:	83 c4 10             	add    $0x10,%esp
c000b067:	3c 01                	cmp    $0x1,%al
c000b069:	0f 84 c2 00 00 00    	je     c000b131 <appendToDoubleLinkList+0xe1>
c000b06f:	e8 af ca ff ff       	call   c0007b23 <intr_disable>
c000b074:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b077:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000b07b:	75 1c                	jne    c000b099 <appendToDoubleLinkList+0x49>
c000b07d:	68 9e 00 00 00       	push   $0x9e
c000b082:	68 6d c2 00 c0       	push   $0xc000c26d
c000b087:	68 6d c2 00 c0       	push   $0xc000c26d
c000b08c:	68 80 c2 00 c0       	push   $0xc000c280
c000b091:	e8 a8 ea ff ff       	call   c0009b3e <assertion_failure>
c000b096:	83 c4 10             	add    $0x10,%esp
c000b099:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000b09d:	75 1c                	jne    c000b0bb <appendToDoubleLinkList+0x6b>
c000b09f:	68 9f 00 00 00       	push   $0x9f
c000b0a4:	68 6d c2 00 c0       	push   $0xc000c26d
c000b0a9:	68 6d c2 00 c0       	push   $0xc000c26d
c000b0ae:	68 8c c2 00 c0       	push   $0xc000c28c
c000b0b3:	e8 86 ea ff ff       	call   c0009b3e <assertion_failure>
c000b0b8:	83 c4 10             	add    $0x10,%esp
c000b0bb:	83 ec 08             	sub    $0x8,%esp
c000b0be:	ff 75 0c             	pushl  0xc(%ebp)
c000b0c1:	ff 75 08             	pushl  0x8(%ebp)
c000b0c4:	e8 ab fe ff ff       	call   c000af74 <findElementInList>
c000b0c9:	83 c4 10             	add    $0x10,%esp
c000b0cc:	3c 01                	cmp    $0x1,%al
c000b0ce:	74 64                	je     c000b134 <appendToDoubleLinkList+0xe4>
c000b0d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b0d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b0d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b0d9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b0e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b0e3:	8b 50 04             	mov    0x4(%eax),%edx
c000b0e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b0e9:	89 10                	mov    %edx,(%eax)
c000b0eb:	8b 45 08             	mov    0x8(%ebp),%eax
c000b0ee:	8b 50 08             	mov    0x8(%eax),%edx
c000b0f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b0f4:	89 10                	mov    %edx,(%eax)
c000b0f6:	8b 45 08             	mov    0x8(%ebp),%eax
c000b0f9:	8b 40 08             	mov    0x8(%eax),%eax
c000b0fc:	85 c0                	test   %eax,%eax
c000b0fe:	74 0c                	je     c000b10c <appendToDoubleLinkList+0xbc>
c000b100:	8b 45 08             	mov    0x8(%ebp),%eax
c000b103:	8b 40 08             	mov    0x8(%eax),%eax
c000b106:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b109:	89 50 04             	mov    %edx,0x4(%eax)
c000b10c:	8b 45 08             	mov    0x8(%ebp),%eax
c000b10f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b112:	89 50 08             	mov    %edx,0x8(%eax)
c000b115:	8b 45 08             	mov    0x8(%ebp),%eax
c000b118:	8d 50 08             	lea    0x8(%eax),%edx
c000b11b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b11e:	89 50 04             	mov    %edx,0x4(%eax)
c000b121:	83 ec 0c             	sub    $0xc,%esp
c000b124:	ff 75 f4             	pushl  -0xc(%ebp)
c000b127:	e8 20 ca ff ff       	call   c0007b4c <intr_set_status>
c000b12c:	83 c4 10             	add    $0x10,%esp
c000b12f:	eb 04                	jmp    c000b135 <appendToDoubleLinkList+0xe5>
c000b131:	90                   	nop
c000b132:	eb 01                	jmp    c000b135 <appendToDoubleLinkList+0xe5>
c000b134:	90                   	nop
c000b135:	c9                   	leave  
c000b136:	c3                   	ret    

c000b137 <insertToDoubleLinkList>:
c000b137:	55                   	push   %ebp
c000b138:	89 e5                	mov    %esp,%ebp
c000b13a:	83 ec 18             	sub    $0x18,%esp
c000b13d:	83 ec 08             	sub    $0x8,%esp
c000b140:	ff 75 0c             	pushl  0xc(%ebp)
c000b143:	ff 75 08             	pushl  0x8(%ebp)
c000b146:	e8 29 fe ff ff       	call   c000af74 <findElementInList>
c000b14b:	83 c4 10             	add    $0x10,%esp
c000b14e:	3c 01                	cmp    $0x1,%al
c000b150:	74 65                	je     c000b1b7 <insertToDoubleLinkList+0x80>
c000b152:	e8 cc c9 ff ff       	call   c0007b23 <intr_disable>
c000b157:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b15a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b15d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b160:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b163:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b16a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b16d:	8b 50 04             	mov    0x4(%eax),%edx
c000b170:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b173:	89 10                	mov    %edx,(%eax)
c000b175:	8b 45 08             	mov    0x8(%ebp),%eax
c000b178:	8b 50 04             	mov    0x4(%eax),%edx
c000b17b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b17e:	89 50 04             	mov    %edx,0x4(%eax)
c000b181:	8b 45 08             	mov    0x8(%ebp),%eax
c000b184:	8b 40 04             	mov    0x4(%eax),%eax
c000b187:	85 c0                	test   %eax,%eax
c000b189:	74 0b                	je     c000b196 <insertToDoubleLinkList+0x5f>
c000b18b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b18e:	8b 40 04             	mov    0x4(%eax),%eax
c000b191:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b194:	89 10                	mov    %edx,(%eax)
c000b196:	8b 45 08             	mov    0x8(%ebp),%eax
c000b199:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b19c:	89 50 04             	mov    %edx,0x4(%eax)
c000b19f:	8b 55 08             	mov    0x8(%ebp),%edx
c000b1a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b1a5:	89 10                	mov    %edx,(%eax)
c000b1a7:	83 ec 0c             	sub    $0xc,%esp
c000b1aa:	ff 75 f4             	pushl  -0xc(%ebp)
c000b1ad:	e8 9a c9 ff ff       	call   c0007b4c <intr_set_status>
c000b1b2:	83 c4 10             	add    $0x10,%esp
c000b1b5:	eb 01                	jmp    c000b1b8 <insertToDoubleLinkList+0x81>
c000b1b7:	90                   	nop
c000b1b8:	c9                   	leave  
c000b1b9:	c3                   	ret    

c000b1ba <popFromDoubleLinkList>:
c000b1ba:	55                   	push   %ebp
c000b1bb:	89 e5                	mov    %esp,%ebp
c000b1bd:	83 ec 18             	sub    $0x18,%esp
c000b1c0:	e8 5e c9 ff ff       	call   c0007b23 <intr_disable>
c000b1c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b1c8:	83 ec 0c             	sub    $0xc,%esp
c000b1cb:	ff 75 08             	pushl  0x8(%ebp)
c000b1ce:	e8 80 fd ff ff       	call   c000af53 <isListEmpty>
c000b1d3:	83 c4 10             	add    $0x10,%esp
c000b1d6:	3c 01                	cmp    $0x1,%al
c000b1d8:	75 07                	jne    c000b1e1 <popFromDoubleLinkList+0x27>
c000b1da:	b8 00 00 00 00       	mov    $0x0,%eax
c000b1df:	eb 6b                	jmp    c000b24c <popFromDoubleLinkList+0x92>
c000b1e1:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1e4:	8b 40 08             	mov    0x8(%eax),%eax
c000b1e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b1ea:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1ed:	8b 40 08             	mov    0x8(%eax),%eax
c000b1f0:	85 c0                	test   %eax,%eax
c000b1f2:	75 07                	jne    c000b1fb <popFromDoubleLinkList+0x41>
c000b1f4:	b8 00 00 00 00       	mov    $0x0,%eax
c000b1f9:	eb 51                	jmp    c000b24c <popFromDoubleLinkList+0x92>
c000b1fb:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1fe:	8b 40 08             	mov    0x8(%eax),%eax
c000b201:	8b 00                	mov    (%eax),%eax
c000b203:	85 c0                	test   %eax,%eax
c000b205:	74 11                	je     c000b218 <popFromDoubleLinkList+0x5e>
c000b207:	8b 45 08             	mov    0x8(%ebp),%eax
c000b20a:	8b 40 08             	mov    0x8(%eax),%eax
c000b20d:	8b 00                	mov    (%eax),%eax
c000b20f:	8b 55 08             	mov    0x8(%ebp),%edx
c000b212:	83 c2 08             	add    $0x8,%edx
c000b215:	89 50 04             	mov    %edx,0x4(%eax)
c000b218:	8b 45 08             	mov    0x8(%ebp),%eax
c000b21b:	8b 40 08             	mov    0x8(%eax),%eax
c000b21e:	8b 10                	mov    (%eax),%edx
c000b220:	8b 45 08             	mov    0x8(%ebp),%eax
c000b223:	89 50 08             	mov    %edx,0x8(%eax)
c000b226:	83 ec 0c             	sub    $0xc,%esp
c000b229:	ff 75 f4             	pushl  -0xc(%ebp)
c000b22c:	e8 1b c9 ff ff       	call   c0007b4c <intr_set_status>
c000b231:	83 c4 10             	add    $0x10,%esp
c000b234:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b237:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b23e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b241:	8b 50 04             	mov    0x4(%eax),%edx
c000b244:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b247:	89 10                	mov    %edx,(%eax)
c000b249:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b24c:	c9                   	leave  
c000b24d:	c3                   	ret    

c000b24e <kernel_thread>:
c000b24e:	55                   	push   %ebp
c000b24f:	89 e5                	mov    %esp,%ebp
c000b251:	83 ec 08             	sub    $0x8,%esp
c000b254:	fb                   	sti    
c000b255:	83 ec 0c             	sub    $0xc,%esp
c000b258:	ff 75 0c             	pushl  0xc(%ebp)
c000b25b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b25e:	ff d0                	call   *%eax
c000b260:	83 c4 10             	add    $0x10,%esp
c000b263:	90                   	nop
c000b264:	c9                   	leave  
c000b265:	c3                   	ret    

c000b266 <thread_init>:
c000b266:	55                   	push   %ebp
c000b267:	89 e5                	mov    %esp,%ebp
c000b269:	83 ec 18             	sub    $0x18,%esp
c000b26c:	83 ec 08             	sub    $0x8,%esp
c000b26f:	6a 00                	push   $0x0
c000b271:	6a 01                	push   $0x1
c000b273:	e8 50 be ff ff       	call   c00070c8 <alloc_memory>
c000b278:	83 c4 10             	add    $0x10,%esp
c000b27b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b27e:	83 ec 04             	sub    $0x4,%esp
c000b281:	68 00 10 00 00       	push   $0x1000
c000b286:	6a 00                	push   $0x0
c000b288:	ff 75 f4             	pushl  -0xc(%ebp)
c000b28b:	e8 37 10 00 00       	call   c000c2c7 <Memset>
c000b290:	83 c4 10             	add    $0x10,%esp
c000b293:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b296:	05 00 10 00 00       	add    $0x1000,%eax
c000b29b:	89 c2                	mov    %eax,%edx
c000b29d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2a0:	89 10                	mov    %edx,(%eax)
c000b2a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2a5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000b2ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2af:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000b2b6:	ff ff ff 
c000b2b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2bc:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000b2c3:	00 00 00 
c000b2c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2c9:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000b2cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2d2:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000b2d8:	a1 b0 07 01 c0       	mov    0xc00107b0,%eax
c000b2dd:	83 c0 01             	add    $0x1,%eax
c000b2e0:	a3 b0 07 01 c0       	mov    %eax,0xc00107b0
c000b2e5:	8b 15 b0 07 01 c0    	mov    0xc00107b0,%edx
c000b2eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2ee:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000b2f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2f7:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c000b2fe:	00 00 00 
c000b301:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b304:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000b30b:	cd ab 99 
c000b30e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b311:	c9                   	leave  
c000b312:	c3                   	ret    

c000b313 <thread_create>:
c000b313:	55                   	push   %ebp
c000b314:	89 e5                	mov    %esp,%ebp
c000b316:	83 ec 10             	sub    $0x10,%esp
c000b319:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000b320:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000b327:	8b 45 08             	mov    0x8(%ebp),%eax
c000b32a:	8b 00                	mov    (%eax),%eax
c000b32c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000b32f:	89 c2                	mov    %eax,%edx
c000b331:	8b 45 08             	mov    0x8(%ebp),%eax
c000b334:	89 10                	mov    %edx,(%eax)
c000b336:	8b 45 08             	mov    0x8(%ebp),%eax
c000b339:	8b 00                	mov    (%eax),%eax
c000b33b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000b33e:	89 c2                	mov    %eax,%edx
c000b340:	8b 45 08             	mov    0x8(%ebp),%eax
c000b343:	89 10                	mov    %edx,(%eax)
c000b345:	90                   	nop
c000b346:	c9                   	leave  
c000b347:	c3                   	ret    

c000b348 <thread_start>:
c000b348:	55                   	push   %ebp
c000b349:	89 e5                	mov    %esp,%ebp
c000b34b:	83 ec 18             	sub    $0x18,%esp
c000b34e:	e8 13 ff ff ff       	call   c000b266 <thread_init>
c000b353:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b356:	83 ec 0c             	sub    $0xc,%esp
c000b359:	ff 75 f4             	pushl  -0xc(%ebp)
c000b35c:	e8 b2 ff ff ff       	call   c000b313 <thread_create>
c000b361:	83 c4 10             	add    $0x10,%esp
c000b364:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b367:	05 34 01 00 00       	add    $0x134,%eax
c000b36c:	83 ec 08             	sub    $0x8,%esp
c000b36f:	ff 75 10             	pushl  0x10(%ebp)
c000b372:	50                   	push   %eax
c000b373:	e8 6e 0f 00 00       	call   c000c2e6 <Strcpy>
c000b378:	83 c4 10             	add    $0x10,%esp
c000b37b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b37e:	8b 00                	mov    (%eax),%eax
c000b380:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b383:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b386:	c7 40 10 4e b2 00 c0 	movl   $0xc000b24e,0x10(%eax)
c000b38d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b390:	8b 55 08             	mov    0x8(%ebp),%edx
c000b393:	89 50 18             	mov    %edx,0x18(%eax)
c000b396:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b399:	8b 55 0c             	mov    0xc(%ebp),%edx
c000b39c:	89 50 1c             	mov    %edx,0x1c(%eax)
c000b39f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3a2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000b3a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3ab:	8b 10                	mov    (%eax),%edx
c000b3ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3b0:	89 50 04             	mov    %edx,0x4(%eax)
c000b3b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3b6:	8b 50 04             	mov    0x4(%eax),%edx
c000b3b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3bc:	89 50 08             	mov    %edx,0x8(%eax)
c000b3bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3c2:	8b 50 08             	mov    0x8(%eax),%edx
c000b3c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3c8:	89 50 0c             	mov    %edx,0xc(%eax)
c000b3cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b3ce:	05 00 01 00 00       	add    $0x100,%eax
c000b3d3:	83 ec 08             	sub    $0x8,%esp
c000b3d6:	50                   	push   %eax
c000b3d7:	68 0c 0e 01 c0       	push   $0xc0010e0c
c000b3dc:	e8 6f fc ff ff       	call   c000b050 <appendToDoubleLinkList>
c000b3e1:	83 c4 10             	add    $0x10,%esp
c000b3e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b3e7:	05 08 01 00 00       	add    $0x108,%eax
c000b3ec:	83 ec 08             	sub    $0x8,%esp
c000b3ef:	50                   	push   %eax
c000b3f0:	68 24 1f 01 c0       	push   $0xc0011f24
c000b3f5:	e8 56 fc ff ff       	call   c000b050 <appendToDoubleLinkList>
c000b3fa:	83 c4 10             	add    $0x10,%esp
c000b3fd:	90                   	nop
c000b3fe:	c9                   	leave  
c000b3ff:	c3                   	ret    
