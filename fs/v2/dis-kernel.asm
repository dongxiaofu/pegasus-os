
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	66 87 db             	xchg   %bx,%bx
   30403:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   3040a:	00 00 00 
   3040d:	b4 0b                	mov    $0xb,%ah
   3040f:	b0 4c                	mov    $0x4c,%al
   30411:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
   30418:	bc 80 6e 03 00       	mov    $0x36e80,%esp
   3041d:	66 c7 05 90 6e 03 00 	movw   $0x0,0x36e90
   30424:	00 00 
   30426:	0f 01 05 34 9c 03 00 	sgdtl  0x39c34
   3042d:	e8 37 28 00 00       	call   32c69 <ReloadGDT>
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
   3058e:	e8 79 23 00 00       	call   3290c <clock_handler>
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
   305d7:	e8 34 2d 00 00       	call   33310 <keyboard_handler>
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
   30625:	e8 50 18 00 00       	call   31e7a <hd_handle>
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
   3089b:	bb 40 39 03 00       	mov    $0x33940,%ebx
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
   308c3:	68 20 37 03 00       	push   $0x33720
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
   3090c:	68 22 37 03 00       	push   $0x33722
   30911:	e8 6d fb ff ff       	call   30483 <disp_str>
   30916:	83 c4 10             	add    $0x10,%esp
   30919:	83 ec 08             	sub    $0x8,%esp
   3091c:	ff 75 e0             	pushl  -0x20(%ebp)
   3091f:	68 25 37 03 00       	push   $0x33725
   30924:	e8 95 fb ff ff       	call   304be <disp_str_colour>
   30929:	83 c4 10             	add    $0x10,%esp
   3092c:	83 ec 0c             	sub    $0xc,%esp
   3092f:	ff 75 08             	pushl  0x8(%ebp)
   30932:	e8 2f ff ff ff       	call   30866 <disp_int>
   30937:	83 c4 10             	add    $0x10,%esp
   3093a:	83 ec 0c             	sub    $0xc,%esp
   3093d:	68 22 37 03 00       	push   $0x33722
   30942:	e8 3c fb ff ff       	call   30483 <disp_str>
   30947:	83 c4 10             	add    $0x10,%esp
   3094a:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   3094e:	74 31                	je     30981 <exception_handler+0xf2>
   30950:	83 ec 08             	sub    $0x8,%esp
   30953:	ff 75 e0             	pushl  -0x20(%ebp)
   30956:	68 2d 37 03 00       	push   $0x3372d
   3095b:	e8 5e fb ff ff       	call   304be <disp_str_colour>
   30960:	83 c4 10             	add    $0x10,%esp
   30963:	83 ec 0c             	sub    $0xc,%esp
   30966:	ff 75 0c             	pushl  0xc(%ebp)
   30969:	e8 f8 fe ff ff       	call   30866 <disp_int>
   3096e:	83 c4 10             	add    $0x10,%esp
   30971:	83 ec 0c             	sub    $0xc,%esp
   30974:	68 22 37 03 00       	push   $0x33722
   30979:	e8 05 fb ff ff       	call   30483 <disp_str>
   3097e:	83 c4 10             	add    $0x10,%esp
   30981:	83 ec 08             	sub    $0x8,%esp
   30984:	ff 75 e0             	pushl  -0x20(%ebp)
   30987:	68 37 37 03 00       	push   $0x33737
   3098c:	e8 2d fb ff ff       	call   304be <disp_str_colour>
   30991:	83 c4 10             	add    $0x10,%esp
   30994:	83 ec 0c             	sub    $0xc,%esp
   30997:	ff 75 14             	pushl  0x14(%ebp)
   3099a:	e8 c7 fe ff ff       	call   30866 <disp_int>
   3099f:	83 c4 10             	add    $0x10,%esp
   309a2:	83 ec 0c             	sub    $0xc,%esp
   309a5:	68 22 37 03 00       	push   $0x33722
   309aa:	e8 d4 fa ff ff       	call   30483 <disp_str>
   309af:	83 c4 10             	add    $0x10,%esp
   309b2:	83 ec 08             	sub    $0x8,%esp
   309b5:	ff 75 e0             	pushl  -0x20(%ebp)
   309b8:	68 3b 37 03 00       	push   $0x3373b
   309bd:	e8 fc fa ff ff       	call   304be <disp_str_colour>
   309c2:	83 c4 10             	add    $0x10,%esp
   309c5:	83 ec 0c             	sub    $0xc,%esp
   309c8:	ff 75 10             	pushl  0x10(%ebp)
   309cb:	e8 96 fe ff ff       	call   30866 <disp_int>
   309d0:	83 c4 10             	add    $0x10,%esp
   309d3:	83 ec 0c             	sub    $0xc,%esp
   309d6:	68 22 37 03 00       	push   $0x33722
   309db:	e8 a3 fa ff ff       	call   30483 <disp_str>
   309e0:	83 c4 10             	add    $0x10,%esp
   309e3:	83 ec 08             	sub    $0x8,%esp
   309e6:	ff 75 e0             	pushl  -0x20(%ebp)
   309e9:	68 40 37 03 00       	push   $0x33740
   309ee:	e8 cb fa ff ff       	call   304be <disp_str_colour>
   309f3:	83 c4 10             	add    $0x10,%esp
   309f6:	83 ec 0c             	sub    $0xc,%esp
   309f9:	ff 75 18             	pushl  0x18(%ebp)
   309fc:	e8 65 fe ff ff       	call   30866 <disp_int>
   30a01:	83 c4 10             	add    $0x10,%esp
   30a04:	83 ec 0c             	sub    $0xc,%esp
   30a07:	68 22 37 03 00       	push   $0x33722
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
   30a2e:	e8 da 21 00 00       	call   32c0d <InitInterruptDesc>
   30a33:	83 c4 10             	add    $0x10,%esp
   30a36:	6a 0e                	push   $0xe
   30a38:	6a 08                	push   $0x8
   30a3a:	68 00 05 03 00       	push   $0x30500
   30a3f:	6a 01                	push   $0x1
   30a41:	e8 c7 21 00 00       	call   32c0d <InitInterruptDesc>
   30a46:	83 c4 10             	add    $0x10,%esp
   30a49:	6a 0e                	push   $0xe
   30a4b:	6a 08                	push   $0x8
   30a4d:	68 06 05 03 00       	push   $0x30506
   30a52:	6a 02                	push   $0x2
   30a54:	e8 b4 21 00 00       	call   32c0d <InitInterruptDesc>
   30a59:	83 c4 10             	add    $0x10,%esp
   30a5c:	6a 0e                	push   $0xe
   30a5e:	6a 08                	push   $0x8
   30a60:	68 0c 05 03 00       	push   $0x3050c
   30a65:	6a 03                	push   $0x3
   30a67:	e8 a1 21 00 00       	call   32c0d <InitInterruptDesc>
   30a6c:	83 c4 10             	add    $0x10,%esp
   30a6f:	6a 0e                	push   $0xe
   30a71:	6a 08                	push   $0x8
   30a73:	68 12 05 03 00       	push   $0x30512
   30a78:	6a 04                	push   $0x4
   30a7a:	e8 8e 21 00 00       	call   32c0d <InitInterruptDesc>
   30a7f:	83 c4 10             	add    $0x10,%esp
   30a82:	6a 0e                	push   $0xe
   30a84:	6a 08                	push   $0x8
   30a86:	68 18 05 03 00       	push   $0x30518
   30a8b:	6a 05                	push   $0x5
   30a8d:	e8 7b 21 00 00       	call   32c0d <InitInterruptDesc>
   30a92:	83 c4 10             	add    $0x10,%esp
   30a95:	6a 0e                	push   $0xe
   30a97:	6a 08                	push   $0x8
   30a99:	68 1e 05 03 00       	push   $0x3051e
   30a9e:	6a 06                	push   $0x6
   30aa0:	e8 68 21 00 00       	call   32c0d <InitInterruptDesc>
   30aa5:	83 c4 10             	add    $0x10,%esp
   30aa8:	6a 0e                	push   $0xe
   30aaa:	6a 08                	push   $0x8
   30aac:	68 24 05 03 00       	push   $0x30524
   30ab1:	6a 07                	push   $0x7
   30ab3:	e8 55 21 00 00       	call   32c0d <InitInterruptDesc>
   30ab8:	83 c4 10             	add    $0x10,%esp
   30abb:	6a 0e                	push   $0xe
   30abd:	6a 08                	push   $0x8
   30abf:	68 2a 05 03 00       	push   $0x3052a
   30ac4:	6a 08                	push   $0x8
   30ac6:	e8 42 21 00 00       	call   32c0d <InitInterruptDesc>
   30acb:	83 c4 10             	add    $0x10,%esp
   30ace:	6a 0e                	push   $0xe
   30ad0:	6a 08                	push   $0x8
   30ad2:	68 2e 05 03 00       	push   $0x3052e
   30ad7:	6a 09                	push   $0x9
   30ad9:	e8 2f 21 00 00       	call   32c0d <InitInterruptDesc>
   30ade:	83 c4 10             	add    $0x10,%esp
   30ae1:	6a 0e                	push   $0xe
   30ae3:	6a 08                	push   $0x8
   30ae5:	68 34 05 03 00       	push   $0x30534
   30aea:	6a 0a                	push   $0xa
   30aec:	e8 1c 21 00 00       	call   32c0d <InitInterruptDesc>
   30af1:	83 c4 10             	add    $0x10,%esp
   30af4:	6a 0e                	push   $0xe
   30af6:	6a 08                	push   $0x8
   30af8:	68 38 05 03 00       	push   $0x30538
   30afd:	6a 0b                	push   $0xb
   30aff:	e8 09 21 00 00       	call   32c0d <InitInterruptDesc>
   30b04:	83 c4 10             	add    $0x10,%esp
   30b07:	6a 0e                	push   $0xe
   30b09:	6a 08                	push   $0x8
   30b0b:	68 3c 05 03 00       	push   $0x3053c
   30b10:	6a 0c                	push   $0xc
   30b12:	e8 f6 20 00 00       	call   32c0d <InitInterruptDesc>
   30b17:	83 c4 10             	add    $0x10,%esp
   30b1a:	6a 0e                	push   $0xe
   30b1c:	6a 08                	push   $0x8
   30b1e:	68 40 05 03 00       	push   $0x30540
   30b23:	6a 0d                	push   $0xd
   30b25:	e8 e3 20 00 00       	call   32c0d <InitInterruptDesc>
   30b2a:	83 c4 10             	add    $0x10,%esp
   30b2d:	6a 0e                	push   $0xe
   30b2f:	6a 08                	push   $0x8
   30b31:	68 44 05 03 00       	push   $0x30544
   30b36:	6a 0e                	push   $0xe
   30b38:	e8 d0 20 00 00       	call   32c0d <InitInterruptDesc>
   30b3d:	83 c4 10             	add    $0x10,%esp
   30b40:	6a 0e                	push   $0xe
   30b42:	6a 08                	push   $0x8
   30b44:	68 48 05 03 00       	push   $0x30548
   30b49:	6a 10                	push   $0x10
   30b4b:	e8 bd 20 00 00       	call   32c0d <InitInterruptDesc>
   30b50:	83 c4 10             	add    $0x10,%esp
   30b53:	6a 0e                	push   $0xe
   30b55:	6a 08                	push   $0x8
   30b57:	68 4e 05 03 00       	push   $0x3054e
   30b5c:	6a 11                	push   $0x11
   30b5e:	e8 aa 20 00 00       	call   32c0d <InitInterruptDesc>
   30b63:	83 c4 10             	add    $0x10,%esp
   30b66:	6a 0e                	push   $0xe
   30b68:	6a 08                	push   $0x8
   30b6a:	68 52 05 03 00       	push   $0x30552
   30b6f:	6a 12                	push   $0x12
   30b71:	e8 97 20 00 00       	call   32c0d <InitInterruptDesc>
   30b76:	83 c4 10             	add    $0x10,%esp
   30b79:	6a 0e                	push   $0xe
   30b7b:	6a 0e                	push   $0xe
   30b7d:	68 3f 06 03 00       	push   $0x3063f
   30b82:	68 90 00 00 00       	push   $0x90
   30b87:	e8 81 20 00 00       	call   32c0d <InitInterruptDesc>
   30b8c:	83 c4 10             	add    $0x10,%esp
   30b8f:	90                   	nop
   30b90:	c9                   	leave  
   30b91:	c3                   	ret    

00030b92 <test>:
   30b92:	55                   	push   %ebp
   30b93:	89 e5                	mov    %esp,%ebp
   30b95:	83 ec 18             	sub    $0x18,%esp
   30b98:	83 ec 0c             	sub    $0xc,%esp
   30b9b:	68 8c 39 03 00       	push   $0x3398c
   30ba0:	e8 de f8 ff ff       	call   30483 <disp_str>
   30ba5:	83 c4 10             	add    $0x10,%esp
   30ba8:	83 ec 0c             	sub    $0xc,%esp
   30bab:	6a 06                	push   $0x6
   30bad:	e8 b4 fc ff ff       	call   30866 <disp_int>
   30bb2:	83 c4 10             	add    $0x10,%esp
   30bb5:	83 ec 0c             	sub    $0xc,%esp
   30bb8:	68 8e 39 03 00       	push   $0x3398e
   30bbd:	e8 c1 f8 ff ff       	call   30483 <disp_str>
   30bc2:	83 c4 10             	add    $0x10,%esp
   30bc5:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   30bcc:	00 00 00 
   30bcf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30bd6:	eb 14                	jmp    30bec <test+0x5a>
   30bd8:	83 ec 0c             	sub    $0xc,%esp
   30bdb:	68 20 37 03 00       	push   $0x33720
   30be0:	e8 9e f8 ff ff       	call   30483 <disp_str>
   30be5:	83 c4 10             	add    $0x10,%esp
   30be8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30bec:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
   30bf3:	7e e3                	jle    30bd8 <test+0x46>
   30bf5:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   30bfc:	00 00 00 
   30bff:	83 ec 08             	sub    $0x8,%esp
   30c02:	6a 0f                	push   $0xf
   30c04:	68 90 39 03 00       	push   $0x33990
   30c09:	e8 b0 f8 ff ff       	call   304be <disp_str_colour>
   30c0e:	83 c4 10             	add    $0x10,%esp
   30c11:	83 ec 0c             	sub    $0xc,%esp
   30c14:	68 8e 39 03 00       	push   $0x3398e
   30c19:	e8 65 f8 ff ff       	call   30483 <disp_str>
   30c1e:	83 c4 10             	add    $0x10,%esp
   30c21:	83 ec 0c             	sub    $0xc,%esp
   30c24:	68 89 00 00 00       	push   $0x89
   30c29:	e8 38 fc ff ff       	call   30866 <disp_int>
   30c2e:	83 c4 10             	add    $0x10,%esp
   30c31:	83 ec 0c             	sub    $0xc,%esp
   30c34:	68 8e 39 03 00       	push   $0x3398e
   30c39:	e8 45 f8 ff ff       	call   30483 <disp_str>
   30c3e:	83 c4 10             	add    $0x10,%esp
   30c41:	83 ec 08             	sub    $0x8,%esp
   30c44:	6a 0f                	push   $0xf
   30c46:	68 90 39 03 00       	push   $0x33990
   30c4b:	e8 6e f8 ff ff       	call   304be <disp_str_colour>
   30c50:	83 c4 10             	add    $0x10,%esp
   30c53:	83 ec 08             	sub    $0x8,%esp
   30c56:	6a 74                	push   $0x74
   30c58:	68 90 39 03 00       	push   $0x33990
   30c5d:	e8 5c f8 ff ff       	call   304be <disp_str_colour>
   30c62:	83 c4 10             	add    $0x10,%esp
   30c65:	83 ec 0c             	sub    $0xc,%esp
   30c68:	68 8e 39 03 00       	push   $0x3398e
   30c6d:	e8 11 f8 ff ff       	call   30483 <disp_str>
   30c72:	83 c4 10             	add    $0x10,%esp
   30c75:	83 ec 08             	sub    $0x8,%esp
   30c78:	6a 0f                	push   $0xf
   30c7a:	68 a0 39 03 00       	push   $0x339a0
   30c7f:	e8 3a f8 ff ff       	call   304be <disp_str_colour>
   30c84:	83 c4 10             	add    $0x10,%esp
   30c87:	83 ec 0c             	sub    $0xc,%esp
   30c8a:	68 c9 39 03 00       	push   $0x339c9
   30c8f:	e8 ef f7 ff ff       	call   30483 <disp_str>
   30c94:	83 c4 10             	add    $0x10,%esp
   30c97:	83 ec 0c             	sub    $0xc,%esp
   30c9a:	68 dd 39 03 00       	push   $0x339dd
   30c9f:	e8 df f7 ff ff       	call   30483 <disp_str>
   30ca4:	83 c4 10             	add    $0x10,%esp
   30ca7:	83 ec 0c             	sub    $0xc,%esp
   30caa:	6a 17                	push   $0x17
   30cac:	e8 b5 fb ff ff       	call   30866 <disp_int>
   30cb1:	83 c4 10             	add    $0x10,%esp
   30cb4:	83 ec 0c             	sub    $0xc,%esp
   30cb7:	68 8e 39 03 00       	push   $0x3398e
   30cbc:	e8 c2 f7 ff ff       	call   30483 <disp_str>
   30cc1:	83 c4 10             	add    $0x10,%esp
   30cc4:	83 ec 0c             	sub    $0xc,%esp
   30cc7:	68 0a 02 00 00       	push   $0x20a
   30ccc:	e8 95 fb ff ff       	call   30866 <disp_int>
   30cd1:	83 c4 10             	add    $0x10,%esp
   30cd4:	83 ec 0c             	sub    $0xc,%esp
   30cd7:	68 8e 39 03 00       	push   $0x3398e
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
   30cf8:	68 ec 39 03 00       	push   $0x339ec
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
   30d23:	68 13 3a 03 00       	push   $0x33a13
   30d28:	e8 56 f7 ff ff       	call   30483 <disp_str>
   30d2d:	83 c4 10             	add    $0x10,%esp
   30d30:	a1 40 a4 03 00       	mov    0x3a440,%eax
   30d35:	83 ec 0c             	sub    $0xc,%esp
   30d38:	50                   	push   %eax
   30d39:	e8 28 fb ff ff       	call   30866 <disp_int>
   30d3e:	83 c4 10             	add    $0x10,%esp
   30d41:	83 ec 0c             	sub    $0xc,%esp
   30d44:	68 15 3a 03 00       	push   $0x33a15
   30d49:	e8 35 f7 ff ff       	call   30483 <disp_str>
   30d4e:	83 c4 10             	add    $0x10,%esp
   30d51:	83 ec 08             	sub    $0x8,%esp
   30d54:	6a 0c                	push   $0xc
   30d56:	68 18 3a 03 00       	push   $0x33a18
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
   30e6b:	e8 ee 2e 00 00       	call   33d5e <Memcpy>
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
   30e96:	e8 c3 2e 00 00       	call   33d5e <Memcpy>
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
   30f54:	e8 33 2e 00 00       	call   33d8c <Memset>
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
   30f90:	68 20 37 03 00       	push   $0x33720
   30f95:	e8 e9 f4 ff ff       	call   30483 <disp_str>
   30f9a:	83 c4 10             	add    $0x10,%esp
   30f9d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
   30fa1:	81 7d e0 9f 0f 00 00 	cmpl   $0xf9f,-0x20(%ebp)
   30fa8:	7e e3                	jle    30f8d <kernel_main+0x227>
   30faa:	c7 05 90 6e 03 00 00 	movl   $0x0,0x36e90
   30fb1:	00 00 00 
   30fb4:	e8 ae 25 00 00       	call   33567 <init_keyboard_handler>
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
   30fd8:	68 3d 3a 03 00       	push   $0x33a3d
   30fdd:	68 3d 3a 03 00       	push   $0x33a3d
   30fe2:	68 44 3a 03 00       	push   $0x33a44
   30fe7:	e8 1c 05 00 00       	call   31508 <assertion_failure>
   30fec:	83 c4 10             	add    $0x10,%esp
   30fef:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   30ff3:	77 16                	ja     3100b <TestA+0x4b>
   30ff5:	e8 28 0d 00 00       	call   31d22 <get_ticks_ipc>
   30ffa:	83 ec 08             	sub    $0x8,%esp
   30ffd:	50                   	push   %eax
   30ffe:	68 49 3a 03 00       	push   $0x33a49
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
   3106b:	e8 b2 0c 00 00       	call   31d22 <get_ticks_ipc>
   31070:	83 ec 08             	sub    $0x8,%esp
   31073:	50                   	push   %eax
   31074:	68 4c 3a 03 00       	push   $0x33a4c
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
   310a7:	68 53 3a 03 00       	push   $0x33a53
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
   310fc:	e8 44 1e 00 00       	call   32f45 <out_char>
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
   3111b:	e8 02 0c 00 00       	call   31d22 <get_ticks_ipc>
   31120:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31123:	90                   	nop
   31124:	e8 f9 0b 00 00       	call   31d22 <get_ticks_ipc>
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
   31162:	e8 25 2c 00 00       	call   33d8c <Memset>
   31167:	83 c4 10             	add    $0x10,%esp
   3116a:	83 ec 08             	sub    $0x8,%esp
   3116d:	6a 11                	push   $0x11
   3116f:	8d 45 e0             	lea    -0x20(%ebp),%eax
   31172:	50                   	push   %eax
   31173:	e8 70 16 00 00       	call   327e8 <receive_msg>
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
   311a8:	e8 2b 16 00 00       	call   327d8 <send_msg>
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
   311d5:	e8 b2 2b 00 00       	call   33d8c <Memset>
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
   3120c:	e8 a7 15 00 00       	call   327b8 <write>
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
   3123a:	e8 4d 2b 00 00       	call   33d8c <Memset>
   3123f:	83 c4 10             	add    $0x10,%esp
   31242:	8b 45 10             	mov    0x10(%ebp),%eax
   31245:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31248:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   3124f:	8b 45 08             	mov    0x8(%ebp),%eax
   31252:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31255:	e9 53 01 00 00       	jmp    313ad <vsprintf+0x196>
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
   31275:	e9 2f 01 00 00       	jmp    313a9 <vsprintf+0x192>
   3127a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
   3127e:	8b 45 0c             	mov    0xc(%ebp),%eax
   31281:	0f b6 00             	movzbl (%eax),%eax
   31284:	0f be c0             	movsbl %al,%eax
   31287:	83 f8 64             	cmp    $0x64,%eax
   3128a:	74 26                	je     312b2 <vsprintf+0x9b>
   3128c:	83 f8 64             	cmp    $0x64,%eax
   3128f:	7f 0e                	jg     3129f <vsprintf+0x88>
   31291:	83 f8 63             	cmp    $0x63,%eax
   31294:	0f 84 f2 00 00 00    	je     3138c <vsprintf+0x175>
   3129a:	e9 0a 01 00 00       	jmp    313a9 <vsprintf+0x192>
   3129f:	83 f8 73             	cmp    $0x73,%eax
   312a2:	0f 84 b0 00 00 00    	je     31358 <vsprintf+0x141>
   312a8:	83 f8 78             	cmp    $0x78,%eax
   312ab:	74 5d                	je     3130a <vsprintf+0xf3>
   312ad:	e9 f7 00 00 00       	jmp    313a9 <vsprintf+0x192>
   312b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
   312b5:	8b 00                	mov    (%eax),%eax
   312b7:	89 45 e8             	mov    %eax,-0x18(%ebp)
   312ba:	83 ec 04             	sub    $0x4,%esp
   312bd:	6a 0a                	push   $0xa
   312bf:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
   312c5:	50                   	push   %eax
   312c6:	ff 75 e8             	pushl  -0x18(%ebp)
   312c9:	e8 95 0a 00 00       	call   31d63 <itoa>
   312ce:	83 c4 10             	add    $0x10,%esp
   312d1:	83 ec 08             	sub    $0x8,%esp
   312d4:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   312da:	50                   	push   %eax
   312db:	ff 75 f4             	pushl  -0xc(%ebp)
   312de:	e8 c8 2a 00 00       	call   33dab <Strcpy>
   312e3:	83 c4 10             	add    $0x10,%esp
   312e6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   312ea:	83 ec 0c             	sub    $0xc,%esp
   312ed:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   312f3:	50                   	push   %eax
   312f4:	e8 cc 2a 00 00       	call   33dc5 <Strlen>
   312f9:	83 c4 10             	add    $0x10,%esp
   312fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
   312ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31302:	01 45 f4             	add    %eax,-0xc(%ebp)
   31305:	e9 9f 00 00 00       	jmp    313a9 <vsprintf+0x192>
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
   3132f:	e8 77 2a 00 00       	call   33dab <Strcpy>
   31334:	83 c4 10             	add    $0x10,%esp
   31337:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   3133b:	83 ec 0c             	sub    $0xc,%esp
   3133e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   31344:	50                   	push   %eax
   31345:	e8 7b 2a 00 00       	call   33dc5 <Strlen>
   3134a:	83 c4 10             	add    $0x10,%esp
   3134d:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31350:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31353:	01 45 f4             	add    %eax,-0xc(%ebp)
   31356:	eb 51                	jmp    313a9 <vsprintf+0x192>
   31358:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3135b:	8b 00                	mov    (%eax),%eax
   3135d:	83 ec 08             	sub    $0x8,%esp
   31360:	50                   	push   %eax
   31361:	ff 75 f4             	pushl  -0xc(%ebp)
   31364:	e8 42 2a 00 00       	call   33dab <Strcpy>
   31369:	83 c4 10             	add    $0x10,%esp
   3136c:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3136f:	8b 00                	mov    (%eax),%eax
   31371:	83 ec 0c             	sub    $0xc,%esp
   31374:	50                   	push   %eax
   31375:	e8 4b 2a 00 00       	call   33dc5 <Strlen>
   3137a:	83 c4 10             	add    $0x10,%esp
   3137d:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31380:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   31384:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31387:	01 45 f4             	add    %eax,-0xc(%ebp)
   3138a:	eb 1d                	jmp    313a9 <vsprintf+0x192>
   3138c:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3138f:	0f b6 10             	movzbl (%eax),%edx
   31392:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31395:	88 10                	mov    %dl,(%eax)
   31397:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   3139b:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
   313a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
   313a5:	01 45 f4             	add    %eax,-0xc(%ebp)
   313a8:	90                   	nop
   313a9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
   313ad:	8b 45 0c             	mov    0xc(%ebp),%eax
   313b0:	0f b6 00             	movzbl (%eax),%eax
   313b3:	84 c0                	test   %al,%al
   313b5:	0f 85 9f fe ff ff    	jne    3125a <vsprintf+0x43>
   313bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
   313be:	2b 45 08             	sub    0x8(%ebp),%eax
   313c1:	c9                   	leave  
   313c2:	c3                   	ret    

000313c3 <printx>:
   313c3:	55                   	push   %ebp
   313c4:	89 e5                	mov    %esp,%ebp
   313c6:	81 ec 18 01 00 00    	sub    $0x118,%esp
   313cc:	8d 45 0c             	lea    0xc(%ebp),%eax
   313cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
   313d2:	8b 45 08             	mov    0x8(%ebp),%eax
   313d5:	83 ec 04             	sub    $0x4,%esp
   313d8:	ff 75 f4             	pushl  -0xc(%ebp)
   313db:	50                   	push   %eax
   313dc:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   313e2:	50                   	push   %eax
   313e3:	e8 2f fe ff ff       	call   31217 <vsprintf>
   313e8:	83 c4 10             	add    $0x10,%esp
   313eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
   313ee:	83 ec 08             	sub    $0x8,%esp
   313f1:	ff 75 f0             	pushl  -0x10(%ebp)
   313f4:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   313fa:	50                   	push   %eax
   313fb:	e8 c8 13 00 00       	call   327c8 <write_debug>
   31400:	83 c4 10             	add    $0x10,%esp
   31403:	90                   	nop
   31404:	c9                   	leave  
   31405:	c3                   	ret    

00031406 <sys_printx>:
   31406:	55                   	push   %ebp
   31407:	89 e5                	mov    %esp,%ebp
   31409:	83 ec 28             	sub    $0x28,%esp
   3140c:	a1 94 6e 03 00       	mov    0x36e94,%eax
   31411:	85 c0                	test   %eax,%eax
   31413:	75 20                	jne    31435 <sys_printx+0x2f>
   31415:	8b 45 10             	mov    0x10(%ebp),%eax
   31418:	8b 40 0c             	mov    0xc(%eax),%eax
   3141b:	89 45 ec             	mov    %eax,-0x14(%ebp)
   3141e:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31421:	83 ec 08             	sub    $0x8,%esp
   31424:	ff 75 10             	pushl  0x10(%ebp)
   31427:	50                   	push   %eax
   31428:	e8 18 16 00 00       	call   32a45 <Seg2PhyAddrLDT>
   3142d:	83 c4 10             	add    $0x10,%esp
   31430:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31433:	eb 19                	jmp    3144e <sys_printx+0x48>
   31435:	a1 94 6e 03 00       	mov    0x36e94,%eax
   3143a:	85 c0                	test   %eax,%eax
   3143c:	74 10                	je     3144e <sys_printx+0x48>
   3143e:	83 ec 0c             	sub    $0xc,%esp
   31441:	6a 30                	push   $0x30
   31443:	e8 bc 15 00 00       	call   32a04 <Seg2PhyAddr>
   31448:	83 c4 10             	add    $0x10,%esp
   3144b:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3144e:	8b 55 08             	mov    0x8(%ebp),%edx
   31451:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31454:	01 d0                	add    %edx,%eax
   31456:	89 45 e8             	mov    %eax,-0x18(%ebp)
   31459:	8b 45 10             	mov    0x10(%ebp),%eax
   3145c:	8b 40 64             	mov    0x64(%eax),%eax
   3145f:	69 c0 90 0c 00 00    	imul   $0xc90,%eax,%eax
   31465:	05 00 76 03 00       	add    $0x37600,%eax
   3146a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   3146d:	8b 45 e8             	mov    -0x18(%ebp),%eax
   31470:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31473:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31476:	0f b6 00             	movzbl (%eax),%eax
   31479:	88 45 e3             	mov    %al,-0x1d(%ebp)
   3147c:	eb 3a                	jmp    314b8 <sys_printx+0xb2>
   3147e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31481:	0f b6 00             	movzbl (%eax),%eax
   31484:	3c 3b                	cmp    $0x3b,%al
   31486:	74 0a                	je     31492 <sys_printx+0x8c>
   31488:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3148b:	0f b6 00             	movzbl (%eax),%eax
   3148e:	3c 3a                	cmp    $0x3a,%al
   31490:	75 06                	jne    31498 <sys_printx+0x92>
   31492:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   31496:	eb 20                	jmp    314b8 <sys_printx+0xb2>
   31498:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3149b:	0f b6 00             	movzbl (%eax),%eax
   3149e:	0f b6 c0             	movzbl %al,%eax
   314a1:	83 ec 08             	sub    $0x8,%esp
   314a4:	50                   	push   %eax
   314a5:	ff 75 e4             	pushl  -0x1c(%ebp)
   314a8:	e8 98 1a 00 00       	call   32f45 <out_char>
   314ad:	83 c4 10             	add    $0x10,%esp
   314b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   314b4:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
   314b8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   314bc:	7f c0                	jg     3147e <sys_printx+0x78>
   314be:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
   314c2:	75 11                	jne    314d5 <sys_printx+0xcf>
   314c4:	a1 94 6e 03 00       	mov    0x36e94,%eax
   314c9:	85 c0                	test   %eax,%eax
   314cb:	74 15                	je     314e2 <sys_printx+0xdc>
   314cd:	e8 2a f2 ff ff       	call   306fc <disable_int>
   314d2:	f4                   	hlt    
   314d3:	eb 0d                	jmp    314e2 <sys_printx+0xdc>
   314d5:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
   314d9:	75 07                	jne    314e2 <sys_printx+0xdc>
   314db:	e8 1c f2 ff ff       	call   306fc <disable_int>
   314e0:	f4                   	hlt    
   314e1:	90                   	nop
   314e2:	90                   	nop
   314e3:	c9                   	leave  
   314e4:	c3                   	ret    

000314e5 <spin>:
   314e5:	55                   	push   %ebp
   314e6:	89 e5                	mov    %esp,%ebp
   314e8:	eb fe                	jmp    314e8 <spin+0x3>

000314ea <panic>:
   314ea:	55                   	push   %ebp
   314eb:	89 e5                	mov    %esp,%ebp
   314ed:	83 ec 08             	sub    $0x8,%esp
   314f0:	83 ec 04             	sub    $0x4,%esp
   314f3:	ff 75 08             	pushl  0x8(%ebp)
   314f6:	6a 3a                	push   $0x3a
   314f8:	68 60 3a 03 00       	push   $0x33a60
   314fd:	e8 c1 fe ff ff       	call   313c3 <printx>
   31502:	83 c4 10             	add    $0x10,%esp
   31505:	90                   	nop
   31506:	c9                   	leave  
   31507:	c3                   	ret    

00031508 <assertion_failure>:
   31508:	55                   	push   %ebp
   31509:	89 e5                	mov    %esp,%ebp
   3150b:	83 ec 08             	sub    $0x8,%esp
   3150e:	83 ec 08             	sub    $0x8,%esp
   31511:	68 08 21 00 00       	push   $0x2108
   31516:	ff 75 10             	pushl  0x10(%ebp)
   31519:	ff 75 0c             	pushl  0xc(%ebp)
   3151c:	ff 75 08             	pushl  0x8(%ebp)
   3151f:	6a 3b                	push   $0x3b
   31521:	68 68 3a 03 00       	push   $0x33a68
   31526:	e8 98 fe ff ff       	call   313c3 <printx>
   3152b:	83 c4 20             	add    $0x20,%esp
   3152e:	83 ec 0c             	sub    $0xc,%esp
   31531:	68 9b 3a 03 00       	push   $0x33a9b
   31536:	e8 aa ff ff ff       	call   314e5 <spin>
   3153b:	83 c4 10             	add    $0x10,%esp
   3153e:	90                   	nop
   3153f:	c9                   	leave  
   31540:	c3                   	ret    

00031541 <dead_lock>:
   31541:	55                   	push   %ebp
   31542:	89 e5                	mov    %esp,%ebp
   31544:	83 ec 18             	sub    $0x18,%esp
   31547:	83 ec 0c             	sub    $0xc,%esp
   3154a:	ff 75 08             	pushl  0x8(%ebp)
   3154d:	e8 06 14 00 00       	call   32958 <pid2proc>
   31552:	83 c4 10             	add    $0x10,%esp
   31555:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31558:	83 ec 0c             	sub    $0xc,%esp
   3155b:	ff 75 0c             	pushl  0xc(%ebp)
   3155e:	e8 f5 13 00 00       	call   32958 <pid2proc>
   31563:	83 c4 10             	add    $0x10,%esp
   31566:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31569:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3156c:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31570:	3c 01                	cmp    $0x1,%al
   31572:	75 5a                	jne    315ce <dead_lock+0x8d>
   31574:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31577:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   3157d:	39 45 08             	cmp    %eax,0x8(%ebp)
   31580:	75 32                	jne    315b4 <dead_lock+0x73>
   31582:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31585:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31588:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3158b:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   31591:	83 ec 0c             	sub    $0xc,%esp
   31594:	50                   	push   %eax
   31595:	e8 be 13 00 00       	call   32958 <pid2proc>
   3159a:	83 c4 10             	add    $0x10,%esp
   3159d:	89 45 f0             	mov    %eax,-0x10(%ebp)
   315a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
   315a3:	8b 50 58             	mov    0x58(%eax),%edx
   315a6:	8b 45 08             	mov    0x8(%ebp),%eax
   315a9:	39 c2                	cmp    %eax,%edx
   315ab:	75 db                	jne    31588 <dead_lock+0x47>
   315ad:	b8 01 00 00 00       	mov    $0x1,%eax
   315b2:	eb 20                	jmp    315d4 <dead_lock+0x93>
   315b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
   315b7:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   315bd:	83 ec 0c             	sub    $0xc,%esp
   315c0:	50                   	push   %eax
   315c1:	e8 92 13 00 00       	call   32958 <pid2proc>
   315c6:	83 c4 10             	add    $0x10,%esp
   315c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
   315cc:	eb 9b                	jmp    31569 <dead_lock+0x28>
   315ce:	90                   	nop
   315cf:	b8 00 00 00 00       	mov    $0x0,%eax
   315d4:	c9                   	leave  
   315d5:	c3                   	ret    

000315d6 <sys_send_msg>:
   315d6:	55                   	push   %ebp
   315d7:	89 e5                	mov    %esp,%ebp
   315d9:	83 ec 38             	sub    $0x38,%esp
   315dc:	83 ec 0c             	sub    $0xc,%esp
   315df:	ff 75 0c             	pushl  0xc(%ebp)
   315e2:	e8 71 13 00 00       	call   32958 <pid2proc>
   315e7:	83 c4 10             	add    $0x10,%esp
   315ea:	89 45 ec             	mov    %eax,-0x14(%ebp)
   315ed:	83 ec 0c             	sub    $0xc,%esp
   315f0:	ff 75 10             	pushl  0x10(%ebp)
   315f3:	e8 80 13 00 00       	call   32978 <proc2pid>
   315f8:	83 c4 10             	add    $0x10,%esp
   315fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
   315fe:	8b 45 08             	mov    0x8(%ebp),%eax
   31601:	8b 55 e8             	mov    -0x18(%ebp),%edx
   31604:	89 10                	mov    %edx,(%eax)
   31606:	83 ec 08             	sub    $0x8,%esp
   31609:	ff 75 0c             	pushl  0xc(%ebp)
   3160c:	ff 75 e8             	pushl  -0x18(%ebp)
   3160f:	e8 2d ff ff ff       	call   31541 <dead_lock>
   31614:	83 c4 10             	add    $0x10,%esp
   31617:	83 f8 01             	cmp    $0x1,%eax
   3161a:	75 10                	jne    3162c <sys_send_msg+0x56>
   3161c:	83 ec 0c             	sub    $0xc,%esp
   3161f:	68 a7 3a 03 00       	push   $0x33aa7
   31624:	e8 c1 fe ff ff       	call   314ea <panic>
   31629:	83 c4 10             	add    $0x10,%esp
   3162c:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3162f:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31633:	3c 02                	cmp    $0x2,%al
   31635:	0f 85 94 01 00 00    	jne    317cf <sys_send_msg+0x1f9>
   3163b:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3163e:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   31644:	39 45 e8             	cmp    %eax,-0x18(%ebp)
   31647:	74 12                	je     3165b <sys_send_msg+0x85>
   31649:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3164c:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   31652:	83 f8 11             	cmp    $0x11,%eax
   31655:	0f 85 74 01 00 00    	jne    317cf <sys_send_msg+0x1f9>
   3165b:	8b 45 10             	mov    0x10(%ebp),%eax
   3165e:	8b 40 0c             	mov    0xc(%eax),%eax
   31661:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   31664:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31667:	83 ec 08             	sub    $0x8,%esp
   3166a:	ff 75 10             	pushl  0x10(%ebp)
   3166d:	50                   	push   %eax
   3166e:	e8 d2 13 00 00       	call   32a45 <Seg2PhyAddrLDT>
   31673:	83 c4 10             	add    $0x10,%esp
   31676:	89 45 e0             	mov    %eax,-0x20(%ebp)
   31679:	8b 55 e0             	mov    -0x20(%ebp),%edx
   3167c:	89 d0                	mov    %edx,%eax
   3167e:	01 c0                	add    %eax,%eax
   31680:	01 d0                	add    %edx,%eax
   31682:	c1 e0 02             	shl    $0x2,%eax
   31685:	89 c2                	mov    %eax,%edx
   31687:	8b 45 08             	mov    0x8(%ebp),%eax
   3168a:	01 d0                	add    %edx,%eax
   3168c:	89 45 dc             	mov    %eax,-0x24(%ebp)
   3168f:	c7 45 d8 0c 00 00 00 	movl   $0xc,-0x28(%ebp)
   31696:	8b 55 dc             	mov    -0x24(%ebp),%edx
   31699:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3169c:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   316a2:	83 ec 04             	sub    $0x4,%esp
   316a5:	ff 75 d8             	pushl  -0x28(%ebp)
   316a8:	52                   	push   %edx
   316a9:	50                   	push   %eax
   316aa:	e8 af 26 00 00       	call   33d5e <Memcpy>
   316af:	83 c4 10             	add    $0x10,%esp
   316b2:	8b 45 10             	mov    0x10(%ebp),%eax
   316b5:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   316bc:	00 00 00 
   316bf:	8b 45 10             	mov    0x10(%ebp),%eax
   316c2:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
   316c9:	00 00 00 
   316cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
   316cf:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   316d6:	00 00 00 
   316d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
   316dc:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
   316e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
   316e3:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
   316ea:	00 00 00 
   316ed:	83 ec 0c             	sub    $0xc,%esp
   316f0:	ff 75 ec             	pushl  -0x14(%ebp)
   316f3:	e8 20 06 00 00       	call   31d18 <unblock>
   316f8:	83 c4 10             	add    $0x10,%esp
   316fb:	8b 45 10             	mov    0x10(%ebp),%eax
   316fe:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31704:	85 c0                	test   %eax,%eax
   31706:	74 1c                	je     31724 <sys_send_msg+0x14e>
   31708:	68 f8 02 00 00       	push   $0x2f8
   3170d:	68 3d 3a 03 00       	push   $0x33a3d
   31712:	68 3d 3a 03 00       	push   $0x33a3d
   31717:	68 b2 3a 03 00       	push   $0x33ab2
   3171c:	e8 e7 fd ff ff       	call   31508 <assertion_failure>
   31721:	83 c4 10             	add    $0x10,%esp
   31724:	8b 45 10             	mov    0x10(%ebp),%eax
   31727:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   3172d:	85 c0                	test   %eax,%eax
   3172f:	74 1c                	je     3174d <sys_send_msg+0x177>
   31731:	68 f9 02 00 00       	push   $0x2f9
   31736:	68 3d 3a 03 00       	push   $0x33a3d
   3173b:	68 3d 3a 03 00       	push   $0x33a3d
   31740:	68 c5 3a 03 00       	push   $0x33ac5
   31745:	e8 be fd ff ff       	call   31508 <assertion_failure>
   3174a:	83 c4 10             	add    $0x10,%esp
   3174d:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31750:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31756:	85 c0                	test   %eax,%eax
   31758:	74 1c                	je     31776 <sys_send_msg+0x1a0>
   3175a:	68 fa 02 00 00       	push   $0x2fa
   3175f:	68 3d 3a 03 00       	push   $0x33a3d
   31764:	68 3d 3a 03 00       	push   $0x33a3d
   31769:	68 dc 3a 03 00       	push   $0x33adc
   3176e:	e8 95 fd ff ff       	call   31508 <assertion_failure>
   31773:	83 c4 10             	add    $0x10,%esp
   31776:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31779:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   3177d:	84 c0                	test   %al,%al
   3177f:	74 1c                	je     3179d <sys_send_msg+0x1c7>
   31781:	68 fb 02 00 00       	push   $0x2fb
   31786:	68 3d 3a 03 00       	push   $0x33a3d
   3178b:	68 3d 3a 03 00       	push   $0x33a3d
   31790:	68 f1 3a 03 00       	push   $0x33af1
   31795:	e8 6e fd ff ff       	call   31508 <assertion_failure>
   3179a:	83 c4 10             	add    $0x10,%esp
   3179d:	8b 45 ec             	mov    -0x14(%ebp),%eax
   317a0:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   317a6:	85 c0                	test   %eax,%eax
   317a8:	0f 84 63 01 00 00    	je     31911 <sys_send_msg+0x33b>
   317ae:	68 fc 02 00 00       	push   $0x2fc
   317b3:	68 3d 3a 03 00       	push   $0x33a3d
   317b8:	68 3d 3a 03 00       	push   $0x33a3d
   317bd:	68 07 3b 03 00       	push   $0x33b07
   317c2:	e8 41 fd ff ff       	call   31508 <assertion_failure>
   317c7:	83 c4 10             	add    $0x10,%esp
   317ca:	e9 42 01 00 00       	jmp    31911 <sys_send_msg+0x33b>
   317cf:	8b 45 10             	mov    0x10(%ebp),%eax
   317d2:	8b 55 08             	mov    0x8(%ebp),%edx
   317d5:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
   317db:	8b 45 10             	mov    0x10(%ebp),%eax
   317de:	8b 55 0c             	mov    0xc(%ebp),%edx
   317e1:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
   317e7:	8b 45 10             	mov    0x10(%ebp),%eax
   317ea:	c6 40 7c 01          	movb   $0x1,0x7c(%eax)
   317ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
   317f1:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   317f7:	85 c0                	test   %eax,%eax
   317f9:	75 1b                	jne    31816 <sys_send_msg+0x240>
   317fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
   317fe:	89 45 d0             	mov    %eax,-0x30(%ebp)
   31801:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
   31808:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3180b:	8d 55 d0             	lea    -0x30(%ebp),%edx
   3180e:	89 90 8c 00 00 00    	mov    %edx,0x8c(%eax)
   31814:	eb 47                	jmp    3185d <sys_send_msg+0x287>
   31816:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31819:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   3181f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31822:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31825:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   3182b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3182e:	eb 0f                	jmp    3183f <sys_send_msg+0x269>
   31830:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31833:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31836:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31839:	8b 40 04             	mov    0x4(%eax),%eax
   3183c:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3183f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31843:	75 eb                	jne    31830 <sys_send_msg+0x25a>
   31845:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31848:	8b 40 04             	mov    0x4(%eax),%eax
   3184b:	8b 55 e8             	mov    -0x18(%ebp),%edx
   3184e:	89 10                	mov    %edx,(%eax)
   31850:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31853:	8b 40 04             	mov    0x4(%eax),%eax
   31856:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   3185d:	8b 45 10             	mov    0x10(%ebp),%eax
   31860:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31864:	3c 01                	cmp    $0x1,%al
   31866:	74 1c                	je     31884 <sys_send_msg+0x2ae>
   31868:	68 2a 03 00 00       	push   $0x32a
   3186d:	68 3d 3a 03 00       	push   $0x33a3d
   31872:	68 3d 3a 03 00       	push   $0x33a3d
   31877:	68 25 3b 03 00       	push   $0x33b25
   3187c:	e8 87 fc ff ff       	call   31508 <assertion_failure>
   31881:	83 c4 10             	add    $0x10,%esp
   31884:	8b 45 10             	mov    0x10(%ebp),%eax
   31887:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   3188d:	39 45 0c             	cmp    %eax,0xc(%ebp)
   31890:	74 1c                	je     318ae <sys_send_msg+0x2d8>
   31892:	68 2b 03 00 00       	push   $0x32b
   31897:	68 3d 3a 03 00       	push   $0x33a3d
   3189c:	68 3d 3a 03 00       	push   $0x33a3d
   318a1:	68 40 3b 03 00       	push   $0x33b40
   318a6:	e8 5d fc ff ff       	call   31508 <assertion_failure>
   318ab:	83 c4 10             	add    $0x10,%esp
   318ae:	8b 45 10             	mov    0x10(%ebp),%eax
   318b1:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   318b7:	39 45 08             	cmp    %eax,0x8(%ebp)
   318ba:	74 1c                	je     318d8 <sys_send_msg+0x302>
   318bc:	68 2c 03 00 00       	push   $0x32c
   318c1:	68 3d 3a 03 00       	push   $0x33a3d
   318c6:	68 3d 3a 03 00       	push   $0x33a3d
   318cb:	68 62 3b 03 00       	push   $0x33b62
   318d0:	e8 33 fc ff ff       	call   31508 <assertion_failure>
   318d5:	83 c4 10             	add    $0x10,%esp
   318d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
   318db:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   318e1:	85 c0                	test   %eax,%eax
   318e3:	75 1c                	jne    31901 <sys_send_msg+0x32b>
   318e5:	68 2e 03 00 00       	push   $0x32e
   318ea:	68 3d 3a 03 00       	push   $0x33a3d
   318ef:	68 3d 3a 03 00       	push   $0x33a3d
   318f4:	68 77 3b 03 00       	push   $0x33b77
   318f9:	e8 0a fc ff ff       	call   31508 <assertion_failure>
   318fe:	83 c4 10             	add    $0x10,%esp
   31901:	83 ec 0c             	sub    $0xc,%esp
   31904:	ff 75 10             	pushl  0x10(%ebp)
   31907:	e8 fa 03 00 00       	call   31d06 <block>
   3190c:	83 c4 10             	add    $0x10,%esp
   3190f:	eb 01                	jmp    31912 <sys_send_msg+0x33c>
   31911:	90                   	nop
   31912:	b8 00 00 00 00       	mov    $0x0,%eax
   31917:	c9                   	leave  
   31918:	c3                   	ret    

00031919 <sys_receive_msg>:
   31919:	55                   	push   %ebp
   3191a:	89 e5                	mov    %esp,%ebp
   3191c:	83 ec 38             	sub    $0x38,%esp
   3191f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31926:	83 ec 0c             	sub    $0xc,%esp
   31929:	ff 75 0c             	pushl  0xc(%ebp)
   3192c:	e8 27 10 00 00       	call   32958 <pid2proc>
   31931:	83 c4 10             	add    $0x10,%esp
   31934:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   31937:	83 ec 0c             	sub    $0xc,%esp
   3193a:	ff 75 10             	pushl  0x10(%ebp)
   3193d:	e8 36 10 00 00       	call   32978 <proc2pid>
   31942:	83 c4 10             	add    $0x10,%esp
   31945:	89 45 e0             	mov    %eax,-0x20(%ebp)
   31948:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
   3194c:	75 40                	jne    3198e <sys_receive_msg+0x75>
   3194e:	8b 45 10             	mov    0x10(%ebp),%eax
   31951:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   31957:	85 c0                	test   %eax,%eax
   31959:	0f 84 c6 00 00 00    	je     31a25 <sys_receive_msg+0x10c>
   3195f:	8b 45 10             	mov    0x10(%ebp),%eax
   31962:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   31968:	8b 00                	mov    (%eax),%eax
   3196a:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3196d:	8b 45 10             	mov    0x10(%ebp),%eax
   31970:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   31976:	8b 50 04             	mov    0x4(%eax),%edx
   31979:	8b 45 10             	mov    0x10(%ebp),%eax
   3197c:	89 90 8c 00 00 00    	mov    %edx,0x8c(%eax)
   31982:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
   31989:	e9 97 00 00 00       	jmp    31a25 <sys_receive_msg+0x10c>
   3198e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   31992:	0f 88 8d 00 00 00    	js     31a25 <sys_receive_msg+0x10c>
   31998:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
   3199c:	0f 8f 83 00 00 00    	jg     31a25 <sys_receive_msg+0x10c>
   319a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   319a5:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   319a9:	3c 01                	cmp    $0x1,%al
   319ab:	75 78                	jne    31a25 <sys_receive_msg+0x10c>
   319ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   319b0:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   319b6:	83 f8 11             	cmp    $0x11,%eax
   319b9:	74 0e                	je     319c9 <sys_receive_msg+0xb0>
   319bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   319be:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   319c4:	39 45 e0             	cmp    %eax,-0x20(%ebp)
   319c7:	75 5c                	jne    31a25 <sys_receive_msg+0x10c>
   319c9:	8b 45 10             	mov    0x10(%ebp),%eax
   319cc:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   319d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
   319d5:	8b 45 10             	mov    0x10(%ebp),%eax
   319d8:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   319de:	89 45 e8             	mov    %eax,-0x18(%ebp)
   319e1:	eb 24                	jmp    31a07 <sys_receive_msg+0xee>
   319e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
   319e6:	8b 10                	mov    (%eax),%edx
   319e8:	8b 45 0c             	mov    0xc(%ebp),%eax
   319eb:	39 c2                	cmp    %eax,%edx
   319ed:	75 09                	jne    319f8 <sys_receive_msg+0xdf>
   319ef:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
   319f6:	eb 15                	jmp    31a0d <sys_receive_msg+0xf4>
   319f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
   319fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
   319fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31a01:	8b 40 04             	mov    0x4(%eax),%eax
   31a04:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31a07:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   31a0b:	75 d6                	jne    319e3 <sys_receive_msg+0xca>
   31a0d:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   31a11:	75 12                	jne    31a25 <sys_receive_msg+0x10c>
   31a13:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31a16:	8b 50 04             	mov    0x4(%eax),%edx
   31a19:	8b 45 e8             	mov    -0x18(%ebp),%eax
   31a1c:	89 50 04             	mov    %edx,0x4(%eax)
   31a1f:	8b 45 0c             	mov    0xc(%ebp),%eax
   31a22:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31a25:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   31a29:	0f 85 85 01 00 00    	jne    31bb4 <sys_receive_msg+0x29b>
   31a2f:	83 ec 0c             	sub    $0xc,%esp
   31a32:	ff 75 f0             	pushl  -0x10(%ebp)
   31a35:	e8 1e 0f 00 00       	call   32958 <pid2proc>
   31a3a:	83 c4 10             	add    $0x10,%esp
   31a3d:	89 45 dc             	mov    %eax,-0x24(%ebp)
   31a40:	8b 45 10             	mov    0x10(%ebp),%eax
   31a43:	8b 40 0c             	mov    0xc(%eax),%eax
   31a46:	89 45 d8             	mov    %eax,-0x28(%ebp)
   31a49:	8b 45 d8             	mov    -0x28(%ebp),%eax
   31a4c:	83 ec 08             	sub    $0x8,%esp
   31a4f:	ff 75 10             	pushl  0x10(%ebp)
   31a52:	50                   	push   %eax
   31a53:	e8 ed 0f 00 00       	call   32a45 <Seg2PhyAddrLDT>
   31a58:	83 c4 10             	add    $0x10,%esp
   31a5b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   31a5e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
   31a61:	89 d0                	mov    %edx,%eax
   31a63:	01 c0                	add    %eax,%eax
   31a65:	01 d0                	add    %edx,%eax
   31a67:	c1 e0 02             	shl    $0x2,%eax
   31a6a:	89 c2                	mov    %eax,%edx
   31a6c:	8b 45 08             	mov    0x8(%ebp),%eax
   31a6f:	01 d0                	add    %edx,%eax
   31a71:	89 45 d0             	mov    %eax,-0x30(%ebp)
   31a74:	c7 45 cc 0c 00 00 00 	movl   $0xc,-0x34(%ebp)
   31a7b:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31a7e:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
   31a84:	8b 45 d0             	mov    -0x30(%ebp),%eax
   31a87:	83 ec 04             	sub    $0x4,%esp
   31a8a:	ff 75 cc             	pushl  -0x34(%ebp)
   31a8d:	52                   	push   %edx
   31a8e:	50                   	push   %eax
   31a8f:	e8 ca 22 00 00       	call   33d5e <Memcpy>
   31a94:	83 c4 10             	add    $0x10,%esp
   31a97:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31a9a:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   31aa1:	00 00 00 
   31aa4:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31aa7:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
   31aab:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31aae:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
   31ab5:	00 00 00 
   31ab8:	8b 45 10             	mov    0x10(%ebp),%eax
   31abb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   31ac2:	00 00 00 
   31ac5:	8b 45 10             	mov    0x10(%ebp),%eax
   31ac8:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
   31acf:	00 00 00 
   31ad2:	83 ec 0c             	sub    $0xc,%esp
   31ad5:	ff 75 dc             	pushl  -0x24(%ebp)
   31ad8:	e8 3b 02 00 00       	call   31d18 <unblock>
   31add:	83 c4 10             	add    $0x10,%esp
   31ae0:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31ae3:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31ae9:	85 c0                	test   %eax,%eax
   31aeb:	74 1c                	je     31b09 <sys_receive_msg+0x1f0>
   31aed:	68 84 03 00 00       	push   $0x384
   31af2:	68 3d 3a 03 00       	push   $0x33a3d
   31af7:	68 3d 3a 03 00       	push   $0x33a3d
   31afc:	68 8f 3b 03 00       	push   $0x33b8f
   31b01:	e8 02 fa ff ff       	call   31508 <assertion_failure>
   31b06:	83 c4 10             	add    $0x10,%esp
   31b09:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31b0c:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31b10:	84 c0                	test   %al,%al
   31b12:	74 1c                	je     31b30 <sys_receive_msg+0x217>
   31b14:	68 85 03 00 00       	push   $0x385
   31b19:	68 3d 3a 03 00       	push   $0x33a3d
   31b1e:	68 3d 3a 03 00       	push   $0x33a3d
   31b23:	68 a8 3b 03 00       	push   $0x33ba8
   31b28:	e8 db f9 ff ff       	call   31508 <assertion_failure>
   31b2d:	83 c4 10             	add    $0x10,%esp
   31b30:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31b33:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   31b39:	85 c0                	test   %eax,%eax
   31b3b:	74 1c                	je     31b59 <sys_receive_msg+0x240>
   31b3d:	68 86 03 00 00       	push   $0x386
   31b42:	68 3d 3a 03 00       	push   $0x33a3d
   31b47:	68 3d 3a 03 00       	push   $0x33a3d
   31b4c:	68 c7 3b 03 00       	push   $0x33bc7
   31b51:	e8 b2 f9 ff ff       	call   31508 <assertion_failure>
   31b56:	83 c4 10             	add    $0x10,%esp
   31b59:	8b 45 10             	mov    0x10(%ebp),%eax
   31b5c:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31b62:	85 c0                	test   %eax,%eax
   31b64:	74 1c                	je     31b82 <sys_receive_msg+0x269>
   31b66:	68 88 03 00 00       	push   $0x388
   31b6b:	68 3d 3a 03 00       	push   $0x33a3d
   31b70:	68 3d 3a 03 00       	push   $0x33a3d
   31b75:	68 dc 3a 03 00       	push   $0x33adc
   31b7a:	e8 89 f9 ff ff       	call   31508 <assertion_failure>
   31b7f:	83 c4 10             	add    $0x10,%esp
   31b82:	8b 45 10             	mov    0x10(%ebp),%eax
   31b85:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   31b8b:	85 c0                	test   %eax,%eax
   31b8d:	0f 84 b4 00 00 00    	je     31c47 <sys_receive_msg+0x32e>
   31b93:	68 89 03 00 00       	push   $0x389
   31b98:	68 3d 3a 03 00       	push   $0x33a3d
   31b9d:	68 3d 3a 03 00       	push   $0x33a3d
   31ba2:	68 07 3b 03 00       	push   $0x33b07
   31ba7:	e8 5c f9 ff ff       	call   31508 <assertion_failure>
   31bac:	83 c4 10             	add    $0x10,%esp
   31baf:	e9 93 00 00 00       	jmp    31c47 <sys_receive_msg+0x32e>
   31bb4:	8b 45 10             	mov    0x10(%ebp),%eax
   31bb7:	c6 40 7c 02          	movb   $0x2,0x7c(%eax)
   31bbb:	8b 45 10             	mov    0x10(%ebp),%eax
   31bbe:	8b 55 08             	mov    0x8(%ebp),%edx
   31bc1:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
   31bc7:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
   31bcb:	75 0f                	jne    31bdc <sys_receive_msg+0x2c3>
   31bcd:	8b 45 10             	mov    0x10(%ebp),%eax
   31bd0:	c7 80 88 00 00 00 11 	movl   $0x11,0x88(%eax)
   31bd7:	00 00 00 
   31bda:	eb 0c                	jmp    31be8 <sys_receive_msg+0x2cf>
   31bdc:	8b 45 10             	mov    0x10(%ebp),%eax
   31bdf:	8b 55 0c             	mov    0xc(%ebp),%edx
   31be2:	89 90 88 00 00 00    	mov    %edx,0x88(%eax)
   31be8:	8b 45 10             	mov    0x10(%ebp),%eax
   31beb:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31bef:	3c 02                	cmp    $0x2,%al
   31bf1:	74 1c                	je     31c0f <sys_receive_msg+0x2f6>
   31bf3:	68 96 03 00 00       	push   $0x396
   31bf8:	68 3d 3a 03 00       	push   $0x33a3d
   31bfd:	68 3d 3a 03 00       	push   $0x33a3d
   31c02:	68 e3 3b 03 00       	push   $0x33be3
   31c07:	e8 fc f8 ff ff       	call   31508 <assertion_failure>
   31c0c:	83 c4 10             	add    $0x10,%esp
   31c0f:	8b 45 10             	mov    0x10(%ebp),%eax
   31c12:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   31c18:	39 45 08             	cmp    %eax,0x8(%ebp)
   31c1b:	74 1c                	je     31c39 <sys_receive_msg+0x320>
   31c1d:	68 97 03 00 00       	push   $0x397
   31c22:	68 3d 3a 03 00       	push   $0x33a3d
   31c27:	68 3d 3a 03 00       	push   $0x33a3d
   31c2c:	68 01 3c 03 00       	push   $0x33c01
   31c31:	e8 d2 f8 ff ff       	call   31508 <assertion_failure>
   31c36:	83 c4 10             	add    $0x10,%esp
   31c39:	83 ec 0c             	sub    $0xc,%esp
   31c3c:	ff 75 10             	pushl  0x10(%ebp)
   31c3f:	e8 c2 00 00 00       	call   31d06 <block>
   31c44:	83 c4 10             	add    $0x10,%esp
   31c47:	b8 00 00 00 00       	mov    $0x0,%eax
   31c4c:	c9                   	leave  
   31c4d:	c3                   	ret    

00031c4e <send_rec>:
   31c4e:	55                   	push   %ebp
   31c4f:	89 e5                	mov    %esp,%ebp
   31c51:	83 ec 18             	sub    $0x18,%esp
   31c54:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
   31c58:	74 26                	je     31c80 <send_rec+0x32>
   31c5a:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   31c5e:	74 36                	je     31c96 <send_rec+0x48>
   31c60:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   31c64:	0f 85 82 00 00 00    	jne    31cec <send_rec+0x9e>
   31c6a:	83 ec 08             	sub    $0x8,%esp
   31c6d:	ff 75 10             	pushl  0x10(%ebp)
   31c70:	ff 75 0c             	pushl  0xc(%ebp)
   31c73:	e8 60 0b 00 00       	call   327d8 <send_msg>
   31c78:	83 c4 10             	add    $0x10,%esp
   31c7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31c7e:	eb 7f                	jmp    31cff <send_rec+0xb1>
   31c80:	83 ec 08             	sub    $0x8,%esp
   31c83:	ff 75 10             	pushl  0x10(%ebp)
   31c86:	ff 75 0c             	pushl  0xc(%ebp)
   31c89:	e8 5a 0b 00 00       	call   327e8 <receive_msg>
   31c8e:	83 c4 10             	add    $0x10,%esp
   31c91:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31c94:	eb 69                	jmp    31cff <send_rec+0xb1>
   31c96:	83 ec 08             	sub    $0x8,%esp
   31c99:	ff 75 10             	pushl  0x10(%ebp)
   31c9c:	ff 75 0c             	pushl  0xc(%ebp)
   31c9f:	e8 34 0b 00 00       	call   327d8 <send_msg>
   31ca4:	83 c4 10             	add    $0x10,%esp
   31ca7:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31caa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31cae:	75 4e                	jne    31cfe <send_rec+0xb0>
   31cb0:	83 ec 08             	sub    $0x8,%esp
   31cb3:	ff 75 10             	pushl  0x10(%ebp)
   31cb6:	ff 75 0c             	pushl  0xc(%ebp)
   31cb9:	e8 2a 0b 00 00       	call   327e8 <receive_msg>
   31cbe:	83 c4 10             	add    $0x10,%esp
   31cc1:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31cc4:	8b 45 0c             	mov    0xc(%ebp),%eax
   31cc7:	8b 40 08             	mov    0x8(%eax),%eax
   31cca:	85 c0                	test   %eax,%eax
   31ccc:	75 30                	jne    31cfe <send_rec+0xb0>
   31cce:	68 c0 03 00 00       	push   $0x3c0
   31cd3:	68 3d 3a 03 00       	push   $0x33a3d
   31cd8:	68 3d 3a 03 00       	push   $0x33a3d
   31cdd:	68 18 3c 03 00       	push   $0x33c18
   31ce2:	e8 21 f8 ff ff       	call   31508 <assertion_failure>
   31ce7:	83 c4 10             	add    $0x10,%esp
   31cea:	eb 12                	jmp    31cfe <send_rec+0xb0>
   31cec:	83 ec 0c             	sub    $0xc,%esp
   31cef:	68 26 3c 03 00       	push   $0x33c26
   31cf4:	e8 f1 f7 ff ff       	call   314ea <panic>
   31cf9:	83 c4 10             	add    $0x10,%esp
   31cfc:	eb 01                	jmp    31cff <send_rec+0xb1>
   31cfe:	90                   	nop
   31cff:	b8 00 00 00 00       	mov    $0x0,%eax
   31d04:	c9                   	leave  
   31d05:	c3                   	ret    

00031d06 <block>:
   31d06:	55                   	push   %ebp
   31d07:	89 e5                	mov    %esp,%ebp
   31d09:	83 ec 08             	sub    $0x8,%esp
   31d0c:	e8 6b 0b 00 00       	call   3287c <schedule_process>
   31d11:	b8 00 00 00 00       	mov    $0x0,%eax
   31d16:	c9                   	leave  
   31d17:	c3                   	ret    

00031d18 <unblock>:
   31d18:	55                   	push   %ebp
   31d19:	89 e5                	mov    %esp,%ebp
   31d1b:	b8 00 00 00 00       	mov    $0x0,%eax
   31d20:	5d                   	pop    %ebp
   31d21:	c3                   	ret    

00031d22 <get_ticks_ipc>:
   31d22:	55                   	push   %ebp
   31d23:	89 e5                	mov    %esp,%ebp
   31d25:	83 ec 28             	sub    $0x28,%esp
   31d28:	83 ec 04             	sub    $0x4,%esp
   31d2b:	6a 0c                	push   $0xc
   31d2d:	6a 00                	push   $0x0
   31d2f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   31d32:	50                   	push   %eax
   31d33:	e8 54 20 00 00       	call   33d8c <Memset>
   31d38:	83 c4 10             	add    $0x10,%esp
   31d3b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
   31d42:	83 ec 04             	sub    $0x4,%esp
   31d45:	6a 01                	push   $0x1
   31d47:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   31d4a:	50                   	push   %eax
   31d4b:	6a 03                	push   $0x3
   31d4d:	e8 fc fe ff ff       	call   31c4e <send_rec>
   31d52:	83 c4 10             	add    $0x10,%esp
   31d55:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31d58:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31d5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31d5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31d61:	c9                   	leave  
   31d62:	c3                   	ret    

00031d63 <itoa>:
   31d63:	55                   	push   %ebp
   31d64:	89 e5                	mov    %esp,%ebp
   31d66:	53                   	push   %ebx
   31d67:	83 ec 14             	sub    $0x14,%esp
   31d6a:	8b 45 08             	mov    0x8(%ebp),%eax
   31d6d:	99                   	cltd   
   31d6e:	f7 7d 10             	idivl  0x10(%ebp)
   31d71:	89 55 f4             	mov    %edx,-0xc(%ebp)
   31d74:	8b 45 08             	mov    0x8(%ebp),%eax
   31d77:	99                   	cltd   
   31d78:	f7 7d 10             	idivl  0x10(%ebp)
   31d7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31d7e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   31d82:	74 14                	je     31d98 <itoa+0x35>
   31d84:	83 ec 04             	sub    $0x4,%esp
   31d87:	ff 75 10             	pushl  0x10(%ebp)
   31d8a:	ff 75 0c             	pushl  0xc(%ebp)
   31d8d:	ff 75 f0             	pushl  -0x10(%ebp)
   31d90:	e8 ce ff ff ff       	call   31d63 <itoa>
   31d95:	83 c4 10             	add    $0x10,%esp
   31d98:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31d9b:	8d 58 30             	lea    0x30(%eax),%ebx
   31d9e:	8b 45 0c             	mov    0xc(%ebp),%eax
   31da1:	8b 00                	mov    (%eax),%eax
   31da3:	8d 48 01             	lea    0x1(%eax),%ecx
   31da6:	8b 55 0c             	mov    0xc(%ebp),%edx
   31da9:	89 0a                	mov    %ecx,(%edx)
   31dab:	89 da                	mov    %ebx,%edx
   31dad:	88 10                	mov    %dl,(%eax)
   31daf:	8b 45 0c             	mov    0xc(%ebp),%eax
   31db2:	8b 00                	mov    (%eax),%eax
   31db4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   31db7:	c9                   	leave  
   31db8:	c3                   	ret    

00031db9 <i2a>:
   31db9:	55                   	push   %ebp
   31dba:	89 e5                	mov    %esp,%ebp
   31dbc:	53                   	push   %ebx
   31dbd:	83 ec 14             	sub    $0x14,%esp
   31dc0:	8b 45 08             	mov    0x8(%ebp),%eax
   31dc3:	99                   	cltd   
   31dc4:	f7 7d 0c             	idivl  0xc(%ebp)
   31dc7:	89 55 f4             	mov    %edx,-0xc(%ebp)
   31dca:	8b 45 08             	mov    0x8(%ebp),%eax
   31dcd:	99                   	cltd   
   31dce:	f7 7d 0c             	idivl  0xc(%ebp)
   31dd1:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31dd4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   31dd8:	74 14                	je     31dee <i2a+0x35>
   31dda:	83 ec 04             	sub    $0x4,%esp
   31ddd:	ff 75 10             	pushl  0x10(%ebp)
   31de0:	ff 75 0c             	pushl  0xc(%ebp)
   31de3:	ff 75 f0             	pushl  -0x10(%ebp)
   31de6:	e8 ce ff ff ff       	call   31db9 <i2a>
   31deb:	83 c4 10             	add    $0x10,%esp
   31dee:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   31df2:	7f 0a                	jg     31dfe <i2a+0x45>
   31df4:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31df7:	83 c0 30             	add    $0x30,%eax
   31dfa:	89 c3                	mov    %eax,%ebx
   31dfc:	eb 08                	jmp    31e06 <i2a+0x4d>
   31dfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31e01:	83 c0 37             	add    $0x37,%eax
   31e04:	89 c3                	mov    %eax,%ebx
   31e06:	8b 45 10             	mov    0x10(%ebp),%eax
   31e09:	8b 00                	mov    (%eax),%eax
   31e0b:	8d 48 01             	lea    0x1(%eax),%ecx
   31e0e:	8b 55 10             	mov    0x10(%ebp),%edx
   31e11:	89 0a                	mov    %ecx,(%edx)
   31e13:	88 18                	mov    %bl,(%eax)
   31e15:	8b 45 10             	mov    0x10(%ebp),%eax
   31e18:	8b 00                	mov    (%eax),%eax
   31e1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   31e1d:	c9                   	leave  
   31e1e:	c3                   	ret    

00031e1f <TaskHD>:
   31e1f:	55                   	push   %ebp
   31e20:	89 e5                	mov    %esp,%ebp
   31e22:	83 ec 08             	sub    $0x8,%esp
   31e25:	83 ec 08             	sub    $0x8,%esp
   31e28:	68 3b 3c 03 00       	push   $0x33c3b
   31e2d:	68 51 3c 03 00       	push   $0x33c51
   31e32:	e8 84 f3 ff ff       	call   311bb <Printf>
   31e37:	83 c4 10             	add    $0x10,%esp
   31e3a:	e8 07 00 00 00       	call   31e46 <init_hd>
   31e3f:	e8 36 00 00 00       	call   31e7a <hd_handle>
   31e44:	eb f9                	jmp    31e3f <TaskHD+0x20>

00031e46 <init_hd>:
   31e46:	55                   	push   %ebp
   31e47:	89 e5                	mov    %esp,%ebp
   31e49:	83 ec 18             	sub    $0x18,%esp
   31e4c:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
   31e53:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31e56:	0f b6 00             	movzbl (%eax),%eax
   31e59:	0f be c0             	movsbl %al,%eax
   31e5c:	83 ec 08             	sub    $0x8,%esp
   31e5f:	50                   	push   %eax
   31e60:	68 55 3c 03 00       	push   $0x33c55
   31e65:	e8 51 f3 ff ff       	call   311bb <Printf>
   31e6a:	83 c4 10             	add    $0x10,%esp
   31e6d:	e8 22 e9 ff ff       	call   30794 <enable_8259A_casecade_irq>
   31e72:	e8 33 e9 ff ff       	call   307aa <enable_8259A_slave_winchester_irq>
   31e77:	90                   	nop
   31e78:	c9                   	leave  
   31e79:	c3                   	ret    

00031e7a <hd_handle>:
   31e7a:	55                   	push   %ebp
   31e7b:	89 e5                	mov    %esp,%ebp
   31e7d:	83 ec 28             	sub    $0x28,%esp
   31e80:	83 ec 08             	sub    $0x8,%esp
   31e83:	68 5d 3c 03 00       	push   $0x33c5d
   31e88:	68 51 3c 03 00       	push   $0x33c51
   31e8d:	e8 29 f3 ff ff       	call   311bb <Printf>
   31e92:	83 c4 10             	add    $0x10,%esp
   31e95:	83 ec 04             	sub    $0x4,%esp
   31e98:	6a 11                	push   $0x11
   31e9a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   31e9d:	50                   	push   %eax
   31e9e:	6a 02                	push   $0x2
   31ea0:	e8 a9 fd ff ff       	call   31c4e <send_rec>
   31ea5:	83 c4 10             	add    $0x10,%esp
   31ea8:	8b 45 e8             	mov    -0x18(%ebp),%eax
   31eab:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31eae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31eb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31eb4:	81 7d f4 e9 03 00 00 	cmpl   $0x3e9,-0xc(%ebp)
   31ebb:	74 0b                	je     31ec8 <hd_handle+0x4e>
   31ebd:	81 7d f4 ea 03 00 00 	cmpl   $0x3ea,-0xc(%ebp)
   31ec4:	74 21                	je     31ee7 <hd_handle+0x6d>
   31ec6:	eb 46                	jmp    31f0e <hd_handle+0x94>
   31ec8:	e8 0a 08 00 00       	call   326d7 <hd_open>
   31ecd:	83 ec 04             	sub    $0x4,%esp
   31ed0:	ff 75 f0             	pushl  -0x10(%ebp)
   31ed3:	68 73 3c 03 00       	push   $0x33c73
   31ed8:	68 7b 3c 03 00       	push   $0x33c7b
   31edd:	e8 d9 f2 ff ff       	call   311bb <Printf>
   31ee2:	83 c4 10             	add    $0x10,%esp
   31ee5:	eb 3d                	jmp    31f24 <hd_handle+0xaa>
   31ee7:	83 ec 0c             	sub    $0xc,%esp
   31eea:	6a 00                	push   $0x0
   31eec:	e8 4a 08 00 00       	call   3273b <get_hd_ioctl>
   31ef1:	83 c4 10             	add    $0x10,%esp
   31ef4:	83 ec 04             	sub    $0x4,%esp
   31ef7:	ff 75 f0             	pushl  -0x10(%ebp)
   31efa:	68 82 3c 03 00       	push   $0x33c82
   31eff:	68 7b 3c 03 00       	push   $0x33c7b
   31f04:	e8 b2 f2 ff ff       	call   311bb <Printf>
   31f09:	83 c4 10             	add    $0x10,%esp
   31f0c:	eb 16                	jmp    31f24 <hd_handle+0xaa>
   31f0e:	83 ec 08             	sub    $0x8,%esp
   31f11:	68 8f 3c 03 00       	push   $0x33c8f
   31f16:	68 51 3c 03 00       	push   $0x33c51
   31f1b:	e8 9b f2 ff ff       	call   311bb <Printf>
   31f20:	83 c4 10             	add    $0x10,%esp
   31f23:	90                   	nop
   31f24:	c7 45 e4 02 00 00 00 	movl   $0x2,-0x1c(%ebp)
   31f2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31f2e:	83 ec 04             	sub    $0x4,%esp
   31f31:	50                   	push   %eax
   31f32:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   31f35:	50                   	push   %eax
   31f36:	6a 01                	push   $0x1
   31f38:	e8 11 fd ff ff       	call   31c4e <send_rec>
   31f3d:	83 c4 10             	add    $0x10,%esp
   31f40:	90                   	nop
   31f41:	c9                   	leave  
   31f42:	c3                   	ret    

00031f43 <hd_cmd_out>:
   31f43:	55                   	push   %ebp
   31f44:	89 e5                	mov    %esp,%ebp
   31f46:	83 ec 18             	sub    $0x18,%esp
   31f49:	eb 29                	jmp    31f74 <hd_cmd_out+0x31>
   31f4b:	83 ec 0c             	sub    $0xc,%esp
   31f4e:	68 f7 01 00 00       	push   $0x1f7
   31f53:	e8 74 e7 ff ff       	call   306cc <in_byte>
   31f58:	83 c4 10             	add    $0x10,%esp
   31f5b:	0f b6 c0             	movzbl %al,%eax
   31f5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31f61:	83 ec 08             	sub    $0x8,%esp
   31f64:	ff 75 f4             	pushl  -0xc(%ebp)
   31f67:	68 a1 3c 03 00       	push   $0x33ca1
   31f6c:	e8 4a f2 ff ff       	call   311bb <Printf>
   31f71:	83 c4 10             	add    $0x10,%esp
   31f74:	83 ec 0c             	sub    $0xc,%esp
   31f77:	68 f7 01 00 00       	push   $0x1f7
   31f7c:	e8 4b e7 ff ff       	call   306cc <in_byte>
   31f81:	83 c4 10             	add    $0x10,%esp
   31f84:	0f b6 c0             	movzbl %al,%eax
   31f87:	83 e0 01             	and    $0x1,%eax
   31f8a:	85 c0                	test   %eax,%eax
   31f8c:	75 bd                	jne    31f4b <hd_cmd_out+0x8>
   31f8e:	83 ec 0c             	sub    $0xc,%esp
   31f91:	68 f7 01 00 00       	push   $0x1f7
   31f96:	e8 31 e7 ff ff       	call   306cc <in_byte>
   31f9b:	83 c4 10             	add    $0x10,%esp
   31f9e:	0f b6 c0             	movzbl %al,%eax
   31fa1:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31fa4:	83 ec 08             	sub    $0x8,%esp
   31fa7:	ff 75 f0             	pushl  -0x10(%ebp)
   31faa:	68 ab 3c 03 00       	push   $0x33cab
   31faf:	e8 07 f2 ff ff       	call   311bb <Printf>
   31fb4:	83 c4 10             	add    $0x10,%esp
   31fb7:	83 ec 08             	sub    $0x8,%esp
   31fba:	6a 00                	push   $0x0
   31fbc:	68 f6 03 00 00       	push   $0x3f6
   31fc1:	e8 12 e7 ff ff       	call   306d8 <out_byte>
   31fc6:	83 c4 10             	add    $0x10,%esp
   31fc9:	83 ec 08             	sub    $0x8,%esp
   31fcc:	6a 17                	push   $0x17
   31fce:	68 b1 3c 03 00       	push   $0x33cb1
   31fd3:	e8 e3 f1 ff ff       	call   311bb <Printf>
   31fd8:	83 c4 10             	add    $0x10,%esp
   31fdb:	8b 45 08             	mov    0x8(%ebp),%eax
   31fde:	0f b6 00             	movzbl (%eax),%eax
   31fe1:	0f b6 c0             	movzbl %al,%eax
   31fe4:	83 ec 08             	sub    $0x8,%esp
   31fe7:	50                   	push   %eax
   31fe8:	68 f1 01 00 00       	push   $0x1f1
   31fed:	e8 e6 e6 ff ff       	call   306d8 <out_byte>
   31ff2:	83 c4 10             	add    $0x10,%esp
   31ff5:	8b 45 08             	mov    0x8(%ebp),%eax
   31ff8:	0f b6 40 01          	movzbl 0x1(%eax),%eax
   31ffc:	0f b6 c0             	movzbl %al,%eax
   31fff:	83 ec 08             	sub    $0x8,%esp
   32002:	50                   	push   %eax
   32003:	68 f2 01 00 00       	push   $0x1f2
   32008:	e8 cb e6 ff ff       	call   306d8 <out_byte>
   3200d:	83 c4 10             	add    $0x10,%esp
   32010:	8b 45 08             	mov    0x8(%ebp),%eax
   32013:	0f b6 40 02          	movzbl 0x2(%eax),%eax
   32017:	0f b6 c0             	movzbl %al,%eax
   3201a:	83 ec 08             	sub    $0x8,%esp
   3201d:	50                   	push   %eax
   3201e:	68 f3 01 00 00       	push   $0x1f3
   32023:	e8 b0 e6 ff ff       	call   306d8 <out_byte>
   32028:	83 c4 10             	add    $0x10,%esp
   3202b:	8b 45 08             	mov    0x8(%ebp),%eax
   3202e:	0f b6 40 03          	movzbl 0x3(%eax),%eax
   32032:	0f b6 c0             	movzbl %al,%eax
   32035:	83 ec 08             	sub    $0x8,%esp
   32038:	50                   	push   %eax
   32039:	68 f4 01 00 00       	push   $0x1f4
   3203e:	e8 95 e6 ff ff       	call   306d8 <out_byte>
   32043:	83 c4 10             	add    $0x10,%esp
   32046:	83 ec 08             	sub    $0x8,%esp
   32049:	6a 17                	push   $0x17
   3204b:	68 b1 3c 03 00       	push   $0x33cb1
   32050:	e8 66 f1 ff ff       	call   311bb <Printf>
   32055:	83 c4 10             	add    $0x10,%esp
   32058:	8b 45 08             	mov    0x8(%ebp),%eax
   3205b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
   3205f:	0f b6 c0             	movzbl %al,%eax
   32062:	83 ec 08             	sub    $0x8,%esp
   32065:	50                   	push   %eax
   32066:	68 f5 01 00 00       	push   $0x1f5
   3206b:	e8 68 e6 ff ff       	call   306d8 <out_byte>
   32070:	83 c4 10             	add    $0x10,%esp
   32073:	83 ec 08             	sub    $0x8,%esp
   32076:	6a 17                	push   $0x17
   32078:	68 b1 3c 03 00       	push   $0x33cb1
   3207d:	e8 39 f1 ff ff       	call   311bb <Printf>
   32082:	83 c4 10             	add    $0x10,%esp
   32085:	8b 45 08             	mov    0x8(%ebp),%eax
   32088:	0f b6 40 05          	movzbl 0x5(%eax),%eax
   3208c:	0f b6 c0             	movzbl %al,%eax
   3208f:	83 ec 08             	sub    $0x8,%esp
   32092:	50                   	push   %eax
   32093:	68 f6 01 00 00       	push   $0x1f6
   32098:	e8 3b e6 ff ff       	call   306d8 <out_byte>
   3209d:	83 c4 10             	add    $0x10,%esp
   320a0:	83 ec 08             	sub    $0x8,%esp
   320a3:	6a 17                	push   $0x17
   320a5:	68 b1 3c 03 00       	push   $0x33cb1
   320aa:	e8 0c f1 ff ff       	call   311bb <Printf>
   320af:	83 c4 10             	add    $0x10,%esp
   320b2:	8b 45 08             	mov    0x8(%ebp),%eax
   320b5:	0f b6 40 06          	movzbl 0x6(%eax),%eax
   320b9:	0f b6 c0             	movzbl %al,%eax
   320bc:	83 ec 08             	sub    $0x8,%esp
   320bf:	50                   	push   %eax
   320c0:	68 f7 01 00 00       	push   $0x1f7
   320c5:	e8 0e e6 ff ff       	call   306d8 <out_byte>
   320ca:	83 c4 10             	add    $0x10,%esp
   320cd:	83 ec 08             	sub    $0x8,%esp
   320d0:	6a 17                	push   $0x17
   320d2:	68 b1 3c 03 00       	push   $0x33cb1
   320d7:	e8 df f0 ff ff       	call   311bb <Printf>
   320dc:	83 c4 10             	add    $0x10,%esp
   320df:	90                   	nop
   320e0:	c9                   	leave  
   320e1:	c3                   	ret    

000320e2 <hd_identify>:
   320e2:	55                   	push   %ebp
   320e3:	89 e5                	mov    %esp,%ebp
   320e5:	81 ec 18 04 00 00    	sub    $0x418,%esp
   320eb:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
   320ef:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
   320f3:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
   320f7:	c6 45 f4 00          	movb   $0x0,-0xc(%ebp)
   320fb:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
   320ff:	8b 45 08             	mov    0x8(%ebp),%eax
   32102:	c1 f8 18             	sar    $0x18,%eax
   32105:	83 c8 e0             	or     $0xffffffe0,%eax
   32108:	88 45 f6             	mov    %al,-0xa(%ebp)
   3210b:	c6 45 f7 ec          	movb   $0xec,-0x9(%ebp)
   3210f:	83 ec 0c             	sub    $0xc,%esp
   32112:	8d 45 f1             	lea    -0xf(%ebp),%eax
   32115:	50                   	push   %eax
   32116:	e8 28 fe ff ff       	call   31f43 <hd_cmd_out>
   3211b:	83 c4 10             	add    $0x10,%esp
   3211e:	83 ec 0c             	sub    $0xc,%esp
   32121:	6a 01                	push   $0x1
   32123:	e8 e9 ee ff ff       	call   31011 <delay>
   32128:	83 c4 10             	add    $0x10,%esp
   3212b:	83 ec 08             	sub    $0x8,%esp
   3212e:	68 b8 3c 03 00       	push   $0x33cb8
   32133:	68 51 3c 03 00       	push   $0x33c51
   32138:	e8 7e f0 ff ff       	call   311bb <Printf>
   3213d:	83 c4 10             	add    $0x10,%esp
   32140:	83 ec 04             	sub    $0x4,%esp
   32143:	68 00 04 00 00       	push   $0x400
   32148:	6a 00                	push   $0x0
   3214a:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32150:	50                   	push   %eax
   32151:	e8 36 1c 00 00       	call   33d8c <Memset>
   32156:	83 c4 10             	add    $0x10,%esp
   32159:	83 ec 04             	sub    $0x4,%esp
   3215c:	68 00 02 00 00       	push   $0x200
   32161:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32167:	50                   	push   %eax
   32168:	68 f0 01 00 00       	push   $0x1f0
   3216d:	e8 6e 1c 00 00       	call   33de0 <read_port>
   32172:	83 c4 10             	add    $0x10,%esp
   32175:	83 ec 0c             	sub    $0xc,%esp
   32178:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   3217e:	50                   	push   %eax
   3217f:	e8 32 00 00 00       	call   321b6 <print_hdinfo>
   32184:	83 c4 10             	add    $0x10,%esp
   32187:	83 ec 08             	sub    $0x8,%esp
   3218a:	68 c3 3c 03 00       	push   $0x33cc3
   3218f:	68 51 3c 03 00       	push   $0x33c51
   32194:	e8 22 f0 ff ff       	call   311bb <Printf>
   32199:	83 c4 10             	add    $0x10,%esp
   3219c:	83 ec 08             	sub    $0x8,%esp
   3219f:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   321a5:	50                   	push   %eax
   321a6:	68 cf 3c 03 00       	push   $0x33ccf
   321ab:	e8 0b f0 ff ff       	call   311bb <Printf>
   321b0:	83 c4 10             	add    $0x10,%esp
   321b3:	90                   	nop
   321b4:	c9                   	leave  
   321b5:	c3                   	ret    

000321b6 <print_hdinfo>:
   321b6:	55                   	push   %ebp
   321b7:	89 e5                	mov    %esp,%ebp
   321b9:	81 ec 88 00 00 00    	sub    $0x88,%esp
   321bf:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
   321c5:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
   321cb:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
   321d2:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
   321d9:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
   321e0:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
   321e7:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
   321ee:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
   321f4:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
   321fa:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
   32201:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
   32208:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
   3220f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
   32216:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   3221d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   32224:	e9 b8 00 00 00       	jmp    322e1 <print_hdinfo+0x12b>
   32229:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   32230:	8b 55 f4             	mov    -0xc(%ebp),%edx
   32233:	89 d0                	mov    %edx,%eax
   32235:	01 c0                	add    %eax,%eax
   32237:	01 d0                	add    %edx,%eax
   32239:	c1 e0 03             	shl    $0x3,%eax
   3223c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   3223f:	01 c8                	add    %ecx,%eax
   32241:	83 e8 44             	sub    $0x44,%eax
   32244:	0f b7 00             	movzwl (%eax),%eax
   32247:	0f b7 c0             	movzwl %ax,%eax
   3224a:	8d 14 00             	lea    (%eax,%eax,1),%edx
   3224d:	8b 45 08             	mov    0x8(%ebp),%eax
   32250:	01 d0                	add    %edx,%eax
   32252:	89 45 ec             	mov    %eax,-0x14(%ebp)
   32255:	eb 30                	jmp    32287 <print_hdinfo+0xd1>
   32257:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3225a:	8d 50 01             	lea    0x1(%eax),%edx
   3225d:	89 55 ec             	mov    %edx,-0x14(%ebp)
   32260:	8b 55 f0             	mov    -0x10(%ebp),%edx
   32263:	83 c2 01             	add    $0x1,%edx
   32266:	0f b6 00             	movzbl (%eax),%eax
   32269:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
   3226d:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32270:	8d 50 01             	lea    0x1(%eax),%edx
   32273:	89 55 ec             	mov    %edx,-0x14(%ebp)
   32276:	0f b6 00             	movzbl (%eax),%eax
   32279:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
   3227c:	8b 55 f0             	mov    -0x10(%ebp),%edx
   3227f:	01 ca                	add    %ecx,%edx
   32281:	88 02                	mov    %al,(%edx)
   32283:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   32287:	8b 55 f4             	mov    -0xc(%ebp),%edx
   3228a:	89 d0                	mov    %edx,%eax
   3228c:	01 c0                	add    %eax,%eax
   3228e:	01 d0                	add    %edx,%eax
   32290:	c1 e0 03             	shl    $0x3,%eax
   32293:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   32296:	01 c8                	add    %ecx,%eax
   32298:	83 e8 42             	sub    $0x42,%eax
   3229b:	0f b7 00             	movzwl (%eax),%eax
   3229e:	66 d1 e8             	shr    %ax
   322a1:	0f b7 c0             	movzwl %ax,%eax
   322a4:	39 45 f0             	cmp    %eax,-0x10(%ebp)
   322a7:	7c ae                	jl     32257 <print_hdinfo+0xa1>
   322a9:	8d 55 81             	lea    -0x7f(%ebp),%edx
   322ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
   322af:	01 d0                	add    %edx,%eax
   322b1:	c6 00 00             	movb   $0x0,(%eax)
   322b4:	8d 4d b4             	lea    -0x4c(%ebp),%ecx
   322b7:	8b 55 f4             	mov    -0xc(%ebp),%edx
   322ba:	89 d0                	mov    %edx,%eax
   322bc:	01 c0                	add    %eax,%eax
   322be:	01 d0                	add    %edx,%eax
   322c0:	c1 e0 03             	shl    $0x3,%eax
   322c3:	01 c8                	add    %ecx,%eax
   322c5:	8d 50 04             	lea    0x4(%eax),%edx
   322c8:	83 ec 04             	sub    $0x4,%esp
   322cb:	8d 45 81             	lea    -0x7f(%ebp),%eax
   322ce:	50                   	push   %eax
   322cf:	52                   	push   %edx
   322d0:	68 d7 3c 03 00       	push   $0x33cd7
   322d5:	e8 e1 ee ff ff       	call   311bb <Printf>
   322da:	83 c4 10             	add    $0x10,%esp
   322dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   322e1:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   322e5:	0f 8e 3e ff ff ff    	jle    32229 <print_hdinfo+0x73>
   322eb:	8b 45 08             	mov    0x8(%ebp),%eax
   322ee:	0f b7 40 62          	movzwl 0x62(%eax),%eax
   322f2:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
   322f6:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
   322fa:	66 c1 e8 08          	shr    $0x8,%ax
   322fe:	66 85 c0             	test   %ax,%ax
   32301:	0f 95 c0             	setne  %al
   32304:	88 45 e9             	mov    %al,-0x17(%ebp)
   32307:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
   3230e:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
   32314:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
   32318:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
   3231c:	75 15                	jne    32333 <print_hdinfo+0x17d>
   3231e:	83 ec 08             	sub    $0x8,%esp
   32321:	8d 45 ac             	lea    -0x54(%ebp),%eax
   32324:	50                   	push   %eax
   32325:	8d 45 b0             	lea    -0x50(%ebp),%eax
   32328:	50                   	push   %eax
   32329:	e8 7d 1a 00 00       	call   33dab <Strcpy>
   3232e:	83 c4 10             	add    $0x10,%esp
   32331:	eb 13                	jmp    32346 <print_hdinfo+0x190>
   32333:	83 ec 08             	sub    $0x8,%esp
   32336:	8d 45 a9             	lea    -0x57(%ebp),%eax
   32339:	50                   	push   %eax
   3233a:	8d 45 b0             	lea    -0x50(%ebp),%eax
   3233d:	50                   	push   %eax
   3233e:	e8 68 1a 00 00       	call   33dab <Strcpy>
   32343:	83 c4 10             	add    $0x10,%esp
   32346:	83 ec 08             	sub    $0x8,%esp
   32349:	8d 45 b0             	lea    -0x50(%ebp),%eax
   3234c:	50                   	push   %eax
   3234d:	68 de 3c 03 00       	push   $0x33cde
   32352:	e8 64 ee ff ff       	call   311bb <Printf>
   32357:	83 c4 10             	add    $0x10,%esp
   3235a:	8b 45 08             	mov    0x8(%ebp),%eax
   3235d:	83 c0 7a             	add    $0x7a,%eax
   32360:	0f b7 00             	movzwl (%eax),%eax
   32363:	0f b7 d0             	movzwl %ax,%edx
   32366:	8b 45 08             	mov    0x8(%ebp),%eax
   32369:	83 c0 78             	add    $0x78,%eax
   3236c:	0f b7 00             	movzwl (%eax),%eax
   3236f:	0f b7 c0             	movzwl %ax,%eax
   32372:	83 c0 10             	add    $0x10,%eax
   32375:	89 c1                	mov    %eax,%ecx
   32377:	d3 e2                	shl    %cl,%edx
   32379:	89 d0                	mov    %edx,%eax
   3237b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   3237e:	83 ec 08             	sub    $0x8,%esp
   32381:	ff 75 e4             	pushl  -0x1c(%ebp)
   32384:	68 ee 3c 03 00       	push   $0x33cee
   32389:	e8 2d ee ff ff       	call   311bb <Printf>
   3238e:	83 c4 10             	add    $0x10,%esp
   32391:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32394:	89 c2                	mov    %eax,%edx
   32396:	c1 ea 1f             	shr    $0x1f,%edx
   32399:	01 d0                	add    %edx,%eax
   3239b:	d1 f8                	sar    %eax
   3239d:	c1 e0 0a             	shl    $0xa,%eax
   323a0:	83 ec 08             	sub    $0x8,%esp
   323a3:	50                   	push   %eax
   323a4:	68 01 3d 03 00       	push   $0x33d01
   323a9:	e8 0d ee ff ff       	call   311bb <Printf>
   323ae:	83 c4 10             	add    $0x10,%esp
   323b1:	90                   	nop
   323b2:	c9                   	leave  
   323b3:	c3                   	ret    

000323b4 <print_dpt_entry>:
   323b4:	55                   	push   %ebp
   323b5:	89 e5                	mov    %esp,%ebp
   323b7:	83 ec 08             	sub    $0x8,%esp
   323ba:	8b 45 08             	mov    0x8(%ebp),%eax
   323bd:	0f b6 40 04          	movzbl 0x4(%eax),%eax
   323c1:	0f b6 c0             	movzbl %al,%eax
   323c4:	83 ec 08             	sub    $0x8,%esp
   323c7:	50                   	push   %eax
   323c8:	68 0e 3d 03 00       	push   $0x33d0e
   323cd:	e8 e9 ed ff ff       	call   311bb <Printf>
   323d2:	83 c4 10             	add    $0x10,%esp
   323d5:	90                   	nop
   323d6:	c9                   	leave  
   323d7:	c3                   	ret    

000323d8 <get_partition_table>:
   323d8:	55                   	push   %ebp
   323d9:	89 e5                	mov    %esp,%ebp
   323db:	81 ec 18 04 00 00    	sub    $0x418,%esp
   323e1:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
   323e5:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
   323e9:	8b 45 0c             	mov    0xc(%ebp),%eax
   323ec:	88 45 f3             	mov    %al,-0xd(%ebp)
   323ef:	8b 45 0c             	mov    0xc(%ebp),%eax
   323f2:	c1 f8 08             	sar    $0x8,%eax
   323f5:	88 45 f4             	mov    %al,-0xc(%ebp)
   323f8:	8b 45 0c             	mov    0xc(%ebp),%eax
   323fb:	c1 f8 10             	sar    $0x10,%eax
   323fe:	88 45 f5             	mov    %al,-0xb(%ebp)
   32401:	8b 45 0c             	mov    0xc(%ebp),%eax
   32404:	c1 f8 18             	sar    $0x18,%eax
   32407:	89 c2                	mov    %eax,%edx
   32409:	8b 45 08             	mov    0x8(%ebp),%eax
   3240c:	c1 e0 04             	shl    $0x4,%eax
   3240f:	09 d0                	or     %edx,%eax
   32411:	83 c8 e0             	or     $0xffffffe0,%eax
   32414:	88 45 f6             	mov    %al,-0xa(%ebp)
   32417:	c6 45 f7 20          	movb   $0x20,-0x9(%ebp)
   3241b:	83 ec 0c             	sub    $0xc,%esp
   3241e:	8d 45 f1             	lea    -0xf(%ebp),%eax
   32421:	50                   	push   %eax
   32422:	e8 1c fb ff ff       	call   31f43 <hd_cmd_out>
   32427:	83 c4 10             	add    $0x10,%esp
   3242a:	83 ec 0c             	sub    $0xc,%esp
   3242d:	68 f4 01 00 00       	push   $0x1f4
   32432:	e8 da eb ff ff       	call   31011 <delay>
   32437:	83 c4 10             	add    $0x10,%esp
   3243a:	83 ec 04             	sub    $0x4,%esp
   3243d:	68 00 04 00 00       	push   $0x400
   32442:	6a 00                	push   $0x0
   32444:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   3244a:	50                   	push   %eax
   3244b:	e8 3c 19 00 00       	call   33d8c <Memset>
   32450:	83 c4 10             	add    $0x10,%esp
   32453:	83 ec 04             	sub    $0x4,%esp
   32456:	68 00 02 00 00       	push   $0x200
   3245b:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32461:	50                   	push   %eax
   32462:	68 f0 01 00 00       	push   $0x1f0
   32467:	e8 74 19 00 00       	call   33de0 <read_port>
   3246c:	83 c4 10             	add    $0x10,%esp
   3246f:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32475:	05 be 01 00 00       	add    $0x1be,%eax
   3247a:	83 ec 04             	sub    $0x4,%esp
   3247d:	6a 40                	push   $0x40
   3247f:	50                   	push   %eax
   32480:	ff 75 10             	pushl  0x10(%ebp)
   32483:	e8 d6 18 00 00       	call   33d5e <Memcpy>
   32488:	83 c4 10             	add    $0x10,%esp
   3248b:	90                   	nop
   3248c:	c9                   	leave  
   3248d:	c3                   	ret    

0003248e <partition>:
   3248e:	55                   	push   %ebp
   3248f:	89 e5                	mov    %esp,%ebp
   32491:	81 ec 98 00 00 00    	sub    $0x98,%esp
   32497:	8b 45 0c             	mov    0xc(%ebp),%eax
   3249a:	88 85 74 ff ff ff    	mov    %al,-0x8c(%ebp)
   324a0:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
   324a4:	7f 19                	jg     324bf <partition+0x31>
   324a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
   324a9:	ba 67 66 66 66       	mov    $0x66666667,%edx
   324ae:	89 c8                	mov    %ecx,%eax
   324b0:	f7 ea                	imul   %edx
   324b2:	d1 fa                	sar    %edx
   324b4:	89 c8                	mov    %ecx,%eax
   324b6:	c1 f8 1f             	sar    $0x1f,%eax
   324b9:	29 c2                	sub    %eax,%edx
   324bb:	89 d0                	mov    %edx,%eax
   324bd:	eb 11                	jmp    324d0 <partition+0x42>
   324bf:	8b 45 08             	mov    0x8(%ebp),%eax
   324c2:	83 e8 10             	sub    $0x10,%eax
   324c5:	8d 50 3f             	lea    0x3f(%eax),%edx
   324c8:	85 c0                	test   %eax,%eax
   324ca:	0f 48 c2             	cmovs  %edx,%eax
   324cd:	c1 f8 06             	sar    $0x6,%eax
   324d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
   324d3:	80 bd 74 ff ff ff 00 	cmpb   $0x0,-0x8c(%ebp)
   324da:	0f 85 cc 00 00 00    	jne    325ac <partition+0x11e>
   324e0:	83 ec 04             	sub    $0x4,%esp
   324e3:	6a 50                	push   $0x50
   324e5:	6a 00                	push   $0x0
   324e7:	8d 45 84             	lea    -0x7c(%ebp),%eax
   324ea:	50                   	push   %eax
   324eb:	e8 9c 18 00 00       	call   33d8c <Memset>
   324f0:	83 c4 10             	add    $0x10,%esp
   324f3:	83 ec 04             	sub    $0x4,%esp
   324f6:	8d 45 84             	lea    -0x7c(%ebp),%eax
   324f9:	50                   	push   %eax
   324fa:	6a 00                	push   $0x0
   324fc:	ff 75 e8             	pushl  -0x18(%ebp)
   324ff:	e8 d4 fe ff ff       	call   323d8 <get_partition_table>
   32504:	83 c4 10             	add    $0x10,%esp
   32507:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3250e:	e9 8a 00 00 00       	jmp    3259d <partition+0x10f>
   32513:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32516:	83 c0 01             	add    $0x1,%eax
   32519:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   3251c:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3251f:	c1 e0 04             	shl    $0x4,%eax
   32522:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   32525:	01 c8                	add    %ecx,%eax
   32527:	83 e8 6c             	sub    $0x6c,%eax
   3252a:	8b 00                	mov    (%eax),%eax
   3252c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
   3252f:	8b 55 e8             	mov    -0x18(%ebp),%edx
   32532:	c1 e1 03             	shl    $0x3,%ecx
   32535:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
   3253b:	01 ca                	add    %ecx,%edx
   3253d:	81 c2 a4 a4 03 00    	add    $0x3a4a4,%edx
   32543:	89 02                	mov    %eax,(%edx)
   32545:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32548:	c1 e0 04             	shl    $0x4,%eax
   3254b:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   3254e:	01 c8                	add    %ecx,%eax
   32550:	83 e8 68             	sub    $0x68,%eax
   32553:	8b 00                	mov    (%eax),%eax
   32555:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
   32558:	8b 55 e8             	mov    -0x18(%ebp),%edx
   3255b:	c1 e1 03             	shl    $0x3,%ecx
   3255e:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
   32564:	01 ca                	add    %ecx,%edx
   32566:	81 c2 a8 a4 03 00    	add    $0x3a4a8,%edx
   3256c:	89 02                	mov    %eax,(%edx)
   3256e:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32571:	c1 e0 04             	shl    $0x4,%eax
   32574:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   32577:	01 c8                	add    %ecx,%eax
   32579:	83 e8 70             	sub    $0x70,%eax
   3257c:	0f b6 00             	movzbl (%eax),%eax
   3257f:	3c 05                	cmp    $0x5,%al
   32581:	75 16                	jne    32599 <partition+0x10b>
   32583:	8b 55 08             	mov    0x8(%ebp),%edx
   32586:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32589:	01 d0                	add    %edx,%eax
   3258b:	83 ec 08             	sub    $0x8,%esp
   3258e:	6a 01                	push   $0x1
   32590:	50                   	push   %eax
   32591:	e8 f8 fe ff ff       	call   3248e <partition>
   32596:	83 c4 10             	add    $0x10,%esp
   32599:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3259d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
   325a1:	0f 8e 6c ff ff ff    	jle    32513 <partition+0x85>
   325a7:	e9 28 01 00 00       	jmp    326d4 <partition+0x246>
   325ac:	80 bd 74 ff ff ff 01 	cmpb   $0x1,-0x8c(%ebp)
   325b3:	0f 85 03 01 00 00    	jne    326bc <partition+0x22e>
   325b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
   325bc:	ba 67 66 66 66       	mov    $0x66666667,%edx
   325c1:	89 c8                	mov    %ecx,%eax
   325c3:	f7 ea                	imul   %edx
   325c5:	d1 fa                	sar    %edx
   325c7:	89 c8                	mov    %ecx,%eax
   325c9:	c1 f8 1f             	sar    $0x1f,%eax
   325cc:	29 c2                	sub    %eax,%edx
   325ce:	89 d0                	mov    %edx,%eax
   325d0:	c1 e0 02             	shl    $0x2,%eax
   325d3:	01 d0                	add    %edx,%eax
   325d5:	29 c1                	sub    %eax,%ecx
   325d7:	89 c8                	mov    %ecx,%eax
   325d9:	89 45 e0             	mov    %eax,-0x20(%ebp)
   325dc:	8b 55 e0             	mov    -0x20(%ebp),%edx
   325df:	8b 45 e8             	mov    -0x18(%ebp),%eax
   325e2:	c1 e2 03             	shl    $0x3,%edx
   325e5:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   325eb:	01 d0                	add    %edx,%eax
   325ed:	05 a4 a4 03 00       	add    $0x3a4a4,%eax
   325f2:	8b 00                	mov    (%eax),%eax
   325f4:	89 45 dc             	mov    %eax,-0x24(%ebp)
   325f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
   325fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
   325fd:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32600:	83 e8 01             	sub    $0x1,%eax
   32603:	c1 e0 04             	shl    $0x4,%eax
   32606:	89 45 d8             	mov    %eax,-0x28(%ebp)
   32609:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   32610:	e9 9b 00 00 00       	jmp    326b0 <partition+0x222>
   32615:	83 ec 04             	sub    $0x4,%esp
   32618:	6a 50                	push   $0x50
   3261a:	6a 00                	push   $0x0
   3261c:	8d 45 84             	lea    -0x7c(%ebp),%eax
   3261f:	50                   	push   %eax
   32620:	e8 67 17 00 00       	call   33d8c <Memset>
   32625:	83 c4 10             	add    $0x10,%esp
   32628:	83 ec 04             	sub    $0x4,%esp
   3262b:	8d 45 84             	lea    -0x7c(%ebp),%eax
   3262e:	50                   	push   %eax
   3262f:	ff 75 f0             	pushl  -0x10(%ebp)
   32632:	ff 75 e8             	pushl  -0x18(%ebp)
   32635:	e8 9e fd ff ff       	call   323d8 <get_partition_table>
   3263a:	83 c4 10             	add    $0x10,%esp
   3263d:	83 ec 0c             	sub    $0xc,%esp
   32640:	8d 45 84             	lea    -0x7c(%ebp),%eax
   32643:	50                   	push   %eax
   32644:	e8 6b fd ff ff       	call   323b4 <print_dpt_entry>
   32649:	83 c4 10             	add    $0x10,%esp
   3264c:	8b 55 d8             	mov    -0x28(%ebp),%edx
   3264f:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32652:	01 d0                	add    %edx,%eax
   32654:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   32657:	8b 55 8c             	mov    -0x74(%ebp),%edx
   3265a:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3265d:	01 c2                	add    %eax,%edx
   3265f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
   32662:	8d 48 04             	lea    0x4(%eax),%ecx
   32665:	8b 45 e8             	mov    -0x18(%ebp),%eax
   32668:	c1 e1 03             	shl    $0x3,%ecx
   3266b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   32671:	01 c8                	add    %ecx,%eax
   32673:	05 a4 a4 03 00       	add    $0x3a4a4,%eax
   32678:	89 10                	mov    %edx,(%eax)
   3267a:	8b 45 90             	mov    -0x70(%ebp),%eax
   3267d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
   32680:	8d 4a 04             	lea    0x4(%edx),%ecx
   32683:	8b 55 e8             	mov    -0x18(%ebp),%edx
   32686:	c1 e1 03             	shl    $0x3,%ecx
   32689:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
   3268f:	01 ca                	add    %ecx,%edx
   32691:	81 c2 a8 a4 03 00    	add    $0x3a4a8,%edx
   32697:	89 02                	mov    %eax,(%edx)
   32699:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
   3269d:	84 c0                	test   %al,%al
   3269f:	74 32                	je     326d3 <partition+0x245>
   326a1:	8b 55 9c             	mov    -0x64(%ebp),%edx
   326a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
   326a7:	01 d0                	add    %edx,%eax
   326a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
   326ac:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   326b0:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
   326b4:	0f 8e 5b ff ff ff    	jle    32615 <partition+0x187>
   326ba:	eb 18                	jmp    326d4 <partition+0x246>
   326bc:	83 ec 08             	sub    $0x8,%esp
   326bf:	68 1c 3d 03 00       	push   $0x33d1c
   326c4:	68 51 3c 03 00       	push   $0x33c51
   326c9:	e8 ed ea ff ff       	call   311bb <Printf>
   326ce:	83 c4 10             	add    $0x10,%esp
   326d1:	eb 01                	jmp    326d4 <partition+0x246>
   326d3:	90                   	nop
   326d4:	90                   	nop
   326d5:	c9                   	leave  
   326d6:	c3                   	ret    

000326d7 <hd_open>:
   326d7:	55                   	push   %ebp
   326d8:	89 e5                	mov    %esp,%ebp
   326da:	83 ec 18             	sub    $0x18,%esp
   326dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   326e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
   326e7:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   326ed:	05 a0 a4 03 00       	add    $0x3a4a0,%eax
   326f2:	8b 00                	mov    (%eax),%eax
   326f4:	8d 50 01             	lea    0x1(%eax),%edx
   326f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
   326fa:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   32700:	05 a0 a4 03 00       	add    $0x3a4a0,%eax
   32705:	89 10                	mov    %edx,(%eax)
   32707:	83 ec 08             	sub    $0x8,%esp
   3270a:	6a 00                	push   $0x0
   3270c:	6a 00                	push   $0x0
   3270e:	e8 7b fd ff ff       	call   3248e <partition>
   32713:	83 c4 10             	add    $0x10,%esp
   32716:	83 ec 0c             	sub    $0xc,%esp
   32719:	6a 02                	push   $0x2
   3271b:	e8 1b 00 00 00       	call   3273b <get_hd_ioctl>
   32720:	83 c4 10             	add    $0x10,%esp
   32723:	83 ec 08             	sub    $0x8,%esp
   32726:	68 27 3d 03 00       	push   $0x33d27
   3272b:	68 51 3c 03 00       	push   $0x33c51
   32730:	e8 86 ea ff ff       	call   311bb <Printf>
   32735:	83 c4 10             	add    $0x10,%esp
   32738:	90                   	nop
   32739:	c9                   	leave  
   3273a:	c3                   	ret    

0003273b <get_hd_ioctl>:
   3273b:	55                   	push   %ebp
   3273c:	89 e5                	mov    %esp,%ebp
   3273e:	83 ec 18             	sub    $0x18,%esp
   32741:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
   32745:	7f 19                	jg     32760 <get_hd_ioctl+0x25>
   32747:	8b 4d 08             	mov    0x8(%ebp),%ecx
   3274a:	ba 67 66 66 66       	mov    $0x66666667,%edx
   3274f:	89 c8                	mov    %ecx,%eax
   32751:	f7 ea                	imul   %edx
   32753:	d1 fa                	sar    %edx
   32755:	89 c8                	mov    %ecx,%eax
   32757:	c1 f8 1f             	sar    $0x1f,%eax
   3275a:	29 c2                	sub    %eax,%edx
   3275c:	89 d0                	mov    %edx,%eax
   3275e:	eb 11                	jmp    32771 <get_hd_ioctl+0x36>
   32760:	8b 45 08             	mov    0x8(%ebp),%eax
   32763:	83 e8 10             	sub    $0x10,%eax
   32766:	8d 50 3f             	lea    0x3f(%eax),%edx
   32769:	85 c0                	test   %eax,%eax
   3276b:	0f 48 c2             	cmovs  %edx,%eax
   3276e:	c1 f8 06             	sar    $0x6,%eax
   32771:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32774:	8b 55 08             	mov    0x8(%ebp),%edx
   32777:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3277a:	c1 e2 03             	shl    $0x3,%edx
   3277d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   32783:	01 d0                	add    %edx,%eax
   32785:	05 a8 a4 03 00       	add    $0x3a4a8,%eax
   3278a:	8b 00                	mov    (%eax),%eax
   3278c:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3278f:	83 ec 08             	sub    $0x8,%esp
   32792:	ff 75 f0             	pushl  -0x10(%ebp)
   32795:	68 2c 3d 03 00       	push   $0x33d2c
   3279a:	e8 1c ea ff ff       	call   311bb <Printf>
   3279f:	83 c4 10             	add    $0x10,%esp
   327a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
   327a5:	c9                   	leave  
   327a6:	c3                   	ret    
   327a7:	66 90                	xchg   %ax,%ax
   327a9:	66 90                	xchg   %ax,%ax
   327ab:	66 90                	xchg   %ax,%ax
   327ad:	66 90                	xchg   %ax,%ax
   327af:	90                   	nop

000327b0 <get_ticks>:
   327b0:	b8 00 00 00 00       	mov    $0x0,%eax
   327b5:	cd 90                	int    $0x90
   327b7:	c3                   	ret    

000327b8 <write>:
   327b8:	b8 01 00 00 00       	mov    $0x1,%eax
   327bd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   327c1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   327c5:	cd 90                	int    $0x90
   327c7:	c3                   	ret    

000327c8 <write_debug>:
   327c8:	b8 02 00 00 00       	mov    $0x2,%eax
   327cd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   327d1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   327d5:	cd 90                	int    $0x90
   327d7:	c3                   	ret    

000327d8 <send_msg>:
   327d8:	b8 03 00 00 00       	mov    $0x3,%eax
   327dd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   327e1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   327e5:	cd 90                	int    $0x90
   327e7:	c3                   	ret    

000327e8 <receive_msg>:
   327e8:	b8 04 00 00 00       	mov    $0x4,%eax
   327ed:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   327f1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   327f5:	cd 90                	int    $0x90
   327f7:	c3                   	ret    

000327f8 <task_fs>:
   327f8:	55                   	push   %ebp
   327f9:	89 e5                	mov    %esp,%ebp
   327fb:	83 ec 18             	sub    $0x18,%esp
   327fe:	83 ec 08             	sub    $0x8,%esp
   32801:	68 39 3d 03 00       	push   $0x33d39
   32806:	68 47 3d 03 00       	push   $0x33d47
   3280b:	e8 ab e9 ff ff       	call   311bb <Printf>
   32810:	83 c4 10             	add    $0x10,%esp
   32813:	c7 45 f0 e9 03 00 00 	movl   $0x3e9,-0x10(%ebp)
   3281a:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
   32821:	83 ec 04             	sub    $0x4,%esp
   32824:	6a 02                	push   $0x2
   32826:	8d 45 ec             	lea    -0x14(%ebp),%eax
   32829:	50                   	push   %eax
   3282a:	6a 03                	push   $0x3
   3282c:	e8 1d f4 ff ff       	call   31c4e <send_rec>
   32831:	83 c4 10             	add    $0x10,%esp
   32834:	c7 45 f0 ea 03 00 00 	movl   $0x3ea,-0x10(%ebp)
   3283b:	c7 45 ec 03 00 00 00 	movl   $0x3,-0x14(%ebp)
   32842:	83 ec 04             	sub    $0x4,%esp
   32845:	6a 02                	push   $0x2
   32847:	8d 45 ec             	lea    -0x14(%ebp),%eax
   3284a:	50                   	push   %eax
   3284b:	6a 03                	push   $0x3
   3284d:	e8 fc f3 ff ff       	call   31c4e <send_rec>
   32852:	83 c4 10             	add    $0x10,%esp
   32855:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32858:	83 ec 08             	sub    $0x8,%esp
   3285b:	50                   	push   %eax
   3285c:	68 4b 3d 03 00       	push   $0x33d4b
   32861:	e8 55 e9 ff ff       	call   311bb <Printf>
   32866:	83 c4 10             	add    $0x10,%esp
   32869:	83 ec 0c             	sub    $0xc,%esp
   3286c:	68 54 3d 03 00       	push   $0x33d54
   32871:	e8 6f ec ff ff       	call   314e5 <spin>
   32876:	83 c4 10             	add    $0x10,%esp
   32879:	90                   	nop
   3287a:	c9                   	leave  
   3287b:	c3                   	ret    

0003287c <schedule_process>:
   3287c:	55                   	push   %ebp
   3287d:	89 e5                	mov    %esp,%ebp
   3287f:	83 ec 10             	sub    $0x10,%esp
   32882:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   32889:	eb 78                	jmp    32903 <schedule_process+0x87>
   3288b:	c7 45 fc e0 16 04 00 	movl   $0x416e0,-0x4(%ebp)
   32892:	eb 2e                	jmp    328c2 <schedule_process+0x46>
   32894:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32897:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   3289b:	84 c0                	test   %al,%al
   3289d:	75 1c                	jne    328bb <schedule_process+0x3f>
   3289f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   328a2:	8b 40 5c             	mov    0x5c(%eax),%eax
   328a5:	39 45 f8             	cmp    %eax,-0x8(%ebp)
   328a8:	73 11                	jae    328bb <schedule_process+0x3f>
   328aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
   328ad:	8b 40 5c             	mov    0x5c(%eax),%eax
   328b0:	89 45 f8             	mov    %eax,-0x8(%ebp)
   328b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
   328b6:	a3 a0 72 03 00       	mov    %eax,0x372a0
   328bb:	81 45 fc 90 00 00 00 	addl   $0x90,-0x4(%ebp)
   328c2:	b8 d0 1a 04 00       	mov    $0x41ad0,%eax
   328c7:	39 45 fc             	cmp    %eax,-0x4(%ebp)
   328ca:	72 c8                	jb     32894 <schedule_process+0x18>
   328cc:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
   328d0:	75 31                	jne    32903 <schedule_process+0x87>
   328d2:	c7 45 fc e0 16 04 00 	movl   $0x416e0,-0x4(%ebp)
   328d9:	eb 1e                	jmp    328f9 <schedule_process+0x7d>
   328db:	8b 45 fc             	mov    -0x4(%ebp),%eax
   328de:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   328e2:	84 c0                	test   %al,%al
   328e4:	75 0c                	jne    328f2 <schedule_process+0x76>
   328e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
   328e9:	8b 50 60             	mov    0x60(%eax),%edx
   328ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
   328ef:	89 50 5c             	mov    %edx,0x5c(%eax)
   328f2:	81 45 fc 90 00 00 00 	addl   $0x90,-0x4(%ebp)
   328f9:	b8 d0 1a 04 00       	mov    $0x41ad0,%eax
   328fe:	39 45 fc             	cmp    %eax,-0x4(%ebp)
   32901:	72 d8                	jb     328db <schedule_process+0x5f>
   32903:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
   32907:	74 82                	je     3288b <schedule_process+0xf>
   32909:	90                   	nop
   3290a:	c9                   	leave  
   3290b:	c3                   	ret    

0003290c <clock_handler>:
   3290c:	55                   	push   %ebp
   3290d:	89 e5                	mov    %esp,%ebp
   3290f:	a1 a0 72 03 00       	mov    0x372a0,%eax
   32914:	8b 40 5c             	mov    0x5c(%eax),%eax
   32917:	85 c0                	test   %eax,%eax
   32919:	74 0e                	je     32929 <clock_handler+0x1d>
   3291b:	a1 a0 72 03 00       	mov    0x372a0,%eax
   32920:	8b 50 5c             	mov    0x5c(%eax),%edx
   32923:	83 ea 01             	sub    $0x1,%edx
   32926:	89 50 5c             	mov    %edx,0x5c(%eax)
   32929:	a1 40 a4 03 00       	mov    0x3a440,%eax
   3292e:	83 c0 01             	add    $0x1,%eax
   32931:	a3 40 a4 03 00       	mov    %eax,0x3a440
   32936:	a1 94 6e 03 00       	mov    0x36e94,%eax
   3293b:	85 c0                	test   %eax,%eax
   3293d:	75 13                	jne    32952 <clock_handler+0x46>
   3293f:	a1 a0 72 03 00       	mov    0x372a0,%eax
   32944:	8b 40 5c             	mov    0x5c(%eax),%eax
   32947:	85 c0                	test   %eax,%eax
   32949:	75 0a                	jne    32955 <clock_handler+0x49>
   3294b:	e8 2c ff ff ff       	call   3287c <schedule_process>
   32950:	eb 04                	jmp    32956 <clock_handler+0x4a>
   32952:	90                   	nop
   32953:	eb 01                	jmp    32956 <clock_handler+0x4a>
   32955:	90                   	nop
   32956:	5d                   	pop    %ebp
   32957:	c3                   	ret    

00032958 <pid2proc>:
   32958:	55                   	push   %ebp
   32959:	89 e5                	mov    %esp,%ebp
   3295b:	83 ec 10             	sub    $0x10,%esp
   3295e:	8b 55 08             	mov    0x8(%ebp),%edx
   32961:	89 d0                	mov    %edx,%eax
   32963:	c1 e0 03             	shl    $0x3,%eax
   32966:	01 d0                	add    %edx,%eax
   32968:	c1 e0 04             	shl    $0x4,%eax
   3296b:	05 e0 16 04 00       	add    $0x416e0,%eax
   32970:	89 45 fc             	mov    %eax,-0x4(%ebp)
   32973:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32976:	c9                   	leave  
   32977:	c3                   	ret    

00032978 <proc2pid>:
   32978:	55                   	push   %ebp
   32979:	89 e5                	mov    %esp,%ebp
   3297b:	83 ec 10             	sub    $0x10,%esp
   3297e:	8b 45 08             	mov    0x8(%ebp),%eax
   32981:	2d e0 16 04 00       	sub    $0x416e0,%eax
   32986:	c1 f8 04             	sar    $0x4,%eax
   32989:	69 c0 39 8e e3 38    	imul   $0x38e38e39,%eax,%eax
   3298f:	89 45 fc             	mov    %eax,-0x4(%ebp)
   32992:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32995:	c9                   	leave  
   32996:	c3                   	ret    

00032997 <InitDescriptor>:
   32997:	55                   	push   %ebp
   32998:	89 e5                	mov    %esp,%ebp
   3299a:	83 ec 04             	sub    $0x4,%esp
   3299d:	8b 45 14             	mov    0x14(%ebp),%eax
   329a0:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
   329a4:	8b 45 10             	mov    0x10(%ebp),%eax
   329a7:	89 c2                	mov    %eax,%edx
   329a9:	8b 45 08             	mov    0x8(%ebp),%eax
   329ac:	66 89 10             	mov    %dx,(%eax)
   329af:	8b 45 0c             	mov    0xc(%ebp),%eax
   329b2:	89 c2                	mov    %eax,%edx
   329b4:	8b 45 08             	mov    0x8(%ebp),%eax
   329b7:	66 89 50 02          	mov    %dx,0x2(%eax)
   329bb:	8b 45 0c             	mov    0xc(%ebp),%eax
   329be:	c1 e8 10             	shr    $0x10,%eax
   329c1:	89 c2                	mov    %eax,%edx
   329c3:	8b 45 08             	mov    0x8(%ebp),%eax
   329c6:	88 50 04             	mov    %dl,0x4(%eax)
   329c9:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
   329cd:	89 c2                	mov    %eax,%edx
   329cf:	8b 45 08             	mov    0x8(%ebp),%eax
   329d2:	88 50 05             	mov    %dl,0x5(%eax)
   329d5:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
   329d9:	66 c1 e8 08          	shr    $0x8,%ax
   329dd:	c1 e0 04             	shl    $0x4,%eax
   329e0:	89 c2                	mov    %eax,%edx
   329e2:	8b 45 10             	mov    0x10(%ebp),%eax
   329e5:	c1 e8 10             	shr    $0x10,%eax
   329e8:	83 e0 0f             	and    $0xf,%eax
   329eb:	09 c2                	or     %eax,%edx
   329ed:	8b 45 08             	mov    0x8(%ebp),%eax
   329f0:	88 50 06             	mov    %dl,0x6(%eax)
   329f3:	8b 45 0c             	mov    0xc(%ebp),%eax
   329f6:	c1 e8 18             	shr    $0x18,%eax
   329f9:	89 c2                	mov    %eax,%edx
   329fb:	8b 45 08             	mov    0x8(%ebp),%eax
   329fe:	88 50 07             	mov    %dl,0x7(%eax)
   32a01:	90                   	nop
   32a02:	c9                   	leave  
   32a03:	c3                   	ret    

00032a04 <Seg2PhyAddr>:
   32a04:	55                   	push   %ebp
   32a05:	89 e5                	mov    %esp,%ebp
   32a07:	83 ec 10             	sub    $0x10,%esp
   32a0a:	8b 45 08             	mov    0x8(%ebp),%eax
   32a0d:	c1 e8 03             	shr    $0x3,%eax
   32a10:	8b 14 c5 a4 6e 03 00 	mov    0x36ea4(,%eax,8),%edx
   32a17:	8b 04 c5 a0 6e 03 00 	mov    0x36ea0(,%eax,8),%eax
   32a1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32a21:	89 55 f8             	mov    %edx,-0x8(%ebp)
   32a24:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
   32a28:	0f b7 c0             	movzwl %ax,%eax
   32a2b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
   32a2f:	0f b6 d2             	movzbl %dl,%edx
   32a32:	c1 e2 10             	shl    $0x10,%edx
   32a35:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
   32a3b:	09 d0                	or     %edx,%eax
   32a3d:	89 45 fc             	mov    %eax,-0x4(%ebp)
   32a40:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32a43:	c9                   	leave  
   32a44:	c3                   	ret    

00032a45 <Seg2PhyAddrLDT>:
   32a45:	55                   	push   %ebp
   32a46:	89 e5                	mov    %esp,%ebp
   32a48:	83 ec 10             	sub    $0x10,%esp
   32a4b:	8b 45 08             	mov    0x8(%ebp),%eax
   32a4e:	c1 e8 03             	shr    $0x3,%eax
   32a51:	89 c2                	mov    %eax,%edx
   32a53:	8b 45 0c             	mov    0xc(%ebp),%eax
   32a56:	83 c2 08             	add    $0x8,%edx
   32a59:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
   32a5d:	8b 02                	mov    (%edx),%eax
   32a5f:	8b 52 04             	mov    0x4(%edx),%edx
   32a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32a65:	89 55 f8             	mov    %edx,-0x8(%ebp)
   32a68:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
   32a6c:	0f b7 c0             	movzwl %ax,%eax
   32a6f:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
   32a73:	0f b6 d2             	movzbl %dl,%edx
   32a76:	c1 e2 10             	shl    $0x10,%edx
   32a79:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
   32a7f:	09 d0                	or     %edx,%eax
   32a81:	89 45 fc             	mov    %eax,-0x4(%ebp)
   32a84:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32a87:	c9                   	leave  
   32a88:	c3                   	ret    

00032a89 <VirAddr2PhyAddr>:
   32a89:	55                   	push   %ebp
   32a8a:	89 e5                	mov    %esp,%ebp
   32a8c:	83 ec 10             	sub    $0x10,%esp
   32a8f:	8b 55 0c             	mov    0xc(%ebp),%edx
   32a92:	8b 45 08             	mov    0x8(%ebp),%eax
   32a95:	01 d0                	add    %edx,%eax
   32a97:	89 45 fc             	mov    %eax,-0x4(%ebp)
   32a9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32a9d:	c9                   	leave  
   32a9e:	c3                   	ret    

00032a9f <init_propt>:
   32a9f:	55                   	push   %ebp
   32aa0:	89 e5                	mov    %esp,%ebp
   32aa2:	53                   	push   %ebx
   32aa3:	83 ec 24             	sub    $0x24,%esp
   32aa6:	6a 0e                	push   $0xe
   32aa8:	6a 08                	push   $0x8
   32aaa:	68 61 05 03 00       	push   $0x30561
   32aaf:	6a 20                	push   $0x20
   32ab1:	e8 57 01 00 00       	call   32c0d <InitInterruptDesc>
   32ab6:	83 c4 10             	add    $0x10,%esp
   32ab9:	6a 0e                	push   $0xe
   32abb:	6a 08                	push   $0x8
   32abd:	68 aa 05 03 00       	push   $0x305aa
   32ac2:	6a 21                	push   $0x21
   32ac4:	e8 44 01 00 00       	call   32c0d <InitInterruptDesc>
   32ac9:	83 c4 10             	add    $0x10,%esp
   32acc:	6a 0e                	push   $0xe
   32ace:	6a 08                	push   $0x8
   32ad0:	68 f3 05 03 00       	push   $0x305f3
   32ad5:	6a 2e                	push   $0x2e
   32ad7:	e8 31 01 00 00       	call   32c0d <InitInterruptDesc>
   32adc:	83 c4 10             	add    $0x10,%esp
   32adf:	83 ec 04             	sub    $0x4,%esp
   32ae2:	68 f0 03 00 00       	push   $0x3f0
   32ae7:	6a 00                	push   $0x0
   32ae9:	68 e0 16 04 00       	push   $0x416e0
   32aee:	e8 99 12 00 00       	call   33d8c <Memset>
   32af3:	83 c4 10             	add    $0x10,%esp
   32af6:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
   32afd:	83 ec 04             	sub    $0x4,%esp
   32b00:	ff 75 f0             	pushl  -0x10(%ebp)
   32b03:	6a 00                	push   $0x0
   32b05:	68 c0 9b 03 00       	push   $0x39bc0
   32b0a:	e8 7d 12 00 00       	call   33d8c <Memset>
   32b0f:	83 c4 10             	add    $0x10,%esp
   32b12:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32b15:	a3 28 9c 03 00       	mov    %eax,0x39c28
   32b1a:	c7 05 c8 9b 03 00 30 	movl   $0x30,0x39bc8
   32b21:	00 00 00 
   32b24:	83 ec 0c             	sub    $0xc,%esp
   32b27:	6a 30                	push   $0x30
   32b29:	e8 d6 fe ff ff       	call   32a04 <Seg2PhyAddr>
   32b2e:	83 c4 10             	add    $0x10,%esp
   32b31:	89 45 ec             	mov    %eax,-0x14(%ebp)
   32b34:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32b37:	83 ec 08             	sub    $0x8,%esp
   32b3a:	68 c0 9b 03 00       	push   $0x39bc0
   32b3f:	50                   	push   %eax
   32b40:	e8 44 ff ff ff       	call   32a89 <VirAddr2PhyAddr>
   32b45:	83 c4 10             	add    $0x10,%esp
   32b48:	89 45 e8             	mov    %eax,-0x18(%ebp)
   32b4b:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
   32b52:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32b55:	0f b7 d0             	movzwl %ax,%edx
   32b58:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32b5b:	83 e8 01             	sub    $0x1,%eax
   32b5e:	89 c1                	mov    %eax,%ecx
   32b60:	8b 45 e8             	mov    -0x18(%ebp),%eax
   32b63:	52                   	push   %edx
   32b64:	51                   	push   %ecx
   32b65:	50                   	push   %eax
   32b66:	68 e0 6e 03 00       	push   $0x36ee0
   32b6b:	e8 27 fe ff ff       	call   32997 <InitDescriptor>
   32b70:	83 c4 10             	add    $0x10,%esp
   32b73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   32b7a:	eb 69                	jmp    32be5 <init_propt+0x146>
   32b7c:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
   32b83:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
   32b8a:	8b 55 f4             	mov    -0xc(%ebp),%edx
   32b8d:	89 d0                	mov    %edx,%eax
   32b8f:	c1 e0 03             	shl    $0x3,%eax
   32b92:	01 d0                	add    %edx,%eax
   32b94:	c1 e0 04             	shl    $0x4,%eax
   32b97:	83 c0 40             	add    $0x40,%eax
   32b9a:	05 e0 16 04 00       	add    $0x416e0,%eax
   32b9f:	8d 50 06             	lea    0x6(%eax),%edx
   32ba2:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32ba5:	83 ec 08             	sub    $0x8,%esp
   32ba8:	52                   	push   %edx
   32ba9:	50                   	push   %eax
   32baa:	e8 da fe ff ff       	call   32a89 <VirAddr2PhyAddr>
   32baf:	83 c4 10             	add    $0x10,%esp
   32bb2:	89 45 d8             	mov    %eax,-0x28(%ebp)
   32bb5:	8b 45 dc             	mov    -0x24(%ebp),%eax
   32bb8:	0f b7 d0             	movzwl %ax,%edx
   32bbb:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32bbe:	83 e8 01             	sub    $0x1,%eax
   32bc1:	89 c3                	mov    %eax,%ebx
   32bc3:	8b 45 d8             	mov    -0x28(%ebp),%eax
   32bc6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
   32bc9:	83 c1 09             	add    $0x9,%ecx
   32bcc:	c1 e1 03             	shl    $0x3,%ecx
   32bcf:	81 c1 a0 6e 03 00    	add    $0x36ea0,%ecx
   32bd5:	52                   	push   %edx
   32bd6:	53                   	push   %ebx
   32bd7:	50                   	push   %eax
   32bd8:	51                   	push   %ecx
   32bd9:	e8 b9 fd ff ff       	call   32997 <InitDescriptor>
   32bde:	83 c4 10             	add    $0x10,%esp
   32be1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   32be5:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
   32be9:	7e 91                	jle    32b7c <init_propt+0xdd>
   32beb:	68 f2 00 00 00       	push   $0xf2
   32bf0:	68 ff ff 00 00       	push   $0xffff
   32bf5:	68 00 80 0b 00       	push   $0xb8000
   32bfa:	68 d8 6e 03 00       	push   $0x36ed8
   32bff:	e8 93 fd ff ff       	call   32997 <InitDescriptor>
   32c04:	83 c4 10             	add    $0x10,%esp
   32c07:	90                   	nop
   32c08:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   32c0b:	c9                   	leave  
   32c0c:	c3                   	ret    

00032c0d <InitInterruptDesc>:
   32c0d:	55                   	push   %ebp
   32c0e:	89 e5                	mov    %esp,%ebp
   32c10:	83 ec 10             	sub    $0x10,%esp
   32c13:	8b 45 08             	mov    0x8(%ebp),%eax
   32c16:	c1 e0 03             	shl    $0x3,%eax
   32c19:	05 40 9c 03 00       	add    $0x39c40,%eax
   32c1e:	89 45 fc             	mov    %eax,-0x4(%ebp)
   32c21:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32c24:	c6 40 04 00          	movb   $0x0,0x4(%eax)
   32c28:	8b 45 0c             	mov    0xc(%ebp),%eax
   32c2b:	89 45 f8             	mov    %eax,-0x8(%ebp)
   32c2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
   32c31:	89 c2                	mov    %eax,%edx
   32c33:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32c36:	66 89 10             	mov    %dx,(%eax)
   32c39:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32c3c:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
   32c42:	8b 45 f8             	mov    -0x8(%ebp),%eax
   32c45:	c1 f8 10             	sar    $0x10,%eax
   32c48:	89 c2                	mov    %eax,%edx
   32c4a:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32c4d:	66 89 50 06          	mov    %dx,0x6(%eax)
   32c51:	8b 45 10             	mov    0x10(%ebp),%eax
   32c54:	c1 e0 04             	shl    $0x4,%eax
   32c57:	89 c2                	mov    %eax,%edx
   32c59:	8b 45 14             	mov    0x14(%ebp),%eax
   32c5c:	09 d0                	or     %edx,%eax
   32c5e:	89 c2                	mov    %eax,%edx
   32c60:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32c63:	88 50 05             	mov    %dl,0x5(%eax)
   32c66:	90                   	nop
   32c67:	c9                   	leave  
   32c68:	c3                   	ret    

00032c69 <ReloadGDT>:
   32c69:	55                   	push   %ebp
   32c6a:	89 e5                	mov    %esp,%ebp
   32c6c:	83 ec 28             	sub    $0x28,%esp
   32c6f:	b8 34 9c 03 00       	mov    $0x39c34,%eax
   32c74:	0f b7 00             	movzwl (%eax),%eax
   32c77:	98                   	cwtl   
   32c78:	ba 36 9c 03 00       	mov    $0x39c36,%edx
   32c7d:	8b 12                	mov    (%edx),%edx
   32c7f:	83 ec 04             	sub    $0x4,%esp
   32c82:	50                   	push   %eax
   32c83:	52                   	push   %edx
   32c84:	68 a0 6e 03 00       	push   $0x36ea0
   32c89:	e8 d0 10 00 00       	call   33d5e <Memcpy>
   32c8e:	83 c4 10             	add    $0x10,%esp
   32c91:	c7 45 f0 34 9c 03 00 	movl   $0x39c34,-0x10(%ebp)
   32c98:	c7 45 ec 36 9c 03 00 	movl   $0x39c36,-0x14(%ebp)
   32c9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32ca2:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   32ca7:	ba a0 6e 03 00       	mov    $0x36ea0,%edx
   32cac:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32caf:	89 10                	mov    %edx,(%eax)
   32cb1:	c7 45 e8 88 6e 03 00 	movl   $0x36e88,-0x18(%ebp)
   32cb8:	c7 45 e4 8a 6e 03 00 	movl   $0x36e8a,-0x1c(%ebp)
   32cbf:	8b 45 e8             	mov    -0x18(%ebp),%eax
   32cc2:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   32cc7:	ba 40 9c 03 00       	mov    $0x39c40,%edx
   32ccc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32ccf:	89 10                	mov    %edx,(%eax)
   32cd1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   32cd8:	eb 04                	jmp    32cde <ReloadGDT+0x75>
   32cda:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   32cde:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
   32ce5:	7e f3                	jle    32cda <ReloadGDT+0x71>
   32ce7:	e8 31 dd ff ff       	call   30a1d <init_internal_interrupt>
   32cec:	e8 ae fd ff ff       	call   32a9f <init_propt>
   32cf1:	90                   	nop
   32cf2:	c9                   	leave  
   32cf3:	c3                   	ret    

00032cf4 <select_console>:
   32cf4:	55                   	push   %ebp
   32cf5:	89 e5                	mov    %esp,%ebp
   32cf7:	83 ec 18             	sub    $0x18,%esp
   32cfa:	8b 45 08             	mov    0x8(%ebp),%eax
   32cfd:	88 45 f4             	mov    %al,-0xc(%ebp)
   32d00:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
   32d04:	77 27                	ja     32d2d <select_console+0x39>
   32d06:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
   32d0a:	69 c0 90 0c 00 00    	imul   $0xc90,%eax,%eax
   32d10:	05 00 76 03 00       	add    $0x37600,%eax
   32d15:	a3 80 6e 03 00       	mov    %eax,0x36e80
   32d1a:	a1 80 6e 03 00       	mov    0x36e80,%eax
   32d1f:	83 ec 0c             	sub    $0xc,%esp
   32d22:	50                   	push   %eax
   32d23:	e8 08 00 00 00       	call   32d30 <flush>
   32d28:	83 c4 10             	add    $0x10,%esp
   32d2b:	eb 01                	jmp    32d2e <select_console+0x3a>
   32d2d:	90                   	nop
   32d2e:	c9                   	leave  
   32d2f:	c3                   	ret    

00032d30 <flush>:
   32d30:	55                   	push   %ebp
   32d31:	89 e5                	mov    %esp,%ebp
   32d33:	83 ec 08             	sub    $0x8,%esp
   32d36:	8b 45 08             	mov    0x8(%ebp),%eax
   32d39:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32d3f:	8b 40 0c             	mov    0xc(%eax),%eax
   32d42:	83 ec 0c             	sub    $0xc,%esp
   32d45:	50                   	push   %eax
   32d46:	e8 1e 00 00 00       	call   32d69 <set_cursor>
   32d4b:	83 c4 10             	add    $0x10,%esp
   32d4e:	8b 45 08             	mov    0x8(%ebp),%eax
   32d51:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32d57:	8b 40 08             	mov    0x8(%eax),%eax
   32d5a:	83 ec 0c             	sub    $0xc,%esp
   32d5d:	50                   	push   %eax
   32d5e:	e8 64 00 00 00       	call   32dc7 <set_console_start_video_addr>
   32d63:	83 c4 10             	add    $0x10,%esp
   32d66:	90                   	nop
   32d67:	c9                   	leave  
   32d68:	c3                   	ret    

00032d69 <set_cursor>:
   32d69:	55                   	push   %ebp
   32d6a:	89 e5                	mov    %esp,%ebp
   32d6c:	83 ec 08             	sub    $0x8,%esp
   32d6f:	83 ec 08             	sub    $0x8,%esp
   32d72:	6a 0e                	push   $0xe
   32d74:	68 d4 03 00 00       	push   $0x3d4
   32d79:	e8 5a d9 ff ff       	call   306d8 <out_byte>
   32d7e:	83 c4 10             	add    $0x10,%esp
   32d81:	8b 45 08             	mov    0x8(%ebp),%eax
   32d84:	c1 e8 08             	shr    $0x8,%eax
   32d87:	0f b7 c0             	movzwl %ax,%eax
   32d8a:	83 ec 08             	sub    $0x8,%esp
   32d8d:	50                   	push   %eax
   32d8e:	68 d5 03 00 00       	push   $0x3d5
   32d93:	e8 40 d9 ff ff       	call   306d8 <out_byte>
   32d98:	83 c4 10             	add    $0x10,%esp
   32d9b:	83 ec 08             	sub    $0x8,%esp
   32d9e:	6a 0f                	push   $0xf
   32da0:	68 d4 03 00 00       	push   $0x3d4
   32da5:	e8 2e d9 ff ff       	call   306d8 <out_byte>
   32daa:	83 c4 10             	add    $0x10,%esp
   32dad:	8b 45 08             	mov    0x8(%ebp),%eax
   32db0:	0f b7 c0             	movzwl %ax,%eax
   32db3:	83 ec 08             	sub    $0x8,%esp
   32db6:	50                   	push   %eax
   32db7:	68 d5 03 00 00       	push   $0x3d5
   32dbc:	e8 17 d9 ff ff       	call   306d8 <out_byte>
   32dc1:	83 c4 10             	add    $0x10,%esp
   32dc4:	90                   	nop
   32dc5:	c9                   	leave  
   32dc6:	c3                   	ret    

00032dc7 <set_console_start_video_addr>:
   32dc7:	55                   	push   %ebp
   32dc8:	89 e5                	mov    %esp,%ebp
   32dca:	83 ec 08             	sub    $0x8,%esp
   32dcd:	83 ec 08             	sub    $0x8,%esp
   32dd0:	6a 0c                	push   $0xc
   32dd2:	68 d4 03 00 00       	push   $0x3d4
   32dd7:	e8 fc d8 ff ff       	call   306d8 <out_byte>
   32ddc:	83 c4 10             	add    $0x10,%esp
   32ddf:	8b 45 08             	mov    0x8(%ebp),%eax
   32de2:	c1 e8 08             	shr    $0x8,%eax
   32de5:	0f b7 c0             	movzwl %ax,%eax
   32de8:	83 ec 08             	sub    $0x8,%esp
   32deb:	50                   	push   %eax
   32dec:	68 d5 03 00 00       	push   $0x3d5
   32df1:	e8 e2 d8 ff ff       	call   306d8 <out_byte>
   32df6:	83 c4 10             	add    $0x10,%esp
   32df9:	83 ec 08             	sub    $0x8,%esp
   32dfc:	6a 0d                	push   $0xd
   32dfe:	68 d4 03 00 00       	push   $0x3d4
   32e03:	e8 d0 d8 ff ff       	call   306d8 <out_byte>
   32e08:	83 c4 10             	add    $0x10,%esp
   32e0b:	8b 45 08             	mov    0x8(%ebp),%eax
   32e0e:	0f b7 c0             	movzwl %ax,%eax
   32e11:	83 ec 08             	sub    $0x8,%esp
   32e14:	50                   	push   %eax
   32e15:	68 d5 03 00 00       	push   $0x3d5
   32e1a:	e8 b9 d8 ff ff       	call   306d8 <out_byte>
   32e1f:	83 c4 10             	add    $0x10,%esp
   32e22:	90                   	nop
   32e23:	c9                   	leave  
   32e24:	c3                   	ret    

00032e25 <put_key>:
   32e25:	55                   	push   %ebp
   32e26:	89 e5                	mov    %esp,%ebp
   32e28:	83 ec 04             	sub    $0x4,%esp
   32e2b:	8b 45 0c             	mov    0xc(%ebp),%eax
   32e2e:	88 45 fc             	mov    %al,-0x4(%ebp)
   32e31:	8b 45 08             	mov    0x8(%ebp),%eax
   32e34:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   32e3a:	3d 1f 03 00 00       	cmp    $0x31f,%eax
   32e3f:	77 4d                	ja     32e8e <put_key+0x69>
   32e41:	8b 45 08             	mov    0x8(%ebp),%eax
   32e44:	8b 00                	mov    (%eax),%eax
   32e46:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
   32e4a:	89 10                	mov    %edx,(%eax)
   32e4c:	8b 45 08             	mov    0x8(%ebp),%eax
   32e4f:	8b 00                	mov    (%eax),%eax
   32e51:	8d 50 04             	lea    0x4(%eax),%edx
   32e54:	8b 45 08             	mov    0x8(%ebp),%eax
   32e57:	89 10                	mov    %edx,(%eax)
   32e59:	8b 45 08             	mov    0x8(%ebp),%eax
   32e5c:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   32e62:	8d 50 01             	lea    0x1(%eax),%edx
   32e65:	8b 45 08             	mov    0x8(%ebp),%eax
   32e68:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
   32e6e:	8b 45 08             	mov    0x8(%ebp),%eax
   32e71:	8b 00                	mov    (%eax),%eax
   32e73:	8b 55 08             	mov    0x8(%ebp),%edx
   32e76:	83 c2 08             	add    $0x8,%edx
   32e79:	81 c2 80 0c 00 00    	add    $0xc80,%edx
   32e7f:	39 d0                	cmp    %edx,%eax
   32e81:	75 0b                	jne    32e8e <put_key+0x69>
   32e83:	8b 45 08             	mov    0x8(%ebp),%eax
   32e86:	8d 50 08             	lea    0x8(%eax),%edx
   32e89:	8b 45 08             	mov    0x8(%ebp),%eax
   32e8c:	89 10                	mov    %edx,(%eax)
   32e8e:	90                   	nop
   32e8f:	c9                   	leave  
   32e90:	c3                   	ret    

00032e91 <scroll_up>:
   32e91:	55                   	push   %ebp
   32e92:	89 e5                	mov    %esp,%ebp
   32e94:	83 ec 08             	sub    $0x8,%esp
   32e97:	8b 45 08             	mov    0x8(%ebp),%eax
   32e9a:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32ea0:	8b 50 08             	mov    0x8(%eax),%edx
   32ea3:	8b 45 08             	mov    0x8(%ebp),%eax
   32ea6:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32eac:	8b 00                	mov    (%eax),%eax
   32eae:	39 c2                	cmp    %eax,%edx
   32eb0:	76 1d                	jbe    32ecf <scroll_up+0x3e>
   32eb2:	8b 45 08             	mov    0x8(%ebp),%eax
   32eb5:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32ebb:	8b 40 08             	mov    0x8(%eax),%eax
   32ebe:	2d d0 07 00 00       	sub    $0x7d0,%eax
   32ec3:	83 ec 0c             	sub    $0xc,%esp
   32ec6:	50                   	push   %eax
   32ec7:	e8 fb fe ff ff       	call   32dc7 <set_console_start_video_addr>
   32ecc:	83 c4 10             	add    $0x10,%esp
   32ecf:	90                   	nop
   32ed0:	c9                   	leave  
   32ed1:	c3                   	ret    

00032ed2 <scroll_down>:
   32ed2:	55                   	push   %ebp
   32ed3:	89 e5                	mov    %esp,%ebp
   32ed5:	83 ec 08             	sub    $0x8,%esp
   32ed8:	8b 45 08             	mov    0x8(%ebp),%eax
   32edb:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32ee1:	8b 40 08             	mov    0x8(%eax),%eax
   32ee4:	8d 88 a0 0f 00 00    	lea    0xfa0(%eax),%ecx
   32eea:	8b 45 08             	mov    0x8(%ebp),%eax
   32eed:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32ef3:	8b 10                	mov    (%eax),%edx
   32ef5:	8b 45 08             	mov    0x8(%ebp),%eax
   32ef8:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32efe:	8b 40 04             	mov    0x4(%eax),%eax
   32f01:	01 d0                	add    %edx,%eax
   32f03:	39 c1                	cmp    %eax,%ecx
   32f05:	73 3b                	jae    32f42 <scroll_down+0x70>
   32f07:	8b 45 08             	mov    0x8(%ebp),%eax
   32f0a:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f10:	8b 40 08             	mov    0x8(%eax),%eax
   32f13:	05 d0 07 00 00       	add    $0x7d0,%eax
   32f18:	83 ec 0c             	sub    $0xc,%esp
   32f1b:	50                   	push   %eax
   32f1c:	e8 a6 fe ff ff       	call   32dc7 <set_console_start_video_addr>
   32f21:	83 c4 10             	add    $0x10,%esp
   32f24:	8b 45 08             	mov    0x8(%ebp),%eax
   32f27:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f2d:	8b 50 08             	mov    0x8(%eax),%edx
   32f30:	8b 45 08             	mov    0x8(%ebp),%eax
   32f33:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f39:	81 c2 d0 07 00 00    	add    $0x7d0,%edx
   32f3f:	89 50 08             	mov    %edx,0x8(%eax)
   32f42:	90                   	nop
   32f43:	c9                   	leave  
   32f44:	c3                   	ret    

00032f45 <out_char>:
   32f45:	55                   	push   %ebp
   32f46:	89 e5                	mov    %esp,%ebp
   32f48:	83 ec 28             	sub    $0x28,%esp
   32f4b:	8b 45 0c             	mov    0xc(%ebp),%eax
   32f4e:	88 45 e4             	mov    %al,-0x1c(%ebp)
   32f51:	8b 45 08             	mov    0x8(%ebp),%eax
   32f54:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f5a:	8b 40 0c             	mov    0xc(%eax),%eax
   32f5d:	05 00 c0 05 00       	add    $0x5c000,%eax
   32f62:	01 c0                	add    %eax,%eax
   32f64:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32f67:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
   32f6b:	83 f8 08             	cmp    $0x8,%eax
   32f6e:	0f 84 8d 00 00 00    	je     33001 <out_char+0xbc>
   32f74:	83 f8 0a             	cmp    $0xa,%eax
   32f77:	0f 85 c9 00 00 00    	jne    33046 <out_char+0x101>
   32f7d:	8b 45 08             	mov    0x8(%ebp),%eax
   32f80:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f86:	8b 50 0c             	mov    0xc(%eax),%edx
   32f89:	8b 45 08             	mov    0x8(%ebp),%eax
   32f8c:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f92:	8b 08                	mov    (%eax),%ecx
   32f94:	8b 45 08             	mov    0x8(%ebp),%eax
   32f97:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32f9d:	8b 40 04             	mov    0x4(%eax),%eax
   32fa0:	01 c8                	add    %ecx,%eax
   32fa2:	83 e8 50             	sub    $0x50,%eax
   32fa5:	39 c2                	cmp    %eax,%edx
   32fa7:	0f 83 f4 00 00 00    	jae    330a1 <out_char+0x15c>
   32fad:	8b 45 08             	mov    0x8(%ebp),%eax
   32fb0:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32fb6:	8b 08                	mov    (%eax),%ecx
   32fb8:	8b 45 08             	mov    0x8(%ebp),%eax
   32fbb:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32fc1:	8b 50 0c             	mov    0xc(%eax),%edx
   32fc4:	8b 45 08             	mov    0x8(%ebp),%eax
   32fc7:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32fcd:	8b 00                	mov    (%eax),%eax
   32fcf:	29 c2                	sub    %eax,%edx
   32fd1:	89 d0                	mov    %edx,%eax
   32fd3:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
   32fd8:	f7 e2                	mul    %edx
   32fda:	89 d0                	mov    %edx,%eax
   32fdc:	c1 e8 06             	shr    $0x6,%eax
   32fdf:	8d 50 01             	lea    0x1(%eax),%edx
   32fe2:	89 d0                	mov    %edx,%eax
   32fe4:	c1 e0 02             	shl    $0x2,%eax
   32fe7:	01 d0                	add    %edx,%eax
   32fe9:	c1 e0 04             	shl    $0x4,%eax
   32fec:	89 c2                	mov    %eax,%edx
   32fee:	8b 45 08             	mov    0x8(%ebp),%eax
   32ff1:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   32ff7:	01 ca                	add    %ecx,%edx
   32ff9:	89 50 0c             	mov    %edx,0xc(%eax)
   32ffc:	e9 a0 00 00 00       	jmp    330a1 <out_char+0x15c>
   33001:	8b 45 08             	mov    0x8(%ebp),%eax
   33004:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   3300a:	8b 50 0c             	mov    0xc(%eax),%edx
   3300d:	8b 45 08             	mov    0x8(%ebp),%eax
   33010:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   33016:	8b 00                	mov    (%eax),%eax
   33018:	39 c2                	cmp    %eax,%edx
   3301a:	0f 86 84 00 00 00    	jbe    330a4 <out_char+0x15f>
   33020:	8b 45 08             	mov    0x8(%ebp),%eax
   33023:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   33029:	8b 50 0c             	mov    0xc(%eax),%edx
   3302c:	83 ea 01             	sub    $0x1,%edx
   3302f:	89 50 0c             	mov    %edx,0xc(%eax)
   33032:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33035:	83 e8 02             	sub    $0x2,%eax
   33038:	c6 00 20             	movb   $0x20,(%eax)
   3303b:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3303e:	83 e8 01             	sub    $0x1,%eax
   33041:	c6 00 00             	movb   $0x0,(%eax)
   33044:	eb 5e                	jmp    330a4 <out_char+0x15f>
   33046:	8b 45 08             	mov    0x8(%ebp),%eax
   33049:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   3304f:	8b 40 0c             	mov    0xc(%eax),%eax
   33052:	8d 48 01             	lea    0x1(%eax),%ecx
   33055:	8b 45 08             	mov    0x8(%ebp),%eax
   33058:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   3305e:	8b 10                	mov    (%eax),%edx
   33060:	8b 45 08             	mov    0x8(%ebp),%eax
   33063:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   33069:	8b 40 04             	mov    0x4(%eax),%eax
   3306c:	01 d0                	add    %edx,%eax
   3306e:	39 c1                	cmp    %eax,%ecx
   33070:	73 35                	jae    330a7 <out_char+0x162>
   33072:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33075:	8d 50 01             	lea    0x1(%eax),%edx
   33078:	89 55 f4             	mov    %edx,-0xc(%ebp)
   3307b:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
   3307f:	88 10                	mov    %dl,(%eax)
   33081:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33084:	8d 50 01             	lea    0x1(%eax),%edx
   33087:	89 55 f4             	mov    %edx,-0xc(%ebp)
   3308a:	c6 00 0a             	movb   $0xa,(%eax)
   3308d:	8b 45 08             	mov    0x8(%ebp),%eax
   33090:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   33096:	8b 50 0c             	mov    0xc(%eax),%edx
   33099:	83 c2 01             	add    $0x1,%edx
   3309c:	89 50 0c             	mov    %edx,0xc(%eax)
   3309f:	eb 06                	jmp    330a7 <out_char+0x162>
   330a1:	90                   	nop
   330a2:	eb 14                	jmp    330b8 <out_char+0x173>
   330a4:	90                   	nop
   330a5:	eb 11                	jmp    330b8 <out_char+0x173>
   330a7:	90                   	nop
   330a8:	eb 0e                	jmp    330b8 <out_char+0x173>
   330aa:	83 ec 0c             	sub    $0xc,%esp
   330ad:	ff 75 08             	pushl  0x8(%ebp)
   330b0:	e8 1d fe ff ff       	call   32ed2 <scroll_down>
   330b5:	83 c4 10             	add    $0x10,%esp
   330b8:	8b 45 08             	mov    0x8(%ebp),%eax
   330bb:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   330c1:	8b 50 0c             	mov    0xc(%eax),%edx
   330c4:	8b 45 08             	mov    0x8(%ebp),%eax
   330c7:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   330cd:	8b 40 08             	mov    0x8(%eax),%eax
   330d0:	29 c2                	sub    %eax,%edx
   330d2:	89 d0                	mov    %edx,%eax
   330d4:	3d d0 07 00 00       	cmp    $0x7d0,%eax
   330d9:	77 cf                	ja     330aa <out_char+0x165>
   330db:	83 ec 0c             	sub    $0xc,%esp
   330de:	ff 75 08             	pushl  0x8(%ebp)
   330e1:	e8 4a fc ff ff       	call   32d30 <flush>
   330e6:	83 c4 10             	add    $0x10,%esp
   330e9:	90                   	nop
   330ea:	c9                   	leave  
   330eb:	c3                   	ret    

000330ec <tty_dev_read>:
   330ec:	55                   	push   %ebp
   330ed:	89 e5                	mov    %esp,%ebp
   330ef:	83 ec 08             	sub    $0x8,%esp
   330f2:	a1 80 6e 03 00       	mov    0x36e80,%eax
   330f7:	39 45 08             	cmp    %eax,0x8(%ebp)
   330fa:	75 17                	jne    33113 <tty_dev_read+0x27>
   330fc:	a1 c8 72 03 00       	mov    0x372c8,%eax
   33101:	85 c0                	test   %eax,%eax
   33103:	7e 0e                	jle    33113 <tty_dev_read+0x27>
   33105:	83 ec 0c             	sub    $0xc,%esp
   33108:	ff 75 08             	pushl  0x8(%ebp)
   3310b:	e8 d8 02 00 00       	call   333e8 <keyboard_read>
   33110:	83 c4 10             	add    $0x10,%esp
   33113:	90                   	nop
   33114:	c9                   	leave  
   33115:	c3                   	ret    

00033116 <tty_dev_write>:
   33116:	55                   	push   %ebp
   33117:	89 e5                	mov    %esp,%ebp
   33119:	83 ec 18             	sub    $0x18,%esp
   3311c:	eb 64                	jmp    33182 <tty_dev_write+0x6c>
   3311e:	8b 45 08             	mov    0x8(%ebp),%eax
   33121:	8b 40 04             	mov    0x4(%eax),%eax
   33124:	8b 00                	mov    (%eax),%eax
   33126:	88 45 f7             	mov    %al,-0x9(%ebp)
   33129:	8b 45 08             	mov    0x8(%ebp),%eax
   3312c:	8b 40 04             	mov    0x4(%eax),%eax
   3312f:	8d 50 04             	lea    0x4(%eax),%edx
   33132:	8b 45 08             	mov    0x8(%ebp),%eax
   33135:	89 50 04             	mov    %edx,0x4(%eax)
   33138:	8b 45 08             	mov    0x8(%ebp),%eax
   3313b:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   33141:	8d 50 ff             	lea    -0x1(%eax),%edx
   33144:	8b 45 08             	mov    0x8(%ebp),%eax
   33147:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
   3314d:	8b 45 08             	mov    0x8(%ebp),%eax
   33150:	8b 40 04             	mov    0x4(%eax),%eax
   33153:	8b 55 08             	mov    0x8(%ebp),%edx
   33156:	83 c2 08             	add    $0x8,%edx
   33159:	81 c2 80 0c 00 00    	add    $0xc80,%edx
   3315f:	39 d0                	cmp    %edx,%eax
   33161:	75 0c                	jne    3316f <tty_dev_write+0x59>
   33163:	8b 45 08             	mov    0x8(%ebp),%eax
   33166:	8d 50 08             	lea    0x8(%eax),%edx
   33169:	8b 45 08             	mov    0x8(%ebp),%eax
   3316c:	89 50 04             	mov    %edx,0x4(%eax)
   3316f:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   33173:	83 ec 08             	sub    $0x8,%esp
   33176:	50                   	push   %eax
   33177:	ff 75 08             	pushl  0x8(%ebp)
   3317a:	e8 c6 fd ff ff       	call   32f45 <out_char>
   3317f:	83 c4 10             	add    $0x10,%esp
   33182:	8b 45 08             	mov    0x8(%ebp),%eax
   33185:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   3318b:	85 c0                	test   %eax,%eax
   3318d:	75 8f                	jne    3311e <tty_dev_write+0x8>
   3318f:	90                   	nop
   33190:	c9                   	leave  
   33191:	c3                   	ret    

00033192 <init_screen>:
   33192:	55                   	push   %ebp
   33193:	89 e5                	mov    %esp,%ebp
   33195:	83 ec 10             	sub    $0x10,%esp
   33198:	8b 45 08             	mov    0x8(%ebp),%eax
   3319b:	2d 00 76 03 00       	sub    $0x37600,%eax
   331a0:	c1 f8 04             	sar    $0x4,%eax
   331a3:	69 c0 79 19 8c 02    	imul   $0x28c1979,%eax,%eax
   331a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
   331ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
   331af:	c1 e0 04             	shl    $0x4,%eax
   331b2:	8d 90 60 a4 03 00    	lea    0x3a460(%eax),%edx
   331b8:	8b 45 08             	mov    0x8(%ebp),%eax
   331bb:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
   331c1:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
   331c8:	8b 45 08             	mov    0x8(%ebp),%eax
   331cb:	8b 88 8c 0c 00 00    	mov    0xc8c(%eax),%ecx
   331d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
   331d4:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
   331d9:	f7 e2                	mul    %edx
   331db:	89 d0                	mov    %edx,%eax
   331dd:	d1 e8                	shr    %eax
   331df:	89 41 04             	mov    %eax,0x4(%ecx)
   331e2:	8b 45 08             	mov    0x8(%ebp),%eax
   331e5:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   331eb:	8b 50 04             	mov    0x4(%eax),%edx
   331ee:	8b 45 08             	mov    0x8(%ebp),%eax
   331f1:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   331f7:	0f af 55 fc          	imul   -0x4(%ebp),%edx
   331fb:	89 10                	mov    %edx,(%eax)
   331fd:	8b 45 08             	mov    0x8(%ebp),%eax
   33200:	8b 90 8c 0c 00 00    	mov    0xc8c(%eax),%edx
   33206:	8b 45 08             	mov    0x8(%ebp),%eax
   33209:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   3320f:	8b 12                	mov    (%edx),%edx
   33211:	89 50 08             	mov    %edx,0x8(%eax)
   33214:	8b 55 08             	mov    0x8(%ebp),%edx
   33217:	8b 92 8c 0c 00 00    	mov    0xc8c(%edx),%edx
   3321d:	8b 40 08             	mov    0x8(%eax),%eax
   33220:	89 42 0c             	mov    %eax,0xc(%edx)
   33223:	90                   	nop
   33224:	c9                   	leave  
   33225:	c3                   	ret    

00033226 <init_tty>:
   33226:	55                   	push   %ebp
   33227:	89 e5                	mov    %esp,%ebp
   33229:	83 ec 18             	sub    $0x18,%esp
   3322c:	c7 45 f4 00 76 03 00 	movl   $0x37600,-0xc(%ebp)
   33233:	eb 7a                	jmp    332af <init_tty+0x89>
   33235:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33238:	8d 50 08             	lea    0x8(%eax),%edx
   3323b:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3323e:	89 50 04             	mov    %edx,0x4(%eax)
   33241:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33244:	8b 50 04             	mov    0x4(%eax),%edx
   33247:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3324a:	89 10                	mov    %edx,(%eax)
   3324c:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3324f:	c7 80 88 0c 00 00 00 	movl   $0x0,0xc88(%eax)
   33256:	00 00 00 
   33259:	ff 75 f4             	pushl  -0xc(%ebp)
   3325c:	e8 31 ff ff ff       	call   33192 <init_screen>
   33261:	83 c4 04             	add    $0x4,%esp
   33264:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33267:	2d 00 76 03 00       	sub    $0x37600,%eax
   3326c:	85 c0                	test   %eax,%eax
   3326e:	7e 38                	jle    332a8 <init_tty+0x82>
   33270:	83 ec 08             	sub    $0x8,%esp
   33273:	6a 23                	push   $0x23
   33275:	ff 75 f4             	pushl  -0xc(%ebp)
   33278:	e8 c8 fc ff ff       	call   32f45 <out_char>
   3327d:	83 c4 10             	add    $0x10,%esp
   33280:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33283:	05 90 67 02 00       	add    $0x26790,%eax
   33288:	2d 00 76 03 00       	sub    $0x37600,%eax
   3328d:	c1 f8 04             	sar    $0x4,%eax
   33290:	69 c0 79 19 8c 02    	imul   $0x28c1979,%eax,%eax
   33296:	0f b6 c0             	movzbl %al,%eax
   33299:	83 ec 08             	sub    $0x8,%esp
   3329c:	50                   	push   %eax
   3329d:	ff 75 f4             	pushl  -0xc(%ebp)
   332a0:	e8 a0 fc ff ff       	call   32f45 <out_char>
   332a5:	83 c4 10             	add    $0x10,%esp
   332a8:	81 45 f4 90 0c 00 00 	addl   $0xc90,-0xc(%ebp)
   332af:	b8 b0 9b 03 00       	mov    $0x39bb0,%eax
   332b4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
   332b7:	0f 82 78 ff ff ff    	jb     33235 <init_tty+0xf>
   332bd:	90                   	nop
   332be:	c9                   	leave  
   332bf:	c3                   	ret    

000332c0 <TaskTTY>:
   332c0:	55                   	push   %ebp
   332c1:	89 e5                	mov    %esp,%ebp
   332c3:	83 ec 18             	sub    $0x18,%esp
   332c6:	e8 5b ff ff ff       	call   33226 <init_tty>
   332cb:	83 ec 0c             	sub    $0xc,%esp
   332ce:	6a 00                	push   $0x0
   332d0:	e8 1f fa ff ff       	call   32cf4 <select_console>
   332d5:	83 c4 10             	add    $0x10,%esp
   332d8:	c7 45 f4 00 76 03 00 	movl   $0x37600,-0xc(%ebp)
   332df:	eb 23                	jmp    33304 <TaskTTY+0x44>
   332e1:	83 ec 0c             	sub    $0xc,%esp
   332e4:	ff 75 f4             	pushl  -0xc(%ebp)
   332e7:	e8 00 fe ff ff       	call   330ec <tty_dev_read>
   332ec:	83 c4 10             	add    $0x10,%esp
   332ef:	83 ec 0c             	sub    $0xc,%esp
   332f2:	ff 75 f4             	pushl  -0xc(%ebp)
   332f5:	e8 1c fe ff ff       	call   33116 <tty_dev_write>
   332fa:	83 c4 10             	add    $0x10,%esp
   332fd:	81 45 f4 90 0c 00 00 	addl   $0xc90,-0xc(%ebp)
   33304:	b8 b0 9b 03 00       	mov    $0x39bb0,%eax
   33309:	39 45 f4             	cmp    %eax,-0xc(%ebp)
   3330c:	72 d3                	jb     332e1 <TaskTTY+0x21>
   3330e:	eb c8                	jmp    332d8 <TaskTTY+0x18>

00033310 <keyboard_handler>:
   33310:	55                   	push   %ebp
   33311:	89 e5                	mov    %esp,%ebp
   33313:	83 ec 18             	sub    $0x18,%esp
   33316:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
   3331d:	a1 c8 72 03 00       	mov    0x372c8,%eax
   33322:	3d 1f 03 00 00       	cmp    $0x31f,%eax
   33327:	7f 5c                	jg     33385 <keyboard_handler+0x75>
   33329:	e8 ce d3 ff ff       	call   306fc <disable_int>
   3332e:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33331:	0f b7 c0             	movzwl %ax,%eax
   33334:	83 ec 0c             	sub    $0xc,%esp
   33337:	50                   	push   %eax
   33338:	e8 8f d3 ff ff       	call   306cc <in_byte>
   3333d:	83 c4 10             	add    $0x10,%esp
   33340:	88 45 f3             	mov    %al,-0xd(%ebp)
   33343:	a1 c0 72 03 00       	mov    0x372c0,%eax
   33348:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
   3334c:	88 10                	mov    %dl,(%eax)
   3334e:	a1 c0 72 03 00       	mov    0x372c0,%eax
   33353:	83 c0 01             	add    $0x1,%eax
   33356:	a3 c0 72 03 00       	mov    %eax,0x372c0
   3335b:	a1 c8 72 03 00       	mov    0x372c8,%eax
   33360:	83 c0 01             	add    $0x1,%eax
   33363:	a3 c8 72 03 00       	mov    %eax,0x372c8
   33368:	a1 c0 72 03 00       	mov    0x372c0,%eax
   3336d:	ba ec 75 03 00       	mov    $0x375ec,%edx
   33372:	39 d0                	cmp    %edx,%eax
   33374:	72 0a                	jb     33380 <keyboard_handler+0x70>
   33376:	c7 05 c0 72 03 00 cc 	movl   $0x372cc,0x372c0
   3337d:	72 03 00 
   33380:	e8 79 d3 ff ff       	call   306fe <enable_int>
   33385:	90                   	nop
   33386:	c9                   	leave  
   33387:	c3                   	ret    

00033388 <read_from_keyboard_buf>:
   33388:	55                   	push   %ebp
   33389:	89 e5                	mov    %esp,%ebp
   3338b:	83 ec 18             	sub    $0x18,%esp
   3338e:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
   33392:	a1 c8 72 03 00       	mov    0x372c8,%eax
   33397:	85 c0                	test   %eax,%eax
   33399:	7e 47                	jle    333e2 <read_from_keyboard_buf+0x5a>
   3339b:	e8 5c d3 ff ff       	call   306fc <disable_int>
   333a0:	a1 c4 72 03 00       	mov    0x372c4,%eax
   333a5:	0f b6 00             	movzbl (%eax),%eax
   333a8:	88 45 f7             	mov    %al,-0x9(%ebp)
   333ab:	a1 c4 72 03 00       	mov    0x372c4,%eax
   333b0:	83 c0 01             	add    $0x1,%eax
   333b3:	a3 c4 72 03 00       	mov    %eax,0x372c4
   333b8:	a1 c8 72 03 00       	mov    0x372c8,%eax
   333bd:	83 e8 01             	sub    $0x1,%eax
   333c0:	a3 c8 72 03 00       	mov    %eax,0x372c8
   333c5:	a1 c4 72 03 00       	mov    0x372c4,%eax
   333ca:	ba ec 75 03 00       	mov    $0x375ec,%edx
   333cf:	39 d0                	cmp    %edx,%eax
   333d1:	72 0a                	jb     333dd <read_from_keyboard_buf+0x55>
   333d3:	c7 05 c4 72 03 00 cc 	movl   $0x372cc,0x372c4
   333da:	72 03 00 
   333dd:	e8 1c d3 ff ff       	call   306fe <enable_int>
   333e2:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   333e6:	c9                   	leave  
   333e7:	c3                   	ret    

000333e8 <keyboard_read>:
   333e8:	55                   	push   %ebp
   333e9:	89 e5                	mov    %esp,%ebp
   333eb:	83 ec 28             	sub    $0x28,%esp
   333ee:	90                   	nop
   333ef:	a1 c8 72 03 00       	mov    0x372c8,%eax
   333f4:	85 c0                	test   %eax,%eax
   333f6:	7e f7                	jle    333ef <keyboard_read+0x7>
   333f8:	e8 8b ff ff ff       	call   33388 <read_from_keyboard_buf>
   333fd:	88 45 ea             	mov    %al,-0x16(%ebp)
   33400:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   33407:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
   3340b:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
   3340f:	75 5a                	jne    3346b <keyboard_read+0x83>
   33411:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
   33415:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
   33419:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
   3341d:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
   33421:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
   33425:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
   33429:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
   3342d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
   33434:	eb 20                	jmp    33456 <keyboard_read+0x6e>
   33436:	e8 4d ff ff ff       	call   33388 <read_from_keyboard_buf>
   3343b:	89 c1                	mov    %eax,%ecx
   3343d:	8d 55 e3             	lea    -0x1d(%ebp),%edx
   33440:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33443:	01 d0                	add    %edx,%eax
   33445:	0f b6 00             	movzbl (%eax),%eax
   33448:	38 c1                	cmp    %al,%cl
   3344a:	74 06                	je     33452 <keyboard_read+0x6a>
   3344c:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
   33450:	eb 0a                	jmp    3345c <keyboard_read+0x74>
   33452:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   33456:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
   3345a:	7e da                	jle    33436 <keyboard_read+0x4e>
   3345c:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
   33460:	74 68                	je     334ca <keyboard_read+0xe2>
   33462:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
   33469:	eb 5f                	jmp    334ca <keyboard_read+0xe2>
   3346b:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
   3346f:	75 59                	jne    334ca <keyboard_read+0xe2>
   33471:	e8 12 ff ff ff       	call   33388 <read_from_keyboard_buf>
   33476:	3c 2a                	cmp    $0x2a,%al
   33478:	75 1d                	jne    33497 <keyboard_read+0xaf>
   3347a:	e8 09 ff ff ff       	call   33388 <read_from_keyboard_buf>
   3347f:	3c e0                	cmp    $0xe0,%al
   33481:	75 14                	jne    33497 <keyboard_read+0xaf>
   33483:	e8 00 ff ff ff       	call   33388 <read_from_keyboard_buf>
   33488:	3c 37                	cmp    $0x37,%al
   3348a:	75 0b                	jne    33497 <keyboard_read+0xaf>
   3348c:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
   33493:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
   33497:	e8 ec fe ff ff       	call   33388 <read_from_keyboard_buf>
   3349c:	3c b7                	cmp    $0xb7,%al
   3349e:	75 1d                	jne    334bd <keyboard_read+0xd5>
   334a0:	e8 e3 fe ff ff       	call   33388 <read_from_keyboard_buf>
   334a5:	3c e0                	cmp    $0xe0,%al
   334a7:	75 14                	jne    334bd <keyboard_read+0xd5>
   334a9:	e8 da fe ff ff       	call   33388 <read_from_keyboard_buf>
   334ae:	3c aa                	cmp    $0xaa,%al
   334b0:	75 0b                	jne    334bd <keyboard_read+0xd5>
   334b2:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
   334b9:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
   334bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   334c1:	75 07                	jne    334ca <keyboard_read+0xe2>
   334c3:	c6 05 84 6e 03 00 01 	movb   $0x1,0x36e84
   334ca:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
   334d1:	0f 84 8d 00 00 00    	je     33564 <keyboard_read+0x17c>
   334d7:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
   334de:	0f 84 80 00 00 00    	je     33564 <keyboard_read+0x17c>
   334e4:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
   334e8:	0f 94 c2             	sete   %dl
   334eb:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
   334ef:	0f 94 c0             	sete   %al
   334f2:	09 d0                	or     %edx,%eax
   334f4:	84 c0                	test   %al,%al
   334f6:	74 07                	je     334ff <keyboard_read+0x117>
   334f8:	c6 05 30 9c 03 00 01 	movb   $0x1,0x39c30
   334ff:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
   33503:	f7 d0                	not    %eax
   33505:	c0 e8 07             	shr    $0x7,%al
   33508:	88 45 e9             	mov    %al,-0x17(%ebp)
   3350b:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
   3350f:	74 53                	je     33564 <keyboard_read+0x17c>
   33511:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
   33515:	74 4d                	je     33564 <keyboard_read+0x17c>
   33517:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
   3351b:	0f b6 05 30 9c 03 00 	movzbl 0x39c30,%eax
   33522:	3c 01                	cmp    $0x1,%al
   33524:	75 04                	jne    3352a <keyboard_read+0x142>
   33526:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
   3352a:	0f b6 05 84 6e 03 00 	movzbl 0x36e84,%eax
   33531:	84 c0                	test   %al,%al
   33533:	74 04                	je     33539 <keyboard_read+0x151>
   33535:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
   33539:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
   3353d:	89 d0                	mov    %edx,%eax
   3353f:	01 c0                	add    %eax,%eax
   33541:	01 c2                	add    %eax,%edx
   33543:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
   33547:	01 d0                	add    %edx,%eax
   33549:	8b 04 85 80 60 03 00 	mov    0x36080(,%eax,4),%eax
   33550:	89 45 f4             	mov    %eax,-0xc(%ebp)
   33553:	83 ec 08             	sub    $0x8,%esp
   33556:	ff 75 f4             	pushl  -0xc(%ebp)
   33559:	ff 75 08             	pushl  0x8(%ebp)
   3355c:	e8 1a 00 00 00       	call   3357b <in_process>
   33561:	83 c4 10             	add    $0x10,%esp
   33564:	90                   	nop
   33565:	c9                   	leave  
   33566:	c3                   	ret    

00033567 <init_keyboard_handler>:
   33567:	55                   	push   %ebp
   33568:	89 e5                	mov    %esp,%ebp
   3356a:	c6 05 84 6e 03 00 00 	movb   $0x0,0x36e84
   33571:	c6 05 30 9c 03 00 00 	movb   $0x0,0x39c30
   33578:	90                   	nop
   33579:	5d                   	pop    %ebp
   3357a:	c3                   	ret    

0003357b <in_process>:
   3357b:	55                   	push   %ebp
   3357c:	89 e5                	mov    %esp,%ebp
   3357e:	83 ec 18             	sub    $0x18,%esp
   33581:	83 ec 04             	sub    $0x4,%esp
   33584:	6a 02                	push   $0x2
   33586:	6a 00                	push   $0x0
   33588:	8d 45 f6             	lea    -0xa(%ebp),%eax
   3358b:	50                   	push   %eax
   3358c:	e8 fb 07 00 00       	call   33d8c <Memset>
   33591:	83 c4 10             	add    $0x10,%esp
   33594:	8b 45 0c             	mov    0xc(%ebp),%eax
   33597:	25 00 01 00 00       	and    $0x100,%eax
   3359c:	85 c0                	test   %eax,%eax
   3359e:	75 28                	jne    335c8 <in_process+0x4d>
   335a0:	8b 45 0c             	mov    0xc(%ebp),%eax
   335a3:	0f b6 c0             	movzbl %al,%eax
   335a6:	83 ec 08             	sub    $0x8,%esp
   335a9:	50                   	push   %eax
   335aa:	ff 75 08             	pushl  0x8(%ebp)
   335ad:	e8 73 f8 ff ff       	call   32e25 <put_key>
   335b2:	83 c4 10             	add    $0x10,%esp
   335b5:	c6 05 84 6e 03 00 00 	movb   $0x0,0x36e84
   335bc:	c6 05 30 9c 03 00 00 	movb   $0x0,0x39c30
   335c3:	e9 42 01 00 00       	jmp    3370a <in_process+0x18f>
   335c8:	0f b6 05 30 9c 03 00 	movzbl 0x39c30,%eax
   335cf:	84 c0                	test   %al,%al
   335d1:	0f 84 a9 00 00 00    	je     33680 <in_process+0x105>
   335d7:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
   335db:	0f 84 9f 00 00 00    	je     33680 <in_process+0x105>
   335e1:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
   335e5:	0f 84 95 00 00 00    	je     33680 <in_process+0x105>
   335eb:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   335f2:	74 64                	je     33658 <in_process+0xdd>
   335f4:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   335fb:	77 0b                	ja     33608 <in_process+0x8d>
   335fd:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
   33604:	74 64                	je     3366a <in_process+0xef>
   33606:	eb 73                	jmp    3367b <in_process+0x100>
   33608:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
   3360f:	74 0b                	je     3361c <in_process+0xa1>
   33611:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
   33618:	74 20                	je     3363a <in_process+0xbf>
   3361a:	eb 5f                	jmp    3367b <in_process+0x100>
   3361c:	83 ec 0c             	sub    $0xc,%esp
   3361f:	ff 75 08             	pushl  0x8(%ebp)
   33622:	e8 6a f8 ff ff       	call   32e91 <scroll_up>
   33627:	83 c4 10             	add    $0x10,%esp
   3362a:	c6 05 30 9c 03 00 00 	movb   $0x0,0x39c30
   33631:	c6 05 84 6e 03 00 00 	movb   $0x0,0x36e84
   33638:	eb 41                	jmp    3367b <in_process+0x100>
   3363a:	83 ec 0c             	sub    $0xc,%esp
   3363d:	ff 75 08             	pushl  0x8(%ebp)
   33640:	e8 8d f8 ff ff       	call   32ed2 <scroll_down>
   33645:	83 c4 10             	add    $0x10,%esp
   33648:	c6 05 30 9c 03 00 00 	movb   $0x0,0x39c30
   3364f:	c6 05 84 6e 03 00 00 	movb   $0x0,0x36e84
   33656:	eb 23                	jmp    3367b <in_process+0x100>
   33658:	83 ec 08             	sub    $0x8,%esp
   3365b:	6a 0a                	push   $0xa
   3365d:	ff 75 08             	pushl  0x8(%ebp)
   33660:	e8 e0 f8 ff ff       	call   32f45 <out_char>
   33665:	83 c4 10             	add    $0x10,%esp
   33668:	eb 11                	jmp    3367b <in_process+0x100>
   3366a:	83 ec 08             	sub    $0x8,%esp
   3366d:	6a 08                	push   $0x8
   3366f:	ff 75 08             	pushl  0x8(%ebp)
   33672:	e8 ce f8 ff ff       	call   32f45 <out_char>
   33677:	83 c4 10             	add    $0x10,%esp
   3367a:	90                   	nop
   3367b:	e9 8a 00 00 00       	jmp    3370a <in_process+0x18f>
   33680:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
   33687:	74 55                	je     336de <in_process+0x163>
   33689:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
   33690:	77 14                	ja     336a6 <in_process+0x12b>
   33692:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
   33699:	74 31                	je     336cc <in_process+0x151>
   3369b:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   336a2:	74 16                	je     336ba <in_process+0x13f>
   336a4:	eb 64                	jmp    3370a <in_process+0x18f>
   336a6:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
   336ad:	74 3e                	je     336ed <in_process+0x172>
   336af:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
   336b6:	74 44                	je     336fc <in_process+0x181>
   336b8:	eb 50                	jmp    3370a <in_process+0x18f>
   336ba:	83 ec 08             	sub    $0x8,%esp
   336bd:	6a 0a                	push   $0xa
   336bf:	ff 75 08             	pushl  0x8(%ebp)
   336c2:	e8 5e f7 ff ff       	call   32e25 <put_key>
   336c7:	83 c4 10             	add    $0x10,%esp
   336ca:	eb 3e                	jmp    3370a <in_process+0x18f>
   336cc:	83 ec 08             	sub    $0x8,%esp
   336cf:	6a 08                	push   $0x8
   336d1:	ff 75 08             	pushl  0x8(%ebp)
   336d4:	e8 4c f7 ff ff       	call   32e25 <put_key>
   336d9:	83 c4 10             	add    $0x10,%esp
   336dc:	eb 2c                	jmp    3370a <in_process+0x18f>
   336de:	83 ec 0c             	sub    $0xc,%esp
   336e1:	6a 00                	push   $0x0
   336e3:	e8 0c f6 ff ff       	call   32cf4 <select_console>
   336e8:	83 c4 10             	add    $0x10,%esp
   336eb:	eb 1d                	jmp    3370a <in_process+0x18f>
   336ed:	83 ec 0c             	sub    $0xc,%esp
   336f0:	6a 01                	push   $0x1
   336f2:	e8 fd f5 ff ff       	call   32cf4 <select_console>
   336f7:	83 c4 10             	add    $0x10,%esp
   336fa:	eb 0e                	jmp    3370a <in_process+0x18f>
   336fc:	83 ec 0c             	sub    $0xc,%esp
   336ff:	6a 02                	push   $0x2
   33701:	e8 ee f5 ff ff       	call   32cf4 <select_console>
   33706:	83 c4 10             	add    $0x10,%esp
   33709:	90                   	nop
   3370a:	90                   	nop
   3370b:	c9                   	leave  
   3370c:	c3                   	ret    
