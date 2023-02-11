
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001200 <_start>:
c0001200:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0001207:	00 00 00 
c000120a:	b4 0b                	mov    $0xb,%ah
c000120c:	b0 4c                	mov    $0x4c,%al
c000120e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001215:	66 c7 05 a0 07 01 c0 	movw   $0x0,0xc00107a0
c000121c:	00 00 
c000121e:	0f 01 05 c8 16 01 c0 	sgdtl  0xc00116c8
c0001225:	e8 30 3a 00 00       	call   c0004c5a <ReloadGDT>
c000122a:	0f 01 15 c8 16 01 c0 	lgdtl  0xc00116c8
c0001231:	0f 01 1d 88 07 01 c0 	lidtl  0xc0010788
c0001238:	0f a8                	push   %gs
c000123a:	0f a9                	pop    %gs
c000123c:	ea 43 12 00 c0 08 00 	ljmp   $0x8,$0xc0001243

c0001243 <csinit>:
c0001243:	31 c0                	xor    %eax,%eax
c0001245:	66 b8 40 00          	mov    $0x40,%ax
c0001249:	0f 00 d8             	ltr    %ax
c000124c:	31 c0                	xor    %eax,%eax
c000124e:	e9 52 03 00 00       	jmp    c00015a5 <kernel_main>
c0001253:	f4                   	hlt    
c0001254:	eb fe                	jmp    c0001254 <csinit+0x11>
c0001256:	fb                   	sti    
c0001257:	b4 0b                	mov    $0xb,%ah
c0001259:	b0 4d                	mov    $0x4d,%al
c000125b:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
c0001262:	eb fe                	jmp    c0001262 <csinit+0x1f>
c0001264:	f4                   	hlt    
c0001265:	6a 00                	push   $0x0
c0001267:	9d                   	popf   
c0001268:	eb fe                	jmp    c0001268 <csinit+0x25>
c000126a:	6a 01                	push   $0x1
c000126c:	6a 02                	push   $0x2
c000126e:	6a 03                	push   $0x3
c0001270:	f4                   	hlt    
c0001271:	66 90                	xchg   %ax,%ax
c0001273:	66 90                	xchg   %ax,%ax
c0001275:	66 90                	xchg   %ax,%ax
c0001277:	66 90                	xchg   %ax,%ax
c0001279:	66 90                	xchg   %ax,%ax
c000127b:	66 90                	xchg   %ax,%ax
c000127d:	66 90                	xchg   %ax,%ax
c000127f:	90                   	nop

c0001280 <InterruptTest>:
c0001280:	b4 0d                	mov    $0xd,%ah
c0001282:	b0 54                	mov    $0x54,%al
c0001284:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
c000128b:	c3                   	ret    

c000128c <disp_str>:
c000128c:	55                   	push   %ebp
c000128d:	89 e5                	mov    %esp,%ebp
c000128f:	b4 0d                	mov    $0xd,%ah
c0001291:	8b 75 08             	mov    0x8(%ebp),%esi
c0001294:	8b 3d a0 07 01 c0    	mov    0xc00107a0,%edi

c000129a <disp_str.1>:
c000129a:	ac                   	lods   %ds:(%esi),%al
c000129b:	84 c0                	test   %al,%al
c000129d:	74 1e                	je     c00012bd <disp_str.4>
c000129f:	3c 0a                	cmp    $0xa,%al
c00012a1:	75 11                	jne    c00012b4 <disp_str.3>
c00012a3:	50                   	push   %eax
c00012a4:	89 f8                	mov    %edi,%eax
c00012a6:	b3 a0                	mov    $0xa0,%bl
c00012a8:	f6 f3                	div    %bl
c00012aa:	40                   	inc    %eax
c00012ab:	b3 a0                	mov    $0xa0,%bl
c00012ad:	f6 e3                	mul    %bl
c00012af:	89 c7                	mov    %eax,%edi
c00012b1:	58                   	pop    %eax
c00012b2:	eb e6                	jmp    c000129a <disp_str.1>

c00012b4 <disp_str.3>:
c00012b4:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00012b8:	83 c7 02             	add    $0x2,%edi
c00012bb:	eb dd                	jmp    c000129a <disp_str.1>

c00012bd <disp_str.4>:
c00012bd:	89 3d a0 07 01 c0    	mov    %edi,0xc00107a0
c00012c3:	89 ec                	mov    %ebp,%esp
c00012c5:	5d                   	pop    %ebp
c00012c6:	c3                   	ret    

c00012c7 <disp_str_colour>:
c00012c7:	55                   	push   %ebp
c00012c8:	89 e5                	mov    %esp,%ebp
c00012ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00012cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00012d0:	8b 3d a0 07 01 c0    	mov    0xc00107a0,%edi

c00012d6 <disp_str_colour.1>:
c00012d6:	ac                   	lods   %ds:(%esi),%al
c00012d7:	84 c0                	test   %al,%al
c00012d9:	74 1e                	je     c00012f9 <disp_str_colour.4>
c00012db:	3c 0a                	cmp    $0xa,%al
c00012dd:	75 11                	jne    c00012f0 <disp_str_colour.3>
c00012df:	50                   	push   %eax
c00012e0:	89 f8                	mov    %edi,%eax
c00012e2:	b3 a0                	mov    $0xa0,%bl
c00012e4:	f6 f3                	div    %bl
c00012e6:	40                   	inc    %eax
c00012e7:	b3 a0                	mov    $0xa0,%bl
c00012e9:	f6 e3                	mul    %bl
c00012eb:	89 c7                	mov    %eax,%edi
c00012ed:	58                   	pop    %eax
c00012ee:	eb e6                	jmp    c00012d6 <disp_str_colour.1>

c00012f0 <disp_str_colour.3>:
c00012f0:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00012f4:	83 c7 02             	add    $0x2,%edi
c00012f7:	eb dd                	jmp    c00012d6 <disp_str_colour.1>

c00012f9 <disp_str_colour.4>:
c00012f9:	89 3d a0 07 01 c0    	mov    %edi,0xc00107a0
c00012ff:	89 ec                	mov    %ebp,%esp
c0001301:	5d                   	pop    %ebp
c0001302:	c3                   	ret    

c0001303 <divide_zero_fault>:
c0001303:	6a ff                	push   $0xffffffff
c0001305:	6a 00                	push   $0x0
c0001307:	eb 5f                	jmp    c0001368 <exception>

c0001309 <single_step_fault>:
c0001309:	6a ff                	push   $0xffffffff
c000130b:	6a 01                	push   $0x1
c000130d:	eb 59                	jmp    c0001368 <exception>

c000130f <non_maskable_interrupt>:
c000130f:	6a ff                	push   $0xffffffff
c0001311:	6a 02                	push   $0x2
c0001313:	eb 53                	jmp    c0001368 <exception>

c0001315 <breakpoint_trap>:
c0001315:	6a ff                	push   $0xffffffff
c0001317:	6a 03                	push   $0x3
c0001319:	eb 4d                	jmp    c0001368 <exception>

c000131b <overflow_trap>:
c000131b:	6a ff                	push   $0xffffffff
c000131d:	6a 04                	push   $0x4
c000131f:	eb 47                	jmp    c0001368 <exception>

c0001321 <bound_range_exceeded_fault>:
c0001321:	6a ff                	push   $0xffffffff
c0001323:	6a 05                	push   $0x5
c0001325:	eb 41                	jmp    c0001368 <exception>

c0001327 <invalid_opcode_fault>:
c0001327:	6a ff                	push   $0xffffffff
c0001329:	6a 06                	push   $0x6
c000132b:	eb 3b                	jmp    c0001368 <exception>

c000132d <coprocessor_not_available_fault>:
c000132d:	6a ff                	push   $0xffffffff
c000132f:	6a 07                	push   $0x7
c0001331:	eb 35                	jmp    c0001368 <exception>

c0001333 <double_fault_exception_abort>:
c0001333:	6a 08                	push   $0x8
c0001335:	eb 31                	jmp    c0001368 <exception>

c0001337 <coprocessor_segment_overrun>:
c0001337:	6a ff                	push   $0xffffffff
c0001339:	6a 09                	push   $0x9
c000133b:	eb 2b                	jmp    c0001368 <exception>

c000133d <invalid_task_state_segment_fault>:
c000133d:	6a 0a                	push   $0xa
c000133f:	eb 27                	jmp    c0001368 <exception>

c0001341 <segment_not_present_fault>:
c0001341:	6a 0b                	push   $0xb
c0001343:	eb 23                	jmp    c0001368 <exception>

c0001345 <stack_exception_fault>:
c0001345:	6a 0c                	push   $0xc
c0001347:	eb 1f                	jmp    c0001368 <exception>

c0001349 <general_protection_exception_fault>:
c0001349:	6a 0d                	push   $0xd
c000134b:	e8 87 6d 00 00       	call   c00080d7 <exception_handler>
c0001350:	83 c4 08             	add    $0x8,%esp
c0001353:	cf                   	iret   

c0001354 <page_fault>:
c0001354:	6a 0e                	push   $0xe
c0001356:	eb 10                	jmp    c0001368 <exception>

c0001358 <coprocessor_error_fault>:
c0001358:	6a ff                	push   $0xffffffff
c000135a:	6a 10                	push   $0x10
c000135c:	eb 0a                	jmp    c0001368 <exception>

c000135e <align_check_fault>:
c000135e:	6a 11                	push   $0x11
c0001360:	eb 06                	jmp    c0001368 <exception>

c0001362 <simd_float_exception_fault>:
c0001362:	6a ff                	push   $0xffffffff
c0001364:	6a 12                	push   $0x12
c0001366:	eb 00                	jmp    c0001368 <exception>

c0001368 <exception>:
c0001368:	e8 6a 6d 00 00       	call   c00080d7 <exception_handler>
c000136d:	83 c4 08             	add    $0x8,%esp
c0001370:	f4                   	hlt    

c0001371 <hwint0>:
c0001371:	60                   	pusha  
c0001372:	1e                   	push   %ds
c0001373:	06                   	push   %es
c0001374:	0f a0                	push   %fs
c0001376:	0f a8                	push   %gs
c0001378:	66 8c d2             	mov    %ss,%dx
c000137b:	8e da                	mov    %edx,%ds
c000137d:	8e c2                	mov    %edx,%es
c000137f:	8e e2                	mov    %edx,%fs
c0001381:	b0 20                	mov    $0x20,%al
c0001383:	e6 20                	out    %al,$0x20
c0001385:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c000138b:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001392:	75 00                	jne    c0001394 <hwint0.1>

c0001394 <hwint0.1>:
c0001394:	e8 b3 34 00 00       	call   c000484c <clock_handler>
c0001399:	e9 e1 00 00 00       	jmp    c000147f <reenter_restore>

c000139e <hwint1>:
c000139e:	60                   	pusha  
c000139f:	1e                   	push   %ds
c00013a0:	06                   	push   %es
c00013a1:	0f a0                	push   %fs
c00013a3:	0f a8                	push   %gs
c00013a5:	66 8c d2             	mov    %ss,%dx
c00013a8:	8e da                	mov    %edx,%ds
c00013aa:	8e c2                	mov    %edx,%es
c00013ac:	8e e2                	mov    %edx,%fs
c00013ae:	b0 fa                	mov    $0xfa,%al
c00013b0:	e6 21                	out    %al,$0x21
c00013b2:	b0 20                	mov    $0x20,%al
c00013b4:	e6 20                	out    %al,$0x20
c00013b6:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c00013bc:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c00013c3:	75 00                	jne    c00013c5 <hwint1.1>

c00013c5 <hwint1.1>:
c00013c5:	e8 e5 43 00 00       	call   c00057af <keyboard_handler>
c00013ca:	b0 f8                	mov    $0xf8,%al
c00013cc:	e6 21                	out    %al,$0x21
c00013ce:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c00013d5:	0f 85 a4 00 00 00    	jne    c000147f <reenter_restore>
c00013db:	e9 9f 00 00 00       	jmp    c000147f <reenter_restore>

c00013e0 <hwint14>:
c00013e0:	60                   	pusha  
c00013e1:	1e                   	push   %ds
c00013e2:	06                   	push   %es
c00013e3:	0f a0                	push   %fs
c00013e5:	0f a8                	push   %gs
c00013e7:	66 8c d2             	mov    %ss,%dx
c00013ea:	8e da                	mov    %edx,%ds
c00013ec:	8e c2                	mov    %edx,%es
c00013ee:	8e e2                	mov    %edx,%fs
c00013f0:	b0 ff                	mov    $0xff,%al
c00013f2:	e6 a1                	out    %al,$0xa1
c00013f4:	b0 20                	mov    $0x20,%al
c00013f6:	e6 20                	out    %al,$0x20
c00013f8:	90                   	nop
c00013f9:	e6 a0                	out    %al,$0xa0
c00013fb:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c0001401:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001408:	75 00                	jne    c000140a <hwint14.1>

c000140a <hwint14.1>:
c000140a:	e8 a4 10 00 00       	call   c00024b3 <hd_handler>
c000140f:	b0 bf                	mov    $0xbf,%al
c0001411:	e6 a1                	out    %al,$0xa1
c0001413:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c000141a:	75 63                	jne    c000147f <reenter_restore>
c000141c:	eb 61                	jmp    c000147f <reenter_restore>

c000141e <sys_call>:
c000141e:	60                   	pusha  
c000141f:	1e                   	push   %ds
c0001420:	06                   	push   %es
c0001421:	0f a0                	push   %fs
c0001423:	0f a8                	push   %gs
c0001425:	89 e6                	mov    %esp,%esi
c0001427:	89 e5                	mov    %esp,%ebp
c0001429:	66 8c d2             	mov    %ss,%dx
c000142c:	8e da                	mov    %edx,%ds
c000142e:	8e c2                	mov    %edx,%es
c0001430:	8e e2                	mov    %edx,%fs
c0001432:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c0001438:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c000143f:	75 00                	jne    c0001441 <sys_call.1>

c0001441 <sys_call.1>:
c0001441:	56                   	push   %esi
c0001442:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001448:	53                   	push   %ebx
c0001449:	51                   	push   %ecx
c000144a:	ff 14 85 2c f1 00 c0 	call   *-0x3fff0ed4(,%eax,4)
c0001451:	83 c4 0c             	add    $0xc,%esp
c0001454:	5e                   	pop    %esi
c0001455:	89 45 2c             	mov    %eax,0x2c(%ebp)
c0001458:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c000145f:	75 1e                	jne    c000147f <reenter_restore>
c0001461:	eb 1c                	jmp    c000147f <reenter_restore>

c0001463 <fork_restart>:
c0001463:	fa                   	cli    
c0001464:	0f a9                	pop    %gs
c0001466:	0f a1                	pop    %fs
c0001468:	07                   	pop    %es
c0001469:	1f                   	pop    %ds
c000146a:	61                   	popa   
c000146b:	cf                   	iret   

c000146c <restart>:
c000146c:	ff 0d a4 07 01 c0    	decl   0xc00107a4
c0001472:	89 e5                	mov    %esp,%ebp
c0001474:	8b 65 04             	mov    0x4(%ebp),%esp
c0001477:	0f a9                	pop    %gs
c0001479:	0f a1                	pop    %fs
c000147b:	07                   	pop    %es
c000147c:	1f                   	pop    %ds
c000147d:	61                   	popa   
c000147e:	cf                   	iret   

c000147f <reenter_restore>:
c000147f:	ff 0d a4 07 01 c0    	decl   0xc00107a4
c0001485:	0f a9                	pop    %gs
c0001487:	0f a1                	pop    %fs
c0001489:	07                   	pop    %es
c000148a:	1f                   	pop    %ds
c000148b:	61                   	popa   
c000148c:	cf                   	iret   

c000148d <in_byte>:
c000148d:	31 d2                	xor    %edx,%edx
c000148f:	8b 54 24 04          	mov    0x4(%esp),%edx
c0001493:	31 c0                	xor    %eax,%eax
c0001495:	ec                   	in     (%dx),%al
c0001496:	90                   	nop
c0001497:	90                   	nop
c0001498:	c3                   	ret    

c0001499 <out_byte>:
c0001499:	31 d2                	xor    %edx,%edx
c000149b:	31 c0                	xor    %eax,%eax
c000149d:	8b 54 24 04          	mov    0x4(%esp),%edx
c00014a1:	8a 44 24 08          	mov    0x8(%esp),%al
c00014a5:	ee                   	out    %al,(%dx)
c00014a6:	90                   	nop
c00014a7:	90                   	nop
c00014a8:	c3                   	ret    

c00014a9 <in_byte2>:
c00014a9:	55                   	push   %ebp
c00014aa:	89 e5                	mov    %esp,%ebp
c00014ac:	52                   	push   %edx
c00014ad:	31 d2                	xor    %edx,%edx
c00014af:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00014b3:	31 c0                	xor    %eax,%eax
c00014b5:	ec                   	in     (%dx),%al
c00014b6:	90                   	nop
c00014b7:	90                   	nop
c00014b8:	5b                   	pop    %ebx
c00014b9:	5d                   	pop    %ebp
c00014ba:	c3                   	ret    

c00014bb <disable_int>:
c00014bb:	fa                   	cli    
c00014bc:	c3                   	ret    

c00014bd <enable_int>:
c00014bd:	fb                   	sti    
c00014be:	c3                   	ret    

c00014bf <check_tss_esp0>:
c00014bf:	55                   	push   %ebp
c00014c0:	89 e5                	mov    %esp,%ebp
c00014c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00014c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00014c8:	83 c0 44             	add    $0x44,%eax
c00014cb:	8b 15 44 16 01 c0    	mov    0xc0011644,%edx
c00014d1:	39 d0                	cmp    %edx,%eax
c00014d3:	74 7c                	je     c0001551 <check_tss_esp0.2>

c00014d5 <check_tss_esp0.1>:
c00014d5:	50                   	push   %eax
c00014d6:	52                   	push   %edx
c00014d7:	68 10 f0 00 c0       	push   $0xc000f010
c00014dc:	e8 ab fd ff ff       	call   c000128c <disp_str>
c00014e1:	83 c4 04             	add    $0x4,%esp
c00014e4:	5a                   	pop    %edx
c00014e5:	58                   	pop    %eax
c00014e6:	52                   	push   %edx
c00014e7:	50                   	push   %eax
c00014e8:	53                   	push   %ebx
c00014e9:	e8 83 6a 00 00       	call   c0007f71 <disp_int>
c00014ee:	83 c4 04             	add    $0x4,%esp
c00014f1:	58                   	pop    %eax
c00014f2:	5a                   	pop    %edx
c00014f3:	52                   	push   %edx
c00014f4:	50                   	push   %eax
c00014f5:	e8 77 6a 00 00       	call   c0007f71 <disp_int>
c00014fa:	58                   	pop    %eax
c00014fb:	5a                   	pop    %edx
c00014fc:	52                   	push   %edx
c00014fd:	50                   	push   %eax
c00014fe:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c0001504:	e8 68 6a 00 00       	call   c0007f71 <disp_int>
c0001509:	83 c4 04             	add    $0x4,%esp
c000150c:	58                   	pop    %eax
c000150d:	5a                   	pop    %edx
c000150e:	52                   	push   %edx
c000150f:	50                   	push   %eax
c0001510:	ff 72 ec             	pushl  -0x14(%edx)
c0001513:	e8 59 6a 00 00       	call   c0007f71 <disp_int>
c0001518:	83 c4 04             	add    $0x4,%esp
c000151b:	58                   	pop    %eax
c000151c:	5a                   	pop    %edx
c000151d:	52                   	push   %edx
c000151e:	50                   	push   %eax
c000151f:	ff 70 ec             	pushl  -0x14(%eax)
c0001522:	e8 4a 6a 00 00       	call   c0007f71 <disp_int>
c0001527:	83 c4 04             	add    $0x4,%esp
c000152a:	58                   	pop    %eax
c000152b:	5a                   	pop    %edx
c000152c:	52                   	push   %edx
c000152d:	50                   	push   %eax
c000152e:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001534:	e8 38 6a 00 00       	call   c0007f71 <disp_int>
c0001539:	83 c4 04             	add    $0x4,%esp
c000153c:	58                   	pop    %eax
c000153d:	5a                   	pop    %edx
c000153e:	52                   	push   %edx
c000153f:	50                   	push   %eax
c0001540:	68 60 07 01 c0       	push   $0xc0010760
c0001545:	e8 27 6a 00 00       	call   c0007f71 <disp_int>
c000154a:	83 c4 04             	add    $0x4,%esp
c000154d:	58                   	pop    %eax
c000154e:	5a                   	pop    %edx
c000154f:	5d                   	pop    %ebp
c0001550:	c3                   	ret    

c0001551 <check_tss_esp0.2>:
c0001551:	5d                   	pop    %ebp
c0001552:	c3                   	ret    

c0001553 <enable_8259A_casecade_irq>:
c0001553:	9c                   	pushf  
c0001554:	fa                   	cli    
c0001555:	e4 21                	in     $0x21,%al
c0001557:	24 fb                	and    $0xfb,%al
c0001559:	e6 21                	out    %al,$0x21
c000155b:	9d                   	popf   
c000155c:	c3                   	ret    

c000155d <disable_8259A_casecade_irq>:
c000155d:	9c                   	pushf  
c000155e:	fa                   	cli    
c000155f:	e4 21                	in     $0x21,%al
c0001561:	0c 04                	or     $0x4,%al
c0001563:	e6 21                	out    %al,$0x21
c0001565:	9c                   	pushf  
c0001566:	c3                   	ret    

c0001567 <enable_8259A_slave_winchester_irq>:
c0001567:	9c                   	pushf  
c0001568:	fa                   	cli    
c0001569:	e4 a1                	in     $0xa1,%al
c000156b:	24 bf                	and    $0xbf,%al
c000156d:	e6 a1                	out    %al,$0xa1
c000156f:	9d                   	popf   
c0001570:	c3                   	ret    

c0001571 <disable_8259A_slave_winchester_irq>:
c0001571:	9c                   	pushf  
c0001572:	fa                   	cli    
c0001573:	e4 a1                	in     $0xa1,%al
c0001575:	0c 40                	or     $0x40,%al
c0001577:	e6 a1                	out    %al,$0xa1
c0001579:	9d                   	popf   
c000157a:	c3                   	ret    

c000157b <update_cr3>:
c000157b:	55                   	push   %ebp
c000157c:	89 e5                	mov    %esp,%ebp
c000157e:	8b 45 08             	mov    0x8(%ebp),%eax
c0001581:	0f 22 d8             	mov    %eax,%cr3
c0001584:	89 ec                	mov    %ebp,%esp
c0001586:	5d                   	pop    %ebp
c0001587:	c3                   	ret    

c0001588 <update_tss>:
c0001588:	55                   	push   %ebp
c0001589:	89 e5                	mov    %esp,%ebp
c000158b:	8b 45 08             	mov    0x8(%ebp),%eax
c000158e:	a3 44 16 01 c0       	mov    %eax,0xc0011644
c0001593:	89 ec                	mov    %ebp,%esp
c0001595:	5d                   	pop    %ebp
c0001596:	c3                   	ret    

c0001597 <get_running_thread_pcb>:
c0001597:	89 e0                	mov    %esp,%eax
c0001599:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000159e:	c3                   	ret    

c000159f <sys_call_test>:
c000159f:	9c                   	pushf  
c00015a0:	66 87 db             	xchg   %bx,%bx
c00015a3:	9d                   	popf   
c00015a4:	c3                   	ret    

c00015a5 <kernel_main>:
c00015a5:	55                   	push   %ebp
c00015a6:	89 e5                	mov    %esp,%ebp
c00015a8:	83 ec 08             	sub    $0x8,%esp
c00015ab:	e8 d0 00 00 00       	call   c0001680 <init>
c00015b0:	e8 e2 ff ff ff       	call   c0001597 <get_running_thread_pcb>
c00015b5:	a3 e0 1e 01 c0       	mov    %eax,0xc0011ee0
c00015ba:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00015bf:	05 00 01 00 00       	add    $0x100,%eax
c00015c4:	83 ec 08             	sub    $0x8,%esp
c00015c7:	50                   	push   %eax
c00015c8:	68 ec 0d 01 c0       	push   $0xc0010dec
c00015cd:	e8 3e 96 00 00       	call   c000ac10 <appendToDoubleLinkList>
c00015d2:	83 c4 10             	add    $0x10,%esp
c00015d5:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00015da:	05 08 01 00 00       	add    $0x108,%eax
c00015df:	83 ec 08             	sub    $0x8,%esp
c00015e2:	50                   	push   %eax
c00015e3:	68 ec 0d 01 c0       	push   $0xc0010dec
c00015e8:	e8 23 96 00 00       	call   c000ac10 <appendToDoubleLinkList>
c00015ed:	83 c4 10             	add    $0x10,%esp
c00015f0:	6a 00                	push   $0x0
c00015f2:	68 c0 af 00 c0       	push   $0xc000afc0
c00015f7:	68 c7 af 00 c0       	push   $0xc000afc7
c00015fc:	68 2c 62 00 c0       	push   $0xc000622c
c0001601:	e8 51 93 00 00       	call   c000a957 <process_execute>
c0001606:	83 c4 10             	add    $0x10,%esp
c0001609:	6a 00                	push   $0x0
c000160b:	68 d0 af 00 c0       	push   $0xc000afd0
c0001610:	68 d8 af 00 c0       	push   $0xc000afd8
c0001615:	68 f1 26 00 c0       	push   $0xc00026f1
c000161a:	e8 38 93 00 00       	call   c000a957 <process_execute>
c000161f:	83 c4 10             	add    $0x10,%esp
c0001622:	6a 00                	push   $0x0
c0001624:	68 e1 af 00 c0       	push   $0xc000afe1
c0001629:	68 e8 af 00 c0       	push   $0xc000afe8
c000162e:	68 2b 18 00 c0       	push   $0xc000182b
c0001633:	e8 1f 93 00 00       	call   c000a957 <process_execute>
c0001638:	83 c4 10             	add    $0x10,%esp
c000163b:	6a 00                	push   $0x0
c000163d:	68 f1 af 00 c0       	push   $0xc000aff1
c0001642:	68 f9 af 00 c0       	push   $0xc000aff9
c0001647:	68 ac 56 00 c0       	push   $0xc00056ac
c000164c:	e8 06 93 00 00       	call   c000a957 <process_execute>
c0001651:	83 c4 10             	add    $0x10,%esp
c0001654:	6a 01                	push   $0x1
c0001656:	68 03 b0 00 c0       	push   $0xc000b003
c000165b:	68 0d b0 00 c0       	push   $0xc000b00d
c0001660:	68 f6 17 00 c0       	push   $0xc00017f6
c0001665:	e8 ed 92 00 00       	call   c000a957 <process_execute>
c000166a:	83 c4 10             	add    $0x10,%esp
c000166d:	83 ec 0c             	sub    $0xc,%esp
c0001670:	68 1a b0 00 c0       	push   $0xc000b01a
c0001675:	e8 12 fc ff ff       	call   c000128c <disp_str>
c000167a:	83 c4 10             	add    $0x10,%esp
c000167d:	fb                   	sti    
c000167e:	eb fe                	jmp    c000167e <kernel_main+0xd9>

c0001680 <init>:
c0001680:	55                   	push   %ebp
c0001681:	89 e5                	mov    %esp,%ebp
c0001683:	83 ec 18             	sub    $0x18,%esp
c0001686:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000168d:	00 00 00 
c0001690:	c7 05 90 07 01 c0 00 	movl   $0x0,0xc0010790
c0001697:	00 00 00 
c000169a:	c7 05 fc 0d 01 c0 09 	movl   $0x9,0xc0010dfc
c00016a1:	00 00 00 
c00016a4:	c7 05 c0 0b 01 c0 00 	movl   $0x0,0xc0010bc0
c00016ab:	00 00 00 
c00016ae:	83 ec 0c             	sub    $0xc,%esp
c00016b1:	68 24 b0 00 c0       	push   $0xc000b024
c00016b6:	e8 d1 fb ff ff       	call   c000128c <disp_str>
c00016bb:	83 c4 10             	add    $0x10,%esp
c00016be:	e8 fe 6d 00 00       	call   c00084c1 <init_keyboard>
c00016c3:	83 ec 0c             	sub    $0xc,%esp
c00016c6:	68 00 00 00 04       	push   $0x4000000
c00016cb:	e8 e2 62 00 00       	call   c00079b2 <init_memory>
c00016d0:	83 c4 10             	add    $0x10,%esp
c00016d3:	83 ec 0c             	sub    $0xc,%esp
c00016d6:	68 ec 0d 01 c0       	push   $0xc0010dec
c00016db:	e8 05 94 00 00       	call   c000aae5 <initDoubleLinkList>
c00016e0:	83 c4 10             	add    $0x10,%esp
c00016e3:	83 ec 0c             	sub    $0xc,%esp
c00016e6:	68 04 1f 01 c0       	push   $0xc0011f04
c00016eb:	e8 f5 93 00 00       	call   c000aae5 <initDoubleLinkList>
c00016f0:	83 c4 10             	add    $0x10,%esp
c00016f3:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00016fa:	00 00 00 
c00016fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001704:	eb 14                	jmp    c000171a <init+0x9a>
c0001706:	83 ec 0c             	sub    $0xc,%esp
c0001709:	68 2a b0 00 c0       	push   $0xc000b02a
c000170e:	e8 79 fb ff ff       	call   c000128c <disp_str>
c0001713:	83 c4 10             	add    $0x10,%esp
c0001716:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000171a:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0001721:	7e e3                	jle    c0001706 <init+0x86>
c0001723:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000172a:	00 00 00 
c000172d:	90                   	nop
c000172e:	c9                   	leave  
c000172f:	c3                   	ret    

c0001730 <kernel_thread_a>:
c0001730:	55                   	push   %ebp
c0001731:	89 e5                	mov    %esp,%ebp
c0001733:	83 ec 18             	sub    $0x18,%esp
c0001736:	83 ec 0c             	sub    $0xc,%esp
c0001739:	ff 75 08             	pushl  0x8(%ebp)
c000173c:	e8 4b fb ff ff       	call   c000128c <disp_str>
c0001741:	83 c4 10             	add    $0x10,%esp
c0001744:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001749:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000174c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001753:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001756:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c000175b:	83 ec 0c             	sub    $0xc,%esp
c000175e:	68 2b b0 00 c0       	push   $0xc000b02b
c0001763:	e8 24 fb ff ff       	call   c000128c <disp_str>
c0001768:	83 c4 10             	add    $0x10,%esp
c000176b:	83 ec 0c             	sub    $0xc,%esp
c000176e:	68 34 b0 00 c0       	push   $0xc000b034
c0001773:	e8 14 fb ff ff       	call   c000128c <disp_str>
c0001778:	83 c4 10             	add    $0x10,%esp
c000177b:	eb d6                	jmp    c0001753 <kernel_thread_a+0x23>

c000177d <kernel_thread_b>:
c000177d:	55                   	push   %ebp
c000177e:	89 e5                	mov    %esp,%ebp
c0001780:	83 ec 18             	sub    $0x18,%esp
c0001783:	83 ec 0c             	sub    $0xc,%esp
c0001786:	ff 75 08             	pushl  0x8(%ebp)
c0001789:	e8 fe fa ff ff       	call   c000128c <disp_str>
c000178e:	83 c4 10             	add    $0x10,%esp
c0001791:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001796:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001799:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00017a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00017a3:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c00017a8:	83 ec 0c             	sub    $0xc,%esp
c00017ab:	68 36 b0 00 c0       	push   $0xc000b036
c00017b0:	e8 d7 fa ff ff       	call   c000128c <disp_str>
c00017b5:	83 c4 10             	add    $0x10,%esp
c00017b8:	83 ec 0c             	sub    $0xc,%esp
c00017bb:	68 34 b0 00 c0       	push   $0xc000b034
c00017c0:	e8 c7 fa ff ff       	call   c000128c <disp_str>
c00017c5:	83 c4 10             	add    $0x10,%esp
c00017c8:	eb d6                	jmp    c00017a0 <kernel_thread_b+0x23>

c00017ca <kernel_thread_c>:
c00017ca:	55                   	push   %ebp
c00017cb:	89 e5                	mov    %esp,%ebp
c00017cd:	83 ec 08             	sub    $0x8,%esp
c00017d0:	83 ec 0c             	sub    $0xc,%esp
c00017d3:	ff 75 08             	pushl  0x8(%ebp)
c00017d6:	e8 b1 fa ff ff       	call   c000128c <disp_str>
c00017db:	83 c4 10             	add    $0x10,%esp
c00017de:	eb fe                	jmp    c00017de <kernel_thread_c+0x14>

c00017e0 <kernel_thread_d>:
c00017e0:	55                   	push   %ebp
c00017e1:	89 e5                	mov    %esp,%ebp
c00017e3:	83 ec 08             	sub    $0x8,%esp
c00017e6:	83 ec 0c             	sub    $0xc,%esp
c00017e9:	ff 75 08             	pushl  0x8(%ebp)
c00017ec:	e8 9b fa ff ff       	call   c000128c <disp_str>
c00017f1:	83 c4 10             	add    $0x10,%esp
c00017f4:	eb fe                	jmp    c00017f4 <kernel_thread_d+0x14>

c00017f6 <user_proc_a>:
c00017f6:	55                   	push   %ebp
c00017f7:	89 e5                	mov    %esp,%ebp
c00017f9:	83 ec 08             	sub    $0x8,%esp
c00017fc:	83 ec 0c             	sub    $0xc,%esp
c00017ff:	68 3f b0 00 c0       	push   $0xc000b03f
c0001804:	e8 83 fa ff ff       	call   c000128c <disp_str>
c0001809:	83 c4 10             	add    $0x10,%esp
c000180c:	e8 80 79 00 00       	call   c0009191 <test_exec>
c0001811:	eb fe                	jmp    c0001811 <user_proc_a+0x1b>

c0001813 <user_proc_b>:
c0001813:	55                   	push   %ebp
c0001814:	89 e5                	mov    %esp,%ebp
c0001816:	83 ec 08             	sub    $0x8,%esp
c0001819:	83 ec 0c             	sub    $0xc,%esp
c000181c:	68 51 b0 00 c0       	push   $0xc000b051
c0001821:	e8 66 fa ff ff       	call   c000128c <disp_str>
c0001826:	83 c4 10             	add    $0x10,%esp
c0001829:	eb fe                	jmp    c0001829 <user_proc_b+0x16>

c000182b <TaskHD>:
c000182b:	55                   	push   %ebp
c000182c:	89 e5                	mov    %esp,%ebp
c000182e:	83 ec 18             	sub    $0x18,%esp
c0001831:	e8 61 fd ff ff       	call   c0001597 <get_running_thread_pcb>
c0001836:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001839:	e8 32 00 00 00       	call   c0001870 <init_hd>
c000183e:	83 ec 0c             	sub    $0xc,%esp
c0001841:	6a 7c                	push   $0x7c
c0001843:	e8 7c 0e 00 00       	call   c00026c4 <sys_malloc>
c0001848:	83 c4 10             	add    $0x10,%esp
c000184b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000184e:	83 ec 04             	sub    $0x4,%esp
c0001851:	6a 7c                	push   $0x7c
c0001853:	6a 00                	push   $0x0
c0001855:	ff 75 f0             	pushl  -0x10(%ebp)
c0001858:	e8 9a a5 00 00       	call   c000bdf7 <Memset>
c000185d:	83 c4 10             	add    $0x10,%esp
c0001860:	83 ec 0c             	sub    $0xc,%esp
c0001863:	ff 75 f0             	pushl  -0x10(%ebp)
c0001866:	e8 1f 00 00 00       	call   c000188a <hd_handle>
c000186b:	83 c4 10             	add    $0x10,%esp
c000186e:	eb de                	jmp    c000184e <TaskHD+0x23>

c0001870 <init_hd>:
c0001870:	55                   	push   %ebp
c0001871:	89 e5                	mov    %esp,%ebp
c0001873:	83 ec 18             	sub    $0x18,%esp
c0001876:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c000187d:	e8 d1 fc ff ff       	call   c0001553 <enable_8259A_casecade_irq>
c0001882:	e8 e0 fc ff ff       	call   c0001567 <enable_8259A_slave_winchester_irq>
c0001887:	90                   	nop
c0001888:	c9                   	leave  
c0001889:	c3                   	ret    

c000188a <hd_handle>:
c000188a:	55                   	push   %ebp
c000188b:	89 e5                	mov    %esp,%ebp
c000188d:	83 ec 18             	sub    $0x18,%esp
c0001890:	83 ec 04             	sub    $0x4,%esp
c0001893:	6a 12                	push   $0x12
c0001895:	ff 75 08             	pushl  0x8(%ebp)
c0001898:	6a 02                	push   $0x2
c000189a:	e8 9d 87 00 00       	call   c000a03c <send_rec>
c000189f:	83 c4 10             	add    $0x10,%esp
c00018a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00018a5:	8b 40 78             	mov    0x78(%eax),%eax
c00018a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00018ab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00018af:	0f 84 d4 00 00 00    	je     c0001989 <hd_handle+0xff>
c00018b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00018b8:	8b 00                	mov    (%eax),%eax
c00018ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00018bd:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c00018c1:	74 28                	je     c00018eb <hd_handle+0x61>
c00018c3:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00018c7:	74 22                	je     c00018eb <hd_handle+0x61>
c00018c9:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c00018cd:	74 1c                	je     c00018eb <hd_handle+0x61>
c00018cf:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c00018d3:	74 16                	je     c00018eb <hd_handle+0x61>
c00018d5:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c00018dc:	74 0d                	je     c00018eb <hd_handle+0x61>
c00018de:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00018e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00018e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00018eb:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c00018ef:	74 34                	je     c0001925 <hd_handle+0x9b>
c00018f1:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c00018f5:	74 2e                	je     c0001925 <hd_handle+0x9b>
c00018f7:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c00018fb:	74 28                	je     c0001925 <hd_handle+0x9b>
c00018fd:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001901:	74 22                	je     c0001925 <hd_handle+0x9b>
c0001903:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c000190a:	74 19                	je     c0001925 <hd_handle+0x9b>
c000190c:	6a 6d                	push   $0x6d
c000190e:	68 64 b0 00 c0       	push   $0xc000b064
c0001913:	68 64 b0 00 c0       	push   $0xc000b064
c0001918:	68 6c b0 00 c0       	push   $0xc000b06c
c000191d:	e8 dd 7d 00 00       	call   c00096ff <assertion_failure>
c0001922:	83 c4 10             	add    $0x10,%esp
c0001925:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001929:	74 2c                	je     c0001957 <hd_handle+0xcd>
c000192b:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c000192f:	77 0e                	ja     c000193f <hd_handle+0xb5>
c0001931:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001935:	74 19                	je     c0001950 <hd_handle+0xc6>
c0001937:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c000193b:	74 1a                	je     c0001957 <hd_handle+0xcd>
c000193d:	eb 37                	jmp    c0001976 <hd_handle+0xec>
c000193f:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001943:	74 22                	je     c0001967 <hd_handle+0xdd>
c0001945:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c000194c:	74 3e                	je     c000198c <hd_handle+0x102>
c000194e:	eb 26                	jmp    c0001976 <hd_handle+0xec>
c0001950:	e8 e6 06 00 00       	call   c000203b <hd_open>
c0001955:	eb 36                	jmp    c000198d <hd_handle+0x103>
c0001957:	83 ec 0c             	sub    $0xc,%esp
c000195a:	ff 75 08             	pushl  0x8(%ebp)
c000195d:	e8 b2 08 00 00       	call   c0002214 <hd_rdwt>
c0001962:	83 c4 10             	add    $0x10,%esp
c0001965:	eb 26                	jmp    c000198d <hd_handle+0x103>
c0001967:	83 ec 0c             	sub    $0xc,%esp
c000196a:	6a 00                	push   $0x0
c000196c:	e8 71 07 00 00       	call   c00020e2 <get_hd_ioctl>
c0001971:	83 c4 10             	add    $0x10,%esp
c0001974:	eb 17                	jmp    c000198d <hd_handle+0x103>
c0001976:	83 ec 0c             	sub    $0xc,%esp
c0001979:	68 c6 b0 00 c0       	push   $0xc000b0c6
c000197e:	e8 38 7d 00 00       	call   c00096bb <spin>
c0001983:	83 c4 10             	add    $0x10,%esp
c0001986:	90                   	nop
c0001987:	eb 04                	jmp    c000198d <hd_handle+0x103>
c0001989:	90                   	nop
c000198a:	eb 01                	jmp    c000198d <hd_handle+0x103>
c000198c:	90                   	nop
c000198d:	c9                   	leave  
c000198e:	c3                   	ret    

c000198f <hd_cmd_out>:
c000198f:	55                   	push   %ebp
c0001990:	89 e5                	mov    %esp,%ebp
c0001992:	83 ec 08             	sub    $0x8,%esp
c0001995:	83 ec 04             	sub    $0x4,%esp
c0001998:	68 18 73 01 00       	push   $0x17318
c000199d:	6a 00                	push   $0x0
c000199f:	68 80 00 00 00       	push   $0x80
c00019a4:	e8 36 0b 00 00       	call   c00024df <waitfor>
c00019a9:	83 c4 10             	add    $0x10,%esp
c00019ac:	85 c0                	test   %eax,%eax
c00019ae:	75 10                	jne    c00019c0 <hd_cmd_out+0x31>
c00019b0:	83 ec 0c             	sub    $0xc,%esp
c00019b3:	68 d8 b0 00 c0       	push   $0xc000b0d8
c00019b8:	e8 24 7d 00 00       	call   c00096e1 <panic>
c00019bd:	83 c4 10             	add    $0x10,%esp
c00019c0:	83 ec 08             	sub    $0x8,%esp
c00019c3:	6a 00                	push   $0x0
c00019c5:	68 f6 03 00 00       	push   $0x3f6
c00019ca:	e8 ca fa ff ff       	call   c0001499 <out_byte>
c00019cf:	83 c4 10             	add    $0x10,%esp
c00019d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00019d5:	0f b6 00             	movzbl (%eax),%eax
c00019d8:	0f b6 c0             	movzbl %al,%eax
c00019db:	83 ec 08             	sub    $0x8,%esp
c00019de:	50                   	push   %eax
c00019df:	68 f1 01 00 00       	push   $0x1f1
c00019e4:	e8 b0 fa ff ff       	call   c0001499 <out_byte>
c00019e9:	83 c4 10             	add    $0x10,%esp
c00019ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00019ef:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c00019f3:	0f b6 c0             	movzbl %al,%eax
c00019f6:	83 ec 08             	sub    $0x8,%esp
c00019f9:	50                   	push   %eax
c00019fa:	68 f2 01 00 00       	push   $0x1f2
c00019ff:	e8 95 fa ff ff       	call   c0001499 <out_byte>
c0001a04:	83 c4 10             	add    $0x10,%esp
c0001a07:	8b 45 08             	mov    0x8(%ebp),%eax
c0001a0a:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001a0e:	0f b6 c0             	movzbl %al,%eax
c0001a11:	83 ec 08             	sub    $0x8,%esp
c0001a14:	50                   	push   %eax
c0001a15:	68 f3 01 00 00       	push   $0x1f3
c0001a1a:	e8 7a fa ff ff       	call   c0001499 <out_byte>
c0001a1f:	83 c4 10             	add    $0x10,%esp
c0001a22:	8b 45 08             	mov    0x8(%ebp),%eax
c0001a25:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001a29:	0f b6 c0             	movzbl %al,%eax
c0001a2c:	83 ec 08             	sub    $0x8,%esp
c0001a2f:	50                   	push   %eax
c0001a30:	68 f4 01 00 00       	push   $0x1f4
c0001a35:	e8 5f fa ff ff       	call   c0001499 <out_byte>
c0001a3a:	83 c4 10             	add    $0x10,%esp
c0001a3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001a40:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001a44:	0f b6 c0             	movzbl %al,%eax
c0001a47:	83 ec 08             	sub    $0x8,%esp
c0001a4a:	50                   	push   %eax
c0001a4b:	68 f5 01 00 00       	push   $0x1f5
c0001a50:	e8 44 fa ff ff       	call   c0001499 <out_byte>
c0001a55:	83 c4 10             	add    $0x10,%esp
c0001a58:	8b 45 08             	mov    0x8(%ebp),%eax
c0001a5b:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001a5f:	0f b6 c0             	movzbl %al,%eax
c0001a62:	83 ec 08             	sub    $0x8,%esp
c0001a65:	50                   	push   %eax
c0001a66:	68 f6 01 00 00       	push   $0x1f6
c0001a6b:	e8 29 fa ff ff       	call   c0001499 <out_byte>
c0001a70:	83 c4 10             	add    $0x10,%esp
c0001a73:	8b 45 08             	mov    0x8(%ebp),%eax
c0001a76:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001a7a:	0f b6 c0             	movzbl %al,%eax
c0001a7d:	83 ec 08             	sub    $0x8,%esp
c0001a80:	50                   	push   %eax
c0001a81:	68 f7 01 00 00       	push   $0x1f7
c0001a86:	e8 0e fa ff ff       	call   c0001499 <out_byte>
c0001a8b:	83 c4 10             	add    $0x10,%esp
c0001a8e:	90                   	nop
c0001a8f:	c9                   	leave  
c0001a90:	c3                   	ret    

c0001a91 <hd_identify>:
c0001a91:	55                   	push   %ebp
c0001a92:	89 e5                	mov    %esp,%ebp
c0001a94:	53                   	push   %ebx
c0001a95:	83 ec 24             	sub    $0x24,%esp
c0001a98:	89 e0                	mov    %esp,%eax
c0001a9a:	89 c3                	mov    %eax,%ebx
c0001a9c:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001aa0:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001aa4:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001aa8:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001aac:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001ab0:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ab3:	c1 e0 04             	shl    $0x4,%eax
c0001ab6:	83 c8 e0             	or     $0xffffffe0,%eax
c0001ab9:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001abc:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001ac0:	83 ec 0c             	sub    $0xc,%esp
c0001ac3:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001ac6:	50                   	push   %eax
c0001ac7:	e8 c3 fe ff ff       	call   c000198f <hd_cmd_out>
c0001acc:	83 c4 10             	add    $0x10,%esp
c0001acf:	e8 f0 06 00 00       	call   c00021c4 <interrupt_wait>
c0001ad4:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001adb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ade:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001ae1:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001ae4:	89 c2                	mov    %eax,%edx
c0001ae6:	b8 10 00 00 00       	mov    $0x10,%eax
c0001aeb:	83 e8 01             	sub    $0x1,%eax
c0001aee:	01 d0                	add    %edx,%eax
c0001af0:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001af5:	ba 00 00 00 00       	mov    $0x0,%edx
c0001afa:	f7 f1                	div    %ecx
c0001afc:	6b c0 10             	imul   $0x10,%eax,%eax
c0001aff:	29 c4                	sub    %eax,%esp
c0001b01:	89 e0                	mov    %esp,%eax
c0001b03:	83 c0 00             	add    $0x0,%eax
c0001b06:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001b09:	83 ec 04             	sub    $0x4,%esp
c0001b0c:	ff 75 f4             	pushl  -0xc(%ebp)
c0001b0f:	6a 00                	push   $0x0
c0001b11:	ff 75 ec             	pushl  -0x14(%ebp)
c0001b14:	e8 de a2 00 00       	call   c000bdf7 <Memset>
c0001b19:	83 c4 10             	add    $0x10,%esp
c0001b1c:	83 ec 04             	sub    $0x4,%esp
c0001b1f:	ff 75 f4             	pushl  -0xc(%ebp)
c0001b22:	ff 75 ec             	pushl  -0x14(%ebp)
c0001b25:	68 f0 01 00 00       	push   $0x1f0
c0001b2a:	e8 1c a3 00 00       	call   c000be4b <read_port>
c0001b2f:	83 c4 10             	add    $0x10,%esp
c0001b32:	83 ec 0c             	sub    $0xc,%esp
c0001b35:	ff 75 ec             	pushl  -0x14(%ebp)
c0001b38:	e8 0b 00 00 00       	call   c0001b48 <print_hdinfo>
c0001b3d:	83 c4 10             	add    $0x10,%esp
c0001b40:	89 dc                	mov    %ebx,%esp
c0001b42:	90                   	nop
c0001b43:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001b46:	c9                   	leave  
c0001b47:	c3                   	ret    

c0001b48 <print_hdinfo>:
c0001b48:	55                   	push   %ebp
c0001b49:	89 e5                	mov    %esp,%ebp
c0001b4b:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001b51:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001b57:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001b5d:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001b64:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001b6b:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001b72:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001b79:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001b80:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001b86:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001b8c:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001b93:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001b9a:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001ba1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001ba8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001baf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001bb6:	e9 8f 00 00 00       	jmp    c0001c4a <print_hdinfo+0x102>
c0001bbb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001bc2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001bc5:	89 d0                	mov    %edx,%eax
c0001bc7:	01 c0                	add    %eax,%eax
c0001bc9:	01 d0                	add    %edx,%eax
c0001bcb:	c1 e0 03             	shl    $0x3,%eax
c0001bce:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001bd1:	01 c8                	add    %ecx,%eax
c0001bd3:	83 e8 44             	sub    $0x44,%eax
c0001bd6:	0f b7 00             	movzwl (%eax),%eax
c0001bd9:	0f b7 c0             	movzwl %ax,%eax
c0001bdc:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001bdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001be2:	01 d0                	add    %edx,%eax
c0001be4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001be7:	eb 30                	jmp    c0001c19 <print_hdinfo+0xd1>
c0001be9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001bec:	8d 50 01             	lea    0x1(%eax),%edx
c0001bef:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001bf2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001bf5:	83 c2 01             	add    $0x1,%edx
c0001bf8:	0f b6 00             	movzbl (%eax),%eax
c0001bfb:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001bff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001c02:	8d 50 01             	lea    0x1(%eax),%edx
c0001c05:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001c08:	0f b6 00             	movzbl (%eax),%eax
c0001c0b:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001c0e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001c11:	01 ca                	add    %ecx,%edx
c0001c13:	88 02                	mov    %al,(%edx)
c0001c15:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001c19:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001c1c:	89 d0                	mov    %edx,%eax
c0001c1e:	01 c0                	add    %eax,%eax
c0001c20:	01 d0                	add    %edx,%eax
c0001c22:	c1 e0 03             	shl    $0x3,%eax
c0001c25:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001c28:	01 c8                	add    %ecx,%eax
c0001c2a:	83 e8 42             	sub    $0x42,%eax
c0001c2d:	0f b7 00             	movzwl (%eax),%eax
c0001c30:	66 d1 e8             	shr    %ax
c0001c33:	0f b7 c0             	movzwl %ax,%eax
c0001c36:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001c39:	7c ae                	jl     c0001be9 <print_hdinfo+0xa1>
c0001c3b:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001c3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001c41:	01 d0                	add    %edx,%eax
c0001c43:	c6 00 00             	movb   $0x0,(%eax)
c0001c46:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001c4a:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001c4e:	0f 8e 67 ff ff ff    	jle    c0001bbb <print_hdinfo+0x73>
c0001c54:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c57:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001c5b:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001c5f:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001c63:	66 c1 e8 08          	shr    $0x8,%ax
c0001c67:	66 85 c0             	test   %ax,%ax
c0001c6a:	0f 95 c0             	setne  %al
c0001c6d:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001c70:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001c77:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001c7d:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001c81:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001c85:	75 15                	jne    c0001c9c <print_hdinfo+0x154>
c0001c87:	83 ec 08             	sub    $0x8,%esp
c0001c8a:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001c8d:	50                   	push   %eax
c0001c8e:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001c91:	50                   	push   %eax
c0001c92:	e8 7f a1 00 00       	call   c000be16 <Strcpy>
c0001c97:	83 c4 10             	add    $0x10,%esp
c0001c9a:	eb 13                	jmp    c0001caf <print_hdinfo+0x167>
c0001c9c:	83 ec 08             	sub    $0x8,%esp
c0001c9f:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001ca2:	50                   	push   %eax
c0001ca3:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001ca6:	50                   	push   %eax
c0001ca7:	e8 6a a1 00 00       	call   c000be16 <Strcpy>
c0001cac:	83 c4 10             	add    $0x10,%esp
c0001caf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cb2:	83 c0 7a             	add    $0x7a,%eax
c0001cb5:	0f b7 00             	movzwl (%eax),%eax
c0001cb8:	0f b7 d0             	movzwl %ax,%edx
c0001cbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cbe:	83 c0 78             	add    $0x78,%eax
c0001cc1:	0f b7 00             	movzwl (%eax),%eax
c0001cc4:	0f b7 c0             	movzwl %ax,%eax
c0001cc7:	83 c0 10             	add    $0x10,%eax
c0001cca:	89 c1                	mov    %eax,%ecx
c0001ccc:	d3 e2                	shl    %cl,%edx
c0001cce:	89 d0                	mov    %edx,%eax
c0001cd0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001cd3:	90                   	nop
c0001cd4:	c9                   	leave  
c0001cd5:	c3                   	ret    

c0001cd6 <print_dpt_entry>:
c0001cd6:	55                   	push   %ebp
c0001cd7:	89 e5                	mov    %esp,%ebp
c0001cd9:	83 ec 08             	sub    $0x8,%esp
c0001cdc:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cdf:	8b 40 08             	mov    0x8(%eax),%eax
c0001ce2:	83 ec 08             	sub    $0x8,%esp
c0001ce5:	50                   	push   %eax
c0001ce6:	68 e2 b0 00 c0       	push   $0xc000b0e2
c0001ceb:	e8 b2 76 00 00       	call   c00093a2 <Printf>
c0001cf0:	83 c4 10             	add    $0x10,%esp
c0001cf3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cf6:	8b 40 0c             	mov    0xc(%eax),%eax
c0001cf9:	83 ec 08             	sub    $0x8,%esp
c0001cfc:	50                   	push   %eax
c0001cfd:	68 ea b0 00 c0       	push   $0xc000b0ea
c0001d02:	e8 9b 76 00 00       	call   c00093a2 <Printf>
c0001d07:	83 c4 10             	add    $0x10,%esp
c0001d0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d0d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001d11:	0f b6 c0             	movzbl %al,%eax
c0001d14:	83 ec 08             	sub    $0x8,%esp
c0001d17:	50                   	push   %eax
c0001d18:	68 fb b0 00 c0       	push   $0xc000b0fb
c0001d1d:	e8 80 76 00 00       	call   c00093a2 <Printf>
c0001d22:	83 c4 10             	add    $0x10,%esp
c0001d25:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d28:	0f b6 00             	movzbl (%eax),%eax
c0001d2b:	0f b6 c0             	movzbl %al,%eax
c0001d2e:	83 ec 08             	sub    $0x8,%esp
c0001d31:	50                   	push   %eax
c0001d32:	68 09 b1 00 c0       	push   $0xc000b109
c0001d37:	e8 66 76 00 00       	call   c00093a2 <Printf>
c0001d3c:	83 c4 10             	add    $0x10,%esp
c0001d3f:	90                   	nop
c0001d40:	c9                   	leave  
c0001d41:	c3                   	ret    

c0001d42 <get_partition_table>:
c0001d42:	55                   	push   %ebp
c0001d43:	89 e5                	mov    %esp,%ebp
c0001d45:	53                   	push   %ebx
c0001d46:	83 ec 24             	sub    $0x24,%esp
c0001d49:	89 e0                	mov    %esp,%eax
c0001d4b:	89 c3                	mov    %eax,%ebx
c0001d4d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001d51:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001d55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001d58:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001d5b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001d5e:	c1 f8 08             	sar    $0x8,%eax
c0001d61:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001d64:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001d67:	c1 f8 10             	sar    $0x10,%eax
c0001d6a:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001d6d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001d70:	c1 f8 18             	sar    $0x18,%eax
c0001d73:	89 c2                	mov    %eax,%edx
c0001d75:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d78:	c1 e0 04             	shl    $0x4,%eax
c0001d7b:	09 d0                	or     %edx,%eax
c0001d7d:	83 c8 e0             	or     $0xffffffe0,%eax
c0001d80:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001d83:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0001d87:	83 ec 0c             	sub    $0xc,%esp
c0001d8a:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0001d8d:	50                   	push   %eax
c0001d8e:	e8 fc fb ff ff       	call   c000198f <hd_cmd_out>
c0001d93:	83 c4 10             	add    $0x10,%esp
c0001d96:	e8 29 04 00 00       	call   c00021c4 <interrupt_wait>
c0001d9b:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001da5:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001da8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001dab:	89 c2                	mov    %eax,%edx
c0001dad:	b8 10 00 00 00       	mov    $0x10,%eax
c0001db2:	83 e8 01             	sub    $0x1,%eax
c0001db5:	01 d0                	add    %edx,%eax
c0001db7:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001dbc:	ba 00 00 00 00       	mov    $0x0,%edx
c0001dc1:	f7 f1                	div    %ecx
c0001dc3:	6b c0 10             	imul   $0x10,%eax,%eax
c0001dc6:	29 c4                	sub    %eax,%esp
c0001dc8:	89 e0                	mov    %esp,%eax
c0001dca:	83 c0 00             	add    $0x0,%eax
c0001dcd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001dd0:	83 ec 04             	sub    $0x4,%esp
c0001dd3:	ff 75 f4             	pushl  -0xc(%ebp)
c0001dd6:	6a 00                	push   $0x0
c0001dd8:	ff 75 ec             	pushl  -0x14(%ebp)
c0001ddb:	e8 17 a0 00 00       	call   c000bdf7 <Memset>
c0001de0:	83 c4 10             	add    $0x10,%esp
c0001de3:	83 ec 04             	sub    $0x4,%esp
c0001de6:	ff 75 f4             	pushl  -0xc(%ebp)
c0001de9:	ff 75 ec             	pushl  -0x14(%ebp)
c0001dec:	68 f0 01 00 00       	push   $0x1f0
c0001df1:	e8 55 a0 00 00       	call   c000be4b <read_port>
c0001df6:	83 c4 10             	add    $0x10,%esp
c0001df9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001dfc:	05 be 01 00 00       	add    $0x1be,%eax
c0001e01:	83 ec 04             	sub    $0x4,%esp
c0001e04:	6a 40                	push   $0x40
c0001e06:	50                   	push   %eax
c0001e07:	ff 75 10             	pushl  0x10(%ebp)
c0001e0a:	e8 79 5d 00 00       	call   c0007b88 <Memcpy>
c0001e0f:	83 c4 10             	add    $0x10,%esp
c0001e12:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0001e19:	89 dc                	mov    %ebx,%esp
c0001e1b:	90                   	nop
c0001e1c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001e1f:	c9                   	leave  
c0001e20:	c3                   	ret    

c0001e21 <partition>:
c0001e21:	55                   	push   %ebp
c0001e22:	89 e5                	mov    %esp,%ebp
c0001e24:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001e2a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001e2d:	88 45 84             	mov    %al,-0x7c(%ebp)
c0001e30:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0001e34:	7f 19                	jg     c0001e4f <partition+0x2e>
c0001e36:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001e39:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001e3e:	89 c8                	mov    %ecx,%eax
c0001e40:	f7 ea                	imul   %edx
c0001e42:	d1 fa                	sar    %edx
c0001e44:	89 c8                	mov    %ecx,%eax
c0001e46:	c1 f8 1f             	sar    $0x1f,%eax
c0001e49:	29 c2                	sub    %eax,%edx
c0001e4b:	89 d0                	mov    %edx,%eax
c0001e4d:	eb 11                	jmp    c0001e60 <partition+0x3f>
c0001e4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e52:	83 e8 10             	sub    $0x10,%eax
c0001e55:	8d 50 3f             	lea    0x3f(%eax),%edx
c0001e58:	85 c0                	test   %eax,%eax
c0001e5a:	0f 48 c2             	cmovs  %edx,%eax
c0001e5d:	c1 f8 06             	sar    $0x6,%eax
c0001e60:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001e63:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0001e67:	0f 85 cc 00 00 00    	jne    c0001f39 <partition+0x118>
c0001e6d:	83 ec 04             	sub    $0x4,%esp
c0001e70:	6a 40                	push   $0x40
c0001e72:	6a 00                	push   $0x0
c0001e74:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001e77:	50                   	push   %eax
c0001e78:	e8 7a 9f 00 00       	call   c000bdf7 <Memset>
c0001e7d:	83 c4 10             	add    $0x10,%esp
c0001e80:	83 ec 04             	sub    $0x4,%esp
c0001e83:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001e86:	50                   	push   %eax
c0001e87:	6a 00                	push   $0x0
c0001e89:	ff 75 e8             	pushl  -0x18(%ebp)
c0001e8c:	e8 b1 fe ff ff       	call   c0001d42 <get_partition_table>
c0001e91:	83 c4 10             	add    $0x10,%esp
c0001e94:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001e9b:	e9 8a 00 00 00       	jmp    c0001f2a <partition+0x109>
c0001ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ea3:	83 c0 01             	add    $0x1,%eax
c0001ea6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001ea9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001eac:	c1 e0 04             	shl    $0x4,%eax
c0001eaf:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001eb2:	01 c8                	add    %ecx,%eax
c0001eb4:	83 e8 5c             	sub    $0x5c,%eax
c0001eb7:	8b 00                	mov    (%eax),%eax
c0001eb9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001ebc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001ebf:	c1 e1 03             	shl    $0x3,%ecx
c0001ec2:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001ec8:	01 ca                	add    %ecx,%edx
c0001eca:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c0001ed0:	89 02                	mov    %eax,(%edx)
c0001ed2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ed5:	c1 e0 04             	shl    $0x4,%eax
c0001ed8:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001edb:	01 c8                	add    %ecx,%eax
c0001edd:	83 e8 58             	sub    $0x58,%eax
c0001ee0:	8b 00                	mov    (%eax),%eax
c0001ee2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0001ee5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0001ee8:	c1 e1 03             	shl    $0x3,%ecx
c0001eeb:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0001ef1:	01 ca                	add    %ecx,%edx
c0001ef3:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0001ef9:	89 02                	mov    %eax,(%edx)
c0001efb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001efe:	c1 e0 04             	shl    $0x4,%eax
c0001f01:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001f04:	01 c8                	add    %ecx,%eax
c0001f06:	83 e8 60             	sub    $0x60,%eax
c0001f09:	0f b6 00             	movzbl (%eax),%eax
c0001f0c:	3c 05                	cmp    $0x5,%al
c0001f0e:	75 16                	jne    c0001f26 <partition+0x105>
c0001f10:	8b 55 08             	mov    0x8(%ebp),%edx
c0001f13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0001f16:	01 d0                	add    %edx,%eax
c0001f18:	83 ec 08             	sub    $0x8,%esp
c0001f1b:	6a 01                	push   $0x1
c0001f1d:	50                   	push   %eax
c0001f1e:	e8 fe fe ff ff       	call   c0001e21 <partition>
c0001f23:	83 c4 10             	add    $0x10,%esp
c0001f26:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001f2a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0001f2e:	0f 8e 6c ff ff ff    	jle    c0001ea0 <partition+0x7f>
c0001f34:	e9 ff 00 00 00       	jmp    c0002038 <partition+0x217>
c0001f39:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0001f3d:	0f 85 f5 00 00 00    	jne    c0002038 <partition+0x217>
c0001f43:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0001f46:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0001f4b:	89 c8                	mov    %ecx,%eax
c0001f4d:	f7 ea                	imul   %edx
c0001f4f:	d1 fa                	sar    %edx
c0001f51:	89 c8                	mov    %ecx,%eax
c0001f53:	c1 f8 1f             	sar    $0x1f,%eax
c0001f56:	29 c2                	sub    %eax,%edx
c0001f58:	89 d0                	mov    %edx,%eax
c0001f5a:	c1 e0 02             	shl    $0x2,%eax
c0001f5d:	01 d0                	add    %edx,%eax
c0001f5f:	29 c1                	sub    %eax,%ecx
c0001f61:	89 c8                	mov    %ecx,%eax
c0001f63:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0001f66:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0001f69:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001f6c:	c1 e2 03             	shl    $0x3,%edx
c0001f6f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001f75:	01 d0                	add    %edx,%eax
c0001f77:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0001f7c:	8b 00                	mov    (%eax),%eax
c0001f7e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0001f81:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0001f84:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001f87:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0001f8a:	83 e8 01             	sub    $0x1,%eax
c0001f8d:	c1 e0 04             	shl    $0x4,%eax
c0001f90:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0001f93:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0001f9a:	e9 8c 00 00 00       	jmp    c000202b <partition+0x20a>
c0001f9f:	83 ec 04             	sub    $0x4,%esp
c0001fa2:	6a 40                	push   $0x40
c0001fa4:	6a 00                	push   $0x0
c0001fa6:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001fa9:	50                   	push   %eax
c0001faa:	e8 48 9e 00 00       	call   c000bdf7 <Memset>
c0001faf:	83 c4 10             	add    $0x10,%esp
c0001fb2:	83 ec 04             	sub    $0x4,%esp
c0001fb5:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0001fb8:	50                   	push   %eax
c0001fb9:	ff 75 f0             	pushl  -0x10(%ebp)
c0001fbc:	ff 75 e8             	pushl  -0x18(%ebp)
c0001fbf:	e8 7e fd ff ff       	call   c0001d42 <get_partition_table>
c0001fc4:	83 c4 10             	add    $0x10,%esp
c0001fc7:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0001fca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001fcd:	01 d0                	add    %edx,%eax
c0001fcf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0001fd2:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0001fd5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001fd8:	01 c2                	add    %eax,%edx
c0001fda:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0001fdd:	8d 48 04             	lea    0x4(%eax),%ecx
c0001fe0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0001fe3:	c1 e1 03             	shl    $0x3,%ecx
c0001fe6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0001fec:	01 c8                	add    %ecx,%eax
c0001fee:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0001ff3:	89 10                	mov    %edx,(%eax)
c0001ff5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0001ff8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0001ffb:	8d 4a 04             	lea    0x4(%edx),%ecx
c0001ffe:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002001:	c1 e1 03             	shl    $0x3,%ecx
c0002004:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000200a:	01 ca                	add    %ecx,%edx
c000200c:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0002012:	89 02                	mov    %eax,(%edx)
c0002014:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0002018:	84 c0                	test   %al,%al
c000201a:	74 1b                	je     c0002037 <partition+0x216>
c000201c:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000201f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002022:	01 d0                	add    %edx,%eax
c0002024:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002027:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000202b:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c000202f:	0f 8e 6a ff ff ff    	jle    c0001f9f <partition+0x17e>
c0002035:	eb 01                	jmp    c0002038 <partition+0x217>
c0002037:	90                   	nop
c0002038:	90                   	nop
c0002039:	c9                   	leave  
c000203a:	c3                   	ret    

c000203b <hd_open>:
c000203b:	55                   	push   %ebp
c000203c:	89 e5                	mov    %esp,%ebp
c000203e:	83 ec 18             	sub    $0x18,%esp
c0002041:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002048:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000204b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002051:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c0002056:	8b 00                	mov    (%eax),%eax
c0002058:	8d 50 01             	lea    0x1(%eax),%edx
c000205b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000205e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002064:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c0002069:	89 10                	mov    %edx,(%eax)
c000206b:	83 ec 0c             	sub    $0xc,%esp
c000206e:	6a 00                	push   $0x0
c0002070:	e8 1c fa ff ff       	call   c0001a91 <hd_identify>
c0002075:	83 c4 10             	add    $0x10,%esp
c0002078:	83 ec 08             	sub    $0x8,%esp
c000207b:	6a 00                	push   $0x0
c000207d:	6a 00                	push   $0x0
c000207f:	e8 9d fd ff ff       	call   c0001e21 <partition>
c0002084:	83 c4 10             	add    $0x10,%esp
c0002087:	83 ec 0c             	sub    $0xc,%esp
c000208a:	6a 7c                	push   $0x7c
c000208c:	e8 33 06 00 00       	call   c00026c4 <sys_malloc>
c0002091:	83 c4 10             	add    $0x10,%esp
c0002094:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002097:	83 ec 04             	sub    $0x4,%esp
c000209a:	6a 7c                	push   $0x7c
c000209c:	6a 00                	push   $0x0
c000209e:	ff 75 f0             	pushl  -0x10(%ebp)
c00020a1:	e8 51 9d 00 00       	call   c000bdf7 <Memset>
c00020a6:	83 c4 10             	add    $0x10,%esp
c00020a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00020ac:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c00020b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00020b6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00020bd:	83 ec 04             	sub    $0x4,%esp
c00020c0:	6a 02                	push   $0x2
c00020c2:	ff 75 f0             	pushl  -0x10(%ebp)
c00020c5:	6a 01                	push   $0x1
c00020c7:	e8 70 7f 00 00       	call   c000a03c <send_rec>
c00020cc:	83 c4 10             	add    $0x10,%esp
c00020cf:	83 ec 08             	sub    $0x8,%esp
c00020d2:	6a 7c                	push   $0x7c
c00020d4:	ff 75 f0             	pushl  -0x10(%ebp)
c00020d7:	e8 fd 05 00 00       	call   c00026d9 <sys_free>
c00020dc:	83 c4 10             	add    $0x10,%esp
c00020df:	90                   	nop
c00020e0:	c9                   	leave  
c00020e1:	c3                   	ret    

c00020e2 <get_hd_ioctl>:
c00020e2:	55                   	push   %ebp
c00020e3:	89 e5                	mov    %esp,%ebp
c00020e5:	83 ec 18             	sub    $0x18,%esp
c00020e8:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00020ec:	7f 19                	jg     c0002107 <get_hd_ioctl+0x25>
c00020ee:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00020f1:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00020f6:	89 c8                	mov    %ecx,%eax
c00020f8:	f7 ea                	imul   %edx
c00020fa:	d1 fa                	sar    %edx
c00020fc:	89 c8                	mov    %ecx,%eax
c00020fe:	c1 f8 1f             	sar    $0x1f,%eax
c0002101:	29 c2                	sub    %eax,%edx
c0002103:	89 d0                	mov    %edx,%eax
c0002105:	eb 11                	jmp    c0002118 <get_hd_ioctl+0x36>
c0002107:	8b 45 08             	mov    0x8(%ebp),%eax
c000210a:	83 e8 10             	sub    $0x10,%eax
c000210d:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002110:	85 c0                	test   %eax,%eax
c0002112:	0f 48 c2             	cmovs  %edx,%eax
c0002115:	c1 f8 06             	sar    $0x6,%eax
c0002118:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000211b:	8b 55 08             	mov    0x8(%ebp),%edx
c000211e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002121:	c1 e2 03             	shl    $0x3,%edx
c0002124:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000212a:	01 d0                	add    %edx,%eax
c000212c:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c0002131:	8b 00                	mov    (%eax),%eax
c0002133:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002136:	83 ec 0c             	sub    $0xc,%esp
c0002139:	6a 7c                	push   $0x7c
c000213b:	e8 84 05 00 00       	call   c00026c4 <sys_malloc>
c0002140:	83 c4 10             	add    $0x10,%esp
c0002143:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002146:	83 ec 04             	sub    $0x4,%esp
c0002149:	6a 7c                	push   $0x7c
c000214b:	6a 00                	push   $0x0
c000214d:	ff 75 ec             	pushl  -0x14(%ebp)
c0002150:	e8 a2 9c 00 00       	call   c000bdf7 <Memset>
c0002155:	83 c4 10             	add    $0x10,%esp
c0002158:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000215b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002162:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002165:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000216c:	83 ec 04             	sub    $0x4,%esp
c000216f:	6a 02                	push   $0x2
c0002171:	ff 75 ec             	pushl  -0x14(%ebp)
c0002174:	6a 01                	push   $0x1
c0002176:	e8 c1 7e 00 00       	call   c000a03c <send_rec>
c000217b:	83 c4 10             	add    $0x10,%esp
c000217e:	83 ec 08             	sub    $0x8,%esp
c0002181:	6a 7c                	push   $0x7c
c0002183:	ff 75 ec             	pushl  -0x14(%ebp)
c0002186:	e8 4e 05 00 00       	call   c00026d9 <sys_free>
c000218b:	83 c4 10             	add    $0x10,%esp
c000218e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002191:	c9                   	leave  
c0002192:	c3                   	ret    

c0002193 <wait_for>:
c0002193:	55                   	push   %ebp
c0002194:	89 e5                	mov    %esp,%ebp
c0002196:	83 ec 08             	sub    $0x8,%esp
c0002199:	83 ec 04             	sub    $0x4,%esp
c000219c:	68 50 c3 00 00       	push   $0xc350
c00021a1:	6a 08                	push   $0x8
c00021a3:	6a 08                	push   $0x8
c00021a5:	e8 35 03 00 00       	call   c00024df <waitfor>
c00021aa:	83 c4 10             	add    $0x10,%esp
c00021ad:	85 c0                	test   %eax,%eax
c00021af:	75 10                	jne    c00021c1 <wait_for+0x2e>
c00021b1:	83 ec 0c             	sub    $0xc,%esp
c00021b4:	68 14 b1 00 c0       	push   $0xc000b114
c00021b9:	e8 23 75 00 00       	call   c00096e1 <panic>
c00021be:	83 c4 10             	add    $0x10,%esp
c00021c1:	90                   	nop
c00021c2:	c9                   	leave  
c00021c3:	c3                   	ret    

c00021c4 <interrupt_wait>:
c00021c4:	55                   	push   %ebp
c00021c5:	89 e5                	mov    %esp,%ebp
c00021c7:	83 ec 18             	sub    $0x18,%esp
c00021ca:	83 ec 0c             	sub    $0xc,%esp
c00021cd:	6a 7c                	push   $0x7c
c00021cf:	e8 f0 04 00 00       	call   c00026c4 <sys_malloc>
c00021d4:	83 c4 10             	add    $0x10,%esp
c00021d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00021da:	83 ec 04             	sub    $0x4,%esp
c00021dd:	6a 7c                	push   $0x7c
c00021df:	6a 00                	push   $0x0
c00021e1:	ff 75 f4             	pushl  -0xc(%ebp)
c00021e4:	e8 0e 9c 00 00       	call   c000bdf7 <Memset>
c00021e9:	83 c4 10             	add    $0x10,%esp
c00021ec:	83 ec 04             	sub    $0x4,%esp
c00021ef:	68 13 02 00 00       	push   $0x213
c00021f4:	ff 75 f4             	pushl  -0xc(%ebp)
c00021f7:	6a 02                	push   $0x2
c00021f9:	e8 3e 7e 00 00       	call   c000a03c <send_rec>
c00021fe:	83 c4 10             	add    $0x10,%esp
c0002201:	83 ec 08             	sub    $0x8,%esp
c0002204:	6a 7c                	push   $0x7c
c0002206:	ff 75 f4             	pushl  -0xc(%ebp)
c0002209:	e8 cb 04 00 00       	call   c00026d9 <sys_free>
c000220e:	83 c4 10             	add    $0x10,%esp
c0002211:	90                   	nop
c0002212:	c9                   	leave  
c0002213:	c3                   	ret    

c0002214 <hd_rdwt>:
c0002214:	55                   	push   %ebp
c0002215:	89 e5                	mov    %esp,%ebp
c0002217:	81 ec c8 00 00 00    	sub    $0xc8,%esp
c000221d:	8b 45 08             	mov    0x8(%ebp),%eax
c0002220:	8b 40 18             	mov    0x18(%eax),%eax
c0002223:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002226:	8b 45 08             	mov    0x8(%ebp),%eax
c0002229:	8b 40 14             	mov    0x14(%eax),%eax
c000222c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000222f:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002233:	7f 19                	jg     c000224e <hd_rdwt+0x3a>
c0002235:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002238:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000223d:	89 c8                	mov    %ecx,%eax
c000223f:	f7 ea                	imul   %edx
c0002241:	d1 fa                	sar    %edx
c0002243:	89 c8                	mov    %ecx,%eax
c0002245:	c1 f8 1f             	sar    $0x1f,%eax
c0002248:	29 c2                	sub    %eax,%edx
c000224a:	89 d0                	mov    %edx,%eax
c000224c:	eb 11                	jmp    c000225f <hd_rdwt+0x4b>
c000224e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002251:	83 e8 10             	sub    $0x10,%eax
c0002254:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002257:	85 c0                	test   %eax,%eax
c0002259:	0f 48 c2             	cmovs  %edx,%eax
c000225c:	c1 f8 06             	sar    $0x6,%eax
c000225f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002262:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002265:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002268:	89 d0                	mov    %edx,%eax
c000226a:	c1 f8 1f             	sar    $0x1f,%eax
c000226d:	c1 e8 1a             	shr    $0x1a,%eax
c0002270:	01 c2                	add    %eax,%edx
c0002272:	83 e2 3f             	and    $0x3f,%edx
c0002275:	29 c2                	sub    %eax,%edx
c0002277:	89 d0                	mov    %edx,%eax
c0002279:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000227c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000227f:	c1 e8 09             	shr    $0x9,%eax
c0002282:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002285:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002289:	7f 1a                	jg     c00022a5 <hd_rdwt+0x91>
c000228b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000228e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002291:	c1 e2 03             	shl    $0x3,%edx
c0002294:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000229a:	01 d0                	add    %edx,%eax
c000229c:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00022a1:	8b 00                	mov    (%eax),%eax
c00022a3:	eb 1b                	jmp    c00022c0 <hd_rdwt+0xac>
c00022a5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00022a8:	8d 50 04             	lea    0x4(%eax),%edx
c00022ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00022ae:	c1 e2 03             	shl    $0x3,%edx
c00022b1:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022b7:	01 d0                	add    %edx,%eax
c00022b9:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00022be:	8b 00                	mov    (%eax),%eax
c00022c0:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00022c3:	01 d0                	add    %edx,%eax
c00022c5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00022c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00022cb:	8b 40 0c             	mov    0xc(%eax),%eax
c00022ce:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00022d1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00022d4:	05 ff 01 00 00       	add    $0x1ff,%eax
c00022d9:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00022df:	85 c0                	test   %eax,%eax
c00022e1:	0f 48 c2             	cmovs  %edx,%eax
c00022e4:	c1 f8 09             	sar    $0x9,%eax
c00022e7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00022ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00022ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00022f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00022f3:	8b 40 10             	mov    0x10(%eax),%eax
c00022f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00022f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00022fc:	8b 00                	mov    (%eax),%eax
c00022fe:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002301:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0002304:	83 ec 08             	sub    $0x8,%esp
c0002307:	50                   	push   %eax
c0002308:	ff 75 d0             	pushl  -0x30(%ebp)
c000230b:	e8 3c 4b 00 00       	call   c0006e4c <alloc_virtual_memory>
c0002310:	83 c4 10             	add    $0x10,%esp
c0002313:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002316:	8b 45 08             	mov    0x8(%ebp),%eax
c0002319:	8b 40 78             	mov    0x78(%eax),%eax
c000231c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000231f:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002323:	74 22                	je     c0002347 <hd_rdwt+0x133>
c0002325:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002329:	74 1c                	je     c0002347 <hd_rdwt+0x133>
c000232b:	68 b7 01 00 00       	push   $0x1b7
c0002330:	68 64 b0 00 c0       	push   $0xc000b064
c0002335:	68 64 b0 00 c0       	push   $0xc000b064
c000233a:	68 26 b1 00 c0       	push   $0xc000b126
c000233f:	e8 bb 73 00 00       	call   c00096ff <assertion_failure>
c0002344:	83 c4 10             	add    $0x10,%esp
c0002347:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c000234b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000234e:	88 45 be             	mov    %al,-0x42(%ebp)
c0002351:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002354:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002357:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000235a:	c1 f8 08             	sar    $0x8,%eax
c000235d:	88 45 c0             	mov    %al,-0x40(%ebp)
c0002360:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002363:	c1 f8 10             	sar    $0x10,%eax
c0002366:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002369:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000236c:	c1 f8 18             	sar    $0x18,%eax
c000236f:	83 e0 0f             	and    $0xf,%eax
c0002372:	83 c8 e0             	or     $0xffffffe0,%eax
c0002375:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002378:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000237c:	75 07                	jne    c0002385 <hd_rdwt+0x171>
c000237e:	b8 20 00 00 00       	mov    $0x20,%eax
c0002383:	eb 05                	jmp    c000238a <hd_rdwt+0x176>
c0002385:	b8 30 00 00 00       	mov    $0x30,%eax
c000238a:	88 45 c3             	mov    %al,-0x3d(%ebp)
c000238d:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002391:	3c 20                	cmp    $0x20,%al
c0002393:	74 24                	je     c00023b9 <hd_rdwt+0x1a5>
c0002395:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002399:	3c 30                	cmp    $0x30,%al
c000239b:	74 1c                	je     c00023b9 <hd_rdwt+0x1a5>
c000239d:	68 c5 01 00 00       	push   $0x1c5
c00023a2:	68 64 b0 00 c0       	push   $0xc000b064
c00023a7:	68 64 b0 00 c0       	push   $0xc000b064
c00023ac:	68 44 b1 00 c0       	push   $0xc000b144
c00023b1:	e8 49 73 00 00       	call   c00096ff <assertion_failure>
c00023b6:	83 c4 10             	add    $0x10,%esp
c00023b9:	83 ec 0c             	sub    $0xc,%esp
c00023bc:	8d 45 bd             	lea    -0x43(%ebp),%eax
c00023bf:	50                   	push   %eax
c00023c0:	e8 ca f5 ff ff       	call   c000198f <hd_cmd_out>
c00023c5:	83 c4 10             	add    $0x10,%esp
c00023c8:	e9 9c 00 00 00       	jmp    c0002469 <hd_rdwt+0x255>
c00023cd:	b8 00 02 00 00       	mov    $0x200,%eax
c00023d2:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00023d9:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00023dd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00023e0:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00023e4:	75 51                	jne    c0002437 <hd_rdwt+0x223>
c00023e6:	e8 a8 fd ff ff       	call   c0002193 <wait_for>
c00023eb:	e8 d4 fd ff ff       	call   c00021c4 <interrupt_wait>
c00023f0:	83 ec 04             	sub    $0x4,%esp
c00023f3:	ff 75 c4             	pushl  -0x3c(%ebp)
c00023f6:	6a 00                	push   $0x0
c00023f8:	68 80 21 01 c0       	push   $0xc0012180
c00023fd:	e8 f5 99 00 00       	call   c000bdf7 <Memset>
c0002402:	83 c4 10             	add    $0x10,%esp
c0002405:	83 ec 04             	sub    $0x4,%esp
c0002408:	68 00 02 00 00       	push   $0x200
c000240d:	68 80 21 01 c0       	push   $0xc0012180
c0002412:	68 f0 01 00 00       	push   $0x1f0
c0002417:	e8 2f 9a 00 00       	call   c000be4b <read_port>
c000241c:	83 c4 10             	add    $0x10,%esp
c000241f:	83 ec 04             	sub    $0x4,%esp
c0002422:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002425:	68 80 21 01 c0       	push   $0xc0012180
c000242a:	ff 75 f0             	pushl  -0x10(%ebp)
c000242d:	e8 56 57 00 00       	call   c0007b88 <Memcpy>
c0002432:	83 c4 10             	add    $0x10,%esp
c0002435:	eb 26                	jmp    c000245d <hd_rdwt+0x249>
c0002437:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000243b:	75 20                	jne    c000245d <hd_rdwt+0x249>
c000243d:	e8 51 fd ff ff       	call   c0002193 <wait_for>
c0002442:	83 ec 04             	sub    $0x4,%esp
c0002445:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002448:	ff 75 f0             	pushl  -0x10(%ebp)
c000244b:	68 f0 01 00 00       	push   $0x1f0
c0002450:	e8 0a 9a 00 00       	call   c000be5f <write_port>
c0002455:	83 c4 10             	add    $0x10,%esp
c0002458:	e8 67 fd ff ff       	call   c00021c4 <interrupt_wait>
c000245d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002460:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002463:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002466:	01 45 f0             	add    %eax,-0x10(%ebp)
c0002469:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000246d:	0f 85 5a ff ff ff    	jne    c00023cd <hd_rdwt+0x1b9>
c0002473:	83 ec 04             	sub    $0x4,%esp
c0002476:	6a 7c                	push   $0x7c
c0002478:	6a 00                	push   $0x0
c000247a:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0002480:	50                   	push   %eax
c0002481:	e8 71 99 00 00       	call   c000bdf7 <Memset>
c0002486:	83 c4 10             	add    $0x10,%esp
c0002489:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0002490:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0002497:	00 00 00 
c000249a:	83 ec 04             	sub    $0x4,%esp
c000249d:	6a 02                	push   $0x2
c000249f:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c00024a5:	50                   	push   %eax
c00024a6:	6a 01                	push   $0x1
c00024a8:	e8 8f 7b 00 00       	call   c000a03c <send_rec>
c00024ad:	83 c4 10             	add    $0x10,%esp
c00024b0:	90                   	nop
c00024b1:	c9                   	leave  
c00024b2:	c3                   	ret    

c00024b3 <hd_handler>:
c00024b3:	55                   	push   %ebp
c00024b4:	89 e5                	mov    %esp,%ebp
c00024b6:	83 ec 18             	sub    $0x18,%esp
c00024b9:	83 ec 0c             	sub    $0xc,%esp
c00024bc:	68 f7 01 00 00       	push   $0x1f7
c00024c1:	e8 c7 ef ff ff       	call   c000148d <in_byte>
c00024c6:	83 c4 10             	add    $0x10,%esp
c00024c9:	0f b6 c0             	movzbl %al,%eax
c00024cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024cf:	83 ec 0c             	sub    $0xc,%esp
c00024d2:	6a 03                	push   $0x3
c00024d4:	e8 fe 7d 00 00       	call   c000a2d7 <inform_int>
c00024d9:	83 c4 10             	add    $0x10,%esp
c00024dc:	90                   	nop
c00024dd:	c9                   	leave  
c00024de:	c3                   	ret    

c00024df <waitfor>:
c00024df:	55                   	push   %ebp
c00024e0:	89 e5                	mov    %esp,%ebp
c00024e2:	83 ec 18             	sub    $0x18,%esp
c00024e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00024ec:	eb 26                	jmp    c0002514 <waitfor+0x35>
c00024ee:	83 ec 0c             	sub    $0xc,%esp
c00024f1:	68 f7 01 00 00       	push   $0x1f7
c00024f6:	e8 92 ef ff ff       	call   c000148d <in_byte>
c00024fb:	83 c4 10             	add    $0x10,%esp
c00024fe:	0f b6 c0             	movzbl %al,%eax
c0002501:	23 45 08             	and    0x8(%ebp),%eax
c0002504:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0002507:	75 07                	jne    c0002510 <waitfor+0x31>
c0002509:	b8 01 00 00 00       	mov    $0x1,%eax
c000250e:	eb 11                	jmp    c0002521 <waitfor+0x42>
c0002510:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002514:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002517:	3b 45 10             	cmp    0x10(%ebp),%eax
c000251a:	7c d2                	jl     c00024ee <waitfor+0xf>
c000251c:	b8 00 00 00 00       	mov    $0x0,%eax
c0002521:	c9                   	leave  
c0002522:	c3                   	ret    

c0002523 <print_hd_info>:
c0002523:	55                   	push   %ebp
c0002524:	89 e5                	mov    %esp,%ebp
c0002526:	83 ec 18             	sub    $0x18,%esp
c0002529:	83 ec 0c             	sub    $0xc,%esp
c000252c:	68 78 b1 00 c0       	push   $0xc000b178
c0002531:	e8 6c 6e 00 00       	call   c00093a2 <Printf>
c0002536:	83 c4 10             	add    $0x10,%esp
c0002539:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002540:	eb 3b                	jmp    c000257d <print_hd_info+0x5a>
c0002542:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002545:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c000254c:	85 c0                	test   %eax,%eax
c000254e:	74 28                	je     c0002578 <print_hd_info+0x55>
c0002550:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002553:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c000255a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000255d:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c0002564:	ff 75 f4             	pushl  -0xc(%ebp)
c0002567:	52                   	push   %edx
c0002568:	50                   	push   %eax
c0002569:	68 95 b1 00 c0       	push   $0xc000b195
c000256e:	e8 2f 6e 00 00       	call   c00093a2 <Printf>
c0002573:	83 c4 10             	add    $0x10,%esp
c0002576:	eb 01                	jmp    c0002579 <print_hd_info+0x56>
c0002578:	90                   	nop
c0002579:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000257d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002581:	7e bf                	jle    c0002542 <print_hd_info+0x1f>
c0002583:	83 ec 0c             	sub    $0xc,%esp
c0002586:	68 ad b1 00 c0       	push   $0xc000b1ad
c000258b:	e8 12 6e 00 00       	call   c00093a2 <Printf>
c0002590:	83 c4 10             	add    $0x10,%esp
c0002593:	83 ec 0c             	sub    $0xc,%esp
c0002596:	68 c8 b1 00 c0       	push   $0xc000b1c8
c000259b:	e8 02 6e 00 00       	call   c00093a2 <Printf>
c00025a0:	83 c4 10             	add    $0x10,%esp
c00025a3:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c00025aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00025b1:	eb 44                	jmp    c00025f7 <print_hd_info+0xd4>
c00025b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00025b6:	83 c0 04             	add    $0x4,%eax
c00025b9:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00025c0:	85 c0                	test   %eax,%eax
c00025c2:	74 2e                	je     c00025f2 <print_hd_info+0xcf>
c00025c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00025c7:	83 c0 04             	add    $0x4,%eax
c00025ca:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00025d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00025d4:	83 c0 04             	add    $0x4,%eax
c00025d7:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00025de:	ff 75 f0             	pushl  -0x10(%ebp)
c00025e1:	52                   	push   %edx
c00025e2:	50                   	push   %eax
c00025e3:	68 95 b1 00 c0       	push   $0xc000b195
c00025e8:	e8 b5 6d 00 00       	call   c00093a2 <Printf>
c00025ed:	83 c4 10             	add    $0x10,%esp
c00025f0:	eb 01                	jmp    c00025f3 <print_hd_info+0xd0>
c00025f2:	90                   	nop
c00025f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00025f7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00025fb:	7e b6                	jle    c00025b3 <print_hd_info+0x90>
c00025fd:	83 ec 0c             	sub    $0xc,%esp
c0002600:	68 e5 b1 00 c0       	push   $0xc000b1e5
c0002605:	e8 98 6d 00 00       	call   c00093a2 <Printf>
c000260a:	83 c4 10             	add    $0x10,%esp
c000260d:	90                   	nop
c000260e:	c9                   	leave  
c000260f:	c3                   	ret    

c0002610 <is_empty>:
c0002610:	55                   	push   %ebp
c0002611:	89 e5                	mov    %esp,%ebp
c0002613:	83 ec 10             	sub    $0x10,%esp
c0002616:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000261d:	eb 1a                	jmp    c0002639 <is_empty+0x29>
c000261f:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0002622:	8b 45 08             	mov    0x8(%ebp),%eax
c0002625:	01 d0                	add    %edx,%eax
c0002627:	0f b6 00             	movzbl (%eax),%eax
c000262a:	84 c0                	test   %al,%al
c000262c:	74 07                	je     c0002635 <is_empty+0x25>
c000262e:	b8 00 00 00 00       	mov    $0x0,%eax
c0002633:	eb 11                	jmp    c0002646 <is_empty+0x36>
c0002635:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0002639:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000263c:	3b 45 0c             	cmp    0xc(%ebp),%eax
c000263f:	7c de                	jl     c000261f <is_empty+0xf>
c0002641:	b8 01 00 00 00       	mov    $0x1,%eax
c0002646:	c9                   	leave  
c0002647:	c3                   	ret    
c0002648:	66 90                	xchg   %ax,%ax
c000264a:	66 90                	xchg   %ax,%ax
c000264c:	66 90                	xchg   %ax,%ax
c000264e:	66 90                	xchg   %ax,%ax

c0002650 <get_ticks>:
c0002650:	b8 00 00 00 00       	mov    $0x0,%eax
c0002655:	cd 90                	int    $0x90
c0002657:	c3                   	ret    

c0002658 <write2>:
c0002658:	b8 01 00 00 00       	mov    $0x1,%eax
c000265d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002661:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002665:	cd 90                	int    $0x90
c0002667:	c3                   	ret    

c0002668 <write_debug>:
c0002668:	b8 02 00 00 00       	mov    $0x2,%eax
c000266d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002671:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002675:	cd 90                	int    $0x90
c0002677:	c3                   	ret    

c0002678 <send_msg2>:
c0002678:	b8 03 00 00 00       	mov    $0x3,%eax
c000267d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002681:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002685:	cd 90                	int    $0x90
c0002687:	c3                   	ret    

c0002688 <send_msg>:
c0002688:	55                   	push   %ebp
c0002689:	89 e5                	mov    %esp,%ebp
c000268b:	53                   	push   %ebx
c000268c:	51                   	push   %ecx
c000268d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002692:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002695:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002698:	cd 90                	int    $0x90
c000269a:	59                   	pop    %ecx
c000269b:	5b                   	pop    %ebx
c000269c:	5d                   	pop    %ebp
c000269d:	c3                   	ret    

c000269e <receive_msg2>:
c000269e:	b8 04 00 00 00       	mov    $0x4,%eax
c00026a3:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00026a7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00026ab:	cd 90                	int    $0x90
c00026ad:	c3                   	ret    

c00026ae <receive_msg>:
c00026ae:	55                   	push   %ebp
c00026af:	89 e5                	mov    %esp,%ebp
c00026b1:	53                   	push   %ebx
c00026b2:	51                   	push   %ecx
c00026b3:	b8 04 00 00 00       	mov    $0x4,%eax
c00026b8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00026bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00026be:	cd 90                	int    $0x90
c00026c0:	59                   	pop    %ecx
c00026c1:	5b                   	pop    %ebx
c00026c2:	5d                   	pop    %ebp
c00026c3:	c3                   	ret    

c00026c4 <sys_malloc>:
c00026c4:	56                   	push   %esi
c00026c5:	57                   	push   %edi
c00026c6:	53                   	push   %ebx
c00026c7:	55                   	push   %ebp
c00026c8:	89 e5                	mov    %esp,%ebp
c00026ca:	b8 05 00 00 00       	mov    $0x5,%eax
c00026cf:	8b 4d 14             	mov    0x14(%ebp),%ecx
c00026d2:	cd 90                	int    $0x90
c00026d4:	5d                   	pop    %ebp
c00026d5:	5b                   	pop    %ebx
c00026d6:	5f                   	pop    %edi
c00026d7:	5e                   	pop    %esi
c00026d8:	c3                   	ret    

c00026d9 <sys_free>:
c00026d9:	56                   	push   %esi
c00026da:	57                   	push   %edi
c00026db:	53                   	push   %ebx
c00026dc:	55                   	push   %ebp
c00026dd:	89 e5                	mov    %esp,%ebp
c00026df:	b8 06 00 00 00       	mov    $0x6,%eax
c00026e4:	8b 4d 14             	mov    0x14(%ebp),%ecx
c00026e7:	8b 5d 18             	mov    0x18(%ebp),%ebx
c00026ea:	cd 90                	int    $0x90
c00026ec:	5d                   	pop    %ebp
c00026ed:	5b                   	pop    %ebx
c00026ee:	5f                   	pop    %edi
c00026ef:	5e                   	pop    %esi
c00026f0:	c3                   	ret    

c00026f1 <task_fs>:
c00026f1:	55                   	push   %ebp
c00026f2:	89 e5                	mov    %esp,%ebp
c00026f4:	83 ec 28             	sub    $0x28,%esp
c00026f7:	e8 bb 08 00 00       	call   c0002fb7 <init_fs>
c00026fc:	83 ec 0c             	sub    $0xc,%esp
c00026ff:	6a 7c                	push   $0x7c
c0002701:	e8 be ff ff ff       	call   c00026c4 <sys_malloc>
c0002706:	83 c4 10             	add    $0x10,%esp
c0002709:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000270c:	83 ec 0c             	sub    $0xc,%esp
c000270f:	6a 7c                	push   $0x7c
c0002711:	e8 ae ff ff ff       	call   c00026c4 <sys_malloc>
c0002716:	83 c4 10             	add    $0x10,%esp
c0002719:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000271c:	83 ec 04             	sub    $0x4,%esp
c000271f:	6a 7c                	push   $0x7c
c0002721:	6a 00                	push   $0x0
c0002723:	ff 75 f4             	pushl  -0xc(%ebp)
c0002726:	e8 cc 96 00 00       	call   c000bdf7 <Memset>
c000272b:	83 c4 10             	add    $0x10,%esp
c000272e:	83 ec 04             	sub    $0x4,%esp
c0002731:	6a 12                	push   $0x12
c0002733:	ff 75 f4             	pushl  -0xc(%ebp)
c0002736:	6a 02                	push   $0x2
c0002738:	e8 ff 78 00 00       	call   c000a03c <send_rec>
c000273d:	83 c4 10             	add    $0x10,%esp
c0002740:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002743:	8b 40 78             	mov    0x78(%eax),%eax
c0002746:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002749:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000274c:	8b 00                	mov    (%eax),%eax
c000274e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002751:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002754:	8b 40 50             	mov    0x50(%eax),%eax
c0002757:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000275a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000275d:	8b 40 68             	mov    0x68(%eax),%eax
c0002760:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002763:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002766:	8b 00                	mov    (%eax),%eax
c0002768:	85 c0                	test   %eax,%eax
c000276a:	75 07                	jne    c0002773 <task_fs+0x82>
c000276c:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0002773:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000277a:	83 ec 0c             	sub    $0xc,%esp
c000277d:	ff 75 e8             	pushl  -0x18(%ebp)
c0002780:	e8 37 21 00 00       	call   c00048bc <pid2proc>
c0002785:	83 c4 10             	add    $0x10,%esp
c0002788:	a3 c8 0b 01 c0       	mov    %eax,0xc0010bc8
c000278d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002791:	74 37                	je     c00027ca <task_fs+0xd9>
c0002793:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002797:	74 31                	je     c00027ca <task_fs+0xd9>
c0002799:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c000279d:	74 2b                	je     c00027ca <task_fs+0xd9>
c000279f:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c00027a3:	74 25                	je     c00027ca <task_fs+0xd9>
c00027a5:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c00027a9:	74 1f                	je     c00027ca <task_fs+0xd9>
c00027ab:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c00027af:	74 19                	je     c00027ca <task_fs+0xd9>
c00027b1:	6a 7a                	push   $0x7a
c00027b3:	68 04 b2 00 c0       	push   $0xc000b204
c00027b8:	68 04 b2 00 c0       	push   $0xc000b204
c00027bd:	68 14 b2 00 c0       	push   $0xc000b214
c00027c2:	e8 38 6f 00 00       	call   c00096ff <assertion_failure>
c00027c7:	83 c4 10             	add    $0x10,%esp
c00027ca:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c00027ce:	74 3a                	je     c000280a <task_fs+0x119>
c00027d0:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c00027d4:	7f 19                	jg     c00027ef <task_fs+0xfe>
c00027d6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00027da:	0f 84 10 01 00 00    	je     c00028f0 <task_fs+0x1ff>
c00027e0:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c00027e4:	0f 84 a1 00 00 00    	je     c000288b <task_fs+0x19a>
c00027ea:	e9 ef 00 00 00       	jmp    c00028de <task_fs+0x1ed>
c00027ef:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c00027f3:	74 50                	je     c0002845 <task_fs+0x154>
c00027f5:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c00027f9:	0f 84 c6 00 00 00    	je     c00028c5 <task_fs+0x1d4>
c00027ff:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002803:	74 40                	je     c0002845 <task_fs+0x154>
c0002805:	e9 d4 00 00 00       	jmp    c00028de <task_fs+0x1ed>
c000280a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000280d:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002814:	83 ec 0c             	sub    $0xc,%esp
c0002817:	ff 75 f4             	pushl  -0xc(%ebp)
c000281a:	e8 ec 07 00 00       	call   c000300b <do_open>
c000281f:	83 c4 10             	add    $0x10,%esp
c0002822:	89 c2                	mov    %eax,%edx
c0002824:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002827:	89 50 50             	mov    %edx,0x50(%eax)
c000282a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000282d:	8b 00                	mov    (%eax),%eax
c000282f:	83 ec 04             	sub    $0x4,%esp
c0002832:	50                   	push   %eax
c0002833:	ff 75 f4             	pushl  -0xc(%ebp)
c0002836:	6a 01                	push   $0x1
c0002838:	e8 ff 77 00 00       	call   c000a03c <send_rec>
c000283d:	83 c4 10             	add    $0x10,%esp
c0002840:	e9 b2 00 00 00       	jmp    c00028f7 <task_fs+0x206>
c0002845:	83 ec 0c             	sub    $0xc,%esp
c0002848:	ff 75 f4             	pushl  -0xc(%ebp)
c000284b:	e8 f9 18 00 00       	call   c0004149 <do_rdwt>
c0002850:	83 c4 10             	add    $0x10,%esp
c0002853:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002856:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c000285a:	0f 84 96 00 00 00    	je     c00028f6 <task_fs+0x205>
c0002860:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002863:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c000286a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000286d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002870:	89 50 60             	mov    %edx,0x60(%eax)
c0002873:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002876:	8b 00                	mov    (%eax),%eax
c0002878:	83 ec 04             	sub    $0x4,%esp
c000287b:	50                   	push   %eax
c000287c:	ff 75 f4             	pushl  -0xc(%ebp)
c000287f:	6a 01                	push   $0x1
c0002881:	e8 b6 77 00 00       	call   c000a03c <send_rec>
c0002886:	83 c4 10             	add    $0x10,%esp
c0002889:	eb 6b                	jmp    c00028f6 <task_fs+0x205>
c000288b:	83 ec 0c             	sub    $0xc,%esp
c000288e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002891:	e8 d0 1d 00 00       	call   c0004666 <do_close>
c0002896:	83 c4 10             	add    $0x10,%esp
c0002899:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000289c:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c00028a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00028a6:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c00028ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00028b0:	8b 00                	mov    (%eax),%eax
c00028b2:	83 ec 04             	sub    $0x4,%esp
c00028b5:	50                   	push   %eax
c00028b6:	ff 75 f4             	pushl  -0xc(%ebp)
c00028b9:	6a 01                	push   $0x1
c00028bb:	e8 7c 77 00 00       	call   c000a03c <send_rec>
c00028c0:	83 c4 10             	add    $0x10,%esp
c00028c3:	eb 32                	jmp    c00028f7 <task_fs+0x206>
c00028c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00028c8:	8b 40 68             	mov    0x68(%eax),%eax
c00028cb:	83 ec 04             	sub    $0x4,%esp
c00028ce:	50                   	push   %eax
c00028cf:	ff 75 f4             	pushl  -0xc(%ebp)
c00028d2:	6a 01                	push   $0x1
c00028d4:	e8 63 77 00 00       	call   c000a03c <send_rec>
c00028d9:	83 c4 10             	add    $0x10,%esp
c00028dc:	eb 19                	jmp    c00028f7 <task_fs+0x206>
c00028de:	83 ec 0c             	sub    $0xc,%esp
c00028e1:	68 77 b2 00 c0       	push   $0xc000b277
c00028e6:	e8 f6 6d 00 00       	call   c00096e1 <panic>
c00028eb:	83 c4 10             	add    $0x10,%esp
c00028ee:	eb 07                	jmp    c00028f7 <task_fs+0x206>
c00028f0:	90                   	nop
c00028f1:	e9 26 fe ff ff       	jmp    c000271c <task_fs+0x2b>
c00028f6:	90                   	nop
c00028f7:	e9 20 fe ff ff       	jmp    c000271c <task_fs+0x2b>

c00028fc <rd_wt>:
c00028fc:	55                   	push   %ebp
c00028fd:	89 e5                	mov    %esp,%ebp
c00028ff:	83 ec 18             	sub    $0x18,%esp
c0002902:	83 ec 0c             	sub    $0xc,%esp
c0002905:	6a 7c                	push   $0x7c
c0002907:	e8 b8 fd ff ff       	call   c00026c4 <sys_malloc>
c000290c:	83 c4 10             	add    $0x10,%esp
c000290f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002912:	83 ec 04             	sub    $0x4,%esp
c0002915:	6a 7c                	push   $0x7c
c0002917:	6a 00                	push   $0x0
c0002919:	ff 75 f4             	pushl  -0xc(%ebp)
c000291c:	e8 d6 94 00 00       	call   c000bdf7 <Memset>
c0002921:	83 c4 10             	add    $0x10,%esp
c0002924:	8b 55 18             	mov    0x18(%ebp),%edx
c0002927:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000292a:	89 50 78             	mov    %edx,0x78(%eax)
c000292d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002930:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002933:	89 50 14             	mov    %edx,0x14(%eax)
c0002936:	8b 55 10             	mov    0x10(%ebp),%edx
c0002939:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000293c:	89 50 10             	mov    %edx,0x10(%eax)
c000293f:	8b 55 14             	mov    0x14(%ebp),%edx
c0002942:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002945:	89 50 0c             	mov    %edx,0xc(%eax)
c0002948:	8b 45 08             	mov    0x8(%ebp),%eax
c000294b:	c1 e0 09             	shl    $0x9,%eax
c000294e:	89 c2                	mov    %eax,%edx
c0002950:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002953:	89 50 18             	mov    %edx,0x18(%eax)
c0002956:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c000295a:	74 22                	je     c000297e <rd_wt+0x82>
c000295c:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002960:	74 1c                	je     c000297e <rd_wt+0x82>
c0002962:	68 b1 00 00 00       	push   $0xb1
c0002967:	68 04 b2 00 c0       	push   $0xc000b204
c000296c:	68 04 b2 00 c0       	push   $0xc000b204
c0002971:	68 8a b2 00 c0       	push   $0xc000b28a
c0002976:	e8 84 6d 00 00       	call   c00096ff <assertion_failure>
c000297b:	83 c4 10             	add    $0x10,%esp
c000297e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002981:	8b 40 78             	mov    0x78(%eax),%eax
c0002984:	83 f8 07             	cmp    $0x7,%eax
c0002987:	74 27                	je     c00029b0 <rd_wt+0xb4>
c0002989:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000298c:	8b 40 78             	mov    0x78(%eax),%eax
c000298f:	83 f8 0a             	cmp    $0xa,%eax
c0002992:	74 1c                	je     c00029b0 <rd_wt+0xb4>
c0002994:	68 b2 00 00 00       	push   $0xb2
c0002999:	68 04 b2 00 c0       	push   $0xc000b204
c000299e:	68 04 b2 00 c0       	push   $0xc000b204
c00029a3:	68 a8 b2 00 c0       	push   $0xc000b2a8
c00029a8:	e8 52 6d 00 00       	call   c00096ff <assertion_failure>
c00029ad:	83 c4 10             	add    $0x10,%esp
c00029b0:	83 ec 04             	sub    $0x4,%esp
c00029b3:	6a 03                	push   $0x3
c00029b5:	ff 75 f4             	pushl  -0xc(%ebp)
c00029b8:	6a 03                	push   $0x3
c00029ba:	e8 7d 76 00 00       	call   c000a03c <send_rec>
c00029bf:	83 c4 10             	add    $0x10,%esp
c00029c2:	83 ec 08             	sub    $0x8,%esp
c00029c5:	6a 7c                	push   $0x7c
c00029c7:	ff 75 f4             	pushl  -0xc(%ebp)
c00029ca:	e8 0a fd ff ff       	call   c00026d9 <sys_free>
c00029cf:	83 c4 10             	add    $0x10,%esp
c00029d2:	90                   	nop
c00029d3:	c9                   	leave  
c00029d4:	c3                   	ret    

c00029d5 <mkfs>:
c00029d5:	55                   	push   %ebp
c00029d6:	89 e5                	mov    %esp,%ebp
c00029d8:	57                   	push   %edi
c00029d9:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c00029df:	83 ec 0c             	sub    $0xc,%esp
c00029e2:	68 00 80 00 00       	push   $0x8000
c00029e7:	e8 d8 fc ff ff       	call   c00026c4 <sys_malloc>
c00029ec:	83 c4 10             	add    $0x10,%esp
c00029ef:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c00029f4:	83 ec 0c             	sub    $0xc,%esp
c00029f7:	6a 24                	push   $0x24
c00029f9:	e8 c6 fc ff ff       	call   c00026c4 <sys_malloc>
c00029fe:	83 c4 10             	add    $0x10,%esp
c0002a01:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002a06:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002a0b:	83 ec 0c             	sub    $0xc,%esp
c0002a0e:	50                   	push   %eax
c0002a0f:	e8 06 45 00 00       	call   c0006f1a <get_physical_address>
c0002a14:	83 c4 10             	add    $0x10,%esp
c0002a17:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002a1c:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002a21:	83 ec 0c             	sub    $0xc,%esp
c0002a24:	50                   	push   %eax
c0002a25:	e8 f0 44 00 00       	call   c0006f1a <get_physical_address>
c0002a2a:	83 c4 10             	add    $0x10,%esp
c0002a2d:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002a32:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002a37:	83 ec 04             	sub    $0x4,%esp
c0002a3a:	68 00 02 00 00       	push   $0x200
c0002a3f:	6a 00                	push   $0x0
c0002a41:	50                   	push   %eax
c0002a42:	e8 b0 93 00 00       	call   c000bdf7 <Memset>
c0002a47:	83 c4 10             	add    $0x10,%esp
c0002a4a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002a4f:	83 ec 0c             	sub    $0xc,%esp
c0002a52:	6a 0a                	push   $0xa
c0002a54:	68 00 02 00 00       	push   $0x200
c0002a59:	50                   	push   %eax
c0002a5a:	6a 20                	push   $0x20
c0002a5c:	6a 00                	push   $0x0
c0002a5e:	e8 99 fe ff ff       	call   c00028fc <rd_wt>
c0002a63:	83 c4 20             	add    $0x20,%esp
c0002a66:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002a6b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002a6e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a71:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002a78:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a7b:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002a82:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a85:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002a8c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a8f:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002a96:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002a99:	8b 40 04             	mov    0x4(%eax),%eax
c0002a9c:	8d 50 02             	lea    0x2(%eax),%edx
c0002a9f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002aa2:	8b 40 08             	mov    0x8(%eax),%eax
c0002aa5:	01 c2                	add    %eax,%edx
c0002aa7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002aaa:	8b 40 0c             	mov    0xc(%eax),%eax
c0002aad:	01 c2                	add    %eax,%edx
c0002aaf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002ab2:	89 10                	mov    %edx,(%eax)
c0002ab4:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002abb:	b8 00 02 00 00       	mov    $0x200,%eax
c0002ac0:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002ac3:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002ac9:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002acc:	01 ca                	add    %ecx,%edx
c0002ace:	83 ec 04             	sub    $0x4,%esp
c0002ad1:	50                   	push   %eax
c0002ad2:	6a 80                	push   $0xffffff80
c0002ad4:	52                   	push   %edx
c0002ad5:	e8 1d 93 00 00       	call   c000bdf7 <Memset>
c0002ada:	83 c4 10             	add    $0x10,%esp
c0002add:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ae2:	83 ec 0c             	sub    $0xc,%esp
c0002ae5:	6a 0a                	push   $0xa
c0002ae7:	68 00 02 00 00       	push   $0x200
c0002aec:	50                   	push   %eax
c0002aed:	6a 20                	push   $0x20
c0002aef:	6a 01                	push   $0x1
c0002af1:	e8 06 fe ff ff       	call   c00028fc <rd_wt>
c0002af6:	83 c4 20             	add    $0x20,%esp
c0002af9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002afc:	8b 10                	mov    (%eax),%edx
c0002afe:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002b01:	8b 50 04             	mov    0x4(%eax),%edx
c0002b04:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002b07:	8b 50 08             	mov    0x8(%eax),%edx
c0002b0a:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002b0d:	8b 50 0c             	mov    0xc(%eax),%edx
c0002b10:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002b13:	8b 50 10             	mov    0x10(%eax),%edx
c0002b16:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002b19:	8b 50 14             	mov    0x14(%eax),%edx
c0002b1c:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002b1f:	8b 50 18             	mov    0x18(%eax),%edx
c0002b22:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002b25:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002b28:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002b2b:	8b 40 20             	mov    0x20(%eax),%eax
c0002b2e:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002b31:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002b35:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002b39:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b3e:	83 ec 04             	sub    $0x4,%esp
c0002b41:	6a 01                	push   $0x1
c0002b43:	52                   	push   %edx
c0002b44:	50                   	push   %eax
c0002b45:	e8 ad 92 00 00       	call   c000bdf7 <Memset>
c0002b4a:	83 c4 10             	add    $0x10,%esp
c0002b4d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b52:	83 c0 01             	add    $0x1,%eax
c0002b55:	83 ec 04             	sub    $0x4,%esp
c0002b58:	68 ff 01 00 00       	push   $0x1ff
c0002b5d:	6a 80                	push   $0xffffff80
c0002b5f:	50                   	push   %eax
c0002b60:	e8 92 92 00 00       	call   c000bdf7 <Memset>
c0002b65:	83 c4 10             	add    $0x10,%esp
c0002b68:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002b6d:	83 ec 0c             	sub    $0xc,%esp
c0002b70:	6a 0a                	push   $0xa
c0002b72:	68 00 02 00 00       	push   $0x200
c0002b77:	50                   	push   %eax
c0002b78:	6a 20                	push   $0x20
c0002b7a:	6a 02                	push   $0x2
c0002b7c:	e8 7b fd ff ff       	call   c00028fc <rd_wt>
c0002b81:	83 c4 20             	add    $0x20,%esp
c0002b84:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002b8b:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b90:	83 ec 04             	sub    $0x4,%esp
c0002b93:	68 00 02 00 00       	push   $0x200
c0002b98:	6a ff                	push   $0xffffffff
c0002b9a:	50                   	push   %eax
c0002b9b:	e8 57 92 00 00       	call   c000bdf7 <Memset>
c0002ba0:	83 c4 10             	add    $0x10,%esp
c0002ba3:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ba8:	83 ec 0c             	sub    $0xc,%esp
c0002bab:	6a 0a                	push   $0xa
c0002bad:	68 00 02 00 00       	push   $0x200
c0002bb2:	50                   	push   %eax
c0002bb3:	6a 20                	push   $0x20
c0002bb5:	ff 75 d0             	pushl  -0x30(%ebp)
c0002bb8:	e8 3f fd ff ff       	call   c00028fc <rd_wt>
c0002bbd:	83 c4 20             	add    $0x20,%esp
c0002bc0:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002bc5:	83 ec 04             	sub    $0x4,%esp
c0002bc8:	6a 01                	push   $0x1
c0002bca:	6a 01                	push   $0x1
c0002bcc:	50                   	push   %eax
c0002bcd:	e8 25 92 00 00       	call   c000bdf7 <Memset>
c0002bd2:	83 c4 10             	add    $0x10,%esp
c0002bd5:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002bda:	83 c0 01             	add    $0x1,%eax
c0002bdd:	83 ec 04             	sub    $0x4,%esp
c0002be0:	68 ff 01 00 00       	push   $0x1ff
c0002be5:	6a 00                	push   $0x0
c0002be7:	50                   	push   %eax
c0002be8:	e8 0a 92 00 00       	call   c000bdf7 <Memset>
c0002bed:	83 c4 10             	add    $0x10,%esp
c0002bf0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002bf5:	89 c2                	mov    %eax,%edx
c0002bf7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002bfa:	83 c0 01             	add    $0x1,%eax
c0002bfd:	83 ec 0c             	sub    $0xc,%esp
c0002c00:	6a 0a                	push   $0xa
c0002c02:	68 00 02 00 00       	push   $0x200
c0002c07:	52                   	push   %edx
c0002c08:	6a 20                	push   $0x20
c0002c0a:	50                   	push   %eax
c0002c0b:	e8 ec fc ff ff       	call   c00028fc <rd_wt>
c0002c10:	83 c4 20             	add    $0x20,%esp
c0002c13:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002c16:	83 e8 02             	sub    $0x2,%eax
c0002c19:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002c1c:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002c23:	eb 04                	jmp    c0002c29 <mkfs+0x254>
c0002c25:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002c29:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002c2c:	83 c0 01             	add    $0x1,%eax
c0002c2f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002c32:	7e f1                	jle    c0002c25 <mkfs+0x250>
c0002c34:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c39:	89 c2                	mov    %eax,%edx
c0002c3b:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002c3e:	83 c0 03             	add    $0x3,%eax
c0002c41:	83 ec 0c             	sub    $0xc,%esp
c0002c44:	6a 0a                	push   $0xa
c0002c46:	68 00 02 00 00       	push   $0x200
c0002c4b:	52                   	push   %edx
c0002c4c:	6a 20                	push   $0x20
c0002c4e:	50                   	push   %eax
c0002c4f:	e8 a8 fc ff ff       	call   c00028fc <rd_wt>
c0002c54:	83 c4 20             	add    $0x20,%esp
c0002c57:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c5c:	89 c2                	mov    %eax,%edx
c0002c5e:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002c61:	83 c0 03             	add    $0x3,%eax
c0002c64:	83 ec 0c             	sub    $0xc,%esp
c0002c67:	6a 07                	push   $0x7
c0002c69:	68 00 02 00 00       	push   $0x200
c0002c6e:	52                   	push   %edx
c0002c6f:	6a 20                	push   $0x20
c0002c71:	50                   	push   %eax
c0002c72:	e8 85 fc ff ff       	call   c00028fc <rd_wt>
c0002c77:	83 c4 20             	add    $0x20,%esp
c0002c7a:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c7f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002c82:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c85:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002c8b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c8e:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002c95:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002c98:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002c9b:	89 50 08             	mov    %edx,0x8(%eax)
c0002c9e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ca1:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002ca8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cab:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002cb2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002cb5:	8b 10                	mov    (%eax),%edx
c0002cb7:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002cbd:	8b 50 04             	mov    0x4(%eax),%edx
c0002cc0:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002cc6:	8b 50 08             	mov    0x8(%eax),%edx
c0002cc9:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002ccf:	8b 50 0c             	mov    0xc(%eax),%edx
c0002cd2:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002cd8:	8b 50 10             	mov    0x10(%eax),%edx
c0002cdb:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002ce1:	8b 50 14             	mov    0x14(%eax),%edx
c0002ce4:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002cea:	8b 50 18             	mov    0x18(%eax),%edx
c0002ced:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002cf3:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002cf6:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002cfc:	8b 50 20             	mov    0x20(%eax),%edx
c0002cff:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002d05:	8b 40 24             	mov    0x24(%eax),%eax
c0002d08:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002d0d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002d14:	eb 4c                	jmp    c0002d62 <mkfs+0x38d>
c0002d16:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d1b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002d1e:	83 c2 01             	add    $0x1,%edx
c0002d21:	c1 e2 05             	shl    $0x5,%edx
c0002d24:	01 d0                	add    %edx,%eax
c0002d26:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002d29:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d2c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002d32:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d35:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002d3c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d3f:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002d46:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002d4d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002d50:	c1 e0 08             	shl    $0x8,%eax
c0002d53:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002d56:	89 c2                	mov    %eax,%edx
c0002d58:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d5b:	89 50 08             	mov    %edx,0x8(%eax)
c0002d5e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002d62:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002d66:	7e ae                	jle    c0002d16 <mkfs+0x341>
c0002d68:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002d6f:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002d75:	b8 00 00 00 00       	mov    $0x0,%eax
c0002d7a:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002d7f:	89 d7                	mov    %edx,%edi
c0002d81:	f3 ab                	rep stos %eax,%es:(%edi)
c0002d83:	c7 85 70 ff ff ff d0 	movl   $0xc000b2d0,-0x90(%ebp)
c0002d8a:	b2 00 c0 
c0002d8d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002d94:	eb 54                	jmp    c0002dea <mkfs+0x415>
c0002d96:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d9b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002d9e:	83 c2 04             	add    $0x4,%edx
c0002da1:	c1 e2 05             	shl    $0x5,%edx
c0002da4:	01 d0                	add    %edx,%eax
c0002da6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002da9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dac:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002db2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002db5:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002dbc:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002dbf:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002dc2:	83 c2 01             	add    $0x1,%edx
c0002dc5:	c1 e2 0b             	shl    $0xb,%edx
c0002dc8:	01 c2                	add    %eax,%edx
c0002dca:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dcd:	89 50 08             	mov    %edx,0x8(%eax)
c0002dd0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dd3:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002dda:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ddd:	8d 50 05             	lea    0x5(%eax),%edx
c0002de0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002de3:	89 50 10             	mov    %edx,0x10(%eax)
c0002de6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002dea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ded:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002df0:	7c a4                	jl     c0002d96 <mkfs+0x3c1>
c0002df2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002df7:	89 c2                	mov    %eax,%edx
c0002df9:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002dfc:	83 c0 03             	add    $0x3,%eax
c0002dff:	83 ec 0c             	sub    $0xc,%esp
c0002e02:	6a 0a                	push   $0xa
c0002e04:	68 00 02 00 00       	push   $0x200
c0002e09:	52                   	push   %edx
c0002e0a:	6a 20                	push   $0x20
c0002e0c:	50                   	push   %eax
c0002e0d:	e8 ea fa ff ff       	call   c00028fc <rd_wt>
c0002e12:	83 c4 20             	add    $0x20,%esp
c0002e15:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e1a:	89 c2                	mov    %eax,%edx
c0002e1c:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002e1f:	83 ec 0c             	sub    $0xc,%esp
c0002e22:	6a 07                	push   $0x7
c0002e24:	68 00 02 00 00       	push   $0x200
c0002e29:	52                   	push   %edx
c0002e2a:	6a 20                	push   $0x20
c0002e2c:	50                   	push   %eax
c0002e2d:	e8 ca fa ff ff       	call   c00028fc <rd_wt>
c0002e32:	83 c4 20             	add    $0x20,%esp
c0002e35:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002e3c:	00 00 00 
c0002e3f:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002e46:	2e 00 
c0002e48:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e4d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002e50:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002e53:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002e59:	83 ec 0c             	sub    $0xc,%esp
c0002e5c:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002e62:	50                   	push   %eax
c0002e63:	e8 c8 8f 00 00       	call   c000be30 <Strlen>
c0002e68:	83 c4 10             	add    $0x10,%esp
c0002e6b:	89 c1                	mov    %eax,%ecx
c0002e6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002e70:	8d 50 04             	lea    0x4(%eax),%edx
c0002e73:	83 ec 04             	sub    $0x4,%esp
c0002e76:	51                   	push   %ecx
c0002e77:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002e7d:	50                   	push   %eax
c0002e7e:	52                   	push   %edx
c0002e7f:	e8 04 4d 00 00       	call   c0007b88 <Memcpy>
c0002e84:	83 c4 10             	add    $0x10,%esp
c0002e87:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002e8d:	b8 00 00 00 00       	mov    $0x0,%eax
c0002e92:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002e97:	89 d7                	mov    %edx,%edi
c0002e99:	f3 ab                	rep stos %eax,%es:(%edi)
c0002e9b:	c7 85 34 ff ff ff dc 	movl   $0xc000b2dc,-0xcc(%ebp)
c0002ea2:	b2 00 c0 
c0002ea5:	c7 85 38 ff ff ff e5 	movl   $0xc000b2e5,-0xc8(%ebp)
c0002eac:	b2 00 c0 
c0002eaf:	c7 85 3c ff ff ff ee 	movl   $0xc000b2ee,-0xc4(%ebp)
c0002eb6:	b2 00 c0 
c0002eb9:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002ec0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002ec7:	eb 49                	jmp    c0002f12 <mkfs+0x53d>
c0002ec9:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002ecd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002ed0:	8d 50 02             	lea    0x2(%eax),%edx
c0002ed3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002ed6:	89 10                	mov    %edx,(%eax)
c0002ed8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002edb:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002ee2:	83 ec 0c             	sub    $0xc,%esp
c0002ee5:	50                   	push   %eax
c0002ee6:	e8 45 8f 00 00       	call   c000be30 <Strlen>
c0002eeb:	83 c4 10             	add    $0x10,%esp
c0002eee:	89 c1                	mov    %eax,%ecx
c0002ef0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002ef3:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002efa:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002efd:	83 c2 04             	add    $0x4,%edx
c0002f00:	83 ec 04             	sub    $0x4,%esp
c0002f03:	51                   	push   %ecx
c0002f04:	50                   	push   %eax
c0002f05:	52                   	push   %edx
c0002f06:	e8 7d 4c 00 00       	call   c0007b88 <Memcpy>
c0002f0b:	83 c4 10             	add    $0x10,%esp
c0002f0e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002f12:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002f15:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0002f18:	7c af                	jl     c0002ec9 <mkfs+0x4f4>
c0002f1a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0002f21:	eb 66                	jmp    c0002f89 <mkfs+0x5b4>
c0002f23:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f26:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002f2d:	83 ec 0c             	sub    $0xc,%esp
c0002f30:	50                   	push   %eax
c0002f31:	e8 fa 8e 00 00       	call   c000be30 <Strlen>
c0002f36:	83 c4 10             	add    $0x10,%esp
c0002f39:	85 c0                	test   %eax,%eax
c0002f3b:	74 47                	je     c0002f84 <mkfs+0x5af>
c0002f3d:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002f41:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f44:	8d 50 05             	lea    0x5(%eax),%edx
c0002f47:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f4a:	89 10                	mov    %edx,(%eax)
c0002f4c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f4f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002f56:	83 ec 0c             	sub    $0xc,%esp
c0002f59:	50                   	push   %eax
c0002f5a:	e8 d1 8e 00 00       	call   c000be30 <Strlen>
c0002f5f:	83 c4 10             	add    $0x10,%esp
c0002f62:	89 c1                	mov    %eax,%ecx
c0002f64:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f67:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0002f6e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002f71:	83 c2 04             	add    $0x4,%edx
c0002f74:	83 ec 04             	sub    $0x4,%esp
c0002f77:	51                   	push   %ecx
c0002f78:	50                   	push   %eax
c0002f79:	52                   	push   %edx
c0002f7a:	e8 09 4c 00 00       	call   c0007b88 <Memcpy>
c0002f7f:	83 c4 10             	add    $0x10,%esp
c0002f82:	eb 01                	jmp    c0002f85 <mkfs+0x5b0>
c0002f84:	90                   	nop
c0002f85:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0002f89:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002f8c:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002f8f:	7c 92                	jl     c0002f23 <mkfs+0x54e>
c0002f91:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f96:	89 c2                	mov    %eax,%edx
c0002f98:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002f9b:	83 ec 0c             	sub    $0xc,%esp
c0002f9e:	6a 0a                	push   $0xa
c0002fa0:	68 00 02 00 00       	push   $0x200
c0002fa5:	52                   	push   %edx
c0002fa6:	6a 20                	push   $0x20
c0002fa8:	50                   	push   %eax
c0002fa9:	e8 4e f9 ff ff       	call   c00028fc <rd_wt>
c0002fae:	83 c4 20             	add    $0x20,%esp
c0002fb1:	90                   	nop
c0002fb2:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0002fb5:	c9                   	leave  
c0002fb6:	c3                   	ret    

c0002fb7 <init_fs>:
c0002fb7:	55                   	push   %ebp
c0002fb8:	89 e5                	mov    %esp,%ebp
c0002fba:	83 ec 18             	sub    $0x18,%esp
c0002fbd:	83 ec 0c             	sub    $0xc,%esp
c0002fc0:	6a 7c                	push   $0x7c
c0002fc2:	e8 fd f6 ff ff       	call   c00026c4 <sys_malloc>
c0002fc7:	83 c4 10             	add    $0x10,%esp
c0002fca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002fcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002fd0:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0002fd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002fda:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0002fe1:	83 ec 04             	sub    $0x4,%esp
c0002fe4:	6a 03                	push   $0x3
c0002fe6:	ff 75 f4             	pushl  -0xc(%ebp)
c0002fe9:	6a 03                	push   $0x3
c0002feb:	e8 4c 70 00 00       	call   c000a03c <send_rec>
c0002ff0:	83 c4 10             	add    $0x10,%esp
c0002ff3:	e8 dd f9 ff ff       	call   c00029d5 <mkfs>
c0002ff8:	83 ec 08             	sub    $0x8,%esp
c0002ffb:	6a 7c                	push   $0x7c
c0002ffd:	ff 75 f4             	pushl  -0xc(%ebp)
c0003000:	e8 d4 f6 ff ff       	call   c00026d9 <sys_free>
c0003005:	83 c4 10             	add    $0x10,%esp
c0003008:	90                   	nop
c0003009:	c9                   	leave  
c000300a:	c3                   	ret    

c000300b <do_open>:
c000300b:	55                   	push   %ebp
c000300c:	89 e5                	mov    %esp,%ebp
c000300e:	83 ec 68             	sub    $0x68,%esp
c0003011:	83 ec 04             	sub    $0x4,%esp
c0003014:	6a 0c                	push   $0xc
c0003016:	6a 00                	push   $0x0
c0003018:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000301b:	50                   	push   %eax
c000301c:	e8 d6 8d 00 00       	call   c000bdf7 <Memset>
c0003021:	83 c4 10             	add    $0x10,%esp
c0003024:	8b 45 08             	mov    0x8(%ebp),%eax
c0003027:	8b 40 44             	mov    0x44(%eax),%eax
c000302a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000302d:	83 ec 08             	sub    $0x8,%esp
c0003030:	6a 0c                	push   $0xc
c0003032:	ff 75 e4             	pushl  -0x1c(%ebp)
c0003035:	e8 12 3e 00 00       	call   c0006e4c <alloc_virtual_memory>
c000303a:	83 c4 10             	add    $0x10,%esp
c000303d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003040:	8b 45 08             	mov    0x8(%ebp),%eax
c0003043:	8b 40 40             	mov    0x40(%eax),%eax
c0003046:	89 c2                	mov    %eax,%edx
c0003048:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000304b:	83 ec 04             	sub    $0x4,%esp
c000304e:	52                   	push   %edx
c000304f:	50                   	push   %eax
c0003050:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003053:	50                   	push   %eax
c0003054:	e8 2f 4b 00 00       	call   c0007b88 <Memcpy>
c0003059:	83 c4 10             	add    $0x10,%esp
c000305c:	8b 45 08             	mov    0x8(%ebp),%eax
c000305f:	8b 40 40             	mov    0x40(%eax),%eax
c0003062:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0003067:	8b 45 08             	mov    0x8(%ebp),%eax
c000306a:	8b 40 74             	mov    0x74(%eax),%eax
c000306d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003070:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0003077:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000307e:	eb 1f                	jmp    c000309f <do_open+0x94>
c0003080:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0003085:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003088:	83 c2 50             	add    $0x50,%edx
c000308b:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c000308f:	85 c0                	test   %eax,%eax
c0003091:	75 08                	jne    c000309b <do_open+0x90>
c0003093:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003096:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003099:	eb 0a                	jmp    c00030a5 <do_open+0x9a>
c000309b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000309f:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00030a3:	7e db                	jle    c0003080 <do_open+0x75>
c00030a5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c00030a9:	75 1c                	jne    c00030c7 <do_open+0xbc>
c00030ab:	68 c6 01 00 00       	push   $0x1c6
c00030b0:	68 04 b2 00 c0       	push   $0xc000b204
c00030b5:	68 04 b2 00 c0       	push   $0xc000b204
c00030ba:	68 f7 b2 00 c0       	push   $0xc000b2f7
c00030bf:	e8 3b 66 00 00       	call   c00096ff <assertion_failure>
c00030c4:	83 c4 10             	add    $0x10,%esp
c00030c7:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c00030ce:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00030d5:	eb 1d                	jmp    c00030f4 <do_open+0xe9>
c00030d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030da:	c1 e0 04             	shl    $0x4,%eax
c00030dd:	05 88 23 01 c0       	add    $0xc0012388,%eax
c00030e2:	8b 00                	mov    (%eax),%eax
c00030e4:	85 c0                	test   %eax,%eax
c00030e6:	75 08                	jne    c00030f0 <do_open+0xe5>
c00030e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00030eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00030ee:	eb 0a                	jmp    c00030fa <do_open+0xef>
c00030f0:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00030f4:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c00030f8:	7e dd                	jle    c00030d7 <do_open+0xcc>
c00030fa:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c00030fe:	75 1c                	jne    c000311c <do_open+0x111>
c0003100:	68 d2 01 00 00       	push   $0x1d2
c0003105:	68 04 b2 00 c0       	push   $0xc000b204
c000310a:	68 04 b2 00 c0       	push   $0xc000b204
c000310f:	68 ff b2 00 c0       	push   $0xc000b2ff
c0003114:	e8 e6 65 00 00       	call   c00096ff <assertion_failure>
c0003119:	83 c4 10             	add    $0x10,%esp
c000311c:	83 ec 0c             	sub    $0xc,%esp
c000311f:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003122:	50                   	push   %eax
c0003123:	e8 b2 00 00 00       	call   c00031da <search_file>
c0003128:	83 c4 10             	add    $0x10,%esp
c000312b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000312e:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0003132:	75 2b                	jne    c000315f <do_open+0x154>
c0003134:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0003138:	7e 10                	jle    c000314a <do_open+0x13f>
c000313a:	83 ec 0c             	sub    $0xc,%esp
c000313d:	68 07 b3 00 c0       	push   $0xc000b307
c0003142:	e8 9a 65 00 00       	call   c00096e1 <panic>
c0003147:	83 c4 10             	add    $0x10,%esp
c000314a:	83 ec 08             	sub    $0x8,%esp
c000314d:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003150:	50                   	push   %eax
c0003151:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0003154:	50                   	push   %eax
c0003155:	e8 40 04 00 00       	call   c000359a <create_file>
c000315a:	83 c4 10             	add    $0x10,%esp
c000315d:	eb 22                	jmp    c0003181 <do_open+0x176>
c000315f:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0003163:	75 07                	jne    c000316c <do_open+0x161>
c0003165:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000316a:	eb 6c                	jmp    c00031d8 <do_open+0x1cd>
c000316c:	83 ec 08             	sub    $0x8,%esp
c000316f:	ff 75 d8             	pushl  -0x28(%ebp)
c0003172:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0003175:	50                   	push   %eax
c0003176:	e8 5d 02 00 00       	call   c00033d8 <get_inode>
c000317b:	83 c4 10             	add    $0x10,%esp
c000317e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003181:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0003186:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003189:	c1 e2 04             	shl    $0x4,%edx
c000318c:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c0003192:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003195:	83 c2 50             	add    $0x50,%edx
c0003198:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c000319c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000319f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00031a2:	c1 e2 04             	shl    $0x4,%edx
c00031a5:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c00031ab:	89 02                	mov    %eax,(%edx)
c00031ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00031b0:	c1 e0 04             	shl    $0x4,%eax
c00031b3:	05 84 23 01 c0       	add    $0xc0012384,%eax
c00031b8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00031be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00031c1:	c1 e0 04             	shl    $0x4,%eax
c00031c4:	05 80 23 01 c0       	add    $0xc0012380,%eax
c00031c9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00031cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00031d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00031d5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00031d8:	c9                   	leave  
c00031d9:	c3                   	ret    

c00031da <search_file>:
c00031da:	55                   	push   %ebp
c00031db:	89 e5                	mov    %esp,%ebp
c00031dd:	83 ec 68             	sub    $0x68,%esp
c00031e0:	83 ec 04             	sub    $0x4,%esp
c00031e3:	6a 0c                	push   $0xc
c00031e5:	6a 00                	push   $0x0
c00031e7:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00031ea:	50                   	push   %eax
c00031eb:	e8 07 8c 00 00       	call   c000bdf7 <Memset>
c00031f0:	83 c4 10             	add    $0x10,%esp
c00031f3:	83 ec 04             	sub    $0x4,%esp
c00031f6:	6a 28                	push   $0x28
c00031f8:	6a 00                	push   $0x0
c00031fa:	8d 45 98             	lea    -0x68(%ebp),%eax
c00031fd:	50                   	push   %eax
c00031fe:	e8 f4 8b 00 00       	call   c000bdf7 <Memset>
c0003203:	83 c4 10             	add    $0x10,%esp
c0003206:	83 ec 04             	sub    $0x4,%esp
c0003209:	8d 45 98             	lea    -0x68(%ebp),%eax
c000320c:	50                   	push   %eax
c000320d:	ff 75 08             	pushl  0x8(%ebp)
c0003210:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003213:	50                   	push   %eax
c0003214:	e8 f3 00 00 00       	call   c000330c <strip_path>
c0003219:	83 c4 10             	add    $0x10,%esp
c000321c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000321f:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c0003223:	75 0a                	jne    c000322f <search_file+0x55>
c0003225:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000322a:	e9 db 00 00 00       	jmp    c000330a <search_file+0x130>
c000322f:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003232:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003235:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003238:	05 00 02 00 00       	add    $0x200,%eax
c000323d:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003243:	85 c0                	test   %eax,%eax
c0003245:	0f 48 c2             	cmovs  %edx,%eax
c0003248:	c1 f8 09             	sar    $0x9,%eax
c000324b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000324e:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003251:	c1 e8 04             	shr    $0x4,%eax
c0003254:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003257:	e8 5c 14 00 00       	call   c00046b8 <get_super_block>
c000325c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000325f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003262:	8b 00                	mov    (%eax),%eax
c0003264:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003267:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c000326e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003275:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000327c:	eb 7b                	jmp    c00032f9 <search_file+0x11f>
c000327e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003283:	89 c1                	mov    %eax,%ecx
c0003285:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003288:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000328b:	01 d0                	add    %edx,%eax
c000328d:	83 ec 0c             	sub    $0xc,%esp
c0003290:	6a 07                	push   $0x7
c0003292:	68 00 02 00 00       	push   $0x200
c0003297:	51                   	push   %ecx
c0003298:	ff 75 cc             	pushl  -0x34(%ebp)
c000329b:	50                   	push   %eax
c000329c:	e8 5b f6 ff ff       	call   c00028fc <rd_wt>
c00032a1:	83 c4 20             	add    $0x20,%esp
c00032a4:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00032a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00032ac:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00032b3:	eb 35                	jmp    c00032ea <search_file+0x110>
c00032b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00032b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032bc:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00032bf:	7f 33                	jg     c00032f4 <search_file+0x11a>
c00032c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032c4:	83 c0 04             	add    $0x4,%eax
c00032c7:	83 ec 08             	sub    $0x8,%esp
c00032ca:	50                   	push   %eax
c00032cb:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00032ce:	50                   	push   %eax
c00032cf:	e8 d0 70 00 00       	call   c000a3a4 <strcmp>
c00032d4:	83 c4 10             	add    $0x10,%esp
c00032d7:	85 c0                	test   %eax,%eax
c00032d9:	75 07                	jne    c00032e2 <search_file+0x108>
c00032db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032de:	8b 00                	mov    (%eax),%eax
c00032e0:	eb 28                	jmp    c000330a <search_file+0x130>
c00032e2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00032e6:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c00032ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00032ed:	83 f8 1f             	cmp    $0x1f,%eax
c00032f0:	76 c3                	jbe    c00032b5 <search_file+0xdb>
c00032f2:	eb 01                	jmp    c00032f5 <search_file+0x11b>
c00032f4:	90                   	nop
c00032f5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00032f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00032fc:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c00032ff:	0f 8c 79 ff ff ff    	jl     c000327e <search_file+0xa4>
c0003305:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000330a:	c9                   	leave  
c000330b:	c3                   	ret    

c000330c <strip_path>:
c000330c:	55                   	push   %ebp
c000330d:	89 e5                	mov    %esp,%ebp
c000330f:	83 ec 10             	sub    $0x10,%esp
c0003312:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003316:	75 0a                	jne    c0003322 <strip_path+0x16>
c0003318:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000331d:	e9 b4 00 00 00       	jmp    c00033d6 <strip_path+0xca>
c0003322:	8b 45 08             	mov    0x8(%ebp),%eax
c0003325:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003328:	8b 45 0c             	mov    0xc(%ebp),%eax
c000332b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000332e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003331:	0f b6 00             	movzbl (%eax),%eax
c0003334:	3c 2f                	cmp    $0x2f,%al
c0003336:	75 2d                	jne    c0003365 <strip_path+0x59>
c0003338:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000333c:	eb 27                	jmp    c0003365 <strip_path+0x59>
c000333e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003341:	0f b6 00             	movzbl (%eax),%eax
c0003344:	3c 2f                	cmp    $0x2f,%al
c0003346:	75 0a                	jne    c0003352 <strip_path+0x46>
c0003348:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000334d:	e9 84 00 00 00       	jmp    c00033d6 <strip_path+0xca>
c0003352:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003355:	0f b6 10             	movzbl (%eax),%edx
c0003358:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000335b:	88 10                	mov    %dl,(%eax)
c000335d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003361:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003365:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003368:	0f b6 00             	movzbl (%eax),%eax
c000336b:	84 c0                	test   %al,%al
c000336d:	75 cf                	jne    c000333e <strip_path+0x32>
c000336f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003372:	c6 00 00             	movb   $0x0,(%eax)
c0003375:	8b 45 10             	mov    0x10(%ebp),%eax
c0003378:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c000337e:	89 10                	mov    %edx,(%eax)
c0003380:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003386:	89 50 04             	mov    %edx,0x4(%eax)
c0003389:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c000338f:	89 50 08             	mov    %edx,0x8(%eax)
c0003392:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c0003398:	89 50 0c             	mov    %edx,0xc(%eax)
c000339b:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c00033a1:	89 50 10             	mov    %edx,0x10(%eax)
c00033a4:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c00033aa:	89 50 14             	mov    %edx,0x14(%eax)
c00033ad:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c00033b3:	89 50 18             	mov    %edx,0x18(%eax)
c00033b6:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c00033bc:	89 50 1c             	mov    %edx,0x1c(%eax)
c00033bf:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c00033c5:	89 50 20             	mov    %edx,0x20(%eax)
c00033c8:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c00033ce:	89 50 24             	mov    %edx,0x24(%eax)
c00033d1:	b8 00 00 00 00       	mov    $0x0,%eax
c00033d6:	c9                   	leave  
c00033d7:	c3                   	ret    

c00033d8 <get_inode>:
c00033d8:	55                   	push   %ebp
c00033d9:	89 e5                	mov    %esp,%ebp
c00033db:	56                   	push   %esi
c00033dc:	53                   	push   %ebx
c00033dd:	83 ec 20             	sub    $0x20,%esp
c00033e0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00033e4:	75 0a                	jne    c00033f0 <get_inode+0x18>
c00033e6:	b8 00 00 00 00       	mov    $0x0,%eax
c00033eb:	e9 a3 01 00 00       	jmp    c0003593 <get_inode+0x1bb>
c00033f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00033f7:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c00033fe:	eb 69                	jmp    c0003469 <get_inode+0x91>
c0003400:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003403:	8b 40 24             	mov    0x24(%eax),%eax
c0003406:	85 c0                	test   %eax,%eax
c0003408:	7e 53                	jle    c000345d <get_inode+0x85>
c000340a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000340d:	8b 40 10             	mov    0x10(%eax),%eax
c0003410:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003413:	75 50                	jne    c0003465 <get_inode+0x8d>
c0003415:	8b 45 08             	mov    0x8(%ebp),%eax
c0003418:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000341b:	8b 0a                	mov    (%edx),%ecx
c000341d:	89 08                	mov    %ecx,(%eax)
c000341f:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003422:	89 48 04             	mov    %ecx,0x4(%eax)
c0003425:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003428:	89 48 08             	mov    %ecx,0x8(%eax)
c000342b:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000342e:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003431:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003434:	89 48 10             	mov    %ecx,0x10(%eax)
c0003437:	8b 4a 14             	mov    0x14(%edx),%ecx
c000343a:	89 48 14             	mov    %ecx,0x14(%eax)
c000343d:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003440:	89 48 18             	mov    %ecx,0x18(%eax)
c0003443:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003446:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003449:	8b 4a 20             	mov    0x20(%edx),%ecx
c000344c:	89 48 20             	mov    %ecx,0x20(%eax)
c000344f:	8b 52 24             	mov    0x24(%edx),%edx
c0003452:	89 50 24             	mov    %edx,0x24(%eax)
c0003455:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003458:	e9 36 01 00 00       	jmp    c0003593 <get_inode+0x1bb>
c000345d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003460:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003463:	eb 0d                	jmp    c0003472 <get_inode+0x9a>
c0003465:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003469:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c0003470:	76 8e                	jbe    c0003400 <get_inode+0x28>
c0003472:	e8 41 12 00 00       	call   c00046b8 <get_super_block>
c0003477:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000347a:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003481:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003484:	8b 40 04             	mov    0x4(%eax),%eax
c0003487:	8d 50 02             	lea    0x2(%eax),%edx
c000348a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000348d:	8b 40 08             	mov    0x8(%eax),%eax
c0003490:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0003493:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003496:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003499:	b8 00 02 00 00       	mov    $0x200,%eax
c000349e:	99                   	cltd   
c000349f:	f7 7d e8             	idivl  -0x18(%ebp)
c00034a2:	89 c6                	mov    %eax,%esi
c00034a4:	89 c8                	mov    %ecx,%eax
c00034a6:	99                   	cltd   
c00034a7:	f7 fe                	idiv   %esi
c00034a9:	01 d8                	add    %ebx,%eax
c00034ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00034ae:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c00034b5:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00034ba:	83 ec 0c             	sub    $0xc,%esp
c00034bd:	6a 07                	push   $0x7
c00034bf:	68 00 02 00 00       	push   $0x200
c00034c4:	50                   	push   %eax
c00034c5:	ff 75 e0             	pushl  -0x20(%ebp)
c00034c8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00034cb:	e8 2c f4 ff ff       	call   c00028fc <rd_wt>
c00034d0:	83 c4 20             	add    $0x20,%esp
c00034d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00034d6:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00034d9:	b8 00 02 00 00       	mov    $0x200,%eax
c00034de:	99                   	cltd   
c00034df:	f7 7d e8             	idivl  -0x18(%ebp)
c00034e2:	89 c3                	mov    %eax,%ebx
c00034e4:	89 c8                	mov    %ecx,%eax
c00034e6:	99                   	cltd   
c00034e7:	f7 fb                	idiv   %ebx
c00034e9:	89 55 dc             	mov    %edx,-0x24(%ebp)
c00034ec:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00034f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00034f5:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c00034f9:	01 d0                	add    %edx,%eax
c00034fb:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00034fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003501:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003504:	8b 0a                	mov    (%edx),%ecx
c0003506:	89 08                	mov    %ecx,(%eax)
c0003508:	8b 4a 04             	mov    0x4(%edx),%ecx
c000350b:	89 48 04             	mov    %ecx,0x4(%eax)
c000350e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003511:	89 48 08             	mov    %ecx,0x8(%eax)
c0003514:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003517:	89 48 0c             	mov    %ecx,0xc(%eax)
c000351a:	8b 4a 10             	mov    0x10(%edx),%ecx
c000351d:	89 48 10             	mov    %ecx,0x10(%eax)
c0003520:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003523:	89 48 14             	mov    %ecx,0x14(%eax)
c0003526:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003529:	89 48 18             	mov    %ecx,0x18(%eax)
c000352c:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000352f:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003532:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003535:	89 48 20             	mov    %ecx,0x20(%eax)
c0003538:	8b 52 24             	mov    0x24(%edx),%edx
c000353b:	89 50 24             	mov    %edx,0x24(%eax)
c000353e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003541:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003544:	89 50 10             	mov    %edx,0x10(%eax)
c0003547:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000354a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000354d:	89 50 20             	mov    %edx,0x20(%eax)
c0003550:	8b 45 08             	mov    0x8(%ebp),%eax
c0003553:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003556:	8b 0a                	mov    (%edx),%ecx
c0003558:	89 08                	mov    %ecx,(%eax)
c000355a:	8b 4a 04             	mov    0x4(%edx),%ecx
c000355d:	89 48 04             	mov    %ecx,0x4(%eax)
c0003560:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003563:	89 48 08             	mov    %ecx,0x8(%eax)
c0003566:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003569:	89 48 0c             	mov    %ecx,0xc(%eax)
c000356c:	8b 4a 10             	mov    0x10(%edx),%ecx
c000356f:	89 48 10             	mov    %ecx,0x10(%eax)
c0003572:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003575:	89 48 14             	mov    %ecx,0x14(%eax)
c0003578:	8b 4a 18             	mov    0x18(%edx),%ecx
c000357b:	89 48 18             	mov    %ecx,0x18(%eax)
c000357e:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003581:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003584:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003587:	89 48 20             	mov    %ecx,0x20(%eax)
c000358a:	8b 52 24             	mov    0x24(%edx),%edx
c000358d:	89 50 24             	mov    %edx,0x24(%eax)
c0003590:	8b 45 08             	mov    0x8(%ebp),%eax
c0003593:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0003596:	5b                   	pop    %ebx
c0003597:	5e                   	pop    %esi
c0003598:	5d                   	pop    %ebp
c0003599:	c3                   	ret    

c000359a <create_file>:
c000359a:	55                   	push   %ebp
c000359b:	89 e5                	mov    %esp,%ebp
c000359d:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00035a3:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00035a6:	50                   	push   %eax
c00035a7:	ff 75 0c             	pushl  0xc(%ebp)
c00035aa:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00035ad:	50                   	push   %eax
c00035ae:	e8 59 fd ff ff       	call   c000330c <strip_path>
c00035b3:	83 c4 0c             	add    $0xc,%esp
c00035b6:	83 f8 ff             	cmp    $0xffffffff,%eax
c00035b9:	75 0a                	jne    c00035c5 <create_file+0x2b>
c00035bb:	b8 00 00 00 00       	mov    $0x0,%eax
c00035c0:	e9 de 00 00 00       	jmp    c00036a3 <create_file+0x109>
c00035c5:	e8 db 00 00 00       	call   c00036a5 <alloc_imap_bit>
c00035ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00035cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00035d1:	75 0a                	jne    c00035dd <create_file+0x43>
c00035d3:	b8 00 00 00 00       	mov    $0x0,%eax
c00035d8:	e9 c6 00 00 00       	jmp    c00036a3 <create_file+0x109>
c00035dd:	e8 d6 10 00 00       	call   c00046b8 <get_super_block>
c00035e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00035e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035e8:	8b 40 10             	mov    0x10(%eax),%eax
c00035eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00035ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035f1:	83 ec 08             	sub    $0x8,%esp
c00035f4:	50                   	push   %eax
c00035f5:	ff 75 f4             	pushl  -0xc(%ebp)
c00035f8:	e8 a5 01 00 00       	call   c00037a2 <alloc_smap_bit>
c00035fd:	83 c4 10             	add    $0x10,%esp
c0003600:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0003603:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0003607:	75 0a                	jne    c0003613 <create_file+0x79>
c0003609:	b8 00 00 00 00       	mov    $0x0,%eax
c000360e:	e9 90 00 00 00       	jmp    c00036a3 <create_file+0x109>
c0003613:	83 ec 04             	sub    $0x4,%esp
c0003616:	ff 75 e8             	pushl  -0x18(%ebp)
c0003619:	ff 75 f4             	pushl  -0xc(%ebp)
c000361c:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000361f:	50                   	push   %eax
c0003620:	e8 1e 03 00 00       	call   c0003943 <new_inode>
c0003625:	83 c4 10             	add    $0x10,%esp
c0003628:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000362b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c000362f:	75 07                	jne    c0003638 <create_file+0x9e>
c0003631:	b8 00 00 00 00       	mov    $0x0,%eax
c0003636:	eb 6b                	jmp    c00036a3 <create_file+0x109>
c0003638:	ff 75 f4             	pushl  -0xc(%ebp)
c000363b:	8d 45 ac             	lea    -0x54(%ebp),%eax
c000363e:	50                   	push   %eax
c000363f:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003642:	50                   	push   %eax
c0003643:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003649:	50                   	push   %eax
c000364a:	e8 12 04 00 00       	call   c0003a61 <new_dir_entry>
c000364f:	83 c4 10             	add    $0x10,%esp
c0003652:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003655:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003659:	75 07                	jne    c0003662 <create_file+0xc8>
c000365b:	b8 00 00 00 00       	mov    $0x0,%eax
c0003660:	eb 41                	jmp    c00036a3 <create_file+0x109>
c0003662:	8b 45 08             	mov    0x8(%ebp),%eax
c0003665:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0003668:	89 10                	mov    %edx,(%eax)
c000366a:	8b 55 88             	mov    -0x78(%ebp),%edx
c000366d:	89 50 04             	mov    %edx,0x4(%eax)
c0003670:	8b 55 8c             	mov    -0x74(%ebp),%edx
c0003673:	89 50 08             	mov    %edx,0x8(%eax)
c0003676:	8b 55 90             	mov    -0x70(%ebp),%edx
c0003679:	89 50 0c             	mov    %edx,0xc(%eax)
c000367c:	8b 55 94             	mov    -0x6c(%ebp),%edx
c000367f:	89 50 10             	mov    %edx,0x10(%eax)
c0003682:	8b 55 98             	mov    -0x68(%ebp),%edx
c0003685:	89 50 14             	mov    %edx,0x14(%eax)
c0003688:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000368b:	89 50 18             	mov    %edx,0x18(%eax)
c000368e:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0003691:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003694:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0003697:	89 50 20             	mov    %edx,0x20(%eax)
c000369a:	8b 55 a8             	mov    -0x58(%ebp),%edx
c000369d:	89 50 24             	mov    %edx,0x24(%eax)
c00036a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00036a3:	c9                   	leave  
c00036a4:	c3                   	ret    

c00036a5 <alloc_imap_bit>:
c00036a5:	55                   	push   %ebp
c00036a6:	89 e5                	mov    %esp,%ebp
c00036a8:	53                   	push   %ebx
c00036a9:	83 ec 24             	sub    $0x24,%esp
c00036ac:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00036b3:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00036ba:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00036bf:	83 ec 0c             	sub    $0xc,%esp
c00036c2:	6a 07                	push   $0x7
c00036c4:	68 00 02 00 00       	push   $0x200
c00036c9:	50                   	push   %eax
c00036ca:	ff 75 e8             	pushl  -0x18(%ebp)
c00036cd:	ff 75 ec             	pushl  -0x14(%ebp)
c00036d0:	e8 27 f2 ff ff       	call   c00028fc <rd_wt>
c00036d5:	83 c4 20             	add    $0x20,%esp
c00036d8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00036df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00036e6:	e9 a5 00 00 00       	jmp    c0003790 <alloc_imap_bit+0xeb>
c00036eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00036f2:	e9 8b 00 00 00       	jmp    c0003782 <alloc_imap_bit+0xdd>
c00036f7:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00036fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003700:	01 d0                	add    %edx,%eax
c0003702:	0f b6 00             	movzbl (%eax),%eax
c0003705:	0f be d0             	movsbl %al,%edx
c0003708:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000370b:	89 c1                	mov    %eax,%ecx
c000370d:	d3 fa                	sar    %cl,%edx
c000370f:	89 d0                	mov    %edx,%eax
c0003711:	83 e0 01             	and    $0x1,%eax
c0003714:	85 c0                	test   %eax,%eax
c0003716:	74 06                	je     c000371e <alloc_imap_bit+0x79>
c0003718:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000371c:	eb 64                	jmp    c0003782 <alloc_imap_bit+0xdd>
c000371e:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003724:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003727:	01 d0                	add    %edx,%eax
c0003729:	0f b6 18             	movzbl (%eax),%ebx
c000372c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000372f:	ba 01 00 00 00       	mov    $0x1,%edx
c0003734:	89 c1                	mov    %eax,%ecx
c0003736:	d3 e2                	shl    %cl,%edx
c0003738:	89 d0                	mov    %edx,%eax
c000373a:	89 c1                	mov    %eax,%ecx
c000373c:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003742:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003745:	01 d0                	add    %edx,%eax
c0003747:	09 cb                	or     %ecx,%ebx
c0003749:	89 da                	mov    %ebx,%edx
c000374b:	88 10                	mov    %dl,(%eax)
c000374d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003750:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003757:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000375a:	01 d0                	add    %edx,%eax
c000375c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000375f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003764:	83 ec 0c             	sub    $0xc,%esp
c0003767:	6a 0a                	push   $0xa
c0003769:	68 00 02 00 00       	push   $0x200
c000376e:	50                   	push   %eax
c000376f:	ff 75 e8             	pushl  -0x18(%ebp)
c0003772:	ff 75 ec             	pushl  -0x14(%ebp)
c0003775:	e8 82 f1 ff ff       	call   c00028fc <rd_wt>
c000377a:	83 c4 20             	add    $0x20,%esp
c000377d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003780:	eb 1b                	jmp    c000379d <alloc_imap_bit+0xf8>
c0003782:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c0003786:	0f 8e 6b ff ff ff    	jle    c00036f7 <alloc_imap_bit+0x52>
c000378c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003790:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0003797:	0f 8e 4e ff ff ff    	jle    c00036eb <alloc_imap_bit+0x46>
c000379d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00037a0:	c9                   	leave  
c00037a1:	c3                   	ret    

c00037a2 <alloc_smap_bit>:
c00037a2:	55                   	push   %ebp
c00037a3:	89 e5                	mov    %esp,%ebp
c00037a5:	53                   	push   %ebx
c00037a6:	83 ec 34             	sub    $0x34,%esp
c00037a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00037ad:	75 1c                	jne    c00037cb <alloc_smap_bit+0x29>
c00037af:	68 fc 02 00 00       	push   $0x2fc
c00037b4:	68 04 b2 00 c0       	push   $0xc000b204
c00037b9:	68 04 b2 00 c0       	push   $0xc000b204
c00037be:	68 14 b3 00 c0       	push   $0xc000b314
c00037c3:	e8 37 5f 00 00       	call   c00096ff <assertion_failure>
c00037c8:	83 c4 10             	add    $0x10,%esp
c00037cb:	e8 e8 0e 00 00       	call   c00046b8 <get_super_block>
c00037d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00037d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00037d6:	8b 40 08             	mov    0x8(%eax),%eax
c00037d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00037dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00037df:	8b 40 04             	mov    0x4(%eax),%eax
c00037e2:	83 c0 02             	add    $0x2,%eax
c00037e5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00037e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00037ef:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00037f6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00037fd:	e9 20 01 00 00       	jmp    c0003922 <alloc_smap_bit+0x180>
c0003802:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003805:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003808:	01 d0                	add    %edx,%eax
c000380a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000380d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003812:	83 ec 0c             	sub    $0xc,%esp
c0003815:	6a 07                	push   $0x7
c0003817:	68 00 02 00 00       	push   $0x200
c000381c:	50                   	push   %eax
c000381d:	ff 75 d8             	pushl  -0x28(%ebp)
c0003820:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003823:	e8 d4 f0 ff ff       	call   c00028fc <rd_wt>
c0003828:	83 c4 20             	add    $0x20,%esp
c000382b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003832:	e9 b0 00 00 00       	jmp    c00038e7 <alloc_smap_bit+0x145>
c0003837:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000383e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003842:	0f 85 8c 00 00 00    	jne    c00038d4 <alloc_smap_bit+0x132>
c0003848:	eb 45                	jmp    c000388f <alloc_smap_bit+0xed>
c000384a:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003850:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003853:	01 d0                	add    %edx,%eax
c0003855:	0f b6 00             	movzbl (%eax),%eax
c0003858:	0f be d0             	movsbl %al,%edx
c000385b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000385e:	89 c1                	mov    %eax,%ecx
c0003860:	d3 fa                	sar    %cl,%edx
c0003862:	89 d0                	mov    %edx,%eax
c0003864:	83 e0 01             	and    $0x1,%eax
c0003867:	85 c0                	test   %eax,%eax
c0003869:	74 06                	je     c0003871 <alloc_smap_bit+0xcf>
c000386b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000386f:	eb 1e                	jmp    c000388f <alloc_smap_bit+0xed>
c0003871:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003874:	c1 e0 09             	shl    $0x9,%eax
c0003877:	89 c2                	mov    %eax,%edx
c0003879:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000387c:	01 d0                	add    %edx,%eax
c000387e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003885:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003888:	01 d0                	add    %edx,%eax
c000388a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000388d:	eb 06                	jmp    c0003895 <alloc_smap_bit+0xf3>
c000388f:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003893:	7e b5                	jle    c000384a <alloc_smap_bit+0xa8>
c0003895:	eb 3d                	jmp    c00038d4 <alloc_smap_bit+0x132>
c0003897:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000389b:	74 45                	je     c00038e2 <alloc_smap_bit+0x140>
c000389d:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00038a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038a6:	01 d0                	add    %edx,%eax
c00038a8:	0f b6 18             	movzbl (%eax),%ebx
c00038ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00038ae:	ba 01 00 00 00       	mov    $0x1,%edx
c00038b3:	89 c1                	mov    %eax,%ecx
c00038b5:	d3 e2                	shl    %cl,%edx
c00038b7:	89 d0                	mov    %edx,%eax
c00038b9:	89 c1                	mov    %eax,%ecx
c00038bb:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00038c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038c4:	01 d0                	add    %edx,%eax
c00038c6:	09 cb                	or     %ecx,%ebx
c00038c8:	89 da                	mov    %ebx,%edx
c00038ca:	88 10                	mov    %dl,(%eax)
c00038cc:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00038d0:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00038d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00038d8:	74 09                	je     c00038e3 <alloc_smap_bit+0x141>
c00038da:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00038de:	7e b7                	jle    c0003897 <alloc_smap_bit+0xf5>
c00038e0:	eb 01                	jmp    c00038e3 <alloc_smap_bit+0x141>
c00038e2:	90                   	nop
c00038e3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00038e7:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c00038ee:	0f 8e 43 ff ff ff    	jle    c0003837 <alloc_smap_bit+0x95>
c00038f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00038f8:	74 1e                	je     c0003918 <alloc_smap_bit+0x176>
c00038fa:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00038ff:	83 ec 0c             	sub    $0xc,%esp
c0003902:	6a 0a                	push   $0xa
c0003904:	68 00 02 00 00       	push   $0x200
c0003909:	50                   	push   %eax
c000390a:	ff 75 d8             	pushl  -0x28(%ebp)
c000390d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003910:	e8 e7 ef ff ff       	call   c00028fc <rd_wt>
c0003915:	83 c4 20             	add    $0x20,%esp
c0003918:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000391c:	74 12                	je     c0003930 <alloc_smap_bit+0x18e>
c000391e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003922:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003925:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003928:	0f 8c d4 fe ff ff    	jl     c0003802 <alloc_smap_bit+0x60>
c000392e:	eb 01                	jmp    c0003931 <alloc_smap_bit+0x18f>
c0003930:	90                   	nop
c0003931:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003934:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003937:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000393a:	8b 00                	mov    (%eax),%eax
c000393c:	01 d0                	add    %edx,%eax
c000393e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003941:	c9                   	leave  
c0003942:	c3                   	ret    

c0003943 <new_inode>:
c0003943:	55                   	push   %ebp
c0003944:	89 e5                	mov    %esp,%ebp
c0003946:	83 ec 38             	sub    $0x38,%esp
c0003949:	83 ec 08             	sub    $0x8,%esp
c000394c:	ff 75 0c             	pushl  0xc(%ebp)
c000394f:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003952:	50                   	push   %eax
c0003953:	e8 80 fa ff ff       	call   c00033d8 <get_inode>
c0003958:	83 c4 10             	add    $0x10,%esp
c000395b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000395e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003962:	75 0a                	jne    c000396e <new_inode+0x2b>
c0003964:	b8 00 00 00 00       	mov    $0x0,%eax
c0003969:	e9 f1 00 00 00       	jmp    c0003a5f <new_inode+0x11c>
c000396e:	8b 45 10             	mov    0x10(%ebp),%eax
c0003971:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003974:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c000397b:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003982:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003989:	8b 45 0c             	mov    0xc(%ebp),%eax
c000398c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000398f:	83 ec 0c             	sub    $0xc,%esp
c0003992:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003995:	50                   	push   %eax
c0003996:	e8 39 0b 00 00       	call   c00044d4 <sync_inode>
c000399b:	83 c4 10             	add    $0x10,%esp
c000399e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00039a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00039ac:	eb 1d                	jmp    c00039cb <new_inode+0x88>
c00039ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00039b1:	89 d0                	mov    %edx,%eax
c00039b3:	c1 e0 02             	shl    $0x2,%eax
c00039b6:	01 d0                	add    %edx,%eax
c00039b8:	c1 e0 03             	shl    $0x3,%eax
c00039bb:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c00039c0:	8b 00                	mov    (%eax),%eax
c00039c2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00039c5:	74 0c                	je     c00039d3 <new_inode+0x90>
c00039c7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00039cb:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00039cf:	7e dd                	jle    c00039ae <new_inode+0x6b>
c00039d1:	eb 01                	jmp    c00039d4 <new_inode+0x91>
c00039d3:	90                   	nop
c00039d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00039d7:	89 d0                	mov    %edx,%eax
c00039d9:	c1 e0 02             	shl    $0x2,%eax
c00039dc:	01 d0                	add    %edx,%eax
c00039de:	c1 e0 03             	shl    $0x3,%eax
c00039e1:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c00039e6:	8b 55 c8             	mov    -0x38(%ebp),%edx
c00039e9:	89 10                	mov    %edx,(%eax)
c00039eb:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00039ee:	89 50 04             	mov    %edx,0x4(%eax)
c00039f1:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00039f4:	89 50 08             	mov    %edx,0x8(%eax)
c00039f7:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00039fa:	89 50 0c             	mov    %edx,0xc(%eax)
c00039fd:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003a00:	89 50 10             	mov    %edx,0x10(%eax)
c0003a03:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003a06:	89 50 14             	mov    %edx,0x14(%eax)
c0003a09:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003a0c:	89 50 18             	mov    %edx,0x18(%eax)
c0003a0f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003a12:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003a15:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003a18:	89 50 20             	mov    %edx,0x20(%eax)
c0003a1b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003a1e:	89 50 24             	mov    %edx,0x24(%eax)
c0003a21:	8b 45 08             	mov    0x8(%ebp),%eax
c0003a24:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003a27:	89 10                	mov    %edx,(%eax)
c0003a29:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003a2c:	89 50 04             	mov    %edx,0x4(%eax)
c0003a2f:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003a32:	89 50 08             	mov    %edx,0x8(%eax)
c0003a35:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003a38:	89 50 0c             	mov    %edx,0xc(%eax)
c0003a3b:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003a3e:	89 50 10             	mov    %edx,0x10(%eax)
c0003a41:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003a44:	89 50 14             	mov    %edx,0x14(%eax)
c0003a47:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003a4a:	89 50 18             	mov    %edx,0x18(%eax)
c0003a4d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003a50:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003a53:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003a56:	89 50 20             	mov    %edx,0x20(%eax)
c0003a59:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003a5c:	89 50 24             	mov    %edx,0x24(%eax)
c0003a5f:	c9                   	leave  
c0003a60:	c3                   	ret    

c0003a61 <new_dir_entry>:
c0003a61:	55                   	push   %ebp
c0003a62:	89 e5                	mov    %esp,%ebp
c0003a64:	83 ec 48             	sub    $0x48,%esp
c0003a67:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003a6e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a71:	8b 40 04             	mov    0x4(%eax),%eax
c0003a74:	99                   	cltd   
c0003a75:	f7 7d dc             	idivl  -0x24(%ebp)
c0003a78:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003a7b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a7e:	8b 40 0c             	mov    0xc(%eax),%eax
c0003a81:	99                   	cltd   
c0003a82:	f7 7d dc             	idivl  -0x24(%ebp)
c0003a85:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003a88:	e8 2b 0c 00 00       	call   c00046b8 <get_super_block>
c0003a8d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003a90:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003a93:	8b 00                	mov    (%eax),%eax
c0003a95:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003a98:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a9b:	8b 40 0c             	mov    0xc(%eax),%eax
c0003a9e:	05 00 02 00 00       	add    $0x200,%eax
c0003aa3:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003aa9:	85 c0                	test   %eax,%eax
c0003aab:	0f 48 c2             	cmovs  %edx,%eax
c0003aae:	c1 f8 09             	sar    $0x9,%eax
c0003ab1:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003ab4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003abb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003ac2:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003ac9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003ad0:	eb 7f                	jmp    c0003b51 <new_dir_entry+0xf0>
c0003ad2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003ad7:	89 c1                	mov    %eax,%ecx
c0003ad9:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003adc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003adf:	01 d0                	add    %edx,%eax
c0003ae1:	83 ec 0c             	sub    $0xc,%esp
c0003ae4:	6a 07                	push   $0x7
c0003ae6:	68 00 02 00 00       	push   $0x200
c0003aeb:	51                   	push   %ecx
c0003aec:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003aef:	50                   	push   %eax
c0003af0:	e8 07 ee ff ff       	call   c00028fc <rd_wt>
c0003af5:	83 c4 20             	add    $0x20,%esp
c0003af8:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003afd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003b00:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003b07:	eb 25                	jmp    c0003b2e <new_dir_entry+0xcd>
c0003b09:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003b0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b10:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003b13:	7f 29                	jg     c0003b3e <new_dir_entry+0xdd>
c0003b15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b18:	8b 00                	mov    (%eax),%eax
c0003b1a:	85 c0                	test   %eax,%eax
c0003b1c:	75 08                	jne    c0003b26 <new_dir_entry+0xc5>
c0003b1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b21:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003b24:	eb 19                	jmp    c0003b3f <new_dir_entry+0xde>
c0003b26:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003b2a:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003b2e:	b8 00 02 00 00       	mov    $0x200,%eax
c0003b33:	99                   	cltd   
c0003b34:	f7 7d dc             	idivl  -0x24(%ebp)
c0003b37:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003b3a:	7c cd                	jl     c0003b09 <new_dir_entry+0xa8>
c0003b3c:	eb 01                	jmp    c0003b3f <new_dir_entry+0xde>
c0003b3e:	90                   	nop
c0003b3f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b42:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003b45:	7f 16                	jg     c0003b5d <new_dir_entry+0xfc>
c0003b47:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b4b:	75 10                	jne    c0003b5d <new_dir_entry+0xfc>
c0003b4d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003b51:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b54:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003b57:	0f 8c 75 ff ff ff    	jl     c0003ad2 <new_dir_entry+0x71>
c0003b5d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003b60:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003b63:	75 0a                	jne    c0003b6f <new_dir_entry+0x10e>
c0003b65:	b8 00 00 00 00       	mov    $0x0,%eax
c0003b6a:	e9 fc 00 00 00       	jmp    c0003c6b <new_dir_entry+0x20a>
c0003b6f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003b76:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b7a:	75 1e                	jne    c0003b9a <new_dir_entry+0x139>
c0003b7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003b82:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b85:	8b 50 04             	mov    0x4(%eax),%edx
c0003b88:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003b8b:	01 c2                	add    %eax,%edx
c0003b8d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b90:	89 50 04             	mov    %edx,0x4(%eax)
c0003b93:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003b9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003b9d:	8b 55 14             	mov    0x14(%ebp),%edx
c0003ba0:	89 10                	mov    %edx,(%eax)
c0003ba2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003ba5:	83 c0 04             	add    $0x4,%eax
c0003ba8:	83 ec 08             	sub    $0x8,%esp
c0003bab:	ff 75 10             	pushl  0x10(%ebp)
c0003bae:	50                   	push   %eax
c0003baf:	e8 62 82 00 00       	call   c000be16 <Strcpy>
c0003bb4:	83 c4 10             	add    $0x10,%esp
c0003bb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0003bba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003bbd:	8b 0a                	mov    (%edx),%ecx
c0003bbf:	89 08                	mov    %ecx,(%eax)
c0003bc1:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003bc4:	89 48 04             	mov    %ecx,0x4(%eax)
c0003bc7:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003bca:	89 48 08             	mov    %ecx,0x8(%eax)
c0003bcd:	8b 52 0c             	mov    0xc(%edx),%edx
c0003bd0:	89 50 0c             	mov    %edx,0xc(%eax)
c0003bd3:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003bd8:	89 c1                	mov    %eax,%ecx
c0003bda:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003bdd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003be0:	01 d0                	add    %edx,%eax
c0003be2:	83 ec 0c             	sub    $0xc,%esp
c0003be5:	6a 0a                	push   $0xa
c0003be7:	68 00 02 00 00       	push   $0x200
c0003bec:	51                   	push   %ecx
c0003bed:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003bf0:	50                   	push   %eax
c0003bf1:	e8 06 ed ff ff       	call   c00028fc <rd_wt>
c0003bf6:	83 c4 20             	add    $0x20,%esp
c0003bf9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003bfd:	74 69                	je     c0003c68 <new_dir_entry+0x207>
c0003bff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c02:	8b 10                	mov    (%eax),%edx
c0003c04:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003c0a:	8b 50 04             	mov    0x4(%eax),%edx
c0003c0d:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003c13:	8b 50 08             	mov    0x8(%eax),%edx
c0003c16:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003c1c:	8b 50 0c             	mov    0xc(%eax),%edx
c0003c1f:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003c25:	8b 50 10             	mov    0x10(%eax),%edx
c0003c28:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003c2e:	8b 50 14             	mov    0x14(%eax),%edx
c0003c31:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003c37:	8b 50 18             	mov    0x18(%eax),%edx
c0003c3a:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003c40:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003c43:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003c49:	8b 50 20             	mov    0x20(%eax),%edx
c0003c4c:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003c52:	8b 40 24             	mov    0x24(%eax),%eax
c0003c55:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003c5a:	83 ec 0c             	sub    $0xc,%esp
c0003c5d:	ff 75 0c             	pushl  0xc(%ebp)
c0003c60:	e8 6f 08 00 00       	call   c00044d4 <sync_inode>
c0003c65:	83 c4 10             	add    $0x10,%esp
c0003c68:	8b 45 08             	mov    0x8(%ebp),%eax
c0003c6b:	c9                   	leave  
c0003c6c:	c3                   	ret    

c0003c6d <do_unlink>:
c0003c6d:	55                   	push   %ebp
c0003c6e:	89 e5                	mov    %esp,%ebp
c0003c70:	53                   	push   %ebx
c0003c71:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003c77:	83 ec 08             	sub    $0x8,%esp
c0003c7a:	ff 75 08             	pushl  0x8(%ebp)
c0003c7d:	68 29 b3 00 c0       	push   $0xc000b329
c0003c82:	e8 1d 67 00 00       	call   c000a3a4 <strcmp>
c0003c87:	83 c4 10             	add    $0x10,%esp
c0003c8a:	85 c0                	test   %eax,%eax
c0003c8c:	75 10                	jne    c0003c9e <do_unlink+0x31>
c0003c8e:	83 ec 0c             	sub    $0xc,%esp
c0003c91:	68 2b b3 00 c0       	push   $0xc000b32b
c0003c96:	e8 46 5a 00 00       	call   c00096e1 <panic>
c0003c9b:	83 c4 10             	add    $0x10,%esp
c0003c9e:	83 ec 0c             	sub    $0xc,%esp
c0003ca1:	ff 75 08             	pushl  0x8(%ebp)
c0003ca4:	e8 31 f5 ff ff       	call   c00031da <search_file>
c0003ca9:	83 c4 10             	add    $0x10,%esp
c0003cac:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003caf:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003cb3:	75 10                	jne    c0003cc5 <do_unlink+0x58>
c0003cb5:	83 ec 0c             	sub    $0xc,%esp
c0003cb8:	68 47 b3 00 c0       	push   $0xc000b347
c0003cbd:	e8 1f 5a 00 00       	call   c00096e1 <panic>
c0003cc2:	83 c4 10             	add    $0x10,%esp
c0003cc5:	83 ec 08             	sub    $0x8,%esp
c0003cc8:	ff 75 d0             	pushl  -0x30(%ebp)
c0003ccb:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003cd1:	50                   	push   %eax
c0003cd2:	e8 01 f7 ff ff       	call   c00033d8 <get_inode>
c0003cd7:	83 c4 10             	add    $0x10,%esp
c0003cda:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003cdd:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003ce1:	75 10                	jne    c0003cf3 <do_unlink+0x86>
c0003ce3:	83 ec 0c             	sub    $0xc,%esp
c0003ce6:	68 47 b3 00 c0       	push   $0xc000b347
c0003ceb:	e8 f1 59 00 00       	call   c00096e1 <panic>
c0003cf0:	83 c4 10             	add    $0x10,%esp
c0003cf3:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003cf6:	85 c0                	test   %eax,%eax
c0003cf8:	7e 10                	jle    c0003d0a <do_unlink+0x9d>
c0003cfa:	83 ec 0c             	sub    $0xc,%esp
c0003cfd:	68 60 b3 00 c0       	push   $0xc000b360
c0003d02:	e8 da 59 00 00       	call   c00096e1 <panic>
c0003d07:	83 c4 10             	add    $0x10,%esp
c0003d0a:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003d10:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003d13:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003d16:	8d 50 07             	lea    0x7(%eax),%edx
c0003d19:	85 c0                	test   %eax,%eax
c0003d1b:	0f 48 c2             	cmovs  %edx,%eax
c0003d1e:	c1 f8 03             	sar    $0x3,%eax
c0003d21:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003d24:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003d27:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003d2d:	85 c0                	test   %eax,%eax
c0003d2f:	0f 48 c2             	cmovs  %edx,%eax
c0003d32:	c1 f8 09             	sar    $0x9,%eax
c0003d35:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003d38:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003d3b:	99                   	cltd   
c0003d3c:	c1 ea 1d             	shr    $0x1d,%edx
c0003d3f:	01 d0                	add    %edx,%eax
c0003d41:	83 e0 07             	and    $0x7,%eax
c0003d44:	29 d0                	sub    %edx,%eax
c0003d46:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003d49:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003d50:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003d55:	89 c2                	mov    %eax,%edx
c0003d57:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003d5a:	83 c0 02             	add    $0x2,%eax
c0003d5d:	83 ec 0c             	sub    $0xc,%esp
c0003d60:	6a 07                	push   $0x7
c0003d62:	68 00 02 00 00       	push   $0x200
c0003d67:	52                   	push   %edx
c0003d68:	ff 75 b8             	pushl  -0x48(%ebp)
c0003d6b:	50                   	push   %eax
c0003d6c:	e8 8b eb ff ff       	call   c00028fc <rd_wt>
c0003d71:	83 c4 20             	add    $0x20,%esp
c0003d74:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003d7a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003d7d:	01 d0                	add    %edx,%eax
c0003d7f:	0f b6 10             	movzbl (%eax),%edx
c0003d82:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003d85:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003d8a:	89 c1                	mov    %eax,%ecx
c0003d8c:	d3 e3                	shl    %cl,%ebx
c0003d8e:	89 d8                	mov    %ebx,%eax
c0003d90:	f7 d0                	not    %eax
c0003d92:	89 c3                	mov    %eax,%ebx
c0003d94:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003d9a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003d9d:	01 c8                	add    %ecx,%eax
c0003d9f:	21 da                	and    %ebx,%edx
c0003da1:	88 10                	mov    %dl,(%eax)
c0003da3:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003da8:	89 c2                	mov    %eax,%edx
c0003daa:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003dad:	83 c0 02             	add    $0x2,%eax
c0003db0:	83 ec 0c             	sub    $0xc,%esp
c0003db3:	6a 0a                	push   $0xa
c0003db5:	68 00 02 00 00       	push   $0x200
c0003dba:	52                   	push   %edx
c0003dbb:	ff 75 b8             	pushl  -0x48(%ebp)
c0003dbe:	50                   	push   %eax
c0003dbf:	e8 38 eb ff ff       	call   c00028fc <rd_wt>
c0003dc4:	83 c4 20             	add    $0x20,%esp
c0003dc7:	e8 ec 08 00 00       	call   c00046b8 <get_super_block>
c0003dcc:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003dcf:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003dd5:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003dd8:	8b 00                	mov    (%eax),%eax
c0003dda:	29 c2                	sub    %eax,%edx
c0003ddc:	89 d0                	mov    %edx,%eax
c0003dde:	83 c0 01             	add    $0x1,%eax
c0003de1:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003de4:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003de7:	8d 50 07             	lea    0x7(%eax),%edx
c0003dea:	85 c0                	test   %eax,%eax
c0003dec:	0f 48 c2             	cmovs  %edx,%eax
c0003def:	c1 f8 03             	sar    $0x3,%eax
c0003df2:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003df5:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003df8:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003dfe:	85 c0                	test   %eax,%eax
c0003e00:	0f 48 c2             	cmovs  %edx,%eax
c0003e03:	c1 f8 09             	sar    $0x9,%eax
c0003e06:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003e09:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003e0c:	99                   	cltd   
c0003e0d:	c1 ea 1d             	shr    $0x1d,%edx
c0003e10:	01 d0                	add    %edx,%eax
c0003e12:	83 e0 07             	and    $0x7,%eax
c0003e15:	29 d0                	sub    %edx,%eax
c0003e17:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003e1a:	b8 08 00 00 00       	mov    $0x8,%eax
c0003e1f:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003e22:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003e25:	29 c2                	sub    %eax,%edx
c0003e27:	89 d0                	mov    %edx,%eax
c0003e29:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003e2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e2f:	8d 50 07             	lea    0x7(%eax),%edx
c0003e32:	85 c0                	test   %eax,%eax
c0003e34:	0f 48 c2             	cmovs  %edx,%eax
c0003e37:	c1 f8 03             	sar    $0x3,%eax
c0003e3a:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003e3d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e42:	89 c1                	mov    %eax,%ecx
c0003e44:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003e47:	8b 40 04             	mov    0x4(%eax),%eax
c0003e4a:	8d 50 02             	lea    0x2(%eax),%edx
c0003e4d:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003e50:	01 d0                	add    %edx,%eax
c0003e52:	83 ec 0c             	sub    $0xc,%esp
c0003e55:	6a 07                	push   $0x7
c0003e57:	68 00 02 00 00       	push   $0x200
c0003e5c:	51                   	push   %ecx
c0003e5d:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e60:	50                   	push   %eax
c0003e61:	e8 96 ea ff ff       	call   c00028fc <rd_wt>
c0003e66:	83 c4 20             	add    $0x20,%esp
c0003e69:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003e6f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003e72:	01 d0                	add    %edx,%eax
c0003e74:	0f b6 10             	movzbl (%eax),%edx
c0003e77:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003e7a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003e7f:	89 c1                	mov    %eax,%ecx
c0003e81:	d3 e3                	shl    %cl,%ebx
c0003e83:	89 d8                	mov    %ebx,%eax
c0003e85:	f7 d0                	not    %eax
c0003e87:	89 c3                	mov    %eax,%ebx
c0003e89:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003e8f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003e92:	01 c8                	add    %ecx,%eax
c0003e94:	21 da                	and    %ebx,%edx
c0003e96:	88 10                	mov    %dl,(%eax)
c0003e98:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003e9f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003ea2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003ea5:	eb 6b                	jmp    c0003f12 <do_unlink+0x2a5>
c0003ea7:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003eae:	75 4c                	jne    c0003efc <do_unlink+0x28f>
c0003eb0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003eb7:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003ebc:	83 ec 0c             	sub    $0xc,%esp
c0003ebf:	6a 0a                	push   $0xa
c0003ec1:	68 00 02 00 00       	push   $0x200
c0003ec6:	50                   	push   %eax
c0003ec7:	ff 75 b8             	pushl  -0x48(%ebp)
c0003eca:	ff 75 ec             	pushl  -0x14(%ebp)
c0003ecd:	e8 2a ea ff ff       	call   c00028fc <rd_wt>
c0003ed2:	83 c4 20             	add    $0x20,%esp
c0003ed5:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003eda:	89 c1                	mov    %eax,%ecx
c0003edc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003edf:	8d 50 01             	lea    0x1(%eax),%edx
c0003ee2:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003ee5:	83 ec 0c             	sub    $0xc,%esp
c0003ee8:	6a 07                	push   $0x7
c0003eea:	68 00 02 00 00       	push   $0x200
c0003eef:	51                   	push   %ecx
c0003ef0:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ef3:	50                   	push   %eax
c0003ef4:	e8 03 ea ff ff       	call   c00028fc <rd_wt>
c0003ef9:	83 c4 20             	add    $0x20,%esp
c0003efc:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003f02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003f05:	01 d0                	add    %edx,%eax
c0003f07:	c6 00 00             	movb   $0x0,(%eax)
c0003f0a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003f0e:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0003f12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003f15:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0003f18:	7c 8d                	jl     c0003ea7 <do_unlink+0x23a>
c0003f1a:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003f21:	75 4c                	jne    c0003f6f <do_unlink+0x302>
c0003f23:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003f2a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003f2f:	83 ec 0c             	sub    $0xc,%esp
c0003f32:	6a 0a                	push   $0xa
c0003f34:	68 00 02 00 00       	push   $0x200
c0003f39:	50                   	push   %eax
c0003f3a:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f3d:	ff 75 ec             	pushl  -0x14(%ebp)
c0003f40:	e8 b7 e9 ff ff       	call   c00028fc <rd_wt>
c0003f45:	83 c4 20             	add    $0x20,%esp
c0003f48:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003f4d:	89 c1                	mov    %eax,%ecx
c0003f4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003f52:	8d 50 01             	lea    0x1(%eax),%edx
c0003f55:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003f58:	83 ec 0c             	sub    $0xc,%esp
c0003f5b:	6a 07                	push   $0x7
c0003f5d:	68 00 02 00 00       	push   $0x200
c0003f62:	51                   	push   %ecx
c0003f63:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f66:	50                   	push   %eax
c0003f67:	e8 90 e9 ff ff       	call   c00028fc <rd_wt>
c0003f6c:	83 c4 20             	add    $0x20,%esp
c0003f6f:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003f75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003f78:	01 d0                	add    %edx,%eax
c0003f7a:	0f b6 10             	movzbl (%eax),%edx
c0003f7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f80:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003f85:	89 c1                	mov    %eax,%ecx
c0003f87:	d3 e3                	shl    %cl,%ebx
c0003f89:	89 d8                	mov    %ebx,%eax
c0003f8b:	89 c3                	mov    %eax,%ebx
c0003f8d:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003f93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003f96:	01 c8                	add    %ecx,%eax
c0003f98:	21 da                	and    %ebx,%edx
c0003f9a:	88 10                	mov    %dl,(%eax)
c0003f9c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003fa1:	83 ec 0c             	sub    $0xc,%esp
c0003fa4:	6a 0a                	push   $0xa
c0003fa6:	68 00 02 00 00       	push   $0x200
c0003fab:	50                   	push   %eax
c0003fac:	ff 75 b8             	pushl  -0x48(%ebp)
c0003faf:	ff 75 ec             	pushl  -0x14(%ebp)
c0003fb2:	e8 45 e9 ff ff       	call   c00028fc <rd_wt>
c0003fb7:	83 c4 20             	add    $0x20,%esp
c0003fba:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0003fc1:	00 00 00 
c0003fc4:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0003fcb:	00 00 00 
c0003fce:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c0003fd5:	00 00 00 
c0003fd8:	83 ec 0c             	sub    $0xc,%esp
c0003fdb:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003fe1:	50                   	push   %eax
c0003fe2:	e8 ed 04 00 00       	call   c00044d4 <sync_inode>
c0003fe7:	83 c4 10             	add    $0x10,%esp
c0003fea:	83 ec 0c             	sub    $0xc,%esp
c0003fed:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003ff3:	50                   	push   %eax
c0003ff4:	e8 2f 06 00 00       	call   c0004628 <put_inode>
c0003ff9:	83 c4 10             	add    $0x10,%esp
c0003ffc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003fff:	8b 00                	mov    (%eax),%eax
c0004001:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004004:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c000400b:	8b 45 98             	mov    -0x68(%ebp),%eax
c000400e:	8b 40 04             	mov    0x4(%eax),%eax
c0004011:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004014:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004017:	8b 40 0c             	mov    0xc(%eax),%eax
c000401a:	89 45 90             	mov    %eax,-0x70(%ebp)
c000401d:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004020:	c1 e8 04             	shr    $0x4,%eax
c0004023:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0004026:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000402d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004034:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000403b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0004042:	e9 a5 00 00 00       	jmp    c00040ec <do_unlink+0x47f>
c0004047:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000404c:	89 c1                	mov    %eax,%ecx
c000404e:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004051:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004054:	01 d0                	add    %edx,%eax
c0004056:	83 ec 0c             	sub    $0xc,%esp
c0004059:	6a 07                	push   $0x7
c000405b:	68 00 02 00 00       	push   $0x200
c0004060:	51                   	push   %ecx
c0004061:	ff 75 b8             	pushl  -0x48(%ebp)
c0004064:	50                   	push   %eax
c0004065:	e8 92 e8 ff ff       	call   c00028fc <rd_wt>
c000406a:	83 c4 20             	add    $0x20,%esp
c000406d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0004072:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004075:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c000407c:	eb 51                	jmp    c00040cf <do_unlink+0x462>
c000407e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0004082:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004085:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004088:	7f 4f                	jg     c00040d9 <do_unlink+0x46c>
c000408a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000408d:	83 c0 10             	add    $0x10,%eax
c0004090:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004093:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004096:	83 c0 04             	add    $0x4,%eax
c0004099:	83 ec 08             	sub    $0x8,%esp
c000409c:	ff 75 08             	pushl  0x8(%ebp)
c000409f:	50                   	push   %eax
c00040a0:	e8 ff 62 00 00       	call   c000a3a4 <strcmp>
c00040a5:	83 c4 10             	add    $0x10,%esp
c00040a8:	85 c0                	test   %eax,%eax
c00040aa:	75 1b                	jne    c00040c7 <do_unlink+0x45a>
c00040ac:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c00040b3:	83 ec 04             	sub    $0x4,%esp
c00040b6:	6a 10                	push   $0x10
c00040b8:	6a 00                	push   $0x0
c00040ba:	ff 75 d4             	pushl  -0x2c(%ebp)
c00040bd:	e8 35 7d 00 00       	call   c000bdf7 <Memset>
c00040c2:	83 c4 10             	add    $0x10,%esp
c00040c5:	eb 13                	jmp    c00040da <do_unlink+0x46d>
c00040c7:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c00040cb:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c00040cf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00040d2:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00040d5:	7c a7                	jl     c000407e <do_unlink+0x411>
c00040d7:	eb 01                	jmp    c00040da <do_unlink+0x46d>
c00040d9:	90                   	nop
c00040da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00040dd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00040e0:	7f 16                	jg     c00040f8 <do_unlink+0x48b>
c00040e2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00040e6:	75 10                	jne    c00040f8 <do_unlink+0x48b>
c00040e8:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c00040ec:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00040ef:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00040f2:	0f 8c 4f ff ff ff    	jl     c0004047 <do_unlink+0x3da>
c00040f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00040fb:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00040fe:	75 17                	jne    c0004117 <do_unlink+0x4aa>
c0004100:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004103:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0004106:	89 50 04             	mov    %edx,0x4(%eax)
c0004109:	83 ec 0c             	sub    $0xc,%esp
c000410c:	ff 75 98             	pushl  -0x68(%ebp)
c000410f:	e8 c0 03 00 00       	call   c00044d4 <sync_inode>
c0004114:	83 c4 10             	add    $0x10,%esp
c0004117:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000411b:	74 26                	je     c0004143 <do_unlink+0x4d6>
c000411d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004122:	89 c1                	mov    %eax,%ecx
c0004124:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004127:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000412a:	01 d0                	add    %edx,%eax
c000412c:	83 ec 0c             	sub    $0xc,%esp
c000412f:	6a 0a                	push   $0xa
c0004131:	68 00 02 00 00       	push   $0x200
c0004136:	51                   	push   %ecx
c0004137:	ff 75 b8             	pushl  -0x48(%ebp)
c000413a:	50                   	push   %eax
c000413b:	e8 bc e7 ff ff       	call   c00028fc <rd_wt>
c0004140:	83 c4 20             	add    $0x20,%esp
c0004143:	90                   	nop
c0004144:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004147:	c9                   	leave  
c0004148:	c3                   	ret    

c0004149 <do_rdwt>:
c0004149:	55                   	push   %ebp
c000414a:	89 e5                	mov    %esp,%ebp
c000414c:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0004152:	8b 45 08             	mov    0x8(%ebp),%eax
c0004155:	8b 40 78             	mov    0x78(%eax),%eax
c0004158:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000415b:	8b 45 08             	mov    0x8(%ebp),%eax
c000415e:	8b 40 60             	mov    0x60(%eax),%eax
c0004161:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004164:	8b 45 08             	mov    0x8(%ebp),%eax
c0004167:	8b 40 6c             	mov    0x6c(%eax),%eax
c000416a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000416d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004170:	8b 00                	mov    (%eax),%eax
c0004172:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004175:	8b 45 08             	mov    0x8(%ebp),%eax
c0004178:	8b 40 10             	mov    0x10(%eax),%eax
c000417b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000417e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004181:	8b 40 50             	mov    0x50(%eax),%eax
c0004184:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004187:	83 ec 0c             	sub    $0xc,%esp
c000418a:	ff 75 d0             	pushl  -0x30(%ebp)
c000418d:	e8 2a 07 00 00       	call   c00048bc <pid2proc>
c0004192:	83 c4 10             	add    $0x10,%esp
c0004195:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004198:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000419b:	8b 55 c8             	mov    -0x38(%ebp),%edx
c000419e:	83 c2 50             	add    $0x50,%edx
c00041a1:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c00041a5:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00041a8:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00041ab:	8b 40 08             	mov    0x8(%eax),%eax
c00041ae:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00041b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00041b4:	8b 00                	mov    (%eax),%eax
c00041b6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00041b9:	83 ec 08             	sub    $0x8,%esp
c00041bc:	ff 75 bc             	pushl  -0x44(%ebp)
c00041bf:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00041c5:	50                   	push   %eax
c00041c6:	e8 0d f2 ff ff       	call   c00033d8 <get_inode>
c00041cb:	83 c4 10             	add    $0x10,%esp
c00041ce:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00041d1:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c00041d5:	75 10                	jne    c00041e7 <do_rdwt+0x9e>
c00041d7:	83 ec 0c             	sub    $0xc,%esp
c00041da:	68 98 b3 00 c0       	push   $0xc000b398
c00041df:	e8 fd 54 00 00       	call   c00096e1 <panic>
c00041e4:	83 c4 10             	add    $0x10,%esp
c00041e7:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00041ed:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00041f0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00041f3:	8b 40 04             	mov    0x4(%eax),%eax
c00041f6:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00041f9:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00041fd:	74 22                	je     c0004221 <do_rdwt+0xd8>
c00041ff:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004203:	74 1c                	je     c0004221 <do_rdwt+0xd8>
c0004205:	68 a7 04 00 00       	push   $0x4a7
c000420a:	68 04 b2 00 c0       	push   $0xc000b204
c000420f:	68 04 b2 00 c0       	push   $0xc000b204
c0004214:	68 a8 b3 00 c0       	push   $0xc000b3a8
c0004219:	e8 e1 54 00 00       	call   c00096ff <assertion_failure>
c000421e:	83 c4 10             	add    $0x10,%esp
c0004221:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0004227:	83 f8 01             	cmp    $0x1,%eax
c000422a:	0f 85 86 00 00 00    	jne    c00042b6 <do_rdwt+0x16d>
c0004230:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0004234:	75 09                	jne    c000423f <do_rdwt+0xf6>
c0004236:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c000423d:	eb 0d                	jmp    c000424c <do_rdwt+0x103>
c000423f:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004243:	75 07                	jne    c000424c <do_rdwt+0x103>
c0004245:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c000424c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000424f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004252:	89 50 78             	mov    %edx,0x78(%eax)
c0004255:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0004258:	8b 45 08             	mov    0x8(%ebp),%eax
c000425b:	89 50 68             	mov    %edx,0x68(%eax)
c000425e:	83 ec 04             	sub    $0x4,%esp
c0004261:	6a 04                	push   $0x4
c0004263:	ff 75 08             	pushl  0x8(%ebp)
c0004266:	6a 03                	push   $0x3
c0004268:	e8 cf 5d 00 00       	call   c000a03c <send_rec>
c000426d:	83 c4 10             	add    $0x10,%esp
c0004270:	8b 45 08             	mov    0x8(%ebp),%eax
c0004273:	8b 40 78             	mov    0x78(%eax),%eax
c0004276:	83 f8 66             	cmp    $0x66,%eax
c0004279:	75 13                	jne    c000428e <do_rdwt+0x145>
c000427b:	83 ec 04             	sub    $0x4,%esp
c000427e:	ff 75 b8             	pushl  -0x48(%ebp)
c0004281:	ff 75 08             	pushl  0x8(%ebp)
c0004284:	6a 01                	push   $0x1
c0004286:	e8 b1 5d 00 00       	call   c000a03c <send_rec>
c000428b:	83 c4 10             	add    $0x10,%esp
c000428e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004291:	8b 40 78             	mov    0x78(%eax),%eax
c0004294:	83 f8 65             	cmp    $0x65,%eax
c0004297:	75 13                	jne    c00042ac <do_rdwt+0x163>
c0004299:	83 ec 04             	sub    $0x4,%esp
c000429c:	ff 75 b8             	pushl  -0x48(%ebp)
c000429f:	ff 75 08             	pushl  0x8(%ebp)
c00042a2:	6a 01                	push   $0x1
c00042a4:	e8 93 5d 00 00       	call   c000a03c <send_rec>
c00042a9:	83 c4 10             	add    $0x10,%esp
c00042ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00042b1:	e9 1c 02 00 00       	jmp    c00044d2 <do_rdwt+0x389>
c00042b6:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00042ba:	75 18                	jne    c00042d4 <do_rdwt+0x18b>
c00042bc:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00042c2:	c1 e0 09             	shl    $0x9,%eax
c00042c5:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c00042c8:	75 0a                	jne    c00042d4 <do_rdwt+0x18b>
c00042ca:	b8 00 00 00 00       	mov    $0x0,%eax
c00042cf:	e9 fe 01 00 00       	jmp    c00044d2 <do_rdwt+0x389>
c00042d4:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00042d8:	75 14                	jne    c00042ee <do_rdwt+0x1a5>
c00042da:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00042dd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042e0:	01 d0                	add    %edx,%eax
c00042e2:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c00042e5:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c00042e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00042ec:	eb 19                	jmp    c0004307 <do_rdwt+0x1be>
c00042ee:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00042f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00042f4:	01 c2                	add    %eax,%edx
c00042f6:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00042fc:	c1 e0 09             	shl    $0x9,%eax
c00042ff:	39 c2                	cmp    %eax,%edx
c0004301:	0f 4e c2             	cmovle %edx,%eax
c0004304:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004307:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000430a:	99                   	cltd   
c000430b:	c1 ea 17             	shr    $0x17,%edx
c000430e:	01 d0                	add    %edx,%eax
c0004310:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004315:	29 d0                	sub    %edx,%eax
c0004317:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000431a:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0004320:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0004323:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004329:	85 c0                	test   %eax,%eax
c000432b:	0f 48 c1             	cmovs  %ecx,%eax
c000432e:	c1 f8 09             	sar    $0x9,%eax
c0004331:	01 d0                	add    %edx,%eax
c0004333:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004336:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000433c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000433f:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004345:	85 c0                	test   %eax,%eax
c0004347:	0f 48 c1             	cmovs  %ecx,%eax
c000434a:	c1 f8 09             	sar    $0x9,%eax
c000434d:	01 d0                	add    %edx,%eax
c000434f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004352:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004355:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004358:	ba 00 00 10 00       	mov    $0x100000,%edx
c000435d:	39 d0                	cmp    %edx,%eax
c000435f:	7d 0b                	jge    c000436c <do_rdwt+0x223>
c0004361:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004364:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004367:	83 c0 01             	add    $0x1,%eax
c000436a:	eb 05                	jmp    c0004371 <do_rdwt+0x228>
c000436c:	b8 00 00 10 00       	mov    $0x100000,%eax
c0004371:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004374:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004377:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000437a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004381:	8b 45 08             	mov    0x8(%ebp),%eax
c0004384:	8b 00                	mov    (%eax),%eax
c0004386:	83 ec 0c             	sub    $0xc,%esp
c0004389:	50                   	push   %eax
c000438a:	e8 2d 05 00 00       	call   c00048bc <pid2proc>
c000438f:	83 c4 10             	add    $0x10,%esp
c0004392:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004395:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004398:	83 ec 08             	sub    $0x8,%esp
c000439b:	50                   	push   %eax
c000439c:	ff 75 cc             	pushl  -0x34(%ebp)
c000439f:	e8 a8 2a 00 00       	call   c0006e4c <alloc_virtual_memory>
c00043a4:	83 c4 10             	add    $0x10,%esp
c00043a7:	89 45 98             	mov    %eax,-0x68(%ebp)
c00043aa:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00043ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00043b0:	e9 c5 00 00 00       	jmp    c000447a <do_rdwt+0x331>
c00043b5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00043b8:	c1 e0 09             	shl    $0x9,%eax
c00043bb:	2b 45 ec             	sub    -0x14(%ebp),%eax
c00043be:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00043c1:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c00043c5:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00043c8:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c00043cf:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00043d3:	75 46                	jne    c000441b <do_rdwt+0x2d2>
c00043d5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00043d8:	c1 e0 09             	shl    $0x9,%eax
c00043db:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00043e1:	83 ec 0c             	sub    $0xc,%esp
c00043e4:	6a 07                	push   $0x7
c00043e6:	50                   	push   %eax
c00043e7:	52                   	push   %edx
c00043e8:	ff 75 90             	pushl  -0x70(%ebp)
c00043eb:	ff 75 e0             	pushl  -0x20(%ebp)
c00043ee:	e8 09 e5 ff ff       	call   c00028fc <rd_wt>
c00043f3:	83 c4 20             	add    $0x20,%esp
c00043f6:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00043fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00043ff:	01 d0                	add    %edx,%eax
c0004401:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0004404:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0004407:	01 ca                	add    %ecx,%edx
c0004409:	83 ec 04             	sub    $0x4,%esp
c000440c:	ff 75 94             	pushl  -0x6c(%ebp)
c000440f:	50                   	push   %eax
c0004410:	52                   	push   %edx
c0004411:	e8 72 37 00 00       	call   c0007b88 <Memcpy>
c0004416:	83 c4 10             	add    $0x10,%esp
c0004419:	eb 46                	jmp    c0004461 <do_rdwt+0x318>
c000441b:	8b 55 98             	mov    -0x68(%ebp),%edx
c000441e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004421:	01 d0                	add    %edx,%eax
c0004423:	89 c1                	mov    %eax,%ecx
c0004425:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000442b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000442e:	01 d0                	add    %edx,%eax
c0004430:	83 ec 04             	sub    $0x4,%esp
c0004433:	ff 75 94             	pushl  -0x6c(%ebp)
c0004436:	51                   	push   %ecx
c0004437:	50                   	push   %eax
c0004438:	e8 4b 37 00 00       	call   c0007b88 <Memcpy>
c000443d:	83 c4 10             	add    $0x10,%esp
c0004440:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004443:	c1 e0 09             	shl    $0x9,%eax
c0004446:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c000444c:	83 ec 0c             	sub    $0xc,%esp
c000444f:	6a 0a                	push   $0xa
c0004451:	50                   	push   %eax
c0004452:	52                   	push   %edx
c0004453:	ff 75 90             	pushl  -0x70(%ebp)
c0004456:	ff 75 e0             	pushl  -0x20(%ebp)
c0004459:	e8 9e e4 ff ff       	call   c00028fc <rd_wt>
c000445e:	83 c4 20             	add    $0x20,%esp
c0004461:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004464:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0004467:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000446a:	01 45 e4             	add    %eax,-0x1c(%ebp)
c000446d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0004474:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004477:	01 45 e0             	add    %eax,-0x20(%ebp)
c000447a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000447d:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c0004480:	7f 0a                	jg     c000448c <do_rdwt+0x343>
c0004482:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004486:	0f 85 29 ff ff ff    	jne    c00043b5 <do_rdwt+0x26c>
c000448c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000448f:	8b 50 04             	mov    0x4(%eax),%edx
c0004492:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004495:	01 c2                	add    %eax,%edx
c0004497:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000449a:	89 50 04             	mov    %edx,0x4(%eax)
c000449d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00044a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00044a3:	01 c2                	add    %eax,%edx
c00044a5:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00044ab:	39 c2                	cmp    %eax,%edx
c00044ad:	7e 20                	jle    c00044cf <do_rdwt+0x386>
c00044af:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00044b2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00044b5:	01 d0                	add    %edx,%eax
c00044b7:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00044bd:	83 ec 0c             	sub    $0xc,%esp
c00044c0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00044c6:	50                   	push   %eax
c00044c7:	e8 08 00 00 00       	call   c00044d4 <sync_inode>
c00044cc:	83 c4 10             	add    $0x10,%esp
c00044cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00044d2:	c9                   	leave  
c00044d3:	c3                   	ret    

c00044d4 <sync_inode>:
c00044d4:	55                   	push   %ebp
c00044d5:	89 e5                	mov    %esp,%ebp
c00044d7:	53                   	push   %ebx
c00044d8:	83 ec 34             	sub    $0x34,%esp
c00044db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00044e2:	eb 74                	jmp    c0004558 <sync_inode+0x84>
c00044e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00044e7:	89 d0                	mov    %edx,%eax
c00044e9:	c1 e0 02             	shl    $0x2,%eax
c00044ec:	01 d0                	add    %edx,%eax
c00044ee:	c1 e0 03             	shl    $0x3,%eax
c00044f1:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c00044f6:	8b 10                	mov    (%eax),%edx
c00044f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00044fb:	8b 40 10             	mov    0x10(%eax),%eax
c00044fe:	39 c2                	cmp    %eax,%edx
c0004500:	75 52                	jne    c0004554 <sync_inode+0x80>
c0004502:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004505:	89 d0                	mov    %edx,%eax
c0004507:	c1 e0 02             	shl    $0x2,%eax
c000450a:	01 d0                	add    %edx,%eax
c000450c:	c1 e0 03             	shl    $0x3,%eax
c000450f:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c0004515:	8b 45 08             	mov    0x8(%ebp),%eax
c0004518:	8b 08                	mov    (%eax),%ecx
c000451a:	89 0a                	mov    %ecx,(%edx)
c000451c:	8b 48 04             	mov    0x4(%eax),%ecx
c000451f:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004522:	8b 48 08             	mov    0x8(%eax),%ecx
c0004525:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004528:	8b 48 0c             	mov    0xc(%eax),%ecx
c000452b:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000452e:	8b 48 10             	mov    0x10(%eax),%ecx
c0004531:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004534:	8b 48 14             	mov    0x14(%eax),%ecx
c0004537:	89 4a 14             	mov    %ecx,0x14(%edx)
c000453a:	8b 48 18             	mov    0x18(%eax),%ecx
c000453d:	89 4a 18             	mov    %ecx,0x18(%edx)
c0004540:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0004543:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004546:	8b 48 20             	mov    0x20(%eax),%ecx
c0004549:	89 4a 20             	mov    %ecx,0x20(%edx)
c000454c:	8b 40 24             	mov    0x24(%eax),%eax
c000454f:	89 42 24             	mov    %eax,0x24(%edx)
c0004552:	eb 0a                	jmp    c000455e <sync_inode+0x8a>
c0004554:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004558:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c000455c:	7e 86                	jle    c00044e4 <sync_inode+0x10>
c000455e:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0004565:	8b 45 08             	mov    0x8(%ebp),%eax
c0004568:	8b 40 10             	mov    0x10(%eax),%eax
c000456b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000456e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004571:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004574:	b8 00 02 00 00       	mov    $0x200,%eax
c0004579:	99                   	cltd   
c000457a:	f7 7d f0             	idivl  -0x10(%ebp)
c000457d:	89 c3                	mov    %eax,%ebx
c000457f:	89 c8                	mov    %ecx,%eax
c0004581:	99                   	cltd   
c0004582:	f7 fb                	idiv   %ebx
c0004584:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004587:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000458a:	8d 48 ff             	lea    -0x1(%eax),%ecx
c000458d:	b8 00 02 00 00       	mov    $0x200,%eax
c0004592:	99                   	cltd   
c0004593:	f7 7d f0             	idivl  -0x10(%ebp)
c0004596:	89 c3                	mov    %eax,%ebx
c0004598:	89 c8                	mov    %ecx,%eax
c000459a:	99                   	cltd   
c000459b:	f7 fb                	idiv   %ebx
c000459d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00045a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00045a3:	8b 40 20             	mov    0x20(%eax),%eax
c00045a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00045a9:	e8 0a 01 00 00       	call   c00046b8 <get_super_block>
c00045ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00045b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00045b4:	8b 40 04             	mov    0x4(%eax),%eax
c00045b7:	8d 50 02             	lea    0x2(%eax),%edx
c00045ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00045bd:	8b 40 08             	mov    0x8(%eax),%eax
c00045c0:	01 c2                	add    %eax,%edx
c00045c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00045c5:	01 d0                	add    %edx,%eax
c00045c7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00045ca:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00045cf:	83 ec 0c             	sub    $0xc,%esp
c00045d2:	6a 07                	push   $0x7
c00045d4:	68 00 02 00 00       	push   $0x200
c00045d9:	50                   	push   %eax
c00045da:	ff 75 e0             	pushl  -0x20(%ebp)
c00045dd:	ff 75 d8             	pushl  -0x28(%ebp)
c00045e0:	e8 17 e3 ff ff       	call   c00028fc <rd_wt>
c00045e5:	83 c4 20             	add    $0x20,%esp
c00045e8:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00045ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00045f0:	83 ec 04             	sub    $0x4,%esp
c00045f3:	ff 75 f0             	pushl  -0x10(%ebp)
c00045f6:	ff 75 08             	pushl  0x8(%ebp)
c00045f9:	ff 75 d4             	pushl  -0x2c(%ebp)
c00045fc:	e8 87 35 00 00       	call   c0007b88 <Memcpy>
c0004601:	83 c4 10             	add    $0x10,%esp
c0004604:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004609:	83 ec 0c             	sub    $0xc,%esp
c000460c:	6a 0a                	push   $0xa
c000460e:	68 00 02 00 00       	push   $0x200
c0004613:	50                   	push   %eax
c0004614:	ff 75 e0             	pushl  -0x20(%ebp)
c0004617:	ff 75 d8             	pushl  -0x28(%ebp)
c000461a:	e8 dd e2 ff ff       	call   c00028fc <rd_wt>
c000461f:	83 c4 20             	add    $0x20,%esp
c0004622:	90                   	nop
c0004623:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004626:	c9                   	leave  
c0004627:	c3                   	ret    

c0004628 <put_inode>:
c0004628:	55                   	push   %ebp
c0004629:	89 e5                	mov    %esp,%ebp
c000462b:	83 ec 08             	sub    $0x8,%esp
c000462e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004631:	8b 40 24             	mov    0x24(%eax),%eax
c0004634:	85 c0                	test   %eax,%eax
c0004636:	7f 1c                	jg     c0004654 <put_inode+0x2c>
c0004638:	68 4c 05 00 00       	push   $0x54c
c000463d:	68 04 b2 00 c0       	push   $0xc000b204
c0004642:	68 04 b2 00 c0       	push   $0xc000b204
c0004647:	68 dc b3 00 c0       	push   $0xc000b3dc
c000464c:	e8 ae 50 00 00       	call   c00096ff <assertion_failure>
c0004651:	83 c4 10             	add    $0x10,%esp
c0004654:	8b 45 08             	mov    0x8(%ebp),%eax
c0004657:	8b 40 24             	mov    0x24(%eax),%eax
c000465a:	8d 50 ff             	lea    -0x1(%eax),%edx
c000465d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004660:	89 50 24             	mov    %edx,0x24(%eax)
c0004663:	90                   	nop
c0004664:	c9                   	leave  
c0004665:	c3                   	ret    

c0004666 <do_close>:
c0004666:	55                   	push   %ebp
c0004667:	89 e5                	mov    %esp,%ebp
c0004669:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000466e:	8b 55 08             	mov    0x8(%ebp),%edx
c0004671:	83 c2 50             	add    $0x50,%edx
c0004674:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004678:	8b 50 0c             	mov    0xc(%eax),%edx
c000467b:	83 ea 01             	sub    $0x1,%edx
c000467e:	89 50 0c             	mov    %edx,0xc(%eax)
c0004681:	8b 40 0c             	mov    0xc(%eax),%eax
c0004684:	85 c0                	test   %eax,%eax
c0004686:	75 16                	jne    c000469e <do_close+0x38>
c0004688:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000468d:	8b 55 08             	mov    0x8(%ebp),%edx
c0004690:	83 c2 50             	add    $0x50,%edx
c0004693:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004697:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000469e:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c00046a3:	8b 55 08             	mov    0x8(%ebp),%edx
c00046a6:	83 c2 50             	add    $0x50,%edx
c00046a9:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c00046b0:	00 
c00046b1:	b8 00 00 00 00       	mov    $0x0,%eax
c00046b6:	5d                   	pop    %ebp
c00046b7:	c3                   	ret    

c00046b8 <get_super_block>:
c00046b8:	55                   	push   %ebp
c00046b9:	89 e5                	mov    %esp,%ebp
c00046bb:	83 ec 08             	sub    $0x8,%esp
c00046be:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00046c3:	83 ec 0c             	sub    $0xc,%esp
c00046c6:	6a 07                	push   $0x7
c00046c8:	68 00 02 00 00       	push   $0x200
c00046cd:	50                   	push   %eax
c00046ce:	6a 20                	push   $0x20
c00046d0:	6a 01                	push   $0x1
c00046d2:	e8 25 e2 ff ff       	call   c00028fc <rd_wt>
c00046d7:	83 c4 20             	add    $0x20,%esp
c00046da:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00046e0:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00046e5:	8b 0a                	mov    (%edx),%ecx
c00046e7:	89 08                	mov    %ecx,(%eax)
c00046e9:	8b 4a 04             	mov    0x4(%edx),%ecx
c00046ec:	89 48 04             	mov    %ecx,0x4(%eax)
c00046ef:	8b 4a 08             	mov    0x8(%edx),%ecx
c00046f2:	89 48 08             	mov    %ecx,0x8(%eax)
c00046f5:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00046f8:	89 48 0c             	mov    %ecx,0xc(%eax)
c00046fb:	8b 4a 10             	mov    0x10(%edx),%ecx
c00046fe:	89 48 10             	mov    %ecx,0x10(%eax)
c0004701:	8b 4a 14             	mov    0x14(%edx),%ecx
c0004704:	89 48 14             	mov    %ecx,0x14(%eax)
c0004707:	8b 4a 18             	mov    0x18(%edx),%ecx
c000470a:	89 48 18             	mov    %ecx,0x18(%eax)
c000470d:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0004710:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004713:	8b 52 20             	mov    0x20(%edx),%edx
c0004716:	89 50 20             	mov    %edx,0x20(%eax)
c0004719:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c000471e:	c9                   	leave  
c000471f:	c3                   	ret    

c0004720 <check>:
c0004720:	55                   	push   %ebp
c0004721:	89 e5                	mov    %esp,%ebp
c0004723:	83 ec 10             	sub    $0x10,%esp
c0004726:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000472d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004734:	eb 08                	jmp    c000473e <check+0x1e>
c0004736:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000473a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000473e:	83 7d f8 03          	cmpl   $0x3,-0x8(%ebp)
c0004742:	7e f2                	jle    c0004736 <check+0x16>
c0004744:	90                   	nop
c0004745:	c9                   	leave  
c0004746:	c3                   	ret    

c0004747 <schedule_process>:
c0004747:	55                   	push   %ebp
c0004748:	89 e5                	mov    %esp,%ebp
c000474a:	83 ec 18             	sub    $0x18,%esp
c000474d:	c7 45 f4 00 00 10 00 	movl   $0x100000,-0xc(%ebp)
c0004754:	e8 3e ce ff ff       	call   c0001597 <get_running_thread_pcb>
c0004759:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000475c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000475f:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004766:	84 c0                	test   %al,%al
c0004768:	75 30                	jne    c000479a <schedule_process+0x53>
c000476a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000476d:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c0004774:	00 00 00 
c0004777:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000477a:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004781:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004784:	05 00 01 00 00       	add    $0x100,%eax
c0004789:	83 ec 08             	sub    $0x8,%esp
c000478c:	50                   	push   %eax
c000478d:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004792:	e8 60 65 00 00       	call   c000acf7 <insertToDoubleLinkList>
c0004797:	83 c4 10             	add    $0x10,%esp
c000479a:	83 ec 0c             	sub    $0xc,%esp
c000479d:	68 ec 0d 01 c0       	push   $0xc0010dec
c00047a2:	e8 6c 63 00 00       	call   c000ab13 <isListEmpty>
c00047a7:	83 c4 10             	add    $0x10,%esp
c00047aa:	84 c0                	test   %al,%al
c00047ac:	74 19                	je     c00047c7 <schedule_process+0x80>
c00047ae:	6a 28                	push   $0x28
c00047b0:	68 eb b3 00 c0       	push   $0xc000b3eb
c00047b5:	68 eb b3 00 c0       	push   $0xc000b3eb
c00047ba:	68 f5 b3 00 c0       	push   $0xc000b3f5
c00047bf:	e8 3b 4f 00 00       	call   c00096ff <assertion_failure>
c00047c4:	83 c4 10             	add    $0x10,%esp
c00047c7:	83 ec 0c             	sub    $0xc,%esp
c00047ca:	68 ec 0d 01 c0       	push   $0xc0010dec
c00047cf:	e8 a6 65 00 00       	call   c000ad7a <popFromDoubleLinkList>
c00047d4:	83 c4 10             	add    $0x10,%esp
c00047d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00047da:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00047dd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00047e2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00047e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00047e8:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00047ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00047f2:	8b 40 08             	mov    0x8(%eax),%eax
c00047f5:	85 c0                	test   %eax,%eax
c00047f7:	74 28                	je     c0004821 <schedule_process+0xda>
c00047f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00047fc:	05 00 10 00 00       	add    $0x1000,%eax
c0004801:	83 ec 0c             	sub    $0xc,%esp
c0004804:	50                   	push   %eax
c0004805:	e8 7e cd ff ff       	call   c0001588 <update_tss>
c000480a:	83 c4 10             	add    $0x10,%esp
c000480d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004810:	8b 40 08             	mov    0x8(%eax),%eax
c0004813:	83 ec 0c             	sub    $0xc,%esp
c0004816:	50                   	push   %eax
c0004817:	e8 5f cd ff ff       	call   c000157b <update_cr3>
c000481c:	83 c4 10             	add    $0x10,%esp
c000481f:	eb 0f                	jmp    c0004830 <schedule_process+0xe9>
c0004821:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004824:	83 ec 0c             	sub    $0xc,%esp
c0004827:	50                   	push   %eax
c0004828:	e8 4e cd ff ff       	call   c000157b <update_cr3>
c000482d:	83 c4 10             	add    $0x10,%esp
c0004830:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004833:	a3 c0 0b 01 c0       	mov    %eax,0xc0010bc0
c0004838:	83 ec 08             	sub    $0x8,%esp
c000483b:	ff 75 e8             	pushl  -0x18(%ebp)
c000483e:	ff 75 f0             	pushl  -0x10(%ebp)
c0004841:	e8 8a 62 00 00       	call   c000aad0 <switch_to>
c0004846:	83 c4 10             	add    $0x10,%esp
c0004849:	90                   	nop
c000484a:	c9                   	leave  
c000484b:	c3                   	ret    

c000484c <clock_handler>:
c000484c:	55                   	push   %ebp
c000484d:	89 e5                	mov    %esp,%ebp
c000484f:	83 ec 18             	sub    $0x18,%esp
c0004852:	e8 40 cd ff ff       	call   c0001597 <get_running_thread_pcb>
c0004857:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000485a:	a1 c0 16 01 c0       	mov    0xc00116c0,%eax
c000485f:	85 c0                	test   %eax,%eax
c0004861:	74 0d                	je     c0004870 <clock_handler+0x24>
c0004863:	83 ec 0c             	sub    $0xc,%esp
c0004866:	6a 04                	push   $0x4
c0004868:	e8 6a 5a 00 00       	call   c000a2d7 <inform_int>
c000486d:	83 c4 10             	add    $0x10,%esp
c0004870:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004873:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004879:	83 f8 05             	cmp    $0x5,%eax
c000487c:	75 13                	jne    c0004891 <clock_handler+0x45>
c000487e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004881:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004887:	83 f8 01             	cmp    $0x1,%eax
c000488a:	75 05                	jne    c0004891 <clock_handler+0x45>
c000488c:	e8 8f fe ff ff       	call   c0004720 <check>
c0004891:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004894:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c000489a:	85 c0                	test   %eax,%eax
c000489c:	74 16                	je     c00048b4 <clock_handler+0x68>
c000489e:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c00048a3:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c00048a9:	83 ea 01             	sub    $0x1,%edx
c00048ac:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c00048b2:	eb 05                	jmp    c00048b9 <clock_handler+0x6d>
c00048b4:	e8 8e fe ff ff       	call   c0004747 <schedule_process>
c00048b9:	90                   	nop
c00048ba:	c9                   	leave  
c00048bb:	c3                   	ret    

c00048bc <pid2proc>:
c00048bc:	55                   	push   %ebp
c00048bd:	89 e5                	mov    %esp,%ebp
c00048bf:	83 ec 20             	sub    $0x20,%esp
c00048c2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00048c9:	a1 04 1f 01 c0       	mov    0xc0011f04,%eax
c00048ce:	8b 15 08 1f 01 c0    	mov    0xc0011f08,%edx
c00048d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00048d7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00048da:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c00048df:	8b 15 10 1f 01 c0    	mov    0xc0011f10,%edx
c00048e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00048e8:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00048eb:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c00048f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00048f3:	eb 29                	jmp    c000491e <pid2proc+0x62>
c00048f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00048f8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00048fd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004900:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004903:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004909:	8b 45 08             	mov    0x8(%ebp),%eax
c000490c:	39 c2                	cmp    %eax,%edx
c000490e:	75 05                	jne    c0004915 <pid2proc+0x59>
c0004910:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004913:	eb 17                	jmp    c000492c <pid2proc+0x70>
c0004915:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004918:	8b 40 04             	mov    0x4(%eax),%eax
c000491b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000491e:	81 7d fc 0c 1f 01 c0 	cmpl   $0xc0011f0c,-0x4(%ebp)
c0004925:	75 ce                	jne    c00048f5 <pid2proc+0x39>
c0004927:	b8 00 00 00 00       	mov    $0x0,%eax
c000492c:	c9                   	leave  
c000492d:	c3                   	ret    

c000492e <proc2pid>:
c000492e:	55                   	push   %ebp
c000492f:	89 e5                	mov    %esp,%ebp
c0004931:	83 ec 10             	sub    $0x10,%esp
c0004934:	8b 45 08             	mov    0x8(%ebp),%eax
c0004937:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000493d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004940:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004943:	c9                   	leave  
c0004944:	c3                   	ret    

c0004945 <InitDescriptor>:
c0004945:	55                   	push   %ebp
c0004946:	89 e5                	mov    %esp,%ebp
c0004948:	83 ec 04             	sub    $0x4,%esp
c000494b:	8b 45 14             	mov    0x14(%ebp),%eax
c000494e:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004952:	8b 45 10             	mov    0x10(%ebp),%eax
c0004955:	89 c2                	mov    %eax,%edx
c0004957:	8b 45 08             	mov    0x8(%ebp),%eax
c000495a:	66 89 10             	mov    %dx,(%eax)
c000495d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004960:	89 c2                	mov    %eax,%edx
c0004962:	8b 45 08             	mov    0x8(%ebp),%eax
c0004965:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004969:	8b 45 0c             	mov    0xc(%ebp),%eax
c000496c:	c1 e8 10             	shr    $0x10,%eax
c000496f:	89 c2                	mov    %eax,%edx
c0004971:	8b 45 08             	mov    0x8(%ebp),%eax
c0004974:	88 50 04             	mov    %dl,0x4(%eax)
c0004977:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c000497b:	89 c2                	mov    %eax,%edx
c000497d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004980:	88 50 05             	mov    %dl,0x5(%eax)
c0004983:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004987:	66 c1 e8 08          	shr    $0x8,%ax
c000498b:	c1 e0 04             	shl    $0x4,%eax
c000498e:	89 c2                	mov    %eax,%edx
c0004990:	8b 45 10             	mov    0x10(%ebp),%eax
c0004993:	c1 e8 10             	shr    $0x10,%eax
c0004996:	83 e0 0f             	and    $0xf,%eax
c0004999:	09 c2                	or     %eax,%edx
c000499b:	8b 45 08             	mov    0x8(%ebp),%eax
c000499e:	88 50 06             	mov    %dl,0x6(%eax)
c00049a1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00049a4:	c1 e8 18             	shr    $0x18,%eax
c00049a7:	89 c2                	mov    %eax,%edx
c00049a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00049ac:	88 50 07             	mov    %dl,0x7(%eax)
c00049af:	90                   	nop
c00049b0:	c9                   	leave  
c00049b1:	c3                   	ret    

c00049b2 <Seg2PhyAddr>:
c00049b2:	55                   	push   %ebp
c00049b3:	89 e5                	mov    %esp,%ebp
c00049b5:	83 ec 10             	sub    $0x10,%esp
c00049b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00049bb:	c1 e8 03             	shr    $0x3,%eax
c00049be:	8b 14 c5 c4 07 01 c0 	mov    -0x3ffef83c(,%eax,8),%edx
c00049c5:	8b 04 c5 c0 07 01 c0 	mov    -0x3ffef840(,%eax,8),%eax
c00049cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00049cf:	89 55 f8             	mov    %edx,-0x8(%ebp)
c00049d2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c00049d6:	0f b7 c0             	movzwl %ax,%eax
c00049d9:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c00049dd:	0f b6 d2             	movzbl %dl,%edx
c00049e0:	c1 e2 10             	shl    $0x10,%edx
c00049e3:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c00049e9:	09 d0                	or     %edx,%eax
c00049eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00049ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049f1:	c9                   	leave  
c00049f2:	c3                   	ret    

c00049f3 <Seg2PhyAddrLDT>:
c00049f3:	55                   	push   %ebp
c00049f4:	89 e5                	mov    %esp,%ebp
c00049f6:	83 ec 10             	sub    $0x10,%esp
c00049f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00049fc:	c1 e8 03             	shr    $0x3,%eax
c00049ff:	89 c2                	mov    %eax,%edx
c0004a01:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a04:	83 c2 22             	add    $0x22,%edx
c0004a07:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0004a0b:	8b 02                	mov    (%edx),%eax
c0004a0d:	8b 52 04             	mov    0x4(%edx),%edx
c0004a10:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a13:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004a16:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004a1a:	0f b7 c0             	movzwl %ax,%eax
c0004a1d:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004a21:	0f b6 d2             	movzbl %dl,%edx
c0004a24:	c1 e2 10             	shl    $0x10,%edx
c0004a27:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004a2d:	09 d0                	or     %edx,%eax
c0004a2f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a32:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a35:	c9                   	leave  
c0004a36:	c3                   	ret    

c0004a37 <VirAddr2PhyAddr>:
c0004a37:	55                   	push   %ebp
c0004a38:	89 e5                	mov    %esp,%ebp
c0004a3a:	83 ec 10             	sub    $0x10,%esp
c0004a3d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004a40:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a43:	01 d0                	add    %edx,%eax
c0004a45:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a48:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a4b:	c9                   	leave  
c0004a4c:	c3                   	ret    

c0004a4d <v2l>:
c0004a4d:	55                   	push   %ebp
c0004a4e:	89 e5                	mov    %esp,%ebp
c0004a50:	83 ec 18             	sub    $0x18,%esp
c0004a53:	83 ec 0c             	sub    $0xc,%esp
c0004a56:	ff 75 08             	pushl  0x8(%ebp)
c0004a59:	e8 5e fe ff ff       	call   c00048bc <pid2proc>
c0004a5e:	83 c4 10             	add    $0x10,%esp
c0004a61:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a64:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004a6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a6e:	83 ec 08             	sub    $0x8,%esp
c0004a71:	ff 75 f4             	pushl  -0xc(%ebp)
c0004a74:	50                   	push   %eax
c0004a75:	e8 79 ff ff ff       	call   c00049f3 <Seg2PhyAddrLDT>
c0004a7a:	83 c4 10             	add    $0x10,%esp
c0004a7d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004a80:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004a83:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a86:	01 d0                	add    %edx,%eax
c0004a88:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004a8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004a8e:	c9                   	leave  
c0004a8f:	c3                   	ret    

c0004a90 <init_propt>:
c0004a90:	55                   	push   %ebp
c0004a91:	89 e5                	mov    %esp,%ebp
c0004a93:	83 ec 38             	sub    $0x38,%esp
c0004a96:	6a 0e                	push   $0xe
c0004a98:	6a 08                	push   $0x8
c0004a9a:	68 71 13 00 c0       	push   $0xc0001371
c0004a9f:	6a 20                	push   $0x20
c0004aa1:	e8 58 01 00 00       	call   c0004bfe <InitInterruptDesc>
c0004aa6:	83 c4 10             	add    $0x10,%esp
c0004aa9:	6a 0e                	push   $0xe
c0004aab:	6a 08                	push   $0x8
c0004aad:	68 9e 13 00 c0       	push   $0xc000139e
c0004ab2:	6a 21                	push   $0x21
c0004ab4:	e8 45 01 00 00       	call   c0004bfe <InitInterruptDesc>
c0004ab9:	83 c4 10             	add    $0x10,%esp
c0004abc:	6a 0e                	push   $0xe
c0004abe:	6a 08                	push   $0x8
c0004ac0:	68 e0 13 00 c0       	push   $0xc00013e0
c0004ac5:	6a 2e                	push   $0x2e
c0004ac7:	e8 32 01 00 00       	call   c0004bfe <InitInterruptDesc>
c0004acc:	83 c4 10             	add    $0x10,%esp
c0004acf:	83 ec 04             	sub    $0x4,%esp
c0004ad2:	68 a0 15 00 00       	push   $0x15a0
c0004ad7:	6a 00                	push   $0x0
c0004ad9:	68 00 32 08 c0       	push   $0xc0083200
c0004ade:	e8 14 73 00 00       	call   c000bdf7 <Memset>
c0004ae3:	83 c4 10             	add    $0x10,%esp
c0004ae6:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004aed:	83 ec 04             	sub    $0x4,%esp
c0004af0:	ff 75 f4             	pushl  -0xc(%ebp)
c0004af3:	6a 00                	push   $0x0
c0004af5:	68 40 16 01 c0       	push   $0xc0011640
c0004afa:	e8 f8 72 00 00       	call   c000bdf7 <Memset>
c0004aff:	83 c4 10             	add    $0x10,%esp
c0004b02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b05:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c0004b0a:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c0004b11:	00 00 00 
c0004b14:	83 ec 0c             	sub    $0xc,%esp
c0004b17:	6a 30                	push   $0x30
c0004b19:	e8 94 fe ff ff       	call   c00049b2 <Seg2PhyAddr>
c0004b1e:	83 c4 10             	add    $0x10,%esp
c0004b21:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004b24:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c0004b2b:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004b32:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b35:	0f b7 d0             	movzwl %ax,%edx
c0004b38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b3b:	83 e8 01             	sub    $0x1,%eax
c0004b3e:	89 c1                	mov    %eax,%ecx
c0004b40:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004b43:	52                   	push   %edx
c0004b44:	51                   	push   %ecx
c0004b45:	50                   	push   %eax
c0004b46:	68 00 08 01 c0       	push   $0xc0010800
c0004b4b:	e8 f5 fd ff ff       	call   c0004945 <InitDescriptor>
c0004b50:	83 c4 10             	add    $0x10,%esp
c0004b53:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004b5a:	68 f2 00 00 00       	push   $0xf2
c0004b5f:	68 ff ff 00 00       	push   $0xffff
c0004b64:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004b67:	68 f8 07 01 c0       	push   $0xc00107f8
c0004b6c:	e8 d4 fd ff ff       	call   c0004945 <InitDescriptor>
c0004b71:	83 c4 10             	add    $0x10,%esp
c0004b74:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004b7b:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004b82:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004b89:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004b8c:	0f b7 c0             	movzwl %ax,%eax
c0004b8f:	50                   	push   %eax
c0004b90:	ff 75 d8             	pushl  -0x28(%ebp)
c0004b93:	6a 00                	push   $0x0
c0004b95:	68 08 08 01 c0       	push   $0xc0010808
c0004b9a:	e8 a6 fd ff ff       	call   c0004945 <InitDescriptor>
c0004b9f:	83 c4 10             	add    $0x10,%esp
c0004ba2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004ba5:	0f b7 c0             	movzwl %ax,%eax
c0004ba8:	50                   	push   %eax
c0004ba9:	ff 75 d8             	pushl  -0x28(%ebp)
c0004bac:	6a 00                	push   $0x0
c0004bae:	68 10 08 01 c0       	push   $0xc0010810
c0004bb3:	e8 8d fd ff ff       	call   c0004945 <InitDescriptor>
c0004bb8:	83 c4 10             	add    $0x10,%esp
c0004bbb:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0004bc2:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0004bc9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004bcc:	0f b7 c0             	movzwl %ax,%eax
c0004bcf:	50                   	push   %eax
c0004bd0:	ff 75 d8             	pushl  -0x28(%ebp)
c0004bd3:	6a 00                	push   $0x0
c0004bd5:	68 18 08 01 c0       	push   $0xc0010818
c0004bda:	e8 66 fd ff ff       	call   c0004945 <InitDescriptor>
c0004bdf:	83 c4 10             	add    $0x10,%esp
c0004be2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004be5:	0f b7 c0             	movzwl %ax,%eax
c0004be8:	50                   	push   %eax
c0004be9:	ff 75 d8             	pushl  -0x28(%ebp)
c0004bec:	6a 00                	push   $0x0
c0004bee:	68 20 08 01 c0       	push   $0xc0010820
c0004bf3:	e8 4d fd ff ff       	call   c0004945 <InitDescriptor>
c0004bf8:	83 c4 10             	add    $0x10,%esp
c0004bfb:	90                   	nop
c0004bfc:	c9                   	leave  
c0004bfd:	c3                   	ret    

c0004bfe <InitInterruptDesc>:
c0004bfe:	55                   	push   %ebp
c0004bff:	89 e5                	mov    %esp,%ebp
c0004c01:	83 ec 10             	sub    $0x10,%esp
c0004c04:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c07:	c1 e0 03             	shl    $0x3,%eax
c0004c0a:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c0004c0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004c12:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c15:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004c19:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c1c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004c1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004c22:	89 c2                	mov    %eax,%edx
c0004c24:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c27:	66 89 10             	mov    %dx,(%eax)
c0004c2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c2d:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004c33:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004c36:	c1 f8 10             	sar    $0x10,%eax
c0004c39:	89 c2                	mov    %eax,%edx
c0004c3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c3e:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004c42:	8b 45 10             	mov    0x10(%ebp),%eax
c0004c45:	c1 e0 04             	shl    $0x4,%eax
c0004c48:	89 c2                	mov    %eax,%edx
c0004c4a:	8b 45 14             	mov    0x14(%ebp),%eax
c0004c4d:	09 d0                	or     %edx,%eax
c0004c4f:	89 c2                	mov    %eax,%edx
c0004c51:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c54:	88 50 05             	mov    %dl,0x5(%eax)
c0004c57:	90                   	nop
c0004c58:	c9                   	leave  
c0004c59:	c3                   	ret    

c0004c5a <ReloadGDT>:
c0004c5a:	55                   	push   %ebp
c0004c5b:	89 e5                	mov    %esp,%ebp
c0004c5d:	83 ec 28             	sub    $0x28,%esp
c0004c60:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c0004c65:	0f b7 00             	movzwl (%eax),%eax
c0004c68:	98                   	cwtl   
c0004c69:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c0004c6e:	8b 12                	mov    (%edx),%edx
c0004c70:	83 ec 04             	sub    $0x4,%esp
c0004c73:	50                   	push   %eax
c0004c74:	52                   	push   %edx
c0004c75:	68 c0 07 01 c0       	push   $0xc00107c0
c0004c7a:	e8 4a 71 00 00       	call   c000bdc9 <Memcpy2>
c0004c7f:	83 c4 10             	add    $0x10,%esp
c0004c82:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c0004c89:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c0004c90:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004c93:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004c98:	ba c0 07 01 c0       	mov    $0xc00107c0,%edx
c0004c9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004ca0:	89 10                	mov    %edx,(%eax)
c0004ca2:	c7 45 e8 88 07 01 c0 	movl   $0xc0010788,-0x18(%ebp)
c0004ca9:	c7 45 e4 8a 07 01 c0 	movl   $0xc001078a,-0x1c(%ebp)
c0004cb0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004cb3:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004cb8:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c0004cbd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004cc0:	89 10                	mov    %edx,(%eax)
c0004cc2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004cc9:	eb 04                	jmp    c0004ccf <ReloadGDT+0x75>
c0004ccb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004ccf:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004cd6:	7e f3                	jle    c0004ccb <ReloadGDT+0x71>
c0004cd8:	e8 e1 35 00 00       	call   c00082be <init_internal_interrupt>
c0004cdd:	e8 ae fd ff ff       	call   c0004a90 <init_propt>
c0004ce2:	90                   	nop
c0004ce3:	c9                   	leave  
c0004ce4:	c3                   	ret    

c0004ce5 <select_console>:
c0004ce5:	55                   	push   %ebp
c0004ce6:	89 e5                	mov    %esp,%ebp
c0004ce8:	83 ec 18             	sub    $0x18,%esp
c0004ceb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cee:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004cf1:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0004cf5:	75 27                	jne    c0004d1e <select_console+0x39>
c0004cf7:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004cfb:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004d01:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0004d06:	a3 80 07 01 c0       	mov    %eax,0xc0010780
c0004d0b:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0004d10:	83 ec 0c             	sub    $0xc,%esp
c0004d13:	50                   	push   %eax
c0004d14:	e8 08 00 00 00       	call   c0004d21 <flush>
c0004d19:	83 c4 10             	add    $0x10,%esp
c0004d1c:	eb 01                	jmp    c0004d1f <select_console+0x3a>
c0004d1e:	90                   	nop
c0004d1f:	c9                   	leave  
c0004d20:	c3                   	ret    

c0004d21 <flush>:
c0004d21:	55                   	push   %ebp
c0004d22:	89 e5                	mov    %esp,%ebp
c0004d24:	83 ec 08             	sub    $0x8,%esp
c0004d27:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d2a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d30:	8b 40 0c             	mov    0xc(%eax),%eax
c0004d33:	83 ec 0c             	sub    $0xc,%esp
c0004d36:	50                   	push   %eax
c0004d37:	e8 1e 00 00 00       	call   c0004d5a <set_cursor>
c0004d3c:	83 c4 10             	add    $0x10,%esp
c0004d3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d42:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004d48:	8b 40 08             	mov    0x8(%eax),%eax
c0004d4b:	83 ec 0c             	sub    $0xc,%esp
c0004d4e:	50                   	push   %eax
c0004d4f:	e8 64 00 00 00       	call   c0004db8 <set_console_start_video_addr>
c0004d54:	83 c4 10             	add    $0x10,%esp
c0004d57:	90                   	nop
c0004d58:	c9                   	leave  
c0004d59:	c3                   	ret    

c0004d5a <set_cursor>:
c0004d5a:	55                   	push   %ebp
c0004d5b:	89 e5                	mov    %esp,%ebp
c0004d5d:	83 ec 08             	sub    $0x8,%esp
c0004d60:	83 ec 08             	sub    $0x8,%esp
c0004d63:	6a 0e                	push   $0xe
c0004d65:	68 d4 03 00 00       	push   $0x3d4
c0004d6a:	e8 2a c7 ff ff       	call   c0001499 <out_byte>
c0004d6f:	83 c4 10             	add    $0x10,%esp
c0004d72:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d75:	c1 e8 08             	shr    $0x8,%eax
c0004d78:	0f b7 c0             	movzwl %ax,%eax
c0004d7b:	83 ec 08             	sub    $0x8,%esp
c0004d7e:	50                   	push   %eax
c0004d7f:	68 d5 03 00 00       	push   $0x3d5
c0004d84:	e8 10 c7 ff ff       	call   c0001499 <out_byte>
c0004d89:	83 c4 10             	add    $0x10,%esp
c0004d8c:	83 ec 08             	sub    $0x8,%esp
c0004d8f:	6a 0f                	push   $0xf
c0004d91:	68 d4 03 00 00       	push   $0x3d4
c0004d96:	e8 fe c6 ff ff       	call   c0001499 <out_byte>
c0004d9b:	83 c4 10             	add    $0x10,%esp
c0004d9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004da1:	0f b7 c0             	movzwl %ax,%eax
c0004da4:	83 ec 08             	sub    $0x8,%esp
c0004da7:	50                   	push   %eax
c0004da8:	68 d5 03 00 00       	push   $0x3d5
c0004dad:	e8 e7 c6 ff ff       	call   c0001499 <out_byte>
c0004db2:	83 c4 10             	add    $0x10,%esp
c0004db5:	90                   	nop
c0004db6:	c9                   	leave  
c0004db7:	c3                   	ret    

c0004db8 <set_console_start_video_addr>:
c0004db8:	55                   	push   %ebp
c0004db9:	89 e5                	mov    %esp,%ebp
c0004dbb:	83 ec 08             	sub    $0x8,%esp
c0004dbe:	83 ec 08             	sub    $0x8,%esp
c0004dc1:	6a 0c                	push   $0xc
c0004dc3:	68 d4 03 00 00       	push   $0x3d4
c0004dc8:	e8 cc c6 ff ff       	call   c0001499 <out_byte>
c0004dcd:	83 c4 10             	add    $0x10,%esp
c0004dd0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dd3:	c1 e8 08             	shr    $0x8,%eax
c0004dd6:	0f b7 c0             	movzwl %ax,%eax
c0004dd9:	83 ec 08             	sub    $0x8,%esp
c0004ddc:	50                   	push   %eax
c0004ddd:	68 d5 03 00 00       	push   $0x3d5
c0004de2:	e8 b2 c6 ff ff       	call   c0001499 <out_byte>
c0004de7:	83 c4 10             	add    $0x10,%esp
c0004dea:	83 ec 08             	sub    $0x8,%esp
c0004ded:	6a 0d                	push   $0xd
c0004def:	68 d4 03 00 00       	push   $0x3d4
c0004df4:	e8 a0 c6 ff ff       	call   c0001499 <out_byte>
c0004df9:	83 c4 10             	add    $0x10,%esp
c0004dfc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dff:	0f b7 c0             	movzwl %ax,%eax
c0004e02:	83 ec 08             	sub    $0x8,%esp
c0004e05:	50                   	push   %eax
c0004e06:	68 d5 03 00 00       	push   $0x3d5
c0004e0b:	e8 89 c6 ff ff       	call   c0001499 <out_byte>
c0004e10:	83 c4 10             	add    $0x10,%esp
c0004e13:	90                   	nop
c0004e14:	c9                   	leave  
c0004e15:	c3                   	ret    

c0004e16 <put_key>:
c0004e16:	55                   	push   %ebp
c0004e17:	89 e5                	mov    %esp,%ebp
c0004e19:	83 ec 04             	sub    $0x4,%esp
c0004e1c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004e1f:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004e22:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e25:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004e2b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004e30:	77 4d                	ja     c0004e7f <put_key+0x69>
c0004e32:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e35:	8b 00                	mov    (%eax),%eax
c0004e37:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004e3b:	89 10                	mov    %edx,(%eax)
c0004e3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e40:	8b 00                	mov    (%eax),%eax
c0004e42:	8d 50 04             	lea    0x4(%eax),%edx
c0004e45:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e48:	89 10                	mov    %edx,(%eax)
c0004e4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e4d:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004e53:	8d 50 01             	lea    0x1(%eax),%edx
c0004e56:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e59:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004e5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e62:	8b 00                	mov    (%eax),%eax
c0004e64:	8b 55 08             	mov    0x8(%ebp),%edx
c0004e67:	83 c2 08             	add    $0x8,%edx
c0004e6a:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004e70:	39 d0                	cmp    %edx,%eax
c0004e72:	75 0b                	jne    c0004e7f <put_key+0x69>
c0004e74:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e77:	8d 50 08             	lea    0x8(%eax),%edx
c0004e7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e7d:	89 10                	mov    %edx,(%eax)
c0004e7f:	90                   	nop
c0004e80:	c9                   	leave  
c0004e81:	c3                   	ret    

c0004e82 <scroll_up>:
c0004e82:	55                   	push   %ebp
c0004e83:	89 e5                	mov    %esp,%ebp
c0004e85:	83 ec 08             	sub    $0x8,%esp
c0004e88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e8b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e91:	8b 40 08             	mov    0x8(%eax),%eax
c0004e94:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004e97:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e9a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ea0:	8b 00                	mov    (%eax),%eax
c0004ea2:	39 c2                	cmp    %eax,%edx
c0004ea4:	76 1b                	jbe    c0004ec1 <scroll_up+0x3f>
c0004ea6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ea9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004eaf:	8b 40 08             	mov    0x8(%eax),%eax
c0004eb2:	83 e8 50             	sub    $0x50,%eax
c0004eb5:	83 ec 0c             	sub    $0xc,%esp
c0004eb8:	50                   	push   %eax
c0004eb9:	e8 fa fe ff ff       	call   c0004db8 <set_console_start_video_addr>
c0004ebe:	83 c4 10             	add    $0x10,%esp
c0004ec1:	90                   	nop
c0004ec2:	c9                   	leave  
c0004ec3:	c3                   	ret    

c0004ec4 <scroll_down>:
c0004ec4:	55                   	push   %ebp
c0004ec5:	89 e5                	mov    %esp,%ebp
c0004ec7:	83 ec 08             	sub    $0x8,%esp
c0004eca:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ecd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ed3:	8b 40 08             	mov    0x8(%eax),%eax
c0004ed6:	8d 48 50             	lea    0x50(%eax),%ecx
c0004ed9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004edc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ee2:	8b 10                	mov    (%eax),%edx
c0004ee4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ee7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004eed:	8b 40 04             	mov    0x4(%eax),%eax
c0004ef0:	01 d0                	add    %edx,%eax
c0004ef2:	39 c1                	cmp    %eax,%ecx
c0004ef4:	73 36                	jae    c0004f2c <scroll_down+0x68>
c0004ef6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004eff:	8b 40 08             	mov    0x8(%eax),%eax
c0004f02:	83 c0 50             	add    $0x50,%eax
c0004f05:	83 ec 0c             	sub    $0xc,%esp
c0004f08:	50                   	push   %eax
c0004f09:	e8 aa fe ff ff       	call   c0004db8 <set_console_start_video_addr>
c0004f0e:	83 c4 10             	add    $0x10,%esp
c0004f11:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f14:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f1a:	8b 50 08             	mov    0x8(%eax),%edx
c0004f1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f20:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f26:	83 c2 50             	add    $0x50,%edx
c0004f29:	89 50 08             	mov    %edx,0x8(%eax)
c0004f2c:	90                   	nop
c0004f2d:	c9                   	leave  
c0004f2e:	c3                   	ret    

c0004f2f <out_char>:
c0004f2f:	55                   	push   %ebp
c0004f30:	89 e5                	mov    %esp,%ebp
c0004f32:	83 ec 28             	sub    $0x28,%esp
c0004f35:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f38:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004f3b:	e8 e4 2b 00 00       	call   c0007b24 <intr_disable>
c0004f40:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004f43:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f46:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f4c:	8b 40 0c             	mov    0xc(%eax),%eax
c0004f4f:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0004f54:	01 c0                	add    %eax,%eax
c0004f56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004f59:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0004f5d:	83 f8 08             	cmp    $0x8,%eax
c0004f60:	0f 84 8d 00 00 00    	je     c0004ff3 <out_char+0xc4>
c0004f66:	83 f8 0a             	cmp    $0xa,%eax
c0004f69:	0f 85 c9 00 00 00    	jne    c0005038 <out_char+0x109>
c0004f6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f72:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f78:	8b 50 0c             	mov    0xc(%eax),%edx
c0004f7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f7e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f84:	8b 08                	mov    (%eax),%ecx
c0004f86:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f89:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f8f:	8b 40 04             	mov    0x4(%eax),%eax
c0004f92:	01 c8                	add    %ecx,%eax
c0004f94:	83 e8 50             	sub    $0x50,%eax
c0004f97:	39 c2                	cmp    %eax,%edx
c0004f99:	0f 83 f4 00 00 00    	jae    c0005093 <out_char+0x164>
c0004f9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fa8:	8b 08                	mov    (%eax),%ecx
c0004faa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fad:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fb3:	8b 50 0c             	mov    0xc(%eax),%edx
c0004fb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fbf:	8b 00                	mov    (%eax),%eax
c0004fc1:	29 c2                	sub    %eax,%edx
c0004fc3:	89 d0                	mov    %edx,%eax
c0004fc5:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0004fca:	f7 e2                	mul    %edx
c0004fcc:	89 d0                	mov    %edx,%eax
c0004fce:	c1 e8 06             	shr    $0x6,%eax
c0004fd1:	8d 50 01             	lea    0x1(%eax),%edx
c0004fd4:	89 d0                	mov    %edx,%eax
c0004fd6:	c1 e0 02             	shl    $0x2,%eax
c0004fd9:	01 d0                	add    %edx,%eax
c0004fdb:	c1 e0 04             	shl    $0x4,%eax
c0004fde:	89 c2                	mov    %eax,%edx
c0004fe0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fe3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fe9:	01 ca                	add    %ecx,%edx
c0004feb:	89 50 0c             	mov    %edx,0xc(%eax)
c0004fee:	e9 a0 00 00 00       	jmp    c0005093 <out_char+0x164>
c0004ff3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ff6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ffc:	8b 50 0c             	mov    0xc(%eax),%edx
c0004fff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005002:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005008:	8b 00                	mov    (%eax),%eax
c000500a:	39 c2                	cmp    %eax,%edx
c000500c:	0f 86 84 00 00 00    	jbe    c0005096 <out_char+0x167>
c0005012:	8b 45 08             	mov    0x8(%ebp),%eax
c0005015:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000501b:	8b 50 0c             	mov    0xc(%eax),%edx
c000501e:	83 ea 01             	sub    $0x1,%edx
c0005021:	89 50 0c             	mov    %edx,0xc(%eax)
c0005024:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005027:	83 e8 02             	sub    $0x2,%eax
c000502a:	c6 00 20             	movb   $0x20,(%eax)
c000502d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005030:	83 e8 01             	sub    $0x1,%eax
c0005033:	c6 00 00             	movb   $0x0,(%eax)
c0005036:	eb 5e                	jmp    c0005096 <out_char+0x167>
c0005038:	8b 45 08             	mov    0x8(%ebp),%eax
c000503b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005041:	8b 40 0c             	mov    0xc(%eax),%eax
c0005044:	8d 48 01             	lea    0x1(%eax),%ecx
c0005047:	8b 45 08             	mov    0x8(%ebp),%eax
c000504a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005050:	8b 10                	mov    (%eax),%edx
c0005052:	8b 45 08             	mov    0x8(%ebp),%eax
c0005055:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000505b:	8b 40 04             	mov    0x4(%eax),%eax
c000505e:	01 d0                	add    %edx,%eax
c0005060:	39 c1                	cmp    %eax,%ecx
c0005062:	73 35                	jae    c0005099 <out_char+0x16a>
c0005064:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005067:	8d 50 01             	lea    0x1(%eax),%edx
c000506a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c000506d:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0005071:	88 10                	mov    %dl,(%eax)
c0005073:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005076:	8d 50 01             	lea    0x1(%eax),%edx
c0005079:	89 55 f0             	mov    %edx,-0x10(%ebp)
c000507c:	c6 00 0a             	movb   $0xa,(%eax)
c000507f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005082:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005088:	8b 50 0c             	mov    0xc(%eax),%edx
c000508b:	83 c2 01             	add    $0x1,%edx
c000508e:	89 50 0c             	mov    %edx,0xc(%eax)
c0005091:	eb 06                	jmp    c0005099 <out_char+0x16a>
c0005093:	90                   	nop
c0005094:	eb 14                	jmp    c00050aa <out_char+0x17b>
c0005096:	90                   	nop
c0005097:	eb 11                	jmp    c00050aa <out_char+0x17b>
c0005099:	90                   	nop
c000509a:	eb 0e                	jmp    c00050aa <out_char+0x17b>
c000509c:	83 ec 0c             	sub    $0xc,%esp
c000509f:	ff 75 08             	pushl  0x8(%ebp)
c00050a2:	e8 1d fe ff ff       	call   c0004ec4 <scroll_down>
c00050a7:	83 c4 10             	add    $0x10,%esp
c00050aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ad:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050b3:	8b 50 0c             	mov    0xc(%eax),%edx
c00050b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00050b9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050bf:	8b 40 08             	mov    0x8(%eax),%eax
c00050c2:	29 c2                	sub    %eax,%edx
c00050c4:	89 d0                	mov    %edx,%eax
c00050c6:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c00050cb:	77 cf                	ja     c000509c <out_char+0x16d>
c00050cd:	83 ec 0c             	sub    $0xc,%esp
c00050d0:	ff 75 08             	pushl  0x8(%ebp)
c00050d3:	e8 49 fc ff ff       	call   c0004d21 <flush>
c00050d8:	83 c4 10             	add    $0x10,%esp
c00050db:	83 ec 0c             	sub    $0xc,%esp
c00050de:	ff 75 f4             	pushl  -0xc(%ebp)
c00050e1:	e8 67 2a 00 00       	call   c0007b4d <intr_set_status>
c00050e6:	83 c4 10             	add    $0x10,%esp
c00050e9:	90                   	nop
c00050ea:	c9                   	leave  
c00050eb:	c3                   	ret    

c00050ec <tty_dev_read>:
c00050ec:	55                   	push   %ebp
c00050ed:	89 e5                	mov    %esp,%ebp
c00050ef:	83 ec 08             	sub    $0x8,%esp
c00050f2:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c00050f7:	39 45 08             	cmp    %eax,0x8(%ebp)
c00050fa:	75 17                	jne    c0005113 <tty_dev_read+0x27>
c00050fc:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005101:	85 c0                	test   %eax,%eax
c0005103:	7e 0e                	jle    c0005113 <tty_dev_read+0x27>
c0005105:	83 ec 0c             	sub    $0xc,%esp
c0005108:	ff 75 08             	pushl  0x8(%ebp)
c000510b:	e8 89 07 00 00       	call   c0005899 <keyboard_read>
c0005110:	83 c4 10             	add    $0x10,%esp
c0005113:	90                   	nop
c0005114:	c9                   	leave  
c0005115:	c3                   	ret    

c0005116 <tty_dev_write>:
c0005116:	55                   	push   %ebp
c0005117:	89 e5                	mov    %esp,%ebp
c0005119:	83 ec 28             	sub    $0x28,%esp
c000511c:	8b 45 08             	mov    0x8(%ebp),%eax
c000511f:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005125:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005128:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000512f:	e9 88 01 00 00       	jmp    c00052bc <tty_dev_write+0x1a6>
c0005134:	8b 45 08             	mov    0x8(%ebp),%eax
c0005137:	8b 40 04             	mov    0x4(%eax),%eax
c000513a:	8b 00                	mov    (%eax),%eax
c000513c:	88 45 e7             	mov    %al,-0x19(%ebp)
c000513f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005142:	8b 40 04             	mov    0x4(%eax),%eax
c0005145:	8d 50 04             	lea    0x4(%eax),%edx
c0005148:	8b 45 08             	mov    0x8(%ebp),%eax
c000514b:	89 50 04             	mov    %edx,0x4(%eax)
c000514e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005151:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005157:	8d 50 ff             	lea    -0x1(%eax),%edx
c000515a:	8b 45 08             	mov    0x8(%ebp),%eax
c000515d:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0005163:	8b 45 08             	mov    0x8(%ebp),%eax
c0005166:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000516c:	8d 50 01             	lea    0x1(%eax),%edx
c000516f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005172:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005178:	8b 45 08             	mov    0x8(%ebp),%eax
c000517b:	8b 40 04             	mov    0x4(%eax),%eax
c000517e:	8b 55 08             	mov    0x8(%ebp),%edx
c0005181:	83 c2 08             	add    $0x8,%edx
c0005184:	81 c2 00 08 00 00    	add    $0x800,%edx
c000518a:	39 d0                	cmp    %edx,%eax
c000518c:	75 0c                	jne    c000519a <tty_dev_write+0x84>
c000518e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005191:	8d 50 08             	lea    0x8(%eax),%edx
c0005194:	8b 45 08             	mov    0x8(%ebp),%eax
c0005197:	89 50 04             	mov    %edx,0x4(%eax)
c000519a:	8b 45 08             	mov    0x8(%ebp),%eax
c000519d:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00051a3:	85 c0                	test   %eax,%eax
c00051a5:	0f 84 11 01 00 00    	je     c00052bc <tty_dev_write+0x1a6>
c00051ab:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00051af:	3c 20                	cmp    $0x20,%al
c00051b1:	76 08                	jbe    c00051bb <tty_dev_write+0xa5>
c00051b3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00051b7:	3c 7e                	cmp    $0x7e,%al
c00051b9:	76 10                	jbe    c00051cb <tty_dev_write+0xb5>
c00051bb:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00051bf:	3c 20                	cmp    $0x20,%al
c00051c1:	74 08                	je     c00051cb <tty_dev_write+0xb5>
c00051c3:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00051c7:	84 c0                	test   %al,%al
c00051c9:	75 58                	jne    c0005223 <tty_dev_write+0x10d>
c00051cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00051ce:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c00051d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00051d7:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00051dd:	01 d0                	add    %edx,%eax
c00051df:	83 e8 01             	sub    $0x1,%eax
c00051e2:	89 c2                	mov    %eax,%edx
c00051e4:	83 ec 04             	sub    $0x4,%esp
c00051e7:	6a 01                	push   $0x1
c00051e9:	8d 45 e7             	lea    -0x19(%ebp),%eax
c00051ec:	50                   	push   %eax
c00051ed:	52                   	push   %edx
c00051ee:	e8 95 29 00 00       	call   c0007b88 <Memcpy>
c00051f3:	83 c4 10             	add    $0x10,%esp
c00051f6:	8b 45 08             	mov    0x8(%ebp),%eax
c00051f9:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00051ff:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005202:	8b 45 08             	mov    0x8(%ebp),%eax
c0005205:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000520b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000520f:	0f b6 c0             	movzbl %al,%eax
c0005212:	83 ec 08             	sub    $0x8,%esp
c0005215:	50                   	push   %eax
c0005216:	ff 75 08             	pushl  0x8(%ebp)
c0005219:	e8 11 fd ff ff       	call   c0004f2f <out_char>
c000521e:	83 c4 10             	add    $0x10,%esp
c0005221:	eb 7c                	jmp    c000529f <tty_dev_write+0x189>
c0005223:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005227:	3c 08                	cmp    $0x8,%al
c0005229:	75 42                	jne    c000526d <tty_dev_write+0x157>
c000522b:	8b 45 08             	mov    0x8(%ebp),%eax
c000522e:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005234:	8d 50 01             	lea    0x1(%eax),%edx
c0005237:	8b 45 08             	mov    0x8(%ebp),%eax
c000523a:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005240:	8b 45 08             	mov    0x8(%ebp),%eax
c0005243:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005249:	8d 50 fe             	lea    -0x2(%eax),%edx
c000524c:	8b 45 08             	mov    0x8(%ebp),%eax
c000524f:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005255:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005259:	0f b6 c0             	movzbl %al,%eax
c000525c:	83 ec 08             	sub    $0x8,%esp
c000525f:	50                   	push   %eax
c0005260:	ff 75 08             	pushl  0x8(%ebp)
c0005263:	e8 c7 fc ff ff       	call   c0004f2f <out_char>
c0005268:	83 c4 10             	add    $0x10,%esp
c000526b:	eb 32                	jmp    c000529f <tty_dev_write+0x189>
c000526d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005271:	3c 0a                	cmp    $0xa,%al
c0005273:	75 2a                	jne    c000529f <tty_dev_write+0x189>
c0005275:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005279:	0f b6 c0             	movzbl %al,%eax
c000527c:	83 ec 08             	sub    $0x8,%esp
c000527f:	50                   	push   %eax
c0005280:	ff 75 08             	pushl  0x8(%ebp)
c0005283:	e8 a7 fc ff ff       	call   c0004f2f <out_char>
c0005288:	83 c4 10             	add    $0x10,%esp
c000528b:	8b 45 08             	mov    0x8(%ebp),%eax
c000528e:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0005295:	00 00 00 
c0005298:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000529f:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a2:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00052a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00052ab:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00052b1:	39 c2                	cmp    %eax,%edx
c00052b3:	75 07                	jne    c00052bc <tty_dev_write+0x1a6>
c00052b5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00052bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00052bf:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00052c5:	85 c0                	test   %eax,%eax
c00052c7:	0f 85 67 fe ff ff    	jne    c0005134 <tty_dev_write+0x1e>
c00052cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00052d1:	74 6d                	je     c0005340 <tty_dev_write+0x22a>
c00052d3:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c00052da:	83 ec 0c             	sub    $0xc,%esp
c00052dd:	ff 75 ec             	pushl  -0x14(%ebp)
c00052e0:	e8 df d3 ff ff       	call   c00026c4 <sys_malloc>
c00052e5:	83 c4 10             	add    $0x10,%esp
c00052e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00052eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00052ee:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c00052f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00052f8:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00052fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005301:	89 50 60             	mov    %edx,0x60(%eax)
c0005304:	8b 45 08             	mov    0x8(%ebp),%eax
c0005307:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c000530d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005310:	89 50 68             	mov    %edx,0x68(%eax)
c0005313:	8b 45 08             	mov    0x8(%ebp),%eax
c0005316:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000531c:	83 ec 04             	sub    $0x4,%esp
c000531f:	50                   	push   %eax
c0005320:	ff 75 e8             	pushl  -0x18(%ebp)
c0005323:	6a 01                	push   $0x1
c0005325:	e8 12 4d 00 00       	call   c000a03c <send_rec>
c000532a:	83 c4 10             	add    $0x10,%esp
c000532d:	83 ec 08             	sub    $0x8,%esp
c0005330:	ff 75 ec             	pushl  -0x14(%ebp)
c0005333:	ff 75 e8             	pushl  -0x18(%ebp)
c0005336:	e8 9e d3 ff ff       	call   c00026d9 <sys_free>
c000533b:	83 c4 10             	add    $0x10,%esp
c000533e:	eb 01                	jmp    c0005341 <tty_dev_write+0x22b>
c0005340:	90                   	nop
c0005341:	c9                   	leave  
c0005342:	c3                   	ret    

c0005343 <tty_do_read>:
c0005343:	55                   	push   %ebp
c0005344:	89 e5                	mov    %esp,%ebp
c0005346:	83 ec 08             	sub    $0x8,%esp
c0005349:	8b 45 08             	mov    0x8(%ebp),%eax
c000534c:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005353:	00 00 00 
c0005356:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005359:	8b 50 68             	mov    0x68(%eax),%edx
c000535c:	8b 45 08             	mov    0x8(%ebp),%eax
c000535f:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0005365:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005368:	8b 00                	mov    (%eax),%eax
c000536a:	89 c2                	mov    %eax,%edx
c000536c:	8b 45 08             	mov    0x8(%ebp),%eax
c000536f:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0005375:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005378:	8b 50 60             	mov    0x60(%eax),%edx
c000537b:	8b 45 08             	mov    0x8(%ebp),%eax
c000537e:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005384:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005387:	8b 50 60             	mov    0x60(%eax),%edx
c000538a:	8b 45 08             	mov    0x8(%ebp),%eax
c000538d:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005393:	8b 45 08             	mov    0x8(%ebp),%eax
c0005396:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c000539c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000539f:	8b 40 10             	mov    0x10(%eax),%eax
c00053a2:	83 ec 08             	sub    $0x8,%esp
c00053a5:	52                   	push   %edx
c00053a6:	50                   	push   %eax
c00053a7:	e8 a0 1a 00 00       	call   c0006e4c <alloc_virtual_memory>
c00053ac:	83 c4 10             	add    $0x10,%esp
c00053af:	89 c2                	mov    %eax,%edx
c00053b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b4:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00053ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00053bd:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00053c3:	83 f8 02             	cmp    $0x2,%eax
c00053c6:	74 1c                	je     c00053e4 <tty_do_read+0xa1>
c00053c8:	68 3b 01 00 00       	push   $0x13b
c00053cd:	68 11 b4 00 c0       	push   $0xc000b411
c00053d2:	68 11 b4 00 c0       	push   $0xc000b411
c00053d7:	68 1b b4 00 c0       	push   $0xc000b41b
c00053dc:	e8 1e 43 00 00       	call   c00096ff <assertion_failure>
c00053e1:	83 c4 10             	add    $0x10,%esp
c00053e4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053e7:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c00053ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00053f1:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00053f7:	83 ec 04             	sub    $0x4,%esp
c00053fa:	50                   	push   %eax
c00053fb:	ff 75 0c             	pushl  0xc(%ebp)
c00053fe:	6a 01                	push   $0x1
c0005400:	e8 37 4c 00 00       	call   c000a03c <send_rec>
c0005405:	83 c4 10             	add    $0x10,%esp
c0005408:	90                   	nop
c0005409:	c9                   	leave  
c000540a:	c3                   	ret    

c000540b <tty_do_write>:
c000540b:	55                   	push   %ebp
c000540c:	89 e5                	mov    %esp,%ebp
c000540e:	53                   	push   %ebx
c000540f:	83 ec 24             	sub    $0x24,%esp
c0005412:	89 e0                	mov    %esp,%eax
c0005414:	89 c3                	mov    %eax,%ebx
c0005416:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000541d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005420:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005423:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005426:	89 c2                	mov    %eax,%edx
c0005428:	b8 10 00 00 00       	mov    $0x10,%eax
c000542d:	83 e8 01             	sub    $0x1,%eax
c0005430:	01 d0                	add    %edx,%eax
c0005432:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005437:	ba 00 00 00 00       	mov    $0x0,%edx
c000543c:	f7 f1                	div    %ecx
c000543e:	6b c0 10             	imul   $0x10,%eax,%eax
c0005441:	29 c4                	sub    %eax,%esp
c0005443:	89 e0                	mov    %esp,%eax
c0005445:	83 c0 00             	add    $0x0,%eax
c0005448:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000544b:	83 ec 04             	sub    $0x4,%esp
c000544e:	ff 75 e8             	pushl  -0x18(%ebp)
c0005451:	6a 00                	push   $0x0
c0005453:	ff 75 e0             	pushl  -0x20(%ebp)
c0005456:	e8 9c 69 00 00       	call   c000bdf7 <Memset>
c000545b:	83 c4 10             	add    $0x10,%esp
c000545e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005461:	8b 40 60             	mov    0x60(%eax),%eax
c0005464:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005467:	8b 45 08             	mov    0x8(%ebp),%eax
c000546a:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005471:	00 00 00 
c0005474:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005477:	8b 45 0c             	mov    0xc(%ebp),%eax
c000547a:	8b 40 10             	mov    0x10(%eax),%eax
c000547d:	83 ec 08             	sub    $0x8,%esp
c0005480:	52                   	push   %edx
c0005481:	50                   	push   %eax
c0005482:	e8 c5 19 00 00       	call   c0006e4c <alloc_virtual_memory>
c0005487:	83 c4 10             	add    $0x10,%esp
c000548a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000548d:	eb 7e                	jmp    c000550d <tty_do_write+0x102>
c000548f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005492:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005495:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005499:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000549c:	8b 45 08             	mov    0x8(%ebp),%eax
c000549f:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00054a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00054a8:	01 d0                	add    %edx,%eax
c00054aa:	83 ec 04             	sub    $0x4,%esp
c00054ad:	ff 75 f0             	pushl  -0x10(%ebp)
c00054b0:	50                   	push   %eax
c00054b1:	ff 75 e0             	pushl  -0x20(%ebp)
c00054b4:	e8 cf 26 00 00       	call   c0007b88 <Memcpy>
c00054b9:	83 c4 10             	add    $0x10,%esp
c00054bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00054bf:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00054c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00054c5:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00054cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00054ce:	01 c2                	add    %eax,%edx
c00054d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00054d3:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00054d9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00054e0:	eb 25                	jmp    c0005507 <tty_do_write+0xfc>
c00054e2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00054e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00054e8:	01 d0                	add    %edx,%eax
c00054ea:	0f b6 00             	movzbl (%eax),%eax
c00054ed:	0f b6 c0             	movzbl %al,%eax
c00054f0:	83 ec 08             	sub    $0x8,%esp
c00054f3:	50                   	push   %eax
c00054f4:	ff 75 08             	pushl  0x8(%ebp)
c00054f7:	e8 33 fa ff ff       	call   c0004f2f <out_char>
c00054fc:	83 c4 10             	add    $0x10,%esp
c00054ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005503:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005507:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000550b:	75 d5                	jne    c00054e2 <tty_do_write+0xd7>
c000550d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005511:	0f 85 78 ff ff ff    	jne    c000548f <tty_do_write+0x84>
c0005517:	83 ec 0c             	sub    $0xc,%esp
c000551a:	6a 7c                	push   $0x7c
c000551c:	e8 a3 d1 ff ff       	call   c00026c4 <sys_malloc>
c0005521:	83 c4 10             	add    $0x10,%esp
c0005524:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005527:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000552a:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0005531:	8b 45 08             	mov    0x8(%ebp),%eax
c0005534:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000553a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000553d:	89 50 58             	mov    %edx,0x58(%eax)
c0005540:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005543:	8b 00                	mov    (%eax),%eax
c0005545:	83 ec 04             	sub    $0x4,%esp
c0005548:	50                   	push   %eax
c0005549:	ff 75 d8             	pushl  -0x28(%ebp)
c000554c:	6a 01                	push   $0x1
c000554e:	e8 e9 4a 00 00       	call   c000a03c <send_rec>
c0005553:	83 c4 10             	add    $0x10,%esp
c0005556:	83 ec 08             	sub    $0x8,%esp
c0005559:	6a 7c                	push   $0x7c
c000555b:	ff 75 d8             	pushl  -0x28(%ebp)
c000555e:	e8 76 d1 ff ff       	call   c00026d9 <sys_free>
c0005563:	83 c4 10             	add    $0x10,%esp
c0005566:	89 dc                	mov    %ebx,%esp
c0005568:	90                   	nop
c0005569:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000556c:	c9                   	leave  
c000556d:	c3                   	ret    

c000556e <init_screen>:
c000556e:	55                   	push   %ebp
c000556f:	89 e5                	mov    %esp,%ebp
c0005571:	83 ec 10             	sub    $0x10,%esp
c0005574:	8b 45 08             	mov    0x8(%ebp),%eax
c0005577:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c000557c:	c1 f8 03             	sar    $0x3,%eax
c000557f:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005585:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005588:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000558b:	c1 e0 04             	shl    $0x4,%eax
c000558e:	8d 90 14 1f 01 c0    	lea    -0x3ffee0ec(%eax),%edx
c0005594:	8b 45 08             	mov    0x8(%ebp),%eax
c0005597:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c000559d:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c00055a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00055a7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055ad:	8b 55 f8             	mov    -0x8(%ebp),%edx
c00055b0:	89 50 04             	mov    %edx,0x4(%eax)
c00055b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00055b6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055bc:	8b 50 04             	mov    0x4(%eax),%edx
c00055bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00055c2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055c8:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00055cc:	89 10                	mov    %edx,(%eax)
c00055ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00055d1:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c00055d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00055da:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00055e0:	8b 12                	mov    (%edx),%edx
c00055e2:	89 50 08             	mov    %edx,0x8(%eax)
c00055e5:	8b 55 08             	mov    0x8(%ebp),%edx
c00055e8:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c00055ee:	8b 40 08             	mov    0x8(%eax),%eax
c00055f1:	89 42 0c             	mov    %eax,0xc(%edx)
c00055f4:	90                   	nop
c00055f5:	c9                   	leave  
c00055f6:	c3                   	ret    

c00055f7 <init_tty>:
c00055f7:	55                   	push   %ebp
c00055f8:	89 e5                	mov    %esp,%ebp
c00055fa:	83 ec 18             	sub    $0x18,%esp
c00055fd:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c0005604:	e9 92 00 00 00       	jmp    c000569b <init_tty+0xa4>
c0005609:	83 ec 04             	sub    $0x4,%esp
c000560c:	68 28 08 00 00       	push   $0x828
c0005611:	6a 00                	push   $0x0
c0005613:	ff 75 f4             	pushl  -0xc(%ebp)
c0005616:	e8 dc 67 00 00       	call   c000bdf7 <Memset>
c000561b:	83 c4 10             	add    $0x10,%esp
c000561e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005621:	8d 50 08             	lea    0x8(%eax),%edx
c0005624:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005627:	89 50 04             	mov    %edx,0x4(%eax)
c000562a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000562d:	8b 50 04             	mov    0x4(%eax),%edx
c0005630:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005633:	89 10                	mov    %edx,(%eax)
c0005635:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005638:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c000563f:	00 00 00 
c0005642:	83 ec 0c             	sub    $0xc,%esp
c0005645:	ff 75 f4             	pushl  -0xc(%ebp)
c0005648:	e8 21 ff ff ff       	call   c000556e <init_screen>
c000564d:	83 c4 10             	add    $0x10,%esp
c0005650:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005653:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005658:	85 c0                	test   %eax,%eax
c000565a:	7e 38                	jle    c0005694 <init_tty+0x9d>
c000565c:	83 ec 08             	sub    $0x8,%esp
c000565f:	6a 23                	push   $0x23
c0005661:	ff 75 f4             	pushl  -0xc(%ebp)
c0005664:	e8 c6 f8 ff ff       	call   c0004f2f <out_char>
c0005669:	83 c4 10             	add    $0x10,%esp
c000566c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000566f:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005674:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005679:	c1 f8 03             	sar    $0x3,%eax
c000567c:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005682:	0f b6 c0             	movzbl %al,%eax
c0005685:	83 ec 08             	sub    $0x8,%esp
c0005688:	50                   	push   %eax
c0005689:	ff 75 f4             	pushl  -0xc(%ebp)
c000568c:	e8 9e f8 ff ff       	call   c0004f2f <out_char>
c0005691:	83 c4 10             	add    $0x10,%esp
c0005694:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c000569b:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c00056a0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00056a3:	0f 82 60 ff ff ff    	jb     c0005609 <init_tty+0x12>
c00056a9:	90                   	nop
c00056aa:	c9                   	leave  
c00056ab:	c3                   	ret    

c00056ac <TaskTTY>:
c00056ac:	55                   	push   %ebp
c00056ad:	89 e5                	mov    %esp,%ebp
c00056af:	83 ec 28             	sub    $0x28,%esp
c00056b2:	e8 40 ff ff ff       	call   c00055f7 <init_tty>
c00056b7:	83 ec 0c             	sub    $0xc,%esp
c00056ba:	6a 00                	push   $0x0
c00056bc:	e8 24 f6 ff ff       	call   c0004ce5 <select_console>
c00056c1:	83 c4 10             	add    $0x10,%esp
c00056c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00056cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00056d2:	83 ec 0c             	sub    $0xc,%esp
c00056d5:	6a 7c                	push   $0x7c
c00056d7:	e8 e8 cf ff ff       	call   c00026c4 <sys_malloc>
c00056dc:	83 c4 10             	add    $0x10,%esp
c00056df:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00056e2:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c00056e9:	eb 30                	jmp    c000571b <TaskTTY+0x6f>
c00056eb:	83 ec 0c             	sub    $0xc,%esp
c00056ee:	ff 75 f4             	pushl  -0xc(%ebp)
c00056f1:	e8 f6 f9 ff ff       	call   c00050ec <tty_dev_read>
c00056f6:	83 c4 10             	add    $0x10,%esp
c00056f9:	83 ec 0c             	sub    $0xc,%esp
c00056fc:	ff 75 f4             	pushl  -0xc(%ebp)
c00056ff:	e8 12 fa ff ff       	call   c0005116 <tty_dev_write>
c0005704:	83 c4 10             	add    $0x10,%esp
c0005707:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000570a:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005710:	85 c0                	test   %eax,%eax
c0005712:	75 d7                	jne    c00056eb <TaskTTY+0x3f>
c0005714:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c000571b:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c0005720:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005723:	72 c6                	jb     c00056eb <TaskTTY+0x3f>
c0005725:	83 ec 04             	sub    $0x4,%esp
c0005728:	6a 12                	push   $0x12
c000572a:	ff 75 e8             	pushl  -0x18(%ebp)
c000572d:	6a 02                	push   $0x2
c000572f:	e8 08 49 00 00       	call   c000a03c <send_rec>
c0005734:	83 c4 10             	add    $0x10,%esp
c0005737:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000573a:	8b 40 78             	mov    0x78(%eax),%eax
c000573d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005740:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005747:	74 28                	je     c0005771 <TaskTTY+0xc5>
c0005749:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005750:	7f 0b                	jg     c000575d <TaskTTY+0xb1>
c0005752:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005759:	74 4e                	je     c00057a9 <TaskTTY+0xfd>
c000575b:	eb 4d                	jmp    c00057aa <TaskTTY+0xfe>
c000575d:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005764:	74 21                	je     c0005787 <TaskTTY+0xdb>
c0005766:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c000576d:	74 2e                	je     c000579d <TaskTTY+0xf1>
c000576f:	eb 39                	jmp    c00057aa <TaskTTY+0xfe>
c0005771:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005776:	83 ec 08             	sub    $0x8,%esp
c0005779:	ff 75 e8             	pushl  -0x18(%ebp)
c000577c:	50                   	push   %eax
c000577d:	e8 c1 fb ff ff       	call   c0005343 <tty_do_read>
c0005782:	83 c4 10             	add    $0x10,%esp
c0005785:	eb 23                	jmp    c00057aa <TaskTTY+0xfe>
c0005787:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c000578c:	83 ec 08             	sub    $0x8,%esp
c000578f:	ff 75 e8             	pushl  -0x18(%ebp)
c0005792:	50                   	push   %eax
c0005793:	e8 73 fc ff ff       	call   c000540b <tty_do_write>
c0005798:	83 c4 10             	add    $0x10,%esp
c000579b:	eb 0d                	jmp    c00057aa <TaskTTY+0xfe>
c000579d:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c00057a4:	00 00 00 
c00057a7:	eb 01                	jmp    c00057aa <TaskTTY+0xfe>
c00057a9:	90                   	nop
c00057aa:	e9 33 ff ff ff       	jmp    c00056e2 <TaskTTY+0x36>

c00057af <keyboard_handler>:
c00057af:	55                   	push   %ebp
c00057b0:	89 e5                	mov    %esp,%ebp
c00057b2:	83 ec 18             	sub    $0x18,%esp
c00057b5:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c00057bc:	00 00 00 
c00057bf:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c00057c6:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00057cb:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00057d0:	7f 5e                	jg     c0005830 <keyboard_handler+0x81>
c00057d2:	e8 e4 bc ff ff       	call   c00014bb <disable_int>
c00057d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00057da:	0f b7 c0             	movzwl %ax,%eax
c00057dd:	83 ec 0c             	sub    $0xc,%esp
c00057e0:	50                   	push   %eax
c00057e1:	e8 a7 bc ff ff       	call   c000148d <in_byte>
c00057e6:	83 c4 10             	add    $0x10,%esp
c00057e9:	88 45 f3             	mov    %al,-0xd(%ebp)
c00057ec:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00057f1:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c00057f5:	88 10                	mov    %dl,(%eax)
c00057f7:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00057fc:	83 c0 01             	add    $0x1,%eax
c00057ff:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0005804:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005809:	83 c0 01             	add    $0x1,%eax
c000580c:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005811:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005816:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c000581b:	39 d0                	cmp    %edx,%eax
c000581d:	72 0a                	jb     c0005829 <keyboard_handler+0x7a>
c000581f:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0005826:	0b 01 c0 
c0005829:	e8 8f bc ff ff       	call   c00014bd <enable_int>
c000582e:	eb 01                	jmp    c0005831 <keyboard_handler+0x82>
c0005830:	90                   	nop
c0005831:	c9                   	leave  
c0005832:	c3                   	ret    

c0005833 <read_from_keyboard_buf>:
c0005833:	55                   	push   %ebp
c0005834:	89 e5                	mov    %esp,%ebp
c0005836:	83 ec 18             	sub    $0x18,%esp
c0005839:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c000583d:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005842:	85 c0                	test   %eax,%eax
c0005844:	7f 06                	jg     c000584c <read_from_keyboard_buf+0x19>
c0005846:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c000584a:	eb 4b                	jmp    c0005897 <read_from_keyboard_buf+0x64>
c000584c:	e8 6a bc ff ff       	call   c00014bb <disable_int>
c0005851:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005856:	0f b6 00             	movzbl (%eax),%eax
c0005859:	88 45 f7             	mov    %al,-0x9(%ebp)
c000585c:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005861:	83 c0 01             	add    $0x1,%eax
c0005864:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0005869:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c000586e:	83 e8 01             	sub    $0x1,%eax
c0005871:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005876:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c000587b:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005880:	39 d0                	cmp    %edx,%eax
c0005882:	72 0a                	jb     c000588e <read_from_keyboard_buf+0x5b>
c0005884:	c7 05 e4 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be4
c000588b:	0b 01 c0 
c000588e:	e8 2a bc ff ff       	call   c00014bd <enable_int>
c0005893:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005897:	c9                   	leave  
c0005898:	c3                   	ret    

c0005899 <keyboard_read>:
c0005899:	55                   	push   %ebp
c000589a:	89 e5                	mov    %esp,%ebp
c000589c:	83 ec 28             	sub    $0x28,%esp
c000589f:	90                   	nop
c00058a0:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00058a5:	85 c0                	test   %eax,%eax
c00058a7:	7e f7                	jle    c00058a0 <keyboard_read+0x7>
c00058a9:	e8 85 ff ff ff       	call   c0005833 <read_from_keyboard_buf>
c00058ae:	88 45 ea             	mov    %al,-0x16(%ebp)
c00058b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00058b8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00058bc:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c00058c0:	75 5a                	jne    c000591c <keyboard_read+0x83>
c00058c2:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c00058c6:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c00058ca:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c00058ce:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c00058d2:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c00058d6:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c00058da:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c00058de:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00058e5:	eb 20                	jmp    c0005907 <keyboard_read+0x6e>
c00058e7:	e8 47 ff ff ff       	call   c0005833 <read_from_keyboard_buf>
c00058ec:	89 c1                	mov    %eax,%ecx
c00058ee:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c00058f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00058f4:	01 d0                	add    %edx,%eax
c00058f6:	0f b6 00             	movzbl (%eax),%eax
c00058f9:	38 c1                	cmp    %al,%cl
c00058fb:	74 06                	je     c0005903 <keyboard_read+0x6a>
c00058fd:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005901:	eb 0a                	jmp    c000590d <keyboard_read+0x74>
c0005903:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005907:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c000590b:	7e da                	jle    c00058e7 <keyboard_read+0x4e>
c000590d:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005911:	74 68                	je     c000597b <keyboard_read+0xe2>
c0005913:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c000591a:	eb 5f                	jmp    c000597b <keyboard_read+0xe2>
c000591c:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005920:	75 59                	jne    c000597b <keyboard_read+0xe2>
c0005922:	e8 0c ff ff ff       	call   c0005833 <read_from_keyboard_buf>
c0005927:	3c 2a                	cmp    $0x2a,%al
c0005929:	75 1d                	jne    c0005948 <keyboard_read+0xaf>
c000592b:	e8 03 ff ff ff       	call   c0005833 <read_from_keyboard_buf>
c0005930:	3c e0                	cmp    $0xe0,%al
c0005932:	75 14                	jne    c0005948 <keyboard_read+0xaf>
c0005934:	e8 fa fe ff ff       	call   c0005833 <read_from_keyboard_buf>
c0005939:	3c 37                	cmp    $0x37,%al
c000593b:	75 0b                	jne    c0005948 <keyboard_read+0xaf>
c000593d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005944:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005948:	e8 e6 fe ff ff       	call   c0005833 <read_from_keyboard_buf>
c000594d:	3c b7                	cmp    $0xb7,%al
c000594f:	75 1d                	jne    c000596e <keyboard_read+0xd5>
c0005951:	e8 dd fe ff ff       	call   c0005833 <read_from_keyboard_buf>
c0005956:	3c e0                	cmp    $0xe0,%al
c0005958:	75 14                	jne    c000596e <keyboard_read+0xd5>
c000595a:	e8 d4 fe ff ff       	call   c0005833 <read_from_keyboard_buf>
c000595f:	3c aa                	cmp    $0xaa,%al
c0005961:	75 0b                	jne    c000596e <keyboard_read+0xd5>
c0005963:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c000596a:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c000596e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005972:	75 07                	jne    c000597b <keyboard_read+0xe2>
c0005974:	c6 05 84 07 01 c0 01 	movb   $0x1,0xc0010784
c000597b:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005982:	0f 84 8d 00 00 00    	je     c0005a15 <keyboard_read+0x17c>
c0005988:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c000598f:	0f 84 80 00 00 00    	je     c0005a15 <keyboard_read+0x17c>
c0005995:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005999:	0f 94 c2             	sete   %dl
c000599c:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c00059a0:	0f 94 c0             	sete   %al
c00059a3:	09 d0                	or     %edx,%eax
c00059a5:	84 c0                	test   %al,%al
c00059a7:	74 07                	je     c00059b0 <keyboard_read+0x117>
c00059a9:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c00059b0:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c00059b4:	f7 d0                	not    %eax
c00059b6:	c0 e8 07             	shr    $0x7,%al
c00059b9:	88 45 e9             	mov    %al,-0x17(%ebp)
c00059bc:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c00059c0:	74 53                	je     c0005a15 <keyboard_read+0x17c>
c00059c2:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c00059c6:	74 4d                	je     c0005a15 <keyboard_read+0x17c>
c00059c8:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c00059cc:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c00059d3:	3c 01                	cmp    $0x1,%al
c00059d5:	75 04                	jne    c00059db <keyboard_read+0x142>
c00059d7:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c00059db:	0f b6 05 84 07 01 c0 	movzbl 0xc0010784,%eax
c00059e2:	84 c0                	test   %al,%al
c00059e4:	74 04                	je     c00059ea <keyboard_read+0x151>
c00059e6:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c00059ea:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c00059ee:	89 d0                	mov    %edx,%eax
c00059f0:	01 c0                	add    %eax,%eax
c00059f2:	01 c2                	add    %eax,%edx
c00059f4:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00059f8:	01 d0                	add    %edx,%eax
c00059fa:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005a01:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005a04:	83 ec 08             	sub    $0x8,%esp
c0005a07:	ff 75 f4             	pushl  -0xc(%ebp)
c0005a0a:	ff 75 08             	pushl  0x8(%ebp)
c0005a0d:	e8 1a 00 00 00       	call   c0005a2c <in_process>
c0005a12:	83 c4 10             	add    $0x10,%esp
c0005a15:	90                   	nop
c0005a16:	c9                   	leave  
c0005a17:	c3                   	ret    

c0005a18 <init_keyboard_handler>:
c0005a18:	55                   	push   %ebp
c0005a19:	89 e5                	mov    %esp,%ebp
c0005a1b:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005a22:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005a29:	90                   	nop
c0005a2a:	5d                   	pop    %ebp
c0005a2b:	c3                   	ret    

c0005a2c <in_process>:
c0005a2c:	55                   	push   %ebp
c0005a2d:	89 e5                	mov    %esp,%ebp
c0005a2f:	83 ec 18             	sub    $0x18,%esp
c0005a32:	83 ec 04             	sub    $0x4,%esp
c0005a35:	6a 02                	push   $0x2
c0005a37:	6a 00                	push   $0x0
c0005a39:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005a3c:	50                   	push   %eax
c0005a3d:	e8 b5 63 00 00       	call   c000bdf7 <Memset>
c0005a42:	83 c4 10             	add    $0x10,%esp
c0005a45:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a48:	25 00 01 00 00       	and    $0x100,%eax
c0005a4d:	85 c0                	test   %eax,%eax
c0005a4f:	75 28                	jne    c0005a79 <in_process+0x4d>
c0005a51:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a54:	0f b6 c0             	movzbl %al,%eax
c0005a57:	83 ec 08             	sub    $0x8,%esp
c0005a5a:	50                   	push   %eax
c0005a5b:	ff 75 08             	pushl  0x8(%ebp)
c0005a5e:	e8 b3 f3 ff ff       	call   c0004e16 <put_key>
c0005a63:	83 c4 10             	add    $0x10,%esp
c0005a66:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005a6d:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005a74:	e9 42 01 00 00       	jmp    c0005bbb <in_process+0x18f>
c0005a79:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005a80:	84 c0                	test   %al,%al
c0005a82:	0f 84 a9 00 00 00    	je     c0005b31 <in_process+0x105>
c0005a88:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005a8c:	0f 84 9f 00 00 00    	je     c0005b31 <in_process+0x105>
c0005a92:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005a96:	0f 84 95 00 00 00    	je     c0005b31 <in_process+0x105>
c0005a9c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005aa3:	74 64                	je     c0005b09 <in_process+0xdd>
c0005aa5:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005aac:	77 0b                	ja     c0005ab9 <in_process+0x8d>
c0005aae:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005ab5:	74 64                	je     c0005b1b <in_process+0xef>
c0005ab7:	eb 73                	jmp    c0005b2c <in_process+0x100>
c0005ab9:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005ac0:	74 0b                	je     c0005acd <in_process+0xa1>
c0005ac2:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005ac9:	74 20                	je     c0005aeb <in_process+0xbf>
c0005acb:	eb 5f                	jmp    c0005b2c <in_process+0x100>
c0005acd:	83 ec 0c             	sub    $0xc,%esp
c0005ad0:	ff 75 08             	pushl  0x8(%ebp)
c0005ad3:	e8 aa f3 ff ff       	call   c0004e82 <scroll_up>
c0005ad8:	83 c4 10             	add    $0x10,%esp
c0005adb:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005ae2:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005ae9:	eb 41                	jmp    c0005b2c <in_process+0x100>
c0005aeb:	83 ec 0c             	sub    $0xc,%esp
c0005aee:	ff 75 08             	pushl  0x8(%ebp)
c0005af1:	e8 ce f3 ff ff       	call   c0004ec4 <scroll_down>
c0005af6:	83 c4 10             	add    $0x10,%esp
c0005af9:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005b00:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005b07:	eb 23                	jmp    c0005b2c <in_process+0x100>
c0005b09:	83 ec 08             	sub    $0x8,%esp
c0005b0c:	6a 0a                	push   $0xa
c0005b0e:	ff 75 08             	pushl  0x8(%ebp)
c0005b11:	e8 19 f4 ff ff       	call   c0004f2f <out_char>
c0005b16:	83 c4 10             	add    $0x10,%esp
c0005b19:	eb 11                	jmp    c0005b2c <in_process+0x100>
c0005b1b:	83 ec 08             	sub    $0x8,%esp
c0005b1e:	6a 08                	push   $0x8
c0005b20:	ff 75 08             	pushl  0x8(%ebp)
c0005b23:	e8 07 f4 ff ff       	call   c0004f2f <out_char>
c0005b28:	83 c4 10             	add    $0x10,%esp
c0005b2b:	90                   	nop
c0005b2c:	e9 8a 00 00 00       	jmp    c0005bbb <in_process+0x18f>
c0005b31:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005b38:	74 55                	je     c0005b8f <in_process+0x163>
c0005b3a:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005b41:	77 14                	ja     c0005b57 <in_process+0x12b>
c0005b43:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005b4a:	74 31                	je     c0005b7d <in_process+0x151>
c0005b4c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005b53:	74 16                	je     c0005b6b <in_process+0x13f>
c0005b55:	eb 64                	jmp    c0005bbb <in_process+0x18f>
c0005b57:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005b5e:	74 3e                	je     c0005b9e <in_process+0x172>
c0005b60:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005b67:	74 44                	je     c0005bad <in_process+0x181>
c0005b69:	eb 50                	jmp    c0005bbb <in_process+0x18f>
c0005b6b:	83 ec 08             	sub    $0x8,%esp
c0005b6e:	6a 0a                	push   $0xa
c0005b70:	ff 75 08             	pushl  0x8(%ebp)
c0005b73:	e8 9e f2 ff ff       	call   c0004e16 <put_key>
c0005b78:	83 c4 10             	add    $0x10,%esp
c0005b7b:	eb 3e                	jmp    c0005bbb <in_process+0x18f>
c0005b7d:	83 ec 08             	sub    $0x8,%esp
c0005b80:	6a 08                	push   $0x8
c0005b82:	ff 75 08             	pushl  0x8(%ebp)
c0005b85:	e8 8c f2 ff ff       	call   c0004e16 <put_key>
c0005b8a:	83 c4 10             	add    $0x10,%esp
c0005b8d:	eb 2c                	jmp    c0005bbb <in_process+0x18f>
c0005b8f:	83 ec 0c             	sub    $0xc,%esp
c0005b92:	6a 00                	push   $0x0
c0005b94:	e8 4c f1 ff ff       	call   c0004ce5 <select_console>
c0005b99:	83 c4 10             	add    $0x10,%esp
c0005b9c:	eb 1d                	jmp    c0005bbb <in_process+0x18f>
c0005b9e:	83 ec 0c             	sub    $0xc,%esp
c0005ba1:	6a 01                	push   $0x1
c0005ba3:	e8 3d f1 ff ff       	call   c0004ce5 <select_console>
c0005ba8:	83 c4 10             	add    $0x10,%esp
c0005bab:	eb 0e                	jmp    c0005bbb <in_process+0x18f>
c0005bad:	83 ec 0c             	sub    $0xc,%esp
c0005bb0:	6a 02                	push   $0x2
c0005bb2:	e8 2e f1 ff ff       	call   c0004ce5 <select_console>
c0005bb7:	83 c4 10             	add    $0x10,%esp
c0005bba:	90                   	nop
c0005bbb:	90                   	nop
c0005bbc:	c9                   	leave  
c0005bbd:	c3                   	ret    

c0005bbe <open>:
c0005bbe:	55                   	push   %ebp
c0005bbf:	89 e5                	mov    %esp,%ebp
c0005bc1:	83 ec 18             	sub    $0x18,%esp
c0005bc4:	83 ec 0c             	sub    $0xc,%esp
c0005bc7:	6a 7c                	push   $0x7c
c0005bc9:	e8 f6 ca ff ff       	call   c00026c4 <sys_malloc>
c0005bce:	83 c4 10             	add    $0x10,%esp
c0005bd1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005bd4:	83 ec 04             	sub    $0x4,%esp
c0005bd7:	6a 7c                	push   $0x7c
c0005bd9:	6a 00                	push   $0x0
c0005bdb:	ff 75 f4             	pushl  -0xc(%ebp)
c0005bde:	e8 14 62 00 00       	call   c000bdf7 <Memset>
c0005be3:	83 c4 10             	add    $0x10,%esp
c0005be6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005be9:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0005bf0:	83 ec 0c             	sub    $0xc,%esp
c0005bf3:	ff 75 08             	pushl  0x8(%ebp)
c0005bf6:	e8 1f 13 00 00       	call   c0006f1a <get_physical_address>
c0005bfb:	83 c4 10             	add    $0x10,%esp
c0005bfe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005c01:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c04:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005c07:	89 50 44             	mov    %edx,0x44(%eax)
c0005c0a:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005c0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c10:	89 50 74             	mov    %edx,0x74(%eax)
c0005c13:	83 ec 0c             	sub    $0xc,%esp
c0005c16:	ff 75 08             	pushl  0x8(%ebp)
c0005c19:	e8 12 62 00 00       	call   c000be30 <Strlen>
c0005c1e:	83 c4 10             	add    $0x10,%esp
c0005c21:	89 c2                	mov    %eax,%edx
c0005c23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c26:	89 50 40             	mov    %edx,0x40(%eax)
c0005c29:	83 ec 04             	sub    $0x4,%esp
c0005c2c:	6a 02                	push   $0x2
c0005c2e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c31:	6a 03                	push   $0x3
c0005c33:	e8 04 44 00 00       	call   c000a03c <send_rec>
c0005c38:	83 c4 10             	add    $0x10,%esp
c0005c3b:	83 ec 08             	sub    $0x8,%esp
c0005c3e:	6a 7c                	push   $0x7c
c0005c40:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c43:	e8 91 ca ff ff       	call   c00026d9 <sys_free>
c0005c48:	83 c4 10             	add    $0x10,%esp
c0005c4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c4e:	8b 40 50             	mov    0x50(%eax),%eax
c0005c51:	c9                   	leave  
c0005c52:	c3                   	ret    

c0005c53 <read>:
c0005c53:	55                   	push   %ebp
c0005c54:	89 e5                	mov    %esp,%ebp
c0005c56:	83 ec 38             	sub    $0x38,%esp
c0005c59:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0005c60:	83 ec 0c             	sub    $0xc,%esp
c0005c63:	ff 75 dc             	pushl  -0x24(%ebp)
c0005c66:	e8 59 ca ff ff       	call   c00026c4 <sys_malloc>
c0005c6b:	83 c4 10             	add    $0x10,%esp
c0005c6e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005c71:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005c74:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0005c79:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005c7c:	83 ec 0c             	sub    $0xc,%esp
c0005c7f:	ff 75 0c             	pushl  0xc(%ebp)
c0005c82:	e8 93 12 00 00       	call   c0006f1a <get_physical_address>
c0005c87:	83 c4 10             	add    $0x10,%esp
c0005c8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005c8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c90:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0005c95:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005c98:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005c9b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0005ca0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0005ca3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0005caa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005cb1:	8b 55 10             	mov    0x10(%ebp),%edx
c0005cb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005cb7:	01 d0                	add    %edx,%eax
c0005cb9:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0005cbc:	0f 83 a8 00 00 00    	jae    c0005d6a <read+0x117>
c0005cc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005cc5:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0005cc8:	05 00 10 00 00       	add    $0x1000,%eax
c0005ccd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005cd0:	8b 45 10             	mov    0x10(%ebp),%eax
c0005cd3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005cd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005cd9:	83 ec 04             	sub    $0x4,%esp
c0005cdc:	50                   	push   %eax
c0005cdd:	6a 00                	push   $0x0
c0005cdf:	ff 75 d8             	pushl  -0x28(%ebp)
c0005ce2:	e8 10 61 00 00       	call   c000bdf7 <Memset>
c0005ce7:	83 c4 10             	add    $0x10,%esp
c0005cea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ced:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0005cf4:	8b 55 08             	mov    0x8(%ebp),%edx
c0005cf7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005cfa:	89 50 50             	mov    %edx,0x50(%eax)
c0005cfd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005d00:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005d03:	89 50 10             	mov    %edx,0x10(%eax)
c0005d06:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005d09:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0005d0c:	89 50 60             	mov    %edx,0x60(%eax)
c0005d0f:	83 ec 04             	sub    $0x4,%esp
c0005d12:	6a 02                	push   $0x2
c0005d14:	ff 75 d8             	pushl  -0x28(%ebp)
c0005d17:	6a 03                	push   $0x3
c0005d19:	e8 1e 43 00 00       	call   c000a03c <send_rec>
c0005d1e:	83 c4 10             	add    $0x10,%esp
c0005d21:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005d24:	8b 40 60             	mov    0x60(%eax),%eax
c0005d27:	01 45 e8             	add    %eax,-0x18(%ebp)
c0005d2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0005d2d:	29 45 e0             	sub    %eax,-0x20(%ebp)
c0005d30:	8b 45 10             	mov    0x10(%ebp),%eax
c0005d33:	2b 45 e4             	sub    -0x1c(%ebp),%eax
c0005d36:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005d39:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005d3c:	89 45 10             	mov    %eax,0x10(%ebp)
c0005d3f:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0005d46:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0005d4d:	83 ec 0c             	sub    $0xc,%esp
c0005d50:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d53:	e8 c2 11 00 00       	call   c0006f1a <get_physical_address>
c0005d58:	83 c4 10             	add    $0x10,%esp
c0005d5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005d5e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0005d62:	0f 85 6e ff ff ff    	jne    c0005cd6 <read+0x83>
c0005d68:	eb 54                	jmp    c0005dbe <read+0x16b>
c0005d6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005d6d:	83 ec 04             	sub    $0x4,%esp
c0005d70:	50                   	push   %eax
c0005d71:	6a 00                	push   $0x0
c0005d73:	ff 75 d8             	pushl  -0x28(%ebp)
c0005d76:	e8 7c 60 00 00       	call   c000bdf7 <Memset>
c0005d7b:	83 c4 10             	add    $0x10,%esp
c0005d7e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005d81:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0005d88:	8b 55 08             	mov    0x8(%ebp),%edx
c0005d8b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005d8e:	89 50 50             	mov    %edx,0x50(%eax)
c0005d91:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005d94:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005d97:	89 50 10             	mov    %edx,0x10(%eax)
c0005d9a:	8b 55 10             	mov    0x10(%ebp),%edx
c0005d9d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005da0:	89 50 60             	mov    %edx,0x60(%eax)
c0005da3:	83 ec 04             	sub    $0x4,%esp
c0005da6:	6a 02                	push   $0x2
c0005da8:	ff 75 d8             	pushl  -0x28(%ebp)
c0005dab:	6a 03                	push   $0x3
c0005dad:	e8 8a 42 00 00       	call   c000a03c <send_rec>
c0005db2:	83 c4 10             	add    $0x10,%esp
c0005db5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005db8:	8b 40 60             	mov    0x60(%eax),%eax
c0005dbb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005dbe:	83 ec 08             	sub    $0x8,%esp
c0005dc1:	ff 75 dc             	pushl  -0x24(%ebp)
c0005dc4:	ff 75 d8             	pushl  -0x28(%ebp)
c0005dc7:	e8 0d c9 ff ff       	call   c00026d9 <sys_free>
c0005dcc:	83 c4 10             	add    $0x10,%esp
c0005dcf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005dd2:	c9                   	leave  
c0005dd3:	c3                   	ret    

c0005dd4 <write>:
c0005dd4:	55                   	push   %ebp
c0005dd5:	89 e5                	mov    %esp,%ebp
c0005dd7:	83 ec 18             	sub    $0x18,%esp
c0005dda:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0005de1:	83 ec 0c             	sub    $0xc,%esp
c0005de4:	ff 75 f4             	pushl  -0xc(%ebp)
c0005de7:	e8 d8 c8 ff ff       	call   c00026c4 <sys_malloc>
c0005dec:	83 c4 10             	add    $0x10,%esp
c0005def:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005df2:	83 ec 0c             	sub    $0xc,%esp
c0005df5:	ff 75 0c             	pushl  0xc(%ebp)
c0005df8:	e8 1d 11 00 00       	call   c0006f1a <get_physical_address>
c0005dfd:	83 c4 10             	add    $0x10,%esp
c0005e00:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005e03:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e06:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0005e0d:	8b 55 08             	mov    0x8(%ebp),%edx
c0005e10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e13:	89 50 50             	mov    %edx,0x50(%eax)
c0005e16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e19:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005e1c:	89 50 10             	mov    %edx,0x10(%eax)
c0005e1f:	8b 55 10             	mov    0x10(%ebp),%edx
c0005e22:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e25:	89 50 60             	mov    %edx,0x60(%eax)
c0005e28:	83 ec 04             	sub    $0x4,%esp
c0005e2b:	6a 02                	push   $0x2
c0005e2d:	ff 75 f0             	pushl  -0x10(%ebp)
c0005e30:	6a 03                	push   $0x3
c0005e32:	e8 05 42 00 00       	call   c000a03c <send_rec>
c0005e37:	83 c4 10             	add    $0x10,%esp
c0005e3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e3d:	8b 40 60             	mov    0x60(%eax),%eax
c0005e40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005e43:	83 ec 08             	sub    $0x8,%esp
c0005e46:	ff 75 f4             	pushl  -0xc(%ebp)
c0005e49:	ff 75 f0             	pushl  -0x10(%ebp)
c0005e4c:	e8 88 c8 ff ff       	call   c00026d9 <sys_free>
c0005e51:	83 c4 10             	add    $0x10,%esp
c0005e54:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e57:	c9                   	leave  
c0005e58:	c3                   	ret    

c0005e59 <close>:
c0005e59:	55                   	push   %ebp
c0005e5a:	89 e5                	mov    %esp,%ebp
c0005e5c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005e62:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005e69:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e6c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005e6f:	83 ec 04             	sub    $0x4,%esp
c0005e72:	6a 02                	push   $0x2
c0005e74:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005e7a:	50                   	push   %eax
c0005e7b:	6a 03                	push   $0x3
c0005e7d:	e8 ba 41 00 00       	call   c000a03c <send_rec>
c0005e82:	83 c4 10             	add    $0x10,%esp
c0005e85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005e88:	83 f8 65             	cmp    $0x65,%eax
c0005e8b:	74 19                	je     c0005ea6 <close+0x4d>
c0005e8d:	6a 13                	push   $0x13
c0005e8f:	68 33 b4 00 c0       	push   $0xc000b433
c0005e94:	68 33 b4 00 c0       	push   $0xc000b433
c0005e99:	68 3f b4 00 c0       	push   $0xc000b43f
c0005e9e:	e8 5c 38 00 00       	call   c00096ff <assertion_failure>
c0005ea3:	83 c4 10             	add    $0x10,%esp
c0005ea6:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005ea9:	c9                   	leave  
c0005eaa:	c3                   	ret    

c0005eab <wait>:
c0005eab:	55                   	push   %ebp
c0005eac:	89 e5                	mov    %esp,%ebp
c0005eae:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005eb4:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005ebb:	83 ec 04             	sub    $0x4,%esp
c0005ebe:	6a 01                	push   $0x1
c0005ec0:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005ec6:	50                   	push   %eax
c0005ec7:	6a 03                	push   $0x3
c0005ec9:	e8 6e 41 00 00       	call   c000a03c <send_rec>
c0005ece:	83 c4 10             	add    $0x10,%esp
c0005ed1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005ed4:	89 c2                	mov    %eax,%edx
c0005ed6:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ed9:	89 10                	mov    %edx,(%eax)
c0005edb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ede:	83 f8 21             	cmp    $0x21,%eax
c0005ee1:	74 05                	je     c0005ee8 <wait+0x3d>
c0005ee3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ee6:	eb 05                	jmp    c0005eed <wait+0x42>
c0005ee8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005eed:	c9                   	leave  
c0005eee:	c3                   	ret    

c0005eef <exit>:
c0005eef:	55                   	push   %ebp
c0005ef0:	89 e5                	mov    %esp,%ebp
c0005ef2:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005ef8:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005eff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005f02:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005f05:	83 ec 04             	sub    $0x4,%esp
c0005f08:	6a 01                	push   $0x1
c0005f0a:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005f10:	50                   	push   %eax
c0005f11:	6a 03                	push   $0x3
c0005f13:	e8 24 41 00 00       	call   c000a03c <send_rec>
c0005f18:	83 c4 10             	add    $0x10,%esp
c0005f1b:	90                   	nop
c0005f1c:	c9                   	leave  
c0005f1d:	c3                   	ret    

c0005f1e <fork>:
c0005f1e:	55                   	push   %ebp
c0005f1f:	89 e5                	mov    %esp,%ebp
c0005f21:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005f27:	83 ec 04             	sub    $0x4,%esp
c0005f2a:	6a 7c                	push   $0x7c
c0005f2c:	6a 00                	push   $0x0
c0005f2e:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005f34:	50                   	push   %eax
c0005f35:	e8 bd 5e 00 00       	call   c000bdf7 <Memset>
c0005f3a:	83 c4 10             	add    $0x10,%esp
c0005f3d:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005f44:	83 ec 04             	sub    $0x4,%esp
c0005f47:	6a 01                	push   $0x1
c0005f49:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005f4f:	50                   	push   %eax
c0005f50:	6a 03                	push   $0x3
c0005f52:	e8 e5 40 00 00       	call   c000a03c <send_rec>
c0005f57:	83 c4 10             	add    $0x10,%esp
c0005f5a:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005f61:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005f64:	85 c0                	test   %eax,%eax
c0005f66:	74 19                	je     c0005f81 <fork+0x63>
c0005f68:	6a 14                	push   $0x14
c0005f6a:	68 57 b4 00 c0       	push   $0xc000b457
c0005f6f:	68 57 b4 00 c0       	push   $0xc000b457
c0005f74:	68 62 b4 00 c0       	push   $0xc000b462
c0005f79:	e8 81 37 00 00       	call   c00096ff <assertion_failure>
c0005f7e:	83 c4 10             	add    $0x10,%esp
c0005f81:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f84:	c9                   	leave  
c0005f85:	c3                   	ret    

c0005f86 <getpid>:
c0005f86:	55                   	push   %ebp
c0005f87:	89 e5                	mov    %esp,%ebp
c0005f89:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005f8f:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005f96:	83 ec 04             	sub    $0x4,%esp
c0005f99:	6a 05                	push   $0x5
c0005f9b:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005fa1:	50                   	push   %eax
c0005fa2:	6a 03                	push   $0x3
c0005fa4:	e8 93 40 00 00       	call   c000a03c <send_rec>
c0005fa9:	83 c4 10             	add    $0x10,%esp
c0005fac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005faf:	c9                   	leave  
c0005fb0:	c3                   	ret    

c0005fb1 <exec>:
c0005fb1:	55                   	push   %ebp
c0005fb2:	89 e5                	mov    %esp,%ebp
c0005fb4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005fba:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005fc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0005fc4:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005fc7:	83 ec 0c             	sub    $0xc,%esp
c0005fca:	ff 75 08             	pushl  0x8(%ebp)
c0005fcd:	e8 5e 5e 00 00       	call   c000be30 <Strlen>
c0005fd2:	83 c4 10             	add    $0x10,%esp
c0005fd5:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005fd8:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c0005fdf:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0005fe6:	83 ec 04             	sub    $0x4,%esp
c0005fe9:	6a 01                	push   $0x1
c0005feb:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0005ff1:	50                   	push   %eax
c0005ff2:	6a 03                	push   $0x3
c0005ff4:	e8 43 40 00 00       	call   c000a03c <send_rec>
c0005ff9:	83 c4 10             	add    $0x10,%esp
c0005ffc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005fff:	83 f8 65             	cmp    $0x65,%eax
c0006002:	74 19                	je     c000601d <exec+0x6c>
c0006004:	6a 19                	push   $0x19
c0006006:	68 72 b4 00 c0       	push   $0xc000b472
c000600b:	68 72 b4 00 c0       	push   $0xc000b472
c0006010:	68 7d b4 00 c0       	push   $0xc000b47d
c0006015:	e8 e5 36 00 00       	call   c00096ff <assertion_failure>
c000601a:	83 c4 10             	add    $0x10,%esp
c000601d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006020:	c9                   	leave  
c0006021:	c3                   	ret    

c0006022 <execv>:
c0006022:	55                   	push   %ebp
c0006023:	89 e5                	mov    %esp,%ebp
c0006025:	81 ec a8 00 00 00    	sub    $0xa8,%esp
c000602b:	83 ec 0c             	sub    $0xc,%esp
c000602e:	68 00 04 00 00       	push   $0x400
c0006033:	e8 8c c6 ff ff       	call   c00026c4 <sys_malloc>
c0006038:	83 c4 10             	add    $0x10,%esp
c000603b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000603e:	83 ec 04             	sub    $0x4,%esp
c0006041:	68 00 04 00 00       	push   $0x400
c0006046:	6a 00                	push   $0x0
c0006048:	ff 75 e0             	pushl  -0x20(%ebp)
c000604b:	e8 a7 5d 00 00       	call   c000bdf7 <Memset>
c0006050:	83 c4 10             	add    $0x10,%esp
c0006053:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006056:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006059:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006060:	eb 23                	jmp    c0006085 <execv+0x63>
c0006062:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006065:	8b 00                	mov    (%eax),%eax
c0006067:	83 ec 08             	sub    $0x8,%esp
c000606a:	50                   	push   %eax
c000606b:	68 95 b4 00 c0       	push   $0xc000b495
c0006070:	e8 2d 33 00 00       	call   c00093a2 <Printf>
c0006075:	83 c4 10             	add    $0x10,%esp
c0006078:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c000607c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000607f:	83 c0 04             	add    $0x4,%eax
c0006082:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006085:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006088:	8b 00                	mov    (%eax),%eax
c000608a:	85 c0                	test   %eax,%eax
c000608c:	75 d4                	jne    c0006062 <execv+0x40>
c000608e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006091:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006094:	01 d0                	add    %edx,%eax
c0006096:	c6 00 00             	movb   $0x0,(%eax)
c0006099:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000609c:	83 c0 04             	add    $0x4,%eax
c000609f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00060a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00060a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00060a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00060ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00060ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00060b5:	eb 5b                	jmp    c0006112 <execv+0xf0>
c00060b7:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00060ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00060bd:	01 c2                	add    %eax,%edx
c00060bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00060c2:	89 10                	mov    %edx,(%eax)
c00060c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00060c7:	8b 00                	mov    (%eax),%eax
c00060c9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
c00060cc:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00060cf:	01 ca                	add    %ecx,%edx
c00060d1:	83 ec 08             	sub    $0x8,%esp
c00060d4:	50                   	push   %eax
c00060d5:	52                   	push   %edx
c00060d6:	e8 3b 5d 00 00       	call   c000be16 <Strcpy>
c00060db:	83 c4 10             	add    $0x10,%esp
c00060de:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00060e1:	8b 00                	mov    (%eax),%eax
c00060e3:	83 ec 0c             	sub    $0xc,%esp
c00060e6:	50                   	push   %eax
c00060e7:	e8 44 5d 00 00       	call   c000be30 <Strlen>
c00060ec:	83 c4 10             	add    $0x10,%esp
c00060ef:	01 45 f0             	add    %eax,-0x10(%ebp)
c00060f2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00060f5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00060f8:	01 d0                	add    %edx,%eax
c00060fa:	c6 00 00             	movb   $0x0,(%eax)
c00060fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006100:	83 c0 01             	add    $0x1,%eax
c0006103:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006106:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c000610a:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000610e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006112:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006115:	8b 00                	mov    (%eax),%eax
c0006117:	85 c0                	test   %eax,%eax
c0006119:	75 9c                	jne    c00060b7 <execv+0x95>
c000611b:	83 ec 0c             	sub    $0xc,%esp
c000611e:	ff 75 08             	pushl  0x8(%ebp)
c0006121:	e8 f4 0d 00 00       	call   c0006f1a <get_physical_address>
c0006126:	83 c4 10             	add    $0x10,%esp
c0006129:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000612c:	83 ec 0c             	sub    $0xc,%esp
c000612f:	ff 75 e0             	pushl  -0x20(%ebp)
c0006132:	e8 e3 0d 00 00       	call   c0006f1a <get_physical_address>
c0006137:	83 c4 10             	add    $0x10,%esp
c000613a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000613d:	83 ec 0c             	sub    $0xc,%esp
c0006140:	68 00 00 00 c0       	push   $0xc0000000
c0006145:	e8 d0 0d 00 00       	call   c0006f1a <get_physical_address>
c000614a:	83 c4 10             	add    $0x10,%esp
c000614d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006150:	c7 45 d0 02 00 00 00 	movl   $0x2,-0x30(%ebp)
c0006157:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000615a:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000615d:	83 ec 0c             	sub    $0xc,%esp
c0006160:	ff 75 08             	pushl  0x8(%ebp)
c0006163:	e8 c8 5c 00 00       	call   c000be30 <Strlen>
c0006168:	83 c4 10             	add    $0x10,%esp
c000616b:	89 45 98             	mov    %eax,-0x68(%ebp)
c000616e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006171:	89 85 68 ff ff ff    	mov    %eax,-0x98(%ebp)
c0006177:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000617a:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0006180:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006183:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0006189:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000618c:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0006192:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006195:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c000619a:	29 c2                	sub    %eax,%edx
c000619c:	89 d0                	mov    %edx,%eax
c000619e:	89 45 80             	mov    %eax,-0x80(%ebp)
c00061a1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00061a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00061a7:	01 d0                	add    %edx,%eax
c00061a9:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c00061ae:	29 c2                	sub    %eax,%edx
c00061b0:	89 d0                	mov    %edx,%eax
c00061b2:	89 45 84             	mov    %eax,-0x7c(%ebp)
c00061b5:	83 ec 04             	sub    $0x4,%esp
c00061b8:	6a 01                	push   $0x1
c00061ba:	8d 85 58 ff ff ff    	lea    -0xa8(%ebp),%eax
c00061c0:	50                   	push   %eax
c00061c1:	6a 03                	push   $0x3
c00061c3:	e8 74 3e 00 00       	call   c000a03c <send_rec>
c00061c8:	83 c4 10             	add    $0x10,%esp
c00061cb:	83 ec 08             	sub    $0x8,%esp
c00061ce:	68 00 04 00 00       	push   $0x400
c00061d3:	ff 75 e0             	pushl  -0x20(%ebp)
c00061d6:	e8 fe c4 ff ff       	call   c00026d9 <sys_free>
c00061db:	83 c4 10             	add    $0x10,%esp
c00061de:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00061e1:	83 f8 65             	cmp    $0x65,%eax
c00061e4:	74 1c                	je     c0006202 <execv+0x1e0>
c00061e6:	68 90 00 00 00       	push   $0x90
c00061eb:	68 72 b4 00 c0       	push   $0xc000b472
c00061f0:	68 72 b4 00 c0       	push   $0xc000b472
c00061f5:	68 7d b4 00 c0       	push   $0xc000b47d
c00061fa:	e8 00 35 00 00       	call   c00096ff <assertion_failure>
c00061ff:	83 c4 10             	add    $0x10,%esp
c0006202:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006205:	c9                   	leave  
c0006206:	c3                   	ret    

c0006207 <execl>:
c0006207:	55                   	push   %ebp
c0006208:	89 e5                	mov    %esp,%ebp
c000620a:	83 ec 18             	sub    $0x18,%esp
c000620d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0006210:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006213:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006216:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006219:	83 ec 08             	sub    $0x8,%esp
c000621c:	ff 75 f0             	pushl  -0x10(%ebp)
c000621f:	ff 75 08             	pushl  0x8(%ebp)
c0006222:	e8 fb fd ff ff       	call   c0006022 <execv>
c0006227:	83 c4 10             	add    $0x10,%esp
c000622a:	c9                   	leave  
c000622b:	c3                   	ret    

c000622c <TaskMM>:
c000622c:	55                   	push   %ebp
c000622d:	89 e5                	mov    %esp,%ebp
c000622f:	83 ec 28             	sub    $0x28,%esp
c0006232:	83 ec 0c             	sub    $0xc,%esp
c0006235:	6a 7c                	push   $0x7c
c0006237:	e8 88 c4 ff ff       	call   c00026c4 <sys_malloc>
c000623c:	83 c4 10             	add    $0x10,%esp
c000623f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006242:	83 ec 0c             	sub    $0xc,%esp
c0006245:	6a 7c                	push   $0x7c
c0006247:	e8 78 c4 ff ff       	call   c00026c4 <sys_malloc>
c000624c:	83 c4 10             	add    $0x10,%esp
c000624f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006252:	83 ec 04             	sub    $0x4,%esp
c0006255:	6a 12                	push   $0x12
c0006257:	ff 75 f0             	pushl  -0x10(%ebp)
c000625a:	6a 02                	push   $0x2
c000625c:	e8 db 3d 00 00       	call   c000a03c <send_rec>
c0006261:	83 c4 10             	add    $0x10,%esp
c0006264:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006267:	8b 40 78             	mov    0x78(%eax),%eax
c000626a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000626d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006270:	8b 00                	mov    (%eax),%eax
c0006272:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006275:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000627c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000627f:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0006286:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006289:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0006290:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0006294:	74 4e                	je     c00062e4 <TaskMM+0xb8>
c0006296:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c000629a:	7f 08                	jg     c00062a4 <TaskMM+0x78>
c000629c:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c00062a0:	74 28                	je     c00062ca <TaskMM+0x9e>
c00062a2:	eb 71                	jmp    c0006315 <TaskMM+0xe9>
c00062a4:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c00062a8:	74 08                	je     c00062b2 <TaskMM+0x86>
c00062aa:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00062ae:	74 4e                	je     c00062fe <TaskMM+0xd2>
c00062b0:	eb 63                	jmp    c0006315 <TaskMM+0xe9>
c00062b2:	83 ec 0c             	sub    $0xc,%esp
c00062b5:	ff 75 f0             	pushl  -0x10(%ebp)
c00062b8:	e8 73 04 00 00       	call   c0006730 <do_fork>
c00062bd:	83 c4 10             	add    $0x10,%esp
c00062c0:	89 c2                	mov    %eax,%edx
c00062c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00062c5:	89 50 5c             	mov    %edx,0x5c(%eax)
c00062c8:	eb 5c                	jmp    c0006326 <TaskMM+0xfa>
c00062ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062d1:	66 87 db             	xchg   %bx,%bx
c00062d4:	83 ec 0c             	sub    $0xc,%esp
c00062d7:	ff 75 f0             	pushl  -0x10(%ebp)
c00062da:	e8 95 00 00 00       	call   c0006374 <do_exec>
c00062df:	83 c4 10             	add    $0x10,%esp
c00062e2:	eb 42                	jmp    c0006326 <TaskMM+0xfa>
c00062e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062eb:	83 ec 08             	sub    $0x8,%esp
c00062ee:	ff 75 e0             	pushl  -0x20(%ebp)
c00062f1:	ff 75 f0             	pushl  -0x10(%ebp)
c00062f4:	e8 a5 04 00 00       	call   c000679e <do_exit>
c00062f9:	83 c4 10             	add    $0x10,%esp
c00062fc:	eb 28                	jmp    c0006326 <TaskMM+0xfa>
c00062fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006305:	83 ec 0c             	sub    $0xc,%esp
c0006308:	ff 75 f0             	pushl  -0x10(%ebp)
c000630b:	e8 8a 05 00 00       	call   c000689a <do_wait>
c0006310:	83 c4 10             	add    $0x10,%esp
c0006313:	eb 11                	jmp    c0006326 <TaskMM+0xfa>
c0006315:	83 ec 0c             	sub    $0xc,%esp
c0006318:	68 9f b4 00 c0       	push   $0xc000b49f
c000631d:	e8 bf 33 00 00       	call   c00096e1 <panic>
c0006322:	83 c4 10             	add    $0x10,%esp
c0006325:	90                   	nop
c0006326:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000632a:	0f 84 22 ff ff ff    	je     c0006252 <TaskMM+0x26>
c0006330:	83 ec 0c             	sub    $0xc,%esp
c0006333:	6a 03                	push   $0x3
c0006335:	e8 34 2f 00 00       	call   c000926e <delay>
c000633a:	83 c4 10             	add    $0x10,%esp
c000633d:	83 ec 04             	sub    $0x4,%esp
c0006340:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006343:	ff 75 ec             	pushl  -0x14(%ebp)
c0006346:	6a 01                	push   $0x1
c0006348:	e8 ef 3c 00 00       	call   c000a03c <send_rec>
c000634d:	83 c4 10             	add    $0x10,%esp
c0006350:	e9 fd fe ff ff       	jmp    c0006252 <TaskMM+0x26>

c0006355 <alloc_mem>:
c0006355:	55                   	push   %ebp
c0006356:	89 e5                	mov    %esp,%ebp
c0006358:	83 ec 10             	sub    $0x10,%esp
c000635b:	8b 45 08             	mov    0x8(%ebp),%eax
c000635e:	83 e8 08             	sub    $0x8,%eax
c0006361:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0006367:	05 00 00 a0 00       	add    $0xa00000,%eax
c000636c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000636f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006372:	c9                   	leave  
c0006373:	c3                   	ret    

c0006374 <do_exec>:
c0006374:	55                   	push   %ebp
c0006375:	89 e5                	mov    %esp,%ebp
c0006377:	81 ec 28 01 00 00    	sub    $0x128,%esp
c000637d:	c7 85 62 ff ff ff 64 	movl   $0x5f766564,-0x9e(%ebp)
c0006384:	65 76 5f 
c0006387:	c7 85 66 ff ff ff 74 	movl   $0x31797474,-0x9a(%ebp)
c000638e:	74 79 31 
c0006391:	66 c7 85 6a ff ff ff 	movw   $0x0,-0x96(%ebp)
c0006398:	00 00 
c000639a:	83 ec 08             	sub    $0x8,%esp
c000639d:	6a 00                	push   $0x0
c000639f:	8d 85 62 ff ff ff    	lea    -0x9e(%ebp),%eax
c00063a5:	50                   	push   %eax
c00063a6:	e8 13 f8 ff ff       	call   c0005bbe <open>
c00063ab:	83 c4 10             	add    $0x10,%esp
c00063ae:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00063b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00063b4:	8b 00                	mov    (%eax),%eax
c00063b6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00063b9:	c7 45 d0 00 30 03 00 	movl   $0x33000,-0x30(%ebp)
c00063c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00063c3:	83 ec 0c             	sub    $0xc,%esp
c00063c6:	50                   	push   %eax
c00063c7:	e8 f8 c2 ff ff       	call   c00026c4 <sys_malloc>
c00063cc:	83 c4 10             	add    $0x10,%esp
c00063cf:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00063d2:	83 ec 04             	sub    $0x4,%esp
c00063d5:	ff 75 d0             	pushl  -0x30(%ebp)
c00063d8:	6a 00                	push   $0x0
c00063da:	ff 75 cc             	pushl  -0x34(%ebp)
c00063dd:	e8 15 5a 00 00       	call   c000bdf7 <Memset>
c00063e2:	83 c4 10             	add    $0x10,%esp
c00063e5:	83 ec 04             	sub    $0x4,%esp
c00063e8:	6a 0c                	push   $0xc
c00063ea:	6a 00                	push   $0x0
c00063ec:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c00063f2:	50                   	push   %eax
c00063f3:	e8 ff 59 00 00       	call   c000bdf7 <Memset>
c00063f8:	83 c4 10             	add    $0x10,%esp
c00063fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00063fe:	8b 40 44             	mov    0x44(%eax),%eax
c0006401:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006404:	8b 45 08             	mov    0x8(%ebp),%eax
c0006407:	8b 40 40             	mov    0x40(%eax),%eax
c000640a:	83 ec 08             	sub    $0x8,%esp
c000640d:	50                   	push   %eax
c000640e:	ff 75 c8             	pushl  -0x38(%ebp)
c0006411:	e8 36 0a 00 00       	call   c0006e4c <alloc_virtual_memory>
c0006416:	83 c4 10             	add    $0x10,%esp
c0006419:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000641c:	8b 45 08             	mov    0x8(%ebp),%eax
c000641f:	8b 40 40             	mov    0x40(%eax),%eax
c0006422:	89 c2                	mov    %eax,%edx
c0006424:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006427:	83 ec 04             	sub    $0x4,%esp
c000642a:	52                   	push   %edx
c000642b:	50                   	push   %eax
c000642c:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c0006432:	50                   	push   %eax
c0006433:	e8 50 17 00 00       	call   c0007b88 <Memcpy>
c0006438:	83 c4 10             	add    $0x10,%esp
c000643b:	8b 45 08             	mov    0x8(%ebp),%eax
c000643e:	8b 40 40             	mov    0x40(%eax),%eax
c0006441:	c6 84 05 56 ff ff ff 	movb   $0x0,-0xaa(%ebp,%eax,1)
c0006448:	00 
c0006449:	83 ec 08             	sub    $0x8,%esp
c000644c:	6a 00                	push   $0x0
c000644e:	8d 85 56 ff ff ff    	lea    -0xaa(%ebp),%eax
c0006454:	50                   	push   %eax
c0006455:	e8 64 f7 ff ff       	call   c0005bbe <open>
c000645a:	83 c4 10             	add    $0x10,%esp
c000645d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006460:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
c0006464:	75 15                	jne    c000647b <do_exec+0x107>
c0006466:	83 ec 0c             	sub    $0xc,%esp
c0006469:	68 b0 b4 00 c0       	push   $0xc000b4b0
c000646e:	e8 2f 2f 00 00       	call   c00093a2 <Printf>
c0006473:	83 c4 10             	add    $0x10,%esp
c0006476:	e9 b3 02 00 00       	jmp    c000672e <do_exec+0x3ba>
c000647b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006482:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006485:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006488:	01 d0                	add    %edx,%eax
c000648a:	83 ec 04             	sub    $0x4,%esp
c000648d:	68 00 10 00 00       	push   $0x1000
c0006492:	50                   	push   %eax
c0006493:	ff 75 c0             	pushl  -0x40(%ebp)
c0006496:	e8 b8 f7 ff ff       	call   c0005c53 <read>
c000649b:	83 c4 10             	add    $0x10,%esp
c000649e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00064a1:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00064a4:	01 45 f4             	add    %eax,-0xc(%ebp)
c00064a7:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
c00064ab:	74 0a                	je     c00064b7 <do_exec+0x143>
c00064ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00064b0:	3b 45 d0             	cmp    -0x30(%ebp),%eax
c00064b3:	7d 05                	jge    c00064ba <do_exec+0x146>
c00064b5:	eb cb                	jmp    c0006482 <do_exec+0x10e>
c00064b7:	90                   	nop
c00064b8:	eb 01                	jmp    c00064bb <do_exec+0x147>
c00064ba:	90                   	nop
c00064bb:	83 ec 0c             	sub    $0xc,%esp
c00064be:	ff 75 c0             	pushl  -0x40(%ebp)
c00064c1:	e8 93 f9 ff ff       	call   c0005e59 <close>
c00064c6:	83 c4 10             	add    $0x10,%esp
c00064c9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00064cc:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00064cf:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00064d2:	8b 40 18             	mov    0x18(%eax),%eax
c00064d5:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00064d8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00064df:	e9 e6 00 00 00       	jmp    c00065ca <do_exec+0x256>
c00064e4:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00064e7:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00064eb:	0f b7 d0             	movzwl %ax,%edx
c00064ee:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00064f1:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00064f5:	0f b7 c0             	movzwl %ax,%eax
c00064f8:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00064fc:	01 c2                	add    %eax,%edx
c00064fe:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006501:	01 d0                	add    %edx,%eax
c0006503:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006506:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006509:	8b 40 10             	mov    0x10(%eax),%eax
c000650c:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000650f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006512:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006517:	c1 e8 0c             	shr    $0xc,%eax
c000651a:	89 45 a8             	mov    %eax,-0x58(%ebp)
c000651d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006520:	8b 40 08             	mov    0x8(%eax),%eax
c0006523:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006526:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000652d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006530:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0006533:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0006536:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006539:	8b 50 04             	mov    0x4(%eax),%edx
c000653c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000653f:	01 d0                	add    %edx,%eax
c0006541:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0006544:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c0006548:	74 7b                	je     c00065c5 <do_exec+0x251>
c000654a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006551:	eb 41                	jmp    c0006594 <do_exec+0x220>
c0006553:	83 ec 08             	sub    $0x8,%esp
c0006556:	ff 75 d4             	pushl  -0x2c(%ebp)
c0006559:	ff 75 ec             	pushl  -0x14(%ebp)
c000655c:	e8 eb 09 00 00       	call   c0006f4c <alloc_physical_memory_of_proc>
c0006561:	83 c4 10             	add    $0x10,%esp
c0006564:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0006567:	83 ec 08             	sub    $0x8,%esp
c000656a:	68 00 10 00 00       	push   $0x1000
c000656f:	ff 75 9c             	pushl  -0x64(%ebp)
c0006572:	e8 d5 08 00 00       	call   c0006e4c <alloc_virtual_memory>
c0006577:	83 c4 10             	add    $0x10,%esp
c000657a:	89 45 98             	mov    %eax,-0x68(%ebp)
c000657d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006581:	75 06                	jne    c0006589 <do_exec+0x215>
c0006583:	8b 45 98             	mov    -0x68(%ebp),%eax
c0006586:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006589:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0006590:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006594:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006597:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c000659a:	77 b7                	ja     c0006553 <do_exec+0x1df>
c000659c:	66 87 db             	xchg   %bx,%bx
c000659f:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00065a2:	8b 40 10             	mov    0x10(%eax),%eax
c00065a5:	89 c1                	mov    %eax,%ecx
c00065a7:	8b 55 cc             	mov    -0x34(%ebp),%edx
c00065aa:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00065ad:	01 c2                	add    %eax,%edx
c00065af:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00065b2:	83 ec 04             	sub    $0x4,%esp
c00065b5:	51                   	push   %ecx
c00065b6:	52                   	push   %edx
c00065b7:	50                   	push   %eax
c00065b8:	e8 cb 15 00 00       	call   c0007b88 <Memcpy>
c00065bd:	83 c4 10             	add    $0x10,%esp
c00065c0:	66 87 db             	xchg   %bx,%bx
c00065c3:	eb 01                	jmp    c00065c6 <do_exec+0x252>
c00065c5:	90                   	nop
c00065c6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00065ca:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00065cd:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c00065d1:	0f b7 c0             	movzwl %ax,%eax
c00065d4:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00065d7:	0f 8c 07 ff ff ff    	jl     c00064e4 <do_exec+0x170>
c00065dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00065e0:	8b 40 10             	mov    0x10(%eax),%eax
c00065e3:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00065e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00065e9:	8b 40 1c             	mov    0x1c(%eax),%eax
c00065ec:	89 45 90             	mov    %eax,-0x70(%ebp)
c00065ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00065f2:	8b 40 24             	mov    0x24(%eax),%eax
c00065f5:	89 45 8c             	mov    %eax,-0x74(%ebp)
c00065f8:	83 ec 0c             	sub    $0xc,%esp
c00065fb:	ff 75 d4             	pushl  -0x2c(%ebp)
c00065fe:	e8 b9 e2 ff ff       	call   c00048bc <pid2proc>
c0006603:	83 c4 10             	add    $0x10,%esp
c0006606:	89 45 88             	mov    %eax,-0x78(%ebp)
c0006609:	8b 45 08             	mov    0x8(%ebp),%eax
c000660c:	8b 40 10             	mov    0x10(%eax),%eax
c000660f:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0006612:	83 ec 08             	sub    $0x8,%esp
c0006615:	ff 75 90             	pushl  -0x70(%ebp)
c0006618:	ff 75 84             	pushl  -0x7c(%ebp)
c000661b:	e8 2c 08 00 00       	call   c0006e4c <alloc_virtual_memory>
c0006620:	83 c4 10             	add    $0x10,%esp
c0006623:	89 45 80             	mov    %eax,-0x80(%ebp)
c0006626:	8b 45 08             	mov    0x8(%ebp),%eax
c0006629:	8b 40 2c             	mov    0x2c(%eax),%eax
c000662c:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0006632:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006639:	8b 45 80             	mov    -0x80(%ebp),%eax
c000663c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000663f:	eb 1a                	jmp    c000665b <do_exec+0x2e7>
c0006641:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0006645:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006648:	8b 10                	mov    (%eax),%edx
c000664a:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0006650:	01 c2                	add    %eax,%edx
c0006652:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006655:	89 10                	mov    %edx,(%eax)
c0006657:	83 45 dc 04          	addl   $0x4,-0x24(%ebp)
c000665b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000665e:	8b 00                	mov    (%eax),%eax
c0006660:	85 c0                	test   %eax,%eax
c0006662:	75 dd                	jne    c0006641 <do_exec+0x2cd>
c0006664:	8b 45 08             	mov    0x8(%ebp),%eax
c0006667:	8b 40 28             	mov    0x28(%eax),%eax
c000666a:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0006670:	83 ec 0c             	sub    $0xc,%esp
c0006673:	ff 75 88             	pushl  -0x78(%ebp)
c0006676:	e8 9f 08 00 00       	call   c0006f1a <get_physical_address>
c000667b:	83 c4 10             	add    $0x10,%esp
c000667e:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c0006684:	83 ec 08             	sub    $0x8,%esp
c0006687:	68 00 10 00 00       	push   $0x1000
c000668c:	ff b5 74 ff ff ff    	pushl  -0x8c(%ebp)
c0006692:	e8 b5 07 00 00       	call   c0006e4c <alloc_virtual_memory>
c0006697:	83 c4 10             	add    $0x10,%esp
c000669a:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c00066a0:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c00066a6:	05 bc 0f 00 00       	add    $0xfbc,%eax
c00066ab:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00066b1:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00066b7:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c00066bd:	89 50 2c             	mov    %edx,0x2c(%eax)
c00066c0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00066c3:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00066c9:	89 50 28             	mov    %edx,0x28(%eax)
c00066cc:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00066cf:	8b 40 18             	mov    0x18(%eax),%eax
c00066d2:	89 c2                	mov    %eax,%edx
c00066d4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00066da:	89 50 30             	mov    %edx,0x30(%eax)
c00066dd:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00066e3:	8b 95 78 ff ff ff    	mov    -0x88(%ebp),%edx
c00066e9:	89 50 3c             	mov    %edx,0x3c(%eax)
c00066ec:	8b 45 88             	mov    -0x78(%ebp),%eax
c00066ef:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00066f6:	00 00 00 
c00066f9:	c7 85 50 ff ff ff 65 	movl   $0x65,-0xb0(%ebp)
c0006700:	00 00 00 
c0006703:	c7 85 30 ff ff ff 00 	movl   $0x0,-0xd0(%ebp)
c000670a:	00 00 00 
c000670d:	c7 85 34 ff ff ff 00 	movl   $0x0,-0xcc(%ebp)
c0006714:	00 00 00 
c0006717:	83 ec 04             	sub    $0x4,%esp
c000671a:	ff 75 d4             	pushl  -0x2c(%ebp)
c000671d:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
c0006723:	50                   	push   %eax
c0006724:	6a 01                	push   $0x1
c0006726:	e8 11 39 00 00       	call   c000a03c <send_rec>
c000672b:	83 c4 10             	add    $0x10,%esp
c000672e:	c9                   	leave  
c000672f:	c3                   	ret    

c0006730 <do_fork>:
c0006730:	55                   	push   %ebp
c0006731:	89 e5                	mov    %esp,%ebp
c0006733:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0006739:	8b 45 08             	mov    0x8(%ebp),%eax
c000673c:	8b 00                	mov    (%eax),%eax
c000673e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006741:	83 ec 0c             	sub    $0xc,%esp
c0006744:	ff 75 f4             	pushl  -0xc(%ebp)
c0006747:	e8 60 41 00 00       	call   c000a8ac <fork_process>
c000674c:	83 c4 10             	add    $0x10,%esp
c000674f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006752:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006755:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000675b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000675e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006761:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0006767:	8b 45 08             	mov    0x8(%ebp),%eax
c000676a:	89 50 5c             	mov    %edx,0x5c(%eax)
c000676d:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006774:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c000677b:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006782:	83 ec 04             	sub    $0x4,%esp
c0006785:	ff 75 ec             	pushl  -0x14(%ebp)
c0006788:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c000678e:	50                   	push   %eax
c000678f:	6a 01                	push   $0x1
c0006791:	e8 a6 38 00 00       	call   c000a03c <send_rec>
c0006796:	83 c4 10             	add    $0x10,%esp
c0006799:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000679c:	c9                   	leave  
c000679d:	c3                   	ret    

c000679e <do_exit>:
c000679e:	55                   	push   %ebp
c000679f:	89 e5                	mov    %esp,%ebp
c00067a1:	83 ec 18             	sub    $0x18,%esp
c00067a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00067a7:	8b 00                	mov    (%eax),%eax
c00067a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00067ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00067af:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00067b5:	05 00 32 08 c0       	add    $0xc0083200,%eax
c00067ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00067bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00067c0:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c00067c6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00067c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00067cc:	8b 40 54             	mov    0x54(%eax),%eax
c00067cf:	89 c2                	mov    %eax,%edx
c00067d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00067d4:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c00067da:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00067dd:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00067e3:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00067e8:	0f b6 00             	movzbl (%eax),%eax
c00067eb:	3c 04                	cmp    $0x4,%al
c00067ed:	75 21                	jne    c0006810 <do_exit+0x72>
c00067ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00067f2:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00067f8:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00067fd:	c6 00 fb             	movb   $0xfb,(%eax)
c0006800:	83 ec 0c             	sub    $0xc,%esp
c0006803:	ff 75 ec             	pushl  -0x14(%ebp)
c0006806:	e8 5c 01 00 00       	call   c0006967 <cleanup>
c000680b:	83 c4 10             	add    $0x10,%esp
c000680e:	eb 0a                	jmp    c000681a <do_exit+0x7c>
c0006810:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006813:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c000681a:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006821:	eb 6e                	jmp    c0006891 <do_exit+0xf3>
c0006823:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006826:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000682c:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006831:	8b 00                	mov    (%eax),%eax
c0006833:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006836:	75 55                	jne    c000688d <do_exit+0xef>
c0006838:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000683b:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006841:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006846:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c000684c:	0f b6 05 81 44 08 c0 	movzbl 0xc0084481,%eax
c0006853:	3c 04                	cmp    $0x4,%al
c0006855:	75 36                	jne    c000688d <do_exit+0xef>
c0006857:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000685a:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006860:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006865:	0f b6 00             	movzbl (%eax),%eax
c0006868:	3c 03                	cmp    $0x3,%al
c000686a:	75 21                	jne    c000688d <do_exit+0xef>
c000686c:	c6 05 81 44 08 c0 fb 	movb   $0xfb,0xc0084481
c0006873:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006876:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000687c:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006881:	83 ec 0c             	sub    $0xc,%esp
c0006884:	50                   	push   %eax
c0006885:	e8 dd 00 00 00       	call   c0006967 <cleanup>
c000688a:	83 c4 10             	add    $0x10,%esp
c000688d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006891:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006895:	7e 8c                	jle    c0006823 <do_exit+0x85>
c0006897:	90                   	nop
c0006898:	c9                   	leave  
c0006899:	c3                   	ret    

c000689a <do_wait>:
c000689a:	55                   	push   %ebp
c000689b:	89 e5                	mov    %esp,%ebp
c000689d:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00068a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00068a6:	8b 00                	mov    (%eax),%eax
c00068a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00068ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00068b2:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c00068b9:	eb 5f                	jmp    c000691a <do_wait+0x80>
c00068bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068be:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00068c4:	05 64 34 08 c0       	add    $0xc0083464,%eax
c00068c9:	8b 00                	mov    (%eax),%eax
c00068cb:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c00068ce:	75 46                	jne    c0006916 <do_wait+0x7c>
c00068d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00068d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068d7:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00068dd:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00068e2:	0f b6 00             	movzbl (%eax),%eax
c00068e5:	3c 03                	cmp    $0x3,%al
c00068e7:	75 2d                	jne    c0006916 <do_wait+0x7c>
c00068e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068ec:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00068f2:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00068f7:	c6 00 fb             	movb   $0xfb,(%eax)
c00068fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00068fd:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006903:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006908:	83 ec 0c             	sub    $0xc,%esp
c000690b:	50                   	push   %eax
c000690c:	e8 56 00 00 00       	call   c0006967 <cleanup>
c0006911:	83 c4 10             	add    $0x10,%esp
c0006914:	eb 4f                	jmp    c0006965 <do_wait+0xcb>
c0006916:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000691a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000691e:	7e 9b                	jle    c00068bb <do_wait+0x21>
c0006920:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006924:	74 13                	je     c0006939 <do_wait+0x9f>
c0006926:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006929:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000692f:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006934:	c6 00 04             	movb   $0x4,(%eax)
c0006937:	eb 2c                	jmp    c0006965 <do_wait+0xcb>
c0006939:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006940:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006947:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c000694e:	83 ec 04             	sub    $0x4,%esp
c0006951:	ff 75 ec             	pushl  -0x14(%ebp)
c0006954:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c000695a:	50                   	push   %eax
c000695b:	6a 01                	push   $0x1
c000695d:	e8 da 36 00 00       	call   c000a03c <send_rec>
c0006962:	83 c4 10             	add    $0x10,%esp
c0006965:	c9                   	leave  
c0006966:	c3                   	ret    

c0006967 <cleanup>:
c0006967:	55                   	push   %ebp
c0006968:	89 e5                	mov    %esp,%ebp
c000696a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006970:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006977:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c000697e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006981:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006987:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000698a:	8b 45 08             	mov    0x8(%ebp),%eax
c000698d:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006993:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006996:	8b 45 08             	mov    0x8(%ebp),%eax
c0006999:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c000699f:	83 ec 04             	sub    $0x4,%esp
c00069a2:	50                   	push   %eax
c00069a3:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c00069a9:	50                   	push   %eax
c00069aa:	6a 01                	push   $0x1
c00069ac:	e8 8b 36 00 00       	call   c000a03c <send_rec>
c00069b1:	83 c4 10             	add    $0x10,%esp
c00069b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00069b7:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c00069be:	90                   	nop
c00069bf:	c9                   	leave  
c00069c0:	c3                   	ret    

c00069c1 <init_bitmap>:
c00069c1:	55                   	push   %ebp
c00069c2:	89 e5                	mov    %esp,%ebp
c00069c4:	83 ec 08             	sub    $0x8,%esp
c00069c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00069ca:	8b 50 04             	mov    0x4(%eax),%edx
c00069cd:	8b 45 08             	mov    0x8(%ebp),%eax
c00069d0:	8b 00                	mov    (%eax),%eax
c00069d2:	83 ec 04             	sub    $0x4,%esp
c00069d5:	52                   	push   %edx
c00069d6:	6a 00                	push   $0x0
c00069d8:	50                   	push   %eax
c00069d9:	e8 19 54 00 00       	call   c000bdf7 <Memset>
c00069de:	83 c4 10             	add    $0x10,%esp
c00069e1:	90                   	nop
c00069e2:	c9                   	leave  
c00069e3:	c3                   	ret    

c00069e4 <test_bit_val>:
c00069e4:	55                   	push   %ebp
c00069e5:	89 e5                	mov    %esp,%ebp
c00069e7:	53                   	push   %ebx
c00069e8:	83 ec 10             	sub    $0x10,%esp
c00069eb:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069ee:	8d 50 07             	lea    0x7(%eax),%edx
c00069f1:	85 c0                	test   %eax,%eax
c00069f3:	0f 48 c2             	cmovs  %edx,%eax
c00069f6:	c1 f8 03             	sar    $0x3,%eax
c00069f9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069fc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069ff:	99                   	cltd   
c0006a00:	c1 ea 1d             	shr    $0x1d,%edx
c0006a03:	01 d0                	add    %edx,%eax
c0006a05:	83 e0 07             	and    $0x7,%eax
c0006a08:	29 d0                	sub    %edx,%eax
c0006a0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a10:	8b 10                	mov    (%eax),%edx
c0006a12:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a15:	01 d0                	add    %edx,%eax
c0006a17:	0f b6 00             	movzbl (%eax),%eax
c0006a1a:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006a1d:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a24:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006a29:	89 c1                	mov    %eax,%ecx
c0006a2b:	d3 e3                	shl    %cl,%ebx
c0006a2d:	89 d8                	mov    %ebx,%eax
c0006a2f:	21 c2                	and    %eax,%edx
c0006a31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a34:	89 c1                	mov    %eax,%ecx
c0006a36:	d3 fa                	sar    %cl,%edx
c0006a38:	89 d0                	mov    %edx,%eax
c0006a3a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a3d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006a41:	0f 9f c0             	setg   %al
c0006a44:	0f b6 c0             	movzbl %al,%eax
c0006a47:	83 c4 10             	add    $0x10,%esp
c0006a4a:	5b                   	pop    %ebx
c0006a4b:	5d                   	pop    %ebp
c0006a4c:	c3                   	ret    

c0006a4d <set_bit_val>:
c0006a4d:	55                   	push   %ebp
c0006a4e:	89 e5                	mov    %esp,%ebp
c0006a50:	83 ec 10             	sub    $0x10,%esp
c0006a53:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a56:	8d 50 07             	lea    0x7(%eax),%edx
c0006a59:	85 c0                	test   %eax,%eax
c0006a5b:	0f 48 c2             	cmovs  %edx,%eax
c0006a5e:	c1 f8 03             	sar    $0x3,%eax
c0006a61:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a64:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a67:	99                   	cltd   
c0006a68:	c1 ea 1d             	shr    $0x1d,%edx
c0006a6b:	01 d0                	add    %edx,%eax
c0006a6d:	83 e0 07             	and    $0x7,%eax
c0006a70:	29 d0                	sub    %edx,%eax
c0006a72:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a75:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a78:	8b 10                	mov    (%eax),%edx
c0006a7a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a7d:	01 d0                	add    %edx,%eax
c0006a7f:	0f b6 00             	movzbl (%eax),%eax
c0006a82:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006a85:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006a89:	7e 13                	jle    c0006a9e <set_bit_val+0x51>
c0006a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a8e:	ba 01 00 00 00       	mov    $0x1,%edx
c0006a93:	89 c1                	mov    %eax,%ecx
c0006a95:	d3 e2                	shl    %cl,%edx
c0006a97:	89 d0                	mov    %edx,%eax
c0006a99:	08 45 ff             	or     %al,-0x1(%ebp)
c0006a9c:	eb 13                	jmp    c0006ab1 <set_bit_val+0x64>
c0006a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006aa1:	ba 01 00 00 00       	mov    $0x1,%edx
c0006aa6:	89 c1                	mov    %eax,%ecx
c0006aa8:	d3 e2                	shl    %cl,%edx
c0006aaa:	89 d0                	mov    %edx,%eax
c0006aac:	f7 d0                	not    %eax
c0006aae:	20 45 ff             	and    %al,-0x1(%ebp)
c0006ab1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ab4:	8b 10                	mov    (%eax),%edx
c0006ab6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006ab9:	01 c2                	add    %eax,%edx
c0006abb:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006abf:	88 02                	mov    %al,(%edx)
c0006ac1:	b8 01 00 00 00       	mov    $0x1,%eax
c0006ac6:	c9                   	leave  
c0006ac7:	c3                   	ret    

c0006ac8 <set_bits>:
c0006ac8:	55                   	push   %ebp
c0006ac9:	89 e5                	mov    %esp,%ebp
c0006acb:	83 ec 10             	sub    $0x10,%esp
c0006ace:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006ad5:	eb 1c                	jmp    c0006af3 <set_bits+0x2b>
c0006ad7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ada:	8d 50 01             	lea    0x1(%eax),%edx
c0006add:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006ae0:	ff 75 10             	pushl  0x10(%ebp)
c0006ae3:	50                   	push   %eax
c0006ae4:	ff 75 08             	pushl  0x8(%ebp)
c0006ae7:	e8 61 ff ff ff       	call   c0006a4d <set_bit_val>
c0006aec:	83 c4 0c             	add    $0xc,%esp
c0006aef:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006af3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006af6:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006af9:	7c dc                	jl     c0006ad7 <set_bits+0xf>
c0006afb:	b8 01 00 00 00       	mov    $0x1,%eax
c0006b00:	c9                   	leave  
c0006b01:	c3                   	ret    

c0006b02 <get_first_free_bit>:
c0006b02:	55                   	push   %ebp
c0006b03:	89 e5                	mov    %esp,%ebp
c0006b05:	83 ec 10             	sub    $0x10,%esp
c0006b08:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b0b:	8b 40 04             	mov    0x4(%eax),%eax
c0006b0e:	c1 e0 03             	shl    $0x3,%eax
c0006b11:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b14:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b17:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b1a:	eb 1b                	jmp    c0006b37 <get_first_free_bit+0x35>
c0006b1c:	ff 75 fc             	pushl  -0x4(%ebp)
c0006b1f:	ff 75 08             	pushl  0x8(%ebp)
c0006b22:	e8 bd fe ff ff       	call   c00069e4 <test_bit_val>
c0006b27:	83 c4 08             	add    $0x8,%esp
c0006b2a:	85 c0                	test   %eax,%eax
c0006b2c:	75 05                	jne    c0006b33 <get_first_free_bit+0x31>
c0006b2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006b31:	eb 11                	jmp    c0006b44 <get_first_free_bit+0x42>
c0006b33:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006b37:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006b3a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006b3d:	7c dd                	jl     c0006b1c <get_first_free_bit+0x1a>
c0006b3f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006b44:	c9                   	leave  
c0006b45:	c3                   	ret    

c0006b46 <get_bits>:
c0006b46:	55                   	push   %ebp
c0006b47:	89 e5                	mov    %esp,%ebp
c0006b49:	83 ec 20             	sub    $0x20,%esp
c0006b4c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006b53:	ff 75 f0             	pushl  -0x10(%ebp)
c0006b56:	ff 75 08             	pushl  0x8(%ebp)
c0006b59:	e8 a4 ff ff ff       	call   c0006b02 <get_first_free_bit>
c0006b5e:	83 c4 08             	add    $0x8,%esp
c0006b61:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b64:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b67:	8b 40 04             	mov    0x4(%eax),%eax
c0006b6a:	c1 e0 03             	shl    $0x3,%eax
c0006b6d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b70:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b73:	83 e8 01             	sub    $0x1,%eax
c0006b76:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b79:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006b7d:	75 08                	jne    c0006b87 <get_bits+0x41>
c0006b7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b82:	e9 85 00 00 00       	jmp    c0006c0c <get_bits+0xc6>
c0006b87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b8a:	83 c0 01             	add    $0x1,%eax
c0006b8d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b90:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b93:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b96:	eb 58                	jmp    c0006bf0 <get_bits+0xaa>
c0006b98:	ff 75 f8             	pushl  -0x8(%ebp)
c0006b9b:	ff 75 08             	pushl  0x8(%ebp)
c0006b9e:	e8 41 fe ff ff       	call   c00069e4 <test_bit_val>
c0006ba3:	83 c4 08             	add    $0x8,%esp
c0006ba6:	85 c0                	test   %eax,%eax
c0006ba8:	75 0a                	jne    c0006bb4 <get_bits+0x6e>
c0006baa:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006bae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006bb2:	eb 2b                	jmp    c0006bdf <get_bits+0x99>
c0006bb4:	6a 00                	push   $0x0
c0006bb6:	ff 75 08             	pushl  0x8(%ebp)
c0006bb9:	e8 44 ff ff ff       	call   c0006b02 <get_first_free_bit>
c0006bbe:	83 c4 08             	add    $0x8,%esp
c0006bc1:	83 c0 01             	add    $0x1,%eax
c0006bc4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006bc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006bca:	83 c0 01             	add    $0x1,%eax
c0006bcd:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006bd0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006bd3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bd6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006bd9:	83 e8 01             	sub    $0x1,%eax
c0006bdc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006bdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006be2:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006be5:	7c 09                	jl     c0006bf0 <get_bits+0xaa>
c0006be7:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006bee:	eb 0d                	jmp    c0006bfd <get_bits+0xb7>
c0006bf0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006bf3:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006bf6:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006bf9:	85 c0                	test   %eax,%eax
c0006bfb:	7f 9b                	jg     c0006b98 <get_bits+0x52>
c0006bfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c00:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006c03:	83 c0 01             	add    $0x1,%eax
c0006c06:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c09:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c0c:	c9                   	leave  
c0006c0d:	c3                   	ret    

c0006c0e <get_a_page2>:
c0006c0e:	55                   	push   %ebp
c0006c0f:	89 e5                	mov    %esp,%ebp
c0006c11:	83 ec 18             	sub    $0x18,%esp
c0006c14:	83 ec 0c             	sub    $0xc,%esp
c0006c17:	ff 75 0c             	pushl  0xc(%ebp)
c0006c1a:	e8 1e 00 00 00       	call   c0006c3d <get_a_page>
c0006c1f:	83 c4 10             	add    $0x10,%esp
c0006c22:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c25:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006c28:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c2b:	83 ec 08             	sub    $0x8,%esp
c0006c2e:	52                   	push   %edx
c0006c2f:	50                   	push   %eax
c0006c30:	e8 86 01 00 00       	call   c0006dbb <add_map_entry>
c0006c35:	83 c4 10             	add    $0x10,%esp
c0006c38:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c3b:	c9                   	leave  
c0006c3c:	c3                   	ret    

c0006c3d <get_a_page>:
c0006c3d:	55                   	push   %ebp
c0006c3e:	89 e5                	mov    %esp,%ebp
c0006c40:	83 ec 28             	sub    $0x28,%esp
c0006c43:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006c47:	75 22                	jne    c0006c6b <get_a_page+0x2e>
c0006c49:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006c4e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c51:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006c56:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c59:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006c5e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c61:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006c66:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c69:	eb 20                	jmp    c0006c8b <get_a_page+0x4e>
c0006c6b:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006c70:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c73:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0006c78:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c7b:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c0006c80:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c83:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0006c88:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c8b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006c8e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006c91:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006c94:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006c97:	6a 01                	push   $0x1
c0006c99:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006c9c:	50                   	push   %eax
c0006c9d:	e8 a4 fe ff ff       	call   c0006b46 <get_bits>
c0006ca2:	83 c4 08             	add    $0x8,%esp
c0006ca5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ca8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0006cac:	75 1c                	jne    c0006cca <get_a_page+0x8d>
c0006cae:	68 8c 00 00 00       	push   $0x8c
c0006cb3:	68 c0 b4 00 c0       	push   $0xc000b4c0
c0006cb8:	68 c0 b4 00 c0       	push   $0xc000b4c0
c0006cbd:	68 ca b4 00 c0       	push   $0xc000b4ca
c0006cc2:	e8 38 2a 00 00       	call   c00096ff <assertion_failure>
c0006cc7:	83 c4 10             	add    $0x10,%esp
c0006cca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ccd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006cd0:	c1 e2 0c             	shl    $0xc,%edx
c0006cd3:	01 d0                	add    %edx,%eax
c0006cd5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006cd8:	83 ec 04             	sub    $0x4,%esp
c0006cdb:	6a 01                	push   $0x1
c0006cdd:	ff 75 f4             	pushl  -0xc(%ebp)
c0006ce0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006ce3:	50                   	push   %eax
c0006ce4:	e8 64 fd ff ff       	call   c0006a4d <set_bit_val>
c0006ce9:	83 c4 10             	add    $0x10,%esp
c0006cec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006cef:	c9                   	leave  
c0006cf0:	c3                   	ret    

c0006cf1 <get_virtual_address>:
c0006cf1:	55                   	push   %ebp
c0006cf2:	89 e5                	mov    %esp,%ebp
c0006cf4:	83 ec 28             	sub    $0x28,%esp
c0006cf7:	e8 9b a8 ff ff       	call   c0001597 <get_running_thread_pcb>
c0006cfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006cff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006d03:	75 1a                	jne    c0006d1f <get_virtual_address+0x2e>
c0006d05:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006d0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006d0d:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006d12:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006d15:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006d1a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006d1d:	eb 18                	jmp    c0006d37 <get_virtual_address+0x46>
c0006d1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d22:	8b 40 0c             	mov    0xc(%eax),%eax
c0006d25:	83 ec 04             	sub    $0x4,%esp
c0006d28:	6a 0c                	push   $0xc
c0006d2a:	50                   	push   %eax
c0006d2b:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006d2e:	50                   	push   %eax
c0006d2f:	e8 54 0e 00 00       	call   c0007b88 <Memcpy>
c0006d34:	83 c4 10             	add    $0x10,%esp
c0006d37:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006d3a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006d3d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006d40:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006d43:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d46:	83 ec 08             	sub    $0x8,%esp
c0006d49:	50                   	push   %eax
c0006d4a:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006d4d:	50                   	push   %eax
c0006d4e:	e8 f3 fd ff ff       	call   c0006b46 <get_bits>
c0006d53:	83 c4 10             	add    $0x10,%esp
c0006d56:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d59:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006d5c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006d5f:	c1 e2 0c             	shl    $0xc,%edx
c0006d62:	01 d0                	add    %edx,%eax
c0006d64:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d67:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d6a:	50                   	push   %eax
c0006d6b:	6a 01                	push   $0x1
c0006d6d:	ff 75 f0             	pushl  -0x10(%ebp)
c0006d70:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006d73:	50                   	push   %eax
c0006d74:	e8 4f fd ff ff       	call   c0006ac8 <set_bits>
c0006d79:	83 c4 10             	add    $0x10,%esp
c0006d7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d7f:	c9                   	leave  
c0006d80:	c3                   	ret    

c0006d81 <ptr_pde>:
c0006d81:	55                   	push   %ebp
c0006d82:	89 e5                	mov    %esp,%ebp
c0006d84:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d87:	c1 e8 16             	shr    $0x16,%eax
c0006d8a:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006d8f:	c1 e0 02             	shl    $0x2,%eax
c0006d92:	5d                   	pop    %ebp
c0006d93:	c3                   	ret    

c0006d94 <ptr_pte>:
c0006d94:	55                   	push   %ebp
c0006d95:	89 e5                	mov    %esp,%ebp
c0006d97:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d9a:	c1 e8 0a             	shr    $0xa,%eax
c0006d9d:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006da2:	89 c2                	mov    %eax,%edx
c0006da4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006da7:	c1 e8 0c             	shr    $0xc,%eax
c0006daa:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006daf:	c1 e0 02             	shl    $0x2,%eax
c0006db2:	01 d0                	add    %edx,%eax
c0006db4:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006db9:	5d                   	pop    %ebp
c0006dba:	c3                   	ret    

c0006dbb <add_map_entry>:
c0006dbb:	55                   	push   %ebp
c0006dbc:	89 e5                	mov    %esp,%ebp
c0006dbe:	83 ec 18             	sub    $0x18,%esp
c0006dc1:	ff 75 08             	pushl  0x8(%ebp)
c0006dc4:	e8 b8 ff ff ff       	call   c0006d81 <ptr_pde>
c0006dc9:	83 c4 04             	add    $0x4,%esp
c0006dcc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006dcf:	ff 75 08             	pushl  0x8(%ebp)
c0006dd2:	e8 bd ff ff ff       	call   c0006d94 <ptr_pte>
c0006dd7:	83 c4 04             	add    $0x4,%esp
c0006dda:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ddd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006de0:	8b 00                	mov    (%eax),%eax
c0006de2:	83 e0 01             	and    $0x1,%eax
c0006de5:	85 c0                	test   %eax,%eax
c0006de7:	74 1b                	je     c0006e04 <add_map_entry+0x49>
c0006de9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006dec:	8b 00                	mov    (%eax),%eax
c0006dee:	83 e0 01             	and    $0x1,%eax
c0006df1:	85 c0                	test   %eax,%eax
c0006df3:	75 54                	jne    c0006e49 <add_map_entry+0x8e>
c0006df5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006df8:	83 c8 07             	or     $0x7,%eax
c0006dfb:	89 c2                	mov    %eax,%edx
c0006dfd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e00:	89 10                	mov    %edx,(%eax)
c0006e02:	eb 45                	jmp    c0006e49 <add_map_entry+0x8e>
c0006e04:	83 ec 0c             	sub    $0xc,%esp
c0006e07:	6a 00                	push   $0x0
c0006e09:	e8 2f fe ff ff       	call   c0006c3d <get_a_page>
c0006e0e:	83 c4 10             	add    $0x10,%esp
c0006e11:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e14:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e17:	83 c8 07             	or     $0x7,%eax
c0006e1a:	89 c2                	mov    %eax,%edx
c0006e1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e1f:	89 10                	mov    %edx,(%eax)
c0006e21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e24:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e29:	83 ec 04             	sub    $0x4,%esp
c0006e2c:	68 00 10 00 00       	push   $0x1000
c0006e31:	6a 00                	push   $0x0
c0006e33:	50                   	push   %eax
c0006e34:	e8 be 4f 00 00       	call   c000bdf7 <Memset>
c0006e39:	83 c4 10             	add    $0x10,%esp
c0006e3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e3f:	83 c8 07             	or     $0x7,%eax
c0006e42:	89 c2                	mov    %eax,%edx
c0006e44:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e47:	89 10                	mov    %edx,(%eax)
c0006e49:	90                   	nop
c0006e4a:	c9                   	leave  
c0006e4b:	c3                   	ret    

c0006e4c <alloc_virtual_memory>:
c0006e4c:	55                   	push   %ebp
c0006e4d:	89 e5                	mov    %esp,%ebp
c0006e4f:	83 ec 28             	sub    $0x28,%esp
c0006e52:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e55:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e60:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0006e63:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006e66:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e69:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0006e6c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006e6f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006e74:	c1 e8 0c             	shr    $0xc,%eax
c0006e77:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006e7a:	e8 18 a7 ff ff       	call   c0001597 <get_running_thread_pcb>
c0006e7f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006e82:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006e85:	8b 40 08             	mov    0x8(%eax),%eax
c0006e88:	85 c0                	test   %eax,%eax
c0006e8a:	75 09                	jne    c0006e95 <alloc_virtual_memory+0x49>
c0006e8c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006e93:	eb 07                	jmp    c0006e9c <alloc_virtual_memory+0x50>
c0006e95:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006e9c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006ea3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006eaa:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0006eb1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006eb8:	eb 47                	jmp    c0006f01 <alloc_virtual_memory+0xb5>
c0006eba:	83 ec 08             	sub    $0x8,%esp
c0006ebd:	ff 75 f0             	pushl  -0x10(%ebp)
c0006ec0:	6a 01                	push   $0x1
c0006ec2:	e8 2a fe ff ff       	call   c0006cf1 <get_virtual_address>
c0006ec7:	83 c4 10             	add    $0x10,%esp
c0006eca:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006ecd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006ed1:	74 13                	je     c0006ee6 <alloc_virtual_memory+0x9a>
c0006ed3:	83 ec 0c             	sub    $0xc,%esp
c0006ed6:	ff 75 f0             	pushl  -0x10(%ebp)
c0006ed9:	e8 5f fd ff ff       	call   c0006c3d <get_a_page>
c0006ede:	83 c4 10             	add    $0x10,%esp
c0006ee1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ee4:	eb 06                	jmp    c0006eec <alloc_virtual_memory+0xa0>
c0006ee6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006ee9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006eec:	83 ec 08             	sub    $0x8,%esp
c0006eef:	ff 75 f4             	pushl  -0xc(%ebp)
c0006ef2:	ff 75 d8             	pushl  -0x28(%ebp)
c0006ef5:	e8 c1 fe ff ff       	call   c0006dbb <add_map_entry>
c0006efa:	83 c4 10             	add    $0x10,%esp
c0006efd:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006f01:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006f04:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0006f07:	72 b1                	jb     c0006eba <alloc_virtual_memory+0x6e>
c0006f09:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f0c:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006f11:	89 c2                	mov    %eax,%edx
c0006f13:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f16:	01 d0                	add    %edx,%eax
c0006f18:	c9                   	leave  
c0006f19:	c3                   	ret    

c0006f1a <get_physical_address>:
c0006f1a:	55                   	push   %ebp
c0006f1b:	89 e5                	mov    %esp,%ebp
c0006f1d:	83 ec 10             	sub    $0x10,%esp
c0006f20:	ff 75 08             	pushl  0x8(%ebp)
c0006f23:	e8 6c fe ff ff       	call   c0006d94 <ptr_pte>
c0006f28:	83 c4 04             	add    $0x4,%esp
c0006f2b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006f2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006f31:	8b 00                	mov    (%eax),%eax
c0006f33:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006f38:	89 c2                	mov    %eax,%edx
c0006f3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f3d:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006f42:	09 d0                	or     %edx,%eax
c0006f44:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006f47:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006f4a:	c9                   	leave  
c0006f4b:	c3                   	ret    

c0006f4c <alloc_physical_memory_of_proc>:
c0006f4c:	55                   	push   %ebp
c0006f4d:	89 e5                	mov    %esp,%ebp
c0006f4f:	83 ec 38             	sub    $0x38,%esp
c0006f52:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f55:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006f5a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f5d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006f64:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006f67:	83 ec 0c             	sub    $0xc,%esp
c0006f6a:	50                   	push   %eax
c0006f6b:	e8 4c d9 ff ff       	call   c00048bc <pid2proc>
c0006f70:	83 c4 10             	add    $0x10,%esp
c0006f73:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f76:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f79:	8b 40 0c             	mov    0xc(%eax),%eax
c0006f7c:	83 ec 04             	sub    $0x4,%esp
c0006f7f:	6a 0c                	push   $0xc
c0006f81:	50                   	push   %eax
c0006f82:	8d 45 d0             	lea    -0x30(%ebp),%eax
c0006f85:	50                   	push   %eax
c0006f86:	e8 fd 0b 00 00       	call   c0007b88 <Memcpy>
c0006f8b:	83 c4 10             	add    $0x10,%esp
c0006f8e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f91:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0006f94:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006f97:	89 55 cc             	mov    %edx,-0x34(%ebp)
c0006f9a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006f9d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006fa0:	29 c2                	sub    %eax,%edx
c0006fa2:	89 d0                	mov    %edx,%eax
c0006fa4:	c1 e8 0c             	shr    $0xc,%eax
c0006fa7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006faa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006fad:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006fb0:	c1 e2 0c             	shl    $0xc,%edx
c0006fb3:	01 d0                	add    %edx,%eax
c0006fb5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006fb8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006fbb:	6a 01                	push   $0x1
c0006fbd:	6a 01                	push   $0x1
c0006fbf:	50                   	push   %eax
c0006fc0:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0006fc3:	50                   	push   %eax
c0006fc4:	e8 ff fa ff ff       	call   c0006ac8 <set_bits>
c0006fc9:	83 c4 10             	add    $0x10,%esp
c0006fcc:	83 ec 0c             	sub    $0xc,%esp
c0006fcf:	ff 75 f0             	pushl  -0x10(%ebp)
c0006fd2:	e8 66 fc ff ff       	call   c0006c3d <get_a_page>
c0006fd7:	83 c4 10             	add    $0x10,%esp
c0006fda:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006fdd:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0006fe0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fe3:	01 d0                	add    %edx,%eax
c0006fe5:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006fea:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006fed:	83 ec 08             	sub    $0x8,%esp
c0006ff0:	ff 75 dc             	pushl  -0x24(%ebp)
c0006ff3:	ff 75 08             	pushl  0x8(%ebp)
c0006ff6:	e8 c0 fd ff ff       	call   c0006dbb <add_map_entry>
c0006ffb:	83 c4 10             	add    $0x10,%esp
c0006ffe:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007001:	c9                   	leave  
c0007002:	c3                   	ret    

c0007003 <alloc_physical_memory>:
c0007003:	55                   	push   %ebp
c0007004:	89 e5                	mov    %esp,%ebp
c0007006:	83 ec 38             	sub    $0x38,%esp
c0007009:	8b 45 08             	mov    0x8(%ebp),%eax
c000700c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007011:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007014:	e8 7e a5 ff ff       	call   c0001597 <get_running_thread_pcb>
c0007019:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000701c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007020:	75 1a                	jne    c000703c <alloc_physical_memory+0x39>
c0007022:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007027:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000702a:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000702f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007032:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007037:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000703a:	eb 18                	jmp    c0007054 <alloc_physical_memory+0x51>
c000703c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000703f:	8b 40 0c             	mov    0xc(%eax),%eax
c0007042:	83 ec 04             	sub    $0x4,%esp
c0007045:	6a 0c                	push   $0xc
c0007047:	50                   	push   %eax
c0007048:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c000704b:	50                   	push   %eax
c000704c:	e8 37 0b 00 00       	call   c0007b88 <Memcpy>
c0007051:	83 c4 10             	add    $0x10,%esp
c0007054:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007057:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000705a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000705d:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0007060:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007063:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007066:	29 c2                	sub    %eax,%edx
c0007068:	89 d0                	mov    %edx,%eax
c000706a:	c1 e8 0c             	shr    $0xc,%eax
c000706d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007070:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007073:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0007076:	c1 e2 0c             	shl    $0xc,%edx
c0007079:	01 d0                	add    %edx,%eax
c000707b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000707e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007081:	6a 01                	push   $0x1
c0007083:	6a 01                	push   $0x1
c0007085:	50                   	push   %eax
c0007086:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0007089:	50                   	push   %eax
c000708a:	e8 39 fa ff ff       	call   c0006ac8 <set_bits>
c000708f:	83 c4 10             	add    $0x10,%esp
c0007092:	83 ec 0c             	sub    $0xc,%esp
c0007095:	ff 75 0c             	pushl  0xc(%ebp)
c0007098:	e8 a0 fb ff ff       	call   c0006c3d <get_a_page>
c000709d:	83 c4 10             	add    $0x10,%esp
c00070a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00070a3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00070a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00070a9:	01 d0                	add    %edx,%eax
c00070ab:	25 ff 0f 00 00       	and    $0xfff,%eax
c00070b0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00070b3:	83 ec 08             	sub    $0x8,%esp
c00070b6:	ff 75 e0             	pushl  -0x20(%ebp)
c00070b9:	ff 75 08             	pushl  0x8(%ebp)
c00070bc:	e8 fa fc ff ff       	call   c0006dbb <add_map_entry>
c00070c1:	83 c4 10             	add    $0x10,%esp
c00070c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00070c7:	c9                   	leave  
c00070c8:	c3                   	ret    

c00070c9 <alloc_memory>:
c00070c9:	55                   	push   %ebp
c00070ca:	89 e5                	mov    %esp,%ebp
c00070cc:	83 ec 18             	sub    $0x18,%esp
c00070cf:	83 ec 08             	sub    $0x8,%esp
c00070d2:	ff 75 0c             	pushl  0xc(%ebp)
c00070d5:	ff 75 08             	pushl  0x8(%ebp)
c00070d8:	e8 14 fc ff ff       	call   c0006cf1 <get_virtual_address>
c00070dd:	83 c4 10             	add    $0x10,%esp
c00070e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070e6:	2d 00 10 00 00       	sub    $0x1000,%eax
c00070eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070ee:	eb 29                	jmp    c0007119 <alloc_memory+0x50>
c00070f0:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c00070f7:	83 ec 0c             	sub    $0xc,%esp
c00070fa:	ff 75 0c             	pushl  0xc(%ebp)
c00070fd:	e8 3b fb ff ff       	call   c0006c3d <get_a_page>
c0007102:	83 c4 10             	add    $0x10,%esp
c0007105:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007108:	83 ec 08             	sub    $0x8,%esp
c000710b:	ff 75 ec             	pushl  -0x14(%ebp)
c000710e:	ff 75 f4             	pushl  -0xc(%ebp)
c0007111:	e8 a5 fc ff ff       	call   c0006dbb <add_map_entry>
c0007116:	83 c4 10             	add    $0x10,%esp
c0007119:	8b 45 08             	mov    0x8(%ebp),%eax
c000711c:	8d 50 ff             	lea    -0x1(%eax),%edx
c000711f:	89 55 08             	mov    %edx,0x8(%ebp)
c0007122:	85 c0                	test   %eax,%eax
c0007124:	75 ca                	jne    c00070f0 <alloc_memory+0x27>
c0007126:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007129:	c9                   	leave  
c000712a:	c3                   	ret    

c000712b <get_a_virtual_page>:
c000712b:	55                   	push   %ebp
c000712c:	89 e5                	mov    %esp,%ebp
c000712e:	83 ec 18             	sub    $0x18,%esp
c0007131:	83 ec 0c             	sub    $0xc,%esp
c0007134:	ff 75 08             	pushl  0x8(%ebp)
c0007137:	e8 01 fb ff ff       	call   c0006c3d <get_a_page>
c000713c:	83 c4 10             	add    $0x10,%esp
c000713f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007142:	83 ec 08             	sub    $0x8,%esp
c0007145:	ff 75 f4             	pushl  -0xc(%ebp)
c0007148:	ff 75 0c             	pushl  0xc(%ebp)
c000714b:	e8 6b fc ff ff       	call   c0006dbb <add_map_entry>
c0007150:	83 c4 10             	add    $0x10,%esp
c0007153:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007156:	c9                   	leave  
c0007157:	c3                   	ret    

c0007158 <block2arena>:
c0007158:	55                   	push   %ebp
c0007159:	89 e5                	mov    %esp,%ebp
c000715b:	83 ec 10             	sub    $0x10,%esp
c000715e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007161:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007166:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007169:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000716c:	c9                   	leave  
c000716d:	c3                   	ret    

c000716e <sys_malloc2>:
c000716e:	55                   	push   %ebp
c000716f:	89 e5                	mov    %esp,%ebp
c0007171:	83 ec 68             	sub    $0x68,%esp
c0007174:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000717b:	e8 17 a4 ff ff       	call   c0001597 <get_running_thread_pcb>
c0007180:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007183:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007186:	8b 40 08             	mov    0x8(%eax),%eax
c0007189:	85 c0                	test   %eax,%eax
c000718b:	75 10                	jne    c000719d <sys_malloc2+0x2f>
c000718d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007194:	c7 45 ec a0 47 08 c0 	movl   $0xc00847a0,-0x14(%ebp)
c000719b:	eb 10                	jmp    c00071ad <sys_malloc2+0x3f>
c000719d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00071a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00071a7:	83 c0 10             	add    $0x10,%eax
c00071aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00071ad:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c00071b4:	76 52                	jbe    c0007208 <sys_malloc2+0x9a>
c00071b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00071b9:	05 0b 10 00 00       	add    $0x100b,%eax
c00071be:	c1 e8 0c             	shr    $0xc,%eax
c00071c1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00071c4:	83 ec 08             	sub    $0x8,%esp
c00071c7:	ff 75 f0             	pushl  -0x10(%ebp)
c00071ca:	ff 75 d8             	pushl  -0x28(%ebp)
c00071cd:	e8 f7 fe ff ff       	call   c00070c9 <alloc_memory>
c00071d2:	83 c4 10             	add    $0x10,%esp
c00071d5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00071d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00071db:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00071de:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071e1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00071e7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071ea:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c00071f1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071f4:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c00071f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071fb:	05 90 00 00 00       	add    $0x90,%eax
c0007200:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007203:	e9 f0 01 00 00       	jmp    c00073f8 <sys_malloc2+0x28a>
c0007208:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000720f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007216:	eb 26                	jmp    c000723e <sys_malloc2+0xd0>
c0007218:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000721b:	89 d0                	mov    %edx,%eax
c000721d:	01 c0                	add    %eax,%eax
c000721f:	01 d0                	add    %edx,%eax
c0007221:	c1 e0 03             	shl    $0x3,%eax
c0007224:	89 c2                	mov    %eax,%edx
c0007226:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007229:	01 d0                	add    %edx,%eax
c000722b:	8b 00                	mov    (%eax),%eax
c000722d:	39 45 08             	cmp    %eax,0x8(%ebp)
c0007230:	77 08                	ja     c000723a <sys_malloc2+0xcc>
c0007232:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007235:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007238:	eb 0a                	jmp    c0007244 <sys_malloc2+0xd6>
c000723a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000723e:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0007242:	7e d4                	jle    c0007218 <sys_malloc2+0xaa>
c0007244:	83 ec 08             	sub    $0x8,%esp
c0007247:	ff 75 f0             	pushl  -0x10(%ebp)
c000724a:	6a 01                	push   $0x1
c000724c:	e8 78 fe ff ff       	call   c00070c9 <alloc_memory>
c0007251:	83 c4 10             	add    $0x10,%esp
c0007254:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007257:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000725a:	89 d0                	mov    %edx,%eax
c000725c:	01 c0                	add    %eax,%eax
c000725e:	01 d0                	add    %edx,%eax
c0007260:	c1 e0 03             	shl    $0x3,%eax
c0007263:	89 c2                	mov    %eax,%edx
c0007265:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007268:	01 d0                	add    %edx,%eax
c000726a:	83 ec 04             	sub    $0x4,%esp
c000726d:	6a 18                	push   $0x18
c000726f:	50                   	push   %eax
c0007270:	ff 75 cc             	pushl  -0x34(%ebp)
c0007273:	e8 10 09 00 00       	call   c0007b88 <Memcpy>
c0007278:	83 c4 10             	add    $0x10,%esp
c000727b:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0007282:	e8 9d 08 00 00       	call   c0007b24 <intr_disable>
c0007287:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000728a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000728d:	89 d0                	mov    %edx,%eax
c000728f:	01 c0                	add    %eax,%eax
c0007291:	01 d0                	add    %edx,%eax
c0007293:	c1 e0 03             	shl    $0x3,%eax
c0007296:	89 c2                	mov    %eax,%edx
c0007298:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000729b:	01 d0                	add    %edx,%eax
c000729d:	83 c0 08             	add    $0x8,%eax
c00072a0:	83 ec 0c             	sub    $0xc,%esp
c00072a3:	50                   	push   %eax
c00072a4:	e8 6a 38 00 00       	call   c000ab13 <isListEmpty>
c00072a9:	83 c4 10             	add    $0x10,%esp
c00072ac:	3c 01                	cmp    $0x1,%al
c00072ae:	0f 85 c1 00 00 00    	jne    c0007375 <sys_malloc2+0x207>
c00072b4:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c00072bb:	83 ec 08             	sub    $0x8,%esp
c00072be:	ff 75 f0             	pushl  -0x10(%ebp)
c00072c1:	6a 01                	push   $0x1
c00072c3:	e8 01 fe ff ff       	call   c00070c9 <alloc_memory>
c00072c8:	83 c4 10             	add    $0x10,%esp
c00072cb:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00072ce:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00072d1:	83 ec 0c             	sub    $0xc,%esp
c00072d4:	50                   	push   %eax
c00072d5:	e8 7e fe ff ff       	call   c0007158 <block2arena>
c00072da:	83 c4 10             	add    $0x10,%esp
c00072dd:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00072e0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00072e3:	89 d0                	mov    %edx,%eax
c00072e5:	01 c0                	add    %eax,%eax
c00072e7:	01 d0                	add    %edx,%eax
c00072e9:	c1 e0 03             	shl    $0x3,%eax
c00072ec:	89 c2                	mov    %eax,%edx
c00072ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00072f1:	01 d0                	add    %edx,%eax
c00072f3:	8b 50 04             	mov    0x4(%eax),%edx
c00072f6:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00072f9:	89 50 04             	mov    %edx,0x4(%eax)
c00072fc:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00072ff:	8b 00                	mov    (%eax),%eax
c0007301:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007304:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c000730b:	b8 00 10 00 00       	mov    $0x1000,%eax
c0007310:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0007313:	ba 00 00 00 00       	mov    $0x0,%edx
c0007318:	f7 75 b8             	divl   -0x48(%ebp)
c000731b:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000731e:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0007321:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0007324:	01 d0                	add    %edx,%eax
c0007326:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0007329:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007330:	eb 3b                	jmp    c000736d <sys_malloc2+0x1ff>
c0007332:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007335:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0007339:	89 c2                	mov    %eax,%edx
c000733b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000733e:	01 d0                	add    %edx,%eax
c0007340:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0007343:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0007346:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007349:	89 d0                	mov    %edx,%eax
c000734b:	01 c0                	add    %eax,%eax
c000734d:	01 d0                	add    %edx,%eax
c000734f:	c1 e0 03             	shl    $0x3,%eax
c0007352:	89 c2                	mov    %eax,%edx
c0007354:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007357:	01 d0                	add    %edx,%eax
c0007359:	83 c0 08             	add    $0x8,%eax
c000735c:	83 ec 08             	sub    $0x8,%esp
c000735f:	51                   	push   %ecx
c0007360:	50                   	push   %eax
c0007361:	e8 aa 38 00 00       	call   c000ac10 <appendToDoubleLinkList>
c0007366:	83 c4 10             	add    $0x10,%esp
c0007369:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000736d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007370:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0007373:	77 bd                	ja     c0007332 <sys_malloc2+0x1c4>
c0007375:	83 ec 0c             	sub    $0xc,%esp
c0007378:	ff 75 c4             	pushl  -0x3c(%ebp)
c000737b:	e8 cd 07 00 00       	call   c0007b4d <intr_set_status>
c0007380:	83 c4 10             	add    $0x10,%esp
c0007383:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007386:	89 d0                	mov    %edx,%eax
c0007388:	01 c0                	add    %eax,%eax
c000738a:	01 d0                	add    %edx,%eax
c000738c:	c1 e0 03             	shl    $0x3,%eax
c000738f:	89 c2                	mov    %eax,%edx
c0007391:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007394:	01 d0                	add    %edx,%eax
c0007396:	83 c0 08             	add    $0x8,%eax
c0007399:	83 ec 0c             	sub    $0xc,%esp
c000739c:	50                   	push   %eax
c000739d:	e8 d8 39 00 00       	call   c000ad7a <popFromDoubleLinkList>
c00073a2:	83 c4 10             	add    $0x10,%esp
c00073a5:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00073a8:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00073ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00073ae:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c00073b2:	75 1c                	jne    c00073d0 <sys_malloc2+0x262>
c00073b4:	68 ca 01 00 00       	push   $0x1ca
c00073b9:	68 c0 b4 00 c0       	push   $0xc000b4c0
c00073be:	68 c0 b4 00 c0       	push   $0xc000b4c0
c00073c3:	68 d6 b4 00 c0       	push   $0xc000b4d6
c00073c8:	e8 32 23 00 00       	call   c00096ff <assertion_failure>
c00073cd:	83 c4 10             	add    $0x10,%esp
c00073d0:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00073d3:	83 ec 0c             	sub    $0xc,%esp
c00073d6:	50                   	push   %eax
c00073d7:	e8 7c fd ff ff       	call   c0007158 <block2arena>
c00073dc:	83 c4 10             	add    $0x10,%esp
c00073df:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00073e2:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00073e5:	8b 40 04             	mov    0x4(%eax),%eax
c00073e8:	8d 50 ff             	lea    -0x1(%eax),%edx
c00073eb:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00073ee:	89 50 04             	mov    %edx,0x4(%eax)
c00073f1:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c00073f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00073fc:	75 1c                	jne    c000741a <sys_malloc2+0x2ac>
c00073fe:	68 d1 01 00 00       	push   $0x1d1
c0007403:	68 c0 b4 00 c0       	push   $0xc000b4c0
c0007408:	68 c0 b4 00 c0       	push   $0xc000b4c0
c000740d:	68 e8 b4 00 c0       	push   $0xc000b4e8
c0007412:	e8 e8 22 00 00       	call   c00096ff <assertion_failure>
c0007417:	83 c4 10             	add    $0x10,%esp
c000741a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000741d:	c9                   	leave  
c000741e:	c3                   	ret    

c000741f <remove_map_entry>:
c000741f:	55                   	push   %ebp
c0007420:	89 e5                	mov    %esp,%ebp
c0007422:	83 ec 10             	sub    $0x10,%esp
c0007425:	ff 75 08             	pushl  0x8(%ebp)
c0007428:	e8 67 f9 ff ff       	call   c0006d94 <ptr_pte>
c000742d:	83 c4 04             	add    $0x4,%esp
c0007430:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007433:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007436:	8b 10                	mov    (%eax),%edx
c0007438:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000743b:	89 10                	mov    %edx,(%eax)
c000743d:	90                   	nop
c000743e:	c9                   	leave  
c000743f:	c3                   	ret    

c0007440 <free_a_page>:
c0007440:	55                   	push   %ebp
c0007441:	89 e5                	mov    %esp,%ebp
c0007443:	83 ec 20             	sub    $0x20,%esp
c0007446:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000744a:	75 21                	jne    c000746d <free_a_page+0x2d>
c000744c:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007451:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007454:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007459:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000745c:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007461:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007464:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c000746b:	eb 1f                	jmp    c000748c <free_a_page+0x4c>
c000746d:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007472:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007475:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000747a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000747d:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007482:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007485:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c000748c:	8b 45 08             	mov    0x8(%ebp),%eax
c000748f:	c1 e8 0c             	shr    $0xc,%eax
c0007492:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007495:	6a 00                	push   $0x0
c0007497:	ff 75 f8             	pushl  -0x8(%ebp)
c000749a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000749d:	50                   	push   %eax
c000749e:	e8 aa f5 ff ff       	call   c0006a4d <set_bit_val>
c00074a3:	83 c4 0c             	add    $0xc,%esp
c00074a6:	ff 75 08             	pushl  0x8(%ebp)
c00074a9:	e8 6c fa ff ff       	call   c0006f1a <get_physical_address>
c00074ae:	83 c4 04             	add    $0x4,%esp
c00074b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00074b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00074b7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00074bd:	85 c0                	test   %eax,%eax
c00074bf:	0f 48 c2             	cmovs  %edx,%eax
c00074c2:	c1 f8 0c             	sar    $0xc,%eax
c00074c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00074c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00074cb:	6a 00                	push   $0x0
c00074cd:	ff 75 f0             	pushl  -0x10(%ebp)
c00074d0:	50                   	push   %eax
c00074d1:	e8 77 f5 ff ff       	call   c0006a4d <set_bit_val>
c00074d6:	83 c4 0c             	add    $0xc,%esp
c00074d9:	ff 75 08             	pushl  0x8(%ebp)
c00074dc:	e8 3e ff ff ff       	call   c000741f <remove_map_entry>
c00074e1:	83 c4 04             	add    $0x4,%esp
c00074e4:	90                   	nop
c00074e5:	c9                   	leave  
c00074e6:	c3                   	ret    

c00074e7 <sys_free2>:
c00074e7:	55                   	push   %ebp
c00074e8:	89 e5                	mov    %esp,%ebp
c00074ea:	83 ec 58             	sub    $0x58,%esp
c00074ed:	e8 a5 a0 ff ff       	call   c0001597 <get_running_thread_pcb>
c00074f2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00074f5:	e8 2a 06 00 00       	call   c0007b24 <intr_disable>
c00074fa:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00074fd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007500:	8b 40 08             	mov    0x8(%eax),%eax
c0007503:	85 c0                	test   %eax,%eax
c0007505:	75 10                	jne    c0007517 <sys_free2+0x30>
c0007507:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000750e:	c7 45 f0 a0 47 08 c0 	movl   $0xc00847a0,-0x10(%ebp)
c0007515:	eb 10                	jmp    c0007527 <sys_free2+0x40>
c0007517:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000751e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007521:	83 c0 10             	add    $0x10,%eax
c0007524:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007527:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c000752e:	76 4d                	jbe    c000757d <sys_free2+0x96>
c0007530:	8b 45 08             	mov    0x8(%ebp),%eax
c0007533:	83 e8 0c             	sub    $0xc,%eax
c0007536:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007539:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c000753d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007540:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007545:	c1 e8 0c             	shr    $0xc,%eax
c0007548:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000754b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007552:	eb 1c                	jmp    c0007570 <sys_free2+0x89>
c0007554:	83 ec 08             	sub    $0x8,%esp
c0007557:	ff 75 f4             	pushl  -0xc(%ebp)
c000755a:	ff 75 ec             	pushl  -0x14(%ebp)
c000755d:	e8 de fe ff ff       	call   c0007440 <free_a_page>
c0007562:	83 c4 10             	add    $0x10,%esp
c0007565:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c000756c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007570:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007573:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0007576:	77 dc                	ja     c0007554 <sys_free2+0x6d>
c0007578:	e9 dc 00 00 00       	jmp    c0007659 <sys_free2+0x172>
c000757d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007584:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000758b:	eb 26                	jmp    c00075b3 <sys_free2+0xcc>
c000758d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007590:	89 d0                	mov    %edx,%eax
c0007592:	01 c0                	add    %eax,%eax
c0007594:	01 d0                	add    %edx,%eax
c0007596:	c1 e0 03             	shl    $0x3,%eax
c0007599:	89 c2                	mov    %eax,%edx
c000759b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000759e:	01 d0                	add    %edx,%eax
c00075a0:	8b 00                	mov    (%eax),%eax
c00075a2:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00075a5:	77 08                	ja     c00075af <sys_free2+0xc8>
c00075a7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00075aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00075ad:	eb 0a                	jmp    c00075b9 <sys_free2+0xd2>
c00075af:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00075b3:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c00075b7:	7e d4                	jle    c000758d <sys_free2+0xa6>
c00075b9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00075bc:	89 d0                	mov    %edx,%eax
c00075be:	01 c0                	add    %eax,%eax
c00075c0:	01 d0                	add    %edx,%eax
c00075c2:	c1 e0 03             	shl    $0x3,%eax
c00075c5:	89 c2                	mov    %eax,%edx
c00075c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00075ca:	01 d0                	add    %edx,%eax
c00075cc:	8b 10                	mov    (%eax),%edx
c00075ce:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c00075d1:	8b 50 04             	mov    0x4(%eax),%edx
c00075d4:	89 55 b8             	mov    %edx,-0x48(%ebp)
c00075d7:	8b 50 08             	mov    0x8(%eax),%edx
c00075da:	89 55 bc             	mov    %edx,-0x44(%ebp)
c00075dd:	8b 50 0c             	mov    0xc(%eax),%edx
c00075e0:	89 55 c0             	mov    %edx,-0x40(%ebp)
c00075e3:	8b 50 10             	mov    0x10(%eax),%edx
c00075e6:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c00075e9:	8b 40 14             	mov    0x14(%eax),%eax
c00075ec:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00075ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00075f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00075f5:	83 ec 0c             	sub    $0xc,%esp
c00075f8:	ff 75 d0             	pushl  -0x30(%ebp)
c00075fb:	e8 58 fb ff ff       	call   c0007158 <block2arena>
c0007600:	83 c4 10             	add    $0x10,%esp
c0007603:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007606:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007609:	89 d0                	mov    %edx,%eax
c000760b:	01 c0                	add    %eax,%eax
c000760d:	01 d0                	add    %edx,%eax
c000760f:	c1 e0 03             	shl    $0x3,%eax
c0007612:	89 c2                	mov    %eax,%edx
c0007614:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007617:	01 d0                	add    %edx,%eax
c0007619:	83 c0 08             	add    $0x8,%eax
c000761c:	83 ec 08             	sub    $0x8,%esp
c000761f:	ff 75 d0             	pushl  -0x30(%ebp)
c0007622:	50                   	push   %eax
c0007623:	e8 e8 35 00 00       	call   c000ac10 <appendToDoubleLinkList>
c0007628:	83 c4 10             	add    $0x10,%esp
c000762b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000762e:	8b 40 04             	mov    0x4(%eax),%eax
c0007631:	8d 50 01             	lea    0x1(%eax),%edx
c0007634:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007637:	89 50 04             	mov    %edx,0x4(%eax)
c000763a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000763d:	8b 50 04             	mov    0x4(%eax),%edx
c0007640:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007643:	39 c2                	cmp    %eax,%edx
c0007645:	75 12                	jne    c0007659 <sys_free2+0x172>
c0007647:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000764a:	83 ec 08             	sub    $0x8,%esp
c000764d:	ff 75 f4             	pushl  -0xc(%ebp)
c0007650:	50                   	push   %eax
c0007651:	e8 ea fd ff ff       	call   c0007440 <free_a_page>
c0007656:	83 c4 10             	add    $0x10,%esp
c0007659:	83 ec 0c             	sub    $0xc,%esp
c000765c:	ff 75 d8             	pushl  -0x28(%ebp)
c000765f:	e8 e9 04 00 00       	call   c0007b4d <intr_set_status>
c0007664:	83 c4 10             	add    $0x10,%esp
c0007667:	90                   	nop
c0007668:	c9                   	leave  
c0007669:	c3                   	ret    

c000766a <init_memory_block_desc>:
c000766a:	55                   	push   %ebp
c000766b:	89 e5                	mov    %esp,%ebp
c000766d:	83 ec 18             	sub    $0x18,%esp
c0007670:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007677:	e9 b2 00 00 00       	jmp    c000772e <init_memory_block_desc+0xc4>
c000767c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007680:	75 1b                	jne    c000769d <init_memory_block_desc+0x33>
c0007682:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007685:	89 d0                	mov    %edx,%eax
c0007687:	01 c0                	add    %eax,%eax
c0007689:	01 d0                	add    %edx,%eax
c000768b:	c1 e0 03             	shl    $0x3,%eax
c000768e:	89 c2                	mov    %eax,%edx
c0007690:	8b 45 08             	mov    0x8(%ebp),%eax
c0007693:	01 d0                	add    %edx,%eax
c0007695:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000769b:	eb 2e                	jmp    c00076cb <init_memory_block_desc+0x61>
c000769d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076a0:	89 d0                	mov    %edx,%eax
c00076a2:	01 c0                	add    %eax,%eax
c00076a4:	01 d0                	add    %edx,%eax
c00076a6:	c1 e0 03             	shl    $0x3,%eax
c00076a9:	8d 50 e8             	lea    -0x18(%eax),%edx
c00076ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00076af:	01 d0                	add    %edx,%eax
c00076b1:	8b 08                	mov    (%eax),%ecx
c00076b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076b6:	89 d0                	mov    %edx,%eax
c00076b8:	01 c0                	add    %eax,%eax
c00076ba:	01 d0                	add    %edx,%eax
c00076bc:	c1 e0 03             	shl    $0x3,%eax
c00076bf:	89 c2                	mov    %eax,%edx
c00076c1:	8b 45 08             	mov    0x8(%ebp),%eax
c00076c4:	01 d0                	add    %edx,%eax
c00076c6:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c00076c9:	89 10                	mov    %edx,(%eax)
c00076cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076ce:	89 d0                	mov    %edx,%eax
c00076d0:	01 c0                	add    %eax,%eax
c00076d2:	01 d0                	add    %edx,%eax
c00076d4:	c1 e0 03             	shl    $0x3,%eax
c00076d7:	89 c2                	mov    %eax,%edx
c00076d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00076dc:	01 d0                	add    %edx,%eax
c00076de:	8b 00                	mov    (%eax),%eax
c00076e0:	89 c1                	mov    %eax,%ecx
c00076e2:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c00076e7:	ba 00 00 00 00       	mov    $0x0,%edx
c00076ec:	f7 f1                	div    %ecx
c00076ee:	89 c1                	mov    %eax,%ecx
c00076f0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076f3:	89 d0                	mov    %edx,%eax
c00076f5:	01 c0                	add    %eax,%eax
c00076f7:	01 d0                	add    %edx,%eax
c00076f9:	c1 e0 03             	shl    $0x3,%eax
c00076fc:	89 c2                	mov    %eax,%edx
c00076fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0007701:	01 d0                	add    %edx,%eax
c0007703:	89 ca                	mov    %ecx,%edx
c0007705:	89 50 04             	mov    %edx,0x4(%eax)
c0007708:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000770b:	89 d0                	mov    %edx,%eax
c000770d:	01 c0                	add    %eax,%eax
c000770f:	01 d0                	add    %edx,%eax
c0007711:	c1 e0 03             	shl    $0x3,%eax
c0007714:	89 c2                	mov    %eax,%edx
c0007716:	8b 45 08             	mov    0x8(%ebp),%eax
c0007719:	01 d0                	add    %edx,%eax
c000771b:	83 c0 08             	add    $0x8,%eax
c000771e:	83 ec 0c             	sub    $0xc,%esp
c0007721:	50                   	push   %eax
c0007722:	e8 be 33 00 00       	call   c000aae5 <initDoubleLinkList>
c0007727:	83 c4 10             	add    $0x10,%esp
c000772a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000772e:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0007732:	0f 8e 44 ff ff ff    	jle    c000767c <init_memory_block_desc+0x12>
c0007738:	90                   	nop
c0007739:	c9                   	leave  
c000773a:	c3                   	ret    

c000773b <init_memory2>:
c000773b:	55                   	push   %ebp
c000773c:	89 e5                	mov    %esp,%ebp
c000773e:	83 ec 38             	sub    $0x38,%esp
c0007741:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0007748:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c000774f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007752:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007757:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000775a:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000775f:	29 c2                	sub    %eax,%edx
c0007761:	89 d0                	mov    %edx,%eax
c0007763:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007766:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007769:	89 c2                	mov    %eax,%edx
c000776b:	c1 ea 1f             	shr    $0x1f,%edx
c000776e:	01 d0                	add    %edx,%eax
c0007770:	d1 f8                	sar    %eax
c0007772:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c0007777:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000777c:	83 ec 0c             	sub    $0xc,%esp
c000777f:	50                   	push   %eax
c0007780:	e8 ec 07 00 00       	call   c0007f71 <disp_int>
c0007785:	83 c4 10             	add    $0x10,%esp
c0007788:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000778d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007790:	29 c2                	sub    %eax,%edx
c0007792:	89 d0                	mov    %edx,%eax
c0007794:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c0007799:	83 ec 0c             	sub    $0xc,%esp
c000779c:	68 f4 b4 00 c0       	push   $0xc000b4f4
c00077a1:	e8 e6 9a ff ff       	call   c000128c <disp_str>
c00077a6:	83 c4 10             	add    $0x10,%esp
c00077a9:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00077ae:	83 ec 0c             	sub    $0xc,%esp
c00077b1:	50                   	push   %eax
c00077b2:	e8 ba 07 00 00       	call   c0007f71 <disp_int>
c00077b7:	83 c4 10             	add    $0x10,%esp
c00077ba:	83 ec 0c             	sub    $0xc,%esp
c00077bd:	68 f4 b4 00 c0       	push   $0xc000b4f4
c00077c2:	e8 c5 9a ff ff       	call   c000128c <disp_str>
c00077c7:	83 c4 10             	add    $0x10,%esp
c00077ca:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00077cf:	05 ff 0f 00 00       	add    $0xfff,%eax
c00077d4:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00077da:	85 c0                	test   %eax,%eax
c00077dc:	0f 48 c2             	cmovs  %edx,%eax
c00077df:	c1 f8 0c             	sar    $0xc,%eax
c00077e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00077e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077e8:	83 c0 07             	add    $0x7,%eax
c00077eb:	8d 50 07             	lea    0x7(%eax),%edx
c00077ee:	85 c0                	test   %eax,%eax
c00077f0:	0f 48 c2             	cmovs  %edx,%eax
c00077f3:	c1 f8 03             	sar    $0x3,%eax
c00077f6:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c00077fb:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007800:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0007805:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c000780a:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007810:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007815:	83 ec 04             	sub    $0x4,%esp
c0007818:	52                   	push   %edx
c0007819:	6a 00                	push   $0x0
c000781b:	50                   	push   %eax
c000781c:	e8 d6 45 00 00       	call   c000bdf7 <Memset>
c0007821:	83 c4 10             	add    $0x10,%esp
c0007824:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0007829:	05 ff 0f 00 00       	add    $0xfff,%eax
c000782e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007834:	85 c0                	test   %eax,%eax
c0007836:	0f 48 c2             	cmovs  %edx,%eax
c0007839:	c1 f8 0c             	sar    $0xc,%eax
c000783c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000783f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007842:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007845:	ff 75 e8             	pushl  -0x18(%ebp)
c0007848:	6a 01                	push   $0x1
c000784a:	6a 00                	push   $0x0
c000784c:	68 ac 16 01 c0       	push   $0xc00116ac
c0007851:	e8 72 f2 ff ff       	call   c0006ac8 <set_bits>
c0007856:	83 c4 10             	add    $0x10,%esp
c0007859:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c000785e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007863:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007869:	85 c0                	test   %eax,%eax
c000786b:	0f 48 c2             	cmovs  %edx,%eax
c000786e:	c1 f8 0c             	sar    $0xc,%eax
c0007871:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007874:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007877:	83 c0 07             	add    $0x7,%eax
c000787a:	8d 50 07             	lea    0x7(%eax),%edx
c000787d:	85 c0                	test   %eax,%eax
c000787f:	0f 48 c2             	cmovs  %edx,%eax
c0007882:	c1 f8 03             	sar    $0x3,%eax
c0007885:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c000788a:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000788f:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007895:	01 d0                	add    %edx,%eax
c0007897:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c000789c:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c00078a2:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c00078a7:	83 ec 04             	sub    $0x4,%esp
c00078aa:	52                   	push   %edx
c00078ab:	6a 00                	push   $0x0
c00078ad:	50                   	push   %eax
c00078ae:	e8 44 45 00 00       	call   c000bdf7 <Memset>
c00078b3:	83 c4 10             	add    $0x10,%esp
c00078b6:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00078bb:	05 ff 0f 00 00       	add    $0xfff,%eax
c00078c0:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078c6:	85 c0                	test   %eax,%eax
c00078c8:	0f 48 c2             	cmovs  %edx,%eax
c00078cb:	c1 f8 0c             	sar    $0xc,%eax
c00078ce:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00078d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00078d4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00078d7:	ff 75 e8             	pushl  -0x18(%ebp)
c00078da:	6a 01                	push   $0x1
c00078dc:	ff 75 e0             	pushl  -0x20(%ebp)
c00078df:	68 ac 16 01 c0       	push   $0xc00116ac
c00078e4:	e8 df f1 ff ff       	call   c0006ac8 <set_bits>
c00078e9:	83 c4 10             	add    $0x10,%esp
c00078ec:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c00078f3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00078f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078fc:	83 c0 07             	add    $0x7,%eax
c00078ff:	8d 50 07             	lea    0x7(%eax),%edx
c0007902:	85 c0                	test   %eax,%eax
c0007904:	0f 48 c2             	cmovs  %edx,%eax
c0007907:	c1 f8 03             	sar    $0x3,%eax
c000790a:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c000790f:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007914:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c000791a:	01 c2                	add    %eax,%edx
c000791c:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007921:	01 d0                	add    %edx,%eax
c0007923:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007928:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c000792e:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007933:	83 ec 04             	sub    $0x4,%esp
c0007936:	52                   	push   %edx
c0007937:	6a 00                	push   $0x0
c0007939:	50                   	push   %eax
c000793a:	e8 b8 44 00 00       	call   c000bdf7 <Memset>
c000793f:	83 c4 10             	add    $0x10,%esp
c0007942:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007945:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007948:	01 d0                	add    %edx,%eax
c000794a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000794d:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007952:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007957:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000795d:	85 c0                	test   %eax,%eax
c000795f:	0f 48 c2             	cmovs  %edx,%eax
c0007962:	c1 f8 0c             	sar    $0xc,%eax
c0007965:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007968:	ff 75 e8             	pushl  -0x18(%ebp)
c000796b:	6a 01                	push   $0x1
c000796d:	ff 75 e0             	pushl  -0x20(%ebp)
c0007970:	68 ac 16 01 c0       	push   $0xc00116ac
c0007975:	e8 4e f1 ff ff       	call   c0006ac8 <set_bits>
c000797a:	83 c4 10             	add    $0x10,%esp
c000797d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007980:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007983:	01 d0                	add    %edx,%eax
c0007985:	c1 e0 0c             	shl    $0xc,%eax
c0007988:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c000798d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007990:	83 c0 02             	add    $0x2,%eax
c0007993:	c1 e0 0c             	shl    $0xc,%eax
c0007996:	89 c2                	mov    %eax,%edx
c0007998:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000799b:	01 d0                	add    %edx,%eax
c000799d:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c00079a2:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00079a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00079ac:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00079af:	90                   	nop
c00079b0:	c9                   	leave  
c00079b1:	c3                   	ret    

c00079b2 <init_memory>:
c00079b2:	55                   	push   %ebp
c00079b3:	89 e5                	mov    %esp,%ebp
c00079b5:	83 ec 38             	sub    $0x38,%esp
c00079b8:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c00079bf:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c00079c6:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c00079cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00079d0:	05 00 00 10 00       	add    $0x100000,%eax
c00079d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00079d8:	8b 45 08             	mov    0x8(%ebp),%eax
c00079db:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00079de:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00079e4:	85 c0                	test   %eax,%eax
c00079e6:	0f 48 c2             	cmovs  %edx,%eax
c00079e9:	c1 f8 0c             	sar    $0xc,%eax
c00079ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00079ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00079f2:	89 c2                	mov    %eax,%edx
c00079f4:	c1 ea 1f             	shr    $0x1f,%edx
c00079f7:	01 d0                	add    %edx,%eax
c00079f9:	d1 f8                	sar    %eax
c00079fb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00079fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007a01:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007a04:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007a07:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007a0a:	8d 50 07             	lea    0x7(%eax),%edx
c0007a0d:	85 c0                	test   %eax,%eax
c0007a0f:	0f 48 c2             	cmovs  %edx,%eax
c0007a12:	c1 f8 03             	sar    $0x3,%eax
c0007a15:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007a18:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007a1b:	8d 50 07             	lea    0x7(%eax),%edx
c0007a1e:	85 c0                	test   %eax,%eax
c0007a20:	0f 48 c2             	cmovs  %edx,%eax
c0007a23:	c1 f8 03             	sar    $0x3,%eax
c0007a26:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007a29:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a2c:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007a31:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007a36:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007a39:	c1 e2 0c             	shl    $0xc,%edx
c0007a3c:	01 d0                	add    %edx,%eax
c0007a3e:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c0007a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a46:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007a4b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a4e:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007a53:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007a58:	83 ec 04             	sub    $0x4,%esp
c0007a5b:	ff 75 d8             	pushl  -0x28(%ebp)
c0007a5e:	6a 00                	push   $0x0
c0007a60:	50                   	push   %eax
c0007a61:	e8 91 43 00 00       	call   c000bdf7 <Memset>
c0007a66:	83 c4 10             	add    $0x10,%esp
c0007a69:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007a6c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a6f:	01 d0                	add    %edx,%eax
c0007a71:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007a76:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007a79:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007a7e:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007a83:	83 ec 04             	sub    $0x4,%esp
c0007a86:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007a89:	6a 00                	push   $0x0
c0007a8b:	50                   	push   %eax
c0007a8c:	e8 66 43 00 00       	call   c000bdf7 <Memset>
c0007a91:	83 c4 10             	add    $0x10,%esp
c0007a94:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a97:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007a9c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007a9f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007aa2:	01 c2                	add    %eax,%edx
c0007aa4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007aa7:	01 d0                	add    %edx,%eax
c0007aa9:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007aae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007ab1:	05 00 00 10 00       	add    $0x100000,%eax
c0007ab6:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007abb:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007ac0:	83 ec 04             	sub    $0x4,%esp
c0007ac3:	ff 75 d8             	pushl  -0x28(%ebp)
c0007ac6:	6a 00                	push   $0x0
c0007ac8:	50                   	push   %eax
c0007ac9:	e8 29 43 00 00       	call   c000bdf7 <Memset>
c0007ace:	83 c4 10             	add    $0x10,%esp
c0007ad1:	83 ec 04             	sub    $0x4,%esp
c0007ad4:	68 f0 00 00 00       	push   $0xf0
c0007ad9:	6a 00                	push   $0x0
c0007adb:	68 a0 47 08 c0       	push   $0xc00847a0
c0007ae0:	e8 12 43 00 00       	call   c000bdf7 <Memset>
c0007ae5:	83 c4 10             	add    $0x10,%esp
c0007ae8:	83 ec 0c             	sub    $0xc,%esp
c0007aeb:	68 a0 47 08 c0       	push   $0xc00847a0
c0007af0:	e8 75 fb ff ff       	call   c000766a <init_memory_block_desc>
c0007af5:	83 c4 10             	add    $0x10,%esp
c0007af8:	90                   	nop
c0007af9:	c9                   	leave  
c0007afa:	c3                   	ret    

c0007afb <intr_enable>:
c0007afb:	55                   	push   %ebp
c0007afc:	89 e5                	mov    %esp,%ebp
c0007afe:	83 ec 18             	sub    $0x18,%esp
c0007b01:	e8 65 00 00 00       	call   c0007b6b <intr_get_status>
c0007b06:	83 f8 01             	cmp    $0x1,%eax
c0007b09:	75 0c                	jne    c0007b17 <intr_enable+0x1c>
c0007b0b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b15:	eb 0b                	jmp    c0007b22 <intr_enable+0x27>
c0007b17:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b1e:	fb                   	sti    
c0007b1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b22:	c9                   	leave  
c0007b23:	c3                   	ret    

c0007b24 <intr_disable>:
c0007b24:	55                   	push   %ebp
c0007b25:	89 e5                	mov    %esp,%ebp
c0007b27:	83 ec 18             	sub    $0x18,%esp
c0007b2a:	e8 3c 00 00 00       	call   c0007b6b <intr_get_status>
c0007b2f:	83 f8 01             	cmp    $0x1,%eax
c0007b32:	75 0d                	jne    c0007b41 <intr_disable+0x1d>
c0007b34:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b3b:	fa                   	cli    
c0007b3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b3f:	eb 0a                	jmp    c0007b4b <intr_disable+0x27>
c0007b41:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b4b:	c9                   	leave  
c0007b4c:	c3                   	ret    

c0007b4d <intr_set_status>:
c0007b4d:	55                   	push   %ebp
c0007b4e:	89 e5                	mov    %esp,%ebp
c0007b50:	83 ec 08             	sub    $0x8,%esp
c0007b53:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b56:	83 e0 01             	and    $0x1,%eax
c0007b59:	85 c0                	test   %eax,%eax
c0007b5b:	74 07                	je     c0007b64 <intr_set_status+0x17>
c0007b5d:	e8 99 ff ff ff       	call   c0007afb <intr_enable>
c0007b62:	eb 05                	jmp    c0007b69 <intr_set_status+0x1c>
c0007b64:	e8 bb ff ff ff       	call   c0007b24 <intr_disable>
c0007b69:	c9                   	leave  
c0007b6a:	c3                   	ret    

c0007b6b <intr_get_status>:
c0007b6b:	55                   	push   %ebp
c0007b6c:	89 e5                	mov    %esp,%ebp
c0007b6e:	83 ec 10             	sub    $0x10,%esp
c0007b71:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007b78:	9c                   	pushf  
c0007b79:	58                   	pop    %eax
c0007b7a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007b7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007b80:	c1 e8 09             	shr    $0x9,%eax
c0007b83:	83 e0 01             	and    $0x1,%eax
c0007b86:	c9                   	leave  
c0007b87:	c3                   	ret    

c0007b88 <Memcpy>:
c0007b88:	55                   	push   %ebp
c0007b89:	89 e5                	mov    %esp,%ebp
c0007b8b:	83 ec 18             	sub    $0x18,%esp
c0007b8e:	e8 91 ff ff ff       	call   c0007b24 <intr_disable>
c0007b93:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007b96:	83 ec 04             	sub    $0x4,%esp
c0007b99:	ff 75 10             	pushl  0x10(%ebp)
c0007b9c:	ff 75 0c             	pushl  0xc(%ebp)
c0007b9f:	ff 75 08             	pushl  0x8(%ebp)
c0007ba2:	e8 22 42 00 00       	call   c000bdc9 <Memcpy2>
c0007ba7:	83 c4 10             	add    $0x10,%esp
c0007baa:	83 ec 0c             	sub    $0xc,%esp
c0007bad:	ff 75 f4             	pushl  -0xc(%ebp)
c0007bb0:	e8 98 ff ff ff       	call   c0007b4d <intr_set_status>
c0007bb5:	83 c4 10             	add    $0x10,%esp
c0007bb8:	90                   	nop
c0007bb9:	c9                   	leave  
c0007bba:	c3                   	ret    

c0007bbb <untar>:
c0007bbb:	55                   	push   %ebp
c0007bbc:	89 e5                	mov    %esp,%ebp
c0007bbe:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0007bc4:	83 ec 08             	sub    $0x8,%esp
c0007bc7:	6a 00                	push   $0x0
c0007bc9:	ff 75 08             	pushl  0x8(%ebp)
c0007bcc:	e8 ed df ff ff       	call   c0005bbe <open>
c0007bd1:	83 c4 10             	add    $0x10,%esp
c0007bd4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007bd7:	83 ec 0c             	sub    $0xc,%esp
c0007bda:	68 00 b5 00 c0       	push   $0xc000b500
c0007bdf:	e8 be 17 00 00       	call   c00093a2 <Printf>
c0007be4:	83 c4 10             	add    $0x10,%esp
c0007be7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007bee:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0007bf5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007bfc:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007c03:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007c0a:	e9 5e 02 00 00       	jmp    c0007e6d <untar+0x2b2>
c0007c0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007c13:	7e 58                	jle    c0007c6d <untar+0xb2>
c0007c15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c18:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007c1d:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007c23:	85 c0                	test   %eax,%eax
c0007c25:	0f 48 c2             	cmovs  %edx,%eax
c0007c28:	c1 f8 09             	sar    $0x9,%eax
c0007c2b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007c2e:	83 ec 04             	sub    $0x4,%esp
c0007c31:	68 00 02 00 00       	push   $0x200
c0007c36:	6a 00                	push   $0x0
c0007c38:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c3e:	50                   	push   %eax
c0007c3f:	e8 b3 41 00 00       	call   c000bdf7 <Memset>
c0007c44:	83 c4 10             	add    $0x10,%esp
c0007c47:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007c4a:	c1 e0 09             	shl    $0x9,%eax
c0007c4d:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007c50:	83 ec 04             	sub    $0x4,%esp
c0007c53:	50                   	push   %eax
c0007c54:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c5a:	50                   	push   %eax
c0007c5b:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c5e:	e8 f0 df ff ff       	call   c0005c53 <read>
c0007c63:	83 c4 10             	add    $0x10,%esp
c0007c66:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c6d:	83 ec 04             	sub    $0x4,%esp
c0007c70:	68 00 02 00 00       	push   $0x200
c0007c75:	6a 00                	push   $0x0
c0007c77:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c7d:	50                   	push   %eax
c0007c7e:	e8 74 41 00 00       	call   c000bdf7 <Memset>
c0007c83:	83 c4 10             	add    $0x10,%esp
c0007c86:	83 ec 04             	sub    $0x4,%esp
c0007c89:	68 00 02 00 00       	push   $0x200
c0007c8e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c94:	50                   	push   %eax
c0007c95:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c98:	e8 b6 df ff ff       	call   c0005c53 <read>
c0007c9d:	83 c4 10             	add    $0x10,%esp
c0007ca0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007ca3:	83 ec 0c             	sub    $0xc,%esp
c0007ca6:	68 12 b5 00 c0       	push   $0xc000b512
c0007cab:	e8 f2 16 00 00       	call   c00093a2 <Printf>
c0007cb0:	83 c4 10             	add    $0x10,%esp
c0007cb3:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007cb7:	0f 84 bc 01 00 00    	je     c0007e79 <untar+0x2be>
c0007cbd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007cc0:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007cc3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007cca:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007cd0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007cd3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007cd6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007cd9:	83 ec 08             	sub    $0x8,%esp
c0007cdc:	6a 07                	push   $0x7
c0007cde:	ff 75 cc             	pushl  -0x34(%ebp)
c0007ce1:	e8 d8 de ff ff       	call   c0005bbe <open>
c0007ce6:	83 c4 10             	add    $0x10,%esp
c0007ce9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007cec:	83 ec 0c             	sub    $0xc,%esp
c0007cef:	68 24 b5 00 c0       	push   $0xc000b524
c0007cf4:	e8 a9 16 00 00       	call   c00093a2 <Printf>
c0007cf9:	83 c4 10             	add    $0x10,%esp
c0007cfc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007d03:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007d06:	83 c0 7c             	add    $0x7c,%eax
c0007d09:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007d0c:	83 ec 0c             	sub    $0xc,%esp
c0007d0f:	ff 75 cc             	pushl  -0x34(%ebp)
c0007d12:	e8 19 41 00 00       	call   c000be30 <Strlen>
c0007d17:	83 c4 10             	add    $0x10,%esp
c0007d1a:	85 c0                	test   %eax,%eax
c0007d1c:	75 28                	jne    c0007d46 <untar+0x18b>
c0007d1e:	83 ec 0c             	sub    $0xc,%esp
c0007d21:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007d24:	e8 07 41 00 00       	call   c000be30 <Strlen>
c0007d29:	83 c4 10             	add    $0x10,%esp
c0007d2c:	85 c0                	test   %eax,%eax
c0007d2e:	75 16                	jne    c0007d46 <untar+0x18b>
c0007d30:	83 ec 0c             	sub    $0xc,%esp
c0007d33:	68 36 b5 00 c0       	push   $0xc000b536
c0007d38:	e8 65 16 00 00       	call   c00093a2 <Printf>
c0007d3d:	83 c4 10             	add    $0x10,%esp
c0007d40:	90                   	nop
c0007d41:	e9 34 01 00 00       	jmp    c0007e7a <untar+0x2bf>
c0007d46:	83 ec 0c             	sub    $0xc,%esp
c0007d49:	68 3d b5 00 c0       	push   $0xc000b53d
c0007d4e:	e8 4f 16 00 00       	call   c00093a2 <Printf>
c0007d53:	83 c4 10             	add    $0x10,%esp
c0007d56:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007d59:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007d5c:	eb 1f                	jmp    c0007d7d <untar+0x1c2>
c0007d5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d61:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007d68:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007d6b:	0f b6 00             	movzbl (%eax),%eax
c0007d6e:	0f be c0             	movsbl %al,%eax
c0007d71:	83 e8 30             	sub    $0x30,%eax
c0007d74:	01 d0                	add    %edx,%eax
c0007d76:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007d79:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007d7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007d80:	0f b6 00             	movzbl (%eax),%eax
c0007d83:	84 c0                	test   %al,%al
c0007d85:	75 d7                	jne    c0007d5e <untar+0x1a3>
c0007d87:	83 ec 0c             	sub    $0xc,%esp
c0007d8a:	68 4b b5 00 c0       	push   $0xc000b54b
c0007d8f:	e8 0e 16 00 00       	call   c00093a2 <Printf>
c0007d94:	83 c4 10             	add    $0x10,%esp
c0007d97:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d9a:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007d9d:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0007da4:	83 ec 08             	sub    $0x8,%esp
c0007da7:	ff 75 c0             	pushl  -0x40(%ebp)
c0007daa:	68 59 b5 00 c0       	push   $0xc000b559
c0007daf:	e8 ee 15 00 00       	call   c00093a2 <Printf>
c0007db4:	83 c4 10             	add    $0x10,%esp
c0007db7:	83 ec 08             	sub    $0x8,%esp
c0007dba:	ff 75 c0             	pushl  -0x40(%ebp)
c0007dbd:	68 6b b5 00 c0       	push   $0xc000b56b
c0007dc2:	e8 db 15 00 00       	call   c00093a2 <Printf>
c0007dc7:	83 c4 10             	add    $0x10,%esp
c0007dca:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007dcd:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0007dd0:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0007dd4:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007dd7:	83 ec 04             	sub    $0x4,%esp
c0007dda:	ff 75 b8             	pushl  -0x48(%ebp)
c0007ddd:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007de3:	50                   	push   %eax
c0007de4:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007de7:	e8 67 de ff ff       	call   c0005c53 <read>
c0007dec:	83 c4 10             	add    $0x10,%esp
c0007def:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007df2:	83 ec 04             	sub    $0x4,%esp
c0007df5:	ff 75 b8             	pushl  -0x48(%ebp)
c0007df8:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007dfe:	50                   	push   %eax
c0007dff:	ff 75 c8             	pushl  -0x38(%ebp)
c0007e02:	e8 cd df ff ff       	call   c0005dd4 <write>
c0007e07:	83 c4 10             	add    $0x10,%esp
c0007e0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007e0d:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0007e10:	7d 02                	jge    c0007e14 <untar+0x259>
c0007e12:	eb c3                	jmp    c0007dd7 <untar+0x21c>
c0007e14:	90                   	nop
c0007e15:	83 ec 08             	sub    $0x8,%esp
c0007e18:	ff 75 f4             	pushl  -0xc(%ebp)
c0007e1b:	68 7d b5 00 c0       	push   $0xc000b57d
c0007e20:	e8 7d 15 00 00       	call   c00093a2 <Printf>
c0007e25:	83 c4 10             	add    $0x10,%esp
c0007e28:	83 ec 08             	sub    $0x8,%esp
c0007e2b:	ff 75 c0             	pushl  -0x40(%ebp)
c0007e2e:	68 8f b5 00 c0       	push   $0xc000b58f
c0007e33:	e8 6a 15 00 00       	call   c00093a2 <Printf>
c0007e38:	83 c4 10             	add    $0x10,%esp
c0007e3b:	83 ec 0c             	sub    $0xc,%esp
c0007e3e:	68 a0 b5 00 c0       	push   $0xc000b5a0
c0007e43:	e8 5a 15 00 00       	call   c00093a2 <Printf>
c0007e48:	83 c4 10             	add    $0x10,%esp
c0007e4b:	83 ec 0c             	sub    $0xc,%esp
c0007e4e:	ff 75 c8             	pushl  -0x38(%ebp)
c0007e51:	e8 03 e0 ff ff       	call   c0005e59 <close>
c0007e56:	83 c4 10             	add    $0x10,%esp
c0007e59:	83 ec 0c             	sub    $0xc,%esp
c0007e5c:	68 ae b5 00 c0       	push   $0xc000b5ae
c0007e61:	e8 3c 15 00 00       	call   c00093a2 <Printf>
c0007e66:	83 c4 10             	add    $0x10,%esp
c0007e69:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007e6d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007e71:	0f 8f 98 fd ff ff    	jg     c0007c0f <untar+0x54>
c0007e77:	eb 01                	jmp    c0007e7a <untar+0x2bf>
c0007e79:	90                   	nop
c0007e7a:	83 ec 0c             	sub    $0xc,%esp
c0007e7d:	68 bb b5 00 c0       	push   $0xc000b5bb
c0007e82:	e8 1b 15 00 00       	call   c00093a2 <Printf>
c0007e87:	83 c4 10             	add    $0x10,%esp
c0007e8a:	83 ec 0c             	sub    $0xc,%esp
c0007e8d:	68 cd b5 00 c0       	push   $0xc000b5cd
c0007e92:	e8 0b 15 00 00       	call   c00093a2 <Printf>
c0007e97:	83 c4 10             	add    $0x10,%esp
c0007e9a:	83 ec 0c             	sub    $0xc,%esp
c0007e9d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007ea0:	e8 b4 df ff ff       	call   c0005e59 <close>
c0007ea5:	83 c4 10             	add    $0x10,%esp
c0007ea8:	83 ec 0c             	sub    $0xc,%esp
c0007eab:	68 dd b5 00 c0       	push   $0xc000b5dd
c0007eb0:	e8 ed 14 00 00       	call   c00093a2 <Printf>
c0007eb5:	83 c4 10             	add    $0x10,%esp
c0007eb8:	83 ec 0c             	sub    $0xc,%esp
c0007ebb:	68 f0 b5 00 c0       	push   $0xc000b5f0
c0007ec0:	e8 dd 14 00 00       	call   c00093a2 <Printf>
c0007ec5:	83 c4 10             	add    $0x10,%esp
c0007ec8:	90                   	nop
c0007ec9:	c9                   	leave  
c0007eca:	c3                   	ret    

c0007ecb <atoi>:
c0007ecb:	55                   	push   %ebp
c0007ecc:	89 e5                	mov    %esp,%ebp
c0007ece:	83 ec 10             	sub    $0x10,%esp
c0007ed1:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ed4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007ed7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007eda:	8d 50 01             	lea    0x1(%eax),%edx
c0007edd:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007ee0:	c6 00 30             	movb   $0x30,(%eax)
c0007ee3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ee6:	8d 50 01             	lea    0x1(%eax),%edx
c0007ee9:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007eec:	c6 00 78             	movb   $0x78,(%eax)
c0007eef:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007ef3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007ef7:	75 0e                	jne    c0007f07 <atoi+0x3c>
c0007ef9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007efc:	8d 50 01             	lea    0x1(%eax),%edx
c0007eff:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007f02:	c6 00 30             	movb   $0x30,(%eax)
c0007f05:	eb 61                	jmp    c0007f68 <atoi+0x9d>
c0007f07:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007f0e:	eb 52                	jmp    c0007f62 <atoi+0x97>
c0007f10:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007f13:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007f16:	89 c1                	mov    %eax,%ecx
c0007f18:	d3 fa                	sar    %cl,%edx
c0007f1a:	89 d0                	mov    %edx,%eax
c0007f1c:	83 e0 0f             	and    $0xf,%eax
c0007f1f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f22:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007f26:	75 06                	jne    c0007f2e <atoi+0x63>
c0007f28:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007f2c:	74 2f                	je     c0007f5d <atoi+0x92>
c0007f2e:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007f32:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007f36:	83 c0 30             	add    $0x30,%eax
c0007f39:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f3c:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007f40:	7e 0a                	jle    c0007f4c <atoi+0x81>
c0007f42:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007f46:	83 c0 07             	add    $0x7,%eax
c0007f49:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007f4f:	8d 50 01             	lea    0x1(%eax),%edx
c0007f52:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007f55:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007f59:	88 10                	mov    %dl,(%eax)
c0007f5b:	eb 01                	jmp    c0007f5e <atoi+0x93>
c0007f5d:	90                   	nop
c0007f5e:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007f62:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007f66:	79 a8                	jns    c0007f10 <atoi+0x45>
c0007f68:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007f6b:	c6 00 00             	movb   $0x0,(%eax)
c0007f6e:	90                   	nop
c0007f6f:	c9                   	leave  
c0007f70:	c3                   	ret    

c0007f71 <disp_int>:
c0007f71:	55                   	push   %ebp
c0007f72:	89 e5                	mov    %esp,%ebp
c0007f74:	83 ec 18             	sub    $0x18,%esp
c0007f77:	ff 75 08             	pushl  0x8(%ebp)
c0007f7a:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f7d:	50                   	push   %eax
c0007f7e:	e8 48 ff ff ff       	call   c0007ecb <atoi>
c0007f83:	83 c4 08             	add    $0x8,%esp
c0007f86:	83 ec 08             	sub    $0x8,%esp
c0007f89:	6a 0b                	push   $0xb
c0007f8b:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f8e:	50                   	push   %eax
c0007f8f:	e8 33 93 ff ff       	call   c00012c7 <disp_str_colour>
c0007f94:	83 c4 10             	add    $0x10,%esp
c0007f97:	90                   	nop
c0007f98:	c9                   	leave  
c0007f99:	c3                   	ret    

c0007f9a <do_page_fault>:
c0007f9a:	55                   	push   %ebp
c0007f9b:	89 e5                	mov    %esp,%ebp
c0007f9d:	83 ec 28             	sub    $0x28,%esp
c0007fa0:	0f 20 d0             	mov    %cr2,%eax
c0007fa3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007fa6:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0007fad:	00 00 00 
c0007fb0:	83 ec 0c             	sub    $0xc,%esp
c0007fb3:	68 fb b5 00 c0       	push   $0xc000b5fb
c0007fb8:	e8 cf 92 ff ff       	call   c000128c <disp_str>
c0007fbd:	83 c4 10             	add    $0x10,%esp
c0007fc0:	83 ec 0c             	sub    $0xc,%esp
c0007fc3:	68 0a b6 00 c0       	push   $0xc000b60a
c0007fc8:	e8 bf 92 ff ff       	call   c000128c <disp_str>
c0007fcd:	83 c4 10             	add    $0x10,%esp
c0007fd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007fd3:	83 ec 0c             	sub    $0xc,%esp
c0007fd6:	50                   	push   %eax
c0007fd7:	e8 95 ff ff ff       	call   c0007f71 <disp_int>
c0007fdc:	83 c4 10             	add    $0x10,%esp
c0007fdf:	83 ec 0c             	sub    $0xc,%esp
c0007fe2:	68 0f b6 00 c0       	push   $0xc000b60f
c0007fe7:	e8 a0 92 ff ff       	call   c000128c <disp_str>
c0007fec:	83 c4 10             	add    $0x10,%esp
c0007fef:	83 ec 0c             	sub    $0xc,%esp
c0007ff2:	ff 75 f4             	pushl  -0xc(%ebp)
c0007ff5:	e8 87 ed ff ff       	call   c0006d81 <ptr_pde>
c0007ffa:	83 c4 10             	add    $0x10,%esp
c0007ffd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008000:	83 ec 0c             	sub    $0xc,%esp
c0008003:	ff 75 f4             	pushl  -0xc(%ebp)
c0008006:	e8 89 ed ff ff       	call   c0006d94 <ptr_pte>
c000800b:	83 c4 10             	add    $0x10,%esp
c000800e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008011:	83 ec 0c             	sub    $0xc,%esp
c0008014:	68 11 b6 00 c0       	push   $0xc000b611
c0008019:	e8 6e 92 ff ff       	call   c000128c <disp_str>
c000801e:	83 c4 10             	add    $0x10,%esp
c0008021:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008024:	83 ec 0c             	sub    $0xc,%esp
c0008027:	50                   	push   %eax
c0008028:	e8 44 ff ff ff       	call   c0007f71 <disp_int>
c000802d:	83 c4 10             	add    $0x10,%esp
c0008030:	83 ec 0c             	sub    $0xc,%esp
c0008033:	68 16 b6 00 c0       	push   $0xc000b616
c0008038:	e8 4f 92 ff ff       	call   c000128c <disp_str>
c000803d:	83 c4 10             	add    $0x10,%esp
c0008040:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008043:	8b 00                	mov    (%eax),%eax
c0008045:	83 ec 0c             	sub    $0xc,%esp
c0008048:	50                   	push   %eax
c0008049:	e8 23 ff ff ff       	call   c0007f71 <disp_int>
c000804e:	83 c4 10             	add    $0x10,%esp
c0008051:	83 ec 0c             	sub    $0xc,%esp
c0008054:	68 0f b6 00 c0       	push   $0xc000b60f
c0008059:	e8 2e 92 ff ff       	call   c000128c <disp_str>
c000805e:	83 c4 10             	add    $0x10,%esp
c0008061:	83 ec 0c             	sub    $0xc,%esp
c0008064:	68 1f b6 00 c0       	push   $0xc000b61f
c0008069:	e8 1e 92 ff ff       	call   c000128c <disp_str>
c000806e:	83 c4 10             	add    $0x10,%esp
c0008071:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008074:	83 ec 0c             	sub    $0xc,%esp
c0008077:	50                   	push   %eax
c0008078:	e8 f4 fe ff ff       	call   c0007f71 <disp_int>
c000807d:	83 c4 10             	add    $0x10,%esp
c0008080:	83 ec 0c             	sub    $0xc,%esp
c0008083:	68 24 b6 00 c0       	push   $0xc000b624
c0008088:	e8 ff 91 ff ff       	call   c000128c <disp_str>
c000808d:	83 c4 10             	add    $0x10,%esp
c0008090:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008093:	8b 00                	mov    (%eax),%eax
c0008095:	83 ec 0c             	sub    $0xc,%esp
c0008098:	50                   	push   %eax
c0008099:	e8 d3 fe ff ff       	call   c0007f71 <disp_int>
c000809e:	83 c4 10             	add    $0x10,%esp
c00080a1:	83 ec 0c             	sub    $0xc,%esp
c00080a4:	68 0f b6 00 c0       	push   $0xc000b60f
c00080a9:	e8 de 91 ff ff       	call   c000128c <disp_str>
c00080ae:	83 c4 10             	add    $0x10,%esp
c00080b1:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c00080b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00080bb:	8b 00                	mov    (%eax),%eax
c00080bd:	83 e0 01             	and    $0x1,%eax
c00080c0:	85 c0                	test   %eax,%eax
c00080c2:	74 09                	je     c00080cd <do_page_fault+0x133>
c00080c4:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c00080cb:	eb 07                	jmp    c00080d4 <do_page_fault+0x13a>
c00080cd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00080d4:	90                   	nop
c00080d5:	c9                   	leave  
c00080d6:	c3                   	ret    

c00080d7 <exception_handler>:
c00080d7:	55                   	push   %ebp
c00080d8:	89 e5                	mov    %esp,%ebp
c00080da:	57                   	push   %edi
c00080db:	56                   	push   %esi
c00080dc:	53                   	push   %ebx
c00080dd:	83 ec 6c             	sub    $0x6c,%esp
c00080e0:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00080e3:	bb a0 b8 00 c0       	mov    $0xc000b8a0,%ebx
c00080e8:	ba 13 00 00 00       	mov    $0x13,%edx
c00080ed:	89 c7                	mov    %eax,%edi
c00080ef:	89 de                	mov    %ebx,%esi
c00080f1:	89 d1                	mov    %edx,%ecx
c00080f3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00080f5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00080fc:	eb 04                	jmp    c0008102 <exception_handler+0x2b>
c00080fe:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008102:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0008109:	7e f3                	jle    c00080fe <exception_handler+0x27>
c000810b:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008112:	00 00 00 
c0008115:	83 ec 0c             	sub    $0xc,%esp
c0008118:	68 2d b6 00 c0       	push   $0xc000b62d
c000811d:	e8 6a 91 ff ff       	call   c000128c <disp_str>
c0008122:	83 c4 10             	add    $0x10,%esp
c0008125:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c000812c:	8b 45 08             	mov    0x8(%ebp),%eax
c000812f:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0008133:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008136:	83 ec 0c             	sub    $0xc,%esp
c0008139:	ff 75 dc             	pushl  -0x24(%ebp)
c000813c:	e8 4b 91 ff ff       	call   c000128c <disp_str>
c0008141:	83 c4 10             	add    $0x10,%esp
c0008144:	83 ec 0c             	sub    $0xc,%esp
c0008147:	68 3b b6 00 c0       	push   $0xc000b63b
c000814c:	e8 3b 91 ff ff       	call   c000128c <disp_str>
c0008151:	83 c4 10             	add    $0x10,%esp
c0008154:	83 ec 0c             	sub    $0xc,%esp
c0008157:	68 3e b6 00 c0       	push   $0xc000b63e
c000815c:	e8 2b 91 ff ff       	call   c000128c <disp_str>
c0008161:	83 c4 10             	add    $0x10,%esp
c0008164:	8b 45 08             	mov    0x8(%ebp),%eax
c0008167:	83 ec 0c             	sub    $0xc,%esp
c000816a:	50                   	push   %eax
c000816b:	e8 01 fe ff ff       	call   c0007f71 <disp_int>
c0008170:	83 c4 10             	add    $0x10,%esp
c0008173:	83 ec 0c             	sub    $0xc,%esp
c0008176:	68 3b b6 00 c0       	push   $0xc000b63b
c000817b:	e8 0c 91 ff ff       	call   c000128c <disp_str>
c0008180:	83 c4 10             	add    $0x10,%esp
c0008183:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008187:	74 2f                	je     c00081b8 <exception_handler+0xe1>
c0008189:	83 ec 0c             	sub    $0xc,%esp
c000818c:	68 46 b6 00 c0       	push   $0xc000b646
c0008191:	e8 f6 90 ff ff       	call   c000128c <disp_str>
c0008196:	83 c4 10             	add    $0x10,%esp
c0008199:	8b 45 0c             	mov    0xc(%ebp),%eax
c000819c:	83 ec 0c             	sub    $0xc,%esp
c000819f:	50                   	push   %eax
c00081a0:	e8 cc fd ff ff       	call   c0007f71 <disp_int>
c00081a5:	83 c4 10             	add    $0x10,%esp
c00081a8:	83 ec 0c             	sub    $0xc,%esp
c00081ab:	68 3b b6 00 c0       	push   $0xc000b63b
c00081b0:	e8 d7 90 ff ff       	call   c000128c <disp_str>
c00081b5:	83 c4 10             	add    $0x10,%esp
c00081b8:	83 ec 0c             	sub    $0xc,%esp
c00081bb:	68 50 b6 00 c0       	push   $0xc000b650
c00081c0:	e8 c7 90 ff ff       	call   c000128c <disp_str>
c00081c5:	83 c4 10             	add    $0x10,%esp
c00081c8:	83 ec 0c             	sub    $0xc,%esp
c00081cb:	ff 75 14             	pushl  0x14(%ebp)
c00081ce:	e8 9e fd ff ff       	call   c0007f71 <disp_int>
c00081d3:	83 c4 10             	add    $0x10,%esp
c00081d6:	83 ec 0c             	sub    $0xc,%esp
c00081d9:	68 3b b6 00 c0       	push   $0xc000b63b
c00081de:	e8 a9 90 ff ff       	call   c000128c <disp_str>
c00081e3:	83 c4 10             	add    $0x10,%esp
c00081e6:	83 ec 0c             	sub    $0xc,%esp
c00081e9:	68 54 b6 00 c0       	push   $0xc000b654
c00081ee:	e8 99 90 ff ff       	call   c000128c <disp_str>
c00081f3:	83 c4 10             	add    $0x10,%esp
c00081f6:	8b 45 10             	mov    0x10(%ebp),%eax
c00081f9:	83 ec 0c             	sub    $0xc,%esp
c00081fc:	50                   	push   %eax
c00081fd:	e8 6f fd ff ff       	call   c0007f71 <disp_int>
c0008202:	83 c4 10             	add    $0x10,%esp
c0008205:	83 ec 0c             	sub    $0xc,%esp
c0008208:	68 3b b6 00 c0       	push   $0xc000b63b
c000820d:	e8 7a 90 ff ff       	call   c000128c <disp_str>
c0008212:	83 c4 10             	add    $0x10,%esp
c0008215:	83 ec 0c             	sub    $0xc,%esp
c0008218:	68 59 b6 00 c0       	push   $0xc000b659
c000821d:	e8 6a 90 ff ff       	call   c000128c <disp_str>
c0008222:	83 c4 10             	add    $0x10,%esp
c0008225:	83 ec 0c             	sub    $0xc,%esp
c0008228:	ff 75 18             	pushl  0x18(%ebp)
c000822b:	e8 41 fd ff ff       	call   c0007f71 <disp_int>
c0008230:	83 c4 10             	add    $0x10,%esp
c0008233:	83 ec 0c             	sub    $0xc,%esp
c0008236:	68 3b b6 00 c0       	push   $0xc000b63b
c000823b:	e8 4c 90 ff ff       	call   c000128c <disp_str>
c0008240:	83 c4 10             	add    $0x10,%esp
c0008243:	83 ec 0c             	sub    $0xc,%esp
c0008246:	68 64 b6 00 c0       	push   $0xc000b664
c000824b:	e8 3c 90 ff ff       	call   c000128c <disp_str>
c0008250:	83 c4 10             	add    $0x10,%esp
c0008253:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0008257:	75 45                	jne    c000829e <exception_handler+0x1c7>
c0008259:	0f 20 d0             	mov    %cr2,%eax
c000825c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000825f:	83 ec 0c             	sub    $0xc,%esp
c0008262:	68 83 b6 00 c0       	push   $0xc000b683
c0008267:	e8 20 90 ff ff       	call   c000128c <disp_str>
c000826c:	83 c4 10             	add    $0x10,%esp
c000826f:	83 ec 0c             	sub    $0xc,%esp
c0008272:	68 0a b6 00 c0       	push   $0xc000b60a
c0008277:	e8 10 90 ff ff       	call   c000128c <disp_str>
c000827c:	83 c4 10             	add    $0x10,%esp
c000827f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008282:	83 ec 0c             	sub    $0xc,%esp
c0008285:	50                   	push   %eax
c0008286:	e8 e6 fc ff ff       	call   c0007f71 <disp_int>
c000828b:	83 c4 10             	add    $0x10,%esp
c000828e:	83 ec 0c             	sub    $0xc,%esp
c0008291:	68 0f b6 00 c0       	push   $0xc000b60f
c0008296:	e8 f1 8f ff ff       	call   c000128c <disp_str>
c000829b:	83 c4 10             	add    $0x10,%esp
c000829e:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c00082a2:	75 11                	jne    c00082b5 <exception_handler+0x1de>
c00082a4:	83 ec 0c             	sub    $0xc,%esp
c00082a7:	68 8f b6 00 c0       	push   $0xc000b68f
c00082ac:	e8 db 8f ff ff       	call   c000128c <disp_str>
c00082b1:	83 c4 10             	add    $0x10,%esp
c00082b4:	90                   	nop
c00082b5:	90                   	nop
c00082b6:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00082b9:	5b                   	pop    %ebx
c00082ba:	5e                   	pop    %esi
c00082bb:	5f                   	pop    %edi
c00082bc:	5d                   	pop    %ebp
c00082bd:	c3                   	ret    

c00082be <init_internal_interrupt>:
c00082be:	55                   	push   %ebp
c00082bf:	89 e5                	mov    %esp,%ebp
c00082c1:	83 ec 08             	sub    $0x8,%esp
c00082c4:	6a 0e                	push   $0xe
c00082c6:	6a 08                	push   $0x8
c00082c8:	68 03 13 00 c0       	push   $0xc0001303
c00082cd:	6a 00                	push   $0x0
c00082cf:	e8 2a c9 ff ff       	call   c0004bfe <InitInterruptDesc>
c00082d4:	83 c4 10             	add    $0x10,%esp
c00082d7:	6a 0e                	push   $0xe
c00082d9:	6a 08                	push   $0x8
c00082db:	68 09 13 00 c0       	push   $0xc0001309
c00082e0:	6a 01                	push   $0x1
c00082e2:	e8 17 c9 ff ff       	call   c0004bfe <InitInterruptDesc>
c00082e7:	83 c4 10             	add    $0x10,%esp
c00082ea:	6a 0e                	push   $0xe
c00082ec:	6a 08                	push   $0x8
c00082ee:	68 0f 13 00 c0       	push   $0xc000130f
c00082f3:	6a 02                	push   $0x2
c00082f5:	e8 04 c9 ff ff       	call   c0004bfe <InitInterruptDesc>
c00082fa:	83 c4 10             	add    $0x10,%esp
c00082fd:	6a 0e                	push   $0xe
c00082ff:	6a 08                	push   $0x8
c0008301:	68 15 13 00 c0       	push   $0xc0001315
c0008306:	6a 03                	push   $0x3
c0008308:	e8 f1 c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c000830d:	83 c4 10             	add    $0x10,%esp
c0008310:	6a 0e                	push   $0xe
c0008312:	6a 08                	push   $0x8
c0008314:	68 1b 13 00 c0       	push   $0xc000131b
c0008319:	6a 04                	push   $0x4
c000831b:	e8 de c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c0008320:	83 c4 10             	add    $0x10,%esp
c0008323:	6a 0e                	push   $0xe
c0008325:	6a 08                	push   $0x8
c0008327:	68 21 13 00 c0       	push   $0xc0001321
c000832c:	6a 05                	push   $0x5
c000832e:	e8 cb c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c0008333:	83 c4 10             	add    $0x10,%esp
c0008336:	6a 0e                	push   $0xe
c0008338:	6a 08                	push   $0x8
c000833a:	68 27 13 00 c0       	push   $0xc0001327
c000833f:	6a 06                	push   $0x6
c0008341:	e8 b8 c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c0008346:	83 c4 10             	add    $0x10,%esp
c0008349:	6a 0e                	push   $0xe
c000834b:	6a 08                	push   $0x8
c000834d:	68 2d 13 00 c0       	push   $0xc000132d
c0008352:	6a 07                	push   $0x7
c0008354:	e8 a5 c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c0008359:	83 c4 10             	add    $0x10,%esp
c000835c:	6a 0e                	push   $0xe
c000835e:	6a 08                	push   $0x8
c0008360:	68 33 13 00 c0       	push   $0xc0001333
c0008365:	6a 08                	push   $0x8
c0008367:	e8 92 c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c000836c:	83 c4 10             	add    $0x10,%esp
c000836f:	6a 0e                	push   $0xe
c0008371:	6a 08                	push   $0x8
c0008373:	68 37 13 00 c0       	push   $0xc0001337
c0008378:	6a 09                	push   $0x9
c000837a:	e8 7f c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c000837f:	83 c4 10             	add    $0x10,%esp
c0008382:	6a 0e                	push   $0xe
c0008384:	6a 08                	push   $0x8
c0008386:	68 3d 13 00 c0       	push   $0xc000133d
c000838b:	6a 0a                	push   $0xa
c000838d:	e8 6c c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c0008392:	83 c4 10             	add    $0x10,%esp
c0008395:	6a 0e                	push   $0xe
c0008397:	6a 08                	push   $0x8
c0008399:	68 41 13 00 c0       	push   $0xc0001341
c000839e:	6a 0b                	push   $0xb
c00083a0:	e8 59 c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c00083a5:	83 c4 10             	add    $0x10,%esp
c00083a8:	6a 0e                	push   $0xe
c00083aa:	6a 08                	push   $0x8
c00083ac:	68 45 13 00 c0       	push   $0xc0001345
c00083b1:	6a 0c                	push   $0xc
c00083b3:	e8 46 c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c00083b8:	83 c4 10             	add    $0x10,%esp
c00083bb:	6a 0e                	push   $0xe
c00083bd:	6a 08                	push   $0x8
c00083bf:	68 49 13 00 c0       	push   $0xc0001349
c00083c4:	6a 0d                	push   $0xd
c00083c6:	e8 33 c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c00083cb:	83 c4 10             	add    $0x10,%esp
c00083ce:	6a 0e                	push   $0xe
c00083d0:	6a 08                	push   $0x8
c00083d2:	68 54 13 00 c0       	push   $0xc0001354
c00083d7:	6a 0e                	push   $0xe
c00083d9:	e8 20 c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c00083de:	83 c4 10             	add    $0x10,%esp
c00083e1:	6a 0e                	push   $0xe
c00083e3:	6a 08                	push   $0x8
c00083e5:	68 58 13 00 c0       	push   $0xc0001358
c00083ea:	6a 10                	push   $0x10
c00083ec:	e8 0d c8 ff ff       	call   c0004bfe <InitInterruptDesc>
c00083f1:	83 c4 10             	add    $0x10,%esp
c00083f4:	6a 0e                	push   $0xe
c00083f6:	6a 08                	push   $0x8
c00083f8:	68 5e 13 00 c0       	push   $0xc000135e
c00083fd:	6a 11                	push   $0x11
c00083ff:	e8 fa c7 ff ff       	call   c0004bfe <InitInterruptDesc>
c0008404:	83 c4 10             	add    $0x10,%esp
c0008407:	6a 0e                	push   $0xe
c0008409:	6a 08                	push   $0x8
c000840b:	68 62 13 00 c0       	push   $0xc0001362
c0008410:	6a 12                	push   $0x12
c0008412:	e8 e7 c7 ff ff       	call   c0004bfe <InitInterruptDesc>
c0008417:	83 c4 10             	add    $0x10,%esp
c000841a:	6a 0e                	push   $0xe
c000841c:	6a 0e                	push   $0xe
c000841e:	68 1e 14 00 c0       	push   $0xc000141e
c0008423:	68 90 00 00 00       	push   $0x90
c0008428:	e8 d1 c7 ff ff       	call   c0004bfe <InitInterruptDesc>
c000842d:	83 c4 10             	add    $0x10,%esp
c0008430:	90                   	nop
c0008431:	c9                   	leave  
c0008432:	c3                   	ret    

c0008433 <spurious_irq>:
c0008433:	55                   	push   %ebp
c0008434:	89 e5                	mov    %esp,%ebp
c0008436:	83 ec 08             	sub    $0x8,%esp
c0008439:	83 ec 08             	sub    $0x8,%esp
c000843c:	6a 0b                	push   $0xb
c000843e:	68 ec b8 00 c0       	push   $0xc000b8ec
c0008443:	e8 7f 8e ff ff       	call   c00012c7 <disp_str_colour>
c0008448:	83 c4 10             	add    $0x10,%esp
c000844b:	83 ec 0c             	sub    $0xc,%esp
c000844e:	ff 75 08             	pushl  0x8(%ebp)
c0008451:	e8 1b fb ff ff       	call   c0007f71 <disp_int>
c0008456:	83 c4 10             	add    $0x10,%esp
c0008459:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000845e:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008464:	83 c0 01             	add    $0x1,%eax
c0008467:	83 d2 00             	adc    $0x0,%edx
c000846a:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c000846f:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c0008475:	83 ec 0c             	sub    $0xc,%esp
c0008478:	68 13 b9 00 c0       	push   $0xc000b913
c000847d:	e8 0a 8e ff ff       	call   c000128c <disp_str>
c0008482:	83 c4 10             	add    $0x10,%esp
c0008485:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000848a:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008490:	83 ec 0c             	sub    $0xc,%esp
c0008493:	50                   	push   %eax
c0008494:	e8 d8 fa ff ff       	call   c0007f71 <disp_int>
c0008499:	83 c4 10             	add    $0x10,%esp
c000849c:	83 ec 0c             	sub    $0xc,%esp
c000849f:	68 15 b9 00 c0       	push   $0xc000b915
c00084a4:	e8 e3 8d ff ff       	call   c000128c <disp_str>
c00084a9:	83 c4 10             	add    $0x10,%esp
c00084ac:	83 ec 08             	sub    $0x8,%esp
c00084af:	6a 0c                	push   $0xc
c00084b1:	68 18 b9 00 c0       	push   $0xc000b918
c00084b6:	e8 0c 8e ff ff       	call   c00012c7 <disp_str_colour>
c00084bb:	83 c4 10             	add    $0x10,%esp
c00084be:	90                   	nop
c00084bf:	c9                   	leave  
c00084c0:	c3                   	ret    

c00084c1 <init_keyboard>:
c00084c1:	55                   	push   %ebp
c00084c2:	89 e5                	mov    %esp,%ebp
c00084c4:	83 ec 18             	sub    $0x18,%esp
c00084c7:	83 ec 04             	sub    $0x4,%esp
c00084ca:	68 00 02 00 00       	push   $0x200
c00084cf:	6a 00                	push   $0x0
c00084d1:	68 ec 0b 01 c0       	push   $0xc0010bec
c00084d6:	e8 1c 39 00 00       	call   c000bdf7 <Memset>
c00084db:	83 c4 10             	add    $0x10,%esp
c00084de:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c00084e5:	0b 01 c0 
c00084e8:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00084ed:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c00084f2:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c00084f9:	00 00 00 
c00084fc:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008503:	00 00 00 
c0008506:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000850d:	eb 04                	jmp    c0008513 <init_keyboard+0x52>
c000850f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008513:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c000851a:	7e f3                	jle    c000850f <init_keyboard+0x4e>
c000851c:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008523:	00 00 00 
c0008526:	e8 ed d4 ff ff       	call   c0005a18 <init_keyboard_handler>
c000852b:	90                   	nop
c000852c:	c9                   	leave  
c000852d:	c3                   	ret    

c000852e <u_thread_a>:
c000852e:	55                   	push   %ebp
c000852f:	89 e5                	mov    %esp,%ebp
c0008531:	83 ec 08             	sub    $0x8,%esp
c0008534:	83 ec 0c             	sub    $0xc,%esp
c0008537:	68 3d b9 00 c0       	push   $0xc000b93d
c000853c:	e8 4b 8d ff ff       	call   c000128c <disp_str>
c0008541:	83 c4 10             	add    $0x10,%esp
c0008544:	eb fe                	jmp    c0008544 <u_thread_a+0x16>

c0008546 <TestTTY>:
c0008546:	55                   	push   %ebp
c0008547:	89 e5                	mov    %esp,%ebp
c0008549:	83 ec 28             	sub    $0x28,%esp
c000854c:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008553:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c000855a:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008560:	83 ec 08             	sub    $0x8,%esp
c0008563:	6a 02                	push   $0x2
c0008565:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008568:	50                   	push   %eax
c0008569:	e8 50 d6 ff ff       	call   c0005bbe <open>
c000856e:	83 c4 10             	add    $0x10,%esp
c0008571:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008574:	83 ec 08             	sub    $0x8,%esp
c0008577:	6a 02                	push   $0x2
c0008579:	8d 45 de             	lea    -0x22(%ebp),%eax
c000857c:	50                   	push   %eax
c000857d:	e8 3c d6 ff ff       	call   c0005bbe <open>
c0008582:	83 c4 10             	add    $0x10,%esp
c0008585:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008588:	83 ec 0c             	sub    $0xc,%esp
c000858b:	68 4b b9 00 c0       	push   $0xc000b94b
c0008590:	e8 0d 0e 00 00       	call   c00093a2 <Printf>
c0008595:	83 c4 10             	add    $0x10,%esp
c0008598:	83 ec 0c             	sub    $0xc,%esp
c000859b:	6a 0a                	push   $0xa
c000859d:	e8 22 a1 ff ff       	call   c00026c4 <sys_malloc>
c00085a2:	83 c4 10             	add    $0x10,%esp
c00085a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00085a8:	83 ec 04             	sub    $0x4,%esp
c00085ab:	6a 0a                	push   $0xa
c00085ad:	6a 00                	push   $0x0
c00085af:	ff 75 ec             	pushl  -0x14(%ebp)
c00085b2:	e8 40 38 00 00       	call   c000bdf7 <Memset>
c00085b7:	83 c4 10             	add    $0x10,%esp
c00085ba:	83 ec 04             	sub    $0x4,%esp
c00085bd:	6a 0a                	push   $0xa
c00085bf:	ff 75 ec             	pushl  -0x14(%ebp)
c00085c2:	ff 75 f0             	pushl  -0x10(%ebp)
c00085c5:	e8 89 d6 ff ff       	call   c0005c53 <read>
c00085ca:	83 c4 10             	add    $0x10,%esp
c00085cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00085d0:	83 ec 08             	sub    $0x8,%esp
c00085d3:	ff 75 ec             	pushl  -0x14(%ebp)
c00085d6:	68 5d b9 00 c0       	push   $0xc000b95d
c00085db:	e8 c2 0d 00 00       	call   c00093a2 <Printf>
c00085e0:	83 c4 10             	add    $0x10,%esp
c00085e3:	eb c3                	jmp    c00085a8 <TestTTY+0x62>

c00085e5 <TestFS>:
c00085e5:	55                   	push   %ebp
c00085e6:	89 e5                	mov    %esp,%ebp
c00085e8:	81 ec 28 01 00 00    	sub    $0x128,%esp
c00085ee:	83 ec 0c             	sub    $0xc,%esp
c00085f1:	68 67 b9 00 c0       	push   $0xc000b967
c00085f6:	e8 91 8c ff ff       	call   c000128c <disp_str>
c00085fb:	83 c4 10             	add    $0x10,%esp
c00085fe:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0008605:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c000860c:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0008612:	66 87 db             	xchg   %bx,%bx
c0008615:	83 ec 08             	sub    $0x8,%esp
c0008618:	6a 02                	push   $0x2
c000861a:	8d 45 be             	lea    -0x42(%ebp),%eax
c000861d:	50                   	push   %eax
c000861e:	e8 9b d5 ff ff       	call   c0005bbe <open>
c0008623:	83 c4 10             	add    $0x10,%esp
c0008626:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008629:	66 87 db             	xchg   %bx,%bx
c000862c:	83 ec 08             	sub    $0x8,%esp
c000862f:	6a 02                	push   $0x2
c0008631:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008634:	50                   	push   %eax
c0008635:	e8 84 d5 ff ff       	call   c0005bbe <open>
c000863a:	83 c4 10             	add    $0x10,%esp
c000863d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008640:	66 87 db             	xchg   %bx,%bx
c0008643:	83 ec 0c             	sub    $0xc,%esp
c0008646:	68 4b b9 00 c0       	push   $0xc000b94b
c000864b:	e8 52 0d 00 00       	call   c00093a2 <Printf>
c0008650:	83 c4 10             	add    $0x10,%esp
c0008653:	66 87 db             	xchg   %bx,%bx
c0008656:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c000865d:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0008661:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0008668:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c000866c:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0008673:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c000867a:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0008680:	66 87 db             	xchg   %bx,%bx
c0008683:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000868a:	66 87 db             	xchg   %bx,%bx
c000868d:	83 ec 0c             	sub    $0xc,%esp
c0008690:	68 6f b9 00 c0       	push   $0xc000b96f
c0008695:	e8 08 0d 00 00       	call   c00093a2 <Printf>
c000869a:	83 c4 10             	add    $0x10,%esp
c000869d:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c00086a1:	0f 85 43 03 00 00    	jne    c00089ea <TestFS+0x405>
c00086a7:	83 ec 08             	sub    $0x8,%esp
c00086aa:	6a 07                	push   $0x7
c00086ac:	8d 45 b9             	lea    -0x47(%ebp),%eax
c00086af:	50                   	push   %eax
c00086b0:	e8 09 d5 ff ff       	call   c0005bbe <open>
c00086b5:	83 c4 10             	add    $0x10,%esp
c00086b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00086bb:	83 ec 08             	sub    $0x8,%esp
c00086be:	ff 75 e4             	pushl  -0x1c(%ebp)
c00086c1:	68 87 b9 00 c0       	push   $0xc000b987
c00086c6:	e8 d7 0c 00 00       	call   c00093a2 <Printf>
c00086cb:	83 c4 10             	add    $0x10,%esp
c00086ce:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00086d5:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c00086dc:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c00086e3:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c00086ea:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c00086f1:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c00086f8:	83 ec 0c             	sub    $0xc,%esp
c00086fb:	8d 45 96             	lea    -0x6a(%ebp),%eax
c00086fe:	50                   	push   %eax
c00086ff:	e8 2c 37 00 00       	call   c000be30 <Strlen>
c0008704:	83 c4 10             	add    $0x10,%esp
c0008707:	83 ec 04             	sub    $0x4,%esp
c000870a:	50                   	push   %eax
c000870b:	8d 45 96             	lea    -0x6a(%ebp),%eax
c000870e:	50                   	push   %eax
c000870f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008712:	e8 bd d6 ff ff       	call   c0005dd4 <write>
c0008717:	83 c4 10             	add    $0x10,%esp
c000871a:	83 ec 04             	sub    $0x4,%esp
c000871d:	6a 14                	push   $0x14
c000871f:	6a 00                	push   $0x0
c0008721:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008724:	50                   	push   %eax
c0008725:	e8 cd 36 00 00       	call   c000bdf7 <Memset>
c000872a:	83 c4 10             	add    $0x10,%esp
c000872d:	83 ec 04             	sub    $0x4,%esp
c0008730:	6a 12                	push   $0x12
c0008732:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008735:	50                   	push   %eax
c0008736:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008739:	e8 15 d5 ff ff       	call   c0005c53 <read>
c000873e:	83 c4 10             	add    $0x10,%esp
c0008741:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008744:	83 ec 08             	sub    $0x8,%esp
c0008747:	8d 45 82             	lea    -0x7e(%ebp),%eax
c000874a:	50                   	push   %eax
c000874b:	68 90 b9 00 c0       	push   $0xc000b990
c0008750:	e8 4d 0c 00 00       	call   c00093a2 <Printf>
c0008755:	83 c4 10             	add    $0x10,%esp
c0008758:	66 87 db             	xchg   %bx,%bx
c000875b:	83 ec 0c             	sub    $0xc,%esp
c000875e:	6a 0a                	push   $0xa
c0008760:	e8 09 0b 00 00       	call   c000926e <delay>
c0008765:	83 c4 10             	add    $0x10,%esp
c0008768:	83 ec 08             	sub    $0x8,%esp
c000876b:	6a 07                	push   $0x7
c000876d:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0008770:	50                   	push   %eax
c0008771:	e8 48 d4 ff ff       	call   c0005bbe <open>
c0008776:	83 c4 10             	add    $0x10,%esp
c0008779:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000877c:	83 ec 08             	sub    $0x8,%esp
c000877f:	ff 75 dc             	pushl  -0x24(%ebp)
c0008782:	68 9b b9 00 c0       	push   $0xc000b99b
c0008787:	e8 16 0c 00 00       	call   c00093a2 <Printf>
c000878c:	83 c4 10             	add    $0x10,%esp
c000878f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008796:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c000879d:	67 3a 68 
c00087a0:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c00087a7:	77 20 61 
c00087aa:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c00087b1:	65 20 79 
c00087b4:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c00087bb:	75 3f 00 
c00087be:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c00087c5:	00 00 00 
c00087c8:	83 ec 0c             	sub    $0xc,%esp
c00087cb:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c00087d1:	50                   	push   %eax
c00087d2:	e8 59 36 00 00       	call   c000be30 <Strlen>
c00087d7:	83 c4 10             	add    $0x10,%esp
c00087da:	83 ec 04             	sub    $0x4,%esp
c00087dd:	50                   	push   %eax
c00087de:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c00087e4:	50                   	push   %eax
c00087e5:	ff 75 dc             	pushl  -0x24(%ebp)
c00087e8:	e8 e7 d5 ff ff       	call   c0005dd4 <write>
c00087ed:	83 c4 10             	add    $0x10,%esp
c00087f0:	83 ec 04             	sub    $0x4,%esp
c00087f3:	6a 14                	push   $0x14
c00087f5:	6a 00                	push   $0x0
c00087f7:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c00087fd:	50                   	push   %eax
c00087fe:	e8 f4 35 00 00       	call   c000bdf7 <Memset>
c0008803:	83 c4 10             	add    $0x10,%esp
c0008806:	83 ec 04             	sub    $0x4,%esp
c0008809:	6a 12                	push   $0x12
c000880b:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008811:	50                   	push   %eax
c0008812:	ff 75 dc             	pushl  -0x24(%ebp)
c0008815:	e8 39 d4 ff ff       	call   c0005c53 <read>
c000881a:	83 c4 10             	add    $0x10,%esp
c000881d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008820:	83 ec 08             	sub    $0x8,%esp
c0008823:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008829:	50                   	push   %eax
c000882a:	68 a5 b9 00 c0       	push   $0xc000b9a5
c000882f:	e8 6e 0b 00 00       	call   c00093a2 <Printf>
c0008834:	83 c4 10             	add    $0x10,%esp
c0008837:	83 ec 08             	sub    $0x8,%esp
c000883a:	6a 07                	push   $0x7
c000883c:	8d 45 aa             	lea    -0x56(%ebp),%eax
c000883f:	50                   	push   %eax
c0008840:	e8 79 d3 ff ff       	call   c0005bbe <open>
c0008845:	83 c4 10             	add    $0x10,%esp
c0008848:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000884b:	83 ec 08             	sub    $0x8,%esp
c000884e:	ff 75 dc             	pushl  -0x24(%ebp)
c0008851:	68 9b b9 00 c0       	push   $0xc000b99b
c0008856:	e8 47 0b 00 00       	call   c00093a2 <Printf>
c000885b:	83 c4 10             	add    $0x10,%esp
c000885e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008865:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c000886c:	20 77 69 
c000886f:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0008876:	6c 20 73 
c0008879:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0008880:	63 63 65 
c0008883:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c000888a:	73 20 61 
c000888d:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0008894:	20 6c 61 
c0008897:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c000889e:	74 2e 00 
c00088a1:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c00088a8:	00 00 00 
c00088ab:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c00088b2:	00 00 
c00088b4:	83 ec 0c             	sub    $0xc,%esp
c00088b7:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00088bd:	50                   	push   %eax
c00088be:	e8 6d 35 00 00       	call   c000be30 <Strlen>
c00088c3:	83 c4 10             	add    $0x10,%esp
c00088c6:	83 ec 04             	sub    $0x4,%esp
c00088c9:	50                   	push   %eax
c00088ca:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00088d0:	50                   	push   %eax
c00088d1:	ff 75 d4             	pushl  -0x2c(%ebp)
c00088d4:	e8 fb d4 ff ff       	call   c0005dd4 <write>
c00088d9:	83 c4 10             	add    $0x10,%esp
c00088dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00088e3:	eb 5c                	jmp    c0008941 <TestFS+0x35c>
c00088e5:	83 ec 04             	sub    $0x4,%esp
c00088e8:	6a 1e                	push   $0x1e
c00088ea:	6a 00                	push   $0x0
c00088ec:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c00088f2:	50                   	push   %eax
c00088f3:	e8 ff 34 00 00       	call   c000bdf7 <Memset>
c00088f8:	83 c4 10             	add    $0x10,%esp
c00088fb:	83 ec 0c             	sub    $0xc,%esp
c00088fe:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008904:	50                   	push   %eax
c0008905:	e8 26 35 00 00       	call   c000be30 <Strlen>
c000890a:	83 c4 10             	add    $0x10,%esp
c000890d:	83 ec 04             	sub    $0x4,%esp
c0008910:	50                   	push   %eax
c0008911:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008917:	50                   	push   %eax
c0008918:	ff 75 d4             	pushl  -0x2c(%ebp)
c000891b:	e8 33 d3 ff ff       	call   c0005c53 <read>
c0008920:	83 c4 10             	add    $0x10,%esp
c0008923:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008926:	83 ec 08             	sub    $0x8,%esp
c0008929:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c000892f:	50                   	push   %eax
c0008930:	68 b0 b9 00 c0       	push   $0xc000b9b0
c0008935:	e8 68 0a 00 00       	call   c00093a2 <Printf>
c000893a:	83 c4 10             	add    $0x10,%esp
c000893d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008941:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008945:	7e 9e                	jle    c00088e5 <TestFS+0x300>
c0008947:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c000894e:	6e 73 74 
c0008951:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0008958:	6c 6c 2e 
c000895b:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0008962:	61 72 00 
c0008965:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c000896c:	00 00 00 
c000896f:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0008976:	00 00 00 
c0008979:	83 ec 08             	sub    $0x8,%esp
c000897c:	6a 00                	push   $0x0
c000897e:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0008984:	50                   	push   %eax
c0008985:	e8 34 d2 ff ff       	call   c0005bbe <open>
c000898a:	83 c4 10             	add    $0x10,%esp
c000898d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008990:	83 ec 08             	sub    $0x8,%esp
c0008993:	ff 75 cc             	pushl  -0x34(%ebp)
c0008996:	68 bb b9 00 c0       	push   $0xc000b9bb
c000899b:	e8 02 0a 00 00       	call   c00093a2 <Printf>
c00089a0:	83 c4 10             	add    $0x10,%esp
c00089a3:	83 ec 04             	sub    $0x4,%esp
c00089a6:	6a 28                	push   $0x28
c00089a8:	6a 00                	push   $0x0
c00089aa:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c00089b0:	50                   	push   %eax
c00089b1:	e8 41 34 00 00       	call   c000bdf7 <Memset>
c00089b6:	83 c4 10             	add    $0x10,%esp
c00089b9:	83 ec 04             	sub    $0x4,%esp
c00089bc:	6a 28                	push   $0x28
c00089be:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c00089c4:	50                   	push   %eax
c00089c5:	ff 75 cc             	pushl  -0x34(%ebp)
c00089c8:	e8 86 d2 ff ff       	call   c0005c53 <read>
c00089cd:	83 c4 10             	add    $0x10,%esp
c00089d0:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00089d3:	83 ec 08             	sub    $0x8,%esp
c00089d6:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c00089dc:	50                   	push   %eax
c00089dd:	68 c5 b9 00 c0       	push   $0xc000b9c5
c00089e2:	e8 bb 09 00 00       	call   c00093a2 <Printf>
c00089e7:	83 c4 10             	add    $0x10,%esp
c00089ea:	90                   	nop
c00089eb:	c9                   	leave  
c00089ec:	c3                   	ret    

c00089ed <wait_exit>:
c00089ed:	55                   	push   %ebp
c00089ee:	89 e5                	mov    %esp,%ebp
c00089f0:	83 ec 28             	sub    $0x28,%esp
c00089f3:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00089fa:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008a01:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008a07:	83 ec 08             	sub    $0x8,%esp
c0008a0a:	6a 02                	push   $0x2
c0008a0c:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008a0f:	50                   	push   %eax
c0008a10:	e8 a9 d1 ff ff       	call   c0005bbe <open>
c0008a15:	83 c4 10             	add    $0x10,%esp
c0008a18:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a1b:	83 ec 08             	sub    $0x8,%esp
c0008a1e:	6a 02                	push   $0x2
c0008a20:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008a23:	50                   	push   %eax
c0008a24:	e8 95 d1 ff ff       	call   c0005bbe <open>
c0008a29:	83 c4 10             	add    $0x10,%esp
c0008a2c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008a2f:	e8 ea d4 ff ff       	call   c0005f1e <fork>
c0008a34:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008a37:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008a3b:	7e 25                	jle    c0008a62 <wait_exit+0x75>
c0008a3d:	83 ec 0c             	sub    $0xc,%esp
c0008a40:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0008a43:	50                   	push   %eax
c0008a44:	e8 62 d4 ff ff       	call   c0005eab <wait>
c0008a49:	83 c4 10             	add    $0x10,%esp
c0008a4c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a4f:	83 ec 08             	sub    $0x8,%esp
c0008a52:	50                   	push   %eax
c0008a53:	68 d0 b9 00 c0       	push   $0xc000b9d0
c0008a58:	e8 45 09 00 00       	call   c00093a2 <Printf>
c0008a5d:	83 c4 10             	add    $0x10,%esp
c0008a60:	eb fe                	jmp    c0008a60 <wait_exit+0x73>
c0008a62:	83 ec 0c             	sub    $0xc,%esp
c0008a65:	68 eb b9 00 c0       	push   $0xc000b9eb
c0008a6a:	e8 33 09 00 00       	call   c00093a2 <Printf>
c0008a6f:	83 c4 10             	add    $0x10,%esp
c0008a72:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a7c:	8d 50 01             	lea    0x1(%eax),%edx
c0008a7f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008a82:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008a87:	7f 02                	jg     c0008a8b <wait_exit+0x9e>
c0008a89:	eb ee                	jmp    c0008a79 <wait_exit+0x8c>
c0008a8b:	90                   	nop
c0008a8c:	83 ec 0c             	sub    $0xc,%esp
c0008a8f:	68 f7 b9 00 c0       	push   $0xc000b9f7
c0008a94:	e8 09 09 00 00       	call   c00093a2 <Printf>
c0008a99:	83 c4 10             	add    $0x10,%esp
c0008a9c:	83 ec 0c             	sub    $0xc,%esp
c0008a9f:	6a 09                	push   $0x9
c0008aa1:	e8 49 d4 ff ff       	call   c0005eef <exit>
c0008aa6:	83 c4 10             	add    $0x10,%esp
c0008aa9:	83 ec 0c             	sub    $0xc,%esp
c0008aac:	68 05 ba 00 c0       	push   $0xc000ba05
c0008ab1:	e8 ec 08 00 00       	call   c00093a2 <Printf>
c0008ab6:	83 c4 10             	add    $0x10,%esp
c0008ab9:	eb fe                	jmp    c0008ab9 <wait_exit+0xcc>

c0008abb <INIT_fork>:
c0008abb:	55                   	push   %ebp
c0008abc:	89 e5                	mov    %esp,%ebp
c0008abe:	83 ec 78             	sub    $0x78,%esp
c0008ac1:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008ac8:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008acf:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008ad5:	83 ec 08             	sub    $0x8,%esp
c0008ad8:	6a 02                	push   $0x2
c0008ada:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008add:	50                   	push   %eax
c0008ade:	e8 db d0 ff ff       	call   c0005bbe <open>
c0008ae3:	83 c4 10             	add    $0x10,%esp
c0008ae6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ae9:	83 ec 08             	sub    $0x8,%esp
c0008aec:	6a 02                	push   $0x2
c0008aee:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008af1:	50                   	push   %eax
c0008af2:	e8 c7 d0 ff ff       	call   c0005bbe <open>
c0008af7:	83 c4 10             	add    $0x10,%esp
c0008afa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008afd:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0008b04:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008b0b:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008b12:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008b19:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008b20:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008b27:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008b2e:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008b35:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008b3c:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008b43:	83 ec 0c             	sub    $0xc,%esp
c0008b46:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b49:	50                   	push   %eax
c0008b4a:	e8 53 08 00 00       	call   c00093a2 <Printf>
c0008b4f:	83 c4 10             	add    $0x10,%esp
c0008b52:	83 ec 0c             	sub    $0xc,%esp
c0008b55:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b58:	50                   	push   %eax
c0008b59:	e8 d2 32 00 00       	call   c000be30 <Strlen>
c0008b5e:	83 c4 10             	add    $0x10,%esp
c0008b61:	83 ec 04             	sub    $0x4,%esp
c0008b64:	50                   	push   %eax
c0008b65:	6a 00                	push   $0x0
c0008b67:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b6a:	50                   	push   %eax
c0008b6b:	e8 87 32 00 00       	call   c000bdf7 <Memset>
c0008b70:	83 c4 10             	add    $0x10,%esp
c0008b73:	83 ec 04             	sub    $0x4,%esp
c0008b76:	6a 28                	push   $0x28
c0008b78:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b7b:	50                   	push   %eax
c0008b7c:	ff 75 f0             	pushl  -0x10(%ebp)
c0008b7f:	e8 cf d0 ff ff       	call   c0005c53 <read>
c0008b84:	83 c4 10             	add    $0x10,%esp
c0008b87:	83 ec 0c             	sub    $0xc,%esp
c0008b8a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008b8d:	50                   	push   %eax
c0008b8e:	e8 0f 08 00 00       	call   c00093a2 <Printf>
c0008b93:	83 c4 10             	add    $0x10,%esp
c0008b96:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008b9d:	e8 7c d3 ff ff       	call   c0005f1e <fork>
c0008ba2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008ba5:	66 87 db             	xchg   %bx,%bx
c0008ba8:	83 ec 0c             	sub    $0xc,%esp
c0008bab:	6a 01                	push   $0x1
c0008bad:	e8 bc 06 00 00       	call   c000926e <delay>
c0008bb2:	83 c4 10             	add    $0x10,%esp
c0008bb5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008bb9:	0f 8e c5 00 00 00    	jle    c0008c84 <INIT_fork+0x1c9>
c0008bbf:	83 ec 0c             	sub    $0xc,%esp
c0008bc2:	68 13 ba 00 c0       	push   $0xc000ba13
c0008bc7:	e8 d6 07 00 00       	call   c00093a2 <Printf>
c0008bcc:	83 c4 10             	add    $0x10,%esp
c0008bcf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008bd3:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0008bda:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0008be1:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0008be8:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0008bef:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0008bf6:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0008bfd:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0008c04:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0008c0b:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0008c12:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0008c19:	83 ec 0c             	sub    $0xc,%esp
c0008c1c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c1f:	50                   	push   %eax
c0008c20:	e8 0b 32 00 00       	call   c000be30 <Strlen>
c0008c25:	83 c4 10             	add    $0x10,%esp
c0008c28:	83 ec 04             	sub    $0x4,%esp
c0008c2b:	50                   	push   %eax
c0008c2c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c2f:	50                   	push   %eax
c0008c30:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c33:	e8 9c d1 ff ff       	call   c0005dd4 <write>
c0008c38:	83 c4 10             	add    $0x10,%esp
c0008c3b:	83 ec 0c             	sub    $0xc,%esp
c0008c3e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c41:	50                   	push   %eax
c0008c42:	e8 e9 31 00 00       	call   c000be30 <Strlen>
c0008c47:	83 c4 10             	add    $0x10,%esp
c0008c4a:	83 ec 04             	sub    $0x4,%esp
c0008c4d:	50                   	push   %eax
c0008c4e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c51:	50                   	push   %eax
c0008c52:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c55:	e8 7a d1 ff ff       	call   c0005dd4 <write>
c0008c5a:	83 c4 10             	add    $0x10,%esp
c0008c5d:	83 ec 0c             	sub    $0xc,%esp
c0008c60:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c63:	50                   	push   %eax
c0008c64:	e8 c7 31 00 00       	call   c000be30 <Strlen>
c0008c69:	83 c4 10             	add    $0x10,%esp
c0008c6c:	83 ec 04             	sub    $0x4,%esp
c0008c6f:	50                   	push   %eax
c0008c70:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008c73:	50                   	push   %eax
c0008c74:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c77:	e8 58 d1 ff ff       	call   c0005dd4 <write>
c0008c7c:	83 c4 10             	add    $0x10,%esp
c0008c7f:	e9 c6 00 00 00       	jmp    c0008d4a <INIT_fork+0x28f>
c0008c84:	83 ec 0c             	sub    $0xc,%esp
c0008c87:	6a 01                	push   $0x1
c0008c89:	e8 e0 05 00 00       	call   c000926e <delay>
c0008c8e:	83 c4 10             	add    $0x10,%esp
c0008c91:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008c95:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0008c99:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c0008ca0:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0008ca7:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0008cae:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0008cb5:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0008cbc:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0008cc3:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008cca:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0008cd1:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0008cd8:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0008cdf:	66 87 db             	xchg   %bx,%bx
c0008ce2:	83 ec 0c             	sub    $0xc,%esp
c0008ce5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008ce8:	50                   	push   %eax
c0008ce9:	e8 42 31 00 00       	call   c000be30 <Strlen>
c0008cee:	83 c4 10             	add    $0x10,%esp
c0008cf1:	83 ec 04             	sub    $0x4,%esp
c0008cf4:	50                   	push   %eax
c0008cf5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008cf8:	50                   	push   %eax
c0008cf9:	ff 75 f4             	pushl  -0xc(%ebp)
c0008cfc:	e8 d3 d0 ff ff       	call   c0005dd4 <write>
c0008d01:	83 c4 10             	add    $0x10,%esp
c0008d04:	83 ec 0c             	sub    $0xc,%esp
c0008d07:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008d0a:	50                   	push   %eax
c0008d0b:	e8 20 31 00 00       	call   c000be30 <Strlen>
c0008d10:	83 c4 10             	add    $0x10,%esp
c0008d13:	83 ec 04             	sub    $0x4,%esp
c0008d16:	50                   	push   %eax
c0008d17:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008d1a:	50                   	push   %eax
c0008d1b:	ff 75 f4             	pushl  -0xc(%ebp)
c0008d1e:	e8 b1 d0 ff ff       	call   c0005dd4 <write>
c0008d23:	83 c4 10             	add    $0x10,%esp
c0008d26:	83 ec 0c             	sub    $0xc,%esp
c0008d29:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008d2c:	50                   	push   %eax
c0008d2d:	e8 fe 30 00 00       	call   c000be30 <Strlen>
c0008d32:	83 c4 10             	add    $0x10,%esp
c0008d35:	83 ec 04             	sub    $0x4,%esp
c0008d38:	50                   	push   %eax
c0008d39:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0008d3c:	50                   	push   %eax
c0008d3d:	ff 75 f4             	pushl  -0xc(%ebp)
c0008d40:	e8 8f d0 ff ff       	call   c0005dd4 <write>
c0008d45:	83 c4 10             	add    $0x10,%esp
c0008d48:	eb fe                	jmp    c0008d48 <INIT_fork+0x28d>
c0008d4a:	83 ec 04             	sub    $0x4,%esp
c0008d4d:	6a 28                	push   $0x28
c0008d4f:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008d52:	50                   	push   %eax
c0008d53:	ff 75 f0             	pushl  -0x10(%ebp)
c0008d56:	e8 f8 ce ff ff       	call   c0005c53 <read>
c0008d5b:	83 c4 10             	add    $0x10,%esp
c0008d5e:	83 ec 0c             	sub    $0xc,%esp
c0008d61:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008d64:	50                   	push   %eax
c0008d65:	e8 38 06 00 00       	call   c00093a2 <Printf>
c0008d6a:	83 c4 10             	add    $0x10,%esp
c0008d6d:	83 ec 0c             	sub    $0xc,%esp
c0008d70:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008d73:	50                   	push   %eax
c0008d74:	e8 29 06 00 00       	call   c00093a2 <Printf>
c0008d79:	83 c4 10             	add    $0x10,%esp
c0008d7c:	83 ec 0c             	sub    $0xc,%esp
c0008d7f:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008d82:	50                   	push   %eax
c0008d83:	e8 1a 06 00 00       	call   c00093a2 <Printf>
c0008d88:	83 c4 10             	add    $0x10,%esp
c0008d8b:	83 ec 0c             	sub    $0xc,%esp
c0008d8e:	68 19 ba 00 c0       	push   $0xc000ba19
c0008d93:	e8 23 09 00 00       	call   c00096bb <spin>
c0008d98:	83 c4 10             	add    $0x10,%esp
c0008d9b:	90                   	nop
c0008d9c:	c9                   	leave  
c0008d9d:	c3                   	ret    

c0008d9e <simple_shell>:
c0008d9e:	55                   	push   %ebp
c0008d9f:	89 e5                	mov    %esp,%ebp
c0008da1:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008da7:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008dae:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008db5:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008dbb:	83 ec 08             	sub    $0x8,%esp
c0008dbe:	6a 02                	push   $0x2
c0008dc0:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008dc3:	50                   	push   %eax
c0008dc4:	e8 f5 cd ff ff       	call   c0005bbe <open>
c0008dc9:	83 c4 10             	add    $0x10,%esp
c0008dcc:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008dcf:	83 ec 08             	sub    $0x8,%esp
c0008dd2:	6a 02                	push   $0x2
c0008dd4:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008dd7:	50                   	push   %eax
c0008dd8:	e8 e1 cd ff ff       	call   c0005bbe <open>
c0008ddd:	83 c4 10             	add    $0x10,%esp
c0008de0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008de3:	83 ec 04             	sub    $0x4,%esp
c0008de6:	68 80 00 00 00       	push   $0x80
c0008deb:	6a 00                	push   $0x0
c0008ded:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008df3:	50                   	push   %eax
c0008df4:	e8 fe 2f 00 00       	call   c000bdf7 <Memset>
c0008df9:	83 c4 10             	add    $0x10,%esp
c0008dfc:	83 ec 04             	sub    $0x4,%esp
c0008dff:	68 80 00 00 00       	push   $0x80
c0008e04:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008e0a:	50                   	push   %eax
c0008e0b:	ff 75 e0             	pushl  -0x20(%ebp)
c0008e0e:	e8 40 ce ff ff       	call   c0005c53 <read>
c0008e13:	83 c4 10             	add    $0x10,%esp
c0008e16:	83 ec 08             	sub    $0x8,%esp
c0008e19:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008e1f:	50                   	push   %eax
c0008e20:	68 21 ba 00 c0       	push   $0xc000ba21
c0008e25:	e8 78 05 00 00       	call   c00093a2 <Printf>
c0008e2a:	83 c4 10             	add    $0x10,%esp
c0008e2d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008e34:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008e3b:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008e41:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e44:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e47:	0f b6 00             	movzbl (%eax),%eax
c0008e4a:	88 45 db             	mov    %al,-0x25(%ebp)
c0008e4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e50:	0f b6 00             	movzbl (%eax),%eax
c0008e53:	3c 20                	cmp    $0x20,%al
c0008e55:	74 1d                	je     c0008e74 <simple_shell+0xd6>
c0008e57:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e5a:	0f b6 00             	movzbl (%eax),%eax
c0008e5d:	84 c0                	test   %al,%al
c0008e5f:	74 13                	je     c0008e74 <simple_shell+0xd6>
c0008e61:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008e65:	75 0d                	jne    c0008e74 <simple_shell+0xd6>
c0008e67:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e6a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008e6d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008e74:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e77:	0f b6 00             	movzbl (%eax),%eax
c0008e7a:	3c 20                	cmp    $0x20,%al
c0008e7c:	74 0a                	je     c0008e88 <simple_shell+0xea>
c0008e7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008e81:	0f b6 00             	movzbl (%eax),%eax
c0008e84:	84 c0                	test   %al,%al
c0008e86:	75 26                	jne    c0008eae <simple_shell+0x110>
c0008e88:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008e8c:	75 20                	jne    c0008eae <simple_shell+0x110>
c0008e8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008e91:	8d 50 01             	lea    0x1(%eax),%edx
c0008e94:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008e97:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008e9a:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008ea1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ea4:	c6 00 00             	movb   $0x0,(%eax)
c0008ea7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008eae:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008eb2:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008eb6:	75 8c                	jne    c0008e44 <simple_shell+0xa6>
c0008eb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ebb:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008ec2:	00 00 00 00 
c0008ec6:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0008ecd:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008ed3:	83 ec 08             	sub    $0x8,%esp
c0008ed6:	6a 02                	push   $0x2
c0008ed8:	50                   	push   %eax
c0008ed9:	e8 e0 cc ff ff       	call   c0005bbe <open>
c0008ede:	83 c4 10             	add    $0x10,%esp
c0008ee1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008ee4:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008ee8:	75 54                	jne    c0008f3e <simple_shell+0x1a0>
c0008eea:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008ef1:	eb 29                	jmp    c0008f1c <simple_shell+0x17e>
c0008ef3:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008ef9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008efc:	01 d0                	add    %edx,%eax
c0008efe:	0f b6 00             	movzbl (%eax),%eax
c0008f01:	0f be c0             	movsbl %al,%eax
c0008f04:	83 ec 04             	sub    $0x4,%esp
c0008f07:	50                   	push   %eax
c0008f08:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008f0b:	68 30 ba 00 c0       	push   $0xc000ba30
c0008f10:	e8 8d 04 00 00       	call   c00093a2 <Printf>
c0008f15:	83 c4 10             	add    $0x10,%esp
c0008f18:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008f1c:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008f20:	7e d1                	jle    c0008ef3 <simple_shell+0x155>
c0008f22:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008f28:	83 ec 08             	sub    $0x8,%esp
c0008f2b:	50                   	push   %eax
c0008f2c:	68 37 ba 00 c0       	push   $0xc000ba37
c0008f31:	e8 6c 04 00 00       	call   c00093a2 <Printf>
c0008f36:	83 c4 10             	add    $0x10,%esp
c0008f39:	e9 a5 fe ff ff       	jmp    c0008de3 <simple_shell+0x45>
c0008f3e:	e8 db cf ff ff       	call   c0005f1e <fork>
c0008f43:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008f46:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008f4a:	7e 17                	jle    c0008f63 <simple_shell+0x1c5>
c0008f4c:	83 ec 0c             	sub    $0xc,%esp
c0008f4f:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008f55:	50                   	push   %eax
c0008f56:	e8 50 cf ff ff       	call   c0005eab <wait>
c0008f5b:	83 c4 10             	add    $0x10,%esp
c0008f5e:	e9 80 fe ff ff       	jmp    c0008de3 <simple_shell+0x45>
c0008f63:	83 ec 0c             	sub    $0xc,%esp
c0008f66:	68 3d ba 00 c0       	push   $0xc000ba3d
c0008f6b:	e8 32 04 00 00       	call   c00093a2 <Printf>
c0008f70:	83 c4 10             	add    $0x10,%esp
c0008f73:	83 ec 0c             	sub    $0xc,%esp
c0008f76:	ff 75 d0             	pushl  -0x30(%ebp)
c0008f79:	e8 db ce ff ff       	call   c0005e59 <close>
c0008f7e:	83 c4 10             	add    $0x10,%esp
c0008f81:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008f87:	83 ec 08             	sub    $0x8,%esp
c0008f8a:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008f90:	52                   	push   %edx
c0008f91:	50                   	push   %eax
c0008f92:	e8 8b d0 ff ff       	call   c0006022 <execv>
c0008f97:	83 c4 10             	add    $0x10,%esp
c0008f9a:	eb fe                	jmp    c0008f9a <simple_shell+0x1fc>

c0008f9c <test_split_str>:
c0008f9c:	55                   	push   %ebp
c0008f9d:	89 e5                	mov    %esp,%ebp
c0008f9f:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008fa5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008fac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008fb3:	c7 45 ec 59 ba 00 c0 	movl   $0xc000ba59,-0x14(%ebp)
c0008fba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008fbe:	75 1a                	jne    c0008fda <test_split_str+0x3e>
c0008fc0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fc3:	0f b6 00             	movzbl (%eax),%eax
c0008fc6:	0f be c0             	movsbl %al,%eax
c0008fc9:	83 ec 08             	sub    $0x8,%esp
c0008fcc:	50                   	push   %eax
c0008fcd:	68 6a ba 00 c0       	push   $0xc000ba6a
c0008fd2:	e8 cb 03 00 00       	call   c00093a2 <Printf>
c0008fd7:	83 c4 10             	add    $0x10,%esp
c0008fda:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fdd:	0f b6 00             	movzbl (%eax),%eax
c0008fe0:	3c 20                	cmp    $0x20,%al
c0008fe2:	75 0a                	jne    c0008fee <test_split_str+0x52>
c0008fe4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fe7:	0f b6 00             	movzbl (%eax),%eax
c0008fea:	84 c0                	test   %al,%al
c0008fec:	74 13                	je     c0009001 <test_split_str+0x65>
c0008fee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008ff2:	75 0d                	jne    c0009001 <test_split_str+0x65>
c0008ff4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ff7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008ffa:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0009001:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009004:	0f b6 00             	movzbl (%eax),%eax
c0009007:	3c 20                	cmp    $0x20,%al
c0009009:	74 0a                	je     c0009015 <test_split_str+0x79>
c000900b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000900e:	0f b6 00             	movzbl (%eax),%eax
c0009011:	84 c0                	test   %al,%al
c0009013:	75 26                	jne    c000903b <test_split_str+0x9f>
c0009015:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0009019:	75 20                	jne    c000903b <test_split_str+0x9f>
c000901b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000901e:	8d 50 01             	lea    0x1(%eax),%edx
c0009021:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009024:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009027:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c000902e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009031:	c6 00 00             	movb   $0x0,(%eax)
c0009034:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000903b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000903f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009042:	0f b6 00             	movzbl (%eax),%eax
c0009045:	84 c0                	test   %al,%al
c0009047:	0f 85 6d ff ff ff    	jne    c0008fba <test_split_str+0x1e>
c000904d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009050:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009053:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c000905a:	83 ec 08             	sub    $0x8,%esp
c000905d:	ff 75 f4             	pushl  -0xc(%ebp)
c0009060:	68 73 ba 00 c0       	push   $0xc000ba73
c0009065:	e8 38 03 00 00       	call   c00093a2 <Printf>
c000906a:	83 c4 10             	add    $0x10,%esp
c000906d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0009074:	eb 22                	jmp    c0009098 <test_split_str+0xfc>
c0009076:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009079:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0009080:	83 ec 04             	sub    $0x4,%esp
c0009083:	50                   	push   %eax
c0009084:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009087:	68 8a ba 00 c0       	push   $0xc000ba8a
c000908c:	e8 11 03 00 00       	call   c00093a2 <Printf>
c0009091:	83 c4 10             	add    $0x10,%esp
c0009094:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0009098:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000909b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c000909e:	7e d6                	jle    c0009076 <test_split_str+0xda>
c00090a0:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c00090a6:	83 ec 08             	sub    $0x8,%esp
c00090a9:	68 99 ba 00 c0       	push   $0xc000ba99
c00090ae:	50                   	push   %eax
c00090af:	e8 f0 12 00 00       	call   c000a3a4 <strcmp>
c00090b4:	83 c4 10             	add    $0x10,%esp
c00090b7:	85 c0                	test   %eax,%eax
c00090b9:	75 10                	jne    c00090cb <test_split_str+0x12f>
c00090bb:	83 ec 0c             	sub    $0xc,%esp
c00090be:	68 9e ba 00 c0       	push   $0xc000ba9e
c00090c3:	e8 da 02 00 00       	call   c00093a2 <Printf>
c00090c8:	83 c4 10             	add    $0x10,%esp
c00090cb:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c00090d1:	83 ec 08             	sub    $0x8,%esp
c00090d4:	50                   	push   %eax
c00090d5:	68 aa ba 00 c0       	push   $0xc000baaa
c00090da:	e8 c3 02 00 00       	call   c00093a2 <Printf>
c00090df:	83 c4 10             	add    $0x10,%esp
c00090e2:	83 ec 0c             	sub    $0xc,%esp
c00090e5:	68 b8 ba 00 c0       	push   $0xc000bab8
c00090ea:	e8 b3 02 00 00       	call   c00093a2 <Printf>
c00090ef:	83 c4 10             	add    $0x10,%esp
c00090f2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00090f9:	eb 26                	jmp    c0009121 <test_split_str+0x185>
c00090fb:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0009101:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0009104:	01 d0                	add    %edx,%eax
c0009106:	0f b6 00             	movzbl (%eax),%eax
c0009109:	0f be c0             	movsbl %al,%eax
c000910c:	83 ec 08             	sub    $0x8,%esp
c000910f:	50                   	push   %eax
c0009110:	68 c7 ba 00 c0       	push   $0xc000bac7
c0009115:	e8 88 02 00 00       	call   c00093a2 <Printf>
c000911a:	83 c4 10             	add    $0x10,%esp
c000911d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0009121:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0009125:	7e d4                	jle    c00090fb <test_split_str+0x15f>
c0009127:	c9                   	leave  
c0009128:	c3                   	ret    

c0009129 <test_shell>:
c0009129:	55                   	push   %ebp
c000912a:	89 e5                	mov    %esp,%ebp
c000912c:	83 ec 38             	sub    $0x38,%esp
c000912f:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0009136:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c000913d:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0009143:	83 ec 08             	sub    $0x8,%esp
c0009146:	6a 02                	push   $0x2
c0009148:	8d 45 ea             	lea    -0x16(%ebp),%eax
c000914b:	50                   	push   %eax
c000914c:	e8 6d ca ff ff       	call   c0005bbe <open>
c0009151:	83 c4 10             	add    $0x10,%esp
c0009154:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009157:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c000915e:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0009165:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c000916c:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0009173:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c000917a:	83 ec 0c             	sub    $0xc,%esp
c000917d:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0009180:	50                   	push   %eax
c0009181:	e8 35 ea ff ff       	call   c0007bbb <untar>
c0009186:	83 c4 10             	add    $0x10,%esp
c0009189:	e8 10 fc ff ff       	call   c0008d9e <simple_shell>
c000918e:	90                   	nop
c000918f:	c9                   	leave  
c0009190:	c3                   	ret    

c0009191 <test_exec>:
c0009191:	55                   	push   %ebp
c0009192:	89 e5                	mov    %esp,%ebp
c0009194:	83 ec 38             	sub    $0x38,%esp
c0009197:	83 ec 0c             	sub    $0xc,%esp
c000919a:	68 13 b9 00 c0       	push   $0xc000b913
c000919f:	e8 e8 80 ff ff       	call   c000128c <disp_str>
c00091a4:	83 c4 10             	add    $0x10,%esp
c00091a7:	83 ec 0c             	sub    $0xc,%esp
c00091aa:	68 15 b9 00 c0       	push   $0xc000b915
c00091af:	e8 d8 80 ff ff       	call   c000128c <disp_str>
c00091b4:	83 c4 10             	add    $0x10,%esp
c00091b7:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c00091be:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c00091c5:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c00091cb:	83 ec 08             	sub    $0x8,%esp
c00091ce:	6a 02                	push   $0x2
c00091d0:	8d 45 ea             	lea    -0x16(%ebp),%eax
c00091d3:	50                   	push   %eax
c00091d4:	e8 e5 c9 ff ff       	call   c0005bbe <open>
c00091d9:	83 c4 10             	add    $0x10,%esp
c00091dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00091df:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c00091e6:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c00091ed:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c00091f4:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00091fb:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0009202:	83 ec 0c             	sub    $0xc,%esp
c0009205:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0009208:	50                   	push   %eax
c0009209:	e8 ad e9 ff ff       	call   c0007bbb <untar>
c000920e:	83 c4 10             	add    $0x10,%esp
c0009211:	6a 00                	push   $0x0
c0009213:	68 d0 ba 00 c0       	push   $0xc000bad0
c0009218:	68 99 ba 00 c0       	push   $0xc000ba99
c000921d:	68 d6 ba 00 c0       	push   $0xc000bad6
c0009222:	e8 e0 cf ff ff       	call   c0006207 <execl>
c0009227:	83 c4 10             	add    $0x10,%esp
c000922a:	eb fe                	jmp    c000922a <test_exec+0x99>

c000922c <INIT>:
c000922c:	55                   	push   %ebp
c000922d:	89 e5                	mov    %esp,%ebp
c000922f:	83 ec 08             	sub    $0x8,%esp
c0009232:	e8 f2 fe ff ff       	call   c0009129 <test_shell>
c0009237:	eb fe                	jmp    c0009237 <INIT+0xb>

c0009239 <TestA>:
c0009239:	55                   	push   %ebp
c000923a:	89 e5                	mov    %esp,%ebp
c000923c:	83 ec 08             	sub    $0x8,%esp
c000923f:	83 ec 0c             	sub    $0xc,%esp
c0009242:	6a 05                	push   $0x5
c0009244:	e8 28 ed ff ff       	call   c0007f71 <disp_int>
c0009249:	83 c4 10             	add    $0x10,%esp
c000924c:	83 ec 0c             	sub    $0xc,%esp
c000924f:	68 0f b6 00 c0       	push   $0xc000b60f
c0009254:	e8 33 80 ff ff       	call   c000128c <disp_str>
c0009259:	83 c4 10             	add    $0x10,%esp
c000925c:	83 ec 0c             	sub    $0xc,%esp
c000925f:	68 dc ba 00 c0       	push   $0xc000badc
c0009264:	e8 23 80 ff ff       	call   c000128c <disp_str>
c0009269:	83 c4 10             	add    $0x10,%esp
c000926c:	eb fe                	jmp    c000926c <TestA+0x33>

c000926e <delay>:
c000926e:	55                   	push   %ebp
c000926f:	89 e5                	mov    %esp,%ebp
c0009271:	83 ec 10             	sub    $0x10,%esp
c0009274:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000927b:	eb 2a                	jmp    c00092a7 <delay+0x39>
c000927d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0009284:	eb 17                	jmp    c000929d <delay+0x2f>
c0009286:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000928d:	eb 04                	jmp    c0009293 <delay+0x25>
c000928f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009293:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009297:	7e f6                	jle    c000928f <delay+0x21>
c0009299:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000929d:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c00092a1:	7e e3                	jle    c0009286 <delay+0x18>
c00092a3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00092a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00092aa:	3b 45 08             	cmp    0x8(%ebp),%eax
c00092ad:	7c ce                	jl     c000927d <delay+0xf>
c00092af:	90                   	nop
c00092b0:	c9                   	leave  
c00092b1:	c3                   	ret    

c00092b2 <TestB>:
c00092b2:	55                   	push   %ebp
c00092b3:	89 e5                	mov    %esp,%ebp
c00092b5:	83 ec 08             	sub    $0x8,%esp
c00092b8:	83 ec 0c             	sub    $0xc,%esp
c00092bb:	68 e3 ba 00 c0       	push   $0xc000bae3
c00092c0:	e8 c7 7f ff ff       	call   c000128c <disp_str>
c00092c5:	83 c4 10             	add    $0x10,%esp
c00092c8:	eb fe                	jmp    c00092c8 <TestB+0x16>

c00092ca <TestC>:
c00092ca:	55                   	push   %ebp
c00092cb:	89 e5                	mov    %esp,%ebp
c00092cd:	83 ec 18             	sub    $0x18,%esp
c00092d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00092d7:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c00092db:	77 1a                	ja     c00092f7 <TestC+0x2d>
c00092dd:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c00092e4:	83 ec 08             	sub    $0x8,%esp
c00092e7:	ff 75 f0             	pushl  -0x10(%ebp)
c00092ea:	68 e6 ba 00 c0       	push   $0xc000bae6
c00092ef:	e8 ae 00 00 00       	call   c00093a2 <Printf>
c00092f4:	83 c4 10             	add    $0x10,%esp
c00092f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00092fb:	eb da                	jmp    c00092d7 <TestC+0xd>

c00092fd <sys_get_ticks>:
c00092fd:	55                   	push   %ebp
c00092fe:	89 e5                	mov    %esp,%ebp
c0009300:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0009305:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000930b:	5d                   	pop    %ebp
c000930c:	c3                   	ret    

c000930d <sys_write>:
c000930d:	55                   	push   %ebp
c000930e:	89 e5                	mov    %esp,%ebp
c0009310:	83 ec 18             	sub    $0x18,%esp
c0009313:	8b 45 10             	mov    0x10(%ebp),%eax
c0009316:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c000931c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009322:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0009327:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000932a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000932d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009330:	8b 45 08             	mov    0x8(%ebp),%eax
c0009333:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009336:	eb 20                	jmp    c0009358 <sys_write+0x4b>
c0009338:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000933b:	0f b6 00             	movzbl (%eax),%eax
c000933e:	0f b6 c0             	movzbl %al,%eax
c0009341:	83 ec 08             	sub    $0x8,%esp
c0009344:	50                   	push   %eax
c0009345:	ff 75 ec             	pushl  -0x14(%ebp)
c0009348:	e8 e2 bb ff ff       	call   c0004f2f <out_char>
c000934d:	83 c4 10             	add    $0x10,%esp
c0009350:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009354:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0009358:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000935c:	7f da                	jg     c0009338 <sys_write+0x2b>
c000935e:	90                   	nop
c000935f:	c9                   	leave  
c0009360:	c3                   	ret    

c0009361 <milli_delay>:
c0009361:	55                   	push   %ebp
c0009362:	89 e5                	mov    %esp,%ebp
c0009364:	83 ec 18             	sub    $0x18,%esp
c0009367:	e8 58 0e 00 00       	call   c000a1c4 <get_ticks_ipc>
c000936c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000936f:	90                   	nop
c0009370:	e8 4f 0e 00 00       	call   c000a1c4 <get_ticks_ipc>
c0009375:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0009378:	89 c1                	mov    %eax,%ecx
c000937a:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c000937f:	89 c8                	mov    %ecx,%eax
c0009381:	f7 ea                	imul   %edx
c0009383:	c1 fa 05             	sar    $0x5,%edx
c0009386:	89 c8                	mov    %ecx,%eax
c0009388:	c1 f8 1f             	sar    $0x1f,%eax
c000938b:	29 c2                	sub    %eax,%edx
c000938d:	89 d0                	mov    %edx,%eax
c000938f:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0009395:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009398:	77 d6                	ja     c0009370 <milli_delay+0xf>
c000939a:	90                   	nop
c000939b:	c9                   	leave  
c000939c:	c3                   	ret    

c000939d <TaskSys>:
c000939d:	55                   	push   %ebp
c000939e:	89 e5                	mov    %esp,%ebp
c00093a0:	eb fe                	jmp    c00093a0 <TaskSys+0x3>

c00093a2 <Printf>:
c00093a2:	55                   	push   %ebp
c00093a3:	89 e5                	mov    %esp,%ebp
c00093a5:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00093ab:	83 ec 04             	sub    $0x4,%esp
c00093ae:	68 00 01 00 00       	push   $0x100
c00093b3:	6a 00                	push   $0x0
c00093b5:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00093bb:	50                   	push   %eax
c00093bc:	e8 36 2a 00 00       	call   c000bdf7 <Memset>
c00093c1:	83 c4 10             	add    $0x10,%esp
c00093c4:	8d 45 0c             	lea    0xc(%ebp),%eax
c00093c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00093ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00093cd:	83 ec 04             	sub    $0x4,%esp
c00093d0:	ff 75 f4             	pushl  -0xc(%ebp)
c00093d3:	50                   	push   %eax
c00093d4:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00093da:	50                   	push   %eax
c00093db:	e8 20 00 00 00       	call   c0009400 <vsprintf>
c00093e0:	83 c4 10             	add    $0x10,%esp
c00093e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00093e6:	83 ec 04             	sub    $0x4,%esp
c00093e9:	ff 75 f0             	pushl  -0x10(%ebp)
c00093ec:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00093f2:	50                   	push   %eax
c00093f3:	6a 00                	push   $0x0
c00093f5:	e8 da c9 ff ff       	call   c0005dd4 <write>
c00093fa:	83 c4 10             	add    $0x10,%esp
c00093fd:	90                   	nop
c00093fe:	c9                   	leave  
c00093ff:	c3                   	ret    

c0009400 <vsprintf>:
c0009400:	55                   	push   %ebp
c0009401:	89 e5                	mov    %esp,%ebp
c0009403:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0009409:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000940f:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0009415:	83 ec 04             	sub    $0x4,%esp
c0009418:	6a 40                	push   $0x40
c000941a:	6a 00                	push   $0x0
c000941c:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009422:	50                   	push   %eax
c0009423:	e8 cf 29 00 00       	call   c000bdf7 <Memset>
c0009428:	83 c4 10             	add    $0x10,%esp
c000942b:	8b 45 10             	mov    0x10(%ebp),%eax
c000942e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009431:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009438:	8b 45 08             	mov    0x8(%ebp),%eax
c000943b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000943e:	e9 53 01 00 00       	jmp    c0009596 <vsprintf+0x196>
c0009443:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009446:	0f b6 00             	movzbl (%eax),%eax
c0009449:	3c 25                	cmp    $0x25,%al
c000944b:	74 16                	je     c0009463 <vsprintf+0x63>
c000944d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009450:	8d 50 01             	lea    0x1(%eax),%edx
c0009453:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009456:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009459:	0f b6 12             	movzbl (%edx),%edx
c000945c:	88 10                	mov    %dl,(%eax)
c000945e:	e9 2f 01 00 00       	jmp    c0009592 <vsprintf+0x192>
c0009463:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009467:	8b 45 0c             	mov    0xc(%ebp),%eax
c000946a:	0f b6 00             	movzbl (%eax),%eax
c000946d:	0f be c0             	movsbl %al,%eax
c0009470:	83 f8 64             	cmp    $0x64,%eax
c0009473:	74 26                	je     c000949b <vsprintf+0x9b>
c0009475:	83 f8 64             	cmp    $0x64,%eax
c0009478:	7f 0e                	jg     c0009488 <vsprintf+0x88>
c000947a:	83 f8 63             	cmp    $0x63,%eax
c000947d:	0f 84 f2 00 00 00    	je     c0009575 <vsprintf+0x175>
c0009483:	e9 0a 01 00 00       	jmp    c0009592 <vsprintf+0x192>
c0009488:	83 f8 73             	cmp    $0x73,%eax
c000948b:	0f 84 b0 00 00 00    	je     c0009541 <vsprintf+0x141>
c0009491:	83 f8 78             	cmp    $0x78,%eax
c0009494:	74 5d                	je     c00094f3 <vsprintf+0xf3>
c0009496:	e9 f7 00 00 00       	jmp    c0009592 <vsprintf+0x192>
c000949b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000949e:	8b 00                	mov    (%eax),%eax
c00094a0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00094a3:	83 ec 04             	sub    $0x4,%esp
c00094a6:	6a 0a                	push   $0xa
c00094a8:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c00094ae:	50                   	push   %eax
c00094af:	ff 75 e8             	pushl  -0x18(%ebp)
c00094b2:	e8 64 0d 00 00       	call   c000a21b <itoa>
c00094b7:	83 c4 10             	add    $0x10,%esp
c00094ba:	83 ec 08             	sub    $0x8,%esp
c00094bd:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c00094c3:	50                   	push   %eax
c00094c4:	ff 75 f4             	pushl  -0xc(%ebp)
c00094c7:	e8 4a 29 00 00       	call   c000be16 <Strcpy>
c00094cc:	83 c4 10             	add    $0x10,%esp
c00094cf:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00094d3:	83 ec 0c             	sub    $0xc,%esp
c00094d6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c00094dc:	50                   	push   %eax
c00094dd:	e8 4e 29 00 00       	call   c000be30 <Strlen>
c00094e2:	83 c4 10             	add    $0x10,%esp
c00094e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00094e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094eb:	01 45 f4             	add    %eax,-0xc(%ebp)
c00094ee:	e9 9f 00 00 00       	jmp    c0009592 <vsprintf+0x192>
c00094f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094f6:	8b 00                	mov    (%eax),%eax
c00094f8:	83 ec 08             	sub    $0x8,%esp
c00094fb:	50                   	push   %eax
c00094fc:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009502:	50                   	push   %eax
c0009503:	e8 c3 e9 ff ff       	call   c0007ecb <atoi>
c0009508:	83 c4 10             	add    $0x10,%esp
c000950b:	83 ec 08             	sub    $0x8,%esp
c000950e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009514:	50                   	push   %eax
c0009515:	ff 75 f4             	pushl  -0xc(%ebp)
c0009518:	e8 f9 28 00 00       	call   c000be16 <Strcpy>
c000951d:	83 c4 10             	add    $0x10,%esp
c0009520:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009524:	83 ec 0c             	sub    $0xc,%esp
c0009527:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000952d:	50                   	push   %eax
c000952e:	e8 fd 28 00 00       	call   c000be30 <Strlen>
c0009533:	83 c4 10             	add    $0x10,%esp
c0009536:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009539:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000953c:	01 45 f4             	add    %eax,-0xc(%ebp)
c000953f:	eb 51                	jmp    c0009592 <vsprintf+0x192>
c0009541:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009544:	8b 00                	mov    (%eax),%eax
c0009546:	83 ec 08             	sub    $0x8,%esp
c0009549:	50                   	push   %eax
c000954a:	ff 75 f4             	pushl  -0xc(%ebp)
c000954d:	e8 c4 28 00 00       	call   c000be16 <Strcpy>
c0009552:	83 c4 10             	add    $0x10,%esp
c0009555:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009558:	8b 00                	mov    (%eax),%eax
c000955a:	83 ec 0c             	sub    $0xc,%esp
c000955d:	50                   	push   %eax
c000955e:	e8 cd 28 00 00       	call   c000be30 <Strlen>
c0009563:	83 c4 10             	add    $0x10,%esp
c0009566:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009569:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000956d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009570:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009573:	eb 1d                	jmp    c0009592 <vsprintf+0x192>
c0009575:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009578:	0f b6 10             	movzbl (%eax),%edx
c000957b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000957e:	88 10                	mov    %dl,(%eax)
c0009580:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009584:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000958b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000958e:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009591:	90                   	nop
c0009592:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009596:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009599:	0f b6 00             	movzbl (%eax),%eax
c000959c:	84 c0                	test   %al,%al
c000959e:	0f 85 9f fe ff ff    	jne    c0009443 <vsprintf+0x43>
c00095a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095a7:	2b 45 08             	sub    0x8(%ebp),%eax
c00095aa:	c9                   	leave  
c00095ab:	c3                   	ret    

c00095ac <printx>:
c00095ac:	55                   	push   %ebp
c00095ad:	89 e5                	mov    %esp,%ebp
c00095af:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00095b5:	8d 45 0c             	lea    0xc(%ebp),%eax
c00095b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00095bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00095be:	83 ec 04             	sub    $0x4,%esp
c00095c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00095c4:	50                   	push   %eax
c00095c5:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00095cb:	50                   	push   %eax
c00095cc:	e8 2f fe ff ff       	call   c0009400 <vsprintf>
c00095d1:	83 c4 10             	add    $0x10,%esp
c00095d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00095d7:	83 ec 08             	sub    $0x8,%esp
c00095da:	ff 75 f0             	pushl  -0x10(%ebp)
c00095dd:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00095e3:	50                   	push   %eax
c00095e4:	e8 7f 90 ff ff       	call   c0002668 <write_debug>
c00095e9:	83 c4 10             	add    $0x10,%esp
c00095ec:	90                   	nop
c00095ed:	c9                   	leave  
c00095ee:	c3                   	ret    

c00095ef <sys_printx>:
c00095ef:	55                   	push   %ebp
c00095f0:	89 e5                	mov    %esp,%ebp
c00095f2:	83 ec 28             	sub    $0x28,%esp
c00095f5:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c00095fa:	85 c0                	test   %eax,%eax
c00095fc:	75 15                	jne    c0009613 <sys_printx+0x24>
c00095fe:	8b 45 10             	mov    0x10(%ebp),%eax
c0009601:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009607:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000960a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009611:	eb 10                	jmp    c0009623 <sys_printx+0x34>
c0009613:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009618:	85 c0                	test   %eax,%eax
c000961a:	74 07                	je     c0009623 <sys_printx+0x34>
c000961c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009623:	8b 55 08             	mov    0x8(%ebp),%edx
c0009626:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009629:	01 d0                	add    %edx,%eax
c000962b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000962e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009631:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009637:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c000963d:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0009642:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009645:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009648:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000964b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000964e:	0f b6 00             	movzbl (%eax),%eax
c0009651:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0009654:	eb 3a                	jmp    c0009690 <sys_printx+0xa1>
c0009656:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009659:	0f b6 00             	movzbl (%eax),%eax
c000965c:	3c 3b                	cmp    $0x3b,%al
c000965e:	74 0a                	je     c000966a <sys_printx+0x7b>
c0009660:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009663:	0f b6 00             	movzbl (%eax),%eax
c0009666:	3c 3a                	cmp    $0x3a,%al
c0009668:	75 06                	jne    c0009670 <sys_printx+0x81>
c000966a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000966e:	eb 20                	jmp    c0009690 <sys_printx+0xa1>
c0009670:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009673:	0f b6 00             	movzbl (%eax),%eax
c0009676:	0f b6 c0             	movzbl %al,%eax
c0009679:	83 ec 08             	sub    $0x8,%esp
c000967c:	50                   	push   %eax
c000967d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009680:	e8 aa b8 ff ff       	call   c0004f2f <out_char>
c0009685:	83 c4 10             	add    $0x10,%esp
c0009688:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000968c:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009690:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009694:	7f c0                	jg     c0009656 <sys_printx+0x67>
c0009696:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c000969a:	75 10                	jne    c00096ac <sys_printx+0xbd>
c000969c:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c00096a1:	85 c0                	test   %eax,%eax
c00096a3:	74 13                	je     c00096b8 <sys_printx+0xc9>
c00096a5:	e8 11 7e ff ff       	call   c00014bb <disable_int>
c00096aa:	eb 0c                	jmp    c00096b8 <sys_printx+0xc9>
c00096ac:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c00096b0:	75 06                	jne    c00096b8 <sys_printx+0xc9>
c00096b2:	e8 04 7e ff ff       	call   c00014bb <disable_int>
c00096b7:	90                   	nop
c00096b8:	90                   	nop
c00096b9:	c9                   	leave  
c00096ba:	c3                   	ret    

c00096bb <spin>:
c00096bb:	55                   	push   %ebp
c00096bc:	89 e5                	mov    %esp,%ebp
c00096be:	83 ec 08             	sub    $0x8,%esp
c00096c1:	83 ec 0c             	sub    $0xc,%esp
c00096c4:	ff 75 08             	pushl  0x8(%ebp)
c00096c7:	e8 c0 7b ff ff       	call   c000128c <disp_str>
c00096cc:	83 c4 10             	add    $0x10,%esp
c00096cf:	83 ec 0c             	sub    $0xc,%esp
c00096d2:	68 0f b6 00 c0       	push   $0xc000b60f
c00096d7:	e8 b0 7b ff ff       	call   c000128c <disp_str>
c00096dc:	83 c4 10             	add    $0x10,%esp
c00096df:	eb fe                	jmp    c00096df <spin+0x24>

c00096e1 <panic>:
c00096e1:	55                   	push   %ebp
c00096e2:	89 e5                	mov    %esp,%ebp
c00096e4:	83 ec 08             	sub    $0x8,%esp
c00096e7:	83 ec 04             	sub    $0x4,%esp
c00096ea:	ff 75 08             	pushl  0x8(%ebp)
c00096ed:	6a 3a                	push   $0x3a
c00096ef:	68 f3 ba 00 c0       	push   $0xc000baf3
c00096f4:	e8 b3 fe ff ff       	call   c00095ac <printx>
c00096f9:	83 c4 10             	add    $0x10,%esp
c00096fc:	90                   	nop
c00096fd:	c9                   	leave  
c00096fe:	c3                   	ret    

c00096ff <assertion_failure>:
c00096ff:	55                   	push   %ebp
c0009700:	89 e5                	mov    %esp,%ebp
c0009702:	83 ec 08             	sub    $0x8,%esp
c0009705:	83 ec 08             	sub    $0x8,%esp
c0009708:	ff 75 14             	pushl  0x14(%ebp)
c000970b:	ff 75 10             	pushl  0x10(%ebp)
c000970e:	ff 75 0c             	pushl  0xc(%ebp)
c0009711:	ff 75 08             	pushl  0x8(%ebp)
c0009714:	6a 3b                	push   $0x3b
c0009716:	68 fc ba 00 c0       	push   $0xc000bafc
c000971b:	e8 8c fe ff ff       	call   c00095ac <printx>
c0009720:	83 c4 20             	add    $0x20,%esp
c0009723:	83 ec 0c             	sub    $0xc,%esp
c0009726:	68 2f bb 00 c0       	push   $0xc000bb2f
c000972b:	e8 8b ff ff ff       	call   c00096bb <spin>
c0009730:	83 c4 10             	add    $0x10,%esp
c0009733:	90                   	nop
c0009734:	c9                   	leave  
c0009735:	c3                   	ret    

c0009736 <dead_lock>:
c0009736:	55                   	push   %ebp
c0009737:	89 e5                	mov    %esp,%ebp
c0009739:	b8 00 00 00 00       	mov    $0x0,%eax
c000973e:	5d                   	pop    %ebp
c000973f:	c3                   	ret    

c0009740 <sys_send_msg>:
c0009740:	55                   	push   %ebp
c0009741:	89 e5                	mov    %esp,%ebp
c0009743:	83 ec 38             	sub    $0x38,%esp
c0009746:	83 ec 0c             	sub    $0xc,%esp
c0009749:	ff 75 0c             	pushl  0xc(%ebp)
c000974c:	e8 6b b1 ff ff       	call   c00048bc <pid2proc>
c0009751:	83 c4 10             	add    $0x10,%esp
c0009754:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009757:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000975b:	74 2c                	je     c0009789 <sys_send_msg+0x49>
c000975d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009760:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009766:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c000976b:	74 1c                	je     c0009789 <sys_send_msg+0x49>
c000976d:	68 40 05 00 00       	push   $0x540
c0009772:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009777:	68 3b bb 00 c0       	push   $0xc000bb3b
c000977c:	68 4c bb 00 c0       	push   $0xc000bb4c
c0009781:	e8 79 ff ff ff       	call   c00096ff <assertion_failure>
c0009786:	83 c4 10             	add    $0x10,%esp
c0009789:	8b 45 10             	mov    0x10(%ebp),%eax
c000978c:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009792:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009797:	74 1c                	je     c00097b5 <sys_send_msg+0x75>
c0009799:	68 42 05 00 00       	push   $0x542
c000979e:	68 3b bb 00 c0       	push   $0xc000bb3b
c00097a3:	68 3b bb 00 c0       	push   $0xc000bb3b
c00097a8:	68 74 bb 00 c0       	push   $0xc000bb74
c00097ad:	e8 4d ff ff ff       	call   c00096ff <assertion_failure>
c00097b2:	83 c4 10             	add    $0x10,%esp
c00097b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00097b9:	75 22                	jne    c00097dd <sys_send_msg+0x9d>
c00097bb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00097bf:	75 1c                	jne    c00097dd <sys_send_msg+0x9d>
c00097c1:	68 45 05 00 00       	push   $0x545
c00097c6:	68 3b bb 00 c0       	push   $0xc000bb3b
c00097cb:	68 3b bb 00 c0       	push   $0xc000bb3b
c00097d0:	68 97 bb 00 c0       	push   $0xc000bb97
c00097d5:	e8 25 ff ff ff       	call   c00096ff <assertion_failure>
c00097da:	83 c4 10             	add    $0x10,%esp
c00097dd:	83 ec 0c             	sub    $0xc,%esp
c00097e0:	ff 75 10             	pushl  0x10(%ebp)
c00097e3:	e8 46 b1 ff ff       	call   c000492e <proc2pid>
c00097e8:	83 c4 10             	add    $0x10,%esp
c00097eb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00097ee:	8b 45 10             	mov    0x10(%ebp),%eax
c00097f1:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c00097f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00097fa:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009801:	8b 45 08             	mov    0x8(%ebp),%eax
c0009804:	83 ec 08             	sub    $0x8,%esp
c0009807:	6a 7c                	push   $0x7c
c0009809:	50                   	push   %eax
c000980a:	e8 3d d6 ff ff       	call   c0006e4c <alloc_virtual_memory>
c000980f:	83 c4 10             	add    $0x10,%esp
c0009812:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009815:	c7 45 d8 7c 00 00 00 	movl   $0x7c,-0x28(%ebp)
c000981c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000981f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009825:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009828:	89 10                	mov    %edx,(%eax)
c000982a:	83 ec 08             	sub    $0x8,%esp
c000982d:	ff 75 0c             	pushl  0xc(%ebp)
c0009830:	ff 75 e8             	pushl  -0x18(%ebp)
c0009833:	e8 fe fe ff ff       	call   c0009736 <dead_lock>
c0009838:	83 c4 10             	add    $0x10,%esp
c000983b:	83 f8 01             	cmp    $0x1,%eax
c000983e:	75 10                	jne    c0009850 <sys_send_msg+0x110>
c0009840:	83 ec 0c             	sub    $0xc,%esp
c0009843:	68 a7 bb 00 c0       	push   $0xc000bba7
c0009848:	e8 94 fe ff ff       	call   c00096e1 <panic>
c000984d:	83 c4 10             	add    $0x10,%esp
c0009850:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009853:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000985a:	3c 02                	cmp    $0x2,%al
c000985c:	0f 85 99 01 00 00    	jne    c00099fb <sys_send_msg+0x2bb>
c0009862:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009865:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000986b:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000986e:	74 12                	je     c0009882 <sys_send_msg+0x142>
c0009870:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009873:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009879:	83 f8 12             	cmp    $0x12,%eax
c000987c:	0f 85 79 01 00 00    	jne    c00099fb <sys_send_msg+0x2bb>
c0009882:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009885:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c000988b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000988e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009891:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009897:	83 ec 08             	sub    $0x8,%esp
c000989a:	6a 7c                	push   $0x7c
c000989c:	50                   	push   %eax
c000989d:	e8 aa d5 ff ff       	call   c0006e4c <alloc_virtual_memory>
c00098a2:	83 c4 10             	add    $0x10,%esp
c00098a5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00098a8:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00098ab:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00098ae:	83 ec 04             	sub    $0x4,%esp
c00098b1:	ff 75 d8             	pushl  -0x28(%ebp)
c00098b4:	52                   	push   %edx
c00098b5:	50                   	push   %eax
c00098b6:	e8 cd e2 ff ff       	call   c0007b88 <Memcpy>
c00098bb:	83 c4 10             	add    $0x10,%esp
c00098be:	8b 45 10             	mov    0x10(%ebp),%eax
c00098c1:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c00098c8:	00 00 00 
c00098cb:	8b 45 10             	mov    0x10(%ebp),%eax
c00098ce:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00098d5:	8b 45 10             	mov    0x10(%ebp),%eax
c00098d8:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00098df:	00 00 00 
c00098e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00098e5:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c00098ec:	00 00 00 
c00098ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00098f2:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00098f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00098fc:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009903:	00 00 00 
c0009906:	8b 45 10             	mov    0x10(%ebp),%eax
c0009909:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009910:	00 00 00 
c0009913:	83 ec 0c             	sub    $0xc,%esp
c0009916:	ff 75 ec             	pushl  -0x14(%ebp)
c0009919:	e8 56 08 00 00       	call   c000a174 <unblock>
c000991e:	83 c4 10             	add    $0x10,%esp
c0009921:	8b 45 10             	mov    0x10(%ebp),%eax
c0009924:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000992b:	84 c0                	test   %al,%al
c000992d:	74 1c                	je     c000994b <sys_send_msg+0x20b>
c000992f:	68 76 05 00 00       	push   $0x576
c0009934:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009939:	68 3b bb 00 c0       	push   $0xc000bb3b
c000993e:	68 b2 bb 00 c0       	push   $0xc000bbb2
c0009943:	e8 b7 fd ff ff       	call   c00096ff <assertion_failure>
c0009948:	83 c4 10             	add    $0x10,%esp
c000994b:	8b 45 10             	mov    0x10(%ebp),%eax
c000994e:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009954:	83 f8 21             	cmp    $0x21,%eax
c0009957:	74 1c                	je     c0009975 <sys_send_msg+0x235>
c0009959:	68 77 05 00 00       	push   $0x577
c000995e:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009963:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009968:	68 c6 bb 00 c0       	push   $0xc000bbc6
c000996d:	e8 8d fd ff ff       	call   c00096ff <assertion_failure>
c0009972:	83 c4 10             	add    $0x10,%esp
c0009975:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009978:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000997e:	85 c0                	test   %eax,%eax
c0009980:	74 1c                	je     c000999e <sys_send_msg+0x25e>
c0009982:	68 79 05 00 00       	push   $0x579
c0009987:	68 3b bb 00 c0       	push   $0xc000bb3b
c000998c:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009991:	68 e3 bb 00 c0       	push   $0xc000bbe3
c0009996:	e8 64 fd ff ff       	call   c00096ff <assertion_failure>
c000999b:	83 c4 10             	add    $0x10,%esp
c000999e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099a1:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c00099a8:	84 c0                	test   %al,%al
c00099aa:	74 1c                	je     c00099c8 <sys_send_msg+0x288>
c00099ac:	68 7a 05 00 00       	push   $0x57a
c00099b1:	68 3b bb 00 c0       	push   $0xc000bb3b
c00099b6:	68 3b bb 00 c0       	push   $0xc000bb3b
c00099bb:	68 f8 bb 00 c0       	push   $0xc000bbf8
c00099c0:	e8 3a fd ff ff       	call   c00096ff <assertion_failure>
c00099c5:	83 c4 10             	add    $0x10,%esp
c00099c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099cb:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00099d1:	83 f8 21             	cmp    $0x21,%eax
c00099d4:	0f 84 45 01 00 00    	je     c0009b1f <sys_send_msg+0x3df>
c00099da:	68 7b 05 00 00       	push   $0x57b
c00099df:	68 3b bb 00 c0       	push   $0xc000bb3b
c00099e4:	68 3b bb 00 c0       	push   $0xc000bb3b
c00099e9:	68 10 bc 00 c0       	push   $0xc000bc10
c00099ee:	e8 0c fd ff ff       	call   c00096ff <assertion_failure>
c00099f3:	83 c4 10             	add    $0x10,%esp
c00099f6:	e9 24 01 00 00       	jmp    c0009b1f <sys_send_msg+0x3df>
c00099fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009a02:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009a05:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009a08:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009a0b:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009a11:	85 c0                	test   %eax,%eax
c0009a13:	75 1b                	jne    c0009a30 <sys_send_msg+0x2f0>
c0009a15:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009a18:	8b 55 10             	mov    0x10(%ebp),%edx
c0009a1b:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009a21:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a24:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009a2b:	00 00 00 
c0009a2e:	eb 3f                	jmp    c0009a6f <sys_send_msg+0x32f>
c0009a30:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009a33:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009a39:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a3c:	eb 12                	jmp    c0009a50 <sys_send_msg+0x310>
c0009a3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009a41:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009a44:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009a47:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009a4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a50:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009a54:	75 e8                	jne    c0009a3e <sys_send_msg+0x2fe>
c0009a56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a59:	8b 55 10             	mov    0x10(%ebp),%edx
c0009a5c:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009a62:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a65:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009a6c:	00 00 00 
c0009a6f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a72:	8b 55 08             	mov    0x8(%ebp),%edx
c0009a75:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009a7b:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a7e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009a81:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009a87:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a8a:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c0009a91:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a94:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009a9b:	3c 01                	cmp    $0x1,%al
c0009a9d:	74 1c                	je     c0009abb <sys_send_msg+0x37b>
c0009a9f:	68 9c 05 00 00       	push   $0x59c
c0009aa4:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009aa9:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009aae:	68 34 bc 00 c0       	push   $0xc000bc34
c0009ab3:	e8 47 fc ff ff       	call   c00096ff <assertion_failure>
c0009ab8:	83 c4 10             	add    $0x10,%esp
c0009abb:	8b 45 10             	mov    0x10(%ebp),%eax
c0009abe:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009ac4:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0009ac7:	74 1c                	je     c0009ae5 <sys_send_msg+0x3a5>
c0009ac9:	68 9d 05 00 00       	push   $0x59d
c0009ace:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009ad3:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009ad8:	68 50 bc 00 c0       	push   $0xc000bc50
c0009add:	e8 1d fc ff ff       	call   c00096ff <assertion_failure>
c0009ae2:	83 c4 10             	add    $0x10,%esp
c0009ae5:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ae8:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009aee:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009af1:	74 1c                	je     c0009b0f <sys_send_msg+0x3cf>
c0009af3:	68 9e 05 00 00       	push   $0x59e
c0009af8:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009afd:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009b02:	68 72 bc 00 c0       	push   $0xc000bc72
c0009b07:	e8 f3 fb ff ff       	call   c00096ff <assertion_failure>
c0009b0c:	83 c4 10             	add    $0x10,%esp
c0009b0f:	83 ec 0c             	sub    $0xc,%esp
c0009b12:	ff 75 10             	pushl  0x10(%ebp)
c0009b15:	e8 1e 06 00 00       	call   c000a138 <block>
c0009b1a:	83 c4 10             	add    $0x10,%esp
c0009b1d:	eb 01                	jmp    c0009b20 <sys_send_msg+0x3e0>
c0009b1f:	90                   	nop
c0009b20:	b8 00 00 00 00       	mov    $0x0,%eax
c0009b25:	c9                   	leave  
c0009b26:	c3                   	ret    

c0009b27 <sys_receive_msg>:
c0009b27:	55                   	push   %ebp
c0009b28:	89 e5                	mov    %esp,%ebp
c0009b2a:	83 ec 48             	sub    $0x48,%esp
c0009b2d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009b34:	83 ec 0c             	sub    $0xc,%esp
c0009b37:	ff 75 0c             	pushl  0xc(%ebp)
c0009b3a:	e8 7d ad ff ff       	call   c00048bc <pid2proc>
c0009b3f:	83 c4 10             	add    $0x10,%esp
c0009b42:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009b45:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0009b49:	74 2c                	je     c0009b77 <sys_receive_msg+0x50>
c0009b4b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009b4e:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009b54:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009b59:	74 1c                	je     c0009b77 <sys_receive_msg+0x50>
c0009b5b:	68 b2 05 00 00       	push   $0x5b2
c0009b60:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009b65:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009b6a:	68 74 bb 00 c0       	push   $0xc000bb74
c0009b6f:	e8 8b fb ff ff       	call   c00096ff <assertion_failure>
c0009b74:	83 c4 10             	add    $0x10,%esp
c0009b77:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b7a:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009b80:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009b85:	74 1c                	je     c0009ba3 <sys_receive_msg+0x7c>
c0009b87:	68 b4 05 00 00       	push   $0x5b4
c0009b8c:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009b91:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009b96:	68 4c bb 00 c0       	push   $0xc000bb4c
c0009b9b:	e8 5f fb ff ff       	call   c00096ff <assertion_failure>
c0009ba0:	83 c4 10             	add    $0x10,%esp
c0009ba3:	83 ec 0c             	sub    $0xc,%esp
c0009ba6:	ff 75 10             	pushl  0x10(%ebp)
c0009ba9:	e8 80 ad ff ff       	call   c000492e <proc2pid>
c0009bae:	83 c4 10             	add    $0x10,%esp
c0009bb1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009bb4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0009bbb:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bbe:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0009bc4:	85 c0                	test   %eax,%eax
c0009bc6:	0f 84 c6 00 00 00    	je     c0009c92 <sys_receive_msg+0x16b>
c0009bcc:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009bd0:	74 0d                	je     c0009bdf <sys_receive_msg+0xb8>
c0009bd2:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c0009bd9:	0f 85 b3 00 00 00    	jne    c0009c92 <sys_receive_msg+0x16b>
c0009bdf:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c0009be6:	83 ec 0c             	sub    $0xc,%esp
c0009be9:	ff 75 dc             	pushl  -0x24(%ebp)
c0009bec:	e8 d3 8a ff ff       	call   c00026c4 <sys_malloc>
c0009bf1:	83 c4 10             	add    $0x10,%esp
c0009bf4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009bf7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009bfa:	83 ec 04             	sub    $0x4,%esp
c0009bfd:	50                   	push   %eax
c0009bfe:	6a 00                	push   $0x0
c0009c00:	ff 75 d8             	pushl  -0x28(%ebp)
c0009c03:	e8 ef 21 00 00       	call   c000bdf7 <Memset>
c0009c08:	83 c4 10             	add    $0x10,%esp
c0009c0b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009c0e:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009c14:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009c17:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c0009c1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c21:	83 ec 08             	sub    $0x8,%esp
c0009c24:	ff 75 dc             	pushl  -0x24(%ebp)
c0009c27:	50                   	push   %eax
c0009c28:	e8 1f d2 ff ff       	call   c0006e4c <alloc_virtual_memory>
c0009c2d:	83 c4 10             	add    $0x10,%esp
c0009c30:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009c33:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009c36:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009c39:	83 ec 04             	sub    $0x4,%esp
c0009c3c:	52                   	push   %edx
c0009c3d:	ff 75 d8             	pushl  -0x28(%ebp)
c0009c40:	50                   	push   %eax
c0009c41:	e8 42 df ff ff       	call   c0007b88 <Memcpy>
c0009c46:	83 c4 10             	add    $0x10,%esp
c0009c49:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c4c:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0009c53:	00 00 00 
c0009c56:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c59:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009c60:	00 00 00 
c0009c63:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c66:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009c6d:	00 00 00 
c0009c70:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c73:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009c7a:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0009c81:	83 ec 08             	sub    $0x8,%esp
c0009c84:	ff 75 dc             	pushl  -0x24(%ebp)
c0009c87:	ff 75 d8             	pushl  -0x28(%ebp)
c0009c8a:	e8 4a 8a ff ff       	call   c00026d9 <sys_free>
c0009c8f:	83 c4 10             	add    $0x10,%esp
c0009c92:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009c96:	0f 84 96 03 00 00    	je     c000a032 <sys_receive_msg+0x50b>
c0009c9c:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009ca0:	75 26                	jne    c0009cc8 <sys_receive_msg+0x1a1>
c0009ca2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ca5:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009cab:	85 c0                	test   %eax,%eax
c0009cad:	0f 84 8a 00 00 00    	je     c0009d3d <sys_receive_msg+0x216>
c0009cb3:	8b 45 10             	mov    0x10(%ebp),%eax
c0009cb6:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009cbc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009cbf:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009cc6:	eb 75                	jmp    c0009d3d <sys_receive_msg+0x216>
c0009cc8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009ccc:	78 6f                	js     c0009d3d <sys_receive_msg+0x216>
c0009cce:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c0009cd2:	7f 69                	jg     c0009d3d <sys_receive_msg+0x216>
c0009cd4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009cd7:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009cde:	3c 01                	cmp    $0x1,%al
c0009ce0:	75 5b                	jne    c0009d3d <sys_receive_msg+0x216>
c0009ce2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009ce5:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009ceb:	83 f8 12             	cmp    $0x12,%eax
c0009cee:	74 0e                	je     c0009cfe <sys_receive_msg+0x1d7>
c0009cf0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009cf3:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009cf9:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009cfc:	75 3f                	jne    c0009d3d <sys_receive_msg+0x216>
c0009cfe:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d01:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009d07:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009d0a:	eb 2b                	jmp    c0009d37 <sys_receive_msg+0x210>
c0009d0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d0f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009d12:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d15:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0009d1b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009d1e:	39 c2                	cmp    %eax,%edx
c0009d20:	75 09                	jne    c0009d2b <sys_receive_msg+0x204>
c0009d22:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009d29:	eb 12                	jmp    c0009d3d <sys_receive_msg+0x216>
c0009d2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d2e:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009d34:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009d37:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009d3b:	75 cf                	jne    c0009d0c <sys_receive_msg+0x1e5>
c0009d3d:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009d41:	0f 85 21 02 00 00    	jne    c0009f68 <sys_receive_msg+0x441>
c0009d47:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d4a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009d4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009d50:	83 ec 08             	sub    $0x8,%esp
c0009d53:	6a 7c                	push   $0x7c
c0009d55:	50                   	push   %eax
c0009d56:	e8 f1 d0 ff ff       	call   c0006e4c <alloc_virtual_memory>
c0009d5b:	83 c4 10             	add    $0x10,%esp
c0009d5e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009d61:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009d64:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009d6a:	83 ec 08             	sub    $0x8,%esp
c0009d6d:	6a 7c                	push   $0x7c
c0009d6f:	50                   	push   %eax
c0009d70:	e8 d7 d0 ff ff       	call   c0006e4c <alloc_virtual_memory>
c0009d75:	83 c4 10             	add    $0x10,%esp
c0009d78:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009d7b:	83 ec 04             	sub    $0x4,%esp
c0009d7e:	6a 7c                	push   $0x7c
c0009d80:	ff 75 c8             	pushl  -0x38(%ebp)
c0009d83:	ff 75 cc             	pushl  -0x34(%ebp)
c0009d86:	e8 fd dd ff ff       	call   c0007b88 <Memcpy>
c0009d8b:	83 c4 10             	add    $0x10,%esp
c0009d8e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009d91:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009d94:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d97:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009d9d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0009da0:	75 21                	jne    c0009dc3 <sys_receive_msg+0x29c>
c0009da2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009da5:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009dab:	8b 45 10             	mov    0x10(%ebp),%eax
c0009dae:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009db4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009db7:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009dbe:	00 00 00 
c0009dc1:	eb 1f                	jmp    c0009de2 <sys_receive_msg+0x2bb>
c0009dc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009dc6:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c0009dcc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009dcf:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009dd5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009dd8:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009ddf:	00 00 00 
c0009de2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009de5:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009dec:	00 00 00 
c0009def:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009df2:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009df9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009dfc:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009e03:	00 00 00 
c0009e06:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e09:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009e10:	00 00 00 
c0009e13:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e16:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009e1d:	00 00 00 
c0009e20:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e23:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009e2a:	00 00 00 
c0009e2d:	83 ec 0c             	sub    $0xc,%esp
c0009e30:	ff 75 d0             	pushl  -0x30(%ebp)
c0009e33:	e8 3c 03 00 00       	call   c000a174 <unblock>
c0009e38:	83 c4 10             	add    $0x10,%esp
c0009e3b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009e3e:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009e44:	85 c0                	test   %eax,%eax
c0009e46:	74 1c                	je     c0009e64 <sys_receive_msg+0x33d>
c0009e48:	68 1e 06 00 00       	push   $0x61e
c0009e4d:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009e52:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009e57:	68 87 bc 00 c0       	push   $0xc000bc87
c0009e5c:	e8 9e f8 ff ff       	call   c00096ff <assertion_failure>
c0009e61:	83 c4 10             	add    $0x10,%esp
c0009e64:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009e67:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e6e:	84 c0                	test   %al,%al
c0009e70:	74 1c                	je     c0009e8e <sys_receive_msg+0x367>
c0009e72:	68 1f 06 00 00       	push   $0x61f
c0009e77:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009e7c:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009e81:	68 9f bc 00 c0       	push   $0xc000bc9f
c0009e86:	e8 74 f8 ff ff       	call   c00096ff <assertion_failure>
c0009e8b:	83 c4 10             	add    $0x10,%esp
c0009e8e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009e91:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009e97:	83 f8 21             	cmp    $0x21,%eax
c0009e9a:	74 1c                	je     c0009eb8 <sys_receive_msg+0x391>
c0009e9c:	68 20 06 00 00       	push   $0x620
c0009ea1:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009ea6:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009eab:	68 b8 bc 00 c0       	push   $0xc000bcb8
c0009eb0:	e8 4a f8 ff ff       	call   c00096ff <assertion_failure>
c0009eb5:	83 c4 10             	add    $0x10,%esp
c0009eb8:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ebb:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009ec1:	85 c0                	test   %eax,%eax
c0009ec3:	74 1c                	je     c0009ee1 <sys_receive_msg+0x3ba>
c0009ec5:	68 22 06 00 00       	push   $0x622
c0009eca:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009ecf:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009ed4:	68 e3 bb 00 c0       	push   $0xc000bbe3
c0009ed9:	e8 21 f8 ff ff       	call   c00096ff <assertion_failure>
c0009ede:	83 c4 10             	add    $0x10,%esp
c0009ee1:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ee4:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009eeb:	84 c0                	test   %al,%al
c0009eed:	74 1c                	je     c0009f0b <sys_receive_msg+0x3e4>
c0009eef:	68 23 06 00 00       	push   $0x623
c0009ef4:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009ef9:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009efe:	68 f8 bb 00 c0       	push   $0xc000bbf8
c0009f03:	e8 f7 f7 ff ff       	call   c00096ff <assertion_failure>
c0009f08:	83 c4 10             	add    $0x10,%esp
c0009f0b:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f0e:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009f14:	83 f8 21             	cmp    $0x21,%eax
c0009f17:	74 1c                	je     c0009f35 <sys_receive_msg+0x40e>
c0009f19:	68 24 06 00 00       	push   $0x624
c0009f1e:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009f23:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009f28:	68 10 bc 00 c0       	push   $0xc000bc10
c0009f2d:	e8 cd f7 ff ff       	call   c00096ff <assertion_failure>
c0009f32:	83 c4 10             	add    $0x10,%esp
c0009f35:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f38:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009f3e:	83 f8 21             	cmp    $0x21,%eax
c0009f41:	0f 84 e4 00 00 00    	je     c000a02b <sys_receive_msg+0x504>
c0009f47:	68 25 06 00 00       	push   $0x625
c0009f4c:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009f51:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009f56:	68 dc bc 00 c0       	push   $0xc000bcdc
c0009f5b:	e8 9f f7 ff ff       	call   c00096ff <assertion_failure>
c0009f60:	83 c4 10             	add    $0x10,%esp
c0009f63:	e9 c3 00 00 00       	jmp    c000a02b <sys_receive_msg+0x504>
c0009f68:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f6b:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c0009f72:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f75:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f7c:	3c 02                	cmp    $0x2,%al
c0009f7e:	74 1c                	je     c0009f9c <sys_receive_msg+0x475>
c0009f80:	68 2a 06 00 00       	push   $0x62a
c0009f85:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009f8a:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009f8f:	68 fb bc 00 c0       	push   $0xc000bcfb
c0009f94:	e8 66 f7 ff ff       	call   c00096ff <assertion_failure>
c0009f99:	83 c4 10             	add    $0x10,%esp
c0009f9c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f9f:	8b 55 08             	mov    0x8(%ebp),%edx
c0009fa2:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009fa8:	8b 45 10             	mov    0x10(%ebp),%eax
c0009fab:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009fb2:	3c 02                	cmp    $0x2,%al
c0009fb4:	74 1c                	je     c0009fd2 <sys_receive_msg+0x4ab>
c0009fb6:	68 2c 06 00 00       	push   $0x62c
c0009fbb:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009fc0:	68 3b bb 00 c0       	push   $0xc000bb3b
c0009fc5:	68 fb bc 00 c0       	push   $0xc000bcfb
c0009fca:	e8 30 f7 ff ff       	call   c00096ff <assertion_failure>
c0009fcf:	83 c4 10             	add    $0x10,%esp
c0009fd2:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c0009fd6:	75 0f                	jne    c0009fe7 <sys_receive_msg+0x4c0>
c0009fd8:	8b 45 10             	mov    0x10(%ebp),%eax
c0009fdb:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c0009fe2:	00 00 00 
c0009fe5:	eb 0c                	jmp    c0009ff3 <sys_receive_msg+0x4cc>
c0009fe7:	8b 45 10             	mov    0x10(%ebp),%eax
c0009fea:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009fed:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009ff3:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ff6:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ffd:	3c 02                	cmp    $0x2,%al
c0009fff:	74 1c                	je     c000a01d <sys_receive_msg+0x4f6>
c000a001:	68 37 06 00 00       	push   $0x637
c000a006:	68 3b bb 00 c0       	push   $0xc000bb3b
c000a00b:	68 3b bb 00 c0       	push   $0xc000bb3b
c000a010:	68 fb bc 00 c0       	push   $0xc000bcfb
c000a015:	e8 e5 f6 ff ff       	call   c00096ff <assertion_failure>
c000a01a:	83 c4 10             	add    $0x10,%esp
c000a01d:	83 ec 0c             	sub    $0xc,%esp
c000a020:	ff 75 10             	pushl  0x10(%ebp)
c000a023:	e8 10 01 00 00       	call   c000a138 <block>
c000a028:	83 c4 10             	add    $0x10,%esp
c000a02b:	b8 00 00 00 00       	mov    $0x0,%eax
c000a030:	eb 02                	jmp    c000a034 <sys_receive_msg+0x50d>
c000a032:	90                   	nop
c000a033:	90                   	nop
c000a034:	c9                   	leave  
c000a035:	c3                   	ret    

c000a036 <disp_str_colour_debug>:
c000a036:	55                   	push   %ebp
c000a037:	89 e5                	mov    %esp,%ebp
c000a039:	90                   	nop
c000a03a:	5d                   	pop    %ebp
c000a03b:	c3                   	ret    

c000a03c <send_rec>:
c000a03c:	55                   	push   %ebp
c000a03d:	89 e5                	mov    %esp,%ebp
c000a03f:	83 ec 18             	sub    $0x18,%esp
c000a042:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a045:	83 ec 0c             	sub    $0xc,%esp
c000a048:	50                   	push   %eax
c000a049:	e8 cc ce ff ff       	call   c0006f1a <get_physical_address>
c000a04e:	83 c4 10             	add    $0x10,%esp
c000a051:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a054:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a058:	74 28                	je     c000a082 <send_rec+0x46>
c000a05a:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a05e:	74 22                	je     c000a082 <send_rec+0x46>
c000a060:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a064:	74 1c                	je     c000a082 <send_rec+0x46>
c000a066:	68 57 06 00 00       	push   $0x657
c000a06b:	68 3b bb 00 c0       	push   $0xc000bb3b
c000a070:	68 3b bb 00 c0       	push   $0xc000bb3b
c000a075:	68 1c bd 00 c0       	push   $0xc000bd1c
c000a07a:	e8 80 f6 ff ff       	call   c00096ff <assertion_failure>
c000a07f:	83 c4 10             	add    $0x10,%esp
c000a082:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a086:	75 12                	jne    c000a09a <send_rec+0x5e>
c000a088:	83 ec 04             	sub    $0x4,%esp
c000a08b:	6a 7c                	push   $0x7c
c000a08d:	6a 00                	push   $0x0
c000a08f:	ff 75 0c             	pushl  0xc(%ebp)
c000a092:	e8 60 1d 00 00       	call   c000bdf7 <Memset>
c000a097:	83 c4 10             	add    $0x10,%esp
c000a09a:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a09e:	74 23                	je     c000a0c3 <send_rec+0x87>
c000a0a0:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a0a4:	74 34                	je     c000a0da <send_rec+0x9e>
c000a0a6:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a0aa:	75 72                	jne    c000a11e <send_rec+0xe2>
c000a0ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0af:	83 ec 08             	sub    $0x8,%esp
c000a0b2:	ff 75 10             	pushl  0x10(%ebp)
c000a0b5:	50                   	push   %eax
c000a0b6:	e8 cd 85 ff ff       	call   c0002688 <send_msg>
c000a0bb:	83 c4 10             	add    $0x10,%esp
c000a0be:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0c1:	eb 6e                	jmp    c000a131 <send_rec+0xf5>
c000a0c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0c6:	83 ec 08             	sub    $0x8,%esp
c000a0c9:	ff 75 10             	pushl  0x10(%ebp)
c000a0cc:	50                   	push   %eax
c000a0cd:	e8 dc 85 ff ff       	call   c00026ae <receive_msg>
c000a0d2:	83 c4 10             	add    $0x10,%esp
c000a0d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0d8:	eb 57                	jmp    c000a131 <send_rec+0xf5>
c000a0da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0dd:	83 ec 08             	sub    $0x8,%esp
c000a0e0:	ff 75 10             	pushl  0x10(%ebp)
c000a0e3:	50                   	push   %eax
c000a0e4:	e8 9f 85 ff ff       	call   c0002688 <send_msg>
c000a0e9:	83 c4 10             	add    $0x10,%esp
c000a0ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a0f3:	75 3b                	jne    c000a130 <send_rec+0xf4>
c000a0f5:	83 ec 04             	sub    $0x4,%esp
c000a0f8:	6a 7c                	push   $0x7c
c000a0fa:	6a 00                	push   $0x0
c000a0fc:	ff 75 0c             	pushl  0xc(%ebp)
c000a0ff:	e8 f3 1c 00 00       	call   c000bdf7 <Memset>
c000a104:	83 c4 10             	add    $0x10,%esp
c000a107:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a10a:	83 ec 08             	sub    $0x8,%esp
c000a10d:	ff 75 10             	pushl  0x10(%ebp)
c000a110:	50                   	push   %eax
c000a111:	e8 98 85 ff ff       	call   c00026ae <receive_msg>
c000a116:	83 c4 10             	add    $0x10,%esp
c000a119:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a11c:	eb 12                	jmp    c000a130 <send_rec+0xf4>
c000a11e:	83 ec 0c             	sub    $0xc,%esp
c000a121:	68 58 bd 00 c0       	push   $0xc000bd58
c000a126:	e8 b6 f5 ff ff       	call   c00096e1 <panic>
c000a12b:	83 c4 10             	add    $0x10,%esp
c000a12e:	eb 01                	jmp    c000a131 <send_rec+0xf5>
c000a130:	90                   	nop
c000a131:	b8 00 00 00 00       	mov    $0x0,%eax
c000a136:	c9                   	leave  
c000a137:	c3                   	ret    

c000a138 <block>:
c000a138:	55                   	push   %ebp
c000a139:	89 e5                	mov    %esp,%ebp
c000a13b:	83 ec 08             	sub    $0x8,%esp
c000a13e:	8b 45 08             	mov    0x8(%ebp),%eax
c000a141:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a148:	84 c0                	test   %al,%al
c000a14a:	75 1c                	jne    c000a168 <block+0x30>
c000a14c:	68 86 06 00 00       	push   $0x686
c000a151:	68 3b bb 00 c0       	push   $0xc000bb3b
c000a156:	68 3b bb 00 c0       	push   $0xc000bb3b
c000a15b:	68 6d bd 00 c0       	push   $0xc000bd6d
c000a160:	e8 9a f5 ff ff       	call   c00096ff <assertion_failure>
c000a165:	83 c4 10             	add    $0x10,%esp
c000a168:	e8 da a5 ff ff       	call   c0004747 <schedule_process>
c000a16d:	b8 00 00 00 00       	mov    $0x0,%eax
c000a172:	c9                   	leave  
c000a173:	c3                   	ret    

c000a174 <unblock>:
c000a174:	55                   	push   %ebp
c000a175:	89 e5                	mov    %esp,%ebp
c000a177:	83 ec 08             	sub    $0x8,%esp
c000a17a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a17d:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a184:	84 c0                	test   %al,%al
c000a186:	74 1c                	je     c000a1a4 <unblock+0x30>
c000a188:	68 8f 06 00 00       	push   $0x68f
c000a18d:	68 3b bb 00 c0       	push   $0xc000bb3b
c000a192:	68 3b bb 00 c0       	push   $0xc000bb3b
c000a197:	68 85 bd 00 c0       	push   $0xc000bd85
c000a19c:	e8 5e f5 ff ff       	call   c00096ff <assertion_failure>
c000a1a1:	83 c4 10             	add    $0x10,%esp
c000a1a4:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1a7:	05 00 01 00 00       	add    $0x100,%eax
c000a1ac:	83 ec 08             	sub    $0x8,%esp
c000a1af:	50                   	push   %eax
c000a1b0:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a1b5:	e8 56 0a 00 00       	call   c000ac10 <appendToDoubleLinkList>
c000a1ba:	83 c4 10             	add    $0x10,%esp
c000a1bd:	b8 00 00 00 00       	mov    $0x0,%eax
c000a1c2:	c9                   	leave  
c000a1c3:	c3                   	ret    

c000a1c4 <get_ticks_ipc>:
c000a1c4:	55                   	push   %ebp
c000a1c5:	89 e5                	mov    %esp,%ebp
c000a1c7:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000a1cd:	83 ec 04             	sub    $0x4,%esp
c000a1d0:	6a 7c                	push   $0x7c
c000a1d2:	6a 00                	push   $0x0
c000a1d4:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a1da:	50                   	push   %eax
c000a1db:	e8 17 1c 00 00       	call   c000bdf7 <Memset>
c000a1e0:	83 c4 10             	add    $0x10,%esp
c000a1e3:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c000a1ea:	00 00 00 
c000a1ed:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a1f4:	83 ec 04             	sub    $0x4,%esp
c000a1f7:	6a 01                	push   $0x1
c000a1f9:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a1ff:	50                   	push   %eax
c000a200:	6a 03                	push   $0x3
c000a202:	e8 35 fe ff ff       	call   c000a03c <send_rec>
c000a207:	83 c4 10             	add    $0x10,%esp
c000a20a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a20d:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c000a213:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a216:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a219:	c9                   	leave  
c000a21a:	c3                   	ret    

c000a21b <itoa>:
c000a21b:	55                   	push   %ebp
c000a21c:	89 e5                	mov    %esp,%ebp
c000a21e:	53                   	push   %ebx
c000a21f:	83 ec 14             	sub    $0x14,%esp
c000a222:	8b 45 08             	mov    0x8(%ebp),%eax
c000a225:	99                   	cltd   
c000a226:	f7 7d 10             	idivl  0x10(%ebp)
c000a229:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a22c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a22f:	99                   	cltd   
c000a230:	f7 7d 10             	idivl  0x10(%ebp)
c000a233:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a236:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a23a:	74 14                	je     c000a250 <itoa+0x35>
c000a23c:	83 ec 04             	sub    $0x4,%esp
c000a23f:	ff 75 10             	pushl  0x10(%ebp)
c000a242:	ff 75 0c             	pushl  0xc(%ebp)
c000a245:	ff 75 f0             	pushl  -0x10(%ebp)
c000a248:	e8 ce ff ff ff       	call   c000a21b <itoa>
c000a24d:	83 c4 10             	add    $0x10,%esp
c000a250:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a253:	8d 58 30             	lea    0x30(%eax),%ebx
c000a256:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a259:	8b 00                	mov    (%eax),%eax
c000a25b:	8d 48 01             	lea    0x1(%eax),%ecx
c000a25e:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a261:	89 0a                	mov    %ecx,(%edx)
c000a263:	89 da                	mov    %ebx,%edx
c000a265:	88 10                	mov    %dl,(%eax)
c000a267:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a26a:	8b 00                	mov    (%eax),%eax
c000a26c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a26f:	c9                   	leave  
c000a270:	c3                   	ret    

c000a271 <i2a>:
c000a271:	55                   	push   %ebp
c000a272:	89 e5                	mov    %esp,%ebp
c000a274:	53                   	push   %ebx
c000a275:	83 ec 14             	sub    $0x14,%esp
c000a278:	8b 45 08             	mov    0x8(%ebp),%eax
c000a27b:	99                   	cltd   
c000a27c:	f7 7d 0c             	idivl  0xc(%ebp)
c000a27f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a282:	8b 45 08             	mov    0x8(%ebp),%eax
c000a285:	99                   	cltd   
c000a286:	f7 7d 0c             	idivl  0xc(%ebp)
c000a289:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a28c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a290:	74 14                	je     c000a2a6 <i2a+0x35>
c000a292:	83 ec 04             	sub    $0x4,%esp
c000a295:	ff 75 10             	pushl  0x10(%ebp)
c000a298:	ff 75 0c             	pushl  0xc(%ebp)
c000a29b:	ff 75 f0             	pushl  -0x10(%ebp)
c000a29e:	e8 ce ff ff ff       	call   c000a271 <i2a>
c000a2a3:	83 c4 10             	add    $0x10,%esp
c000a2a6:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a2aa:	7f 0a                	jg     c000a2b6 <i2a+0x45>
c000a2ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2af:	83 c0 30             	add    $0x30,%eax
c000a2b2:	89 c3                	mov    %eax,%ebx
c000a2b4:	eb 08                	jmp    c000a2be <i2a+0x4d>
c000a2b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2b9:	83 c0 37             	add    $0x37,%eax
c000a2bc:	89 c3                	mov    %eax,%ebx
c000a2be:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2c1:	8b 00                	mov    (%eax),%eax
c000a2c3:	8d 48 01             	lea    0x1(%eax),%ecx
c000a2c6:	8b 55 10             	mov    0x10(%ebp),%edx
c000a2c9:	89 0a                	mov    %ecx,(%edx)
c000a2cb:	88 18                	mov    %bl,(%eax)
c000a2cd:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2d0:	8b 00                	mov    (%eax),%eax
c000a2d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a2d5:	c9                   	leave  
c000a2d6:	c3                   	ret    

c000a2d7 <inform_int>:
c000a2d7:	55                   	push   %ebp
c000a2d8:	89 e5                	mov    %esp,%ebp
c000a2da:	83 ec 18             	sub    $0x18,%esp
c000a2dd:	83 ec 0c             	sub    $0xc,%esp
c000a2e0:	ff 75 08             	pushl  0x8(%ebp)
c000a2e3:	e8 d4 a5 ff ff       	call   c00048bc <pid2proc>
c000a2e8:	83 c4 10             	add    $0x10,%esp
c000a2eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a2ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2f1:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a2f8:	0f be c0             	movsbl %al,%eax
c000a2fb:	83 e0 02             	and    $0x2,%eax
c000a2fe:	85 c0                	test   %eax,%eax
c000a300:	0f 84 8e 00 00 00    	je     c000a394 <inform_int+0xbd>
c000a306:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a309:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a30f:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a314:	74 0e                	je     c000a324 <inform_int+0x4d>
c000a316:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a319:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a31f:	83 f8 12             	cmp    $0x12,%eax
c000a322:	75 7d                	jne    c000a3a1 <inform_int+0xca>
c000a324:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c000a32b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a32e:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a334:	83 ec 08             	sub    $0x8,%esp
c000a337:	ff 75 f0             	pushl  -0x10(%ebp)
c000a33a:	50                   	push   %eax
c000a33b:	e8 0c cb ff ff       	call   c0006e4c <alloc_virtual_memory>
c000a340:	83 c4 10             	add    $0x10,%esp
c000a343:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a346:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a349:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a34f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a352:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c000a359:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a35c:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a363:	00 00 00 
c000a366:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a369:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a370:	00 00 00 
c000a373:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a37a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a37d:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a384:	83 ec 0c             	sub    $0xc,%esp
c000a387:	ff 75 f4             	pushl  -0xc(%ebp)
c000a38a:	e8 e5 fd ff ff       	call   c000a174 <unblock>
c000a38f:	83 c4 10             	add    $0x10,%esp
c000a392:	eb 0d                	jmp    c000a3a1 <inform_int+0xca>
c000a394:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a397:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a39e:	00 00 00 
c000a3a1:	90                   	nop
c000a3a2:	c9                   	leave  
c000a3a3:	c3                   	ret    

c000a3a4 <strcmp>:
c000a3a4:	55                   	push   %ebp
c000a3a5:	89 e5                	mov    %esp,%ebp
c000a3a7:	83 ec 10             	sub    $0x10,%esp
c000a3aa:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a3ae:	74 06                	je     c000a3b6 <strcmp+0x12>
c000a3b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a3b4:	75 08                	jne    c000a3be <strcmp+0x1a>
c000a3b6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a3b9:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a3bc:	eb 53                	jmp    c000a411 <strcmp+0x6d>
c000a3be:	8b 45 08             	mov    0x8(%ebp),%eax
c000a3c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a3c4:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a3c7:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a3ca:	eb 18                	jmp    c000a3e4 <strcmp+0x40>
c000a3cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a3cf:	0f b6 10             	movzbl (%eax),%edx
c000a3d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a3d5:	0f b6 00             	movzbl (%eax),%eax
c000a3d8:	38 c2                	cmp    %al,%dl
c000a3da:	75 1e                	jne    c000a3fa <strcmp+0x56>
c000a3dc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a3e0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a3e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a3e7:	0f b6 00             	movzbl (%eax),%eax
c000a3ea:	84 c0                	test   %al,%al
c000a3ec:	74 0d                	je     c000a3fb <strcmp+0x57>
c000a3ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a3f1:	0f b6 00             	movzbl (%eax),%eax
c000a3f4:	84 c0                	test   %al,%al
c000a3f6:	75 d4                	jne    c000a3cc <strcmp+0x28>
c000a3f8:	eb 01                	jmp    c000a3fb <strcmp+0x57>
c000a3fa:	90                   	nop
c000a3fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a3fe:	0f b6 00             	movzbl (%eax),%eax
c000a401:	0f be d0             	movsbl %al,%edx
c000a404:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a407:	0f b6 00             	movzbl (%eax),%eax
c000a40a:	0f be c0             	movsbl %al,%eax
c000a40d:	29 c2                	sub    %eax,%edx
c000a40f:	89 d0                	mov    %edx,%eax
c000a411:	c9                   	leave  
c000a412:	c3                   	ret    

c000a413 <create_user_process_address_space>:
c000a413:	55                   	push   %ebp
c000a414:	89 e5                	mov    %esp,%ebp
c000a416:	83 ec 18             	sub    $0x18,%esp
c000a419:	83 ec 08             	sub    $0x8,%esp
c000a41c:	6a 00                	push   $0x0
c000a41e:	6a 01                	push   $0x1
c000a420:	e8 a4 cc ff ff       	call   c00070c9 <alloc_memory>
c000a425:	83 c4 10             	add    $0x10,%esp
c000a428:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a42b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a42e:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a435:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a43c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a43f:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a444:	c1 e8 0c             	shr    $0xc,%eax
c000a447:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a44a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a44d:	83 c0 07             	add    $0x7,%eax
c000a450:	c1 e8 03             	shr    $0x3,%eax
c000a453:	89 c2                	mov    %eax,%edx
c000a455:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a458:	89 50 04             	mov    %edx,0x4(%eax)
c000a45b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a45e:	8b 40 04             	mov    0x4(%eax),%eax
c000a461:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a466:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a46c:	85 c0                	test   %eax,%eax
c000a46e:	0f 48 c2             	cmovs  %edx,%eax
c000a471:	c1 f8 0c             	sar    $0xc,%eax
c000a474:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a477:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a47a:	83 ec 08             	sub    $0x8,%esp
c000a47d:	6a 00                	push   $0x0
c000a47f:	50                   	push   %eax
c000a480:	e8 44 cc ff ff       	call   c00070c9 <alloc_memory>
c000a485:	83 c4 10             	add    $0x10,%esp
c000a488:	89 c2                	mov    %eax,%edx
c000a48a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a48d:	89 10                	mov    %edx,(%eax)
c000a48f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a492:	83 ec 0c             	sub    $0xc,%esp
c000a495:	50                   	push   %eax
c000a496:	e8 26 c5 ff ff       	call   c00069c1 <init_bitmap>
c000a49b:	83 c4 10             	add    $0x10,%esp
c000a49e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4a1:	c9                   	leave  
c000a4a2:	c3                   	ret    

c000a4a3 <user_process>:
c000a4a3:	55                   	push   %ebp
c000a4a4:	89 e5                	mov    %esp,%ebp
c000a4a6:	83 ec 38             	sub    $0x38,%esp
c000a4a9:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000a4b0:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000a4b7:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000a4be:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000a4c2:	75 0e                	jne    c000a4d2 <user_process+0x2f>
c000a4c4:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000a4ca:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000a4d0:	eb 0c                	jmp    c000a4de <user_process+0x3b>
c000a4d2:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000a4d8:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000a4de:	e8 b4 70 ff ff       	call   c0001597 <get_running_thread_pcb>
c000a4e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a4e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a4e9:	05 00 10 00 00       	add    $0x1000,%eax
c000a4ee:	89 c2                	mov    %eax,%edx
c000a4f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a4f3:	89 10                	mov    %edx,(%eax)
c000a4f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a4f8:	8b 00                	mov    (%eax),%eax
c000a4fa:	83 e8 44             	sub    $0x44,%eax
c000a4fd:	89 c2                	mov    %eax,%edx
c000a4ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a502:	89 10                	mov    %edx,(%eax)
c000a504:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a507:	8b 00                	mov    (%eax),%eax
c000a509:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a50c:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a510:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a516:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a51a:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a51e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a522:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a526:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a52a:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a52e:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a534:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000a538:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a53b:	89 50 34             	mov    %edx,0x34(%eax)
c000a53e:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a542:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a545:	89 50 0c             	mov    %edx,0xc(%eax)
c000a548:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a54c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a54f:	89 50 04             	mov    %edx,0x4(%eax)
c000a552:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a556:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a559:	89 50 08             	mov    %edx,0x8(%eax)
c000a55c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a560:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a563:	89 50 40             	mov    %edx,0x40(%eax)
c000a566:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a56a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a56d:	89 10                	mov    %edx,(%eax)
c000a56f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a572:	8b 55 08             	mov    0x8(%ebp),%edx
c000a575:	89 50 30             	mov    %edx,0x30(%eax)
c000a578:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a57c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a57f:	89 50 38             	mov    %edx,0x38(%eax)
c000a582:	83 ec 08             	sub    $0x8,%esp
c000a585:	6a 01                	push   $0x1
c000a587:	68 00 f0 ff bf       	push   $0xbffff000
c000a58c:	e8 72 ca ff ff       	call   c0007003 <alloc_physical_memory>
c000a591:	83 c4 10             	add    $0x10,%esp
c000a594:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000a59a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a59d:	89 50 3c             	mov    %edx,0x3c(%eax)
c000a5a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a5a3:	83 ec 0c             	sub    $0xc,%esp
c000a5a6:	50                   	push   %eax
c000a5a7:	e8 c0 6e ff ff       	call   c000146c <restart>
c000a5ac:	83 c4 10             	add    $0x10,%esp
c000a5af:	90                   	nop
c000a5b0:	c9                   	leave  
c000a5b1:	c3                   	ret    

c000a5b2 <clone_pcb>:
c000a5b2:	55                   	push   %ebp
c000a5b3:	89 e5                	mov    %esp,%ebp
c000a5b5:	83 ec 18             	sub    $0x18,%esp
c000a5b8:	83 ec 08             	sub    $0x8,%esp
c000a5bb:	6a 00                	push   $0x0
c000a5bd:	6a 01                	push   $0x1
c000a5bf:	e8 05 cb ff ff       	call   c00070c9 <alloc_memory>
c000a5c4:	83 c4 10             	add    $0x10,%esp
c000a5c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a5ca:	83 ec 04             	sub    $0x4,%esp
c000a5cd:	68 00 10 00 00       	push   $0x1000
c000a5d2:	6a 00                	push   $0x0
c000a5d4:	ff 75 f4             	pushl  -0xc(%ebp)
c000a5d7:	e8 1b 18 00 00       	call   c000bdf7 <Memset>
c000a5dc:	83 c4 10             	add    $0x10,%esp
c000a5df:	83 ec 04             	sub    $0x4,%esp
c000a5e2:	68 00 10 00 00       	push   $0x1000
c000a5e7:	ff 75 08             	pushl  0x8(%ebp)
c000a5ea:	ff 75 f4             	pushl  -0xc(%ebp)
c000a5ed:	e8 96 d5 ff ff       	call   c0007b88 <Memcpy>
c000a5f2:	83 c4 10             	add    $0x10,%esp
c000a5f5:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000a5fa:	83 c0 01             	add    $0x1,%eax
c000a5fd:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000a602:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000a608:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a60b:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000a611:	8b 45 08             	mov    0x8(%ebp),%eax
c000a614:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000a61a:	89 c2                	mov    %eax,%edx
c000a61c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a61f:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000a625:	83 ec 08             	sub    $0x8,%esp
c000a628:	6a 00                	push   $0x0
c000a62a:	6a 01                	push   $0x1
c000a62c:	e8 98 ca ff ff       	call   c00070c9 <alloc_memory>
c000a631:	83 c4 10             	add    $0x10,%esp
c000a634:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a637:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a63a:	05 00 0c 00 00       	add    $0xc00,%eax
c000a63f:	83 ec 04             	sub    $0x4,%esp
c000a642:	68 00 04 00 00       	push   $0x400
c000a647:	68 00 fc ff ff       	push   $0xfffffc00
c000a64c:	50                   	push   %eax
c000a64d:	e8 36 d5 ff ff       	call   c0007b88 <Memcpy>
c000a652:	83 c4 10             	add    $0x10,%esp
c000a655:	83 ec 0c             	sub    $0xc,%esp
c000a658:	ff 75 f0             	pushl  -0x10(%ebp)
c000a65b:	e8 ba c8 ff ff       	call   c0006f1a <get_physical_address>
c000a660:	83 c4 10             	add    $0x10,%esp
c000a663:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a666:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a669:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a66e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a671:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a674:	83 c8 07             	or     $0x7,%eax
c000a677:	89 c2                	mov    %eax,%edx
c000a679:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a67c:	89 10                	mov    %edx,(%eax)
c000a67e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a681:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a684:	89 50 08             	mov    %edx,0x8(%eax)
c000a687:	e8 87 fd ff ff       	call   c000a413 <create_user_process_address_space>
c000a68c:	89 c2                	mov    %eax,%edx
c000a68e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a691:	89 50 0c             	mov    %edx,0xc(%eax)
c000a694:	8b 45 08             	mov    0x8(%ebp),%eax
c000a697:	8b 40 0c             	mov    0xc(%eax),%eax
c000a69a:	89 c2                	mov    %eax,%edx
c000a69c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a69f:	8b 40 0c             	mov    0xc(%eax),%eax
c000a6a2:	83 ec 04             	sub    $0x4,%esp
c000a6a5:	6a 0c                	push   $0xc
c000a6a7:	52                   	push   %edx
c000a6a8:	50                   	push   %eax
c000a6a9:	e8 da d4 ff ff       	call   c0007b88 <Memcpy>
c000a6ae:	83 c4 10             	add    $0x10,%esp
c000a6b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6b4:	c9                   	leave  
c000a6b5:	c3                   	ret    

c000a6b6 <build_body_stack>:
c000a6b6:	55                   	push   %ebp
c000a6b7:	89 e5                	mov    %esp,%ebp
c000a6b9:	83 ec 48             	sub    $0x48,%esp
c000a6bc:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6bf:	8b 40 0c             	mov    0xc(%eax),%eax
c000a6c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a6c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a6c8:	8b 50 04             	mov    0x4(%eax),%edx
c000a6cb:	8b 00                	mov    (%eax),%eax
c000a6cd:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a6d0:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000a6d3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000a6d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a6d9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a6dc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a6df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a6e2:	8b 40 08             	mov    0x8(%eax),%eax
c000a6e5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a6e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a6ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a6f6:	e8 29 d4 ff ff       	call   c0007b24 <intr_disable>
c000a6fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a6fe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a705:	e9 c2 00 00 00       	jmp    c000a7cc <build_body_stack+0x116>
c000a70a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a70d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a710:	01 d0                	add    %edx,%eax
c000a712:	0f b6 00             	movzbl (%eax),%eax
c000a715:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000a718:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a71f:	e9 9a 00 00 00       	jmp    c000a7be <build_body_stack+0x108>
c000a724:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000a728:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a72b:	89 c1                	mov    %eax,%ecx
c000a72d:	d3 fa                	sar    %cl,%edx
c000a72f:	89 d0                	mov    %edx,%eax
c000a731:	83 e0 01             	and    $0x1,%eax
c000a734:	85 c0                	test   %eax,%eax
c000a736:	75 06                	jne    c000a73e <build_body_stack+0x88>
c000a738:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a73c:	eb 7c                	jmp    c000a7ba <build_body_stack+0x104>
c000a73e:	8b 45 08             	mov    0x8(%ebp),%eax
c000a741:	8b 40 08             	mov    0x8(%eax),%eax
c000a744:	83 ec 0c             	sub    $0xc,%esp
c000a747:	50                   	push   %eax
c000a748:	e8 2e 6e ff ff       	call   c000157b <update_cr3>
c000a74d:	83 c4 10             	add    $0x10,%esp
c000a750:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a753:	c1 e0 0c             	shl    $0xc,%eax
c000a756:	89 c2                	mov    %eax,%edx
c000a758:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a75b:	01 d0                	add    %edx,%eax
c000a75d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a760:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000a763:	8b 45 10             	mov    0x10(%ebp),%eax
c000a766:	83 ec 04             	sub    $0x4,%esp
c000a769:	68 00 10 00 00       	push   $0x1000
c000a76e:	52                   	push   %edx
c000a76f:	50                   	push   %eax
c000a770:	e8 13 d4 ff ff       	call   c0007b88 <Memcpy>
c000a775:	83 c4 10             	add    $0x10,%esp
c000a778:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a77b:	8b 40 08             	mov    0x8(%eax),%eax
c000a77e:	83 ec 0c             	sub    $0xc,%esp
c000a781:	50                   	push   %eax
c000a782:	e8 f4 6d ff ff       	call   c000157b <update_cr3>
c000a787:	83 c4 10             	add    $0x10,%esp
c000a78a:	83 ec 08             	sub    $0x8,%esp
c000a78d:	ff 75 cc             	pushl  -0x34(%ebp)
c000a790:	6a 01                	push   $0x1
c000a792:	e8 94 c9 ff ff       	call   c000712b <get_a_virtual_page>
c000a797:	83 c4 10             	add    $0x10,%esp
c000a79a:	8b 55 10             	mov    0x10(%ebp),%edx
c000a79d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a7a0:	83 ec 04             	sub    $0x4,%esp
c000a7a3:	68 00 10 00 00       	push   $0x1000
c000a7a8:	52                   	push   %edx
c000a7a9:	50                   	push   %eax
c000a7aa:	e8 d9 d3 ff ff       	call   c0007b88 <Memcpy>
c000a7af:	83 c4 10             	add    $0x10,%esp
c000a7b2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a7b6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a7ba:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a7be:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a7c2:	0f 8e 5c ff ff ff    	jle    c000a724 <build_body_stack+0x6e>
c000a7c8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a7cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a7cf:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a7d2:	0f 87 32 ff ff ff    	ja     c000a70a <build_body_stack+0x54>
c000a7d8:	83 ec 0c             	sub    $0xc,%esp
c000a7db:	ff 75 d4             	pushl  -0x2c(%ebp)
c000a7de:	e8 6a d3 ff ff       	call   c0007b4d <intr_set_status>
c000a7e3:	83 c4 10             	add    $0x10,%esp
c000a7e6:	90                   	nop
c000a7e7:	c9                   	leave  
c000a7e8:	c3                   	ret    

c000a7e9 <build_process_kernel_stack>:
c000a7e9:	55                   	push   %ebp
c000a7ea:	89 e5                	mov    %esp,%ebp
c000a7ec:	83 ec 28             	sub    $0x28,%esp
c000a7ef:	e8 30 d3 ff ff       	call   c0007b24 <intr_disable>
c000a7f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a7f7:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7fa:	05 00 10 00 00       	add    $0x1000,%eax
c000a7ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a802:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a805:	8b 00                	mov    (%eax),%eax
c000a807:	83 f8 38             	cmp    $0x38,%eax
c000a80a:	74 06                	je     c000a812 <build_process_kernel_stack+0x29>
c000a80c:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000a810:	eb f0                	jmp    c000a802 <build_process_kernel_stack+0x19>
c000a812:	90                   	nop
c000a813:	8b 45 08             	mov    0x8(%ebp),%eax
c000a816:	05 00 10 00 00       	add    $0x1000,%eax
c000a81b:	89 c2                	mov    %eax,%edx
c000a81d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a820:	89 50 04             	mov    %edx,0x4(%eax)
c000a823:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a826:	83 c0 2c             	add    $0x2c,%eax
c000a829:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a82c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a82f:	83 e8 04             	sub    $0x4,%eax
c000a832:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a835:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a838:	83 e8 08             	sub    $0x8,%eax
c000a83b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a83e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a841:	83 e8 0c             	sub    $0xc,%eax
c000a844:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a847:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a84a:	83 e8 10             	sub    $0x10,%eax
c000a84d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a850:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a853:	83 e8 14             	sub    $0x14,%eax
c000a856:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a859:	ba 63 14 00 c0       	mov    $0xc0001463,%edx
c000a85e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a861:	89 10                	mov    %edx,(%eax)
c000a863:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a866:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a86c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a86f:	8b 10                	mov    (%eax),%edx
c000a871:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a874:	89 10                	mov    %edx,(%eax)
c000a876:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a879:	8b 10                	mov    (%eax),%edx
c000a87b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a87e:	89 10                	mov    %edx,(%eax)
c000a880:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a883:	8b 10                	mov    (%eax),%edx
c000a885:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a888:	89 10                	mov    %edx,(%eax)
c000a88a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a88d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a893:	8b 45 08             	mov    0x8(%ebp),%eax
c000a896:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000a899:	89 10                	mov    %edx,(%eax)
c000a89b:	83 ec 0c             	sub    $0xc,%esp
c000a89e:	ff 75 f0             	pushl  -0x10(%ebp)
c000a8a1:	e8 a7 d2 ff ff       	call   c0007b4d <intr_set_status>
c000a8a6:	83 c4 10             	add    $0x10,%esp
c000a8a9:	90                   	nop
c000a8aa:	c9                   	leave  
c000a8ab:	c3                   	ret    

c000a8ac <fork_process>:
c000a8ac:	55                   	push   %ebp
c000a8ad:	89 e5                	mov    %esp,%ebp
c000a8af:	83 ec 18             	sub    $0x18,%esp
c000a8b2:	8b 45 08             	mov    0x8(%ebp),%eax
c000a8b5:	83 ec 0c             	sub    $0xc,%esp
c000a8b8:	50                   	push   %eax
c000a8b9:	e8 fe 9f ff ff       	call   c00048bc <pid2proc>
c000a8be:	83 c4 10             	add    $0x10,%esp
c000a8c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a8c4:	83 ec 0c             	sub    $0xc,%esp
c000a8c7:	ff 75 f4             	pushl  -0xc(%ebp)
c000a8ca:	e8 e3 fc ff ff       	call   c000a5b2 <clone_pcb>
c000a8cf:	83 c4 10             	add    $0x10,%esp
c000a8d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a8d5:	83 ec 08             	sub    $0x8,%esp
c000a8d8:	6a 00                	push   $0x0
c000a8da:	6a 01                	push   $0x1
c000a8dc:	e8 e8 c7 ff ff       	call   c00070c9 <alloc_memory>
c000a8e1:	83 c4 10             	add    $0x10,%esp
c000a8e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a8e7:	83 ec 04             	sub    $0x4,%esp
c000a8ea:	ff 75 ec             	pushl  -0x14(%ebp)
c000a8ed:	ff 75 f0             	pushl  -0x10(%ebp)
c000a8f0:	ff 75 f4             	pushl  -0xc(%ebp)
c000a8f3:	e8 be fd ff ff       	call   c000a6b6 <build_body_stack>
c000a8f8:	83 c4 10             	add    $0x10,%esp
c000a8fb:	83 ec 0c             	sub    $0xc,%esp
c000a8fe:	ff 75 f0             	pushl  -0x10(%ebp)
c000a901:	e8 e3 fe ff ff       	call   c000a7e9 <build_process_kernel_stack>
c000a906:	83 c4 10             	add    $0x10,%esp
c000a909:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a90c:	05 00 01 00 00       	add    $0x100,%eax
c000a911:	83 ec 04             	sub    $0x4,%esp
c000a914:	6a 08                	push   $0x8
c000a916:	6a 00                	push   $0x0
c000a918:	50                   	push   %eax
c000a919:	e8 d9 14 00 00       	call   c000bdf7 <Memset>
c000a91e:	83 c4 10             	add    $0x10,%esp
c000a921:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a924:	05 08 01 00 00       	add    $0x108,%eax
c000a929:	83 ec 04             	sub    $0x4,%esp
c000a92c:	6a 08                	push   $0x8
c000a92e:	6a 00                	push   $0x0
c000a930:	50                   	push   %eax
c000a931:	e8 c1 14 00 00       	call   c000bdf7 <Memset>
c000a936:	83 c4 10             	add    $0x10,%esp
c000a939:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a93c:	05 08 01 00 00       	add    $0x108,%eax
c000a941:	83 ec 08             	sub    $0x8,%esp
c000a944:	50                   	push   %eax
c000a945:	68 04 1f 01 c0       	push   $0xc0011f04
c000a94a:	e8 c1 02 00 00       	call   c000ac10 <appendToDoubleLinkList>
c000a94f:	83 c4 10             	add    $0x10,%esp
c000a952:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a955:	c9                   	leave  
c000a956:	c3                   	ret    

c000a957 <process_execute>:
c000a957:	55                   	push   %ebp
c000a958:	89 e5                	mov    %esp,%ebp
c000a95a:	83 ec 28             	sub    $0x28,%esp
c000a95d:	e8 c4 04 00 00       	call   c000ae26 <thread_init>
c000a962:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a965:	83 ec 0c             	sub    $0xc,%esp
c000a968:	ff 75 f4             	pushl  -0xc(%ebp)
c000a96b:	e8 63 05 00 00       	call   c000aed3 <thread_create>
c000a970:	83 c4 10             	add    $0x10,%esp
c000a973:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a976:	05 34 01 00 00       	add    $0x134,%eax
c000a97b:	83 ec 08             	sub    $0x8,%esp
c000a97e:	ff 75 10             	pushl  0x10(%ebp)
c000a981:	50                   	push   %eax
c000a982:	e8 8f 14 00 00       	call   c000be16 <Strcpy>
c000a987:	83 c4 10             	add    $0x10,%esp
c000a98a:	83 ec 08             	sub    $0x8,%esp
c000a98d:	6a 00                	push   $0x0
c000a98f:	6a 01                	push   $0x1
c000a991:	e8 33 c7 ff ff       	call   c00070c9 <alloc_memory>
c000a996:	83 c4 10             	add    $0x10,%esp
c000a999:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a99c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a99f:	05 00 0c 00 00       	add    $0xc00,%eax
c000a9a4:	83 ec 04             	sub    $0x4,%esp
c000a9a7:	68 00 04 00 00       	push   $0x400
c000a9ac:	68 00 fc ff ff       	push   $0xfffffc00
c000a9b1:	50                   	push   %eax
c000a9b2:	e8 d1 d1 ff ff       	call   c0007b88 <Memcpy>
c000a9b7:	83 c4 10             	add    $0x10,%esp
c000a9ba:	83 ec 0c             	sub    $0xc,%esp
c000a9bd:	ff 75 f0             	pushl  -0x10(%ebp)
c000a9c0:	e8 55 c5 ff ff       	call   c0006f1a <get_physical_address>
c000a9c5:	83 c4 10             	add    $0x10,%esp
c000a9c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a9cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a9ce:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a9d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a9d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a9d9:	83 c8 07             	or     $0x7,%eax
c000a9dc:	89 c2                	mov    %eax,%edx
c000a9de:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a9e1:	89 10                	mov    %edx,(%eax)
c000a9e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a9e6:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a9e9:	89 50 08             	mov    %edx,0x8(%eax)
c000a9ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a9ef:	83 c0 10             	add    $0x10,%eax
c000a9f2:	83 ec 0c             	sub    $0xc,%esp
c000a9f5:	50                   	push   %eax
c000a9f6:	e8 6f cc ff ff       	call   c000766a <init_memory_block_desc>
c000a9fb:	83 c4 10             	add    $0x10,%esp
c000a9fe:	e8 10 fa ff ff       	call   c000a413 <create_user_process_address_space>
c000aa03:	89 c2                	mov    %eax,%edx
c000aa05:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa08:	89 50 0c             	mov    %edx,0xc(%eax)
c000aa0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa0e:	8b 00                	mov    (%eax),%eax
c000aa10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aa13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa16:	c7 40 10 a3 a4 00 c0 	movl   $0xc000a4a3,0x10(%eax)
c000aa1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa20:	8b 55 08             	mov    0x8(%ebp),%edx
c000aa23:	89 50 18             	mov    %edx,0x18(%eax)
c000aa26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa29:	8b 55 0c             	mov    0xc(%ebp),%edx
c000aa2c:	89 50 1c             	mov    %edx,0x1c(%eax)
c000aa2f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa32:	8b 55 14             	mov    0x14(%ebp),%edx
c000aa35:	89 50 20             	mov    %edx,0x20(%eax)
c000aa38:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000aa3b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa3e:	89 50 24             	mov    %edx,0x24(%eax)
c000aa41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa44:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000aa4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa4d:	8b 10                	mov    (%eax),%edx
c000aa4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa52:	89 50 04             	mov    %edx,0x4(%eax)
c000aa55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa58:	8b 50 04             	mov    0x4(%eax),%edx
c000aa5b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa5e:	89 50 08             	mov    %edx,0x8(%eax)
c000aa61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa64:	8b 50 08             	mov    0x8(%eax),%edx
c000aa67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa6a:	89 50 0c             	mov    %edx,0xc(%eax)
c000aa6d:	83 ec 0c             	sub    $0xc,%esp
c000aa70:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aa75:	e8 99 00 00 00       	call   c000ab13 <isListEmpty>
c000aa7a:	83 c4 10             	add    $0x10,%esp
c000aa7d:	e8 a2 d0 ff ff       	call   c0007b24 <intr_disable>
c000aa82:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aa85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa88:	05 00 01 00 00       	add    $0x100,%eax
c000aa8d:	83 ec 08             	sub    $0x8,%esp
c000aa90:	50                   	push   %eax
c000aa91:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aa96:	e8 75 01 00 00       	call   c000ac10 <appendToDoubleLinkList>
c000aa9b:	83 c4 10             	add    $0x10,%esp
c000aa9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aaa1:	05 08 01 00 00       	add    $0x108,%eax
c000aaa6:	83 ec 08             	sub    $0x8,%esp
c000aaa9:	50                   	push   %eax
c000aaaa:	68 04 1f 01 c0       	push   $0xc0011f04
c000aaaf:	e8 5c 01 00 00       	call   c000ac10 <appendToDoubleLinkList>
c000aab4:	83 c4 10             	add    $0x10,%esp
c000aab7:	83 ec 0c             	sub    $0xc,%esp
c000aaba:	ff 75 e0             	pushl  -0x20(%ebp)
c000aabd:	e8 8b d0 ff ff       	call   c0007b4d <intr_set_status>
c000aac2:	83 c4 10             	add    $0x10,%esp
c000aac5:	90                   	nop
c000aac6:	c9                   	leave  
c000aac7:	c3                   	ret    
c000aac8:	66 90                	xchg   %ax,%ax
c000aaca:	66 90                	xchg   %ax,%ax
c000aacc:	66 90                	xchg   %ax,%ax
c000aace:	66 90                	xchg   %ax,%ax

c000aad0 <switch_to>:
c000aad0:	56                   	push   %esi
c000aad1:	57                   	push   %edi
c000aad2:	53                   	push   %ebx
c000aad3:	55                   	push   %ebp
c000aad4:	89 e5                	mov    %esp,%ebp
c000aad6:	8b 45 14             	mov    0x14(%ebp),%eax
c000aad9:	89 20                	mov    %esp,(%eax)
c000aadb:	8b 45 18             	mov    0x18(%ebp),%eax
c000aade:	8b 20                	mov    (%eax),%esp
c000aae0:	5d                   	pop    %ebp
c000aae1:	5b                   	pop    %ebx
c000aae2:	5f                   	pop    %edi
c000aae3:	5e                   	pop    %esi
c000aae4:	c3                   	ret    

c000aae5 <initDoubleLinkList>:
c000aae5:	55                   	push   %ebp
c000aae6:	89 e5                	mov    %esp,%ebp
c000aae8:	8b 45 08             	mov    0x8(%ebp),%eax
c000aaeb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000aaf1:	8b 45 08             	mov    0x8(%ebp),%eax
c000aaf4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000aafb:	8b 45 08             	mov    0x8(%ebp),%eax
c000aafe:	8d 50 08             	lea    0x8(%eax),%edx
c000ab01:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab04:	89 50 04             	mov    %edx,0x4(%eax)
c000ab07:	8b 55 08             	mov    0x8(%ebp),%edx
c000ab0a:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab0d:	89 50 08             	mov    %edx,0x8(%eax)
c000ab10:	90                   	nop
c000ab11:	5d                   	pop    %ebp
c000ab12:	c3                   	ret    

c000ab13 <isListEmpty>:
c000ab13:	55                   	push   %ebp
c000ab14:	89 e5                	mov    %esp,%ebp
c000ab16:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab19:	8b 40 04             	mov    0x4(%eax),%eax
c000ab1c:	8b 55 08             	mov    0x8(%ebp),%edx
c000ab1f:	83 c2 08             	add    $0x8,%edx
c000ab22:	39 d0                	cmp    %edx,%eax
c000ab24:	75 07                	jne    c000ab2d <isListEmpty+0x1a>
c000ab26:	b8 01 00 00 00       	mov    $0x1,%eax
c000ab2b:	eb 05                	jmp    c000ab32 <isListEmpty+0x1f>
c000ab2d:	b8 00 00 00 00       	mov    $0x0,%eax
c000ab32:	5d                   	pop    %ebp
c000ab33:	c3                   	ret    

c000ab34 <findElementInList>:
c000ab34:	55                   	push   %ebp
c000ab35:	89 e5                	mov    %esp,%ebp
c000ab37:	83 ec 28             	sub    $0x28,%esp
c000ab3a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000ab3e:	75 19                	jne    c000ab59 <findElementInList+0x25>
c000ab40:	6a 60                	push   $0x60
c000ab42:	68 9d bd 00 c0       	push   $0xc000bd9d
c000ab47:	68 9d bd 00 c0       	push   $0xc000bd9d
c000ab4c:	68 b0 bd 00 c0       	push   $0xc000bdb0
c000ab51:	e8 a9 eb ff ff       	call   c00096ff <assertion_failure>
c000ab56:	83 c4 10             	add    $0x10,%esp
c000ab59:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000ab5d:	75 19                	jne    c000ab78 <findElementInList+0x44>
c000ab5f:	6a 61                	push   $0x61
c000ab61:	68 9d bd 00 c0       	push   $0xc000bd9d
c000ab66:	68 9d bd 00 c0       	push   $0xc000bd9d
c000ab6b:	68 bc bd 00 c0       	push   $0xc000bdbc
c000ab70:	e8 8a eb ff ff       	call   c00096ff <assertion_failure>
c000ab75:	83 c4 10             	add    $0x10,%esp
c000ab78:	e8 a7 cf ff ff       	call   c0007b24 <intr_disable>
c000ab7d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ab80:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000ab87:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab8a:	8b 40 08             	mov    0x8(%eax),%eax
c000ab8d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000ab90:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab93:	8b 40 04             	mov    0x4(%eax),%eax
c000ab96:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ab99:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000ab9d:	75 07                	jne    c000aba6 <findElementInList+0x72>
c000ab9f:	b8 00 00 00 00       	mov    $0x0,%eax
c000aba4:	eb 68                	jmp    c000ac0e <findElementInList+0xda>
c000aba6:	8b 45 0c             	mov    0xc(%ebp),%eax
c000aba9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000abac:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000abaf:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000abb2:	c1 f8 03             	sar    $0x3,%eax
c000abb5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000abb8:	eb 36                	jmp    c000abf0 <findElementInList+0xbc>
c000abba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000abbd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000abc0:	75 07                	jne    c000abc9 <findElementInList+0x95>
c000abc2:	b8 01 00 00 00       	mov    $0x1,%eax
c000abc7:	eb 45                	jmp    c000ac0e <findElementInList+0xda>
c000abc9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000abcd:	75 07                	jne    c000abd6 <findElementInList+0xa2>
c000abcf:	b8 00 00 00 00       	mov    $0x0,%eax
c000abd4:	eb 38                	jmp    c000ac0e <findElementInList+0xda>
c000abd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abd9:	8b 40 04             	mov    0x4(%eax),%eax
c000abdc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000abdf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000abe3:	75 07                	jne    c000abec <findElementInList+0xb8>
c000abe5:	b8 00 00 00 00       	mov    $0x0,%eax
c000abea:	eb 22                	jmp    c000ac0e <findElementInList+0xda>
c000abec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000abf0:	8b 45 08             	mov    0x8(%ebp),%eax
c000abf3:	83 c0 08             	add    $0x8,%eax
c000abf6:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000abf9:	75 bf                	jne    c000abba <findElementInList+0x86>
c000abfb:	83 ec 0c             	sub    $0xc,%esp
c000abfe:	ff 75 ec             	pushl  -0x14(%ebp)
c000ac01:	e8 47 cf ff ff       	call   c0007b4d <intr_set_status>
c000ac06:	83 c4 10             	add    $0x10,%esp
c000ac09:	b8 00 00 00 00       	mov    $0x0,%eax
c000ac0e:	c9                   	leave  
c000ac0f:	c3                   	ret    

c000ac10 <appendToDoubleLinkList>:
c000ac10:	55                   	push   %ebp
c000ac11:	89 e5                	mov    %esp,%ebp
c000ac13:	83 ec 18             	sub    $0x18,%esp
c000ac16:	83 ec 08             	sub    $0x8,%esp
c000ac19:	ff 75 0c             	pushl  0xc(%ebp)
c000ac1c:	ff 75 08             	pushl  0x8(%ebp)
c000ac1f:	e8 10 ff ff ff       	call   c000ab34 <findElementInList>
c000ac24:	83 c4 10             	add    $0x10,%esp
c000ac27:	3c 01                	cmp    $0x1,%al
c000ac29:	0f 84 c2 00 00 00    	je     c000acf1 <appendToDoubleLinkList+0xe1>
c000ac2f:	e8 f0 ce ff ff       	call   c0007b24 <intr_disable>
c000ac34:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac37:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000ac3b:	75 1c                	jne    c000ac59 <appendToDoubleLinkList+0x49>
c000ac3d:	68 9e 00 00 00       	push   $0x9e
c000ac42:	68 9d bd 00 c0       	push   $0xc000bd9d
c000ac47:	68 9d bd 00 c0       	push   $0xc000bd9d
c000ac4c:	68 b0 bd 00 c0       	push   $0xc000bdb0
c000ac51:	e8 a9 ea ff ff       	call   c00096ff <assertion_failure>
c000ac56:	83 c4 10             	add    $0x10,%esp
c000ac59:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000ac5d:	75 1c                	jne    c000ac7b <appendToDoubleLinkList+0x6b>
c000ac5f:	68 9f 00 00 00       	push   $0x9f
c000ac64:	68 9d bd 00 c0       	push   $0xc000bd9d
c000ac69:	68 9d bd 00 c0       	push   $0xc000bd9d
c000ac6e:	68 bc bd 00 c0       	push   $0xc000bdbc
c000ac73:	e8 87 ea ff ff       	call   c00096ff <assertion_failure>
c000ac78:	83 c4 10             	add    $0x10,%esp
c000ac7b:	83 ec 08             	sub    $0x8,%esp
c000ac7e:	ff 75 0c             	pushl  0xc(%ebp)
c000ac81:	ff 75 08             	pushl  0x8(%ebp)
c000ac84:	e8 ab fe ff ff       	call   c000ab34 <findElementInList>
c000ac89:	83 c4 10             	add    $0x10,%esp
c000ac8c:	3c 01                	cmp    $0x1,%al
c000ac8e:	74 64                	je     c000acf4 <appendToDoubleLinkList+0xe4>
c000ac90:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ac93:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac99:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000aca0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aca3:	8b 50 04             	mov    0x4(%eax),%edx
c000aca6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aca9:	89 10                	mov    %edx,(%eax)
c000acab:	8b 45 08             	mov    0x8(%ebp),%eax
c000acae:	8b 50 08             	mov    0x8(%eax),%edx
c000acb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acb4:	89 10                	mov    %edx,(%eax)
c000acb6:	8b 45 08             	mov    0x8(%ebp),%eax
c000acb9:	8b 40 08             	mov    0x8(%eax),%eax
c000acbc:	85 c0                	test   %eax,%eax
c000acbe:	74 0c                	je     c000accc <appendToDoubleLinkList+0xbc>
c000acc0:	8b 45 08             	mov    0x8(%ebp),%eax
c000acc3:	8b 40 08             	mov    0x8(%eax),%eax
c000acc6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000acc9:	89 50 04             	mov    %edx,0x4(%eax)
c000accc:	8b 45 08             	mov    0x8(%ebp),%eax
c000accf:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000acd2:	89 50 08             	mov    %edx,0x8(%eax)
c000acd5:	8b 45 08             	mov    0x8(%ebp),%eax
c000acd8:	8d 50 08             	lea    0x8(%eax),%edx
c000acdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acde:	89 50 04             	mov    %edx,0x4(%eax)
c000ace1:	83 ec 0c             	sub    $0xc,%esp
c000ace4:	ff 75 f4             	pushl  -0xc(%ebp)
c000ace7:	e8 61 ce ff ff       	call   c0007b4d <intr_set_status>
c000acec:	83 c4 10             	add    $0x10,%esp
c000acef:	eb 04                	jmp    c000acf5 <appendToDoubleLinkList+0xe5>
c000acf1:	90                   	nop
c000acf2:	eb 01                	jmp    c000acf5 <appendToDoubleLinkList+0xe5>
c000acf4:	90                   	nop
c000acf5:	c9                   	leave  
c000acf6:	c3                   	ret    

c000acf7 <insertToDoubleLinkList>:
c000acf7:	55                   	push   %ebp
c000acf8:	89 e5                	mov    %esp,%ebp
c000acfa:	83 ec 18             	sub    $0x18,%esp
c000acfd:	83 ec 08             	sub    $0x8,%esp
c000ad00:	ff 75 0c             	pushl  0xc(%ebp)
c000ad03:	ff 75 08             	pushl  0x8(%ebp)
c000ad06:	e8 29 fe ff ff       	call   c000ab34 <findElementInList>
c000ad0b:	83 c4 10             	add    $0x10,%esp
c000ad0e:	3c 01                	cmp    $0x1,%al
c000ad10:	74 65                	je     c000ad77 <insertToDoubleLinkList+0x80>
c000ad12:	e8 0d ce ff ff       	call   c0007b24 <intr_disable>
c000ad17:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad1a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ad1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ad20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad23:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000ad2a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad2d:	8b 50 04             	mov    0x4(%eax),%edx
c000ad30:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad33:	89 10                	mov    %edx,(%eax)
c000ad35:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad38:	8b 50 04             	mov    0x4(%eax),%edx
c000ad3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad3e:	89 50 04             	mov    %edx,0x4(%eax)
c000ad41:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad44:	8b 40 04             	mov    0x4(%eax),%eax
c000ad47:	85 c0                	test   %eax,%eax
c000ad49:	74 0b                	je     c000ad56 <insertToDoubleLinkList+0x5f>
c000ad4b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad4e:	8b 40 04             	mov    0x4(%eax),%eax
c000ad51:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ad54:	89 10                	mov    %edx,(%eax)
c000ad56:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad59:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000ad5c:	89 50 04             	mov    %edx,0x4(%eax)
c000ad5f:	8b 55 08             	mov    0x8(%ebp),%edx
c000ad62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad65:	89 10                	mov    %edx,(%eax)
c000ad67:	83 ec 0c             	sub    $0xc,%esp
c000ad6a:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad6d:	e8 db cd ff ff       	call   c0007b4d <intr_set_status>
c000ad72:	83 c4 10             	add    $0x10,%esp
c000ad75:	eb 01                	jmp    c000ad78 <insertToDoubleLinkList+0x81>
c000ad77:	90                   	nop
c000ad78:	c9                   	leave  
c000ad79:	c3                   	ret    

c000ad7a <popFromDoubleLinkList>:
c000ad7a:	55                   	push   %ebp
c000ad7b:	89 e5                	mov    %esp,%ebp
c000ad7d:	83 ec 18             	sub    $0x18,%esp
c000ad80:	e8 9f cd ff ff       	call   c0007b24 <intr_disable>
c000ad85:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad88:	83 ec 0c             	sub    $0xc,%esp
c000ad8b:	ff 75 08             	pushl  0x8(%ebp)
c000ad8e:	e8 80 fd ff ff       	call   c000ab13 <isListEmpty>
c000ad93:	83 c4 10             	add    $0x10,%esp
c000ad96:	3c 01                	cmp    $0x1,%al
c000ad98:	75 07                	jne    c000ada1 <popFromDoubleLinkList+0x27>
c000ad9a:	b8 00 00 00 00       	mov    $0x0,%eax
c000ad9f:	eb 6b                	jmp    c000ae0c <popFromDoubleLinkList+0x92>
c000ada1:	8b 45 08             	mov    0x8(%ebp),%eax
c000ada4:	8b 40 08             	mov    0x8(%eax),%eax
c000ada7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000adaa:	8b 45 08             	mov    0x8(%ebp),%eax
c000adad:	8b 40 08             	mov    0x8(%eax),%eax
c000adb0:	85 c0                	test   %eax,%eax
c000adb2:	75 07                	jne    c000adbb <popFromDoubleLinkList+0x41>
c000adb4:	b8 00 00 00 00       	mov    $0x0,%eax
c000adb9:	eb 51                	jmp    c000ae0c <popFromDoubleLinkList+0x92>
c000adbb:	8b 45 08             	mov    0x8(%ebp),%eax
c000adbe:	8b 40 08             	mov    0x8(%eax),%eax
c000adc1:	8b 00                	mov    (%eax),%eax
c000adc3:	85 c0                	test   %eax,%eax
c000adc5:	74 11                	je     c000add8 <popFromDoubleLinkList+0x5e>
c000adc7:	8b 45 08             	mov    0x8(%ebp),%eax
c000adca:	8b 40 08             	mov    0x8(%eax),%eax
c000adcd:	8b 00                	mov    (%eax),%eax
c000adcf:	8b 55 08             	mov    0x8(%ebp),%edx
c000add2:	83 c2 08             	add    $0x8,%edx
c000add5:	89 50 04             	mov    %edx,0x4(%eax)
c000add8:	8b 45 08             	mov    0x8(%ebp),%eax
c000addb:	8b 40 08             	mov    0x8(%eax),%eax
c000adde:	8b 10                	mov    (%eax),%edx
c000ade0:	8b 45 08             	mov    0x8(%ebp),%eax
c000ade3:	89 50 08             	mov    %edx,0x8(%eax)
c000ade6:	83 ec 0c             	sub    $0xc,%esp
c000ade9:	ff 75 f4             	pushl  -0xc(%ebp)
c000adec:	e8 5c cd ff ff       	call   c0007b4d <intr_set_status>
c000adf1:	83 c4 10             	add    $0x10,%esp
c000adf4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adf7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000adfe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae01:	8b 50 04             	mov    0x4(%eax),%edx
c000ae04:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae07:	89 10                	mov    %edx,(%eax)
c000ae09:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ae0c:	c9                   	leave  
c000ae0d:	c3                   	ret    

c000ae0e <kernel_thread>:
c000ae0e:	55                   	push   %ebp
c000ae0f:	89 e5                	mov    %esp,%ebp
c000ae11:	83 ec 08             	sub    $0x8,%esp
c000ae14:	fb                   	sti    
c000ae15:	83 ec 0c             	sub    $0xc,%esp
c000ae18:	ff 75 0c             	pushl  0xc(%ebp)
c000ae1b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ae1e:	ff d0                	call   *%eax
c000ae20:	83 c4 10             	add    $0x10,%esp
c000ae23:	90                   	nop
c000ae24:	c9                   	leave  
c000ae25:	c3                   	ret    

c000ae26 <thread_init>:
c000ae26:	55                   	push   %ebp
c000ae27:	89 e5                	mov    %esp,%ebp
c000ae29:	83 ec 18             	sub    $0x18,%esp
c000ae2c:	83 ec 08             	sub    $0x8,%esp
c000ae2f:	6a 00                	push   $0x0
c000ae31:	6a 01                	push   $0x1
c000ae33:	e8 91 c2 ff ff       	call   c00070c9 <alloc_memory>
c000ae38:	83 c4 10             	add    $0x10,%esp
c000ae3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ae3e:	83 ec 04             	sub    $0x4,%esp
c000ae41:	68 00 10 00 00       	push   $0x1000
c000ae46:	6a 00                	push   $0x0
c000ae48:	ff 75 f4             	pushl  -0xc(%ebp)
c000ae4b:	e8 a7 0f 00 00       	call   c000bdf7 <Memset>
c000ae50:	83 c4 10             	add    $0x10,%esp
c000ae53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae56:	05 00 10 00 00       	add    $0x1000,%eax
c000ae5b:	89 c2                	mov    %eax,%edx
c000ae5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae60:	89 10                	mov    %edx,(%eax)
c000ae62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae65:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000ae6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae6f:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000ae76:	ff ff ff 
c000ae79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae7c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000ae83:	00 00 00 
c000ae86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae89:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000ae8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae92:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000ae98:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000ae9d:	83 c0 01             	add    $0x1,%eax
c000aea0:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000aea5:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000aeab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aeae:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000aeb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aeb7:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c000aebe:	00 00 00 
c000aec1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aec4:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000aecb:	cd ab 99 
c000aece:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aed1:	c9                   	leave  
c000aed2:	c3                   	ret    

c000aed3 <thread_create>:
c000aed3:	55                   	push   %ebp
c000aed4:	89 e5                	mov    %esp,%ebp
c000aed6:	83 ec 10             	sub    $0x10,%esp
c000aed9:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000aee0:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000aee7:	8b 45 08             	mov    0x8(%ebp),%eax
c000aeea:	8b 00                	mov    (%eax),%eax
c000aeec:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000aeef:	89 c2                	mov    %eax,%edx
c000aef1:	8b 45 08             	mov    0x8(%ebp),%eax
c000aef4:	89 10                	mov    %edx,(%eax)
c000aef6:	8b 45 08             	mov    0x8(%ebp),%eax
c000aef9:	8b 00                	mov    (%eax),%eax
c000aefb:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000aefe:	89 c2                	mov    %eax,%edx
c000af00:	8b 45 08             	mov    0x8(%ebp),%eax
c000af03:	89 10                	mov    %edx,(%eax)
c000af05:	90                   	nop
c000af06:	c9                   	leave  
c000af07:	c3                   	ret    

c000af08 <thread_start>:
c000af08:	55                   	push   %ebp
c000af09:	89 e5                	mov    %esp,%ebp
c000af0b:	83 ec 18             	sub    $0x18,%esp
c000af0e:	e8 13 ff ff ff       	call   c000ae26 <thread_init>
c000af13:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000af16:	83 ec 0c             	sub    $0xc,%esp
c000af19:	ff 75 f4             	pushl  -0xc(%ebp)
c000af1c:	e8 b2 ff ff ff       	call   c000aed3 <thread_create>
c000af21:	83 c4 10             	add    $0x10,%esp
c000af24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af27:	05 34 01 00 00       	add    $0x134,%eax
c000af2c:	83 ec 08             	sub    $0x8,%esp
c000af2f:	ff 75 10             	pushl  0x10(%ebp)
c000af32:	50                   	push   %eax
c000af33:	e8 de 0e 00 00       	call   c000be16 <Strcpy>
c000af38:	83 c4 10             	add    $0x10,%esp
c000af3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af3e:	8b 00                	mov    (%eax),%eax
c000af40:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000af43:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af46:	c7 40 10 0e ae 00 c0 	movl   $0xc000ae0e,0x10(%eax)
c000af4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af50:	8b 55 08             	mov    0x8(%ebp),%edx
c000af53:	89 50 18             	mov    %edx,0x18(%eax)
c000af56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af59:	8b 55 0c             	mov    0xc(%ebp),%edx
c000af5c:	89 50 1c             	mov    %edx,0x1c(%eax)
c000af5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af62:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000af68:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af6b:	8b 10                	mov    (%eax),%edx
c000af6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af70:	89 50 04             	mov    %edx,0x4(%eax)
c000af73:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af76:	8b 50 04             	mov    0x4(%eax),%edx
c000af79:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af7c:	89 50 08             	mov    %edx,0x8(%eax)
c000af7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af82:	8b 50 08             	mov    0x8(%eax),%edx
c000af85:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af88:	89 50 0c             	mov    %edx,0xc(%eax)
c000af8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af8e:	05 00 01 00 00       	add    $0x100,%eax
c000af93:	83 ec 08             	sub    $0x8,%esp
c000af96:	50                   	push   %eax
c000af97:	68 ec 0d 01 c0       	push   $0xc0010dec
c000af9c:	e8 6f fc ff ff       	call   c000ac10 <appendToDoubleLinkList>
c000afa1:	83 c4 10             	add    $0x10,%esp
c000afa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000afa7:	05 08 01 00 00       	add    $0x108,%eax
c000afac:	83 ec 08             	sub    $0x8,%esp
c000afaf:	50                   	push   %eax
c000afb0:	68 04 1f 01 c0       	push   $0xc0011f04
c000afb5:	e8 56 fc ff ff       	call   c000ac10 <appendToDoubleLinkList>
c000afba:	83 c4 10             	add    $0x10,%esp
c000afbd:	90                   	nop
c000afbe:	c9                   	leave  
c000afbf:	c3                   	ret    
