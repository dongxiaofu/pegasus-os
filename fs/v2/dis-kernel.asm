
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	66 87 db             	xchg   %bx,%bx
   30403:	c7 05 90 8e 03 00 00 	movl   $0x0,0x38e90
   3040a:	00 00 00 
   3040d:	b4 0b                	mov    $0xb,%ah
   3040f:	b0 4c                	mov    $0x4c,%al
   30411:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
   30418:	bc 80 8e 03 00       	mov    $0x38e80,%esp
   3041d:	66 c7 05 90 8e 03 00 	movw   $0x0,0x38e90
   30424:	00 00 
   30426:	66 87 db             	xchg   %bx,%bx
   30429:	0f 01 05 78 bc 03 00 	sgdtl  0x3bc78
   30430:	e8 4c 43 00 00       	call   34781 <ReloadGDT>
   30435:	0f 01 15 78 bc 03 00 	lgdtl  0x3bc78
   3043c:	0f 01 1d 88 8e 03 00 	lidtl  0x38e88
   30443:	ea 4a 04 03 00 08 00 	ljmp   $0x8,$0x3044a

0003044a <csinit>:
   3044a:	31 c0                	xor    %eax,%eax
   3044c:	66 b8 40 00          	mov    $0x40,%ax
   30450:	0f 00 d8             	ltr    %ax
   30453:	66 87 db             	xchg   %bx,%bx
   30456:	e9 60 0a 00 00       	jmp    30ebb <kernel_main>
   3045b:	eb fe                	jmp    3045b <csinit+0x11>
   3045d:	fb                   	sti    
   3045e:	b4 0b                	mov    $0xb,%ah
   30460:	b0 4d                	mov    $0x4d,%al
   30462:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
   30469:	eb fe                	jmp    30469 <csinit+0x1f>
   3046b:	f4                   	hlt    
   3046c:	6a 00                	push   $0x0
   3046e:	9d                   	popf   
   3046f:	eb fe                	jmp    3046f <csinit+0x25>
   30471:	e8 71 08 00 00       	call   30ce7 <test>
   30476:	6a 01                	push   $0x1
   30478:	6a 02                	push   $0x2
   3047a:	6a 03                	push   $0x3
   3047c:	f4                   	hlt    

0003047d <InterruptTest>:
   3047d:	b4 0d                	mov    $0xd,%ah
   3047f:	b0 54                	mov    $0x54,%al
   30481:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
   30488:	c3                   	ret    

00030489 <disp_str>:
   30489:	55                   	push   %ebp
   3048a:	89 e5                	mov    %esp,%ebp
   3048c:	b4 0d                	mov    $0xd,%ah
   3048e:	8b 75 08             	mov    0x8(%ebp),%esi
   30491:	8b 3d 90 8e 03 00    	mov    0x38e90,%edi

00030497 <disp_str.1>:
   30497:	ac                   	lods   %ds:(%esi),%al
   30498:	84 c0                	test   %al,%al
   3049a:	74 1e                	je     304ba <disp_str.4>
   3049c:	3c 0a                	cmp    $0xa,%al
   3049e:	75 11                	jne    304b1 <disp_str.3>
   304a0:	50                   	push   %eax
   304a1:	89 f8                	mov    %edi,%eax
   304a3:	b3 a0                	mov    $0xa0,%bl
   304a5:	f6 f3                	div    %bl
   304a7:	40                   	inc    %eax
   304a8:	b3 a0                	mov    $0xa0,%bl
   304aa:	f6 e3                	mul    %bl
   304ac:	89 c7                	mov    %eax,%edi
   304ae:	58                   	pop    %eax
   304af:	eb e6                	jmp    30497 <disp_str.1>

000304b1 <disp_str.3>:
   304b1:	65 66 89 07          	mov    %ax,%gs:(%edi)
   304b5:	83 c7 02             	add    $0x2,%edi
   304b8:	eb dd                	jmp    30497 <disp_str.1>

000304ba <disp_str.4>:
   304ba:	89 3d 90 8e 03 00    	mov    %edi,0x38e90
   304c0:	89 ec                	mov    %ebp,%esp
   304c2:	5d                   	pop    %ebp
   304c3:	c3                   	ret    

000304c4 <disp_str_colour>:
   304c4:	55                   	push   %ebp
   304c5:	89 e5                	mov    %esp,%ebp
   304c7:	8b 75 08             	mov    0x8(%ebp),%esi
   304ca:	8a 65 0c             	mov    0xc(%ebp),%ah
   304cd:	8b 3d 90 8e 03 00    	mov    0x38e90,%edi

000304d3 <disp_str_colour.1>:
   304d3:	ac                   	lods   %ds:(%esi),%al
   304d4:	84 c0                	test   %al,%al
   304d6:	74 1e                	je     304f6 <disp_str_colour.4>
   304d8:	3c 0a                	cmp    $0xa,%al
   304da:	75 11                	jne    304ed <disp_str_colour.3>
   304dc:	50                   	push   %eax
   304dd:	89 f8                	mov    %edi,%eax
   304df:	b3 a0                	mov    $0xa0,%bl
   304e1:	f6 f3                	div    %bl
   304e3:	40                   	inc    %eax
   304e4:	b3 a0                	mov    $0xa0,%bl
   304e6:	f6 e3                	mul    %bl
   304e8:	89 c7                	mov    %eax,%edi
   304ea:	58                   	pop    %eax
   304eb:	eb e6                	jmp    304d3 <disp_str_colour.1>

000304ed <disp_str_colour.3>:
   304ed:	65 66 89 07          	mov    %ax,%gs:(%edi)
   304f1:	83 c7 02             	add    $0x2,%edi
   304f4:	eb dd                	jmp    304d3 <disp_str_colour.1>

000304f6 <disp_str_colour.4>:
   304f6:	89 3d 90 8e 03 00    	mov    %edi,0x38e90
   304fc:	89 ec                	mov    %ebp,%esp
   304fe:	5d                   	pop    %ebp
   304ff:	c3                   	ret    

00030500 <divide_zero_fault>:
   30500:	6a ff                	push   $0xffffffff
   30502:	6a 00                	push   $0x0
   30504:	eb 58                	jmp    3055e <exception>

00030506 <single_step_fault>:
   30506:	6a ff                	push   $0xffffffff
   30508:	6a 01                	push   $0x1
   3050a:	eb 52                	jmp    3055e <exception>

0003050c <non_maskable_interrupt>:
   3050c:	6a ff                	push   $0xffffffff
   3050e:	6a 02                	push   $0x2
   30510:	eb 4c                	jmp    3055e <exception>

00030512 <breakpoint_trap>:
   30512:	6a ff                	push   $0xffffffff
   30514:	6a 03                	push   $0x3
   30516:	eb 46                	jmp    3055e <exception>

00030518 <overflow_trap>:
   30518:	6a ff                	push   $0xffffffff
   3051a:	6a 04                	push   $0x4
   3051c:	eb 40                	jmp    3055e <exception>

0003051e <bound_range_exceeded_fault>:
   3051e:	6a ff                	push   $0xffffffff
   30520:	6a 05                	push   $0x5
   30522:	eb 3a                	jmp    3055e <exception>

00030524 <invalid_opcode_fault>:
   30524:	6a ff                	push   $0xffffffff
   30526:	6a 06                	push   $0x6
   30528:	eb 34                	jmp    3055e <exception>

0003052a <coprocessor_not_available_fault>:
   3052a:	6a ff                	push   $0xffffffff
   3052c:	6a 07                	push   $0x7
   3052e:	eb 2e                	jmp    3055e <exception>

00030530 <double_fault_exception_abort>:
   30530:	6a 08                	push   $0x8
   30532:	eb 2a                	jmp    3055e <exception>

00030534 <coprocessor_segment_overrun>:
   30534:	6a ff                	push   $0xffffffff
   30536:	6a 09                	push   $0x9
   30538:	eb 24                	jmp    3055e <exception>

0003053a <invalid_task_state_segment_fault>:
   3053a:	6a 0a                	push   $0xa
   3053c:	eb 20                	jmp    3055e <exception>

0003053e <segment_not_present_fault>:
   3053e:	6a 0b                	push   $0xb
   30540:	eb 1c                	jmp    3055e <exception>

00030542 <stack_exception_fault>:
   30542:	6a 0c                	push   $0xc
   30544:	eb 18                	jmp    3055e <exception>

00030546 <general_protection_exception_fault>:
   30546:	6a 0d                	push   $0xd
   30548:	eb 14                	jmp    3055e <exception>

0003054a <page_fault>:
   3054a:	6a 0e                	push   $0xe
   3054c:	eb 10                	jmp    3055e <exception>

0003054e <coprocessor_error_fault>:
   3054e:	6a ff                	push   $0xffffffff
   30550:	6a 10                	push   $0x10
   30552:	eb 0a                	jmp    3055e <exception>

00030554 <align_check_fault>:
   30554:	6a 11                	push   $0x11
   30556:	eb 06                	jmp    3055e <exception>

00030558 <simd_float_exception_fault>:
   30558:	6a ff                	push   $0xffffffff
   3055a:	6a 12                	push   $0x12
   3055c:	eb 00                	jmp    3055e <exception>

0003055e <exception>:
   3055e:	e8 81 04 00 00       	call   309e4 <exception_handler>
   30563:	83 c4 08             	add    $0x8,%esp
   30566:	f4                   	hlt    

00030567 <hwint0>:
   30567:	60                   	pusha  
   30568:	1e                   	push   %ds
   30569:	06                   	push   %es
   3056a:	0f a0                	push   %fs
   3056c:	0f a8                	push   %gs
   3056e:	66 8c d2             	mov    %ss,%dx
   30571:	8e da                	mov    %edx,%ds
   30573:	8e c2                	mov    %edx,%es
   30575:	8e e2                	mov    %edx,%fs
   30577:	b0 fd                	mov    $0xfd,%al
   30579:	e6 21                	out    %al,$0x21
   3057b:	b0 20                	mov    $0x20,%al
   3057d:	e6 20                	out    %al,$0x20
   3057f:	ff 05 94 8e 03 00    	incl   0x38e94
   30585:	83 3d 94 8e 03 00 00 	cmpl   $0x0,0x38e94
   3058c:	75 05                	jne    30593 <hwint0.2>

0003058e <hwint0.1>:
   3058e:	bc 80 8e 03 00       	mov    $0x38e80,%esp

00030593 <hwint0.2>:
   30593:	fb                   	sti    
   30594:	e8 4e 3e 00 00       	call   343e7 <clock_handler>
   30599:	b0 fc                	mov    $0xfc,%al
   3059b:	e6 21                	out    %al,$0x21
   3059d:	fa                   	cli    
   3059e:	83 3d 94 8e 03 00 00 	cmpl   $0x0,0x38e94
   305a5:	0f 85 19 01 00 00    	jne    306c4 <reenter_restore>
   305ab:	e9 00 01 00 00       	jmp    306b0 <restore>

000305b0 <hwint1>:
   305b0:	60                   	pusha  
   305b1:	1e                   	push   %ds
   305b2:	06                   	push   %es
   305b3:	0f a0                	push   %fs
   305b5:	0f a8                	push   %gs
   305b7:	66 8c d2             	mov    %ss,%dx
   305ba:	8e da                	mov    %edx,%ds
   305bc:	8e c2                	mov    %edx,%es
   305be:	8e e2                	mov    %edx,%fs
   305c0:	b0 fe                	mov    $0xfe,%al
   305c2:	e6 21                	out    %al,$0x21
   305c4:	b0 20                	mov    $0x20,%al
   305c6:	e6 20                	out    %al,$0x20
   305c8:	ff 05 94 8e 03 00    	incl   0x38e94
   305ce:	83 3d 94 8e 03 00 00 	cmpl   $0x0,0x38e94
   305d5:	75 05                	jne    305dc <hwint1.2>

000305d7 <hwint1.1>:
   305d7:	bc 80 8e 03 00       	mov    $0x38e80,%esp

000305dc <hwint1.2>:
   305dc:	fb                   	sti    
   305dd:	e8 d4 4b 00 00       	call   351b6 <keyboard_handler>
   305e2:	b0 fc                	mov    $0xfc,%al
   305e4:	e6 21                	out    %al,$0x21
   305e6:	fa                   	cli    
   305e7:	83 3d 94 8e 03 00 00 	cmpl   $0x0,0x38e94
   305ee:	0f 85 d0 00 00 00    	jne    306c4 <reenter_restore>
   305f4:	e9 b7 00 00 00       	jmp    306b0 <restore>

000305f9 <hwint14>:
   305f9:	60                   	pusha  
   305fa:	1e                   	push   %ds
   305fb:	06                   	push   %es
   305fc:	0f a0                	push   %fs
   305fe:	0f a8                	push   %gs
   30600:	66 8c d2             	mov    %ss,%dx
   30603:	8e da                	mov    %edx,%ds
   30605:	8e c2                	mov    %edx,%es
   30607:	8e e2                	mov    %edx,%fs
   30609:	e8 ad 01 00 00       	call   307bb <disable_8259A_slave_winchester_irq>
   3060e:	b0 20                	mov    $0x20,%al
   30610:	e6 20                	out    %al,$0x20
   30612:	b0 a0                	mov    $0xa0,%al
   30614:	e6 a0                	out    %al,$0xa0
   30616:	ff 05 94 8e 03 00    	incl   0x38e94
   3061c:	83 3d 94 8e 03 00 00 	cmpl   $0x0,0x38e94
   30623:	75 05                	jne    3062a <hwint14.2>

00030625 <hwint14.1>:
   30625:	bc 80 8e 03 00       	mov    $0x38e80,%esp

0003062a <hwint14.2>:
   3062a:	fb                   	sti    
   3062b:	e8 af 19 00 00       	call   31fdf <hd_handle>
   30630:	e8 7b 01 00 00       	call   307b0 <enable_8259A_slave_winchester_irq>
   30635:	fa                   	cli    
   30636:	83 3d 94 8e 03 00 00 	cmpl   $0x0,0x38e94
   3063d:	0f 85 81 00 00 00    	jne    306c4 <reenter_restore>
   30643:	eb 6b                	jmp    306b0 <restore>

00030645 <sys_call>:
   30645:	60                   	pusha  
   30646:	1e                   	push   %ds
   30647:	06                   	push   %es
   30648:	0f a0                	push   %fs
   3064a:	0f a8                	push   %gs
   3064c:	89 e6                	mov    %esp,%esi
   3064e:	66 8c d2             	mov    %ss,%dx
   30651:	8e da                	mov    %edx,%ds
   30653:	8e c2                	mov    %edx,%es
   30655:	8e e2                	mov    %edx,%fs
   30657:	ff 05 94 8e 03 00    	incl   0x38e94
   3065d:	83 3d 94 8e 03 00 00 	cmpl   $0x0,0x38e94
   30664:	75 05                	jne    3066b <sys_call.2>

00030666 <sys_call.1>:
   30666:	bc 80 8e 03 00       	mov    $0x38e80,%esp

0003066b <sys_call.2>:
   3066b:	fb                   	sti    
   3066c:	56                   	push   %esi
   3066d:	ff 35 a0 92 03 00    	pushl  0x392a0
   30673:	53                   	push   %ebx
   30674:	51                   	push   %ecx
   30675:	ff 14 85 60 80 03 00 	call   *0x38060(,%eax,4)
   3067c:	83 c4 0c             	add    $0xc,%esp
   3067f:	5e                   	pop    %esi
   30680:	89 46 2c             	mov    %eax,0x2c(%esi)
   30683:	83 3d 94 8e 03 00 00 	cmpl   $0x0,0x38e94
   3068a:	75 38                	jne    306c4 <reenter_restore>
   3068c:	eb 22                	jmp    306b0 <restore>

0003068e <restart>:
   3068e:	ff 0d 94 8e 03 00    	decl   0x38e94
   30694:	8b 25 a0 92 03 00    	mov    0x392a0,%esp
   3069a:	0f 00 54 24 44       	lldt   0x44(%esp)
   3069f:	8d 44 24 44          	lea    0x44(%esp),%eax
   306a3:	a3 04 bc 03 00       	mov    %eax,0x3bc04
   306a8:	0f a9                	pop    %gs
   306aa:	0f a1                	pop    %fs
   306ac:	07                   	pop    %es
   306ad:	1f                   	pop    %ds
   306ae:	61                   	popa   
   306af:	cf                   	iret   

000306b0 <restore>:
   306b0:	8b 25 a0 92 03 00    	mov    0x392a0,%esp
   306b6:	0f 00 54 24 44       	lldt   0x44(%esp)
   306bb:	8d 44 24 44          	lea    0x44(%esp),%eax
   306bf:	a3 04 bc 03 00       	mov    %eax,0x3bc04

000306c4 <reenter_restore>:
   306c4:	ff 0d 94 8e 03 00    	decl   0x38e94
   306ca:	0f a9                	pop    %gs
   306cc:	0f a1                	pop    %fs
   306ce:	07                   	pop    %es
   306cf:	1f                   	pop    %ds
   306d0:	61                   	popa   
   306d1:	cf                   	iret   

000306d2 <in_byte>:
   306d2:	31 d2                	xor    %edx,%edx
   306d4:	8b 54 24 04          	mov    0x4(%esp),%edx
   306d8:	31 c0                	xor    %eax,%eax
   306da:	ec                   	in     (%dx),%al
   306db:	90                   	nop
   306dc:	90                   	nop
   306dd:	c3                   	ret    

000306de <out_byte>:
   306de:	31 d2                	xor    %edx,%edx
   306e0:	31 c0                	xor    %eax,%eax
   306e2:	8b 54 24 04          	mov    0x4(%esp),%edx
   306e6:	8b 44 24 08          	mov    0x8(%esp),%eax
   306ea:	ee                   	out    %al,(%dx)
   306eb:	90                   	nop
   306ec:	90                   	nop
   306ed:	90                   	nop
   306ee:	90                   	nop
   306ef:	c3                   	ret    

000306f0 <in_byte2>:
   306f0:	55                   	push   %ebp
   306f1:	89 e5                	mov    %esp,%ebp
   306f3:	52                   	push   %edx
   306f4:	31 d2                	xor    %edx,%edx
   306f6:	66 8b 55 08          	mov    0x8(%ebp),%dx
   306fa:	31 c0                	xor    %eax,%eax
   306fc:	ec                   	in     (%dx),%al
   306fd:	90                   	nop
   306fe:	90                   	nop
   306ff:	5b                   	pop    %ebx
   30700:	5d                   	pop    %ebp
   30701:	c3                   	ret    

00030702 <disable_int>:
   30702:	fa                   	cli    
   30703:	c3                   	ret    

00030704 <enable_int>:
   30704:	fb                   	sti    
   30705:	c3                   	ret    

00030706 <check_tss_esp0>:
   30706:	55                   	push   %ebp
   30707:	89 e5                	mov    %esp,%ebp
   30709:	8b 45 08             	mov    0x8(%ebp),%eax
   3070c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
   3070f:	83 c0 44             	add    $0x44,%eax
   30712:	8b 15 04 bc 03 00    	mov    0x3bc04,%edx
   30718:	39 d0                	cmp    %edx,%eax
   3071a:	74 7c                	je     30798 <check_tss_esp0.2>

0003071c <check_tss_esp0.1>:
   3071c:	50                   	push   %eax
   3071d:	52                   	push   %edx
   3071e:	68 00 80 03 00       	push   $0x38000
   30723:	e8 61 fd ff ff       	call   30489 <disp_str>
   30728:	83 c4 04             	add    $0x4,%esp
   3072b:	5a                   	pop    %edx
   3072c:	58                   	pop    %eax
   3072d:	52                   	push   %edx
   3072e:	50                   	push   %eax
   3072f:	53                   	push   %ebx
   30730:	e8 86 02 00 00       	call   309bb <disp_int>
   30735:	83 c4 04             	add    $0x4,%esp
   30738:	58                   	pop    %eax
   30739:	5a                   	pop    %edx
   3073a:	52                   	push   %edx
   3073b:	50                   	push   %eax
   3073c:	e8 7a 02 00 00       	call   309bb <disp_int>
   30741:	58                   	pop    %eax
   30742:	5a                   	pop    %edx
   30743:	52                   	push   %edx
   30744:	50                   	push   %eax
   30745:	ff 35 94 8e 03 00    	pushl  0x38e94
   3074b:	e8 6b 02 00 00       	call   309bb <disp_int>
   30750:	83 c4 04             	add    $0x4,%esp
   30753:	58                   	pop    %eax
   30754:	5a                   	pop    %edx
   30755:	52                   	push   %edx
   30756:	50                   	push   %eax
   30757:	ff 72 ec             	pushl  -0x14(%edx)
   3075a:	e8 5c 02 00 00       	call   309bb <disp_int>
   3075f:	83 c4 04             	add    $0x4,%esp
   30762:	58                   	pop    %eax
   30763:	5a                   	pop    %edx
   30764:	52                   	push   %edx
   30765:	50                   	push   %eax
   30766:	ff 70 ec             	pushl  -0x14(%eax)
   30769:	e8 4d 02 00 00       	call   309bb <disp_int>
   3076e:	83 c4 04             	add    $0x4,%esp
   30771:	58                   	pop    %eax
   30772:	5a                   	pop    %edx
   30773:	52                   	push   %edx
   30774:	50                   	push   %eax
   30775:	ff 35 a0 92 03 00    	pushl  0x392a0
   3077b:	e8 3b 02 00 00       	call   309bb <disp_int>
   30780:	83 c4 04             	add    $0x4,%esp
   30783:	58                   	pop    %eax
   30784:	5a                   	pop    %edx
   30785:	52                   	push   %edx
   30786:	50                   	push   %eax
   30787:	68 80 8e 03 00       	push   $0x38e80
   3078c:	e8 2a 02 00 00       	call   309bb <disp_int>
   30791:	83 c4 04             	add    $0x4,%esp
   30794:	58                   	pop    %eax
   30795:	5a                   	pop    %edx
   30796:	5d                   	pop    %ebp
   30797:	c3                   	ret    

00030798 <check_tss_esp0.2>:
   30798:	5d                   	pop    %ebp
   30799:	c3                   	ret    

0003079a <enable_8259A_casecade_irq>:
   3079a:	66 50                	push   %ax
   3079c:	e4 21                	in     $0x21,%al
   3079e:	24 fb                	and    $0xfb,%al
   307a0:	e6 21                	out    %al,$0x21
   307a2:	66 58                	pop    %ax
   307a4:	c3                   	ret    

000307a5 <disable_8259A_casecade_irq>:
   307a5:	66 50                	push   %ax
   307a7:	e4 21                	in     $0x21,%al
   307a9:	0c 04                	or     $0x4,%al
   307ab:	e6 21                	out    %al,$0x21
   307ad:	66 58                	pop    %ax
   307af:	c3                   	ret    

000307b0 <enable_8259A_slave_winchester_irq>:
   307b0:	66 50                	push   %ax
   307b2:	e4 a1                	in     $0xa1,%al
   307b4:	0c bf                	or     $0xbf,%al
   307b6:	e6 a1                	out    %al,$0xa1
   307b8:	66 58                	pop    %ax
   307ba:	c3                   	ret    

000307bb <disable_8259A_slave_winchester_irq>:
   307bb:	66 50                	push   %ax
   307bd:	e4 a1                	in     $0xa1,%al
   307bf:	0c 40                	or     $0x40,%al
   307c1:	e6 a1                	out    %al,$0xa1
   307c3:	66 58                	pop    %ax
   307c5:	c3                   	ret    

000307c6 <untar>:
   307c6:	55                   	push   %ebp
   307c7:	89 e5                	mov    %esp,%ebp
   307c9:	81 ec 38 20 00 00    	sub    $0x2038,%esp
   307cf:	83 ec 08             	sub    $0x8,%esp
   307d2:	6a 00                	push   $0x0
   307d4:	ff 75 08             	pushl  0x8(%ebp)
   307d7:	e8 d7 4d 00 00       	call   355b3 <open>
   307dc:	83 c4 10             	add    $0x10,%esp
   307df:	89 45 e8             	mov    %eax,-0x18(%ebp)
   307e2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   307e9:	c7 45 e0 00 20 00 00 	movl   $0x2000,-0x20(%ebp)
   307f0:	83 ec 04             	sub    $0x4,%esp
   307f3:	68 00 02 00 00       	push   $0x200
   307f8:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
   307fe:	50                   	push   %eax
   307ff:	ff 75 e8             	pushl  -0x18(%ebp)
   30802:	e8 0f 4e 00 00       	call   35616 <read>
   30807:	83 c4 10             	add    $0x10,%esp
   3080a:	83 ec 0c             	sub    $0xc,%esp
   3080d:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
   30813:	50                   	push   %eax
   30814:	e8 d5 56 00 00       	call   35eee <Strlen>
   30819:	83 c4 10             	add    $0x10,%esp
   3081c:	85 c0                	test   %eax,%eax
   3081e:	0f 84 df 00 00 00    	je     30903 <untar+0x13d>
   30824:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
   3082a:	89 45 dc             	mov    %eax,-0x24(%ebp)
   3082d:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30830:	89 45 d8             	mov    %eax,-0x28(%ebp)
   30833:	83 ec 08             	sub    $0x8,%esp
   30836:	6a 01                	push   $0x1
   30838:	ff 75 d8             	pushl  -0x28(%ebp)
   3083b:	e8 73 4d 00 00       	call   355b3 <open>
   30840:	83 c4 10             	add    $0x10,%esp
   30843:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   30846:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3084d:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30850:	83 c0 7c             	add    $0x7c,%eax
   30853:	89 45 d0             	mov    %eax,-0x30(%ebp)
   30856:	8b 45 d0             	mov    -0x30(%ebp),%eax
   30859:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3085c:	eb 1f                	jmp    3087d <untar+0xb7>
   3085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30861:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
   30868:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3086b:	0f b6 00             	movzbl (%eax),%eax
   3086e:	0f be c0             	movsbl %al,%eax
   30871:	83 e8 30             	sub    $0x30,%eax
   30874:	01 d0                	add    %edx,%eax
   30876:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30879:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   3087d:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30880:	0f b6 00             	movzbl (%eax),%eax
   30883:	84 c0                	test   %al,%al
   30885:	75 d7                	jne    3085e <untar+0x98>
   30887:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3088a:	89 45 ec             	mov    %eax,-0x14(%ebp)
   3088d:	eb 5b                	jmp    308ea <untar+0x124>
   3088f:	8b 45 ec             	mov    -0x14(%ebp),%eax
   30892:	39 45 e0             	cmp    %eax,-0x20(%ebp)
   30895:	0f 4e 45 e0          	cmovle -0x20(%ebp),%eax
   30899:	89 45 cc             	mov    %eax,-0x34(%ebp)
   3089c:	8b 45 cc             	mov    -0x34(%ebp),%eax
   3089f:	83 e8 01             	sub    $0x1,%eax
   308a2:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
   308a8:	85 c0                	test   %eax,%eax
   308aa:	0f 48 c2             	cmovs  %edx,%eax
   308ad:	c1 f8 09             	sar    $0x9,%eax
   308b0:	83 c0 01             	add    $0x1,%eax
   308b3:	c1 e0 09             	shl    $0x9,%eax
   308b6:	83 ec 04             	sub    $0x4,%esp
   308b9:	50                   	push   %eax
   308ba:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
   308c0:	50                   	push   %eax
   308c1:	ff 75 e8             	pushl  -0x18(%ebp)
   308c4:	e8 4d 4d 00 00       	call   35616 <read>
   308c9:	83 c4 10             	add    $0x10,%esp
   308cc:	83 ec 04             	sub    $0x4,%esp
   308cf:	ff 75 cc             	pushl  -0x34(%ebp)
   308d2:	8d 85 cc df ff ff    	lea    -0x2034(%ebp),%eax
   308d8:	50                   	push   %eax
   308d9:	ff 75 d4             	pushl  -0x2c(%ebp)
   308dc:	e8 6c 4d 00 00       	call   3564d <write>
   308e1:	83 c4 10             	add    $0x10,%esp
   308e4:	8b 45 cc             	mov    -0x34(%ebp),%eax
   308e7:	29 45 ec             	sub    %eax,-0x14(%ebp)
   308ea:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   308ee:	75 9f                	jne    3088f <untar+0xc9>
   308f0:	83 ec 0c             	sub    $0xc,%esp
   308f3:	ff 75 d4             	pushl  -0x2c(%ebp)
   308f6:	e8 89 4d 00 00       	call   35684 <close>
   308fb:	83 c4 10             	add    $0x10,%esp
   308fe:	e9 ed fe ff ff       	jmp    307f0 <untar+0x2a>
   30903:	90                   	nop
   30904:	83 ec 0c             	sub    $0xc,%esp
   30907:	ff 75 e8             	pushl  -0x18(%ebp)
   3090a:	e8 75 4d 00 00       	call   35684 <close>
   3090f:	83 c4 10             	add    $0x10,%esp
   30912:	90                   	nop
   30913:	c9                   	leave  
   30914:	c3                   	ret    

00030915 <atoi>:
   30915:	55                   	push   %ebp
   30916:	89 e5                	mov    %esp,%ebp
   30918:	83 ec 10             	sub    $0x10,%esp
   3091b:	8b 45 08             	mov    0x8(%ebp),%eax
   3091e:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30921:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30924:	8d 50 01             	lea    0x1(%eax),%edx
   30927:	89 55 fc             	mov    %edx,-0x4(%ebp)
   3092a:	c6 00 30             	movb   $0x30,(%eax)
   3092d:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30930:	8d 50 01             	lea    0x1(%eax),%edx
   30933:	89 55 fc             	mov    %edx,-0x4(%ebp)
   30936:	c6 00 78             	movb   $0x78,(%eax)
   30939:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
   3093d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   30941:	75 0e                	jne    30951 <atoi+0x3c>
   30943:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30946:	8d 50 01             	lea    0x1(%eax),%edx
   30949:	89 55 fc             	mov    %edx,-0x4(%ebp)
   3094c:	c6 00 30             	movb   $0x30,(%eax)
   3094f:	eb 61                	jmp    309b2 <atoi+0x9d>
   30951:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
   30958:	eb 52                	jmp    309ac <atoi+0x97>
   3095a:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3095d:	8b 55 0c             	mov    0xc(%ebp),%edx
   30960:	89 c1                	mov    %eax,%ecx
   30962:	d3 fa                	sar    %cl,%edx
   30964:	89 d0                	mov    %edx,%eax
   30966:	83 e0 0f             	and    $0xf,%eax
   30969:	88 45 fb             	mov    %al,-0x5(%ebp)
   3096c:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
   30970:	75 06                	jne    30978 <atoi+0x63>
   30972:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
   30976:	74 2f                	je     309a7 <atoi+0x92>
   30978:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
   3097c:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
   30980:	83 c0 30             	add    $0x30,%eax
   30983:	88 45 fb             	mov    %al,-0x5(%ebp)
   30986:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
   3098a:	7e 0a                	jle    30996 <atoi+0x81>
   3098c:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
   30990:	83 c0 07             	add    $0x7,%eax
   30993:	88 45 fb             	mov    %al,-0x5(%ebp)
   30996:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30999:	8d 50 01             	lea    0x1(%eax),%edx
   3099c:	89 55 fc             	mov    %edx,-0x4(%ebp)
   3099f:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
   309a3:	88 10                	mov    %dl,(%eax)
   309a5:	eb 01                	jmp    309a8 <atoi+0x93>
   309a7:	90                   	nop
   309a8:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
   309ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   309b0:	79 a8                	jns    3095a <atoi+0x45>
   309b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
   309b5:	c6 00 00             	movb   $0x0,(%eax)
   309b8:	90                   	nop
   309b9:	c9                   	leave  
   309ba:	c3                   	ret    

000309bb <disp_int>:
   309bb:	55                   	push   %ebp
   309bc:	89 e5                	mov    %esp,%ebp
   309be:	83 ec 18             	sub    $0x18,%esp
   309c1:	ff 75 08             	pushl  0x8(%ebp)
   309c4:	8d 45 e8             	lea    -0x18(%ebp),%eax
   309c7:	50                   	push   %eax
   309c8:	e8 48 ff ff ff       	call   30915 <atoi>
   309cd:	83 c4 08             	add    $0x8,%esp
   309d0:	83 ec 08             	sub    $0x8,%esp
   309d3:	6a 0b                	push   $0xb
   309d5:	8d 45 e8             	lea    -0x18(%ebp),%eax
   309d8:	50                   	push   %eax
   309d9:	e8 e6 fa ff ff       	call   304c4 <disp_str_colour>
   309de:	83 c4 10             	add    $0x10,%esp
   309e1:	90                   	nop
   309e2:	c9                   	leave  
   309e3:	c3                   	ret    

000309e4 <exception_handler>:
   309e4:	55                   	push   %ebp
   309e5:	89 e5                	mov    %esp,%ebp
   309e7:	57                   	push   %edi
   309e8:	56                   	push   %esi
   309e9:	53                   	push   %ebx
   309ea:	83 ec 6c             	sub    $0x6c,%esp
   309ed:	8d 45 90             	lea    -0x70(%ebp),%eax
   309f0:	bb 00 59 03 00       	mov    $0x35900,%ebx
   309f5:	ba 13 00 00 00       	mov    $0x13,%edx
   309fa:	89 c7                	mov    %eax,%edi
   309fc:	89 de                	mov    %ebx,%esi
   309fe:	89 d1                	mov    %edx,%ecx
   30a00:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   30a02:	c7 05 90 8e 03 00 00 	movl   $0x0,0x38e90
   30a09:	00 00 00 
   30a0c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   30a13:	eb 14                	jmp    30a29 <exception_handler+0x45>
   30a15:	83 ec 0c             	sub    $0xc,%esp
   30a18:	68 e0 56 03 00       	push   $0x356e0
   30a1d:	e8 67 fa ff ff       	call   30489 <disp_str>
   30a22:	83 c4 10             	add    $0x10,%esp
   30a25:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   30a29:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
   30a30:	7e e3                	jle    30a15 <exception_handler+0x31>
   30a32:	c7 05 90 8e 03 00 00 	movl   $0x0,0x38e90
   30a39:	00 00 00 
   30a3c:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
   30a43:	8b 45 08             	mov    0x8(%ebp),%eax
   30a46:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
   30a4a:	89 45 dc             	mov    %eax,-0x24(%ebp)
   30a4d:	83 ec 08             	sub    $0x8,%esp
   30a50:	ff 75 e0             	pushl  -0x20(%ebp)
   30a53:	ff 75 dc             	pushl  -0x24(%ebp)
   30a56:	e8 69 fa ff ff       	call   304c4 <disp_str_colour>
   30a5b:	83 c4 10             	add    $0x10,%esp
   30a5e:	83 ec 0c             	sub    $0xc,%esp
   30a61:	68 e2 56 03 00       	push   $0x356e2
   30a66:	e8 1e fa ff ff       	call   30489 <disp_str>
   30a6b:	83 c4 10             	add    $0x10,%esp
   30a6e:	83 ec 08             	sub    $0x8,%esp
   30a71:	ff 75 e0             	pushl  -0x20(%ebp)
   30a74:	68 e5 56 03 00       	push   $0x356e5
   30a79:	e8 46 fa ff ff       	call   304c4 <disp_str_colour>
   30a7e:	83 c4 10             	add    $0x10,%esp
   30a81:	83 ec 0c             	sub    $0xc,%esp
   30a84:	ff 75 08             	pushl  0x8(%ebp)
   30a87:	e8 2f ff ff ff       	call   309bb <disp_int>
   30a8c:	83 c4 10             	add    $0x10,%esp
   30a8f:	83 ec 0c             	sub    $0xc,%esp
   30a92:	68 e2 56 03 00       	push   $0x356e2
   30a97:	e8 ed f9 ff ff       	call   30489 <disp_str>
   30a9c:	83 c4 10             	add    $0x10,%esp
   30a9f:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   30aa3:	74 31                	je     30ad6 <exception_handler+0xf2>
   30aa5:	83 ec 08             	sub    $0x8,%esp
   30aa8:	ff 75 e0             	pushl  -0x20(%ebp)
   30aab:	68 ed 56 03 00       	push   $0x356ed
   30ab0:	e8 0f fa ff ff       	call   304c4 <disp_str_colour>
   30ab5:	83 c4 10             	add    $0x10,%esp
   30ab8:	83 ec 0c             	sub    $0xc,%esp
   30abb:	ff 75 0c             	pushl  0xc(%ebp)
   30abe:	e8 f8 fe ff ff       	call   309bb <disp_int>
   30ac3:	83 c4 10             	add    $0x10,%esp
   30ac6:	83 ec 0c             	sub    $0xc,%esp
   30ac9:	68 e2 56 03 00       	push   $0x356e2
   30ace:	e8 b6 f9 ff ff       	call   30489 <disp_str>
   30ad3:	83 c4 10             	add    $0x10,%esp
   30ad6:	83 ec 08             	sub    $0x8,%esp
   30ad9:	ff 75 e0             	pushl  -0x20(%ebp)
   30adc:	68 f7 56 03 00       	push   $0x356f7
   30ae1:	e8 de f9 ff ff       	call   304c4 <disp_str_colour>
   30ae6:	83 c4 10             	add    $0x10,%esp
   30ae9:	83 ec 0c             	sub    $0xc,%esp
   30aec:	ff 75 14             	pushl  0x14(%ebp)
   30aef:	e8 c7 fe ff ff       	call   309bb <disp_int>
   30af4:	83 c4 10             	add    $0x10,%esp
   30af7:	83 ec 0c             	sub    $0xc,%esp
   30afa:	68 e2 56 03 00       	push   $0x356e2
   30aff:	e8 85 f9 ff ff       	call   30489 <disp_str>
   30b04:	83 c4 10             	add    $0x10,%esp
   30b07:	83 ec 08             	sub    $0x8,%esp
   30b0a:	ff 75 e0             	pushl  -0x20(%ebp)
   30b0d:	68 fb 56 03 00       	push   $0x356fb
   30b12:	e8 ad f9 ff ff       	call   304c4 <disp_str_colour>
   30b17:	83 c4 10             	add    $0x10,%esp
   30b1a:	83 ec 0c             	sub    $0xc,%esp
   30b1d:	ff 75 10             	pushl  0x10(%ebp)
   30b20:	e8 96 fe ff ff       	call   309bb <disp_int>
   30b25:	83 c4 10             	add    $0x10,%esp
   30b28:	83 ec 0c             	sub    $0xc,%esp
   30b2b:	68 e2 56 03 00       	push   $0x356e2
   30b30:	e8 54 f9 ff ff       	call   30489 <disp_str>
   30b35:	83 c4 10             	add    $0x10,%esp
   30b38:	83 ec 08             	sub    $0x8,%esp
   30b3b:	ff 75 e0             	pushl  -0x20(%ebp)
   30b3e:	68 00 57 03 00       	push   $0x35700
   30b43:	e8 7c f9 ff ff       	call   304c4 <disp_str_colour>
   30b48:	83 c4 10             	add    $0x10,%esp
   30b4b:	83 ec 0c             	sub    $0xc,%esp
   30b4e:	ff 75 18             	pushl  0x18(%ebp)
   30b51:	e8 65 fe ff ff       	call   309bb <disp_int>
   30b56:	83 c4 10             	add    $0x10,%esp
   30b59:	83 ec 0c             	sub    $0xc,%esp
   30b5c:	68 e2 56 03 00       	push   $0x356e2
   30b61:	e8 23 f9 ff ff       	call   30489 <disp_str>
   30b66:	83 c4 10             	add    $0x10,%esp
   30b69:	90                   	nop
   30b6a:	8d 65 f4             	lea    -0xc(%ebp),%esp
   30b6d:	5b                   	pop    %ebx
   30b6e:	5e                   	pop    %esi
   30b6f:	5f                   	pop    %edi
   30b70:	5d                   	pop    %ebp
   30b71:	c3                   	ret    

00030b72 <init_internal_interrupt>:
   30b72:	55                   	push   %ebp
   30b73:	89 e5                	mov    %esp,%ebp
   30b75:	83 ec 08             	sub    $0x8,%esp
   30b78:	6a 0e                	push   $0xe
   30b7a:	6a 08                	push   $0x8
   30b7c:	68 00 05 03 00       	push   $0x30500
   30b81:	6a 00                	push   $0x0
   30b83:	e8 9d 3b 00 00       	call   34725 <InitInterruptDesc>
   30b88:	83 c4 10             	add    $0x10,%esp
   30b8b:	6a 0e                	push   $0xe
   30b8d:	6a 08                	push   $0x8
   30b8f:	68 06 05 03 00       	push   $0x30506
   30b94:	6a 01                	push   $0x1
   30b96:	e8 8a 3b 00 00       	call   34725 <InitInterruptDesc>
   30b9b:	83 c4 10             	add    $0x10,%esp
   30b9e:	6a 0e                	push   $0xe
   30ba0:	6a 08                	push   $0x8
   30ba2:	68 0c 05 03 00       	push   $0x3050c
   30ba7:	6a 02                	push   $0x2
   30ba9:	e8 77 3b 00 00       	call   34725 <InitInterruptDesc>
   30bae:	83 c4 10             	add    $0x10,%esp
   30bb1:	6a 0e                	push   $0xe
   30bb3:	6a 08                	push   $0x8
   30bb5:	68 12 05 03 00       	push   $0x30512
   30bba:	6a 03                	push   $0x3
   30bbc:	e8 64 3b 00 00       	call   34725 <InitInterruptDesc>
   30bc1:	83 c4 10             	add    $0x10,%esp
   30bc4:	6a 0e                	push   $0xe
   30bc6:	6a 08                	push   $0x8
   30bc8:	68 18 05 03 00       	push   $0x30518
   30bcd:	6a 04                	push   $0x4
   30bcf:	e8 51 3b 00 00       	call   34725 <InitInterruptDesc>
   30bd4:	83 c4 10             	add    $0x10,%esp
   30bd7:	6a 0e                	push   $0xe
   30bd9:	6a 08                	push   $0x8
   30bdb:	68 1e 05 03 00       	push   $0x3051e
   30be0:	6a 05                	push   $0x5
   30be2:	e8 3e 3b 00 00       	call   34725 <InitInterruptDesc>
   30be7:	83 c4 10             	add    $0x10,%esp
   30bea:	6a 0e                	push   $0xe
   30bec:	6a 08                	push   $0x8
   30bee:	68 24 05 03 00       	push   $0x30524
   30bf3:	6a 06                	push   $0x6
   30bf5:	e8 2b 3b 00 00       	call   34725 <InitInterruptDesc>
   30bfa:	83 c4 10             	add    $0x10,%esp
   30bfd:	6a 0e                	push   $0xe
   30bff:	6a 08                	push   $0x8
   30c01:	68 2a 05 03 00       	push   $0x3052a
   30c06:	6a 07                	push   $0x7
   30c08:	e8 18 3b 00 00       	call   34725 <InitInterruptDesc>
   30c0d:	83 c4 10             	add    $0x10,%esp
   30c10:	6a 0e                	push   $0xe
   30c12:	6a 08                	push   $0x8
   30c14:	68 30 05 03 00       	push   $0x30530
   30c19:	6a 08                	push   $0x8
   30c1b:	e8 05 3b 00 00       	call   34725 <InitInterruptDesc>
   30c20:	83 c4 10             	add    $0x10,%esp
   30c23:	6a 0e                	push   $0xe
   30c25:	6a 08                	push   $0x8
   30c27:	68 34 05 03 00       	push   $0x30534
   30c2c:	6a 09                	push   $0x9
   30c2e:	e8 f2 3a 00 00       	call   34725 <InitInterruptDesc>
   30c33:	83 c4 10             	add    $0x10,%esp
   30c36:	6a 0e                	push   $0xe
   30c38:	6a 08                	push   $0x8
   30c3a:	68 3a 05 03 00       	push   $0x3053a
   30c3f:	6a 0a                	push   $0xa
   30c41:	e8 df 3a 00 00       	call   34725 <InitInterruptDesc>
   30c46:	83 c4 10             	add    $0x10,%esp
   30c49:	6a 0e                	push   $0xe
   30c4b:	6a 08                	push   $0x8
   30c4d:	68 3e 05 03 00       	push   $0x3053e
   30c52:	6a 0b                	push   $0xb
   30c54:	e8 cc 3a 00 00       	call   34725 <InitInterruptDesc>
   30c59:	83 c4 10             	add    $0x10,%esp
   30c5c:	6a 0e                	push   $0xe
   30c5e:	6a 08                	push   $0x8
   30c60:	68 42 05 03 00       	push   $0x30542
   30c65:	6a 0c                	push   $0xc
   30c67:	e8 b9 3a 00 00       	call   34725 <InitInterruptDesc>
   30c6c:	83 c4 10             	add    $0x10,%esp
   30c6f:	6a 0e                	push   $0xe
   30c71:	6a 08                	push   $0x8
   30c73:	68 46 05 03 00       	push   $0x30546
   30c78:	6a 0d                	push   $0xd
   30c7a:	e8 a6 3a 00 00       	call   34725 <InitInterruptDesc>
   30c7f:	83 c4 10             	add    $0x10,%esp
   30c82:	6a 0e                	push   $0xe
   30c84:	6a 08                	push   $0x8
   30c86:	68 4a 05 03 00       	push   $0x3054a
   30c8b:	6a 0e                	push   $0xe
   30c8d:	e8 93 3a 00 00       	call   34725 <InitInterruptDesc>
   30c92:	83 c4 10             	add    $0x10,%esp
   30c95:	6a 0e                	push   $0xe
   30c97:	6a 08                	push   $0x8
   30c99:	68 4e 05 03 00       	push   $0x3054e
   30c9e:	6a 10                	push   $0x10
   30ca0:	e8 80 3a 00 00       	call   34725 <InitInterruptDesc>
   30ca5:	83 c4 10             	add    $0x10,%esp
   30ca8:	6a 0e                	push   $0xe
   30caa:	6a 08                	push   $0x8
   30cac:	68 54 05 03 00       	push   $0x30554
   30cb1:	6a 11                	push   $0x11
   30cb3:	e8 6d 3a 00 00       	call   34725 <InitInterruptDesc>
   30cb8:	83 c4 10             	add    $0x10,%esp
   30cbb:	6a 0e                	push   $0xe
   30cbd:	6a 08                	push   $0x8
   30cbf:	68 58 05 03 00       	push   $0x30558
   30cc4:	6a 12                	push   $0x12
   30cc6:	e8 5a 3a 00 00       	call   34725 <InitInterruptDesc>
   30ccb:	83 c4 10             	add    $0x10,%esp
   30cce:	6a 0e                	push   $0xe
   30cd0:	6a 0e                	push   $0xe
   30cd2:	68 45 06 03 00       	push   $0x30645
   30cd7:	68 90 00 00 00       	push   $0x90
   30cdc:	e8 44 3a 00 00       	call   34725 <InitInterruptDesc>
   30ce1:	83 c4 10             	add    $0x10,%esp
   30ce4:	90                   	nop
   30ce5:	c9                   	leave  
   30ce6:	c3                   	ret    

00030ce7 <test>:
   30ce7:	55                   	push   %ebp
   30ce8:	89 e5                	mov    %esp,%ebp
   30cea:	83 ec 18             	sub    $0x18,%esp
   30ced:	83 ec 0c             	sub    $0xc,%esp
   30cf0:	68 4c 59 03 00       	push   $0x3594c
   30cf5:	e8 8f f7 ff ff       	call   30489 <disp_str>
   30cfa:	83 c4 10             	add    $0x10,%esp
   30cfd:	83 ec 0c             	sub    $0xc,%esp
   30d00:	6a 06                	push   $0x6
   30d02:	e8 b4 fc ff ff       	call   309bb <disp_int>
   30d07:	83 c4 10             	add    $0x10,%esp
   30d0a:	83 ec 0c             	sub    $0xc,%esp
   30d0d:	68 4e 59 03 00       	push   $0x3594e
   30d12:	e8 72 f7 ff ff       	call   30489 <disp_str>
   30d17:	83 c4 10             	add    $0x10,%esp
   30d1a:	c7 05 90 8e 03 00 00 	movl   $0x0,0x38e90
   30d21:	00 00 00 
   30d24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30d2b:	eb 14                	jmp    30d41 <test+0x5a>
   30d2d:	83 ec 0c             	sub    $0xc,%esp
   30d30:	68 e0 56 03 00       	push   $0x356e0
   30d35:	e8 4f f7 ff ff       	call   30489 <disp_str>
   30d3a:	83 c4 10             	add    $0x10,%esp
   30d3d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30d41:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
   30d48:	7e e3                	jle    30d2d <test+0x46>
   30d4a:	c7 05 90 8e 03 00 00 	movl   $0x0,0x38e90
   30d51:	00 00 00 
   30d54:	83 ec 08             	sub    $0x8,%esp
   30d57:	6a 0f                	push   $0xf
   30d59:	68 50 59 03 00       	push   $0x35950
   30d5e:	e8 61 f7 ff ff       	call   304c4 <disp_str_colour>
   30d63:	83 c4 10             	add    $0x10,%esp
   30d66:	83 ec 0c             	sub    $0xc,%esp
   30d69:	68 4e 59 03 00       	push   $0x3594e
   30d6e:	e8 16 f7 ff ff       	call   30489 <disp_str>
   30d73:	83 c4 10             	add    $0x10,%esp
   30d76:	83 ec 0c             	sub    $0xc,%esp
   30d79:	68 89 00 00 00       	push   $0x89
   30d7e:	e8 38 fc ff ff       	call   309bb <disp_int>
   30d83:	83 c4 10             	add    $0x10,%esp
   30d86:	83 ec 0c             	sub    $0xc,%esp
   30d89:	68 4e 59 03 00       	push   $0x3594e
   30d8e:	e8 f6 f6 ff ff       	call   30489 <disp_str>
   30d93:	83 c4 10             	add    $0x10,%esp
   30d96:	83 ec 08             	sub    $0x8,%esp
   30d99:	6a 0f                	push   $0xf
   30d9b:	68 50 59 03 00       	push   $0x35950
   30da0:	e8 1f f7 ff ff       	call   304c4 <disp_str_colour>
   30da5:	83 c4 10             	add    $0x10,%esp
   30da8:	83 ec 08             	sub    $0x8,%esp
   30dab:	6a 74                	push   $0x74
   30dad:	68 50 59 03 00       	push   $0x35950
   30db2:	e8 0d f7 ff ff       	call   304c4 <disp_str_colour>
   30db7:	83 c4 10             	add    $0x10,%esp
   30dba:	83 ec 0c             	sub    $0xc,%esp
   30dbd:	68 4e 59 03 00       	push   $0x3594e
   30dc2:	e8 c2 f6 ff ff       	call   30489 <disp_str>
   30dc7:	83 c4 10             	add    $0x10,%esp
   30dca:	83 ec 08             	sub    $0x8,%esp
   30dcd:	6a 0f                	push   $0xf
   30dcf:	68 60 59 03 00       	push   $0x35960
   30dd4:	e8 eb f6 ff ff       	call   304c4 <disp_str_colour>
   30dd9:	83 c4 10             	add    $0x10,%esp
   30ddc:	83 ec 0c             	sub    $0xc,%esp
   30ddf:	68 89 59 03 00       	push   $0x35989
   30de4:	e8 a0 f6 ff ff       	call   30489 <disp_str>
   30de9:	83 c4 10             	add    $0x10,%esp
   30dec:	83 ec 0c             	sub    $0xc,%esp
   30def:	68 9d 59 03 00       	push   $0x3599d
   30df4:	e8 90 f6 ff ff       	call   30489 <disp_str>
   30df9:	83 c4 10             	add    $0x10,%esp
   30dfc:	83 ec 0c             	sub    $0xc,%esp
   30dff:	6a 17                	push   $0x17
   30e01:	e8 b5 fb ff ff       	call   309bb <disp_int>
   30e06:	83 c4 10             	add    $0x10,%esp
   30e09:	83 ec 0c             	sub    $0xc,%esp
   30e0c:	68 4e 59 03 00       	push   $0x3594e
   30e11:	e8 73 f6 ff ff       	call   30489 <disp_str>
   30e16:	83 c4 10             	add    $0x10,%esp
   30e19:	83 ec 0c             	sub    $0xc,%esp
   30e1c:	68 0a 02 00 00       	push   $0x20a
   30e21:	e8 95 fb ff ff       	call   309bb <disp_int>
   30e26:	83 c4 10             	add    $0x10,%esp
   30e29:	83 ec 0c             	sub    $0xc,%esp
   30e2c:	68 4e 59 03 00       	push   $0x3594e
   30e31:	e8 53 f6 ff ff       	call   30489 <disp_str>
   30e36:	83 c4 10             	add    $0x10,%esp
   30e39:	90                   	nop
   30e3a:	c9                   	leave  
   30e3b:	c3                   	ret    

00030e3c <disp_str_colour3>:
   30e3c:	55                   	push   %ebp
   30e3d:	89 e5                	mov    %esp,%ebp
   30e3f:	90                   	nop
   30e40:	5d                   	pop    %ebp
   30e41:	c3                   	ret    

00030e42 <spurious_irq>:
   30e42:	55                   	push   %ebp
   30e43:	89 e5                	mov    %esp,%ebp
   30e45:	83 ec 08             	sub    $0x8,%esp
   30e48:	83 ec 08             	sub    $0x8,%esp
   30e4b:	6a 0b                	push   $0xb
   30e4d:	68 ac 59 03 00       	push   $0x359ac
   30e52:	e8 6d f6 ff ff       	call   304c4 <disp_str_colour>
   30e57:	83 c4 10             	add    $0x10,%esp
   30e5a:	83 ec 0c             	sub    $0xc,%esp
   30e5d:	ff 75 08             	pushl  0x8(%ebp)
   30e60:	e8 56 fb ff ff       	call   309bb <disp_int>
   30e65:	83 c4 10             	add    $0x10,%esp
   30e68:	a1 80 c4 03 00       	mov    0x3c480,%eax
   30e6d:	83 c0 01             	add    $0x1,%eax
   30e70:	a3 80 c4 03 00       	mov    %eax,0x3c480
   30e75:	83 ec 0c             	sub    $0xc,%esp
   30e78:	68 d3 59 03 00       	push   $0x359d3
   30e7d:	e8 07 f6 ff ff       	call   30489 <disp_str>
   30e82:	83 c4 10             	add    $0x10,%esp
   30e85:	a1 80 c4 03 00       	mov    0x3c480,%eax
   30e8a:	83 ec 0c             	sub    $0xc,%esp
   30e8d:	50                   	push   %eax
   30e8e:	e8 28 fb ff ff       	call   309bb <disp_int>
   30e93:	83 c4 10             	add    $0x10,%esp
   30e96:	83 ec 0c             	sub    $0xc,%esp
   30e99:	68 d5 59 03 00       	push   $0x359d5
   30e9e:	e8 e6 f5 ff ff       	call   30489 <disp_str>
   30ea3:	83 c4 10             	add    $0x10,%esp
   30ea6:	83 ec 08             	sub    $0x8,%esp
   30ea9:	6a 0c                	push   $0xc
   30eab:	68 d8 59 03 00       	push   $0x359d8
   30eb0:	e8 0f f6 ff ff       	call   304c4 <disp_str_colour>
   30eb5:	83 c4 10             	add    $0x10,%esp
   30eb8:	90                   	nop
   30eb9:	c9                   	leave  
   30eba:	c3                   	ret    

00030ebb <kernel_main>:
   30ebb:	55                   	push   %ebp
   30ebc:	89 e5                	mov    %esp,%ebp
   30ebe:	83 ec 28             	sub    $0x28,%esp
   30ec1:	c7 05 80 c4 03 00 00 	movl   $0x0,0x3c480
   30ec8:	00 00 00 
   30ecb:	c7 05 70 bc 03 00 00 	movl   $0x0,0x3bc70
   30ed2:	00 00 00 
   30ed5:	c7 05 94 8e 03 00 00 	movl   $0x0,0x38e94
   30edc:	00 00 00 
   30edf:	c7 45 e8 20 3f 04 00 	movl   $0x43f20,-0x18(%ebp)
   30ee6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   30eed:	e9 90 01 00 00       	jmp    31082 <kernel_main+0x1c7>
   30ef2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30ef5:	69 c0 90 01 00 00    	imul   $0x190,%eax,%eax
   30efb:	05 20 3f 04 00       	add    $0x43f20,%eax
   30f00:	89 45 dc             	mov    %eax,-0x24(%ebp)
   30f03:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
   30f07:	7f 3f                	jg     30f48 <kernel_main+0x8d>
   30f09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30f0c:	c1 e0 03             	shl    $0x3,%eax
   30f0f:	05 40 80 03 00       	add    $0x38040,%eax
   30f14:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30f17:	c7 45 f0 02 12 00 00 	movl   $0x1202,-0x10(%ebp)
   30f1e:	c6 45 ef 01          	movb   $0x1,-0x11(%ebp)
   30f22:	c6 45 ee 01          	movb   $0x1,-0x12(%ebp)
   30f26:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f29:	c7 40 60 0f 00 00 00 	movl   $0xf,0x60(%eax)
   30f30:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f33:	8b 50 60             	mov    0x60(%eax),%edx
   30f36:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f39:	89 50 5c             	mov    %edx,0x5c(%eax)
   30f3c:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f3f:	c7 40 64 01 00 00 00 	movl   $0x1,0x64(%eax)
   30f46:	eb 46                	jmp    30f8e <kernel_main+0xd3>
   30f48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30f4b:	05 fc ff ff 1f       	add    $0x1ffffffc,%eax
   30f50:	c1 e0 03             	shl    $0x3,%eax
   30f53:	05 20 80 03 00       	add    $0x38020,%eax
   30f58:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30f5b:	c7 45 f0 02 02 00 00 	movl   $0x202,-0x10(%ebp)
   30f62:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
   30f66:	c6 45 ee 03          	movb   $0x3,-0x12(%ebp)
   30f6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f6d:	c7 40 60 0a 00 00 00 	movl   $0xa,0x60(%eax)
   30f74:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f77:	8b 50 60             	mov    0x60(%eax),%edx
   30f7a:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f7d:	89 50 5c             	mov    %edx,0x5c(%eax)
   30f80:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30f83:	83 e8 04             	sub    $0x4,%eax
   30f86:	89 c2                	mov    %eax,%edx
   30f88:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f8b:	89 50 64             	mov    %edx,0x64(%eax)
   30f8e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   30f91:	83 c0 09             	add    $0x9,%eax
   30f94:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
   30f9b:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30f9e:	66 89 50 44          	mov    %dx,0x44(%eax)
   30fa2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   30fa5:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30fa8:	89 50 58             	mov    %edx,0x58(%eax)
   30fab:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30fae:	83 c0 46             	add    $0x46,%eax
   30fb1:	83 ec 04             	sub    $0x4,%esp
   30fb4:	6a 08                	push   $0x8
   30fb6:	68 a8 8e 03 00       	push   $0x38ea8
   30fbb:	50                   	push   %eax
   30fbc:	e8 c6 4e 00 00       	call   35e87 <Memcpy>
   30fc1:	83 c4 10             	add    $0x10,%esp
   30fc4:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
   30fc8:	c1 e0 05             	shl    $0x5,%eax
   30fcb:	83 c8 9a             	or     $0xffffff9a,%eax
   30fce:	89 c2                	mov    %eax,%edx
   30fd0:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30fd3:	88 50 4b             	mov    %dl,0x4b(%eax)
   30fd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30fd9:	83 c0 4e             	add    $0x4e,%eax
   30fdc:	83 ec 04             	sub    $0x4,%esp
   30fdf:	6a 08                	push   $0x8
   30fe1:	68 d0 8e 03 00       	push   $0x38ed0
   30fe6:	50                   	push   %eax
   30fe7:	e8 9b 4e 00 00       	call   35e87 <Memcpy>
   30fec:	83 c4 10             	add    $0x10,%esp
   30fef:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
   30ff3:	c1 e0 05             	shl    $0x5,%eax
   30ff6:	83 c8 92             	or     $0xffffff92,%eax
   30ff9:	89 c2                	mov    %eax,%edx
   30ffb:	8b 45 dc             	mov    -0x24(%ebp),%eax
   30ffe:	88 50 53             	mov    %dl,0x53(%eax)
   31001:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
   31005:	83 c8 04             	or     $0x4,%eax
   31008:	0f b6 c0             	movzbl %al,%eax
   3100b:	66 89 45 da          	mov    %ax,-0x26(%ebp)
   3100f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
   31013:	83 c8 0c             	or     $0xc,%eax
   31016:	0f b6 c0             	movzbl %al,%eax
   31019:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
   3101d:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
   31021:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31024:	89 50 34             	mov    %edx,0x34(%eax)
   31027:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   3102b:	8b 45 dc             	mov    -0x24(%ebp),%eax
   3102e:	89 50 0c             	mov    %edx,0xc(%eax)
   31031:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   31035:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31038:	89 50 04             	mov    %edx,0x4(%eax)
   3103b:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   3103f:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31042:	89 50 08             	mov    %edx,0x8(%eax)
   31045:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
   31049:	8b 45 dc             	mov    -0x24(%ebp),%eax
   3104c:	89 50 40             	mov    %edx,0x40(%eax)
   3104f:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31052:	c7 00 39 00 00 00    	movl   $0x39,(%eax)
   31058:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3105b:	8b 00                	mov    (%eax),%eax
   3105d:	89 c2                	mov    %eax,%edx
   3105f:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31062:	89 50 30             	mov    %edx,0x30(%eax)
   31065:	8b 55 e8             	mov    -0x18(%ebp),%edx
   31068:	8b 45 dc             	mov    -0x24(%ebp),%eax
   3106b:	89 50 3c             	mov    %edx,0x3c(%eax)
   3106e:	81 6d e8 00 04 00 00 	subl   $0x400,-0x18(%ebp)
   31075:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31078:	8b 55 f0             	mov    -0x10(%ebp),%edx
   3107b:	89 50 38             	mov    %edx,0x38(%eax)
   3107e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   31082:	83 7d e4 06          	cmpl   $0x6,-0x1c(%ebp)
   31086:	0f 8e 66 fe ff ff    	jle    30ef2 <kernel_main+0x37>
   3108c:	c7 05 a0 92 03 00 20 	movl   $0x43f20,0x392a0
   31093:	3f 04 00 
   31096:	83 ec 04             	sub    $0x4,%esp
   31099:	68 20 03 00 00       	push   $0x320
   3109e:	6a 00                	push   $0x0
   310a0:	68 cc 92 03 00       	push   $0x392cc
   310a5:	e8 0b 4e 00 00       	call   35eb5 <Memset>
   310aa:	83 c4 10             	add    $0x10,%esp
   310ad:	c7 05 c0 92 03 00 cc 	movl   $0x392cc,0x392c0
   310b4:	92 03 00 
   310b7:	a1 c0 92 03 00       	mov    0x392c0,%eax
   310bc:	a3 c4 92 03 00       	mov    %eax,0x392c4
   310c1:	c7 05 c8 92 03 00 00 	movl   $0x0,0x392c8
   310c8:	00 00 00 
   310cb:	c7 05 90 8e 03 00 00 	movl   $0x0,0x38e90
   310d2:	00 00 00 
   310d5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   310dc:	eb 14                	jmp    310f2 <kernel_main+0x237>
   310de:	83 ec 0c             	sub    $0xc,%esp
   310e1:	68 e0 56 03 00       	push   $0x356e0
   310e6:	e8 9e f3 ff ff       	call   30489 <disp_str>
   310eb:	83 c4 10             	add    $0x10,%esp
   310ee:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
   310f2:	81 7d e0 9f 0f 00 00 	cmpl   $0xf9f,-0x20(%ebp)
   310f9:	7e e3                	jle    310de <kernel_main+0x223>
   310fb:	c7 05 90 8e 03 00 00 	movl   $0x0,0x38e90
   31102:	00 00 00 
   31105:	e8 03 43 00 00       	call   3540d <init_keyboard_handler>
   3110a:	e8 7f f5 ff ff       	call   3068e <restart>
   3110f:	eb fe                	jmp    3110f <kernel_main+0x254>

00031111 <TestA>:
   31111:	55                   	push   %ebp
   31112:	89 e5                	mov    %esp,%ebp
   31114:	83 ec 18             	sub    $0x18,%esp
   31117:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3111e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31122:	74 1c                	je     31140 <TestA+0x2f>
   31124:	68 8a 01 00 00       	push   $0x18a
   31129:	68 fd 59 03 00       	push   $0x359fd
   3112e:	68 fd 59 03 00       	push   $0x359fd
   31133:	68 04 5a 03 00       	push   $0x35a04
   31138:	e8 1f 05 00 00       	call   3165c <assertion_failure>
   3113d:	83 c4 10             	add    $0x10,%esp
   31140:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   31144:	77 16                	ja     3115c <TestA+0x4b>
   31146:	e8 3c 0d 00 00       	call   31e87 <get_ticks_ipc>
   3114b:	83 ec 08             	sub    $0x8,%esp
   3114e:	50                   	push   %eax
   3114f:	68 0b 5a 03 00       	push   $0x35a0b
   31154:	e8 b6 01 00 00       	call   3130f <Printf>
   31159:	83 c4 10             	add    $0x10,%esp
   3115c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31160:	eb de                	jmp    31140 <TestA+0x2f>

00031162 <delay>:
   31162:	55                   	push   %ebp
   31163:	89 e5                	mov    %esp,%ebp
   31165:	83 ec 10             	sub    $0x10,%esp
   31168:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   3116f:	eb 2d                	jmp    3119e <delay+0x3c>
   31171:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   31178:	eb 1a                	jmp    31194 <delay+0x32>
   3117a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31181:	eb 04                	jmp    31187 <delay+0x25>
   31183:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31187:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
   3118e:	7e f3                	jle    31183 <delay+0x21>
   31190:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31194:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
   31198:	7e e0                	jle    3117a <delay+0x18>
   3119a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3119e:	8b 45 fc             	mov    -0x4(%ebp),%eax
   311a1:	3b 45 08             	cmp    0x8(%ebp),%eax
   311a4:	7c cb                	jl     31171 <delay+0xf>
   311a6:	90                   	nop
   311a7:	c9                   	leave  
   311a8:	c3                   	ret    

000311a9 <TestB>:
   311a9:	55                   	push   %ebp
   311aa:	89 e5                	mov    %esp,%ebp
   311ac:	83 ec 18             	sub    $0x18,%esp
   311af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   311b6:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   311ba:	77 16                	ja     311d2 <TestB+0x29>
   311bc:	e8 c6 0c 00 00       	call   31e87 <get_ticks_ipc>
   311c1:	83 ec 08             	sub    $0x8,%esp
   311c4:	50                   	push   %eax
   311c5:	68 0e 5a 03 00       	push   $0x35a0e
   311ca:	e8 40 01 00 00       	call   3130f <Printf>
   311cf:	83 c4 10             	add    $0x10,%esp
   311d2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   311d6:	eb de                	jmp    311b6 <TestB+0xd>

000311d8 <TestC>:
   311d8:	55                   	push   %ebp
   311d9:	89 e5                	mov    %esp,%ebp
   311db:	83 ec 18             	sub    $0x18,%esp
   311de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   311e5:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   311e9:	77 1a                	ja     31205 <TestC+0x2d>
   311eb:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
   311f2:	83 ec 08             	sub    $0x8,%esp
   311f5:	ff 75 f0             	pushl  -0x10(%ebp)
   311f8:	68 15 5a 03 00       	push   $0x35a15
   311fd:	e8 0d 01 00 00       	call   3130f <Printf>
   31202:	83 c4 10             	add    $0x10,%esp
   31205:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31209:	eb da                	jmp    311e5 <TestC+0xd>

0003120b <sys_get_ticks>:
   3120b:	55                   	push   %ebp
   3120c:	89 e5                	mov    %esp,%ebp
   3120e:	a1 80 c4 03 00       	mov    0x3c480,%eax
   31213:	5d                   	pop    %ebp
   31214:	c3                   	ret    

00031215 <sys_write>:
   31215:	55                   	push   %ebp
   31216:	89 e5                	mov    %esp,%ebp
   31218:	83 ec 18             	sub    $0x18,%esp
   3121b:	8b 45 10             	mov    0x10(%ebp),%eax
   3121e:	8b 40 64             	mov    0x64(%eax),%eax
   31221:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
   31227:	05 00 96 03 00       	add    $0x39600,%eax
   3122c:	89 45 ec             	mov    %eax,-0x14(%ebp)
   3122f:	8b 45 0c             	mov    0xc(%ebp),%eax
   31232:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31235:	8b 45 08             	mov    0x8(%ebp),%eax
   31238:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3123b:	eb 20                	jmp    3125d <sys_write+0x48>
   3123d:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31240:	0f b6 00             	movzbl (%eax),%eax
   31243:	0f b6 c0             	movzbl %al,%eax
   31246:	83 ec 08             	sub    $0x8,%esp
   31249:	50                   	push   %eax
   3124a:	ff 75 ec             	pushl  -0x14(%ebp)
   3124d:	e8 0b 38 00 00       	call   34a5d <out_char>
   31252:	83 c4 10             	add    $0x10,%esp
   31255:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   31259:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
   3125d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31261:	7f da                	jg     3123d <sys_write+0x28>
   31263:	90                   	nop
   31264:	c9                   	leave  
   31265:	c3                   	ret    

00031266 <milli_delay>:
   31266:	55                   	push   %ebp
   31267:	89 e5                	mov    %esp,%ebp
   31269:	83 ec 18             	sub    $0x18,%esp
   3126c:	e8 16 0c 00 00       	call   31e87 <get_ticks_ipc>
   31271:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31274:	90                   	nop
   31275:	e8 0d 0c 00 00       	call   31e87 <get_ticks_ipc>
   3127a:	2b 45 f4             	sub    -0xc(%ebp),%eax
   3127d:	89 c1                	mov    %eax,%ecx
   3127f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
   31284:	89 c8                	mov    %ecx,%eax
   31286:	f7 ea                	imul   %edx
   31288:	c1 fa 05             	sar    $0x5,%edx
   3128b:	89 c8                	mov    %ecx,%eax
   3128d:	c1 f8 1f             	sar    $0x1f,%eax
   31290:	29 c2                	sub    %eax,%edx
   31292:	89 d0                	mov    %edx,%eax
   31294:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
   3129a:	39 45 08             	cmp    %eax,0x8(%ebp)
   3129d:	77 d6                	ja     31275 <milli_delay+0xf>
   3129f:	90                   	nop
   312a0:	c9                   	leave  
   312a1:	c3                   	ret    

000312a2 <TaskSys>:
   312a2:	55                   	push   %ebp
   312a3:	89 e5                	mov    %esp,%ebp
   312a5:	81 ec 88 00 00 00    	sub    $0x88,%esp
   312ab:	83 ec 04             	sub    $0x4,%esp
   312ae:	6a 68                	push   $0x68
   312b0:	6a 00                	push   $0x0
   312b2:	8d 45 84             	lea    -0x7c(%ebp),%eax
   312b5:	50                   	push   %eax
   312b6:	e8 fa 4b 00 00       	call   35eb5 <Memset>
   312bb:	83 c4 10             	add    $0x10,%esp
   312be:	83 ec 08             	sub    $0x8,%esp
   312c1:	6a 11                	push   $0x11
   312c3:	8d 45 84             	lea    -0x7c(%ebp),%eax
   312c6:	50                   	push   %eax
   312c7:	e8 dc 18 00 00       	call   32ba8 <receive_msg>
   312cc:	83 c4 10             	add    $0x10,%esp
   312cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
   312d2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   312d6:	75 34                	jne    3130c <TaskSys+0x6a>
   312d8:	8b 45 88             	mov    -0x78(%ebp),%eax
   312db:	89 45 f0             	mov    %eax,-0x10(%ebp)
   312de:	8b 45 84             	mov    -0x7c(%ebp),%eax
   312e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
   312e4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
   312e8:	75 1f                	jne    31309 <TaskSys+0x67>
   312ea:	a1 80 c4 03 00       	mov    0x3c480,%eax
   312ef:	89 45 8c             	mov    %eax,-0x74(%ebp)
   312f2:	83 ec 08             	sub    $0x8,%esp
   312f5:	ff 75 ec             	pushl  -0x14(%ebp)
   312f8:	8d 45 84             	lea    -0x7c(%ebp),%eax
   312fb:	50                   	push   %eax
   312fc:	e8 97 18 00 00       	call   32b98 <send_msg>
   31301:	83 c4 10             	add    $0x10,%esp
   31304:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31307:	eb 01                	jmp    3130a <TaskSys+0x68>
   31309:	90                   	nop
   3130a:	eb 9f                	jmp    312ab <TaskSys+0x9>
   3130c:	90                   	nop
   3130d:	c9                   	leave  
   3130e:	c3                   	ret    

0003130f <Printf>:
   3130f:	55                   	push   %ebp
   31310:	89 e5                	mov    %esp,%ebp
   31312:	81 ec 18 01 00 00    	sub    $0x118,%esp
   31318:	83 ec 04             	sub    $0x4,%esp
   3131b:	68 00 01 00 00       	push   $0x100
   31320:	6a 00                	push   $0x0
   31322:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   31328:	50                   	push   %eax
   31329:	e8 87 4b 00 00       	call   35eb5 <Memset>
   3132e:	83 c4 10             	add    $0x10,%esp
   31331:	8d 45 0c             	lea    0xc(%ebp),%eax
   31334:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31337:	8b 45 08             	mov    0x8(%ebp),%eax
   3133a:	83 ec 04             	sub    $0x4,%esp
   3133d:	ff 75 f4             	pushl  -0xc(%ebp)
   31340:	50                   	push   %eax
   31341:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   31347:	50                   	push   %eax
   31348:	e8 1e 00 00 00       	call   3136b <vsprintf>
   3134d:	83 c4 10             	add    $0x10,%esp
   31350:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31353:	83 ec 08             	sub    $0x8,%esp
   31356:	ff 75 f0             	pushl  -0x10(%ebp)
   31359:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   3135f:	50                   	push   %eax
   31360:	e8 13 18 00 00       	call   32b78 <write2>
   31365:	83 c4 10             	add    $0x10,%esp
   31368:	90                   	nop
   31369:	c9                   	leave  
   3136a:	c3                   	ret    

0003136b <vsprintf>:
   3136b:	55                   	push   %ebp
   3136c:	89 e5                	mov    %esp,%ebp
   3136e:	81 ec 68 02 00 00    	sub    $0x268,%esp
   31374:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   3137a:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
   31380:	83 ec 04             	sub    $0x4,%esp
   31383:	6a 40                	push   $0x40
   31385:	6a 00                	push   $0x0
   31387:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   3138d:	50                   	push   %eax
   3138e:	e8 22 4b 00 00       	call   35eb5 <Memset>
   31393:	83 c4 10             	add    $0x10,%esp
   31396:	8b 45 10             	mov    0x10(%ebp),%eax
   31399:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3139c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   313a3:	8b 45 08             	mov    0x8(%ebp),%eax
   313a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   313a9:	e9 53 01 00 00       	jmp    31501 <vsprintf+0x196>
   313ae:	8b 45 0c             	mov    0xc(%ebp),%eax
   313b1:	0f b6 00             	movzbl (%eax),%eax
   313b4:	3c 25                	cmp    $0x25,%al
   313b6:	74 16                	je     313ce <vsprintf+0x63>
   313b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   313bb:	8d 50 01             	lea    0x1(%eax),%edx
   313be:	89 55 f4             	mov    %edx,-0xc(%ebp)
   313c1:	8b 55 0c             	mov    0xc(%ebp),%edx
   313c4:	0f b6 12             	movzbl (%edx),%edx
   313c7:	88 10                	mov    %dl,(%eax)
   313c9:	e9 2f 01 00 00       	jmp    314fd <vsprintf+0x192>
   313ce:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
   313d2:	8b 45 0c             	mov    0xc(%ebp),%eax
   313d5:	0f b6 00             	movzbl (%eax),%eax
   313d8:	0f be c0             	movsbl %al,%eax
   313db:	83 f8 64             	cmp    $0x64,%eax
   313de:	74 26                	je     31406 <vsprintf+0x9b>
   313e0:	83 f8 64             	cmp    $0x64,%eax
   313e3:	7f 0e                	jg     313f3 <vsprintf+0x88>
   313e5:	83 f8 63             	cmp    $0x63,%eax
   313e8:	0f 84 f2 00 00 00    	je     314e0 <vsprintf+0x175>
   313ee:	e9 0a 01 00 00       	jmp    314fd <vsprintf+0x192>
   313f3:	83 f8 73             	cmp    $0x73,%eax
   313f6:	0f 84 b0 00 00 00    	je     314ac <vsprintf+0x141>
   313fc:	83 f8 78             	cmp    $0x78,%eax
   313ff:	74 5d                	je     3145e <vsprintf+0xf3>
   31401:	e9 f7 00 00 00       	jmp    314fd <vsprintf+0x192>
   31406:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31409:	8b 00                	mov    (%eax),%eax
   3140b:	89 45 e8             	mov    %eax,-0x18(%ebp)
   3140e:	83 ec 04             	sub    $0x4,%esp
   31411:	6a 0a                	push   $0xa
   31413:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
   31419:	50                   	push   %eax
   3141a:	ff 75 e8             	pushl  -0x18(%ebp)
   3141d:	e8 a6 0a 00 00       	call   31ec8 <itoa>
   31422:	83 c4 10             	add    $0x10,%esp
   31425:	83 ec 08             	sub    $0x8,%esp
   31428:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   3142e:	50                   	push   %eax
   3142f:	ff 75 f4             	pushl  -0xc(%ebp)
   31432:	e8 9d 4a 00 00       	call   35ed4 <Strcpy>
   31437:	83 c4 10             	add    $0x10,%esp
   3143a:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   3143e:	83 ec 0c             	sub    $0xc,%esp
   31441:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
   31447:	50                   	push   %eax
   31448:	e8 a1 4a 00 00       	call   35eee <Strlen>
   3144d:	83 c4 10             	add    $0x10,%esp
   31450:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31453:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31456:	01 45 f4             	add    %eax,-0xc(%ebp)
   31459:	e9 9f 00 00 00       	jmp    314fd <vsprintf+0x192>
   3145e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31461:	8b 00                	mov    (%eax),%eax
   31463:	83 ec 08             	sub    $0x8,%esp
   31466:	50                   	push   %eax
   31467:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   3146d:	50                   	push   %eax
   3146e:	e8 a2 f4 ff ff       	call   30915 <atoi>
   31473:	83 c4 10             	add    $0x10,%esp
   31476:	83 ec 08             	sub    $0x8,%esp
   31479:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   3147f:	50                   	push   %eax
   31480:	ff 75 f4             	pushl  -0xc(%ebp)
   31483:	e8 4c 4a 00 00       	call   35ed4 <Strcpy>
   31488:	83 c4 10             	add    $0x10,%esp
   3148b:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   3148f:	83 ec 0c             	sub    $0xc,%esp
   31492:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
   31498:	50                   	push   %eax
   31499:	e8 50 4a 00 00       	call   35eee <Strlen>
   3149e:	83 c4 10             	add    $0x10,%esp
   314a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
   314a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
   314a7:	01 45 f4             	add    %eax,-0xc(%ebp)
   314aa:	eb 51                	jmp    314fd <vsprintf+0x192>
   314ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
   314af:	8b 00                	mov    (%eax),%eax
   314b1:	83 ec 08             	sub    $0x8,%esp
   314b4:	50                   	push   %eax
   314b5:	ff 75 f4             	pushl  -0xc(%ebp)
   314b8:	e8 17 4a 00 00       	call   35ed4 <Strcpy>
   314bd:	83 c4 10             	add    $0x10,%esp
   314c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
   314c3:	8b 00                	mov    (%eax),%eax
   314c5:	83 ec 0c             	sub    $0xc,%esp
   314c8:	50                   	push   %eax
   314c9:	e8 20 4a 00 00       	call   35eee <Strlen>
   314ce:	83 c4 10             	add    $0x10,%esp
   314d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
   314d4:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   314d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
   314db:	01 45 f4             	add    %eax,-0xc(%ebp)
   314de:	eb 1d                	jmp    314fd <vsprintf+0x192>
   314e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
   314e3:	0f b6 10             	movzbl (%eax),%edx
   314e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
   314e9:	88 10                	mov    %dl,(%eax)
   314eb:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
   314ef:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
   314f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
   314f9:	01 45 f4             	add    %eax,-0xc(%ebp)
   314fc:	90                   	nop
   314fd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
   31501:	8b 45 0c             	mov    0xc(%ebp),%eax
   31504:	0f b6 00             	movzbl (%eax),%eax
   31507:	84 c0                	test   %al,%al
   31509:	0f 85 9f fe ff ff    	jne    313ae <vsprintf+0x43>
   3150f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31512:	2b 45 08             	sub    0x8(%ebp),%eax
   31515:	c9                   	leave  
   31516:	c3                   	ret    

00031517 <printx>:
   31517:	55                   	push   %ebp
   31518:	89 e5                	mov    %esp,%ebp
   3151a:	81 ec 18 01 00 00    	sub    $0x118,%esp
   31520:	8d 45 0c             	lea    0xc(%ebp),%eax
   31523:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31526:	8b 45 08             	mov    0x8(%ebp),%eax
   31529:	83 ec 04             	sub    $0x4,%esp
   3152c:	ff 75 f4             	pushl  -0xc(%ebp)
   3152f:	50                   	push   %eax
   31530:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   31536:	50                   	push   %eax
   31537:	e8 2f fe ff ff       	call   3136b <vsprintf>
   3153c:	83 c4 10             	add    $0x10,%esp
   3153f:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31542:	83 ec 08             	sub    $0x8,%esp
   31545:	ff 75 f0             	pushl  -0x10(%ebp)
   31548:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
   3154e:	50                   	push   %eax
   3154f:	e8 34 16 00 00       	call   32b88 <write_debug>
   31554:	83 c4 10             	add    $0x10,%esp
   31557:	90                   	nop
   31558:	c9                   	leave  
   31559:	c3                   	ret    

0003155a <sys_printx>:
   3155a:	55                   	push   %ebp
   3155b:	89 e5                	mov    %esp,%ebp
   3155d:	83 ec 28             	sub    $0x28,%esp
   31560:	a1 94 8e 03 00       	mov    0x38e94,%eax
   31565:	85 c0                	test   %eax,%eax
   31567:	75 20                	jne    31589 <sys_printx+0x2f>
   31569:	8b 45 10             	mov    0x10(%ebp),%eax
   3156c:	8b 40 0c             	mov    0xc(%eax),%eax
   3156f:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31572:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31575:	83 ec 08             	sub    $0x8,%esp
   31578:	ff 75 10             	pushl  0x10(%ebp)
   3157b:	50                   	push   %eax
   3157c:	e8 9b 2f 00 00       	call   3451c <Seg2PhyAddrLDT>
   31581:	83 c4 10             	add    $0x10,%esp
   31584:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31587:	eb 19                	jmp    315a2 <sys_printx+0x48>
   31589:	a1 94 8e 03 00       	mov    0x38e94,%eax
   3158e:	85 c0                	test   %eax,%eax
   31590:	74 10                	je     315a2 <sys_printx+0x48>
   31592:	83 ec 0c             	sub    $0xc,%esp
   31595:	6a 30                	push   $0x30
   31597:	e8 3f 2f 00 00       	call   344db <Seg2PhyAddr>
   3159c:	83 c4 10             	add    $0x10,%esp
   3159f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   315a2:	8b 55 08             	mov    0x8(%ebp),%edx
   315a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
   315a8:	01 d0                	add    %edx,%eax
   315aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
   315ad:	8b 45 10             	mov    0x10(%ebp),%eax
   315b0:	8b 40 64             	mov    0x64(%eax),%eax
   315b3:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
   315b9:	05 00 96 03 00       	add    $0x39600,%eax
   315be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   315c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
   315c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
   315c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
   315ca:	0f b6 00             	movzbl (%eax),%eax
   315cd:	88 45 e3             	mov    %al,-0x1d(%ebp)
   315d0:	eb 3a                	jmp    3160c <sys_printx+0xb2>
   315d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
   315d5:	0f b6 00             	movzbl (%eax),%eax
   315d8:	3c 3b                	cmp    $0x3b,%al
   315da:	74 0a                	je     315e6 <sys_printx+0x8c>
   315dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
   315df:	0f b6 00             	movzbl (%eax),%eax
   315e2:	3c 3a                	cmp    $0x3a,%al
   315e4:	75 06                	jne    315ec <sys_printx+0x92>
   315e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   315ea:	eb 20                	jmp    3160c <sys_printx+0xb2>
   315ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
   315ef:	0f b6 00             	movzbl (%eax),%eax
   315f2:	0f b6 c0             	movzbl %al,%eax
   315f5:	83 ec 08             	sub    $0x8,%esp
   315f8:	50                   	push   %eax
   315f9:	ff 75 e4             	pushl  -0x1c(%ebp)
   315fc:	e8 5c 34 00 00       	call   34a5d <out_char>
   31601:	83 c4 10             	add    $0x10,%esp
   31604:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   31608:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
   3160c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   31610:	7f c0                	jg     315d2 <sys_printx+0x78>
   31612:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
   31616:	75 11                	jne    31629 <sys_printx+0xcf>
   31618:	a1 94 8e 03 00       	mov    0x38e94,%eax
   3161d:	85 c0                	test   %eax,%eax
   3161f:	74 15                	je     31636 <sys_printx+0xdc>
   31621:	e8 dc f0 ff ff       	call   30702 <disable_int>
   31626:	f4                   	hlt    
   31627:	eb 0d                	jmp    31636 <sys_printx+0xdc>
   31629:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
   3162d:	75 07                	jne    31636 <sys_printx+0xdc>
   3162f:	e8 ce f0 ff ff       	call   30702 <disable_int>
   31634:	f4                   	hlt    
   31635:	90                   	nop
   31636:	90                   	nop
   31637:	c9                   	leave  
   31638:	c3                   	ret    

00031639 <spin>:
   31639:	55                   	push   %ebp
   3163a:	89 e5                	mov    %esp,%ebp
   3163c:	eb fe                	jmp    3163c <spin+0x3>

0003163e <panic>:
   3163e:	55                   	push   %ebp
   3163f:	89 e5                	mov    %esp,%ebp
   31641:	83 ec 08             	sub    $0x8,%esp
   31644:	83 ec 04             	sub    $0x4,%esp
   31647:	ff 75 08             	pushl  0x8(%ebp)
   3164a:	6a 3a                	push   $0x3a
   3164c:	68 22 5a 03 00       	push   $0x35a22
   31651:	e8 c1 fe ff ff       	call   31517 <printx>
   31656:	83 c4 10             	add    $0x10,%esp
   31659:	90                   	nop
   3165a:	c9                   	leave  
   3165b:	c3                   	ret    

0003165c <assertion_failure>:
   3165c:	55                   	push   %ebp
   3165d:	89 e5                	mov    %esp,%ebp
   3165f:	83 ec 08             	sub    $0x8,%esp
   31662:	83 ec 08             	sub    $0x8,%esp
   31665:	68 08 21 00 00       	push   $0x2108
   3166a:	ff 75 10             	pushl  0x10(%ebp)
   3166d:	ff 75 0c             	pushl  0xc(%ebp)
   31670:	ff 75 08             	pushl  0x8(%ebp)
   31673:	6a 3b                	push   $0x3b
   31675:	68 28 5a 03 00       	push   $0x35a28
   3167a:	e8 98 fe ff ff       	call   31517 <printx>
   3167f:	83 c4 20             	add    $0x20,%esp
   31682:	83 ec 0c             	sub    $0xc,%esp
   31685:	68 5b 5a 03 00       	push   $0x35a5b
   3168a:	e8 aa ff ff ff       	call   31639 <spin>
   3168f:	83 c4 10             	add    $0x10,%esp
   31692:	90                   	nop
   31693:	c9                   	leave  
   31694:	c3                   	ret    

00031695 <dead_lock>:
   31695:	55                   	push   %ebp
   31696:	89 e5                	mov    %esp,%ebp
   31698:	83 ec 18             	sub    $0x18,%esp
   3169b:	83 ec 0c             	sub    $0xc,%esp
   3169e:	ff 75 08             	pushl  0x8(%ebp)
   316a1:	e8 8d 2d 00 00       	call   34433 <pid2proc>
   316a6:	83 c4 10             	add    $0x10,%esp
   316a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
   316ac:	83 ec 0c             	sub    $0xc,%esp
   316af:	ff 75 0c             	pushl  0xc(%ebp)
   316b2:	e8 7c 2d 00 00       	call   34433 <pid2proc>
   316b7:	83 c4 10             	add    $0x10,%esp
   316ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
   316bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
   316c0:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
   316c7:	3c 01                	cmp    $0x1,%al
   316c9:	75 5a                	jne    31725 <dead_lock+0x90>
   316cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
   316ce:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
   316d4:	39 45 08             	cmp    %eax,0x8(%ebp)
   316d7:	75 32                	jne    3170b <dead_lock+0x76>
   316d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
   316dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
   316df:	8b 45 f0             	mov    -0x10(%ebp),%eax
   316e2:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
   316e8:	83 ec 0c             	sub    $0xc,%esp
   316eb:	50                   	push   %eax
   316ec:	e8 42 2d 00 00       	call   34433 <pid2proc>
   316f1:	83 c4 10             	add    $0x10,%esp
   316f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
   316f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
   316fa:	8b 50 58             	mov    0x58(%eax),%edx
   316fd:	8b 45 08             	mov    0x8(%ebp),%eax
   31700:	39 c2                	cmp    %eax,%edx
   31702:	75 db                	jne    316df <dead_lock+0x4a>
   31704:	b8 01 00 00 00       	mov    $0x1,%eax
   31709:	eb 20                	jmp    3172b <dead_lock+0x96>
   3170b:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3170e:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
   31714:	83 ec 0c             	sub    $0xc,%esp
   31717:	50                   	push   %eax
   31718:	e8 16 2d 00 00       	call   34433 <pid2proc>
   3171d:	83 c4 10             	add    $0x10,%esp
   31720:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31723:	eb 98                	jmp    316bd <dead_lock+0x28>
   31725:	90                   	nop
   31726:	b8 00 00 00 00       	mov    $0x0,%eax
   3172b:	c9                   	leave  
   3172c:	c3                   	ret    

0003172d <sys_send_msg>:
   3172d:	55                   	push   %ebp
   3172e:	89 e5                	mov    %esp,%ebp
   31730:	83 ec 38             	sub    $0x38,%esp
   31733:	83 ec 0c             	sub    $0xc,%esp
   31736:	ff 75 0c             	pushl  0xc(%ebp)
   31739:	e8 f5 2c 00 00       	call   34433 <pid2proc>
   3173e:	83 c4 10             	add    $0x10,%esp
   31741:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31744:	83 ec 0c             	sub    $0xc,%esp
   31747:	ff 75 10             	pushl  0x10(%ebp)
   3174a:	e8 00 2d 00 00       	call   3444f <proc2pid>
   3174f:	83 c4 10             	add    $0x10,%esp
   31752:	89 45 e8             	mov    %eax,-0x18(%ebp)
   31755:	8b 45 08             	mov    0x8(%ebp),%eax
   31758:	8b 55 e8             	mov    -0x18(%ebp),%edx
   3175b:	89 10                	mov    %edx,(%eax)
   3175d:	83 ec 08             	sub    $0x8,%esp
   31760:	ff 75 0c             	pushl  0xc(%ebp)
   31763:	ff 75 e8             	pushl  -0x18(%ebp)
   31766:	e8 2a ff ff ff       	call   31695 <dead_lock>
   3176b:	83 c4 10             	add    $0x10,%esp
   3176e:	83 f8 01             	cmp    $0x1,%eax
   31771:	75 10                	jne    31783 <sys_send_msg+0x56>
   31773:	83 ec 0c             	sub    $0xc,%esp
   31776:	68 67 5a 03 00       	push   $0x35a67
   3177b:	e8 be fe ff ff       	call   3163e <panic>
   31780:	83 c4 10             	add    $0x10,%esp
   31783:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31786:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
   3178d:	3c 02                	cmp    $0x2,%al
   3178f:	0f 85 92 01 00 00    	jne    31927 <sys_send_msg+0x1fa>
   31795:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31798:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
   3179e:	39 45 e8             	cmp    %eax,-0x18(%ebp)
   317a1:	74 12                	je     317b5 <sys_send_msg+0x88>
   317a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
   317a6:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
   317ac:	83 f8 11             	cmp    $0x11,%eax
   317af:	0f 85 72 01 00 00    	jne    31927 <sys_send_msg+0x1fa>
   317b5:	8b 45 10             	mov    0x10(%ebp),%eax
   317b8:	8b 40 0c             	mov    0xc(%eax),%eax
   317bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   317be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   317c1:	83 ec 08             	sub    $0x8,%esp
   317c4:	ff 75 10             	pushl  0x10(%ebp)
   317c7:	50                   	push   %eax
   317c8:	e8 4f 2d 00 00       	call   3451c <Seg2PhyAddrLDT>
   317cd:	83 c4 10             	add    $0x10,%esp
   317d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
   317d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
   317d6:	6b d0 68             	imul   $0x68,%eax,%edx
   317d9:	8b 45 08             	mov    0x8(%ebp),%eax
   317dc:	01 d0                	add    %edx,%eax
   317de:	89 45 dc             	mov    %eax,-0x24(%ebp)
   317e1:	c7 45 d8 68 00 00 00 	movl   $0x68,-0x28(%ebp)
   317e8:	8b 55 dc             	mov    -0x24(%ebp),%edx
   317eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
   317ee:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
   317f4:	83 ec 04             	sub    $0x4,%esp
   317f7:	ff 75 d8             	pushl  -0x28(%ebp)
   317fa:	52                   	push   %edx
   317fb:	50                   	push   %eax
   317fc:	e8 86 46 00 00       	call   35e87 <Memcpy>
   31801:	83 c4 10             	add    $0x10,%esp
   31804:	8b 45 10             	mov    0x10(%ebp),%eax
   31807:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
   3180e:	00 00 00 
   31811:	8b 45 10             	mov    0x10(%ebp),%eax
   31814:	c7 80 84 01 00 00 00 	movl   $0x0,0x184(%eax)
   3181b:	00 00 00 
   3181e:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31821:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
   31828:	00 00 00 
   3182b:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3182e:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
   31835:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31838:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
   3183f:	00 00 00 
   31842:	83 ec 0c             	sub    $0xc,%esp
   31845:	ff 75 ec             	pushl  -0x14(%ebp)
   31848:	e8 30 06 00 00       	call   31e7d <unblock>
   3184d:	83 c4 10             	add    $0x10,%esp
   31850:	8b 45 10             	mov    0x10(%ebp),%eax
   31853:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
   31859:	85 c0                	test   %eax,%eax
   3185b:	74 1c                	je     31879 <sys_send_msg+0x14c>
   3185d:	68 27 03 00 00       	push   $0x327
   31862:	68 fd 59 03 00       	push   $0x359fd
   31867:	68 fd 59 03 00       	push   $0x359fd
   3186c:	68 72 5a 03 00       	push   $0x35a72
   31871:	e8 e6 fd ff ff       	call   3165c <assertion_failure>
   31876:	83 c4 10             	add    $0x10,%esp
   31879:	8b 45 10             	mov    0x10(%ebp),%eax
   3187c:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
   31882:	85 c0                	test   %eax,%eax
   31884:	74 1c                	je     318a2 <sys_send_msg+0x175>
   31886:	68 28 03 00 00       	push   $0x328
   3188b:	68 fd 59 03 00       	push   $0x359fd
   31890:	68 fd 59 03 00       	push   $0x359fd
   31895:	68 85 5a 03 00       	push   $0x35a85
   3189a:	e8 bd fd ff ff       	call   3165c <assertion_failure>
   3189f:	83 c4 10             	add    $0x10,%esp
   318a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
   318a5:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
   318ab:	85 c0                	test   %eax,%eax
   318ad:	74 1c                	je     318cb <sys_send_msg+0x19e>
   318af:	68 29 03 00 00       	push   $0x329
   318b4:	68 fd 59 03 00       	push   $0x359fd
   318b9:	68 fd 59 03 00       	push   $0x359fd
   318be:	68 9c 5a 03 00       	push   $0x35a9c
   318c3:	e8 94 fd ff ff       	call   3165c <assertion_failure>
   318c8:	83 c4 10             	add    $0x10,%esp
   318cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
   318ce:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
   318d5:	84 c0                	test   %al,%al
   318d7:	74 1c                	je     318f5 <sys_send_msg+0x1c8>
   318d9:	68 2a 03 00 00       	push   $0x32a
   318de:	68 fd 59 03 00       	push   $0x359fd
   318e3:	68 fd 59 03 00       	push   $0x359fd
   318e8:	68 b1 5a 03 00       	push   $0x35ab1
   318ed:	e8 6a fd ff ff       	call   3165c <assertion_failure>
   318f2:	83 c4 10             	add    $0x10,%esp
   318f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
   318f8:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
   318fe:	85 c0                	test   %eax,%eax
   31900:	0f 84 69 01 00 00    	je     31a6f <sys_send_msg+0x342>
   31906:	68 2b 03 00 00       	push   $0x32b
   3190b:	68 fd 59 03 00       	push   $0x359fd
   31910:	68 fd 59 03 00       	push   $0x359fd
   31915:	68 c7 5a 03 00       	push   $0x35ac7
   3191a:	e8 3d fd ff ff       	call   3165c <assertion_failure>
   3191f:	83 c4 10             	add    $0x10,%esp
   31922:	e9 48 01 00 00       	jmp    31a6f <sys_send_msg+0x342>
   31927:	8b 45 10             	mov    0x10(%ebp),%eax
   3192a:	8b 55 08             	mov    0x8(%ebp),%edx
   3192d:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
   31933:	8b 45 10             	mov    0x10(%ebp),%eax
   31936:	8b 55 0c             	mov    0xc(%ebp),%edx
   31939:	89 90 84 01 00 00    	mov    %edx,0x184(%eax)
   3193f:	8b 45 10             	mov    0x10(%ebp),%eax
   31942:	c6 80 7c 01 00 00 01 	movb   $0x1,0x17c(%eax)
   31949:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3194c:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
   31952:	85 c0                	test   %eax,%eax
   31954:	75 1b                	jne    31971 <sys_send_msg+0x244>
   31956:	8b 45 e8             	mov    -0x18(%ebp),%eax
   31959:	89 45 d0             	mov    %eax,-0x30(%ebp)
   3195c:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
   31963:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31966:	8d 55 d0             	lea    -0x30(%ebp),%edx
   31969:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
   3196f:	eb 47                	jmp    319b8 <sys_send_msg+0x28b>
   31971:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31974:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
   3197a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3197d:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31980:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
   31986:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31989:	eb 0f                	jmp    3199a <sys_send_msg+0x26d>
   3198b:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3198e:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31991:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31994:	8b 40 04             	mov    0x4(%eax),%eax
   31997:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3199a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   3199e:	75 eb                	jne    3198b <sys_send_msg+0x25e>
   319a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
   319a3:	8b 40 04             	mov    0x4(%eax),%eax
   319a6:	8b 55 e8             	mov    -0x18(%ebp),%edx
   319a9:	89 10                	mov    %edx,(%eax)
   319ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
   319ae:	8b 40 04             	mov    0x4(%eax),%eax
   319b1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   319b8:	8b 45 10             	mov    0x10(%ebp),%eax
   319bb:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
   319c2:	3c 01                	cmp    $0x1,%al
   319c4:	74 1c                	je     319e2 <sys_send_msg+0x2b5>
   319c6:	68 59 03 00 00       	push   $0x359
   319cb:	68 fd 59 03 00       	push   $0x359fd
   319d0:	68 fd 59 03 00       	push   $0x359fd
   319d5:	68 e5 5a 03 00       	push   $0x35ae5
   319da:	e8 7d fc ff ff       	call   3165c <assertion_failure>
   319df:	83 c4 10             	add    $0x10,%esp
   319e2:	8b 45 10             	mov    0x10(%ebp),%eax
   319e5:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
   319eb:	39 45 0c             	cmp    %eax,0xc(%ebp)
   319ee:	74 1c                	je     31a0c <sys_send_msg+0x2df>
   319f0:	68 5a 03 00 00       	push   $0x35a
   319f5:	68 fd 59 03 00       	push   $0x359fd
   319fa:	68 fd 59 03 00       	push   $0x359fd
   319ff:	68 00 5b 03 00       	push   $0x35b00
   31a04:	e8 53 fc ff ff       	call   3165c <assertion_failure>
   31a09:	83 c4 10             	add    $0x10,%esp
   31a0c:	8b 45 10             	mov    0x10(%ebp),%eax
   31a0f:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
   31a15:	39 45 08             	cmp    %eax,0x8(%ebp)
   31a18:	74 1c                	je     31a36 <sys_send_msg+0x309>
   31a1a:	68 5b 03 00 00       	push   $0x35b
   31a1f:	68 fd 59 03 00       	push   $0x359fd
   31a24:	68 fd 59 03 00       	push   $0x359fd
   31a29:	68 22 5b 03 00       	push   $0x35b22
   31a2e:	e8 29 fc ff ff       	call   3165c <assertion_failure>
   31a33:	83 c4 10             	add    $0x10,%esp
   31a36:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31a39:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
   31a3f:	85 c0                	test   %eax,%eax
   31a41:	75 1c                	jne    31a5f <sys_send_msg+0x332>
   31a43:	68 5d 03 00 00       	push   $0x35d
   31a48:	68 fd 59 03 00       	push   $0x359fd
   31a4d:	68 fd 59 03 00       	push   $0x359fd
   31a52:	68 37 5b 03 00       	push   $0x35b37
   31a57:	e8 00 fc ff ff       	call   3165c <assertion_failure>
   31a5c:	83 c4 10             	add    $0x10,%esp
   31a5f:	83 ec 0c             	sub    $0xc,%esp
   31a62:	ff 75 10             	pushl  0x10(%ebp)
   31a65:	e8 01 04 00 00       	call   31e6b <block>
   31a6a:	83 c4 10             	add    $0x10,%esp
   31a6d:	eb 01                	jmp    31a70 <sys_send_msg+0x343>
   31a6f:	90                   	nop
   31a70:	b8 00 00 00 00       	mov    $0x0,%eax
   31a75:	c9                   	leave  
   31a76:	c3                   	ret    

00031a77 <sys_receive_msg>:
   31a77:	55                   	push   %ebp
   31a78:	89 e5                	mov    %esp,%ebp
   31a7a:	83 ec 38             	sub    $0x38,%esp
   31a7d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31a84:	83 ec 0c             	sub    $0xc,%esp
   31a87:	ff 75 0c             	pushl  0xc(%ebp)
   31a8a:	e8 a4 29 00 00       	call   34433 <pid2proc>
   31a8f:	83 c4 10             	add    $0x10,%esp
   31a92:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   31a95:	83 ec 0c             	sub    $0xc,%esp
   31a98:	ff 75 10             	pushl  0x10(%ebp)
   31a9b:	e8 af 29 00 00       	call   3444f <proc2pid>
   31aa0:	83 c4 10             	add    $0x10,%esp
   31aa3:	89 45 e0             	mov    %eax,-0x20(%ebp)
   31aa6:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
   31aaa:	75 40                	jne    31aec <sys_receive_msg+0x75>
   31aac:	8b 45 10             	mov    0x10(%ebp),%eax
   31aaf:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
   31ab5:	85 c0                	test   %eax,%eax
   31ab7:	0f 84 c9 00 00 00    	je     31b86 <sys_receive_msg+0x10f>
   31abd:	8b 45 10             	mov    0x10(%ebp),%eax
   31ac0:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
   31ac6:	8b 00                	mov    (%eax),%eax
   31ac8:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31acb:	8b 45 10             	mov    0x10(%ebp),%eax
   31ace:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
   31ad4:	8b 50 04             	mov    0x4(%eax),%edx
   31ad7:	8b 45 10             	mov    0x10(%ebp),%eax
   31ada:	89 90 8c 01 00 00    	mov    %edx,0x18c(%eax)
   31ae0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
   31ae7:	e9 9a 00 00 00       	jmp    31b86 <sys_receive_msg+0x10f>
   31aec:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   31af0:	0f 88 90 00 00 00    	js     31b86 <sys_receive_msg+0x10f>
   31af6:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
   31afa:	0f 8f 86 00 00 00    	jg     31b86 <sys_receive_msg+0x10f>
   31b00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31b03:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
   31b0a:	3c 01                	cmp    $0x1,%al
   31b0c:	75 78                	jne    31b86 <sys_receive_msg+0x10f>
   31b0e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31b11:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
   31b17:	83 f8 11             	cmp    $0x11,%eax
   31b1a:	74 0e                	je     31b2a <sys_receive_msg+0xb3>
   31b1c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   31b1f:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
   31b25:	39 45 e0             	cmp    %eax,-0x20(%ebp)
   31b28:	75 5c                	jne    31b86 <sys_receive_msg+0x10f>
   31b2a:	8b 45 10             	mov    0x10(%ebp),%eax
   31b2d:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
   31b33:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31b36:	8b 45 10             	mov    0x10(%ebp),%eax
   31b39:	8b 80 8c 01 00 00    	mov    0x18c(%eax),%eax
   31b3f:	89 45 e8             	mov    %eax,-0x18(%ebp)
   31b42:	eb 24                	jmp    31b68 <sys_receive_msg+0xf1>
   31b44:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31b47:	8b 10                	mov    (%eax),%edx
   31b49:	8b 45 0c             	mov    0xc(%ebp),%eax
   31b4c:	39 c2                	cmp    %eax,%edx
   31b4e:	75 09                	jne    31b59 <sys_receive_msg+0xe2>
   31b50:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
   31b57:	eb 15                	jmp    31b6e <sys_receive_msg+0xf7>
   31b59:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31b5c:	89 45 e8             	mov    %eax,-0x18(%ebp)
   31b5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31b62:	8b 40 04             	mov    0x4(%eax),%eax
   31b65:	89 45 ec             	mov    %eax,-0x14(%ebp)
   31b68:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   31b6c:	75 d6                	jne    31b44 <sys_receive_msg+0xcd>
   31b6e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   31b72:	75 12                	jne    31b86 <sys_receive_msg+0x10f>
   31b74:	8b 45 ec             	mov    -0x14(%ebp),%eax
   31b77:	8b 50 04             	mov    0x4(%eax),%edx
   31b7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
   31b7d:	89 50 04             	mov    %edx,0x4(%eax)
   31b80:	8b 45 0c             	mov    0xc(%ebp),%eax
   31b83:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31b86:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   31b8a:	0f 85 83 01 00 00    	jne    31d13 <sys_receive_msg+0x29c>
   31b90:	83 ec 0c             	sub    $0xc,%esp
   31b93:	ff 75 f0             	pushl  -0x10(%ebp)
   31b96:	e8 98 28 00 00       	call   34433 <pid2proc>
   31b9b:	83 c4 10             	add    $0x10,%esp
   31b9e:	89 45 dc             	mov    %eax,-0x24(%ebp)
   31ba1:	8b 45 10             	mov    0x10(%ebp),%eax
   31ba4:	8b 40 0c             	mov    0xc(%eax),%eax
   31ba7:	89 45 d8             	mov    %eax,-0x28(%ebp)
   31baa:	8b 45 d8             	mov    -0x28(%ebp),%eax
   31bad:	83 ec 08             	sub    $0x8,%esp
   31bb0:	ff 75 10             	pushl  0x10(%ebp)
   31bb3:	50                   	push   %eax
   31bb4:	e8 63 29 00 00       	call   3451c <Seg2PhyAddrLDT>
   31bb9:	83 c4 10             	add    $0x10,%esp
   31bbc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   31bbf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
   31bc2:	6b d0 68             	imul   $0x68,%eax,%edx
   31bc5:	8b 45 08             	mov    0x8(%ebp),%eax
   31bc8:	01 d0                	add    %edx,%eax
   31bca:	89 45 d0             	mov    %eax,-0x30(%ebp)
   31bcd:	c7 45 cc 68 00 00 00 	movl   $0x68,-0x34(%ebp)
   31bd4:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31bd7:	8b 90 80 01 00 00    	mov    0x180(%eax),%edx
   31bdd:	8b 45 d0             	mov    -0x30(%ebp),%eax
   31be0:	83 ec 04             	sub    $0x4,%esp
   31be3:	ff 75 cc             	pushl  -0x34(%ebp)
   31be6:	52                   	push   %edx
   31be7:	50                   	push   %eax
   31be8:	e8 9a 42 00 00       	call   35e87 <Memcpy>
   31bed:	83 c4 10             	add    $0x10,%esp
   31bf0:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31bf3:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
   31bfa:	00 00 00 
   31bfd:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31c00:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
   31c07:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31c0a:	c7 80 84 01 00 00 00 	movl   $0x0,0x184(%eax)
   31c11:	00 00 00 
   31c14:	8b 45 10             	mov    0x10(%ebp),%eax
   31c17:	c7 80 80 01 00 00 00 	movl   $0x0,0x180(%eax)
   31c1e:	00 00 00 
   31c21:	8b 45 10             	mov    0x10(%ebp),%eax
   31c24:	c7 80 88 01 00 00 00 	movl   $0x0,0x188(%eax)
   31c2b:	00 00 00 
   31c2e:	83 ec 0c             	sub    $0xc,%esp
   31c31:	ff 75 dc             	pushl  -0x24(%ebp)
   31c34:	e8 44 02 00 00       	call   31e7d <unblock>
   31c39:	83 c4 10             	add    $0x10,%esp
   31c3c:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31c3f:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
   31c45:	85 c0                	test   %eax,%eax
   31c47:	74 1c                	je     31c65 <sys_receive_msg+0x1ee>
   31c49:	68 b2 03 00 00       	push   $0x3b2
   31c4e:	68 fd 59 03 00       	push   $0x359fd
   31c53:	68 fd 59 03 00       	push   $0x359fd
   31c58:	68 4f 5b 03 00       	push   $0x35b4f
   31c5d:	e8 fa f9 ff ff       	call   3165c <assertion_failure>
   31c62:	83 c4 10             	add    $0x10,%esp
   31c65:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31c68:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
   31c6f:	84 c0                	test   %al,%al
   31c71:	74 1c                	je     31c8f <sys_receive_msg+0x218>
   31c73:	68 b3 03 00 00       	push   $0x3b3
   31c78:	68 fd 59 03 00       	push   $0x359fd
   31c7d:	68 fd 59 03 00       	push   $0x359fd
   31c82:	68 68 5b 03 00       	push   $0x35b68
   31c87:	e8 d0 f9 ff ff       	call   3165c <assertion_failure>
   31c8c:	83 c4 10             	add    $0x10,%esp
   31c8f:	8b 45 dc             	mov    -0x24(%ebp),%eax
   31c92:	8b 80 84 01 00 00    	mov    0x184(%eax),%eax
   31c98:	85 c0                	test   %eax,%eax
   31c9a:	74 1c                	je     31cb8 <sys_receive_msg+0x241>
   31c9c:	68 b4 03 00 00       	push   $0x3b4
   31ca1:	68 fd 59 03 00       	push   $0x359fd
   31ca6:	68 fd 59 03 00       	push   $0x359fd
   31cab:	68 87 5b 03 00       	push   $0x35b87
   31cb0:	e8 a7 f9 ff ff       	call   3165c <assertion_failure>
   31cb5:	83 c4 10             	add    $0x10,%esp
   31cb8:	8b 45 10             	mov    0x10(%ebp),%eax
   31cbb:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
   31cc1:	85 c0                	test   %eax,%eax
   31cc3:	74 1c                	je     31ce1 <sys_receive_msg+0x26a>
   31cc5:	68 b6 03 00 00       	push   $0x3b6
   31cca:	68 fd 59 03 00       	push   $0x359fd
   31ccf:	68 fd 59 03 00       	push   $0x359fd
   31cd4:	68 9c 5a 03 00       	push   $0x35a9c
   31cd9:	e8 7e f9 ff ff       	call   3165c <assertion_failure>
   31cde:	83 c4 10             	add    $0x10,%esp
   31ce1:	8b 45 10             	mov    0x10(%ebp),%eax
   31ce4:	8b 80 88 01 00 00    	mov    0x188(%eax),%eax
   31cea:	85 c0                	test   %eax,%eax
   31cec:	0f 84 ba 00 00 00    	je     31dac <sys_receive_msg+0x335>
   31cf2:	68 b7 03 00 00       	push   $0x3b7
   31cf7:	68 fd 59 03 00       	push   $0x359fd
   31cfc:	68 fd 59 03 00       	push   $0x359fd
   31d01:	68 c7 5a 03 00       	push   $0x35ac7
   31d06:	e8 51 f9 ff ff       	call   3165c <assertion_failure>
   31d0b:	83 c4 10             	add    $0x10,%esp
   31d0e:	e9 99 00 00 00       	jmp    31dac <sys_receive_msg+0x335>
   31d13:	8b 45 10             	mov    0x10(%ebp),%eax
   31d16:	c6 80 7c 01 00 00 02 	movb   $0x2,0x17c(%eax)
   31d1d:	8b 45 10             	mov    0x10(%ebp),%eax
   31d20:	8b 55 08             	mov    0x8(%ebp),%edx
   31d23:	89 90 80 01 00 00    	mov    %edx,0x180(%eax)
   31d29:	83 7d 0c 11          	cmpl   $0x11,0xc(%ebp)
   31d2d:	75 0f                	jne    31d3e <sys_receive_msg+0x2c7>
   31d2f:	8b 45 10             	mov    0x10(%ebp),%eax
   31d32:	c7 80 88 01 00 00 11 	movl   $0x11,0x188(%eax)
   31d39:	00 00 00 
   31d3c:	eb 0c                	jmp    31d4a <sys_receive_msg+0x2d3>
   31d3e:	8b 45 10             	mov    0x10(%ebp),%eax
   31d41:	8b 55 0c             	mov    0xc(%ebp),%edx
   31d44:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
   31d4a:	8b 45 10             	mov    0x10(%ebp),%eax
   31d4d:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
   31d54:	3c 02                	cmp    $0x2,%al
   31d56:	74 1c                	je     31d74 <sys_receive_msg+0x2fd>
   31d58:	68 c4 03 00 00       	push   $0x3c4
   31d5d:	68 fd 59 03 00       	push   $0x359fd
   31d62:	68 fd 59 03 00       	push   $0x359fd
   31d67:	68 a3 5b 03 00       	push   $0x35ba3
   31d6c:	e8 eb f8 ff ff       	call   3165c <assertion_failure>
   31d71:	83 c4 10             	add    $0x10,%esp
   31d74:	8b 45 10             	mov    0x10(%ebp),%eax
   31d77:	8b 80 80 01 00 00    	mov    0x180(%eax),%eax
   31d7d:	39 45 08             	cmp    %eax,0x8(%ebp)
   31d80:	74 1c                	je     31d9e <sys_receive_msg+0x327>
   31d82:	68 c5 03 00 00       	push   $0x3c5
   31d87:	68 fd 59 03 00       	push   $0x359fd
   31d8c:	68 fd 59 03 00       	push   $0x359fd
   31d91:	68 c1 5b 03 00       	push   $0x35bc1
   31d96:	e8 c1 f8 ff ff       	call   3165c <assertion_failure>
   31d9b:	83 c4 10             	add    $0x10,%esp
   31d9e:	83 ec 0c             	sub    $0xc,%esp
   31da1:	ff 75 10             	pushl  0x10(%ebp)
   31da4:	e8 c2 00 00 00       	call   31e6b <block>
   31da9:	83 c4 10             	add    $0x10,%esp
   31dac:	b8 00 00 00 00       	mov    $0x0,%eax
   31db1:	c9                   	leave  
   31db2:	c3                   	ret    

00031db3 <send_rec>:
   31db3:	55                   	push   %ebp
   31db4:	89 e5                	mov    %esp,%ebp
   31db6:	83 ec 18             	sub    $0x18,%esp
   31db9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
   31dbd:	74 26                	je     31de5 <send_rec+0x32>
   31dbf:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   31dc3:	74 36                	je     31dfb <send_rec+0x48>
   31dc5:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   31dc9:	0f 85 82 00 00 00    	jne    31e51 <send_rec+0x9e>
   31dcf:	83 ec 08             	sub    $0x8,%esp
   31dd2:	ff 75 10             	pushl  0x10(%ebp)
   31dd5:	ff 75 0c             	pushl  0xc(%ebp)
   31dd8:	e8 bb 0d 00 00       	call   32b98 <send_msg>
   31ddd:	83 c4 10             	add    $0x10,%esp
   31de0:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31de3:	eb 7f                	jmp    31e64 <send_rec+0xb1>
   31de5:	83 ec 08             	sub    $0x8,%esp
   31de8:	ff 75 10             	pushl  0x10(%ebp)
   31deb:	ff 75 0c             	pushl  0xc(%ebp)
   31dee:	e8 b5 0d 00 00       	call   32ba8 <receive_msg>
   31df3:	83 c4 10             	add    $0x10,%esp
   31df6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31df9:	eb 69                	jmp    31e64 <send_rec+0xb1>
   31dfb:	83 ec 08             	sub    $0x8,%esp
   31dfe:	ff 75 10             	pushl  0x10(%ebp)
   31e01:	ff 75 0c             	pushl  0xc(%ebp)
   31e04:	e8 8f 0d 00 00       	call   32b98 <send_msg>
   31e09:	83 c4 10             	add    $0x10,%esp
   31e0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31e0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   31e13:	75 4e                	jne    31e63 <send_rec+0xb0>
   31e15:	83 ec 08             	sub    $0x8,%esp
   31e18:	ff 75 10             	pushl  0x10(%ebp)
   31e1b:	ff 75 0c             	pushl  0xc(%ebp)
   31e1e:	e8 85 0d 00 00       	call   32ba8 <receive_msg>
   31e23:	83 c4 10             	add    $0x10,%esp
   31e26:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31e29:	8b 45 0c             	mov    0xc(%ebp),%eax
   31e2c:	8b 40 08             	mov    0x8(%eax),%eax
   31e2f:	85 c0                	test   %eax,%eax
   31e31:	75 30                	jne    31e63 <send_rec+0xb0>
   31e33:	68 ef 03 00 00       	push   $0x3ef
   31e38:	68 fd 59 03 00       	push   $0x359fd
   31e3d:	68 fd 59 03 00       	push   $0x359fd
   31e42:	68 d8 5b 03 00       	push   $0x35bd8
   31e47:	e8 10 f8 ff ff       	call   3165c <assertion_failure>
   31e4c:	83 c4 10             	add    $0x10,%esp
   31e4f:	eb 12                	jmp    31e63 <send_rec+0xb0>
   31e51:	83 ec 0c             	sub    $0xc,%esp
   31e54:	68 e6 5b 03 00       	push   $0x35be6
   31e59:	e8 e0 f7 ff ff       	call   3163e <panic>
   31e5e:	83 c4 10             	add    $0x10,%esp
   31e61:	eb 01                	jmp    31e64 <send_rec+0xb1>
   31e63:	90                   	nop
   31e64:	b8 00 00 00 00       	mov    $0x0,%eax
   31e69:	c9                   	leave  
   31e6a:	c3                   	ret    

00031e6b <block>:
   31e6b:	55                   	push   %ebp
   31e6c:	89 e5                	mov    %esp,%ebp
   31e6e:	83 ec 08             	sub    $0x8,%esp
   31e71:	e8 d7 24 00 00       	call   3434d <schedule_process>
   31e76:	b8 00 00 00 00       	mov    $0x0,%eax
   31e7b:	c9                   	leave  
   31e7c:	c3                   	ret    

00031e7d <unblock>:
   31e7d:	55                   	push   %ebp
   31e7e:	89 e5                	mov    %esp,%ebp
   31e80:	b8 00 00 00 00       	mov    $0x0,%eax
   31e85:	5d                   	pop    %ebp
   31e86:	c3                   	ret    

00031e87 <get_ticks_ipc>:
   31e87:	55                   	push   %ebp
   31e88:	89 e5                	mov    %esp,%ebp
   31e8a:	83 ec 78             	sub    $0x78,%esp
   31e8d:	83 ec 04             	sub    $0x4,%esp
   31e90:	6a 68                	push   $0x68
   31e92:	6a 00                	push   $0x0
   31e94:	8d 45 88             	lea    -0x78(%ebp),%eax
   31e97:	50                   	push   %eax
   31e98:	e8 18 40 00 00       	call   35eb5 <Memset>
   31e9d:	83 c4 10             	add    $0x10,%esp
   31ea0:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
   31ea7:	83 ec 04             	sub    $0x4,%esp
   31eaa:	6a 01                	push   $0x1
   31eac:	8d 45 88             	lea    -0x78(%ebp),%eax
   31eaf:	50                   	push   %eax
   31eb0:	6a 03                	push   $0x3
   31eb2:	e8 fc fe ff ff       	call   31db3 <send_rec>
   31eb7:	83 c4 10             	add    $0x10,%esp
   31eba:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31ebd:	8b 45 90             	mov    -0x70(%ebp),%eax
   31ec0:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31ec3:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31ec6:	c9                   	leave  
   31ec7:	c3                   	ret    

00031ec8 <itoa>:
   31ec8:	55                   	push   %ebp
   31ec9:	89 e5                	mov    %esp,%ebp
   31ecb:	53                   	push   %ebx
   31ecc:	83 ec 14             	sub    $0x14,%esp
   31ecf:	8b 45 08             	mov    0x8(%ebp),%eax
   31ed2:	99                   	cltd   
   31ed3:	f7 7d 10             	idivl  0x10(%ebp)
   31ed6:	89 55 f4             	mov    %edx,-0xc(%ebp)
   31ed9:	8b 45 08             	mov    0x8(%ebp),%eax
   31edc:	99                   	cltd   
   31edd:	f7 7d 10             	idivl  0x10(%ebp)
   31ee0:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31ee3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   31ee7:	74 14                	je     31efd <itoa+0x35>
   31ee9:	83 ec 04             	sub    $0x4,%esp
   31eec:	ff 75 10             	pushl  0x10(%ebp)
   31eef:	ff 75 0c             	pushl  0xc(%ebp)
   31ef2:	ff 75 f0             	pushl  -0x10(%ebp)
   31ef5:	e8 ce ff ff ff       	call   31ec8 <itoa>
   31efa:	83 c4 10             	add    $0x10,%esp
   31efd:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31f00:	8d 58 30             	lea    0x30(%eax),%ebx
   31f03:	8b 45 0c             	mov    0xc(%ebp),%eax
   31f06:	8b 00                	mov    (%eax),%eax
   31f08:	8d 48 01             	lea    0x1(%eax),%ecx
   31f0b:	8b 55 0c             	mov    0xc(%ebp),%edx
   31f0e:	89 0a                	mov    %ecx,(%edx)
   31f10:	89 da                	mov    %ebx,%edx
   31f12:	88 10                	mov    %dl,(%eax)
   31f14:	8b 45 0c             	mov    0xc(%ebp),%eax
   31f17:	8b 00                	mov    (%eax),%eax
   31f19:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   31f1c:	c9                   	leave  
   31f1d:	c3                   	ret    

00031f1e <i2a>:
   31f1e:	55                   	push   %ebp
   31f1f:	89 e5                	mov    %esp,%ebp
   31f21:	53                   	push   %ebx
   31f22:	83 ec 14             	sub    $0x14,%esp
   31f25:	8b 45 08             	mov    0x8(%ebp),%eax
   31f28:	99                   	cltd   
   31f29:	f7 7d 0c             	idivl  0xc(%ebp)
   31f2c:	89 55 f4             	mov    %edx,-0xc(%ebp)
   31f2f:	8b 45 08             	mov    0x8(%ebp),%eax
   31f32:	99                   	cltd   
   31f33:	f7 7d 0c             	idivl  0xc(%ebp)
   31f36:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31f39:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   31f3d:	74 14                	je     31f53 <i2a+0x35>
   31f3f:	83 ec 04             	sub    $0x4,%esp
   31f42:	ff 75 10             	pushl  0x10(%ebp)
   31f45:	ff 75 0c             	pushl  0xc(%ebp)
   31f48:	ff 75 f0             	pushl  -0x10(%ebp)
   31f4b:	e8 ce ff ff ff       	call   31f1e <i2a>
   31f50:	83 c4 10             	add    $0x10,%esp
   31f53:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   31f57:	7f 0a                	jg     31f63 <i2a+0x45>
   31f59:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31f5c:	83 c0 30             	add    $0x30,%eax
   31f5f:	89 c3                	mov    %eax,%ebx
   31f61:	eb 08                	jmp    31f6b <i2a+0x4d>
   31f63:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31f66:	83 c0 37             	add    $0x37,%eax
   31f69:	89 c3                	mov    %eax,%ebx
   31f6b:	8b 45 10             	mov    0x10(%ebp),%eax
   31f6e:	8b 00                	mov    (%eax),%eax
   31f70:	8d 48 01             	lea    0x1(%eax),%ecx
   31f73:	8b 55 10             	mov    0x10(%ebp),%edx
   31f76:	89 0a                	mov    %ecx,(%edx)
   31f78:	88 18                	mov    %bl,(%eax)
   31f7a:	8b 45 10             	mov    0x10(%ebp),%eax
   31f7d:	8b 00                	mov    (%eax),%eax
   31f7f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   31f82:	c9                   	leave  
   31f83:	c3                   	ret    

00031f84 <TaskHD>:
   31f84:	55                   	push   %ebp
   31f85:	89 e5                	mov    %esp,%ebp
   31f87:	83 ec 08             	sub    $0x8,%esp
   31f8a:	83 ec 08             	sub    $0x8,%esp
   31f8d:	68 fb 5b 03 00       	push   $0x35bfb
   31f92:	68 11 5c 03 00       	push   $0x35c11
   31f97:	e8 73 f3 ff ff       	call   3130f <Printf>
   31f9c:	83 c4 10             	add    $0x10,%esp
   31f9f:	e8 07 00 00 00       	call   31fab <init_hd>
   31fa4:	e8 36 00 00 00       	call   31fdf <hd_handle>
   31fa9:	eb f9                	jmp    31fa4 <TaskHD+0x20>

00031fab <init_hd>:
   31fab:	55                   	push   %ebp
   31fac:	89 e5                	mov    %esp,%ebp
   31fae:	83 ec 18             	sub    $0x18,%esp
   31fb1:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
   31fb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31fbb:	0f b6 00             	movzbl (%eax),%eax
   31fbe:	0f be c0             	movsbl %al,%eax
   31fc1:	83 ec 08             	sub    $0x8,%esp
   31fc4:	50                   	push   %eax
   31fc5:	68 15 5c 03 00       	push   $0x35c15
   31fca:	e8 40 f3 ff ff       	call   3130f <Printf>
   31fcf:	83 c4 10             	add    $0x10,%esp
   31fd2:	e8 c3 e7 ff ff       	call   3079a <enable_8259A_casecade_irq>
   31fd7:	e8 d4 e7 ff ff       	call   307b0 <enable_8259A_slave_winchester_irq>
   31fdc:	90                   	nop
   31fdd:	c9                   	leave  
   31fde:	c3                   	ret    

00031fdf <hd_handle>:
   31fdf:	55                   	push   %ebp
   31fe0:	89 e5                	mov    %esp,%ebp
   31fe2:	83 ec 78             	sub    $0x78,%esp
   31fe5:	83 ec 08             	sub    $0x8,%esp
   31fe8:	68 1d 5c 03 00       	push   $0x35c1d
   31fed:	68 11 5c 03 00       	push   $0x35c11
   31ff2:	e8 18 f3 ff ff       	call   3130f <Printf>
   31ff7:	83 c4 10             	add    $0x10,%esp
   31ffa:	83 ec 04             	sub    $0x4,%esp
   31ffd:	6a 11                	push   $0x11
   31fff:	8d 45 88             	lea    -0x78(%ebp),%eax
   32002:	50                   	push   %eax
   32003:	6a 02                	push   $0x2
   32005:	e8 a9 fd ff ff       	call   31db3 <send_rec>
   3200a:	83 c4 10             	add    $0x10,%esp
   3200d:	8b 45 8c             	mov    -0x74(%ebp),%eax
   32010:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32013:	8b 45 88             	mov    -0x78(%ebp),%eax
   32016:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32019:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
   3201d:	74 3b                	je     3205a <hd_handle+0x7b>
   3201f:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
   32023:	77 08                	ja     3202d <hd_handle+0x4e>
   32025:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
   32029:	74 10                	je     3203b <hd_handle+0x5c>
   3202b:	eb 7d                	jmp    320aa <hd_handle+0xcb>
   3202d:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
   32031:	74 27                	je     3205a <hd_handle+0x7b>
   32033:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
   32037:	74 4a                	je     32083 <hd_handle+0xa4>
   32039:	eb 6f                	jmp    320aa <hd_handle+0xcb>
   3203b:	e8 33 08 00 00       	call   32873 <hd_open>
   32040:	83 ec 04             	sub    $0x4,%esp
   32043:	ff 75 f0             	pushl  -0x10(%ebp)
   32046:	68 33 5c 03 00       	push   $0x35c33
   3204b:	68 3b 5c 03 00       	push   $0x35c3b
   32050:	e8 ba f2 ff ff       	call   3130f <Printf>
   32055:	83 c4 10             	add    $0x10,%esp
   32058:	eb 66                	jmp    320c0 <hd_handle+0xe1>
   3205a:	83 ec 0c             	sub    $0xc,%esp
   3205d:	8d 45 88             	lea    -0x78(%ebp),%eax
   32060:	50                   	push   %eax
   32061:	e8 09 09 00 00       	call   3296f <hd_rdwt>
   32066:	83 c4 10             	add    $0x10,%esp
   32069:	83 ec 04             	sub    $0x4,%esp
   3206c:	ff 75 f0             	pushl  -0x10(%ebp)
   3206f:	68 42 5c 03 00       	push   $0x35c42
   32074:	68 3b 5c 03 00       	push   $0x35c3b
   32079:	e8 91 f2 ff ff       	call   3130f <Printf>
   3207e:	83 c4 10             	add    $0x10,%esp
   32081:	eb 3d                	jmp    320c0 <hd_handle+0xe1>
   32083:	83 ec 0c             	sub    $0xc,%esp
   32086:	6a 00                	push   $0x0
   32088:	e8 4a 08 00 00       	call   328d7 <get_hd_ioctl>
   3208d:	83 c4 10             	add    $0x10,%esp
   32090:	83 ec 04             	sub    $0x4,%esp
   32093:	ff 75 f0             	pushl  -0x10(%ebp)
   32096:	68 4b 5c 03 00       	push   $0x35c4b
   3209b:	68 3b 5c 03 00       	push   $0x35c3b
   320a0:	e8 6a f2 ff ff       	call   3130f <Printf>
   320a5:	83 c4 10             	add    $0x10,%esp
   320a8:	eb 16                	jmp    320c0 <hd_handle+0xe1>
   320aa:	83 ec 08             	sub    $0x8,%esp
   320ad:	68 58 5c 03 00       	push   $0x35c58
   320b2:	68 11 5c 03 00       	push   $0x35c11
   320b7:	e8 53 f2 ff ff       	call   3130f <Printf>
   320bc:	83 c4 10             	add    $0x10,%esp
   320bf:	90                   	nop
   320c0:	c7 45 88 02 00 00 00 	movl   $0x2,-0x78(%ebp)
   320c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
   320ca:	83 ec 04             	sub    $0x4,%esp
   320cd:	50                   	push   %eax
   320ce:	8d 45 88             	lea    -0x78(%ebp),%eax
   320d1:	50                   	push   %eax
   320d2:	6a 01                	push   $0x1
   320d4:	e8 da fc ff ff       	call   31db3 <send_rec>
   320d9:	83 c4 10             	add    $0x10,%esp
   320dc:	90                   	nop
   320dd:	c9                   	leave  
   320de:	c3                   	ret    

000320df <hd_cmd_out>:
   320df:	55                   	push   %ebp
   320e0:	89 e5                	mov    %esp,%ebp
   320e2:	83 ec 18             	sub    $0x18,%esp
   320e5:	eb 29                	jmp    32110 <hd_cmd_out+0x31>
   320e7:	83 ec 0c             	sub    $0xc,%esp
   320ea:	68 f7 01 00 00       	push   $0x1f7
   320ef:	e8 de e5 ff ff       	call   306d2 <in_byte>
   320f4:	83 c4 10             	add    $0x10,%esp
   320f7:	0f b6 c0             	movzbl %al,%eax
   320fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
   320fd:	83 ec 08             	sub    $0x8,%esp
   32100:	ff 75 f4             	pushl  -0xc(%ebp)
   32103:	68 6a 5c 03 00       	push   $0x35c6a
   32108:	e8 02 f2 ff ff       	call   3130f <Printf>
   3210d:	83 c4 10             	add    $0x10,%esp
   32110:	83 ec 0c             	sub    $0xc,%esp
   32113:	68 f7 01 00 00       	push   $0x1f7
   32118:	e8 b5 e5 ff ff       	call   306d2 <in_byte>
   3211d:	83 c4 10             	add    $0x10,%esp
   32120:	0f b6 c0             	movzbl %al,%eax
   32123:	83 e0 01             	and    $0x1,%eax
   32126:	85 c0                	test   %eax,%eax
   32128:	75 bd                	jne    320e7 <hd_cmd_out+0x8>
   3212a:	83 ec 0c             	sub    $0xc,%esp
   3212d:	68 f7 01 00 00       	push   $0x1f7
   32132:	e8 9b e5 ff ff       	call   306d2 <in_byte>
   32137:	83 c4 10             	add    $0x10,%esp
   3213a:	0f b6 c0             	movzbl %al,%eax
   3213d:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32140:	83 ec 08             	sub    $0x8,%esp
   32143:	ff 75 f0             	pushl  -0x10(%ebp)
   32146:	68 74 5c 03 00       	push   $0x35c74
   3214b:	e8 bf f1 ff ff       	call   3130f <Printf>
   32150:	83 c4 10             	add    $0x10,%esp
   32153:	83 ec 08             	sub    $0x8,%esp
   32156:	6a 00                	push   $0x0
   32158:	68 f6 03 00 00       	push   $0x3f6
   3215d:	e8 7c e5 ff ff       	call   306de <out_byte>
   32162:	83 c4 10             	add    $0x10,%esp
   32165:	83 ec 08             	sub    $0x8,%esp
   32168:	6a 17                	push   $0x17
   3216a:	68 7a 5c 03 00       	push   $0x35c7a
   3216f:	e8 9b f1 ff ff       	call   3130f <Printf>
   32174:	83 c4 10             	add    $0x10,%esp
   32177:	8b 45 08             	mov    0x8(%ebp),%eax
   3217a:	0f b6 00             	movzbl (%eax),%eax
   3217d:	0f b6 c0             	movzbl %al,%eax
   32180:	83 ec 08             	sub    $0x8,%esp
   32183:	50                   	push   %eax
   32184:	68 f1 01 00 00       	push   $0x1f1
   32189:	e8 50 e5 ff ff       	call   306de <out_byte>
   3218e:	83 c4 10             	add    $0x10,%esp
   32191:	8b 45 08             	mov    0x8(%ebp),%eax
   32194:	0f b6 40 01          	movzbl 0x1(%eax),%eax
   32198:	0f b6 c0             	movzbl %al,%eax
   3219b:	83 ec 08             	sub    $0x8,%esp
   3219e:	50                   	push   %eax
   3219f:	68 f2 01 00 00       	push   $0x1f2
   321a4:	e8 35 e5 ff ff       	call   306de <out_byte>
   321a9:	83 c4 10             	add    $0x10,%esp
   321ac:	8b 45 08             	mov    0x8(%ebp),%eax
   321af:	0f b6 40 02          	movzbl 0x2(%eax),%eax
   321b3:	0f b6 c0             	movzbl %al,%eax
   321b6:	83 ec 08             	sub    $0x8,%esp
   321b9:	50                   	push   %eax
   321ba:	68 f3 01 00 00       	push   $0x1f3
   321bf:	e8 1a e5 ff ff       	call   306de <out_byte>
   321c4:	83 c4 10             	add    $0x10,%esp
   321c7:	8b 45 08             	mov    0x8(%ebp),%eax
   321ca:	0f b6 40 03          	movzbl 0x3(%eax),%eax
   321ce:	0f b6 c0             	movzbl %al,%eax
   321d1:	83 ec 08             	sub    $0x8,%esp
   321d4:	50                   	push   %eax
   321d5:	68 f4 01 00 00       	push   $0x1f4
   321da:	e8 ff e4 ff ff       	call   306de <out_byte>
   321df:	83 c4 10             	add    $0x10,%esp
   321e2:	83 ec 08             	sub    $0x8,%esp
   321e5:	6a 17                	push   $0x17
   321e7:	68 7a 5c 03 00       	push   $0x35c7a
   321ec:	e8 1e f1 ff ff       	call   3130f <Printf>
   321f1:	83 c4 10             	add    $0x10,%esp
   321f4:	8b 45 08             	mov    0x8(%ebp),%eax
   321f7:	0f b6 40 04          	movzbl 0x4(%eax),%eax
   321fb:	0f b6 c0             	movzbl %al,%eax
   321fe:	83 ec 08             	sub    $0x8,%esp
   32201:	50                   	push   %eax
   32202:	68 f5 01 00 00       	push   $0x1f5
   32207:	e8 d2 e4 ff ff       	call   306de <out_byte>
   3220c:	83 c4 10             	add    $0x10,%esp
   3220f:	83 ec 08             	sub    $0x8,%esp
   32212:	6a 17                	push   $0x17
   32214:	68 7a 5c 03 00       	push   $0x35c7a
   32219:	e8 f1 f0 ff ff       	call   3130f <Printf>
   3221e:	83 c4 10             	add    $0x10,%esp
   32221:	8b 45 08             	mov    0x8(%ebp),%eax
   32224:	0f b6 40 05          	movzbl 0x5(%eax),%eax
   32228:	0f b6 c0             	movzbl %al,%eax
   3222b:	83 ec 08             	sub    $0x8,%esp
   3222e:	50                   	push   %eax
   3222f:	68 f6 01 00 00       	push   $0x1f6
   32234:	e8 a5 e4 ff ff       	call   306de <out_byte>
   32239:	83 c4 10             	add    $0x10,%esp
   3223c:	83 ec 08             	sub    $0x8,%esp
   3223f:	6a 17                	push   $0x17
   32241:	68 7a 5c 03 00       	push   $0x35c7a
   32246:	e8 c4 f0 ff ff       	call   3130f <Printf>
   3224b:	83 c4 10             	add    $0x10,%esp
   3224e:	8b 45 08             	mov    0x8(%ebp),%eax
   32251:	0f b6 40 06          	movzbl 0x6(%eax),%eax
   32255:	0f b6 c0             	movzbl %al,%eax
   32258:	83 ec 08             	sub    $0x8,%esp
   3225b:	50                   	push   %eax
   3225c:	68 f7 01 00 00       	push   $0x1f7
   32261:	e8 78 e4 ff ff       	call   306de <out_byte>
   32266:	83 c4 10             	add    $0x10,%esp
   32269:	83 ec 08             	sub    $0x8,%esp
   3226c:	6a 17                	push   $0x17
   3226e:	68 7a 5c 03 00       	push   $0x35c7a
   32273:	e8 97 f0 ff ff       	call   3130f <Printf>
   32278:	83 c4 10             	add    $0x10,%esp
   3227b:	90                   	nop
   3227c:	c9                   	leave  
   3227d:	c3                   	ret    

0003227e <hd_identify>:
   3227e:	55                   	push   %ebp
   3227f:	89 e5                	mov    %esp,%ebp
   32281:	81 ec 18 04 00 00    	sub    $0x418,%esp
   32287:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
   3228b:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
   3228f:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
   32293:	c6 45 f4 00          	movb   $0x0,-0xc(%ebp)
   32297:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
   3229b:	8b 45 08             	mov    0x8(%ebp),%eax
   3229e:	c1 e0 04             	shl    $0x4,%eax
   322a1:	83 c8 e0             	or     $0xffffffe0,%eax
   322a4:	88 45 f6             	mov    %al,-0xa(%ebp)
   322a7:	c6 45 f7 ec          	movb   $0xec,-0x9(%ebp)
   322ab:	83 ec 0c             	sub    $0xc,%esp
   322ae:	8d 45 f1             	lea    -0xf(%ebp),%eax
   322b1:	50                   	push   %eax
   322b2:	e8 28 fe ff ff       	call   320df <hd_cmd_out>
   322b7:	83 c4 10             	add    $0x10,%esp
   322ba:	83 ec 0c             	sub    $0xc,%esp
   322bd:	6a 01                	push   $0x1
   322bf:	e8 9e ee ff ff       	call   31162 <delay>
   322c4:	83 c4 10             	add    $0x10,%esp
   322c7:	83 ec 08             	sub    $0x8,%esp
   322ca:	68 81 5c 03 00       	push   $0x35c81
   322cf:	68 11 5c 03 00       	push   $0x35c11
   322d4:	e8 36 f0 ff ff       	call   3130f <Printf>
   322d9:	83 c4 10             	add    $0x10,%esp
   322dc:	83 ec 04             	sub    $0x4,%esp
   322df:	68 00 04 00 00       	push   $0x400
   322e4:	6a 00                	push   $0x0
   322e6:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   322ec:	50                   	push   %eax
   322ed:	e8 c3 3b 00 00       	call   35eb5 <Memset>
   322f2:	83 c4 10             	add    $0x10,%esp
   322f5:	83 ec 04             	sub    $0x4,%esp
   322f8:	68 00 02 00 00       	push   $0x200
   322fd:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32303:	50                   	push   %eax
   32304:	68 f0 01 00 00       	push   $0x1f0
   32309:	e8 fb 3b 00 00       	call   35f09 <read_port>
   3230e:	83 c4 10             	add    $0x10,%esp
   32311:	83 ec 0c             	sub    $0xc,%esp
   32314:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   3231a:	50                   	push   %eax
   3231b:	e8 32 00 00 00       	call   32352 <print_hdinfo>
   32320:	83 c4 10             	add    $0x10,%esp
   32323:	83 ec 08             	sub    $0x8,%esp
   32326:	68 8c 5c 03 00       	push   $0x35c8c
   3232b:	68 11 5c 03 00       	push   $0x35c11
   32330:	e8 da ef ff ff       	call   3130f <Printf>
   32335:	83 c4 10             	add    $0x10,%esp
   32338:	83 ec 08             	sub    $0x8,%esp
   3233b:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32341:	50                   	push   %eax
   32342:	68 98 5c 03 00       	push   $0x35c98
   32347:	e8 c3 ef ff ff       	call   3130f <Printf>
   3234c:	83 c4 10             	add    $0x10,%esp
   3234f:	90                   	nop
   32350:	c9                   	leave  
   32351:	c3                   	ret    

00032352 <print_hdinfo>:
   32352:	55                   	push   %ebp
   32353:	89 e5                	mov    %esp,%ebp
   32355:	81 ec 88 00 00 00    	sub    $0x88,%esp
   3235b:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
   32361:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
   32367:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
   3236e:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
   32375:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
   3237c:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
   32383:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
   3238a:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
   32390:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
   32396:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
   3239d:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
   323a4:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
   323ab:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
   323b2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   323b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   323c0:	e9 b8 00 00 00       	jmp    3247d <print_hdinfo+0x12b>
   323c5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   323cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
   323cf:	89 d0                	mov    %edx,%eax
   323d1:	01 c0                	add    %eax,%eax
   323d3:	01 d0                	add    %edx,%eax
   323d5:	c1 e0 03             	shl    $0x3,%eax
   323d8:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   323db:	01 c8                	add    %ecx,%eax
   323dd:	83 e8 44             	sub    $0x44,%eax
   323e0:	0f b7 00             	movzwl (%eax),%eax
   323e3:	0f b7 c0             	movzwl %ax,%eax
   323e6:	8d 14 00             	lea    (%eax,%eax,1),%edx
   323e9:	8b 45 08             	mov    0x8(%ebp),%eax
   323ec:	01 d0                	add    %edx,%eax
   323ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
   323f1:	eb 30                	jmp    32423 <print_hdinfo+0xd1>
   323f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
   323f6:	8d 50 01             	lea    0x1(%eax),%edx
   323f9:	89 55 ec             	mov    %edx,-0x14(%ebp)
   323fc:	8b 55 f0             	mov    -0x10(%ebp),%edx
   323ff:	83 c2 01             	add    $0x1,%edx
   32402:	0f b6 00             	movzbl (%eax),%eax
   32405:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
   32409:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3240c:	8d 50 01             	lea    0x1(%eax),%edx
   3240f:	89 55 ec             	mov    %edx,-0x14(%ebp)
   32412:	0f b6 00             	movzbl (%eax),%eax
   32415:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
   32418:	8b 55 f0             	mov    -0x10(%ebp),%edx
   3241b:	01 ca                	add    %ecx,%edx
   3241d:	88 02                	mov    %al,(%edx)
   3241f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   32423:	8b 55 f4             	mov    -0xc(%ebp),%edx
   32426:	89 d0                	mov    %edx,%eax
   32428:	01 c0                	add    %eax,%eax
   3242a:	01 d0                	add    %edx,%eax
   3242c:	c1 e0 03             	shl    $0x3,%eax
   3242f:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   32432:	01 c8                	add    %ecx,%eax
   32434:	83 e8 42             	sub    $0x42,%eax
   32437:	0f b7 00             	movzwl (%eax),%eax
   3243a:	66 d1 e8             	shr    %ax
   3243d:	0f b7 c0             	movzwl %ax,%eax
   32440:	39 45 f0             	cmp    %eax,-0x10(%ebp)
   32443:	7c ae                	jl     323f3 <print_hdinfo+0xa1>
   32445:	8d 55 81             	lea    -0x7f(%ebp),%edx
   32448:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3244b:	01 d0                	add    %edx,%eax
   3244d:	c6 00 00             	movb   $0x0,(%eax)
   32450:	8d 4d b4             	lea    -0x4c(%ebp),%ecx
   32453:	8b 55 f4             	mov    -0xc(%ebp),%edx
   32456:	89 d0                	mov    %edx,%eax
   32458:	01 c0                	add    %eax,%eax
   3245a:	01 d0                	add    %edx,%eax
   3245c:	c1 e0 03             	shl    $0x3,%eax
   3245f:	01 c8                	add    %ecx,%eax
   32461:	8d 50 04             	lea    0x4(%eax),%edx
   32464:	83 ec 04             	sub    $0x4,%esp
   32467:	8d 45 81             	lea    -0x7f(%ebp),%eax
   3246a:	50                   	push   %eax
   3246b:	52                   	push   %edx
   3246c:	68 a0 5c 03 00       	push   $0x35ca0
   32471:	e8 99 ee ff ff       	call   3130f <Printf>
   32476:	83 c4 10             	add    $0x10,%esp
   32479:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3247d:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   32481:	0f 8e 3e ff ff ff    	jle    323c5 <print_hdinfo+0x73>
   32487:	8b 45 08             	mov    0x8(%ebp),%eax
   3248a:	0f b7 40 62          	movzwl 0x62(%eax),%eax
   3248e:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
   32492:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
   32496:	66 c1 e8 08          	shr    $0x8,%ax
   3249a:	66 85 c0             	test   %ax,%ax
   3249d:	0f 95 c0             	setne  %al
   324a0:	88 45 e9             	mov    %al,-0x17(%ebp)
   324a3:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
   324aa:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
   324b0:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
   324b4:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
   324b8:	75 15                	jne    324cf <print_hdinfo+0x17d>
   324ba:	83 ec 08             	sub    $0x8,%esp
   324bd:	8d 45 ac             	lea    -0x54(%ebp),%eax
   324c0:	50                   	push   %eax
   324c1:	8d 45 b0             	lea    -0x50(%ebp),%eax
   324c4:	50                   	push   %eax
   324c5:	e8 0a 3a 00 00       	call   35ed4 <Strcpy>
   324ca:	83 c4 10             	add    $0x10,%esp
   324cd:	eb 13                	jmp    324e2 <print_hdinfo+0x190>
   324cf:	83 ec 08             	sub    $0x8,%esp
   324d2:	8d 45 a9             	lea    -0x57(%ebp),%eax
   324d5:	50                   	push   %eax
   324d6:	8d 45 b0             	lea    -0x50(%ebp),%eax
   324d9:	50                   	push   %eax
   324da:	e8 f5 39 00 00       	call   35ed4 <Strcpy>
   324df:	83 c4 10             	add    $0x10,%esp
   324e2:	83 ec 08             	sub    $0x8,%esp
   324e5:	8d 45 b0             	lea    -0x50(%ebp),%eax
   324e8:	50                   	push   %eax
   324e9:	68 a7 5c 03 00       	push   $0x35ca7
   324ee:	e8 1c ee ff ff       	call   3130f <Printf>
   324f3:	83 c4 10             	add    $0x10,%esp
   324f6:	8b 45 08             	mov    0x8(%ebp),%eax
   324f9:	83 c0 7a             	add    $0x7a,%eax
   324fc:	0f b7 00             	movzwl (%eax),%eax
   324ff:	0f b7 d0             	movzwl %ax,%edx
   32502:	8b 45 08             	mov    0x8(%ebp),%eax
   32505:	83 c0 78             	add    $0x78,%eax
   32508:	0f b7 00             	movzwl (%eax),%eax
   3250b:	0f b7 c0             	movzwl %ax,%eax
   3250e:	83 c0 10             	add    $0x10,%eax
   32511:	89 c1                	mov    %eax,%ecx
   32513:	d3 e2                	shl    %cl,%edx
   32515:	89 d0                	mov    %edx,%eax
   32517:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   3251a:	83 ec 08             	sub    $0x8,%esp
   3251d:	ff 75 e4             	pushl  -0x1c(%ebp)
   32520:	68 b7 5c 03 00       	push   $0x35cb7
   32525:	e8 e5 ed ff ff       	call   3130f <Printf>
   3252a:	83 c4 10             	add    $0x10,%esp
   3252d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32530:	89 c2                	mov    %eax,%edx
   32532:	c1 ea 1f             	shr    $0x1f,%edx
   32535:	01 d0                	add    %edx,%eax
   32537:	d1 f8                	sar    %eax
   32539:	c1 e0 0a             	shl    $0xa,%eax
   3253c:	83 ec 08             	sub    $0x8,%esp
   3253f:	50                   	push   %eax
   32540:	68 ca 5c 03 00       	push   $0x35cca
   32545:	e8 c5 ed ff ff       	call   3130f <Printf>
   3254a:	83 c4 10             	add    $0x10,%esp
   3254d:	90                   	nop
   3254e:	c9                   	leave  
   3254f:	c3                   	ret    

00032550 <print_dpt_entry>:
   32550:	55                   	push   %ebp
   32551:	89 e5                	mov    %esp,%ebp
   32553:	83 ec 08             	sub    $0x8,%esp
   32556:	8b 45 08             	mov    0x8(%ebp),%eax
   32559:	0f b6 40 04          	movzbl 0x4(%eax),%eax
   3255d:	0f b6 c0             	movzbl %al,%eax
   32560:	83 ec 08             	sub    $0x8,%esp
   32563:	50                   	push   %eax
   32564:	68 d7 5c 03 00       	push   $0x35cd7
   32569:	e8 a1 ed ff ff       	call   3130f <Printf>
   3256e:	83 c4 10             	add    $0x10,%esp
   32571:	90                   	nop
   32572:	c9                   	leave  
   32573:	c3                   	ret    

00032574 <get_partition_table>:
   32574:	55                   	push   %ebp
   32575:	89 e5                	mov    %esp,%ebp
   32577:	81 ec 18 04 00 00    	sub    $0x418,%esp
   3257d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
   32581:	c6 45 f2 01          	movb   $0x1,-0xe(%ebp)
   32585:	8b 45 0c             	mov    0xc(%ebp),%eax
   32588:	88 45 f3             	mov    %al,-0xd(%ebp)
   3258b:	8b 45 0c             	mov    0xc(%ebp),%eax
   3258e:	c1 f8 08             	sar    $0x8,%eax
   32591:	88 45 f4             	mov    %al,-0xc(%ebp)
   32594:	8b 45 0c             	mov    0xc(%ebp),%eax
   32597:	c1 f8 10             	sar    $0x10,%eax
   3259a:	88 45 f5             	mov    %al,-0xb(%ebp)
   3259d:	8b 45 0c             	mov    0xc(%ebp),%eax
   325a0:	c1 f8 18             	sar    $0x18,%eax
   325a3:	89 c2                	mov    %eax,%edx
   325a5:	8b 45 08             	mov    0x8(%ebp),%eax
   325a8:	c1 e0 04             	shl    $0x4,%eax
   325ab:	09 d0                	or     %edx,%eax
   325ad:	83 c8 e0             	or     $0xffffffe0,%eax
   325b0:	88 45 f6             	mov    %al,-0xa(%ebp)
   325b3:	c6 45 f7 20          	movb   $0x20,-0x9(%ebp)
   325b7:	83 ec 0c             	sub    $0xc,%esp
   325ba:	8d 45 f1             	lea    -0xf(%ebp),%eax
   325bd:	50                   	push   %eax
   325be:	e8 1c fb ff ff       	call   320df <hd_cmd_out>
   325c3:	83 c4 10             	add    $0x10,%esp
   325c6:	83 ec 0c             	sub    $0xc,%esp
   325c9:	68 f4 01 00 00       	push   $0x1f4
   325ce:	e8 8f eb ff ff       	call   31162 <delay>
   325d3:	83 c4 10             	add    $0x10,%esp
   325d6:	83 ec 04             	sub    $0x4,%esp
   325d9:	68 00 04 00 00       	push   $0x400
   325de:	6a 00                	push   $0x0
   325e0:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   325e6:	50                   	push   %eax
   325e7:	e8 c9 38 00 00       	call   35eb5 <Memset>
   325ec:	83 c4 10             	add    $0x10,%esp
   325ef:	83 ec 04             	sub    $0x4,%esp
   325f2:	68 00 02 00 00       	push   $0x200
   325f7:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   325fd:	50                   	push   %eax
   325fe:	68 f0 01 00 00       	push   $0x1f0
   32603:	e8 01 39 00 00       	call   35f09 <read_port>
   32608:	83 c4 10             	add    $0x10,%esp
   3260b:	8d 85 f1 fb ff ff    	lea    -0x40f(%ebp),%eax
   32611:	05 be 01 00 00       	add    $0x1be,%eax
   32616:	83 ec 04             	sub    $0x4,%esp
   32619:	6a 40                	push   $0x40
   3261b:	50                   	push   %eax
   3261c:	ff 75 10             	pushl  0x10(%ebp)
   3261f:	e8 63 38 00 00       	call   35e87 <Memcpy>
   32624:	83 c4 10             	add    $0x10,%esp
   32627:	90                   	nop
   32628:	c9                   	leave  
   32629:	c3                   	ret    

0003262a <partition>:
   3262a:	55                   	push   %ebp
   3262b:	89 e5                	mov    %esp,%ebp
   3262d:	81 ec 98 00 00 00    	sub    $0x98,%esp
   32633:	8b 45 0c             	mov    0xc(%ebp),%eax
   32636:	88 85 74 ff ff ff    	mov    %al,-0x8c(%ebp)
   3263c:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
   32640:	7f 19                	jg     3265b <partition+0x31>
   32642:	8b 4d 08             	mov    0x8(%ebp),%ecx
   32645:	ba 67 66 66 66       	mov    $0x66666667,%edx
   3264a:	89 c8                	mov    %ecx,%eax
   3264c:	f7 ea                	imul   %edx
   3264e:	d1 fa                	sar    %edx
   32650:	89 c8                	mov    %ecx,%eax
   32652:	c1 f8 1f             	sar    $0x1f,%eax
   32655:	29 c2                	sub    %eax,%edx
   32657:	89 d0                	mov    %edx,%eax
   32659:	eb 11                	jmp    3266c <partition+0x42>
   3265b:	8b 45 08             	mov    0x8(%ebp),%eax
   3265e:	83 e8 10             	sub    $0x10,%eax
   32661:	8d 50 3f             	lea    0x3f(%eax),%edx
   32664:	85 c0                	test   %eax,%eax
   32666:	0f 48 c2             	cmovs  %edx,%eax
   32669:	c1 f8 06             	sar    $0x6,%eax
   3266c:	89 45 e8             	mov    %eax,-0x18(%ebp)
   3266f:	80 bd 74 ff ff ff 00 	cmpb   $0x0,-0x8c(%ebp)
   32676:	0f 85 cc 00 00 00    	jne    32748 <partition+0x11e>
   3267c:	83 ec 04             	sub    $0x4,%esp
   3267f:	6a 50                	push   $0x50
   32681:	6a 00                	push   $0x0
   32683:	8d 45 84             	lea    -0x7c(%ebp),%eax
   32686:	50                   	push   %eax
   32687:	e8 29 38 00 00       	call   35eb5 <Memset>
   3268c:	83 c4 10             	add    $0x10,%esp
   3268f:	83 ec 04             	sub    $0x4,%esp
   32692:	8d 45 84             	lea    -0x7c(%ebp),%eax
   32695:	50                   	push   %eax
   32696:	6a 00                	push   $0x0
   32698:	ff 75 e8             	pushl  -0x18(%ebp)
   3269b:	e8 d4 fe ff ff       	call   32574 <get_partition_table>
   326a0:	83 c4 10             	add    $0x10,%esp
   326a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   326aa:	e9 8a 00 00 00       	jmp    32739 <partition+0x10f>
   326af:	8b 45 f4             	mov    -0xc(%ebp),%eax
   326b2:	83 c0 01             	add    $0x1,%eax
   326b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   326b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   326bb:	c1 e0 04             	shl    $0x4,%eax
   326be:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   326c1:	01 c8                	add    %ecx,%eax
   326c3:	83 e8 6c             	sub    $0x6c,%eax
   326c6:	8b 00                	mov    (%eax),%eax
   326c8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
   326cb:	8b 55 e8             	mov    -0x18(%ebp),%edx
   326ce:	c1 e1 03             	shl    $0x3,%ecx
   326d1:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
   326d7:	01 ca                	add    %ecx,%edx
   326d9:	81 c2 e4 c4 03 00    	add    $0x3c4e4,%edx
   326df:	89 02                	mov    %eax,(%edx)
   326e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
   326e4:	c1 e0 04             	shl    $0x4,%eax
   326e7:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   326ea:	01 c8                	add    %ecx,%eax
   326ec:	83 e8 68             	sub    $0x68,%eax
   326ef:	8b 00                	mov    (%eax),%eax
   326f1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
   326f4:	8b 55 e8             	mov    -0x18(%ebp),%edx
   326f7:	c1 e1 03             	shl    $0x3,%ecx
   326fa:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
   32700:	01 ca                	add    %ecx,%edx
   32702:	81 c2 e8 c4 03 00    	add    $0x3c4e8,%edx
   32708:	89 02                	mov    %eax,(%edx)
   3270a:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3270d:	c1 e0 04             	shl    $0x4,%eax
   32710:	8d 4d f8             	lea    -0x8(%ebp),%ecx
   32713:	01 c8                	add    %ecx,%eax
   32715:	83 e8 70             	sub    $0x70,%eax
   32718:	0f b6 00             	movzbl (%eax),%eax
   3271b:	3c 05                	cmp    $0x5,%al
   3271d:	75 16                	jne    32735 <partition+0x10b>
   3271f:	8b 55 08             	mov    0x8(%ebp),%edx
   32722:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   32725:	01 d0                	add    %edx,%eax
   32727:	83 ec 08             	sub    $0x8,%esp
   3272a:	6a 01                	push   $0x1
   3272c:	50                   	push   %eax
   3272d:	e8 f8 fe ff ff       	call   3262a <partition>
   32732:	83 c4 10             	add    $0x10,%esp
   32735:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   32739:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
   3273d:	0f 8e 6c ff ff ff    	jle    326af <partition+0x85>
   32743:	e9 28 01 00 00       	jmp    32870 <partition+0x246>
   32748:	80 bd 74 ff ff ff 01 	cmpb   $0x1,-0x8c(%ebp)
   3274f:	0f 85 03 01 00 00    	jne    32858 <partition+0x22e>
   32755:	8b 4d 08             	mov    0x8(%ebp),%ecx
   32758:	ba 67 66 66 66       	mov    $0x66666667,%edx
   3275d:	89 c8                	mov    %ecx,%eax
   3275f:	f7 ea                	imul   %edx
   32761:	d1 fa                	sar    %edx
   32763:	89 c8                	mov    %ecx,%eax
   32765:	c1 f8 1f             	sar    $0x1f,%eax
   32768:	29 c2                	sub    %eax,%edx
   3276a:	89 d0                	mov    %edx,%eax
   3276c:	c1 e0 02             	shl    $0x2,%eax
   3276f:	01 d0                	add    %edx,%eax
   32771:	29 c1                	sub    %eax,%ecx
   32773:	89 c8                	mov    %ecx,%eax
   32775:	89 45 e0             	mov    %eax,-0x20(%ebp)
   32778:	8b 55 e0             	mov    -0x20(%ebp),%edx
   3277b:	8b 45 e8             	mov    -0x18(%ebp),%eax
   3277e:	c1 e2 03             	shl    $0x3,%edx
   32781:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   32787:	01 d0                	add    %edx,%eax
   32789:	05 e4 c4 03 00       	add    $0x3c4e4,%eax
   3278e:	8b 00                	mov    (%eax),%eax
   32790:	89 45 dc             	mov    %eax,-0x24(%ebp)
   32793:	8b 45 dc             	mov    -0x24(%ebp),%eax
   32796:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32799:	8b 45 e0             	mov    -0x20(%ebp),%eax
   3279c:	83 e8 01             	sub    $0x1,%eax
   3279f:	c1 e0 04             	shl    $0x4,%eax
   327a2:	89 45 d8             	mov    %eax,-0x28(%ebp)
   327a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   327ac:	e9 9b 00 00 00       	jmp    3284c <partition+0x222>
   327b1:	83 ec 04             	sub    $0x4,%esp
   327b4:	6a 50                	push   $0x50
   327b6:	6a 00                	push   $0x0
   327b8:	8d 45 84             	lea    -0x7c(%ebp),%eax
   327bb:	50                   	push   %eax
   327bc:	e8 f4 36 00 00       	call   35eb5 <Memset>
   327c1:	83 c4 10             	add    $0x10,%esp
   327c4:	83 ec 04             	sub    $0x4,%esp
   327c7:	8d 45 84             	lea    -0x7c(%ebp),%eax
   327ca:	50                   	push   %eax
   327cb:	ff 75 f0             	pushl  -0x10(%ebp)
   327ce:	ff 75 e8             	pushl  -0x18(%ebp)
   327d1:	e8 9e fd ff ff       	call   32574 <get_partition_table>
   327d6:	83 c4 10             	add    $0x10,%esp
   327d9:	83 ec 0c             	sub    $0xc,%esp
   327dc:	8d 45 84             	lea    -0x7c(%ebp),%eax
   327df:	50                   	push   %eax
   327e0:	e8 6b fd ff ff       	call   32550 <print_dpt_entry>
   327e5:	83 c4 10             	add    $0x10,%esp
   327e8:	8b 55 d8             	mov    -0x28(%ebp),%edx
   327eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
   327ee:	01 d0                	add    %edx,%eax
   327f0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   327f3:	8b 55 8c             	mov    -0x74(%ebp),%edx
   327f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
   327f9:	01 c2                	add    %eax,%edx
   327fb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
   327fe:	8d 48 04             	lea    0x4(%eax),%ecx
   32801:	8b 45 e8             	mov    -0x18(%ebp),%eax
   32804:	c1 e1 03             	shl    $0x3,%ecx
   32807:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   3280d:	01 c8                	add    %ecx,%eax
   3280f:	05 e4 c4 03 00       	add    $0x3c4e4,%eax
   32814:	89 10                	mov    %edx,(%eax)
   32816:	8b 45 90             	mov    -0x70(%ebp),%eax
   32819:	8b 55 d4             	mov    -0x2c(%ebp),%edx
   3281c:	8d 4a 04             	lea    0x4(%edx),%ecx
   3281f:	8b 55 e8             	mov    -0x18(%ebp),%edx
   32822:	c1 e1 03             	shl    $0x3,%ecx
   32825:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
   3282b:	01 ca                	add    %ecx,%edx
   3282d:	81 c2 e8 c4 03 00    	add    $0x3c4e8,%edx
   32833:	89 02                	mov    %eax,(%edx)
   32835:	0f b6 45 98          	movzbl -0x68(%ebp),%eax
   32839:	84 c0                	test   %al,%al
   3283b:	74 32                	je     3286f <partition+0x245>
   3283d:	8b 55 9c             	mov    -0x64(%ebp),%edx
   32840:	8b 45 dc             	mov    -0x24(%ebp),%eax
   32843:	01 d0                	add    %edx,%eax
   32845:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32848:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   3284c:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
   32850:	0f 8e 5b ff ff ff    	jle    327b1 <partition+0x187>
   32856:	eb 18                	jmp    32870 <partition+0x246>
   32858:	83 ec 08             	sub    $0x8,%esp
   3285b:	68 e5 5c 03 00       	push   $0x35ce5
   32860:	68 11 5c 03 00       	push   $0x35c11
   32865:	e8 a5 ea ff ff       	call   3130f <Printf>
   3286a:	83 c4 10             	add    $0x10,%esp
   3286d:	eb 01                	jmp    32870 <partition+0x246>
   3286f:	90                   	nop
   32870:	90                   	nop
   32871:	c9                   	leave  
   32872:	c3                   	ret    

00032873 <hd_open>:
   32873:	55                   	push   %ebp
   32874:	89 e5                	mov    %esp,%ebp
   32876:	83 ec 18             	sub    $0x18,%esp
   32879:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   32880:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32883:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   32889:	05 e0 c4 03 00       	add    $0x3c4e0,%eax
   3288e:	8b 00                	mov    (%eax),%eax
   32890:	8d 50 01             	lea    0x1(%eax),%edx
   32893:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32896:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   3289c:	05 e0 c4 03 00       	add    $0x3c4e0,%eax
   328a1:	89 10                	mov    %edx,(%eax)
   328a3:	83 ec 08             	sub    $0x8,%esp
   328a6:	6a 00                	push   $0x0
   328a8:	6a 00                	push   $0x0
   328aa:	e8 7b fd ff ff       	call   3262a <partition>
   328af:	83 c4 10             	add    $0x10,%esp
   328b2:	83 ec 0c             	sub    $0xc,%esp
   328b5:	6a 02                	push   $0x2
   328b7:	e8 1b 00 00 00       	call   328d7 <get_hd_ioctl>
   328bc:	83 c4 10             	add    $0x10,%esp
   328bf:	83 ec 08             	sub    $0x8,%esp
   328c2:	68 f0 5c 03 00       	push   $0x35cf0
   328c7:	68 11 5c 03 00       	push   $0x35c11
   328cc:	e8 3e ea ff ff       	call   3130f <Printf>
   328d1:	83 c4 10             	add    $0x10,%esp
   328d4:	90                   	nop
   328d5:	c9                   	leave  
   328d6:	c3                   	ret    

000328d7 <get_hd_ioctl>:
   328d7:	55                   	push   %ebp
   328d8:	89 e5                	mov    %esp,%ebp
   328da:	83 ec 18             	sub    $0x18,%esp
   328dd:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
   328e1:	7f 19                	jg     328fc <get_hd_ioctl+0x25>
   328e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
   328e6:	ba 67 66 66 66       	mov    $0x66666667,%edx
   328eb:	89 c8                	mov    %ecx,%eax
   328ed:	f7 ea                	imul   %edx
   328ef:	d1 fa                	sar    %edx
   328f1:	89 c8                	mov    %ecx,%eax
   328f3:	c1 f8 1f             	sar    $0x1f,%eax
   328f6:	29 c2                	sub    %eax,%edx
   328f8:	89 d0                	mov    %edx,%eax
   328fa:	eb 11                	jmp    3290d <get_hd_ioctl+0x36>
   328fc:	8b 45 08             	mov    0x8(%ebp),%eax
   328ff:	83 e8 10             	sub    $0x10,%eax
   32902:	8d 50 3f             	lea    0x3f(%eax),%edx
   32905:	85 c0                	test   %eax,%eax
   32907:	0f 48 c2             	cmovs  %edx,%eax
   3290a:	c1 f8 06             	sar    $0x6,%eax
   3290d:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32910:	8b 55 08             	mov    0x8(%ebp),%edx
   32913:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32916:	c1 e2 03             	shl    $0x3,%edx
   32919:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   3291f:	01 d0                	add    %edx,%eax
   32921:	05 e8 c4 03 00       	add    $0x3c4e8,%eax
   32926:	8b 00                	mov    (%eax),%eax
   32928:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3292b:	83 ec 08             	sub    $0x8,%esp
   3292e:	ff 75 f0             	pushl  -0x10(%ebp)
   32931:	68 f5 5c 03 00       	push   $0x35cf5
   32936:	e8 d4 e9 ff ff       	call   3130f <Printf>
   3293b:	83 c4 10             	add    $0x10,%esp
   3293e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32941:	c9                   	leave  
   32942:	c3                   	ret    

00032943 <wait_for>:
   32943:	55                   	push   %ebp
   32944:	89 e5                	mov    %esp,%ebp
   32946:	83 ec 08             	sub    $0x8,%esp
   32949:	83 ec 0c             	sub    $0xc,%esp
   3294c:	6a 04                	push   $0x4
   3294e:	e8 0f e8 ff ff       	call   31162 <delay>
   32953:	83 c4 10             	add    $0x10,%esp
   32956:	90                   	nop
   32957:	c9                   	leave  
   32958:	c3                   	ret    

00032959 <interrupt_wait>:
   32959:	55                   	push   %ebp
   3295a:	89 e5                	mov    %esp,%ebp
   3295c:	83 ec 08             	sub    $0x8,%esp
   3295f:	83 ec 0c             	sub    $0xc,%esp
   32962:	6a 04                	push   $0x4
   32964:	e8 f9 e7 ff ff       	call   31162 <delay>
   32969:	83 c4 10             	add    $0x10,%esp
   3296c:	90                   	nop
   3296d:	c9                   	leave  
   3296e:	c3                   	ret    

0003296f <hd_rdwt>:
   3296f:	55                   	push   %ebp
   32970:	89 e5                	mov    %esp,%ebp
   32972:	53                   	push   %ebx
   32973:	83 ec 44             	sub    $0x44,%esp
   32976:	8b 45 08             	mov    0x8(%ebp),%eax
   32979:	8b 40 18             	mov    0x18(%eax),%eax
   3297c:	89 45 e8             	mov    %eax,-0x18(%ebp)
   3297f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   32986:	8b 45 08             	mov    0x8(%ebp),%eax
   32989:	8b 40 14             	mov    0x14(%eax),%eax
   3298c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   3298f:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
   32993:	7f 19                	jg     329ae <hd_rdwt+0x3f>
   32995:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
   32998:	ba 67 66 66 66       	mov    $0x66666667,%edx
   3299d:	89 c8                	mov    %ecx,%eax
   3299f:	f7 ea                	imul   %edx
   329a1:	d1 fa                	sar    %edx
   329a3:	89 c8                	mov    %ecx,%eax
   329a5:	c1 f8 1f             	sar    $0x1f,%eax
   329a8:	29 c2                	sub    %eax,%edx
   329aa:	89 d0                	mov    %edx,%eax
   329ac:	eb 11                	jmp    329bf <hd_rdwt+0x50>
   329ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   329b1:	83 e8 10             	sub    $0x10,%eax
   329b4:	8d 50 3f             	lea    0x3f(%eax),%edx
   329b7:	85 c0                	test   %eax,%eax
   329b9:	0f 48 c2             	cmovs  %edx,%eax
   329bc:	c1 f8 06             	sar    $0x6,%eax
   329bf:	89 45 e0             	mov    %eax,-0x20(%ebp)
   329c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   329c5:	8d 50 f0             	lea    -0x10(%eax),%edx
   329c8:	89 d0                	mov    %edx,%eax
   329ca:	c1 f8 1f             	sar    $0x1f,%eax
   329cd:	c1 e8 1a             	shr    $0x1a,%eax
   329d0:	01 c2                	add    %eax,%edx
   329d2:	83 e2 3f             	and    $0x3f,%edx
   329d5:	29 c2                	sub    %eax,%edx
   329d7:	89 d0                	mov    %edx,%eax
   329d9:	89 45 dc             	mov    %eax,-0x24(%ebp)
   329dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
   329df:	8b 55 ec             	mov    -0x14(%ebp),%edx
   329e2:	0f ac d0 09          	shrd   $0x9,%edx,%eax
   329e6:	c1 ea 09             	shr    $0x9,%edx
   329e9:	89 c1                	mov    %eax,%ecx
   329eb:	89 d3                	mov    %edx,%ebx
   329ed:	89 4d d8             	mov    %ecx,-0x28(%ebp)
   329f0:	83 7d e4 08          	cmpl   $0x8,-0x1c(%ebp)
   329f4:	7f 1a                	jg     32a10 <hd_rdwt+0xa1>
   329f6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   329f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
   329fc:	c1 e2 03             	shl    $0x3,%edx
   329ff:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   32a05:	01 d0                	add    %edx,%eax
   32a07:	05 e4 c4 03 00       	add    $0x3c4e4,%eax
   32a0c:	8b 00                	mov    (%eax),%eax
   32a0e:	eb 1b                	jmp    32a2b <hd_rdwt+0xbc>
   32a10:	8b 45 dc             	mov    -0x24(%ebp),%eax
   32a13:	8d 50 04             	lea    0x4(%eax),%edx
   32a16:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32a19:	c1 e2 03             	shl    $0x3,%edx
   32a1c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
   32a22:	01 d0                	add    %edx,%eax
   32a24:	05 e4 c4 03 00       	add    $0x3c4e4,%eax
   32a29:	8b 00                	mov    (%eax),%eax
   32a2b:	8b 55 d8             	mov    -0x28(%ebp),%edx
   32a2e:	01 d0                	add    %edx,%eax
   32a30:	89 45 d8             	mov    %eax,-0x28(%ebp)
   32a33:	8b 45 08             	mov    0x8(%ebp),%eax
   32a36:	8b 40 0c             	mov    0xc(%eax),%eax
   32a39:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   32a3c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
   32a3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32a42:	8b 45 08             	mov    0x8(%ebp),%eax
   32a45:	8b 40 10             	mov    0x10(%eax),%eax
   32a48:	89 45 d0             	mov    %eax,-0x30(%ebp)
   32a4b:	8b 45 08             	mov    0x8(%ebp),%eax
   32a4e:	8b 00                	mov    (%eax),%eax
   32a50:	89 45 cc             	mov    %eax,-0x34(%ebp)
   32a53:	83 ec 08             	sub    $0x8,%esp
   32a56:	ff 75 d0             	pushl  -0x30(%ebp)
   32a59:	ff 75 cc             	pushl  -0x34(%ebp)
   32a5c:	e8 15 1b 00 00       	call   34576 <v2l>
   32a61:	83 c4 10             	add    $0x10,%esp
   32a64:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32a67:	8b 45 08             	mov    0x8(%ebp),%eax
   32a6a:	8b 40 04             	mov    0x4(%eax),%eax
   32a6d:	89 45 c8             	mov    %eax,-0x38(%ebp)
   32a70:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
   32a74:	74 22                	je     32a98 <hd_rdwt+0x129>
   32a76:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
   32a7a:	74 1c                	je     32a98 <hd_rdwt+0x129>
   32a7c:	68 61 01 00 00       	push   $0x161
   32a81:	68 02 5d 03 00       	push   $0x35d02
   32a86:	68 02 5d 03 00       	push   $0x35d02
   32a8b:	68 0a 5d 03 00       	push   $0x35d0a
   32a90:	e8 c7 eb ff ff       	call   3165c <assertion_failure>
   32a95:	83 c4 10             	add    $0x10,%esp
   32a98:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
   32a9c:	c6 45 be 01          	movb   $0x1,-0x42(%ebp)
   32aa0:	8b 45 d8             	mov    -0x28(%ebp),%eax
   32aa3:	88 45 bf             	mov    %al,-0x41(%ebp)
   32aa6:	8b 45 d8             	mov    -0x28(%ebp),%eax
   32aa9:	c1 f8 08             	sar    $0x8,%eax
   32aac:	88 45 c0             	mov    %al,-0x40(%ebp)
   32aaf:	8b 45 d8             	mov    -0x28(%ebp),%eax
   32ab2:	c1 f8 10             	sar    $0x10,%eax
   32ab5:	88 45 c1             	mov    %al,-0x3f(%ebp)
   32ab8:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32abb:	c1 f8 18             	sar    $0x18,%eax
   32abe:	89 c2                	mov    %eax,%edx
   32ac0:	8b 45 d8             	mov    -0x28(%ebp),%eax
   32ac3:	c1 e0 04             	shl    $0x4,%eax
   32ac6:	09 d0                	or     %edx,%eax
   32ac8:	83 c8 e0             	or     $0xffffffe0,%eax
   32acb:	88 45 c2             	mov    %al,-0x3e(%ebp)
   32ace:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
   32ad2:	75 07                	jne    32adb <hd_rdwt+0x16c>
   32ad4:	b8 20 00 00 00       	mov    $0x20,%eax
   32ad9:	eb 05                	jmp    32ae0 <hd_rdwt+0x171>
   32adb:	b8 30 00 00 00       	mov    $0x30,%eax
   32ae0:	88 45 c3             	mov    %al,-0x3d(%ebp)
   32ae3:	83 ec 0c             	sub    $0xc,%esp
   32ae6:	8d 45 bd             	lea    -0x43(%ebp),%eax
   32ae9:	50                   	push   %eax
   32aea:	e8 f0 f5 ff ff       	call   320df <hd_cmd_out>
   32aef:	83 c4 10             	add    $0x10,%esp
   32af2:	eb 6e                	jmp    32b62 <hd_rdwt+0x1f3>
   32af4:	b8 00 02 00 00       	mov    $0x200,%eax
   32af9:	81 7d d4 00 02 00 00 	cmpl   $0x200,-0x2c(%ebp)
   32b00:	0f 4e 45 d4          	cmovle -0x2c(%ebp),%eax
   32b04:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   32b07:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
   32b0b:	75 1f                	jne    32b2c <hd_rdwt+0x1bd>
   32b0d:	e8 47 fe ff ff       	call   32959 <interrupt_wait>
   32b12:	83 ec 04             	sub    $0x4,%esp
   32b15:	68 00 02 00 00       	push   $0x200
   32b1a:	ff 75 f0             	pushl  -0x10(%ebp)
   32b1d:	68 f0 01 00 00       	push   $0x1f0
   32b22:	e8 e2 33 00 00       	call   35f09 <read_port>
   32b27:	83 c4 10             	add    $0x10,%esp
   32b2a:	eb 28                	jmp    32b54 <hd_rdwt+0x1e5>
   32b2c:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
   32b30:	75 22                	jne    32b54 <hd_rdwt+0x1e5>
   32b32:	e8 0c fe ff ff       	call   32943 <wait_for>
   32b37:	83 ec 04             	sub    $0x4,%esp
   32b3a:	68 00 02 00 00       	push   $0x200
   32b3f:	ff 75 f0             	pushl  -0x10(%ebp)
   32b42:	68 f0 01 00 00       	push   $0x1f0
   32b47:	e8 d1 33 00 00       	call   35f1d <write_port>
   32b4c:	83 c4 10             	add    $0x10,%esp
   32b4f:	e8 05 fe ff ff       	call   32959 <interrupt_wait>
   32b54:	81 6d f4 00 02 00 00 	subl   $0x200,-0xc(%ebp)
   32b5b:	81 45 f0 00 02 00 00 	addl   $0x200,-0x10(%ebp)
   32b62:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   32b66:	75 8c                	jne    32af4 <hd_rdwt+0x185>
   32b68:	90                   	nop
   32b69:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   32b6c:	c9                   	leave  
   32b6d:	c3                   	ret    
   32b6e:	66 90                	xchg   %ax,%ax

00032b70 <get_ticks>:
   32b70:	b8 00 00 00 00       	mov    $0x0,%eax
   32b75:	cd 90                	int    $0x90
   32b77:	c3                   	ret    

00032b78 <write2>:
   32b78:	b8 01 00 00 00       	mov    $0x1,%eax
   32b7d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32b81:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32b85:	cd 90                	int    $0x90
   32b87:	c3                   	ret    

00032b88 <write_debug>:
   32b88:	b8 02 00 00 00       	mov    $0x2,%eax
   32b8d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32b91:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32b95:	cd 90                	int    $0x90
   32b97:	c3                   	ret    

00032b98 <send_msg>:
   32b98:	b8 03 00 00 00       	mov    $0x3,%eax
   32b9d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32ba1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32ba5:	cd 90                	int    $0x90
   32ba7:	c3                   	ret    

00032ba8 <receive_msg>:
   32ba8:	b8 04 00 00 00       	mov    $0x4,%eax
   32bad:	8b 5c 24 08          	mov    0x8(%esp),%ebx
   32bb1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
   32bb5:	cd 90                	int    $0x90
   32bb7:	c3                   	ret    

00032bb8 <task_fs>:
   32bb8:	55                   	push   %ebp
   32bb9:	89 e5                	mov    %esp,%ebp
   32bbb:	81 ec f8 00 00 00    	sub    $0xf8,%esp
   32bc1:	83 ec 08             	sub    $0x8,%esp
   32bc4:	68 2c 5d 03 00       	push   $0x35d2c
   32bc9:	68 3a 5d 03 00       	push   $0x35d3a
   32bce:	e8 3c e7 ff ff       	call   3130f <Printf>
   32bd3:	83 c4 10             	add    $0x10,%esp
   32bd6:	83 ec 04             	sub    $0x4,%esp
   32bd9:	6a 11                	push   $0x11
   32bdb:	8d 85 14 ff ff ff    	lea    -0xec(%ebp),%eax
   32be1:	50                   	push   %eax
   32be2:	6a 02                	push   $0x2
   32be4:	e8 ca f1 ff ff       	call   31db3 <send_rec>
   32be9:	83 c4 10             	add    $0x10,%esp
   32bec:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
   32bf2:	89 45 f4             	mov    %eax,-0xc(%ebp)
   32bf5:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
   32bfb:	89 45 f0             	mov    %eax,-0x10(%ebp)
   32bfe:	8b 85 54 ff ff ff    	mov    -0xac(%ebp),%eax
   32c04:	89 45 ec             	mov    %eax,-0x14(%ebp)
   32c07:	8b 85 48 ff ff ff    	mov    -0xb8(%ebp),%eax
   32c0d:	89 45 e8             	mov    %eax,-0x18(%ebp)
   32c10:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
   32c16:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   32c19:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32c1c:	69 c0 90 01 00 00    	imul   $0x190,%eax,%eax
   32c22:	05 20 3f 04 00       	add    $0x43f20,%eax
   32c27:	a3 a4 92 03 00       	mov    %eax,0x392a4
   32c2c:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
   32c30:	74 1c                	je     32c4e <task_fs+0x96>
   32c32:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
   32c36:	7f 08                	jg     32c40 <task_fs+0x88>
   32c38:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
   32c3c:	74 3a                	je     32c78 <task_fs+0xc0>
   32c3e:	eb 48                	jmp    32c88 <task_fs+0xd0>
   32c40:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
   32c44:	74 1e                	je     32c64 <task_fs+0xac>
   32c46:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
   32c4a:	74 18                	je     32c64 <task_fs+0xac>
   32c4c:	eb 3a                	jmp    32c88 <task_fs+0xd0>
   32c4e:	83 ec 08             	sub    $0x8,%esp
   32c51:	ff 75 e4             	pushl  -0x1c(%ebp)
   32c54:	ff 75 e8             	pushl  -0x18(%ebp)
   32c57:	e8 f4 03 00 00       	call   33050 <do_open>
   32c5c:	83 c4 10             	add    $0x10,%esp
   32c5f:	89 45 bc             	mov    %eax,-0x44(%ebp)
   32c62:	eb 35                	jmp    32c99 <task_fs+0xe1>
   32c64:	83 ec 0c             	sub    $0xc,%esp
   32c67:	8d 85 14 ff ff ff    	lea    -0xec(%ebp),%eax
   32c6d:	50                   	push   %eax
   32c6e:	e8 5f 12 00 00       	call   33ed2 <do_rdwt>
   32c73:	83 c4 10             	add    $0x10,%esp
   32c76:	eb 21                	jmp    32c99 <task_fs+0xe1>
   32c78:	83 ec 0c             	sub    $0xc,%esp
   32c7b:	ff 75 ec             	pushl  -0x14(%ebp)
   32c7e:	e8 28 16 00 00       	call   342ab <do_close>
   32c83:	83 c4 10             	add    $0x10,%esp
   32c86:	eb 11                	jmp    32c99 <task_fs+0xe1>
   32c88:	83 ec 0c             	sub    $0xc,%esp
   32c8b:	68 3e 5d 03 00       	push   $0x35d3e
   32c90:	e8 a9 e9 ff ff       	call   3163e <panic>
   32c95:	83 c4 10             	add    $0x10,%esp
   32c98:	90                   	nop
   32c99:	c7 45 80 65 00 00 00 	movl   $0x65,-0x80(%ebp)
   32ca0:	83 ec 04             	sub    $0x4,%esp
   32ca3:	ff 75 f0             	pushl  -0x10(%ebp)
   32ca6:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
   32cac:	50                   	push   %eax
   32cad:	6a 01                	push   $0x1
   32caf:	e8 ff f0 ff ff       	call   31db3 <send_rec>
   32cb4:	83 c4 10             	add    $0x10,%esp
   32cb7:	e9 1a ff ff ff       	jmp    32bd6 <task_fs+0x1e>

00032cbc <rd_wt>:
   32cbc:	55                   	push   %ebp
   32cbd:	89 e5                	mov    %esp,%ebp
   32cbf:	83 ec 78             	sub    $0x78,%esp
   32cc2:	83 ec 04             	sub    $0x4,%esp
   32cc5:	6a 68                	push   $0x68
   32cc7:	6a 00                	push   $0x0
   32cc9:	8d 45 90             	lea    -0x70(%ebp),%eax
   32ccc:	50                   	push   %eax
   32ccd:	e8 e3 31 00 00       	call   35eb5 <Memset>
   32cd2:	83 c4 10             	add    $0x10,%esp
   32cd5:	8b 45 18             	mov    0x18(%ebp),%eax
   32cd8:	89 45 94             	mov    %eax,-0x6c(%ebp)
   32cdb:	8b 45 0c             	mov    0xc(%ebp),%eax
   32cde:	89 45 a4             	mov    %eax,-0x5c(%ebp)
   32ce1:	8b 45 10             	mov    0x10(%ebp),%eax
   32ce4:	89 45 a0             	mov    %eax,-0x60(%ebp)
   32ce7:	8b 45 14             	mov    0x14(%ebp),%eax
   32cea:	89 45 9c             	mov    %eax,-0x64(%ebp)
   32ced:	8b 45 08             	mov    0x8(%ebp),%eax
   32cf0:	89 45 a8             	mov    %eax,-0x58(%ebp)
   32cf3:	c7 45 90 03 00 00 00 	movl   $0x3,-0x70(%ebp)
   32cfa:	83 ec 04             	sub    $0x4,%esp
   32cfd:	6a 02                	push   $0x2
   32cff:	8d 45 90             	lea    -0x70(%ebp),%eax
   32d02:	50                   	push   %eax
   32d03:	6a 03                	push   $0x3
   32d05:	e8 a9 f0 ff ff       	call   31db3 <send_rec>
   32d0a:	83 c4 10             	add    $0x10,%esp
   32d0d:	90                   	nop
   32d0e:	c9                   	leave  
   32d0f:	c3                   	ret    

00032d10 <mkfs>:
   32d10:	55                   	push   %ebp
   32d11:	89 e5                	mov    %esp,%ebp
   32d13:	83 ec 78             	sub    $0x78,%esp
   32d16:	83 ec 04             	sub    $0x4,%esp
   32d19:	68 00 02 00 00       	push   $0x200
   32d1e:	6a 00                	push   $0x0
   32d20:	8d 45 c4             	lea    -0x3c(%ebp),%eax
   32d23:	50                   	push   %eax
   32d24:	e8 8c 31 00 00       	call   35eb5 <Memset>
   32d29:	83 c4 10             	add    $0x10,%esp
   32d2c:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
   32d33:	c7 45 cc 00 40 00 00 	movl   $0x4000,-0x34(%ebp)
   32d3a:	c7 45 d0 80 00 00 00 	movl   $0x80,-0x30(%ebp)
   32d41:	8b 45 c8             	mov    -0x38(%ebp),%eax
   32d44:	8d 50 02             	lea    0x2(%eax),%edx
   32d47:	8b 45 cc             	mov    -0x34(%ebp),%eax
   32d4a:	01 c2                	add    %eax,%edx
   32d4c:	8b 45 d0             	mov    -0x30(%ebp),%eax
   32d4f:	01 d0                	add    %edx,%eax
   32d51:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   32d54:	a1 10 80 03 00       	mov    0x38010,%eax
   32d59:	83 ec 04             	sub    $0x4,%esp
   32d5c:	68 00 02 00 00       	push   $0x200
   32d61:	8d 55 c4             	lea    -0x3c(%ebp),%edx
   32d64:	52                   	push   %edx
   32d65:	50                   	push   %eax
   32d66:	e8 1c 31 00 00       	call   35e87 <Memcpy>
   32d6b:	83 c4 10             	add    $0x10,%esp
   32d6e:	a1 10 80 03 00       	mov    0x38010,%eax
   32d73:	83 ec 0c             	sub    $0xc,%esp
   32d76:	6a 02                	push   $0x2
   32d78:	68 00 02 00 00       	push   $0x200
   32d7d:	50                   	push   %eax
   32d7e:	6a 20                	push   $0x20
   32d80:	6a 01                	push   $0x1
   32d82:	e8 35 ff ff ff       	call   32cbc <rd_wt>
   32d87:	83 c4 20             	add    $0x20,%esp
   32d8a:	c6 45 ef 03          	movb   $0x3,-0x11(%ebp)
   32d8e:	0f be 45 ef          	movsbl -0x11(%ebp),%eax
   32d92:	89 c2                	mov    %eax,%edx
   32d94:	a1 10 80 03 00       	mov    0x38010,%eax
   32d99:	83 ec 04             	sub    $0x4,%esp
   32d9c:	6a 01                	push   $0x1
   32d9e:	52                   	push   %edx
   32d9f:	50                   	push   %eax
   32da0:	e8 e2 30 00 00       	call   35e87 <Memcpy>
   32da5:	83 c4 10             	add    $0x10,%esp
   32da8:	a1 10 80 03 00       	mov    0x38010,%eax
   32dad:	83 c0 01             	add    $0x1,%eax
   32db0:	83 ec 04             	sub    $0x4,%esp
   32db3:	68 ff 01 00 00       	push   $0x1ff
   32db8:	6a 00                	push   $0x0
   32dba:	50                   	push   %eax
   32dbb:	e8 c7 30 00 00       	call   35e87 <Memcpy>
   32dc0:	83 c4 10             	add    $0x10,%esp
   32dc3:	a1 10 80 03 00       	mov    0x38010,%eax
   32dc8:	83 ec 0c             	sub    $0xc,%esp
   32dcb:	6a 02                	push   $0x2
   32dcd:	68 00 02 00 00       	push   $0x200
   32dd2:	50                   	push   %eax
   32dd3:	6a 20                	push   $0x20
   32dd5:	6a 02                	push   $0x2
   32dd7:	e8 e0 fe ff ff       	call   32cbc <rd_wt>
   32ddc:	83 c4 20             	add    $0x20,%esp
   32ddf:	c7 45 e8 03 00 00 00 	movl   $0x3,-0x18(%ebp)
   32de6:	a1 10 80 03 00       	mov    0x38010,%eax
   32deb:	83 ec 04             	sub    $0x4,%esp
   32dee:	68 00 01 00 00       	push   $0x100
   32df3:	6a ff                	push   $0xffffffff
   32df5:	50                   	push   %eax
   32df6:	e8 ba 30 00 00       	call   35eb5 <Memset>
   32dfb:	83 c4 10             	add    $0x10,%esp
   32dfe:	a1 10 80 03 00       	mov    0x38010,%eax
   32e03:	05 00 01 00 00       	add    $0x100,%eax
   32e08:	83 ec 04             	sub    $0x4,%esp
   32e0b:	6a 01                	push   $0x1
   32e0d:	6a 01                	push   $0x1
   32e0f:	50                   	push   %eax
   32e10:	e8 a0 30 00 00       	call   35eb5 <Memset>
   32e15:	83 c4 10             	add    $0x10,%esp
   32e18:	a1 10 80 03 00       	mov    0x38010,%eax
   32e1d:	05 01 01 00 00       	add    $0x101,%eax
   32e22:	83 ec 04             	sub    $0x4,%esp
   32e25:	68 00 02 00 00       	push   $0x200
   32e2a:	6a 00                	push   $0x0
   32e2c:	50                   	push   %eax
   32e2d:	e8 83 30 00 00       	call   35eb5 <Memset>
   32e32:	83 c4 10             	add    $0x10,%esp
   32e35:	a1 10 80 03 00       	mov    0x38010,%eax
   32e3a:	83 ec 0c             	sub    $0xc,%esp
   32e3d:	6a 02                	push   $0x2
   32e3f:	68 00 02 00 00       	push   $0x200
   32e44:	50                   	push   %eax
   32e45:	6a 20                	push   $0x20
   32e47:	ff 75 e8             	pushl  -0x18(%ebp)
   32e4a:	e8 6d fe ff ff       	call   32cbc <rd_wt>
   32e4f:	83 c4 20             	add    $0x20,%esp
   32e52:	8b 45 cc             	mov    -0x34(%ebp),%eax
   32e55:	83 e8 01             	sub    $0x1,%eax
   32e58:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   32e5b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
   32e62:	eb 3f                	jmp    32ea3 <mkfs+0x193>
   32e64:	a1 10 80 03 00       	mov    0x38010,%eax
   32e69:	83 ec 04             	sub    $0x4,%esp
   32e6c:	68 00 02 00 00       	push   $0x200
   32e71:	6a 00                	push   $0x0
   32e73:	50                   	push   %eax
   32e74:	e8 3c 30 00 00       	call   35eb5 <Memset>
   32e79:	83 c4 10             	add    $0x10,%esp
   32e7c:	a1 10 80 03 00       	mov    0x38010,%eax
   32e81:	8b 4d e8             	mov    -0x18(%ebp),%ecx
   32e84:	8b 55 f4             	mov    -0xc(%ebp),%edx
   32e87:	01 ca                	add    %ecx,%edx
   32e89:	83 ec 0c             	sub    $0xc,%esp
   32e8c:	6a 02                	push   $0x2
   32e8e:	68 00 02 00 00       	push   $0x200
   32e93:	50                   	push   %eax
   32e94:	6a 20                	push   $0x20
   32e96:	52                   	push   %edx
   32e97:	e8 20 fe ff ff       	call   32cbc <rd_wt>
   32e9c:	83 c4 20             	add    $0x20,%esp
   32e9f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   32ea3:	8b 45 f4             	mov    -0xc(%ebp),%eax
   32ea6:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
   32ea9:	7e b9                	jle    32e64 <mkfs+0x154>
   32eab:	a1 10 80 03 00       	mov    0x38010,%eax
   32eb0:	83 ec 04             	sub    $0x4,%esp
   32eb3:	68 00 02 00 00       	push   $0x200
   32eb8:	6a 00                	push   $0x0
   32eba:	50                   	push   %eax
   32ebb:	e8 f5 2f 00 00       	call   35eb5 <Memset>
   32ec0:	83 c4 10             	add    $0x10,%esp
   32ec3:	c7 45 a8 02 00 00 00 	movl   $0x2,-0x58(%ebp)
   32eca:	c7 45 ac 14 00 00 00 	movl   $0x14,-0x54(%ebp)
   32ed1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
   32ed4:	89 45 b0             	mov    %eax,-0x50(%ebp)
   32ed7:	c7 45 b4 00 08 00 00 	movl   $0x800,-0x4c(%ebp)
   32ede:	a1 10 80 03 00       	mov    0x38010,%eax
   32ee3:	83 ec 04             	sub    $0x4,%esp
   32ee6:	6a 10                	push   $0x10
   32ee8:	8d 55 a8             	lea    -0x58(%ebp),%edx
   32eeb:	52                   	push   %edx
   32eec:	50                   	push   %eax
   32eed:	e8 95 2f 00 00       	call   35e87 <Memcpy>
   32ef2:	83 c4 10             	add    $0x10,%esp
   32ef5:	a1 10 80 03 00       	mov    0x38010,%eax
   32efa:	8b 55 cc             	mov    -0x34(%ebp),%edx
   32efd:	83 c2 03             	add    $0x3,%edx
   32f00:	83 ec 0c             	sub    $0xc,%esp
   32f03:	6a 02                	push   $0x2
   32f05:	68 00 02 00 00       	push   $0x200
   32f0a:	50                   	push   %eax
   32f0b:	6a 20                	push   $0x20
   32f0d:	52                   	push   %edx
   32f0e:	e8 a9 fd ff ff       	call   32cbc <rd_wt>
   32f13:	83 c4 20             	add    $0x20,%esp
   32f16:	a1 10 80 03 00       	mov    0x38010,%eax
   32f1b:	8b 55 cc             	mov    -0x34(%ebp),%edx
   32f1e:	83 c2 03             	add    $0x3,%edx
   32f21:	83 ec 0c             	sub    $0xc,%esp
   32f24:	6a 01                	push   $0x1
   32f26:	68 00 02 00 00       	push   $0x200
   32f2b:	50                   	push   %eax
   32f2c:	6a 20                	push   $0x20
   32f2e:	52                   	push   %edx
   32f2f:	e8 88 fd ff ff       	call   32cbc <rd_wt>
   32f34:	83 c4 20             	add    $0x20,%esp
   32f37:	a1 10 80 03 00       	mov    0x38010,%eax
   32f3c:	89 45 e0             	mov    %eax,-0x20(%ebp)
   32f3f:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32f42:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
   32f48:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32f4b:	c7 40 04 14 00 00 00 	movl   $0x14,0x4(%eax)
   32f52:	8b 55 c4             	mov    -0x3c(%ebp),%edx
   32f55:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32f58:	89 50 08             	mov    %edx,0x8(%eax)
   32f5b:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32f5e:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
   32f65:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   32f6c:	eb 4d                	jmp    32fbb <mkfs+0x2ab>
   32f6e:	8b 15 10 80 03 00    	mov    0x38010,%edx
   32f74:	8b 45 f0             	mov    -0x10(%ebp),%eax
   32f77:	83 c0 01             	add    $0x1,%eax
   32f7a:	6b c0 1c             	imul   $0x1c,%eax,%eax
   32f7d:	01 d0                	add    %edx,%eax
   32f7f:	89 45 e0             	mov    %eax,-0x20(%ebp)
   32f82:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32f85:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
   32f8b:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32f8e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   32f95:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32f98:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   32f9f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
   32fa6:	8b 45 dc             	mov    -0x24(%ebp),%eax
   32fa9:	c1 e0 08             	shl    $0x8,%eax
   32fac:	0b 45 f0             	or     -0x10(%ebp),%eax
   32faf:	89 c2                	mov    %eax,%edx
   32fb1:	8b 45 e0             	mov    -0x20(%ebp),%eax
   32fb4:	89 50 08             	mov    %edx,0x8(%eax)
   32fb7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   32fbb:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
   32fbf:	7e ad                	jle    32f6e <mkfs+0x25e>
   32fc1:	a1 10 80 03 00       	mov    0x38010,%eax
   32fc6:	8b 55 cc             	mov    -0x34(%ebp),%edx
   32fc9:	83 c2 03             	add    $0x3,%edx
   32fcc:	83 ec 0c             	sub    $0xc,%esp
   32fcf:	6a 02                	push   $0x2
   32fd1:	68 00 02 00 00       	push   $0x200
   32fd6:	50                   	push   %eax
   32fd7:	6a 20                	push   $0x20
   32fd9:	52                   	push   %edx
   32fda:	e8 dd fc ff ff       	call   32cbc <rd_wt>
   32fdf:	83 c4 20             	add    $0x20,%esp
   32fe2:	c7 45 94 01 00 00 00 	movl   $0x1,-0x6c(%ebp)
   32fe9:	c6 45 92 2e          	movb   $0x2e,-0x6e(%ebp)
   32fed:	c6 45 93 30          	movb   $0x30,-0x6d(%ebp)
   32ff1:	83 ec 04             	sub    $0x4,%esp
   32ff4:	6a 02                	push   $0x2
   32ff6:	8d 45 92             	lea    -0x6e(%ebp),%eax
   32ff9:	50                   	push   %eax
   32ffa:	8d 45 94             	lea    -0x6c(%ebp),%eax
   32ffd:	83 c0 04             	add    $0x4,%eax
   33000:	50                   	push   %eax
   33001:	e8 81 2e 00 00       	call   35e87 <Memcpy>
   33006:	83 c4 10             	add    $0x10,%esp
   33009:	a1 10 80 03 00       	mov    0x38010,%eax
   3300e:	83 ec 04             	sub    $0x4,%esp
   33011:	6a 14                	push   $0x14
   33013:	8d 55 94             	lea    -0x6c(%ebp),%edx
   33016:	52                   	push   %edx
   33017:	50                   	push   %eax
   33018:	e8 6a 2e 00 00       	call   35e87 <Memcpy>
   3301d:	83 c4 10             	add    $0x10,%esp
   33020:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33026:	8b 45 c4             	mov    -0x3c(%ebp),%eax
   33029:	83 ec 0c             	sub    $0xc,%esp
   3302c:	6a 02                	push   $0x2
   3302e:	68 00 02 00 00       	push   $0x200
   33033:	52                   	push   %edx
   33034:	6a 20                	push   $0x20
   33036:	50                   	push   %eax
   33037:	e8 80 fc ff ff       	call   32cbc <rd_wt>
   3303c:	83 c4 20             	add    $0x20,%esp
   3303f:	90                   	nop
   33040:	c9                   	leave  
   33041:	c3                   	ret    

00033042 <init_fs>:
   33042:	55                   	push   %ebp
   33043:	89 e5                	mov    %esp,%ebp
   33045:	83 ec 08             	sub    $0x8,%esp
   33048:	e8 c3 fc ff ff       	call   32d10 <mkfs>
   3304d:	90                   	nop
   3304e:	c9                   	leave  
   3304f:	c3                   	ret    

00033050 <do_open>:
   33050:	55                   	push   %ebp
   33051:	89 e5                	mov    %esp,%ebp
   33053:	83 ec 28             	sub    $0x28,%esp
   33056:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
   3305d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   33064:	eb 1f                	jmp    33085 <do_open+0x35>
   33066:	a1 a4 92 03 00       	mov    0x392a4,%eax
   3306b:	8b 55 f0             	mov    -0x10(%ebp),%edx
   3306e:	83 c2 1c             	add    $0x1c,%edx
   33071:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
   33075:	85 c0                	test   %eax,%eax
   33077:	75 08                	jne    33081 <do_open+0x31>
   33079:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3307c:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3307f:	eb 0a                	jmp    3308b <do_open+0x3b>
   33081:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   33085:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
   33089:	7e db                	jle    33066 <do_open+0x16>
   3308b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
   3308f:	75 1c                	jne    330ad <do_open+0x5d>
   33091:	68 f4 00 00 00       	push   $0xf4
   33096:	68 4e 5d 03 00       	push   $0x35d4e
   3309b:	68 4e 5d 03 00       	push   $0x35d4e
   330a0:	68 5b 5d 03 00       	push   $0x35d5b
   330a5:	e8 b2 e5 ff ff       	call   3165c <assertion_failure>
   330aa:	83 c4 10             	add    $0x10,%esp
   330ad:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
   330b4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   330bb:	eb 1d                	jmp    330da <do_open+0x8a>
   330bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
   330c0:	8b 04 85 20 c7 03 00 	mov    0x3c720(,%eax,4),%eax
   330c7:	8b 40 08             	mov    0x8(%eax),%eax
   330ca:	85 c0                	test   %eax,%eax
   330cc:	75 08                	jne    330d6 <do_open+0x86>
   330ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
   330d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
   330d4:	eb 0a                	jmp    330e0 <do_open+0x90>
   330d6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
   330da:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
   330de:	7e dd                	jle    330bd <do_open+0x6d>
   330e0:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
   330e4:	75 1c                	jne    33102 <do_open+0xb2>
   330e6:	68 fe 00 00 00       	push   $0xfe
   330eb:	68 4e 5d 03 00       	push   $0x35d4e
   330f0:	68 4e 5d 03 00       	push   $0x35d4e
   330f5:	68 63 5d 03 00       	push   $0x35d63
   330fa:	e8 5d e5 ff ff       	call   3165c <assertion_failure>
   330ff:	83 c4 10             	add    $0x10,%esp
   33102:	83 ec 0c             	sub    $0xc,%esp
   33105:	ff 75 08             	pushl  0x8(%ebp)
   33108:	e8 ab 00 00 00       	call   331b8 <search_file>
   3310d:	83 c4 10             	add    $0x10,%esp
   33110:	89 45 e0             	mov    %eax,-0x20(%ebp)
   33113:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
   33117:	75 29                	jne    33142 <do_open+0xf2>
   33119:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
   3311d:	7e 10                	jle    3312f <do_open+0xdf>
   3311f:	83 ec 0c             	sub    $0xc,%esp
   33122:	68 6b 5d 03 00       	push   $0x35d6b
   33127:	e8 12 e5 ff ff       	call   3163e <panic>
   3312c:	83 c4 10             	add    $0x10,%esp
   3312f:	83 ec 0c             	sub    $0xc,%esp
   33132:	ff 75 08             	pushl  0x8(%ebp)
   33135:	e8 b6 03 00 00       	call   334f0 <create_file>
   3313a:	83 c4 10             	add    $0x10,%esp
   3313d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   33140:	eb 11                	jmp    33153 <do_open+0x103>
   33142:	83 ec 0c             	sub    $0xc,%esp
   33145:	ff 75 e0             	pushl  -0x20(%ebp)
   33148:	e8 73 02 00 00       	call   333c0 <get_inode>
   3314d:	83 c4 10             	add    $0x10,%esp
   33150:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   33153:	83 ec 0c             	sub    $0xc,%esp
   33156:	68 78 5d 03 00       	push   $0x35d78
   3315b:	e8 de e4 ff ff       	call   3163e <panic>
   33160:	83 c4 10             	add    $0x10,%esp
   33163:	a1 a4 92 03 00       	mov    0x392a4,%eax
   33168:	8b 55 ec             	mov    -0x14(%ebp),%edx
   3316b:	8b 14 95 20 c7 03 00 	mov    0x3c720(,%edx,4),%edx
   33172:	8b 4d f4             	mov    -0xc(%ebp),%ecx
   33175:	83 c1 1c             	add    $0x1c,%ecx
   33178:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
   3317c:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3317f:	8b 04 85 20 c7 03 00 	mov    0x3c720(,%eax,4),%eax
   33186:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   33189:	89 50 08             	mov    %edx,0x8(%eax)
   3318c:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3318f:	8b 04 85 20 c7 03 00 	mov    0x3c720(,%eax,4),%eax
   33196:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   3319d:	8b 45 ec             	mov    -0x14(%ebp),%eax
   331a0:	8b 04 85 20 c7 03 00 	mov    0x3c720(,%eax,4),%eax
   331a7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   331ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
   331b0:	89 45 dc             	mov    %eax,-0x24(%ebp)
   331b3:	8b 45 dc             	mov    -0x24(%ebp),%eax
   331b6:	c9                   	leave  
   331b7:	c3                   	ret    

000331b8 <search_file>:
   331b8:	55                   	push   %ebp
   331b9:	89 e5                	mov    %esp,%ebp
   331bb:	83 ec 48             	sub    $0x48,%esp
   331be:	83 ec 04             	sub    $0x4,%esp
   331c1:	ff 75 e4             	pushl  -0x1c(%ebp)
   331c4:	ff 75 08             	pushl  0x8(%ebp)
   331c7:	8d 45 ba             	lea    -0x46(%ebp),%eax
   331ca:	50                   	push   %eax
   331cb:	e8 13 01 00 00       	call   332e3 <strip_path>
   331d0:	83 c4 10             	add    $0x10,%esp
   331d3:	89 45 e0             	mov    %eax,-0x20(%ebp)
   331d6:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
   331da:	75 1c                	jne    331f8 <search_file+0x40>
   331dc:	68 23 01 00 00       	push   $0x123
   331e1:	68 4e 5d 03 00       	push   $0x35d4e
   331e6:	68 4e 5d 03 00       	push   $0x35d4e
   331eb:	68 8b 5d 03 00       	push   $0x35d8b
   331f0:	e8 67 e4 ff ff       	call   3165c <assertion_failure>
   331f5:	83 c4 10             	add    $0x10,%esp
   331f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   331fb:	8b 40 04             	mov    0x4(%eax),%eax
   331fe:	89 45 dc             	mov    %eax,-0x24(%ebp)
   33201:	8b 45 dc             	mov    -0x24(%ebp),%eax
   33204:	05 00 02 00 00       	add    $0x200,%eax
   33209:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
   3320f:	85 c0                	test   %eax,%eax
   33211:	0f 48 c2             	cmovs  %edx,%eax
   33214:	c1 f8 09             	sar    $0x9,%eax
   33217:	89 45 d8             	mov    %eax,-0x28(%ebp)
   3321a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   3321d:	8b 40 04             	mov    0x4(%eax),%eax
   33220:	ba 39 8e e3 38       	mov    $0x38e38e39,%edx
   33225:	f7 e2                	mul    %edx
   33227:	89 d0                	mov    %edx,%eax
   33229:	c1 e8 02             	shr    $0x2,%eax
   3322c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   3322f:	e8 ea 10 00 00       	call   3431e <get_super_block>
   33234:	89 45 d0             	mov    %eax,-0x30(%ebp)
   33237:	8b 45 d0             	mov    -0x30(%ebp),%eax
   3323a:	8b 00                	mov    (%eax),%eax
   3323c:	89 45 cc             	mov    %eax,-0x34(%ebp)
   3323f:	a1 6c bc 03 00       	mov    0x3bc6c,%eax
   33244:	89 45 c8             	mov    %eax,-0x38(%ebp)
   33247:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3324e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   33255:	eb 79                	jmp    332d0 <search_file+0x118>
   33257:	a1 10 80 03 00       	mov    0x38010,%eax
   3325c:	8b 4d cc             	mov    -0x34(%ebp),%ecx
   3325f:	8b 55 f0             	mov    -0x10(%ebp),%edx
   33262:	01 ca                	add    %ecx,%edx
   33264:	83 ec 0c             	sub    $0xc,%esp
   33267:	6a 01                	push   $0x1
   33269:	68 00 02 00 00       	push   $0x200
   3326e:	50                   	push   %eax
   3326f:	ff 75 c8             	pushl  -0x38(%ebp)
   33272:	52                   	push   %edx
   33273:	e8 44 fa ff ff       	call   32cbc <rd_wt>
   33278:	83 c4 20             	add    $0x20,%esp
   3327b:	a1 10 80 03 00       	mov    0x38010,%eax
   33280:	89 45 ec             	mov    %eax,-0x14(%ebp)
   33283:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   3328a:	eb 35                	jmp    332c1 <search_file+0x109>
   3328c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   33290:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33293:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
   33296:	7f 33                	jg     332cb <search_file+0x113>
   33298:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3329b:	83 c0 04             	add    $0x4,%eax
   3329e:	83 ec 08             	sub    $0x8,%esp
   332a1:	50                   	push   %eax
   332a2:	8d 45 ba             	lea    -0x46(%ebp),%eax
   332a5:	50                   	push   %eax
   332a6:	e8 a6 00 00 00       	call   33351 <strcmp>
   332ab:	83 c4 10             	add    $0x10,%esp
   332ae:	85 c0                	test   %eax,%eax
   332b0:	75 07                	jne    332b9 <search_file+0x101>
   332b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
   332b5:	8b 00                	mov    (%eax),%eax
   332b7:	eb 28                	jmp    332e1 <search_file+0x129>
   332b9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
   332bd:	83 45 ec 14          	addl   $0x14,-0x14(%ebp)
   332c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
   332c4:	83 f8 1b             	cmp    $0x1b,%eax
   332c7:	76 c3                	jbe    3328c <search_file+0xd4>
   332c9:	eb 01                	jmp    332cc <search_file+0x114>
   332cb:	90                   	nop
   332cc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   332d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
   332d3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
   332d6:	0f 8c 7b ff ff ff    	jl     33257 <search_file+0x9f>
   332dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   332e1:	c9                   	leave  
   332e2:	c3                   	ret    

000332e3 <strip_path>:
   332e3:	55                   	push   %ebp
   332e4:	89 e5                	mov    %esp,%ebp
   332e6:	83 ec 10             	sub    $0x10,%esp
   332e9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   332ed:	75 07                	jne    332f6 <strip_path+0x13>
   332ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   332f4:	eb 59                	jmp    3334f <strip_path+0x6c>
   332f6:	8b 45 08             	mov    0x8(%ebp),%eax
   332f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
   332fc:	8b 45 0c             	mov    0xc(%ebp),%eax
   332ff:	89 45 f8             	mov    %eax,-0x8(%ebp)
   33302:	8b 45 f8             	mov    -0x8(%ebp),%eax
   33305:	0f b6 00             	movzbl (%eax),%eax
   33308:	3c 2f                	cmp    $0x2f,%al
   3330a:	75 2a                	jne    33336 <strip_path+0x53>
   3330c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   33310:	eb 24                	jmp    33336 <strip_path+0x53>
   33312:	8b 45 f8             	mov    -0x8(%ebp),%eax
   33315:	0f b6 00             	movzbl (%eax),%eax
   33318:	3c 2f                	cmp    $0x2f,%al
   3331a:	75 07                	jne    33323 <strip_path+0x40>
   3331c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   33321:	eb 2c                	jmp    3334f <strip_path+0x6c>
   33323:	8b 45 f8             	mov    -0x8(%ebp),%eax
   33326:	0f b6 10             	movzbl (%eax),%edx
   33329:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3332c:	88 10                	mov    %dl,(%eax)
   3332e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   33332:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   33336:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
   3333a:	75 d6                	jne    33312 <strip_path+0x2f>
   3333c:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3333f:	c6 00 00             	movb   $0x0,(%eax)
   33342:	a1 6c bc 03 00       	mov    0x3bc6c,%eax
   33347:	89 45 10             	mov    %eax,0x10(%ebp)
   3334a:	b8 00 00 00 00       	mov    $0x0,%eax
   3334f:	c9                   	leave  
   33350:	c3                   	ret    

00033351 <strcmp>:
   33351:	55                   	push   %ebp
   33352:	89 e5                	mov    %esp,%ebp
   33354:	83 ec 10             	sub    $0x10,%esp
   33357:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
   3335b:	74 06                	je     33363 <strcmp+0x12>
   3335d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   33361:	75 08                	jne    3336b <strcmp+0x1a>
   33363:	8b 45 08             	mov    0x8(%ebp),%eax
   33366:	2b 45 0c             	sub    0xc(%ebp),%eax
   33369:	eb 53                	jmp    333be <strcmp+0x6d>
   3336b:	8b 45 08             	mov    0x8(%ebp),%eax
   3336e:	89 45 fc             	mov    %eax,-0x4(%ebp)
   33371:	8b 45 0c             	mov    0xc(%ebp),%eax
   33374:	89 45 f8             	mov    %eax,-0x8(%ebp)
   33377:	eb 18                	jmp    33391 <strcmp+0x40>
   33379:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3337c:	0f b6 10             	movzbl (%eax),%edx
   3337f:	8b 45 f8             	mov    -0x8(%ebp),%eax
   33382:	0f b6 00             	movzbl (%eax),%eax
   33385:	38 c2                	cmp    %al,%dl
   33387:	75 1e                	jne    333a7 <strcmp+0x56>
   33389:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3338d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   33391:	8b 45 fc             	mov    -0x4(%ebp),%eax
   33394:	0f b6 00             	movzbl (%eax),%eax
   33397:	84 c0                	test   %al,%al
   33399:	74 0d                	je     333a8 <strcmp+0x57>
   3339b:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3339e:	0f b6 00             	movzbl (%eax),%eax
   333a1:	84 c0                	test   %al,%al
   333a3:	75 d4                	jne    33379 <strcmp+0x28>
   333a5:	eb 01                	jmp    333a8 <strcmp+0x57>
   333a7:	90                   	nop
   333a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
   333ab:	0f b6 00             	movzbl (%eax),%eax
   333ae:	0f be d0             	movsbl %al,%edx
   333b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
   333b4:	0f b6 00             	movzbl (%eax),%eax
   333b7:	0f be c0             	movsbl %al,%eax
   333ba:	29 c2                	sub    %eax,%edx
   333bc:	89 d0                	mov    %edx,%eax
   333be:	c9                   	leave  
   333bf:	c3                   	ret    

000333c0 <get_inode>:
   333c0:	55                   	push   %ebp
   333c1:	89 e5                	mov    %esp,%ebp
   333c3:	56                   	push   %esi
   333c4:	53                   	push   %ebx
   333c5:	83 ec 20             	sub    $0x20,%esp
   333c8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
   333cc:	75 0a                	jne    333d8 <get_inode+0x18>
   333ce:	b8 00 00 00 00       	mov    $0x0,%eax
   333d3:	e9 11 01 00 00       	jmp    334e9 <get_inode+0x129>
   333d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   333df:	c7 45 f0 20 c8 03 00 	movl   $0x3c820,-0x10(%ebp)
   333e6:	eb 29                	jmp    33411 <get_inode+0x51>
   333e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
   333eb:	8b 40 18             	mov    0x18(%eax),%eax
   333ee:	85 c0                	test   %eax,%eax
   333f0:	7e 13                	jle    33405 <get_inode+0x45>
   333f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
   333f5:	8b 40 10             	mov    0x10(%eax),%eax
   333f8:	39 45 08             	cmp    %eax,0x8(%ebp)
   333fb:	75 10                	jne    3340d <get_inode+0x4d>
   333fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33400:	e9 e4 00 00 00       	jmp    334e9 <get_inode+0x129>
   33405:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33408:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3340b:	eb 0d                	jmp    3341a <get_inode+0x5a>
   3340d:	83 45 f0 1c          	addl   $0x1c,-0x10(%ebp)
   33411:	81 7d f0 20 cf 03 00 	cmpl   $0x3cf20,-0x10(%ebp)
   33418:	76 ce                	jbe    333e8 <get_inode+0x28>
   3341a:	e8 ff 0e 00 00       	call   3431e <get_super_block>
   3341f:	89 45 ec             	mov    %eax,-0x14(%ebp)
   33422:	c7 45 e8 1c 00 00 00 	movl   $0x1c,-0x18(%ebp)
   33429:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3342c:	8b 40 04             	mov    0x4(%eax),%eax
   3342f:	8d 50 02             	lea    0x2(%eax),%edx
   33432:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33435:	8b 40 08             	mov    0x8(%eax),%eax
   33438:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
   3343b:	8b 45 08             	mov    0x8(%ebp),%eax
   3343e:	8d 48 ff             	lea    -0x1(%eax),%ecx
   33441:	b8 00 02 00 00       	mov    $0x200,%eax
   33446:	99                   	cltd   
   33447:	f7 7d e8             	idivl  -0x18(%ebp)
   3344a:	89 c6                	mov    %eax,%esi
   3344c:	89 c8                	mov    %ecx,%eax
   3344e:	99                   	cltd   
   3344f:	f7 fe                	idiv   %esi
   33451:	01 d8                	add    %ebx,%eax
   33453:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   33456:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
   3345d:	a1 10 80 03 00       	mov    0x38010,%eax
   33462:	83 ec 0c             	sub    $0xc,%esp
   33465:	6a 01                	push   $0x1
   33467:	68 00 02 00 00       	push   $0x200
   3346c:	50                   	push   %eax
   3346d:	ff 75 e0             	pushl  -0x20(%ebp)
   33470:	ff 75 e4             	pushl  -0x1c(%ebp)
   33473:	e8 44 f8 ff ff       	call   32cbc <rd_wt>
   33478:	83 c4 20             	add    $0x20,%esp
   3347b:	8b 45 08             	mov    0x8(%ebp),%eax
   3347e:	8d 48 ff             	lea    -0x1(%eax),%ecx
   33481:	b8 00 02 00 00       	mov    $0x200,%eax
   33486:	99                   	cltd   
   33487:	f7 7d e8             	idivl  -0x18(%ebp)
   3348a:	89 c3                	mov    %eax,%ebx
   3348c:	89 c8                	mov    %ecx,%eax
   3348e:	99                   	cltd   
   3348f:	f7 fb                	idiv   %ebx
   33491:	89 55 dc             	mov    %edx,-0x24(%ebp)
   33494:	8b 15 10 80 03 00    	mov    0x38010,%edx
   3349a:	8b 45 e8             	mov    -0x18(%ebp),%eax
   3349d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
   334a1:	01 d0                	add    %edx,%eax
   334a3:	89 45 d8             	mov    %eax,-0x28(%ebp)
   334a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
   334a9:	8b 55 08             	mov    0x8(%ebp),%edx
   334ac:	89 50 10             	mov    %edx,0x10(%eax)
   334af:	8b 45 d8             	mov    -0x28(%ebp),%eax
   334b2:	8b 50 04             	mov    0x4(%eax),%edx
   334b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
   334b8:	89 50 04             	mov    %edx,0x4(%eax)
   334bb:	8b 45 d8             	mov    -0x28(%ebp),%eax
   334be:	8b 50 08             	mov    0x8(%eax),%edx
   334c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
   334c4:	89 50 08             	mov    %edx,0x8(%eax)
   334c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
   334ca:	8b 10                	mov    (%eax),%edx
   334cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
   334cf:	89 10                	mov    %edx,(%eax)
   334d1:	8b 45 d8             	mov    -0x28(%ebp),%eax
   334d4:	8b 50 0c             	mov    0xc(%eax),%edx
   334d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
   334da:	89 50 0c             	mov    %edx,0xc(%eax)
   334dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
   334e0:	8b 55 e0             	mov    -0x20(%ebp),%edx
   334e3:	89 50 14             	mov    %edx,0x14(%eax)
   334e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
   334e9:	8d 65 f8             	lea    -0x8(%ebp),%esp
   334ec:	5b                   	pop    %ebx
   334ed:	5e                   	pop    %esi
   334ee:	5d                   	pop    %ebp
   334ef:	c3                   	ret    

000334f0 <create_file>:
   334f0:	55                   	push   %ebp
   334f1:	89 e5                	mov    %esp,%ebp
   334f3:	83 ec 38             	sub    $0x38,%esp
   334f6:	ff 75 f4             	pushl  -0xc(%ebp)
   334f9:	ff 75 08             	pushl  0x8(%ebp)
   334fc:	8d 45 ce             	lea    -0x32(%ebp),%eax
   334ff:	50                   	push   %eax
   33500:	e8 de fd ff ff       	call   332e3 <strip_path>
   33505:	83 c4 0c             	add    $0xc,%esp
   33508:	83 f8 ff             	cmp    $0xffffffff,%eax
   3350b:	75 0a                	jne    33517 <create_file+0x27>
   3350d:	b8 00 00 00 00       	mov    $0x0,%eax
   33512:	e9 90 00 00 00       	jmp    335a7 <create_file+0xb7>
   33517:	e8 8d 00 00 00       	call   335a9 <alloc_imap_bit>
   3351c:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3351f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   33523:	75 07                	jne    3352c <create_file+0x3c>
   33525:	b8 00 00 00 00       	mov    $0x0,%eax
   3352a:	eb 7b                	jmp    335a7 <create_file+0xb7>
   3352c:	e8 ed 0d 00 00       	call   3431e <get_super_block>
   33531:	89 45 ec             	mov    %eax,-0x14(%ebp)
   33534:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33537:	8b 40 10             	mov    0x10(%eax),%eax
   3353a:	89 45 e8             	mov    %eax,-0x18(%ebp)
   3353d:	83 ec 08             	sub    $0x8,%esp
   33540:	ff 75 e8             	pushl  -0x18(%ebp)
   33543:	ff 75 f0             	pushl  -0x10(%ebp)
   33546:	e8 5b 01 00 00       	call   336a6 <alloc_smap_bit>
   3354b:	83 c4 10             	add    $0x10,%esp
   3354e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   33551:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
   33555:	75 07                	jne    3355e <create_file+0x6e>
   33557:	b8 00 00 00 00       	mov    $0x0,%eax
   3355c:	eb 49                	jmp    335a7 <create_file+0xb7>
   3355e:	83 ec 08             	sub    $0x8,%esp
   33561:	ff 75 e4             	pushl  -0x1c(%ebp)
   33564:	ff 75 f0             	pushl  -0x10(%ebp)
   33567:	e8 c9 02 00 00       	call   33835 <new_inode>
   3356c:	83 c4 10             	add    $0x10,%esp
   3356f:	89 45 e0             	mov    %eax,-0x20(%ebp)
   33572:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
   33576:	75 07                	jne    3357f <create_file+0x8f>
   33578:	b8 00 00 00 00       	mov    $0x0,%eax
   3357d:	eb 28                	jmp    335a7 <create_file+0xb7>
   3357f:	83 ec 04             	sub    $0x4,%esp
   33582:	ff 75 f0             	pushl  -0x10(%ebp)
   33585:	8d 45 ce             	lea    -0x32(%ebp),%eax
   33588:	50                   	push   %eax
   33589:	ff 75 f4             	pushl  -0xc(%ebp)
   3358c:	e8 f8 02 00 00       	call   33889 <new_dir_entry>
   33591:	83 c4 10             	add    $0x10,%esp
   33594:	89 45 dc             	mov    %eax,-0x24(%ebp)
   33597:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
   3359b:	75 07                	jne    335a4 <create_file+0xb4>
   3359d:	b8 00 00 00 00       	mov    $0x0,%eax
   335a2:	eb 03                	jmp    335a7 <create_file+0xb7>
   335a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
   335a7:	c9                   	leave  
   335a8:	c3                   	ret    

000335a9 <alloc_imap_bit>:
   335a9:	55                   	push   %ebp
   335aa:	89 e5                	mov    %esp,%ebp
   335ac:	53                   	push   %ebx
   335ad:	83 ec 24             	sub    $0x24,%esp
   335b0:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
   335b7:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
   335be:	a1 10 80 03 00       	mov    0x38010,%eax
   335c3:	83 ec 0c             	sub    $0xc,%esp
   335c6:	6a 01                	push   $0x1
   335c8:	68 00 02 00 00       	push   $0x200
   335cd:	50                   	push   %eax
   335ce:	ff 75 e8             	pushl  -0x18(%ebp)
   335d1:	ff 75 ec             	pushl  -0x14(%ebp)
   335d4:	e8 e3 f6 ff ff       	call   32cbc <rd_wt>
   335d9:	83 c4 20             	add    $0x20,%esp
   335dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   335e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   335ea:	e9 a5 00 00 00       	jmp    33694 <alloc_imap_bit+0xeb>
   335ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   335f6:	e9 8b 00 00 00       	jmp    33686 <alloc_imap_bit+0xdd>
   335fb:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33601:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33604:	01 d0                	add    %edx,%eax
   33606:	0f b6 00             	movzbl (%eax),%eax
   33609:	0f be d0             	movsbl %al,%edx
   3360c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   33610:	0f 94 c0             	sete   %al
   33613:	0f b6 c0             	movzbl %al,%eax
   33616:	21 d0                	and    %edx,%eax
   33618:	85 c0                	test   %eax,%eax
   3361a:	74 06                	je     33622 <alloc_imap_bit+0x79>
   3361c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   33620:	eb 64                	jmp    33686 <alloc_imap_bit+0xdd>
   33622:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33628:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3362b:	01 d0                	add    %edx,%eax
   3362d:	0f b6 18             	movzbl (%eax),%ebx
   33630:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33633:	ba 01 00 00 00       	mov    $0x1,%edx
   33638:	89 c1                	mov    %eax,%ecx
   3363a:	d3 e2                	shl    %cl,%edx
   3363c:	89 d0                	mov    %edx,%eax
   3363e:	89 c1                	mov    %eax,%ecx
   33640:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33646:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33649:	01 d0                	add    %edx,%eax
   3364b:	09 cb                	or     %ecx,%ebx
   3364d:	89 da                	mov    %ebx,%edx
   3364f:	88 10                	mov    %dl,(%eax)
   33651:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33654:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
   3365b:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3365e:	01 d0                	add    %edx,%eax
   33660:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   33663:	a1 10 80 03 00       	mov    0x38010,%eax
   33668:	83 ec 0c             	sub    $0xc,%esp
   3366b:	6a 02                	push   $0x2
   3366d:	68 00 02 00 00       	push   $0x200
   33672:	50                   	push   %eax
   33673:	ff 75 e8             	pushl  -0x18(%ebp)
   33676:	ff 75 ec             	pushl  -0x14(%ebp)
   33679:	e8 3e f6 ff ff       	call   32cbc <rd_wt>
   3367e:	83 c4 20             	add    $0x20,%esp
   33681:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   33684:	eb 1b                	jmp    336a1 <alloc_imap_bit+0xf8>
   33686:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
   3368a:	0f 8e 6b ff ff ff    	jle    335fb <alloc_imap_bit+0x52>
   33690:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   33694:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
   3369b:	0f 8e 4e ff ff ff    	jle    335ef <alloc_imap_bit+0x46>
   336a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   336a4:	c9                   	leave  
   336a5:	c3                   	ret    

000336a6 <alloc_smap_bit>:
   336a6:	55                   	push   %ebp
   336a7:	89 e5                	mov    %esp,%ebp
   336a9:	53                   	push   %ebx
   336aa:	83 ec 34             	sub    $0x34,%esp
   336ad:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   336b1:	7f 1c                	jg     336cf <alloc_smap_bit+0x29>
   336b3:	68 e1 01 00 00       	push   $0x1e1
   336b8:	68 4e 5d 03 00       	push   $0x35d4e
   336bd:	68 4e 5d 03 00       	push   $0x35d4e
   336c2:	68 95 5d 03 00       	push   $0x35d95
   336c7:	e8 90 df ff ff       	call   3165c <assertion_failure>
   336cc:	83 c4 10             	add    $0x10,%esp
   336cf:	e8 4a 0c 00 00       	call   3431e <get_super_block>
   336d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   336d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   336da:	8b 40 08             	mov    0x8(%eax),%eax
   336dd:	89 45 e0             	mov    %eax,-0x20(%ebp)
   336e0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   336e3:	8b 40 04             	mov    0x4(%eax),%eax
   336e6:	83 c0 02             	add    $0x2,%eax
   336e9:	89 45 dc             	mov    %eax,-0x24(%ebp)
   336ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   336f3:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
   336fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   33701:	e9 18 01 00 00       	jmp    3381e <alloc_smap_bit+0x178>
   33706:	8b 55 dc             	mov    -0x24(%ebp),%edx
   33709:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3370c:	01 d0                	add    %edx,%eax
   3370e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   33711:	a1 10 80 03 00       	mov    0x38010,%eax
   33716:	83 ec 0c             	sub    $0xc,%esp
   33719:	6a 01                	push   $0x1
   3371b:	68 00 02 00 00       	push   $0x200
   33720:	50                   	push   %eax
   33721:	ff 75 d8             	pushl  -0x28(%ebp)
   33724:	ff 75 d4             	pushl  -0x2c(%ebp)
   33727:	e8 90 f5 ff ff       	call   32cbc <rd_wt>
   3372c:	83 c4 20             	add    $0x20,%esp
   3372f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   33736:	e9 a8 00 00 00       	jmp    337e3 <alloc_smap_bit+0x13d>
   3373b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   33742:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   33746:	0f 85 8a 00 00 00    	jne    337d6 <alloc_smap_bit+0x130>
   3374c:	eb 45                	jmp    33793 <alloc_smap_bit+0xed>
   3374e:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33754:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33757:	01 d0                	add    %edx,%eax
   33759:	0f b6 00             	movzbl (%eax),%eax
   3375c:	0f be d0             	movsbl %al,%edx
   3375f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
   33763:	0f 94 c0             	sete   %al
   33766:	0f b6 c0             	movzbl %al,%eax
   33769:	21 d0                	and    %edx,%eax
   3376b:	85 c0                	test   %eax,%eax
   3376d:	74 06                	je     33775 <alloc_smap_bit+0xcf>
   3376f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
   33773:	eb 1e                	jmp    33793 <alloc_smap_bit+0xed>
   33775:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33778:	c1 e0 09             	shl    $0x9,%eax
   3377b:	89 c2                	mov    %eax,%edx
   3377d:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33780:	01 d0                	add    %edx,%eax
   33782:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
   33789:	8b 45 e8             	mov    -0x18(%ebp),%eax
   3378c:	01 d0                	add    %edx,%eax
   3378e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   33791:	eb 06                	jmp    33799 <alloc_smap_bit+0xf3>
   33793:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
   33797:	7e b5                	jle    3374e <alloc_smap_bit+0xa8>
   33799:	eb 3b                	jmp    337d6 <alloc_smap_bit+0x130>
   3379b:	8b 15 10 80 03 00    	mov    0x38010,%edx
   337a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
   337a4:	01 d0                	add    %edx,%eax
   337a6:	0f b6 10             	movzbl (%eax),%edx
   337a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
   337ac:	bb 01 00 00 00       	mov    $0x1,%ebx
   337b1:	89 c1                	mov    %eax,%ecx
   337b3:	d3 e3                	shl    %cl,%ebx
   337b5:	89 d8                	mov    %ebx,%eax
   337b7:	89 c3                	mov    %eax,%ebx
   337b9:	8b 0d 10 80 03 00    	mov    0x38010,%ecx
   337bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
   337c2:	01 c8                	add    %ecx,%eax
   337c4:	21 da                	and    %ebx,%edx
   337c6:	88 10                	mov    %dl,(%eax)
   337c8:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
   337cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   337d0:	74 0c                	je     337de <alloc_smap_bit+0x138>
   337d2:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
   337d6:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
   337da:	7e bf                	jle    3379b <alloc_smap_bit+0xf5>
   337dc:	eb 01                	jmp    337df <alloc_smap_bit+0x139>
   337de:	90                   	nop
   337df:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   337e3:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
   337ea:	0f 8e 4b ff ff ff    	jle    3373b <alloc_smap_bit+0x95>
   337f0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   337f4:	74 1e                	je     33814 <alloc_smap_bit+0x16e>
   337f6:	a1 10 80 03 00       	mov    0x38010,%eax
   337fb:	83 ec 0c             	sub    $0xc,%esp
   337fe:	6a 02                	push   $0x2
   33800:	68 00 02 00 00       	push   $0x200
   33805:	50                   	push   %eax
   33806:	ff 75 d8             	pushl  -0x28(%ebp)
   33809:	ff 75 d4             	pushl  -0x2c(%ebp)
   3380c:	e8 ab f4 ff ff       	call   32cbc <rd_wt>
   33811:	83 c4 20             	add    $0x20,%esp
   33814:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
   33818:	74 12                	je     3382c <alloc_smap_bit+0x186>
   3381a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   3381e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33821:	3b 45 e0             	cmp    -0x20(%ebp),%eax
   33824:	0f 8c dc fe ff ff    	jl     33706 <alloc_smap_bit+0x60>
   3382a:	eb 01                	jmp    3382d <alloc_smap_bit+0x187>
   3382c:	90                   	nop
   3382d:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33830:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   33833:	c9                   	leave  
   33834:	c3                   	ret    

00033835 <new_inode>:
   33835:	55                   	push   %ebp
   33836:	89 e5                	mov    %esp,%ebp
   33838:	83 ec 18             	sub    $0x18,%esp
   3383b:	83 ec 0c             	sub    $0xc,%esp
   3383e:	ff 75 08             	pushl  0x8(%ebp)
   33841:	e8 7a fb ff ff       	call   333c0 <get_inode>
   33846:	83 c4 10             	add    $0x10,%esp
   33849:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3384c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   33850:	75 07                	jne    33859 <new_inode+0x24>
   33852:	b8 00 00 00 00       	mov    $0x0,%eax
   33857:	eb 2e                	jmp    33887 <new_inode+0x52>
   33859:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3385c:	8b 55 0c             	mov    0xc(%ebp),%edx
   3385f:	89 50 08             	mov    %edx,0x8(%eax)
   33862:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33865:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
   3386c:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3386f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   33876:	83 ec 0c             	sub    $0xc,%esp
   33879:	ff 75 f4             	pushl  -0xc(%ebp)
   3387c:	e8 1b 09 00 00       	call   3419c <sync_inode>
   33881:	83 c4 10             	add    $0x10,%esp
   33884:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33887:	c9                   	leave  
   33888:	c3                   	ret    

00033889 <new_dir_entry>:
   33889:	55                   	push   %ebp
   3388a:	89 e5                	mov    %esp,%ebp
   3388c:	83 ec 38             	sub    $0x38,%esp
   3388f:	c7 45 e0 14 00 00 00 	movl   $0x14,-0x20(%ebp)
   33896:	8b 45 08             	mov    0x8(%ebp),%eax
   33899:	8b 50 04             	mov    0x4(%eax),%edx
   3389c:	8b 45 e0             	mov    -0x20(%ebp),%eax
   3389f:	89 c1                	mov    %eax,%ecx
   338a1:	d3 fa                	sar    %cl,%edx
   338a3:	89 d0                	mov    %edx,%eax
   338a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
   338a8:	8b 45 08             	mov    0x8(%ebp),%eax
   338ab:	8b 50 0c             	mov    0xc(%eax),%edx
   338ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
   338b1:	89 c1                	mov    %eax,%ecx
   338b3:	d3 fa                	sar    %cl,%edx
   338b5:	89 d0                	mov    %edx,%eax
   338b7:	89 45 d8             	mov    %eax,-0x28(%ebp)
   338ba:	e8 5f 0a 00 00       	call   3431e <get_super_block>
   338bf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   338c2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
   338c5:	8b 00                	mov    (%eax),%eax
   338c7:	89 45 d0             	mov    %eax,-0x30(%ebp)
   338ca:	8b 45 08             	mov    0x8(%ebp),%eax
   338cd:	8b 40 0c             	mov    0xc(%eax),%eax
   338d0:	05 00 02 00 00       	add    $0x200,%eax
   338d5:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
   338db:	85 c0                	test   %eax,%eax
   338dd:	0f 48 c2             	cmovs  %edx,%eax
   338e0:	c1 f8 09             	sar    $0x9,%eax
   338e3:	89 45 cc             	mov    %eax,-0x34(%ebp)
   338e6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   338ed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   338f4:	c7 45 c8 20 00 00 00 	movl   $0x20,-0x38(%ebp)
   338fb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   33902:	eb 7d                	jmp    33981 <new_dir_entry+0xf8>
   33904:	a1 10 80 03 00       	mov    0x38010,%eax
   33909:	8b 4d d0             	mov    -0x30(%ebp),%ecx
   3390c:	8b 55 e8             	mov    -0x18(%ebp),%edx
   3390f:	01 ca                	add    %ecx,%edx
   33911:	83 ec 0c             	sub    $0xc,%esp
   33914:	6a 01                	push   $0x1
   33916:	68 00 02 00 00       	push   $0x200
   3391b:	50                   	push   %eax
   3391c:	ff 75 c8             	pushl  -0x38(%ebp)
   3391f:	52                   	push   %edx
   33920:	e8 97 f3 ff ff       	call   32cbc <rd_wt>
   33925:	83 c4 20             	add    $0x20,%esp
   33928:	a1 10 80 03 00       	mov    0x38010,%eax
   3392d:	89 45 f0             	mov    %eax,-0x10(%ebp)
   33930:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   33937:	eb 25                	jmp    3395e <new_dir_entry+0xd5>
   33939:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   3393d:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33940:	3b 45 dc             	cmp    -0x24(%ebp),%eax
   33943:	7f 29                	jg     3396e <new_dir_entry+0xe5>
   33945:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33948:	8b 00                	mov    (%eax),%eax
   3394a:	85 c0                	test   %eax,%eax
   3394c:	75 08                	jne    33956 <new_dir_entry+0xcd>
   3394e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33951:	89 45 f4             	mov    %eax,-0xc(%ebp)
   33954:	eb 19                	jmp    3396f <new_dir_entry+0xe6>
   33956:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   3395a:	83 45 f0 14          	addl   $0x14,-0x10(%ebp)
   3395e:	b8 00 02 00 00       	mov    $0x200,%eax
   33963:	99                   	cltd   
   33964:	f7 7d e0             	idivl  -0x20(%ebp)
   33967:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
   3396a:	7c cd                	jl     33939 <new_dir_entry+0xb0>
   3396c:	eb 01                	jmp    3396f <new_dir_entry+0xe6>
   3396e:	90                   	nop
   3396f:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33972:	3b 45 dc             	cmp    -0x24(%ebp),%eax
   33975:	7f 16                	jg     3398d <new_dir_entry+0x104>
   33977:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   3397b:	75 10                	jne    3398d <new_dir_entry+0x104>
   3397d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
   33981:	8b 45 e8             	mov    -0x18(%ebp),%eax
   33984:	3b 45 cc             	cmp    -0x34(%ebp),%eax
   33987:	0f 8c 77 ff ff ff    	jl     33904 <new_dir_entry+0x7b>
   3398d:	8b 45 dc             	mov    -0x24(%ebp),%eax
   33990:	3b 45 d8             	cmp    -0x28(%ebp),%eax
   33993:	75 07                	jne    3399c <new_dir_entry+0x113>
   33995:	b8 00 00 00 00       	mov    $0x0,%eax
   3399a:	eb 6c                	jmp    33a08 <new_dir_entry+0x17f>
   3399c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   339a0:	75 25                	jne    339c7 <new_dir_entry+0x13e>
   339a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
   339a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
   339a8:	8b 45 08             	mov    0x8(%ebp),%eax
   339ab:	8b 50 04             	mov    0x4(%eax),%edx
   339ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
   339b1:	01 c2                	add    %eax,%edx
   339b3:	8b 45 08             	mov    0x8(%ebp),%eax
   339b6:	89 50 04             	mov    %edx,0x4(%eax)
   339b9:	83 ec 0c             	sub    $0xc,%esp
   339bc:	ff 75 08             	pushl  0x8(%ebp)
   339bf:	e8 d8 07 00 00       	call   3419c <sync_inode>
   339c4:	83 c4 10             	add    $0x10,%esp
   339c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
   339ca:	8b 55 10             	mov    0x10(%ebp),%edx
   339cd:	89 10                	mov    %edx,(%eax)
   339cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
   339d2:	83 c0 04             	add    $0x4,%eax
   339d5:	83 ec 08             	sub    $0x8,%esp
   339d8:	ff 75 0c             	pushl  0xc(%ebp)
   339db:	50                   	push   %eax
   339dc:	e8 f3 24 00 00       	call   35ed4 <Strcpy>
   339e1:	83 c4 10             	add    $0x10,%esp
   339e4:	a1 10 80 03 00       	mov    0x38010,%eax
   339e9:	8b 4d d0             	mov    -0x30(%ebp),%ecx
   339ec:	8b 55 e8             	mov    -0x18(%ebp),%edx
   339ef:	01 ca                	add    %ecx,%edx
   339f1:	83 ec 0c             	sub    $0xc,%esp
   339f4:	6a 02                	push   $0x2
   339f6:	68 00 02 00 00       	push   $0x200
   339fb:	50                   	push   %eax
   339fc:	ff 75 c8             	pushl  -0x38(%ebp)
   339ff:	52                   	push   %edx
   33a00:	e8 b7 f2 ff ff       	call   32cbc <rd_wt>
   33a05:	83 c4 20             	add    $0x20,%esp
   33a08:	c9                   	leave  
   33a09:	c3                   	ret    

00033a0a <do_unlink>:
   33a0a:	55                   	push   %ebp
   33a0b:	89 e5                	mov    %esp,%ebp
   33a0d:	53                   	push   %ebx
   33a0e:	83 ec 74             	sub    $0x74,%esp
   33a11:	ff 75 08             	pushl  0x8(%ebp)
   33a14:	68 aa 5d 03 00       	push   $0x35daa
   33a19:	e8 33 f9 ff ff       	call   33351 <strcmp>
   33a1e:	83 c4 08             	add    $0x8,%esp
   33a21:	85 c0                	test   %eax,%eax
   33a23:	75 10                	jne    33a35 <do_unlink+0x2b>
   33a25:	83 ec 0c             	sub    $0xc,%esp
   33a28:	68 ac 5d 03 00       	push   $0x35dac
   33a2d:	e8 0c dc ff ff       	call   3163e <panic>
   33a32:	83 c4 10             	add    $0x10,%esp
   33a35:	83 ec 0c             	sub    $0xc,%esp
   33a38:	ff 75 08             	pushl  0x8(%ebp)
   33a3b:	e8 78 f7 ff ff       	call   331b8 <search_file>
   33a40:	83 c4 10             	add    $0x10,%esp
   33a43:	89 45 d0             	mov    %eax,-0x30(%ebp)
   33a46:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
   33a4a:	75 10                	jne    33a5c <do_unlink+0x52>
   33a4c:	83 ec 0c             	sub    $0xc,%esp
   33a4f:	68 c8 5d 03 00       	push   $0x35dc8
   33a54:	e8 e5 db ff ff       	call   3163e <panic>
   33a59:	83 c4 10             	add    $0x10,%esp
   33a5c:	83 ec 0c             	sub    $0xc,%esp
   33a5f:	ff 75 d0             	pushl  -0x30(%ebp)
   33a62:	e8 59 f9 ff ff       	call   333c0 <get_inode>
   33a67:	83 c4 10             	add    $0x10,%esp
   33a6a:	89 45 cc             	mov    %eax,-0x34(%ebp)
   33a6d:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
   33a71:	75 10                	jne    33a83 <do_unlink+0x79>
   33a73:	83 ec 0c             	sub    $0xc,%esp
   33a76:	68 c8 5d 03 00       	push   $0x35dc8
   33a7b:	e8 be db ff ff       	call   3163e <panic>
   33a80:	83 c4 10             	add    $0x10,%esp
   33a83:	8b 45 cc             	mov    -0x34(%ebp),%eax
   33a86:	8b 40 18             	mov    0x18(%eax),%eax
   33a89:	85 c0                	test   %eax,%eax
   33a8b:	7e 10                	jle    33a9d <do_unlink+0x93>
   33a8d:	83 ec 0c             	sub    $0xc,%esp
   33a90:	68 e4 5d 03 00       	push   $0x35de4
   33a95:	e8 a4 db ff ff       	call   3163e <panic>
   33a9a:	83 c4 10             	add    $0x10,%esp
   33a9d:	8b 45 cc             	mov    -0x34(%ebp),%eax
   33aa0:	8b 40 10             	mov    0x10(%eax),%eax
   33aa3:	89 45 c8             	mov    %eax,-0x38(%ebp)
   33aa6:	8b 45 c8             	mov    -0x38(%ebp),%eax
   33aa9:	8d 50 07             	lea    0x7(%eax),%edx
   33aac:	85 c0                	test   %eax,%eax
   33aae:	0f 48 c2             	cmovs  %edx,%eax
   33ab1:	c1 f8 03             	sar    $0x3,%eax
   33ab4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   33ab7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
   33aba:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
   33ac0:	85 c0                	test   %eax,%eax
   33ac2:	0f 48 c2             	cmovs  %edx,%eax
   33ac5:	c1 f8 09             	sar    $0x9,%eax
   33ac8:	89 45 c0             	mov    %eax,-0x40(%ebp)
   33acb:	8b 45 c8             	mov    -0x38(%ebp),%eax
   33ace:	99                   	cltd   
   33acf:	c1 ea 1d             	shr    $0x1d,%edx
   33ad2:	01 d0                	add    %edx,%eax
   33ad4:	83 e0 07             	and    $0x7,%eax
   33ad7:	29 d0                	sub    %edx,%eax
   33ad9:	89 45 bc             	mov    %eax,-0x44(%ebp)
   33adc:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
   33ae3:	a1 10 80 03 00       	mov    0x38010,%eax
   33ae8:	8b 55 c0             	mov    -0x40(%ebp),%edx
   33aeb:	83 c2 02             	add    $0x2,%edx
   33aee:	83 ec 0c             	sub    $0xc,%esp
   33af1:	6a 01                	push   $0x1
   33af3:	68 00 02 00 00       	push   $0x200
   33af8:	50                   	push   %eax
   33af9:	ff 75 b8             	pushl  -0x48(%ebp)
   33afc:	52                   	push   %edx
   33afd:	e8 ba f1 ff ff       	call   32cbc <rd_wt>
   33b02:	83 c4 20             	add    $0x20,%esp
   33b05:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33b0b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
   33b0e:	01 d0                	add    %edx,%eax
   33b10:	0f b6 10             	movzbl (%eax),%edx
   33b13:	8b 45 bc             	mov    -0x44(%ebp),%eax
   33b16:	bb 01 00 00 00       	mov    $0x1,%ebx
   33b1b:	89 c1                	mov    %eax,%ecx
   33b1d:	d3 e3                	shl    %cl,%ebx
   33b1f:	89 d8                	mov    %ebx,%eax
   33b21:	f7 d0                	not    %eax
   33b23:	89 c3                	mov    %eax,%ebx
   33b25:	8b 0d 10 80 03 00    	mov    0x38010,%ecx
   33b2b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
   33b2e:	01 c8                	add    %ecx,%eax
   33b30:	21 da                	and    %ebx,%edx
   33b32:	88 10                	mov    %dl,(%eax)
   33b34:	a1 10 80 03 00       	mov    0x38010,%eax
   33b39:	8b 55 c0             	mov    -0x40(%ebp),%edx
   33b3c:	83 c2 02             	add    $0x2,%edx
   33b3f:	83 ec 0c             	sub    $0xc,%esp
   33b42:	6a 02                	push   $0x2
   33b44:	68 00 02 00 00       	push   $0x200
   33b49:	50                   	push   %eax
   33b4a:	ff 75 b8             	pushl  -0x48(%ebp)
   33b4d:	52                   	push   %edx
   33b4e:	e8 69 f1 ff ff       	call   32cbc <rd_wt>
   33b53:	83 c4 20             	add    $0x20,%esp
   33b56:	e8 c3 07 00 00       	call   3431e <get_super_block>
   33b5b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
   33b5e:	8b 45 cc             	mov    -0x34(%ebp),%eax
   33b61:	8b 50 08             	mov    0x8(%eax),%edx
   33b64:	8b 45 b4             	mov    -0x4c(%ebp),%eax
   33b67:	8b 00                	mov    (%eax),%eax
   33b69:	29 c2                	sub    %eax,%edx
   33b6b:	89 d0                	mov    %edx,%eax
   33b6d:	83 c0 01             	add    $0x1,%eax
   33b70:	89 45 b0             	mov    %eax,-0x50(%ebp)
   33b73:	8b 45 b0             	mov    -0x50(%ebp),%eax
   33b76:	8d 50 07             	lea    0x7(%eax),%edx
   33b79:	85 c0                	test   %eax,%eax
   33b7b:	0f 48 c2             	cmovs  %edx,%eax
   33b7e:	c1 f8 03             	sar    $0x3,%eax
   33b81:	89 45 ac             	mov    %eax,-0x54(%ebp)
   33b84:	8b 45 ac             	mov    -0x54(%ebp),%eax
   33b87:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
   33b8d:	85 c0                	test   %eax,%eax
   33b8f:	0f 48 c2             	cmovs  %edx,%eax
   33b92:	c1 f8 09             	sar    $0x9,%eax
   33b95:	89 45 a8             	mov    %eax,-0x58(%ebp)
   33b98:	8b 45 b0             	mov    -0x50(%ebp),%eax
   33b9b:	99                   	cltd   
   33b9c:	c1 ea 1d             	shr    $0x1d,%edx
   33b9f:	01 d0                	add    %edx,%eax
   33ba1:	83 e0 07             	and    $0x7,%eax
   33ba4:	29 d0                	sub    %edx,%eax
   33ba6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
   33ba9:	b8 08 00 00 00       	mov    $0x8,%eax
   33bae:	2b 45 a4             	sub    -0x5c(%ebp),%eax
   33bb1:	8b 55 b0             	mov    -0x50(%ebp),%edx
   33bb4:	29 c2                	sub    %eax,%edx
   33bb6:	89 d0                	mov    %edx,%eax
   33bb8:	89 45 f4             	mov    %eax,-0xc(%ebp)
   33bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33bbe:	8d 50 07             	lea    0x7(%eax),%edx
   33bc1:	85 c0                	test   %eax,%eax
   33bc3:	0f 48 c2             	cmovs  %edx,%eax
   33bc6:	c1 f8 03             	sar    $0x3,%eax
   33bc9:	89 45 a0             	mov    %eax,-0x60(%ebp)
   33bcc:	a1 10 80 03 00       	mov    0x38010,%eax
   33bd1:	8b 55 b4             	mov    -0x4c(%ebp),%edx
   33bd4:	8b 52 04             	mov    0x4(%edx),%edx
   33bd7:	8d 4a 02             	lea    0x2(%edx),%ecx
   33bda:	8b 55 a8             	mov    -0x58(%ebp),%edx
   33bdd:	01 ca                	add    %ecx,%edx
   33bdf:	83 ec 0c             	sub    $0xc,%esp
   33be2:	6a 01                	push   $0x1
   33be4:	68 00 02 00 00       	push   $0x200
   33be9:	50                   	push   %eax
   33bea:	ff 75 b8             	pushl  -0x48(%ebp)
   33bed:	52                   	push   %edx
   33bee:	e8 c9 f0 ff ff       	call   32cbc <rd_wt>
   33bf3:	83 c4 20             	add    $0x20,%esp
   33bf6:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33bfc:	8b 45 ac             	mov    -0x54(%ebp),%eax
   33bff:	01 d0                	add    %edx,%eax
   33c01:	0f b6 10             	movzbl (%eax),%edx
   33c04:	8b 45 a4             	mov    -0x5c(%ebp),%eax
   33c07:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   33c0c:	89 c1                	mov    %eax,%ecx
   33c0e:	d3 e3                	shl    %cl,%ebx
   33c10:	89 d8                	mov    %ebx,%eax
   33c12:	f7 d0                	not    %eax
   33c14:	89 c3                	mov    %eax,%ebx
   33c16:	8b 0d 10 80 03 00    	mov    0x38010,%ecx
   33c1c:	8b 45 ac             	mov    -0x54(%ebp),%eax
   33c1f:	01 c8                	add    %ecx,%eax
   33c21:	21 da                	and    %ebx,%edx
   33c23:	88 10                	mov    %dl,(%eax)
   33c25:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
   33c2c:	8b 45 a8             	mov    -0x58(%ebp),%eax
   33c2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
   33c32:	eb 6a                	jmp    33c9e <do_unlink+0x294>
   33c34:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
   33c3b:	75 4b                	jne    33c88 <do_unlink+0x27e>
   33c3d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   33c44:	a1 10 80 03 00       	mov    0x38010,%eax
   33c49:	83 ec 0c             	sub    $0xc,%esp
   33c4c:	6a 02                	push   $0x2
   33c4e:	68 00 02 00 00       	push   $0x200
   33c53:	50                   	push   %eax
   33c54:	ff 75 b8             	pushl  -0x48(%ebp)
   33c57:	ff 75 ec             	pushl  -0x14(%ebp)
   33c5a:	e8 5d f0 ff ff       	call   32cbc <rd_wt>
   33c5f:	83 c4 20             	add    $0x20,%esp
   33c62:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33c68:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33c6b:	8d 48 01             	lea    0x1(%eax),%ecx
   33c6e:	89 4d ec             	mov    %ecx,-0x14(%ebp)
   33c71:	83 ec 0c             	sub    $0xc,%esp
   33c74:	6a 01                	push   $0x1
   33c76:	68 00 02 00 00       	push   $0x200
   33c7b:	52                   	push   %edx
   33c7c:	ff 75 b8             	pushl  -0x48(%ebp)
   33c7f:	50                   	push   %eax
   33c80:	e8 37 f0 ff ff       	call   32cbc <rd_wt>
   33c85:	83 c4 20             	add    $0x20,%esp
   33c88:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33c8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33c91:	01 d0                	add    %edx,%eax
   33c93:	c6 00 00             	movb   $0x0,(%eax)
   33c96:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
   33c9a:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
   33c9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33ca1:	3b 45 a0             	cmp    -0x60(%ebp),%eax
   33ca4:	7c 8e                	jl     33c34 <do_unlink+0x22a>
   33ca6:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
   33cad:	75 4b                	jne    33cfa <do_unlink+0x2f0>
   33caf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   33cb6:	a1 10 80 03 00       	mov    0x38010,%eax
   33cbb:	83 ec 0c             	sub    $0xc,%esp
   33cbe:	6a 02                	push   $0x2
   33cc0:	68 00 02 00 00       	push   $0x200
   33cc5:	50                   	push   %eax
   33cc6:	ff 75 b8             	pushl  -0x48(%ebp)
   33cc9:	ff 75 ec             	pushl  -0x14(%ebp)
   33ccc:	e8 eb ef ff ff       	call   32cbc <rd_wt>
   33cd1:	83 c4 20             	add    $0x20,%esp
   33cd4:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33cda:	8b 45 ec             	mov    -0x14(%ebp),%eax
   33cdd:	8d 48 01             	lea    0x1(%eax),%ecx
   33ce0:	89 4d ec             	mov    %ecx,-0x14(%ebp)
   33ce3:	83 ec 0c             	sub    $0xc,%esp
   33ce6:	6a 01                	push   $0x1
   33ce8:	68 00 02 00 00       	push   $0x200
   33ced:	52                   	push   %edx
   33cee:	ff 75 b8             	pushl  -0x48(%ebp)
   33cf1:	50                   	push   %eax
   33cf2:	e8 c5 ef ff ff       	call   32cbc <rd_wt>
   33cf7:	83 c4 20             	add    $0x20,%esp
   33cfa:	8b 15 10 80 03 00    	mov    0x38010,%edx
   33d00:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33d03:	01 d0                	add    %edx,%eax
   33d05:	0f b6 10             	movzbl (%eax),%edx
   33d08:	8b 45 f4             	mov    -0xc(%ebp),%eax
   33d0b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
   33d10:	89 c1                	mov    %eax,%ecx
   33d12:	d3 e3                	shl    %cl,%ebx
   33d14:	89 d8                	mov    %ebx,%eax
   33d16:	89 c3                	mov    %eax,%ebx
   33d18:	8b 0d 10 80 03 00    	mov    0x38010,%ecx
   33d1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   33d21:	01 c8                	add    %ecx,%eax
   33d23:	21 da                	and    %ebx,%edx
   33d25:	88 10                	mov    %dl,(%eax)
   33d27:	a1 10 80 03 00       	mov    0x38010,%eax
   33d2c:	83 ec 0c             	sub    $0xc,%esp
   33d2f:	6a 02                	push   $0x2
   33d31:	68 00 02 00 00       	push   $0x200
   33d36:	50                   	push   %eax
   33d37:	ff 75 b8             	pushl  -0x48(%ebp)
   33d3a:	ff 75 ec             	pushl  -0x14(%ebp)
   33d3d:	e8 7a ef ff ff       	call   32cbc <rd_wt>
   33d42:	83 c4 20             	add    $0x20,%esp
   33d45:	8b 45 cc             	mov    -0x34(%ebp),%eax
   33d48:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
   33d4f:	8b 45 cc             	mov    -0x34(%ebp),%eax
   33d52:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   33d59:	8b 45 cc             	mov    -0x34(%ebp),%eax
   33d5c:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   33d63:	83 ec 0c             	sub    $0xc,%esp
   33d66:	ff 75 cc             	pushl  -0x34(%ebp)
   33d69:	e8 2e 04 00 00       	call   3419c <sync_inode>
   33d6e:	83 c4 10             	add    $0x10,%esp
   33d71:	83 ec 0c             	sub    $0xc,%esp
   33d74:	ff 75 cc             	pushl  -0x34(%ebp)
   33d77:	e8 f1 04 00 00       	call   3426d <put_inode>
   33d7c:	83 c4 10             	add    $0x10,%esp
   33d7f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
   33d82:	8b 00                	mov    (%eax),%eax
   33d84:	89 45 9c             	mov    %eax,-0x64(%ebp)
   33d87:	a1 6c bc 03 00       	mov    0x3bc6c,%eax
   33d8c:	89 45 98             	mov    %eax,-0x68(%ebp)
   33d8f:	8b 45 98             	mov    -0x68(%ebp),%eax
   33d92:	8b 40 04             	mov    0x4(%eax),%eax
   33d95:	89 45 94             	mov    %eax,-0x6c(%ebp)
   33d98:	8b 45 98             	mov    -0x68(%ebp),%eax
   33d9b:	8b 40 0c             	mov    0xc(%eax),%eax
   33d9e:	89 45 90             	mov    %eax,-0x70(%ebp)
   33da1:	8b 45 94             	mov    -0x6c(%ebp),%eax
   33da4:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
   33da9:	f7 e2                	mul    %edx
   33dab:	89 d0                	mov    %edx,%eax
   33dad:	c1 e8 04             	shr    $0x4,%eax
   33db0:	89 45 8c             	mov    %eax,-0x74(%ebp)
   33db3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   33dba:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   33dc1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
   33dc8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
   33dcf:	e9 a3 00 00 00       	jmp    33e77 <do_unlink+0x46d>
   33dd4:	a1 10 80 03 00       	mov    0x38010,%eax
   33dd9:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
   33ddc:	8b 55 d8             	mov    -0x28(%ebp),%edx
   33ddf:	01 ca                	add    %ecx,%edx
   33de1:	83 ec 0c             	sub    $0xc,%esp
   33de4:	6a 01                	push   $0x1
   33de6:	68 00 02 00 00       	push   $0x200
   33deb:	50                   	push   %eax
   33dec:	ff 75 b8             	pushl  -0x48(%ebp)
   33def:	52                   	push   %edx
   33df0:	e8 c7 ee ff ff       	call   32cbc <rd_wt>
   33df5:	83 c4 20             	add    $0x20,%esp
   33df8:	a1 10 80 03 00       	mov    0x38010,%eax
   33dfd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   33e00:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
   33e07:	eb 51                	jmp    33e5a <do_unlink+0x450>
   33e09:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   33e0d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   33e10:	3b 45 8c             	cmp    -0x74(%ebp),%eax
   33e13:	7f 4f                	jg     33e64 <do_unlink+0x45a>
   33e15:	8b 45 e0             	mov    -0x20(%ebp),%eax
   33e18:	83 c0 14             	add    $0x14,%eax
   33e1b:	89 45 e0             	mov    %eax,-0x20(%ebp)
   33e1e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
   33e21:	83 c0 04             	add    $0x4,%eax
   33e24:	83 ec 08             	sub    $0x8,%esp
   33e27:	ff 75 08             	pushl  0x8(%ebp)
   33e2a:	50                   	push   %eax
   33e2b:	e8 21 f5 ff ff       	call   33351 <strcmp>
   33e30:	83 c4 10             	add    $0x10,%esp
   33e33:	85 c0                	test   %eax,%eax
   33e35:	75 1b                	jne    33e52 <do_unlink+0x448>
   33e37:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
   33e3e:	83 ec 04             	sub    $0x4,%esp
   33e41:	6a 14                	push   $0x14
   33e43:	6a 00                	push   $0x0
   33e45:	ff 75 d4             	pushl  -0x2c(%ebp)
   33e48:	e8 68 20 00 00       	call   35eb5 <Memset>
   33e4d:	83 c4 10             	add    $0x10,%esp
   33e50:	eb 13                	jmp    33e65 <do_unlink+0x45b>
   33e52:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
   33e56:	83 45 d4 14          	addl   $0x14,-0x2c(%ebp)
   33e5a:	8b 45 dc             	mov    -0x24(%ebp),%eax
   33e5d:	3b 45 90             	cmp    -0x70(%ebp),%eax
   33e60:	7c a7                	jl     33e09 <do_unlink+0x3ff>
   33e62:	eb 01                	jmp    33e65 <do_unlink+0x45b>
   33e64:	90                   	nop
   33e65:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   33e68:	3b 45 8c             	cmp    -0x74(%ebp),%eax
   33e6b:	7f 16                	jg     33e83 <do_unlink+0x479>
   33e6d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
   33e71:	75 10                	jne    33e83 <do_unlink+0x479>
   33e73:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
   33e77:	8b 45 d8             	mov    -0x28(%ebp),%eax
   33e7a:	3b 45 90             	cmp    -0x70(%ebp),%eax
   33e7d:	0f 8c 51 ff ff ff    	jl     33dd4 <do_unlink+0x3ca>
   33e83:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   33e86:	3b 45 8c             	cmp    -0x74(%ebp),%eax
   33e89:	75 17                	jne    33ea2 <do_unlink+0x498>
   33e8b:	8b 45 98             	mov    -0x68(%ebp),%eax
   33e8e:	8b 55 e0             	mov    -0x20(%ebp),%edx
   33e91:	89 50 04             	mov    %edx,0x4(%eax)
   33e94:	83 ec 0c             	sub    $0xc,%esp
   33e97:	ff 75 98             	pushl  -0x68(%ebp)
   33e9a:	e8 fd 02 00 00       	call   3419c <sync_inode>
   33e9f:	83 c4 10             	add    $0x10,%esp
   33ea2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
   33ea6:	74 24                	je     33ecc <do_unlink+0x4c2>
   33ea8:	a1 10 80 03 00       	mov    0x38010,%eax
   33ead:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
   33eb0:	8b 55 f0             	mov    -0x10(%ebp),%edx
   33eb3:	01 ca                	add    %ecx,%edx
   33eb5:	83 ec 0c             	sub    $0xc,%esp
   33eb8:	6a 02                	push   $0x2
   33eba:	68 00 02 00 00       	push   $0x200
   33ebf:	50                   	push   %eax
   33ec0:	ff 75 b8             	pushl  -0x48(%ebp)
   33ec3:	52                   	push   %edx
   33ec4:	e8 f3 ed ff ff       	call   32cbc <rd_wt>
   33ec9:	83 c4 20             	add    $0x20,%esp
   33ecc:	90                   	nop
   33ecd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   33ed0:	c9                   	leave  
   33ed1:	c3                   	ret    

00033ed2 <do_rdwt>:
   33ed2:	55                   	push   %ebp
   33ed3:	89 e5                	mov    %esp,%ebp
   33ed5:	83 ec 78             	sub    $0x78,%esp
   33ed8:	8b 45 08             	mov    0x8(%ebp),%eax
   33edb:	8b 40 04             	mov    0x4(%eax),%eax
   33ede:	89 45 dc             	mov    %eax,-0x24(%ebp)
   33ee1:	8b 45 08             	mov    0x8(%ebp),%eax
   33ee4:	8b 40 1c             	mov    0x1c(%eax),%eax
   33ee7:	89 45 d8             	mov    %eax,-0x28(%ebp)
   33eea:	8b 45 08             	mov    0x8(%ebp),%eax
   33eed:	8b 40 5c             	mov    0x5c(%eax),%eax
   33ef0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
   33ef3:	8b 45 08             	mov    0x8(%ebp),%eax
   33ef6:	8b 00                	mov    (%eax),%eax
   33ef8:	89 45 d0             	mov    %eax,-0x30(%ebp)
   33efb:	8b 45 08             	mov    0x8(%ebp),%eax
   33efe:	8b 40 10             	mov    0x10(%eax),%eax
   33f01:	89 45 cc             	mov    %eax,-0x34(%ebp)
   33f04:	8b 45 08             	mov    0x8(%ebp),%eax
   33f07:	8b 40 40             	mov    0x40(%eax),%eax
   33f0a:	89 45 c8             	mov    %eax,-0x38(%ebp)
   33f0d:	8b 45 08             	mov    0x8(%ebp),%eax
   33f10:	8b 40 60             	mov    0x60(%eax),%eax
   33f13:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   33f16:	8b 45 d0             	mov    -0x30(%ebp),%eax
   33f19:	6b d0 64             	imul   $0x64,%eax,%edx
   33f1c:	8b 45 c8             	mov    -0x38(%ebp),%eax
   33f1f:	01 d0                	add    %edx,%eax
   33f21:	83 c0 1c             	add    $0x1c,%eax
   33f24:	8b 04 85 2c 3f 04 00 	mov    0x43f2c(,%eax,4),%eax
   33f2b:	8b 40 08             	mov    0x8(%eax),%eax
   33f2e:	89 45 c0             	mov    %eax,-0x40(%ebp)
   33f31:	8b 45 c0             	mov    -0x40(%ebp),%eax
   33f34:	8b 40 04             	mov    0x4(%eax),%eax
   33f37:	89 45 bc             	mov    %eax,-0x44(%ebp)
   33f3a:	8b 45 c0             	mov    -0x40(%ebp),%eax
   33f3d:	8b 00                	mov    (%eax),%eax
   33f3f:	85 c0                	test   %eax,%eax
   33f41:	75 5b                	jne    33f9e <do_rdwt+0xcc>
   33f43:	8b 45 08             	mov    0x8(%ebp),%eax
   33f46:	8b 40 04             	mov    0x4(%eax),%eax
   33f49:	83 f8 07             	cmp    $0x7,%eax
   33f4c:	75 09                	jne    33f57 <do_rdwt+0x85>
   33f4e:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
   33f55:	eb 12                	jmp    33f69 <do_rdwt+0x97>
   33f57:	8b 45 08             	mov    0x8(%ebp),%eax
   33f5a:	8b 40 04             	mov    0x4(%eax),%eax
   33f5d:	83 f8 0a             	cmp    $0xa,%eax
   33f60:	75 07                	jne    33f69 <do_rdwt+0x97>
   33f62:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
   33f69:	8b 45 08             	mov    0x8(%ebp),%eax
   33f6c:	8b 55 f4             	mov    -0xc(%ebp),%edx
   33f6f:	89 50 04             	mov    %edx,0x4(%eax)
   33f72:	8b 45 08             	mov    0x8(%ebp),%eax
   33f75:	8b 00                	mov    (%eax),%eax
   33f77:	89 c2                	mov    %eax,%edx
   33f79:	8b 45 08             	mov    0x8(%ebp),%eax
   33f7c:	89 50 58             	mov    %edx,0x58(%eax)
   33f7f:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
   33f86:	83 ec 04             	sub    $0x4,%esp
   33f89:	ff 75 b8             	pushl  -0x48(%ebp)
   33f8c:	ff 75 08             	pushl  0x8(%ebp)
   33f8f:	6a 03                	push   $0x3
   33f91:	e8 1d de ff ff       	call   31db3 <send_rec>
   33f96:	83 c4 10             	add    $0x10,%esp
   33f99:	e9 fc 01 00 00       	jmp    3419a <do_rdwt+0x2c8>
   33f9e:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
   33fa2:	75 14                	jne    33fb8 <do_rdwt+0xe6>
   33fa4:	8b 55 c4             	mov    -0x3c(%ebp),%edx
   33fa7:	8b 45 d8             	mov    -0x28(%ebp),%eax
   33faa:	01 d0                	add    %edx,%eax
   33fac:	39 45 bc             	cmp    %eax,-0x44(%ebp)
   33faf:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
   33fb3:	89 45 f0             	mov    %eax,-0x10(%ebp)
   33fb6:	eb 19                	jmp    33fd1 <do_rdwt+0xff>
   33fb8:	8b 55 c4             	mov    -0x3c(%ebp),%edx
   33fbb:	8b 45 d8             	mov    -0x28(%ebp),%eax
   33fbe:	01 c2                	add    %eax,%edx
   33fc0:	8b 45 c0             	mov    -0x40(%ebp),%eax
   33fc3:	8b 40 0c             	mov    0xc(%eax),%eax
   33fc6:	c1 e0 09             	shl    $0x9,%eax
   33fc9:	39 c2                	cmp    %eax,%edx
   33fcb:	0f 4e c2             	cmovle %edx,%eax
   33fce:	89 45 f0             	mov    %eax,-0x10(%ebp)
   33fd1:	8b 45 c4             	mov    -0x3c(%ebp),%eax
   33fd4:	99                   	cltd   
   33fd5:	c1 ea 17             	shr    $0x17,%edx
   33fd8:	01 d0                	add    %edx,%eax
   33fda:	25 ff 01 00 00       	and    $0x1ff,%eax
   33fdf:	29 d0                	sub    %edx,%eax
   33fe1:	89 45 ec             	mov    %eax,-0x14(%ebp)
   33fe4:	8b 45 c0             	mov    -0x40(%ebp),%eax
   33fe7:	8b 50 08             	mov    0x8(%eax),%edx
   33fea:	8b 45 c4             	mov    -0x3c(%ebp),%eax
   33fed:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
   33ff3:	85 c0                	test   %eax,%eax
   33ff5:	0f 48 c1             	cmovs  %ecx,%eax
   33ff8:	c1 f8 09             	sar    $0x9,%eax
   33ffb:	01 d0                	add    %edx,%eax
   33ffd:	89 45 b4             	mov    %eax,-0x4c(%ebp)
   34000:	8b 45 c0             	mov    -0x40(%ebp),%eax
   34003:	8b 50 08             	mov    0x8(%eax),%edx
   34006:	8b 45 f0             	mov    -0x10(%ebp),%eax
   34009:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
   3400f:	85 c0                	test   %eax,%eax
   34011:	0f 48 c1             	cmovs  %ecx,%eax
   34014:	c1 f8 09             	sar    $0x9,%eax
   34017:	01 d0                	add    %edx,%eax
   34019:	89 45 b0             	mov    %eax,-0x50(%ebp)
   3401c:	8b 45 b0             	mov    -0x50(%ebp),%eax
   3401f:	2b 45 b4             	sub    -0x4c(%ebp),%eax
   34022:	ba 00 00 10 00       	mov    $0x100000,%edx
   34027:	39 d0                	cmp    %edx,%eax
   34029:	7d 0b                	jge    34036 <do_rdwt+0x164>
   3402b:	8b 45 b0             	mov    -0x50(%ebp),%eax
   3402e:	2b 45 b4             	sub    -0x4c(%ebp),%eax
   34031:	83 c0 01             	add    $0x1,%eax
   34034:	eb 05                	jmp    3403b <do_rdwt+0x169>
   34036:	b8 00 00 10 00       	mov    $0x100000,%eax
   3403b:	89 45 ac             	mov    %eax,-0x54(%ebp)
   3403e:	8b 45 d8             	mov    -0x28(%ebp),%eax
   34041:	89 45 e8             	mov    %eax,-0x18(%ebp)
   34044:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   3404b:	8b 45 08             	mov    0x8(%ebp),%eax
   3404e:	8b 00                	mov    (%eax),%eax
   34050:	83 ec 0c             	sub    $0xc,%esp
   34053:	50                   	push   %eax
   34054:	e8 da 03 00 00       	call   34433 <pid2proc>
   34059:	83 c4 10             	add    $0x10,%esp
   3405c:	89 45 a8             	mov    %eax,-0x58(%ebp)
   3405f:	8b 45 a8             	mov    -0x58(%ebp),%eax
   34062:	8b 40 0c             	mov    0xc(%eax),%eax
   34065:	89 45 a4             	mov    %eax,-0x5c(%ebp)
   34068:	8b 45 a4             	mov    -0x5c(%ebp),%eax
   3406b:	83 ec 08             	sub    $0x8,%esp
   3406e:	ff 75 a8             	pushl  -0x58(%ebp)
   34071:	50                   	push   %eax
   34072:	e8 a5 04 00 00       	call   3451c <Seg2PhyAddrLDT>
   34077:	83 c4 10             	add    $0x10,%esp
   3407a:	89 45 a0             	mov    %eax,-0x60(%ebp)
   3407d:	8b 55 a0             	mov    -0x60(%ebp),%edx
   34080:	8b 45 cc             	mov    -0x34(%ebp),%eax
   34083:	01 d0                	add    %edx,%eax
   34085:	89 45 9c             	mov    %eax,-0x64(%ebp)
   34088:	8b 45 b4             	mov    -0x4c(%ebp),%eax
   3408b:	89 45 e0             	mov    %eax,-0x20(%ebp)
   3408e:	e9 c7 00 00 00       	jmp    3415a <do_rdwt+0x288>
   34093:	8b 45 ac             	mov    -0x54(%ebp),%eax
   34096:	c1 e0 09             	shl    $0x9,%eax
   34099:	2b 45 ec             	sub    -0x14(%ebp),%eax
   3409c:	39 45 e8             	cmp    %eax,-0x18(%ebp)
   3409f:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
   340a3:	89 45 98             	mov    %eax,-0x68(%ebp)
   340a6:	c7 45 94 20 00 00 00 	movl   $0x20,-0x6c(%ebp)
   340ad:	8b 45 ac             	mov    -0x54(%ebp),%eax
   340b0:	c1 e0 09             	shl    $0x9,%eax
   340b3:	89 c2                	mov    %eax,%edx
   340b5:	a1 10 80 03 00       	mov    0x38010,%eax
   340ba:	83 ec 0c             	sub    $0xc,%esp
   340bd:	6a 07                	push   $0x7
   340bf:	52                   	push   %edx
   340c0:	50                   	push   %eax
   340c1:	ff 75 94             	pushl  -0x6c(%ebp)
   340c4:	ff 75 e0             	pushl  -0x20(%ebp)
   340c7:	e8 f0 eb ff ff       	call   32cbc <rd_wt>
   340cc:	83 c4 20             	add    $0x20,%esp
   340cf:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
   340d3:	75 25                	jne    340fa <do_rdwt+0x228>
   340d5:	8b 15 10 80 03 00    	mov    0x38010,%edx
   340db:	8b 45 ec             	mov    -0x14(%ebp),%eax
   340de:	01 d0                	add    %edx,%eax
   340e0:	8b 4d 9c             	mov    -0x64(%ebp),%ecx
   340e3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
   340e6:	01 ca                	add    %ecx,%edx
   340e8:	83 ec 04             	sub    $0x4,%esp
   340eb:	ff 75 98             	pushl  -0x68(%ebp)
   340ee:	50                   	push   %eax
   340ef:	52                   	push   %edx
   340f0:	e8 92 1d 00 00       	call   35e87 <Memcpy>
   340f5:	83 c4 10             	add    $0x10,%esp
   340f8:	eb 47                	jmp    34141 <do_rdwt+0x26f>
   340fa:	8b 55 9c             	mov    -0x64(%ebp),%edx
   340fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   34100:	01 d0                	add    %edx,%eax
   34102:	89 c1                	mov    %eax,%ecx
   34104:	8b 15 10 80 03 00    	mov    0x38010,%edx
   3410a:	8b 45 ec             	mov    -0x14(%ebp),%eax
   3410d:	01 d0                	add    %edx,%eax
   3410f:	83 ec 04             	sub    $0x4,%esp
   34112:	ff 75 98             	pushl  -0x68(%ebp)
   34115:	51                   	push   %ecx
   34116:	50                   	push   %eax
   34117:	e8 6b 1d 00 00       	call   35e87 <Memcpy>
   3411c:	83 c4 10             	add    $0x10,%esp
   3411f:	8b 45 ac             	mov    -0x54(%ebp),%eax
   34122:	c1 e0 09             	shl    $0x9,%eax
   34125:	89 c2                	mov    %eax,%edx
   34127:	a1 10 80 03 00       	mov    0x38010,%eax
   3412c:	83 ec 0c             	sub    $0xc,%esp
   3412f:	6a 0a                	push   $0xa
   34131:	52                   	push   %edx
   34132:	50                   	push   %eax
   34133:	ff 75 94             	pushl  -0x6c(%ebp)
   34136:	ff 75 e0             	pushl  -0x20(%ebp)
   34139:	e8 7e eb ff ff       	call   32cbc <rd_wt>
   3413e:	83 c4 20             	add    $0x20,%esp
   34141:	8b 45 98             	mov    -0x68(%ebp),%eax
   34144:	29 45 e8             	sub    %eax,-0x18(%ebp)
   34147:	8b 45 98             	mov    -0x68(%ebp),%eax
   3414a:	01 45 e4             	add    %eax,-0x1c(%ebp)
   3414d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   34154:	8b 45 ac             	mov    -0x54(%ebp),%eax
   34157:	01 45 e0             	add    %eax,-0x20(%ebp)
   3415a:	8b 45 e0             	mov    -0x20(%ebp),%eax
   3415d:	3b 45 b0             	cmp    -0x50(%ebp),%eax
   34160:	7f 0a                	jg     3416c <do_rdwt+0x29a>
   34162:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
   34166:	0f 85 27 ff ff ff    	jne    34093 <do_rdwt+0x1c1>
   3416c:	8b 55 c4             	mov    -0x3c(%ebp),%edx
   3416f:	8b 45 d8             	mov    -0x28(%ebp),%eax
   34172:	01 c2                	add    %eax,%edx
   34174:	8b 45 c0             	mov    -0x40(%ebp),%eax
   34177:	8b 40 04             	mov    0x4(%eax),%eax
   3417a:	39 c2                	cmp    %eax,%edx
   3417c:	7e 1c                	jle    3419a <do_rdwt+0x2c8>
   3417e:	8b 55 c4             	mov    -0x3c(%ebp),%edx
   34181:	8b 45 d8             	mov    -0x28(%ebp),%eax
   34184:	01 c2                	add    %eax,%edx
   34186:	8b 45 c0             	mov    -0x40(%ebp),%eax
   34189:	89 50 04             	mov    %edx,0x4(%eax)
   3418c:	83 ec 0c             	sub    $0xc,%esp
   3418f:	ff 75 c0             	pushl  -0x40(%ebp)
   34192:	e8 05 00 00 00       	call   3419c <sync_inode>
   34197:	83 c4 10             	add    $0x10,%esp
   3419a:	c9                   	leave  
   3419b:	c3                   	ret    

0003419c <sync_inode>:
   3419c:	55                   	push   %ebp
   3419d:	89 e5                	mov    %esp,%ebp
   3419f:	53                   	push   %ebx
   341a0:	83 ec 24             	sub    $0x24,%esp
   341a3:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
   341aa:	8b 45 08             	mov    0x8(%ebp),%eax
   341ad:	8b 40 10             	mov    0x10(%eax),%eax
   341b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
   341b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
   341b6:	8d 48 ff             	lea    -0x1(%eax),%ecx
   341b9:	b8 00 02 00 00       	mov    $0x200,%eax
   341be:	99                   	cltd   
   341bf:	f7 7d f4             	idivl  -0xc(%ebp)
   341c2:	89 c3                	mov    %eax,%ebx
   341c4:	89 c8                	mov    %ecx,%eax
   341c6:	99                   	cltd   
   341c7:	f7 fb                	idiv   %ebx
   341c9:	89 55 ec             	mov    %edx,-0x14(%ebp)
   341cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
   341cf:	8d 48 ff             	lea    -0x1(%eax),%ecx
   341d2:	b8 00 02 00 00       	mov    $0x200,%eax
   341d7:	99                   	cltd   
   341d8:	f7 7d f4             	idivl  -0xc(%ebp)
   341db:	89 c3                	mov    %eax,%ebx
   341dd:	89 c8                	mov    %ecx,%eax
   341df:	99                   	cltd   
   341e0:	f7 fb                	idiv   %ebx
   341e2:	89 45 e8             	mov    %eax,-0x18(%ebp)
   341e5:	8b 45 08             	mov    0x8(%ebp),%eax
   341e8:	8b 40 14             	mov    0x14(%eax),%eax
   341eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
   341ee:	e8 2b 01 00 00       	call   3431e <get_super_block>
   341f3:	89 45 e0             	mov    %eax,-0x20(%ebp)
   341f6:	8b 45 e0             	mov    -0x20(%ebp),%eax
   341f9:	8b 40 04             	mov    0x4(%eax),%eax
   341fc:	8d 50 02             	lea    0x2(%eax),%edx
   341ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
   34202:	8b 40 08             	mov    0x8(%eax),%eax
   34205:	01 c2                	add    %eax,%edx
   34207:	8b 45 e8             	mov    -0x18(%ebp),%eax
   3420a:	01 d0                	add    %edx,%eax
   3420c:	89 45 dc             	mov    %eax,-0x24(%ebp)
   3420f:	a1 10 80 03 00       	mov    0x38010,%eax
   34214:	83 ec 0c             	sub    $0xc,%esp
   34217:	6a 01                	push   $0x1
   34219:	68 00 02 00 00       	push   $0x200
   3421e:	50                   	push   %eax
   3421f:	ff 75 e4             	pushl  -0x1c(%ebp)
   34222:	ff 75 dc             	pushl  -0x24(%ebp)
   34225:	e8 92 ea ff ff       	call   32cbc <rd_wt>
   3422a:	83 c4 20             	add    $0x20,%esp
   3422d:	a1 10 80 03 00       	mov    0x38010,%eax
   34232:	89 45 d8             	mov    %eax,-0x28(%ebp)
   34235:	83 ec 04             	sub    $0x4,%esp
   34238:	ff 75 f4             	pushl  -0xc(%ebp)
   3423b:	ff 75 08             	pushl  0x8(%ebp)
   3423e:	ff 75 d8             	pushl  -0x28(%ebp)
   34241:	e8 41 1c 00 00       	call   35e87 <Memcpy>
   34246:	83 c4 10             	add    $0x10,%esp
   34249:	a1 10 80 03 00       	mov    0x38010,%eax
   3424e:	83 ec 0c             	sub    $0xc,%esp
   34251:	6a 02                	push   $0x2
   34253:	68 00 02 00 00       	push   $0x200
   34258:	50                   	push   %eax
   34259:	ff 75 e4             	pushl  -0x1c(%ebp)
   3425c:	ff 75 dc             	pushl  -0x24(%ebp)
   3425f:	e8 58 ea ff ff       	call   32cbc <rd_wt>
   34264:	83 c4 20             	add    $0x20,%esp
   34267:	90                   	nop
   34268:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   3426b:	c9                   	leave  
   3426c:	c3                   	ret    

0003426d <put_inode>:
   3426d:	55                   	push   %ebp
   3426e:	89 e5                	mov    %esp,%ebp
   34270:	83 ec 08             	sub    $0x8,%esp
   34273:	8b 45 08             	mov    0x8(%ebp),%eax
   34276:	8b 40 18             	mov    0x18(%eax),%eax
   34279:	85 c0                	test   %eax,%eax
   3427b:	7f 1c                	jg     34299 <put_inode+0x2c>
   3427d:	68 7e 03 00 00       	push   $0x37e
   34282:	68 4e 5d 03 00       	push   $0x35d4e
   34287:	68 4e 5d 03 00       	push   $0x35d4e
   3428c:	68 1c 5e 03 00       	push   $0x35e1c
   34291:	e8 c6 d3 ff ff       	call   3165c <assertion_failure>
   34296:	83 c4 10             	add    $0x10,%esp
   34299:	8b 45 08             	mov    0x8(%ebp),%eax
   3429c:	8b 40 18             	mov    0x18(%eax),%eax
   3429f:	8d 50 ff             	lea    -0x1(%eax),%edx
   342a2:	8b 45 08             	mov    0x8(%ebp),%eax
   342a5:	89 50 18             	mov    %edx,0x18(%eax)
   342a8:	90                   	nop
   342a9:	c9                   	leave  
   342aa:	c3                   	ret    

000342ab <do_close>:
   342ab:	55                   	push   %ebp
   342ac:	89 e5                	mov    %esp,%ebp
   342ae:	83 ec 08             	sub    $0x8,%esp
   342b1:	a1 a4 92 03 00       	mov    0x392a4,%eax
   342b6:	8b 55 08             	mov    0x8(%ebp),%edx
   342b9:	83 c2 1c             	add    $0x1c,%edx
   342bc:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
   342c0:	8b 40 08             	mov    0x8(%eax),%eax
   342c3:	83 ec 0c             	sub    $0xc,%esp
   342c6:	50                   	push   %eax
   342c7:	e8 a1 ff ff ff       	call   3426d <put_inode>
   342cc:	83 c4 10             	add    $0x10,%esp
   342cf:	a1 a4 92 03 00       	mov    0x392a4,%eax
   342d4:	8b 55 08             	mov    0x8(%ebp),%edx
   342d7:	83 c2 1c             	add    $0x1c,%edx
   342da:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
   342de:	8b 50 0c             	mov    0xc(%eax),%edx
   342e1:	83 ea 01             	sub    $0x1,%edx
   342e4:	89 50 0c             	mov    %edx,0xc(%eax)
   342e7:	8b 40 0c             	mov    0xc(%eax),%eax
   342ea:	85 c0                	test   %eax,%eax
   342ec:	75 16                	jne    34304 <do_close+0x59>
   342ee:	a1 a4 92 03 00       	mov    0x392a4,%eax
   342f3:	8b 55 08             	mov    0x8(%ebp),%edx
   342f6:	83 c2 1c             	add    $0x1c,%edx
   342f9:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
   342fd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
   34304:	a1 a4 92 03 00       	mov    0x392a4,%eax
   34309:	8b 55 08             	mov    0x8(%ebp),%edx
   3430c:	83 c2 1c             	add    $0x1c,%edx
   3430f:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
   34316:	00 
   34317:	b8 00 00 00 00       	mov    $0x0,%eax
   3431c:	c9                   	leave  
   3431d:	c3                   	ret    

0003431e <get_super_block>:
   3431e:	55                   	push   %ebp
   3431f:	89 e5                	mov    %esp,%ebp
   34321:	83 ec 18             	sub    $0x18,%esp
   34324:	a1 10 80 03 00       	mov    0x38010,%eax
   34329:	83 ec 0c             	sub    $0xc,%esp
   3432c:	6a 01                	push   $0x1
   3432e:	68 00 02 00 00       	push   $0x200
   34333:	50                   	push   %eax
   34334:	6a 20                	push   $0x20
   34336:	6a 01                	push   $0x1
   34338:	e8 7f e9 ff ff       	call   32cbc <rd_wt>
   3433d:	83 c4 20             	add    $0x20,%esp
   34340:	a1 10 80 03 00       	mov    0x38010,%eax
   34345:	89 45 f4             	mov    %eax,-0xc(%ebp)
   34348:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3434b:	c9                   	leave  
   3434c:	c3                   	ret    

0003434d <schedule_process>:
   3434d:	55                   	push   %ebp
   3434e:	89 e5                	mov    %esp,%ebp
   34350:	83 ec 10             	sub    $0x10,%esp
   34353:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   3435a:	eb 7e                	jmp    343da <schedule_process+0x8d>
   3435c:	c7 45 fc 20 3f 04 00 	movl   $0x43f20,-0x4(%ebp)
   34363:	eb 31                	jmp    34396 <schedule_process+0x49>
   34365:	8b 45 fc             	mov    -0x4(%ebp),%eax
   34368:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
   3436f:	84 c0                	test   %al,%al
   34371:	75 1c                	jne    3438f <schedule_process+0x42>
   34373:	8b 45 fc             	mov    -0x4(%ebp),%eax
   34376:	8b 40 5c             	mov    0x5c(%eax),%eax
   34379:	39 45 f8             	cmp    %eax,-0x8(%ebp)
   3437c:	73 11                	jae    3438f <schedule_process+0x42>
   3437e:	8b 45 fc             	mov    -0x4(%ebp),%eax
   34381:	8b 40 5c             	mov    0x5c(%eax),%eax
   34384:	89 45 f8             	mov    %eax,-0x8(%ebp)
   34387:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3438a:	a3 a0 92 03 00       	mov    %eax,0x392a0
   3438f:	81 45 fc 90 01 00 00 	addl   $0x190,-0x4(%ebp)
   34396:	b8 10 4a 04 00       	mov    $0x44a10,%eax
   3439b:	39 45 fc             	cmp    %eax,-0x4(%ebp)
   3439e:	72 c5                	jb     34365 <schedule_process+0x18>
   343a0:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
   343a4:	75 34                	jne    343da <schedule_process+0x8d>
   343a6:	c7 45 fc 20 3f 04 00 	movl   $0x43f20,-0x4(%ebp)
   343ad:	eb 21                	jmp    343d0 <schedule_process+0x83>
   343af:	8b 45 fc             	mov    -0x4(%ebp),%eax
   343b2:	0f b6 80 7c 01 00 00 	movzbl 0x17c(%eax),%eax
   343b9:	84 c0                	test   %al,%al
   343bb:	75 0c                	jne    343c9 <schedule_process+0x7c>
   343bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
   343c0:	8b 50 60             	mov    0x60(%eax),%edx
   343c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
   343c6:	89 50 5c             	mov    %edx,0x5c(%eax)
   343c9:	81 45 fc 90 01 00 00 	addl   $0x190,-0x4(%ebp)
   343d0:	b8 10 4a 04 00       	mov    $0x44a10,%eax
   343d5:	39 45 fc             	cmp    %eax,-0x4(%ebp)
   343d8:	72 d5                	jb     343af <schedule_process+0x62>
   343da:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
   343de:	0f 84 78 ff ff ff    	je     3435c <schedule_process+0xf>
   343e4:	90                   	nop
   343e5:	c9                   	leave  
   343e6:	c3                   	ret    

000343e7 <clock_handler>:
   343e7:	55                   	push   %ebp
   343e8:	89 e5                	mov    %esp,%ebp
   343ea:	a1 a0 92 03 00       	mov    0x392a0,%eax
   343ef:	8b 40 5c             	mov    0x5c(%eax),%eax
   343f2:	85 c0                	test   %eax,%eax
   343f4:	74 0e                	je     34404 <clock_handler+0x1d>
   343f6:	a1 a0 92 03 00       	mov    0x392a0,%eax
   343fb:	8b 50 5c             	mov    0x5c(%eax),%edx
   343fe:	83 ea 01             	sub    $0x1,%edx
   34401:	89 50 5c             	mov    %edx,0x5c(%eax)
   34404:	a1 80 c4 03 00       	mov    0x3c480,%eax
   34409:	83 c0 01             	add    $0x1,%eax
   3440c:	a3 80 c4 03 00       	mov    %eax,0x3c480
   34411:	a1 94 8e 03 00       	mov    0x38e94,%eax
   34416:	85 c0                	test   %eax,%eax
   34418:	75 13                	jne    3442d <clock_handler+0x46>
   3441a:	a1 a0 92 03 00       	mov    0x392a0,%eax
   3441f:	8b 40 5c             	mov    0x5c(%eax),%eax
   34422:	85 c0                	test   %eax,%eax
   34424:	75 0a                	jne    34430 <clock_handler+0x49>
   34426:	e8 22 ff ff ff       	call   3434d <schedule_process>
   3442b:	eb 04                	jmp    34431 <clock_handler+0x4a>
   3442d:	90                   	nop
   3442e:	eb 01                	jmp    34431 <clock_handler+0x4a>
   34430:	90                   	nop
   34431:	5d                   	pop    %ebp
   34432:	c3                   	ret    

00034433 <pid2proc>:
   34433:	55                   	push   %ebp
   34434:	89 e5                	mov    %esp,%ebp
   34436:	83 ec 10             	sub    $0x10,%esp
   34439:	8b 45 08             	mov    0x8(%ebp),%eax
   3443c:	69 c0 90 01 00 00    	imul   $0x190,%eax,%eax
   34442:	05 20 3f 04 00       	add    $0x43f20,%eax
   34447:	89 45 fc             	mov    %eax,-0x4(%ebp)
   3444a:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3444d:	c9                   	leave  
   3444e:	c3                   	ret    

0003444f <proc2pid>:
   3444f:	55                   	push   %ebp
   34450:	89 e5                	mov    %esp,%ebp
   34452:	83 ec 10             	sub    $0x10,%esp
   34455:	8b 45 08             	mov    0x8(%ebp),%eax
   34458:	2d 20 3f 04 00       	sub    $0x43f20,%eax
   3445d:	c1 f8 04             	sar    $0x4,%eax
   34460:	69 c0 29 5c 8f c2    	imul   $0xc28f5c29,%eax,%eax
   34466:	89 45 fc             	mov    %eax,-0x4(%ebp)
   34469:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3446c:	c9                   	leave  
   3446d:	c3                   	ret    

0003446e <InitDescriptor>:
   3446e:	55                   	push   %ebp
   3446f:	89 e5                	mov    %esp,%ebp
   34471:	83 ec 04             	sub    $0x4,%esp
   34474:	8b 45 14             	mov    0x14(%ebp),%eax
   34477:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
   3447b:	8b 45 10             	mov    0x10(%ebp),%eax
   3447e:	89 c2                	mov    %eax,%edx
   34480:	8b 45 08             	mov    0x8(%ebp),%eax
   34483:	66 89 10             	mov    %dx,(%eax)
   34486:	8b 45 0c             	mov    0xc(%ebp),%eax
   34489:	89 c2                	mov    %eax,%edx
   3448b:	8b 45 08             	mov    0x8(%ebp),%eax
   3448e:	66 89 50 02          	mov    %dx,0x2(%eax)
   34492:	8b 45 0c             	mov    0xc(%ebp),%eax
   34495:	c1 e8 10             	shr    $0x10,%eax
   34498:	89 c2                	mov    %eax,%edx
   3449a:	8b 45 08             	mov    0x8(%ebp),%eax
   3449d:	88 50 04             	mov    %dl,0x4(%eax)
   344a0:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
   344a4:	89 c2                	mov    %eax,%edx
   344a6:	8b 45 08             	mov    0x8(%ebp),%eax
   344a9:	88 50 05             	mov    %dl,0x5(%eax)
   344ac:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
   344b0:	66 c1 e8 08          	shr    $0x8,%ax
   344b4:	c1 e0 04             	shl    $0x4,%eax
   344b7:	89 c2                	mov    %eax,%edx
   344b9:	8b 45 10             	mov    0x10(%ebp),%eax
   344bc:	c1 e8 10             	shr    $0x10,%eax
   344bf:	83 e0 0f             	and    $0xf,%eax
   344c2:	09 c2                	or     %eax,%edx
   344c4:	8b 45 08             	mov    0x8(%ebp),%eax
   344c7:	88 50 06             	mov    %dl,0x6(%eax)
   344ca:	8b 45 0c             	mov    0xc(%ebp),%eax
   344cd:	c1 e8 18             	shr    $0x18,%eax
   344d0:	89 c2                	mov    %eax,%edx
   344d2:	8b 45 08             	mov    0x8(%ebp),%eax
   344d5:	88 50 07             	mov    %dl,0x7(%eax)
   344d8:	90                   	nop
   344d9:	c9                   	leave  
   344da:	c3                   	ret    

000344db <Seg2PhyAddr>:
   344db:	55                   	push   %ebp
   344dc:	89 e5                	mov    %esp,%ebp
   344de:	83 ec 10             	sub    $0x10,%esp
   344e1:	8b 45 08             	mov    0x8(%ebp),%eax
   344e4:	c1 e8 03             	shr    $0x3,%eax
   344e7:	8b 14 c5 a4 8e 03 00 	mov    0x38ea4(,%eax,8),%edx
   344ee:	8b 04 c5 a0 8e 03 00 	mov    0x38ea0(,%eax,8),%eax
   344f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
   344f8:	89 55 f8             	mov    %edx,-0x8(%ebp)
   344fb:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
   344ff:	0f b7 c0             	movzwl %ax,%eax
   34502:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
   34506:	0f b6 d2             	movzbl %dl,%edx
   34509:	c1 e2 10             	shl    $0x10,%edx
   3450c:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
   34512:	09 d0                	or     %edx,%eax
   34514:	89 45 fc             	mov    %eax,-0x4(%ebp)
   34517:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3451a:	c9                   	leave  
   3451b:	c3                   	ret    

0003451c <Seg2PhyAddrLDT>:
   3451c:	55                   	push   %ebp
   3451d:	89 e5                	mov    %esp,%ebp
   3451f:	83 ec 10             	sub    $0x10,%esp
   34522:	8b 45 08             	mov    0x8(%ebp),%eax
   34525:	c1 e8 03             	shr    $0x3,%eax
   34528:	89 c2                	mov    %eax,%edx
   3452a:	8b 45 0c             	mov    0xc(%ebp),%eax
   3452d:	83 c2 08             	add    $0x8,%edx
   34530:	8d 54 d0 06          	lea    0x6(%eax,%edx,8),%edx
   34534:	8b 02                	mov    (%edx),%eax
   34536:	8b 52 04             	mov    0x4(%edx),%edx
   34539:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3453c:	89 55 f8             	mov    %edx,-0x8(%ebp)
   3453f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
   34543:	0f b7 c0             	movzwl %ax,%eax
   34546:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
   3454a:	0f b6 d2             	movzbl %dl,%edx
   3454d:	c1 e2 10             	shl    $0x10,%edx
   34550:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
   34556:	09 d0                	or     %edx,%eax
   34558:	89 45 fc             	mov    %eax,-0x4(%ebp)
   3455b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3455e:	c9                   	leave  
   3455f:	c3                   	ret    

00034560 <VirAddr2PhyAddr>:
   34560:	55                   	push   %ebp
   34561:	89 e5                	mov    %esp,%ebp
   34563:	83 ec 10             	sub    $0x10,%esp
   34566:	8b 55 0c             	mov    0xc(%ebp),%edx
   34569:	8b 45 08             	mov    0x8(%ebp),%eax
   3456c:	01 d0                	add    %edx,%eax
   3456e:	89 45 fc             	mov    %eax,-0x4(%ebp)
   34571:	8b 45 fc             	mov    -0x4(%ebp),%eax
   34574:	c9                   	leave  
   34575:	c3                   	ret    

00034576 <v2l>:
   34576:	55                   	push   %ebp
   34577:	89 e5                	mov    %esp,%ebp
   34579:	83 ec 18             	sub    $0x18,%esp
   3457c:	83 ec 0c             	sub    $0xc,%esp
   3457f:	ff 75 08             	pushl  0x8(%ebp)
   34582:	e8 ac fe ff ff       	call   34433 <pid2proc>
   34587:	83 c4 10             	add    $0x10,%esp
   3458a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3458d:	8b 45 f4             	mov    -0xc(%ebp),%eax
   34590:	8b 40 0c             	mov    0xc(%eax),%eax
   34593:	89 45 f0             	mov    %eax,-0x10(%ebp)
   34596:	8b 45 f0             	mov    -0x10(%ebp),%eax
   34599:	83 ec 08             	sub    $0x8,%esp
   3459c:	ff 75 f4             	pushl  -0xc(%ebp)
   3459f:	50                   	push   %eax
   345a0:	e8 77 ff ff ff       	call   3451c <Seg2PhyAddrLDT>
   345a5:	83 c4 10             	add    $0x10,%esp
   345a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
   345ab:	8b 55 ec             	mov    -0x14(%ebp),%edx
   345ae:	8b 45 0c             	mov    0xc(%ebp),%eax
   345b1:	01 d0                	add    %edx,%eax
   345b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
   345b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
   345b9:	c9                   	leave  
   345ba:	c3                   	ret    

000345bb <init_propt>:
   345bb:	55                   	push   %ebp
   345bc:	89 e5                	mov    %esp,%ebp
   345be:	53                   	push   %ebx
   345bf:	83 ec 24             	sub    $0x24,%esp
   345c2:	6a 0e                	push   $0xe
   345c4:	6a 08                	push   $0x8
   345c6:	68 67 05 03 00       	push   $0x30567
   345cb:	6a 20                	push   $0x20
   345cd:	e8 53 01 00 00       	call   34725 <InitInterruptDesc>
   345d2:	83 c4 10             	add    $0x10,%esp
   345d5:	6a 0e                	push   $0xe
   345d7:	6a 08                	push   $0x8
   345d9:	68 b0 05 03 00       	push   $0x305b0
   345de:	6a 21                	push   $0x21
   345e0:	e8 40 01 00 00       	call   34725 <InitInterruptDesc>
   345e5:	83 c4 10             	add    $0x10,%esp
   345e8:	6a 0e                	push   $0xe
   345ea:	6a 08                	push   $0x8
   345ec:	68 f9 05 03 00       	push   $0x305f9
   345f1:	6a 2e                	push   $0x2e
   345f3:	e8 2d 01 00 00       	call   34725 <InitInterruptDesc>
   345f8:	83 c4 10             	add    $0x10,%esp
   345fb:	83 ec 04             	sub    $0x4,%esp
   345fe:	68 f0 0a 00 00       	push   $0xaf0
   34603:	6a 00                	push   $0x0
   34605:	68 20 3f 04 00       	push   $0x43f20
   3460a:	e8 a6 18 00 00       	call   35eb5 <Memset>
   3460f:	83 c4 10             	add    $0x10,%esp
   34612:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
   34619:	83 ec 04             	sub    $0x4,%esp
   3461c:	ff 75 f0             	pushl  -0x10(%ebp)
   3461f:	6a 00                	push   $0x0
   34621:	68 00 bc 03 00       	push   $0x3bc00
   34626:	e8 8a 18 00 00       	call   35eb5 <Memset>
   3462b:	83 c4 10             	add    $0x10,%esp
   3462e:	8b 45 f0             	mov    -0x10(%ebp),%eax
   34631:	a3 68 bc 03 00       	mov    %eax,0x3bc68
   34636:	c7 05 08 bc 03 00 30 	movl   $0x30,0x3bc08
   3463d:	00 00 00 
   34640:	83 ec 0c             	sub    $0xc,%esp
   34643:	6a 30                	push   $0x30
   34645:	e8 91 fe ff ff       	call   344db <Seg2PhyAddr>
   3464a:	83 c4 10             	add    $0x10,%esp
   3464d:	89 45 ec             	mov    %eax,-0x14(%ebp)
   34650:	8b 45 ec             	mov    -0x14(%ebp),%eax
   34653:	83 ec 08             	sub    $0x8,%esp
   34656:	68 00 bc 03 00       	push   $0x3bc00
   3465b:	50                   	push   %eax
   3465c:	e8 ff fe ff ff       	call   34560 <VirAddr2PhyAddr>
   34661:	83 c4 10             	add    $0x10,%esp
   34664:	89 45 e8             	mov    %eax,-0x18(%ebp)
   34667:	c7 45 e4 89 00 00 00 	movl   $0x89,-0x1c(%ebp)
   3466e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   34671:	0f b7 d0             	movzwl %ax,%edx
   34674:	8b 45 f0             	mov    -0x10(%ebp),%eax
   34677:	83 e8 01             	sub    $0x1,%eax
   3467a:	89 c1                	mov    %eax,%ecx
   3467c:	8b 45 e8             	mov    -0x18(%ebp),%eax
   3467f:	52                   	push   %edx
   34680:	51                   	push   %ecx
   34681:	50                   	push   %eax
   34682:	68 e0 8e 03 00       	push   $0x38ee0
   34687:	e8 e2 fd ff ff       	call   3446e <InitDescriptor>
   3468c:	83 c4 10             	add    $0x10,%esp
   3468f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   34696:	eb 65                	jmp    346fd <init_propt+0x142>
   34698:	c7 45 e0 10 00 00 00 	movl   $0x10,-0x20(%ebp)
   3469f:	c7 45 dc 82 00 00 00 	movl   $0x82,-0x24(%ebp)
   346a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
   346a9:	69 c0 90 01 00 00    	imul   $0x190,%eax,%eax
   346af:	83 c0 40             	add    $0x40,%eax
   346b2:	05 20 3f 04 00       	add    $0x43f20,%eax
   346b7:	8d 50 06             	lea    0x6(%eax),%edx
   346ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
   346bd:	83 ec 08             	sub    $0x8,%esp
   346c0:	52                   	push   %edx
   346c1:	50                   	push   %eax
   346c2:	e8 99 fe ff ff       	call   34560 <VirAddr2PhyAddr>
   346c7:	83 c4 10             	add    $0x10,%esp
   346ca:	89 45 d8             	mov    %eax,-0x28(%ebp)
   346cd:	8b 45 dc             	mov    -0x24(%ebp),%eax
   346d0:	0f b7 d0             	movzwl %ax,%edx
   346d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
   346d6:	83 e8 01             	sub    $0x1,%eax
   346d9:	89 c3                	mov    %eax,%ebx
   346db:	8b 45 d8             	mov    -0x28(%ebp),%eax
   346de:	8b 4d f4             	mov    -0xc(%ebp),%ecx
   346e1:	83 c1 09             	add    $0x9,%ecx
   346e4:	c1 e1 03             	shl    $0x3,%ecx
   346e7:	81 c1 a0 8e 03 00    	add    $0x38ea0,%ecx
   346ed:	52                   	push   %edx
   346ee:	53                   	push   %ebx
   346ef:	50                   	push   %eax
   346f0:	51                   	push   %ecx
   346f1:	e8 78 fd ff ff       	call   3446e <InitDescriptor>
   346f6:	83 c4 10             	add    $0x10,%esp
   346f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   346fd:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
   34701:	7e 95                	jle    34698 <init_propt+0xdd>
   34703:	68 f2 00 00 00       	push   $0xf2
   34708:	68 ff ff 00 00       	push   $0xffff
   3470d:	68 00 80 0b 00       	push   $0xb8000
   34712:	68 d8 8e 03 00       	push   $0x38ed8
   34717:	e8 52 fd ff ff       	call   3446e <InitDescriptor>
   3471c:	83 c4 10             	add    $0x10,%esp
   3471f:	90                   	nop
   34720:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   34723:	c9                   	leave  
   34724:	c3                   	ret    

00034725 <InitInterruptDesc>:
   34725:	55                   	push   %ebp
   34726:	89 e5                	mov    %esp,%ebp
   34728:	83 ec 10             	sub    $0x10,%esp
   3472b:	8b 45 08             	mov    0x8(%ebp),%eax
   3472e:	c1 e0 03             	shl    $0x3,%eax
   34731:	05 80 bc 03 00       	add    $0x3bc80,%eax
   34736:	89 45 fc             	mov    %eax,-0x4(%ebp)
   34739:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3473c:	c6 40 04 00          	movb   $0x0,0x4(%eax)
   34740:	8b 45 0c             	mov    0xc(%ebp),%eax
   34743:	89 45 f8             	mov    %eax,-0x8(%ebp)
   34746:	8b 45 f8             	mov    -0x8(%ebp),%eax
   34749:	89 c2                	mov    %eax,%edx
   3474b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3474e:	66 89 10             	mov    %dx,(%eax)
   34751:	8b 45 fc             	mov    -0x4(%ebp),%eax
   34754:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
   3475a:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3475d:	c1 f8 10             	sar    $0x10,%eax
   34760:	89 c2                	mov    %eax,%edx
   34762:	8b 45 fc             	mov    -0x4(%ebp),%eax
   34765:	66 89 50 06          	mov    %dx,0x6(%eax)
   34769:	8b 45 10             	mov    0x10(%ebp),%eax
   3476c:	c1 e0 04             	shl    $0x4,%eax
   3476f:	89 c2                	mov    %eax,%edx
   34771:	8b 45 14             	mov    0x14(%ebp),%eax
   34774:	09 d0                	or     %edx,%eax
   34776:	89 c2                	mov    %eax,%edx
   34778:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3477b:	88 50 05             	mov    %dl,0x5(%eax)
   3477e:	90                   	nop
   3477f:	c9                   	leave  
   34780:	c3                   	ret    

00034781 <ReloadGDT>:
   34781:	55                   	push   %ebp
   34782:	89 e5                	mov    %esp,%ebp
   34784:	83 ec 28             	sub    $0x28,%esp
   34787:	b8 78 bc 03 00       	mov    $0x3bc78,%eax
   3478c:	0f b7 00             	movzwl (%eax),%eax
   3478f:	98                   	cwtl   
   34790:	ba 7a bc 03 00       	mov    $0x3bc7a,%edx
   34795:	8b 12                	mov    (%edx),%edx
   34797:	83 ec 04             	sub    $0x4,%esp
   3479a:	50                   	push   %eax
   3479b:	52                   	push   %edx
   3479c:	68 a0 8e 03 00       	push   $0x38ea0
   347a1:	e8 e1 16 00 00       	call   35e87 <Memcpy>
   347a6:	83 c4 10             	add    $0x10,%esp
   347a9:	c7 45 f0 78 bc 03 00 	movl   $0x3bc78,-0x10(%ebp)
   347b0:	c7 45 ec 7a bc 03 00 	movl   $0x3bc7a,-0x14(%ebp)
   347b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
   347ba:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   347bf:	ba a0 8e 03 00       	mov    $0x38ea0,%edx
   347c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
   347c7:	89 10                	mov    %edx,(%eax)
   347c9:	c7 45 e8 88 8e 03 00 	movl   $0x38e88,-0x18(%ebp)
   347d0:	c7 45 e4 8a 8e 03 00 	movl   $0x38e8a,-0x1c(%ebp)
   347d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
   347da:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   347df:	ba 80 bc 03 00       	mov    $0x3bc80,%edx
   347e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
   347e7:	89 10                	mov    %edx,(%eax)
   347e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   347f0:	eb 04                	jmp    347f6 <ReloadGDT+0x75>
   347f2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   347f6:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
   347fd:	7e f3                	jle    347f2 <ReloadGDT+0x71>
   347ff:	e8 6e c3 ff ff       	call   30b72 <init_internal_interrupt>
   34804:	e8 b2 fd ff ff       	call   345bb <init_propt>
   34809:	90                   	nop
   3480a:	c9                   	leave  
   3480b:	c3                   	ret    

0003480c <select_console>:
   3480c:	55                   	push   %ebp
   3480d:	89 e5                	mov    %esp,%ebp
   3480f:	83 ec 18             	sub    $0x18,%esp
   34812:	8b 45 08             	mov    0x8(%ebp),%eax
   34815:	88 45 f4             	mov    %al,-0xc(%ebp)
   34818:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
   3481c:	77 27                	ja     34845 <select_console+0x39>
   3481e:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
   34822:	69 c0 a4 0c 00 00    	imul   $0xca4,%eax,%eax
   34828:	05 00 96 03 00       	add    $0x39600,%eax
   3482d:	a3 80 8e 03 00       	mov    %eax,0x38e80
   34832:	a1 80 8e 03 00       	mov    0x38e80,%eax
   34837:	83 ec 0c             	sub    $0xc,%esp
   3483a:	50                   	push   %eax
   3483b:	e8 08 00 00 00       	call   34848 <flush>
   34840:	83 c4 10             	add    $0x10,%esp
   34843:	eb 01                	jmp    34846 <select_console+0x3a>
   34845:	90                   	nop
   34846:	c9                   	leave  
   34847:	c3                   	ret    

00034848 <flush>:
   34848:	55                   	push   %ebp
   34849:	89 e5                	mov    %esp,%ebp
   3484b:	83 ec 08             	sub    $0x8,%esp
   3484e:	8b 45 08             	mov    0x8(%ebp),%eax
   34851:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34857:	8b 40 0c             	mov    0xc(%eax),%eax
   3485a:	83 ec 0c             	sub    $0xc,%esp
   3485d:	50                   	push   %eax
   3485e:	e8 1e 00 00 00       	call   34881 <set_cursor>
   34863:	83 c4 10             	add    $0x10,%esp
   34866:	8b 45 08             	mov    0x8(%ebp),%eax
   34869:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   3486f:	8b 40 08             	mov    0x8(%eax),%eax
   34872:	83 ec 0c             	sub    $0xc,%esp
   34875:	50                   	push   %eax
   34876:	e8 64 00 00 00       	call   348df <set_console_start_video_addr>
   3487b:	83 c4 10             	add    $0x10,%esp
   3487e:	90                   	nop
   3487f:	c9                   	leave  
   34880:	c3                   	ret    

00034881 <set_cursor>:
   34881:	55                   	push   %ebp
   34882:	89 e5                	mov    %esp,%ebp
   34884:	83 ec 08             	sub    $0x8,%esp
   34887:	83 ec 08             	sub    $0x8,%esp
   3488a:	6a 0e                	push   $0xe
   3488c:	68 d4 03 00 00       	push   $0x3d4
   34891:	e8 48 be ff ff       	call   306de <out_byte>
   34896:	83 c4 10             	add    $0x10,%esp
   34899:	8b 45 08             	mov    0x8(%ebp),%eax
   3489c:	c1 e8 08             	shr    $0x8,%eax
   3489f:	0f b7 c0             	movzwl %ax,%eax
   348a2:	83 ec 08             	sub    $0x8,%esp
   348a5:	50                   	push   %eax
   348a6:	68 d5 03 00 00       	push   $0x3d5
   348ab:	e8 2e be ff ff       	call   306de <out_byte>
   348b0:	83 c4 10             	add    $0x10,%esp
   348b3:	83 ec 08             	sub    $0x8,%esp
   348b6:	6a 0f                	push   $0xf
   348b8:	68 d4 03 00 00       	push   $0x3d4
   348bd:	e8 1c be ff ff       	call   306de <out_byte>
   348c2:	83 c4 10             	add    $0x10,%esp
   348c5:	8b 45 08             	mov    0x8(%ebp),%eax
   348c8:	0f b7 c0             	movzwl %ax,%eax
   348cb:	83 ec 08             	sub    $0x8,%esp
   348ce:	50                   	push   %eax
   348cf:	68 d5 03 00 00       	push   $0x3d5
   348d4:	e8 05 be ff ff       	call   306de <out_byte>
   348d9:	83 c4 10             	add    $0x10,%esp
   348dc:	90                   	nop
   348dd:	c9                   	leave  
   348de:	c3                   	ret    

000348df <set_console_start_video_addr>:
   348df:	55                   	push   %ebp
   348e0:	89 e5                	mov    %esp,%ebp
   348e2:	83 ec 08             	sub    $0x8,%esp
   348e5:	83 ec 08             	sub    $0x8,%esp
   348e8:	6a 0c                	push   $0xc
   348ea:	68 d4 03 00 00       	push   $0x3d4
   348ef:	e8 ea bd ff ff       	call   306de <out_byte>
   348f4:	83 c4 10             	add    $0x10,%esp
   348f7:	8b 45 08             	mov    0x8(%ebp),%eax
   348fa:	c1 e8 08             	shr    $0x8,%eax
   348fd:	0f b7 c0             	movzwl %ax,%eax
   34900:	83 ec 08             	sub    $0x8,%esp
   34903:	50                   	push   %eax
   34904:	68 d5 03 00 00       	push   $0x3d5
   34909:	e8 d0 bd ff ff       	call   306de <out_byte>
   3490e:	83 c4 10             	add    $0x10,%esp
   34911:	83 ec 08             	sub    $0x8,%esp
   34914:	6a 0d                	push   $0xd
   34916:	68 d4 03 00 00       	push   $0x3d4
   3491b:	e8 be bd ff ff       	call   306de <out_byte>
   34920:	83 c4 10             	add    $0x10,%esp
   34923:	8b 45 08             	mov    0x8(%ebp),%eax
   34926:	0f b7 c0             	movzwl %ax,%eax
   34929:	83 ec 08             	sub    $0x8,%esp
   3492c:	50                   	push   %eax
   3492d:	68 d5 03 00 00       	push   $0x3d5
   34932:	e8 a7 bd ff ff       	call   306de <out_byte>
   34937:	83 c4 10             	add    $0x10,%esp
   3493a:	90                   	nop
   3493b:	c9                   	leave  
   3493c:	c3                   	ret    

0003493d <put_key>:
   3493d:	55                   	push   %ebp
   3493e:	89 e5                	mov    %esp,%ebp
   34940:	83 ec 04             	sub    $0x4,%esp
   34943:	8b 45 0c             	mov    0xc(%ebp),%eax
   34946:	88 45 fc             	mov    %al,-0x4(%ebp)
   34949:	8b 45 08             	mov    0x8(%ebp),%eax
   3494c:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   34952:	3d 1f 03 00 00       	cmp    $0x31f,%eax
   34957:	77 4d                	ja     349a6 <put_key+0x69>
   34959:	8b 45 08             	mov    0x8(%ebp),%eax
   3495c:	8b 00                	mov    (%eax),%eax
   3495e:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
   34962:	89 10                	mov    %edx,(%eax)
   34964:	8b 45 08             	mov    0x8(%ebp),%eax
   34967:	8b 00                	mov    (%eax),%eax
   34969:	8d 50 04             	lea    0x4(%eax),%edx
   3496c:	8b 45 08             	mov    0x8(%ebp),%eax
   3496f:	89 10                	mov    %edx,(%eax)
   34971:	8b 45 08             	mov    0x8(%ebp),%eax
   34974:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   3497a:	8d 50 01             	lea    0x1(%eax),%edx
   3497d:	8b 45 08             	mov    0x8(%ebp),%eax
   34980:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
   34986:	8b 45 08             	mov    0x8(%ebp),%eax
   34989:	8b 00                	mov    (%eax),%eax
   3498b:	8b 55 08             	mov    0x8(%ebp),%edx
   3498e:	83 c2 08             	add    $0x8,%edx
   34991:	81 c2 80 0c 00 00    	add    $0xc80,%edx
   34997:	39 d0                	cmp    %edx,%eax
   34999:	75 0b                	jne    349a6 <put_key+0x69>
   3499b:	8b 45 08             	mov    0x8(%ebp),%eax
   3499e:	8d 50 08             	lea    0x8(%eax),%edx
   349a1:	8b 45 08             	mov    0x8(%ebp),%eax
   349a4:	89 10                	mov    %edx,(%eax)
   349a6:	90                   	nop
   349a7:	c9                   	leave  
   349a8:	c3                   	ret    

000349a9 <scroll_up>:
   349a9:	55                   	push   %ebp
   349aa:	89 e5                	mov    %esp,%ebp
   349ac:	83 ec 08             	sub    $0x8,%esp
   349af:	8b 45 08             	mov    0x8(%ebp),%eax
   349b2:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   349b8:	8b 50 08             	mov    0x8(%eax),%edx
   349bb:	8b 45 08             	mov    0x8(%ebp),%eax
   349be:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   349c4:	8b 00                	mov    (%eax),%eax
   349c6:	39 c2                	cmp    %eax,%edx
   349c8:	76 1d                	jbe    349e7 <scroll_up+0x3e>
   349ca:	8b 45 08             	mov    0x8(%ebp),%eax
   349cd:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   349d3:	8b 40 08             	mov    0x8(%eax),%eax
   349d6:	2d d0 07 00 00       	sub    $0x7d0,%eax
   349db:	83 ec 0c             	sub    $0xc,%esp
   349de:	50                   	push   %eax
   349df:	e8 fb fe ff ff       	call   348df <set_console_start_video_addr>
   349e4:	83 c4 10             	add    $0x10,%esp
   349e7:	90                   	nop
   349e8:	c9                   	leave  
   349e9:	c3                   	ret    

000349ea <scroll_down>:
   349ea:	55                   	push   %ebp
   349eb:	89 e5                	mov    %esp,%ebp
   349ed:	83 ec 08             	sub    $0x8,%esp
   349f0:	8b 45 08             	mov    0x8(%ebp),%eax
   349f3:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   349f9:	8b 40 08             	mov    0x8(%eax),%eax
   349fc:	8d 88 a0 0f 00 00    	lea    0xfa0(%eax),%ecx
   34a02:	8b 45 08             	mov    0x8(%ebp),%eax
   34a05:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34a0b:	8b 10                	mov    (%eax),%edx
   34a0d:	8b 45 08             	mov    0x8(%ebp),%eax
   34a10:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34a16:	8b 40 04             	mov    0x4(%eax),%eax
   34a19:	01 d0                	add    %edx,%eax
   34a1b:	39 c1                	cmp    %eax,%ecx
   34a1d:	73 3b                	jae    34a5a <scroll_down+0x70>
   34a1f:	8b 45 08             	mov    0x8(%ebp),%eax
   34a22:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34a28:	8b 40 08             	mov    0x8(%eax),%eax
   34a2b:	05 d0 07 00 00       	add    $0x7d0,%eax
   34a30:	83 ec 0c             	sub    $0xc,%esp
   34a33:	50                   	push   %eax
   34a34:	e8 a6 fe ff ff       	call   348df <set_console_start_video_addr>
   34a39:	83 c4 10             	add    $0x10,%esp
   34a3c:	8b 45 08             	mov    0x8(%ebp),%eax
   34a3f:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34a45:	8b 50 08             	mov    0x8(%eax),%edx
   34a48:	8b 45 08             	mov    0x8(%ebp),%eax
   34a4b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34a51:	81 c2 d0 07 00 00    	add    $0x7d0,%edx
   34a57:	89 50 08             	mov    %edx,0x8(%eax)
   34a5a:	90                   	nop
   34a5b:	c9                   	leave  
   34a5c:	c3                   	ret    

00034a5d <out_char>:
   34a5d:	55                   	push   %ebp
   34a5e:	89 e5                	mov    %esp,%ebp
   34a60:	83 ec 28             	sub    $0x28,%esp
   34a63:	8b 45 0c             	mov    0xc(%ebp),%eax
   34a66:	88 45 e4             	mov    %al,-0x1c(%ebp)
   34a69:	8b 45 08             	mov    0x8(%ebp),%eax
   34a6c:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34a72:	8b 40 0c             	mov    0xc(%eax),%eax
   34a75:	05 00 c0 05 00       	add    $0x5c000,%eax
   34a7a:	01 c0                	add    %eax,%eax
   34a7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
   34a7f:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
   34a83:	83 f8 08             	cmp    $0x8,%eax
   34a86:	0f 84 8d 00 00 00    	je     34b19 <out_char+0xbc>
   34a8c:	83 f8 0a             	cmp    $0xa,%eax
   34a8f:	0f 85 c9 00 00 00    	jne    34b5e <out_char+0x101>
   34a95:	8b 45 08             	mov    0x8(%ebp),%eax
   34a98:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34a9e:	8b 50 0c             	mov    0xc(%eax),%edx
   34aa1:	8b 45 08             	mov    0x8(%ebp),%eax
   34aa4:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34aaa:	8b 08                	mov    (%eax),%ecx
   34aac:	8b 45 08             	mov    0x8(%ebp),%eax
   34aaf:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34ab5:	8b 40 04             	mov    0x4(%eax),%eax
   34ab8:	01 c8                	add    %ecx,%eax
   34aba:	83 e8 50             	sub    $0x50,%eax
   34abd:	39 c2                	cmp    %eax,%edx
   34abf:	0f 83 f4 00 00 00    	jae    34bb9 <out_char+0x15c>
   34ac5:	8b 45 08             	mov    0x8(%ebp),%eax
   34ac8:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34ace:	8b 08                	mov    (%eax),%ecx
   34ad0:	8b 45 08             	mov    0x8(%ebp),%eax
   34ad3:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34ad9:	8b 50 0c             	mov    0xc(%eax),%edx
   34adc:	8b 45 08             	mov    0x8(%ebp),%eax
   34adf:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34ae5:	8b 00                	mov    (%eax),%eax
   34ae7:	29 c2                	sub    %eax,%edx
   34ae9:	89 d0                	mov    %edx,%eax
   34aeb:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
   34af0:	f7 e2                	mul    %edx
   34af2:	89 d0                	mov    %edx,%eax
   34af4:	c1 e8 06             	shr    $0x6,%eax
   34af7:	8d 50 01             	lea    0x1(%eax),%edx
   34afa:	89 d0                	mov    %edx,%eax
   34afc:	c1 e0 02             	shl    $0x2,%eax
   34aff:	01 d0                	add    %edx,%eax
   34b01:	c1 e0 04             	shl    $0x4,%eax
   34b04:	89 c2                	mov    %eax,%edx
   34b06:	8b 45 08             	mov    0x8(%ebp),%eax
   34b09:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34b0f:	01 ca                	add    %ecx,%edx
   34b11:	89 50 0c             	mov    %edx,0xc(%eax)
   34b14:	e9 a0 00 00 00       	jmp    34bb9 <out_char+0x15c>
   34b19:	8b 45 08             	mov    0x8(%ebp),%eax
   34b1c:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34b22:	8b 50 0c             	mov    0xc(%eax),%edx
   34b25:	8b 45 08             	mov    0x8(%ebp),%eax
   34b28:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34b2e:	8b 00                	mov    (%eax),%eax
   34b30:	39 c2                	cmp    %eax,%edx
   34b32:	0f 86 84 00 00 00    	jbe    34bbc <out_char+0x15f>
   34b38:	8b 45 08             	mov    0x8(%ebp),%eax
   34b3b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34b41:	8b 50 0c             	mov    0xc(%eax),%edx
   34b44:	83 ea 01             	sub    $0x1,%edx
   34b47:	89 50 0c             	mov    %edx,0xc(%eax)
   34b4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
   34b4d:	83 e8 02             	sub    $0x2,%eax
   34b50:	c6 00 20             	movb   $0x20,(%eax)
   34b53:	8b 45 f4             	mov    -0xc(%ebp),%eax
   34b56:	83 e8 01             	sub    $0x1,%eax
   34b59:	c6 00 00             	movb   $0x0,(%eax)
   34b5c:	eb 5e                	jmp    34bbc <out_char+0x15f>
   34b5e:	8b 45 08             	mov    0x8(%ebp),%eax
   34b61:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34b67:	8b 40 0c             	mov    0xc(%eax),%eax
   34b6a:	8d 48 01             	lea    0x1(%eax),%ecx
   34b6d:	8b 45 08             	mov    0x8(%ebp),%eax
   34b70:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34b76:	8b 10                	mov    (%eax),%edx
   34b78:	8b 45 08             	mov    0x8(%ebp),%eax
   34b7b:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34b81:	8b 40 04             	mov    0x4(%eax),%eax
   34b84:	01 d0                	add    %edx,%eax
   34b86:	39 c1                	cmp    %eax,%ecx
   34b88:	73 35                	jae    34bbf <out_char+0x162>
   34b8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
   34b8d:	8d 50 01             	lea    0x1(%eax),%edx
   34b90:	89 55 f4             	mov    %edx,-0xc(%ebp)
   34b93:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
   34b97:	88 10                	mov    %dl,(%eax)
   34b99:	8b 45 f4             	mov    -0xc(%ebp),%eax
   34b9c:	8d 50 01             	lea    0x1(%eax),%edx
   34b9f:	89 55 f4             	mov    %edx,-0xc(%ebp)
   34ba2:	c6 00 0a             	movb   $0xa,(%eax)
   34ba5:	8b 45 08             	mov    0x8(%ebp),%eax
   34ba8:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34bae:	8b 50 0c             	mov    0xc(%eax),%edx
   34bb1:	83 c2 01             	add    $0x1,%edx
   34bb4:	89 50 0c             	mov    %edx,0xc(%eax)
   34bb7:	eb 06                	jmp    34bbf <out_char+0x162>
   34bb9:	90                   	nop
   34bba:	eb 14                	jmp    34bd0 <out_char+0x173>
   34bbc:	90                   	nop
   34bbd:	eb 11                	jmp    34bd0 <out_char+0x173>
   34bbf:	90                   	nop
   34bc0:	eb 0e                	jmp    34bd0 <out_char+0x173>
   34bc2:	83 ec 0c             	sub    $0xc,%esp
   34bc5:	ff 75 08             	pushl  0x8(%ebp)
   34bc8:	e8 1d fe ff ff       	call   349ea <scroll_down>
   34bcd:	83 c4 10             	add    $0x10,%esp
   34bd0:	8b 45 08             	mov    0x8(%ebp),%eax
   34bd3:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34bd9:	8b 50 0c             	mov    0xc(%eax),%edx
   34bdc:	8b 45 08             	mov    0x8(%ebp),%eax
   34bdf:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   34be5:	8b 40 08             	mov    0x8(%eax),%eax
   34be8:	29 c2                	sub    %eax,%edx
   34bea:	89 d0                	mov    %edx,%eax
   34bec:	3d d0 07 00 00       	cmp    $0x7d0,%eax
   34bf1:	77 cf                	ja     34bc2 <out_char+0x165>
   34bf3:	83 ec 0c             	sub    $0xc,%esp
   34bf6:	ff 75 08             	pushl  0x8(%ebp)
   34bf9:	e8 4a fc ff ff       	call   34848 <flush>
   34bfe:	83 c4 10             	add    $0x10,%esp
   34c01:	90                   	nop
   34c02:	c9                   	leave  
   34c03:	c3                   	ret    

00034c04 <tty_dev_read>:
   34c04:	55                   	push   %ebp
   34c05:	89 e5                	mov    %esp,%ebp
   34c07:	83 ec 08             	sub    $0x8,%esp
   34c0a:	a1 80 8e 03 00       	mov    0x38e80,%eax
   34c0f:	39 45 08             	cmp    %eax,0x8(%ebp)
   34c12:	75 17                	jne    34c2b <tty_dev_read+0x27>
   34c14:	a1 c8 92 03 00       	mov    0x392c8,%eax
   34c19:	85 c0                	test   %eax,%eax
   34c1b:	7e 0e                	jle    34c2b <tty_dev_read+0x27>
   34c1d:	83 ec 0c             	sub    $0xc,%esp
   34c20:	ff 75 08             	pushl  0x8(%ebp)
   34c23:	e8 66 06 00 00       	call   3528e <keyboard_read>
   34c28:	83 c4 10             	add    $0x10,%esp
   34c2b:	90                   	nop
   34c2c:	c9                   	leave  
   34c2d:	c3                   	ret    

00034c2e <tty_dev_write>:
   34c2e:	55                   	push   %ebp
   34c2f:	89 e5                	mov    %esp,%ebp
   34c31:	83 ec 78             	sub    $0x78,%esp
   34c34:	8b 45 08             	mov    0x8(%ebp),%eax
   34c37:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   34c3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
   34c40:	e9 9b 01 00 00       	jmp    34de0 <tty_dev_write+0x1b2>
   34c45:	8b 45 08             	mov    0x8(%ebp),%eax
   34c48:	8b 40 04             	mov    0x4(%eax),%eax
   34c4b:	8b 00                	mov    (%eax),%eax
   34c4d:	88 45 f3             	mov    %al,-0xd(%ebp)
   34c50:	8b 45 08             	mov    0x8(%ebp),%eax
   34c53:	8b 40 04             	mov    0x4(%eax),%eax
   34c56:	8d 50 04             	lea    0x4(%eax),%edx
   34c59:	8b 45 08             	mov    0x8(%ebp),%eax
   34c5c:	89 50 04             	mov    %edx,0x4(%eax)
   34c5f:	8b 45 08             	mov    0x8(%ebp),%eax
   34c62:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   34c68:	8d 50 ff             	lea    -0x1(%eax),%edx
   34c6b:	8b 45 08             	mov    0x8(%ebp),%eax
   34c6e:	89 90 88 0c 00 00    	mov    %edx,0xc88(%eax)
   34c74:	8b 45 08             	mov    0x8(%ebp),%eax
   34c77:	8b 40 04             	mov    0x4(%eax),%eax
   34c7a:	8b 55 08             	mov    0x8(%ebp),%edx
   34c7d:	83 c2 08             	add    $0x8,%edx
   34c80:	81 c2 80 0c 00 00    	add    $0xc80,%edx
   34c86:	39 d0                	cmp    %edx,%eax
   34c88:	75 0c                	jne    34c96 <tty_dev_write+0x68>
   34c8a:	8b 45 08             	mov    0x8(%ebp),%eax
   34c8d:	8d 50 08             	lea    0x8(%eax),%edx
   34c90:	8b 45 08             	mov    0x8(%ebp),%eax
   34c93:	89 50 04             	mov    %edx,0x4(%eax)
   34c96:	8b 45 08             	mov    0x8(%ebp),%eax
   34c99:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   34c9f:	85 c0                	test   %eax,%eax
   34ca1:	0f 84 39 01 00 00    	je     34de0 <tty_dev_write+0x1b2>
   34ca7:	80 7d f3 20          	cmpb   $0x20,-0xd(%ebp)
   34cab:	76 71                	jbe    34d1e <tty_dev_write+0xf0>
   34cad:	80 7d f3 7e          	cmpb   $0x7e,-0xd(%ebp)
   34cb1:	77 6b                	ja     34d1e <tty_dev_write+0xf0>
   34cb3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
   34cb7:	89 c1                	mov    %eax,%ecx
   34cb9:	8b 45 08             	mov    0x8(%ebp),%eax
   34cbc:	8b 90 94 0c 00 00    	mov    0xc94(%eax),%edx
   34cc2:	8b 45 08             	mov    0x8(%ebp),%eax
   34cc5:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
   34ccb:	01 d0                	add    %edx,%eax
   34ccd:	83 ec 04             	sub    $0x4,%esp
   34cd0:	6a 01                	push   $0x1
   34cd2:	51                   	push   %ecx
   34cd3:	50                   	push   %eax
   34cd4:	e8 ae 11 00 00       	call   35e87 <Memcpy>
   34cd9:	83 c4 10             	add    $0x10,%esp
   34cdc:	8b 45 08             	mov    0x8(%ebp),%eax
   34cdf:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   34ce5:	8d 50 ff             	lea    -0x1(%eax),%edx
   34ce8:	8b 45 08             	mov    0x8(%ebp),%eax
   34ceb:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
   34cf1:	8b 45 08             	mov    0x8(%ebp),%eax
   34cf4:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
   34cfa:	8d 50 01             	lea    0x1(%eax),%edx
   34cfd:	8b 45 08             	mov    0x8(%ebp),%eax
   34d00:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
   34d06:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
   34d0a:	83 ec 08             	sub    $0x8,%esp
   34d0d:	50                   	push   %eax
   34d0e:	ff 75 08             	pushl  0x8(%ebp)
   34d11:	e8 47 fd ff ff       	call   34a5d <out_char>
   34d16:	83 c4 10             	add    $0x10,%esp
   34d19:	e9 c2 00 00 00       	jmp    34de0 <tty_dev_write+0x1b2>
   34d1e:	80 7d f3 08          	cmpb   $0x8,-0xd(%ebp)
   34d22:	75 3f                	jne    34d63 <tty_dev_write+0x135>
   34d24:	8b 45 08             	mov    0x8(%ebp),%eax
   34d27:	8b 80 8c 0c 00 00    	mov    0xc8c(%eax),%eax
   34d2d:	8d 50 01             	lea    0x1(%eax),%edx
   34d30:	8b 45 08             	mov    0x8(%ebp),%eax
   34d33:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
   34d39:	8b 45 08             	mov    0x8(%ebp),%eax
   34d3c:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
   34d42:	8d 50 ff             	lea    -0x1(%eax),%edx
   34d45:	8b 45 08             	mov    0x8(%ebp),%eax
   34d48:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
   34d4e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
   34d52:	83 ec 08             	sub    $0x8,%esp
   34d55:	50                   	push   %eax
   34d56:	ff 75 08             	pushl  0x8(%ebp)
   34d59:	e8 ff fc ff ff       	call   34a5d <out_char>
   34d5e:	83 c4 10             	add    $0x10,%esp
   34d61:	eb 7d                	jmp    34de0 <tty_dev_write+0x1b2>
   34d63:	80 7d f3 0a          	cmpb   $0xa,-0xd(%ebp)
   34d67:	74 10                	je     34d79 <tty_dev_write+0x14b>
   34d69:	8b 45 08             	mov    0x8(%ebp),%eax
   34d6c:	8b 90 90 0c 00 00    	mov    0xc90(%eax),%edx
   34d72:	8b 45 f4             	mov    -0xc(%ebp),%eax
   34d75:	39 c2                	cmp    %eax,%edx
   34d77:	75 67                	jne    34de0 <tty_dev_write+0x1b2>
   34d79:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
   34d7d:	83 ec 08             	sub    $0x8,%esp
   34d80:	50                   	push   %eax
   34d81:	ff 75 08             	pushl  0x8(%ebp)
   34d84:	e8 d4 fc ff ff       	call   34a5d <out_char>
   34d89:	83 c4 10             	add    $0x10,%esp
   34d8c:	8b 45 08             	mov    0x8(%ebp),%eax
   34d8f:	c7 80 8c 0c 00 00 00 	movl   $0x0,0xc8c(%eax)
   34d96:	00 00 00 
   34d99:	8b 45 08             	mov    0x8(%ebp),%eax
   34d9c:	c7 80 90 0c 00 00 00 	movl   $0x0,0xc90(%eax)
   34da3:	00 00 00 
   34da6:	c7 45 8c 01 00 00 00 	movl   $0x1,-0x74(%ebp)
   34dad:	8b 45 08             	mov    0x8(%ebp),%eax
   34db0:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
   34db6:	89 45 d8             	mov    %eax,-0x28(%ebp)
   34db9:	8b 45 08             	mov    0x8(%ebp),%eax
   34dbc:	8b 80 9c 0c 00 00    	mov    0xc9c(%eax),%eax
   34dc2:	89 45 e0             	mov    %eax,-0x20(%ebp)
   34dc5:	8b 45 08             	mov    0x8(%ebp),%eax
   34dc8:	8b 80 98 0c 00 00    	mov    0xc98(%eax),%eax
   34dce:	83 ec 04             	sub    $0x4,%esp
   34dd1:	50                   	push   %eax
   34dd2:	8d 45 88             	lea    -0x78(%ebp),%eax
   34dd5:	50                   	push   %eax
   34dd6:	6a 01                	push   $0x1
   34dd8:	e8 d6 cf ff ff       	call   31db3 <send_rec>
   34ddd:	83 c4 10             	add    $0x10,%esp
   34de0:	8b 45 08             	mov    0x8(%ebp),%eax
   34de3:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   34de9:	85 c0                	test   %eax,%eax
   34deb:	0f 85 54 fe ff ff    	jne    34c45 <tty_dev_write+0x17>
   34df1:	90                   	nop
   34df2:	c9                   	leave  
   34df3:	c3                   	ret    

00034df4 <tty_do_read>:
   34df4:	55                   	push   %ebp
   34df5:	89 e5                	mov    %esp,%ebp
   34df7:	83 ec 08             	sub    $0x8,%esp
   34dfa:	8b 45 08             	mov    0x8(%ebp),%eax
   34dfd:	c7 80 90 0c 00 00 00 	movl   $0x0,0xc90(%eax)
   34e04:	00 00 00 
   34e07:	8b 45 0c             	mov    0xc(%ebp),%eax
   34e0a:	8b 50 58             	mov    0x58(%eax),%edx
   34e0d:	8b 45 08             	mov    0x8(%ebp),%eax
   34e10:	89 90 9c 0c 00 00    	mov    %edx,0xc9c(%eax)
   34e16:	8b 45 0c             	mov    0xc(%ebp),%eax
   34e19:	8b 00                	mov    (%eax),%eax
   34e1b:	89 c2                	mov    %eax,%edx
   34e1d:	8b 45 08             	mov    0x8(%ebp),%eax
   34e20:	89 90 98 0c 00 00    	mov    %edx,0xc98(%eax)
   34e26:	8b 45 0c             	mov    0xc(%ebp),%eax
   34e29:	8b 50 1c             	mov    0x1c(%eax),%edx
   34e2c:	8b 45 08             	mov    0x8(%ebp),%eax
   34e2f:	89 90 8c 0c 00 00    	mov    %edx,0xc8c(%eax)
   34e35:	8b 45 0c             	mov    0xc(%ebp),%eax
   34e38:	8b 40 10             	mov    0x10(%eax),%eax
   34e3b:	89 c2                	mov    %eax,%edx
   34e3d:	8b 45 08             	mov    0x8(%ebp),%eax
   34e40:	8b 80 9c 0c 00 00    	mov    0xc9c(%eax),%eax
   34e46:	83 ec 08             	sub    $0x8,%esp
   34e49:	52                   	push   %edx
   34e4a:	50                   	push   %eax
   34e4b:	e8 26 f7 ff ff       	call   34576 <v2l>
   34e50:	83 c4 10             	add    $0x10,%esp
   34e53:	89 c2                	mov    %eax,%edx
   34e55:	8b 45 08             	mov    0x8(%ebp),%eax
   34e58:	89 90 94 0c 00 00    	mov    %edx,0xc94(%eax)
   34e5e:	8b 45 0c             	mov    0xc(%ebp),%eax
   34e61:	c7 40 04 02 00 00 00 	movl   $0x2,0x4(%eax)
   34e68:	8b 45 08             	mov    0x8(%ebp),%eax
   34e6b:	8b 80 98 0c 00 00    	mov    0xc98(%eax),%eax
   34e71:	83 ec 04             	sub    $0x4,%esp
   34e74:	50                   	push   %eax
   34e75:	ff 75 0c             	pushl  0xc(%ebp)
   34e78:	6a 01                	push   $0x1
   34e7a:	e8 34 cf ff ff       	call   31db3 <send_rec>
   34e7f:	83 c4 10             	add    $0x10,%esp
   34e82:	90                   	nop
   34e83:	c9                   	leave  
   34e84:	c3                   	ret    

00034e85 <tty_do_write>:
   34e85:	55                   	push   %ebp
   34e86:	89 e5                	mov    %esp,%ebp
   34e88:	53                   	push   %ebx
   34e89:	81 ec 84 00 00 00    	sub    $0x84,%esp
   34e8f:	89 e0                	mov    %esp,%eax
   34e91:	89 c3                	mov    %eax,%ebx
   34e93:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
   34e9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
   34e9d:	8d 50 ff             	lea    -0x1(%eax),%edx
   34ea0:	89 55 e4             	mov    %edx,-0x1c(%ebp)
   34ea3:	89 c2                	mov    %eax,%edx
   34ea5:	b8 10 00 00 00       	mov    $0x10,%eax
   34eaa:	83 e8 01             	sub    $0x1,%eax
   34ead:	01 d0                	add    %edx,%eax
   34eaf:	b9 10 00 00 00       	mov    $0x10,%ecx
   34eb4:	ba 00 00 00 00       	mov    $0x0,%edx
   34eb9:	f7 f1                	div    %ecx
   34ebb:	6b c0 10             	imul   $0x10,%eax,%eax
   34ebe:	29 c4                	sub    %eax,%esp
   34ec0:	89 e0                	mov    %esp,%eax
   34ec2:	83 c0 00             	add    $0x0,%eax
   34ec5:	89 45 e0             	mov    %eax,-0x20(%ebp)
   34ec8:	8b 45 0c             	mov    0xc(%ebp),%eax
   34ecb:	8b 40 50             	mov    0x50(%eax),%eax
   34ece:	89 45 ec             	mov    %eax,-0x14(%ebp)
   34ed1:	e9 9b 00 00 00       	jmp    34f71 <tty_do_write+0xec>
   34ed6:	8b 45 e8             	mov    -0x18(%ebp),%eax
   34ed9:	39 45 ec             	cmp    %eax,-0x14(%ebp)
   34edc:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
   34ee0:	89 45 f0             	mov    %eax,-0x10(%ebp)
   34ee3:	8b 45 0c             	mov    0xc(%ebp),%eax
   34ee6:	8b 40 10             	mov    0x10(%eax),%eax
   34ee9:	89 c2                	mov    %eax,%edx
   34eeb:	8b 45 0c             	mov    0xc(%ebp),%eax
   34eee:	8b 40 58             	mov    0x58(%eax),%eax
   34ef1:	83 ec 08             	sub    $0x8,%esp
   34ef4:	52                   	push   %edx
   34ef5:	50                   	push   %eax
   34ef6:	e8 7b f6 ff ff       	call   34576 <v2l>
   34efb:	83 c4 10             	add    $0x10,%esp
   34efe:	89 c2                	mov    %eax,%edx
   34f00:	8b 45 08             	mov    0x8(%ebp),%eax
   34f03:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
   34f09:	01 d0                	add    %edx,%eax
   34f0b:	89 c2                	mov    %eax,%edx
   34f0d:	8b 45 e0             	mov    -0x20(%ebp),%eax
   34f10:	83 ec 04             	sub    $0x4,%esp
   34f13:	ff 75 f0             	pushl  -0x10(%ebp)
   34f16:	52                   	push   %edx
   34f17:	50                   	push   %eax
   34f18:	e8 6a 0f 00 00       	call   35e87 <Memcpy>
   34f1d:	83 c4 10             	add    $0x10,%esp
   34f20:	8b 45 f0             	mov    -0x10(%ebp),%eax
   34f23:	29 45 ec             	sub    %eax,-0x14(%ebp)
   34f26:	8b 45 08             	mov    0x8(%ebp),%eax
   34f29:	8b 90 90 0c 00 00    	mov    0xc90(%eax),%edx
   34f2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
   34f32:	01 c2                	add    %eax,%edx
   34f34:	8b 45 08             	mov    0x8(%ebp),%eax
   34f37:	89 90 90 0c 00 00    	mov    %edx,0xc90(%eax)
   34f3d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   34f44:	eb 25                	jmp    34f6b <tty_do_write+0xe6>
   34f46:	8b 55 e0             	mov    -0x20(%ebp),%edx
   34f49:	8b 45 f4             	mov    -0xc(%ebp),%eax
   34f4c:	01 d0                	add    %edx,%eax
   34f4e:	0f b6 00             	movzbl (%eax),%eax
   34f51:	0f b6 c0             	movzbl %al,%eax
   34f54:	83 ec 08             	sub    $0x8,%esp
   34f57:	50                   	push   %eax
   34f58:	ff 75 08             	pushl  0x8(%ebp)
   34f5b:	e8 fd fa ff ff       	call   34a5d <out_char>
   34f60:	83 c4 10             	add    $0x10,%esp
   34f63:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   34f67:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
   34f6b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   34f6f:	75 d5                	jne    34f46 <tty_do_write+0xc1>
   34f71:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   34f75:	0f 85 5b ff ff ff    	jne    34ed6 <tty_do_write+0x51>
   34f7b:	c7 85 7c ff ff ff 65 	movl   $0x65,-0x84(%ebp)
   34f82:	00 00 00 
   34f85:	8b 45 08             	mov    0x8(%ebp),%eax
   34f88:	8b 80 90 0c 00 00    	mov    0xc90(%eax),%eax
   34f8e:	89 45 c0             	mov    %eax,-0x40(%ebp)
   34f91:	8b 45 0c             	mov    0xc(%ebp),%eax
   34f94:	8b 00                	mov    (%eax),%eax
   34f96:	83 ec 04             	sub    $0x4,%esp
   34f99:	50                   	push   %eax
   34f9a:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
   34fa0:	50                   	push   %eax
   34fa1:	6a 01                	push   $0x1
   34fa3:	e8 0b ce ff ff       	call   31db3 <send_rec>
   34fa8:	83 c4 10             	add    $0x10,%esp
   34fab:	89 dc                	mov    %ebx,%esp
   34fad:	90                   	nop
   34fae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
   34fb1:	c9                   	leave  
   34fb2:	c3                   	ret    

00034fb3 <init_screen>:
   34fb3:	55                   	push   %ebp
   34fb4:	89 e5                	mov    %esp,%ebp
   34fb6:	83 ec 10             	sub    $0x10,%esp
   34fb9:	8b 45 08             	mov    0x8(%ebp),%eax
   34fbc:	2d 00 96 03 00       	sub    $0x39600,%eax
   34fc1:	c1 f8 02             	sar    $0x2,%eax
   34fc4:	69 c0 19 49 71 0a    	imul   $0xa714919,%eax,%eax
   34fca:	89 45 fc             	mov    %eax,-0x4(%ebp)
   34fcd:	8b 45 fc             	mov    -0x4(%ebp),%eax
   34fd0:	c1 e0 04             	shl    $0x4,%eax
   34fd3:	8d 90 a0 c4 03 00    	lea    0x3c4a0(%eax),%edx
   34fd9:	8b 45 08             	mov    0x8(%ebp),%eax
   34fdc:	89 90 a0 0c 00 00    	mov    %edx,0xca0(%eax)
   34fe2:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
   34fe9:	8b 45 08             	mov    0x8(%ebp),%eax
   34fec:	8b 88 a0 0c 00 00    	mov    0xca0(%eax),%ecx
   34ff2:	8b 45 f8             	mov    -0x8(%ebp),%eax
   34ff5:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
   34ffa:	f7 e2                	mul    %edx
   34ffc:	89 d0                	mov    %edx,%eax
   34ffe:	d1 e8                	shr    %eax
   35000:	89 41 04             	mov    %eax,0x4(%ecx)
   35003:	8b 45 08             	mov    0x8(%ebp),%eax
   35006:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   3500c:	8b 50 04             	mov    0x4(%eax),%edx
   3500f:	8b 45 08             	mov    0x8(%ebp),%eax
   35012:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   35018:	0f af 55 fc          	imul   -0x4(%ebp),%edx
   3501c:	89 10                	mov    %edx,(%eax)
   3501e:	8b 45 08             	mov    0x8(%ebp),%eax
   35021:	8b 90 a0 0c 00 00    	mov    0xca0(%eax),%edx
   35027:	8b 45 08             	mov    0x8(%ebp),%eax
   3502a:	8b 80 a0 0c 00 00    	mov    0xca0(%eax),%eax
   35030:	8b 12                	mov    (%edx),%edx
   35032:	89 50 08             	mov    %edx,0x8(%eax)
   35035:	8b 55 08             	mov    0x8(%ebp),%edx
   35038:	8b 92 a0 0c 00 00    	mov    0xca0(%edx),%edx
   3503e:	8b 40 08             	mov    0x8(%eax),%eax
   35041:	89 42 0c             	mov    %eax,0xc(%edx)
   35044:	90                   	nop
   35045:	c9                   	leave  
   35046:	c3                   	ret    

00035047 <init_tty>:
   35047:	55                   	push   %ebp
   35048:	89 e5                	mov    %esp,%ebp
   3504a:	83 ec 18             	sub    $0x18,%esp
   3504d:	c7 45 f4 00 96 03 00 	movl   $0x39600,-0xc(%ebp)
   35054:	eb 7a                	jmp    350d0 <init_tty+0x89>
   35056:	8b 45 f4             	mov    -0xc(%ebp),%eax
   35059:	8d 50 08             	lea    0x8(%eax),%edx
   3505c:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3505f:	89 50 04             	mov    %edx,0x4(%eax)
   35062:	8b 45 f4             	mov    -0xc(%ebp),%eax
   35065:	8b 50 04             	mov    0x4(%eax),%edx
   35068:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3506b:	89 10                	mov    %edx,(%eax)
   3506d:	8b 45 f4             	mov    -0xc(%ebp),%eax
   35070:	c7 80 88 0c 00 00 00 	movl   $0x0,0xc88(%eax)
   35077:	00 00 00 
   3507a:	ff 75 f4             	pushl  -0xc(%ebp)
   3507d:	e8 31 ff ff ff       	call   34fb3 <init_screen>
   35082:	83 c4 04             	add    $0x4,%esp
   35085:	8b 45 f4             	mov    -0xc(%ebp),%eax
   35088:	2d 00 96 03 00       	sub    $0x39600,%eax
   3508d:	85 c0                	test   %eax,%eax
   3508f:	7e 38                	jle    350c9 <init_tty+0x82>
   35091:	83 ec 08             	sub    $0x8,%esp
   35094:	6a 23                	push   $0x23
   35096:	ff 75 f4             	pushl  -0xc(%ebp)
   35099:	e8 bf f9 ff ff       	call   34a5d <out_char>
   3509e:	83 c4 10             	add    $0x10,%esp
   350a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
   350a4:	05 64 6b 02 00       	add    $0x26b64,%eax
   350a9:	2d 00 96 03 00       	sub    $0x39600,%eax
   350ae:	c1 f8 02             	sar    $0x2,%eax
   350b1:	69 c0 19 49 71 0a    	imul   $0xa714919,%eax,%eax
   350b7:	0f b6 c0             	movzbl %al,%eax
   350ba:	83 ec 08             	sub    $0x8,%esp
   350bd:	50                   	push   %eax
   350be:	ff 75 f4             	pushl  -0xc(%ebp)
   350c1:	e8 97 f9 ff ff       	call   34a5d <out_char>
   350c6:	83 c4 10             	add    $0x10,%esp
   350c9:	81 45 f4 a4 0c 00 00 	addl   $0xca4,-0xc(%ebp)
   350d0:	b8 ec bb 03 00       	mov    $0x3bbec,%eax
   350d5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
   350d8:	0f 82 78 ff ff ff    	jb     35056 <init_tty+0xf>
   350de:	90                   	nop
   350df:	c9                   	leave  
   350e0:	c3                   	ret    

000350e1 <TaskTTY>:
   350e1:	55                   	push   %ebp
   350e2:	89 e5                	mov    %esp,%ebp
   350e4:	83 ec 78             	sub    $0x78,%esp
   350e7:	e8 5b ff ff ff       	call   35047 <init_tty>
   350ec:	83 ec 0c             	sub    $0xc,%esp
   350ef:	6a 00                	push   $0x0
   350f1:	e8 16 f7 ff ff       	call   3480c <select_console>
   350f6:	83 c4 10             	add    $0x10,%esp
   350f9:	c7 45 f4 00 96 03 00 	movl   $0x39600,-0xc(%ebp)
   35100:	eb 30                	jmp    35132 <TaskTTY+0x51>
   35102:	83 ec 0c             	sub    $0xc,%esp
   35105:	ff 75 f4             	pushl  -0xc(%ebp)
   35108:	e8 f7 fa ff ff       	call   34c04 <tty_dev_read>
   3510d:	83 c4 10             	add    $0x10,%esp
   35110:	83 ec 0c             	sub    $0xc,%esp
   35113:	ff 75 f4             	pushl  -0xc(%ebp)
   35116:	e8 13 fb ff ff       	call   34c2e <tty_dev_write>
   3511b:	83 c4 10             	add    $0x10,%esp
   3511e:	8b 45 f4             	mov    -0xc(%ebp),%eax
   35121:	8b 80 88 0c 00 00    	mov    0xc88(%eax),%eax
   35127:	85 c0                	test   %eax,%eax
   35129:	75 d7                	jne    35102 <TaskTTY+0x21>
   3512b:	81 45 f4 a4 0c 00 00 	addl   $0xca4,-0xc(%ebp)
   35132:	b8 ec bb 03 00       	mov    $0x3bbec,%eax
   35137:	39 45 f4             	cmp    %eax,-0xc(%ebp)
   3513a:	72 c6                	jb     35102 <TaskTTY+0x21>
   3513c:	83 ec 04             	sub    $0x4,%esp
   3513f:	6a 11                	push   $0x11
   35141:	8d 45 88             	lea    -0x78(%ebp),%eax
   35144:	50                   	push   %eax
   35145:	6a 02                	push   $0x2
   35147:	e8 67 cc ff ff       	call   31db3 <send_rec>
   3514c:	83 c4 10             	add    $0x10,%esp
   3514f:	8b 45 8c             	mov    -0x74(%ebp),%eax
   35152:	89 45 f0             	mov    %eax,-0x10(%ebp)
   35155:	81 7d f0 d2 07 00 00 	cmpl   $0x7d2,-0x10(%ebp)
   3515c:	74 14                	je     35172 <TaskTTY+0x91>
   3515e:	81 7d f0 d3 07 00 00 	cmpl   $0x7d3,-0x10(%ebp)
   35165:	74 22                	je     35189 <TaskTTY+0xa8>
   35167:	81 7d f0 d1 07 00 00 	cmpl   $0x7d1,-0x10(%ebp)
   3516e:	75 30                	jne    351a0 <TaskTTY+0xbf>
   35170:	eb 3f                	jmp    351b1 <TaskTTY+0xd0>
   35172:	a1 80 8e 03 00       	mov    0x38e80,%eax
   35177:	83 ec 08             	sub    $0x8,%esp
   3517a:	8d 55 88             	lea    -0x78(%ebp),%edx
   3517d:	52                   	push   %edx
   3517e:	50                   	push   %eax
   3517f:	e8 70 fc ff ff       	call   34df4 <tty_do_read>
   35184:	83 c4 10             	add    $0x10,%esp
   35187:	eb 28                	jmp    351b1 <TaskTTY+0xd0>
   35189:	a1 80 8e 03 00       	mov    0x38e80,%eax
   3518e:	83 ec 08             	sub    $0x8,%esp
   35191:	8d 55 88             	lea    -0x78(%ebp),%edx
   35194:	52                   	push   %edx
   35195:	50                   	push   %eax
   35196:	e8 ea fc ff ff       	call   34e85 <tty_do_write>
   3519b:	83 c4 10             	add    $0x10,%esp
   3519e:	eb 11                	jmp    351b1 <TaskTTY+0xd0>
   351a0:	83 ec 0c             	sub    $0xc,%esp
   351a3:	68 2b 5e 03 00       	push   $0x35e2b
   351a8:	e8 91 c4 ff ff       	call   3163e <panic>
   351ad:	83 c4 10             	add    $0x10,%esp
   351b0:	90                   	nop
   351b1:	e9 43 ff ff ff       	jmp    350f9 <TaskTTY+0x18>

000351b6 <keyboard_handler>:
   351b6:	55                   	push   %ebp
   351b7:	89 e5                	mov    %esp,%ebp
   351b9:	83 ec 18             	sub    $0x18,%esp
   351bc:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
   351c3:	a1 c8 92 03 00       	mov    0x392c8,%eax
   351c8:	3d 1f 03 00 00       	cmp    $0x31f,%eax
   351cd:	7f 5c                	jg     3522b <keyboard_handler+0x75>
   351cf:	e8 2e b5 ff ff       	call   30702 <disable_int>
   351d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
   351d7:	0f b7 c0             	movzwl %ax,%eax
   351da:	83 ec 0c             	sub    $0xc,%esp
   351dd:	50                   	push   %eax
   351de:	e8 ef b4 ff ff       	call   306d2 <in_byte>
   351e3:	83 c4 10             	add    $0x10,%esp
   351e6:	88 45 f3             	mov    %al,-0xd(%ebp)
   351e9:	a1 c0 92 03 00       	mov    0x392c0,%eax
   351ee:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
   351f2:	88 10                	mov    %dl,(%eax)
   351f4:	a1 c0 92 03 00       	mov    0x392c0,%eax
   351f9:	83 c0 01             	add    $0x1,%eax
   351fc:	a3 c0 92 03 00       	mov    %eax,0x392c0
   35201:	a1 c8 92 03 00       	mov    0x392c8,%eax
   35206:	83 c0 01             	add    $0x1,%eax
   35209:	a3 c8 92 03 00       	mov    %eax,0x392c8
   3520e:	a1 c0 92 03 00       	mov    0x392c0,%eax
   35213:	ba ec 95 03 00       	mov    $0x395ec,%edx
   35218:	39 d0                	cmp    %edx,%eax
   3521a:	72 0a                	jb     35226 <keyboard_handler+0x70>
   3521c:	c7 05 c0 92 03 00 cc 	movl   $0x392cc,0x392c0
   35223:	92 03 00 
   35226:	e8 d9 b4 ff ff       	call   30704 <enable_int>
   3522b:	90                   	nop
   3522c:	c9                   	leave  
   3522d:	c3                   	ret    

0003522e <read_from_keyboard_buf>:
   3522e:	55                   	push   %ebp
   3522f:	89 e5                	mov    %esp,%ebp
   35231:	83 ec 18             	sub    $0x18,%esp
   35234:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
   35238:	a1 c8 92 03 00       	mov    0x392c8,%eax
   3523d:	85 c0                	test   %eax,%eax
   3523f:	7e 47                	jle    35288 <read_from_keyboard_buf+0x5a>
   35241:	e8 bc b4 ff ff       	call   30702 <disable_int>
   35246:	a1 c4 92 03 00       	mov    0x392c4,%eax
   3524b:	0f b6 00             	movzbl (%eax),%eax
   3524e:	88 45 f7             	mov    %al,-0x9(%ebp)
   35251:	a1 c4 92 03 00       	mov    0x392c4,%eax
   35256:	83 c0 01             	add    $0x1,%eax
   35259:	a3 c4 92 03 00       	mov    %eax,0x392c4
   3525e:	a1 c8 92 03 00       	mov    0x392c8,%eax
   35263:	83 e8 01             	sub    $0x1,%eax
   35266:	a3 c8 92 03 00       	mov    %eax,0x392c8
   3526b:	a1 c4 92 03 00       	mov    0x392c4,%eax
   35270:	ba ec 95 03 00       	mov    $0x395ec,%edx
   35275:	39 d0                	cmp    %edx,%eax
   35277:	72 0a                	jb     35283 <read_from_keyboard_buf+0x55>
   35279:	c7 05 c4 92 03 00 cc 	movl   $0x392cc,0x392c4
   35280:	92 03 00 
   35283:	e8 7c b4 ff ff       	call   30704 <enable_int>
   35288:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   3528c:	c9                   	leave  
   3528d:	c3                   	ret    

0003528e <keyboard_read>:
   3528e:	55                   	push   %ebp
   3528f:	89 e5                	mov    %esp,%ebp
   35291:	83 ec 28             	sub    $0x28,%esp
   35294:	90                   	nop
   35295:	a1 c8 92 03 00       	mov    0x392c8,%eax
   3529a:	85 c0                	test   %eax,%eax
   3529c:	7e f7                	jle    35295 <keyboard_read+0x7>
   3529e:	e8 8b ff ff ff       	call   3522e <read_from_keyboard_buf>
   352a3:	88 45 ea             	mov    %al,-0x16(%ebp)
   352a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   352ad:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
   352b1:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
   352b5:	75 5a                	jne    35311 <keyboard_read+0x83>
   352b7:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
   352bb:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
   352bf:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
   352c3:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
   352c7:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
   352cb:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
   352cf:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
   352d3:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
   352da:	eb 20                	jmp    352fc <keyboard_read+0x6e>
   352dc:	e8 4d ff ff ff       	call   3522e <read_from_keyboard_buf>
   352e1:	89 c1                	mov    %eax,%ecx
   352e3:	8d 55 e3             	lea    -0x1d(%ebp),%edx
   352e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
   352e9:	01 d0                	add    %edx,%eax
   352eb:	0f b6 00             	movzbl (%eax),%eax
   352ee:	38 c1                	cmp    %al,%cl
   352f0:	74 06                	je     352f8 <keyboard_read+0x6a>
   352f2:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
   352f6:	eb 0a                	jmp    35302 <keyboard_read+0x74>
   352f8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   352fc:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
   35300:	7e da                	jle    352dc <keyboard_read+0x4e>
   35302:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
   35306:	74 68                	je     35370 <keyboard_read+0xe2>
   35308:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
   3530f:	eb 5f                	jmp    35370 <keyboard_read+0xe2>
   35311:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
   35315:	75 59                	jne    35370 <keyboard_read+0xe2>
   35317:	e8 12 ff ff ff       	call   3522e <read_from_keyboard_buf>
   3531c:	3c 2a                	cmp    $0x2a,%al
   3531e:	75 1d                	jne    3533d <keyboard_read+0xaf>
   35320:	e8 09 ff ff ff       	call   3522e <read_from_keyboard_buf>
   35325:	3c e0                	cmp    $0xe0,%al
   35327:	75 14                	jne    3533d <keyboard_read+0xaf>
   35329:	e8 00 ff ff ff       	call   3522e <read_from_keyboard_buf>
   3532e:	3c 37                	cmp    $0x37,%al
   35330:	75 0b                	jne    3533d <keyboard_read+0xaf>
   35332:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
   35339:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
   3533d:	e8 ec fe ff ff       	call   3522e <read_from_keyboard_buf>
   35342:	3c b7                	cmp    $0xb7,%al
   35344:	75 1d                	jne    35363 <keyboard_read+0xd5>
   35346:	e8 e3 fe ff ff       	call   3522e <read_from_keyboard_buf>
   3534b:	3c e0                	cmp    $0xe0,%al
   3534d:	75 14                	jne    35363 <keyboard_read+0xd5>
   3534f:	e8 da fe ff ff       	call   3522e <read_from_keyboard_buf>
   35354:	3c aa                	cmp    $0xaa,%al
   35356:	75 0b                	jne    35363 <keyboard_read+0xd5>
   35358:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
   3535f:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
   35363:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
   35367:	75 07                	jne    35370 <keyboard_read+0xe2>
   35369:	c6 05 84 8e 03 00 01 	movb   $0x1,0x38e84
   35370:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
   35377:	0f 84 8d 00 00 00    	je     3540a <keyboard_read+0x17c>
   3537d:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
   35384:	0f 84 80 00 00 00    	je     3540a <keyboard_read+0x17c>
   3538a:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
   3538e:	0f 94 c2             	sete   %dl
   35391:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
   35395:	0f 94 c0             	sete   %al
   35398:	09 d0                	or     %edx,%eax
   3539a:	84 c0                	test   %al,%al
   3539c:	74 07                	je     353a5 <keyboard_read+0x117>
   3539e:	c6 05 74 bc 03 00 01 	movb   $0x1,0x3bc74
   353a5:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
   353a9:	f7 d0                	not    %eax
   353ab:	c0 e8 07             	shr    $0x7,%al
   353ae:	88 45 e9             	mov    %al,-0x17(%ebp)
   353b1:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
   353b5:	74 53                	je     3540a <keyboard_read+0x17c>
   353b7:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
   353bb:	74 4d                	je     3540a <keyboard_read+0x17c>
   353bd:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
   353c1:	0f b6 05 74 bc 03 00 	movzbl 0x3bc74,%eax
   353c8:	3c 01                	cmp    $0x1,%al
   353ca:	75 04                	jne    353d0 <keyboard_read+0x142>
   353cc:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
   353d0:	0f b6 05 84 8e 03 00 	movzbl 0x38e84,%eax
   353d7:	84 c0                	test   %al,%al
   353d9:	74 04                	je     353df <keyboard_read+0x151>
   353db:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
   353df:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
   353e3:	89 d0                	mov    %edx,%eax
   353e5:	01 c0                	add    %eax,%eax
   353e7:	01 c2                	add    %eax,%edx
   353e9:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
   353ed:	01 d0                	add    %edx,%eax
   353ef:	8b 04 85 80 80 03 00 	mov    0x38080(,%eax,4),%eax
   353f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   353f9:	83 ec 08             	sub    $0x8,%esp
   353fc:	ff 75 f4             	pushl  -0xc(%ebp)
   353ff:	ff 75 08             	pushl  0x8(%ebp)
   35402:	e8 1a 00 00 00       	call   35421 <in_process>
   35407:	83 c4 10             	add    $0x10,%esp
   3540a:	90                   	nop
   3540b:	c9                   	leave  
   3540c:	c3                   	ret    

0003540d <init_keyboard_handler>:
   3540d:	55                   	push   %ebp
   3540e:	89 e5                	mov    %esp,%ebp
   35410:	c6 05 84 8e 03 00 00 	movb   $0x0,0x38e84
   35417:	c6 05 74 bc 03 00 00 	movb   $0x0,0x3bc74
   3541e:	90                   	nop
   3541f:	5d                   	pop    %ebp
   35420:	c3                   	ret    

00035421 <in_process>:
   35421:	55                   	push   %ebp
   35422:	89 e5                	mov    %esp,%ebp
   35424:	83 ec 18             	sub    $0x18,%esp
   35427:	83 ec 04             	sub    $0x4,%esp
   3542a:	6a 02                	push   $0x2
   3542c:	6a 00                	push   $0x0
   3542e:	8d 45 f6             	lea    -0xa(%ebp),%eax
   35431:	50                   	push   %eax
   35432:	e8 7e 0a 00 00       	call   35eb5 <Memset>
   35437:	83 c4 10             	add    $0x10,%esp
   3543a:	8b 45 0c             	mov    0xc(%ebp),%eax
   3543d:	25 00 01 00 00       	and    $0x100,%eax
   35442:	85 c0                	test   %eax,%eax
   35444:	75 28                	jne    3546e <in_process+0x4d>
   35446:	8b 45 0c             	mov    0xc(%ebp),%eax
   35449:	0f b6 c0             	movzbl %al,%eax
   3544c:	83 ec 08             	sub    $0x8,%esp
   3544f:	50                   	push   %eax
   35450:	ff 75 08             	pushl  0x8(%ebp)
   35453:	e8 e5 f4 ff ff       	call   3493d <put_key>
   35458:	83 c4 10             	add    $0x10,%esp
   3545b:	c6 05 84 8e 03 00 00 	movb   $0x0,0x38e84
   35462:	c6 05 74 bc 03 00 00 	movb   $0x0,0x3bc74
   35469:	e9 42 01 00 00       	jmp    355b0 <in_process+0x18f>
   3546e:	0f b6 05 74 bc 03 00 	movzbl 0x3bc74,%eax
   35475:	84 c0                	test   %al,%al
   35477:	0f 84 a9 00 00 00    	je     35526 <in_process+0x105>
   3547d:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
   35481:	0f 84 9f 00 00 00    	je     35526 <in_process+0x105>
   35487:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
   3548b:	0f 84 95 00 00 00    	je     35526 <in_process+0x105>
   35491:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   35498:	74 64                	je     354fe <in_process+0xdd>
   3549a:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   354a1:	77 0b                	ja     354ae <in_process+0x8d>
   354a3:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
   354aa:	74 64                	je     35510 <in_process+0xef>
   354ac:	eb 73                	jmp    35521 <in_process+0x100>
   354ae:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
   354b5:	74 0b                	je     354c2 <in_process+0xa1>
   354b7:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
   354be:	74 20                	je     354e0 <in_process+0xbf>
   354c0:	eb 5f                	jmp    35521 <in_process+0x100>
   354c2:	83 ec 0c             	sub    $0xc,%esp
   354c5:	ff 75 08             	pushl  0x8(%ebp)
   354c8:	e8 dc f4 ff ff       	call   349a9 <scroll_up>
   354cd:	83 c4 10             	add    $0x10,%esp
   354d0:	c6 05 74 bc 03 00 00 	movb   $0x0,0x3bc74
   354d7:	c6 05 84 8e 03 00 00 	movb   $0x0,0x38e84
   354de:	eb 41                	jmp    35521 <in_process+0x100>
   354e0:	83 ec 0c             	sub    $0xc,%esp
   354e3:	ff 75 08             	pushl  0x8(%ebp)
   354e6:	e8 ff f4 ff ff       	call   349ea <scroll_down>
   354eb:	83 c4 10             	add    $0x10,%esp
   354ee:	c6 05 74 bc 03 00 00 	movb   $0x0,0x3bc74
   354f5:	c6 05 84 8e 03 00 00 	movb   $0x0,0x38e84
   354fc:	eb 23                	jmp    35521 <in_process+0x100>
   354fe:	83 ec 08             	sub    $0x8,%esp
   35501:	6a 0a                	push   $0xa
   35503:	ff 75 08             	pushl  0x8(%ebp)
   35506:	e8 52 f5 ff ff       	call   34a5d <out_char>
   3550b:	83 c4 10             	add    $0x10,%esp
   3550e:	eb 11                	jmp    35521 <in_process+0x100>
   35510:	83 ec 08             	sub    $0x8,%esp
   35513:	6a 08                	push   $0x8
   35515:	ff 75 08             	pushl  0x8(%ebp)
   35518:	e8 40 f5 ff ff       	call   34a5d <out_char>
   3551d:	83 c4 10             	add    $0x10,%esp
   35520:	90                   	nop
   35521:	e9 8a 00 00 00       	jmp    355b0 <in_process+0x18f>
   35526:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
   3552d:	74 55                	je     35584 <in_process+0x163>
   3552f:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
   35536:	77 14                	ja     3554c <in_process+0x12b>
   35538:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
   3553f:	74 31                	je     35572 <in_process+0x151>
   35541:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
   35548:	74 16                	je     35560 <in_process+0x13f>
   3554a:	eb 64                	jmp    355b0 <in_process+0x18f>
   3554c:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
   35553:	74 3e                	je     35593 <in_process+0x172>
   35555:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
   3555c:	74 44                	je     355a2 <in_process+0x181>
   3555e:	eb 50                	jmp    355b0 <in_process+0x18f>
   35560:	83 ec 08             	sub    $0x8,%esp
   35563:	6a 0a                	push   $0xa
   35565:	ff 75 08             	pushl  0x8(%ebp)
   35568:	e8 d0 f3 ff ff       	call   3493d <put_key>
   3556d:	83 c4 10             	add    $0x10,%esp
   35570:	eb 3e                	jmp    355b0 <in_process+0x18f>
   35572:	83 ec 08             	sub    $0x8,%esp
   35575:	6a 08                	push   $0x8
   35577:	ff 75 08             	pushl  0x8(%ebp)
   3557a:	e8 be f3 ff ff       	call   3493d <put_key>
   3557f:	83 c4 10             	add    $0x10,%esp
   35582:	eb 2c                	jmp    355b0 <in_process+0x18f>
   35584:	83 ec 0c             	sub    $0xc,%esp
   35587:	6a 00                	push   $0x0
   35589:	e8 7e f2 ff ff       	call   3480c <select_console>
   3558e:	83 c4 10             	add    $0x10,%esp
   35591:	eb 1d                	jmp    355b0 <in_process+0x18f>
   35593:	83 ec 0c             	sub    $0xc,%esp
   35596:	6a 01                	push   $0x1
   35598:	e8 6f f2 ff ff       	call   3480c <select_console>
   3559d:	83 c4 10             	add    $0x10,%esp
   355a0:	eb 0e                	jmp    355b0 <in_process+0x18f>
   355a2:	83 ec 0c             	sub    $0xc,%esp
   355a5:	6a 02                	push   $0x2
   355a7:	e8 60 f2 ff ff       	call   3480c <select_console>
   355ac:	83 c4 10             	add    $0x10,%esp
   355af:	90                   	nop
   355b0:	90                   	nop
   355b1:	c9                   	leave  
   355b2:	c3                   	ret    

000355b3 <open>:
   355b3:	55                   	push   %ebp
   355b4:	89 e5                	mov    %esp,%ebp
   355b6:	83 ec 78             	sub    $0x78,%esp
   355b9:	c7 45 94 06 00 00 00 	movl   $0x6,-0x6c(%ebp)
   355c0:	8b 45 08             	mov    0x8(%ebp),%eax
   355c3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
   355c6:	8b 45 0c             	mov    0xc(%ebp),%eax
   355c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
   355cc:	83 ec 0c             	sub    $0xc,%esp
   355cf:	ff 75 08             	pushl  0x8(%ebp)
   355d2:	e8 17 09 00 00       	call   35eee <Strlen>
   355d7:	83 c4 10             	add    $0x10,%esp
   355da:	89 45 c0             	mov    %eax,-0x40(%ebp)
   355dd:	83 ec 04             	sub    $0x4,%esp
   355e0:	6a 03                	push   $0x3
   355e2:	8d 45 90             	lea    -0x70(%ebp),%eax
   355e5:	50                   	push   %eax
   355e6:	6a 03                	push   $0x3
   355e8:	e8 c6 c7 ff ff       	call   31db3 <send_rec>
   355ed:	83 c4 10             	add    $0x10,%esp
   355f0:	8b 45 94             	mov    -0x6c(%ebp),%eax
   355f3:	83 f8 65             	cmp    $0x65,%eax
   355f6:	74 19                	je     35611 <open+0x5e>
   355f8:	6a 17                	push   $0x17
   355fa:	68 40 5e 03 00       	push   $0x35e40
   355ff:	68 40 5e 03 00       	push   $0x35e40
   35604:	68 4b 5e 03 00       	push   $0x35e4b
   35609:	e8 4e c0 ff ff       	call   3165c <assertion_failure>
   3560e:	83 c4 10             	add    $0x10,%esp
   35611:	8b 45 d0             	mov    -0x30(%ebp),%eax
   35614:	c9                   	leave  
   35615:	c3                   	ret    

00035616 <read>:
   35616:	55                   	push   %ebp
   35617:	89 e5                	mov    %esp,%ebp
   35619:	83 ec 78             	sub    $0x78,%esp
   3561c:	c7 45 94 07 00 00 00 	movl   $0x7,-0x6c(%ebp)
   35623:	8b 45 08             	mov    0x8(%ebp),%eax
   35626:	89 45 d0             	mov    %eax,-0x30(%ebp)
   35629:	8b 45 0c             	mov    0xc(%ebp),%eax
   3562c:	89 45 a0             	mov    %eax,-0x60(%ebp)
   3562f:	8b 45 10             	mov    0x10(%ebp),%eax
   35632:	89 45 e0             	mov    %eax,-0x20(%ebp)
   35635:	83 ec 04             	sub    $0x4,%esp
   35638:	6a 03                	push   $0x3
   3563a:	8d 45 90             	lea    -0x70(%ebp),%eax
   3563d:	50                   	push   %eax
   3563e:	6a 03                	push   $0x3
   35640:	e8 6e c7 ff ff       	call   31db3 <send_rec>
   35645:	83 c4 10             	add    $0x10,%esp
   35648:	8b 45 e0             	mov    -0x20(%ebp),%eax
   3564b:	c9                   	leave  
   3564c:	c3                   	ret    

0003564d <write>:
   3564d:	55                   	push   %ebp
   3564e:	89 e5                	mov    %esp,%ebp
   35650:	83 ec 78             	sub    $0x78,%esp
   35653:	c7 45 94 0a 00 00 00 	movl   $0xa,-0x6c(%ebp)
   3565a:	8b 45 08             	mov    0x8(%ebp),%eax
   3565d:	89 45 d0             	mov    %eax,-0x30(%ebp)
   35660:	8b 45 0c             	mov    0xc(%ebp),%eax
   35663:	89 45 a0             	mov    %eax,-0x60(%ebp)
   35666:	8b 45 10             	mov    0x10(%ebp),%eax
   35669:	89 45 e0             	mov    %eax,-0x20(%ebp)
   3566c:	83 ec 04             	sub    $0x4,%esp
   3566f:	6a 03                	push   $0x3
   35671:	8d 45 90             	lea    -0x70(%ebp),%eax
   35674:	50                   	push   %eax
   35675:	6a 03                	push   $0x3
   35677:	e8 37 c7 ff ff       	call   31db3 <send_rec>
   3567c:	83 c4 10             	add    $0x10,%esp
   3567f:	8b 45 e0             	mov    -0x20(%ebp),%eax
   35682:	c9                   	leave  
   35683:	c3                   	ret    

00035684 <close>:
   35684:	55                   	push   %ebp
   35685:	89 e5                	mov    %esp,%ebp
   35687:	83 ec 78             	sub    $0x78,%esp
   3568a:	c7 45 94 01 00 00 00 	movl   $0x1,-0x6c(%ebp)
   35691:	8b 45 08             	mov    0x8(%ebp),%eax
   35694:	89 45 d0             	mov    %eax,-0x30(%ebp)
   35697:	83 ec 04             	sub    $0x4,%esp
   3569a:	6a 03                	push   $0x3
   3569c:	8d 45 90             	lea    -0x70(%ebp),%eax
   3569f:	50                   	push   %eax
   356a0:	6a 03                	push   $0x3
   356a2:	e8 0c c7 ff ff       	call   31db3 <send_rec>
   356a7:	83 c4 10             	add    $0x10,%esp
   356aa:	8b 45 94             	mov    -0x6c(%ebp),%eax
   356ad:	83 f8 65             	cmp    $0x65,%eax
   356b0:	74 19                	je     356cb <close+0x47>
   356b2:	6a 14                	push   $0x14
   356b4:	68 63 5e 03 00       	push   $0x35e63
   356b9:	68 63 5e 03 00       	push   $0x35e63
   356be:	68 6f 5e 03 00       	push   $0x35e6f
   356c3:	e8 94 bf ff ff       	call   3165c <assertion_failure>
   356c8:	83 c4 10             	add    $0x10,%esp
   356cb:	8b 45 d8             	mov    -0x28(%ebp),%eax
   356ce:	c9                   	leave  
   356cf:	c3                   	ret    
