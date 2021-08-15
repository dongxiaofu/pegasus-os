
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	66 87 db             	;xchg   %bx,%bx
   30403:	c7 05 70 5e 03 00 00 	movl   $0x0,0x35e70
   3040a:	00 00 00 
   3040d:	b4 0b                	mov    $0xb,%ah
   3040f:	b0 4c                	mov    $0x4c,%al
   30411:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
   30418:	bc 60 5e 03 00       	mov    $0x35e60,%esp
   3041d:	66 c7 05 70 5e 03 00 	movw   $0x0,0x35e70
   30424:	00 00 
   30426:	0f 01 05 14 dc 03 00 	sgdtl  0x3dc14
   3042d:	e8 11 03 00 00       	call   30743 <ReloadGDT>
   30432:	0f 01 15 14 dc 03 00 	lgdtl  0x3dc14
   30439:	0f 01 1d 68 5e 03 00 	lidtl  0x35e68
   30440:	ea 47 04 03 00 08 00 	ljmp   $0x8,$0x30447

00030447 <csinit>:
   30447:	31 c0                	xor    %eax,%eax
   30449:	66 b8 40 00          	mov    $0x40,%ax
   3044d:	0f 00 d8             	ltr    %ax
   30450:	e9 e6 0b 00 00       	jmp    3103b <kernel_main>
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
   3046b:	e8 89 07 00 00       	call   30bf9 <test>
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
   3048b:	8b 3d 70 5e 03 00    	mov    0x35e70,%edi

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
   304b4:	89 3d 70 5e 03 00    	mov    %edi,0x35e70
   304ba:	89 ec                	mov    %ebp,%esp
   304bc:	5d                   	pop    %ebp
   304bd:	c3                   	ret    

000304be <disp_str_colour>:
   304be:	55                   	push   %ebp
   304bf:	89 e5                	mov    %esp,%ebp
   304c1:	8b 75 08             	mov    0x8(%ebp),%esi
   304c4:	8a 65 0c             	mov    0xc(%ebp),%ah
   304c7:	8b 3d 70 5e 03 00    	mov    0x35e70,%edi

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
   304f0:	89 3d 70 5e 03 00    	mov    %edi,0x35e70
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
   30558:	e8 9c 03 00 00       	call   308f9 <exception_handler>
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
   30579:	ff 05 74 5e 03 00    	incl   0x35e74
   3057f:	83 3d 74 5e 03 00 00 	cmpl   $0x0,0x35e74
   30586:	75 05                	jne    3058d <hwint0.2>

00030588 <hwint0.1>:
   30588:	bc 60 5e 03 00       	mov    $0x35e60,%esp

0003058d <hwint0.2>:
   3058d:	fb                   	sti    
   3058e:	e8 30 0f 00 00       	call   314c3 <clock_handler>
   30593:	b0 fc                	mov    $0xfc,%al
   30595:	e6 21                	out    %al,$0x21
   30597:	fa                   	cli    
   30598:	83 3d 74 5e 03 00 00 	cmpl   $0x0,0x35e74
   3059f:	0f 85 ca 00 00 00    	jne    3066f <reenter_restore>
   305a5:	e9 b1 00 00 00       	jmp    3065b <restore>

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
   305c2:	ff 05 74 5e 03 00    	incl   0x35e74
   305c8:	83 3d 74 5e 03 00 00 	cmpl   $0x0,0x35e74
   305cf:	75 05                	jne    305d6 <hwint1.2>

000305d1 <hwint1.1>:
   305d1:	bc 60 5e 03 00       	mov    $0x35e60,%esp

000305d6 <hwint1.2>:
   305d6:	fb                   	sti    
   305d7:	e8 33 0f 00 00       	call   3150f <keyboard_handler>
   305dc:	b0 fc                	mov    $0xfc,%al
   305de:	e6 21                	out    %al,$0x21
   305e0:	fa                   	cli    
   305e1:	83 3d 74 5e 03 00 00 	cmpl   $0x0,0x35e74
   305e8:	0f 85 81 00 00 00    	jne    3066f <reenter_restore>
   305ee:	eb 6b                	jmp    3065b <restore>

000305f0 <sys_call>:
   305f0:	60                   	pusha  
   305f1:	1e                   	push   %ds
   305f2:	06                   	push   %es
   305f3:	0f a0                	push   %fs
   305f5:	0f a8                	push   %gs
   305f7:	89 e6                	mov    %esp,%esi
   305f9:	66 8c d2             	mov    %ss,%dx
   305fc:	8e da                	mov    %edx,%ds
   305fe:	8e c2                	mov    %edx,%es
   30600:	8e e2                	mov    %edx,%fs
   30602:	ff 05 74 5e 03 00    	incl   0x35e74
   30608:	83 3d 74 5e 03 00 00 	cmpl   $0x0,0x35e74
   3060f:	75 05                	jne    30616 <sys_call.2>

00030611 <sys_call.1>:
   30611:	bc 60 5e 03 00       	mov    $0x35e60,%esp

00030616 <sys_call.2>:
   30616:	fb                   	sti    
   30617:	56                   	push   %esi
   30618:	ff 35 80 62 03 00    	pushl  0x36280
   3061e:	53                   	push   %ebx
   3061f:	51                   	push   %ecx
   30620:	ff 14 85 48 56 03 00 	call   *0x35648(,%eax,4)
   30627:	83 c4 0c             	add    $0xc,%esp
   3062a:	5e                   	pop    %esi
   3062b:	89 46 2c             	mov    %eax,0x2c(%esi)
   3062e:	83 3d 74 5e 03 00 00 	cmpl   $0x0,0x35e74
   30635:	75 38                	jne    3066f <reenter_restore>
   30637:	eb 22                	jmp    3065b <restore>

00030639 <restart>:
   30639:	ff 0d 74 5e 03 00    	decl   0x35e74
   3063f:	8b 25 80 62 03 00    	mov    0x36280,%esp
   30645:	0f 00 54 24 44       	lldt   0x44(%esp)
   3064a:	8d 44 24 44          	lea    0x44(%esp),%eax
   3064e:	a3 a4 db 03 00       	mov    %eax,0x3dba4
   30653:	0f a9                	pop    %gs
   30655:	0f a1                	pop    %fs
   30657:	07                   	pop    %es
   30658:	1f                   	pop    %ds
   30659:	61                   	popa   
   3065a:	cf                   	iret   

0003065b <restore>:
   3065b:	8b 25 80 62 03 00    	mov    0x36280,%esp
   30661:	0f 00 54 24 44       	lldt   0x44(%esp)
   30666:	8d 44 24 44          	lea    0x44(%esp),%eax
   3066a:	a3 a4 db 03 00       	mov    %eax,0x3dba4

0003066f <reenter_restore>:
   3066f:	ff 0d 74 5e 03 00    	decl   0x35e74
   30675:	0f a9                	pop    %gs
   30677:	0f a1                	pop    %fs
   30679:	07                   	pop    %es
   3067a:	1f                   	pop    %ds
   3067b:	61                   	popa   
   3067c:	cf                   	iret   

0003067d <in_byte>:
   3067d:	31 d2                	xor    %edx,%edx
   3067f:	8b 54 24 04          	mov    0x4(%esp),%edx
   30683:	31 c0                	xor    %eax,%eax
   30685:	ec                   	in     (%dx),%al
   30686:	90                   	nop
   30687:	90                   	nop
   30688:	c3                   	ret    

00030689 <out_byte>:
   30689:	31 d2                	xor    %edx,%edx
   3068b:	31 c0                	xor    %eax,%eax
   3068d:	8b 54 24 04          	mov    0x4(%esp),%edx
   30691:	8b 44 24 08          	mov    0x8(%esp),%eax
   30695:	ee                   	out    %al,(%dx)
   30696:	90                   	nop
   30697:	90                   	nop
   30698:	c3                   	ret    

00030699 <in_byte2>:
   30699:	55                   	push   %ebp
   3069a:	89 e5                	mov    %esp,%ebp
   3069c:	52                   	push   %edx
   3069d:	31 d2                	xor    %edx,%edx
   3069f:	66 8b 55 08          	mov    0x8(%ebp),%dx
   306a3:	31 c0                	xor    %eax,%eax
   306a5:	ec                   	in     (%dx),%al
   306a6:	90                   	nop
   306a7:	90                   	nop
   306a8:	5b                   	pop    %ebx
   306a9:	5d                   	pop    %ebp
   306aa:	c3                   	ret    

000306ab <disable_int>:
   306ab:	fa                   	cli    
   306ac:	c3                   	ret    

000306ad <enable_int>:
   306ad:	fb                   	sti    
   306ae:	c3                   	ret    

000306af <check_tss_esp0>:
   306af:	55                   	push   %ebp
   306b0:	89 e5                	mov    %esp,%ebp
   306b2:	8b 45 08             	mov    0x8(%ebp),%eax
   306b5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   306b8:	83 c0 44             	add    $0x44,%eax
   306bb:	8b 15 a4 db 03 00    	mov    0x3dba4,%edx
   306c1:	39 d0                	cmp    %edx,%eax
   306c3:	74 7c                	je     30741 <check_tss_esp0.2>

000306c5 <check_tss_esp0.1>:
   306c5:	50                   	push   %eax
   306c6:	52                   	push   %edx
   306c7:	68 00 50 03 00       	push   $0x35000
   306cc:	e8 b2 fd ff ff       	call   30483 <disp_str>
   306d1:	83 c4 04             	add    $0x4,%esp
   306d4:	5a                   	pop    %edx
   306d5:	58                   	pop    %eax
   306d6:	52                   	push   %edx
   306d7:	50                   	push   %eax
   306d8:	53                   	push   %ebx
   306d9:	e8 f2 01 00 00       	call   308d0 <disp_int>
   306de:	83 c4 04             	add    $0x4,%esp
   306e1:	58                   	pop    %eax
   306e2:	5a                   	pop    %edx
   306e3:	52                   	push   %edx
   306e4:	50                   	push   %eax
   306e5:	e8 e6 01 00 00       	call   308d0 <disp_int>
   306ea:	58                   	pop    %eax
   306eb:	5a                   	pop    %edx
   306ec:	52                   	push   %edx
   306ed:	50                   	push   %eax
   306ee:	ff 35 74 5e 03 00    	pushl  0x35e74
   306f4:	e8 d7 01 00 00       	call   308d0 <disp_int>
   306f9:	83 c4 04             	add    $0x4,%esp
   306fc:	58                   	pop    %eax
   306fd:	5a                   	pop    %edx
   306fe:	52                   	push   %edx
   306ff:	50                   	push   %eax
   30700:	ff 72 ec             	pushl  -0x14(%edx)
   30703:	e8 c8 01 00 00       	call   308d0 <disp_int>
   30708:	83 c4 04             	add    $0x4,%esp
   3070b:	58                   	pop    %eax
   3070c:	5a                   	pop    %edx
   3070d:	52                   	push   %edx
   3070e:	50                   	push   %eax
   3070f:	ff 70 ec             	pushl  -0x14(%eax)
   30712:	e8 b9 01 00 00       	call   308d0 <disp_int>
   30717:	83 c4 04             	add    $0x4,%esp
   3071a:	58                   	pop    %eax
   3071b:	5a                   	pop    %edx
   3071c:	52                   	push   %edx
   3071d:	50                   	push   %eax
   3071e:	ff 35 80 62 03 00    	pushl  0x36280
   30724:	e8 a7 01 00 00       	call   308d0 <disp_int>
   30729:	83 c4 04             	add    $0x4,%esp
   3072c:	58                   	pop    %eax
   3072d:	5a                   	pop    %edx
   3072e:	52                   	push   %edx
   3072f:	50                   	push   %eax
   30730:	68 60 5e 03 00       	push   $0x35e60
   30735:	e8 96 01 00 00       	call   308d0 <disp_int>
   3073a:	83 c4 04             	add    $0x4,%esp
   3073d:	58                   	pop    %eax
   3073e:	5a                   	pop    %edx
   3073f:	5d                   	pop    %ebp
   30740:	c3                   	ret    

00030741 <check_tss_esp0.2>:
   30741:	5d                   	pop    %ebp
   30742:	c3                   	ret    

00030743 <ReloadGDT>:
   30743:	55                   	push   %ebp
   30744:	89 e5                	mov    %esp,%ebp
   30746:	83 ec 28             	sub    $0x28,%esp
   30749:	b8 14 dc 03 00       	mov    $0x3dc14,%eax
   3074e:	0f b7 00             	movzwl (%eax),%eax
   30751:	98                   	cwtl   
   30752:	ba 16 dc 03 00       	mov    $0x3dc16,%edx
   30757:	8b 12                	mov    (%edx),%edx
   30759:	83 ec 04             	sub    $0x4,%esp
   3075c:	50                   	push   %eax
   3075d:	52                   	push   %edx
   3075e:	68 80 5e 03 00       	push   $0x35e80
   30763:	e8 f3 29 00 00       	call   3315b <Memcpy>
   30768:	83 c4 10             	add    $0x10,%esp
   3076b:	c7 45 f0 14 dc 03 00 	movl   $0x3dc14,-0x10(%ebp)
   30772:	c7 45 ec 16 dc 03 00 	movl   $0x3dc16,-0x14(%ebp)
   30779:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3077c:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   30781:	ba 80 5e 03 00       	mov    $0x35e80,%edx
   30786:	8b 45 ec             	mov    -0x14(%ebp),%eax
   30789:	89 10                	mov    %edx,(%eax)
   3078b:	c7 45 e8 68 5e 03 00 	movl   $0x35e68,-0x18(%ebp)
   30792:	c7 45 e4 6a 5e 03 00 	movl   $0x35e6a,-0x1c(%ebp)
   30799:	8b 45 e8             	mov    -0x18(%ebp),%eax
   3079c:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   307a1:	ba 20 dc 03 00       	mov    $0x3dc20,%edx
   307a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   307a9:	89 10                	mov    %edx,(%eax)
   307ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   307b2:	eb 04                	jmp    307b8 <ReloadGDT+0x75>
   307b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   307b8:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
   307bf:	7e f3                	jle    307b4 <ReloadGDT+0x71>
   307c1:	e8 c1 02 00 00       	call   30a87 <init_internal_interrupt>
   307c6:	e8 02 06 00 00       	call   30dcd <init_propt>
   307cb:	90                   	nop
   307cc:	c9                   	leave  
   307cd:	c3                   	ret    

000307ce <InitInterruptDesc>:
   307ce:	55                   	push   %ebp
   307cf:	89 e5                	mov    %esp,%ebp
   307d1:	83 ec 10             	sub    $0x10,%esp
   307d4:	8b 45 08             	mov    0x8(%ebp),%eax
   307d7:	c1 e0 03             	shl    $0x3,%eax
   307da:	05 20 dc 03 00       	add    $0x3dc20,%eax
   307df:	89 45 fc             	mov    %eax,-0x4(%ebp)
   307e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
   307e5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
   307e9:	8b 45 0c             	mov    0xc(%ebp),%eax
   307ec:	89 45 f8             	mov    %eax,-0x8(%ebp)
   307ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
   307f2:	89 c2                	mov    %eax,%edx
   307f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
   307f7:	66 89 10             	mov    %dx,(%eax)
   307fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
   307fd:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
   30803:	8b 45 f8             	mov    -0x8(%ebp),%eax
   30806:	c1 f8 10             	sar    $0x10,%eax
   30809:	89 c2                	mov    %eax,%edx
   3080b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3080e:	66 89 50 06          	mov    %dx,0x6(%eax)
   30812:	8b 45 10             	mov    0x10(%ebp),%eax
   30815:	c1 e0 04             	shl    $0x4,%eax
   30818:	89 c2                	mov    %eax,%edx
   3081a:	8b 45 14             	mov    0x14(%ebp),%eax
   3081d:	09 d0                	or     %edx,%eax
   3081f:	89 c2                	mov    %eax,%edx
   30821:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30824:	88 50 05             	mov    %dl,0x5(%eax)
   30827:	90                   	nop
   30828:	c9                   	leave  
   30829:	c3                   	ret    

0003082a <atoi>:
   3082a:	55                   	push   %ebp
   3082b:	89 e5                	mov    %esp,%ebp
   3082d:	83 ec 10             	sub    $0x10,%esp
   30830:	8b 45 08             	mov    0x8(%ebp),%eax
   30833:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30836:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30839:	8d 50 01             	lea    0x1(%eax),%edx
   3083c:	89 55 fc             	mov    %edx,-0x4(%ebp)
   3083f:	c6 00 30             	movb   $0x30,(%eax)
   30842:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30845:	8d 50 01             	lea    0x1(%eax),%edx
   30848:	89 55 fc             	mov    %edx,-0x4(%ebp)
   3084b:	c6 00 78             	movb   $0x78,(%eax)
   3084e:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
   30852:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   30856:	75 0e                	jne    30866 <atoi+0x3c>
   30858:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3085b:	8d 50 01             	lea    0x1(%eax),%edx
   3085e:	89 55 fc             	mov    %edx,-0x4(%ebp)
   30861:	c6 00 30             	movb   $0x30,(%eax)
   30864:	eb 61                	jmp    308c7 <atoi+0x9d>
   30866:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
   3086d:	eb 52                	jmp    308c1 <atoi+0x97>
   3086f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30872:	8b 55 0c             	mov    0xc(%ebp),%edx
   30875:	89 c1                	mov    %eax,%ecx
   30877:	d3 fa                	sar    %cl,%edx
   30879:	89 d0                	mov    %edx,%eax
   3087b:	83 e0 0f             	and    $0xf,%eax
   3087e:	88 45 fb             	mov    %al,-0x5(%ebp)
   30881:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
   30885:	75 06                	jne    3088d <atoi+0x63>
   30887:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
   3088b:	74 2f                	je     308bc <atoi+0x92>
   3088d:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
   30891:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
   30895:	83 c0 30             	add    $0x30,%eax
   30898:	88 45 fb             	mov    %al,-0x5(%ebp)
   3089b:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
   3089f:	7e 0a                	jle    308ab <atoi+0x81>
   308a1:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
   308a5:	83 c0 07             	add    $0x7,%eax
   308a8:	88 45 fb             	mov    %al,-0x5(%ebp)
   308ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
   308ae:	8d 50 01             	lea    0x1(%eax),%edx
   308b1:	89 55 fc             	mov    %edx,-0x4(%ebp)
   308b4:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
   308b8:	88 10                	mov    %dl,(%eax)
   308ba:	eb 01                	jmp    308bd <atoi+0x93>
   308bc:	90                   	nop
   308bd:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
   308c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   308c5:	79 a8                	jns    3086f <atoi+0x45>
   308c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
   308ca:	c6 00 00             	movb   $0x0,(%eax)
   308cd:	90                   	nop
   308ce:	c9                   	leave  
   308cf:	c3                   	ret    

000308d0 <disp_int>:
   308d0:	55                   	push   %ebp
   308d1:	89 e5                	mov    %esp,%ebp
   308d3:	83 ec 18             	sub    $0x18,%esp
   308d6:	ff 75 08             	pushl  0x8(%ebp)
   308d9:	8d 45 e8             	lea    -0x18(%ebp),%eax
   308dc:	50                   	push   %eax
   308dd:	e8 48 ff ff ff       	call   3082a <atoi>
   308e2:	83 c4 08             	add    $0x8,%esp
   308e5:	83 ec 08             	sub    $0x8,%esp
   308e8:	6a 0b                	push   $0xb
   308ea:	8d 45 e8             	lea    -0x18(%ebp),%eax
   308ed:	50                   	push   %eax
   308ee:	e8 cb fb ff ff       	call   304be <disp_str_colour>
   308f3:	83 c4 10             	add    $0x10,%esp
   308f6:	90                   	nop
   308f7:	c9                   	leave  
   308f8:	c3                   	ret    

000308f9 <exception_handler>:
   308f9:	55                   	push   %ebp
   308fa:	89 e5                	mov    %esp,%ebp
   308fc:	57                   	push   %edi
   308fd:	56                   	push   %esi
   308fe:	53                   	push   %ebx
   308ff:	83 ec 6c             	sub    $0x6c,%esp
   30902:	8d 45 90             	lea    -0x70(%ebp),%eax
   30905:	bb 60 2e 03 00       	mov    $0x32e60,%ebx
   3090a:	ba 13 00 00 00       	mov    $0x13,%edx
   3090f:	89 c7                	mov    %eax,%edi
   30911:	89 de                	mov    %ebx,%esi
   30913:	89 d1                	mov    %edx,%ecx
   30915:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   30917:	c7 05 70 5e 03 00 00 	movl   $0x0,0x35e70
   3091e:	00 00 00 
   30921:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   30928:	eb 14                	jmp    3093e <exception_handler+0x45>
   3092a:	83 ec 0c             	sub    $0xc,%esp
   3092d:	68 28 2c 03 00       	push   $0x32c28
   30932:	e8 4c fb ff ff       	call   30483 <disp_str>
   30937:	83 c4 10             	add    $0x10,%esp
   3093a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   3093e:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
   30945:	7e e3                	jle    3092a <exception_handler+0x31>
   30947:	c7 05 70 5e 03 00 00 	movl   $0x0,0x35e70
   3094e:	00 00 00 
   30951:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
   30958:	8b 45 08             	mov    0x8(%ebp),%eax
   3095b:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
   3095f:	89 45 dc             	mov    %eax,-0x24(%ebp)
   30962:	83 ec 08             	sub    $0x8,%esp
   30965:	ff 75 e0             	pushl  -0x20(%ebp)
   30968:	ff 75 dc             	pushl  -0x24(%ebp)
   3096b:	e8 4e fb ff ff       	call   304be <disp_str_colour>
   30970:	83 c4 10             	add    $0x10,%esp
   30973:	83 ec 0c             	sub    $0xc,%esp
   30976:	68 2a 2c 03 00       	push   $0x32c2a
   3097b:	e8 03 fb ff ff       	call   30483 <disp_str>
   30980:	83 c4 10             	add    $0x10,%esp
   30983:	83 ec 08             	sub    $0x8,%esp
   30986:	ff 75 e0             	pushl  -0x20(%ebp)
   30989:	68 2d 2c 03 00       	push   $0x32c2d
   3098e:	e8 2b fb ff ff       	call   304be <disp_str_colour>
   30993:	83 c4 10             	add    $0x10,%esp
   30996:	83 ec 0c             	sub    $0xc,%esp
   30999:	ff 75 08             	pushl  0x8(%ebp)
   3099c:	e8 2f ff ff ff       	call   308d0 <disp_int>
   309a1:	83 c4 10             	add    $0x10,%esp
   309a4:	83 ec 0c             	sub    $0xc,%esp
   309a7:	68 2a 2c 03 00       	push   $0x32c2a
   309ac:	e8 d2 fa ff ff       	call   30483 <disp_str>
   309b1:	83 c4 10             	add    $0x10,%esp
   309b4:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   309b8:	74 31                	je     309eb <exception_handler+0xf2>
   309ba:	83 ec 08             	sub    $0x8,%esp
   309bd:	ff 75 e0             	pushl  -0x20(%ebp)
   309c0:	68 35 2c 03 00       	push   $0x32c35
   309c5:	e8 f4 fa ff ff       	call   304be <disp_str_colour>
   309ca:	83 c4 10             	add    $0x10,%esp
   309cd:	83 ec 0c             	sub    $0xc,%esp
   309d0:	ff 75 0c             	pushl  0xc(%ebp)
   309d3:	e8 f8 fe ff ff       	call   308d0 <disp_int>
   309d8:	83 c4 10             	add    $0x10,%esp
   309db:	83 ec 0c             	sub    $0xc,%esp
   309de:	68 2a 2c 03 00       	push   $0x32c2a
   309e3:	e8 9b fa ff ff       	call   30483 <disp_str>
   309e8:	83 c4 10             	add    $0x10,%esp
   309eb:	83 ec 08             	sub    $0x8,%esp
   309ee:	ff 75 e0             	pushl  -0x20(%ebp)
   309f1:	68 3f 2c 03 00       	push   $0x32c3f
   309f6:	e8 c3 fa ff ff       	call   304be <disp_str_colour>
   309fb:	83 c4 10             	add    $0x10,%esp
   309fe:	83 ec 0c             	sub    $0xc,%esp
   30a01:	ff 75 14             	pushl  0x14(%ebp)
   30a04:	e8 c7 fe ff ff       	call   308d0 <disp_int>
   30a09:	83 c4 10             	add    $0x10,%esp
   30a0c:	83 ec 0c             	sub    $0xc,%esp
   30a0f:	68 2a 2c 03 00       	push   $0x32c2a
   30a14:	e8 6a fa ff ff       	call   30483 <disp_str>
   30a19:	83 c4 10             	add    $0x10,%esp
   30a1c:	83 ec 08             	sub    $0x8,%esp
   30a1f:	ff 75 e0             	pushl  -0x20(%ebp)
   30a22:	68 43 2c 03 00       	push   $0x32c43
   30a27:	e8 92 fa ff ff       	call   304be <disp_str_colour>
   30a2c:	83 c4 10             	add    $0x10,%esp
   30a2f:	83 ec 0c             	sub    $0xc,%esp
   30a32:	ff 75 10             	pushl  0x10(%ebp)
   30a35:	e8 96 fe ff ff       	call   308d0 <disp_int>
   30a3a:	83 c4 10             	add    $0x10,%esp
   30a3d:	83 ec 0c             	sub    $0xc,%esp
   30a40:	68 2a 2c 03 00       	push   $0x32c2a
   30a45:	e8 39 fa ff ff       	call   30483 <disp_str>
   30a4a:	83 c4 10             	add    $0x10,%esp
   30a4d:	83 ec 08             	sub    $0x8,%esp
   30a50:	ff 75 e0             	pushl  -0x20(%ebp)
   30a53:	68 48 2c 03 00       	push   $0x32c48
   30a58:	e8 61 fa ff ff       	call   304be <disp_str_colour>
   30a5d:	83 c4 10             	add    $0x10,%esp
   30a60:	83 ec 0c             	sub    $0xc,%esp
   30a63:	ff 75 18             	pushl  0x18(%ebp)
   30a66:	e8 65 fe ff ff       	call   308d0 <disp_int>
   30a6b:	83 c4 10             	add    $0x10,%esp
   30a6e:	83 ec 0c             	sub    $0xc,%esp
   30a71:	68 2a 2c 03 00       	push   $0x32c2a
   30a76:	e8 08 fa ff ff       	call   30483 <disp_str>
   30a7b:	83 c4 10             	add    $0x10,%esp
   30a7e:	90                   	nop
   30a7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
   30a82:	5b                   	pop    %ebx
   30a83:	5e                   	pop    %esi
   30a84:	5f                   	pop    %edi
   30a85:	5d                   	pop    %ebp
   30a86:	c3                   	ret    

00030a87 <init_internal_interrupt>:
   30a87:	55                   	push   %ebp
   30a88:	89 e5                	mov    %esp,%ebp
   30a8a:	6a 0e                	push   $0xe
   30a8c:	6a 08                	push   $0x8
   30a8e:	68 fa 04 03 00       	push   $0x304fa
   30a93:	6a 00                	push   $0x0
   30a95:	e8 34 fd ff ff       	call   307ce <InitInterruptDesc>
   30a9a:	83 c4 10             	add    $0x10,%esp
   30a9d:	6a 0e                	push   $0xe
   30a9f:	6a 08                	push   $0x8
   30aa1:	68 00 05 03 00       	push   $0x30500
   30aa6:	6a 01                	push   $0x1
   30aa8:	e8 21 fd ff ff       	call   307ce <InitInterruptDesc>
   30aad:	83 c4 10             	add    $0x10,%esp
   30ab0:	6a 0e                	push   $0xe
   30ab2:	6a 08                	push   $0x8
   30ab4:	68 06 05 03 00       	push   $0x30506
   30ab9:	6a 02                	push   $0x2
   30abb:	e8 0e fd ff ff       	call   307ce <InitInterruptDesc>
   30ac0:	83 c4 10             	add    $0x10,%esp
   30ac3:	6a 0e                	push   $0xe
   30ac5:	6a 08                	push   $0x8
   30ac7:	68 0c 05 03 00       	push   $0x3050c
   30acc:	6a 03                	push   $0x3
   30ace:	e8 fb fc ff ff       	call   307ce <InitInterruptDesc>
   30ad3:	83 c4 10             	add    $0x10,%esp
   30ad6:	6a 0e                	push   $0xe
   30ad8:	6a 08                	push   $0x8
   30ada:	68 12 05 03 00       	push   $0x30512
   30adf:	6a 04                	push   $0x4
   30ae1:	e8 e8 fc ff ff       	call   307ce <InitInterruptDesc>
   30ae6:	83 c4 10             	add    $0x10,%esp
   30ae9:	6a 0e                	push   $0xe
   30aeb:	6a 08                	push   $0x8
   30aed:	68 18 05 03 00       	push   $0x30518
   30af2:	6a 05                	push   $0x5
   30af4:	e8 d5 fc ff ff       	call   307ce <InitInterruptDesc>
   30af9:	83 c4 10             	add    $0x10,%esp
   30afc:	6a 0e                	push   $0xe
   30afe:	6a 08                	push   $0x8
   30b00:	68 1e 05 03 00       	push   $0x3051e
   30b05:	6a 06                	push   $0x6
   30b07:	e8 c2 fc ff ff       	call   307ce <InitInterruptDesc>
   30b0c:	83 c4 10             	add    $0x10,%esp
   30b0f:	6a 0e                	push   $0xe
   30b11:	6a 08                	push   $0x8
   30b13:	68 24 05 03 00       	push   $0x30524
   30b18:	6a 07                	push   $0x7
   30b1a:	e8 af fc ff ff       	call   307ce <InitInterruptDesc>
   30b1f:	83 c4 10             	add    $0x10,%esp
   30b22:	6a 0e                	push   $0xe
   30b24:	6a 08                	push   $0x8
   30b26:	68 2a 05 03 00       	push   $0x3052a
   30b2b:	6a 08                	push   $0x8
   30b2d:	e8 9c fc ff ff       	call   307ce <InitInterruptDesc>
   30b32:	83 c4 10             	add    $0x10,%esp
   30b35:	6a 0e                	push   $0xe
   30b37:	6a 08                	push   $0x8
   30b39:	68 2e 05 03 00       	push   $0x3052e
   30b3e:	6a 09                	push   $0x9
   30b40:	e8 89 fc ff ff       	call   307ce <InitInterruptDesc>
   30b45:	83 c4 10             	add    $0x10,%esp
   30b48:	6a 0e                	push   $0xe
   30b4a:	6a 08                	push   $0x8
   30b4c:	68 34 05 03 00       	push   $0x30534
   30b51:	6a 0a                	push   $0xa
   30b53:	e8 76 fc ff ff       	call   307ce <InitInterruptDesc>
   30b58:	83 c4 10             	add    $0x10,%esp
   30b5b:	6a 0e                	push   $0xe
   30b5d:	6a 08                	push   $0x8
   30b5f:	68 38 05 03 00       	push   $0x30538
   30b64:	6a 0b                	push   $0xb
   30b66:	e8 63 fc ff ff       	call   307ce <InitInterruptDesc>
   30b6b:	83 c4 10             	add    $0x10,%esp
   30b6e:	6a 0e                	push   $0xe
   30b70:	6a 08                	push   $0x8
   30b72:	68 3c 05 03 00       	push   $0x3053c
   30b77:	6a 0c                	push   $0xc
   30b79:	e8 50 fc ff ff       	call   307ce <InitInterruptDesc>
   30b7e:	83 c4 10             	add    $0x10,%esp
   30b81:	6a 0e                	push   $0xe
   30b83:	6a 08                	push   $0x8
   30b85:	68 40 05 03 00       	push   $0x30540
   30b8a:	6a 0d                	push   $0xd
   30b8c:	e8 3d fc ff ff       	call   307ce <InitInterruptDesc>
   30b91:	83 c4 10             	add    $0x10,%esp
   30b94:	6a 0e                	push   $0xe
   30b96:	6a 08                	push   $0x8
   30b98:	68 44 05 03 00       	push   $0x30544
   30b9d:	6a 0e                	push   $0xe
   30b9f:	e8 2a fc ff ff       	call   307ce <InitInterruptDesc>
   30ba4:	83 c4 10             	add    $0x10,%esp
   30ba7:	6a 0e                	push   $0xe
   30ba9:	6a 08                	push   $0x8
   30bab:	68 48 05 03 00       	push   $0x30548
   30bb0:	6a 10                	push   $0x10
   30bb2:	e8 17 fc ff ff       	call   307ce <InitInterruptDesc>
   30bb7:	83 c4 10             	add    $0x10,%esp
   30bba:	6a 0e                	push   $0xe
   30bbc:	6a 08                	push   $0x8
   30bbe:	68 4e 05 03 00       	push   $0x3054e
   30bc3:	6a 11                	push   $0x11
   30bc5:	e8 04 fc ff ff       	call   307ce <InitInterruptDesc>
   30bca:	83 c4 10             	add    $0x10,%esp
   30bcd:	6a 0e                	push   $0xe
   30bcf:	6a 08                	push   $0x8
   30bd1:	68 52 05 03 00       	push   $0x30552
   30bd6:	6a 12                	push   $0x12
   30bd8:	e8 f1 fb ff ff       	call   307ce <InitInterruptDesc>
   30bdd:	83 c4 10             	add    $0x10,%esp
   30be0:	6a 0e                	push   $0xe
   30be2:	6a 0e                	push   $0xe
   30be4:	68 f0 05 03 00       	push   $0x305f0
   30be9:	68 90 00 00 00       	push   $0x90
   30bee:	e8 db fb ff ff       	call   307ce <InitInterruptDesc>
   30bf3:	83 c4 10             	add    $0x10,%esp
   30bf6:	90                   	nop
   30bf7:	c9                   	leave  
   30bf8:	c3                   	ret    

00030bf9 <test>:
   30bf9:	55                   	push   %ebp
   30bfa:	89 e5                	mov    %esp,%ebp
   30bfc:	83 ec 18             	sub    $0x18,%esp
   30bff:	83 ec 0c             	sub    $0xc,%esp
   30c02:	68 ac 2e 03 00       	push   $0x32eac
   30c07:	e8 77 f8 ff ff       	call   30483 <disp_str>
   30c0c:	83 c4 10             	add    $0x10,%esp
   30c0f:	83 ec 0c             	sub    $0xc,%esp
   30c12:	6a 06                	push   $0x6
   30c14:	e8 b7 fc ff ff       	call   308d0 <disp_int>
   30c19:	83 c4 10             	add    $0x10,%esp
   30c1c:	83 ec 0c             	sub    $0xc,%esp
   30c1f:	68 ae 2e 03 00       	push   $0x32eae
   30c24:	e8 5a f8 ff ff       	call   30483 <disp_str>
   30c29:	83 c4 10             	add    $0x10,%esp
   30c2c:	c7 05 70 5e 03 00 00 	movl   $0x0,0x35e70
   30c33:	00 00 00 
   30c36:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30c3d:	eb 14                	jmp    30c53 <test+0x5a>
   30c3f:	83 ec 0c             	sub    $0xc,%esp
   30c42:	68 28 2c 03 00       	push   $0x32c28
   30c47:	e8 37 f8 ff ff       	call   30483 <disp_str>
   30c4c:	83 c4 10             	add    $0x10,%esp
   30c4f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30c53:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
   30c5a:	7e e3                	jle    30c3f <test+0x46>
   30c5c:	c7 05 70 5e 03 00 00 	movl   $0x0,0x35e70
   30c63:	00 00 00 
   30c66:	83 ec 08             	sub    $0x8,%esp
   30c69:	6a 0f                	push   $0xf
   30c6b:	68 b0 2e 03 00       	push   $0x32eb0
   30c70:	e8 49 f8 ff ff       	call   304be <disp_str_colour>
   30c75:	83 c4 10             	add    $0x10,%esp
   30c78:	83 ec 0c             	sub    $0xc,%esp
   30c7b:	68 ae 2e 03 00       	push   $0x32eae
   30c80:	e8 fe f7 ff ff       	call   30483 <disp_str>
   30c85:	83 c4 10             	add    $0x10,%esp
   30c88:	83 ec 0c             	sub    $0xc,%esp
   30c8b:	68 89 00 00 00       	push   $0x89
   30c90:	e8 3b fc ff ff       	call   308d0 <disp_int>
   30c95:	83 c4 10             	add    $0x10,%esp
   30c98:	83 ec 0c             	sub    $0xc,%esp
   30c9b:	68 ae 2e 03 00       	push   $0x32eae
   30ca0:	e8 de f7 ff ff       	call   30483 <disp_str>
   30ca5:	83 c4 10             	add    $0x10,%esp
   30ca8:	83 ec 08             	sub    $0x8,%esp
   30cab:	6a 0f                	push   $0xf
   30cad:	68 b0 2e 03 00       	push   $0x32eb0
   30cb2:	e8 07 f8 ff ff       	call   304be <disp_str_colour>
   30cb7:	83 c4 10             	add    $0x10,%esp
   30cba:	83 ec 08             	sub    $0x8,%esp
   30cbd:	6a 74                	push   $0x74
   30cbf:	68 b0 2e 03 00       	push   $0x32eb0
   30cc4:	e8 f5 f7 ff ff       	call   304be <disp_str_colour>
   30cc9:	83 c4 10             	add    $0x10,%esp
   30ccc:	83 ec 0c             	sub    $0xc,%esp
   30ccf:	68 ae 2e 03 00       	push   $0x32eae
   30cd4:	e8 aa f7 ff ff       	call   30483 <disp_str>
   30cd9:	83 c4 10             	add    $0x10,%esp
   30cdc:	83 ec 08             	sub    $0x8,%esp
   30cdf:	6a 0f                	push   $0xf
   30ce1:	68 c0 2e 03 00       	push   $0x32ec0
   30ce6:	e8 d3 f7 ff ff       	call   304be <disp_str_colour>
   30ceb:	83 c4 10             	add    $0x10,%esp
   30cee:	83 ec 0c             	sub    $0xc,%esp
   30cf1:	68 e9 2e 03 00       	push   $0x32ee9
   30cf6:	e8 88 f7 ff ff       	call   30483 <disp_str>
   30cfb:	83 c4 10             	add    $0x10,%esp
   30cfe:	83 ec 0c             	sub    $0xc,%esp
   30d01:	68 fd 2e 03 00       	push   $0x32efd
   30d06:	e8 78 f7 ff ff       	call   30483 <disp_str>
   30d0b:	83 c4 10             	add    $0x10,%esp
   30d0e:	83 ec 0c             	sub    $0xc,%esp
   30d11:	6a 17                	push   $0x17
   30d13:	e8 b8 fb ff ff       	call   308d0 <disp_int>
   30d18:	83 c4 10             	add    $0x10,%esp
   30d1b:	83 ec 0c             	sub    $0xc,%esp
   30d1e:	68 ae 2e 03 00       	push   $0x32eae
   30d23:	e8 5b f7 ff ff       	call   30483 <disp_str>
   30d28:	83 c4 10             	add    $0x10,%esp
   30d2b:	83 ec 0c             	sub    $0xc,%esp
   30d2e:	68 0a 02 00 00       	push   $0x20a
   30d33:	e8 98 fb ff ff       	call   308d0 <disp_int>
   30d38:	83 c4 10             	add    $0x10,%esp
   30d3b:	83 ec 0c             	sub    $0xc,%esp
   30d3e:	68 ae 2e 03 00       	push   $0x32eae
   30d43:	e8 3b f7 ff ff       	call   30483 <disp_str>
   30d48:	83 c4 10             	add    $0x10,%esp
   30d4b:	90                   	nop
   30d4c:	c9                   	leave  
   30d4d:	c3                   	ret    

00030d4e <disp_str_colour3>:
   30d4e:	55                   	push   %ebp
   30d4f:	89 e5                	mov    %esp,%ebp
   30d51:	90                   	nop
   30d52:	5d                   	pop    %ebp
   30d53:	c3                   	ret    

00030d54 <spurious_irq>:
   30d54:	55                   	push   %ebp
   30d55:	89 e5                	mov    %esp,%ebp
   30d57:	83 ec 08             	sub    $0x8,%esp
   30d5a:	83 ec 08             	sub    $0x8,%esp
   30d5d:	6a 0b                	push   $0xb
   30d5f:	68 0c 2f 03 00       	push   $0x32f0c
   30d64:	e8 55 f7 ff ff       	call   304be <disp_str_colour>
   30d69:	83 c4 10             	add    $0x10,%esp
   30d6c:	83 ec 0c             	sub    $0xc,%esp
   30d6f:	ff 75 08             	pushl  0x8(%ebp)
   30d72:	e8 59 fb ff ff       	call   308d0 <disp_int>
   30d77:	83 c4 10             	add    $0x10,%esp
   30d7a:	a1 20 e4 03 00       	mov    0x3e420,%eax
   30d7f:	83 c0 01             	add    $0x1,%eax
   30d82:	a3 20 e4 03 00       	mov    %eax,0x3e420
   30d87:	83 ec 0c             	sub    $0xc,%esp
   30d8a:	68 33 2f 03 00       	push   $0x32f33
   30d8f:	e8 ef f6 ff ff       	call   30483 <disp_str>
   30d94:	83 c4 10             	add    $0x10,%esp
   30d97:	a1 20 e4 03 00       	mov    0x3e420,%eax
   30d9c:	83 ec 0c             	sub    $0xc,%esp
   30d9f:	50                   	push   %eax
   30da0:	e8 2b fb ff ff       	call   308d0 <disp_int>
   30da5:	83 c4 10             	add    $0x10,%esp
   30da8:	83 ec 0c             	sub    $0xc,%esp
   30dab:	68 35 2f 03 00       	push   $0x32f35
   30db0:	e8 ce f6 ff ff       	call   30483 <disp_str>
   30db5:	83 c4 10             	add    $0x10,%esp
   30db8:	83 ec 08             	sub    $0x8,%esp
   30dbb:	6a 0c                	push   $0xc
   30dbd:	68 38 2f 03 00       	push   $0x32f38
   30dc2:	e8 f7 f6 ff ff       	call   304be <disp_str_colour>
   30dc7:	83 c4 10             	add    $0x10,%esp
   30dca:	90                   	nop
   30dcb:	c9                   	leave  
   30dcc:	c3                   	ret    

00030dcd <init_propt>:
   30dcd:	55                   	push   %ebp
   30dce:	89 e5                	mov    %esp,%ebp
   30dd0:	53                   	push   %ebx
   30dd1:	83 ec 24             	sub    $0x24,%esp
   30dd4:	b8 20 00 00 00       	mov    $0x20,%eax
   30dd9:	6a 0e                	push   $0xe
   30ddb:	6a 08                	push   $0x8
   30ddd:	68 61 05 03 00       	push   $0x30561
   30de2:	50                   	push   %eax
   30de3:	e8 e6 f9 ff ff       	call   307ce <InitInterruptDesc>
   30de8:	83 c4 10             	add    $0x10,%esp
   30deb:	b8 20 00 00 00       	mov    $0x20,%eax
   30df0:	83 c0 01             	add    $0x1,%eax
   30df3:	6a 0e                	push   $0xe
   30df5:	6a 08                	push   $0x8
   30df7:	68 aa 05 03 00       	push   $0x305aa
   30dfc:	50                   	push   %eax
   30dfd:	e8 cc f9 ff ff       	call   307ce <InitInterruptDesc>
   30e02:	83 c4 10             	add    $0x10,%esp
   30e05:	83 ec 04             	sub    $0x4,%esp
   30e08:	68 d0 02 00 00       	push   $0x2d0
   30e0d:	6a 00                	push   $0x0
   30e0f:	68 80 e4 03 00       	push   $0x3e480
   30e14:	e8 70 23 00 00       	call   33189 <Memset>
   30e19:	83 c4 10             	add    $0x10,%esp
   30e1c:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
   30e23:	83 ec 04             	sub    $0x4,%esp
   30e26:	ff 75 f0             	pushl  -0x10(%ebp)
   30e29:	6a 00                	push   $0x0
   30e2b:	68 a0 db 03 00       	push   $0x3dba0
   30e30:	e8 54 23 00 00       	call   33189 <Memset>
   30e35:	83 c4 10             	add    $0x10,%esp
   30e38:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30e3b:	a3 08 dc 03 00       	mov    %eax,0x3dc08
   30e40:	c7 05 a8 db 03 00 30 	movl   $0x30,0x3dba8
   30e47:	00 00 00 
   30e4a:	83 ec 0c             	sub    $0xc,%esp
   30e4d:	6a 30                	push   $0x30
   30e4f:	e8 4c 01 00 00       	call   30fa0 <Seg2PhyAddr>
   30e54:	83 c4 10             	add    $0x10,%esp
   30e57:	89 45 ec             	mov    %eax,-0x14(%ebp)
   30e5a:	8b 45 ec             	mov    -0x14(%ebp),%eax
   30e5d:	83 ec 08             	sub    $0x8,%esp
   30e60:	68 a0 db 03 00       	push   $0x3dba0
   30e65:	50                   	push   %eax
   30e66:	e8 ba 01 00 00       	call   31025 <VirAddr2PhyAddr>
   30e6b:	83 c4 10             	add    $0x10,%esp
   30e6e:	89 45 e8             	mov    %eax,-0x18(%ebp)
   30e71:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
   30e78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30e7b:	0f b7 d0             	movzwl %ax,%edx
   30e7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30e81:	83 e8 01             	sub    $0x1,%eax
   30e84:	89 c1                	mov    %eax,%ecx
   30e86:	8b 45 e8             	mov    -0x18(%ebp),%eax
   30e89:	52                   	push   %edx
   30e8a:	51                   	push   %ecx
   30e8b:	50                   	push   %eax
   30e8c:	68 c0 5e 03 00       	push   $0x35ec0
   30e91:	e8 9d 00 00 00       	call   30f33 <InitDescriptor>
   30e96:	83 c4 10             	add    $0x10,%esp
   30e99:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30ea0:	eb 69                	jmp    30f0b <init_propt+0x13e>
   30ea2:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
   30ea9:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
   30eb0:	8b 55 f4             	mov    -0xc(%ebp),%edx
   30eb3:	89 d0                	mov    %edx,%eax
   30eb5:	c1 e0 03             	shl    $0x3,%eax
   30eb8:	01 d0                	add    %edx,%eax
   30eba:	c1 e0 04             	shl    $0x4,%eax
   30ebd:	83 c0 40             	add    $0x40,%eax
   30ec0:	05 80 e4 03 00       	add    $0x3e480,%eax
   30ec5:	8d 50 06             	lea    0x6(%eax),%edx
   30ec8:	8b 45 ec             	mov    -0x14(%ebp),%eax
   30ecb:	83 ec 08             	sub    $0x8,%esp
   30ece:	52                   	push   %edx
   30ecf:	50                   	push   %eax
   30ed0:	e8 50 01 00 00       	call   31025 <VirAddr2PhyAddr>
   30ed5:	83 c4 10             	add    $0x10,%esp
   30ed8:	89 45 d8             	mov    %eax,-0x28(%ebp)
   30edb:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30ede:	0f b7 d0             	movzwl %ax,%edx
   30ee1:	8b 45 e0             	mov    -0x20(%ebp),%eax
   30ee4:	83 e8 01             	sub    $0x1,%eax
   30ee7:	89 c3                	mov    %eax,%ebx
   30ee9:	8b 45 d8             	mov    -0x28(%ebp),%eax
   30eec:	8b 4d f4             	mov    -0xc(%ebp),%ecx
   30eef:	83 c1 09             	add    $0x9,%ecx
   30ef2:	c1 e1 03             	shl    $0x3,%ecx
   30ef5:	81 c1 80 5e 03 00    	add    $0x35e80,%ecx
   30efb:	52                   	push   %edx
   30efc:	53                   	push   %ebx
   30efd:	50                   	push   %eax
   30efe:	51                   	push   %ecx
   30eff:	e8 2f 00 00 00       	call   30f33 <InitDescriptor>
   30f04:	83 c4 10             	add    $0x10,%esp
   30f07:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30f0b:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
   30f0f:	7e 91                	jle    30ea2 <init_propt+0xd5>
   30f11:	68 f2 00 00 00       	push   $0xf2
   30f16:	68 ff ff 00 00       	push   $0xffff
   30f1b:	68 00 80 0b 00       	push   $0xb8000
   30f20:	68 b8 5e 03 00       	push   $0x35eb8
   30f25:	e8 09 00 00 00       	call   30f33 <InitDescriptor>
   30f2a:	83 c4 10             	add    $0x10,%esp
   30f2d:	90                   	nop
   30f2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   30f31:	c9                   	leave  
   30f32:	c3                   	ret    

00030f33 <InitDescriptor>:
   30f33:	55                   	push   %ebp
   30f34:	89 e5                	mov    %esp,%ebp
   30f36:	83 ec 04             	sub    $0x4,%esp
   30f39:	8b 45 14             	mov    0x14(%ebp),%eax
   30f3c:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
   30f40:	8b 45 10             	mov    0x10(%ebp),%eax
   30f43:	89 c2                	mov    %eax,%edx
   30f45:	8b 45 08             	mov    0x8(%ebp),%eax
   30f48:	66 89 10             	mov    %dx,(%eax)
   30f4b:	8b 45 0c             	mov    0xc(%ebp),%eax
   30f4e:	89 c2                	mov    %eax,%edx
   30f50:	8b 45 08             	mov    0x8(%ebp),%eax
   30f53:	66 89 50 02          	mov    %dx,0x2(%eax)
   30f57:	8b 45 0c             	mov    0xc(%ebp),%eax
   30f5a:	c1 e8 10             	shr    $0x10,%eax
   30f5d:	89 c2                	mov    %eax,%edx
   30f5f:	8b 45 08             	mov    0x8(%ebp),%eax
   30f62:	88 50 04             	mov    %dl,0x4(%eax)
   30f65:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
   30f69:	89 c2                	mov    %eax,%edx
   30f6b:	8b 45 08             	mov    0x8(%ebp),%eax
   30f6e:	88 50 05             	mov    %dl,0x5(%eax)
   30f71:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
   30f75:	66 c1 e8 08          	shr    $0x8,%ax
   30f79:	c1 e0 04             	shl    $0x4,%eax
   30f7c:	89 c2                	mov    %eax,%edx
   30f7e:	8b 45 10             	mov    0x10(%ebp),%eax
   30f81:	c1 e8 10             	shr    $0x10,%eax
   30f84:	83 e0 0f             	and    $0xf,%eax
   30f87:	09 c2                	or     %eax,%edx
   30f89:	8b 45 08             	mov    0x8(%ebp),%eax
   30f8c:	88 50 06             	mov    %dl,0x6(%eax)
   30f8f:	8b 45 0c             	mov    0xc(%ebp),%eax
   30f92:	c1 e8 18             	shr    $0x18,%eax
   30f95:	89 c2                	mov    %eax,%edx
   30f97:	8b 45 08             	mov    0x8(%ebp),%eax
   30f9a:	88 50 07             	mov    %dl,0x7(%eax)
   30f9d:	90                   	nop
   30f9e:	c9                   	leave  
   30f9f:	c3                   	ret    

00030fa0 <Seg2PhyAddr>:
   30fa0:	55                   	push   %ebp
   30fa1:	89 e5                	mov    %esp,%ebp
   30fa3:	83 ec 10             	sub    $0x10,%esp
   30fa6:	8b 45 08             	mov    0x8(%ebp),%eax
   30fa9:	c1 e8 03             	shr    $0x3,%eax
   30fac:	8b 14 c5 84 5e 03 00 	mov    0x35e84(,%eax,8),%edx
   30fb3:	8b 04 c5 80 5e 03 00 	mov    0x35e80(,%eax,8),%eax
   30fba:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30fbd:	89 55 f8             	mov    %edx,-0x8(%ebp)
   30fc0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
   30fc4:	0f b7 c0             	movzwl %ax,%eax
   30fc7:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
   30fcb:	0f b6 d2             	movzbl %dl,%edx
   30fce:	c1 e2 10             	shl    $0x10,%edx
   30fd1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
   30fd7:	09 d0                	or     %edx,%eax
   30fd9:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30fdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30fdf:	c9                   	leave  
   30fe0:	c3                   	ret    

00030fe1 <Seg2PhyAddrLDT>:
   30fe1:	55                   	push   %ebp
   30fe2:	89 e5                	mov    %esp,%ebp
   30fe4:	83 ec 10             	sub    $0x10,%esp
   30fe7:	8b 45 08             	mov    0x8(%ebp),%eax
   30fea:	c1 e8 03             	shr    $0x3,%eax
   30fed:	89 c2                	mov    %eax,%edx
   30fef:	8b 45 0c             	mov    0xc(%ebp),%eax
   30ff2:	83 c2 08             	add    $0x8,%edx
   30ff5:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
   30ff9:	8b 02                	mov    (%edx),%eax
   30ffb:	8b 52 04             	mov    0x4(%edx),%edx
   30ffe:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31001:	89 55 f8             	mov    %edx,-0x8(%ebp)
   31004:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
   31008:	0f b7 c0             	movzwl %ax,%eax
   3100b:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
   3100f:	0f b6 d2             	movzbl %dl,%edx
   31012:	c1 e2 10             	shl    $0x10,%edx
   31015:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
   3101b:	09 d0                	or     %edx,%eax
   3101d:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31020:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31023:	c9                   	leave  
   31024:	c3                   	ret    

00031025 <VirAddr2PhyAddr>:
   31025:	55                   	push   %ebp
   31026:	89 e5                	mov    %esp,%ebp
   31028:	83 ec 10             	sub    $0x10,%esp
   3102b:	8b 55 0c             	mov    0xc(%ebp),%edx
   3102e:	8b 45 08             	mov    0x8(%ebp),%eax
   31031:	01 d0                	add    %edx,%eax
   31033:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31036:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31039:	c9                   	leave  
   3103a:	c3                   	ret    

0003103b <kernel_main>:
   3103b:	55                   	push   %ebp
   3103c:	89 e5                	mov    %esp,%ebp
   3103e:	83 ec 28             	sub    $0x28,%esp
   31041:	c7 05 20 e4 03 00 00 	movl   $0x0,0x3e420
   31048:	00 00 00 
   3104b:	c7 05 0c dc 03 00 00 	movl   $0x0,0x3dc0c
   31052:	00 00 00 
   31055:	c7 05 74 5e 03 00 00 	movl   $0x0,0x35e74
   3105c:	00 00 00 
   3105f:	c7 45 e8 a0 b2 03 00 	movl   $0x3b2a0,-0x18(%ebp)
   31066:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   3106d:	e9 94 01 00 00       	jmp    31206 <kernel_main+0x1cb>
   31072:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   31075:	89 d0                	mov    %edx,%eax
   31077:	c1 e0 03             	shl    $0x3,%eax
   3107a:	01 d0                	add    %edx,%eax
   3107c:	c1 e0 04             	shl    $0x4,%eax
   3107f:	05 80 e4 03 00       	add    $0x3e480,%eax
   31084:	89 45 dc             	mov    %eax,-0x24(%ebp)
   31087:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
   3108b:	7f 3f                	jg     310cc <kernel_main+0x91>
   3108d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31090:	c1 e0 03             	shl    $0x3,%eax
   31093:	05 38 56 03 00       	add    $0x35638,%eax
   31098:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3109b:	c7 45 f0 02 12 00 00 	movl   $0x1202,-0x10(%ebp)
   310a2:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
   310a6:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
   310aa:	8b 45 dc             	mov    -0x24(%ebp),%eax
   310ad:	c7 40 60 0f 00 00 00 	movl   $0xf,0x60(%eax)
   310b4:	8b 45 dc             	mov    -0x24(%ebp),%eax
   310b7:	8b 50 60             	mov    0x60(%eax),%edx
   310ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
   310bd:	89 50 5c             	mov    %edx,0x5c(%eax)
   310c0:	8b 45 dc             	mov    -0x24(%ebp),%eax
   310c3:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
   310ca:	eb 46                	jmp    31112 <kernel_main+0xd7>
   310cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   310cf:	05 fe ff ff 1f       	add    $0x1ffffffe,%eax
   310d4:	c1 e0 03             	shl    $0x3,%eax
   310d7:	05 20 56 03 00       	add    $0x35620,%eax
   310dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
   310df:	c7 45 f0 02 02 00 00 	movl   $0x202,-0x10(%ebp)
   310e6:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
   310ea:	c6 45 ee 03          	movb   $0x3,-0x12(%ebp)
   310ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
   310f1:	c7 40 60 0a 00 00 00 	movl   $0xa,0x60(%eax)
   310f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
   310fb:	8b 50 60             	mov    0x60(%eax),%edx
   310fe:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31101:	89 50 5c             	mov    %edx,0x5c(%eax)
   31104:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31107:	83 e8 02             	sub    $0x2,%eax
   3110a:	89 c2                	mov    %eax,%edx
   3110c:	8b 45 dc             	mov    -0x24(%ebp),%eax
   3110f:	89 50 64             	mov    %edx,0x64(%eax)
   31112:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31115:	83 c0 09             	add    $0x9,%eax
   31118:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
   3111f:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31122:	66 89 50 44          	mov    %dx,0x44(%eax)
   31126:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   31129:	8b 45 dc             	mov    -0x24(%ebp),%eax
   3112c:	89 50 58             	mov    %edx,0x58(%eax)
   3112f:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31132:	83 c0 46             	add    $0x46,%eax
   31135:	83 ec 04             	sub    $0x4,%esp
   31138:	6a 08                	push   $0x8
   3113a:	68 88 5e 03 00       	push   $0x35e88
   3113f:	50                   	push   %eax
   31140:	e8 16 20 00 00       	call   3315b <Memcpy>
   31145:	83 c4 10             	add    $0x10,%esp
   31148:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
   3114c:	c1 e0 05             	shl    $0x5,%eax
   3114f:	83 c8 9a             	or     $0xffffff9a,%eax
   31152:	89 c2                	mov    %eax,%edx
   31154:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31157:	88 50 4b             	mov    %dl,0x4b(%eax)
   3115a:	8b 45 dc             	mov    -0x24(%ebp),%eax
   3115d:	83 c0 4e             	add    $0x4e,%eax
   31160:	83 ec 04             	sub    $0x4,%esp
   31163:	6a 08                	push   $0x8
   31165:	68 b0 5e 03 00       	push   $0x35eb0
   3116a:	50                   	push   %eax
   3116b:	e8 eb 1f 00 00       	call   3315b <Memcpy>
   31170:	83 c4 10             	add    $0x10,%esp
   31173:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
   31177:	c1 e0 05             	shl    $0x5,%eax
   3117a:	83 c8 92             	or     $0xffffff92,%eax
   3117d:	89 c2                	mov    %eax,%edx
   3117f:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31182:	88 50 53             	mov    %dl,0x53(%eax)
   31185:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
   31189:	83 c8 04             	or     $0x4,%eax
   3118c:	0f b6 c0             	movzbl %al,%eax
   3118f:	66 89 45 da          	mov    %ax,-0x26(%ebp)
   31193:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
   31197:	83 c8 0c             	or     $0xc,%eax
   3119a:	0f b6 c0             	movzbl %al,%eax
   3119d:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
   311a1:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
   311a5:	8b 45 dc             	mov    -0x24(%ebp),%eax
   311a8:	89 50 34             	mov    %edx,0x34(%eax)
   311ab:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   311af:	8b 45 dc             	mov    -0x24(%ebp),%eax
   311b2:	89 50 0c             	mov    %edx,0xc(%eax)
   311b5:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   311b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
   311bc:	89 50 04             	mov    %edx,0x4(%eax)
   311bf:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   311c3:	8b 45 dc             	mov    -0x24(%ebp),%eax
   311c6:	89 50 08             	mov    %edx,0x8(%eax)
   311c9:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   311cd:	8b 45 dc             	mov    -0x24(%ebp),%eax
   311d0:	89 50 40             	mov    %edx,0x40(%eax)
   311d3:	8b 45 dc             	mov    -0x24(%ebp),%eax
   311d6:	c7 00 39 00 00 00    	movl   $0x39,(%eax)
   311dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
   311df:	8b 00                	mov    (%eax),%eax
   311e1:	89 c2                	mov    %eax,%edx
   311e3:	8b 45 dc             	mov    -0x24(%ebp),%eax
   311e6:	89 50 30             	mov    %edx,0x30(%eax)
   311e9:	8b 55 e8             	mov    -0x18(%ebp),%edx
   311ec:	8b 45 dc             	mov    -0x24(%ebp),%eax
   311ef:	89 50 3c             	mov    %edx,0x3c(%eax)
   311f2:	81 6d e8 00 04 00 00 	subl   $0x400,-0x18(%ebp)
   311f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
   311fc:	8b 55 f0             	mov    -0x10(%ebp),%edx
   311ff:	89 50 38             	mov    %edx,0x38(%eax)
   31202:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   31206:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
   3120a:	0f 8e 62 fe ff ff    	jle    31072 <kernel_main+0x37>
   31210:	c7 05 80 62 03 00 80 	movl   $0x3e480,0x36280
   31217:	e4 03 00 
   3121a:	83 ec 04             	sub    $0x4,%esp
   3121d:	68 20 03 00 00       	push   $0x320
   31222:	6a 00                	push   $0x0
   31224:	68 ac b2 03 00       	push   $0x3b2ac
   31229:	e8 5b 1f 00 00       	call   33189 <Memset>
   3122e:	83 c4 10             	add    $0x10,%esp
   31231:	c7 05 a0 b2 03 00 ac 	movl   $0x3b2ac,0x3b2a0
   31238:	b2 03 00 
   3123b:	a1 a0 b2 03 00       	mov    0x3b2a0,%eax
   31240:	a3 a4 b2 03 00       	mov    %eax,0x3b2a4
   31245:	c7 05 a8 b2 03 00 00 	movl   $0x0,0x3b2a8
   3124c:	00 00 00 
   3124f:	c7 05 70 5e 03 00 00 	movl   $0x0,0x35e70
   31256:	00 00 00 
   31259:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   31260:	eb 14                	jmp    31276 <kernel_main+0x23b>
   31262:	83 ec 0c             	sub    $0xc,%esp
   31265:	68 28 2c 03 00       	push   $0x32c28
   3126a:	e8 14 f2 ff ff       	call   30483 <disp_str>
   3126f:	83 c4 10             	add    $0x10,%esp
   31272:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
   31276:	81 7d e0 9f 0f 00 00 	cmpl   $0xf9f,-0x20(%ebp)
   3127d:	7e e3                	jle    31262 <kernel_main+0x227>
   3127f:	c7 05 70 5e 03 00 00 	movl   $0x0,0x35e70
   31286:	00 00 00 
   31289:	e8 92 05 00 00       	call   31820 <init_keyboard_handler>
   3128e:	e8 a6 f3 ff ff       	call   30639 <restart>
   31293:	eb fe                	jmp    31293 <kernel_main+0x258>

00031295 <TestA>:
   31295:	55                   	push   %ebp
   31296:	89 e5                	mov    %esp,%ebp
   31298:	83 ec 18             	sub    $0x18,%esp
   3129b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   312a2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   312a6:	74 1c                	je     312c4 <TestA+0x2f>
   312a8:	68 18 04 00 00       	push   $0x418
   312ad:	68 5d 2f 03 00       	push   $0x32f5d
   312b2:	68 5d 2f 03 00       	push   $0x32f5d
   312b7:	68 64 2f 03 00       	push   $0x32f64
   312bc:	e8 c7 0f 00 00       	call   32288 <assertion_failure>
   312c1:	83 c4 10             	add    $0x10,%esp
   312c4:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   312c8:	77 23                	ja     312ed <TestA+0x58>
   312ca:	83 ec 0c             	sub    $0xc,%esp
   312cd:	6a 02                	push   $0x2
   312cf:	e8 b3 01 00 00       	call   31487 <milli_delay>
   312d4:	83 c4 10             	add    $0x10,%esp
   312d7:	e8 e1 17 00 00       	call   32abd <get_ticks_ipc>
   312dc:	83 ec 08             	sub    $0x8,%esp
   312df:	50                   	push   %eax
   312e0:	68 69 2f 03 00       	push   $0x32f69
   312e5:	e8 57 0c 00 00       	call   31f41 <Printf>
   312ea:	83 c4 10             	add    $0x10,%esp
   312ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   312f1:	eb d1                	jmp    312c4 <TestA+0x2f>

000312f3 <delay>:
   312f3:	55                   	push   %ebp
   312f4:	89 e5                	mov    %esp,%ebp
   312f6:	83 ec 10             	sub    $0x10,%esp
   312f9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   31300:	eb 2d                	jmp    3132f <delay+0x3c>
   31302:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   31309:	eb 1a                	jmp    31325 <delay+0x32>
   3130b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31312:	eb 04                	jmp    31318 <delay+0x25>
   31314:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31318:	81 7d f4 0f 27 00 00 	cmpl   $0x270f,-0xc(%ebp)
   3131f:	7e f3                	jle    31314 <delay+0x21>
   31321:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31325:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
   31329:	7e e0                	jle    3130b <delay+0x18>
   3132b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3132f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31332:	3b 45 08             	cmp    0x8(%ebp),%eax
   31335:	7c cb                	jl     31302 <delay+0xf>
   31337:	90                   	nop
   31338:	c9                   	leave  
   31339:	c3                   	ret    

0003133a <TestB>:
   3133a:	55                   	push   %ebp
   3133b:	89 e5                	mov    %esp,%ebp
   3133d:	83 ec 18             	sub    $0x18,%esp
   31340:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31347:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   3134b:	77 16                	ja     31363 <TestB+0x29>
   3134d:	e8 6b 17 00 00       	call   32abd <get_ticks_ipc>
   31352:	83 ec 08             	sub    $0x8,%esp
   31355:	50                   	push   %eax
   31356:	68 6c 2f 03 00       	push   $0x32f6c
   3135b:	e8 e1 0b 00 00       	call   31f41 <Printf>
   31360:	83 c4 10             	add    $0x10,%esp
   31363:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31367:	eb de                	jmp    31347 <TestB+0xd>

00031369 <TestC>:
   31369:	55                   	push   %ebp
   3136a:	89 e5                	mov    %esp,%ebp
   3136c:	83 ec 18             	sub    $0x18,%esp
   3136f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31376:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   3137a:	77 1a                	ja     31396 <TestC+0x2d>
   3137c:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
   31383:	83 ec 08             	sub    $0x8,%esp
   31386:	ff 75 f0             	pushl  -0x10(%ebp)
   31389:	68 73 2f 03 00       	push   $0x32f73
   3138e:	e8 ae 0b 00 00       	call   31f41 <Printf>
   31393:	83 c4 10             	add    $0x10,%esp
   31396:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3139a:	eb da                	jmp    31376 <TestC+0xd>

0003139c <schedule_process>:
   3139c:	55                   	push   %ebp
   3139d:	89 e5                	mov    %esp,%ebp
   3139f:	83 ec 10             	sub    $0x10,%esp
   313a2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   313a9:	eb 78                	jmp    31423 <schedule_process+0x87>
   313ab:	c7 45 fc 80 e4 03 00 	movl   $0x3e480,-0x4(%ebp)
   313b2:	eb 2e                	jmp    313e2 <schedule_process+0x46>
   313b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
   313b7:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   313bb:	84 c0                	test   %al,%al
   313bd:	75 1c                	jne    313db <schedule_process+0x3f>
   313bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
   313c2:	8b 40 5c             	mov    0x5c(%eax),%eax
   313c5:	39 45 f8             	cmp    %eax,-0x8(%ebp)
   313c8:	73 11                	jae    313db <schedule_process+0x3f>
   313ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
   313cd:	8b 40 5c             	mov    0x5c(%eax),%eax
   313d0:	89 45 f8             	mov    %eax,-0x8(%ebp)
   313d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
   313d6:	a3 80 62 03 00       	mov    %eax,0x36280
   313db:	81 45 fc 90 00 00 00 	addl   $0x90,-0x4(%ebp)
   313e2:	b8 50 e7 03 00       	mov    $0x3e750,%eax
   313e7:	39 45 fc             	cmp    %eax,-0x4(%ebp)
   313ea:	72 c8                	jb     313b4 <schedule_process+0x18>
   313ec:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
   313f0:	75 31                	jne    31423 <schedule_process+0x87>
   313f2:	c7 45 fc 80 e4 03 00 	movl   $0x3e480,-0x4(%ebp)
   313f9:	eb 1e                	jmp    31419 <schedule_process+0x7d>
   313fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
   313fe:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   31402:	84 c0                	test   %al,%al
   31404:	75 0c                	jne    31412 <schedule_process+0x76>
   31406:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31409:	8b 50 60             	mov    0x60(%eax),%edx
   3140c:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3140f:	89 50 5c             	mov    %edx,0x5c(%eax)
   31412:	81 45 fc 90 00 00 00 	addl   $0x90,-0x4(%ebp)
   31419:	b8 50 e7 03 00       	mov    $0x3e750,%eax
   3141e:	39 45 fc             	cmp    %eax,-0x4(%ebp)
   31421:	72 d8                	jb     313fb <schedule_process+0x5f>
   31423:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
   31427:	74 82                	je     313ab <schedule_process+0xf>
   31429:	90                   	nop
   3142a:	c9                   	leave  
   3142b:	c3                   	ret    

0003142c <sys_get_ticks>:
   3142c:	55                   	push   %ebp
   3142d:	89 e5                	mov    %esp,%ebp
   3142f:	a1 20 e4 03 00       	mov    0x3e420,%eax
   31434:	5d                   	pop    %ebp
   31435:	c3                   	ret    

00031436 <sys_write>:
   31436:	55                   	push   %ebp
   31437:	89 e5                	mov    %esp,%ebp
   31439:	83 ec 18             	sub    $0x18,%esp
   3143c:	8b 45 10             	mov    0x10(%ebp),%eax
   3143f:	8b 40 64             	mov    0x64(%eax),%eax
   31442:	69 c0 90 0c 00 00    	imul   $0xc90,%eax,%eax
   31448:	05 e0 b5 03 00       	add    $0x3b5e0,%eax
   3144d:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31450:	8b 45 0c             	mov    0xc(%ebp),%eax
   31453:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31456:	8b 45 08             	mov    0x8(%ebp),%eax
   31459:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3145c:	eb 20                	jmp    3147e <sys_write+0x48>
   3145e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31461:	0f b6 00             	movzbl (%eax),%eax
   31464:	0f b6 c0             	movzbl %al,%eax
   31467:	83 ec 08             	sub    $0x8,%esp
   3146a:	50                   	push   %eax
   3146b:	ff 75 ec             	pushl  -0x14(%ebp)
   3146e:	e8 86 07 00 00       	call   31bf9 <out_char>
   31473:	83 c4 10             	add    $0x10,%esp
   31476:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   3147a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
   3147e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31482:	7f da                	jg     3145e <sys_write+0x28>
   31484:	90                   	nop
   31485:	c9                   	leave  
   31486:	c3                   	ret    

00031487 <milli_delay>:
   31487:	55                   	push   %ebp
   31488:	89 e5                	mov    %esp,%ebp
   3148a:	83 ec 18             	sub    $0x18,%esp
   3148d:	e8 2b 16 00 00       	call   32abd <get_ticks_ipc>
   31492:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31495:	90                   	nop
   31496:	e8 22 16 00 00       	call   32abd <get_ticks_ipc>
   3149b:	2b 45 f4             	sub    -0xc(%ebp),%eax
   3149e:	89 c1                	mov    %eax,%ecx
   314a0:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
   314a5:	89 c8                	mov    %ecx,%eax
   314a7:	f7 ea                	imul   %edx
   314a9:	c1 fa 05             	sar    $0x5,%edx
   314ac:	89 c8                	mov    %ecx,%eax
   314ae:	c1 f8 1f             	sar    $0x1f,%eax
   314b1:	29 c2                	sub    %eax,%edx
   314b3:	89 d0                	mov    %edx,%eax
   314b5:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
   314bb:	39 45 08             	cmp    %eax,0x8(%ebp)
   314be:	77 d6                	ja     31496 <milli_delay+0xf>
   314c0:	90                   	nop
   314c1:	c9                   	leave  
   314c2:	c3                   	ret    

000314c3 <clock_handler>:
   314c3:	55                   	push   %ebp
   314c4:	89 e5                	mov    %esp,%ebp
   314c6:	a1 80 62 03 00       	mov    0x36280,%eax
   314cb:	8b 40 5c             	mov    0x5c(%eax),%eax
   314ce:	85 c0                	test   %eax,%eax
   314d0:	74 0e                	je     314e0 <clock_handler+0x1d>
   314d2:	a1 80 62 03 00       	mov    0x36280,%eax
   314d7:	8b 50 5c             	mov    0x5c(%eax),%edx
   314da:	83 ea 01             	sub    $0x1,%edx
   314dd:	89 50 5c             	mov    %edx,0x5c(%eax)
   314e0:	a1 20 e4 03 00       	mov    0x3e420,%eax
   314e5:	83 c0 01             	add    $0x1,%eax
   314e8:	a3 20 e4 03 00       	mov    %eax,0x3e420
   314ed:	a1 74 5e 03 00       	mov    0x35e74,%eax
   314f2:	85 c0                	test   %eax,%eax
   314f4:	75 13                	jne    31509 <clock_handler+0x46>
   314f6:	a1 80 62 03 00       	mov    0x36280,%eax
   314fb:	8b 40 5c             	mov    0x5c(%eax),%eax
   314fe:	85 c0                	test   %eax,%eax
   31500:	75 0a                	jne    3150c <clock_handler+0x49>
   31502:	e8 95 fe ff ff       	call   3139c <schedule_process>
   31507:	eb 04                	jmp    3150d <clock_handler+0x4a>
   31509:	90                   	nop
   3150a:	eb 01                	jmp    3150d <clock_handler+0x4a>
   3150c:	90                   	nop
   3150d:	5d                   	pop    %ebp
   3150e:	c3                   	ret    

0003150f <keyboard_handler>:
   3150f:	55                   	push   %ebp
   31510:	89 e5                	mov    %esp,%ebp
   31512:	83 ec 18             	sub    $0x18,%esp
   31515:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
   3151c:	a1 a8 b2 03 00       	mov    0x3b2a8,%eax
   31521:	3d 1f 03 00 00       	cmp    $0x31f,%eax
   31526:	7f 5c                	jg     31584 <keyboard_handler+0x75>
   31528:	e8 7e f1 ff ff       	call   306ab <disable_int>
   3152d:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31530:	0f b7 c0             	movzwl %ax,%eax
   31533:	83 ec 0c             	sub    $0xc,%esp
   31536:	50                   	push   %eax
   31537:	e8 41 f1 ff ff       	call   3067d <in_byte>
   3153c:	83 c4 10             	add    $0x10,%esp
   3153f:	88 45 f3             	mov    %al,-0xd(%ebp)
   31542:	a1 a0 b2 03 00       	mov    0x3b2a0,%eax
   31547:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
   3154b:	88 10                	mov    %dl,(%eax)
   3154d:	a1 a0 b2 03 00       	mov    0x3b2a0,%eax
   31552:	83 c0 01             	add    $0x1,%eax
   31555:	a3 a0 b2 03 00       	mov    %eax,0x3b2a0
   3155a:	a1 a8 b2 03 00       	mov    0x3b2a8,%eax
   3155f:	83 c0 01             	add    $0x1,%eax
   31562:	a3 a8 b2 03 00       	mov    %eax,0x3b2a8
   31567:	a1 a0 b2 03 00       	mov    0x3b2a0,%eax
   3156c:	ba cc b5 03 00       	mov    $0x3b5cc,%edx
   31571:	39 d0                	cmp    %edx,%eax
   31573:	72 0a                	jb     3157f <keyboard_handler+0x70>
   31575:	c7 05 a0 b2 03 00 ac 	movl   $0x3b2ac,0x3b2a0
   3157c:	b2 03 00 
   3157f:	e8 29 f1 ff ff       	call   306ad <enable_int>
   31584:	90                   	nop
   31585:	c9                   	leave  
   31586:	c3                   	ret    

00031587 <read_from_keyboard_buf>:
   31587:	55                   	push   %ebp
   31588:	89 e5                	mov    %esp,%ebp
   3158a:	83 ec 18             	sub    $0x18,%esp
   3158d:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
   31591:	a1 a8 b2 03 00       	mov    0x3b2a8,%eax
   31596:	85 c0                	test   %eax,%eax
   31598:	7e 47                	jle    315e1 <read_from_keyboard_buf+0x5a>
   3159a:	e8 0c f1 ff ff       	call   306ab <disable_int>
   3159f:	a1 a4 b2 03 00       	mov    0x3b2a4,%eax
   315a4:	0f b6 00             	movzbl (%eax),%eax
   315a7:	88 45 f7             	mov    %al,-0x9(%ebp)
   315aa:	a1 a4 b2 03 00       	mov    0x3b2a4,%eax
   315af:	83 c0 01             	add    $0x1,%eax
   315b2:	a3 a4 b2 03 00       	mov    %eax,0x3b2a4
   315b7:	a1 a8 b2 03 00       	mov    0x3b2a8,%eax
   315bc:	83 e8 01             	sub    $0x1,%eax
   315bf:	a3 a8 b2 03 00       	mov    %eax,0x3b2a8
   315c4:	a1 a4 b2 03 00       	mov    0x3b2a4,%eax
   315c9:	ba cc b5 03 00       	mov    $0x3b5cc,%edx
   315ce:	39 d0                	cmp    %edx,%eax
   315d0:	72 0a                	jb     315dc <read_from_keyboard_buf+0x55>
   315d2:	c7 05 a4 b2 03 00 ac 	movl   $0x3b2ac,0x3b2a4
   315d9:	b2 03 00 
   315dc:	e8 cc f0 ff ff       	call   306ad <enable_int>
   315e1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   315e5:	c9                   	leave  
   315e6:	c3                   	ret    

000315e7 <keyboard_read>:
   315e7:	55                   	push   %ebp
   315e8:	89 e5                	mov    %esp,%ebp
   315ea:	83 ec 28             	sub    $0x28,%esp
   315ed:	90                   	nop
   315ee:	a1 a8 b2 03 00       	mov    0x3b2a8,%eax
   315f3:	85 c0                	test   %eax,%eax
   315f5:	7e f7                	jle    315ee <keyboard_read+0x7>
   315f7:	e8 8b ff ff ff       	call   31587 <read_from_keyboard_buf>
   315fc:	88 45 ea             	mov    %al,-0x16(%ebp)
   315ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31606:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
   3160a:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
   3160e:	75 5a                	jne    3166a <keyboard_read+0x83>
   31610:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
   31614:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
   31618:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
   3161c:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
   31620:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
   31624:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
   31628:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
   3162c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
   31633:	eb 20                	jmp    31655 <keyboard_read+0x6e>
   31635:	e8 4d ff ff ff       	call   31587 <read_from_keyboard_buf>
   3163a:	89 c1                	mov    %eax,%ecx
   3163c:	8d 55 e3             	lea    -0x1d(%ebp),%edx
   3163f:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31642:	01 d0                	add    %edx,%eax
   31644:	0f b6 00             	movzbl (%eax),%eax
   31647:	38 c1                	cmp    %al,%cl
   31649:	74 06                	je     31651 <keyboard_read+0x6a>
   3164b:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
   3164f:	eb 0a                	jmp    3165b <keyboard_read+0x74>
   31651:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   31655:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
   31659:	7e da                	jle    31635 <keyboard_read+0x4e>
   3165b:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
   3165f:	74 68                	je     316c9 <keyboard_read+0xe2>
   31661:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
   31668:	eb 5f                	jmp    316c9 <keyboard_read+0xe2>
   3166a:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
   3166e:	75 59                	jne    316c9 <keyboard_read+0xe2>
   31670:	e8 12 ff ff ff       	call   31587 <read_from_keyboard_buf>
   31675:	3c 2a                	cmp    $0x2a,%al
   31677:	75 1d                	jne    31696 <keyboard_read+0xaf>
   31679:	e8 09 ff ff ff       	call   31587 <read_from_keyboard_buf>
   3167e:	3c e0                	cmp    $0xe0,%al
   31680:	75 14                	jne    31696 <keyboard_read+0xaf>
   31682:	e8 00 ff ff ff       	call   31587 <read_from_keyboard_buf>
   31687:	3c 37                	cmp    $0x37,%al
   31689:	75 0b                	jne    31696 <keyboard_read+0xaf>
   3168b:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
   31692:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
   31696:	e8 ec fe ff ff       	call   31587 <read_from_keyboard_buf>
   3169b:	3c b7                	cmp    $0xb7,%al
   3169d:	75 1d                	jne    316bc <keyboard_read+0xd5>
   3169f:	e8 e3 fe ff ff       	call   31587 <read_from_keyboard_buf>
   316a4:	3c e0                	cmp    $0xe0,%al
   316a6:	75 14                	jne    316bc <keyboard_read+0xd5>
   316a8:	e8 da fe ff ff       	call   31587 <read_from_keyboard_buf>
   316ad:	3c aa                	cmp    $0xaa,%al
   316af:	75 0b                	jne    316bc <keyboard_read+0xd5>
   316b1:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
   316b8:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
   316bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   316c0:	75 07                	jne    316c9 <keyboard_read+0xe2>
   316c2:	c6 05 64 5e 03 00 01 	movb   $0x1,0x35e64
   316c9:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
   316d0:	0f 84 8d 00 00 00    	je     31763 <keyboard_read+0x17c>
   316d6:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
   316dd:	0f 84 80 00 00 00    	je     31763 <keyboard_read+0x17c>
   316e3:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
   316e7:	0f 94 c2             	sete   %dl
   316ea:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
   316ee:	0f 94 c0             	sete   %al
   316f1:	09 d0                	or     %edx,%eax
   316f3:	84 c0                	test   %al,%al
   316f5:	74 07                	je     316fe <keyboard_read+0x117>
   316f7:	c6 05 10 dc 03 00 01 	movb   $0x1,0x3dc10
   316fe:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
   31702:	f7 d0                	not    %eax
   31704:	c0 e8 07             	shr    $0x7,%al
   31707:	88 45 e9             	mov    %al,-0x17(%ebp)
   3170a:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
   3170e:	74 53                	je     31763 <keyboard_read+0x17c>
   31710:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
   31714:	74 4d                	je     31763 <keyboard_read+0x17c>
   31716:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
   3171a:	0f b6 05 10 dc 03 00 	movzbl 0x3dc10,%eax
   31721:	3c 01                	cmp    $0x1,%al
   31723:	75 04                	jne    31729 <keyboard_read+0x142>
   31725:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
   31729:	0f b6 05 64 5e 03 00 	movzbl 0x35e64,%eax
   31730:	84 c0                	test   %al,%al
   31732:	74 04                	je     31738 <keyboard_read+0x151>
   31734:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
   31738:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
   3173c:	89 d0                	mov    %edx,%eax
   3173e:	01 c0                	add    %eax,%eax
   31740:	01 c2                	add    %eax,%edx
   31742:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
   31746:	01 d0                	add    %edx,%eax
   31748:	8b 04 85 20 50 03 00 	mov    0x35020(,%eax,4),%eax
   3174f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31752:	83 ec 08             	sub    $0x8,%esp
   31755:	ff 75 f4             	pushl  -0xc(%ebp)
   31758:	ff 75 08             	pushl  0x8(%ebp)
   3175b:	e8 d4 00 00 00       	call   31834 <in_process>
   31760:	83 c4 10             	add    $0x10,%esp
   31763:	90                   	nop
   31764:	c9                   	leave  
   31765:	c3                   	ret    

00031766 <TaskTTY>:
   31766:	55                   	push   %ebp
   31767:	89 e5                	mov    %esp,%ebp
   31769:	83 ec 18             	sub    $0x18,%esp
   3176c:	e8 36 07 00 00       	call   31ea7 <init_tty>
   31771:	83 ec 0c             	sub    $0xc,%esp
   31774:	6a 00                	push   $0x0
   31776:	e8 4b 02 00 00       	call   319c6 <select_console>
   3177b:	83 c4 10             	add    $0x10,%esp
   3177e:	c7 45 f4 e0 b5 03 00 	movl   $0x3b5e0,-0xc(%ebp)
   31785:	eb 23                	jmp    317aa <TaskTTY+0x44>
   31787:	83 ec 0c             	sub    $0xc,%esp
   3178a:	ff 75 f4             	pushl  -0xc(%ebp)
   3178d:	e8 db 05 00 00       	call   31d6d <tty_do_read>
   31792:	83 c4 10             	add    $0x10,%esp
   31795:	83 ec 0c             	sub    $0xc,%esp
   31798:	ff 75 f4             	pushl  -0xc(%ebp)
   3179b:	e8 f7 05 00 00       	call   31d97 <tty_do_write>
   317a0:	83 c4 10             	add    $0x10,%esp
   317a3:	81 45 f4 90 0c 00 00 	addl   $0xc90,-0xc(%ebp)
   317aa:	b8 90 db 03 00       	mov    $0x3db90,%eax
   317af:	39 45 f4             	cmp    %eax,-0xc(%ebp)
   317b2:	72 d3                	jb     31787 <TaskTTY+0x21>
   317b4:	eb c8                	jmp    3177e <TaskTTY+0x18>

000317b6 <TaskSys>:
   317b6:	55                   	push   %ebp
   317b7:	89 e5                	mov    %esp,%ebp
   317b9:	83 ec 28             	sub    $0x28,%esp
   317bc:	83 ec 04             	sub    $0x4,%esp
   317bf:	6a 0c                	push   $0xc
   317c1:	6a 00                	push   $0x0
   317c3:	8d 45 e0             	lea    -0x20(%ebp),%eax
   317c6:	50                   	push   %eax
   317c7:	e8 bd 19 00 00       	call   33189 <Memset>
   317cc:	83 c4 10             	add    $0x10,%esp
   317cf:	83 ec 08             	sub    $0x8,%esp
   317d2:	6a 0f                	push   $0xf
   317d4:	8d 45 e0             	lea    -0x20(%ebp),%eax
   317d7:	50                   	push   %eax
   317d8:	e8 1b 14 00 00       	call   32bf8 <receive_msg>
   317dd:	83 c4 10             	add    $0x10,%esp
   317e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
   317e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   317e7:	75 34                	jne    3181d <TaskSys+0x67>
   317e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   317ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
   317ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
   317f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
   317f5:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
   317f9:	75 1f                	jne    3181a <TaskSys+0x64>
   317fb:	a1 20 e4 03 00       	mov    0x3e420,%eax
   31800:	89 45 e8             	mov    %eax,-0x18(%ebp)
   31803:	83 ec 08             	sub    $0x8,%esp
   31806:	ff 75 ec             	pushl  -0x14(%ebp)
   31809:	8d 45 e0             	lea    -0x20(%ebp),%eax
   3180c:	50                   	push   %eax
   3180d:	e8 d6 13 00 00       	call   32be8 <send_msg>
   31812:	83 c4 10             	add    $0x10,%esp
   31815:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31818:	eb 01                	jmp    3181b <TaskSys+0x65>
   3181a:	90                   	nop
   3181b:	eb 9f                	jmp    317bc <TaskSys+0x6>
   3181d:	90                   	nop
   3181e:	c9                   	leave  
   3181f:	c3                   	ret    

00031820 <init_keyboard_handler>:
   31820:	55                   	push   %ebp
   31821:	89 e5                	mov    %esp,%ebp
   31823:	c6 05 64 5e 03 00 00 	movb   $0x0,0x35e64
   3182a:	c6 05 10 dc 03 00 00 	movb   $0x0,0x3dc10
   31831:	90                   	nop
   31832:	5d                   	pop    %ebp
   31833:	c3                   	ret    

00031834 <in_process>:
   31834:	55                   	push   %ebp
   31835:	89 e5                	mov    %esp,%ebp
   31837:	83 ec 18             	sub    $0x18,%esp
   3183a:	83 ec 04             	sub    $0x4,%esp
   3183d:	6a 02                	push   $0x2
   3183f:	6a 00                	push   $0x0
   31841:	8d 45 f6             	lea    -0xa(%ebp),%eax
   31844:	50                   	push   %eax
   31845:	e8 3f 19 00 00       	call   33189 <Memset>
   3184a:	83 c4 10             	add    $0x10,%esp
   3184d:	8b 45 0c             	mov    0xc(%ebp),%eax
   31850:	25 00 01 00 00       	and    $0x100,%eax
   31855:	85 c0                	test   %eax,%eax
   31857:	75 28                	jne    31881 <in_process+0x4d>
   31859:	8b 45 0c             	mov    0xc(%ebp),%eax
   3185c:	0f b6 c0             	movzbl %al,%eax
   3185f:	83 ec 08             	sub    $0x8,%esp
   31862:	50                   	push   %eax
   31863:	ff 75 08             	pushl  0x8(%ebp)
   31866:	e8 8c 02 00 00       	call   31af7 <put_key>
   3186b:	83 c4 10             	add    $0x10,%esp
   3186e:	c6 05 64 5e 03 00 00 	movb   $0x0,0x35e64
   31875:	c6 05 10 dc 03 00 00 	movb   $0x0,0x3dc10
   3187c:	e9 42 01 00 00       	jmp    319c3 <in_process+0x18f>
   31881:	0f b6 05 10 dc 03 00 	movzbl 0x3dc10,%eax
   31888:	84 c0                	test   %al,%al
   3188a:	0f 84 a9 00 00 00    	je     31939 <in_process+0x105>
   31890:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
   31894:	0f 84 9f 00 00 00    	je     31939 <in_process+0x105>
   3189a:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
   3189e:	0f 84 95 00 00 00    	je     31939 <in_process+0x105>
   318a4:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   318ab:	74 64                	je     31911 <in_process+0xdd>
   318ad:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   318b4:	77 0b                	ja     318c1 <in_process+0x8d>
   318b6:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
   318bd:	74 64                	je     31923 <in_process+0xef>
   318bf:	eb 73                	jmp    31934 <in_process+0x100>
   318c1:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
   318c8:	74 0b                	je     318d5 <in_process+0xa1>
   318ca:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
   318d1:	74 20                	je     318f3 <in_process+0xbf>
   318d3:	eb 5f                	jmp    31934 <in_process+0x100>
   318d5:	83 ec 0c             	sub    $0xc,%esp
   318d8:	ff 75 08             	pushl  0x8(%ebp)
   318db:	e8 83 02 00 00       	call   31b63 <scroll_up>
   318e0:	83 c4 10             	add    $0x10,%esp
   318e3:	c6 05 10 dc 03 00 00 	movb   $0x0,0x3dc10
   318ea:	c6 05 64 5e 03 00 00 	movb   $0x0,0x35e64
   318f1:	eb 41                	jmp    31934 <in_process+0x100>
   318f3:	83 ec 0c             	sub    $0xc,%esp
   318f6:	ff 75 08             	pushl  0x8(%ebp)
   318f9:	e8 a6 02 00 00       	call   31ba4 <scroll_down>
   318fe:	83 c4 10             	add    $0x10,%esp
   31901:	c6 05 10 dc 03 00 00 	movb   $0x0,0x3dc10
   31908:	c6 05 64 5e 03 00 00 	movb   $0x0,0x35e64
   3190f:	eb 23                	jmp    31934 <in_process+0x100>
   31911:	83 ec 08             	sub    $0x8,%esp
   31914:	6a 0a                	push   $0xa
   31916:	ff 75 08             	pushl  0x8(%ebp)
   31919:	e8 db 02 00 00       	call   31bf9 <out_char>
   3191e:	83 c4 10             	add    $0x10,%esp
   31921:	eb 11                	jmp    31934 <in_process+0x100>
   31923:	83 ec 08             	sub    $0x8,%esp
   31926:	6a 08                	push   $0x8
   31928:	ff 75 08             	pushl  0x8(%ebp)
   3192b:	e8 c9 02 00 00       	call   31bf9 <out_char>
   31930:	83 c4 10             	add    $0x10,%esp
   31933:	90                   	nop
   31934:	e9 8a 00 00 00       	jmp    319c3 <in_process+0x18f>
   31939:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
   31940:	74 55                	je     31997 <in_process+0x163>
   31942:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
   31949:	77 14                	ja     3195f <in_process+0x12b>
   3194b:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
   31952:	74 31                	je     31985 <in_process+0x151>
   31954:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   3195b:	74 16                	je     31973 <in_process+0x13f>
   3195d:	eb 64                	jmp    319c3 <in_process+0x18f>
   3195f:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
   31966:	74 3e                	je     319a6 <in_process+0x172>
   31968:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
   3196f:	74 44                	je     319b5 <in_process+0x181>
   31971:	eb 50                	jmp    319c3 <in_process+0x18f>
   31973:	83 ec 08             	sub    $0x8,%esp
   31976:	6a 0a                	push   $0xa
   31978:	ff 75 08             	pushl  0x8(%ebp)
   3197b:	e8 77 01 00 00       	call   31af7 <put_key>
   31980:	83 c4 10             	add    $0x10,%esp
   31983:	eb 3e                	jmp    319c3 <in_process+0x18f>
   31985:	83 ec 08             	sub    $0x8,%esp
   31988:	6a 08                	push   $0x8
   3198a:	ff 75 08             	pushl  0x8(%ebp)
   3198d:	e8 65 01 00 00       	call   31af7 <put_key>
   31992:	83 c4 10             	add    $0x10,%esp
   31995:	eb 2c                	jmp    319c3 <in_process+0x18f>
   31997:	83 ec 0c             	sub    $0xc,%esp
   3199a:	6a 00                	push   $0x0
   3199c:	e8 25 00 00 00       	call   319c6 <select_console>
   319a1:	83 c4 10             	add    $0x10,%esp
   319a4:	eb 1d                	jmp    319c3 <in_process+0x18f>
   319a6:	83 ec 0c             	sub    $0xc,%esp
   319a9:	6a 01                	push   $0x1
   319ab:	e8 16 00 00 00       	call   319c6 <select_console>
   319b0:	83 c4 10             	add    $0x10,%esp
   319b3:	eb 0e                	jmp    319c3 <in_process+0x18f>
   319b5:	83 ec 0c             	sub    $0xc,%esp
   319b8:	6a 02                	push   $0x2
   319ba:	e8 07 00 00 00       	call   319c6 <select_console>
   319bf:	83 c4 10             	add    $0x10,%esp
   319c2:	90                   	nop
   319c3:	90                   	nop
   319c4:	c9                   	leave  
   319c5:	c3                   	ret    

000319c6 <select_console>:
   319c6:	55                   	push   %ebp
   319c7:	89 e5                	mov    %esp,%ebp
   319c9:	83 ec 18             	sub    $0x18,%esp
   319cc:	8b 45 08             	mov    0x8(%ebp),%eax
   319cf:	88 45 f4             	mov    %al,-0xc(%ebp)
   319d2:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
   319d6:	77 27                	ja     319ff <select_console+0x39>
   319d8:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
   319dc:	69 c0 90 0c 00 00    	imul   $0xc90,%eax,%eax
   319e2:	05 e0 b5 03 00       	add    $0x3b5e0,%eax
   319e7:	a3 60 5e 03 00       	mov    %eax,0x35e60
   319ec:	a1 60 5e 03 00       	mov    0x35e60,%eax
   319f1:	83 ec 0c             	sub    $0xc,%esp
   319f4:	50                   	push   %eax
   319f5:	e8 08 00 00 00       	call   31a02 <flush>
   319fa:	83 c4 10             	add    $0x10,%esp
   319fd:	eb 01                	jmp    31a00 <select_console+0x3a>
   319ff:	90                   	nop
   31a00:	c9                   	leave  
   31a01:	c3                   	ret    

00031a02 <flush>:
   31a02:	55                   	push   %ebp
   31a03:	89 e5                	mov    %esp,%ebp
   31a05:	83 ec 08             	sub    $0x8,%esp
   31a08:	8b 45 08             	mov    0x8(%ebp),%eax
   31a0b:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31a11:	8b 40 0c             	mov    0xc(%eax),%eax
   31a14:	83 ec 0c             	sub    $0xc,%esp
   31a17:	50                   	push   %eax
   31a18:	e8 1e 00 00 00       	call   31a3b <set_cursor>
   31a1d:	83 c4 10             	add    $0x10,%esp
   31a20:	8b 45 08             	mov    0x8(%ebp),%eax
   31a23:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31a29:	8b 40 08             	mov    0x8(%eax),%eax
   31a2c:	83 ec 0c             	sub    $0xc,%esp
   31a2f:	50                   	push   %eax
   31a30:	e8 64 00 00 00       	call   31a99 <set_console_start_video_addr>
   31a35:	83 c4 10             	add    $0x10,%esp
   31a38:	90                   	nop
   31a39:	c9                   	leave  
   31a3a:	c3                   	ret    

00031a3b <set_cursor>:
   31a3b:	55                   	push   %ebp
   31a3c:	89 e5                	mov    %esp,%ebp
   31a3e:	83 ec 08             	sub    $0x8,%esp
   31a41:	83 ec 08             	sub    $0x8,%esp
   31a44:	6a 0e                	push   $0xe
   31a46:	68 d4 03 00 00       	push   $0x3d4
   31a4b:	e8 39 ec ff ff       	call   30689 <out_byte>
   31a50:	83 c4 10             	add    $0x10,%esp
   31a53:	8b 45 08             	mov    0x8(%ebp),%eax
   31a56:	c1 e8 08             	shr    $0x8,%eax
   31a59:	0f b7 c0             	movzwl %ax,%eax
   31a5c:	83 ec 08             	sub    $0x8,%esp
   31a5f:	50                   	push   %eax
   31a60:	68 d5 03 00 00       	push   $0x3d5
   31a65:	e8 1f ec ff ff       	call   30689 <out_byte>
   31a6a:	83 c4 10             	add    $0x10,%esp
   31a6d:	83 ec 08             	sub    $0x8,%esp
   31a70:	6a 0f                	push   $0xf
   31a72:	68 d4 03 00 00       	push   $0x3d4
   31a77:	e8 0d ec ff ff       	call   30689 <out_byte>
   31a7c:	83 c4 10             	add    $0x10,%esp
   31a7f:	8b 45 08             	mov    0x8(%ebp),%eax
   31a82:	0f b7 c0             	movzwl %ax,%eax
   31a85:	83 ec 08             	sub    $0x8,%esp
   31a88:	50                   	push   %eax
   31a89:	68 d5 03 00 00       	push   $0x3d5
   31a8e:	e8 f6 eb ff ff       	call   30689 <out_byte>
   31a93:	83 c4 10             	add    $0x10,%esp
   31a96:	90                   	nop
   31a97:	c9                   	leave  
   31a98:	c3                   	ret    

00031a99 <set_console_start_video_addr>:
   31a99:	55                   	push   %ebp
   31a9a:	89 e5                	mov    %esp,%ebp
   31a9c:	83 ec 08             	sub    $0x8,%esp
   31a9f:	83 ec 08             	sub    $0x8,%esp
   31aa2:	6a 0c                	push   $0xc
   31aa4:	68 d4 03 00 00       	push   $0x3d4
   31aa9:	e8 db eb ff ff       	call   30689 <out_byte>
   31aae:	83 c4 10             	add    $0x10,%esp
   31ab1:	8b 45 08             	mov    0x8(%ebp),%eax
   31ab4:	c1 e8 08             	shr    $0x8,%eax
   31ab7:	0f b7 c0             	movzwl %ax,%eax
   31aba:	83 ec 08             	sub    $0x8,%esp
   31abd:	50                   	push   %eax
   31abe:	68 d5 03 00 00       	push   $0x3d5
   31ac3:	e8 c1 eb ff ff       	call   30689 <out_byte>
   31ac8:	83 c4 10             	add    $0x10,%esp
   31acb:	83 ec 08             	sub    $0x8,%esp
   31ace:	6a 0d                	push   $0xd
   31ad0:	68 d4 03 00 00       	push   $0x3d4
   31ad5:	e8 af eb ff ff       	call   30689 <out_byte>
   31ada:	83 c4 10             	add    $0x10,%esp
   31add:	8b 45 08             	mov    0x8(%ebp),%eax
   31ae0:	0f b7 c0             	movzwl %ax,%eax
   31ae3:	83 ec 08             	sub    $0x8,%esp
   31ae6:	50                   	push   %eax
   31ae7:	68 d5 03 00 00       	push   $0x3d5
   31aec:	e8 98 eb ff ff       	call   30689 <out_byte>
   31af1:	83 c4 10             	add    $0x10,%esp
   31af4:	90                   	nop
   31af5:	c9                   	leave  
   31af6:	c3                   	ret    

00031af7 <put_key>:
   31af7:	55                   	push   %ebp
   31af8:	89 e5                	mov    %esp,%ebp
   31afa:	83 ec 04             	sub    $0x4,%esp
   31afd:	8b 45 0c             	mov    0xc(%ebp),%eax
   31b00:	88 45 fc             	mov    %al,-0x4(%ebp)
   31b03:	8b 45 08             	mov    0x8(%ebp),%eax
   31b06:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   31b0c:	3d 1f 03 00 00       	cmp    $0x31f,%eax
   31b11:	77 4d                	ja     31b60 <put_key+0x69>
   31b13:	8b 45 08             	mov    0x8(%ebp),%eax
   31b16:	8b 00                	mov    (%eax),%eax
   31b18:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
   31b1c:	89 10                	mov    %edx,(%eax)
   31b1e:	8b 45 08             	mov    0x8(%ebp),%eax
   31b21:	8b 00                	mov    (%eax),%eax
   31b23:	8d 50 04             	lea    0x4(%eax),%edx
   31b26:	8b 45 08             	mov    0x8(%ebp),%eax
   31b29:	89 10                	mov    %edx,(%eax)
   31b2b:	8b 45 08             	mov    0x8(%ebp),%eax
   31b2e:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   31b34:	8d 50 01             	lea    0x1(%eax),%edx
   31b37:	8b 45 08             	mov    0x8(%ebp),%eax
   31b3a:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
   31b40:	8b 45 08             	mov    0x8(%ebp),%eax
   31b43:	8b 00                	mov    (%eax),%eax
   31b45:	8b 55 08             	mov    0x8(%ebp),%edx
   31b48:	83 c2 08             	add    $0x8,%edx
   31b4b:	81 c2 80 0c 00 00    	add    $0xc80,%edx
   31b51:	39 d0                	cmp    %edx,%eax
   31b53:	75 0b                	jne    31b60 <put_key+0x69>
   31b55:	8b 45 08             	mov    0x8(%ebp),%eax
   31b58:	8d 50 08             	lea    0x8(%eax),%edx
   31b5b:	8b 45 08             	mov    0x8(%ebp),%eax
   31b5e:	89 10                	mov    %edx,(%eax)
   31b60:	90                   	nop
   31b61:	c9                   	leave  
   31b62:	c3                   	ret    

00031b63 <scroll_up>:
   31b63:	55                   	push   %ebp
   31b64:	89 e5                	mov    %esp,%ebp
   31b66:	83 ec 08             	sub    $0x8,%esp
   31b69:	8b 45 08             	mov    0x8(%ebp),%eax
   31b6c:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31b72:	8b 50 08             	mov    0x8(%eax),%edx
   31b75:	8b 45 08             	mov    0x8(%ebp),%eax
   31b78:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31b7e:	8b 00                	mov    (%eax),%eax
   31b80:	39 c2                	cmp    %eax,%edx
   31b82:	76 1d                	jbe    31ba1 <scroll_up+0x3e>
   31b84:	8b 45 08             	mov    0x8(%ebp),%eax
   31b87:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31b8d:	8b 40 08             	mov    0x8(%eax),%eax
   31b90:	2d d0 07 00 00       	sub    $0x7d0,%eax
   31b95:	83 ec 0c             	sub    $0xc,%esp
   31b98:	50                   	push   %eax
   31b99:	e8 fb fe ff ff       	call   31a99 <set_console_start_video_addr>
   31b9e:	83 c4 10             	add    $0x10,%esp
   31ba1:	90                   	nop
   31ba2:	c9                   	leave  
   31ba3:	c3                   	ret    

00031ba4 <scroll_down>:
   31ba4:	55                   	push   %ebp
   31ba5:	89 e5                	mov    %esp,%ebp
   31ba7:	83 ec 08             	sub    $0x8,%esp
   31baa:	8b 45 08             	mov    0x8(%ebp),%eax
   31bad:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31bb3:	8b 40 08             	mov    0x8(%eax),%eax
   31bb6:	8d 88 a0 0f 00 00    	lea    0xfa0(%eax),%ecx
   31bbc:	8b 45 08             	mov    0x8(%ebp),%eax
   31bbf:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31bc5:	8b 10                	mov    (%eax),%edx
   31bc7:	8b 45 08             	mov    0x8(%ebp),%eax
   31bca:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31bd0:	8b 40 04             	mov    0x4(%eax),%eax
   31bd3:	01 d0                	add    %edx,%eax
   31bd5:	39 c1                	cmp    %eax,%ecx
   31bd7:	73 1d                	jae    31bf6 <scroll_down+0x52>
   31bd9:	8b 45 08             	mov    0x8(%ebp),%eax
   31bdc:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31be2:	8b 40 08             	mov    0x8(%eax),%eax
   31be5:	05 d0 07 00 00       	add    $0x7d0,%eax
   31bea:	83 ec 0c             	sub    $0xc,%esp
   31bed:	50                   	push   %eax
   31bee:	e8 a6 fe ff ff       	call   31a99 <set_console_start_video_addr>
   31bf3:	83 c4 10             	add    $0x10,%esp
   31bf6:	90                   	nop
   31bf7:	c9                   	leave  
   31bf8:	c3                   	ret    

00031bf9 <out_char>:
   31bf9:	55                   	push   %ebp
   31bfa:	89 e5                	mov    %esp,%ebp
   31bfc:	83 ec 28             	sub    $0x28,%esp
   31bff:	8b 45 0c             	mov    0xc(%ebp),%eax
   31c02:	88 45 e4             	mov    %al,-0x1c(%ebp)
   31c05:	8b 45 08             	mov    0x8(%ebp),%eax
   31c08:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31c0e:	8b 40 0c             	mov    0xc(%eax),%eax
   31c11:	05 00 c0 05 00       	add    $0x5c000,%eax
   31c16:	01 c0                	add    %eax,%eax
   31c18:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31c1b:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
   31c1f:	83 f8 08             	cmp    $0x8,%eax
   31c22:	0f 84 8d 00 00 00    	je     31cb5 <out_char+0xbc>
   31c28:	83 f8 0a             	cmp    $0xa,%eax
   31c2b:	0f 85 c9 00 00 00    	jne    31cfa <out_char+0x101>
   31c31:	8b 45 08             	mov    0x8(%ebp),%eax
   31c34:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31c3a:	8b 50 0c             	mov    0xc(%eax),%edx
   31c3d:	8b 45 08             	mov    0x8(%ebp),%eax
   31c40:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31c46:	8b 08                	mov    (%eax),%ecx
   31c48:	8b 45 08             	mov    0x8(%ebp),%eax
   31c4b:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31c51:	8b 40 04             	mov    0x4(%eax),%eax
   31c54:	01 c8                	add    %ecx,%eax
   31c56:	83 e8 50             	sub    $0x50,%eax
   31c59:	39 c2                	cmp    %eax,%edx
   31c5b:	0f 83 f4 00 00 00    	jae    31d55 <out_char+0x15c>
   31c61:	8b 45 08             	mov    0x8(%ebp),%eax
   31c64:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31c6a:	8b 08                	mov    (%eax),%ecx
   31c6c:	8b 45 08             	mov    0x8(%ebp),%eax
   31c6f:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31c75:	8b 50 0c             	mov    0xc(%eax),%edx
   31c78:	8b 45 08             	mov    0x8(%ebp),%eax
   31c7b:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31c81:	8b 00                	mov    (%eax),%eax
   31c83:	29 c2                	sub    %eax,%edx
   31c85:	89 d0                	mov    %edx,%eax
   31c87:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
   31c8c:	f7 e2                	mul    %edx
   31c8e:	89 d0                	mov    %edx,%eax
   31c90:	c1 e8 06             	shr    $0x6,%eax
   31c93:	8d 50 01             	lea    0x1(%eax),%edx
   31c96:	89 d0                	mov    %edx,%eax
   31c98:	c1 e0 02             	shl    $0x2,%eax
   31c9b:	01 d0                	add    %edx,%eax
   31c9d:	c1 e0 04             	shl    $0x4,%eax
   31ca0:	89 c2                	mov    %eax,%edx
   31ca2:	8b 45 08             	mov    0x8(%ebp),%eax
   31ca5:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31cab:	01 ca                	add    %ecx,%edx
   31cad:	89 50 0c             	mov    %edx,0xc(%eax)
   31cb0:	e9 a0 00 00 00       	jmp    31d55 <out_char+0x15c>
   31cb5:	8b 45 08             	mov    0x8(%ebp),%eax
   31cb8:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31cbe:	8b 50 0c             	mov    0xc(%eax),%edx
   31cc1:	8b 45 08             	mov    0x8(%ebp),%eax
   31cc4:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31cca:	8b 00                	mov    (%eax),%eax
   31ccc:	39 c2                	cmp    %eax,%edx
   31cce:	0f 86 84 00 00 00    	jbe    31d58 <out_char+0x15f>
   31cd4:	8b 45 08             	mov    0x8(%ebp),%eax
   31cd7:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31cdd:	8b 50 0c             	mov    0xc(%eax),%edx
   31ce0:	83 ea 01             	sub    $0x1,%edx
   31ce3:	89 50 0c             	mov    %edx,0xc(%eax)
   31ce6:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31ce9:	83 e8 02             	sub    $0x2,%eax
   31cec:	c6 00 20             	movb   $0x20,(%eax)
   31cef:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31cf2:	83 e8 01             	sub    $0x1,%eax
   31cf5:	c6 00 00             	movb   $0x0,(%eax)
   31cf8:	eb 5e                	jmp    31d58 <out_char+0x15f>
   31cfa:	8b 45 08             	mov    0x8(%ebp),%eax
   31cfd:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31d03:	8b 40 0c             	mov    0xc(%eax),%eax
   31d06:	8d 48 01             	lea    0x1(%eax),%ecx
   31d09:	8b 45 08             	mov    0x8(%ebp),%eax
   31d0c:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31d12:	8b 10                	mov    (%eax),%edx
   31d14:	8b 45 08             	mov    0x8(%ebp),%eax
   31d17:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31d1d:	8b 40 04             	mov    0x4(%eax),%eax
   31d20:	01 d0                	add    %edx,%eax
   31d22:	39 c1                	cmp    %eax,%ecx
   31d24:	73 35                	jae    31d5b <out_char+0x162>
   31d26:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31d29:	8d 50 01             	lea    0x1(%eax),%edx
   31d2c:	89 55 f4             	mov    %edx,-0xc(%ebp)
   31d2f:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
   31d33:	88 10                	mov    %dl,(%eax)
   31d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31d38:	8d 50 01             	lea    0x1(%eax),%edx
   31d3b:	89 55 f4             	mov    %edx,-0xc(%ebp)
   31d3e:	c6 00 0a             	movb   $0xa,(%eax)
   31d41:	8b 45 08             	mov    0x8(%ebp),%eax
   31d44:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31d4a:	8b 50 0c             	mov    0xc(%eax),%edx
   31d4d:	83 c2 01             	add    $0x1,%edx
   31d50:	89 50 0c             	mov    %edx,0xc(%eax)
   31d53:	eb 06                	jmp    31d5b <out_char+0x162>
   31d55:	90                   	nop
   31d56:	eb 04                	jmp    31d5c <out_char+0x163>
   31d58:	90                   	nop
   31d59:	eb 01                	jmp    31d5c <out_char+0x163>
   31d5b:	90                   	nop
   31d5c:	83 ec 0c             	sub    $0xc,%esp
   31d5f:	ff 75 08             	pushl  0x8(%ebp)
   31d62:	e8 9b fc ff ff       	call   31a02 <flush>
   31d67:	83 c4 10             	add    $0x10,%esp
   31d6a:	90                   	nop
   31d6b:	c9                   	leave  
   31d6c:	c3                   	ret    

00031d6d <tty_do_read>:
   31d6d:	55                   	push   %ebp
   31d6e:	89 e5                	mov    %esp,%ebp
   31d70:	83 ec 08             	sub    $0x8,%esp
   31d73:	a1 60 5e 03 00       	mov    0x35e60,%eax
   31d78:	39 45 08             	cmp    %eax,0x8(%ebp)
   31d7b:	75 17                	jne    31d94 <tty_do_read+0x27>
   31d7d:	a1 a8 b2 03 00       	mov    0x3b2a8,%eax
   31d82:	85 c0                	test   %eax,%eax
   31d84:	7e 0e                	jle    31d94 <tty_do_read+0x27>
   31d86:	83 ec 0c             	sub    $0xc,%esp
   31d89:	ff 75 08             	pushl  0x8(%ebp)
   31d8c:	e8 56 f8 ff ff       	call   315e7 <keyboard_read>
   31d91:	83 c4 10             	add    $0x10,%esp
   31d94:	90                   	nop
   31d95:	c9                   	leave  
   31d96:	c3                   	ret    

00031d97 <tty_do_write>:
   31d97:	55                   	push   %ebp
   31d98:	89 e5                	mov    %esp,%ebp
   31d9a:	83 ec 18             	sub    $0x18,%esp
   31d9d:	eb 64                	jmp    31e03 <tty_do_write+0x6c>
   31d9f:	8b 45 08             	mov    0x8(%ebp),%eax
   31da2:	8b 40 04             	mov    0x4(%eax),%eax
   31da5:	8b 00                	mov    (%eax),%eax
   31da7:	88 45 f7             	mov    %al,-0x9(%ebp)
   31daa:	8b 45 08             	mov    0x8(%ebp),%eax
   31dad:	8b 40 04             	mov    0x4(%eax),%eax
   31db0:	8d 50 04             	lea    0x4(%eax),%edx
   31db3:	8b 45 08             	mov    0x8(%ebp),%eax
   31db6:	89 50 04             	mov    %edx,0x4(%eax)
   31db9:	8b 45 08             	mov    0x8(%ebp),%eax
   31dbc:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   31dc2:	8d 50 ff             	lea    -0x1(%eax),%edx
   31dc5:	8b 45 08             	mov    0x8(%ebp),%eax
   31dc8:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
   31dce:	8b 45 08             	mov    0x8(%ebp),%eax
   31dd1:	8b 40 04             	mov    0x4(%eax),%eax
   31dd4:	8b 55 08             	mov    0x8(%ebp),%edx
   31dd7:	83 c2 08             	add    $0x8,%edx
   31dda:	81 c2 80 0c 00 00    	add    $0xc80,%edx
   31de0:	39 d0                	cmp    %edx,%eax
   31de2:	75 0c                	jne    31df0 <tty_do_write+0x59>
   31de4:	8b 45 08             	mov    0x8(%ebp),%eax
   31de7:	8d 50 08             	lea    0x8(%eax),%edx
   31dea:	8b 45 08             	mov    0x8(%ebp),%eax
   31ded:	89 50 04             	mov    %edx,0x4(%eax)
   31df0:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31df4:	83 ec 08             	sub    $0x8,%esp
   31df7:	50                   	push   %eax
   31df8:	ff 75 08             	pushl  0x8(%ebp)
   31dfb:	e8 f9 fd ff ff       	call   31bf9 <out_char>
   31e00:	83 c4 10             	add    $0x10,%esp
   31e03:	8b 45 08             	mov    0x8(%ebp),%eax
   31e06:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   31e0c:	85 c0                	test   %eax,%eax
   31e0e:	75 8f                	jne    31d9f <tty_do_write+0x8>
   31e10:	90                   	nop
   31e11:	c9                   	leave  
   31e12:	c3                   	ret    

00031e13 <init_screen>:
   31e13:	55                   	push   %ebp
   31e14:	89 e5                	mov    %esp,%ebp
   31e16:	83 ec 10             	sub    $0x10,%esp
   31e19:	8b 45 08             	mov    0x8(%ebp),%eax
   31e1c:	2d e0 b5 03 00       	sub    $0x3b5e0,%eax
   31e21:	c1 f8 04             	sar    $0x4,%eax
   31e24:	69 c0 79 19 8c 02    	imul   $0x28c1979,%eax,%eax
   31e2a:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31e2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31e30:	c1 e0 04             	shl    $0x4,%eax
   31e33:	8d 90 40 e4 03 00    	lea    0x3e440(%eax),%edx
   31e39:	8b 45 08             	mov    0x8(%ebp),%eax
   31e3c:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
   31e42:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
   31e49:	8b 45 08             	mov    0x8(%ebp),%eax
   31e4c:	8b 88 8c 0c 00 00    	mov    0xc8c(%eax),%ecx
   31e52:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31e55:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
   31e5a:	f7 e2                	mul    %edx
   31e5c:	89 d0                	mov    %edx,%eax
   31e5e:	d1 e8                	shr    %eax
   31e60:	89 41 04             	mov    %eax,0x4(%ecx)
   31e63:	8b 45 08             	mov    0x8(%ebp),%eax
   31e66:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31e6c:	8b 50 04             	mov    0x4(%eax),%edx
   31e6f:	8b 45 08             	mov    0x8(%ebp),%eax
   31e72:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31e78:	0f af 55 fc          	imul   -0x4(%ebp),%edx
   31e7c:	89 10                	mov    %edx,(%eax)
   31e7e:	8b 45 08             	mov    0x8(%ebp),%eax
   31e81:	8b 90 8c 0c 00 00    	mov    0xc8c(%eax),%edx
   31e87:	8b 45 08             	mov    0x8(%ebp),%eax
   31e8a:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   31e90:	8b 12                	mov    (%edx),%edx
   31e92:	89 50 08             	mov    %edx,0x8(%eax)
   31e95:	8b 55 08             	mov    0x8(%ebp),%edx
   31e98:	8b 92 8c 0c 00 00    	mov    0xc8c(%edx),%edx
   31e9e:	8b 40 08             	mov    0x8(%eax),%eax
   31ea1:	89 42 0c             	mov    %eax,0xc(%edx)
   31ea4:	90                   	nop
   31ea5:	c9                   	leave  
   31ea6:	c3                   	ret    

00031ea7 <init_tty>:
   31ea7:	55                   	push   %ebp
   31ea8:	89 e5                	mov    %esp,%ebp
   31eaa:	83 ec 18             	sub    $0x18,%esp
   31ead:	c7 45 f4 e0 b5 03 00 	movl   $0x3b5e0,-0xc(%ebp)
   31eb4:	eb 7a                	jmp    31f30 <init_tty+0x89>
   31eb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31eb9:	8d 50 08             	lea    0x8(%eax),%edx
   31ebc:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31ebf:	89 50 04             	mov    %edx,0x4(%eax)
   31ec2:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31ec5:	8b 50 04             	mov    0x4(%eax),%edx
   31ec8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31ecb:	89 10                	mov    %edx,(%eax)
   31ecd:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31ed0:	c7 80 88 0c 00 00 00 	movl   $0x0,0xc88(%eax)
   31ed7:	00 00 00 
   31eda:	ff 75 f4             	pushl  -0xc(%ebp)
   31edd:	e8 31 ff ff ff       	call   31e13 <init_screen>
   31ee2:	83 c4 04             	add    $0x4,%esp
   31ee5:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31ee8:	2d e0 b5 03 00       	sub    $0x3b5e0,%eax
   31eed:	85 c0                	test   %eax,%eax
   31eef:	7e 38                	jle    31f29 <init_tty+0x82>
   31ef1:	83 ec 08             	sub    $0x8,%esp
   31ef4:	6a 23                	push   $0x23
   31ef6:	ff 75 f4             	pushl  -0xc(%ebp)
   31ef9:	e8 fb fc ff ff       	call   31bf9 <out_char>
   31efe:	83 c4 10             	add    $0x10,%esp
   31f01:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31f04:	05 90 67 02 00       	add    $0x26790,%eax
   31f09:	2d e0 b5 03 00       	sub    $0x3b5e0,%eax
   31f0e:	c1 f8 04             	sar    $0x4,%eax
   31f11:	69 c0 79 19 8c 02    	imul   $0x28c1979,%eax,%eax
   31f17:	0f b6 c0             	movzbl %al,%eax
   31f1a:	83 ec 08             	sub    $0x8,%esp
   31f1d:	50                   	push   %eax
   31f1e:	ff 75 f4             	pushl  -0xc(%ebp)
   31f21:	e8 d3 fc ff ff       	call   31bf9 <out_char>
   31f26:	83 c4 10             	add    $0x10,%esp
   31f29:	81 45 f4 90 0c 00 00 	addl   $0xc90,-0xc(%ebp)
   31f30:	b8 90 db 03 00       	mov    $0x3db90,%eax
   31f35:	39 45 f4             	cmp    %eax,-0xc(%ebp)
   31f38:	0f 82 78 ff ff ff    	jb     31eb6 <init_tty+0xf>
   31f3e:	90                   	nop
   31f3f:	c9                   	leave  
   31f40:	c3                   	ret    

00031f41 <Printf>:
   31f41:	55                   	push   %ebp
   31f42:	89 e5                	mov    %esp,%ebp
   31f44:	81 ec 18 01 00 00    	sub    $0x118,%esp
   31f4a:	83 ec 04             	sub    $0x4,%esp
   31f4d:	68 00 01 00 00       	push   $0x100
   31f52:	6a 00                	push   $0x0
   31f54:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   31f5a:	50                   	push   %eax
   31f5b:	e8 29 12 00 00       	call   33189 <Memset>
   31f60:	83 c4 10             	add    $0x10,%esp
   31f63:	8d 45 0c             	lea    0xc(%ebp),%eax
   31f66:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31f69:	8b 45 08             	mov    0x8(%ebp),%eax
   31f6c:	83 ec 04             	sub    $0x4,%esp
   31f6f:	ff 75 f4             	pushl  -0xc(%ebp)
   31f72:	50                   	push   %eax
   31f73:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   31f79:	50                   	push   %eax
   31f7a:	e8 1e 00 00 00       	call   31f9d <vsprintf>
   31f7f:	83 c4 10             	add    $0x10,%esp
   31f82:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31f85:	83 ec 08             	sub    $0x8,%esp
   31f88:	ff 75 f0             	pushl  -0x10(%ebp)
   31f8b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   31f91:	50                   	push   %eax
   31f92:	e8 31 0c 00 00       	call   32bc8 <write>
   31f97:	83 c4 10             	add    $0x10,%esp
   31f9a:	90                   	nop
   31f9b:	c9                   	leave  
   31f9c:	c3                   	ret    

00031f9d <vsprintf>:
   31f9d:	55                   	push   %ebp
   31f9e:	89 e5                	mov    %esp,%ebp
   31fa0:	81 ec 68 02 00 00    	sub    $0x268,%esp
   31fa6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   31fac:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
   31fb2:	83 ec 04             	sub    $0x4,%esp
   31fb5:	6a 40                	push   $0x40
   31fb7:	6a 00                	push   $0x0
   31fb9:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   31fbf:	50                   	push   %eax
   31fc0:	e8 c4 11 00 00       	call   33189 <Memset>
   31fc5:	83 c4 10             	add    $0x10,%esp
   31fc8:	8b 45 10             	mov    0x10(%ebp),%eax
   31fcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31fce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   31fd5:	8b 45 08             	mov    0x8(%ebp),%eax
   31fd8:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31fdb:	e9 53 01 00 00       	jmp    32133 <vsprintf+0x196>
   31fe0:	8b 45 0c             	mov    0xc(%ebp),%eax
   31fe3:	0f b6 00             	movzbl (%eax),%eax
   31fe6:	3c 25                	cmp    $0x25,%al
   31fe8:	74 16                	je     32000 <vsprintf+0x63>
   31fea:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31fed:	8d 50 01             	lea    0x1(%eax),%edx
   31ff0:	89 55 f4             	mov    %edx,-0xc(%ebp)
   31ff3:	8b 55 0c             	mov    0xc(%ebp),%edx
   31ff6:	0f b6 12             	movzbl (%edx),%edx
   31ff9:	88 10                	mov    %dl,(%eax)
   31ffb:	e9 2f 01 00 00       	jmp    3212f <vsprintf+0x192>
   32000:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
   32004:	8b 45 0c             	mov    0xc(%ebp),%eax
   32007:	0f b6 00             	movzbl (%eax),%eax
   3200a:	0f be c0             	movsbl %al,%eax
   3200d:	83 f8 64             	cmp    $0x64,%eax
   32010:	74 26                	je     32038 <vsprintf+0x9b>
   32012:	83 f8 64             	cmp    $0x64,%eax
   32015:	7f 0e                	jg     32025 <vsprintf+0x88>
   32017:	83 f8 63             	cmp    $0x63,%eax
   3201a:	0f 84 f2 00 00 00    	je     32112 <vsprintf+0x175>
   32020:	e9 0a 01 00 00       	jmp    3212f <vsprintf+0x192>
   32025:	83 f8 73             	cmp    $0x73,%eax
   32028:	0f 84 b0 00 00 00    	je     320de <vsprintf+0x141>
   3202e:	83 f8 78             	cmp    $0x78,%eax
   32031:	74 5d                	je     32090 <vsprintf+0xf3>
   32033:	e9 f7 00 00 00       	jmp    3212f <vsprintf+0x192>
   32038:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3203b:	8b 00                	mov    (%eax),%eax
   3203d:	89 45 e8             	mov    %eax,-0x18(%ebp)
   32040:	83 ec 04             	sub    $0x4,%esp
   32043:	6a 0a                	push   $0xa
   32045:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
   3204b:	50                   	push   %eax
   3204c:	ff 75 e8             	pushl  -0x18(%ebp)
   3204f:	e8 aa 0a 00 00       	call   32afe <itoa>
   32054:	83 c4 10             	add    $0x10,%esp
   32057:	83 ec 08             	sub    $0x8,%esp
   3205a:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   32060:	50                   	push   %eax
   32061:	ff 75 f4             	pushl  -0xc(%ebp)
   32064:	e8 3f 11 00 00       	call   331a8 <Strcpy>
   32069:	83 c4 10             	add    $0x10,%esp
   3206c:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   32070:	83 ec 0c             	sub    $0xc,%esp
   32073:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   32079:	50                   	push   %eax
   3207a:	e8 43 11 00 00       	call   331c2 <Strlen>
   3207f:	83 c4 10             	add    $0x10,%esp
   32082:	89 45 ec             	mov    %eax,-0x14(%ebp)
   32085:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32088:	01 45 f4             	add    %eax,-0xc(%ebp)
   3208b:	e9 9f 00 00 00       	jmp    3212f <vsprintf+0x192>
   32090:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32093:	8b 00                	mov    (%eax),%eax
   32095:	83 ec 08             	sub    $0x8,%esp
   32098:	50                   	push   %eax
   32099:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   3209f:	50                   	push   %eax
   320a0:	e8 85 e7 ff ff       	call   3082a <atoi>
   320a5:	83 c4 10             	add    $0x10,%esp
   320a8:	83 ec 08             	sub    $0x8,%esp
   320ab:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   320b1:	50                   	push   %eax
   320b2:	ff 75 f4             	pushl  -0xc(%ebp)
   320b5:	e8 ee 10 00 00       	call   331a8 <Strcpy>
   320ba:	83 c4 10             	add    $0x10,%esp
   320bd:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   320c1:	83 ec 0c             	sub    $0xc,%esp
   320c4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   320ca:	50                   	push   %eax
   320cb:	e8 f2 10 00 00       	call   331c2 <Strlen>
   320d0:	83 c4 10             	add    $0x10,%esp
   320d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
   320d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
   320d9:	01 45 f4             	add    %eax,-0xc(%ebp)
   320dc:	eb 51                	jmp    3212f <vsprintf+0x192>
   320de:	8b 45 f0             	mov    -0x10(%ebp),%eax
   320e1:	8b 00                	mov    (%eax),%eax
   320e3:	83 ec 08             	sub    $0x8,%esp
   320e6:	50                   	push   %eax
   320e7:	ff 75 f4             	pushl  -0xc(%ebp)
   320ea:	e8 b9 10 00 00       	call   331a8 <Strcpy>
   320ef:	83 c4 10             	add    $0x10,%esp
   320f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
   320f5:	8b 00                	mov    (%eax),%eax
   320f7:	83 ec 0c             	sub    $0xc,%esp
   320fa:	50                   	push   %eax
   320fb:	e8 c2 10 00 00       	call   331c2 <Strlen>
   32100:	83 c4 10             	add    $0x10,%esp
   32103:	89 45 ec             	mov    %eax,-0x14(%ebp)
   32106:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   3210a:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3210d:	01 45 f4             	add    %eax,-0xc(%ebp)
   32110:	eb 1d                	jmp    3212f <vsprintf+0x192>
   32112:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32115:	0f b6 10             	movzbl (%eax),%edx
   32118:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3211b:	88 10                	mov    %dl,(%eax)
   3211d:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   32121:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
   32128:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3212b:	01 45 f4             	add    %eax,-0xc(%ebp)
   3212e:	90                   	nop
   3212f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
   32133:	8b 45 0c             	mov    0xc(%ebp),%eax
   32136:	0f b6 00             	movzbl (%eax),%eax
   32139:	84 c0                	test   %al,%al
   3213b:	0f 85 9f fe ff ff    	jne    31fe0 <vsprintf+0x43>
   32141:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32144:	2b 45 08             	sub    0x8(%ebp),%eax
   32147:	c9                   	leave  
   32148:	c3                   	ret    

00032149 <printx>:
   32149:	55                   	push   %ebp
   3214a:	89 e5                	mov    %esp,%ebp
   3214c:	81 ec 18 01 00 00    	sub    $0x118,%esp
   32152:	8d 45 0c             	lea    0xc(%ebp),%eax
   32155:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32158:	8b 45 08             	mov    0x8(%ebp),%eax
   3215b:	83 ec 04             	sub    $0x4,%esp
   3215e:	ff 75 f4             	pushl  -0xc(%ebp)
   32161:	50                   	push   %eax
   32162:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   32168:	50                   	push   %eax
   32169:	e8 2f fe ff ff       	call   31f9d <vsprintf>
   3216e:	83 c4 10             	add    $0x10,%esp
   32171:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32174:	83 ec 08             	sub    $0x8,%esp
   32177:	ff 75 f0             	pushl  -0x10(%ebp)
   3217a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   32180:	50                   	push   %eax
   32181:	e8 52 0a 00 00       	call   32bd8 <write_debug>
   32186:	83 c4 10             	add    $0x10,%esp
   32189:	90                   	nop
   3218a:	c9                   	leave  
   3218b:	c3                   	ret    

0003218c <sys_printx>:
   3218c:	55                   	push   %ebp
   3218d:	89 e5                	mov    %esp,%ebp
   3218f:	83 ec 28             	sub    $0x28,%esp
   32192:	a1 74 5e 03 00       	mov    0x35e74,%eax
   32197:	85 c0                	test   %eax,%eax
   32199:	75 1d                	jne    321b8 <sys_printx+0x2c>
   3219b:	8b 45 10             	mov    0x10(%ebp),%eax
   3219e:	8b 40 0c             	mov    0xc(%eax),%eax
   321a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
   321a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
   321a7:	ff 75 10             	pushl  0x10(%ebp)
   321aa:	50                   	push   %eax
   321ab:	e8 31 ee ff ff       	call   30fe1 <Seg2PhyAddrLDT>
   321b0:	83 c4 08             	add    $0x8,%esp
   321b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
   321b6:	eb 16                	jmp    321ce <sys_printx+0x42>
   321b8:	a1 74 5e 03 00       	mov    0x35e74,%eax
   321bd:	85 c0                	test   %eax,%eax
   321bf:	74 0d                	je     321ce <sys_printx+0x42>
   321c1:	6a 30                	push   $0x30
   321c3:	e8 d8 ed ff ff       	call   30fa0 <Seg2PhyAddr>
   321c8:	83 c4 04             	add    $0x4,%esp
   321cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
   321ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
   321d1:	8b 45 08             	mov    0x8(%ebp),%eax
   321d4:	01 d0                	add    %edx,%eax
   321d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
   321d9:	8b 45 10             	mov    0x10(%ebp),%eax
   321dc:	8b 40 64             	mov    0x64(%eax),%eax
   321df:	69 c0 90 0c 00 00    	imul   $0xc90,%eax,%eax
   321e5:	05 e0 b5 03 00       	add    $0x3b5e0,%eax
   321ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   321ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
   321f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
   321f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
   321f6:	0f b6 00             	movzbl (%eax),%eax
   321f9:	88 45 e3             	mov    %al,-0x1d(%ebp)
   321fc:	eb 3a                	jmp    32238 <sys_printx+0xac>
   321fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32201:	0f b6 00             	movzbl (%eax),%eax
   32204:	3c 3b                	cmp    $0x3b,%al
   32206:	74 0a                	je     32212 <sys_printx+0x86>
   32208:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3220b:	0f b6 00             	movzbl (%eax),%eax
   3220e:	3c 3a                	cmp    $0x3a,%al
   32210:	75 06                	jne    32218 <sys_printx+0x8c>
   32212:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   32216:	eb 20                	jmp    32238 <sys_printx+0xac>
   32218:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3221b:	0f b6 00             	movzbl (%eax),%eax
   3221e:	0f b6 c0             	movzbl %al,%eax
   32221:	83 ec 08             	sub    $0x8,%esp
   32224:	50                   	push   %eax
   32225:	ff 75 e4             	pushl  -0x1c(%ebp)
   32228:	e8 cc f9 ff ff       	call   31bf9 <out_char>
   3222d:	83 c4 10             	add    $0x10,%esp
   32230:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   32234:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
   32238:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   3223c:	7f c0                	jg     321fe <sys_printx+0x72>
   3223e:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
   32242:	75 11                	jne    32255 <sys_printx+0xc9>
   32244:	a1 74 5e 03 00       	mov    0x35e74,%eax
   32249:	85 c0                	test   %eax,%eax
   3224b:	74 15                	je     32262 <sys_printx+0xd6>
   3224d:	e8 59 e4 ff ff       	call   306ab <disable_int>
   32252:	f4                   	hlt    
   32253:	eb 0d                	jmp    32262 <sys_printx+0xd6>
   32255:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
   32259:	75 07                	jne    32262 <sys_printx+0xd6>
   3225b:	e8 4b e4 ff ff       	call   306ab <disable_int>
   32260:	f4                   	hlt    
   32261:	90                   	nop
   32262:	90                   	nop
   32263:	c9                   	leave  
   32264:	c3                   	ret    

00032265 <spin>:
   32265:	55                   	push   %ebp
   32266:	89 e5                	mov    %esp,%ebp
   32268:	eb fe                	jmp    32268 <spin+0x3>

0003226a <panic>:
   3226a:	55                   	push   %ebp
   3226b:	89 e5                	mov    %esp,%ebp
   3226d:	83 ec 08             	sub    $0x8,%esp
   32270:	83 ec 04             	sub    $0x4,%esp
   32273:	ff 75 08             	pushl  0x8(%ebp)
   32276:	6a 3a                	push   $0x3a
   32278:	68 80 2f 03 00       	push   $0x32f80
   3227d:	e8 c7 fe ff ff       	call   32149 <printx>
   32282:	83 c4 10             	add    $0x10,%esp
   32285:	90                   	nop
   32286:	c9                   	leave  
   32287:	c3                   	ret    

00032288 <assertion_failure>:
   32288:	55                   	push   %ebp
   32289:	89 e5                	mov    %esp,%ebp
   3228b:	83 ec 08             	sub    $0x8,%esp
   3228e:	83 ec 08             	sub    $0x8,%esp
   32291:	68 08 21 00 00       	push   $0x2108
   32296:	ff 75 10             	pushl  0x10(%ebp)
   32299:	ff 75 0c             	pushl  0xc(%ebp)
   3229c:	ff 75 08             	pushl  0x8(%ebp)
   3229f:	6a 3b                	push   $0x3b
   322a1:	68 88 2f 03 00       	push   $0x32f88
   322a6:	e8 9e fe ff ff       	call   32149 <printx>
   322ab:	83 c4 20             	add    $0x20,%esp
   322ae:	83 ec 0c             	sub    $0xc,%esp
   322b1:	68 bb 2f 03 00       	push   $0x32fbb
   322b6:	e8 aa ff ff ff       	call   32265 <spin>
   322bb:	83 c4 10             	add    $0x10,%esp
   322be:	90                   	nop
   322bf:	c9                   	leave  
   322c0:	c3                   	ret    

000322c1 <pid2proc>:
   322c1:	55                   	push   %ebp
   322c2:	89 e5                	mov    %esp,%ebp
   322c4:	83 ec 10             	sub    $0x10,%esp
   322c7:	8b 55 08             	mov    0x8(%ebp),%edx
   322ca:	89 d0                	mov    %edx,%eax
   322cc:	c1 e0 03             	shl    $0x3,%eax
   322cf:	01 d0                	add    %edx,%eax
   322d1:	c1 e0 04             	shl    $0x4,%eax
   322d4:	05 80 e4 03 00       	add    $0x3e480,%eax
   322d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
   322dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
   322df:	c9                   	leave  
   322e0:	c3                   	ret    

000322e1 <proc2pid>:
   322e1:	55                   	push   %ebp
   322e2:	89 e5                	mov    %esp,%ebp
   322e4:	83 ec 10             	sub    $0x10,%esp
   322e7:	8b 45 08             	mov    0x8(%ebp),%eax
   322ea:	2d 80 e4 03 00       	sub    $0x3e480,%eax
   322ef:	c1 f8 04             	sar    $0x4,%eax
   322f2:	69 c0 39 8e e3 38    	imul   $0x38e38e39,%eax,%eax
   322f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
   322fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
   322fe:	c9                   	leave  
   322ff:	c3                   	ret    

00032300 <dead_lock>:
   32300:	55                   	push   %ebp
   32301:	89 e5                	mov    %esp,%ebp
   32303:	83 ec 10             	sub    $0x10,%esp
   32306:	ff 75 08             	pushl  0x8(%ebp)
   32309:	e8 b3 ff ff ff       	call   322c1 <pid2proc>
   3230e:	83 c4 04             	add    $0x4,%esp
   32311:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32314:	ff 75 0c             	pushl  0xc(%ebp)
   32317:	e8 a5 ff ff ff       	call   322c1 <pid2proc>
   3231c:	83 c4 04             	add    $0x4,%esp
   3231f:	89 45 fc             	mov    %eax,-0x4(%ebp)
   32322:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32325:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   32329:	3c 01                	cmp    $0x1,%al
   3232b:	75 54                	jne    32381 <dead_lock+0x81>
   3232d:	8b 45 fc             	mov    -0x4(%ebp),%eax
   32330:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   32336:	39 45 08             	cmp    %eax,0x8(%ebp)
   32339:	75 2f                	jne    3236a <dead_lock+0x6a>
   3233b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3233e:	89 45 f8             	mov    %eax,-0x8(%ebp)
   32341:	8b 45 f8             	mov    -0x8(%ebp),%eax
   32344:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   3234a:	50                   	push   %eax
   3234b:	e8 71 ff ff ff       	call   322c1 <pid2proc>
   32350:	83 c4 04             	add    $0x4,%esp
   32353:	89 45 f8             	mov    %eax,-0x8(%ebp)
   32356:	8b 45 f8             	mov    -0x8(%ebp),%eax
   32359:	8b 50 58             	mov    0x58(%eax),%edx
   3235c:	8b 45 08             	mov    0x8(%ebp),%eax
   3235f:	39 c2                	cmp    %eax,%edx
   32361:	75 de                	jne    32341 <dead_lock+0x41>
   32363:	b8 01 00 00 00       	mov    $0x1,%eax
   32368:	eb 1d                	jmp    32387 <dead_lock+0x87>
   3236a:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3236d:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   32373:	50                   	push   %eax
   32374:	e8 48 ff ff ff       	call   322c1 <pid2proc>
   32379:	83 c4 04             	add    $0x4,%esp
   3237c:	89 45 fc             	mov    %eax,-0x4(%ebp)
   3237f:	eb a1                	jmp    32322 <dead_lock+0x22>
   32381:	90                   	nop
   32382:	b8 00 00 00 00       	mov    $0x0,%eax
   32387:	c9                   	leave  
   32388:	c3                   	ret    

00032389 <sys_send_msg>:
   32389:	55                   	push   %ebp
   3238a:	89 e5                	mov    %esp,%ebp
   3238c:	83 ec 38             	sub    $0x38,%esp
   3238f:	ff 75 0c             	pushl  0xc(%ebp)
   32392:	e8 2a ff ff ff       	call   322c1 <pid2proc>
   32397:	83 c4 04             	add    $0x4,%esp
   3239a:	89 45 ec             	mov    %eax,-0x14(%ebp)
   3239d:	ff 75 10             	pushl  0x10(%ebp)
   323a0:	e8 3c ff ff ff       	call   322e1 <proc2pid>
   323a5:	83 c4 04             	add    $0x4,%esp
   323a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
   323ab:	8b 45 08             	mov    0x8(%ebp),%eax
   323ae:	8b 55 e8             	mov    -0x18(%ebp),%edx
   323b1:	89 10                	mov    %edx,(%eax)
   323b3:	ff 75 0c             	pushl  0xc(%ebp)
   323b6:	ff 75 e8             	pushl  -0x18(%ebp)
   323b9:	e8 42 ff ff ff       	call   32300 <dead_lock>
   323be:	83 c4 08             	add    $0x8,%esp
   323c1:	83 f8 01             	cmp    $0x1,%eax
   323c4:	75 10                	jne    323d6 <sys_send_msg+0x4d>
   323c6:	83 ec 0c             	sub    $0xc,%esp
   323c9:	68 c7 2f 03 00       	push   $0x32fc7
   323ce:	e8 97 fe ff ff       	call   3226a <panic>
   323d3:	83 c4 10             	add    $0x10,%esp
   323d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
   323d9:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   323dd:	3c 02                	cmp    $0x2,%al
   323df:	0f 85 94 01 00 00    	jne    32579 <sys_send_msg+0x1f0>
   323e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
   323e8:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   323ee:	39 45 e8             	cmp    %eax,-0x18(%ebp)
   323f1:	74 12                	je     32405 <sys_send_msg+0x7c>
   323f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
   323f6:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   323fc:	83 f8 0f             	cmp    $0xf,%eax
   323ff:	0f 85 74 01 00 00    	jne    32579 <sys_send_msg+0x1f0>
   32405:	8b 45 10             	mov    0x10(%ebp),%eax
   32408:	8b 40 0c             	mov    0xc(%eax),%eax
   3240b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   3240e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32411:	83 ec 08             	sub    $0x8,%esp
   32414:	ff 75 10             	pushl  0x10(%ebp)
   32417:	50                   	push   %eax
   32418:	e8 c4 eb ff ff       	call   30fe1 <Seg2PhyAddrLDT>
   3241d:	83 c4 10             	add    $0x10,%esp
   32420:	89 45 e0             	mov    %eax,-0x20(%ebp)
   32423:	8b 55 e0             	mov    -0x20(%ebp),%edx
   32426:	89 d0                	mov    %edx,%eax
   32428:	01 c0                	add    %eax,%eax
   3242a:	01 d0                	add    %edx,%eax
   3242c:	c1 e0 02             	shl    $0x2,%eax
   3242f:	89 c2                	mov    %eax,%edx
   32431:	8b 45 08             	mov    0x8(%ebp),%eax
   32434:	01 d0                	add    %edx,%eax
   32436:	89 45 dc             	mov    %eax,-0x24(%ebp)
   32439:	c7 45 d8 0c 00 00 00 	movl   $0xc,-0x28(%ebp)
   32440:	8b 55 dc             	mov    -0x24(%ebp),%edx
   32443:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32446:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   3244c:	83 ec 04             	sub    $0x4,%esp
   3244f:	ff 75 d8             	pushl  -0x28(%ebp)
   32452:	52                   	push   %edx
   32453:	50                   	push   %eax
   32454:	e8 02 0d 00 00       	call   3315b <Memcpy>
   32459:	83 c4 10             	add    $0x10,%esp
   3245c:	8b 45 10             	mov    0x10(%ebp),%eax
   3245f:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   32466:	00 00 00 
   32469:	8b 45 10             	mov    0x10(%ebp),%eax
   3246c:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
   32473:	00 00 00 
   32476:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32479:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   32480:	00 00 00 
   32483:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32486:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
   3248a:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3248d:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
   32494:	00 00 00 
   32497:	83 ec 0c             	sub    $0xc,%esp
   3249a:	ff 75 ec             	pushl  -0x14(%ebp)
   3249d:	e8 11 06 00 00       	call   32ab3 <unblock>
   324a2:	83 c4 10             	add    $0x10,%esp
   324a5:	8b 45 10             	mov    0x10(%ebp),%eax
   324a8:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   324ae:	85 c0                	test   %eax,%eax
   324b0:	74 1c                	je     324ce <sys_send_msg+0x145>
   324b2:	68 39 08 00 00       	push   $0x839
   324b7:	68 5d 2f 03 00       	push   $0x32f5d
   324bc:	68 5d 2f 03 00       	push   $0x32f5d
   324c1:	68 d2 2f 03 00       	push   $0x32fd2
   324c6:	e8 bd fd ff ff       	call   32288 <assertion_failure>
   324cb:	83 c4 10             	add    $0x10,%esp
   324ce:	8b 45 10             	mov    0x10(%ebp),%eax
   324d1:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   324d7:	85 c0                	test   %eax,%eax
   324d9:	74 1c                	je     324f7 <sys_send_msg+0x16e>
   324db:	68 3a 08 00 00       	push   $0x83a
   324e0:	68 5d 2f 03 00       	push   $0x32f5d
   324e5:	68 5d 2f 03 00       	push   $0x32f5d
   324ea:	68 e5 2f 03 00       	push   $0x32fe5
   324ef:	e8 94 fd ff ff       	call   32288 <assertion_failure>
   324f4:	83 c4 10             	add    $0x10,%esp
   324f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
   324fa:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   32500:	85 c0                	test   %eax,%eax
   32502:	74 1c                	je     32520 <sys_send_msg+0x197>
   32504:	68 3b 08 00 00       	push   $0x83b
   32509:	68 5d 2f 03 00       	push   $0x32f5d
   3250e:	68 5d 2f 03 00       	push   $0x32f5d
   32513:	68 fc 2f 03 00       	push   $0x32ffc
   32518:	e8 6b fd ff ff       	call   32288 <assertion_failure>
   3251d:	83 c4 10             	add    $0x10,%esp
   32520:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32523:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   32527:	84 c0                	test   %al,%al
   32529:	74 1c                	je     32547 <sys_send_msg+0x1be>
   3252b:	68 3c 08 00 00       	push   $0x83c
   32530:	68 5d 2f 03 00       	push   $0x32f5d
   32535:	68 5d 2f 03 00       	push   $0x32f5d
   3253a:	68 11 30 03 00       	push   $0x33011
   3253f:	e8 44 fd ff ff       	call   32288 <assertion_failure>
   32544:	83 c4 10             	add    $0x10,%esp
   32547:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3254a:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   32550:	85 c0                	test   %eax,%eax
   32552:	0f 84 63 01 00 00    	je     326bb <sys_send_msg+0x332>
   32558:	68 3d 08 00 00       	push   $0x83d
   3255d:	68 5d 2f 03 00       	push   $0x32f5d
   32562:	68 5d 2f 03 00       	push   $0x32f5d
   32567:	68 27 30 03 00       	push   $0x33027
   3256c:	e8 17 fd ff ff       	call   32288 <assertion_failure>
   32571:	83 c4 10             	add    $0x10,%esp
   32574:	e9 42 01 00 00       	jmp    326bb <sys_send_msg+0x332>
   32579:	8b 45 10             	mov    0x10(%ebp),%eax
   3257c:	8b 55 08             	mov    0x8(%ebp),%edx
   3257f:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
   32585:	8b 45 10             	mov    0x10(%ebp),%eax
   32588:	8b 55 0c             	mov    0xc(%ebp),%edx
   3258b:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
   32591:	8b 45 10             	mov    0x10(%ebp),%eax
   32594:	c6 40 7c 01          	movb   $0x1,0x7c(%eax)
   32598:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3259b:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   325a1:	85 c0                	test   %eax,%eax
   325a3:	75 1b                	jne    325c0 <sys_send_msg+0x237>
   325a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
   325a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
   325ab:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
   325b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
   325b5:	8d 55 d0             	lea    -0x30(%ebp),%edx
   325b8:	89 90 8c 00 00 00    	mov    %edx,0x8c(%eax)
   325be:	eb 47                	jmp    32607 <sys_send_msg+0x27e>
   325c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
   325c3:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   325c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
   325cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
   325cf:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   325d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
   325d8:	eb 0f                	jmp    325e9 <sys_send_msg+0x260>
   325da:	8b 45 f4             	mov    -0xc(%ebp),%eax
   325dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
   325e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
   325e3:	8b 40 04             	mov    0x4(%eax),%eax
   325e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   325e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   325ed:	75 eb                	jne    325da <sys_send_msg+0x251>
   325ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
   325f2:	8b 40 04             	mov    0x4(%eax),%eax
   325f5:	8b 55 e8             	mov    -0x18(%ebp),%edx
   325f8:	89 10                	mov    %edx,(%eax)
   325fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
   325fd:	8b 40 04             	mov    0x4(%eax),%eax
   32600:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   32607:	8b 45 10             	mov    0x10(%ebp),%eax
   3260a:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   3260e:	3c 01                	cmp    $0x1,%al
   32610:	74 1c                	je     3262e <sys_send_msg+0x2a5>
   32612:	68 6b 08 00 00       	push   $0x86b
   32617:	68 5d 2f 03 00       	push   $0x32f5d
   3261c:	68 5d 2f 03 00       	push   $0x32f5d
   32621:	68 45 30 03 00       	push   $0x33045
   32626:	e8 5d fc ff ff       	call   32288 <assertion_failure>
   3262b:	83 c4 10             	add    $0x10,%esp
   3262e:	8b 45 10             	mov    0x10(%ebp),%eax
   32631:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   32637:	39 45 0c             	cmp    %eax,0xc(%ebp)
   3263a:	74 1c                	je     32658 <sys_send_msg+0x2cf>
   3263c:	68 6c 08 00 00       	push   $0x86c
   32641:	68 5d 2f 03 00       	push   $0x32f5d
   32646:	68 5d 2f 03 00       	push   $0x32f5d
   3264b:	68 60 30 03 00       	push   $0x33060
   32650:	e8 33 fc ff ff       	call   32288 <assertion_failure>
   32655:	83 c4 10             	add    $0x10,%esp
   32658:	8b 45 10             	mov    0x10(%ebp),%eax
   3265b:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   32661:	39 45 08             	cmp    %eax,0x8(%ebp)
   32664:	74 1c                	je     32682 <sys_send_msg+0x2f9>
   32666:	68 6d 08 00 00       	push   $0x86d
   3266b:	68 5d 2f 03 00       	push   $0x32f5d
   32670:	68 5d 2f 03 00       	push   $0x32f5d
   32675:	68 82 30 03 00       	push   $0x33082
   3267a:	e8 09 fc ff ff       	call   32288 <assertion_failure>
   3267f:	83 c4 10             	add    $0x10,%esp
   32682:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32685:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   3268b:	85 c0                	test   %eax,%eax
   3268d:	75 1c                	jne    326ab <sys_send_msg+0x322>
   3268f:	68 6f 08 00 00       	push   $0x86f
   32694:	68 5d 2f 03 00       	push   $0x32f5d
   32699:	68 5d 2f 03 00       	push   $0x32f5d
   3269e:	68 97 30 03 00       	push   $0x33097
   326a3:	e8 e0 fb ff ff       	call   32288 <assertion_failure>
   326a8:	83 c4 10             	add    $0x10,%esp
   326ab:	83 ec 0c             	sub    $0xc,%esp
   326ae:	ff 75 10             	pushl  0x10(%ebp)
   326b1:	e8 ee 03 00 00       	call   32aa4 <block>
   326b6:	83 c4 10             	add    $0x10,%esp
   326b9:	eb 01                	jmp    326bc <sys_send_msg+0x333>
   326bb:	90                   	nop
   326bc:	b8 00 00 00 00       	mov    $0x0,%eax
   326c1:	c9                   	leave  
   326c2:	c3                   	ret    

000326c3 <sys_receive_msg>:
   326c3:	55                   	push   %ebp
   326c4:	89 e5                	mov    %esp,%ebp
   326c6:	83 ec 38             	sub    $0x38,%esp
   326c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   326d0:	ff 75 0c             	pushl  0xc(%ebp)
   326d3:	e8 e9 fb ff ff       	call   322c1 <pid2proc>
   326d8:	83 c4 04             	add    $0x4,%esp
   326db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   326de:	ff 75 10             	pushl  0x10(%ebp)
   326e1:	e8 fb fb ff ff       	call   322e1 <proc2pid>
   326e6:	83 c4 04             	add    $0x4,%esp
   326e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
   326ec:	83 7d 0c 0f          	cmpl   $0xf,0xc(%ebp)
   326f0:	75 40                	jne    32732 <sys_receive_msg+0x6f>
   326f2:	8b 45 10             	mov    0x10(%ebp),%eax
   326f5:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   326fb:	85 c0                	test   %eax,%eax
   326fd:	0f 84 c6 00 00 00    	je     327c9 <sys_receive_msg+0x106>
   32703:	8b 45 10             	mov    0x10(%ebp),%eax
   32706:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   3270c:	8b 00                	mov    (%eax),%eax
   3270e:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32711:	8b 45 10             	mov    0x10(%ebp),%eax
   32714:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   3271a:	8b 50 04             	mov    0x4(%eax),%edx
   3271d:	8b 45 10             	mov    0x10(%ebp),%eax
   32720:	89 90 8c 00 00 00    	mov    %edx,0x8c(%eax)
   32726:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
   3272d:	e9 97 00 00 00       	jmp    327c9 <sys_receive_msg+0x106>
   32732:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   32736:	0f 88 8d 00 00 00    	js     327c9 <sys_receive_msg+0x106>
   3273c:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
   32740:	0f 8f 83 00 00 00    	jg     327c9 <sys_receive_msg+0x106>
   32746:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32749:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   3274d:	3c 01                	cmp    $0x1,%al
   3274f:	75 78                	jne    327c9 <sys_receive_msg+0x106>
   32751:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32754:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   3275a:	83 f8 0f             	cmp    $0xf,%eax
   3275d:	74 0e                	je     3276d <sys_receive_msg+0xaa>
   3275f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32762:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   32768:	39 45 e0             	cmp    %eax,-0x20(%ebp)
   3276b:	75 5c                	jne    327c9 <sys_receive_msg+0x106>
   3276d:	8b 45 10             	mov    0x10(%ebp),%eax
   32770:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   32776:	89 45 ec             	mov    %eax,-0x14(%ebp)
   32779:	8b 45 10             	mov    0x10(%ebp),%eax
   3277c:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
   32782:	89 45 e8             	mov    %eax,-0x18(%ebp)
   32785:	eb 24                	jmp    327ab <sys_receive_msg+0xe8>
   32787:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3278a:	8b 10                	mov    (%eax),%edx
   3278c:	8b 45 0c             	mov    0xc(%ebp),%eax
   3278f:	39 c2                	cmp    %eax,%edx
   32791:	75 09                	jne    3279c <sys_receive_msg+0xd9>
   32793:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
   3279a:	eb 15                	jmp    327b1 <sys_receive_msg+0xee>
   3279c:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3279f:	89 45 e8             	mov    %eax,-0x18(%ebp)
   327a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
   327a5:	8b 40 04             	mov    0x4(%eax),%eax
   327a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
   327ab:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   327af:	75 d6                	jne    32787 <sys_receive_msg+0xc4>
   327b1:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   327b5:	75 12                	jne    327c9 <sys_receive_msg+0x106>
   327b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
   327ba:	8b 50 04             	mov    0x4(%eax),%edx
   327bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
   327c0:	89 50 04             	mov    %edx,0x4(%eax)
   327c3:	8b 45 0c             	mov    0xc(%ebp),%eax
   327c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
   327c9:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   327cd:	0f 85 7f 01 00 00    	jne    32952 <sys_receive_msg+0x28f>
   327d3:	ff 75 f0             	pushl  -0x10(%ebp)
   327d6:	e8 e6 fa ff ff       	call   322c1 <pid2proc>
   327db:	83 c4 04             	add    $0x4,%esp
   327de:	89 45 dc             	mov    %eax,-0x24(%ebp)
   327e1:	8b 45 10             	mov    0x10(%ebp),%eax
   327e4:	8b 40 0c             	mov    0xc(%eax),%eax
   327e7:	89 45 d8             	mov    %eax,-0x28(%ebp)
   327ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
   327ed:	ff 75 10             	pushl  0x10(%ebp)
   327f0:	50                   	push   %eax
   327f1:	e8 eb e7 ff ff       	call   30fe1 <Seg2PhyAddrLDT>
   327f6:	83 c4 08             	add    $0x8,%esp
   327f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   327fc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
   327ff:	89 d0                	mov    %edx,%eax
   32801:	01 c0                	add    %eax,%eax
   32803:	01 d0                	add    %edx,%eax
   32805:	c1 e0 02             	shl    $0x2,%eax
   32808:	89 c2                	mov    %eax,%edx
   3280a:	8b 45 08             	mov    0x8(%ebp),%eax
   3280d:	01 d0                	add    %edx,%eax
   3280f:	89 45 d0             	mov    %eax,-0x30(%ebp)
   32812:	c7 45 cc 0c 00 00 00 	movl   $0xc,-0x34(%ebp)
   32819:	8b 45 dc             	mov    -0x24(%ebp),%eax
   3281c:	8b 90 80 00 00 00    	mov    0x80(%eax),%edx
   32822:	8b 45 d0             	mov    -0x30(%ebp),%eax
   32825:	83 ec 04             	sub    $0x4,%esp
   32828:	ff 75 cc             	pushl  -0x34(%ebp)
   3282b:	52                   	push   %edx
   3282c:	50                   	push   %eax
   3282d:	e8 29 09 00 00       	call   3315b <Memcpy>
   32832:	83 c4 10             	add    $0x10,%esp
   32835:	8b 45 dc             	mov    -0x24(%ebp),%eax
   32838:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   3283f:	00 00 00 
   32842:	8b 45 dc             	mov    -0x24(%ebp),%eax
   32845:	c6 40 7c 00          	movb   $0x0,0x7c(%eax)
   32849:	8b 45 dc             	mov    -0x24(%ebp),%eax
   3284c:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
   32853:	00 00 00 
   32856:	8b 45 10             	mov    0x10(%ebp),%eax
   32859:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
   32860:	00 00 00 
   32863:	8b 45 10             	mov    0x10(%ebp),%eax
   32866:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
   3286d:	00 00 00 
   32870:	83 ec 0c             	sub    $0xc,%esp
   32873:	ff 75 dc             	pushl  -0x24(%ebp)
   32876:	e8 38 02 00 00       	call   32ab3 <unblock>
   3287b:	83 c4 10             	add    $0x10,%esp
   3287e:	8b 45 dc             	mov    -0x24(%ebp),%eax
   32881:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   32887:	85 c0                	test   %eax,%eax
   32889:	74 1c                	je     328a7 <sys_receive_msg+0x1e4>
   3288b:	68 c5 08 00 00       	push   $0x8c5
   32890:	68 5d 2f 03 00       	push   $0x32f5d
   32895:	68 5d 2f 03 00       	push   $0x32f5d
   3289a:	68 af 30 03 00       	push   $0x330af
   3289f:	e8 e4 f9 ff ff       	call   32288 <assertion_failure>
   328a4:	83 c4 10             	add    $0x10,%esp
   328a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
   328aa:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   328ae:	84 c0                	test   %al,%al
   328b0:	74 1c                	je     328ce <sys_receive_msg+0x20b>
   328b2:	68 c6 08 00 00       	push   $0x8c6
   328b7:	68 5d 2f 03 00       	push   $0x32f5d
   328bc:	68 5d 2f 03 00       	push   $0x32f5d
   328c1:	68 c8 30 03 00       	push   $0x330c8
   328c6:	e8 bd f9 ff ff       	call   32288 <assertion_failure>
   328cb:	83 c4 10             	add    $0x10,%esp
   328ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
   328d1:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
   328d7:	85 c0                	test   %eax,%eax
   328d9:	74 1c                	je     328f7 <sys_receive_msg+0x234>
   328db:	68 c7 08 00 00       	push   $0x8c7
   328e0:	68 5d 2f 03 00       	push   $0x32f5d
   328e5:	68 5d 2f 03 00       	push   $0x32f5d
   328ea:	68 e7 30 03 00       	push   $0x330e7
   328ef:	e8 94 f9 ff ff       	call   32288 <assertion_failure>
   328f4:	83 c4 10             	add    $0x10,%esp
   328f7:	8b 45 10             	mov    0x10(%ebp),%eax
   328fa:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   32900:	85 c0                	test   %eax,%eax
   32902:	74 1c                	je     32920 <sys_receive_msg+0x25d>
   32904:	68 c9 08 00 00       	push   $0x8c9
   32909:	68 5d 2f 03 00       	push   $0x32f5d
   3290e:	68 5d 2f 03 00       	push   $0x32f5d
   32913:	68 fc 2f 03 00       	push   $0x32ffc
   32918:	e8 6b f9 ff ff       	call   32288 <assertion_failure>
   3291d:	83 c4 10             	add    $0x10,%esp
   32920:	8b 45 10             	mov    0x10(%ebp),%eax
   32923:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
   32929:	85 c0                	test   %eax,%eax
   3292b:	0f 84 b4 00 00 00    	je     329e5 <sys_receive_msg+0x322>
   32931:	68 ca 08 00 00       	push   $0x8ca
   32936:	68 5d 2f 03 00       	push   $0x32f5d
   3293b:	68 5d 2f 03 00       	push   $0x32f5d
   32940:	68 27 30 03 00       	push   $0x33027
   32945:	e8 3e f9 ff ff       	call   32288 <assertion_failure>
   3294a:	83 c4 10             	add    $0x10,%esp
   3294d:	e9 93 00 00 00       	jmp    329e5 <sys_receive_msg+0x322>
   32952:	8b 45 10             	mov    0x10(%ebp),%eax
   32955:	c6 40 7c 02          	movb   $0x2,0x7c(%eax)
   32959:	8b 45 10             	mov    0x10(%ebp),%eax
   3295c:	8b 55 08             	mov    0x8(%ebp),%edx
   3295f:	89 90 80 00 00 00    	mov    %edx,0x80(%eax)
   32965:	83 7d 0c 0f          	cmpl   $0xf,0xc(%ebp)
   32969:	75 0f                	jne    3297a <sys_receive_msg+0x2b7>
   3296b:	8b 45 10             	mov    0x10(%ebp),%eax
   3296e:	c7 80 88 00 00 00 0f 	movl   $0xf,0x88(%eax)
   32975:	00 00 00 
   32978:	eb 0c                	jmp    32986 <sys_receive_msg+0x2c3>
   3297a:	8b 45 10             	mov    0x10(%ebp),%eax
   3297d:	8b 55 0c             	mov    0xc(%ebp),%edx
   32980:	89 90 88 00 00 00    	mov    %edx,0x88(%eax)
   32986:	8b 45 10             	mov    0x10(%ebp),%eax
   32989:	0f b6 40 7c          	movzbl 0x7c(%eax),%eax
   3298d:	3c 02                	cmp    $0x2,%al
   3298f:	74 1c                	je     329ad <sys_receive_msg+0x2ea>
   32991:	68 d7 08 00 00       	push   $0x8d7
   32996:	68 5d 2f 03 00       	push   $0x32f5d
   3299b:	68 5d 2f 03 00       	push   $0x32f5d
   329a0:	68 03 31 03 00       	push   $0x33103
   329a5:	e8 de f8 ff ff       	call   32288 <assertion_failure>
   329aa:	83 c4 10             	add    $0x10,%esp
   329ad:	8b 45 10             	mov    0x10(%ebp),%eax
   329b0:	8b 80 80 00 00 00    	mov    0x80(%eax),%eax
   329b6:	39 45 08             	cmp    %eax,0x8(%ebp)
   329b9:	74 1c                	je     329d7 <sys_receive_msg+0x314>
   329bb:	68 d8 08 00 00       	push   $0x8d8
   329c0:	68 5d 2f 03 00       	push   $0x32f5d
   329c5:	68 5d 2f 03 00       	push   $0x32f5d
   329ca:	68 21 31 03 00       	push   $0x33121
   329cf:	e8 b4 f8 ff ff       	call   32288 <assertion_failure>
   329d4:	83 c4 10             	add    $0x10,%esp
   329d7:	83 ec 0c             	sub    $0xc,%esp
   329da:	ff 75 10             	pushl  0x10(%ebp)
   329dd:	e8 c2 00 00 00       	call   32aa4 <block>
   329e2:	83 c4 10             	add    $0x10,%esp
   329e5:	b8 00 00 00 00       	mov    $0x0,%eax
   329ea:	c9                   	leave  
   329eb:	c3                   	ret    

000329ec <send_rec>:
   329ec:	55                   	push   %ebp
   329ed:	89 e5                	mov    %esp,%ebp
   329ef:	83 ec 18             	sub    $0x18,%esp
   329f2:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
   329f6:	74 26                	je     32a1e <send_rec+0x32>
   329f8:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   329fc:	74 36                	je     32a34 <send_rec+0x48>
   329fe:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   32a02:	0f 85 82 00 00 00    	jne    32a8a <send_rec+0x9e>
   32a08:	83 ec 08             	sub    $0x8,%esp
   32a0b:	ff 75 10             	pushl  0x10(%ebp)
   32a0e:	ff 75 0c             	pushl  0xc(%ebp)
   32a11:	e8 d2 01 00 00       	call   32be8 <send_msg>
   32a16:	83 c4 10             	add    $0x10,%esp
   32a19:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32a1c:	eb 7f                	jmp    32a9d <send_rec+0xb1>
   32a1e:	83 ec 08             	sub    $0x8,%esp
   32a21:	ff 75 10             	pushl  0x10(%ebp)
   32a24:	ff 75 0c             	pushl  0xc(%ebp)
   32a27:	e8 cc 01 00 00       	call   32bf8 <receive_msg>
   32a2c:	83 c4 10             	add    $0x10,%esp
   32a2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32a32:	eb 69                	jmp    32a9d <send_rec+0xb1>
   32a34:	83 ec 08             	sub    $0x8,%esp
   32a37:	ff 75 10             	pushl  0x10(%ebp)
   32a3a:	ff 75 0c             	pushl  0xc(%ebp)
   32a3d:	e8 a6 01 00 00       	call   32be8 <send_msg>
   32a42:	83 c4 10             	add    $0x10,%esp
   32a45:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32a48:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   32a4c:	75 4e                	jne    32a9c <send_rec+0xb0>
   32a4e:	83 ec 08             	sub    $0x8,%esp
   32a51:	ff 75 10             	pushl  0x10(%ebp)
   32a54:	ff 75 0c             	pushl  0xc(%ebp)
   32a57:	e8 9c 01 00 00       	call   32bf8 <receive_msg>
   32a5c:	83 c4 10             	add    $0x10,%esp
   32a5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32a62:	8b 45 0c             	mov    0xc(%ebp),%eax
   32a65:	8b 40 08             	mov    0x8(%eax),%eax
   32a68:	85 c0                	test   %eax,%eax
   32a6a:	75 30                	jne    32a9c <send_rec+0xb0>
   32a6c:	68 01 09 00 00       	push   $0x901
   32a71:	68 5d 2f 03 00       	push   $0x32f5d
   32a76:	68 5d 2f 03 00       	push   $0x32f5d
   32a7b:	68 38 31 03 00       	push   $0x33138
   32a80:	e8 03 f8 ff ff       	call   32288 <assertion_failure>
   32a85:	83 c4 10             	add    $0x10,%esp
   32a88:	eb 12                	jmp    32a9c <send_rec+0xb0>
   32a8a:	83 ec 0c             	sub    $0xc,%esp
   32a8d:	68 46 31 03 00       	push   $0x33146
   32a92:	e8 d3 f7 ff ff       	call   3226a <panic>
   32a97:	83 c4 10             	add    $0x10,%esp
   32a9a:	eb 01                	jmp    32a9d <send_rec+0xb1>
   32a9c:	90                   	nop
   32a9d:	b8 00 00 00 00       	mov    $0x0,%eax
   32aa2:	c9                   	leave  
   32aa3:	c3                   	ret    

00032aa4 <block>:
   32aa4:	55                   	push   %ebp
   32aa5:	89 e5                	mov    %esp,%ebp
   32aa7:	e8 f0 e8 ff ff       	call   3139c <schedule_process>
   32aac:	b8 00 00 00 00       	mov    $0x0,%eax
   32ab1:	5d                   	pop    %ebp
   32ab2:	c3                   	ret    

00032ab3 <unblock>:
   32ab3:	55                   	push   %ebp
   32ab4:	89 e5                	mov    %esp,%ebp
   32ab6:	b8 00 00 00 00       	mov    $0x0,%eax
   32abb:	5d                   	pop    %ebp
   32abc:	c3                   	ret    

00032abd <get_ticks_ipc>:
   32abd:	55                   	push   %ebp
   32abe:	89 e5                	mov    %esp,%ebp
   32ac0:	83 ec 28             	sub    $0x28,%esp
   32ac3:	83 ec 04             	sub    $0x4,%esp
   32ac6:	6a 0c                	push   $0xc
   32ac8:	6a 00                	push   $0x0
   32aca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   32acd:	50                   	push   %eax
   32ace:	e8 b6 06 00 00       	call   33189 <Memset>
   32ad3:	83 c4 10             	add    $0x10,%esp
   32ad6:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
   32add:	83 ec 04             	sub    $0x4,%esp
   32ae0:	6a 01                	push   $0x1
   32ae2:	8d 45 e4             	lea    -0x1c(%ebp),%eax
   32ae5:	50                   	push   %eax
   32ae6:	6a 03                	push   $0x3
   32ae8:	e8 ff fe ff ff       	call   329ec <send_rec>
   32aed:	83 c4 10             	add    $0x10,%esp
   32af0:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32af3:	8b 45 ec             	mov    -0x14(%ebp),%eax
   32af6:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32af9:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32afc:	c9                   	leave  
   32afd:	c3                   	ret    

00032afe <itoa>:
   32afe:	55                   	push   %ebp
   32aff:	89 e5                	mov    %esp,%ebp
   32b01:	53                   	push   %ebx
   32b02:	83 ec 14             	sub    $0x14,%esp
   32b05:	8b 45 08             	mov    0x8(%ebp),%eax
   32b08:	99                   	cltd   
   32b09:	f7 7d 10             	idivl  0x10(%ebp)
   32b0c:	89 55 f4             	mov    %edx,-0xc(%ebp)
   32b0f:	8b 45 08             	mov    0x8(%ebp),%eax
   32b12:	99                   	cltd   
   32b13:	f7 7d 10             	idivl  0x10(%ebp)
   32b16:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32b19:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   32b1d:	74 14                	je     32b33 <itoa+0x35>
   32b1f:	83 ec 04             	sub    $0x4,%esp
   32b22:	ff 75 10             	pushl  0x10(%ebp)
   32b25:	ff 75 0c             	pushl  0xc(%ebp)
   32b28:	ff 75 f0             	pushl  -0x10(%ebp)
   32b2b:	e8 ce ff ff ff       	call   32afe <itoa>
   32b30:	83 c4 10             	add    $0x10,%esp
   32b33:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32b36:	8d 58 30             	lea    0x30(%eax),%ebx
   32b39:	8b 45 0c             	mov    0xc(%ebp),%eax
   32b3c:	8b 00                	mov    (%eax),%eax
   32b3e:	8d 48 01             	lea    0x1(%eax),%ecx
   32b41:	8b 55 0c             	mov    0xc(%ebp),%edx
   32b44:	89 0a                	mov    %ecx,(%edx)
   32b46:	89 da                	mov    %ebx,%edx
   32b48:	88 10                	mov    %dl,(%eax)
   32b4a:	8b 45 0c             	mov    0xc(%ebp),%eax
   32b4d:	8b 00                	mov    (%eax),%eax
   32b4f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   32b52:	c9                   	leave  
   32b53:	c3                   	ret    

00032b54 <i2a>:
   32b54:	55                   	push   %ebp
   32b55:	89 e5                	mov    %esp,%ebp
   32b57:	53                   	push   %ebx
   32b58:	83 ec 14             	sub    $0x14,%esp
   32b5b:	8b 45 08             	mov    0x8(%ebp),%eax
   32b5e:	99                   	cltd   
   32b5f:	f7 7d 0c             	idivl  0xc(%ebp)
   32b62:	89 55 f4             	mov    %edx,-0xc(%ebp)
   32b65:	8b 45 08             	mov    0x8(%ebp),%eax
   32b68:	99                   	cltd   
   32b69:	f7 7d 0c             	idivl  0xc(%ebp)
   32b6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32b6f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   32b73:	74 14                	je     32b89 <i2a+0x35>
   32b75:	83 ec 04             	sub    $0x4,%esp
   32b78:	ff 75 10             	pushl  0x10(%ebp)
   32b7b:	ff 75 0c             	pushl  0xc(%ebp)
   32b7e:	ff 75 f0             	pushl  -0x10(%ebp)
   32b81:	e8 ce ff ff ff       	call   32b54 <i2a>
   32b86:	83 c4 10             	add    $0x10,%esp
   32b89:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   32b8d:	7f 0a                	jg     32b99 <i2a+0x45>
   32b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32b92:	83 c0 30             	add    $0x30,%eax
   32b95:	89 c3                	mov    %eax,%ebx
   32b97:	eb 08                	jmp    32ba1 <i2a+0x4d>
   32b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32b9c:	83 c0 37             	add    $0x37,%eax
   32b9f:	89 c3                	mov    %eax,%ebx
   32ba1:	8b 45 10             	mov    0x10(%ebp),%eax
   32ba4:	8b 00                	mov    (%eax),%eax
   32ba6:	8d 48 01             	lea    0x1(%eax),%ecx
   32ba9:	8b 55 10             	mov    0x10(%ebp),%edx
   32bac:	89 0a                	mov    %ecx,(%edx)
   32bae:	88 18                	mov    %bl,(%eax)
   32bb0:	8b 45 10             	mov    0x10(%ebp),%eax
   32bb3:	8b 00                	mov    (%eax),%eax
   32bb5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   32bb8:	c9                   	leave  
   32bb9:	c3                   	ret    
   32bba:	66 90                	;xchg   %ax,%ax
   32bbc:	66 90                	;xchg   %ax,%ax
   32bbe:	66 90                	;xchg   %ax,%ax

00032bc0 <get_ticks>:
   32bc0:	b8 00 00 00 00       	mov    $0x0,%eax
   32bc5:	cd 90                	int    $0x90
   32bc7:	c3                   	ret    

00032bc8 <write>:
   32bc8:	b8 01 00 00 00       	mov    $0x1,%eax
   32bcd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32bd1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32bd5:	cd 90                	int    $0x90
   32bd7:	c3                   	ret    

00032bd8 <write_debug>:
   32bd8:	b8 02 00 00 00       	mov    $0x2,%eax
   32bdd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32be1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32be5:	cd 90                	int    $0x90
   32be7:	c3                   	ret    

00032be8 <send_msg>:
   32be8:	b8 03 00 00 00       	mov    $0x3,%eax
   32bed:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32bf1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32bf5:	cd 90                	int    $0x90
   32bf7:	c3                   	ret    

00032bf8 <receive_msg>:
   32bf8:	b8 04 00 00 00       	mov    $0x4,%eax
   32bfd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32c01:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32c05:	cd 90                	int    $0x90
   32c07:	c3                   	ret    
