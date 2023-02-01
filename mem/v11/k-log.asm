
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001500 <_start>:
c0001500:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0001507:	00 00 00 
c000150a:	b4 0b                	mov    $0xb,%ah
c000150c:	b0 4c                	mov    $0x4c,%al
c000150e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001515:	66 c7 05 a0 07 01 c0 	movw   $0x0,0xc00107a0
c000151c:	00 00 
c000151e:	0f 01 05 c8 16 01 c0 	sgdtl  0xc00116c8
c0001525:	e8 1a 3a 00 00       	call   c0004f44 <ReloadGDT>
c000152a:	0f 01 15 c8 16 01 c0 	lgdtl  0xc00116c8
c0001531:	0f 01 1d 88 07 01 c0 	lidtl  0xc0010788
c0001538:	0f a8                	push   %gs
c000153a:	0f a9                	pop    %gs
c000153c:	ea 43 15 00 c0 08 00 	ljmp   $0x8,$0xc0001543

c0001543 <csinit>:
c0001543:	31 c0                	xor    %eax,%eax
c0001545:	66 b8 40 00          	mov    $0x40,%ax
c0001549:	0f 00 d8             	ltr    %ax
c000154c:	31 c0                	xor    %eax,%eax
c000154e:	e9 52 03 00 00       	jmp    c00018a5 <kernel_main>
c0001553:	f4                   	hlt    
c0001554:	eb fe                	jmp    c0001554 <csinit+0x11>
c0001556:	fb                   	sti    
c0001557:	b4 0b                	mov    $0xb,%ah
c0001559:	b0 4d                	mov    $0x4d,%al
c000155b:	65 66 a3 d2 0c 00 00 	mov    %ax,%gs:0xcd2
c0001562:	eb fe                	jmp    c0001562 <csinit+0x1f>
c0001564:	f4                   	hlt    
c0001565:	6a 00                	push   $0x0
c0001567:	9d                   	popf   
c0001568:	eb fe                	jmp    c0001568 <csinit+0x25>
c000156a:	e8 42 70 00 00       	call   c00085b1 <test>
c000156f:	6a 01                	push   $0x1
c0001571:	6a 02                	push   $0x2
c0001573:	6a 03                	push   $0x3
c0001575:	f4                   	hlt    
c0001576:	66 90                	xchg   %ax,%ax
c0001578:	66 90                	xchg   %ax,%ax
c000157a:	66 90                	xchg   %ax,%ax
c000157c:	66 90                	xchg   %ax,%ax
c000157e:	66 90                	xchg   %ax,%ax

c0001580 <InterruptTest>:
c0001580:	b4 0d                	mov    $0xd,%ah
c0001582:	b0 54                	mov    $0x54,%al
c0001584:	65 66 a3 d4 0c 00 00 	mov    %ax,%gs:0xcd4
c000158b:	c3                   	ret    

c000158c <disp_str>:
c000158c:	55                   	push   %ebp
c000158d:	89 e5                	mov    %esp,%ebp
c000158f:	b4 0d                	mov    $0xd,%ah
c0001591:	8b 75 08             	mov    0x8(%ebp),%esi
c0001594:	8b 3d a0 07 01 c0    	mov    0xc00107a0,%edi

c000159a <disp_str.1>:
c000159a:	ac                   	lods   %ds:(%esi),%al
c000159b:	84 c0                	test   %al,%al
c000159d:	74 1e                	je     c00015bd <disp_str.4>
c000159f:	3c 0a                	cmp    $0xa,%al
c00015a1:	75 11                	jne    c00015b4 <disp_str.3>
c00015a3:	50                   	push   %eax
c00015a4:	89 f8                	mov    %edi,%eax
c00015a6:	b3 a0                	mov    $0xa0,%bl
c00015a8:	f6 f3                	div    %bl
c00015aa:	40                   	inc    %eax
c00015ab:	b3 a0                	mov    $0xa0,%bl
c00015ad:	f6 e3                	mul    %bl
c00015af:	89 c7                	mov    %eax,%edi
c00015b1:	58                   	pop    %eax
c00015b2:	eb e6                	jmp    c000159a <disp_str.1>

c00015b4 <disp_str.3>:
c00015b4:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00015b8:	83 c7 02             	add    $0x2,%edi
c00015bb:	eb dd                	jmp    c000159a <disp_str.1>

c00015bd <disp_str.4>:
c00015bd:	89 3d a0 07 01 c0    	mov    %edi,0xc00107a0
c00015c3:	89 ec                	mov    %ebp,%esp
c00015c5:	5d                   	pop    %ebp
c00015c6:	c3                   	ret    

c00015c7 <disp_str_colour>:
c00015c7:	55                   	push   %ebp
c00015c8:	89 e5                	mov    %esp,%ebp
c00015ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00015cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00015d0:	8b 3d a0 07 01 c0    	mov    0xc00107a0,%edi

c00015d6 <disp_str_colour.1>:
c00015d6:	ac                   	lods   %ds:(%esi),%al
c00015d7:	84 c0                	test   %al,%al
c00015d9:	74 1e                	je     c00015f9 <disp_str_colour.4>
c00015db:	3c 0a                	cmp    $0xa,%al
c00015dd:	75 11                	jne    c00015f0 <disp_str_colour.3>
c00015df:	50                   	push   %eax
c00015e0:	89 f8                	mov    %edi,%eax
c00015e2:	b3 a0                	mov    $0xa0,%bl
c00015e4:	f6 f3                	div    %bl
c00015e6:	40                   	inc    %eax
c00015e7:	b3 a0                	mov    $0xa0,%bl
c00015e9:	f6 e3                	mul    %bl
c00015eb:	89 c7                	mov    %eax,%edi
c00015ed:	58                   	pop    %eax
c00015ee:	eb e6                	jmp    c00015d6 <disp_str_colour.1>

c00015f0 <disp_str_colour.3>:
c00015f0:	65 66 89 07          	mov    %ax,%gs:(%edi)
c00015f4:	83 c7 02             	add    $0x2,%edi
c00015f7:	eb dd                	jmp    c00015d6 <disp_str_colour.1>

c00015f9 <disp_str_colour.4>:
c00015f9:	89 3d a0 07 01 c0    	mov    %edi,0xc00107a0
c00015ff:	89 ec                	mov    %ebp,%esp
c0001601:	5d                   	pop    %ebp
c0001602:	c3                   	ret    

c0001603 <divide_zero_fault>:
c0001603:	6a ff                	push   $0xffffffff
c0001605:	6a 00                	push   $0x0
c0001607:	eb 5f                	jmp    c0001668 <exception>

c0001609 <single_step_fault>:
c0001609:	6a ff                	push   $0xffffffff
c000160b:	6a 01                	push   $0x1
c000160d:	eb 59                	jmp    c0001668 <exception>

c000160f <non_maskable_interrupt>:
c000160f:	6a ff                	push   $0xffffffff
c0001611:	6a 02                	push   $0x2
c0001613:	eb 53                	jmp    c0001668 <exception>

c0001615 <breakpoint_trap>:
c0001615:	6a ff                	push   $0xffffffff
c0001617:	6a 03                	push   $0x3
c0001619:	eb 4d                	jmp    c0001668 <exception>

c000161b <overflow_trap>:
c000161b:	6a ff                	push   $0xffffffff
c000161d:	6a 04                	push   $0x4
c000161f:	eb 47                	jmp    c0001668 <exception>

c0001621 <bound_range_exceeded_fault>:
c0001621:	6a ff                	push   $0xffffffff
c0001623:	6a 05                	push   $0x5
c0001625:	eb 41                	jmp    c0001668 <exception>

c0001627 <invalid_opcode_fault>:
c0001627:	6a ff                	push   $0xffffffff
c0001629:	6a 06                	push   $0x6
c000162b:	eb 3b                	jmp    c0001668 <exception>

c000162d <coprocessor_not_available_fault>:
c000162d:	6a ff                	push   $0xffffffff
c000162f:	6a 07                	push   $0x7
c0001631:	eb 35                	jmp    c0001668 <exception>

c0001633 <double_fault_exception_abort>:
c0001633:	6a 08                	push   $0x8
c0001635:	eb 31                	jmp    c0001668 <exception>

c0001637 <coprocessor_segment_overrun>:
c0001637:	6a ff                	push   $0xffffffff
c0001639:	6a 09                	push   $0x9
c000163b:	eb 2b                	jmp    c0001668 <exception>

c000163d <invalid_task_state_segment_fault>:
c000163d:	6a 0a                	push   $0xa
c000163f:	eb 27                	jmp    c0001668 <exception>

c0001641 <segment_not_present_fault>:
c0001641:	6a 0b                	push   $0xb
c0001643:	eb 23                	jmp    c0001668 <exception>

c0001645 <stack_exception_fault>:
c0001645:	6a 0c                	push   $0xc
c0001647:	eb 1f                	jmp    c0001668 <exception>

c0001649 <general_protection_exception_fault>:
c0001649:	6a 0d                	push   $0xd
c000164b:	e8 64 6a 00 00       	call   c00080b4 <exception_handler>
c0001650:	83 c4 08             	add    $0x8,%esp
c0001653:	cf                   	iret   

c0001654 <page_fault>:
c0001654:	6a 0e                	push   $0xe
c0001656:	eb 10                	jmp    c0001668 <exception>

c0001658 <coprocessor_error_fault>:
c0001658:	6a ff                	push   $0xffffffff
c000165a:	6a 10                	push   $0x10
c000165c:	eb 0a                	jmp    c0001668 <exception>

c000165e <align_check_fault>:
c000165e:	6a 11                	push   $0x11
c0001660:	eb 06                	jmp    c0001668 <exception>

c0001662 <simd_float_exception_fault>:
c0001662:	6a ff                	push   $0xffffffff
c0001664:	6a 12                	push   $0x12
c0001666:	eb 00                	jmp    c0001668 <exception>

c0001668 <exception>:
c0001668:	e8 47 6a 00 00       	call   c00080b4 <exception_handler>
c000166d:	83 c4 08             	add    $0x8,%esp
c0001670:	f4                   	hlt    

c0001671 <hwint0>:
c0001671:	60                   	pusha  
c0001672:	1e                   	push   %ds
c0001673:	06                   	push   %es
c0001674:	0f a0                	push   %fs
c0001676:	0f a8                	push   %gs
c0001678:	66 8c d2             	mov    %ss,%dx
c000167b:	8e da                	mov    %edx,%ds
c000167d:	8e c2                	mov    %edx,%es
c000167f:	8e e2                	mov    %edx,%fs
c0001681:	b0 20                	mov    $0x20,%al
c0001683:	e6 20                	out    %al,$0x20
c0001685:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c000168b:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001692:	75 00                	jne    c0001694 <hwint0.1>

c0001694 <hwint0.1>:
c0001694:	e8 9d 34 00 00       	call   c0004b36 <clock_handler>
c0001699:	e9 e1 00 00 00       	jmp    c000177f <reenter_restore>

c000169e <hwint1>:
c000169e:	60                   	pusha  
c000169f:	1e                   	push   %ds
c00016a0:	06                   	push   %es
c00016a1:	0f a0                	push   %fs
c00016a3:	0f a8                	push   %gs
c00016a5:	66 8c d2             	mov    %ss,%dx
c00016a8:	8e da                	mov    %edx,%ds
c00016aa:	8e c2                	mov    %edx,%es
c00016ac:	8e e2                	mov    %edx,%fs
c00016ae:	b0 fa                	mov    $0xfa,%al
c00016b0:	e6 21                	out    %al,$0x21
c00016b2:	b0 20                	mov    $0x20,%al
c00016b4:	e6 20                	out    %al,$0x20
c00016b6:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c00016bc:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c00016c3:	75 00                	jne    c00016c5 <hwint1.1>

c00016c5 <hwint1.1>:
c00016c5:	e8 bf 43 00 00       	call   c0005a89 <keyboard_handler>
c00016ca:	b0 f8                	mov    $0xf8,%al
c00016cc:	e6 21                	out    %al,$0x21
c00016ce:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c00016d5:	0f 85 a4 00 00 00    	jne    c000177f <reenter_restore>
c00016db:	e9 9f 00 00 00       	jmp    c000177f <reenter_restore>

c00016e0 <hwint14>:
c00016e0:	60                   	pusha  
c00016e1:	1e                   	push   %ds
c00016e2:	06                   	push   %es
c00016e3:	0f a0                	push   %fs
c00016e5:	0f a8                	push   %gs
c00016e7:	66 8c d2             	mov    %ss,%dx
c00016ea:	8e da                	mov    %edx,%ds
c00016ec:	8e c2                	mov    %edx,%es
c00016ee:	8e e2                	mov    %edx,%fs
c00016f0:	b0 ff                	mov    $0xff,%al
c00016f2:	e6 a1                	out    %al,$0xa1
c00016f4:	b0 20                	mov    $0x20,%al
c00016f6:	e6 20                	out    %al,$0x20
c00016f8:	90                   	nop
c00016f9:	e6 a0                	out    %al,$0xa0
c00016fb:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c0001701:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c0001708:	75 00                	jne    c000170a <hwint14.1>

c000170a <hwint14.1>:
c000170a:	e8 9f 10 00 00       	call   c00027ae <hd_handler>
c000170f:	b0 bf                	mov    $0xbf,%al
c0001711:	e6 a1                	out    %al,$0xa1
c0001713:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c000171a:	75 63                	jne    c000177f <reenter_restore>
c000171c:	eb 61                	jmp    c000177f <reenter_restore>

c000171e <sys_call>:
c000171e:	60                   	pusha  
c000171f:	1e                   	push   %ds
c0001720:	06                   	push   %es
c0001721:	0f a0                	push   %fs
c0001723:	0f a8                	push   %gs
c0001725:	89 e6                	mov    %esp,%esi
c0001727:	89 e5                	mov    %esp,%ebp
c0001729:	66 8c d2             	mov    %ss,%dx
c000172c:	8e da                	mov    %edx,%ds
c000172e:	8e c2                	mov    %edx,%es
c0001730:	8e e2                	mov    %edx,%fs
c0001732:	ff 05 a4 07 01 c0    	incl   0xc00107a4
c0001738:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c000173f:	75 00                	jne    c0001741 <sys_call.1>

c0001741 <sys_call.1>:
c0001741:	56                   	push   %esi
c0001742:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001748:	53                   	push   %ebx
c0001749:	51                   	push   %ecx
c000174a:	ff 14 85 2c f1 00 c0 	call   *-0x3fff0ed4(,%eax,4)
c0001751:	83 c4 0c             	add    $0xc,%esp
c0001754:	5e                   	pop    %esi
c0001755:	89 45 2c             	mov    %eax,0x2c(%ebp)
c0001758:	83 3d a4 07 01 c0 00 	cmpl   $0x0,0xc00107a4
c000175f:	75 1e                	jne    c000177f <reenter_restore>
c0001761:	eb 1c                	jmp    c000177f <reenter_restore>

c0001763 <fork_restart>:
c0001763:	fa                   	cli    
c0001764:	0f a9                	pop    %gs
c0001766:	0f a1                	pop    %fs
c0001768:	07                   	pop    %es
c0001769:	1f                   	pop    %ds
c000176a:	61                   	popa   
c000176b:	cf                   	iret   

c000176c <restart>:
c000176c:	ff 0d a4 07 01 c0    	decl   0xc00107a4
c0001772:	89 e5                	mov    %esp,%ebp
c0001774:	8b 65 04             	mov    0x4(%ebp),%esp
c0001777:	0f a9                	pop    %gs
c0001779:	0f a1                	pop    %fs
c000177b:	07                   	pop    %es
c000177c:	1f                   	pop    %ds
c000177d:	61                   	popa   
c000177e:	cf                   	iret   

c000177f <reenter_restore>:
c000177f:	ff 0d a4 07 01 c0    	decl   0xc00107a4
c0001785:	0f a9                	pop    %gs
c0001787:	0f a1                	pop    %fs
c0001789:	07                   	pop    %es
c000178a:	1f                   	pop    %ds
c000178b:	61                   	popa   
c000178c:	cf                   	iret   

c000178d <in_byte>:
c000178d:	31 d2                	xor    %edx,%edx
c000178f:	8b 54 24 04          	mov    0x4(%esp),%edx
c0001793:	31 c0                	xor    %eax,%eax
c0001795:	ec                   	in     (%dx),%al
c0001796:	90                   	nop
c0001797:	90                   	nop
c0001798:	c3                   	ret    

c0001799 <out_byte>:
c0001799:	31 d2                	xor    %edx,%edx
c000179b:	31 c0                	xor    %eax,%eax
c000179d:	8b 54 24 04          	mov    0x4(%esp),%edx
c00017a1:	8a 44 24 08          	mov    0x8(%esp),%al
c00017a5:	ee                   	out    %al,(%dx)
c00017a6:	90                   	nop
c00017a7:	90                   	nop
c00017a8:	c3                   	ret    

c00017a9 <in_byte2>:
c00017a9:	55                   	push   %ebp
c00017aa:	89 e5                	mov    %esp,%ebp
c00017ac:	52                   	push   %edx
c00017ad:	31 d2                	xor    %edx,%edx
c00017af:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017b3:	31 c0                	xor    %eax,%eax
c00017b5:	ec                   	in     (%dx),%al
c00017b6:	90                   	nop
c00017b7:	90                   	nop
c00017b8:	5b                   	pop    %ebx
c00017b9:	5d                   	pop    %ebp
c00017ba:	c3                   	ret    

c00017bb <disable_int>:
c00017bb:	fa                   	cli    
c00017bc:	c3                   	ret    

c00017bd <enable_int>:
c00017bd:	fb                   	sti    
c00017be:	c3                   	ret    

c00017bf <check_tss_esp0>:
c00017bf:	55                   	push   %ebp
c00017c0:	89 e5                	mov    %esp,%ebp
c00017c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00017c5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00017c8:	83 c0 44             	add    $0x44,%eax
c00017cb:	8b 15 44 16 01 c0    	mov    0xc0011644,%edx
c00017d1:	39 d0                	cmp    %edx,%eax
c00017d3:	74 7c                	je     c0001851 <check_tss_esp0.2>

c00017d5 <check_tss_esp0.1>:
c00017d5:	50                   	push   %eax
c00017d6:	52                   	push   %edx
c00017d7:	68 10 f0 00 c0       	push   $0xc000f010
c00017dc:	e8 ab fd ff ff       	call   c000158c <disp_str>
c00017e1:	83 c4 04             	add    $0x4,%esp
c00017e4:	5a                   	pop    %edx
c00017e5:	58                   	pop    %eax
c00017e6:	52                   	push   %edx
c00017e7:	50                   	push   %eax
c00017e8:	53                   	push   %ebx
c00017e9:	e8 60 67 00 00       	call   c0007f4e <disp_int>
c00017ee:	83 c4 04             	add    $0x4,%esp
c00017f1:	58                   	pop    %eax
c00017f2:	5a                   	pop    %edx
c00017f3:	52                   	push   %edx
c00017f4:	50                   	push   %eax
c00017f5:	e8 54 67 00 00       	call   c0007f4e <disp_int>
c00017fa:	58                   	pop    %eax
c00017fb:	5a                   	pop    %edx
c00017fc:	52                   	push   %edx
c00017fd:	50                   	push   %eax
c00017fe:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c0001804:	e8 45 67 00 00       	call   c0007f4e <disp_int>
c0001809:	83 c4 04             	add    $0x4,%esp
c000180c:	58                   	pop    %eax
c000180d:	5a                   	pop    %edx
c000180e:	52                   	push   %edx
c000180f:	50                   	push   %eax
c0001810:	ff 72 ec             	pushl  -0x14(%edx)
c0001813:	e8 36 67 00 00       	call   c0007f4e <disp_int>
c0001818:	83 c4 04             	add    $0x4,%esp
c000181b:	58                   	pop    %eax
c000181c:	5a                   	pop    %edx
c000181d:	52                   	push   %edx
c000181e:	50                   	push   %eax
c000181f:	ff 70 ec             	pushl  -0x14(%eax)
c0001822:	e8 27 67 00 00       	call   c0007f4e <disp_int>
c0001827:	83 c4 04             	add    $0x4,%esp
c000182a:	58                   	pop    %eax
c000182b:	5a                   	pop    %edx
c000182c:	52                   	push   %edx
c000182d:	50                   	push   %eax
c000182e:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001834:	e8 15 67 00 00       	call   c0007f4e <disp_int>
c0001839:	83 c4 04             	add    $0x4,%esp
c000183c:	58                   	pop    %eax
c000183d:	5a                   	pop    %edx
c000183e:	52                   	push   %edx
c000183f:	50                   	push   %eax
c0001840:	68 60 07 01 c0       	push   $0xc0010760
c0001845:	e8 04 67 00 00       	call   c0007f4e <disp_int>
c000184a:	83 c4 04             	add    $0x4,%esp
c000184d:	58                   	pop    %eax
c000184e:	5a                   	pop    %edx
c000184f:	5d                   	pop    %ebp
c0001850:	c3                   	ret    

c0001851 <check_tss_esp0.2>:
c0001851:	5d                   	pop    %ebp
c0001852:	c3                   	ret    

c0001853 <enable_8259A_casecade_irq>:
c0001853:	9c                   	pushf  
c0001854:	fa                   	cli    
c0001855:	e4 21                	in     $0x21,%al
c0001857:	24 fb                	and    $0xfb,%al
c0001859:	e6 21                	out    %al,$0x21
c000185b:	9d                   	popf   
c000185c:	c3                   	ret    

c000185d <disable_8259A_casecade_irq>:
c000185d:	9c                   	pushf  
c000185e:	fa                   	cli    
c000185f:	e4 21                	in     $0x21,%al
c0001861:	0c 04                	or     $0x4,%al
c0001863:	e6 21                	out    %al,$0x21
c0001865:	9c                   	pushf  
c0001866:	c3                   	ret    

c0001867 <enable_8259A_slave_winchester_irq>:
c0001867:	9c                   	pushf  
c0001868:	fa                   	cli    
c0001869:	e4 a1                	in     $0xa1,%al
c000186b:	24 bf                	and    $0xbf,%al
c000186d:	e6 a1                	out    %al,$0xa1
c000186f:	9d                   	popf   
c0001870:	c3                   	ret    

c0001871 <disable_8259A_slave_winchester_irq>:
c0001871:	9c                   	pushf  
c0001872:	fa                   	cli    
c0001873:	e4 a1                	in     $0xa1,%al
c0001875:	0c 40                	or     $0x40,%al
c0001877:	e6 a1                	out    %al,$0xa1
c0001879:	9d                   	popf   
c000187a:	c3                   	ret    

c000187b <update_cr3>:
c000187b:	55                   	push   %ebp
c000187c:	89 e5                	mov    %esp,%ebp
c000187e:	8b 45 08             	mov    0x8(%ebp),%eax
c0001881:	0f 22 d8             	mov    %eax,%cr3
c0001884:	89 ec                	mov    %ebp,%esp
c0001886:	5d                   	pop    %ebp
c0001887:	c3                   	ret    

c0001888 <update_tss>:
c0001888:	55                   	push   %ebp
c0001889:	89 e5                	mov    %esp,%ebp
c000188b:	8b 45 08             	mov    0x8(%ebp),%eax
c000188e:	a3 44 16 01 c0       	mov    %eax,0xc0011644
c0001893:	89 ec                	mov    %ebp,%esp
c0001895:	5d                   	pop    %ebp
c0001896:	c3                   	ret    

c0001897 <get_running_thread_pcb>:
c0001897:	89 e0                	mov    %esp,%eax
c0001899:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000189e:	c3                   	ret    

c000189f <sys_call_test>:
c000189f:	9c                   	pushf  
c00018a0:	66 87 db             	xchg   %bx,%bx
c00018a3:	9d                   	popf   
c00018a4:	c3                   	ret    

c00018a5 <kernel_main>:
c00018a5:	55                   	push   %ebp
c00018a6:	89 e5                	mov    %esp,%ebp
c00018a8:	83 ec 08             	sub    $0x8,%esp
c00018ab:	e8 d0 00 00 00       	call   c0001980 <init>
c00018b0:	e8 e2 ff ff ff       	call   c0001897 <get_running_thread_pcb>
c00018b5:	a3 e0 1e 01 c0       	mov    %eax,0xc0011ee0
c00018ba:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018bf:	05 00 01 00 00       	add    $0x100,%eax
c00018c4:	83 ec 08             	sub    $0x8,%esp
c00018c7:	50                   	push   %eax
c00018c8:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018cd:	e8 6e 97 00 00       	call   c000b040 <appendToDoubleLinkList>
c00018d2:	83 c4 10             	add    $0x10,%esp
c00018d5:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018da:	05 08 01 00 00       	add    $0x108,%eax
c00018df:	83 ec 08             	sub    $0x8,%esp
c00018e2:	50                   	push   %eax
c00018e3:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018e8:	e8 53 97 00 00       	call   c000b040 <appendToDoubleLinkList>
c00018ed:	83 c4 10             	add    $0x10,%esp
c00018f0:	6a 00                	push   $0x0
c00018f2:	68 00 b4 00 c0       	push   $0xc000b400
c00018f7:	68 07 b4 00 c0       	push   $0xc000b407
c00018fc:	68 94 63 00 c0       	push   $0xc0006394
c0001901:	e8 7f 94 00 00       	call   c000ad85 <process_execute>
c0001906:	83 c4 10             	add    $0x10,%esp
c0001909:	6a 00                	push   $0x0
c000190b:	68 10 b4 00 c0       	push   $0xc000b410
c0001910:	68 18 b4 00 c0       	push   $0xc000b418
c0001915:	68 d9 29 00 c0       	push   $0xc00029d9
c000191a:	e8 66 94 00 00       	call   c000ad85 <process_execute>
c000191f:	83 c4 10             	add    $0x10,%esp
c0001922:	6a 00                	push   $0x0
c0001924:	68 21 b4 00 c0       	push   $0xc000b421
c0001929:	68 28 b4 00 c0       	push   $0xc000b428
c000192e:	68 2b 1b 00 c0       	push   $0xc0001b2b
c0001933:	e8 4d 94 00 00       	call   c000ad85 <process_execute>
c0001938:	83 c4 10             	add    $0x10,%esp
c000193b:	6a 00                	push   $0x0
c000193d:	68 31 b4 00 c0       	push   $0xc000b431
c0001942:	68 39 b4 00 c0       	push   $0xc000b439
c0001947:	68 86 59 00 c0       	push   $0xc0005986
c000194c:	e8 34 94 00 00       	call   c000ad85 <process_execute>
c0001951:	83 c4 10             	add    $0x10,%esp
c0001954:	6a 01                	push   $0x1
c0001956:	68 43 b4 00 c0       	push   $0xc000b443
c000195b:	68 4d b4 00 c0       	push   $0xc000b44d
c0001960:	68 f6 1a 00 c0       	push   $0xc0001af6
c0001965:	e8 1b 94 00 00       	call   c000ad85 <process_execute>
c000196a:	83 c4 10             	add    $0x10,%esp
c000196d:	83 ec 0c             	sub    $0xc,%esp
c0001970:	68 5a b4 00 c0       	push   $0xc000b45a
c0001975:	e8 12 fc ff ff       	call   c000158c <disp_str>
c000197a:	83 c4 10             	add    $0x10,%esp
c000197d:	fb                   	sti    
c000197e:	eb fe                	jmp    c000197e <kernel_main+0xd9>

c0001980 <init>:
c0001980:	55                   	push   %ebp
c0001981:	89 e5                	mov    %esp,%ebp
c0001983:	83 ec 18             	sub    $0x18,%esp
c0001986:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c000198d:	00 00 00 
c0001990:	c7 05 90 07 01 c0 00 	movl   $0x0,0xc0010790
c0001997:	00 00 00 
c000199a:	c7 05 fc 0d 01 c0 09 	movl   $0x9,0xc0010dfc
c00019a1:	00 00 00 
c00019a4:	c7 05 c0 0b 01 c0 00 	movl   $0x0,0xc0010bc0
c00019ab:	00 00 00 
c00019ae:	83 ec 0c             	sub    $0xc,%esp
c00019b1:	68 64 b4 00 c0       	push   $0xc000b464
c00019b6:	e8 d1 fb ff ff       	call   c000158c <disp_str>
c00019bb:	83 c4 10             	add    $0x10,%esp
c00019be:	e8 ab 6c 00 00       	call   c000866e <init_keyboard>
c00019c3:	83 ec 0c             	sub    $0xc,%esp
c00019c6:	68 00 00 00 02       	push   $0x2000000
c00019cb:	e8 bf 5f 00 00       	call   c000798f <init_memory>
c00019d0:	83 c4 10             	add    $0x10,%esp
c00019d3:	83 ec 0c             	sub    $0xc,%esp
c00019d6:	68 ec 0d 01 c0       	push   $0xc0010dec
c00019db:	e8 35 95 00 00       	call   c000af15 <initDoubleLinkList>
c00019e0:	83 c4 10             	add    $0x10,%esp
c00019e3:	83 ec 0c             	sub    $0xc,%esp
c00019e6:	68 04 1f 01 c0       	push   $0xc0011f04
c00019eb:	e8 25 95 00 00       	call   c000af15 <initDoubleLinkList>
c00019f0:	83 c4 10             	add    $0x10,%esp
c00019f3:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00019fa:	00 00 00 
c00019fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a04:	eb 14                	jmp    c0001a1a <init+0x9a>
c0001a06:	83 ec 0c             	sub    $0xc,%esp
c0001a09:	68 6a b4 00 c0       	push   $0xc000b46a
c0001a0e:	e8 79 fb ff ff       	call   c000158c <disp_str>
c0001a13:	83 c4 10             	add    $0x10,%esp
c0001a16:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001a1a:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0001a21:	7e e3                	jle    c0001a06 <init+0x86>
c0001a23:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0001a2a:	00 00 00 
c0001a2d:	90                   	nop
c0001a2e:	c9                   	leave  
c0001a2f:	c3                   	ret    

c0001a30 <kernel_thread_a>:
c0001a30:	55                   	push   %ebp
c0001a31:	89 e5                	mov    %esp,%ebp
c0001a33:	83 ec 18             	sub    $0x18,%esp
c0001a36:	83 ec 0c             	sub    $0xc,%esp
c0001a39:	ff 75 08             	pushl  0x8(%ebp)
c0001a3c:	e8 4b fb ff ff       	call   c000158c <disp_str>
c0001a41:	83 c4 10             	add    $0x10,%esp
c0001a44:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001a49:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001a4c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a56:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c0001a5b:	83 ec 0c             	sub    $0xc,%esp
c0001a5e:	68 6b b4 00 c0       	push   $0xc000b46b
c0001a63:	e8 24 fb ff ff       	call   c000158c <disp_str>
c0001a68:	83 c4 10             	add    $0x10,%esp
c0001a6b:	83 ec 0c             	sub    $0xc,%esp
c0001a6e:	68 74 b4 00 c0       	push   $0xc000b474
c0001a73:	e8 14 fb ff ff       	call   c000158c <disp_str>
c0001a78:	83 c4 10             	add    $0x10,%esp
c0001a7b:	eb d6                	jmp    c0001a53 <kernel_thread_a+0x23>

c0001a7d <kernel_thread_b>:
c0001a7d:	55                   	push   %ebp
c0001a7e:	89 e5                	mov    %esp,%ebp
c0001a80:	83 ec 18             	sub    $0x18,%esp
c0001a83:	83 ec 0c             	sub    $0xc,%esp
c0001a86:	ff 75 08             	pushl  0x8(%ebp)
c0001a89:	e8 fe fa ff ff       	call   c000158c <disp_str>
c0001a8e:	83 c4 10             	add    $0x10,%esp
c0001a91:	a1 a0 07 01 c0       	mov    0xc00107a0,%eax
c0001a96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001a99:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001aa3:	a3 a0 07 01 c0       	mov    %eax,0xc00107a0
c0001aa8:	83 ec 0c             	sub    $0xc,%esp
c0001aab:	68 76 b4 00 c0       	push   $0xc000b476
c0001ab0:	e8 d7 fa ff ff       	call   c000158c <disp_str>
c0001ab5:	83 c4 10             	add    $0x10,%esp
c0001ab8:	83 ec 0c             	sub    $0xc,%esp
c0001abb:	68 74 b4 00 c0       	push   $0xc000b474
c0001ac0:	e8 c7 fa ff ff       	call   c000158c <disp_str>
c0001ac5:	83 c4 10             	add    $0x10,%esp
c0001ac8:	eb d6                	jmp    c0001aa0 <kernel_thread_b+0x23>

c0001aca <kernel_thread_c>:
c0001aca:	55                   	push   %ebp
c0001acb:	89 e5                	mov    %esp,%ebp
c0001acd:	83 ec 08             	sub    $0x8,%esp
c0001ad0:	83 ec 0c             	sub    $0xc,%esp
c0001ad3:	ff 75 08             	pushl  0x8(%ebp)
c0001ad6:	e8 b1 fa ff ff       	call   c000158c <disp_str>
c0001adb:	83 c4 10             	add    $0x10,%esp
c0001ade:	eb fe                	jmp    c0001ade <kernel_thread_c+0x14>

c0001ae0 <kernel_thread_d>:
c0001ae0:	55                   	push   %ebp
c0001ae1:	89 e5                	mov    %esp,%ebp
c0001ae3:	83 ec 08             	sub    $0x8,%esp
c0001ae6:	83 ec 0c             	sub    $0xc,%esp
c0001ae9:	ff 75 08             	pushl  0x8(%ebp)
c0001aec:	e8 9b fa ff ff       	call   c000158c <disp_str>
c0001af1:	83 c4 10             	add    $0x10,%esp
c0001af4:	eb fe                	jmp    c0001af4 <kernel_thread_d+0x14>

c0001af6 <user_proc_a>:
c0001af6:	55                   	push   %ebp
c0001af7:	89 e5                	mov    %esp,%ebp
c0001af9:	83 ec 08             	sub    $0x8,%esp
c0001afc:	83 ec 0c             	sub    $0xc,%esp
c0001aff:	68 7f b4 00 c0       	push   $0xc000b47f
c0001b04:	e8 83 fa ff ff       	call   c000158c <disp_str>
c0001b09:	83 c4 10             	add    $0x10,%esp
c0001b0c:	e8 cb 7a 00 00       	call   c00095dc <test_exec>
c0001b11:	eb fe                	jmp    c0001b11 <user_proc_a+0x1b>

c0001b13 <user_proc_b>:
c0001b13:	55                   	push   %ebp
c0001b14:	89 e5                	mov    %esp,%ebp
c0001b16:	83 ec 08             	sub    $0x8,%esp
c0001b19:	83 ec 0c             	sub    $0xc,%esp
c0001b1c:	68 91 b4 00 c0       	push   $0xc000b491
c0001b21:	e8 66 fa ff ff       	call   c000158c <disp_str>
c0001b26:	83 c4 10             	add    $0x10,%esp
c0001b29:	eb fe                	jmp    c0001b29 <user_proc_b+0x16>

c0001b2b <TaskHD>:
c0001b2b:	55                   	push   %ebp
c0001b2c:	89 e5                	mov    %esp,%ebp
c0001b2e:	83 ec 18             	sub    $0x18,%esp
c0001b31:	e8 61 fd ff ff       	call   c0001897 <get_running_thread_pcb>
c0001b36:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001b39:	e8 32 00 00 00       	call   c0001b70 <init_hd>
c0001b3e:	83 ec 0c             	sub    $0xc,%esp
c0001b41:	6a 6c                	push   $0x6c
c0001b43:	e8 7c 0e 00 00       	call   c00029c4 <sys_malloc>
c0001b48:	83 c4 10             	add    $0x10,%esp
c0001b4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b4e:	83 ec 04             	sub    $0x4,%esp
c0001b51:	6a 6c                	push   $0x6c
c0001b53:	6a 00                	push   $0x0
c0001b55:	ff 75 f0             	pushl  -0x10(%ebp)
c0001b58:	e8 ee a6 00 00       	call   c000c24b <Memset>
c0001b5d:	83 c4 10             	add    $0x10,%esp
c0001b60:	83 ec 0c             	sub    $0xc,%esp
c0001b63:	ff 75 f0             	pushl  -0x10(%ebp)
c0001b66:	e8 1f 00 00 00       	call   c0001b8a <hd_handle>
c0001b6b:	83 c4 10             	add    $0x10,%esp
c0001b6e:	eb de                	jmp    c0001b4e <TaskHD+0x23>

c0001b70 <init_hd>:
c0001b70:	55                   	push   %ebp
c0001b71:	89 e5                	mov    %esp,%ebp
c0001b73:	83 ec 18             	sub    $0x18,%esp
c0001b76:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001b7d:	e8 d1 fc ff ff       	call   c0001853 <enable_8259A_casecade_irq>
c0001b82:	e8 e0 fc ff ff       	call   c0001867 <enable_8259A_slave_winchester_irq>
c0001b87:	90                   	nop
c0001b88:	c9                   	leave  
c0001b89:	c3                   	ret    

c0001b8a <hd_handle>:
c0001b8a:	55                   	push   %ebp
c0001b8b:	89 e5                	mov    %esp,%ebp
c0001b8d:	83 ec 18             	sub    $0x18,%esp
c0001b90:	83 ec 04             	sub    $0x4,%esp
c0001b93:	6a 12                	push   $0x12
c0001b95:	ff 75 08             	pushl  0x8(%ebp)
c0001b98:	6a 02                	push   $0x2
c0001b9a:	e8 d7 88 00 00       	call   c000a476 <send_rec>
c0001b9f:	83 c4 10             	add    $0x10,%esp
c0001ba2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ba5:	8b 40 68             	mov    0x68(%eax),%eax
c0001ba8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001bab:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001baf:	0f 84 d4 00 00 00    	je     c0001c89 <hd_handle+0xff>
c0001bb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bb8:	8b 00                	mov    (%eax),%eax
c0001bba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001bbd:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001bc1:	74 28                	je     c0001beb <hd_handle+0x61>
c0001bc3:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001bc7:	74 22                	je     c0001beb <hd_handle+0x61>
c0001bc9:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001bcd:	74 1c                	je     c0001beb <hd_handle+0x61>
c0001bcf:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001bd3:	74 16                	je     c0001beb <hd_handle+0x61>
c0001bd5:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001bdc:	74 0d                	je     c0001beb <hd_handle+0x61>
c0001bde:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0001be5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001be8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0001beb:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001bef:	74 34                	je     c0001c25 <hd_handle+0x9b>
c0001bf1:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001bf5:	74 2e                	je     c0001c25 <hd_handle+0x9b>
c0001bf7:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001bfb:	74 28                	je     c0001c25 <hd_handle+0x9b>
c0001bfd:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001c01:	74 22                	je     c0001c25 <hd_handle+0x9b>
c0001c03:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001c0a:	74 19                	je     c0001c25 <hd_handle+0x9b>
c0001c0c:	6a 6d                	push   $0x6d
c0001c0e:	68 a4 b4 00 c0       	push   $0xc000b4a4
c0001c13:	68 a4 b4 00 c0       	push   $0xc000b4a4
c0001c18:	68 ac b4 00 c0       	push   $0xc000b4ac
c0001c1d:	e8 28 7f 00 00       	call   c0009b4a <assertion_failure>
c0001c22:	83 c4 10             	add    $0x10,%esp
c0001c25:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001c29:	74 2c                	je     c0001c57 <hd_handle+0xcd>
c0001c2b:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001c2f:	77 0e                	ja     c0001c3f <hd_handle+0xb5>
c0001c31:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001c35:	74 19                	je     c0001c50 <hd_handle+0xc6>
c0001c37:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001c3b:	74 1a                	je     c0001c57 <hd_handle+0xcd>
c0001c3d:	eb 37                	jmp    c0001c76 <hd_handle+0xec>
c0001c3f:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001c43:	74 22                	je     c0001c67 <hd_handle+0xdd>
c0001c45:	81 7d f4 d5 07 00 00 	cmpl   $0x7d5,-0xc(%ebp)
c0001c4c:	74 3e                	je     c0001c8c <hd_handle+0x102>
c0001c4e:	eb 26                	jmp    c0001c76 <hd_handle+0xec>
c0001c50:	e8 e6 06 00 00       	call   c000233b <hd_open>
c0001c55:	eb 36                	jmp    c0001c8d <hd_handle+0x103>
c0001c57:	83 ec 0c             	sub    $0xc,%esp
c0001c5a:	ff 75 08             	pushl  0x8(%ebp)
c0001c5d:	e8 93 08 00 00       	call   c00024f5 <hd_rdwt>
c0001c62:	83 c4 10             	add    $0x10,%esp
c0001c65:	eb 26                	jmp    c0001c8d <hd_handle+0x103>
c0001c67:	83 ec 0c             	sub    $0xc,%esp
c0001c6a:	6a 00                	push   $0x0
c0001c6c:	e8 61 07 00 00       	call   c00023d2 <get_hd_ioctl>
c0001c71:	83 c4 10             	add    $0x10,%esp
c0001c74:	eb 17                	jmp    c0001c8d <hd_handle+0x103>
c0001c76:	83 ec 0c             	sub    $0xc,%esp
c0001c79:	68 06 b5 00 c0       	push   $0xc000b506
c0001c7e:	e8 83 7e 00 00       	call   c0009b06 <spin>
c0001c83:	83 c4 10             	add    $0x10,%esp
c0001c86:	90                   	nop
c0001c87:	eb 04                	jmp    c0001c8d <hd_handle+0x103>
c0001c89:	90                   	nop
c0001c8a:	eb 01                	jmp    c0001c8d <hd_handle+0x103>
c0001c8c:	90                   	nop
c0001c8d:	c9                   	leave  
c0001c8e:	c3                   	ret    

c0001c8f <hd_cmd_out>:
c0001c8f:	55                   	push   %ebp
c0001c90:	89 e5                	mov    %esp,%ebp
c0001c92:	83 ec 08             	sub    $0x8,%esp
c0001c95:	83 ec 04             	sub    $0x4,%esp
c0001c98:	68 18 73 01 00       	push   $0x17318
c0001c9d:	6a 00                	push   $0x0
c0001c9f:	68 80 00 00 00       	push   $0x80
c0001ca4:	e8 31 0b 00 00       	call   c00027da <waitfor>
c0001ca9:	83 c4 10             	add    $0x10,%esp
c0001cac:	85 c0                	test   %eax,%eax
c0001cae:	75 10                	jne    c0001cc0 <hd_cmd_out+0x31>
c0001cb0:	83 ec 0c             	sub    $0xc,%esp
c0001cb3:	68 18 b5 00 c0       	push   $0xc000b518
c0001cb8:	e8 6f 7e 00 00       	call   c0009b2c <panic>
c0001cbd:	83 c4 10             	add    $0x10,%esp
c0001cc0:	83 ec 08             	sub    $0x8,%esp
c0001cc3:	6a 00                	push   $0x0
c0001cc5:	68 f6 03 00 00       	push   $0x3f6
c0001cca:	e8 ca fa ff ff       	call   c0001799 <out_byte>
c0001ccf:	83 c4 10             	add    $0x10,%esp
c0001cd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cd5:	0f b6 00             	movzbl (%eax),%eax
c0001cd8:	0f b6 c0             	movzbl %al,%eax
c0001cdb:	83 ec 08             	sub    $0x8,%esp
c0001cde:	50                   	push   %eax
c0001cdf:	68 f1 01 00 00       	push   $0x1f1
c0001ce4:	e8 b0 fa ff ff       	call   c0001799 <out_byte>
c0001ce9:	83 c4 10             	add    $0x10,%esp
c0001cec:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cef:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001cf3:	0f b6 c0             	movzbl %al,%eax
c0001cf6:	83 ec 08             	sub    $0x8,%esp
c0001cf9:	50                   	push   %eax
c0001cfa:	68 f2 01 00 00       	push   $0x1f2
c0001cff:	e8 95 fa ff ff       	call   c0001799 <out_byte>
c0001d04:	83 c4 10             	add    $0x10,%esp
c0001d07:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d0a:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001d0e:	0f b6 c0             	movzbl %al,%eax
c0001d11:	83 ec 08             	sub    $0x8,%esp
c0001d14:	50                   	push   %eax
c0001d15:	68 f3 01 00 00       	push   $0x1f3
c0001d1a:	e8 7a fa ff ff       	call   c0001799 <out_byte>
c0001d1f:	83 c4 10             	add    $0x10,%esp
c0001d22:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d25:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001d29:	0f b6 c0             	movzbl %al,%eax
c0001d2c:	83 ec 08             	sub    $0x8,%esp
c0001d2f:	50                   	push   %eax
c0001d30:	68 f4 01 00 00       	push   $0x1f4
c0001d35:	e8 5f fa ff ff       	call   c0001799 <out_byte>
c0001d3a:	83 c4 10             	add    $0x10,%esp
c0001d3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d40:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001d44:	0f b6 c0             	movzbl %al,%eax
c0001d47:	83 ec 08             	sub    $0x8,%esp
c0001d4a:	50                   	push   %eax
c0001d4b:	68 f5 01 00 00       	push   $0x1f5
c0001d50:	e8 44 fa ff ff       	call   c0001799 <out_byte>
c0001d55:	83 c4 10             	add    $0x10,%esp
c0001d58:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d5b:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001d5f:	0f b6 c0             	movzbl %al,%eax
c0001d62:	83 ec 08             	sub    $0x8,%esp
c0001d65:	50                   	push   %eax
c0001d66:	68 f6 01 00 00       	push   $0x1f6
c0001d6b:	e8 29 fa ff ff       	call   c0001799 <out_byte>
c0001d70:	83 c4 10             	add    $0x10,%esp
c0001d73:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d76:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001d7a:	0f b6 c0             	movzbl %al,%eax
c0001d7d:	83 ec 08             	sub    $0x8,%esp
c0001d80:	50                   	push   %eax
c0001d81:	68 f7 01 00 00       	push   $0x1f7
c0001d86:	e8 0e fa ff ff       	call   c0001799 <out_byte>
c0001d8b:	83 c4 10             	add    $0x10,%esp
c0001d8e:	90                   	nop
c0001d8f:	c9                   	leave  
c0001d90:	c3                   	ret    

c0001d91 <hd_identify>:
c0001d91:	55                   	push   %ebp
c0001d92:	89 e5                	mov    %esp,%ebp
c0001d94:	53                   	push   %ebx
c0001d95:	83 ec 24             	sub    $0x24,%esp
c0001d98:	89 e0                	mov    %esp,%eax
c0001d9a:	89 c3                	mov    %eax,%ebx
c0001d9c:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001da0:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001da4:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001da8:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001dac:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001db0:	8b 45 08             	mov    0x8(%ebp),%eax
c0001db3:	c1 e0 04             	shl    $0x4,%eax
c0001db6:	83 c8 e0             	or     $0xffffffe0,%eax
c0001db9:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001dbc:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001dc0:	83 ec 0c             	sub    $0xc,%esp
c0001dc3:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001dc6:	50                   	push   %eax
c0001dc7:	e8 c3 fe ff ff       	call   c0001c8f <hd_cmd_out>
c0001dcc:	83 c4 10             	add    $0x10,%esp
c0001dcf:	e8 d0 06 00 00       	call   c00024a4 <interrupt_wait>
c0001dd4:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001ddb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001dde:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001de1:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001de4:	89 c2                	mov    %eax,%edx
c0001de6:	b8 10 00 00 00       	mov    $0x10,%eax
c0001deb:	83 e8 01             	sub    $0x1,%eax
c0001dee:	01 d0                	add    %edx,%eax
c0001df0:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001df5:	ba 00 00 00 00       	mov    $0x0,%edx
c0001dfa:	f7 f1                	div    %ecx
c0001dfc:	6b c0 10             	imul   $0x10,%eax,%eax
c0001dff:	29 c4                	sub    %eax,%esp
c0001e01:	89 e0                	mov    %esp,%eax
c0001e03:	83 c0 00             	add    $0x0,%eax
c0001e06:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001e09:	83 ec 04             	sub    $0x4,%esp
c0001e0c:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e0f:	6a 00                	push   $0x0
c0001e11:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e14:	e8 32 a4 00 00       	call   c000c24b <Memset>
c0001e19:	83 c4 10             	add    $0x10,%esp
c0001e1c:	83 ec 04             	sub    $0x4,%esp
c0001e1f:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e22:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e25:	68 f0 01 00 00       	push   $0x1f0
c0001e2a:	e8 70 a4 00 00       	call   c000c29f <read_port>
c0001e2f:	83 c4 10             	add    $0x10,%esp
c0001e32:	83 ec 0c             	sub    $0xc,%esp
c0001e35:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e38:	e8 0b 00 00 00       	call   c0001e48 <print_hdinfo>
c0001e3d:	83 c4 10             	add    $0x10,%esp
c0001e40:	89 dc                	mov    %ebx,%esp
c0001e42:	90                   	nop
c0001e43:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001e46:	c9                   	leave  
c0001e47:	c3                   	ret    

c0001e48 <print_hdinfo>:
c0001e48:	55                   	push   %ebp
c0001e49:	89 e5                	mov    %esp,%ebp
c0001e4b:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001e51:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001e57:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001e5d:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001e64:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001e6b:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001e72:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001e79:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001e80:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001e86:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001e8c:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001e93:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001e9a:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001ea1:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001ea8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001eaf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001eb6:	e9 8f 00 00 00       	jmp    c0001f4a <print_hdinfo+0x102>
c0001ebb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001ec2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001ec5:	89 d0                	mov    %edx,%eax
c0001ec7:	01 c0                	add    %eax,%eax
c0001ec9:	01 d0                	add    %edx,%eax
c0001ecb:	c1 e0 03             	shl    $0x3,%eax
c0001ece:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001ed1:	01 c8                	add    %ecx,%eax
c0001ed3:	83 e8 44             	sub    $0x44,%eax
c0001ed6:	0f b7 00             	movzwl (%eax),%eax
c0001ed9:	0f b7 c0             	movzwl %ax,%eax
c0001edc:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001edf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ee2:	01 d0                	add    %edx,%eax
c0001ee4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001ee7:	eb 30                	jmp    c0001f19 <print_hdinfo+0xd1>
c0001ee9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001eec:	8d 50 01             	lea    0x1(%eax),%edx
c0001eef:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001ef2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001ef5:	83 c2 01             	add    $0x1,%edx
c0001ef8:	0f b6 00             	movzbl (%eax),%eax
c0001efb:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001eff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001f02:	8d 50 01             	lea    0x1(%eax),%edx
c0001f05:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001f08:	0f b6 00             	movzbl (%eax),%eax
c0001f0b:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001f0e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001f11:	01 ca                	add    %ecx,%edx
c0001f13:	88 02                	mov    %al,(%edx)
c0001f15:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001f19:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001f1c:	89 d0                	mov    %edx,%eax
c0001f1e:	01 c0                	add    %eax,%eax
c0001f20:	01 d0                	add    %edx,%eax
c0001f22:	c1 e0 03             	shl    $0x3,%eax
c0001f25:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001f28:	01 c8                	add    %ecx,%eax
c0001f2a:	83 e8 42             	sub    $0x42,%eax
c0001f2d:	0f b7 00             	movzwl (%eax),%eax
c0001f30:	66 d1 e8             	shr    %ax
c0001f33:	0f b7 c0             	movzwl %ax,%eax
c0001f36:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001f39:	7c ae                	jl     c0001ee9 <print_hdinfo+0xa1>
c0001f3b:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001f3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001f41:	01 d0                	add    %edx,%eax
c0001f43:	c6 00 00             	movb   $0x0,(%eax)
c0001f46:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001f4a:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001f4e:	0f 8e 67 ff ff ff    	jle    c0001ebb <print_hdinfo+0x73>
c0001f54:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f57:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001f5b:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001f5f:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001f63:	66 c1 e8 08          	shr    $0x8,%ax
c0001f67:	66 85 c0             	test   %ax,%ax
c0001f6a:	0f 95 c0             	setne  %al
c0001f6d:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001f70:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001f77:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001f7d:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001f81:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001f85:	75 15                	jne    c0001f9c <print_hdinfo+0x154>
c0001f87:	83 ec 08             	sub    $0x8,%esp
c0001f8a:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001f8d:	50                   	push   %eax
c0001f8e:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f91:	50                   	push   %eax
c0001f92:	e8 d3 a2 00 00       	call   c000c26a <Strcpy>
c0001f97:	83 c4 10             	add    $0x10,%esp
c0001f9a:	eb 13                	jmp    c0001faf <print_hdinfo+0x167>
c0001f9c:	83 ec 08             	sub    $0x8,%esp
c0001f9f:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001fa2:	50                   	push   %eax
c0001fa3:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001fa6:	50                   	push   %eax
c0001fa7:	e8 be a2 00 00       	call   c000c26a <Strcpy>
c0001fac:	83 c4 10             	add    $0x10,%esp
c0001faf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fb2:	83 c0 7a             	add    $0x7a,%eax
c0001fb5:	0f b7 00             	movzwl (%eax),%eax
c0001fb8:	0f b7 d0             	movzwl %ax,%edx
c0001fbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fbe:	83 c0 78             	add    $0x78,%eax
c0001fc1:	0f b7 00             	movzwl (%eax),%eax
c0001fc4:	0f b7 c0             	movzwl %ax,%eax
c0001fc7:	83 c0 10             	add    $0x10,%eax
c0001fca:	89 c1                	mov    %eax,%ecx
c0001fcc:	d3 e2                	shl    %cl,%edx
c0001fce:	89 d0                	mov    %edx,%eax
c0001fd0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001fd3:	90                   	nop
c0001fd4:	c9                   	leave  
c0001fd5:	c3                   	ret    

c0001fd6 <print_dpt_entry>:
c0001fd6:	55                   	push   %ebp
c0001fd7:	89 e5                	mov    %esp,%ebp
c0001fd9:	83 ec 08             	sub    $0x8,%esp
c0001fdc:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fdf:	8b 40 08             	mov    0x8(%eax),%eax
c0001fe2:	83 ec 08             	sub    $0x8,%esp
c0001fe5:	50                   	push   %eax
c0001fe6:	68 22 b5 00 c0       	push   $0xc000b522
c0001feb:	e8 fd 77 00 00       	call   c00097ed <Printf>
c0001ff0:	83 c4 10             	add    $0x10,%esp
c0001ff3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ff6:	8b 40 0c             	mov    0xc(%eax),%eax
c0001ff9:	83 ec 08             	sub    $0x8,%esp
c0001ffc:	50                   	push   %eax
c0001ffd:	68 2a b5 00 c0       	push   $0xc000b52a
c0002002:	e8 e6 77 00 00       	call   c00097ed <Printf>
c0002007:	83 c4 10             	add    $0x10,%esp
c000200a:	8b 45 08             	mov    0x8(%ebp),%eax
c000200d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0002011:	0f b6 c0             	movzbl %al,%eax
c0002014:	83 ec 08             	sub    $0x8,%esp
c0002017:	50                   	push   %eax
c0002018:	68 3b b5 00 c0       	push   $0xc000b53b
c000201d:	e8 cb 77 00 00       	call   c00097ed <Printf>
c0002022:	83 c4 10             	add    $0x10,%esp
c0002025:	8b 45 08             	mov    0x8(%ebp),%eax
c0002028:	0f b6 00             	movzbl (%eax),%eax
c000202b:	0f b6 c0             	movzbl %al,%eax
c000202e:	83 ec 08             	sub    $0x8,%esp
c0002031:	50                   	push   %eax
c0002032:	68 49 b5 00 c0       	push   $0xc000b549
c0002037:	e8 b1 77 00 00       	call   c00097ed <Printf>
c000203c:	83 c4 10             	add    $0x10,%esp
c000203f:	90                   	nop
c0002040:	c9                   	leave  
c0002041:	c3                   	ret    

c0002042 <get_partition_table>:
c0002042:	55                   	push   %ebp
c0002043:	89 e5                	mov    %esp,%ebp
c0002045:	53                   	push   %ebx
c0002046:	83 ec 24             	sub    $0x24,%esp
c0002049:	89 e0                	mov    %esp,%eax
c000204b:	89 c3                	mov    %eax,%ebx
c000204d:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0002051:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0002055:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002058:	88 45 e3             	mov    %al,-0x1d(%ebp)
c000205b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000205e:	c1 f8 08             	sar    $0x8,%eax
c0002061:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0002064:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002067:	c1 f8 10             	sar    $0x10,%eax
c000206a:	88 45 e5             	mov    %al,-0x1b(%ebp)
c000206d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002070:	c1 f8 18             	sar    $0x18,%eax
c0002073:	89 c2                	mov    %eax,%edx
c0002075:	8b 45 08             	mov    0x8(%ebp),%eax
c0002078:	c1 e0 04             	shl    $0x4,%eax
c000207b:	09 d0                	or     %edx,%eax
c000207d:	83 c8 e0             	or     $0xffffffe0,%eax
c0002080:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0002083:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0002087:	83 ec 0c             	sub    $0xc,%esp
c000208a:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c000208d:	50                   	push   %eax
c000208e:	e8 fc fb ff ff       	call   c0001c8f <hd_cmd_out>
c0002093:	83 c4 10             	add    $0x10,%esp
c0002096:	e8 09 04 00 00       	call   c00024a4 <interrupt_wait>
c000209b:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c00020a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00020a5:	8d 50 ff             	lea    -0x1(%eax),%edx
c00020a8:	89 55 f0             	mov    %edx,-0x10(%ebp)
c00020ab:	89 c2                	mov    %eax,%edx
c00020ad:	b8 10 00 00 00       	mov    $0x10,%eax
c00020b2:	83 e8 01             	sub    $0x1,%eax
c00020b5:	01 d0                	add    %edx,%eax
c00020b7:	b9 10 00 00 00       	mov    $0x10,%ecx
c00020bc:	ba 00 00 00 00       	mov    $0x0,%edx
c00020c1:	f7 f1                	div    %ecx
c00020c3:	6b c0 10             	imul   $0x10,%eax,%eax
c00020c6:	29 c4                	sub    %eax,%esp
c00020c8:	89 e0                	mov    %esp,%eax
c00020ca:	83 c0 00             	add    $0x0,%eax
c00020cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00020d0:	83 ec 04             	sub    $0x4,%esp
c00020d3:	ff 75 f4             	pushl  -0xc(%ebp)
c00020d6:	6a 00                	push   $0x0
c00020d8:	ff 75 ec             	pushl  -0x14(%ebp)
c00020db:	e8 6b a1 00 00       	call   c000c24b <Memset>
c00020e0:	83 c4 10             	add    $0x10,%esp
c00020e3:	83 ec 04             	sub    $0x4,%esp
c00020e6:	ff 75 f4             	pushl  -0xc(%ebp)
c00020e9:	ff 75 ec             	pushl  -0x14(%ebp)
c00020ec:	68 f0 01 00 00       	push   $0x1f0
c00020f1:	e8 a9 a1 00 00       	call   c000c29f <read_port>
c00020f6:	83 c4 10             	add    $0x10,%esp
c00020f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00020fc:	05 be 01 00 00       	add    $0x1be,%eax
c0002101:	83 ec 04             	sub    $0x4,%esp
c0002104:	6a 40                	push   $0x40
c0002106:	50                   	push   %eax
c0002107:	ff 75 10             	pushl  0x10(%ebp)
c000210a:	e8 56 5a 00 00       	call   c0007b65 <Memcpy>
c000210f:	83 c4 10             	add    $0x10,%esp
c0002112:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0002119:	89 dc                	mov    %ebx,%esp
c000211b:	90                   	nop
c000211c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000211f:	c9                   	leave  
c0002120:	c3                   	ret    

c0002121 <partition>:
c0002121:	55                   	push   %ebp
c0002122:	89 e5                	mov    %esp,%ebp
c0002124:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000212a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000212d:	88 45 84             	mov    %al,-0x7c(%ebp)
c0002130:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0002134:	7f 19                	jg     c000214f <partition+0x2e>
c0002136:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002139:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000213e:	89 c8                	mov    %ecx,%eax
c0002140:	f7 ea                	imul   %edx
c0002142:	d1 fa                	sar    %edx
c0002144:	89 c8                	mov    %ecx,%eax
c0002146:	c1 f8 1f             	sar    $0x1f,%eax
c0002149:	29 c2                	sub    %eax,%edx
c000214b:	89 d0                	mov    %edx,%eax
c000214d:	eb 11                	jmp    c0002160 <partition+0x3f>
c000214f:	8b 45 08             	mov    0x8(%ebp),%eax
c0002152:	83 e8 10             	sub    $0x10,%eax
c0002155:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002158:	85 c0                	test   %eax,%eax
c000215a:	0f 48 c2             	cmovs  %edx,%eax
c000215d:	c1 f8 06             	sar    $0x6,%eax
c0002160:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002163:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c0002167:	0f 85 cc 00 00 00    	jne    c0002239 <partition+0x118>
c000216d:	83 ec 04             	sub    $0x4,%esp
c0002170:	6a 40                	push   $0x40
c0002172:	6a 00                	push   $0x0
c0002174:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002177:	50                   	push   %eax
c0002178:	e8 ce a0 00 00       	call   c000c24b <Memset>
c000217d:	83 c4 10             	add    $0x10,%esp
c0002180:	83 ec 04             	sub    $0x4,%esp
c0002183:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002186:	50                   	push   %eax
c0002187:	6a 00                	push   $0x0
c0002189:	ff 75 e8             	pushl  -0x18(%ebp)
c000218c:	e8 b1 fe ff ff       	call   c0002042 <get_partition_table>
c0002191:	83 c4 10             	add    $0x10,%esp
c0002194:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000219b:	e9 8a 00 00 00       	jmp    c000222a <partition+0x109>
c00021a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00021a3:	83 c0 01             	add    $0x1,%eax
c00021a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00021a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00021ac:	c1 e0 04             	shl    $0x4,%eax
c00021af:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00021b2:	01 c8                	add    %ecx,%eax
c00021b4:	83 e8 5c             	sub    $0x5c,%eax
c00021b7:	8b 00                	mov    (%eax),%eax
c00021b9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00021bc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00021bf:	c1 e1 03             	shl    $0x3,%ecx
c00021c2:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00021c8:	01 ca                	add    %ecx,%edx
c00021ca:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c00021d0:	89 02                	mov    %eax,(%edx)
c00021d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00021d5:	c1 e0 04             	shl    $0x4,%eax
c00021d8:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c00021db:	01 c8                	add    %ecx,%eax
c00021dd:	83 e8 58             	sub    $0x58,%eax
c00021e0:	8b 00                	mov    (%eax),%eax
c00021e2:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c00021e5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00021e8:	c1 e1 03             	shl    $0x3,%ecx
c00021eb:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c00021f1:	01 ca                	add    %ecx,%edx
c00021f3:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c00021f9:	89 02                	mov    %eax,(%edx)
c00021fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00021fe:	c1 e0 04             	shl    $0x4,%eax
c0002201:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002204:	01 c8                	add    %ecx,%eax
c0002206:	83 e8 60             	sub    $0x60,%eax
c0002209:	0f b6 00             	movzbl (%eax),%eax
c000220c:	3c 05                	cmp    $0x5,%al
c000220e:	75 16                	jne    c0002226 <partition+0x105>
c0002210:	8b 55 08             	mov    0x8(%ebp),%edx
c0002213:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002216:	01 d0                	add    %edx,%eax
c0002218:	83 ec 08             	sub    $0x8,%esp
c000221b:	6a 01                	push   $0x1
c000221d:	50                   	push   %eax
c000221e:	e8 fe fe ff ff       	call   c0002121 <partition>
c0002223:	83 c4 10             	add    $0x10,%esp
c0002226:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000222a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c000222e:	0f 8e 6c ff ff ff    	jle    c00021a0 <partition+0x7f>
c0002234:	e9 ff 00 00 00       	jmp    c0002338 <partition+0x217>
c0002239:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c000223d:	0f 85 f5 00 00 00    	jne    c0002338 <partition+0x217>
c0002243:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002246:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000224b:	89 c8                	mov    %ecx,%eax
c000224d:	f7 ea                	imul   %edx
c000224f:	d1 fa                	sar    %edx
c0002251:	89 c8                	mov    %ecx,%eax
c0002253:	c1 f8 1f             	sar    $0x1f,%eax
c0002256:	29 c2                	sub    %eax,%edx
c0002258:	89 d0                	mov    %edx,%eax
c000225a:	c1 e0 02             	shl    $0x2,%eax
c000225d:	01 d0                	add    %edx,%eax
c000225f:	29 c1                	sub    %eax,%ecx
c0002261:	89 c8                	mov    %ecx,%eax
c0002263:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002266:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0002269:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000226c:	c1 e2 03             	shl    $0x3,%edx
c000226f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002275:	01 d0                	add    %edx,%eax
c0002277:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000227c:	8b 00                	mov    (%eax),%eax
c000227e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002281:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002284:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002287:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000228a:	83 e8 01             	sub    $0x1,%eax
c000228d:	c1 e0 04             	shl    $0x4,%eax
c0002290:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002293:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000229a:	e9 8c 00 00 00       	jmp    c000232b <partition+0x20a>
c000229f:	83 ec 04             	sub    $0x4,%esp
c00022a2:	6a 40                	push   $0x40
c00022a4:	6a 00                	push   $0x0
c00022a6:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00022a9:	50                   	push   %eax
c00022aa:	e8 9c 9f 00 00       	call   c000c24b <Memset>
c00022af:	83 c4 10             	add    $0x10,%esp
c00022b2:	83 ec 04             	sub    $0x4,%esp
c00022b5:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00022b8:	50                   	push   %eax
c00022b9:	ff 75 f0             	pushl  -0x10(%ebp)
c00022bc:	ff 75 e8             	pushl  -0x18(%ebp)
c00022bf:	e8 7e fd ff ff       	call   c0002042 <get_partition_table>
c00022c4:	83 c4 10             	add    $0x10,%esp
c00022c7:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00022ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00022cd:	01 d0                	add    %edx,%eax
c00022cf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00022d2:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00022d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00022d8:	01 c2                	add    %eax,%edx
c00022da:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00022dd:	8d 48 04             	lea    0x4(%eax),%ecx
c00022e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00022e3:	c1 e1 03             	shl    $0x3,%ecx
c00022e6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022ec:	01 c8                	add    %ecx,%eax
c00022ee:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00022f3:	89 10                	mov    %edx,(%eax)
c00022f5:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00022f8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c00022fb:	8d 4a 04             	lea    0x4(%edx),%ecx
c00022fe:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002301:	c1 e1 03             	shl    $0x3,%ecx
c0002304:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000230a:	01 ca                	add    %ecx,%edx
c000230c:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0002312:	89 02                	mov    %eax,(%edx)
c0002314:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0002318:	84 c0                	test   %al,%al
c000231a:	74 1b                	je     c0002337 <partition+0x216>
c000231c:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000231f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002322:	01 d0                	add    %edx,%eax
c0002324:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002327:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000232b:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c000232f:	0f 8e 6a ff ff ff    	jle    c000229f <partition+0x17e>
c0002335:	eb 01                	jmp    c0002338 <partition+0x217>
c0002337:	90                   	nop
c0002338:	90                   	nop
c0002339:	c9                   	leave  
c000233a:	c3                   	ret    

c000233b <hd_open>:
c000233b:	55                   	push   %ebp
c000233c:	89 e5                	mov    %esp,%ebp
c000233e:	83 ec 18             	sub    $0x18,%esp
c0002341:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002348:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000234b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002351:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c0002356:	8b 00                	mov    (%eax),%eax
c0002358:	8d 50 01             	lea    0x1(%eax),%edx
c000235b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000235e:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002364:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c0002369:	89 10                	mov    %edx,(%eax)
c000236b:	83 ec 0c             	sub    $0xc,%esp
c000236e:	6a 00                	push   $0x0
c0002370:	e8 1c fa ff ff       	call   c0001d91 <hd_identify>
c0002375:	83 c4 10             	add    $0x10,%esp
c0002378:	83 ec 08             	sub    $0x8,%esp
c000237b:	6a 00                	push   $0x0
c000237d:	6a 00                	push   $0x0
c000237f:	e8 9d fd ff ff       	call   c0002121 <partition>
c0002384:	83 c4 10             	add    $0x10,%esp
c0002387:	83 ec 0c             	sub    $0xc,%esp
c000238a:	6a 6c                	push   $0x6c
c000238c:	e8 33 06 00 00       	call   c00029c4 <sys_malloc>
c0002391:	83 c4 10             	add    $0x10,%esp
c0002394:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002397:	83 ec 04             	sub    $0x4,%esp
c000239a:	6a 6c                	push   $0x6c
c000239c:	6a 00                	push   $0x0
c000239e:	ff 75 f0             	pushl  -0x10(%ebp)
c00023a1:	e8 a5 9e 00 00       	call   c000c24b <Memset>
c00023a6:	83 c4 10             	add    $0x10,%esp
c00023a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023ac:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00023b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023b6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00023bd:	83 ec 04             	sub    $0x4,%esp
c00023c0:	6a 02                	push   $0x2
c00023c2:	ff 75 f0             	pushl  -0x10(%ebp)
c00023c5:	6a 01                	push   $0x1
c00023c7:	e8 aa 80 00 00       	call   c000a476 <send_rec>
c00023cc:	83 c4 10             	add    $0x10,%esp
c00023cf:	90                   	nop
c00023d0:	c9                   	leave  
c00023d1:	c3                   	ret    

c00023d2 <get_hd_ioctl>:
c00023d2:	55                   	push   %ebp
c00023d3:	89 e5                	mov    %esp,%ebp
c00023d5:	83 ec 18             	sub    $0x18,%esp
c00023d8:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00023dc:	7f 19                	jg     c00023f7 <get_hd_ioctl+0x25>
c00023de:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00023e1:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00023e6:	89 c8                	mov    %ecx,%eax
c00023e8:	f7 ea                	imul   %edx
c00023ea:	d1 fa                	sar    %edx
c00023ec:	89 c8                	mov    %ecx,%eax
c00023ee:	c1 f8 1f             	sar    $0x1f,%eax
c00023f1:	29 c2                	sub    %eax,%edx
c00023f3:	89 d0                	mov    %edx,%eax
c00023f5:	eb 11                	jmp    c0002408 <get_hd_ioctl+0x36>
c00023f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00023fa:	83 e8 10             	sub    $0x10,%eax
c00023fd:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002400:	85 c0                	test   %eax,%eax
c0002402:	0f 48 c2             	cmovs  %edx,%eax
c0002405:	c1 f8 06             	sar    $0x6,%eax
c0002408:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000240b:	8b 55 08             	mov    0x8(%ebp),%edx
c000240e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002411:	c1 e2 03             	shl    $0x3,%edx
c0002414:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000241a:	01 d0                	add    %edx,%eax
c000241c:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c0002421:	8b 00                	mov    (%eax),%eax
c0002423:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002426:	83 ec 0c             	sub    $0xc,%esp
c0002429:	6a 6c                	push   $0x6c
c000242b:	e8 94 05 00 00       	call   c00029c4 <sys_malloc>
c0002430:	83 c4 10             	add    $0x10,%esp
c0002433:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002436:	83 ec 04             	sub    $0x4,%esp
c0002439:	6a 6c                	push   $0x6c
c000243b:	6a 00                	push   $0x0
c000243d:	ff 75 ec             	pushl  -0x14(%ebp)
c0002440:	e8 06 9e 00 00       	call   c000c24b <Memset>
c0002445:	83 c4 10             	add    $0x10,%esp
c0002448:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000244b:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002452:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002455:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000245c:	83 ec 04             	sub    $0x4,%esp
c000245f:	6a 02                	push   $0x2
c0002461:	ff 75 ec             	pushl  -0x14(%ebp)
c0002464:	6a 01                	push   $0x1
c0002466:	e8 0b 80 00 00       	call   c000a476 <send_rec>
c000246b:	83 c4 10             	add    $0x10,%esp
c000246e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002471:	c9                   	leave  
c0002472:	c3                   	ret    

c0002473 <wait_for>:
c0002473:	55                   	push   %ebp
c0002474:	89 e5                	mov    %esp,%ebp
c0002476:	83 ec 08             	sub    $0x8,%esp
c0002479:	83 ec 04             	sub    $0x4,%esp
c000247c:	68 50 c3 00 00       	push   $0xc350
c0002481:	6a 08                	push   $0x8
c0002483:	6a 08                	push   $0x8
c0002485:	e8 50 03 00 00       	call   c00027da <waitfor>
c000248a:	83 c4 10             	add    $0x10,%esp
c000248d:	85 c0                	test   %eax,%eax
c000248f:	75 10                	jne    c00024a1 <wait_for+0x2e>
c0002491:	83 ec 0c             	sub    $0xc,%esp
c0002494:	68 54 b5 00 c0       	push   $0xc000b554
c0002499:	e8 8e 76 00 00       	call   c0009b2c <panic>
c000249e:	83 c4 10             	add    $0x10,%esp
c00024a1:	90                   	nop
c00024a2:	c9                   	leave  
c00024a3:	c3                   	ret    

c00024a4 <interrupt_wait>:
c00024a4:	55                   	push   %ebp
c00024a5:	89 e5                	mov    %esp,%ebp
c00024a7:	83 ec 18             	sub    $0x18,%esp
c00024aa:	83 ec 0c             	sub    $0xc,%esp
c00024ad:	6a 6c                	push   $0x6c
c00024af:	e8 10 05 00 00       	call   c00029c4 <sys_malloc>
c00024b4:	83 c4 10             	add    $0x10,%esp
c00024b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024ba:	83 ec 04             	sub    $0x4,%esp
c00024bd:	6a 6c                	push   $0x6c
c00024bf:	6a 00                	push   $0x0
c00024c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00024c4:	e8 82 9d 00 00       	call   c000c24b <Memset>
c00024c9:	83 c4 10             	add    $0x10,%esp
c00024cc:	83 ec 04             	sub    $0x4,%esp
c00024cf:	68 13 02 00 00       	push   $0x213
c00024d4:	ff 75 f4             	pushl  -0xc(%ebp)
c00024d7:	6a 02                	push   $0x2
c00024d9:	e8 98 7f 00 00       	call   c000a476 <send_rec>
c00024de:	83 c4 10             	add    $0x10,%esp
c00024e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024e4:	83 ec 08             	sub    $0x8,%esp
c00024e7:	6a 6c                	push   $0x6c
c00024e9:	50                   	push   %eax
c00024ea:	e8 d5 4f 00 00       	call   c00074c4 <sys_free>
c00024ef:	83 c4 10             	add    $0x10,%esp
c00024f2:	90                   	nop
c00024f3:	c9                   	leave  
c00024f4:	c3                   	ret    

c00024f5 <hd_rdwt>:
c00024f5:	55                   	push   %ebp
c00024f6:	89 e5                	mov    %esp,%ebp
c00024f8:	83 ec 48             	sub    $0x48,%esp
c00024fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00024fe:	8b 40 18             	mov    0x18(%eax),%eax
c0002501:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002504:	8b 45 08             	mov    0x8(%ebp),%eax
c0002507:	8b 40 14             	mov    0x14(%eax),%eax
c000250a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000250d:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002511:	7f 19                	jg     c000252c <hd_rdwt+0x37>
c0002513:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002516:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000251b:	89 c8                	mov    %ecx,%eax
c000251d:	f7 ea                	imul   %edx
c000251f:	d1 fa                	sar    %edx
c0002521:	89 c8                	mov    %ecx,%eax
c0002523:	c1 f8 1f             	sar    $0x1f,%eax
c0002526:	29 c2                	sub    %eax,%edx
c0002528:	89 d0                	mov    %edx,%eax
c000252a:	eb 11                	jmp    c000253d <hd_rdwt+0x48>
c000252c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000252f:	83 e8 10             	sub    $0x10,%eax
c0002532:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002535:	85 c0                	test   %eax,%eax
c0002537:	0f 48 c2             	cmovs  %edx,%eax
c000253a:	c1 f8 06             	sar    $0x6,%eax
c000253d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002540:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002543:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002546:	89 d0                	mov    %edx,%eax
c0002548:	c1 f8 1f             	sar    $0x1f,%eax
c000254b:	c1 e8 1a             	shr    $0x1a,%eax
c000254e:	01 c2                	add    %eax,%edx
c0002550:	83 e2 3f             	and    $0x3f,%edx
c0002553:	29 c2                	sub    %eax,%edx
c0002555:	89 d0                	mov    %edx,%eax
c0002557:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000255a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000255d:	c1 e8 09             	shr    $0x9,%eax
c0002560:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002563:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002567:	7f 1a                	jg     c0002583 <hd_rdwt+0x8e>
c0002569:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000256c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000256f:	c1 e2 03             	shl    $0x3,%edx
c0002572:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002578:	01 d0                	add    %edx,%eax
c000257a:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000257f:	8b 00                	mov    (%eax),%eax
c0002581:	eb 1b                	jmp    c000259e <hd_rdwt+0xa9>
c0002583:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002586:	8d 50 04             	lea    0x4(%eax),%edx
c0002589:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000258c:	c1 e2 03             	shl    $0x3,%edx
c000258f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002595:	01 d0                	add    %edx,%eax
c0002597:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000259c:	8b 00                	mov    (%eax),%eax
c000259e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00025a1:	01 d0                	add    %edx,%eax
c00025a3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00025a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00025a9:	8b 40 0c             	mov    0xc(%eax),%eax
c00025ac:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00025af:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025b2:	05 ff 01 00 00       	add    $0x1ff,%eax
c00025b7:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00025bd:	85 c0                	test   %eax,%eax
c00025bf:	0f 48 c2             	cmovs  %edx,%eax
c00025c2:	c1 f8 09             	sar    $0x9,%eax
c00025c5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00025c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00025ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00025d1:	8b 40 10             	mov    0x10(%eax),%eax
c00025d4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00025d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00025da:	8b 00                	mov    (%eax),%eax
c00025dc:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00025df:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025e2:	83 ec 08             	sub    $0x8,%esp
c00025e5:	50                   	push   %eax
c00025e6:	ff 75 d0             	pushl  -0x30(%ebp)
c00025e9:	e8 0e 49 00 00       	call   c0006efc <alloc_virtual_memory>
c00025ee:	83 c4 10             	add    $0x10,%esp
c00025f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00025f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00025f7:	8b 40 68             	mov    0x68(%eax),%eax
c00025fa:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00025fd:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002601:	74 22                	je     c0002625 <hd_rdwt+0x130>
c0002603:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002607:	74 1c                	je     c0002625 <hd_rdwt+0x130>
c0002609:	68 b3 01 00 00       	push   $0x1b3
c000260e:	68 a4 b4 00 c0       	push   $0xc000b4a4
c0002613:	68 a4 b4 00 c0       	push   $0xc000b4a4
c0002618:	68 66 b5 00 c0       	push   $0xc000b566
c000261d:	e8 28 75 00 00       	call   c0009b4a <assertion_failure>
c0002622:	83 c4 10             	add    $0x10,%esp
c0002625:	c6 45 b9 00          	movb   $0x0,-0x47(%ebp)
c0002629:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000262c:	88 45 ba             	mov    %al,-0x46(%ebp)
c000262f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002632:	88 45 bb             	mov    %al,-0x45(%ebp)
c0002635:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002638:	c1 f8 08             	sar    $0x8,%eax
c000263b:	88 45 bc             	mov    %al,-0x44(%ebp)
c000263e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002641:	c1 f8 10             	sar    $0x10,%eax
c0002644:	88 45 bd             	mov    %al,-0x43(%ebp)
c0002647:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000264a:	c1 f8 18             	sar    $0x18,%eax
c000264d:	83 e0 0f             	and    $0xf,%eax
c0002650:	83 c8 e0             	or     $0xffffffe0,%eax
c0002653:	88 45 be             	mov    %al,-0x42(%ebp)
c0002656:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000265a:	75 07                	jne    c0002663 <hd_rdwt+0x16e>
c000265c:	b8 20 00 00 00       	mov    $0x20,%eax
c0002661:	eb 05                	jmp    c0002668 <hd_rdwt+0x173>
c0002663:	b8 30 00 00 00       	mov    $0x30,%eax
c0002668:	88 45 bf             	mov    %al,-0x41(%ebp)
c000266b:	0f b6 45 bf          	movzbl -0x41(%ebp),%eax
c000266f:	3c 20                	cmp    $0x20,%al
c0002671:	74 24                	je     c0002697 <hd_rdwt+0x1a2>
c0002673:	0f b6 45 bf          	movzbl -0x41(%ebp),%eax
c0002677:	3c 30                	cmp    $0x30,%al
c0002679:	74 1c                	je     c0002697 <hd_rdwt+0x1a2>
c000267b:	68 c1 01 00 00       	push   $0x1c1
c0002680:	68 a4 b4 00 c0       	push   $0xc000b4a4
c0002685:	68 a4 b4 00 c0       	push   $0xc000b4a4
c000268a:	68 84 b5 00 c0       	push   $0xc000b584
c000268f:	e8 b6 74 00 00       	call   c0009b4a <assertion_failure>
c0002694:	83 c4 10             	add    $0x10,%esp
c0002697:	83 ec 0c             	sub    $0xc,%esp
c000269a:	8d 45 b9             	lea    -0x47(%ebp),%eax
c000269d:	50                   	push   %eax
c000269e:	e8 ec f5 ff ff       	call   c0001c8f <hd_cmd_out>
c00026a3:	83 c4 10             	add    $0x10,%esp
c00026a6:	e9 ae 00 00 00       	jmp    c0002759 <hd_rdwt+0x264>
c00026ab:	b8 00 02 00 00       	mov    $0x200,%eax
c00026b0:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00026b7:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00026bb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00026be:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00026c2:	75 63                	jne    c0002727 <hd_rdwt+0x232>
c00026c4:	e8 aa fd ff ff       	call   c0002473 <wait_for>
c00026c9:	e8 d6 fd ff ff       	call   c00024a4 <interrupt_wait>
c00026ce:	83 ec 08             	sub    $0x8,%esp
c00026d1:	6a 0e                	push   $0xe
c00026d3:	68 b8 b5 00 c0       	push   $0xc000b5b8
c00026d8:	e8 ea ee ff ff       	call   c00015c7 <disp_str_colour>
c00026dd:	83 c4 10             	add    $0x10,%esp
c00026e0:	83 ec 04             	sub    $0x4,%esp
c00026e3:	ff 75 c4             	pushl  -0x3c(%ebp)
c00026e6:	6a 00                	push   $0x0
c00026e8:	68 80 21 01 c0       	push   $0xc0012180
c00026ed:	e8 59 9b 00 00       	call   c000c24b <Memset>
c00026f2:	83 c4 10             	add    $0x10,%esp
c00026f5:	83 ec 04             	sub    $0x4,%esp
c00026f8:	68 00 02 00 00       	push   $0x200
c00026fd:	68 80 21 01 c0       	push   $0xc0012180
c0002702:	68 f0 01 00 00       	push   $0x1f0
c0002707:	e8 93 9b 00 00       	call   c000c29f <read_port>
c000270c:	83 c4 10             	add    $0x10,%esp
c000270f:	83 ec 04             	sub    $0x4,%esp
c0002712:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002715:	68 80 21 01 c0       	push   $0xc0012180
c000271a:	ff 75 f0             	pushl  -0x10(%ebp)
c000271d:	e8 43 54 00 00       	call   c0007b65 <Memcpy>
c0002722:	83 c4 10             	add    $0x10,%esp
c0002725:	eb 26                	jmp    c000274d <hd_rdwt+0x258>
c0002727:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000272b:	75 20                	jne    c000274d <hd_rdwt+0x258>
c000272d:	e8 41 fd ff ff       	call   c0002473 <wait_for>
c0002732:	83 ec 04             	sub    $0x4,%esp
c0002735:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002738:	ff 75 f0             	pushl  -0x10(%ebp)
c000273b:	68 f0 01 00 00       	push   $0x1f0
c0002740:	e8 6e 9b 00 00       	call   c000c2b3 <write_port>
c0002745:	83 c4 10             	add    $0x10,%esp
c0002748:	e8 57 fd ff ff       	call   c00024a4 <interrupt_wait>
c000274d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002750:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002753:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002756:	01 45 f0             	add    %eax,-0x10(%ebp)
c0002759:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000275d:	0f 85 48 ff ff ff    	jne    c00026ab <hd_rdwt+0x1b6>
c0002763:	83 ec 0c             	sub    $0xc,%esp
c0002766:	6a 6c                	push   $0x6c
c0002768:	e8 57 02 00 00       	call   c00029c4 <sys_malloc>
c000276d:	83 c4 10             	add    $0x10,%esp
c0002770:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0002773:	83 ec 04             	sub    $0x4,%esp
c0002776:	6a 6c                	push   $0x6c
c0002778:	6a 00                	push   $0x0
c000277a:	ff 75 c0             	pushl  -0x40(%ebp)
c000277d:	e8 c9 9a 00 00       	call   c000c24b <Memset>
c0002782:	83 c4 10             	add    $0x10,%esp
c0002785:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0002788:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000278f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0002792:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0002799:	83 ec 04             	sub    $0x4,%esp
c000279c:	6a 02                	push   $0x2
c000279e:	ff 75 c0             	pushl  -0x40(%ebp)
c00027a1:	6a 01                	push   $0x1
c00027a3:	e8 ce 7c 00 00       	call   c000a476 <send_rec>
c00027a8:	83 c4 10             	add    $0x10,%esp
c00027ab:	90                   	nop
c00027ac:	c9                   	leave  
c00027ad:	c3                   	ret    

c00027ae <hd_handler>:
c00027ae:	55                   	push   %ebp
c00027af:	89 e5                	mov    %esp,%ebp
c00027b1:	83 ec 18             	sub    $0x18,%esp
c00027b4:	83 ec 0c             	sub    $0xc,%esp
c00027b7:	68 f7 01 00 00       	push   $0x1f7
c00027bc:	e8 cc ef ff ff       	call   c000178d <in_byte>
c00027c1:	83 c4 10             	add    $0x10,%esp
c00027c4:	0f b6 c0             	movzbl %al,%eax
c00027c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00027ca:	83 ec 0c             	sub    $0xc,%esp
c00027cd:	6a 03                	push   $0x3
c00027cf:	e8 31 7f 00 00       	call   c000a705 <inform_int>
c00027d4:	83 c4 10             	add    $0x10,%esp
c00027d7:	90                   	nop
c00027d8:	c9                   	leave  
c00027d9:	c3                   	ret    

c00027da <waitfor>:
c00027da:	55                   	push   %ebp
c00027db:	89 e5                	mov    %esp,%ebp
c00027dd:	83 ec 18             	sub    $0x18,%esp
c00027e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00027e7:	eb 26                	jmp    c000280f <waitfor+0x35>
c00027e9:	83 ec 0c             	sub    $0xc,%esp
c00027ec:	68 f7 01 00 00       	push   $0x1f7
c00027f1:	e8 97 ef ff ff       	call   c000178d <in_byte>
c00027f6:	83 c4 10             	add    $0x10,%esp
c00027f9:	0f b6 c0             	movzbl %al,%eax
c00027fc:	23 45 08             	and    0x8(%ebp),%eax
c00027ff:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0002802:	75 07                	jne    c000280b <waitfor+0x31>
c0002804:	b8 01 00 00 00       	mov    $0x1,%eax
c0002809:	eb 11                	jmp    c000281c <waitfor+0x42>
c000280b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000280f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002812:	3b 45 10             	cmp    0x10(%ebp),%eax
c0002815:	7c d2                	jl     c00027e9 <waitfor+0xf>
c0002817:	b8 00 00 00 00       	mov    $0x0,%eax
c000281c:	c9                   	leave  
c000281d:	c3                   	ret    

c000281e <print_hd_info>:
c000281e:	55                   	push   %ebp
c000281f:	89 e5                	mov    %esp,%ebp
c0002821:	83 ec 18             	sub    $0x18,%esp
c0002824:	83 ec 0c             	sub    $0xc,%esp
c0002827:	68 ba b5 00 c0       	push   $0xc000b5ba
c000282c:	e8 bc 6f 00 00       	call   c00097ed <Printf>
c0002831:	83 c4 10             	add    $0x10,%esp
c0002834:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000283b:	eb 3b                	jmp    c0002878 <print_hd_info+0x5a>
c000283d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002840:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c0002847:	85 c0                	test   %eax,%eax
c0002849:	74 28                	je     c0002873 <print_hd_info+0x55>
c000284b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000284e:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c0002855:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002858:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c000285f:	ff 75 f4             	pushl  -0xc(%ebp)
c0002862:	52                   	push   %edx
c0002863:	50                   	push   %eax
c0002864:	68 d7 b5 00 c0       	push   $0xc000b5d7
c0002869:	e8 7f 6f 00 00       	call   c00097ed <Printf>
c000286e:	83 c4 10             	add    $0x10,%esp
c0002871:	eb 01                	jmp    c0002874 <print_hd_info+0x56>
c0002873:	90                   	nop
c0002874:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002878:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c000287c:	7e bf                	jle    c000283d <print_hd_info+0x1f>
c000287e:	83 ec 0c             	sub    $0xc,%esp
c0002881:	68 ef b5 00 c0       	push   $0xc000b5ef
c0002886:	e8 62 6f 00 00       	call   c00097ed <Printf>
c000288b:	83 c4 10             	add    $0x10,%esp
c000288e:	83 ec 0c             	sub    $0xc,%esp
c0002891:	68 0a b6 00 c0       	push   $0xc000b60a
c0002896:	e8 52 6f 00 00       	call   c00097ed <Printf>
c000289b:	83 c4 10             	add    $0x10,%esp
c000289e:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c00028a5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00028ac:	eb 44                	jmp    c00028f2 <print_hd_info+0xd4>
c00028ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028b1:	83 c0 04             	add    $0x4,%eax
c00028b4:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00028bb:	85 c0                	test   %eax,%eax
c00028bd:	74 2e                	je     c00028ed <print_hd_info+0xcf>
c00028bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028c2:	83 c0 04             	add    $0x4,%eax
c00028c5:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00028cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028cf:	83 c0 04             	add    $0x4,%eax
c00028d2:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00028d9:	ff 75 f0             	pushl  -0x10(%ebp)
c00028dc:	52                   	push   %edx
c00028dd:	50                   	push   %eax
c00028de:	68 d7 b5 00 c0       	push   $0xc000b5d7
c00028e3:	e8 05 6f 00 00       	call   c00097ed <Printf>
c00028e8:	83 c4 10             	add    $0x10,%esp
c00028eb:	eb 01                	jmp    c00028ee <print_hd_info+0xd0>
c00028ed:	90                   	nop
c00028ee:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00028f2:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00028f6:	7e b6                	jle    c00028ae <print_hd_info+0x90>
c00028f8:	83 ec 0c             	sub    $0xc,%esp
c00028fb:	68 27 b6 00 c0       	push   $0xc000b627
c0002900:	e8 e8 6e 00 00       	call   c00097ed <Printf>
c0002905:	83 c4 10             	add    $0x10,%esp
c0002908:	90                   	nop
c0002909:	c9                   	leave  
c000290a:	c3                   	ret    

c000290b <is_empty>:
c000290b:	55                   	push   %ebp
c000290c:	89 e5                	mov    %esp,%ebp
c000290e:	83 ec 10             	sub    $0x10,%esp
c0002911:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0002918:	eb 1a                	jmp    c0002934 <is_empty+0x29>
c000291a:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000291d:	8b 45 08             	mov    0x8(%ebp),%eax
c0002920:	01 d0                	add    %edx,%eax
c0002922:	0f b6 00             	movzbl (%eax),%eax
c0002925:	84 c0                	test   %al,%al
c0002927:	74 07                	je     c0002930 <is_empty+0x25>
c0002929:	b8 00 00 00 00       	mov    $0x0,%eax
c000292e:	eb 11                	jmp    c0002941 <is_empty+0x36>
c0002930:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0002934:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0002937:	3b 45 0c             	cmp    0xc(%ebp),%eax
c000293a:	7c de                	jl     c000291a <is_empty+0xf>
c000293c:	b8 01 00 00 00       	mov    $0x1,%eax
c0002941:	c9                   	leave  
c0002942:	c3                   	ret    
c0002943:	66 90                	xchg   %ax,%ax
c0002945:	66 90                	xchg   %ax,%ax
c0002947:	66 90                	xchg   %ax,%ax
c0002949:	66 90                	xchg   %ax,%ax
c000294b:	66 90                	xchg   %ax,%ax
c000294d:	66 90                	xchg   %ax,%ax
c000294f:	90                   	nop

c0002950 <get_ticks>:
c0002950:	b8 00 00 00 00       	mov    $0x0,%eax
c0002955:	cd 90                	int    $0x90
c0002957:	c3                   	ret    

c0002958 <write2>:
c0002958:	b8 01 00 00 00       	mov    $0x1,%eax
c000295d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002961:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002965:	cd 90                	int    $0x90
c0002967:	c3                   	ret    

c0002968 <write_debug>:
c0002968:	b8 02 00 00 00       	mov    $0x2,%eax
c000296d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002971:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002975:	cd 90                	int    $0x90
c0002977:	c3                   	ret    

c0002978 <send_msg2>:
c0002978:	b8 03 00 00 00       	mov    $0x3,%eax
c000297d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002981:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002985:	cd 90                	int    $0x90
c0002987:	c3                   	ret    

c0002988 <send_msg>:
c0002988:	55                   	push   %ebp
c0002989:	89 e5                	mov    %esp,%ebp
c000298b:	53                   	push   %ebx
c000298c:	51                   	push   %ecx
c000298d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002992:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002995:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002998:	cd 90                	int    $0x90
c000299a:	59                   	pop    %ecx
c000299b:	5b                   	pop    %ebx
c000299c:	5d                   	pop    %ebp
c000299d:	c3                   	ret    

c000299e <receive_msg2>:
c000299e:	b8 04 00 00 00       	mov    $0x4,%eax
c00029a3:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00029a7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00029ab:	cd 90                	int    $0x90
c00029ad:	c3                   	ret    

c00029ae <receive_msg>:
c00029ae:	55                   	push   %ebp
c00029af:	89 e5                	mov    %esp,%ebp
c00029b1:	53                   	push   %ebx
c00029b2:	51                   	push   %ecx
c00029b3:	b8 04 00 00 00       	mov    $0x4,%eax
c00029b8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00029bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00029be:	cd 90                	int    $0x90
c00029c0:	59                   	pop    %ecx
c00029c1:	5b                   	pop    %ebx
c00029c2:	5d                   	pop    %ebp
c00029c3:	c3                   	ret    

c00029c4 <sys_malloc>:
c00029c4:	56                   	push   %esi
c00029c5:	57                   	push   %edi
c00029c6:	53                   	push   %ebx
c00029c7:	55                   	push   %ebp
c00029c8:	89 e5                	mov    %esp,%ebp
c00029ca:	b8 05 00 00 00       	mov    $0x5,%eax
c00029cf:	8b 4d 14             	mov    0x14(%ebp),%ecx
c00029d2:	cd 90                	int    $0x90
c00029d4:	5d                   	pop    %ebp
c00029d5:	5b                   	pop    %ebx
c00029d6:	5f                   	pop    %edi
c00029d7:	5e                   	pop    %esi
c00029d8:	c3                   	ret    

c00029d9 <task_fs>:
c00029d9:	55                   	push   %ebp
c00029da:	89 e5                	mov    %esp,%ebp
c00029dc:	83 ec 28             	sub    $0x28,%esp
c00029df:	e8 bc 08 00 00       	call   c00032a0 <init_fs>
c00029e4:	83 ec 0c             	sub    $0xc,%esp
c00029e7:	6a 6c                	push   $0x6c
c00029e9:	e8 d6 ff ff ff       	call   c00029c4 <sys_malloc>
c00029ee:	83 c4 10             	add    $0x10,%esp
c00029f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00029f4:	83 ec 0c             	sub    $0xc,%esp
c00029f7:	6a 6c                	push   $0x6c
c00029f9:	e8 c6 ff ff ff       	call   c00029c4 <sys_malloc>
c00029fe:	83 c4 10             	add    $0x10,%esp
c0002a01:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002a04:	83 ec 04             	sub    $0x4,%esp
c0002a07:	6a 6c                	push   $0x6c
c0002a09:	6a 00                	push   $0x0
c0002a0b:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a0e:	e8 38 98 00 00       	call   c000c24b <Memset>
c0002a13:	83 c4 10             	add    $0x10,%esp
c0002a16:	83 ec 04             	sub    $0x4,%esp
c0002a19:	6a 12                	push   $0x12
c0002a1b:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a1e:	6a 02                	push   $0x2
c0002a20:	e8 51 7a 00 00       	call   c000a476 <send_rec>
c0002a25:	83 c4 10             	add    $0x10,%esp
c0002a28:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a2b:	8b 40 68             	mov    0x68(%eax),%eax
c0002a2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002a31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a34:	8b 00                	mov    (%eax),%eax
c0002a36:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002a39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a3c:	8b 40 40             	mov    0x40(%eax),%eax
c0002a3f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a45:	8b 40 58             	mov    0x58(%eax),%eax
c0002a48:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a4e:	8b 00                	mov    (%eax),%eax
c0002a50:	85 c0                	test   %eax,%eax
c0002a52:	75 07                	jne    c0002a5b <task_fs+0x82>
c0002a54:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0002a5b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0002a62:	83 ec 0c             	sub    $0xc,%esp
c0002a65:	ff 75 e8             	pushl  -0x18(%ebp)
c0002a68:	e8 39 21 00 00       	call   c0004ba6 <pid2proc>
c0002a6d:	83 c4 10             	add    $0x10,%esp
c0002a70:	a3 c8 0b 01 c0       	mov    %eax,0xc0010bc8
c0002a75:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002a79:	74 37                	je     c0002ab2 <task_fs+0xd9>
c0002a7b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002a7f:	74 31                	je     c0002ab2 <task_fs+0xd9>
c0002a81:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002a85:	74 2b                	je     c0002ab2 <task_fs+0xd9>
c0002a87:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002a8b:	74 25                	je     c0002ab2 <task_fs+0xd9>
c0002a8d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0002a91:	74 1f                	je     c0002ab2 <task_fs+0xd9>
c0002a93:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0002a97:	74 19                	je     c0002ab2 <task_fs+0xd9>
c0002a99:	6a 7a                	push   $0x7a
c0002a9b:	68 48 b6 00 c0       	push   $0xc000b648
c0002aa0:	68 48 b6 00 c0       	push   $0xc000b648
c0002aa5:	68 58 b6 00 c0       	push   $0xc000b658
c0002aaa:	e8 9b 70 00 00       	call   c0009b4a <assertion_failure>
c0002aaf:	83 c4 10             	add    $0x10,%esp
c0002ab2:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002ab6:	74 3a                	je     c0002af2 <task_fs+0x119>
c0002ab8:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002abc:	7f 19                	jg     c0002ad7 <task_fs+0xfe>
c0002abe:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002ac2:	0f 84 10 01 00 00    	je     c0002bd8 <task_fs+0x1ff>
c0002ac8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0002acc:	0f 84 a1 00 00 00    	je     c0002b73 <task_fs+0x19a>
c0002ad2:	e9 ef 00 00 00       	jmp    c0002bc6 <task_fs+0x1ed>
c0002ad7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0002adb:	74 50                	je     c0002b2d <task_fs+0x154>
c0002add:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002ae1:	0f 84 c6 00 00 00    	je     c0002bad <task_fs+0x1d4>
c0002ae7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002aeb:	74 40                	je     c0002b2d <task_fs+0x154>
c0002aed:	e9 d4 00 00 00       	jmp    c0002bc6 <task_fs+0x1ed>
c0002af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002af5:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002afc:	83 ec 0c             	sub    $0xc,%esp
c0002aff:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b02:	e8 ee 07 00 00       	call   c00032f5 <do_open>
c0002b07:	83 c4 10             	add    $0x10,%esp
c0002b0a:	89 c2                	mov    %eax,%edx
c0002b0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b0f:	89 50 40             	mov    %edx,0x40(%eax)
c0002b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b15:	8b 00                	mov    (%eax),%eax
c0002b17:	83 ec 04             	sub    $0x4,%esp
c0002b1a:	50                   	push   %eax
c0002b1b:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b1e:	6a 01                	push   $0x1
c0002b20:	e8 51 79 00 00       	call   c000a476 <send_rec>
c0002b25:	83 c4 10             	add    $0x10,%esp
c0002b28:	e9 b2 00 00 00       	jmp    c0002bdf <task_fs+0x206>
c0002b2d:	83 ec 0c             	sub    $0xc,%esp
c0002b30:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b33:	e8 fb 18 00 00       	call   c0004433 <do_rdwt>
c0002b38:	83 c4 10             	add    $0x10,%esp
c0002b3b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002b3e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0002b42:	0f 84 96 00 00 00    	je     c0002bde <task_fs+0x205>
c0002b48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b4b:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002b52:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002b55:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b58:	89 50 50             	mov    %edx,0x50(%eax)
c0002b5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b5e:	8b 00                	mov    (%eax),%eax
c0002b60:	83 ec 04             	sub    $0x4,%esp
c0002b63:	50                   	push   %eax
c0002b64:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b67:	6a 01                	push   $0x1
c0002b69:	e8 08 79 00 00       	call   c000a476 <send_rec>
c0002b6e:	83 c4 10             	add    $0x10,%esp
c0002b71:	eb 6b                	jmp    c0002bde <task_fs+0x205>
c0002b73:	83 ec 0c             	sub    $0xc,%esp
c0002b76:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002b79:	e8 d2 1d 00 00       	call   c0004950 <do_close>
c0002b7e:	83 c4 10             	add    $0x10,%esp
c0002b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b84:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002b8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b8e:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c0002b95:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b98:	8b 00                	mov    (%eax),%eax
c0002b9a:	83 ec 04             	sub    $0x4,%esp
c0002b9d:	50                   	push   %eax
c0002b9e:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ba1:	6a 01                	push   $0x1
c0002ba3:	e8 ce 78 00 00       	call   c000a476 <send_rec>
c0002ba8:	83 c4 10             	add    $0x10,%esp
c0002bab:	eb 32                	jmp    c0002bdf <task_fs+0x206>
c0002bad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bb0:	8b 40 58             	mov    0x58(%eax),%eax
c0002bb3:	83 ec 04             	sub    $0x4,%esp
c0002bb6:	50                   	push   %eax
c0002bb7:	ff 75 f4             	pushl  -0xc(%ebp)
c0002bba:	6a 01                	push   $0x1
c0002bbc:	e8 b5 78 00 00       	call   c000a476 <send_rec>
c0002bc1:	83 c4 10             	add    $0x10,%esp
c0002bc4:	eb 19                	jmp    c0002bdf <task_fs+0x206>
c0002bc6:	83 ec 0c             	sub    $0xc,%esp
c0002bc9:	68 bb b6 00 c0       	push   $0xc000b6bb
c0002bce:	e8 59 6f 00 00       	call   c0009b2c <panic>
c0002bd3:	83 c4 10             	add    $0x10,%esp
c0002bd6:	eb 07                	jmp    c0002bdf <task_fs+0x206>
c0002bd8:	90                   	nop
c0002bd9:	e9 26 fe ff ff       	jmp    c0002a04 <task_fs+0x2b>
c0002bde:	90                   	nop
c0002bdf:	e9 20 fe ff ff       	jmp    c0002a04 <task_fs+0x2b>

c0002be4 <rd_wt>:
c0002be4:	55                   	push   %ebp
c0002be5:	89 e5                	mov    %esp,%ebp
c0002be7:	83 ec 18             	sub    $0x18,%esp
c0002bea:	83 ec 0c             	sub    $0xc,%esp
c0002bed:	6a 6c                	push   $0x6c
c0002bef:	e8 d0 fd ff ff       	call   c00029c4 <sys_malloc>
c0002bf4:	83 c4 10             	add    $0x10,%esp
c0002bf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002bfa:	83 ec 04             	sub    $0x4,%esp
c0002bfd:	6a 6c                	push   $0x6c
c0002bff:	6a 00                	push   $0x0
c0002c01:	ff 75 f4             	pushl  -0xc(%ebp)
c0002c04:	e8 42 96 00 00       	call   c000c24b <Memset>
c0002c09:	83 c4 10             	add    $0x10,%esp
c0002c0c:	8b 55 18             	mov    0x18(%ebp),%edx
c0002c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c12:	89 50 68             	mov    %edx,0x68(%eax)
c0002c15:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002c18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c1b:	89 50 14             	mov    %edx,0x14(%eax)
c0002c1e:	8b 55 10             	mov    0x10(%ebp),%edx
c0002c21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c24:	89 50 10             	mov    %edx,0x10(%eax)
c0002c27:	8b 55 14             	mov    0x14(%ebp),%edx
c0002c2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c2d:	89 50 0c             	mov    %edx,0xc(%eax)
c0002c30:	8b 45 08             	mov    0x8(%ebp),%eax
c0002c33:	c1 e0 09             	shl    $0x9,%eax
c0002c36:	89 c2                	mov    %eax,%edx
c0002c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c3b:	89 50 18             	mov    %edx,0x18(%eax)
c0002c3e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002c42:	74 22                	je     c0002c66 <rd_wt+0x82>
c0002c44:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002c48:	74 1c                	je     c0002c66 <rd_wt+0x82>
c0002c4a:	68 b1 00 00 00       	push   $0xb1
c0002c4f:	68 48 b6 00 c0       	push   $0xc000b648
c0002c54:	68 48 b6 00 c0       	push   $0xc000b648
c0002c59:	68 ce b6 00 c0       	push   $0xc000b6ce
c0002c5e:	e8 e7 6e 00 00       	call   c0009b4a <assertion_failure>
c0002c63:	83 c4 10             	add    $0x10,%esp
c0002c66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c69:	8b 40 68             	mov    0x68(%eax),%eax
c0002c6c:	83 f8 07             	cmp    $0x7,%eax
c0002c6f:	74 27                	je     c0002c98 <rd_wt+0xb4>
c0002c71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c74:	8b 40 68             	mov    0x68(%eax),%eax
c0002c77:	83 f8 0a             	cmp    $0xa,%eax
c0002c7a:	74 1c                	je     c0002c98 <rd_wt+0xb4>
c0002c7c:	68 b2 00 00 00       	push   $0xb2
c0002c81:	68 48 b6 00 c0       	push   $0xc000b648
c0002c86:	68 48 b6 00 c0       	push   $0xc000b648
c0002c8b:	68 ec b6 00 c0       	push   $0xc000b6ec
c0002c90:	e8 b5 6e 00 00       	call   c0009b4a <assertion_failure>
c0002c95:	83 c4 10             	add    $0x10,%esp
c0002c98:	83 ec 04             	sub    $0x4,%esp
c0002c9b:	6a 03                	push   $0x3
c0002c9d:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ca0:	6a 03                	push   $0x3
c0002ca2:	e8 cf 77 00 00       	call   c000a476 <send_rec>
c0002ca7:	83 c4 10             	add    $0x10,%esp
c0002caa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002cad:	83 ec 08             	sub    $0x8,%esp
c0002cb0:	6a 6c                	push   $0x6c
c0002cb2:	50                   	push   %eax
c0002cb3:	e8 0c 48 00 00       	call   c00074c4 <sys_free>
c0002cb8:	83 c4 10             	add    $0x10,%esp
c0002cbb:	90                   	nop
c0002cbc:	c9                   	leave  
c0002cbd:	c3                   	ret    

c0002cbe <mkfs>:
c0002cbe:	55                   	push   %ebp
c0002cbf:	89 e5                	mov    %esp,%ebp
c0002cc1:	57                   	push   %edi
c0002cc2:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002cc8:	83 ec 0c             	sub    $0xc,%esp
c0002ccb:	68 00 80 00 00       	push   $0x8000
c0002cd0:	e8 ef fc ff ff       	call   c00029c4 <sys_malloc>
c0002cd5:	83 c4 10             	add    $0x10,%esp
c0002cd8:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002cdd:	83 ec 0c             	sub    $0xc,%esp
c0002ce0:	6a 24                	push   $0x24
c0002ce2:	e8 dd fc ff ff       	call   c00029c4 <sys_malloc>
c0002ce7:	83 c4 10             	add    $0x10,%esp
c0002cea:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002cef:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cf4:	83 ec 0c             	sub    $0xc,%esp
c0002cf7:	50                   	push   %eax
c0002cf8:	e8 c6 42 00 00       	call   c0006fc3 <get_physical_address>
c0002cfd:	83 c4 10             	add    $0x10,%esp
c0002d00:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002d05:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002d0a:	83 ec 0c             	sub    $0xc,%esp
c0002d0d:	50                   	push   %eax
c0002d0e:	e8 b0 42 00 00       	call   c0006fc3 <get_physical_address>
c0002d13:	83 c4 10             	add    $0x10,%esp
c0002d16:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002d1b:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d20:	83 ec 04             	sub    $0x4,%esp
c0002d23:	68 00 02 00 00       	push   $0x200
c0002d28:	6a 00                	push   $0x0
c0002d2a:	50                   	push   %eax
c0002d2b:	e8 1b 95 00 00       	call   c000c24b <Memset>
c0002d30:	83 c4 10             	add    $0x10,%esp
c0002d33:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d38:	83 ec 0c             	sub    $0xc,%esp
c0002d3b:	6a 0a                	push   $0xa
c0002d3d:	68 00 02 00 00       	push   $0x200
c0002d42:	50                   	push   %eax
c0002d43:	6a 20                	push   $0x20
c0002d45:	6a 00                	push   $0x0
c0002d47:	e8 98 fe ff ff       	call   c0002be4 <rd_wt>
c0002d4c:	83 c4 20             	add    $0x20,%esp
c0002d4f:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d54:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002d57:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d5a:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002d61:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d64:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002d6b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d6e:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002d75:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d78:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002d7f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d82:	8b 40 04             	mov    0x4(%eax),%eax
c0002d85:	8d 50 02             	lea    0x2(%eax),%edx
c0002d88:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d8b:	8b 40 08             	mov    0x8(%eax),%eax
c0002d8e:	01 c2                	add    %eax,%edx
c0002d90:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d93:	8b 40 0c             	mov    0xc(%eax),%eax
c0002d96:	01 c2                	add    %eax,%edx
c0002d98:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d9b:	89 10                	mov    %edx,(%eax)
c0002d9d:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002da4:	b8 00 02 00 00       	mov    $0x200,%eax
c0002da9:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002dac:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002db2:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002db5:	01 ca                	add    %ecx,%edx
c0002db7:	83 ec 04             	sub    $0x4,%esp
c0002dba:	50                   	push   %eax
c0002dbb:	6a 80                	push   $0xffffff80
c0002dbd:	52                   	push   %edx
c0002dbe:	e8 88 94 00 00       	call   c000c24b <Memset>
c0002dc3:	83 c4 10             	add    $0x10,%esp
c0002dc6:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002dcb:	83 ec 0c             	sub    $0xc,%esp
c0002dce:	6a 0a                	push   $0xa
c0002dd0:	68 00 02 00 00       	push   $0x200
c0002dd5:	50                   	push   %eax
c0002dd6:	6a 20                	push   $0x20
c0002dd8:	6a 01                	push   $0x1
c0002dda:	e8 05 fe ff ff       	call   c0002be4 <rd_wt>
c0002ddf:	83 c4 20             	add    $0x20,%esp
c0002de2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002de5:	8b 10                	mov    (%eax),%edx
c0002de7:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002dea:	8b 50 04             	mov    0x4(%eax),%edx
c0002ded:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002df0:	8b 50 08             	mov    0x8(%eax),%edx
c0002df3:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002df6:	8b 50 0c             	mov    0xc(%eax),%edx
c0002df9:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002dfc:	8b 50 10             	mov    0x10(%eax),%edx
c0002dff:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002e02:	8b 50 14             	mov    0x14(%eax),%edx
c0002e05:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002e08:	8b 50 18             	mov    0x18(%eax),%edx
c0002e0b:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002e0e:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002e11:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002e14:	8b 40 20             	mov    0x20(%eax),%eax
c0002e17:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002e1a:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002e1e:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002e22:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e27:	83 ec 04             	sub    $0x4,%esp
c0002e2a:	6a 01                	push   $0x1
c0002e2c:	52                   	push   %edx
c0002e2d:	50                   	push   %eax
c0002e2e:	e8 18 94 00 00       	call   c000c24b <Memset>
c0002e33:	83 c4 10             	add    $0x10,%esp
c0002e36:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e3b:	83 c0 01             	add    $0x1,%eax
c0002e3e:	83 ec 04             	sub    $0x4,%esp
c0002e41:	68 ff 01 00 00       	push   $0x1ff
c0002e46:	6a 80                	push   $0xffffff80
c0002e48:	50                   	push   %eax
c0002e49:	e8 fd 93 00 00       	call   c000c24b <Memset>
c0002e4e:	83 c4 10             	add    $0x10,%esp
c0002e51:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e56:	83 ec 0c             	sub    $0xc,%esp
c0002e59:	6a 0a                	push   $0xa
c0002e5b:	68 00 02 00 00       	push   $0x200
c0002e60:	50                   	push   %eax
c0002e61:	6a 20                	push   $0x20
c0002e63:	6a 02                	push   $0x2
c0002e65:	e8 7a fd ff ff       	call   c0002be4 <rd_wt>
c0002e6a:	83 c4 20             	add    $0x20,%esp
c0002e6d:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002e74:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e79:	83 ec 04             	sub    $0x4,%esp
c0002e7c:	68 00 02 00 00       	push   $0x200
c0002e81:	6a ff                	push   $0xffffffff
c0002e83:	50                   	push   %eax
c0002e84:	e8 c2 93 00 00       	call   c000c24b <Memset>
c0002e89:	83 c4 10             	add    $0x10,%esp
c0002e8c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e91:	83 ec 0c             	sub    $0xc,%esp
c0002e94:	6a 0a                	push   $0xa
c0002e96:	68 00 02 00 00       	push   $0x200
c0002e9b:	50                   	push   %eax
c0002e9c:	6a 20                	push   $0x20
c0002e9e:	ff 75 d0             	pushl  -0x30(%ebp)
c0002ea1:	e8 3e fd ff ff       	call   c0002be4 <rd_wt>
c0002ea6:	83 c4 20             	add    $0x20,%esp
c0002ea9:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002eae:	83 ec 04             	sub    $0x4,%esp
c0002eb1:	6a 01                	push   $0x1
c0002eb3:	6a 01                	push   $0x1
c0002eb5:	50                   	push   %eax
c0002eb6:	e8 90 93 00 00       	call   c000c24b <Memset>
c0002ebb:	83 c4 10             	add    $0x10,%esp
c0002ebe:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ec3:	83 c0 01             	add    $0x1,%eax
c0002ec6:	83 ec 04             	sub    $0x4,%esp
c0002ec9:	68 ff 01 00 00       	push   $0x1ff
c0002ece:	6a 00                	push   $0x0
c0002ed0:	50                   	push   %eax
c0002ed1:	e8 75 93 00 00       	call   c000c24b <Memset>
c0002ed6:	83 c4 10             	add    $0x10,%esp
c0002ed9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ede:	89 c2                	mov    %eax,%edx
c0002ee0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002ee3:	83 c0 01             	add    $0x1,%eax
c0002ee6:	83 ec 0c             	sub    $0xc,%esp
c0002ee9:	6a 0a                	push   $0xa
c0002eeb:	68 00 02 00 00       	push   $0x200
c0002ef0:	52                   	push   %edx
c0002ef1:	6a 20                	push   $0x20
c0002ef3:	50                   	push   %eax
c0002ef4:	e8 eb fc ff ff       	call   c0002be4 <rd_wt>
c0002ef9:	83 c4 20             	add    $0x20,%esp
c0002efc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002eff:	83 e8 02             	sub    $0x2,%eax
c0002f02:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002f05:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002f0c:	eb 04                	jmp    c0002f12 <mkfs+0x254>
c0002f0e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002f12:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002f15:	83 c0 01             	add    $0x1,%eax
c0002f18:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002f1b:	7e f1                	jle    c0002f0e <mkfs+0x250>
c0002f1d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f22:	89 c2                	mov    %eax,%edx
c0002f24:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002f27:	83 c0 03             	add    $0x3,%eax
c0002f2a:	83 ec 0c             	sub    $0xc,%esp
c0002f2d:	6a 0a                	push   $0xa
c0002f2f:	68 00 02 00 00       	push   $0x200
c0002f34:	52                   	push   %edx
c0002f35:	6a 20                	push   $0x20
c0002f37:	50                   	push   %eax
c0002f38:	e8 a7 fc ff ff       	call   c0002be4 <rd_wt>
c0002f3d:	83 c4 20             	add    $0x20,%esp
c0002f40:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f45:	89 c2                	mov    %eax,%edx
c0002f47:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002f4a:	83 c0 03             	add    $0x3,%eax
c0002f4d:	83 ec 0c             	sub    $0xc,%esp
c0002f50:	6a 07                	push   $0x7
c0002f52:	68 00 02 00 00       	push   $0x200
c0002f57:	52                   	push   %edx
c0002f58:	6a 20                	push   $0x20
c0002f5a:	50                   	push   %eax
c0002f5b:	e8 84 fc ff ff       	call   c0002be4 <rd_wt>
c0002f60:	83 c4 20             	add    $0x20,%esp
c0002f63:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002f68:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002f6b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f6e:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002f74:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f77:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002f7e:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002f81:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f84:	89 50 08             	mov    %edx,0x8(%eax)
c0002f87:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f8a:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002f91:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f94:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002f9b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f9e:	8b 10                	mov    (%eax),%edx
c0002fa0:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002fa6:	8b 50 04             	mov    0x4(%eax),%edx
c0002fa9:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002faf:	8b 50 08             	mov    0x8(%eax),%edx
c0002fb2:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002fb8:	8b 50 0c             	mov    0xc(%eax),%edx
c0002fbb:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002fc1:	8b 50 10             	mov    0x10(%eax),%edx
c0002fc4:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002fca:	8b 50 14             	mov    0x14(%eax),%edx
c0002fcd:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002fd3:	8b 50 18             	mov    0x18(%eax),%edx
c0002fd6:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002fdc:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002fdf:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002fe5:	8b 50 20             	mov    0x20(%eax),%edx
c0002fe8:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002fee:	8b 40 24             	mov    0x24(%eax),%eax
c0002ff1:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002ff6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002ffd:	eb 4c                	jmp    c000304b <mkfs+0x38d>
c0002fff:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003004:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003007:	83 c2 01             	add    $0x1,%edx
c000300a:	c1 e2 05             	shl    $0x5,%edx
c000300d:	01 d0                	add    %edx,%eax
c000300f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003012:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003015:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c000301b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000301e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0003025:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003028:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000302f:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0003036:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003039:	c1 e0 08             	shl    $0x8,%eax
c000303c:	0b 45 f0             	or     -0x10(%ebp),%eax
c000303f:	89 c2                	mov    %eax,%edx
c0003041:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003044:	89 50 08             	mov    %edx,0x8(%eax)
c0003047:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000304b:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c000304f:	7e ae                	jle    c0002fff <mkfs+0x341>
c0003051:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0003058:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c000305e:	b8 00 00 00 00       	mov    $0x0,%eax
c0003063:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0003068:	89 d7                	mov    %edx,%edi
c000306a:	f3 ab                	rep stos %eax,%es:(%edi)
c000306c:	c7 85 70 ff ff ff 14 	movl   $0xc000b714,-0x90(%ebp)
c0003073:	b7 00 c0 
c0003076:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000307d:	eb 54                	jmp    c00030d3 <mkfs+0x415>
c000307f:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003084:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003087:	83 c2 04             	add    $0x4,%edx
c000308a:	c1 e2 05             	shl    $0x5,%edx
c000308d:	01 d0                	add    %edx,%eax
c000308f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003092:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003095:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000309b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000309e:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c00030a5:	8b 45 98             	mov    -0x68(%ebp),%eax
c00030a8:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00030ab:	83 c2 01             	add    $0x1,%edx
c00030ae:	c1 e2 0b             	shl    $0xb,%edx
c00030b1:	01 c2                	add    %eax,%edx
c00030b3:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00030b6:	89 50 08             	mov    %edx,0x8(%eax)
c00030b9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00030bc:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c00030c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030c6:	8d 50 05             	lea    0x5(%eax),%edx
c00030c9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00030cc:	89 50 10             	mov    %edx,0x10(%eax)
c00030cf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00030d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030d6:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c00030d9:	7c a4                	jl     c000307f <mkfs+0x3c1>
c00030db:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00030e0:	89 c2                	mov    %eax,%edx
c00030e2:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00030e5:	83 c0 03             	add    $0x3,%eax
c00030e8:	83 ec 0c             	sub    $0xc,%esp
c00030eb:	6a 0a                	push   $0xa
c00030ed:	68 00 02 00 00       	push   $0x200
c00030f2:	52                   	push   %edx
c00030f3:	6a 20                	push   $0x20
c00030f5:	50                   	push   %eax
c00030f6:	e8 e9 fa ff ff       	call   c0002be4 <rd_wt>
c00030fb:	83 c4 20             	add    $0x20,%esp
c00030fe:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003103:	89 c2                	mov    %eax,%edx
c0003105:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003108:	83 ec 0c             	sub    $0xc,%esp
c000310b:	6a 07                	push   $0x7
c000310d:	68 00 02 00 00       	push   $0x200
c0003112:	52                   	push   %edx
c0003113:	6a 20                	push   $0x20
c0003115:	50                   	push   %eax
c0003116:	e8 c9 fa ff ff       	call   c0002be4 <rd_wt>
c000311b:	83 c4 20             	add    $0x20,%esp
c000311e:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0003125:	00 00 00 
c0003128:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c000312f:	2e 00 
c0003131:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003136:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0003139:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000313c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0003142:	83 ec 0c             	sub    $0xc,%esp
c0003145:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c000314b:	50                   	push   %eax
c000314c:	e8 33 91 00 00       	call   c000c284 <Strlen>
c0003151:	83 c4 10             	add    $0x10,%esp
c0003154:	89 c1                	mov    %eax,%ecx
c0003156:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003159:	8d 50 04             	lea    0x4(%eax),%edx
c000315c:	83 ec 04             	sub    $0x4,%esp
c000315f:	51                   	push   %ecx
c0003160:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0003166:	50                   	push   %eax
c0003167:	52                   	push   %edx
c0003168:	e8 f8 49 00 00       	call   c0007b65 <Memcpy>
c000316d:	83 c4 10             	add    $0x10,%esp
c0003170:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0003176:	b8 00 00 00 00       	mov    $0x0,%eax
c000317b:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0003180:	89 d7                	mov    %edx,%edi
c0003182:	f3 ab                	rep stos %eax,%es:(%edi)
c0003184:	c7 85 34 ff ff ff 20 	movl   $0xc000b720,-0xcc(%ebp)
c000318b:	b7 00 c0 
c000318e:	c7 85 38 ff ff ff 29 	movl   $0xc000b729,-0xc8(%ebp)
c0003195:	b7 00 c0 
c0003198:	c7 85 3c ff ff ff 32 	movl   $0xc000b732,-0xc4(%ebp)
c000319f:	b7 00 c0 
c00031a2:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c00031a9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00031b0:	eb 49                	jmp    c00031fb <mkfs+0x53d>
c00031b2:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c00031b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00031b9:	8d 50 02             	lea    0x2(%eax),%edx
c00031bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00031bf:	89 10                	mov    %edx,(%eax)
c00031c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00031c4:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c00031cb:	83 ec 0c             	sub    $0xc,%esp
c00031ce:	50                   	push   %eax
c00031cf:	e8 b0 90 00 00       	call   c000c284 <Strlen>
c00031d4:	83 c4 10             	add    $0x10,%esp
c00031d7:	89 c1                	mov    %eax,%ecx
c00031d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00031dc:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c00031e3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00031e6:	83 c2 04             	add    $0x4,%edx
c00031e9:	83 ec 04             	sub    $0x4,%esp
c00031ec:	51                   	push   %ecx
c00031ed:	50                   	push   %eax
c00031ee:	52                   	push   %edx
c00031ef:	e8 71 49 00 00       	call   c0007b65 <Memcpy>
c00031f4:	83 c4 10             	add    $0x10,%esp
c00031f7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00031fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00031fe:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0003201:	7c af                	jl     c00031b2 <mkfs+0x4f4>
c0003203:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000320a:	eb 66                	jmp    c0003272 <mkfs+0x5b4>
c000320c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000320f:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003216:	83 ec 0c             	sub    $0xc,%esp
c0003219:	50                   	push   %eax
c000321a:	e8 65 90 00 00       	call   c000c284 <Strlen>
c000321f:	83 c4 10             	add    $0x10,%esp
c0003222:	85 c0                	test   %eax,%eax
c0003224:	74 47                	je     c000326d <mkfs+0x5af>
c0003226:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c000322a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000322d:	8d 50 05             	lea    0x5(%eax),%edx
c0003230:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003233:	89 10                	mov    %edx,(%eax)
c0003235:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003238:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000323f:	83 ec 0c             	sub    $0xc,%esp
c0003242:	50                   	push   %eax
c0003243:	e8 3c 90 00 00       	call   c000c284 <Strlen>
c0003248:	83 c4 10             	add    $0x10,%esp
c000324b:	89 c1                	mov    %eax,%ecx
c000324d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003250:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003257:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000325a:	83 c2 04             	add    $0x4,%edx
c000325d:	83 ec 04             	sub    $0x4,%esp
c0003260:	51                   	push   %ecx
c0003261:	50                   	push   %eax
c0003262:	52                   	push   %edx
c0003263:	e8 fd 48 00 00       	call   c0007b65 <Memcpy>
c0003268:	83 c4 10             	add    $0x10,%esp
c000326b:	eb 01                	jmp    c000326e <mkfs+0x5b0>
c000326d:	90                   	nop
c000326e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0003272:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003275:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0003278:	7c 92                	jl     c000320c <mkfs+0x54e>
c000327a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000327f:	89 c2                	mov    %eax,%edx
c0003281:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003284:	83 ec 0c             	sub    $0xc,%esp
c0003287:	6a 0a                	push   $0xa
c0003289:	68 00 02 00 00       	push   $0x200
c000328e:	52                   	push   %edx
c000328f:	6a 20                	push   $0x20
c0003291:	50                   	push   %eax
c0003292:	e8 4d f9 ff ff       	call   c0002be4 <rd_wt>
c0003297:	83 c4 20             	add    $0x20,%esp
c000329a:	90                   	nop
c000329b:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000329e:	c9                   	leave  
c000329f:	c3                   	ret    

c00032a0 <init_fs>:
c00032a0:	55                   	push   %ebp
c00032a1:	89 e5                	mov    %esp,%ebp
c00032a3:	83 ec 18             	sub    $0x18,%esp
c00032a6:	83 ec 0c             	sub    $0xc,%esp
c00032a9:	6a 6c                	push   $0x6c
c00032ab:	e8 14 f7 ff ff       	call   c00029c4 <sys_malloc>
c00032b0:	83 c4 10             	add    $0x10,%esp
c00032b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00032b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032b9:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c00032c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032c3:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c00032ca:	83 ec 04             	sub    $0x4,%esp
c00032cd:	6a 03                	push   $0x3
c00032cf:	ff 75 f4             	pushl  -0xc(%ebp)
c00032d2:	6a 03                	push   $0x3
c00032d4:	e8 9d 71 00 00       	call   c000a476 <send_rec>
c00032d9:	83 c4 10             	add    $0x10,%esp
c00032dc:	e8 dd f9 ff ff       	call   c0002cbe <mkfs>
c00032e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032e4:	83 ec 08             	sub    $0x8,%esp
c00032e7:	6a 6c                	push   $0x6c
c00032e9:	50                   	push   %eax
c00032ea:	e8 d5 41 00 00       	call   c00074c4 <sys_free>
c00032ef:	83 c4 10             	add    $0x10,%esp
c00032f2:	90                   	nop
c00032f3:	c9                   	leave  
c00032f4:	c3                   	ret    

c00032f5 <do_open>:
c00032f5:	55                   	push   %ebp
c00032f6:	89 e5                	mov    %esp,%ebp
c00032f8:	83 ec 68             	sub    $0x68,%esp
c00032fb:	83 ec 04             	sub    $0x4,%esp
c00032fe:	6a 0c                	push   $0xc
c0003300:	6a 00                	push   $0x0
c0003302:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003305:	50                   	push   %eax
c0003306:	e8 40 8f 00 00       	call   c000c24b <Memset>
c000330b:	83 c4 10             	add    $0x10,%esp
c000330e:	8b 45 08             	mov    0x8(%ebp),%eax
c0003311:	8b 40 34             	mov    0x34(%eax),%eax
c0003314:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003317:	83 ec 08             	sub    $0x8,%esp
c000331a:	6a 0c                	push   $0xc
c000331c:	ff 75 e4             	pushl  -0x1c(%ebp)
c000331f:	e8 d8 3b 00 00       	call   c0006efc <alloc_virtual_memory>
c0003324:	83 c4 10             	add    $0x10,%esp
c0003327:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000332a:	8b 45 08             	mov    0x8(%ebp),%eax
c000332d:	8b 40 30             	mov    0x30(%eax),%eax
c0003330:	89 c2                	mov    %eax,%edx
c0003332:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003335:	83 ec 04             	sub    $0x4,%esp
c0003338:	52                   	push   %edx
c0003339:	50                   	push   %eax
c000333a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000333d:	50                   	push   %eax
c000333e:	e8 22 48 00 00       	call   c0007b65 <Memcpy>
c0003343:	83 c4 10             	add    $0x10,%esp
c0003346:	8b 45 08             	mov    0x8(%ebp),%eax
c0003349:	8b 40 30             	mov    0x30(%eax),%eax
c000334c:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0003351:	8b 45 08             	mov    0x8(%ebp),%eax
c0003354:	8b 40 64             	mov    0x64(%eax),%eax
c0003357:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000335a:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0003361:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003368:	eb 1f                	jmp    c0003389 <do_open+0x94>
c000336a:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000336f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003372:	83 c2 50             	add    $0x50,%edx
c0003375:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0003379:	85 c0                	test   %eax,%eax
c000337b:	75 08                	jne    c0003385 <do_open+0x90>
c000337d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003380:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003383:	eb 0a                	jmp    c000338f <do_open+0x9a>
c0003385:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003389:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c000338d:	7e db                	jle    c000336a <do_open+0x75>
c000338f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0003393:	75 1c                	jne    c00033b1 <do_open+0xbc>
c0003395:	68 c6 01 00 00       	push   $0x1c6
c000339a:	68 48 b6 00 c0       	push   $0xc000b648
c000339f:	68 48 b6 00 c0       	push   $0xc000b648
c00033a4:	68 3b b7 00 c0       	push   $0xc000b73b
c00033a9:	e8 9c 67 00 00       	call   c0009b4a <assertion_failure>
c00033ae:	83 c4 10             	add    $0x10,%esp
c00033b1:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c00033b8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00033bf:	eb 1d                	jmp    c00033de <do_open+0xe9>
c00033c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00033c4:	c1 e0 04             	shl    $0x4,%eax
c00033c7:	05 88 23 01 c0       	add    $0xc0012388,%eax
c00033cc:	8b 00                	mov    (%eax),%eax
c00033ce:	85 c0                	test   %eax,%eax
c00033d0:	75 08                	jne    c00033da <do_open+0xe5>
c00033d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00033d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00033d8:	eb 0a                	jmp    c00033e4 <do_open+0xef>
c00033da:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00033de:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c00033e2:	7e dd                	jle    c00033c1 <do_open+0xcc>
c00033e4:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c00033e8:	75 1c                	jne    c0003406 <do_open+0x111>
c00033ea:	68 d2 01 00 00       	push   $0x1d2
c00033ef:	68 48 b6 00 c0       	push   $0xc000b648
c00033f4:	68 48 b6 00 c0       	push   $0xc000b648
c00033f9:	68 43 b7 00 c0       	push   $0xc000b743
c00033fe:	e8 47 67 00 00       	call   c0009b4a <assertion_failure>
c0003403:	83 c4 10             	add    $0x10,%esp
c0003406:	83 ec 0c             	sub    $0xc,%esp
c0003409:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000340c:	50                   	push   %eax
c000340d:	e8 b2 00 00 00       	call   c00034c4 <search_file>
c0003412:	83 c4 10             	add    $0x10,%esp
c0003415:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003418:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000341c:	75 2b                	jne    c0003449 <do_open+0x154>
c000341e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0003422:	7e 10                	jle    c0003434 <do_open+0x13f>
c0003424:	83 ec 0c             	sub    $0xc,%esp
c0003427:	68 4b b7 00 c0       	push   $0xc000b74b
c000342c:	e8 fb 66 00 00       	call   c0009b2c <panic>
c0003431:	83 c4 10             	add    $0x10,%esp
c0003434:	83 ec 08             	sub    $0x8,%esp
c0003437:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000343a:	50                   	push   %eax
c000343b:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000343e:	50                   	push   %eax
c000343f:	e8 40 04 00 00       	call   c0003884 <create_file>
c0003444:	83 c4 10             	add    $0x10,%esp
c0003447:	eb 22                	jmp    c000346b <do_open+0x176>
c0003449:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c000344d:	75 07                	jne    c0003456 <do_open+0x161>
c000344f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003454:	eb 6c                	jmp    c00034c2 <do_open+0x1cd>
c0003456:	83 ec 08             	sub    $0x8,%esp
c0003459:	ff 75 d8             	pushl  -0x28(%ebp)
c000345c:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000345f:	50                   	push   %eax
c0003460:	e8 5d 02 00 00       	call   c00036c2 <get_inode>
c0003465:	83 c4 10             	add    $0x10,%esp
c0003468:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000346b:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0003470:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003473:	c1 e2 04             	shl    $0x4,%edx
c0003476:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c000347c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000347f:	83 c2 50             	add    $0x50,%edx
c0003482:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c0003486:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003489:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000348c:	c1 e2 04             	shl    $0x4,%edx
c000348f:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c0003495:	89 02                	mov    %eax,(%edx)
c0003497:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000349a:	c1 e0 04             	shl    $0x4,%eax
c000349d:	05 84 23 01 c0       	add    $0xc0012384,%eax
c00034a2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00034a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00034ab:	c1 e0 04             	shl    $0x4,%eax
c00034ae:	05 80 23 01 c0       	add    $0xc0012380,%eax
c00034b3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00034b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00034bc:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00034bf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00034c2:	c9                   	leave  
c00034c3:	c3                   	ret    

c00034c4 <search_file>:
c00034c4:	55                   	push   %ebp
c00034c5:	89 e5                	mov    %esp,%ebp
c00034c7:	83 ec 68             	sub    $0x68,%esp
c00034ca:	83 ec 04             	sub    $0x4,%esp
c00034cd:	6a 0c                	push   $0xc
c00034cf:	6a 00                	push   $0x0
c00034d1:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00034d4:	50                   	push   %eax
c00034d5:	e8 71 8d 00 00       	call   c000c24b <Memset>
c00034da:	83 c4 10             	add    $0x10,%esp
c00034dd:	83 ec 04             	sub    $0x4,%esp
c00034e0:	6a 28                	push   $0x28
c00034e2:	6a 00                	push   $0x0
c00034e4:	8d 45 98             	lea    -0x68(%ebp),%eax
c00034e7:	50                   	push   %eax
c00034e8:	e8 5e 8d 00 00       	call   c000c24b <Memset>
c00034ed:	83 c4 10             	add    $0x10,%esp
c00034f0:	83 ec 04             	sub    $0x4,%esp
c00034f3:	8d 45 98             	lea    -0x68(%ebp),%eax
c00034f6:	50                   	push   %eax
c00034f7:	ff 75 08             	pushl  0x8(%ebp)
c00034fa:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00034fd:	50                   	push   %eax
c00034fe:	e8 f3 00 00 00       	call   c00035f6 <strip_path>
c0003503:	83 c4 10             	add    $0x10,%esp
c0003506:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003509:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c000350d:	75 0a                	jne    c0003519 <search_file+0x55>
c000350f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003514:	e9 db 00 00 00       	jmp    c00035f4 <search_file+0x130>
c0003519:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000351c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000351f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003522:	05 00 02 00 00       	add    $0x200,%eax
c0003527:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000352d:	85 c0                	test   %eax,%eax
c000352f:	0f 48 c2             	cmovs  %edx,%eax
c0003532:	c1 f8 09             	sar    $0x9,%eax
c0003535:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003538:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000353b:	c1 e8 04             	shr    $0x4,%eax
c000353e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003541:	e8 5c 14 00 00       	call   c00049a2 <get_super_block>
c0003546:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003549:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000354c:	8b 00                	mov    (%eax),%eax
c000354e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003551:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0003558:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000355f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003566:	eb 7b                	jmp    c00035e3 <search_file+0x11f>
c0003568:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000356d:	89 c1                	mov    %eax,%ecx
c000356f:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003572:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003575:	01 d0                	add    %edx,%eax
c0003577:	83 ec 0c             	sub    $0xc,%esp
c000357a:	6a 07                	push   $0x7
c000357c:	68 00 02 00 00       	push   $0x200
c0003581:	51                   	push   %ecx
c0003582:	ff 75 cc             	pushl  -0x34(%ebp)
c0003585:	50                   	push   %eax
c0003586:	e8 59 f6 ff ff       	call   c0002be4 <rd_wt>
c000358b:	83 c4 20             	add    $0x20,%esp
c000358e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003593:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003596:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000359d:	eb 35                	jmp    c00035d4 <search_file+0x110>
c000359f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00035a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00035a6:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00035a9:	7f 33                	jg     c00035de <search_file+0x11a>
c00035ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035ae:	83 c0 04             	add    $0x4,%eax
c00035b1:	83 ec 08             	sub    $0x8,%esp
c00035b4:	50                   	push   %eax
c00035b5:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00035b8:	50                   	push   %eax
c00035b9:	e8 14 72 00 00       	call   c000a7d2 <strcmp>
c00035be:	83 c4 10             	add    $0x10,%esp
c00035c1:	85 c0                	test   %eax,%eax
c00035c3:	75 07                	jne    c00035cc <search_file+0x108>
c00035c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035c8:	8b 00                	mov    (%eax),%eax
c00035ca:	eb 28                	jmp    c00035f4 <search_file+0x130>
c00035cc:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00035d0:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c00035d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00035d7:	83 f8 1f             	cmp    $0x1f,%eax
c00035da:	76 c3                	jbe    c000359f <search_file+0xdb>
c00035dc:	eb 01                	jmp    c00035df <search_file+0x11b>
c00035de:	90                   	nop
c00035df:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00035e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035e6:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c00035e9:	0f 8c 79 ff ff ff    	jl     c0003568 <search_file+0xa4>
c00035ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00035f4:	c9                   	leave  
c00035f5:	c3                   	ret    

c00035f6 <strip_path>:
c00035f6:	55                   	push   %ebp
c00035f7:	89 e5                	mov    %esp,%ebp
c00035f9:	83 ec 10             	sub    $0x10,%esp
c00035fc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003600:	75 0a                	jne    c000360c <strip_path+0x16>
c0003602:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003607:	e9 b4 00 00 00       	jmp    c00036c0 <strip_path+0xca>
c000360c:	8b 45 08             	mov    0x8(%ebp),%eax
c000360f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003612:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003615:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003618:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000361b:	0f b6 00             	movzbl (%eax),%eax
c000361e:	3c 2f                	cmp    $0x2f,%al
c0003620:	75 2d                	jne    c000364f <strip_path+0x59>
c0003622:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003626:	eb 27                	jmp    c000364f <strip_path+0x59>
c0003628:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000362b:	0f b6 00             	movzbl (%eax),%eax
c000362e:	3c 2f                	cmp    $0x2f,%al
c0003630:	75 0a                	jne    c000363c <strip_path+0x46>
c0003632:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003637:	e9 84 00 00 00       	jmp    c00036c0 <strip_path+0xca>
c000363c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000363f:	0f b6 10             	movzbl (%eax),%edx
c0003642:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003645:	88 10                	mov    %dl,(%eax)
c0003647:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000364b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000364f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003652:	0f b6 00             	movzbl (%eax),%eax
c0003655:	84 c0                	test   %al,%al
c0003657:	75 cf                	jne    c0003628 <strip_path+0x32>
c0003659:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000365c:	c6 00 00             	movb   $0x0,(%eax)
c000365f:	8b 45 10             	mov    0x10(%ebp),%eax
c0003662:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c0003668:	89 10                	mov    %edx,(%eax)
c000366a:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003670:	89 50 04             	mov    %edx,0x4(%eax)
c0003673:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c0003679:	89 50 08             	mov    %edx,0x8(%eax)
c000367c:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c0003682:	89 50 0c             	mov    %edx,0xc(%eax)
c0003685:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c000368b:	89 50 10             	mov    %edx,0x10(%eax)
c000368e:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c0003694:	89 50 14             	mov    %edx,0x14(%eax)
c0003697:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c000369d:	89 50 18             	mov    %edx,0x18(%eax)
c00036a0:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c00036a6:	89 50 1c             	mov    %edx,0x1c(%eax)
c00036a9:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c00036af:	89 50 20             	mov    %edx,0x20(%eax)
c00036b2:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c00036b8:	89 50 24             	mov    %edx,0x24(%eax)
c00036bb:	b8 00 00 00 00       	mov    $0x0,%eax
c00036c0:	c9                   	leave  
c00036c1:	c3                   	ret    

c00036c2 <get_inode>:
c00036c2:	55                   	push   %ebp
c00036c3:	89 e5                	mov    %esp,%ebp
c00036c5:	56                   	push   %esi
c00036c6:	53                   	push   %ebx
c00036c7:	83 ec 20             	sub    $0x20,%esp
c00036ca:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00036ce:	75 0a                	jne    c00036da <get_inode+0x18>
c00036d0:	b8 00 00 00 00       	mov    $0x0,%eax
c00036d5:	e9 a3 01 00 00       	jmp    c000387d <get_inode+0x1bb>
c00036da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00036e1:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c00036e8:	eb 69                	jmp    c0003753 <get_inode+0x91>
c00036ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036ed:	8b 40 24             	mov    0x24(%eax),%eax
c00036f0:	85 c0                	test   %eax,%eax
c00036f2:	7e 53                	jle    c0003747 <get_inode+0x85>
c00036f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036f7:	8b 40 10             	mov    0x10(%eax),%eax
c00036fa:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00036fd:	75 50                	jne    c000374f <get_inode+0x8d>
c00036ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0003702:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003705:	8b 0a                	mov    (%edx),%ecx
c0003707:	89 08                	mov    %ecx,(%eax)
c0003709:	8b 4a 04             	mov    0x4(%edx),%ecx
c000370c:	89 48 04             	mov    %ecx,0x4(%eax)
c000370f:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003712:	89 48 08             	mov    %ecx,0x8(%eax)
c0003715:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003718:	89 48 0c             	mov    %ecx,0xc(%eax)
c000371b:	8b 4a 10             	mov    0x10(%edx),%ecx
c000371e:	89 48 10             	mov    %ecx,0x10(%eax)
c0003721:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003724:	89 48 14             	mov    %ecx,0x14(%eax)
c0003727:	8b 4a 18             	mov    0x18(%edx),%ecx
c000372a:	89 48 18             	mov    %ecx,0x18(%eax)
c000372d:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003730:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003733:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003736:	89 48 20             	mov    %ecx,0x20(%eax)
c0003739:	8b 52 24             	mov    0x24(%edx),%edx
c000373c:	89 50 24             	mov    %edx,0x24(%eax)
c000373f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003742:	e9 36 01 00 00       	jmp    c000387d <get_inode+0x1bb>
c0003747:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000374a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000374d:	eb 0d                	jmp    c000375c <get_inode+0x9a>
c000374f:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003753:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c000375a:	76 8e                	jbe    c00036ea <get_inode+0x28>
c000375c:	e8 41 12 00 00       	call   c00049a2 <get_super_block>
c0003761:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003764:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c000376b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000376e:	8b 40 04             	mov    0x4(%eax),%eax
c0003771:	8d 50 02             	lea    0x2(%eax),%edx
c0003774:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003777:	8b 40 08             	mov    0x8(%eax),%eax
c000377a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c000377d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003780:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003783:	b8 00 02 00 00       	mov    $0x200,%eax
c0003788:	99                   	cltd   
c0003789:	f7 7d e8             	idivl  -0x18(%ebp)
c000378c:	89 c6                	mov    %eax,%esi
c000378e:	89 c8                	mov    %ecx,%eax
c0003790:	99                   	cltd   
c0003791:	f7 fe                	idiv   %esi
c0003793:	01 d8                	add    %ebx,%eax
c0003795:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003798:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c000379f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00037a4:	83 ec 0c             	sub    $0xc,%esp
c00037a7:	6a 07                	push   $0x7
c00037a9:	68 00 02 00 00       	push   $0x200
c00037ae:	50                   	push   %eax
c00037af:	ff 75 e0             	pushl  -0x20(%ebp)
c00037b2:	ff 75 e4             	pushl  -0x1c(%ebp)
c00037b5:	e8 2a f4 ff ff       	call   c0002be4 <rd_wt>
c00037ba:	83 c4 20             	add    $0x20,%esp
c00037bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00037c0:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00037c3:	b8 00 02 00 00       	mov    $0x200,%eax
c00037c8:	99                   	cltd   
c00037c9:	f7 7d e8             	idivl  -0x18(%ebp)
c00037cc:	89 c3                	mov    %eax,%ebx
c00037ce:	89 c8                	mov    %ecx,%eax
c00037d0:	99                   	cltd   
c00037d1:	f7 fb                	idiv   %ebx
c00037d3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c00037d6:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00037dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00037df:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c00037e3:	01 d0                	add    %edx,%eax
c00037e5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00037e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037eb:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00037ee:	8b 0a                	mov    (%edx),%ecx
c00037f0:	89 08                	mov    %ecx,(%eax)
c00037f2:	8b 4a 04             	mov    0x4(%edx),%ecx
c00037f5:	89 48 04             	mov    %ecx,0x4(%eax)
c00037f8:	8b 4a 08             	mov    0x8(%edx),%ecx
c00037fb:	89 48 08             	mov    %ecx,0x8(%eax)
c00037fe:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003801:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003804:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003807:	89 48 10             	mov    %ecx,0x10(%eax)
c000380a:	8b 4a 14             	mov    0x14(%edx),%ecx
c000380d:	89 48 14             	mov    %ecx,0x14(%eax)
c0003810:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003813:	89 48 18             	mov    %ecx,0x18(%eax)
c0003816:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003819:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000381c:	8b 4a 20             	mov    0x20(%edx),%ecx
c000381f:	89 48 20             	mov    %ecx,0x20(%eax)
c0003822:	8b 52 24             	mov    0x24(%edx),%edx
c0003825:	89 50 24             	mov    %edx,0x24(%eax)
c0003828:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000382b:	8b 55 0c             	mov    0xc(%ebp),%edx
c000382e:	89 50 10             	mov    %edx,0x10(%eax)
c0003831:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003834:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003837:	89 50 20             	mov    %edx,0x20(%eax)
c000383a:	8b 45 08             	mov    0x8(%ebp),%eax
c000383d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003840:	8b 0a                	mov    (%edx),%ecx
c0003842:	89 08                	mov    %ecx,(%eax)
c0003844:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003847:	89 48 04             	mov    %ecx,0x4(%eax)
c000384a:	8b 4a 08             	mov    0x8(%edx),%ecx
c000384d:	89 48 08             	mov    %ecx,0x8(%eax)
c0003850:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003853:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003856:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003859:	89 48 10             	mov    %ecx,0x10(%eax)
c000385c:	8b 4a 14             	mov    0x14(%edx),%ecx
c000385f:	89 48 14             	mov    %ecx,0x14(%eax)
c0003862:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003865:	89 48 18             	mov    %ecx,0x18(%eax)
c0003868:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000386b:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000386e:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003871:	89 48 20             	mov    %ecx,0x20(%eax)
c0003874:	8b 52 24             	mov    0x24(%edx),%edx
c0003877:	89 50 24             	mov    %edx,0x24(%eax)
c000387a:	8b 45 08             	mov    0x8(%ebp),%eax
c000387d:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0003880:	5b                   	pop    %ebx
c0003881:	5e                   	pop    %esi
c0003882:	5d                   	pop    %ebp
c0003883:	c3                   	ret    

c0003884 <create_file>:
c0003884:	55                   	push   %ebp
c0003885:	89 e5                	mov    %esp,%ebp
c0003887:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000388d:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003890:	50                   	push   %eax
c0003891:	ff 75 0c             	pushl  0xc(%ebp)
c0003894:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003897:	50                   	push   %eax
c0003898:	e8 59 fd ff ff       	call   c00035f6 <strip_path>
c000389d:	83 c4 0c             	add    $0xc,%esp
c00038a0:	83 f8 ff             	cmp    $0xffffffff,%eax
c00038a3:	75 0a                	jne    c00038af <create_file+0x2b>
c00038a5:	b8 00 00 00 00       	mov    $0x0,%eax
c00038aa:	e9 de 00 00 00       	jmp    c000398d <create_file+0x109>
c00038af:	e8 db 00 00 00       	call   c000398f <alloc_imap_bit>
c00038b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00038b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00038bb:	75 0a                	jne    c00038c7 <create_file+0x43>
c00038bd:	b8 00 00 00 00       	mov    $0x0,%eax
c00038c2:	e9 c6 00 00 00       	jmp    c000398d <create_file+0x109>
c00038c7:	e8 d6 10 00 00       	call   c00049a2 <get_super_block>
c00038cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00038cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00038d2:	8b 40 10             	mov    0x10(%eax),%eax
c00038d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00038d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038db:	83 ec 08             	sub    $0x8,%esp
c00038de:	50                   	push   %eax
c00038df:	ff 75 f4             	pushl  -0xc(%ebp)
c00038e2:	e8 a5 01 00 00       	call   c0003a8c <alloc_smap_bit>
c00038e7:	83 c4 10             	add    $0x10,%esp
c00038ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00038ed:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00038f1:	75 0a                	jne    c00038fd <create_file+0x79>
c00038f3:	b8 00 00 00 00       	mov    $0x0,%eax
c00038f8:	e9 90 00 00 00       	jmp    c000398d <create_file+0x109>
c00038fd:	83 ec 04             	sub    $0x4,%esp
c0003900:	ff 75 e8             	pushl  -0x18(%ebp)
c0003903:	ff 75 f4             	pushl  -0xc(%ebp)
c0003906:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003909:	50                   	push   %eax
c000390a:	e8 1e 03 00 00       	call   c0003c2d <new_inode>
c000390f:	83 c4 10             	add    $0x10,%esp
c0003912:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003915:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003919:	75 07                	jne    c0003922 <create_file+0x9e>
c000391b:	b8 00 00 00 00       	mov    $0x0,%eax
c0003920:	eb 6b                	jmp    c000398d <create_file+0x109>
c0003922:	ff 75 f4             	pushl  -0xc(%ebp)
c0003925:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003928:	50                   	push   %eax
c0003929:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000392c:	50                   	push   %eax
c000392d:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003933:	50                   	push   %eax
c0003934:	e8 12 04 00 00       	call   c0003d4b <new_dir_entry>
c0003939:	83 c4 10             	add    $0x10,%esp
c000393c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000393f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003943:	75 07                	jne    c000394c <create_file+0xc8>
c0003945:	b8 00 00 00 00       	mov    $0x0,%eax
c000394a:	eb 41                	jmp    c000398d <create_file+0x109>
c000394c:	8b 45 08             	mov    0x8(%ebp),%eax
c000394f:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0003952:	89 10                	mov    %edx,(%eax)
c0003954:	8b 55 88             	mov    -0x78(%ebp),%edx
c0003957:	89 50 04             	mov    %edx,0x4(%eax)
c000395a:	8b 55 8c             	mov    -0x74(%ebp),%edx
c000395d:	89 50 08             	mov    %edx,0x8(%eax)
c0003960:	8b 55 90             	mov    -0x70(%ebp),%edx
c0003963:	89 50 0c             	mov    %edx,0xc(%eax)
c0003966:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0003969:	89 50 10             	mov    %edx,0x10(%eax)
c000396c:	8b 55 98             	mov    -0x68(%ebp),%edx
c000396f:	89 50 14             	mov    %edx,0x14(%eax)
c0003972:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003975:	89 50 18             	mov    %edx,0x18(%eax)
c0003978:	8b 55 a0             	mov    -0x60(%ebp),%edx
c000397b:	89 50 1c             	mov    %edx,0x1c(%eax)
c000397e:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0003981:	89 50 20             	mov    %edx,0x20(%eax)
c0003984:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003987:	89 50 24             	mov    %edx,0x24(%eax)
c000398a:	8b 45 08             	mov    0x8(%ebp),%eax
c000398d:	c9                   	leave  
c000398e:	c3                   	ret    

c000398f <alloc_imap_bit>:
c000398f:	55                   	push   %ebp
c0003990:	89 e5                	mov    %esp,%ebp
c0003992:	53                   	push   %ebx
c0003993:	83 ec 24             	sub    $0x24,%esp
c0003996:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c000399d:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00039a4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00039a9:	83 ec 0c             	sub    $0xc,%esp
c00039ac:	6a 07                	push   $0x7
c00039ae:	68 00 02 00 00       	push   $0x200
c00039b3:	50                   	push   %eax
c00039b4:	ff 75 e8             	pushl  -0x18(%ebp)
c00039b7:	ff 75 ec             	pushl  -0x14(%ebp)
c00039ba:	e8 25 f2 ff ff       	call   c0002be4 <rd_wt>
c00039bf:	83 c4 20             	add    $0x20,%esp
c00039c2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00039c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00039d0:	e9 a5 00 00 00       	jmp    c0003a7a <alloc_imap_bit+0xeb>
c00039d5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00039dc:	e9 8b 00 00 00       	jmp    c0003a6c <alloc_imap_bit+0xdd>
c00039e1:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039ea:	01 d0                	add    %edx,%eax
c00039ec:	0f b6 00             	movzbl (%eax),%eax
c00039ef:	0f be d0             	movsbl %al,%edx
c00039f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039f5:	89 c1                	mov    %eax,%ecx
c00039f7:	d3 fa                	sar    %cl,%edx
c00039f9:	89 d0                	mov    %edx,%eax
c00039fb:	83 e0 01             	and    $0x1,%eax
c00039fe:	85 c0                	test   %eax,%eax
c0003a00:	74 06                	je     c0003a08 <alloc_imap_bit+0x79>
c0003a02:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003a06:	eb 64                	jmp    c0003a6c <alloc_imap_bit+0xdd>
c0003a08:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a11:	01 d0                	add    %edx,%eax
c0003a13:	0f b6 18             	movzbl (%eax),%ebx
c0003a16:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a19:	ba 01 00 00 00       	mov    $0x1,%edx
c0003a1e:	89 c1                	mov    %eax,%ecx
c0003a20:	d3 e2                	shl    %cl,%edx
c0003a22:	89 d0                	mov    %edx,%eax
c0003a24:	89 c1                	mov    %eax,%ecx
c0003a26:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a2f:	01 d0                	add    %edx,%eax
c0003a31:	09 cb                	or     %ecx,%ebx
c0003a33:	89 da                	mov    %ebx,%edx
c0003a35:	88 10                	mov    %dl,(%eax)
c0003a37:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a3a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003a41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a44:	01 d0                	add    %edx,%eax
c0003a46:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003a49:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003a4e:	83 ec 0c             	sub    $0xc,%esp
c0003a51:	6a 0a                	push   $0xa
c0003a53:	68 00 02 00 00       	push   $0x200
c0003a58:	50                   	push   %eax
c0003a59:	ff 75 e8             	pushl  -0x18(%ebp)
c0003a5c:	ff 75 ec             	pushl  -0x14(%ebp)
c0003a5f:	e8 80 f1 ff ff       	call   c0002be4 <rd_wt>
c0003a64:	83 c4 20             	add    $0x20,%esp
c0003a67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a6a:	eb 1b                	jmp    c0003a87 <alloc_imap_bit+0xf8>
c0003a6c:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c0003a70:	0f 8e 6b ff ff ff    	jle    c00039e1 <alloc_imap_bit+0x52>
c0003a76:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003a7a:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0003a81:	0f 8e 4e ff ff ff    	jle    c00039d5 <alloc_imap_bit+0x46>
c0003a87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003a8a:	c9                   	leave  
c0003a8b:	c3                   	ret    

c0003a8c <alloc_smap_bit>:
c0003a8c:	55                   	push   %ebp
c0003a8d:	89 e5                	mov    %esp,%ebp
c0003a8f:	53                   	push   %ebx
c0003a90:	83 ec 34             	sub    $0x34,%esp
c0003a93:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a97:	75 1c                	jne    c0003ab5 <alloc_smap_bit+0x29>
c0003a99:	68 fc 02 00 00       	push   $0x2fc
c0003a9e:	68 48 b6 00 c0       	push   $0xc000b648
c0003aa3:	68 48 b6 00 c0       	push   $0xc000b648
c0003aa8:	68 58 b7 00 c0       	push   $0xc000b758
c0003aad:	e8 98 60 00 00       	call   c0009b4a <assertion_failure>
c0003ab2:	83 c4 10             	add    $0x10,%esp
c0003ab5:	e8 e8 0e 00 00       	call   c00049a2 <get_super_block>
c0003aba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003abd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003ac0:	8b 40 08             	mov    0x8(%eax),%eax
c0003ac3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003ac6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003ac9:	8b 40 04             	mov    0x4(%eax),%eax
c0003acc:	83 c0 02             	add    $0x2,%eax
c0003acf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003ad2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003ad9:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0003ae0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003ae7:	e9 20 01 00 00       	jmp    c0003c0c <alloc_smap_bit+0x180>
c0003aec:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003aef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003af2:	01 d0                	add    %edx,%eax
c0003af4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003af7:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003afc:	83 ec 0c             	sub    $0xc,%esp
c0003aff:	6a 07                	push   $0x7
c0003b01:	68 00 02 00 00       	push   $0x200
c0003b06:	50                   	push   %eax
c0003b07:	ff 75 d8             	pushl  -0x28(%ebp)
c0003b0a:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003b0d:	e8 d2 f0 ff ff       	call   c0002be4 <rd_wt>
c0003b12:	83 c4 20             	add    $0x20,%esp
c0003b15:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003b1c:	e9 b0 00 00 00       	jmp    c0003bd1 <alloc_smap_bit+0x145>
c0003b21:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003b28:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b2c:	0f 85 8c 00 00 00    	jne    c0003bbe <alloc_smap_bit+0x132>
c0003b32:	eb 45                	jmp    c0003b79 <alloc_smap_bit+0xed>
c0003b34:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b3d:	01 d0                	add    %edx,%eax
c0003b3f:	0f b6 00             	movzbl (%eax),%eax
c0003b42:	0f be d0             	movsbl %al,%edx
c0003b45:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b48:	89 c1                	mov    %eax,%ecx
c0003b4a:	d3 fa                	sar    %cl,%edx
c0003b4c:	89 d0                	mov    %edx,%eax
c0003b4e:	83 e0 01             	and    $0x1,%eax
c0003b51:	85 c0                	test   %eax,%eax
c0003b53:	74 06                	je     c0003b5b <alloc_smap_bit+0xcf>
c0003b55:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003b59:	eb 1e                	jmp    c0003b79 <alloc_smap_bit+0xed>
c0003b5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b5e:	c1 e0 09             	shl    $0x9,%eax
c0003b61:	89 c2                	mov    %eax,%edx
c0003b63:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b66:	01 d0                	add    %edx,%eax
c0003b68:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003b6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b72:	01 d0                	add    %edx,%eax
c0003b74:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003b77:	eb 06                	jmp    c0003b7f <alloc_smap_bit+0xf3>
c0003b79:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003b7d:	7e b5                	jle    c0003b34 <alloc_smap_bit+0xa8>
c0003b7f:	eb 3d                	jmp    c0003bbe <alloc_smap_bit+0x132>
c0003b81:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003b85:	74 45                	je     c0003bcc <alloc_smap_bit+0x140>
c0003b87:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b90:	01 d0                	add    %edx,%eax
c0003b92:	0f b6 18             	movzbl (%eax),%ebx
c0003b95:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b98:	ba 01 00 00 00       	mov    $0x1,%edx
c0003b9d:	89 c1                	mov    %eax,%ecx
c0003b9f:	d3 e2                	shl    %cl,%edx
c0003ba1:	89 d0                	mov    %edx,%eax
c0003ba3:	89 c1                	mov    %eax,%ecx
c0003ba5:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003bab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003bae:	01 d0                	add    %edx,%eax
c0003bb0:	09 cb                	or     %ecx,%ebx
c0003bb2:	89 da                	mov    %ebx,%edx
c0003bb4:	88 10                	mov    %dl,(%eax)
c0003bb6:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003bba:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003bbe:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003bc2:	74 09                	je     c0003bcd <alloc_smap_bit+0x141>
c0003bc4:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003bc8:	7e b7                	jle    c0003b81 <alloc_smap_bit+0xf5>
c0003bca:	eb 01                	jmp    c0003bcd <alloc_smap_bit+0x141>
c0003bcc:	90                   	nop
c0003bcd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003bd1:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003bd8:	0f 8e 43 ff ff ff    	jle    c0003b21 <alloc_smap_bit+0x95>
c0003bde:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003be2:	74 1e                	je     c0003c02 <alloc_smap_bit+0x176>
c0003be4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003be9:	83 ec 0c             	sub    $0xc,%esp
c0003bec:	6a 0a                	push   $0xa
c0003bee:	68 00 02 00 00       	push   $0x200
c0003bf3:	50                   	push   %eax
c0003bf4:	ff 75 d8             	pushl  -0x28(%ebp)
c0003bf7:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003bfa:	e8 e5 ef ff ff       	call   c0002be4 <rd_wt>
c0003bff:	83 c4 20             	add    $0x20,%esp
c0003c02:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003c06:	74 12                	je     c0003c1a <alloc_smap_bit+0x18e>
c0003c08:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003c0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c0f:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003c12:	0f 8c d4 fe ff ff    	jl     c0003aec <alloc_smap_bit+0x60>
c0003c18:	eb 01                	jmp    c0003c1b <alloc_smap_bit+0x18f>
c0003c1a:	90                   	nop
c0003c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003c1e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003c21:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003c24:	8b 00                	mov    (%eax),%eax
c0003c26:	01 d0                	add    %edx,%eax
c0003c28:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003c2b:	c9                   	leave  
c0003c2c:	c3                   	ret    

c0003c2d <new_inode>:
c0003c2d:	55                   	push   %ebp
c0003c2e:	89 e5                	mov    %esp,%ebp
c0003c30:	83 ec 38             	sub    $0x38,%esp
c0003c33:	83 ec 08             	sub    $0x8,%esp
c0003c36:	ff 75 0c             	pushl  0xc(%ebp)
c0003c39:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003c3c:	50                   	push   %eax
c0003c3d:	e8 80 fa ff ff       	call   c00036c2 <get_inode>
c0003c42:	83 c4 10             	add    $0x10,%esp
c0003c45:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003c48:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003c4c:	75 0a                	jne    c0003c58 <new_inode+0x2b>
c0003c4e:	b8 00 00 00 00       	mov    $0x0,%eax
c0003c53:	e9 f1 00 00 00       	jmp    c0003d49 <new_inode+0x11c>
c0003c58:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c5b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003c5e:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003c65:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003c6c:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003c73:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c76:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003c79:	83 ec 0c             	sub    $0xc,%esp
c0003c7c:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003c7f:	50                   	push   %eax
c0003c80:	e8 39 0b 00 00       	call   c00047be <sync_inode>
c0003c85:	83 c4 10             	add    $0x10,%esp
c0003c88:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003c8f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003c96:	eb 1d                	jmp    c0003cb5 <new_inode+0x88>
c0003c98:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003c9b:	89 d0                	mov    %edx,%eax
c0003c9d:	c1 e0 02             	shl    $0x2,%eax
c0003ca0:	01 d0                	add    %edx,%eax
c0003ca2:	c1 e0 03             	shl    $0x3,%eax
c0003ca5:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003caa:	8b 00                	mov    (%eax),%eax
c0003cac:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003caf:	74 0c                	je     c0003cbd <new_inode+0x90>
c0003cb1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003cb5:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003cb9:	7e dd                	jle    c0003c98 <new_inode+0x6b>
c0003cbb:	eb 01                	jmp    c0003cbe <new_inode+0x91>
c0003cbd:	90                   	nop
c0003cbe:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003cc1:	89 d0                	mov    %edx,%eax
c0003cc3:	c1 e0 02             	shl    $0x2,%eax
c0003cc6:	01 d0                	add    %edx,%eax
c0003cc8:	c1 e0 03             	shl    $0x3,%eax
c0003ccb:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003cd0:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003cd3:	89 10                	mov    %edx,(%eax)
c0003cd5:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003cd8:	89 50 04             	mov    %edx,0x4(%eax)
c0003cdb:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003cde:	89 50 08             	mov    %edx,0x8(%eax)
c0003ce1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003ce4:	89 50 0c             	mov    %edx,0xc(%eax)
c0003ce7:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003cea:	89 50 10             	mov    %edx,0x10(%eax)
c0003ced:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003cf0:	89 50 14             	mov    %edx,0x14(%eax)
c0003cf3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003cf6:	89 50 18             	mov    %edx,0x18(%eax)
c0003cf9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003cfc:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003cff:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003d02:	89 50 20             	mov    %edx,0x20(%eax)
c0003d05:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003d08:	89 50 24             	mov    %edx,0x24(%eax)
c0003d0b:	8b 45 08             	mov    0x8(%ebp),%eax
c0003d0e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003d11:	89 10                	mov    %edx,(%eax)
c0003d13:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003d16:	89 50 04             	mov    %edx,0x4(%eax)
c0003d19:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003d1c:	89 50 08             	mov    %edx,0x8(%eax)
c0003d1f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003d22:	89 50 0c             	mov    %edx,0xc(%eax)
c0003d25:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003d28:	89 50 10             	mov    %edx,0x10(%eax)
c0003d2b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003d2e:	89 50 14             	mov    %edx,0x14(%eax)
c0003d31:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003d34:	89 50 18             	mov    %edx,0x18(%eax)
c0003d37:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003d3a:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003d3d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003d40:	89 50 20             	mov    %edx,0x20(%eax)
c0003d43:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003d46:	89 50 24             	mov    %edx,0x24(%eax)
c0003d49:	c9                   	leave  
c0003d4a:	c3                   	ret    

c0003d4b <new_dir_entry>:
c0003d4b:	55                   	push   %ebp
c0003d4c:	89 e5                	mov    %esp,%ebp
c0003d4e:	83 ec 48             	sub    $0x48,%esp
c0003d51:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003d58:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d5b:	8b 40 04             	mov    0x4(%eax),%eax
c0003d5e:	99                   	cltd   
c0003d5f:	f7 7d dc             	idivl  -0x24(%ebp)
c0003d62:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003d65:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d68:	8b 40 0c             	mov    0xc(%eax),%eax
c0003d6b:	99                   	cltd   
c0003d6c:	f7 7d dc             	idivl  -0x24(%ebp)
c0003d6f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003d72:	e8 2b 0c 00 00       	call   c00049a2 <get_super_block>
c0003d77:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003d7a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003d7d:	8b 00                	mov    (%eax),%eax
c0003d7f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003d82:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d85:	8b 40 0c             	mov    0xc(%eax),%eax
c0003d88:	05 00 02 00 00       	add    $0x200,%eax
c0003d8d:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003d93:	85 c0                	test   %eax,%eax
c0003d95:	0f 48 c2             	cmovs  %edx,%eax
c0003d98:	c1 f8 09             	sar    $0x9,%eax
c0003d9b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003d9e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003da5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003dac:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003db3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003dba:	eb 7f                	jmp    c0003e3b <new_dir_entry+0xf0>
c0003dbc:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003dc1:	89 c1                	mov    %eax,%ecx
c0003dc3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003dc6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003dc9:	01 d0                	add    %edx,%eax
c0003dcb:	83 ec 0c             	sub    $0xc,%esp
c0003dce:	6a 07                	push   $0x7
c0003dd0:	68 00 02 00 00       	push   $0x200
c0003dd5:	51                   	push   %ecx
c0003dd6:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003dd9:	50                   	push   %eax
c0003dda:	e8 05 ee ff ff       	call   c0002be4 <rd_wt>
c0003ddf:	83 c4 20             	add    $0x20,%esp
c0003de2:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003de7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003dea:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003df1:	eb 25                	jmp    c0003e18 <new_dir_entry+0xcd>
c0003df3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003df7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003dfa:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003dfd:	7f 29                	jg     c0003e28 <new_dir_entry+0xdd>
c0003dff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e02:	8b 00                	mov    (%eax),%eax
c0003e04:	85 c0                	test   %eax,%eax
c0003e06:	75 08                	jne    c0003e10 <new_dir_entry+0xc5>
c0003e08:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003e0e:	eb 19                	jmp    c0003e29 <new_dir_entry+0xde>
c0003e10:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003e14:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003e18:	b8 00 02 00 00       	mov    $0x200,%eax
c0003e1d:	99                   	cltd   
c0003e1e:	f7 7d dc             	idivl  -0x24(%ebp)
c0003e21:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003e24:	7c cd                	jl     c0003df3 <new_dir_entry+0xa8>
c0003e26:	eb 01                	jmp    c0003e29 <new_dir_entry+0xde>
c0003e28:	90                   	nop
c0003e29:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003e2c:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003e2f:	7f 16                	jg     c0003e47 <new_dir_entry+0xfc>
c0003e31:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003e35:	75 10                	jne    c0003e47 <new_dir_entry+0xfc>
c0003e37:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003e3b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003e3e:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003e41:	0f 8c 75 ff ff ff    	jl     c0003dbc <new_dir_entry+0x71>
c0003e47:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003e4a:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003e4d:	75 0a                	jne    c0003e59 <new_dir_entry+0x10e>
c0003e4f:	b8 00 00 00 00       	mov    $0x0,%eax
c0003e54:	e9 fc 00 00 00       	jmp    c0003f55 <new_dir_entry+0x20a>
c0003e59:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003e60:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003e64:	75 1e                	jne    c0003e84 <new_dir_entry+0x139>
c0003e66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e69:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003e6c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003e6f:	8b 50 04             	mov    0x4(%eax),%edx
c0003e72:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003e75:	01 c2                	add    %eax,%edx
c0003e77:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003e7a:	89 50 04             	mov    %edx,0x4(%eax)
c0003e7d:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003e84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e87:	8b 55 14             	mov    0x14(%ebp),%edx
c0003e8a:	89 10                	mov    %edx,(%eax)
c0003e8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e8f:	83 c0 04             	add    $0x4,%eax
c0003e92:	83 ec 08             	sub    $0x8,%esp
c0003e95:	ff 75 10             	pushl  0x10(%ebp)
c0003e98:	50                   	push   %eax
c0003e99:	e8 cc 83 00 00       	call   c000c26a <Strcpy>
c0003e9e:	83 c4 10             	add    $0x10,%esp
c0003ea1:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ea4:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003ea7:	8b 0a                	mov    (%edx),%ecx
c0003ea9:	89 08                	mov    %ecx,(%eax)
c0003eab:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003eae:	89 48 04             	mov    %ecx,0x4(%eax)
c0003eb1:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003eb4:	89 48 08             	mov    %ecx,0x8(%eax)
c0003eb7:	8b 52 0c             	mov    0xc(%edx),%edx
c0003eba:	89 50 0c             	mov    %edx,0xc(%eax)
c0003ebd:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003ec2:	89 c1                	mov    %eax,%ecx
c0003ec4:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003ec7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003eca:	01 d0                	add    %edx,%eax
c0003ecc:	83 ec 0c             	sub    $0xc,%esp
c0003ecf:	6a 0a                	push   $0xa
c0003ed1:	68 00 02 00 00       	push   $0x200
c0003ed6:	51                   	push   %ecx
c0003ed7:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003eda:	50                   	push   %eax
c0003edb:	e8 04 ed ff ff       	call   c0002be4 <rd_wt>
c0003ee0:	83 c4 20             	add    $0x20,%esp
c0003ee3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003ee7:	74 69                	je     c0003f52 <new_dir_entry+0x207>
c0003ee9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003eec:	8b 10                	mov    (%eax),%edx
c0003eee:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003ef4:	8b 50 04             	mov    0x4(%eax),%edx
c0003ef7:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003efd:	8b 50 08             	mov    0x8(%eax),%edx
c0003f00:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003f06:	8b 50 0c             	mov    0xc(%eax),%edx
c0003f09:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003f0f:	8b 50 10             	mov    0x10(%eax),%edx
c0003f12:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003f18:	8b 50 14             	mov    0x14(%eax),%edx
c0003f1b:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003f21:	8b 50 18             	mov    0x18(%eax),%edx
c0003f24:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003f2a:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003f2d:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003f33:	8b 50 20             	mov    0x20(%eax),%edx
c0003f36:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003f3c:	8b 40 24             	mov    0x24(%eax),%eax
c0003f3f:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003f44:	83 ec 0c             	sub    $0xc,%esp
c0003f47:	ff 75 0c             	pushl  0xc(%ebp)
c0003f4a:	e8 6f 08 00 00       	call   c00047be <sync_inode>
c0003f4f:	83 c4 10             	add    $0x10,%esp
c0003f52:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f55:	c9                   	leave  
c0003f56:	c3                   	ret    

c0003f57 <do_unlink>:
c0003f57:	55                   	push   %ebp
c0003f58:	89 e5                	mov    %esp,%ebp
c0003f5a:	53                   	push   %ebx
c0003f5b:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003f61:	83 ec 08             	sub    $0x8,%esp
c0003f64:	ff 75 08             	pushl  0x8(%ebp)
c0003f67:	68 6d b7 00 c0       	push   $0xc000b76d
c0003f6c:	e8 61 68 00 00       	call   c000a7d2 <strcmp>
c0003f71:	83 c4 10             	add    $0x10,%esp
c0003f74:	85 c0                	test   %eax,%eax
c0003f76:	75 10                	jne    c0003f88 <do_unlink+0x31>
c0003f78:	83 ec 0c             	sub    $0xc,%esp
c0003f7b:	68 6f b7 00 c0       	push   $0xc000b76f
c0003f80:	e8 a7 5b 00 00       	call   c0009b2c <panic>
c0003f85:	83 c4 10             	add    $0x10,%esp
c0003f88:	83 ec 0c             	sub    $0xc,%esp
c0003f8b:	ff 75 08             	pushl  0x8(%ebp)
c0003f8e:	e8 31 f5 ff ff       	call   c00034c4 <search_file>
c0003f93:	83 c4 10             	add    $0x10,%esp
c0003f96:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003f99:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003f9d:	75 10                	jne    c0003faf <do_unlink+0x58>
c0003f9f:	83 ec 0c             	sub    $0xc,%esp
c0003fa2:	68 8b b7 00 c0       	push   $0xc000b78b
c0003fa7:	e8 80 5b 00 00       	call   c0009b2c <panic>
c0003fac:	83 c4 10             	add    $0x10,%esp
c0003faf:	83 ec 08             	sub    $0x8,%esp
c0003fb2:	ff 75 d0             	pushl  -0x30(%ebp)
c0003fb5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003fbb:	50                   	push   %eax
c0003fbc:	e8 01 f7 ff ff       	call   c00036c2 <get_inode>
c0003fc1:	83 c4 10             	add    $0x10,%esp
c0003fc4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003fc7:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003fcb:	75 10                	jne    c0003fdd <do_unlink+0x86>
c0003fcd:	83 ec 0c             	sub    $0xc,%esp
c0003fd0:	68 8b b7 00 c0       	push   $0xc000b78b
c0003fd5:	e8 52 5b 00 00       	call   c0009b2c <panic>
c0003fda:	83 c4 10             	add    $0x10,%esp
c0003fdd:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003fe0:	85 c0                	test   %eax,%eax
c0003fe2:	7e 10                	jle    c0003ff4 <do_unlink+0x9d>
c0003fe4:	83 ec 0c             	sub    $0xc,%esp
c0003fe7:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0003fec:	e8 3b 5b 00 00       	call   c0009b2c <panic>
c0003ff1:	83 c4 10             	add    $0x10,%esp
c0003ff4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003ffa:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003ffd:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004000:	8d 50 07             	lea    0x7(%eax),%edx
c0004003:	85 c0                	test   %eax,%eax
c0004005:	0f 48 c2             	cmovs  %edx,%eax
c0004008:	c1 f8 03             	sar    $0x3,%eax
c000400b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000400e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004011:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0004017:	85 c0                	test   %eax,%eax
c0004019:	0f 48 c2             	cmovs  %edx,%eax
c000401c:	c1 f8 09             	sar    $0x9,%eax
c000401f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004022:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004025:	99                   	cltd   
c0004026:	c1 ea 1d             	shr    $0x1d,%edx
c0004029:	01 d0                	add    %edx,%eax
c000402b:	83 e0 07             	and    $0x7,%eax
c000402e:	29 d0                	sub    %edx,%eax
c0004030:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0004033:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c000403a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000403f:	89 c2                	mov    %eax,%edx
c0004041:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004044:	83 c0 02             	add    $0x2,%eax
c0004047:	83 ec 0c             	sub    $0xc,%esp
c000404a:	6a 07                	push   $0x7
c000404c:	68 00 02 00 00       	push   $0x200
c0004051:	52                   	push   %edx
c0004052:	ff 75 b8             	pushl  -0x48(%ebp)
c0004055:	50                   	push   %eax
c0004056:	e8 89 eb ff ff       	call   c0002be4 <rd_wt>
c000405b:	83 c4 20             	add    $0x20,%esp
c000405e:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004064:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004067:	01 d0                	add    %edx,%eax
c0004069:	0f b6 10             	movzbl (%eax),%edx
c000406c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000406f:	bb 01 00 00 00       	mov    $0x1,%ebx
c0004074:	89 c1                	mov    %eax,%ecx
c0004076:	d3 e3                	shl    %cl,%ebx
c0004078:	89 d8                	mov    %ebx,%eax
c000407a:	f7 d0                	not    %eax
c000407c:	89 c3                	mov    %eax,%ebx
c000407e:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0004084:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004087:	01 c8                	add    %ecx,%eax
c0004089:	21 da                	and    %ebx,%edx
c000408b:	88 10                	mov    %dl,(%eax)
c000408d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004092:	89 c2                	mov    %eax,%edx
c0004094:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004097:	83 c0 02             	add    $0x2,%eax
c000409a:	83 ec 0c             	sub    $0xc,%esp
c000409d:	6a 0a                	push   $0xa
c000409f:	68 00 02 00 00       	push   $0x200
c00040a4:	52                   	push   %edx
c00040a5:	ff 75 b8             	pushl  -0x48(%ebp)
c00040a8:	50                   	push   %eax
c00040a9:	e8 36 eb ff ff       	call   c0002be4 <rd_wt>
c00040ae:	83 c4 20             	add    $0x20,%esp
c00040b1:	e8 ec 08 00 00       	call   c00049a2 <get_super_block>
c00040b6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00040b9:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c00040bf:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00040c2:	8b 00                	mov    (%eax),%eax
c00040c4:	29 c2                	sub    %eax,%edx
c00040c6:	89 d0                	mov    %edx,%eax
c00040c8:	83 c0 01             	add    $0x1,%eax
c00040cb:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00040ce:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00040d1:	8d 50 07             	lea    0x7(%eax),%edx
c00040d4:	85 c0                	test   %eax,%eax
c00040d6:	0f 48 c2             	cmovs  %edx,%eax
c00040d9:	c1 f8 03             	sar    $0x3,%eax
c00040dc:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00040df:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00040e2:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00040e8:	85 c0                	test   %eax,%eax
c00040ea:	0f 48 c2             	cmovs  %edx,%eax
c00040ed:	c1 f8 09             	sar    $0x9,%eax
c00040f0:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00040f3:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00040f6:	99                   	cltd   
c00040f7:	c1 ea 1d             	shr    $0x1d,%edx
c00040fa:	01 d0                	add    %edx,%eax
c00040fc:	83 e0 07             	and    $0x7,%eax
c00040ff:	29 d0                	sub    %edx,%eax
c0004101:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004104:	b8 08 00 00 00       	mov    $0x8,%eax
c0004109:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c000410c:	8b 55 b0             	mov    -0x50(%ebp),%edx
c000410f:	29 c2                	sub    %eax,%edx
c0004111:	89 d0                	mov    %edx,%eax
c0004113:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004116:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004119:	8d 50 07             	lea    0x7(%eax),%edx
c000411c:	85 c0                	test   %eax,%eax
c000411e:	0f 48 c2             	cmovs  %edx,%eax
c0004121:	c1 f8 03             	sar    $0x3,%eax
c0004124:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004127:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000412c:	89 c1                	mov    %eax,%ecx
c000412e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004131:	8b 40 04             	mov    0x4(%eax),%eax
c0004134:	8d 50 02             	lea    0x2(%eax),%edx
c0004137:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000413a:	01 d0                	add    %edx,%eax
c000413c:	83 ec 0c             	sub    $0xc,%esp
c000413f:	6a 07                	push   $0x7
c0004141:	68 00 02 00 00       	push   $0x200
c0004146:	51                   	push   %ecx
c0004147:	ff 75 b8             	pushl  -0x48(%ebp)
c000414a:	50                   	push   %eax
c000414b:	e8 94 ea ff ff       	call   c0002be4 <rd_wt>
c0004150:	83 c4 20             	add    $0x20,%esp
c0004153:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004159:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000415c:	01 d0                	add    %edx,%eax
c000415e:	0f b6 10             	movzbl (%eax),%edx
c0004161:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004164:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0004169:	89 c1                	mov    %eax,%ecx
c000416b:	d3 e3                	shl    %cl,%ebx
c000416d:	89 d8                	mov    %ebx,%eax
c000416f:	f7 d0                	not    %eax
c0004171:	89 c3                	mov    %eax,%ebx
c0004173:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0004179:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000417c:	01 c8                	add    %ecx,%eax
c000417e:	21 da                	and    %ebx,%edx
c0004180:	88 10                	mov    %dl,(%eax)
c0004182:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004189:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000418c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000418f:	eb 6b                	jmp    c00041fc <do_unlink+0x2a5>
c0004191:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0004198:	75 4c                	jne    c00041e6 <do_unlink+0x28f>
c000419a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00041a1:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041a6:	83 ec 0c             	sub    $0xc,%esp
c00041a9:	6a 0a                	push   $0xa
c00041ab:	68 00 02 00 00       	push   $0x200
c00041b0:	50                   	push   %eax
c00041b1:	ff 75 b8             	pushl  -0x48(%ebp)
c00041b4:	ff 75 ec             	pushl  -0x14(%ebp)
c00041b7:	e8 28 ea ff ff       	call   c0002be4 <rd_wt>
c00041bc:	83 c4 20             	add    $0x20,%esp
c00041bf:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041c4:	89 c1                	mov    %eax,%ecx
c00041c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00041c9:	8d 50 01             	lea    0x1(%eax),%edx
c00041cc:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00041cf:	83 ec 0c             	sub    $0xc,%esp
c00041d2:	6a 07                	push   $0x7
c00041d4:	68 00 02 00 00       	push   $0x200
c00041d9:	51                   	push   %ecx
c00041da:	ff 75 b8             	pushl  -0x48(%ebp)
c00041dd:	50                   	push   %eax
c00041de:	e8 01 ea ff ff       	call   c0002be4 <rd_wt>
c00041e3:	83 c4 20             	add    $0x20,%esp
c00041e6:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00041ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041ef:	01 d0                	add    %edx,%eax
c00041f1:	c6 00 00             	movb   $0x0,(%eax)
c00041f4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00041f8:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c00041fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041ff:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0004202:	7c 8d                	jl     c0004191 <do_unlink+0x23a>
c0004204:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c000420b:	75 4c                	jne    c0004259 <do_unlink+0x302>
c000420d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004214:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004219:	83 ec 0c             	sub    $0xc,%esp
c000421c:	6a 0a                	push   $0xa
c000421e:	68 00 02 00 00       	push   $0x200
c0004223:	50                   	push   %eax
c0004224:	ff 75 b8             	pushl  -0x48(%ebp)
c0004227:	ff 75 ec             	pushl  -0x14(%ebp)
c000422a:	e8 b5 e9 ff ff       	call   c0002be4 <rd_wt>
c000422f:	83 c4 20             	add    $0x20,%esp
c0004232:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004237:	89 c1                	mov    %eax,%ecx
c0004239:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000423c:	8d 50 01             	lea    0x1(%eax),%edx
c000423f:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004242:	83 ec 0c             	sub    $0xc,%esp
c0004245:	6a 07                	push   $0x7
c0004247:	68 00 02 00 00       	push   $0x200
c000424c:	51                   	push   %ecx
c000424d:	ff 75 b8             	pushl  -0x48(%ebp)
c0004250:	50                   	push   %eax
c0004251:	e8 8e e9 ff ff       	call   c0002be4 <rd_wt>
c0004256:	83 c4 20             	add    $0x20,%esp
c0004259:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000425f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004262:	01 d0                	add    %edx,%eax
c0004264:	0f b6 10             	movzbl (%eax),%edx
c0004267:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000426a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c000426f:	89 c1                	mov    %eax,%ecx
c0004271:	d3 e3                	shl    %cl,%ebx
c0004273:	89 d8                	mov    %ebx,%eax
c0004275:	89 c3                	mov    %eax,%ebx
c0004277:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c000427d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004280:	01 c8                	add    %ecx,%eax
c0004282:	21 da                	and    %ebx,%edx
c0004284:	88 10                	mov    %dl,(%eax)
c0004286:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000428b:	83 ec 0c             	sub    $0xc,%esp
c000428e:	6a 0a                	push   $0xa
c0004290:	68 00 02 00 00       	push   $0x200
c0004295:	50                   	push   %eax
c0004296:	ff 75 b8             	pushl  -0x48(%ebp)
c0004299:	ff 75 ec             	pushl  -0x14(%ebp)
c000429c:	e8 43 e9 ff ff       	call   c0002be4 <rd_wt>
c00042a1:	83 c4 20             	add    $0x20,%esp
c00042a4:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c00042ab:	00 00 00 
c00042ae:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c00042b5:	00 00 00 
c00042b8:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c00042bf:	00 00 00 
c00042c2:	83 ec 0c             	sub    $0xc,%esp
c00042c5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00042cb:	50                   	push   %eax
c00042cc:	e8 ed 04 00 00       	call   c00047be <sync_inode>
c00042d1:	83 c4 10             	add    $0x10,%esp
c00042d4:	83 ec 0c             	sub    $0xc,%esp
c00042d7:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00042dd:	50                   	push   %eax
c00042de:	e8 2f 06 00 00       	call   c0004912 <put_inode>
c00042e3:	83 c4 10             	add    $0x10,%esp
c00042e6:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00042e9:	8b 00                	mov    (%eax),%eax
c00042eb:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00042ee:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c00042f5:	8b 45 98             	mov    -0x68(%ebp),%eax
c00042f8:	8b 40 04             	mov    0x4(%eax),%eax
c00042fb:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00042fe:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004301:	8b 40 0c             	mov    0xc(%eax),%eax
c0004304:	89 45 90             	mov    %eax,-0x70(%ebp)
c0004307:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000430a:	c1 e8 04             	shr    $0x4,%eax
c000430d:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0004310:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004317:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000431e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004325:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000432c:	e9 a5 00 00 00       	jmp    c00043d6 <do_unlink+0x47f>
c0004331:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004336:	89 c1                	mov    %eax,%ecx
c0004338:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000433b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000433e:	01 d0                	add    %edx,%eax
c0004340:	83 ec 0c             	sub    $0xc,%esp
c0004343:	6a 07                	push   $0x7
c0004345:	68 00 02 00 00       	push   $0x200
c000434a:	51                   	push   %ecx
c000434b:	ff 75 b8             	pushl  -0x48(%ebp)
c000434e:	50                   	push   %eax
c000434f:	e8 90 e8 ff ff       	call   c0002be4 <rd_wt>
c0004354:	83 c4 20             	add    $0x20,%esp
c0004357:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000435c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000435f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0004366:	eb 51                	jmp    c00043b9 <do_unlink+0x462>
c0004368:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000436c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000436f:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004372:	7f 4f                	jg     c00043c3 <do_unlink+0x46c>
c0004374:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004377:	83 c0 10             	add    $0x10,%eax
c000437a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000437d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004380:	83 c0 04             	add    $0x4,%eax
c0004383:	83 ec 08             	sub    $0x8,%esp
c0004386:	ff 75 08             	pushl  0x8(%ebp)
c0004389:	50                   	push   %eax
c000438a:	e8 43 64 00 00       	call   c000a7d2 <strcmp>
c000438f:	83 c4 10             	add    $0x10,%esp
c0004392:	85 c0                	test   %eax,%eax
c0004394:	75 1b                	jne    c00043b1 <do_unlink+0x45a>
c0004396:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000439d:	83 ec 04             	sub    $0x4,%esp
c00043a0:	6a 10                	push   $0x10
c00043a2:	6a 00                	push   $0x0
c00043a4:	ff 75 d4             	pushl  -0x2c(%ebp)
c00043a7:	e8 9f 7e 00 00       	call   c000c24b <Memset>
c00043ac:	83 c4 10             	add    $0x10,%esp
c00043af:	eb 13                	jmp    c00043c4 <do_unlink+0x46d>
c00043b1:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c00043b5:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c00043b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00043bc:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00043bf:	7c a7                	jl     c0004368 <do_unlink+0x411>
c00043c1:	eb 01                	jmp    c00043c4 <do_unlink+0x46d>
c00043c3:	90                   	nop
c00043c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00043c7:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00043ca:	7f 16                	jg     c00043e2 <do_unlink+0x48b>
c00043cc:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00043d0:	75 10                	jne    c00043e2 <do_unlink+0x48b>
c00043d2:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c00043d6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00043d9:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00043dc:	0f 8c 4f ff ff ff    	jl     c0004331 <do_unlink+0x3da>
c00043e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00043e5:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00043e8:	75 17                	jne    c0004401 <do_unlink+0x4aa>
c00043ea:	8b 45 98             	mov    -0x68(%ebp),%eax
c00043ed:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00043f0:	89 50 04             	mov    %edx,0x4(%eax)
c00043f3:	83 ec 0c             	sub    $0xc,%esp
c00043f6:	ff 75 98             	pushl  -0x68(%ebp)
c00043f9:	e8 c0 03 00 00       	call   c00047be <sync_inode>
c00043fe:	83 c4 10             	add    $0x10,%esp
c0004401:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004405:	74 26                	je     c000442d <do_unlink+0x4d6>
c0004407:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000440c:	89 c1                	mov    %eax,%ecx
c000440e:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004411:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004414:	01 d0                	add    %edx,%eax
c0004416:	83 ec 0c             	sub    $0xc,%esp
c0004419:	6a 0a                	push   $0xa
c000441b:	68 00 02 00 00       	push   $0x200
c0004420:	51                   	push   %ecx
c0004421:	ff 75 b8             	pushl  -0x48(%ebp)
c0004424:	50                   	push   %eax
c0004425:	e8 ba e7 ff ff       	call   c0002be4 <rd_wt>
c000442a:	83 c4 20             	add    $0x20,%esp
c000442d:	90                   	nop
c000442e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004431:	c9                   	leave  
c0004432:	c3                   	ret    

c0004433 <do_rdwt>:
c0004433:	55                   	push   %ebp
c0004434:	89 e5                	mov    %esp,%ebp
c0004436:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000443c:	8b 45 08             	mov    0x8(%ebp),%eax
c000443f:	8b 40 68             	mov    0x68(%eax),%eax
c0004442:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004445:	8b 45 08             	mov    0x8(%ebp),%eax
c0004448:	8b 40 50             	mov    0x50(%eax),%eax
c000444b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000444e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004451:	8b 40 5c             	mov    0x5c(%eax),%eax
c0004454:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004457:	8b 45 08             	mov    0x8(%ebp),%eax
c000445a:	8b 00                	mov    (%eax),%eax
c000445c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000445f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004462:	8b 40 10             	mov    0x10(%eax),%eax
c0004465:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004468:	8b 45 08             	mov    0x8(%ebp),%eax
c000446b:	8b 40 40             	mov    0x40(%eax),%eax
c000446e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004471:	83 ec 0c             	sub    $0xc,%esp
c0004474:	ff 75 d0             	pushl  -0x30(%ebp)
c0004477:	e8 2a 07 00 00       	call   c0004ba6 <pid2proc>
c000447c:	83 c4 10             	add    $0x10,%esp
c000447f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004482:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004485:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0004488:	83 c2 50             	add    $0x50,%edx
c000448b:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c000448f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004492:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004495:	8b 40 08             	mov    0x8(%eax),%eax
c0004498:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000449b:	8b 45 08             	mov    0x8(%ebp),%eax
c000449e:	8b 00                	mov    (%eax),%eax
c00044a0:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00044a3:	83 ec 08             	sub    $0x8,%esp
c00044a6:	ff 75 bc             	pushl  -0x44(%ebp)
c00044a9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00044af:	50                   	push   %eax
c00044b0:	e8 0d f2 ff ff       	call   c00036c2 <get_inode>
c00044b5:	83 c4 10             	add    $0x10,%esp
c00044b8:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00044bb:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c00044bf:	75 10                	jne    c00044d1 <do_rdwt+0x9e>
c00044c1:	83 ec 0c             	sub    $0xc,%esp
c00044c4:	68 dc b7 00 c0       	push   $0xc000b7dc
c00044c9:	e8 5e 56 00 00       	call   c0009b2c <panic>
c00044ce:	83 c4 10             	add    $0x10,%esp
c00044d1:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00044d7:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00044da:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00044dd:	8b 40 04             	mov    0x4(%eax),%eax
c00044e0:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00044e3:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00044e7:	74 22                	je     c000450b <do_rdwt+0xd8>
c00044e9:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00044ed:	74 1c                	je     c000450b <do_rdwt+0xd8>
c00044ef:	68 a7 04 00 00       	push   $0x4a7
c00044f4:	68 48 b6 00 c0       	push   $0xc000b648
c00044f9:	68 48 b6 00 c0       	push   $0xc000b648
c00044fe:	68 ec b7 00 c0       	push   $0xc000b7ec
c0004503:	e8 42 56 00 00       	call   c0009b4a <assertion_failure>
c0004508:	83 c4 10             	add    $0x10,%esp
c000450b:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c0004511:	83 f8 01             	cmp    $0x1,%eax
c0004514:	0f 85 86 00 00 00    	jne    c00045a0 <do_rdwt+0x16d>
c000451a:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000451e:	75 09                	jne    c0004529 <do_rdwt+0xf6>
c0004520:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0004527:	eb 0d                	jmp    c0004536 <do_rdwt+0x103>
c0004529:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c000452d:	75 07                	jne    c0004536 <do_rdwt+0x103>
c000452f:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0004536:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004539:	8b 45 08             	mov    0x8(%ebp),%eax
c000453c:	89 50 68             	mov    %edx,0x68(%eax)
c000453f:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0004542:	8b 45 08             	mov    0x8(%ebp),%eax
c0004545:	89 50 58             	mov    %edx,0x58(%eax)
c0004548:	83 ec 04             	sub    $0x4,%esp
c000454b:	6a 04                	push   $0x4
c000454d:	ff 75 08             	pushl  0x8(%ebp)
c0004550:	6a 03                	push   $0x3
c0004552:	e8 1f 5f 00 00       	call   c000a476 <send_rec>
c0004557:	83 c4 10             	add    $0x10,%esp
c000455a:	8b 45 08             	mov    0x8(%ebp),%eax
c000455d:	8b 40 68             	mov    0x68(%eax),%eax
c0004560:	83 f8 66             	cmp    $0x66,%eax
c0004563:	75 13                	jne    c0004578 <do_rdwt+0x145>
c0004565:	83 ec 04             	sub    $0x4,%esp
c0004568:	ff 75 b8             	pushl  -0x48(%ebp)
c000456b:	ff 75 08             	pushl  0x8(%ebp)
c000456e:	6a 01                	push   $0x1
c0004570:	e8 01 5f 00 00       	call   c000a476 <send_rec>
c0004575:	83 c4 10             	add    $0x10,%esp
c0004578:	8b 45 08             	mov    0x8(%ebp),%eax
c000457b:	8b 40 68             	mov    0x68(%eax),%eax
c000457e:	83 f8 65             	cmp    $0x65,%eax
c0004581:	75 13                	jne    c0004596 <do_rdwt+0x163>
c0004583:	83 ec 04             	sub    $0x4,%esp
c0004586:	ff 75 b8             	pushl  -0x48(%ebp)
c0004589:	ff 75 08             	pushl  0x8(%ebp)
c000458c:	6a 01                	push   $0x1
c000458e:	e8 e3 5e 00 00       	call   c000a476 <send_rec>
c0004593:	83 c4 10             	add    $0x10,%esp
c0004596:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000459b:	e9 1c 02 00 00       	jmp    c00047bc <do_rdwt+0x389>
c00045a0:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00045a4:	75 18                	jne    c00045be <do_rdwt+0x18b>
c00045a6:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00045ac:	c1 e0 09             	shl    $0x9,%eax
c00045af:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c00045b2:	75 0a                	jne    c00045be <do_rdwt+0x18b>
c00045b4:	b8 00 00 00 00       	mov    $0x0,%eax
c00045b9:	e9 fe 01 00 00       	jmp    c00047bc <do_rdwt+0x389>
c00045be:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00045c2:	75 14                	jne    c00045d8 <do_rdwt+0x1a5>
c00045c4:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00045c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00045ca:	01 d0                	add    %edx,%eax
c00045cc:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c00045cf:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c00045d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00045d6:	eb 19                	jmp    c00045f1 <do_rdwt+0x1be>
c00045d8:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00045db:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00045de:	01 c2                	add    %eax,%edx
c00045e0:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00045e6:	c1 e0 09             	shl    $0x9,%eax
c00045e9:	39 c2                	cmp    %eax,%edx
c00045eb:	0f 4e c2             	cmovle %edx,%eax
c00045ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00045f1:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00045f4:	99                   	cltd   
c00045f5:	c1 ea 17             	shr    $0x17,%edx
c00045f8:	01 d0                	add    %edx,%eax
c00045fa:	25 ff 01 00 00       	and    $0x1ff,%eax
c00045ff:	29 d0                	sub    %edx,%eax
c0004601:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004604:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000460a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000460d:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004613:	85 c0                	test   %eax,%eax
c0004615:	0f 48 c1             	cmovs  %ecx,%eax
c0004618:	c1 f8 09             	sar    $0x9,%eax
c000461b:	01 d0                	add    %edx,%eax
c000461d:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004620:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0004626:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004629:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c000462f:	85 c0                	test   %eax,%eax
c0004631:	0f 48 c1             	cmovs  %ecx,%eax
c0004634:	c1 f8 09             	sar    $0x9,%eax
c0004637:	01 d0                	add    %edx,%eax
c0004639:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c000463c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000463f:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004642:	ba 00 00 10 00       	mov    $0x100000,%edx
c0004647:	39 d0                	cmp    %edx,%eax
c0004649:	7d 0b                	jge    c0004656 <do_rdwt+0x223>
c000464b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000464e:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004651:	83 c0 01             	add    $0x1,%eax
c0004654:	eb 05                	jmp    c000465b <do_rdwt+0x228>
c0004656:	b8 00 00 10 00       	mov    $0x100000,%eax
c000465b:	89 45 a0             	mov    %eax,-0x60(%ebp)
c000465e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004661:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004664:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000466b:	8b 45 08             	mov    0x8(%ebp),%eax
c000466e:	8b 00                	mov    (%eax),%eax
c0004670:	83 ec 0c             	sub    $0xc,%esp
c0004673:	50                   	push   %eax
c0004674:	e8 2d 05 00 00       	call   c0004ba6 <pid2proc>
c0004679:	83 c4 10             	add    $0x10,%esp
c000467c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000467f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004682:	83 ec 08             	sub    $0x8,%esp
c0004685:	50                   	push   %eax
c0004686:	ff 75 cc             	pushl  -0x34(%ebp)
c0004689:	e8 6e 28 00 00       	call   c0006efc <alloc_virtual_memory>
c000468e:	83 c4 10             	add    $0x10,%esp
c0004691:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004694:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0004697:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000469a:	e9 c5 00 00 00       	jmp    c0004764 <do_rdwt+0x331>
c000469f:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00046a2:	c1 e0 09             	shl    $0x9,%eax
c00046a5:	2b 45 ec             	sub    -0x14(%ebp),%eax
c00046a8:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00046ab:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c00046af:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00046b2:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c00046b9:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00046bd:	75 46                	jne    c0004705 <do_rdwt+0x2d2>
c00046bf:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00046c2:	c1 e0 09             	shl    $0x9,%eax
c00046c5:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00046cb:	83 ec 0c             	sub    $0xc,%esp
c00046ce:	6a 07                	push   $0x7
c00046d0:	50                   	push   %eax
c00046d1:	52                   	push   %edx
c00046d2:	ff 75 90             	pushl  -0x70(%ebp)
c00046d5:	ff 75 e0             	pushl  -0x20(%ebp)
c00046d8:	e8 07 e5 ff ff       	call   c0002be4 <rd_wt>
c00046dd:	83 c4 20             	add    $0x20,%esp
c00046e0:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00046e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046e9:	01 d0                	add    %edx,%eax
c00046eb:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c00046ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00046f1:	01 ca                	add    %ecx,%edx
c00046f3:	83 ec 04             	sub    $0x4,%esp
c00046f6:	ff 75 94             	pushl  -0x6c(%ebp)
c00046f9:	50                   	push   %eax
c00046fa:	52                   	push   %edx
c00046fb:	e8 65 34 00 00       	call   c0007b65 <Memcpy>
c0004700:	83 c4 10             	add    $0x10,%esp
c0004703:	eb 46                	jmp    c000474b <do_rdwt+0x318>
c0004705:	8b 55 98             	mov    -0x68(%ebp),%edx
c0004708:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000470b:	01 d0                	add    %edx,%eax
c000470d:	89 c1                	mov    %eax,%ecx
c000470f:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004715:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004718:	01 d0                	add    %edx,%eax
c000471a:	83 ec 04             	sub    $0x4,%esp
c000471d:	ff 75 94             	pushl  -0x6c(%ebp)
c0004720:	51                   	push   %ecx
c0004721:	50                   	push   %eax
c0004722:	e8 3e 34 00 00       	call   c0007b65 <Memcpy>
c0004727:	83 c4 10             	add    $0x10,%esp
c000472a:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000472d:	c1 e0 09             	shl    $0x9,%eax
c0004730:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c0004736:	83 ec 0c             	sub    $0xc,%esp
c0004739:	6a 0a                	push   $0xa
c000473b:	50                   	push   %eax
c000473c:	52                   	push   %edx
c000473d:	ff 75 90             	pushl  -0x70(%ebp)
c0004740:	ff 75 e0             	pushl  -0x20(%ebp)
c0004743:	e8 9c e4 ff ff       	call   c0002be4 <rd_wt>
c0004748:	83 c4 20             	add    $0x20,%esp
c000474b:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000474e:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0004751:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004754:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0004757:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000475e:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004761:	01 45 e0             	add    %eax,-0x20(%ebp)
c0004764:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004767:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c000476a:	7f 0a                	jg     c0004776 <do_rdwt+0x343>
c000476c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004770:	0f 85 29 ff ff ff    	jne    c000469f <do_rdwt+0x26c>
c0004776:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004779:	8b 50 04             	mov    0x4(%eax),%edx
c000477c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000477f:	01 c2                	add    %eax,%edx
c0004781:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004784:	89 50 04             	mov    %edx,0x4(%eax)
c0004787:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000478a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000478d:	01 c2                	add    %eax,%edx
c000478f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004795:	39 c2                	cmp    %eax,%edx
c0004797:	7e 20                	jle    c00047b9 <do_rdwt+0x386>
c0004799:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000479c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000479f:	01 d0                	add    %edx,%eax
c00047a1:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00047a7:	83 ec 0c             	sub    $0xc,%esp
c00047aa:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00047b0:	50                   	push   %eax
c00047b1:	e8 08 00 00 00       	call   c00047be <sync_inode>
c00047b6:	83 c4 10             	add    $0x10,%esp
c00047b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00047bc:	c9                   	leave  
c00047bd:	c3                   	ret    

c00047be <sync_inode>:
c00047be:	55                   	push   %ebp
c00047bf:	89 e5                	mov    %esp,%ebp
c00047c1:	53                   	push   %ebx
c00047c2:	83 ec 34             	sub    $0x34,%esp
c00047c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00047cc:	eb 74                	jmp    c0004842 <sync_inode+0x84>
c00047ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00047d1:	89 d0                	mov    %edx,%eax
c00047d3:	c1 e0 02             	shl    $0x2,%eax
c00047d6:	01 d0                	add    %edx,%eax
c00047d8:	c1 e0 03             	shl    $0x3,%eax
c00047db:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c00047e0:	8b 10                	mov    (%eax),%edx
c00047e2:	8b 45 08             	mov    0x8(%ebp),%eax
c00047e5:	8b 40 10             	mov    0x10(%eax),%eax
c00047e8:	39 c2                	cmp    %eax,%edx
c00047ea:	75 52                	jne    c000483e <sync_inode+0x80>
c00047ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00047ef:	89 d0                	mov    %edx,%eax
c00047f1:	c1 e0 02             	shl    $0x2,%eax
c00047f4:	01 d0                	add    %edx,%eax
c00047f6:	c1 e0 03             	shl    $0x3,%eax
c00047f9:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c00047ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0004802:	8b 08                	mov    (%eax),%ecx
c0004804:	89 0a                	mov    %ecx,(%edx)
c0004806:	8b 48 04             	mov    0x4(%eax),%ecx
c0004809:	89 4a 04             	mov    %ecx,0x4(%edx)
c000480c:	8b 48 08             	mov    0x8(%eax),%ecx
c000480f:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004812:	8b 48 0c             	mov    0xc(%eax),%ecx
c0004815:	89 4a 0c             	mov    %ecx,0xc(%edx)
c0004818:	8b 48 10             	mov    0x10(%eax),%ecx
c000481b:	89 4a 10             	mov    %ecx,0x10(%edx)
c000481e:	8b 48 14             	mov    0x14(%eax),%ecx
c0004821:	89 4a 14             	mov    %ecx,0x14(%edx)
c0004824:	8b 48 18             	mov    0x18(%eax),%ecx
c0004827:	89 4a 18             	mov    %ecx,0x18(%edx)
c000482a:	8b 48 1c             	mov    0x1c(%eax),%ecx
c000482d:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004830:	8b 48 20             	mov    0x20(%eax),%ecx
c0004833:	89 4a 20             	mov    %ecx,0x20(%edx)
c0004836:	8b 40 24             	mov    0x24(%eax),%eax
c0004839:	89 42 24             	mov    %eax,0x24(%edx)
c000483c:	eb 0a                	jmp    c0004848 <sync_inode+0x8a>
c000483e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004842:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0004846:	7e 86                	jle    c00047ce <sync_inode+0x10>
c0004848:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c000484f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004852:	8b 40 10             	mov    0x10(%eax),%eax
c0004855:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004858:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000485b:	8d 48 ff             	lea    -0x1(%eax),%ecx
c000485e:	b8 00 02 00 00       	mov    $0x200,%eax
c0004863:	99                   	cltd   
c0004864:	f7 7d f0             	idivl  -0x10(%ebp)
c0004867:	89 c3                	mov    %eax,%ebx
c0004869:	89 c8                	mov    %ecx,%eax
c000486b:	99                   	cltd   
c000486c:	f7 fb                	idiv   %ebx
c000486e:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004871:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004874:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004877:	b8 00 02 00 00       	mov    $0x200,%eax
c000487c:	99                   	cltd   
c000487d:	f7 7d f0             	idivl  -0x10(%ebp)
c0004880:	89 c3                	mov    %eax,%ebx
c0004882:	89 c8                	mov    %ecx,%eax
c0004884:	99                   	cltd   
c0004885:	f7 fb                	idiv   %ebx
c0004887:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000488a:	8b 45 08             	mov    0x8(%ebp),%eax
c000488d:	8b 40 20             	mov    0x20(%eax),%eax
c0004890:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004893:	e8 0a 01 00 00       	call   c00049a2 <get_super_block>
c0004898:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000489b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000489e:	8b 40 04             	mov    0x4(%eax),%eax
c00048a1:	8d 50 02             	lea    0x2(%eax),%edx
c00048a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00048a7:	8b 40 08             	mov    0x8(%eax),%eax
c00048aa:	01 c2                	add    %eax,%edx
c00048ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00048af:	01 d0                	add    %edx,%eax
c00048b1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00048b4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00048b9:	83 ec 0c             	sub    $0xc,%esp
c00048bc:	6a 07                	push   $0x7
c00048be:	68 00 02 00 00       	push   $0x200
c00048c3:	50                   	push   %eax
c00048c4:	ff 75 e0             	pushl  -0x20(%ebp)
c00048c7:	ff 75 d8             	pushl  -0x28(%ebp)
c00048ca:	e8 15 e3 ff ff       	call   c0002be4 <rd_wt>
c00048cf:	83 c4 20             	add    $0x20,%esp
c00048d2:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00048d7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00048da:	83 ec 04             	sub    $0x4,%esp
c00048dd:	ff 75 f0             	pushl  -0x10(%ebp)
c00048e0:	ff 75 08             	pushl  0x8(%ebp)
c00048e3:	ff 75 d4             	pushl  -0x2c(%ebp)
c00048e6:	e8 7a 32 00 00       	call   c0007b65 <Memcpy>
c00048eb:	83 c4 10             	add    $0x10,%esp
c00048ee:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00048f3:	83 ec 0c             	sub    $0xc,%esp
c00048f6:	6a 0a                	push   $0xa
c00048f8:	68 00 02 00 00       	push   $0x200
c00048fd:	50                   	push   %eax
c00048fe:	ff 75 e0             	pushl  -0x20(%ebp)
c0004901:	ff 75 d8             	pushl  -0x28(%ebp)
c0004904:	e8 db e2 ff ff       	call   c0002be4 <rd_wt>
c0004909:	83 c4 20             	add    $0x20,%esp
c000490c:	90                   	nop
c000490d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004910:	c9                   	leave  
c0004911:	c3                   	ret    

c0004912 <put_inode>:
c0004912:	55                   	push   %ebp
c0004913:	89 e5                	mov    %esp,%ebp
c0004915:	83 ec 08             	sub    $0x8,%esp
c0004918:	8b 45 08             	mov    0x8(%ebp),%eax
c000491b:	8b 40 24             	mov    0x24(%eax),%eax
c000491e:	85 c0                	test   %eax,%eax
c0004920:	7f 1c                	jg     c000493e <put_inode+0x2c>
c0004922:	68 4c 05 00 00       	push   $0x54c
c0004927:	68 48 b6 00 c0       	push   $0xc000b648
c000492c:	68 48 b6 00 c0       	push   $0xc000b648
c0004931:	68 20 b8 00 c0       	push   $0xc000b820
c0004936:	e8 0f 52 00 00       	call   c0009b4a <assertion_failure>
c000493b:	83 c4 10             	add    $0x10,%esp
c000493e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004941:	8b 40 24             	mov    0x24(%eax),%eax
c0004944:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004947:	8b 45 08             	mov    0x8(%ebp),%eax
c000494a:	89 50 24             	mov    %edx,0x24(%eax)
c000494d:	90                   	nop
c000494e:	c9                   	leave  
c000494f:	c3                   	ret    

c0004950 <do_close>:
c0004950:	55                   	push   %ebp
c0004951:	89 e5                	mov    %esp,%ebp
c0004953:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0004958:	8b 55 08             	mov    0x8(%ebp),%edx
c000495b:	83 c2 50             	add    $0x50,%edx
c000495e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004962:	8b 50 0c             	mov    0xc(%eax),%edx
c0004965:	83 ea 01             	sub    $0x1,%edx
c0004968:	89 50 0c             	mov    %edx,0xc(%eax)
c000496b:	8b 40 0c             	mov    0xc(%eax),%eax
c000496e:	85 c0                	test   %eax,%eax
c0004970:	75 16                	jne    c0004988 <do_close+0x38>
c0004972:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0004977:	8b 55 08             	mov    0x8(%ebp),%edx
c000497a:	83 c2 50             	add    $0x50,%edx
c000497d:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004981:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0004988:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000498d:	8b 55 08             	mov    0x8(%ebp),%edx
c0004990:	83 c2 50             	add    $0x50,%edx
c0004993:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c000499a:	00 
c000499b:	b8 00 00 00 00       	mov    $0x0,%eax
c00049a0:	5d                   	pop    %ebp
c00049a1:	c3                   	ret    

c00049a2 <get_super_block>:
c00049a2:	55                   	push   %ebp
c00049a3:	89 e5                	mov    %esp,%ebp
c00049a5:	83 ec 08             	sub    $0x8,%esp
c00049a8:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00049ad:	83 ec 0c             	sub    $0xc,%esp
c00049b0:	6a 07                	push   $0x7
c00049b2:	68 00 02 00 00       	push   $0x200
c00049b7:	50                   	push   %eax
c00049b8:	6a 20                	push   $0x20
c00049ba:	6a 01                	push   $0x1
c00049bc:	e8 23 e2 ff ff       	call   c0002be4 <rd_wt>
c00049c1:	83 c4 20             	add    $0x20,%esp
c00049c4:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00049ca:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00049cf:	8b 0a                	mov    (%edx),%ecx
c00049d1:	89 08                	mov    %ecx,(%eax)
c00049d3:	8b 4a 04             	mov    0x4(%edx),%ecx
c00049d6:	89 48 04             	mov    %ecx,0x4(%eax)
c00049d9:	8b 4a 08             	mov    0x8(%edx),%ecx
c00049dc:	89 48 08             	mov    %ecx,0x8(%eax)
c00049df:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00049e2:	89 48 0c             	mov    %ecx,0xc(%eax)
c00049e5:	8b 4a 10             	mov    0x10(%edx),%ecx
c00049e8:	89 48 10             	mov    %ecx,0x10(%eax)
c00049eb:	8b 4a 14             	mov    0x14(%edx),%ecx
c00049ee:	89 48 14             	mov    %ecx,0x14(%eax)
c00049f1:	8b 4a 18             	mov    0x18(%edx),%ecx
c00049f4:	89 48 18             	mov    %ecx,0x18(%eax)
c00049f7:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00049fa:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00049fd:	8b 52 20             	mov    0x20(%edx),%edx
c0004a00:	89 50 20             	mov    %edx,0x20(%eax)
c0004a03:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0004a08:	c9                   	leave  
c0004a09:	c3                   	ret    

c0004a0a <check>:
c0004a0a:	55                   	push   %ebp
c0004a0b:	89 e5                	mov    %esp,%ebp
c0004a0d:	83 ec 10             	sub    $0x10,%esp
c0004a10:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0004a17:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004a1e:	eb 08                	jmp    c0004a28 <check+0x1e>
c0004a20:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0004a24:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0004a28:	83 7d f8 03          	cmpl   $0x3,-0x8(%ebp)
c0004a2c:	7e f2                	jle    c0004a20 <check+0x16>
c0004a2e:	90                   	nop
c0004a2f:	c9                   	leave  
c0004a30:	c3                   	ret    

c0004a31 <schedule_process>:
c0004a31:	55                   	push   %ebp
c0004a32:	89 e5                	mov    %esp,%ebp
c0004a34:	83 ec 18             	sub    $0x18,%esp
c0004a37:	c7 45 f4 00 00 10 00 	movl   $0x100000,-0xc(%ebp)
c0004a3e:	e8 54 ce ff ff       	call   c0001897 <get_running_thread_pcb>
c0004a43:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004a46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a49:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004a50:	84 c0                	test   %al,%al
c0004a52:	75 30                	jne    c0004a84 <schedule_process+0x53>
c0004a54:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a57:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c0004a5e:	00 00 00 
c0004a61:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a64:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004a6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a6e:	05 00 01 00 00       	add    $0x100,%eax
c0004a73:	83 ec 08             	sub    $0x8,%esp
c0004a76:	50                   	push   %eax
c0004a77:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a7c:	e8 a6 66 00 00       	call   c000b127 <insertToDoubleLinkList>
c0004a81:	83 c4 10             	add    $0x10,%esp
c0004a84:	83 ec 0c             	sub    $0xc,%esp
c0004a87:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a8c:	e8 b2 64 00 00       	call   c000af43 <isListEmpty>
c0004a91:	83 c4 10             	add    $0x10,%esp
c0004a94:	84 c0                	test   %al,%al
c0004a96:	74 19                	je     c0004ab1 <schedule_process+0x80>
c0004a98:	6a 28                	push   $0x28
c0004a9a:	68 2f b8 00 c0       	push   $0xc000b82f
c0004a9f:	68 2f b8 00 c0       	push   $0xc000b82f
c0004aa4:	68 39 b8 00 c0       	push   $0xc000b839
c0004aa9:	e8 9c 50 00 00       	call   c0009b4a <assertion_failure>
c0004aae:	83 c4 10             	add    $0x10,%esp
c0004ab1:	83 ec 0c             	sub    $0xc,%esp
c0004ab4:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004ab9:	e8 ec 66 00 00       	call   c000b1aa <popFromDoubleLinkList>
c0004abe:	83 c4 10             	add    $0x10,%esp
c0004ac1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004ac4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004ac7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004acc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004acf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004ad2:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004ad9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004adc:	8b 40 08             	mov    0x8(%eax),%eax
c0004adf:	85 c0                	test   %eax,%eax
c0004ae1:	74 28                	je     c0004b0b <schedule_process+0xda>
c0004ae3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004ae6:	05 00 10 00 00       	add    $0x1000,%eax
c0004aeb:	83 ec 0c             	sub    $0xc,%esp
c0004aee:	50                   	push   %eax
c0004aef:	e8 94 cd ff ff       	call   c0001888 <update_tss>
c0004af4:	83 c4 10             	add    $0x10,%esp
c0004af7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004afa:	8b 40 08             	mov    0x8(%eax),%eax
c0004afd:	83 ec 0c             	sub    $0xc,%esp
c0004b00:	50                   	push   %eax
c0004b01:	e8 75 cd ff ff       	call   c000187b <update_cr3>
c0004b06:	83 c4 10             	add    $0x10,%esp
c0004b09:	eb 0f                	jmp    c0004b1a <schedule_process+0xe9>
c0004b0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b0e:	83 ec 0c             	sub    $0xc,%esp
c0004b11:	50                   	push   %eax
c0004b12:	e8 64 cd ff ff       	call   c000187b <update_cr3>
c0004b17:	83 c4 10             	add    $0x10,%esp
c0004b1a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b1d:	a3 c0 0b 01 c0       	mov    %eax,0xc0010bc0
c0004b22:	83 ec 08             	sub    $0x8,%esp
c0004b25:	ff 75 e8             	pushl  -0x18(%ebp)
c0004b28:	ff 75 f0             	pushl  -0x10(%ebp)
c0004b2b:	e8 d0 63 00 00       	call   c000af00 <switch_to>
c0004b30:	83 c4 10             	add    $0x10,%esp
c0004b33:	90                   	nop
c0004b34:	c9                   	leave  
c0004b35:	c3                   	ret    

c0004b36 <clock_handler>:
c0004b36:	55                   	push   %ebp
c0004b37:	89 e5                	mov    %esp,%ebp
c0004b39:	83 ec 18             	sub    $0x18,%esp
c0004b3c:	e8 56 cd ff ff       	call   c0001897 <get_running_thread_pcb>
c0004b41:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b44:	a1 c0 16 01 c0       	mov    0xc00116c0,%eax
c0004b49:	85 c0                	test   %eax,%eax
c0004b4b:	74 0d                	je     c0004b5a <clock_handler+0x24>
c0004b4d:	83 ec 0c             	sub    $0xc,%esp
c0004b50:	6a 04                	push   $0x4
c0004b52:	e8 ae 5b 00 00       	call   c000a705 <inform_int>
c0004b57:	83 c4 10             	add    $0x10,%esp
c0004b5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b5d:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004b63:	83 f8 05             	cmp    $0x5,%eax
c0004b66:	75 13                	jne    c0004b7b <clock_handler+0x45>
c0004b68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b6b:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004b71:	83 f8 01             	cmp    $0x1,%eax
c0004b74:	75 05                	jne    c0004b7b <clock_handler+0x45>
c0004b76:	e8 8f fe ff ff       	call   c0004a0a <check>
c0004b7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b7e:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004b84:	85 c0                	test   %eax,%eax
c0004b86:	74 16                	je     c0004b9e <clock_handler+0x68>
c0004b88:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004b8d:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c0004b93:	83 ea 01             	sub    $0x1,%edx
c0004b96:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c0004b9c:	eb 05                	jmp    c0004ba3 <clock_handler+0x6d>
c0004b9e:	e8 8e fe ff ff       	call   c0004a31 <schedule_process>
c0004ba3:	90                   	nop
c0004ba4:	c9                   	leave  
c0004ba5:	c3                   	ret    

c0004ba6 <pid2proc>:
c0004ba6:	55                   	push   %ebp
c0004ba7:	89 e5                	mov    %esp,%ebp
c0004ba9:	83 ec 20             	sub    $0x20,%esp
c0004bac:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004bb3:	a1 04 1f 01 c0       	mov    0xc0011f04,%eax
c0004bb8:	8b 15 08 1f 01 c0    	mov    0xc0011f08,%edx
c0004bbe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004bc1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004bc4:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c0004bc9:	8b 15 10 1f 01 c0    	mov    0xc0011f10,%edx
c0004bcf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004bd2:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004bd5:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0004bda:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004bdd:	eb 29                	jmp    c0004c08 <pid2proc+0x62>
c0004bdf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004be2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004be7:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004bea:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004bed:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004bf3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bf6:	39 c2                	cmp    %eax,%edx
c0004bf8:	75 05                	jne    c0004bff <pid2proc+0x59>
c0004bfa:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004bfd:	eb 17                	jmp    c0004c16 <pid2proc+0x70>
c0004bff:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c02:	8b 40 04             	mov    0x4(%eax),%eax
c0004c05:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004c08:	81 7d fc 0c 1f 01 c0 	cmpl   $0xc0011f0c,-0x4(%ebp)
c0004c0f:	75 ce                	jne    c0004bdf <pid2proc+0x39>
c0004c11:	b8 00 00 00 00       	mov    $0x0,%eax
c0004c16:	c9                   	leave  
c0004c17:	c3                   	ret    

c0004c18 <proc2pid>:
c0004c18:	55                   	push   %ebp
c0004c19:	89 e5                	mov    %esp,%ebp
c0004c1b:	83 ec 10             	sub    $0x10,%esp
c0004c1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c21:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004c27:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004c2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c2d:	c9                   	leave  
c0004c2e:	c3                   	ret    

c0004c2f <InitDescriptor>:
c0004c2f:	55                   	push   %ebp
c0004c30:	89 e5                	mov    %esp,%ebp
c0004c32:	83 ec 04             	sub    $0x4,%esp
c0004c35:	8b 45 14             	mov    0x14(%ebp),%eax
c0004c38:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004c3c:	8b 45 10             	mov    0x10(%ebp),%eax
c0004c3f:	89 c2                	mov    %eax,%edx
c0004c41:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c44:	66 89 10             	mov    %dx,(%eax)
c0004c47:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c4a:	89 c2                	mov    %eax,%edx
c0004c4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c4f:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004c53:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c56:	c1 e8 10             	shr    $0x10,%eax
c0004c59:	89 c2                	mov    %eax,%edx
c0004c5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c5e:	88 50 04             	mov    %dl,0x4(%eax)
c0004c61:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004c65:	89 c2                	mov    %eax,%edx
c0004c67:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c6a:	88 50 05             	mov    %dl,0x5(%eax)
c0004c6d:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004c71:	66 c1 e8 08          	shr    $0x8,%ax
c0004c75:	c1 e0 04             	shl    $0x4,%eax
c0004c78:	89 c2                	mov    %eax,%edx
c0004c7a:	8b 45 10             	mov    0x10(%ebp),%eax
c0004c7d:	c1 e8 10             	shr    $0x10,%eax
c0004c80:	83 e0 0f             	and    $0xf,%eax
c0004c83:	09 c2                	or     %eax,%edx
c0004c85:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c88:	88 50 06             	mov    %dl,0x6(%eax)
c0004c8b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c8e:	c1 e8 18             	shr    $0x18,%eax
c0004c91:	89 c2                	mov    %eax,%edx
c0004c93:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c96:	88 50 07             	mov    %dl,0x7(%eax)
c0004c99:	90                   	nop
c0004c9a:	c9                   	leave  
c0004c9b:	c3                   	ret    

c0004c9c <Seg2PhyAddr>:
c0004c9c:	55                   	push   %ebp
c0004c9d:	89 e5                	mov    %esp,%ebp
c0004c9f:	83 ec 10             	sub    $0x10,%esp
c0004ca2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ca5:	c1 e8 03             	shr    $0x3,%eax
c0004ca8:	8b 14 c5 c4 07 01 c0 	mov    -0x3ffef83c(,%eax,8),%edx
c0004caf:	8b 04 c5 c0 07 01 c0 	mov    -0x3ffef840(,%eax,8),%eax
c0004cb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cb9:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004cbc:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004cc0:	0f b7 c0             	movzwl %ax,%eax
c0004cc3:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004cc7:	0f b6 d2             	movzbl %dl,%edx
c0004cca:	c1 e2 10             	shl    $0x10,%edx
c0004ccd:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004cd3:	09 d0                	or     %edx,%eax
c0004cd5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004cd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004cdb:	c9                   	leave  
c0004cdc:	c3                   	ret    

c0004cdd <Seg2PhyAddrLDT>:
c0004cdd:	55                   	push   %ebp
c0004cde:	89 e5                	mov    %esp,%ebp
c0004ce0:	83 ec 10             	sub    $0x10,%esp
c0004ce3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ce6:	c1 e8 03             	shr    $0x3,%eax
c0004ce9:	89 c2                	mov    %eax,%edx
c0004ceb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004cee:	83 c2 22             	add    $0x22,%edx
c0004cf1:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0004cf5:	8b 02                	mov    (%edx),%eax
c0004cf7:	8b 52 04             	mov    0x4(%edx),%edx
c0004cfa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cfd:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004d00:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004d04:	0f b7 c0             	movzwl %ax,%eax
c0004d07:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004d0b:	0f b6 d2             	movzbl %dl,%edx
c0004d0e:	c1 e2 10             	shl    $0x10,%edx
c0004d11:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004d17:	09 d0                	or     %edx,%eax
c0004d19:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004d1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d1f:	c9                   	leave  
c0004d20:	c3                   	ret    

c0004d21 <VirAddr2PhyAddr>:
c0004d21:	55                   	push   %ebp
c0004d22:	89 e5                	mov    %esp,%ebp
c0004d24:	83 ec 10             	sub    $0x10,%esp
c0004d27:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004d2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d2d:	01 d0                	add    %edx,%eax
c0004d2f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004d32:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d35:	c9                   	leave  
c0004d36:	c3                   	ret    

c0004d37 <v2l>:
c0004d37:	55                   	push   %ebp
c0004d38:	89 e5                	mov    %esp,%ebp
c0004d3a:	83 ec 18             	sub    $0x18,%esp
c0004d3d:	83 ec 0c             	sub    $0xc,%esp
c0004d40:	ff 75 08             	pushl  0x8(%ebp)
c0004d43:	e8 5e fe ff ff       	call   c0004ba6 <pid2proc>
c0004d48:	83 c4 10             	add    $0x10,%esp
c0004d4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d4e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004d55:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004d58:	83 ec 08             	sub    $0x8,%esp
c0004d5b:	ff 75 f4             	pushl  -0xc(%ebp)
c0004d5e:	50                   	push   %eax
c0004d5f:	e8 79 ff ff ff       	call   c0004cdd <Seg2PhyAddrLDT>
c0004d64:	83 c4 10             	add    $0x10,%esp
c0004d67:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004d6a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004d6d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004d70:	01 d0                	add    %edx,%eax
c0004d72:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004d75:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004d78:	c9                   	leave  
c0004d79:	c3                   	ret    

c0004d7a <init_propt>:
c0004d7a:	55                   	push   %ebp
c0004d7b:	89 e5                	mov    %esp,%ebp
c0004d7d:	83 ec 38             	sub    $0x38,%esp
c0004d80:	6a 0e                	push   $0xe
c0004d82:	6a 08                	push   $0x8
c0004d84:	68 71 16 00 c0       	push   $0xc0001671
c0004d89:	6a 20                	push   $0x20
c0004d8b:	e8 58 01 00 00       	call   c0004ee8 <InitInterruptDesc>
c0004d90:	83 c4 10             	add    $0x10,%esp
c0004d93:	6a 0e                	push   $0xe
c0004d95:	6a 08                	push   $0x8
c0004d97:	68 9e 16 00 c0       	push   $0xc000169e
c0004d9c:	6a 21                	push   $0x21
c0004d9e:	e8 45 01 00 00       	call   c0004ee8 <InitInterruptDesc>
c0004da3:	83 c4 10             	add    $0x10,%esp
c0004da6:	6a 0e                	push   $0xe
c0004da8:	6a 08                	push   $0x8
c0004daa:	68 e0 16 00 c0       	push   $0xc00016e0
c0004daf:	6a 2e                	push   $0x2e
c0004db1:	e8 32 01 00 00       	call   c0004ee8 <InitInterruptDesc>
c0004db6:	83 c4 10             	add    $0x10,%esp
c0004db9:	83 ec 04             	sub    $0x4,%esp
c0004dbc:	68 a0 15 00 00       	push   $0x15a0
c0004dc1:	6a 00                	push   $0x0
c0004dc3:	68 00 32 08 c0       	push   $0xc0083200
c0004dc8:	e8 7e 74 00 00       	call   c000c24b <Memset>
c0004dcd:	83 c4 10             	add    $0x10,%esp
c0004dd0:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004dd7:	83 ec 04             	sub    $0x4,%esp
c0004dda:	ff 75 f4             	pushl  -0xc(%ebp)
c0004ddd:	6a 00                	push   $0x0
c0004ddf:	68 40 16 01 c0       	push   $0xc0011640
c0004de4:	e8 62 74 00 00       	call   c000c24b <Memset>
c0004de9:	83 c4 10             	add    $0x10,%esp
c0004dec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004def:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c0004df4:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c0004dfb:	00 00 00 
c0004dfe:	83 ec 0c             	sub    $0xc,%esp
c0004e01:	6a 30                	push   $0x30
c0004e03:	e8 94 fe ff ff       	call   c0004c9c <Seg2PhyAddr>
c0004e08:	83 c4 10             	add    $0x10,%esp
c0004e0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004e0e:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c0004e15:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004e1c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004e1f:	0f b7 d0             	movzwl %ax,%edx
c0004e22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004e25:	83 e8 01             	sub    $0x1,%eax
c0004e28:	89 c1                	mov    %eax,%ecx
c0004e2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004e2d:	52                   	push   %edx
c0004e2e:	51                   	push   %ecx
c0004e2f:	50                   	push   %eax
c0004e30:	68 00 08 01 c0       	push   $0xc0010800
c0004e35:	e8 f5 fd ff ff       	call   c0004c2f <InitDescriptor>
c0004e3a:	83 c4 10             	add    $0x10,%esp
c0004e3d:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004e44:	68 f2 00 00 00       	push   $0xf2
c0004e49:	68 ff ff 00 00       	push   $0xffff
c0004e4e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004e51:	68 f8 07 01 c0       	push   $0xc00107f8
c0004e56:	e8 d4 fd ff ff       	call   c0004c2f <InitDescriptor>
c0004e5b:	83 c4 10             	add    $0x10,%esp
c0004e5e:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004e65:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004e6c:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004e73:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004e76:	0f b7 c0             	movzwl %ax,%eax
c0004e79:	50                   	push   %eax
c0004e7a:	ff 75 d8             	pushl  -0x28(%ebp)
c0004e7d:	6a 00                	push   $0x0
c0004e7f:	68 08 08 01 c0       	push   $0xc0010808
c0004e84:	e8 a6 fd ff ff       	call   c0004c2f <InitDescriptor>
c0004e89:	83 c4 10             	add    $0x10,%esp
c0004e8c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004e8f:	0f b7 c0             	movzwl %ax,%eax
c0004e92:	50                   	push   %eax
c0004e93:	ff 75 d8             	pushl  -0x28(%ebp)
c0004e96:	6a 00                	push   $0x0
c0004e98:	68 10 08 01 c0       	push   $0xc0010810
c0004e9d:	e8 8d fd ff ff       	call   c0004c2f <InitDescriptor>
c0004ea2:	83 c4 10             	add    $0x10,%esp
c0004ea5:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0004eac:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0004eb3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004eb6:	0f b7 c0             	movzwl %ax,%eax
c0004eb9:	50                   	push   %eax
c0004eba:	ff 75 d8             	pushl  -0x28(%ebp)
c0004ebd:	6a 00                	push   $0x0
c0004ebf:	68 18 08 01 c0       	push   $0xc0010818
c0004ec4:	e8 66 fd ff ff       	call   c0004c2f <InitDescriptor>
c0004ec9:	83 c4 10             	add    $0x10,%esp
c0004ecc:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004ecf:	0f b7 c0             	movzwl %ax,%eax
c0004ed2:	50                   	push   %eax
c0004ed3:	ff 75 d8             	pushl  -0x28(%ebp)
c0004ed6:	6a 00                	push   $0x0
c0004ed8:	68 20 08 01 c0       	push   $0xc0010820
c0004edd:	e8 4d fd ff ff       	call   c0004c2f <InitDescriptor>
c0004ee2:	83 c4 10             	add    $0x10,%esp
c0004ee5:	90                   	nop
c0004ee6:	c9                   	leave  
c0004ee7:	c3                   	ret    

c0004ee8 <InitInterruptDesc>:
c0004ee8:	55                   	push   %ebp
c0004ee9:	89 e5                	mov    %esp,%ebp
c0004eeb:	83 ec 10             	sub    $0x10,%esp
c0004eee:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef1:	c1 e0 03             	shl    $0x3,%eax
c0004ef4:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c0004ef9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004efc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004eff:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004f03:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f06:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004f09:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004f0c:	89 c2                	mov    %eax,%edx
c0004f0e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f11:	66 89 10             	mov    %dx,(%eax)
c0004f14:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f17:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004f1d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004f20:	c1 f8 10             	sar    $0x10,%eax
c0004f23:	89 c2                	mov    %eax,%edx
c0004f25:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f28:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004f2c:	8b 45 10             	mov    0x10(%ebp),%eax
c0004f2f:	c1 e0 04             	shl    $0x4,%eax
c0004f32:	89 c2                	mov    %eax,%edx
c0004f34:	8b 45 14             	mov    0x14(%ebp),%eax
c0004f37:	09 d0                	or     %edx,%eax
c0004f39:	89 c2                	mov    %eax,%edx
c0004f3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f3e:	88 50 05             	mov    %dl,0x5(%eax)
c0004f41:	90                   	nop
c0004f42:	c9                   	leave  
c0004f43:	c3                   	ret    

c0004f44 <ReloadGDT>:
c0004f44:	55                   	push   %ebp
c0004f45:	89 e5                	mov    %esp,%ebp
c0004f47:	83 ec 28             	sub    $0x28,%esp
c0004f4a:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c0004f4f:	0f b7 00             	movzwl (%eax),%eax
c0004f52:	98                   	cwtl   
c0004f53:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c0004f58:	8b 12                	mov    (%edx),%edx
c0004f5a:	83 ec 04             	sub    $0x4,%esp
c0004f5d:	50                   	push   %eax
c0004f5e:	52                   	push   %edx
c0004f5f:	68 c0 07 01 c0       	push   $0xc00107c0
c0004f64:	e8 b4 72 00 00       	call   c000c21d <Memcpy2>
c0004f69:	83 c4 10             	add    $0x10,%esp
c0004f6c:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c0004f73:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c0004f7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004f7d:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004f82:	ba c0 07 01 c0       	mov    $0xc00107c0,%edx
c0004f87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004f8a:	89 10                	mov    %edx,(%eax)
c0004f8c:	c7 45 e8 88 07 01 c0 	movl   $0xc0010788,-0x18(%ebp)
c0004f93:	c7 45 e4 8a 07 01 c0 	movl   $0xc001078a,-0x1c(%ebp)
c0004f9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004f9d:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004fa2:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c0004fa7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004faa:	89 10                	mov    %edx,(%eax)
c0004fac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004fb3:	eb 04                	jmp    c0004fb9 <ReloadGDT+0x75>
c0004fb5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004fb9:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004fc0:	7e f3                	jle    c0004fb5 <ReloadGDT+0x71>
c0004fc2:	e8 75 34 00 00       	call   c000843c <init_internal_interrupt>
c0004fc7:	e8 ae fd ff ff       	call   c0004d7a <init_propt>
c0004fcc:	90                   	nop
c0004fcd:	c9                   	leave  
c0004fce:	c3                   	ret    

c0004fcf <select_console>:
c0004fcf:	55                   	push   %ebp
c0004fd0:	89 e5                	mov    %esp,%ebp
c0004fd2:	83 ec 18             	sub    $0x18,%esp
c0004fd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fd8:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004fdb:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0004fdf:	75 27                	jne    c0005008 <select_console+0x39>
c0004fe1:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004fe5:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004feb:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0004ff0:	a3 80 07 01 c0       	mov    %eax,0xc0010780
c0004ff5:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0004ffa:	83 ec 0c             	sub    $0xc,%esp
c0004ffd:	50                   	push   %eax
c0004ffe:	e8 08 00 00 00       	call   c000500b <flush>
c0005003:	83 c4 10             	add    $0x10,%esp
c0005006:	eb 01                	jmp    c0005009 <select_console+0x3a>
c0005008:	90                   	nop
c0005009:	c9                   	leave  
c000500a:	c3                   	ret    

c000500b <flush>:
c000500b:	55                   	push   %ebp
c000500c:	89 e5                	mov    %esp,%ebp
c000500e:	83 ec 08             	sub    $0x8,%esp
c0005011:	8b 45 08             	mov    0x8(%ebp),%eax
c0005014:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000501a:	8b 40 0c             	mov    0xc(%eax),%eax
c000501d:	83 ec 0c             	sub    $0xc,%esp
c0005020:	50                   	push   %eax
c0005021:	e8 1e 00 00 00       	call   c0005044 <set_cursor>
c0005026:	83 c4 10             	add    $0x10,%esp
c0005029:	8b 45 08             	mov    0x8(%ebp),%eax
c000502c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005032:	8b 40 08             	mov    0x8(%eax),%eax
c0005035:	83 ec 0c             	sub    $0xc,%esp
c0005038:	50                   	push   %eax
c0005039:	e8 64 00 00 00       	call   c00050a2 <set_console_start_video_addr>
c000503e:	83 c4 10             	add    $0x10,%esp
c0005041:	90                   	nop
c0005042:	c9                   	leave  
c0005043:	c3                   	ret    

c0005044 <set_cursor>:
c0005044:	55                   	push   %ebp
c0005045:	89 e5                	mov    %esp,%ebp
c0005047:	83 ec 08             	sub    $0x8,%esp
c000504a:	83 ec 08             	sub    $0x8,%esp
c000504d:	6a 0e                	push   $0xe
c000504f:	68 d4 03 00 00       	push   $0x3d4
c0005054:	e8 40 c7 ff ff       	call   c0001799 <out_byte>
c0005059:	83 c4 10             	add    $0x10,%esp
c000505c:	8b 45 08             	mov    0x8(%ebp),%eax
c000505f:	c1 e8 08             	shr    $0x8,%eax
c0005062:	0f b7 c0             	movzwl %ax,%eax
c0005065:	83 ec 08             	sub    $0x8,%esp
c0005068:	50                   	push   %eax
c0005069:	68 d5 03 00 00       	push   $0x3d5
c000506e:	e8 26 c7 ff ff       	call   c0001799 <out_byte>
c0005073:	83 c4 10             	add    $0x10,%esp
c0005076:	83 ec 08             	sub    $0x8,%esp
c0005079:	6a 0f                	push   $0xf
c000507b:	68 d4 03 00 00       	push   $0x3d4
c0005080:	e8 14 c7 ff ff       	call   c0001799 <out_byte>
c0005085:	83 c4 10             	add    $0x10,%esp
c0005088:	8b 45 08             	mov    0x8(%ebp),%eax
c000508b:	0f b7 c0             	movzwl %ax,%eax
c000508e:	83 ec 08             	sub    $0x8,%esp
c0005091:	50                   	push   %eax
c0005092:	68 d5 03 00 00       	push   $0x3d5
c0005097:	e8 fd c6 ff ff       	call   c0001799 <out_byte>
c000509c:	83 c4 10             	add    $0x10,%esp
c000509f:	90                   	nop
c00050a0:	c9                   	leave  
c00050a1:	c3                   	ret    

c00050a2 <set_console_start_video_addr>:
c00050a2:	55                   	push   %ebp
c00050a3:	89 e5                	mov    %esp,%ebp
c00050a5:	83 ec 08             	sub    $0x8,%esp
c00050a8:	83 ec 08             	sub    $0x8,%esp
c00050ab:	6a 0c                	push   $0xc
c00050ad:	68 d4 03 00 00       	push   $0x3d4
c00050b2:	e8 e2 c6 ff ff       	call   c0001799 <out_byte>
c00050b7:	83 c4 10             	add    $0x10,%esp
c00050ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00050bd:	c1 e8 08             	shr    $0x8,%eax
c00050c0:	0f b7 c0             	movzwl %ax,%eax
c00050c3:	83 ec 08             	sub    $0x8,%esp
c00050c6:	50                   	push   %eax
c00050c7:	68 d5 03 00 00       	push   $0x3d5
c00050cc:	e8 c8 c6 ff ff       	call   c0001799 <out_byte>
c00050d1:	83 c4 10             	add    $0x10,%esp
c00050d4:	83 ec 08             	sub    $0x8,%esp
c00050d7:	6a 0d                	push   $0xd
c00050d9:	68 d4 03 00 00       	push   $0x3d4
c00050de:	e8 b6 c6 ff ff       	call   c0001799 <out_byte>
c00050e3:	83 c4 10             	add    $0x10,%esp
c00050e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00050e9:	0f b7 c0             	movzwl %ax,%eax
c00050ec:	83 ec 08             	sub    $0x8,%esp
c00050ef:	50                   	push   %eax
c00050f0:	68 d5 03 00 00       	push   $0x3d5
c00050f5:	e8 9f c6 ff ff       	call   c0001799 <out_byte>
c00050fa:	83 c4 10             	add    $0x10,%esp
c00050fd:	90                   	nop
c00050fe:	c9                   	leave  
c00050ff:	c3                   	ret    

c0005100 <put_key>:
c0005100:	55                   	push   %ebp
c0005101:	89 e5                	mov    %esp,%ebp
c0005103:	83 ec 04             	sub    $0x4,%esp
c0005106:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005109:	88 45 fc             	mov    %al,-0x4(%ebp)
c000510c:	8b 45 08             	mov    0x8(%ebp),%eax
c000510f:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005115:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c000511a:	77 4d                	ja     c0005169 <put_key+0x69>
c000511c:	8b 45 08             	mov    0x8(%ebp),%eax
c000511f:	8b 00                	mov    (%eax),%eax
c0005121:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0005125:	89 10                	mov    %edx,(%eax)
c0005127:	8b 45 08             	mov    0x8(%ebp),%eax
c000512a:	8b 00                	mov    (%eax),%eax
c000512c:	8d 50 04             	lea    0x4(%eax),%edx
c000512f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005132:	89 10                	mov    %edx,(%eax)
c0005134:	8b 45 08             	mov    0x8(%ebp),%eax
c0005137:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000513d:	8d 50 01             	lea    0x1(%eax),%edx
c0005140:	8b 45 08             	mov    0x8(%ebp),%eax
c0005143:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0005149:	8b 45 08             	mov    0x8(%ebp),%eax
c000514c:	8b 00                	mov    (%eax),%eax
c000514e:	8b 55 08             	mov    0x8(%ebp),%edx
c0005151:	83 c2 08             	add    $0x8,%edx
c0005154:	81 c2 00 08 00 00    	add    $0x800,%edx
c000515a:	39 d0                	cmp    %edx,%eax
c000515c:	75 0b                	jne    c0005169 <put_key+0x69>
c000515e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005161:	8d 50 08             	lea    0x8(%eax),%edx
c0005164:	8b 45 08             	mov    0x8(%ebp),%eax
c0005167:	89 10                	mov    %edx,(%eax)
c0005169:	90                   	nop
c000516a:	c9                   	leave  
c000516b:	c3                   	ret    

c000516c <scroll_up>:
c000516c:	55                   	push   %ebp
c000516d:	89 e5                	mov    %esp,%ebp
c000516f:	83 ec 08             	sub    $0x8,%esp
c0005172:	8b 45 08             	mov    0x8(%ebp),%eax
c0005175:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000517b:	8b 40 08             	mov    0x8(%eax),%eax
c000517e:	8d 50 b0             	lea    -0x50(%eax),%edx
c0005181:	8b 45 08             	mov    0x8(%ebp),%eax
c0005184:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000518a:	8b 00                	mov    (%eax),%eax
c000518c:	39 c2                	cmp    %eax,%edx
c000518e:	76 1b                	jbe    c00051ab <scroll_up+0x3f>
c0005190:	8b 45 08             	mov    0x8(%ebp),%eax
c0005193:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005199:	8b 40 08             	mov    0x8(%eax),%eax
c000519c:	83 e8 50             	sub    $0x50,%eax
c000519f:	83 ec 0c             	sub    $0xc,%esp
c00051a2:	50                   	push   %eax
c00051a3:	e8 fa fe ff ff       	call   c00050a2 <set_console_start_video_addr>
c00051a8:	83 c4 10             	add    $0x10,%esp
c00051ab:	90                   	nop
c00051ac:	c9                   	leave  
c00051ad:	c3                   	ret    

c00051ae <scroll_down>:
c00051ae:	55                   	push   %ebp
c00051af:	89 e5                	mov    %esp,%ebp
c00051b1:	83 ec 08             	sub    $0x8,%esp
c00051b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00051b7:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051bd:	8b 40 08             	mov    0x8(%eax),%eax
c00051c0:	8d 48 50             	lea    0x50(%eax),%ecx
c00051c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00051c6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051cc:	8b 10                	mov    (%eax),%edx
c00051ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00051d1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051d7:	8b 40 04             	mov    0x4(%eax),%eax
c00051da:	01 d0                	add    %edx,%eax
c00051dc:	39 c1                	cmp    %eax,%ecx
c00051de:	73 36                	jae    c0005216 <scroll_down+0x68>
c00051e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00051e3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051e9:	8b 40 08             	mov    0x8(%eax),%eax
c00051ec:	83 c0 50             	add    $0x50,%eax
c00051ef:	83 ec 0c             	sub    $0xc,%esp
c00051f2:	50                   	push   %eax
c00051f3:	e8 aa fe ff ff       	call   c00050a2 <set_console_start_video_addr>
c00051f8:	83 c4 10             	add    $0x10,%esp
c00051fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00051fe:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005204:	8b 50 08             	mov    0x8(%eax),%edx
c0005207:	8b 45 08             	mov    0x8(%ebp),%eax
c000520a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005210:	83 c2 50             	add    $0x50,%edx
c0005213:	89 50 08             	mov    %edx,0x8(%eax)
c0005216:	90                   	nop
c0005217:	c9                   	leave  
c0005218:	c3                   	ret    

c0005219 <out_char>:
c0005219:	55                   	push   %ebp
c000521a:	89 e5                	mov    %esp,%ebp
c000521c:	83 ec 28             	sub    $0x28,%esp
c000521f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005222:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0005225:	e8 d7 28 00 00       	call   c0007b01 <intr_disable>
c000522a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000522d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005230:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005236:	8b 40 0c             	mov    0xc(%eax),%eax
c0005239:	05 00 c0 05 60       	add    $0x6005c000,%eax
c000523e:	01 c0                	add    %eax,%eax
c0005240:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005243:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0005247:	83 f8 08             	cmp    $0x8,%eax
c000524a:	0f 84 8d 00 00 00    	je     c00052dd <out_char+0xc4>
c0005250:	83 f8 0a             	cmp    $0xa,%eax
c0005253:	0f 85 c9 00 00 00    	jne    c0005322 <out_char+0x109>
c0005259:	8b 45 08             	mov    0x8(%ebp),%eax
c000525c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005262:	8b 50 0c             	mov    0xc(%eax),%edx
c0005265:	8b 45 08             	mov    0x8(%ebp),%eax
c0005268:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000526e:	8b 08                	mov    (%eax),%ecx
c0005270:	8b 45 08             	mov    0x8(%ebp),%eax
c0005273:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005279:	8b 40 04             	mov    0x4(%eax),%eax
c000527c:	01 c8                	add    %ecx,%eax
c000527e:	83 e8 50             	sub    $0x50,%eax
c0005281:	39 c2                	cmp    %eax,%edx
c0005283:	0f 83 f4 00 00 00    	jae    c000537d <out_char+0x164>
c0005289:	8b 45 08             	mov    0x8(%ebp),%eax
c000528c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005292:	8b 08                	mov    (%eax),%ecx
c0005294:	8b 45 08             	mov    0x8(%ebp),%eax
c0005297:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000529d:	8b 50 0c             	mov    0xc(%eax),%edx
c00052a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052a9:	8b 00                	mov    (%eax),%eax
c00052ab:	29 c2                	sub    %eax,%edx
c00052ad:	89 d0                	mov    %edx,%eax
c00052af:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c00052b4:	f7 e2                	mul    %edx
c00052b6:	89 d0                	mov    %edx,%eax
c00052b8:	c1 e8 06             	shr    $0x6,%eax
c00052bb:	8d 50 01             	lea    0x1(%eax),%edx
c00052be:	89 d0                	mov    %edx,%eax
c00052c0:	c1 e0 02             	shl    $0x2,%eax
c00052c3:	01 d0                	add    %edx,%eax
c00052c5:	c1 e0 04             	shl    $0x4,%eax
c00052c8:	89 c2                	mov    %eax,%edx
c00052ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00052cd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052d3:	01 ca                	add    %ecx,%edx
c00052d5:	89 50 0c             	mov    %edx,0xc(%eax)
c00052d8:	e9 a0 00 00 00       	jmp    c000537d <out_char+0x164>
c00052dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00052e0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052e6:	8b 50 0c             	mov    0xc(%eax),%edx
c00052e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00052ec:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052f2:	8b 00                	mov    (%eax),%eax
c00052f4:	39 c2                	cmp    %eax,%edx
c00052f6:	0f 86 84 00 00 00    	jbe    c0005380 <out_char+0x167>
c00052fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00052ff:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005305:	8b 50 0c             	mov    0xc(%eax),%edx
c0005308:	83 ea 01             	sub    $0x1,%edx
c000530b:	89 50 0c             	mov    %edx,0xc(%eax)
c000530e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005311:	83 e8 02             	sub    $0x2,%eax
c0005314:	c6 00 20             	movb   $0x20,(%eax)
c0005317:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000531a:	83 e8 01             	sub    $0x1,%eax
c000531d:	c6 00 00             	movb   $0x0,(%eax)
c0005320:	eb 5e                	jmp    c0005380 <out_char+0x167>
c0005322:	8b 45 08             	mov    0x8(%ebp),%eax
c0005325:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000532b:	8b 40 0c             	mov    0xc(%eax),%eax
c000532e:	8d 48 01             	lea    0x1(%eax),%ecx
c0005331:	8b 45 08             	mov    0x8(%ebp),%eax
c0005334:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000533a:	8b 10                	mov    (%eax),%edx
c000533c:	8b 45 08             	mov    0x8(%ebp),%eax
c000533f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005345:	8b 40 04             	mov    0x4(%eax),%eax
c0005348:	01 d0                	add    %edx,%eax
c000534a:	39 c1                	cmp    %eax,%ecx
c000534c:	73 35                	jae    c0005383 <out_char+0x16a>
c000534e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005351:	8d 50 01             	lea    0x1(%eax),%edx
c0005354:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0005357:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c000535b:	88 10                	mov    %dl,(%eax)
c000535d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005360:	8d 50 01             	lea    0x1(%eax),%edx
c0005363:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0005366:	c6 00 0a             	movb   $0xa,(%eax)
c0005369:	8b 45 08             	mov    0x8(%ebp),%eax
c000536c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005372:	8b 50 0c             	mov    0xc(%eax),%edx
c0005375:	83 c2 01             	add    $0x1,%edx
c0005378:	89 50 0c             	mov    %edx,0xc(%eax)
c000537b:	eb 06                	jmp    c0005383 <out_char+0x16a>
c000537d:	90                   	nop
c000537e:	eb 14                	jmp    c0005394 <out_char+0x17b>
c0005380:	90                   	nop
c0005381:	eb 11                	jmp    c0005394 <out_char+0x17b>
c0005383:	90                   	nop
c0005384:	eb 0e                	jmp    c0005394 <out_char+0x17b>
c0005386:	83 ec 0c             	sub    $0xc,%esp
c0005389:	ff 75 08             	pushl  0x8(%ebp)
c000538c:	e8 1d fe ff ff       	call   c00051ae <scroll_down>
c0005391:	83 c4 10             	add    $0x10,%esp
c0005394:	8b 45 08             	mov    0x8(%ebp),%eax
c0005397:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000539d:	8b 50 0c             	mov    0xc(%eax),%edx
c00053a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00053a3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00053a9:	8b 40 08             	mov    0x8(%eax),%eax
c00053ac:	29 c2                	sub    %eax,%edx
c00053ae:	89 d0                	mov    %edx,%eax
c00053b0:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c00053b5:	77 cf                	ja     c0005386 <out_char+0x16d>
c00053b7:	83 ec 0c             	sub    $0xc,%esp
c00053ba:	ff 75 08             	pushl  0x8(%ebp)
c00053bd:	e8 49 fc ff ff       	call   c000500b <flush>
c00053c2:	83 c4 10             	add    $0x10,%esp
c00053c5:	83 ec 0c             	sub    $0xc,%esp
c00053c8:	ff 75 f4             	pushl  -0xc(%ebp)
c00053cb:	e8 5a 27 00 00       	call   c0007b2a <intr_set_status>
c00053d0:	83 c4 10             	add    $0x10,%esp
c00053d3:	90                   	nop
c00053d4:	c9                   	leave  
c00053d5:	c3                   	ret    

c00053d6 <tty_dev_read>:
c00053d6:	55                   	push   %ebp
c00053d7:	89 e5                	mov    %esp,%ebp
c00053d9:	83 ec 08             	sub    $0x8,%esp
c00053dc:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c00053e1:	39 45 08             	cmp    %eax,0x8(%ebp)
c00053e4:	75 17                	jne    c00053fd <tty_dev_read+0x27>
c00053e6:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00053eb:	85 c0                	test   %eax,%eax
c00053ed:	7e 0e                	jle    c00053fd <tty_dev_read+0x27>
c00053ef:	83 ec 0c             	sub    $0xc,%esp
c00053f2:	ff 75 08             	pushl  0x8(%ebp)
c00053f5:	e8 79 07 00 00       	call   c0005b73 <keyboard_read>
c00053fa:	83 c4 10             	add    $0x10,%esp
c00053fd:	90                   	nop
c00053fe:	c9                   	leave  
c00053ff:	c3                   	ret    

c0005400 <tty_dev_write>:
c0005400:	55                   	push   %ebp
c0005401:	89 e5                	mov    %esp,%ebp
c0005403:	83 ec 28             	sub    $0x28,%esp
c0005406:	8b 45 08             	mov    0x8(%ebp),%eax
c0005409:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000540f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005412:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005419:	e9 88 01 00 00       	jmp    c00055a6 <tty_dev_write+0x1a6>
c000541e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005421:	8b 40 04             	mov    0x4(%eax),%eax
c0005424:	8b 00                	mov    (%eax),%eax
c0005426:	88 45 e7             	mov    %al,-0x19(%ebp)
c0005429:	8b 45 08             	mov    0x8(%ebp),%eax
c000542c:	8b 40 04             	mov    0x4(%eax),%eax
c000542f:	8d 50 04             	lea    0x4(%eax),%edx
c0005432:	8b 45 08             	mov    0x8(%ebp),%eax
c0005435:	89 50 04             	mov    %edx,0x4(%eax)
c0005438:	8b 45 08             	mov    0x8(%ebp),%eax
c000543b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005441:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005444:	8b 45 08             	mov    0x8(%ebp),%eax
c0005447:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c000544d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005450:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005456:	8d 50 01             	lea    0x1(%eax),%edx
c0005459:	8b 45 08             	mov    0x8(%ebp),%eax
c000545c:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005462:	8b 45 08             	mov    0x8(%ebp),%eax
c0005465:	8b 40 04             	mov    0x4(%eax),%eax
c0005468:	8b 55 08             	mov    0x8(%ebp),%edx
c000546b:	83 c2 08             	add    $0x8,%edx
c000546e:	81 c2 00 08 00 00    	add    $0x800,%edx
c0005474:	39 d0                	cmp    %edx,%eax
c0005476:	75 0c                	jne    c0005484 <tty_dev_write+0x84>
c0005478:	8b 45 08             	mov    0x8(%ebp),%eax
c000547b:	8d 50 08             	lea    0x8(%eax),%edx
c000547e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005481:	89 50 04             	mov    %edx,0x4(%eax)
c0005484:	8b 45 08             	mov    0x8(%ebp),%eax
c0005487:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000548d:	85 c0                	test   %eax,%eax
c000548f:	0f 84 11 01 00 00    	je     c00055a6 <tty_dev_write+0x1a6>
c0005495:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005499:	3c 20                	cmp    $0x20,%al
c000549b:	76 08                	jbe    c00054a5 <tty_dev_write+0xa5>
c000549d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00054a1:	3c 7e                	cmp    $0x7e,%al
c00054a3:	76 10                	jbe    c00054b5 <tty_dev_write+0xb5>
c00054a5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00054a9:	3c 20                	cmp    $0x20,%al
c00054ab:	74 08                	je     c00054b5 <tty_dev_write+0xb5>
c00054ad:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00054b1:	84 c0                	test   %al,%al
c00054b3:	75 58                	jne    c000550d <tty_dev_write+0x10d>
c00054b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00054b8:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c00054be:	8b 45 08             	mov    0x8(%ebp),%eax
c00054c1:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00054c7:	01 d0                	add    %edx,%eax
c00054c9:	83 e8 01             	sub    $0x1,%eax
c00054cc:	89 c2                	mov    %eax,%edx
c00054ce:	83 ec 04             	sub    $0x4,%esp
c00054d1:	6a 01                	push   $0x1
c00054d3:	8d 45 e7             	lea    -0x19(%ebp),%eax
c00054d6:	50                   	push   %eax
c00054d7:	52                   	push   %edx
c00054d8:	e8 88 26 00 00       	call   c0007b65 <Memcpy>
c00054dd:	83 c4 10             	add    $0x10,%esp
c00054e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00054e3:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00054e9:	8d 50 ff             	lea    -0x1(%eax),%edx
c00054ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00054ef:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00054f5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00054f9:	0f b6 c0             	movzbl %al,%eax
c00054fc:	83 ec 08             	sub    $0x8,%esp
c00054ff:	50                   	push   %eax
c0005500:	ff 75 08             	pushl  0x8(%ebp)
c0005503:	e8 11 fd ff ff       	call   c0005219 <out_char>
c0005508:	83 c4 10             	add    $0x10,%esp
c000550b:	eb 7c                	jmp    c0005589 <tty_dev_write+0x189>
c000550d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005511:	3c 08                	cmp    $0x8,%al
c0005513:	75 42                	jne    c0005557 <tty_dev_write+0x157>
c0005515:	8b 45 08             	mov    0x8(%ebp),%eax
c0005518:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000551e:	8d 50 01             	lea    0x1(%eax),%edx
c0005521:	8b 45 08             	mov    0x8(%ebp),%eax
c0005524:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000552a:	8b 45 08             	mov    0x8(%ebp),%eax
c000552d:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005533:	8d 50 fe             	lea    -0x2(%eax),%edx
c0005536:	8b 45 08             	mov    0x8(%ebp),%eax
c0005539:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000553f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005543:	0f b6 c0             	movzbl %al,%eax
c0005546:	83 ec 08             	sub    $0x8,%esp
c0005549:	50                   	push   %eax
c000554a:	ff 75 08             	pushl  0x8(%ebp)
c000554d:	e8 c7 fc ff ff       	call   c0005219 <out_char>
c0005552:	83 c4 10             	add    $0x10,%esp
c0005555:	eb 32                	jmp    c0005589 <tty_dev_write+0x189>
c0005557:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000555b:	3c 0a                	cmp    $0xa,%al
c000555d:	75 2a                	jne    c0005589 <tty_dev_write+0x189>
c000555f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005563:	0f b6 c0             	movzbl %al,%eax
c0005566:	83 ec 08             	sub    $0x8,%esp
c0005569:	50                   	push   %eax
c000556a:	ff 75 08             	pushl  0x8(%ebp)
c000556d:	e8 a7 fc ff ff       	call   c0005219 <out_char>
c0005572:	83 c4 10             	add    $0x10,%esp
c0005575:	8b 45 08             	mov    0x8(%ebp),%eax
c0005578:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c000557f:	00 00 00 
c0005582:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005589:	8b 45 08             	mov    0x8(%ebp),%eax
c000558c:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005592:	8b 45 08             	mov    0x8(%ebp),%eax
c0005595:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c000559b:	39 c2                	cmp    %eax,%edx
c000559d:	75 07                	jne    c00055a6 <tty_dev_write+0x1a6>
c000559f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00055a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00055a9:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00055af:	85 c0                	test   %eax,%eax
c00055b1:	0f 85 67 fe ff ff    	jne    c000541e <tty_dev_write+0x1e>
c00055b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00055bb:	74 5c                	je     c0005619 <tty_dev_write+0x219>
c00055bd:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c00055c4:	83 ec 0c             	sub    $0xc,%esp
c00055c7:	ff 75 ec             	pushl  -0x14(%ebp)
c00055ca:	e8 f5 d3 ff ff       	call   c00029c4 <sys_malloc>
c00055cf:	83 c4 10             	add    $0x10,%esp
c00055d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00055d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055d8:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c00055df:	8b 45 08             	mov    0x8(%ebp),%eax
c00055e2:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055e8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055eb:	89 50 50             	mov    %edx,0x50(%eax)
c00055ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00055f1:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c00055f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055fa:	89 50 58             	mov    %edx,0x58(%eax)
c00055fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0005600:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005606:	83 ec 04             	sub    $0x4,%esp
c0005609:	50                   	push   %eax
c000560a:	ff 75 e8             	pushl  -0x18(%ebp)
c000560d:	6a 01                	push   $0x1
c000560f:	e8 62 4e 00 00       	call   c000a476 <send_rec>
c0005614:	83 c4 10             	add    $0x10,%esp
c0005617:	eb 01                	jmp    c000561a <tty_dev_write+0x21a>
c0005619:	90                   	nop
c000561a:	c9                   	leave  
c000561b:	c3                   	ret    

c000561c <tty_do_read>:
c000561c:	55                   	push   %ebp
c000561d:	89 e5                	mov    %esp,%ebp
c000561f:	83 ec 08             	sub    $0x8,%esp
c0005622:	8b 45 08             	mov    0x8(%ebp),%eax
c0005625:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000562c:	00 00 00 
c000562f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005632:	8b 50 58             	mov    0x58(%eax),%edx
c0005635:	8b 45 08             	mov    0x8(%ebp),%eax
c0005638:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c000563e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005641:	8b 00                	mov    (%eax),%eax
c0005643:	89 c2                	mov    %eax,%edx
c0005645:	8b 45 08             	mov    0x8(%ebp),%eax
c0005648:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c000564e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005651:	8b 50 50             	mov    0x50(%eax),%edx
c0005654:	8b 45 08             	mov    0x8(%ebp),%eax
c0005657:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000565d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005660:	8b 50 50             	mov    0x50(%eax),%edx
c0005663:	8b 45 08             	mov    0x8(%ebp),%eax
c0005666:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c000566c:	8b 45 08             	mov    0x8(%ebp),%eax
c000566f:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c0005675:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005678:	8b 40 10             	mov    0x10(%eax),%eax
c000567b:	83 ec 08             	sub    $0x8,%esp
c000567e:	52                   	push   %edx
c000567f:	50                   	push   %eax
c0005680:	e8 77 18 00 00       	call   c0006efc <alloc_virtual_memory>
c0005685:	83 c4 10             	add    $0x10,%esp
c0005688:	89 c2                	mov    %eax,%edx
c000568a:	8b 45 08             	mov    0x8(%ebp),%eax
c000568d:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0005693:	8b 45 08             	mov    0x8(%ebp),%eax
c0005696:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000569c:	83 f8 02             	cmp    $0x2,%eax
c000569f:	74 1c                	je     c00056bd <tty_do_read+0xa1>
c00056a1:	68 39 01 00 00       	push   $0x139
c00056a6:	68 55 b8 00 c0       	push   $0xc000b855
c00056ab:	68 55 b8 00 c0       	push   $0xc000b855
c00056b0:	68 5f b8 00 c0       	push   $0xc000b85f
c00056b5:	e8 90 44 00 00       	call   c0009b4a <assertion_failure>
c00056ba:	83 c4 10             	add    $0x10,%esp
c00056bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00056c0:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c00056c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00056ca:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00056d0:	83 ec 04             	sub    $0x4,%esp
c00056d3:	50                   	push   %eax
c00056d4:	ff 75 0c             	pushl  0xc(%ebp)
c00056d7:	6a 01                	push   $0x1
c00056d9:	e8 98 4d 00 00       	call   c000a476 <send_rec>
c00056de:	83 c4 10             	add    $0x10,%esp
c00056e1:	90                   	nop
c00056e2:	c9                   	leave  
c00056e3:	c3                   	ret    

c00056e4 <tty_do_write>:
c00056e4:	55                   	push   %ebp
c00056e5:	89 e5                	mov    %esp,%ebp
c00056e7:	53                   	push   %ebx
c00056e8:	83 ec 24             	sub    $0x24,%esp
c00056eb:	89 e0                	mov    %esp,%eax
c00056ed:	89 c3                	mov    %eax,%ebx
c00056ef:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c00056f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00056f9:	8d 50 ff             	lea    -0x1(%eax),%edx
c00056fc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c00056ff:	89 c2                	mov    %eax,%edx
c0005701:	b8 10 00 00 00       	mov    $0x10,%eax
c0005706:	83 e8 01             	sub    $0x1,%eax
c0005709:	01 d0                	add    %edx,%eax
c000570b:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005710:	ba 00 00 00 00       	mov    $0x0,%edx
c0005715:	f7 f1                	div    %ecx
c0005717:	6b c0 10             	imul   $0x10,%eax,%eax
c000571a:	29 c4                	sub    %eax,%esp
c000571c:	89 e0                	mov    %esp,%eax
c000571e:	83 c0 00             	add    $0x0,%eax
c0005721:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005724:	83 ec 04             	sub    $0x4,%esp
c0005727:	ff 75 e8             	pushl  -0x18(%ebp)
c000572a:	6a 00                	push   $0x0
c000572c:	ff 75 e0             	pushl  -0x20(%ebp)
c000572f:	e8 17 6b 00 00       	call   c000c24b <Memset>
c0005734:	83 c4 10             	add    $0x10,%esp
c0005737:	8b 45 0c             	mov    0xc(%ebp),%eax
c000573a:	8b 40 50             	mov    0x50(%eax),%eax
c000573d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005740:	8b 45 08             	mov    0x8(%ebp),%eax
c0005743:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000574a:	00 00 00 
c000574d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005750:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005753:	8b 40 10             	mov    0x10(%eax),%eax
c0005756:	83 ec 08             	sub    $0x8,%esp
c0005759:	52                   	push   %edx
c000575a:	50                   	push   %eax
c000575b:	e8 9c 17 00 00       	call   c0006efc <alloc_virtual_memory>
c0005760:	83 c4 10             	add    $0x10,%esp
c0005763:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005766:	eb 7e                	jmp    c00057e6 <tty_do_write+0x102>
c0005768:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000576b:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000576e:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005772:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005775:	8b 45 08             	mov    0x8(%ebp),%eax
c0005778:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000577e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005781:	01 d0                	add    %edx,%eax
c0005783:	83 ec 04             	sub    $0x4,%esp
c0005786:	ff 75 f0             	pushl  -0x10(%ebp)
c0005789:	50                   	push   %eax
c000578a:	ff 75 e0             	pushl  -0x20(%ebp)
c000578d:	e8 d3 23 00 00       	call   c0007b65 <Memcpy>
c0005792:	83 c4 10             	add    $0x10,%esp
c0005795:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005798:	29 45 ec             	sub    %eax,-0x14(%ebp)
c000579b:	8b 45 08             	mov    0x8(%ebp),%eax
c000579e:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00057a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00057a7:	01 c2                	add    %eax,%edx
c00057a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00057ac:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00057b2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00057b9:	eb 25                	jmp    c00057e0 <tty_do_write+0xfc>
c00057bb:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00057be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00057c1:	01 d0                	add    %edx,%eax
c00057c3:	0f b6 00             	movzbl (%eax),%eax
c00057c6:	0f b6 c0             	movzbl %al,%eax
c00057c9:	83 ec 08             	sub    $0x8,%esp
c00057cc:	50                   	push   %eax
c00057cd:	ff 75 08             	pushl  0x8(%ebp)
c00057d0:	e8 44 fa ff ff       	call   c0005219 <out_char>
c00057d5:	83 c4 10             	add    $0x10,%esp
c00057d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00057dc:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c00057e0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00057e4:	75 d5                	jne    c00057bb <tty_do_write+0xd7>
c00057e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00057ea:	0f 85 78 ff ff ff    	jne    c0005768 <tty_do_write+0x84>
c00057f0:	83 ec 0c             	sub    $0xc,%esp
c00057f3:	6a 6c                	push   $0x6c
c00057f5:	e8 ca d1 ff ff       	call   c00029c4 <sys_malloc>
c00057fa:	83 c4 10             	add    $0x10,%esp
c00057fd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005800:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005803:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000580a:	8b 45 08             	mov    0x8(%ebp),%eax
c000580d:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005813:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005816:	89 50 48             	mov    %edx,0x48(%eax)
c0005819:	8b 45 0c             	mov    0xc(%ebp),%eax
c000581c:	8b 00                	mov    (%eax),%eax
c000581e:	83 ec 04             	sub    $0x4,%esp
c0005821:	50                   	push   %eax
c0005822:	ff 75 d8             	pushl  -0x28(%ebp)
c0005825:	6a 01                	push   $0x1
c0005827:	e8 4a 4c 00 00       	call   c000a476 <send_rec>
c000582c:	83 c4 10             	add    $0x10,%esp
c000582f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005832:	83 ec 08             	sub    $0x8,%esp
c0005835:	6a 6c                	push   $0x6c
c0005837:	50                   	push   %eax
c0005838:	e8 87 1c 00 00       	call   c00074c4 <sys_free>
c000583d:	83 c4 10             	add    $0x10,%esp
c0005840:	89 dc                	mov    %ebx,%esp
c0005842:	90                   	nop
c0005843:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005846:	c9                   	leave  
c0005847:	c3                   	ret    

c0005848 <init_screen>:
c0005848:	55                   	push   %ebp
c0005849:	89 e5                	mov    %esp,%ebp
c000584b:	83 ec 10             	sub    $0x10,%esp
c000584e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005851:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005856:	c1 f8 03             	sar    $0x3,%eax
c0005859:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c000585f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005862:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005865:	c1 e0 04             	shl    $0x4,%eax
c0005868:	8d 90 14 1f 01 c0    	lea    -0x3ffee0ec(%eax),%edx
c000586e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005871:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c0005877:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c000587e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005881:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005887:	8b 55 f8             	mov    -0x8(%ebp),%edx
c000588a:	89 50 04             	mov    %edx,0x4(%eax)
c000588d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005890:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005896:	8b 50 04             	mov    0x4(%eax),%edx
c0005899:	8b 45 08             	mov    0x8(%ebp),%eax
c000589c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00058a2:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00058a6:	89 10                	mov    %edx,(%eax)
c00058a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00058ab:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c00058b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00058b4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00058ba:	8b 12                	mov    (%edx),%edx
c00058bc:	89 50 08             	mov    %edx,0x8(%eax)
c00058bf:	8b 55 08             	mov    0x8(%ebp),%edx
c00058c2:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c00058c8:	8b 40 08             	mov    0x8(%eax),%eax
c00058cb:	89 42 0c             	mov    %eax,0xc(%edx)
c00058ce:	90                   	nop
c00058cf:	c9                   	leave  
c00058d0:	c3                   	ret    

c00058d1 <init_tty>:
c00058d1:	55                   	push   %ebp
c00058d2:	89 e5                	mov    %esp,%ebp
c00058d4:	83 ec 18             	sub    $0x18,%esp
c00058d7:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c00058de:	e9 92 00 00 00       	jmp    c0005975 <init_tty+0xa4>
c00058e3:	83 ec 04             	sub    $0x4,%esp
c00058e6:	68 28 08 00 00       	push   $0x828
c00058eb:	6a 00                	push   $0x0
c00058ed:	ff 75 f4             	pushl  -0xc(%ebp)
c00058f0:	e8 56 69 00 00       	call   c000c24b <Memset>
c00058f5:	83 c4 10             	add    $0x10,%esp
c00058f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058fb:	8d 50 08             	lea    0x8(%eax),%edx
c00058fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005901:	89 50 04             	mov    %edx,0x4(%eax)
c0005904:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005907:	8b 50 04             	mov    0x4(%eax),%edx
c000590a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000590d:	89 10                	mov    %edx,(%eax)
c000590f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005912:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0005919:	00 00 00 
c000591c:	83 ec 0c             	sub    $0xc,%esp
c000591f:	ff 75 f4             	pushl  -0xc(%ebp)
c0005922:	e8 21 ff ff ff       	call   c0005848 <init_screen>
c0005927:	83 c4 10             	add    $0x10,%esp
c000592a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000592d:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005932:	85 c0                	test   %eax,%eax
c0005934:	7e 38                	jle    c000596e <init_tty+0x9d>
c0005936:	83 ec 08             	sub    $0x8,%esp
c0005939:	6a 23                	push   $0x23
c000593b:	ff 75 f4             	pushl  -0xc(%ebp)
c000593e:	e8 d6 f8 ff ff       	call   c0005219 <out_char>
c0005943:	83 c4 10             	add    $0x10,%esp
c0005946:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005949:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c000594e:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005953:	c1 f8 03             	sar    $0x3,%eax
c0005956:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c000595c:	0f b6 c0             	movzbl %al,%eax
c000595f:	83 ec 08             	sub    $0x8,%esp
c0005962:	50                   	push   %eax
c0005963:	ff 75 f4             	pushl  -0xc(%ebp)
c0005966:	e8 ae f8 ff ff       	call   c0005219 <out_char>
c000596b:	83 c4 10             	add    $0x10,%esp
c000596e:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005975:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c000597a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000597d:	0f 82 60 ff ff ff    	jb     c00058e3 <init_tty+0x12>
c0005983:	90                   	nop
c0005984:	c9                   	leave  
c0005985:	c3                   	ret    

c0005986 <TaskTTY>:
c0005986:	55                   	push   %ebp
c0005987:	89 e5                	mov    %esp,%ebp
c0005989:	83 ec 28             	sub    $0x28,%esp
c000598c:	e8 40 ff ff ff       	call   c00058d1 <init_tty>
c0005991:	83 ec 0c             	sub    $0xc,%esp
c0005994:	6a 00                	push   $0x0
c0005996:	e8 34 f6 ff ff       	call   c0004fcf <select_console>
c000599b:	83 c4 10             	add    $0x10,%esp
c000599e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00059a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00059ac:	83 ec 0c             	sub    $0xc,%esp
c00059af:	6a 6c                	push   $0x6c
c00059b1:	e8 0e d0 ff ff       	call   c00029c4 <sys_malloc>
c00059b6:	83 c4 10             	add    $0x10,%esp
c00059b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00059bc:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c00059c3:	eb 30                	jmp    c00059f5 <TaskTTY+0x6f>
c00059c5:	83 ec 0c             	sub    $0xc,%esp
c00059c8:	ff 75 f4             	pushl  -0xc(%ebp)
c00059cb:	e8 06 fa ff ff       	call   c00053d6 <tty_dev_read>
c00059d0:	83 c4 10             	add    $0x10,%esp
c00059d3:	83 ec 0c             	sub    $0xc,%esp
c00059d6:	ff 75 f4             	pushl  -0xc(%ebp)
c00059d9:	e8 22 fa ff ff       	call   c0005400 <tty_dev_write>
c00059de:	83 c4 10             	add    $0x10,%esp
c00059e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00059e4:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00059ea:	85 c0                	test   %eax,%eax
c00059ec:	75 d7                	jne    c00059c5 <TaskTTY+0x3f>
c00059ee:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c00059f5:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c00059fa:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00059fd:	72 c6                	jb     c00059c5 <TaskTTY+0x3f>
c00059ff:	83 ec 04             	sub    $0x4,%esp
c0005a02:	6a 12                	push   $0x12
c0005a04:	ff 75 e8             	pushl  -0x18(%ebp)
c0005a07:	6a 02                	push   $0x2
c0005a09:	e8 68 4a 00 00       	call   c000a476 <send_rec>
c0005a0e:	83 c4 10             	add    $0x10,%esp
c0005a11:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005a14:	8b 40 68             	mov    0x68(%eax),%eax
c0005a17:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005a1a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005a21:	74 28                	je     c0005a4b <TaskTTY+0xc5>
c0005a23:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005a2a:	7f 0b                	jg     c0005a37 <TaskTTY+0xb1>
c0005a2c:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005a33:	74 4e                	je     c0005a83 <TaskTTY+0xfd>
c0005a35:	eb 4d                	jmp    c0005a84 <TaskTTY+0xfe>
c0005a37:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005a3e:	74 21                	je     c0005a61 <TaskTTY+0xdb>
c0005a40:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0005a47:	74 2e                	je     c0005a77 <TaskTTY+0xf1>
c0005a49:	eb 39                	jmp    c0005a84 <TaskTTY+0xfe>
c0005a4b:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005a50:	83 ec 08             	sub    $0x8,%esp
c0005a53:	ff 75 e8             	pushl  -0x18(%ebp)
c0005a56:	50                   	push   %eax
c0005a57:	e8 c0 fb ff ff       	call   c000561c <tty_do_read>
c0005a5c:	83 c4 10             	add    $0x10,%esp
c0005a5f:	eb 23                	jmp    c0005a84 <TaskTTY+0xfe>
c0005a61:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005a66:	83 ec 08             	sub    $0x8,%esp
c0005a69:	ff 75 e8             	pushl  -0x18(%ebp)
c0005a6c:	50                   	push   %eax
c0005a6d:	e8 72 fc ff ff       	call   c00056e4 <tty_do_write>
c0005a72:	83 c4 10             	add    $0x10,%esp
c0005a75:	eb 0d                	jmp    c0005a84 <TaskTTY+0xfe>
c0005a77:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c0005a7e:	00 00 00 
c0005a81:	eb 01                	jmp    c0005a84 <TaskTTY+0xfe>
c0005a83:	90                   	nop
c0005a84:	e9 33 ff ff ff       	jmp    c00059bc <TaskTTY+0x36>

c0005a89 <keyboard_handler>:
c0005a89:	55                   	push   %ebp
c0005a8a:	89 e5                	mov    %esp,%ebp
c0005a8c:	83 ec 18             	sub    $0x18,%esp
c0005a8f:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c0005a96:	00 00 00 
c0005a99:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0005aa0:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005aa5:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005aaa:	7f 5e                	jg     c0005b0a <keyboard_handler+0x81>
c0005aac:	e8 0a bd ff ff       	call   c00017bb <disable_int>
c0005ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ab4:	0f b7 c0             	movzwl %ax,%eax
c0005ab7:	83 ec 0c             	sub    $0xc,%esp
c0005aba:	50                   	push   %eax
c0005abb:	e8 cd bc ff ff       	call   c000178d <in_byte>
c0005ac0:	83 c4 10             	add    $0x10,%esp
c0005ac3:	88 45 f3             	mov    %al,-0xd(%ebp)
c0005ac6:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005acb:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005acf:	88 10                	mov    %dl,(%eax)
c0005ad1:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005ad6:	83 c0 01             	add    $0x1,%eax
c0005ad9:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0005ade:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005ae3:	83 c0 01             	add    $0x1,%eax
c0005ae6:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005aeb:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005af0:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005af5:	39 d0                	cmp    %edx,%eax
c0005af7:	72 0a                	jb     c0005b03 <keyboard_handler+0x7a>
c0005af9:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0005b00:	0b 01 c0 
c0005b03:	e8 b5 bc ff ff       	call   c00017bd <enable_int>
c0005b08:	eb 01                	jmp    c0005b0b <keyboard_handler+0x82>
c0005b0a:	90                   	nop
c0005b0b:	c9                   	leave  
c0005b0c:	c3                   	ret    

c0005b0d <read_from_keyboard_buf>:
c0005b0d:	55                   	push   %ebp
c0005b0e:	89 e5                	mov    %esp,%ebp
c0005b10:	83 ec 18             	sub    $0x18,%esp
c0005b13:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0005b17:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005b1c:	85 c0                	test   %eax,%eax
c0005b1e:	7f 06                	jg     c0005b26 <read_from_keyboard_buf+0x19>
c0005b20:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005b24:	eb 4b                	jmp    c0005b71 <read_from_keyboard_buf+0x64>
c0005b26:	e8 90 bc ff ff       	call   c00017bb <disable_int>
c0005b2b:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005b30:	0f b6 00             	movzbl (%eax),%eax
c0005b33:	88 45 f7             	mov    %al,-0x9(%ebp)
c0005b36:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005b3b:	83 c0 01             	add    $0x1,%eax
c0005b3e:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0005b43:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005b48:	83 e8 01             	sub    $0x1,%eax
c0005b4b:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005b50:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005b55:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005b5a:	39 d0                	cmp    %edx,%eax
c0005b5c:	72 0a                	jb     c0005b68 <read_from_keyboard_buf+0x5b>
c0005b5e:	c7 05 e4 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be4
c0005b65:	0b 01 c0 
c0005b68:	e8 50 bc ff ff       	call   c00017bd <enable_int>
c0005b6d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005b71:	c9                   	leave  
c0005b72:	c3                   	ret    

c0005b73 <keyboard_read>:
c0005b73:	55                   	push   %ebp
c0005b74:	89 e5                	mov    %esp,%ebp
c0005b76:	83 ec 28             	sub    $0x28,%esp
c0005b79:	90                   	nop
c0005b7a:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005b7f:	85 c0                	test   %eax,%eax
c0005b81:	7e f7                	jle    c0005b7a <keyboard_read+0x7>
c0005b83:	e8 85 ff ff ff       	call   c0005b0d <read_from_keyboard_buf>
c0005b88:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005b8b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005b92:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005b96:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005b9a:	75 5a                	jne    c0005bf6 <keyboard_read+0x83>
c0005b9c:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0005ba0:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0005ba4:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0005ba8:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005bac:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0005bb0:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0005bb4:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005bb8:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005bbf:	eb 20                	jmp    c0005be1 <keyboard_read+0x6e>
c0005bc1:	e8 47 ff ff ff       	call   c0005b0d <read_from_keyboard_buf>
c0005bc6:	89 c1                	mov    %eax,%ecx
c0005bc8:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005bcb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005bce:	01 d0                	add    %edx,%eax
c0005bd0:	0f b6 00             	movzbl (%eax),%eax
c0005bd3:	38 c1                	cmp    %al,%cl
c0005bd5:	74 06                	je     c0005bdd <keyboard_read+0x6a>
c0005bd7:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005bdb:	eb 0a                	jmp    c0005be7 <keyboard_read+0x74>
c0005bdd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005be1:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005be5:	7e da                	jle    c0005bc1 <keyboard_read+0x4e>
c0005be7:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005beb:	74 68                	je     c0005c55 <keyboard_read+0xe2>
c0005bed:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005bf4:	eb 5f                	jmp    c0005c55 <keyboard_read+0xe2>
c0005bf6:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005bfa:	75 59                	jne    c0005c55 <keyboard_read+0xe2>
c0005bfc:	e8 0c ff ff ff       	call   c0005b0d <read_from_keyboard_buf>
c0005c01:	3c 2a                	cmp    $0x2a,%al
c0005c03:	75 1d                	jne    c0005c22 <keyboard_read+0xaf>
c0005c05:	e8 03 ff ff ff       	call   c0005b0d <read_from_keyboard_buf>
c0005c0a:	3c e0                	cmp    $0xe0,%al
c0005c0c:	75 14                	jne    c0005c22 <keyboard_read+0xaf>
c0005c0e:	e8 fa fe ff ff       	call   c0005b0d <read_from_keyboard_buf>
c0005c13:	3c 37                	cmp    $0x37,%al
c0005c15:	75 0b                	jne    c0005c22 <keyboard_read+0xaf>
c0005c17:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005c1e:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005c22:	e8 e6 fe ff ff       	call   c0005b0d <read_from_keyboard_buf>
c0005c27:	3c b7                	cmp    $0xb7,%al
c0005c29:	75 1d                	jne    c0005c48 <keyboard_read+0xd5>
c0005c2b:	e8 dd fe ff ff       	call   c0005b0d <read_from_keyboard_buf>
c0005c30:	3c e0                	cmp    $0xe0,%al
c0005c32:	75 14                	jne    c0005c48 <keyboard_read+0xd5>
c0005c34:	e8 d4 fe ff ff       	call   c0005b0d <read_from_keyboard_buf>
c0005c39:	3c aa                	cmp    $0xaa,%al
c0005c3b:	75 0b                	jne    c0005c48 <keyboard_read+0xd5>
c0005c3d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005c44:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005c48:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005c4c:	75 07                	jne    c0005c55 <keyboard_read+0xe2>
c0005c4e:	c6 05 84 07 01 c0 01 	movb   $0x1,0xc0010784
c0005c55:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005c5c:	0f 84 8d 00 00 00    	je     c0005cef <keyboard_read+0x17c>
c0005c62:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005c69:	0f 84 80 00 00 00    	je     c0005cef <keyboard_read+0x17c>
c0005c6f:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005c73:	0f 94 c2             	sete   %dl
c0005c76:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005c7a:	0f 94 c0             	sete   %al
c0005c7d:	09 d0                	or     %edx,%eax
c0005c7f:	84 c0                	test   %al,%al
c0005c81:	74 07                	je     c0005c8a <keyboard_read+0x117>
c0005c83:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c0005c8a:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005c8e:	f7 d0                	not    %eax
c0005c90:	c0 e8 07             	shr    $0x7,%al
c0005c93:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005c96:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005c9a:	74 53                	je     c0005cef <keyboard_read+0x17c>
c0005c9c:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005ca0:	74 4d                	je     c0005cef <keyboard_read+0x17c>
c0005ca2:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005ca6:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005cad:	3c 01                	cmp    $0x1,%al
c0005caf:	75 04                	jne    c0005cb5 <keyboard_read+0x142>
c0005cb1:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005cb5:	0f b6 05 84 07 01 c0 	movzbl 0xc0010784,%eax
c0005cbc:	84 c0                	test   %al,%al
c0005cbe:	74 04                	je     c0005cc4 <keyboard_read+0x151>
c0005cc0:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005cc4:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005cc8:	89 d0                	mov    %edx,%eax
c0005cca:	01 c0                	add    %eax,%eax
c0005ccc:	01 c2                	add    %eax,%edx
c0005cce:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005cd2:	01 d0                	add    %edx,%eax
c0005cd4:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005cdb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005cde:	83 ec 08             	sub    $0x8,%esp
c0005ce1:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ce4:	ff 75 08             	pushl  0x8(%ebp)
c0005ce7:	e8 1a 00 00 00       	call   c0005d06 <in_process>
c0005cec:	83 c4 10             	add    $0x10,%esp
c0005cef:	90                   	nop
c0005cf0:	c9                   	leave  
c0005cf1:	c3                   	ret    

c0005cf2 <init_keyboard_handler>:
c0005cf2:	55                   	push   %ebp
c0005cf3:	89 e5                	mov    %esp,%ebp
c0005cf5:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005cfc:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005d03:	90                   	nop
c0005d04:	5d                   	pop    %ebp
c0005d05:	c3                   	ret    

c0005d06 <in_process>:
c0005d06:	55                   	push   %ebp
c0005d07:	89 e5                	mov    %esp,%ebp
c0005d09:	83 ec 18             	sub    $0x18,%esp
c0005d0c:	83 ec 04             	sub    $0x4,%esp
c0005d0f:	6a 02                	push   $0x2
c0005d11:	6a 00                	push   $0x0
c0005d13:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005d16:	50                   	push   %eax
c0005d17:	e8 2f 65 00 00       	call   c000c24b <Memset>
c0005d1c:	83 c4 10             	add    $0x10,%esp
c0005d1f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005d22:	25 00 01 00 00       	and    $0x100,%eax
c0005d27:	85 c0                	test   %eax,%eax
c0005d29:	75 28                	jne    c0005d53 <in_process+0x4d>
c0005d2b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005d2e:	0f b6 c0             	movzbl %al,%eax
c0005d31:	83 ec 08             	sub    $0x8,%esp
c0005d34:	50                   	push   %eax
c0005d35:	ff 75 08             	pushl  0x8(%ebp)
c0005d38:	e8 c3 f3 ff ff       	call   c0005100 <put_key>
c0005d3d:	83 c4 10             	add    $0x10,%esp
c0005d40:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005d47:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005d4e:	e9 42 01 00 00       	jmp    c0005e95 <in_process+0x18f>
c0005d53:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005d5a:	84 c0                	test   %al,%al
c0005d5c:	0f 84 a9 00 00 00    	je     c0005e0b <in_process+0x105>
c0005d62:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005d66:	0f 84 9f 00 00 00    	je     c0005e0b <in_process+0x105>
c0005d6c:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005d70:	0f 84 95 00 00 00    	je     c0005e0b <in_process+0x105>
c0005d76:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005d7d:	74 64                	je     c0005de3 <in_process+0xdd>
c0005d7f:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005d86:	77 0b                	ja     c0005d93 <in_process+0x8d>
c0005d88:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005d8f:	74 64                	je     c0005df5 <in_process+0xef>
c0005d91:	eb 73                	jmp    c0005e06 <in_process+0x100>
c0005d93:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005d9a:	74 0b                	je     c0005da7 <in_process+0xa1>
c0005d9c:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005da3:	74 20                	je     c0005dc5 <in_process+0xbf>
c0005da5:	eb 5f                	jmp    c0005e06 <in_process+0x100>
c0005da7:	83 ec 0c             	sub    $0xc,%esp
c0005daa:	ff 75 08             	pushl  0x8(%ebp)
c0005dad:	e8 ba f3 ff ff       	call   c000516c <scroll_up>
c0005db2:	83 c4 10             	add    $0x10,%esp
c0005db5:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005dbc:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005dc3:	eb 41                	jmp    c0005e06 <in_process+0x100>
c0005dc5:	83 ec 0c             	sub    $0xc,%esp
c0005dc8:	ff 75 08             	pushl  0x8(%ebp)
c0005dcb:	e8 de f3 ff ff       	call   c00051ae <scroll_down>
c0005dd0:	83 c4 10             	add    $0x10,%esp
c0005dd3:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005dda:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005de1:	eb 23                	jmp    c0005e06 <in_process+0x100>
c0005de3:	83 ec 08             	sub    $0x8,%esp
c0005de6:	6a 0a                	push   $0xa
c0005de8:	ff 75 08             	pushl  0x8(%ebp)
c0005deb:	e8 29 f4 ff ff       	call   c0005219 <out_char>
c0005df0:	83 c4 10             	add    $0x10,%esp
c0005df3:	eb 11                	jmp    c0005e06 <in_process+0x100>
c0005df5:	83 ec 08             	sub    $0x8,%esp
c0005df8:	6a 08                	push   $0x8
c0005dfa:	ff 75 08             	pushl  0x8(%ebp)
c0005dfd:	e8 17 f4 ff ff       	call   c0005219 <out_char>
c0005e02:	83 c4 10             	add    $0x10,%esp
c0005e05:	90                   	nop
c0005e06:	e9 8a 00 00 00       	jmp    c0005e95 <in_process+0x18f>
c0005e0b:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005e12:	74 55                	je     c0005e69 <in_process+0x163>
c0005e14:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005e1b:	77 14                	ja     c0005e31 <in_process+0x12b>
c0005e1d:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005e24:	74 31                	je     c0005e57 <in_process+0x151>
c0005e26:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005e2d:	74 16                	je     c0005e45 <in_process+0x13f>
c0005e2f:	eb 64                	jmp    c0005e95 <in_process+0x18f>
c0005e31:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005e38:	74 3e                	je     c0005e78 <in_process+0x172>
c0005e3a:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005e41:	74 44                	je     c0005e87 <in_process+0x181>
c0005e43:	eb 50                	jmp    c0005e95 <in_process+0x18f>
c0005e45:	83 ec 08             	sub    $0x8,%esp
c0005e48:	6a 0a                	push   $0xa
c0005e4a:	ff 75 08             	pushl  0x8(%ebp)
c0005e4d:	e8 ae f2 ff ff       	call   c0005100 <put_key>
c0005e52:	83 c4 10             	add    $0x10,%esp
c0005e55:	eb 3e                	jmp    c0005e95 <in_process+0x18f>
c0005e57:	83 ec 08             	sub    $0x8,%esp
c0005e5a:	6a 08                	push   $0x8
c0005e5c:	ff 75 08             	pushl  0x8(%ebp)
c0005e5f:	e8 9c f2 ff ff       	call   c0005100 <put_key>
c0005e64:	83 c4 10             	add    $0x10,%esp
c0005e67:	eb 2c                	jmp    c0005e95 <in_process+0x18f>
c0005e69:	83 ec 0c             	sub    $0xc,%esp
c0005e6c:	6a 00                	push   $0x0
c0005e6e:	e8 5c f1 ff ff       	call   c0004fcf <select_console>
c0005e73:	83 c4 10             	add    $0x10,%esp
c0005e76:	eb 1d                	jmp    c0005e95 <in_process+0x18f>
c0005e78:	83 ec 0c             	sub    $0xc,%esp
c0005e7b:	6a 01                	push   $0x1
c0005e7d:	e8 4d f1 ff ff       	call   c0004fcf <select_console>
c0005e82:	83 c4 10             	add    $0x10,%esp
c0005e85:	eb 0e                	jmp    c0005e95 <in_process+0x18f>
c0005e87:	83 ec 0c             	sub    $0xc,%esp
c0005e8a:	6a 02                	push   $0x2
c0005e8c:	e8 3e f1 ff ff       	call   c0004fcf <select_console>
c0005e91:	83 c4 10             	add    $0x10,%esp
c0005e94:	90                   	nop
c0005e95:	90                   	nop
c0005e96:	c9                   	leave  
c0005e97:	c3                   	ret    

c0005e98 <open>:
c0005e98:	55                   	push   %ebp
c0005e99:	89 e5                	mov    %esp,%ebp
c0005e9b:	83 ec 18             	sub    $0x18,%esp
c0005e9e:	83 ec 0c             	sub    $0xc,%esp
c0005ea1:	6a 6c                	push   $0x6c
c0005ea3:	e8 1c cb ff ff       	call   c00029c4 <sys_malloc>
c0005ea8:	83 c4 10             	add    $0x10,%esp
c0005eab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005eae:	83 ec 04             	sub    $0x4,%esp
c0005eb1:	6a 6c                	push   $0x6c
c0005eb3:	6a 00                	push   $0x0
c0005eb5:	ff 75 f4             	pushl  -0xc(%ebp)
c0005eb8:	e8 8e 63 00 00       	call   c000c24b <Memset>
c0005ebd:	83 c4 10             	add    $0x10,%esp
c0005ec0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ec3:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0005eca:	83 ec 0c             	sub    $0xc,%esp
c0005ecd:	ff 75 08             	pushl  0x8(%ebp)
c0005ed0:	e8 ee 10 00 00       	call   c0006fc3 <get_physical_address>
c0005ed5:	83 c4 10             	add    $0x10,%esp
c0005ed8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005edb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ede:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005ee1:	89 50 34             	mov    %edx,0x34(%eax)
c0005ee4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005ee7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005eea:	89 50 64             	mov    %edx,0x64(%eax)
c0005eed:	83 ec 0c             	sub    $0xc,%esp
c0005ef0:	ff 75 08             	pushl  0x8(%ebp)
c0005ef3:	e8 8c 63 00 00       	call   c000c284 <Strlen>
c0005ef8:	83 c4 10             	add    $0x10,%esp
c0005efb:	89 c2                	mov    %eax,%edx
c0005efd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f00:	89 50 30             	mov    %edx,0x30(%eax)
c0005f03:	83 ec 04             	sub    $0x4,%esp
c0005f06:	6a 02                	push   $0x2
c0005f08:	ff 75 f4             	pushl  -0xc(%ebp)
c0005f0b:	6a 03                	push   $0x3
c0005f0d:	e8 64 45 00 00       	call   c000a476 <send_rec>
c0005f12:	83 c4 10             	add    $0x10,%esp
c0005f15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f18:	8b 40 40             	mov    0x40(%eax),%eax
c0005f1b:	c9                   	leave  
c0005f1c:	c3                   	ret    

c0005f1d <read>:
c0005f1d:	55                   	push   %ebp
c0005f1e:	89 e5                	mov    %esp,%ebp
c0005f20:	83 ec 18             	sub    $0x18,%esp
c0005f23:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005f2a:	83 ec 0c             	sub    $0xc,%esp
c0005f2d:	ff 75 f4             	pushl  -0xc(%ebp)
c0005f30:	e8 8f ca ff ff       	call   c00029c4 <sys_malloc>
c0005f35:	83 c4 10             	add    $0x10,%esp
c0005f38:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f3b:	83 ec 0c             	sub    $0xc,%esp
c0005f3e:	ff 75 0c             	pushl  0xc(%ebp)
c0005f41:	e8 7d 10 00 00       	call   c0006fc3 <get_physical_address>
c0005f46:	83 c4 10             	add    $0x10,%esp
c0005f49:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005f4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f4f:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0005f56:	8b 55 08             	mov    0x8(%ebp),%edx
c0005f59:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f5c:	89 50 40             	mov    %edx,0x40(%eax)
c0005f5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f62:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005f65:	89 50 10             	mov    %edx,0x10(%eax)
c0005f68:	8b 55 10             	mov    0x10(%ebp),%edx
c0005f6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f6e:	89 50 50             	mov    %edx,0x50(%eax)
c0005f71:	83 ec 04             	sub    $0x4,%esp
c0005f74:	6a 02                	push   $0x2
c0005f76:	ff 75 f0             	pushl  -0x10(%ebp)
c0005f79:	6a 03                	push   $0x3
c0005f7b:	e8 f6 44 00 00       	call   c000a476 <send_rec>
c0005f80:	83 c4 10             	add    $0x10,%esp
c0005f83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f86:	8b 40 50             	mov    0x50(%eax),%eax
c0005f89:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005f8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005f8f:	c9                   	leave  
c0005f90:	c3                   	ret    

c0005f91 <write>:
c0005f91:	55                   	push   %ebp
c0005f92:	89 e5                	mov    %esp,%ebp
c0005f94:	83 ec 18             	sub    $0x18,%esp
c0005f97:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005f9e:	83 ec 0c             	sub    $0xc,%esp
c0005fa1:	ff 75 f4             	pushl  -0xc(%ebp)
c0005fa4:	e8 1b ca ff ff       	call   c00029c4 <sys_malloc>
c0005fa9:	83 c4 10             	add    $0x10,%esp
c0005fac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005faf:	83 ec 0c             	sub    $0xc,%esp
c0005fb2:	ff 75 0c             	pushl  0xc(%ebp)
c0005fb5:	e8 09 10 00 00       	call   c0006fc3 <get_physical_address>
c0005fba:	83 c4 10             	add    $0x10,%esp
c0005fbd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005fc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fc3:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0005fca:	8b 55 08             	mov    0x8(%ebp),%edx
c0005fcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fd0:	89 50 40             	mov    %edx,0x40(%eax)
c0005fd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fd6:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005fd9:	89 50 10             	mov    %edx,0x10(%eax)
c0005fdc:	8b 55 10             	mov    0x10(%ebp),%edx
c0005fdf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fe2:	89 50 50             	mov    %edx,0x50(%eax)
c0005fe5:	83 ec 04             	sub    $0x4,%esp
c0005fe8:	6a 02                	push   $0x2
c0005fea:	ff 75 f0             	pushl  -0x10(%ebp)
c0005fed:	6a 03                	push   $0x3
c0005fef:	e8 82 44 00 00       	call   c000a476 <send_rec>
c0005ff4:	83 c4 10             	add    $0x10,%esp
c0005ff7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ffa:	8b 40 50             	mov    0x50(%eax),%eax
c0005ffd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006000:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006003:	c9                   	leave  
c0006004:	c3                   	ret    

c0006005 <close>:
c0006005:	55                   	push   %ebp
c0006006:	89 e5                	mov    %esp,%ebp
c0006008:	83 ec 78             	sub    $0x78,%esp
c000600b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006012:	8b 45 08             	mov    0x8(%ebp),%eax
c0006015:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006018:	83 ec 04             	sub    $0x4,%esp
c000601b:	6a 02                	push   $0x2
c000601d:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006020:	50                   	push   %eax
c0006021:	6a 03                	push   $0x3
c0006023:	e8 4e 44 00 00       	call   c000a476 <send_rec>
c0006028:	83 c4 10             	add    $0x10,%esp
c000602b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000602e:	83 f8 65             	cmp    $0x65,%eax
c0006031:	74 19                	je     c000604c <close+0x47>
c0006033:	6a 13                	push   $0x13
c0006035:	68 77 b8 00 c0       	push   $0xc000b877
c000603a:	68 77 b8 00 c0       	push   $0xc000b877
c000603f:	68 83 b8 00 c0       	push   $0xc000b883
c0006044:	e8 01 3b 00 00       	call   c0009b4a <assertion_failure>
c0006049:	83 c4 10             	add    $0x10,%esp
c000604c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000604f:	c9                   	leave  
c0006050:	c3                   	ret    

c0006051 <wait>:
c0006051:	55                   	push   %ebp
c0006052:	89 e5                	mov    %esp,%ebp
c0006054:	83 ec 78             	sub    $0x78,%esp
c0006057:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c000605e:	83 ec 04             	sub    $0x4,%esp
c0006061:	6a 01                	push   $0x1
c0006063:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006066:	50                   	push   %eax
c0006067:	6a 03                	push   $0x3
c0006069:	e8 08 44 00 00       	call   c000a476 <send_rec>
c000606e:	83 c4 10             	add    $0x10,%esp
c0006071:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006074:	89 c2                	mov    %eax,%edx
c0006076:	8b 45 08             	mov    0x8(%ebp),%eax
c0006079:	89 10                	mov    %edx,(%eax)
c000607b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000607e:	83 f8 21             	cmp    $0x21,%eax
c0006081:	74 05                	je     c0006088 <wait+0x37>
c0006083:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006086:	eb 05                	jmp    c000608d <wait+0x3c>
c0006088:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000608d:	c9                   	leave  
c000608e:	c3                   	ret    

c000608f <exit>:
c000608f:	55                   	push   %ebp
c0006090:	89 e5                	mov    %esp,%ebp
c0006092:	83 ec 78             	sub    $0x78,%esp
c0006095:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c000609c:	8b 45 08             	mov    0x8(%ebp),%eax
c000609f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00060a2:	83 ec 04             	sub    $0x4,%esp
c00060a5:	6a 01                	push   $0x1
c00060a7:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00060aa:	50                   	push   %eax
c00060ab:	6a 03                	push   $0x3
c00060ad:	e8 c4 43 00 00       	call   c000a476 <send_rec>
c00060b2:	83 c4 10             	add    $0x10,%esp
c00060b5:	90                   	nop
c00060b6:	c9                   	leave  
c00060b7:	c3                   	ret    

c00060b8 <fork>:
c00060b8:	55                   	push   %ebp
c00060b9:	89 e5                	mov    %esp,%ebp
c00060bb:	83 ec 78             	sub    $0x78,%esp
c00060be:	83 ec 04             	sub    $0x4,%esp
c00060c1:	6a 6c                	push   $0x6c
c00060c3:	6a 00                	push   $0x0
c00060c5:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00060c8:	50                   	push   %eax
c00060c9:	e8 7d 61 00 00       	call   c000c24b <Memset>
c00060ce:	83 c4 10             	add    $0x10,%esp
c00060d1:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00060d8:	83 ec 04             	sub    $0x4,%esp
c00060db:	6a 01                	push   $0x1
c00060dd:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00060e0:	50                   	push   %eax
c00060e1:	6a 03                	push   $0x3
c00060e3:	e8 8e 43 00 00       	call   c000a476 <send_rec>
c00060e8:	83 c4 10             	add    $0x10,%esp
c00060eb:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00060f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00060f5:	85 c0                	test   %eax,%eax
c00060f7:	74 19                	je     c0006112 <fork+0x5a>
c00060f9:	6a 14                	push   $0x14
c00060fb:	68 9b b8 00 c0       	push   $0xc000b89b
c0006100:	68 9b b8 00 c0       	push   $0xc000b89b
c0006105:	68 a6 b8 00 c0       	push   $0xc000b8a6
c000610a:	e8 3b 3a 00 00       	call   c0009b4a <assertion_failure>
c000610f:	83 c4 10             	add    $0x10,%esp
c0006112:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006115:	c9                   	leave  
c0006116:	c3                   	ret    

c0006117 <getpid>:
c0006117:	55                   	push   %ebp
c0006118:	89 e5                	mov    %esp,%ebp
c000611a:	83 ec 78             	sub    $0x78,%esp
c000611d:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0006124:	83 ec 04             	sub    $0x4,%esp
c0006127:	6a 05                	push   $0x5
c0006129:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000612c:	50                   	push   %eax
c000612d:	6a 03                	push   $0x3
c000612f:	e8 42 43 00 00       	call   c000a476 <send_rec>
c0006134:	83 c4 10             	add    $0x10,%esp
c0006137:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000613a:	c9                   	leave  
c000613b:	c3                   	ret    

c000613c <exec>:
c000613c:	55                   	push   %ebp
c000613d:	89 e5                	mov    %esp,%ebp
c000613f:	83 ec 78             	sub    $0x78,%esp
c0006142:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0006149:	8b 45 08             	mov    0x8(%ebp),%eax
c000614c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000614f:	83 ec 0c             	sub    $0xc,%esp
c0006152:	ff 75 08             	pushl  0x8(%ebp)
c0006155:	e8 2a 61 00 00       	call   c000c284 <Strlen>
c000615a:	83 c4 10             	add    $0x10,%esp
c000615d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006160:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0006167:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c000616e:	83 ec 04             	sub    $0x4,%esp
c0006171:	6a 01                	push   $0x1
c0006173:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006176:	50                   	push   %eax
c0006177:	6a 03                	push   $0x3
c0006179:	e8 f8 42 00 00       	call   c000a476 <send_rec>
c000617e:	83 c4 10             	add    $0x10,%esp
c0006181:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006184:	83 f8 65             	cmp    $0x65,%eax
c0006187:	74 19                	je     c00061a2 <exec+0x66>
c0006189:	6a 19                	push   $0x19
c000618b:	68 b6 b8 00 c0       	push   $0xc000b8b6
c0006190:	68 b6 b8 00 c0       	push   $0xc000b8b6
c0006195:	68 c1 b8 00 c0       	push   $0xc000b8c1
c000619a:	e8 ab 39 00 00       	call   c0009b4a <assertion_failure>
c000619f:	83 c4 10             	add    $0x10,%esp
c00061a2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00061a5:	c9                   	leave  
c00061a6:	c3                   	ret    

c00061a7 <execv>:
c00061a7:	55                   	push   %ebp
c00061a8:	89 e5                	mov    %esp,%ebp
c00061aa:	57                   	push   %edi
c00061ab:	81 ec c4 04 00 00    	sub    $0x4c4,%esp
c00061b1:	83 ec 04             	sub    $0x4,%esp
c00061b4:	68 00 04 00 00       	push   $0x400
c00061b9:	6a 00                	push   $0x0
c00061bb:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
c00061c1:	50                   	push   %eax
c00061c2:	e8 84 60 00 00       	call   c000c24b <Memset>
c00061c7:	83 c4 10             	add    $0x10,%esp
c00061ca:	8b 45 0c             	mov    0xc(%ebp),%eax
c00061cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00061d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00061d7:	eb 0d                	jmp    c00061e6 <execv+0x3f>
c00061d9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c00061dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061e0:	83 c0 04             	add    $0x4,%eax
c00061e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061e9:	8b 00                	mov    (%eax),%eax
c00061eb:	85 c0                	test   %eax,%eax
c00061ed:	75 ea                	jne    c00061d9 <execv+0x32>
c00061ef:	8d 95 d8 fb ff ff    	lea    -0x428(%ebp),%edx
c00061f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061f8:	01 d0                	add    %edx,%eax
c00061fa:	c6 00 00             	movb   $0x0,(%eax)
c00061fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006200:	83 c0 04             	add    $0x4,%eax
c0006203:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006206:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
c000620c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000620f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006212:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006215:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000621c:	eb 64                	jmp    c0006282 <execv+0xdb>
c000621e:	8d 95 d8 fb ff ff    	lea    -0x428(%ebp),%edx
c0006224:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006227:	01 c2                	add    %eax,%edx
c0006229:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000622c:	89 10                	mov    %edx,(%eax)
c000622e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006231:	8b 00                	mov    (%eax),%eax
c0006233:	8d 8d d8 fb ff ff    	lea    -0x428(%ebp),%ecx
c0006239:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000623c:	01 ca                	add    %ecx,%edx
c000623e:	83 ec 08             	sub    $0x8,%esp
c0006241:	50                   	push   %eax
c0006242:	52                   	push   %edx
c0006243:	e8 22 60 00 00       	call   c000c26a <Strcpy>
c0006248:	83 c4 10             	add    $0x10,%esp
c000624b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000624e:	8b 00                	mov    (%eax),%eax
c0006250:	83 ec 0c             	sub    $0xc,%esp
c0006253:	50                   	push   %eax
c0006254:	e8 2b 60 00 00       	call   c000c284 <Strlen>
c0006259:	83 c4 10             	add    $0x10,%esp
c000625c:	01 45 f0             	add    %eax,-0x10(%ebp)
c000625f:	8d 95 d8 fb ff ff    	lea    -0x428(%ebp),%edx
c0006265:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006268:	01 d0                	add    %edx,%eax
c000626a:	c6 00 00             	movb   $0x0,(%eax)
c000626d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006270:	83 c0 01             	add    $0x1,%eax
c0006273:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006276:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c000627a:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000627e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006282:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006285:	8b 00                	mov    (%eax),%eax
c0006287:	85 c0                	test   %eax,%eax
c0006289:	75 93                	jne    c000621e <execv+0x77>
c000628b:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
c0006291:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006294:	eb 04                	jmp    c000629a <execv+0xf3>
c0006296:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c000629a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000629d:	8b 00                	mov    (%eax),%eax
c000629f:	85 c0                	test   %eax,%eax
c00062a1:	75 f3                	jne    c0006296 <execv+0xef>
c00062a3:	8d 95 44 fb ff ff    	lea    -0x4bc(%ebp),%edx
c00062a9:	b8 00 00 00 00       	mov    $0x0,%eax
c00062ae:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00062b3:	89 d7                	mov    %edx,%edi
c00062b5:	f3 ab                	rep stos %eax,%es:(%edi)
c00062b7:	c7 85 44 fb ff ff d9 	movl   $0xc000b8d9,-0x4bc(%ebp)
c00062be:	b8 00 c0 
c00062c1:	c7 85 48 fb ff ff e0 	movl   $0xc000b8e0,-0x4b8(%ebp)
c00062c8:	b8 00 c0 
c00062cb:	83 ec 0c             	sub    $0xc,%esp
c00062ce:	ff 75 08             	pushl  0x8(%ebp)
c00062d1:	e8 ed 0c 00 00       	call   c0006fc3 <get_physical_address>
c00062d6:	83 c4 10             	add    $0x10,%esp
c00062d9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00062dc:	83 ec 0c             	sub    $0xc,%esp
c00062df:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
c00062e5:	50                   	push   %eax
c00062e6:	e8 d8 0c 00 00       	call   c0006fc3 <get_physical_address>
c00062eb:	83 c4 10             	add    $0x10,%esp
c00062ee:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00062f1:	c7 85 d4 fb ff ff 02 	movl   $0x2,-0x42c(%ebp)
c00062f8:	00 00 00 
c00062fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00062fe:	89 85 a0 fb ff ff    	mov    %eax,-0x460(%ebp)
c0006304:	83 ec 0c             	sub    $0xc,%esp
c0006307:	ff 75 08             	pushl  0x8(%ebp)
c000630a:	e8 75 5f 00 00       	call   c000c284 <Strlen>
c000630f:	83 c4 10             	add    $0x10,%esp
c0006312:	89 85 9c fb ff ff    	mov    %eax,-0x464(%ebp)
c0006318:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000631b:	89 85 7c fb ff ff    	mov    %eax,-0x484(%ebp)
c0006321:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006324:	89 85 88 fb ff ff    	mov    %eax,-0x478(%ebp)
c000632a:	83 ec 04             	sub    $0x4,%esp
c000632d:	6a 01                	push   $0x1
c000632f:	8d 85 6c fb ff ff    	lea    -0x494(%ebp),%eax
c0006335:	50                   	push   %eax
c0006336:	6a 03                	push   $0x3
c0006338:	e8 39 41 00 00       	call   c000a476 <send_rec>
c000633d:	83 c4 10             	add    $0x10,%esp
c0006340:	8b 85 d4 fb ff ff    	mov    -0x42c(%ebp),%eax
c0006346:	83 f8 65             	cmp    $0x65,%eax
c0006349:	74 19                	je     c0006364 <execv+0x1bd>
c000634b:	6a 75                	push   $0x75
c000634d:	68 b6 b8 00 c0       	push   $0xc000b8b6
c0006352:	68 b6 b8 00 c0       	push   $0xc000b8b6
c0006357:	68 c1 b8 00 c0       	push   $0xc000b8c1
c000635c:	e8 e9 37 00 00       	call   c0009b4a <assertion_failure>
c0006361:	83 c4 10             	add    $0x10,%esp
c0006364:	8b 85 b4 fb ff ff    	mov    -0x44c(%ebp),%eax
c000636a:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000636d:	c9                   	leave  
c000636e:	c3                   	ret    

c000636f <execl>:
c000636f:	55                   	push   %ebp
c0006370:	89 e5                	mov    %esp,%ebp
c0006372:	83 ec 18             	sub    $0x18,%esp
c0006375:	8d 45 0c             	lea    0xc(%ebp),%eax
c0006378:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000637b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000637e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006381:	83 ec 08             	sub    $0x8,%esp
c0006384:	ff 75 f0             	pushl  -0x10(%ebp)
c0006387:	ff 75 08             	pushl  0x8(%ebp)
c000638a:	e8 18 fe ff ff       	call   c00061a7 <execv>
c000638f:	83 c4 10             	add    $0x10,%esp
c0006392:	c9                   	leave  
c0006393:	c3                   	ret    

c0006394 <TaskMM>:
c0006394:	55                   	push   %ebp
c0006395:	89 e5                	mov    %esp,%ebp
c0006397:	83 ec 28             	sub    $0x28,%esp
c000639a:	83 ec 0c             	sub    $0xc,%esp
c000639d:	6a 6c                	push   $0x6c
c000639f:	e8 20 c6 ff ff       	call   c00029c4 <sys_malloc>
c00063a4:	83 c4 10             	add    $0x10,%esp
c00063a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00063aa:	83 ec 0c             	sub    $0xc,%esp
c00063ad:	6a 6c                	push   $0x6c
c00063af:	e8 10 c6 ff ff       	call   c00029c4 <sys_malloc>
c00063b4:	83 c4 10             	add    $0x10,%esp
c00063b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00063ba:	83 ec 04             	sub    $0x4,%esp
c00063bd:	6a 12                	push   $0x12
c00063bf:	ff 75 f0             	pushl  -0x10(%ebp)
c00063c2:	6a 02                	push   $0x2
c00063c4:	e8 ad 40 00 00       	call   c000a476 <send_rec>
c00063c9:	83 c4 10             	add    $0x10,%esp
c00063cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00063cf:	8b 40 68             	mov    0x68(%eax),%eax
c00063d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00063d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00063d8:	8b 00                	mov    (%eax),%eax
c00063da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00063dd:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00063e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00063e7:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00063ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00063f1:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c00063f8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c00063fc:	74 4e                	je     c000644c <TaskMM+0xb8>
c00063fe:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0006402:	7f 08                	jg     c000640c <TaskMM+0x78>
c0006404:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0006408:	74 28                	je     c0006432 <TaskMM+0x9e>
c000640a:	eb 71                	jmp    c000647d <TaskMM+0xe9>
c000640c:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0006410:	74 08                	je     c000641a <TaskMM+0x86>
c0006412:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0006416:	74 4e                	je     c0006466 <TaskMM+0xd2>
c0006418:	eb 63                	jmp    c000647d <TaskMM+0xe9>
c000641a:	83 ec 0c             	sub    $0xc,%esp
c000641d:	ff 75 f0             	pushl  -0x10(%ebp)
c0006420:	e8 ef 03 00 00       	call   c0006814 <do_fork>
c0006425:	83 c4 10             	add    $0x10,%esp
c0006428:	89 c2                	mov    %eax,%edx
c000642a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000642d:	89 50 4c             	mov    %edx,0x4c(%eax)
c0006430:	eb 5c                	jmp    c000648e <TaskMM+0xfa>
c0006432:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006439:	66 87 db             	xchg   %bx,%bx
c000643c:	83 ec 0c             	sub    $0xc,%esp
c000643f:	ff 75 f0             	pushl  -0x10(%ebp)
c0006442:	e8 a9 00 00 00       	call   c00064f0 <do_exec>
c0006447:	83 c4 10             	add    $0x10,%esp
c000644a:	eb 42                	jmp    c000648e <TaskMM+0xfa>
c000644c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006453:	83 ec 08             	sub    $0x8,%esp
c0006456:	ff 75 e0             	pushl  -0x20(%ebp)
c0006459:	ff 75 f0             	pushl  -0x10(%ebp)
c000645c:	e8 1e 04 00 00       	call   c000687f <do_exit>
c0006461:	83 c4 10             	add    $0x10,%esp
c0006464:	eb 28                	jmp    c000648e <TaskMM+0xfa>
c0006466:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000646d:	83 ec 0c             	sub    $0xc,%esp
c0006470:	ff 75 f0             	pushl  -0x10(%ebp)
c0006473:	e8 03 05 00 00       	call   c000697b <do_wait>
c0006478:	83 c4 10             	add    $0x10,%esp
c000647b:	eb 11                	jmp    c000648e <TaskMM+0xfa>
c000647d:	83 ec 0c             	sub    $0xc,%esp
c0006480:	68 e7 b8 00 c0       	push   $0xc000b8e7
c0006485:	e8 a2 36 00 00       	call   c0009b2c <panic>
c000648a:	83 c4 10             	add    $0x10,%esp
c000648d:	90                   	nop
c000648e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006492:	0f 84 22 ff ff ff    	je     c00063ba <TaskMM+0x26>
c0006498:	83 ec 0c             	sub    $0xc,%esp
c000649b:	6a 03                	push   $0x3
c000649d:	e8 17 32 00 00       	call   c00096b9 <delay>
c00064a2:	83 c4 10             	add    $0x10,%esp
c00064a5:	83 ec 04             	sub    $0x4,%esp
c00064a8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00064ab:	ff 75 ec             	pushl  -0x14(%ebp)
c00064ae:	6a 01                	push   $0x1
c00064b0:	e8 c1 3f 00 00       	call   c000a476 <send_rec>
c00064b5:	83 c4 10             	add    $0x10,%esp
c00064b8:	e9 fd fe ff ff       	jmp    c00063ba <TaskMM+0x26>

c00064bd <alloc_mem>:
c00064bd:	55                   	push   %ebp
c00064be:	89 e5                	mov    %esp,%ebp
c00064c0:	83 ec 10             	sub    $0x10,%esp
c00064c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00064c6:	83 e8 08             	sub    $0x8,%eax
c00064c9:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c00064cf:	05 00 00 a0 00       	add    $0xa00000,%eax
c00064d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00064d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00064da:	c9                   	leave  
c00064db:	c3                   	ret    

c00064dc <do_exec2>:
c00064dc:	55                   	push   %ebp
c00064dd:	89 e5                	mov    %esp,%ebp
c00064df:	83 ec 10             	sub    $0x10,%esp
c00064e2:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c00064e9:	b8 00 00 00 00       	mov    $0x0,%eax
c00064ee:	c9                   	leave  
c00064ef:	c3                   	ret    

c00064f0 <do_exec>:
c00064f0:	55                   	push   %ebp
c00064f1:	89 e5                	mov    %esp,%ebp
c00064f3:	81 ec f8 08 00 00    	sub    $0x8f8,%esp
c00064f9:	c7 45 8a 64 65 76 5f 	movl   $0x5f766564,-0x76(%ebp)
c0006500:	c7 45 8e 74 74 79 31 	movl   $0x31797474,-0x72(%ebp)
c0006507:	66 c7 45 92 00 00    	movw   $0x0,-0x6e(%ebp)
c000650d:	66 87 db             	xchg   %bx,%bx
c0006510:	83 ec 08             	sub    $0x8,%esp
c0006513:	6a 00                	push   $0x0
c0006515:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0006518:	50                   	push   %eax
c0006519:	e8 7a f9 ff ff       	call   c0005e98 <open>
c000651e:	83 c4 10             	add    $0x10,%esp
c0006521:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006524:	8b 45 08             	mov    0x8(%ebp),%eax
c0006527:	8b 00                	mov    (%eax),%eax
c0006529:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000652c:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c0006533:	83 ec 04             	sub    $0x4,%esp
c0006536:	6a 0c                	push   $0xc
c0006538:	6a 00                	push   $0x0
c000653a:	8d 85 7e fb ff ff    	lea    -0x482(%ebp),%eax
c0006540:	50                   	push   %eax
c0006541:	e8 05 5d 00 00       	call   c000c24b <Memset>
c0006546:	83 c4 10             	add    $0x10,%esp
c0006549:	8b 45 08             	mov    0x8(%ebp),%eax
c000654c:	8b 40 34             	mov    0x34(%eax),%eax
c000654f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006552:	8b 45 08             	mov    0x8(%ebp),%eax
c0006555:	8b 40 30             	mov    0x30(%eax),%eax
c0006558:	83 ec 08             	sub    $0x8,%esp
c000655b:	50                   	push   %eax
c000655c:	ff 75 d0             	pushl  -0x30(%ebp)
c000655f:	e8 98 09 00 00       	call   c0006efc <alloc_virtual_memory>
c0006564:	83 c4 10             	add    $0x10,%esp
c0006567:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000656a:	8b 45 08             	mov    0x8(%ebp),%eax
c000656d:	8b 40 30             	mov    0x30(%eax),%eax
c0006570:	89 c2                	mov    %eax,%edx
c0006572:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006575:	83 ec 04             	sub    $0x4,%esp
c0006578:	52                   	push   %edx
c0006579:	50                   	push   %eax
c000657a:	8d 85 7e fb ff ff    	lea    -0x482(%ebp),%eax
c0006580:	50                   	push   %eax
c0006581:	e8 df 15 00 00       	call   c0007b65 <Memcpy>
c0006586:	83 c4 10             	add    $0x10,%esp
c0006589:	8b 45 08             	mov    0x8(%ebp),%eax
c000658c:	8b 40 30             	mov    0x30(%eax),%eax
c000658f:	c6 84 05 7e fb ff ff 	movb   $0x0,-0x482(%ebp,%eax,1)
c0006596:	00 
c0006597:	83 ec 08             	sub    $0x8,%esp
c000659a:	6a 00                	push   $0x0
c000659c:	8d 85 7e fb ff ff    	lea    -0x482(%ebp),%eax
c00065a2:	50                   	push   %eax
c00065a3:	e8 f0 f8 ff ff       	call   c0005e98 <open>
c00065a8:	83 c4 10             	add    $0x10,%esp
c00065ab:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00065ae:	83 7d c8 ff          	cmpl   $0xffffffff,-0x38(%ebp)
c00065b2:	75 15                	jne    c00065c9 <do_exec+0xd9>
c00065b4:	83 ec 0c             	sub    $0xc,%esp
c00065b7:	68 f8 b8 00 c0       	push   $0xc000b8f8
c00065bc:	e8 2c 32 00 00       	call   c00097ed <Printf>
c00065c1:	83 c4 10             	add    $0x10,%esp
c00065c4:	e9 49 02 00 00       	jmp    c0006812 <do_exec+0x322>
c00065c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00065d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00065d3:	8d 95 8a fb ff ff    	lea    -0x476(%ebp),%edx
c00065d9:	01 d0                	add    %edx,%eax
c00065db:	83 ec 04             	sub    $0x4,%esp
c00065de:	68 00 02 00 00       	push   $0x200
c00065e3:	50                   	push   %eax
c00065e4:	ff 75 c8             	pushl  -0x38(%ebp)
c00065e7:	e8 31 f9 ff ff       	call   c0005f1d <read>
c00065ec:	83 c4 10             	add    $0x10,%esp
c00065ef:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00065f2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00065f5:	01 45 f4             	add    %eax,-0xc(%ebp)
c00065f8:	83 7d c4 00          	cmpl   $0x0,-0x3c(%ebp)
c00065fc:	74 0b                	je     c0006609 <do_exec+0x119>
c00065fe:	81 7d f4 11 02 00 00 	cmpl   $0x211,-0xc(%ebp)
c0006605:	7f 05                	jg     c000660c <do_exec+0x11c>
c0006607:	eb c7                	jmp    c00065d0 <do_exec+0xe0>
c0006609:	90                   	nop
c000660a:	eb 01                	jmp    c000660d <do_exec+0x11d>
c000660c:	90                   	nop
c000660d:	83 ec 0c             	sub    $0xc,%esp
c0006610:	ff 75 c8             	pushl  -0x38(%ebp)
c0006613:	e8 ed f9 ff ff       	call   c0006005 <close>
c0006618:	83 c4 10             	add    $0x10,%esp
c000661b:	66 87 db             	xchg   %bx,%bx
c000661e:	8d 85 8a fb ff ff    	lea    -0x476(%ebp),%eax
c0006624:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006627:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000662e:	eb 53                	jmp    c0006683 <do_exec+0x193>
c0006630:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006633:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0006637:	0f b7 d0             	movzwl %ax,%edx
c000663a:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000663d:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0006641:	0f b7 c0             	movzwl %ax,%eax
c0006644:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0006648:	01 c2                	add    %eax,%edx
c000664a:	8d 85 8a fb ff ff    	lea    -0x476(%ebp),%eax
c0006650:	01 d0                	add    %edx,%eax
c0006652:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006655:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0006658:	8b 40 10             	mov    0x10(%eax),%eax
c000665b:	89 c1                	mov    %eax,%ecx
c000665d:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0006660:	8b 40 04             	mov    0x4(%eax),%eax
c0006663:	8d 95 8a fb ff ff    	lea    -0x476(%ebp),%edx
c0006669:	01 c2                	add    %eax,%edx
c000666b:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000666e:	8b 40 08             	mov    0x8(%eax),%eax
c0006671:	83 ec 04             	sub    $0x4,%esp
c0006674:	51                   	push   %ecx
c0006675:	52                   	push   %edx
c0006676:	50                   	push   %eax
c0006677:	e8 e9 14 00 00       	call   c0007b65 <Memcpy>
c000667c:	83 c4 10             	add    $0x10,%esp
c000667f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006683:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006686:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c000668a:	0f b7 c0             	movzwl %ax,%eax
c000668d:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006690:	7c 9e                	jl     c0006630 <do_exec+0x140>
c0006692:	66 87 db             	xchg   %bx,%bx
c0006695:	8b 45 08             	mov    0x8(%ebp),%eax
c0006698:	8b 40 10             	mov    0x10(%eax),%eax
c000669b:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000669e:	8b 45 08             	mov    0x8(%ebp),%eax
c00066a1:	8b 40 1c             	mov    0x1c(%eax),%eax
c00066a4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00066a7:	83 ec 0c             	sub    $0xc,%esp
c00066aa:	ff 75 d8             	pushl  -0x28(%ebp)
c00066ad:	e8 f4 e4 ff ff       	call   c0004ba6 <pid2proc>
c00066b2:	83 c4 10             	add    $0x10,%esp
c00066b5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00066b8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00066bb:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00066c1:	ba 00 40 2b 00       	mov    $0x2b4000,%edx
c00066c6:	29 c2                	sub    %eax,%edx
c00066c8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00066cb:	01 d0                	add    %edx,%eax
c00066cd:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00066d0:	8b 45 08             	mov    0x8(%ebp),%eax
c00066d3:	8b 40 10             	mov    0x10(%eax),%eax
c00066d6:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00066d9:	83 ec 08             	sub    $0x8,%esp
c00066dc:	ff 75 b4             	pushl  -0x4c(%ebp)
c00066df:	ff 75 a8             	pushl  -0x58(%ebp)
c00066e2:	e8 15 08 00 00       	call   c0006efc <alloc_virtual_memory>
c00066e7:	83 c4 10             	add    $0x10,%esp
c00066ea:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00066ed:	66 87 db             	xchg   %bx,%bx
c00066f0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00066f3:	83 ec 04             	sub    $0x4,%esp
c00066f6:	ff 75 b4             	pushl  -0x4c(%ebp)
c00066f9:	50                   	push   %eax
c00066fa:	8d 85 7e f7 ff ff    	lea    -0x882(%ebp),%eax
c0006700:	50                   	push   %eax
c0006701:	e8 5f 14 00 00       	call   c0007b65 <Memcpy>
c0006706:	83 c4 10             	add    $0x10,%esp
c0006709:	8d 85 7e f7 ff ff    	lea    -0x882(%ebp),%eax
c000670f:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0006712:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0006715:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006718:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000671f:	eb 08                	jmp    c0006729 <do_exec+0x239>
c0006721:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006725:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0006729:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000672c:	8b 00                	mov    (%eax),%eax
c000672e:	85 c0                	test   %eax,%eax
c0006730:	75 ef                	jne    c0006721 <do_exec+0x231>
c0006732:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0006735:	f7 d8                	neg    %eax
c0006737:	89 c2                	mov    %eax,%edx
c0006739:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000673c:	01 d0                	add    %edx,%eax
c000673e:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0006741:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006748:	8d 85 7e f7 ff ff    	lea    -0x882(%ebp),%eax
c000674e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006751:	eb 17                	jmp    c000676a <do_exec+0x27a>
c0006753:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006757:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000675a:	8b 10                	mov    (%eax),%edx
c000675c:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000675f:	01 c2                	add    %eax,%edx
c0006761:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006764:	89 10                	mov    %edx,(%eax)
c0006766:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c000676a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000676d:	8b 00                	mov    (%eax),%eax
c000676f:	85 c0                	test   %eax,%eax
c0006771:	75 e0                	jne    c0006753 <do_exec+0x263>
c0006773:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006776:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000677b:	89 45 98             	mov    %eax,-0x68(%ebp)
c000677e:	66 87 db             	xchg   %bx,%bx
c0006781:	83 ec 04             	sub    $0x4,%esp
c0006784:	ff 75 b4             	pushl  -0x4c(%ebp)
c0006787:	8d 85 7e f7 ff ff    	lea    -0x882(%ebp),%eax
c000678d:	50                   	push   %eax
c000678e:	ff 75 ac             	pushl  -0x54(%ebp)
c0006791:	e8 cf 13 00 00       	call   c0007b65 <Memcpy>
c0006796:	83 c4 10             	add    $0x10,%esp
c0006799:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000679c:	05 30 88 2a 00       	add    $0x2a8830,%eax
c00067a1:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00067a4:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00067a7:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00067aa:	89 50 2c             	mov    %edx,0x2c(%eax)
c00067ad:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00067b0:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00067b3:	89 50 28             	mov    %edx,0x28(%eax)
c00067b6:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00067b9:	8b 40 18             	mov    0x18(%eax),%eax
c00067bc:	89 c2                	mov    %eax,%edx
c00067be:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00067c1:	89 50 30             	mov    %edx,0x30(%eax)
c00067c4:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00067c7:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00067ca:	89 50 3c             	mov    %edx,0x3c(%eax)
c00067cd:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00067d0:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00067d7:	00 00 00 
c00067da:	c7 85 78 f7 ff ff 65 	movl   $0x65,-0x888(%ebp)
c00067e1:	00 00 00 
c00067e4:	c7 85 58 f7 ff ff 00 	movl   $0x0,-0x8a8(%ebp)
c00067eb:	00 00 00 
c00067ee:	c7 85 5c f7 ff ff 00 	movl   $0x0,-0x8a4(%ebp)
c00067f5:	00 00 00 
c00067f8:	66 87 db             	xchg   %bx,%bx
c00067fb:	83 ec 04             	sub    $0x4,%esp
c00067fe:	ff 75 d8             	pushl  -0x28(%ebp)
c0006801:	8d 85 10 f7 ff ff    	lea    -0x8f0(%ebp),%eax
c0006807:	50                   	push   %eax
c0006808:	6a 01                	push   $0x1
c000680a:	e8 67 3c 00 00       	call   c000a476 <send_rec>
c000680f:	83 c4 10             	add    $0x10,%esp
c0006812:	c9                   	leave  
c0006813:	c3                   	ret    

c0006814 <do_fork>:
c0006814:	55                   	push   %ebp
c0006815:	89 e5                	mov    %esp,%ebp
c0006817:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000681d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006820:	8b 00                	mov    (%eax),%eax
c0006822:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006825:	83 ec 0c             	sub    $0xc,%esp
c0006828:	ff 75 f4             	pushl  -0xc(%ebp)
c000682b:	e8 aa 44 00 00       	call   c000acda <fork_process>
c0006830:	83 c4 10             	add    $0x10,%esp
c0006833:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006836:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006839:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000683f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006842:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006845:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c000684b:	8b 45 08             	mov    0x8(%ebp),%eax
c000684e:	89 50 4c             	mov    %edx,0x4c(%eax)
c0006851:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006858:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c000685f:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006866:	83 ec 04             	sub    $0x4,%esp
c0006869:	ff 75 ec             	pushl  -0x14(%ebp)
c000686c:	8d 45 80             	lea    -0x80(%ebp),%eax
c000686f:	50                   	push   %eax
c0006870:	6a 01                	push   $0x1
c0006872:	e8 ff 3b 00 00       	call   c000a476 <send_rec>
c0006877:	83 c4 10             	add    $0x10,%esp
c000687a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000687d:	c9                   	leave  
c000687e:	c3                   	ret    

c000687f <do_exit>:
c000687f:	55                   	push   %ebp
c0006880:	89 e5                	mov    %esp,%ebp
c0006882:	83 ec 18             	sub    $0x18,%esp
c0006885:	8b 45 08             	mov    0x8(%ebp),%eax
c0006888:	8b 00                	mov    (%eax),%eax
c000688a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000688d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006890:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006896:	05 00 32 08 c0       	add    $0xc0083200,%eax
c000689b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000689e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068a1:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c00068a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00068aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00068ad:	8b 40 44             	mov    0x44(%eax),%eax
c00068b0:	89 c2                	mov    %eax,%edx
c00068b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068b5:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c00068bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00068be:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00068c4:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00068c9:	0f b6 00             	movzbl (%eax),%eax
c00068cc:	3c 04                	cmp    $0x4,%al
c00068ce:	75 21                	jne    c00068f1 <do_exit+0x72>
c00068d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00068d3:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00068d9:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00068de:	c6 00 fb             	movb   $0xfb,(%eax)
c00068e1:	83 ec 0c             	sub    $0xc,%esp
c00068e4:	ff 75 ec             	pushl  -0x14(%ebp)
c00068e7:	e8 59 01 00 00       	call   c0006a45 <cleanup>
c00068ec:	83 c4 10             	add    $0x10,%esp
c00068ef:	eb 0a                	jmp    c00068fb <do_exit+0x7c>
c00068f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068f4:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c00068fb:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006902:	eb 6e                	jmp    c0006972 <do_exit+0xf3>
c0006904:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006907:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000690d:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006912:	8b 00                	mov    (%eax),%eax
c0006914:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006917:	75 55                	jne    c000696e <do_exit+0xef>
c0006919:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000691c:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006922:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006927:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c000692d:	0f b6 05 81 44 08 c0 	movzbl 0xc0084481,%eax
c0006934:	3c 04                	cmp    $0x4,%al
c0006936:	75 36                	jne    c000696e <do_exit+0xef>
c0006938:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000693b:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006941:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006946:	0f b6 00             	movzbl (%eax),%eax
c0006949:	3c 03                	cmp    $0x3,%al
c000694b:	75 21                	jne    c000696e <do_exit+0xef>
c000694d:	c6 05 81 44 08 c0 fb 	movb   $0xfb,0xc0084481
c0006954:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006957:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000695d:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006962:	83 ec 0c             	sub    $0xc,%esp
c0006965:	50                   	push   %eax
c0006966:	e8 da 00 00 00       	call   c0006a45 <cleanup>
c000696b:	83 c4 10             	add    $0x10,%esp
c000696e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006972:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006976:	7e 8c                	jle    c0006904 <do_exit+0x85>
c0006978:	90                   	nop
c0006979:	c9                   	leave  
c000697a:	c3                   	ret    

c000697b <do_wait>:
c000697b:	55                   	push   %ebp
c000697c:	89 e5                	mov    %esp,%ebp
c000697e:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006984:	8b 45 08             	mov    0x8(%ebp),%eax
c0006987:	8b 00                	mov    (%eax),%eax
c0006989:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000698c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006993:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c000699a:	eb 5f                	jmp    c00069fb <do_wait+0x80>
c000699c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000699f:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00069a5:	05 64 34 08 c0       	add    $0xc0083464,%eax
c00069aa:	8b 00                	mov    (%eax),%eax
c00069ac:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c00069af:	75 46                	jne    c00069f7 <do_wait+0x7c>
c00069b1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00069b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00069b8:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00069be:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00069c3:	0f b6 00             	movzbl (%eax),%eax
c00069c6:	3c 03                	cmp    $0x3,%al
c00069c8:	75 2d                	jne    c00069f7 <do_wait+0x7c>
c00069ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069cd:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00069d3:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00069d8:	c6 00 fb             	movb   $0xfb,(%eax)
c00069db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00069de:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00069e4:	05 00 32 08 c0       	add    $0xc0083200,%eax
c00069e9:	83 ec 0c             	sub    $0xc,%esp
c00069ec:	50                   	push   %eax
c00069ed:	e8 53 00 00 00       	call   c0006a45 <cleanup>
c00069f2:	83 c4 10             	add    $0x10,%esp
c00069f5:	eb 4c                	jmp    c0006a43 <do_wait+0xc8>
c00069f7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00069fb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00069ff:	7e 9b                	jle    c000699c <do_wait+0x21>
c0006a01:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006a05:	74 13                	je     c0006a1a <do_wait+0x9f>
c0006a07:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a0a:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a10:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006a15:	c6 00 04             	movb   $0x4,(%eax)
c0006a18:	eb 29                	jmp    c0006a43 <do_wait+0xc8>
c0006a1a:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006a21:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006a28:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006a2f:	83 ec 04             	sub    $0x4,%esp
c0006a32:	ff 75 ec             	pushl  -0x14(%ebp)
c0006a35:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006a38:	50                   	push   %eax
c0006a39:	6a 01                	push   $0x1
c0006a3b:	e8 36 3a 00 00       	call   c000a476 <send_rec>
c0006a40:	83 c4 10             	add    $0x10,%esp
c0006a43:	c9                   	leave  
c0006a44:	c3                   	ret    

c0006a45 <cleanup>:
c0006a45:	55                   	push   %ebp
c0006a46:	89 e5                	mov    %esp,%ebp
c0006a48:	83 ec 78             	sub    $0x78,%esp
c0006a4b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006a52:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006a59:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a5c:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006a62:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006a65:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a68:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006a6e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006a71:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a74:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006a7a:	83 ec 04             	sub    $0x4,%esp
c0006a7d:	50                   	push   %eax
c0006a7e:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006a81:	50                   	push   %eax
c0006a82:	6a 01                	push   $0x1
c0006a84:	e8 ed 39 00 00       	call   c000a476 <send_rec>
c0006a89:	83 c4 10             	add    $0x10,%esp
c0006a8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a8f:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0006a96:	90                   	nop
c0006a97:	c9                   	leave  
c0006a98:	c3                   	ret    

c0006a99 <init_bitmap>:
c0006a99:	55                   	push   %ebp
c0006a9a:	89 e5                	mov    %esp,%ebp
c0006a9c:	83 ec 08             	sub    $0x8,%esp
c0006a9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006aa2:	8b 50 04             	mov    0x4(%eax),%edx
c0006aa5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006aa8:	8b 00                	mov    (%eax),%eax
c0006aaa:	83 ec 04             	sub    $0x4,%esp
c0006aad:	52                   	push   %edx
c0006aae:	6a 00                	push   $0x0
c0006ab0:	50                   	push   %eax
c0006ab1:	e8 95 57 00 00       	call   c000c24b <Memset>
c0006ab6:	83 c4 10             	add    $0x10,%esp
c0006ab9:	90                   	nop
c0006aba:	c9                   	leave  
c0006abb:	c3                   	ret    

c0006abc <test_bit_val>:
c0006abc:	55                   	push   %ebp
c0006abd:	89 e5                	mov    %esp,%ebp
c0006abf:	53                   	push   %ebx
c0006ac0:	83 ec 10             	sub    $0x10,%esp
c0006ac3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ac6:	8d 50 07             	lea    0x7(%eax),%edx
c0006ac9:	85 c0                	test   %eax,%eax
c0006acb:	0f 48 c2             	cmovs  %edx,%eax
c0006ace:	c1 f8 03             	sar    $0x3,%eax
c0006ad1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ad4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ad7:	99                   	cltd   
c0006ad8:	c1 ea 1d             	shr    $0x1d,%edx
c0006adb:	01 d0                	add    %edx,%eax
c0006add:	83 e0 07             	and    $0x7,%eax
c0006ae0:	29 d0                	sub    %edx,%eax
c0006ae2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ae5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ae8:	8b 10                	mov    (%eax),%edx
c0006aea:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006aed:	01 d0                	add    %edx,%eax
c0006aef:	0f b6 00             	movzbl (%eax),%eax
c0006af2:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006af5:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006af9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006afc:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006b01:	89 c1                	mov    %eax,%ecx
c0006b03:	d3 e3                	shl    %cl,%ebx
c0006b05:	89 d8                	mov    %ebx,%eax
c0006b07:	21 c2                	and    %eax,%edx
c0006b09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b0c:	89 c1                	mov    %eax,%ecx
c0006b0e:	d3 fa                	sar    %cl,%edx
c0006b10:	89 d0                	mov    %edx,%eax
c0006b12:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b15:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006b19:	0f 9f c0             	setg   %al
c0006b1c:	0f b6 c0             	movzbl %al,%eax
c0006b1f:	83 c4 10             	add    $0x10,%esp
c0006b22:	5b                   	pop    %ebx
c0006b23:	5d                   	pop    %ebp
c0006b24:	c3                   	ret    

c0006b25 <set_bit_val>:
c0006b25:	55                   	push   %ebp
c0006b26:	89 e5                	mov    %esp,%ebp
c0006b28:	83 ec 10             	sub    $0x10,%esp
c0006b2b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b2e:	8d 50 07             	lea    0x7(%eax),%edx
c0006b31:	85 c0                	test   %eax,%eax
c0006b33:	0f 48 c2             	cmovs  %edx,%eax
c0006b36:	c1 f8 03             	sar    $0x3,%eax
c0006b39:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b3f:	99                   	cltd   
c0006b40:	c1 ea 1d             	shr    $0x1d,%edx
c0006b43:	01 d0                	add    %edx,%eax
c0006b45:	83 e0 07             	and    $0x7,%eax
c0006b48:	29 d0                	sub    %edx,%eax
c0006b4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b50:	8b 10                	mov    (%eax),%edx
c0006b52:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b55:	01 d0                	add    %edx,%eax
c0006b57:	0f b6 00             	movzbl (%eax),%eax
c0006b5a:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006b5d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006b61:	7e 13                	jle    c0006b76 <set_bit_val+0x51>
c0006b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b66:	ba 01 00 00 00       	mov    $0x1,%edx
c0006b6b:	89 c1                	mov    %eax,%ecx
c0006b6d:	d3 e2                	shl    %cl,%edx
c0006b6f:	89 d0                	mov    %edx,%eax
c0006b71:	08 45 ff             	or     %al,-0x1(%ebp)
c0006b74:	eb 13                	jmp    c0006b89 <set_bit_val+0x64>
c0006b76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b79:	ba 01 00 00 00       	mov    $0x1,%edx
c0006b7e:	89 c1                	mov    %eax,%ecx
c0006b80:	d3 e2                	shl    %cl,%edx
c0006b82:	89 d0                	mov    %edx,%eax
c0006b84:	f7 d0                	not    %eax
c0006b86:	20 45 ff             	and    %al,-0x1(%ebp)
c0006b89:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b8c:	8b 10                	mov    (%eax),%edx
c0006b8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b91:	01 c2                	add    %eax,%edx
c0006b93:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006b97:	88 02                	mov    %al,(%edx)
c0006b99:	b8 01 00 00 00       	mov    $0x1,%eax
c0006b9e:	c9                   	leave  
c0006b9f:	c3                   	ret    

c0006ba0 <set_bits>:
c0006ba0:	55                   	push   %ebp
c0006ba1:	89 e5                	mov    %esp,%ebp
c0006ba3:	83 ec 10             	sub    $0x10,%esp
c0006ba6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006bad:	eb 1c                	jmp    c0006bcb <set_bits+0x2b>
c0006baf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006bb2:	8d 50 01             	lea    0x1(%eax),%edx
c0006bb5:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006bb8:	ff 75 10             	pushl  0x10(%ebp)
c0006bbb:	50                   	push   %eax
c0006bbc:	ff 75 08             	pushl  0x8(%ebp)
c0006bbf:	e8 61 ff ff ff       	call   c0006b25 <set_bit_val>
c0006bc4:	83 c4 0c             	add    $0xc,%esp
c0006bc7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006bcb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006bce:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006bd1:	7c dc                	jl     c0006baf <set_bits+0xf>
c0006bd3:	b8 01 00 00 00       	mov    $0x1,%eax
c0006bd8:	c9                   	leave  
c0006bd9:	c3                   	ret    

c0006bda <get_first_free_bit>:
c0006bda:	55                   	push   %ebp
c0006bdb:	89 e5                	mov    %esp,%ebp
c0006bdd:	83 ec 10             	sub    $0x10,%esp
c0006be0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006be3:	8b 40 04             	mov    0x4(%eax),%eax
c0006be6:	c1 e0 03             	shl    $0x3,%eax
c0006be9:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006bec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006bef:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006bf2:	eb 1b                	jmp    c0006c0f <get_first_free_bit+0x35>
c0006bf4:	ff 75 fc             	pushl  -0x4(%ebp)
c0006bf7:	ff 75 08             	pushl  0x8(%ebp)
c0006bfa:	e8 bd fe ff ff       	call   c0006abc <test_bit_val>
c0006bff:	83 c4 08             	add    $0x8,%esp
c0006c02:	85 c0                	test   %eax,%eax
c0006c04:	75 05                	jne    c0006c0b <get_first_free_bit+0x31>
c0006c06:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006c09:	eb 11                	jmp    c0006c1c <get_first_free_bit+0x42>
c0006c0b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006c0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006c12:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006c15:	7c dd                	jl     c0006bf4 <get_first_free_bit+0x1a>
c0006c17:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006c1c:	c9                   	leave  
c0006c1d:	c3                   	ret    

c0006c1e <get_bits>:
c0006c1e:	55                   	push   %ebp
c0006c1f:	89 e5                	mov    %esp,%ebp
c0006c21:	83 ec 20             	sub    $0x20,%esp
c0006c24:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006c2b:	ff 75 f0             	pushl  -0x10(%ebp)
c0006c2e:	ff 75 08             	pushl  0x8(%ebp)
c0006c31:	e8 a4 ff ff ff       	call   c0006bda <get_first_free_bit>
c0006c36:	83 c4 08             	add    $0x8,%esp
c0006c39:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c3f:	8b 40 04             	mov    0x4(%eax),%eax
c0006c42:	c1 e0 03             	shl    $0x3,%eax
c0006c45:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c48:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c4b:	83 e8 01             	sub    $0x1,%eax
c0006c4e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006c51:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006c55:	75 08                	jne    c0006c5f <get_bits+0x41>
c0006c57:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c5a:	e9 85 00 00 00       	jmp    c0006ce4 <get_bits+0xc6>
c0006c5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c62:	83 c0 01             	add    $0x1,%eax
c0006c65:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c68:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c6e:	eb 58                	jmp    c0006cc8 <get_bits+0xaa>
c0006c70:	ff 75 f8             	pushl  -0x8(%ebp)
c0006c73:	ff 75 08             	pushl  0x8(%ebp)
c0006c76:	e8 41 fe ff ff       	call   c0006abc <test_bit_val>
c0006c7b:	83 c4 08             	add    $0x8,%esp
c0006c7e:	85 c0                	test   %eax,%eax
c0006c80:	75 0a                	jne    c0006c8c <get_bits+0x6e>
c0006c82:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006c86:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006c8a:	eb 2b                	jmp    c0006cb7 <get_bits+0x99>
c0006c8c:	6a 00                	push   $0x0
c0006c8e:	ff 75 08             	pushl  0x8(%ebp)
c0006c91:	e8 44 ff ff ff       	call   c0006bda <get_first_free_bit>
c0006c96:	83 c4 08             	add    $0x8,%esp
c0006c99:	83 c0 01             	add    $0x1,%eax
c0006c9c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ca2:	83 c0 01             	add    $0x1,%eax
c0006ca5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ca8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006cab:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006cae:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006cb1:	83 e8 01             	sub    $0x1,%eax
c0006cb4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006cb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006cba:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006cbd:	7c 09                	jl     c0006cc8 <get_bits+0xaa>
c0006cbf:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006cc6:	eb 0d                	jmp    c0006cd5 <get_bits+0xb7>
c0006cc8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ccb:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006cce:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006cd1:	85 c0                	test   %eax,%eax
c0006cd3:	7f 9b                	jg     c0006c70 <get_bits+0x52>
c0006cd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006cd8:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006cdb:	83 c0 01             	add    $0x1,%eax
c0006cde:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ce1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006ce4:	c9                   	leave  
c0006ce5:	c3                   	ret    

c0006ce6 <get_a_page2>:
c0006ce6:	55                   	push   %ebp
c0006ce7:	89 e5                	mov    %esp,%ebp
c0006ce9:	83 ec 18             	sub    $0x18,%esp
c0006cec:	83 ec 0c             	sub    $0xc,%esp
c0006cef:	ff 75 0c             	pushl  0xc(%ebp)
c0006cf2:	e8 1e 00 00 00       	call   c0006d15 <get_a_page>
c0006cf7:	83 c4 10             	add    $0x10,%esp
c0006cfa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006cfd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006d00:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d03:	83 ec 08             	sub    $0x8,%esp
c0006d06:	52                   	push   %edx
c0006d07:	50                   	push   %eax
c0006d08:	e8 61 01 00 00       	call   c0006e6e <add_map_entry>
c0006d0d:	83 c4 10             	add    $0x10,%esp
c0006d10:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d13:	c9                   	leave  
c0006d14:	c3                   	ret    

c0006d15 <get_a_page>:
c0006d15:	55                   	push   %ebp
c0006d16:	89 e5                	mov    %esp,%ebp
c0006d18:	83 ec 20             	sub    $0x20,%esp
c0006d1b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006d1f:	75 22                	jne    c0006d43 <get_a_page+0x2e>
c0006d21:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006d26:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006d29:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006d2e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d31:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006d36:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d39:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006d3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d41:	eb 20                	jmp    c0006d63 <get_a_page+0x4e>
c0006d43:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006d48:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006d4b:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0006d50:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d53:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c0006d58:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d5b:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0006d60:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d63:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006d66:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006d69:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006d6c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006d6f:	6a 01                	push   $0x1
c0006d71:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006d74:	50                   	push   %eax
c0006d75:	e8 a4 fe ff ff       	call   c0006c1e <get_bits>
c0006d7a:	83 c4 08             	add    $0x8,%esp
c0006d7d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006d80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d83:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006d86:	c1 e2 0c             	shl    $0xc,%edx
c0006d89:	01 d0                	add    %edx,%eax
c0006d8b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d8e:	6a 01                	push   $0x1
c0006d90:	ff 75 fc             	pushl  -0x4(%ebp)
c0006d93:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006d96:	50                   	push   %eax
c0006d97:	e8 89 fd ff ff       	call   c0006b25 <set_bit_val>
c0006d9c:	83 c4 0c             	add    $0xc,%esp
c0006d9f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006da2:	c9                   	leave  
c0006da3:	c3                   	ret    

c0006da4 <get_virtual_address>:
c0006da4:	55                   	push   %ebp
c0006da5:	89 e5                	mov    %esp,%ebp
c0006da7:	83 ec 28             	sub    $0x28,%esp
c0006daa:	e8 e8 aa ff ff       	call   c0001897 <get_running_thread_pcb>
c0006daf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006db2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006db6:	75 1a                	jne    c0006dd2 <get_virtual_address+0x2e>
c0006db8:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006dbd:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006dc0:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006dc5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006dc8:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006dcd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006dd0:	eb 18                	jmp    c0006dea <get_virtual_address+0x46>
c0006dd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006dd5:	8b 40 0c             	mov    0xc(%eax),%eax
c0006dd8:	83 ec 04             	sub    $0x4,%esp
c0006ddb:	6a 0c                	push   $0xc
c0006ddd:	50                   	push   %eax
c0006dde:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006de1:	50                   	push   %eax
c0006de2:	e8 7e 0d 00 00       	call   c0007b65 <Memcpy>
c0006de7:	83 c4 10             	add    $0x10,%esp
c0006dea:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006ded:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006df0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006df3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006df6:	8b 45 08             	mov    0x8(%ebp),%eax
c0006df9:	83 ec 08             	sub    $0x8,%esp
c0006dfc:	50                   	push   %eax
c0006dfd:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006e00:	50                   	push   %eax
c0006e01:	e8 18 fe ff ff       	call   c0006c1e <get_bits>
c0006e06:	83 c4 10             	add    $0x10,%esp
c0006e09:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006e0f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006e12:	c1 e2 0c             	shl    $0xc,%edx
c0006e15:	01 d0                	add    %edx,%eax
c0006e17:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e1d:	50                   	push   %eax
c0006e1e:	6a 01                	push   $0x1
c0006e20:	ff 75 f0             	pushl  -0x10(%ebp)
c0006e23:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006e26:	50                   	push   %eax
c0006e27:	e8 74 fd ff ff       	call   c0006ba0 <set_bits>
c0006e2c:	83 c4 10             	add    $0x10,%esp
c0006e2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e32:	c9                   	leave  
c0006e33:	c3                   	ret    

c0006e34 <ptr_pde>:
c0006e34:	55                   	push   %ebp
c0006e35:	89 e5                	mov    %esp,%ebp
c0006e37:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e3a:	c1 e8 16             	shr    $0x16,%eax
c0006e3d:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006e42:	c1 e0 02             	shl    $0x2,%eax
c0006e45:	5d                   	pop    %ebp
c0006e46:	c3                   	ret    

c0006e47 <ptr_pte>:
c0006e47:	55                   	push   %ebp
c0006e48:	89 e5                	mov    %esp,%ebp
c0006e4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e4d:	c1 e8 0a             	shr    $0xa,%eax
c0006e50:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006e55:	89 c2                	mov    %eax,%edx
c0006e57:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e5a:	c1 e8 0c             	shr    $0xc,%eax
c0006e5d:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006e62:	c1 e0 02             	shl    $0x2,%eax
c0006e65:	01 d0                	add    %edx,%eax
c0006e67:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006e6c:	5d                   	pop    %ebp
c0006e6d:	c3                   	ret    

c0006e6e <add_map_entry>:
c0006e6e:	55                   	push   %ebp
c0006e6f:	89 e5                	mov    %esp,%ebp
c0006e71:	83 ec 18             	sub    $0x18,%esp
c0006e74:	ff 75 08             	pushl  0x8(%ebp)
c0006e77:	e8 b8 ff ff ff       	call   c0006e34 <ptr_pde>
c0006e7c:	83 c4 04             	add    $0x4,%esp
c0006e7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e82:	ff 75 08             	pushl  0x8(%ebp)
c0006e85:	e8 bd ff ff ff       	call   c0006e47 <ptr_pte>
c0006e8a:	83 c4 04             	add    $0x4,%esp
c0006e8d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e90:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e93:	8b 00                	mov    (%eax),%eax
c0006e95:	83 e0 01             	and    $0x1,%eax
c0006e98:	85 c0                	test   %eax,%eax
c0006e9a:	74 1b                	je     c0006eb7 <add_map_entry+0x49>
c0006e9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e9f:	8b 00                	mov    (%eax),%eax
c0006ea1:	83 e0 01             	and    $0x1,%eax
c0006ea4:	85 c0                	test   %eax,%eax
c0006ea6:	75 51                	jne    c0006ef9 <add_map_entry+0x8b>
c0006ea8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006eab:	83 c8 07             	or     $0x7,%eax
c0006eae:	89 c2                	mov    %eax,%edx
c0006eb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006eb3:	89 10                	mov    %edx,(%eax)
c0006eb5:	eb 42                	jmp    c0006ef9 <add_map_entry+0x8b>
c0006eb7:	6a 00                	push   $0x0
c0006eb9:	e8 57 fe ff ff       	call   c0006d15 <get_a_page>
c0006ebe:	83 c4 04             	add    $0x4,%esp
c0006ec1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ec4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ec7:	83 c8 07             	or     $0x7,%eax
c0006eca:	89 c2                	mov    %eax,%edx
c0006ecc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ecf:	89 10                	mov    %edx,(%eax)
c0006ed1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006ed4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006ed9:	83 ec 04             	sub    $0x4,%esp
c0006edc:	68 00 10 00 00       	push   $0x1000
c0006ee1:	6a 00                	push   $0x0
c0006ee3:	50                   	push   %eax
c0006ee4:	e8 62 53 00 00       	call   c000c24b <Memset>
c0006ee9:	83 c4 10             	add    $0x10,%esp
c0006eec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006eef:	83 c8 07             	or     $0x7,%eax
c0006ef2:	89 c2                	mov    %eax,%edx
c0006ef4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006ef7:	89 10                	mov    %edx,(%eax)
c0006ef9:	90                   	nop
c0006efa:	c9                   	leave  
c0006efb:	c3                   	ret    

c0006efc <alloc_virtual_memory>:
c0006efc:	55                   	push   %ebp
c0006efd:	89 e5                	mov    %esp,%ebp
c0006eff:	83 ec 28             	sub    $0x28,%esp
c0006f02:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f05:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006f0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f10:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0006f13:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006f16:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006f19:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0006f1c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006f1f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006f24:	c1 e8 0c             	shr    $0xc,%eax
c0006f27:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006f2a:	e8 68 a9 ff ff       	call   c0001897 <get_running_thread_pcb>
c0006f2f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006f32:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f35:	8b 40 08             	mov    0x8(%eax),%eax
c0006f38:	85 c0                	test   %eax,%eax
c0006f3a:	75 09                	jne    c0006f45 <alloc_virtual_memory+0x49>
c0006f3c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006f43:	eb 07                	jmp    c0006f4c <alloc_virtual_memory+0x50>
c0006f45:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006f4c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0006f53:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006f5a:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006f61:	eb 47                	jmp    c0006faa <alloc_virtual_memory+0xae>
c0006f63:	83 ec 08             	sub    $0x8,%esp
c0006f66:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f69:	6a 01                	push   $0x1
c0006f6b:	e8 34 fe ff ff       	call   c0006da4 <get_virtual_address>
c0006f70:	83 c4 10             	add    $0x10,%esp
c0006f73:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006f76:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006f7a:	74 13                	je     c0006f8f <alloc_virtual_memory+0x93>
c0006f7c:	83 ec 0c             	sub    $0xc,%esp
c0006f7f:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f82:	e8 8e fd ff ff       	call   c0006d15 <get_a_page>
c0006f87:	83 c4 10             	add    $0x10,%esp
c0006f8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f8d:	eb 06                	jmp    c0006f95 <alloc_virtual_memory+0x99>
c0006f8f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006f92:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f95:	83 ec 08             	sub    $0x8,%esp
c0006f98:	ff 75 f4             	pushl  -0xc(%ebp)
c0006f9b:	ff 75 d8             	pushl  -0x28(%ebp)
c0006f9e:	e8 cb fe ff ff       	call   c0006e6e <add_map_entry>
c0006fa3:	83 c4 10             	add    $0x10,%esp
c0006fa6:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006faa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006fad:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0006fb0:	72 b1                	jb     c0006f63 <alloc_virtual_memory+0x67>
c0006fb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fb5:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006fba:	89 c2                	mov    %eax,%edx
c0006fbc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006fbf:	01 d0                	add    %edx,%eax
c0006fc1:	c9                   	leave  
c0006fc2:	c3                   	ret    

c0006fc3 <get_physical_address>:
c0006fc3:	55                   	push   %ebp
c0006fc4:	89 e5                	mov    %esp,%ebp
c0006fc6:	83 ec 10             	sub    $0x10,%esp
c0006fc9:	ff 75 08             	pushl  0x8(%ebp)
c0006fcc:	e8 76 fe ff ff       	call   c0006e47 <ptr_pte>
c0006fd1:	83 c4 04             	add    $0x4,%esp
c0006fd4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006fd7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006fda:	8b 00                	mov    (%eax),%eax
c0006fdc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006fe1:	89 c2                	mov    %eax,%edx
c0006fe3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fe6:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006feb:	09 d0                	or     %edx,%eax
c0006fed:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ff0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006ff3:	c9                   	leave  
c0006ff4:	c3                   	ret    

c0006ff5 <alloc_physical_memory>:
c0006ff5:	55                   	push   %ebp
c0006ff6:	89 e5                	mov    %esp,%ebp
c0006ff8:	83 ec 38             	sub    $0x38,%esp
c0006ffb:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ffe:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007003:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007006:	e8 8c a8 ff ff       	call   c0001897 <get_running_thread_pcb>
c000700b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000700e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007012:	75 1a                	jne    c000702e <alloc_physical_memory+0x39>
c0007014:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007019:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000701c:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007021:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007024:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007029:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000702c:	eb 18                	jmp    c0007046 <alloc_physical_memory+0x51>
c000702e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007031:	8b 40 0c             	mov    0xc(%eax),%eax
c0007034:	83 ec 04             	sub    $0x4,%esp
c0007037:	6a 0c                	push   $0xc
c0007039:	50                   	push   %eax
c000703a:	8d 45 d8             	lea    -0x28(%ebp),%eax
c000703d:	50                   	push   %eax
c000703e:	e8 22 0b 00 00       	call   c0007b65 <Memcpy>
c0007043:	83 c4 10             	add    $0x10,%esp
c0007046:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007049:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000704c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000704f:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c0007052:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007055:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007058:	29 c2                	sub    %eax,%edx
c000705a:	89 d0                	mov    %edx,%eax
c000705c:	c1 e8 0c             	shr    $0xc,%eax
c000705f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007062:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007065:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0007068:	c1 e2 0c             	shl    $0xc,%edx
c000706b:	01 d0                	add    %edx,%eax
c000706d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007070:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007073:	6a 01                	push   $0x1
c0007075:	6a 01                	push   $0x1
c0007077:	50                   	push   %eax
c0007078:	8d 45 d0             	lea    -0x30(%ebp),%eax
c000707b:	50                   	push   %eax
c000707c:	e8 1f fb ff ff       	call   c0006ba0 <set_bits>
c0007081:	83 c4 10             	add    $0x10,%esp
c0007084:	83 ec 0c             	sub    $0xc,%esp
c0007087:	ff 75 0c             	pushl  0xc(%ebp)
c000708a:	e8 86 fc ff ff       	call   c0006d15 <get_a_page>
c000708f:	83 c4 10             	add    $0x10,%esp
c0007092:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007095:	83 ec 08             	sub    $0x8,%esp
c0007098:	ff 75 e4             	pushl  -0x1c(%ebp)
c000709b:	ff 75 08             	pushl  0x8(%ebp)
c000709e:	e8 cb fd ff ff       	call   c0006e6e <add_map_entry>
c00070a3:	83 c4 10             	add    $0x10,%esp
c00070a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00070a9:	c9                   	leave  
c00070aa:	c3                   	ret    

c00070ab <alloc_memory>:
c00070ab:	55                   	push   %ebp
c00070ac:	89 e5                	mov    %esp,%ebp
c00070ae:	83 ec 18             	sub    $0x18,%esp
c00070b1:	83 ec 08             	sub    $0x8,%esp
c00070b4:	ff 75 0c             	pushl  0xc(%ebp)
c00070b7:	ff 75 08             	pushl  0x8(%ebp)
c00070ba:	e8 e5 fc ff ff       	call   c0006da4 <get_virtual_address>
c00070bf:	83 c4 10             	add    $0x10,%esp
c00070c2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00070c8:	2d 00 10 00 00       	sub    $0x1000,%eax
c00070cd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070d0:	eb 29                	jmp    c00070fb <alloc_memory+0x50>
c00070d2:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c00070d9:	83 ec 0c             	sub    $0xc,%esp
c00070dc:	ff 75 0c             	pushl  0xc(%ebp)
c00070df:	e8 31 fc ff ff       	call   c0006d15 <get_a_page>
c00070e4:	83 c4 10             	add    $0x10,%esp
c00070e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00070ea:	83 ec 08             	sub    $0x8,%esp
c00070ed:	ff 75 ec             	pushl  -0x14(%ebp)
c00070f0:	ff 75 f4             	pushl  -0xc(%ebp)
c00070f3:	e8 76 fd ff ff       	call   c0006e6e <add_map_entry>
c00070f8:	83 c4 10             	add    $0x10,%esp
c00070fb:	8b 45 08             	mov    0x8(%ebp),%eax
c00070fe:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007101:	89 55 08             	mov    %edx,0x8(%ebp)
c0007104:	85 c0                	test   %eax,%eax
c0007106:	75 ca                	jne    c00070d2 <alloc_memory+0x27>
c0007108:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000710b:	c9                   	leave  
c000710c:	c3                   	ret    

c000710d <get_a_virtual_page>:
c000710d:	55                   	push   %ebp
c000710e:	89 e5                	mov    %esp,%ebp
c0007110:	83 ec 18             	sub    $0x18,%esp
c0007113:	ff 75 08             	pushl  0x8(%ebp)
c0007116:	e8 fa fb ff ff       	call   c0006d15 <get_a_page>
c000711b:	83 c4 04             	add    $0x4,%esp
c000711e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007121:	83 ec 08             	sub    $0x8,%esp
c0007124:	ff 75 f4             	pushl  -0xc(%ebp)
c0007127:	ff 75 0c             	pushl  0xc(%ebp)
c000712a:	e8 3f fd ff ff       	call   c0006e6e <add_map_entry>
c000712f:	83 c4 10             	add    $0x10,%esp
c0007132:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007135:	c9                   	leave  
c0007136:	c3                   	ret    

c0007137 <block2arena>:
c0007137:	55                   	push   %ebp
c0007138:	89 e5                	mov    %esp,%ebp
c000713a:	83 ec 10             	sub    $0x10,%esp
c000713d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007140:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007145:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007148:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000714b:	c9                   	leave  
c000714c:	c3                   	ret    

c000714d <sys_malloc2>:
c000714d:	55                   	push   %ebp
c000714e:	89 e5                	mov    %esp,%ebp
c0007150:	83 ec 68             	sub    $0x68,%esp
c0007153:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000715a:	e8 38 a7 ff ff       	call   c0001897 <get_running_thread_pcb>
c000715f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007162:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007165:	8b 40 08             	mov    0x8(%eax),%eax
c0007168:	85 c0                	test   %eax,%eax
c000716a:	75 10                	jne    c000717c <sys_malloc2+0x2f>
c000716c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007173:	c7 45 ec a0 47 08 c0 	movl   $0xc00847a0,-0x14(%ebp)
c000717a:	eb 10                	jmp    c000718c <sys_malloc2+0x3f>
c000717c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007183:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007186:	83 c0 10             	add    $0x10,%eax
c0007189:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000718c:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0007193:	76 50                	jbe    c00071e5 <sys_malloc2+0x98>
c0007195:	8b 45 08             	mov    0x8(%ebp),%eax
c0007198:	05 0b 10 00 00       	add    $0x100b,%eax
c000719d:	c1 e8 0c             	shr    $0xc,%eax
c00071a0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00071a3:	83 ec 08             	sub    $0x8,%esp
c00071a6:	ff 75 f0             	pushl  -0x10(%ebp)
c00071a9:	ff 75 d8             	pushl  -0x28(%ebp)
c00071ac:	e8 fa fe ff ff       	call   c00070ab <alloc_memory>
c00071b1:	83 c4 10             	add    $0x10,%esp
c00071b4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00071b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00071ba:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00071bd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071c0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00071c6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071c9:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c00071d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071d3:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c00071d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071da:	83 c0 0c             	add    $0xc,%eax
c00071dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00071e0:	e9 f0 01 00 00       	jmp    c00073d5 <sys_malloc2+0x288>
c00071e5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00071ec:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00071f3:	eb 26                	jmp    c000721b <sys_malloc2+0xce>
c00071f5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00071f8:	89 d0                	mov    %edx,%eax
c00071fa:	01 c0                	add    %eax,%eax
c00071fc:	01 d0                	add    %edx,%eax
c00071fe:	c1 e0 03             	shl    $0x3,%eax
c0007201:	89 c2                	mov    %eax,%edx
c0007203:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007206:	01 d0                	add    %edx,%eax
c0007208:	8b 00                	mov    (%eax),%eax
c000720a:	39 45 08             	cmp    %eax,0x8(%ebp)
c000720d:	77 08                	ja     c0007217 <sys_malloc2+0xca>
c000720f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007212:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007215:	eb 0a                	jmp    c0007221 <sys_malloc2+0xd4>
c0007217:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000721b:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c000721f:	7e d4                	jle    c00071f5 <sys_malloc2+0xa8>
c0007221:	83 ec 08             	sub    $0x8,%esp
c0007224:	ff 75 f0             	pushl  -0x10(%ebp)
c0007227:	6a 01                	push   $0x1
c0007229:	e8 7d fe ff ff       	call   c00070ab <alloc_memory>
c000722e:	83 c4 10             	add    $0x10,%esp
c0007231:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007234:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007237:	89 d0                	mov    %edx,%eax
c0007239:	01 c0                	add    %eax,%eax
c000723b:	01 d0                	add    %edx,%eax
c000723d:	c1 e0 03             	shl    $0x3,%eax
c0007240:	89 c2                	mov    %eax,%edx
c0007242:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007245:	01 d0                	add    %edx,%eax
c0007247:	83 ec 04             	sub    $0x4,%esp
c000724a:	6a 18                	push   $0x18
c000724c:	50                   	push   %eax
c000724d:	ff 75 cc             	pushl  -0x34(%ebp)
c0007250:	e8 10 09 00 00       	call   c0007b65 <Memcpy>
c0007255:	83 c4 10             	add    $0x10,%esp
c0007258:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c000725f:	e8 9d 08 00 00       	call   c0007b01 <intr_disable>
c0007264:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007267:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000726a:	89 d0                	mov    %edx,%eax
c000726c:	01 c0                	add    %eax,%eax
c000726e:	01 d0                	add    %edx,%eax
c0007270:	c1 e0 03             	shl    $0x3,%eax
c0007273:	89 c2                	mov    %eax,%edx
c0007275:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007278:	01 d0                	add    %edx,%eax
c000727a:	83 c0 08             	add    $0x8,%eax
c000727d:	83 ec 0c             	sub    $0xc,%esp
c0007280:	50                   	push   %eax
c0007281:	e8 bd 3c 00 00       	call   c000af43 <isListEmpty>
c0007286:	83 c4 10             	add    $0x10,%esp
c0007289:	3c 01                	cmp    $0x1,%al
c000728b:	0f 85 c1 00 00 00    	jne    c0007352 <sys_malloc2+0x205>
c0007291:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c0007298:	83 ec 08             	sub    $0x8,%esp
c000729b:	ff 75 f0             	pushl  -0x10(%ebp)
c000729e:	6a 01                	push   $0x1
c00072a0:	e8 06 fe ff ff       	call   c00070ab <alloc_memory>
c00072a5:	83 c4 10             	add    $0x10,%esp
c00072a8:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00072ab:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00072ae:	83 ec 0c             	sub    $0xc,%esp
c00072b1:	50                   	push   %eax
c00072b2:	e8 80 fe ff ff       	call   c0007137 <block2arena>
c00072b7:	83 c4 10             	add    $0x10,%esp
c00072ba:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00072bd:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00072c0:	89 d0                	mov    %edx,%eax
c00072c2:	01 c0                	add    %eax,%eax
c00072c4:	01 d0                	add    %edx,%eax
c00072c6:	c1 e0 03             	shl    $0x3,%eax
c00072c9:	89 c2                	mov    %eax,%edx
c00072cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00072ce:	01 d0                	add    %edx,%eax
c00072d0:	8b 50 04             	mov    0x4(%eax),%edx
c00072d3:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00072d6:	89 50 04             	mov    %edx,0x4(%eax)
c00072d9:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00072dc:	8b 00                	mov    (%eax),%eax
c00072de:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00072e1:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c00072e8:	b8 00 10 00 00       	mov    $0x1000,%eax
c00072ed:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c00072f0:	ba 00 00 00 00       	mov    $0x0,%edx
c00072f5:	f7 75 b8             	divl   -0x48(%ebp)
c00072f8:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00072fb:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00072fe:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0007301:	01 d0                	add    %edx,%eax
c0007303:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0007306:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000730d:	eb 3b                	jmp    c000734a <sys_malloc2+0x1fd>
c000730f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007312:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0007316:	89 c2                	mov    %eax,%edx
c0007318:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000731b:	01 d0                	add    %edx,%eax
c000731d:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0007320:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0007323:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007326:	89 d0                	mov    %edx,%eax
c0007328:	01 c0                	add    %eax,%eax
c000732a:	01 d0                	add    %edx,%eax
c000732c:	c1 e0 03             	shl    $0x3,%eax
c000732f:	89 c2                	mov    %eax,%edx
c0007331:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007334:	01 d0                	add    %edx,%eax
c0007336:	83 c0 08             	add    $0x8,%eax
c0007339:	83 ec 08             	sub    $0x8,%esp
c000733c:	51                   	push   %ecx
c000733d:	50                   	push   %eax
c000733e:	e8 fd 3c 00 00       	call   c000b040 <appendToDoubleLinkList>
c0007343:	83 c4 10             	add    $0x10,%esp
c0007346:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000734a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000734d:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c0007350:	77 bd                	ja     c000730f <sys_malloc2+0x1c2>
c0007352:	83 ec 0c             	sub    $0xc,%esp
c0007355:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007358:	e8 cd 07 00 00       	call   c0007b2a <intr_set_status>
c000735d:	83 c4 10             	add    $0x10,%esp
c0007360:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007363:	89 d0                	mov    %edx,%eax
c0007365:	01 c0                	add    %eax,%eax
c0007367:	01 d0                	add    %edx,%eax
c0007369:	c1 e0 03             	shl    $0x3,%eax
c000736c:	89 c2                	mov    %eax,%edx
c000736e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007371:	01 d0                	add    %edx,%eax
c0007373:	83 c0 08             	add    $0x8,%eax
c0007376:	83 ec 0c             	sub    $0xc,%esp
c0007379:	50                   	push   %eax
c000737a:	e8 2b 3e 00 00       	call   c000b1aa <popFromDoubleLinkList>
c000737f:	83 c4 10             	add    $0x10,%esp
c0007382:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0007385:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0007388:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000738b:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c000738f:	75 1c                	jne    c00073ad <sys_malloc2+0x260>
c0007391:	68 af 01 00 00       	push   $0x1af
c0007396:	68 08 b9 00 c0       	push   $0xc000b908
c000739b:	68 08 b9 00 c0       	push   $0xc000b908
c00073a0:	68 12 b9 00 c0       	push   $0xc000b912
c00073a5:	e8 a0 27 00 00       	call   c0009b4a <assertion_failure>
c00073aa:	83 c4 10             	add    $0x10,%esp
c00073ad:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00073b0:	83 ec 0c             	sub    $0xc,%esp
c00073b3:	50                   	push   %eax
c00073b4:	e8 7e fd ff ff       	call   c0007137 <block2arena>
c00073b9:	83 c4 10             	add    $0x10,%esp
c00073bc:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00073bf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00073c2:	8b 40 04             	mov    0x4(%eax),%eax
c00073c5:	8d 50 ff             	lea    -0x1(%eax),%edx
c00073c8:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00073cb:	89 50 04             	mov    %edx,0x4(%eax)
c00073ce:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c00073d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00073d9:	75 1c                	jne    c00073f7 <sys_malloc2+0x2aa>
c00073db:	68 b6 01 00 00       	push   $0x1b6
c00073e0:	68 08 b9 00 c0       	push   $0xc000b908
c00073e5:	68 08 b9 00 c0       	push   $0xc000b908
c00073ea:	68 24 b9 00 c0       	push   $0xc000b924
c00073ef:	e8 56 27 00 00       	call   c0009b4a <assertion_failure>
c00073f4:	83 c4 10             	add    $0x10,%esp
c00073f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00073fa:	c9                   	leave  
c00073fb:	c3                   	ret    

c00073fc <remove_map_entry>:
c00073fc:	55                   	push   %ebp
c00073fd:	89 e5                	mov    %esp,%ebp
c00073ff:	83 ec 10             	sub    $0x10,%esp
c0007402:	ff 75 08             	pushl  0x8(%ebp)
c0007405:	e8 3d fa ff ff       	call   c0006e47 <ptr_pte>
c000740a:	83 c4 04             	add    $0x4,%esp
c000740d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007410:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007413:	8b 10                	mov    (%eax),%edx
c0007415:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007418:	89 10                	mov    %edx,(%eax)
c000741a:	90                   	nop
c000741b:	c9                   	leave  
c000741c:	c3                   	ret    

c000741d <free_a_page>:
c000741d:	55                   	push   %ebp
c000741e:	89 e5                	mov    %esp,%ebp
c0007420:	83 ec 20             	sub    $0x20,%esp
c0007423:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007427:	75 21                	jne    c000744a <free_a_page+0x2d>
c0007429:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000742e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007431:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007436:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007439:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c000743e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007441:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c0007448:	eb 1f                	jmp    c0007469 <free_a_page+0x4c>
c000744a:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000744f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007452:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007457:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000745a:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c000745f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007462:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c0007469:	8b 45 08             	mov    0x8(%ebp),%eax
c000746c:	c1 e8 0c             	shr    $0xc,%eax
c000746f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007472:	6a 00                	push   $0x0
c0007474:	ff 75 f8             	pushl  -0x8(%ebp)
c0007477:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000747a:	50                   	push   %eax
c000747b:	e8 a5 f6 ff ff       	call   c0006b25 <set_bit_val>
c0007480:	83 c4 0c             	add    $0xc,%esp
c0007483:	ff 75 08             	pushl  0x8(%ebp)
c0007486:	e8 38 fb ff ff       	call   c0006fc3 <get_physical_address>
c000748b:	83 c4 04             	add    $0x4,%esp
c000748e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007491:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007494:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000749a:	85 c0                	test   %eax,%eax
c000749c:	0f 48 c2             	cmovs  %edx,%eax
c000749f:	c1 f8 0c             	sar    $0xc,%eax
c00074a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00074a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00074a8:	6a 00                	push   $0x0
c00074aa:	ff 75 f0             	pushl  -0x10(%ebp)
c00074ad:	50                   	push   %eax
c00074ae:	e8 72 f6 ff ff       	call   c0006b25 <set_bit_val>
c00074b3:	83 c4 0c             	add    $0xc,%esp
c00074b6:	ff 75 08             	pushl  0x8(%ebp)
c00074b9:	e8 3e ff ff ff       	call   c00073fc <remove_map_entry>
c00074be:	83 c4 04             	add    $0x4,%esp
c00074c1:	90                   	nop
c00074c2:	c9                   	leave  
c00074c3:	c3                   	ret    

c00074c4 <sys_free>:
c00074c4:	55                   	push   %ebp
c00074c5:	89 e5                	mov    %esp,%ebp
c00074c7:	83 ec 58             	sub    $0x58,%esp
c00074ca:	e8 c8 a3 ff ff       	call   c0001897 <get_running_thread_pcb>
c00074cf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00074d2:	e8 2a 06 00 00       	call   c0007b01 <intr_disable>
c00074d7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00074da:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00074dd:	8b 40 08             	mov    0x8(%eax),%eax
c00074e0:	85 c0                	test   %eax,%eax
c00074e2:	75 10                	jne    c00074f4 <sys_free+0x30>
c00074e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00074eb:	c7 45 f0 a0 47 08 c0 	movl   $0xc00847a0,-0x10(%ebp)
c00074f2:	eb 10                	jmp    c0007504 <sys_free+0x40>
c00074f4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00074fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00074fe:	83 c0 10             	add    $0x10,%eax
c0007501:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007504:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c000750b:	76 4d                	jbe    c000755a <sys_free+0x96>
c000750d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007510:	83 e8 0c             	sub    $0xc,%eax
c0007513:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007516:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c000751a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000751d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007522:	c1 e8 0c             	shr    $0xc,%eax
c0007525:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007528:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000752f:	eb 1c                	jmp    c000754d <sys_free+0x89>
c0007531:	83 ec 08             	sub    $0x8,%esp
c0007534:	ff 75 f4             	pushl  -0xc(%ebp)
c0007537:	ff 75 ec             	pushl  -0x14(%ebp)
c000753a:	e8 de fe ff ff       	call   c000741d <free_a_page>
c000753f:	83 c4 10             	add    $0x10,%esp
c0007542:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0007549:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000754d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007550:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c0007553:	77 dc                	ja     c0007531 <sys_free+0x6d>
c0007555:	e9 dc 00 00 00       	jmp    c0007636 <sys_free+0x172>
c000755a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007561:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007568:	eb 26                	jmp    c0007590 <sys_free+0xcc>
c000756a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000756d:	89 d0                	mov    %edx,%eax
c000756f:	01 c0                	add    %eax,%eax
c0007571:	01 d0                	add    %edx,%eax
c0007573:	c1 e0 03             	shl    $0x3,%eax
c0007576:	89 c2                	mov    %eax,%edx
c0007578:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000757b:	01 d0                	add    %edx,%eax
c000757d:	8b 00                	mov    (%eax),%eax
c000757f:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0007582:	77 08                	ja     c000758c <sys_free+0xc8>
c0007584:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007587:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000758a:	eb 0a                	jmp    c0007596 <sys_free+0xd2>
c000758c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007590:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0007594:	7e d4                	jle    c000756a <sys_free+0xa6>
c0007596:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007599:	89 d0                	mov    %edx,%eax
c000759b:	01 c0                	add    %eax,%eax
c000759d:	01 d0                	add    %edx,%eax
c000759f:	c1 e0 03             	shl    $0x3,%eax
c00075a2:	89 c2                	mov    %eax,%edx
c00075a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00075a7:	01 d0                	add    %edx,%eax
c00075a9:	8b 10                	mov    (%eax),%edx
c00075ab:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c00075ae:	8b 50 04             	mov    0x4(%eax),%edx
c00075b1:	89 55 b8             	mov    %edx,-0x48(%ebp)
c00075b4:	8b 50 08             	mov    0x8(%eax),%edx
c00075b7:	89 55 bc             	mov    %edx,-0x44(%ebp)
c00075ba:	8b 50 0c             	mov    0xc(%eax),%edx
c00075bd:	89 55 c0             	mov    %edx,-0x40(%ebp)
c00075c0:	8b 50 10             	mov    0x10(%eax),%edx
c00075c3:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c00075c6:	8b 40 14             	mov    0x14(%eax),%eax
c00075c9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00075cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00075cf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00075d2:	83 ec 0c             	sub    $0xc,%esp
c00075d5:	ff 75 d0             	pushl  -0x30(%ebp)
c00075d8:	e8 5a fb ff ff       	call   c0007137 <block2arena>
c00075dd:	83 c4 10             	add    $0x10,%esp
c00075e0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00075e3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00075e6:	89 d0                	mov    %edx,%eax
c00075e8:	01 c0                	add    %eax,%eax
c00075ea:	01 d0                	add    %edx,%eax
c00075ec:	c1 e0 03             	shl    $0x3,%eax
c00075ef:	89 c2                	mov    %eax,%edx
c00075f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00075f4:	01 d0                	add    %edx,%eax
c00075f6:	83 c0 08             	add    $0x8,%eax
c00075f9:	83 ec 08             	sub    $0x8,%esp
c00075fc:	ff 75 d0             	pushl  -0x30(%ebp)
c00075ff:	50                   	push   %eax
c0007600:	e8 3b 3a 00 00       	call   c000b040 <appendToDoubleLinkList>
c0007605:	83 c4 10             	add    $0x10,%esp
c0007608:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000760b:	8b 40 04             	mov    0x4(%eax),%eax
c000760e:	8d 50 01             	lea    0x1(%eax),%edx
c0007611:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007614:	89 50 04             	mov    %edx,0x4(%eax)
c0007617:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000761a:	8b 50 04             	mov    0x4(%eax),%edx
c000761d:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007620:	39 c2                	cmp    %eax,%edx
c0007622:	75 12                	jne    c0007636 <sys_free+0x172>
c0007624:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007627:	83 ec 08             	sub    $0x8,%esp
c000762a:	ff 75 f4             	pushl  -0xc(%ebp)
c000762d:	50                   	push   %eax
c000762e:	e8 ea fd ff ff       	call   c000741d <free_a_page>
c0007633:	83 c4 10             	add    $0x10,%esp
c0007636:	83 ec 0c             	sub    $0xc,%esp
c0007639:	ff 75 d8             	pushl  -0x28(%ebp)
c000763c:	e8 e9 04 00 00       	call   c0007b2a <intr_set_status>
c0007641:	83 c4 10             	add    $0x10,%esp
c0007644:	90                   	nop
c0007645:	c9                   	leave  
c0007646:	c3                   	ret    

c0007647 <init_memory_block_desc>:
c0007647:	55                   	push   %ebp
c0007648:	89 e5                	mov    %esp,%ebp
c000764a:	83 ec 18             	sub    $0x18,%esp
c000764d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007654:	e9 b2 00 00 00       	jmp    c000770b <init_memory_block_desc+0xc4>
c0007659:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000765d:	75 1b                	jne    c000767a <init_memory_block_desc+0x33>
c000765f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007662:	89 d0                	mov    %edx,%eax
c0007664:	01 c0                	add    %eax,%eax
c0007666:	01 d0                	add    %edx,%eax
c0007668:	c1 e0 03             	shl    $0x3,%eax
c000766b:	89 c2                	mov    %eax,%edx
c000766d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007670:	01 d0                	add    %edx,%eax
c0007672:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0007678:	eb 2e                	jmp    c00076a8 <init_memory_block_desc+0x61>
c000767a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000767d:	89 d0                	mov    %edx,%eax
c000767f:	01 c0                	add    %eax,%eax
c0007681:	01 d0                	add    %edx,%eax
c0007683:	c1 e0 03             	shl    $0x3,%eax
c0007686:	8d 50 e8             	lea    -0x18(%eax),%edx
c0007689:	8b 45 08             	mov    0x8(%ebp),%eax
c000768c:	01 d0                	add    %edx,%eax
c000768e:	8b 08                	mov    (%eax),%ecx
c0007690:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007693:	89 d0                	mov    %edx,%eax
c0007695:	01 c0                	add    %eax,%eax
c0007697:	01 d0                	add    %edx,%eax
c0007699:	c1 e0 03             	shl    $0x3,%eax
c000769c:	89 c2                	mov    %eax,%edx
c000769e:	8b 45 08             	mov    0x8(%ebp),%eax
c00076a1:	01 d0                	add    %edx,%eax
c00076a3:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c00076a6:	89 10                	mov    %edx,(%eax)
c00076a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076ab:	89 d0                	mov    %edx,%eax
c00076ad:	01 c0                	add    %eax,%eax
c00076af:	01 d0                	add    %edx,%eax
c00076b1:	c1 e0 03             	shl    $0x3,%eax
c00076b4:	89 c2                	mov    %eax,%edx
c00076b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00076b9:	01 d0                	add    %edx,%eax
c00076bb:	8b 00                	mov    (%eax),%eax
c00076bd:	89 c1                	mov    %eax,%ecx
c00076bf:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c00076c4:	ba 00 00 00 00       	mov    $0x0,%edx
c00076c9:	f7 f1                	div    %ecx
c00076cb:	89 c1                	mov    %eax,%ecx
c00076cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076d0:	89 d0                	mov    %edx,%eax
c00076d2:	01 c0                	add    %eax,%eax
c00076d4:	01 d0                	add    %edx,%eax
c00076d6:	c1 e0 03             	shl    $0x3,%eax
c00076d9:	89 c2                	mov    %eax,%edx
c00076db:	8b 45 08             	mov    0x8(%ebp),%eax
c00076de:	01 d0                	add    %edx,%eax
c00076e0:	89 ca                	mov    %ecx,%edx
c00076e2:	89 50 04             	mov    %edx,0x4(%eax)
c00076e5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00076e8:	89 d0                	mov    %edx,%eax
c00076ea:	01 c0                	add    %eax,%eax
c00076ec:	01 d0                	add    %edx,%eax
c00076ee:	c1 e0 03             	shl    $0x3,%eax
c00076f1:	89 c2                	mov    %eax,%edx
c00076f3:	8b 45 08             	mov    0x8(%ebp),%eax
c00076f6:	01 d0                	add    %edx,%eax
c00076f8:	83 c0 08             	add    $0x8,%eax
c00076fb:	83 ec 0c             	sub    $0xc,%esp
c00076fe:	50                   	push   %eax
c00076ff:	e8 11 38 00 00       	call   c000af15 <initDoubleLinkList>
c0007704:	83 c4 10             	add    $0x10,%esp
c0007707:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000770b:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000770f:	0f 8e 44 ff ff ff    	jle    c0007659 <init_memory_block_desc+0x12>
c0007715:	90                   	nop
c0007716:	c9                   	leave  
c0007717:	c3                   	ret    

c0007718 <init_memory2>:
c0007718:	55                   	push   %ebp
c0007719:	89 e5                	mov    %esp,%ebp
c000771b:	83 ec 38             	sub    $0x38,%esp
c000771e:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0007725:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c000772c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000772f:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007734:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007737:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000773c:	29 c2                	sub    %eax,%edx
c000773e:	89 d0                	mov    %edx,%eax
c0007740:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007743:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007746:	89 c2                	mov    %eax,%edx
c0007748:	c1 ea 1f             	shr    $0x1f,%edx
c000774b:	01 d0                	add    %edx,%eax
c000774d:	d1 f8                	sar    %eax
c000774f:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c0007754:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007759:	83 ec 0c             	sub    $0xc,%esp
c000775c:	50                   	push   %eax
c000775d:	e8 ec 07 00 00       	call   c0007f4e <disp_int>
c0007762:	83 c4 10             	add    $0x10,%esp
c0007765:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c000776a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000776d:	29 c2                	sub    %eax,%edx
c000776f:	89 d0                	mov    %edx,%eax
c0007771:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c0007776:	83 ec 0c             	sub    $0xc,%esp
c0007779:	68 30 b9 00 c0       	push   $0xc000b930
c000777e:	e8 09 9e ff ff       	call   c000158c <disp_str>
c0007783:	83 c4 10             	add    $0x10,%esp
c0007786:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c000778b:	83 ec 0c             	sub    $0xc,%esp
c000778e:	50                   	push   %eax
c000778f:	e8 ba 07 00 00       	call   c0007f4e <disp_int>
c0007794:	83 c4 10             	add    $0x10,%esp
c0007797:	83 ec 0c             	sub    $0xc,%esp
c000779a:	68 30 b9 00 c0       	push   $0xc000b930
c000779f:	e8 e8 9d ff ff       	call   c000158c <disp_str>
c00077a4:	83 c4 10             	add    $0x10,%esp
c00077a7:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00077ac:	05 ff 0f 00 00       	add    $0xfff,%eax
c00077b1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00077b7:	85 c0                	test   %eax,%eax
c00077b9:	0f 48 c2             	cmovs  %edx,%eax
c00077bc:	c1 f8 0c             	sar    $0xc,%eax
c00077bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00077c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077c5:	83 c0 07             	add    $0x7,%eax
c00077c8:	8d 50 07             	lea    0x7(%eax),%edx
c00077cb:	85 c0                	test   %eax,%eax
c00077cd:	0f 48 c2             	cmovs  %edx,%eax
c00077d0:	c1 f8 03             	sar    $0x3,%eax
c00077d3:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c00077d8:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00077dd:	2d 00 00 00 40       	sub    $0x40000000,%eax
c00077e2:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c00077e7:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00077ed:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00077f2:	83 ec 04             	sub    $0x4,%esp
c00077f5:	52                   	push   %edx
c00077f6:	6a 00                	push   $0x0
c00077f8:	50                   	push   %eax
c00077f9:	e8 4d 4a 00 00       	call   c000c24b <Memset>
c00077fe:	83 c4 10             	add    $0x10,%esp
c0007801:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0007806:	05 ff 0f 00 00       	add    $0xfff,%eax
c000780b:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007811:	85 c0                	test   %eax,%eax
c0007813:	0f 48 c2             	cmovs  %edx,%eax
c0007816:	c1 f8 0c             	sar    $0xc,%eax
c0007819:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000781c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000781f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007822:	ff 75 e8             	pushl  -0x18(%ebp)
c0007825:	6a 01                	push   $0x1
c0007827:	6a 00                	push   $0x0
c0007829:	68 ac 16 01 c0       	push   $0xc00116ac
c000782e:	e8 6d f3 ff ff       	call   c0006ba0 <set_bits>
c0007833:	83 c4 10             	add    $0x10,%esp
c0007836:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c000783b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007840:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007846:	85 c0                	test   %eax,%eax
c0007848:	0f 48 c2             	cmovs  %edx,%eax
c000784b:	c1 f8 0c             	sar    $0xc,%eax
c000784e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007851:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007854:	83 c0 07             	add    $0x7,%eax
c0007857:	8d 50 07             	lea    0x7(%eax),%edx
c000785a:	85 c0                	test   %eax,%eax
c000785c:	0f 48 c2             	cmovs  %edx,%eax
c000785f:	c1 f8 03             	sar    $0x3,%eax
c0007862:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007867:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c000786c:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007872:	01 d0                	add    %edx,%eax
c0007874:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007879:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c000787f:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007884:	83 ec 04             	sub    $0x4,%esp
c0007887:	52                   	push   %edx
c0007888:	6a 00                	push   $0x0
c000788a:	50                   	push   %eax
c000788b:	e8 bb 49 00 00       	call   c000c24b <Memset>
c0007890:	83 c4 10             	add    $0x10,%esp
c0007893:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007898:	05 ff 0f 00 00       	add    $0xfff,%eax
c000789d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00078a3:	85 c0                	test   %eax,%eax
c00078a5:	0f 48 c2             	cmovs  %edx,%eax
c00078a8:	c1 f8 0c             	sar    $0xc,%eax
c00078ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00078ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00078b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00078b4:	ff 75 e8             	pushl  -0x18(%ebp)
c00078b7:	6a 01                	push   $0x1
c00078b9:	ff 75 e0             	pushl  -0x20(%ebp)
c00078bc:	68 ac 16 01 c0       	push   $0xc00116ac
c00078c1:	e8 da f2 ff ff       	call   c0006ba0 <set_bits>
c00078c6:	83 c4 10             	add    $0x10,%esp
c00078c9:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c00078d0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00078d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078d9:	83 c0 07             	add    $0x7,%eax
c00078dc:	8d 50 07             	lea    0x7(%eax),%edx
c00078df:	85 c0                	test   %eax,%eax
c00078e1:	0f 48 c2             	cmovs  %edx,%eax
c00078e4:	c1 f8 03             	sar    $0x3,%eax
c00078e7:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c00078ec:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00078f1:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00078f7:	01 c2                	add    %eax,%edx
c00078f9:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c00078fe:	01 d0                	add    %edx,%eax
c0007900:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007905:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c000790b:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007910:	83 ec 04             	sub    $0x4,%esp
c0007913:	52                   	push   %edx
c0007914:	6a 00                	push   $0x0
c0007916:	50                   	push   %eax
c0007917:	e8 2f 49 00 00       	call   c000c24b <Memset>
c000791c:	83 c4 10             	add    $0x10,%esp
c000791f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007922:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007925:	01 d0                	add    %edx,%eax
c0007927:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000792a:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000792f:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007934:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000793a:	85 c0                	test   %eax,%eax
c000793c:	0f 48 c2             	cmovs  %edx,%eax
c000793f:	c1 f8 0c             	sar    $0xc,%eax
c0007942:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007945:	ff 75 e8             	pushl  -0x18(%ebp)
c0007948:	6a 01                	push   $0x1
c000794a:	ff 75 e0             	pushl  -0x20(%ebp)
c000794d:	68 ac 16 01 c0       	push   $0xc00116ac
c0007952:	e8 49 f2 ff ff       	call   c0006ba0 <set_bits>
c0007957:	83 c4 10             	add    $0x10,%esp
c000795a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000795d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007960:	01 d0                	add    %edx,%eax
c0007962:	c1 e0 0c             	shl    $0xc,%eax
c0007965:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c000796a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000796d:	83 c0 02             	add    $0x2,%eax
c0007970:	c1 e0 0c             	shl    $0xc,%eax
c0007973:	89 c2                	mov    %eax,%edx
c0007975:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007978:	01 d0                	add    %edx,%eax
c000797a:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c000797f:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007986:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007989:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000798c:	90                   	nop
c000798d:	c9                   	leave  
c000798e:	c3                   	ret    

c000798f <init_memory>:
c000798f:	55                   	push   %ebp
c0007990:	89 e5                	mov    %esp,%ebp
c0007992:	83 ec 38             	sub    $0x38,%esp
c0007995:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c000799c:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c00079a3:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c00079aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00079ad:	05 00 00 10 00       	add    $0x100000,%eax
c00079b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00079b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00079b8:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00079bb:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00079c1:	85 c0                	test   %eax,%eax
c00079c3:	0f 48 c2             	cmovs  %edx,%eax
c00079c6:	c1 f8 0c             	sar    $0xc,%eax
c00079c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00079cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00079cf:	89 c2                	mov    %eax,%edx
c00079d1:	c1 ea 1f             	shr    $0x1f,%edx
c00079d4:	01 d0                	add    %edx,%eax
c00079d6:	d1 f8                	sar    %eax
c00079d8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00079db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00079de:	2b 45 e0             	sub    -0x20(%ebp),%eax
c00079e1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00079e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00079e7:	8d 50 07             	lea    0x7(%eax),%edx
c00079ea:	85 c0                	test   %eax,%eax
c00079ec:	0f 48 c2             	cmovs  %edx,%eax
c00079ef:	c1 f8 03             	sar    $0x3,%eax
c00079f2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00079f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00079f8:	8d 50 07             	lea    0x7(%eax),%edx
c00079fb:	85 c0                	test   %eax,%eax
c00079fd:	0f 48 c2             	cmovs  %edx,%eax
c0007a00:	c1 f8 03             	sar    $0x3,%eax
c0007a03:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007a06:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a09:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007a0e:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007a13:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007a16:	c1 e2 0c             	shl    $0xc,%edx
c0007a19:	01 d0                	add    %edx,%eax
c0007a1b:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c0007a20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007a23:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007a28:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a2b:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007a30:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007a35:	83 ec 04             	sub    $0x4,%esp
c0007a38:	ff 75 d8             	pushl  -0x28(%ebp)
c0007a3b:	6a 00                	push   $0x0
c0007a3d:	50                   	push   %eax
c0007a3e:	e8 08 48 00 00       	call   c000c24b <Memset>
c0007a43:	83 c4 10             	add    $0x10,%esp
c0007a46:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007a49:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a4c:	01 d0                	add    %edx,%eax
c0007a4e:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007a53:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007a56:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007a5b:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007a60:	83 ec 04             	sub    $0x4,%esp
c0007a63:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007a66:	6a 00                	push   $0x0
c0007a68:	50                   	push   %eax
c0007a69:	e8 dd 47 00 00       	call   c000c24b <Memset>
c0007a6e:	83 c4 10             	add    $0x10,%esp
c0007a71:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a74:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007a79:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007a7c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007a7f:	01 c2                	add    %eax,%edx
c0007a81:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007a84:	01 d0                	add    %edx,%eax
c0007a86:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007a8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007a8e:	05 00 00 10 00       	add    $0x100000,%eax
c0007a93:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007a98:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007a9d:	83 ec 04             	sub    $0x4,%esp
c0007aa0:	ff 75 d8             	pushl  -0x28(%ebp)
c0007aa3:	6a 00                	push   $0x0
c0007aa5:	50                   	push   %eax
c0007aa6:	e8 a0 47 00 00       	call   c000c24b <Memset>
c0007aab:	83 c4 10             	add    $0x10,%esp
c0007aae:	83 ec 04             	sub    $0x4,%esp
c0007ab1:	68 f0 00 00 00       	push   $0xf0
c0007ab6:	6a 00                	push   $0x0
c0007ab8:	68 a0 47 08 c0       	push   $0xc00847a0
c0007abd:	e8 89 47 00 00       	call   c000c24b <Memset>
c0007ac2:	83 c4 10             	add    $0x10,%esp
c0007ac5:	83 ec 0c             	sub    $0xc,%esp
c0007ac8:	68 a0 47 08 c0       	push   $0xc00847a0
c0007acd:	e8 75 fb ff ff       	call   c0007647 <init_memory_block_desc>
c0007ad2:	83 c4 10             	add    $0x10,%esp
c0007ad5:	90                   	nop
c0007ad6:	c9                   	leave  
c0007ad7:	c3                   	ret    

c0007ad8 <intr_enable>:
c0007ad8:	55                   	push   %ebp
c0007ad9:	89 e5                	mov    %esp,%ebp
c0007adb:	83 ec 18             	sub    $0x18,%esp
c0007ade:	e8 65 00 00 00       	call   c0007b48 <intr_get_status>
c0007ae3:	83 f8 01             	cmp    $0x1,%eax
c0007ae6:	75 0c                	jne    c0007af4 <intr_enable+0x1c>
c0007ae8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007aef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007af2:	eb 0b                	jmp    c0007aff <intr_enable+0x27>
c0007af4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007afb:	fb                   	sti    
c0007afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007aff:	c9                   	leave  
c0007b00:	c3                   	ret    

c0007b01 <intr_disable>:
c0007b01:	55                   	push   %ebp
c0007b02:	89 e5                	mov    %esp,%ebp
c0007b04:	83 ec 18             	sub    $0x18,%esp
c0007b07:	e8 3c 00 00 00       	call   c0007b48 <intr_get_status>
c0007b0c:	83 f8 01             	cmp    $0x1,%eax
c0007b0f:	75 0d                	jne    c0007b1e <intr_disable+0x1d>
c0007b11:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007b18:	fa                   	cli    
c0007b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b1c:	eb 0a                	jmp    c0007b28 <intr_disable+0x27>
c0007b1e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007b25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b28:	c9                   	leave  
c0007b29:	c3                   	ret    

c0007b2a <intr_set_status>:
c0007b2a:	55                   	push   %ebp
c0007b2b:	89 e5                	mov    %esp,%ebp
c0007b2d:	83 ec 08             	sub    $0x8,%esp
c0007b30:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b33:	83 e0 01             	and    $0x1,%eax
c0007b36:	85 c0                	test   %eax,%eax
c0007b38:	74 07                	je     c0007b41 <intr_set_status+0x17>
c0007b3a:	e8 99 ff ff ff       	call   c0007ad8 <intr_enable>
c0007b3f:	eb 05                	jmp    c0007b46 <intr_set_status+0x1c>
c0007b41:	e8 bb ff ff ff       	call   c0007b01 <intr_disable>
c0007b46:	c9                   	leave  
c0007b47:	c3                   	ret    

c0007b48 <intr_get_status>:
c0007b48:	55                   	push   %ebp
c0007b49:	89 e5                	mov    %esp,%ebp
c0007b4b:	83 ec 10             	sub    $0x10,%esp
c0007b4e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007b55:	9c                   	pushf  
c0007b56:	58                   	pop    %eax
c0007b57:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007b5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007b5d:	c1 e8 09             	shr    $0x9,%eax
c0007b60:	83 e0 01             	and    $0x1,%eax
c0007b63:	c9                   	leave  
c0007b64:	c3                   	ret    

c0007b65 <Memcpy>:
c0007b65:	55                   	push   %ebp
c0007b66:	89 e5                	mov    %esp,%ebp
c0007b68:	83 ec 18             	sub    $0x18,%esp
c0007b6b:	e8 91 ff ff ff       	call   c0007b01 <intr_disable>
c0007b70:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007b73:	83 ec 04             	sub    $0x4,%esp
c0007b76:	ff 75 10             	pushl  0x10(%ebp)
c0007b79:	ff 75 0c             	pushl  0xc(%ebp)
c0007b7c:	ff 75 08             	pushl  0x8(%ebp)
c0007b7f:	e8 99 46 00 00       	call   c000c21d <Memcpy2>
c0007b84:	83 c4 10             	add    $0x10,%esp
c0007b87:	83 ec 0c             	sub    $0xc,%esp
c0007b8a:	ff 75 f4             	pushl  -0xc(%ebp)
c0007b8d:	e8 98 ff ff ff       	call   c0007b2a <intr_set_status>
c0007b92:	83 c4 10             	add    $0x10,%esp
c0007b95:	90                   	nop
c0007b96:	c9                   	leave  
c0007b97:	c3                   	ret    

c0007b98 <untar>:
c0007b98:	55                   	push   %ebp
c0007b99:	89 e5                	mov    %esp,%ebp
c0007b9b:	81 ec 48 06 00 00    	sub    $0x648,%esp
c0007ba1:	83 ec 08             	sub    $0x8,%esp
c0007ba4:	6a 00                	push   $0x0
c0007ba6:	ff 75 08             	pushl  0x8(%ebp)
c0007ba9:	e8 ea e2 ff ff       	call   c0005e98 <open>
c0007bae:	83 c4 10             	add    $0x10,%esp
c0007bb1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007bb4:	83 ec 0c             	sub    $0xc,%esp
c0007bb7:	68 40 b9 00 c0       	push   $0xc000b940
c0007bbc:	e8 2c 1c 00 00       	call   c00097ed <Printf>
c0007bc1:	83 c4 10             	add    $0x10,%esp
c0007bc4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007bcb:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0007bd2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007bd9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007be0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007be7:	e9 5e 02 00 00       	jmp    c0007e4a <untar+0x2b2>
c0007bec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007bf0:	7e 58                	jle    c0007c4a <untar+0xb2>
c0007bf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007bf5:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007bfa:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007c00:	85 c0                	test   %eax,%eax
c0007c02:	0f 48 c2             	cmovs  %edx,%eax
c0007c05:	c1 f8 09             	sar    $0x9,%eax
c0007c08:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007c0b:	83 ec 04             	sub    $0x4,%esp
c0007c0e:	68 00 02 00 00       	push   $0x200
c0007c13:	6a 00                	push   $0x0
c0007c15:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c1b:	50                   	push   %eax
c0007c1c:	e8 2a 46 00 00       	call   c000c24b <Memset>
c0007c21:	83 c4 10             	add    $0x10,%esp
c0007c24:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007c27:	c1 e0 09             	shl    $0x9,%eax
c0007c2a:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007c2d:	83 ec 04             	sub    $0x4,%esp
c0007c30:	50                   	push   %eax
c0007c31:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c37:	50                   	push   %eax
c0007c38:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c3b:	e8 dd e2 ff ff       	call   c0005f1d <read>
c0007c40:	83 c4 10             	add    $0x10,%esp
c0007c43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c4a:	83 ec 04             	sub    $0x4,%esp
c0007c4d:	68 00 02 00 00       	push   $0x200
c0007c52:	6a 00                	push   $0x0
c0007c54:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c5a:	50                   	push   %eax
c0007c5b:	e8 eb 45 00 00       	call   c000c24b <Memset>
c0007c60:	83 c4 10             	add    $0x10,%esp
c0007c63:	83 ec 04             	sub    $0x4,%esp
c0007c66:	68 00 02 00 00       	push   $0x200
c0007c6b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007c71:	50                   	push   %eax
c0007c72:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007c75:	e8 a3 e2 ff ff       	call   c0005f1d <read>
c0007c7a:	83 c4 10             	add    $0x10,%esp
c0007c7d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007c80:	83 ec 0c             	sub    $0xc,%esp
c0007c83:	68 52 b9 00 c0       	push   $0xc000b952
c0007c88:	e8 60 1b 00 00       	call   c00097ed <Printf>
c0007c8d:	83 c4 10             	add    $0x10,%esp
c0007c90:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007c94:	0f 84 bc 01 00 00    	je     c0007e56 <untar+0x2be>
c0007c9a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007c9d:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007ca0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007ca7:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007cad:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007cb0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007cb3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007cb6:	83 ec 08             	sub    $0x8,%esp
c0007cb9:	6a 07                	push   $0x7
c0007cbb:	ff 75 cc             	pushl  -0x34(%ebp)
c0007cbe:	e8 d5 e1 ff ff       	call   c0005e98 <open>
c0007cc3:	83 c4 10             	add    $0x10,%esp
c0007cc6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007cc9:	83 ec 0c             	sub    $0xc,%esp
c0007ccc:	68 64 b9 00 c0       	push   $0xc000b964
c0007cd1:	e8 17 1b 00 00       	call   c00097ed <Printf>
c0007cd6:	83 c4 10             	add    $0x10,%esp
c0007cd9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007ce0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007ce3:	83 c0 7c             	add    $0x7c,%eax
c0007ce6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007ce9:	83 ec 0c             	sub    $0xc,%esp
c0007cec:	ff 75 cc             	pushl  -0x34(%ebp)
c0007cef:	e8 90 45 00 00       	call   c000c284 <Strlen>
c0007cf4:	83 c4 10             	add    $0x10,%esp
c0007cf7:	85 c0                	test   %eax,%eax
c0007cf9:	75 28                	jne    c0007d23 <untar+0x18b>
c0007cfb:	83 ec 0c             	sub    $0xc,%esp
c0007cfe:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007d01:	e8 7e 45 00 00       	call   c000c284 <Strlen>
c0007d06:	83 c4 10             	add    $0x10,%esp
c0007d09:	85 c0                	test   %eax,%eax
c0007d0b:	75 16                	jne    c0007d23 <untar+0x18b>
c0007d0d:	83 ec 0c             	sub    $0xc,%esp
c0007d10:	68 76 b9 00 c0       	push   $0xc000b976
c0007d15:	e8 d3 1a 00 00       	call   c00097ed <Printf>
c0007d1a:	83 c4 10             	add    $0x10,%esp
c0007d1d:	90                   	nop
c0007d1e:	e9 34 01 00 00       	jmp    c0007e57 <untar+0x2bf>
c0007d23:	83 ec 0c             	sub    $0xc,%esp
c0007d26:	68 7d b9 00 c0       	push   $0xc000b97d
c0007d2b:	e8 bd 1a 00 00       	call   c00097ed <Printf>
c0007d30:	83 c4 10             	add    $0x10,%esp
c0007d33:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007d36:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007d39:	eb 1f                	jmp    c0007d5a <untar+0x1c2>
c0007d3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d3e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007d45:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007d48:	0f b6 00             	movzbl (%eax),%eax
c0007d4b:	0f be c0             	movsbl %al,%eax
c0007d4e:	83 e8 30             	sub    $0x30,%eax
c0007d51:	01 d0                	add    %edx,%eax
c0007d53:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007d56:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007d5a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007d5d:	0f b6 00             	movzbl (%eax),%eax
c0007d60:	84 c0                	test   %al,%al
c0007d62:	75 d7                	jne    c0007d3b <untar+0x1a3>
c0007d64:	83 ec 0c             	sub    $0xc,%esp
c0007d67:	68 8b b9 00 c0       	push   $0xc000b98b
c0007d6c:	e8 7c 1a 00 00       	call   c00097ed <Printf>
c0007d71:	83 c4 10             	add    $0x10,%esp
c0007d74:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007d77:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007d7a:	c7 45 bc 00 04 00 00 	movl   $0x400,-0x44(%ebp)
c0007d81:	83 ec 08             	sub    $0x8,%esp
c0007d84:	ff 75 c0             	pushl  -0x40(%ebp)
c0007d87:	68 99 b9 00 c0       	push   $0xc000b999
c0007d8c:	e8 5c 1a 00 00       	call   c00097ed <Printf>
c0007d91:	83 c4 10             	add    $0x10,%esp
c0007d94:	83 ec 08             	sub    $0x8,%esp
c0007d97:	ff 75 c0             	pushl  -0x40(%ebp)
c0007d9a:	68 ab b9 00 c0       	push   $0xc000b9ab
c0007d9f:	e8 49 1a 00 00       	call   c00097ed <Printf>
c0007da4:	83 c4 10             	add    $0x10,%esp
c0007da7:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007daa:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0007dad:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0007db1:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007db4:	83 ec 04             	sub    $0x4,%esp
c0007db7:	ff 75 b8             	pushl  -0x48(%ebp)
c0007dba:	8d 85 b8 f9 ff ff    	lea    -0x648(%ebp),%eax
c0007dc0:	50                   	push   %eax
c0007dc1:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007dc4:	e8 54 e1 ff ff       	call   c0005f1d <read>
c0007dc9:	83 c4 10             	add    $0x10,%esp
c0007dcc:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007dcf:	83 ec 04             	sub    $0x4,%esp
c0007dd2:	ff 75 b8             	pushl  -0x48(%ebp)
c0007dd5:	8d 85 b8 f9 ff ff    	lea    -0x648(%ebp),%eax
c0007ddb:	50                   	push   %eax
c0007ddc:	ff 75 c8             	pushl  -0x38(%ebp)
c0007ddf:	e8 ad e1 ff ff       	call   c0005f91 <write>
c0007de4:	83 c4 10             	add    $0x10,%esp
c0007de7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007dea:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0007ded:	7d 02                	jge    c0007df1 <untar+0x259>
c0007def:	eb b6                	jmp    c0007da7 <untar+0x20f>
c0007df1:	90                   	nop
c0007df2:	83 ec 08             	sub    $0x8,%esp
c0007df5:	ff 75 f4             	pushl  -0xc(%ebp)
c0007df8:	68 bd b9 00 c0       	push   $0xc000b9bd
c0007dfd:	e8 eb 19 00 00       	call   c00097ed <Printf>
c0007e02:	83 c4 10             	add    $0x10,%esp
c0007e05:	83 ec 08             	sub    $0x8,%esp
c0007e08:	ff 75 c0             	pushl  -0x40(%ebp)
c0007e0b:	68 cf b9 00 c0       	push   $0xc000b9cf
c0007e10:	e8 d8 19 00 00       	call   c00097ed <Printf>
c0007e15:	83 c4 10             	add    $0x10,%esp
c0007e18:	83 ec 0c             	sub    $0xc,%esp
c0007e1b:	68 e0 b9 00 c0       	push   $0xc000b9e0
c0007e20:	e8 c8 19 00 00       	call   c00097ed <Printf>
c0007e25:	83 c4 10             	add    $0x10,%esp
c0007e28:	83 ec 0c             	sub    $0xc,%esp
c0007e2b:	ff 75 c8             	pushl  -0x38(%ebp)
c0007e2e:	e8 d2 e1 ff ff       	call   c0006005 <close>
c0007e33:	83 c4 10             	add    $0x10,%esp
c0007e36:	83 ec 0c             	sub    $0xc,%esp
c0007e39:	68 ee b9 00 c0       	push   $0xc000b9ee
c0007e3e:	e8 aa 19 00 00       	call   c00097ed <Printf>
c0007e43:	83 c4 10             	add    $0x10,%esp
c0007e46:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007e4a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007e4e:	0f 8f 98 fd ff ff    	jg     c0007bec <untar+0x54>
c0007e54:	eb 01                	jmp    c0007e57 <untar+0x2bf>
c0007e56:	90                   	nop
c0007e57:	83 ec 0c             	sub    $0xc,%esp
c0007e5a:	68 fb b9 00 c0       	push   $0xc000b9fb
c0007e5f:	e8 89 19 00 00       	call   c00097ed <Printf>
c0007e64:	83 c4 10             	add    $0x10,%esp
c0007e67:	83 ec 0c             	sub    $0xc,%esp
c0007e6a:	68 0d ba 00 c0       	push   $0xc000ba0d
c0007e6f:	e8 79 19 00 00       	call   c00097ed <Printf>
c0007e74:	83 c4 10             	add    $0x10,%esp
c0007e77:	83 ec 0c             	sub    $0xc,%esp
c0007e7a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007e7d:	e8 83 e1 ff ff       	call   c0006005 <close>
c0007e82:	83 c4 10             	add    $0x10,%esp
c0007e85:	83 ec 0c             	sub    $0xc,%esp
c0007e88:	68 1d ba 00 c0       	push   $0xc000ba1d
c0007e8d:	e8 5b 19 00 00       	call   c00097ed <Printf>
c0007e92:	83 c4 10             	add    $0x10,%esp
c0007e95:	83 ec 0c             	sub    $0xc,%esp
c0007e98:	68 30 ba 00 c0       	push   $0xc000ba30
c0007e9d:	e8 4b 19 00 00       	call   c00097ed <Printf>
c0007ea2:	83 c4 10             	add    $0x10,%esp
c0007ea5:	90                   	nop
c0007ea6:	c9                   	leave  
c0007ea7:	c3                   	ret    

c0007ea8 <atoi>:
c0007ea8:	55                   	push   %ebp
c0007ea9:	89 e5                	mov    %esp,%ebp
c0007eab:	83 ec 10             	sub    $0x10,%esp
c0007eae:	8b 45 08             	mov    0x8(%ebp),%eax
c0007eb1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007eb4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007eb7:	8d 50 01             	lea    0x1(%eax),%edx
c0007eba:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007ebd:	c6 00 30             	movb   $0x30,(%eax)
c0007ec0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ec3:	8d 50 01             	lea    0x1(%eax),%edx
c0007ec6:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007ec9:	c6 00 78             	movb   $0x78,(%eax)
c0007ecc:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0007ed0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007ed4:	75 0e                	jne    c0007ee4 <atoi+0x3c>
c0007ed6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007ed9:	8d 50 01             	lea    0x1(%eax),%edx
c0007edc:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007edf:	c6 00 30             	movb   $0x30,(%eax)
c0007ee2:	eb 61                	jmp    c0007f45 <atoi+0x9d>
c0007ee4:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c0007eeb:	eb 52                	jmp    c0007f3f <atoi+0x97>
c0007eed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ef0:	8b 55 0c             	mov    0xc(%ebp),%edx
c0007ef3:	89 c1                	mov    %eax,%ecx
c0007ef5:	d3 fa                	sar    %cl,%edx
c0007ef7:	89 d0                	mov    %edx,%eax
c0007ef9:	83 e0 0f             	and    $0xf,%eax
c0007efc:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007eff:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007f03:	75 06                	jne    c0007f0b <atoi+0x63>
c0007f05:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007f09:	74 2f                	je     c0007f3a <atoi+0x92>
c0007f0b:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007f0f:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007f13:	83 c0 30             	add    $0x30,%eax
c0007f16:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f19:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007f1d:	7e 0a                	jle    c0007f29 <atoi+0x81>
c0007f1f:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007f23:	83 c0 07             	add    $0x7,%eax
c0007f26:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007f29:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007f2c:	8d 50 01             	lea    0x1(%eax),%edx
c0007f2f:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007f32:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007f36:	88 10                	mov    %dl,(%eax)
c0007f38:	eb 01                	jmp    c0007f3b <atoi+0x93>
c0007f3a:	90                   	nop
c0007f3b:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007f3f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007f43:	79 a8                	jns    c0007eed <atoi+0x45>
c0007f45:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007f48:	c6 00 00             	movb   $0x0,(%eax)
c0007f4b:	90                   	nop
c0007f4c:	c9                   	leave  
c0007f4d:	c3                   	ret    

c0007f4e <disp_int>:
c0007f4e:	55                   	push   %ebp
c0007f4f:	89 e5                	mov    %esp,%ebp
c0007f51:	83 ec 18             	sub    $0x18,%esp
c0007f54:	ff 75 08             	pushl  0x8(%ebp)
c0007f57:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f5a:	50                   	push   %eax
c0007f5b:	e8 48 ff ff ff       	call   c0007ea8 <atoi>
c0007f60:	83 c4 08             	add    $0x8,%esp
c0007f63:	83 ec 08             	sub    $0x8,%esp
c0007f66:	6a 0b                	push   $0xb
c0007f68:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007f6b:	50                   	push   %eax
c0007f6c:	e8 56 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007f71:	83 c4 10             	add    $0x10,%esp
c0007f74:	90                   	nop
c0007f75:	c9                   	leave  
c0007f76:	c3                   	ret    

c0007f77 <do_page_fault>:
c0007f77:	55                   	push   %ebp
c0007f78:	89 e5                	mov    %esp,%ebp
c0007f7a:	83 ec 28             	sub    $0x28,%esp
c0007f7d:	0f 20 d0             	mov    %cr2,%eax
c0007f80:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007f83:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0007f8a:	00 00 00 
c0007f8d:	83 ec 0c             	sub    $0xc,%esp
c0007f90:	68 3b ba 00 c0       	push   $0xc000ba3b
c0007f95:	e8 f2 95 ff ff       	call   c000158c <disp_str>
c0007f9a:	83 c4 10             	add    $0x10,%esp
c0007f9d:	83 ec 0c             	sub    $0xc,%esp
c0007fa0:	68 4a ba 00 c0       	push   $0xc000ba4a
c0007fa5:	e8 e2 95 ff ff       	call   c000158c <disp_str>
c0007faa:	83 c4 10             	add    $0x10,%esp
c0007fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007fb0:	83 ec 0c             	sub    $0xc,%esp
c0007fb3:	50                   	push   %eax
c0007fb4:	e8 95 ff ff ff       	call   c0007f4e <disp_int>
c0007fb9:	83 c4 10             	add    $0x10,%esp
c0007fbc:	83 ec 0c             	sub    $0xc,%esp
c0007fbf:	68 4f ba 00 c0       	push   $0xc000ba4f
c0007fc4:	e8 c3 95 ff ff       	call   c000158c <disp_str>
c0007fc9:	83 c4 10             	add    $0x10,%esp
c0007fcc:	83 ec 0c             	sub    $0xc,%esp
c0007fcf:	ff 75 f4             	pushl  -0xc(%ebp)
c0007fd2:	e8 5d ee ff ff       	call   c0006e34 <ptr_pde>
c0007fd7:	83 c4 10             	add    $0x10,%esp
c0007fda:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007fdd:	83 ec 0c             	sub    $0xc,%esp
c0007fe0:	ff 75 f4             	pushl  -0xc(%ebp)
c0007fe3:	e8 5f ee ff ff       	call   c0006e47 <ptr_pte>
c0007fe8:	83 c4 10             	add    $0x10,%esp
c0007feb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007fee:	83 ec 0c             	sub    $0xc,%esp
c0007ff1:	68 51 ba 00 c0       	push   $0xc000ba51
c0007ff6:	e8 91 95 ff ff       	call   c000158c <disp_str>
c0007ffb:	83 c4 10             	add    $0x10,%esp
c0007ffe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008001:	83 ec 0c             	sub    $0xc,%esp
c0008004:	50                   	push   %eax
c0008005:	e8 44 ff ff ff       	call   c0007f4e <disp_int>
c000800a:	83 c4 10             	add    $0x10,%esp
c000800d:	83 ec 0c             	sub    $0xc,%esp
c0008010:	68 56 ba 00 c0       	push   $0xc000ba56
c0008015:	e8 72 95 ff ff       	call   c000158c <disp_str>
c000801a:	83 c4 10             	add    $0x10,%esp
c000801d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008020:	8b 00                	mov    (%eax),%eax
c0008022:	83 ec 0c             	sub    $0xc,%esp
c0008025:	50                   	push   %eax
c0008026:	e8 23 ff ff ff       	call   c0007f4e <disp_int>
c000802b:	83 c4 10             	add    $0x10,%esp
c000802e:	83 ec 0c             	sub    $0xc,%esp
c0008031:	68 4f ba 00 c0       	push   $0xc000ba4f
c0008036:	e8 51 95 ff ff       	call   c000158c <disp_str>
c000803b:	83 c4 10             	add    $0x10,%esp
c000803e:	83 ec 0c             	sub    $0xc,%esp
c0008041:	68 5f ba 00 c0       	push   $0xc000ba5f
c0008046:	e8 41 95 ff ff       	call   c000158c <disp_str>
c000804b:	83 c4 10             	add    $0x10,%esp
c000804e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008051:	83 ec 0c             	sub    $0xc,%esp
c0008054:	50                   	push   %eax
c0008055:	e8 f4 fe ff ff       	call   c0007f4e <disp_int>
c000805a:	83 c4 10             	add    $0x10,%esp
c000805d:	83 ec 0c             	sub    $0xc,%esp
c0008060:	68 64 ba 00 c0       	push   $0xc000ba64
c0008065:	e8 22 95 ff ff       	call   c000158c <disp_str>
c000806a:	83 c4 10             	add    $0x10,%esp
c000806d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008070:	8b 00                	mov    (%eax),%eax
c0008072:	83 ec 0c             	sub    $0xc,%esp
c0008075:	50                   	push   %eax
c0008076:	e8 d3 fe ff ff       	call   c0007f4e <disp_int>
c000807b:	83 c4 10             	add    $0x10,%esp
c000807e:	83 ec 0c             	sub    $0xc,%esp
c0008081:	68 4f ba 00 c0       	push   $0xc000ba4f
c0008086:	e8 01 95 ff ff       	call   c000158c <disp_str>
c000808b:	83 c4 10             	add    $0x10,%esp
c000808e:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0008095:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008098:	8b 00                	mov    (%eax),%eax
c000809a:	83 e0 01             	and    $0x1,%eax
c000809d:	85 c0                	test   %eax,%eax
c000809f:	74 09                	je     c00080aa <do_page_fault+0x133>
c00080a1:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c00080a8:	eb 07                	jmp    c00080b1 <do_page_fault+0x13a>
c00080aa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00080b1:	90                   	nop
c00080b2:	c9                   	leave  
c00080b3:	c3                   	ret    

c00080b4 <exception_handler>:
c00080b4:	55                   	push   %ebp
c00080b5:	89 e5                	mov    %esp,%ebp
c00080b7:	57                   	push   %edi
c00080b8:	56                   	push   %esi
c00080b9:	53                   	push   %ebx
c00080ba:	83 ec 6c             	sub    $0x6c,%esp
c00080bd:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00080c0:	bb e0 bc 00 c0       	mov    $0xc000bce0,%ebx
c00080c5:	ba 13 00 00 00       	mov    $0x13,%edx
c00080ca:	89 c7                	mov    %eax,%edi
c00080cc:	89 de                	mov    %ebx,%esi
c00080ce:	89 d1                	mov    %edx,%ecx
c00080d0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00080d2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00080d9:	eb 04                	jmp    c00080df <exception_handler+0x2b>
c00080db:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00080df:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c00080e6:	7e f3                	jle    c00080db <exception_handler+0x27>
c00080e8:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00080ef:	00 00 00 
c00080f2:	83 ec 0c             	sub    $0xc,%esp
c00080f5:	68 6d ba 00 c0       	push   $0xc000ba6d
c00080fa:	e8 8d 94 ff ff       	call   c000158c <disp_str>
c00080ff:	83 c4 10             	add    $0x10,%esp
c0008102:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0008109:	8b 45 08             	mov    0x8(%ebp),%eax
c000810c:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0008110:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008113:	83 ec 0c             	sub    $0xc,%esp
c0008116:	ff 75 dc             	pushl  -0x24(%ebp)
c0008119:	e8 6e 94 ff ff       	call   c000158c <disp_str>
c000811e:	83 c4 10             	add    $0x10,%esp
c0008121:	83 ec 0c             	sub    $0xc,%esp
c0008124:	68 7b ba 00 c0       	push   $0xc000ba7b
c0008129:	e8 5e 94 ff ff       	call   c000158c <disp_str>
c000812e:	83 c4 10             	add    $0x10,%esp
c0008131:	83 ec 0c             	sub    $0xc,%esp
c0008134:	68 7e ba 00 c0       	push   $0xc000ba7e
c0008139:	e8 4e 94 ff ff       	call   c000158c <disp_str>
c000813e:	83 c4 10             	add    $0x10,%esp
c0008141:	8b 45 08             	mov    0x8(%ebp),%eax
c0008144:	83 ec 0c             	sub    $0xc,%esp
c0008147:	50                   	push   %eax
c0008148:	e8 01 fe ff ff       	call   c0007f4e <disp_int>
c000814d:	83 c4 10             	add    $0x10,%esp
c0008150:	83 ec 0c             	sub    $0xc,%esp
c0008153:	68 7b ba 00 c0       	push   $0xc000ba7b
c0008158:	e8 2f 94 ff ff       	call   c000158c <disp_str>
c000815d:	83 c4 10             	add    $0x10,%esp
c0008160:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008164:	74 2f                	je     c0008195 <exception_handler+0xe1>
c0008166:	83 ec 0c             	sub    $0xc,%esp
c0008169:	68 86 ba 00 c0       	push   $0xc000ba86
c000816e:	e8 19 94 ff ff       	call   c000158c <disp_str>
c0008173:	83 c4 10             	add    $0x10,%esp
c0008176:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008179:	83 ec 0c             	sub    $0xc,%esp
c000817c:	50                   	push   %eax
c000817d:	e8 cc fd ff ff       	call   c0007f4e <disp_int>
c0008182:	83 c4 10             	add    $0x10,%esp
c0008185:	83 ec 0c             	sub    $0xc,%esp
c0008188:	68 7b ba 00 c0       	push   $0xc000ba7b
c000818d:	e8 fa 93 ff ff       	call   c000158c <disp_str>
c0008192:	83 c4 10             	add    $0x10,%esp
c0008195:	83 ec 0c             	sub    $0xc,%esp
c0008198:	68 90 ba 00 c0       	push   $0xc000ba90
c000819d:	e8 ea 93 ff ff       	call   c000158c <disp_str>
c00081a2:	83 c4 10             	add    $0x10,%esp
c00081a5:	83 ec 0c             	sub    $0xc,%esp
c00081a8:	ff 75 14             	pushl  0x14(%ebp)
c00081ab:	e8 9e fd ff ff       	call   c0007f4e <disp_int>
c00081b0:	83 c4 10             	add    $0x10,%esp
c00081b3:	83 ec 0c             	sub    $0xc,%esp
c00081b6:	68 7b ba 00 c0       	push   $0xc000ba7b
c00081bb:	e8 cc 93 ff ff       	call   c000158c <disp_str>
c00081c0:	83 c4 10             	add    $0x10,%esp
c00081c3:	83 ec 0c             	sub    $0xc,%esp
c00081c6:	68 94 ba 00 c0       	push   $0xc000ba94
c00081cb:	e8 bc 93 ff ff       	call   c000158c <disp_str>
c00081d0:	83 c4 10             	add    $0x10,%esp
c00081d3:	8b 45 10             	mov    0x10(%ebp),%eax
c00081d6:	83 ec 0c             	sub    $0xc,%esp
c00081d9:	50                   	push   %eax
c00081da:	e8 6f fd ff ff       	call   c0007f4e <disp_int>
c00081df:	83 c4 10             	add    $0x10,%esp
c00081e2:	83 ec 0c             	sub    $0xc,%esp
c00081e5:	68 7b ba 00 c0       	push   $0xc000ba7b
c00081ea:	e8 9d 93 ff ff       	call   c000158c <disp_str>
c00081ef:	83 c4 10             	add    $0x10,%esp
c00081f2:	83 ec 0c             	sub    $0xc,%esp
c00081f5:	68 99 ba 00 c0       	push   $0xc000ba99
c00081fa:	e8 8d 93 ff ff       	call   c000158c <disp_str>
c00081ff:	83 c4 10             	add    $0x10,%esp
c0008202:	83 ec 0c             	sub    $0xc,%esp
c0008205:	ff 75 18             	pushl  0x18(%ebp)
c0008208:	e8 41 fd ff ff       	call   c0007f4e <disp_int>
c000820d:	83 c4 10             	add    $0x10,%esp
c0008210:	83 ec 0c             	sub    $0xc,%esp
c0008213:	68 7b ba 00 c0       	push   $0xc000ba7b
c0008218:	e8 6f 93 ff ff       	call   c000158c <disp_str>
c000821d:	83 c4 10             	add    $0x10,%esp
c0008220:	83 ec 0c             	sub    $0xc,%esp
c0008223:	68 a4 ba 00 c0       	push   $0xc000baa4
c0008228:	e8 5f 93 ff ff       	call   c000158c <disp_str>
c000822d:	83 c4 10             	add    $0x10,%esp
c0008230:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0008234:	75 45                	jne    c000827b <exception_handler+0x1c7>
c0008236:	0f 20 d0             	mov    %cr2,%eax
c0008239:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000823c:	83 ec 0c             	sub    $0xc,%esp
c000823f:	68 c3 ba 00 c0       	push   $0xc000bac3
c0008244:	e8 43 93 ff ff       	call   c000158c <disp_str>
c0008249:	83 c4 10             	add    $0x10,%esp
c000824c:	83 ec 0c             	sub    $0xc,%esp
c000824f:	68 4a ba 00 c0       	push   $0xc000ba4a
c0008254:	e8 33 93 ff ff       	call   c000158c <disp_str>
c0008259:	83 c4 10             	add    $0x10,%esp
c000825c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000825f:	83 ec 0c             	sub    $0xc,%esp
c0008262:	50                   	push   %eax
c0008263:	e8 e6 fc ff ff       	call   c0007f4e <disp_int>
c0008268:	83 c4 10             	add    $0x10,%esp
c000826b:	83 ec 0c             	sub    $0xc,%esp
c000826e:	68 4f ba 00 c0       	push   $0xc000ba4f
c0008273:	e8 14 93 ff ff       	call   c000158c <disp_str>
c0008278:	83 c4 10             	add    $0x10,%esp
c000827b:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c000827f:	75 11                	jne    c0008292 <exception_handler+0x1de>
c0008281:	83 ec 0c             	sub    $0xc,%esp
c0008284:	68 cf ba 00 c0       	push   $0xc000bacf
c0008289:	e8 fe 92 ff ff       	call   c000158c <disp_str>
c000828e:	83 c4 10             	add    $0x10,%esp
c0008291:	90                   	nop
c0008292:	90                   	nop
c0008293:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008296:	5b                   	pop    %ebx
c0008297:	5e                   	pop    %esi
c0008298:	5f                   	pop    %edi
c0008299:	5d                   	pop    %ebp
c000829a:	c3                   	ret    

c000829b <exception_handler2>:
c000829b:	55                   	push   %ebp
c000829c:	89 e5                	mov    %esp,%ebp
c000829e:	57                   	push   %edi
c000829f:	56                   	push   %esi
c00082a0:	53                   	push   %ebx
c00082a1:	83 ec 6c             	sub    $0x6c,%esp
c00082a4:	8d 45 90             	lea    -0x70(%ebp),%eax
c00082a7:	bb e0 bc 00 c0       	mov    $0xc000bce0,%ebx
c00082ac:	ba 13 00 00 00       	mov    $0x13,%edx
c00082b1:	89 c7                	mov    %eax,%edi
c00082b3:	89 de                	mov    %ebx,%esi
c00082b5:	89 d1                	mov    %edx,%ecx
c00082b7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00082b9:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c00082c0:	2e 00 00 
c00082c3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00082ca:	eb 14                	jmp    c00082e0 <exception_handler2+0x45>
c00082cc:	83 ec 0c             	sub    $0xc,%esp
c00082cf:	68 2c bd 00 c0       	push   $0xc000bd2c
c00082d4:	e8 b3 92 ff ff       	call   c000158c <disp_str>
c00082d9:	83 c4 10             	add    $0x10,%esp
c00082dc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00082e0:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c00082e7:	7e e3                	jle    c00082cc <exception_handler2+0x31>
c00082e9:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c00082f0:	2e 00 00 
c00082f3:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c00082fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00082fd:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0008301:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008304:	83 ec 08             	sub    $0x8,%esp
c0008307:	ff 75 e0             	pushl  -0x20(%ebp)
c000830a:	ff 75 dc             	pushl  -0x24(%ebp)
c000830d:	e8 b5 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008312:	83 c4 10             	add    $0x10,%esp
c0008315:	83 ec 0c             	sub    $0xc,%esp
c0008318:	68 7b ba 00 c0       	push   $0xc000ba7b
c000831d:	e8 6a 92 ff ff       	call   c000158c <disp_str>
c0008322:	83 c4 10             	add    $0x10,%esp
c0008325:	83 ec 08             	sub    $0x8,%esp
c0008328:	ff 75 e0             	pushl  -0x20(%ebp)
c000832b:	68 7e ba 00 c0       	push   $0xc000ba7e
c0008330:	e8 92 92 ff ff       	call   c00015c7 <disp_str_colour>
c0008335:	83 c4 10             	add    $0x10,%esp
c0008338:	83 ec 0c             	sub    $0xc,%esp
c000833b:	ff 75 08             	pushl  0x8(%ebp)
c000833e:	e8 0b fc ff ff       	call   c0007f4e <disp_int>
c0008343:	83 c4 10             	add    $0x10,%esp
c0008346:	83 ec 0c             	sub    $0xc,%esp
c0008349:	68 7b ba 00 c0       	push   $0xc000ba7b
c000834e:	e8 39 92 ff ff       	call   c000158c <disp_str>
c0008353:	83 c4 10             	add    $0x10,%esp
c0008356:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c000835a:	74 44                	je     c00083a0 <exception_handler2+0x105>
c000835c:	83 ec 08             	sub    $0x8,%esp
c000835f:	ff 75 e0             	pushl  -0x20(%ebp)
c0008362:	68 86 ba 00 c0       	push   $0xc000ba86
c0008367:	e8 5b 92 ff ff       	call   c00015c7 <disp_str_colour>
c000836c:	83 c4 10             	add    $0x10,%esp
c000836f:	83 ec 08             	sub    $0x8,%esp
c0008372:	ff 75 e0             	pushl  -0x20(%ebp)
c0008375:	68 86 ba 00 c0       	push   $0xc000ba86
c000837a:	e8 48 92 ff ff       	call   c00015c7 <disp_str_colour>
c000837f:	83 c4 10             	add    $0x10,%esp
c0008382:	83 ec 0c             	sub    $0xc,%esp
c0008385:	ff 75 0c             	pushl  0xc(%ebp)
c0008388:	e8 c1 fb ff ff       	call   c0007f4e <disp_int>
c000838d:	83 c4 10             	add    $0x10,%esp
c0008390:	83 ec 0c             	sub    $0xc,%esp
c0008393:	68 7b ba 00 c0       	push   $0xc000ba7b
c0008398:	e8 ef 91 ff ff       	call   c000158c <disp_str>
c000839d:	83 c4 10             	add    $0x10,%esp
c00083a0:	83 ec 08             	sub    $0x8,%esp
c00083a3:	ff 75 e0             	pushl  -0x20(%ebp)
c00083a6:	68 90 ba 00 c0       	push   $0xc000ba90
c00083ab:	e8 17 92 ff ff       	call   c00015c7 <disp_str_colour>
c00083b0:	83 c4 10             	add    $0x10,%esp
c00083b3:	83 ec 0c             	sub    $0xc,%esp
c00083b6:	ff 75 14             	pushl  0x14(%ebp)
c00083b9:	e8 90 fb ff ff       	call   c0007f4e <disp_int>
c00083be:	83 c4 10             	add    $0x10,%esp
c00083c1:	83 ec 0c             	sub    $0xc,%esp
c00083c4:	68 7b ba 00 c0       	push   $0xc000ba7b
c00083c9:	e8 be 91 ff ff       	call   c000158c <disp_str>
c00083ce:	83 c4 10             	add    $0x10,%esp
c00083d1:	83 ec 08             	sub    $0x8,%esp
c00083d4:	ff 75 e0             	pushl  -0x20(%ebp)
c00083d7:	68 94 ba 00 c0       	push   $0xc000ba94
c00083dc:	e8 e6 91 ff ff       	call   c00015c7 <disp_str_colour>
c00083e1:	83 c4 10             	add    $0x10,%esp
c00083e4:	83 ec 0c             	sub    $0xc,%esp
c00083e7:	ff 75 10             	pushl  0x10(%ebp)
c00083ea:	e8 5f fb ff ff       	call   c0007f4e <disp_int>
c00083ef:	83 c4 10             	add    $0x10,%esp
c00083f2:	83 ec 0c             	sub    $0xc,%esp
c00083f5:	68 7b ba 00 c0       	push   $0xc000ba7b
c00083fa:	e8 8d 91 ff ff       	call   c000158c <disp_str>
c00083ff:	83 c4 10             	add    $0x10,%esp
c0008402:	83 ec 08             	sub    $0x8,%esp
c0008405:	ff 75 e0             	pushl  -0x20(%ebp)
c0008408:	68 99 ba 00 c0       	push   $0xc000ba99
c000840d:	e8 b5 91 ff ff       	call   c00015c7 <disp_str_colour>
c0008412:	83 c4 10             	add    $0x10,%esp
c0008415:	83 ec 0c             	sub    $0xc,%esp
c0008418:	ff 75 18             	pushl  0x18(%ebp)
c000841b:	e8 2e fb ff ff       	call   c0007f4e <disp_int>
c0008420:	83 c4 10             	add    $0x10,%esp
c0008423:	83 ec 0c             	sub    $0xc,%esp
c0008426:	68 7b ba 00 c0       	push   $0xc000ba7b
c000842b:	e8 5c 91 ff ff       	call   c000158c <disp_str>
c0008430:	83 c4 10             	add    $0x10,%esp
c0008433:	90                   	nop
c0008434:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008437:	5b                   	pop    %ebx
c0008438:	5e                   	pop    %esi
c0008439:	5f                   	pop    %edi
c000843a:	5d                   	pop    %ebp
c000843b:	c3                   	ret    

c000843c <init_internal_interrupt>:
c000843c:	55                   	push   %ebp
c000843d:	89 e5                	mov    %esp,%ebp
c000843f:	83 ec 08             	sub    $0x8,%esp
c0008442:	6a 0e                	push   $0xe
c0008444:	6a 08                	push   $0x8
c0008446:	68 03 16 00 c0       	push   $0xc0001603
c000844b:	6a 00                	push   $0x0
c000844d:	e8 96 ca ff ff       	call   c0004ee8 <InitInterruptDesc>
c0008452:	83 c4 10             	add    $0x10,%esp
c0008455:	6a 0e                	push   $0xe
c0008457:	6a 08                	push   $0x8
c0008459:	68 09 16 00 c0       	push   $0xc0001609
c000845e:	6a 01                	push   $0x1
c0008460:	e8 83 ca ff ff       	call   c0004ee8 <InitInterruptDesc>
c0008465:	83 c4 10             	add    $0x10,%esp
c0008468:	6a 0e                	push   $0xe
c000846a:	6a 08                	push   $0x8
c000846c:	68 0f 16 00 c0       	push   $0xc000160f
c0008471:	6a 02                	push   $0x2
c0008473:	e8 70 ca ff ff       	call   c0004ee8 <InitInterruptDesc>
c0008478:	83 c4 10             	add    $0x10,%esp
c000847b:	6a 0e                	push   $0xe
c000847d:	6a 08                	push   $0x8
c000847f:	68 15 16 00 c0       	push   $0xc0001615
c0008484:	6a 03                	push   $0x3
c0008486:	e8 5d ca ff ff       	call   c0004ee8 <InitInterruptDesc>
c000848b:	83 c4 10             	add    $0x10,%esp
c000848e:	6a 0e                	push   $0xe
c0008490:	6a 08                	push   $0x8
c0008492:	68 1b 16 00 c0       	push   $0xc000161b
c0008497:	6a 04                	push   $0x4
c0008499:	e8 4a ca ff ff       	call   c0004ee8 <InitInterruptDesc>
c000849e:	83 c4 10             	add    $0x10,%esp
c00084a1:	6a 0e                	push   $0xe
c00084a3:	6a 08                	push   $0x8
c00084a5:	68 21 16 00 c0       	push   $0xc0001621
c00084aa:	6a 05                	push   $0x5
c00084ac:	e8 37 ca ff ff       	call   c0004ee8 <InitInterruptDesc>
c00084b1:	83 c4 10             	add    $0x10,%esp
c00084b4:	6a 0e                	push   $0xe
c00084b6:	6a 08                	push   $0x8
c00084b8:	68 27 16 00 c0       	push   $0xc0001627
c00084bd:	6a 06                	push   $0x6
c00084bf:	e8 24 ca ff ff       	call   c0004ee8 <InitInterruptDesc>
c00084c4:	83 c4 10             	add    $0x10,%esp
c00084c7:	6a 0e                	push   $0xe
c00084c9:	6a 08                	push   $0x8
c00084cb:	68 2d 16 00 c0       	push   $0xc000162d
c00084d0:	6a 07                	push   $0x7
c00084d2:	e8 11 ca ff ff       	call   c0004ee8 <InitInterruptDesc>
c00084d7:	83 c4 10             	add    $0x10,%esp
c00084da:	6a 0e                	push   $0xe
c00084dc:	6a 08                	push   $0x8
c00084de:	68 33 16 00 c0       	push   $0xc0001633
c00084e3:	6a 08                	push   $0x8
c00084e5:	e8 fe c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c00084ea:	83 c4 10             	add    $0x10,%esp
c00084ed:	6a 0e                	push   $0xe
c00084ef:	6a 08                	push   $0x8
c00084f1:	68 37 16 00 c0       	push   $0xc0001637
c00084f6:	6a 09                	push   $0x9
c00084f8:	e8 eb c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c00084fd:	83 c4 10             	add    $0x10,%esp
c0008500:	6a 0e                	push   $0xe
c0008502:	6a 08                	push   $0x8
c0008504:	68 3d 16 00 c0       	push   $0xc000163d
c0008509:	6a 0a                	push   $0xa
c000850b:	e8 d8 c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c0008510:	83 c4 10             	add    $0x10,%esp
c0008513:	6a 0e                	push   $0xe
c0008515:	6a 08                	push   $0x8
c0008517:	68 41 16 00 c0       	push   $0xc0001641
c000851c:	6a 0b                	push   $0xb
c000851e:	e8 c5 c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c0008523:	83 c4 10             	add    $0x10,%esp
c0008526:	6a 0e                	push   $0xe
c0008528:	6a 08                	push   $0x8
c000852a:	68 45 16 00 c0       	push   $0xc0001645
c000852f:	6a 0c                	push   $0xc
c0008531:	e8 b2 c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c0008536:	83 c4 10             	add    $0x10,%esp
c0008539:	6a 0e                	push   $0xe
c000853b:	6a 08                	push   $0x8
c000853d:	68 49 16 00 c0       	push   $0xc0001649
c0008542:	6a 0d                	push   $0xd
c0008544:	e8 9f c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c0008549:	83 c4 10             	add    $0x10,%esp
c000854c:	6a 0e                	push   $0xe
c000854e:	6a 08                	push   $0x8
c0008550:	68 54 16 00 c0       	push   $0xc0001654
c0008555:	6a 0e                	push   $0xe
c0008557:	e8 8c c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c000855c:	83 c4 10             	add    $0x10,%esp
c000855f:	6a 0e                	push   $0xe
c0008561:	6a 08                	push   $0x8
c0008563:	68 58 16 00 c0       	push   $0xc0001658
c0008568:	6a 10                	push   $0x10
c000856a:	e8 79 c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c000856f:	83 c4 10             	add    $0x10,%esp
c0008572:	6a 0e                	push   $0xe
c0008574:	6a 08                	push   $0x8
c0008576:	68 5e 16 00 c0       	push   $0xc000165e
c000857b:	6a 11                	push   $0x11
c000857d:	e8 66 c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c0008582:	83 c4 10             	add    $0x10,%esp
c0008585:	6a 0e                	push   $0xe
c0008587:	6a 08                	push   $0x8
c0008589:	68 62 16 00 c0       	push   $0xc0001662
c000858e:	6a 12                	push   $0x12
c0008590:	e8 53 c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c0008595:	83 c4 10             	add    $0x10,%esp
c0008598:	6a 0e                	push   $0xe
c000859a:	6a 0e                	push   $0xe
c000859c:	68 1e 17 00 c0       	push   $0xc000171e
c00085a1:	68 90 00 00 00       	push   $0x90
c00085a6:	e8 3d c9 ff ff       	call   c0004ee8 <InitInterruptDesc>
c00085ab:	83 c4 10             	add    $0x10,%esp
c00085ae:	90                   	nop
c00085af:	c9                   	leave  
c00085b0:	c3                   	ret    

c00085b1 <test>:
c00085b1:	55                   	push   %ebp
c00085b2:	89 e5                	mov    %esp,%ebp
c00085b4:	83 ec 08             	sub    $0x8,%esp
c00085b7:	83 ec 0c             	sub    $0xc,%esp
c00085ba:	68 2e bd 00 c0       	push   $0xc000bd2e
c00085bf:	e8 c8 8f ff ff       	call   c000158c <disp_str>
c00085c4:	83 c4 10             	add    $0x10,%esp
c00085c7:	83 ec 0c             	sub    $0xc,%esp
c00085ca:	68 4f ba 00 c0       	push   $0xc000ba4f
c00085cf:	e8 b8 8f ff ff       	call   c000158c <disp_str>
c00085d4:	83 c4 10             	add    $0x10,%esp
c00085d7:	90                   	nop
c00085d8:	c9                   	leave  
c00085d9:	c3                   	ret    

c00085da <disp_str_colour3>:
c00085da:	55                   	push   %ebp
c00085db:	89 e5                	mov    %esp,%ebp
c00085dd:	90                   	nop
c00085de:	5d                   	pop    %ebp
c00085df:	c3                   	ret    

c00085e0 <spurious_irq>:
c00085e0:	55                   	push   %ebp
c00085e1:	89 e5                	mov    %esp,%ebp
c00085e3:	83 ec 08             	sub    $0x8,%esp
c00085e6:	83 ec 08             	sub    $0x8,%esp
c00085e9:	6a 0b                	push   $0xb
c00085eb:	68 30 bd 00 c0       	push   $0xc000bd30
c00085f0:	e8 d2 8f ff ff       	call   c00015c7 <disp_str_colour>
c00085f5:	83 c4 10             	add    $0x10,%esp
c00085f8:	83 ec 0c             	sub    $0xc,%esp
c00085fb:	ff 75 08             	pushl  0x8(%ebp)
c00085fe:	e8 4b f9 ff ff       	call   c0007f4e <disp_int>
c0008603:	83 c4 10             	add    $0x10,%esp
c0008606:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000860b:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008611:	83 c0 01             	add    $0x1,%eax
c0008614:	83 d2 00             	adc    $0x0,%edx
c0008617:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c000861c:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c0008622:	83 ec 0c             	sub    $0xc,%esp
c0008625:	68 57 bd 00 c0       	push   $0xc000bd57
c000862a:	e8 5d 8f ff ff       	call   c000158c <disp_str>
c000862f:	83 c4 10             	add    $0x10,%esp
c0008632:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008637:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000863d:	83 ec 0c             	sub    $0xc,%esp
c0008640:	50                   	push   %eax
c0008641:	e8 08 f9 ff ff       	call   c0007f4e <disp_int>
c0008646:	83 c4 10             	add    $0x10,%esp
c0008649:	83 ec 0c             	sub    $0xc,%esp
c000864c:	68 59 bd 00 c0       	push   $0xc000bd59
c0008651:	e8 36 8f ff ff       	call   c000158c <disp_str>
c0008656:	83 c4 10             	add    $0x10,%esp
c0008659:	83 ec 08             	sub    $0x8,%esp
c000865c:	6a 0c                	push   $0xc
c000865e:	68 5c bd 00 c0       	push   $0xc000bd5c
c0008663:	e8 5f 8f ff ff       	call   c00015c7 <disp_str_colour>
c0008668:	83 c4 10             	add    $0x10,%esp
c000866b:	90                   	nop
c000866c:	c9                   	leave  
c000866d:	c3                   	ret    

c000866e <init_keyboard>:
c000866e:	55                   	push   %ebp
c000866f:	89 e5                	mov    %esp,%ebp
c0008671:	83 ec 18             	sub    $0x18,%esp
c0008674:	83 ec 04             	sub    $0x4,%esp
c0008677:	68 00 02 00 00       	push   $0x200
c000867c:	6a 00                	push   $0x0
c000867e:	68 ec 0b 01 c0       	push   $0xc0010bec
c0008683:	e8 c3 3b 00 00       	call   c000c24b <Memset>
c0008688:	83 c4 10             	add    $0x10,%esp
c000868b:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0008692:	0b 01 c0 
c0008695:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c000869a:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c000869f:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c00086a6:	00 00 00 
c00086a9:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00086b0:	00 00 00 
c00086b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00086ba:	eb 04                	jmp    c00086c0 <init_keyboard+0x52>
c00086bc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00086c0:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00086c7:	7e f3                	jle    c00086bc <init_keyboard+0x4e>
c00086c9:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00086d0:	00 00 00 
c00086d3:	e8 1a d6 ff ff       	call   c0005cf2 <init_keyboard_handler>
c00086d8:	90                   	nop
c00086d9:	c9                   	leave  
c00086da:	c3                   	ret    

c00086db <init2>:
c00086db:	55                   	push   %ebp
c00086dc:	89 e5                	mov    %esp,%ebp
c00086de:	83 ec 08             	sub    $0x8,%esp
c00086e1:	83 ec 0c             	sub    $0xc,%esp
c00086e4:	68 81 bd 00 c0       	push   $0xc000bd81
c00086e9:	e8 9e 8e ff ff       	call   c000158c <disp_str>
c00086ee:	83 c4 10             	add    $0x10,%esp
c00086f1:	e8 78 ff ff ff       	call   c000866e <init_keyboard>
c00086f6:	83 ec 0c             	sub    $0xc,%esp
c00086f9:	68 00 00 00 02       	push   $0x2000000
c00086fe:	e8 8c f2 ff ff       	call   c000798f <init_memory>
c0008703:	83 c4 10             	add    $0x10,%esp
c0008706:	90                   	nop
c0008707:	c9                   	leave  
c0008708:	c3                   	ret    

c0008709 <u_thread_a>:
c0008709:	55                   	push   %ebp
c000870a:	89 e5                	mov    %esp,%ebp
c000870c:	83 ec 08             	sub    $0x8,%esp
c000870f:	83 ec 0c             	sub    $0xc,%esp
c0008712:	68 87 bd 00 c0       	push   $0xc000bd87
c0008717:	e8 70 8e ff ff       	call   c000158c <disp_str>
c000871c:	83 c4 10             	add    $0x10,%esp
c000871f:	eb fe                	jmp    c000871f <u_thread_a+0x16>

c0008721 <kernel_main2>:
c0008721:	55                   	push   %ebp
c0008722:	89 e5                	mov    %esp,%ebp
c0008724:	57                   	push   %edi
c0008725:	56                   	push   %esi
c0008726:	53                   	push   %ebx
c0008727:	83 ec 3c             	sub    $0x3c,%esp
c000872a:	83 ec 0c             	sub    $0xc,%esp
c000872d:	68 95 bd 00 c0       	push   $0xc000bd95
c0008732:	e8 55 8e ff ff       	call   c000158c <disp_str>
c0008737:	83 c4 10             	add    $0x10,%esp
c000873a:	e8 41 92 ff ff       	call   c0001980 <init>
c000873f:	c7 05 e8 1e 01 c0 00 	movl   $0x0,0xc0011ee8
c0008746:	00 00 00 
c0008749:	c7 05 ec 1e 01 c0 00 	movl   $0x0,0xc0011eec
c0008750:	00 00 00 
c0008753:	c7 05 bc 16 01 c0 00 	movl   $0x0,0xc00116bc
c000875a:	00 00 00 
c000875d:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c0008764:	00 00 00 
c0008767:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c000876e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008775:	e9 01 02 00 00       	jmp    c000897b <kernel_main2+0x25a>
c000877a:	83 ec 08             	sub    $0x8,%esp
c000877d:	6a 00                	push   $0x0
c000877f:	6a 01                	push   $0x1
c0008781:	e8 25 e9 ff ff       	call   c00070ab <alloc_memory>
c0008786:	83 c4 10             	add    $0x10,%esp
c0008789:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000878c:	83 ec 04             	sub    $0x4,%esp
c000878f:	68 b4 02 00 00       	push   $0x2b4
c0008794:	6a 00                	push   $0x0
c0008796:	ff 75 d8             	pushl  -0x28(%ebp)
c0008799:	e8 ad 3a 00 00       	call   c000c24b <Memset>
c000879e:	83 c4 10             	add    $0x10,%esp
c00087a1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087a4:	05 00 10 00 00       	add    $0x1000,%eax
c00087a9:	89 c2                	mov    %eax,%edx
c00087ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087ae:	89 10                	mov    %edx,(%eax)
c00087b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087b3:	66 c7 80 10 01 00 00 	movw   $0x0,0x110(%eax)
c00087ba:	00 00 
c00087bc:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00087bf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087c2:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c00087c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087cb:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00087d2:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c00087d6:	7e 0f                	jle    c00087e7 <kernel_main2+0xc6>
c00087d8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087db:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c00087e2:	e9 90 01 00 00       	jmp    c0008977 <kernel_main2+0x256>
c00087e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00087ea:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00087f1:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c00087f5:	7f 73                	jg     c000886a <kernel_main2+0x149>
c00087f7:	c7 45 e4 20 f0 00 c0 	movl   $0xc000f020,-0x1c(%ebp)
c00087fe:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c0008805:	c7 45 d0 2c 00 00 00 	movl   $0x2c,-0x30(%ebp)
c000880c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000880f:	8b 00                	mov    (%eax),%eax
c0008811:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c0008814:	89 c2                	mov    %eax,%edx
c0008816:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008819:	89 10                	mov    %edx,(%eax)
c000881b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000881e:	8b 00                	mov    (%eax),%eax
c0008820:	2b 45 d0             	sub    -0x30(%ebp),%eax
c0008823:	89 c2                	mov    %eax,%edx
c0008825:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008828:	89 10                	mov    %edx,(%eax)
c000882a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000882d:	8b 00                	mov    (%eax),%eax
c000882f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008832:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008835:	8b 50 14             	mov    0x14(%eax),%edx
c0008838:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000883b:	89 50 28             	mov    %edx,0x28(%eax)
c000883e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008841:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0008847:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000884a:	8b 10                	mov    (%eax),%edx
c000884c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000884f:	89 50 04             	mov    %edx,0x4(%eax)
c0008852:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008855:	8b 50 04             	mov    0x4(%eax),%edx
c0008858:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000885b:	89 50 08             	mov    %edx,0x8(%eax)
c000885e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008861:	8b 50 08             	mov    0x8(%eax),%edx
c0008864:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008867:	89 50 0c             	mov    %edx,0xc(%eax)
c000886a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000886d:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0008870:	81 c2 34 01 00 00    	add    $0x134,%edx
c0008876:	83 ec 08             	sub    $0x8,%esp
c0008879:	50                   	push   %eax
c000887a:	52                   	push   %edx
c000887b:	e8 ea 39 00 00       	call   c000c26a <Strcpy>
c0008880:	83 c4 10             	add    $0x10,%esp
c0008883:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008887:	83 c8 04             	or     $0x4,%eax
c000888a:	0f b6 c0             	movzbl %al,%eax
c000888d:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c0008891:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008895:	83 c8 0c             	or     $0xc,%eax
c0008898:	0f b6 c0             	movzbl %al,%eax
c000889b:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c000889f:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c00088a3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088a6:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00088ac:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088b0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088b3:	89 90 78 02 00 00    	mov    %edx,0x278(%eax)
c00088b9:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088bd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088c0:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c00088c6:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088ca:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088cd:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c00088d3:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00088d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088da:	89 90 ac 02 00 00    	mov    %edx,0x2ac(%eax)
c00088e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088e3:	c7 80 6c 02 00 00 39 	movl   $0x39,0x26c(%eax)
c00088ea:	00 00 00 
c00088ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00088f0:	8b 50 14             	mov    0x14(%eax),%edx
c00088f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088f6:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c00088fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00088ff:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0008902:	89 90 a4 02 00 00    	mov    %edx,0x2a4(%eax)
c0008908:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000890b:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0008912:	00 00 00 
c0008915:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008918:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000891f:	00 00 00 
c0008922:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008925:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000892c:	00 00 00 
c000892f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008932:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0008939:	00 00 00 
c000893c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000893f:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0008946:	00 00 00 
c0008949:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000894c:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0008953:	00 00 00 
c0008956:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008959:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000895f:	8d 90 00 32 08 c0    	lea    -0x3ff7ce00(%eax),%edx
c0008965:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008968:	89 c3                	mov    %eax,%ebx
c000896a:	b8 ad 00 00 00       	mov    $0xad,%eax
c000896f:	89 d7                	mov    %edx,%edi
c0008971:	89 de                	mov    %ebx,%esi
c0008973:	89 c1                	mov    %eax,%ecx
c0008975:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008977:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000897b:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c000897f:	0f 8e f5 fd ff ff    	jle    c000877a <kernel_main2+0x59>
c0008985:	c7 05 c0 0b 01 c0 00 	movl   $0xc0083200,0xc0010bc0
c000898c:	32 08 c0 
c000898f:	eb fe                	jmp    c000898f <kernel_main2+0x26e>

c0008991 <TestTTY>:
c0008991:	55                   	push   %ebp
c0008992:	89 e5                	mov    %esp,%ebp
c0008994:	83 ec 28             	sub    $0x28,%esp
c0008997:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c000899e:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00089a5:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00089ab:	83 ec 08             	sub    $0x8,%esp
c00089ae:	6a 02                	push   $0x2
c00089b0:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089b3:	50                   	push   %eax
c00089b4:	e8 df d4 ff ff       	call   c0005e98 <open>
c00089b9:	83 c4 10             	add    $0x10,%esp
c00089bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00089bf:	83 ec 08             	sub    $0x8,%esp
c00089c2:	6a 02                	push   $0x2
c00089c4:	8d 45 de             	lea    -0x22(%ebp),%eax
c00089c7:	50                   	push   %eax
c00089c8:	e8 cb d4 ff ff       	call   c0005e98 <open>
c00089cd:	83 c4 10             	add    $0x10,%esp
c00089d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00089d3:	83 ec 0c             	sub    $0xc,%esp
c00089d6:	68 a1 bd 00 c0       	push   $0xc000bda1
c00089db:	e8 0d 0e 00 00       	call   c00097ed <Printf>
c00089e0:	83 c4 10             	add    $0x10,%esp
c00089e3:	83 ec 0c             	sub    $0xc,%esp
c00089e6:	6a 0a                	push   $0xa
c00089e8:	e8 d7 9f ff ff       	call   c00029c4 <sys_malloc>
c00089ed:	83 c4 10             	add    $0x10,%esp
c00089f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00089f3:	83 ec 04             	sub    $0x4,%esp
c00089f6:	6a 0a                	push   $0xa
c00089f8:	6a 00                	push   $0x0
c00089fa:	ff 75 ec             	pushl  -0x14(%ebp)
c00089fd:	e8 49 38 00 00       	call   c000c24b <Memset>
c0008a02:	83 c4 10             	add    $0x10,%esp
c0008a05:	83 ec 04             	sub    $0x4,%esp
c0008a08:	6a 0a                	push   $0xa
c0008a0a:	ff 75 ec             	pushl  -0x14(%ebp)
c0008a0d:	ff 75 f0             	pushl  -0x10(%ebp)
c0008a10:	e8 08 d5 ff ff       	call   c0005f1d <read>
c0008a15:	83 c4 10             	add    $0x10,%esp
c0008a18:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008a1b:	83 ec 08             	sub    $0x8,%esp
c0008a1e:	ff 75 ec             	pushl  -0x14(%ebp)
c0008a21:	68 b3 bd 00 c0       	push   $0xc000bdb3
c0008a26:	e8 c2 0d 00 00       	call   c00097ed <Printf>
c0008a2b:	83 c4 10             	add    $0x10,%esp
c0008a2e:	eb c3                	jmp    c00089f3 <TestTTY+0x62>

c0008a30 <TestFS>:
c0008a30:	55                   	push   %ebp
c0008a31:	89 e5                	mov    %esp,%ebp
c0008a33:	81 ec 28 01 00 00    	sub    $0x128,%esp
c0008a39:	83 ec 0c             	sub    $0xc,%esp
c0008a3c:	68 bd bd 00 c0       	push   $0xc000bdbd
c0008a41:	e8 46 8b ff ff       	call   c000158c <disp_str>
c0008a46:	83 c4 10             	add    $0x10,%esp
c0008a49:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0008a50:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c0008a57:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0008a5d:	66 87 db             	xchg   %bx,%bx
c0008a60:	83 ec 08             	sub    $0x8,%esp
c0008a63:	6a 02                	push   $0x2
c0008a65:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008a68:	50                   	push   %eax
c0008a69:	e8 2a d4 ff ff       	call   c0005e98 <open>
c0008a6e:	83 c4 10             	add    $0x10,%esp
c0008a71:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008a74:	66 87 db             	xchg   %bx,%bx
c0008a77:	83 ec 08             	sub    $0x8,%esp
c0008a7a:	6a 02                	push   $0x2
c0008a7c:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008a7f:	50                   	push   %eax
c0008a80:	e8 13 d4 ff ff       	call   c0005e98 <open>
c0008a85:	83 c4 10             	add    $0x10,%esp
c0008a88:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008a8b:	66 87 db             	xchg   %bx,%bx
c0008a8e:	83 ec 0c             	sub    $0xc,%esp
c0008a91:	68 a1 bd 00 c0       	push   $0xc000bda1
c0008a96:	e8 52 0d 00 00       	call   c00097ed <Printf>
c0008a9b:	83 c4 10             	add    $0x10,%esp
c0008a9e:	66 87 db             	xchg   %bx,%bx
c0008aa1:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c0008aa8:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0008aac:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0008ab3:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c0008ab7:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0008abe:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0008ac5:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0008acb:	66 87 db             	xchg   %bx,%bx
c0008ace:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008ad5:	66 87 db             	xchg   %bx,%bx
c0008ad8:	83 ec 0c             	sub    $0xc,%esp
c0008adb:	68 c5 bd 00 c0       	push   $0xc000bdc5
c0008ae0:	e8 08 0d 00 00       	call   c00097ed <Printf>
c0008ae5:	83 c4 10             	add    $0x10,%esp
c0008ae8:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0008aec:	0f 85 43 03 00 00    	jne    c0008e35 <TestFS+0x405>
c0008af2:	83 ec 08             	sub    $0x8,%esp
c0008af5:	6a 07                	push   $0x7
c0008af7:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0008afa:	50                   	push   %eax
c0008afb:	e8 98 d3 ff ff       	call   c0005e98 <open>
c0008b00:	83 c4 10             	add    $0x10,%esp
c0008b03:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008b06:	83 ec 08             	sub    $0x8,%esp
c0008b09:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b0c:	68 dd bd 00 c0       	push   $0xc000bddd
c0008b11:	e8 d7 0c 00 00       	call   c00097ed <Printf>
c0008b16:	83 c4 10             	add    $0x10,%esp
c0008b19:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008b20:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0008b27:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0008b2e:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0008b35:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0008b3c:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008b43:	83 ec 0c             	sub    $0xc,%esp
c0008b46:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008b49:	50                   	push   %eax
c0008b4a:	e8 35 37 00 00       	call   c000c284 <Strlen>
c0008b4f:	83 c4 10             	add    $0x10,%esp
c0008b52:	83 ec 04             	sub    $0x4,%esp
c0008b55:	50                   	push   %eax
c0008b56:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008b59:	50                   	push   %eax
c0008b5a:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b5d:	e8 2f d4 ff ff       	call   c0005f91 <write>
c0008b62:	83 c4 10             	add    $0x10,%esp
c0008b65:	83 ec 04             	sub    $0x4,%esp
c0008b68:	6a 14                	push   $0x14
c0008b6a:	6a 00                	push   $0x0
c0008b6c:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008b6f:	50                   	push   %eax
c0008b70:	e8 d6 36 00 00       	call   c000c24b <Memset>
c0008b75:	83 c4 10             	add    $0x10,%esp
c0008b78:	83 ec 04             	sub    $0x4,%esp
c0008b7b:	6a 12                	push   $0x12
c0008b7d:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008b80:	50                   	push   %eax
c0008b81:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b84:	e8 94 d3 ff ff       	call   c0005f1d <read>
c0008b89:	83 c4 10             	add    $0x10,%esp
c0008b8c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008b8f:	83 ec 08             	sub    $0x8,%esp
c0008b92:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008b95:	50                   	push   %eax
c0008b96:	68 e6 bd 00 c0       	push   $0xc000bde6
c0008b9b:	e8 4d 0c 00 00       	call   c00097ed <Printf>
c0008ba0:	83 c4 10             	add    $0x10,%esp
c0008ba3:	66 87 db             	xchg   %bx,%bx
c0008ba6:	83 ec 0c             	sub    $0xc,%esp
c0008ba9:	6a 0a                	push   $0xa
c0008bab:	e8 09 0b 00 00       	call   c00096b9 <delay>
c0008bb0:	83 c4 10             	add    $0x10,%esp
c0008bb3:	83 ec 08             	sub    $0x8,%esp
c0008bb6:	6a 07                	push   $0x7
c0008bb8:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0008bbb:	50                   	push   %eax
c0008bbc:	e8 d7 d2 ff ff       	call   c0005e98 <open>
c0008bc1:	83 c4 10             	add    $0x10,%esp
c0008bc4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008bc7:	83 ec 08             	sub    $0x8,%esp
c0008bca:	ff 75 dc             	pushl  -0x24(%ebp)
c0008bcd:	68 f1 bd 00 c0       	push   $0xc000bdf1
c0008bd2:	e8 16 0c 00 00       	call   c00097ed <Printf>
c0008bd7:	83 c4 10             	add    $0x10,%esp
c0008bda:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008be1:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0008be8:	67 3a 68 
c0008beb:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0008bf2:	77 20 61 
c0008bf5:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0008bfc:	65 20 79 
c0008bff:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0008c06:	75 3f 00 
c0008c09:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0008c10:	00 00 00 
c0008c13:	83 ec 0c             	sub    $0xc,%esp
c0008c16:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008c1c:	50                   	push   %eax
c0008c1d:	e8 62 36 00 00       	call   c000c284 <Strlen>
c0008c22:	83 c4 10             	add    $0x10,%esp
c0008c25:	83 ec 04             	sub    $0x4,%esp
c0008c28:	50                   	push   %eax
c0008c29:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008c2f:	50                   	push   %eax
c0008c30:	ff 75 dc             	pushl  -0x24(%ebp)
c0008c33:	e8 59 d3 ff ff       	call   c0005f91 <write>
c0008c38:	83 c4 10             	add    $0x10,%esp
c0008c3b:	83 ec 04             	sub    $0x4,%esp
c0008c3e:	6a 14                	push   $0x14
c0008c40:	6a 00                	push   $0x0
c0008c42:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008c48:	50                   	push   %eax
c0008c49:	e8 fd 35 00 00       	call   c000c24b <Memset>
c0008c4e:	83 c4 10             	add    $0x10,%esp
c0008c51:	83 ec 04             	sub    $0x4,%esp
c0008c54:	6a 12                	push   $0x12
c0008c56:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008c5c:	50                   	push   %eax
c0008c5d:	ff 75 dc             	pushl  -0x24(%ebp)
c0008c60:	e8 b8 d2 ff ff       	call   c0005f1d <read>
c0008c65:	83 c4 10             	add    $0x10,%esp
c0008c68:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008c6b:	83 ec 08             	sub    $0x8,%esp
c0008c6e:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008c74:	50                   	push   %eax
c0008c75:	68 fb bd 00 c0       	push   $0xc000bdfb
c0008c7a:	e8 6e 0b 00 00       	call   c00097ed <Printf>
c0008c7f:	83 c4 10             	add    $0x10,%esp
c0008c82:	83 ec 08             	sub    $0x8,%esp
c0008c85:	6a 07                	push   $0x7
c0008c87:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0008c8a:	50                   	push   %eax
c0008c8b:	e8 08 d2 ff ff       	call   c0005e98 <open>
c0008c90:	83 c4 10             	add    $0x10,%esp
c0008c93:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008c96:	83 ec 08             	sub    $0x8,%esp
c0008c99:	ff 75 dc             	pushl  -0x24(%ebp)
c0008c9c:	68 f1 bd 00 c0       	push   $0xc000bdf1
c0008ca1:	e8 47 0b 00 00       	call   c00097ed <Printf>
c0008ca6:	83 c4 10             	add    $0x10,%esp
c0008ca9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008cb0:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0008cb7:	20 77 69 
c0008cba:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0008cc1:	6c 20 73 
c0008cc4:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0008ccb:	63 63 65 
c0008cce:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0008cd5:	73 20 61 
c0008cd8:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0008cdf:	20 6c 61 
c0008ce2:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0008ce9:	74 2e 00 
c0008cec:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0008cf3:	00 00 00 
c0008cf6:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0008cfd:	00 00 
c0008cff:	83 ec 0c             	sub    $0xc,%esp
c0008d02:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008d08:	50                   	push   %eax
c0008d09:	e8 76 35 00 00       	call   c000c284 <Strlen>
c0008d0e:	83 c4 10             	add    $0x10,%esp
c0008d11:	83 ec 04             	sub    $0x4,%esp
c0008d14:	50                   	push   %eax
c0008d15:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008d1b:	50                   	push   %eax
c0008d1c:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008d1f:	e8 6d d2 ff ff       	call   c0005f91 <write>
c0008d24:	83 c4 10             	add    $0x10,%esp
c0008d27:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008d2e:	eb 5c                	jmp    c0008d8c <TestFS+0x35c>
c0008d30:	83 ec 04             	sub    $0x4,%esp
c0008d33:	6a 1e                	push   $0x1e
c0008d35:	6a 00                	push   $0x0
c0008d37:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008d3d:	50                   	push   %eax
c0008d3e:	e8 08 35 00 00       	call   c000c24b <Memset>
c0008d43:	83 c4 10             	add    $0x10,%esp
c0008d46:	83 ec 0c             	sub    $0xc,%esp
c0008d49:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008d4f:	50                   	push   %eax
c0008d50:	e8 2f 35 00 00       	call   c000c284 <Strlen>
c0008d55:	83 c4 10             	add    $0x10,%esp
c0008d58:	83 ec 04             	sub    $0x4,%esp
c0008d5b:	50                   	push   %eax
c0008d5c:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008d62:	50                   	push   %eax
c0008d63:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008d66:	e8 b2 d1 ff ff       	call   c0005f1d <read>
c0008d6b:	83 c4 10             	add    $0x10,%esp
c0008d6e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008d71:	83 ec 08             	sub    $0x8,%esp
c0008d74:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008d7a:	50                   	push   %eax
c0008d7b:	68 06 be 00 c0       	push   $0xc000be06
c0008d80:	e8 68 0a 00 00       	call   c00097ed <Printf>
c0008d85:	83 c4 10             	add    $0x10,%esp
c0008d88:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008d8c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008d90:	7e 9e                	jle    c0008d30 <TestFS+0x300>
c0008d92:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0008d99:	6e 73 74 
c0008d9c:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0008da3:	6c 6c 2e 
c0008da6:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0008dad:	61 72 00 
c0008db0:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0008db7:	00 00 00 
c0008dba:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0008dc1:	00 00 00 
c0008dc4:	83 ec 08             	sub    $0x8,%esp
c0008dc7:	6a 00                	push   $0x0
c0008dc9:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0008dcf:	50                   	push   %eax
c0008dd0:	e8 c3 d0 ff ff       	call   c0005e98 <open>
c0008dd5:	83 c4 10             	add    $0x10,%esp
c0008dd8:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008ddb:	83 ec 08             	sub    $0x8,%esp
c0008dde:	ff 75 cc             	pushl  -0x34(%ebp)
c0008de1:	68 11 be 00 c0       	push   $0xc000be11
c0008de6:	e8 02 0a 00 00       	call   c00097ed <Printf>
c0008deb:	83 c4 10             	add    $0x10,%esp
c0008dee:	83 ec 04             	sub    $0x4,%esp
c0008df1:	6a 28                	push   $0x28
c0008df3:	6a 00                	push   $0x0
c0008df5:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008dfb:	50                   	push   %eax
c0008dfc:	e8 4a 34 00 00       	call   c000c24b <Memset>
c0008e01:	83 c4 10             	add    $0x10,%esp
c0008e04:	83 ec 04             	sub    $0x4,%esp
c0008e07:	6a 28                	push   $0x28
c0008e09:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008e0f:	50                   	push   %eax
c0008e10:	ff 75 cc             	pushl  -0x34(%ebp)
c0008e13:	e8 05 d1 ff ff       	call   c0005f1d <read>
c0008e18:	83 c4 10             	add    $0x10,%esp
c0008e1b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008e1e:	83 ec 08             	sub    $0x8,%esp
c0008e21:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008e27:	50                   	push   %eax
c0008e28:	68 1b be 00 c0       	push   $0xc000be1b
c0008e2d:	e8 bb 09 00 00       	call   c00097ed <Printf>
c0008e32:	83 c4 10             	add    $0x10,%esp
c0008e35:	90                   	nop
c0008e36:	c9                   	leave  
c0008e37:	c3                   	ret    

c0008e38 <wait_exit>:
c0008e38:	55                   	push   %ebp
c0008e39:	89 e5                	mov    %esp,%ebp
c0008e3b:	83 ec 28             	sub    $0x28,%esp
c0008e3e:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008e45:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008e4c:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008e52:	83 ec 08             	sub    $0x8,%esp
c0008e55:	6a 02                	push   $0x2
c0008e57:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008e5a:	50                   	push   %eax
c0008e5b:	e8 38 d0 ff ff       	call   c0005e98 <open>
c0008e60:	83 c4 10             	add    $0x10,%esp
c0008e63:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008e66:	83 ec 08             	sub    $0x8,%esp
c0008e69:	6a 02                	push   $0x2
c0008e6b:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008e6e:	50                   	push   %eax
c0008e6f:	e8 24 d0 ff ff       	call   c0005e98 <open>
c0008e74:	83 c4 10             	add    $0x10,%esp
c0008e77:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e7a:	e8 39 d2 ff ff       	call   c00060b8 <fork>
c0008e7f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008e82:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008e86:	7e 25                	jle    c0008ead <wait_exit+0x75>
c0008e88:	83 ec 0c             	sub    $0xc,%esp
c0008e8b:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0008e8e:	50                   	push   %eax
c0008e8f:	e8 bd d1 ff ff       	call   c0006051 <wait>
c0008e94:	83 c4 10             	add    $0x10,%esp
c0008e97:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008e9a:	83 ec 08             	sub    $0x8,%esp
c0008e9d:	50                   	push   %eax
c0008e9e:	68 26 be 00 c0       	push   $0xc000be26
c0008ea3:	e8 45 09 00 00       	call   c00097ed <Printf>
c0008ea8:	83 c4 10             	add    $0x10,%esp
c0008eab:	eb fe                	jmp    c0008eab <wait_exit+0x73>
c0008ead:	83 ec 0c             	sub    $0xc,%esp
c0008eb0:	68 41 be 00 c0       	push   $0xc000be41
c0008eb5:	e8 33 09 00 00       	call   c00097ed <Printf>
c0008eba:	83 c4 10             	add    $0x10,%esp
c0008ebd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008ec4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ec7:	8d 50 01             	lea    0x1(%eax),%edx
c0008eca:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008ecd:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008ed2:	7f 02                	jg     c0008ed6 <wait_exit+0x9e>
c0008ed4:	eb ee                	jmp    c0008ec4 <wait_exit+0x8c>
c0008ed6:	90                   	nop
c0008ed7:	83 ec 0c             	sub    $0xc,%esp
c0008eda:	68 4d be 00 c0       	push   $0xc000be4d
c0008edf:	e8 09 09 00 00       	call   c00097ed <Printf>
c0008ee4:	83 c4 10             	add    $0x10,%esp
c0008ee7:	83 ec 0c             	sub    $0xc,%esp
c0008eea:	6a 09                	push   $0x9
c0008eec:	e8 9e d1 ff ff       	call   c000608f <exit>
c0008ef1:	83 c4 10             	add    $0x10,%esp
c0008ef4:	83 ec 0c             	sub    $0xc,%esp
c0008ef7:	68 5b be 00 c0       	push   $0xc000be5b
c0008efc:	e8 ec 08 00 00       	call   c00097ed <Printf>
c0008f01:	83 c4 10             	add    $0x10,%esp
c0008f04:	eb fe                	jmp    c0008f04 <wait_exit+0xcc>

c0008f06 <INIT_fork>:
c0008f06:	55                   	push   %ebp
c0008f07:	89 e5                	mov    %esp,%ebp
c0008f09:	83 ec 78             	sub    $0x78,%esp
c0008f0c:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008f13:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008f1a:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008f20:	83 ec 08             	sub    $0x8,%esp
c0008f23:	6a 02                	push   $0x2
c0008f25:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008f28:	50                   	push   %eax
c0008f29:	e8 6a cf ff ff       	call   c0005e98 <open>
c0008f2e:	83 c4 10             	add    $0x10,%esp
c0008f31:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f34:	83 ec 08             	sub    $0x8,%esp
c0008f37:	6a 02                	push   $0x2
c0008f39:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008f3c:	50                   	push   %eax
c0008f3d:	e8 56 cf ff ff       	call   c0005e98 <open>
c0008f42:	83 c4 10             	add    $0x10,%esp
c0008f45:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f48:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0008f4f:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0008f56:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0008f5d:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c0008f64:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008f6b:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008f72:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008f79:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008f80:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0008f87:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008f8e:	83 ec 0c             	sub    $0xc,%esp
c0008f91:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008f94:	50                   	push   %eax
c0008f95:	e8 53 08 00 00       	call   c00097ed <Printf>
c0008f9a:	83 c4 10             	add    $0x10,%esp
c0008f9d:	83 ec 0c             	sub    $0xc,%esp
c0008fa0:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fa3:	50                   	push   %eax
c0008fa4:	e8 db 32 00 00       	call   c000c284 <Strlen>
c0008fa9:	83 c4 10             	add    $0x10,%esp
c0008fac:	83 ec 04             	sub    $0x4,%esp
c0008faf:	50                   	push   %eax
c0008fb0:	6a 00                	push   $0x0
c0008fb2:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fb5:	50                   	push   %eax
c0008fb6:	e8 90 32 00 00       	call   c000c24b <Memset>
c0008fbb:	83 c4 10             	add    $0x10,%esp
c0008fbe:	83 ec 04             	sub    $0x4,%esp
c0008fc1:	6a 28                	push   $0x28
c0008fc3:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fc6:	50                   	push   %eax
c0008fc7:	ff 75 f0             	pushl  -0x10(%ebp)
c0008fca:	e8 4e cf ff ff       	call   c0005f1d <read>
c0008fcf:	83 c4 10             	add    $0x10,%esp
c0008fd2:	83 ec 0c             	sub    $0xc,%esp
c0008fd5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0008fd8:	50                   	push   %eax
c0008fd9:	e8 0f 08 00 00       	call   c00097ed <Printf>
c0008fde:	83 c4 10             	add    $0x10,%esp
c0008fe1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008fe8:	e8 cb d0 ff ff       	call   c00060b8 <fork>
c0008fed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008ff0:	66 87 db             	xchg   %bx,%bx
c0008ff3:	83 ec 0c             	sub    $0xc,%esp
c0008ff6:	6a 01                	push   $0x1
c0008ff8:	e8 bc 06 00 00       	call   c00096b9 <delay>
c0008ffd:	83 c4 10             	add    $0x10,%esp
c0009000:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0009004:	0f 8e c5 00 00 00    	jle    c00090cf <INIT_fork+0x1c9>
c000900a:	83 ec 0c             	sub    $0xc,%esp
c000900d:	68 69 be 00 c0       	push   $0xc000be69
c0009012:	e8 d6 07 00 00       	call   c00097ed <Printf>
c0009017:	83 c4 10             	add    $0x10,%esp
c000901a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000901e:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0009025:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c000902c:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c0009033:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c000903a:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c0009041:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0009048:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c000904f:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0009056:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c000905d:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0009064:	83 ec 0c             	sub    $0xc,%esp
c0009067:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000906a:	50                   	push   %eax
c000906b:	e8 14 32 00 00       	call   c000c284 <Strlen>
c0009070:	83 c4 10             	add    $0x10,%esp
c0009073:	83 ec 04             	sub    $0x4,%esp
c0009076:	50                   	push   %eax
c0009077:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000907a:	50                   	push   %eax
c000907b:	ff 75 f4             	pushl  -0xc(%ebp)
c000907e:	e8 0e cf ff ff       	call   c0005f91 <write>
c0009083:	83 c4 10             	add    $0x10,%esp
c0009086:	83 ec 0c             	sub    $0xc,%esp
c0009089:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000908c:	50                   	push   %eax
c000908d:	e8 f2 31 00 00       	call   c000c284 <Strlen>
c0009092:	83 c4 10             	add    $0x10,%esp
c0009095:	83 ec 04             	sub    $0x4,%esp
c0009098:	50                   	push   %eax
c0009099:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000909c:	50                   	push   %eax
c000909d:	ff 75 f4             	pushl  -0xc(%ebp)
c00090a0:	e8 ec ce ff ff       	call   c0005f91 <write>
c00090a5:	83 c4 10             	add    $0x10,%esp
c00090a8:	83 ec 0c             	sub    $0xc,%esp
c00090ab:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00090ae:	50                   	push   %eax
c00090af:	e8 d0 31 00 00       	call   c000c284 <Strlen>
c00090b4:	83 c4 10             	add    $0x10,%esp
c00090b7:	83 ec 04             	sub    $0x4,%esp
c00090ba:	50                   	push   %eax
c00090bb:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00090be:	50                   	push   %eax
c00090bf:	ff 75 f4             	pushl  -0xc(%ebp)
c00090c2:	e8 ca ce ff ff       	call   c0005f91 <write>
c00090c7:	83 c4 10             	add    $0x10,%esp
c00090ca:	e9 c6 00 00 00       	jmp    c0009195 <INIT_fork+0x28f>
c00090cf:	83 ec 0c             	sub    $0xc,%esp
c00090d2:	6a 01                	push   $0x1
c00090d4:	e8 e0 05 00 00       	call   c00096b9 <delay>
c00090d9:	83 c4 10             	add    $0x10,%esp
c00090dc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00090e0:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c00090e4:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c00090eb:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c00090f2:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c00090f9:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0009100:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0009107:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c000910e:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0009115:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c000911c:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0009123:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c000912a:	66 87 db             	xchg   %bx,%bx
c000912d:	83 ec 0c             	sub    $0xc,%esp
c0009130:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009133:	50                   	push   %eax
c0009134:	e8 4b 31 00 00       	call   c000c284 <Strlen>
c0009139:	83 c4 10             	add    $0x10,%esp
c000913c:	83 ec 04             	sub    $0x4,%esp
c000913f:	50                   	push   %eax
c0009140:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009143:	50                   	push   %eax
c0009144:	ff 75 f4             	pushl  -0xc(%ebp)
c0009147:	e8 45 ce ff ff       	call   c0005f91 <write>
c000914c:	83 c4 10             	add    $0x10,%esp
c000914f:	83 ec 0c             	sub    $0xc,%esp
c0009152:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009155:	50                   	push   %eax
c0009156:	e8 29 31 00 00       	call   c000c284 <Strlen>
c000915b:	83 c4 10             	add    $0x10,%esp
c000915e:	83 ec 04             	sub    $0x4,%esp
c0009161:	50                   	push   %eax
c0009162:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009165:	50                   	push   %eax
c0009166:	ff 75 f4             	pushl  -0xc(%ebp)
c0009169:	e8 23 ce ff ff       	call   c0005f91 <write>
c000916e:	83 c4 10             	add    $0x10,%esp
c0009171:	83 ec 0c             	sub    $0xc,%esp
c0009174:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009177:	50                   	push   %eax
c0009178:	e8 07 31 00 00       	call   c000c284 <Strlen>
c000917d:	83 c4 10             	add    $0x10,%esp
c0009180:	83 ec 04             	sub    $0x4,%esp
c0009183:	50                   	push   %eax
c0009184:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009187:	50                   	push   %eax
c0009188:	ff 75 f4             	pushl  -0xc(%ebp)
c000918b:	e8 01 ce ff ff       	call   c0005f91 <write>
c0009190:	83 c4 10             	add    $0x10,%esp
c0009193:	eb fe                	jmp    c0009193 <INIT_fork+0x28d>
c0009195:	83 ec 04             	sub    $0x4,%esp
c0009198:	6a 28                	push   $0x28
c000919a:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c000919d:	50                   	push   %eax
c000919e:	ff 75 f0             	pushl  -0x10(%ebp)
c00091a1:	e8 77 cd ff ff       	call   c0005f1d <read>
c00091a6:	83 c4 10             	add    $0x10,%esp
c00091a9:	83 ec 0c             	sub    $0xc,%esp
c00091ac:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091af:	50                   	push   %eax
c00091b0:	e8 38 06 00 00       	call   c00097ed <Printf>
c00091b5:	83 c4 10             	add    $0x10,%esp
c00091b8:	83 ec 0c             	sub    $0xc,%esp
c00091bb:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091be:	50                   	push   %eax
c00091bf:	e8 29 06 00 00       	call   c00097ed <Printf>
c00091c4:	83 c4 10             	add    $0x10,%esp
c00091c7:	83 ec 0c             	sub    $0xc,%esp
c00091ca:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091cd:	50                   	push   %eax
c00091ce:	e8 1a 06 00 00       	call   c00097ed <Printf>
c00091d3:	83 c4 10             	add    $0x10,%esp
c00091d6:	83 ec 0c             	sub    $0xc,%esp
c00091d9:	68 6f be 00 c0       	push   $0xc000be6f
c00091de:	e8 23 09 00 00       	call   c0009b06 <spin>
c00091e3:	83 c4 10             	add    $0x10,%esp
c00091e6:	90                   	nop
c00091e7:	c9                   	leave  
c00091e8:	c3                   	ret    

c00091e9 <simple_shell>:
c00091e9:	55                   	push   %ebp
c00091ea:	89 e5                	mov    %esp,%ebp
c00091ec:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c00091f2:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c00091f9:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0009200:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0009206:	83 ec 08             	sub    $0x8,%esp
c0009209:	6a 02                	push   $0x2
c000920b:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000920e:	50                   	push   %eax
c000920f:	e8 84 cc ff ff       	call   c0005e98 <open>
c0009214:	83 c4 10             	add    $0x10,%esp
c0009217:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000921a:	83 ec 08             	sub    $0x8,%esp
c000921d:	6a 02                	push   $0x2
c000921f:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0009222:	50                   	push   %eax
c0009223:	e8 70 cc ff ff       	call   c0005e98 <open>
c0009228:	83 c4 10             	add    $0x10,%esp
c000922b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000922e:	83 ec 04             	sub    $0x4,%esp
c0009231:	68 80 00 00 00       	push   $0x80
c0009236:	6a 00                	push   $0x0
c0009238:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000923e:	50                   	push   %eax
c000923f:	e8 07 30 00 00       	call   c000c24b <Memset>
c0009244:	83 c4 10             	add    $0x10,%esp
c0009247:	83 ec 04             	sub    $0x4,%esp
c000924a:	68 80 00 00 00       	push   $0x80
c000924f:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0009255:	50                   	push   %eax
c0009256:	ff 75 e0             	pushl  -0x20(%ebp)
c0009259:	e8 bf cc ff ff       	call   c0005f1d <read>
c000925e:	83 c4 10             	add    $0x10,%esp
c0009261:	83 ec 08             	sub    $0x8,%esp
c0009264:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000926a:	50                   	push   %eax
c000926b:	68 77 be 00 c0       	push   $0xc000be77
c0009270:	e8 78 05 00 00       	call   c00097ed <Printf>
c0009275:	83 c4 10             	add    $0x10,%esp
c0009278:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000927f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0009286:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000928c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000928f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009292:	0f b6 00             	movzbl (%eax),%eax
c0009295:	88 45 db             	mov    %al,-0x25(%ebp)
c0009298:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000929b:	0f b6 00             	movzbl (%eax),%eax
c000929e:	3c 20                	cmp    $0x20,%al
c00092a0:	74 1d                	je     c00092bf <simple_shell+0xd6>
c00092a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092a5:	0f b6 00             	movzbl (%eax),%eax
c00092a8:	84 c0                	test   %al,%al
c00092aa:	74 13                	je     c00092bf <simple_shell+0xd6>
c00092ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00092b0:	75 0d                	jne    c00092bf <simple_shell+0xd6>
c00092b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00092b8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00092bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092c2:	0f b6 00             	movzbl (%eax),%eax
c00092c5:	3c 20                	cmp    $0x20,%al
c00092c7:	74 0a                	je     c00092d3 <simple_shell+0xea>
c00092c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092cc:	0f b6 00             	movzbl (%eax),%eax
c00092cf:	84 c0                	test   %al,%al
c00092d1:	75 26                	jne    c00092f9 <simple_shell+0x110>
c00092d3:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00092d7:	75 20                	jne    c00092f9 <simple_shell+0x110>
c00092d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00092dc:	8d 50 01             	lea    0x1(%eax),%edx
c00092df:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00092e2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00092e5:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c00092ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092ef:	c6 00 00             	movb   $0x0,(%eax)
c00092f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00092f9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00092fd:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0009301:	75 8c                	jne    c000928f <simple_shell+0xa6>
c0009303:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009306:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c000930d:	00 00 00 00 
c0009311:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0009318:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c000931e:	83 ec 08             	sub    $0x8,%esp
c0009321:	6a 02                	push   $0x2
c0009323:	50                   	push   %eax
c0009324:	e8 6f cb ff ff       	call   c0005e98 <open>
c0009329:	83 c4 10             	add    $0x10,%esp
c000932c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000932f:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0009333:	75 54                	jne    c0009389 <simple_shell+0x1a0>
c0009335:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000933c:	eb 29                	jmp    c0009367 <simple_shell+0x17e>
c000933e:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0009344:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009347:	01 d0                	add    %edx,%eax
c0009349:	0f b6 00             	movzbl (%eax),%eax
c000934c:	0f be c0             	movsbl %al,%eax
c000934f:	83 ec 04             	sub    $0x4,%esp
c0009352:	50                   	push   %eax
c0009353:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009356:	68 86 be 00 c0       	push   $0xc000be86
c000935b:	e8 8d 04 00 00       	call   c00097ed <Printf>
c0009360:	83 c4 10             	add    $0x10,%esp
c0009363:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0009367:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c000936b:	7e d1                	jle    c000933e <simple_shell+0x155>
c000936d:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0009373:	83 ec 08             	sub    $0x8,%esp
c0009376:	50                   	push   %eax
c0009377:	68 8d be 00 c0       	push   $0xc000be8d
c000937c:	e8 6c 04 00 00       	call   c00097ed <Printf>
c0009381:	83 c4 10             	add    $0x10,%esp
c0009384:	e9 a5 fe ff ff       	jmp    c000922e <simple_shell+0x45>
c0009389:	e8 2a cd ff ff       	call   c00060b8 <fork>
c000938e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009391:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0009395:	7e 17                	jle    c00093ae <simple_shell+0x1c5>
c0009397:	83 ec 0c             	sub    $0xc,%esp
c000939a:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00093a0:	50                   	push   %eax
c00093a1:	e8 ab cc ff ff       	call   c0006051 <wait>
c00093a6:	83 c4 10             	add    $0x10,%esp
c00093a9:	e9 80 fe ff ff       	jmp    c000922e <simple_shell+0x45>
c00093ae:	83 ec 0c             	sub    $0xc,%esp
c00093b1:	68 93 be 00 c0       	push   $0xc000be93
c00093b6:	e8 32 04 00 00       	call   c00097ed <Printf>
c00093bb:	83 c4 10             	add    $0x10,%esp
c00093be:	83 ec 0c             	sub    $0xc,%esp
c00093c1:	ff 75 d0             	pushl  -0x30(%ebp)
c00093c4:	e8 3c cc ff ff       	call   c0006005 <close>
c00093c9:	83 c4 10             	add    $0x10,%esp
c00093cc:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00093d2:	83 ec 08             	sub    $0x8,%esp
c00093d5:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c00093db:	52                   	push   %edx
c00093dc:	50                   	push   %eax
c00093dd:	e8 c5 cd ff ff       	call   c00061a7 <execv>
c00093e2:	83 c4 10             	add    $0x10,%esp
c00093e5:	eb fe                	jmp    c00093e5 <simple_shell+0x1fc>

c00093e7 <test_split_str>:
c00093e7:	55                   	push   %ebp
c00093e8:	89 e5                	mov    %esp,%ebp
c00093ea:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c00093f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00093f7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00093fe:	c7 45 ec af be 00 c0 	movl   $0xc000beaf,-0x14(%ebp)
c0009405:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0009409:	75 1a                	jne    c0009425 <test_split_str+0x3e>
c000940b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000940e:	0f b6 00             	movzbl (%eax),%eax
c0009411:	0f be c0             	movsbl %al,%eax
c0009414:	83 ec 08             	sub    $0x8,%esp
c0009417:	50                   	push   %eax
c0009418:	68 c0 be 00 c0       	push   $0xc000bec0
c000941d:	e8 cb 03 00 00       	call   c00097ed <Printf>
c0009422:	83 c4 10             	add    $0x10,%esp
c0009425:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009428:	0f b6 00             	movzbl (%eax),%eax
c000942b:	3c 20                	cmp    $0x20,%al
c000942d:	75 0a                	jne    c0009439 <test_split_str+0x52>
c000942f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009432:	0f b6 00             	movzbl (%eax),%eax
c0009435:	84 c0                	test   %al,%al
c0009437:	74 13                	je     c000944c <test_split_str+0x65>
c0009439:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000943d:	75 0d                	jne    c000944c <test_split_str+0x65>
c000943f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009442:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009445:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000944c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000944f:	0f b6 00             	movzbl (%eax),%eax
c0009452:	3c 20                	cmp    $0x20,%al
c0009454:	74 0a                	je     c0009460 <test_split_str+0x79>
c0009456:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009459:	0f b6 00             	movzbl (%eax),%eax
c000945c:	84 c0                	test   %al,%al
c000945e:	75 26                	jne    c0009486 <test_split_str+0x9f>
c0009460:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0009464:	75 20                	jne    c0009486 <test_split_str+0x9f>
c0009466:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009469:	8d 50 01             	lea    0x1(%eax),%edx
c000946c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000946f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009472:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0009479:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000947c:	c6 00 00             	movb   $0x0,(%eax)
c000947f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0009486:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000948a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000948d:	0f b6 00             	movzbl (%eax),%eax
c0009490:	84 c0                	test   %al,%al
c0009492:	0f 85 6d ff ff ff    	jne    c0009405 <test_split_str+0x1e>
c0009498:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000949b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000949e:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00094a5:	83 ec 08             	sub    $0x8,%esp
c00094a8:	ff 75 f4             	pushl  -0xc(%ebp)
c00094ab:	68 c9 be 00 c0       	push   $0xc000bec9
c00094b0:	e8 38 03 00 00       	call   c00097ed <Printf>
c00094b5:	83 c4 10             	add    $0x10,%esp
c00094b8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00094bf:	eb 22                	jmp    c00094e3 <test_split_str+0xfc>
c00094c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00094c4:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c00094cb:	83 ec 04             	sub    $0x4,%esp
c00094ce:	50                   	push   %eax
c00094cf:	ff 75 e4             	pushl  -0x1c(%ebp)
c00094d2:	68 e0 be 00 c0       	push   $0xc000bee0
c00094d7:	e8 11 03 00 00       	call   c00097ed <Printf>
c00094dc:	83 c4 10             	add    $0x10,%esp
c00094df:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00094e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00094e6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c00094e9:	7e d6                	jle    c00094c1 <test_split_str+0xda>
c00094eb:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c00094f1:	83 ec 08             	sub    $0x8,%esp
c00094f4:	68 ef be 00 c0       	push   $0xc000beef
c00094f9:	50                   	push   %eax
c00094fa:	e8 d3 12 00 00       	call   c000a7d2 <strcmp>
c00094ff:	83 c4 10             	add    $0x10,%esp
c0009502:	85 c0                	test   %eax,%eax
c0009504:	75 10                	jne    c0009516 <test_split_str+0x12f>
c0009506:	83 ec 0c             	sub    $0xc,%esp
c0009509:	68 f4 be 00 c0       	push   $0xc000bef4
c000950e:	e8 da 02 00 00       	call   c00097ed <Printf>
c0009513:	83 c4 10             	add    $0x10,%esp
c0009516:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c000951c:	83 ec 08             	sub    $0x8,%esp
c000951f:	50                   	push   %eax
c0009520:	68 00 bf 00 c0       	push   $0xc000bf00
c0009525:	e8 c3 02 00 00       	call   c00097ed <Printf>
c000952a:	83 c4 10             	add    $0x10,%esp
c000952d:	83 ec 0c             	sub    $0xc,%esp
c0009530:	68 0e bf 00 c0       	push   $0xc000bf0e
c0009535:	e8 b3 02 00 00       	call   c00097ed <Printf>
c000953a:	83 c4 10             	add    $0x10,%esp
c000953d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009544:	eb 26                	jmp    c000956c <test_split_str+0x185>
c0009546:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c000954c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000954f:	01 d0                	add    %edx,%eax
c0009551:	0f b6 00             	movzbl (%eax),%eax
c0009554:	0f be c0             	movsbl %al,%eax
c0009557:	83 ec 08             	sub    $0x8,%esp
c000955a:	50                   	push   %eax
c000955b:	68 1d bf 00 c0       	push   $0xc000bf1d
c0009560:	e8 88 02 00 00       	call   c00097ed <Printf>
c0009565:	83 c4 10             	add    $0x10,%esp
c0009568:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000956c:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0009570:	7e d4                	jle    c0009546 <test_split_str+0x15f>
c0009572:	c9                   	leave  
c0009573:	c3                   	ret    

c0009574 <test_shell>:
c0009574:	55                   	push   %ebp
c0009575:	89 e5                	mov    %esp,%ebp
c0009577:	83 ec 38             	sub    $0x38,%esp
c000957a:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0009581:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0009588:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c000958e:	83 ec 08             	sub    $0x8,%esp
c0009591:	6a 02                	push   $0x2
c0009593:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0009596:	50                   	push   %eax
c0009597:	e8 fc c8 ff ff       	call   c0005e98 <open>
c000959c:	83 c4 10             	add    $0x10,%esp
c000959f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00095a2:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c00095a9:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c00095b0:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c00095b7:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00095be:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c00095c5:	83 ec 0c             	sub    $0xc,%esp
c00095c8:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c00095cb:	50                   	push   %eax
c00095cc:	e8 c7 e5 ff ff       	call   c0007b98 <untar>
c00095d1:	83 c4 10             	add    $0x10,%esp
c00095d4:	e8 10 fc ff ff       	call   c00091e9 <simple_shell>
c00095d9:	90                   	nop
c00095da:	c9                   	leave  
c00095db:	c3                   	ret    

c00095dc <test_exec>:
c00095dc:	55                   	push   %ebp
c00095dd:	89 e5                	mov    %esp,%ebp
c00095df:	83 ec 38             	sub    $0x38,%esp
c00095e2:	83 ec 0c             	sub    $0xc,%esp
c00095e5:	68 57 bd 00 c0       	push   $0xc000bd57
c00095ea:	e8 9d 7f ff ff       	call   c000158c <disp_str>
c00095ef:	83 c4 10             	add    $0x10,%esp
c00095f2:	83 ec 0c             	sub    $0xc,%esp
c00095f5:	68 59 bd 00 c0       	push   $0xc000bd59
c00095fa:	e8 8d 7f ff ff       	call   c000158c <disp_str>
c00095ff:	83 c4 10             	add    $0x10,%esp
c0009602:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0009609:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0009610:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0009616:	83 ec 08             	sub    $0x8,%esp
c0009619:	6a 02                	push   $0x2
c000961b:	8d 45 ea             	lea    -0x16(%ebp),%eax
c000961e:	50                   	push   %eax
c000961f:	e8 74 c8 ff ff       	call   c0005e98 <open>
c0009624:	83 c4 10             	add    $0x10,%esp
c0009627:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000962a:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c0009631:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0009638:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c000963f:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0009646:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c000964d:	83 ec 0c             	sub    $0xc,%esp
c0009650:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c0009653:	50                   	push   %eax
c0009654:	e8 3f e5 ff ff       	call   c0007b98 <untar>
c0009659:	83 c4 10             	add    $0x10,%esp
c000965c:	6a 00                	push   $0x0
c000965e:	68 26 bf 00 c0       	push   $0xc000bf26
c0009663:	68 ef be 00 c0       	push   $0xc000beef
c0009668:	68 2c bf 00 c0       	push   $0xc000bf2c
c000966d:	e8 fd cc ff ff       	call   c000636f <execl>
c0009672:	83 c4 10             	add    $0x10,%esp
c0009675:	eb fe                	jmp    c0009675 <test_exec+0x99>

c0009677 <INIT>:
c0009677:	55                   	push   %ebp
c0009678:	89 e5                	mov    %esp,%ebp
c000967a:	83 ec 08             	sub    $0x8,%esp
c000967d:	e8 f2 fe ff ff       	call   c0009574 <test_shell>
c0009682:	eb fe                	jmp    c0009682 <INIT+0xb>

c0009684 <TestA>:
c0009684:	55                   	push   %ebp
c0009685:	89 e5                	mov    %esp,%ebp
c0009687:	83 ec 08             	sub    $0x8,%esp
c000968a:	83 ec 0c             	sub    $0xc,%esp
c000968d:	6a 05                	push   $0x5
c000968f:	e8 ba e8 ff ff       	call   c0007f4e <disp_int>
c0009694:	83 c4 10             	add    $0x10,%esp
c0009697:	83 ec 0c             	sub    $0xc,%esp
c000969a:	68 4f ba 00 c0       	push   $0xc000ba4f
c000969f:	e8 e8 7e ff ff       	call   c000158c <disp_str>
c00096a4:	83 c4 10             	add    $0x10,%esp
c00096a7:	83 ec 0c             	sub    $0xc,%esp
c00096aa:	68 32 bf 00 c0       	push   $0xc000bf32
c00096af:	e8 d8 7e ff ff       	call   c000158c <disp_str>
c00096b4:	83 c4 10             	add    $0x10,%esp
c00096b7:	eb fe                	jmp    c00096b7 <TestA+0x33>

c00096b9 <delay>:
c00096b9:	55                   	push   %ebp
c00096ba:	89 e5                	mov    %esp,%ebp
c00096bc:	83 ec 10             	sub    $0x10,%esp
c00096bf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00096c6:	eb 2a                	jmp    c00096f2 <delay+0x39>
c00096c8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00096cf:	eb 17                	jmp    c00096e8 <delay+0x2f>
c00096d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00096d8:	eb 04                	jmp    c00096de <delay+0x25>
c00096da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00096de:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00096e2:	7e f6                	jle    c00096da <delay+0x21>
c00096e4:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00096e8:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c00096ec:	7e e3                	jle    c00096d1 <delay+0x18>
c00096ee:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00096f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00096f5:	3b 45 08             	cmp    0x8(%ebp),%eax
c00096f8:	7c ce                	jl     c00096c8 <delay+0xf>
c00096fa:	90                   	nop
c00096fb:	c9                   	leave  
c00096fc:	c3                   	ret    

c00096fd <TestB>:
c00096fd:	55                   	push   %ebp
c00096fe:	89 e5                	mov    %esp,%ebp
c0009700:	83 ec 08             	sub    $0x8,%esp
c0009703:	83 ec 0c             	sub    $0xc,%esp
c0009706:	68 39 bf 00 c0       	push   $0xc000bf39
c000970b:	e8 7c 7e ff ff       	call   c000158c <disp_str>
c0009710:	83 c4 10             	add    $0x10,%esp
c0009713:	eb fe                	jmp    c0009713 <TestB+0x16>

c0009715 <TestC>:
c0009715:	55                   	push   %ebp
c0009716:	89 e5                	mov    %esp,%ebp
c0009718:	83 ec 18             	sub    $0x18,%esp
c000971b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009722:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0009726:	77 1a                	ja     c0009742 <TestC+0x2d>
c0009728:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c000972f:	83 ec 08             	sub    $0x8,%esp
c0009732:	ff 75 f0             	pushl  -0x10(%ebp)
c0009735:	68 3c bf 00 c0       	push   $0xc000bf3c
c000973a:	e8 ae 00 00 00       	call   c00097ed <Printf>
c000973f:	83 c4 10             	add    $0x10,%esp
c0009742:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009746:	eb da                	jmp    c0009722 <TestC+0xd>

c0009748 <sys_get_ticks>:
c0009748:	55                   	push   %ebp
c0009749:	89 e5                	mov    %esp,%ebp
c000974b:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0009750:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0009756:	5d                   	pop    %ebp
c0009757:	c3                   	ret    

c0009758 <sys_write>:
c0009758:	55                   	push   %ebp
c0009759:	89 e5                	mov    %esp,%ebp
c000975b:	83 ec 18             	sub    $0x18,%esp
c000975e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009761:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009767:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c000976d:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0009772:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009775:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009778:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000977b:	8b 45 08             	mov    0x8(%ebp),%eax
c000977e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009781:	eb 20                	jmp    c00097a3 <sys_write+0x4b>
c0009783:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009786:	0f b6 00             	movzbl (%eax),%eax
c0009789:	0f b6 c0             	movzbl %al,%eax
c000978c:	83 ec 08             	sub    $0x8,%esp
c000978f:	50                   	push   %eax
c0009790:	ff 75 ec             	pushl  -0x14(%ebp)
c0009793:	e8 81 ba ff ff       	call   c0005219 <out_char>
c0009798:	83 c4 10             	add    $0x10,%esp
c000979b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000979f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c00097a3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00097a7:	7f da                	jg     c0009783 <sys_write+0x2b>
c00097a9:	90                   	nop
c00097aa:	c9                   	leave  
c00097ab:	c3                   	ret    

c00097ac <milli_delay>:
c00097ac:	55                   	push   %ebp
c00097ad:	89 e5                	mov    %esp,%ebp
c00097af:	83 ec 18             	sub    $0x18,%esp
c00097b2:	e8 47 0e 00 00       	call   c000a5fe <get_ticks_ipc>
c00097b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00097ba:	90                   	nop
c00097bb:	e8 3e 0e 00 00       	call   c000a5fe <get_ticks_ipc>
c00097c0:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00097c3:	89 c1                	mov    %eax,%ecx
c00097c5:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c00097ca:	89 c8                	mov    %ecx,%eax
c00097cc:	f7 ea                	imul   %edx
c00097ce:	c1 fa 05             	sar    $0x5,%edx
c00097d1:	89 c8                	mov    %ecx,%eax
c00097d3:	c1 f8 1f             	sar    $0x1f,%eax
c00097d6:	29 c2                	sub    %eax,%edx
c00097d8:	89 d0                	mov    %edx,%eax
c00097da:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c00097e0:	39 45 08             	cmp    %eax,0x8(%ebp)
c00097e3:	77 d6                	ja     c00097bb <milli_delay+0xf>
c00097e5:	90                   	nop
c00097e6:	c9                   	leave  
c00097e7:	c3                   	ret    

c00097e8 <TaskSys>:
c00097e8:	55                   	push   %ebp
c00097e9:	89 e5                	mov    %esp,%ebp
c00097eb:	eb fe                	jmp    c00097eb <TaskSys+0x3>

c00097ed <Printf>:
c00097ed:	55                   	push   %ebp
c00097ee:	89 e5                	mov    %esp,%ebp
c00097f0:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00097f6:	83 ec 04             	sub    $0x4,%esp
c00097f9:	68 00 01 00 00       	push   $0x100
c00097fe:	6a 00                	push   $0x0
c0009800:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009806:	50                   	push   %eax
c0009807:	e8 3f 2a 00 00       	call   c000c24b <Memset>
c000980c:	83 c4 10             	add    $0x10,%esp
c000980f:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009812:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009815:	8b 45 08             	mov    0x8(%ebp),%eax
c0009818:	83 ec 04             	sub    $0x4,%esp
c000981b:	ff 75 f4             	pushl  -0xc(%ebp)
c000981e:	50                   	push   %eax
c000981f:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009825:	50                   	push   %eax
c0009826:	e8 20 00 00 00       	call   c000984b <vsprintf>
c000982b:	83 c4 10             	add    $0x10,%esp
c000982e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009831:	83 ec 04             	sub    $0x4,%esp
c0009834:	ff 75 f0             	pushl  -0x10(%ebp)
c0009837:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000983d:	50                   	push   %eax
c000983e:	6a 00                	push   $0x0
c0009840:	e8 4c c7 ff ff       	call   c0005f91 <write>
c0009845:	83 c4 10             	add    $0x10,%esp
c0009848:	90                   	nop
c0009849:	c9                   	leave  
c000984a:	c3                   	ret    

c000984b <vsprintf>:
c000984b:	55                   	push   %ebp
c000984c:	89 e5                	mov    %esp,%ebp
c000984e:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0009854:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000985a:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0009860:	83 ec 04             	sub    $0x4,%esp
c0009863:	6a 40                	push   $0x40
c0009865:	6a 00                	push   $0x0
c0009867:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000986d:	50                   	push   %eax
c000986e:	e8 d8 29 00 00       	call   c000c24b <Memset>
c0009873:	83 c4 10             	add    $0x10,%esp
c0009876:	8b 45 10             	mov    0x10(%ebp),%eax
c0009879:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000987c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009883:	8b 45 08             	mov    0x8(%ebp),%eax
c0009886:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009889:	e9 53 01 00 00       	jmp    c00099e1 <vsprintf+0x196>
c000988e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009891:	0f b6 00             	movzbl (%eax),%eax
c0009894:	3c 25                	cmp    $0x25,%al
c0009896:	74 16                	je     c00098ae <vsprintf+0x63>
c0009898:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000989b:	8d 50 01             	lea    0x1(%eax),%edx
c000989e:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00098a1:	8b 55 0c             	mov    0xc(%ebp),%edx
c00098a4:	0f b6 12             	movzbl (%edx),%edx
c00098a7:	88 10                	mov    %dl,(%eax)
c00098a9:	e9 2f 01 00 00       	jmp    c00099dd <vsprintf+0x192>
c00098ae:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00098b2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00098b5:	0f b6 00             	movzbl (%eax),%eax
c00098b8:	0f be c0             	movsbl %al,%eax
c00098bb:	83 f8 64             	cmp    $0x64,%eax
c00098be:	74 26                	je     c00098e6 <vsprintf+0x9b>
c00098c0:	83 f8 64             	cmp    $0x64,%eax
c00098c3:	7f 0e                	jg     c00098d3 <vsprintf+0x88>
c00098c5:	83 f8 63             	cmp    $0x63,%eax
c00098c8:	0f 84 f2 00 00 00    	je     c00099c0 <vsprintf+0x175>
c00098ce:	e9 0a 01 00 00       	jmp    c00099dd <vsprintf+0x192>
c00098d3:	83 f8 73             	cmp    $0x73,%eax
c00098d6:	0f 84 b0 00 00 00    	je     c000998c <vsprintf+0x141>
c00098dc:	83 f8 78             	cmp    $0x78,%eax
c00098df:	74 5d                	je     c000993e <vsprintf+0xf3>
c00098e1:	e9 f7 00 00 00       	jmp    c00099dd <vsprintf+0x192>
c00098e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00098e9:	8b 00                	mov    (%eax),%eax
c00098eb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00098ee:	83 ec 04             	sub    $0x4,%esp
c00098f1:	6a 0a                	push   $0xa
c00098f3:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c00098f9:	50                   	push   %eax
c00098fa:	ff 75 e8             	pushl  -0x18(%ebp)
c00098fd:	e8 47 0d 00 00       	call   c000a649 <itoa>
c0009902:	83 c4 10             	add    $0x10,%esp
c0009905:	83 ec 08             	sub    $0x8,%esp
c0009908:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c000990e:	50                   	push   %eax
c000990f:	ff 75 f4             	pushl  -0xc(%ebp)
c0009912:	e8 53 29 00 00       	call   c000c26a <Strcpy>
c0009917:	83 c4 10             	add    $0x10,%esp
c000991a:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000991e:	83 ec 0c             	sub    $0xc,%esp
c0009921:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009927:	50                   	push   %eax
c0009928:	e8 57 29 00 00       	call   c000c284 <Strlen>
c000992d:	83 c4 10             	add    $0x10,%esp
c0009930:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009933:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009936:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009939:	e9 9f 00 00 00       	jmp    c00099dd <vsprintf+0x192>
c000993e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009941:	8b 00                	mov    (%eax),%eax
c0009943:	83 ec 08             	sub    $0x8,%esp
c0009946:	50                   	push   %eax
c0009947:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000994d:	50                   	push   %eax
c000994e:	e8 55 e5 ff ff       	call   c0007ea8 <atoi>
c0009953:	83 c4 10             	add    $0x10,%esp
c0009956:	83 ec 08             	sub    $0x8,%esp
c0009959:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000995f:	50                   	push   %eax
c0009960:	ff 75 f4             	pushl  -0xc(%ebp)
c0009963:	e8 02 29 00 00       	call   c000c26a <Strcpy>
c0009968:	83 c4 10             	add    $0x10,%esp
c000996b:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000996f:	83 ec 0c             	sub    $0xc,%esp
c0009972:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009978:	50                   	push   %eax
c0009979:	e8 06 29 00 00       	call   c000c284 <Strlen>
c000997e:	83 c4 10             	add    $0x10,%esp
c0009981:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009984:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009987:	01 45 f4             	add    %eax,-0xc(%ebp)
c000998a:	eb 51                	jmp    c00099dd <vsprintf+0x192>
c000998c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000998f:	8b 00                	mov    (%eax),%eax
c0009991:	83 ec 08             	sub    $0x8,%esp
c0009994:	50                   	push   %eax
c0009995:	ff 75 f4             	pushl  -0xc(%ebp)
c0009998:	e8 cd 28 00 00       	call   c000c26a <Strcpy>
c000999d:	83 c4 10             	add    $0x10,%esp
c00099a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099a3:	8b 00                	mov    (%eax),%eax
c00099a5:	83 ec 0c             	sub    $0xc,%esp
c00099a8:	50                   	push   %eax
c00099a9:	e8 d6 28 00 00       	call   c000c284 <Strlen>
c00099ae:	83 c4 10             	add    $0x10,%esp
c00099b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00099b4:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00099b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099bb:	01 45 f4             	add    %eax,-0xc(%ebp)
c00099be:	eb 1d                	jmp    c00099dd <vsprintf+0x192>
c00099c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00099c3:	0f b6 10             	movzbl (%eax),%edx
c00099c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00099c9:	88 10                	mov    %dl,(%eax)
c00099cb:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00099cf:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00099d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00099d9:	01 45 f4             	add    %eax,-0xc(%ebp)
c00099dc:	90                   	nop
c00099dd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00099e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00099e4:	0f b6 00             	movzbl (%eax),%eax
c00099e7:	84 c0                	test   %al,%al
c00099e9:	0f 85 9f fe ff ff    	jne    c000988e <vsprintf+0x43>
c00099ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00099f2:	2b 45 08             	sub    0x8(%ebp),%eax
c00099f5:	c9                   	leave  
c00099f6:	c3                   	ret    

c00099f7 <printx>:
c00099f7:	55                   	push   %ebp
c00099f8:	89 e5                	mov    %esp,%ebp
c00099fa:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009a00:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009a03:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009a06:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a09:	83 ec 04             	sub    $0x4,%esp
c0009a0c:	ff 75 f4             	pushl  -0xc(%ebp)
c0009a0f:	50                   	push   %eax
c0009a10:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009a16:	50                   	push   %eax
c0009a17:	e8 2f fe ff ff       	call   c000984b <vsprintf>
c0009a1c:	83 c4 10             	add    $0x10,%esp
c0009a1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a22:	83 ec 08             	sub    $0x8,%esp
c0009a25:	ff 75 f0             	pushl  -0x10(%ebp)
c0009a28:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009a2e:	50                   	push   %eax
c0009a2f:	e8 34 8f ff ff       	call   c0002968 <write_debug>
c0009a34:	83 c4 10             	add    $0x10,%esp
c0009a37:	90                   	nop
c0009a38:	c9                   	leave  
c0009a39:	c3                   	ret    

c0009a3a <sys_printx>:
c0009a3a:	55                   	push   %ebp
c0009a3b:	89 e5                	mov    %esp,%ebp
c0009a3d:	83 ec 28             	sub    $0x28,%esp
c0009a40:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009a45:	85 c0                	test   %eax,%eax
c0009a47:	75 15                	jne    c0009a5e <sys_printx+0x24>
c0009a49:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a4c:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009a52:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009a55:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009a5c:	eb 10                	jmp    c0009a6e <sys_printx+0x34>
c0009a5e:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009a63:	85 c0                	test   %eax,%eax
c0009a65:	74 07                	je     c0009a6e <sys_printx+0x34>
c0009a67:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009a6e:	8b 55 08             	mov    0x8(%ebp),%edx
c0009a71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a74:	01 d0                	add    %edx,%eax
c0009a76:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009a79:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a7c:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009a82:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009a88:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0009a8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009a90:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009a93:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009a99:	0f b6 00             	movzbl (%eax),%eax
c0009a9c:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0009a9f:	eb 3a                	jmp    c0009adb <sys_printx+0xa1>
c0009aa1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009aa4:	0f b6 00             	movzbl (%eax),%eax
c0009aa7:	3c 3b                	cmp    $0x3b,%al
c0009aa9:	74 0a                	je     c0009ab5 <sys_printx+0x7b>
c0009aab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009aae:	0f b6 00             	movzbl (%eax),%eax
c0009ab1:	3c 3a                	cmp    $0x3a,%al
c0009ab3:	75 06                	jne    c0009abb <sys_printx+0x81>
c0009ab5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009ab9:	eb 20                	jmp    c0009adb <sys_printx+0xa1>
c0009abb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009abe:	0f b6 00             	movzbl (%eax),%eax
c0009ac1:	0f b6 c0             	movzbl %al,%eax
c0009ac4:	83 ec 08             	sub    $0x8,%esp
c0009ac7:	50                   	push   %eax
c0009ac8:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009acb:	e8 49 b7 ff ff       	call   c0005219 <out_char>
c0009ad0:	83 c4 10             	add    $0x10,%esp
c0009ad3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009ad7:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009adb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009adf:	7f c0                	jg     c0009aa1 <sys_printx+0x67>
c0009ae1:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009ae5:	75 10                	jne    c0009af7 <sys_printx+0xbd>
c0009ae7:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009aec:	85 c0                	test   %eax,%eax
c0009aee:	74 13                	je     c0009b03 <sys_printx+0xc9>
c0009af0:	e8 c6 7c ff ff       	call   c00017bb <disable_int>
c0009af5:	eb 0c                	jmp    c0009b03 <sys_printx+0xc9>
c0009af7:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009afb:	75 06                	jne    c0009b03 <sys_printx+0xc9>
c0009afd:	e8 b9 7c ff ff       	call   c00017bb <disable_int>
c0009b02:	90                   	nop
c0009b03:	90                   	nop
c0009b04:	c9                   	leave  
c0009b05:	c3                   	ret    

c0009b06 <spin>:
c0009b06:	55                   	push   %ebp
c0009b07:	89 e5                	mov    %esp,%ebp
c0009b09:	83 ec 08             	sub    $0x8,%esp
c0009b0c:	83 ec 0c             	sub    $0xc,%esp
c0009b0f:	ff 75 08             	pushl  0x8(%ebp)
c0009b12:	e8 75 7a ff ff       	call   c000158c <disp_str>
c0009b17:	83 c4 10             	add    $0x10,%esp
c0009b1a:	83 ec 0c             	sub    $0xc,%esp
c0009b1d:	68 4f ba 00 c0       	push   $0xc000ba4f
c0009b22:	e8 65 7a ff ff       	call   c000158c <disp_str>
c0009b27:	83 c4 10             	add    $0x10,%esp
c0009b2a:	eb fe                	jmp    c0009b2a <spin+0x24>

c0009b2c <panic>:
c0009b2c:	55                   	push   %ebp
c0009b2d:	89 e5                	mov    %esp,%ebp
c0009b2f:	83 ec 08             	sub    $0x8,%esp
c0009b32:	83 ec 04             	sub    $0x4,%esp
c0009b35:	ff 75 08             	pushl  0x8(%ebp)
c0009b38:	6a 3a                	push   $0x3a
c0009b3a:	68 49 bf 00 c0       	push   $0xc000bf49
c0009b3f:	e8 b3 fe ff ff       	call   c00099f7 <printx>
c0009b44:	83 c4 10             	add    $0x10,%esp
c0009b47:	90                   	nop
c0009b48:	c9                   	leave  
c0009b49:	c3                   	ret    

c0009b4a <assertion_failure>:
c0009b4a:	55                   	push   %ebp
c0009b4b:	89 e5                	mov    %esp,%ebp
c0009b4d:	83 ec 08             	sub    $0x8,%esp
c0009b50:	83 ec 08             	sub    $0x8,%esp
c0009b53:	ff 75 14             	pushl  0x14(%ebp)
c0009b56:	ff 75 10             	pushl  0x10(%ebp)
c0009b59:	ff 75 0c             	pushl  0xc(%ebp)
c0009b5c:	ff 75 08             	pushl  0x8(%ebp)
c0009b5f:	6a 3b                	push   $0x3b
c0009b61:	68 50 bf 00 c0       	push   $0xc000bf50
c0009b66:	e8 8c fe ff ff       	call   c00099f7 <printx>
c0009b6b:	83 c4 20             	add    $0x20,%esp
c0009b6e:	83 ec 0c             	sub    $0xc,%esp
c0009b71:	68 83 bf 00 c0       	push   $0xc000bf83
c0009b76:	e8 8b ff ff ff       	call   c0009b06 <spin>
c0009b7b:	83 c4 10             	add    $0x10,%esp
c0009b7e:	90                   	nop
c0009b7f:	c9                   	leave  
c0009b80:	c3                   	ret    

c0009b81 <dead_lock>:
c0009b81:	55                   	push   %ebp
c0009b82:	89 e5                	mov    %esp,%ebp
c0009b84:	b8 00 00 00 00       	mov    $0x0,%eax
c0009b89:	5d                   	pop    %ebp
c0009b8a:	c3                   	ret    

c0009b8b <sys_send_msg>:
c0009b8b:	55                   	push   %ebp
c0009b8c:	89 e5                	mov    %esp,%ebp
c0009b8e:	83 ec 38             	sub    $0x38,%esp
c0009b91:	83 ec 0c             	sub    $0xc,%esp
c0009b94:	ff 75 0c             	pushl  0xc(%ebp)
c0009b97:	e8 0a b0 ff ff       	call   c0004ba6 <pid2proc>
c0009b9c:	83 c4 10             	add    $0x10,%esp
c0009b9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009ba2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009ba6:	74 2c                	je     c0009bd4 <sys_send_msg+0x49>
c0009ba8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009bab:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009bb1:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009bb6:	74 1c                	je     c0009bd4 <sys_send_msg+0x49>
c0009bb8:	68 06 06 00 00       	push   $0x606
c0009bbd:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009bc2:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009bc7:	68 a0 bf 00 c0       	push   $0xc000bfa0
c0009bcc:	e8 79 ff ff ff       	call   c0009b4a <assertion_failure>
c0009bd1:	83 c4 10             	add    $0x10,%esp
c0009bd4:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bd7:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009bdd:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009be2:	74 1c                	je     c0009c00 <sys_send_msg+0x75>
c0009be4:	68 08 06 00 00       	push   $0x608
c0009be9:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009bee:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009bf3:	68 c8 bf 00 c0       	push   $0xc000bfc8
c0009bf8:	e8 4d ff ff ff       	call   c0009b4a <assertion_failure>
c0009bfd:	83 c4 10             	add    $0x10,%esp
c0009c00:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009c04:	75 22                	jne    c0009c28 <sys_send_msg+0x9d>
c0009c06:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009c0a:	75 1c                	jne    c0009c28 <sys_send_msg+0x9d>
c0009c0c:	68 0b 06 00 00       	push   $0x60b
c0009c11:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009c16:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009c1b:	68 eb bf 00 c0       	push   $0xc000bfeb
c0009c20:	e8 25 ff ff ff       	call   c0009b4a <assertion_failure>
c0009c25:	83 c4 10             	add    $0x10,%esp
c0009c28:	83 ec 0c             	sub    $0xc,%esp
c0009c2b:	ff 75 10             	pushl  0x10(%ebp)
c0009c2e:	e8 e5 af ff ff       	call   c0004c18 <proc2pid>
c0009c33:	83 c4 10             	add    $0x10,%esp
c0009c36:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009c39:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c3c:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009c42:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009c45:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009c4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c4f:	83 ec 08             	sub    $0x8,%esp
c0009c52:	6a 6c                	push   $0x6c
c0009c54:	50                   	push   %eax
c0009c55:	e8 a2 d2 ff ff       	call   c0006efc <alloc_virtual_memory>
c0009c5a:	83 c4 10             	add    $0x10,%esp
c0009c5d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009c60:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0009c67:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009c6a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009c6d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009c70:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009c73:	89 10                	mov    %edx,(%eax)
c0009c75:	83 ec 08             	sub    $0x8,%esp
c0009c78:	ff 75 0c             	pushl  0xc(%ebp)
c0009c7b:	ff 75 e8             	pushl  -0x18(%ebp)
c0009c7e:	e8 fe fe ff ff       	call   c0009b81 <dead_lock>
c0009c83:	83 c4 10             	add    $0x10,%esp
c0009c86:	83 f8 01             	cmp    $0x1,%eax
c0009c89:	75 10                	jne    c0009c9b <sys_send_msg+0x110>
c0009c8b:	83 ec 0c             	sub    $0xc,%esp
c0009c8e:	68 fb bf 00 c0       	push   $0xc000bffb
c0009c93:	e8 94 fe ff ff       	call   c0009b2c <panic>
c0009c98:	83 c4 10             	add    $0x10,%esp
c0009c9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009c9e:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ca5:	3c 02                	cmp    $0x2,%al
c0009ca7:	0f 85 99 01 00 00    	jne    c0009e46 <sys_send_msg+0x2bb>
c0009cad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cb0:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009cb6:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0009cb9:	74 12                	je     c0009ccd <sys_send_msg+0x142>
c0009cbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cbe:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009cc4:	83 f8 12             	cmp    $0x12,%eax
c0009cc7:	0f 85 79 01 00 00    	jne    c0009e46 <sys_send_msg+0x2bb>
c0009ccd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cd0:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009cd6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009cd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009cdc:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009ce2:	83 ec 08             	sub    $0x8,%esp
c0009ce5:	6a 6c                	push   $0x6c
c0009ce7:	50                   	push   %eax
c0009ce8:	e8 0f d2 ff ff       	call   c0006efc <alloc_virtual_memory>
c0009ced:	83 c4 10             	add    $0x10,%esp
c0009cf0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009cf3:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009cf6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009cf9:	83 ec 04             	sub    $0x4,%esp
c0009cfc:	ff 75 d8             	pushl  -0x28(%ebp)
c0009cff:	52                   	push   %edx
c0009d00:	50                   	push   %eax
c0009d01:	e8 5f de ff ff       	call   c0007b65 <Memcpy>
c0009d06:	83 c4 10             	add    $0x10,%esp
c0009d09:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d0c:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d13:	00 00 00 
c0009d16:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d19:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009d20:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d23:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009d2a:	00 00 00 
c0009d2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d30:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009d37:	00 00 00 
c0009d3a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d3d:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009d44:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d47:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009d4e:	00 00 00 
c0009d51:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d54:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009d5b:	00 00 00 
c0009d5e:	83 ec 0c             	sub    $0xc,%esp
c0009d61:	ff 75 ec             	pushl  -0x14(%ebp)
c0009d64:	e8 45 08 00 00       	call   c000a5ae <unblock>
c0009d69:	83 c4 10             	add    $0x10,%esp
c0009d6c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d6f:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009d76:	84 c0                	test   %al,%al
c0009d78:	74 1c                	je     c0009d96 <sys_send_msg+0x20b>
c0009d7a:	68 3c 06 00 00       	push   $0x63c
c0009d7f:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009d84:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009d89:	68 06 c0 00 c0       	push   $0xc000c006
c0009d8e:	e8 b7 fd ff ff       	call   c0009b4a <assertion_failure>
c0009d93:	83 c4 10             	add    $0x10,%esp
c0009d96:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d99:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d9f:	83 f8 21             	cmp    $0x21,%eax
c0009da2:	74 1c                	je     c0009dc0 <sys_send_msg+0x235>
c0009da4:	68 3d 06 00 00       	push   $0x63d
c0009da9:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009dae:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009db3:	68 1a c0 00 c0       	push   $0xc000c01a
c0009db8:	e8 8d fd ff ff       	call   c0009b4a <assertion_failure>
c0009dbd:	83 c4 10             	add    $0x10,%esp
c0009dc0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009dc3:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009dc9:	85 c0                	test   %eax,%eax
c0009dcb:	74 1c                	je     c0009de9 <sys_send_msg+0x25e>
c0009dcd:	68 3f 06 00 00       	push   $0x63f
c0009dd2:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009dd7:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009ddc:	68 37 c0 00 c0       	push   $0xc000c037
c0009de1:	e8 64 fd ff ff       	call   c0009b4a <assertion_failure>
c0009de6:	83 c4 10             	add    $0x10,%esp
c0009de9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009dec:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009df3:	84 c0                	test   %al,%al
c0009df5:	74 1c                	je     c0009e13 <sys_send_msg+0x288>
c0009df7:	68 40 06 00 00       	push   $0x640
c0009dfc:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009e01:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009e06:	68 4c c0 00 c0       	push   $0xc000c04c
c0009e0b:	e8 3a fd ff ff       	call   c0009b4a <assertion_failure>
c0009e10:	83 c4 10             	add    $0x10,%esp
c0009e13:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e16:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009e1c:	83 f8 21             	cmp    $0x21,%eax
c0009e1f:	0f 84 45 01 00 00    	je     c0009f6a <sys_send_msg+0x3df>
c0009e25:	68 41 06 00 00       	push   $0x641
c0009e2a:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009e2f:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009e34:	68 64 c0 00 c0       	push   $0xc000c064
c0009e39:	e8 0c fd ff ff       	call   c0009b4a <assertion_failure>
c0009e3e:	83 c4 10             	add    $0x10,%esp
c0009e41:	e9 24 01 00 00       	jmp    c0009f6a <sys_send_msg+0x3df>
c0009e46:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009e4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e50:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009e53:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e56:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009e5c:	85 c0                	test   %eax,%eax
c0009e5e:	75 1b                	jne    c0009e7b <sys_send_msg+0x2f0>
c0009e60:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e63:	8b 55 10             	mov    0x10(%ebp),%edx
c0009e66:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009e6c:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e6f:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009e76:	00 00 00 
c0009e79:	eb 3f                	jmp    c0009eba <sys_send_msg+0x32f>
c0009e7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e7e:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009e84:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009e87:	eb 12                	jmp    c0009e9b <sys_send_msg+0x310>
c0009e89:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e8c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009e8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e92:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009e98:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009e9b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009e9f:	75 e8                	jne    c0009e89 <sys_send_msg+0x2fe>
c0009ea1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ea4:	8b 55 10             	mov    0x10(%ebp),%edx
c0009ea7:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c0009ead:	8b 45 10             	mov    0x10(%ebp),%eax
c0009eb0:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009eb7:	00 00 00 
c0009eba:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ebd:	8b 55 08             	mov    0x8(%ebp),%edx
c0009ec0:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009ec6:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ec9:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009ecc:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009ed2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ed5:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c0009edc:	8b 45 10             	mov    0x10(%ebp),%eax
c0009edf:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ee6:	3c 01                	cmp    $0x1,%al
c0009ee8:	74 1c                	je     c0009f06 <sys_send_msg+0x37b>
c0009eea:	68 62 06 00 00       	push   $0x662
c0009eef:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009ef4:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009ef9:	68 88 c0 00 c0       	push   $0xc000c088
c0009efe:	e8 47 fc ff ff       	call   c0009b4a <assertion_failure>
c0009f03:	83 c4 10             	add    $0x10,%esp
c0009f06:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f09:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009f0f:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0009f12:	74 1c                	je     c0009f30 <sys_send_msg+0x3a5>
c0009f14:	68 63 06 00 00       	push   $0x663
c0009f19:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009f1e:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009f23:	68 a4 c0 00 c0       	push   $0xc000c0a4
c0009f28:	e8 1d fc ff ff       	call   c0009b4a <assertion_failure>
c0009f2d:	83 c4 10             	add    $0x10,%esp
c0009f30:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f33:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009f39:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009f3c:	74 1c                	je     c0009f5a <sys_send_msg+0x3cf>
c0009f3e:	68 64 06 00 00       	push   $0x664
c0009f43:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009f48:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009f4d:	68 c6 c0 00 c0       	push   $0xc000c0c6
c0009f52:	e8 f3 fb ff ff       	call   c0009b4a <assertion_failure>
c0009f57:	83 c4 10             	add    $0x10,%esp
c0009f5a:	83 ec 0c             	sub    $0xc,%esp
c0009f5d:	ff 75 10             	pushl  0x10(%ebp)
c0009f60:	e8 0d 06 00 00       	call   c000a572 <block>
c0009f65:	83 c4 10             	add    $0x10,%esp
c0009f68:	eb 01                	jmp    c0009f6b <sys_send_msg+0x3e0>
c0009f6a:	90                   	nop
c0009f6b:	b8 00 00 00 00       	mov    $0x0,%eax
c0009f70:	c9                   	leave  
c0009f71:	c3                   	ret    

c0009f72 <sys_receive_msg>:
c0009f72:	55                   	push   %ebp
c0009f73:	89 e5                	mov    %esp,%ebp
c0009f75:	83 ec 48             	sub    $0x48,%esp
c0009f78:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009f7f:	83 ec 0c             	sub    $0xc,%esp
c0009f82:	ff 75 0c             	pushl  0xc(%ebp)
c0009f85:	e8 1c ac ff ff       	call   c0004ba6 <pid2proc>
c0009f8a:	83 c4 10             	add    $0x10,%esp
c0009f8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009f90:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0009f94:	74 2c                	je     c0009fc2 <sys_receive_msg+0x50>
c0009f96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009f99:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009f9f:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009fa4:	74 1c                	je     c0009fc2 <sys_receive_msg+0x50>
c0009fa6:	68 78 06 00 00       	push   $0x678
c0009fab:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009fb0:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009fb5:	68 c8 bf 00 c0       	push   $0xc000bfc8
c0009fba:	e8 8b fb ff ff       	call   c0009b4a <assertion_failure>
c0009fbf:	83 c4 10             	add    $0x10,%esp
c0009fc2:	8b 45 10             	mov    0x10(%ebp),%eax
c0009fc5:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009fcb:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009fd0:	74 1c                	je     c0009fee <sys_receive_msg+0x7c>
c0009fd2:	68 7a 06 00 00       	push   $0x67a
c0009fd7:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009fdc:	68 8f bf 00 c0       	push   $0xc000bf8f
c0009fe1:	68 a0 bf 00 c0       	push   $0xc000bfa0
c0009fe6:	e8 5f fb ff ff       	call   c0009b4a <assertion_failure>
c0009feb:	83 c4 10             	add    $0x10,%esp
c0009fee:	83 ec 0c             	sub    $0xc,%esp
c0009ff1:	ff 75 10             	pushl  0x10(%ebp)
c0009ff4:	e8 1f ac ff ff       	call   c0004c18 <proc2pid>
c0009ff9:	83 c4 10             	add    $0x10,%esp
c0009ffc:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009fff:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a006:	8b 45 10             	mov    0x10(%ebp),%eax
c000a009:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c000a00f:	85 c0                	test   %eax,%eax
c000a011:	0f 84 b5 00 00 00    	je     c000a0cc <sys_receive_msg+0x15a>
c000a017:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a01b:	74 0d                	je     c000a02a <sys_receive_msg+0xb8>
c000a01d:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c000a024:	0f 85 a2 00 00 00    	jne    c000a0cc <sys_receive_msg+0x15a>
c000a02a:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c000a031:	83 ec 0c             	sub    $0xc,%esp
c000a034:	ff 75 dc             	pushl  -0x24(%ebp)
c000a037:	e8 88 89 ff ff       	call   c00029c4 <sys_malloc>
c000a03c:	83 c4 10             	add    $0x10,%esp
c000a03f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a042:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a045:	83 ec 04             	sub    $0x4,%esp
c000a048:	50                   	push   %eax
c000a049:	6a 00                	push   $0x0
c000a04b:	ff 75 d8             	pushl  -0x28(%ebp)
c000a04e:	e8 f8 21 00 00       	call   c000c24b <Memset>
c000a053:	83 c4 10             	add    $0x10,%esp
c000a056:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a059:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a05f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a062:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000a069:	8b 45 08             	mov    0x8(%ebp),%eax
c000a06c:	83 ec 08             	sub    $0x8,%esp
c000a06f:	ff 75 dc             	pushl  -0x24(%ebp)
c000a072:	50                   	push   %eax
c000a073:	e8 84 ce ff ff       	call   c0006efc <alloc_virtual_memory>
c000a078:	83 c4 10             	add    $0x10,%esp
c000a07b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a07e:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000a081:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000a084:	83 ec 04             	sub    $0x4,%esp
c000a087:	52                   	push   %edx
c000a088:	ff 75 d8             	pushl  -0x28(%ebp)
c000a08b:	50                   	push   %eax
c000a08c:	e8 d4 da ff ff       	call   c0007b65 <Memcpy>
c000a091:	83 c4 10             	add    $0x10,%esp
c000a094:	8b 45 10             	mov    0x10(%ebp),%eax
c000a097:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a09e:	00 00 00 
c000a0a1:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0a4:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a0ab:	00 00 00 
c000a0ae:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0b1:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a0b8:	00 00 00 
c000a0bb:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0be:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a0c5:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000a0cc:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000a0d0:	0f 84 96 03 00 00    	je     c000a46c <sys_receive_msg+0x4fa>
c000a0d6:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a0da:	75 26                	jne    c000a102 <sys_receive_msg+0x190>
c000a0dc:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0df:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a0e5:	85 c0                	test   %eax,%eax
c000a0e7:	0f 84 8a 00 00 00    	je     c000a177 <sys_receive_msg+0x205>
c000a0ed:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0f0:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a0f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0f9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a100:	eb 75                	jmp    c000a177 <sys_receive_msg+0x205>
c000a102:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a106:	78 6f                	js     c000a177 <sys_receive_msg+0x205>
c000a108:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c000a10c:	7f 69                	jg     c000a177 <sys_receive_msg+0x205>
c000a10e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a111:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a118:	3c 01                	cmp    $0x1,%al
c000a11a:	75 5b                	jne    c000a177 <sys_receive_msg+0x205>
c000a11c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a11f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a125:	83 f8 12             	cmp    $0x12,%eax
c000a128:	74 0e                	je     c000a138 <sys_receive_msg+0x1c6>
c000a12a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a12d:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a133:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c000a136:	75 3f                	jne    c000a177 <sys_receive_msg+0x205>
c000a138:	8b 45 10             	mov    0x10(%ebp),%eax
c000a13b:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a141:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a144:	eb 2b                	jmp    c000a171 <sys_receive_msg+0x1ff>
c000a146:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a149:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a14c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a14f:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c000a155:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a158:	39 c2                	cmp    %eax,%edx
c000a15a:	75 09                	jne    c000a165 <sys_receive_msg+0x1f3>
c000a15c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a163:	eb 12                	jmp    c000a177 <sys_receive_msg+0x205>
c000a165:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a168:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c000a16e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a171:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a175:	75 cf                	jne    c000a146 <sys_receive_msg+0x1d4>
c000a177:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000a17b:	0f 85 21 02 00 00    	jne    c000a3a2 <sys_receive_msg+0x430>
c000a181:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a184:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a187:	8b 45 08             	mov    0x8(%ebp),%eax
c000a18a:	83 ec 08             	sub    $0x8,%esp
c000a18d:	6a 6c                	push   $0x6c
c000a18f:	50                   	push   %eax
c000a190:	e8 67 cd ff ff       	call   c0006efc <alloc_virtual_memory>
c000a195:	83 c4 10             	add    $0x10,%esp
c000a198:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a19b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a19e:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a1a4:	83 ec 08             	sub    $0x8,%esp
c000a1a7:	6a 6c                	push   $0x6c
c000a1a9:	50                   	push   %eax
c000a1aa:	e8 4d cd ff ff       	call   c0006efc <alloc_virtual_memory>
c000a1af:	83 c4 10             	add    $0x10,%esp
c000a1b2:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a1b5:	83 ec 04             	sub    $0x4,%esp
c000a1b8:	6a 6c                	push   $0x6c
c000a1ba:	ff 75 c8             	pushl  -0x38(%ebp)
c000a1bd:	ff 75 cc             	pushl  -0x34(%ebp)
c000a1c0:	e8 a0 d9 ff ff       	call   c0007b65 <Memcpy>
c000a1c5:	83 c4 10             	add    $0x10,%esp
c000a1c8:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a1cb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a1ce:	8b 45 10             	mov    0x10(%ebp),%eax
c000a1d1:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a1d7:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000a1da:	75 21                	jne    c000a1fd <sys_receive_msg+0x28b>
c000a1dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1df:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a1e5:	8b 45 10             	mov    0x10(%ebp),%eax
c000a1e8:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000a1ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1f1:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a1f8:	00 00 00 
c000a1fb:	eb 1f                	jmp    c000a21c <sys_receive_msg+0x2aa>
c000a1fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a200:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a206:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a209:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000a20f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a212:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a219:	00 00 00 
c000a21c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a21f:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a226:	00 00 00 
c000a229:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a22c:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a233:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a236:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a23d:	00 00 00 
c000a240:	8b 45 10             	mov    0x10(%ebp),%eax
c000a243:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a24a:	00 00 00 
c000a24d:	8b 45 10             	mov    0x10(%ebp),%eax
c000a250:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a257:	00 00 00 
c000a25a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a25d:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a264:	00 00 00 
c000a267:	83 ec 0c             	sub    $0xc,%esp
c000a26a:	ff 75 d0             	pushl  -0x30(%ebp)
c000a26d:	e8 3c 03 00 00       	call   c000a5ae <unblock>
c000a272:	83 c4 10             	add    $0x10,%esp
c000a275:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a278:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a27e:	85 c0                	test   %eax,%eax
c000a280:	74 1c                	je     c000a29e <sys_receive_msg+0x32c>
c000a282:	68 e4 06 00 00       	push   $0x6e4
c000a287:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a28c:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a291:	68 db c0 00 c0       	push   $0xc000c0db
c000a296:	e8 af f8 ff ff       	call   c0009b4a <assertion_failure>
c000a29b:	83 c4 10             	add    $0x10,%esp
c000a29e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a2a1:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a2a8:	84 c0                	test   %al,%al
c000a2aa:	74 1c                	je     c000a2c8 <sys_receive_msg+0x356>
c000a2ac:	68 e5 06 00 00       	push   $0x6e5
c000a2b1:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a2b6:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a2bb:	68 f3 c0 00 c0       	push   $0xc000c0f3
c000a2c0:	e8 85 f8 ff ff       	call   c0009b4a <assertion_failure>
c000a2c5:	83 c4 10             	add    $0x10,%esp
c000a2c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a2cb:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a2d1:	83 f8 21             	cmp    $0x21,%eax
c000a2d4:	74 1c                	je     c000a2f2 <sys_receive_msg+0x380>
c000a2d6:	68 e6 06 00 00       	push   $0x6e6
c000a2db:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a2e0:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a2e5:	68 0c c1 00 c0       	push   $0xc000c10c
c000a2ea:	e8 5b f8 ff ff       	call   c0009b4a <assertion_failure>
c000a2ef:	83 c4 10             	add    $0x10,%esp
c000a2f2:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2f5:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a2fb:	85 c0                	test   %eax,%eax
c000a2fd:	74 1c                	je     c000a31b <sys_receive_msg+0x3a9>
c000a2ff:	68 e8 06 00 00       	push   $0x6e8
c000a304:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a309:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a30e:	68 37 c0 00 c0       	push   $0xc000c037
c000a313:	e8 32 f8 ff ff       	call   c0009b4a <assertion_failure>
c000a318:	83 c4 10             	add    $0x10,%esp
c000a31b:	8b 45 10             	mov    0x10(%ebp),%eax
c000a31e:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a325:	84 c0                	test   %al,%al
c000a327:	74 1c                	je     c000a345 <sys_receive_msg+0x3d3>
c000a329:	68 e9 06 00 00       	push   $0x6e9
c000a32e:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a333:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a338:	68 4c c0 00 c0       	push   $0xc000c04c
c000a33d:	e8 08 f8 ff ff       	call   c0009b4a <assertion_failure>
c000a342:	83 c4 10             	add    $0x10,%esp
c000a345:	8b 45 10             	mov    0x10(%ebp),%eax
c000a348:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a34e:	83 f8 21             	cmp    $0x21,%eax
c000a351:	74 1c                	je     c000a36f <sys_receive_msg+0x3fd>
c000a353:	68 ea 06 00 00       	push   $0x6ea
c000a358:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a35d:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a362:	68 64 c0 00 c0       	push   $0xc000c064
c000a367:	e8 de f7 ff ff       	call   c0009b4a <assertion_failure>
c000a36c:	83 c4 10             	add    $0x10,%esp
c000a36f:	8b 45 10             	mov    0x10(%ebp),%eax
c000a372:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a378:	83 f8 21             	cmp    $0x21,%eax
c000a37b:	0f 84 e4 00 00 00    	je     c000a465 <sys_receive_msg+0x4f3>
c000a381:	68 eb 06 00 00       	push   $0x6eb
c000a386:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a38b:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a390:	68 30 c1 00 c0       	push   $0xc000c130
c000a395:	e8 b0 f7 ff ff       	call   c0009b4a <assertion_failure>
c000a39a:	83 c4 10             	add    $0x10,%esp
c000a39d:	e9 c3 00 00 00       	jmp    c000a465 <sys_receive_msg+0x4f3>
c000a3a2:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3a5:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c000a3ac:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3af:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a3b6:	3c 02                	cmp    $0x2,%al
c000a3b8:	74 1c                	je     c000a3d6 <sys_receive_msg+0x464>
c000a3ba:	68 f0 06 00 00       	push   $0x6f0
c000a3bf:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a3c4:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a3c9:	68 4f c1 00 c0       	push   $0xc000c14f
c000a3ce:	e8 77 f7 ff ff       	call   c0009b4a <assertion_failure>
c000a3d3:	83 c4 10             	add    $0x10,%esp
c000a3d6:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3d9:	8b 55 08             	mov    0x8(%ebp),%edx
c000a3dc:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c000a3e2:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3e5:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a3ec:	3c 02                	cmp    $0x2,%al
c000a3ee:	74 1c                	je     c000a40c <sys_receive_msg+0x49a>
c000a3f0:	68 f2 06 00 00       	push   $0x6f2
c000a3f5:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a3fa:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a3ff:	68 4f c1 00 c0       	push   $0xc000c14f
c000a404:	e8 41 f7 ff ff       	call   c0009b4a <assertion_failure>
c000a409:	83 c4 10             	add    $0x10,%esp
c000a40c:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a410:	75 0f                	jne    c000a421 <sys_receive_msg+0x4af>
c000a412:	8b 45 10             	mov    0x10(%ebp),%eax
c000a415:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c000a41c:	00 00 00 
c000a41f:	eb 0c                	jmp    c000a42d <sys_receive_msg+0x4bb>
c000a421:	8b 45 10             	mov    0x10(%ebp),%eax
c000a424:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a427:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c000a42d:	8b 45 10             	mov    0x10(%ebp),%eax
c000a430:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a437:	3c 02                	cmp    $0x2,%al
c000a439:	74 1c                	je     c000a457 <sys_receive_msg+0x4e5>
c000a43b:	68 fd 06 00 00       	push   $0x6fd
c000a440:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a445:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a44a:	68 4f c1 00 c0       	push   $0xc000c14f
c000a44f:	e8 f6 f6 ff ff       	call   c0009b4a <assertion_failure>
c000a454:	83 c4 10             	add    $0x10,%esp
c000a457:	83 ec 0c             	sub    $0xc,%esp
c000a45a:	ff 75 10             	pushl  0x10(%ebp)
c000a45d:	e8 10 01 00 00       	call   c000a572 <block>
c000a462:	83 c4 10             	add    $0x10,%esp
c000a465:	b8 00 00 00 00       	mov    $0x0,%eax
c000a46a:	eb 02                	jmp    c000a46e <sys_receive_msg+0x4fc>
c000a46c:	90                   	nop
c000a46d:	90                   	nop
c000a46e:	c9                   	leave  
c000a46f:	c3                   	ret    

c000a470 <disp_str_colour_debug>:
c000a470:	55                   	push   %ebp
c000a471:	89 e5                	mov    %esp,%ebp
c000a473:	90                   	nop
c000a474:	5d                   	pop    %ebp
c000a475:	c3                   	ret    

c000a476 <send_rec>:
c000a476:	55                   	push   %ebp
c000a477:	89 e5                	mov    %esp,%ebp
c000a479:	83 ec 18             	sub    $0x18,%esp
c000a47c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a47f:	83 ec 0c             	sub    $0xc,%esp
c000a482:	50                   	push   %eax
c000a483:	e8 3b cb ff ff       	call   c0006fc3 <get_physical_address>
c000a488:	83 c4 10             	add    $0x10,%esp
c000a48b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a48e:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a492:	74 28                	je     c000a4bc <send_rec+0x46>
c000a494:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a498:	74 22                	je     c000a4bc <send_rec+0x46>
c000a49a:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a49e:	74 1c                	je     c000a4bc <send_rec+0x46>
c000a4a0:	68 1d 07 00 00       	push   $0x71d
c000a4a5:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a4aa:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a4af:	68 70 c1 00 c0       	push   $0xc000c170
c000a4b4:	e8 91 f6 ff ff       	call   c0009b4a <assertion_failure>
c000a4b9:	83 c4 10             	add    $0x10,%esp
c000a4bc:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a4c0:	75 12                	jne    c000a4d4 <send_rec+0x5e>
c000a4c2:	83 ec 04             	sub    $0x4,%esp
c000a4c5:	6a 6c                	push   $0x6c
c000a4c7:	6a 00                	push   $0x0
c000a4c9:	ff 75 0c             	pushl  0xc(%ebp)
c000a4cc:	e8 7a 1d 00 00       	call   c000c24b <Memset>
c000a4d1:	83 c4 10             	add    $0x10,%esp
c000a4d4:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a4d8:	74 23                	je     c000a4fd <send_rec+0x87>
c000a4da:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a4de:	74 34                	je     c000a514 <send_rec+0x9e>
c000a4e0:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a4e4:	75 72                	jne    c000a558 <send_rec+0xe2>
c000a4e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4e9:	83 ec 08             	sub    $0x8,%esp
c000a4ec:	ff 75 10             	pushl  0x10(%ebp)
c000a4ef:	50                   	push   %eax
c000a4f0:	e8 93 84 ff ff       	call   c0002988 <send_msg>
c000a4f5:	83 c4 10             	add    $0x10,%esp
c000a4f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a4fb:	eb 6e                	jmp    c000a56b <send_rec+0xf5>
c000a4fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a500:	83 ec 08             	sub    $0x8,%esp
c000a503:	ff 75 10             	pushl  0x10(%ebp)
c000a506:	50                   	push   %eax
c000a507:	e8 a2 84 ff ff       	call   c00029ae <receive_msg>
c000a50c:	83 c4 10             	add    $0x10,%esp
c000a50f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a512:	eb 57                	jmp    c000a56b <send_rec+0xf5>
c000a514:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a517:	83 ec 08             	sub    $0x8,%esp
c000a51a:	ff 75 10             	pushl  0x10(%ebp)
c000a51d:	50                   	push   %eax
c000a51e:	e8 65 84 ff ff       	call   c0002988 <send_msg>
c000a523:	83 c4 10             	add    $0x10,%esp
c000a526:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a529:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a52d:	75 3b                	jne    c000a56a <send_rec+0xf4>
c000a52f:	83 ec 04             	sub    $0x4,%esp
c000a532:	6a 6c                	push   $0x6c
c000a534:	6a 00                	push   $0x0
c000a536:	ff 75 0c             	pushl  0xc(%ebp)
c000a539:	e8 0d 1d 00 00       	call   c000c24b <Memset>
c000a53e:	83 c4 10             	add    $0x10,%esp
c000a541:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a544:	83 ec 08             	sub    $0x8,%esp
c000a547:	ff 75 10             	pushl  0x10(%ebp)
c000a54a:	50                   	push   %eax
c000a54b:	e8 5e 84 ff ff       	call   c00029ae <receive_msg>
c000a550:	83 c4 10             	add    $0x10,%esp
c000a553:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a556:	eb 12                	jmp    c000a56a <send_rec+0xf4>
c000a558:	83 ec 0c             	sub    $0xc,%esp
c000a55b:	68 ac c1 00 c0       	push   $0xc000c1ac
c000a560:	e8 c7 f5 ff ff       	call   c0009b2c <panic>
c000a565:	83 c4 10             	add    $0x10,%esp
c000a568:	eb 01                	jmp    c000a56b <send_rec+0xf5>
c000a56a:	90                   	nop
c000a56b:	b8 00 00 00 00       	mov    $0x0,%eax
c000a570:	c9                   	leave  
c000a571:	c3                   	ret    

c000a572 <block>:
c000a572:	55                   	push   %ebp
c000a573:	89 e5                	mov    %esp,%ebp
c000a575:	83 ec 08             	sub    $0x8,%esp
c000a578:	8b 45 08             	mov    0x8(%ebp),%eax
c000a57b:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a582:	84 c0                	test   %al,%al
c000a584:	75 1c                	jne    c000a5a2 <block+0x30>
c000a586:	68 4c 07 00 00       	push   $0x74c
c000a58b:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a590:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a595:	68 c1 c1 00 c0       	push   $0xc000c1c1
c000a59a:	e8 ab f5 ff ff       	call   c0009b4a <assertion_failure>
c000a59f:	83 c4 10             	add    $0x10,%esp
c000a5a2:	e8 8a a4 ff ff       	call   c0004a31 <schedule_process>
c000a5a7:	b8 00 00 00 00       	mov    $0x0,%eax
c000a5ac:	c9                   	leave  
c000a5ad:	c3                   	ret    

c000a5ae <unblock>:
c000a5ae:	55                   	push   %ebp
c000a5af:	89 e5                	mov    %esp,%ebp
c000a5b1:	83 ec 08             	sub    $0x8,%esp
c000a5b4:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5b7:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a5be:	84 c0                	test   %al,%al
c000a5c0:	74 1c                	je     c000a5de <unblock+0x30>
c000a5c2:	68 55 07 00 00       	push   $0x755
c000a5c7:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a5cc:	68 8f bf 00 c0       	push   $0xc000bf8f
c000a5d1:	68 d9 c1 00 c0       	push   $0xc000c1d9
c000a5d6:	e8 6f f5 ff ff       	call   c0009b4a <assertion_failure>
c000a5db:	83 c4 10             	add    $0x10,%esp
c000a5de:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5e1:	05 00 01 00 00       	add    $0x100,%eax
c000a5e6:	83 ec 08             	sub    $0x8,%esp
c000a5e9:	50                   	push   %eax
c000a5ea:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a5ef:	e8 4c 0a 00 00       	call   c000b040 <appendToDoubleLinkList>
c000a5f4:	83 c4 10             	add    $0x10,%esp
c000a5f7:	b8 00 00 00 00       	mov    $0x0,%eax
c000a5fc:	c9                   	leave  
c000a5fd:	c3                   	ret    

c000a5fe <get_ticks_ipc>:
c000a5fe:	55                   	push   %ebp
c000a5ff:	89 e5                	mov    %esp,%ebp
c000a601:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000a607:	83 ec 04             	sub    $0x4,%esp
c000a60a:	6a 6c                	push   $0x6c
c000a60c:	6a 00                	push   $0x0
c000a60e:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a611:	50                   	push   %eax
c000a612:	e8 34 1c 00 00       	call   c000c24b <Memset>
c000a617:	83 c4 10             	add    $0x10,%esp
c000a61a:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000a621:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a628:	83 ec 04             	sub    $0x4,%esp
c000a62b:	6a 01                	push   $0x1
c000a62d:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a630:	50                   	push   %eax
c000a631:	6a 03                	push   $0x3
c000a633:	e8 3e fe ff ff       	call   c000a476 <send_rec>
c000a638:	83 c4 10             	add    $0x10,%esp
c000a63b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a63e:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000a641:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a644:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a647:	c9                   	leave  
c000a648:	c3                   	ret    

c000a649 <itoa>:
c000a649:	55                   	push   %ebp
c000a64a:	89 e5                	mov    %esp,%ebp
c000a64c:	53                   	push   %ebx
c000a64d:	83 ec 14             	sub    $0x14,%esp
c000a650:	8b 45 08             	mov    0x8(%ebp),%eax
c000a653:	99                   	cltd   
c000a654:	f7 7d 10             	idivl  0x10(%ebp)
c000a657:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a65a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a65d:	99                   	cltd   
c000a65e:	f7 7d 10             	idivl  0x10(%ebp)
c000a661:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a664:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a668:	74 14                	je     c000a67e <itoa+0x35>
c000a66a:	83 ec 04             	sub    $0x4,%esp
c000a66d:	ff 75 10             	pushl  0x10(%ebp)
c000a670:	ff 75 0c             	pushl  0xc(%ebp)
c000a673:	ff 75 f0             	pushl  -0x10(%ebp)
c000a676:	e8 ce ff ff ff       	call   c000a649 <itoa>
c000a67b:	83 c4 10             	add    $0x10,%esp
c000a67e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a681:	8d 58 30             	lea    0x30(%eax),%ebx
c000a684:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a687:	8b 00                	mov    (%eax),%eax
c000a689:	8d 48 01             	lea    0x1(%eax),%ecx
c000a68c:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a68f:	89 0a                	mov    %ecx,(%edx)
c000a691:	89 da                	mov    %ebx,%edx
c000a693:	88 10                	mov    %dl,(%eax)
c000a695:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a698:	8b 00                	mov    (%eax),%eax
c000a69a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a69d:	c9                   	leave  
c000a69e:	c3                   	ret    

c000a69f <i2a>:
c000a69f:	55                   	push   %ebp
c000a6a0:	89 e5                	mov    %esp,%ebp
c000a6a2:	53                   	push   %ebx
c000a6a3:	83 ec 14             	sub    $0x14,%esp
c000a6a6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6a9:	99                   	cltd   
c000a6aa:	f7 7d 0c             	idivl  0xc(%ebp)
c000a6ad:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a6b0:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6b3:	99                   	cltd   
c000a6b4:	f7 7d 0c             	idivl  0xc(%ebp)
c000a6b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a6ba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a6be:	74 14                	je     c000a6d4 <i2a+0x35>
c000a6c0:	83 ec 04             	sub    $0x4,%esp
c000a6c3:	ff 75 10             	pushl  0x10(%ebp)
c000a6c6:	ff 75 0c             	pushl  0xc(%ebp)
c000a6c9:	ff 75 f0             	pushl  -0x10(%ebp)
c000a6cc:	e8 ce ff ff ff       	call   c000a69f <i2a>
c000a6d1:	83 c4 10             	add    $0x10,%esp
c000a6d4:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a6d8:	7f 0a                	jg     c000a6e4 <i2a+0x45>
c000a6da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6dd:	83 c0 30             	add    $0x30,%eax
c000a6e0:	89 c3                	mov    %eax,%ebx
c000a6e2:	eb 08                	jmp    c000a6ec <i2a+0x4d>
c000a6e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6e7:	83 c0 37             	add    $0x37,%eax
c000a6ea:	89 c3                	mov    %eax,%ebx
c000a6ec:	8b 45 10             	mov    0x10(%ebp),%eax
c000a6ef:	8b 00                	mov    (%eax),%eax
c000a6f1:	8d 48 01             	lea    0x1(%eax),%ecx
c000a6f4:	8b 55 10             	mov    0x10(%ebp),%edx
c000a6f7:	89 0a                	mov    %ecx,(%edx)
c000a6f9:	88 18                	mov    %bl,(%eax)
c000a6fb:	8b 45 10             	mov    0x10(%ebp),%eax
c000a6fe:	8b 00                	mov    (%eax),%eax
c000a700:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a703:	c9                   	leave  
c000a704:	c3                   	ret    

c000a705 <inform_int>:
c000a705:	55                   	push   %ebp
c000a706:	89 e5                	mov    %esp,%ebp
c000a708:	83 ec 18             	sub    $0x18,%esp
c000a70b:	83 ec 0c             	sub    $0xc,%esp
c000a70e:	ff 75 08             	pushl  0x8(%ebp)
c000a711:	e8 90 a4 ff ff       	call   c0004ba6 <pid2proc>
c000a716:	83 c4 10             	add    $0x10,%esp
c000a719:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a71c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a71f:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a726:	0f be c0             	movsbl %al,%eax
c000a729:	83 e0 02             	and    $0x2,%eax
c000a72c:	85 c0                	test   %eax,%eax
c000a72e:	0f 84 8e 00 00 00    	je     c000a7c2 <inform_int+0xbd>
c000a734:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a737:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a73d:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a742:	74 0e                	je     c000a752 <inform_int+0x4d>
c000a744:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a747:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a74d:	83 f8 12             	cmp    $0x12,%eax
c000a750:	75 7d                	jne    c000a7cf <inform_int+0xca>
c000a752:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c000a759:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a75c:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a762:	83 ec 08             	sub    $0x8,%esp
c000a765:	ff 75 f0             	pushl  -0x10(%ebp)
c000a768:	50                   	push   %eax
c000a769:	e8 8e c7 ff ff       	call   c0006efc <alloc_virtual_memory>
c000a76e:	83 c4 10             	add    $0x10,%esp
c000a771:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a774:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a777:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a77d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a780:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000a787:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a78a:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a791:	00 00 00 
c000a794:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a797:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a79e:	00 00 00 
c000a7a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a7a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7ab:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a7b2:	83 ec 0c             	sub    $0xc,%esp
c000a7b5:	ff 75 f4             	pushl  -0xc(%ebp)
c000a7b8:	e8 f1 fd ff ff       	call   c000a5ae <unblock>
c000a7bd:	83 c4 10             	add    $0x10,%esp
c000a7c0:	eb 0d                	jmp    c000a7cf <inform_int+0xca>
c000a7c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7c5:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a7cc:	00 00 00 
c000a7cf:	90                   	nop
c000a7d0:	c9                   	leave  
c000a7d1:	c3                   	ret    

c000a7d2 <strcmp>:
c000a7d2:	55                   	push   %ebp
c000a7d3:	89 e5                	mov    %esp,%ebp
c000a7d5:	83 ec 10             	sub    $0x10,%esp
c000a7d8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a7dc:	74 06                	je     c000a7e4 <strcmp+0x12>
c000a7de:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a7e2:	75 08                	jne    c000a7ec <strcmp+0x1a>
c000a7e4:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7e7:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a7ea:	eb 53                	jmp    c000a83f <strcmp+0x6d>
c000a7ec:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a7f2:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a7f5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a7f8:	eb 18                	jmp    c000a812 <strcmp+0x40>
c000a7fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a7fd:	0f b6 10             	movzbl (%eax),%edx
c000a800:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a803:	0f b6 00             	movzbl (%eax),%eax
c000a806:	38 c2                	cmp    %al,%dl
c000a808:	75 1e                	jne    c000a828 <strcmp+0x56>
c000a80a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a80e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a812:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a815:	0f b6 00             	movzbl (%eax),%eax
c000a818:	84 c0                	test   %al,%al
c000a81a:	74 0d                	je     c000a829 <strcmp+0x57>
c000a81c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a81f:	0f b6 00             	movzbl (%eax),%eax
c000a822:	84 c0                	test   %al,%al
c000a824:	75 d4                	jne    c000a7fa <strcmp+0x28>
c000a826:	eb 01                	jmp    c000a829 <strcmp+0x57>
c000a828:	90                   	nop
c000a829:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a82c:	0f b6 00             	movzbl (%eax),%eax
c000a82f:	0f be d0             	movsbl %al,%edx
c000a832:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a835:	0f b6 00             	movzbl (%eax),%eax
c000a838:	0f be c0             	movsbl %al,%eax
c000a83b:	29 c2                	sub    %eax,%edx
c000a83d:	89 d0                	mov    %edx,%eax
c000a83f:	c9                   	leave  
c000a840:	c3                   	ret    

c000a841 <create_user_process_address_space>:
c000a841:	55                   	push   %ebp
c000a842:	89 e5                	mov    %esp,%ebp
c000a844:	83 ec 18             	sub    $0x18,%esp
c000a847:	83 ec 08             	sub    $0x8,%esp
c000a84a:	6a 00                	push   $0x0
c000a84c:	6a 01                	push   $0x1
c000a84e:	e8 58 c8 ff ff       	call   c00070ab <alloc_memory>
c000a853:	83 c4 10             	add    $0x10,%esp
c000a856:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a859:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a85c:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a863:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a86a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a86d:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a872:	c1 e8 0c             	shr    $0xc,%eax
c000a875:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a878:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a87b:	83 c0 07             	add    $0x7,%eax
c000a87e:	c1 e8 03             	shr    $0x3,%eax
c000a881:	89 c2                	mov    %eax,%edx
c000a883:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a886:	89 50 04             	mov    %edx,0x4(%eax)
c000a889:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a88c:	8b 40 04             	mov    0x4(%eax),%eax
c000a88f:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a894:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000a89a:	85 c0                	test   %eax,%eax
c000a89c:	0f 48 c2             	cmovs  %edx,%eax
c000a89f:	c1 f8 0c             	sar    $0xc,%eax
c000a8a2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a8a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a8a8:	83 ec 08             	sub    $0x8,%esp
c000a8ab:	6a 00                	push   $0x0
c000a8ad:	50                   	push   %eax
c000a8ae:	e8 f8 c7 ff ff       	call   c00070ab <alloc_memory>
c000a8b3:	83 c4 10             	add    $0x10,%esp
c000a8b6:	89 c2                	mov    %eax,%edx
c000a8b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8bb:	89 10                	mov    %edx,(%eax)
c000a8bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8c0:	83 ec 0c             	sub    $0xc,%esp
c000a8c3:	50                   	push   %eax
c000a8c4:	e8 d0 c1 ff ff       	call   c0006a99 <init_bitmap>
c000a8c9:	83 c4 10             	add    $0x10,%esp
c000a8cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8cf:	c9                   	leave  
c000a8d0:	c3                   	ret    

c000a8d1 <user_process>:
c000a8d1:	55                   	push   %ebp
c000a8d2:	89 e5                	mov    %esp,%ebp
c000a8d4:	83 ec 38             	sub    $0x38,%esp
c000a8d7:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000a8de:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000a8e5:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000a8ec:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000a8f0:	75 0e                	jne    c000a900 <user_process+0x2f>
c000a8f2:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000a8f8:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000a8fe:	eb 0c                	jmp    c000a90c <user_process+0x3b>
c000a900:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000a906:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000a90c:	e8 86 6f ff ff       	call   c0001897 <get_running_thread_pcb>
c000a911:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a914:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a917:	05 00 10 00 00       	add    $0x1000,%eax
c000a91c:	89 c2                	mov    %eax,%edx
c000a91e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a921:	89 10                	mov    %edx,(%eax)
c000a923:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a926:	8b 00                	mov    (%eax),%eax
c000a928:	83 e8 44             	sub    $0x44,%eax
c000a92b:	89 c2                	mov    %eax,%edx
c000a92d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a930:	89 10                	mov    %edx,(%eax)
c000a932:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a935:	8b 00                	mov    (%eax),%eax
c000a937:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a93a:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000a93e:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000a944:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a948:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000a94c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a950:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000a954:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000a958:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000a95c:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000a962:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000a966:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a969:	89 50 34             	mov    %edx,0x34(%eax)
c000a96c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a970:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a973:	89 50 0c             	mov    %edx,0xc(%eax)
c000a976:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a97a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a97d:	89 50 04             	mov    %edx,0x4(%eax)
c000a980:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a984:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a987:	89 50 08             	mov    %edx,0x8(%eax)
c000a98a:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000a98e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a991:	89 50 40             	mov    %edx,0x40(%eax)
c000a994:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000a998:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a99b:	89 10                	mov    %edx,(%eax)
c000a99d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9a0:	8b 55 08             	mov    0x8(%ebp),%edx
c000a9a3:	89 50 30             	mov    %edx,0x30(%eax)
c000a9a6:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000a9aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9ad:	89 50 38             	mov    %edx,0x38(%eax)
c000a9b0:	83 ec 08             	sub    $0x8,%esp
c000a9b3:	6a 01                	push   $0x1
c000a9b5:	68 00 f0 ff bf       	push   $0xbffff000
c000a9ba:	e8 36 c6 ff ff       	call   c0006ff5 <alloc_physical_memory>
c000a9bf:	83 c4 10             	add    $0x10,%esp
c000a9c2:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000a9c8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9cb:	89 50 3c             	mov    %edx,0x3c(%eax)
c000a9ce:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a9d1:	83 ec 0c             	sub    $0xc,%esp
c000a9d4:	50                   	push   %eax
c000a9d5:	e8 92 6d ff ff       	call   c000176c <restart>
c000a9da:	83 c4 10             	add    $0x10,%esp
c000a9dd:	90                   	nop
c000a9de:	c9                   	leave  
c000a9df:	c3                   	ret    

c000a9e0 <clone_pcb>:
c000a9e0:	55                   	push   %ebp
c000a9e1:	89 e5                	mov    %esp,%ebp
c000a9e3:	83 ec 18             	sub    $0x18,%esp
c000a9e6:	83 ec 08             	sub    $0x8,%esp
c000a9e9:	6a 00                	push   $0x0
c000a9eb:	6a 01                	push   $0x1
c000a9ed:	e8 b9 c6 ff ff       	call   c00070ab <alloc_memory>
c000a9f2:	83 c4 10             	add    $0x10,%esp
c000a9f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a9f8:	83 ec 04             	sub    $0x4,%esp
c000a9fb:	68 00 10 00 00       	push   $0x1000
c000aa00:	6a 00                	push   $0x0
c000aa02:	ff 75 f4             	pushl  -0xc(%ebp)
c000aa05:	e8 41 18 00 00       	call   c000c24b <Memset>
c000aa0a:	83 c4 10             	add    $0x10,%esp
c000aa0d:	83 ec 04             	sub    $0x4,%esp
c000aa10:	68 00 10 00 00       	push   $0x1000
c000aa15:	ff 75 08             	pushl  0x8(%ebp)
c000aa18:	ff 75 f4             	pushl  -0xc(%ebp)
c000aa1b:	e8 45 d1 ff ff       	call   c0007b65 <Memcpy>
c000aa20:	83 c4 10             	add    $0x10,%esp
c000aa23:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000aa28:	83 c0 01             	add    $0x1,%eax
c000aa2b:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000aa30:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000aa36:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa39:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000aa3f:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa42:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000aa48:	89 c2                	mov    %eax,%edx
c000aa4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa4d:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000aa53:	83 ec 08             	sub    $0x8,%esp
c000aa56:	6a 00                	push   $0x0
c000aa58:	6a 01                	push   $0x1
c000aa5a:	e8 4c c6 ff ff       	call   c00070ab <alloc_memory>
c000aa5f:	83 c4 10             	add    $0x10,%esp
c000aa62:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000aa65:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aa68:	05 00 0c 00 00       	add    $0xc00,%eax
c000aa6d:	83 ec 04             	sub    $0x4,%esp
c000aa70:	68 00 04 00 00       	push   $0x400
c000aa75:	68 00 fc ff ff       	push   $0xfffffc00
c000aa7a:	50                   	push   %eax
c000aa7b:	e8 e5 d0 ff ff       	call   c0007b65 <Memcpy>
c000aa80:	83 c4 10             	add    $0x10,%esp
c000aa83:	83 ec 0c             	sub    $0xc,%esp
c000aa86:	ff 75 f0             	pushl  -0x10(%ebp)
c000aa89:	e8 35 c5 ff ff       	call   c0006fc3 <get_physical_address>
c000aa8e:	83 c4 10             	add    $0x10,%esp
c000aa91:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000aa94:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aa97:	05 fc 0f 00 00       	add    $0xffc,%eax
c000aa9c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aa9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000aaa2:	83 c8 07             	or     $0x7,%eax
c000aaa5:	89 c2                	mov    %eax,%edx
c000aaa7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aaaa:	89 10                	mov    %edx,(%eax)
c000aaac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aaaf:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000aab2:	89 50 08             	mov    %edx,0x8(%eax)
c000aab5:	e8 87 fd ff ff       	call   c000a841 <create_user_process_address_space>
c000aaba:	89 c2                	mov    %eax,%edx
c000aabc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aabf:	89 50 0c             	mov    %edx,0xc(%eax)
c000aac2:	8b 45 08             	mov    0x8(%ebp),%eax
c000aac5:	8b 40 0c             	mov    0xc(%eax),%eax
c000aac8:	89 c2                	mov    %eax,%edx
c000aaca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aacd:	8b 40 0c             	mov    0xc(%eax),%eax
c000aad0:	83 ec 04             	sub    $0x4,%esp
c000aad3:	6a 0c                	push   $0xc
c000aad5:	52                   	push   %edx
c000aad6:	50                   	push   %eax
c000aad7:	e8 89 d0 ff ff       	call   c0007b65 <Memcpy>
c000aadc:	83 c4 10             	add    $0x10,%esp
c000aadf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aae2:	c9                   	leave  
c000aae3:	c3                   	ret    

c000aae4 <build_body_stack>:
c000aae4:	55                   	push   %ebp
c000aae5:	89 e5                	mov    %esp,%ebp
c000aae7:	83 ec 48             	sub    $0x48,%esp
c000aaea:	8b 45 08             	mov    0x8(%ebp),%eax
c000aaed:	8b 40 0c             	mov    0xc(%eax),%eax
c000aaf0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aaf3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aaf6:	8b 50 04             	mov    0x4(%eax),%edx
c000aaf9:	8b 00                	mov    (%eax),%eax
c000aafb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000aafe:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000ab01:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000ab04:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ab07:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000ab0a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000ab0d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab10:	8b 40 08             	mov    0x8(%eax),%eax
c000ab13:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000ab16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000ab1d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000ab24:	e8 d8 cf ff ff       	call   c0007b01 <intr_disable>
c000ab29:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000ab2c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000ab33:	e9 c2 00 00 00       	jmp    c000abfa <build_body_stack+0x116>
c000ab38:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000ab3b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab3e:	01 d0                	add    %edx,%eax
c000ab40:	0f b6 00             	movzbl (%eax),%eax
c000ab43:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000ab46:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000ab4d:	e9 9a 00 00 00       	jmp    c000abec <build_body_stack+0x108>
c000ab52:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000ab56:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ab59:	89 c1                	mov    %eax,%ecx
c000ab5b:	d3 fa                	sar    %cl,%edx
c000ab5d:	89 d0                	mov    %edx,%eax
c000ab5f:	83 e0 01             	and    $0x1,%eax
c000ab62:	85 c0                	test   %eax,%eax
c000ab64:	75 06                	jne    c000ab6c <build_body_stack+0x88>
c000ab66:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000ab6a:	eb 7c                	jmp    c000abe8 <build_body_stack+0x104>
c000ab6c:	8b 45 08             	mov    0x8(%ebp),%eax
c000ab6f:	8b 40 08             	mov    0x8(%eax),%eax
c000ab72:	83 ec 0c             	sub    $0xc,%esp
c000ab75:	50                   	push   %eax
c000ab76:	e8 00 6d ff ff       	call   c000187b <update_cr3>
c000ab7b:	83 c4 10             	add    $0x10,%esp
c000ab7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ab81:	c1 e0 0c             	shl    $0xc,%eax
c000ab84:	89 c2                	mov    %eax,%edx
c000ab86:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000ab89:	01 d0                	add    %edx,%eax
c000ab8b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000ab8e:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000ab91:	8b 45 10             	mov    0x10(%ebp),%eax
c000ab94:	83 ec 04             	sub    $0x4,%esp
c000ab97:	68 00 10 00 00       	push   $0x1000
c000ab9c:	52                   	push   %edx
c000ab9d:	50                   	push   %eax
c000ab9e:	e8 c2 cf ff ff       	call   c0007b65 <Memcpy>
c000aba3:	83 c4 10             	add    $0x10,%esp
c000aba6:	8b 45 0c             	mov    0xc(%ebp),%eax
c000aba9:	8b 40 08             	mov    0x8(%eax),%eax
c000abac:	83 ec 0c             	sub    $0xc,%esp
c000abaf:	50                   	push   %eax
c000abb0:	e8 c6 6c ff ff       	call   c000187b <update_cr3>
c000abb5:	83 c4 10             	add    $0x10,%esp
c000abb8:	83 ec 08             	sub    $0x8,%esp
c000abbb:	ff 75 cc             	pushl  -0x34(%ebp)
c000abbe:	6a 01                	push   $0x1
c000abc0:	e8 48 c5 ff ff       	call   c000710d <get_a_virtual_page>
c000abc5:	83 c4 10             	add    $0x10,%esp
c000abc8:	8b 55 10             	mov    0x10(%ebp),%edx
c000abcb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000abce:	83 ec 04             	sub    $0x4,%esp
c000abd1:	68 00 10 00 00       	push   $0x1000
c000abd6:	52                   	push   %edx
c000abd7:	50                   	push   %eax
c000abd8:	e8 88 cf ff ff       	call   c0007b65 <Memcpy>
c000abdd:	83 c4 10             	add    $0x10,%esp
c000abe0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000abe4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000abe8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000abec:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000abf0:	0f 8e 5c ff ff ff    	jle    c000ab52 <build_body_stack+0x6e>
c000abf6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000abfa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000abfd:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000ac00:	0f 87 32 ff ff ff    	ja     c000ab38 <build_body_stack+0x54>
c000ac06:	83 ec 0c             	sub    $0xc,%esp
c000ac09:	ff 75 d4             	pushl  -0x2c(%ebp)
c000ac0c:	e8 19 cf ff ff       	call   c0007b2a <intr_set_status>
c000ac11:	83 c4 10             	add    $0x10,%esp
c000ac14:	90                   	nop
c000ac15:	c9                   	leave  
c000ac16:	c3                   	ret    

c000ac17 <build_process_kernel_stack>:
c000ac17:	55                   	push   %ebp
c000ac18:	89 e5                	mov    %esp,%ebp
c000ac1a:	83 ec 28             	sub    $0x28,%esp
c000ac1d:	e8 df ce ff ff       	call   c0007b01 <intr_disable>
c000ac22:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac25:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac28:	05 00 10 00 00       	add    $0x1000,%eax
c000ac2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac33:	8b 00                	mov    (%eax),%eax
c000ac35:	83 f8 38             	cmp    $0x38,%eax
c000ac38:	74 06                	je     c000ac40 <build_process_kernel_stack+0x29>
c000ac3a:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000ac3e:	eb f0                	jmp    c000ac30 <build_process_kernel_stack+0x19>
c000ac40:	90                   	nop
c000ac41:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac44:	05 00 10 00 00       	add    $0x1000,%eax
c000ac49:	89 c2                	mov    %eax,%edx
c000ac4b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac4e:	89 50 04             	mov    %edx,0x4(%eax)
c000ac51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac54:	83 c0 2c             	add    $0x2c,%eax
c000ac57:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ac5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac5d:	83 e8 04             	sub    $0x4,%eax
c000ac60:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000ac63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac66:	83 e8 08             	sub    $0x8,%eax
c000ac69:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ac6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac6f:	83 e8 0c             	sub    $0xc,%eax
c000ac72:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ac75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac78:	83 e8 10             	sub    $0x10,%eax
c000ac7b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000ac7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac81:	83 e8 14             	sub    $0x14,%eax
c000ac84:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000ac87:	ba 63 17 00 c0       	mov    $0xc0001763,%edx
c000ac8c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ac8f:	89 10                	mov    %edx,(%eax)
c000ac91:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000ac94:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000ac9a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000ac9d:	8b 10                	mov    (%eax),%edx
c000ac9f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000aca2:	89 10                	mov    %edx,(%eax)
c000aca4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000aca7:	8b 10                	mov    (%eax),%edx
c000aca9:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000acac:	89 10                	mov    %edx,(%eax)
c000acae:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000acb1:	8b 10                	mov    (%eax),%edx
c000acb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000acb6:	89 10                	mov    %edx,(%eax)
c000acb8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000acbb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000acc1:	8b 45 08             	mov    0x8(%ebp),%eax
c000acc4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000acc7:	89 10                	mov    %edx,(%eax)
c000acc9:	83 ec 0c             	sub    $0xc,%esp
c000accc:	ff 75 f0             	pushl  -0x10(%ebp)
c000accf:	e8 56 ce ff ff       	call   c0007b2a <intr_set_status>
c000acd4:	83 c4 10             	add    $0x10,%esp
c000acd7:	90                   	nop
c000acd8:	c9                   	leave  
c000acd9:	c3                   	ret    

c000acda <fork_process>:
c000acda:	55                   	push   %ebp
c000acdb:	89 e5                	mov    %esp,%ebp
c000acdd:	83 ec 18             	sub    $0x18,%esp
c000ace0:	8b 45 08             	mov    0x8(%ebp),%eax
c000ace3:	83 ec 0c             	sub    $0xc,%esp
c000ace6:	50                   	push   %eax
c000ace7:	e8 ba 9e ff ff       	call   c0004ba6 <pid2proc>
c000acec:	83 c4 10             	add    $0x10,%esp
c000acef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000acf2:	83 ec 0c             	sub    $0xc,%esp
c000acf5:	ff 75 f4             	pushl  -0xc(%ebp)
c000acf8:	e8 e3 fc ff ff       	call   c000a9e0 <clone_pcb>
c000acfd:	83 c4 10             	add    $0x10,%esp
c000ad00:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ad03:	83 ec 08             	sub    $0x8,%esp
c000ad06:	6a 00                	push   $0x0
c000ad08:	6a 01                	push   $0x1
c000ad0a:	e8 9c c3 ff ff       	call   c00070ab <alloc_memory>
c000ad0f:	83 c4 10             	add    $0x10,%esp
c000ad12:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ad15:	83 ec 04             	sub    $0x4,%esp
c000ad18:	ff 75 ec             	pushl  -0x14(%ebp)
c000ad1b:	ff 75 f0             	pushl  -0x10(%ebp)
c000ad1e:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad21:	e8 be fd ff ff       	call   c000aae4 <build_body_stack>
c000ad26:	83 c4 10             	add    $0x10,%esp
c000ad29:	83 ec 0c             	sub    $0xc,%esp
c000ad2c:	ff 75 f0             	pushl  -0x10(%ebp)
c000ad2f:	e8 e3 fe ff ff       	call   c000ac17 <build_process_kernel_stack>
c000ad34:	83 c4 10             	add    $0x10,%esp
c000ad37:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad3a:	05 00 01 00 00       	add    $0x100,%eax
c000ad3f:	83 ec 04             	sub    $0x4,%esp
c000ad42:	6a 08                	push   $0x8
c000ad44:	6a 00                	push   $0x0
c000ad46:	50                   	push   %eax
c000ad47:	e8 ff 14 00 00       	call   c000c24b <Memset>
c000ad4c:	83 c4 10             	add    $0x10,%esp
c000ad4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad52:	05 08 01 00 00       	add    $0x108,%eax
c000ad57:	83 ec 04             	sub    $0x4,%esp
c000ad5a:	6a 08                	push   $0x8
c000ad5c:	6a 00                	push   $0x0
c000ad5e:	50                   	push   %eax
c000ad5f:	e8 e7 14 00 00       	call   c000c24b <Memset>
c000ad64:	83 c4 10             	add    $0x10,%esp
c000ad67:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad6a:	05 08 01 00 00       	add    $0x108,%eax
c000ad6f:	83 ec 08             	sub    $0x8,%esp
c000ad72:	50                   	push   %eax
c000ad73:	68 04 1f 01 c0       	push   $0xc0011f04
c000ad78:	e8 c3 02 00 00       	call   c000b040 <appendToDoubleLinkList>
c000ad7d:	83 c4 10             	add    $0x10,%esp
c000ad80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ad83:	c9                   	leave  
c000ad84:	c3                   	ret    

c000ad85 <process_execute>:
c000ad85:	55                   	push   %ebp
c000ad86:	89 e5                	mov    %esp,%ebp
c000ad88:	83 ec 28             	sub    $0x28,%esp
c000ad8b:	e8 c6 04 00 00       	call   c000b256 <thread_init>
c000ad90:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ad93:	83 ec 0c             	sub    $0xc,%esp
c000ad96:	ff 75 f4             	pushl  -0xc(%ebp)
c000ad99:	e8 65 05 00 00       	call   c000b303 <thread_create>
c000ad9e:	83 c4 10             	add    $0x10,%esp
c000ada1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ada4:	05 34 01 00 00       	add    $0x134,%eax
c000ada9:	83 ec 08             	sub    $0x8,%esp
c000adac:	ff 75 10             	pushl  0x10(%ebp)
c000adaf:	50                   	push   %eax
c000adb0:	e8 b5 14 00 00       	call   c000c26a <Strcpy>
c000adb5:	83 c4 10             	add    $0x10,%esp
c000adb8:	83 ec 08             	sub    $0x8,%esp
c000adbb:	6a 00                	push   $0x0
c000adbd:	6a 01                	push   $0x1
c000adbf:	e8 e7 c2 ff ff       	call   c00070ab <alloc_memory>
c000adc4:	83 c4 10             	add    $0x10,%esp
c000adc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000adca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adcd:	05 00 0c 00 00       	add    $0xc00,%eax
c000add2:	83 ec 04             	sub    $0x4,%esp
c000add5:	68 00 04 00 00       	push   $0x400
c000adda:	68 00 fc ff ff       	push   $0xfffffc00
c000addf:	50                   	push   %eax
c000ade0:	e8 80 cd ff ff       	call   c0007b65 <Memcpy>
c000ade5:	83 c4 10             	add    $0x10,%esp
c000ade8:	83 ec 0c             	sub    $0xc,%esp
c000adeb:	ff 75 f0             	pushl  -0x10(%ebp)
c000adee:	e8 d0 c1 ff ff       	call   c0006fc3 <get_physical_address>
c000adf3:	83 c4 10             	add    $0x10,%esp
c000adf6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000adf9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000adfc:	05 fc 0f 00 00       	add    $0xffc,%eax
c000ae01:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000ae04:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000ae07:	83 c8 07             	or     $0x7,%eax
c000ae0a:	89 c2                	mov    %eax,%edx
c000ae0c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ae0f:	89 10                	mov    %edx,(%eax)
c000ae11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae14:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000ae17:	89 50 08             	mov    %edx,0x8(%eax)
c000ae1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae1d:	83 c0 10             	add    $0x10,%eax
c000ae20:	83 ec 0c             	sub    $0xc,%esp
c000ae23:	50                   	push   %eax
c000ae24:	e8 1e c8 ff ff       	call   c0007647 <init_memory_block_desc>
c000ae29:	83 c4 10             	add    $0x10,%esp
c000ae2c:	e8 10 fa ff ff       	call   c000a841 <create_user_process_address_space>
c000ae31:	89 c2                	mov    %eax,%edx
c000ae33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae36:	89 50 0c             	mov    %edx,0xc(%eax)
c000ae39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae3c:	8b 00                	mov    (%eax),%eax
c000ae3e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ae41:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae44:	c7 40 10 d1 a8 00 c0 	movl   $0xc000a8d1,0x10(%eax)
c000ae4b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae4e:	8b 55 08             	mov    0x8(%ebp),%edx
c000ae51:	89 50 18             	mov    %edx,0x18(%eax)
c000ae54:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae57:	8b 55 0c             	mov    0xc(%ebp),%edx
c000ae5a:	89 50 1c             	mov    %edx,0x1c(%eax)
c000ae5d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae60:	8b 55 14             	mov    0x14(%ebp),%edx
c000ae63:	89 50 20             	mov    %edx,0x20(%eax)
c000ae66:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000ae69:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae6c:	89 50 24             	mov    %edx,0x24(%eax)
c000ae6f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae72:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000ae78:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae7b:	8b 10                	mov    (%eax),%edx
c000ae7d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae80:	89 50 04             	mov    %edx,0x4(%eax)
c000ae83:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae86:	8b 50 04             	mov    0x4(%eax),%edx
c000ae89:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae8c:	89 50 08             	mov    %edx,0x8(%eax)
c000ae8f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae92:	8b 50 08             	mov    0x8(%eax),%edx
c000ae95:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae98:	89 50 0c             	mov    %edx,0xc(%eax)
c000ae9b:	83 ec 0c             	sub    $0xc,%esp
c000ae9e:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aea3:	e8 9b 00 00 00       	call   c000af43 <isListEmpty>
c000aea8:	83 c4 10             	add    $0x10,%esp
c000aeab:	e8 51 cc ff ff       	call   c0007b01 <intr_disable>
c000aeb0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aeb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aeb6:	05 00 01 00 00       	add    $0x100,%eax
c000aebb:	83 ec 08             	sub    $0x8,%esp
c000aebe:	50                   	push   %eax
c000aebf:	68 ec 0d 01 c0       	push   $0xc0010dec
c000aec4:	e8 77 01 00 00       	call   c000b040 <appendToDoubleLinkList>
c000aec9:	83 c4 10             	add    $0x10,%esp
c000aecc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aecf:	05 08 01 00 00       	add    $0x108,%eax
c000aed4:	83 ec 08             	sub    $0x8,%esp
c000aed7:	50                   	push   %eax
c000aed8:	68 04 1f 01 c0       	push   $0xc0011f04
c000aedd:	e8 5e 01 00 00       	call   c000b040 <appendToDoubleLinkList>
c000aee2:	83 c4 10             	add    $0x10,%esp
c000aee5:	83 ec 0c             	sub    $0xc,%esp
c000aee8:	ff 75 e0             	pushl  -0x20(%ebp)
c000aeeb:	e8 3a cc ff ff       	call   c0007b2a <intr_set_status>
c000aef0:	83 c4 10             	add    $0x10,%esp
c000aef3:	90                   	nop
c000aef4:	c9                   	leave  
c000aef5:	c3                   	ret    
c000aef6:	66 90                	xchg   %ax,%ax
c000aef8:	66 90                	xchg   %ax,%ax
c000aefa:	66 90                	xchg   %ax,%ax
c000aefc:	66 90                	xchg   %ax,%ax
c000aefe:	66 90                	xchg   %ax,%ax

c000af00 <switch_to>:
c000af00:	56                   	push   %esi
c000af01:	57                   	push   %edi
c000af02:	53                   	push   %ebx
c000af03:	55                   	push   %ebp
c000af04:	89 e5                	mov    %esp,%ebp
c000af06:	8b 45 14             	mov    0x14(%ebp),%eax
c000af09:	89 20                	mov    %esp,(%eax)
c000af0b:	8b 45 18             	mov    0x18(%ebp),%eax
c000af0e:	8b 20                	mov    (%eax),%esp
c000af10:	5d                   	pop    %ebp
c000af11:	5b                   	pop    %ebx
c000af12:	5f                   	pop    %edi
c000af13:	5e                   	pop    %esi
c000af14:	c3                   	ret    

c000af15 <initDoubleLinkList>:
c000af15:	55                   	push   %ebp
c000af16:	89 e5                	mov    %esp,%ebp
c000af18:	8b 45 08             	mov    0x8(%ebp),%eax
c000af1b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000af21:	8b 45 08             	mov    0x8(%ebp),%eax
c000af24:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000af2b:	8b 45 08             	mov    0x8(%ebp),%eax
c000af2e:	8d 50 08             	lea    0x8(%eax),%edx
c000af31:	8b 45 08             	mov    0x8(%ebp),%eax
c000af34:	89 50 04             	mov    %edx,0x4(%eax)
c000af37:	8b 55 08             	mov    0x8(%ebp),%edx
c000af3a:	8b 45 08             	mov    0x8(%ebp),%eax
c000af3d:	89 50 08             	mov    %edx,0x8(%eax)
c000af40:	90                   	nop
c000af41:	5d                   	pop    %ebp
c000af42:	c3                   	ret    

c000af43 <isListEmpty>:
c000af43:	55                   	push   %ebp
c000af44:	89 e5                	mov    %esp,%ebp
c000af46:	8b 45 08             	mov    0x8(%ebp),%eax
c000af49:	8b 40 04             	mov    0x4(%eax),%eax
c000af4c:	8b 55 08             	mov    0x8(%ebp),%edx
c000af4f:	83 c2 08             	add    $0x8,%edx
c000af52:	39 d0                	cmp    %edx,%eax
c000af54:	75 07                	jne    c000af5d <isListEmpty+0x1a>
c000af56:	b8 01 00 00 00       	mov    $0x1,%eax
c000af5b:	eb 05                	jmp    c000af62 <isListEmpty+0x1f>
c000af5d:	b8 00 00 00 00       	mov    $0x0,%eax
c000af62:	5d                   	pop    %ebp
c000af63:	c3                   	ret    

c000af64 <findElementInList>:
c000af64:	55                   	push   %ebp
c000af65:	89 e5                	mov    %esp,%ebp
c000af67:	83 ec 28             	sub    $0x28,%esp
c000af6a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000af6e:	75 19                	jne    c000af89 <findElementInList+0x25>
c000af70:	6a 60                	push   $0x60
c000af72:	68 f1 c1 00 c0       	push   $0xc000c1f1
c000af77:	68 f1 c1 00 c0       	push   $0xc000c1f1
c000af7c:	68 04 c2 00 c0       	push   $0xc000c204
c000af81:	e8 c4 eb ff ff       	call   c0009b4a <assertion_failure>
c000af86:	83 c4 10             	add    $0x10,%esp
c000af89:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000af8d:	75 19                	jne    c000afa8 <findElementInList+0x44>
c000af8f:	6a 61                	push   $0x61
c000af91:	68 f1 c1 00 c0       	push   $0xc000c1f1
c000af96:	68 f1 c1 00 c0       	push   $0xc000c1f1
c000af9b:	68 10 c2 00 c0       	push   $0xc000c210
c000afa0:	e8 a5 eb ff ff       	call   c0009b4a <assertion_failure>
c000afa5:	83 c4 10             	add    $0x10,%esp
c000afa8:	e8 54 cb ff ff       	call   c0007b01 <intr_disable>
c000afad:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000afb0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000afb7:	8b 45 08             	mov    0x8(%ebp),%eax
c000afba:	8b 40 08             	mov    0x8(%eax),%eax
c000afbd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000afc0:	8b 45 08             	mov    0x8(%ebp),%eax
c000afc3:	8b 40 04             	mov    0x4(%eax),%eax
c000afc6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000afc9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000afcd:	75 07                	jne    c000afd6 <findElementInList+0x72>
c000afcf:	b8 00 00 00 00       	mov    $0x0,%eax
c000afd4:	eb 68                	jmp    c000b03e <findElementInList+0xda>
c000afd6:	8b 45 0c             	mov    0xc(%ebp),%eax
c000afd9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000afdc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000afdf:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000afe2:	c1 f8 03             	sar    $0x3,%eax
c000afe5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000afe8:	eb 36                	jmp    c000b020 <findElementInList+0xbc>
c000afea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000afed:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000aff0:	75 07                	jne    c000aff9 <findElementInList+0x95>
c000aff2:	b8 01 00 00 00       	mov    $0x1,%eax
c000aff7:	eb 45                	jmp    c000b03e <findElementInList+0xda>
c000aff9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000affd:	75 07                	jne    c000b006 <findElementInList+0xa2>
c000afff:	b8 00 00 00 00       	mov    $0x0,%eax
c000b004:	eb 38                	jmp    c000b03e <findElementInList+0xda>
c000b006:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b009:	8b 40 04             	mov    0x4(%eax),%eax
c000b00c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b00f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b013:	75 07                	jne    c000b01c <findElementInList+0xb8>
c000b015:	b8 00 00 00 00       	mov    $0x0,%eax
c000b01a:	eb 22                	jmp    c000b03e <findElementInList+0xda>
c000b01c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000b020:	8b 45 08             	mov    0x8(%ebp),%eax
c000b023:	83 c0 08             	add    $0x8,%eax
c000b026:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000b029:	75 bf                	jne    c000afea <findElementInList+0x86>
c000b02b:	83 ec 0c             	sub    $0xc,%esp
c000b02e:	ff 75 ec             	pushl  -0x14(%ebp)
c000b031:	e8 f4 ca ff ff       	call   c0007b2a <intr_set_status>
c000b036:	83 c4 10             	add    $0x10,%esp
c000b039:	b8 00 00 00 00       	mov    $0x0,%eax
c000b03e:	c9                   	leave  
c000b03f:	c3                   	ret    

c000b040 <appendToDoubleLinkList>:
c000b040:	55                   	push   %ebp
c000b041:	89 e5                	mov    %esp,%ebp
c000b043:	83 ec 18             	sub    $0x18,%esp
c000b046:	83 ec 08             	sub    $0x8,%esp
c000b049:	ff 75 0c             	pushl  0xc(%ebp)
c000b04c:	ff 75 08             	pushl  0x8(%ebp)
c000b04f:	e8 10 ff ff ff       	call   c000af64 <findElementInList>
c000b054:	83 c4 10             	add    $0x10,%esp
c000b057:	3c 01                	cmp    $0x1,%al
c000b059:	0f 84 c2 00 00 00    	je     c000b121 <appendToDoubleLinkList+0xe1>
c000b05f:	e8 9d ca ff ff       	call   c0007b01 <intr_disable>
c000b064:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b067:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000b06b:	75 1c                	jne    c000b089 <appendToDoubleLinkList+0x49>
c000b06d:	68 9e 00 00 00       	push   $0x9e
c000b072:	68 f1 c1 00 c0       	push   $0xc000c1f1
c000b077:	68 f1 c1 00 c0       	push   $0xc000c1f1
c000b07c:	68 04 c2 00 c0       	push   $0xc000c204
c000b081:	e8 c4 ea ff ff       	call   c0009b4a <assertion_failure>
c000b086:	83 c4 10             	add    $0x10,%esp
c000b089:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000b08d:	75 1c                	jne    c000b0ab <appendToDoubleLinkList+0x6b>
c000b08f:	68 9f 00 00 00       	push   $0x9f
c000b094:	68 f1 c1 00 c0       	push   $0xc000c1f1
c000b099:	68 f1 c1 00 c0       	push   $0xc000c1f1
c000b09e:	68 10 c2 00 c0       	push   $0xc000c210
c000b0a3:	e8 a2 ea ff ff       	call   c0009b4a <assertion_failure>
c000b0a8:	83 c4 10             	add    $0x10,%esp
c000b0ab:	83 ec 08             	sub    $0x8,%esp
c000b0ae:	ff 75 0c             	pushl  0xc(%ebp)
c000b0b1:	ff 75 08             	pushl  0x8(%ebp)
c000b0b4:	e8 ab fe ff ff       	call   c000af64 <findElementInList>
c000b0b9:	83 c4 10             	add    $0x10,%esp
c000b0bc:	3c 01                	cmp    $0x1,%al
c000b0be:	74 64                	je     c000b124 <appendToDoubleLinkList+0xe4>
c000b0c0:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b0c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b0c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b0c9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b0d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b0d3:	8b 50 04             	mov    0x4(%eax),%edx
c000b0d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b0d9:	89 10                	mov    %edx,(%eax)
c000b0db:	8b 45 08             	mov    0x8(%ebp),%eax
c000b0de:	8b 50 08             	mov    0x8(%eax),%edx
c000b0e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b0e4:	89 10                	mov    %edx,(%eax)
c000b0e6:	8b 45 08             	mov    0x8(%ebp),%eax
c000b0e9:	8b 40 08             	mov    0x8(%eax),%eax
c000b0ec:	85 c0                	test   %eax,%eax
c000b0ee:	74 0c                	je     c000b0fc <appendToDoubleLinkList+0xbc>
c000b0f0:	8b 45 08             	mov    0x8(%ebp),%eax
c000b0f3:	8b 40 08             	mov    0x8(%eax),%eax
c000b0f6:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b0f9:	89 50 04             	mov    %edx,0x4(%eax)
c000b0fc:	8b 45 08             	mov    0x8(%ebp),%eax
c000b0ff:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b102:	89 50 08             	mov    %edx,0x8(%eax)
c000b105:	8b 45 08             	mov    0x8(%ebp),%eax
c000b108:	8d 50 08             	lea    0x8(%eax),%edx
c000b10b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b10e:	89 50 04             	mov    %edx,0x4(%eax)
c000b111:	83 ec 0c             	sub    $0xc,%esp
c000b114:	ff 75 f4             	pushl  -0xc(%ebp)
c000b117:	e8 0e ca ff ff       	call   c0007b2a <intr_set_status>
c000b11c:	83 c4 10             	add    $0x10,%esp
c000b11f:	eb 04                	jmp    c000b125 <appendToDoubleLinkList+0xe5>
c000b121:	90                   	nop
c000b122:	eb 01                	jmp    c000b125 <appendToDoubleLinkList+0xe5>
c000b124:	90                   	nop
c000b125:	c9                   	leave  
c000b126:	c3                   	ret    

c000b127 <insertToDoubleLinkList>:
c000b127:	55                   	push   %ebp
c000b128:	89 e5                	mov    %esp,%ebp
c000b12a:	83 ec 18             	sub    $0x18,%esp
c000b12d:	83 ec 08             	sub    $0x8,%esp
c000b130:	ff 75 0c             	pushl  0xc(%ebp)
c000b133:	ff 75 08             	pushl  0x8(%ebp)
c000b136:	e8 29 fe ff ff       	call   c000af64 <findElementInList>
c000b13b:	83 c4 10             	add    $0x10,%esp
c000b13e:	3c 01                	cmp    $0x1,%al
c000b140:	74 65                	je     c000b1a7 <insertToDoubleLinkList+0x80>
c000b142:	e8 ba c9 ff ff       	call   c0007b01 <intr_disable>
c000b147:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b14a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b14d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b150:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b153:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b15a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b15d:	8b 50 04             	mov    0x4(%eax),%edx
c000b160:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b163:	89 10                	mov    %edx,(%eax)
c000b165:	8b 45 08             	mov    0x8(%ebp),%eax
c000b168:	8b 50 04             	mov    0x4(%eax),%edx
c000b16b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b16e:	89 50 04             	mov    %edx,0x4(%eax)
c000b171:	8b 45 08             	mov    0x8(%ebp),%eax
c000b174:	8b 40 04             	mov    0x4(%eax),%eax
c000b177:	85 c0                	test   %eax,%eax
c000b179:	74 0b                	je     c000b186 <insertToDoubleLinkList+0x5f>
c000b17b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b17e:	8b 40 04             	mov    0x4(%eax),%eax
c000b181:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b184:	89 10                	mov    %edx,(%eax)
c000b186:	8b 45 08             	mov    0x8(%ebp),%eax
c000b189:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b18c:	89 50 04             	mov    %edx,0x4(%eax)
c000b18f:	8b 55 08             	mov    0x8(%ebp),%edx
c000b192:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b195:	89 10                	mov    %edx,(%eax)
c000b197:	83 ec 0c             	sub    $0xc,%esp
c000b19a:	ff 75 f4             	pushl  -0xc(%ebp)
c000b19d:	e8 88 c9 ff ff       	call   c0007b2a <intr_set_status>
c000b1a2:	83 c4 10             	add    $0x10,%esp
c000b1a5:	eb 01                	jmp    c000b1a8 <insertToDoubleLinkList+0x81>
c000b1a7:	90                   	nop
c000b1a8:	c9                   	leave  
c000b1a9:	c3                   	ret    

c000b1aa <popFromDoubleLinkList>:
c000b1aa:	55                   	push   %ebp
c000b1ab:	89 e5                	mov    %esp,%ebp
c000b1ad:	83 ec 18             	sub    $0x18,%esp
c000b1b0:	e8 4c c9 ff ff       	call   c0007b01 <intr_disable>
c000b1b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b1b8:	83 ec 0c             	sub    $0xc,%esp
c000b1bb:	ff 75 08             	pushl  0x8(%ebp)
c000b1be:	e8 80 fd ff ff       	call   c000af43 <isListEmpty>
c000b1c3:	83 c4 10             	add    $0x10,%esp
c000b1c6:	3c 01                	cmp    $0x1,%al
c000b1c8:	75 07                	jne    c000b1d1 <popFromDoubleLinkList+0x27>
c000b1ca:	b8 00 00 00 00       	mov    $0x0,%eax
c000b1cf:	eb 6b                	jmp    c000b23c <popFromDoubleLinkList+0x92>
c000b1d1:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1d4:	8b 40 08             	mov    0x8(%eax),%eax
c000b1d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b1da:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1dd:	8b 40 08             	mov    0x8(%eax),%eax
c000b1e0:	85 c0                	test   %eax,%eax
c000b1e2:	75 07                	jne    c000b1eb <popFromDoubleLinkList+0x41>
c000b1e4:	b8 00 00 00 00       	mov    $0x0,%eax
c000b1e9:	eb 51                	jmp    c000b23c <popFromDoubleLinkList+0x92>
c000b1eb:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1ee:	8b 40 08             	mov    0x8(%eax),%eax
c000b1f1:	8b 00                	mov    (%eax),%eax
c000b1f3:	85 c0                	test   %eax,%eax
c000b1f5:	74 11                	je     c000b208 <popFromDoubleLinkList+0x5e>
c000b1f7:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1fa:	8b 40 08             	mov    0x8(%eax),%eax
c000b1fd:	8b 00                	mov    (%eax),%eax
c000b1ff:	8b 55 08             	mov    0x8(%ebp),%edx
c000b202:	83 c2 08             	add    $0x8,%edx
c000b205:	89 50 04             	mov    %edx,0x4(%eax)
c000b208:	8b 45 08             	mov    0x8(%ebp),%eax
c000b20b:	8b 40 08             	mov    0x8(%eax),%eax
c000b20e:	8b 10                	mov    (%eax),%edx
c000b210:	8b 45 08             	mov    0x8(%ebp),%eax
c000b213:	89 50 08             	mov    %edx,0x8(%eax)
c000b216:	83 ec 0c             	sub    $0xc,%esp
c000b219:	ff 75 f4             	pushl  -0xc(%ebp)
c000b21c:	e8 09 c9 ff ff       	call   c0007b2a <intr_set_status>
c000b221:	83 c4 10             	add    $0x10,%esp
c000b224:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b227:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b22e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b231:	8b 50 04             	mov    0x4(%eax),%edx
c000b234:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b237:	89 10                	mov    %edx,(%eax)
c000b239:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b23c:	c9                   	leave  
c000b23d:	c3                   	ret    

c000b23e <kernel_thread>:
c000b23e:	55                   	push   %ebp
c000b23f:	89 e5                	mov    %esp,%ebp
c000b241:	83 ec 08             	sub    $0x8,%esp
c000b244:	fb                   	sti    
c000b245:	83 ec 0c             	sub    $0xc,%esp
c000b248:	ff 75 0c             	pushl  0xc(%ebp)
c000b24b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b24e:	ff d0                	call   *%eax
c000b250:	83 c4 10             	add    $0x10,%esp
c000b253:	90                   	nop
c000b254:	c9                   	leave  
c000b255:	c3                   	ret    

c000b256 <thread_init>:
c000b256:	55                   	push   %ebp
c000b257:	89 e5                	mov    %esp,%ebp
c000b259:	83 ec 18             	sub    $0x18,%esp
c000b25c:	83 ec 08             	sub    $0x8,%esp
c000b25f:	6a 00                	push   $0x0
c000b261:	6a 01                	push   $0x1
c000b263:	e8 43 be ff ff       	call   c00070ab <alloc_memory>
c000b268:	83 c4 10             	add    $0x10,%esp
c000b26b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b26e:	83 ec 04             	sub    $0x4,%esp
c000b271:	68 00 10 00 00       	push   $0x1000
c000b276:	6a 00                	push   $0x0
c000b278:	ff 75 f4             	pushl  -0xc(%ebp)
c000b27b:	e8 cb 0f 00 00       	call   c000c24b <Memset>
c000b280:	83 c4 10             	add    $0x10,%esp
c000b283:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b286:	05 00 10 00 00       	add    $0x1000,%eax
c000b28b:	89 c2                	mov    %eax,%edx
c000b28d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b290:	89 10                	mov    %edx,(%eax)
c000b292:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b295:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000b29c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b29f:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000b2a6:	ff ff ff 
c000b2a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2ac:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000b2b3:	00 00 00 
c000b2b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2b9:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000b2bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2c2:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000b2c8:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000b2cd:	83 c0 01             	add    $0x1,%eax
c000b2d0:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000b2d5:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000b2db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2de:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000b2e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2e7:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c000b2ee:	00 00 00 
c000b2f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b2f4:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000b2fb:	cd ab 99 
c000b2fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b301:	c9                   	leave  
c000b302:	c3                   	ret    

c000b303 <thread_create>:
c000b303:	55                   	push   %ebp
c000b304:	89 e5                	mov    %esp,%ebp
c000b306:	83 ec 10             	sub    $0x10,%esp
c000b309:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000b310:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000b317:	8b 45 08             	mov    0x8(%ebp),%eax
c000b31a:	8b 00                	mov    (%eax),%eax
c000b31c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000b31f:	89 c2                	mov    %eax,%edx
c000b321:	8b 45 08             	mov    0x8(%ebp),%eax
c000b324:	89 10                	mov    %edx,(%eax)
c000b326:	8b 45 08             	mov    0x8(%ebp),%eax
c000b329:	8b 00                	mov    (%eax),%eax
c000b32b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000b32e:	89 c2                	mov    %eax,%edx
c000b330:	8b 45 08             	mov    0x8(%ebp),%eax
c000b333:	89 10                	mov    %edx,(%eax)
c000b335:	90                   	nop
c000b336:	c9                   	leave  
c000b337:	c3                   	ret    

c000b338 <thread_start>:
c000b338:	55                   	push   %ebp
c000b339:	89 e5                	mov    %esp,%ebp
c000b33b:	83 ec 18             	sub    $0x18,%esp
c000b33e:	e8 13 ff ff ff       	call   c000b256 <thread_init>
c000b343:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b346:	83 ec 0c             	sub    $0xc,%esp
c000b349:	ff 75 f4             	pushl  -0xc(%ebp)
c000b34c:	e8 b2 ff ff ff       	call   c000b303 <thread_create>
c000b351:	83 c4 10             	add    $0x10,%esp
c000b354:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b357:	05 34 01 00 00       	add    $0x134,%eax
c000b35c:	83 ec 08             	sub    $0x8,%esp
c000b35f:	ff 75 10             	pushl  0x10(%ebp)
c000b362:	50                   	push   %eax
c000b363:	e8 02 0f 00 00       	call   c000c26a <Strcpy>
c000b368:	83 c4 10             	add    $0x10,%esp
c000b36b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b36e:	8b 00                	mov    (%eax),%eax
c000b370:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b373:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b376:	c7 40 10 3e b2 00 c0 	movl   $0xc000b23e,0x10(%eax)
c000b37d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b380:	8b 55 08             	mov    0x8(%ebp),%edx
c000b383:	89 50 18             	mov    %edx,0x18(%eax)
c000b386:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b389:	8b 55 0c             	mov    0xc(%ebp),%edx
c000b38c:	89 50 1c             	mov    %edx,0x1c(%eax)
c000b38f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b392:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000b398:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b39b:	8b 10                	mov    (%eax),%edx
c000b39d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3a0:	89 50 04             	mov    %edx,0x4(%eax)
c000b3a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3a6:	8b 50 04             	mov    0x4(%eax),%edx
c000b3a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3ac:	89 50 08             	mov    %edx,0x8(%eax)
c000b3af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3b2:	8b 50 08             	mov    0x8(%eax),%edx
c000b3b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3b8:	89 50 0c             	mov    %edx,0xc(%eax)
c000b3bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b3be:	05 00 01 00 00       	add    $0x100,%eax
c000b3c3:	83 ec 08             	sub    $0x8,%esp
c000b3c6:	50                   	push   %eax
c000b3c7:	68 ec 0d 01 c0       	push   $0xc0010dec
c000b3cc:	e8 6f fc ff ff       	call   c000b040 <appendToDoubleLinkList>
c000b3d1:	83 c4 10             	add    $0x10,%esp
c000b3d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b3d7:	05 08 01 00 00       	add    $0x108,%eax
c000b3dc:	83 ec 08             	sub    $0x8,%esp
c000b3df:	50                   	push   %eax
c000b3e0:	68 04 1f 01 c0       	push   $0xc0011f04
c000b3e5:	e8 56 fc ff ff       	call   c000b040 <appendToDoubleLinkList>
c000b3ea:	83 c4 10             	add    $0x10,%esp
c000b3ed:	90                   	nop
c000b3ee:	c9                   	leave  
c000b3ef:	c3                   	ret    
