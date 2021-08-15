
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	66 87 db             	;xchg   %bx,%bx
   30403:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   3040a:	00 00 00 
   3040d:	b4 0b                	mov    $0xb,%ah
   3040f:	b0 4c                	mov    $0x4c,%al
   30411:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
   30418:	bc 80 6e 03 00       	mov    $0x36e80,%esp
   3041d:	66 c7 05 90 6e 03 00 	movw   $0x0,0x36e90
   30424:	00 00 
   30426:	0f 01 05 34 9c 03 00 	sgdtl  0x39c34
   3042d:	e8 56 27 00 00       	call   32b88 <ReloadGDT>
   30432:	0f 01 15 34 9c 03 00 	lgdtl  0x39c34
   30439:	0f 01 1d 88 6e 03 00 	lidtl  0x36e88
   30440:	ea 47 04 03 00 08 00 	ljmp   $0x8,$0x30447

00030447 <csinit>:
   30447:	31 c0                	xor    %eax,%eax
   30449:	66 b8 40 00          	mov    $0x40,%ax
   3044d:	0f 00 d8             	ltr    %ax
   30450:	e9 11 09 00 00       	jmp    30d66 <kernel_main>
   30455:	eb fe                	jmp    30455 <csinit+0xe>
   30457:	fb                   	sti    
   30458:	b4 0b                	mov    $0xb,%ah
   3045a:	b0 4d                	mov    $0x4d,%al
   3045c:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
   30463:	eb fe                	jmp    30463 <csinit+0x1c>
   30465:	f4                   	hlt    
   30466:	6a 00                	push   $0x0
   30468:	9d                   	popf   
   30469:	eb fe                	jmp    30469 <csinit+0x22>
   3046b:	e8 22 07 00 00       	call   30b92 <test>
   30470:	6a 01                	push   $0x1
   30472:	6a 02                	push   $0x2
   30474:	6a 03                	push   $0x3
   30476:	f4                   	hlt    

00030477 <InterruptTest>:
   30477:	b4 0d                	mov    $0xd,%ah
   30479:	b0 54                	mov    $0x54,%al
   3047b:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
   30482:	c3                   	ret    

00030483 <disp_str>:
   30483:	55                   	push   %ebp
   30484:	89 e5                	mov    %esp,%ebp
   30486:	b4 0d                	mov    $0xd,%ah
   30488:	8b 75 08             	mov    0x8(%ebp),%esi
   3048b:	8b 3d 90 6e 03 00    	mov    0x36e90,%edi

00030491 <disp_str.1>:
   30491:	ac                   	lods   %ds:(%esi),%al
   30492:	84 c0                	test   %al,%al
   30494:	74 1e                	je     304b4 <disp_str.4>
   30496:	3c 0a                	cmp    $0xa,%al
   30498:	75 11                	jne    304ab <disp_str.3>
   3049a:	50                   	push   %eax
   3049b:	89 f8                	mov    %edi,%eax
   3049d:	b3 a0                	mov    $0xa0,%bl
   3049f:	f6 f3                	div    %bl
   304a1:	40                   	inc    %eax
   304a2:	b3 a0                	mov    $0xa0,%bl
   304a4:	f6 e3                	mul    %bl
   304a6:	89 c7                	mov    %eax,%edi
   304a8:	58                   	pop    %eax
   304a9:	eb e6                	jmp    30491 <disp_str.1>

000304ab <disp_str.3>:
   304ab:	65 66 89 07          	mov    %ax,%gs:(%edi)
   304af:	83 c7 02             	add    $0x2,%edi
   304b2:	eb dd                	jmp    30491 <disp_str.1>

000304b4 <disp_str.4>:
   304b4:	89 3d 90 6e 03 00    	mov    %edi,0x36e90
   304ba:	89 ec                	mov    %ebp,%esp
   304bc:	5d                   	pop    %ebp
   304bd:	c3                   	ret    

000304be <disp_str_colour>:
   304be:	55                   	push   %ebp
   304bf:	89 e5                	mov    %esp,%ebp
   304c1:	8b 75 08             	mov    0x8(%ebp),%esi
   304c4:	8a 65 0c             	mov    0xc(%ebp),%ah
   304c7:	8b 3d 90 6e 03 00    	mov    0x36e90,%edi

000304cd <disp_str_colour.1>:
   304cd:	ac                   	lods   %ds:(%esi),%al
   304ce:	84 c0                	test   %al,%al
   304d0:	74 1e                	je     304f0 <disp_str_colour.4>
   304d2:	3c 0a                	cmp    $0xa,%al
   304d4:	75 11                	jne    304e7 <disp_str_colour.3>
   304d6:	50                   	push   %eax
   304d7:	89 f8                	mov    %edi,%eax
   304d9:	b3 a0                	mov    $0xa0,%bl
   304db:	f6 f3                	div    %bl
   304dd:	40                   	inc    %eax
   304de:	b3 a0                	mov    $0xa0,%bl
   304e0:	f6 e3                	mul    %bl
   304e2:	89 c7                	mov    %eax,%edi
   304e4:	58                   	pop    %eax
   304e5:	eb e6                	jmp    304cd <disp_str_colour.1>

000304e7 <disp_str_colour.3>:
   304e7:	65 66 89 07          	mov    %ax,%gs:(%edi)
   304eb:	83 c7 02             	add    $0x2,%edi
   304ee:	eb dd                	jmp    304cd <disp_str_colour.1>

000304f0 <disp_str_colour.4>:
   304f0:	89 3d 90 6e 03 00    	mov    %edi,0x36e90
   304f6:	89 ec                	mov    %ebp,%esp
   304f8:	5d                   	pop    %ebp
   304f9:	c3                   	ret    

000304fa <divide_zero_fault>:
   304fa:	6a ff                	push   $0xffffffff
   304fc:	6a 00                	push   $0x0
   304fe:	eb 58                	jmp    30558 <exception>

00030500 <single_step_fault>:
   30500:	6a ff                	push   $0xffffffff
   30502:	6a 01                	push   $0x1
   30504:	eb 52                	jmp    30558 <exception>

00030506 <non_maskable_interrupt>:
   30506:	6a ff                	push   $0xffffffff
   30508:	6a 02                	push   $0x2
   3050a:	eb 4c                	jmp    30558 <exception>

0003050c <breakpoint_trap>:
   3050c:	6a ff                	push   $0xffffffff
   3050e:	6a 03                	push   $0x3
   30510:	eb 46                	jmp    30558 <exception>

00030512 <overflow_trap>:
   30512:	6a ff                	push   $0xffffffff
   30514:	6a 04                	push   $0x4
   30516:	eb 40                	jmp    30558 <exception>

00030518 <bound_range_exceeded_fault>:
   30518:	6a ff                	push   $0xffffffff
   3051a:	6a 05                	push   $0x5
   3051c:	eb 3a                	jmp    30558 <exception>

0003051e <invalid_opcode_fault>:
   3051e:	6a ff                	push   $0xffffffff
   30520:	6a 06                	push   $0x6
   30522:	eb 34                	jmp    30558 <exception>

00030524 <coprocessor_not_available_fault>:
   30524:	6a ff                	push   $0xffffffff
   30526:	6a 07                	push   $0x7
   30528:	eb 2e                	jmp    30558 <exception>

0003052a <double_fault_exception_abort>:
   3052a:	6a 08                	push   $0x8
   3052c:	eb 2a                	jmp    30558 <exception>

0003052e <coprocessor_segment_overrun>:
   3052e:	6a ff                	push   $0xffffffff
   30530:	6a 09                	push   $0x9
   30532:	eb 24                	jmp    30558 <exception>

00030534 <invalid_task_state_segment_fault>:
   30534:	6a 0a                	push   $0xa
   30536:	eb 20                	jmp    30558 <exception>

00030538 <segment_not_present_fault>:
   30538:	6a 0b                	push   $0xb
   3053a:	eb 1c                	jmp    30558 <exception>

0003053c <stack_exception_fault>:
   3053c:	6a 0c                	push   $0xc
   3053e:	eb 18                	jmp    30558 <exception>

00030540 <general_protection_exception_fault>:
   30540:	6a 0d                	push   $0xd
   30542:	eb 14                	jmp    30558 <exception>

00030544 <page_fault>:
   30544:	6a 0e                	push   $0xe
   30546:	eb 10                	jmp    30558 <exception>

00030548 <coprocessor_error_fault>:
   30548:	6a ff                	push   $0xffffffff
   3054a:	6a 10                	push   $0x10
   3054c:	eb 0a                	jmp    30558 <exception>

0003054e <align_check_fault>:
   3054e:	6a 11                	push   $0x11
   30550:	eb 06                	jmp    30558 <exception>

00030552 <simd_float_exception_fault>:
   30552:	6a ff                	push   $0xffffffff
   30554:	6a 12                	push   $0x12
   30556:	eb 00                	jmp    30558 <exception>

00030558 <exception>:
   30558:	e8 32 03 00 00       	call   3088f <exception_handler>
   3055d:	83 c4 08             	add    $0x8,%esp
   30560:	f4                   	hlt    

00030561 <hwint0>:
   30561:	60                   	pusha  
   30562:	1e                   	push   %ds
   30563:	06                   	push   %es
   30564:	0f a0                	push   %fs
   30566:	0f a8                	push   %gs
   30568:	66 8c d2             	mov    %ss,%dx
   3056b:	8e da                	mov    %edx,%ds
   3056d:	8e c2                	mov    %edx,%es
   3056f:	8e e2                	mov    %edx,%fs
   30571:	b0 fd                	mov    $0xfd,%al
   30573:	e6 21                	out    %al,$0x21
   30575:	b0 20                	mov    $0x20,%al
   30577:	e6 20                	out    %al,$0x20
   30579:	ff 05 94 6e 03 00    	incl   0x36e94
   3057f:	83 3d 94 6e 03 00 00 	cmpl   $0x0,0x36e94
   30586:	75 05                	jne    3058d <hwint0.2>

00030588 <hwint0.1>:
   30588:	bc 80 6e 03 00       	mov    $0x36e80,%esp

0003058d <hwint0.2>:
   3058d:	fb                   	sti    
   3058e:	e8 98 22 00 00       	call   3282b <clock_handler>
   30593:	b0 fc                	mov    $0xfc,%al
   30595:	e6 21                	out    %al,$0x21
   30597:	fa                   	cli    
   30598:	83 3d 94 6e 03 00 00 	cmpl   $0x0,0x36e94
   3059f:	0f 85 19 01 00 00    	jne    306be <reenter_restore>
   305a5:	e9 00 01 00 00       	jmp    306aa <restore>

000305aa <hwint1>:
   305aa:	60                   	pusha  
   305ab:	1e                   	push   %ds
   305ac:	06                   	push   %es
   305ad:	0f a0                	push   %fs
   305af:	0f a8                	push   %gs
   305b1:	66 8c d2             	mov    %ss,%dx
   305b4:	8e da                	mov    %edx,%ds
   305b6:	8e c2                	mov    %edx,%es
   305b8:	8e e2                	mov    %edx,%fs
   305ba:	b0 fe                	mov    $0xfe,%al
   305bc:	e6 21                	out    %al,$0x21
   305be:	b0 20                	mov    $0x20,%al
   305c0:	e6 20                	out    %al,$0x20
   305c2:	ff 05 94 6e 03 00    	incl   0x36e94
   305c8:	83 3d 94 6e 03 00 00 	cmpl   $0x0,0x36e94
   305cf:	75 05                	jne    305d6 <hwint1.2>

000305d1 <hwint1.1>:
   305d1:	bc 80 6e 03 00       	mov    $0x36e80,%esp

000305d6 <hwint1.2>:
   305d6:	fb                   	sti    
   305d7:	e8 53 2c 00 00       	call   3322f <keyboard_handler>
   305dc:	b0 fc                	mov    $0xfc,%al
   305de:	e6 21                	out    %al,$0x21
   305e0:	fa                   	cli    
   305e1:	83 3d 94 6e 03 00 00 	cmpl   $0x0,0x36e94
   305e8:	0f 85 d0 00 00 00    	jne    306be <reenter_restore>
   305ee:	e9 b7 00 00 00       	jmp    306aa <restore>

000305f3 <hwint14>:
   305f3:	60                   	pusha  
   305f4:	1e                   	push   %ds
   305f5:	06                   	push   %es
   305f6:	0f a0                	push   %fs
   305f8:	0f a8                	push   %gs
   305fa:	66 8c d2             	mov    %ss,%dx
   305fd:	8e da                	mov    %edx,%ds
   305ff:	8e c2                	mov    %edx,%es
   30601:	8e e2                	mov    %edx,%fs
   30603:	e8 ad 01 00 00       	call   307b5 <disable_8259A_slave_winchester_irq>
   30608:	b0 20                	mov    $0x20,%al
   3060a:	e6 20                	out    %al,$0x20
   3060c:	b0 a0                	mov    $0xa0,%al
   3060e:	e6 a0                	out    %al,$0xa0
   30610:	ff 05 94 6e 03 00    	incl   0x36e94
   30616:	83 3d 94 6e 03 00 00 	cmpl   $0x0,0x36e94
   3061d:	75 05                	jne    30624 <hwint14.2>

0003061f <hwint14.1>:
   3061f:	bc 80 6e 03 00       	mov    $0x36e80,%esp

00030624 <hwint14.2>:
   30624:	fb                   	sti    
   30625:	e8 4d 18 00 00       	call   31e77 <hd_handle>
   3062a:	e8 7b 01 00 00       	call   307aa <enable_8259A_slave_winchester_irq>
   3062f:	fa                   	cli    
   30630:	83 3d 94 6e 03 00 00 	cmpl   $0x0,0x36e94
   30637:	0f 85 81 00 00 00    	jne    306be <reenter_restore>
   3063d:	eb 6b                	jmp    306aa <restore>

0003063f <sys_call>:
   3063f:	60                   	pusha  
   30640:	1e                   	push   %ds
   30641:	06                   	push   %es
   30642:	0f a0                	push   %fs
   30644:	0f a8                	push   %gs
   30646:	89 e6                	mov    %esp,%esi
   30648:	66 8c d2             	mov    %ss,%dx
   3064b:	8e da                	mov    %edx,%ds
   3064d:	8e c2                	mov    %edx,%es
   3064f:	8e e2                	mov    %edx,%fs
   30651:	ff 05 94 6e 03 00    	incl   0x36e94
   30657:	83 3d 94 6e 03 00 00 	cmpl   $0x0,0x36e94
   3065e:	75 05                	jne    30665 <sys_call.2>

00030660 <sys_call.1>:
   30660:	bc 80 6e 03 00       	mov    $0x36e80,%esp

00030665 <sys_call.2>:
   30665:	fb                   	sti    
   30666:	56                   	push   %esi
   30667:	ff 35 a0 72 03 00    	pushl  0x372a0
   3066d:	53                   	push   %ebx
   3066e:	51                   	push   %ecx
   3066f:	ff 14 85 60 60 03 00 	call   *0x36060(,%eax,4)
   30676:	83 c4 0c             	add    $0xc,%esp
   30679:	5e                   	pop    %esi
   3067a:	89 46 2c             	mov    %eax,0x2c(%esi)
   3067d:	83 3d 94 6e 03 00 00 	cmpl   $0x0,0x36e94
   30684:	75 38                	jne    306be <reenter_restore>
   30686:	eb 22                	jmp    306aa <restore>

00030688 <restart>:
   30688:	ff 0d 94 6e 03 00    	decl   0x36e94
   3068e:	8b 25 a0 72 03 00    	mov    0x372a0,%esp
   30694:	0f 00 54 24 44       	lldt   0x44(%esp)
   30699:	8d 44 24 44          	lea    0x44(%esp),%eax
   3069d:	a3 c4 9b 03 00       	mov    %eax,0x39bc4
   306a2:	0f a9                	pop    %gs
   306a4:	0f a1                	pop    %fs
   306a6:	07                   	pop    %es
   306a7:	1f                   	pop    %ds
   306a8:	61                   	popa   
   306a9:	cf                   	iret   

000306aa <restore>:
   306aa:	8b 25 a0 72 03 00    	mov    0x372a0,%esp
   306b0:	0f 00 54 24 44       	lldt   0x44(%esp)
   306b5:	8d 44 24 44          	lea    0x44(%esp),%eax
   306b9:	a3 c4 9b 03 00       	mov    %eax,0x39bc4

000306be <reenter_restore>:
   306be:	ff 0d 94 6e 03 00    	decl   0x36e94
   306c4:	0f a9                	pop    %gs
   306c6:	0f a1                	pop    %fs
   306c8:	07                   	pop    %es
   306c9:	1f                   	pop    %ds
   306ca:	61                   	popa   
   306cb:	cf                   	iret   

000306cc <in_byte>:
   306cc:	31 d2                	xor    %edx,%edx
   306ce:	8b 54 24 04          	mov    0x4(%esp),%edx
   306d2:	31 c0                	xor    %eax,%eax
   306d4:	ec                   	in     (%dx),%al
   306d5:	90                   	nop
   306d6:	90                   	nop
   306d7:	c3                   	ret    

000306d8 <out_byte>:
   306d8:	31 d2                	xor    %edx,%edx
   306da:	31 c0                	xor    %eax,%eax
   306dc:	8b 54 24 04          	mov    0x4(%esp),%edx
   306e0:	8b 44 24 08          	mov    0x8(%esp),%eax
   306e4:	ee                   	out    %al,(%dx)
   306e5:	90                   	nop
   306e6:	90                   	nop
   306e7:	90                   	nop
   306e8:	90                   	nop
   306e9:	c3                   	ret    

000306ea <in_byte2>:
   306ea:	55                   	push   %ebp
   306eb:	89 e5                	mov    %esp,%ebp
   306ed:	52                   	push   %edx
   306ee:	31 d2                	xor    %edx,%edx
   306f0:	66 8b 55 08          	mov    0x8(%ebp),%dx
   306f4:	31 c0                	xor    %eax,%eax
   306f6:	ec                   	in     (%dx),%al
   306f7:	90                   	nop
   306f8:	90                   	nop
   306f9:	5b                   	pop    %ebx
   306fa:	5d                   	pop    %ebp
   306fb:	c3                   	ret    

000306fc <disable_int>:
   306fc:	fa                   	cli    
   306fd:	c3                   	ret    

000306fe <enable_int>:
   306fe:	fb                   	sti    
   306ff:	c3                   	ret    

00030700 <check_tss_esp0>:
   30700:	55                   	push   %ebp
   30701:	89 e5                	mov    %esp,%ebp
   30703:	8b 45 08             	mov    0x8(%ebp),%eax
   30706:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   30709:	83 c0 44             	add    $0x44,%eax
   3070c:	8b 15 c4 9b 03 00    	mov    0x39bc4,%edx
   30712:	39 d0                	cmp    %edx,%eax
   30714:	74 7c                	je     30792 <check_tss_esp0.2>

00030716 <check_tss_esp0.1>:
   30716:	50                   	push   %eax
   30717:	52                   	push   %edx
   30718:	68 00 60 03 00       	push   $0x36000
   3071d:	e8 61 fd ff ff       	call   30483 <disp_str>
   30722:	83 c4 04             	add    $0x4,%esp
   30725:	5a                   	pop    %edx
   30726:	58                   	pop    %eax
   30727:	52                   	push   %edx
   30728:	50                   	push   %eax
   30729:	53                   	push   %ebx
   3072a:	e8 37 01 00 00       	call   30866 <disp_int>
   3072f:	83 c4 04             	add    $0x4,%esp
   30732:	58                   	pop    %eax
   30733:	5a                   	pop    %edx
   30734:	52                   	push   %edx
   30735:	50                   	push   %eax
   30736:	e8 2b 01 00 00       	call   30866 <disp_int>
   3073b:	58                   	pop    %eax
   3073c:	5a                   	pop    %edx
   3073d:	52                   	push   %edx
   3073e:	50                   	push   %eax
   3073f:	ff 35 94 6e 03 00    	pushl  0x36e94
   30745:	e8 1c 01 00 00       	call   30866 <disp_int>
   3074a:	83 c4 04             	add    $0x4,%esp
   3074d:	58                   	pop    %eax
   3074e:	5a                   	pop    %edx
   3074f:	52                   	push   %edx
   30750:	50                   	push   %eax
   30751:	ff 72 ec             	pushl  -0x14(%edx)
   30754:	e8 0d 01 00 00       	call   30866 <disp_int>
   30759:	83 c4 04             	add    $0x4,%esp
   3075c:	58                   	pop    %eax
   3075d:	5a                   	pop    %edx
   3075e:	52                   	push   %edx
   3075f:	50                   	push   %eax
   30760:	ff 70 ec             	pushl  -0x14(%eax)
   30763:	e8 fe 00 00 00       	call   30866 <disp_int>
   30768:	83 c4 04             	add    $0x4,%esp
   3076b:	58                   	pop    %eax
   3076c:	5a                   	pop    %edx
   3076d:	52                   	push   %edx
   3076e:	50                   	push   %eax
   3076f:	ff 35 a0 72 03 00    	pushl  0x372a0
   30775:	e8 ec 00 00 00       	call   30866 <disp_int>
   3077a:	83 c4 04             	add    $0x4,%esp
   3077d:	58                   	pop    %eax
   3077e:	5a                   	pop    %edx
   3077f:	52                   	push   %edx
   30780:	50                   	push   %eax
   30781:	68 80 6e 03 00       	push   $0x36e80
   30786:	e8 db 00 00 00       	call   30866 <disp_int>
   3078b:	83 c4 04             	add    $0x4,%esp
   3078e:	58                   	pop    %eax
   3078f:	5a                   	pop    %edx
   30790:	5d                   	pop    %ebp
   30791:	c3                   	ret    

00030792 <check_tss_esp0.2>:
   30792:	5d                   	pop    %ebp
   30793:	c3                   	ret    

00030794 <enable_8259A_casecade_irq>:
   30794:	66 50                	push   %ax
   30796:	e4 21                	in     $0x21,%al
   30798:	24 fb                	and    $0xfb,%al
   3079a:	e6 21                	out    %al,$0x21
   3079c:	66 58                	pop    %ax
   3079e:	c3                   	ret    

0003079f <disable_8259A_casecade_irq>:
   3079f:	66 50                	push   %ax
   307a1:	e4 21                	in     $0x21,%al
   307a3:	0c 04                	or     $0x4,%al
   307a5:	e6 21                	out    %al,$0x21
   307a7:	66 58                	pop    %ax
   307a9:	c3                   	ret    

000307aa <enable_8259A_slave_winchester_irq>:
   307aa:	66 50                	push   %ax
   307ac:	e4 a1                	in     $0xa1,%al
   307ae:	0c bf                	or     $0xbf,%al
   307b0:	e6 a1                	out    %al,$0xa1
   307b2:	66 58                	pop    %ax
   307b4:	c3                   	ret    

000307b5 <disable_8259A_slave_winchester_irq>:
   307b5:	66 50                	push   %ax
   307b7:	e4 a1                	in     $0xa1,%al
   307b9:	0c 40                	or     $0x40,%al
   307bb:	e6 a1                	out    %al,$0xa1
   307bd:	66 58                	pop    %ax
   307bf:	c3                   	ret    

000307c0 <atoi>:
   307c0:	55                   	push   %ebp
   307c1:	89 e5                	mov    %esp,%ebp
   307c3:	83 ec 10             	sub    $0x10,%esp
   307c6:	8b 45 08             	mov    0x8(%ebp),%eax
   307c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
   307cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
   307cf:	8d 50 01             	lea    0x1(%eax),%edx
   307d2:	89 55 fc             	mov    %edx,-0x4(%ebp)
   307d5:	c6 00 30             	movb   $0x30,(%eax)
   307d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
   307db:	8d 50 01             	lea    0x1(%eax),%edx
   307de:	89 55 fc             	mov    %edx,-0x4(%ebp)
   307e1:	c6 00 78             	movb   $0x78,(%eax)
   307e4:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
   307e8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   307ec:	75 0e                	jne    307fc <atoi+0x3c>
   307ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
   307f1:	8d 50 01             	lea    0x1(%eax),%edx
   307f4:	89 55 fc             	mov    %edx,-0x4(%ebp)
   307f7:	c6 00 30             	movb   $0x30,(%eax)
   307fa:	eb 61                	jmp    3085d <atoi+0x9d>
   307fc:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
   30803:	eb 52                	jmp    30857 <atoi+0x97>
   30805:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30808:	8b 55 0c             	mov    0xc(%ebp),%edx
   3080b:	89 c1                	mov    %eax,%ecx
   3080d:	d3 fa                	sar    %cl,%edx
   3080f:	89 d0                	mov    %edx,%eax
   30811:	83 e0 0f             	and    $0xf,%eax
   30814:	88 45 fb             	mov    %al,-0x5(%ebp)
   30817:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
   3081b:	75 06                	jne    30823 <atoi+0x63>
   3081d:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
   30821:	74 2f                	je     30852 <atoi+0x92>
   30823:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
   30827:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
   3082b:	83 c0 30             	add    $0x30,%eax
   3082e:	88 45 fb             	mov    %al,-0x5(%ebp)
   30831:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
   30835:	7e 0a                	jle    30841 <atoi+0x81>
   30837:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
   3083b:	83 c0 07             	add    $0x7,%eax
   3083e:	88 45 fb             	mov    %al,-0x5(%ebp)
   30841:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30844:	8d 50 01             	lea    0x1(%eax),%edx
   30847:	89 55 fc             	mov    %edx,-0x4(%ebp)
   3084a:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
   3084e:	88 10                	mov    %dl,(%eax)
   30850:	eb 01                	jmp    30853 <atoi+0x93>
   30852:	90                   	nop
   30853:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
   30857:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   3085b:	79 a8                	jns    30805 <atoi+0x45>
   3085d:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30860:	c6 00 00             	movb   $0x0,(%eax)
   30863:	90                   	nop
   30864:	c9                   	leave  
   30865:	c3                   	ret    

00030866 <disp_int>:
   30866:	55                   	push   %ebp
   30867:	89 e5                	mov    %esp,%ebp
   30869:	83 ec 18             	sub    $0x18,%esp
   3086c:	ff 75 08             	pushl  0x8(%ebp)
   3086f:	8d 45 e8             	lea    -0x18(%ebp),%eax
   30872:	50                   	push   %eax
   30873:	e8 48 ff ff ff       	call   307c0 <atoi>
   30878:	83 c4 08             	add    $0x8,%esp
   3087b:	83 ec 08             	sub    $0x8,%esp
   3087e:	6a 0b                	push   $0xb
   30880:	8d 45 e8             	lea    -0x18(%ebp),%eax
   30883:	50                   	push   %eax
   30884:	e8 35 fc ff ff       	call   304be <disp_str_colour>
   30889:	83 c4 10             	add    $0x10,%esp
   3088c:	90                   	nop
   3088d:	c9                   	leave  
   3088e:	c3                   	ret    

0003088f <exception_handler>:
   3088f:	55                   	push   %ebp
   30890:	89 e5                	mov    %esp,%ebp
   30892:	57                   	push   %edi
   30893:	56                   	push   %esi
   30894:	53                   	push   %ebx
   30895:	83 ec 6c             	sub    $0x6c,%esp
   30898:	8d 45 90             	lea    -0x70(%ebp),%eax
   3089b:	bb 60 38 03 00       	mov    $0x33860,%ebx
   308a0:	ba 13 00 00 00       	mov    $0x13,%edx
   308a5:	89 c7                	mov    %eax,%edi
   308a7:	89 de                	mov    %ebx,%esi
   308a9:	89 d1                	mov    %edx,%ecx
   308ab:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   308ad:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   308b4:	00 00 00 
   308b7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   308be:	eb 14                	jmp    308d4 <exception_handler+0x45>
   308c0:	83 ec 0c             	sub    $0xc,%esp
   308c3:	68 40 36 03 00       	push   $0x33640
   308c8:	e8 b6 fb ff ff       	call   30483 <disp_str>
   308cd:	83 c4 10             	add    $0x10,%esp
   308d0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   308d4:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
   308db:	7e e3                	jle    308c0 <exception_handler+0x31>
   308dd:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   308e4:	00 00 00 
   308e7:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
   308ee:	8b 45 08             	mov    0x8(%ebp),%eax
   308f1:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
   308f5:	89 45 dc             	mov    %eax,-0x24(%ebp)
   308f8:	83 ec 08             	sub    $0x8,%esp
   308fb:	ff 75 e0             	pushl  -0x20(%ebp)
   308fe:	ff 75 dc             	pushl  -0x24(%ebp)
   30901:	e8 b8 fb ff ff       	call   304be <disp_str_colour>
   30906:	83 c4 10             	add    $0x10,%esp
   30909:	83 ec 0c             	sub    $0xc,%esp
   3090c:	68 42 36 03 00       	push   $0x33642
   30911:	e8 6d fb ff ff       	call   30483 <disp_str>
   30916:	83 c4 10             	add    $0x10,%esp
   30919:	83 ec 08             	sub    $0x8,%esp
   3091c:	ff 75 e0             	pushl  -0x20(%ebp)
   3091f:	68 45 36 03 00       	push   $0x33645
   30924:	e8 95 fb ff ff       	call   304be <disp_str_colour>
   30929:	83 c4 10             	add    $0x10,%esp
   3092c:	83 ec 0c             	sub    $0xc,%esp
   3092f:	ff 75 08             	pushl  0x8(%ebp)
   30932:	e8 2f ff ff ff       	call   30866 <disp_int>
   30937:	83 c4 10             	add    $0x10,%esp
   3093a:	83 ec 0c             	sub    $0xc,%esp
   3093d:	68 42 36 03 00       	push   $0x33642
   30942:	e8 3c fb ff ff       	call   30483 <disp_str>
   30947:	83 c4 10             	add    $0x10,%esp
   3094a:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   3094e:	74 31                	je     30981 <exception_handler+0xf2>
   30950:	83 ec 08             	sub    $0x8,%esp
   30953:	ff 75 e0             	pushl  -0x20(%ebp)
   30956:	68 4d 36 03 00       	push   $0x3364d
   3095b:	e8 5e fb ff ff       	call   304be <disp_str_colour>
   30960:	83 c4 10             	add    $0x10,%esp
   30963:	83 ec 0c             	sub    $0xc,%esp
   30966:	ff 75 0c             	pushl  0xc(%ebp)
   30969:	e8 f8 fe ff ff       	call   30866 <disp_int>
   3096e:	83 c4 10             	add    $0x10,%esp
   30971:	83 ec 0c             	sub    $0xc,%esp
   30974:	68 42 36 03 00       	push   $0x33642
   30979:	e8 05 fb ff ff       	call   30483 <disp_str>
   3097e:	83 c4 10             	add    $0x10,%esp
   30981:	83 ec 08             	sub    $0x8,%esp
   30984:	ff 75 e0             	pushl  -0x20(%ebp)
   30987:	68 57 36 03 00       	push   $0x33657
   3098c:	e8 2d fb ff ff       	call   304be <disp_str_colour>
   30991:	83 c4 10             	add    $0x10,%esp
   30994:	83 ec 0c             	sub    $0xc,%esp
   30997:	ff 75 14             	pushl  0x14(%ebp)
   3099a:	e8 c7 fe ff ff       	call   30866 <disp_int>
   3099f:	83 c4 10             	add    $0x10,%esp
   309a2:	83 ec 0c             	sub    $0xc,%esp
   309a5:	68 42 36 03 00       	push   $0x33642
   309aa:	e8 d4 fa ff ff       	call   30483 <disp_str>
   309af:	83 c4 10             	add    $0x10,%esp
   309b2:	83 ec 08             	sub    $0x8,%esp
   309b5:	ff 75 e0             	pushl  -0x20(%ebp)
   309b8:	68 5b 36 03 00       	push   $0x3365b
   309bd:	e8 fc fa ff ff       	call   304be <disp_str_colour>
   309c2:	83 c4 10             	add    $0x10,%esp
   309c5:	83 ec 0c             	sub    $0xc,%esp
   309c8:	ff 75 10             	pushl  0x10(%ebp)
   309cb:	e8 96 fe ff ff       	call   30866 <disp_int>
   309d0:	83 c4 10             	add    $0x10,%esp
   309d3:	83 ec 0c             	sub    $0xc,%esp
   309d6:	68 42 36 03 00       	push   $0x33642
   309db:	e8 a3 fa ff ff       	call   30483 <disp_str>
   309e0:	83 c4 10             	add    $0x10,%esp
   309e3:	83 ec 08             	sub    $0x8,%esp
   309e6:	ff 75 e0             	pushl  -0x20(%ebp)
   309e9:	68 60 36 03 00       	push   $0x33660
   309ee:	e8 cb fa ff ff       	call   304be <disp_str_colour>
   309f3:	83 c4 10             	add    $0x10,%esp
   309f6:	83 ec 0c             	sub    $0xc,%esp
   309f9:	ff 75 18             	pushl  0x18(%ebp)
   309fc:	e8 65 fe ff ff       	call   30866 <disp_int>
   30a01:	83 c4 10             	add    $0x10,%esp
   30a04:	83 ec 0c             	sub    $0xc,%esp
   30a07:	68 42 36 03 00       	push   $0x33642
   30a0c:	e8 72 fa ff ff       	call   30483 <disp_str>
   30a11:	83 c4 10             	add    $0x10,%esp
   30a14:	90                   	nop
   30a15:	8d 65 f4             	lea    -0xc(%ebp),%esp
   30a18:	5b                   	pop    %ebx
   30a19:	5e                   	pop    %esi
   30a1a:	5f                   	pop    %edi
   30a1b:	5d                   	pop    %ebp
   30a1c:	c3                   	ret    

00030a1d <init_internal_interrupt>:
   30a1d:	55                   	push   %ebp
   30a1e:	89 e5                	mov    %esp,%ebp
   30a20:	83 ec 08             	sub    $0x8,%esp
   30a23:	6a 0e                	push   $0xe
   30a25:	6a 08                	push   $0x8
   30a27:	68 fa 04 03 00       	push   $0x304fa
   30a2c:	6a 00                	push   $0x0
   30a2e:	e8 f9 20 00 00       	call   32b2c <InitInterruptDesc>
   30a33:	83 c4 10             	add    $0x10,%esp
   30a36:	6a 0e                	push   $0xe
   30a38:	6a 08                	push   $0x8
   30a3a:	68 00 05 03 00       	push   $0x30500
   30a3f:	6a 01                	push   $0x1
   30a41:	e8 e6 20 00 00       	call   32b2c <InitInterruptDesc>
   30a46:	83 c4 10             	add    $0x10,%esp
   30a49:	6a 0e                	push   $0xe
   30a4b:	6a 08                	push   $0x8
   30a4d:	68 06 05 03 00       	push   $0x30506
   30a52:	6a 02                	push   $0x2
   30a54:	e8 d3 20 00 00       	call   32b2c <InitInterruptDesc>
   30a59:	83 c4 10             	add    $0x10,%esp
   30a5c:	6a 0e                	push   $0xe
   30a5e:	6a 08                	push   $0x8
   30a60:	68 0c 05 03 00       	push   $0x3050c
   30a65:	6a 03                	push   $0x3
   30a67:	e8 c0 20 00 00       	call   32b2c <InitInterruptDesc>
   30a6c:	83 c4 10             	add    $0x10,%esp
   30a6f:	6a 0e                	push   $0xe
   30a71:	6a 08                	push   $0x8
   30a73:	68 12 05 03 00       	push   $0x30512
   30a78:	6a 04                	push   $0x4
   30a7a:	e8 ad 20 00 00       	call   32b2c <InitInterruptDesc>
   30a7f:	83 c4 10             	add    $0x10,%esp
   30a82:	6a 0e                	push   $0xe
   30a84:	6a 08                	push   $0x8
   30a86:	68 18 05 03 00       	push   $0x30518
   30a8b:	6a 05                	push   $0x5
   30a8d:	e8 9a 20 00 00       	call   32b2c <InitInterruptDesc>
   30a92:	83 c4 10             	add    $0x10,%esp
   30a95:	6a 0e                	push   $0xe
   30a97:	6a 08                	push   $0x8
   30a99:	68 1e 05 03 00       	push   $0x3051e
   30a9e:	6a 06                	push   $0x6
   30aa0:	e8 87 20 00 00       	call   32b2c <InitInterruptDesc>
   30aa5:	83 c4 10             	add    $0x10,%esp
   30aa8:	6a 0e                	push   $0xe
   30aaa:	6a 08                	push   $0x8
   30aac:	68 24 05 03 00       	push   $0x30524
   30ab1:	6a 07                	push   $0x7
   30ab3:	e8 74 20 00 00       	call   32b2c <InitInterruptDesc>
   30ab8:	83 c4 10             	add    $0x10,%esp
   30abb:	6a 0e                	push   $0xe
   30abd:	6a 08                	push   $0x8
   30abf:	68 2a 05 03 00       	push   $0x3052a
   30ac4:	6a 08                	push   $0x8
   30ac6:	e8 61 20 00 00       	call   32b2c <InitInterruptDesc>
   30acb:	83 c4 10             	add    $0x10,%esp
   30ace:	6a 0e                	push   $0xe
   30ad0:	6a 08                	push   $0x8
   30ad2:	68 2e 05 03 00       	push   $0x3052e
   30ad7:	6a 09                	push   $0x9
   30ad9:	e8 4e 20 00 00       	call   32b2c <InitInterruptDesc>
   30ade:	83 c4 10             	add    $0x10,%esp
   30ae1:	6a 0e                	push   $0xe
   30ae3:	6a 08                	push   $0x8
   30ae5:	68 34 05 03 00       	push   $0x30534
   30aea:	6a 0a                	push   $0xa
   30aec:	e8 3b 20 00 00       	call   32b2c <InitInterruptDesc>
   30af1:	83 c4 10             	add    $0x10,%esp
   30af4:	6a 0e                	push   $0xe
   30af6:	6a 08                	push   $0x8
   30af8:	68 38 05 03 00       	push   $0x30538
   30afd:	6a 0b                	push   $0xb
   30aff:	e8 28 20 00 00       	call   32b2c <InitInterruptDesc>
   30b04:	83 c4 10             	add    $0x10,%esp
   30b07:	6a 0e                	push   $0xe
   30b09:	6a 08                	push   $0x8
   30b0b:	68 3c 05 03 00       	push   $0x3053c
   30b10:	6a 0c                	push   $0xc
   30b12:	e8 15 20 00 00       	call   32b2c <InitInterruptDesc>
   30b17:	83 c4 10             	add    $0x10,%esp
   30b1a:	6a 0e                	push   $0xe
   30b1c:	6a 08                	push   $0x8
   30b1e:	68 40 05 03 00       	push   $0x30540
   30b23:	6a 0d                	push   $0xd
   30b25:	e8 02 20 00 00       	call   32b2c <InitInterruptDesc>
   30b2a:	83 c4 10             	add    $0x10,%esp
   30b2d:	6a 0e                	push   $0xe
   30b2f:	6a 08                	push   $0x8
   30b31:	68 44 05 03 00       	push   $0x30544
   30b36:	6a 0e                	push   $0xe
   30b38:	e8 ef 1f 00 00       	call   32b2c <InitInterruptDesc>
   30b3d:	83 c4 10             	add    $0x10,%esp
   30b40:	6a 0e                	push   $0xe
   30b42:	6a 08                	push   $0x8
   30b44:	68 48 05 03 00       	push   $0x30548
   30b49:	6a 10                	push   $0x10
   30b4b:	e8 dc 1f 00 00       	call   32b2c <InitInterruptDesc>
   30b50:	83 c4 10             	add    $0x10,%esp
   30b53:	6a 0e                	push   $0xe
   30b55:	6a 08                	push   $0x8
   30b57:	68 4e 05 03 00       	push   $0x3054e
   30b5c:	6a 11                	push   $0x11
   30b5e:	e8 c9 1f 00 00       	call   32b2c <InitInterruptDesc>
   30b63:	83 c4 10             	add    $0x10,%esp
   30b66:	6a 0e                	push   $0xe
   30b68:	6a 08                	push   $0x8
   30b6a:	68 52 05 03 00       	push   $0x30552
   30b6f:	6a 12                	push   $0x12
   30b71:	e8 b6 1f 00 00       	call   32b2c <InitInterruptDesc>
   30b76:	83 c4 10             	add    $0x10,%esp
   30b79:	6a 0e                	push   $0xe
   30b7b:	6a 0e                	push   $0xe
   30b7d:	68 3f 06 03 00       	push   $0x3063f
   30b82:	68 90 00 00 00       	push   $0x90
   30b87:	e8 a0 1f 00 00       	call   32b2c <InitInterruptDesc>
   30b8c:	83 c4 10             	add    $0x10,%esp
   30b8f:	90                   	nop
   30b90:	c9                   	leave  
   30b91:	c3                   	ret    

00030b92 <test>:
   30b92:	55                   	push   %ebp
   30b93:	89 e5                	mov    %esp,%ebp
   30b95:	83 ec 18             	sub    $0x18,%esp
   30b98:	83 ec 0c             	sub    $0xc,%esp
   30b9b:	68 ac 38 03 00       	push   $0x338ac
   30ba0:	e8 de f8 ff ff       	call   30483 <disp_str>
   30ba5:	83 c4 10             	add    $0x10,%esp
   30ba8:	83 ec 0c             	sub    $0xc,%esp
   30bab:	6a 06                	push   $0x6
   30bad:	e8 b4 fc ff ff       	call   30866 <disp_int>
   30bb2:	83 c4 10             	add    $0x10,%esp
   30bb5:	83 ec 0c             	sub    $0xc,%esp
   30bb8:	68 ae 38 03 00       	push   $0x338ae
   30bbd:	e8 c1 f8 ff ff       	call   30483 <disp_str>
   30bc2:	83 c4 10             	add    $0x10,%esp
   30bc5:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   30bcc:	00 00 00 
   30bcf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30bd6:	eb 14                	jmp    30bec <test+0x5a>
   30bd8:	83 ec 0c             	sub    $0xc,%esp
   30bdb:	68 40 36 03 00       	push   $0x33640
   30be0:	e8 9e f8 ff ff       	call   30483 <disp_str>
   30be5:	83 c4 10             	add    $0x10,%esp
   30be8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30bec:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
   30bf3:	7e e3                	jle    30bd8 <test+0x46>
   30bf5:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   30bfc:	00 00 00 
   30bff:	83 ec 08             	sub    $0x8,%esp
   30c02:	6a 0f                	push   $0xf
   30c04:	68 b0 38 03 00       	push   $0x338b0
   30c09:	e8 b0 f8 ff ff       	call   304be <disp_str_colour>
   30c0e:	83 c4 10             	add    $0x10,%esp
   30c11:	83 ec 0c             	sub    $0xc,%esp
   30c14:	68 ae 38 03 00       	push   $0x338ae
   30c19:	e8 65 f8 ff ff       	call   30483 <disp_str>
   30c1e:	83 c4 10             	add    $0x10,%esp
   30c21:	83 ec 0c             	sub    $0xc,%esp
   30c24:	68 89 00 00 00       	push   $0x89
   30c29:	e8 38 fc ff ff       	call   30866 <disp_int>
   30c2e:	83 c4 10             	add    $0x10,%esp
   30c31:	83 ec 0c             	sub    $0xc,%esp
   30c34:	68 ae 38 03 00       	push   $0x338ae
   30c39:	e8 45 f8 ff ff       	call   30483 <disp_str>
   30c3e:	83 c4 10             	add    $0x10,%esp
   30c41:	83 ec 08             	sub    $0x8,%esp
   30c44:	6a 0f                	push   $0xf
   30c46:	68 b0 38 03 00       	push   $0x338b0
   30c4b:	e8 6e f8 ff ff       	call   304be <disp_str_colour>
   30c50:	83 c4 10             	add    $0x10,%esp
   30c53:	83 ec 08             	sub    $0x8,%esp
   30c56:	6a 74                	push   $0x74
   30c58:	68 b0 38 03 00       	push   $0x338b0
   30c5d:	e8 5c f8 ff ff       	call   304be <disp_str_colour>
   30c62:	83 c4 10             	add    $0x10,%esp
   30c65:	83 ec 0c             	sub    $0xc,%esp
   30c68:	68 ae 38 03 00       	push   $0x338ae
   30c6d:	e8 11 f8 ff ff       	call   30483 <disp_str>
   30c72:	83 c4 10             	add    $0x10,%esp
   30c75:	83 ec 08             	sub    $0x8,%esp
   30c78:	6a 0f                	push   $0xf
   30c7a:	68 c0 38 03 00       	push   $0x338c0
   30c7f:	e8 3a f8 ff ff       	call   304be <disp_str_colour>
   30c84:	83 c4 10             	add    $0x10,%esp
   30c87:	83 ec 0c             	sub    $0xc,%esp
   30c8a:	68 e9 38 03 00       	push   $0x338e9
   30c8f:	e8 ef f7 ff ff       	call   30483 <disp_str>
   30c94:	83 c4 10             	add    $0x10,%esp
   30c97:	83 ec 0c             	sub    $0xc,%esp
   30c9a:	68 fd 38 03 00       	push   $0x338fd
   30c9f:	e8 df f7 ff ff       	call   30483 <disp_str>
   30ca4:	83 c4 10             	add    $0x10,%esp
   30ca7:	83 ec 0c             	sub    $0xc,%esp
   30caa:	6a 17                	push   $0x17
   30cac:	e8 b5 fb ff ff       	call   30866 <disp_int>
   30cb1:	83 c4 10             	add    $0x10,%esp
   30cb4:	83 ec 0c             	sub    $0xc,%esp
   30cb7:	68 ae 38 03 00       	push   $0x338ae
   30cbc:	e8 c2 f7 ff ff       	call   30483 <disp_str>
   30cc1:	83 c4 10             	add    $0x10,%esp
   30cc4:	83 ec 0c             	sub    $0xc,%esp
   30cc7:	68 0a 02 00 00       	push   $0x20a
   30ccc:	e8 95 fb ff ff       	call   30866 <disp_int>
   30cd1:	83 c4 10             	add    $0x10,%esp
   30cd4:	83 ec 0c             	sub    $0xc,%esp
   30cd7:	68 ae 38 03 00       	push   $0x338ae
   30cdc:	e8 a2 f7 ff ff       	call   30483 <disp_str>
   30ce1:	83 c4 10             	add    $0x10,%esp
   30ce4:	90                   	nop
   30ce5:	c9                   	leave  
   30ce6:	c3                   	ret    

00030ce7 <disp_str_colour3>:
   30ce7:	55                   	push   %ebp
   30ce8:	89 e5                	mov    %esp,%ebp
   30cea:	90                   	nop
   30ceb:	5d                   	pop    %ebp
   30cec:	c3                   	ret    

00030ced <spurious_irq>:
   30ced:	55                   	push   %ebp
   30cee:	89 e5                	mov    %esp,%ebp
   30cf0:	83 ec 08             	sub    $0x8,%esp
   30cf3:	83 ec 08             	sub    $0x8,%esp
   30cf6:	6a 0b                	push   $0xb
   30cf8:	68 0c 39 03 00       	push   $0x3390c
   30cfd:	e8 bc f7 ff ff       	call   304be <disp_str_colour>
   30d02:	83 c4 10             	add    $0x10,%esp
   30d05:	83 ec 0c             	sub    $0xc,%esp
   30d08:	ff 75 08             	pushl  0x8(%ebp)
   30d0b:	e8 56 fb ff ff       	call   30866 <disp_int>
   30d10:	83 c4 10             	add    $0x10,%esp
   30d13:	a1 40 a4 03 00       	mov    0x3a440,%eax
   30d18:	83 c0 01             	add    $0x1,%eax
   30d1b:	a3 40 a4 03 00       	mov    %eax,0x3a440
   30d20:	83 ec 0c             	sub    $0xc,%esp
   30d23:	68 33 39 03 00       	push   $0x33933
   30d28:	e8 56 f7 ff ff       	call   30483 <disp_str>
   30d2d:	83 c4 10             	add    $0x10,%esp
   30d30:	a1 40 a4 03 00       	mov    0x3a440,%eax
   30d35:	83 ec 0c             	sub    $0xc,%esp
   30d38:	50                   	push   %eax
   30d39:	e8 28 fb ff ff       	call   30866 <disp_int>
   30d3e:	83 c4 10             	add    $0x10,%esp
   30d41:	83 ec 0c             	sub    $0xc,%esp
   30d44:	68 35 39 03 00       	push   $0x33935
   30d49:	e8 35 f7 ff ff       	call   30483 <disp_str>
   30d4e:	83 c4 10             	add    $0x10,%esp
   30d51:	83 ec 08             	sub    $0x8,%esp
   30d54:	6a 0c                	push   $0xc
   30d56:	68 38 39 03 00       	push   $0x33938
   30d5b:	e8 5e f7 ff ff       	call   304be <disp_str_colour>
   30d60:	83 c4 10             	add    $0x10,%esp
   30d63:	90                   	nop
   30d64:	c9                   	leave  
   30d65:	c3                   	ret    

00030d66 <kernel_main>:
   30d66:	55                   	push   %ebp
   30d67:	89 e5                	mov    %esp,%ebp
   30d69:	83 ec 28             	sub    $0x28,%esp
   30d6c:	c7 05 40 a4 03 00 00 	movl   $0x0,0x3a440
   30d73:	00 00 00 
   30d76:	c7 05 2c 9c 03 00 00 	movl   $0x0,0x39c2c
   30d7d:	00 00 00 
   30d80:	c7 05 94 6e 03 00 00 	movl   $0x0,0x36e94
   30d87:	00 00 00 
   30d8a:	c7 45 e8 e0 16 04 00 	movl   $0x416e0,-0x18(%ebp)
   30d91:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   30d98:	e9 94 01 00 00       	jmp    30f31 <kernel_main+0x1cb>
   30d9d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   30da0:	89 d0                	mov    %edx,%eax
   30da2:	c1 e0 03             	shl    $0x3,%eax
   30da5:	01 d0                	add    %edx,%eax
   30da7:	c1 e0 04             	shl    $0x4,%eax
   30daa:	05 e0 16 04 00       	add    $0x416e0,%eax
   30daf:	89 45 dc             	mov    %eax,-0x24(%ebp)
   30db2:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
   30db6:	7f 3f                	jg     30df7 <kernel_main+0x91>
   30db8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30dbb:	c1 e0 03             	shl    $0x3,%eax
   30dbe:	05 40 60 03 00       	add    $0x36040,%eax
   30dc3:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30dc6:	c7 45 f0 02 12 00 00 	movl   $0x1202,-0x10(%ebp)
   30dcd:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
   30dd1:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
   30dd5:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30dd8:	c7 40 60 0f 00 00 00 	movl   $0xf,0x60(%eax)
   30ddf:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30de2:	8b 50 60             	mov    0x60(%eax),%edx
   30de5:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30de8:	89 50 5c             	mov    %edx,0x5c(%eax)
   30deb:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30dee:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
   30df5:	eb 46                	jmp    30e3d <kernel_main+0xd7>
   30df7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30dfa:	05 fc ff ff 1f       	add    $0x1ffffffc,%eax
   30dff:	c1 e0 03             	shl    $0x3,%eax
   30e02:	05 20 60 03 00       	add    $0x36020,%eax
   30e07:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30e0a:	c7 45 f0 02 02 00 00 	movl   $0x202,-0x10(%ebp)
   30e11:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
   30e15:	c6 45 ee 03          	movb   $0x3,-0x12(%ebp)
   30e19:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30e1c:	c7 40 60 0a 00 00 00 	movl   $0xa,0x60(%eax)
   30e23:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30e26:	8b 50 60             	mov    0x60(%eax),%edx
   30e29:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30e2c:	89 50 5c             	mov    %edx,0x5c(%eax)
   30e2f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30e32:	83 e8 04             	sub    $0x4,%eax
   30e35:	89 c2                	mov    %eax,%edx
   30e37:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30e3a:	89 50 64             	mov    %edx,0x64(%eax)
   30e3d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30e40:	83 c0 09             	add    $0x9,%eax
   30e43:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
   30e4a:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30e4d:	66 89 50 44          	mov    %dx,0x44(%eax)
   30e51:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   30e54:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30e57:	89 50 58             	mov    %edx,0x58(%eax)
   30e5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30e5d:	83 c0 46             	add    $0x46,%eax
   30e60:	83 ec 04             	sub    $0x4,%esp
   30e63:	6a 08                	push   $0x8
   30e65:	68 a8 6e 03 00       	push   $0x36ea8
   30e6a:	50                   	push   %eax
   30e6b:	e8 f4 2d 00 00       	call   33c64 <Memcpy>
   30e70:	83 c4 10             	add    $0x10,%esp
   30e73:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
   30e77:	c1 e0 05             	shl    $0x5,%eax
   30e7a:	83 c8 9a             	or     $0xffffff9a,%eax
   30e7d:	89 c2                	mov    %eax,%edx
   30e7f:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30e82:	88 50 4b             	mov    %dl,0x4b(%eax)
   30e85:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30e88:	83 c0 4e             	add    $0x4e,%eax
   30e8b:	83 ec 04             	sub    $0x4,%esp
   30e8e:	6a 08                	push   $0x8
   30e90:	68 d0 6e 03 00       	push   $0x36ed0
   30e95:	50                   	push   %eax
   30e96:	e8 c9 2d 00 00       	call   33c64 <Memcpy>
   30e9b:	83 c4 10             	add    $0x10,%esp
   30e9e:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
   30ea2:	c1 e0 05             	shl    $0x5,%eax
   30ea5:	83 c8 92             	or     $0xffffff92,%eax
   30ea8:	89 c2                	mov    %eax,%edx
   30eaa:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30ead:	88 50 53             	mov    %dl,0x53(%eax)
   30eb0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
   30eb4:	83 c8 04             	or     $0x4,%eax
   30eb7:	0f b6 c0             	movzbl %al,%eax
   30eba:	66 89 45 da          	mov    %ax,-0x26(%ebp)
   30ebe:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
   30ec2:	83 c8 0c             	or     $0xc,%eax
   30ec5:	0f b6 c0             	movzbl %al,%eax
   30ec8:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
   30ecc:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
   30ed0:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30ed3:	89 50 34             	mov    %edx,0x34(%eax)
   30ed6:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   30eda:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30edd:	89 50 0c             	mov    %edx,0xc(%eax)
   30ee0:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   30ee4:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30ee7:	89 50 04             	mov    %edx,0x4(%eax)
   30eea:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   30eee:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30ef1:	89 50 08             	mov    %edx,0x8(%eax)
   30ef4:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   30ef8:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30efb:	89 50 40             	mov    %edx,0x40(%eax)
   30efe:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f01:	c7 00 39 00 00 00    	movl   $0x39,(%eax)
   30f07:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30f0a:	8b 00                	mov    (%eax),%eax
   30f0c:	89 c2                	mov    %eax,%edx
   30f0e:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f11:	89 50 30             	mov    %edx,0x30(%eax)
   30f14:	8b 55 e8             	mov    -0x18(%ebp),%edx
   30f17:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f1a:	89 50 3c             	mov    %edx,0x3c(%eax)
   30f1d:	81 6d e8 00 04 00 00 	subl   $0x400,-0x18(%ebp)
   30f24:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f27:	8b 55 f0             	mov    -0x10(%ebp),%edx
   30f2a:	89 50 38             	mov    %edx,0x38(%eax)
   30f2d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   30f31:	83 7d e4 06          	cmpl   $0x6,-0x1c(%ebp)
   30f35:	0f 8e 62 fe ff ff    	jle    30d9d <kernel_main+0x37>
   30f3b:	c7 05 a0 72 03 00 e0 	movl   $0x416e0,0x372a0
   30f42:	16 04 00 
   30f45:	83 ec 04             	sub    $0x4,%esp
   30f48:	68 20 03 00 00       	push   $0x320
   30f4d:	6a 00                	push   $0x0
   30f4f:	68 cc 72 03 00       	push   $0x372cc
   30f54:	e8 39 2d 00 00       	call   33c92 <Memset>
   30f59:	83 c4 10             	add    $0x10,%esp
   30f5c:	c7 05 c0 72 03 00 cc 	movl   $0x372cc,0x372c0
   30f63:	72 03 00 
   30f66:	a1 c0 72 03 00       	mov    0x372c0,%eax
   30f6b:	a3 c4 72 03 00       	mov    %eax,0x372c4
   30f70:	c7 05 c8 72 03 00 00 	movl   $0x0,0x372c8
   30f77:	00 00 00 
   30f7a:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   30f81:	00 00 00 
   30f84:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   30f8b:	eb 14                	jmp    30fa1 <kernel_main+0x23b>
   30f8d:	83 ec 0c             	sub    $0xc,%esp
   30f90:	68 40 36 03 00       	push   $0x33640
   30f95:	e8 e9 f4 ff ff       	call   30483 <disp_str>
   30f9a:	83 c4 10             	add    $0x10,%esp
   30f9d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
   30fa1:	81 7d e0 9f 0f 00 00 	cmpl   $0xf9f,-0x20(%ebp)
   30fa8:	7e e3                	jle    30f8d <kernel_main+0x227>
   30faa:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   30fb1:	00 00 00 
   30fb4:	e8 cd 24 00 00       	call   33486 <init_keyboard_handler>
   30fb9:	e8 ca f6 ff ff       	call   30688 <restart>
   30fbe:	eb fe                	jmp    30fbe <kernel_main+0x258>

00030fc0 <TestA>:
   30fc0:	55                   	push   %ebp
   30fc1:	89 e5                	mov    %esp,%ebp
   30fc3:	83 ec 18             	sub    $0x18,%esp
   30fc6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30fcd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   30fd1:	74 1c                	je     30fef <TestA+0x2f>
   30fd3:	68 4d 01 00 00       	push   $0x14d
   30fd8:	68 5d 39 03 00       	push   $0x3395d
   30fdd:	68 5d 39 03 00       	push   $0x3395d
   30fe2:	68 64 39 03 00       	push   $0x33964
   30fe7:	e8 19 05 00 00       	call   31505 <assertion_failure>
   30fec:	83 c4 10             	add    $0x10,%esp
   30fef:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   30ff3:	77 16                	ja     3100b <TestA+0x4b>
   30ff5:	e8 25 0d 00 00       	call   31d1f <get_ticks_ipc>
   30ffa:	83 ec 08             	sub    $0x8,%esp
   30ffd:	50                   	push   %eax
   30ffe:	68 69 39 03 00       	push   $0x33969
   31003:	e8 b3 01 00 00       	call   311bb <Printf>
   31008:	83 c4 10             	add    $0x10,%esp
   3100b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3100f:	eb de                	jmp    30fef <TestA+0x2f>

00031011 <delay>:
   31011:	55                   	push   %ebp
   31012:	89 e5                	mov    %esp,%ebp
   31014:	83 ec 10             	sub    $0x10,%esp
   31017:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   3101e:	eb 2d                	jmp    3104d <delay+0x3c>
   31020:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   31027:	eb 1a                	jmp    31043 <delay+0x32>
   31029:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31030:	eb 04                	jmp    31036 <delay+0x25>
   31032:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31036:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
   3103d:	7e f3                	jle    31032 <delay+0x21>
   3103f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31043:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
   31047:	7e e0                	jle    31029 <delay+0x18>
   31049:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3104d:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31050:	3b 45 08             	cmp    0x8(%ebp),%eax
   31053:	7c cb                	jl     31020 <delay+0xf>
   31055:	90                   	nop
   31056:	c9                   	leave  
   31057:	c3                   	ret    

00031058 <TestB>:
   31058:	55                   	push   %ebp
   31059:	89 e5                	mov    %esp,%ebp
   3105b:	83 ec 18             	sub    $0x18,%esp
   3105e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31065:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   31069:	77 16                	ja     31081 <TestB+0x29>
   3106b:	e8 af 0c 00 00       	call   31d1f <get_ticks_ipc>
   31070:	83 ec 08             	sub    $0x8,%esp
   31073:	50                   	push   %eax
   31074:	68 6c 39 03 00       	push   $0x3396c
   31079:	e8 3d 01 00 00       	call   311bb <Printf>
   3107e:	83 c4 10             	add    $0x10,%esp
   31081:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31085:	eb de                	jmp    31065 <TestB+0xd>

00031087 <TestC>:
   31087:	55                   	push   %ebp
   31088:	89 e5                	mov    %esp,%ebp
   3108a:	83 ec 18             	sub    $0x18,%esp
   3108d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31094:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   31098:	77 1a                	ja     310b4 <TestC+0x2d>
   3109a:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
   310a1:	83 ec 08             	sub    $0x8,%esp
   310a4:	ff 75 f0             	pushl  -0x10(%ebp)
   310a7:	68 73 39 03 00       	push   $0x33973
   310ac:	e8 0a 01 00 00       	call   311bb <Printf>
   310b1:	83 c4 10             	add    $0x10,%esp
   310b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   310b8:	eb da                	jmp    31094 <TestC+0xd>

000310ba <sys_get_ticks>:
   310ba:	55                   	push   %ebp
   310bb:	89 e5                	mov    %esp,%ebp
   310bd:	a1 40 a4 03 00       	mov    0x3a440,%eax
   310c2:	5d                   	pop    %ebp
   310c3:	c3                   	ret    

000310c4 <sys_write>:
   310c4:	55                   	push   %ebp
   310c5:	89 e5                	mov    %esp,%ebp
   310c7:	83 ec 18             	sub    $0x18,%esp
   310ca:	8b 45 10             	mov    0x10(%ebp),%eax
   310cd:	8b 40 64             	mov    0x64(%eax),%eax
   310d0:	69 c0 90 0c 00 00    	imul   $0xc90,%eax,%eax
   310d6:	05 00 76 03 00       	add    $0x37600,%eax
   310db:	89 45 ec             	mov    %eax,-0x14(%ebp)
   310de:	8b 45 0c             	mov    0xc(%ebp),%eax
   310e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
   310e4:	8b 45 08             	mov    0x8(%ebp),%eax
   310e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
   310ea:	eb 20                	jmp    3110c <sys_write+0x48>
   310ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
   310ef:	0f b6 00             	movzbl (%eax),%eax
   310f2:	0f b6 c0             	movzbl %al,%eax
   310f5:	83 ec 08             	sub    $0x8,%esp
   310f8:	50                   	push   %eax
   310f9:	ff 75 ec             	pushl  -0x14(%ebp)
   310fc:	e8 63 1d 00 00       	call   32e64 <out_char>
   31101:	83 c4 10             	add    $0x10,%esp
   31104:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   31108:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
   3110c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31110:	7f da                	jg     310ec <sys_write+0x28>
   31112:	90                   	nop
   31113:	c9                   	leave  
   31114:	c3                   	ret    

00031115 <milli_delay>:
   31115:	55                   	push   %ebp
   31116:	89 e5                	mov    %esp,%ebp
   31118:	83 ec 18             	sub    $0x18,%esp
   3111b:	e8 ff 0b 00 00       	call   31d1f <get_ticks_ipc>
   31120:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31123:	90                   	nop
   31124:	e8 f6 0b 00 00       	call   31d1f <get_ticks_ipc>
   31129:	2b 45 f4             	sub    -0xc(%ebp),%eax
   3112c:	89 c1                	mov    %eax,%ecx
   3112e:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
   31133:	89 c8                	mov    %ecx,%eax
   31135:	f7 ea                	imul   %edx
   31137:	c1 fa 05             	sar    $0x5,%edx
   3113a:	89 c8                	mov    %ecx,%eax
   3113c:	c1 f8 1f             	sar    $0x1f,%eax
   3113f:	29 c2                	sub    %eax,%edx
   31141:	89 d0                	mov    %edx,%eax
   31143:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
   31149:	39 45 08             	cmp    %eax,0x8(%ebp)
   3114c:	77 d6                	ja     31124 <milli_delay+0xf>
   3114e:	90                   	nop
   3114f:	c9                   	leave  
   31150:	c3                   	ret    

00031151 <TaskSys>:
   31151:	55                   	push   %ebp
   31152:	89 e5                	mov    %esp,%ebp
   31154:	83 ec 28             	sub    $0x28,%esp
   31157:	83 ec 04             	sub    $0x4,%esp
   3115a:	6a 0c                	push   $0xc
   3115c:	6a 00                	push   $0x0
   3115e:	8d 45 e0             	lea    -0x20(%ebp),%eax
   31161:	50                   	push   %eax
   31162:	e8 2b 2b 00 00       	call   33c92 <Memset>
   31167:	83 c4 10             	add    $0x10,%esp
   3116a:	83 ec 08             	sub    $0x8,%esp
   3116d:	6a 11                	push   $0x11
   3116f:	8d 45 e0             	lea    -0x20(%ebp),%eax
   31172:	50                   	push   %eax
   31173:	e8 b0 15 00 00       	call   32728 <receive_msg>
   31178:	83 c4 10             	add    $0x10,%esp
   3117b:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3117e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31182:	75 34                	jne    311b8 <TaskSys+0x67>
   31184:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31187:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3118a:	8b 45 e0             	mov    -0x20(%ebp),%eax
   3118d:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31190:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
   31194:	75 1f                	jne    311b5 <TaskSys+0x64>
   31196:	a1 40 a4 03 00       	mov    0x3a440,%eax
   3119b:	89 45 e8             	mov    %eax,-0x18(%ebp)
   3119e:	83 ec 08             	sub    $0x8,%esp
   311a1:	ff 75 ec             	pushl  -0x14(%ebp)
   311a4:	8d 45 e0             	lea    -0x20(%ebp),%eax
   311a7:	50                   	push   %eax
   311a8:	e8 6b 15 00 00       	call   32718 <send_msg>
   311ad:	83 c4 10             	add    $0x10,%esp
   311b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
   311b3:	eb 01                	jmp    311b6 <TaskSys+0x65>
   311b5:	90                   	nop
   311b6:	eb 9f                	jmp    31157 <TaskSys+0x6>
   311b8:	90                   	nop
   311b9:	c9                   	leave  
   311ba:	c3                   	ret    

000311bb <Printf>:
   311bb:	55                   	push   %ebp
   311bc:	89 e5                	mov    %esp,%ebp
   311be:	81 ec 18 01 00 00    	sub    $0x118,%esp
   311c4:	83 ec 04             	sub    $0x4,%esp
   311c7:	68 00 01 00 00       	push   $0x100
   311cc:	6a 00                	push   $0x0
   311ce:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   311d4:	50                   	push   %eax
   311d5:	e8 b8 2a 00 00       	call   33c92 <Memset>
   311da:	83 c4 10             	add    $0x10,%esp
   311dd:	8d 45 0c             	lea    0xc(%ebp),%eax
   311e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
   311e3:	8b 45 08             	mov    0x8(%ebp),%eax
   311e6:	83 ec 04             	sub    $0x4,%esp
   311e9:	ff 75 f4             	pushl  -0xc(%ebp)
   311ec:	50                   	push   %eax
   311ed:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   311f3:	50                   	push   %eax
   311f4:	e8 1e 00 00 00       	call   31217 <vsprintf>
   311f9:	83 c4 10             	add    $0x10,%esp
   311fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
   311ff:	83 ec 08             	sub    $0x8,%esp
   31202:	ff 75 f0             	pushl  -0x10(%ebp)
   31205:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   3120b:	50                   	push   %eax
   3120c:	e8 e7 14 00 00       	call   326f8 <write>
   31211:	83 c4 10             	add    $0x10,%esp
   31214:	90                   	nop
   31215:	c9                   	leave  
   31216:	c3                   	ret    

00031217 <vsprintf>:
   31217:	55                   	push   %ebp
   31218:	89 e5                	mov    %esp,%ebp
   3121a:	81 ec 68 02 00 00    	sub    $0x268,%esp
   31220:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   31226:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
   3122c:	83 ec 04             	sub    $0x4,%esp
   3122f:	6a 40                	push   $0x40
   31231:	6a 00                	push   $0x0
   31233:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   31239:	50                   	push   %eax
   3123a:	e8 53 2a 00 00       	call   33c92 <Memset>
   3123f:	83 c4 10             	add    $0x10,%esp
   31242:	8b 45 10             	mov    0x10(%ebp),%eax
   31245:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31248:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   3124f:	8b 45 08             	mov    0x8(%ebp),%eax
   31252:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31255:	e9 50 01 00 00       	jmp    313aa <vsprintf+0x193>
   3125a:	8b 45 0c             	mov    0xc(%ebp),%eax
   3125d:	0f b6 00             	movzbl (%eax),%eax
   31260:	3c 25                	cmp    $0x25,%al
   31262:	74 16                	je     3127a <vsprintf+0x63>
   31264:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31267:	8d 50 01             	lea    0x1(%eax),%edx
   3126a:	89 55 f4             	mov    %edx,-0xc(%ebp)
   3126d:	8b 55 0c             	mov    0xc(%ebp),%edx
   31270:	0f b6 12             	movzbl (%edx),%edx
   31273:	88 10                	mov    %dl,(%eax)
   31275:	e9 2c 01 00 00       	jmp    313a6 <vsprintf+0x18f>
   3127a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
   3127e:	8b 45 0c             	mov    0xc(%ebp),%eax
   31281:	0f b6 00             	movzbl (%eax),%eax
   31284:	0f be c0             	movsbl %al,%eax
   31287:	83 f8 64             	cmp    $0x64,%eax
   3128a:	74 26                	je     312b2 <vsprintf+0x9b>
   3128c:	83 f8 64             	cmp    $0x64,%eax
   3128f:	7f 0e                	jg     3129f <vsprintf+0x88>
   31291:	83 f8 63             	cmp    $0x63,%eax
   31294:	0f 84 ef 00 00 00    	je     31389 <vsprintf+0x172>
   3129a:	e9 07 01 00 00       	jmp    313a6 <vsprintf+0x18f>
   3129f:	83 f8 73             	cmp    $0x73,%eax
   312a2:	0f 84 b0 00 00 00    	je     31358 <vsprintf+0x141>
   312a8:	83 f8 78             	cmp    $0x78,%eax
   312ab:	74 5d                	je     3130a <vsprintf+0xf3>
   312ad:	e9 f4 00 00 00       	jmp    313a6 <vsprintf+0x18f>
   312b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
   312b5:	8b 00                	mov    (%eax),%eax
   312b7:	89 45 e8             	mov    %eax,-0x18(%ebp)
   312ba:	83 ec 04             	sub    $0x4,%esp
   312bd:	6a 0a                	push   $0xa
   312bf:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
   312c5:	50                   	push   %eax
   312c6:	ff 75 e8             	pushl  -0x18(%ebp)
   312c9:	e8 92 0a 00 00       	call   31d60 <itoa>
   312ce:	83 c4 10             	add    $0x10,%esp
   312d1:	83 ec 08             	sub    $0x8,%esp
   312d4:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   312da:	50                   	push   %eax
   312db:	ff 75 f4             	pushl  -0xc(%ebp)
   312de:	e8 ce 29 00 00       	call   33cb1 <Strcpy>
   312e3:	83 c4 10             	add    $0x10,%esp
   312e6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   312ea:	83 ec 0c             	sub    $0xc,%esp
   312ed:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   312f3:	50                   	push   %eax
   312f4:	e8 d2 29 00 00       	call   33ccb <Strlen>
   312f9:	83 c4 10             	add    $0x10,%esp
   312fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
   312ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31302:	01 45 f4             	add    %eax,-0xc(%ebp)
   31305:	e9 9c 00 00 00       	jmp    313a6 <vsprintf+0x18f>
   3130a:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3130d:	8b 00                	mov    (%eax),%eax
   3130f:	83 ec 08             	sub    $0x8,%esp
   31312:	50                   	push   %eax
   31313:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   31319:	50                   	push   %eax
   3131a:	e8 a1 f4 ff ff       	call   307c0 <atoi>
   3131f:	83 c4 10             	add    $0x10,%esp
   31322:	83 ec 08             	sub    $0x8,%esp
   31325:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   3132b:	50                   	push   %eax
   3132c:	ff 75 f4             	pushl  -0xc(%ebp)
   3132f:	e8 7d 29 00 00       	call   33cb1 <Strcpy>
   31334:	83 c4 10             	add    $0x10,%esp
   31337:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   3133b:	83 ec 0c             	sub    $0xc,%esp
   3133e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   31344:	50                   	push   %eax
   31345:	e8 81 29 00 00       	call   33ccb <Strlen>
   3134a:	83 c4 10             	add    $0x10,%esp
   3134d:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31350:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31353:	01 45 f4             	add    %eax,-0xc(%ebp)
   31356:	eb 4e                	jmp    313a6 <vsprintf+0x18f>
   31358:	83 ec 08             	sub    $0x8,%esp
   3135b:	ff 75 f0             	pushl  -0x10(%ebp)
   3135e:	ff 75 f4             	pushl  -0xc(%ebp)
   31361:	e8 4b 29 00 00       	call   33cb1 <Strcpy>
   31366:	83 c4 10             	add    $0x10,%esp
   31369:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3136c:	8b 00                	mov    (%eax),%eax
   3136e:	83 ec 0c             	sub    $0xc,%esp
   31371:	50                   	push   %eax
   31372:	e8 54 29 00 00       	call   33ccb <Strlen>
   31377:	83 c4 10             	add    $0x10,%esp
   3137a:	89 45 ec             	mov    %eax,-0x14(%ebp)
   3137d:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   31381:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31384:	01 45 f4             	add    %eax,-0xc(%ebp)
   31387:	eb 1d                	jmp    313a6 <vsprintf+0x18f>
   31389:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3138c:	0f b6 10             	movzbl (%eax),%edx
   3138f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31392:	88 10                	mov    %dl,(%eax)
   31394:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   31398:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
   3139f:	8b 45 ec             	mov    -0x14(%ebp),%eax
   313a2:	01 45 f4             	add    %eax,-0xc(%ebp)
   313a5:	90                   	nop
   313a6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
   313aa:	8b 45 0c             	mov    0xc(%ebp),%eax
   313ad:	0f b6 00             	movzbl (%eax),%eax
   313b0:	84 c0                	test   %al,%al
   313b2:	0f 85 a2 fe ff ff    	jne    3125a <vsprintf+0x43>
   313b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   313bb:	2b 45 08             	sub    0x8(%ebp),%eax
   313be:	c9                   	leave  
   313bf:	c3                   	ret    

000313c0 <printx>:
   313c0:	55                   	push   %ebp
   313c1:	89 e5                	mov    %esp,%ebp
   313c3:	81 ec 18 01 00 00    	sub    $0x118,%esp
   313c9:	8d 45 0c             	lea    0xc(%ebp),%eax
   313cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
   313cf:	8b 45 08             	mov    0x8(%ebp),%eax
   313d2:	83 ec 04             	sub    $0x4,%esp
   313d5:	ff 75 f4             	pushl  -0xc(%ebp)
   313d8:	50                   	push   %eax
   313d9:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   313df:	50                   	push   %eax
   313e0:	e8 32 fe ff ff       	call   31217 <vsprintf>
   313e5:	83 c4 10             	add    $0x10,%esp
   313e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
   313eb:	83 ec 08             	sub    $0x8,%esp
   313ee:	ff 75 f0             	pushl  -0x10(%ebp)
   313f1:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   313f7:	50                   	push   %eax
   313f8:	e8 0b 13 00 00       	call   32708 <write_debug>
   313fd:	83 c4 10             	add    $0x10,%esp
   31400:	90                   	nop
   31401:	c9                   	leave  
   31402:	c3                   	ret    

00031403 <sys_printx>:
   31403:	55                   	push   %ebp
   31404:	89 e5                	mov    %esp,%ebp
   31406:	83 ec 28             	sub    $0x28,%esp
   31409:	a1 94 6e 03 00       	mov    0x36e94,%eax
   3140e:	85 c0                	test   %eax,%eax
   31410:	75 20                	jne    31432 <sys_printx+0x2f>
   31412:	8b 45 10             	mov    0x10(%ebp),%eax
   31415:	8b 40 0c             	mov    0xc(%eax),%eax
   31418:	89 45 ec             	mov    %eax,-0x14(%ebp)
   3141b:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3141e:	83 ec 08             	sub    $0x8,%esp
   31421:	ff 75 10             	pushl  0x10(%ebp)
   31424:	50                   	push   %eax
   31425:	e8 3a 15 00 00       	call   32964 <Seg2PhyAddrLDT>
   3142a:	83 c4 10             	add    $0x10,%esp
   3142d:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31430:	eb 19                	jmp    3144b <sys_printx+0x48>
   31432:	a1 94 6e 03 00       	mov    0x36e94,%eax
   31437:	85 c0                	test   %eax,%eax
   31439:	74 10                	je     3144b <sys_printx+0x48>
   3143b:	83 ec 0c             	sub    $0xc,%esp
   3143e:	6a 30                	push   $0x30
   31440:	e8 de 14 00 00       	call   32923 <Seg2PhyAddr>
   31445:	83 c4 10             	add    $0x10,%esp
   31448:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3144b:	8b 55 08             	mov    0x8(%ebp),%edx
   3144e:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31451:	01 d0                	add    %edx,%eax
   31453:	89 45 e8             	mov    %eax,-0x18(%ebp)
   31456:	8b 45 10             	mov    0x10(%ebp),%eax
   31459:	8b 40 64             	mov    0x64(%eax),%eax
   3145c:	69 c0 90 0c 00 00    	imul   $0xc90,%eax,%eax
   31462:	05 00 76 03 00       	add    $0x37600,%eax
   31467:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   3146a:	8b 45 e8             	mov    -0x18(%ebp),%eax
   3146d:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31470:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31473:	0f b6 00             	movzbl (%eax),%eax
   31476:	88 45 e3             	mov    %al,-0x1d(%ebp)
   31479:	eb 3a                	jmp    314b5 <sys_printx+0xb2>
   3147b:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3147e:	0f b6 00             	movzbl (%eax),%eax
   31481:	3c 3b                	cmp    $0x3b,%al
   31483:	74 0a                	je     3148f <sys_printx+0x8c>
   31485:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31488:	0f b6 00             	movzbl (%eax),%eax
   3148b:	3c 3a                	cmp    $0x3a,%al
   3148d:	75 06                	jne    31495 <sys_printx+0x92>
   3148f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   31493:	eb 20                	jmp    314b5 <sys_printx+0xb2>
   31495:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31498:	0f b6 00             	movzbl (%eax),%eax
   3149b:	0f b6 c0             	movzbl %al,%eax
   3149e:	83 ec 08             	sub    $0x8,%esp
   314a1:	50                   	push   %eax
   314a2:	ff 75 e4             	pushl  -0x1c(%ebp)
   314a5:	e8 ba 19 00 00       	call   32e64 <out_char>
   314aa:	83 c4 10             	add    $0x10,%esp
   314ad:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   314b1:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
   314b5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   314b9:	7f c0                	jg     3147b <sys_printx+0x78>
   314bb:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
   314bf:	75 11                	jne    314d2 <sys_printx+0xcf>
   314c1:	a1 94 6e 03 00       	mov    0x36e94,%eax
   314c6:	85 c0                	test   %eax,%eax
   314c8:	74 15                	je     314df <sys_printx+0xdc>
   314ca:	e8 2d f2 ff ff       	call   306fc <disable_int>
   314cf:	f4                   	hlt    
   314d0:	eb 0d                	jmp    314df <sys_printx+0xdc>
   314d2:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
   314d6:	75 07                	jne    314df <sys_printx+0xdc>
   314d8:	e8 1f f2 ff ff       	call   306fc <disable_int>
   314dd:	f4                   	hlt    
   314de:	90                   	nop
   314df:	90                   	nop
   314e0:	c9                   	leave  
   314e1:	c3                   	ret    

000314e2 <spin>:
   314e2:	55                   	push   %ebp
   314e3:	89 e5                	mov    %esp,%ebp
   314e5:	eb fe                	jmp    314e5 <spin+0x3>

000314e7 <panic>:
   314e7:	55                   	push   %ebp
   314e8:	89 e5                	mov    %esp,%ebp
   314ea:	83 ec 08             	sub    $0x8,%esp
   314ed:	83 ec 04             	sub    $0x4,%esp
   314f0:	ff 75 08             	pushl  0x8(%ebp)
   314f3:	6a 3a                	push   $0x3a
   314f5:	68 80 39 03 00       	push   $0x33980
   314fa:	e8 c1 fe ff ff       	call   313c0 <printx>
   314ff:	83 c4 10             	add    $0x10,%esp
   31502:	90                   	nop
   31503:	c9                   	leave  
   31504:	c3                   	ret    

00031505 <assertion_failure>:
   31505:	55                   	push   %ebp
   31506:	89 e5                	mov    %esp,%ebp
   31508:	83 ec 08             	sub    $0x8,%esp
   3150b:	83 ec 08             	sub    $0x8,%esp
   3150e:	68 08 21 00 00       	push   $0x2108
   31513:	ff 75 10             	pushl  0x10(%ebp)
   31516:	ff 75 0c             	pushl  0xc(%ebp)
   31519:	ff 75 08             	pushl  0x8(%ebp)
   3151c:	6a 3b                	push   $0x3b
   3151e:	68 88 39 03 00       	push   $0x33988
   31523:	e8 98 fe ff ff       	call   313c0 <printx>
   31528:	83 c4 20             	add    $0x20,%esp
   3152b:	83 ec 0c             	sub    $0xc,%esp
   3152e:	68 bb 39 03 00       	push   $0x339bb
   31533:	e8 aa ff ff ff       	call   314e2 <spin>
   31538:	83 c4 10             	add    $0x10,%esp
   3153b:	90                   	nop
   3153c:	c9                   	leave  
   3153d:	c3                   	ret    

0003153e <dead_lock>:
   3153e:	55                   	push   %ebp
   3153f:	89 e5                	mov    %esp,%ebp
   31541:	83 ec 18             	sub    $0x18,%esp
   31544:	83 ec 0c             	sub    $0xc,%esp
   31547:	ff 75 08             	pushl  0x8(%ebp)
   3154a:	e8 28 13 00 00       	call   32877 <pid2proc>
   3154f:	83 c4 10             	add    $0x10,%esp
   31552:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31555:	83 ec 0c             	sub    $0xc,%esp
   31558:	ff 75 0c             	pushl  0xc(%ebp)
   3155b:	e8 17 13 00 00       	call   32877 <pid2proc>
   31560:	83 c4 10             	add    $0x10,%esp
   31563:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31566:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31569:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   3156d:	3c 01                	cmp    $0x1,%al
   3156f:	75 5a                	jne    315cb <dead_lock+0x8d>
   31571:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31574:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   3157a:	39 45 08             	cmp    %eax,0x8(%ebp)
   3157d:	75 32                	jne    315b1 <dead_lock+0x73>
   3157f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31582:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31585:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31588:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   3158e:	83 ec 0c             	sub    $0xc,%esp
   31591:	50                   	push   %eax
   31592:	e8 e0 12 00 00       	call   32877 <pid2proc>
   31597:	83 c4 10             	add    $0x10,%esp
   3159a:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3159d:	8b 45 f0             	mov    -0x10(%ebp),%eax
   315a0:	8b 50 58             	mov    0x58(%eax),%edx
   315a3:	8b 45 08             	mov    0x8(%ebp),%eax
   315a6:	39 c2                	cmp    %eax,%edx
   315a8:	75 db                	jne    31585 <dead_lock+0x47>
   315aa:	b8 01 00 00 00       	mov    $0x1,%eax
   315af:	eb 20                	jmp    315d1 <dead_lock+0x93>
   315b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
   315b4:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   315ba:	83 ec 0c             	sub    $0xc,%esp
   315bd:	50                   	push   %eax
   315be:	e8 b4 12 00 00       	call   32877 <pid2proc>
   315c3:	83 c4 10             	add    $0x10,%esp
   315c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   315c9:	eb 9b                	jmp    31566 <dead_lock+0x28>
   315cb:	90                   	nop
   315cc:	b8 00 00 00 00       	mov    $0x0,%eax
   315d1:	c9                   	leave  
   315d2:	c3                   	ret    

000315d3 <sys_send_msg>:
   315d3:	55                   	push   %ebp
   315d4:	89 e5                	mov    %esp,%ebp
   315d6:	83 ec 38             	sub    $0x38,%esp
   315d9:	83 ec 0c             	sub    $0xc,%esp
   315dc:	ff 75 0c             	pushl  0xc(%ebp)
   315df:	e8 93 12 00 00       	call   32877 <pid2proc>
   315e4:	83 c4 10             	add    $0x10,%esp
   315e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
   315ea:	83 ec 0c             	sub    $0xc,%esp
   315ed:	ff 75 10             	pushl  0x10(%ebp)
   315f0:	e8 a2 12 00 00       	call   32897 <proc2pid>
   315f5:	83 c4 10             	add    $0x10,%esp
   315f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
   315fb:	8b 45 08             	mov    0x8(%ebp),%eax
   315fe:	8b 55 e8             	mov    -0x18(%ebp),%edx
   31601:	89 10                	mov    %edx,(%eax)
   31603:	83 ec 08             	sub    $0x8,%esp
   31606:	ff 75 0c             	pushl  0xc(%ebp)
   31609:	ff 75 e8             	pushl  -0x18(%ebp)
   3160c:	e8 2d ff ff ff       	call   3153e <dead_lock>
   31611:	83 c4 10             	add    $0x10,%esp
   31614:	83 f8 01             	cmp    $0x1,%eax
   31617:	75 10                	jne    31629 <sys_send_msg+0x56>
   31619:	83 ec 0c             	sub    $0xc,%esp
   3161c:	68 c7 39 03 00       	push   $0x339c7
   31621:	e8 c1 fe ff ff       	call   314e7 <panic>
   31626:	83 c4 10             	add    $0x10,%esp
   31629:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3162c:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31630:	3c 02                	cmp    $0x2,%al
   31632:	0f 85 94 01 00 00    	jne    317cc <sys_send_msg+0x1f9>
   31638:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3163b:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   31641:	39 45 e8             	cmp    %eax,-0x18(%ebp)
   31644:	74 12                	je     31658 <sys_send_msg+0x85>
   31646:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31649:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   3164f:	83 f8 11             	cmp    $0x11,%eax
   31652:	0f 85 74 01 00 00    	jne    317cc <sys_send_msg+0x1f9>
   31658:	8b 45 10             	mov    0x10(%ebp),%eax
   3165b:	8b 40 0c             	mov    0xc(%eax),%eax
   3165e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   31661:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31664:	83 ec 08             	sub    $0x8,%esp
   31667:	ff 75 10             	pushl  0x10(%ebp)
   3166a:	50                   	push   %eax
   3166b:	e8 f4 12 00 00       	call   32964 <Seg2PhyAddrLDT>
   31670:	83 c4 10             	add    $0x10,%esp
   31673:	89 45 e0             	mov    %eax,-0x20(%ebp)
   31676:	8b 55 e0             	mov    -0x20(%ebp),%edx
   31679:	89 d0                	mov    %edx,%eax
   3167b:	01 c0                	add    %eax,%eax
   3167d:	01 d0                	add    %edx,%eax
   3167f:	c1 e0 02             	shl    $0x2,%eax
   31682:	89 c2                	mov    %eax,%edx
   31684:	8b 45 08             	mov    0x8(%ebp),%eax
   31687:	01 d0                	add    %edx,%eax
   31689:	89 45 dc             	mov    %eax,-0x24(%ebp)
   3168c:	c7 45 d8 0c 00 00 00 	movl   $0xc,-0x28(%ebp)
   31693:	8b 55 dc             	mov    -0x24(%ebp),%edx
   31696:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31699:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   3169f:	83 ec 04             	sub    $0x4,%esp
   316a2:	ff 75 d8             	pushl  -0x28(%ebp)
   316a5:	52                   	push   %edx
   316a6:	50                   	push   %eax
   316a7:	e8 b8 25 00 00       	call   33c64 <Memcpy>
   316ac:	83 c4 10             	add    $0x10,%esp
   316af:	8b 45 10             	mov    0x10(%ebp),%eax
   316b2:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   316b9:	00 00 00 
   316bc:	8b 45 10             	mov    0x10(%ebp),%eax
   316bf:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
   316c6:	00 00 00 
   316c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
   316cc:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   316d3:	00 00 00 
   316d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
   316d9:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
   316dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
   316e0:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
   316e7:	00 00 00 
   316ea:	83 ec 0c             	sub    $0xc,%esp
   316ed:	ff 75 ec             	pushl  -0x14(%ebp)
   316f0:	e8 20 06 00 00       	call   31d15 <unblock>
   316f5:	83 c4 10             	add    $0x10,%esp
   316f8:	8b 45 10             	mov    0x10(%ebp),%eax
   316fb:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31701:	85 c0                	test   %eax,%eax
   31703:	74 1c                	je     31721 <sys_send_msg+0x14e>
   31705:	68 f9 02 00 00       	push   $0x2f9
   3170a:	68 5d 39 03 00       	push   $0x3395d
   3170f:	68 5d 39 03 00       	push   $0x3395d
   31714:	68 d2 39 03 00       	push   $0x339d2
   31719:	e8 e7 fd ff ff       	call   31505 <assertion_failure>
   3171e:	83 c4 10             	add    $0x10,%esp
   31721:	8b 45 10             	mov    0x10(%ebp),%eax
   31724:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   3172a:	85 c0                	test   %eax,%eax
   3172c:	74 1c                	je     3174a <sys_send_msg+0x177>
   3172e:	68 fa 02 00 00       	push   $0x2fa
   31733:	68 5d 39 03 00       	push   $0x3395d
   31738:	68 5d 39 03 00       	push   $0x3395d
   3173d:	68 e5 39 03 00       	push   $0x339e5
   31742:	e8 be fd ff ff       	call   31505 <assertion_failure>
   31747:	83 c4 10             	add    $0x10,%esp
   3174a:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3174d:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31753:	85 c0                	test   %eax,%eax
   31755:	74 1c                	je     31773 <sys_send_msg+0x1a0>
   31757:	68 fb 02 00 00       	push   $0x2fb
   3175c:	68 5d 39 03 00       	push   $0x3395d
   31761:	68 5d 39 03 00       	push   $0x3395d
   31766:	68 fc 39 03 00       	push   $0x339fc
   3176b:	e8 95 fd ff ff       	call   31505 <assertion_failure>
   31770:	83 c4 10             	add    $0x10,%esp
   31773:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31776:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   3177a:	84 c0                	test   %al,%al
   3177c:	74 1c                	je     3179a <sys_send_msg+0x1c7>
   3177e:	68 fc 02 00 00       	push   $0x2fc
   31783:	68 5d 39 03 00       	push   $0x3395d
   31788:	68 5d 39 03 00       	push   $0x3395d
   3178d:	68 11 3a 03 00       	push   $0x33a11
   31792:	e8 6e fd ff ff       	call   31505 <assertion_failure>
   31797:	83 c4 10             	add    $0x10,%esp
   3179a:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3179d:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   317a3:	85 c0                	test   %eax,%eax
   317a5:	0f 84 63 01 00 00    	je     3190e <sys_send_msg+0x33b>
   317ab:	68 fd 02 00 00       	push   $0x2fd
   317b0:	68 5d 39 03 00       	push   $0x3395d
   317b5:	68 5d 39 03 00       	push   $0x3395d
   317ba:	68 27 3a 03 00       	push   $0x33a27
   317bf:	e8 41 fd ff ff       	call   31505 <assertion_failure>
   317c4:	83 c4 10             	add    $0x10,%esp
   317c7:	e9 42 01 00 00       	jmp    3190e <sys_send_msg+0x33b>
   317cc:	8b 45 10             	mov    0x10(%ebp),%eax
   317cf:	8b 55 08             	mov    0x8(%ebp),%edx
   317d2:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
   317d8:	8b 45 10             	mov    0x10(%ebp),%eax
   317db:	8b 55 0c             	mov    0xc(%ebp),%edx
   317de:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
   317e4:	8b 45 10             	mov    0x10(%ebp),%eax
   317e7:	c6 40 7c 01          	movb   $0x1,0x7c(%eax)
   317eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
   317ee:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   317f4:	85 c0                	test   %eax,%eax
   317f6:	75 1b                	jne    31813 <sys_send_msg+0x240>
   317f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
   317fb:	89 45 d0             	mov    %eax,-0x30(%ebp)
   317fe:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
   31805:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31808:	8d 55 d0             	lea    -0x30(%ebp),%edx
   3180b:	89 90 8c 00 00 00    	mov    %edx,0x8c(%eax)
   31811:	eb 47                	jmp    3185a <sys_send_msg+0x287>
   31813:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31816:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   3181c:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3181f:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31822:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   31828:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3182b:	eb 0f                	jmp    3183c <sys_send_msg+0x269>
   3182d:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31830:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31833:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31836:	8b 40 04             	mov    0x4(%eax),%eax
   31839:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3183c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31840:	75 eb                	jne    3182d <sys_send_msg+0x25a>
   31842:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31845:	8b 40 04             	mov    0x4(%eax),%eax
   31848:	8b 55 e8             	mov    -0x18(%ebp),%edx
   3184b:	89 10                	mov    %edx,(%eax)
   3184d:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31850:	8b 40 04             	mov    0x4(%eax),%eax
   31853:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   3185a:	8b 45 10             	mov    0x10(%ebp),%eax
   3185d:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31861:	3c 01                	cmp    $0x1,%al
   31863:	74 1c                	je     31881 <sys_send_msg+0x2ae>
   31865:	68 2b 03 00 00       	push   $0x32b
   3186a:	68 5d 39 03 00       	push   $0x3395d
   3186f:	68 5d 39 03 00       	push   $0x3395d
   31874:	68 45 3a 03 00       	push   $0x33a45
   31879:	e8 87 fc ff ff       	call   31505 <assertion_failure>
   3187e:	83 c4 10             	add    $0x10,%esp
   31881:	8b 45 10             	mov    0x10(%ebp),%eax
   31884:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   3188a:	39 45 0c             	cmp    %eax,0xc(%ebp)
   3188d:	74 1c                	je     318ab <sys_send_msg+0x2d8>
   3188f:	68 2c 03 00 00       	push   $0x32c
   31894:	68 5d 39 03 00       	push   $0x3395d
   31899:	68 5d 39 03 00       	push   $0x3395d
   3189e:	68 60 3a 03 00       	push   $0x33a60
   318a3:	e8 5d fc ff ff       	call   31505 <assertion_failure>
   318a8:	83 c4 10             	add    $0x10,%esp
   318ab:	8b 45 10             	mov    0x10(%ebp),%eax
   318ae:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   318b4:	39 45 08             	cmp    %eax,0x8(%ebp)
   318b7:	74 1c                	je     318d5 <sys_send_msg+0x302>
   318b9:	68 2d 03 00 00       	push   $0x32d
   318be:	68 5d 39 03 00       	push   $0x3395d
   318c3:	68 5d 39 03 00       	push   $0x3395d
   318c8:	68 82 3a 03 00       	push   $0x33a82
   318cd:	e8 33 fc ff ff       	call   31505 <assertion_failure>
   318d2:	83 c4 10             	add    $0x10,%esp
   318d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
   318d8:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   318de:	85 c0                	test   %eax,%eax
   318e0:	75 1c                	jne    318fe <sys_send_msg+0x32b>
   318e2:	68 2f 03 00 00       	push   $0x32f
   318e7:	68 5d 39 03 00       	push   $0x3395d
   318ec:	68 5d 39 03 00       	push   $0x3395d
   318f1:	68 97 3a 03 00       	push   $0x33a97
   318f6:	e8 0a fc ff ff       	call   31505 <assertion_failure>
   318fb:	83 c4 10             	add    $0x10,%esp
   318fe:	83 ec 0c             	sub    $0xc,%esp
   31901:	ff 75 10             	pushl  0x10(%ebp)
   31904:	e8 fa 03 00 00       	call   31d03 <block>
   31909:	83 c4 10             	add    $0x10,%esp
   3190c:	eb 01                	jmp    3190f <sys_send_msg+0x33c>
   3190e:	90                   	nop
   3190f:	b8 00 00 00 00       	mov    $0x0,%eax
   31914:	c9                   	leave  
   31915:	c3                   	ret    

00031916 <sys_receive_msg>:
   31916:	55                   	push   %ebp
   31917:	89 e5                	mov    %esp,%ebp
   31919:	83 ec 38             	sub    $0x38,%esp
   3191c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31923:	83 ec 0c             	sub    $0xc,%esp
   31926:	ff 75 0c             	pushl  0xc(%ebp)
   31929:	e8 49 0f 00 00       	call   32877 <pid2proc>
   3192e:	83 c4 10             	add    $0x10,%esp
   31931:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   31934:	83 ec 0c             	sub    $0xc,%esp
   31937:	ff 75 10             	pushl  0x10(%ebp)
   3193a:	e8 58 0f 00 00       	call   32897 <proc2pid>
   3193f:	83 c4 10             	add    $0x10,%esp
   31942:	89 45 e0             	mov    %eax,-0x20(%ebp)
   31945:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
   31949:	75 40                	jne    3198b <sys_receive_msg+0x75>
   3194b:	8b 45 10             	mov    0x10(%ebp),%eax
   3194e:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   31954:	85 c0                	test   %eax,%eax
   31956:	0f 84 c6 00 00 00    	je     31a22 <sys_receive_msg+0x10c>
   3195c:	8b 45 10             	mov    0x10(%ebp),%eax
   3195f:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   31965:	8b 00                	mov    (%eax),%eax
   31967:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3196a:	8b 45 10             	mov    0x10(%ebp),%eax
   3196d:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   31973:	8b 50 04             	mov    0x4(%eax),%edx
   31976:	8b 45 10             	mov    0x10(%ebp),%eax
   31979:	89 90 8c 00 00 00    	mov    %edx,0x8c(%eax)
   3197f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
   31986:	e9 97 00 00 00       	jmp    31a22 <sys_receive_msg+0x10c>
   3198b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   3198f:	0f 88 8d 00 00 00    	js     31a22 <sys_receive_msg+0x10c>
   31995:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
   31999:	0f 8f 83 00 00 00    	jg     31a22 <sys_receive_msg+0x10c>
   3199f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   319a2:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   319a6:	3c 01                	cmp    $0x1,%al
   319a8:	75 78                	jne    31a22 <sys_receive_msg+0x10c>
   319aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   319ad:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   319b3:	83 f8 11             	cmp    $0x11,%eax
   319b6:	74 0e                	je     319c6 <sys_receive_msg+0xb0>
   319b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   319bb:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   319c1:	39 45 e0             	cmp    %eax,-0x20(%ebp)
   319c4:	75 5c                	jne    31a22 <sys_receive_msg+0x10c>
   319c6:	8b 45 10             	mov    0x10(%ebp),%eax
   319c9:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   319cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
   319d2:	8b 45 10             	mov    0x10(%ebp),%eax
   319d5:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   319db:	89 45 e8             	mov    %eax,-0x18(%ebp)
   319de:	eb 24                	jmp    31a04 <sys_receive_msg+0xee>
   319e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
   319e3:	8b 10                	mov    (%eax),%edx
   319e5:	8b 45 0c             	mov    0xc(%ebp),%eax
   319e8:	39 c2                	cmp    %eax,%edx
   319ea:	75 09                	jne    319f5 <sys_receive_msg+0xdf>
   319ec:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
   319f3:	eb 15                	jmp    31a0a <sys_receive_msg+0xf4>
   319f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
   319f8:	89 45 e8             	mov    %eax,-0x18(%ebp)
   319fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
   319fe:	8b 40 04             	mov    0x4(%eax),%eax
   31a01:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31a04:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   31a08:	75 d6                	jne    319e0 <sys_receive_msg+0xca>
   31a0a:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   31a0e:	75 12                	jne    31a22 <sys_receive_msg+0x10c>
   31a10:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31a13:	8b 50 04             	mov    0x4(%eax),%edx
   31a16:	8b 45 e8             	mov    -0x18(%ebp),%eax
   31a19:	89 50 04             	mov    %edx,0x4(%eax)
   31a1c:	8b 45 0c             	mov    0xc(%ebp),%eax
   31a1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31a22:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   31a26:	0f 85 85 01 00 00    	jne    31bb1 <sys_receive_msg+0x29b>
   31a2c:	83 ec 0c             	sub    $0xc,%esp
   31a2f:	ff 75 f0             	pushl  -0x10(%ebp)
   31a32:	e8 40 0e 00 00       	call   32877 <pid2proc>
   31a37:	83 c4 10             	add    $0x10,%esp
   31a3a:	89 45 dc             	mov    %eax,-0x24(%ebp)
   31a3d:	8b 45 10             	mov    0x10(%ebp),%eax
   31a40:	8b 40 0c             	mov    0xc(%eax),%eax
   31a43:	89 45 d8             	mov    %eax,-0x28(%ebp)
   31a46:	8b 45 d8             	mov    -0x28(%ebp),%eax
   31a49:	83 ec 08             	sub    $0x8,%esp
   31a4c:	ff 75 10             	pushl  0x10(%ebp)
   31a4f:	50                   	push   %eax
   31a50:	e8 0f 0f 00 00       	call   32964 <Seg2PhyAddrLDT>
   31a55:	83 c4 10             	add    $0x10,%esp
   31a58:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   31a5b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
   31a5e:	89 d0                	mov    %edx,%eax
   31a60:	01 c0                	add    %eax,%eax
   31a62:	01 d0                	add    %edx,%eax
   31a64:	c1 e0 02             	shl    $0x2,%eax
   31a67:	89 c2                	mov    %eax,%edx
   31a69:	8b 45 08             	mov    0x8(%ebp),%eax
   31a6c:	01 d0                	add    %edx,%eax
   31a6e:	89 45 d0             	mov    %eax,-0x30(%ebp)
   31a71:	c7 45 cc 0c 00 00 00 	movl   $0xc,-0x34(%ebp)
   31a78:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31a7b:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
   31a81:	8b 45 d0             	mov    -0x30(%ebp),%eax
   31a84:	83 ec 04             	sub    $0x4,%esp
   31a87:	ff 75 cc             	pushl  -0x34(%ebp)
   31a8a:	52                   	push   %edx
   31a8b:	50                   	push   %eax
   31a8c:	e8 d3 21 00 00       	call   33c64 <Memcpy>
   31a91:	83 c4 10             	add    $0x10,%esp
   31a94:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31a97:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   31a9e:	00 00 00 
   31aa1:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31aa4:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
   31aa8:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31aab:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
   31ab2:	00 00 00 
   31ab5:	8b 45 10             	mov    0x10(%ebp),%eax
   31ab8:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   31abf:	00 00 00 
   31ac2:	8b 45 10             	mov    0x10(%ebp),%eax
   31ac5:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
   31acc:	00 00 00 
   31acf:	83 ec 0c             	sub    $0xc,%esp
   31ad2:	ff 75 dc             	pushl  -0x24(%ebp)
   31ad5:	e8 3b 02 00 00       	call   31d15 <unblock>
   31ada:	83 c4 10             	add    $0x10,%esp
   31add:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31ae0:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31ae6:	85 c0                	test   %eax,%eax
   31ae8:	74 1c                	je     31b06 <sys_receive_msg+0x1f0>
   31aea:	68 85 03 00 00       	push   $0x385
   31aef:	68 5d 39 03 00       	push   $0x3395d
   31af4:	68 5d 39 03 00       	push   $0x3395d
   31af9:	68 af 3a 03 00       	push   $0x33aaf
   31afe:	e8 02 fa ff ff       	call   31505 <assertion_failure>
   31b03:	83 c4 10             	add    $0x10,%esp
   31b06:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31b09:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31b0d:	84 c0                	test   %al,%al
   31b0f:	74 1c                	je     31b2d <sys_receive_msg+0x217>
   31b11:	68 86 03 00 00       	push   $0x386
   31b16:	68 5d 39 03 00       	push   $0x3395d
   31b1b:	68 5d 39 03 00       	push   $0x3395d
   31b20:	68 c8 3a 03 00       	push   $0x33ac8
   31b25:	e8 db f9 ff ff       	call   31505 <assertion_failure>
   31b2a:	83 c4 10             	add    $0x10,%esp
   31b2d:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31b30:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   31b36:	85 c0                	test   %eax,%eax
   31b38:	74 1c                	je     31b56 <sys_receive_msg+0x240>
   31b3a:	68 87 03 00 00       	push   $0x387
   31b3f:	68 5d 39 03 00       	push   $0x3395d
   31b44:	68 5d 39 03 00       	push   $0x3395d
   31b49:	68 e7 3a 03 00       	push   $0x33ae7
   31b4e:	e8 b2 f9 ff ff       	call   31505 <assertion_failure>
   31b53:	83 c4 10             	add    $0x10,%esp
   31b56:	8b 45 10             	mov    0x10(%ebp),%eax
   31b59:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31b5f:	85 c0                	test   %eax,%eax
   31b61:	74 1c                	je     31b7f <sys_receive_msg+0x269>
   31b63:	68 89 03 00 00       	push   $0x389
   31b68:	68 5d 39 03 00       	push   $0x3395d
   31b6d:	68 5d 39 03 00       	push   $0x3395d
   31b72:	68 fc 39 03 00       	push   $0x339fc
   31b77:	e8 89 f9 ff ff       	call   31505 <assertion_failure>
   31b7c:	83 c4 10             	add    $0x10,%esp
   31b7f:	8b 45 10             	mov    0x10(%ebp),%eax
   31b82:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   31b88:	85 c0                	test   %eax,%eax
   31b8a:	0f 84 b4 00 00 00    	je     31c44 <sys_receive_msg+0x32e>
   31b90:	68 8a 03 00 00       	push   $0x38a
   31b95:	68 5d 39 03 00       	push   $0x3395d
   31b9a:	68 5d 39 03 00       	push   $0x3395d
   31b9f:	68 27 3a 03 00       	push   $0x33a27
   31ba4:	e8 5c f9 ff ff       	call   31505 <assertion_failure>
   31ba9:	83 c4 10             	add    $0x10,%esp
   31bac:	e9 93 00 00 00       	jmp    31c44 <sys_receive_msg+0x32e>
   31bb1:	8b 45 10             	mov    0x10(%ebp),%eax
   31bb4:	c6 40 7c 02          	movb   $0x2,0x7c(%eax)
   31bb8:	8b 45 10             	mov    0x10(%ebp),%eax
   31bbb:	8b 55 08             	mov    0x8(%ebp),%edx
   31bbe:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
   31bc4:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
   31bc8:	75 0f                	jne    31bd9 <sys_receive_msg+0x2c3>
   31bca:	8b 45 10             	mov    0x10(%ebp),%eax
   31bcd:	c7 80 88 00 00 00 11 	movl   $0x11,0x88(%eax)
   31bd4:	00 00 00 
   31bd7:	eb 0c                	jmp    31be5 <sys_receive_msg+0x2cf>
   31bd9:	8b 45 10             	mov    0x10(%ebp),%eax
   31bdc:	8b 55 0c             	mov    0xc(%ebp),%edx
   31bdf:	89 90 88 00 00 00    	mov    %edx,0x88(%eax)
   31be5:	8b 45 10             	mov    0x10(%ebp),%eax
   31be8:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31bec:	3c 02                	cmp    $0x2,%al
   31bee:	74 1c                	je     31c0c <sys_receive_msg+0x2f6>
   31bf0:	68 97 03 00 00       	push   $0x397
   31bf5:	68 5d 39 03 00       	push   $0x3395d
   31bfa:	68 5d 39 03 00       	push   $0x3395d
   31bff:	68 03 3b 03 00       	push   $0x33b03
   31c04:	e8 fc f8 ff ff       	call   31505 <assertion_failure>
   31c09:	83 c4 10             	add    $0x10,%esp
   31c0c:	8b 45 10             	mov    0x10(%ebp),%eax
   31c0f:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31c15:	39 45 08             	cmp    %eax,0x8(%ebp)
   31c18:	74 1c                	je     31c36 <sys_receive_msg+0x320>
   31c1a:	68 98 03 00 00       	push   $0x398
   31c1f:	68 5d 39 03 00       	push   $0x3395d
   31c24:	68 5d 39 03 00       	push   $0x3395d
   31c29:	68 21 3b 03 00       	push   $0x33b21
   31c2e:	e8 d2 f8 ff ff       	call   31505 <assertion_failure>
   31c33:	83 c4 10             	add    $0x10,%esp
   31c36:	83 ec 0c             	sub    $0xc,%esp
   31c39:	ff 75 10             	pushl  0x10(%ebp)
   31c3c:	e8 c2 00 00 00       	call   31d03 <block>
   31c41:	83 c4 10             	add    $0x10,%esp
   31c44:	b8 00 00 00 00       	mov    $0x0,%eax
   31c49:	c9                   	leave  
   31c4a:	c3                   	ret    

00031c4b <send_rec>:
   31c4b:	55                   	push   %ebp
   31c4c:	89 e5                	mov    %esp,%ebp
   31c4e:	83 ec 18             	sub    $0x18,%esp
   31c51:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
   31c55:	74 26                	je     31c7d <send_rec+0x32>
   31c57:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   31c5b:	74 36                	je     31c93 <send_rec+0x48>
   31c5d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   31c61:	0f 85 82 00 00 00    	jne    31ce9 <send_rec+0x9e>
   31c67:	83 ec 08             	sub    $0x8,%esp
   31c6a:	ff 75 10             	pushl  0x10(%ebp)
   31c6d:	ff 75 0c             	pushl  0xc(%ebp)
   31c70:	e8 a3 0a 00 00       	call   32718 <send_msg>
   31c75:	83 c4 10             	add    $0x10,%esp
   31c78:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31c7b:	eb 7f                	jmp    31cfc <send_rec+0xb1>
   31c7d:	83 ec 08             	sub    $0x8,%esp
   31c80:	ff 75 10             	pushl  0x10(%ebp)
   31c83:	ff 75 0c             	pushl  0xc(%ebp)
   31c86:	e8 9d 0a 00 00       	call   32728 <receive_msg>
   31c8b:	83 c4 10             	add    $0x10,%esp
   31c8e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31c91:	eb 69                	jmp    31cfc <send_rec+0xb1>
   31c93:	83 ec 08             	sub    $0x8,%esp
   31c96:	ff 75 10             	pushl  0x10(%ebp)
   31c99:	ff 75 0c             	pushl  0xc(%ebp)
   31c9c:	e8 77 0a 00 00       	call   32718 <send_msg>
   31ca1:	83 c4 10             	add    $0x10,%esp
   31ca4:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31ca7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31cab:	75 4e                	jne    31cfb <send_rec+0xb0>
   31cad:	83 ec 08             	sub    $0x8,%esp
   31cb0:	ff 75 10             	pushl  0x10(%ebp)
   31cb3:	ff 75 0c             	pushl  0xc(%ebp)
   31cb6:	e8 6d 0a 00 00       	call   32728 <receive_msg>
   31cbb:	83 c4 10             	add    $0x10,%esp
   31cbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31cc1:	8b 45 0c             	mov    0xc(%ebp),%eax
   31cc4:	8b 40 08             	mov    0x8(%eax),%eax
   31cc7:	85 c0                	test   %eax,%eax
   31cc9:	75 30                	jne    31cfb <send_rec+0xb0>
   31ccb:	68 c1 03 00 00       	push   $0x3c1
   31cd0:	68 5d 39 03 00       	push   $0x3395d
   31cd5:	68 5d 39 03 00       	push   $0x3395d
   31cda:	68 38 3b 03 00       	push   $0x33b38
   31cdf:	e8 21 f8 ff ff       	call   31505 <assertion_failure>
   31ce4:	83 c4 10             	add    $0x10,%esp
   31ce7:	eb 12                	jmp    31cfb <send_rec+0xb0>
   31ce9:	83 ec 0c             	sub    $0xc,%esp
   31cec:	68 46 3b 03 00       	push   $0x33b46
   31cf1:	e8 f1 f7 ff ff       	call   314e7 <panic>
   31cf6:	83 c4 10             	add    $0x10,%esp
   31cf9:	eb 01                	jmp    31cfc <send_rec+0xb1>
   31cfb:	90                   	nop
   31cfc:	b8 00 00 00 00       	mov    $0x0,%eax
   31d01:	c9                   	leave  
   31d02:	c3                   	ret    

00031d03 <block>:
   31d03:	55                   	push   %ebp
   31d04:	89 e5                	mov    %esp,%ebp
   31d06:	83 ec 08             	sub    $0x8,%esp
   31d09:	e8 8d 0a 00 00       	call   3279b <schedule_process>
   31d0e:	b8 00 00 00 00       	mov    $0x0,%eax
   31d13:	c9                   	leave  
   31d14:	c3                   	ret    

00031d15 <unblock>:
   31d15:	55                   	push   %ebp
   31d16:	89 e5                	mov    %esp,%ebp
   31d18:	b8 00 00 00 00       	mov    $0x0,%eax
   31d1d:	5d                   	pop    %ebp
   31d1e:	c3                   	ret    

00031d1f <get_ticks_ipc>:
   31d1f:	55                   	push   %ebp
   31d20:	89 e5                	mov    %esp,%ebp
   31d22:	83 ec 28             	sub    $0x28,%esp
   31d25:	83 ec 04             	sub    $0x4,%esp
   31d28:	6a 0c                	push   $0xc
   31d2a:	6a 00                	push   $0x0
   31d2c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   31d2f:	50                   	push   %eax
   31d30:	e8 5d 1f 00 00       	call   33c92 <Memset>
   31d35:	83 c4 10             	add    $0x10,%esp
   31d38:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
   31d3f:	83 ec 04             	sub    $0x4,%esp
   31d42:	6a 01                	push   $0x1
   31d44:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   31d47:	50                   	push   %eax
   31d48:	6a 03                	push   $0x3
   31d4a:	e8 fc fe ff ff       	call   31c4b <send_rec>
   31d4f:	83 c4 10             	add    $0x10,%esp
   31d52:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31d55:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31d58:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31d5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31d5e:	c9                   	leave  
   31d5f:	c3                   	ret    

00031d60 <itoa>:
   31d60:	55                   	push   %ebp
   31d61:	89 e5                	mov    %esp,%ebp
   31d63:	53                   	push   %ebx
   31d64:	83 ec 14             	sub    $0x14,%esp
   31d67:	8b 45 08             	mov    0x8(%ebp),%eax
   31d6a:	99                   	cltd   
   31d6b:	f7 7d 10             	idivl  0x10(%ebp)
   31d6e:	89 55 f4             	mov    %edx,-0xc(%ebp)
   31d71:	8b 45 08             	mov    0x8(%ebp),%eax
   31d74:	99                   	cltd   
   31d75:	f7 7d 10             	idivl  0x10(%ebp)
   31d78:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31d7b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   31d7f:	74 14                	je     31d95 <itoa+0x35>
   31d81:	83 ec 04             	sub    $0x4,%esp
   31d84:	ff 75 10             	pushl  0x10(%ebp)
   31d87:	ff 75 0c             	pushl  0xc(%ebp)
   31d8a:	ff 75 f0             	pushl  -0x10(%ebp)
   31d8d:	e8 ce ff ff ff       	call   31d60 <itoa>
   31d92:	83 c4 10             	add    $0x10,%esp
   31d95:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31d98:	8d 58 30             	lea    0x30(%eax),%ebx
   31d9b:	8b 45 0c             	mov    0xc(%ebp),%eax
   31d9e:	8b 00                	mov    (%eax),%eax
   31da0:	8d 48 01             	lea    0x1(%eax),%ecx
   31da3:	8b 55 0c             	mov    0xc(%ebp),%edx
   31da6:	89 0a                	mov    %ecx,(%edx)
   31da8:	89 da                	mov    %ebx,%edx
   31daa:	88 10                	mov    %dl,(%eax)
   31dac:	8b 45 0c             	mov    0xc(%ebp),%eax
   31daf:	8b 00                	mov    (%eax),%eax
   31db1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   31db4:	c9                   	leave  
   31db5:	c3                   	ret    

00031db6 <i2a>:
   31db6:	55                   	push   %ebp
   31db7:	89 e5                	mov    %esp,%ebp
   31db9:	53                   	push   %ebx
   31dba:	83 ec 14             	sub    $0x14,%esp
   31dbd:	8b 45 08             	mov    0x8(%ebp),%eax
   31dc0:	99                   	cltd   
   31dc1:	f7 7d 0c             	idivl  0xc(%ebp)
   31dc4:	89 55 f4             	mov    %edx,-0xc(%ebp)
   31dc7:	8b 45 08             	mov    0x8(%ebp),%eax
   31dca:	99                   	cltd   
   31dcb:	f7 7d 0c             	idivl  0xc(%ebp)
   31dce:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31dd1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   31dd5:	74 14                	je     31deb <i2a+0x35>
   31dd7:	83 ec 04             	sub    $0x4,%esp
   31dda:	ff 75 10             	pushl  0x10(%ebp)
   31ddd:	ff 75 0c             	pushl  0xc(%ebp)
   31de0:	ff 75 f0             	pushl  -0x10(%ebp)
   31de3:	e8 ce ff ff ff       	call   31db6 <i2a>
   31de8:	83 c4 10             	add    $0x10,%esp
   31deb:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   31def:	7f 0a                	jg     31dfb <i2a+0x45>
   31df1:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31df4:	83 c0 30             	add    $0x30,%eax
   31df7:	89 c3                	mov    %eax,%ebx
   31df9:	eb 08                	jmp    31e03 <i2a+0x4d>
   31dfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31dfe:	83 c0 37             	add    $0x37,%eax
   31e01:	89 c3                	mov    %eax,%ebx
   31e03:	8b 45 10             	mov    0x10(%ebp),%eax
   31e06:	8b 00                	mov    (%eax),%eax
   31e08:	8d 48 01             	lea    0x1(%eax),%ecx
   31e0b:	8b 55 10             	mov    0x10(%ebp),%edx
   31e0e:	89 0a                	mov    %ecx,(%edx)
   31e10:	88 18                	mov    %bl,(%eax)
   31e12:	8b 45 10             	mov    0x10(%ebp),%eax
   31e15:	8b 00                	mov    (%eax),%eax
   31e17:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   31e1a:	c9                   	leave  
   31e1b:	c3                   	ret    

00031e1c <TaskHD>:
   31e1c:	55                   	push   %ebp
   31e1d:	89 e5                	mov    %esp,%ebp
   31e1f:	83 ec 08             	sub    $0x8,%esp
   31e22:	83 ec 08             	sub    $0x8,%esp
   31e25:	68 5b 3b 03 00       	push   $0x33b5b
   31e2a:	68 71 3b 03 00       	push   $0x33b71
   31e2f:	e8 87 f3 ff ff       	call   311bb <Printf>
   31e34:	83 c4 10             	add    $0x10,%esp
   31e37:	e8 07 00 00 00       	call   31e43 <init_hd>
   31e3c:	e8 36 00 00 00       	call   31e77 <hd_handle>
   31e41:	eb f9                	jmp    31e3c <TaskHD+0x20>

00031e43 <init_hd>:
   31e43:	55                   	push   %ebp
   31e44:	89 e5                	mov    %esp,%ebp
   31e46:	83 ec 18             	sub    $0x18,%esp
   31e49:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
   31e50:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31e53:	0f b6 00             	movzbl (%eax),%eax
   31e56:	0f be c0             	movsbl %al,%eax
   31e59:	83 ec 08             	sub    $0x8,%esp
   31e5c:	50                   	push   %eax
   31e5d:	68 75 3b 03 00       	push   $0x33b75
   31e62:	e8 54 f3 ff ff       	call   311bb <Printf>
   31e67:	83 c4 10             	add    $0x10,%esp
   31e6a:	e8 25 e9 ff ff       	call   30794 <enable_8259A_casecade_irq>
   31e6f:	e8 36 e9 ff ff       	call   307aa <enable_8259A_slave_winchester_irq>
   31e74:	90                   	nop
   31e75:	c9                   	leave  
   31e76:	c3                   	ret    

00031e77 <hd_handle>:
   31e77:	55                   	push   %ebp
   31e78:	89 e5                	mov    %esp,%ebp
   31e7a:	83 ec 28             	sub    $0x28,%esp
   31e7d:	83 ec 08             	sub    $0x8,%esp
   31e80:	68 7d 3b 03 00       	push   $0x33b7d
   31e85:	68 71 3b 03 00       	push   $0x33b71
   31e8a:	e8 2c f3 ff ff       	call   311bb <Printf>
   31e8f:	83 c4 10             	add    $0x10,%esp
   31e92:	83 ec 04             	sub    $0x4,%esp
   31e95:	6a 11                	push   $0x11
   31e97:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   31e9a:	50                   	push   %eax
   31e9b:	6a 02                	push   $0x2
   31e9d:	e8 a9 fd ff ff       	call   31c4b <send_rec>
   31ea2:	83 c4 10             	add    $0x10,%esp
   31ea5:	8b 45 e8             	mov    -0x18(%ebp),%eax
   31ea8:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31eab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31eae:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31eb1:	81 7d f4 e9 03 00 00 	cmpl   $0x3e9,-0xc(%ebp)
   31eb8:	75 1f                	jne    31ed9 <hd_handle+0x62>
   31eba:	e8 ce 07 00 00       	call   3268d <hd_open>
   31ebf:	83 ec 04             	sub    $0x4,%esp
   31ec2:	ff 75 f0             	pushl  -0x10(%ebp)
   31ec5:	68 93 3b 03 00       	push   $0x33b93
   31eca:	68 9b 3b 03 00       	push   $0x33b9b
   31ecf:	e8 e7 f2 ff ff       	call   311bb <Printf>
   31ed4:	83 c4 10             	add    $0x10,%esp
   31ed7:	eb 16                	jmp    31eef <hd_handle+0x78>
   31ed9:	83 ec 08             	sub    $0x8,%esp
   31edc:	68 a2 3b 03 00       	push   $0x33ba2
   31ee1:	68 71 3b 03 00       	push   $0x33b71
   31ee6:	e8 d0 f2 ff ff       	call   311bb <Printf>
   31eeb:	83 c4 10             	add    $0x10,%esp
   31eee:	90                   	nop
   31eef:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
   31ef6:	90                   	nop
   31ef7:	c9                   	leave  
   31ef8:	c3                   	ret    

00031ef9 <hd_cmd_out>:
   31ef9:	55                   	push   %ebp
   31efa:	89 e5                	mov    %esp,%ebp
   31efc:	83 ec 18             	sub    $0x18,%esp
   31eff:	eb 29                	jmp    31f2a <hd_cmd_out+0x31>
   31f01:	83 ec 0c             	sub    $0xc,%esp
   31f04:	68 f7 01 00 00       	push   $0x1f7
   31f09:	e8 be e7 ff ff       	call   306cc <in_byte>
   31f0e:	83 c4 10             	add    $0x10,%esp
   31f11:	0f b6 c0             	movzbl %al,%eax
   31f14:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31f17:	83 ec 08             	sub    $0x8,%esp
   31f1a:	ff 75 f4             	pushl  -0xc(%ebp)
   31f1d:	68 b4 3b 03 00       	push   $0x33bb4
   31f22:	e8 94 f2 ff ff       	call   311bb <Printf>
   31f27:	83 c4 10             	add    $0x10,%esp
   31f2a:	83 ec 0c             	sub    $0xc,%esp
   31f2d:	68 f7 01 00 00       	push   $0x1f7
   31f32:	e8 95 e7 ff ff       	call   306cc <in_byte>
   31f37:	83 c4 10             	add    $0x10,%esp
   31f3a:	0f b6 c0             	movzbl %al,%eax
   31f3d:	83 e0 01             	and    $0x1,%eax
   31f40:	85 c0                	test   %eax,%eax
   31f42:	75 bd                	jne    31f01 <hd_cmd_out+0x8>
   31f44:	83 ec 0c             	sub    $0xc,%esp
   31f47:	68 f7 01 00 00       	push   $0x1f7
   31f4c:	e8 7b e7 ff ff       	call   306cc <in_byte>
   31f51:	83 c4 10             	add    $0x10,%esp
   31f54:	0f b6 c0             	movzbl %al,%eax
   31f57:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31f5a:	83 ec 08             	sub    $0x8,%esp
   31f5d:	ff 75 f0             	pushl  -0x10(%ebp)
   31f60:	68 be 3b 03 00       	push   $0x33bbe
   31f65:	e8 51 f2 ff ff       	call   311bb <Printf>
   31f6a:	83 c4 10             	add    $0x10,%esp
   31f6d:	83 ec 08             	sub    $0x8,%esp
   31f70:	6a 00                	push   $0x0
   31f72:	68 f6 03 00 00       	push   $0x3f6
   31f77:	e8 5c e7 ff ff       	call   306d8 <out_byte>
   31f7c:	83 c4 10             	add    $0x10,%esp
   31f7f:	83 ec 08             	sub    $0x8,%esp
   31f82:	6a 17                	push   $0x17
   31f84:	68 c4 3b 03 00       	push   $0x33bc4
   31f89:	e8 2d f2 ff ff       	call   311bb <Printf>
   31f8e:	83 c4 10             	add    $0x10,%esp
   31f91:	8b 45 08             	mov    0x8(%ebp),%eax
   31f94:	0f b6 00             	movzbl (%eax),%eax
   31f97:	0f b6 c0             	movzbl %al,%eax
   31f9a:	83 ec 08             	sub    $0x8,%esp
   31f9d:	50                   	push   %eax
   31f9e:	68 f1 01 00 00       	push   $0x1f1
   31fa3:	e8 30 e7 ff ff       	call   306d8 <out_byte>
   31fa8:	83 c4 10             	add    $0x10,%esp
   31fab:	8b 45 08             	mov    0x8(%ebp),%eax
   31fae:	0f b6 40 01          	movzbl 0x1(%eax),%eax
   31fb2:	0f b6 c0             	movzbl %al,%eax
   31fb5:	83 ec 08             	sub    $0x8,%esp
   31fb8:	50                   	push   %eax
   31fb9:	68 f2 01 00 00       	push   $0x1f2
   31fbe:	e8 15 e7 ff ff       	call   306d8 <out_byte>
   31fc3:	83 c4 10             	add    $0x10,%esp
   31fc6:	8b 45 08             	mov    0x8(%ebp),%eax
   31fc9:	0f b6 40 02          	movzbl 0x2(%eax),%eax
   31fcd:	0f b6 c0             	movzbl %al,%eax
   31fd0:	83 ec 08             	sub    $0x8,%esp
   31fd3:	50                   	push   %eax
   31fd4:	68 f3 01 00 00       	push   $0x1f3
   31fd9:	e8 fa e6 ff ff       	call   306d8 <out_byte>
   31fde:	83 c4 10             	add    $0x10,%esp
   31fe1:	8b 45 08             	mov    0x8(%ebp),%eax
   31fe4:	0f b6 40 03          	movzbl 0x3(%eax),%eax
   31fe8:	0f b6 c0             	movzbl %al,%eax
   31feb:	83 ec 08             	sub    $0x8,%esp
   31fee:	50                   	push   %eax
   31fef:	68 f4 01 00 00       	push   $0x1f4
   31ff4:	e8 df e6 ff ff       	call   306d8 <out_byte>
   31ff9:	83 c4 10             	add    $0x10,%esp
   31ffc:	83 ec 08             	sub    $0x8,%esp
   31fff:	6a 17                	push   $0x17
   32001:	68 c4 3b 03 00       	push   $0x33bc4
   32006:	e8 b0 f1 ff ff       	call   311bb <Printf>
   3200b:	83 c4 10             	add    $0x10,%esp
   3200e:	8b 45 08             	mov    0x8(%ebp),%eax
   32011:	0f b6 40 04          	movzbl 0x4(%eax),%eax
   32015:	0f b6 c0             	movzbl %al,%eax
   32018:	83 ec 08             	sub    $0x8,%esp
   3201b:	50                   	push   %eax
   3201c:	68 f5 01 00 00       	push   $0x1f5
   32021:	e8 b2 e6 ff ff       	call   306d8 <out_byte>
   32026:	83 c4 10             	add    $0x10,%esp
   32029:	83 ec 08             	sub    $0x8,%esp
   3202c:	6a 17                	push   $0x17
   3202e:	68 c4 3b 03 00       	push   $0x33bc4
   32033:	e8 83 f1 ff ff       	call   311bb <Printf>
   32038:	83 c4 10             	add    $0x10,%esp
   3203b:	8b 45 08             	mov    0x8(%ebp),%eax
   3203e:	0f b6 40 05          	movzbl 0x5(%eax),%eax
   32042:	0f b6 c0             	movzbl %al,%eax
   32045:	83 ec 08             	sub    $0x8,%esp
   32048:	50                   	push   %eax
   32049:	68 f6 01 00 00       	push   $0x1f6
   3204e:	e8 85 e6 ff ff       	call   306d8 <out_byte>
   32053:	83 c4 10             	add    $0x10,%esp
   32056:	83 ec 08             	sub    $0x8,%esp
   32059:	6a 17                	push   $0x17
   3205b:	68 c4 3b 03 00       	push   $0x33bc4
   32060:	e8 56 f1 ff ff       	call   311bb <Printf>
   32065:	83 c4 10             	add    $0x10,%esp
   32068:	8b 45 08             	mov    0x8(%ebp),%eax
   3206b:	0f b6 40 06          	movzbl 0x6(%eax),%eax
   3206f:	0f b6 c0             	movzbl %al,%eax
   32072:	83 ec 08             	sub    $0x8,%esp
   32075:	50                   	push   %eax
   32076:	68 f7 01 00 00       	push   $0x1f7
   3207b:	e8 58 e6 ff ff       	call   306d8 <out_byte>
   32080:	83 c4 10             	add    $0x10,%esp
   32083:	83 ec 08             	sub    $0x8,%esp
   32086:	6a 17                	push   $0x17
   32088:	68 c4 3b 03 00       	push   $0x33bc4
   3208d:	e8 29 f1 ff ff       	call   311bb <Printf>
   32092:	83 c4 10             	add    $0x10,%esp
   32095:	90                   	nop
   32096:	c9                   	leave  
   32097:	c3                   	ret    

00032098 <hd_identify>:
   32098:	55                   	push   %ebp
   32099:	89 e5                	mov    %esp,%ebp
   3209b:	81 ec 18 04 00 00    	sub    $0x418,%esp
   320a1:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
   320a5:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
   320a9:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
   320ad:	c6 45 f4 00          	movb   $0x0,-0xc(%ebp)
   320b1:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
   320b5:	8b 45 08             	mov    0x8(%ebp),%eax
   320b8:	c1 f8 18             	sar    $0x18,%eax
   320bb:	83 c8 e0             	or     $0xffffffe0,%eax
   320be:	88 45 f6             	mov    %al,-0xa(%ebp)
   320c1:	c6 45 f7 ec          	movb   $0xec,-0x9(%ebp)
   320c5:	83 ec 0c             	sub    $0xc,%esp
   320c8:	8d 45 f1             	lea    -0xf(%ebp),%eax
   320cb:	50                   	push   %eax
   320cc:	e8 28 fe ff ff       	call   31ef9 <hd_cmd_out>
   320d1:	83 c4 10             	add    $0x10,%esp
   320d4:	83 ec 0c             	sub    $0xc,%esp
   320d7:	6a 01                	push   $0x1
   320d9:	e8 33 ef ff ff       	call   31011 <delay>
   320de:	83 c4 10             	add    $0x10,%esp
   320e1:	83 ec 08             	sub    $0x8,%esp
   320e4:	68 cb 3b 03 00       	push   $0x33bcb
   320e9:	68 71 3b 03 00       	push   $0x33b71
   320ee:	e8 c8 f0 ff ff       	call   311bb <Printf>
   320f3:	83 c4 10             	add    $0x10,%esp
   320f6:	83 ec 04             	sub    $0x4,%esp
   320f9:	68 00 04 00 00       	push   $0x400
   320fe:	6a 00                	push   $0x0
   32100:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32106:	50                   	push   %eax
   32107:	e8 86 1b 00 00       	call   33c92 <Memset>
   3210c:	83 c4 10             	add    $0x10,%esp
   3210f:	83 ec 04             	sub    $0x4,%esp
   32112:	68 00 02 00 00       	push   $0x200
   32117:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   3211d:	50                   	push   %eax
   3211e:	68 f0 01 00 00       	push   $0x1f0
   32123:	e8 be 1b 00 00       	call   33ce6 <read_port>
   32128:	83 c4 10             	add    $0x10,%esp
   3212b:	83 ec 0c             	sub    $0xc,%esp
   3212e:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32134:	50                   	push   %eax
   32135:	e8 32 00 00 00       	call   3216c <print_hdinfo>
   3213a:	83 c4 10             	add    $0x10,%esp
   3213d:	83 ec 08             	sub    $0x8,%esp
   32140:	68 d6 3b 03 00       	push   $0x33bd6
   32145:	68 71 3b 03 00       	push   $0x33b71
   3214a:	e8 6c f0 ff ff       	call   311bb <Printf>
   3214f:	83 c4 10             	add    $0x10,%esp
   32152:	83 ec 08             	sub    $0x8,%esp
   32155:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   3215b:	50                   	push   %eax
   3215c:	68 e2 3b 03 00       	push   $0x33be2
   32161:	e8 55 f0 ff ff       	call   311bb <Printf>
   32166:	83 c4 10             	add    $0x10,%esp
   32169:	90                   	nop
   3216a:	c9                   	leave  
   3216b:	c3                   	ret    

0003216c <print_hdinfo>:
   3216c:	55                   	push   %ebp
   3216d:	89 e5                	mov    %esp,%ebp
   3216f:	81 ec 88 00 00 00    	sub    $0x88,%esp
   32175:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
   3217b:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
   32181:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
   32188:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
   3218f:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
   32196:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
   3219d:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
   321a4:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
   321aa:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
   321b0:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
   321b7:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
   321be:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
   321c5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
   321cc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   321d3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   321da:	e9 b8 00 00 00       	jmp    32297 <print_hdinfo+0x12b>
   321df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   321e6:	8b 55 f4             	mov    -0xc(%ebp),%edx
   321e9:	89 d0                	mov    %edx,%eax
   321eb:	01 c0                	add    %eax,%eax
   321ed:	01 d0                	add    %edx,%eax
   321ef:	c1 e0 03             	shl    $0x3,%eax
   321f2:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   321f5:	01 c8                	add    %ecx,%eax
   321f7:	83 e8 44             	sub    $0x44,%eax
   321fa:	0f b7 00             	movzwl (%eax),%eax
   321fd:	0f b7 c0             	movzwl %ax,%eax
   32200:	8d 14 00             	lea    (%eax,%eax,1),%edx
   32203:	8b 45 08             	mov    0x8(%ebp),%eax
   32206:	01 d0                	add    %edx,%eax
   32208:	89 45 ec             	mov    %eax,-0x14(%ebp)
   3220b:	eb 30                	jmp    3223d <print_hdinfo+0xd1>
   3220d:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32210:	8d 50 01             	lea    0x1(%eax),%edx
   32213:	89 55 ec             	mov    %edx,-0x14(%ebp)
   32216:	8b 55 f0             	mov    -0x10(%ebp),%edx
   32219:	83 c2 01             	add    $0x1,%edx
   3221c:	0f b6 00             	movzbl (%eax),%eax
   3221f:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
   32223:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32226:	8d 50 01             	lea    0x1(%eax),%edx
   32229:	89 55 ec             	mov    %edx,-0x14(%ebp)
   3222c:	0f b6 00             	movzbl (%eax),%eax
   3222f:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
   32232:	8b 55 f0             	mov    -0x10(%ebp),%edx
   32235:	01 ca                	add    %ecx,%edx
   32237:	88 02                	mov    %al,(%edx)
   32239:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   3223d:	8b 55 f4             	mov    -0xc(%ebp),%edx
   32240:	89 d0                	mov    %edx,%eax
   32242:	01 c0                	add    %eax,%eax
   32244:	01 d0                	add    %edx,%eax
   32246:	c1 e0 03             	shl    $0x3,%eax
   32249:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   3224c:	01 c8                	add    %ecx,%eax
   3224e:	83 e8 42             	sub    $0x42,%eax
   32251:	0f b7 00             	movzwl (%eax),%eax
   32254:	66 d1 e8             	shr    %ax
   32257:	0f b7 c0             	movzwl %ax,%eax
   3225a:	39 45 f0             	cmp    %eax,-0x10(%ebp)
   3225d:	7c ae                	jl     3220d <print_hdinfo+0xa1>
   3225f:	8d 55 81             	lea    -0x7f(%ebp),%edx
   32262:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32265:	01 d0                	add    %edx,%eax
   32267:	c6 00 00             	movb   $0x0,(%eax)
   3226a:	8d 4d b4             	lea    -0x4c(%ebp),%ecx
   3226d:	8b 55 f4             	mov    -0xc(%ebp),%edx
   32270:	89 d0                	mov    %edx,%eax
   32272:	01 c0                	add    %eax,%eax
   32274:	01 d0                	add    %edx,%eax
   32276:	c1 e0 03             	shl    $0x3,%eax
   32279:	01 c8                	add    %ecx,%eax
   3227b:	8d 50 04             	lea    0x4(%eax),%edx
   3227e:	83 ec 04             	sub    $0x4,%esp
   32281:	8d 45 81             	lea    -0x7f(%ebp),%eax
   32284:	50                   	push   %eax
   32285:	52                   	push   %edx
   32286:	68 ea 3b 03 00       	push   $0x33bea
   3228b:	e8 2b ef ff ff       	call   311bb <Printf>
   32290:	83 c4 10             	add    $0x10,%esp
   32293:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   32297:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   3229b:	0f 8e 3e ff ff ff    	jle    321df <print_hdinfo+0x73>
   322a1:	8b 45 08             	mov    0x8(%ebp),%eax
   322a4:	0f b7 40 62          	movzwl 0x62(%eax),%eax
   322a8:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
   322ac:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
   322b0:	66 c1 e8 08          	shr    $0x8,%ax
   322b4:	66 85 c0             	test   %ax,%ax
   322b7:	0f 95 c0             	setne  %al
   322ba:	88 45 e9             	mov    %al,-0x17(%ebp)
   322bd:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
   322c4:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
   322ca:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
   322ce:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
   322d2:	75 15                	jne    322e9 <print_hdinfo+0x17d>
   322d4:	83 ec 08             	sub    $0x8,%esp
   322d7:	8d 45 ac             	lea    -0x54(%ebp),%eax
   322da:	50                   	push   %eax
   322db:	8d 45 b0             	lea    -0x50(%ebp),%eax
   322de:	50                   	push   %eax
   322df:	e8 cd 19 00 00       	call   33cb1 <Strcpy>
   322e4:	83 c4 10             	add    $0x10,%esp
   322e7:	eb 13                	jmp    322fc <print_hdinfo+0x190>
   322e9:	83 ec 08             	sub    $0x8,%esp
   322ec:	8d 45 a9             	lea    -0x57(%ebp),%eax
   322ef:	50                   	push   %eax
   322f0:	8d 45 b0             	lea    -0x50(%ebp),%eax
   322f3:	50                   	push   %eax
   322f4:	e8 b8 19 00 00       	call   33cb1 <Strcpy>
   322f9:	83 c4 10             	add    $0x10,%esp
   322fc:	83 ec 08             	sub    $0x8,%esp
   322ff:	8d 45 b0             	lea    -0x50(%ebp),%eax
   32302:	50                   	push   %eax
   32303:	68 f1 3b 03 00       	push   $0x33bf1
   32308:	e8 ae ee ff ff       	call   311bb <Printf>
   3230d:	83 c4 10             	add    $0x10,%esp
   32310:	8b 45 08             	mov    0x8(%ebp),%eax
   32313:	83 c0 7a             	add    $0x7a,%eax
   32316:	0f b7 00             	movzwl (%eax),%eax
   32319:	0f b7 d0             	movzwl %ax,%edx
   3231c:	8b 45 08             	mov    0x8(%ebp),%eax
   3231f:	83 c0 78             	add    $0x78,%eax
   32322:	0f b7 00             	movzwl (%eax),%eax
   32325:	0f b7 c0             	movzwl %ax,%eax
   32328:	83 c0 10             	add    $0x10,%eax
   3232b:	89 c1                	mov    %eax,%ecx
   3232d:	d3 e2                	shl    %cl,%edx
   3232f:	89 d0                	mov    %edx,%eax
   32331:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   32334:	83 ec 08             	sub    $0x8,%esp
   32337:	ff 75 e4             	pushl  -0x1c(%ebp)
   3233a:	68 01 3c 03 00       	push   $0x33c01
   3233f:	e8 77 ee ff ff       	call   311bb <Printf>
   32344:	83 c4 10             	add    $0x10,%esp
   32347:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   3234a:	89 c2                	mov    %eax,%edx
   3234c:	c1 ea 1f             	shr    $0x1f,%edx
   3234f:	01 d0                	add    %edx,%eax
   32351:	d1 f8                	sar    %eax
   32353:	c1 e0 0a             	shl    $0xa,%eax
   32356:	83 ec 08             	sub    $0x8,%esp
   32359:	50                   	push   %eax
   3235a:	68 14 3c 03 00       	push   $0x33c14
   3235f:	e8 57 ee ff ff       	call   311bb <Printf>
   32364:	83 c4 10             	add    $0x10,%esp
   32367:	90                   	nop
   32368:	c9                   	leave  
   32369:	c3                   	ret    

0003236a <print_dpt_entry>:
   3236a:	55                   	push   %ebp
   3236b:	89 e5                	mov    %esp,%ebp
   3236d:	83 ec 08             	sub    $0x8,%esp
   32370:	8b 45 08             	mov    0x8(%ebp),%eax
   32373:	0f b6 40 04          	movzbl 0x4(%eax),%eax
   32377:	0f b6 c0             	movzbl %al,%eax
   3237a:	83 ec 08             	sub    $0x8,%esp
   3237d:	50                   	push   %eax
   3237e:	68 21 3c 03 00       	push   $0x33c21
   32383:	e8 33 ee ff ff       	call   311bb <Printf>
   32388:	83 c4 10             	add    $0x10,%esp
   3238b:	90                   	nop
   3238c:	c9                   	leave  
   3238d:	c3                   	ret    

0003238e <get_partition_table>:
   3238e:	55                   	push   %ebp
   3238f:	89 e5                	mov    %esp,%ebp
   32391:	81 ec 18 04 00 00    	sub    $0x418,%esp
   32397:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
   3239b:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
   3239f:	8b 45 0c             	mov    0xc(%ebp),%eax
   323a2:	88 45 f3             	mov    %al,-0xd(%ebp)
   323a5:	8b 45 0c             	mov    0xc(%ebp),%eax
   323a8:	c1 f8 08             	sar    $0x8,%eax
   323ab:	88 45 f4             	mov    %al,-0xc(%ebp)
   323ae:	8b 45 0c             	mov    0xc(%ebp),%eax
   323b1:	c1 f8 10             	sar    $0x10,%eax
   323b4:	88 45 f5             	mov    %al,-0xb(%ebp)
   323b7:	8b 45 0c             	mov    0xc(%ebp),%eax
   323ba:	c1 f8 18             	sar    $0x18,%eax
   323bd:	89 c2                	mov    %eax,%edx
   323bf:	8b 45 08             	mov    0x8(%ebp),%eax
   323c2:	c1 e0 04             	shl    $0x4,%eax
   323c5:	09 d0                	or     %edx,%eax
   323c7:	83 c8 e0             	or     $0xffffffe0,%eax
   323ca:	88 45 f6             	mov    %al,-0xa(%ebp)
   323cd:	c6 45 f7 20          	movb   $0x20,-0x9(%ebp)
   323d1:	83 ec 0c             	sub    $0xc,%esp
   323d4:	8d 45 f1             	lea    -0xf(%ebp),%eax
   323d7:	50                   	push   %eax
   323d8:	e8 1c fb ff ff       	call   31ef9 <hd_cmd_out>
   323dd:	83 c4 10             	add    $0x10,%esp
   323e0:	83 ec 0c             	sub    $0xc,%esp
   323e3:	68 f4 01 00 00       	push   $0x1f4
   323e8:	e8 24 ec ff ff       	call   31011 <delay>
   323ed:	83 c4 10             	add    $0x10,%esp
   323f0:	83 ec 04             	sub    $0x4,%esp
   323f3:	68 00 04 00 00       	push   $0x400
   323f8:	6a 00                	push   $0x0
   323fa:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32400:	50                   	push   %eax
   32401:	e8 8c 18 00 00       	call   33c92 <Memset>
   32406:	83 c4 10             	add    $0x10,%esp
   32409:	83 ec 04             	sub    $0x4,%esp
   3240c:	68 00 02 00 00       	push   $0x200
   32411:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32417:	50                   	push   %eax
   32418:	68 f0 01 00 00       	push   $0x1f0
   3241d:	e8 c4 18 00 00       	call   33ce6 <read_port>
   32422:	83 c4 10             	add    $0x10,%esp
   32425:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   3242b:	05 be 01 00 00       	add    $0x1be,%eax
   32430:	83 ec 04             	sub    $0x4,%esp
   32433:	6a 40                	push   $0x40
   32435:	50                   	push   %eax
   32436:	ff 75 10             	pushl  0x10(%ebp)
   32439:	e8 26 18 00 00       	call   33c64 <Memcpy>
   3243e:	83 c4 10             	add    $0x10,%esp
   32441:	90                   	nop
   32442:	c9                   	leave  
   32443:	c3                   	ret    

00032444 <partition>:
   32444:	55                   	push   %ebp
   32445:	89 e5                	mov    %esp,%ebp
   32447:	81 ec 98 00 00 00    	sub    $0x98,%esp
   3244d:	8b 45 0c             	mov    0xc(%ebp),%eax
   32450:	88 85 74 ff ff ff    	mov    %al,-0x8c(%ebp)
   32456:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
   3245a:	7f 19                	jg     32475 <partition+0x31>
   3245c:	8b 4d 08             	mov    0x8(%ebp),%ecx
   3245f:	ba 67 66 66 66       	mov    $0x66666667,%edx
   32464:	89 c8                	mov    %ecx,%eax
   32466:	f7 ea                	imul   %edx
   32468:	d1 fa                	sar    %edx
   3246a:	89 c8                	mov    %ecx,%eax
   3246c:	c1 f8 1f             	sar    $0x1f,%eax
   3246f:	29 c2                	sub    %eax,%edx
   32471:	89 d0                	mov    %edx,%eax
   32473:	eb 11                	jmp    32486 <partition+0x42>
   32475:	8b 45 08             	mov    0x8(%ebp),%eax
   32478:	83 e8 10             	sub    $0x10,%eax
   3247b:	8d 50 3f             	lea    0x3f(%eax),%edx
   3247e:	85 c0                	test   %eax,%eax
   32480:	0f 48 c2             	cmovs  %edx,%eax
   32483:	c1 f8 06             	sar    $0x6,%eax
   32486:	89 45 e8             	mov    %eax,-0x18(%ebp)
   32489:	80 bd 74 ff ff ff 00 	cmpb   $0x0,-0x8c(%ebp)
   32490:	0f 85 cc 00 00 00    	jne    32562 <partition+0x11e>
   32496:	83 ec 04             	sub    $0x4,%esp
   32499:	6a 50                	push   $0x50
   3249b:	6a 00                	push   $0x0
   3249d:	8d 45 84             	lea    -0x7c(%ebp),%eax
   324a0:	50                   	push   %eax
   324a1:	e8 ec 17 00 00       	call   33c92 <Memset>
   324a6:	83 c4 10             	add    $0x10,%esp
   324a9:	83 ec 04             	sub    $0x4,%esp
   324ac:	8d 45 84             	lea    -0x7c(%ebp),%eax
   324af:	50                   	push   %eax
   324b0:	6a 00                	push   $0x0
   324b2:	ff 75 e8             	pushl  -0x18(%ebp)
   324b5:	e8 d4 fe ff ff       	call   3238e <get_partition_table>
   324ba:	83 c4 10             	add    $0x10,%esp
   324bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   324c4:	e9 8a 00 00 00       	jmp    32553 <partition+0x10f>
   324c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
   324cc:	83 c0 01             	add    $0x1,%eax
   324cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   324d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
   324d5:	c1 e0 04             	shl    $0x4,%eax
   324d8:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   324db:	01 c8                	add    %ecx,%eax
   324dd:	83 e8 6c             	sub    $0x6c,%eax
   324e0:	8b 00                	mov    (%eax),%eax
   324e2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
   324e5:	8b 55 e8             	mov    -0x18(%ebp),%edx
   324e8:	c1 e1 03             	shl    $0x3,%ecx
   324eb:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
   324f1:	01 ca                	add    %ecx,%edx
   324f3:	81 c2 a4 a4 03 00    	add    $0x3a4a4,%edx
   324f9:	89 02                	mov    %eax,(%edx)
   324fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
   324fe:	c1 e0 04             	shl    $0x4,%eax
   32501:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   32504:	01 c8                	add    %ecx,%eax
   32506:	83 e8 68             	sub    $0x68,%eax
   32509:	8b 00                	mov    (%eax),%eax
   3250b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
   3250e:	8b 55 e8             	mov    -0x18(%ebp),%edx
   32511:	c1 e1 03             	shl    $0x3,%ecx
   32514:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
   3251a:	01 ca                	add    %ecx,%edx
   3251c:	81 c2 a8 a4 03 00    	add    $0x3a4a8,%edx
   32522:	89 02                	mov    %eax,(%edx)
   32524:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32527:	c1 e0 04             	shl    $0x4,%eax
   3252a:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   3252d:	01 c8                	add    %ecx,%eax
   3252f:	83 e8 70             	sub    $0x70,%eax
   32532:	0f b6 00             	movzbl (%eax),%eax
   32535:	3c 05                	cmp    $0x5,%al
   32537:	75 16                	jne    3254f <partition+0x10b>
   32539:	8b 55 08             	mov    0x8(%ebp),%edx
   3253c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   3253f:	01 d0                	add    %edx,%eax
   32541:	83 ec 08             	sub    $0x8,%esp
   32544:	6a 01                	push   $0x1
   32546:	50                   	push   %eax
   32547:	e8 f8 fe ff ff       	call   32444 <partition>
   3254c:	83 c4 10             	add    $0x10,%esp
   3254f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   32553:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
   32557:	0f 8e 6c ff ff ff    	jle    324c9 <partition+0x85>
   3255d:	e9 28 01 00 00       	jmp    3268a <partition+0x246>
   32562:	80 bd 74 ff ff ff 01 	cmpb   $0x1,-0x8c(%ebp)
   32569:	0f 85 03 01 00 00    	jne    32672 <partition+0x22e>
   3256f:	8b 4d 08             	mov    0x8(%ebp),%ecx
   32572:	ba 67 66 66 66       	mov    $0x66666667,%edx
   32577:	89 c8                	mov    %ecx,%eax
   32579:	f7 ea                	imul   %edx
   3257b:	d1 fa                	sar    %edx
   3257d:	89 c8                	mov    %ecx,%eax
   3257f:	c1 f8 1f             	sar    $0x1f,%eax
   32582:	29 c2                	sub    %eax,%edx
   32584:	89 d0                	mov    %edx,%eax
   32586:	c1 e0 02             	shl    $0x2,%eax
   32589:	01 d0                	add    %edx,%eax
   3258b:	29 c1                	sub    %eax,%ecx
   3258d:	89 c8                	mov    %ecx,%eax
   3258f:	89 45 e0             	mov    %eax,-0x20(%ebp)
   32592:	8b 55 e0             	mov    -0x20(%ebp),%edx
   32595:	8b 45 e8             	mov    -0x18(%ebp),%eax
   32598:	c1 e2 03             	shl    $0x3,%edx
   3259b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   325a1:	01 d0                	add    %edx,%eax
   325a3:	05 a4 a4 03 00       	add    $0x3a4a4,%eax
   325a8:	8b 00                	mov    (%eax),%eax
   325aa:	89 45 dc             	mov    %eax,-0x24(%ebp)
   325ad:	8b 45 dc             	mov    -0x24(%ebp),%eax
   325b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
   325b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
   325b6:	83 e8 01             	sub    $0x1,%eax
   325b9:	c1 e0 04             	shl    $0x4,%eax
   325bc:	89 45 d8             	mov    %eax,-0x28(%ebp)
   325bf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   325c6:	e9 9b 00 00 00       	jmp    32666 <partition+0x222>
   325cb:	83 ec 04             	sub    $0x4,%esp
   325ce:	6a 50                	push   $0x50
   325d0:	6a 00                	push   $0x0
   325d2:	8d 45 84             	lea    -0x7c(%ebp),%eax
   325d5:	50                   	push   %eax
   325d6:	e8 b7 16 00 00       	call   33c92 <Memset>
   325db:	83 c4 10             	add    $0x10,%esp
   325de:	83 ec 04             	sub    $0x4,%esp
   325e1:	8d 45 84             	lea    -0x7c(%ebp),%eax
   325e4:	50                   	push   %eax
   325e5:	ff 75 f0             	pushl  -0x10(%ebp)
   325e8:	ff 75 e8             	pushl  -0x18(%ebp)
   325eb:	e8 9e fd ff ff       	call   3238e <get_partition_table>
   325f0:	83 c4 10             	add    $0x10,%esp
   325f3:	83 ec 0c             	sub    $0xc,%esp
   325f6:	8d 45 84             	lea    -0x7c(%ebp),%eax
   325f9:	50                   	push   %eax
   325fa:	e8 6b fd ff ff       	call   3236a <print_dpt_entry>
   325ff:	83 c4 10             	add    $0x10,%esp
   32602:	8b 55 d8             	mov    -0x28(%ebp),%edx
   32605:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32608:	01 d0                	add    %edx,%eax
   3260a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   3260d:	8b 55 8c             	mov    -0x74(%ebp),%edx
   32610:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32613:	01 c2                	add    %eax,%edx
   32615:	8b 45 d4             	mov    -0x2c(%ebp),%eax
   32618:	8d 48 04             	lea    0x4(%eax),%ecx
   3261b:	8b 45 e8             	mov    -0x18(%ebp),%eax
   3261e:	c1 e1 03             	shl    $0x3,%ecx
   32621:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   32627:	01 c8                	add    %ecx,%eax
   32629:	05 a4 a4 03 00       	add    $0x3a4a4,%eax
   3262e:	89 10                	mov    %edx,(%eax)
   32630:	8b 45 90             	mov    -0x70(%ebp),%eax
   32633:	8b 55 d4             	mov    -0x2c(%ebp),%edx
   32636:	8d 4a 04             	lea    0x4(%edx),%ecx
   32639:	8b 55 e8             	mov    -0x18(%ebp),%edx
   3263c:	c1 e1 03             	shl    $0x3,%ecx
   3263f:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
   32645:	01 ca                	add    %ecx,%edx
   32647:	81 c2 a8 a4 03 00    	add    $0x3a4a8,%edx
   3264d:	89 02                	mov    %eax,(%edx)
   3264f:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
   32653:	84 c0                	test   %al,%al
   32655:	74 32                	je     32689 <partition+0x245>
   32657:	8b 55 9c             	mov    -0x64(%ebp),%edx
   3265a:	8b 45 dc             	mov    -0x24(%ebp),%eax
   3265d:	01 d0                	add    %edx,%eax
   3265f:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32662:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   32666:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
   3266a:	0f 8e 5b ff ff ff    	jle    325cb <partition+0x187>
   32670:	eb 18                	jmp    3268a <partition+0x246>
   32672:	83 ec 08             	sub    $0x8,%esp
   32675:	68 2f 3c 03 00       	push   $0x33c2f
   3267a:	68 71 3b 03 00       	push   $0x33b71
   3267f:	e8 37 eb ff ff       	call   311bb <Printf>
   32684:	83 c4 10             	add    $0x10,%esp
   32687:	eb 01                	jmp    3268a <partition+0x246>
   32689:	90                   	nop
   3268a:	90                   	nop
   3268b:	c9                   	leave  
   3268c:	c3                   	ret    

0003268d <hd_open>:
   3268d:	55                   	push   %ebp
   3268e:	89 e5                	mov    %esp,%ebp
   32690:	83 ec 18             	sub    $0x18,%esp
   32693:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3269a:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3269d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   326a3:	05 a0 a4 03 00       	add    $0x3a4a0,%eax
   326a8:	8b 00                	mov    (%eax),%eax
   326aa:	8d 50 01             	lea    0x1(%eax),%edx
   326ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
   326b0:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   326b6:	05 a0 a4 03 00       	add    $0x3a4a0,%eax
   326bb:	89 10                	mov    %edx,(%eax)
   326bd:	83 ec 08             	sub    $0x8,%esp
   326c0:	6a 00                	push   $0x0
   326c2:	6a 00                	push   $0x0
   326c4:	e8 7b fd ff ff       	call   32444 <partition>
   326c9:	83 c4 10             	add    $0x10,%esp
   326cc:	83 ec 08             	sub    $0x8,%esp
   326cf:	68 3a 3c 03 00       	push   $0x33c3a
   326d4:	68 71 3b 03 00       	push   $0x33b71
   326d9:	e8 dd ea ff ff       	call   311bb <Printf>
   326de:	83 c4 10             	add    $0x10,%esp
   326e1:	90                   	nop
   326e2:	c9                   	leave  
   326e3:	c3                   	ret    
   326e4:	66 90                	;xchg   %ax,%ax
   326e6:	66 90                	;xchg   %ax,%ax
   326e8:	66 90                	;xchg   %ax,%ax
   326ea:	66 90                	;xchg   %ax,%ax
   326ec:	66 90                	;xchg   %ax,%ax
   326ee:	66 90                	;xchg   %ax,%ax

000326f0 <get_ticks>:
   326f0:	b8 00 00 00 00       	mov    $0x0,%eax
   326f5:	cd 90                	int    $0x90
   326f7:	c3                   	ret    

000326f8 <write>:
   326f8:	b8 01 00 00 00       	mov    $0x1,%eax
   326fd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32701:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32705:	cd 90                	int    $0x90
   32707:	c3                   	ret    

00032708 <write_debug>:
   32708:	b8 02 00 00 00       	mov    $0x2,%eax
   3270d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32711:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32715:	cd 90                	int    $0x90
   32717:	c3                   	ret    

00032718 <send_msg>:
   32718:	b8 03 00 00 00       	mov    $0x3,%eax
   3271d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32721:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32725:	cd 90                	int    $0x90
   32727:	c3                   	ret    

00032728 <receive_msg>:
   32728:	b8 04 00 00 00       	mov    $0x4,%eax
   3272d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32731:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32735:	cd 90                	int    $0x90
   32737:	c3                   	ret    

00032738 <task_fs>:
   32738:	55                   	push   %ebp
   32739:	89 e5                	mov    %esp,%ebp
   3273b:	83 ec 18             	sub    $0x18,%esp
   3273e:	83 ec 08             	sub    $0x8,%esp
   32741:	68 3f 3c 03 00       	push   $0x33c3f
   32746:	68 4d 3c 03 00       	push   $0x33c4d
   3274b:	e8 6b ea ff ff       	call   311bb <Printf>
   32750:	83 c4 10             	add    $0x10,%esp
   32753:	c7 45 f0 e9 03 00 00 	movl   $0x3e9,-0x10(%ebp)
   3275a:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
   32761:	83 ec 04             	sub    $0x4,%esp
   32764:	6a 02                	push   $0x2
   32766:	8d 45 ec             	lea    -0x14(%ebp),%eax
   32769:	50                   	push   %eax
   3276a:	6a 03                	push   $0x3
   3276c:	e8 da f4 ff ff       	call   31c4b <send_rec>
   32771:	83 c4 10             	add    $0x10,%esp
   32774:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32777:	83 ec 08             	sub    $0x8,%esp
   3277a:	50                   	push   %eax
   3277b:	68 51 3c 03 00       	push   $0x33c51
   32780:	e8 36 ea ff ff       	call   311bb <Printf>
   32785:	83 c4 10             	add    $0x10,%esp
   32788:	83 ec 0c             	sub    $0xc,%esp
   3278b:	68 5a 3c 03 00       	push   $0x33c5a
   32790:	e8 4d ed ff ff       	call   314e2 <spin>
   32795:	83 c4 10             	add    $0x10,%esp
   32798:	90                   	nop
   32799:	c9                   	leave  
   3279a:	c3                   	ret    

0003279b <schedule_process>:
   3279b:	55                   	push   %ebp
   3279c:	89 e5                	mov    %esp,%ebp
   3279e:	83 ec 10             	sub    $0x10,%esp
   327a1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   327a8:	eb 78                	jmp    32822 <schedule_process+0x87>
   327aa:	c7 45 fc e0 16 04 00 	movl   $0x416e0,-0x4(%ebp)
   327b1:	eb 2e                	jmp    327e1 <schedule_process+0x46>
   327b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
   327b6:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   327ba:	84 c0                	test   %al,%al
   327bc:	75 1c                	jne    327da <schedule_process+0x3f>
   327be:	8b 45 fc             	mov    -0x4(%ebp),%eax
   327c1:	8b 40 5c             	mov    0x5c(%eax),%eax
   327c4:	39 45 f8             	cmp    %eax,-0x8(%ebp)
   327c7:	73 11                	jae    327da <schedule_process+0x3f>
   327c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
   327cc:	8b 40 5c             	mov    0x5c(%eax),%eax
   327cf:	89 45 f8             	mov    %eax,-0x8(%ebp)
   327d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
   327d5:	a3 a0 72 03 00       	mov    %eax,0x372a0
   327da:	81 45 fc 90 00 00 00 	addl   $0x90,-0x4(%ebp)
   327e1:	b8 d0 1a 04 00       	mov    $0x41ad0,%eax
   327e6:	39 45 fc             	cmp    %eax,-0x4(%ebp)
   327e9:	72 c8                	jb     327b3 <schedule_process+0x18>
   327eb:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
   327ef:	75 31                	jne    32822 <schedule_process+0x87>
   327f1:	c7 45 fc e0 16 04 00 	movl   $0x416e0,-0x4(%ebp)
   327f8:	eb 1e                	jmp    32818 <schedule_process+0x7d>
   327fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
   327fd:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   32801:	84 c0                	test   %al,%al
   32803:	75 0c                	jne    32811 <schedule_process+0x76>
   32805:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32808:	8b 50 60             	mov    0x60(%eax),%edx
   3280b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3280e:	89 50 5c             	mov    %edx,0x5c(%eax)
   32811:	81 45 fc 90 00 00 00 	addl   $0x90,-0x4(%ebp)
   32818:	b8 d0 1a 04 00       	mov    $0x41ad0,%eax
   3281d:	39 45 fc             	cmp    %eax,-0x4(%ebp)
   32820:	72 d8                	jb     327fa <schedule_process+0x5f>
   32822:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
   32826:	74 82                	je     327aa <schedule_process+0xf>
   32828:	90                   	nop
   32829:	c9                   	leave  
   3282a:	c3                   	ret    

0003282b <clock_handler>:
   3282b:	55                   	push   %ebp
   3282c:	89 e5                	mov    %esp,%ebp
   3282e:	a1 a0 72 03 00       	mov    0x372a0,%eax
   32833:	8b 40 5c             	mov    0x5c(%eax),%eax
   32836:	85 c0                	test   %eax,%eax
   32838:	74 0e                	je     32848 <clock_handler+0x1d>
   3283a:	a1 a0 72 03 00       	mov    0x372a0,%eax
   3283f:	8b 50 5c             	mov    0x5c(%eax),%edx
   32842:	83 ea 01             	sub    $0x1,%edx
   32845:	89 50 5c             	mov    %edx,0x5c(%eax)
   32848:	a1 40 a4 03 00       	mov    0x3a440,%eax
   3284d:	83 c0 01             	add    $0x1,%eax
   32850:	a3 40 a4 03 00       	mov    %eax,0x3a440
   32855:	a1 94 6e 03 00       	mov    0x36e94,%eax
   3285a:	85 c0                	test   %eax,%eax
   3285c:	75 13                	jne    32871 <clock_handler+0x46>
   3285e:	a1 a0 72 03 00       	mov    0x372a0,%eax
   32863:	8b 40 5c             	mov    0x5c(%eax),%eax
   32866:	85 c0                	test   %eax,%eax
   32868:	75 0a                	jne    32874 <clock_handler+0x49>
   3286a:	e8 2c ff ff ff       	call   3279b <schedule_process>
   3286f:	eb 04                	jmp    32875 <clock_handler+0x4a>
   32871:	90                   	nop
   32872:	eb 01                	jmp    32875 <clock_handler+0x4a>
   32874:	90                   	nop
   32875:	5d                   	pop    %ebp
   32876:	c3                   	ret    

00032877 <pid2proc>:
   32877:	55                   	push   %ebp
   32878:	89 e5                	mov    %esp,%ebp
   3287a:	83 ec 10             	sub    $0x10,%esp
   3287d:	8b 55 08             	mov    0x8(%ebp),%edx
   32880:	89 d0                	mov    %edx,%eax
   32882:	c1 e0 03             	shl    $0x3,%eax
   32885:	01 d0                	add    %edx,%eax
   32887:	c1 e0 04             	shl    $0x4,%eax
   3288a:	05 e0 16 04 00       	add    $0x416e0,%eax
   3288f:	89 45 fc             	mov    %eax,-0x4(%ebp)
   32892:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32895:	c9                   	leave  
   32896:	c3                   	ret    

00032897 <proc2pid>:
   32897:	55                   	push   %ebp
   32898:	89 e5                	mov    %esp,%ebp
   3289a:	83 ec 10             	sub    $0x10,%esp
   3289d:	8b 45 08             	mov    0x8(%ebp),%eax
   328a0:	2d e0 16 04 00       	sub    $0x416e0,%eax
   328a5:	c1 f8 04             	sar    $0x4,%eax
   328a8:	69 c0 39 8e e3 38    	imul   $0x38e38e39,%eax,%eax
   328ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
   328b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
   328b4:	c9                   	leave  
   328b5:	c3                   	ret    

000328b6 <InitDescriptor>:
   328b6:	55                   	push   %ebp
   328b7:	89 e5                	mov    %esp,%ebp
   328b9:	83 ec 04             	sub    $0x4,%esp
   328bc:	8b 45 14             	mov    0x14(%ebp),%eax
   328bf:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
   328c3:	8b 45 10             	mov    0x10(%ebp),%eax
   328c6:	89 c2                	mov    %eax,%edx
   328c8:	8b 45 08             	mov    0x8(%ebp),%eax
   328cb:	66 89 10             	mov    %dx,(%eax)
   328ce:	8b 45 0c             	mov    0xc(%ebp),%eax
   328d1:	89 c2                	mov    %eax,%edx
   328d3:	8b 45 08             	mov    0x8(%ebp),%eax
   328d6:	66 89 50 02          	mov    %dx,0x2(%eax)
   328da:	8b 45 0c             	mov    0xc(%ebp),%eax
   328dd:	c1 e8 10             	shr    $0x10,%eax
   328e0:	89 c2                	mov    %eax,%edx
   328e2:	8b 45 08             	mov    0x8(%ebp),%eax
   328e5:	88 50 04             	mov    %dl,0x4(%eax)
   328e8:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
   328ec:	89 c2                	mov    %eax,%edx
   328ee:	8b 45 08             	mov    0x8(%ebp),%eax
   328f1:	88 50 05             	mov    %dl,0x5(%eax)
   328f4:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
   328f8:	66 c1 e8 08          	shr    $0x8,%ax
   328fc:	c1 e0 04             	shl    $0x4,%eax
   328ff:	89 c2                	mov    %eax,%edx
   32901:	8b 45 10             	mov    0x10(%ebp),%eax
   32904:	c1 e8 10             	shr    $0x10,%eax
   32907:	83 e0 0f             	and    $0xf,%eax
   3290a:	09 c2                	or     %eax,%edx
   3290c:	8b 45 08             	mov    0x8(%ebp),%eax
   3290f:	88 50 06             	mov    %dl,0x6(%eax)
   32912:	8b 45 0c             	mov    0xc(%ebp),%eax
   32915:	c1 e8 18             	shr    $0x18,%eax
   32918:	89 c2                	mov    %eax,%edx
   3291a:	8b 45 08             	mov    0x8(%ebp),%eax
   3291d:	88 50 07             	mov    %dl,0x7(%eax)
   32920:	90                   	nop
   32921:	c9                   	leave  
   32922:	c3                   	ret    

00032923 <Seg2PhyAddr>:
   32923:	55                   	push   %ebp
   32924:	89 e5                	mov    %esp,%ebp
   32926:	83 ec 10             	sub    $0x10,%esp
   32929:	8b 45 08             	mov    0x8(%ebp),%eax
   3292c:	c1 e8 03             	shr    $0x3,%eax
   3292f:	8b 14 c5 a4 6e 03 00 	mov    0x36ea4(,%eax,8),%edx
   32936:	8b 04 c5 a0 6e 03 00 	mov    0x36ea0(,%eax,8),%eax
   3293d:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32940:	89 55 f8             	mov    %edx,-0x8(%ebp)
   32943:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
   32947:	0f b7 c0             	movzwl %ax,%eax
   3294a:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
   3294e:	0f b6 d2             	movzbl %dl,%edx
   32951:	c1 e2 10             	shl    $0x10,%edx
   32954:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
   3295a:	09 d0                	or     %edx,%eax
   3295c:	89 45 fc             	mov    %eax,-0x4(%ebp)
   3295f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32962:	c9                   	leave  
   32963:	c3                   	ret    

00032964 <Seg2PhyAddrLDT>:
   32964:	55                   	push   %ebp
   32965:	89 e5                	mov    %esp,%ebp
   32967:	83 ec 10             	sub    $0x10,%esp
   3296a:	8b 45 08             	mov    0x8(%ebp),%eax
   3296d:	c1 e8 03             	shr    $0x3,%eax
   32970:	89 c2                	mov    %eax,%edx
   32972:	8b 45 0c             	mov    0xc(%ebp),%eax
   32975:	83 c2 08             	add    $0x8,%edx
   32978:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
   3297c:	8b 02                	mov    (%edx),%eax
   3297e:	8b 52 04             	mov    0x4(%edx),%edx
   32981:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32984:	89 55 f8             	mov    %edx,-0x8(%ebp)
   32987:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
   3298b:	0f b7 c0             	movzwl %ax,%eax
   3298e:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
   32992:	0f b6 d2             	movzbl %dl,%edx
   32995:	c1 e2 10             	shl    $0x10,%edx
   32998:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
   3299e:	09 d0                	or     %edx,%eax
   329a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
   329a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
   329a6:	c9                   	leave  
   329a7:	c3                   	ret    

000329a8 <VirAddr2PhyAddr>:
   329a8:	55                   	push   %ebp
   329a9:	89 e5                	mov    %esp,%ebp
   329ab:	83 ec 10             	sub    $0x10,%esp
   329ae:	8b 55 0c             	mov    0xc(%ebp),%edx
   329b1:	8b 45 08             	mov    0x8(%ebp),%eax
   329b4:	01 d0                	add    %edx,%eax
   329b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
   329b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
   329bc:	c9                   	leave  
   329bd:	c3                   	ret    

000329be <init_propt>:
   329be:	55                   	push   %ebp
   329bf:	89 e5                	mov    %esp,%ebp
   329c1:	53                   	push   %ebx
   329c2:	83 ec 24             	sub    $0x24,%esp
   329c5:	6a 0e                	push   $0xe
   329c7:	6a 08                	push   $0x8
   329c9:	68 61 05 03 00       	push   $0x30561
   329ce:	6a 20                	push   $0x20
   329d0:	e8 57 01 00 00       	call   32b2c <InitInterruptDesc>
   329d5:	83 c4 10             	add    $0x10,%esp
   329d8:	6a 0e                	push   $0xe
   329da:	6a 08                	push   $0x8
   329dc:	68 aa 05 03 00       	push   $0x305aa
   329e1:	6a 21                	push   $0x21
   329e3:	e8 44 01 00 00       	call   32b2c <InitInterruptDesc>
   329e8:	83 c4 10             	add    $0x10,%esp
   329eb:	6a 0e                	push   $0xe
   329ed:	6a 08                	push   $0x8
   329ef:	68 f3 05 03 00       	push   $0x305f3
   329f4:	6a 2e                	push   $0x2e
   329f6:	e8 31 01 00 00       	call   32b2c <InitInterruptDesc>
   329fb:	83 c4 10             	add    $0x10,%esp
   329fe:	83 ec 04             	sub    $0x4,%esp
   32a01:	68 f0 03 00 00       	push   $0x3f0
   32a06:	6a 00                	push   $0x0
   32a08:	68 e0 16 04 00       	push   $0x416e0
   32a0d:	e8 80 12 00 00       	call   33c92 <Memset>
   32a12:	83 c4 10             	add    $0x10,%esp
   32a15:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
   32a1c:	83 ec 04             	sub    $0x4,%esp
   32a1f:	ff 75 f0             	pushl  -0x10(%ebp)
   32a22:	6a 00                	push   $0x0
   32a24:	68 c0 9b 03 00       	push   $0x39bc0
   32a29:	e8 64 12 00 00       	call   33c92 <Memset>
   32a2e:	83 c4 10             	add    $0x10,%esp
   32a31:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32a34:	a3 28 9c 03 00       	mov    %eax,0x39c28
   32a39:	c7 05 c8 9b 03 00 30 	movl   $0x30,0x39bc8
   32a40:	00 00 00 
   32a43:	83 ec 0c             	sub    $0xc,%esp
   32a46:	6a 30                	push   $0x30
   32a48:	e8 d6 fe ff ff       	call   32923 <Seg2PhyAddr>
   32a4d:	83 c4 10             	add    $0x10,%esp
   32a50:	89 45 ec             	mov    %eax,-0x14(%ebp)
   32a53:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32a56:	83 ec 08             	sub    $0x8,%esp
   32a59:	68 c0 9b 03 00       	push   $0x39bc0
   32a5e:	50                   	push   %eax
   32a5f:	e8 44 ff ff ff       	call   329a8 <VirAddr2PhyAddr>
   32a64:	83 c4 10             	add    $0x10,%esp
   32a67:	89 45 e8             	mov    %eax,-0x18(%ebp)
   32a6a:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
   32a71:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32a74:	0f b7 d0             	movzwl %ax,%edx
   32a77:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32a7a:	83 e8 01             	sub    $0x1,%eax
   32a7d:	89 c1                	mov    %eax,%ecx
   32a7f:	8b 45 e8             	mov    -0x18(%ebp),%eax
   32a82:	52                   	push   %edx
   32a83:	51                   	push   %ecx
   32a84:	50                   	push   %eax
   32a85:	68 e0 6e 03 00       	push   $0x36ee0
   32a8a:	e8 27 fe ff ff       	call   328b6 <InitDescriptor>
   32a8f:	83 c4 10             	add    $0x10,%esp
   32a92:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   32a99:	eb 69                	jmp    32b04 <init_propt+0x146>
   32a9b:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
   32aa2:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
   32aa9:	8b 55 f4             	mov    -0xc(%ebp),%edx
   32aac:	89 d0                	mov    %edx,%eax
   32aae:	c1 e0 03             	shl    $0x3,%eax
   32ab1:	01 d0                	add    %edx,%eax
   32ab3:	c1 e0 04             	shl    $0x4,%eax
   32ab6:	83 c0 40             	add    $0x40,%eax
   32ab9:	05 e0 16 04 00       	add    $0x416e0,%eax
   32abe:	8d 50 06             	lea    0x6(%eax),%edx
   32ac1:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32ac4:	83 ec 08             	sub    $0x8,%esp
   32ac7:	52                   	push   %edx
   32ac8:	50                   	push   %eax
   32ac9:	e8 da fe ff ff       	call   329a8 <VirAddr2PhyAddr>
   32ace:	83 c4 10             	add    $0x10,%esp
   32ad1:	89 45 d8             	mov    %eax,-0x28(%ebp)
   32ad4:	8b 45 dc             	mov    -0x24(%ebp),%eax
   32ad7:	0f b7 d0             	movzwl %ax,%edx
   32ada:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32add:	83 e8 01             	sub    $0x1,%eax
   32ae0:	89 c3                	mov    %eax,%ebx
   32ae2:	8b 45 d8             	mov    -0x28(%ebp),%eax
   32ae5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
   32ae8:	83 c1 09             	add    $0x9,%ecx
   32aeb:	c1 e1 03             	shl    $0x3,%ecx
   32aee:	81 c1 a0 6e 03 00    	add    $0x36ea0,%ecx
   32af4:	52                   	push   %edx
   32af5:	53                   	push   %ebx
   32af6:	50                   	push   %eax
   32af7:	51                   	push   %ecx
   32af8:	e8 b9 fd ff ff       	call   328b6 <InitDescriptor>
   32afd:	83 c4 10             	add    $0x10,%esp
   32b00:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   32b04:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
   32b08:	7e 91                	jle    32a9b <init_propt+0xdd>
   32b0a:	68 f2 00 00 00       	push   $0xf2
   32b0f:	68 ff ff 00 00       	push   $0xffff
   32b14:	68 00 80 0b 00       	push   $0xb8000
   32b19:	68 d8 6e 03 00       	push   $0x36ed8
   32b1e:	e8 93 fd ff ff       	call   328b6 <InitDescriptor>
   32b23:	83 c4 10             	add    $0x10,%esp
   32b26:	90                   	nop
   32b27:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   32b2a:	c9                   	leave  
   32b2b:	c3                   	ret    

00032b2c <InitInterruptDesc>:
   32b2c:	55                   	push   %ebp
   32b2d:	89 e5                	mov    %esp,%ebp
   32b2f:	83 ec 10             	sub    $0x10,%esp
   32b32:	8b 45 08             	mov    0x8(%ebp),%eax
   32b35:	c1 e0 03             	shl    $0x3,%eax
   32b38:	05 40 9c 03 00       	add    $0x39c40,%eax
   32b3d:	89 45 fc             	mov    %eax,-0x4(%ebp)
   32b40:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32b43:	c6 40 04 00          	movb   $0x0,0x4(%eax)
   32b47:	8b 45 0c             	mov    0xc(%ebp),%eax
   32b4a:	89 45 f8             	mov    %eax,-0x8(%ebp)
   32b4d:	8b 45 f8             	mov    -0x8(%ebp),%eax
   32b50:	89 c2                	mov    %eax,%edx
   32b52:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32b55:	66 89 10             	mov    %dx,(%eax)
   32b58:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32b5b:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
   32b61:	8b 45 f8             	mov    -0x8(%ebp),%eax
   32b64:	c1 f8 10             	sar    $0x10,%eax
   32b67:	89 c2                	mov    %eax,%edx
   32b69:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32b6c:	66 89 50 06          	mov    %dx,0x6(%eax)
   32b70:	8b 45 10             	mov    0x10(%ebp),%eax
   32b73:	c1 e0 04             	shl    $0x4,%eax
   32b76:	89 c2                	mov    %eax,%edx
   32b78:	8b 45 14             	mov    0x14(%ebp),%eax
   32b7b:	09 d0                	or     %edx,%eax
   32b7d:	89 c2                	mov    %eax,%edx
   32b7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32b82:	88 50 05             	mov    %dl,0x5(%eax)
   32b85:	90                   	nop
   32b86:	c9                   	leave  
   32b87:	c3                   	ret    

00032b88 <ReloadGDT>:
   32b88:	55                   	push   %ebp
   32b89:	89 e5                	mov    %esp,%ebp
   32b8b:	83 ec 28             	sub    $0x28,%esp
   32b8e:	b8 34 9c 03 00       	mov    $0x39c34,%eax
   32b93:	0f b7 00             	movzwl (%eax),%eax
   32b96:	98                   	cwtl   
   32b97:	ba 36 9c 03 00       	mov    $0x39c36,%edx
   32b9c:	8b 12                	mov    (%edx),%edx
   32b9e:	83 ec 04             	sub    $0x4,%esp
   32ba1:	50                   	push   %eax
   32ba2:	52                   	push   %edx
   32ba3:	68 a0 6e 03 00       	push   $0x36ea0
   32ba8:	e8 b7 10 00 00       	call   33c64 <Memcpy>
   32bad:	83 c4 10             	add    $0x10,%esp
   32bb0:	c7 45 f0 34 9c 03 00 	movl   $0x39c34,-0x10(%ebp)
   32bb7:	c7 45 ec 36 9c 03 00 	movl   $0x39c36,-0x14(%ebp)
   32bbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32bc1:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   32bc6:	ba a0 6e 03 00       	mov    $0x36ea0,%edx
   32bcb:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32bce:	89 10                	mov    %edx,(%eax)
   32bd0:	c7 45 e8 88 6e 03 00 	movl   $0x36e88,-0x18(%ebp)
   32bd7:	c7 45 e4 8a 6e 03 00 	movl   $0x36e8a,-0x1c(%ebp)
   32bde:	8b 45 e8             	mov    -0x18(%ebp),%eax
   32be1:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   32be6:	ba 40 9c 03 00       	mov    $0x39c40,%edx
   32beb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32bee:	89 10                	mov    %edx,(%eax)
   32bf0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   32bf7:	eb 04                	jmp    32bfd <ReloadGDT+0x75>
   32bf9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   32bfd:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
   32c04:	7e f3                	jle    32bf9 <ReloadGDT+0x71>
   32c06:	e8 12 de ff ff       	call   30a1d <init_internal_interrupt>
   32c0b:	e8 ae fd ff ff       	call   329be <init_propt>
   32c10:	90                   	nop
   32c11:	c9                   	leave  
   32c12:	c3                   	ret    

00032c13 <select_console>:
   32c13:	55                   	push   %ebp
   32c14:	89 e5                	mov    %esp,%ebp
   32c16:	83 ec 18             	sub    $0x18,%esp
   32c19:	8b 45 08             	mov    0x8(%ebp),%eax
   32c1c:	88 45 f4             	mov    %al,-0xc(%ebp)
   32c1f:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
   32c23:	77 27                	ja     32c4c <select_console+0x39>
   32c25:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
   32c29:	69 c0 90 0c 00 00    	imul   $0xc90,%eax,%eax
   32c2f:	05 00 76 03 00       	add    $0x37600,%eax
   32c34:	a3 80 6e 03 00       	mov    %eax,0x36e80
   32c39:	a1 80 6e 03 00       	mov    0x36e80,%eax
   32c3e:	83 ec 0c             	sub    $0xc,%esp
   32c41:	50                   	push   %eax
   32c42:	e8 08 00 00 00       	call   32c4f <flush>
   32c47:	83 c4 10             	add    $0x10,%esp
   32c4a:	eb 01                	jmp    32c4d <select_console+0x3a>
   32c4c:	90                   	nop
   32c4d:	c9                   	leave  
   32c4e:	c3                   	ret    

00032c4f <flush>:
   32c4f:	55                   	push   %ebp
   32c50:	89 e5                	mov    %esp,%ebp
   32c52:	83 ec 08             	sub    $0x8,%esp
   32c55:	8b 45 08             	mov    0x8(%ebp),%eax
   32c58:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32c5e:	8b 40 0c             	mov    0xc(%eax),%eax
   32c61:	83 ec 0c             	sub    $0xc,%esp
   32c64:	50                   	push   %eax
   32c65:	e8 1e 00 00 00       	call   32c88 <set_cursor>
   32c6a:	83 c4 10             	add    $0x10,%esp
   32c6d:	8b 45 08             	mov    0x8(%ebp),%eax
   32c70:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32c76:	8b 40 08             	mov    0x8(%eax),%eax
   32c79:	83 ec 0c             	sub    $0xc,%esp
   32c7c:	50                   	push   %eax
   32c7d:	e8 64 00 00 00       	call   32ce6 <set_console_start_video_addr>
   32c82:	83 c4 10             	add    $0x10,%esp
   32c85:	90                   	nop
   32c86:	c9                   	leave  
   32c87:	c3                   	ret    

00032c88 <set_cursor>:
   32c88:	55                   	push   %ebp
   32c89:	89 e5                	mov    %esp,%ebp
   32c8b:	83 ec 08             	sub    $0x8,%esp
   32c8e:	83 ec 08             	sub    $0x8,%esp
   32c91:	6a 0e                	push   $0xe
   32c93:	68 d4 03 00 00       	push   $0x3d4
   32c98:	e8 3b da ff ff       	call   306d8 <out_byte>
   32c9d:	83 c4 10             	add    $0x10,%esp
   32ca0:	8b 45 08             	mov    0x8(%ebp),%eax
   32ca3:	c1 e8 08             	shr    $0x8,%eax
   32ca6:	0f b7 c0             	movzwl %ax,%eax
   32ca9:	83 ec 08             	sub    $0x8,%esp
   32cac:	50                   	push   %eax
   32cad:	68 d5 03 00 00       	push   $0x3d5
   32cb2:	e8 21 da ff ff       	call   306d8 <out_byte>
   32cb7:	83 c4 10             	add    $0x10,%esp
   32cba:	83 ec 08             	sub    $0x8,%esp
   32cbd:	6a 0f                	push   $0xf
   32cbf:	68 d4 03 00 00       	push   $0x3d4
   32cc4:	e8 0f da ff ff       	call   306d8 <out_byte>
   32cc9:	83 c4 10             	add    $0x10,%esp
   32ccc:	8b 45 08             	mov    0x8(%ebp),%eax
   32ccf:	0f b7 c0             	movzwl %ax,%eax
   32cd2:	83 ec 08             	sub    $0x8,%esp
   32cd5:	50                   	push   %eax
   32cd6:	68 d5 03 00 00       	push   $0x3d5
   32cdb:	e8 f8 d9 ff ff       	call   306d8 <out_byte>
   32ce0:	83 c4 10             	add    $0x10,%esp
   32ce3:	90                   	nop
   32ce4:	c9                   	leave  
   32ce5:	c3                   	ret    

00032ce6 <set_console_start_video_addr>:
   32ce6:	55                   	push   %ebp
   32ce7:	89 e5                	mov    %esp,%ebp
   32ce9:	83 ec 08             	sub    $0x8,%esp
   32cec:	83 ec 08             	sub    $0x8,%esp
   32cef:	6a 0c                	push   $0xc
   32cf1:	68 d4 03 00 00       	push   $0x3d4
   32cf6:	e8 dd d9 ff ff       	call   306d8 <out_byte>
   32cfb:	83 c4 10             	add    $0x10,%esp
   32cfe:	8b 45 08             	mov    0x8(%ebp),%eax
   32d01:	c1 e8 08             	shr    $0x8,%eax
   32d04:	0f b7 c0             	movzwl %ax,%eax
   32d07:	83 ec 08             	sub    $0x8,%esp
   32d0a:	50                   	push   %eax
   32d0b:	68 d5 03 00 00       	push   $0x3d5
   32d10:	e8 c3 d9 ff ff       	call   306d8 <out_byte>
   32d15:	83 c4 10             	add    $0x10,%esp
   32d18:	83 ec 08             	sub    $0x8,%esp
   32d1b:	6a 0d                	push   $0xd
   32d1d:	68 d4 03 00 00       	push   $0x3d4
   32d22:	e8 b1 d9 ff ff       	call   306d8 <out_byte>
   32d27:	83 c4 10             	add    $0x10,%esp
   32d2a:	8b 45 08             	mov    0x8(%ebp),%eax
   32d2d:	0f b7 c0             	movzwl %ax,%eax
   32d30:	83 ec 08             	sub    $0x8,%esp
   32d33:	50                   	push   %eax
   32d34:	68 d5 03 00 00       	push   $0x3d5
   32d39:	e8 9a d9 ff ff       	call   306d8 <out_byte>
   32d3e:	83 c4 10             	add    $0x10,%esp
   32d41:	90                   	nop
   32d42:	c9                   	leave  
   32d43:	c3                   	ret    

00032d44 <put_key>:
   32d44:	55                   	push   %ebp
   32d45:	89 e5                	mov    %esp,%ebp
   32d47:	83 ec 04             	sub    $0x4,%esp
   32d4a:	8b 45 0c             	mov    0xc(%ebp),%eax
   32d4d:	88 45 fc             	mov    %al,-0x4(%ebp)
   32d50:	8b 45 08             	mov    0x8(%ebp),%eax
   32d53:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   32d59:	3d 1f 03 00 00       	cmp    $0x31f,%eax
   32d5e:	77 4d                	ja     32dad <put_key+0x69>
   32d60:	8b 45 08             	mov    0x8(%ebp),%eax
   32d63:	8b 00                	mov    (%eax),%eax
   32d65:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
   32d69:	89 10                	mov    %edx,(%eax)
   32d6b:	8b 45 08             	mov    0x8(%ebp),%eax
   32d6e:	8b 00                	mov    (%eax),%eax
   32d70:	8d 50 04             	lea    0x4(%eax),%edx
   32d73:	8b 45 08             	mov    0x8(%ebp),%eax
   32d76:	89 10                	mov    %edx,(%eax)
   32d78:	8b 45 08             	mov    0x8(%ebp),%eax
   32d7b:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   32d81:	8d 50 01             	lea    0x1(%eax),%edx
   32d84:	8b 45 08             	mov    0x8(%ebp),%eax
   32d87:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
   32d8d:	8b 45 08             	mov    0x8(%ebp),%eax
   32d90:	8b 00                	mov    (%eax),%eax
   32d92:	8b 55 08             	mov    0x8(%ebp),%edx
   32d95:	83 c2 08             	add    $0x8,%edx
   32d98:	81 c2 80 0c 00 00    	add    $0xc80,%edx
   32d9e:	39 d0                	cmp    %edx,%eax
   32da0:	75 0b                	jne    32dad <put_key+0x69>
   32da2:	8b 45 08             	mov    0x8(%ebp),%eax
   32da5:	8d 50 08             	lea    0x8(%eax),%edx
   32da8:	8b 45 08             	mov    0x8(%ebp),%eax
   32dab:	89 10                	mov    %edx,(%eax)
   32dad:	90                   	nop
   32dae:	c9                   	leave  
   32daf:	c3                   	ret    

00032db0 <scroll_up>:
   32db0:	55                   	push   %ebp
   32db1:	89 e5                	mov    %esp,%ebp
   32db3:	83 ec 08             	sub    $0x8,%esp
   32db6:	8b 45 08             	mov    0x8(%ebp),%eax
   32db9:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32dbf:	8b 50 08             	mov    0x8(%eax),%edx
   32dc2:	8b 45 08             	mov    0x8(%ebp),%eax
   32dc5:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32dcb:	8b 00                	mov    (%eax),%eax
   32dcd:	39 c2                	cmp    %eax,%edx
   32dcf:	76 1d                	jbe    32dee <scroll_up+0x3e>
   32dd1:	8b 45 08             	mov    0x8(%ebp),%eax
   32dd4:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32dda:	8b 40 08             	mov    0x8(%eax),%eax
   32ddd:	2d d0 07 00 00       	sub    $0x7d0,%eax
   32de2:	83 ec 0c             	sub    $0xc,%esp
   32de5:	50                   	push   %eax
   32de6:	e8 fb fe ff ff       	call   32ce6 <set_console_start_video_addr>
   32deb:	83 c4 10             	add    $0x10,%esp
   32dee:	90                   	nop
   32def:	c9                   	leave  
   32df0:	c3                   	ret    

00032df1 <scroll_down>:
   32df1:	55                   	push   %ebp
   32df2:	89 e5                	mov    %esp,%ebp
   32df4:	83 ec 08             	sub    $0x8,%esp
   32df7:	8b 45 08             	mov    0x8(%ebp),%eax
   32dfa:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32e00:	8b 40 08             	mov    0x8(%eax),%eax
   32e03:	8d 88 a0 0f 00 00    	lea    0xfa0(%eax),%ecx
   32e09:	8b 45 08             	mov    0x8(%ebp),%eax
   32e0c:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32e12:	8b 10                	mov    (%eax),%edx
   32e14:	8b 45 08             	mov    0x8(%ebp),%eax
   32e17:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32e1d:	8b 40 04             	mov    0x4(%eax),%eax
   32e20:	01 d0                	add    %edx,%eax
   32e22:	39 c1                	cmp    %eax,%ecx
   32e24:	73 3b                	jae    32e61 <scroll_down+0x70>
   32e26:	8b 45 08             	mov    0x8(%ebp),%eax
   32e29:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32e2f:	8b 40 08             	mov    0x8(%eax),%eax
   32e32:	05 d0 07 00 00       	add    $0x7d0,%eax
   32e37:	83 ec 0c             	sub    $0xc,%esp
   32e3a:	50                   	push   %eax
   32e3b:	e8 a6 fe ff ff       	call   32ce6 <set_console_start_video_addr>
   32e40:	83 c4 10             	add    $0x10,%esp
   32e43:	8b 45 08             	mov    0x8(%ebp),%eax
   32e46:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32e4c:	8b 50 08             	mov    0x8(%eax),%edx
   32e4f:	8b 45 08             	mov    0x8(%ebp),%eax
   32e52:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32e58:	81 c2 d0 07 00 00    	add    $0x7d0,%edx
   32e5e:	89 50 08             	mov    %edx,0x8(%eax)
   32e61:	90                   	nop
   32e62:	c9                   	leave  
   32e63:	c3                   	ret    

00032e64 <out_char>:
   32e64:	55                   	push   %ebp
   32e65:	89 e5                	mov    %esp,%ebp
   32e67:	83 ec 28             	sub    $0x28,%esp
   32e6a:	8b 45 0c             	mov    0xc(%ebp),%eax
   32e6d:	88 45 e4             	mov    %al,-0x1c(%ebp)
   32e70:	8b 45 08             	mov    0x8(%ebp),%eax
   32e73:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32e79:	8b 40 0c             	mov    0xc(%eax),%eax
   32e7c:	05 00 c0 05 00       	add    $0x5c000,%eax
   32e81:	01 c0                	add    %eax,%eax
   32e83:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32e86:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
   32e8a:	83 f8 08             	cmp    $0x8,%eax
   32e8d:	0f 84 8d 00 00 00    	je     32f20 <out_char+0xbc>
   32e93:	83 f8 0a             	cmp    $0xa,%eax
   32e96:	0f 85 c9 00 00 00    	jne    32f65 <out_char+0x101>
   32e9c:	8b 45 08             	mov    0x8(%ebp),%eax
   32e9f:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32ea5:	8b 50 0c             	mov    0xc(%eax),%edx
   32ea8:	8b 45 08             	mov    0x8(%ebp),%eax
   32eab:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32eb1:	8b 08                	mov    (%eax),%ecx
   32eb3:	8b 45 08             	mov    0x8(%ebp),%eax
   32eb6:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32ebc:	8b 40 04             	mov    0x4(%eax),%eax
   32ebf:	01 c8                	add    %ecx,%eax
   32ec1:	83 e8 50             	sub    $0x50,%eax
   32ec4:	39 c2                	cmp    %eax,%edx
   32ec6:	0f 83 f4 00 00 00    	jae    32fc0 <out_char+0x15c>
   32ecc:	8b 45 08             	mov    0x8(%ebp),%eax
   32ecf:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32ed5:	8b 08                	mov    (%eax),%ecx
   32ed7:	8b 45 08             	mov    0x8(%ebp),%eax
   32eda:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32ee0:	8b 50 0c             	mov    0xc(%eax),%edx
   32ee3:	8b 45 08             	mov    0x8(%ebp),%eax
   32ee6:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32eec:	8b 00                	mov    (%eax),%eax
   32eee:	29 c2                	sub    %eax,%edx
   32ef0:	89 d0                	mov    %edx,%eax
   32ef2:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
   32ef7:	f7 e2                	mul    %edx
   32ef9:	89 d0                	mov    %edx,%eax
   32efb:	c1 e8 06             	shr    $0x6,%eax
   32efe:	8d 50 01             	lea    0x1(%eax),%edx
   32f01:	89 d0                	mov    %edx,%eax
   32f03:	c1 e0 02             	shl    $0x2,%eax
   32f06:	01 d0                	add    %edx,%eax
   32f08:	c1 e0 04             	shl    $0x4,%eax
   32f0b:	89 c2                	mov    %eax,%edx
   32f0d:	8b 45 08             	mov    0x8(%ebp),%eax
   32f10:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f16:	01 ca                	add    %ecx,%edx
   32f18:	89 50 0c             	mov    %edx,0xc(%eax)
   32f1b:	e9 a0 00 00 00       	jmp    32fc0 <out_char+0x15c>
   32f20:	8b 45 08             	mov    0x8(%ebp),%eax
   32f23:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f29:	8b 50 0c             	mov    0xc(%eax),%edx
   32f2c:	8b 45 08             	mov    0x8(%ebp),%eax
   32f2f:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f35:	8b 00                	mov    (%eax),%eax
   32f37:	39 c2                	cmp    %eax,%edx
   32f39:	0f 86 84 00 00 00    	jbe    32fc3 <out_char+0x15f>
   32f3f:	8b 45 08             	mov    0x8(%ebp),%eax
   32f42:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f48:	8b 50 0c             	mov    0xc(%eax),%edx
   32f4b:	83 ea 01             	sub    $0x1,%edx
   32f4e:	89 50 0c             	mov    %edx,0xc(%eax)
   32f51:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32f54:	83 e8 02             	sub    $0x2,%eax
   32f57:	c6 00 20             	movb   $0x20,(%eax)
   32f5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32f5d:	83 e8 01             	sub    $0x1,%eax
   32f60:	c6 00 00             	movb   $0x0,(%eax)
   32f63:	eb 5e                	jmp    32fc3 <out_char+0x15f>
   32f65:	8b 45 08             	mov    0x8(%ebp),%eax
   32f68:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f6e:	8b 40 0c             	mov    0xc(%eax),%eax
   32f71:	8d 48 01             	lea    0x1(%eax),%ecx
   32f74:	8b 45 08             	mov    0x8(%ebp),%eax
   32f77:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f7d:	8b 10                	mov    (%eax),%edx
   32f7f:	8b 45 08             	mov    0x8(%ebp),%eax
   32f82:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f88:	8b 40 04             	mov    0x4(%eax),%eax
   32f8b:	01 d0                	add    %edx,%eax
   32f8d:	39 c1                	cmp    %eax,%ecx
   32f8f:	73 35                	jae    32fc6 <out_char+0x162>
   32f91:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32f94:	8d 50 01             	lea    0x1(%eax),%edx
   32f97:	89 55 f4             	mov    %edx,-0xc(%ebp)
   32f9a:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
   32f9e:	88 10                	mov    %dl,(%eax)
   32fa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32fa3:	8d 50 01             	lea    0x1(%eax),%edx
   32fa6:	89 55 f4             	mov    %edx,-0xc(%ebp)
   32fa9:	c6 00 0a             	movb   $0xa,(%eax)
   32fac:	8b 45 08             	mov    0x8(%ebp),%eax
   32faf:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32fb5:	8b 50 0c             	mov    0xc(%eax),%edx
   32fb8:	83 c2 01             	add    $0x1,%edx
   32fbb:	89 50 0c             	mov    %edx,0xc(%eax)
   32fbe:	eb 06                	jmp    32fc6 <out_char+0x162>
   32fc0:	90                   	nop
   32fc1:	eb 14                	jmp    32fd7 <out_char+0x173>
   32fc3:	90                   	nop
   32fc4:	eb 11                	jmp    32fd7 <out_char+0x173>
   32fc6:	90                   	nop
   32fc7:	eb 0e                	jmp    32fd7 <out_char+0x173>
   32fc9:	83 ec 0c             	sub    $0xc,%esp
   32fcc:	ff 75 08             	pushl  0x8(%ebp)
   32fcf:	e8 1d fe ff ff       	call   32df1 <scroll_down>
   32fd4:	83 c4 10             	add    $0x10,%esp
   32fd7:	8b 45 08             	mov    0x8(%ebp),%eax
   32fda:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32fe0:	8b 50 0c             	mov    0xc(%eax),%edx
   32fe3:	8b 45 08             	mov    0x8(%ebp),%eax
   32fe6:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32fec:	8b 40 08             	mov    0x8(%eax),%eax
   32fef:	29 c2                	sub    %eax,%edx
   32ff1:	89 d0                	mov    %edx,%eax
   32ff3:	3d d0 07 00 00       	cmp    $0x7d0,%eax
   32ff8:	77 cf                	ja     32fc9 <out_char+0x165>
   32ffa:	83 ec 0c             	sub    $0xc,%esp
   32ffd:	ff 75 08             	pushl  0x8(%ebp)
   33000:	e8 4a fc ff ff       	call   32c4f <flush>
   33005:	83 c4 10             	add    $0x10,%esp
   33008:	90                   	nop
   33009:	c9                   	leave  
   3300a:	c3                   	ret    

0003300b <tty_do_read>:
   3300b:	55                   	push   %ebp
   3300c:	89 e5                	mov    %esp,%ebp
   3300e:	83 ec 08             	sub    $0x8,%esp
   33011:	a1 80 6e 03 00       	mov    0x36e80,%eax
   33016:	39 45 08             	cmp    %eax,0x8(%ebp)
   33019:	75 17                	jne    33032 <tty_do_read+0x27>
   3301b:	a1 c8 72 03 00       	mov    0x372c8,%eax
   33020:	85 c0                	test   %eax,%eax
   33022:	7e 0e                	jle    33032 <tty_do_read+0x27>
   33024:	83 ec 0c             	sub    $0xc,%esp
   33027:	ff 75 08             	pushl  0x8(%ebp)
   3302a:	e8 d8 02 00 00       	call   33307 <keyboard_read>
   3302f:	83 c4 10             	add    $0x10,%esp
   33032:	90                   	nop
   33033:	c9                   	leave  
   33034:	c3                   	ret    

00033035 <tty_do_write>:
   33035:	55                   	push   %ebp
   33036:	89 e5                	mov    %esp,%ebp
   33038:	83 ec 18             	sub    $0x18,%esp
   3303b:	eb 64                	jmp    330a1 <tty_do_write+0x6c>
   3303d:	8b 45 08             	mov    0x8(%ebp),%eax
   33040:	8b 40 04             	mov    0x4(%eax),%eax
   33043:	8b 00                	mov    (%eax),%eax
   33045:	88 45 f7             	mov    %al,-0x9(%ebp)
   33048:	8b 45 08             	mov    0x8(%ebp),%eax
   3304b:	8b 40 04             	mov    0x4(%eax),%eax
   3304e:	8d 50 04             	lea    0x4(%eax),%edx
   33051:	8b 45 08             	mov    0x8(%ebp),%eax
   33054:	89 50 04             	mov    %edx,0x4(%eax)
   33057:	8b 45 08             	mov    0x8(%ebp),%eax
   3305a:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   33060:	8d 50 ff             	lea    -0x1(%eax),%edx
   33063:	8b 45 08             	mov    0x8(%ebp),%eax
   33066:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
   3306c:	8b 45 08             	mov    0x8(%ebp),%eax
   3306f:	8b 40 04             	mov    0x4(%eax),%eax
   33072:	8b 55 08             	mov    0x8(%ebp),%edx
   33075:	83 c2 08             	add    $0x8,%edx
   33078:	81 c2 80 0c 00 00    	add    $0xc80,%edx
   3307e:	39 d0                	cmp    %edx,%eax
   33080:	75 0c                	jne    3308e <tty_do_write+0x59>
   33082:	8b 45 08             	mov    0x8(%ebp),%eax
   33085:	8d 50 08             	lea    0x8(%eax),%edx
   33088:	8b 45 08             	mov    0x8(%ebp),%eax
   3308b:	89 50 04             	mov    %edx,0x4(%eax)
   3308e:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   33092:	83 ec 08             	sub    $0x8,%esp
   33095:	50                   	push   %eax
   33096:	ff 75 08             	pushl  0x8(%ebp)
   33099:	e8 c6 fd ff ff       	call   32e64 <out_char>
   3309e:	83 c4 10             	add    $0x10,%esp
   330a1:	8b 45 08             	mov    0x8(%ebp),%eax
   330a4:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   330aa:	85 c0                	test   %eax,%eax
   330ac:	75 8f                	jne    3303d <tty_do_write+0x8>
   330ae:	90                   	nop
   330af:	c9                   	leave  
   330b0:	c3                   	ret    

000330b1 <init_screen>:
   330b1:	55                   	push   %ebp
   330b2:	89 e5                	mov    %esp,%ebp
   330b4:	83 ec 10             	sub    $0x10,%esp
   330b7:	8b 45 08             	mov    0x8(%ebp),%eax
   330ba:	2d 00 76 03 00       	sub    $0x37600,%eax
   330bf:	c1 f8 04             	sar    $0x4,%eax
   330c2:	69 c0 79 19 8c 02    	imul   $0x28c1979,%eax,%eax
   330c8:	89 45 fc             	mov    %eax,-0x4(%ebp)
   330cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
   330ce:	c1 e0 04             	shl    $0x4,%eax
   330d1:	8d 90 60 a4 03 00    	lea    0x3a460(%eax),%edx
   330d7:	8b 45 08             	mov    0x8(%ebp),%eax
   330da:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
   330e0:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
   330e7:	8b 45 08             	mov    0x8(%ebp),%eax
   330ea:	8b 88 8c 0c 00 00    	mov    0xc8c(%eax),%ecx
   330f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
   330f3:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
   330f8:	f7 e2                	mul    %edx
   330fa:	89 d0                	mov    %edx,%eax
   330fc:	d1 e8                	shr    %eax
   330fe:	89 41 04             	mov    %eax,0x4(%ecx)
   33101:	8b 45 08             	mov    0x8(%ebp),%eax
   33104:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   3310a:	8b 50 04             	mov    0x4(%eax),%edx
   3310d:	8b 45 08             	mov    0x8(%ebp),%eax
   33110:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   33116:	0f af 55 fc          	imul   -0x4(%ebp),%edx
   3311a:	89 10                	mov    %edx,(%eax)
   3311c:	8b 45 08             	mov    0x8(%ebp),%eax
   3311f:	8b 90 8c 0c 00 00    	mov    0xc8c(%eax),%edx
   33125:	8b 45 08             	mov    0x8(%ebp),%eax
   33128:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   3312e:	8b 12                	mov    (%edx),%edx
   33130:	89 50 08             	mov    %edx,0x8(%eax)
   33133:	8b 55 08             	mov    0x8(%ebp),%edx
   33136:	8b 92 8c 0c 00 00    	mov    0xc8c(%edx),%edx
   3313c:	8b 40 08             	mov    0x8(%eax),%eax
   3313f:	89 42 0c             	mov    %eax,0xc(%edx)
   33142:	90                   	nop
   33143:	c9                   	leave  
   33144:	c3                   	ret    

00033145 <init_tty>:
   33145:	55                   	push   %ebp
   33146:	89 e5                	mov    %esp,%ebp
   33148:	83 ec 18             	sub    $0x18,%esp
   3314b:	c7 45 f4 00 76 03 00 	movl   $0x37600,-0xc(%ebp)
   33152:	eb 7a                	jmp    331ce <init_tty+0x89>
   33154:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33157:	8d 50 08             	lea    0x8(%eax),%edx
   3315a:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3315d:	89 50 04             	mov    %edx,0x4(%eax)
   33160:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33163:	8b 50 04             	mov    0x4(%eax),%edx
   33166:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33169:	89 10                	mov    %edx,(%eax)
   3316b:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3316e:	c7 80 88 0c 00 00 00 	movl   $0x0,0xc88(%eax)
   33175:	00 00 00 
   33178:	ff 75 f4             	pushl  -0xc(%ebp)
   3317b:	e8 31 ff ff ff       	call   330b1 <init_screen>
   33180:	83 c4 04             	add    $0x4,%esp
   33183:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33186:	2d 00 76 03 00       	sub    $0x37600,%eax
   3318b:	85 c0                	test   %eax,%eax
   3318d:	7e 38                	jle    331c7 <init_tty+0x82>
   3318f:	83 ec 08             	sub    $0x8,%esp
   33192:	6a 23                	push   $0x23
   33194:	ff 75 f4             	pushl  -0xc(%ebp)
   33197:	e8 c8 fc ff ff       	call   32e64 <out_char>
   3319c:	83 c4 10             	add    $0x10,%esp
   3319f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   331a2:	05 90 67 02 00       	add    $0x26790,%eax
   331a7:	2d 00 76 03 00       	sub    $0x37600,%eax
   331ac:	c1 f8 04             	sar    $0x4,%eax
   331af:	69 c0 79 19 8c 02    	imul   $0x28c1979,%eax,%eax
   331b5:	0f b6 c0             	movzbl %al,%eax
   331b8:	83 ec 08             	sub    $0x8,%esp
   331bb:	50                   	push   %eax
   331bc:	ff 75 f4             	pushl  -0xc(%ebp)
   331bf:	e8 a0 fc ff ff       	call   32e64 <out_char>
   331c4:	83 c4 10             	add    $0x10,%esp
   331c7:	81 45 f4 90 0c 00 00 	addl   $0xc90,-0xc(%ebp)
   331ce:	b8 b0 9b 03 00       	mov    $0x39bb0,%eax
   331d3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
   331d6:	0f 82 78 ff ff ff    	jb     33154 <init_tty+0xf>
   331dc:	90                   	nop
   331dd:	c9                   	leave  
   331de:	c3                   	ret    

000331df <TaskTTY>:
   331df:	55                   	push   %ebp
   331e0:	89 e5                	mov    %esp,%ebp
   331e2:	83 ec 18             	sub    $0x18,%esp
   331e5:	e8 5b ff ff ff       	call   33145 <init_tty>
   331ea:	83 ec 0c             	sub    $0xc,%esp
   331ed:	6a 00                	push   $0x0
   331ef:	e8 1f fa ff ff       	call   32c13 <select_console>
   331f4:	83 c4 10             	add    $0x10,%esp
   331f7:	c7 45 f4 00 76 03 00 	movl   $0x37600,-0xc(%ebp)
   331fe:	eb 23                	jmp    33223 <TaskTTY+0x44>
   33200:	83 ec 0c             	sub    $0xc,%esp
   33203:	ff 75 f4             	pushl  -0xc(%ebp)
   33206:	e8 00 fe ff ff       	call   3300b <tty_do_read>
   3320b:	83 c4 10             	add    $0x10,%esp
   3320e:	83 ec 0c             	sub    $0xc,%esp
   33211:	ff 75 f4             	pushl  -0xc(%ebp)
   33214:	e8 1c fe ff ff       	call   33035 <tty_do_write>
   33219:	83 c4 10             	add    $0x10,%esp
   3321c:	81 45 f4 90 0c 00 00 	addl   $0xc90,-0xc(%ebp)
   33223:	b8 b0 9b 03 00       	mov    $0x39bb0,%eax
   33228:	39 45 f4             	cmp    %eax,-0xc(%ebp)
   3322b:	72 d3                	jb     33200 <TaskTTY+0x21>
   3322d:	eb c8                	jmp    331f7 <TaskTTY+0x18>

0003322f <keyboard_handler>:
   3322f:	55                   	push   %ebp
   33230:	89 e5                	mov    %esp,%ebp
   33232:	83 ec 18             	sub    $0x18,%esp
   33235:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
   3323c:	a1 c8 72 03 00       	mov    0x372c8,%eax
   33241:	3d 1f 03 00 00       	cmp    $0x31f,%eax
   33246:	7f 5c                	jg     332a4 <keyboard_handler+0x75>
   33248:	e8 af d4 ff ff       	call   306fc <disable_int>
   3324d:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33250:	0f b7 c0             	movzwl %ax,%eax
   33253:	83 ec 0c             	sub    $0xc,%esp
   33256:	50                   	push   %eax
   33257:	e8 70 d4 ff ff       	call   306cc <in_byte>
   3325c:	83 c4 10             	add    $0x10,%esp
   3325f:	88 45 f3             	mov    %al,-0xd(%ebp)
   33262:	a1 c0 72 03 00       	mov    0x372c0,%eax
   33267:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
   3326b:	88 10                	mov    %dl,(%eax)
   3326d:	a1 c0 72 03 00       	mov    0x372c0,%eax
   33272:	83 c0 01             	add    $0x1,%eax
   33275:	a3 c0 72 03 00       	mov    %eax,0x372c0
   3327a:	a1 c8 72 03 00       	mov    0x372c8,%eax
   3327f:	83 c0 01             	add    $0x1,%eax
   33282:	a3 c8 72 03 00       	mov    %eax,0x372c8
   33287:	a1 c0 72 03 00       	mov    0x372c0,%eax
   3328c:	ba ec 75 03 00       	mov    $0x375ec,%edx
   33291:	39 d0                	cmp    %edx,%eax
   33293:	72 0a                	jb     3329f <keyboard_handler+0x70>
   33295:	c7 05 c0 72 03 00 cc 	movl   $0x372cc,0x372c0
   3329c:	72 03 00 
   3329f:	e8 5a d4 ff ff       	call   306fe <enable_int>
   332a4:	90                   	nop
   332a5:	c9                   	leave  
   332a6:	c3                   	ret    

000332a7 <read_from_keyboard_buf>:
   332a7:	55                   	push   %ebp
   332a8:	89 e5                	mov    %esp,%ebp
   332aa:	83 ec 18             	sub    $0x18,%esp
   332ad:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
   332b1:	a1 c8 72 03 00       	mov    0x372c8,%eax
   332b6:	85 c0                	test   %eax,%eax
   332b8:	7e 47                	jle    33301 <read_from_keyboard_buf+0x5a>
   332ba:	e8 3d d4 ff ff       	call   306fc <disable_int>
   332bf:	a1 c4 72 03 00       	mov    0x372c4,%eax
   332c4:	0f b6 00             	movzbl (%eax),%eax
   332c7:	88 45 f7             	mov    %al,-0x9(%ebp)
   332ca:	a1 c4 72 03 00       	mov    0x372c4,%eax
   332cf:	83 c0 01             	add    $0x1,%eax
   332d2:	a3 c4 72 03 00       	mov    %eax,0x372c4
   332d7:	a1 c8 72 03 00       	mov    0x372c8,%eax
   332dc:	83 e8 01             	sub    $0x1,%eax
   332df:	a3 c8 72 03 00       	mov    %eax,0x372c8
   332e4:	a1 c4 72 03 00       	mov    0x372c4,%eax
   332e9:	ba ec 75 03 00       	mov    $0x375ec,%edx
   332ee:	39 d0                	cmp    %edx,%eax
   332f0:	72 0a                	jb     332fc <read_from_keyboard_buf+0x55>
   332f2:	c7 05 c4 72 03 00 cc 	movl   $0x372cc,0x372c4
   332f9:	72 03 00 
   332fc:	e8 fd d3 ff ff       	call   306fe <enable_int>
   33301:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   33305:	c9                   	leave  
   33306:	c3                   	ret    

00033307 <keyboard_read>:
   33307:	55                   	push   %ebp
   33308:	89 e5                	mov    %esp,%ebp
   3330a:	83 ec 28             	sub    $0x28,%esp
   3330d:	90                   	nop
   3330e:	a1 c8 72 03 00       	mov    0x372c8,%eax
   33313:	85 c0                	test   %eax,%eax
   33315:	7e f7                	jle    3330e <keyboard_read+0x7>
   33317:	e8 8b ff ff ff       	call   332a7 <read_from_keyboard_buf>
   3331c:	88 45 ea             	mov    %al,-0x16(%ebp)
   3331f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   33326:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
   3332a:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
   3332e:	75 5a                	jne    3338a <keyboard_read+0x83>
   33330:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
   33334:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
   33338:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
   3333c:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
   33340:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
   33344:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
   33348:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
   3334c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
   33353:	eb 20                	jmp    33375 <keyboard_read+0x6e>
   33355:	e8 4d ff ff ff       	call   332a7 <read_from_keyboard_buf>
   3335a:	89 c1                	mov    %eax,%ecx
   3335c:	8d 55 e3             	lea    -0x1d(%ebp),%edx
   3335f:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33362:	01 d0                	add    %edx,%eax
   33364:	0f b6 00             	movzbl (%eax),%eax
   33367:	38 c1                	cmp    %al,%cl
   33369:	74 06                	je     33371 <keyboard_read+0x6a>
   3336b:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
   3336f:	eb 0a                	jmp    3337b <keyboard_read+0x74>
   33371:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   33375:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
   33379:	7e da                	jle    33355 <keyboard_read+0x4e>
   3337b:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
   3337f:	74 68                	je     333e9 <keyboard_read+0xe2>
   33381:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
   33388:	eb 5f                	jmp    333e9 <keyboard_read+0xe2>
   3338a:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
   3338e:	75 59                	jne    333e9 <keyboard_read+0xe2>
   33390:	e8 12 ff ff ff       	call   332a7 <read_from_keyboard_buf>
   33395:	3c 2a                	cmp    $0x2a,%al
   33397:	75 1d                	jne    333b6 <keyboard_read+0xaf>
   33399:	e8 09 ff ff ff       	call   332a7 <read_from_keyboard_buf>
   3339e:	3c e0                	cmp    $0xe0,%al
   333a0:	75 14                	jne    333b6 <keyboard_read+0xaf>
   333a2:	e8 00 ff ff ff       	call   332a7 <read_from_keyboard_buf>
   333a7:	3c 37                	cmp    $0x37,%al
   333a9:	75 0b                	jne    333b6 <keyboard_read+0xaf>
   333ab:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
   333b2:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
   333b6:	e8 ec fe ff ff       	call   332a7 <read_from_keyboard_buf>
   333bb:	3c b7                	cmp    $0xb7,%al
   333bd:	75 1d                	jne    333dc <keyboard_read+0xd5>
   333bf:	e8 e3 fe ff ff       	call   332a7 <read_from_keyboard_buf>
   333c4:	3c e0                	cmp    $0xe0,%al
   333c6:	75 14                	jne    333dc <keyboard_read+0xd5>
   333c8:	e8 da fe ff ff       	call   332a7 <read_from_keyboard_buf>
   333cd:	3c aa                	cmp    $0xaa,%al
   333cf:	75 0b                	jne    333dc <keyboard_read+0xd5>
   333d1:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
   333d8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
   333dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   333e0:	75 07                	jne    333e9 <keyboard_read+0xe2>
   333e2:	c6 05 84 6e 03 00 01 	movb   $0x1,0x36e84
   333e9:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
   333f0:	0f 84 8d 00 00 00    	je     33483 <keyboard_read+0x17c>
   333f6:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
   333fd:	0f 84 80 00 00 00    	je     33483 <keyboard_read+0x17c>
   33403:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
   33407:	0f 94 c2             	sete   %dl
   3340a:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
   3340e:	0f 94 c0             	sete   %al
   33411:	09 d0                	or     %edx,%eax
   33413:	84 c0                	test   %al,%al
   33415:	74 07                	je     3341e <keyboard_read+0x117>
   33417:	c6 05 30 9c 03 00 01 	movb   $0x1,0x39c30
   3341e:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
   33422:	f7 d0                	not    %eax
   33424:	c0 e8 07             	shr    $0x7,%al
   33427:	88 45 e9             	mov    %al,-0x17(%ebp)
   3342a:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
   3342e:	74 53                	je     33483 <keyboard_read+0x17c>
   33430:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
   33434:	74 4d                	je     33483 <keyboard_read+0x17c>
   33436:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
   3343a:	0f b6 05 30 9c 03 00 	movzbl 0x39c30,%eax
   33441:	3c 01                	cmp    $0x1,%al
   33443:	75 04                	jne    33449 <keyboard_read+0x142>
   33445:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
   33449:	0f b6 05 84 6e 03 00 	movzbl 0x36e84,%eax
   33450:	84 c0                	test   %al,%al
   33452:	74 04                	je     33458 <keyboard_read+0x151>
   33454:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
   33458:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
   3345c:	89 d0                	mov    %edx,%eax
   3345e:	01 c0                	add    %eax,%eax
   33460:	01 c2                	add    %eax,%edx
   33462:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
   33466:	01 d0                	add    %edx,%eax
   33468:	8b 04 85 80 60 03 00 	mov    0x36080(,%eax,4),%eax
   3346f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   33472:	83 ec 08             	sub    $0x8,%esp
   33475:	ff 75 f4             	pushl  -0xc(%ebp)
   33478:	ff 75 08             	pushl  0x8(%ebp)
   3347b:	e8 1a 00 00 00       	call   3349a <in_process>
   33480:	83 c4 10             	add    $0x10,%esp
   33483:	90                   	nop
   33484:	c9                   	leave  
   33485:	c3                   	ret    

00033486 <init_keyboard_handler>:
   33486:	55                   	push   %ebp
   33487:	89 e5                	mov    %esp,%ebp
   33489:	c6 05 84 6e 03 00 00 	movb   $0x0,0x36e84
   33490:	c6 05 30 9c 03 00 00 	movb   $0x0,0x39c30
   33497:	90                   	nop
   33498:	5d                   	pop    %ebp
   33499:	c3                   	ret    

0003349a <in_process>:
   3349a:	55                   	push   %ebp
   3349b:	89 e5                	mov    %esp,%ebp
   3349d:	83 ec 18             	sub    $0x18,%esp
   334a0:	83 ec 04             	sub    $0x4,%esp
   334a3:	6a 02                	push   $0x2
   334a5:	6a 00                	push   $0x0
   334a7:	8d 45 f6             	lea    -0xa(%ebp),%eax
   334aa:	50                   	push   %eax
   334ab:	e8 e2 07 00 00       	call   33c92 <Memset>
   334b0:	83 c4 10             	add    $0x10,%esp
   334b3:	8b 45 0c             	mov    0xc(%ebp),%eax
   334b6:	25 00 01 00 00       	and    $0x100,%eax
   334bb:	85 c0                	test   %eax,%eax
   334bd:	75 28                	jne    334e7 <in_process+0x4d>
   334bf:	8b 45 0c             	mov    0xc(%ebp),%eax
   334c2:	0f b6 c0             	movzbl %al,%eax
   334c5:	83 ec 08             	sub    $0x8,%esp
   334c8:	50                   	push   %eax
   334c9:	ff 75 08             	pushl  0x8(%ebp)
   334cc:	e8 73 f8 ff ff       	call   32d44 <put_key>
   334d1:	83 c4 10             	add    $0x10,%esp
   334d4:	c6 05 84 6e 03 00 00 	movb   $0x0,0x36e84
   334db:	c6 05 30 9c 03 00 00 	movb   $0x0,0x39c30
   334e2:	e9 42 01 00 00       	jmp    33629 <in_process+0x18f>
   334e7:	0f b6 05 30 9c 03 00 	movzbl 0x39c30,%eax
   334ee:	84 c0                	test   %al,%al
   334f0:	0f 84 a9 00 00 00    	je     3359f <in_process+0x105>
   334f6:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
   334fa:	0f 84 9f 00 00 00    	je     3359f <in_process+0x105>
   33500:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
   33504:	0f 84 95 00 00 00    	je     3359f <in_process+0x105>
   3350a:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   33511:	74 64                	je     33577 <in_process+0xdd>
   33513:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   3351a:	77 0b                	ja     33527 <in_process+0x8d>
   3351c:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
   33523:	74 64                	je     33589 <in_process+0xef>
   33525:	eb 73                	jmp    3359a <in_process+0x100>
   33527:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
   3352e:	74 0b                	je     3353b <in_process+0xa1>
   33530:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
   33537:	74 20                	je     33559 <in_process+0xbf>
   33539:	eb 5f                	jmp    3359a <in_process+0x100>
   3353b:	83 ec 0c             	sub    $0xc,%esp
   3353e:	ff 75 08             	pushl  0x8(%ebp)
   33541:	e8 6a f8 ff ff       	call   32db0 <scroll_up>
   33546:	83 c4 10             	add    $0x10,%esp
   33549:	c6 05 30 9c 03 00 00 	movb   $0x0,0x39c30
   33550:	c6 05 84 6e 03 00 00 	movb   $0x0,0x36e84
   33557:	eb 41                	jmp    3359a <in_process+0x100>
   33559:	83 ec 0c             	sub    $0xc,%esp
   3355c:	ff 75 08             	pushl  0x8(%ebp)
   3355f:	e8 8d f8 ff ff       	call   32df1 <scroll_down>
   33564:	83 c4 10             	add    $0x10,%esp
   33567:	c6 05 30 9c 03 00 00 	movb   $0x0,0x39c30
   3356e:	c6 05 84 6e 03 00 00 	movb   $0x0,0x36e84
   33575:	eb 23                	jmp    3359a <in_process+0x100>
   33577:	83 ec 08             	sub    $0x8,%esp
   3357a:	6a 0a                	push   $0xa
   3357c:	ff 75 08             	pushl  0x8(%ebp)
   3357f:	e8 e0 f8 ff ff       	call   32e64 <out_char>
   33584:	83 c4 10             	add    $0x10,%esp
   33587:	eb 11                	jmp    3359a <in_process+0x100>
   33589:	83 ec 08             	sub    $0x8,%esp
   3358c:	6a 08                	push   $0x8
   3358e:	ff 75 08             	pushl  0x8(%ebp)
   33591:	e8 ce f8 ff ff       	call   32e64 <out_char>
   33596:	83 c4 10             	add    $0x10,%esp
   33599:	90                   	nop
   3359a:	e9 8a 00 00 00       	jmp    33629 <in_process+0x18f>
   3359f:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
   335a6:	74 55                	je     335fd <in_process+0x163>
   335a8:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
   335af:	77 14                	ja     335c5 <in_process+0x12b>
   335b1:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
   335b8:	74 31                	je     335eb <in_process+0x151>
   335ba:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   335c1:	74 16                	je     335d9 <in_process+0x13f>
   335c3:	eb 64                	jmp    33629 <in_process+0x18f>
   335c5:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
   335cc:	74 3e                	je     3360c <in_process+0x172>
   335ce:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
   335d5:	74 44                	je     3361b <in_process+0x181>
   335d7:	eb 50                	jmp    33629 <in_process+0x18f>
   335d9:	83 ec 08             	sub    $0x8,%esp
   335dc:	6a 0a                	push   $0xa
   335de:	ff 75 08             	pushl  0x8(%ebp)
   335e1:	e8 5e f7 ff ff       	call   32d44 <put_key>
   335e6:	83 c4 10             	add    $0x10,%esp
   335e9:	eb 3e                	jmp    33629 <in_process+0x18f>
   335eb:	83 ec 08             	sub    $0x8,%esp
   335ee:	6a 08                	push   $0x8
   335f0:	ff 75 08             	pushl  0x8(%ebp)
   335f3:	e8 4c f7 ff ff       	call   32d44 <put_key>
   335f8:	83 c4 10             	add    $0x10,%esp
   335fb:	eb 2c                	jmp    33629 <in_process+0x18f>
   335fd:	83 ec 0c             	sub    $0xc,%esp
   33600:	6a 00                	push   $0x0
   33602:	e8 0c f6 ff ff       	call   32c13 <select_console>
   33607:	83 c4 10             	add    $0x10,%esp
   3360a:	eb 1d                	jmp    33629 <in_process+0x18f>
   3360c:	83 ec 0c             	sub    $0xc,%esp
   3360f:	6a 01                	push   $0x1
   33611:	e8 fd f5 ff ff       	call   32c13 <select_console>
   33616:	83 c4 10             	add    $0x10,%esp
   33619:	eb 0e                	jmp    33629 <in_process+0x18f>
   3361b:	83 ec 0c             	sub    $0xc,%esp
   3361e:	6a 02                	push   $0x2
   33620:	e8 ee f5 ff ff       	call   32c13 <select_console>
   33625:	83 c4 10             	add    $0x10,%esp
   33628:	90                   	nop
   33629:	90                   	nop
   3362a:	c9                   	leave  
   3362b:	c3                   	ret    
