
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
c0001525:	e8 fa 39 00 00       	call   c0004f24 <ReloadGDT>
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
c000156a:	e8 b6 71 00 00       	call   c0008725 <test>
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
c000164b:	e8 d8 6b 00 00       	call   c0008228 <exception_handler>
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
c0001668:	e8 bb 6b 00 00       	call   c0008228 <exception_handler>
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
c0001694:	e8 7d 34 00 00       	call   c0004b16 <clock_handler>
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
c00016c5:	e8 9f 43 00 00       	call   c0005a69 <keyboard_handler>
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
c000170a:	e8 85 10 00 00       	call   c0002794 <hd_handler>
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
c00017e9:	e8 d4 68 00 00       	call   c00080c2 <disp_int>
c00017ee:	83 c4 04             	add    $0x4,%esp
c00017f1:	58                   	pop    %eax
c00017f2:	5a                   	pop    %edx
c00017f3:	52                   	push   %edx
c00017f4:	50                   	push   %eax
c00017f5:	e8 c8 68 00 00       	call   c00080c2 <disp_int>
c00017fa:	58                   	pop    %eax
c00017fb:	5a                   	pop    %edx
c00017fc:	52                   	push   %edx
c00017fd:	50                   	push   %eax
c00017fe:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c0001804:	e8 b9 68 00 00       	call   c00080c2 <disp_int>
c0001809:	83 c4 04             	add    $0x4,%esp
c000180c:	58                   	pop    %eax
c000180d:	5a                   	pop    %edx
c000180e:	52                   	push   %edx
c000180f:	50                   	push   %eax
c0001810:	ff 72 ec             	pushl  -0x14(%edx)
c0001813:	e8 aa 68 00 00       	call   c00080c2 <disp_int>
c0001818:	83 c4 04             	add    $0x4,%esp
c000181b:	58                   	pop    %eax
c000181c:	5a                   	pop    %edx
c000181d:	52                   	push   %edx
c000181e:	50                   	push   %eax
c000181f:	ff 70 ec             	pushl  -0x14(%eax)
c0001822:	e8 9b 68 00 00       	call   c00080c2 <disp_int>
c0001827:	83 c4 04             	add    $0x4,%esp
c000182a:	58                   	pop    %eax
c000182b:	5a                   	pop    %edx
c000182c:	52                   	push   %edx
c000182d:	50                   	push   %eax
c000182e:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001834:	e8 89 68 00 00       	call   c00080c2 <disp_int>
c0001839:	83 c4 04             	add    $0x4,%esp
c000183c:	58                   	pop    %eax
c000183d:	5a                   	pop    %edx
c000183e:	52                   	push   %edx
c000183f:	50                   	push   %eax
c0001840:	68 60 07 01 c0       	push   $0xc0010760
c0001845:	e8 78 68 00 00       	call   c00080c2 <disp_int>
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
c00018cd:	e8 de 98 00 00       	call   c000b1b0 <appendToDoubleLinkList>
c00018d2:	83 c4 10             	add    $0x10,%esp
c00018d5:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018da:	05 08 01 00 00       	add    $0x108,%eax
c00018df:	83 ec 08             	sub    $0x8,%esp
c00018e2:	50                   	push   %eax
c00018e3:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018e8:	e8 c3 98 00 00       	call   c000b1b0 <appendToDoubleLinkList>
c00018ed:	83 c4 10             	add    $0x10,%esp
c00018f0:	6a 00                	push   $0x0
c00018f2:	68 60 b5 00 c0       	push   $0xc000b560
c00018f7:	68 67 b5 00 c0       	push   $0xc000b567
c00018fc:	68 bd 63 00 c0       	push   $0xc00063bd
c0001901:	e8 f3 95 00 00       	call   c000aef9 <process_execute>
c0001906:	83 c4 10             	add    $0x10,%esp
c0001909:	6a 00                	push   $0x0
c000190b:	68 70 b5 00 c0       	push   $0xc000b570
c0001910:	68 78 b5 00 c0       	push   $0xc000b578
c0001915:	68 b9 29 00 c0       	push   $0xc00029b9
c000191a:	e8 da 95 00 00       	call   c000aef9 <process_execute>
c000191f:	83 c4 10             	add    $0x10,%esp
c0001922:	6a 00                	push   $0x0
c0001924:	68 81 b5 00 c0       	push   $0xc000b581
c0001929:	68 88 b5 00 c0       	push   $0xc000b588
c000192e:	68 2b 1b 00 c0       	push   $0xc0001b2b
c0001933:	e8 c1 95 00 00       	call   c000aef9 <process_execute>
c0001938:	83 c4 10             	add    $0x10,%esp
c000193b:	6a 00                	push   $0x0
c000193d:	68 91 b5 00 c0       	push   $0xc000b591
c0001942:	68 99 b5 00 c0       	push   $0xc000b599
c0001947:	68 66 59 00 c0       	push   $0xc0005966
c000194c:	e8 a8 95 00 00       	call   c000aef9 <process_execute>
c0001951:	83 c4 10             	add    $0x10,%esp
c0001954:	6a 01                	push   $0x1
c0001956:	68 a3 b5 00 c0       	push   $0xc000b5a3
c000195b:	68 ad b5 00 c0       	push   $0xc000b5ad
c0001960:	68 f6 1a 00 c0       	push   $0xc0001af6
c0001965:	e8 8f 95 00 00       	call   c000aef9 <process_execute>
c000196a:	83 c4 10             	add    $0x10,%esp
c000196d:	83 ec 0c             	sub    $0xc,%esp
c0001970:	68 ba b5 00 c0       	push   $0xc000b5ba
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
c00019b1:	68 c4 b5 00 c0       	push   $0xc000b5c4
c00019b6:	e8 d1 fb ff ff       	call   c000158c <disp_str>
c00019bb:	83 c4 10             	add    $0x10,%esp
c00019be:	e8 1f 6e 00 00       	call   c00087e2 <init_keyboard>
c00019c3:	83 ec 0c             	sub    $0xc,%esp
c00019c6:	68 00 00 00 02       	push   $0x2000000
c00019cb:	e8 33 61 00 00       	call   c0007b03 <init_memory>
c00019d0:	83 c4 10             	add    $0x10,%esp
c00019d3:	83 ec 0c             	sub    $0xc,%esp
c00019d6:	68 ec 0d 01 c0       	push   $0xc0010dec
c00019db:	e8 a5 96 00 00       	call   c000b085 <initDoubleLinkList>
c00019e0:	83 c4 10             	add    $0x10,%esp
c00019e3:	83 ec 0c             	sub    $0xc,%esp
c00019e6:	68 04 1f 01 c0       	push   $0xc0011f04
c00019eb:	e8 95 96 00 00       	call   c000b085 <initDoubleLinkList>
c00019f0:	83 c4 10             	add    $0x10,%esp
c00019f3:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00019fa:	00 00 00 
c00019fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a04:	eb 14                	jmp    c0001a1a <init+0x9a>
c0001a06:	83 ec 0c             	sub    $0xc,%esp
c0001a09:	68 ca b5 00 c0       	push   $0xc000b5ca
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
c0001a5e:	68 cb b5 00 c0       	push   $0xc000b5cb
c0001a63:	e8 24 fb ff ff       	call   c000158c <disp_str>
c0001a68:	83 c4 10             	add    $0x10,%esp
c0001a6b:	83 ec 0c             	sub    $0xc,%esp
c0001a6e:	68 d4 b5 00 c0       	push   $0xc000b5d4
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
c0001aab:	68 d6 b5 00 c0       	push   $0xc000b5d6
c0001ab0:	e8 d7 fa ff ff       	call   c000158c <disp_str>
c0001ab5:	83 c4 10             	add    $0x10,%esp
c0001ab8:	83 ec 0c             	sub    $0xc,%esp
c0001abb:	68 d4 b5 00 c0       	push   $0xc000b5d4
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
c0001aff:	68 df b5 00 c0       	push   $0xc000b5df
c0001b04:	e8 83 fa ff ff       	call   c000158c <disp_str>
c0001b09:	83 c4 10             	add    $0x10,%esp
c0001b0c:	e8 3f 7c 00 00       	call   c0009750 <test_exec>
c0001b11:	eb fe                	jmp    c0001b11 <user_proc_a+0x1b>

c0001b13 <user_proc_b>:
c0001b13:	55                   	push   %ebp
c0001b14:	89 e5                	mov    %esp,%ebp
c0001b16:	83 ec 08             	sub    $0x8,%esp
c0001b19:	83 ec 0c             	sub    $0xc,%esp
c0001b1c:	68 f1 b5 00 c0       	push   $0xc000b5f1
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
c0001b43:	e8 5c 0e 00 00       	call   c00029a4 <sys_malloc>
c0001b48:	83 c4 10             	add    $0x10,%esp
c0001b4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b4e:	83 ec 04             	sub    $0x4,%esp
c0001b51:	6a 6c                	push   $0x6c
c0001b53:	6a 00                	push   $0x0
c0001b55:	ff 75 f0             	pushl  -0x10(%ebp)
c0001b58:	e8 8e a8 00 00       	call   c000c3eb <Memset>
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
c0001b9a:	e8 4b 8a 00 00       	call   c000a5ea <send_rec>
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
c0001c0e:	68 04 b6 00 c0       	push   $0xc000b604
c0001c13:	68 04 b6 00 c0       	push   $0xc000b604
c0001c18:	68 0c b6 00 c0       	push   $0xc000b60c
c0001c1d:	e8 9c 80 00 00       	call   c0009cbe <assertion_failure>
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
c0001c79:	68 66 b6 00 c0       	push   $0xc000b666
c0001c7e:	e8 f7 7f 00 00       	call   c0009c7a <spin>
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
c0001ca4:	e8 17 0b 00 00       	call   c00027c0 <waitfor>
c0001ca9:	83 c4 10             	add    $0x10,%esp
c0001cac:	85 c0                	test   %eax,%eax
c0001cae:	75 10                	jne    c0001cc0 <hd_cmd_out+0x31>
c0001cb0:	83 ec 0c             	sub    $0xc,%esp
c0001cb3:	68 78 b6 00 c0       	push   $0xc000b678
c0001cb8:	e8 e3 7f 00 00       	call   c0009ca0 <panic>
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
c0001e14:	e8 d2 a5 00 00       	call   c000c3eb <Memset>
c0001e19:	83 c4 10             	add    $0x10,%esp
c0001e1c:	83 ec 04             	sub    $0x4,%esp
c0001e1f:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e22:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e25:	68 f0 01 00 00       	push   $0x1f0
c0001e2a:	e8 10 a6 00 00       	call   c000c43f <read_port>
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
c0001f92:	e8 73 a4 00 00       	call   c000c40a <Strcpy>
c0001f97:	83 c4 10             	add    $0x10,%esp
c0001f9a:	eb 13                	jmp    c0001faf <print_hdinfo+0x167>
c0001f9c:	83 ec 08             	sub    $0x8,%esp
c0001f9f:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001fa2:	50                   	push   %eax
c0001fa3:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001fa6:	50                   	push   %eax
c0001fa7:	e8 5e a4 00 00       	call   c000c40a <Strcpy>
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
c0001fe6:	68 82 b6 00 c0       	push   $0xc000b682
c0001feb:	e8 71 79 00 00       	call   c0009961 <Printf>
c0001ff0:	83 c4 10             	add    $0x10,%esp
c0001ff3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ff6:	8b 40 0c             	mov    0xc(%eax),%eax
c0001ff9:	83 ec 08             	sub    $0x8,%esp
c0001ffc:	50                   	push   %eax
c0001ffd:	68 8a b6 00 c0       	push   $0xc000b68a
c0002002:	e8 5a 79 00 00       	call   c0009961 <Printf>
c0002007:	83 c4 10             	add    $0x10,%esp
c000200a:	8b 45 08             	mov    0x8(%ebp),%eax
c000200d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0002011:	0f b6 c0             	movzbl %al,%eax
c0002014:	83 ec 08             	sub    $0x8,%esp
c0002017:	50                   	push   %eax
c0002018:	68 9b b6 00 c0       	push   $0xc000b69b
c000201d:	e8 3f 79 00 00       	call   c0009961 <Printf>
c0002022:	83 c4 10             	add    $0x10,%esp
c0002025:	8b 45 08             	mov    0x8(%ebp),%eax
c0002028:	0f b6 00             	movzbl (%eax),%eax
c000202b:	0f b6 c0             	movzbl %al,%eax
c000202e:	83 ec 08             	sub    $0x8,%esp
c0002031:	50                   	push   %eax
c0002032:	68 a9 b6 00 c0       	push   $0xc000b6a9
c0002037:	e8 25 79 00 00       	call   c0009961 <Printf>
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
c00020db:	e8 0b a3 00 00       	call   c000c3eb <Memset>
c00020e0:	83 c4 10             	add    $0x10,%esp
c00020e3:	83 ec 04             	sub    $0x4,%esp
c00020e6:	ff 75 f4             	pushl  -0xc(%ebp)
c00020e9:	ff 75 ec             	pushl  -0x14(%ebp)
c00020ec:	68 f0 01 00 00       	push   $0x1f0
c00020f1:	e8 49 a3 00 00       	call   c000c43f <read_port>
c00020f6:	83 c4 10             	add    $0x10,%esp
c00020f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00020fc:	05 be 01 00 00       	add    $0x1be,%eax
c0002101:	83 ec 04             	sub    $0x4,%esp
c0002104:	6a 40                	push   $0x40
c0002106:	50                   	push   %eax
c0002107:	ff 75 10             	pushl  0x10(%ebp)
c000210a:	e8 ca 5b 00 00       	call   c0007cd9 <Memcpy>
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
c0002178:	e8 6e a2 00 00       	call   c000c3eb <Memset>
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
c00022aa:	e8 3c a1 00 00       	call   c000c3eb <Memset>
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
c000238c:	e8 13 06 00 00       	call   c00029a4 <sys_malloc>
c0002391:	83 c4 10             	add    $0x10,%esp
c0002394:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002397:	83 ec 04             	sub    $0x4,%esp
c000239a:	6a 6c                	push   $0x6c
c000239c:	6a 00                	push   $0x0
c000239e:	ff 75 f0             	pushl  -0x10(%ebp)
c00023a1:	e8 45 a0 00 00       	call   c000c3eb <Memset>
c00023a6:	83 c4 10             	add    $0x10,%esp
c00023a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023ac:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00023b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023b6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00023bd:	83 ec 04             	sub    $0x4,%esp
c00023c0:	6a 02                	push   $0x2
c00023c2:	ff 75 f0             	pushl  -0x10(%ebp)
c00023c5:	6a 01                	push   $0x1
c00023c7:	e8 1e 82 00 00       	call   c000a5ea <send_rec>
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
c000242b:	e8 74 05 00 00       	call   c00029a4 <sys_malloc>
c0002430:	83 c4 10             	add    $0x10,%esp
c0002433:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002436:	83 ec 04             	sub    $0x4,%esp
c0002439:	6a 6c                	push   $0x6c
c000243b:	6a 00                	push   $0x0
c000243d:	ff 75 ec             	pushl  -0x14(%ebp)
c0002440:	e8 a6 9f 00 00       	call   c000c3eb <Memset>
c0002445:	83 c4 10             	add    $0x10,%esp
c0002448:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000244b:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002452:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002455:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000245c:	83 ec 04             	sub    $0x4,%esp
c000245f:	6a 02                	push   $0x2
c0002461:	ff 75 ec             	pushl  -0x14(%ebp)
c0002464:	6a 01                	push   $0x1
c0002466:	e8 7f 81 00 00       	call   c000a5ea <send_rec>
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
c0002485:	e8 36 03 00 00       	call   c00027c0 <waitfor>
c000248a:	83 c4 10             	add    $0x10,%esp
c000248d:	85 c0                	test   %eax,%eax
c000248f:	75 10                	jne    c00024a1 <wait_for+0x2e>
c0002491:	83 ec 0c             	sub    $0xc,%esp
c0002494:	68 b4 b6 00 c0       	push   $0xc000b6b4
c0002499:	e8 02 78 00 00       	call   c0009ca0 <panic>
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
c00024af:	e8 f0 04 00 00       	call   c00029a4 <sys_malloc>
c00024b4:	83 c4 10             	add    $0x10,%esp
c00024b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024ba:	83 ec 04             	sub    $0x4,%esp
c00024bd:	6a 6c                	push   $0x6c
c00024bf:	6a 00                	push   $0x0
c00024c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00024c4:	e8 22 9f 00 00       	call   c000c3eb <Memset>
c00024c9:	83 c4 10             	add    $0x10,%esp
c00024cc:	83 ec 04             	sub    $0x4,%esp
c00024cf:	68 13 02 00 00       	push   $0x213
c00024d4:	ff 75 f4             	pushl  -0xc(%ebp)
c00024d7:	6a 02                	push   $0x2
c00024d9:	e8 0c 81 00 00       	call   c000a5ea <send_rec>
c00024de:	83 c4 10             	add    $0x10,%esp
c00024e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024e4:	83 ec 08             	sub    $0x8,%esp
c00024e7:	6a 6c                	push   $0x6c
c00024e9:	50                   	push   %eax
c00024ea:	e8 49 51 00 00       	call   c0007638 <sys_free>
c00024ef:	83 c4 10             	add    $0x10,%esp
c00024f2:	90                   	nop
c00024f3:	c9                   	leave  
c00024f4:	c3                   	ret    

c00024f5 <hd_rdwt>:
c00024f5:	55                   	push   %ebp
c00024f6:	89 e5                	mov    %esp,%ebp
c00024f8:	81 ec b8 00 00 00    	sub    $0xb8,%esp
c00024fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0002501:	8b 40 18             	mov    0x18(%eax),%eax
c0002504:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002507:	8b 45 08             	mov    0x8(%ebp),%eax
c000250a:	8b 40 14             	mov    0x14(%eax),%eax
c000250d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002510:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c0002514:	7f 19                	jg     c000252f <hd_rdwt+0x3a>
c0002516:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002519:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000251e:	89 c8                	mov    %ecx,%eax
c0002520:	f7 ea                	imul   %edx
c0002522:	d1 fa                	sar    %edx
c0002524:	89 c8                	mov    %ecx,%eax
c0002526:	c1 f8 1f             	sar    $0x1f,%eax
c0002529:	29 c2                	sub    %eax,%edx
c000252b:	89 d0                	mov    %edx,%eax
c000252d:	eb 11                	jmp    c0002540 <hd_rdwt+0x4b>
c000252f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002532:	83 e8 10             	sub    $0x10,%eax
c0002535:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002538:	85 c0                	test   %eax,%eax
c000253a:	0f 48 c2             	cmovs  %edx,%eax
c000253d:	c1 f8 06             	sar    $0x6,%eax
c0002540:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002543:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002546:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002549:	89 d0                	mov    %edx,%eax
c000254b:	c1 f8 1f             	sar    $0x1f,%eax
c000254e:	c1 e8 1a             	shr    $0x1a,%eax
c0002551:	01 c2                	add    %eax,%edx
c0002553:	83 e2 3f             	and    $0x3f,%edx
c0002556:	29 c2                	sub    %eax,%edx
c0002558:	89 d0                	mov    %edx,%eax
c000255a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000255d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002560:	c1 e8 09             	shr    $0x9,%eax
c0002563:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002566:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c000256a:	7f 1a                	jg     c0002586 <hd_rdwt+0x91>
c000256c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000256f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002572:	c1 e2 03             	shl    $0x3,%edx
c0002575:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000257b:	01 d0                	add    %edx,%eax
c000257d:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002582:	8b 00                	mov    (%eax),%eax
c0002584:	eb 1b                	jmp    c00025a1 <hd_rdwt+0xac>
c0002586:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002589:	8d 50 04             	lea    0x4(%eax),%edx
c000258c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000258f:	c1 e2 03             	shl    $0x3,%edx
c0002592:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002598:	01 d0                	add    %edx,%eax
c000259a:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000259f:	8b 00                	mov    (%eax),%eax
c00025a1:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00025a4:	01 d0                	add    %edx,%eax
c00025a6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00025a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00025ac:	8b 40 0c             	mov    0xc(%eax),%eax
c00025af:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00025b2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025b5:	05 ff 01 00 00       	add    $0x1ff,%eax
c00025ba:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00025c0:	85 c0                	test   %eax,%eax
c00025c2:	0f 48 c2             	cmovs  %edx,%eax
c00025c5:	c1 f8 09             	sar    $0x9,%eax
c00025c8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00025cb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00025d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00025d4:	8b 40 10             	mov    0x10(%eax),%eax
c00025d7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00025da:	8b 45 08             	mov    0x8(%ebp),%eax
c00025dd:	8b 00                	mov    (%eax),%eax
c00025df:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00025e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00025e5:	83 ec 08             	sub    $0x8,%esp
c00025e8:	50                   	push   %eax
c00025e9:	ff 75 d0             	pushl  -0x30(%ebp)
c00025ec:	e8 d8 49 00 00       	call   c0006fc9 <alloc_virtual_memory>
c00025f1:	83 c4 10             	add    $0x10,%esp
c00025f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00025f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00025fa:	8b 40 68             	mov    0x68(%eax),%eax
c00025fd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002600:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002604:	74 22                	je     c0002628 <hd_rdwt+0x133>
c0002606:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000260a:	74 1c                	je     c0002628 <hd_rdwt+0x133>
c000260c:	68 b3 01 00 00       	push   $0x1b3
c0002611:	68 04 b6 00 c0       	push   $0xc000b604
c0002616:	68 04 b6 00 c0       	push   $0xc000b604
c000261b:	68 c6 b6 00 c0       	push   $0xc000b6c6
c0002620:	e8 99 76 00 00       	call   c0009cbe <assertion_failure>
c0002625:	83 c4 10             	add    $0x10,%esp
c0002628:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c000262c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000262f:	88 45 be             	mov    %al,-0x42(%ebp)
c0002632:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002635:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002638:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000263b:	c1 f8 08             	sar    $0x8,%eax
c000263e:	88 45 c0             	mov    %al,-0x40(%ebp)
c0002641:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002644:	c1 f8 10             	sar    $0x10,%eax
c0002647:	88 45 c1             	mov    %al,-0x3f(%ebp)
c000264a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000264d:	c1 f8 18             	sar    $0x18,%eax
c0002650:	83 e0 0f             	and    $0xf,%eax
c0002653:	83 c8 e0             	or     $0xffffffe0,%eax
c0002656:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002659:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000265d:	75 07                	jne    c0002666 <hd_rdwt+0x171>
c000265f:	b8 20 00 00 00       	mov    $0x20,%eax
c0002664:	eb 05                	jmp    c000266b <hd_rdwt+0x176>
c0002666:	b8 30 00 00 00       	mov    $0x30,%eax
c000266b:	88 45 c3             	mov    %al,-0x3d(%ebp)
c000266e:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002672:	3c 20                	cmp    $0x20,%al
c0002674:	74 24                	je     c000269a <hd_rdwt+0x1a5>
c0002676:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c000267a:	3c 30                	cmp    $0x30,%al
c000267c:	74 1c                	je     c000269a <hd_rdwt+0x1a5>
c000267e:	68 c1 01 00 00       	push   $0x1c1
c0002683:	68 04 b6 00 c0       	push   $0xc000b604
c0002688:	68 04 b6 00 c0       	push   $0xc000b604
c000268d:	68 e4 b6 00 c0       	push   $0xc000b6e4
c0002692:	e8 27 76 00 00       	call   c0009cbe <assertion_failure>
c0002697:	83 c4 10             	add    $0x10,%esp
c000269a:	83 ec 0c             	sub    $0xc,%esp
c000269d:	8d 45 bd             	lea    -0x43(%ebp),%eax
c00026a0:	50                   	push   %eax
c00026a1:	e8 e9 f5 ff ff       	call   c0001c8f <hd_cmd_out>
c00026a6:	83 c4 10             	add    $0x10,%esp
c00026a9:	e9 9c 00 00 00       	jmp    c000274a <hd_rdwt+0x255>
c00026ae:	b8 00 02 00 00       	mov    $0x200,%eax
c00026b3:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00026ba:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00026be:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00026c1:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00026c5:	75 51                	jne    c0002718 <hd_rdwt+0x223>
c00026c7:	e8 a7 fd ff ff       	call   c0002473 <wait_for>
c00026cc:	e8 d3 fd ff ff       	call   c00024a4 <interrupt_wait>
c00026d1:	83 ec 04             	sub    $0x4,%esp
c00026d4:	ff 75 c4             	pushl  -0x3c(%ebp)
c00026d7:	6a 00                	push   $0x0
c00026d9:	68 80 21 01 c0       	push   $0xc0012180
c00026de:	e8 08 9d 00 00       	call   c000c3eb <Memset>
c00026e3:	83 c4 10             	add    $0x10,%esp
c00026e6:	83 ec 04             	sub    $0x4,%esp
c00026e9:	68 00 02 00 00       	push   $0x200
c00026ee:	68 80 21 01 c0       	push   $0xc0012180
c00026f3:	68 f0 01 00 00       	push   $0x1f0
c00026f8:	e8 42 9d 00 00       	call   c000c43f <read_port>
c00026fd:	83 c4 10             	add    $0x10,%esp
c0002700:	83 ec 04             	sub    $0x4,%esp
c0002703:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002706:	68 80 21 01 c0       	push   $0xc0012180
c000270b:	ff 75 f0             	pushl  -0x10(%ebp)
c000270e:	e8 c6 55 00 00       	call   c0007cd9 <Memcpy>
c0002713:	83 c4 10             	add    $0x10,%esp
c0002716:	eb 26                	jmp    c000273e <hd_rdwt+0x249>
c0002718:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000271c:	75 20                	jne    c000273e <hd_rdwt+0x249>
c000271e:	e8 50 fd ff ff       	call   c0002473 <wait_for>
c0002723:	83 ec 04             	sub    $0x4,%esp
c0002726:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002729:	ff 75 f0             	pushl  -0x10(%ebp)
c000272c:	68 f0 01 00 00       	push   $0x1f0
c0002731:	e8 1d 9d 00 00       	call   c000c453 <write_port>
c0002736:	83 c4 10             	add    $0x10,%esp
c0002739:	e8 66 fd ff ff       	call   c00024a4 <interrupt_wait>
c000273e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002741:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002744:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002747:	01 45 f0             	add    %eax,-0x10(%ebp)
c000274a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000274e:	0f 85 5a ff ff ff    	jne    c00026ae <hd_rdwt+0x1b9>
c0002754:	83 ec 04             	sub    $0x4,%esp
c0002757:	6a 6c                	push   $0x6c
c0002759:	6a 00                	push   $0x0
c000275b:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0002761:	50                   	push   %eax
c0002762:	e8 84 9c 00 00       	call   c000c3eb <Memset>
c0002767:	83 c4 10             	add    $0x10,%esp
c000276a:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0002771:	c7 85 58 ff ff ff 00 	movl   $0x0,-0xa8(%ebp)
c0002778:	00 00 00 
c000277b:	83 ec 04             	sub    $0x4,%esp
c000277e:	6a 02                	push   $0x2
c0002780:	8d 85 50 ff ff ff    	lea    -0xb0(%ebp),%eax
c0002786:	50                   	push   %eax
c0002787:	6a 01                	push   $0x1
c0002789:	e8 5c 7e 00 00       	call   c000a5ea <send_rec>
c000278e:	83 c4 10             	add    $0x10,%esp
c0002791:	90                   	nop
c0002792:	c9                   	leave  
c0002793:	c3                   	ret    

c0002794 <hd_handler>:
c0002794:	55                   	push   %ebp
c0002795:	89 e5                	mov    %esp,%ebp
c0002797:	83 ec 18             	sub    $0x18,%esp
c000279a:	83 ec 0c             	sub    $0xc,%esp
c000279d:	68 f7 01 00 00       	push   $0x1f7
c00027a2:	e8 e6 ef ff ff       	call   c000178d <in_byte>
c00027a7:	83 c4 10             	add    $0x10,%esp
c00027aa:	0f b6 c0             	movzbl %al,%eax
c00027ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00027b0:	83 ec 0c             	sub    $0xc,%esp
c00027b3:	6a 03                	push   $0x3
c00027b5:	e8 bf 80 00 00       	call   c000a879 <inform_int>
c00027ba:	83 c4 10             	add    $0x10,%esp
c00027bd:	90                   	nop
c00027be:	c9                   	leave  
c00027bf:	c3                   	ret    

c00027c0 <waitfor>:
c00027c0:	55                   	push   %ebp
c00027c1:	89 e5                	mov    %esp,%ebp
c00027c3:	83 ec 18             	sub    $0x18,%esp
c00027c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00027cd:	eb 26                	jmp    c00027f5 <waitfor+0x35>
c00027cf:	83 ec 0c             	sub    $0xc,%esp
c00027d2:	68 f7 01 00 00       	push   $0x1f7
c00027d7:	e8 b1 ef ff ff       	call   c000178d <in_byte>
c00027dc:	83 c4 10             	add    $0x10,%esp
c00027df:	0f b6 c0             	movzbl %al,%eax
c00027e2:	23 45 08             	and    0x8(%ebp),%eax
c00027e5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00027e8:	75 07                	jne    c00027f1 <waitfor+0x31>
c00027ea:	b8 01 00 00 00       	mov    $0x1,%eax
c00027ef:	eb 11                	jmp    c0002802 <waitfor+0x42>
c00027f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00027f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00027f8:	3b 45 10             	cmp    0x10(%ebp),%eax
c00027fb:	7c d2                	jl     c00027cf <waitfor+0xf>
c00027fd:	b8 00 00 00 00       	mov    $0x0,%eax
c0002802:	c9                   	leave  
c0002803:	c3                   	ret    

c0002804 <print_hd_info>:
c0002804:	55                   	push   %ebp
c0002805:	89 e5                	mov    %esp,%ebp
c0002807:	83 ec 18             	sub    $0x18,%esp
c000280a:	83 ec 0c             	sub    $0xc,%esp
c000280d:	68 18 b7 00 c0       	push   $0xc000b718
c0002812:	e8 4a 71 00 00       	call   c0009961 <Printf>
c0002817:	83 c4 10             	add    $0x10,%esp
c000281a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002821:	eb 3b                	jmp    c000285e <print_hd_info+0x5a>
c0002823:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002826:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c000282d:	85 c0                	test   %eax,%eax
c000282f:	74 28                	je     c0002859 <print_hd_info+0x55>
c0002831:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002834:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c000283b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000283e:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c0002845:	ff 75 f4             	pushl  -0xc(%ebp)
c0002848:	52                   	push   %edx
c0002849:	50                   	push   %eax
c000284a:	68 35 b7 00 c0       	push   $0xc000b735
c000284f:	e8 0d 71 00 00       	call   c0009961 <Printf>
c0002854:	83 c4 10             	add    $0x10,%esp
c0002857:	eb 01                	jmp    c000285a <print_hd_info+0x56>
c0002859:	90                   	nop
c000285a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000285e:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002862:	7e bf                	jle    c0002823 <print_hd_info+0x1f>
c0002864:	83 ec 0c             	sub    $0xc,%esp
c0002867:	68 4d b7 00 c0       	push   $0xc000b74d
c000286c:	e8 f0 70 00 00       	call   c0009961 <Printf>
c0002871:	83 c4 10             	add    $0x10,%esp
c0002874:	83 ec 0c             	sub    $0xc,%esp
c0002877:	68 68 b7 00 c0       	push   $0xc000b768
c000287c:	e8 e0 70 00 00       	call   c0009961 <Printf>
c0002881:	83 c4 10             	add    $0x10,%esp
c0002884:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c000288b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002892:	eb 44                	jmp    c00028d8 <print_hd_info+0xd4>
c0002894:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002897:	83 c0 04             	add    $0x4,%eax
c000289a:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00028a1:	85 c0                	test   %eax,%eax
c00028a3:	74 2e                	je     c00028d3 <print_hd_info+0xcf>
c00028a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028a8:	83 c0 04             	add    $0x4,%eax
c00028ab:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00028b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028b5:	83 c0 04             	add    $0x4,%eax
c00028b8:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00028bf:	ff 75 f0             	pushl  -0x10(%ebp)
c00028c2:	52                   	push   %edx
c00028c3:	50                   	push   %eax
c00028c4:	68 35 b7 00 c0       	push   $0xc000b735
c00028c9:	e8 93 70 00 00       	call   c0009961 <Printf>
c00028ce:	83 c4 10             	add    $0x10,%esp
c00028d1:	eb 01                	jmp    c00028d4 <print_hd_info+0xd0>
c00028d3:	90                   	nop
c00028d4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00028d8:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00028dc:	7e b6                	jle    c0002894 <print_hd_info+0x90>
c00028de:	83 ec 0c             	sub    $0xc,%esp
c00028e1:	68 85 b7 00 c0       	push   $0xc000b785
c00028e6:	e8 76 70 00 00       	call   c0009961 <Printf>
c00028eb:	83 c4 10             	add    $0x10,%esp
c00028ee:	90                   	nop
c00028ef:	c9                   	leave  
c00028f0:	c3                   	ret    

c00028f1 <is_empty>:
c00028f1:	55                   	push   %ebp
c00028f2:	89 e5                	mov    %esp,%ebp
c00028f4:	83 ec 10             	sub    $0x10,%esp
c00028f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00028fe:	eb 1a                	jmp    c000291a <is_empty+0x29>
c0002900:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0002903:	8b 45 08             	mov    0x8(%ebp),%eax
c0002906:	01 d0                	add    %edx,%eax
c0002908:	0f b6 00             	movzbl (%eax),%eax
c000290b:	84 c0                	test   %al,%al
c000290d:	74 07                	je     c0002916 <is_empty+0x25>
c000290f:	b8 00 00 00 00       	mov    $0x0,%eax
c0002914:	eb 11                	jmp    c0002927 <is_empty+0x36>
c0002916:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000291a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000291d:	3b 45 0c             	cmp    0xc(%ebp),%eax
c0002920:	7c de                	jl     c0002900 <is_empty+0xf>
c0002922:	b8 01 00 00 00       	mov    $0x1,%eax
c0002927:	c9                   	leave  
c0002928:	c3                   	ret    
c0002929:	66 90                	xchg   %ax,%ax
c000292b:	66 90                	xchg   %ax,%ax
c000292d:	66 90                	xchg   %ax,%ax
c000292f:	90                   	nop

c0002930 <get_ticks>:
c0002930:	b8 00 00 00 00       	mov    $0x0,%eax
c0002935:	cd 90                	int    $0x90
c0002937:	c3                   	ret    

c0002938 <write2>:
c0002938:	b8 01 00 00 00       	mov    $0x1,%eax
c000293d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002941:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002945:	cd 90                	int    $0x90
c0002947:	c3                   	ret    

c0002948 <write_debug>:
c0002948:	b8 02 00 00 00       	mov    $0x2,%eax
c000294d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002951:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002955:	cd 90                	int    $0x90
c0002957:	c3                   	ret    

c0002958 <send_msg2>:
c0002958:	b8 03 00 00 00       	mov    $0x3,%eax
c000295d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002961:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002965:	cd 90                	int    $0x90
c0002967:	c3                   	ret    

c0002968 <send_msg>:
c0002968:	55                   	push   %ebp
c0002969:	89 e5                	mov    %esp,%ebp
c000296b:	53                   	push   %ebx
c000296c:	51                   	push   %ecx
c000296d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002972:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002975:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002978:	cd 90                	int    $0x90
c000297a:	59                   	pop    %ecx
c000297b:	5b                   	pop    %ebx
c000297c:	5d                   	pop    %ebp
c000297d:	c3                   	ret    

c000297e <receive_msg2>:
c000297e:	b8 04 00 00 00       	mov    $0x4,%eax
c0002983:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002987:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000298b:	cd 90                	int    $0x90
c000298d:	c3                   	ret    

c000298e <receive_msg>:
c000298e:	55                   	push   %ebp
c000298f:	89 e5                	mov    %esp,%ebp
c0002991:	53                   	push   %ebx
c0002992:	51                   	push   %ecx
c0002993:	b8 04 00 00 00       	mov    $0x4,%eax
c0002998:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000299b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000299e:	cd 90                	int    $0x90
c00029a0:	59                   	pop    %ecx
c00029a1:	5b                   	pop    %ebx
c00029a2:	5d                   	pop    %ebp
c00029a3:	c3                   	ret    

c00029a4 <sys_malloc>:
c00029a4:	56                   	push   %esi
c00029a5:	57                   	push   %edi
c00029a6:	53                   	push   %ebx
c00029a7:	55                   	push   %ebp
c00029a8:	89 e5                	mov    %esp,%ebp
c00029aa:	b8 05 00 00 00       	mov    $0x5,%eax
c00029af:	8b 4d 14             	mov    0x14(%ebp),%ecx
c00029b2:	cd 90                	int    $0x90
c00029b4:	5d                   	pop    %ebp
c00029b5:	5b                   	pop    %ebx
c00029b6:	5f                   	pop    %edi
c00029b7:	5e                   	pop    %esi
c00029b8:	c3                   	ret    

c00029b9 <task_fs>:
c00029b9:	55                   	push   %ebp
c00029ba:	89 e5                	mov    %esp,%ebp
c00029bc:	83 ec 28             	sub    $0x28,%esp
c00029bf:	e8 bc 08 00 00       	call   c0003280 <init_fs>
c00029c4:	83 ec 0c             	sub    $0xc,%esp
c00029c7:	6a 6c                	push   $0x6c
c00029c9:	e8 d6 ff ff ff       	call   c00029a4 <sys_malloc>
c00029ce:	83 c4 10             	add    $0x10,%esp
c00029d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00029d4:	83 ec 0c             	sub    $0xc,%esp
c00029d7:	6a 6c                	push   $0x6c
c00029d9:	e8 c6 ff ff ff       	call   c00029a4 <sys_malloc>
c00029de:	83 c4 10             	add    $0x10,%esp
c00029e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00029e4:	83 ec 04             	sub    $0x4,%esp
c00029e7:	6a 6c                	push   $0x6c
c00029e9:	6a 00                	push   $0x0
c00029eb:	ff 75 f4             	pushl  -0xc(%ebp)
c00029ee:	e8 f8 99 00 00       	call   c000c3eb <Memset>
c00029f3:	83 c4 10             	add    $0x10,%esp
c00029f6:	83 ec 04             	sub    $0x4,%esp
c00029f9:	6a 12                	push   $0x12
c00029fb:	ff 75 f4             	pushl  -0xc(%ebp)
c00029fe:	6a 02                	push   $0x2
c0002a00:	e8 e5 7b 00 00       	call   c000a5ea <send_rec>
c0002a05:	83 c4 10             	add    $0x10,%esp
c0002a08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a0b:	8b 40 68             	mov    0x68(%eax),%eax
c0002a0e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002a11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a14:	8b 00                	mov    (%eax),%eax
c0002a16:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a1c:	8b 40 40             	mov    0x40(%eax),%eax
c0002a1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a25:	8b 40 58             	mov    0x58(%eax),%eax
c0002a28:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a2e:	8b 00                	mov    (%eax),%eax
c0002a30:	85 c0                	test   %eax,%eax
c0002a32:	75 07                	jne    c0002a3b <task_fs+0x82>
c0002a34:	c7 45 dc 05 00 00 00 	movl   $0x5,-0x24(%ebp)
c0002a3b:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0002a42:	83 ec 0c             	sub    $0xc,%esp
c0002a45:	ff 75 e8             	pushl  -0x18(%ebp)
c0002a48:	e8 39 21 00 00       	call   c0004b86 <pid2proc>
c0002a4d:	83 c4 10             	add    $0x10,%esp
c0002a50:	a3 c8 0b 01 c0       	mov    %eax,0xc0010bc8
c0002a55:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002a59:	74 37                	je     c0002a92 <task_fs+0xd9>
c0002a5b:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002a5f:	74 31                	je     c0002a92 <task_fs+0xd9>
c0002a61:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002a65:	74 2b                	je     c0002a92 <task_fs+0xd9>
c0002a67:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002a6b:	74 25                	je     c0002a92 <task_fs+0xd9>
c0002a6d:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0002a71:	74 1f                	je     c0002a92 <task_fs+0xd9>
c0002a73:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0002a77:	74 19                	je     c0002a92 <task_fs+0xd9>
c0002a79:	6a 7a                	push   $0x7a
c0002a7b:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0002a80:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0002a85:	68 b4 b7 00 c0       	push   $0xc000b7b4
c0002a8a:	e8 2f 72 00 00       	call   c0009cbe <assertion_failure>
c0002a8f:	83 c4 10             	add    $0x10,%esp
c0002a92:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002a96:	74 3a                	je     c0002ad2 <task_fs+0x119>
c0002a98:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
c0002a9c:	7f 19                	jg     c0002ab7 <task_fs+0xfe>
c0002a9e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0002aa2:	0f 84 10 01 00 00    	je     c0002bb8 <task_fs+0x1ff>
c0002aa8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
c0002aac:	0f 84 a1 00 00 00    	je     c0002b53 <task_fs+0x19a>
c0002ab2:	e9 ef 00 00 00       	jmp    c0002ba6 <task_fs+0x1ed>
c0002ab7:	83 7d ec 0a          	cmpl   $0xa,-0x14(%ebp)
c0002abb:	74 50                	je     c0002b0d <task_fs+0x154>
c0002abd:	83 7d ec 66          	cmpl   $0x66,-0x14(%ebp)
c0002ac1:	0f 84 c6 00 00 00    	je     c0002b8d <task_fs+0x1d4>
c0002ac7:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
c0002acb:	74 40                	je     c0002b0d <task_fs+0x154>
c0002acd:	e9 d4 00 00 00       	jmp    c0002ba6 <task_fs+0x1ed>
c0002ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ad5:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002adc:	83 ec 0c             	sub    $0xc,%esp
c0002adf:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ae2:	e8 ee 07 00 00       	call   c00032d5 <do_open>
c0002ae7:	83 c4 10             	add    $0x10,%esp
c0002aea:	89 c2                	mov    %eax,%edx
c0002aec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002aef:	89 50 40             	mov    %edx,0x40(%eax)
c0002af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002af5:	8b 00                	mov    (%eax),%eax
c0002af7:	83 ec 04             	sub    $0x4,%esp
c0002afa:	50                   	push   %eax
c0002afb:	ff 75 f4             	pushl  -0xc(%ebp)
c0002afe:	6a 01                	push   $0x1
c0002b00:	e8 e5 7a 00 00       	call   c000a5ea <send_rec>
c0002b05:	83 c4 10             	add    $0x10,%esp
c0002b08:	e9 b2 00 00 00       	jmp    c0002bbf <task_fs+0x206>
c0002b0d:	83 ec 0c             	sub    $0xc,%esp
c0002b10:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b13:	e8 fb 18 00 00       	call   c0004413 <do_rdwt>
c0002b18:	83 c4 10             	add    $0x10,%esp
c0002b1b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002b1e:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0002b22:	0f 84 96 00 00 00    	je     c0002bbe <task_fs+0x205>
c0002b28:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b2b:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002b32:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b38:	89 50 50             	mov    %edx,0x50(%eax)
c0002b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b3e:	8b 00                	mov    (%eax),%eax
c0002b40:	83 ec 04             	sub    $0x4,%esp
c0002b43:	50                   	push   %eax
c0002b44:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b47:	6a 01                	push   $0x1
c0002b49:	e8 9c 7a 00 00       	call   c000a5ea <send_rec>
c0002b4e:	83 c4 10             	add    $0x10,%esp
c0002b51:	eb 6b                	jmp    c0002bbe <task_fs+0x205>
c0002b53:	83 ec 0c             	sub    $0xc,%esp
c0002b56:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002b59:	e8 d2 1d 00 00       	call   c0004930 <do_close>
c0002b5e:	83 c4 10             	add    $0x10,%esp
c0002b61:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b64:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0002b6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b6e:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c0002b75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b78:	8b 00                	mov    (%eax),%eax
c0002b7a:	83 ec 04             	sub    $0x4,%esp
c0002b7d:	50                   	push   %eax
c0002b7e:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b81:	6a 01                	push   $0x1
c0002b83:	e8 62 7a 00 00       	call   c000a5ea <send_rec>
c0002b88:	83 c4 10             	add    $0x10,%esp
c0002b8b:	eb 32                	jmp    c0002bbf <task_fs+0x206>
c0002b8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b90:	8b 40 58             	mov    0x58(%eax),%eax
c0002b93:	83 ec 04             	sub    $0x4,%esp
c0002b96:	50                   	push   %eax
c0002b97:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b9a:	6a 01                	push   $0x1
c0002b9c:	e8 49 7a 00 00       	call   c000a5ea <send_rec>
c0002ba1:	83 c4 10             	add    $0x10,%esp
c0002ba4:	eb 19                	jmp    c0002bbf <task_fs+0x206>
c0002ba6:	83 ec 0c             	sub    $0xc,%esp
c0002ba9:	68 17 b8 00 c0       	push   $0xc000b817
c0002bae:	e8 ed 70 00 00       	call   c0009ca0 <panic>
c0002bb3:	83 c4 10             	add    $0x10,%esp
c0002bb6:	eb 07                	jmp    c0002bbf <task_fs+0x206>
c0002bb8:	90                   	nop
c0002bb9:	e9 26 fe ff ff       	jmp    c00029e4 <task_fs+0x2b>
c0002bbe:	90                   	nop
c0002bbf:	e9 20 fe ff ff       	jmp    c00029e4 <task_fs+0x2b>

c0002bc4 <rd_wt>:
c0002bc4:	55                   	push   %ebp
c0002bc5:	89 e5                	mov    %esp,%ebp
c0002bc7:	83 ec 18             	sub    $0x18,%esp
c0002bca:	83 ec 0c             	sub    $0xc,%esp
c0002bcd:	6a 6c                	push   $0x6c
c0002bcf:	e8 d0 fd ff ff       	call   c00029a4 <sys_malloc>
c0002bd4:	83 c4 10             	add    $0x10,%esp
c0002bd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002bda:	83 ec 04             	sub    $0x4,%esp
c0002bdd:	6a 6c                	push   $0x6c
c0002bdf:	6a 00                	push   $0x0
c0002be1:	ff 75 f4             	pushl  -0xc(%ebp)
c0002be4:	e8 02 98 00 00       	call   c000c3eb <Memset>
c0002be9:	83 c4 10             	add    $0x10,%esp
c0002bec:	8b 55 18             	mov    0x18(%ebp),%edx
c0002bef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bf2:	89 50 68             	mov    %edx,0x68(%eax)
c0002bf5:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002bf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bfb:	89 50 14             	mov    %edx,0x14(%eax)
c0002bfe:	8b 55 10             	mov    0x10(%ebp),%edx
c0002c01:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c04:	89 50 10             	mov    %edx,0x10(%eax)
c0002c07:	8b 55 14             	mov    0x14(%ebp),%edx
c0002c0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c0d:	89 50 0c             	mov    %edx,0xc(%eax)
c0002c10:	8b 45 08             	mov    0x8(%ebp),%eax
c0002c13:	c1 e0 09             	shl    $0x9,%eax
c0002c16:	89 c2                	mov    %eax,%edx
c0002c18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c1b:	89 50 18             	mov    %edx,0x18(%eax)
c0002c1e:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002c22:	74 22                	je     c0002c46 <rd_wt+0x82>
c0002c24:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002c28:	74 1c                	je     c0002c46 <rd_wt+0x82>
c0002c2a:	68 b1 00 00 00       	push   $0xb1
c0002c2f:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0002c34:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0002c39:	68 2a b8 00 c0       	push   $0xc000b82a
c0002c3e:	e8 7b 70 00 00       	call   c0009cbe <assertion_failure>
c0002c43:	83 c4 10             	add    $0x10,%esp
c0002c46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c49:	8b 40 68             	mov    0x68(%eax),%eax
c0002c4c:	83 f8 07             	cmp    $0x7,%eax
c0002c4f:	74 27                	je     c0002c78 <rd_wt+0xb4>
c0002c51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c54:	8b 40 68             	mov    0x68(%eax),%eax
c0002c57:	83 f8 0a             	cmp    $0xa,%eax
c0002c5a:	74 1c                	je     c0002c78 <rd_wt+0xb4>
c0002c5c:	68 b2 00 00 00       	push   $0xb2
c0002c61:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0002c66:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0002c6b:	68 48 b8 00 c0       	push   $0xc000b848
c0002c70:	e8 49 70 00 00       	call   c0009cbe <assertion_failure>
c0002c75:	83 c4 10             	add    $0x10,%esp
c0002c78:	83 ec 04             	sub    $0x4,%esp
c0002c7b:	6a 03                	push   $0x3
c0002c7d:	ff 75 f4             	pushl  -0xc(%ebp)
c0002c80:	6a 03                	push   $0x3
c0002c82:	e8 63 79 00 00       	call   c000a5ea <send_rec>
c0002c87:	83 c4 10             	add    $0x10,%esp
c0002c8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c8d:	83 ec 08             	sub    $0x8,%esp
c0002c90:	6a 6c                	push   $0x6c
c0002c92:	50                   	push   %eax
c0002c93:	e8 a0 49 00 00       	call   c0007638 <sys_free>
c0002c98:	83 c4 10             	add    $0x10,%esp
c0002c9b:	90                   	nop
c0002c9c:	c9                   	leave  
c0002c9d:	c3                   	ret    

c0002c9e <mkfs>:
c0002c9e:	55                   	push   %ebp
c0002c9f:	89 e5                	mov    %esp,%ebp
c0002ca1:	57                   	push   %edi
c0002ca2:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002ca8:	83 ec 0c             	sub    $0xc,%esp
c0002cab:	68 00 80 00 00       	push   $0x8000
c0002cb0:	e8 ef fc ff ff       	call   c00029a4 <sys_malloc>
c0002cb5:	83 c4 10             	add    $0x10,%esp
c0002cb8:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002cbd:	83 ec 0c             	sub    $0xc,%esp
c0002cc0:	6a 24                	push   $0x24
c0002cc2:	e8 dd fc ff ff       	call   c00029a4 <sys_malloc>
c0002cc7:	83 c4 10             	add    $0x10,%esp
c0002cca:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002ccf:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cd4:	83 ec 0c             	sub    $0xc,%esp
c0002cd7:	50                   	push   %eax
c0002cd8:	e8 b3 43 00 00       	call   c0007090 <get_physical_address>
c0002cdd:	83 c4 10             	add    $0x10,%esp
c0002ce0:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002ce5:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002cea:	83 ec 0c             	sub    $0xc,%esp
c0002ced:	50                   	push   %eax
c0002cee:	e8 9d 43 00 00       	call   c0007090 <get_physical_address>
c0002cf3:	83 c4 10             	add    $0x10,%esp
c0002cf6:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002cfb:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d00:	83 ec 04             	sub    $0x4,%esp
c0002d03:	68 00 02 00 00       	push   $0x200
c0002d08:	6a 00                	push   $0x0
c0002d0a:	50                   	push   %eax
c0002d0b:	e8 db 96 00 00       	call   c000c3eb <Memset>
c0002d10:	83 c4 10             	add    $0x10,%esp
c0002d13:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d18:	83 ec 0c             	sub    $0xc,%esp
c0002d1b:	6a 0a                	push   $0xa
c0002d1d:	68 00 02 00 00       	push   $0x200
c0002d22:	50                   	push   %eax
c0002d23:	6a 20                	push   $0x20
c0002d25:	6a 00                	push   $0x0
c0002d27:	e8 98 fe ff ff       	call   c0002bc4 <rd_wt>
c0002d2c:	83 c4 20             	add    $0x20,%esp
c0002d2f:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d34:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002d37:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d3a:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002d41:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d44:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002d4b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d4e:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002d55:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d58:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002d5f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d62:	8b 40 04             	mov    0x4(%eax),%eax
c0002d65:	8d 50 02             	lea    0x2(%eax),%edx
c0002d68:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d6b:	8b 40 08             	mov    0x8(%eax),%eax
c0002d6e:	01 c2                	add    %eax,%edx
c0002d70:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d73:	8b 40 0c             	mov    0xc(%eax),%eax
c0002d76:	01 c2                	add    %eax,%edx
c0002d78:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002d7b:	89 10                	mov    %edx,(%eax)
c0002d7d:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002d84:	b8 00 02 00 00       	mov    $0x200,%eax
c0002d89:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002d8c:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002d92:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002d95:	01 ca                	add    %ecx,%edx
c0002d97:	83 ec 04             	sub    $0x4,%esp
c0002d9a:	50                   	push   %eax
c0002d9b:	6a 80                	push   $0xffffff80
c0002d9d:	52                   	push   %edx
c0002d9e:	e8 48 96 00 00       	call   c000c3eb <Memset>
c0002da3:	83 c4 10             	add    $0x10,%esp
c0002da6:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002dab:	83 ec 0c             	sub    $0xc,%esp
c0002dae:	6a 0a                	push   $0xa
c0002db0:	68 00 02 00 00       	push   $0x200
c0002db5:	50                   	push   %eax
c0002db6:	6a 20                	push   $0x20
c0002db8:	6a 01                	push   $0x1
c0002dba:	e8 05 fe ff ff       	call   c0002bc4 <rd_wt>
c0002dbf:	83 c4 20             	add    $0x20,%esp
c0002dc2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002dc5:	8b 10                	mov    (%eax),%edx
c0002dc7:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002dca:	8b 50 04             	mov    0x4(%eax),%edx
c0002dcd:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002dd0:	8b 50 08             	mov    0x8(%eax),%edx
c0002dd3:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002dd6:	8b 50 0c             	mov    0xc(%eax),%edx
c0002dd9:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002ddc:	8b 50 10             	mov    0x10(%eax),%edx
c0002ddf:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002de2:	8b 50 14             	mov    0x14(%eax),%edx
c0002de5:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002de8:	8b 50 18             	mov    0x18(%eax),%edx
c0002deb:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002dee:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002df1:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002df4:	8b 40 20             	mov    0x20(%eax),%eax
c0002df7:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002dfa:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002dfe:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002e02:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e07:	83 ec 04             	sub    $0x4,%esp
c0002e0a:	6a 01                	push   $0x1
c0002e0c:	52                   	push   %edx
c0002e0d:	50                   	push   %eax
c0002e0e:	e8 d8 95 00 00       	call   c000c3eb <Memset>
c0002e13:	83 c4 10             	add    $0x10,%esp
c0002e16:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e1b:	83 c0 01             	add    $0x1,%eax
c0002e1e:	83 ec 04             	sub    $0x4,%esp
c0002e21:	68 ff 01 00 00       	push   $0x1ff
c0002e26:	6a 80                	push   $0xffffff80
c0002e28:	50                   	push   %eax
c0002e29:	e8 bd 95 00 00       	call   c000c3eb <Memset>
c0002e2e:	83 c4 10             	add    $0x10,%esp
c0002e31:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e36:	83 ec 0c             	sub    $0xc,%esp
c0002e39:	6a 0a                	push   $0xa
c0002e3b:	68 00 02 00 00       	push   $0x200
c0002e40:	50                   	push   %eax
c0002e41:	6a 20                	push   $0x20
c0002e43:	6a 02                	push   $0x2
c0002e45:	e8 7a fd ff ff       	call   c0002bc4 <rd_wt>
c0002e4a:	83 c4 20             	add    $0x20,%esp
c0002e4d:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002e54:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e59:	83 ec 04             	sub    $0x4,%esp
c0002e5c:	68 00 02 00 00       	push   $0x200
c0002e61:	6a ff                	push   $0xffffffff
c0002e63:	50                   	push   %eax
c0002e64:	e8 82 95 00 00       	call   c000c3eb <Memset>
c0002e69:	83 c4 10             	add    $0x10,%esp
c0002e6c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002e71:	83 ec 0c             	sub    $0xc,%esp
c0002e74:	6a 0a                	push   $0xa
c0002e76:	68 00 02 00 00       	push   $0x200
c0002e7b:	50                   	push   %eax
c0002e7c:	6a 20                	push   $0x20
c0002e7e:	ff 75 d0             	pushl  -0x30(%ebp)
c0002e81:	e8 3e fd ff ff       	call   c0002bc4 <rd_wt>
c0002e86:	83 c4 20             	add    $0x20,%esp
c0002e89:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e8e:	83 ec 04             	sub    $0x4,%esp
c0002e91:	6a 01                	push   $0x1
c0002e93:	6a 01                	push   $0x1
c0002e95:	50                   	push   %eax
c0002e96:	e8 50 95 00 00       	call   c000c3eb <Memset>
c0002e9b:	83 c4 10             	add    $0x10,%esp
c0002e9e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ea3:	83 c0 01             	add    $0x1,%eax
c0002ea6:	83 ec 04             	sub    $0x4,%esp
c0002ea9:	68 ff 01 00 00       	push   $0x1ff
c0002eae:	6a 00                	push   $0x0
c0002eb0:	50                   	push   %eax
c0002eb1:	e8 35 95 00 00       	call   c000c3eb <Memset>
c0002eb6:	83 c4 10             	add    $0x10,%esp
c0002eb9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ebe:	89 c2                	mov    %eax,%edx
c0002ec0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002ec3:	83 c0 01             	add    $0x1,%eax
c0002ec6:	83 ec 0c             	sub    $0xc,%esp
c0002ec9:	6a 0a                	push   $0xa
c0002ecb:	68 00 02 00 00       	push   $0x200
c0002ed0:	52                   	push   %edx
c0002ed1:	6a 20                	push   $0x20
c0002ed3:	50                   	push   %eax
c0002ed4:	e8 eb fc ff ff       	call   c0002bc4 <rd_wt>
c0002ed9:	83 c4 20             	add    $0x20,%esp
c0002edc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002edf:	83 e8 02             	sub    $0x2,%eax
c0002ee2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002ee5:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002eec:	eb 04                	jmp    c0002ef2 <mkfs+0x254>
c0002eee:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002ef2:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002ef5:	83 c0 01             	add    $0x1,%eax
c0002ef8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002efb:	7e f1                	jle    c0002eee <mkfs+0x250>
c0002efd:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f02:	89 c2                	mov    %eax,%edx
c0002f04:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002f07:	83 c0 03             	add    $0x3,%eax
c0002f0a:	83 ec 0c             	sub    $0xc,%esp
c0002f0d:	6a 0a                	push   $0xa
c0002f0f:	68 00 02 00 00       	push   $0x200
c0002f14:	52                   	push   %edx
c0002f15:	6a 20                	push   $0x20
c0002f17:	50                   	push   %eax
c0002f18:	e8 a7 fc ff ff       	call   c0002bc4 <rd_wt>
c0002f1d:	83 c4 20             	add    $0x20,%esp
c0002f20:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f25:	89 c2                	mov    %eax,%edx
c0002f27:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002f2a:	83 c0 03             	add    $0x3,%eax
c0002f2d:	83 ec 0c             	sub    $0xc,%esp
c0002f30:	6a 07                	push   $0x7
c0002f32:	68 00 02 00 00       	push   $0x200
c0002f37:	52                   	push   %edx
c0002f38:	6a 20                	push   $0x20
c0002f3a:	50                   	push   %eax
c0002f3b:	e8 84 fc ff ff       	call   c0002bc4 <rd_wt>
c0002f40:	83 c4 20             	add    $0x20,%esp
c0002f43:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002f48:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002f4b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f4e:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002f54:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f57:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002f5e:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002f61:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f64:	89 50 08             	mov    %edx,0x8(%eax)
c0002f67:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f6a:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002f71:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f74:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002f7b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f7e:	8b 10                	mov    (%eax),%edx
c0002f80:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002f86:	8b 50 04             	mov    0x4(%eax),%edx
c0002f89:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002f8f:	8b 50 08             	mov    0x8(%eax),%edx
c0002f92:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002f98:	8b 50 0c             	mov    0xc(%eax),%edx
c0002f9b:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002fa1:	8b 50 10             	mov    0x10(%eax),%edx
c0002fa4:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002faa:	8b 50 14             	mov    0x14(%eax),%edx
c0002fad:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002fb3:	8b 50 18             	mov    0x18(%eax),%edx
c0002fb6:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002fbc:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002fbf:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002fc5:	8b 50 20             	mov    0x20(%eax),%edx
c0002fc8:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002fce:	8b 40 24             	mov    0x24(%eax),%eax
c0002fd1:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002fd6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002fdd:	eb 4c                	jmp    c000302b <mkfs+0x38d>
c0002fdf:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002fe4:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002fe7:	83 c2 01             	add    $0x1,%edx
c0002fea:	c1 e2 05             	shl    $0x5,%edx
c0002fed:	01 d0                	add    %edx,%eax
c0002fef:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002ff2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ff5:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002ffb:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ffe:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0003005:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003008:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000300f:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0003016:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003019:	c1 e0 08             	shl    $0x8,%eax
c000301c:	0b 45 f0             	or     -0x10(%ebp),%eax
c000301f:	89 c2                	mov    %eax,%edx
c0003021:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003024:	89 50 08             	mov    %edx,0x8(%eax)
c0003027:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000302b:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c000302f:	7e ae                	jle    c0002fdf <mkfs+0x341>
c0003031:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0003038:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c000303e:	b8 00 00 00 00       	mov    $0x0,%eax
c0003043:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0003048:	89 d7                	mov    %edx,%edi
c000304a:	f3 ab                	rep stos %eax,%es:(%edi)
c000304c:	c7 85 70 ff ff ff 70 	movl   $0xc000b870,-0x90(%ebp)
c0003053:	b8 00 c0 
c0003056:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000305d:	eb 54                	jmp    c00030b3 <mkfs+0x415>
c000305f:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003064:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003067:	83 c2 04             	add    $0x4,%edx
c000306a:	c1 e2 05             	shl    $0x5,%edx
c000306d:	01 d0                	add    %edx,%eax
c000306f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003072:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003075:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000307b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000307e:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0003085:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003088:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000308b:	83 c2 01             	add    $0x1,%edx
c000308e:	c1 e2 0b             	shl    $0xb,%edx
c0003091:	01 c2                	add    %eax,%edx
c0003093:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003096:	89 50 08             	mov    %edx,0x8(%eax)
c0003099:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000309c:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c00030a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030a6:	8d 50 05             	lea    0x5(%eax),%edx
c00030a9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00030ac:	89 50 10             	mov    %edx,0x10(%eax)
c00030af:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00030b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00030b6:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c00030b9:	7c a4                	jl     c000305f <mkfs+0x3c1>
c00030bb:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00030c0:	89 c2                	mov    %eax,%edx
c00030c2:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00030c5:	83 c0 03             	add    $0x3,%eax
c00030c8:	83 ec 0c             	sub    $0xc,%esp
c00030cb:	6a 0a                	push   $0xa
c00030cd:	68 00 02 00 00       	push   $0x200
c00030d2:	52                   	push   %edx
c00030d3:	6a 20                	push   $0x20
c00030d5:	50                   	push   %eax
c00030d6:	e8 e9 fa ff ff       	call   c0002bc4 <rd_wt>
c00030db:	83 c4 20             	add    $0x20,%esp
c00030de:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00030e3:	89 c2                	mov    %eax,%edx
c00030e5:	8b 45 98             	mov    -0x68(%ebp),%eax
c00030e8:	83 ec 0c             	sub    $0xc,%esp
c00030eb:	6a 07                	push   $0x7
c00030ed:	68 00 02 00 00       	push   $0x200
c00030f2:	52                   	push   %edx
c00030f3:	6a 20                	push   $0x20
c00030f5:	50                   	push   %eax
c00030f6:	e8 c9 fa ff ff       	call   c0002bc4 <rd_wt>
c00030fb:	83 c4 20             	add    $0x20,%esp
c00030fe:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0003105:	00 00 00 
c0003108:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c000310f:	2e 00 
c0003111:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003116:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0003119:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000311c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0003122:	83 ec 0c             	sub    $0xc,%esp
c0003125:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c000312b:	50                   	push   %eax
c000312c:	e8 f3 92 00 00       	call   c000c424 <Strlen>
c0003131:	83 c4 10             	add    $0x10,%esp
c0003134:	89 c1                	mov    %eax,%ecx
c0003136:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003139:	8d 50 04             	lea    0x4(%eax),%edx
c000313c:	83 ec 04             	sub    $0x4,%esp
c000313f:	51                   	push   %ecx
c0003140:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0003146:	50                   	push   %eax
c0003147:	52                   	push   %edx
c0003148:	e8 8c 4b 00 00       	call   c0007cd9 <Memcpy>
c000314d:	83 c4 10             	add    $0x10,%esp
c0003150:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0003156:	b8 00 00 00 00       	mov    $0x0,%eax
c000315b:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0003160:	89 d7                	mov    %edx,%edi
c0003162:	f3 ab                	rep stos %eax,%es:(%edi)
c0003164:	c7 85 34 ff ff ff 7c 	movl   $0xc000b87c,-0xcc(%ebp)
c000316b:	b8 00 c0 
c000316e:	c7 85 38 ff ff ff 85 	movl   $0xc000b885,-0xc8(%ebp)
c0003175:	b8 00 c0 
c0003178:	c7 85 3c ff ff ff 8e 	movl   $0xc000b88e,-0xc4(%ebp)
c000317f:	b8 00 c0 
c0003182:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0003189:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003190:	eb 49                	jmp    c00031db <mkfs+0x53d>
c0003192:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003196:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003199:	8d 50 02             	lea    0x2(%eax),%edx
c000319c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000319f:	89 10                	mov    %edx,(%eax)
c00031a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00031a4:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c00031ab:	83 ec 0c             	sub    $0xc,%esp
c00031ae:	50                   	push   %eax
c00031af:	e8 70 92 00 00       	call   c000c424 <Strlen>
c00031b4:	83 c4 10             	add    $0x10,%esp
c00031b7:	89 c1                	mov    %eax,%ecx
c00031b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00031bc:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c00031c3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00031c6:	83 c2 04             	add    $0x4,%edx
c00031c9:	83 ec 04             	sub    $0x4,%esp
c00031cc:	51                   	push   %ecx
c00031cd:	50                   	push   %eax
c00031ce:	52                   	push   %edx
c00031cf:	e8 05 4b 00 00       	call   c0007cd9 <Memcpy>
c00031d4:	83 c4 10             	add    $0x10,%esp
c00031d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00031db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00031de:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c00031e1:	7c af                	jl     c0003192 <mkfs+0x4f4>
c00031e3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00031ea:	eb 66                	jmp    c0003252 <mkfs+0x5b4>
c00031ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00031ef:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00031f6:	83 ec 0c             	sub    $0xc,%esp
c00031f9:	50                   	push   %eax
c00031fa:	e8 25 92 00 00       	call   c000c424 <Strlen>
c00031ff:	83 c4 10             	add    $0x10,%esp
c0003202:	85 c0                	test   %eax,%eax
c0003204:	74 47                	je     c000324d <mkfs+0x5af>
c0003206:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c000320a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000320d:	8d 50 05             	lea    0x5(%eax),%edx
c0003210:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003213:	89 10                	mov    %edx,(%eax)
c0003215:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003218:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000321f:	83 ec 0c             	sub    $0xc,%esp
c0003222:	50                   	push   %eax
c0003223:	e8 fc 91 00 00       	call   c000c424 <Strlen>
c0003228:	83 c4 10             	add    $0x10,%esp
c000322b:	89 c1                	mov    %eax,%ecx
c000322d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003230:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003237:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000323a:	83 c2 04             	add    $0x4,%edx
c000323d:	83 ec 04             	sub    $0x4,%esp
c0003240:	51                   	push   %ecx
c0003241:	50                   	push   %eax
c0003242:	52                   	push   %edx
c0003243:	e8 91 4a 00 00       	call   c0007cd9 <Memcpy>
c0003248:	83 c4 10             	add    $0x10,%esp
c000324b:	eb 01                	jmp    c000324e <mkfs+0x5b0>
c000324d:	90                   	nop
c000324e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0003252:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003255:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0003258:	7c 92                	jl     c00031ec <mkfs+0x54e>
c000325a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000325f:	89 c2                	mov    %eax,%edx
c0003261:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003264:	83 ec 0c             	sub    $0xc,%esp
c0003267:	6a 0a                	push   $0xa
c0003269:	68 00 02 00 00       	push   $0x200
c000326e:	52                   	push   %edx
c000326f:	6a 20                	push   $0x20
c0003271:	50                   	push   %eax
c0003272:	e8 4d f9 ff ff       	call   c0002bc4 <rd_wt>
c0003277:	83 c4 20             	add    $0x20,%esp
c000327a:	90                   	nop
c000327b:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000327e:	c9                   	leave  
c000327f:	c3                   	ret    

c0003280 <init_fs>:
c0003280:	55                   	push   %ebp
c0003281:	89 e5                	mov    %esp,%ebp
c0003283:	83 ec 18             	sub    $0x18,%esp
c0003286:	83 ec 0c             	sub    $0xc,%esp
c0003289:	6a 6c                	push   $0x6c
c000328b:	e8 14 f7 ff ff       	call   c00029a4 <sys_malloc>
c0003290:	83 c4 10             	add    $0x10,%esp
c0003293:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003296:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003299:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c00032a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032a3:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c00032aa:	83 ec 04             	sub    $0x4,%esp
c00032ad:	6a 03                	push   $0x3
c00032af:	ff 75 f4             	pushl  -0xc(%ebp)
c00032b2:	6a 03                	push   $0x3
c00032b4:	e8 31 73 00 00       	call   c000a5ea <send_rec>
c00032b9:	83 c4 10             	add    $0x10,%esp
c00032bc:	e8 dd f9 ff ff       	call   c0002c9e <mkfs>
c00032c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032c4:	83 ec 08             	sub    $0x8,%esp
c00032c7:	6a 6c                	push   $0x6c
c00032c9:	50                   	push   %eax
c00032ca:	e8 69 43 00 00       	call   c0007638 <sys_free>
c00032cf:	83 c4 10             	add    $0x10,%esp
c00032d2:	90                   	nop
c00032d3:	c9                   	leave  
c00032d4:	c3                   	ret    

c00032d5 <do_open>:
c00032d5:	55                   	push   %ebp
c00032d6:	89 e5                	mov    %esp,%ebp
c00032d8:	83 ec 68             	sub    $0x68,%esp
c00032db:	83 ec 04             	sub    $0x4,%esp
c00032de:	6a 0c                	push   $0xc
c00032e0:	6a 00                	push   $0x0
c00032e2:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00032e5:	50                   	push   %eax
c00032e6:	e8 00 91 00 00       	call   c000c3eb <Memset>
c00032eb:	83 c4 10             	add    $0x10,%esp
c00032ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00032f1:	8b 40 34             	mov    0x34(%eax),%eax
c00032f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00032f7:	83 ec 08             	sub    $0x8,%esp
c00032fa:	6a 0c                	push   $0xc
c00032fc:	ff 75 e4             	pushl  -0x1c(%ebp)
c00032ff:	e8 c5 3c 00 00       	call   c0006fc9 <alloc_virtual_memory>
c0003304:	83 c4 10             	add    $0x10,%esp
c0003307:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000330a:	8b 45 08             	mov    0x8(%ebp),%eax
c000330d:	8b 40 30             	mov    0x30(%eax),%eax
c0003310:	89 c2                	mov    %eax,%edx
c0003312:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003315:	83 ec 04             	sub    $0x4,%esp
c0003318:	52                   	push   %edx
c0003319:	50                   	push   %eax
c000331a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000331d:	50                   	push   %eax
c000331e:	e8 b6 49 00 00       	call   c0007cd9 <Memcpy>
c0003323:	83 c4 10             	add    $0x10,%esp
c0003326:	8b 45 08             	mov    0x8(%ebp),%eax
c0003329:	8b 40 30             	mov    0x30(%eax),%eax
c000332c:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0003331:	8b 45 08             	mov    0x8(%ebp),%eax
c0003334:	8b 40 64             	mov    0x64(%eax),%eax
c0003337:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000333a:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0003341:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003348:	eb 1f                	jmp    c0003369 <do_open+0x94>
c000334a:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000334f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003352:	83 c2 50             	add    $0x50,%edx
c0003355:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0003359:	85 c0                	test   %eax,%eax
c000335b:	75 08                	jne    c0003365 <do_open+0x90>
c000335d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003360:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003363:	eb 0a                	jmp    c000336f <do_open+0x9a>
c0003365:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003369:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c000336d:	7e db                	jle    c000334a <do_open+0x75>
c000336f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0003373:	75 1c                	jne    c0003391 <do_open+0xbc>
c0003375:	68 c6 01 00 00       	push   $0x1c6
c000337a:	68 a4 b7 00 c0       	push   $0xc000b7a4
c000337f:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0003384:	68 97 b8 00 c0       	push   $0xc000b897
c0003389:	e8 30 69 00 00       	call   c0009cbe <assertion_failure>
c000338e:	83 c4 10             	add    $0x10,%esp
c0003391:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0003398:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000339f:	eb 1d                	jmp    c00033be <do_open+0xe9>
c00033a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00033a4:	c1 e0 04             	shl    $0x4,%eax
c00033a7:	05 88 23 01 c0       	add    $0xc0012388,%eax
c00033ac:	8b 00                	mov    (%eax),%eax
c00033ae:	85 c0                	test   %eax,%eax
c00033b0:	75 08                	jne    c00033ba <do_open+0xe5>
c00033b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00033b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00033b8:	eb 0a                	jmp    c00033c4 <do_open+0xef>
c00033ba:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00033be:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c00033c2:	7e dd                	jle    c00033a1 <do_open+0xcc>
c00033c4:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c00033c8:	75 1c                	jne    c00033e6 <do_open+0x111>
c00033ca:	68 d2 01 00 00       	push   $0x1d2
c00033cf:	68 a4 b7 00 c0       	push   $0xc000b7a4
c00033d4:	68 a4 b7 00 c0       	push   $0xc000b7a4
c00033d9:	68 9f b8 00 c0       	push   $0xc000b89f
c00033de:	e8 db 68 00 00       	call   c0009cbe <assertion_failure>
c00033e3:	83 c4 10             	add    $0x10,%esp
c00033e6:	83 ec 0c             	sub    $0xc,%esp
c00033e9:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00033ec:	50                   	push   %eax
c00033ed:	e8 b2 00 00 00       	call   c00034a4 <search_file>
c00033f2:	83 c4 10             	add    $0x10,%esp
c00033f5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00033f8:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00033fc:	75 2b                	jne    c0003429 <do_open+0x154>
c00033fe:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0003402:	7e 10                	jle    c0003414 <do_open+0x13f>
c0003404:	83 ec 0c             	sub    $0xc,%esp
c0003407:	68 a7 b8 00 c0       	push   $0xc000b8a7
c000340c:	e8 8f 68 00 00       	call   c0009ca0 <panic>
c0003411:	83 c4 10             	add    $0x10,%esp
c0003414:	83 ec 08             	sub    $0x8,%esp
c0003417:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000341a:	50                   	push   %eax
c000341b:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000341e:	50                   	push   %eax
c000341f:	e8 40 04 00 00       	call   c0003864 <create_file>
c0003424:	83 c4 10             	add    $0x10,%esp
c0003427:	eb 22                	jmp    c000344b <do_open+0x176>
c0003429:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c000342d:	75 07                	jne    c0003436 <do_open+0x161>
c000342f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003434:	eb 6c                	jmp    c00034a2 <do_open+0x1cd>
c0003436:	83 ec 08             	sub    $0x8,%esp
c0003439:	ff 75 d8             	pushl  -0x28(%ebp)
c000343c:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000343f:	50                   	push   %eax
c0003440:	e8 5d 02 00 00       	call   c00036a2 <get_inode>
c0003445:	83 c4 10             	add    $0x10,%esp
c0003448:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000344b:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0003450:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003453:	c1 e2 04             	shl    $0x4,%edx
c0003456:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c000345c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000345f:	83 c2 50             	add    $0x50,%edx
c0003462:	89 4c 90 08          	mov    %ecx,0x8(%eax,%edx,4)
c0003466:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003469:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000346c:	c1 e2 04             	shl    $0x4,%edx
c000346f:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c0003475:	89 02                	mov    %eax,(%edx)
c0003477:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000347a:	c1 e0 04             	shl    $0x4,%eax
c000347d:	05 84 23 01 c0       	add    $0xc0012384,%eax
c0003482:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003488:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000348b:	c1 e0 04             	shl    $0x4,%eax
c000348e:	05 80 23 01 c0       	add    $0xc0012380,%eax
c0003493:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003499:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000349c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000349f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00034a2:	c9                   	leave  
c00034a3:	c3                   	ret    

c00034a4 <search_file>:
c00034a4:	55                   	push   %ebp
c00034a5:	89 e5                	mov    %esp,%ebp
c00034a7:	83 ec 68             	sub    $0x68,%esp
c00034aa:	83 ec 04             	sub    $0x4,%esp
c00034ad:	6a 0c                	push   $0xc
c00034af:	6a 00                	push   $0x0
c00034b1:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00034b4:	50                   	push   %eax
c00034b5:	e8 31 8f 00 00       	call   c000c3eb <Memset>
c00034ba:	83 c4 10             	add    $0x10,%esp
c00034bd:	83 ec 04             	sub    $0x4,%esp
c00034c0:	6a 28                	push   $0x28
c00034c2:	6a 00                	push   $0x0
c00034c4:	8d 45 98             	lea    -0x68(%ebp),%eax
c00034c7:	50                   	push   %eax
c00034c8:	e8 1e 8f 00 00       	call   c000c3eb <Memset>
c00034cd:	83 c4 10             	add    $0x10,%esp
c00034d0:	83 ec 04             	sub    $0x4,%esp
c00034d3:	8d 45 98             	lea    -0x68(%ebp),%eax
c00034d6:	50                   	push   %eax
c00034d7:	ff 75 08             	pushl  0x8(%ebp)
c00034da:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00034dd:	50                   	push   %eax
c00034de:	e8 f3 00 00 00       	call   c00035d6 <strip_path>
c00034e3:	83 c4 10             	add    $0x10,%esp
c00034e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00034e9:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c00034ed:	75 0a                	jne    c00034f9 <search_file+0x55>
c00034ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00034f4:	e9 db 00 00 00       	jmp    c00035d4 <search_file+0x130>
c00034f9:	8b 45 9c             	mov    -0x64(%ebp),%eax
c00034fc:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00034ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003502:	05 00 02 00 00       	add    $0x200,%eax
c0003507:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000350d:	85 c0                	test   %eax,%eax
c000350f:	0f 48 c2             	cmovs  %edx,%eax
c0003512:	c1 f8 09             	sar    $0x9,%eax
c0003515:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003518:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000351b:	c1 e8 04             	shr    $0x4,%eax
c000351e:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003521:	e8 5c 14 00 00       	call   c0004982 <get_super_block>
c0003526:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003529:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000352c:	8b 00                	mov    (%eax),%eax
c000352e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003531:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0003538:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000353f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003546:	eb 7b                	jmp    c00035c3 <search_file+0x11f>
c0003548:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000354d:	89 c1                	mov    %eax,%ecx
c000354f:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003552:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003555:	01 d0                	add    %edx,%eax
c0003557:	83 ec 0c             	sub    $0xc,%esp
c000355a:	6a 07                	push   $0x7
c000355c:	68 00 02 00 00       	push   $0x200
c0003561:	51                   	push   %ecx
c0003562:	ff 75 cc             	pushl  -0x34(%ebp)
c0003565:	50                   	push   %eax
c0003566:	e8 59 f6 ff ff       	call   c0002bc4 <rd_wt>
c000356b:	83 c4 20             	add    $0x20,%esp
c000356e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003573:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003576:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000357d:	eb 35                	jmp    c00035b4 <search_file+0x110>
c000357f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003583:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003586:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003589:	7f 33                	jg     c00035be <search_file+0x11a>
c000358b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000358e:	83 c0 04             	add    $0x4,%eax
c0003591:	83 ec 08             	sub    $0x8,%esp
c0003594:	50                   	push   %eax
c0003595:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003598:	50                   	push   %eax
c0003599:	e8 a8 73 00 00       	call   c000a946 <strcmp>
c000359e:	83 c4 10             	add    $0x10,%esp
c00035a1:	85 c0                	test   %eax,%eax
c00035a3:	75 07                	jne    c00035ac <search_file+0x108>
c00035a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035a8:	8b 00                	mov    (%eax),%eax
c00035aa:	eb 28                	jmp    c00035d4 <search_file+0x130>
c00035ac:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00035b0:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c00035b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00035b7:	83 f8 1f             	cmp    $0x1f,%eax
c00035ba:	76 c3                	jbe    c000357f <search_file+0xdb>
c00035bc:	eb 01                	jmp    c00035bf <search_file+0x11b>
c00035be:	90                   	nop
c00035bf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00035c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00035c6:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c00035c9:	0f 8c 79 ff ff ff    	jl     c0003548 <search_file+0xa4>
c00035cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00035d4:	c9                   	leave  
c00035d5:	c3                   	ret    

c00035d6 <strip_path>:
c00035d6:	55                   	push   %ebp
c00035d7:	89 e5                	mov    %esp,%ebp
c00035d9:	83 ec 10             	sub    $0x10,%esp
c00035dc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00035e0:	75 0a                	jne    c00035ec <strip_path+0x16>
c00035e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00035e7:	e9 b4 00 00 00       	jmp    c00036a0 <strip_path+0xca>
c00035ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00035ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00035f2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00035f5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00035f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00035fb:	0f b6 00             	movzbl (%eax),%eax
c00035fe:	3c 2f                	cmp    $0x2f,%al
c0003600:	75 2d                	jne    c000362f <strip_path+0x59>
c0003602:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003606:	eb 27                	jmp    c000362f <strip_path+0x59>
c0003608:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000360b:	0f b6 00             	movzbl (%eax),%eax
c000360e:	3c 2f                	cmp    $0x2f,%al
c0003610:	75 0a                	jne    c000361c <strip_path+0x46>
c0003612:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003617:	e9 84 00 00 00       	jmp    c00036a0 <strip_path+0xca>
c000361c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000361f:	0f b6 10             	movzbl (%eax),%edx
c0003622:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003625:	88 10                	mov    %dl,(%eax)
c0003627:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000362b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000362f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003632:	0f b6 00             	movzbl (%eax),%eax
c0003635:	84 c0                	test   %al,%al
c0003637:	75 cf                	jne    c0003608 <strip_path+0x32>
c0003639:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000363c:	c6 00 00             	movb   $0x0,(%eax)
c000363f:	8b 45 10             	mov    0x10(%ebp),%eax
c0003642:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c0003648:	89 10                	mov    %edx,(%eax)
c000364a:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c0003650:	89 50 04             	mov    %edx,0x4(%eax)
c0003653:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c0003659:	89 50 08             	mov    %edx,0x8(%eax)
c000365c:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c0003662:	89 50 0c             	mov    %edx,0xc(%eax)
c0003665:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c000366b:	89 50 10             	mov    %edx,0x10(%eax)
c000366e:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c0003674:	89 50 14             	mov    %edx,0x14(%eax)
c0003677:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c000367d:	89 50 18             	mov    %edx,0x18(%eax)
c0003680:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c0003686:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003689:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c000368f:	89 50 20             	mov    %edx,0x20(%eax)
c0003692:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003698:	89 50 24             	mov    %edx,0x24(%eax)
c000369b:	b8 00 00 00 00       	mov    $0x0,%eax
c00036a0:	c9                   	leave  
c00036a1:	c3                   	ret    

c00036a2 <get_inode>:
c00036a2:	55                   	push   %ebp
c00036a3:	89 e5                	mov    %esp,%ebp
c00036a5:	56                   	push   %esi
c00036a6:	53                   	push   %ebx
c00036a7:	83 ec 20             	sub    $0x20,%esp
c00036aa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00036ae:	75 0a                	jne    c00036ba <get_inode+0x18>
c00036b0:	b8 00 00 00 00       	mov    $0x0,%eax
c00036b5:	e9 a3 01 00 00       	jmp    c000385d <get_inode+0x1bb>
c00036ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00036c1:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c00036c8:	eb 69                	jmp    c0003733 <get_inode+0x91>
c00036ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036cd:	8b 40 24             	mov    0x24(%eax),%eax
c00036d0:	85 c0                	test   %eax,%eax
c00036d2:	7e 53                	jle    c0003727 <get_inode+0x85>
c00036d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036d7:	8b 40 10             	mov    0x10(%eax),%eax
c00036da:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00036dd:	75 50                	jne    c000372f <get_inode+0x8d>
c00036df:	8b 45 08             	mov    0x8(%ebp),%eax
c00036e2:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00036e5:	8b 0a                	mov    (%edx),%ecx
c00036e7:	89 08                	mov    %ecx,(%eax)
c00036e9:	8b 4a 04             	mov    0x4(%edx),%ecx
c00036ec:	89 48 04             	mov    %ecx,0x4(%eax)
c00036ef:	8b 4a 08             	mov    0x8(%edx),%ecx
c00036f2:	89 48 08             	mov    %ecx,0x8(%eax)
c00036f5:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00036f8:	89 48 0c             	mov    %ecx,0xc(%eax)
c00036fb:	8b 4a 10             	mov    0x10(%edx),%ecx
c00036fe:	89 48 10             	mov    %ecx,0x10(%eax)
c0003701:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003704:	89 48 14             	mov    %ecx,0x14(%eax)
c0003707:	8b 4a 18             	mov    0x18(%edx),%ecx
c000370a:	89 48 18             	mov    %ecx,0x18(%eax)
c000370d:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003710:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003713:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003716:	89 48 20             	mov    %ecx,0x20(%eax)
c0003719:	8b 52 24             	mov    0x24(%edx),%edx
c000371c:	89 50 24             	mov    %edx,0x24(%eax)
c000371f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003722:	e9 36 01 00 00       	jmp    c000385d <get_inode+0x1bb>
c0003727:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000372a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000372d:	eb 0d                	jmp    c000373c <get_inode+0x9a>
c000372f:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003733:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c000373a:	76 8e                	jbe    c00036ca <get_inode+0x28>
c000373c:	e8 41 12 00 00       	call   c0004982 <get_super_block>
c0003741:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003744:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c000374b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000374e:	8b 40 04             	mov    0x4(%eax),%eax
c0003751:	8d 50 02             	lea    0x2(%eax),%edx
c0003754:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003757:	8b 40 08             	mov    0x8(%eax),%eax
c000375a:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c000375d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003760:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003763:	b8 00 02 00 00       	mov    $0x200,%eax
c0003768:	99                   	cltd   
c0003769:	f7 7d e8             	idivl  -0x18(%ebp)
c000376c:	89 c6                	mov    %eax,%esi
c000376e:	89 c8                	mov    %ecx,%eax
c0003770:	99                   	cltd   
c0003771:	f7 fe                	idiv   %esi
c0003773:	01 d8                	add    %ebx,%eax
c0003775:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003778:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c000377f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003784:	83 ec 0c             	sub    $0xc,%esp
c0003787:	6a 07                	push   $0x7
c0003789:	68 00 02 00 00       	push   $0x200
c000378e:	50                   	push   %eax
c000378f:	ff 75 e0             	pushl  -0x20(%ebp)
c0003792:	ff 75 e4             	pushl  -0x1c(%ebp)
c0003795:	e8 2a f4 ff ff       	call   c0002bc4 <rd_wt>
c000379a:	83 c4 20             	add    $0x20,%esp
c000379d:	8b 45 0c             	mov    0xc(%ebp),%eax
c00037a0:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00037a3:	b8 00 02 00 00       	mov    $0x200,%eax
c00037a8:	99                   	cltd   
c00037a9:	f7 7d e8             	idivl  -0x18(%ebp)
c00037ac:	89 c3                	mov    %eax,%ebx
c00037ae:	89 c8                	mov    %ecx,%eax
c00037b0:	99                   	cltd   
c00037b1:	f7 fb                	idiv   %ebx
c00037b3:	89 55 dc             	mov    %edx,-0x24(%ebp)
c00037b6:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00037bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00037bf:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c00037c3:	01 d0                	add    %edx,%eax
c00037c5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00037c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037cb:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00037ce:	8b 0a                	mov    (%edx),%ecx
c00037d0:	89 08                	mov    %ecx,(%eax)
c00037d2:	8b 4a 04             	mov    0x4(%edx),%ecx
c00037d5:	89 48 04             	mov    %ecx,0x4(%eax)
c00037d8:	8b 4a 08             	mov    0x8(%edx),%ecx
c00037db:	89 48 08             	mov    %ecx,0x8(%eax)
c00037de:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00037e1:	89 48 0c             	mov    %ecx,0xc(%eax)
c00037e4:	8b 4a 10             	mov    0x10(%edx),%ecx
c00037e7:	89 48 10             	mov    %ecx,0x10(%eax)
c00037ea:	8b 4a 14             	mov    0x14(%edx),%ecx
c00037ed:	89 48 14             	mov    %ecx,0x14(%eax)
c00037f0:	8b 4a 18             	mov    0x18(%edx),%ecx
c00037f3:	89 48 18             	mov    %ecx,0x18(%eax)
c00037f6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00037f9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00037fc:	8b 4a 20             	mov    0x20(%edx),%ecx
c00037ff:	89 48 20             	mov    %ecx,0x20(%eax)
c0003802:	8b 52 24             	mov    0x24(%edx),%edx
c0003805:	89 50 24             	mov    %edx,0x24(%eax)
c0003808:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000380b:	8b 55 0c             	mov    0xc(%ebp),%edx
c000380e:	89 50 10             	mov    %edx,0x10(%eax)
c0003811:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003814:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003817:	89 50 20             	mov    %edx,0x20(%eax)
c000381a:	8b 45 08             	mov    0x8(%ebp),%eax
c000381d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003820:	8b 0a                	mov    (%edx),%ecx
c0003822:	89 08                	mov    %ecx,(%eax)
c0003824:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003827:	89 48 04             	mov    %ecx,0x4(%eax)
c000382a:	8b 4a 08             	mov    0x8(%edx),%ecx
c000382d:	89 48 08             	mov    %ecx,0x8(%eax)
c0003830:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003833:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003836:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003839:	89 48 10             	mov    %ecx,0x10(%eax)
c000383c:	8b 4a 14             	mov    0x14(%edx),%ecx
c000383f:	89 48 14             	mov    %ecx,0x14(%eax)
c0003842:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003845:	89 48 18             	mov    %ecx,0x18(%eax)
c0003848:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000384b:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000384e:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003851:	89 48 20             	mov    %ecx,0x20(%eax)
c0003854:	8b 52 24             	mov    0x24(%edx),%edx
c0003857:	89 50 24             	mov    %edx,0x24(%eax)
c000385a:	8b 45 08             	mov    0x8(%ebp),%eax
c000385d:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0003860:	5b                   	pop    %ebx
c0003861:	5e                   	pop    %esi
c0003862:	5d                   	pop    %ebp
c0003863:	c3                   	ret    

c0003864 <create_file>:
c0003864:	55                   	push   %ebp
c0003865:	89 e5                	mov    %esp,%ebp
c0003867:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000386d:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003870:	50                   	push   %eax
c0003871:	ff 75 0c             	pushl  0xc(%ebp)
c0003874:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003877:	50                   	push   %eax
c0003878:	e8 59 fd ff ff       	call   c00035d6 <strip_path>
c000387d:	83 c4 0c             	add    $0xc,%esp
c0003880:	83 f8 ff             	cmp    $0xffffffff,%eax
c0003883:	75 0a                	jne    c000388f <create_file+0x2b>
c0003885:	b8 00 00 00 00       	mov    $0x0,%eax
c000388a:	e9 de 00 00 00       	jmp    c000396d <create_file+0x109>
c000388f:	e8 db 00 00 00       	call   c000396f <alloc_imap_bit>
c0003894:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003897:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000389b:	75 0a                	jne    c00038a7 <create_file+0x43>
c000389d:	b8 00 00 00 00       	mov    $0x0,%eax
c00038a2:	e9 c6 00 00 00       	jmp    c000396d <create_file+0x109>
c00038a7:	e8 d6 10 00 00       	call   c0004982 <get_super_block>
c00038ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00038af:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00038b2:	8b 40 10             	mov    0x10(%eax),%eax
c00038b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00038b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00038bb:	83 ec 08             	sub    $0x8,%esp
c00038be:	50                   	push   %eax
c00038bf:	ff 75 f4             	pushl  -0xc(%ebp)
c00038c2:	e8 a5 01 00 00       	call   c0003a6c <alloc_smap_bit>
c00038c7:	83 c4 10             	add    $0x10,%esp
c00038ca:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00038cd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00038d1:	75 0a                	jne    c00038dd <create_file+0x79>
c00038d3:	b8 00 00 00 00       	mov    $0x0,%eax
c00038d8:	e9 90 00 00 00       	jmp    c000396d <create_file+0x109>
c00038dd:	83 ec 04             	sub    $0x4,%esp
c00038e0:	ff 75 e8             	pushl  -0x18(%ebp)
c00038e3:	ff 75 f4             	pushl  -0xc(%ebp)
c00038e6:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00038e9:	50                   	push   %eax
c00038ea:	e8 1e 03 00 00       	call   c0003c0d <new_inode>
c00038ef:	83 c4 10             	add    $0x10,%esp
c00038f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00038f5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00038f9:	75 07                	jne    c0003902 <create_file+0x9e>
c00038fb:	b8 00 00 00 00       	mov    $0x0,%eax
c0003900:	eb 6b                	jmp    c000396d <create_file+0x109>
c0003902:	ff 75 f4             	pushl  -0xc(%ebp)
c0003905:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003908:	50                   	push   %eax
c0003909:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000390c:	50                   	push   %eax
c000390d:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003913:	50                   	push   %eax
c0003914:	e8 12 04 00 00       	call   c0003d2b <new_dir_entry>
c0003919:	83 c4 10             	add    $0x10,%esp
c000391c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000391f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003923:	75 07                	jne    c000392c <create_file+0xc8>
c0003925:	b8 00 00 00 00       	mov    $0x0,%eax
c000392a:	eb 41                	jmp    c000396d <create_file+0x109>
c000392c:	8b 45 08             	mov    0x8(%ebp),%eax
c000392f:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0003932:	89 10                	mov    %edx,(%eax)
c0003934:	8b 55 88             	mov    -0x78(%ebp),%edx
c0003937:	89 50 04             	mov    %edx,0x4(%eax)
c000393a:	8b 55 8c             	mov    -0x74(%ebp),%edx
c000393d:	89 50 08             	mov    %edx,0x8(%eax)
c0003940:	8b 55 90             	mov    -0x70(%ebp),%edx
c0003943:	89 50 0c             	mov    %edx,0xc(%eax)
c0003946:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0003949:	89 50 10             	mov    %edx,0x10(%eax)
c000394c:	8b 55 98             	mov    -0x68(%ebp),%edx
c000394f:	89 50 14             	mov    %edx,0x14(%eax)
c0003952:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003955:	89 50 18             	mov    %edx,0x18(%eax)
c0003958:	8b 55 a0             	mov    -0x60(%ebp),%edx
c000395b:	89 50 1c             	mov    %edx,0x1c(%eax)
c000395e:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c0003961:	89 50 20             	mov    %edx,0x20(%eax)
c0003964:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003967:	89 50 24             	mov    %edx,0x24(%eax)
c000396a:	8b 45 08             	mov    0x8(%ebp),%eax
c000396d:	c9                   	leave  
c000396e:	c3                   	ret    

c000396f <alloc_imap_bit>:
c000396f:	55                   	push   %ebp
c0003970:	89 e5                	mov    %esp,%ebp
c0003972:	53                   	push   %ebx
c0003973:	83 ec 24             	sub    $0x24,%esp
c0003976:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c000397d:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003984:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003989:	83 ec 0c             	sub    $0xc,%esp
c000398c:	6a 07                	push   $0x7
c000398e:	68 00 02 00 00       	push   $0x200
c0003993:	50                   	push   %eax
c0003994:	ff 75 e8             	pushl  -0x18(%ebp)
c0003997:	ff 75 ec             	pushl  -0x14(%ebp)
c000399a:	e8 25 f2 ff ff       	call   c0002bc4 <rd_wt>
c000399f:	83 c4 20             	add    $0x20,%esp
c00039a2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00039a9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00039b0:	e9 a5 00 00 00       	jmp    c0003a5a <alloc_imap_bit+0xeb>
c00039b5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00039bc:	e9 8b 00 00 00       	jmp    c0003a4c <alloc_imap_bit+0xdd>
c00039c1:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039ca:	01 d0                	add    %edx,%eax
c00039cc:	0f b6 00             	movzbl (%eax),%eax
c00039cf:	0f be d0             	movsbl %al,%edx
c00039d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039d5:	89 c1                	mov    %eax,%ecx
c00039d7:	d3 fa                	sar    %cl,%edx
c00039d9:	89 d0                	mov    %edx,%eax
c00039db:	83 e0 01             	and    $0x1,%eax
c00039de:	85 c0                	test   %eax,%eax
c00039e0:	74 06                	je     c00039e8 <alloc_imap_bit+0x79>
c00039e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00039e6:	eb 64                	jmp    c0003a4c <alloc_imap_bit+0xdd>
c00039e8:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00039f1:	01 d0                	add    %edx,%eax
c00039f3:	0f b6 18             	movzbl (%eax),%ebx
c00039f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039f9:	ba 01 00 00 00       	mov    $0x1,%edx
c00039fe:	89 c1                	mov    %eax,%ecx
c0003a00:	d3 e2                	shl    %cl,%edx
c0003a02:	89 d0                	mov    %edx,%eax
c0003a04:	89 c1                	mov    %eax,%ecx
c0003a06:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a0f:	01 d0                	add    %edx,%eax
c0003a11:	09 cb                	or     %ecx,%ebx
c0003a13:	89 da                	mov    %ebx,%edx
c0003a15:	88 10                	mov    %dl,(%eax)
c0003a17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a1a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003a21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a24:	01 d0                	add    %edx,%eax
c0003a26:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003a29:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003a2e:	83 ec 0c             	sub    $0xc,%esp
c0003a31:	6a 0a                	push   $0xa
c0003a33:	68 00 02 00 00       	push   $0x200
c0003a38:	50                   	push   %eax
c0003a39:	ff 75 e8             	pushl  -0x18(%ebp)
c0003a3c:	ff 75 ec             	pushl  -0x14(%ebp)
c0003a3f:	e8 80 f1 ff ff       	call   c0002bc4 <rd_wt>
c0003a44:	83 c4 20             	add    $0x20,%esp
c0003a47:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a4a:	eb 1b                	jmp    c0003a67 <alloc_imap_bit+0xf8>
c0003a4c:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c0003a50:	0f 8e 6b ff ff ff    	jle    c00039c1 <alloc_imap_bit+0x52>
c0003a56:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003a5a:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c0003a61:	0f 8e 4e ff ff ff    	jle    c00039b5 <alloc_imap_bit+0x46>
c0003a67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003a6a:	c9                   	leave  
c0003a6b:	c3                   	ret    

c0003a6c <alloc_smap_bit>:
c0003a6c:	55                   	push   %ebp
c0003a6d:	89 e5                	mov    %esp,%ebp
c0003a6f:	53                   	push   %ebx
c0003a70:	83 ec 34             	sub    $0x34,%esp
c0003a73:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a77:	75 1c                	jne    c0003a95 <alloc_smap_bit+0x29>
c0003a79:	68 fc 02 00 00       	push   $0x2fc
c0003a7e:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0003a83:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0003a88:	68 b4 b8 00 c0       	push   $0xc000b8b4
c0003a8d:	e8 2c 62 00 00       	call   c0009cbe <assertion_failure>
c0003a92:	83 c4 10             	add    $0x10,%esp
c0003a95:	e8 e8 0e 00 00       	call   c0004982 <get_super_block>
c0003a9a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003a9d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003aa0:	8b 40 08             	mov    0x8(%eax),%eax
c0003aa3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003aa6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003aa9:	8b 40 04             	mov    0x4(%eax),%eax
c0003aac:	83 c0 02             	add    $0x2,%eax
c0003aaf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003ab2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003ab9:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0003ac0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003ac7:	e9 20 01 00 00       	jmp    c0003bec <alloc_smap_bit+0x180>
c0003acc:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003acf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003ad2:	01 d0                	add    %edx,%eax
c0003ad4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003ad7:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003adc:	83 ec 0c             	sub    $0xc,%esp
c0003adf:	6a 07                	push   $0x7
c0003ae1:	68 00 02 00 00       	push   $0x200
c0003ae6:	50                   	push   %eax
c0003ae7:	ff 75 d8             	pushl  -0x28(%ebp)
c0003aea:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003aed:	e8 d2 f0 ff ff       	call   c0002bc4 <rd_wt>
c0003af2:	83 c4 20             	add    $0x20,%esp
c0003af5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003afc:	e9 b0 00 00 00       	jmp    c0003bb1 <alloc_smap_bit+0x145>
c0003b01:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003b08:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003b0c:	0f 85 8c 00 00 00    	jne    c0003b9e <alloc_smap_bit+0x132>
c0003b12:	eb 45                	jmp    c0003b59 <alloc_smap_bit+0xed>
c0003b14:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b1a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b1d:	01 d0                	add    %edx,%eax
c0003b1f:	0f b6 00             	movzbl (%eax),%eax
c0003b22:	0f be d0             	movsbl %al,%edx
c0003b25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b28:	89 c1                	mov    %eax,%ecx
c0003b2a:	d3 fa                	sar    %cl,%edx
c0003b2c:	89 d0                	mov    %edx,%eax
c0003b2e:	83 e0 01             	and    $0x1,%eax
c0003b31:	85 c0                	test   %eax,%eax
c0003b33:	74 06                	je     c0003b3b <alloc_smap_bit+0xcf>
c0003b35:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003b39:	eb 1e                	jmp    c0003b59 <alloc_smap_bit+0xed>
c0003b3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003b3e:	c1 e0 09             	shl    $0x9,%eax
c0003b41:	89 c2                	mov    %eax,%edx
c0003b43:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b46:	01 d0                	add    %edx,%eax
c0003b48:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0003b4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b52:	01 d0                	add    %edx,%eax
c0003b54:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003b57:	eb 06                	jmp    c0003b5f <alloc_smap_bit+0xf3>
c0003b59:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003b5d:	7e b5                	jle    c0003b14 <alloc_smap_bit+0xa8>
c0003b5f:	eb 3d                	jmp    c0003b9e <alloc_smap_bit+0x132>
c0003b61:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003b65:	74 45                	je     c0003bac <alloc_smap_bit+0x140>
c0003b67:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b6d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b70:	01 d0                	add    %edx,%eax
c0003b72:	0f b6 18             	movzbl (%eax),%ebx
c0003b75:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003b78:	ba 01 00 00 00       	mov    $0x1,%edx
c0003b7d:	89 c1                	mov    %eax,%ecx
c0003b7f:	d3 e2                	shl    %cl,%edx
c0003b81:	89 d0                	mov    %edx,%eax
c0003b83:	89 c1                	mov    %eax,%ecx
c0003b85:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003b8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003b8e:	01 d0                	add    %edx,%eax
c0003b90:	09 cb                	or     %ecx,%ebx
c0003b92:	89 da                	mov    %ebx,%edx
c0003b94:	88 10                	mov    %dl,(%eax)
c0003b96:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003b9a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003b9e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003ba2:	74 09                	je     c0003bad <alloc_smap_bit+0x141>
c0003ba4:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003ba8:	7e b7                	jle    c0003b61 <alloc_smap_bit+0xf5>
c0003baa:	eb 01                	jmp    c0003bad <alloc_smap_bit+0x141>
c0003bac:	90                   	nop
c0003bad:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003bb1:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003bb8:	0f 8e 43 ff ff ff    	jle    c0003b01 <alloc_smap_bit+0x95>
c0003bbe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003bc2:	74 1e                	je     c0003be2 <alloc_smap_bit+0x176>
c0003bc4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003bc9:	83 ec 0c             	sub    $0xc,%esp
c0003bcc:	6a 0a                	push   $0xa
c0003bce:	68 00 02 00 00       	push   $0x200
c0003bd3:	50                   	push   %eax
c0003bd4:	ff 75 d8             	pushl  -0x28(%ebp)
c0003bd7:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003bda:	e8 e5 ef ff ff       	call   c0002bc4 <rd_wt>
c0003bdf:	83 c4 20             	add    $0x20,%esp
c0003be2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003be6:	74 12                	je     c0003bfa <alloc_smap_bit+0x18e>
c0003be8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003bec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003bef:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003bf2:	0f 8c d4 fe ff ff    	jl     c0003acc <alloc_smap_bit+0x60>
c0003bf8:	eb 01                	jmp    c0003bfb <alloc_smap_bit+0x18f>
c0003bfa:	90                   	nop
c0003bfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003bfe:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003c01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003c04:	8b 00                	mov    (%eax),%eax
c0003c06:	01 d0                	add    %edx,%eax
c0003c08:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003c0b:	c9                   	leave  
c0003c0c:	c3                   	ret    

c0003c0d <new_inode>:
c0003c0d:	55                   	push   %ebp
c0003c0e:	89 e5                	mov    %esp,%ebp
c0003c10:	83 ec 38             	sub    $0x38,%esp
c0003c13:	83 ec 08             	sub    $0x8,%esp
c0003c16:	ff 75 0c             	pushl  0xc(%ebp)
c0003c19:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003c1c:	50                   	push   %eax
c0003c1d:	e8 80 fa ff ff       	call   c00036a2 <get_inode>
c0003c22:	83 c4 10             	add    $0x10,%esp
c0003c25:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003c28:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003c2c:	75 0a                	jne    c0003c38 <new_inode+0x2b>
c0003c2e:	b8 00 00 00 00       	mov    $0x0,%eax
c0003c33:	e9 f1 00 00 00       	jmp    c0003d29 <new_inode+0x11c>
c0003c38:	8b 45 10             	mov    0x10(%ebp),%eax
c0003c3b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003c3e:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003c45:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003c4c:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003c53:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c56:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003c59:	83 ec 0c             	sub    $0xc,%esp
c0003c5c:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003c5f:	50                   	push   %eax
c0003c60:	e8 39 0b 00 00       	call   c000479e <sync_inode>
c0003c65:	83 c4 10             	add    $0x10,%esp
c0003c68:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003c6f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003c76:	eb 1d                	jmp    c0003c95 <new_inode+0x88>
c0003c78:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003c7b:	89 d0                	mov    %edx,%eax
c0003c7d:	c1 e0 02             	shl    $0x2,%eax
c0003c80:	01 d0                	add    %edx,%eax
c0003c82:	c1 e0 03             	shl    $0x3,%eax
c0003c85:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003c8a:	8b 00                	mov    (%eax),%eax
c0003c8c:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003c8f:	74 0c                	je     c0003c9d <new_inode+0x90>
c0003c91:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003c95:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003c99:	7e dd                	jle    c0003c78 <new_inode+0x6b>
c0003c9b:	eb 01                	jmp    c0003c9e <new_inode+0x91>
c0003c9d:	90                   	nop
c0003c9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003ca1:	89 d0                	mov    %edx,%eax
c0003ca3:	c1 e0 02             	shl    $0x2,%eax
c0003ca6:	01 d0                	add    %edx,%eax
c0003ca8:	c1 e0 03             	shl    $0x3,%eax
c0003cab:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003cb0:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003cb3:	89 10                	mov    %edx,(%eax)
c0003cb5:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003cb8:	89 50 04             	mov    %edx,0x4(%eax)
c0003cbb:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003cbe:	89 50 08             	mov    %edx,0x8(%eax)
c0003cc1:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003cc4:	89 50 0c             	mov    %edx,0xc(%eax)
c0003cc7:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003cca:	89 50 10             	mov    %edx,0x10(%eax)
c0003ccd:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003cd0:	89 50 14             	mov    %edx,0x14(%eax)
c0003cd3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003cd6:	89 50 18             	mov    %edx,0x18(%eax)
c0003cd9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003cdc:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003cdf:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003ce2:	89 50 20             	mov    %edx,0x20(%eax)
c0003ce5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003ce8:	89 50 24             	mov    %edx,0x24(%eax)
c0003ceb:	8b 45 08             	mov    0x8(%ebp),%eax
c0003cee:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003cf1:	89 10                	mov    %edx,(%eax)
c0003cf3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003cf6:	89 50 04             	mov    %edx,0x4(%eax)
c0003cf9:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003cfc:	89 50 08             	mov    %edx,0x8(%eax)
c0003cff:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003d02:	89 50 0c             	mov    %edx,0xc(%eax)
c0003d05:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003d08:	89 50 10             	mov    %edx,0x10(%eax)
c0003d0b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003d0e:	89 50 14             	mov    %edx,0x14(%eax)
c0003d11:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003d14:	89 50 18             	mov    %edx,0x18(%eax)
c0003d17:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003d1a:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003d1d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003d20:	89 50 20             	mov    %edx,0x20(%eax)
c0003d23:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003d26:	89 50 24             	mov    %edx,0x24(%eax)
c0003d29:	c9                   	leave  
c0003d2a:	c3                   	ret    

c0003d2b <new_dir_entry>:
c0003d2b:	55                   	push   %ebp
c0003d2c:	89 e5                	mov    %esp,%ebp
c0003d2e:	83 ec 48             	sub    $0x48,%esp
c0003d31:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003d38:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d3b:	8b 40 04             	mov    0x4(%eax),%eax
c0003d3e:	99                   	cltd   
c0003d3f:	f7 7d dc             	idivl  -0x24(%ebp)
c0003d42:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003d45:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d48:	8b 40 0c             	mov    0xc(%eax),%eax
c0003d4b:	99                   	cltd   
c0003d4c:	f7 7d dc             	idivl  -0x24(%ebp)
c0003d4f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003d52:	e8 2b 0c 00 00       	call   c0004982 <get_super_block>
c0003d57:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003d5a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003d5d:	8b 00                	mov    (%eax),%eax
c0003d5f:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003d62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d65:	8b 40 0c             	mov    0xc(%eax),%eax
c0003d68:	05 00 02 00 00       	add    $0x200,%eax
c0003d6d:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003d73:	85 c0                	test   %eax,%eax
c0003d75:	0f 48 c2             	cmovs  %edx,%eax
c0003d78:	c1 f8 09             	sar    $0x9,%eax
c0003d7b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003d7e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003d85:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003d8c:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003d93:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003d9a:	eb 7f                	jmp    c0003e1b <new_dir_entry+0xf0>
c0003d9c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003da1:	89 c1                	mov    %eax,%ecx
c0003da3:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003da6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003da9:	01 d0                	add    %edx,%eax
c0003dab:	83 ec 0c             	sub    $0xc,%esp
c0003dae:	6a 07                	push   $0x7
c0003db0:	68 00 02 00 00       	push   $0x200
c0003db5:	51                   	push   %ecx
c0003db6:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003db9:	50                   	push   %eax
c0003dba:	e8 05 ee ff ff       	call   c0002bc4 <rd_wt>
c0003dbf:	83 c4 20             	add    $0x20,%esp
c0003dc2:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003dc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003dca:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003dd1:	eb 25                	jmp    c0003df8 <new_dir_entry+0xcd>
c0003dd3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003dd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003dda:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003ddd:	7f 29                	jg     c0003e08 <new_dir_entry+0xdd>
c0003ddf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003de2:	8b 00                	mov    (%eax),%eax
c0003de4:	85 c0                	test   %eax,%eax
c0003de6:	75 08                	jne    c0003df0 <new_dir_entry+0xc5>
c0003de8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003deb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003dee:	eb 19                	jmp    c0003e09 <new_dir_entry+0xde>
c0003df0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003df4:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003df8:	b8 00 02 00 00       	mov    $0x200,%eax
c0003dfd:	99                   	cltd   
c0003dfe:	f7 7d dc             	idivl  -0x24(%ebp)
c0003e01:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003e04:	7c cd                	jl     c0003dd3 <new_dir_entry+0xa8>
c0003e06:	eb 01                	jmp    c0003e09 <new_dir_entry+0xde>
c0003e08:	90                   	nop
c0003e09:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003e0c:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003e0f:	7f 16                	jg     c0003e27 <new_dir_entry+0xfc>
c0003e11:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003e15:	75 10                	jne    c0003e27 <new_dir_entry+0xfc>
c0003e17:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003e1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003e1e:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003e21:	0f 8c 75 ff ff ff    	jl     c0003d9c <new_dir_entry+0x71>
c0003e27:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003e2a:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003e2d:	75 0a                	jne    c0003e39 <new_dir_entry+0x10e>
c0003e2f:	b8 00 00 00 00       	mov    $0x0,%eax
c0003e34:	e9 fc 00 00 00       	jmp    c0003f35 <new_dir_entry+0x20a>
c0003e39:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003e40:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003e44:	75 1e                	jne    c0003e64 <new_dir_entry+0x139>
c0003e46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003e49:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003e4c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003e4f:	8b 50 04             	mov    0x4(%eax),%edx
c0003e52:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003e55:	01 c2                	add    %eax,%edx
c0003e57:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003e5a:	89 50 04             	mov    %edx,0x4(%eax)
c0003e5d:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003e64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e67:	8b 55 14             	mov    0x14(%ebp),%edx
c0003e6a:	89 10                	mov    %edx,(%eax)
c0003e6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003e6f:	83 c0 04             	add    $0x4,%eax
c0003e72:	83 ec 08             	sub    $0x8,%esp
c0003e75:	ff 75 10             	pushl  0x10(%ebp)
c0003e78:	50                   	push   %eax
c0003e79:	e8 8c 85 00 00       	call   c000c40a <Strcpy>
c0003e7e:	83 c4 10             	add    $0x10,%esp
c0003e81:	8b 45 08             	mov    0x8(%ebp),%eax
c0003e84:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003e87:	8b 0a                	mov    (%edx),%ecx
c0003e89:	89 08                	mov    %ecx,(%eax)
c0003e8b:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003e8e:	89 48 04             	mov    %ecx,0x4(%eax)
c0003e91:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003e94:	89 48 08             	mov    %ecx,0x8(%eax)
c0003e97:	8b 52 0c             	mov    0xc(%edx),%edx
c0003e9a:	89 50 0c             	mov    %edx,0xc(%eax)
c0003e9d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003ea2:	89 c1                	mov    %eax,%ecx
c0003ea4:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003ea7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003eaa:	01 d0                	add    %edx,%eax
c0003eac:	83 ec 0c             	sub    $0xc,%esp
c0003eaf:	6a 0a                	push   $0xa
c0003eb1:	68 00 02 00 00       	push   $0x200
c0003eb6:	51                   	push   %ecx
c0003eb7:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003eba:	50                   	push   %eax
c0003ebb:	e8 04 ed ff ff       	call   c0002bc4 <rd_wt>
c0003ec0:	83 c4 20             	add    $0x20,%esp
c0003ec3:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003ec7:	74 69                	je     c0003f32 <new_dir_entry+0x207>
c0003ec9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ecc:	8b 10                	mov    (%eax),%edx
c0003ece:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003ed4:	8b 50 04             	mov    0x4(%eax),%edx
c0003ed7:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003edd:	8b 50 08             	mov    0x8(%eax),%edx
c0003ee0:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003ee6:	8b 50 0c             	mov    0xc(%eax),%edx
c0003ee9:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003eef:	8b 50 10             	mov    0x10(%eax),%edx
c0003ef2:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003ef8:	8b 50 14             	mov    0x14(%eax),%edx
c0003efb:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003f01:	8b 50 18             	mov    0x18(%eax),%edx
c0003f04:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003f0a:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003f0d:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003f13:	8b 50 20             	mov    0x20(%eax),%edx
c0003f16:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003f1c:	8b 40 24             	mov    0x24(%eax),%eax
c0003f1f:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003f24:	83 ec 0c             	sub    $0xc,%esp
c0003f27:	ff 75 0c             	pushl  0xc(%ebp)
c0003f2a:	e8 6f 08 00 00       	call   c000479e <sync_inode>
c0003f2f:	83 c4 10             	add    $0x10,%esp
c0003f32:	8b 45 08             	mov    0x8(%ebp),%eax
c0003f35:	c9                   	leave  
c0003f36:	c3                   	ret    

c0003f37 <do_unlink>:
c0003f37:	55                   	push   %ebp
c0003f38:	89 e5                	mov    %esp,%ebp
c0003f3a:	53                   	push   %ebx
c0003f3b:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003f41:	83 ec 08             	sub    $0x8,%esp
c0003f44:	ff 75 08             	pushl  0x8(%ebp)
c0003f47:	68 c9 b8 00 c0       	push   $0xc000b8c9
c0003f4c:	e8 f5 69 00 00       	call   c000a946 <strcmp>
c0003f51:	83 c4 10             	add    $0x10,%esp
c0003f54:	85 c0                	test   %eax,%eax
c0003f56:	75 10                	jne    c0003f68 <do_unlink+0x31>
c0003f58:	83 ec 0c             	sub    $0xc,%esp
c0003f5b:	68 cb b8 00 c0       	push   $0xc000b8cb
c0003f60:	e8 3b 5d 00 00       	call   c0009ca0 <panic>
c0003f65:	83 c4 10             	add    $0x10,%esp
c0003f68:	83 ec 0c             	sub    $0xc,%esp
c0003f6b:	ff 75 08             	pushl  0x8(%ebp)
c0003f6e:	e8 31 f5 ff ff       	call   c00034a4 <search_file>
c0003f73:	83 c4 10             	add    $0x10,%esp
c0003f76:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003f79:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003f7d:	75 10                	jne    c0003f8f <do_unlink+0x58>
c0003f7f:	83 ec 0c             	sub    $0xc,%esp
c0003f82:	68 e7 b8 00 c0       	push   $0xc000b8e7
c0003f87:	e8 14 5d 00 00       	call   c0009ca0 <panic>
c0003f8c:	83 c4 10             	add    $0x10,%esp
c0003f8f:	83 ec 08             	sub    $0x8,%esp
c0003f92:	ff 75 d0             	pushl  -0x30(%ebp)
c0003f95:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003f9b:	50                   	push   %eax
c0003f9c:	e8 01 f7 ff ff       	call   c00036a2 <get_inode>
c0003fa1:	83 c4 10             	add    $0x10,%esp
c0003fa4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003fa7:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003fab:	75 10                	jne    c0003fbd <do_unlink+0x86>
c0003fad:	83 ec 0c             	sub    $0xc,%esp
c0003fb0:	68 e7 b8 00 c0       	push   $0xc000b8e7
c0003fb5:	e8 e6 5c 00 00       	call   c0009ca0 <panic>
c0003fba:	83 c4 10             	add    $0x10,%esp
c0003fbd:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003fc0:	85 c0                	test   %eax,%eax
c0003fc2:	7e 10                	jle    c0003fd4 <do_unlink+0x9d>
c0003fc4:	83 ec 0c             	sub    $0xc,%esp
c0003fc7:	68 00 b9 00 c0       	push   $0xc000b900
c0003fcc:	e8 cf 5c 00 00       	call   c0009ca0 <panic>
c0003fd1:	83 c4 10             	add    $0x10,%esp
c0003fd4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003fda:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003fdd:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003fe0:	8d 50 07             	lea    0x7(%eax),%edx
c0003fe3:	85 c0                	test   %eax,%eax
c0003fe5:	0f 48 c2             	cmovs  %edx,%eax
c0003fe8:	c1 f8 03             	sar    $0x3,%eax
c0003feb:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003fee:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003ff1:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003ff7:	85 c0                	test   %eax,%eax
c0003ff9:	0f 48 c2             	cmovs  %edx,%eax
c0003ffc:	c1 f8 09             	sar    $0x9,%eax
c0003fff:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004002:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0004005:	99                   	cltd   
c0004006:	c1 ea 1d             	shr    $0x1d,%edx
c0004009:	01 d0                	add    %edx,%eax
c000400b:	83 e0 07             	and    $0x7,%eax
c000400e:	29 d0                	sub    %edx,%eax
c0004010:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0004013:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c000401a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000401f:	89 c2                	mov    %eax,%edx
c0004021:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004024:	83 c0 02             	add    $0x2,%eax
c0004027:	83 ec 0c             	sub    $0xc,%esp
c000402a:	6a 07                	push   $0x7
c000402c:	68 00 02 00 00       	push   $0x200
c0004031:	52                   	push   %edx
c0004032:	ff 75 b8             	pushl  -0x48(%ebp)
c0004035:	50                   	push   %eax
c0004036:	e8 89 eb ff ff       	call   c0002bc4 <rd_wt>
c000403b:	83 c4 20             	add    $0x20,%esp
c000403e:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004044:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004047:	01 d0                	add    %edx,%eax
c0004049:	0f b6 10             	movzbl (%eax),%edx
c000404c:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000404f:	bb 01 00 00 00       	mov    $0x1,%ebx
c0004054:	89 c1                	mov    %eax,%ecx
c0004056:	d3 e3                	shl    %cl,%ebx
c0004058:	89 d8                	mov    %ebx,%eax
c000405a:	f7 d0                	not    %eax
c000405c:	89 c3                	mov    %eax,%ebx
c000405e:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0004064:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004067:	01 c8                	add    %ecx,%eax
c0004069:	21 da                	and    %ebx,%edx
c000406b:	88 10                	mov    %dl,(%eax)
c000406d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004072:	89 c2                	mov    %eax,%edx
c0004074:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004077:	83 c0 02             	add    $0x2,%eax
c000407a:	83 ec 0c             	sub    $0xc,%esp
c000407d:	6a 0a                	push   $0xa
c000407f:	68 00 02 00 00       	push   $0x200
c0004084:	52                   	push   %edx
c0004085:	ff 75 b8             	pushl  -0x48(%ebp)
c0004088:	50                   	push   %eax
c0004089:	e8 36 eb ff ff       	call   c0002bc4 <rd_wt>
c000408e:	83 c4 20             	add    $0x20,%esp
c0004091:	e8 ec 08 00 00       	call   c0004982 <get_super_block>
c0004096:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0004099:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c000409f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00040a2:	8b 00                	mov    (%eax),%eax
c00040a4:	29 c2                	sub    %eax,%edx
c00040a6:	89 d0                	mov    %edx,%eax
c00040a8:	83 c0 01             	add    $0x1,%eax
c00040ab:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00040ae:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00040b1:	8d 50 07             	lea    0x7(%eax),%edx
c00040b4:	85 c0                	test   %eax,%eax
c00040b6:	0f 48 c2             	cmovs  %edx,%eax
c00040b9:	c1 f8 03             	sar    $0x3,%eax
c00040bc:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00040bf:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00040c2:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00040c8:	85 c0                	test   %eax,%eax
c00040ca:	0f 48 c2             	cmovs  %edx,%eax
c00040cd:	c1 f8 09             	sar    $0x9,%eax
c00040d0:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00040d3:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00040d6:	99                   	cltd   
c00040d7:	c1 ea 1d             	shr    $0x1d,%edx
c00040da:	01 d0                	add    %edx,%eax
c00040dc:	83 e0 07             	and    $0x7,%eax
c00040df:	29 d0                	sub    %edx,%eax
c00040e1:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00040e4:	b8 08 00 00 00       	mov    $0x8,%eax
c00040e9:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c00040ec:	8b 55 b0             	mov    -0x50(%ebp),%edx
c00040ef:	29 c2                	sub    %eax,%edx
c00040f1:	89 d0                	mov    %edx,%eax
c00040f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00040f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00040f9:	8d 50 07             	lea    0x7(%eax),%edx
c00040fc:	85 c0                	test   %eax,%eax
c00040fe:	0f 48 c2             	cmovs  %edx,%eax
c0004101:	c1 f8 03             	sar    $0x3,%eax
c0004104:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004107:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000410c:	89 c1                	mov    %eax,%ecx
c000410e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004111:	8b 40 04             	mov    0x4(%eax),%eax
c0004114:	8d 50 02             	lea    0x2(%eax),%edx
c0004117:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000411a:	01 d0                	add    %edx,%eax
c000411c:	83 ec 0c             	sub    $0xc,%esp
c000411f:	6a 07                	push   $0x7
c0004121:	68 00 02 00 00       	push   $0x200
c0004126:	51                   	push   %ecx
c0004127:	ff 75 b8             	pushl  -0x48(%ebp)
c000412a:	50                   	push   %eax
c000412b:	e8 94 ea ff ff       	call   c0002bc4 <rd_wt>
c0004130:	83 c4 20             	add    $0x20,%esp
c0004133:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004139:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000413c:	01 d0                	add    %edx,%eax
c000413e:	0f b6 10             	movzbl (%eax),%edx
c0004141:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004144:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0004149:	89 c1                	mov    %eax,%ecx
c000414b:	d3 e3                	shl    %cl,%ebx
c000414d:	89 d8                	mov    %ebx,%eax
c000414f:	f7 d0                	not    %eax
c0004151:	89 c3                	mov    %eax,%ebx
c0004153:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0004159:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000415c:	01 c8                	add    %ecx,%eax
c000415e:	21 da                	and    %ebx,%edx
c0004160:	88 10                	mov    %dl,(%eax)
c0004162:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004169:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000416c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000416f:	eb 6b                	jmp    c00041dc <do_unlink+0x2a5>
c0004171:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0004178:	75 4c                	jne    c00041c6 <do_unlink+0x28f>
c000417a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004181:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004186:	83 ec 0c             	sub    $0xc,%esp
c0004189:	6a 0a                	push   $0xa
c000418b:	68 00 02 00 00       	push   $0x200
c0004190:	50                   	push   %eax
c0004191:	ff 75 b8             	pushl  -0x48(%ebp)
c0004194:	ff 75 ec             	pushl  -0x14(%ebp)
c0004197:	e8 28 ea ff ff       	call   c0002bc4 <rd_wt>
c000419c:	83 c4 20             	add    $0x20,%esp
c000419f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041a4:	89 c1                	mov    %eax,%ecx
c00041a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00041a9:	8d 50 01             	lea    0x1(%eax),%edx
c00041ac:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00041af:	83 ec 0c             	sub    $0xc,%esp
c00041b2:	6a 07                	push   $0x7
c00041b4:	68 00 02 00 00       	push   $0x200
c00041b9:	51                   	push   %ecx
c00041ba:	ff 75 b8             	pushl  -0x48(%ebp)
c00041bd:	50                   	push   %eax
c00041be:	e8 01 ea ff ff       	call   c0002bc4 <rd_wt>
c00041c3:	83 c4 20             	add    $0x20,%esp
c00041c6:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00041cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041cf:	01 d0                	add    %edx,%eax
c00041d1:	c6 00 00             	movb   $0x0,(%eax)
c00041d4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00041d8:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c00041dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041df:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c00041e2:	7c 8d                	jl     c0004171 <do_unlink+0x23a>
c00041e4:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c00041eb:	75 4c                	jne    c0004239 <do_unlink+0x302>
c00041ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00041f4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041f9:	83 ec 0c             	sub    $0xc,%esp
c00041fc:	6a 0a                	push   $0xa
c00041fe:	68 00 02 00 00       	push   $0x200
c0004203:	50                   	push   %eax
c0004204:	ff 75 b8             	pushl  -0x48(%ebp)
c0004207:	ff 75 ec             	pushl  -0x14(%ebp)
c000420a:	e8 b5 e9 ff ff       	call   c0002bc4 <rd_wt>
c000420f:	83 c4 20             	add    $0x20,%esp
c0004212:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004217:	89 c1                	mov    %eax,%ecx
c0004219:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000421c:	8d 50 01             	lea    0x1(%eax),%edx
c000421f:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004222:	83 ec 0c             	sub    $0xc,%esp
c0004225:	6a 07                	push   $0x7
c0004227:	68 00 02 00 00       	push   $0x200
c000422c:	51                   	push   %ecx
c000422d:	ff 75 b8             	pushl  -0x48(%ebp)
c0004230:	50                   	push   %eax
c0004231:	e8 8e e9 ff ff       	call   c0002bc4 <rd_wt>
c0004236:	83 c4 20             	add    $0x20,%esp
c0004239:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000423f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004242:	01 d0                	add    %edx,%eax
c0004244:	0f b6 10             	movzbl (%eax),%edx
c0004247:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000424a:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c000424f:	89 c1                	mov    %eax,%ecx
c0004251:	d3 e3                	shl    %cl,%ebx
c0004253:	89 d8                	mov    %ebx,%eax
c0004255:	89 c3                	mov    %eax,%ebx
c0004257:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c000425d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004260:	01 c8                	add    %ecx,%eax
c0004262:	21 da                	and    %ebx,%edx
c0004264:	88 10                	mov    %dl,(%eax)
c0004266:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000426b:	83 ec 0c             	sub    $0xc,%esp
c000426e:	6a 0a                	push   $0xa
c0004270:	68 00 02 00 00       	push   $0x200
c0004275:	50                   	push   %eax
c0004276:	ff 75 b8             	pushl  -0x48(%ebp)
c0004279:	ff 75 ec             	pushl  -0x14(%ebp)
c000427c:	e8 43 e9 ff ff       	call   c0002bc4 <rd_wt>
c0004281:	83 c4 20             	add    $0x20,%esp
c0004284:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c000428b:	00 00 00 
c000428e:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0004295:	00 00 00 
c0004298:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c000429f:	00 00 00 
c00042a2:	83 ec 0c             	sub    $0xc,%esp
c00042a5:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00042ab:	50                   	push   %eax
c00042ac:	e8 ed 04 00 00       	call   c000479e <sync_inode>
c00042b1:	83 c4 10             	add    $0x10,%esp
c00042b4:	83 ec 0c             	sub    $0xc,%esp
c00042b7:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00042bd:	50                   	push   %eax
c00042be:	e8 2f 06 00 00       	call   c00048f2 <put_inode>
c00042c3:	83 c4 10             	add    $0x10,%esp
c00042c6:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00042c9:	8b 00                	mov    (%eax),%eax
c00042cb:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00042ce:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c00042d5:	8b 45 98             	mov    -0x68(%ebp),%eax
c00042d8:	8b 40 04             	mov    0x4(%eax),%eax
c00042db:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00042de:	8b 45 98             	mov    -0x68(%ebp),%eax
c00042e1:	8b 40 0c             	mov    0xc(%eax),%eax
c00042e4:	89 45 90             	mov    %eax,-0x70(%ebp)
c00042e7:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00042ea:	c1 e8 04             	shr    $0x4,%eax
c00042ed:	89 45 8c             	mov    %eax,-0x74(%ebp)
c00042f0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00042f7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00042fe:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004305:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000430c:	e9 a5 00 00 00       	jmp    c00043b6 <do_unlink+0x47f>
c0004311:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004316:	89 c1                	mov    %eax,%ecx
c0004318:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000431b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000431e:	01 d0                	add    %edx,%eax
c0004320:	83 ec 0c             	sub    $0xc,%esp
c0004323:	6a 07                	push   $0x7
c0004325:	68 00 02 00 00       	push   $0x200
c000432a:	51                   	push   %ecx
c000432b:	ff 75 b8             	pushl  -0x48(%ebp)
c000432e:	50                   	push   %eax
c000432f:	e8 90 e8 ff ff       	call   c0002bc4 <rd_wt>
c0004334:	83 c4 20             	add    $0x20,%esp
c0004337:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000433c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000433f:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0004346:	eb 51                	jmp    c0004399 <do_unlink+0x462>
c0004348:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000434c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000434f:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004352:	7f 4f                	jg     c00043a3 <do_unlink+0x46c>
c0004354:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004357:	83 c0 10             	add    $0x10,%eax
c000435a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000435d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004360:	83 c0 04             	add    $0x4,%eax
c0004363:	83 ec 08             	sub    $0x8,%esp
c0004366:	ff 75 08             	pushl  0x8(%ebp)
c0004369:	50                   	push   %eax
c000436a:	e8 d7 65 00 00       	call   c000a946 <strcmp>
c000436f:	83 c4 10             	add    $0x10,%esp
c0004372:	85 c0                	test   %eax,%eax
c0004374:	75 1b                	jne    c0004391 <do_unlink+0x45a>
c0004376:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000437d:	83 ec 04             	sub    $0x4,%esp
c0004380:	6a 10                	push   $0x10
c0004382:	6a 00                	push   $0x0
c0004384:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004387:	e8 5f 80 00 00       	call   c000c3eb <Memset>
c000438c:	83 c4 10             	add    $0x10,%esp
c000438f:	eb 13                	jmp    c00043a4 <do_unlink+0x46d>
c0004391:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0004395:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0004399:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000439c:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000439f:	7c a7                	jl     c0004348 <do_unlink+0x411>
c00043a1:	eb 01                	jmp    c00043a4 <do_unlink+0x46d>
c00043a3:	90                   	nop
c00043a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00043a7:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00043aa:	7f 16                	jg     c00043c2 <do_unlink+0x48b>
c00043ac:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00043b0:	75 10                	jne    c00043c2 <do_unlink+0x48b>
c00043b2:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c00043b6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00043b9:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00043bc:	0f 8c 4f ff ff ff    	jl     c0004311 <do_unlink+0x3da>
c00043c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00043c5:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00043c8:	75 17                	jne    c00043e1 <do_unlink+0x4aa>
c00043ca:	8b 45 98             	mov    -0x68(%ebp),%eax
c00043cd:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00043d0:	89 50 04             	mov    %edx,0x4(%eax)
c00043d3:	83 ec 0c             	sub    $0xc,%esp
c00043d6:	ff 75 98             	pushl  -0x68(%ebp)
c00043d9:	e8 c0 03 00 00       	call   c000479e <sync_inode>
c00043de:	83 c4 10             	add    $0x10,%esp
c00043e1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00043e5:	74 26                	je     c000440d <do_unlink+0x4d6>
c00043e7:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00043ec:	89 c1                	mov    %eax,%ecx
c00043ee:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00043f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00043f4:	01 d0                	add    %edx,%eax
c00043f6:	83 ec 0c             	sub    $0xc,%esp
c00043f9:	6a 0a                	push   $0xa
c00043fb:	68 00 02 00 00       	push   $0x200
c0004400:	51                   	push   %ecx
c0004401:	ff 75 b8             	pushl  -0x48(%ebp)
c0004404:	50                   	push   %eax
c0004405:	e8 ba e7 ff ff       	call   c0002bc4 <rd_wt>
c000440a:	83 c4 20             	add    $0x20,%esp
c000440d:	90                   	nop
c000440e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004411:	c9                   	leave  
c0004412:	c3                   	ret    

c0004413 <do_rdwt>:
c0004413:	55                   	push   %ebp
c0004414:	89 e5                	mov    %esp,%ebp
c0004416:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000441c:	8b 45 08             	mov    0x8(%ebp),%eax
c000441f:	8b 40 68             	mov    0x68(%eax),%eax
c0004422:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004425:	8b 45 08             	mov    0x8(%ebp),%eax
c0004428:	8b 40 50             	mov    0x50(%eax),%eax
c000442b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000442e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004431:	8b 40 5c             	mov    0x5c(%eax),%eax
c0004434:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004437:	8b 45 08             	mov    0x8(%ebp),%eax
c000443a:	8b 00                	mov    (%eax),%eax
c000443c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000443f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004442:	8b 40 10             	mov    0x10(%eax),%eax
c0004445:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004448:	8b 45 08             	mov    0x8(%ebp),%eax
c000444b:	8b 40 40             	mov    0x40(%eax),%eax
c000444e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004451:	83 ec 0c             	sub    $0xc,%esp
c0004454:	ff 75 d0             	pushl  -0x30(%ebp)
c0004457:	e8 2a 07 00 00       	call   c0004b86 <pid2proc>
c000445c:	83 c4 10             	add    $0x10,%esp
c000445f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0004462:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0004465:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0004468:	83 c2 50             	add    $0x50,%edx
c000446b:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c000446f:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0004472:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004475:	8b 40 08             	mov    0x8(%eax),%eax
c0004478:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000447b:	8b 45 08             	mov    0x8(%ebp),%eax
c000447e:	8b 00                	mov    (%eax),%eax
c0004480:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0004483:	83 ec 08             	sub    $0x8,%esp
c0004486:	ff 75 bc             	pushl  -0x44(%ebp)
c0004489:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c000448f:	50                   	push   %eax
c0004490:	e8 0d f2 ff ff       	call   c00036a2 <get_inode>
c0004495:	83 c4 10             	add    $0x10,%esp
c0004498:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000449b:	83 7d b4 00          	cmpl   $0x0,-0x4c(%ebp)
c000449f:	75 10                	jne    c00044b1 <do_rdwt+0x9e>
c00044a1:	83 ec 0c             	sub    $0xc,%esp
c00044a4:	68 38 b9 00 c0       	push   $0xc000b938
c00044a9:	e8 f2 57 00 00       	call   c0009ca0 <panic>
c00044ae:	83 c4 10             	add    $0x10,%esp
c00044b1:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00044b7:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00044ba:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00044bd:	8b 40 04             	mov    0x4(%eax),%eax
c00044c0:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00044c3:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c00044c7:	74 22                	je     c00044eb <do_rdwt+0xd8>
c00044c9:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00044cd:	74 1c                	je     c00044eb <do_rdwt+0xd8>
c00044cf:	68 a7 04 00 00       	push   $0x4a7
c00044d4:	68 a4 b7 00 c0       	push   $0xc000b7a4
c00044d9:	68 a4 b7 00 c0       	push   $0xc000b7a4
c00044de:	68 48 b9 00 c0       	push   $0xc000b948
c00044e3:	e8 d6 57 00 00       	call   c0009cbe <assertion_failure>
c00044e8:	83 c4 10             	add    $0x10,%esp
c00044eb:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c00044f1:	83 f8 01             	cmp    $0x1,%eax
c00044f4:	0f 85 86 00 00 00    	jne    c0004580 <do_rdwt+0x16d>
c00044fa:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00044fe:	75 09                	jne    c0004509 <do_rdwt+0xf6>
c0004500:	c7 45 f4 d2 07 00 00 	movl   $0x7d2,-0xc(%ebp)
c0004507:	eb 0d                	jmp    c0004516 <do_rdwt+0x103>
c0004509:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c000450d:	75 07                	jne    c0004516 <do_rdwt+0x103>
c000450f:	c7 45 f4 d3 07 00 00 	movl   $0x7d3,-0xc(%ebp)
c0004516:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004519:	8b 45 08             	mov    0x8(%ebp),%eax
c000451c:	89 50 68             	mov    %edx,0x68(%eax)
c000451f:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0004522:	8b 45 08             	mov    0x8(%ebp),%eax
c0004525:	89 50 58             	mov    %edx,0x58(%eax)
c0004528:	83 ec 04             	sub    $0x4,%esp
c000452b:	6a 04                	push   $0x4
c000452d:	ff 75 08             	pushl  0x8(%ebp)
c0004530:	6a 03                	push   $0x3
c0004532:	e8 b3 60 00 00       	call   c000a5ea <send_rec>
c0004537:	83 c4 10             	add    $0x10,%esp
c000453a:	8b 45 08             	mov    0x8(%ebp),%eax
c000453d:	8b 40 68             	mov    0x68(%eax),%eax
c0004540:	83 f8 66             	cmp    $0x66,%eax
c0004543:	75 13                	jne    c0004558 <do_rdwt+0x145>
c0004545:	83 ec 04             	sub    $0x4,%esp
c0004548:	ff 75 b8             	pushl  -0x48(%ebp)
c000454b:	ff 75 08             	pushl  0x8(%ebp)
c000454e:	6a 01                	push   $0x1
c0004550:	e8 95 60 00 00       	call   c000a5ea <send_rec>
c0004555:	83 c4 10             	add    $0x10,%esp
c0004558:	8b 45 08             	mov    0x8(%ebp),%eax
c000455b:	8b 40 68             	mov    0x68(%eax),%eax
c000455e:	83 f8 65             	cmp    $0x65,%eax
c0004561:	75 13                	jne    c0004576 <do_rdwt+0x163>
c0004563:	83 ec 04             	sub    $0x4,%esp
c0004566:	ff 75 b8             	pushl  -0x48(%ebp)
c0004569:	ff 75 08             	pushl  0x8(%ebp)
c000456c:	6a 01                	push   $0x1
c000456e:	e8 77 60 00 00       	call   c000a5ea <send_rec>
c0004573:	83 c4 10             	add    $0x10,%esp
c0004576:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000457b:	e9 1c 02 00 00       	jmp    c000479c <do_rdwt+0x389>
c0004580:	83 7d dc 0a          	cmpl   $0xa,-0x24(%ebp)
c0004584:	75 18                	jne    c000459e <do_rdwt+0x18b>
c0004586:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000458c:	c1 e0 09             	shl    $0x9,%eax
c000458f:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004592:	75 0a                	jne    c000459e <do_rdwt+0x18b>
c0004594:	b8 00 00 00 00       	mov    $0x0,%eax
c0004599:	e9 fe 01 00 00       	jmp    c000479c <do_rdwt+0x389>
c000459e:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c00045a2:	75 14                	jne    c00045b8 <do_rdwt+0x1a5>
c00045a4:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00045a7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00045aa:	01 d0                	add    %edx,%eax
c00045ac:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c00045af:	0f 4e 45 b0          	cmovle -0x50(%ebp),%eax
c00045b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00045b6:	eb 19                	jmp    c00045d1 <do_rdwt+0x1be>
c00045b8:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00045bb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00045be:	01 c2                	add    %eax,%edx
c00045c0:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00045c6:	c1 e0 09             	shl    $0x9,%eax
c00045c9:	39 c2                	cmp    %eax,%edx
c00045cb:	0f 4e c2             	cmovle %edx,%eax
c00045ce:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00045d1:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00045d4:	99                   	cltd   
c00045d5:	c1 ea 17             	shr    $0x17,%edx
c00045d8:	01 d0                	add    %edx,%eax
c00045da:	25 ff 01 00 00       	and    $0x1ff,%eax
c00045df:	29 d0                	sub    %edx,%eax
c00045e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00045e4:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c00045ea:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00045ed:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00045f3:	85 c0                	test   %eax,%eax
c00045f5:	0f 48 c1             	cmovs  %ecx,%eax
c00045f8:	c1 f8 09             	sar    $0x9,%eax
c00045fb:	01 d0                	add    %edx,%eax
c00045fd:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004600:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c0004606:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004609:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c000460f:	85 c0                	test   %eax,%eax
c0004611:	0f 48 c1             	cmovs  %ecx,%eax
c0004614:	c1 f8 09             	sar    $0x9,%eax
c0004617:	01 d0                	add    %edx,%eax
c0004619:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c000461c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000461f:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004622:	ba 00 00 10 00       	mov    $0x100000,%edx
c0004627:	39 d0                	cmp    %edx,%eax
c0004629:	7d 0b                	jge    c0004636 <do_rdwt+0x223>
c000462b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000462e:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004631:	83 c0 01             	add    $0x1,%eax
c0004634:	eb 05                	jmp    c000463b <do_rdwt+0x228>
c0004636:	b8 00 00 10 00       	mov    $0x100000,%eax
c000463b:	89 45 a0             	mov    %eax,-0x60(%ebp)
c000463e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004641:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004644:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000464b:	8b 45 08             	mov    0x8(%ebp),%eax
c000464e:	8b 00                	mov    (%eax),%eax
c0004650:	83 ec 0c             	sub    $0xc,%esp
c0004653:	50                   	push   %eax
c0004654:	e8 2d 05 00 00       	call   c0004b86 <pid2proc>
c0004659:	83 c4 10             	add    $0x10,%esp
c000465c:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000465f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004662:	83 ec 08             	sub    $0x8,%esp
c0004665:	50                   	push   %eax
c0004666:	ff 75 cc             	pushl  -0x34(%ebp)
c0004669:	e8 5b 29 00 00       	call   c0006fc9 <alloc_virtual_memory>
c000466e:	83 c4 10             	add    $0x10,%esp
c0004671:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004674:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0004677:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000467a:	e9 c5 00 00 00       	jmp    c0004744 <do_rdwt+0x331>
c000467f:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004682:	c1 e0 09             	shl    $0x9,%eax
c0004685:	2b 45 ec             	sub    -0x14(%ebp),%eax
c0004688:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000468b:	0f 4e 45 e8          	cmovle -0x18(%ebp),%eax
c000468f:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004692:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c0004699:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000469d:	75 46                	jne    c00046e5 <do_rdwt+0x2d2>
c000469f:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00046a2:	c1 e0 09             	shl    $0x9,%eax
c00046a5:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00046ab:	83 ec 0c             	sub    $0xc,%esp
c00046ae:	6a 07                	push   $0x7
c00046b0:	50                   	push   %eax
c00046b1:	52                   	push   %edx
c00046b2:	ff 75 90             	pushl  -0x70(%ebp)
c00046b5:	ff 75 e0             	pushl  -0x20(%ebp)
c00046b8:	e8 07 e5 ff ff       	call   c0002bc4 <rd_wt>
c00046bd:	83 c4 20             	add    $0x20,%esp
c00046c0:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00046c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046c9:	01 d0                	add    %edx,%eax
c00046cb:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c00046ce:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00046d1:	01 ca                	add    %ecx,%edx
c00046d3:	83 ec 04             	sub    $0x4,%esp
c00046d6:	ff 75 94             	pushl  -0x6c(%ebp)
c00046d9:	50                   	push   %eax
c00046da:	52                   	push   %edx
c00046db:	e8 f9 35 00 00       	call   c0007cd9 <Memcpy>
c00046e0:	83 c4 10             	add    $0x10,%esp
c00046e3:	eb 46                	jmp    c000472b <do_rdwt+0x318>
c00046e5:	8b 55 98             	mov    -0x68(%ebp),%edx
c00046e8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00046eb:	01 d0                	add    %edx,%eax
c00046ed:	89 c1                	mov    %eax,%ecx
c00046ef:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00046f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046f8:	01 d0                	add    %edx,%eax
c00046fa:	83 ec 04             	sub    $0x4,%esp
c00046fd:	ff 75 94             	pushl  -0x6c(%ebp)
c0004700:	51                   	push   %ecx
c0004701:	50                   	push   %eax
c0004702:	e8 d2 35 00 00       	call   c0007cd9 <Memcpy>
c0004707:	83 c4 10             	add    $0x10,%esp
c000470a:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000470d:	c1 e0 09             	shl    $0x9,%eax
c0004710:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c0004716:	83 ec 0c             	sub    $0xc,%esp
c0004719:	6a 0a                	push   $0xa
c000471b:	50                   	push   %eax
c000471c:	52                   	push   %edx
c000471d:	ff 75 90             	pushl  -0x70(%ebp)
c0004720:	ff 75 e0             	pushl  -0x20(%ebp)
c0004723:	e8 9c e4 ff ff       	call   c0002bc4 <rd_wt>
c0004728:	83 c4 20             	add    $0x20,%esp
c000472b:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000472e:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0004731:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004734:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0004737:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000473e:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004741:	01 45 e0             	add    %eax,-0x20(%ebp)
c0004744:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004747:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c000474a:	7f 0a                	jg     c0004756 <do_rdwt+0x343>
c000474c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004750:	0f 85 29 ff ff ff    	jne    c000467f <do_rdwt+0x26c>
c0004756:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004759:	8b 50 04             	mov    0x4(%eax),%edx
c000475c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000475f:	01 c2                	add    %eax,%edx
c0004761:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004764:	89 50 04             	mov    %edx,0x4(%eax)
c0004767:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000476a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000476d:	01 c2                	add    %eax,%edx
c000476f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004775:	39 c2                	cmp    %eax,%edx
c0004777:	7e 20                	jle    c0004799 <do_rdwt+0x386>
c0004779:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000477c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000477f:	01 d0                	add    %edx,%eax
c0004781:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0004787:	83 ec 0c             	sub    $0xc,%esp
c000478a:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0004790:	50                   	push   %eax
c0004791:	e8 08 00 00 00       	call   c000479e <sync_inode>
c0004796:	83 c4 10             	add    $0x10,%esp
c0004799:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000479c:	c9                   	leave  
c000479d:	c3                   	ret    

c000479e <sync_inode>:
c000479e:	55                   	push   %ebp
c000479f:	89 e5                	mov    %esp,%ebp
c00047a1:	53                   	push   %ebx
c00047a2:	83 ec 34             	sub    $0x34,%esp
c00047a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00047ac:	eb 74                	jmp    c0004822 <sync_inode+0x84>
c00047ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00047b1:	89 d0                	mov    %edx,%eax
c00047b3:	c1 e0 02             	shl    $0x2,%eax
c00047b6:	01 d0                	add    %edx,%eax
c00047b8:	c1 e0 03             	shl    $0x3,%eax
c00047bb:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c00047c0:	8b 10                	mov    (%eax),%edx
c00047c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00047c5:	8b 40 10             	mov    0x10(%eax),%eax
c00047c8:	39 c2                	cmp    %eax,%edx
c00047ca:	75 52                	jne    c000481e <sync_inode+0x80>
c00047cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00047cf:	89 d0                	mov    %edx,%eax
c00047d1:	c1 e0 02             	shl    $0x2,%eax
c00047d4:	01 d0                	add    %edx,%eax
c00047d6:	c1 e0 03             	shl    $0x3,%eax
c00047d9:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c00047df:	8b 45 08             	mov    0x8(%ebp),%eax
c00047e2:	8b 08                	mov    (%eax),%ecx
c00047e4:	89 0a                	mov    %ecx,(%edx)
c00047e6:	8b 48 04             	mov    0x4(%eax),%ecx
c00047e9:	89 4a 04             	mov    %ecx,0x4(%edx)
c00047ec:	8b 48 08             	mov    0x8(%eax),%ecx
c00047ef:	89 4a 08             	mov    %ecx,0x8(%edx)
c00047f2:	8b 48 0c             	mov    0xc(%eax),%ecx
c00047f5:	89 4a 0c             	mov    %ecx,0xc(%edx)
c00047f8:	8b 48 10             	mov    0x10(%eax),%ecx
c00047fb:	89 4a 10             	mov    %ecx,0x10(%edx)
c00047fe:	8b 48 14             	mov    0x14(%eax),%ecx
c0004801:	89 4a 14             	mov    %ecx,0x14(%edx)
c0004804:	8b 48 18             	mov    0x18(%eax),%ecx
c0004807:	89 4a 18             	mov    %ecx,0x18(%edx)
c000480a:	8b 48 1c             	mov    0x1c(%eax),%ecx
c000480d:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004810:	8b 48 20             	mov    0x20(%eax),%ecx
c0004813:	89 4a 20             	mov    %ecx,0x20(%edx)
c0004816:	8b 40 24             	mov    0x24(%eax),%eax
c0004819:	89 42 24             	mov    %eax,0x24(%edx)
c000481c:	eb 0a                	jmp    c0004828 <sync_inode+0x8a>
c000481e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004822:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0004826:	7e 86                	jle    c00047ae <sync_inode+0x10>
c0004828:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c000482f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004832:	8b 40 10             	mov    0x10(%eax),%eax
c0004835:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004838:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000483b:	8d 48 ff             	lea    -0x1(%eax),%ecx
c000483e:	b8 00 02 00 00       	mov    $0x200,%eax
c0004843:	99                   	cltd   
c0004844:	f7 7d f0             	idivl  -0x10(%ebp)
c0004847:	89 c3                	mov    %eax,%ebx
c0004849:	89 c8                	mov    %ecx,%eax
c000484b:	99                   	cltd   
c000484c:	f7 fb                	idiv   %ebx
c000484e:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004851:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004854:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004857:	b8 00 02 00 00       	mov    $0x200,%eax
c000485c:	99                   	cltd   
c000485d:	f7 7d f0             	idivl  -0x10(%ebp)
c0004860:	89 c3                	mov    %eax,%ebx
c0004862:	89 c8                	mov    %ecx,%eax
c0004864:	99                   	cltd   
c0004865:	f7 fb                	idiv   %ebx
c0004867:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000486a:	8b 45 08             	mov    0x8(%ebp),%eax
c000486d:	8b 40 20             	mov    0x20(%eax),%eax
c0004870:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004873:	e8 0a 01 00 00       	call   c0004982 <get_super_block>
c0004878:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000487b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000487e:	8b 40 04             	mov    0x4(%eax),%eax
c0004881:	8d 50 02             	lea    0x2(%eax),%edx
c0004884:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004887:	8b 40 08             	mov    0x8(%eax),%eax
c000488a:	01 c2                	add    %eax,%edx
c000488c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000488f:	01 d0                	add    %edx,%eax
c0004891:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004894:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004899:	83 ec 0c             	sub    $0xc,%esp
c000489c:	6a 07                	push   $0x7
c000489e:	68 00 02 00 00       	push   $0x200
c00048a3:	50                   	push   %eax
c00048a4:	ff 75 e0             	pushl  -0x20(%ebp)
c00048a7:	ff 75 d8             	pushl  -0x28(%ebp)
c00048aa:	e8 15 e3 ff ff       	call   c0002bc4 <rd_wt>
c00048af:	83 c4 20             	add    $0x20,%esp
c00048b2:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00048b7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00048ba:	83 ec 04             	sub    $0x4,%esp
c00048bd:	ff 75 f0             	pushl  -0x10(%ebp)
c00048c0:	ff 75 08             	pushl  0x8(%ebp)
c00048c3:	ff 75 d4             	pushl  -0x2c(%ebp)
c00048c6:	e8 0e 34 00 00       	call   c0007cd9 <Memcpy>
c00048cb:	83 c4 10             	add    $0x10,%esp
c00048ce:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00048d3:	83 ec 0c             	sub    $0xc,%esp
c00048d6:	6a 0a                	push   $0xa
c00048d8:	68 00 02 00 00       	push   $0x200
c00048dd:	50                   	push   %eax
c00048de:	ff 75 e0             	pushl  -0x20(%ebp)
c00048e1:	ff 75 d8             	pushl  -0x28(%ebp)
c00048e4:	e8 db e2 ff ff       	call   c0002bc4 <rd_wt>
c00048e9:	83 c4 20             	add    $0x20,%esp
c00048ec:	90                   	nop
c00048ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00048f0:	c9                   	leave  
c00048f1:	c3                   	ret    

c00048f2 <put_inode>:
c00048f2:	55                   	push   %ebp
c00048f3:	89 e5                	mov    %esp,%ebp
c00048f5:	83 ec 08             	sub    $0x8,%esp
c00048f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00048fb:	8b 40 24             	mov    0x24(%eax),%eax
c00048fe:	85 c0                	test   %eax,%eax
c0004900:	7f 1c                	jg     c000491e <put_inode+0x2c>
c0004902:	68 4c 05 00 00       	push   $0x54c
c0004907:	68 a4 b7 00 c0       	push   $0xc000b7a4
c000490c:	68 a4 b7 00 c0       	push   $0xc000b7a4
c0004911:	68 7c b9 00 c0       	push   $0xc000b97c
c0004916:	e8 a3 53 00 00       	call   c0009cbe <assertion_failure>
c000491b:	83 c4 10             	add    $0x10,%esp
c000491e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004921:	8b 40 24             	mov    0x24(%eax),%eax
c0004924:	8d 50 ff             	lea    -0x1(%eax),%edx
c0004927:	8b 45 08             	mov    0x8(%ebp),%eax
c000492a:	89 50 24             	mov    %edx,0x24(%eax)
c000492d:	90                   	nop
c000492e:	c9                   	leave  
c000492f:	c3                   	ret    

c0004930 <do_close>:
c0004930:	55                   	push   %ebp
c0004931:	89 e5                	mov    %esp,%ebp
c0004933:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0004938:	8b 55 08             	mov    0x8(%ebp),%edx
c000493b:	83 c2 50             	add    $0x50,%edx
c000493e:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004942:	8b 50 0c             	mov    0xc(%eax),%edx
c0004945:	83 ea 01             	sub    $0x1,%edx
c0004948:	89 50 0c             	mov    %edx,0xc(%eax)
c000494b:	8b 40 0c             	mov    0xc(%eax),%eax
c000494e:	85 c0                	test   %eax,%eax
c0004950:	75 16                	jne    c0004968 <do_close+0x38>
c0004952:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c0004957:	8b 55 08             	mov    0x8(%ebp),%edx
c000495a:	83 c2 50             	add    $0x50,%edx
c000495d:	8b 44 90 08          	mov    0x8(%eax,%edx,4),%eax
c0004961:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0004968:	a1 c8 0b 01 c0       	mov    0xc0010bc8,%eax
c000496d:	8b 55 08             	mov    0x8(%ebp),%edx
c0004970:	83 c2 50             	add    $0x50,%edx
c0004973:	c7 44 90 08 00 00 00 	movl   $0x0,0x8(%eax,%edx,4)
c000497a:	00 
c000497b:	b8 00 00 00 00       	mov    $0x0,%eax
c0004980:	5d                   	pop    %ebp
c0004981:	c3                   	ret    

c0004982 <get_super_block>:
c0004982:	55                   	push   %ebp
c0004983:	89 e5                	mov    %esp,%ebp
c0004985:	83 ec 08             	sub    $0x8,%esp
c0004988:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000498d:	83 ec 0c             	sub    $0xc,%esp
c0004990:	6a 07                	push   $0x7
c0004992:	68 00 02 00 00       	push   $0x200
c0004997:	50                   	push   %eax
c0004998:	6a 20                	push   $0x20
c000499a:	6a 01                	push   $0x1
c000499c:	e8 23 e2 ff ff       	call   c0002bc4 <rd_wt>
c00049a1:	83 c4 20             	add    $0x20,%esp
c00049a4:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00049aa:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00049af:	8b 0a                	mov    (%edx),%ecx
c00049b1:	89 08                	mov    %ecx,(%eax)
c00049b3:	8b 4a 04             	mov    0x4(%edx),%ecx
c00049b6:	89 48 04             	mov    %ecx,0x4(%eax)
c00049b9:	8b 4a 08             	mov    0x8(%edx),%ecx
c00049bc:	89 48 08             	mov    %ecx,0x8(%eax)
c00049bf:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00049c2:	89 48 0c             	mov    %ecx,0xc(%eax)
c00049c5:	8b 4a 10             	mov    0x10(%edx),%ecx
c00049c8:	89 48 10             	mov    %ecx,0x10(%eax)
c00049cb:	8b 4a 14             	mov    0x14(%edx),%ecx
c00049ce:	89 48 14             	mov    %ecx,0x14(%eax)
c00049d1:	8b 4a 18             	mov    0x18(%edx),%ecx
c00049d4:	89 48 18             	mov    %ecx,0x18(%eax)
c00049d7:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00049da:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00049dd:	8b 52 20             	mov    0x20(%edx),%edx
c00049e0:	89 50 20             	mov    %edx,0x20(%eax)
c00049e3:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00049e8:	c9                   	leave  
c00049e9:	c3                   	ret    

c00049ea <check>:
c00049ea:	55                   	push   %ebp
c00049eb:	89 e5                	mov    %esp,%ebp
c00049ed:	83 ec 10             	sub    $0x10,%esp
c00049f0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00049f7:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00049fe:	eb 08                	jmp    c0004a08 <check+0x1e>
c0004a00:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0004a04:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0004a08:	83 7d f8 03          	cmpl   $0x3,-0x8(%ebp)
c0004a0c:	7e f2                	jle    c0004a00 <check+0x16>
c0004a0e:	90                   	nop
c0004a0f:	c9                   	leave  
c0004a10:	c3                   	ret    

c0004a11 <schedule_process>:
c0004a11:	55                   	push   %ebp
c0004a12:	89 e5                	mov    %esp,%ebp
c0004a14:	83 ec 18             	sub    $0x18,%esp
c0004a17:	c7 45 f4 00 00 10 00 	movl   $0x100000,-0xc(%ebp)
c0004a1e:	e8 74 ce ff ff       	call   c0001897 <get_running_thread_pcb>
c0004a23:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004a26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a29:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0004a30:	84 c0                	test   %al,%al
c0004a32:	75 30                	jne    c0004a64 <schedule_process+0x53>
c0004a34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a37:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c0004a3e:	00 00 00 
c0004a41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a44:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0004a4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004a4e:	05 00 01 00 00       	add    $0x100,%eax
c0004a53:	83 ec 08             	sub    $0x8,%esp
c0004a56:	50                   	push   %eax
c0004a57:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a5c:	e8 36 68 00 00       	call   c000b297 <insertToDoubleLinkList>
c0004a61:	83 c4 10             	add    $0x10,%esp
c0004a64:	83 ec 0c             	sub    $0xc,%esp
c0004a67:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a6c:	e8 42 66 00 00       	call   c000b0b3 <isListEmpty>
c0004a71:	83 c4 10             	add    $0x10,%esp
c0004a74:	84 c0                	test   %al,%al
c0004a76:	74 19                	je     c0004a91 <schedule_process+0x80>
c0004a78:	6a 28                	push   $0x28
c0004a7a:	68 8b b9 00 c0       	push   $0xc000b98b
c0004a7f:	68 8b b9 00 c0       	push   $0xc000b98b
c0004a84:	68 95 b9 00 c0       	push   $0xc000b995
c0004a89:	e8 30 52 00 00       	call   c0009cbe <assertion_failure>
c0004a8e:	83 c4 10             	add    $0x10,%esp
c0004a91:	83 ec 0c             	sub    $0xc,%esp
c0004a94:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a99:	e8 7c 68 00 00       	call   c000b31a <popFromDoubleLinkList>
c0004a9e:	83 c4 10             	add    $0x10,%esp
c0004aa1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004aa4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004aa7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004aac:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004aaf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004ab2:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0004ab9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004abc:	8b 40 08             	mov    0x8(%eax),%eax
c0004abf:	85 c0                	test   %eax,%eax
c0004ac1:	74 28                	je     c0004aeb <schedule_process+0xda>
c0004ac3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004ac6:	05 00 10 00 00       	add    $0x1000,%eax
c0004acb:	83 ec 0c             	sub    $0xc,%esp
c0004ace:	50                   	push   %eax
c0004acf:	e8 b4 cd ff ff       	call   c0001888 <update_tss>
c0004ad4:	83 c4 10             	add    $0x10,%esp
c0004ad7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004ada:	8b 40 08             	mov    0x8(%eax),%eax
c0004add:	83 ec 0c             	sub    $0xc,%esp
c0004ae0:	50                   	push   %eax
c0004ae1:	e8 95 cd ff ff       	call   c000187b <update_cr3>
c0004ae6:	83 c4 10             	add    $0x10,%esp
c0004ae9:	eb 0f                	jmp    c0004afa <schedule_process+0xe9>
c0004aeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004aee:	83 ec 0c             	sub    $0xc,%esp
c0004af1:	50                   	push   %eax
c0004af2:	e8 84 cd ff ff       	call   c000187b <update_cr3>
c0004af7:	83 c4 10             	add    $0x10,%esp
c0004afa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004afd:	a3 c0 0b 01 c0       	mov    %eax,0xc0010bc0
c0004b02:	83 ec 08             	sub    $0x8,%esp
c0004b05:	ff 75 e8             	pushl  -0x18(%ebp)
c0004b08:	ff 75 f0             	pushl  -0x10(%ebp)
c0004b0b:	e8 60 65 00 00       	call   c000b070 <switch_to>
c0004b10:	83 c4 10             	add    $0x10,%esp
c0004b13:	90                   	nop
c0004b14:	c9                   	leave  
c0004b15:	c3                   	ret    

c0004b16 <clock_handler>:
c0004b16:	55                   	push   %ebp
c0004b17:	89 e5                	mov    %esp,%ebp
c0004b19:	83 ec 18             	sub    $0x18,%esp
c0004b1c:	e8 76 cd ff ff       	call   c0001897 <get_running_thread_pcb>
c0004b21:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b24:	a1 c0 16 01 c0       	mov    0xc00116c0,%eax
c0004b29:	85 c0                	test   %eax,%eax
c0004b2b:	74 0d                	je     c0004b3a <clock_handler+0x24>
c0004b2d:	83 ec 0c             	sub    $0xc,%esp
c0004b30:	6a 04                	push   $0x4
c0004b32:	e8 42 5d 00 00       	call   c000a879 <inform_int>
c0004b37:	83 c4 10             	add    $0x10,%esp
c0004b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b3d:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004b43:	83 f8 05             	cmp    $0x5,%eax
c0004b46:	75 13                	jne    c0004b5b <clock_handler+0x45>
c0004b48:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b4b:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004b51:	83 f8 01             	cmp    $0x1,%eax
c0004b54:	75 05                	jne    c0004b5b <clock_handler+0x45>
c0004b56:	e8 8f fe ff ff       	call   c00049ea <check>
c0004b5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b5e:	8b 80 28 01 00 00    	mov    0x128(%eax),%eax
c0004b64:	85 c0                	test   %eax,%eax
c0004b66:	74 16                	je     c0004b7e <clock_handler+0x68>
c0004b68:	a1 c0 0b 01 c0       	mov    0xc0010bc0,%eax
c0004b6d:	8b 90 28 01 00 00    	mov    0x128(%eax),%edx
c0004b73:	83 ea 01             	sub    $0x1,%edx
c0004b76:	89 90 28 01 00 00    	mov    %edx,0x128(%eax)
c0004b7c:	eb 05                	jmp    c0004b83 <clock_handler+0x6d>
c0004b7e:	e8 8e fe ff ff       	call   c0004a11 <schedule_process>
c0004b83:	90                   	nop
c0004b84:	c9                   	leave  
c0004b85:	c3                   	ret    

c0004b86 <pid2proc>:
c0004b86:	55                   	push   %ebp
c0004b87:	89 e5                	mov    %esp,%ebp
c0004b89:	83 ec 20             	sub    $0x20,%esp
c0004b8c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0004b93:	a1 04 1f 01 c0       	mov    0xc0011f04,%eax
c0004b98:	8b 15 08 1f 01 c0    	mov    0xc0011f08,%edx
c0004b9e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004ba1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004ba4:	a1 0c 1f 01 c0       	mov    0xc0011f0c,%eax
c0004ba9:	8b 15 10 1f 01 c0    	mov    0xc0011f10,%edx
c0004baf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004bb2:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004bb5:	a1 08 1f 01 c0       	mov    0xc0011f08,%eax
c0004bba:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004bbd:	eb 29                	jmp    c0004be8 <pid2proc+0x62>
c0004bbf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004bc2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004bc7:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004bca:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004bcd:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0004bd3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bd6:	39 c2                	cmp    %eax,%edx
c0004bd8:	75 05                	jne    c0004bdf <pid2proc+0x59>
c0004bda:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004bdd:	eb 17                	jmp    c0004bf6 <pid2proc+0x70>
c0004bdf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004be2:	8b 40 04             	mov    0x4(%eax),%eax
c0004be5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004be8:	81 7d fc 0c 1f 01 c0 	cmpl   $0xc0011f0c,-0x4(%ebp)
c0004bef:	75 ce                	jne    c0004bbf <pid2proc+0x39>
c0004bf1:	b8 00 00 00 00       	mov    $0x0,%eax
c0004bf6:	c9                   	leave  
c0004bf7:	c3                   	ret    

c0004bf8 <proc2pid>:
c0004bf8:	55                   	push   %ebp
c0004bf9:	89 e5                	mov    %esp,%ebp
c0004bfb:	83 ec 10             	sub    $0x10,%esp
c0004bfe:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c01:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0004c07:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004c0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c0d:	c9                   	leave  
c0004c0e:	c3                   	ret    

c0004c0f <InitDescriptor>:
c0004c0f:	55                   	push   %ebp
c0004c10:	89 e5                	mov    %esp,%ebp
c0004c12:	83 ec 04             	sub    $0x4,%esp
c0004c15:	8b 45 14             	mov    0x14(%ebp),%eax
c0004c18:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004c1c:	8b 45 10             	mov    0x10(%ebp),%eax
c0004c1f:	89 c2                	mov    %eax,%edx
c0004c21:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c24:	66 89 10             	mov    %dx,(%eax)
c0004c27:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c2a:	89 c2                	mov    %eax,%edx
c0004c2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c2f:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004c33:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c36:	c1 e8 10             	shr    $0x10,%eax
c0004c39:	89 c2                	mov    %eax,%edx
c0004c3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c3e:	88 50 04             	mov    %dl,0x4(%eax)
c0004c41:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004c45:	89 c2                	mov    %eax,%edx
c0004c47:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c4a:	88 50 05             	mov    %dl,0x5(%eax)
c0004c4d:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004c51:	66 c1 e8 08          	shr    $0x8,%ax
c0004c55:	c1 e0 04             	shl    $0x4,%eax
c0004c58:	89 c2                	mov    %eax,%edx
c0004c5a:	8b 45 10             	mov    0x10(%ebp),%eax
c0004c5d:	c1 e8 10             	shr    $0x10,%eax
c0004c60:	83 e0 0f             	and    $0xf,%eax
c0004c63:	09 c2                	or     %eax,%edx
c0004c65:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c68:	88 50 06             	mov    %dl,0x6(%eax)
c0004c6b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c6e:	c1 e8 18             	shr    $0x18,%eax
c0004c71:	89 c2                	mov    %eax,%edx
c0004c73:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c76:	88 50 07             	mov    %dl,0x7(%eax)
c0004c79:	90                   	nop
c0004c7a:	c9                   	leave  
c0004c7b:	c3                   	ret    

c0004c7c <Seg2PhyAddr>:
c0004c7c:	55                   	push   %ebp
c0004c7d:	89 e5                	mov    %esp,%ebp
c0004c7f:	83 ec 10             	sub    $0x10,%esp
c0004c82:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c85:	c1 e8 03             	shr    $0x3,%eax
c0004c88:	8b 14 c5 c4 07 01 c0 	mov    -0x3ffef83c(,%eax,8),%edx
c0004c8f:	8b 04 c5 c0 07 01 c0 	mov    -0x3ffef840(,%eax,8),%eax
c0004c96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004c99:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004c9c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004ca0:	0f b7 c0             	movzwl %ax,%eax
c0004ca3:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004ca7:	0f b6 d2             	movzbl %dl,%edx
c0004caa:	c1 e2 10             	shl    $0x10,%edx
c0004cad:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004cb3:	09 d0                	or     %edx,%eax
c0004cb5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004cb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004cbb:	c9                   	leave  
c0004cbc:	c3                   	ret    

c0004cbd <Seg2PhyAddrLDT>:
c0004cbd:	55                   	push   %ebp
c0004cbe:	89 e5                	mov    %esp,%ebp
c0004cc0:	83 ec 10             	sub    $0x10,%esp
c0004cc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004cc6:	c1 e8 03             	shr    $0x3,%eax
c0004cc9:	89 c2                	mov    %eax,%edx
c0004ccb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004cce:	83 c2 22             	add    $0x22,%edx
c0004cd1:	8d 54 d0 02          	lea    0x2(%eax,%edx,8),%edx
c0004cd5:	8b 02                	mov    (%edx),%eax
c0004cd7:	8b 52 04             	mov    0x4(%edx),%edx
c0004cda:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004cdd:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004ce0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004ce4:	0f b7 c0             	movzwl %ax,%eax
c0004ce7:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004ceb:	0f b6 d2             	movzbl %dl,%edx
c0004cee:	c1 e2 10             	shl    $0x10,%edx
c0004cf1:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004cf7:	09 d0                	or     %edx,%eax
c0004cf9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004cfc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004cff:	c9                   	leave  
c0004d00:	c3                   	ret    

c0004d01 <VirAddr2PhyAddr>:
c0004d01:	55                   	push   %ebp
c0004d02:	89 e5                	mov    %esp,%ebp
c0004d04:	83 ec 10             	sub    $0x10,%esp
c0004d07:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004d0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d0d:	01 d0                	add    %edx,%eax
c0004d0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004d12:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d15:	c9                   	leave  
c0004d16:	c3                   	ret    

c0004d17 <v2l>:
c0004d17:	55                   	push   %ebp
c0004d18:	89 e5                	mov    %esp,%ebp
c0004d1a:	83 ec 18             	sub    $0x18,%esp
c0004d1d:	83 ec 0c             	sub    $0xc,%esp
c0004d20:	ff 75 08             	pushl  0x8(%ebp)
c0004d23:	e8 5e fe ff ff       	call   c0004b86 <pid2proc>
c0004d28:	83 c4 10             	add    $0x10,%esp
c0004d2b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004d2e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004d35:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004d38:	83 ec 08             	sub    $0x8,%esp
c0004d3b:	ff 75 f4             	pushl  -0xc(%ebp)
c0004d3e:	50                   	push   %eax
c0004d3f:	e8 79 ff ff ff       	call   c0004cbd <Seg2PhyAddrLDT>
c0004d44:	83 c4 10             	add    $0x10,%esp
c0004d47:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004d4a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004d4d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004d50:	01 d0                	add    %edx,%eax
c0004d52:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004d55:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004d58:	c9                   	leave  
c0004d59:	c3                   	ret    

c0004d5a <init_propt>:
c0004d5a:	55                   	push   %ebp
c0004d5b:	89 e5                	mov    %esp,%ebp
c0004d5d:	83 ec 38             	sub    $0x38,%esp
c0004d60:	6a 0e                	push   $0xe
c0004d62:	6a 08                	push   $0x8
c0004d64:	68 71 16 00 c0       	push   $0xc0001671
c0004d69:	6a 20                	push   $0x20
c0004d6b:	e8 58 01 00 00       	call   c0004ec8 <InitInterruptDesc>
c0004d70:	83 c4 10             	add    $0x10,%esp
c0004d73:	6a 0e                	push   $0xe
c0004d75:	6a 08                	push   $0x8
c0004d77:	68 9e 16 00 c0       	push   $0xc000169e
c0004d7c:	6a 21                	push   $0x21
c0004d7e:	e8 45 01 00 00       	call   c0004ec8 <InitInterruptDesc>
c0004d83:	83 c4 10             	add    $0x10,%esp
c0004d86:	6a 0e                	push   $0xe
c0004d88:	6a 08                	push   $0x8
c0004d8a:	68 e0 16 00 c0       	push   $0xc00016e0
c0004d8f:	6a 2e                	push   $0x2e
c0004d91:	e8 32 01 00 00       	call   c0004ec8 <InitInterruptDesc>
c0004d96:	83 c4 10             	add    $0x10,%esp
c0004d99:	83 ec 04             	sub    $0x4,%esp
c0004d9c:	68 a0 15 00 00       	push   $0x15a0
c0004da1:	6a 00                	push   $0x0
c0004da3:	68 00 32 08 c0       	push   $0xc0083200
c0004da8:	e8 3e 76 00 00       	call   c000c3eb <Memset>
c0004dad:	83 c4 10             	add    $0x10,%esp
c0004db0:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004db7:	83 ec 04             	sub    $0x4,%esp
c0004dba:	ff 75 f4             	pushl  -0xc(%ebp)
c0004dbd:	6a 00                	push   $0x0
c0004dbf:	68 40 16 01 c0       	push   $0xc0011640
c0004dc4:	e8 22 76 00 00       	call   c000c3eb <Memset>
c0004dc9:	83 c4 10             	add    $0x10,%esp
c0004dcc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004dcf:	a3 a8 16 01 c0       	mov    %eax,0xc00116a8
c0004dd4:	c7 05 48 16 01 c0 30 	movl   $0x30,0xc0011648
c0004ddb:	00 00 00 
c0004dde:	83 ec 0c             	sub    $0xc,%esp
c0004de1:	6a 30                	push   $0x30
c0004de3:	e8 94 fe ff ff       	call   c0004c7c <Seg2PhyAddr>
c0004de8:	83 c4 10             	add    $0x10,%esp
c0004deb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004dee:	c7 45 ec 40 16 01 c0 	movl   $0xc0011640,-0x14(%ebp)
c0004df5:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004dfc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004dff:	0f b7 d0             	movzwl %ax,%edx
c0004e02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004e05:	83 e8 01             	sub    $0x1,%eax
c0004e08:	89 c1                	mov    %eax,%ecx
c0004e0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004e0d:	52                   	push   %edx
c0004e0e:	51                   	push   %ecx
c0004e0f:	50                   	push   %eax
c0004e10:	68 00 08 01 c0       	push   $0xc0010800
c0004e15:	e8 f5 fd ff ff       	call   c0004c0f <InitDescriptor>
c0004e1a:	83 c4 10             	add    $0x10,%esp
c0004e1d:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004e24:	68 f2 00 00 00       	push   $0xf2
c0004e29:	68 ff ff 00 00       	push   $0xffff
c0004e2e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004e31:	68 f8 07 01 c0       	push   $0xc00107f8
c0004e36:	e8 d4 fd ff ff       	call   c0004c0f <InitDescriptor>
c0004e3b:	83 c4 10             	add    $0x10,%esp
c0004e3e:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004e45:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004e4c:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004e53:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004e56:	0f b7 c0             	movzwl %ax,%eax
c0004e59:	50                   	push   %eax
c0004e5a:	ff 75 d8             	pushl  -0x28(%ebp)
c0004e5d:	6a 00                	push   $0x0
c0004e5f:	68 08 08 01 c0       	push   $0xc0010808
c0004e64:	e8 a6 fd ff ff       	call   c0004c0f <InitDescriptor>
c0004e69:	83 c4 10             	add    $0x10,%esp
c0004e6c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004e6f:	0f b7 c0             	movzwl %ax,%eax
c0004e72:	50                   	push   %eax
c0004e73:	ff 75 d8             	pushl  -0x28(%ebp)
c0004e76:	6a 00                	push   $0x0
c0004e78:	68 10 08 01 c0       	push   $0xc0010810
c0004e7d:	e8 8d fd ff ff       	call   c0004c0f <InitDescriptor>
c0004e82:	83 c4 10             	add    $0x10,%esp
c0004e85:	c7 45 d4 b2 0c 00 00 	movl   $0xcb2,-0x2c(%ebp)
c0004e8c:	c7 45 d0 ba 0c 00 00 	movl   $0xcba,-0x30(%ebp)
c0004e93:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004e96:	0f b7 c0             	movzwl %ax,%eax
c0004e99:	50                   	push   %eax
c0004e9a:	ff 75 d8             	pushl  -0x28(%ebp)
c0004e9d:	6a 00                	push   $0x0
c0004e9f:	68 18 08 01 c0       	push   $0xc0010818
c0004ea4:	e8 66 fd ff ff       	call   c0004c0f <InitDescriptor>
c0004ea9:	83 c4 10             	add    $0x10,%esp
c0004eac:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0004eaf:	0f b7 c0             	movzwl %ax,%eax
c0004eb2:	50                   	push   %eax
c0004eb3:	ff 75 d8             	pushl  -0x28(%ebp)
c0004eb6:	6a 00                	push   $0x0
c0004eb8:	68 20 08 01 c0       	push   $0xc0010820
c0004ebd:	e8 4d fd ff ff       	call   c0004c0f <InitDescriptor>
c0004ec2:	83 c4 10             	add    $0x10,%esp
c0004ec5:	90                   	nop
c0004ec6:	c9                   	leave  
c0004ec7:	c3                   	ret    

c0004ec8 <InitInterruptDesc>:
c0004ec8:	55                   	push   %ebp
c0004ec9:	89 e5                	mov    %esp,%ebp
c0004ecb:	83 ec 10             	sub    $0x10,%esp
c0004ece:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ed1:	c1 e0 03             	shl    $0x3,%eax
c0004ed4:	05 e0 16 01 c0       	add    $0xc00116e0,%eax
c0004ed9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004edc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004edf:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004ee3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ee6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004ee9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004eec:	89 c2                	mov    %eax,%edx
c0004eee:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ef1:	66 89 10             	mov    %dx,(%eax)
c0004ef4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ef7:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004efd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004f00:	c1 f8 10             	sar    $0x10,%eax
c0004f03:	89 c2                	mov    %eax,%edx
c0004f05:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f08:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004f0c:	8b 45 10             	mov    0x10(%ebp),%eax
c0004f0f:	c1 e0 04             	shl    $0x4,%eax
c0004f12:	89 c2                	mov    %eax,%edx
c0004f14:	8b 45 14             	mov    0x14(%ebp),%eax
c0004f17:	09 d0                	or     %edx,%eax
c0004f19:	89 c2                	mov    %eax,%edx
c0004f1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004f1e:	88 50 05             	mov    %dl,0x5(%eax)
c0004f21:	90                   	nop
c0004f22:	c9                   	leave  
c0004f23:	c3                   	ret    

c0004f24 <ReloadGDT>:
c0004f24:	55                   	push   %ebp
c0004f25:	89 e5                	mov    %esp,%ebp
c0004f27:	83 ec 28             	sub    $0x28,%esp
c0004f2a:	b8 c8 16 01 c0       	mov    $0xc00116c8,%eax
c0004f2f:	0f b7 00             	movzwl (%eax),%eax
c0004f32:	98                   	cwtl   
c0004f33:	ba ca 16 01 c0       	mov    $0xc00116ca,%edx
c0004f38:	8b 12                	mov    (%edx),%edx
c0004f3a:	83 ec 04             	sub    $0x4,%esp
c0004f3d:	50                   	push   %eax
c0004f3e:	52                   	push   %edx
c0004f3f:	68 c0 07 01 c0       	push   $0xc00107c0
c0004f44:	e8 74 74 00 00       	call   c000c3bd <Memcpy2>
c0004f49:	83 c4 10             	add    $0x10,%esp
c0004f4c:	c7 45 f0 c8 16 01 c0 	movl   $0xc00116c8,-0x10(%ebp)
c0004f53:	c7 45 ec ca 16 01 c0 	movl   $0xc00116ca,-0x14(%ebp)
c0004f5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004f5d:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004f62:	ba c0 07 01 c0       	mov    $0xc00107c0,%edx
c0004f67:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004f6a:	89 10                	mov    %edx,(%eax)
c0004f6c:	c7 45 e8 88 07 01 c0 	movl   $0xc0010788,-0x18(%ebp)
c0004f73:	c7 45 e4 8a 07 01 c0 	movl   $0xc001078a,-0x1c(%ebp)
c0004f7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004f7d:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004f82:	ba e0 16 01 c0       	mov    $0xc00116e0,%edx
c0004f87:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004f8a:	89 10                	mov    %edx,(%eax)
c0004f8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004f93:	eb 04                	jmp    c0004f99 <ReloadGDT+0x75>
c0004f95:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004f99:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004fa0:	7e f3                	jle    c0004f95 <ReloadGDT+0x71>
c0004fa2:	e8 09 36 00 00       	call   c00085b0 <init_internal_interrupt>
c0004fa7:	e8 ae fd ff ff       	call   c0004d5a <init_propt>
c0004fac:	90                   	nop
c0004fad:	c9                   	leave  
c0004fae:	c3                   	ret    

c0004faf <select_console>:
c0004faf:	55                   	push   %ebp
c0004fb0:	89 e5                	mov    %esp,%ebp
c0004fb2:	83 ec 18             	sub    $0x18,%esp
c0004fb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb8:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004fbb:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
c0004fbf:	75 27                	jne    c0004fe8 <select_console+0x39>
c0004fc1:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004fc5:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004fcb:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0004fd0:	a3 80 07 01 c0       	mov    %eax,0xc0010780
c0004fd5:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0004fda:	83 ec 0c             	sub    $0xc,%esp
c0004fdd:	50                   	push   %eax
c0004fde:	e8 08 00 00 00       	call   c0004feb <flush>
c0004fe3:	83 c4 10             	add    $0x10,%esp
c0004fe6:	eb 01                	jmp    c0004fe9 <select_console+0x3a>
c0004fe8:	90                   	nop
c0004fe9:	c9                   	leave  
c0004fea:	c3                   	ret    

c0004feb <flush>:
c0004feb:	55                   	push   %ebp
c0004fec:	89 e5                	mov    %esp,%ebp
c0004fee:	83 ec 08             	sub    $0x8,%esp
c0004ff1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ff4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ffa:	8b 40 0c             	mov    0xc(%eax),%eax
c0004ffd:	83 ec 0c             	sub    $0xc,%esp
c0005000:	50                   	push   %eax
c0005001:	e8 1e 00 00 00       	call   c0005024 <set_cursor>
c0005006:	83 c4 10             	add    $0x10,%esp
c0005009:	8b 45 08             	mov    0x8(%ebp),%eax
c000500c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005012:	8b 40 08             	mov    0x8(%eax),%eax
c0005015:	83 ec 0c             	sub    $0xc,%esp
c0005018:	50                   	push   %eax
c0005019:	e8 64 00 00 00       	call   c0005082 <set_console_start_video_addr>
c000501e:	83 c4 10             	add    $0x10,%esp
c0005021:	90                   	nop
c0005022:	c9                   	leave  
c0005023:	c3                   	ret    

c0005024 <set_cursor>:
c0005024:	55                   	push   %ebp
c0005025:	89 e5                	mov    %esp,%ebp
c0005027:	83 ec 08             	sub    $0x8,%esp
c000502a:	83 ec 08             	sub    $0x8,%esp
c000502d:	6a 0e                	push   $0xe
c000502f:	68 d4 03 00 00       	push   $0x3d4
c0005034:	e8 60 c7 ff ff       	call   c0001799 <out_byte>
c0005039:	83 c4 10             	add    $0x10,%esp
c000503c:	8b 45 08             	mov    0x8(%ebp),%eax
c000503f:	c1 e8 08             	shr    $0x8,%eax
c0005042:	0f b7 c0             	movzwl %ax,%eax
c0005045:	83 ec 08             	sub    $0x8,%esp
c0005048:	50                   	push   %eax
c0005049:	68 d5 03 00 00       	push   $0x3d5
c000504e:	e8 46 c7 ff ff       	call   c0001799 <out_byte>
c0005053:	83 c4 10             	add    $0x10,%esp
c0005056:	83 ec 08             	sub    $0x8,%esp
c0005059:	6a 0f                	push   $0xf
c000505b:	68 d4 03 00 00       	push   $0x3d4
c0005060:	e8 34 c7 ff ff       	call   c0001799 <out_byte>
c0005065:	83 c4 10             	add    $0x10,%esp
c0005068:	8b 45 08             	mov    0x8(%ebp),%eax
c000506b:	0f b7 c0             	movzwl %ax,%eax
c000506e:	83 ec 08             	sub    $0x8,%esp
c0005071:	50                   	push   %eax
c0005072:	68 d5 03 00 00       	push   $0x3d5
c0005077:	e8 1d c7 ff ff       	call   c0001799 <out_byte>
c000507c:	83 c4 10             	add    $0x10,%esp
c000507f:	90                   	nop
c0005080:	c9                   	leave  
c0005081:	c3                   	ret    

c0005082 <set_console_start_video_addr>:
c0005082:	55                   	push   %ebp
c0005083:	89 e5                	mov    %esp,%ebp
c0005085:	83 ec 08             	sub    $0x8,%esp
c0005088:	83 ec 08             	sub    $0x8,%esp
c000508b:	6a 0c                	push   $0xc
c000508d:	68 d4 03 00 00       	push   $0x3d4
c0005092:	e8 02 c7 ff ff       	call   c0001799 <out_byte>
c0005097:	83 c4 10             	add    $0x10,%esp
c000509a:	8b 45 08             	mov    0x8(%ebp),%eax
c000509d:	c1 e8 08             	shr    $0x8,%eax
c00050a0:	0f b7 c0             	movzwl %ax,%eax
c00050a3:	83 ec 08             	sub    $0x8,%esp
c00050a6:	50                   	push   %eax
c00050a7:	68 d5 03 00 00       	push   $0x3d5
c00050ac:	e8 e8 c6 ff ff       	call   c0001799 <out_byte>
c00050b1:	83 c4 10             	add    $0x10,%esp
c00050b4:	83 ec 08             	sub    $0x8,%esp
c00050b7:	6a 0d                	push   $0xd
c00050b9:	68 d4 03 00 00       	push   $0x3d4
c00050be:	e8 d6 c6 ff ff       	call   c0001799 <out_byte>
c00050c3:	83 c4 10             	add    $0x10,%esp
c00050c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00050c9:	0f b7 c0             	movzwl %ax,%eax
c00050cc:	83 ec 08             	sub    $0x8,%esp
c00050cf:	50                   	push   %eax
c00050d0:	68 d5 03 00 00       	push   $0x3d5
c00050d5:	e8 bf c6 ff ff       	call   c0001799 <out_byte>
c00050da:	83 c4 10             	add    $0x10,%esp
c00050dd:	90                   	nop
c00050de:	c9                   	leave  
c00050df:	c3                   	ret    

c00050e0 <put_key>:
c00050e0:	55                   	push   %ebp
c00050e1:	89 e5                	mov    %esp,%ebp
c00050e3:	83 ec 04             	sub    $0x4,%esp
c00050e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00050e9:	88 45 fc             	mov    %al,-0x4(%ebp)
c00050ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ef:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00050f5:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00050fa:	77 4d                	ja     c0005149 <put_key+0x69>
c00050fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ff:	8b 00                	mov    (%eax),%eax
c0005101:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0005105:	89 10                	mov    %edx,(%eax)
c0005107:	8b 45 08             	mov    0x8(%ebp),%eax
c000510a:	8b 00                	mov    (%eax),%eax
c000510c:	8d 50 04             	lea    0x4(%eax),%edx
c000510f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005112:	89 10                	mov    %edx,(%eax)
c0005114:	8b 45 08             	mov    0x8(%ebp),%eax
c0005117:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000511d:	8d 50 01             	lea    0x1(%eax),%edx
c0005120:	8b 45 08             	mov    0x8(%ebp),%eax
c0005123:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0005129:	8b 45 08             	mov    0x8(%ebp),%eax
c000512c:	8b 00                	mov    (%eax),%eax
c000512e:	8b 55 08             	mov    0x8(%ebp),%edx
c0005131:	83 c2 08             	add    $0x8,%edx
c0005134:	81 c2 00 08 00 00    	add    $0x800,%edx
c000513a:	39 d0                	cmp    %edx,%eax
c000513c:	75 0b                	jne    c0005149 <put_key+0x69>
c000513e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005141:	8d 50 08             	lea    0x8(%eax),%edx
c0005144:	8b 45 08             	mov    0x8(%ebp),%eax
c0005147:	89 10                	mov    %edx,(%eax)
c0005149:	90                   	nop
c000514a:	c9                   	leave  
c000514b:	c3                   	ret    

c000514c <scroll_up>:
c000514c:	55                   	push   %ebp
c000514d:	89 e5                	mov    %esp,%ebp
c000514f:	83 ec 08             	sub    $0x8,%esp
c0005152:	8b 45 08             	mov    0x8(%ebp),%eax
c0005155:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000515b:	8b 40 08             	mov    0x8(%eax),%eax
c000515e:	8d 50 b0             	lea    -0x50(%eax),%edx
c0005161:	8b 45 08             	mov    0x8(%ebp),%eax
c0005164:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000516a:	8b 00                	mov    (%eax),%eax
c000516c:	39 c2                	cmp    %eax,%edx
c000516e:	76 1b                	jbe    c000518b <scroll_up+0x3f>
c0005170:	8b 45 08             	mov    0x8(%ebp),%eax
c0005173:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005179:	8b 40 08             	mov    0x8(%eax),%eax
c000517c:	83 e8 50             	sub    $0x50,%eax
c000517f:	83 ec 0c             	sub    $0xc,%esp
c0005182:	50                   	push   %eax
c0005183:	e8 fa fe ff ff       	call   c0005082 <set_console_start_video_addr>
c0005188:	83 c4 10             	add    $0x10,%esp
c000518b:	90                   	nop
c000518c:	c9                   	leave  
c000518d:	c3                   	ret    

c000518e <scroll_down>:
c000518e:	55                   	push   %ebp
c000518f:	89 e5                	mov    %esp,%ebp
c0005191:	83 ec 08             	sub    $0x8,%esp
c0005194:	8b 45 08             	mov    0x8(%ebp),%eax
c0005197:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000519d:	8b 40 08             	mov    0x8(%eax),%eax
c00051a0:	8d 48 50             	lea    0x50(%eax),%ecx
c00051a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00051a6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051ac:	8b 10                	mov    (%eax),%edx
c00051ae:	8b 45 08             	mov    0x8(%ebp),%eax
c00051b1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051b7:	8b 40 04             	mov    0x4(%eax),%eax
c00051ba:	01 d0                	add    %edx,%eax
c00051bc:	39 c1                	cmp    %eax,%ecx
c00051be:	73 36                	jae    c00051f6 <scroll_down+0x68>
c00051c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00051c3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051c9:	8b 40 08             	mov    0x8(%eax),%eax
c00051cc:	83 c0 50             	add    $0x50,%eax
c00051cf:	83 ec 0c             	sub    $0xc,%esp
c00051d2:	50                   	push   %eax
c00051d3:	e8 aa fe ff ff       	call   c0005082 <set_console_start_video_addr>
c00051d8:	83 c4 10             	add    $0x10,%esp
c00051db:	8b 45 08             	mov    0x8(%ebp),%eax
c00051de:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051e4:	8b 50 08             	mov    0x8(%eax),%edx
c00051e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00051ea:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051f0:	83 c2 50             	add    $0x50,%edx
c00051f3:	89 50 08             	mov    %edx,0x8(%eax)
c00051f6:	90                   	nop
c00051f7:	c9                   	leave  
c00051f8:	c3                   	ret    

c00051f9 <out_char>:
c00051f9:	55                   	push   %ebp
c00051fa:	89 e5                	mov    %esp,%ebp
c00051fc:	83 ec 28             	sub    $0x28,%esp
c00051ff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005202:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0005205:	e8 6b 2a 00 00       	call   c0007c75 <intr_disable>
c000520a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000520d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005210:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005216:	8b 40 0c             	mov    0xc(%eax),%eax
c0005219:	05 00 c0 05 60       	add    $0x6005c000,%eax
c000521e:	01 c0                	add    %eax,%eax
c0005220:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005223:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0005227:	83 f8 08             	cmp    $0x8,%eax
c000522a:	0f 84 8d 00 00 00    	je     c00052bd <out_char+0xc4>
c0005230:	83 f8 0a             	cmp    $0xa,%eax
c0005233:	0f 85 c9 00 00 00    	jne    c0005302 <out_char+0x109>
c0005239:	8b 45 08             	mov    0x8(%ebp),%eax
c000523c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005242:	8b 50 0c             	mov    0xc(%eax),%edx
c0005245:	8b 45 08             	mov    0x8(%ebp),%eax
c0005248:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000524e:	8b 08                	mov    (%eax),%ecx
c0005250:	8b 45 08             	mov    0x8(%ebp),%eax
c0005253:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005259:	8b 40 04             	mov    0x4(%eax),%eax
c000525c:	01 c8                	add    %ecx,%eax
c000525e:	83 e8 50             	sub    $0x50,%eax
c0005261:	39 c2                	cmp    %eax,%edx
c0005263:	0f 83 f4 00 00 00    	jae    c000535d <out_char+0x164>
c0005269:	8b 45 08             	mov    0x8(%ebp),%eax
c000526c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005272:	8b 08                	mov    (%eax),%ecx
c0005274:	8b 45 08             	mov    0x8(%ebp),%eax
c0005277:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000527d:	8b 50 0c             	mov    0xc(%eax),%edx
c0005280:	8b 45 08             	mov    0x8(%ebp),%eax
c0005283:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005289:	8b 00                	mov    (%eax),%eax
c000528b:	29 c2                	sub    %eax,%edx
c000528d:	89 d0                	mov    %edx,%eax
c000528f:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0005294:	f7 e2                	mul    %edx
c0005296:	89 d0                	mov    %edx,%eax
c0005298:	c1 e8 06             	shr    $0x6,%eax
c000529b:	8d 50 01             	lea    0x1(%eax),%edx
c000529e:	89 d0                	mov    %edx,%eax
c00052a0:	c1 e0 02             	shl    $0x2,%eax
c00052a3:	01 d0                	add    %edx,%eax
c00052a5:	c1 e0 04             	shl    $0x4,%eax
c00052a8:	89 c2                	mov    %eax,%edx
c00052aa:	8b 45 08             	mov    0x8(%ebp),%eax
c00052ad:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052b3:	01 ca                	add    %ecx,%edx
c00052b5:	89 50 0c             	mov    %edx,0xc(%eax)
c00052b8:	e9 a0 00 00 00       	jmp    c000535d <out_char+0x164>
c00052bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00052c0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052c6:	8b 50 0c             	mov    0xc(%eax),%edx
c00052c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00052cc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052d2:	8b 00                	mov    (%eax),%eax
c00052d4:	39 c2                	cmp    %eax,%edx
c00052d6:	0f 86 84 00 00 00    	jbe    c0005360 <out_char+0x167>
c00052dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00052df:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00052e5:	8b 50 0c             	mov    0xc(%eax),%edx
c00052e8:	83 ea 01             	sub    $0x1,%edx
c00052eb:	89 50 0c             	mov    %edx,0xc(%eax)
c00052ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00052f1:	83 e8 02             	sub    $0x2,%eax
c00052f4:	c6 00 20             	movb   $0x20,(%eax)
c00052f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00052fa:	83 e8 01             	sub    $0x1,%eax
c00052fd:	c6 00 00             	movb   $0x0,(%eax)
c0005300:	eb 5e                	jmp    c0005360 <out_char+0x167>
c0005302:	8b 45 08             	mov    0x8(%ebp),%eax
c0005305:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000530b:	8b 40 0c             	mov    0xc(%eax),%eax
c000530e:	8d 48 01             	lea    0x1(%eax),%ecx
c0005311:	8b 45 08             	mov    0x8(%ebp),%eax
c0005314:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000531a:	8b 10                	mov    (%eax),%edx
c000531c:	8b 45 08             	mov    0x8(%ebp),%eax
c000531f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005325:	8b 40 04             	mov    0x4(%eax),%eax
c0005328:	01 d0                	add    %edx,%eax
c000532a:	39 c1                	cmp    %eax,%ecx
c000532c:	73 35                	jae    c0005363 <out_char+0x16a>
c000532e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005331:	8d 50 01             	lea    0x1(%eax),%edx
c0005334:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0005337:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c000533b:	88 10                	mov    %dl,(%eax)
c000533d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005340:	8d 50 01             	lea    0x1(%eax),%edx
c0005343:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0005346:	c6 00 0a             	movb   $0xa,(%eax)
c0005349:	8b 45 08             	mov    0x8(%ebp),%eax
c000534c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005352:	8b 50 0c             	mov    0xc(%eax),%edx
c0005355:	83 c2 01             	add    $0x1,%edx
c0005358:	89 50 0c             	mov    %edx,0xc(%eax)
c000535b:	eb 06                	jmp    c0005363 <out_char+0x16a>
c000535d:	90                   	nop
c000535e:	eb 14                	jmp    c0005374 <out_char+0x17b>
c0005360:	90                   	nop
c0005361:	eb 11                	jmp    c0005374 <out_char+0x17b>
c0005363:	90                   	nop
c0005364:	eb 0e                	jmp    c0005374 <out_char+0x17b>
c0005366:	83 ec 0c             	sub    $0xc,%esp
c0005369:	ff 75 08             	pushl  0x8(%ebp)
c000536c:	e8 1d fe ff ff       	call   c000518e <scroll_down>
c0005371:	83 c4 10             	add    $0x10,%esp
c0005374:	8b 45 08             	mov    0x8(%ebp),%eax
c0005377:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000537d:	8b 50 0c             	mov    0xc(%eax),%edx
c0005380:	8b 45 08             	mov    0x8(%ebp),%eax
c0005383:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005389:	8b 40 08             	mov    0x8(%eax),%eax
c000538c:	29 c2                	sub    %eax,%edx
c000538e:	89 d0                	mov    %edx,%eax
c0005390:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0005395:	77 cf                	ja     c0005366 <out_char+0x16d>
c0005397:	83 ec 0c             	sub    $0xc,%esp
c000539a:	ff 75 08             	pushl  0x8(%ebp)
c000539d:	e8 49 fc ff ff       	call   c0004feb <flush>
c00053a2:	83 c4 10             	add    $0x10,%esp
c00053a5:	83 ec 0c             	sub    $0xc,%esp
c00053a8:	ff 75 f4             	pushl  -0xc(%ebp)
c00053ab:	e8 ee 28 00 00       	call   c0007c9e <intr_set_status>
c00053b0:	83 c4 10             	add    $0x10,%esp
c00053b3:	90                   	nop
c00053b4:	c9                   	leave  
c00053b5:	c3                   	ret    

c00053b6 <tty_dev_read>:
c00053b6:	55                   	push   %ebp
c00053b7:	89 e5                	mov    %esp,%ebp
c00053b9:	83 ec 08             	sub    $0x8,%esp
c00053bc:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c00053c1:	39 45 08             	cmp    %eax,0x8(%ebp)
c00053c4:	75 17                	jne    c00053dd <tty_dev_read+0x27>
c00053c6:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c00053cb:	85 c0                	test   %eax,%eax
c00053cd:	7e 0e                	jle    c00053dd <tty_dev_read+0x27>
c00053cf:	83 ec 0c             	sub    $0xc,%esp
c00053d2:	ff 75 08             	pushl  0x8(%ebp)
c00053d5:	e8 79 07 00 00       	call   c0005b53 <keyboard_read>
c00053da:	83 c4 10             	add    $0x10,%esp
c00053dd:	90                   	nop
c00053de:	c9                   	leave  
c00053df:	c3                   	ret    

c00053e0 <tty_dev_write>:
c00053e0:	55                   	push   %ebp
c00053e1:	89 e5                	mov    %esp,%ebp
c00053e3:	83 ec 28             	sub    $0x28,%esp
c00053e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00053e9:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00053ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00053f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00053f9:	e9 88 01 00 00       	jmp    c0005586 <tty_dev_write+0x1a6>
c00053fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0005401:	8b 40 04             	mov    0x4(%eax),%eax
c0005404:	8b 00                	mov    (%eax),%eax
c0005406:	88 45 e7             	mov    %al,-0x19(%ebp)
c0005409:	8b 45 08             	mov    0x8(%ebp),%eax
c000540c:	8b 40 04             	mov    0x4(%eax),%eax
c000540f:	8d 50 04             	lea    0x4(%eax),%edx
c0005412:	8b 45 08             	mov    0x8(%ebp),%eax
c0005415:	89 50 04             	mov    %edx,0x4(%eax)
c0005418:	8b 45 08             	mov    0x8(%ebp),%eax
c000541b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005421:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005424:	8b 45 08             	mov    0x8(%ebp),%eax
c0005427:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c000542d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005430:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005436:	8d 50 01             	lea    0x1(%eax),%edx
c0005439:	8b 45 08             	mov    0x8(%ebp),%eax
c000543c:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005442:	8b 45 08             	mov    0x8(%ebp),%eax
c0005445:	8b 40 04             	mov    0x4(%eax),%eax
c0005448:	8b 55 08             	mov    0x8(%ebp),%edx
c000544b:	83 c2 08             	add    $0x8,%edx
c000544e:	81 c2 00 08 00 00    	add    $0x800,%edx
c0005454:	39 d0                	cmp    %edx,%eax
c0005456:	75 0c                	jne    c0005464 <tty_dev_write+0x84>
c0005458:	8b 45 08             	mov    0x8(%ebp),%eax
c000545b:	8d 50 08             	lea    0x8(%eax),%edx
c000545e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005461:	89 50 04             	mov    %edx,0x4(%eax)
c0005464:	8b 45 08             	mov    0x8(%ebp),%eax
c0005467:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000546d:	85 c0                	test   %eax,%eax
c000546f:	0f 84 11 01 00 00    	je     c0005586 <tty_dev_write+0x1a6>
c0005475:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005479:	3c 20                	cmp    $0x20,%al
c000547b:	76 08                	jbe    c0005485 <tty_dev_write+0xa5>
c000547d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005481:	3c 7e                	cmp    $0x7e,%al
c0005483:	76 10                	jbe    c0005495 <tty_dev_write+0xb5>
c0005485:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005489:	3c 20                	cmp    $0x20,%al
c000548b:	74 08                	je     c0005495 <tty_dev_write+0xb5>
c000548d:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005491:	84 c0                	test   %al,%al
c0005493:	75 58                	jne    c00054ed <tty_dev_write+0x10d>
c0005495:	8b 45 08             	mov    0x8(%ebp),%eax
c0005498:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c000549e:	8b 45 08             	mov    0x8(%ebp),%eax
c00054a1:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00054a7:	01 d0                	add    %edx,%eax
c00054a9:	83 e8 01             	sub    $0x1,%eax
c00054ac:	89 c2                	mov    %eax,%edx
c00054ae:	83 ec 04             	sub    $0x4,%esp
c00054b1:	6a 01                	push   $0x1
c00054b3:	8d 45 e7             	lea    -0x19(%ebp),%eax
c00054b6:	50                   	push   %eax
c00054b7:	52                   	push   %edx
c00054b8:	e8 1c 28 00 00       	call   c0007cd9 <Memcpy>
c00054bd:	83 c4 10             	add    $0x10,%esp
c00054c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00054c3:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00054c9:	8d 50 ff             	lea    -0x1(%eax),%edx
c00054cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00054cf:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00054d5:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00054d9:	0f b6 c0             	movzbl %al,%eax
c00054dc:	83 ec 08             	sub    $0x8,%esp
c00054df:	50                   	push   %eax
c00054e0:	ff 75 08             	pushl  0x8(%ebp)
c00054e3:	e8 11 fd ff ff       	call   c00051f9 <out_char>
c00054e8:	83 c4 10             	add    $0x10,%esp
c00054eb:	eb 7c                	jmp    c0005569 <tty_dev_write+0x189>
c00054ed:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00054f1:	3c 08                	cmp    $0x8,%al
c00054f3:	75 42                	jne    c0005537 <tty_dev_write+0x157>
c00054f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00054f8:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00054fe:	8d 50 01             	lea    0x1(%eax),%edx
c0005501:	8b 45 08             	mov    0x8(%ebp),%eax
c0005504:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000550a:	8b 45 08             	mov    0x8(%ebp),%eax
c000550d:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005513:	8d 50 fe             	lea    -0x2(%eax),%edx
c0005516:	8b 45 08             	mov    0x8(%ebp),%eax
c0005519:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000551f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005523:	0f b6 c0             	movzbl %al,%eax
c0005526:	83 ec 08             	sub    $0x8,%esp
c0005529:	50                   	push   %eax
c000552a:	ff 75 08             	pushl  0x8(%ebp)
c000552d:	e8 c7 fc ff ff       	call   c00051f9 <out_char>
c0005532:	83 c4 10             	add    $0x10,%esp
c0005535:	eb 32                	jmp    c0005569 <tty_dev_write+0x189>
c0005537:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000553b:	3c 0a                	cmp    $0xa,%al
c000553d:	75 2a                	jne    c0005569 <tty_dev_write+0x189>
c000553f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005543:	0f b6 c0             	movzbl %al,%eax
c0005546:	83 ec 08             	sub    $0x8,%esp
c0005549:	50                   	push   %eax
c000554a:	ff 75 08             	pushl  0x8(%ebp)
c000554d:	e8 a7 fc ff ff       	call   c00051f9 <out_char>
c0005552:	83 c4 10             	add    $0x10,%esp
c0005555:	8b 45 08             	mov    0x8(%ebp),%eax
c0005558:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c000555f:	00 00 00 
c0005562:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005569:	8b 45 08             	mov    0x8(%ebp),%eax
c000556c:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005572:	8b 45 08             	mov    0x8(%ebp),%eax
c0005575:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c000557b:	39 c2                	cmp    %eax,%edx
c000557d:	75 07                	jne    c0005586 <tty_dev_write+0x1a6>
c000557f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005586:	8b 45 08             	mov    0x8(%ebp),%eax
c0005589:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000558f:	85 c0                	test   %eax,%eax
c0005591:	0f 85 67 fe ff ff    	jne    c00053fe <tty_dev_write+0x1e>
c0005597:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000559b:	74 5c                	je     c00055f9 <tty_dev_write+0x219>
c000559d:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c00055a4:	83 ec 0c             	sub    $0xc,%esp
c00055a7:	ff 75 ec             	pushl  -0x14(%ebp)
c00055aa:	e8 f5 d3 ff ff       	call   c00029a4 <sys_malloc>
c00055af:	83 c4 10             	add    $0x10,%esp
c00055b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00055b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055b8:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c00055bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00055c2:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055cb:	89 50 50             	mov    %edx,0x50(%eax)
c00055ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00055d1:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c00055d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055da:	89 50 58             	mov    %edx,0x58(%eax)
c00055dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00055e0:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00055e6:	83 ec 04             	sub    $0x4,%esp
c00055e9:	50                   	push   %eax
c00055ea:	ff 75 e8             	pushl  -0x18(%ebp)
c00055ed:	6a 01                	push   $0x1
c00055ef:	e8 f6 4f 00 00       	call   c000a5ea <send_rec>
c00055f4:	83 c4 10             	add    $0x10,%esp
c00055f7:	eb 01                	jmp    c00055fa <tty_dev_write+0x21a>
c00055f9:	90                   	nop
c00055fa:	c9                   	leave  
c00055fb:	c3                   	ret    

c00055fc <tty_do_read>:
c00055fc:	55                   	push   %ebp
c00055fd:	89 e5                	mov    %esp,%ebp
c00055ff:	83 ec 08             	sub    $0x8,%esp
c0005602:	8b 45 08             	mov    0x8(%ebp),%eax
c0005605:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000560c:	00 00 00 
c000560f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005612:	8b 50 58             	mov    0x58(%eax),%edx
c0005615:	8b 45 08             	mov    0x8(%ebp),%eax
c0005618:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c000561e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005621:	8b 00                	mov    (%eax),%eax
c0005623:	89 c2                	mov    %eax,%edx
c0005625:	8b 45 08             	mov    0x8(%ebp),%eax
c0005628:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c000562e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005631:	8b 50 50             	mov    0x50(%eax),%edx
c0005634:	8b 45 08             	mov    0x8(%ebp),%eax
c0005637:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000563d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005640:	8b 50 50             	mov    0x50(%eax),%edx
c0005643:	8b 45 08             	mov    0x8(%ebp),%eax
c0005646:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c000564c:	8b 45 08             	mov    0x8(%ebp),%eax
c000564f:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c0005655:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005658:	8b 40 10             	mov    0x10(%eax),%eax
c000565b:	83 ec 08             	sub    $0x8,%esp
c000565e:	52                   	push   %edx
c000565f:	50                   	push   %eax
c0005660:	e8 64 19 00 00       	call   c0006fc9 <alloc_virtual_memory>
c0005665:	83 c4 10             	add    $0x10,%esp
c0005668:	89 c2                	mov    %eax,%edx
c000566a:	8b 45 08             	mov    0x8(%ebp),%eax
c000566d:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0005673:	8b 45 08             	mov    0x8(%ebp),%eax
c0005676:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000567c:	83 f8 02             	cmp    $0x2,%eax
c000567f:	74 1c                	je     c000569d <tty_do_read+0xa1>
c0005681:	68 39 01 00 00       	push   $0x139
c0005686:	68 b1 b9 00 c0       	push   $0xc000b9b1
c000568b:	68 b1 b9 00 c0       	push   $0xc000b9b1
c0005690:	68 bb b9 00 c0       	push   $0xc000b9bb
c0005695:	e8 24 46 00 00       	call   c0009cbe <assertion_failure>
c000569a:	83 c4 10             	add    $0x10,%esp
c000569d:	8b 45 0c             	mov    0xc(%ebp),%eax
c00056a0:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c00056a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00056aa:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00056b0:	83 ec 04             	sub    $0x4,%esp
c00056b3:	50                   	push   %eax
c00056b4:	ff 75 0c             	pushl  0xc(%ebp)
c00056b7:	6a 01                	push   $0x1
c00056b9:	e8 2c 4f 00 00       	call   c000a5ea <send_rec>
c00056be:	83 c4 10             	add    $0x10,%esp
c00056c1:	90                   	nop
c00056c2:	c9                   	leave  
c00056c3:	c3                   	ret    

c00056c4 <tty_do_write>:
c00056c4:	55                   	push   %ebp
c00056c5:	89 e5                	mov    %esp,%ebp
c00056c7:	53                   	push   %ebx
c00056c8:	83 ec 24             	sub    $0x24,%esp
c00056cb:	89 e0                	mov    %esp,%eax
c00056cd:	89 c3                	mov    %eax,%ebx
c00056cf:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c00056d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00056d9:	8d 50 ff             	lea    -0x1(%eax),%edx
c00056dc:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c00056df:	89 c2                	mov    %eax,%edx
c00056e1:	b8 10 00 00 00       	mov    $0x10,%eax
c00056e6:	83 e8 01             	sub    $0x1,%eax
c00056e9:	01 d0                	add    %edx,%eax
c00056eb:	b9 10 00 00 00       	mov    $0x10,%ecx
c00056f0:	ba 00 00 00 00       	mov    $0x0,%edx
c00056f5:	f7 f1                	div    %ecx
c00056f7:	6b c0 10             	imul   $0x10,%eax,%eax
c00056fa:	29 c4                	sub    %eax,%esp
c00056fc:	89 e0                	mov    %esp,%eax
c00056fe:	83 c0 00             	add    $0x0,%eax
c0005701:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005704:	83 ec 04             	sub    $0x4,%esp
c0005707:	ff 75 e8             	pushl  -0x18(%ebp)
c000570a:	6a 00                	push   $0x0
c000570c:	ff 75 e0             	pushl  -0x20(%ebp)
c000570f:	e8 d7 6c 00 00       	call   c000c3eb <Memset>
c0005714:	83 c4 10             	add    $0x10,%esp
c0005717:	8b 45 0c             	mov    0xc(%ebp),%eax
c000571a:	8b 40 50             	mov    0x50(%eax),%eax
c000571d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005720:	8b 45 08             	mov    0x8(%ebp),%eax
c0005723:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000572a:	00 00 00 
c000572d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005730:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005733:	8b 40 10             	mov    0x10(%eax),%eax
c0005736:	83 ec 08             	sub    $0x8,%esp
c0005739:	52                   	push   %edx
c000573a:	50                   	push   %eax
c000573b:	e8 89 18 00 00       	call   c0006fc9 <alloc_virtual_memory>
c0005740:	83 c4 10             	add    $0x10,%esp
c0005743:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005746:	eb 7e                	jmp    c00057c6 <tty_do_write+0x102>
c0005748:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000574b:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000574e:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005752:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005755:	8b 45 08             	mov    0x8(%ebp),%eax
c0005758:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000575e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005761:	01 d0                	add    %edx,%eax
c0005763:	83 ec 04             	sub    $0x4,%esp
c0005766:	ff 75 f0             	pushl  -0x10(%ebp)
c0005769:	50                   	push   %eax
c000576a:	ff 75 e0             	pushl  -0x20(%ebp)
c000576d:	e8 67 25 00 00       	call   c0007cd9 <Memcpy>
c0005772:	83 c4 10             	add    $0x10,%esp
c0005775:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005778:	29 45 ec             	sub    %eax,-0x14(%ebp)
c000577b:	8b 45 08             	mov    0x8(%ebp),%eax
c000577e:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005784:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005787:	01 c2                	add    %eax,%edx
c0005789:	8b 45 08             	mov    0x8(%ebp),%eax
c000578c:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005792:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005799:	eb 25                	jmp    c00057c0 <tty_do_write+0xfc>
c000579b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000579e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00057a1:	01 d0                	add    %edx,%eax
c00057a3:	0f b6 00             	movzbl (%eax),%eax
c00057a6:	0f b6 c0             	movzbl %al,%eax
c00057a9:	83 ec 08             	sub    $0x8,%esp
c00057ac:	50                   	push   %eax
c00057ad:	ff 75 08             	pushl  0x8(%ebp)
c00057b0:	e8 44 fa ff ff       	call   c00051f9 <out_char>
c00057b5:	83 c4 10             	add    $0x10,%esp
c00057b8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00057bc:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c00057c0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00057c4:	75 d5                	jne    c000579b <tty_do_write+0xd7>
c00057c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00057ca:	0f 85 78 ff ff ff    	jne    c0005748 <tty_do_write+0x84>
c00057d0:	83 ec 0c             	sub    $0xc,%esp
c00057d3:	6a 6c                	push   $0x6c
c00057d5:	e8 ca d1 ff ff       	call   c00029a4 <sys_malloc>
c00057da:	83 c4 10             	add    $0x10,%esp
c00057dd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00057e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00057e3:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00057ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00057ed:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00057f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00057f6:	89 50 48             	mov    %edx,0x48(%eax)
c00057f9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00057fc:	8b 00                	mov    (%eax),%eax
c00057fe:	83 ec 04             	sub    $0x4,%esp
c0005801:	50                   	push   %eax
c0005802:	ff 75 d8             	pushl  -0x28(%ebp)
c0005805:	6a 01                	push   $0x1
c0005807:	e8 de 4d 00 00       	call   c000a5ea <send_rec>
c000580c:	83 c4 10             	add    $0x10,%esp
c000580f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005812:	83 ec 08             	sub    $0x8,%esp
c0005815:	6a 6c                	push   $0x6c
c0005817:	50                   	push   %eax
c0005818:	e8 1b 1e 00 00       	call   c0007638 <sys_free>
c000581d:	83 c4 10             	add    $0x10,%esp
c0005820:	89 dc                	mov    %ebx,%esp
c0005822:	90                   	nop
c0005823:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005826:	c9                   	leave  
c0005827:	c3                   	ret    

c0005828 <init_screen>:
c0005828:	55                   	push   %ebp
c0005829:	89 e5                	mov    %esp,%ebp
c000582b:	83 ec 10             	sub    $0x10,%esp
c000582e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005831:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005836:	c1 f8 03             	sar    $0x3,%eax
c0005839:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c000583f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005842:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005845:	c1 e0 04             	shl    $0x4,%eax
c0005848:	8d 90 14 1f 01 c0    	lea    -0x3ffee0ec(%eax),%edx
c000584e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005851:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c0005857:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c000585e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005861:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005867:	8b 55 f8             	mov    -0x8(%ebp),%edx
c000586a:	89 50 04             	mov    %edx,0x4(%eax)
c000586d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005870:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005876:	8b 50 04             	mov    0x4(%eax),%edx
c0005879:	8b 45 08             	mov    0x8(%ebp),%eax
c000587c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005882:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c0005886:	89 10                	mov    %edx,(%eax)
c0005888:	8b 45 08             	mov    0x8(%ebp),%eax
c000588b:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c0005891:	8b 45 08             	mov    0x8(%ebp),%eax
c0005894:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000589a:	8b 12                	mov    (%edx),%edx
c000589c:	89 50 08             	mov    %edx,0x8(%eax)
c000589f:	8b 55 08             	mov    0x8(%ebp),%edx
c00058a2:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c00058a8:	8b 40 08             	mov    0x8(%eax),%eax
c00058ab:	89 42 0c             	mov    %eax,0xc(%edx)
c00058ae:	90                   	nop
c00058af:	c9                   	leave  
c00058b0:	c3                   	ret    

c00058b1 <init_tty>:
c00058b1:	55                   	push   %ebp
c00058b2:	89 e5                	mov    %esp,%ebp
c00058b4:	83 ec 18             	sub    $0x18,%esp
c00058b7:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c00058be:	e9 92 00 00 00       	jmp    c0005955 <init_tty+0xa4>
c00058c3:	83 ec 04             	sub    $0x4,%esp
c00058c6:	68 28 08 00 00       	push   $0x828
c00058cb:	6a 00                	push   $0x0
c00058cd:	ff 75 f4             	pushl  -0xc(%ebp)
c00058d0:	e8 16 6b 00 00       	call   c000c3eb <Memset>
c00058d5:	83 c4 10             	add    $0x10,%esp
c00058d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058db:	8d 50 08             	lea    0x8(%eax),%edx
c00058de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058e1:	89 50 04             	mov    %edx,0x4(%eax)
c00058e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058e7:	8b 50 04             	mov    0x4(%eax),%edx
c00058ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058ed:	89 10                	mov    %edx,(%eax)
c00058ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058f2:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c00058f9:	00 00 00 
c00058fc:	83 ec 0c             	sub    $0xc,%esp
c00058ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0005902:	e8 21 ff ff ff       	call   c0005828 <init_screen>
c0005907:	83 c4 10             	add    $0x10,%esp
c000590a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000590d:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005912:	85 c0                	test   %eax,%eax
c0005914:	7e 38                	jle    c000594e <init_tty+0x9d>
c0005916:	83 ec 08             	sub    $0x8,%esp
c0005919:	6a 23                	push   $0x23
c000591b:	ff 75 f4             	pushl  -0xc(%ebp)
c000591e:	e8 d6 f8 ff ff       	call   c00051f9 <out_char>
c0005923:	83 c4 10             	add    $0x10,%esp
c0005926:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005929:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c000592e:	2d 00 0e 01 c0       	sub    $0xc0010e00,%eax
c0005933:	c1 f8 03             	sar    $0x3,%eax
c0005936:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c000593c:	0f b6 c0             	movzbl %al,%eax
c000593f:	83 ec 08             	sub    $0x8,%esp
c0005942:	50                   	push   %eax
c0005943:	ff 75 f4             	pushl  -0xc(%ebp)
c0005946:	e8 ae f8 ff ff       	call   c00051f9 <out_char>
c000594b:	83 c4 10             	add    $0x10,%esp
c000594e:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005955:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c000595a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000595d:	0f 82 60 ff ff ff    	jb     c00058c3 <init_tty+0x12>
c0005963:	90                   	nop
c0005964:	c9                   	leave  
c0005965:	c3                   	ret    

c0005966 <TaskTTY>:
c0005966:	55                   	push   %ebp
c0005967:	89 e5                	mov    %esp,%ebp
c0005969:	83 ec 28             	sub    $0x28,%esp
c000596c:	e8 40 ff ff ff       	call   c00058b1 <init_tty>
c0005971:	83 ec 0c             	sub    $0xc,%esp
c0005974:	6a 00                	push   $0x0
c0005976:	e8 34 f6 ff ff       	call   c0004faf <select_console>
c000597b:	83 c4 10             	add    $0x10,%esp
c000597e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005985:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000598c:	83 ec 0c             	sub    $0xc,%esp
c000598f:	6a 6c                	push   $0x6c
c0005991:	e8 0e d0 ff ff       	call   c00029a4 <sys_malloc>
c0005996:	83 c4 10             	add    $0x10,%esp
c0005999:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000599c:	c7 45 f4 00 0e 01 c0 	movl   $0xc0010e00,-0xc(%ebp)
c00059a3:	eb 30                	jmp    c00059d5 <TaskTTY+0x6f>
c00059a5:	83 ec 0c             	sub    $0xc,%esp
c00059a8:	ff 75 f4             	pushl  -0xc(%ebp)
c00059ab:	e8 06 fa ff ff       	call   c00053b6 <tty_dev_read>
c00059b0:	83 c4 10             	add    $0x10,%esp
c00059b3:	83 ec 0c             	sub    $0xc,%esp
c00059b6:	ff 75 f4             	pushl  -0xc(%ebp)
c00059b9:	e8 22 fa ff ff       	call   c00053e0 <tty_dev_write>
c00059be:	83 c4 10             	add    $0x10,%esp
c00059c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00059c4:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00059ca:	85 c0                	test   %eax,%eax
c00059cc:	75 d7                	jne    c00059a5 <TaskTTY+0x3f>
c00059ce:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c00059d5:	b8 28 16 01 c0       	mov    $0xc0011628,%eax
c00059da:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00059dd:	72 c6                	jb     c00059a5 <TaskTTY+0x3f>
c00059df:	83 ec 04             	sub    $0x4,%esp
c00059e2:	6a 12                	push   $0x12
c00059e4:	ff 75 e8             	pushl  -0x18(%ebp)
c00059e7:	6a 02                	push   $0x2
c00059e9:	e8 fc 4b 00 00       	call   c000a5ea <send_rec>
c00059ee:	83 c4 10             	add    $0x10,%esp
c00059f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00059f4:	8b 40 68             	mov    0x68(%eax),%eax
c00059f7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00059fa:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005a01:	74 28                	je     c0005a2b <TaskTTY+0xc5>
c0005a03:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005a0a:	7f 0b                	jg     c0005a17 <TaskTTY+0xb1>
c0005a0c:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005a13:	74 4e                	je     c0005a63 <TaskTTY+0xfd>
c0005a15:	eb 4d                	jmp    c0005a64 <TaskTTY+0xfe>
c0005a17:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005a1e:	74 21                	je     c0005a41 <TaskTTY+0xdb>
c0005a20:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0005a27:	74 2e                	je     c0005a57 <TaskTTY+0xf1>
c0005a29:	eb 39                	jmp    c0005a64 <TaskTTY+0xfe>
c0005a2b:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005a30:	83 ec 08             	sub    $0x8,%esp
c0005a33:	ff 75 e8             	pushl  -0x18(%ebp)
c0005a36:	50                   	push   %eax
c0005a37:	e8 c0 fb ff ff       	call   c00055fc <tty_do_read>
c0005a3c:	83 c4 10             	add    $0x10,%esp
c0005a3f:	eb 23                	jmp    c0005a64 <TaskTTY+0xfe>
c0005a41:	a1 80 07 01 c0       	mov    0xc0010780,%eax
c0005a46:	83 ec 08             	sub    $0x8,%esp
c0005a49:	ff 75 e8             	pushl  -0x18(%ebp)
c0005a4c:	50                   	push   %eax
c0005a4d:	e8 72 fc ff ff       	call   c00056c4 <tty_do_write>
c0005a52:	83 c4 10             	add    $0x10,%esp
c0005a55:	eb 0d                	jmp    c0005a64 <TaskTTY+0xfe>
c0005a57:	c7 05 c0 16 01 c0 00 	movl   $0x0,0xc00116c0
c0005a5e:	00 00 00 
c0005a61:	eb 01                	jmp    c0005a64 <TaskTTY+0xfe>
c0005a63:	90                   	nop
c0005a64:	e9 33 ff ff ff       	jmp    c000599c <TaskTTY+0x36>

c0005a69 <keyboard_handler>:
c0005a69:	55                   	push   %ebp
c0005a6a:	89 e5                	mov    %esp,%ebp
c0005a6c:	83 ec 18             	sub    $0x18,%esp
c0005a6f:	c7 05 c0 16 01 c0 01 	movl   $0x1,0xc00116c0
c0005a76:	00 00 00 
c0005a79:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c0005a80:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005a85:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005a8a:	7f 5e                	jg     c0005aea <keyboard_handler+0x81>
c0005a8c:	e8 2a bd ff ff       	call   c00017bb <disable_int>
c0005a91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005a94:	0f b7 c0             	movzwl %ax,%eax
c0005a97:	83 ec 0c             	sub    $0xc,%esp
c0005a9a:	50                   	push   %eax
c0005a9b:	e8 ed bc ff ff       	call   c000178d <in_byte>
c0005aa0:	83 c4 10             	add    $0x10,%esp
c0005aa3:	88 45 f3             	mov    %al,-0xd(%ebp)
c0005aa6:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005aab:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005aaf:	88 10                	mov    %dl,(%eax)
c0005ab1:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005ab6:	83 c0 01             	add    $0x1,%eax
c0005ab9:	a3 e0 0b 01 c0       	mov    %eax,0xc0010be0
c0005abe:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005ac3:	83 c0 01             	add    $0x1,%eax
c0005ac6:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005acb:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c0005ad0:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005ad5:	39 d0                	cmp    %edx,%eax
c0005ad7:	72 0a                	jb     c0005ae3 <keyboard_handler+0x7a>
c0005ad9:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0005ae0:	0b 01 c0 
c0005ae3:	e8 d5 bc ff ff       	call   c00017bd <enable_int>
c0005ae8:	eb 01                	jmp    c0005aeb <keyboard_handler+0x82>
c0005aea:	90                   	nop
c0005aeb:	c9                   	leave  
c0005aec:	c3                   	ret    

c0005aed <read_from_keyboard_buf>:
c0005aed:	55                   	push   %ebp
c0005aee:	89 e5                	mov    %esp,%ebp
c0005af0:	83 ec 18             	sub    $0x18,%esp
c0005af3:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0005af7:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005afc:	85 c0                	test   %eax,%eax
c0005afe:	7f 06                	jg     c0005b06 <read_from_keyboard_buf+0x19>
c0005b00:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005b04:	eb 4b                	jmp    c0005b51 <read_from_keyboard_buf+0x64>
c0005b06:	e8 b0 bc ff ff       	call   c00017bb <disable_int>
c0005b0b:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005b10:	0f b6 00             	movzbl (%eax),%eax
c0005b13:	88 45 f7             	mov    %al,-0x9(%ebp)
c0005b16:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005b1b:	83 c0 01             	add    $0x1,%eax
c0005b1e:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0005b23:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005b28:	83 e8 01             	sub    $0x1,%eax
c0005b2b:	a3 e8 0b 01 c0       	mov    %eax,0xc0010be8
c0005b30:	a1 e4 0b 01 c0       	mov    0xc0010be4,%eax
c0005b35:	ba ec 0d 01 c0       	mov    $0xc0010dec,%edx
c0005b3a:	39 d0                	cmp    %edx,%eax
c0005b3c:	72 0a                	jb     c0005b48 <read_from_keyboard_buf+0x5b>
c0005b3e:	c7 05 e4 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be4
c0005b45:	0b 01 c0 
c0005b48:	e8 70 bc ff ff       	call   c00017bd <enable_int>
c0005b4d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005b51:	c9                   	leave  
c0005b52:	c3                   	ret    

c0005b53 <keyboard_read>:
c0005b53:	55                   	push   %ebp
c0005b54:	89 e5                	mov    %esp,%ebp
c0005b56:	83 ec 28             	sub    $0x28,%esp
c0005b59:	90                   	nop
c0005b5a:	a1 e8 0b 01 c0       	mov    0xc0010be8,%eax
c0005b5f:	85 c0                	test   %eax,%eax
c0005b61:	7e f7                	jle    c0005b5a <keyboard_read+0x7>
c0005b63:	e8 85 ff ff ff       	call   c0005aed <read_from_keyboard_buf>
c0005b68:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005b6b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005b72:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005b76:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005b7a:	75 5a                	jne    c0005bd6 <keyboard_read+0x83>
c0005b7c:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c0005b80:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0005b84:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0005b88:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005b8c:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c0005b90:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0005b94:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005b98:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0005b9f:	eb 20                	jmp    c0005bc1 <keyboard_read+0x6e>
c0005ba1:	e8 47 ff ff ff       	call   c0005aed <read_from_keyboard_buf>
c0005ba6:	89 c1                	mov    %eax,%ecx
c0005ba8:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005bab:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005bae:	01 d0                	add    %edx,%eax
c0005bb0:	0f b6 00             	movzbl (%eax),%eax
c0005bb3:	38 c1                	cmp    %al,%cl
c0005bb5:	74 06                	je     c0005bbd <keyboard_read+0x6a>
c0005bb7:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005bbb:	eb 0a                	jmp    c0005bc7 <keyboard_read+0x74>
c0005bbd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005bc1:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005bc5:	7e da                	jle    c0005ba1 <keyboard_read+0x4e>
c0005bc7:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005bcb:	74 68                	je     c0005c35 <keyboard_read+0xe2>
c0005bcd:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005bd4:	eb 5f                	jmp    c0005c35 <keyboard_read+0xe2>
c0005bd6:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005bda:	75 59                	jne    c0005c35 <keyboard_read+0xe2>
c0005bdc:	e8 0c ff ff ff       	call   c0005aed <read_from_keyboard_buf>
c0005be1:	3c 2a                	cmp    $0x2a,%al
c0005be3:	75 1d                	jne    c0005c02 <keyboard_read+0xaf>
c0005be5:	e8 03 ff ff ff       	call   c0005aed <read_from_keyboard_buf>
c0005bea:	3c e0                	cmp    $0xe0,%al
c0005bec:	75 14                	jne    c0005c02 <keyboard_read+0xaf>
c0005bee:	e8 fa fe ff ff       	call   c0005aed <read_from_keyboard_buf>
c0005bf3:	3c 37                	cmp    $0x37,%al
c0005bf5:	75 0b                	jne    c0005c02 <keyboard_read+0xaf>
c0005bf7:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005bfe:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005c02:	e8 e6 fe ff ff       	call   c0005aed <read_from_keyboard_buf>
c0005c07:	3c b7                	cmp    $0xb7,%al
c0005c09:	75 1d                	jne    c0005c28 <keyboard_read+0xd5>
c0005c0b:	e8 dd fe ff ff       	call   c0005aed <read_from_keyboard_buf>
c0005c10:	3c e0                	cmp    $0xe0,%al
c0005c12:	75 14                	jne    c0005c28 <keyboard_read+0xd5>
c0005c14:	e8 d4 fe ff ff       	call   c0005aed <read_from_keyboard_buf>
c0005c19:	3c aa                	cmp    $0xaa,%al
c0005c1b:	75 0b                	jne    c0005c28 <keyboard_read+0xd5>
c0005c1d:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005c24:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005c28:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005c2c:	75 07                	jne    c0005c35 <keyboard_read+0xe2>
c0005c2e:	c6 05 84 07 01 c0 01 	movb   $0x1,0xc0010784
c0005c35:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005c3c:	0f 84 8d 00 00 00    	je     c0005ccf <keyboard_read+0x17c>
c0005c42:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005c49:	0f 84 80 00 00 00    	je     c0005ccf <keyboard_read+0x17c>
c0005c4f:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005c53:	0f 94 c2             	sete   %dl
c0005c56:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005c5a:	0f 94 c0             	sete   %al
c0005c5d:	09 d0                	or     %edx,%eax
c0005c5f:	84 c0                	test   %al,%al
c0005c61:	74 07                	je     c0005c6a <keyboard_read+0x117>
c0005c63:	c6 05 c4 16 01 c0 01 	movb   $0x1,0xc00116c4
c0005c6a:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005c6e:	f7 d0                	not    %eax
c0005c70:	c0 e8 07             	shr    $0x7,%al
c0005c73:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005c76:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005c7a:	74 53                	je     c0005ccf <keyboard_read+0x17c>
c0005c7c:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005c80:	74 4d                	je     c0005ccf <keyboard_read+0x17c>
c0005c82:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005c86:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005c8d:	3c 01                	cmp    $0x1,%al
c0005c8f:	75 04                	jne    c0005c95 <keyboard_read+0x142>
c0005c91:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005c95:	0f b6 05 84 07 01 c0 	movzbl 0xc0010784,%eax
c0005c9c:	84 c0                	test   %al,%al
c0005c9e:	74 04                	je     c0005ca4 <keyboard_read+0x151>
c0005ca0:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005ca4:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005ca8:	89 d0                	mov    %edx,%eax
c0005caa:	01 c0                	add    %eax,%eax
c0005cac:	01 c2                	add    %eax,%edx
c0005cae:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005cb2:	01 d0                	add    %edx,%eax
c0005cb4:	8b 04 85 60 f1 00 c0 	mov    -0x3fff0ea0(,%eax,4),%eax
c0005cbb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005cbe:	83 ec 08             	sub    $0x8,%esp
c0005cc1:	ff 75 f4             	pushl  -0xc(%ebp)
c0005cc4:	ff 75 08             	pushl  0x8(%ebp)
c0005cc7:	e8 1a 00 00 00       	call   c0005ce6 <in_process>
c0005ccc:	83 c4 10             	add    $0x10,%esp
c0005ccf:	90                   	nop
c0005cd0:	c9                   	leave  
c0005cd1:	c3                   	ret    

c0005cd2 <init_keyboard_handler>:
c0005cd2:	55                   	push   %ebp
c0005cd3:	89 e5                	mov    %esp,%ebp
c0005cd5:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005cdc:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005ce3:	90                   	nop
c0005ce4:	5d                   	pop    %ebp
c0005ce5:	c3                   	ret    

c0005ce6 <in_process>:
c0005ce6:	55                   	push   %ebp
c0005ce7:	89 e5                	mov    %esp,%ebp
c0005ce9:	83 ec 18             	sub    $0x18,%esp
c0005cec:	83 ec 04             	sub    $0x4,%esp
c0005cef:	6a 02                	push   $0x2
c0005cf1:	6a 00                	push   $0x0
c0005cf3:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005cf6:	50                   	push   %eax
c0005cf7:	e8 ef 66 00 00       	call   c000c3eb <Memset>
c0005cfc:	83 c4 10             	add    $0x10,%esp
c0005cff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005d02:	25 00 01 00 00       	and    $0x100,%eax
c0005d07:	85 c0                	test   %eax,%eax
c0005d09:	75 28                	jne    c0005d33 <in_process+0x4d>
c0005d0b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005d0e:	0f b6 c0             	movzbl %al,%eax
c0005d11:	83 ec 08             	sub    $0x8,%esp
c0005d14:	50                   	push   %eax
c0005d15:	ff 75 08             	pushl  0x8(%ebp)
c0005d18:	e8 c3 f3 ff ff       	call   c00050e0 <put_key>
c0005d1d:	83 c4 10             	add    $0x10,%esp
c0005d20:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005d27:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005d2e:	e9 42 01 00 00       	jmp    c0005e75 <in_process+0x18f>
c0005d33:	0f b6 05 c4 16 01 c0 	movzbl 0xc00116c4,%eax
c0005d3a:	84 c0                	test   %al,%al
c0005d3c:	0f 84 a9 00 00 00    	je     c0005deb <in_process+0x105>
c0005d42:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005d46:	0f 84 9f 00 00 00    	je     c0005deb <in_process+0x105>
c0005d4c:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005d50:	0f 84 95 00 00 00    	je     c0005deb <in_process+0x105>
c0005d56:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005d5d:	74 64                	je     c0005dc3 <in_process+0xdd>
c0005d5f:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005d66:	77 0b                	ja     c0005d73 <in_process+0x8d>
c0005d68:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005d6f:	74 64                	je     c0005dd5 <in_process+0xef>
c0005d71:	eb 73                	jmp    c0005de6 <in_process+0x100>
c0005d73:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005d7a:	74 0b                	je     c0005d87 <in_process+0xa1>
c0005d7c:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005d83:	74 20                	je     c0005da5 <in_process+0xbf>
c0005d85:	eb 5f                	jmp    c0005de6 <in_process+0x100>
c0005d87:	83 ec 0c             	sub    $0xc,%esp
c0005d8a:	ff 75 08             	pushl  0x8(%ebp)
c0005d8d:	e8 ba f3 ff ff       	call   c000514c <scroll_up>
c0005d92:	83 c4 10             	add    $0x10,%esp
c0005d95:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005d9c:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005da3:	eb 41                	jmp    c0005de6 <in_process+0x100>
c0005da5:	83 ec 0c             	sub    $0xc,%esp
c0005da8:	ff 75 08             	pushl  0x8(%ebp)
c0005dab:	e8 de f3 ff ff       	call   c000518e <scroll_down>
c0005db0:	83 c4 10             	add    $0x10,%esp
c0005db3:	c6 05 c4 16 01 c0 00 	movb   $0x0,0xc00116c4
c0005dba:	c6 05 84 07 01 c0 00 	movb   $0x0,0xc0010784
c0005dc1:	eb 23                	jmp    c0005de6 <in_process+0x100>
c0005dc3:	83 ec 08             	sub    $0x8,%esp
c0005dc6:	6a 0a                	push   $0xa
c0005dc8:	ff 75 08             	pushl  0x8(%ebp)
c0005dcb:	e8 29 f4 ff ff       	call   c00051f9 <out_char>
c0005dd0:	83 c4 10             	add    $0x10,%esp
c0005dd3:	eb 11                	jmp    c0005de6 <in_process+0x100>
c0005dd5:	83 ec 08             	sub    $0x8,%esp
c0005dd8:	6a 08                	push   $0x8
c0005dda:	ff 75 08             	pushl  0x8(%ebp)
c0005ddd:	e8 17 f4 ff ff       	call   c00051f9 <out_char>
c0005de2:	83 c4 10             	add    $0x10,%esp
c0005de5:	90                   	nop
c0005de6:	e9 8a 00 00 00       	jmp    c0005e75 <in_process+0x18f>
c0005deb:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005df2:	74 55                	je     c0005e49 <in_process+0x163>
c0005df4:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005dfb:	77 14                	ja     c0005e11 <in_process+0x12b>
c0005dfd:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005e04:	74 31                	je     c0005e37 <in_process+0x151>
c0005e06:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005e0d:	74 16                	je     c0005e25 <in_process+0x13f>
c0005e0f:	eb 64                	jmp    c0005e75 <in_process+0x18f>
c0005e11:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005e18:	74 3e                	je     c0005e58 <in_process+0x172>
c0005e1a:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005e21:	74 44                	je     c0005e67 <in_process+0x181>
c0005e23:	eb 50                	jmp    c0005e75 <in_process+0x18f>
c0005e25:	83 ec 08             	sub    $0x8,%esp
c0005e28:	6a 0a                	push   $0xa
c0005e2a:	ff 75 08             	pushl  0x8(%ebp)
c0005e2d:	e8 ae f2 ff ff       	call   c00050e0 <put_key>
c0005e32:	83 c4 10             	add    $0x10,%esp
c0005e35:	eb 3e                	jmp    c0005e75 <in_process+0x18f>
c0005e37:	83 ec 08             	sub    $0x8,%esp
c0005e3a:	6a 08                	push   $0x8
c0005e3c:	ff 75 08             	pushl  0x8(%ebp)
c0005e3f:	e8 9c f2 ff ff       	call   c00050e0 <put_key>
c0005e44:	83 c4 10             	add    $0x10,%esp
c0005e47:	eb 2c                	jmp    c0005e75 <in_process+0x18f>
c0005e49:	83 ec 0c             	sub    $0xc,%esp
c0005e4c:	6a 00                	push   $0x0
c0005e4e:	e8 5c f1 ff ff       	call   c0004faf <select_console>
c0005e53:	83 c4 10             	add    $0x10,%esp
c0005e56:	eb 1d                	jmp    c0005e75 <in_process+0x18f>
c0005e58:	83 ec 0c             	sub    $0xc,%esp
c0005e5b:	6a 01                	push   $0x1
c0005e5d:	e8 4d f1 ff ff       	call   c0004faf <select_console>
c0005e62:	83 c4 10             	add    $0x10,%esp
c0005e65:	eb 0e                	jmp    c0005e75 <in_process+0x18f>
c0005e67:	83 ec 0c             	sub    $0xc,%esp
c0005e6a:	6a 02                	push   $0x2
c0005e6c:	e8 3e f1 ff ff       	call   c0004faf <select_console>
c0005e71:	83 c4 10             	add    $0x10,%esp
c0005e74:	90                   	nop
c0005e75:	90                   	nop
c0005e76:	c9                   	leave  
c0005e77:	c3                   	ret    

c0005e78 <open>:
c0005e78:	55                   	push   %ebp
c0005e79:	89 e5                	mov    %esp,%ebp
c0005e7b:	83 ec 18             	sub    $0x18,%esp
c0005e7e:	83 ec 0c             	sub    $0xc,%esp
c0005e81:	6a 6c                	push   $0x6c
c0005e83:	e8 1c cb ff ff       	call   c00029a4 <sys_malloc>
c0005e88:	83 c4 10             	add    $0x10,%esp
c0005e8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005e8e:	83 ec 04             	sub    $0x4,%esp
c0005e91:	6a 6c                	push   $0x6c
c0005e93:	6a 00                	push   $0x0
c0005e95:	ff 75 f4             	pushl  -0xc(%ebp)
c0005e98:	e8 4e 65 00 00       	call   c000c3eb <Memset>
c0005e9d:	83 c4 10             	add    $0x10,%esp
c0005ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ea3:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0005eaa:	83 ec 0c             	sub    $0xc,%esp
c0005ead:	ff 75 08             	pushl  0x8(%ebp)
c0005eb0:	e8 db 11 00 00       	call   c0007090 <get_physical_address>
c0005eb5:	83 c4 10             	add    $0x10,%esp
c0005eb8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005ebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ebe:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005ec1:	89 50 34             	mov    %edx,0x34(%eax)
c0005ec4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005ec7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005eca:	89 50 64             	mov    %edx,0x64(%eax)
c0005ecd:	83 ec 0c             	sub    $0xc,%esp
c0005ed0:	ff 75 08             	pushl  0x8(%ebp)
c0005ed3:	e8 4c 65 00 00       	call   c000c424 <Strlen>
c0005ed8:	83 c4 10             	add    $0x10,%esp
c0005edb:	89 c2                	mov    %eax,%edx
c0005edd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ee0:	89 50 30             	mov    %edx,0x30(%eax)
c0005ee3:	83 ec 04             	sub    $0x4,%esp
c0005ee6:	6a 02                	push   $0x2
c0005ee8:	ff 75 f4             	pushl  -0xc(%ebp)
c0005eeb:	6a 03                	push   $0x3
c0005eed:	e8 f8 46 00 00       	call   c000a5ea <send_rec>
c0005ef2:	83 c4 10             	add    $0x10,%esp
c0005ef5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ef8:	8b 40 40             	mov    0x40(%eax),%eax
c0005efb:	c9                   	leave  
c0005efc:	c3                   	ret    

c0005efd <read>:
c0005efd:	55                   	push   %ebp
c0005efe:	89 e5                	mov    %esp,%ebp
c0005f00:	83 ec 18             	sub    $0x18,%esp
c0005f03:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005f0a:	83 ec 0c             	sub    $0xc,%esp
c0005f0d:	ff 75 f4             	pushl  -0xc(%ebp)
c0005f10:	e8 8f ca ff ff       	call   c00029a4 <sys_malloc>
c0005f15:	83 c4 10             	add    $0x10,%esp
c0005f18:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f1b:	83 ec 0c             	sub    $0xc,%esp
c0005f1e:	ff 75 0c             	pushl  0xc(%ebp)
c0005f21:	e8 6a 11 00 00       	call   c0007090 <get_physical_address>
c0005f26:	83 c4 10             	add    $0x10,%esp
c0005f29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005f2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f2f:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0005f36:	8b 55 08             	mov    0x8(%ebp),%edx
c0005f39:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f3c:	89 50 40             	mov    %edx,0x40(%eax)
c0005f3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f42:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005f45:	89 50 10             	mov    %edx,0x10(%eax)
c0005f48:	8b 55 10             	mov    0x10(%ebp),%edx
c0005f4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f4e:	89 50 50             	mov    %edx,0x50(%eax)
c0005f51:	83 ec 04             	sub    $0x4,%esp
c0005f54:	6a 02                	push   $0x2
c0005f56:	ff 75 f0             	pushl  -0x10(%ebp)
c0005f59:	6a 03                	push   $0x3
c0005f5b:	e8 8a 46 00 00       	call   c000a5ea <send_rec>
c0005f60:	83 c4 10             	add    $0x10,%esp
c0005f63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f66:	8b 40 50             	mov    0x50(%eax),%eax
c0005f69:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005f6c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005f6f:	c9                   	leave  
c0005f70:	c3                   	ret    

c0005f71 <write>:
c0005f71:	55                   	push   %ebp
c0005f72:	89 e5                	mov    %esp,%ebp
c0005f74:	83 ec 18             	sub    $0x18,%esp
c0005f77:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005f7e:	83 ec 0c             	sub    $0xc,%esp
c0005f81:	ff 75 f4             	pushl  -0xc(%ebp)
c0005f84:	e8 1b ca ff ff       	call   c00029a4 <sys_malloc>
c0005f89:	83 c4 10             	add    $0x10,%esp
c0005f8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f8f:	83 ec 0c             	sub    $0xc,%esp
c0005f92:	ff 75 0c             	pushl  0xc(%ebp)
c0005f95:	e8 f6 10 00 00       	call   c0007090 <get_physical_address>
c0005f9a:	83 c4 10             	add    $0x10,%esp
c0005f9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005fa0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fa3:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0005faa:	8b 55 08             	mov    0x8(%ebp),%edx
c0005fad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fb0:	89 50 40             	mov    %edx,0x40(%eax)
c0005fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fb6:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005fb9:	89 50 10             	mov    %edx,0x10(%eax)
c0005fbc:	8b 55 10             	mov    0x10(%ebp),%edx
c0005fbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fc2:	89 50 50             	mov    %edx,0x50(%eax)
c0005fc5:	83 ec 04             	sub    $0x4,%esp
c0005fc8:	6a 02                	push   $0x2
c0005fca:	ff 75 f0             	pushl  -0x10(%ebp)
c0005fcd:	6a 03                	push   $0x3
c0005fcf:	e8 16 46 00 00       	call   c000a5ea <send_rec>
c0005fd4:	83 c4 10             	add    $0x10,%esp
c0005fd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fda:	8b 40 50             	mov    0x50(%eax),%eax
c0005fdd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005fe0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005fe3:	c9                   	leave  
c0005fe4:	c3                   	ret    

c0005fe5 <close>:
c0005fe5:	55                   	push   %ebp
c0005fe6:	89 e5                	mov    %esp,%ebp
c0005fe8:	83 ec 78             	sub    $0x78,%esp
c0005feb:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005ff2:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ff5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005ff8:	83 ec 04             	sub    $0x4,%esp
c0005ffb:	6a 02                	push   $0x2
c0005ffd:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006000:	50                   	push   %eax
c0006001:	6a 03                	push   $0x3
c0006003:	e8 e2 45 00 00       	call   c000a5ea <send_rec>
c0006008:	83 c4 10             	add    $0x10,%esp
c000600b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000600e:	83 f8 65             	cmp    $0x65,%eax
c0006011:	74 19                	je     c000602c <close+0x47>
c0006013:	6a 13                	push   $0x13
c0006015:	68 d3 b9 00 c0       	push   $0xc000b9d3
c000601a:	68 d3 b9 00 c0       	push   $0xc000b9d3
c000601f:	68 df b9 00 c0       	push   $0xc000b9df
c0006024:	e8 95 3c 00 00       	call   c0009cbe <assertion_failure>
c0006029:	83 c4 10             	add    $0x10,%esp
c000602c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000602f:	c9                   	leave  
c0006030:	c3                   	ret    

c0006031 <wait>:
c0006031:	55                   	push   %ebp
c0006032:	89 e5                	mov    %esp,%ebp
c0006034:	83 ec 78             	sub    $0x78,%esp
c0006037:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c000603e:	83 ec 04             	sub    $0x4,%esp
c0006041:	6a 01                	push   $0x1
c0006043:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006046:	50                   	push   %eax
c0006047:	6a 03                	push   $0x3
c0006049:	e8 9c 45 00 00       	call   c000a5ea <send_rec>
c000604e:	83 c4 10             	add    $0x10,%esp
c0006051:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006054:	89 c2                	mov    %eax,%edx
c0006056:	8b 45 08             	mov    0x8(%ebp),%eax
c0006059:	89 10                	mov    %edx,(%eax)
c000605b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000605e:	83 f8 21             	cmp    $0x21,%eax
c0006061:	74 05                	je     c0006068 <wait+0x37>
c0006063:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006066:	eb 05                	jmp    c000606d <wait+0x3c>
c0006068:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000606d:	c9                   	leave  
c000606e:	c3                   	ret    

c000606f <exit>:
c000606f:	55                   	push   %ebp
c0006070:	89 e5                	mov    %esp,%ebp
c0006072:	83 ec 78             	sub    $0x78,%esp
c0006075:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c000607c:	8b 45 08             	mov    0x8(%ebp),%eax
c000607f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006082:	83 ec 04             	sub    $0x4,%esp
c0006085:	6a 01                	push   $0x1
c0006087:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000608a:	50                   	push   %eax
c000608b:	6a 03                	push   $0x3
c000608d:	e8 58 45 00 00       	call   c000a5ea <send_rec>
c0006092:	83 c4 10             	add    $0x10,%esp
c0006095:	90                   	nop
c0006096:	c9                   	leave  
c0006097:	c3                   	ret    

c0006098 <fork>:
c0006098:	55                   	push   %ebp
c0006099:	89 e5                	mov    %esp,%ebp
c000609b:	83 ec 78             	sub    $0x78,%esp
c000609e:	83 ec 04             	sub    $0x4,%esp
c00060a1:	6a 6c                	push   $0x6c
c00060a3:	6a 00                	push   $0x0
c00060a5:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00060a8:	50                   	push   %eax
c00060a9:	e8 3d 63 00 00       	call   c000c3eb <Memset>
c00060ae:	83 c4 10             	add    $0x10,%esp
c00060b1:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00060b8:	83 ec 04             	sub    $0x4,%esp
c00060bb:	6a 01                	push   $0x1
c00060bd:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00060c0:	50                   	push   %eax
c00060c1:	6a 03                	push   $0x3
c00060c3:	e8 22 45 00 00       	call   c000a5ea <send_rec>
c00060c8:	83 c4 10             	add    $0x10,%esp
c00060cb:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00060d2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00060d5:	85 c0                	test   %eax,%eax
c00060d7:	74 19                	je     c00060f2 <fork+0x5a>
c00060d9:	6a 14                	push   $0x14
c00060db:	68 f7 b9 00 c0       	push   $0xc000b9f7
c00060e0:	68 f7 b9 00 c0       	push   $0xc000b9f7
c00060e5:	68 02 ba 00 c0       	push   $0xc000ba02
c00060ea:	e8 cf 3b 00 00       	call   c0009cbe <assertion_failure>
c00060ef:	83 c4 10             	add    $0x10,%esp
c00060f2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00060f5:	c9                   	leave  
c00060f6:	c3                   	ret    

c00060f7 <getpid>:
c00060f7:	55                   	push   %ebp
c00060f8:	89 e5                	mov    %esp,%ebp
c00060fa:	83 ec 78             	sub    $0x78,%esp
c00060fd:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0006104:	83 ec 04             	sub    $0x4,%esp
c0006107:	6a 05                	push   $0x5
c0006109:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000610c:	50                   	push   %eax
c000610d:	6a 03                	push   $0x3
c000610f:	e8 d6 44 00 00       	call   c000a5ea <send_rec>
c0006114:	83 c4 10             	add    $0x10,%esp
c0006117:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000611a:	c9                   	leave  
c000611b:	c3                   	ret    

c000611c <exec>:
c000611c:	55                   	push   %ebp
c000611d:	89 e5                	mov    %esp,%ebp
c000611f:	83 ec 78             	sub    $0x78,%esp
c0006122:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0006129:	8b 45 08             	mov    0x8(%ebp),%eax
c000612c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000612f:	83 ec 0c             	sub    $0xc,%esp
c0006132:	ff 75 08             	pushl  0x8(%ebp)
c0006135:	e8 ea 62 00 00       	call   c000c424 <Strlen>
c000613a:	83 c4 10             	add    $0x10,%esp
c000613d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006140:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0006147:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c000614e:	83 ec 04             	sub    $0x4,%esp
c0006151:	6a 01                	push   $0x1
c0006153:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006156:	50                   	push   %eax
c0006157:	6a 03                	push   $0x3
c0006159:	e8 8c 44 00 00       	call   c000a5ea <send_rec>
c000615e:	83 c4 10             	add    $0x10,%esp
c0006161:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006164:	83 f8 65             	cmp    $0x65,%eax
c0006167:	74 19                	je     c0006182 <exec+0x66>
c0006169:	6a 19                	push   $0x19
c000616b:	68 12 ba 00 c0       	push   $0xc000ba12
c0006170:	68 12 ba 00 c0       	push   $0xc000ba12
c0006175:	68 1d ba 00 c0       	push   $0xc000ba1d
c000617a:	e8 3f 3b 00 00       	call   c0009cbe <assertion_failure>
c000617f:	83 c4 10             	add    $0x10,%esp
c0006182:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006185:	c9                   	leave  
c0006186:	c3                   	ret    

c0006187 <execv>:
c0006187:	55                   	push   %ebp
c0006188:	89 e5                	mov    %esp,%ebp
c000618a:	57                   	push   %edi
c000618b:	81 ec c4 04 00 00    	sub    $0x4c4,%esp
c0006191:	83 ec 04             	sub    $0x4,%esp
c0006194:	68 00 04 00 00       	push   $0x400
c0006199:	6a 00                	push   $0x0
c000619b:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
c00061a1:	50                   	push   %eax
c00061a2:	e8 44 62 00 00       	call   c000c3eb <Memset>
c00061a7:	83 c4 10             	add    $0x10,%esp
c00061aa:	8b 45 0c             	mov    0xc(%ebp),%eax
c00061ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00061b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00061b7:	eb 23                	jmp    c00061dc <execv+0x55>
c00061b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061bc:	8b 00                	mov    (%eax),%eax
c00061be:	83 ec 08             	sub    $0x8,%esp
c00061c1:	50                   	push   %eax
c00061c2:	68 35 ba 00 c0       	push   $0xc000ba35
c00061c7:	e8 95 37 00 00       	call   c0009961 <Printf>
c00061cc:	83 c4 10             	add    $0x10,%esp
c00061cf:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c00061d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061d6:	83 c0 04             	add    $0x4,%eax
c00061d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061df:	8b 00                	mov    (%eax),%eax
c00061e1:	85 c0                	test   %eax,%eax
c00061e3:	75 d4                	jne    c00061b9 <execv+0x32>
c00061e5:	8d 95 d8 fb ff ff    	lea    -0x428(%ebp),%edx
c00061eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061ee:	01 d0                	add    %edx,%eax
c00061f0:	c6 00 00             	movb   $0x0,(%eax)
c00061f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061f6:	83 c0 04             	add    $0x4,%eax
c00061f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061fc:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
c0006202:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006205:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006208:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000620b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006212:	eb 64                	jmp    c0006278 <execv+0xf1>
c0006214:	8d 95 d8 fb ff ff    	lea    -0x428(%ebp),%edx
c000621a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000621d:	01 c2                	add    %eax,%edx
c000621f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006222:	89 10                	mov    %edx,(%eax)
c0006224:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006227:	8b 00                	mov    (%eax),%eax
c0006229:	8d 8d d8 fb ff ff    	lea    -0x428(%ebp),%ecx
c000622f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006232:	01 ca                	add    %ecx,%edx
c0006234:	83 ec 08             	sub    $0x8,%esp
c0006237:	50                   	push   %eax
c0006238:	52                   	push   %edx
c0006239:	e8 cc 61 00 00       	call   c000c40a <Strcpy>
c000623e:	83 c4 10             	add    $0x10,%esp
c0006241:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006244:	8b 00                	mov    (%eax),%eax
c0006246:	83 ec 0c             	sub    $0xc,%esp
c0006249:	50                   	push   %eax
c000624a:	e8 d5 61 00 00       	call   c000c424 <Strlen>
c000624f:	83 c4 10             	add    $0x10,%esp
c0006252:	01 45 f0             	add    %eax,-0x10(%ebp)
c0006255:	8d 95 d8 fb ff ff    	lea    -0x428(%ebp),%edx
c000625b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000625e:	01 d0                	add    %edx,%eax
c0006260:	c6 00 00             	movb   $0x0,(%eax)
c0006263:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006266:	83 c0 01             	add    $0x1,%eax
c0006269:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000626c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0006270:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0006274:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006278:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000627b:	8b 00                	mov    (%eax),%eax
c000627d:	85 c0                	test   %eax,%eax
c000627f:	75 93                	jne    c0006214 <execv+0x8d>
c0006281:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
c0006287:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000628a:	eb 04                	jmp    c0006290 <execv+0x109>
c000628c:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0006290:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006293:	8b 00                	mov    (%eax),%eax
c0006295:	85 c0                	test   %eax,%eax
c0006297:	75 f3                	jne    c000628c <execv+0x105>
c0006299:	8d 95 44 fb ff ff    	lea    -0x4bc(%ebp),%edx
c000629f:	b8 00 00 00 00       	mov    $0x0,%eax
c00062a4:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00062a9:	89 d7                	mov    %edx,%edi
c00062ab:	f3 ab                	rep stos %eax,%es:(%edi)
c00062ad:	c7 85 44 fb ff ff 3f 	movl   $0xc000ba3f,-0x4bc(%ebp)
c00062b4:	ba 00 c0 
c00062b7:	c7 85 48 fb ff ff 46 	movl   $0xc000ba46,-0x4b8(%ebp)
c00062be:	ba 00 c0 
c00062c1:	83 ec 0c             	sub    $0xc,%esp
c00062c4:	ff 75 08             	pushl  0x8(%ebp)
c00062c7:	e8 c4 0d 00 00       	call   c0007090 <get_physical_address>
c00062cc:	83 c4 10             	add    $0x10,%esp
c00062cf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00062d2:	83 ec 0c             	sub    $0xc,%esp
c00062d5:	8d 85 d8 fb ff ff    	lea    -0x428(%ebp),%eax
c00062db:	50                   	push   %eax
c00062dc:	e8 af 0d 00 00       	call   c0007090 <get_physical_address>
c00062e1:	83 c4 10             	add    $0x10,%esp
c00062e4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00062e7:	c7 85 d4 fb ff ff 02 	movl   $0x2,-0x42c(%ebp)
c00062ee:	00 00 00 
c00062f1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00062f4:	89 85 a0 fb ff ff    	mov    %eax,-0x460(%ebp)
c00062fa:	83 ec 0c             	sub    $0xc,%esp
c00062fd:	ff 75 08             	pushl  0x8(%ebp)
c0006300:	e8 1f 61 00 00       	call   c000c424 <Strlen>
c0006305:	83 c4 10             	add    $0x10,%esp
c0006308:	89 85 9c fb ff ff    	mov    %eax,-0x464(%ebp)
c000630e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006311:	89 85 7c fb ff ff    	mov    %eax,-0x484(%ebp)
c0006317:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000631a:	89 85 88 fb ff ff    	mov    %eax,-0x478(%ebp)
c0006320:	83 ec 0c             	sub    $0xc,%esp
c0006323:	68 4d ba 00 c0       	push   $0xc000ba4d
c0006328:	e8 34 36 00 00       	call   c0009961 <Printf>
c000632d:	83 c4 10             	add    $0x10,%esp
c0006330:	83 ec 04             	sub    $0x4,%esp
c0006333:	6a 01                	push   $0x1
c0006335:	8d 85 6c fb ff ff    	lea    -0x494(%ebp),%eax
c000633b:	50                   	push   %eax
c000633c:	6a 03                	push   $0x3
c000633e:	e8 a7 42 00 00       	call   c000a5ea <send_rec>
c0006343:	83 c4 10             	add    $0x10,%esp
c0006346:	83 ec 0c             	sub    $0xc,%esp
c0006349:	68 5e ba 00 c0       	push   $0xc000ba5e
c000634e:	e8 0e 36 00 00       	call   c0009961 <Printf>
c0006353:	83 c4 10             	add    $0x10,%esp
c0006356:	83 ec 0c             	sub    $0xc,%esp
c0006359:	68 70 ba 00 c0       	push   $0xc000ba70
c000635e:	e8 fe 35 00 00       	call   c0009961 <Printf>
c0006363:	83 c4 10             	add    $0x10,%esp
c0006366:	8b 85 d4 fb ff ff    	mov    -0x42c(%ebp),%eax
c000636c:	83 f8 65             	cmp    $0x65,%eax
c000636f:	74 1c                	je     c000638d <execv+0x206>
c0006371:	68 91 00 00 00       	push   $0x91
c0006376:	68 12 ba 00 c0       	push   $0xc000ba12
c000637b:	68 12 ba 00 c0       	push   $0xc000ba12
c0006380:	68 1d ba 00 c0       	push   $0xc000ba1d
c0006385:	e8 34 39 00 00       	call   c0009cbe <assertion_failure>
c000638a:	83 c4 10             	add    $0x10,%esp
c000638d:	8b 85 b4 fb ff ff    	mov    -0x44c(%ebp),%eax
c0006393:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0006396:	c9                   	leave  
c0006397:	c3                   	ret    

c0006398 <execl>:
c0006398:	55                   	push   %ebp
c0006399:	89 e5                	mov    %esp,%ebp
c000639b:	83 ec 18             	sub    $0x18,%esp
c000639e:	8d 45 0c             	lea    0xc(%ebp),%eax
c00063a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00063a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00063a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00063aa:	83 ec 08             	sub    $0x8,%esp
c00063ad:	ff 75 f0             	pushl  -0x10(%ebp)
c00063b0:	ff 75 08             	pushl  0x8(%ebp)
c00063b3:	e8 cf fd ff ff       	call   c0006187 <execv>
c00063b8:	83 c4 10             	add    $0x10,%esp
c00063bb:	c9                   	leave  
c00063bc:	c3                   	ret    

c00063bd <TaskMM>:
c00063bd:	55                   	push   %ebp
c00063be:	89 e5                	mov    %esp,%ebp
c00063c0:	83 ec 28             	sub    $0x28,%esp
c00063c3:	83 ec 0c             	sub    $0xc,%esp
c00063c6:	6a 6c                	push   $0x6c
c00063c8:	e8 d7 c5 ff ff       	call   c00029a4 <sys_malloc>
c00063cd:	83 c4 10             	add    $0x10,%esp
c00063d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00063d3:	83 ec 0c             	sub    $0xc,%esp
c00063d6:	6a 6c                	push   $0x6c
c00063d8:	e8 c7 c5 ff ff       	call   c00029a4 <sys_malloc>
c00063dd:	83 c4 10             	add    $0x10,%esp
c00063e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00063e3:	83 ec 04             	sub    $0x4,%esp
c00063e6:	6a 12                	push   $0x12
c00063e8:	ff 75 f0             	pushl  -0x10(%ebp)
c00063eb:	6a 02                	push   $0x2
c00063ed:	e8 f8 41 00 00       	call   c000a5ea <send_rec>
c00063f2:	83 c4 10             	add    $0x10,%esp
c00063f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00063f8:	8b 40 68             	mov    0x68(%eax),%eax
c00063fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00063fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006401:	8b 00                	mov    (%eax),%eax
c0006403:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006406:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000640d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006410:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0006417:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000641a:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c0006421:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0006425:	74 4e                	je     c0006475 <TaskMM+0xb8>
c0006427:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c000642b:	7f 08                	jg     c0006435 <TaskMM+0x78>
c000642d:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0006431:	74 28                	je     c000645b <TaskMM+0x9e>
c0006433:	eb 71                	jmp    c00064a6 <TaskMM+0xe9>
c0006435:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c0006439:	74 08                	je     c0006443 <TaskMM+0x86>
c000643b:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c000643f:	74 4e                	je     c000648f <TaskMM+0xd2>
c0006441:	eb 63                	jmp    c00064a6 <TaskMM+0xe9>
c0006443:	83 ec 0c             	sub    $0xc,%esp
c0006446:	ff 75 f0             	pushl  -0x10(%ebp)
c0006449:	e8 93 04 00 00       	call   c00068e1 <do_fork>
c000644e:	83 c4 10             	add    $0x10,%esp
c0006451:	89 c2                	mov    %eax,%edx
c0006453:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006456:	89 50 4c             	mov    %edx,0x4c(%eax)
c0006459:	eb 5c                	jmp    c00064b7 <TaskMM+0xfa>
c000645b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006462:	66 87 db             	xchg   %bx,%bx
c0006465:	83 ec 0c             	sub    $0xc,%esp
c0006468:	ff 75 f0             	pushl  -0x10(%ebp)
c000646b:	e8 a9 00 00 00       	call   c0006519 <do_exec>
c0006470:	83 c4 10             	add    $0x10,%esp
c0006473:	eb 42                	jmp    c00064b7 <TaskMM+0xfa>
c0006475:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000647c:	83 ec 08             	sub    $0x8,%esp
c000647f:	ff 75 e0             	pushl  -0x20(%ebp)
c0006482:	ff 75 f0             	pushl  -0x10(%ebp)
c0006485:	e8 c2 04 00 00       	call   c000694c <do_exit>
c000648a:	83 c4 10             	add    $0x10,%esp
c000648d:	eb 28                	jmp    c00064b7 <TaskMM+0xfa>
c000648f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006496:	83 ec 0c             	sub    $0xc,%esp
c0006499:	ff 75 f0             	pushl  -0x10(%ebp)
c000649c:	e8 a7 05 00 00       	call   c0006a48 <do_wait>
c00064a1:	83 c4 10             	add    $0x10,%esp
c00064a4:	eb 11                	jmp    c00064b7 <TaskMM+0xfa>
c00064a6:	83 ec 0c             	sub    $0xc,%esp
c00064a9:	68 80 ba 00 c0       	push   $0xc000ba80
c00064ae:	e8 ed 37 00 00       	call   c0009ca0 <panic>
c00064b3:	83 c4 10             	add    $0x10,%esp
c00064b6:	90                   	nop
c00064b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00064bb:	0f 84 22 ff ff ff    	je     c00063e3 <TaskMM+0x26>
c00064c1:	83 ec 0c             	sub    $0xc,%esp
c00064c4:	6a 03                	push   $0x3
c00064c6:	e8 62 33 00 00       	call   c000982d <delay>
c00064cb:	83 c4 10             	add    $0x10,%esp
c00064ce:	83 ec 04             	sub    $0x4,%esp
c00064d1:	ff 75 e4             	pushl  -0x1c(%ebp)
c00064d4:	ff 75 ec             	pushl  -0x14(%ebp)
c00064d7:	6a 01                	push   $0x1
c00064d9:	e8 0c 41 00 00       	call   c000a5ea <send_rec>
c00064de:	83 c4 10             	add    $0x10,%esp
c00064e1:	e9 fd fe ff ff       	jmp    c00063e3 <TaskMM+0x26>

c00064e6 <alloc_mem>:
c00064e6:	55                   	push   %ebp
c00064e7:	89 e5                	mov    %esp,%ebp
c00064e9:	83 ec 10             	sub    $0x10,%esp
c00064ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00064ef:	83 e8 08             	sub    $0x8,%eax
c00064f2:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c00064f8:	05 00 00 a0 00       	add    $0xa00000,%eax
c00064fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006500:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006503:	c9                   	leave  
c0006504:	c3                   	ret    

c0006505 <do_exec2>:
c0006505:	55                   	push   %ebp
c0006506:	89 e5                	mov    %esp,%ebp
c0006508:	83 ec 10             	sub    $0x10,%esp
c000650b:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0006512:	b8 00 00 00 00       	mov    $0x0,%eax
c0006517:	c9                   	leave  
c0006518:	c3                   	ret    

c0006519 <do_exec>:
c0006519:	55                   	push   %ebp
c000651a:	89 e5                	mov    %esp,%ebp
c000651c:	81 ec 18 09 00 00    	sub    $0x918,%esp
c0006522:	c7 85 6e ff ff ff 64 	movl   $0x5f766564,-0x92(%ebp)
c0006529:	65 76 5f 
c000652c:	c7 85 72 ff ff ff 74 	movl   $0x31797474,-0x8e(%ebp)
c0006533:	74 79 31 
c0006536:	66 c7 85 76 ff ff ff 	movw   $0x0,-0x8a(%ebp)
c000653d:	00 00 
c000653f:	66 87 db             	xchg   %bx,%bx
c0006542:	83 ec 08             	sub    $0x8,%esp
c0006545:	6a 00                	push   $0x0
c0006547:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c000654d:	50                   	push   %eax
c000654e:	e8 25 f9 ff ff       	call   c0005e78 <open>
c0006553:	83 c4 10             	add    $0x10,%esp
c0006556:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006559:	8b 45 08             	mov    0x8(%ebp),%eax
c000655c:	8b 00                	mov    (%eax),%eax
c000655e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006561:	c7 45 c8 90 43 02 00 	movl   $0x24390,-0x38(%ebp)
c0006568:	83 ec 04             	sub    $0x4,%esp
c000656b:	6a 0c                	push   $0xc
c000656d:	6a 00                	push   $0x0
c000656f:	8d 85 62 fb ff ff    	lea    -0x49e(%ebp),%eax
c0006575:	50                   	push   %eax
c0006576:	e8 70 5e 00 00       	call   c000c3eb <Memset>
c000657b:	83 c4 10             	add    $0x10,%esp
c000657e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006581:	8b 40 34             	mov    0x34(%eax),%eax
c0006584:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006587:	8b 45 08             	mov    0x8(%ebp),%eax
c000658a:	8b 40 30             	mov    0x30(%eax),%eax
c000658d:	83 ec 08             	sub    $0x8,%esp
c0006590:	50                   	push   %eax
c0006591:	ff 75 c4             	pushl  -0x3c(%ebp)
c0006594:	e8 30 0a 00 00       	call   c0006fc9 <alloc_virtual_memory>
c0006599:	83 c4 10             	add    $0x10,%esp
c000659c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000659f:	8b 45 08             	mov    0x8(%ebp),%eax
c00065a2:	8b 40 30             	mov    0x30(%eax),%eax
c00065a5:	89 c2                	mov    %eax,%edx
c00065a7:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00065aa:	83 ec 04             	sub    $0x4,%esp
c00065ad:	52                   	push   %edx
c00065ae:	50                   	push   %eax
c00065af:	8d 85 62 fb ff ff    	lea    -0x49e(%ebp),%eax
c00065b5:	50                   	push   %eax
c00065b6:	e8 1e 17 00 00       	call   c0007cd9 <Memcpy>
c00065bb:	83 c4 10             	add    $0x10,%esp
c00065be:	8b 45 08             	mov    0x8(%ebp),%eax
c00065c1:	8b 40 30             	mov    0x30(%eax),%eax
c00065c4:	c6 84 05 62 fb ff ff 	movb   $0x0,-0x49e(%ebp,%eax,1)
c00065cb:	00 
c00065cc:	83 ec 08             	sub    $0x8,%esp
c00065cf:	6a 00                	push   $0x0
c00065d1:	8d 85 62 fb ff ff    	lea    -0x49e(%ebp),%eax
c00065d7:	50                   	push   %eax
c00065d8:	e8 9b f8 ff ff       	call   c0005e78 <open>
c00065dd:	83 c4 10             	add    $0x10,%esp
c00065e0:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00065e3:	83 7d bc ff          	cmpl   $0xffffffff,-0x44(%ebp)
c00065e7:	75 15                	jne    c00065fe <do_exec+0xe5>
c00065e9:	83 ec 0c             	sub    $0xc,%esp
c00065ec:	68 91 ba 00 c0       	push   $0xc000ba91
c00065f1:	e8 6b 33 00 00       	call   c0009961 <Printf>
c00065f6:	83 c4 10             	add    $0x10,%esp
c00065f9:	e9 e1 02 00 00       	jmp    c00068df <do_exec+0x3c6>
c00065fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006605:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006608:	8d 95 6e fb ff ff    	lea    -0x492(%ebp),%edx
c000660e:	01 d0                	add    %edx,%eax
c0006610:	83 ec 04             	sub    $0x4,%esp
c0006613:	68 00 02 00 00       	push   $0x200
c0006618:	50                   	push   %eax
c0006619:	ff 75 bc             	pushl  -0x44(%ebp)
c000661c:	e8 dc f8 ff ff       	call   c0005efd <read>
c0006621:	83 c4 10             	add    $0x10,%esp
c0006624:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0006627:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000662a:	01 45 f4             	add    %eax,-0xc(%ebp)
c000662d:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
c0006631:	74 0b                	je     c000663e <do_exec+0x125>
c0006633:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c000663a:	7f 05                	jg     c0006641 <do_exec+0x128>
c000663c:	eb c7                	jmp    c0006605 <do_exec+0xec>
c000663e:	90                   	nop
c000663f:	eb 01                	jmp    c0006642 <do_exec+0x129>
c0006641:	90                   	nop
c0006642:	83 ec 0c             	sub    $0xc,%esp
c0006645:	ff 75 bc             	pushl  -0x44(%ebp)
c0006648:	e8 98 f9 ff ff       	call   c0005fe5 <close>
c000664d:	83 c4 10             	add    $0x10,%esp
c0006650:	66 87 db             	xchg   %bx,%bx
c0006653:	8d 85 6e fb ff ff    	lea    -0x492(%ebp),%eax
c0006659:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000665c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006663:	e9 d2 00 00 00       	jmp    c000673a <do_exec+0x221>
c0006668:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000666b:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c000666f:	0f b7 d0             	movzwl %ax,%edx
c0006672:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006675:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0006679:	0f b7 c0             	movzwl %ax,%eax
c000667c:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c0006680:	01 c2                	add    %eax,%edx
c0006682:	8d 85 6e fb ff ff    	lea    -0x492(%ebp),%eax
c0006688:	01 d0                	add    %edx,%eax
c000668a:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000668d:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006690:	8b 40 10             	mov    0x10(%eax),%eax
c0006693:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0006696:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006699:	05 ff 0f 00 00       	add    $0xfff,%eax
c000669e:	c1 e8 0c             	shr    $0xc,%eax
c00066a1:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00066a4:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00066a7:	8b 40 08             	mov    0x8(%eax),%eax
c00066aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00066ad:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00066b4:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c00066b8:	74 7b                	je     c0006735 <do_exec+0x21c>
c00066ba:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00066c1:	eb 41                	jmp    c0006704 <do_exec+0x1eb>
c00066c3:	83 ec 08             	sub    $0x8,%esp
c00066c6:	ff 75 cc             	pushl  -0x34(%ebp)
c00066c9:	ff 75 ec             	pushl  -0x14(%ebp)
c00066cc:	e8 f1 09 00 00       	call   c00070c2 <alloc_physical_memory_of_proc>
c00066d1:	83 c4 10             	add    $0x10,%esp
c00066d4:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00066d7:	83 ec 08             	sub    $0x8,%esp
c00066da:	68 00 10 00 00       	push   $0x1000
c00066df:	ff 75 a4             	pushl  -0x5c(%ebp)
c00066e2:	e8 e2 08 00 00       	call   c0006fc9 <alloc_virtual_memory>
c00066e7:	83 c4 10             	add    $0x10,%esp
c00066ea:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00066ed:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00066f1:	75 06                	jne    c00066f9 <do_exec+0x1e0>
c00066f3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00066f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00066f9:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0006700:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006704:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006707:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c000670a:	77 b7                	ja     c00066c3 <do_exec+0x1aa>
c000670c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000670f:	8b 40 10             	mov    0x10(%eax),%eax
c0006712:	89 c1                	mov    %eax,%ecx
c0006714:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006717:	8b 40 04             	mov    0x4(%eax),%eax
c000671a:	8d 95 6e fb ff ff    	lea    -0x492(%ebp),%edx
c0006720:	01 c2                	add    %eax,%edx
c0006722:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006725:	83 ec 04             	sub    $0x4,%esp
c0006728:	51                   	push   %ecx
c0006729:	52                   	push   %edx
c000672a:	50                   	push   %eax
c000672b:	e8 a9 15 00 00       	call   c0007cd9 <Memcpy>
c0006730:	83 c4 10             	add    $0x10,%esp
c0006733:	eb 01                	jmp    c0006736 <do_exec+0x21d>
c0006735:	90                   	nop
c0006736:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000673a:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000673d:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0006741:	0f b7 c0             	movzwl %ax,%eax
c0006744:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006747:	0f 8c 1b ff ff ff    	jl     c0006668 <do_exec+0x14f>
c000674d:	66 87 db             	xchg   %bx,%bx
c0006750:	8b 45 08             	mov    0x8(%ebp),%eax
c0006753:	8b 40 10             	mov    0x10(%eax),%eax
c0006756:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0006759:	8b 45 08             	mov    0x8(%ebp),%eax
c000675c:	8b 40 1c             	mov    0x1c(%eax),%eax
c000675f:	89 45 98             	mov    %eax,-0x68(%ebp)
c0006762:	83 ec 0c             	sub    $0xc,%esp
c0006765:	ff 75 cc             	pushl  -0x34(%ebp)
c0006768:	e8 19 e4 ff ff       	call   c0004b86 <pid2proc>
c000676d:	83 c4 10             	add    $0x10,%esp
c0006770:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0006773:	8b 45 98             	mov    -0x68(%ebp),%eax
c0006776:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c000677c:	ba 00 40 2b 00       	mov    $0x2b4000,%edx
c0006781:	29 c2                	sub    %eax,%edx
c0006783:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0006786:	01 d0                	add    %edx,%eax
c0006788:	89 45 90             	mov    %eax,-0x70(%ebp)
c000678b:	8b 45 08             	mov    0x8(%ebp),%eax
c000678e:	8b 40 10             	mov    0x10(%eax),%eax
c0006791:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0006794:	83 ec 08             	sub    $0x8,%esp
c0006797:	ff 75 98             	pushl  -0x68(%ebp)
c000679a:	ff 75 8c             	pushl  -0x74(%ebp)
c000679d:	e8 27 08 00 00       	call   c0006fc9 <alloc_virtual_memory>
c00067a2:	83 c4 10             	add    $0x10,%esp
c00067a5:	89 45 88             	mov    %eax,-0x78(%ebp)
c00067a8:	66 87 db             	xchg   %bx,%bx
c00067ab:	8b 45 88             	mov    -0x78(%ebp),%eax
c00067ae:	83 ec 04             	sub    $0x4,%esp
c00067b1:	ff 75 98             	pushl  -0x68(%ebp)
c00067b4:	50                   	push   %eax
c00067b5:	8d 85 62 f7 ff ff    	lea    -0x89e(%ebp),%eax
c00067bb:	50                   	push   %eax
c00067bc:	e8 18 15 00 00       	call   c0007cd9 <Memcpy>
c00067c1:	83 c4 10             	add    $0x10,%esp
c00067c4:	8d 85 62 f7 ff ff    	lea    -0x89e(%ebp),%eax
c00067ca:	89 45 84             	mov    %eax,-0x7c(%ebp)
c00067cd:	8b 45 84             	mov    -0x7c(%ebp),%eax
c00067d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00067d3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00067da:	eb 08                	jmp    c00067e4 <do_exec+0x2cb>
c00067dc:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c00067e0:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00067e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00067e7:	8b 00                	mov    (%eax),%eax
c00067e9:	85 c0                	test   %eax,%eax
c00067eb:	75 ef                	jne    c00067dc <do_exec+0x2c3>
c00067ed:	8b 45 88             	mov    -0x78(%ebp),%eax
c00067f0:	f7 d8                	neg    %eax
c00067f2:	89 c2                	mov    %eax,%edx
c00067f4:	8b 45 90             	mov    -0x70(%ebp),%eax
c00067f7:	01 d0                	add    %edx,%eax
c00067f9:	89 45 80             	mov    %eax,-0x80(%ebp)
c00067fc:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0006803:	8d 85 62 f7 ff ff    	lea    -0x89e(%ebp),%eax
c0006809:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000680c:	eb 17                	jmp    c0006825 <do_exec+0x30c>
c000680e:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0006812:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006815:	8b 10                	mov    (%eax),%edx
c0006817:	8b 45 80             	mov    -0x80(%ebp),%eax
c000681a:	01 c2                	add    %eax,%edx
c000681c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000681f:	89 10                	mov    %edx,(%eax)
c0006821:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
c0006825:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006828:	8b 00                	mov    (%eax),%eax
c000682a:	85 c0                	test   %eax,%eax
c000682c:	75 e0                	jne    c000680e <do_exec+0x2f5>
c000682e:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0006831:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006836:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c000683c:	66 87 db             	xchg   %bx,%bx
c000683f:	83 ec 04             	sub    $0x4,%esp
c0006842:	ff 75 98             	pushl  -0x68(%ebp)
c0006845:	8d 85 62 f7 ff ff    	lea    -0x89e(%ebp),%eax
c000684b:	50                   	push   %eax
c000684c:	ff 75 90             	pushl  -0x70(%ebp)
c000684f:	e8 85 14 00 00       	call   c0007cd9 <Memcpy>
c0006854:	83 c4 10             	add    $0x10,%esp
c0006857:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000685a:	05 30 88 2a 00       	add    $0x2a8830,%eax
c000685f:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c0006865:	8b 55 90             	mov    -0x70(%ebp),%edx
c0006868:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c000686e:	89 50 2c             	mov    %edx,0x2c(%eax)
c0006871:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0006874:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c000687a:	89 50 28             	mov    %edx,0x28(%eax)
c000687d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006880:	8b 40 18             	mov    0x18(%eax),%eax
c0006883:	89 c2                	mov    %eax,%edx
c0006885:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c000688b:	89 50 30             	mov    %edx,0x30(%eax)
c000688e:	8b 55 90             	mov    -0x70(%ebp),%edx
c0006891:	8b 85 78 ff ff ff    	mov    -0x88(%ebp),%eax
c0006897:	89 50 3c             	mov    %edx,0x3c(%eax)
c000689a:	8b 45 94             	mov    -0x6c(%ebp),%eax
c000689d:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c00068a4:	00 00 00 
c00068a7:	c7 85 5c f7 ff ff 65 	movl   $0x65,-0x8a4(%ebp)
c00068ae:	00 00 00 
c00068b1:	c7 85 3c f7 ff ff 00 	movl   $0x0,-0x8c4(%ebp)
c00068b8:	00 00 00 
c00068bb:	c7 85 40 f7 ff ff 00 	movl   $0x0,-0x8c0(%ebp)
c00068c2:	00 00 00 
c00068c5:	66 87 db             	xchg   %bx,%bx
c00068c8:	83 ec 04             	sub    $0x4,%esp
c00068cb:	ff 75 cc             	pushl  -0x34(%ebp)
c00068ce:	8d 85 f4 f6 ff ff    	lea    -0x90c(%ebp),%eax
c00068d4:	50                   	push   %eax
c00068d5:	6a 01                	push   $0x1
c00068d7:	e8 0e 3d 00 00       	call   c000a5ea <send_rec>
c00068dc:	83 c4 10             	add    $0x10,%esp
c00068df:	c9                   	leave  
c00068e0:	c3                   	ret    

c00068e1 <do_fork>:
c00068e1:	55                   	push   %ebp
c00068e2:	89 e5                	mov    %esp,%ebp
c00068e4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00068ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00068ed:	8b 00                	mov    (%eax),%eax
c00068ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00068f2:	83 ec 0c             	sub    $0xc,%esp
c00068f5:	ff 75 f4             	pushl  -0xc(%ebp)
c00068f8:	e8 51 45 00 00       	call   c000ae4e <fork_process>
c00068fd:	83 c4 10             	add    $0x10,%esp
c0006900:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006903:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006906:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000690c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000690f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006912:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c0006918:	8b 45 08             	mov    0x8(%ebp),%eax
c000691b:	89 50 4c             	mov    %edx,0x4c(%eax)
c000691e:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006925:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c000692c:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006933:	83 ec 04             	sub    $0x4,%esp
c0006936:	ff 75 ec             	pushl  -0x14(%ebp)
c0006939:	8d 45 80             	lea    -0x80(%ebp),%eax
c000693c:	50                   	push   %eax
c000693d:	6a 01                	push   $0x1
c000693f:	e8 a6 3c 00 00       	call   c000a5ea <send_rec>
c0006944:	83 c4 10             	add    $0x10,%esp
c0006947:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000694a:	c9                   	leave  
c000694b:	c3                   	ret    

c000694c <do_exit>:
c000694c:	55                   	push   %ebp
c000694d:	89 e5                	mov    %esp,%ebp
c000694f:	83 ec 18             	sub    $0x18,%esp
c0006952:	8b 45 08             	mov    0x8(%ebp),%eax
c0006955:	8b 00                	mov    (%eax),%eax
c0006957:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000695a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000695d:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006963:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006968:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000696b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000696e:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006974:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006977:	8b 45 08             	mov    0x8(%ebp),%eax
c000697a:	8b 40 44             	mov    0x44(%eax),%eax
c000697d:	89 c2                	mov    %eax,%edx
c000697f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006982:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0006988:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000698b:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006991:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006996:	0f b6 00             	movzbl (%eax),%eax
c0006999:	3c 04                	cmp    $0x4,%al
c000699b:	75 21                	jne    c00069be <do_exit+0x72>
c000699d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00069a0:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00069a6:	05 49 34 08 c0       	add    $0xc0083449,%eax
c00069ab:	c6 00 fb             	movb   $0xfb,(%eax)
c00069ae:	83 ec 0c             	sub    $0xc,%esp
c00069b1:	ff 75 ec             	pushl  -0x14(%ebp)
c00069b4:	e8 59 01 00 00       	call   c0006b12 <cleanup>
c00069b9:	83 c4 10             	add    $0x10,%esp
c00069bc:	eb 0a                	jmp    c00069c8 <do_exit+0x7c>
c00069be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069c1:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c00069c8:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c00069cf:	eb 6e                	jmp    c0006a3f <do_exit+0xf3>
c00069d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00069d4:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00069da:	05 64 34 08 c0       	add    $0xc0083464,%eax
c00069df:	8b 00                	mov    (%eax),%eax
c00069e1:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00069e4:	75 55                	jne    c0006a3b <do_exit+0xef>
c00069e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00069e9:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00069ef:	05 64 34 08 c0       	add    $0xc0083464,%eax
c00069f4:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00069fa:	0f b6 05 81 44 08 c0 	movzbl 0xc0084481,%eax
c0006a01:	3c 04                	cmp    $0x4,%al
c0006a03:	75 36                	jne    c0006a3b <do_exit+0xef>
c0006a05:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a08:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a0e:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006a13:	0f b6 00             	movzbl (%eax),%eax
c0006a16:	3c 03                	cmp    $0x3,%al
c0006a18:	75 21                	jne    c0006a3b <do_exit+0xef>
c0006a1a:	c6 05 81 44 08 c0 fb 	movb   $0xfb,0xc0084481
c0006a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a24:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a2a:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006a2f:	83 ec 0c             	sub    $0xc,%esp
c0006a32:	50                   	push   %eax
c0006a33:	e8 da 00 00 00       	call   c0006b12 <cleanup>
c0006a38:	83 c4 10             	add    $0x10,%esp
c0006a3b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006a3f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006a43:	7e 8c                	jle    c00069d1 <do_exit+0x85>
c0006a45:	90                   	nop
c0006a46:	c9                   	leave  
c0006a47:	c3                   	ret    

c0006a48 <do_wait>:
c0006a48:	55                   	push   %ebp
c0006a49:	89 e5                	mov    %esp,%ebp
c0006a4b:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006a51:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a54:	8b 00                	mov    (%eax),%eax
c0006a56:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a59:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006a60:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0006a67:	eb 5f                	jmp    c0006ac8 <do_wait+0x80>
c0006a69:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a6c:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a72:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006a77:	8b 00                	mov    (%eax),%eax
c0006a79:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006a7c:	75 46                	jne    c0006ac4 <do_wait+0x7c>
c0006a7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006a82:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006a85:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a8b:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006a90:	0f b6 00             	movzbl (%eax),%eax
c0006a93:	3c 03                	cmp    $0x3,%al
c0006a95:	75 2d                	jne    c0006ac4 <do_wait+0x7c>
c0006a97:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a9a:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006aa0:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006aa5:	c6 00 fb             	movb   $0xfb,(%eax)
c0006aa8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006aab:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006ab1:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006ab6:	83 ec 0c             	sub    $0xc,%esp
c0006ab9:	50                   	push   %eax
c0006aba:	e8 53 00 00 00       	call   c0006b12 <cleanup>
c0006abf:	83 c4 10             	add    $0x10,%esp
c0006ac2:	eb 4c                	jmp    c0006b10 <do_wait+0xc8>
c0006ac4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006ac8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006acc:	7e 9b                	jle    c0006a69 <do_wait+0x21>
c0006ace:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006ad2:	74 13                	je     c0006ae7 <do_wait+0x9f>
c0006ad4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ad7:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006add:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006ae2:	c6 00 04             	movb   $0x4,(%eax)
c0006ae5:	eb 29                	jmp    c0006b10 <do_wait+0xc8>
c0006ae7:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006aee:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006af5:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006afc:	83 ec 04             	sub    $0x4,%esp
c0006aff:	ff 75 ec             	pushl  -0x14(%ebp)
c0006b02:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006b05:	50                   	push   %eax
c0006b06:	6a 01                	push   $0x1
c0006b08:	e8 dd 3a 00 00       	call   c000a5ea <send_rec>
c0006b0d:	83 c4 10             	add    $0x10,%esp
c0006b10:	c9                   	leave  
c0006b11:	c3                   	ret    

c0006b12 <cleanup>:
c0006b12:	55                   	push   %ebp
c0006b13:	89 e5                	mov    %esp,%ebp
c0006b15:	83 ec 78             	sub    $0x78,%esp
c0006b18:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006b1f:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006b26:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b29:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006b2f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006b32:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b35:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006b3b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006b3e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b41:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006b47:	83 ec 04             	sub    $0x4,%esp
c0006b4a:	50                   	push   %eax
c0006b4b:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006b4e:	50                   	push   %eax
c0006b4f:	6a 01                	push   $0x1
c0006b51:	e8 94 3a 00 00       	call   c000a5ea <send_rec>
c0006b56:	83 c4 10             	add    $0x10,%esp
c0006b59:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b5c:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0006b63:	90                   	nop
c0006b64:	c9                   	leave  
c0006b65:	c3                   	ret    

c0006b66 <init_bitmap>:
c0006b66:	55                   	push   %ebp
c0006b67:	89 e5                	mov    %esp,%ebp
c0006b69:	83 ec 08             	sub    $0x8,%esp
c0006b6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b6f:	8b 50 04             	mov    0x4(%eax),%edx
c0006b72:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b75:	8b 00                	mov    (%eax),%eax
c0006b77:	83 ec 04             	sub    $0x4,%esp
c0006b7a:	52                   	push   %edx
c0006b7b:	6a 00                	push   $0x0
c0006b7d:	50                   	push   %eax
c0006b7e:	e8 68 58 00 00       	call   c000c3eb <Memset>
c0006b83:	83 c4 10             	add    $0x10,%esp
c0006b86:	90                   	nop
c0006b87:	c9                   	leave  
c0006b88:	c3                   	ret    

c0006b89 <test_bit_val>:
c0006b89:	55                   	push   %ebp
c0006b8a:	89 e5                	mov    %esp,%ebp
c0006b8c:	53                   	push   %ebx
c0006b8d:	83 ec 10             	sub    $0x10,%esp
c0006b90:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b93:	8d 50 07             	lea    0x7(%eax),%edx
c0006b96:	85 c0                	test   %eax,%eax
c0006b98:	0f 48 c2             	cmovs  %edx,%eax
c0006b9b:	c1 f8 03             	sar    $0x3,%eax
c0006b9e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ba1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ba4:	99                   	cltd   
c0006ba5:	c1 ea 1d             	shr    $0x1d,%edx
c0006ba8:	01 d0                	add    %edx,%eax
c0006baa:	83 e0 07             	and    $0x7,%eax
c0006bad:	29 d0                	sub    %edx,%eax
c0006baf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bb2:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bb5:	8b 10                	mov    (%eax),%edx
c0006bb7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006bba:	01 d0                	add    %edx,%eax
c0006bbc:	0f b6 00             	movzbl (%eax),%eax
c0006bbf:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006bc2:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006bc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006bc9:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006bce:	89 c1                	mov    %eax,%ecx
c0006bd0:	d3 e3                	shl    %cl,%ebx
c0006bd2:	89 d8                	mov    %ebx,%eax
c0006bd4:	21 c2                	and    %eax,%edx
c0006bd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006bd9:	89 c1                	mov    %eax,%ecx
c0006bdb:	d3 fa                	sar    %cl,%edx
c0006bdd:	89 d0                	mov    %edx,%eax
c0006bdf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006be2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006be6:	0f 9f c0             	setg   %al
c0006be9:	0f b6 c0             	movzbl %al,%eax
c0006bec:	83 c4 10             	add    $0x10,%esp
c0006bef:	5b                   	pop    %ebx
c0006bf0:	5d                   	pop    %ebp
c0006bf1:	c3                   	ret    

c0006bf2 <set_bit_val>:
c0006bf2:	55                   	push   %ebp
c0006bf3:	89 e5                	mov    %esp,%ebp
c0006bf5:	83 ec 10             	sub    $0x10,%esp
c0006bf8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006bfb:	8d 50 07             	lea    0x7(%eax),%edx
c0006bfe:	85 c0                	test   %eax,%eax
c0006c00:	0f 48 c2             	cmovs  %edx,%eax
c0006c03:	c1 f8 03             	sar    $0x3,%eax
c0006c06:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c09:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c0c:	99                   	cltd   
c0006c0d:	c1 ea 1d             	shr    $0x1d,%edx
c0006c10:	01 d0                	add    %edx,%eax
c0006c12:	83 e0 07             	and    $0x7,%eax
c0006c15:	29 d0                	sub    %edx,%eax
c0006c17:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c1d:	8b 10                	mov    (%eax),%edx
c0006c1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c22:	01 d0                	add    %edx,%eax
c0006c24:	0f b6 00             	movzbl (%eax),%eax
c0006c27:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006c2a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006c2e:	7e 13                	jle    c0006c43 <set_bit_val+0x51>
c0006c30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c33:	ba 01 00 00 00       	mov    $0x1,%edx
c0006c38:	89 c1                	mov    %eax,%ecx
c0006c3a:	d3 e2                	shl    %cl,%edx
c0006c3c:	89 d0                	mov    %edx,%eax
c0006c3e:	08 45 ff             	or     %al,-0x1(%ebp)
c0006c41:	eb 13                	jmp    c0006c56 <set_bit_val+0x64>
c0006c43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c46:	ba 01 00 00 00       	mov    $0x1,%edx
c0006c4b:	89 c1                	mov    %eax,%ecx
c0006c4d:	d3 e2                	shl    %cl,%edx
c0006c4f:	89 d0                	mov    %edx,%eax
c0006c51:	f7 d0                	not    %eax
c0006c53:	20 45 ff             	and    %al,-0x1(%ebp)
c0006c56:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c59:	8b 10                	mov    (%eax),%edx
c0006c5b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c5e:	01 c2                	add    %eax,%edx
c0006c60:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006c64:	88 02                	mov    %al,(%edx)
c0006c66:	b8 01 00 00 00       	mov    $0x1,%eax
c0006c6b:	c9                   	leave  
c0006c6c:	c3                   	ret    

c0006c6d <set_bits>:
c0006c6d:	55                   	push   %ebp
c0006c6e:	89 e5                	mov    %esp,%ebp
c0006c70:	83 ec 10             	sub    $0x10,%esp
c0006c73:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006c7a:	eb 1c                	jmp    c0006c98 <set_bits+0x2b>
c0006c7c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c7f:	8d 50 01             	lea    0x1(%eax),%edx
c0006c82:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006c85:	ff 75 10             	pushl  0x10(%ebp)
c0006c88:	50                   	push   %eax
c0006c89:	ff 75 08             	pushl  0x8(%ebp)
c0006c8c:	e8 61 ff ff ff       	call   c0006bf2 <set_bit_val>
c0006c91:	83 c4 0c             	add    $0xc,%esp
c0006c94:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006c98:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006c9b:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006c9e:	7c dc                	jl     c0006c7c <set_bits+0xf>
c0006ca0:	b8 01 00 00 00       	mov    $0x1,%eax
c0006ca5:	c9                   	leave  
c0006ca6:	c3                   	ret    

c0006ca7 <get_first_free_bit>:
c0006ca7:	55                   	push   %ebp
c0006ca8:	89 e5                	mov    %esp,%ebp
c0006caa:	83 ec 10             	sub    $0x10,%esp
c0006cad:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cb0:	8b 40 04             	mov    0x4(%eax),%eax
c0006cb3:	c1 e0 03             	shl    $0x3,%eax
c0006cb6:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006cb9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006cbc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006cbf:	eb 1b                	jmp    c0006cdc <get_first_free_bit+0x35>
c0006cc1:	ff 75 fc             	pushl  -0x4(%ebp)
c0006cc4:	ff 75 08             	pushl  0x8(%ebp)
c0006cc7:	e8 bd fe ff ff       	call   c0006b89 <test_bit_val>
c0006ccc:	83 c4 08             	add    $0x8,%esp
c0006ccf:	85 c0                	test   %eax,%eax
c0006cd1:	75 05                	jne    c0006cd8 <get_first_free_bit+0x31>
c0006cd3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006cd6:	eb 11                	jmp    c0006ce9 <get_first_free_bit+0x42>
c0006cd8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006cdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006cdf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006ce2:	7c dd                	jl     c0006cc1 <get_first_free_bit+0x1a>
c0006ce4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006ce9:	c9                   	leave  
c0006cea:	c3                   	ret    

c0006ceb <get_bits>:
c0006ceb:	55                   	push   %ebp
c0006cec:	89 e5                	mov    %esp,%ebp
c0006cee:	83 ec 20             	sub    $0x20,%esp
c0006cf1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006cf8:	ff 75 f0             	pushl  -0x10(%ebp)
c0006cfb:	ff 75 08             	pushl  0x8(%ebp)
c0006cfe:	e8 a4 ff ff ff       	call   c0006ca7 <get_first_free_bit>
c0006d03:	83 c4 08             	add    $0x8,%esp
c0006d06:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d09:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d0c:	8b 40 04             	mov    0x4(%eax),%eax
c0006d0f:	c1 e0 03             	shl    $0x3,%eax
c0006d12:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006d15:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d18:	83 e8 01             	sub    $0x1,%eax
c0006d1b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006d1e:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006d22:	75 08                	jne    c0006d2c <get_bits+0x41>
c0006d24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d27:	e9 85 00 00 00       	jmp    c0006db1 <get_bits+0xc6>
c0006d2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d2f:	83 c0 01             	add    $0x1,%eax
c0006d32:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d35:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d3b:	eb 58                	jmp    c0006d95 <get_bits+0xaa>
c0006d3d:	ff 75 f8             	pushl  -0x8(%ebp)
c0006d40:	ff 75 08             	pushl  0x8(%ebp)
c0006d43:	e8 41 fe ff ff       	call   c0006b89 <test_bit_val>
c0006d48:	83 c4 08             	add    $0x8,%esp
c0006d4b:	85 c0                	test   %eax,%eax
c0006d4d:	75 0a                	jne    c0006d59 <get_bits+0x6e>
c0006d4f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006d53:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006d57:	eb 2b                	jmp    c0006d84 <get_bits+0x99>
c0006d59:	6a 00                	push   $0x0
c0006d5b:	ff 75 08             	pushl  0x8(%ebp)
c0006d5e:	e8 44 ff ff ff       	call   c0006ca7 <get_first_free_bit>
c0006d63:	83 c4 08             	add    $0x8,%esp
c0006d66:	83 c0 01             	add    $0x1,%eax
c0006d69:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d6f:	83 c0 01             	add    $0x1,%eax
c0006d72:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d75:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006d78:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d7b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d7e:	83 e8 01             	sub    $0x1,%eax
c0006d81:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006d84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d87:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006d8a:	7c 09                	jl     c0006d95 <get_bits+0xaa>
c0006d8c:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006d93:	eb 0d                	jmp    c0006da2 <get_bits+0xb7>
c0006d95:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d98:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006d9b:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006d9e:	85 c0                	test   %eax,%eax
c0006da0:	7f 9b                	jg     c0006d3d <get_bits+0x52>
c0006da2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006da5:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006da8:	83 c0 01             	add    $0x1,%eax
c0006dab:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006dae:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006db1:	c9                   	leave  
c0006db2:	c3                   	ret    

c0006db3 <get_a_page2>:
c0006db3:	55                   	push   %ebp
c0006db4:	89 e5                	mov    %esp,%ebp
c0006db6:	83 ec 18             	sub    $0x18,%esp
c0006db9:	83 ec 0c             	sub    $0xc,%esp
c0006dbc:	ff 75 0c             	pushl  0xc(%ebp)
c0006dbf:	e8 1e 00 00 00       	call   c0006de2 <get_a_page>
c0006dc4:	83 c4 10             	add    $0x10,%esp
c0006dc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006dca:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006dcd:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dd0:	83 ec 08             	sub    $0x8,%esp
c0006dd3:	52                   	push   %edx
c0006dd4:	50                   	push   %eax
c0006dd5:	e8 61 01 00 00       	call   c0006f3b <add_map_entry>
c0006dda:	83 c4 10             	add    $0x10,%esp
c0006ddd:	8b 45 08             	mov    0x8(%ebp),%eax
c0006de0:	c9                   	leave  
c0006de1:	c3                   	ret    

c0006de2 <get_a_page>:
c0006de2:	55                   	push   %ebp
c0006de3:	89 e5                	mov    %esp,%ebp
c0006de5:	83 ec 20             	sub    $0x20,%esp
c0006de8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006dec:	75 22                	jne    c0006e10 <get_a_page+0x2e>
c0006dee:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006df3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006df6:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006dfb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006dfe:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006e03:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e06:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006e0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e0e:	eb 20                	jmp    c0006e30 <get_a_page+0x4e>
c0006e10:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006e15:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e18:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0006e1d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e20:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c0006e25:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e28:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0006e2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e30:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006e33:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006e36:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006e39:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006e3c:	6a 01                	push   $0x1
c0006e3e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006e41:	50                   	push   %eax
c0006e42:	e8 a4 fe ff ff       	call   c0006ceb <get_bits>
c0006e47:	83 c4 08             	add    $0x8,%esp
c0006e4a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e50:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006e53:	c1 e2 0c             	shl    $0xc,%edx
c0006e56:	01 d0                	add    %edx,%eax
c0006e58:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e5b:	6a 01                	push   $0x1
c0006e5d:	ff 75 fc             	pushl  -0x4(%ebp)
c0006e60:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006e63:	50                   	push   %eax
c0006e64:	e8 89 fd ff ff       	call   c0006bf2 <set_bit_val>
c0006e69:	83 c4 0c             	add    $0xc,%esp
c0006e6c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e6f:	c9                   	leave  
c0006e70:	c3                   	ret    

c0006e71 <get_virtual_address>:
c0006e71:	55                   	push   %ebp
c0006e72:	89 e5                	mov    %esp,%ebp
c0006e74:	83 ec 28             	sub    $0x28,%esp
c0006e77:	e8 1b aa ff ff       	call   c0001897 <get_running_thread_pcb>
c0006e7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e7f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006e83:	75 1a                	jne    c0006e9f <get_virtual_address+0x2e>
c0006e85:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006e8a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006e8d:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006e92:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006e95:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006e9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e9d:	eb 18                	jmp    c0006eb7 <get_virtual_address+0x46>
c0006e9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ea2:	8b 40 0c             	mov    0xc(%eax),%eax
c0006ea5:	83 ec 04             	sub    $0x4,%esp
c0006ea8:	6a 0c                	push   $0xc
c0006eaa:	50                   	push   %eax
c0006eab:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006eae:	50                   	push   %eax
c0006eaf:	e8 25 0e 00 00       	call   c0007cd9 <Memcpy>
c0006eb4:	83 c4 10             	add    $0x10,%esp
c0006eb7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006eba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006ebd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006ec0:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006ec3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ec6:	83 ec 08             	sub    $0x8,%esp
c0006ec9:	50                   	push   %eax
c0006eca:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006ecd:	50                   	push   %eax
c0006ece:	e8 18 fe ff ff       	call   c0006ceb <get_bits>
c0006ed3:	83 c4 10             	add    $0x10,%esp
c0006ed6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ed9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006edc:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006edf:	c1 e2 0c             	shl    $0xc,%edx
c0006ee2:	01 d0                	add    %edx,%eax
c0006ee4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ee7:	8b 45 08             	mov    0x8(%ebp),%eax
c0006eea:	50                   	push   %eax
c0006eeb:	6a 01                	push   $0x1
c0006eed:	ff 75 f0             	pushl  -0x10(%ebp)
c0006ef0:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006ef3:	50                   	push   %eax
c0006ef4:	e8 74 fd ff ff       	call   c0006c6d <set_bits>
c0006ef9:	83 c4 10             	add    $0x10,%esp
c0006efc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006eff:	c9                   	leave  
c0006f00:	c3                   	ret    

c0006f01 <ptr_pde>:
c0006f01:	55                   	push   %ebp
c0006f02:	89 e5                	mov    %esp,%ebp
c0006f04:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f07:	c1 e8 16             	shr    $0x16,%eax
c0006f0a:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006f0f:	c1 e0 02             	shl    $0x2,%eax
c0006f12:	5d                   	pop    %ebp
c0006f13:	c3                   	ret    

c0006f14 <ptr_pte>:
c0006f14:	55                   	push   %ebp
c0006f15:	89 e5                	mov    %esp,%ebp
c0006f17:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f1a:	c1 e8 0a             	shr    $0xa,%eax
c0006f1d:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006f22:	89 c2                	mov    %eax,%edx
c0006f24:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f27:	c1 e8 0c             	shr    $0xc,%eax
c0006f2a:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006f2f:	c1 e0 02             	shl    $0x2,%eax
c0006f32:	01 d0                	add    %edx,%eax
c0006f34:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006f39:	5d                   	pop    %ebp
c0006f3a:	c3                   	ret    

c0006f3b <add_map_entry>:
c0006f3b:	55                   	push   %ebp
c0006f3c:	89 e5                	mov    %esp,%ebp
c0006f3e:	83 ec 18             	sub    $0x18,%esp
c0006f41:	ff 75 08             	pushl  0x8(%ebp)
c0006f44:	e8 b8 ff ff ff       	call   c0006f01 <ptr_pde>
c0006f49:	83 c4 04             	add    $0x4,%esp
c0006f4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f4f:	ff 75 08             	pushl  0x8(%ebp)
c0006f52:	e8 bd ff ff ff       	call   c0006f14 <ptr_pte>
c0006f57:	83 c4 04             	add    $0x4,%esp
c0006f5a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f60:	8b 00                	mov    (%eax),%eax
c0006f62:	83 e0 01             	and    $0x1,%eax
c0006f65:	85 c0                	test   %eax,%eax
c0006f67:	74 1b                	je     c0006f84 <add_map_entry+0x49>
c0006f69:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006f6c:	8b 00                	mov    (%eax),%eax
c0006f6e:	83 e0 01             	and    $0x1,%eax
c0006f71:	85 c0                	test   %eax,%eax
c0006f73:	75 51                	jne    c0006fc6 <add_map_entry+0x8b>
c0006f75:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006f78:	83 c8 07             	or     $0x7,%eax
c0006f7b:	89 c2                	mov    %eax,%edx
c0006f7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006f80:	89 10                	mov    %edx,(%eax)
c0006f82:	eb 42                	jmp    c0006fc6 <add_map_entry+0x8b>
c0006f84:	6a 00                	push   $0x0
c0006f86:	e8 57 fe ff ff       	call   c0006de2 <get_a_page>
c0006f8b:	83 c4 04             	add    $0x4,%esp
c0006f8e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f91:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f94:	83 c8 07             	or     $0x7,%eax
c0006f97:	89 c2                	mov    %eax,%edx
c0006f99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f9c:	89 10                	mov    %edx,(%eax)
c0006f9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006fa1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006fa6:	83 ec 04             	sub    $0x4,%esp
c0006fa9:	68 00 10 00 00       	push   $0x1000
c0006fae:	6a 00                	push   $0x0
c0006fb0:	50                   	push   %eax
c0006fb1:	e8 35 54 00 00       	call   c000c3eb <Memset>
c0006fb6:	83 c4 10             	add    $0x10,%esp
c0006fb9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006fbc:	83 c8 07             	or     $0x7,%eax
c0006fbf:	89 c2                	mov    %eax,%edx
c0006fc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006fc4:	89 10                	mov    %edx,(%eax)
c0006fc6:	90                   	nop
c0006fc7:	c9                   	leave  
c0006fc8:	c3                   	ret    

c0006fc9 <alloc_virtual_memory>:
c0006fc9:	55                   	push   %ebp
c0006fca:	89 e5                	mov    %esp,%ebp
c0006fcc:	83 ec 28             	sub    $0x28,%esp
c0006fcf:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fd2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006fd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006fda:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fdd:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0006fe0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006fe3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006fe6:	01 45 e4             	add    %eax,-0x1c(%ebp)
c0006fe9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006fec:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006ff1:	c1 e8 0c             	shr    $0xc,%eax
c0006ff4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006ff7:	e8 9b a8 ff ff       	call   c0001897 <get_running_thread_pcb>
c0006ffc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006fff:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007002:	8b 40 08             	mov    0x8(%eax),%eax
c0007005:	85 c0                	test   %eax,%eax
c0007007:	75 09                	jne    c0007012 <alloc_virtual_memory+0x49>
c0007009:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0007010:	eb 07                	jmp    c0007019 <alloc_virtual_memory+0x50>
c0007012:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007019:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007020:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007027:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000702e:	eb 47                	jmp    c0007077 <alloc_virtual_memory+0xae>
c0007030:	83 ec 08             	sub    $0x8,%esp
c0007033:	ff 75 f0             	pushl  -0x10(%ebp)
c0007036:	6a 01                	push   $0x1
c0007038:	e8 34 fe ff ff       	call   c0006e71 <get_virtual_address>
c000703d:	83 c4 10             	add    $0x10,%esp
c0007040:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007043:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007047:	74 13                	je     c000705c <alloc_virtual_memory+0x93>
c0007049:	83 ec 0c             	sub    $0xc,%esp
c000704c:	ff 75 f0             	pushl  -0x10(%ebp)
c000704f:	e8 8e fd ff ff       	call   c0006de2 <get_a_page>
c0007054:	83 c4 10             	add    $0x10,%esp
c0007057:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000705a:	eb 06                	jmp    c0007062 <alloc_virtual_memory+0x99>
c000705c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000705f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007062:	83 ec 08             	sub    $0x8,%esp
c0007065:	ff 75 f4             	pushl  -0xc(%ebp)
c0007068:	ff 75 d8             	pushl  -0x28(%ebp)
c000706b:	e8 cb fe ff ff       	call   c0006f3b <add_map_entry>
c0007070:	83 c4 10             	add    $0x10,%esp
c0007073:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007077:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000707a:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000707d:	72 b1                	jb     c0007030 <alloc_virtual_memory+0x67>
c000707f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007082:	25 ff 0f 00 00       	and    $0xfff,%eax
c0007087:	89 c2                	mov    %eax,%edx
c0007089:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000708c:	01 d0                	add    %edx,%eax
c000708e:	c9                   	leave  
c000708f:	c3                   	ret    

c0007090 <get_physical_address>:
c0007090:	55                   	push   %ebp
c0007091:	89 e5                	mov    %esp,%ebp
c0007093:	83 ec 10             	sub    $0x10,%esp
c0007096:	ff 75 08             	pushl  0x8(%ebp)
c0007099:	e8 76 fe ff ff       	call   c0006f14 <ptr_pte>
c000709e:	83 c4 04             	add    $0x4,%esp
c00070a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00070a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00070a7:	8b 00                	mov    (%eax),%eax
c00070a9:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00070ae:	89 c2                	mov    %eax,%edx
c00070b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00070b3:	25 ff 0f 00 00       	and    $0xfff,%eax
c00070b8:	09 d0                	or     %edx,%eax
c00070ba:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00070bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00070c0:	c9                   	leave  
c00070c1:	c3                   	ret    

c00070c2 <alloc_physical_memory_of_proc>:
c00070c2:	55                   	push   %ebp
c00070c3:	89 e5                	mov    %esp,%ebp
c00070c5:	83 ec 38             	sub    $0x38,%esp
c00070c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00070cb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00070d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070d3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00070da:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070dd:	83 ec 0c             	sub    $0xc,%esp
c00070e0:	50                   	push   %eax
c00070e1:	e8 a0 da ff ff       	call   c0004b86 <pid2proc>
c00070e6:	83 c4 10             	add    $0x10,%esp
c00070e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00070ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070ef:	8b 40 0c             	mov    0xc(%eax),%eax
c00070f2:	83 ec 04             	sub    $0x4,%esp
c00070f5:	6a 0c                	push   $0xc
c00070f7:	50                   	push   %eax
c00070f8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c00070fb:	50                   	push   %eax
c00070fc:	e8 d8 0b 00 00       	call   c0007cd9 <Memcpy>
c0007101:	83 c4 10             	add    $0x10,%esp
c0007104:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007107:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000710a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000710d:	89 55 d0             	mov    %edx,-0x30(%ebp)
c0007110:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007113:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007116:	29 c2                	sub    %eax,%edx
c0007118:	89 d0                	mov    %edx,%eax
c000711a:	c1 e8 0c             	shr    $0xc,%eax
c000711d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007120:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007123:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007126:	c1 e2 0c             	shl    $0xc,%edx
c0007129:	01 d0                	add    %edx,%eax
c000712b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000712e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007131:	6a 01                	push   $0x1
c0007133:	6a 01                	push   $0x1
c0007135:	50                   	push   %eax
c0007136:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0007139:	50                   	push   %eax
c000713a:	e8 2e fb ff ff       	call   c0006c6d <set_bits>
c000713f:	83 c4 10             	add    $0x10,%esp
c0007142:	83 ec 0c             	sub    $0xc,%esp
c0007145:	ff 75 f0             	pushl  -0x10(%ebp)
c0007148:	e8 95 fc ff ff       	call   c0006de2 <get_a_page>
c000714d:	83 c4 10             	add    $0x10,%esp
c0007150:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007153:	83 ec 08             	sub    $0x8,%esp
c0007156:	ff 75 e0             	pushl  -0x20(%ebp)
c0007159:	ff 75 08             	pushl  0x8(%ebp)
c000715c:	e8 da fd ff ff       	call   c0006f3b <add_map_entry>
c0007161:	83 c4 10             	add    $0x10,%esp
c0007164:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007167:	c9                   	leave  
c0007168:	c3                   	ret    

c0007169 <alloc_physical_memory>:
c0007169:	55                   	push   %ebp
c000716a:	89 e5                	mov    %esp,%ebp
c000716c:	83 ec 38             	sub    $0x38,%esp
c000716f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007172:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007177:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000717a:	e8 18 a7 ff ff       	call   c0001897 <get_running_thread_pcb>
c000717f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007182:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007186:	75 1a                	jne    c00071a2 <alloc_physical_memory+0x39>
c0007188:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c000718d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007190:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007195:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007198:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c000719d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00071a0:	eb 18                	jmp    c00071ba <alloc_physical_memory+0x51>
c00071a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00071a5:	8b 40 0c             	mov    0xc(%eax),%eax
c00071a8:	83 ec 04             	sub    $0x4,%esp
c00071ab:	6a 0c                	push   $0xc
c00071ad:	50                   	push   %eax
c00071ae:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00071b1:	50                   	push   %eax
c00071b2:	e8 22 0b 00 00       	call   c0007cd9 <Memcpy>
c00071b7:	83 c4 10             	add    $0x10,%esp
c00071ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00071bd:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00071c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00071c3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c00071c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00071c9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00071cc:	29 c2                	sub    %eax,%edx
c00071ce:	89 d0                	mov    %edx,%eax
c00071d0:	c1 e8 0c             	shr    $0xc,%eax
c00071d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00071d6:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00071d9:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00071dc:	c1 e2 0c             	shl    $0xc,%edx
c00071df:	01 d0                	add    %edx,%eax
c00071e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00071e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00071e7:	6a 01                	push   $0x1
c00071e9:	6a 01                	push   $0x1
c00071eb:	50                   	push   %eax
c00071ec:	8d 45 d0             	lea    -0x30(%ebp),%eax
c00071ef:	50                   	push   %eax
c00071f0:	e8 78 fa ff ff       	call   c0006c6d <set_bits>
c00071f5:	83 c4 10             	add    $0x10,%esp
c00071f8:	83 ec 0c             	sub    $0xc,%esp
c00071fb:	ff 75 0c             	pushl  0xc(%ebp)
c00071fe:	e8 df fb ff ff       	call   c0006de2 <get_a_page>
c0007203:	83 c4 10             	add    $0x10,%esp
c0007206:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007209:	83 ec 08             	sub    $0x8,%esp
c000720c:	ff 75 e4             	pushl  -0x1c(%ebp)
c000720f:	ff 75 08             	pushl  0x8(%ebp)
c0007212:	e8 24 fd ff ff       	call   c0006f3b <add_map_entry>
c0007217:	83 c4 10             	add    $0x10,%esp
c000721a:	8b 45 08             	mov    0x8(%ebp),%eax
c000721d:	c9                   	leave  
c000721e:	c3                   	ret    

c000721f <alloc_memory>:
c000721f:	55                   	push   %ebp
c0007220:	89 e5                	mov    %esp,%ebp
c0007222:	83 ec 18             	sub    $0x18,%esp
c0007225:	83 ec 08             	sub    $0x8,%esp
c0007228:	ff 75 0c             	pushl  0xc(%ebp)
c000722b:	ff 75 08             	pushl  0x8(%ebp)
c000722e:	e8 3e fc ff ff       	call   c0006e71 <get_virtual_address>
c0007233:	83 c4 10             	add    $0x10,%esp
c0007236:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007239:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000723c:	2d 00 10 00 00       	sub    $0x1000,%eax
c0007241:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007244:	eb 29                	jmp    c000726f <alloc_memory+0x50>
c0007246:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c000724d:	83 ec 0c             	sub    $0xc,%esp
c0007250:	ff 75 0c             	pushl  0xc(%ebp)
c0007253:	e8 8a fb ff ff       	call   c0006de2 <get_a_page>
c0007258:	83 c4 10             	add    $0x10,%esp
c000725b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000725e:	83 ec 08             	sub    $0x8,%esp
c0007261:	ff 75 ec             	pushl  -0x14(%ebp)
c0007264:	ff 75 f4             	pushl  -0xc(%ebp)
c0007267:	e8 cf fc ff ff       	call   c0006f3b <add_map_entry>
c000726c:	83 c4 10             	add    $0x10,%esp
c000726f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007272:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007275:	89 55 08             	mov    %edx,0x8(%ebp)
c0007278:	85 c0                	test   %eax,%eax
c000727a:	75 ca                	jne    c0007246 <alloc_memory+0x27>
c000727c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000727f:	c9                   	leave  
c0007280:	c3                   	ret    

c0007281 <get_a_virtual_page>:
c0007281:	55                   	push   %ebp
c0007282:	89 e5                	mov    %esp,%ebp
c0007284:	83 ec 18             	sub    $0x18,%esp
c0007287:	ff 75 08             	pushl  0x8(%ebp)
c000728a:	e8 53 fb ff ff       	call   c0006de2 <get_a_page>
c000728f:	83 c4 04             	add    $0x4,%esp
c0007292:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007295:	83 ec 08             	sub    $0x8,%esp
c0007298:	ff 75 f4             	pushl  -0xc(%ebp)
c000729b:	ff 75 0c             	pushl  0xc(%ebp)
c000729e:	e8 98 fc ff ff       	call   c0006f3b <add_map_entry>
c00072a3:	83 c4 10             	add    $0x10,%esp
c00072a6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00072a9:	c9                   	leave  
c00072aa:	c3                   	ret    

c00072ab <block2arena>:
c00072ab:	55                   	push   %ebp
c00072ac:	89 e5                	mov    %esp,%ebp
c00072ae:	83 ec 10             	sub    $0x10,%esp
c00072b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00072b4:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00072b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00072bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00072bf:	c9                   	leave  
c00072c0:	c3                   	ret    

c00072c1 <sys_malloc2>:
c00072c1:	55                   	push   %ebp
c00072c2:	89 e5                	mov    %esp,%ebp
c00072c4:	83 ec 68             	sub    $0x68,%esp
c00072c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00072ce:	e8 c4 a5 ff ff       	call   c0001897 <get_running_thread_pcb>
c00072d3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00072d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00072d9:	8b 40 08             	mov    0x8(%eax),%eax
c00072dc:	85 c0                	test   %eax,%eax
c00072de:	75 10                	jne    c00072f0 <sys_malloc2+0x2f>
c00072e0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00072e7:	c7 45 ec a0 47 08 c0 	movl   $0xc00847a0,-0x14(%ebp)
c00072ee:	eb 10                	jmp    c0007300 <sys_malloc2+0x3f>
c00072f0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00072f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00072fa:	83 c0 10             	add    $0x10,%eax
c00072fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007300:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0007307:	76 50                	jbe    c0007359 <sys_malloc2+0x98>
c0007309:	8b 45 08             	mov    0x8(%ebp),%eax
c000730c:	05 0b 10 00 00       	add    $0x100b,%eax
c0007311:	c1 e8 0c             	shr    $0xc,%eax
c0007314:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007317:	83 ec 08             	sub    $0x8,%esp
c000731a:	ff 75 f0             	pushl  -0x10(%ebp)
c000731d:	ff 75 d8             	pushl  -0x28(%ebp)
c0007320:	e8 fa fe ff ff       	call   c000721f <alloc_memory>
c0007325:	83 c4 10             	add    $0x10,%esp
c0007328:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000732b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000732e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007331:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007334:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000733a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000733d:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0007344:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007347:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c000734b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000734e:	83 c0 0c             	add    $0xc,%eax
c0007351:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007354:	e9 f0 01 00 00       	jmp    c0007549 <sys_malloc2+0x288>
c0007359:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007360:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007367:	eb 26                	jmp    c000738f <sys_malloc2+0xce>
c0007369:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000736c:	89 d0                	mov    %edx,%eax
c000736e:	01 c0                	add    %eax,%eax
c0007370:	01 d0                	add    %edx,%eax
c0007372:	c1 e0 03             	shl    $0x3,%eax
c0007375:	89 c2                	mov    %eax,%edx
c0007377:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000737a:	01 d0                	add    %edx,%eax
c000737c:	8b 00                	mov    (%eax),%eax
c000737e:	39 45 08             	cmp    %eax,0x8(%ebp)
c0007381:	77 08                	ja     c000738b <sys_malloc2+0xca>
c0007383:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007386:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007389:	eb 0a                	jmp    c0007395 <sys_malloc2+0xd4>
c000738b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000738f:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0007393:	7e d4                	jle    c0007369 <sys_malloc2+0xa8>
c0007395:	83 ec 08             	sub    $0x8,%esp
c0007398:	ff 75 f0             	pushl  -0x10(%ebp)
c000739b:	6a 01                	push   $0x1
c000739d:	e8 7d fe ff ff       	call   c000721f <alloc_memory>
c00073a2:	83 c4 10             	add    $0x10,%esp
c00073a5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00073a8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00073ab:	89 d0                	mov    %edx,%eax
c00073ad:	01 c0                	add    %eax,%eax
c00073af:	01 d0                	add    %edx,%eax
c00073b1:	c1 e0 03             	shl    $0x3,%eax
c00073b4:	89 c2                	mov    %eax,%edx
c00073b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00073b9:	01 d0                	add    %edx,%eax
c00073bb:	83 ec 04             	sub    $0x4,%esp
c00073be:	6a 18                	push   $0x18
c00073c0:	50                   	push   %eax
c00073c1:	ff 75 cc             	pushl  -0x34(%ebp)
c00073c4:	e8 10 09 00 00       	call   c0007cd9 <Memcpy>
c00073c9:	83 c4 10             	add    $0x10,%esp
c00073cc:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00073d3:	e8 9d 08 00 00       	call   c0007c75 <intr_disable>
c00073d8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00073db:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00073de:	89 d0                	mov    %edx,%eax
c00073e0:	01 c0                	add    %eax,%eax
c00073e2:	01 d0                	add    %edx,%eax
c00073e4:	c1 e0 03             	shl    $0x3,%eax
c00073e7:	89 c2                	mov    %eax,%edx
c00073e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00073ec:	01 d0                	add    %edx,%eax
c00073ee:	83 c0 08             	add    $0x8,%eax
c00073f1:	83 ec 0c             	sub    $0xc,%esp
c00073f4:	50                   	push   %eax
c00073f5:	e8 b9 3c 00 00       	call   c000b0b3 <isListEmpty>
c00073fa:	83 c4 10             	add    $0x10,%esp
c00073fd:	3c 01                	cmp    $0x1,%al
c00073ff:	0f 85 c1 00 00 00    	jne    c00074c6 <sys_malloc2+0x205>
c0007405:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c000740c:	83 ec 08             	sub    $0x8,%esp
c000740f:	ff 75 f0             	pushl  -0x10(%ebp)
c0007412:	6a 01                	push   $0x1
c0007414:	e8 06 fe ff ff       	call   c000721f <alloc_memory>
c0007419:	83 c4 10             	add    $0x10,%esp
c000741c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000741f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007422:	83 ec 0c             	sub    $0xc,%esp
c0007425:	50                   	push   %eax
c0007426:	e8 80 fe ff ff       	call   c00072ab <block2arena>
c000742b:	83 c4 10             	add    $0x10,%esp
c000742e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007431:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007434:	89 d0                	mov    %edx,%eax
c0007436:	01 c0                	add    %eax,%eax
c0007438:	01 d0                	add    %edx,%eax
c000743a:	c1 e0 03             	shl    $0x3,%eax
c000743d:	89 c2                	mov    %eax,%edx
c000743f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007442:	01 d0                	add    %edx,%eax
c0007444:	8b 50 04             	mov    0x4(%eax),%edx
c0007447:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000744a:	89 50 04             	mov    %edx,0x4(%eax)
c000744d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007450:	8b 00                	mov    (%eax),%eax
c0007452:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007455:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c000745c:	b8 00 10 00 00       	mov    $0x1000,%eax
c0007461:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c0007464:	ba 00 00 00 00       	mov    $0x0,%edx
c0007469:	f7 75 b8             	divl   -0x48(%ebp)
c000746c:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000746f:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0007472:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0007475:	01 d0                	add    %edx,%eax
c0007477:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000747a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007481:	eb 3b                	jmp    c00074be <sys_malloc2+0x1fd>
c0007483:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007486:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c000748a:	89 c2                	mov    %eax,%edx
c000748c:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000748f:	01 d0                	add    %edx,%eax
c0007491:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0007494:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c0007497:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000749a:	89 d0                	mov    %edx,%eax
c000749c:	01 c0                	add    %eax,%eax
c000749e:	01 d0                	add    %edx,%eax
c00074a0:	c1 e0 03             	shl    $0x3,%eax
c00074a3:	89 c2                	mov    %eax,%edx
c00074a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074a8:	01 d0                	add    %edx,%eax
c00074aa:	83 c0 08             	add    $0x8,%eax
c00074ad:	83 ec 08             	sub    $0x8,%esp
c00074b0:	51                   	push   %ecx
c00074b1:	50                   	push   %eax
c00074b2:	e8 f9 3c 00 00       	call   c000b1b0 <appendToDoubleLinkList>
c00074b7:	83 c4 10             	add    $0x10,%esp
c00074ba:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00074be:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00074c1:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c00074c4:	77 bd                	ja     c0007483 <sys_malloc2+0x1c2>
c00074c6:	83 ec 0c             	sub    $0xc,%esp
c00074c9:	ff 75 c4             	pushl  -0x3c(%ebp)
c00074cc:	e8 cd 07 00 00       	call   c0007c9e <intr_set_status>
c00074d1:	83 c4 10             	add    $0x10,%esp
c00074d4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00074d7:	89 d0                	mov    %edx,%eax
c00074d9:	01 c0                	add    %eax,%eax
c00074db:	01 d0                	add    %edx,%eax
c00074dd:	c1 e0 03             	shl    $0x3,%eax
c00074e0:	89 c2                	mov    %eax,%edx
c00074e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074e5:	01 d0                	add    %edx,%eax
c00074e7:	83 c0 08             	add    $0x8,%eax
c00074ea:	83 ec 0c             	sub    $0xc,%esp
c00074ed:	50                   	push   %eax
c00074ee:	e8 27 3e 00 00       	call   c000b31a <popFromDoubleLinkList>
c00074f3:	83 c4 10             	add    $0x10,%esp
c00074f6:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00074f9:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00074fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00074ff:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0007503:	75 1c                	jne    c0007521 <sys_malloc2+0x260>
c0007505:	68 c6 01 00 00       	push   $0x1c6
c000750a:	68 a1 ba 00 c0       	push   $0xc000baa1
c000750f:	68 a1 ba 00 c0       	push   $0xc000baa1
c0007514:	68 ab ba 00 c0       	push   $0xc000baab
c0007519:	e8 a0 27 00 00       	call   c0009cbe <assertion_failure>
c000751e:	83 c4 10             	add    $0x10,%esp
c0007521:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0007524:	83 ec 0c             	sub    $0xc,%esp
c0007527:	50                   	push   %eax
c0007528:	e8 7e fd ff ff       	call   c00072ab <block2arena>
c000752d:	83 c4 10             	add    $0x10,%esp
c0007530:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0007533:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0007536:	8b 40 04             	mov    0x4(%eax),%eax
c0007539:	8d 50 ff             	lea    -0x1(%eax),%edx
c000753c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c000753f:	89 50 04             	mov    %edx,0x4(%eax)
c0007542:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c0007549:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000754d:	75 1c                	jne    c000756b <sys_malloc2+0x2aa>
c000754f:	68 cd 01 00 00       	push   $0x1cd
c0007554:	68 a1 ba 00 c0       	push   $0xc000baa1
c0007559:	68 a1 ba 00 c0       	push   $0xc000baa1
c000755e:	68 bd ba 00 c0       	push   $0xc000babd
c0007563:	e8 56 27 00 00       	call   c0009cbe <assertion_failure>
c0007568:	83 c4 10             	add    $0x10,%esp
c000756b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000756e:	c9                   	leave  
c000756f:	c3                   	ret    

c0007570 <remove_map_entry>:
c0007570:	55                   	push   %ebp
c0007571:	89 e5                	mov    %esp,%ebp
c0007573:	83 ec 10             	sub    $0x10,%esp
c0007576:	ff 75 08             	pushl  0x8(%ebp)
c0007579:	e8 96 f9 ff ff       	call   c0006f14 <ptr_pte>
c000757e:	83 c4 04             	add    $0x4,%esp
c0007581:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007584:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007587:	8b 10                	mov    (%eax),%edx
c0007589:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000758c:	89 10                	mov    %edx,(%eax)
c000758e:	90                   	nop
c000758f:	c9                   	leave  
c0007590:	c3                   	ret    

c0007591 <free_a_page>:
c0007591:	55                   	push   %ebp
c0007592:	89 e5                	mov    %esp,%ebp
c0007594:	83 ec 20             	sub    $0x20,%esp
c0007597:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000759b:	75 21                	jne    c00075be <free_a_page+0x2d>
c000759d:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00075a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00075a5:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00075aa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00075ad:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c00075b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00075b5:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c00075bc:	eb 1f                	jmp    c00075dd <free_a_page+0x4c>
c00075be:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c00075c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00075c6:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c00075cb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00075ce:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c00075d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00075d6:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c00075dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00075e0:	c1 e8 0c             	shr    $0xc,%eax
c00075e3:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00075e6:	6a 00                	push   $0x0
c00075e8:	ff 75 f8             	pushl  -0x8(%ebp)
c00075eb:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c00075ee:	50                   	push   %eax
c00075ef:	e8 fe f5 ff ff       	call   c0006bf2 <set_bit_val>
c00075f4:	83 c4 0c             	add    $0xc,%esp
c00075f7:	ff 75 08             	pushl  0x8(%ebp)
c00075fa:	e8 91 fa ff ff       	call   c0007090 <get_physical_address>
c00075ff:	83 c4 04             	add    $0x4,%esp
c0007602:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007605:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007608:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000760e:	85 c0                	test   %eax,%eax
c0007610:	0f 48 c2             	cmovs  %edx,%eax
c0007613:	c1 f8 0c             	sar    $0xc,%eax
c0007616:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007619:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000761c:	6a 00                	push   $0x0
c000761e:	ff 75 f0             	pushl  -0x10(%ebp)
c0007621:	50                   	push   %eax
c0007622:	e8 cb f5 ff ff       	call   c0006bf2 <set_bit_val>
c0007627:	83 c4 0c             	add    $0xc,%esp
c000762a:	ff 75 08             	pushl  0x8(%ebp)
c000762d:	e8 3e ff ff ff       	call   c0007570 <remove_map_entry>
c0007632:	83 c4 04             	add    $0x4,%esp
c0007635:	90                   	nop
c0007636:	c9                   	leave  
c0007637:	c3                   	ret    

c0007638 <sys_free>:
c0007638:	55                   	push   %ebp
c0007639:	89 e5                	mov    %esp,%ebp
c000763b:	83 ec 58             	sub    $0x58,%esp
c000763e:	e8 54 a2 ff ff       	call   c0001897 <get_running_thread_pcb>
c0007643:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007646:	e8 2a 06 00 00       	call   c0007c75 <intr_disable>
c000764b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000764e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007651:	8b 40 08             	mov    0x8(%eax),%eax
c0007654:	85 c0                	test   %eax,%eax
c0007656:	75 10                	jne    c0007668 <sys_free+0x30>
c0007658:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000765f:	c7 45 f0 a0 47 08 c0 	movl   $0xc00847a0,-0x10(%ebp)
c0007666:	eb 10                	jmp    c0007678 <sys_free+0x40>
c0007668:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000766f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007672:	83 c0 10             	add    $0x10,%eax
c0007675:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007678:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c000767f:	76 4d                	jbe    c00076ce <sys_free+0x96>
c0007681:	8b 45 08             	mov    0x8(%ebp),%eax
c0007684:	83 e8 0c             	sub    $0xc,%eax
c0007687:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000768a:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c000768e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007691:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007696:	c1 e8 0c             	shr    $0xc,%eax
c0007699:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000769c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00076a3:	eb 1c                	jmp    c00076c1 <sys_free+0x89>
c00076a5:	83 ec 08             	sub    $0x8,%esp
c00076a8:	ff 75 f4             	pushl  -0xc(%ebp)
c00076ab:	ff 75 ec             	pushl  -0x14(%ebp)
c00076ae:	e8 de fe ff ff       	call   c0007591 <free_a_page>
c00076b3:	83 c4 10             	add    $0x10,%esp
c00076b6:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c00076bd:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00076c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00076c4:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c00076c7:	77 dc                	ja     c00076a5 <sys_free+0x6d>
c00076c9:	e9 dc 00 00 00       	jmp    c00077aa <sys_free+0x172>
c00076ce:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00076d5:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00076dc:	eb 26                	jmp    c0007704 <sys_free+0xcc>
c00076de:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00076e1:	89 d0                	mov    %edx,%eax
c00076e3:	01 c0                	add    %eax,%eax
c00076e5:	01 d0                	add    %edx,%eax
c00076e7:	c1 e0 03             	shl    $0x3,%eax
c00076ea:	89 c2                	mov    %eax,%edx
c00076ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00076ef:	01 d0                	add    %edx,%eax
c00076f1:	8b 00                	mov    (%eax),%eax
c00076f3:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00076f6:	77 08                	ja     c0007700 <sys_free+0xc8>
c00076f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00076fb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00076fe:	eb 0a                	jmp    c000770a <sys_free+0xd2>
c0007700:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007704:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c0007708:	7e d4                	jle    c00076de <sys_free+0xa6>
c000770a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000770d:	89 d0                	mov    %edx,%eax
c000770f:	01 c0                	add    %eax,%eax
c0007711:	01 d0                	add    %edx,%eax
c0007713:	c1 e0 03             	shl    $0x3,%eax
c0007716:	89 c2                	mov    %eax,%edx
c0007718:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000771b:	01 d0                	add    %edx,%eax
c000771d:	8b 10                	mov    (%eax),%edx
c000771f:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0007722:	8b 50 04             	mov    0x4(%eax),%edx
c0007725:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0007728:	8b 50 08             	mov    0x8(%eax),%edx
c000772b:	89 55 bc             	mov    %edx,-0x44(%ebp)
c000772e:	8b 50 0c             	mov    0xc(%eax),%edx
c0007731:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0007734:	8b 50 10             	mov    0x10(%eax),%edx
c0007737:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c000773a:	8b 40 14             	mov    0x14(%eax),%eax
c000773d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007740:	8b 45 08             	mov    0x8(%ebp),%eax
c0007743:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007746:	83 ec 0c             	sub    $0xc,%esp
c0007749:	ff 75 d0             	pushl  -0x30(%ebp)
c000774c:	e8 5a fb ff ff       	call   c00072ab <block2arena>
c0007751:	83 c4 10             	add    $0x10,%esp
c0007754:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007757:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000775a:	89 d0                	mov    %edx,%eax
c000775c:	01 c0                	add    %eax,%eax
c000775e:	01 d0                	add    %edx,%eax
c0007760:	c1 e0 03             	shl    $0x3,%eax
c0007763:	89 c2                	mov    %eax,%edx
c0007765:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007768:	01 d0                	add    %edx,%eax
c000776a:	83 c0 08             	add    $0x8,%eax
c000776d:	83 ec 08             	sub    $0x8,%esp
c0007770:	ff 75 d0             	pushl  -0x30(%ebp)
c0007773:	50                   	push   %eax
c0007774:	e8 37 3a 00 00       	call   c000b1b0 <appendToDoubleLinkList>
c0007779:	83 c4 10             	add    $0x10,%esp
c000777c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000777f:	8b 40 04             	mov    0x4(%eax),%eax
c0007782:	8d 50 01             	lea    0x1(%eax),%edx
c0007785:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007788:	89 50 04             	mov    %edx,0x4(%eax)
c000778b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000778e:	8b 50 04             	mov    0x4(%eax),%edx
c0007791:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007794:	39 c2                	cmp    %eax,%edx
c0007796:	75 12                	jne    c00077aa <sys_free+0x172>
c0007798:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000779b:	83 ec 08             	sub    $0x8,%esp
c000779e:	ff 75 f4             	pushl  -0xc(%ebp)
c00077a1:	50                   	push   %eax
c00077a2:	e8 ea fd ff ff       	call   c0007591 <free_a_page>
c00077a7:	83 c4 10             	add    $0x10,%esp
c00077aa:	83 ec 0c             	sub    $0xc,%esp
c00077ad:	ff 75 d8             	pushl  -0x28(%ebp)
c00077b0:	e8 e9 04 00 00       	call   c0007c9e <intr_set_status>
c00077b5:	83 c4 10             	add    $0x10,%esp
c00077b8:	90                   	nop
c00077b9:	c9                   	leave  
c00077ba:	c3                   	ret    

c00077bb <init_memory_block_desc>:
c00077bb:	55                   	push   %ebp
c00077bc:	89 e5                	mov    %esp,%ebp
c00077be:	83 ec 18             	sub    $0x18,%esp
c00077c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00077c8:	e9 b2 00 00 00       	jmp    c000787f <init_memory_block_desc+0xc4>
c00077cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00077d1:	75 1b                	jne    c00077ee <init_memory_block_desc+0x33>
c00077d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077d6:	89 d0                	mov    %edx,%eax
c00077d8:	01 c0                	add    %eax,%eax
c00077da:	01 d0                	add    %edx,%eax
c00077dc:	c1 e0 03             	shl    $0x3,%eax
c00077df:	89 c2                	mov    %eax,%edx
c00077e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00077e4:	01 d0                	add    %edx,%eax
c00077e6:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c00077ec:	eb 2e                	jmp    c000781c <init_memory_block_desc+0x61>
c00077ee:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00077f1:	89 d0                	mov    %edx,%eax
c00077f3:	01 c0                	add    %eax,%eax
c00077f5:	01 d0                	add    %edx,%eax
c00077f7:	c1 e0 03             	shl    $0x3,%eax
c00077fa:	8d 50 e8             	lea    -0x18(%eax),%edx
c00077fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0007800:	01 d0                	add    %edx,%eax
c0007802:	8b 08                	mov    (%eax),%ecx
c0007804:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007807:	89 d0                	mov    %edx,%eax
c0007809:	01 c0                	add    %eax,%eax
c000780b:	01 d0                	add    %edx,%eax
c000780d:	c1 e0 03             	shl    $0x3,%eax
c0007810:	89 c2                	mov    %eax,%edx
c0007812:	8b 45 08             	mov    0x8(%ebp),%eax
c0007815:	01 d0                	add    %edx,%eax
c0007817:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c000781a:	89 10                	mov    %edx,(%eax)
c000781c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000781f:	89 d0                	mov    %edx,%eax
c0007821:	01 c0                	add    %eax,%eax
c0007823:	01 d0                	add    %edx,%eax
c0007825:	c1 e0 03             	shl    $0x3,%eax
c0007828:	89 c2                	mov    %eax,%edx
c000782a:	8b 45 08             	mov    0x8(%ebp),%eax
c000782d:	01 d0                	add    %edx,%eax
c000782f:	8b 00                	mov    (%eax),%eax
c0007831:	89 c1                	mov    %eax,%ecx
c0007833:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0007838:	ba 00 00 00 00       	mov    $0x0,%edx
c000783d:	f7 f1                	div    %ecx
c000783f:	89 c1                	mov    %eax,%ecx
c0007841:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007844:	89 d0                	mov    %edx,%eax
c0007846:	01 c0                	add    %eax,%eax
c0007848:	01 d0                	add    %edx,%eax
c000784a:	c1 e0 03             	shl    $0x3,%eax
c000784d:	89 c2                	mov    %eax,%edx
c000784f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007852:	01 d0                	add    %edx,%eax
c0007854:	89 ca                	mov    %ecx,%edx
c0007856:	89 50 04             	mov    %edx,0x4(%eax)
c0007859:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000785c:	89 d0                	mov    %edx,%eax
c000785e:	01 c0                	add    %eax,%eax
c0007860:	01 d0                	add    %edx,%eax
c0007862:	c1 e0 03             	shl    $0x3,%eax
c0007865:	89 c2                	mov    %eax,%edx
c0007867:	8b 45 08             	mov    0x8(%ebp),%eax
c000786a:	01 d0                	add    %edx,%eax
c000786c:	83 c0 08             	add    $0x8,%eax
c000786f:	83 ec 0c             	sub    $0xc,%esp
c0007872:	50                   	push   %eax
c0007873:	e8 0d 38 00 00       	call   c000b085 <initDoubleLinkList>
c0007878:	83 c4 10             	add    $0x10,%esp
c000787b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000787f:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0007883:	0f 8e 44 ff ff ff    	jle    c00077cd <init_memory_block_desc+0x12>
c0007889:	90                   	nop
c000788a:	c9                   	leave  
c000788b:	c3                   	ret    

c000788c <init_memory2>:
c000788c:	55                   	push   %ebp
c000788d:	89 e5                	mov    %esp,%ebp
c000788f:	83 ec 38             	sub    $0x38,%esp
c0007892:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0007899:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00078a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00078a3:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c00078a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00078ab:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00078b0:	29 c2                	sub    %eax,%edx
c00078b2:	89 d0                	mov    %edx,%eax
c00078b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00078b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00078ba:	89 c2                	mov    %eax,%edx
c00078bc:	c1 ea 1f             	shr    $0x1f,%edx
c00078bf:	01 d0                	add    %edx,%eax
c00078c1:	d1 f8                	sar    %eax
c00078c3:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c00078c8:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00078cd:	83 ec 0c             	sub    $0xc,%esp
c00078d0:	50                   	push   %eax
c00078d1:	e8 ec 07 00 00       	call   c00080c2 <disp_int>
c00078d6:	83 c4 10             	add    $0x10,%esp
c00078d9:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00078de:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00078e1:	29 c2                	sub    %eax,%edx
c00078e3:	89 d0                	mov    %edx,%eax
c00078e5:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c00078ea:	83 ec 0c             	sub    $0xc,%esp
c00078ed:	68 c9 ba 00 c0       	push   $0xc000bac9
c00078f2:	e8 95 9c ff ff       	call   c000158c <disp_str>
c00078f7:	83 c4 10             	add    $0x10,%esp
c00078fa:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00078ff:	83 ec 0c             	sub    $0xc,%esp
c0007902:	50                   	push   %eax
c0007903:	e8 ba 07 00 00       	call   c00080c2 <disp_int>
c0007908:	83 c4 10             	add    $0x10,%esp
c000790b:	83 ec 0c             	sub    $0xc,%esp
c000790e:	68 c9 ba 00 c0       	push   $0xc000bac9
c0007913:	e8 74 9c ff ff       	call   c000158c <disp_str>
c0007918:	83 c4 10             	add    $0x10,%esp
c000791b:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007920:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007925:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000792b:	85 c0                	test   %eax,%eax
c000792d:	0f 48 c2             	cmovs  %edx,%eax
c0007930:	c1 f8 0c             	sar    $0xc,%eax
c0007933:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007936:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007939:	83 c0 07             	add    $0x7,%eax
c000793c:	8d 50 07             	lea    0x7(%eax),%edx
c000793f:	85 c0                	test   %eax,%eax
c0007941:	0f 48 c2             	cmovs  %edx,%eax
c0007944:	c1 f8 03             	sar    $0x3,%eax
c0007947:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c000794c:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007951:	2d 00 00 00 40       	sub    $0x40000000,%eax
c0007956:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c000795b:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007961:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007966:	83 ec 04             	sub    $0x4,%esp
c0007969:	52                   	push   %edx
c000796a:	6a 00                	push   $0x0
c000796c:	50                   	push   %eax
c000796d:	e8 79 4a 00 00       	call   c000c3eb <Memset>
c0007972:	83 c4 10             	add    $0x10,%esp
c0007975:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c000797a:	05 ff 0f 00 00       	add    $0xfff,%eax
c000797f:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007985:	85 c0                	test   %eax,%eax
c0007987:	0f 48 c2             	cmovs  %edx,%eax
c000798a:	c1 f8 0c             	sar    $0xc,%eax
c000798d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007990:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007993:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007996:	ff 75 e8             	pushl  -0x18(%ebp)
c0007999:	6a 01                	push   $0x1
c000799b:	6a 00                	push   $0x0
c000799d:	68 ac 16 01 c0       	push   $0xc00116ac
c00079a2:	e8 c6 f2 ff ff       	call   c0006c6d <set_bits>
c00079a7:	83 c4 10             	add    $0x10,%esp
c00079aa:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c00079af:	05 ff 0f 00 00       	add    $0xfff,%eax
c00079b4:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00079ba:	85 c0                	test   %eax,%eax
c00079bc:	0f 48 c2             	cmovs  %edx,%eax
c00079bf:	c1 f8 0c             	sar    $0xc,%eax
c00079c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00079c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00079c8:	83 c0 07             	add    $0x7,%eax
c00079cb:	8d 50 07             	lea    0x7(%eax),%edx
c00079ce:	85 c0                	test   %eax,%eax
c00079d0:	0f 48 c2             	cmovs  %edx,%eax
c00079d3:	c1 f8 03             	sar    $0x3,%eax
c00079d6:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c00079db:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00079e0:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00079e6:	01 d0                	add    %edx,%eax
c00079e8:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c00079ed:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c00079f3:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c00079f8:	83 ec 04             	sub    $0x4,%esp
c00079fb:	52                   	push   %edx
c00079fc:	6a 00                	push   $0x0
c00079fe:	50                   	push   %eax
c00079ff:	e8 e7 49 00 00       	call   c000c3eb <Memset>
c0007a04:	83 c4 10             	add    $0x10,%esp
c0007a07:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007a0c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007a11:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007a17:	85 c0                	test   %eax,%eax
c0007a19:	0f 48 c2             	cmovs  %edx,%eax
c0007a1c:	c1 f8 0c             	sar    $0xc,%eax
c0007a1f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007a22:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007a25:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007a28:	ff 75 e8             	pushl  -0x18(%ebp)
c0007a2b:	6a 01                	push   $0x1
c0007a2d:	ff 75 e0             	pushl  -0x20(%ebp)
c0007a30:	68 ac 16 01 c0       	push   $0xc00116ac
c0007a35:	e8 33 f2 ff ff       	call   c0006c6d <set_bits>
c0007a3a:	83 c4 10             	add    $0x10,%esp
c0007a3d:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0007a44:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007a47:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007a4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a4d:	83 c0 07             	add    $0x7,%eax
c0007a50:	8d 50 07             	lea    0x7(%eax),%edx
c0007a53:	85 c0                	test   %eax,%eax
c0007a55:	0f 48 c2             	cmovs  %edx,%eax
c0007a58:	c1 f8 03             	sar    $0x3,%eax
c0007a5b:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007a60:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007a65:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007a6b:	01 c2                	add    %eax,%edx
c0007a6d:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007a72:	01 d0                	add    %edx,%eax
c0007a74:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007a79:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c0007a7f:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007a84:	83 ec 04             	sub    $0x4,%esp
c0007a87:	52                   	push   %edx
c0007a88:	6a 00                	push   $0x0
c0007a8a:	50                   	push   %eax
c0007a8b:	e8 5b 49 00 00       	call   c000c3eb <Memset>
c0007a90:	83 c4 10             	add    $0x10,%esp
c0007a93:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007a96:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a99:	01 d0                	add    %edx,%eax
c0007a9b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007a9e:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007aa3:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007aa8:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007aae:	85 c0                	test   %eax,%eax
c0007ab0:	0f 48 c2             	cmovs  %edx,%eax
c0007ab3:	c1 f8 0c             	sar    $0xc,%eax
c0007ab6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007ab9:	ff 75 e8             	pushl  -0x18(%ebp)
c0007abc:	6a 01                	push   $0x1
c0007abe:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ac1:	68 ac 16 01 c0       	push   $0xc00116ac
c0007ac6:	e8 a2 f1 ff ff       	call   c0006c6d <set_bits>
c0007acb:	83 c4 10             	add    $0x10,%esp
c0007ace:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007ad1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007ad4:	01 d0                	add    %edx,%eax
c0007ad6:	c1 e0 0c             	shl    $0xc,%eax
c0007ad9:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007ade:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007ae1:	83 c0 02             	add    $0x2,%eax
c0007ae4:	c1 e0 0c             	shl    $0xc,%eax
c0007ae7:	89 c2                	mov    %eax,%edx
c0007ae9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007aec:	01 d0                	add    %edx,%eax
c0007aee:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007af3:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007afa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007afd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007b00:	90                   	nop
c0007b01:	c9                   	leave  
c0007b02:	c3                   	ret    

c0007b03 <init_memory>:
c0007b03:	55                   	push   %ebp
c0007b04:	89 e5                	mov    %esp,%ebp
c0007b06:	83 ec 38             	sub    $0x38,%esp
c0007b09:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0007b10:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007b17:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007b1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007b21:	05 00 00 10 00       	add    $0x100000,%eax
c0007b26:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007b29:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b2c:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0007b2f:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007b35:	85 c0                	test   %eax,%eax
c0007b37:	0f 48 c2             	cmovs  %edx,%eax
c0007b3a:	c1 f8 0c             	sar    $0xc,%eax
c0007b3d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007b40:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007b43:	89 c2                	mov    %eax,%edx
c0007b45:	c1 ea 1f             	shr    $0x1f,%edx
c0007b48:	01 d0                	add    %edx,%eax
c0007b4a:	d1 f8                	sar    %eax
c0007b4c:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007b4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007b52:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007b55:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007b58:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007b5b:	8d 50 07             	lea    0x7(%eax),%edx
c0007b5e:	85 c0                	test   %eax,%eax
c0007b60:	0f 48 c2             	cmovs  %edx,%eax
c0007b63:	c1 f8 03             	sar    $0x3,%eax
c0007b66:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007b69:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007b6c:	8d 50 07             	lea    0x7(%eax),%edx
c0007b6f:	85 c0                	test   %eax,%eax
c0007b71:	0f 48 c2             	cmovs  %edx,%eax
c0007b74:	c1 f8 03             	sar    $0x3,%eax
c0007b77:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007b7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007b7d:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007b82:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007b87:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007b8a:	c1 e2 0c             	shl    $0xc,%edx
c0007b8d:	01 d0                	add    %edx,%eax
c0007b8f:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c0007b94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007b97:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007b9c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b9f:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007ba4:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007ba9:	83 ec 04             	sub    $0x4,%esp
c0007bac:	ff 75 d8             	pushl  -0x28(%ebp)
c0007baf:	6a 00                	push   $0x0
c0007bb1:	50                   	push   %eax
c0007bb2:	e8 34 48 00 00       	call   c000c3eb <Memset>
c0007bb7:	83 c4 10             	add    $0x10,%esp
c0007bba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007bbd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007bc0:	01 d0                	add    %edx,%eax
c0007bc2:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007bc7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007bca:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007bcf:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007bd4:	83 ec 04             	sub    $0x4,%esp
c0007bd7:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007bda:	6a 00                	push   $0x0
c0007bdc:	50                   	push   %eax
c0007bdd:	e8 09 48 00 00       	call   c000c3eb <Memset>
c0007be2:	83 c4 10             	add    $0x10,%esp
c0007be5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007be8:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007bed:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007bf0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007bf3:	01 c2                	add    %eax,%edx
c0007bf5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007bf8:	01 d0                	add    %edx,%eax
c0007bfa:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007bff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007c02:	05 00 00 10 00       	add    $0x100000,%eax
c0007c07:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007c0c:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007c11:	83 ec 04             	sub    $0x4,%esp
c0007c14:	ff 75 d8             	pushl  -0x28(%ebp)
c0007c17:	6a 00                	push   $0x0
c0007c19:	50                   	push   %eax
c0007c1a:	e8 cc 47 00 00       	call   c000c3eb <Memset>
c0007c1f:	83 c4 10             	add    $0x10,%esp
c0007c22:	83 ec 04             	sub    $0x4,%esp
c0007c25:	68 f0 00 00 00       	push   $0xf0
c0007c2a:	6a 00                	push   $0x0
c0007c2c:	68 a0 47 08 c0       	push   $0xc00847a0
c0007c31:	e8 b5 47 00 00       	call   c000c3eb <Memset>
c0007c36:	83 c4 10             	add    $0x10,%esp
c0007c39:	83 ec 0c             	sub    $0xc,%esp
c0007c3c:	68 a0 47 08 c0       	push   $0xc00847a0
c0007c41:	e8 75 fb ff ff       	call   c00077bb <init_memory_block_desc>
c0007c46:	83 c4 10             	add    $0x10,%esp
c0007c49:	90                   	nop
c0007c4a:	c9                   	leave  
c0007c4b:	c3                   	ret    

c0007c4c <intr_enable>:
c0007c4c:	55                   	push   %ebp
c0007c4d:	89 e5                	mov    %esp,%ebp
c0007c4f:	83 ec 18             	sub    $0x18,%esp
c0007c52:	e8 65 00 00 00       	call   c0007cbc <intr_get_status>
c0007c57:	83 f8 01             	cmp    $0x1,%eax
c0007c5a:	75 0c                	jne    c0007c68 <intr_enable+0x1c>
c0007c5c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007c63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c66:	eb 0b                	jmp    c0007c73 <intr_enable+0x27>
c0007c68:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c6f:	fb                   	sti    
c0007c70:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c73:	c9                   	leave  
c0007c74:	c3                   	ret    

c0007c75 <intr_disable>:
c0007c75:	55                   	push   %ebp
c0007c76:	89 e5                	mov    %esp,%ebp
c0007c78:	83 ec 18             	sub    $0x18,%esp
c0007c7b:	e8 3c 00 00 00       	call   c0007cbc <intr_get_status>
c0007c80:	83 f8 01             	cmp    $0x1,%eax
c0007c83:	75 0d                	jne    c0007c92 <intr_disable+0x1d>
c0007c85:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007c8c:	fa                   	cli    
c0007c8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c90:	eb 0a                	jmp    c0007c9c <intr_disable+0x27>
c0007c92:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007c99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c9c:	c9                   	leave  
c0007c9d:	c3                   	ret    

c0007c9e <intr_set_status>:
c0007c9e:	55                   	push   %ebp
c0007c9f:	89 e5                	mov    %esp,%ebp
c0007ca1:	83 ec 08             	sub    $0x8,%esp
c0007ca4:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ca7:	83 e0 01             	and    $0x1,%eax
c0007caa:	85 c0                	test   %eax,%eax
c0007cac:	74 07                	je     c0007cb5 <intr_set_status+0x17>
c0007cae:	e8 99 ff ff ff       	call   c0007c4c <intr_enable>
c0007cb3:	eb 05                	jmp    c0007cba <intr_set_status+0x1c>
c0007cb5:	e8 bb ff ff ff       	call   c0007c75 <intr_disable>
c0007cba:	c9                   	leave  
c0007cbb:	c3                   	ret    

c0007cbc <intr_get_status>:
c0007cbc:	55                   	push   %ebp
c0007cbd:	89 e5                	mov    %esp,%ebp
c0007cbf:	83 ec 10             	sub    $0x10,%esp
c0007cc2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007cc9:	9c                   	pushf  
c0007cca:	58                   	pop    %eax
c0007ccb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007cce:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007cd1:	c1 e8 09             	shr    $0x9,%eax
c0007cd4:	83 e0 01             	and    $0x1,%eax
c0007cd7:	c9                   	leave  
c0007cd8:	c3                   	ret    

c0007cd9 <Memcpy>:
c0007cd9:	55                   	push   %ebp
c0007cda:	89 e5                	mov    %esp,%ebp
c0007cdc:	83 ec 18             	sub    $0x18,%esp
c0007cdf:	e8 91 ff ff ff       	call   c0007c75 <intr_disable>
c0007ce4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007ce7:	83 ec 04             	sub    $0x4,%esp
c0007cea:	ff 75 10             	pushl  0x10(%ebp)
c0007ced:	ff 75 0c             	pushl  0xc(%ebp)
c0007cf0:	ff 75 08             	pushl  0x8(%ebp)
c0007cf3:	e8 c5 46 00 00       	call   c000c3bd <Memcpy2>
c0007cf8:	83 c4 10             	add    $0x10,%esp
c0007cfb:	83 ec 0c             	sub    $0xc,%esp
c0007cfe:	ff 75 f4             	pushl  -0xc(%ebp)
c0007d01:	e8 98 ff ff ff       	call   c0007c9e <intr_set_status>
c0007d06:	83 c4 10             	add    $0x10,%esp
c0007d09:	90                   	nop
c0007d0a:	c9                   	leave  
c0007d0b:	c3                   	ret    

c0007d0c <untar>:
c0007d0c:	55                   	push   %ebp
c0007d0d:	89 e5                	mov    %esp,%ebp
c0007d0f:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0007d15:	83 ec 08             	sub    $0x8,%esp
c0007d18:	6a 00                	push   $0x0
c0007d1a:	ff 75 08             	pushl  0x8(%ebp)
c0007d1d:	e8 56 e1 ff ff       	call   c0005e78 <open>
c0007d22:	83 c4 10             	add    $0x10,%esp
c0007d25:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007d28:	83 ec 0c             	sub    $0xc,%esp
c0007d2b:	68 e0 ba 00 c0       	push   $0xc000bae0
c0007d30:	e8 2c 1c 00 00       	call   c0009961 <Printf>
c0007d35:	83 c4 10             	add    $0x10,%esp
c0007d38:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007d3f:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0007d46:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007d4d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007d54:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007d5b:	e9 5e 02 00 00       	jmp    c0007fbe <untar+0x2b2>
c0007d60:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007d64:	7e 58                	jle    c0007dbe <untar+0xb2>
c0007d66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007d69:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007d6e:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007d74:	85 c0                	test   %eax,%eax
c0007d76:	0f 48 c2             	cmovs  %edx,%eax
c0007d79:	c1 f8 09             	sar    $0x9,%eax
c0007d7c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007d7f:	83 ec 04             	sub    $0x4,%esp
c0007d82:	68 00 02 00 00       	push   $0x200
c0007d87:	6a 00                	push   $0x0
c0007d89:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007d8f:	50                   	push   %eax
c0007d90:	e8 56 46 00 00       	call   c000c3eb <Memset>
c0007d95:	83 c4 10             	add    $0x10,%esp
c0007d98:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007d9b:	c1 e0 09             	shl    $0x9,%eax
c0007d9e:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007da1:	83 ec 04             	sub    $0x4,%esp
c0007da4:	50                   	push   %eax
c0007da5:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007dab:	50                   	push   %eax
c0007dac:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007daf:	e8 49 e1 ff ff       	call   c0005efd <read>
c0007db4:	83 c4 10             	add    $0x10,%esp
c0007db7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007dbe:	83 ec 04             	sub    $0x4,%esp
c0007dc1:	68 00 02 00 00       	push   $0x200
c0007dc6:	6a 00                	push   $0x0
c0007dc8:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007dce:	50                   	push   %eax
c0007dcf:	e8 17 46 00 00       	call   c000c3eb <Memset>
c0007dd4:	83 c4 10             	add    $0x10,%esp
c0007dd7:	83 ec 04             	sub    $0x4,%esp
c0007dda:	68 00 02 00 00       	push   $0x200
c0007ddf:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007de5:	50                   	push   %eax
c0007de6:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007de9:	e8 0f e1 ff ff       	call   c0005efd <read>
c0007dee:	83 c4 10             	add    $0x10,%esp
c0007df1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007df4:	83 ec 0c             	sub    $0xc,%esp
c0007df7:	68 f2 ba 00 c0       	push   $0xc000baf2
c0007dfc:	e8 60 1b 00 00       	call   c0009961 <Printf>
c0007e01:	83 c4 10             	add    $0x10,%esp
c0007e04:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007e08:	0f 84 bc 01 00 00    	je     c0007fca <untar+0x2be>
c0007e0e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007e11:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007e14:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007e1b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007e21:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007e24:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007e27:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007e2a:	83 ec 08             	sub    $0x8,%esp
c0007e2d:	6a 07                	push   $0x7
c0007e2f:	ff 75 cc             	pushl  -0x34(%ebp)
c0007e32:	e8 41 e0 ff ff       	call   c0005e78 <open>
c0007e37:	83 c4 10             	add    $0x10,%esp
c0007e3a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007e3d:	83 ec 0c             	sub    $0xc,%esp
c0007e40:	68 04 bb 00 c0       	push   $0xc000bb04
c0007e45:	e8 17 1b 00 00       	call   c0009961 <Printf>
c0007e4a:	83 c4 10             	add    $0x10,%esp
c0007e4d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007e54:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007e57:	83 c0 7c             	add    $0x7c,%eax
c0007e5a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007e5d:	83 ec 0c             	sub    $0xc,%esp
c0007e60:	ff 75 cc             	pushl  -0x34(%ebp)
c0007e63:	e8 bc 45 00 00       	call   c000c424 <Strlen>
c0007e68:	83 c4 10             	add    $0x10,%esp
c0007e6b:	85 c0                	test   %eax,%eax
c0007e6d:	75 28                	jne    c0007e97 <untar+0x18b>
c0007e6f:	83 ec 0c             	sub    $0xc,%esp
c0007e72:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007e75:	e8 aa 45 00 00       	call   c000c424 <Strlen>
c0007e7a:	83 c4 10             	add    $0x10,%esp
c0007e7d:	85 c0                	test   %eax,%eax
c0007e7f:	75 16                	jne    c0007e97 <untar+0x18b>
c0007e81:	83 ec 0c             	sub    $0xc,%esp
c0007e84:	68 16 bb 00 c0       	push   $0xc000bb16
c0007e89:	e8 d3 1a 00 00       	call   c0009961 <Printf>
c0007e8e:	83 c4 10             	add    $0x10,%esp
c0007e91:	90                   	nop
c0007e92:	e9 34 01 00 00       	jmp    c0007fcb <untar+0x2bf>
c0007e97:	83 ec 0c             	sub    $0xc,%esp
c0007e9a:	68 1d bb 00 c0       	push   $0xc000bb1d
c0007e9f:	e8 bd 1a 00 00       	call   c0009961 <Printf>
c0007ea4:	83 c4 10             	add    $0x10,%esp
c0007ea7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007eaa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007ead:	eb 1f                	jmp    c0007ece <untar+0x1c2>
c0007eaf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007eb2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007eb9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007ebc:	0f b6 00             	movzbl (%eax),%eax
c0007ebf:	0f be c0             	movsbl %al,%eax
c0007ec2:	83 e8 30             	sub    $0x30,%eax
c0007ec5:	01 d0                	add    %edx,%eax
c0007ec7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007eca:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007ece:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007ed1:	0f b6 00             	movzbl (%eax),%eax
c0007ed4:	84 c0                	test   %al,%al
c0007ed6:	75 d7                	jne    c0007eaf <untar+0x1a3>
c0007ed8:	83 ec 0c             	sub    $0xc,%esp
c0007edb:	68 2b bb 00 c0       	push   $0xc000bb2b
c0007ee0:	e8 7c 1a 00 00       	call   c0009961 <Printf>
c0007ee5:	83 c4 10             	add    $0x10,%esp
c0007ee8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007eeb:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007eee:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0007ef5:	83 ec 08             	sub    $0x8,%esp
c0007ef8:	ff 75 c0             	pushl  -0x40(%ebp)
c0007efb:	68 39 bb 00 c0       	push   $0xc000bb39
c0007f00:	e8 5c 1a 00 00       	call   c0009961 <Printf>
c0007f05:	83 c4 10             	add    $0x10,%esp
c0007f08:	83 ec 08             	sub    $0x8,%esp
c0007f0b:	ff 75 c0             	pushl  -0x40(%ebp)
c0007f0e:	68 4b bb 00 c0       	push   $0xc000bb4b
c0007f13:	e8 49 1a 00 00       	call   c0009961 <Printf>
c0007f18:	83 c4 10             	add    $0x10,%esp
c0007f1b:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007f1e:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0007f21:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0007f25:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007f28:	83 ec 04             	sub    $0x4,%esp
c0007f2b:	ff 75 b8             	pushl  -0x48(%ebp)
c0007f2e:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007f34:	50                   	push   %eax
c0007f35:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007f38:	e8 c0 df ff ff       	call   c0005efd <read>
c0007f3d:	83 c4 10             	add    $0x10,%esp
c0007f40:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007f43:	83 ec 04             	sub    $0x4,%esp
c0007f46:	ff 75 b8             	pushl  -0x48(%ebp)
c0007f49:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007f4f:	50                   	push   %eax
c0007f50:	ff 75 c8             	pushl  -0x38(%ebp)
c0007f53:	e8 19 e0 ff ff       	call   c0005f71 <write>
c0007f58:	83 c4 10             	add    $0x10,%esp
c0007f5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007f5e:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0007f61:	7d 02                	jge    c0007f65 <untar+0x259>
c0007f63:	eb c3                	jmp    c0007f28 <untar+0x21c>
c0007f65:	90                   	nop
c0007f66:	83 ec 08             	sub    $0x8,%esp
c0007f69:	ff 75 f4             	pushl  -0xc(%ebp)
c0007f6c:	68 5d bb 00 c0       	push   $0xc000bb5d
c0007f71:	e8 eb 19 00 00       	call   c0009961 <Printf>
c0007f76:	83 c4 10             	add    $0x10,%esp
c0007f79:	83 ec 08             	sub    $0x8,%esp
c0007f7c:	ff 75 c0             	pushl  -0x40(%ebp)
c0007f7f:	68 6f bb 00 c0       	push   $0xc000bb6f
c0007f84:	e8 d8 19 00 00       	call   c0009961 <Printf>
c0007f89:	83 c4 10             	add    $0x10,%esp
c0007f8c:	83 ec 0c             	sub    $0xc,%esp
c0007f8f:	68 80 bb 00 c0       	push   $0xc000bb80
c0007f94:	e8 c8 19 00 00       	call   c0009961 <Printf>
c0007f99:	83 c4 10             	add    $0x10,%esp
c0007f9c:	83 ec 0c             	sub    $0xc,%esp
c0007f9f:	ff 75 c8             	pushl  -0x38(%ebp)
c0007fa2:	e8 3e e0 ff ff       	call   c0005fe5 <close>
c0007fa7:	83 c4 10             	add    $0x10,%esp
c0007faa:	83 ec 0c             	sub    $0xc,%esp
c0007fad:	68 8e bb 00 c0       	push   $0xc000bb8e
c0007fb2:	e8 aa 19 00 00       	call   c0009961 <Printf>
c0007fb7:	83 c4 10             	add    $0x10,%esp
c0007fba:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0007fbe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0007fc2:	0f 8f 98 fd ff ff    	jg     c0007d60 <untar+0x54>
c0007fc8:	eb 01                	jmp    c0007fcb <untar+0x2bf>
c0007fca:	90                   	nop
c0007fcb:	83 ec 0c             	sub    $0xc,%esp
c0007fce:	68 9b bb 00 c0       	push   $0xc000bb9b
c0007fd3:	e8 89 19 00 00       	call   c0009961 <Printf>
c0007fd8:	83 c4 10             	add    $0x10,%esp
c0007fdb:	83 ec 0c             	sub    $0xc,%esp
c0007fde:	68 ad bb 00 c0       	push   $0xc000bbad
c0007fe3:	e8 79 19 00 00       	call   c0009961 <Printf>
c0007fe8:	83 c4 10             	add    $0x10,%esp
c0007feb:	83 ec 0c             	sub    $0xc,%esp
c0007fee:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007ff1:	e8 ef df ff ff       	call   c0005fe5 <close>
c0007ff6:	83 c4 10             	add    $0x10,%esp
c0007ff9:	83 ec 0c             	sub    $0xc,%esp
c0007ffc:	68 bd bb 00 c0       	push   $0xc000bbbd
c0008001:	e8 5b 19 00 00       	call   c0009961 <Printf>
c0008006:	83 c4 10             	add    $0x10,%esp
c0008009:	83 ec 0c             	sub    $0xc,%esp
c000800c:	68 d0 bb 00 c0       	push   $0xc000bbd0
c0008011:	e8 4b 19 00 00       	call   c0009961 <Printf>
c0008016:	83 c4 10             	add    $0x10,%esp
c0008019:	90                   	nop
c000801a:	c9                   	leave  
c000801b:	c3                   	ret    

c000801c <atoi>:
c000801c:	55                   	push   %ebp
c000801d:	89 e5                	mov    %esp,%ebp
c000801f:	83 ec 10             	sub    $0x10,%esp
c0008022:	8b 45 08             	mov    0x8(%ebp),%eax
c0008025:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0008028:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000802b:	8d 50 01             	lea    0x1(%eax),%edx
c000802e:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0008031:	c6 00 30             	movb   $0x30,(%eax)
c0008034:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008037:	8d 50 01             	lea    0x1(%eax),%edx
c000803a:	89 55 fc             	mov    %edx,-0x4(%ebp)
c000803d:	c6 00 78             	movb   $0x78,(%eax)
c0008040:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c0008044:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0008048:	75 0e                	jne    c0008058 <atoi+0x3c>
c000804a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000804d:	8d 50 01             	lea    0x1(%eax),%edx
c0008050:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0008053:	c6 00 30             	movb   $0x30,(%eax)
c0008056:	eb 61                	jmp    c00080b9 <atoi+0x9d>
c0008058:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c000805f:	eb 52                	jmp    c00080b3 <atoi+0x97>
c0008061:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008064:	8b 55 0c             	mov    0xc(%ebp),%edx
c0008067:	89 c1                	mov    %eax,%ecx
c0008069:	d3 fa                	sar    %cl,%edx
c000806b:	89 d0                	mov    %edx,%eax
c000806d:	83 e0 0f             	and    $0xf,%eax
c0008070:	88 45 fb             	mov    %al,-0x5(%ebp)
c0008073:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0008077:	75 06                	jne    c000807f <atoi+0x63>
c0008079:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c000807d:	74 2f                	je     c00080ae <atoi+0x92>
c000807f:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0008083:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0008087:	83 c0 30             	add    $0x30,%eax
c000808a:	88 45 fb             	mov    %al,-0x5(%ebp)
c000808d:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0008091:	7e 0a                	jle    c000809d <atoi+0x81>
c0008093:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0008097:	83 c0 07             	add    $0x7,%eax
c000809a:	88 45 fb             	mov    %al,-0x5(%ebp)
c000809d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00080a0:	8d 50 01             	lea    0x1(%eax),%edx
c00080a3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00080a6:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c00080aa:	88 10                	mov    %dl,(%eax)
c00080ac:	eb 01                	jmp    c00080af <atoi+0x93>
c00080ae:	90                   	nop
c00080af:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c00080b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00080b7:	79 a8                	jns    c0008061 <atoi+0x45>
c00080b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00080bc:	c6 00 00             	movb   $0x0,(%eax)
c00080bf:	90                   	nop
c00080c0:	c9                   	leave  
c00080c1:	c3                   	ret    

c00080c2 <disp_int>:
c00080c2:	55                   	push   %ebp
c00080c3:	89 e5                	mov    %esp,%ebp
c00080c5:	83 ec 18             	sub    $0x18,%esp
c00080c8:	ff 75 08             	pushl  0x8(%ebp)
c00080cb:	8d 45 ee             	lea    -0x12(%ebp),%eax
c00080ce:	50                   	push   %eax
c00080cf:	e8 48 ff ff ff       	call   c000801c <atoi>
c00080d4:	83 c4 08             	add    $0x8,%esp
c00080d7:	83 ec 08             	sub    $0x8,%esp
c00080da:	6a 0b                	push   $0xb
c00080dc:	8d 45 ee             	lea    -0x12(%ebp),%eax
c00080df:	50                   	push   %eax
c00080e0:	e8 e2 94 ff ff       	call   c00015c7 <disp_str_colour>
c00080e5:	83 c4 10             	add    $0x10,%esp
c00080e8:	90                   	nop
c00080e9:	c9                   	leave  
c00080ea:	c3                   	ret    

c00080eb <do_page_fault>:
c00080eb:	55                   	push   %ebp
c00080ec:	89 e5                	mov    %esp,%ebp
c00080ee:	83 ec 28             	sub    $0x28,%esp
c00080f1:	0f 20 d0             	mov    %cr2,%eax
c00080f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00080f7:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00080fe:	00 00 00 
c0008101:	83 ec 0c             	sub    $0xc,%esp
c0008104:	68 db bb 00 c0       	push   $0xc000bbdb
c0008109:	e8 7e 94 ff ff       	call   c000158c <disp_str>
c000810e:	83 c4 10             	add    $0x10,%esp
c0008111:	83 ec 0c             	sub    $0xc,%esp
c0008114:	68 ea bb 00 c0       	push   $0xc000bbea
c0008119:	e8 6e 94 ff ff       	call   c000158c <disp_str>
c000811e:	83 c4 10             	add    $0x10,%esp
c0008121:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008124:	83 ec 0c             	sub    $0xc,%esp
c0008127:	50                   	push   %eax
c0008128:	e8 95 ff ff ff       	call   c00080c2 <disp_int>
c000812d:	83 c4 10             	add    $0x10,%esp
c0008130:	83 ec 0c             	sub    $0xc,%esp
c0008133:	68 ef bb 00 c0       	push   $0xc000bbef
c0008138:	e8 4f 94 ff ff       	call   c000158c <disp_str>
c000813d:	83 c4 10             	add    $0x10,%esp
c0008140:	83 ec 0c             	sub    $0xc,%esp
c0008143:	ff 75 f4             	pushl  -0xc(%ebp)
c0008146:	e8 b6 ed ff ff       	call   c0006f01 <ptr_pde>
c000814b:	83 c4 10             	add    $0x10,%esp
c000814e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008151:	83 ec 0c             	sub    $0xc,%esp
c0008154:	ff 75 f4             	pushl  -0xc(%ebp)
c0008157:	e8 b8 ed ff ff       	call   c0006f14 <ptr_pte>
c000815c:	83 c4 10             	add    $0x10,%esp
c000815f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008162:	83 ec 0c             	sub    $0xc,%esp
c0008165:	68 f1 bb 00 c0       	push   $0xc000bbf1
c000816a:	e8 1d 94 ff ff       	call   c000158c <disp_str>
c000816f:	83 c4 10             	add    $0x10,%esp
c0008172:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008175:	83 ec 0c             	sub    $0xc,%esp
c0008178:	50                   	push   %eax
c0008179:	e8 44 ff ff ff       	call   c00080c2 <disp_int>
c000817e:	83 c4 10             	add    $0x10,%esp
c0008181:	83 ec 0c             	sub    $0xc,%esp
c0008184:	68 f6 bb 00 c0       	push   $0xc000bbf6
c0008189:	e8 fe 93 ff ff       	call   c000158c <disp_str>
c000818e:	83 c4 10             	add    $0x10,%esp
c0008191:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008194:	8b 00                	mov    (%eax),%eax
c0008196:	83 ec 0c             	sub    $0xc,%esp
c0008199:	50                   	push   %eax
c000819a:	e8 23 ff ff ff       	call   c00080c2 <disp_int>
c000819f:	83 c4 10             	add    $0x10,%esp
c00081a2:	83 ec 0c             	sub    $0xc,%esp
c00081a5:	68 ef bb 00 c0       	push   $0xc000bbef
c00081aa:	e8 dd 93 ff ff       	call   c000158c <disp_str>
c00081af:	83 c4 10             	add    $0x10,%esp
c00081b2:	83 ec 0c             	sub    $0xc,%esp
c00081b5:	68 ff bb 00 c0       	push   $0xc000bbff
c00081ba:	e8 cd 93 ff ff       	call   c000158c <disp_str>
c00081bf:	83 c4 10             	add    $0x10,%esp
c00081c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00081c5:	83 ec 0c             	sub    $0xc,%esp
c00081c8:	50                   	push   %eax
c00081c9:	e8 f4 fe ff ff       	call   c00080c2 <disp_int>
c00081ce:	83 c4 10             	add    $0x10,%esp
c00081d1:	83 ec 0c             	sub    $0xc,%esp
c00081d4:	68 04 bc 00 c0       	push   $0xc000bc04
c00081d9:	e8 ae 93 ff ff       	call   c000158c <disp_str>
c00081de:	83 c4 10             	add    $0x10,%esp
c00081e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00081e4:	8b 00                	mov    (%eax),%eax
c00081e6:	83 ec 0c             	sub    $0xc,%esp
c00081e9:	50                   	push   %eax
c00081ea:	e8 d3 fe ff ff       	call   c00080c2 <disp_int>
c00081ef:	83 c4 10             	add    $0x10,%esp
c00081f2:	83 ec 0c             	sub    $0xc,%esp
c00081f5:	68 ef bb 00 c0       	push   $0xc000bbef
c00081fa:	e8 8d 93 ff ff       	call   c000158c <disp_str>
c00081ff:	83 c4 10             	add    $0x10,%esp
c0008202:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0008209:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000820c:	8b 00                	mov    (%eax),%eax
c000820e:	83 e0 01             	and    $0x1,%eax
c0008211:	85 c0                	test   %eax,%eax
c0008213:	74 09                	je     c000821e <do_page_fault+0x133>
c0008215:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c000821c:	eb 07                	jmp    c0008225 <do_page_fault+0x13a>
c000821e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008225:	90                   	nop
c0008226:	c9                   	leave  
c0008227:	c3                   	ret    

c0008228 <exception_handler>:
c0008228:	55                   	push   %ebp
c0008229:	89 e5                	mov    %esp,%ebp
c000822b:	57                   	push   %edi
c000822c:	56                   	push   %esi
c000822d:	53                   	push   %ebx
c000822e:	83 ec 6c             	sub    $0x6c,%esp
c0008231:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0008234:	bb 80 be 00 c0       	mov    $0xc000be80,%ebx
c0008239:	ba 13 00 00 00       	mov    $0x13,%edx
c000823e:	89 c7                	mov    %eax,%edi
c0008240:	89 de                	mov    %ebx,%esi
c0008242:	89 d1                	mov    %edx,%ecx
c0008244:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008246:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000824d:	eb 04                	jmp    c0008253 <exception_handler+0x2b>
c000824f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008253:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c000825a:	7e f3                	jle    c000824f <exception_handler+0x27>
c000825c:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008263:	00 00 00 
c0008266:	83 ec 0c             	sub    $0xc,%esp
c0008269:	68 0d bc 00 c0       	push   $0xc000bc0d
c000826e:	e8 19 93 ff ff       	call   c000158c <disp_str>
c0008273:	83 c4 10             	add    $0x10,%esp
c0008276:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c000827d:	8b 45 08             	mov    0x8(%ebp),%eax
c0008280:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0008284:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008287:	83 ec 0c             	sub    $0xc,%esp
c000828a:	ff 75 dc             	pushl  -0x24(%ebp)
c000828d:	e8 fa 92 ff ff       	call   c000158c <disp_str>
c0008292:	83 c4 10             	add    $0x10,%esp
c0008295:	83 ec 0c             	sub    $0xc,%esp
c0008298:	68 1b bc 00 c0       	push   $0xc000bc1b
c000829d:	e8 ea 92 ff ff       	call   c000158c <disp_str>
c00082a2:	83 c4 10             	add    $0x10,%esp
c00082a5:	83 ec 0c             	sub    $0xc,%esp
c00082a8:	68 1e bc 00 c0       	push   $0xc000bc1e
c00082ad:	e8 da 92 ff ff       	call   c000158c <disp_str>
c00082b2:	83 c4 10             	add    $0x10,%esp
c00082b5:	8b 45 08             	mov    0x8(%ebp),%eax
c00082b8:	83 ec 0c             	sub    $0xc,%esp
c00082bb:	50                   	push   %eax
c00082bc:	e8 01 fe ff ff       	call   c00080c2 <disp_int>
c00082c1:	83 c4 10             	add    $0x10,%esp
c00082c4:	83 ec 0c             	sub    $0xc,%esp
c00082c7:	68 1b bc 00 c0       	push   $0xc000bc1b
c00082cc:	e8 bb 92 ff ff       	call   c000158c <disp_str>
c00082d1:	83 c4 10             	add    $0x10,%esp
c00082d4:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c00082d8:	74 2f                	je     c0008309 <exception_handler+0xe1>
c00082da:	83 ec 0c             	sub    $0xc,%esp
c00082dd:	68 26 bc 00 c0       	push   $0xc000bc26
c00082e2:	e8 a5 92 ff ff       	call   c000158c <disp_str>
c00082e7:	83 c4 10             	add    $0x10,%esp
c00082ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c00082ed:	83 ec 0c             	sub    $0xc,%esp
c00082f0:	50                   	push   %eax
c00082f1:	e8 cc fd ff ff       	call   c00080c2 <disp_int>
c00082f6:	83 c4 10             	add    $0x10,%esp
c00082f9:	83 ec 0c             	sub    $0xc,%esp
c00082fc:	68 1b bc 00 c0       	push   $0xc000bc1b
c0008301:	e8 86 92 ff ff       	call   c000158c <disp_str>
c0008306:	83 c4 10             	add    $0x10,%esp
c0008309:	83 ec 0c             	sub    $0xc,%esp
c000830c:	68 30 bc 00 c0       	push   $0xc000bc30
c0008311:	e8 76 92 ff ff       	call   c000158c <disp_str>
c0008316:	83 c4 10             	add    $0x10,%esp
c0008319:	83 ec 0c             	sub    $0xc,%esp
c000831c:	ff 75 14             	pushl  0x14(%ebp)
c000831f:	e8 9e fd ff ff       	call   c00080c2 <disp_int>
c0008324:	83 c4 10             	add    $0x10,%esp
c0008327:	83 ec 0c             	sub    $0xc,%esp
c000832a:	68 1b bc 00 c0       	push   $0xc000bc1b
c000832f:	e8 58 92 ff ff       	call   c000158c <disp_str>
c0008334:	83 c4 10             	add    $0x10,%esp
c0008337:	83 ec 0c             	sub    $0xc,%esp
c000833a:	68 34 bc 00 c0       	push   $0xc000bc34
c000833f:	e8 48 92 ff ff       	call   c000158c <disp_str>
c0008344:	83 c4 10             	add    $0x10,%esp
c0008347:	8b 45 10             	mov    0x10(%ebp),%eax
c000834a:	83 ec 0c             	sub    $0xc,%esp
c000834d:	50                   	push   %eax
c000834e:	e8 6f fd ff ff       	call   c00080c2 <disp_int>
c0008353:	83 c4 10             	add    $0x10,%esp
c0008356:	83 ec 0c             	sub    $0xc,%esp
c0008359:	68 1b bc 00 c0       	push   $0xc000bc1b
c000835e:	e8 29 92 ff ff       	call   c000158c <disp_str>
c0008363:	83 c4 10             	add    $0x10,%esp
c0008366:	83 ec 0c             	sub    $0xc,%esp
c0008369:	68 39 bc 00 c0       	push   $0xc000bc39
c000836e:	e8 19 92 ff ff       	call   c000158c <disp_str>
c0008373:	83 c4 10             	add    $0x10,%esp
c0008376:	83 ec 0c             	sub    $0xc,%esp
c0008379:	ff 75 18             	pushl  0x18(%ebp)
c000837c:	e8 41 fd ff ff       	call   c00080c2 <disp_int>
c0008381:	83 c4 10             	add    $0x10,%esp
c0008384:	83 ec 0c             	sub    $0xc,%esp
c0008387:	68 1b bc 00 c0       	push   $0xc000bc1b
c000838c:	e8 fb 91 ff ff       	call   c000158c <disp_str>
c0008391:	83 c4 10             	add    $0x10,%esp
c0008394:	83 ec 0c             	sub    $0xc,%esp
c0008397:	68 44 bc 00 c0       	push   $0xc000bc44
c000839c:	e8 eb 91 ff ff       	call   c000158c <disp_str>
c00083a1:	83 c4 10             	add    $0x10,%esp
c00083a4:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c00083a8:	75 45                	jne    c00083ef <exception_handler+0x1c7>
c00083aa:	0f 20 d0             	mov    %cr2,%eax
c00083ad:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00083b0:	83 ec 0c             	sub    $0xc,%esp
c00083b3:	68 63 bc 00 c0       	push   $0xc000bc63
c00083b8:	e8 cf 91 ff ff       	call   c000158c <disp_str>
c00083bd:	83 c4 10             	add    $0x10,%esp
c00083c0:	83 ec 0c             	sub    $0xc,%esp
c00083c3:	68 ea bb 00 c0       	push   $0xc000bbea
c00083c8:	e8 bf 91 ff ff       	call   c000158c <disp_str>
c00083cd:	83 c4 10             	add    $0x10,%esp
c00083d0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083d3:	83 ec 0c             	sub    $0xc,%esp
c00083d6:	50                   	push   %eax
c00083d7:	e8 e6 fc ff ff       	call   c00080c2 <disp_int>
c00083dc:	83 c4 10             	add    $0x10,%esp
c00083df:	83 ec 0c             	sub    $0xc,%esp
c00083e2:	68 ef bb 00 c0       	push   $0xc000bbef
c00083e7:	e8 a0 91 ff ff       	call   c000158c <disp_str>
c00083ec:	83 c4 10             	add    $0x10,%esp
c00083ef:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c00083f3:	75 11                	jne    c0008406 <exception_handler+0x1de>
c00083f5:	83 ec 0c             	sub    $0xc,%esp
c00083f8:	68 6f bc 00 c0       	push   $0xc000bc6f
c00083fd:	e8 8a 91 ff ff       	call   c000158c <disp_str>
c0008402:	83 c4 10             	add    $0x10,%esp
c0008405:	90                   	nop
c0008406:	90                   	nop
c0008407:	8d 65 f4             	lea    -0xc(%ebp),%esp
c000840a:	5b                   	pop    %ebx
c000840b:	5e                   	pop    %esi
c000840c:	5f                   	pop    %edi
c000840d:	5d                   	pop    %ebp
c000840e:	c3                   	ret    

c000840f <exception_handler2>:
c000840f:	55                   	push   %ebp
c0008410:	89 e5                	mov    %esp,%ebp
c0008412:	57                   	push   %edi
c0008413:	56                   	push   %esi
c0008414:	53                   	push   %ebx
c0008415:	83 ec 6c             	sub    $0x6c,%esp
c0008418:	8d 45 90             	lea    -0x70(%ebp),%eax
c000841b:	bb 80 be 00 c0       	mov    $0xc000be80,%ebx
c0008420:	ba 13 00 00 00       	mov    $0x13,%edx
c0008425:	89 c7                	mov    %eax,%edi
c0008427:	89 de                	mov    %ebx,%esi
c0008429:	89 d1                	mov    %edx,%ecx
c000842b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c000842d:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c0008434:	2e 00 00 
c0008437:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000843e:	eb 14                	jmp    c0008454 <exception_handler2+0x45>
c0008440:	83 ec 0c             	sub    $0xc,%esp
c0008443:	68 cc be 00 c0       	push   $0xc000becc
c0008448:	e8 3f 91 ff ff       	call   c000158c <disp_str>
c000844d:	83 c4 10             	add    $0x10,%esp
c0008450:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008454:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c000845b:	7e e3                	jle    c0008440 <exception_handler2+0x31>
c000845d:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c0008464:	2e 00 00 
c0008467:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c000846e:	8b 45 08             	mov    0x8(%ebp),%eax
c0008471:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0008475:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008478:	83 ec 08             	sub    $0x8,%esp
c000847b:	ff 75 e0             	pushl  -0x20(%ebp)
c000847e:	ff 75 dc             	pushl  -0x24(%ebp)
c0008481:	e8 41 91 ff ff       	call   c00015c7 <disp_str_colour>
c0008486:	83 c4 10             	add    $0x10,%esp
c0008489:	83 ec 0c             	sub    $0xc,%esp
c000848c:	68 1b bc 00 c0       	push   $0xc000bc1b
c0008491:	e8 f6 90 ff ff       	call   c000158c <disp_str>
c0008496:	83 c4 10             	add    $0x10,%esp
c0008499:	83 ec 08             	sub    $0x8,%esp
c000849c:	ff 75 e0             	pushl  -0x20(%ebp)
c000849f:	68 1e bc 00 c0       	push   $0xc000bc1e
c00084a4:	e8 1e 91 ff ff       	call   c00015c7 <disp_str_colour>
c00084a9:	83 c4 10             	add    $0x10,%esp
c00084ac:	83 ec 0c             	sub    $0xc,%esp
c00084af:	ff 75 08             	pushl  0x8(%ebp)
c00084b2:	e8 0b fc ff ff       	call   c00080c2 <disp_int>
c00084b7:	83 c4 10             	add    $0x10,%esp
c00084ba:	83 ec 0c             	sub    $0xc,%esp
c00084bd:	68 1b bc 00 c0       	push   $0xc000bc1b
c00084c2:	e8 c5 90 ff ff       	call   c000158c <disp_str>
c00084c7:	83 c4 10             	add    $0x10,%esp
c00084ca:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c00084ce:	74 44                	je     c0008514 <exception_handler2+0x105>
c00084d0:	83 ec 08             	sub    $0x8,%esp
c00084d3:	ff 75 e0             	pushl  -0x20(%ebp)
c00084d6:	68 26 bc 00 c0       	push   $0xc000bc26
c00084db:	e8 e7 90 ff ff       	call   c00015c7 <disp_str_colour>
c00084e0:	83 c4 10             	add    $0x10,%esp
c00084e3:	83 ec 08             	sub    $0x8,%esp
c00084e6:	ff 75 e0             	pushl  -0x20(%ebp)
c00084e9:	68 26 bc 00 c0       	push   $0xc000bc26
c00084ee:	e8 d4 90 ff ff       	call   c00015c7 <disp_str_colour>
c00084f3:	83 c4 10             	add    $0x10,%esp
c00084f6:	83 ec 0c             	sub    $0xc,%esp
c00084f9:	ff 75 0c             	pushl  0xc(%ebp)
c00084fc:	e8 c1 fb ff ff       	call   c00080c2 <disp_int>
c0008501:	83 c4 10             	add    $0x10,%esp
c0008504:	83 ec 0c             	sub    $0xc,%esp
c0008507:	68 1b bc 00 c0       	push   $0xc000bc1b
c000850c:	e8 7b 90 ff ff       	call   c000158c <disp_str>
c0008511:	83 c4 10             	add    $0x10,%esp
c0008514:	83 ec 08             	sub    $0x8,%esp
c0008517:	ff 75 e0             	pushl  -0x20(%ebp)
c000851a:	68 30 bc 00 c0       	push   $0xc000bc30
c000851f:	e8 a3 90 ff ff       	call   c00015c7 <disp_str_colour>
c0008524:	83 c4 10             	add    $0x10,%esp
c0008527:	83 ec 0c             	sub    $0xc,%esp
c000852a:	ff 75 14             	pushl  0x14(%ebp)
c000852d:	e8 90 fb ff ff       	call   c00080c2 <disp_int>
c0008532:	83 c4 10             	add    $0x10,%esp
c0008535:	83 ec 0c             	sub    $0xc,%esp
c0008538:	68 1b bc 00 c0       	push   $0xc000bc1b
c000853d:	e8 4a 90 ff ff       	call   c000158c <disp_str>
c0008542:	83 c4 10             	add    $0x10,%esp
c0008545:	83 ec 08             	sub    $0x8,%esp
c0008548:	ff 75 e0             	pushl  -0x20(%ebp)
c000854b:	68 34 bc 00 c0       	push   $0xc000bc34
c0008550:	e8 72 90 ff ff       	call   c00015c7 <disp_str_colour>
c0008555:	83 c4 10             	add    $0x10,%esp
c0008558:	83 ec 0c             	sub    $0xc,%esp
c000855b:	ff 75 10             	pushl  0x10(%ebp)
c000855e:	e8 5f fb ff ff       	call   c00080c2 <disp_int>
c0008563:	83 c4 10             	add    $0x10,%esp
c0008566:	83 ec 0c             	sub    $0xc,%esp
c0008569:	68 1b bc 00 c0       	push   $0xc000bc1b
c000856e:	e8 19 90 ff ff       	call   c000158c <disp_str>
c0008573:	83 c4 10             	add    $0x10,%esp
c0008576:	83 ec 08             	sub    $0x8,%esp
c0008579:	ff 75 e0             	pushl  -0x20(%ebp)
c000857c:	68 39 bc 00 c0       	push   $0xc000bc39
c0008581:	e8 41 90 ff ff       	call   c00015c7 <disp_str_colour>
c0008586:	83 c4 10             	add    $0x10,%esp
c0008589:	83 ec 0c             	sub    $0xc,%esp
c000858c:	ff 75 18             	pushl  0x18(%ebp)
c000858f:	e8 2e fb ff ff       	call   c00080c2 <disp_int>
c0008594:	83 c4 10             	add    $0x10,%esp
c0008597:	83 ec 0c             	sub    $0xc,%esp
c000859a:	68 1b bc 00 c0       	push   $0xc000bc1b
c000859f:	e8 e8 8f ff ff       	call   c000158c <disp_str>
c00085a4:	83 c4 10             	add    $0x10,%esp
c00085a7:	90                   	nop
c00085a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00085ab:	5b                   	pop    %ebx
c00085ac:	5e                   	pop    %esi
c00085ad:	5f                   	pop    %edi
c00085ae:	5d                   	pop    %ebp
c00085af:	c3                   	ret    

c00085b0 <init_internal_interrupt>:
c00085b0:	55                   	push   %ebp
c00085b1:	89 e5                	mov    %esp,%ebp
c00085b3:	83 ec 08             	sub    $0x8,%esp
c00085b6:	6a 0e                	push   $0xe
c00085b8:	6a 08                	push   $0x8
c00085ba:	68 03 16 00 c0       	push   $0xc0001603
c00085bf:	6a 00                	push   $0x0
c00085c1:	e8 02 c9 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00085c6:	83 c4 10             	add    $0x10,%esp
c00085c9:	6a 0e                	push   $0xe
c00085cb:	6a 08                	push   $0x8
c00085cd:	68 09 16 00 c0       	push   $0xc0001609
c00085d2:	6a 01                	push   $0x1
c00085d4:	e8 ef c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00085d9:	83 c4 10             	add    $0x10,%esp
c00085dc:	6a 0e                	push   $0xe
c00085de:	6a 08                	push   $0x8
c00085e0:	68 0f 16 00 c0       	push   $0xc000160f
c00085e5:	6a 02                	push   $0x2
c00085e7:	e8 dc c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00085ec:	83 c4 10             	add    $0x10,%esp
c00085ef:	6a 0e                	push   $0xe
c00085f1:	6a 08                	push   $0x8
c00085f3:	68 15 16 00 c0       	push   $0xc0001615
c00085f8:	6a 03                	push   $0x3
c00085fa:	e8 c9 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00085ff:	83 c4 10             	add    $0x10,%esp
c0008602:	6a 0e                	push   $0xe
c0008604:	6a 08                	push   $0x8
c0008606:	68 1b 16 00 c0       	push   $0xc000161b
c000860b:	6a 04                	push   $0x4
c000860d:	e8 b6 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008612:	83 c4 10             	add    $0x10,%esp
c0008615:	6a 0e                	push   $0xe
c0008617:	6a 08                	push   $0x8
c0008619:	68 21 16 00 c0       	push   $0xc0001621
c000861e:	6a 05                	push   $0x5
c0008620:	e8 a3 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008625:	83 c4 10             	add    $0x10,%esp
c0008628:	6a 0e                	push   $0xe
c000862a:	6a 08                	push   $0x8
c000862c:	68 27 16 00 c0       	push   $0xc0001627
c0008631:	6a 06                	push   $0x6
c0008633:	e8 90 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008638:	83 c4 10             	add    $0x10,%esp
c000863b:	6a 0e                	push   $0xe
c000863d:	6a 08                	push   $0x8
c000863f:	68 2d 16 00 c0       	push   $0xc000162d
c0008644:	6a 07                	push   $0x7
c0008646:	e8 7d c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c000864b:	83 c4 10             	add    $0x10,%esp
c000864e:	6a 0e                	push   $0xe
c0008650:	6a 08                	push   $0x8
c0008652:	68 33 16 00 c0       	push   $0xc0001633
c0008657:	6a 08                	push   $0x8
c0008659:	e8 6a c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c000865e:	83 c4 10             	add    $0x10,%esp
c0008661:	6a 0e                	push   $0xe
c0008663:	6a 08                	push   $0x8
c0008665:	68 37 16 00 c0       	push   $0xc0001637
c000866a:	6a 09                	push   $0x9
c000866c:	e8 57 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008671:	83 c4 10             	add    $0x10,%esp
c0008674:	6a 0e                	push   $0xe
c0008676:	6a 08                	push   $0x8
c0008678:	68 3d 16 00 c0       	push   $0xc000163d
c000867d:	6a 0a                	push   $0xa
c000867f:	e8 44 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008684:	83 c4 10             	add    $0x10,%esp
c0008687:	6a 0e                	push   $0xe
c0008689:	6a 08                	push   $0x8
c000868b:	68 41 16 00 c0       	push   $0xc0001641
c0008690:	6a 0b                	push   $0xb
c0008692:	e8 31 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008697:	83 c4 10             	add    $0x10,%esp
c000869a:	6a 0e                	push   $0xe
c000869c:	6a 08                	push   $0x8
c000869e:	68 45 16 00 c0       	push   $0xc0001645
c00086a3:	6a 0c                	push   $0xc
c00086a5:	e8 1e c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086aa:	83 c4 10             	add    $0x10,%esp
c00086ad:	6a 0e                	push   $0xe
c00086af:	6a 08                	push   $0x8
c00086b1:	68 49 16 00 c0       	push   $0xc0001649
c00086b6:	6a 0d                	push   $0xd
c00086b8:	e8 0b c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086bd:	83 c4 10             	add    $0x10,%esp
c00086c0:	6a 0e                	push   $0xe
c00086c2:	6a 08                	push   $0x8
c00086c4:	68 54 16 00 c0       	push   $0xc0001654
c00086c9:	6a 0e                	push   $0xe
c00086cb:	e8 f8 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086d0:	83 c4 10             	add    $0x10,%esp
c00086d3:	6a 0e                	push   $0xe
c00086d5:	6a 08                	push   $0x8
c00086d7:	68 58 16 00 c0       	push   $0xc0001658
c00086dc:	6a 10                	push   $0x10
c00086de:	e8 e5 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086e3:	83 c4 10             	add    $0x10,%esp
c00086e6:	6a 0e                	push   $0xe
c00086e8:	6a 08                	push   $0x8
c00086ea:	68 5e 16 00 c0       	push   $0xc000165e
c00086ef:	6a 11                	push   $0x11
c00086f1:	e8 d2 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086f6:	83 c4 10             	add    $0x10,%esp
c00086f9:	6a 0e                	push   $0xe
c00086fb:	6a 08                	push   $0x8
c00086fd:	68 62 16 00 c0       	push   $0xc0001662
c0008702:	6a 12                	push   $0x12
c0008704:	e8 bf c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008709:	83 c4 10             	add    $0x10,%esp
c000870c:	6a 0e                	push   $0xe
c000870e:	6a 0e                	push   $0xe
c0008710:	68 1e 17 00 c0       	push   $0xc000171e
c0008715:	68 90 00 00 00       	push   $0x90
c000871a:	e8 a9 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c000871f:	83 c4 10             	add    $0x10,%esp
c0008722:	90                   	nop
c0008723:	c9                   	leave  
c0008724:	c3                   	ret    

c0008725 <test>:
c0008725:	55                   	push   %ebp
c0008726:	89 e5                	mov    %esp,%ebp
c0008728:	83 ec 08             	sub    $0x8,%esp
c000872b:	83 ec 0c             	sub    $0xc,%esp
c000872e:	68 ce be 00 c0       	push   $0xc000bece
c0008733:	e8 54 8e ff ff       	call   c000158c <disp_str>
c0008738:	83 c4 10             	add    $0x10,%esp
c000873b:	83 ec 0c             	sub    $0xc,%esp
c000873e:	68 ef bb 00 c0       	push   $0xc000bbef
c0008743:	e8 44 8e ff ff       	call   c000158c <disp_str>
c0008748:	83 c4 10             	add    $0x10,%esp
c000874b:	90                   	nop
c000874c:	c9                   	leave  
c000874d:	c3                   	ret    

c000874e <disp_str_colour3>:
c000874e:	55                   	push   %ebp
c000874f:	89 e5                	mov    %esp,%ebp
c0008751:	90                   	nop
c0008752:	5d                   	pop    %ebp
c0008753:	c3                   	ret    

c0008754 <spurious_irq>:
c0008754:	55                   	push   %ebp
c0008755:	89 e5                	mov    %esp,%ebp
c0008757:	83 ec 08             	sub    $0x8,%esp
c000875a:	83 ec 08             	sub    $0x8,%esp
c000875d:	6a 0b                	push   $0xb
c000875f:	68 d0 be 00 c0       	push   $0xc000bed0
c0008764:	e8 5e 8e ff ff       	call   c00015c7 <disp_str_colour>
c0008769:	83 c4 10             	add    $0x10,%esp
c000876c:	83 ec 0c             	sub    $0xc,%esp
c000876f:	ff 75 08             	pushl  0x8(%ebp)
c0008772:	e8 4b f9 ff ff       	call   c00080c2 <disp_int>
c0008777:	83 c4 10             	add    $0x10,%esp
c000877a:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000877f:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008785:	83 c0 01             	add    $0x1,%eax
c0008788:	83 d2 00             	adc    $0x0,%edx
c000878b:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c0008790:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c0008796:	83 ec 0c             	sub    $0xc,%esp
c0008799:	68 f7 be 00 c0       	push   $0xc000bef7
c000879e:	e8 e9 8d ff ff       	call   c000158c <disp_str>
c00087a3:	83 c4 10             	add    $0x10,%esp
c00087a6:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c00087ab:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c00087b1:	83 ec 0c             	sub    $0xc,%esp
c00087b4:	50                   	push   %eax
c00087b5:	e8 08 f9 ff ff       	call   c00080c2 <disp_int>
c00087ba:	83 c4 10             	add    $0x10,%esp
c00087bd:	83 ec 0c             	sub    $0xc,%esp
c00087c0:	68 f9 be 00 c0       	push   $0xc000bef9
c00087c5:	e8 c2 8d ff ff       	call   c000158c <disp_str>
c00087ca:	83 c4 10             	add    $0x10,%esp
c00087cd:	83 ec 08             	sub    $0x8,%esp
c00087d0:	6a 0c                	push   $0xc
c00087d2:	68 fc be 00 c0       	push   $0xc000befc
c00087d7:	e8 eb 8d ff ff       	call   c00015c7 <disp_str_colour>
c00087dc:	83 c4 10             	add    $0x10,%esp
c00087df:	90                   	nop
c00087e0:	c9                   	leave  
c00087e1:	c3                   	ret    

c00087e2 <init_keyboard>:
c00087e2:	55                   	push   %ebp
c00087e3:	89 e5                	mov    %esp,%ebp
c00087e5:	83 ec 18             	sub    $0x18,%esp
c00087e8:	83 ec 04             	sub    $0x4,%esp
c00087eb:	68 00 02 00 00       	push   $0x200
c00087f0:	6a 00                	push   $0x0
c00087f2:	68 ec 0b 01 c0       	push   $0xc0010bec
c00087f7:	e8 ef 3b 00 00       	call   c000c3eb <Memset>
c00087fc:	83 c4 10             	add    $0x10,%esp
c00087ff:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c0008806:	0b 01 c0 
c0008809:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c000880e:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c0008813:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c000881a:	00 00 00 
c000881d:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008824:	00 00 00 
c0008827:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000882e:	eb 04                	jmp    c0008834 <init_keyboard+0x52>
c0008830:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008834:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c000883b:	7e f3                	jle    c0008830 <init_keyboard+0x4e>
c000883d:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008844:	00 00 00 
c0008847:	e8 86 d4 ff ff       	call   c0005cd2 <init_keyboard_handler>
c000884c:	90                   	nop
c000884d:	c9                   	leave  
c000884e:	c3                   	ret    

c000884f <init2>:
c000884f:	55                   	push   %ebp
c0008850:	89 e5                	mov    %esp,%ebp
c0008852:	83 ec 08             	sub    $0x8,%esp
c0008855:	83 ec 0c             	sub    $0xc,%esp
c0008858:	68 21 bf 00 c0       	push   $0xc000bf21
c000885d:	e8 2a 8d ff ff       	call   c000158c <disp_str>
c0008862:	83 c4 10             	add    $0x10,%esp
c0008865:	e8 78 ff ff ff       	call   c00087e2 <init_keyboard>
c000886a:	83 ec 0c             	sub    $0xc,%esp
c000886d:	68 00 00 00 02       	push   $0x2000000
c0008872:	e8 8c f2 ff ff       	call   c0007b03 <init_memory>
c0008877:	83 c4 10             	add    $0x10,%esp
c000887a:	90                   	nop
c000887b:	c9                   	leave  
c000887c:	c3                   	ret    

c000887d <u_thread_a>:
c000887d:	55                   	push   %ebp
c000887e:	89 e5                	mov    %esp,%ebp
c0008880:	83 ec 08             	sub    $0x8,%esp
c0008883:	83 ec 0c             	sub    $0xc,%esp
c0008886:	68 27 bf 00 c0       	push   $0xc000bf27
c000888b:	e8 fc 8c ff ff       	call   c000158c <disp_str>
c0008890:	83 c4 10             	add    $0x10,%esp
c0008893:	eb fe                	jmp    c0008893 <u_thread_a+0x16>

c0008895 <kernel_main2>:
c0008895:	55                   	push   %ebp
c0008896:	89 e5                	mov    %esp,%ebp
c0008898:	57                   	push   %edi
c0008899:	56                   	push   %esi
c000889a:	53                   	push   %ebx
c000889b:	83 ec 3c             	sub    $0x3c,%esp
c000889e:	83 ec 0c             	sub    $0xc,%esp
c00088a1:	68 35 bf 00 c0       	push   $0xc000bf35
c00088a6:	e8 e1 8c ff ff       	call   c000158c <disp_str>
c00088ab:	83 c4 10             	add    $0x10,%esp
c00088ae:	e8 cd 90 ff ff       	call   c0001980 <init>
c00088b3:	c7 05 e8 1e 01 c0 00 	movl   $0x0,0xc0011ee8
c00088ba:	00 00 00 
c00088bd:	c7 05 ec 1e 01 c0 00 	movl   $0x0,0xc0011eec
c00088c4:	00 00 00 
c00088c7:	c7 05 bc 16 01 c0 00 	movl   $0x0,0xc00116bc
c00088ce:	00 00 00 
c00088d1:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c00088d8:	00 00 00 
c00088db:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c00088e2:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00088e9:	e9 01 02 00 00       	jmp    c0008aef <kernel_main2+0x25a>
c00088ee:	83 ec 08             	sub    $0x8,%esp
c00088f1:	6a 00                	push   $0x0
c00088f3:	6a 01                	push   $0x1
c00088f5:	e8 25 e9 ff ff       	call   c000721f <alloc_memory>
c00088fa:	83 c4 10             	add    $0x10,%esp
c00088fd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008900:	83 ec 04             	sub    $0x4,%esp
c0008903:	68 b4 02 00 00       	push   $0x2b4
c0008908:	6a 00                	push   $0x0
c000890a:	ff 75 d8             	pushl  -0x28(%ebp)
c000890d:	e8 d9 3a 00 00       	call   c000c3eb <Memset>
c0008912:	83 c4 10             	add    $0x10,%esp
c0008915:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008918:	05 00 10 00 00       	add    $0x1000,%eax
c000891d:	89 c2                	mov    %eax,%edx
c000891f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008922:	89 10                	mov    %edx,(%eax)
c0008924:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008927:	66 c7 80 10 01 00 00 	movw   $0x0,0x110(%eax)
c000892e:	00 00 
c0008930:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008933:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008936:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000893c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000893f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0008946:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c000894a:	7e 0f                	jle    c000895b <kernel_main2+0xc6>
c000894c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000894f:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0008956:	e9 90 01 00 00       	jmp    c0008aeb <kernel_main2+0x256>
c000895b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000895e:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0008965:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0008969:	7f 73                	jg     c00089de <kernel_main2+0x149>
c000896b:	c7 45 e4 20 f0 00 c0 	movl   $0xc000f020,-0x1c(%ebp)
c0008972:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c0008979:	c7 45 d0 2c 00 00 00 	movl   $0x2c,-0x30(%ebp)
c0008980:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008983:	8b 00                	mov    (%eax),%eax
c0008985:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c0008988:	89 c2                	mov    %eax,%edx
c000898a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000898d:	89 10                	mov    %edx,(%eax)
c000898f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008992:	8b 00                	mov    (%eax),%eax
c0008994:	2b 45 d0             	sub    -0x30(%ebp),%eax
c0008997:	89 c2                	mov    %eax,%edx
c0008999:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000899c:	89 10                	mov    %edx,(%eax)
c000899e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089a1:	8b 00                	mov    (%eax),%eax
c00089a3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00089a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00089a9:	8b 50 14             	mov    0x14(%eax),%edx
c00089ac:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00089af:	89 50 28             	mov    %edx,0x28(%eax)
c00089b2:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00089b5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00089bb:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00089be:	8b 10                	mov    (%eax),%edx
c00089c0:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00089c3:	89 50 04             	mov    %edx,0x4(%eax)
c00089c6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00089c9:	8b 50 04             	mov    0x4(%eax),%edx
c00089cc:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00089cf:	89 50 08             	mov    %edx,0x8(%eax)
c00089d2:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00089d5:	8b 50 08             	mov    0x8(%eax),%edx
c00089d8:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00089db:	89 50 0c             	mov    %edx,0xc(%eax)
c00089de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00089e1:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00089e4:	81 c2 34 01 00 00    	add    $0x134,%edx
c00089ea:	83 ec 08             	sub    $0x8,%esp
c00089ed:	50                   	push   %eax
c00089ee:	52                   	push   %edx
c00089ef:	e8 16 3a 00 00       	call   c000c40a <Strcpy>
c00089f4:	83 c4 10             	add    $0x10,%esp
c00089f7:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c00089fb:	83 c8 04             	or     $0x4,%eax
c00089fe:	0f b6 c0             	movzbl %al,%eax
c0008a01:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c0008a05:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008a09:	83 c8 0c             	or     $0xc,%eax
c0008a0c:	0f b6 c0             	movzbl %al,%eax
c0008a0f:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c0008a13:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c0008a17:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a1a:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c0008a20:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008a24:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a27:	89 90 78 02 00 00    	mov    %edx,0x278(%eax)
c0008a2d:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008a31:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a34:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c0008a3a:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008a3e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a41:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c0008a47:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008a4b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a4e:	89 90 ac 02 00 00    	mov    %edx,0x2ac(%eax)
c0008a54:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a57:	c7 80 6c 02 00 00 39 	movl   $0x39,0x26c(%eax)
c0008a5e:	00 00 00 
c0008a61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008a64:	8b 50 14             	mov    0x14(%eax),%edx
c0008a67:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a6a:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008a70:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a73:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0008a76:	89 90 a4 02 00 00    	mov    %edx,0x2a4(%eax)
c0008a7c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a7f:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0008a86:	00 00 00 
c0008a89:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a8c:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0008a93:	00 00 00 
c0008a96:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a99:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0008aa0:	00 00 00 
c0008aa3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008aa6:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0008aad:	00 00 00 
c0008ab0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008ab3:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0008aba:	00 00 00 
c0008abd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008ac0:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0008ac7:	00 00 00 
c0008aca:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008acd:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0008ad3:	8d 90 00 32 08 c0    	lea    -0x3ff7ce00(%eax),%edx
c0008ad9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008adc:	89 c3                	mov    %eax,%ebx
c0008ade:	b8 ad 00 00 00       	mov    $0xad,%eax
c0008ae3:	89 d7                	mov    %edx,%edi
c0008ae5:	89 de                	mov    %ebx,%esi
c0008ae7:	89 c1                	mov    %eax,%ecx
c0008ae9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008aeb:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008aef:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c0008af3:	0f 8e f5 fd ff ff    	jle    c00088ee <kernel_main2+0x59>
c0008af9:	c7 05 c0 0b 01 c0 00 	movl   $0xc0083200,0xc0010bc0
c0008b00:	32 08 c0 
c0008b03:	eb fe                	jmp    c0008b03 <kernel_main2+0x26e>

c0008b05 <TestTTY>:
c0008b05:	55                   	push   %ebp
c0008b06:	89 e5                	mov    %esp,%ebp
c0008b08:	83 ec 28             	sub    $0x28,%esp
c0008b0b:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008b12:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008b19:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008b1f:	83 ec 08             	sub    $0x8,%esp
c0008b22:	6a 02                	push   $0x2
c0008b24:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008b27:	50                   	push   %eax
c0008b28:	e8 4b d3 ff ff       	call   c0005e78 <open>
c0008b2d:	83 c4 10             	add    $0x10,%esp
c0008b30:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008b33:	83 ec 08             	sub    $0x8,%esp
c0008b36:	6a 02                	push   $0x2
c0008b38:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008b3b:	50                   	push   %eax
c0008b3c:	e8 37 d3 ff ff       	call   c0005e78 <open>
c0008b41:	83 c4 10             	add    $0x10,%esp
c0008b44:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008b47:	83 ec 0c             	sub    $0xc,%esp
c0008b4a:	68 41 bf 00 c0       	push   $0xc000bf41
c0008b4f:	e8 0d 0e 00 00       	call   c0009961 <Printf>
c0008b54:	83 c4 10             	add    $0x10,%esp
c0008b57:	83 ec 0c             	sub    $0xc,%esp
c0008b5a:	6a 0a                	push   $0xa
c0008b5c:	e8 43 9e ff ff       	call   c00029a4 <sys_malloc>
c0008b61:	83 c4 10             	add    $0x10,%esp
c0008b64:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008b67:	83 ec 04             	sub    $0x4,%esp
c0008b6a:	6a 0a                	push   $0xa
c0008b6c:	6a 00                	push   $0x0
c0008b6e:	ff 75 ec             	pushl  -0x14(%ebp)
c0008b71:	e8 75 38 00 00       	call   c000c3eb <Memset>
c0008b76:	83 c4 10             	add    $0x10,%esp
c0008b79:	83 ec 04             	sub    $0x4,%esp
c0008b7c:	6a 0a                	push   $0xa
c0008b7e:	ff 75 ec             	pushl  -0x14(%ebp)
c0008b81:	ff 75 f0             	pushl  -0x10(%ebp)
c0008b84:	e8 74 d3 ff ff       	call   c0005efd <read>
c0008b89:	83 c4 10             	add    $0x10,%esp
c0008b8c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008b8f:	83 ec 08             	sub    $0x8,%esp
c0008b92:	ff 75 ec             	pushl  -0x14(%ebp)
c0008b95:	68 53 bf 00 c0       	push   $0xc000bf53
c0008b9a:	e8 c2 0d 00 00       	call   c0009961 <Printf>
c0008b9f:	83 c4 10             	add    $0x10,%esp
c0008ba2:	eb c3                	jmp    c0008b67 <TestTTY+0x62>

c0008ba4 <TestFS>:
c0008ba4:	55                   	push   %ebp
c0008ba5:	89 e5                	mov    %esp,%ebp
c0008ba7:	81 ec 28 01 00 00    	sub    $0x128,%esp
c0008bad:	83 ec 0c             	sub    $0xc,%esp
c0008bb0:	68 5d bf 00 c0       	push   $0xc000bf5d
c0008bb5:	e8 d2 89 ff ff       	call   c000158c <disp_str>
c0008bba:	83 c4 10             	add    $0x10,%esp
c0008bbd:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0008bc4:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c0008bcb:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0008bd1:	66 87 db             	xchg   %bx,%bx
c0008bd4:	83 ec 08             	sub    $0x8,%esp
c0008bd7:	6a 02                	push   $0x2
c0008bd9:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008bdc:	50                   	push   %eax
c0008bdd:	e8 96 d2 ff ff       	call   c0005e78 <open>
c0008be2:	83 c4 10             	add    $0x10,%esp
c0008be5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008be8:	66 87 db             	xchg   %bx,%bx
c0008beb:	83 ec 08             	sub    $0x8,%esp
c0008bee:	6a 02                	push   $0x2
c0008bf0:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008bf3:	50                   	push   %eax
c0008bf4:	e8 7f d2 ff ff       	call   c0005e78 <open>
c0008bf9:	83 c4 10             	add    $0x10,%esp
c0008bfc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008bff:	66 87 db             	xchg   %bx,%bx
c0008c02:	83 ec 0c             	sub    $0xc,%esp
c0008c05:	68 41 bf 00 c0       	push   $0xc000bf41
c0008c0a:	e8 52 0d 00 00       	call   c0009961 <Printf>
c0008c0f:	83 c4 10             	add    $0x10,%esp
c0008c12:	66 87 db             	xchg   %bx,%bx
c0008c15:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c0008c1c:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0008c20:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0008c27:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c0008c2b:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0008c32:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0008c39:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0008c3f:	66 87 db             	xchg   %bx,%bx
c0008c42:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008c49:	66 87 db             	xchg   %bx,%bx
c0008c4c:	83 ec 0c             	sub    $0xc,%esp
c0008c4f:	68 65 bf 00 c0       	push   $0xc000bf65
c0008c54:	e8 08 0d 00 00       	call   c0009961 <Printf>
c0008c59:	83 c4 10             	add    $0x10,%esp
c0008c5c:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0008c60:	0f 85 43 03 00 00    	jne    c0008fa9 <TestFS+0x405>
c0008c66:	83 ec 08             	sub    $0x8,%esp
c0008c69:	6a 07                	push   $0x7
c0008c6b:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0008c6e:	50                   	push   %eax
c0008c6f:	e8 04 d2 ff ff       	call   c0005e78 <open>
c0008c74:	83 c4 10             	add    $0x10,%esp
c0008c77:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008c7a:	83 ec 08             	sub    $0x8,%esp
c0008c7d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008c80:	68 7d bf 00 c0       	push   $0xc000bf7d
c0008c85:	e8 d7 0c 00 00       	call   c0009961 <Printf>
c0008c8a:	83 c4 10             	add    $0x10,%esp
c0008c8d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008c94:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0008c9b:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0008ca2:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0008ca9:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0008cb0:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008cb7:	83 ec 0c             	sub    $0xc,%esp
c0008cba:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008cbd:	50                   	push   %eax
c0008cbe:	e8 61 37 00 00       	call   c000c424 <Strlen>
c0008cc3:	83 c4 10             	add    $0x10,%esp
c0008cc6:	83 ec 04             	sub    $0x4,%esp
c0008cc9:	50                   	push   %eax
c0008cca:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008ccd:	50                   	push   %eax
c0008cce:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008cd1:	e8 9b d2 ff ff       	call   c0005f71 <write>
c0008cd6:	83 c4 10             	add    $0x10,%esp
c0008cd9:	83 ec 04             	sub    $0x4,%esp
c0008cdc:	6a 14                	push   $0x14
c0008cde:	6a 00                	push   $0x0
c0008ce0:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008ce3:	50                   	push   %eax
c0008ce4:	e8 02 37 00 00       	call   c000c3eb <Memset>
c0008ce9:	83 c4 10             	add    $0x10,%esp
c0008cec:	83 ec 04             	sub    $0x4,%esp
c0008cef:	6a 12                	push   $0x12
c0008cf1:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008cf4:	50                   	push   %eax
c0008cf5:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008cf8:	e8 00 d2 ff ff       	call   c0005efd <read>
c0008cfd:	83 c4 10             	add    $0x10,%esp
c0008d00:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008d03:	83 ec 08             	sub    $0x8,%esp
c0008d06:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008d09:	50                   	push   %eax
c0008d0a:	68 86 bf 00 c0       	push   $0xc000bf86
c0008d0f:	e8 4d 0c 00 00       	call   c0009961 <Printf>
c0008d14:	83 c4 10             	add    $0x10,%esp
c0008d17:	66 87 db             	xchg   %bx,%bx
c0008d1a:	83 ec 0c             	sub    $0xc,%esp
c0008d1d:	6a 0a                	push   $0xa
c0008d1f:	e8 09 0b 00 00       	call   c000982d <delay>
c0008d24:	83 c4 10             	add    $0x10,%esp
c0008d27:	83 ec 08             	sub    $0x8,%esp
c0008d2a:	6a 07                	push   $0x7
c0008d2c:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0008d2f:	50                   	push   %eax
c0008d30:	e8 43 d1 ff ff       	call   c0005e78 <open>
c0008d35:	83 c4 10             	add    $0x10,%esp
c0008d38:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008d3b:	83 ec 08             	sub    $0x8,%esp
c0008d3e:	ff 75 dc             	pushl  -0x24(%ebp)
c0008d41:	68 91 bf 00 c0       	push   $0xc000bf91
c0008d46:	e8 16 0c 00 00       	call   c0009961 <Printf>
c0008d4b:	83 c4 10             	add    $0x10,%esp
c0008d4e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008d55:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0008d5c:	67 3a 68 
c0008d5f:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0008d66:	77 20 61 
c0008d69:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0008d70:	65 20 79 
c0008d73:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0008d7a:	75 3f 00 
c0008d7d:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0008d84:	00 00 00 
c0008d87:	83 ec 0c             	sub    $0xc,%esp
c0008d8a:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008d90:	50                   	push   %eax
c0008d91:	e8 8e 36 00 00       	call   c000c424 <Strlen>
c0008d96:	83 c4 10             	add    $0x10,%esp
c0008d99:	83 ec 04             	sub    $0x4,%esp
c0008d9c:	50                   	push   %eax
c0008d9d:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008da3:	50                   	push   %eax
c0008da4:	ff 75 dc             	pushl  -0x24(%ebp)
c0008da7:	e8 c5 d1 ff ff       	call   c0005f71 <write>
c0008dac:	83 c4 10             	add    $0x10,%esp
c0008daf:	83 ec 04             	sub    $0x4,%esp
c0008db2:	6a 14                	push   $0x14
c0008db4:	6a 00                	push   $0x0
c0008db6:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008dbc:	50                   	push   %eax
c0008dbd:	e8 29 36 00 00       	call   c000c3eb <Memset>
c0008dc2:	83 c4 10             	add    $0x10,%esp
c0008dc5:	83 ec 04             	sub    $0x4,%esp
c0008dc8:	6a 12                	push   $0x12
c0008dca:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008dd0:	50                   	push   %eax
c0008dd1:	ff 75 dc             	pushl  -0x24(%ebp)
c0008dd4:	e8 24 d1 ff ff       	call   c0005efd <read>
c0008dd9:	83 c4 10             	add    $0x10,%esp
c0008ddc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008ddf:	83 ec 08             	sub    $0x8,%esp
c0008de2:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008de8:	50                   	push   %eax
c0008de9:	68 9b bf 00 c0       	push   $0xc000bf9b
c0008dee:	e8 6e 0b 00 00       	call   c0009961 <Printf>
c0008df3:	83 c4 10             	add    $0x10,%esp
c0008df6:	83 ec 08             	sub    $0x8,%esp
c0008df9:	6a 07                	push   $0x7
c0008dfb:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0008dfe:	50                   	push   %eax
c0008dff:	e8 74 d0 ff ff       	call   c0005e78 <open>
c0008e04:	83 c4 10             	add    $0x10,%esp
c0008e07:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008e0a:	83 ec 08             	sub    $0x8,%esp
c0008e0d:	ff 75 dc             	pushl  -0x24(%ebp)
c0008e10:	68 91 bf 00 c0       	push   $0xc000bf91
c0008e15:	e8 47 0b 00 00       	call   c0009961 <Printf>
c0008e1a:	83 c4 10             	add    $0x10,%esp
c0008e1d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008e24:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0008e2b:	20 77 69 
c0008e2e:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0008e35:	6c 20 73 
c0008e38:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0008e3f:	63 63 65 
c0008e42:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0008e49:	73 20 61 
c0008e4c:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0008e53:	20 6c 61 
c0008e56:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0008e5d:	74 2e 00 
c0008e60:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0008e67:	00 00 00 
c0008e6a:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0008e71:	00 00 
c0008e73:	83 ec 0c             	sub    $0xc,%esp
c0008e76:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008e7c:	50                   	push   %eax
c0008e7d:	e8 a2 35 00 00       	call   c000c424 <Strlen>
c0008e82:	83 c4 10             	add    $0x10,%esp
c0008e85:	83 ec 04             	sub    $0x4,%esp
c0008e88:	50                   	push   %eax
c0008e89:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008e8f:	50                   	push   %eax
c0008e90:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008e93:	e8 d9 d0 ff ff       	call   c0005f71 <write>
c0008e98:	83 c4 10             	add    $0x10,%esp
c0008e9b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008ea2:	eb 5c                	jmp    c0008f00 <TestFS+0x35c>
c0008ea4:	83 ec 04             	sub    $0x4,%esp
c0008ea7:	6a 1e                	push   $0x1e
c0008ea9:	6a 00                	push   $0x0
c0008eab:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008eb1:	50                   	push   %eax
c0008eb2:	e8 34 35 00 00       	call   c000c3eb <Memset>
c0008eb7:	83 c4 10             	add    $0x10,%esp
c0008eba:	83 ec 0c             	sub    $0xc,%esp
c0008ebd:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008ec3:	50                   	push   %eax
c0008ec4:	e8 5b 35 00 00       	call   c000c424 <Strlen>
c0008ec9:	83 c4 10             	add    $0x10,%esp
c0008ecc:	83 ec 04             	sub    $0x4,%esp
c0008ecf:	50                   	push   %eax
c0008ed0:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008ed6:	50                   	push   %eax
c0008ed7:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008eda:	e8 1e d0 ff ff       	call   c0005efd <read>
c0008edf:	83 c4 10             	add    $0x10,%esp
c0008ee2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008ee5:	83 ec 08             	sub    $0x8,%esp
c0008ee8:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008eee:	50                   	push   %eax
c0008eef:	68 a6 bf 00 c0       	push   $0xc000bfa6
c0008ef4:	e8 68 0a 00 00       	call   c0009961 <Printf>
c0008ef9:	83 c4 10             	add    $0x10,%esp
c0008efc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008f00:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008f04:	7e 9e                	jle    c0008ea4 <TestFS+0x300>
c0008f06:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0008f0d:	6e 73 74 
c0008f10:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0008f17:	6c 6c 2e 
c0008f1a:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0008f21:	61 72 00 
c0008f24:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0008f2b:	00 00 00 
c0008f2e:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0008f35:	00 00 00 
c0008f38:	83 ec 08             	sub    $0x8,%esp
c0008f3b:	6a 00                	push   $0x0
c0008f3d:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0008f43:	50                   	push   %eax
c0008f44:	e8 2f cf ff ff       	call   c0005e78 <open>
c0008f49:	83 c4 10             	add    $0x10,%esp
c0008f4c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008f4f:	83 ec 08             	sub    $0x8,%esp
c0008f52:	ff 75 cc             	pushl  -0x34(%ebp)
c0008f55:	68 b1 bf 00 c0       	push   $0xc000bfb1
c0008f5a:	e8 02 0a 00 00       	call   c0009961 <Printf>
c0008f5f:	83 c4 10             	add    $0x10,%esp
c0008f62:	83 ec 04             	sub    $0x4,%esp
c0008f65:	6a 28                	push   $0x28
c0008f67:	6a 00                	push   $0x0
c0008f69:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008f6f:	50                   	push   %eax
c0008f70:	e8 76 34 00 00       	call   c000c3eb <Memset>
c0008f75:	83 c4 10             	add    $0x10,%esp
c0008f78:	83 ec 04             	sub    $0x4,%esp
c0008f7b:	6a 28                	push   $0x28
c0008f7d:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008f83:	50                   	push   %eax
c0008f84:	ff 75 cc             	pushl  -0x34(%ebp)
c0008f87:	e8 71 cf ff ff       	call   c0005efd <read>
c0008f8c:	83 c4 10             	add    $0x10,%esp
c0008f8f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0008f92:	83 ec 08             	sub    $0x8,%esp
c0008f95:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0008f9b:	50                   	push   %eax
c0008f9c:	68 bb bf 00 c0       	push   $0xc000bfbb
c0008fa1:	e8 bb 09 00 00       	call   c0009961 <Printf>
c0008fa6:	83 c4 10             	add    $0x10,%esp
c0008fa9:	90                   	nop
c0008faa:	c9                   	leave  
c0008fab:	c3                   	ret    

c0008fac <wait_exit>:
c0008fac:	55                   	push   %ebp
c0008fad:	89 e5                	mov    %esp,%ebp
c0008faf:	83 ec 28             	sub    $0x28,%esp
c0008fb2:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008fb9:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008fc0:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008fc6:	83 ec 08             	sub    $0x8,%esp
c0008fc9:	6a 02                	push   $0x2
c0008fcb:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008fce:	50                   	push   %eax
c0008fcf:	e8 a4 ce ff ff       	call   c0005e78 <open>
c0008fd4:	83 c4 10             	add    $0x10,%esp
c0008fd7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008fda:	83 ec 08             	sub    $0x8,%esp
c0008fdd:	6a 02                	push   $0x2
c0008fdf:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008fe2:	50                   	push   %eax
c0008fe3:	e8 90 ce ff ff       	call   c0005e78 <open>
c0008fe8:	83 c4 10             	add    $0x10,%esp
c0008feb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008fee:	e8 a5 d0 ff ff       	call   c0006098 <fork>
c0008ff3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008ff6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008ffa:	7e 25                	jle    c0009021 <wait_exit+0x75>
c0008ffc:	83 ec 0c             	sub    $0xc,%esp
c0008fff:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0009002:	50                   	push   %eax
c0009003:	e8 29 d0 ff ff       	call   c0006031 <wait>
c0009008:	83 c4 10             	add    $0x10,%esp
c000900b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000900e:	83 ec 08             	sub    $0x8,%esp
c0009011:	50                   	push   %eax
c0009012:	68 c6 bf 00 c0       	push   $0xc000bfc6
c0009017:	e8 45 09 00 00       	call   c0009961 <Printf>
c000901c:	83 c4 10             	add    $0x10,%esp
c000901f:	eb fe                	jmp    c000901f <wait_exit+0x73>
c0009021:	83 ec 0c             	sub    $0xc,%esp
c0009024:	68 e1 bf 00 c0       	push   $0xc000bfe1
c0009029:	e8 33 09 00 00       	call   c0009961 <Printf>
c000902e:	83 c4 10             	add    $0x10,%esp
c0009031:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009038:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000903b:	8d 50 01             	lea    0x1(%eax),%edx
c000903e:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009041:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0009046:	7f 02                	jg     c000904a <wait_exit+0x9e>
c0009048:	eb ee                	jmp    c0009038 <wait_exit+0x8c>
c000904a:	90                   	nop
c000904b:	83 ec 0c             	sub    $0xc,%esp
c000904e:	68 ed bf 00 c0       	push   $0xc000bfed
c0009053:	e8 09 09 00 00       	call   c0009961 <Printf>
c0009058:	83 c4 10             	add    $0x10,%esp
c000905b:	83 ec 0c             	sub    $0xc,%esp
c000905e:	6a 09                	push   $0x9
c0009060:	e8 0a d0 ff ff       	call   c000606f <exit>
c0009065:	83 c4 10             	add    $0x10,%esp
c0009068:	83 ec 0c             	sub    $0xc,%esp
c000906b:	68 fb bf 00 c0       	push   $0xc000bffb
c0009070:	e8 ec 08 00 00       	call   c0009961 <Printf>
c0009075:	83 c4 10             	add    $0x10,%esp
c0009078:	eb fe                	jmp    c0009078 <wait_exit+0xcc>

c000907a <INIT_fork>:
c000907a:	55                   	push   %ebp
c000907b:	89 e5                	mov    %esp,%ebp
c000907d:	83 ec 78             	sub    $0x78,%esp
c0009080:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0009087:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c000908e:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0009094:	83 ec 08             	sub    $0x8,%esp
c0009097:	6a 02                	push   $0x2
c0009099:	8d 45 de             	lea    -0x22(%ebp),%eax
c000909c:	50                   	push   %eax
c000909d:	e8 d6 cd ff ff       	call   c0005e78 <open>
c00090a2:	83 c4 10             	add    $0x10,%esp
c00090a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00090a8:	83 ec 08             	sub    $0x8,%esp
c00090ab:	6a 02                	push   $0x2
c00090ad:	8d 45 de             	lea    -0x22(%ebp),%eax
c00090b0:	50                   	push   %eax
c00090b1:	e8 c2 cd ff ff       	call   c0005e78 <open>
c00090b6:	83 c4 10             	add    $0x10,%esp
c00090b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00090bc:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c00090c3:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c00090ca:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c00090d1:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c00090d8:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c00090df:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c00090e6:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c00090ed:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c00090f4:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c00090fb:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0009102:	83 ec 0c             	sub    $0xc,%esp
c0009105:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0009108:	50                   	push   %eax
c0009109:	e8 53 08 00 00       	call   c0009961 <Printf>
c000910e:	83 c4 10             	add    $0x10,%esp
c0009111:	83 ec 0c             	sub    $0xc,%esp
c0009114:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0009117:	50                   	push   %eax
c0009118:	e8 07 33 00 00       	call   c000c424 <Strlen>
c000911d:	83 c4 10             	add    $0x10,%esp
c0009120:	83 ec 04             	sub    $0x4,%esp
c0009123:	50                   	push   %eax
c0009124:	6a 00                	push   $0x0
c0009126:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0009129:	50                   	push   %eax
c000912a:	e8 bc 32 00 00       	call   c000c3eb <Memset>
c000912f:	83 c4 10             	add    $0x10,%esp
c0009132:	83 ec 04             	sub    $0x4,%esp
c0009135:	6a 28                	push   $0x28
c0009137:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c000913a:	50                   	push   %eax
c000913b:	ff 75 f0             	pushl  -0x10(%ebp)
c000913e:	e8 ba cd ff ff       	call   c0005efd <read>
c0009143:	83 c4 10             	add    $0x10,%esp
c0009146:	83 ec 0c             	sub    $0xc,%esp
c0009149:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c000914c:	50                   	push   %eax
c000914d:	e8 0f 08 00 00       	call   c0009961 <Printf>
c0009152:	83 c4 10             	add    $0x10,%esp
c0009155:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000915c:	e8 37 cf ff ff       	call   c0006098 <fork>
c0009161:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009164:	66 87 db             	xchg   %bx,%bx
c0009167:	83 ec 0c             	sub    $0xc,%esp
c000916a:	6a 01                	push   $0x1
c000916c:	e8 bc 06 00 00       	call   c000982d <delay>
c0009171:	83 c4 10             	add    $0x10,%esp
c0009174:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0009178:	0f 8e c5 00 00 00    	jle    c0009243 <INIT_fork+0x1c9>
c000917e:	83 ec 0c             	sub    $0xc,%esp
c0009181:	68 09 c0 00 c0       	push   $0xc000c009
c0009186:	e8 d6 07 00 00       	call   c0009961 <Printf>
c000918b:	83 c4 10             	add    $0x10,%esp
c000918e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0009192:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c0009199:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c00091a0:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c00091a7:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c00091ae:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c00091b5:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c00091bc:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c00091c3:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c00091ca:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c00091d1:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c00091d8:	83 ec 0c             	sub    $0xc,%esp
c00091db:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00091de:	50                   	push   %eax
c00091df:	e8 40 32 00 00       	call   c000c424 <Strlen>
c00091e4:	83 c4 10             	add    $0x10,%esp
c00091e7:	83 ec 04             	sub    $0x4,%esp
c00091ea:	50                   	push   %eax
c00091eb:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00091ee:	50                   	push   %eax
c00091ef:	ff 75 f4             	pushl  -0xc(%ebp)
c00091f2:	e8 7a cd ff ff       	call   c0005f71 <write>
c00091f7:	83 c4 10             	add    $0x10,%esp
c00091fa:	83 ec 0c             	sub    $0xc,%esp
c00091fd:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009200:	50                   	push   %eax
c0009201:	e8 1e 32 00 00       	call   c000c424 <Strlen>
c0009206:	83 c4 10             	add    $0x10,%esp
c0009209:	83 ec 04             	sub    $0x4,%esp
c000920c:	50                   	push   %eax
c000920d:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009210:	50                   	push   %eax
c0009211:	ff 75 f4             	pushl  -0xc(%ebp)
c0009214:	e8 58 cd ff ff       	call   c0005f71 <write>
c0009219:	83 c4 10             	add    $0x10,%esp
c000921c:	83 ec 0c             	sub    $0xc,%esp
c000921f:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009222:	50                   	push   %eax
c0009223:	e8 fc 31 00 00       	call   c000c424 <Strlen>
c0009228:	83 c4 10             	add    $0x10,%esp
c000922b:	83 ec 04             	sub    $0x4,%esp
c000922e:	50                   	push   %eax
c000922f:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009232:	50                   	push   %eax
c0009233:	ff 75 f4             	pushl  -0xc(%ebp)
c0009236:	e8 36 cd ff ff       	call   c0005f71 <write>
c000923b:	83 c4 10             	add    $0x10,%esp
c000923e:	e9 c6 00 00 00       	jmp    c0009309 <INIT_fork+0x28f>
c0009243:	83 ec 0c             	sub    $0xc,%esp
c0009246:	6a 01                	push   $0x1
c0009248:	e8 e0 05 00 00       	call   c000982d <delay>
c000924d:	83 c4 10             	add    $0x10,%esp
c0009250:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0009254:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c0009258:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c000925f:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c0009266:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c000926d:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c0009274:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c000927b:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0009282:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0009289:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0009290:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0009297:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c000929e:	66 87 db             	xchg   %bx,%bx
c00092a1:	83 ec 0c             	sub    $0xc,%esp
c00092a4:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00092a7:	50                   	push   %eax
c00092a8:	e8 77 31 00 00       	call   c000c424 <Strlen>
c00092ad:	83 c4 10             	add    $0x10,%esp
c00092b0:	83 ec 04             	sub    $0x4,%esp
c00092b3:	50                   	push   %eax
c00092b4:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00092b7:	50                   	push   %eax
c00092b8:	ff 75 f4             	pushl  -0xc(%ebp)
c00092bb:	e8 b1 cc ff ff       	call   c0005f71 <write>
c00092c0:	83 c4 10             	add    $0x10,%esp
c00092c3:	83 ec 0c             	sub    $0xc,%esp
c00092c6:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00092c9:	50                   	push   %eax
c00092ca:	e8 55 31 00 00       	call   c000c424 <Strlen>
c00092cf:	83 c4 10             	add    $0x10,%esp
c00092d2:	83 ec 04             	sub    $0x4,%esp
c00092d5:	50                   	push   %eax
c00092d6:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00092d9:	50                   	push   %eax
c00092da:	ff 75 f4             	pushl  -0xc(%ebp)
c00092dd:	e8 8f cc ff ff       	call   c0005f71 <write>
c00092e2:	83 c4 10             	add    $0x10,%esp
c00092e5:	83 ec 0c             	sub    $0xc,%esp
c00092e8:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00092eb:	50                   	push   %eax
c00092ec:	e8 33 31 00 00       	call   c000c424 <Strlen>
c00092f1:	83 c4 10             	add    $0x10,%esp
c00092f4:	83 ec 04             	sub    $0x4,%esp
c00092f7:	50                   	push   %eax
c00092f8:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00092fb:	50                   	push   %eax
c00092fc:	ff 75 f4             	pushl  -0xc(%ebp)
c00092ff:	e8 6d cc ff ff       	call   c0005f71 <write>
c0009304:	83 c4 10             	add    $0x10,%esp
c0009307:	eb fe                	jmp    c0009307 <INIT_fork+0x28d>
c0009309:	83 ec 04             	sub    $0x4,%esp
c000930c:	6a 28                	push   $0x28
c000930e:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0009311:	50                   	push   %eax
c0009312:	ff 75 f0             	pushl  -0x10(%ebp)
c0009315:	e8 e3 cb ff ff       	call   c0005efd <read>
c000931a:	83 c4 10             	add    $0x10,%esp
c000931d:	83 ec 0c             	sub    $0xc,%esp
c0009320:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0009323:	50                   	push   %eax
c0009324:	e8 38 06 00 00       	call   c0009961 <Printf>
c0009329:	83 c4 10             	add    $0x10,%esp
c000932c:	83 ec 0c             	sub    $0xc,%esp
c000932f:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0009332:	50                   	push   %eax
c0009333:	e8 29 06 00 00       	call   c0009961 <Printf>
c0009338:	83 c4 10             	add    $0x10,%esp
c000933b:	83 ec 0c             	sub    $0xc,%esp
c000933e:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c0009341:	50                   	push   %eax
c0009342:	e8 1a 06 00 00       	call   c0009961 <Printf>
c0009347:	83 c4 10             	add    $0x10,%esp
c000934a:	83 ec 0c             	sub    $0xc,%esp
c000934d:	68 0f c0 00 c0       	push   $0xc000c00f
c0009352:	e8 23 09 00 00       	call   c0009c7a <spin>
c0009357:	83 c4 10             	add    $0x10,%esp
c000935a:	90                   	nop
c000935b:	c9                   	leave  
c000935c:	c3                   	ret    

c000935d <simple_shell>:
c000935d:	55                   	push   %ebp
c000935e:	89 e5                	mov    %esp,%ebp
c0009360:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0009366:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c000936d:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0009374:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c000937a:	83 ec 08             	sub    $0x8,%esp
c000937d:	6a 02                	push   $0x2
c000937f:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0009382:	50                   	push   %eax
c0009383:	e8 f0 ca ff ff       	call   c0005e78 <open>
c0009388:	83 c4 10             	add    $0x10,%esp
c000938b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000938e:	83 ec 08             	sub    $0x8,%esp
c0009391:	6a 02                	push   $0x2
c0009393:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0009396:	50                   	push   %eax
c0009397:	e8 dc ca ff ff       	call   c0005e78 <open>
c000939c:	83 c4 10             	add    $0x10,%esp
c000939f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00093a2:	83 ec 04             	sub    $0x4,%esp
c00093a5:	68 80 00 00 00       	push   $0x80
c00093aa:	6a 00                	push   $0x0
c00093ac:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00093b2:	50                   	push   %eax
c00093b3:	e8 33 30 00 00       	call   c000c3eb <Memset>
c00093b8:	83 c4 10             	add    $0x10,%esp
c00093bb:	83 ec 04             	sub    $0x4,%esp
c00093be:	68 80 00 00 00       	push   $0x80
c00093c3:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00093c9:	50                   	push   %eax
c00093ca:	ff 75 e0             	pushl  -0x20(%ebp)
c00093cd:	e8 2b cb ff ff       	call   c0005efd <read>
c00093d2:	83 c4 10             	add    $0x10,%esp
c00093d5:	83 ec 08             	sub    $0x8,%esp
c00093d8:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00093de:	50                   	push   %eax
c00093df:	68 17 c0 00 c0       	push   $0xc000c017
c00093e4:	e8 78 05 00 00       	call   c0009961 <Printf>
c00093e9:	83 c4 10             	add    $0x10,%esp
c00093ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00093f3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00093fa:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0009400:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009403:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009406:	0f b6 00             	movzbl (%eax),%eax
c0009409:	88 45 db             	mov    %al,-0x25(%ebp)
c000940c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000940f:	0f b6 00             	movzbl (%eax),%eax
c0009412:	3c 20                	cmp    $0x20,%al
c0009414:	74 1d                	je     c0009433 <simple_shell+0xd6>
c0009416:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009419:	0f b6 00             	movzbl (%eax),%eax
c000941c:	84 c0                	test   %al,%al
c000941e:	74 13                	je     c0009433 <simple_shell+0xd6>
c0009420:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009424:	75 0d                	jne    c0009433 <simple_shell+0xd6>
c0009426:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009429:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000942c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0009433:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009436:	0f b6 00             	movzbl (%eax),%eax
c0009439:	3c 20                	cmp    $0x20,%al
c000943b:	74 0a                	je     c0009447 <simple_shell+0xea>
c000943d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009440:	0f b6 00             	movzbl (%eax),%eax
c0009443:	84 c0                	test   %al,%al
c0009445:	75 26                	jne    c000946d <simple_shell+0x110>
c0009447:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c000944b:	75 20                	jne    c000946d <simple_shell+0x110>
c000944d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009450:	8d 50 01             	lea    0x1(%eax),%edx
c0009453:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009456:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009459:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0009460:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009463:	c6 00 00             	movb   $0x0,(%eax)
c0009466:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000946d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0009471:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0009475:	75 8c                	jne    c0009403 <simple_shell+0xa6>
c0009477:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000947a:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0009481:	00 00 00 00 
c0009485:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c000948c:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0009492:	83 ec 08             	sub    $0x8,%esp
c0009495:	6a 02                	push   $0x2
c0009497:	50                   	push   %eax
c0009498:	e8 db c9 ff ff       	call   c0005e78 <open>
c000949d:	83 c4 10             	add    $0x10,%esp
c00094a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00094a3:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c00094a7:	75 54                	jne    c00094fd <simple_shell+0x1a0>
c00094a9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00094b0:	eb 29                	jmp    c00094db <simple_shell+0x17e>
c00094b2:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c00094b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00094bb:	01 d0                	add    %edx,%eax
c00094bd:	0f b6 00             	movzbl (%eax),%eax
c00094c0:	0f be c0             	movsbl %al,%eax
c00094c3:	83 ec 04             	sub    $0x4,%esp
c00094c6:	50                   	push   %eax
c00094c7:	ff 75 e4             	pushl  -0x1c(%ebp)
c00094ca:	68 26 c0 00 c0       	push   $0xc000c026
c00094cf:	e8 8d 04 00 00       	call   c0009961 <Printf>
c00094d4:	83 c4 10             	add    $0x10,%esp
c00094d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00094db:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c00094df:	7e d1                	jle    c00094b2 <simple_shell+0x155>
c00094e1:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00094e7:	83 ec 08             	sub    $0x8,%esp
c00094ea:	50                   	push   %eax
c00094eb:	68 2d c0 00 c0       	push   $0xc000c02d
c00094f0:	e8 6c 04 00 00       	call   c0009961 <Printf>
c00094f5:	83 c4 10             	add    $0x10,%esp
c00094f8:	e9 a5 fe ff ff       	jmp    c00093a2 <simple_shell+0x45>
c00094fd:	e8 96 cb ff ff       	call   c0006098 <fork>
c0009502:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009505:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0009509:	7e 17                	jle    c0009522 <simple_shell+0x1c5>
c000950b:	83 ec 0c             	sub    $0xc,%esp
c000950e:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0009514:	50                   	push   %eax
c0009515:	e8 17 cb ff ff       	call   c0006031 <wait>
c000951a:	83 c4 10             	add    $0x10,%esp
c000951d:	e9 80 fe ff ff       	jmp    c00093a2 <simple_shell+0x45>
c0009522:	83 ec 0c             	sub    $0xc,%esp
c0009525:	68 33 c0 00 c0       	push   $0xc000c033
c000952a:	e8 32 04 00 00       	call   c0009961 <Printf>
c000952f:	83 c4 10             	add    $0x10,%esp
c0009532:	83 ec 0c             	sub    $0xc,%esp
c0009535:	ff 75 d0             	pushl  -0x30(%ebp)
c0009538:	e8 a8 ca ff ff       	call   c0005fe5 <close>
c000953d:	83 c4 10             	add    $0x10,%esp
c0009540:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0009546:	83 ec 08             	sub    $0x8,%esp
c0009549:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c000954f:	52                   	push   %edx
c0009550:	50                   	push   %eax
c0009551:	e8 31 cc ff ff       	call   c0006187 <execv>
c0009556:	83 c4 10             	add    $0x10,%esp
c0009559:	eb fe                	jmp    c0009559 <simple_shell+0x1fc>

c000955b <test_split_str>:
c000955b:	55                   	push   %ebp
c000955c:	89 e5                	mov    %esp,%ebp
c000955e:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0009564:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000956b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0009572:	c7 45 ec 4f c0 00 c0 	movl   $0xc000c04f,-0x14(%ebp)
c0009579:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000957d:	75 1a                	jne    c0009599 <test_split_str+0x3e>
c000957f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009582:	0f b6 00             	movzbl (%eax),%eax
c0009585:	0f be c0             	movsbl %al,%eax
c0009588:	83 ec 08             	sub    $0x8,%esp
c000958b:	50                   	push   %eax
c000958c:	68 60 c0 00 c0       	push   $0xc000c060
c0009591:	e8 cb 03 00 00       	call   c0009961 <Printf>
c0009596:	83 c4 10             	add    $0x10,%esp
c0009599:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000959c:	0f b6 00             	movzbl (%eax),%eax
c000959f:	3c 20                	cmp    $0x20,%al
c00095a1:	75 0a                	jne    c00095ad <test_split_str+0x52>
c00095a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00095a6:	0f b6 00             	movzbl (%eax),%eax
c00095a9:	84 c0                	test   %al,%al
c00095ab:	74 13                	je     c00095c0 <test_split_str+0x65>
c00095ad:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00095b1:	75 0d                	jne    c00095c0 <test_split_str+0x65>
c00095b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00095b6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00095b9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00095c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00095c3:	0f b6 00             	movzbl (%eax),%eax
c00095c6:	3c 20                	cmp    $0x20,%al
c00095c8:	74 0a                	je     c00095d4 <test_split_str+0x79>
c00095ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00095cd:	0f b6 00             	movzbl (%eax),%eax
c00095d0:	84 c0                	test   %al,%al
c00095d2:	75 26                	jne    c00095fa <test_split_str+0x9f>
c00095d4:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00095d8:	75 20                	jne    c00095fa <test_split_str+0x9f>
c00095da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00095dd:	8d 50 01             	lea    0x1(%eax),%edx
c00095e0:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00095e3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00095e6:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00095ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00095f0:	c6 00 00             	movb   $0x0,(%eax)
c00095f3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00095fa:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00095fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009601:	0f b6 00             	movzbl (%eax),%eax
c0009604:	84 c0                	test   %al,%al
c0009606:	0f 85 6d ff ff ff    	jne    c0009579 <test_split_str+0x1e>
c000960c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000960f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009612:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0009619:	83 ec 08             	sub    $0x8,%esp
c000961c:	ff 75 f4             	pushl  -0xc(%ebp)
c000961f:	68 69 c0 00 c0       	push   $0xc000c069
c0009624:	e8 38 03 00 00       	call   c0009961 <Printf>
c0009629:	83 c4 10             	add    $0x10,%esp
c000962c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0009633:	eb 22                	jmp    c0009657 <test_split_str+0xfc>
c0009635:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009638:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c000963f:	83 ec 04             	sub    $0x4,%esp
c0009642:	50                   	push   %eax
c0009643:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009646:	68 80 c0 00 c0       	push   $0xc000c080
c000964b:	e8 11 03 00 00       	call   c0009961 <Printf>
c0009650:	83 c4 10             	add    $0x10,%esp
c0009653:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0009657:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000965a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c000965d:	7e d6                	jle    c0009635 <test_split_str+0xda>
c000965f:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0009665:	83 ec 08             	sub    $0x8,%esp
c0009668:	68 8f c0 00 c0       	push   $0xc000c08f
c000966d:	50                   	push   %eax
c000966e:	e8 d3 12 00 00       	call   c000a946 <strcmp>
c0009673:	83 c4 10             	add    $0x10,%esp
c0009676:	85 c0                	test   %eax,%eax
c0009678:	75 10                	jne    c000968a <test_split_str+0x12f>
c000967a:	83 ec 0c             	sub    $0xc,%esp
c000967d:	68 94 c0 00 c0       	push   $0xc000c094
c0009682:	e8 da 02 00 00       	call   c0009961 <Printf>
c0009687:	83 c4 10             	add    $0x10,%esp
c000968a:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0009690:	83 ec 08             	sub    $0x8,%esp
c0009693:	50                   	push   %eax
c0009694:	68 a0 c0 00 c0       	push   $0xc000c0a0
c0009699:	e8 c3 02 00 00       	call   c0009961 <Printf>
c000969e:	83 c4 10             	add    $0x10,%esp
c00096a1:	83 ec 0c             	sub    $0xc,%esp
c00096a4:	68 ae c0 00 c0       	push   $0xc000c0ae
c00096a9:	e8 b3 02 00 00       	call   c0009961 <Printf>
c00096ae:	83 c4 10             	add    $0x10,%esp
c00096b1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00096b8:	eb 26                	jmp    c00096e0 <test_split_str+0x185>
c00096ba:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c00096c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00096c3:	01 d0                	add    %edx,%eax
c00096c5:	0f b6 00             	movzbl (%eax),%eax
c00096c8:	0f be c0             	movsbl %al,%eax
c00096cb:	83 ec 08             	sub    $0x8,%esp
c00096ce:	50                   	push   %eax
c00096cf:	68 bd c0 00 c0       	push   $0xc000c0bd
c00096d4:	e8 88 02 00 00       	call   c0009961 <Printf>
c00096d9:	83 c4 10             	add    $0x10,%esp
c00096dc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00096e0:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c00096e4:	7e d4                	jle    c00096ba <test_split_str+0x15f>
c00096e6:	c9                   	leave  
c00096e7:	c3                   	ret    

c00096e8 <test_shell>:
c00096e8:	55                   	push   %ebp
c00096e9:	89 e5                	mov    %esp,%ebp
c00096eb:	83 ec 38             	sub    $0x38,%esp
c00096ee:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c00096f5:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c00096fc:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0009702:	83 ec 08             	sub    $0x8,%esp
c0009705:	6a 02                	push   $0x2
c0009707:	8d 45 ea             	lea    -0x16(%ebp),%eax
c000970a:	50                   	push   %eax
c000970b:	e8 68 c7 ff ff       	call   c0005e78 <open>
c0009710:	83 c4 10             	add    $0x10,%esp
c0009713:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009716:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c000971d:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0009724:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c000972b:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0009732:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0009739:	83 ec 0c             	sub    $0xc,%esp
c000973c:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c000973f:	50                   	push   %eax
c0009740:	e8 c7 e5 ff ff       	call   c0007d0c <untar>
c0009745:	83 c4 10             	add    $0x10,%esp
c0009748:	e8 10 fc ff ff       	call   c000935d <simple_shell>
c000974d:	90                   	nop
c000974e:	c9                   	leave  
c000974f:	c3                   	ret    

c0009750 <test_exec>:
c0009750:	55                   	push   %ebp
c0009751:	89 e5                	mov    %esp,%ebp
c0009753:	83 ec 38             	sub    $0x38,%esp
c0009756:	83 ec 0c             	sub    $0xc,%esp
c0009759:	68 f7 be 00 c0       	push   $0xc000bef7
c000975e:	e8 29 7e ff ff       	call   c000158c <disp_str>
c0009763:	83 c4 10             	add    $0x10,%esp
c0009766:	83 ec 0c             	sub    $0xc,%esp
c0009769:	68 f9 be 00 c0       	push   $0xc000bef9
c000976e:	e8 19 7e ff ff       	call   c000158c <disp_str>
c0009773:	83 c4 10             	add    $0x10,%esp
c0009776:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c000977d:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0009784:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c000978a:	83 ec 08             	sub    $0x8,%esp
c000978d:	6a 02                	push   $0x2
c000978f:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0009792:	50                   	push   %eax
c0009793:	e8 e0 c6 ff ff       	call   c0005e78 <open>
c0009798:	83 c4 10             	add    $0x10,%esp
c000979b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000979e:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c00097a5:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c00097ac:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c00097b3:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00097ba:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c00097c1:	83 ec 0c             	sub    $0xc,%esp
c00097c4:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c00097c7:	50                   	push   %eax
c00097c8:	e8 3f e5 ff ff       	call   c0007d0c <untar>
c00097cd:	83 c4 10             	add    $0x10,%esp
c00097d0:	6a 00                	push   $0x0
c00097d2:	68 c6 c0 00 c0       	push   $0xc000c0c6
c00097d7:	68 8f c0 00 c0       	push   $0xc000c08f
c00097dc:	68 cc c0 00 c0       	push   $0xc000c0cc
c00097e1:	e8 b2 cb ff ff       	call   c0006398 <execl>
c00097e6:	83 c4 10             	add    $0x10,%esp
c00097e9:	eb fe                	jmp    c00097e9 <test_exec+0x99>

c00097eb <INIT>:
c00097eb:	55                   	push   %ebp
c00097ec:	89 e5                	mov    %esp,%ebp
c00097ee:	83 ec 08             	sub    $0x8,%esp
c00097f1:	e8 f2 fe ff ff       	call   c00096e8 <test_shell>
c00097f6:	eb fe                	jmp    c00097f6 <INIT+0xb>

c00097f8 <TestA>:
c00097f8:	55                   	push   %ebp
c00097f9:	89 e5                	mov    %esp,%ebp
c00097fb:	83 ec 08             	sub    $0x8,%esp
c00097fe:	83 ec 0c             	sub    $0xc,%esp
c0009801:	6a 05                	push   $0x5
c0009803:	e8 ba e8 ff ff       	call   c00080c2 <disp_int>
c0009808:	83 c4 10             	add    $0x10,%esp
c000980b:	83 ec 0c             	sub    $0xc,%esp
c000980e:	68 ef bb 00 c0       	push   $0xc000bbef
c0009813:	e8 74 7d ff ff       	call   c000158c <disp_str>
c0009818:	83 c4 10             	add    $0x10,%esp
c000981b:	83 ec 0c             	sub    $0xc,%esp
c000981e:	68 d2 c0 00 c0       	push   $0xc000c0d2
c0009823:	e8 64 7d ff ff       	call   c000158c <disp_str>
c0009828:	83 c4 10             	add    $0x10,%esp
c000982b:	eb fe                	jmp    c000982b <TestA+0x33>

c000982d <delay>:
c000982d:	55                   	push   %ebp
c000982e:	89 e5                	mov    %esp,%ebp
c0009830:	83 ec 10             	sub    $0x10,%esp
c0009833:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000983a:	eb 2a                	jmp    c0009866 <delay+0x39>
c000983c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0009843:	eb 17                	jmp    c000985c <delay+0x2f>
c0009845:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000984c:	eb 04                	jmp    c0009852 <delay+0x25>
c000984e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009852:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009856:	7e f6                	jle    c000984e <delay+0x21>
c0009858:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000985c:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0009860:	7e e3                	jle    c0009845 <delay+0x18>
c0009862:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009866:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009869:	3b 45 08             	cmp    0x8(%ebp),%eax
c000986c:	7c ce                	jl     c000983c <delay+0xf>
c000986e:	90                   	nop
c000986f:	c9                   	leave  
c0009870:	c3                   	ret    

c0009871 <TestB>:
c0009871:	55                   	push   %ebp
c0009872:	89 e5                	mov    %esp,%ebp
c0009874:	83 ec 08             	sub    $0x8,%esp
c0009877:	83 ec 0c             	sub    $0xc,%esp
c000987a:	68 d9 c0 00 c0       	push   $0xc000c0d9
c000987f:	e8 08 7d ff ff       	call   c000158c <disp_str>
c0009884:	83 c4 10             	add    $0x10,%esp
c0009887:	eb fe                	jmp    c0009887 <TestB+0x16>

c0009889 <TestC>:
c0009889:	55                   	push   %ebp
c000988a:	89 e5                	mov    %esp,%ebp
c000988c:	83 ec 18             	sub    $0x18,%esp
c000988f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009896:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c000989a:	77 1a                	ja     c00098b6 <TestC+0x2d>
c000989c:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c00098a3:	83 ec 08             	sub    $0x8,%esp
c00098a6:	ff 75 f0             	pushl  -0x10(%ebp)
c00098a9:	68 dc c0 00 c0       	push   $0xc000c0dc
c00098ae:	e8 ae 00 00 00       	call   c0009961 <Printf>
c00098b3:	83 c4 10             	add    $0x10,%esp
c00098b6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00098ba:	eb da                	jmp    c0009896 <TestC+0xd>

c00098bc <sys_get_ticks>:
c00098bc:	55                   	push   %ebp
c00098bd:	89 e5                	mov    %esp,%ebp
c00098bf:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c00098c4:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c00098ca:	5d                   	pop    %ebp
c00098cb:	c3                   	ret    

c00098cc <sys_write>:
c00098cc:	55                   	push   %ebp
c00098cd:	89 e5                	mov    %esp,%ebp
c00098cf:	83 ec 18             	sub    $0x18,%esp
c00098d2:	8b 45 10             	mov    0x10(%ebp),%eax
c00098d5:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c00098db:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00098e1:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c00098e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00098e9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00098ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00098ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00098f2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00098f5:	eb 20                	jmp    c0009917 <sys_write+0x4b>
c00098f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00098fa:	0f b6 00             	movzbl (%eax),%eax
c00098fd:	0f b6 c0             	movzbl %al,%eax
c0009900:	83 ec 08             	sub    $0x8,%esp
c0009903:	50                   	push   %eax
c0009904:	ff 75 ec             	pushl  -0x14(%ebp)
c0009907:	e8 ed b8 ff ff       	call   c00051f9 <out_char>
c000990c:	83 c4 10             	add    $0x10,%esp
c000990f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009913:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0009917:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000991b:	7f da                	jg     c00098f7 <sys_write+0x2b>
c000991d:	90                   	nop
c000991e:	c9                   	leave  
c000991f:	c3                   	ret    

c0009920 <milli_delay>:
c0009920:	55                   	push   %ebp
c0009921:	89 e5                	mov    %esp,%ebp
c0009923:	83 ec 18             	sub    $0x18,%esp
c0009926:	e8 47 0e 00 00       	call   c000a772 <get_ticks_ipc>
c000992b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000992e:	90                   	nop
c000992f:	e8 3e 0e 00 00       	call   c000a772 <get_ticks_ipc>
c0009934:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0009937:	89 c1                	mov    %eax,%ecx
c0009939:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c000993e:	89 c8                	mov    %ecx,%eax
c0009940:	f7 ea                	imul   %edx
c0009942:	c1 fa 05             	sar    $0x5,%edx
c0009945:	89 c8                	mov    %ecx,%eax
c0009947:	c1 f8 1f             	sar    $0x1f,%eax
c000994a:	29 c2                	sub    %eax,%edx
c000994c:	89 d0                	mov    %edx,%eax
c000994e:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0009954:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009957:	77 d6                	ja     c000992f <milli_delay+0xf>
c0009959:	90                   	nop
c000995a:	c9                   	leave  
c000995b:	c3                   	ret    

c000995c <TaskSys>:
c000995c:	55                   	push   %ebp
c000995d:	89 e5                	mov    %esp,%ebp
c000995f:	eb fe                	jmp    c000995f <TaskSys+0x3>

c0009961 <Printf>:
c0009961:	55                   	push   %ebp
c0009962:	89 e5                	mov    %esp,%ebp
c0009964:	81 ec 18 01 00 00    	sub    $0x118,%esp
c000996a:	83 ec 04             	sub    $0x4,%esp
c000996d:	68 00 01 00 00       	push   $0x100
c0009972:	6a 00                	push   $0x0
c0009974:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c000997a:	50                   	push   %eax
c000997b:	e8 6b 2a 00 00       	call   c000c3eb <Memset>
c0009980:	83 c4 10             	add    $0x10,%esp
c0009983:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009986:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009989:	8b 45 08             	mov    0x8(%ebp),%eax
c000998c:	83 ec 04             	sub    $0x4,%esp
c000998f:	ff 75 f4             	pushl  -0xc(%ebp)
c0009992:	50                   	push   %eax
c0009993:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009999:	50                   	push   %eax
c000999a:	e8 20 00 00 00       	call   c00099bf <vsprintf>
c000999f:	83 c4 10             	add    $0x10,%esp
c00099a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099a5:	83 ec 04             	sub    $0x4,%esp
c00099a8:	ff 75 f0             	pushl  -0x10(%ebp)
c00099ab:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00099b1:	50                   	push   %eax
c00099b2:	6a 00                	push   $0x0
c00099b4:	e8 b8 c5 ff ff       	call   c0005f71 <write>
c00099b9:	83 c4 10             	add    $0x10,%esp
c00099bc:	90                   	nop
c00099bd:	c9                   	leave  
c00099be:	c3                   	ret    

c00099bf <vsprintf>:
c00099bf:	55                   	push   %ebp
c00099c0:	89 e5                	mov    %esp,%ebp
c00099c2:	81 ec 68 02 00 00    	sub    $0x268,%esp
c00099c8:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c00099ce:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c00099d4:	83 ec 04             	sub    $0x4,%esp
c00099d7:	6a 40                	push   $0x40
c00099d9:	6a 00                	push   $0x0
c00099db:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00099e1:	50                   	push   %eax
c00099e2:	e8 04 2a 00 00       	call   c000c3eb <Memset>
c00099e7:	83 c4 10             	add    $0x10,%esp
c00099ea:	8b 45 10             	mov    0x10(%ebp),%eax
c00099ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099f0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00099f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00099fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00099fd:	e9 53 01 00 00       	jmp    c0009b55 <vsprintf+0x196>
c0009a02:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009a05:	0f b6 00             	movzbl (%eax),%eax
c0009a08:	3c 25                	cmp    $0x25,%al
c0009a0a:	74 16                	je     c0009a22 <vsprintf+0x63>
c0009a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a0f:	8d 50 01             	lea    0x1(%eax),%edx
c0009a12:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009a15:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009a18:	0f b6 12             	movzbl (%edx),%edx
c0009a1b:	88 10                	mov    %dl,(%eax)
c0009a1d:	e9 2f 01 00 00       	jmp    c0009b51 <vsprintf+0x192>
c0009a22:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009a26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009a29:	0f b6 00             	movzbl (%eax),%eax
c0009a2c:	0f be c0             	movsbl %al,%eax
c0009a2f:	83 f8 64             	cmp    $0x64,%eax
c0009a32:	74 26                	je     c0009a5a <vsprintf+0x9b>
c0009a34:	83 f8 64             	cmp    $0x64,%eax
c0009a37:	7f 0e                	jg     c0009a47 <vsprintf+0x88>
c0009a39:	83 f8 63             	cmp    $0x63,%eax
c0009a3c:	0f 84 f2 00 00 00    	je     c0009b34 <vsprintf+0x175>
c0009a42:	e9 0a 01 00 00       	jmp    c0009b51 <vsprintf+0x192>
c0009a47:	83 f8 73             	cmp    $0x73,%eax
c0009a4a:	0f 84 b0 00 00 00    	je     c0009b00 <vsprintf+0x141>
c0009a50:	83 f8 78             	cmp    $0x78,%eax
c0009a53:	74 5d                	je     c0009ab2 <vsprintf+0xf3>
c0009a55:	e9 f7 00 00 00       	jmp    c0009b51 <vsprintf+0x192>
c0009a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009a5d:	8b 00                	mov    (%eax),%eax
c0009a5f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009a62:	83 ec 04             	sub    $0x4,%esp
c0009a65:	6a 0a                	push   $0xa
c0009a67:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0009a6d:	50                   	push   %eax
c0009a6e:	ff 75 e8             	pushl  -0x18(%ebp)
c0009a71:	e8 47 0d 00 00       	call   c000a7bd <itoa>
c0009a76:	83 c4 10             	add    $0x10,%esp
c0009a79:	83 ec 08             	sub    $0x8,%esp
c0009a7c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009a82:	50                   	push   %eax
c0009a83:	ff 75 f4             	pushl  -0xc(%ebp)
c0009a86:	e8 7f 29 00 00       	call   c000c40a <Strcpy>
c0009a8b:	83 c4 10             	add    $0x10,%esp
c0009a8e:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009a92:	83 ec 0c             	sub    $0xc,%esp
c0009a95:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009a9b:	50                   	push   %eax
c0009a9c:	e8 83 29 00 00       	call   c000c424 <Strlen>
c0009aa1:	83 c4 10             	add    $0x10,%esp
c0009aa4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009aa7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009aaa:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009aad:	e9 9f 00 00 00       	jmp    c0009b51 <vsprintf+0x192>
c0009ab2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ab5:	8b 00                	mov    (%eax),%eax
c0009ab7:	83 ec 08             	sub    $0x8,%esp
c0009aba:	50                   	push   %eax
c0009abb:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009ac1:	50                   	push   %eax
c0009ac2:	e8 55 e5 ff ff       	call   c000801c <atoi>
c0009ac7:	83 c4 10             	add    $0x10,%esp
c0009aca:	83 ec 08             	sub    $0x8,%esp
c0009acd:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009ad3:	50                   	push   %eax
c0009ad4:	ff 75 f4             	pushl  -0xc(%ebp)
c0009ad7:	e8 2e 29 00 00       	call   c000c40a <Strcpy>
c0009adc:	83 c4 10             	add    $0x10,%esp
c0009adf:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009ae3:	83 ec 0c             	sub    $0xc,%esp
c0009ae6:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009aec:	50                   	push   %eax
c0009aed:	e8 32 29 00 00       	call   c000c424 <Strlen>
c0009af2:	83 c4 10             	add    $0x10,%esp
c0009af5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009af8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009afb:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009afe:	eb 51                	jmp    c0009b51 <vsprintf+0x192>
c0009b00:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b03:	8b 00                	mov    (%eax),%eax
c0009b05:	83 ec 08             	sub    $0x8,%esp
c0009b08:	50                   	push   %eax
c0009b09:	ff 75 f4             	pushl  -0xc(%ebp)
c0009b0c:	e8 f9 28 00 00       	call   c000c40a <Strcpy>
c0009b11:	83 c4 10             	add    $0x10,%esp
c0009b14:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b17:	8b 00                	mov    (%eax),%eax
c0009b19:	83 ec 0c             	sub    $0xc,%esp
c0009b1c:	50                   	push   %eax
c0009b1d:	e8 02 29 00 00       	call   c000c424 <Strlen>
c0009b22:	83 c4 10             	add    $0x10,%esp
c0009b25:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009b28:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009b2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009b2f:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009b32:	eb 1d                	jmp    c0009b51 <vsprintf+0x192>
c0009b34:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b37:	0f b6 10             	movzbl (%eax),%edx
c0009b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b3d:	88 10                	mov    %dl,(%eax)
c0009b3f:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009b43:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009b4a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009b4d:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009b50:	90                   	nop
c0009b51:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009b55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009b58:	0f b6 00             	movzbl (%eax),%eax
c0009b5b:	84 c0                	test   %al,%al
c0009b5d:	0f 85 9f fe ff ff    	jne    c0009a02 <vsprintf+0x43>
c0009b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b66:	2b 45 08             	sub    0x8(%ebp),%eax
c0009b69:	c9                   	leave  
c0009b6a:	c3                   	ret    

c0009b6b <printx>:
c0009b6b:	55                   	push   %ebp
c0009b6c:	89 e5                	mov    %esp,%ebp
c0009b6e:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009b74:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009b77:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009b7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b7d:	83 ec 04             	sub    $0x4,%esp
c0009b80:	ff 75 f4             	pushl  -0xc(%ebp)
c0009b83:	50                   	push   %eax
c0009b84:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009b8a:	50                   	push   %eax
c0009b8b:	e8 2f fe ff ff       	call   c00099bf <vsprintf>
c0009b90:	83 c4 10             	add    $0x10,%esp
c0009b93:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b96:	83 ec 08             	sub    $0x8,%esp
c0009b99:	ff 75 f0             	pushl  -0x10(%ebp)
c0009b9c:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009ba2:	50                   	push   %eax
c0009ba3:	e8 a0 8d ff ff       	call   c0002948 <write_debug>
c0009ba8:	83 c4 10             	add    $0x10,%esp
c0009bab:	90                   	nop
c0009bac:	c9                   	leave  
c0009bad:	c3                   	ret    

c0009bae <sys_printx>:
c0009bae:	55                   	push   %ebp
c0009baf:	89 e5                	mov    %esp,%ebp
c0009bb1:	83 ec 28             	sub    $0x28,%esp
c0009bb4:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009bb9:	85 c0                	test   %eax,%eax
c0009bbb:	75 15                	jne    c0009bd2 <sys_printx+0x24>
c0009bbd:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bc0:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009bc6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009bc9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009bd0:	eb 10                	jmp    c0009be2 <sys_printx+0x34>
c0009bd2:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009bd7:	85 c0                	test   %eax,%eax
c0009bd9:	74 07                	je     c0009be2 <sys_printx+0x34>
c0009bdb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009be2:	8b 55 08             	mov    0x8(%ebp),%edx
c0009be5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009be8:	01 d0                	add    %edx,%eax
c0009bea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009bed:	8b 45 10             	mov    0x10(%ebp),%eax
c0009bf0:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009bf6:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009bfc:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0009c01:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009c04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009c07:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c0d:	0f b6 00             	movzbl (%eax),%eax
c0009c10:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0009c13:	eb 3a                	jmp    c0009c4f <sys_printx+0xa1>
c0009c15:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c18:	0f b6 00             	movzbl (%eax),%eax
c0009c1b:	3c 3b                	cmp    $0x3b,%al
c0009c1d:	74 0a                	je     c0009c29 <sys_printx+0x7b>
c0009c1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c22:	0f b6 00             	movzbl (%eax),%eax
c0009c25:	3c 3a                	cmp    $0x3a,%al
c0009c27:	75 06                	jne    c0009c2f <sys_printx+0x81>
c0009c29:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009c2d:	eb 20                	jmp    c0009c4f <sys_printx+0xa1>
c0009c2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c32:	0f b6 00             	movzbl (%eax),%eax
c0009c35:	0f b6 c0             	movzbl %al,%eax
c0009c38:	83 ec 08             	sub    $0x8,%esp
c0009c3b:	50                   	push   %eax
c0009c3c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009c3f:	e8 b5 b5 ff ff       	call   c00051f9 <out_char>
c0009c44:	83 c4 10             	add    $0x10,%esp
c0009c47:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009c4b:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009c4f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009c53:	7f c0                	jg     c0009c15 <sys_printx+0x67>
c0009c55:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009c59:	75 10                	jne    c0009c6b <sys_printx+0xbd>
c0009c5b:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009c60:	85 c0                	test   %eax,%eax
c0009c62:	74 13                	je     c0009c77 <sys_printx+0xc9>
c0009c64:	e8 52 7b ff ff       	call   c00017bb <disable_int>
c0009c69:	eb 0c                	jmp    c0009c77 <sys_printx+0xc9>
c0009c6b:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009c6f:	75 06                	jne    c0009c77 <sys_printx+0xc9>
c0009c71:	e8 45 7b ff ff       	call   c00017bb <disable_int>
c0009c76:	90                   	nop
c0009c77:	90                   	nop
c0009c78:	c9                   	leave  
c0009c79:	c3                   	ret    

c0009c7a <spin>:
c0009c7a:	55                   	push   %ebp
c0009c7b:	89 e5                	mov    %esp,%ebp
c0009c7d:	83 ec 08             	sub    $0x8,%esp
c0009c80:	83 ec 0c             	sub    $0xc,%esp
c0009c83:	ff 75 08             	pushl  0x8(%ebp)
c0009c86:	e8 01 79 ff ff       	call   c000158c <disp_str>
c0009c8b:	83 c4 10             	add    $0x10,%esp
c0009c8e:	83 ec 0c             	sub    $0xc,%esp
c0009c91:	68 ef bb 00 c0       	push   $0xc000bbef
c0009c96:	e8 f1 78 ff ff       	call   c000158c <disp_str>
c0009c9b:	83 c4 10             	add    $0x10,%esp
c0009c9e:	eb fe                	jmp    c0009c9e <spin+0x24>

c0009ca0 <panic>:
c0009ca0:	55                   	push   %ebp
c0009ca1:	89 e5                	mov    %esp,%ebp
c0009ca3:	83 ec 08             	sub    $0x8,%esp
c0009ca6:	83 ec 04             	sub    $0x4,%esp
c0009ca9:	ff 75 08             	pushl  0x8(%ebp)
c0009cac:	6a 3a                	push   $0x3a
c0009cae:	68 e9 c0 00 c0       	push   $0xc000c0e9
c0009cb3:	e8 b3 fe ff ff       	call   c0009b6b <printx>
c0009cb8:	83 c4 10             	add    $0x10,%esp
c0009cbb:	90                   	nop
c0009cbc:	c9                   	leave  
c0009cbd:	c3                   	ret    

c0009cbe <assertion_failure>:
c0009cbe:	55                   	push   %ebp
c0009cbf:	89 e5                	mov    %esp,%ebp
c0009cc1:	83 ec 08             	sub    $0x8,%esp
c0009cc4:	83 ec 08             	sub    $0x8,%esp
c0009cc7:	ff 75 14             	pushl  0x14(%ebp)
c0009cca:	ff 75 10             	pushl  0x10(%ebp)
c0009ccd:	ff 75 0c             	pushl  0xc(%ebp)
c0009cd0:	ff 75 08             	pushl  0x8(%ebp)
c0009cd3:	6a 3b                	push   $0x3b
c0009cd5:	68 f0 c0 00 c0       	push   $0xc000c0f0
c0009cda:	e8 8c fe ff ff       	call   c0009b6b <printx>
c0009cdf:	83 c4 20             	add    $0x20,%esp
c0009ce2:	83 ec 0c             	sub    $0xc,%esp
c0009ce5:	68 23 c1 00 c0       	push   $0xc000c123
c0009cea:	e8 8b ff ff ff       	call   c0009c7a <spin>
c0009cef:	83 c4 10             	add    $0x10,%esp
c0009cf2:	90                   	nop
c0009cf3:	c9                   	leave  
c0009cf4:	c3                   	ret    

c0009cf5 <dead_lock>:
c0009cf5:	55                   	push   %ebp
c0009cf6:	89 e5                	mov    %esp,%ebp
c0009cf8:	b8 00 00 00 00       	mov    $0x0,%eax
c0009cfd:	5d                   	pop    %ebp
c0009cfe:	c3                   	ret    

c0009cff <sys_send_msg>:
c0009cff:	55                   	push   %ebp
c0009d00:	89 e5                	mov    %esp,%ebp
c0009d02:	83 ec 38             	sub    $0x38,%esp
c0009d05:	83 ec 0c             	sub    $0xc,%esp
c0009d08:	ff 75 0c             	pushl  0xc(%ebp)
c0009d0b:	e8 76 ae ff ff       	call   c0004b86 <pid2proc>
c0009d10:	83 c4 10             	add    $0x10,%esp
c0009d13:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009d16:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009d1a:	74 2c                	je     c0009d48 <sys_send_msg+0x49>
c0009d1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d1f:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009d25:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009d2a:	74 1c                	je     c0009d48 <sys_send_msg+0x49>
c0009d2c:	68 0b 06 00 00       	push   $0x60b
c0009d31:	68 2f c1 00 c0       	push   $0xc000c12f
c0009d36:	68 2f c1 00 c0       	push   $0xc000c12f
c0009d3b:	68 40 c1 00 c0       	push   $0xc000c140
c0009d40:	e8 79 ff ff ff       	call   c0009cbe <assertion_failure>
c0009d45:	83 c4 10             	add    $0x10,%esp
c0009d48:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d4b:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009d51:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009d56:	74 1c                	je     c0009d74 <sys_send_msg+0x75>
c0009d58:	68 0d 06 00 00       	push   $0x60d
c0009d5d:	68 2f c1 00 c0       	push   $0xc000c12f
c0009d62:	68 2f c1 00 c0       	push   $0xc000c12f
c0009d67:	68 68 c1 00 c0       	push   $0xc000c168
c0009d6c:	e8 4d ff ff ff       	call   c0009cbe <assertion_failure>
c0009d71:	83 c4 10             	add    $0x10,%esp
c0009d74:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009d78:	75 22                	jne    c0009d9c <sys_send_msg+0x9d>
c0009d7a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009d7e:	75 1c                	jne    c0009d9c <sys_send_msg+0x9d>
c0009d80:	68 10 06 00 00       	push   $0x610
c0009d85:	68 2f c1 00 c0       	push   $0xc000c12f
c0009d8a:	68 2f c1 00 c0       	push   $0xc000c12f
c0009d8f:	68 8b c1 00 c0       	push   $0xc000c18b
c0009d94:	e8 25 ff ff ff       	call   c0009cbe <assertion_failure>
c0009d99:	83 c4 10             	add    $0x10,%esp
c0009d9c:	83 ec 0c             	sub    $0xc,%esp
c0009d9f:	ff 75 10             	pushl  0x10(%ebp)
c0009da2:	e8 51 ae ff ff       	call   c0004bf8 <proc2pid>
c0009da7:	83 c4 10             	add    $0x10,%esp
c0009daa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009dad:	8b 45 10             	mov    0x10(%ebp),%eax
c0009db0:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009db6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009db9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009dc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0009dc3:	83 ec 08             	sub    $0x8,%esp
c0009dc6:	6a 6c                	push   $0x6c
c0009dc8:	50                   	push   %eax
c0009dc9:	e8 fb d1 ff ff       	call   c0006fc9 <alloc_virtual_memory>
c0009dce:	83 c4 10             	add    $0x10,%esp
c0009dd1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009dd4:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0009ddb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009dde:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009de1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009de4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009de7:	89 10                	mov    %edx,(%eax)
c0009de9:	83 ec 08             	sub    $0x8,%esp
c0009dec:	ff 75 0c             	pushl  0xc(%ebp)
c0009def:	ff 75 e8             	pushl  -0x18(%ebp)
c0009df2:	e8 fe fe ff ff       	call   c0009cf5 <dead_lock>
c0009df7:	83 c4 10             	add    $0x10,%esp
c0009dfa:	83 f8 01             	cmp    $0x1,%eax
c0009dfd:	75 10                	jne    c0009e0f <sys_send_msg+0x110>
c0009dff:	83 ec 0c             	sub    $0xc,%esp
c0009e02:	68 9b c1 00 c0       	push   $0xc000c19b
c0009e07:	e8 94 fe ff ff       	call   c0009ca0 <panic>
c0009e0c:	83 c4 10             	add    $0x10,%esp
c0009e0f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e12:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009e19:	3c 02                	cmp    $0x2,%al
c0009e1b:	0f 85 99 01 00 00    	jne    c0009fba <sys_send_msg+0x2bb>
c0009e21:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e24:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009e2a:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0009e2d:	74 12                	je     c0009e41 <sys_send_msg+0x142>
c0009e2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e32:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009e38:	83 f8 12             	cmp    $0x12,%eax
c0009e3b:	0f 85 79 01 00 00    	jne    c0009fba <sys_send_msg+0x2bb>
c0009e41:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e44:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009e4a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009e4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e50:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009e56:	83 ec 08             	sub    $0x8,%esp
c0009e59:	6a 6c                	push   $0x6c
c0009e5b:	50                   	push   %eax
c0009e5c:	e8 68 d1 ff ff       	call   c0006fc9 <alloc_virtual_memory>
c0009e61:	83 c4 10             	add    $0x10,%esp
c0009e64:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009e67:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009e6a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009e6d:	83 ec 04             	sub    $0x4,%esp
c0009e70:	ff 75 d8             	pushl  -0x28(%ebp)
c0009e73:	52                   	push   %edx
c0009e74:	50                   	push   %eax
c0009e75:	e8 5f de ff ff       	call   c0007cd9 <Memcpy>
c0009e7a:	83 c4 10             	add    $0x10,%esp
c0009e7d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e80:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009e87:	00 00 00 
c0009e8a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e8d:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009e94:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e97:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009e9e:	00 00 00 
c0009ea1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ea4:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009eab:	00 00 00 
c0009eae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009eb1:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009eb8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ebb:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009ec2:	00 00 00 
c0009ec5:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ec8:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009ecf:	00 00 00 
c0009ed2:	83 ec 0c             	sub    $0xc,%esp
c0009ed5:	ff 75 ec             	pushl  -0x14(%ebp)
c0009ed8:	e8 45 08 00 00       	call   c000a722 <unblock>
c0009edd:	83 c4 10             	add    $0x10,%esp
c0009ee0:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ee3:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009eea:	84 c0                	test   %al,%al
c0009eec:	74 1c                	je     c0009f0a <sys_send_msg+0x20b>
c0009eee:	68 41 06 00 00       	push   $0x641
c0009ef3:	68 2f c1 00 c0       	push   $0xc000c12f
c0009ef8:	68 2f c1 00 c0       	push   $0xc000c12f
c0009efd:	68 a6 c1 00 c0       	push   $0xc000c1a6
c0009f02:	e8 b7 fd ff ff       	call   c0009cbe <assertion_failure>
c0009f07:	83 c4 10             	add    $0x10,%esp
c0009f0a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f0d:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009f13:	83 f8 21             	cmp    $0x21,%eax
c0009f16:	74 1c                	je     c0009f34 <sys_send_msg+0x235>
c0009f18:	68 42 06 00 00       	push   $0x642
c0009f1d:	68 2f c1 00 c0       	push   $0xc000c12f
c0009f22:	68 2f c1 00 c0       	push   $0xc000c12f
c0009f27:	68 ba c1 00 c0       	push   $0xc000c1ba
c0009f2c:	e8 8d fd ff ff       	call   c0009cbe <assertion_failure>
c0009f31:	83 c4 10             	add    $0x10,%esp
c0009f34:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009f37:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009f3d:	85 c0                	test   %eax,%eax
c0009f3f:	74 1c                	je     c0009f5d <sys_send_msg+0x25e>
c0009f41:	68 44 06 00 00       	push   $0x644
c0009f46:	68 2f c1 00 c0       	push   $0xc000c12f
c0009f4b:	68 2f c1 00 c0       	push   $0xc000c12f
c0009f50:	68 d7 c1 00 c0       	push   $0xc000c1d7
c0009f55:	e8 64 fd ff ff       	call   c0009cbe <assertion_failure>
c0009f5a:	83 c4 10             	add    $0x10,%esp
c0009f5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009f60:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f67:	84 c0                	test   %al,%al
c0009f69:	74 1c                	je     c0009f87 <sys_send_msg+0x288>
c0009f6b:	68 45 06 00 00       	push   $0x645
c0009f70:	68 2f c1 00 c0       	push   $0xc000c12f
c0009f75:	68 2f c1 00 c0       	push   $0xc000c12f
c0009f7a:	68 ec c1 00 c0       	push   $0xc000c1ec
c0009f7f:	e8 3a fd ff ff       	call   c0009cbe <assertion_failure>
c0009f84:	83 c4 10             	add    $0x10,%esp
c0009f87:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009f8a:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009f90:	83 f8 21             	cmp    $0x21,%eax
c0009f93:	0f 84 45 01 00 00    	je     c000a0de <sys_send_msg+0x3df>
c0009f99:	68 46 06 00 00       	push   $0x646
c0009f9e:	68 2f c1 00 c0       	push   $0xc000c12f
c0009fa3:	68 2f c1 00 c0       	push   $0xc000c12f
c0009fa8:	68 04 c2 00 c0       	push   $0xc000c204
c0009fad:	e8 0c fd ff ff       	call   c0009cbe <assertion_failure>
c0009fb2:	83 c4 10             	add    $0x10,%esp
c0009fb5:	e9 24 01 00 00       	jmp    c000a0de <sys_send_msg+0x3df>
c0009fba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009fc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009fc4:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009fc7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009fca:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009fd0:	85 c0                	test   %eax,%eax
c0009fd2:	75 1b                	jne    c0009fef <sys_send_msg+0x2f0>
c0009fd4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009fd7:	8b 55 10             	mov    0x10(%ebp),%edx
c0009fda:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009fe0:	8b 45 10             	mov    0x10(%ebp),%eax
c0009fe3:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009fea:	00 00 00 
c0009fed:	eb 3f                	jmp    c000a02e <sys_send_msg+0x32f>
c0009fef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ff2:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009ff8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ffb:	eb 12                	jmp    c000a00f <sys_send_msg+0x310>
c0009ffd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a000:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a003:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a006:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c000a00c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a00f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a013:	75 e8                	jne    c0009ffd <sys_send_msg+0x2fe>
c000a015:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a018:	8b 55 10             	mov    0x10(%ebp),%edx
c000a01b:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000a021:	8b 45 10             	mov    0x10(%ebp),%eax
c000a024:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a02b:	00 00 00 
c000a02e:	8b 45 10             	mov    0x10(%ebp),%eax
c000a031:	8b 55 08             	mov    0x8(%ebp),%edx
c000a034:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c000a03a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a03d:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a040:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c000a046:	8b 45 10             	mov    0x10(%ebp),%eax
c000a049:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c000a050:	8b 45 10             	mov    0x10(%ebp),%eax
c000a053:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a05a:	3c 01                	cmp    $0x1,%al
c000a05c:	74 1c                	je     c000a07a <sys_send_msg+0x37b>
c000a05e:	68 67 06 00 00       	push   $0x667
c000a063:	68 2f c1 00 c0       	push   $0xc000c12f
c000a068:	68 2f c1 00 c0       	push   $0xc000c12f
c000a06d:	68 28 c2 00 c0       	push   $0xc000c228
c000a072:	e8 47 fc ff ff       	call   c0009cbe <assertion_failure>
c000a077:	83 c4 10             	add    $0x10,%esp
c000a07a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a07d:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a083:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000a086:	74 1c                	je     c000a0a4 <sys_send_msg+0x3a5>
c000a088:	68 68 06 00 00       	push   $0x668
c000a08d:	68 2f c1 00 c0       	push   $0xc000c12f
c000a092:	68 2f c1 00 c0       	push   $0xc000c12f
c000a097:	68 44 c2 00 c0       	push   $0xc000c244
c000a09c:	e8 1d fc ff ff       	call   c0009cbe <assertion_failure>
c000a0a1:	83 c4 10             	add    $0x10,%esp
c000a0a4:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0a7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a0ad:	39 45 08             	cmp    %eax,0x8(%ebp)
c000a0b0:	74 1c                	je     c000a0ce <sys_send_msg+0x3cf>
c000a0b2:	68 69 06 00 00       	push   $0x669
c000a0b7:	68 2f c1 00 c0       	push   $0xc000c12f
c000a0bc:	68 2f c1 00 c0       	push   $0xc000c12f
c000a0c1:	68 66 c2 00 c0       	push   $0xc000c266
c000a0c6:	e8 f3 fb ff ff       	call   c0009cbe <assertion_failure>
c000a0cb:	83 c4 10             	add    $0x10,%esp
c000a0ce:	83 ec 0c             	sub    $0xc,%esp
c000a0d1:	ff 75 10             	pushl  0x10(%ebp)
c000a0d4:	e8 0d 06 00 00       	call   c000a6e6 <block>
c000a0d9:	83 c4 10             	add    $0x10,%esp
c000a0dc:	eb 01                	jmp    c000a0df <sys_send_msg+0x3e0>
c000a0de:	90                   	nop
c000a0df:	b8 00 00 00 00       	mov    $0x0,%eax
c000a0e4:	c9                   	leave  
c000a0e5:	c3                   	ret    

c000a0e6 <sys_receive_msg>:
c000a0e6:	55                   	push   %ebp
c000a0e7:	89 e5                	mov    %esp,%ebp
c000a0e9:	83 ec 48             	sub    $0x48,%esp
c000a0ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a0f3:	83 ec 0c             	sub    $0xc,%esp
c000a0f6:	ff 75 0c             	pushl  0xc(%ebp)
c000a0f9:	e8 88 aa ff ff       	call   c0004b86 <pid2proc>
c000a0fe:	83 c4 10             	add    $0x10,%esp
c000a101:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a104:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c000a108:	74 2c                	je     c000a136 <sys_receive_msg+0x50>
c000a10a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a10d:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000a113:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c000a118:	74 1c                	je     c000a136 <sys_receive_msg+0x50>
c000a11a:	68 7d 06 00 00       	push   $0x67d
c000a11f:	68 2f c1 00 c0       	push   $0xc000c12f
c000a124:	68 2f c1 00 c0       	push   $0xc000c12f
c000a129:	68 68 c1 00 c0       	push   $0xc000c168
c000a12e:	e8 8b fb ff ff       	call   c0009cbe <assertion_failure>
c000a133:	83 c4 10             	add    $0x10,%esp
c000a136:	8b 45 10             	mov    0x10(%ebp),%eax
c000a139:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000a13f:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c000a144:	74 1c                	je     c000a162 <sys_receive_msg+0x7c>
c000a146:	68 7f 06 00 00       	push   $0x67f
c000a14b:	68 2f c1 00 c0       	push   $0xc000c12f
c000a150:	68 2f c1 00 c0       	push   $0xc000c12f
c000a155:	68 40 c1 00 c0       	push   $0xc000c140
c000a15a:	e8 5f fb ff ff       	call   c0009cbe <assertion_failure>
c000a15f:	83 c4 10             	add    $0x10,%esp
c000a162:	83 ec 0c             	sub    $0xc,%esp
c000a165:	ff 75 10             	pushl  0x10(%ebp)
c000a168:	e8 8b aa ff ff       	call   c0004bf8 <proc2pid>
c000a16d:	83 c4 10             	add    $0x10,%esp
c000a170:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a173:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a17a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a17d:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c000a183:	85 c0                	test   %eax,%eax
c000a185:	0f 84 b5 00 00 00    	je     c000a240 <sys_receive_msg+0x15a>
c000a18b:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a18f:	74 0d                	je     c000a19e <sys_receive_msg+0xb8>
c000a191:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c000a198:	0f 85 a2 00 00 00    	jne    c000a240 <sys_receive_msg+0x15a>
c000a19e:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c000a1a5:	83 ec 0c             	sub    $0xc,%esp
c000a1a8:	ff 75 dc             	pushl  -0x24(%ebp)
c000a1ab:	e8 f4 87 ff ff       	call   c00029a4 <sys_malloc>
c000a1b0:	83 c4 10             	add    $0x10,%esp
c000a1b3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a1b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a1b9:	83 ec 04             	sub    $0x4,%esp
c000a1bc:	50                   	push   %eax
c000a1bd:	6a 00                	push   $0x0
c000a1bf:	ff 75 d8             	pushl  -0x28(%ebp)
c000a1c2:	e8 24 22 00 00       	call   c000c3eb <Memset>
c000a1c7:	83 c4 10             	add    $0x10,%esp
c000a1ca:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a1cd:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a1d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a1d6:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000a1dd:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1e0:	83 ec 08             	sub    $0x8,%esp
c000a1e3:	ff 75 dc             	pushl  -0x24(%ebp)
c000a1e6:	50                   	push   %eax
c000a1e7:	e8 dd cd ff ff       	call   c0006fc9 <alloc_virtual_memory>
c000a1ec:	83 c4 10             	add    $0x10,%esp
c000a1ef:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a1f2:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000a1f5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000a1f8:	83 ec 04             	sub    $0x4,%esp
c000a1fb:	52                   	push   %edx
c000a1fc:	ff 75 d8             	pushl  -0x28(%ebp)
c000a1ff:	50                   	push   %eax
c000a200:	e8 d4 da ff ff       	call   c0007cd9 <Memcpy>
c000a205:	83 c4 10             	add    $0x10,%esp
c000a208:	8b 45 10             	mov    0x10(%ebp),%eax
c000a20b:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a212:	00 00 00 
c000a215:	8b 45 10             	mov    0x10(%ebp),%eax
c000a218:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a21f:	00 00 00 
c000a222:	8b 45 10             	mov    0x10(%ebp),%eax
c000a225:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a22c:	00 00 00 
c000a22f:	8b 45 10             	mov    0x10(%ebp),%eax
c000a232:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a239:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000a240:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000a244:	0f 84 96 03 00 00    	je     c000a5e0 <sys_receive_msg+0x4fa>
c000a24a:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a24e:	75 26                	jne    c000a276 <sys_receive_msg+0x190>
c000a250:	8b 45 10             	mov    0x10(%ebp),%eax
c000a253:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a259:	85 c0                	test   %eax,%eax
c000a25b:	0f 84 8a 00 00 00    	je     c000a2eb <sys_receive_msg+0x205>
c000a261:	8b 45 10             	mov    0x10(%ebp),%eax
c000a264:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a26a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a26d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a274:	eb 75                	jmp    c000a2eb <sys_receive_msg+0x205>
c000a276:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a27a:	78 6f                	js     c000a2eb <sys_receive_msg+0x205>
c000a27c:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c000a280:	7f 69                	jg     c000a2eb <sys_receive_msg+0x205>
c000a282:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a285:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a28c:	3c 01                	cmp    $0x1,%al
c000a28e:	75 5b                	jne    c000a2eb <sys_receive_msg+0x205>
c000a290:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a293:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a299:	83 f8 12             	cmp    $0x12,%eax
c000a29c:	74 0e                	je     c000a2ac <sys_receive_msg+0x1c6>
c000a29e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a2a1:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a2a7:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c000a2aa:	75 3f                	jne    c000a2eb <sys_receive_msg+0x205>
c000a2ac:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2af:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a2b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a2b8:	eb 2b                	jmp    c000a2e5 <sys_receive_msg+0x1ff>
c000a2ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a2c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2c3:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c000a2c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a2cc:	39 c2                	cmp    %eax,%edx
c000a2ce:	75 09                	jne    c000a2d9 <sys_receive_msg+0x1f3>
c000a2d0:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a2d7:	eb 12                	jmp    c000a2eb <sys_receive_msg+0x205>
c000a2d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2dc:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c000a2e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a2e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a2e9:	75 cf                	jne    c000a2ba <sys_receive_msg+0x1d4>
c000a2eb:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000a2ef:	0f 85 21 02 00 00    	jne    c000a516 <sys_receive_msg+0x430>
c000a2f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a2fb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a2fe:	83 ec 08             	sub    $0x8,%esp
c000a301:	6a 6c                	push   $0x6c
c000a303:	50                   	push   %eax
c000a304:	e8 c0 cc ff ff       	call   c0006fc9 <alloc_virtual_memory>
c000a309:	83 c4 10             	add    $0x10,%esp
c000a30c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a30f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a312:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a318:	83 ec 08             	sub    $0x8,%esp
c000a31b:	6a 6c                	push   $0x6c
c000a31d:	50                   	push   %eax
c000a31e:	e8 a6 cc ff ff       	call   c0006fc9 <alloc_virtual_memory>
c000a323:	83 c4 10             	add    $0x10,%esp
c000a326:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a329:	83 ec 04             	sub    $0x4,%esp
c000a32c:	6a 6c                	push   $0x6c
c000a32e:	ff 75 c8             	pushl  -0x38(%ebp)
c000a331:	ff 75 cc             	pushl  -0x34(%ebp)
c000a334:	e8 a0 d9 ff ff       	call   c0007cd9 <Memcpy>
c000a339:	83 c4 10             	add    $0x10,%esp
c000a33c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a33f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a342:	8b 45 10             	mov    0x10(%ebp),%eax
c000a345:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a34b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000a34e:	75 21                	jne    c000a371 <sys_receive_msg+0x28b>
c000a350:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a353:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a359:	8b 45 10             	mov    0x10(%ebp),%eax
c000a35c:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000a362:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a365:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a36c:	00 00 00 
c000a36f:	eb 1f                	jmp    c000a390 <sys_receive_msg+0x2aa>
c000a371:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a374:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a37a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a37d:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000a383:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a386:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a38d:	00 00 00 
c000a390:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a393:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a39a:	00 00 00 
c000a39d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a3a0:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a3a7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a3aa:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a3b1:	00 00 00 
c000a3b4:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3b7:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a3be:	00 00 00 
c000a3c1:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3c4:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a3cb:	00 00 00 
c000a3ce:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3d1:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a3d8:	00 00 00 
c000a3db:	83 ec 0c             	sub    $0xc,%esp
c000a3de:	ff 75 d0             	pushl  -0x30(%ebp)
c000a3e1:	e8 3c 03 00 00       	call   c000a722 <unblock>
c000a3e6:	83 c4 10             	add    $0x10,%esp
c000a3e9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a3ec:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a3f2:	85 c0                	test   %eax,%eax
c000a3f4:	74 1c                	je     c000a412 <sys_receive_msg+0x32c>
c000a3f6:	68 e9 06 00 00       	push   $0x6e9
c000a3fb:	68 2f c1 00 c0       	push   $0xc000c12f
c000a400:	68 2f c1 00 c0       	push   $0xc000c12f
c000a405:	68 7b c2 00 c0       	push   $0xc000c27b
c000a40a:	e8 af f8 ff ff       	call   c0009cbe <assertion_failure>
c000a40f:	83 c4 10             	add    $0x10,%esp
c000a412:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a415:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a41c:	84 c0                	test   %al,%al
c000a41e:	74 1c                	je     c000a43c <sys_receive_msg+0x356>
c000a420:	68 ea 06 00 00       	push   $0x6ea
c000a425:	68 2f c1 00 c0       	push   $0xc000c12f
c000a42a:	68 2f c1 00 c0       	push   $0xc000c12f
c000a42f:	68 93 c2 00 c0       	push   $0xc000c293
c000a434:	e8 85 f8 ff ff       	call   c0009cbe <assertion_failure>
c000a439:	83 c4 10             	add    $0x10,%esp
c000a43c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a43f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a445:	83 f8 21             	cmp    $0x21,%eax
c000a448:	74 1c                	je     c000a466 <sys_receive_msg+0x380>
c000a44a:	68 eb 06 00 00       	push   $0x6eb
c000a44f:	68 2f c1 00 c0       	push   $0xc000c12f
c000a454:	68 2f c1 00 c0       	push   $0xc000c12f
c000a459:	68 ac c2 00 c0       	push   $0xc000c2ac
c000a45e:	e8 5b f8 ff ff       	call   c0009cbe <assertion_failure>
c000a463:	83 c4 10             	add    $0x10,%esp
c000a466:	8b 45 10             	mov    0x10(%ebp),%eax
c000a469:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a46f:	85 c0                	test   %eax,%eax
c000a471:	74 1c                	je     c000a48f <sys_receive_msg+0x3a9>
c000a473:	68 ed 06 00 00       	push   $0x6ed
c000a478:	68 2f c1 00 c0       	push   $0xc000c12f
c000a47d:	68 2f c1 00 c0       	push   $0xc000c12f
c000a482:	68 d7 c1 00 c0       	push   $0xc000c1d7
c000a487:	e8 32 f8 ff ff       	call   c0009cbe <assertion_failure>
c000a48c:	83 c4 10             	add    $0x10,%esp
c000a48f:	8b 45 10             	mov    0x10(%ebp),%eax
c000a492:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a499:	84 c0                	test   %al,%al
c000a49b:	74 1c                	je     c000a4b9 <sys_receive_msg+0x3d3>
c000a49d:	68 ee 06 00 00       	push   $0x6ee
c000a4a2:	68 2f c1 00 c0       	push   $0xc000c12f
c000a4a7:	68 2f c1 00 c0       	push   $0xc000c12f
c000a4ac:	68 ec c1 00 c0       	push   $0xc000c1ec
c000a4b1:	e8 08 f8 ff ff       	call   c0009cbe <assertion_failure>
c000a4b6:	83 c4 10             	add    $0x10,%esp
c000a4b9:	8b 45 10             	mov    0x10(%ebp),%eax
c000a4bc:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a4c2:	83 f8 21             	cmp    $0x21,%eax
c000a4c5:	74 1c                	je     c000a4e3 <sys_receive_msg+0x3fd>
c000a4c7:	68 ef 06 00 00       	push   $0x6ef
c000a4cc:	68 2f c1 00 c0       	push   $0xc000c12f
c000a4d1:	68 2f c1 00 c0       	push   $0xc000c12f
c000a4d6:	68 04 c2 00 c0       	push   $0xc000c204
c000a4db:	e8 de f7 ff ff       	call   c0009cbe <assertion_failure>
c000a4e0:	83 c4 10             	add    $0x10,%esp
c000a4e3:	8b 45 10             	mov    0x10(%ebp),%eax
c000a4e6:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a4ec:	83 f8 21             	cmp    $0x21,%eax
c000a4ef:	0f 84 e4 00 00 00    	je     c000a5d9 <sys_receive_msg+0x4f3>
c000a4f5:	68 f0 06 00 00       	push   $0x6f0
c000a4fa:	68 2f c1 00 c0       	push   $0xc000c12f
c000a4ff:	68 2f c1 00 c0       	push   $0xc000c12f
c000a504:	68 d0 c2 00 c0       	push   $0xc000c2d0
c000a509:	e8 b0 f7 ff ff       	call   c0009cbe <assertion_failure>
c000a50e:	83 c4 10             	add    $0x10,%esp
c000a511:	e9 c3 00 00 00       	jmp    c000a5d9 <sys_receive_msg+0x4f3>
c000a516:	8b 45 10             	mov    0x10(%ebp),%eax
c000a519:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c000a520:	8b 45 10             	mov    0x10(%ebp),%eax
c000a523:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a52a:	3c 02                	cmp    $0x2,%al
c000a52c:	74 1c                	je     c000a54a <sys_receive_msg+0x464>
c000a52e:	68 f5 06 00 00       	push   $0x6f5
c000a533:	68 2f c1 00 c0       	push   $0xc000c12f
c000a538:	68 2f c1 00 c0       	push   $0xc000c12f
c000a53d:	68 ef c2 00 c0       	push   $0xc000c2ef
c000a542:	e8 77 f7 ff ff       	call   c0009cbe <assertion_failure>
c000a547:	83 c4 10             	add    $0x10,%esp
c000a54a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a54d:	8b 55 08             	mov    0x8(%ebp),%edx
c000a550:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c000a556:	8b 45 10             	mov    0x10(%ebp),%eax
c000a559:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a560:	3c 02                	cmp    $0x2,%al
c000a562:	74 1c                	je     c000a580 <sys_receive_msg+0x49a>
c000a564:	68 f7 06 00 00       	push   $0x6f7
c000a569:	68 2f c1 00 c0       	push   $0xc000c12f
c000a56e:	68 2f c1 00 c0       	push   $0xc000c12f
c000a573:	68 ef c2 00 c0       	push   $0xc000c2ef
c000a578:	e8 41 f7 ff ff       	call   c0009cbe <assertion_failure>
c000a57d:	83 c4 10             	add    $0x10,%esp
c000a580:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a584:	75 0f                	jne    c000a595 <sys_receive_msg+0x4af>
c000a586:	8b 45 10             	mov    0x10(%ebp),%eax
c000a589:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c000a590:	00 00 00 
c000a593:	eb 0c                	jmp    c000a5a1 <sys_receive_msg+0x4bb>
c000a595:	8b 45 10             	mov    0x10(%ebp),%eax
c000a598:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a59b:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c000a5a1:	8b 45 10             	mov    0x10(%ebp),%eax
c000a5a4:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a5ab:	3c 02                	cmp    $0x2,%al
c000a5ad:	74 1c                	je     c000a5cb <sys_receive_msg+0x4e5>
c000a5af:	68 02 07 00 00       	push   $0x702
c000a5b4:	68 2f c1 00 c0       	push   $0xc000c12f
c000a5b9:	68 2f c1 00 c0       	push   $0xc000c12f
c000a5be:	68 ef c2 00 c0       	push   $0xc000c2ef
c000a5c3:	e8 f6 f6 ff ff       	call   c0009cbe <assertion_failure>
c000a5c8:	83 c4 10             	add    $0x10,%esp
c000a5cb:	83 ec 0c             	sub    $0xc,%esp
c000a5ce:	ff 75 10             	pushl  0x10(%ebp)
c000a5d1:	e8 10 01 00 00       	call   c000a6e6 <block>
c000a5d6:	83 c4 10             	add    $0x10,%esp
c000a5d9:	b8 00 00 00 00       	mov    $0x0,%eax
c000a5de:	eb 02                	jmp    c000a5e2 <sys_receive_msg+0x4fc>
c000a5e0:	90                   	nop
c000a5e1:	90                   	nop
c000a5e2:	c9                   	leave  
c000a5e3:	c3                   	ret    

c000a5e4 <disp_str_colour_debug>:
c000a5e4:	55                   	push   %ebp
c000a5e5:	89 e5                	mov    %esp,%ebp
c000a5e7:	90                   	nop
c000a5e8:	5d                   	pop    %ebp
c000a5e9:	c3                   	ret    

c000a5ea <send_rec>:
c000a5ea:	55                   	push   %ebp
c000a5eb:	89 e5                	mov    %esp,%ebp
c000a5ed:	83 ec 18             	sub    $0x18,%esp
c000a5f0:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a5f3:	83 ec 0c             	sub    $0xc,%esp
c000a5f6:	50                   	push   %eax
c000a5f7:	e8 94 ca ff ff       	call   c0007090 <get_physical_address>
c000a5fc:	83 c4 10             	add    $0x10,%esp
c000a5ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a602:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a606:	74 28                	je     c000a630 <send_rec+0x46>
c000a608:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a60c:	74 22                	je     c000a630 <send_rec+0x46>
c000a60e:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a612:	74 1c                	je     c000a630 <send_rec+0x46>
c000a614:	68 22 07 00 00       	push   $0x722
c000a619:	68 2f c1 00 c0       	push   $0xc000c12f
c000a61e:	68 2f c1 00 c0       	push   $0xc000c12f
c000a623:	68 10 c3 00 c0       	push   $0xc000c310
c000a628:	e8 91 f6 ff ff       	call   c0009cbe <assertion_failure>
c000a62d:	83 c4 10             	add    $0x10,%esp
c000a630:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a634:	75 12                	jne    c000a648 <send_rec+0x5e>
c000a636:	83 ec 04             	sub    $0x4,%esp
c000a639:	6a 6c                	push   $0x6c
c000a63b:	6a 00                	push   $0x0
c000a63d:	ff 75 0c             	pushl  0xc(%ebp)
c000a640:	e8 a6 1d 00 00       	call   c000c3eb <Memset>
c000a645:	83 c4 10             	add    $0x10,%esp
c000a648:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a64c:	74 23                	je     c000a671 <send_rec+0x87>
c000a64e:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a652:	74 34                	je     c000a688 <send_rec+0x9e>
c000a654:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a658:	75 72                	jne    c000a6cc <send_rec+0xe2>
c000a65a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a65d:	83 ec 08             	sub    $0x8,%esp
c000a660:	ff 75 10             	pushl  0x10(%ebp)
c000a663:	50                   	push   %eax
c000a664:	e8 ff 82 ff ff       	call   c0002968 <send_msg>
c000a669:	83 c4 10             	add    $0x10,%esp
c000a66c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a66f:	eb 6e                	jmp    c000a6df <send_rec+0xf5>
c000a671:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a674:	83 ec 08             	sub    $0x8,%esp
c000a677:	ff 75 10             	pushl  0x10(%ebp)
c000a67a:	50                   	push   %eax
c000a67b:	e8 0e 83 ff ff       	call   c000298e <receive_msg>
c000a680:	83 c4 10             	add    $0x10,%esp
c000a683:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a686:	eb 57                	jmp    c000a6df <send_rec+0xf5>
c000a688:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a68b:	83 ec 08             	sub    $0x8,%esp
c000a68e:	ff 75 10             	pushl  0x10(%ebp)
c000a691:	50                   	push   %eax
c000a692:	e8 d1 82 ff ff       	call   c0002968 <send_msg>
c000a697:	83 c4 10             	add    $0x10,%esp
c000a69a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a69d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a6a1:	75 3b                	jne    c000a6de <send_rec+0xf4>
c000a6a3:	83 ec 04             	sub    $0x4,%esp
c000a6a6:	6a 6c                	push   $0x6c
c000a6a8:	6a 00                	push   $0x0
c000a6aa:	ff 75 0c             	pushl  0xc(%ebp)
c000a6ad:	e8 39 1d 00 00       	call   c000c3eb <Memset>
c000a6b2:	83 c4 10             	add    $0x10,%esp
c000a6b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6b8:	83 ec 08             	sub    $0x8,%esp
c000a6bb:	ff 75 10             	pushl  0x10(%ebp)
c000a6be:	50                   	push   %eax
c000a6bf:	e8 ca 82 ff ff       	call   c000298e <receive_msg>
c000a6c4:	83 c4 10             	add    $0x10,%esp
c000a6c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a6ca:	eb 12                	jmp    c000a6de <send_rec+0xf4>
c000a6cc:	83 ec 0c             	sub    $0xc,%esp
c000a6cf:	68 4c c3 00 c0       	push   $0xc000c34c
c000a6d4:	e8 c7 f5 ff ff       	call   c0009ca0 <panic>
c000a6d9:	83 c4 10             	add    $0x10,%esp
c000a6dc:	eb 01                	jmp    c000a6df <send_rec+0xf5>
c000a6de:	90                   	nop
c000a6df:	b8 00 00 00 00       	mov    $0x0,%eax
c000a6e4:	c9                   	leave  
c000a6e5:	c3                   	ret    

c000a6e6 <block>:
c000a6e6:	55                   	push   %ebp
c000a6e7:	89 e5                	mov    %esp,%ebp
c000a6e9:	83 ec 08             	sub    $0x8,%esp
c000a6ec:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6ef:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a6f6:	84 c0                	test   %al,%al
c000a6f8:	75 1c                	jne    c000a716 <block+0x30>
c000a6fa:	68 51 07 00 00       	push   $0x751
c000a6ff:	68 2f c1 00 c0       	push   $0xc000c12f
c000a704:	68 2f c1 00 c0       	push   $0xc000c12f
c000a709:	68 61 c3 00 c0       	push   $0xc000c361
c000a70e:	e8 ab f5 ff ff       	call   c0009cbe <assertion_failure>
c000a713:	83 c4 10             	add    $0x10,%esp
c000a716:	e8 f6 a2 ff ff       	call   c0004a11 <schedule_process>
c000a71b:	b8 00 00 00 00       	mov    $0x0,%eax
c000a720:	c9                   	leave  
c000a721:	c3                   	ret    

c000a722 <unblock>:
c000a722:	55                   	push   %ebp
c000a723:	89 e5                	mov    %esp,%ebp
c000a725:	83 ec 08             	sub    $0x8,%esp
c000a728:	8b 45 08             	mov    0x8(%ebp),%eax
c000a72b:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a732:	84 c0                	test   %al,%al
c000a734:	74 1c                	je     c000a752 <unblock+0x30>
c000a736:	68 5a 07 00 00       	push   $0x75a
c000a73b:	68 2f c1 00 c0       	push   $0xc000c12f
c000a740:	68 2f c1 00 c0       	push   $0xc000c12f
c000a745:	68 79 c3 00 c0       	push   $0xc000c379
c000a74a:	e8 6f f5 ff ff       	call   c0009cbe <assertion_failure>
c000a74f:	83 c4 10             	add    $0x10,%esp
c000a752:	8b 45 08             	mov    0x8(%ebp),%eax
c000a755:	05 00 01 00 00       	add    $0x100,%eax
c000a75a:	83 ec 08             	sub    $0x8,%esp
c000a75d:	50                   	push   %eax
c000a75e:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a763:	e8 48 0a 00 00       	call   c000b1b0 <appendToDoubleLinkList>
c000a768:	83 c4 10             	add    $0x10,%esp
c000a76b:	b8 00 00 00 00       	mov    $0x0,%eax
c000a770:	c9                   	leave  
c000a771:	c3                   	ret    

c000a772 <get_ticks_ipc>:
c000a772:	55                   	push   %ebp
c000a773:	89 e5                	mov    %esp,%ebp
c000a775:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000a77b:	83 ec 04             	sub    $0x4,%esp
c000a77e:	6a 6c                	push   $0x6c
c000a780:	6a 00                	push   $0x0
c000a782:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a785:	50                   	push   %eax
c000a786:	e8 60 1c 00 00       	call   c000c3eb <Memset>
c000a78b:	83 c4 10             	add    $0x10,%esp
c000a78e:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c000a795:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a79c:	83 ec 04             	sub    $0x4,%esp
c000a79f:	6a 01                	push   $0x1
c000a7a1:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000a7a4:	50                   	push   %eax
c000a7a5:	6a 03                	push   $0x3
c000a7a7:	e8 3e fe ff ff       	call   c000a5ea <send_rec>
c000a7ac:	83 c4 10             	add    $0x10,%esp
c000a7af:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a7b2:	8b 45 8c             	mov    -0x74(%ebp),%eax
c000a7b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a7b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a7bb:	c9                   	leave  
c000a7bc:	c3                   	ret    

c000a7bd <itoa>:
c000a7bd:	55                   	push   %ebp
c000a7be:	89 e5                	mov    %esp,%ebp
c000a7c0:	53                   	push   %ebx
c000a7c1:	83 ec 14             	sub    $0x14,%esp
c000a7c4:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7c7:	99                   	cltd   
c000a7c8:	f7 7d 10             	idivl  0x10(%ebp)
c000a7cb:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a7ce:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7d1:	99                   	cltd   
c000a7d2:	f7 7d 10             	idivl  0x10(%ebp)
c000a7d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a7d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a7dc:	74 14                	je     c000a7f2 <itoa+0x35>
c000a7de:	83 ec 04             	sub    $0x4,%esp
c000a7e1:	ff 75 10             	pushl  0x10(%ebp)
c000a7e4:	ff 75 0c             	pushl  0xc(%ebp)
c000a7e7:	ff 75 f0             	pushl  -0x10(%ebp)
c000a7ea:	e8 ce ff ff ff       	call   c000a7bd <itoa>
c000a7ef:	83 c4 10             	add    $0x10,%esp
c000a7f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a7f5:	8d 58 30             	lea    0x30(%eax),%ebx
c000a7f8:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a7fb:	8b 00                	mov    (%eax),%eax
c000a7fd:	8d 48 01             	lea    0x1(%eax),%ecx
c000a800:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a803:	89 0a                	mov    %ecx,(%edx)
c000a805:	89 da                	mov    %ebx,%edx
c000a807:	88 10                	mov    %dl,(%eax)
c000a809:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a80c:	8b 00                	mov    (%eax),%eax
c000a80e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a811:	c9                   	leave  
c000a812:	c3                   	ret    

c000a813 <i2a>:
c000a813:	55                   	push   %ebp
c000a814:	89 e5                	mov    %esp,%ebp
c000a816:	53                   	push   %ebx
c000a817:	83 ec 14             	sub    $0x14,%esp
c000a81a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a81d:	99                   	cltd   
c000a81e:	f7 7d 0c             	idivl  0xc(%ebp)
c000a821:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a824:	8b 45 08             	mov    0x8(%ebp),%eax
c000a827:	99                   	cltd   
c000a828:	f7 7d 0c             	idivl  0xc(%ebp)
c000a82b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a82e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a832:	74 14                	je     c000a848 <i2a+0x35>
c000a834:	83 ec 04             	sub    $0x4,%esp
c000a837:	ff 75 10             	pushl  0x10(%ebp)
c000a83a:	ff 75 0c             	pushl  0xc(%ebp)
c000a83d:	ff 75 f0             	pushl  -0x10(%ebp)
c000a840:	e8 ce ff ff ff       	call   c000a813 <i2a>
c000a845:	83 c4 10             	add    $0x10,%esp
c000a848:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a84c:	7f 0a                	jg     c000a858 <i2a+0x45>
c000a84e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a851:	83 c0 30             	add    $0x30,%eax
c000a854:	89 c3                	mov    %eax,%ebx
c000a856:	eb 08                	jmp    c000a860 <i2a+0x4d>
c000a858:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a85b:	83 c0 37             	add    $0x37,%eax
c000a85e:	89 c3                	mov    %eax,%ebx
c000a860:	8b 45 10             	mov    0x10(%ebp),%eax
c000a863:	8b 00                	mov    (%eax),%eax
c000a865:	8d 48 01             	lea    0x1(%eax),%ecx
c000a868:	8b 55 10             	mov    0x10(%ebp),%edx
c000a86b:	89 0a                	mov    %ecx,(%edx)
c000a86d:	88 18                	mov    %bl,(%eax)
c000a86f:	8b 45 10             	mov    0x10(%ebp),%eax
c000a872:	8b 00                	mov    (%eax),%eax
c000a874:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a877:	c9                   	leave  
c000a878:	c3                   	ret    

c000a879 <inform_int>:
c000a879:	55                   	push   %ebp
c000a87a:	89 e5                	mov    %esp,%ebp
c000a87c:	83 ec 18             	sub    $0x18,%esp
c000a87f:	83 ec 0c             	sub    $0xc,%esp
c000a882:	ff 75 08             	pushl  0x8(%ebp)
c000a885:	e8 fc a2 ff ff       	call   c0004b86 <pid2proc>
c000a88a:	83 c4 10             	add    $0x10,%esp
c000a88d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a890:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a893:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a89a:	0f be c0             	movsbl %al,%eax
c000a89d:	83 e0 02             	and    $0x2,%eax
c000a8a0:	85 c0                	test   %eax,%eax
c000a8a2:	0f 84 8e 00 00 00    	je     c000a936 <inform_int+0xbd>
c000a8a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8ab:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a8b1:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a8b6:	74 0e                	je     c000a8c6 <inform_int+0x4d>
c000a8b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8bb:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a8c1:	83 f8 12             	cmp    $0x12,%eax
c000a8c4:	75 7d                	jne    c000a943 <inform_int+0xca>
c000a8c6:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c000a8cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8d0:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a8d6:	83 ec 08             	sub    $0x8,%esp
c000a8d9:	ff 75 f0             	pushl  -0x10(%ebp)
c000a8dc:	50                   	push   %eax
c000a8dd:	e8 e7 c6 ff ff       	call   c0006fc9 <alloc_virtual_memory>
c000a8e2:	83 c4 10             	add    $0x10,%esp
c000a8e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a8e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a8eb:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a8f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a8f4:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000a8fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8fe:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a905:	00 00 00 
c000a908:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a90b:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a912:	00 00 00 
c000a915:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a91c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a91f:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a926:	83 ec 0c             	sub    $0xc,%esp
c000a929:	ff 75 f4             	pushl  -0xc(%ebp)
c000a92c:	e8 f1 fd ff ff       	call   c000a722 <unblock>
c000a931:	83 c4 10             	add    $0x10,%esp
c000a934:	eb 0d                	jmp    c000a943 <inform_int+0xca>
c000a936:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a939:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a940:	00 00 00 
c000a943:	90                   	nop
c000a944:	c9                   	leave  
c000a945:	c3                   	ret    

c000a946 <strcmp>:
c000a946:	55                   	push   %ebp
c000a947:	89 e5                	mov    %esp,%ebp
c000a949:	83 ec 10             	sub    $0x10,%esp
c000a94c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a950:	74 06                	je     c000a958 <strcmp+0x12>
c000a952:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a956:	75 08                	jne    c000a960 <strcmp+0x1a>
c000a958:	8b 45 08             	mov    0x8(%ebp),%eax
c000a95b:	2b 45 0c             	sub    0xc(%ebp),%eax
c000a95e:	eb 53                	jmp    c000a9b3 <strcmp+0x6d>
c000a960:	8b 45 08             	mov    0x8(%ebp),%eax
c000a963:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a966:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a969:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a96c:	eb 18                	jmp    c000a986 <strcmp+0x40>
c000a96e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a971:	0f b6 10             	movzbl (%eax),%edx
c000a974:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a977:	0f b6 00             	movzbl (%eax),%eax
c000a97a:	38 c2                	cmp    %al,%dl
c000a97c:	75 1e                	jne    c000a99c <strcmp+0x56>
c000a97e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000a982:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000a986:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a989:	0f b6 00             	movzbl (%eax),%eax
c000a98c:	84 c0                	test   %al,%al
c000a98e:	74 0d                	je     c000a99d <strcmp+0x57>
c000a990:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a993:	0f b6 00             	movzbl (%eax),%eax
c000a996:	84 c0                	test   %al,%al
c000a998:	75 d4                	jne    c000a96e <strcmp+0x28>
c000a99a:	eb 01                	jmp    c000a99d <strcmp+0x57>
c000a99c:	90                   	nop
c000a99d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a9a0:	0f b6 00             	movzbl (%eax),%eax
c000a9a3:	0f be d0             	movsbl %al,%edx
c000a9a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a9a9:	0f b6 00             	movzbl (%eax),%eax
c000a9ac:	0f be c0             	movsbl %al,%eax
c000a9af:	29 c2                	sub    %eax,%edx
c000a9b1:	89 d0                	mov    %edx,%eax
c000a9b3:	c9                   	leave  
c000a9b4:	c3                   	ret    

c000a9b5 <create_user_process_address_space>:
c000a9b5:	55                   	push   %ebp
c000a9b6:	89 e5                	mov    %esp,%ebp
c000a9b8:	83 ec 18             	sub    $0x18,%esp
c000a9bb:	83 ec 08             	sub    $0x8,%esp
c000a9be:	6a 00                	push   $0x0
c000a9c0:	6a 01                	push   $0x1
c000a9c2:	e8 58 c8 ff ff       	call   c000721f <alloc_memory>
c000a9c7:	83 c4 10             	add    $0x10,%esp
c000a9ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a9cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a9d0:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000a9d7:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000a9de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a9e1:	05 ff 0f 00 00       	add    $0xfff,%eax
c000a9e6:	c1 e8 0c             	shr    $0xc,%eax
c000a9e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a9ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a9ef:	83 c0 07             	add    $0x7,%eax
c000a9f2:	c1 e8 03             	shr    $0x3,%eax
c000a9f5:	89 c2                	mov    %eax,%edx
c000a9f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a9fa:	89 50 04             	mov    %edx,0x4(%eax)
c000a9fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa00:	8b 40 04             	mov    0x4(%eax),%eax
c000aa03:	05 ff 0f 00 00       	add    $0xfff,%eax
c000aa08:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000aa0e:	85 c0                	test   %eax,%eax
c000aa10:	0f 48 c2             	cmovs  %edx,%eax
c000aa13:	c1 f8 0c             	sar    $0xc,%eax
c000aa16:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aa19:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aa1c:	83 ec 08             	sub    $0x8,%esp
c000aa1f:	6a 00                	push   $0x0
c000aa21:	50                   	push   %eax
c000aa22:	e8 f8 c7 ff ff       	call   c000721f <alloc_memory>
c000aa27:	83 c4 10             	add    $0x10,%esp
c000aa2a:	89 c2                	mov    %eax,%edx
c000aa2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa2f:	89 10                	mov    %edx,(%eax)
c000aa31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa34:	83 ec 0c             	sub    $0xc,%esp
c000aa37:	50                   	push   %eax
c000aa38:	e8 29 c1 ff ff       	call   c0006b66 <init_bitmap>
c000aa3d:	83 c4 10             	add    $0x10,%esp
c000aa40:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa43:	c9                   	leave  
c000aa44:	c3                   	ret    

c000aa45 <user_process>:
c000aa45:	55                   	push   %ebp
c000aa46:	89 e5                	mov    %esp,%ebp
c000aa48:	83 ec 38             	sub    $0x38,%esp
c000aa4b:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000aa52:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000aa59:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000aa60:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000aa64:	75 0e                	jne    c000aa74 <user_process+0x2f>
c000aa66:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000aa6c:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000aa72:	eb 0c                	jmp    c000aa80 <user_process+0x3b>
c000aa74:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000aa7a:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000aa80:	e8 12 6e ff ff       	call   c0001897 <get_running_thread_pcb>
c000aa85:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000aa88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa8b:	05 00 10 00 00       	add    $0x1000,%eax
c000aa90:	89 c2                	mov    %eax,%edx
c000aa92:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa95:	89 10                	mov    %edx,(%eax)
c000aa97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aa9a:	8b 00                	mov    (%eax),%eax
c000aa9c:	83 e8 44             	sub    $0x44,%eax
c000aa9f:	89 c2                	mov    %eax,%edx
c000aaa1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aaa4:	89 10                	mov    %edx,(%eax)
c000aaa6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aaa9:	8b 00                	mov    (%eax),%eax
c000aaab:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000aaae:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000aab2:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000aab8:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000aabc:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000aac0:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000aac4:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000aac8:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000aacc:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000aad0:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000aad6:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000aada:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000aadd:	89 50 34             	mov    %edx,0x34(%eax)
c000aae0:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000aae4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000aae7:	89 50 0c             	mov    %edx,0xc(%eax)
c000aaea:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000aaee:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000aaf1:	89 50 04             	mov    %edx,0x4(%eax)
c000aaf4:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000aaf8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000aafb:	89 50 08             	mov    %edx,0x8(%eax)
c000aafe:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000ab02:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab05:	89 50 40             	mov    %edx,0x40(%eax)
c000ab08:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000ab0c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab0f:	89 10                	mov    %edx,(%eax)
c000ab11:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab14:	8b 55 08             	mov    0x8(%ebp),%edx
c000ab17:	89 50 30             	mov    %edx,0x30(%eax)
c000ab1a:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000ab1e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab21:	89 50 38             	mov    %edx,0x38(%eax)
c000ab24:	83 ec 08             	sub    $0x8,%esp
c000ab27:	6a 01                	push   $0x1
c000ab29:	68 00 f0 ff bf       	push   $0xbffff000
c000ab2e:	e8 36 c6 ff ff       	call   c0007169 <alloc_physical_memory>
c000ab33:	83 c4 10             	add    $0x10,%esp
c000ab36:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000ab3c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab3f:	89 50 3c             	mov    %edx,0x3c(%eax)
c000ab42:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab45:	83 ec 0c             	sub    $0xc,%esp
c000ab48:	50                   	push   %eax
c000ab49:	e8 1e 6c ff ff       	call   c000176c <restart>
c000ab4e:	83 c4 10             	add    $0x10,%esp
c000ab51:	90                   	nop
c000ab52:	c9                   	leave  
c000ab53:	c3                   	ret    

c000ab54 <clone_pcb>:
c000ab54:	55                   	push   %ebp
c000ab55:	89 e5                	mov    %esp,%ebp
c000ab57:	83 ec 18             	sub    $0x18,%esp
c000ab5a:	83 ec 08             	sub    $0x8,%esp
c000ab5d:	6a 00                	push   $0x0
c000ab5f:	6a 01                	push   $0x1
c000ab61:	e8 b9 c6 ff ff       	call   c000721f <alloc_memory>
c000ab66:	83 c4 10             	add    $0x10,%esp
c000ab69:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ab6c:	83 ec 04             	sub    $0x4,%esp
c000ab6f:	68 00 10 00 00       	push   $0x1000
c000ab74:	6a 00                	push   $0x0
c000ab76:	ff 75 f4             	pushl  -0xc(%ebp)
c000ab79:	e8 6d 18 00 00       	call   c000c3eb <Memset>
c000ab7e:	83 c4 10             	add    $0x10,%esp
c000ab81:	83 ec 04             	sub    $0x4,%esp
c000ab84:	68 00 10 00 00       	push   $0x1000
c000ab89:	ff 75 08             	pushl  0x8(%ebp)
c000ab8c:	ff 75 f4             	pushl  -0xc(%ebp)
c000ab8f:	e8 45 d1 ff ff       	call   c0007cd9 <Memcpy>
c000ab94:	83 c4 10             	add    $0x10,%esp
c000ab97:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000ab9c:	83 c0 01             	add    $0x1,%eax
c000ab9f:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000aba4:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000abaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000abad:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000abb3:	8b 45 08             	mov    0x8(%ebp),%eax
c000abb6:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000abbc:	89 c2                	mov    %eax,%edx
c000abbe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000abc1:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000abc7:	83 ec 08             	sub    $0x8,%esp
c000abca:	6a 00                	push   $0x0
c000abcc:	6a 01                	push   $0x1
c000abce:	e8 4c c6 ff ff       	call   c000721f <alloc_memory>
c000abd3:	83 c4 10             	add    $0x10,%esp
c000abd6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000abd9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000abdc:	05 00 0c 00 00       	add    $0xc00,%eax
c000abe1:	83 ec 04             	sub    $0x4,%esp
c000abe4:	68 00 04 00 00       	push   $0x400
c000abe9:	68 00 fc ff ff       	push   $0xfffffc00
c000abee:	50                   	push   %eax
c000abef:	e8 e5 d0 ff ff       	call   c0007cd9 <Memcpy>
c000abf4:	83 c4 10             	add    $0x10,%esp
c000abf7:	83 ec 0c             	sub    $0xc,%esp
c000abfa:	ff 75 f0             	pushl  -0x10(%ebp)
c000abfd:	e8 8e c4 ff ff       	call   c0007090 <get_physical_address>
c000ac02:	83 c4 10             	add    $0x10,%esp
c000ac05:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ac08:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac0b:	05 fc 0f 00 00       	add    $0xffc,%eax
c000ac10:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000ac13:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000ac16:	83 c8 07             	or     $0x7,%eax
c000ac19:	89 c2                	mov    %eax,%edx
c000ac1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ac1e:	89 10                	mov    %edx,(%eax)
c000ac20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac23:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000ac26:	89 50 08             	mov    %edx,0x8(%eax)
c000ac29:	e8 87 fd ff ff       	call   c000a9b5 <create_user_process_address_space>
c000ac2e:	89 c2                	mov    %eax,%edx
c000ac30:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac33:	89 50 0c             	mov    %edx,0xc(%eax)
c000ac36:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac39:	8b 40 0c             	mov    0xc(%eax),%eax
c000ac3c:	89 c2                	mov    %eax,%edx
c000ac3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac41:	8b 40 0c             	mov    0xc(%eax),%eax
c000ac44:	83 ec 04             	sub    $0x4,%esp
c000ac47:	6a 0c                	push   $0xc
c000ac49:	52                   	push   %edx
c000ac4a:	50                   	push   %eax
c000ac4b:	e8 89 d0 ff ff       	call   c0007cd9 <Memcpy>
c000ac50:	83 c4 10             	add    $0x10,%esp
c000ac53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac56:	c9                   	leave  
c000ac57:	c3                   	ret    

c000ac58 <build_body_stack>:
c000ac58:	55                   	push   %ebp
c000ac59:	89 e5                	mov    %esp,%ebp
c000ac5b:	83 ec 48             	sub    $0x48,%esp
c000ac5e:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac61:	8b 40 0c             	mov    0xc(%eax),%eax
c000ac64:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ac67:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ac6a:	8b 50 04             	mov    0x4(%eax),%edx
c000ac6d:	8b 00                	mov    (%eax),%eax
c000ac6f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000ac72:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000ac75:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000ac78:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ac7b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000ac7e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000ac81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ac84:	8b 40 08             	mov    0x8(%eax),%eax
c000ac87:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000ac8a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000ac91:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000ac98:	e8 d8 cf ff ff       	call   c0007c75 <intr_disable>
c000ac9d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000aca0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000aca7:	e9 c2 00 00 00       	jmp    c000ad6e <build_body_stack+0x116>
c000acac:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000acaf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000acb2:	01 d0                	add    %edx,%eax
c000acb4:	0f b6 00             	movzbl (%eax),%eax
c000acb7:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000acba:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000acc1:	e9 9a 00 00 00       	jmp    c000ad60 <build_body_stack+0x108>
c000acc6:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000acca:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000accd:	89 c1                	mov    %eax,%ecx
c000accf:	d3 fa                	sar    %cl,%edx
c000acd1:	89 d0                	mov    %edx,%eax
c000acd3:	83 e0 01             	and    $0x1,%eax
c000acd6:	85 c0                	test   %eax,%eax
c000acd8:	75 06                	jne    c000ace0 <build_body_stack+0x88>
c000acda:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000acde:	eb 7c                	jmp    c000ad5c <build_body_stack+0x104>
c000ace0:	8b 45 08             	mov    0x8(%ebp),%eax
c000ace3:	8b 40 08             	mov    0x8(%eax),%eax
c000ace6:	83 ec 0c             	sub    $0xc,%esp
c000ace9:	50                   	push   %eax
c000acea:	e8 8c 6b ff ff       	call   c000187b <update_cr3>
c000acef:	83 c4 10             	add    $0x10,%esp
c000acf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acf5:	c1 e0 0c             	shl    $0xc,%eax
c000acf8:	89 c2                	mov    %eax,%edx
c000acfa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000acfd:	01 d0                	add    %edx,%eax
c000acff:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000ad02:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000ad05:	8b 45 10             	mov    0x10(%ebp),%eax
c000ad08:	83 ec 04             	sub    $0x4,%esp
c000ad0b:	68 00 10 00 00       	push   $0x1000
c000ad10:	52                   	push   %edx
c000ad11:	50                   	push   %eax
c000ad12:	e8 c2 cf ff ff       	call   c0007cd9 <Memcpy>
c000ad17:	83 c4 10             	add    $0x10,%esp
c000ad1a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000ad1d:	8b 40 08             	mov    0x8(%eax),%eax
c000ad20:	83 ec 0c             	sub    $0xc,%esp
c000ad23:	50                   	push   %eax
c000ad24:	e8 52 6b ff ff       	call   c000187b <update_cr3>
c000ad29:	83 c4 10             	add    $0x10,%esp
c000ad2c:	83 ec 08             	sub    $0x8,%esp
c000ad2f:	ff 75 cc             	pushl  -0x34(%ebp)
c000ad32:	6a 01                	push   $0x1
c000ad34:	e8 48 c5 ff ff       	call   c0007281 <get_a_virtual_page>
c000ad39:	83 c4 10             	add    $0x10,%esp
c000ad3c:	8b 55 10             	mov    0x10(%ebp),%edx
c000ad3f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000ad42:	83 ec 04             	sub    $0x4,%esp
c000ad45:	68 00 10 00 00       	push   $0x1000
c000ad4a:	52                   	push   %edx
c000ad4b:	50                   	push   %eax
c000ad4c:	e8 88 cf ff ff       	call   c0007cd9 <Memcpy>
c000ad51:	83 c4 10             	add    $0x10,%esp
c000ad54:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000ad58:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000ad5c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000ad60:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000ad64:	0f 8e 5c ff ff ff    	jle    c000acc6 <build_body_stack+0x6e>
c000ad6a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000ad6e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000ad71:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000ad74:	0f 87 32 ff ff ff    	ja     c000acac <build_body_stack+0x54>
c000ad7a:	83 ec 0c             	sub    $0xc,%esp
c000ad7d:	ff 75 d4             	pushl  -0x2c(%ebp)
c000ad80:	e8 19 cf ff ff       	call   c0007c9e <intr_set_status>
c000ad85:	83 c4 10             	add    $0x10,%esp
c000ad88:	90                   	nop
c000ad89:	c9                   	leave  
c000ad8a:	c3                   	ret    

c000ad8b <build_process_kernel_stack>:
c000ad8b:	55                   	push   %ebp
c000ad8c:	89 e5                	mov    %esp,%ebp
c000ad8e:	83 ec 28             	sub    $0x28,%esp
c000ad91:	e8 df ce ff ff       	call   c0007c75 <intr_disable>
c000ad96:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ad99:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad9c:	05 00 10 00 00       	add    $0x1000,%eax
c000ada1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ada4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ada7:	8b 00                	mov    (%eax),%eax
c000ada9:	83 f8 38             	cmp    $0x38,%eax
c000adac:	74 06                	je     c000adb4 <build_process_kernel_stack+0x29>
c000adae:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000adb2:	eb f0                	jmp    c000ada4 <build_process_kernel_stack+0x19>
c000adb4:	90                   	nop
c000adb5:	8b 45 08             	mov    0x8(%ebp),%eax
c000adb8:	05 00 10 00 00       	add    $0x1000,%eax
c000adbd:	89 c2                	mov    %eax,%edx
c000adbf:	8b 45 08             	mov    0x8(%ebp),%eax
c000adc2:	89 50 04             	mov    %edx,0x4(%eax)
c000adc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adc8:	83 c0 2c             	add    $0x2c,%eax
c000adcb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000adce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000add1:	83 e8 04             	sub    $0x4,%eax
c000add4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000add7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adda:	83 e8 08             	sub    $0x8,%eax
c000addd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ade0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ade3:	83 e8 0c             	sub    $0xc,%eax
c000ade6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ade9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adec:	83 e8 10             	sub    $0x10,%eax
c000adef:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000adf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000adf5:	83 e8 14             	sub    $0x14,%eax
c000adf8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000adfb:	ba 63 17 00 c0       	mov    $0xc0001763,%edx
c000ae00:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ae03:	89 10                	mov    %edx,(%eax)
c000ae05:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000ae08:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000ae0e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000ae11:	8b 10                	mov    (%eax),%edx
c000ae13:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000ae16:	89 10                	mov    %edx,(%eax)
c000ae18:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000ae1b:	8b 10                	mov    (%eax),%edx
c000ae1d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ae20:	89 10                	mov    %edx,(%eax)
c000ae22:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ae25:	8b 10                	mov    (%eax),%edx
c000ae27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ae2a:	89 10                	mov    %edx,(%eax)
c000ae2c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000ae2f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000ae35:	8b 45 08             	mov    0x8(%ebp),%eax
c000ae38:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000ae3b:	89 10                	mov    %edx,(%eax)
c000ae3d:	83 ec 0c             	sub    $0xc,%esp
c000ae40:	ff 75 f0             	pushl  -0x10(%ebp)
c000ae43:	e8 56 ce ff ff       	call   c0007c9e <intr_set_status>
c000ae48:	83 c4 10             	add    $0x10,%esp
c000ae4b:	90                   	nop
c000ae4c:	c9                   	leave  
c000ae4d:	c3                   	ret    

c000ae4e <fork_process>:
c000ae4e:	55                   	push   %ebp
c000ae4f:	89 e5                	mov    %esp,%ebp
c000ae51:	83 ec 18             	sub    $0x18,%esp
c000ae54:	8b 45 08             	mov    0x8(%ebp),%eax
c000ae57:	83 ec 0c             	sub    $0xc,%esp
c000ae5a:	50                   	push   %eax
c000ae5b:	e8 26 9d ff ff       	call   c0004b86 <pid2proc>
c000ae60:	83 c4 10             	add    $0x10,%esp
c000ae63:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ae66:	83 ec 0c             	sub    $0xc,%esp
c000ae69:	ff 75 f4             	pushl  -0xc(%ebp)
c000ae6c:	e8 e3 fc ff ff       	call   c000ab54 <clone_pcb>
c000ae71:	83 c4 10             	add    $0x10,%esp
c000ae74:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ae77:	83 ec 08             	sub    $0x8,%esp
c000ae7a:	6a 00                	push   $0x0
c000ae7c:	6a 01                	push   $0x1
c000ae7e:	e8 9c c3 ff ff       	call   c000721f <alloc_memory>
c000ae83:	83 c4 10             	add    $0x10,%esp
c000ae86:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ae89:	83 ec 04             	sub    $0x4,%esp
c000ae8c:	ff 75 ec             	pushl  -0x14(%ebp)
c000ae8f:	ff 75 f0             	pushl  -0x10(%ebp)
c000ae92:	ff 75 f4             	pushl  -0xc(%ebp)
c000ae95:	e8 be fd ff ff       	call   c000ac58 <build_body_stack>
c000ae9a:	83 c4 10             	add    $0x10,%esp
c000ae9d:	83 ec 0c             	sub    $0xc,%esp
c000aea0:	ff 75 f0             	pushl  -0x10(%ebp)
c000aea3:	e8 e3 fe ff ff       	call   c000ad8b <build_process_kernel_stack>
c000aea8:	83 c4 10             	add    $0x10,%esp
c000aeab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aeae:	05 00 01 00 00       	add    $0x100,%eax
c000aeb3:	83 ec 04             	sub    $0x4,%esp
c000aeb6:	6a 08                	push   $0x8
c000aeb8:	6a 00                	push   $0x0
c000aeba:	50                   	push   %eax
c000aebb:	e8 2b 15 00 00       	call   c000c3eb <Memset>
c000aec0:	83 c4 10             	add    $0x10,%esp
c000aec3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aec6:	05 08 01 00 00       	add    $0x108,%eax
c000aecb:	83 ec 04             	sub    $0x4,%esp
c000aece:	6a 08                	push   $0x8
c000aed0:	6a 00                	push   $0x0
c000aed2:	50                   	push   %eax
c000aed3:	e8 13 15 00 00       	call   c000c3eb <Memset>
c000aed8:	83 c4 10             	add    $0x10,%esp
c000aedb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aede:	05 08 01 00 00       	add    $0x108,%eax
c000aee3:	83 ec 08             	sub    $0x8,%esp
c000aee6:	50                   	push   %eax
c000aee7:	68 04 1f 01 c0       	push   $0xc0011f04
c000aeec:	e8 bf 02 00 00       	call   c000b1b0 <appendToDoubleLinkList>
c000aef1:	83 c4 10             	add    $0x10,%esp
c000aef4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aef7:	c9                   	leave  
c000aef8:	c3                   	ret    

c000aef9 <process_execute>:
c000aef9:	55                   	push   %ebp
c000aefa:	89 e5                	mov    %esp,%ebp
c000aefc:	83 ec 28             	sub    $0x28,%esp
c000aeff:	e8 c2 04 00 00       	call   c000b3c6 <thread_init>
c000af04:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000af07:	83 ec 0c             	sub    $0xc,%esp
c000af0a:	ff 75 f4             	pushl  -0xc(%ebp)
c000af0d:	e8 61 05 00 00       	call   c000b473 <thread_create>
c000af12:	83 c4 10             	add    $0x10,%esp
c000af15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af18:	05 34 01 00 00       	add    $0x134,%eax
c000af1d:	83 ec 08             	sub    $0x8,%esp
c000af20:	ff 75 10             	pushl  0x10(%ebp)
c000af23:	50                   	push   %eax
c000af24:	e8 e1 14 00 00       	call   c000c40a <Strcpy>
c000af29:	83 c4 10             	add    $0x10,%esp
c000af2c:	83 ec 08             	sub    $0x8,%esp
c000af2f:	6a 00                	push   $0x0
c000af31:	6a 01                	push   $0x1
c000af33:	e8 e7 c2 ff ff       	call   c000721f <alloc_memory>
c000af38:	83 c4 10             	add    $0x10,%esp
c000af3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000af3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af41:	05 00 0c 00 00       	add    $0xc00,%eax
c000af46:	83 ec 04             	sub    $0x4,%esp
c000af49:	68 00 04 00 00       	push   $0x400
c000af4e:	68 00 fc ff ff       	push   $0xfffffc00
c000af53:	50                   	push   %eax
c000af54:	e8 80 cd ff ff       	call   c0007cd9 <Memcpy>
c000af59:	83 c4 10             	add    $0x10,%esp
c000af5c:	83 ec 0c             	sub    $0xc,%esp
c000af5f:	ff 75 f0             	pushl  -0x10(%ebp)
c000af62:	e8 29 c1 ff ff       	call   c0007090 <get_physical_address>
c000af67:	83 c4 10             	add    $0x10,%esp
c000af6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000af6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af70:	05 fc 0f 00 00       	add    $0xffc,%eax
c000af75:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000af78:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000af7b:	83 c8 07             	or     $0x7,%eax
c000af7e:	89 c2                	mov    %eax,%edx
c000af80:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000af83:	89 10                	mov    %edx,(%eax)
c000af85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af88:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000af8b:	89 50 08             	mov    %edx,0x8(%eax)
c000af8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000af91:	83 c0 10             	add    $0x10,%eax
c000af94:	83 ec 0c             	sub    $0xc,%esp
c000af97:	50                   	push   %eax
c000af98:	e8 1e c8 ff ff       	call   c00077bb <init_memory_block_desc>
c000af9d:	83 c4 10             	add    $0x10,%esp
c000afa0:	e8 10 fa ff ff       	call   c000a9b5 <create_user_process_address_space>
c000afa5:	89 c2                	mov    %eax,%edx
c000afa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000afaa:	89 50 0c             	mov    %edx,0xc(%eax)
c000afad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000afb0:	8b 00                	mov    (%eax),%eax
c000afb2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000afb5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000afb8:	c7 40 10 45 aa 00 c0 	movl   $0xc000aa45,0x10(%eax)
c000afbf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000afc2:	8b 55 08             	mov    0x8(%ebp),%edx
c000afc5:	89 50 18             	mov    %edx,0x18(%eax)
c000afc8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000afcb:	8b 55 0c             	mov    0xc(%ebp),%edx
c000afce:	89 50 1c             	mov    %edx,0x1c(%eax)
c000afd1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000afd4:	8b 55 14             	mov    0x14(%ebp),%edx
c000afd7:	89 50 20             	mov    %edx,0x20(%eax)
c000afda:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000afdd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000afe0:	89 50 24             	mov    %edx,0x24(%eax)
c000afe3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000afe6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000afec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000afef:	8b 10                	mov    (%eax),%edx
c000aff1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aff4:	89 50 04             	mov    %edx,0x4(%eax)
c000aff7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000affa:	8b 50 04             	mov    0x4(%eax),%edx
c000affd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b000:	89 50 08             	mov    %edx,0x8(%eax)
c000b003:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b006:	8b 50 08             	mov    0x8(%eax),%edx
c000b009:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b00c:	89 50 0c             	mov    %edx,0xc(%eax)
c000b00f:	83 ec 0c             	sub    $0xc,%esp
c000b012:	68 ec 0d 01 c0       	push   $0xc0010dec
c000b017:	e8 97 00 00 00       	call   c000b0b3 <isListEmpty>
c000b01c:	83 c4 10             	add    $0x10,%esp
c000b01f:	e8 51 cc ff ff       	call   c0007c75 <intr_disable>
c000b024:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000b027:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b02a:	05 00 01 00 00       	add    $0x100,%eax
c000b02f:	83 ec 08             	sub    $0x8,%esp
c000b032:	50                   	push   %eax
c000b033:	68 ec 0d 01 c0       	push   $0xc0010dec
c000b038:	e8 73 01 00 00       	call   c000b1b0 <appendToDoubleLinkList>
c000b03d:	83 c4 10             	add    $0x10,%esp
c000b040:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b043:	05 08 01 00 00       	add    $0x108,%eax
c000b048:	83 ec 08             	sub    $0x8,%esp
c000b04b:	50                   	push   %eax
c000b04c:	68 04 1f 01 c0       	push   $0xc0011f04
c000b051:	e8 5a 01 00 00       	call   c000b1b0 <appendToDoubleLinkList>
c000b056:	83 c4 10             	add    $0x10,%esp
c000b059:	83 ec 0c             	sub    $0xc,%esp
c000b05c:	ff 75 e0             	pushl  -0x20(%ebp)
c000b05f:	e8 3a cc ff ff       	call   c0007c9e <intr_set_status>
c000b064:	83 c4 10             	add    $0x10,%esp
c000b067:	90                   	nop
c000b068:	c9                   	leave  
c000b069:	c3                   	ret    
c000b06a:	66 90                	xchg   %ax,%ax
c000b06c:	66 90                	xchg   %ax,%ax
c000b06e:	66 90                	xchg   %ax,%ax

c000b070 <switch_to>:
c000b070:	56                   	push   %esi
c000b071:	57                   	push   %edi
c000b072:	53                   	push   %ebx
c000b073:	55                   	push   %ebp
c000b074:	89 e5                	mov    %esp,%ebp
c000b076:	8b 45 14             	mov    0x14(%ebp),%eax
c000b079:	89 20                	mov    %esp,(%eax)
c000b07b:	8b 45 18             	mov    0x18(%ebp),%eax
c000b07e:	8b 20                	mov    (%eax),%esp
c000b080:	5d                   	pop    %ebp
c000b081:	5b                   	pop    %ebx
c000b082:	5f                   	pop    %edi
c000b083:	5e                   	pop    %esi
c000b084:	c3                   	ret    

c000b085 <initDoubleLinkList>:
c000b085:	55                   	push   %ebp
c000b086:	89 e5                	mov    %esp,%ebp
c000b088:	8b 45 08             	mov    0x8(%ebp),%eax
c000b08b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000b091:	8b 45 08             	mov    0x8(%ebp),%eax
c000b094:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000b09b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b09e:	8d 50 08             	lea    0x8(%eax),%edx
c000b0a1:	8b 45 08             	mov    0x8(%ebp),%eax
c000b0a4:	89 50 04             	mov    %edx,0x4(%eax)
c000b0a7:	8b 55 08             	mov    0x8(%ebp),%edx
c000b0aa:	8b 45 08             	mov    0x8(%ebp),%eax
c000b0ad:	89 50 08             	mov    %edx,0x8(%eax)
c000b0b0:	90                   	nop
c000b0b1:	5d                   	pop    %ebp
c000b0b2:	c3                   	ret    

c000b0b3 <isListEmpty>:
c000b0b3:	55                   	push   %ebp
c000b0b4:	89 e5                	mov    %esp,%ebp
c000b0b6:	8b 45 08             	mov    0x8(%ebp),%eax
c000b0b9:	8b 40 04             	mov    0x4(%eax),%eax
c000b0bc:	8b 55 08             	mov    0x8(%ebp),%edx
c000b0bf:	83 c2 08             	add    $0x8,%edx
c000b0c2:	39 d0                	cmp    %edx,%eax
c000b0c4:	75 07                	jne    c000b0cd <isListEmpty+0x1a>
c000b0c6:	b8 01 00 00 00       	mov    $0x1,%eax
c000b0cb:	eb 05                	jmp    c000b0d2 <isListEmpty+0x1f>
c000b0cd:	b8 00 00 00 00       	mov    $0x0,%eax
c000b0d2:	5d                   	pop    %ebp
c000b0d3:	c3                   	ret    

c000b0d4 <findElementInList>:
c000b0d4:	55                   	push   %ebp
c000b0d5:	89 e5                	mov    %esp,%ebp
c000b0d7:	83 ec 28             	sub    $0x28,%esp
c000b0da:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000b0de:	75 19                	jne    c000b0f9 <findElementInList+0x25>
c000b0e0:	6a 60                	push   $0x60
c000b0e2:	68 91 c3 00 c0       	push   $0xc000c391
c000b0e7:	68 91 c3 00 c0       	push   $0xc000c391
c000b0ec:	68 a4 c3 00 c0       	push   $0xc000c3a4
c000b0f1:	e8 c8 eb ff ff       	call   c0009cbe <assertion_failure>
c000b0f6:	83 c4 10             	add    $0x10,%esp
c000b0f9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000b0fd:	75 19                	jne    c000b118 <findElementInList+0x44>
c000b0ff:	6a 61                	push   $0x61
c000b101:	68 91 c3 00 c0       	push   $0xc000c391
c000b106:	68 91 c3 00 c0       	push   $0xc000c391
c000b10b:	68 b0 c3 00 c0       	push   $0xc000c3b0
c000b110:	e8 a9 eb ff ff       	call   c0009cbe <assertion_failure>
c000b115:	83 c4 10             	add    $0x10,%esp
c000b118:	e8 58 cb ff ff       	call   c0007c75 <intr_disable>
c000b11d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000b120:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000b127:	8b 45 08             	mov    0x8(%ebp),%eax
c000b12a:	8b 40 08             	mov    0x8(%eax),%eax
c000b12d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000b130:	8b 45 08             	mov    0x8(%ebp),%eax
c000b133:	8b 40 04             	mov    0x4(%eax),%eax
c000b136:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b139:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b13d:	75 07                	jne    c000b146 <findElementInList+0x72>
c000b13f:	b8 00 00 00 00       	mov    $0x0,%eax
c000b144:	eb 68                	jmp    c000b1ae <findElementInList+0xda>
c000b146:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b149:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000b14c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000b14f:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000b152:	c1 f8 03             	sar    $0x3,%eax
c000b155:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000b158:	eb 36                	jmp    c000b190 <findElementInList+0xbc>
c000b15a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b15d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000b160:	75 07                	jne    c000b169 <findElementInList+0x95>
c000b162:	b8 01 00 00 00       	mov    $0x1,%eax
c000b167:	eb 45                	jmp    c000b1ae <findElementInList+0xda>
c000b169:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b16d:	75 07                	jne    c000b176 <findElementInList+0xa2>
c000b16f:	b8 00 00 00 00       	mov    $0x0,%eax
c000b174:	eb 38                	jmp    c000b1ae <findElementInList+0xda>
c000b176:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b179:	8b 40 04             	mov    0x4(%eax),%eax
c000b17c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b17f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b183:	75 07                	jne    c000b18c <findElementInList+0xb8>
c000b185:	b8 00 00 00 00       	mov    $0x0,%eax
c000b18a:	eb 22                	jmp    c000b1ae <findElementInList+0xda>
c000b18c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000b190:	8b 45 08             	mov    0x8(%ebp),%eax
c000b193:	83 c0 08             	add    $0x8,%eax
c000b196:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000b199:	75 bf                	jne    c000b15a <findElementInList+0x86>
c000b19b:	83 ec 0c             	sub    $0xc,%esp
c000b19e:	ff 75 ec             	pushl  -0x14(%ebp)
c000b1a1:	e8 f8 ca ff ff       	call   c0007c9e <intr_set_status>
c000b1a6:	83 c4 10             	add    $0x10,%esp
c000b1a9:	b8 00 00 00 00       	mov    $0x0,%eax
c000b1ae:	c9                   	leave  
c000b1af:	c3                   	ret    

c000b1b0 <appendToDoubleLinkList>:
c000b1b0:	55                   	push   %ebp
c000b1b1:	89 e5                	mov    %esp,%ebp
c000b1b3:	83 ec 18             	sub    $0x18,%esp
c000b1b6:	83 ec 08             	sub    $0x8,%esp
c000b1b9:	ff 75 0c             	pushl  0xc(%ebp)
c000b1bc:	ff 75 08             	pushl  0x8(%ebp)
c000b1bf:	e8 10 ff ff ff       	call   c000b0d4 <findElementInList>
c000b1c4:	83 c4 10             	add    $0x10,%esp
c000b1c7:	3c 01                	cmp    $0x1,%al
c000b1c9:	0f 84 c2 00 00 00    	je     c000b291 <appendToDoubleLinkList+0xe1>
c000b1cf:	e8 a1 ca ff ff       	call   c0007c75 <intr_disable>
c000b1d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b1d7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000b1db:	75 1c                	jne    c000b1f9 <appendToDoubleLinkList+0x49>
c000b1dd:	68 9e 00 00 00       	push   $0x9e
c000b1e2:	68 91 c3 00 c0       	push   $0xc000c391
c000b1e7:	68 91 c3 00 c0       	push   $0xc000c391
c000b1ec:	68 a4 c3 00 c0       	push   $0xc000c3a4
c000b1f1:	e8 c8 ea ff ff       	call   c0009cbe <assertion_failure>
c000b1f6:	83 c4 10             	add    $0x10,%esp
c000b1f9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000b1fd:	75 1c                	jne    c000b21b <appendToDoubleLinkList+0x6b>
c000b1ff:	68 9f 00 00 00       	push   $0x9f
c000b204:	68 91 c3 00 c0       	push   $0xc000c391
c000b209:	68 91 c3 00 c0       	push   $0xc000c391
c000b20e:	68 b0 c3 00 c0       	push   $0xc000c3b0
c000b213:	e8 a6 ea ff ff       	call   c0009cbe <assertion_failure>
c000b218:	83 c4 10             	add    $0x10,%esp
c000b21b:	83 ec 08             	sub    $0x8,%esp
c000b21e:	ff 75 0c             	pushl  0xc(%ebp)
c000b221:	ff 75 08             	pushl  0x8(%ebp)
c000b224:	e8 ab fe ff ff       	call   c000b0d4 <findElementInList>
c000b229:	83 c4 10             	add    $0x10,%esp
c000b22c:	3c 01                	cmp    $0x1,%al
c000b22e:	74 64                	je     c000b294 <appendToDoubleLinkList+0xe4>
c000b230:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b233:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b236:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b239:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b240:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b243:	8b 50 04             	mov    0x4(%eax),%edx
c000b246:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b249:	89 10                	mov    %edx,(%eax)
c000b24b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b24e:	8b 50 08             	mov    0x8(%eax),%edx
c000b251:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b254:	89 10                	mov    %edx,(%eax)
c000b256:	8b 45 08             	mov    0x8(%ebp),%eax
c000b259:	8b 40 08             	mov    0x8(%eax),%eax
c000b25c:	85 c0                	test   %eax,%eax
c000b25e:	74 0c                	je     c000b26c <appendToDoubleLinkList+0xbc>
c000b260:	8b 45 08             	mov    0x8(%ebp),%eax
c000b263:	8b 40 08             	mov    0x8(%eax),%eax
c000b266:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b269:	89 50 04             	mov    %edx,0x4(%eax)
c000b26c:	8b 45 08             	mov    0x8(%ebp),%eax
c000b26f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b272:	89 50 08             	mov    %edx,0x8(%eax)
c000b275:	8b 45 08             	mov    0x8(%ebp),%eax
c000b278:	8d 50 08             	lea    0x8(%eax),%edx
c000b27b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b27e:	89 50 04             	mov    %edx,0x4(%eax)
c000b281:	83 ec 0c             	sub    $0xc,%esp
c000b284:	ff 75 f4             	pushl  -0xc(%ebp)
c000b287:	e8 12 ca ff ff       	call   c0007c9e <intr_set_status>
c000b28c:	83 c4 10             	add    $0x10,%esp
c000b28f:	eb 04                	jmp    c000b295 <appendToDoubleLinkList+0xe5>
c000b291:	90                   	nop
c000b292:	eb 01                	jmp    c000b295 <appendToDoubleLinkList+0xe5>
c000b294:	90                   	nop
c000b295:	c9                   	leave  
c000b296:	c3                   	ret    

c000b297 <insertToDoubleLinkList>:
c000b297:	55                   	push   %ebp
c000b298:	89 e5                	mov    %esp,%ebp
c000b29a:	83 ec 18             	sub    $0x18,%esp
c000b29d:	83 ec 08             	sub    $0x8,%esp
c000b2a0:	ff 75 0c             	pushl  0xc(%ebp)
c000b2a3:	ff 75 08             	pushl  0x8(%ebp)
c000b2a6:	e8 29 fe ff ff       	call   c000b0d4 <findElementInList>
c000b2ab:	83 c4 10             	add    $0x10,%esp
c000b2ae:	3c 01                	cmp    $0x1,%al
c000b2b0:	74 65                	je     c000b317 <insertToDoubleLinkList+0x80>
c000b2b2:	e8 be c9 ff ff       	call   c0007c75 <intr_disable>
c000b2b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b2bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b2c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b2c3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b2ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b2cd:	8b 50 04             	mov    0x4(%eax),%edx
c000b2d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b2d3:	89 10                	mov    %edx,(%eax)
c000b2d5:	8b 45 08             	mov    0x8(%ebp),%eax
c000b2d8:	8b 50 04             	mov    0x4(%eax),%edx
c000b2db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b2de:	89 50 04             	mov    %edx,0x4(%eax)
c000b2e1:	8b 45 08             	mov    0x8(%ebp),%eax
c000b2e4:	8b 40 04             	mov    0x4(%eax),%eax
c000b2e7:	85 c0                	test   %eax,%eax
c000b2e9:	74 0b                	je     c000b2f6 <insertToDoubleLinkList+0x5f>
c000b2eb:	8b 45 08             	mov    0x8(%ebp),%eax
c000b2ee:	8b 40 04             	mov    0x4(%eax),%eax
c000b2f1:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b2f4:	89 10                	mov    %edx,(%eax)
c000b2f6:	8b 45 08             	mov    0x8(%ebp),%eax
c000b2f9:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b2fc:	89 50 04             	mov    %edx,0x4(%eax)
c000b2ff:	8b 55 08             	mov    0x8(%ebp),%edx
c000b302:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b305:	89 10                	mov    %edx,(%eax)
c000b307:	83 ec 0c             	sub    $0xc,%esp
c000b30a:	ff 75 f4             	pushl  -0xc(%ebp)
c000b30d:	e8 8c c9 ff ff       	call   c0007c9e <intr_set_status>
c000b312:	83 c4 10             	add    $0x10,%esp
c000b315:	eb 01                	jmp    c000b318 <insertToDoubleLinkList+0x81>
c000b317:	90                   	nop
c000b318:	c9                   	leave  
c000b319:	c3                   	ret    

c000b31a <popFromDoubleLinkList>:
c000b31a:	55                   	push   %ebp
c000b31b:	89 e5                	mov    %esp,%ebp
c000b31d:	83 ec 18             	sub    $0x18,%esp
c000b320:	e8 50 c9 ff ff       	call   c0007c75 <intr_disable>
c000b325:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b328:	83 ec 0c             	sub    $0xc,%esp
c000b32b:	ff 75 08             	pushl  0x8(%ebp)
c000b32e:	e8 80 fd ff ff       	call   c000b0b3 <isListEmpty>
c000b333:	83 c4 10             	add    $0x10,%esp
c000b336:	3c 01                	cmp    $0x1,%al
c000b338:	75 07                	jne    c000b341 <popFromDoubleLinkList+0x27>
c000b33a:	b8 00 00 00 00       	mov    $0x0,%eax
c000b33f:	eb 6b                	jmp    c000b3ac <popFromDoubleLinkList+0x92>
c000b341:	8b 45 08             	mov    0x8(%ebp),%eax
c000b344:	8b 40 08             	mov    0x8(%eax),%eax
c000b347:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b34a:	8b 45 08             	mov    0x8(%ebp),%eax
c000b34d:	8b 40 08             	mov    0x8(%eax),%eax
c000b350:	85 c0                	test   %eax,%eax
c000b352:	75 07                	jne    c000b35b <popFromDoubleLinkList+0x41>
c000b354:	b8 00 00 00 00       	mov    $0x0,%eax
c000b359:	eb 51                	jmp    c000b3ac <popFromDoubleLinkList+0x92>
c000b35b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b35e:	8b 40 08             	mov    0x8(%eax),%eax
c000b361:	8b 00                	mov    (%eax),%eax
c000b363:	85 c0                	test   %eax,%eax
c000b365:	74 11                	je     c000b378 <popFromDoubleLinkList+0x5e>
c000b367:	8b 45 08             	mov    0x8(%ebp),%eax
c000b36a:	8b 40 08             	mov    0x8(%eax),%eax
c000b36d:	8b 00                	mov    (%eax),%eax
c000b36f:	8b 55 08             	mov    0x8(%ebp),%edx
c000b372:	83 c2 08             	add    $0x8,%edx
c000b375:	89 50 04             	mov    %edx,0x4(%eax)
c000b378:	8b 45 08             	mov    0x8(%ebp),%eax
c000b37b:	8b 40 08             	mov    0x8(%eax),%eax
c000b37e:	8b 10                	mov    (%eax),%edx
c000b380:	8b 45 08             	mov    0x8(%ebp),%eax
c000b383:	89 50 08             	mov    %edx,0x8(%eax)
c000b386:	83 ec 0c             	sub    $0xc,%esp
c000b389:	ff 75 f4             	pushl  -0xc(%ebp)
c000b38c:	e8 0d c9 ff ff       	call   c0007c9e <intr_set_status>
c000b391:	83 c4 10             	add    $0x10,%esp
c000b394:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b397:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b39e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3a1:	8b 50 04             	mov    0x4(%eax),%edx
c000b3a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3a7:	89 10                	mov    %edx,(%eax)
c000b3a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3ac:	c9                   	leave  
c000b3ad:	c3                   	ret    

c000b3ae <kernel_thread>:
c000b3ae:	55                   	push   %ebp
c000b3af:	89 e5                	mov    %esp,%ebp
c000b3b1:	83 ec 08             	sub    $0x8,%esp
c000b3b4:	fb                   	sti    
c000b3b5:	83 ec 0c             	sub    $0xc,%esp
c000b3b8:	ff 75 0c             	pushl  0xc(%ebp)
c000b3bb:	8b 45 08             	mov    0x8(%ebp),%eax
c000b3be:	ff d0                	call   *%eax
c000b3c0:	83 c4 10             	add    $0x10,%esp
c000b3c3:	90                   	nop
c000b3c4:	c9                   	leave  
c000b3c5:	c3                   	ret    

c000b3c6 <thread_init>:
c000b3c6:	55                   	push   %ebp
c000b3c7:	89 e5                	mov    %esp,%ebp
c000b3c9:	83 ec 18             	sub    $0x18,%esp
c000b3cc:	83 ec 08             	sub    $0x8,%esp
c000b3cf:	6a 00                	push   $0x0
c000b3d1:	6a 01                	push   $0x1
c000b3d3:	e8 47 be ff ff       	call   c000721f <alloc_memory>
c000b3d8:	83 c4 10             	add    $0x10,%esp
c000b3db:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b3de:	83 ec 04             	sub    $0x4,%esp
c000b3e1:	68 00 10 00 00       	push   $0x1000
c000b3e6:	6a 00                	push   $0x0
c000b3e8:	ff 75 f4             	pushl  -0xc(%ebp)
c000b3eb:	e8 fb 0f 00 00       	call   c000c3eb <Memset>
c000b3f0:	83 c4 10             	add    $0x10,%esp
c000b3f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b3f6:	05 00 10 00 00       	add    $0x1000,%eax
c000b3fb:	89 c2                	mov    %eax,%edx
c000b3fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b400:	89 10                	mov    %edx,(%eax)
c000b402:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b405:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000b40c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b40f:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000b416:	ff ff ff 
c000b419:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b41c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000b423:	00 00 00 
c000b426:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b429:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000b42f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b432:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000b438:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000b43d:	83 c0 01             	add    $0x1,%eax
c000b440:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000b445:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000b44b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b44e:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000b454:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b457:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c000b45e:	00 00 00 
c000b461:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b464:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000b46b:	cd ab 99 
c000b46e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b471:	c9                   	leave  
c000b472:	c3                   	ret    

c000b473 <thread_create>:
c000b473:	55                   	push   %ebp
c000b474:	89 e5                	mov    %esp,%ebp
c000b476:	83 ec 10             	sub    $0x10,%esp
c000b479:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000b480:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000b487:	8b 45 08             	mov    0x8(%ebp),%eax
c000b48a:	8b 00                	mov    (%eax),%eax
c000b48c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000b48f:	89 c2                	mov    %eax,%edx
c000b491:	8b 45 08             	mov    0x8(%ebp),%eax
c000b494:	89 10                	mov    %edx,(%eax)
c000b496:	8b 45 08             	mov    0x8(%ebp),%eax
c000b499:	8b 00                	mov    (%eax),%eax
c000b49b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000b49e:	89 c2                	mov    %eax,%edx
c000b4a0:	8b 45 08             	mov    0x8(%ebp),%eax
c000b4a3:	89 10                	mov    %edx,(%eax)
c000b4a5:	90                   	nop
c000b4a6:	c9                   	leave  
c000b4a7:	c3                   	ret    

c000b4a8 <thread_start>:
c000b4a8:	55                   	push   %ebp
c000b4a9:	89 e5                	mov    %esp,%ebp
c000b4ab:	83 ec 18             	sub    $0x18,%esp
c000b4ae:	e8 13 ff ff ff       	call   c000b3c6 <thread_init>
c000b4b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b4b6:	83 ec 0c             	sub    $0xc,%esp
c000b4b9:	ff 75 f4             	pushl  -0xc(%ebp)
c000b4bc:	e8 b2 ff ff ff       	call   c000b473 <thread_create>
c000b4c1:	83 c4 10             	add    $0x10,%esp
c000b4c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4c7:	05 34 01 00 00       	add    $0x134,%eax
c000b4cc:	83 ec 08             	sub    $0x8,%esp
c000b4cf:	ff 75 10             	pushl  0x10(%ebp)
c000b4d2:	50                   	push   %eax
c000b4d3:	e8 32 0f 00 00       	call   c000c40a <Strcpy>
c000b4d8:	83 c4 10             	add    $0x10,%esp
c000b4db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4de:	8b 00                	mov    (%eax),%eax
c000b4e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b4e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b4e6:	c7 40 10 ae b3 00 c0 	movl   $0xc000b3ae,0x10(%eax)
c000b4ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b4f0:	8b 55 08             	mov    0x8(%ebp),%edx
c000b4f3:	89 50 18             	mov    %edx,0x18(%eax)
c000b4f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b4f9:	8b 55 0c             	mov    0xc(%ebp),%edx
c000b4fc:	89 50 1c             	mov    %edx,0x1c(%eax)
c000b4ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b502:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000b508:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b50b:	8b 10                	mov    (%eax),%edx
c000b50d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b510:	89 50 04             	mov    %edx,0x4(%eax)
c000b513:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b516:	8b 50 04             	mov    0x4(%eax),%edx
c000b519:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b51c:	89 50 08             	mov    %edx,0x8(%eax)
c000b51f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b522:	8b 50 08             	mov    0x8(%eax),%edx
c000b525:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b528:	89 50 0c             	mov    %edx,0xc(%eax)
c000b52b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b52e:	05 00 01 00 00       	add    $0x100,%eax
c000b533:	83 ec 08             	sub    $0x8,%esp
c000b536:	50                   	push   %eax
c000b537:	68 ec 0d 01 c0       	push   $0xc0010dec
c000b53c:	e8 6f fc ff ff       	call   c000b1b0 <appendToDoubleLinkList>
c000b541:	83 c4 10             	add    $0x10,%esp
c000b544:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b547:	05 08 01 00 00       	add    $0x108,%eax
c000b54c:	83 ec 08             	sub    $0x8,%esp
c000b54f:	50                   	push   %eax
c000b550:	68 04 1f 01 c0       	push   $0xc0011f04
c000b555:	e8 56 fc ff ff       	call   c000b1b0 <appendToDoubleLinkList>
c000b55a:	83 c4 10             	add    $0x10,%esp
c000b55d:	90                   	nop
c000b55e:	c9                   	leave  
c000b55f:	c3                   	ret    
