
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
c000156a:	e8 4c 72 00 00       	call   c00087bb <test>
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
c000164b:	e8 6e 6c 00 00       	call   c00082be <exception_handler>
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
c0001668:	e8 51 6c 00 00       	call   c00082be <exception_handler>
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
c00017e9:	e8 6a 69 00 00       	call   c0008158 <disp_int>
c00017ee:	83 c4 04             	add    $0x4,%esp
c00017f1:	58                   	pop    %eax
c00017f2:	5a                   	pop    %edx
c00017f3:	52                   	push   %edx
c00017f4:	50                   	push   %eax
c00017f5:	e8 5e 69 00 00       	call   c0008158 <disp_int>
c00017fa:	58                   	pop    %eax
c00017fb:	5a                   	pop    %edx
c00017fc:	52                   	push   %edx
c00017fd:	50                   	push   %eax
c00017fe:	ff 35 a4 07 01 c0    	pushl  0xc00107a4
c0001804:	e8 4f 69 00 00       	call   c0008158 <disp_int>
c0001809:	83 c4 04             	add    $0x4,%esp
c000180c:	58                   	pop    %eax
c000180d:	5a                   	pop    %edx
c000180e:	52                   	push   %edx
c000180f:	50                   	push   %eax
c0001810:	ff 72 ec             	pushl  -0x14(%edx)
c0001813:	e8 40 69 00 00       	call   c0008158 <disp_int>
c0001818:	83 c4 04             	add    $0x4,%esp
c000181b:	58                   	pop    %eax
c000181c:	5a                   	pop    %edx
c000181d:	52                   	push   %edx
c000181e:	50                   	push   %eax
c000181f:	ff 70 ec             	pushl  -0x14(%eax)
c0001822:	e8 31 69 00 00       	call   c0008158 <disp_int>
c0001827:	83 c4 04             	add    $0x4,%esp
c000182a:	58                   	pop    %eax
c000182b:	5a                   	pop    %edx
c000182c:	52                   	push   %edx
c000182d:	50                   	push   %eax
c000182e:	ff 35 c0 0b 01 c0    	pushl  0xc0010bc0
c0001834:	e8 1f 69 00 00       	call   c0008158 <disp_int>
c0001839:	83 c4 04             	add    $0x4,%esp
c000183c:	58                   	pop    %eax
c000183d:	5a                   	pop    %edx
c000183e:	52                   	push   %edx
c000183f:	50                   	push   %eax
c0001840:	68 60 07 01 c0       	push   $0xc0010760
c0001845:	e8 0e 69 00 00       	call   c0008158 <disp_int>
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
c00018cd:	e8 7e 99 00 00       	call   c000b250 <appendToDoubleLinkList>
c00018d2:	83 c4 10             	add    $0x10,%esp
c00018d5:	a1 e0 1e 01 c0       	mov    0xc0011ee0,%eax
c00018da:	05 08 01 00 00       	add    $0x108,%eax
c00018df:	83 ec 08             	sub    $0x8,%esp
c00018e2:	50                   	push   %eax
c00018e3:	68 ec 0d 01 c0       	push   $0xc0010dec
c00018e8:	e8 63 99 00 00       	call   c000b250 <appendToDoubleLinkList>
c00018ed:	83 c4 10             	add    $0x10,%esp
c00018f0:	6a 00                	push   $0x0
c00018f2:	68 00 b6 00 c0       	push   $0xc000b600
c00018f7:	68 07 b6 00 c0       	push   $0xc000b607
c00018fc:	68 38 64 00 c0       	push   $0xc0006438
c0001901:	e8 95 96 00 00       	call   c000af9b <process_execute>
c0001906:	83 c4 10             	add    $0x10,%esp
c0001909:	6a 00                	push   $0x0
c000190b:	68 10 b6 00 c0       	push   $0xc000b610
c0001910:	68 18 b6 00 c0       	push   $0xc000b618
c0001915:	68 b9 29 00 c0       	push   $0xc00029b9
c000191a:	e8 7c 96 00 00       	call   c000af9b <process_execute>
c000191f:	83 c4 10             	add    $0x10,%esp
c0001922:	6a 00                	push   $0x0
c0001924:	68 21 b6 00 c0       	push   $0xc000b621
c0001929:	68 28 b6 00 c0       	push   $0xc000b628
c000192e:	68 2b 1b 00 c0       	push   $0xc0001b2b
c0001933:	e8 63 96 00 00       	call   c000af9b <process_execute>
c0001938:	83 c4 10             	add    $0x10,%esp
c000193b:	6a 00                	push   $0x0
c000193d:	68 31 b6 00 c0       	push   $0xc000b631
c0001942:	68 39 b6 00 c0       	push   $0xc000b639
c0001947:	68 66 59 00 c0       	push   $0xc0005966
c000194c:	e8 4a 96 00 00       	call   c000af9b <process_execute>
c0001951:	83 c4 10             	add    $0x10,%esp
c0001954:	6a 01                	push   $0x1
c0001956:	68 43 b6 00 c0       	push   $0xc000b643
c000195b:	68 4d b6 00 c0       	push   $0xc000b64d
c0001960:	68 f6 1a 00 c0       	push   $0xc0001af6
c0001965:	e8 31 96 00 00       	call   c000af9b <process_execute>
c000196a:	83 c4 10             	add    $0x10,%esp
c000196d:	83 ec 0c             	sub    $0xc,%esp
c0001970:	68 5a b6 00 c0       	push   $0xc000b65a
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
c00019b1:	68 64 b6 00 c0       	push   $0xc000b664
c00019b6:	e8 d1 fb ff ff       	call   c000158c <disp_str>
c00019bb:	83 c4 10             	add    $0x10,%esp
c00019be:	e8 b5 6e 00 00       	call   c0008878 <init_keyboard>
c00019c3:	83 ec 0c             	sub    $0xc,%esp
c00019c6:	68 00 00 00 02       	push   $0x2000000
c00019cb:	e8 c9 61 00 00       	call   c0007b99 <init_memory>
c00019d0:	83 c4 10             	add    $0x10,%esp
c00019d3:	83 ec 0c             	sub    $0xc,%esp
c00019d6:	68 ec 0d 01 c0       	push   $0xc0010dec
c00019db:	e8 45 97 00 00       	call   c000b125 <initDoubleLinkList>
c00019e0:	83 c4 10             	add    $0x10,%esp
c00019e3:	83 ec 0c             	sub    $0xc,%esp
c00019e6:	68 04 1f 01 c0       	push   $0xc0011f04
c00019eb:	e8 35 97 00 00       	call   c000b125 <initDoubleLinkList>
c00019f0:	83 c4 10             	add    $0x10,%esp
c00019f3:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00019fa:	00 00 00 
c00019fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a04:	eb 14                	jmp    c0001a1a <init+0x9a>
c0001a06:	83 ec 0c             	sub    $0xc,%esp
c0001a09:	68 6a b6 00 c0       	push   $0xc000b66a
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
c0001a5e:	68 6b b6 00 c0       	push   $0xc000b66b
c0001a63:	e8 24 fb ff ff       	call   c000158c <disp_str>
c0001a68:	83 c4 10             	add    $0x10,%esp
c0001a6b:	83 ec 0c             	sub    $0xc,%esp
c0001a6e:	68 74 b6 00 c0       	push   $0xc000b674
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
c0001aab:	68 76 b6 00 c0       	push   $0xc000b676
c0001ab0:	e8 d7 fa ff ff       	call   c000158c <disp_str>
c0001ab5:	83 c4 10             	add    $0x10,%esp
c0001ab8:	83 ec 0c             	sub    $0xc,%esp
c0001abb:	68 74 b6 00 c0       	push   $0xc000b674
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
c0001aff:	68 7f b6 00 c0       	push   $0xc000b67f
c0001b04:	e8 83 fa ff ff       	call   c000158c <disp_str>
c0001b09:	83 c4 10             	add    $0x10,%esp
c0001b0c:	e8 d5 7c 00 00       	call   c00097e6 <test_exec>
c0001b11:	eb fe                	jmp    c0001b11 <user_proc_a+0x1b>

c0001b13 <user_proc_b>:
c0001b13:	55                   	push   %ebp
c0001b14:	89 e5                	mov    %esp,%ebp
c0001b16:	83 ec 08             	sub    $0x8,%esp
c0001b19:	83 ec 0c             	sub    $0xc,%esp
c0001b1c:	68 91 b6 00 c0       	push   $0xc000b691
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
c0001b41:	6a 7c                	push   $0x7c
c0001b43:	e8 5c 0e 00 00       	call   c00029a4 <sys_malloc>
c0001b48:	83 c4 10             	add    $0x10,%esp
c0001b4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b4e:	83 ec 04             	sub    $0x4,%esp
c0001b51:	6a 7c                	push   $0x7c
c0001b53:	6a 00                	push   $0x0
c0001b55:	ff 75 f0             	pushl  -0x10(%ebp)
c0001b58:	e8 2e a9 00 00       	call   c000c48b <Memset>
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
c0001b9a:	e8 e1 8a 00 00       	call   c000a680 <send_rec>
c0001b9f:	83 c4 10             	add    $0x10,%esp
c0001ba2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ba5:	8b 40 78             	mov    0x78(%eax),%eax
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
c0001c0e:	68 a4 b6 00 c0       	push   $0xc000b6a4
c0001c13:	68 a4 b6 00 c0       	push   $0xc000b6a4
c0001c18:	68 ac b6 00 c0       	push   $0xc000b6ac
c0001c1d:	e8 32 81 00 00       	call   c0009d54 <assertion_failure>
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
c0001c79:	68 06 b7 00 c0       	push   $0xc000b706
c0001c7e:	e8 8d 80 00 00       	call   c0009d10 <spin>
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
c0001cb3:	68 18 b7 00 c0       	push   $0xc000b718
c0001cb8:	e8 79 80 00 00       	call   c0009d36 <panic>
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
c0001e14:	e8 72 a6 00 00       	call   c000c48b <Memset>
c0001e19:	83 c4 10             	add    $0x10,%esp
c0001e1c:	83 ec 04             	sub    $0x4,%esp
c0001e1f:	ff 75 f4             	pushl  -0xc(%ebp)
c0001e22:	ff 75 ec             	pushl  -0x14(%ebp)
c0001e25:	68 f0 01 00 00       	push   $0x1f0
c0001e2a:	e8 b0 a6 00 00       	call   c000c4df <read_port>
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
c0001f92:	e8 13 a5 00 00       	call   c000c4aa <Strcpy>
c0001f97:	83 c4 10             	add    $0x10,%esp
c0001f9a:	eb 13                	jmp    c0001faf <print_hdinfo+0x167>
c0001f9c:	83 ec 08             	sub    $0x8,%esp
c0001f9f:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001fa2:	50                   	push   %eax
c0001fa3:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001fa6:	50                   	push   %eax
c0001fa7:	e8 fe a4 00 00       	call   c000c4aa <Strcpy>
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
c0001fe6:	68 22 b7 00 c0       	push   $0xc000b722
c0001feb:	e8 07 7a 00 00       	call   c00099f7 <Printf>
c0001ff0:	83 c4 10             	add    $0x10,%esp
c0001ff3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ff6:	8b 40 0c             	mov    0xc(%eax),%eax
c0001ff9:	83 ec 08             	sub    $0x8,%esp
c0001ffc:	50                   	push   %eax
c0001ffd:	68 2a b7 00 c0       	push   $0xc000b72a
c0002002:	e8 f0 79 00 00       	call   c00099f7 <Printf>
c0002007:	83 c4 10             	add    $0x10,%esp
c000200a:	8b 45 08             	mov    0x8(%ebp),%eax
c000200d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0002011:	0f b6 c0             	movzbl %al,%eax
c0002014:	83 ec 08             	sub    $0x8,%esp
c0002017:	50                   	push   %eax
c0002018:	68 3b b7 00 c0       	push   $0xc000b73b
c000201d:	e8 d5 79 00 00       	call   c00099f7 <Printf>
c0002022:	83 c4 10             	add    $0x10,%esp
c0002025:	8b 45 08             	mov    0x8(%ebp),%eax
c0002028:	0f b6 00             	movzbl (%eax),%eax
c000202b:	0f b6 c0             	movzbl %al,%eax
c000202e:	83 ec 08             	sub    $0x8,%esp
c0002031:	50                   	push   %eax
c0002032:	68 49 b7 00 c0       	push   $0xc000b749
c0002037:	e8 bb 79 00 00       	call   c00099f7 <Printf>
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
c00020db:	e8 ab a3 00 00       	call   c000c48b <Memset>
c00020e0:	83 c4 10             	add    $0x10,%esp
c00020e3:	83 ec 04             	sub    $0x4,%esp
c00020e6:	ff 75 f4             	pushl  -0xc(%ebp)
c00020e9:	ff 75 ec             	pushl  -0x14(%ebp)
c00020ec:	68 f0 01 00 00       	push   $0x1f0
c00020f1:	e8 e9 a3 00 00       	call   c000c4df <read_port>
c00020f6:	83 c4 10             	add    $0x10,%esp
c00020f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00020fc:	05 be 01 00 00       	add    $0x1be,%eax
c0002101:	83 ec 04             	sub    $0x4,%esp
c0002104:	6a 40                	push   $0x40
c0002106:	50                   	push   %eax
c0002107:	ff 75 10             	pushl  0x10(%ebp)
c000210a:	e8 60 5c 00 00       	call   c0007d6f <Memcpy>
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
c0002178:	e8 0e a3 00 00       	call   c000c48b <Memset>
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
c00022aa:	e8 dc a1 00 00       	call   c000c48b <Memset>
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
c000238a:	6a 7c                	push   $0x7c
c000238c:	e8 13 06 00 00       	call   c00029a4 <sys_malloc>
c0002391:	83 c4 10             	add    $0x10,%esp
c0002394:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002397:	83 ec 04             	sub    $0x4,%esp
c000239a:	6a 7c                	push   $0x7c
c000239c:	6a 00                	push   $0x0
c000239e:	ff 75 f0             	pushl  -0x10(%ebp)
c00023a1:	e8 e5 a0 00 00       	call   c000c48b <Memset>
c00023a6:	83 c4 10             	add    $0x10,%esp
c00023a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023ac:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c00023b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00023b6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00023bd:	83 ec 04             	sub    $0x4,%esp
c00023c0:	6a 02                	push   $0x2
c00023c2:	ff 75 f0             	pushl  -0x10(%ebp)
c00023c5:	6a 01                	push   $0x1
c00023c7:	e8 b4 82 00 00       	call   c000a680 <send_rec>
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
c0002429:	6a 7c                	push   $0x7c
c000242b:	e8 74 05 00 00       	call   c00029a4 <sys_malloc>
c0002430:	83 c4 10             	add    $0x10,%esp
c0002433:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002436:	83 ec 04             	sub    $0x4,%esp
c0002439:	6a 7c                	push   $0x7c
c000243b:	6a 00                	push   $0x0
c000243d:	ff 75 ec             	pushl  -0x14(%ebp)
c0002440:	e8 46 a0 00 00       	call   c000c48b <Memset>
c0002445:	83 c4 10             	add    $0x10,%esp
c0002448:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000244b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002452:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002455:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000245c:	83 ec 04             	sub    $0x4,%esp
c000245f:	6a 02                	push   $0x2
c0002461:	ff 75 ec             	pushl  -0x14(%ebp)
c0002464:	6a 01                	push   $0x1
c0002466:	e8 15 82 00 00       	call   c000a680 <send_rec>
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
c0002494:	68 54 b7 00 c0       	push   $0xc000b754
c0002499:	e8 98 78 00 00       	call   c0009d36 <panic>
c000249e:	83 c4 10             	add    $0x10,%esp
c00024a1:	90                   	nop
c00024a2:	c9                   	leave  
c00024a3:	c3                   	ret    

c00024a4 <interrupt_wait>:
c00024a4:	55                   	push   %ebp
c00024a5:	89 e5                	mov    %esp,%ebp
c00024a7:	83 ec 18             	sub    $0x18,%esp
c00024aa:	83 ec 0c             	sub    $0xc,%esp
c00024ad:	6a 7c                	push   $0x7c
c00024af:	e8 f0 04 00 00       	call   c00029a4 <sys_malloc>
c00024b4:	83 c4 10             	add    $0x10,%esp
c00024b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024ba:	83 ec 04             	sub    $0x4,%esp
c00024bd:	6a 7c                	push   $0x7c
c00024bf:	6a 00                	push   $0x0
c00024c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00024c4:	e8 c2 9f 00 00       	call   c000c48b <Memset>
c00024c9:	83 c4 10             	add    $0x10,%esp
c00024cc:	83 ec 04             	sub    $0x4,%esp
c00024cf:	68 13 02 00 00       	push   $0x213
c00024d4:	ff 75 f4             	pushl  -0xc(%ebp)
c00024d7:	6a 02                	push   $0x2
c00024d9:	e8 a2 81 00 00       	call   c000a680 <send_rec>
c00024de:	83 c4 10             	add    $0x10,%esp
c00024e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00024e4:	83 ec 08             	sub    $0x8,%esp
c00024e7:	6a 7c                	push   $0x7c
c00024e9:	50                   	push   %eax
c00024ea:	e8 df 51 00 00       	call   c00076ce <sys_free>
c00024ef:	83 c4 10             	add    $0x10,%esp
c00024f2:	90                   	nop
c00024f3:	c9                   	leave  
c00024f4:	c3                   	ret    

c00024f5 <hd_rdwt>:
c00024f5:	55                   	push   %ebp
c00024f6:	89 e5                	mov    %esp,%ebp
c00024f8:	81 ec c8 00 00 00    	sub    $0xc8,%esp
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
c00025ec:	e8 6e 4a 00 00       	call   c000705f <alloc_virtual_memory>
c00025f1:	83 c4 10             	add    $0x10,%esp
c00025f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00025f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00025fa:	8b 40 78             	mov    0x78(%eax),%eax
c00025fd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002600:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002604:	74 22                	je     c0002628 <hd_rdwt+0x133>
c0002606:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000260a:	74 1c                	je     c0002628 <hd_rdwt+0x133>
c000260c:	68 b3 01 00 00       	push   $0x1b3
c0002611:	68 a4 b6 00 c0       	push   $0xc000b6a4
c0002616:	68 a4 b6 00 c0       	push   $0xc000b6a4
c000261b:	68 66 b7 00 c0       	push   $0xc000b766
c0002620:	e8 2f 77 00 00       	call   c0009d54 <assertion_failure>
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
c0002683:	68 a4 b6 00 c0       	push   $0xc000b6a4
c0002688:	68 a4 b6 00 c0       	push   $0xc000b6a4
c000268d:	68 84 b7 00 c0       	push   $0xc000b784
c0002692:	e8 bd 76 00 00       	call   c0009d54 <assertion_failure>
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
c00026de:	e8 a8 9d 00 00       	call   c000c48b <Memset>
c00026e3:	83 c4 10             	add    $0x10,%esp
c00026e6:	83 ec 04             	sub    $0x4,%esp
c00026e9:	68 00 02 00 00       	push   $0x200
c00026ee:	68 80 21 01 c0       	push   $0xc0012180
c00026f3:	68 f0 01 00 00       	push   $0x1f0
c00026f8:	e8 e2 9d 00 00       	call   c000c4df <read_port>
c00026fd:	83 c4 10             	add    $0x10,%esp
c0002700:	83 ec 04             	sub    $0x4,%esp
c0002703:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002706:	68 80 21 01 c0       	push   $0xc0012180
c000270b:	ff 75 f0             	pushl  -0x10(%ebp)
c000270e:	e8 5c 56 00 00       	call   c0007d6f <Memcpy>
c0002713:	83 c4 10             	add    $0x10,%esp
c0002716:	eb 26                	jmp    c000273e <hd_rdwt+0x249>
c0002718:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c000271c:	75 20                	jne    c000273e <hd_rdwt+0x249>
c000271e:	e8 50 fd ff ff       	call   c0002473 <wait_for>
c0002723:	83 ec 04             	sub    $0x4,%esp
c0002726:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002729:	ff 75 f0             	pushl  -0x10(%ebp)
c000272c:	68 f0 01 00 00       	push   $0x1f0
c0002731:	e8 bd 9d 00 00       	call   c000c4f3 <write_port>
c0002736:	83 c4 10             	add    $0x10,%esp
c0002739:	e8 66 fd ff ff       	call   c00024a4 <interrupt_wait>
c000273e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002741:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002744:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002747:	01 45 f0             	add    %eax,-0x10(%ebp)
c000274a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000274e:	0f 85 5a ff ff ff    	jne    c00026ae <hd_rdwt+0x1b9>
c0002754:	83 ec 04             	sub    $0x4,%esp
c0002757:	6a 7c                	push   $0x7c
c0002759:	6a 00                	push   $0x0
c000275b:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0002761:	50                   	push   %eax
c0002762:	e8 24 9d 00 00       	call   c000c48b <Memset>
c0002767:	83 c4 10             	add    $0x10,%esp
c000276a:	c7 45 b8 65 00 00 00 	movl   $0x65,-0x48(%ebp)
c0002771:	c7 85 48 ff ff ff 00 	movl   $0x0,-0xb8(%ebp)
c0002778:	00 00 00 
c000277b:	83 ec 04             	sub    $0x4,%esp
c000277e:	6a 02                	push   $0x2
c0002780:	8d 85 40 ff ff ff    	lea    -0xc0(%ebp),%eax
c0002786:	50                   	push   %eax
c0002787:	6a 01                	push   $0x1
c0002789:	e8 f2 7e 00 00       	call   c000a680 <send_rec>
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
c00027b5:	e8 61 81 00 00       	call   c000a91b <inform_int>
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
c000280d:	68 b8 b7 00 c0       	push   $0xc000b7b8
c0002812:	e8 e0 71 00 00       	call   c00099f7 <Printf>
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
c000284a:	68 d5 b7 00 c0       	push   $0xc000b7d5
c000284f:	e8 a3 71 00 00       	call   c00099f7 <Printf>
c0002854:	83 c4 10             	add    $0x10,%esp
c0002857:	eb 01                	jmp    c000285a <print_hd_info+0x56>
c0002859:	90                   	nop
c000285a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000285e:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002862:	7e bf                	jle    c0002823 <print_hd_info+0x1f>
c0002864:	83 ec 0c             	sub    $0xc,%esp
c0002867:	68 ed b7 00 c0       	push   $0xc000b7ed
c000286c:	e8 86 71 00 00       	call   c00099f7 <Printf>
c0002871:	83 c4 10             	add    $0x10,%esp
c0002874:	83 ec 0c             	sub    $0xc,%esp
c0002877:	68 08 b8 00 c0       	push   $0xc000b808
c000287c:	e8 76 71 00 00       	call   c00099f7 <Printf>
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
c00028c4:	68 d5 b7 00 c0       	push   $0xc000b7d5
c00028c9:	e8 29 71 00 00       	call   c00099f7 <Printf>
c00028ce:	83 c4 10             	add    $0x10,%esp
c00028d1:	eb 01                	jmp    c00028d4 <print_hd_info+0xd0>
c00028d3:	90                   	nop
c00028d4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00028d8:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00028dc:	7e b6                	jle    c0002894 <print_hd_info+0x90>
c00028de:	83 ec 0c             	sub    $0xc,%esp
c00028e1:	68 25 b8 00 c0       	push   $0xc000b825
c00028e6:	e8 0c 71 00 00       	call   c00099f7 <Printf>
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
c00029c7:	6a 7c                	push   $0x7c
c00029c9:	e8 d6 ff ff ff       	call   c00029a4 <sys_malloc>
c00029ce:	83 c4 10             	add    $0x10,%esp
c00029d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00029d4:	83 ec 0c             	sub    $0xc,%esp
c00029d7:	6a 7c                	push   $0x7c
c00029d9:	e8 c6 ff ff ff       	call   c00029a4 <sys_malloc>
c00029de:	83 c4 10             	add    $0x10,%esp
c00029e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00029e4:	83 ec 04             	sub    $0x4,%esp
c00029e7:	6a 7c                	push   $0x7c
c00029e9:	6a 00                	push   $0x0
c00029eb:	ff 75 f4             	pushl  -0xc(%ebp)
c00029ee:	e8 98 9a 00 00       	call   c000c48b <Memset>
c00029f3:	83 c4 10             	add    $0x10,%esp
c00029f6:	83 ec 04             	sub    $0x4,%esp
c00029f9:	6a 12                	push   $0x12
c00029fb:	ff 75 f4             	pushl  -0xc(%ebp)
c00029fe:	6a 02                	push   $0x2
c0002a00:	e8 7b 7c 00 00       	call   c000a680 <send_rec>
c0002a05:	83 c4 10             	add    $0x10,%esp
c0002a08:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a0b:	8b 40 78             	mov    0x78(%eax),%eax
c0002a0e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002a11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a14:	8b 00                	mov    (%eax),%eax
c0002a16:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a1c:	8b 40 50             	mov    0x50(%eax),%eax
c0002a1f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a25:	8b 40 68             	mov    0x68(%eax),%eax
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
c0002a7b:	68 44 b8 00 c0       	push   $0xc000b844
c0002a80:	68 44 b8 00 c0       	push   $0xc000b844
c0002a85:	68 54 b8 00 c0       	push   $0xc000b854
c0002a8a:	e8 c5 72 00 00       	call   c0009d54 <assertion_failure>
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
c0002ad5:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002adc:	83 ec 0c             	sub    $0xc,%esp
c0002adf:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ae2:	e8 ee 07 00 00       	call   c00032d5 <do_open>
c0002ae7:	83 c4 10             	add    $0x10,%esp
c0002aea:	89 c2                	mov    %eax,%edx
c0002aec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002aef:	89 50 50             	mov    %edx,0x50(%eax)
c0002af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002af5:	8b 00                	mov    (%eax),%eax
c0002af7:	83 ec 04             	sub    $0x4,%esp
c0002afa:	50                   	push   %eax
c0002afb:	ff 75 f4             	pushl  -0xc(%ebp)
c0002afe:	6a 01                	push   $0x1
c0002b00:	e8 7b 7b 00 00       	call   c000a680 <send_rec>
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
c0002b2b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002b32:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b38:	89 50 60             	mov    %edx,0x60(%eax)
c0002b3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b3e:	8b 00                	mov    (%eax),%eax
c0002b40:	83 ec 04             	sub    $0x4,%esp
c0002b43:	50                   	push   %eax
c0002b44:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b47:	6a 01                	push   $0x1
c0002b49:	e8 32 7b 00 00       	call   c000a680 <send_rec>
c0002b4e:	83 c4 10             	add    $0x10,%esp
c0002b51:	eb 6b                	jmp    c0002bbe <task_fs+0x205>
c0002b53:	83 ec 0c             	sub    $0xc,%esp
c0002b56:	ff 75 e4             	pushl  -0x1c(%ebp)
c0002b59:	e8 d2 1d 00 00       	call   c0004930 <do_close>
c0002b5e:	83 c4 10             	add    $0x10,%esp
c0002b61:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b64:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0002b6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b6e:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c0002b75:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b78:	8b 00                	mov    (%eax),%eax
c0002b7a:	83 ec 04             	sub    $0x4,%esp
c0002b7d:	50                   	push   %eax
c0002b7e:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b81:	6a 01                	push   $0x1
c0002b83:	e8 f8 7a 00 00       	call   c000a680 <send_rec>
c0002b88:	83 c4 10             	add    $0x10,%esp
c0002b8b:	eb 32                	jmp    c0002bbf <task_fs+0x206>
c0002b8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002b90:	8b 40 68             	mov    0x68(%eax),%eax
c0002b93:	83 ec 04             	sub    $0x4,%esp
c0002b96:	50                   	push   %eax
c0002b97:	ff 75 f4             	pushl  -0xc(%ebp)
c0002b9a:	6a 01                	push   $0x1
c0002b9c:	e8 df 7a 00 00       	call   c000a680 <send_rec>
c0002ba1:	83 c4 10             	add    $0x10,%esp
c0002ba4:	eb 19                	jmp    c0002bbf <task_fs+0x206>
c0002ba6:	83 ec 0c             	sub    $0xc,%esp
c0002ba9:	68 b7 b8 00 c0       	push   $0xc000b8b7
c0002bae:	e8 83 71 00 00       	call   c0009d36 <panic>
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
c0002bcd:	6a 7c                	push   $0x7c
c0002bcf:	e8 d0 fd ff ff       	call   c00029a4 <sys_malloc>
c0002bd4:	83 c4 10             	add    $0x10,%esp
c0002bd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002bda:	83 ec 04             	sub    $0x4,%esp
c0002bdd:	6a 7c                	push   $0x7c
c0002bdf:	6a 00                	push   $0x0
c0002be1:	ff 75 f4             	pushl  -0xc(%ebp)
c0002be4:	e8 a2 98 00 00       	call   c000c48b <Memset>
c0002be9:	83 c4 10             	add    $0x10,%esp
c0002bec:	8b 55 18             	mov    0x18(%ebp),%edx
c0002bef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002bf2:	89 50 78             	mov    %edx,0x78(%eax)
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
c0002c2f:	68 44 b8 00 c0       	push   $0xc000b844
c0002c34:	68 44 b8 00 c0       	push   $0xc000b844
c0002c39:	68 ca b8 00 c0       	push   $0xc000b8ca
c0002c3e:	e8 11 71 00 00       	call   c0009d54 <assertion_failure>
c0002c43:	83 c4 10             	add    $0x10,%esp
c0002c46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c49:	8b 40 78             	mov    0x78(%eax),%eax
c0002c4c:	83 f8 07             	cmp    $0x7,%eax
c0002c4f:	74 27                	je     c0002c78 <rd_wt+0xb4>
c0002c51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c54:	8b 40 78             	mov    0x78(%eax),%eax
c0002c57:	83 f8 0a             	cmp    $0xa,%eax
c0002c5a:	74 1c                	je     c0002c78 <rd_wt+0xb4>
c0002c5c:	68 b2 00 00 00       	push   $0xb2
c0002c61:	68 44 b8 00 c0       	push   $0xc000b844
c0002c66:	68 44 b8 00 c0       	push   $0xc000b844
c0002c6b:	68 e8 b8 00 c0       	push   $0xc000b8e8
c0002c70:	e8 df 70 00 00       	call   c0009d54 <assertion_failure>
c0002c75:	83 c4 10             	add    $0x10,%esp
c0002c78:	83 ec 04             	sub    $0x4,%esp
c0002c7b:	6a 03                	push   $0x3
c0002c7d:	ff 75 f4             	pushl  -0xc(%ebp)
c0002c80:	6a 03                	push   $0x3
c0002c82:	e8 f9 79 00 00       	call   c000a680 <send_rec>
c0002c87:	83 c4 10             	add    $0x10,%esp
c0002c8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002c8d:	83 ec 08             	sub    $0x8,%esp
c0002c90:	6a 7c                	push   $0x7c
c0002c92:	50                   	push   %eax
c0002c93:	e8 36 4a 00 00       	call   c00076ce <sys_free>
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
c0002cd8:	e8 49 44 00 00       	call   c0007126 <get_physical_address>
c0002cdd:	83 c4 10             	add    $0x10,%esp
c0002ce0:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002ce5:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002cea:	83 ec 0c             	sub    $0xc,%esp
c0002ced:	50                   	push   %eax
c0002cee:	e8 33 44 00 00       	call   c0007126 <get_physical_address>
c0002cf3:	83 c4 10             	add    $0x10,%esp
c0002cf6:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002cfb:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d00:	83 ec 04             	sub    $0x4,%esp
c0002d03:	68 00 02 00 00       	push   $0x200
c0002d08:	6a 00                	push   $0x0
c0002d0a:	50                   	push   %eax
c0002d0b:	e8 7b 97 00 00       	call   c000c48b <Memset>
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
c0002d9e:	e8 e8 96 00 00       	call   c000c48b <Memset>
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
c0002e0e:	e8 78 96 00 00       	call   c000c48b <Memset>
c0002e13:	83 c4 10             	add    $0x10,%esp
c0002e16:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e1b:	83 c0 01             	add    $0x1,%eax
c0002e1e:	83 ec 04             	sub    $0x4,%esp
c0002e21:	68 ff 01 00 00       	push   $0x1ff
c0002e26:	6a 80                	push   $0xffffff80
c0002e28:	50                   	push   %eax
c0002e29:	e8 5d 96 00 00       	call   c000c48b <Memset>
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
c0002e64:	e8 22 96 00 00       	call   c000c48b <Memset>
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
c0002e96:	e8 f0 95 00 00       	call   c000c48b <Memset>
c0002e9b:	83 c4 10             	add    $0x10,%esp
c0002e9e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ea3:	83 c0 01             	add    $0x1,%eax
c0002ea6:	83 ec 04             	sub    $0x4,%esp
c0002ea9:	68 ff 01 00 00       	push   $0x1ff
c0002eae:	6a 00                	push   $0x0
c0002eb0:	50                   	push   %eax
c0002eb1:	e8 d5 95 00 00       	call   c000c48b <Memset>
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
c000304c:	c7 85 70 ff ff ff 10 	movl   $0xc000b910,-0x90(%ebp)
c0003053:	b9 00 c0 
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
c000312c:	e8 93 93 00 00       	call   c000c4c4 <Strlen>
c0003131:	83 c4 10             	add    $0x10,%esp
c0003134:	89 c1                	mov    %eax,%ecx
c0003136:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003139:	8d 50 04             	lea    0x4(%eax),%edx
c000313c:	83 ec 04             	sub    $0x4,%esp
c000313f:	51                   	push   %ecx
c0003140:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0003146:	50                   	push   %eax
c0003147:	52                   	push   %edx
c0003148:	e8 22 4c 00 00       	call   c0007d6f <Memcpy>
c000314d:	83 c4 10             	add    $0x10,%esp
c0003150:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0003156:	b8 00 00 00 00       	mov    $0x0,%eax
c000315b:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0003160:	89 d7                	mov    %edx,%edi
c0003162:	f3 ab                	rep stos %eax,%es:(%edi)
c0003164:	c7 85 34 ff ff ff 1c 	movl   $0xc000b91c,-0xcc(%ebp)
c000316b:	b9 00 c0 
c000316e:	c7 85 38 ff ff ff 25 	movl   $0xc000b925,-0xc8(%ebp)
c0003175:	b9 00 c0 
c0003178:	c7 85 3c ff ff ff 2e 	movl   $0xc000b92e,-0xc4(%ebp)
c000317f:	b9 00 c0 
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
c00031af:	e8 10 93 00 00       	call   c000c4c4 <Strlen>
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
c00031cf:	e8 9b 4b 00 00       	call   c0007d6f <Memcpy>
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
c00031fa:	e8 c5 92 00 00       	call   c000c4c4 <Strlen>
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
c0003223:	e8 9c 92 00 00       	call   c000c4c4 <Strlen>
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
c0003243:	e8 27 4b 00 00       	call   c0007d6f <Memcpy>
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
c0003289:	6a 7c                	push   $0x7c
c000328b:	e8 14 f7 ff ff       	call   c00029a4 <sys_malloc>
c0003290:	83 c4 10             	add    $0x10,%esp
c0003293:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003296:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003299:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c00032a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032a3:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c00032aa:	83 ec 04             	sub    $0x4,%esp
c00032ad:	6a 03                	push   $0x3
c00032af:	ff 75 f4             	pushl  -0xc(%ebp)
c00032b2:	6a 03                	push   $0x3
c00032b4:	e8 c7 73 00 00       	call   c000a680 <send_rec>
c00032b9:	83 c4 10             	add    $0x10,%esp
c00032bc:	e8 dd f9 ff ff       	call   c0002c9e <mkfs>
c00032c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032c4:	83 ec 08             	sub    $0x8,%esp
c00032c7:	6a 7c                	push   $0x7c
c00032c9:	50                   	push   %eax
c00032ca:	e8 ff 43 00 00       	call   c00076ce <sys_free>
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
c00032e6:	e8 a0 91 00 00       	call   c000c48b <Memset>
c00032eb:	83 c4 10             	add    $0x10,%esp
c00032ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00032f1:	8b 40 44             	mov    0x44(%eax),%eax
c00032f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00032f7:	83 ec 08             	sub    $0x8,%esp
c00032fa:	6a 0c                	push   $0xc
c00032fc:	ff 75 e4             	pushl  -0x1c(%ebp)
c00032ff:	e8 5b 3d 00 00       	call   c000705f <alloc_virtual_memory>
c0003304:	83 c4 10             	add    $0x10,%esp
c0003307:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000330a:	8b 45 08             	mov    0x8(%ebp),%eax
c000330d:	8b 40 40             	mov    0x40(%eax),%eax
c0003310:	89 c2                	mov    %eax,%edx
c0003312:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003315:	83 ec 04             	sub    $0x4,%esp
c0003318:	52                   	push   %edx
c0003319:	50                   	push   %eax
c000331a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000331d:	50                   	push   %eax
c000331e:	e8 4c 4a 00 00       	call   c0007d6f <Memcpy>
c0003323:	83 c4 10             	add    $0x10,%esp
c0003326:	8b 45 08             	mov    0x8(%ebp),%eax
c0003329:	8b 40 40             	mov    0x40(%eax),%eax
c000332c:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c0003331:	8b 45 08             	mov    0x8(%ebp),%eax
c0003334:	8b 40 74             	mov    0x74(%eax),%eax
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
c000337a:	68 44 b8 00 c0       	push   $0xc000b844
c000337f:	68 44 b8 00 c0       	push   $0xc000b844
c0003384:	68 37 b9 00 c0       	push   $0xc000b937
c0003389:	e8 c6 69 00 00       	call   c0009d54 <assertion_failure>
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
c00033cf:	68 44 b8 00 c0       	push   $0xc000b844
c00033d4:	68 44 b8 00 c0       	push   $0xc000b844
c00033d9:	68 3f b9 00 c0       	push   $0xc000b93f
c00033de:	e8 71 69 00 00       	call   c0009d54 <assertion_failure>
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
c0003407:	68 47 b9 00 c0       	push   $0xc000b947
c000340c:	e8 25 69 00 00       	call   c0009d36 <panic>
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
c00034b5:	e8 d1 8f 00 00       	call   c000c48b <Memset>
c00034ba:	83 c4 10             	add    $0x10,%esp
c00034bd:	83 ec 04             	sub    $0x4,%esp
c00034c0:	6a 28                	push   $0x28
c00034c2:	6a 00                	push   $0x0
c00034c4:	8d 45 98             	lea    -0x68(%ebp),%eax
c00034c7:	50                   	push   %eax
c00034c8:	e8 be 8f 00 00       	call   c000c48b <Memset>
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
c0003599:	e8 4a 74 00 00       	call   c000a9e8 <strcmp>
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
c0003a7e:	68 44 b8 00 c0       	push   $0xc000b844
c0003a83:	68 44 b8 00 c0       	push   $0xc000b844
c0003a88:	68 54 b9 00 c0       	push   $0xc000b954
c0003a8d:	e8 c2 62 00 00       	call   c0009d54 <assertion_failure>
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
c0003e79:	e8 2c 86 00 00       	call   c000c4aa <Strcpy>
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
c0003f47:	68 69 b9 00 c0       	push   $0xc000b969
c0003f4c:	e8 97 6a 00 00       	call   c000a9e8 <strcmp>
c0003f51:	83 c4 10             	add    $0x10,%esp
c0003f54:	85 c0                	test   %eax,%eax
c0003f56:	75 10                	jne    c0003f68 <do_unlink+0x31>
c0003f58:	83 ec 0c             	sub    $0xc,%esp
c0003f5b:	68 6b b9 00 c0       	push   $0xc000b96b
c0003f60:	e8 d1 5d 00 00       	call   c0009d36 <panic>
c0003f65:	83 c4 10             	add    $0x10,%esp
c0003f68:	83 ec 0c             	sub    $0xc,%esp
c0003f6b:	ff 75 08             	pushl  0x8(%ebp)
c0003f6e:	e8 31 f5 ff ff       	call   c00034a4 <search_file>
c0003f73:	83 c4 10             	add    $0x10,%esp
c0003f76:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003f79:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003f7d:	75 10                	jne    c0003f8f <do_unlink+0x58>
c0003f7f:	83 ec 0c             	sub    $0xc,%esp
c0003f82:	68 87 b9 00 c0       	push   $0xc000b987
c0003f87:	e8 aa 5d 00 00       	call   c0009d36 <panic>
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
c0003fb0:	68 87 b9 00 c0       	push   $0xc000b987
c0003fb5:	e8 7c 5d 00 00       	call   c0009d36 <panic>
c0003fba:	83 c4 10             	add    $0x10,%esp
c0003fbd:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003fc0:	85 c0                	test   %eax,%eax
c0003fc2:	7e 10                	jle    c0003fd4 <do_unlink+0x9d>
c0003fc4:	83 ec 0c             	sub    $0xc,%esp
c0003fc7:	68 a0 b9 00 c0       	push   $0xc000b9a0
c0003fcc:	e8 65 5d 00 00       	call   c0009d36 <panic>
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
c000436a:	e8 79 66 00 00       	call   c000a9e8 <strcmp>
c000436f:	83 c4 10             	add    $0x10,%esp
c0004372:	85 c0                	test   %eax,%eax
c0004374:	75 1b                	jne    c0004391 <do_unlink+0x45a>
c0004376:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000437d:	83 ec 04             	sub    $0x4,%esp
c0004380:	6a 10                	push   $0x10
c0004382:	6a 00                	push   $0x0
c0004384:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004387:	e8 ff 80 00 00       	call   c000c48b <Memset>
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
c000441f:	8b 40 78             	mov    0x78(%eax),%eax
c0004422:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0004425:	8b 45 08             	mov    0x8(%ebp),%eax
c0004428:	8b 40 60             	mov    0x60(%eax),%eax
c000442b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000442e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004431:	8b 40 6c             	mov    0x6c(%eax),%eax
c0004434:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004437:	8b 45 08             	mov    0x8(%ebp),%eax
c000443a:	8b 00                	mov    (%eax),%eax
c000443c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000443f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004442:	8b 40 10             	mov    0x10(%eax),%eax
c0004445:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0004448:	8b 45 08             	mov    0x8(%ebp),%eax
c000444b:	8b 40 50             	mov    0x50(%eax),%eax
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
c00044a4:	68 d8 b9 00 c0       	push   $0xc000b9d8
c00044a9:	e8 88 58 00 00       	call   c0009d36 <panic>
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
c00044d4:	68 44 b8 00 c0       	push   $0xc000b844
c00044d9:	68 44 b8 00 c0       	push   $0xc000b844
c00044de:	68 e8 b9 00 c0       	push   $0xc000b9e8
c00044e3:	e8 6c 58 00 00       	call   c0009d54 <assertion_failure>
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
c000451c:	89 50 78             	mov    %edx,0x78(%eax)
c000451f:	8b 55 b8             	mov    -0x48(%ebp),%edx
c0004522:	8b 45 08             	mov    0x8(%ebp),%eax
c0004525:	89 50 68             	mov    %edx,0x68(%eax)
c0004528:	83 ec 04             	sub    $0x4,%esp
c000452b:	6a 04                	push   $0x4
c000452d:	ff 75 08             	pushl  0x8(%ebp)
c0004530:	6a 03                	push   $0x3
c0004532:	e8 49 61 00 00       	call   c000a680 <send_rec>
c0004537:	83 c4 10             	add    $0x10,%esp
c000453a:	8b 45 08             	mov    0x8(%ebp),%eax
c000453d:	8b 40 78             	mov    0x78(%eax),%eax
c0004540:	83 f8 66             	cmp    $0x66,%eax
c0004543:	75 13                	jne    c0004558 <do_rdwt+0x145>
c0004545:	83 ec 04             	sub    $0x4,%esp
c0004548:	ff 75 b8             	pushl  -0x48(%ebp)
c000454b:	ff 75 08             	pushl  0x8(%ebp)
c000454e:	6a 01                	push   $0x1
c0004550:	e8 2b 61 00 00       	call   c000a680 <send_rec>
c0004555:	83 c4 10             	add    $0x10,%esp
c0004558:	8b 45 08             	mov    0x8(%ebp),%eax
c000455b:	8b 40 78             	mov    0x78(%eax),%eax
c000455e:	83 f8 65             	cmp    $0x65,%eax
c0004561:	75 13                	jne    c0004576 <do_rdwt+0x163>
c0004563:	83 ec 04             	sub    $0x4,%esp
c0004566:	ff 75 b8             	pushl  -0x48(%ebp)
c0004569:	ff 75 08             	pushl  0x8(%ebp)
c000456c:	6a 01                	push   $0x1
c000456e:	e8 0d 61 00 00       	call   c000a680 <send_rec>
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
c0004669:	e8 f1 29 00 00       	call   c000705f <alloc_virtual_memory>
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
c00046db:	e8 8f 36 00 00       	call   c0007d6f <Memcpy>
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
c0004702:	e8 68 36 00 00       	call   c0007d6f <Memcpy>
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
c00048c6:	e8 a4 34 00 00       	call   c0007d6f <Memcpy>
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
c0004907:	68 44 b8 00 c0       	push   $0xc000b844
c000490c:	68 44 b8 00 c0       	push   $0xc000b844
c0004911:	68 1c ba 00 c0       	push   $0xc000ba1c
c0004916:	e8 39 54 00 00       	call   c0009d54 <assertion_failure>
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
c0004a5c:	e8 d6 68 00 00       	call   c000b337 <insertToDoubleLinkList>
c0004a61:	83 c4 10             	add    $0x10,%esp
c0004a64:	83 ec 0c             	sub    $0xc,%esp
c0004a67:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a6c:	e8 e2 66 00 00       	call   c000b153 <isListEmpty>
c0004a71:	83 c4 10             	add    $0x10,%esp
c0004a74:	84 c0                	test   %al,%al
c0004a76:	74 19                	je     c0004a91 <schedule_process+0x80>
c0004a78:	6a 28                	push   $0x28
c0004a7a:	68 2b ba 00 c0       	push   $0xc000ba2b
c0004a7f:	68 2b ba 00 c0       	push   $0xc000ba2b
c0004a84:	68 35 ba 00 c0       	push   $0xc000ba35
c0004a89:	e8 c6 52 00 00       	call   c0009d54 <assertion_failure>
c0004a8e:	83 c4 10             	add    $0x10,%esp
c0004a91:	83 ec 0c             	sub    $0xc,%esp
c0004a94:	68 ec 0d 01 c0       	push   $0xc0010dec
c0004a99:	e8 1c 69 00 00       	call   c000b3ba <popFromDoubleLinkList>
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
c0004b0b:	e8 00 66 00 00       	call   c000b110 <switch_to>
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
c0004b32:	e8 e4 5d 00 00       	call   c000a91b <inform_int>
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
c0004da8:	e8 de 76 00 00       	call   c000c48b <Memset>
c0004dad:	83 c4 10             	add    $0x10,%esp
c0004db0:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004db7:	83 ec 04             	sub    $0x4,%esp
c0004dba:	ff 75 f4             	pushl  -0xc(%ebp)
c0004dbd:	6a 00                	push   $0x0
c0004dbf:	68 40 16 01 c0       	push   $0xc0011640
c0004dc4:	e8 c2 76 00 00       	call   c000c48b <Memset>
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
c0004f44:	e8 14 75 00 00       	call   c000c45d <Memcpy2>
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
c0004fa2:	e8 9f 36 00 00       	call   c0008646 <init_internal_interrupt>
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
c0005205:	e8 01 2b 00 00       	call   c0007d0b <intr_disable>
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
c00053ab:	e8 84 29 00 00       	call   c0007d34 <intr_set_status>
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
c00054b8:	e8 b2 28 00 00       	call   c0007d6f <Memcpy>
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
c000559d:	c7 45 ec 7c 00 00 00 	movl   $0x7c,-0x14(%ebp)
c00055a4:	83 ec 0c             	sub    $0xc,%esp
c00055a7:	ff 75 ec             	pushl  -0x14(%ebp)
c00055aa:	e8 f5 d3 ff ff       	call   c00029a4 <sys_malloc>
c00055af:	83 c4 10             	add    $0x10,%esp
c00055b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00055b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055b8:	c7 40 78 66 00 00 00 	movl   $0x66,0x78(%eax)
c00055bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00055c2:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055cb:	89 50 60             	mov    %edx,0x60(%eax)
c00055ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00055d1:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c00055d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00055da:	89 50 68             	mov    %edx,0x68(%eax)
c00055dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00055e0:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00055e6:	83 ec 04             	sub    $0x4,%esp
c00055e9:	50                   	push   %eax
c00055ea:	ff 75 e8             	pushl  -0x18(%ebp)
c00055ed:	6a 01                	push   $0x1
c00055ef:	e8 8c 50 00 00       	call   c000a680 <send_rec>
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
c0005612:	8b 50 68             	mov    0x68(%eax),%edx
c0005615:	8b 45 08             	mov    0x8(%ebp),%eax
c0005618:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c000561e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005621:	8b 00                	mov    (%eax),%eax
c0005623:	89 c2                	mov    %eax,%edx
c0005625:	8b 45 08             	mov    0x8(%ebp),%eax
c0005628:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c000562e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005631:	8b 50 60             	mov    0x60(%eax),%edx
c0005634:	8b 45 08             	mov    0x8(%ebp),%eax
c0005637:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000563d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005640:	8b 50 60             	mov    0x60(%eax),%edx
c0005643:	8b 45 08             	mov    0x8(%ebp),%eax
c0005646:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c000564c:	8b 45 08             	mov    0x8(%ebp),%eax
c000564f:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c0005655:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005658:	8b 40 10             	mov    0x10(%eax),%eax
c000565b:	83 ec 08             	sub    $0x8,%esp
c000565e:	52                   	push   %edx
c000565f:	50                   	push   %eax
c0005660:	e8 fa 19 00 00       	call   c000705f <alloc_virtual_memory>
c0005665:	83 c4 10             	add    $0x10,%esp
c0005668:	89 c2                	mov    %eax,%edx
c000566a:	8b 45 08             	mov    0x8(%ebp),%eax
c000566d:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0005673:	8b 45 08             	mov    0x8(%ebp),%eax
c0005676:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000567c:	83 f8 02             	cmp    $0x2,%eax
c000567f:	74 1c                	je     c000569d <tty_do_read+0xa1>
c0005681:	68 39 01 00 00       	push   $0x139
c0005686:	68 51 ba 00 c0       	push   $0xc000ba51
c000568b:	68 51 ba 00 c0       	push   $0xc000ba51
c0005690:	68 5b ba 00 c0       	push   $0xc000ba5b
c0005695:	e8 ba 46 00 00       	call   c0009d54 <assertion_failure>
c000569a:	83 c4 10             	add    $0x10,%esp
c000569d:	8b 45 0c             	mov    0xc(%ebp),%eax
c00056a0:	c7 40 78 67 00 00 00 	movl   $0x67,0x78(%eax)
c00056a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00056aa:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00056b0:	83 ec 04             	sub    $0x4,%esp
c00056b3:	50                   	push   %eax
c00056b4:	ff 75 0c             	pushl  0xc(%ebp)
c00056b7:	6a 01                	push   $0x1
c00056b9:	e8 c2 4f 00 00       	call   c000a680 <send_rec>
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
c000570f:	e8 77 6d 00 00       	call   c000c48b <Memset>
c0005714:	83 c4 10             	add    $0x10,%esp
c0005717:	8b 45 0c             	mov    0xc(%ebp),%eax
c000571a:	8b 40 60             	mov    0x60(%eax),%eax
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
c000573b:	e8 1f 19 00 00       	call   c000705f <alloc_virtual_memory>
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
c000576d:	e8 fd 25 00 00       	call   c0007d6f <Memcpy>
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
c00057d3:	6a 7c                	push   $0x7c
c00057d5:	e8 ca d1 ff ff       	call   c00029a4 <sys_malloc>
c00057da:	83 c4 10             	add    $0x10,%esp
c00057dd:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00057e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00057e3:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c00057ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00057ed:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00057f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00057f6:	89 50 58             	mov    %edx,0x58(%eax)
c00057f9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00057fc:	8b 00                	mov    (%eax),%eax
c00057fe:	83 ec 04             	sub    $0x4,%esp
c0005801:	50                   	push   %eax
c0005802:	ff 75 d8             	pushl  -0x28(%ebp)
c0005805:	6a 01                	push   $0x1
c0005807:	e8 74 4e 00 00       	call   c000a680 <send_rec>
c000580c:	83 c4 10             	add    $0x10,%esp
c000580f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005812:	83 ec 08             	sub    $0x8,%esp
c0005815:	6a 7c                	push   $0x7c
c0005817:	50                   	push   %eax
c0005818:	e8 b1 1e 00 00       	call   c00076ce <sys_free>
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
c00058d0:	e8 b6 6b 00 00       	call   c000c48b <Memset>
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
c000598f:	6a 7c                	push   $0x7c
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
c00059e9:	e8 92 4c 00 00       	call   c000a680 <send_rec>
c00059ee:	83 c4 10             	add    $0x10,%esp
c00059f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00059f4:	8b 40 78             	mov    0x78(%eax),%eax
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
c0005cf7:	e8 8f 67 00 00       	call   c000c48b <Memset>
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
c0005e81:	6a 7c                	push   $0x7c
c0005e83:	e8 1c cb ff ff       	call   c00029a4 <sys_malloc>
c0005e88:	83 c4 10             	add    $0x10,%esp
c0005e8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005e8e:	83 ec 04             	sub    $0x4,%esp
c0005e91:	6a 7c                	push   $0x7c
c0005e93:	6a 00                	push   $0x0
c0005e95:	ff 75 f4             	pushl  -0xc(%ebp)
c0005e98:	e8 ee 65 00 00       	call   c000c48b <Memset>
c0005e9d:	83 c4 10             	add    $0x10,%esp
c0005ea0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ea3:	c7 40 78 06 00 00 00 	movl   $0x6,0x78(%eax)
c0005eaa:	83 ec 0c             	sub    $0xc,%esp
c0005ead:	ff 75 08             	pushl  0x8(%ebp)
c0005eb0:	e8 71 12 00 00       	call   c0007126 <get_physical_address>
c0005eb5:	83 c4 10             	add    $0x10,%esp
c0005eb8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005ebb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ebe:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005ec1:	89 50 44             	mov    %edx,0x44(%eax)
c0005ec4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005ec7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005eca:	89 50 74             	mov    %edx,0x74(%eax)
c0005ecd:	83 ec 0c             	sub    $0xc,%esp
c0005ed0:	ff 75 08             	pushl  0x8(%ebp)
c0005ed3:	e8 ec 65 00 00       	call   c000c4c4 <Strlen>
c0005ed8:	83 c4 10             	add    $0x10,%esp
c0005edb:	89 c2                	mov    %eax,%edx
c0005edd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ee0:	89 50 40             	mov    %edx,0x40(%eax)
c0005ee3:	83 ec 04             	sub    $0x4,%esp
c0005ee6:	6a 02                	push   $0x2
c0005ee8:	ff 75 f4             	pushl  -0xc(%ebp)
c0005eeb:	6a 03                	push   $0x3
c0005eed:	e8 8e 47 00 00       	call   c000a680 <send_rec>
c0005ef2:	83 c4 10             	add    $0x10,%esp
c0005ef5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ef8:	8b 40 50             	mov    0x50(%eax),%eax
c0005efb:	c9                   	leave  
c0005efc:	c3                   	ret    

c0005efd <read>:
c0005efd:	55                   	push   %ebp
c0005efe:	89 e5                	mov    %esp,%ebp
c0005f00:	83 ec 18             	sub    $0x18,%esp
c0005f03:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0005f0a:	83 ec 0c             	sub    $0xc,%esp
c0005f0d:	ff 75 f4             	pushl  -0xc(%ebp)
c0005f10:	e8 8f ca ff ff       	call   c00029a4 <sys_malloc>
c0005f15:	83 c4 10             	add    $0x10,%esp
c0005f18:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f1b:	83 ec 0c             	sub    $0xc,%esp
c0005f1e:	ff 75 0c             	pushl  0xc(%ebp)
c0005f21:	e8 00 12 00 00       	call   c0007126 <get_physical_address>
c0005f26:	83 c4 10             	add    $0x10,%esp
c0005f29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005f2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f2f:	c7 40 78 07 00 00 00 	movl   $0x7,0x78(%eax)
c0005f36:	8b 55 08             	mov    0x8(%ebp),%edx
c0005f39:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f3c:	89 50 50             	mov    %edx,0x50(%eax)
c0005f3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f42:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005f45:	89 50 10             	mov    %edx,0x10(%eax)
c0005f48:	8b 55 10             	mov    0x10(%ebp),%edx
c0005f4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f4e:	89 50 60             	mov    %edx,0x60(%eax)
c0005f51:	83 ec 04             	sub    $0x4,%esp
c0005f54:	6a 02                	push   $0x2
c0005f56:	ff 75 f0             	pushl  -0x10(%ebp)
c0005f59:	6a 03                	push   $0x3
c0005f5b:	e8 20 47 00 00       	call   c000a680 <send_rec>
c0005f60:	83 c4 10             	add    $0x10,%esp
c0005f63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f66:	8b 40 60             	mov    0x60(%eax),%eax
c0005f69:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005f6c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005f6f:	c9                   	leave  
c0005f70:	c3                   	ret    

c0005f71 <write>:
c0005f71:	55                   	push   %ebp
c0005f72:	89 e5                	mov    %esp,%ebp
c0005f74:	83 ec 18             	sub    $0x18,%esp
c0005f77:	c7 45 f4 7c 00 00 00 	movl   $0x7c,-0xc(%ebp)
c0005f7e:	83 ec 0c             	sub    $0xc,%esp
c0005f81:	ff 75 f4             	pushl  -0xc(%ebp)
c0005f84:	e8 1b ca ff ff       	call   c00029a4 <sys_malloc>
c0005f89:	83 c4 10             	add    $0x10,%esp
c0005f8c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f8f:	83 ec 0c             	sub    $0xc,%esp
c0005f92:	ff 75 0c             	pushl  0xc(%ebp)
c0005f95:	e8 8c 11 00 00       	call   c0007126 <get_physical_address>
c0005f9a:	83 c4 10             	add    $0x10,%esp
c0005f9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005fa0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fa3:	c7 40 78 0a 00 00 00 	movl   $0xa,0x78(%eax)
c0005faa:	8b 55 08             	mov    0x8(%ebp),%edx
c0005fad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fb0:	89 50 50             	mov    %edx,0x50(%eax)
c0005fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fb6:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005fb9:	89 50 10             	mov    %edx,0x10(%eax)
c0005fbc:	8b 55 10             	mov    0x10(%ebp),%edx
c0005fbf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fc2:	89 50 60             	mov    %edx,0x60(%eax)
c0005fc5:	83 ec 04             	sub    $0x4,%esp
c0005fc8:	6a 02                	push   $0x2
c0005fca:	ff 75 f0             	pushl  -0x10(%ebp)
c0005fcd:	6a 03                	push   $0x3
c0005fcf:	e8 ac 46 00 00       	call   c000a680 <send_rec>
c0005fd4:	83 c4 10             	add    $0x10,%esp
c0005fd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fda:	8b 40 60             	mov    0x60(%eax),%eax
c0005fdd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005fe0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005fe3:	c9                   	leave  
c0005fe4:	c3                   	ret    

c0005fe5 <close>:
c0005fe5:	55                   	push   %ebp
c0005fe6:	89 e5                	mov    %esp,%ebp
c0005fe8:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0005fee:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005ff5:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ff8:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005ffb:	83 ec 04             	sub    $0x4,%esp
c0005ffe:	6a 02                	push   $0x2
c0006000:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0006006:	50                   	push   %eax
c0006007:	6a 03                	push   $0x3
c0006009:	e8 72 46 00 00       	call   c000a680 <send_rec>
c000600e:	83 c4 10             	add    $0x10,%esp
c0006011:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006014:	83 f8 65             	cmp    $0x65,%eax
c0006017:	74 19                	je     c0006032 <close+0x4d>
c0006019:	6a 13                	push   $0x13
c000601b:	68 73 ba 00 c0       	push   $0xc000ba73
c0006020:	68 73 ba 00 c0       	push   $0xc000ba73
c0006025:	68 7f ba 00 c0       	push   $0xc000ba7f
c000602a:	e8 25 3d 00 00       	call   c0009d54 <assertion_failure>
c000602f:	83 c4 10             	add    $0x10,%esp
c0006032:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006035:	c9                   	leave  
c0006036:	c3                   	ret    

c0006037 <wait>:
c0006037:	55                   	push   %ebp
c0006038:	89 e5                	mov    %esp,%ebp
c000603a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006040:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0006047:	83 ec 04             	sub    $0x4,%esp
c000604a:	6a 01                	push   $0x1
c000604c:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0006052:	50                   	push   %eax
c0006053:	6a 03                	push   $0x3
c0006055:	e8 26 46 00 00       	call   c000a680 <send_rec>
c000605a:	83 c4 10             	add    $0x10,%esp
c000605d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006060:	89 c2                	mov    %eax,%edx
c0006062:	8b 45 08             	mov    0x8(%ebp),%eax
c0006065:	89 10                	mov    %edx,(%eax)
c0006067:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000606a:	83 f8 21             	cmp    $0x21,%eax
c000606d:	74 05                	je     c0006074 <wait+0x3d>
c000606f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006072:	eb 05                	jmp    c0006079 <wait+0x42>
c0006074:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006079:	c9                   	leave  
c000607a:	c3                   	ret    

c000607b <exit>:
c000607b:	55                   	push   %ebp
c000607c:	89 e5                	mov    %esp,%ebp
c000607e:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006084:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c000608b:	8b 45 08             	mov    0x8(%ebp),%eax
c000608e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006091:	83 ec 04             	sub    $0x4,%esp
c0006094:	6a 01                	push   $0x1
c0006096:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c000609c:	50                   	push   %eax
c000609d:	6a 03                	push   $0x3
c000609f:	e8 dc 45 00 00       	call   c000a680 <send_rec>
c00060a4:	83 c4 10             	add    $0x10,%esp
c00060a7:	90                   	nop
c00060a8:	c9                   	leave  
c00060a9:	c3                   	ret    

c00060aa <fork>:
c00060aa:	55                   	push   %ebp
c00060ab:	89 e5                	mov    %esp,%ebp
c00060ad:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00060b3:	83 ec 04             	sub    $0x4,%esp
c00060b6:	6a 7c                	push   $0x7c
c00060b8:	6a 00                	push   $0x0
c00060ba:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c00060c0:	50                   	push   %eax
c00060c1:	e8 c5 63 00 00       	call   c000c48b <Memset>
c00060c6:	83 c4 10             	add    $0x10,%esp
c00060c9:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00060d0:	83 ec 04             	sub    $0x4,%esp
c00060d3:	6a 01                	push   $0x1
c00060d5:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c00060db:	50                   	push   %eax
c00060dc:	6a 03                	push   $0x3
c00060de:	e8 9d 45 00 00       	call   c000a680 <send_rec>
c00060e3:	83 c4 10             	add    $0x10,%esp
c00060e6:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00060ed:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00060f0:	85 c0                	test   %eax,%eax
c00060f2:	74 19                	je     c000610d <fork+0x63>
c00060f4:	6a 14                	push   $0x14
c00060f6:	68 97 ba 00 c0       	push   $0xc000ba97
c00060fb:	68 97 ba 00 c0       	push   $0xc000ba97
c0006100:	68 a2 ba 00 c0       	push   $0xc000baa2
c0006105:	e8 4a 3c 00 00       	call   c0009d54 <assertion_failure>
c000610a:	83 c4 10             	add    $0x10,%esp
c000610d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006110:	c9                   	leave  
c0006111:	c3                   	ret    

c0006112 <getpid>:
c0006112:	55                   	push   %ebp
c0006113:	89 e5                	mov    %esp,%ebp
c0006115:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000611b:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0006122:	83 ec 04             	sub    $0x4,%esp
c0006125:	6a 05                	push   $0x5
c0006127:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c000612d:	50                   	push   %eax
c000612e:	6a 03                	push   $0x3
c0006130:	e8 4b 45 00 00       	call   c000a680 <send_rec>
c0006135:	83 c4 10             	add    $0x10,%esp
c0006138:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000613b:	c9                   	leave  
c000613c:	c3                   	ret    

c000613d <exec>:
c000613d:	55                   	push   %ebp
c000613e:	89 e5                	mov    %esp,%ebp
c0006140:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006146:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c000614d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006150:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006153:	83 ec 0c             	sub    $0xc,%esp
c0006156:	ff 75 08             	pushl  0x8(%ebp)
c0006159:	e8 66 63 00 00       	call   c000c4c4 <Strlen>
c000615e:	83 c4 10             	add    $0x10,%esp
c0006161:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006164:	c7 45 8c 00 00 00 00 	movl   $0x0,-0x74(%ebp)
c000616b:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%ebp)
c0006172:	83 ec 04             	sub    $0x4,%esp
c0006175:	6a 01                	push   $0x1
c0006177:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c000617d:	50                   	push   %eax
c000617e:	6a 03                	push   $0x3
c0006180:	e8 fb 44 00 00       	call   c000a680 <send_rec>
c0006185:	83 c4 10             	add    $0x10,%esp
c0006188:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000618b:	83 f8 65             	cmp    $0x65,%eax
c000618e:	74 19                	je     c00061a9 <exec+0x6c>
c0006190:	6a 19                	push   $0x19
c0006192:	68 b2 ba 00 c0       	push   $0xc000bab2
c0006197:	68 b2 ba 00 c0       	push   $0xc000bab2
c000619c:	68 bd ba 00 c0       	push   $0xc000babd
c00061a1:	e8 ae 3b 00 00       	call   c0009d54 <assertion_failure>
c00061a6:	83 c4 10             	add    $0x10,%esp
c00061a9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00061ac:	c9                   	leave  
c00061ad:	c3                   	ret    

c00061ae <execv>:
c00061ae:	55                   	push   %ebp
c00061af:	89 e5                	mov    %esp,%ebp
c00061b1:	57                   	push   %edi
c00061b2:	81 ec d4 04 00 00    	sub    $0x4d4,%esp
c00061b8:	83 ec 04             	sub    $0x4,%esp
c00061bb:	68 00 04 00 00       	push   $0x400
c00061c0:	6a 00                	push   $0x0
c00061c2:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c00061c8:	50                   	push   %eax
c00061c9:	e8 bd 62 00 00       	call   c000c48b <Memset>
c00061ce:	83 c4 10             	add    $0x10,%esp
c00061d1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00061d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00061d7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00061de:	eb 23                	jmp    c0006203 <execv+0x55>
c00061e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061e3:	8b 00                	mov    (%eax),%eax
c00061e5:	83 ec 08             	sub    $0x8,%esp
c00061e8:	50                   	push   %eax
c00061e9:	68 d5 ba 00 c0       	push   $0xc000bad5
c00061ee:	e8 04 38 00 00       	call   c00099f7 <Printf>
c00061f3:	83 c4 10             	add    $0x10,%esp
c00061f6:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c00061fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061fd:	83 c0 04             	add    $0x4,%eax
c0006200:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006203:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006206:	8b 00                	mov    (%eax),%eax
c0006208:	85 c0                	test   %eax,%eax
c000620a:	75 d4                	jne    c00061e0 <execv+0x32>
c000620c:	8d 95 d4 fb ff ff    	lea    -0x42c(%ebp),%edx
c0006212:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006215:	01 d0                	add    %edx,%eax
c0006217:	c6 00 00             	movb   $0x0,(%eax)
c000621a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000621d:	83 c0 04             	add    $0x4,%eax
c0006220:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006223:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c0006229:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000622c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000622f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006232:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006239:	eb 64                	jmp    c000629f <execv+0xf1>
c000623b:	8d 95 d4 fb ff ff    	lea    -0x42c(%ebp),%edx
c0006241:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006244:	01 c2                	add    %eax,%edx
c0006246:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006249:	89 10                	mov    %edx,(%eax)
c000624b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000624e:	8b 00                	mov    (%eax),%eax
c0006250:	8d 8d d4 fb ff ff    	lea    -0x42c(%ebp),%ecx
c0006256:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006259:	01 ca                	add    %ecx,%edx
c000625b:	83 ec 08             	sub    $0x8,%esp
c000625e:	50                   	push   %eax
c000625f:	52                   	push   %edx
c0006260:	e8 45 62 00 00       	call   c000c4aa <Strcpy>
c0006265:	83 c4 10             	add    $0x10,%esp
c0006268:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000626b:	8b 00                	mov    (%eax),%eax
c000626d:	83 ec 0c             	sub    $0xc,%esp
c0006270:	50                   	push   %eax
c0006271:	e8 4e 62 00 00       	call   c000c4c4 <Strlen>
c0006276:	83 c4 10             	add    $0x10,%esp
c0006279:	01 45 f0             	add    %eax,-0x10(%ebp)
c000627c:	8d 95 d4 fb ff ff    	lea    -0x42c(%ebp),%edx
c0006282:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006285:	01 d0                	add    %edx,%eax
c0006287:	c6 00 00             	movb   $0x0,(%eax)
c000628a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000628d:	83 c0 01             	add    $0x1,%eax
c0006290:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006293:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0006297:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000629b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000629f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00062a2:	8b 00                	mov    (%eax),%eax
c00062a4:	85 c0                	test   %eax,%eax
c00062a6:	75 93                	jne    c000623b <execv+0x8d>
c00062a8:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c00062ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00062b1:	eb 04                	jmp    c00062b7 <execv+0x109>
c00062b3:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00062b7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00062ba:	8b 00                	mov    (%eax),%eax
c00062bc:	85 c0                	test   %eax,%eax
c00062be:	75 f3                	jne    c00062b3 <execv+0x105>
c00062c0:	8d 95 30 fb ff ff    	lea    -0x4d0(%ebp),%edx
c00062c6:	b8 00 00 00 00       	mov    $0x0,%eax
c00062cb:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00062d0:	89 d7                	mov    %edx,%edi
c00062d2:	f3 ab                	rep stos %eax,%es:(%edi)
c00062d4:	c7 85 30 fb ff ff df 	movl   $0xc000badf,-0x4d0(%ebp)
c00062db:	ba 00 c0 
c00062de:	c7 85 34 fb ff ff e6 	movl   $0xc000bae6,-0x4cc(%ebp)
c00062e5:	ba 00 c0 
c00062e8:	83 ec 0c             	sub    $0xc,%esp
c00062eb:	ff 75 08             	pushl  0x8(%ebp)
c00062ee:	e8 33 0e 00 00       	call   c0007126 <get_physical_address>
c00062f3:	83 c4 10             	add    $0x10,%esp
c00062f6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00062f9:	83 ec 0c             	sub    $0xc,%esp
c00062fc:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c0006302:	50                   	push   %eax
c0006303:	e8 1e 0e 00 00       	call   c0007126 <get_physical_address>
c0006308:	83 c4 10             	add    $0x10,%esp
c000630b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000630e:	83 ec 0c             	sub    $0xc,%esp
c0006311:	68 00 00 00 c0       	push   $0xc0000000
c0006316:	e8 0b 0e 00 00       	call   c0007126 <get_physical_address>
c000631b:	83 c4 10             	add    $0x10,%esp
c000631e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006321:	c7 85 d0 fb ff ff 02 	movl   $0x2,-0x430(%ebp)
c0006328:	00 00 00 
c000632b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000632e:	89 85 9c fb ff ff    	mov    %eax,-0x464(%ebp)
c0006334:	83 ec 0c             	sub    $0xc,%esp
c0006337:	ff 75 08             	pushl  0x8(%ebp)
c000633a:	e8 85 61 00 00       	call   c000c4c4 <Strlen>
c000633f:	83 c4 10             	add    $0x10,%esp
c0006342:	89 85 98 fb ff ff    	mov    %eax,-0x468(%ebp)
c0006348:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000634b:	89 85 68 fb ff ff    	mov    %eax,-0x498(%ebp)
c0006351:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006354:	89 85 74 fb ff ff    	mov    %eax,-0x48c(%ebp)
c000635a:	8d 85 d4 fb ff ff    	lea    -0x42c(%ebp),%eax
c0006360:	89 85 78 fb ff ff    	mov    %eax,-0x488(%ebp)
c0006366:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006369:	89 85 7c fb ff ff    	mov    %eax,-0x484(%ebp)
c000636f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006372:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0006377:	29 c2                	sub    %eax,%edx
c0006379:	89 d0                	mov    %edx,%eax
c000637b:	89 85 80 fb ff ff    	mov    %eax,-0x480(%ebp)
c0006381:	8d 95 d4 fb ff ff    	lea    -0x42c(%ebp),%edx
c0006387:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000638a:	01 d0                	add    %edx,%eax
c000638c:	ba 00 00 00 c0       	mov    $0xc0000000,%edx
c0006391:	29 c2                	sub    %eax,%edx
c0006393:	89 d0                	mov    %edx,%eax
c0006395:	89 85 84 fb ff ff    	mov    %eax,-0x47c(%ebp)
c000639b:	83 ec 0c             	sub    $0xc,%esp
c000639e:	68 ed ba 00 c0       	push   $0xc000baed
c00063a3:	e8 4f 36 00 00       	call   c00099f7 <Printf>
c00063a8:	83 c4 10             	add    $0x10,%esp
c00063ab:	83 ec 04             	sub    $0x4,%esp
c00063ae:	6a 01                	push   $0x1
c00063b0:	8d 85 58 fb ff ff    	lea    -0x4a8(%ebp),%eax
c00063b6:	50                   	push   %eax
c00063b7:	6a 03                	push   $0x3
c00063b9:	e8 c2 42 00 00       	call   c000a680 <send_rec>
c00063be:	83 c4 10             	add    $0x10,%esp
c00063c1:	83 ec 0c             	sub    $0xc,%esp
c00063c4:	68 fe ba 00 c0       	push   $0xc000bafe
c00063c9:	e8 29 36 00 00       	call   c00099f7 <Printf>
c00063ce:	83 c4 10             	add    $0x10,%esp
c00063d1:	83 ec 0c             	sub    $0xc,%esp
c00063d4:	68 10 bb 00 c0       	push   $0xc000bb10
c00063d9:	e8 19 36 00 00       	call   c00099f7 <Printf>
c00063de:	83 c4 10             	add    $0x10,%esp
c00063e1:	8b 85 d0 fb ff ff    	mov    -0x430(%ebp),%eax
c00063e7:	83 f8 65             	cmp    $0x65,%eax
c00063ea:	74 1c                	je     c0006408 <execv+0x25a>
c00063ec:	68 98 00 00 00       	push   $0x98
c00063f1:	68 b2 ba 00 c0       	push   $0xc000bab2
c00063f6:	68 b2 ba 00 c0       	push   $0xc000bab2
c00063fb:	68 bd ba 00 c0       	push   $0xc000babd
c0006400:	e8 4f 39 00 00       	call   c0009d54 <assertion_failure>
c0006405:	83 c4 10             	add    $0x10,%esp
c0006408:	8b 85 b0 fb ff ff    	mov    -0x450(%ebp),%eax
c000640e:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0006411:	c9                   	leave  
c0006412:	c3                   	ret    

c0006413 <execl>:
c0006413:	55                   	push   %ebp
c0006414:	89 e5                	mov    %esp,%ebp
c0006416:	83 ec 18             	sub    $0x18,%esp
c0006419:	8d 45 0c             	lea    0xc(%ebp),%eax
c000641c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000641f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006422:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006425:	83 ec 08             	sub    $0x8,%esp
c0006428:	ff 75 f0             	pushl  -0x10(%ebp)
c000642b:	ff 75 08             	pushl  0x8(%ebp)
c000642e:	e8 7b fd ff ff       	call   c00061ae <execv>
c0006433:	83 c4 10             	add    $0x10,%esp
c0006436:	c9                   	leave  
c0006437:	c3                   	ret    

c0006438 <TaskMM>:
c0006438:	55                   	push   %ebp
c0006439:	89 e5                	mov    %esp,%ebp
c000643b:	83 ec 28             	sub    $0x28,%esp
c000643e:	83 ec 0c             	sub    $0xc,%esp
c0006441:	6a 7c                	push   $0x7c
c0006443:	e8 5c c5 ff ff       	call   c00029a4 <sys_malloc>
c0006448:	83 c4 10             	add    $0x10,%esp
c000644b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000644e:	83 ec 0c             	sub    $0xc,%esp
c0006451:	6a 7c                	push   $0x7c
c0006453:	e8 4c c5 ff ff       	call   c00029a4 <sys_malloc>
c0006458:	83 c4 10             	add    $0x10,%esp
c000645b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000645e:	83 ec 04             	sub    $0x4,%esp
c0006461:	6a 12                	push   $0x12
c0006463:	ff 75 f0             	pushl  -0x10(%ebp)
c0006466:	6a 02                	push   $0x2
c0006468:	e8 13 42 00 00       	call   c000a680 <send_rec>
c000646d:	83 c4 10             	add    $0x10,%esp
c0006470:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006473:	8b 40 78             	mov    0x78(%eax),%eax
c0006476:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006479:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000647c:	8b 00                	mov    (%eax),%eax
c000647e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006481:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006488:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000648b:	c7 40 78 65 00 00 00 	movl   $0x65,0x78(%eax)
c0006492:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006495:	c7 40 58 00 00 00 00 	movl   $0x0,0x58(%eax)
c000649c:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c00064a0:	74 4e                	je     c00064f0 <TaskMM+0xb8>
c00064a2:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c00064a6:	7f 08                	jg     c00064b0 <TaskMM+0x78>
c00064a8:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c00064ac:	74 28                	je     c00064d6 <TaskMM+0x9e>
c00064ae:	eb 71                	jmp    c0006521 <TaskMM+0xe9>
c00064b0:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c00064b4:	74 08                	je     c00064be <TaskMM+0x86>
c00064b6:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00064ba:	74 4e                	je     c000650a <TaskMM+0xd2>
c00064bc:	eb 63                	jmp    c0006521 <TaskMM+0xe9>
c00064be:	83 ec 0c             	sub    $0xc,%esp
c00064c1:	ff 75 f0             	pushl  -0x10(%ebp)
c00064c4:	e8 a2 04 00 00       	call   c000696b <do_fork>
c00064c9:	83 c4 10             	add    $0x10,%esp
c00064cc:	89 c2                	mov    %eax,%edx
c00064ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00064d1:	89 50 5c             	mov    %edx,0x5c(%eax)
c00064d4:	eb 5c                	jmp    c0006532 <TaskMM+0xfa>
c00064d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00064dd:	66 87 db             	xchg   %bx,%bx
c00064e0:	83 ec 0c             	sub    $0xc,%esp
c00064e3:	ff 75 f0             	pushl  -0x10(%ebp)
c00064e6:	e8 a9 00 00 00       	call   c0006594 <do_exec>
c00064eb:	83 c4 10             	add    $0x10,%esp
c00064ee:	eb 42                	jmp    c0006532 <TaskMM+0xfa>
c00064f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00064f7:	83 ec 08             	sub    $0x8,%esp
c00064fa:	ff 75 e0             	pushl  -0x20(%ebp)
c00064fd:	ff 75 f0             	pushl  -0x10(%ebp)
c0006500:	e8 d4 04 00 00       	call   c00069d9 <do_exit>
c0006505:	83 c4 10             	add    $0x10,%esp
c0006508:	eb 28                	jmp    c0006532 <TaskMM+0xfa>
c000650a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006511:	83 ec 0c             	sub    $0xc,%esp
c0006514:	ff 75 f0             	pushl  -0x10(%ebp)
c0006517:	e8 b9 05 00 00       	call   c0006ad5 <do_wait>
c000651c:	83 c4 10             	add    $0x10,%esp
c000651f:	eb 11                	jmp    c0006532 <TaskMM+0xfa>
c0006521:	83 ec 0c             	sub    $0xc,%esp
c0006524:	68 20 bb 00 c0       	push   $0xc000bb20
c0006529:	e8 08 38 00 00       	call   c0009d36 <panic>
c000652e:	83 c4 10             	add    $0x10,%esp
c0006531:	90                   	nop
c0006532:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006536:	0f 84 22 ff ff ff    	je     c000645e <TaskMM+0x26>
c000653c:	83 ec 0c             	sub    $0xc,%esp
c000653f:	6a 03                	push   $0x3
c0006541:	e8 7d 33 00 00       	call   c00098c3 <delay>
c0006546:	83 c4 10             	add    $0x10,%esp
c0006549:	83 ec 04             	sub    $0x4,%esp
c000654c:	ff 75 e4             	pushl  -0x1c(%ebp)
c000654f:	ff 75 ec             	pushl  -0x14(%ebp)
c0006552:	6a 01                	push   $0x1
c0006554:	e8 27 41 00 00       	call   c000a680 <send_rec>
c0006559:	83 c4 10             	add    $0x10,%esp
c000655c:	e9 fd fe ff ff       	jmp    c000645e <TaskMM+0x26>

c0006561 <alloc_mem>:
c0006561:	55                   	push   %ebp
c0006562:	89 e5                	mov    %esp,%ebp
c0006564:	83 ec 10             	sub    $0x10,%esp
c0006567:	8b 45 08             	mov    0x8(%ebp),%eax
c000656a:	83 e8 08             	sub    $0x8,%eax
c000656d:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0006573:	05 00 00 a0 00       	add    $0xa00000,%eax
c0006578:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000657b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000657e:	c9                   	leave  
c000657f:	c3                   	ret    

c0006580 <do_exec2>:
c0006580:	55                   	push   %ebp
c0006581:	89 e5                	mov    %esp,%ebp
c0006583:	83 ec 10             	sub    $0x10,%esp
c0006586:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c000658d:	b8 00 00 00 00       	mov    $0x0,%eax
c0006592:	c9                   	leave  
c0006593:	c3                   	ret    

c0006594 <do_exec>:
c0006594:	55                   	push   %ebp
c0006595:	89 e5                	mov    %esp,%ebp
c0006597:	81 ec 28 09 00 00    	sub    $0x928,%esp
c000659d:	c7 85 66 ff ff ff 64 	movl   $0x5f766564,-0x9a(%ebp)
c00065a4:	65 76 5f 
c00065a7:	c7 85 6a ff ff ff 74 	movl   $0x31797474,-0x96(%ebp)
c00065ae:	74 79 31 
c00065b1:	66 c7 85 6e ff ff ff 	movw   $0x0,-0x92(%ebp)
c00065b8:	00 00 
c00065ba:	83 ec 08             	sub    $0x8,%esp
c00065bd:	6a 00                	push   $0x0
c00065bf:	8d 85 66 ff ff ff    	lea    -0x9a(%ebp),%eax
c00065c5:	50                   	push   %eax
c00065c6:	e8 ad f8 ff ff       	call   c0005e78 <open>
c00065cb:	83 c4 10             	add    $0x10,%esp
c00065ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00065d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00065d4:	8b 00                	mov    (%eax),%eax
c00065d6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00065d9:	c7 45 c8 90 43 02 00 	movl   $0x24390,-0x38(%ebp)
c00065e0:	83 ec 04             	sub    $0x4,%esp
c00065e3:	6a 0c                	push   $0xc
c00065e5:	6a 00                	push   $0x0
c00065e7:	8d 85 5a fb ff ff    	lea    -0x4a6(%ebp),%eax
c00065ed:	50                   	push   %eax
c00065ee:	e8 98 5e 00 00       	call   c000c48b <Memset>
c00065f3:	83 c4 10             	add    $0x10,%esp
c00065f6:	8b 45 08             	mov    0x8(%ebp),%eax
c00065f9:	8b 40 44             	mov    0x44(%eax),%eax
c00065fc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00065ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0006602:	8b 40 40             	mov    0x40(%eax),%eax
c0006605:	83 ec 08             	sub    $0x8,%esp
c0006608:	50                   	push   %eax
c0006609:	ff 75 c4             	pushl  -0x3c(%ebp)
c000660c:	e8 4e 0a 00 00       	call   c000705f <alloc_virtual_memory>
c0006611:	83 c4 10             	add    $0x10,%esp
c0006614:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006617:	8b 45 08             	mov    0x8(%ebp),%eax
c000661a:	8b 40 40             	mov    0x40(%eax),%eax
c000661d:	89 c2                	mov    %eax,%edx
c000661f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006622:	83 ec 04             	sub    $0x4,%esp
c0006625:	52                   	push   %edx
c0006626:	50                   	push   %eax
c0006627:	8d 85 5a fb ff ff    	lea    -0x4a6(%ebp),%eax
c000662d:	50                   	push   %eax
c000662e:	e8 3c 17 00 00       	call   c0007d6f <Memcpy>
c0006633:	83 c4 10             	add    $0x10,%esp
c0006636:	8b 45 08             	mov    0x8(%ebp),%eax
c0006639:	8b 40 40             	mov    0x40(%eax),%eax
c000663c:	c6 84 05 5a fb ff ff 	movb   $0x0,-0x4a6(%ebp,%eax,1)
c0006643:	00 
c0006644:	83 ec 08             	sub    $0x8,%esp
c0006647:	6a 00                	push   $0x0
c0006649:	8d 85 5a fb ff ff    	lea    -0x4a6(%ebp),%eax
c000664f:	50                   	push   %eax
c0006650:	e8 23 f8 ff ff       	call   c0005e78 <open>
c0006655:	83 c4 10             	add    $0x10,%esp
c0006658:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000665b:	83 7d bc ff          	cmpl   $0xffffffff,-0x44(%ebp)
c000665f:	75 15                	jne    c0006676 <do_exec+0xe2>
c0006661:	83 ec 0c             	sub    $0xc,%esp
c0006664:	68 31 bb 00 c0       	push   $0xc000bb31
c0006669:	e8 89 33 00 00       	call   c00099f7 <Printf>
c000666e:	83 c4 10             	add    $0x10,%esp
c0006671:	e9 f3 02 00 00       	jmp    c0006969 <do_exec+0x3d5>
c0006676:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000667d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006680:	8d 95 66 fb ff ff    	lea    -0x49a(%ebp),%edx
c0006686:	01 d0                	add    %edx,%eax
c0006688:	83 ec 04             	sub    $0x4,%esp
c000668b:	68 00 02 00 00       	push   $0x200
c0006690:	50                   	push   %eax
c0006691:	ff 75 bc             	pushl  -0x44(%ebp)
c0006694:	e8 64 f8 ff ff       	call   c0005efd <read>
c0006699:	83 c4 10             	add    $0x10,%esp
c000669c:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000669f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00066a2:	01 45 f4             	add    %eax,-0xc(%ebp)
c00066a5:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
c00066a9:	74 0b                	je     c00066b6 <do_exec+0x122>
c00066ab:	81 7d f4 ff 03 00 00 	cmpl   $0x3ff,-0xc(%ebp)
c00066b2:	7f 05                	jg     c00066b9 <do_exec+0x125>
c00066b4:	eb c7                	jmp    c000667d <do_exec+0xe9>
c00066b6:	90                   	nop
c00066b7:	eb 01                	jmp    c00066ba <do_exec+0x126>
c00066b9:	90                   	nop
c00066ba:	83 ec 0c             	sub    $0xc,%esp
c00066bd:	ff 75 bc             	pushl  -0x44(%ebp)
c00066c0:	e8 20 f9 ff ff       	call   c0005fe5 <close>
c00066c5:	83 c4 10             	add    $0x10,%esp
c00066c8:	8d 85 66 fb ff ff    	lea    -0x49a(%ebp),%eax
c00066ce:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00066d1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00066d8:	e9 d2 00 00 00       	jmp    c00067af <do_exec+0x21b>
c00066dd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00066e0:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00066e4:	0f b7 d0             	movzwl %ax,%edx
c00066e7:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00066ea:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00066ee:	0f b7 c0             	movzwl %ax,%eax
c00066f1:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00066f5:	01 c2                	add    %eax,%edx
c00066f7:	8d 85 66 fb ff ff    	lea    -0x49a(%ebp),%eax
c00066fd:	01 d0                	add    %edx,%eax
c00066ff:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006702:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006705:	8b 40 10             	mov    0x10(%eax),%eax
c0006708:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000670b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000670e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006713:	c1 e8 0c             	shr    $0xc,%eax
c0006716:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0006719:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000671c:	8b 40 08             	mov    0x8(%eax),%eax
c000671f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006722:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006729:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
c000672d:	74 7b                	je     c00067aa <do_exec+0x216>
c000672f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006736:	eb 41                	jmp    c0006779 <do_exec+0x1e5>
c0006738:	83 ec 08             	sub    $0x8,%esp
c000673b:	ff 75 cc             	pushl  -0x34(%ebp)
c000673e:	ff 75 ec             	pushl  -0x14(%ebp)
c0006741:	e8 12 0a 00 00       	call   c0007158 <alloc_physical_memory_of_proc>
c0006746:	83 c4 10             	add    $0x10,%esp
c0006749:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c000674c:	83 ec 08             	sub    $0x8,%esp
c000674f:	68 00 10 00 00       	push   $0x1000
c0006754:	ff 75 a4             	pushl  -0x5c(%ebp)
c0006757:	e8 03 09 00 00       	call   c000705f <alloc_virtual_memory>
c000675c:	83 c4 10             	add    $0x10,%esp
c000675f:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0006762:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0006766:	75 06                	jne    c000676e <do_exec+0x1da>
c0006768:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000676b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000676e:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0006775:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006779:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000677c:	39 45 a8             	cmp    %eax,-0x58(%ebp)
c000677f:	77 b7                	ja     c0006738 <do_exec+0x1a4>
c0006781:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006784:	8b 40 10             	mov    0x10(%eax),%eax
c0006787:	89 c1                	mov    %eax,%ecx
c0006789:	8b 45 b0             	mov    -0x50(%ebp),%eax
c000678c:	8b 40 04             	mov    0x4(%eax),%eax
c000678f:	8d 95 66 fb ff ff    	lea    -0x49a(%ebp),%edx
c0006795:	01 c2                	add    %eax,%edx
c0006797:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000679a:	83 ec 04             	sub    $0x4,%esp
c000679d:	51                   	push   %ecx
c000679e:	52                   	push   %edx
c000679f:	50                   	push   %eax
c00067a0:	e8 ca 15 00 00       	call   c0007d6f <Memcpy>
c00067a5:	83 c4 10             	add    $0x10,%esp
c00067a8:	eb 01                	jmp    c00067ab <do_exec+0x217>
c00067aa:	90                   	nop
c00067ab:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00067af:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00067b2:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c00067b6:	0f b7 c0             	movzwl %ax,%eax
c00067b9:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00067bc:	0f 8c 1b ff ff ff    	jl     c00066dd <do_exec+0x149>
c00067c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00067c5:	8b 40 10             	mov    0x10(%eax),%eax
c00067c8:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00067cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00067ce:	8b 40 1c             	mov    0x1c(%eax),%eax
c00067d1:	89 45 98             	mov    %eax,-0x68(%ebp)
c00067d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00067d7:	8b 40 24             	mov    0x24(%eax),%eax
c00067da:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00067dd:	83 ec 0c             	sub    $0xc,%esp
c00067e0:	ff 75 cc             	pushl  -0x34(%ebp)
c00067e3:	e8 9e e3 ff ff       	call   c0004b86 <pid2proc>
c00067e8:	83 c4 10             	add    $0x10,%esp
c00067eb:	89 45 90             	mov    %eax,-0x70(%ebp)
c00067ee:	83 ec 08             	sub    $0x8,%esp
c00067f1:	68 00 10 00 00       	push   $0x1000
c00067f6:	ff 75 94             	pushl  -0x6c(%ebp)
c00067f9:	e8 61 08 00 00       	call   c000705f <alloc_virtual_memory>
c00067fe:	83 c4 10             	add    $0x10,%esp
c0006801:	89 45 8c             	mov    %eax,-0x74(%ebp)
c0006804:	8b 45 98             	mov    -0x68(%ebp),%eax
c0006807:	f7 d8                	neg    %eax
c0006809:	01 45 8c             	add    %eax,-0x74(%ebp)
c000680c:	8b 45 08             	mov    0x8(%ebp),%eax
c000680f:	8b 40 10             	mov    0x10(%eax),%eax
c0006812:	89 45 88             	mov    %eax,-0x78(%ebp)
c0006815:	83 ec 08             	sub    $0x8,%esp
c0006818:	ff 75 98             	pushl  -0x68(%ebp)
c000681b:	ff 75 88             	pushl  -0x78(%ebp)
c000681e:	e8 3c 08 00 00       	call   c000705f <alloc_virtual_memory>
c0006823:	83 c4 10             	add    $0x10,%esp
c0006826:	89 45 84             	mov    %eax,-0x7c(%ebp)
c0006829:	8b 45 84             	mov    -0x7c(%ebp),%eax
c000682c:	83 ec 04             	sub    $0x4,%esp
c000682f:	ff 75 98             	pushl  -0x68(%ebp)
c0006832:	50                   	push   %eax
c0006833:	8d 85 5a f7 ff ff    	lea    -0x8a6(%ebp),%eax
c0006839:	50                   	push   %eax
c000683a:	e8 30 15 00 00       	call   c0007d6f <Memcpy>
c000683f:	83 c4 10             	add    $0x10,%esp
c0006842:	8d 85 5a f7 ff ff    	lea    -0x8a6(%ebp),%eax
c0006848:	89 45 80             	mov    %eax,-0x80(%ebp)
c000684b:	8b 45 80             	mov    -0x80(%ebp),%eax
c000684e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006851:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0006858:	eb 08                	jmp    c0006862 <do_exec+0x2ce>
c000685a:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c000685e:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0006862:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006865:	8b 00                	mov    (%eax),%eax
c0006867:	85 c0                	test   %eax,%eax
c0006869:	75 ef                	jne    c000685a <do_exec+0x2c6>
c000686b:	8b 45 08             	mov    0x8(%ebp),%eax
c000686e:	8b 40 2c             	mov    0x2c(%eax),%eax
c0006871:	89 85 7c ff ff ff    	mov    %eax,-0x84(%ebp)
c0006877:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000687e:	8d 85 5a f7 ff ff    	lea    -0x8a6(%ebp),%eax
c0006884:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006887:	eb 1a                	jmp    c00068a3 <do_exec+0x30f>
c0006889:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c000688d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006890:	8b 10                	mov    (%eax),%edx
c0006892:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c0006898:	01 c2                	add    %eax,%edx
c000689a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000689d:	89 10                	mov    %edx,(%eax)
c000689f:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
c00068a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00068a6:	8b 00                	mov    (%eax),%eax
c00068a8:	85 c0                	test   %eax,%eax
c00068aa:	75 dd                	jne    c0006889 <do_exec+0x2f5>
c00068ac:	8b 45 90             	mov    -0x70(%ebp),%eax
c00068af:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00068b4:	89 85 78 ff ff ff    	mov    %eax,-0x88(%ebp)
c00068ba:	83 ec 04             	sub    $0x4,%esp
c00068bd:	ff 75 98             	pushl  -0x68(%ebp)
c00068c0:	8d 85 5a f7 ff ff    	lea    -0x8a6(%ebp),%eax
c00068c6:	50                   	push   %eax
c00068c7:	ff 75 8c             	pushl  -0x74(%ebp)
c00068ca:	e8 a0 14 00 00       	call   c0007d6f <Memcpy>
c00068cf:	83 c4 10             	add    $0x10,%esp
c00068d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00068d5:	8b 40 28             	mov    0x28(%eax),%eax
c00068d8:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%ebp)
c00068de:	8b 45 90             	mov    -0x70(%ebp),%eax
c00068e1:	8b 00                	mov    (%eax),%eax
c00068e3:	89 85 70 ff ff ff    	mov    %eax,-0x90(%ebp)
c00068e9:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c00068ef:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
c00068f5:	89 50 2c             	mov    %edx,0x2c(%eax)
c00068f8:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00068fb:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0006901:	89 50 28             	mov    %edx,0x28(%eax)
c0006904:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006907:	8b 40 18             	mov    0x18(%eax),%eax
c000690a:	89 c2                	mov    %eax,%edx
c000690c:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c0006912:	89 50 30             	mov    %edx,0x30(%eax)
c0006915:	8b 85 70 ff ff ff    	mov    -0x90(%ebp),%eax
c000691b:	8b 95 74 ff ff ff    	mov    -0x8c(%ebp),%edx
c0006921:	89 50 3c             	mov    %edx,0x3c(%eax)
c0006924:	8b 45 90             	mov    -0x70(%ebp),%eax
c0006927:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000692e:	00 00 00 
c0006931:	c7 85 54 f7 ff ff 65 	movl   $0x65,-0x8ac(%ebp)
c0006938:	00 00 00 
c000693b:	c7 85 34 f7 ff ff 00 	movl   $0x0,-0x8cc(%ebp)
c0006942:	00 00 00 
c0006945:	c7 85 38 f7 ff ff 00 	movl   $0x0,-0x8c8(%ebp)
c000694c:	00 00 00 
c000694f:	83 ec 04             	sub    $0x4,%esp
c0006952:	ff 75 cc             	pushl  -0x34(%ebp)
c0006955:	8d 85 dc f6 ff ff    	lea    -0x924(%ebp),%eax
c000695b:	50                   	push   %eax
c000695c:	6a 01                	push   $0x1
c000695e:	e8 1d 3d 00 00       	call   c000a680 <send_rec>
c0006963:	83 c4 10             	add    $0x10,%esp
c0006966:	66 87 db             	xchg   %bx,%bx
c0006969:	c9                   	leave  
c000696a:	c3                   	ret    

c000696b <do_fork>:
c000696b:	55                   	push   %ebp
c000696c:	89 e5                	mov    %esp,%ebp
c000696e:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0006974:	8b 45 08             	mov    0x8(%ebp),%eax
c0006977:	8b 00                	mov    (%eax),%eax
c0006979:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000697c:	83 ec 0c             	sub    $0xc,%esp
c000697f:	ff 75 f4             	pushl  -0xc(%ebp)
c0006982:	e8 69 45 00 00       	call   c000aef0 <fork_process>
c0006987:	83 c4 10             	add    $0x10,%esp
c000698a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000698d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006990:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c0006996:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006999:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000699c:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c00069a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00069a5:	89 50 5c             	mov    %edx,0x5c(%eax)
c00069a8:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00069af:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00069b6:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00069bd:	83 ec 04             	sub    $0x4,%esp
c00069c0:	ff 75 ec             	pushl  -0x14(%ebp)
c00069c3:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c00069c9:	50                   	push   %eax
c00069ca:	6a 01                	push   $0x1
c00069cc:	e8 af 3c 00 00       	call   c000a680 <send_rec>
c00069d1:	83 c4 10             	add    $0x10,%esp
c00069d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069d7:	c9                   	leave  
c00069d8:	c3                   	ret    

c00069d9 <do_exit>:
c00069d9:	55                   	push   %ebp
c00069da:	89 e5                	mov    %esp,%ebp
c00069dc:	83 ec 18             	sub    $0x18,%esp
c00069df:	8b 45 08             	mov    0x8(%ebp),%eax
c00069e2:	8b 00                	mov    (%eax),%eax
c00069e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00069e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00069ea:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c00069f0:	05 00 32 08 c0       	add    $0xc0083200,%eax
c00069f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069fb:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006a01:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006a04:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a07:	8b 40 54             	mov    0x54(%eax),%eax
c0006a0a:	89 c2                	mov    %eax,%edx
c0006a0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a0f:	89 90 68 02 00 00    	mov    %edx,0x268(%eax)
c0006a15:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006a18:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a1e:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006a23:	0f b6 00             	movzbl (%eax),%eax
c0006a26:	3c 04                	cmp    $0x4,%al
c0006a28:	75 21                	jne    c0006a4b <do_exit+0x72>
c0006a2a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006a2d:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a33:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006a38:	c6 00 fb             	movb   $0xfb,(%eax)
c0006a3b:	83 ec 0c             	sub    $0xc,%esp
c0006a3e:	ff 75 ec             	pushl  -0x14(%ebp)
c0006a41:	e8 5c 01 00 00       	call   c0006ba2 <cleanup>
c0006a46:	83 c4 10             	add    $0x10,%esp
c0006a49:	eb 0a                	jmp    c0006a55 <do_exit+0x7c>
c0006a4b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a4e:	c6 80 48 02 00 00 03 	movb   $0x3,0x248(%eax)
c0006a55:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
c0006a5c:	eb 6e                	jmp    c0006acc <do_exit+0xf3>
c0006a5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a61:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a67:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006a6c:	8b 00                	mov    (%eax),%eax
c0006a6e:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006a71:	75 55                	jne    c0006ac8 <do_exit+0xef>
c0006a73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a76:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a7c:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006a81:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c0006a87:	0f b6 05 81 44 08 c0 	movzbl 0xc0084481,%eax
c0006a8e:	3c 04                	cmp    $0x4,%al
c0006a90:	75 36                	jne    c0006ac8 <do_exit+0xef>
c0006a92:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a95:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006a9b:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006aa0:	0f b6 00             	movzbl (%eax),%eax
c0006aa3:	3c 03                	cmp    $0x3,%al
c0006aa5:	75 21                	jne    c0006ac8 <do_exit+0xef>
c0006aa7:	c6 05 81 44 08 c0 fb 	movb   $0xfb,0xc0084481
c0006aae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ab1:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006ab7:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006abc:	83 ec 0c             	sub    $0xc,%esp
c0006abf:	50                   	push   %eax
c0006ac0:	e8 dd 00 00 00       	call   c0006ba2 <cleanup>
c0006ac5:	83 c4 10             	add    $0x10,%esp
c0006ac8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006acc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006ad0:	7e 8c                	jle    c0006a5e <do_exit+0x85>
c0006ad2:	90                   	nop
c0006ad3:	c9                   	leave  
c0006ad4:	c3                   	ret    

c0006ad5 <do_wait>:
c0006ad5:	55                   	push   %ebp
c0006ad6:	89 e5                	mov    %esp,%ebp
c0006ad8:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0006ade:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ae1:	8b 00                	mov    (%eax),%eax
c0006ae3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ae6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006aed:	c7 45 f0 08 00 00 00 	movl   $0x8,-0x10(%ebp)
c0006af4:	eb 5f                	jmp    c0006b55 <do_wait+0x80>
c0006af6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006af9:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006aff:	05 64 34 08 c0       	add    $0xc0083464,%eax
c0006b04:	8b 00                	mov    (%eax),%eax
c0006b06:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006b09:	75 46                	jne    c0006b51 <do_wait+0x7c>
c0006b0b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006b0f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b12:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b18:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006b1d:	0f b6 00             	movzbl (%eax),%eax
c0006b20:	3c 03                	cmp    $0x3,%al
c0006b22:	75 2d                	jne    c0006b51 <do_wait+0x7c>
c0006b24:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b27:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b2d:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006b32:	c6 00 fb             	movb   $0xfb,(%eax)
c0006b35:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b38:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b3e:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0006b43:	83 ec 0c             	sub    $0xc,%esp
c0006b46:	50                   	push   %eax
c0006b47:	e8 56 00 00 00       	call   c0006ba2 <cleanup>
c0006b4c:	83 c4 10             	add    $0x10,%esp
c0006b4f:	eb 4f                	jmp    c0006ba0 <do_wait+0xcb>
c0006b51:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006b55:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006b59:	7e 9b                	jle    c0006af6 <do_wait+0x21>
c0006b5b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006b5f:	74 13                	je     c0006b74 <do_wait+0x9f>
c0006b61:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b64:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0006b6a:	05 49 34 08 c0       	add    $0xc0083449,%eax
c0006b6f:	c6 00 04             	movb   $0x4,(%eax)
c0006b72:	eb 2c                	jmp    c0006ba0 <do_wait+0xcb>
c0006b74:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c0006b7b:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006b82:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006b89:	83 ec 04             	sub    $0x4,%esp
c0006b8c:	ff 75 ec             	pushl  -0x14(%ebp)
c0006b8f:	8d 85 70 ff ff ff    	lea    -0x90(%ebp),%eax
c0006b95:	50                   	push   %eax
c0006b96:	6a 01                	push   $0x1
c0006b98:	e8 e3 3a 00 00       	call   c000a680 <send_rec>
c0006b9d:	83 c4 10             	add    $0x10,%esp
c0006ba0:	c9                   	leave  
c0006ba1:	c3                   	ret    

c0006ba2 <cleanup>:
c0006ba2:	55                   	push   %ebp
c0006ba3:	89 e5                	mov    %esp,%ebp
c0006ba5:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006bab:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0006bb2:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c0006bb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bbc:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006bc2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006bc5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bc8:	8b 80 68 02 00 00    	mov    0x268(%eax),%eax
c0006bce:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006bd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bd4:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c0006bda:	83 ec 04             	sub    $0x4,%esp
c0006bdd:	50                   	push   %eax
c0006bde:	8d 85 7c ff ff ff    	lea    -0x84(%ebp),%eax
c0006be4:	50                   	push   %eax
c0006be5:	6a 01                	push   $0x1
c0006be7:	e8 94 3a 00 00       	call   c000a680 <send_rec>
c0006bec:	83 c4 10             	add    $0x10,%esp
c0006bef:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bf2:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c0006bf9:	90                   	nop
c0006bfa:	c9                   	leave  
c0006bfb:	c3                   	ret    

c0006bfc <init_bitmap>:
c0006bfc:	55                   	push   %ebp
c0006bfd:	89 e5                	mov    %esp,%ebp
c0006bff:	83 ec 08             	sub    $0x8,%esp
c0006c02:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c05:	8b 50 04             	mov    0x4(%eax),%edx
c0006c08:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c0b:	8b 00                	mov    (%eax),%eax
c0006c0d:	83 ec 04             	sub    $0x4,%esp
c0006c10:	52                   	push   %edx
c0006c11:	6a 00                	push   $0x0
c0006c13:	50                   	push   %eax
c0006c14:	e8 72 58 00 00       	call   c000c48b <Memset>
c0006c19:	83 c4 10             	add    $0x10,%esp
c0006c1c:	90                   	nop
c0006c1d:	c9                   	leave  
c0006c1e:	c3                   	ret    

c0006c1f <test_bit_val>:
c0006c1f:	55                   	push   %ebp
c0006c20:	89 e5                	mov    %esp,%ebp
c0006c22:	53                   	push   %ebx
c0006c23:	83 ec 10             	sub    $0x10,%esp
c0006c26:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c29:	8d 50 07             	lea    0x7(%eax),%edx
c0006c2c:	85 c0                	test   %eax,%eax
c0006c2e:	0f 48 c2             	cmovs  %edx,%eax
c0006c31:	c1 f8 03             	sar    $0x3,%eax
c0006c34:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c37:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c3a:	99                   	cltd   
c0006c3b:	c1 ea 1d             	shr    $0x1d,%edx
c0006c3e:	01 d0                	add    %edx,%eax
c0006c40:	83 e0 07             	and    $0x7,%eax
c0006c43:	29 d0                	sub    %edx,%eax
c0006c45:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c48:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c4b:	8b 10                	mov    (%eax),%edx
c0006c4d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c50:	01 d0                	add    %edx,%eax
c0006c52:	0f b6 00             	movzbl (%eax),%eax
c0006c55:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006c58:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006c5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c5f:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006c64:	89 c1                	mov    %eax,%ecx
c0006c66:	d3 e3                	shl    %cl,%ebx
c0006c68:	89 d8                	mov    %ebx,%eax
c0006c6a:	21 c2                	and    %eax,%edx
c0006c6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c6f:	89 c1                	mov    %eax,%ecx
c0006c71:	d3 fa                	sar    %cl,%edx
c0006c73:	89 d0                	mov    %edx,%eax
c0006c75:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c78:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0006c7c:	0f 9f c0             	setg   %al
c0006c7f:	0f b6 c0             	movzbl %al,%eax
c0006c82:	83 c4 10             	add    $0x10,%esp
c0006c85:	5b                   	pop    %ebx
c0006c86:	5d                   	pop    %ebp
c0006c87:	c3                   	ret    

c0006c88 <set_bit_val>:
c0006c88:	55                   	push   %ebp
c0006c89:	89 e5                	mov    %esp,%ebp
c0006c8b:	83 ec 10             	sub    $0x10,%esp
c0006c8e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c91:	8d 50 07             	lea    0x7(%eax),%edx
c0006c94:	85 c0                	test   %eax,%eax
c0006c96:	0f 48 c2             	cmovs  %edx,%eax
c0006c99:	c1 f8 03             	sar    $0x3,%eax
c0006c9c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c9f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ca2:	99                   	cltd   
c0006ca3:	c1 ea 1d             	shr    $0x1d,%edx
c0006ca6:	01 d0                	add    %edx,%eax
c0006ca8:	83 e0 07             	and    $0x7,%eax
c0006cab:	29 d0                	sub    %edx,%eax
c0006cad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006cb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cb3:	8b 10                	mov    (%eax),%edx
c0006cb5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006cb8:	01 d0                	add    %edx,%eax
c0006cba:	0f b6 00             	movzbl (%eax),%eax
c0006cbd:	88 45 ff             	mov    %al,-0x1(%ebp)
c0006cc0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006cc4:	7e 13                	jle    c0006cd9 <set_bit_val+0x51>
c0006cc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006cc9:	ba 01 00 00 00       	mov    $0x1,%edx
c0006cce:	89 c1                	mov    %eax,%ecx
c0006cd0:	d3 e2                	shl    %cl,%edx
c0006cd2:	89 d0                	mov    %edx,%eax
c0006cd4:	08 45 ff             	or     %al,-0x1(%ebp)
c0006cd7:	eb 13                	jmp    c0006cec <set_bit_val+0x64>
c0006cd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006cdc:	ba 01 00 00 00       	mov    $0x1,%edx
c0006ce1:	89 c1                	mov    %eax,%ecx
c0006ce3:	d3 e2                	shl    %cl,%edx
c0006ce5:	89 d0                	mov    %edx,%eax
c0006ce7:	f7 d0                	not    %eax
c0006ce9:	20 45 ff             	and    %al,-0x1(%ebp)
c0006cec:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cef:	8b 10                	mov    (%eax),%edx
c0006cf1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006cf4:	01 c2                	add    %eax,%edx
c0006cf6:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006cfa:	88 02                	mov    %al,(%edx)
c0006cfc:	b8 01 00 00 00       	mov    $0x1,%eax
c0006d01:	c9                   	leave  
c0006d02:	c3                   	ret    

c0006d03 <set_bits>:
c0006d03:	55                   	push   %ebp
c0006d04:	89 e5                	mov    %esp,%ebp
c0006d06:	83 ec 10             	sub    $0x10,%esp
c0006d09:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006d10:	eb 1c                	jmp    c0006d2e <set_bits+0x2b>
c0006d12:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d15:	8d 50 01             	lea    0x1(%eax),%edx
c0006d18:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006d1b:	ff 75 10             	pushl  0x10(%ebp)
c0006d1e:	50                   	push   %eax
c0006d1f:	ff 75 08             	pushl  0x8(%ebp)
c0006d22:	e8 61 ff ff ff       	call   c0006c88 <set_bit_val>
c0006d27:	83 c4 0c             	add    $0xc,%esp
c0006d2a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006d2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d31:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006d34:	7c dc                	jl     c0006d12 <set_bits+0xf>
c0006d36:	b8 01 00 00 00       	mov    $0x1,%eax
c0006d3b:	c9                   	leave  
c0006d3c:	c3                   	ret    

c0006d3d <get_first_free_bit>:
c0006d3d:	55                   	push   %ebp
c0006d3e:	89 e5                	mov    %esp,%ebp
c0006d40:	83 ec 10             	sub    $0x10,%esp
c0006d43:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d46:	8b 40 04             	mov    0x4(%eax),%eax
c0006d49:	c1 e0 03             	shl    $0x3,%eax
c0006d4c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d4f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d52:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006d55:	eb 1b                	jmp    c0006d72 <get_first_free_bit+0x35>
c0006d57:	ff 75 fc             	pushl  -0x4(%ebp)
c0006d5a:	ff 75 08             	pushl  0x8(%ebp)
c0006d5d:	e8 bd fe ff ff       	call   c0006c1f <test_bit_val>
c0006d62:	83 c4 08             	add    $0x8,%esp
c0006d65:	85 c0                	test   %eax,%eax
c0006d67:	75 05                	jne    c0006d6e <get_first_free_bit+0x31>
c0006d69:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d6c:	eb 11                	jmp    c0006d7f <get_first_free_bit+0x42>
c0006d6e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006d72:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d75:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006d78:	7c dd                	jl     c0006d57 <get_first_free_bit+0x1a>
c0006d7a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006d7f:	c9                   	leave  
c0006d80:	c3                   	ret    

c0006d81 <get_bits>:
c0006d81:	55                   	push   %ebp
c0006d82:	89 e5                	mov    %esp,%ebp
c0006d84:	83 ec 20             	sub    $0x20,%esp
c0006d87:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006d8e:	ff 75 f0             	pushl  -0x10(%ebp)
c0006d91:	ff 75 08             	pushl  0x8(%ebp)
c0006d94:	e8 a4 ff ff ff       	call   c0006d3d <get_first_free_bit>
c0006d99:	83 c4 08             	add    $0x8,%esp
c0006d9c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006da2:	8b 40 04             	mov    0x4(%eax),%eax
c0006da5:	c1 e0 03             	shl    $0x3,%eax
c0006da8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006dab:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006dae:	83 e8 01             	sub    $0x1,%eax
c0006db1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006db4:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006db8:	75 08                	jne    c0006dc2 <get_bits+0x41>
c0006dba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006dbd:	e9 85 00 00 00       	jmp    c0006e47 <get_bits+0xc6>
c0006dc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006dc5:	83 c0 01             	add    $0x1,%eax
c0006dc8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006dcb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006dce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006dd1:	eb 58                	jmp    c0006e2b <get_bits+0xaa>
c0006dd3:	ff 75 f8             	pushl  -0x8(%ebp)
c0006dd6:	ff 75 08             	pushl  0x8(%ebp)
c0006dd9:	e8 41 fe ff ff       	call   c0006c1f <test_bit_val>
c0006dde:	83 c4 08             	add    $0x8,%esp
c0006de1:	85 c0                	test   %eax,%eax
c0006de3:	75 0a                	jne    c0006def <get_bits+0x6e>
c0006de5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006de9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006ded:	eb 2b                	jmp    c0006e1a <get_bits+0x99>
c0006def:	6a 00                	push   $0x0
c0006df1:	ff 75 08             	pushl  0x8(%ebp)
c0006df4:	e8 44 ff ff ff       	call   c0006d3d <get_first_free_bit>
c0006df9:	83 c4 08             	add    $0x8,%esp
c0006dfc:	83 c0 01             	add    $0x1,%eax
c0006dff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e02:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e05:	83 c0 01             	add    $0x1,%eax
c0006e08:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e0b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e0e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e11:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006e14:	83 e8 01             	sub    $0x1,%eax
c0006e17:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e1d:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006e20:	7c 09                	jl     c0006e2b <get_bits+0xaa>
c0006e22:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006e29:	eb 0d                	jmp    c0006e38 <get_bits+0xb7>
c0006e2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e2e:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006e31:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006e34:	85 c0                	test   %eax,%eax
c0006e36:	7f 9b                	jg     c0006dd3 <get_bits+0x52>
c0006e38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006e3b:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006e3e:	83 c0 01             	add    $0x1,%eax
c0006e41:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e44:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e47:	c9                   	leave  
c0006e48:	c3                   	ret    

c0006e49 <get_a_page2>:
c0006e49:	55                   	push   %ebp
c0006e4a:	89 e5                	mov    %esp,%ebp
c0006e4c:	83 ec 18             	sub    $0x18,%esp
c0006e4f:	83 ec 0c             	sub    $0xc,%esp
c0006e52:	ff 75 0c             	pushl  0xc(%ebp)
c0006e55:	e8 1e 00 00 00       	call   c0006e78 <get_a_page>
c0006e5a:	83 c4 10             	add    $0x10,%esp
c0006e5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e60:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006e63:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e66:	83 ec 08             	sub    $0x8,%esp
c0006e69:	52                   	push   %edx
c0006e6a:	50                   	push   %eax
c0006e6b:	e8 61 01 00 00       	call   c0006fd1 <add_map_entry>
c0006e70:	83 c4 10             	add    $0x10,%esp
c0006e73:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e76:	c9                   	leave  
c0006e77:	c3                   	ret    

c0006e78 <get_a_page>:
c0006e78:	55                   	push   %ebp
c0006e79:	89 e5                	mov    %esp,%ebp
c0006e7b:	83 ec 20             	sub    $0x20,%esp
c0006e7e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006e82:	75 22                	jne    c0006ea6 <get_a_page+0x2e>
c0006e84:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0006e89:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e8c:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0006e91:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e94:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0006e99:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e9c:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0006ea1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ea4:	eb 20                	jmp    c0006ec6 <get_a_page+0x4e>
c0006ea6:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0006eab:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006eae:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0006eb3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006eb6:	a1 fc 1e 01 c0       	mov    0xc0011efc,%eax
c0006ebb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ebe:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0006ec3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ec6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ec9:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006ecc:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006ecf:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006ed2:	6a 01                	push   $0x1
c0006ed4:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006ed7:	50                   	push   %eax
c0006ed8:	e8 a4 fe ff ff       	call   c0006d81 <get_bits>
c0006edd:	83 c4 08             	add    $0x8,%esp
c0006ee0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ee3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006ee6:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006ee9:	c1 e2 0c             	shl    $0xc,%edx
c0006eec:	01 d0                	add    %edx,%eax
c0006eee:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006ef1:	6a 01                	push   $0x1
c0006ef3:	ff 75 fc             	pushl  -0x4(%ebp)
c0006ef6:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006ef9:	50                   	push   %eax
c0006efa:	e8 89 fd ff ff       	call   c0006c88 <set_bit_val>
c0006eff:	83 c4 0c             	add    $0xc,%esp
c0006f02:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006f05:	c9                   	leave  
c0006f06:	c3                   	ret    

c0006f07 <get_virtual_address>:
c0006f07:	55                   	push   %ebp
c0006f08:	89 e5                	mov    %esp,%ebp
c0006f0a:	83 ec 28             	sub    $0x28,%esp
c0006f0d:	e8 85 a9 ff ff       	call   c0001897 <get_running_thread_pcb>
c0006f12:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f15:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006f19:	75 1a                	jne    c0006f35 <get_virtual_address+0x2e>
c0006f1b:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0006f20:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006f23:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0006f28:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006f2b:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0006f30:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f33:	eb 18                	jmp    c0006f4d <get_virtual_address+0x46>
c0006f35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006f38:	8b 40 0c             	mov    0xc(%eax),%eax
c0006f3b:	83 ec 04             	sub    $0x4,%esp
c0006f3e:	6a 0c                	push   $0xc
c0006f40:	50                   	push   %eax
c0006f41:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006f44:	50                   	push   %eax
c0006f45:	e8 25 0e 00 00       	call   c0007d6f <Memcpy>
c0006f4a:	83 c4 10             	add    $0x10,%esp
c0006f4d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006f50:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006f53:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006f56:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006f59:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f5c:	83 ec 08             	sub    $0x8,%esp
c0006f5f:	50                   	push   %eax
c0006f60:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006f63:	50                   	push   %eax
c0006f64:	e8 18 fe ff ff       	call   c0006d81 <get_bits>
c0006f69:	83 c4 10             	add    $0x10,%esp
c0006f6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006f6f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006f72:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006f75:	c1 e2 0c             	shl    $0xc,%edx
c0006f78:	01 d0                	add    %edx,%eax
c0006f7a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f80:	50                   	push   %eax
c0006f81:	6a 01                	push   $0x1
c0006f83:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f86:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006f89:	50                   	push   %eax
c0006f8a:	e8 74 fd ff ff       	call   c0006d03 <set_bits>
c0006f8f:	83 c4 10             	add    $0x10,%esp
c0006f92:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f95:	c9                   	leave  
c0006f96:	c3                   	ret    

c0006f97 <ptr_pde>:
c0006f97:	55                   	push   %ebp
c0006f98:	89 e5                	mov    %esp,%ebp
c0006f9a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f9d:	c1 e8 16             	shr    $0x16,%eax
c0006fa0:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006fa5:	c1 e0 02             	shl    $0x2,%eax
c0006fa8:	5d                   	pop    %ebp
c0006fa9:	c3                   	ret    

c0006faa <ptr_pte>:
c0006faa:	55                   	push   %ebp
c0006fab:	89 e5                	mov    %esp,%ebp
c0006fad:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fb0:	c1 e8 0a             	shr    $0xa,%eax
c0006fb3:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006fb8:	89 c2                	mov    %eax,%edx
c0006fba:	8b 45 08             	mov    0x8(%ebp),%eax
c0006fbd:	c1 e8 0c             	shr    $0xc,%eax
c0006fc0:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006fc5:	c1 e0 02             	shl    $0x2,%eax
c0006fc8:	01 d0                	add    %edx,%eax
c0006fca:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006fcf:	5d                   	pop    %ebp
c0006fd0:	c3                   	ret    

c0006fd1 <add_map_entry>:
c0006fd1:	55                   	push   %ebp
c0006fd2:	89 e5                	mov    %esp,%ebp
c0006fd4:	83 ec 18             	sub    $0x18,%esp
c0006fd7:	ff 75 08             	pushl  0x8(%ebp)
c0006fda:	e8 b8 ff ff ff       	call   c0006f97 <ptr_pde>
c0006fdf:	83 c4 04             	add    $0x4,%esp
c0006fe2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006fe5:	ff 75 08             	pushl  0x8(%ebp)
c0006fe8:	e8 bd ff ff ff       	call   c0006faa <ptr_pte>
c0006fed:	83 c4 04             	add    $0x4,%esp
c0006ff0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ff3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006ff6:	8b 00                	mov    (%eax),%eax
c0006ff8:	83 e0 01             	and    $0x1,%eax
c0006ffb:	85 c0                	test   %eax,%eax
c0006ffd:	74 1b                	je     c000701a <add_map_entry+0x49>
c0006fff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007002:	8b 00                	mov    (%eax),%eax
c0007004:	83 e0 01             	and    $0x1,%eax
c0007007:	85 c0                	test   %eax,%eax
c0007009:	75 51                	jne    c000705c <add_map_entry+0x8b>
c000700b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000700e:	83 c8 07             	or     $0x7,%eax
c0007011:	89 c2                	mov    %eax,%edx
c0007013:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007016:	89 10                	mov    %edx,(%eax)
c0007018:	eb 42                	jmp    c000705c <add_map_entry+0x8b>
c000701a:	6a 00                	push   $0x0
c000701c:	e8 57 fe ff ff       	call   c0006e78 <get_a_page>
c0007021:	83 c4 04             	add    $0x4,%esp
c0007024:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007027:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000702a:	83 c8 07             	or     $0x7,%eax
c000702d:	89 c2                	mov    %eax,%edx
c000702f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007032:	89 10                	mov    %edx,(%eax)
c0007034:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007037:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000703c:	83 ec 04             	sub    $0x4,%esp
c000703f:	68 00 10 00 00       	push   $0x1000
c0007044:	6a 00                	push   $0x0
c0007046:	50                   	push   %eax
c0007047:	e8 3f 54 00 00       	call   c000c48b <Memset>
c000704c:	83 c4 10             	add    $0x10,%esp
c000704f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007052:	83 c8 07             	or     $0x7,%eax
c0007055:	89 c2                	mov    %eax,%edx
c0007057:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000705a:	89 10                	mov    %edx,(%eax)
c000705c:	90                   	nop
c000705d:	c9                   	leave  
c000705e:	c3                   	ret    

c000705f <alloc_virtual_memory>:
c000705f:	55                   	push   %ebp
c0007060:	89 e5                	mov    %esp,%ebp
c0007062:	83 ec 28             	sub    $0x28,%esp
c0007065:	8b 45 08             	mov    0x8(%ebp),%eax
c0007068:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000706d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007070:	8b 45 08             	mov    0x8(%ebp),%eax
c0007073:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007076:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007079:	8b 45 0c             	mov    0xc(%ebp),%eax
c000707c:	01 45 e4             	add    %eax,-0x1c(%ebp)
c000707f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007082:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007087:	c1 e8 0c             	shr    $0xc,%eax
c000708a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000708d:	e8 05 a8 ff ff       	call   c0001897 <get_running_thread_pcb>
c0007092:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007095:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007098:	8b 40 08             	mov    0x8(%eax),%eax
c000709b:	85 c0                	test   %eax,%eax
c000709d:	75 09                	jne    c00070a8 <alloc_virtual_memory+0x49>
c000709f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00070a6:	eb 07                	jmp    c00070af <alloc_virtual_memory+0x50>
c00070a8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00070af:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00070b6:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00070bd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00070c4:	eb 47                	jmp    c000710d <alloc_virtual_memory+0xae>
c00070c6:	83 ec 08             	sub    $0x8,%esp
c00070c9:	ff 75 f0             	pushl  -0x10(%ebp)
c00070cc:	6a 01                	push   $0x1
c00070ce:	e8 34 fe ff ff       	call   c0006f07 <get_virtual_address>
c00070d3:	83 c4 10             	add    $0x10,%esp
c00070d6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00070d9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00070dd:	74 13                	je     c00070f2 <alloc_virtual_memory+0x93>
c00070df:	83 ec 0c             	sub    $0xc,%esp
c00070e2:	ff 75 f0             	pushl  -0x10(%ebp)
c00070e5:	e8 8e fd ff ff       	call   c0006e78 <get_a_page>
c00070ea:	83 c4 10             	add    $0x10,%esp
c00070ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070f0:	eb 06                	jmp    c00070f8 <alloc_virtual_memory+0x99>
c00070f2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00070f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00070f8:	83 ec 08             	sub    $0x8,%esp
c00070fb:	ff 75 f4             	pushl  -0xc(%ebp)
c00070fe:	ff 75 d8             	pushl  -0x28(%ebp)
c0007101:	e8 cb fe ff ff       	call   c0006fd1 <add_map_entry>
c0007106:	83 c4 10             	add    $0x10,%esp
c0007109:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000710d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007110:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0007113:	72 b1                	jb     c00070c6 <alloc_virtual_memory+0x67>
c0007115:	8b 45 08             	mov    0x8(%ebp),%eax
c0007118:	25 ff 0f 00 00       	and    $0xfff,%eax
c000711d:	89 c2                	mov    %eax,%edx
c000711f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007122:	01 d0                	add    %edx,%eax
c0007124:	c9                   	leave  
c0007125:	c3                   	ret    

c0007126 <get_physical_address>:
c0007126:	55                   	push   %ebp
c0007127:	89 e5                	mov    %esp,%ebp
c0007129:	83 ec 10             	sub    $0x10,%esp
c000712c:	ff 75 08             	pushl  0x8(%ebp)
c000712f:	e8 76 fe ff ff       	call   c0006faa <ptr_pte>
c0007134:	83 c4 04             	add    $0x4,%esp
c0007137:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000713a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000713d:	8b 00                	mov    (%eax),%eax
c000713f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007144:	89 c2                	mov    %eax,%edx
c0007146:	8b 45 08             	mov    0x8(%ebp),%eax
c0007149:	25 ff 0f 00 00       	and    $0xfff,%eax
c000714e:	09 d0                	or     %edx,%eax
c0007150:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007153:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0007156:	c9                   	leave  
c0007157:	c3                   	ret    

c0007158 <alloc_physical_memory_of_proc>:
c0007158:	55                   	push   %ebp
c0007159:	89 e5                	mov    %esp,%ebp
c000715b:	83 ec 38             	sub    $0x38,%esp
c000715e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007161:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0007166:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007169:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007170:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007173:	83 ec 0c             	sub    $0xc,%esp
c0007176:	50                   	push   %eax
c0007177:	e8 0a da ff ff       	call   c0004b86 <pid2proc>
c000717c:	83 c4 10             	add    $0x10,%esp
c000717f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007182:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007185:	8b 40 0c             	mov    0xc(%eax),%eax
c0007188:	83 ec 04             	sub    $0x4,%esp
c000718b:	6a 0c                	push   $0xc
c000718d:	50                   	push   %eax
c000718e:	8d 45 d4             	lea    -0x2c(%ebp),%eax
c0007191:	50                   	push   %eax
c0007192:	e8 d8 0b 00 00       	call   c0007d6f <Memcpy>
c0007197:	83 c4 10             	add    $0x10,%esp
c000719a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000719d:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00071a0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00071a3:	89 55 d0             	mov    %edx,-0x30(%ebp)
c00071a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00071a9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00071ac:	29 c2                	sub    %eax,%edx
c00071ae:	89 d0                	mov    %edx,%eax
c00071b0:	c1 e8 0c             	shr    $0xc,%eax
c00071b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00071b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00071b9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00071bc:	c1 e2 0c             	shl    $0xc,%edx
c00071bf:	01 d0                	add    %edx,%eax
c00071c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00071c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00071c7:	6a 01                	push   $0x1
c00071c9:	6a 01                	push   $0x1
c00071cb:	50                   	push   %eax
c00071cc:	8d 45 cc             	lea    -0x34(%ebp),%eax
c00071cf:	50                   	push   %eax
c00071d0:	e8 2e fb ff ff       	call   c0006d03 <set_bits>
c00071d5:	83 c4 10             	add    $0x10,%esp
c00071d8:	83 ec 0c             	sub    $0xc,%esp
c00071db:	ff 75 f0             	pushl  -0x10(%ebp)
c00071de:	e8 95 fc ff ff       	call   c0006e78 <get_a_page>
c00071e3:	83 c4 10             	add    $0x10,%esp
c00071e6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00071e9:	83 ec 08             	sub    $0x8,%esp
c00071ec:	ff 75 e0             	pushl  -0x20(%ebp)
c00071ef:	ff 75 08             	pushl  0x8(%ebp)
c00071f2:	e8 da fd ff ff       	call   c0006fd1 <add_map_entry>
c00071f7:	83 c4 10             	add    $0x10,%esp
c00071fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00071fd:	c9                   	leave  
c00071fe:	c3                   	ret    

c00071ff <alloc_physical_memory>:
c00071ff:	55                   	push   %ebp
c0007200:	89 e5                	mov    %esp,%ebp
c0007202:	83 ec 38             	sub    $0x38,%esp
c0007205:	8b 45 08             	mov    0x8(%ebp),%eax
c0007208:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000720d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007210:	e8 82 a6 ff ff       	call   c0001897 <get_running_thread_pcb>
c0007215:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007218:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000721c:	75 1a                	jne    c0007238 <alloc_physical_memory+0x39>
c000721e:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007223:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007226:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c000722b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000722e:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007233:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007236:	eb 18                	jmp    c0007250 <alloc_physical_memory+0x51>
c0007238:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000723b:	8b 40 0c             	mov    0xc(%eax),%eax
c000723e:	83 ec 04             	sub    $0x4,%esp
c0007241:	6a 0c                	push   $0xc
c0007243:	50                   	push   %eax
c0007244:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0007247:	50                   	push   %eax
c0007248:	e8 22 0b 00 00       	call   c0007d6f <Memcpy>
c000724d:	83 c4 10             	add    $0x10,%esp
c0007250:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007253:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0007256:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007259:	89 55 d4             	mov    %edx,-0x2c(%ebp)
c000725c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000725f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007262:	29 c2                	sub    %eax,%edx
c0007264:	89 d0                	mov    %edx,%eax
c0007266:	c1 e8 0c             	shr    $0xc,%eax
c0007269:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000726c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000726f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0007272:	c1 e2 0c             	shl    $0xc,%edx
c0007275:	01 d0                	add    %edx,%eax
c0007277:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000727a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000727d:	6a 01                	push   $0x1
c000727f:	6a 01                	push   $0x1
c0007281:	50                   	push   %eax
c0007282:	8d 45 d0             	lea    -0x30(%ebp),%eax
c0007285:	50                   	push   %eax
c0007286:	e8 78 fa ff ff       	call   c0006d03 <set_bits>
c000728b:	83 c4 10             	add    $0x10,%esp
c000728e:	83 ec 0c             	sub    $0xc,%esp
c0007291:	ff 75 0c             	pushl  0xc(%ebp)
c0007294:	e8 df fb ff ff       	call   c0006e78 <get_a_page>
c0007299:	83 c4 10             	add    $0x10,%esp
c000729c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000729f:	83 ec 08             	sub    $0x8,%esp
c00072a2:	ff 75 e4             	pushl  -0x1c(%ebp)
c00072a5:	ff 75 08             	pushl  0x8(%ebp)
c00072a8:	e8 24 fd ff ff       	call   c0006fd1 <add_map_entry>
c00072ad:	83 c4 10             	add    $0x10,%esp
c00072b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00072b3:	c9                   	leave  
c00072b4:	c3                   	ret    

c00072b5 <alloc_memory>:
c00072b5:	55                   	push   %ebp
c00072b6:	89 e5                	mov    %esp,%ebp
c00072b8:	83 ec 18             	sub    $0x18,%esp
c00072bb:	83 ec 08             	sub    $0x8,%esp
c00072be:	ff 75 0c             	pushl  0xc(%ebp)
c00072c1:	ff 75 08             	pushl  0x8(%ebp)
c00072c4:	e8 3e fc ff ff       	call   c0006f07 <get_virtual_address>
c00072c9:	83 c4 10             	add    $0x10,%esp
c00072cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00072cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00072d2:	2d 00 10 00 00       	sub    $0x1000,%eax
c00072d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00072da:	eb 29                	jmp    c0007305 <alloc_memory+0x50>
c00072dc:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c00072e3:	83 ec 0c             	sub    $0xc,%esp
c00072e6:	ff 75 0c             	pushl  0xc(%ebp)
c00072e9:	e8 8a fb ff ff       	call   c0006e78 <get_a_page>
c00072ee:	83 c4 10             	add    $0x10,%esp
c00072f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00072f4:	83 ec 08             	sub    $0x8,%esp
c00072f7:	ff 75 ec             	pushl  -0x14(%ebp)
c00072fa:	ff 75 f4             	pushl  -0xc(%ebp)
c00072fd:	e8 cf fc ff ff       	call   c0006fd1 <add_map_entry>
c0007302:	83 c4 10             	add    $0x10,%esp
c0007305:	8b 45 08             	mov    0x8(%ebp),%eax
c0007308:	8d 50 ff             	lea    -0x1(%eax),%edx
c000730b:	89 55 08             	mov    %edx,0x8(%ebp)
c000730e:	85 c0                	test   %eax,%eax
c0007310:	75 ca                	jne    c00072dc <alloc_memory+0x27>
c0007312:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007315:	c9                   	leave  
c0007316:	c3                   	ret    

c0007317 <get_a_virtual_page>:
c0007317:	55                   	push   %ebp
c0007318:	89 e5                	mov    %esp,%ebp
c000731a:	83 ec 18             	sub    $0x18,%esp
c000731d:	ff 75 08             	pushl  0x8(%ebp)
c0007320:	e8 53 fb ff ff       	call   c0006e78 <get_a_page>
c0007325:	83 c4 04             	add    $0x4,%esp
c0007328:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000732b:	83 ec 08             	sub    $0x8,%esp
c000732e:	ff 75 f4             	pushl  -0xc(%ebp)
c0007331:	ff 75 0c             	pushl  0xc(%ebp)
c0007334:	e8 98 fc ff ff       	call   c0006fd1 <add_map_entry>
c0007339:	83 c4 10             	add    $0x10,%esp
c000733c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000733f:	c9                   	leave  
c0007340:	c3                   	ret    

c0007341 <block2arena>:
c0007341:	55                   	push   %ebp
c0007342:	89 e5                	mov    %esp,%ebp
c0007344:	83 ec 10             	sub    $0x10,%esp
c0007347:	8b 45 08             	mov    0x8(%ebp),%eax
c000734a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000734f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007352:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007355:	c9                   	leave  
c0007356:	c3                   	ret    

c0007357 <sys_malloc2>:
c0007357:	55                   	push   %ebp
c0007358:	89 e5                	mov    %esp,%ebp
c000735a:	83 ec 68             	sub    $0x68,%esp
c000735d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007364:	e8 2e a5 ff ff       	call   c0001897 <get_running_thread_pcb>
c0007369:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000736c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000736f:	8b 40 08             	mov    0x8(%eax),%eax
c0007372:	85 c0                	test   %eax,%eax
c0007374:	75 10                	jne    c0007386 <sys_malloc2+0x2f>
c0007376:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000737d:	c7 45 ec a0 47 08 c0 	movl   $0xc00847a0,-0x14(%ebp)
c0007384:	eb 10                	jmp    c0007396 <sys_malloc2+0x3f>
c0007386:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c000738d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007390:	83 c0 10             	add    $0x10,%eax
c0007393:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007396:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c000739d:	76 50                	jbe    c00073ef <sys_malloc2+0x98>
c000739f:	8b 45 08             	mov    0x8(%ebp),%eax
c00073a2:	05 0b 10 00 00       	add    $0x100b,%eax
c00073a7:	c1 e8 0c             	shr    $0xc,%eax
c00073aa:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00073ad:	83 ec 08             	sub    $0x8,%esp
c00073b0:	ff 75 f0             	pushl  -0x10(%ebp)
c00073b3:	ff 75 d8             	pushl  -0x28(%ebp)
c00073b6:	e8 fa fe ff ff       	call   c00072b5 <alloc_memory>
c00073bb:	83 c4 10             	add    $0x10,%esp
c00073be:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00073c1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00073c4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00073c7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073ca:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00073d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073d3:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c00073da:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073dd:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c00073e1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00073e4:	83 c0 0c             	add    $0xc,%eax
c00073e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00073ea:	e9 f0 01 00 00       	jmp    c00075df <sys_malloc2+0x288>
c00073ef:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00073f6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00073fd:	eb 26                	jmp    c0007425 <sys_malloc2+0xce>
c00073ff:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007402:	89 d0                	mov    %edx,%eax
c0007404:	01 c0                	add    %eax,%eax
c0007406:	01 d0                	add    %edx,%eax
c0007408:	c1 e0 03             	shl    $0x3,%eax
c000740b:	89 c2                	mov    %eax,%edx
c000740d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007410:	01 d0                	add    %edx,%eax
c0007412:	8b 00                	mov    (%eax),%eax
c0007414:	39 45 08             	cmp    %eax,0x8(%ebp)
c0007417:	77 08                	ja     c0007421 <sys_malloc2+0xca>
c0007419:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000741c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000741f:	eb 0a                	jmp    c000742b <sys_malloc2+0xd4>
c0007421:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007425:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0007429:	7e d4                	jle    c00073ff <sys_malloc2+0xa8>
c000742b:	83 ec 08             	sub    $0x8,%esp
c000742e:	ff 75 f0             	pushl  -0x10(%ebp)
c0007431:	6a 01                	push   $0x1
c0007433:	e8 7d fe ff ff       	call   c00072b5 <alloc_memory>
c0007438:	83 c4 10             	add    $0x10,%esp
c000743b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000743e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007441:	89 d0                	mov    %edx,%eax
c0007443:	01 c0                	add    %eax,%eax
c0007445:	01 d0                	add    %edx,%eax
c0007447:	c1 e0 03             	shl    $0x3,%eax
c000744a:	89 c2                	mov    %eax,%edx
c000744c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000744f:	01 d0                	add    %edx,%eax
c0007451:	83 ec 04             	sub    $0x4,%esp
c0007454:	6a 18                	push   $0x18
c0007456:	50                   	push   %eax
c0007457:	ff 75 cc             	pushl  -0x34(%ebp)
c000745a:	e8 10 09 00 00       	call   c0007d6f <Memcpy>
c000745f:	83 c4 10             	add    $0x10,%esp
c0007462:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0007469:	e8 9d 08 00 00       	call   c0007d0b <intr_disable>
c000746e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007471:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007474:	89 d0                	mov    %edx,%eax
c0007476:	01 c0                	add    %eax,%eax
c0007478:	01 d0                	add    %edx,%eax
c000747a:	c1 e0 03             	shl    $0x3,%eax
c000747d:	89 c2                	mov    %eax,%edx
c000747f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007482:	01 d0                	add    %edx,%eax
c0007484:	83 c0 08             	add    $0x8,%eax
c0007487:	83 ec 0c             	sub    $0xc,%esp
c000748a:	50                   	push   %eax
c000748b:	e8 c3 3c 00 00       	call   c000b153 <isListEmpty>
c0007490:	83 c4 10             	add    $0x10,%esp
c0007493:	3c 01                	cmp    $0x1,%al
c0007495:	0f 85 c1 00 00 00    	jne    c000755c <sys_malloc2+0x205>
c000749b:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
c00074a2:	83 ec 08             	sub    $0x8,%esp
c00074a5:	ff 75 f0             	pushl  -0x10(%ebp)
c00074a8:	6a 01                	push   $0x1
c00074aa:	e8 06 fe ff ff       	call   c00072b5 <alloc_memory>
c00074af:	83 c4 10             	add    $0x10,%esp
c00074b2:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00074b5:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00074b8:	83 ec 0c             	sub    $0xc,%esp
c00074bb:	50                   	push   %eax
c00074bc:	e8 80 fe ff ff       	call   c0007341 <block2arena>
c00074c1:	83 c4 10             	add    $0x10,%esp
c00074c4:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00074c7:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00074ca:	89 d0                	mov    %edx,%eax
c00074cc:	01 c0                	add    %eax,%eax
c00074ce:	01 d0                	add    %edx,%eax
c00074d0:	c1 e0 03             	shl    $0x3,%eax
c00074d3:	89 c2                	mov    %eax,%edx
c00074d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074d8:	01 d0                	add    %edx,%eax
c00074da:	8b 50 04             	mov    0x4(%eax),%edx
c00074dd:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00074e0:	89 50 04             	mov    %edx,0x4(%eax)
c00074e3:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00074e6:	8b 00                	mov    (%eax),%eax
c00074e8:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00074eb:	c7 45 b4 0c 00 00 00 	movl   $0xc,-0x4c(%ebp)
c00074f2:	b8 00 10 00 00       	mov    $0x1000,%eax
c00074f7:	2b 45 b4             	sub    -0x4c(%ebp),%eax
c00074fa:	ba 00 00 00 00       	mov    $0x0,%edx
c00074ff:	f7 75 b8             	divl   -0x48(%ebp)
c0007502:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0007505:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0007508:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c000750b:	01 d0                	add    %edx,%eax
c000750d:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0007510:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007517:	eb 3b                	jmp    c0007554 <sys_malloc2+0x1fd>
c0007519:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000751c:	0f af 45 b8          	imul   -0x48(%ebp),%eax
c0007520:	89 c2                	mov    %eax,%edx
c0007522:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0007525:	01 d0                	add    %edx,%eax
c0007527:	89 45 a8             	mov    %eax,-0x58(%ebp)
c000752a:	8b 4d a8             	mov    -0x58(%ebp),%ecx
c000752d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007530:	89 d0                	mov    %edx,%eax
c0007532:	01 c0                	add    %eax,%eax
c0007534:	01 d0                	add    %edx,%eax
c0007536:	c1 e0 03             	shl    $0x3,%eax
c0007539:	89 c2                	mov    %eax,%edx
c000753b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000753e:	01 d0                	add    %edx,%eax
c0007540:	83 c0 08             	add    $0x8,%eax
c0007543:	83 ec 08             	sub    $0x8,%esp
c0007546:	51                   	push   %ecx
c0007547:	50                   	push   %eax
c0007548:	e8 03 3d 00 00       	call   c000b250 <appendToDoubleLinkList>
c000754d:	83 c4 10             	add    $0x10,%esp
c0007550:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007554:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007557:	39 45 b0             	cmp    %eax,-0x50(%ebp)
c000755a:	77 bd                	ja     c0007519 <sys_malloc2+0x1c2>
c000755c:	83 ec 0c             	sub    $0xc,%esp
c000755f:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007562:	e8 cd 07 00 00       	call   c0007d34 <intr_set_status>
c0007567:	83 c4 10             	add    $0x10,%esp
c000756a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000756d:	89 d0                	mov    %edx,%eax
c000756f:	01 c0                	add    %eax,%eax
c0007571:	01 d0                	add    %edx,%eax
c0007573:	c1 e0 03             	shl    $0x3,%eax
c0007576:	89 c2                	mov    %eax,%edx
c0007578:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000757b:	01 d0                	add    %edx,%eax
c000757d:	83 c0 08             	add    $0x8,%eax
c0007580:	83 ec 0c             	sub    $0xc,%esp
c0007583:	50                   	push   %eax
c0007584:	e8 31 3e 00 00       	call   c000b3ba <popFromDoubleLinkList>
c0007589:	83 c4 10             	add    $0x10,%esp
c000758c:	89 45 a8             	mov    %eax,-0x58(%ebp)
c000758f:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0007592:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007595:	83 7d a8 00          	cmpl   $0x0,-0x58(%ebp)
c0007599:	75 1c                	jne    c00075b7 <sys_malloc2+0x260>
c000759b:	68 c6 01 00 00       	push   $0x1c6
c00075a0:	68 41 bb 00 c0       	push   $0xc000bb41
c00075a5:	68 41 bb 00 c0       	push   $0xc000bb41
c00075aa:	68 4b bb 00 c0       	push   $0xc000bb4b
c00075af:	e8 a0 27 00 00       	call   c0009d54 <assertion_failure>
c00075b4:	83 c4 10             	add    $0x10,%esp
c00075b7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00075ba:	83 ec 0c             	sub    $0xc,%esp
c00075bd:	50                   	push   %eax
c00075be:	e8 7e fd ff ff       	call   c0007341 <block2arena>
c00075c3:	83 c4 10             	add    $0x10,%esp
c00075c6:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00075c9:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00075cc:	8b 40 04             	mov    0x4(%eax),%eax
c00075cf:	8d 50 ff             	lea    -0x1(%eax),%edx
c00075d2:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00075d5:	89 50 04             	mov    %edx,0x4(%eax)
c00075d8:	c7 45 c4 04 00 00 00 	movl   $0x4,-0x3c(%ebp)
c00075df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00075e3:	75 1c                	jne    c0007601 <sys_malloc2+0x2aa>
c00075e5:	68 cd 01 00 00       	push   $0x1cd
c00075ea:	68 41 bb 00 c0       	push   $0xc000bb41
c00075ef:	68 41 bb 00 c0       	push   $0xc000bb41
c00075f4:	68 5d bb 00 c0       	push   $0xc000bb5d
c00075f9:	e8 56 27 00 00       	call   c0009d54 <assertion_failure>
c00075fe:	83 c4 10             	add    $0x10,%esp
c0007601:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007604:	c9                   	leave  
c0007605:	c3                   	ret    

c0007606 <remove_map_entry>:
c0007606:	55                   	push   %ebp
c0007607:	89 e5                	mov    %esp,%ebp
c0007609:	83 ec 10             	sub    $0x10,%esp
c000760c:	ff 75 08             	pushl  0x8(%ebp)
c000760f:	e8 96 f9 ff ff       	call   c0006faa <ptr_pte>
c0007614:	83 c4 04             	add    $0x4,%esp
c0007617:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000761a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000761d:	8b 10                	mov    (%eax),%edx
c000761f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007622:	89 10                	mov    %edx,(%eax)
c0007624:	90                   	nop
c0007625:	c9                   	leave  
c0007626:	c3                   	ret    

c0007627 <free_a_page>:
c0007627:	55                   	push   %ebp
c0007628:	89 e5                	mov    %esp,%ebp
c000762a:	83 ec 20             	sub    $0x20,%esp
c000762d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007631:	75 21                	jne    c0007654 <free_a_page+0x2d>
c0007633:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007638:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000763b:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007640:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007643:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007648:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000764b:	c7 45 fc ac 16 01 c0 	movl   $0xc00116ac,-0x4(%ebp)
c0007652:	eb 1f                	jmp    c0007673 <free_a_page+0x4c>
c0007654:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007659:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000765c:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007661:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007664:	a1 9c 07 01 c0       	mov    0xc001079c,%eax
c0007669:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000766c:	c7 45 fc f4 1e 01 c0 	movl   $0xc0011ef4,-0x4(%ebp)
c0007673:	8b 45 08             	mov    0x8(%ebp),%eax
c0007676:	c1 e8 0c             	shr    $0xc,%eax
c0007679:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000767c:	6a 00                	push   $0x0
c000767e:	ff 75 f8             	pushl  -0x8(%ebp)
c0007681:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0007684:	50                   	push   %eax
c0007685:	e8 fe f5 ff ff       	call   c0006c88 <set_bit_val>
c000768a:	83 c4 0c             	add    $0xc,%esp
c000768d:	ff 75 08             	pushl  0x8(%ebp)
c0007690:	e8 91 fa ff ff       	call   c0007126 <get_physical_address>
c0007695:	83 c4 04             	add    $0x4,%esp
c0007698:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000769b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000769e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00076a4:	85 c0                	test   %eax,%eax
c00076a6:	0f 48 c2             	cmovs  %edx,%eax
c00076a9:	c1 f8 0c             	sar    $0xc,%eax
c00076ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00076af:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00076b2:	6a 00                	push   $0x0
c00076b4:	ff 75 f0             	pushl  -0x10(%ebp)
c00076b7:	50                   	push   %eax
c00076b8:	e8 cb f5 ff ff       	call   c0006c88 <set_bit_val>
c00076bd:	83 c4 0c             	add    $0xc,%esp
c00076c0:	ff 75 08             	pushl  0x8(%ebp)
c00076c3:	e8 3e ff ff ff       	call   c0007606 <remove_map_entry>
c00076c8:	83 c4 04             	add    $0x4,%esp
c00076cb:	90                   	nop
c00076cc:	c9                   	leave  
c00076cd:	c3                   	ret    

c00076ce <sys_free>:
c00076ce:	55                   	push   %ebp
c00076cf:	89 e5                	mov    %esp,%ebp
c00076d1:	83 ec 58             	sub    $0x58,%esp
c00076d4:	e8 be a1 ff ff       	call   c0001897 <get_running_thread_pcb>
c00076d9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00076dc:	e8 2a 06 00 00       	call   c0007d0b <intr_disable>
c00076e1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00076e4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00076e7:	8b 40 08             	mov    0x8(%eax),%eax
c00076ea:	85 c0                	test   %eax,%eax
c00076ec:	75 10                	jne    c00076fe <sys_free+0x30>
c00076ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00076f5:	c7 45 f0 a0 47 08 c0 	movl   $0xc00847a0,-0x10(%ebp)
c00076fc:	eb 10                	jmp    c000770e <sys_free+0x40>
c00076fe:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007705:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007708:	83 c0 10             	add    $0x10,%eax
c000770b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000770e:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c0007715:	76 4d                	jbe    c0007764 <sys_free+0x96>
c0007717:	8b 45 08             	mov    0x8(%ebp),%eax
c000771a:	83 e8 0c             	sub    $0xc,%eax
c000771d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007720:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c0007724:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007727:	05 ff 0f 00 00       	add    $0xfff,%eax
c000772c:	c1 e8 0c             	shr    $0xc,%eax
c000772f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007732:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007739:	eb 1c                	jmp    c0007757 <sys_free+0x89>
c000773b:	83 ec 08             	sub    $0x8,%esp
c000773e:	ff 75 f4             	pushl  -0xc(%ebp)
c0007741:	ff 75 ec             	pushl  -0x14(%ebp)
c0007744:	e8 de fe ff ff       	call   c0007627 <free_a_page>
c0007749:	83 c4 10             	add    $0x10,%esp
c000774c:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
c0007753:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007757:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000775a:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
c000775d:	77 dc                	ja     c000773b <sys_free+0x6d>
c000775f:	e9 dc 00 00 00       	jmp    c0007840 <sys_free+0x172>
c0007764:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000776b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007772:	eb 26                	jmp    c000779a <sys_free+0xcc>
c0007774:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007777:	89 d0                	mov    %edx,%eax
c0007779:	01 c0                	add    %eax,%eax
c000777b:	01 d0                	add    %edx,%eax
c000777d:	c1 e0 03             	shl    $0x3,%eax
c0007780:	89 c2                	mov    %eax,%edx
c0007782:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007785:	01 d0                	add    %edx,%eax
c0007787:	8b 00                	mov    (%eax),%eax
c0007789:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000778c:	77 08                	ja     c0007796 <sys_free+0xc8>
c000778e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007791:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007794:	eb 0a                	jmp    c00077a0 <sys_free+0xd2>
c0007796:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000779a:	83 7d e0 09          	cmpl   $0x9,-0x20(%ebp)
c000779e:	7e d4                	jle    c0007774 <sys_free+0xa6>
c00077a0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00077a3:	89 d0                	mov    %edx,%eax
c00077a5:	01 c0                	add    %eax,%eax
c00077a7:	01 d0                	add    %edx,%eax
c00077a9:	c1 e0 03             	shl    $0x3,%eax
c00077ac:	89 c2                	mov    %eax,%edx
c00077ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00077b1:	01 d0                	add    %edx,%eax
c00077b3:	8b 10                	mov    (%eax),%edx
c00077b5:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c00077b8:	8b 50 04             	mov    0x4(%eax),%edx
c00077bb:	89 55 b8             	mov    %edx,-0x48(%ebp)
c00077be:	8b 50 08             	mov    0x8(%eax),%edx
c00077c1:	89 55 bc             	mov    %edx,-0x44(%ebp)
c00077c4:	8b 50 0c             	mov    0xc(%eax),%edx
c00077c7:	89 55 c0             	mov    %edx,-0x40(%ebp)
c00077ca:	8b 50 10             	mov    0x10(%eax),%edx
c00077cd:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c00077d0:	8b 40 14             	mov    0x14(%eax),%eax
c00077d3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00077d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00077d9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00077dc:	83 ec 0c             	sub    $0xc,%esp
c00077df:	ff 75 d0             	pushl  -0x30(%ebp)
c00077e2:	e8 5a fb ff ff       	call   c0007341 <block2arena>
c00077e7:	83 c4 10             	add    $0x10,%esp
c00077ea:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00077ed:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00077f0:	89 d0                	mov    %edx,%eax
c00077f2:	01 c0                	add    %eax,%eax
c00077f4:	01 d0                	add    %edx,%eax
c00077f6:	c1 e0 03             	shl    $0x3,%eax
c00077f9:	89 c2                	mov    %eax,%edx
c00077fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00077fe:	01 d0                	add    %edx,%eax
c0007800:	83 c0 08             	add    $0x8,%eax
c0007803:	83 ec 08             	sub    $0x8,%esp
c0007806:	ff 75 d0             	pushl  -0x30(%ebp)
c0007809:	50                   	push   %eax
c000780a:	e8 41 3a 00 00       	call   c000b250 <appendToDoubleLinkList>
c000780f:	83 c4 10             	add    $0x10,%esp
c0007812:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007815:	8b 40 04             	mov    0x4(%eax),%eax
c0007818:	8d 50 01             	lea    0x1(%eax),%edx
c000781b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000781e:	89 50 04             	mov    %edx,0x4(%eax)
c0007821:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007824:	8b 50 04             	mov    0x4(%eax),%edx
c0007827:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000782a:	39 c2                	cmp    %eax,%edx
c000782c:	75 12                	jne    c0007840 <sys_free+0x172>
c000782e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007831:	83 ec 08             	sub    $0x8,%esp
c0007834:	ff 75 f4             	pushl  -0xc(%ebp)
c0007837:	50                   	push   %eax
c0007838:	e8 ea fd ff ff       	call   c0007627 <free_a_page>
c000783d:	83 c4 10             	add    $0x10,%esp
c0007840:	83 ec 0c             	sub    $0xc,%esp
c0007843:	ff 75 d8             	pushl  -0x28(%ebp)
c0007846:	e8 e9 04 00 00       	call   c0007d34 <intr_set_status>
c000784b:	83 c4 10             	add    $0x10,%esp
c000784e:	90                   	nop
c000784f:	c9                   	leave  
c0007850:	c3                   	ret    

c0007851 <init_memory_block_desc>:
c0007851:	55                   	push   %ebp
c0007852:	89 e5                	mov    %esp,%ebp
c0007854:	83 ec 18             	sub    $0x18,%esp
c0007857:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000785e:	e9 b2 00 00 00       	jmp    c0007915 <init_memory_block_desc+0xc4>
c0007863:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007867:	75 1b                	jne    c0007884 <init_memory_block_desc+0x33>
c0007869:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000786c:	89 d0                	mov    %edx,%eax
c000786e:	01 c0                	add    %eax,%eax
c0007870:	01 d0                	add    %edx,%eax
c0007872:	c1 e0 03             	shl    $0x3,%eax
c0007875:	89 c2                	mov    %eax,%edx
c0007877:	8b 45 08             	mov    0x8(%ebp),%eax
c000787a:	01 d0                	add    %edx,%eax
c000787c:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0007882:	eb 2e                	jmp    c00078b2 <init_memory_block_desc+0x61>
c0007884:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007887:	89 d0                	mov    %edx,%eax
c0007889:	01 c0                	add    %eax,%eax
c000788b:	01 d0                	add    %edx,%eax
c000788d:	c1 e0 03             	shl    $0x3,%eax
c0007890:	8d 50 e8             	lea    -0x18(%eax),%edx
c0007893:	8b 45 08             	mov    0x8(%ebp),%eax
c0007896:	01 d0                	add    %edx,%eax
c0007898:	8b 08                	mov    (%eax),%ecx
c000789a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000789d:	89 d0                	mov    %edx,%eax
c000789f:	01 c0                	add    %eax,%eax
c00078a1:	01 d0                	add    %edx,%eax
c00078a3:	c1 e0 03             	shl    $0x3,%eax
c00078a6:	89 c2                	mov    %eax,%edx
c00078a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00078ab:	01 d0                	add    %edx,%eax
c00078ad:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c00078b0:	89 10                	mov    %edx,(%eax)
c00078b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00078b5:	89 d0                	mov    %edx,%eax
c00078b7:	01 c0                	add    %eax,%eax
c00078b9:	01 d0                	add    %edx,%eax
c00078bb:	c1 e0 03             	shl    $0x3,%eax
c00078be:	89 c2                	mov    %eax,%edx
c00078c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00078c3:	01 d0                	add    %edx,%eax
c00078c5:	8b 00                	mov    (%eax),%eax
c00078c7:	89 c1                	mov    %eax,%ecx
c00078c9:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c00078ce:	ba 00 00 00 00       	mov    $0x0,%edx
c00078d3:	f7 f1                	div    %ecx
c00078d5:	89 c1                	mov    %eax,%ecx
c00078d7:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00078da:	89 d0                	mov    %edx,%eax
c00078dc:	01 c0                	add    %eax,%eax
c00078de:	01 d0                	add    %edx,%eax
c00078e0:	c1 e0 03             	shl    $0x3,%eax
c00078e3:	89 c2                	mov    %eax,%edx
c00078e5:	8b 45 08             	mov    0x8(%ebp),%eax
c00078e8:	01 d0                	add    %edx,%eax
c00078ea:	89 ca                	mov    %ecx,%edx
c00078ec:	89 50 04             	mov    %edx,0x4(%eax)
c00078ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00078f2:	89 d0                	mov    %edx,%eax
c00078f4:	01 c0                	add    %eax,%eax
c00078f6:	01 d0                	add    %edx,%eax
c00078f8:	c1 e0 03             	shl    $0x3,%eax
c00078fb:	89 c2                	mov    %eax,%edx
c00078fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0007900:	01 d0                	add    %edx,%eax
c0007902:	83 c0 08             	add    $0x8,%eax
c0007905:	83 ec 0c             	sub    $0xc,%esp
c0007908:	50                   	push   %eax
c0007909:	e8 17 38 00 00       	call   c000b125 <initDoubleLinkList>
c000790e:	83 c4 10             	add    $0x10,%esp
c0007911:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0007915:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0007919:	0f 8e 44 ff ff ff    	jle    c0007863 <init_memory_block_desc+0x12>
c000791f:	90                   	nop
c0007920:	c9                   	leave  
c0007921:	c3                   	ret    

c0007922 <init_memory2>:
c0007922:	55                   	push   %ebp
c0007923:	89 e5                	mov    %esp,%ebp
c0007925:	83 ec 38             	sub    $0x38,%esp
c0007928:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c000792f:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0007936:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007939:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c000793e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007941:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007946:	29 c2                	sub    %eax,%edx
c0007948:	89 d0                	mov    %edx,%eax
c000794a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000794d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007950:	89 c2                	mov    %eax,%edx
c0007952:	c1 ea 1f             	shr    $0x1f,%edx
c0007955:	01 d0                	add    %edx,%eax
c0007957:	d1 f8                	sar    %eax
c0007959:	a3 b8 16 01 c0       	mov    %eax,0xc00116b8
c000795e:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007963:	83 ec 0c             	sub    $0xc,%esp
c0007966:	50                   	push   %eax
c0007967:	e8 ec 07 00 00       	call   c0008158 <disp_int>
c000796c:	83 c4 10             	add    $0x10,%esp
c000796f:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c0007974:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007977:	29 c2                	sub    %eax,%edx
c0007979:	89 d0                	mov    %edx,%eax
c000797b:	a3 00 1f 01 c0       	mov    %eax,0xc0011f00
c0007980:	83 ec 0c             	sub    $0xc,%esp
c0007983:	68 69 bb 00 c0       	push   $0xc000bb69
c0007988:	e8 ff 9b ff ff       	call   c000158c <disp_str>
c000798d:	83 c4 10             	add    $0x10,%esp
c0007990:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0007995:	83 ec 0c             	sub    $0xc,%esp
c0007998:	50                   	push   %eax
c0007999:	e8 ba 07 00 00       	call   c0008158 <disp_int>
c000799e:	83 c4 10             	add    $0x10,%esp
c00079a1:	83 ec 0c             	sub    $0xc,%esp
c00079a4:	68 69 bb 00 c0       	push   $0xc000bb69
c00079a9:	e8 de 9b ff ff       	call   c000158c <disp_str>
c00079ae:	83 c4 10             	add    $0x10,%esp
c00079b1:	a1 b8 16 01 c0       	mov    0xc00116b8,%eax
c00079b6:	05 ff 0f 00 00       	add    $0xfff,%eax
c00079bb:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00079c1:	85 c0                	test   %eax,%eax
c00079c3:	0f 48 c2             	cmovs  %edx,%eax
c00079c6:	c1 f8 0c             	sar    $0xc,%eax
c00079c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00079cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00079cf:	83 c0 07             	add    $0x7,%eax
c00079d2:	8d 50 07             	lea    0x7(%eax),%edx
c00079d5:	85 c0                	test   %eax,%eax
c00079d7:	0f 48 c2             	cmovs  %edx,%eax
c00079da:	c1 f8 03             	sar    $0x3,%eax
c00079dd:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c00079e2:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c00079e7:	2d 00 00 00 40       	sub    $0x40000000,%eax
c00079ec:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c00079f1:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c00079f7:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c00079fc:	83 ec 04             	sub    $0x4,%esp
c00079ff:	52                   	push   %edx
c0007a00:	6a 00                	push   $0x0
c0007a02:	50                   	push   %eax
c0007a03:	e8 83 4a 00 00       	call   c000c48b <Memset>
c0007a08:	83 c4 10             	add    $0x10,%esp
c0007a0b:	a1 b0 16 01 c0       	mov    0xc00116b0,%eax
c0007a10:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007a15:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007a1b:	85 c0                	test   %eax,%eax
c0007a1d:	0f 48 c2             	cmovs  %edx,%eax
c0007a20:	c1 f8 0c             	sar    $0xc,%eax
c0007a23:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007a26:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007a29:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007a2c:	ff 75 e8             	pushl  -0x18(%ebp)
c0007a2f:	6a 01                	push   $0x1
c0007a31:	6a 00                	push   $0x0
c0007a33:	68 ac 16 01 c0       	push   $0xc00116ac
c0007a38:	e8 c6 f2 ff ff       	call   c0006d03 <set_bits>
c0007a3d:	83 c4 10             	add    $0x10,%esp
c0007a40:	a1 00 1f 01 c0       	mov    0xc0011f00,%eax
c0007a45:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007a4a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007a50:	85 c0                	test   %eax,%eax
c0007a52:	0f 48 c2             	cmovs  %edx,%eax
c0007a55:	c1 f8 0c             	sar    $0xc,%eax
c0007a58:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007a5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a5e:	83 c0 07             	add    $0x7,%eax
c0007a61:	8d 50 07             	lea    0x7(%eax),%edx
c0007a64:	85 c0                	test   %eax,%eax
c0007a66:	0f 48 c2             	cmovs  %edx,%eax
c0007a69:	c1 f8 03             	sar    $0x3,%eax
c0007a6c:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007a71:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007a76:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007a7c:	01 d0                	add    %edx,%eax
c0007a7e:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007a83:	8b 15 f8 1e 01 c0    	mov    0xc0011ef8,%edx
c0007a89:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007a8e:	83 ec 04             	sub    $0x4,%esp
c0007a91:	52                   	push   %edx
c0007a92:	6a 00                	push   $0x0
c0007a94:	50                   	push   %eax
c0007a95:	e8 f1 49 00 00       	call   c000c48b <Memset>
c0007a9a:	83 c4 10             	add    $0x10,%esp
c0007a9d:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007aa2:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007aa7:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007aad:	85 c0                	test   %eax,%eax
c0007aaf:	0f 48 c2             	cmovs  %edx,%eax
c0007ab2:	c1 f8 0c             	sar    $0xc,%eax
c0007ab5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007ab8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007abb:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007abe:	ff 75 e8             	pushl  -0x18(%ebp)
c0007ac1:	6a 01                	push   $0x1
c0007ac3:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ac6:	68 ac 16 01 c0       	push   $0xc00116ac
c0007acb:	e8 33 f2 ff ff       	call   c0006d03 <set_bits>
c0007ad0:	83 c4 10             	add    $0x10,%esp
c0007ad3:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c0007ada:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007add:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007ae0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007ae3:	83 c0 07             	add    $0x7,%eax
c0007ae6:	8d 50 07             	lea    0x7(%eax),%edx
c0007ae9:	85 c0                	test   %eax,%eax
c0007aeb:	0f 48 c2             	cmovs  %edx,%eax
c0007aee:	c1 f8 03             	sar    $0x3,%eax
c0007af1:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007af6:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007afb:	8b 15 b0 16 01 c0    	mov    0xc00116b0,%edx
c0007b01:	01 c2                	add    %eax,%edx
c0007b03:	a1 f8 1e 01 c0       	mov    0xc0011ef8,%eax
c0007b08:	01 d0                	add    %edx,%eax
c0007b0a:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007b0f:	8b 15 98 07 01 c0    	mov    0xc0010798,%edx
c0007b15:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007b1a:	83 ec 04             	sub    $0x4,%esp
c0007b1d:	52                   	push   %edx
c0007b1e:	6a 00                	push   $0x0
c0007b20:	50                   	push   %eax
c0007b21:	e8 65 49 00 00       	call   c000c48b <Memset>
c0007b26:	83 c4 10             	add    $0x10,%esp
c0007b29:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007b2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007b2f:	01 d0                	add    %edx,%eax
c0007b31:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007b34:	a1 98 07 01 c0       	mov    0xc0010798,%eax
c0007b39:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007b3e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007b44:	85 c0                	test   %eax,%eax
c0007b46:	0f 48 c2             	cmovs  %edx,%eax
c0007b49:	c1 f8 0c             	sar    $0xc,%eax
c0007b4c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007b4f:	ff 75 e8             	pushl  -0x18(%ebp)
c0007b52:	6a 01                	push   $0x1
c0007b54:	ff 75 e0             	pushl  -0x20(%ebp)
c0007b57:	68 ac 16 01 c0       	push   $0xc00116ac
c0007b5c:	e8 a2 f1 ff ff       	call   c0006d03 <set_bits>
c0007b61:	83 c4 10             	add    $0x10,%esp
c0007b64:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007b67:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007b6a:	01 d0                	add    %edx,%eax
c0007b6c:	c1 e0 0c             	shl    $0xc,%eax
c0007b6f:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007b74:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007b77:	83 c0 02             	add    $0x2,%eax
c0007b7a:	c1 e0 0c             	shl    $0xc,%eax
c0007b7d:	89 c2                	mov    %eax,%edx
c0007b7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b82:	01 d0                	add    %edx,%eax
c0007b84:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007b89:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007b90:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007b93:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007b96:	90                   	nop
c0007b97:	c9                   	leave  
c0007b98:	c3                   	ret    

c0007b99 <init_memory>:
c0007b99:	55                   	push   %ebp
c0007b9a:	89 e5                	mov    %esp,%ebp
c0007b9c:	83 ec 38             	sub    $0x38,%esp
c0007b9f:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0007ba6:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007bad:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007bb4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007bb7:	05 00 00 10 00       	add    $0x100000,%eax
c0007bbc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007bbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0007bc2:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0007bc5:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007bcb:	85 c0                	test   %eax,%eax
c0007bcd:	0f 48 c2             	cmovs  %edx,%eax
c0007bd0:	c1 f8 0c             	sar    $0xc,%eax
c0007bd3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007bd6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007bd9:	89 c2                	mov    %eax,%edx
c0007bdb:	c1 ea 1f             	shr    $0x1f,%edx
c0007bde:	01 d0                	add    %edx,%eax
c0007be0:	d1 f8                	sar    %eax
c0007be2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007be5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007be8:	2b 45 e0             	sub    -0x20(%ebp),%eax
c0007beb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007bee:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0007bf1:	8d 50 07             	lea    0x7(%eax),%edx
c0007bf4:	85 c0                	test   %eax,%eax
c0007bf6:	0f 48 c2             	cmovs  %edx,%eax
c0007bf9:	c1 f8 03             	sar    $0x3,%eax
c0007bfc:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007bff:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0007c02:	8d 50 07             	lea    0x7(%eax),%edx
c0007c05:	85 c0                	test   %eax,%eax
c0007c07:	0f 48 c2             	cmovs  %edx,%eax
c0007c0a:	c1 f8 03             	sar    $0x3,%eax
c0007c0d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007c10:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007c13:	a3 b4 16 01 c0       	mov    %eax,0xc00116b4
c0007c18:	a1 b4 16 01 c0       	mov    0xc00116b4,%eax
c0007c1d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007c20:	c1 e2 0c             	shl    $0xc,%edx
c0007c23:	01 d0                	add    %edx,%eax
c0007c25:	a3 fc 1e 01 c0       	mov    %eax,0xc0011efc
c0007c2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007c2d:	a3 ac 16 01 c0       	mov    %eax,0xc00116ac
c0007c32:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007c35:	a3 b0 16 01 c0       	mov    %eax,0xc00116b0
c0007c3a:	a1 ac 16 01 c0       	mov    0xc00116ac,%eax
c0007c3f:	83 ec 04             	sub    $0x4,%esp
c0007c42:	ff 75 d8             	pushl  -0x28(%ebp)
c0007c45:	6a 00                	push   $0x0
c0007c47:	50                   	push   %eax
c0007c48:	e8 3e 48 00 00       	call   c000c48b <Memset>
c0007c4d:	83 c4 10             	add    $0x10,%esp
c0007c50:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007c53:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007c56:	01 d0                	add    %edx,%eax
c0007c58:	a3 f4 1e 01 c0       	mov    %eax,0xc0011ef4
c0007c5d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007c60:	a3 f8 1e 01 c0       	mov    %eax,0xc0011ef8
c0007c65:	a1 f4 1e 01 c0       	mov    0xc0011ef4,%eax
c0007c6a:	83 ec 04             	sub    $0x4,%esp
c0007c6d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007c70:	6a 00                	push   $0x0
c0007c72:	50                   	push   %eax
c0007c73:	e8 13 48 00 00       	call   c000c48b <Memset>
c0007c78:	83 c4 10             	add    $0x10,%esp
c0007c7b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007c7e:	a3 98 07 01 c0       	mov    %eax,0xc0010798
c0007c83:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007c86:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007c89:	01 c2                	add    %eax,%edx
c0007c8b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007c8e:	01 d0                	add    %edx,%eax
c0007c90:	a3 94 07 01 c0       	mov    %eax,0xc0010794
c0007c95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007c98:	05 00 00 10 00       	add    $0x100000,%eax
c0007c9d:	a3 9c 07 01 c0       	mov    %eax,0xc001079c
c0007ca2:	a1 94 07 01 c0       	mov    0xc0010794,%eax
c0007ca7:	83 ec 04             	sub    $0x4,%esp
c0007caa:	ff 75 d8             	pushl  -0x28(%ebp)
c0007cad:	6a 00                	push   $0x0
c0007caf:	50                   	push   %eax
c0007cb0:	e8 d6 47 00 00       	call   c000c48b <Memset>
c0007cb5:	83 c4 10             	add    $0x10,%esp
c0007cb8:	83 ec 04             	sub    $0x4,%esp
c0007cbb:	68 f0 00 00 00       	push   $0xf0
c0007cc0:	6a 00                	push   $0x0
c0007cc2:	68 a0 47 08 c0       	push   $0xc00847a0
c0007cc7:	e8 bf 47 00 00       	call   c000c48b <Memset>
c0007ccc:	83 c4 10             	add    $0x10,%esp
c0007ccf:	83 ec 0c             	sub    $0xc,%esp
c0007cd2:	68 a0 47 08 c0       	push   $0xc00847a0
c0007cd7:	e8 75 fb ff ff       	call   c0007851 <init_memory_block_desc>
c0007cdc:	83 c4 10             	add    $0x10,%esp
c0007cdf:	90                   	nop
c0007ce0:	c9                   	leave  
c0007ce1:	c3                   	ret    

c0007ce2 <intr_enable>:
c0007ce2:	55                   	push   %ebp
c0007ce3:	89 e5                	mov    %esp,%ebp
c0007ce5:	83 ec 18             	sub    $0x18,%esp
c0007ce8:	e8 65 00 00 00       	call   c0007d52 <intr_get_status>
c0007ced:	83 f8 01             	cmp    $0x1,%eax
c0007cf0:	75 0c                	jne    c0007cfe <intr_enable+0x1c>
c0007cf2:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007cf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007cfc:	eb 0b                	jmp    c0007d09 <intr_enable+0x27>
c0007cfe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007d05:	fb                   	sti    
c0007d06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007d09:	c9                   	leave  
c0007d0a:	c3                   	ret    

c0007d0b <intr_disable>:
c0007d0b:	55                   	push   %ebp
c0007d0c:	89 e5                	mov    %esp,%ebp
c0007d0e:	83 ec 18             	sub    $0x18,%esp
c0007d11:	e8 3c 00 00 00       	call   c0007d52 <intr_get_status>
c0007d16:	83 f8 01             	cmp    $0x1,%eax
c0007d19:	75 0d                	jne    c0007d28 <intr_disable+0x1d>
c0007d1b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0007d22:	fa                   	cli    
c0007d23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007d26:	eb 0a                	jmp    c0007d32 <intr_disable+0x27>
c0007d28:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007d2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007d32:	c9                   	leave  
c0007d33:	c3                   	ret    

c0007d34 <intr_set_status>:
c0007d34:	55                   	push   %ebp
c0007d35:	89 e5                	mov    %esp,%ebp
c0007d37:	83 ec 08             	sub    $0x8,%esp
c0007d3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0007d3d:	83 e0 01             	and    $0x1,%eax
c0007d40:	85 c0                	test   %eax,%eax
c0007d42:	74 07                	je     c0007d4b <intr_set_status+0x17>
c0007d44:	e8 99 ff ff ff       	call   c0007ce2 <intr_enable>
c0007d49:	eb 05                	jmp    c0007d50 <intr_set_status+0x1c>
c0007d4b:	e8 bb ff ff ff       	call   c0007d0b <intr_disable>
c0007d50:	c9                   	leave  
c0007d51:	c3                   	ret    

c0007d52 <intr_get_status>:
c0007d52:	55                   	push   %ebp
c0007d53:	89 e5                	mov    %esp,%ebp
c0007d55:	83 ec 10             	sub    $0x10,%esp
c0007d58:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0007d5f:	9c                   	pushf  
c0007d60:	58                   	pop    %eax
c0007d61:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007d64:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007d67:	c1 e8 09             	shr    $0x9,%eax
c0007d6a:	83 e0 01             	and    $0x1,%eax
c0007d6d:	c9                   	leave  
c0007d6e:	c3                   	ret    

c0007d6f <Memcpy>:
c0007d6f:	55                   	push   %ebp
c0007d70:	89 e5                	mov    %esp,%ebp
c0007d72:	83 ec 18             	sub    $0x18,%esp
c0007d75:	e8 91 ff ff ff       	call   c0007d0b <intr_disable>
c0007d7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007d7d:	83 ec 04             	sub    $0x4,%esp
c0007d80:	ff 75 10             	pushl  0x10(%ebp)
c0007d83:	ff 75 0c             	pushl  0xc(%ebp)
c0007d86:	ff 75 08             	pushl  0x8(%ebp)
c0007d89:	e8 cf 46 00 00       	call   c000c45d <Memcpy2>
c0007d8e:	83 c4 10             	add    $0x10,%esp
c0007d91:	83 ec 0c             	sub    $0xc,%esp
c0007d94:	ff 75 f4             	pushl  -0xc(%ebp)
c0007d97:	e8 98 ff ff ff       	call   c0007d34 <intr_set_status>
c0007d9c:	83 c4 10             	add    $0x10,%esp
c0007d9f:	90                   	nop
c0007da0:	c9                   	leave  
c0007da1:	c3                   	ret    

c0007da2 <untar>:
c0007da2:	55                   	push   %ebp
c0007da3:	89 e5                	mov    %esp,%ebp
c0007da5:	81 ec 48 0a 00 00    	sub    $0xa48,%esp
c0007dab:	83 ec 08             	sub    $0x8,%esp
c0007dae:	6a 00                	push   $0x0
c0007db0:	ff 75 08             	pushl  0x8(%ebp)
c0007db3:	e8 c0 e0 ff ff       	call   c0005e78 <open>
c0007db8:	83 c4 10             	add    $0x10,%esp
c0007dbb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007dbe:	83 ec 0c             	sub    $0xc,%esp
c0007dc1:	68 80 bb 00 c0       	push   $0xc000bb80
c0007dc6:	e8 2c 1c 00 00       	call   c00099f7 <Printf>
c0007dcb:	83 c4 10             	add    $0x10,%esp
c0007dce:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007dd5:	c7 45 dc 00 02 00 00 	movl   $0x200,-0x24(%ebp)
c0007ddc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007de3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007dea:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0007df1:	e9 5e 02 00 00       	jmp    c0008054 <untar+0x2b2>
c0007df6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007dfa:	7e 58                	jle    c0007e54 <untar+0xb2>
c0007dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007dff:	05 ff 01 00 00       	add    $0x1ff,%eax
c0007e04:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0007e0a:	85 c0                	test   %eax,%eax
c0007e0c:	0f 48 c2             	cmovs  %edx,%eax
c0007e0f:	c1 f8 09             	sar    $0x9,%eax
c0007e12:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007e15:	83 ec 04             	sub    $0x4,%esp
c0007e18:	68 00 02 00 00       	push   $0x200
c0007e1d:	6a 00                	push   $0x0
c0007e1f:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007e25:	50                   	push   %eax
c0007e26:	e8 60 46 00 00       	call   c000c48b <Memset>
c0007e2b:	83 c4 10             	add    $0x10,%esp
c0007e2e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007e31:	c1 e0 09             	shl    $0x9,%eax
c0007e34:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007e37:	83 ec 04             	sub    $0x4,%esp
c0007e3a:	50                   	push   %eax
c0007e3b:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007e41:	50                   	push   %eax
c0007e42:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007e45:	e8 b3 e0 ff ff       	call   c0005efd <read>
c0007e4a:	83 c4 10             	add    $0x10,%esp
c0007e4d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007e54:	83 ec 04             	sub    $0x4,%esp
c0007e57:	68 00 02 00 00       	push   $0x200
c0007e5c:	6a 00                	push   $0x0
c0007e5e:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007e64:	50                   	push   %eax
c0007e65:	e8 21 46 00 00       	call   c000c48b <Memset>
c0007e6a:	83 c4 10             	add    $0x10,%esp
c0007e6d:	83 ec 04             	sub    $0x4,%esp
c0007e70:	68 00 02 00 00       	push   $0x200
c0007e75:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007e7b:	50                   	push   %eax
c0007e7c:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007e7f:	e8 79 e0 ff ff       	call   c0005efd <read>
c0007e84:	83 c4 10             	add    $0x10,%esp
c0007e87:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007e8a:	83 ec 0c             	sub    $0xc,%esp
c0007e8d:	68 92 bb 00 c0       	push   $0xc000bb92
c0007e92:	e8 60 1b 00 00       	call   c00099f7 <Printf>
c0007e97:	83 c4 10             	add    $0x10,%esp
c0007e9a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007e9e:	0f 84 bc 01 00 00    	je     c0008060 <untar+0x2be>
c0007ea4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007ea7:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007eaa:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007eb1:	8d 85 b8 fd ff ff    	lea    -0x248(%ebp),%eax
c0007eb7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007eba:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007ebd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007ec0:	83 ec 08             	sub    $0x8,%esp
c0007ec3:	6a 07                	push   $0x7
c0007ec5:	ff 75 cc             	pushl  -0x34(%ebp)
c0007ec8:	e8 ab df ff ff       	call   c0005e78 <open>
c0007ecd:	83 c4 10             	add    $0x10,%esp
c0007ed0:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007ed3:	83 ec 0c             	sub    $0xc,%esp
c0007ed6:	68 a4 bb 00 c0       	push   $0xc000bba4
c0007edb:	e8 17 1b 00 00       	call   c00099f7 <Printf>
c0007ee0:	83 c4 10             	add    $0x10,%esp
c0007ee3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007eea:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007eed:	83 c0 7c             	add    $0x7c,%eax
c0007ef0:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007ef3:	83 ec 0c             	sub    $0xc,%esp
c0007ef6:	ff 75 cc             	pushl  -0x34(%ebp)
c0007ef9:	e8 c6 45 00 00       	call   c000c4c4 <Strlen>
c0007efe:	83 c4 10             	add    $0x10,%esp
c0007f01:	85 c0                	test   %eax,%eax
c0007f03:	75 28                	jne    c0007f2d <untar+0x18b>
c0007f05:	83 ec 0c             	sub    $0xc,%esp
c0007f08:	ff 75 c4             	pushl  -0x3c(%ebp)
c0007f0b:	e8 b4 45 00 00       	call   c000c4c4 <Strlen>
c0007f10:	83 c4 10             	add    $0x10,%esp
c0007f13:	85 c0                	test   %eax,%eax
c0007f15:	75 16                	jne    c0007f2d <untar+0x18b>
c0007f17:	83 ec 0c             	sub    $0xc,%esp
c0007f1a:	68 b6 bb 00 c0       	push   $0xc000bbb6
c0007f1f:	e8 d3 1a 00 00       	call   c00099f7 <Printf>
c0007f24:	83 c4 10             	add    $0x10,%esp
c0007f27:	90                   	nop
c0007f28:	e9 34 01 00 00       	jmp    c0008061 <untar+0x2bf>
c0007f2d:	83 ec 0c             	sub    $0xc,%esp
c0007f30:	68 bd bb 00 c0       	push   $0xc000bbbd
c0007f35:	e8 bd 1a 00 00       	call   c00099f7 <Printf>
c0007f3a:	83 c4 10             	add    $0x10,%esp
c0007f3d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0007f40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007f43:	eb 1f                	jmp    c0007f64 <untar+0x1c2>
c0007f45:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007f48:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c0007f4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007f52:	0f b6 00             	movzbl (%eax),%eax
c0007f55:	0f be c0             	movsbl %al,%eax
c0007f58:	83 e8 30             	sub    $0x30,%eax
c0007f5b:	01 d0                	add    %edx,%eax
c0007f5d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007f60:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0007f64:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007f67:	0f b6 00             	movzbl (%eax),%eax
c0007f6a:	84 c0                	test   %al,%al
c0007f6c:	75 d7                	jne    c0007f45 <untar+0x1a3>
c0007f6e:	83 ec 0c             	sub    $0xc,%esp
c0007f71:	68 cb bb 00 c0       	push   $0xc000bbcb
c0007f76:	e8 7c 1a 00 00       	call   c00099f7 <Printf>
c0007f7b:	83 c4 10             	add    $0x10,%esp
c0007f7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007f81:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0007f84:	c7 45 bc 00 08 00 00 	movl   $0x800,-0x44(%ebp)
c0007f8b:	83 ec 08             	sub    $0x8,%esp
c0007f8e:	ff 75 c0             	pushl  -0x40(%ebp)
c0007f91:	68 d9 bb 00 c0       	push   $0xc000bbd9
c0007f96:	e8 5c 1a 00 00       	call   c00099f7 <Printf>
c0007f9b:	83 c4 10             	add    $0x10,%esp
c0007f9e:	83 ec 08             	sub    $0x8,%esp
c0007fa1:	ff 75 c0             	pushl  -0x40(%ebp)
c0007fa4:	68 eb bb 00 c0       	push   $0xc000bbeb
c0007fa9:	e8 49 1a 00 00       	call   c00099f7 <Printf>
c0007fae:	83 c4 10             	add    $0x10,%esp
c0007fb1:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007fb4:	39 45 bc             	cmp    %eax,-0x44(%ebp)
c0007fb7:	0f 4e 45 bc          	cmovle -0x44(%ebp),%eax
c0007fbb:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007fbe:	83 ec 04             	sub    $0x4,%esp
c0007fc1:	ff 75 b8             	pushl  -0x48(%ebp)
c0007fc4:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007fca:	50                   	push   %eax
c0007fcb:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007fce:	e8 2a df ff ff       	call   c0005efd <read>
c0007fd3:	83 c4 10             	add    $0x10,%esp
c0007fd6:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007fd9:	83 ec 04             	sub    $0x4,%esp
c0007fdc:	ff 75 b8             	pushl  -0x48(%ebp)
c0007fdf:	8d 85 b8 f5 ff ff    	lea    -0xa48(%ebp),%eax
c0007fe5:	50                   	push   %eax
c0007fe6:	ff 75 c8             	pushl  -0x38(%ebp)
c0007fe9:	e8 83 df ff ff       	call   c0005f71 <write>
c0007fee:	83 c4 10             	add    $0x10,%esp
c0007ff1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ff4:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0007ff7:	7d 02                	jge    c0007ffb <untar+0x259>
c0007ff9:	eb c3                	jmp    c0007fbe <untar+0x21c>
c0007ffb:	90                   	nop
c0007ffc:	83 ec 08             	sub    $0x8,%esp
c0007fff:	ff 75 f4             	pushl  -0xc(%ebp)
c0008002:	68 fd bb 00 c0       	push   $0xc000bbfd
c0008007:	e8 eb 19 00 00       	call   c00099f7 <Printf>
c000800c:	83 c4 10             	add    $0x10,%esp
c000800f:	83 ec 08             	sub    $0x8,%esp
c0008012:	ff 75 c0             	pushl  -0x40(%ebp)
c0008015:	68 0f bc 00 c0       	push   $0xc000bc0f
c000801a:	e8 d8 19 00 00       	call   c00099f7 <Printf>
c000801f:	83 c4 10             	add    $0x10,%esp
c0008022:	83 ec 0c             	sub    $0xc,%esp
c0008025:	68 20 bc 00 c0       	push   $0xc000bc20
c000802a:	e8 c8 19 00 00       	call   c00099f7 <Printf>
c000802f:	83 c4 10             	add    $0x10,%esp
c0008032:	83 ec 0c             	sub    $0xc,%esp
c0008035:	ff 75 c8             	pushl  -0x38(%ebp)
c0008038:	e8 a8 df ff ff       	call   c0005fe5 <close>
c000803d:	83 c4 10             	add    $0x10,%esp
c0008040:	83 ec 0c             	sub    $0xc,%esp
c0008043:	68 2e bc 00 c0       	push   $0xc000bc2e
c0008048:	e8 aa 19 00 00       	call   c00099f7 <Printf>
c000804d:	83 c4 10             	add    $0x10,%esp
c0008050:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0008054:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008058:	0f 8f 98 fd ff ff    	jg     c0007df6 <untar+0x54>
c000805e:	eb 01                	jmp    c0008061 <untar+0x2bf>
c0008060:	90                   	nop
c0008061:	83 ec 0c             	sub    $0xc,%esp
c0008064:	68 3b bc 00 c0       	push   $0xc000bc3b
c0008069:	e8 89 19 00 00       	call   c00099f7 <Printf>
c000806e:	83 c4 10             	add    $0x10,%esp
c0008071:	83 ec 0c             	sub    $0xc,%esp
c0008074:	68 4d bc 00 c0       	push   $0xc000bc4d
c0008079:	e8 79 19 00 00       	call   c00099f7 <Printf>
c000807e:	83 c4 10             	add    $0x10,%esp
c0008081:	83 ec 0c             	sub    $0xc,%esp
c0008084:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008087:	e8 59 df ff ff       	call   c0005fe5 <close>
c000808c:	83 c4 10             	add    $0x10,%esp
c000808f:	83 ec 0c             	sub    $0xc,%esp
c0008092:	68 5d bc 00 c0       	push   $0xc000bc5d
c0008097:	e8 5b 19 00 00       	call   c00099f7 <Printf>
c000809c:	83 c4 10             	add    $0x10,%esp
c000809f:	83 ec 0c             	sub    $0xc,%esp
c00080a2:	68 70 bc 00 c0       	push   $0xc000bc70
c00080a7:	e8 4b 19 00 00       	call   c00099f7 <Printf>
c00080ac:	83 c4 10             	add    $0x10,%esp
c00080af:	90                   	nop
c00080b0:	c9                   	leave  
c00080b1:	c3                   	ret    

c00080b2 <atoi>:
c00080b2:	55                   	push   %ebp
c00080b3:	89 e5                	mov    %esp,%ebp
c00080b5:	83 ec 10             	sub    $0x10,%esp
c00080b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00080bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00080be:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00080c1:	8d 50 01             	lea    0x1(%eax),%edx
c00080c4:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00080c7:	c6 00 30             	movb   $0x30,(%eax)
c00080ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00080cd:	8d 50 01             	lea    0x1(%eax),%edx
c00080d0:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00080d3:	c6 00 78             	movb   $0x78,(%eax)
c00080d6:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c00080da:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00080de:	75 0e                	jne    c00080ee <atoi+0x3c>
c00080e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00080e3:	8d 50 01             	lea    0x1(%eax),%edx
c00080e6:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00080e9:	c6 00 30             	movb   $0x30,(%eax)
c00080ec:	eb 61                	jmp    c000814f <atoi+0x9d>
c00080ee:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c00080f5:	eb 52                	jmp    c0008149 <atoi+0x97>
c00080f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00080fa:	8b 55 0c             	mov    0xc(%ebp),%edx
c00080fd:	89 c1                	mov    %eax,%ecx
c00080ff:	d3 fa                	sar    %cl,%edx
c0008101:	89 d0                	mov    %edx,%eax
c0008103:	83 e0 0f             	and    $0xf,%eax
c0008106:	88 45 fb             	mov    %al,-0x5(%ebp)
c0008109:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c000810d:	75 06                	jne    c0008115 <atoi+0x63>
c000810f:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0008113:	74 2f                	je     c0008144 <atoi+0x92>
c0008115:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0008119:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c000811d:	83 c0 30             	add    $0x30,%eax
c0008120:	88 45 fb             	mov    %al,-0x5(%ebp)
c0008123:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0008127:	7e 0a                	jle    c0008133 <atoi+0x81>
c0008129:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c000812d:	83 c0 07             	add    $0x7,%eax
c0008130:	88 45 fb             	mov    %al,-0x5(%ebp)
c0008133:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008136:	8d 50 01             	lea    0x1(%eax),%edx
c0008139:	89 55 fc             	mov    %edx,-0x4(%ebp)
c000813c:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0008140:	88 10                	mov    %dl,(%eax)
c0008142:	eb 01                	jmp    c0008145 <atoi+0x93>
c0008144:	90                   	nop
c0008145:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0008149:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000814d:	79 a8                	jns    c00080f7 <atoi+0x45>
c000814f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008152:	c6 00 00             	movb   $0x0,(%eax)
c0008155:	90                   	nop
c0008156:	c9                   	leave  
c0008157:	c3                   	ret    

c0008158 <disp_int>:
c0008158:	55                   	push   %ebp
c0008159:	89 e5                	mov    %esp,%ebp
c000815b:	83 ec 18             	sub    $0x18,%esp
c000815e:	ff 75 08             	pushl  0x8(%ebp)
c0008161:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0008164:	50                   	push   %eax
c0008165:	e8 48 ff ff ff       	call   c00080b2 <atoi>
c000816a:	83 c4 08             	add    $0x8,%esp
c000816d:	83 ec 08             	sub    $0x8,%esp
c0008170:	6a 0b                	push   $0xb
c0008172:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0008175:	50                   	push   %eax
c0008176:	e8 4c 94 ff ff       	call   c00015c7 <disp_str_colour>
c000817b:	83 c4 10             	add    $0x10,%esp
c000817e:	90                   	nop
c000817f:	c9                   	leave  
c0008180:	c3                   	ret    

c0008181 <do_page_fault>:
c0008181:	55                   	push   %ebp
c0008182:	89 e5                	mov    %esp,%ebp
c0008184:	83 ec 28             	sub    $0x28,%esp
c0008187:	0f 20 d0             	mov    %cr2,%eax
c000818a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000818d:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c0008194:	00 00 00 
c0008197:	83 ec 0c             	sub    $0xc,%esp
c000819a:	68 7b bc 00 c0       	push   $0xc000bc7b
c000819f:	e8 e8 93 ff ff       	call   c000158c <disp_str>
c00081a4:	83 c4 10             	add    $0x10,%esp
c00081a7:	83 ec 0c             	sub    $0xc,%esp
c00081aa:	68 8a bc 00 c0       	push   $0xc000bc8a
c00081af:	e8 d8 93 ff ff       	call   c000158c <disp_str>
c00081b4:	83 c4 10             	add    $0x10,%esp
c00081b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00081ba:	83 ec 0c             	sub    $0xc,%esp
c00081bd:	50                   	push   %eax
c00081be:	e8 95 ff ff ff       	call   c0008158 <disp_int>
c00081c3:	83 c4 10             	add    $0x10,%esp
c00081c6:	83 ec 0c             	sub    $0xc,%esp
c00081c9:	68 8f bc 00 c0       	push   $0xc000bc8f
c00081ce:	e8 b9 93 ff ff       	call   c000158c <disp_str>
c00081d3:	83 c4 10             	add    $0x10,%esp
c00081d6:	83 ec 0c             	sub    $0xc,%esp
c00081d9:	ff 75 f4             	pushl  -0xc(%ebp)
c00081dc:	e8 b6 ed ff ff       	call   c0006f97 <ptr_pde>
c00081e1:	83 c4 10             	add    $0x10,%esp
c00081e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00081e7:	83 ec 0c             	sub    $0xc,%esp
c00081ea:	ff 75 f4             	pushl  -0xc(%ebp)
c00081ed:	e8 b8 ed ff ff       	call   c0006faa <ptr_pte>
c00081f2:	83 c4 10             	add    $0x10,%esp
c00081f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00081f8:	83 ec 0c             	sub    $0xc,%esp
c00081fb:	68 91 bc 00 c0       	push   $0xc000bc91
c0008200:	e8 87 93 ff ff       	call   c000158c <disp_str>
c0008205:	83 c4 10             	add    $0x10,%esp
c0008208:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000820b:	83 ec 0c             	sub    $0xc,%esp
c000820e:	50                   	push   %eax
c000820f:	e8 44 ff ff ff       	call   c0008158 <disp_int>
c0008214:	83 c4 10             	add    $0x10,%esp
c0008217:	83 ec 0c             	sub    $0xc,%esp
c000821a:	68 96 bc 00 c0       	push   $0xc000bc96
c000821f:	e8 68 93 ff ff       	call   c000158c <disp_str>
c0008224:	83 c4 10             	add    $0x10,%esp
c0008227:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000822a:	8b 00                	mov    (%eax),%eax
c000822c:	83 ec 0c             	sub    $0xc,%esp
c000822f:	50                   	push   %eax
c0008230:	e8 23 ff ff ff       	call   c0008158 <disp_int>
c0008235:	83 c4 10             	add    $0x10,%esp
c0008238:	83 ec 0c             	sub    $0xc,%esp
c000823b:	68 8f bc 00 c0       	push   $0xc000bc8f
c0008240:	e8 47 93 ff ff       	call   c000158c <disp_str>
c0008245:	83 c4 10             	add    $0x10,%esp
c0008248:	83 ec 0c             	sub    $0xc,%esp
c000824b:	68 9f bc 00 c0       	push   $0xc000bc9f
c0008250:	e8 37 93 ff ff       	call   c000158c <disp_str>
c0008255:	83 c4 10             	add    $0x10,%esp
c0008258:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000825b:	83 ec 0c             	sub    $0xc,%esp
c000825e:	50                   	push   %eax
c000825f:	e8 f4 fe ff ff       	call   c0008158 <disp_int>
c0008264:	83 c4 10             	add    $0x10,%esp
c0008267:	83 ec 0c             	sub    $0xc,%esp
c000826a:	68 a4 bc 00 c0       	push   $0xc000bca4
c000826f:	e8 18 93 ff ff       	call   c000158c <disp_str>
c0008274:	83 c4 10             	add    $0x10,%esp
c0008277:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000827a:	8b 00                	mov    (%eax),%eax
c000827c:	83 ec 0c             	sub    $0xc,%esp
c000827f:	50                   	push   %eax
c0008280:	e8 d3 fe ff ff       	call   c0008158 <disp_int>
c0008285:	83 c4 10             	add    $0x10,%esp
c0008288:	83 ec 0c             	sub    $0xc,%esp
c000828b:	68 8f bc 00 c0       	push   $0xc000bc8f
c0008290:	e8 f7 92 ff ff       	call   c000158c <disp_str>
c0008295:	83 c4 10             	add    $0x10,%esp
c0008298:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c000829f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00082a2:	8b 00                	mov    (%eax),%eax
c00082a4:	83 e0 01             	and    $0x1,%eax
c00082a7:	85 c0                	test   %eax,%eax
c00082a9:	74 09                	je     c00082b4 <do_page_fault+0x133>
c00082ab:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c00082b2:	eb 07                	jmp    c00082bb <do_page_fault+0x13a>
c00082b4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00082bb:	90                   	nop
c00082bc:	c9                   	leave  
c00082bd:	c3                   	ret    

c00082be <exception_handler>:
c00082be:	55                   	push   %ebp
c00082bf:	89 e5                	mov    %esp,%ebp
c00082c1:	57                   	push   %edi
c00082c2:	56                   	push   %esi
c00082c3:	53                   	push   %ebx
c00082c4:	83 ec 6c             	sub    $0x6c,%esp
c00082c7:	8d 45 8c             	lea    -0x74(%ebp),%eax
c00082ca:	bb 20 bf 00 c0       	mov    $0xc000bf20,%ebx
c00082cf:	ba 13 00 00 00       	mov    $0x13,%edx
c00082d4:	89 c7                	mov    %eax,%edi
c00082d6:	89 de                	mov    %ebx,%esi
c00082d8:	89 d1                	mov    %edx,%ecx
c00082da:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00082dc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00082e3:	eb 04                	jmp    c00082e9 <exception_handler+0x2b>
c00082e5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00082e9:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c00082f0:	7e f3                	jle    c00082e5 <exception_handler+0x27>
c00082f2:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00082f9:	00 00 00 
c00082fc:	83 ec 0c             	sub    $0xc,%esp
c00082ff:	68 ad bc 00 c0       	push   $0xc000bcad
c0008304:	e8 83 92 ff ff       	call   c000158c <disp_str>
c0008309:	83 c4 10             	add    $0x10,%esp
c000830c:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0008313:	8b 45 08             	mov    0x8(%ebp),%eax
c0008316:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c000831a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000831d:	83 ec 0c             	sub    $0xc,%esp
c0008320:	ff 75 dc             	pushl  -0x24(%ebp)
c0008323:	e8 64 92 ff ff       	call   c000158c <disp_str>
c0008328:	83 c4 10             	add    $0x10,%esp
c000832b:	83 ec 0c             	sub    $0xc,%esp
c000832e:	68 bb bc 00 c0       	push   $0xc000bcbb
c0008333:	e8 54 92 ff ff       	call   c000158c <disp_str>
c0008338:	83 c4 10             	add    $0x10,%esp
c000833b:	83 ec 0c             	sub    $0xc,%esp
c000833e:	68 be bc 00 c0       	push   $0xc000bcbe
c0008343:	e8 44 92 ff ff       	call   c000158c <disp_str>
c0008348:	83 c4 10             	add    $0x10,%esp
c000834b:	8b 45 08             	mov    0x8(%ebp),%eax
c000834e:	83 ec 0c             	sub    $0xc,%esp
c0008351:	50                   	push   %eax
c0008352:	e8 01 fe ff ff       	call   c0008158 <disp_int>
c0008357:	83 c4 10             	add    $0x10,%esp
c000835a:	83 ec 0c             	sub    $0xc,%esp
c000835d:	68 bb bc 00 c0       	push   $0xc000bcbb
c0008362:	e8 25 92 ff ff       	call   c000158c <disp_str>
c0008367:	83 c4 10             	add    $0x10,%esp
c000836a:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c000836e:	74 2f                	je     c000839f <exception_handler+0xe1>
c0008370:	83 ec 0c             	sub    $0xc,%esp
c0008373:	68 c6 bc 00 c0       	push   $0xc000bcc6
c0008378:	e8 0f 92 ff ff       	call   c000158c <disp_str>
c000837d:	83 c4 10             	add    $0x10,%esp
c0008380:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008383:	83 ec 0c             	sub    $0xc,%esp
c0008386:	50                   	push   %eax
c0008387:	e8 cc fd ff ff       	call   c0008158 <disp_int>
c000838c:	83 c4 10             	add    $0x10,%esp
c000838f:	83 ec 0c             	sub    $0xc,%esp
c0008392:	68 bb bc 00 c0       	push   $0xc000bcbb
c0008397:	e8 f0 91 ff ff       	call   c000158c <disp_str>
c000839c:	83 c4 10             	add    $0x10,%esp
c000839f:	83 ec 0c             	sub    $0xc,%esp
c00083a2:	68 d0 bc 00 c0       	push   $0xc000bcd0
c00083a7:	e8 e0 91 ff ff       	call   c000158c <disp_str>
c00083ac:	83 c4 10             	add    $0x10,%esp
c00083af:	83 ec 0c             	sub    $0xc,%esp
c00083b2:	ff 75 14             	pushl  0x14(%ebp)
c00083b5:	e8 9e fd ff ff       	call   c0008158 <disp_int>
c00083ba:	83 c4 10             	add    $0x10,%esp
c00083bd:	83 ec 0c             	sub    $0xc,%esp
c00083c0:	68 bb bc 00 c0       	push   $0xc000bcbb
c00083c5:	e8 c2 91 ff ff       	call   c000158c <disp_str>
c00083ca:	83 c4 10             	add    $0x10,%esp
c00083cd:	83 ec 0c             	sub    $0xc,%esp
c00083d0:	68 d4 bc 00 c0       	push   $0xc000bcd4
c00083d5:	e8 b2 91 ff ff       	call   c000158c <disp_str>
c00083da:	83 c4 10             	add    $0x10,%esp
c00083dd:	8b 45 10             	mov    0x10(%ebp),%eax
c00083e0:	83 ec 0c             	sub    $0xc,%esp
c00083e3:	50                   	push   %eax
c00083e4:	e8 6f fd ff ff       	call   c0008158 <disp_int>
c00083e9:	83 c4 10             	add    $0x10,%esp
c00083ec:	83 ec 0c             	sub    $0xc,%esp
c00083ef:	68 bb bc 00 c0       	push   $0xc000bcbb
c00083f4:	e8 93 91 ff ff       	call   c000158c <disp_str>
c00083f9:	83 c4 10             	add    $0x10,%esp
c00083fc:	83 ec 0c             	sub    $0xc,%esp
c00083ff:	68 d9 bc 00 c0       	push   $0xc000bcd9
c0008404:	e8 83 91 ff ff       	call   c000158c <disp_str>
c0008409:	83 c4 10             	add    $0x10,%esp
c000840c:	83 ec 0c             	sub    $0xc,%esp
c000840f:	ff 75 18             	pushl  0x18(%ebp)
c0008412:	e8 41 fd ff ff       	call   c0008158 <disp_int>
c0008417:	83 c4 10             	add    $0x10,%esp
c000841a:	83 ec 0c             	sub    $0xc,%esp
c000841d:	68 bb bc 00 c0       	push   $0xc000bcbb
c0008422:	e8 65 91 ff ff       	call   c000158c <disp_str>
c0008427:	83 c4 10             	add    $0x10,%esp
c000842a:	83 ec 0c             	sub    $0xc,%esp
c000842d:	68 e4 bc 00 c0       	push   $0xc000bce4
c0008432:	e8 55 91 ff ff       	call   c000158c <disp_str>
c0008437:	83 c4 10             	add    $0x10,%esp
c000843a:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c000843e:	75 45                	jne    c0008485 <exception_handler+0x1c7>
c0008440:	0f 20 d0             	mov    %cr2,%eax
c0008443:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008446:	83 ec 0c             	sub    $0xc,%esp
c0008449:	68 03 bd 00 c0       	push   $0xc000bd03
c000844e:	e8 39 91 ff ff       	call   c000158c <disp_str>
c0008453:	83 c4 10             	add    $0x10,%esp
c0008456:	83 ec 0c             	sub    $0xc,%esp
c0008459:	68 8a bc 00 c0       	push   $0xc000bc8a
c000845e:	e8 29 91 ff ff       	call   c000158c <disp_str>
c0008463:	83 c4 10             	add    $0x10,%esp
c0008466:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008469:	83 ec 0c             	sub    $0xc,%esp
c000846c:	50                   	push   %eax
c000846d:	e8 e6 fc ff ff       	call   c0008158 <disp_int>
c0008472:	83 c4 10             	add    $0x10,%esp
c0008475:	83 ec 0c             	sub    $0xc,%esp
c0008478:	68 8f bc 00 c0       	push   $0xc000bc8f
c000847d:	e8 0a 91 ff ff       	call   c000158c <disp_str>
c0008482:	83 c4 10             	add    $0x10,%esp
c0008485:	83 7d 08 0d          	cmpl   $0xd,0x8(%ebp)
c0008489:	75 11                	jne    c000849c <exception_handler+0x1de>
c000848b:	83 ec 0c             	sub    $0xc,%esp
c000848e:	68 0f bd 00 c0       	push   $0xc000bd0f
c0008493:	e8 f4 90 ff ff       	call   c000158c <disp_str>
c0008498:	83 c4 10             	add    $0x10,%esp
c000849b:	90                   	nop
c000849c:	90                   	nop
c000849d:	8d 65 f4             	lea    -0xc(%ebp),%esp
c00084a0:	5b                   	pop    %ebx
c00084a1:	5e                   	pop    %esi
c00084a2:	5f                   	pop    %edi
c00084a3:	5d                   	pop    %ebp
c00084a4:	c3                   	ret    

c00084a5 <exception_handler2>:
c00084a5:	55                   	push   %ebp
c00084a6:	89 e5                	mov    %esp,%ebp
c00084a8:	57                   	push   %edi
c00084a9:	56                   	push   %esi
c00084aa:	53                   	push   %ebx
c00084ab:	83 ec 6c             	sub    $0x6c,%esp
c00084ae:	8d 45 90             	lea    -0x70(%ebp),%eax
c00084b1:	bb 20 bf 00 c0       	mov    $0xc000bf20,%ebx
c00084b6:	ba 13 00 00 00       	mov    $0x13,%edx
c00084bb:	89 c7                	mov    %eax,%edi
c00084bd:	89 de                	mov    %ebx,%esi
c00084bf:	89 d1                	mov    %edx,%ecx
c00084c1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00084c3:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c00084ca:	2e 00 00 
c00084cd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00084d4:	eb 14                	jmp    c00084ea <exception_handler2+0x45>
c00084d6:	83 ec 0c             	sub    $0xc,%esp
c00084d9:	68 6c bf 00 c0       	push   $0xc000bf6c
c00084de:	e8 a9 90 ff ff       	call   c000158c <disp_str>
c00084e3:	83 c4 10             	add    $0x10,%esp
c00084e6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00084ea:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c00084f1:	7e e3                	jle    c00084d6 <exception_handler2+0x31>
c00084f3:	c7 05 a0 07 01 c0 6a 	movl   $0x2e6a,0xc00107a0
c00084fa:	2e 00 00 
c00084fd:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0008504:	8b 45 08             	mov    0x8(%ebp),%eax
c0008507:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c000850b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000850e:	83 ec 08             	sub    $0x8,%esp
c0008511:	ff 75 e0             	pushl  -0x20(%ebp)
c0008514:	ff 75 dc             	pushl  -0x24(%ebp)
c0008517:	e8 ab 90 ff ff       	call   c00015c7 <disp_str_colour>
c000851c:	83 c4 10             	add    $0x10,%esp
c000851f:	83 ec 0c             	sub    $0xc,%esp
c0008522:	68 bb bc 00 c0       	push   $0xc000bcbb
c0008527:	e8 60 90 ff ff       	call   c000158c <disp_str>
c000852c:	83 c4 10             	add    $0x10,%esp
c000852f:	83 ec 08             	sub    $0x8,%esp
c0008532:	ff 75 e0             	pushl  -0x20(%ebp)
c0008535:	68 be bc 00 c0       	push   $0xc000bcbe
c000853a:	e8 88 90 ff ff       	call   c00015c7 <disp_str_colour>
c000853f:	83 c4 10             	add    $0x10,%esp
c0008542:	83 ec 0c             	sub    $0xc,%esp
c0008545:	ff 75 08             	pushl  0x8(%ebp)
c0008548:	e8 0b fc ff ff       	call   c0008158 <disp_int>
c000854d:	83 c4 10             	add    $0x10,%esp
c0008550:	83 ec 0c             	sub    $0xc,%esp
c0008553:	68 bb bc 00 c0       	push   $0xc000bcbb
c0008558:	e8 2f 90 ff ff       	call   c000158c <disp_str>
c000855d:	83 c4 10             	add    $0x10,%esp
c0008560:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0008564:	74 44                	je     c00085aa <exception_handler2+0x105>
c0008566:	83 ec 08             	sub    $0x8,%esp
c0008569:	ff 75 e0             	pushl  -0x20(%ebp)
c000856c:	68 c6 bc 00 c0       	push   $0xc000bcc6
c0008571:	e8 51 90 ff ff       	call   c00015c7 <disp_str_colour>
c0008576:	83 c4 10             	add    $0x10,%esp
c0008579:	83 ec 08             	sub    $0x8,%esp
c000857c:	ff 75 e0             	pushl  -0x20(%ebp)
c000857f:	68 c6 bc 00 c0       	push   $0xc000bcc6
c0008584:	e8 3e 90 ff ff       	call   c00015c7 <disp_str_colour>
c0008589:	83 c4 10             	add    $0x10,%esp
c000858c:	83 ec 0c             	sub    $0xc,%esp
c000858f:	ff 75 0c             	pushl  0xc(%ebp)
c0008592:	e8 c1 fb ff ff       	call   c0008158 <disp_int>
c0008597:	83 c4 10             	add    $0x10,%esp
c000859a:	83 ec 0c             	sub    $0xc,%esp
c000859d:	68 bb bc 00 c0       	push   $0xc000bcbb
c00085a2:	e8 e5 8f ff ff       	call   c000158c <disp_str>
c00085a7:	83 c4 10             	add    $0x10,%esp
c00085aa:	83 ec 08             	sub    $0x8,%esp
c00085ad:	ff 75 e0             	pushl  -0x20(%ebp)
c00085b0:	68 d0 bc 00 c0       	push   $0xc000bcd0
c00085b5:	e8 0d 90 ff ff       	call   c00015c7 <disp_str_colour>
c00085ba:	83 c4 10             	add    $0x10,%esp
c00085bd:	83 ec 0c             	sub    $0xc,%esp
c00085c0:	ff 75 14             	pushl  0x14(%ebp)
c00085c3:	e8 90 fb ff ff       	call   c0008158 <disp_int>
c00085c8:	83 c4 10             	add    $0x10,%esp
c00085cb:	83 ec 0c             	sub    $0xc,%esp
c00085ce:	68 bb bc 00 c0       	push   $0xc000bcbb
c00085d3:	e8 b4 8f ff ff       	call   c000158c <disp_str>
c00085d8:	83 c4 10             	add    $0x10,%esp
c00085db:	83 ec 08             	sub    $0x8,%esp
c00085de:	ff 75 e0             	pushl  -0x20(%ebp)
c00085e1:	68 d4 bc 00 c0       	push   $0xc000bcd4
c00085e6:	e8 dc 8f ff ff       	call   c00015c7 <disp_str_colour>
c00085eb:	83 c4 10             	add    $0x10,%esp
c00085ee:	83 ec 0c             	sub    $0xc,%esp
c00085f1:	ff 75 10             	pushl  0x10(%ebp)
c00085f4:	e8 5f fb ff ff       	call   c0008158 <disp_int>
c00085f9:	83 c4 10             	add    $0x10,%esp
c00085fc:	83 ec 0c             	sub    $0xc,%esp
c00085ff:	68 bb bc 00 c0       	push   $0xc000bcbb
c0008604:	e8 83 8f ff ff       	call   c000158c <disp_str>
c0008609:	83 c4 10             	add    $0x10,%esp
c000860c:	83 ec 08             	sub    $0x8,%esp
c000860f:	ff 75 e0             	pushl  -0x20(%ebp)
c0008612:	68 d9 bc 00 c0       	push   $0xc000bcd9
c0008617:	e8 ab 8f ff ff       	call   c00015c7 <disp_str_colour>
c000861c:	83 c4 10             	add    $0x10,%esp
c000861f:	83 ec 0c             	sub    $0xc,%esp
c0008622:	ff 75 18             	pushl  0x18(%ebp)
c0008625:	e8 2e fb ff ff       	call   c0008158 <disp_int>
c000862a:	83 c4 10             	add    $0x10,%esp
c000862d:	83 ec 0c             	sub    $0xc,%esp
c0008630:	68 bb bc 00 c0       	push   $0xc000bcbb
c0008635:	e8 52 8f ff ff       	call   c000158c <disp_str>
c000863a:	83 c4 10             	add    $0x10,%esp
c000863d:	90                   	nop
c000863e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0008641:	5b                   	pop    %ebx
c0008642:	5e                   	pop    %esi
c0008643:	5f                   	pop    %edi
c0008644:	5d                   	pop    %ebp
c0008645:	c3                   	ret    

c0008646 <init_internal_interrupt>:
c0008646:	55                   	push   %ebp
c0008647:	89 e5                	mov    %esp,%ebp
c0008649:	83 ec 08             	sub    $0x8,%esp
c000864c:	6a 0e                	push   $0xe
c000864e:	6a 08                	push   $0x8
c0008650:	68 03 16 00 c0       	push   $0xc0001603
c0008655:	6a 00                	push   $0x0
c0008657:	e8 6c c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c000865c:	83 c4 10             	add    $0x10,%esp
c000865f:	6a 0e                	push   $0xe
c0008661:	6a 08                	push   $0x8
c0008663:	68 09 16 00 c0       	push   $0xc0001609
c0008668:	6a 01                	push   $0x1
c000866a:	e8 59 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c000866f:	83 c4 10             	add    $0x10,%esp
c0008672:	6a 0e                	push   $0xe
c0008674:	6a 08                	push   $0x8
c0008676:	68 0f 16 00 c0       	push   $0xc000160f
c000867b:	6a 02                	push   $0x2
c000867d:	e8 46 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008682:	83 c4 10             	add    $0x10,%esp
c0008685:	6a 0e                	push   $0xe
c0008687:	6a 08                	push   $0x8
c0008689:	68 15 16 00 c0       	push   $0xc0001615
c000868e:	6a 03                	push   $0x3
c0008690:	e8 33 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008695:	83 c4 10             	add    $0x10,%esp
c0008698:	6a 0e                	push   $0xe
c000869a:	6a 08                	push   $0x8
c000869c:	68 1b 16 00 c0       	push   $0xc000161b
c00086a1:	6a 04                	push   $0x4
c00086a3:	e8 20 c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086a8:	83 c4 10             	add    $0x10,%esp
c00086ab:	6a 0e                	push   $0xe
c00086ad:	6a 08                	push   $0x8
c00086af:	68 21 16 00 c0       	push   $0xc0001621
c00086b4:	6a 05                	push   $0x5
c00086b6:	e8 0d c8 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086bb:	83 c4 10             	add    $0x10,%esp
c00086be:	6a 0e                	push   $0xe
c00086c0:	6a 08                	push   $0x8
c00086c2:	68 27 16 00 c0       	push   $0xc0001627
c00086c7:	6a 06                	push   $0x6
c00086c9:	e8 fa c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086ce:	83 c4 10             	add    $0x10,%esp
c00086d1:	6a 0e                	push   $0xe
c00086d3:	6a 08                	push   $0x8
c00086d5:	68 2d 16 00 c0       	push   $0xc000162d
c00086da:	6a 07                	push   $0x7
c00086dc:	e8 e7 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086e1:	83 c4 10             	add    $0x10,%esp
c00086e4:	6a 0e                	push   $0xe
c00086e6:	6a 08                	push   $0x8
c00086e8:	68 33 16 00 c0       	push   $0xc0001633
c00086ed:	6a 08                	push   $0x8
c00086ef:	e8 d4 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00086f4:	83 c4 10             	add    $0x10,%esp
c00086f7:	6a 0e                	push   $0xe
c00086f9:	6a 08                	push   $0x8
c00086fb:	68 37 16 00 c0       	push   $0xc0001637
c0008700:	6a 09                	push   $0x9
c0008702:	e8 c1 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008707:	83 c4 10             	add    $0x10,%esp
c000870a:	6a 0e                	push   $0xe
c000870c:	6a 08                	push   $0x8
c000870e:	68 3d 16 00 c0       	push   $0xc000163d
c0008713:	6a 0a                	push   $0xa
c0008715:	e8 ae c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c000871a:	83 c4 10             	add    $0x10,%esp
c000871d:	6a 0e                	push   $0xe
c000871f:	6a 08                	push   $0x8
c0008721:	68 41 16 00 c0       	push   $0xc0001641
c0008726:	6a 0b                	push   $0xb
c0008728:	e8 9b c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c000872d:	83 c4 10             	add    $0x10,%esp
c0008730:	6a 0e                	push   $0xe
c0008732:	6a 08                	push   $0x8
c0008734:	68 45 16 00 c0       	push   $0xc0001645
c0008739:	6a 0c                	push   $0xc
c000873b:	e8 88 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008740:	83 c4 10             	add    $0x10,%esp
c0008743:	6a 0e                	push   $0xe
c0008745:	6a 08                	push   $0x8
c0008747:	68 49 16 00 c0       	push   $0xc0001649
c000874c:	6a 0d                	push   $0xd
c000874e:	e8 75 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008753:	83 c4 10             	add    $0x10,%esp
c0008756:	6a 0e                	push   $0xe
c0008758:	6a 08                	push   $0x8
c000875a:	68 54 16 00 c0       	push   $0xc0001654
c000875f:	6a 0e                	push   $0xe
c0008761:	e8 62 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008766:	83 c4 10             	add    $0x10,%esp
c0008769:	6a 0e                	push   $0xe
c000876b:	6a 08                	push   $0x8
c000876d:	68 58 16 00 c0       	push   $0xc0001658
c0008772:	6a 10                	push   $0x10
c0008774:	e8 4f c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c0008779:	83 c4 10             	add    $0x10,%esp
c000877c:	6a 0e                	push   $0xe
c000877e:	6a 08                	push   $0x8
c0008780:	68 5e 16 00 c0       	push   $0xc000165e
c0008785:	6a 11                	push   $0x11
c0008787:	e8 3c c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c000878c:	83 c4 10             	add    $0x10,%esp
c000878f:	6a 0e                	push   $0xe
c0008791:	6a 08                	push   $0x8
c0008793:	68 62 16 00 c0       	push   $0xc0001662
c0008798:	6a 12                	push   $0x12
c000879a:	e8 29 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c000879f:	83 c4 10             	add    $0x10,%esp
c00087a2:	6a 0e                	push   $0xe
c00087a4:	6a 0e                	push   $0xe
c00087a6:	68 1e 17 00 c0       	push   $0xc000171e
c00087ab:	68 90 00 00 00       	push   $0x90
c00087b0:	e8 13 c7 ff ff       	call   c0004ec8 <InitInterruptDesc>
c00087b5:	83 c4 10             	add    $0x10,%esp
c00087b8:	90                   	nop
c00087b9:	c9                   	leave  
c00087ba:	c3                   	ret    

c00087bb <test>:
c00087bb:	55                   	push   %ebp
c00087bc:	89 e5                	mov    %esp,%ebp
c00087be:	83 ec 08             	sub    $0x8,%esp
c00087c1:	83 ec 0c             	sub    $0xc,%esp
c00087c4:	68 6e bf 00 c0       	push   $0xc000bf6e
c00087c9:	e8 be 8d ff ff       	call   c000158c <disp_str>
c00087ce:	83 c4 10             	add    $0x10,%esp
c00087d1:	83 ec 0c             	sub    $0xc,%esp
c00087d4:	68 8f bc 00 c0       	push   $0xc000bc8f
c00087d9:	e8 ae 8d ff ff       	call   c000158c <disp_str>
c00087de:	83 c4 10             	add    $0x10,%esp
c00087e1:	90                   	nop
c00087e2:	c9                   	leave  
c00087e3:	c3                   	ret    

c00087e4 <disp_str_colour3>:
c00087e4:	55                   	push   %ebp
c00087e5:	89 e5                	mov    %esp,%ebp
c00087e7:	90                   	nop
c00087e8:	5d                   	pop    %ebp
c00087e9:	c3                   	ret    

c00087ea <spurious_irq>:
c00087ea:	55                   	push   %ebp
c00087eb:	89 e5                	mov    %esp,%ebp
c00087ed:	83 ec 08             	sub    $0x8,%esp
c00087f0:	83 ec 08             	sub    $0x8,%esp
c00087f3:	6a 0b                	push   $0xb
c00087f5:	68 70 bf 00 c0       	push   $0xc000bf70
c00087fa:	e8 c8 8d ff ff       	call   c00015c7 <disp_str_colour>
c00087ff:	83 c4 10             	add    $0x10,%esp
c0008802:	83 ec 0c             	sub    $0xc,%esp
c0008805:	ff 75 08             	pushl  0x8(%ebp)
c0008808:	e8 4b f9 ff ff       	call   c0008158 <disp_int>
c000880d:	83 c4 10             	add    $0x10,%esp
c0008810:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008815:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c000881b:	83 c0 01             	add    $0x1,%eax
c000881e:	83 d2 00             	adc    $0x0,%edx
c0008821:	a3 e8 1e 01 c0       	mov    %eax,0xc0011ee8
c0008826:	89 15 ec 1e 01 c0    	mov    %edx,0xc0011eec
c000882c:	83 ec 0c             	sub    $0xc,%esp
c000882f:	68 97 bf 00 c0       	push   $0xc000bf97
c0008834:	e8 53 8d ff ff       	call   c000158c <disp_str>
c0008839:	83 c4 10             	add    $0x10,%esp
c000883c:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c0008841:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0008847:	83 ec 0c             	sub    $0xc,%esp
c000884a:	50                   	push   %eax
c000884b:	e8 08 f9 ff ff       	call   c0008158 <disp_int>
c0008850:	83 c4 10             	add    $0x10,%esp
c0008853:	83 ec 0c             	sub    $0xc,%esp
c0008856:	68 99 bf 00 c0       	push   $0xc000bf99
c000885b:	e8 2c 8d ff ff       	call   c000158c <disp_str>
c0008860:	83 c4 10             	add    $0x10,%esp
c0008863:	83 ec 08             	sub    $0x8,%esp
c0008866:	6a 0c                	push   $0xc
c0008868:	68 9c bf 00 c0       	push   $0xc000bf9c
c000886d:	e8 55 8d ff ff       	call   c00015c7 <disp_str_colour>
c0008872:	83 c4 10             	add    $0x10,%esp
c0008875:	90                   	nop
c0008876:	c9                   	leave  
c0008877:	c3                   	ret    

c0008878 <init_keyboard>:
c0008878:	55                   	push   %ebp
c0008879:	89 e5                	mov    %esp,%ebp
c000887b:	83 ec 18             	sub    $0x18,%esp
c000887e:	83 ec 04             	sub    $0x4,%esp
c0008881:	68 00 02 00 00       	push   $0x200
c0008886:	6a 00                	push   $0x0
c0008888:	68 ec 0b 01 c0       	push   $0xc0010bec
c000888d:	e8 f9 3b 00 00       	call   c000c48b <Memset>
c0008892:	83 c4 10             	add    $0x10,%esp
c0008895:	c7 05 e0 0b 01 c0 ec 	movl   $0xc0010bec,0xc0010be0
c000889c:	0b 01 c0 
c000889f:	a1 e0 0b 01 c0       	mov    0xc0010be0,%eax
c00088a4:	a3 e4 0b 01 c0       	mov    %eax,0xc0010be4
c00088a9:	c7 05 e8 0b 01 c0 00 	movl   $0x0,0xc0010be8
c00088b0:	00 00 00 
c00088b3:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00088ba:	00 00 00 
c00088bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00088c4:	eb 04                	jmp    c00088ca <init_keyboard+0x52>
c00088c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00088ca:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00088d1:	7e f3                	jle    c00088c6 <init_keyboard+0x4e>
c00088d3:	c7 05 a0 07 01 c0 00 	movl   $0x0,0xc00107a0
c00088da:	00 00 00 
c00088dd:	e8 f0 d3 ff ff       	call   c0005cd2 <init_keyboard_handler>
c00088e2:	90                   	nop
c00088e3:	c9                   	leave  
c00088e4:	c3                   	ret    

c00088e5 <init2>:
c00088e5:	55                   	push   %ebp
c00088e6:	89 e5                	mov    %esp,%ebp
c00088e8:	83 ec 08             	sub    $0x8,%esp
c00088eb:	83 ec 0c             	sub    $0xc,%esp
c00088ee:	68 c1 bf 00 c0       	push   $0xc000bfc1
c00088f3:	e8 94 8c ff ff       	call   c000158c <disp_str>
c00088f8:	83 c4 10             	add    $0x10,%esp
c00088fb:	e8 78 ff ff ff       	call   c0008878 <init_keyboard>
c0008900:	83 ec 0c             	sub    $0xc,%esp
c0008903:	68 00 00 00 02       	push   $0x2000000
c0008908:	e8 8c f2 ff ff       	call   c0007b99 <init_memory>
c000890d:	83 c4 10             	add    $0x10,%esp
c0008910:	90                   	nop
c0008911:	c9                   	leave  
c0008912:	c3                   	ret    

c0008913 <u_thread_a>:
c0008913:	55                   	push   %ebp
c0008914:	89 e5                	mov    %esp,%ebp
c0008916:	83 ec 08             	sub    $0x8,%esp
c0008919:	83 ec 0c             	sub    $0xc,%esp
c000891c:	68 c7 bf 00 c0       	push   $0xc000bfc7
c0008921:	e8 66 8c ff ff       	call   c000158c <disp_str>
c0008926:	83 c4 10             	add    $0x10,%esp
c0008929:	eb fe                	jmp    c0008929 <u_thread_a+0x16>

c000892b <kernel_main2>:
c000892b:	55                   	push   %ebp
c000892c:	89 e5                	mov    %esp,%ebp
c000892e:	57                   	push   %edi
c000892f:	56                   	push   %esi
c0008930:	53                   	push   %ebx
c0008931:	83 ec 3c             	sub    $0x3c,%esp
c0008934:	83 ec 0c             	sub    $0xc,%esp
c0008937:	68 d5 bf 00 c0       	push   $0xc000bfd5
c000893c:	e8 4b 8c ff ff       	call   c000158c <disp_str>
c0008941:	83 c4 10             	add    $0x10,%esp
c0008944:	e8 37 90 ff ff       	call   c0001980 <init>
c0008949:	c7 05 e8 1e 01 c0 00 	movl   $0x0,0xc0011ee8
c0008950:	00 00 00 
c0008953:	c7 05 ec 1e 01 c0 00 	movl   $0x0,0xc0011eec
c000895a:	00 00 00 
c000895d:	c7 05 bc 16 01 c0 00 	movl   $0x0,0xc00116bc
c0008964:	00 00 00 
c0008967:	c7 05 a4 07 01 c0 00 	movl   $0x0,0xc00107a4
c000896e:	00 00 00 
c0008971:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c0008978:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000897f:	e9 01 02 00 00       	jmp    c0008b85 <kernel_main2+0x25a>
c0008984:	83 ec 08             	sub    $0x8,%esp
c0008987:	6a 00                	push   $0x0
c0008989:	6a 01                	push   $0x1
c000898b:	e8 25 e9 ff ff       	call   c00072b5 <alloc_memory>
c0008990:	83 c4 10             	add    $0x10,%esp
c0008993:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008996:	83 ec 04             	sub    $0x4,%esp
c0008999:	68 b4 02 00 00       	push   $0x2b4
c000899e:	6a 00                	push   $0x0
c00089a0:	ff 75 d8             	pushl  -0x28(%ebp)
c00089a3:	e8 e3 3a 00 00       	call   c000c48b <Memset>
c00089a8:	83 c4 10             	add    $0x10,%esp
c00089ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089ae:	05 00 10 00 00       	add    $0x1000,%eax
c00089b3:	89 c2                	mov    %eax,%edx
c00089b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089b8:	89 10                	mov    %edx,(%eax)
c00089ba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089bd:	66 c7 80 10 01 00 00 	movw   $0x0,0x110(%eax)
c00089c4:	00 00 
c00089c6:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00089c9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089cc:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c00089d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089d5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00089dc:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c00089e0:	7e 0f                	jle    c00089f1 <kernel_main2+0xc6>
c00089e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089e5:	c6 80 48 02 00 00 ff 	movb   $0xff,0x248(%eax)
c00089ec:	e9 90 01 00 00       	jmp    c0008b81 <kernel_main2+0x256>
c00089f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00089f4:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c00089fb:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c00089ff:	7f 73                	jg     c0008a74 <kernel_main2+0x149>
c0008a01:	c7 45 e4 20 f0 00 c0 	movl   $0xc000f020,-0x1c(%ebp)
c0008a08:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c0008a0f:	c7 45 d0 2c 00 00 00 	movl   $0x2c,-0x30(%ebp)
c0008a16:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a19:	8b 00                	mov    (%eax),%eax
c0008a1b:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c0008a1e:	89 c2                	mov    %eax,%edx
c0008a20:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a23:	89 10                	mov    %edx,(%eax)
c0008a25:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a28:	8b 00                	mov    (%eax),%eax
c0008a2a:	2b 45 d0             	sub    -0x30(%ebp),%eax
c0008a2d:	89 c2                	mov    %eax,%edx
c0008a2f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a32:	89 10                	mov    %edx,(%eax)
c0008a34:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008a37:	8b 00                	mov    (%eax),%eax
c0008a39:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008a3c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008a3f:	8b 50 14             	mov    0x14(%eax),%edx
c0008a42:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008a45:	89 50 28             	mov    %edx,0x28(%eax)
c0008a48:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008a4b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0008a51:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008a54:	8b 10                	mov    (%eax),%edx
c0008a56:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008a59:	89 50 04             	mov    %edx,0x4(%eax)
c0008a5c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008a5f:	8b 50 04             	mov    0x4(%eax),%edx
c0008a62:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008a65:	89 50 08             	mov    %edx,0x8(%eax)
c0008a68:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008a6b:	8b 50 08             	mov    0x8(%eax),%edx
c0008a6e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008a71:	89 50 0c             	mov    %edx,0xc(%eax)
c0008a74:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008a77:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0008a7a:	81 c2 34 01 00 00    	add    $0x134,%edx
c0008a80:	83 ec 08             	sub    $0x8,%esp
c0008a83:	50                   	push   %eax
c0008a84:	52                   	push   %edx
c0008a85:	e8 20 3a 00 00       	call   c000c4aa <Strcpy>
c0008a8a:	83 c4 10             	add    $0x10,%esp
c0008a8d:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008a91:	83 c8 04             	or     $0x4,%eax
c0008a94:	0f b6 c0             	movzbl %al,%eax
c0008a97:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c0008a9b:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008a9f:	83 c8 0c             	or     $0xc,%eax
c0008aa2:	0f b6 c0             	movzbl %al,%eax
c0008aa5:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c0008aa9:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c0008aad:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008ab0:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c0008ab6:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008aba:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008abd:	89 90 78 02 00 00    	mov    %edx,0x278(%eax)
c0008ac3:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008ac7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008aca:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c0008ad0:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008ad4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008ad7:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c0008add:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008ae1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008ae4:	89 90 ac 02 00 00    	mov    %edx,0x2ac(%eax)
c0008aea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008aed:	c7 80 6c 02 00 00 39 	movl   $0x39,0x26c(%eax)
c0008af4:	00 00 00 
c0008af7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008afa:	8b 50 14             	mov    0x14(%eax),%edx
c0008afd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b00:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008b06:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b09:	8b 55 c0             	mov    -0x40(%ebp),%edx
c0008b0c:	89 90 a4 02 00 00    	mov    %edx,0x2a4(%eax)
c0008b12:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b15:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c0008b1c:	00 00 00 
c0008b1f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b22:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0008b29:	00 00 00 
c0008b2c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b2f:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0008b36:	00 00 00 
c0008b39:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b3c:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0008b43:	00 00 00 
c0008b46:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b49:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0008b50:	00 00 00 
c0008b53:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b56:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0008b5d:	00 00 00 
c0008b60:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008b63:	69 c0 b4 02 00 00    	imul   $0x2b4,%eax,%eax
c0008b69:	8d 90 00 32 08 c0    	lea    -0x3ff7ce00(%eax),%edx
c0008b6f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008b72:	89 c3                	mov    %eax,%ebx
c0008b74:	b8 ad 00 00 00       	mov    $0xad,%eax
c0008b79:	89 d7                	mov    %edx,%edi
c0008b7b:	89 de                	mov    %ebx,%esi
c0008b7d:	89 c1                	mov    %eax,%ecx
c0008b7f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008b81:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008b85:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c0008b89:	0f 8e f5 fd ff ff    	jle    c0008984 <kernel_main2+0x59>
c0008b8f:	c7 05 c0 0b 01 c0 00 	movl   $0xc0083200,0xc0010bc0
c0008b96:	32 08 c0 
c0008b99:	eb fe                	jmp    c0008b99 <kernel_main2+0x26e>

c0008b9b <TestTTY>:
c0008b9b:	55                   	push   %ebp
c0008b9c:	89 e5                	mov    %esp,%ebp
c0008b9e:	83 ec 28             	sub    $0x28,%esp
c0008ba1:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008ba8:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008baf:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008bb5:	83 ec 08             	sub    $0x8,%esp
c0008bb8:	6a 02                	push   $0x2
c0008bba:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008bbd:	50                   	push   %eax
c0008bbe:	e8 b5 d2 ff ff       	call   c0005e78 <open>
c0008bc3:	83 c4 10             	add    $0x10,%esp
c0008bc6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008bc9:	83 ec 08             	sub    $0x8,%esp
c0008bcc:	6a 02                	push   $0x2
c0008bce:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008bd1:	50                   	push   %eax
c0008bd2:	e8 a1 d2 ff ff       	call   c0005e78 <open>
c0008bd7:	83 c4 10             	add    $0x10,%esp
c0008bda:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008bdd:	83 ec 0c             	sub    $0xc,%esp
c0008be0:	68 e1 bf 00 c0       	push   $0xc000bfe1
c0008be5:	e8 0d 0e 00 00       	call   c00099f7 <Printf>
c0008bea:	83 c4 10             	add    $0x10,%esp
c0008bed:	83 ec 0c             	sub    $0xc,%esp
c0008bf0:	6a 0a                	push   $0xa
c0008bf2:	e8 ad 9d ff ff       	call   c00029a4 <sys_malloc>
c0008bf7:	83 c4 10             	add    $0x10,%esp
c0008bfa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008bfd:	83 ec 04             	sub    $0x4,%esp
c0008c00:	6a 0a                	push   $0xa
c0008c02:	6a 00                	push   $0x0
c0008c04:	ff 75 ec             	pushl  -0x14(%ebp)
c0008c07:	e8 7f 38 00 00       	call   c000c48b <Memset>
c0008c0c:	83 c4 10             	add    $0x10,%esp
c0008c0f:	83 ec 04             	sub    $0x4,%esp
c0008c12:	6a 0a                	push   $0xa
c0008c14:	ff 75 ec             	pushl  -0x14(%ebp)
c0008c17:	ff 75 f0             	pushl  -0x10(%ebp)
c0008c1a:	e8 de d2 ff ff       	call   c0005efd <read>
c0008c1f:	83 c4 10             	add    $0x10,%esp
c0008c22:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008c25:	83 ec 08             	sub    $0x8,%esp
c0008c28:	ff 75 ec             	pushl  -0x14(%ebp)
c0008c2b:	68 f3 bf 00 c0       	push   $0xc000bff3
c0008c30:	e8 c2 0d 00 00       	call   c00099f7 <Printf>
c0008c35:	83 c4 10             	add    $0x10,%esp
c0008c38:	eb c3                	jmp    c0008bfd <TestTTY+0x62>

c0008c3a <TestFS>:
c0008c3a:	55                   	push   %ebp
c0008c3b:	89 e5                	mov    %esp,%ebp
c0008c3d:	81 ec 28 01 00 00    	sub    $0x128,%esp
c0008c43:	83 ec 0c             	sub    $0xc,%esp
c0008c46:	68 fd bf 00 c0       	push   $0xc000bffd
c0008c4b:	e8 3c 89 ff ff       	call   c000158c <disp_str>
c0008c50:	83 c4 10             	add    $0x10,%esp
c0008c53:	c7 45 be 64 65 76 5f 	movl   $0x5f766564,-0x42(%ebp)
c0008c5a:	c7 45 c2 74 74 79 31 	movl   $0x31797474,-0x3e(%ebp)
c0008c61:	66 c7 45 c6 00 00    	movw   $0x0,-0x3a(%ebp)
c0008c67:	66 87 db             	xchg   %bx,%bx
c0008c6a:	83 ec 08             	sub    $0x8,%esp
c0008c6d:	6a 02                	push   $0x2
c0008c6f:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008c72:	50                   	push   %eax
c0008c73:	e8 00 d2 ff ff       	call   c0005e78 <open>
c0008c78:	83 c4 10             	add    $0x10,%esp
c0008c7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008c7e:	66 87 db             	xchg   %bx,%bx
c0008c81:	83 ec 08             	sub    $0x8,%esp
c0008c84:	6a 02                	push   $0x2
c0008c86:	8d 45 be             	lea    -0x42(%ebp),%eax
c0008c89:	50                   	push   %eax
c0008c8a:	e8 e9 d1 ff ff       	call   c0005e78 <open>
c0008c8f:	83 c4 10             	add    $0x10,%esp
c0008c92:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008c95:	66 87 db             	xchg   %bx,%bx
c0008c98:	83 ec 0c             	sub    $0xc,%esp
c0008c9b:	68 e1 bf 00 c0       	push   $0xc000bfe1
c0008ca0:	e8 52 0d 00 00       	call   c00099f7 <Printf>
c0008ca5:	83 c4 10             	add    $0x10,%esp
c0008ca8:	66 87 db             	xchg   %bx,%bx
c0008cab:	c7 45 b9 41 43 00 00 	movl   $0x4341,-0x47(%ebp)
c0008cb2:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0008cb6:	c7 45 b4 63 41 42 00 	movl   $0x424163,-0x4c(%ebp)
c0008cbd:	c6 45 b8 00          	movb   $0x0,-0x48(%ebp)
c0008cc1:	c7 45 aa 49 4e 54 45 	movl   $0x45544e49,-0x56(%ebp)
c0008cc8:	c7 45 ae 52 52 55 50 	movl   $0x50555252,-0x52(%ebp)
c0008ccf:	66 c7 45 b2 54 00    	movw   $0x54,-0x4e(%ebp)
c0008cd5:	66 87 db             	xchg   %bx,%bx
c0008cd8:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0008cdf:	66 87 db             	xchg   %bx,%bx
c0008ce2:	83 ec 0c             	sub    $0xc,%esp
c0008ce5:	68 05 c0 00 c0       	push   $0xc000c005
c0008cea:	e8 08 0d 00 00       	call   c00099f7 <Printf>
c0008cef:	83 c4 10             	add    $0x10,%esp
c0008cf2:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0008cf6:	0f 85 43 03 00 00    	jne    c000903f <TestFS+0x405>
c0008cfc:	83 ec 08             	sub    $0x8,%esp
c0008cff:	6a 07                	push   $0x7
c0008d01:	8d 45 b9             	lea    -0x47(%ebp),%eax
c0008d04:	50                   	push   %eax
c0008d05:	e8 6e d1 ff ff       	call   c0005e78 <open>
c0008d0a:	83 c4 10             	add    $0x10,%esp
c0008d0d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008d10:	83 ec 08             	sub    $0x8,%esp
c0008d13:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008d16:	68 1d c0 00 c0       	push   $0xc000c01d
c0008d1b:	e8 d7 0c 00 00       	call   c00099f7 <Printf>
c0008d20:	83 c4 10             	add    $0x10,%esp
c0008d23:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008d2a:	c7 45 96 63 67 3a 68 	movl   $0x683a6763,-0x6a(%ebp)
c0008d31:	c7 45 9a 65 6c 6c 6f 	movl   $0x6f6c6c65,-0x66(%ebp)
c0008d38:	c7 45 9e 2c 77 6f 72 	movl   $0x726f772c,-0x62(%ebp)
c0008d3f:	c7 45 a2 6c 64 21 00 	movl   $0x21646c,-0x5e(%ebp)
c0008d46:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c0008d4d:	83 ec 0c             	sub    $0xc,%esp
c0008d50:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008d53:	50                   	push   %eax
c0008d54:	e8 6b 37 00 00       	call   c000c4c4 <Strlen>
c0008d59:	83 c4 10             	add    $0x10,%esp
c0008d5c:	83 ec 04             	sub    $0x4,%esp
c0008d5f:	50                   	push   %eax
c0008d60:	8d 45 96             	lea    -0x6a(%ebp),%eax
c0008d63:	50                   	push   %eax
c0008d64:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008d67:	e8 05 d2 ff ff       	call   c0005f71 <write>
c0008d6c:	83 c4 10             	add    $0x10,%esp
c0008d6f:	83 ec 04             	sub    $0x4,%esp
c0008d72:	6a 14                	push   $0x14
c0008d74:	6a 00                	push   $0x0
c0008d76:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008d79:	50                   	push   %eax
c0008d7a:	e8 0c 37 00 00       	call   c000c48b <Memset>
c0008d7f:	83 c4 10             	add    $0x10,%esp
c0008d82:	83 ec 04             	sub    $0x4,%esp
c0008d85:	6a 12                	push   $0x12
c0008d87:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008d8a:	50                   	push   %eax
c0008d8b:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008d8e:	e8 6a d1 ff ff       	call   c0005efd <read>
c0008d93:	83 c4 10             	add    $0x10,%esp
c0008d96:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008d99:	83 ec 08             	sub    $0x8,%esp
c0008d9c:	8d 45 82             	lea    -0x7e(%ebp),%eax
c0008d9f:	50                   	push   %eax
c0008da0:	68 26 c0 00 c0       	push   $0xc000c026
c0008da5:	e8 4d 0c 00 00       	call   c00099f7 <Printf>
c0008daa:	83 c4 10             	add    $0x10,%esp
c0008dad:	66 87 db             	xchg   %bx,%bx
c0008db0:	83 ec 0c             	sub    $0xc,%esp
c0008db3:	6a 0a                	push   $0xa
c0008db5:	e8 09 0b 00 00       	call   c00098c3 <delay>
c0008dba:	83 c4 10             	add    $0x10,%esp
c0008dbd:	83 ec 08             	sub    $0x8,%esp
c0008dc0:	6a 07                	push   $0x7
c0008dc2:	8d 45 b4             	lea    -0x4c(%ebp),%eax
c0008dc5:	50                   	push   %eax
c0008dc6:	e8 ad d0 ff ff       	call   c0005e78 <open>
c0008dcb:	83 c4 10             	add    $0x10,%esp
c0008dce:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008dd1:	83 ec 08             	sub    $0x8,%esp
c0008dd4:	ff 75 dc             	pushl  -0x24(%ebp)
c0008dd7:	68 31 c0 00 c0       	push   $0xc000c031
c0008ddc:	e8 16 0c 00 00       	call   c00099f7 <Printf>
c0008de1:	83 c4 10             	add    $0x10,%esp
c0008de4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008deb:	c7 85 6e ff ff ff 63 	movl   $0x683a6763,-0x92(%ebp)
c0008df2:	67 3a 68 
c0008df5:	c7 85 72 ff ff ff 6f 	movl   $0x6120776f,-0x8e(%ebp)
c0008dfc:	77 20 61 
c0008dff:	c7 85 76 ff ff ff 72 	movl   $0x79206572,-0x8a(%ebp)
c0008e06:	65 20 79 
c0008e09:	c7 85 7a ff ff ff 6f 	movl   $0x3f756f,-0x86(%ebp)
c0008e10:	75 3f 00 
c0008e13:	c7 85 7e ff ff ff 00 	movl   $0x0,-0x82(%ebp)
c0008e1a:	00 00 00 
c0008e1d:	83 ec 0c             	sub    $0xc,%esp
c0008e20:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008e26:	50                   	push   %eax
c0008e27:	e8 98 36 00 00       	call   c000c4c4 <Strlen>
c0008e2c:	83 c4 10             	add    $0x10,%esp
c0008e2f:	83 ec 04             	sub    $0x4,%esp
c0008e32:	50                   	push   %eax
c0008e33:	8d 85 6e ff ff ff    	lea    -0x92(%ebp),%eax
c0008e39:	50                   	push   %eax
c0008e3a:	ff 75 dc             	pushl  -0x24(%ebp)
c0008e3d:	e8 2f d1 ff ff       	call   c0005f71 <write>
c0008e42:	83 c4 10             	add    $0x10,%esp
c0008e45:	83 ec 04             	sub    $0x4,%esp
c0008e48:	6a 14                	push   $0x14
c0008e4a:	6a 00                	push   $0x0
c0008e4c:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008e52:	50                   	push   %eax
c0008e53:	e8 33 36 00 00       	call   c000c48b <Memset>
c0008e58:	83 c4 10             	add    $0x10,%esp
c0008e5b:	83 ec 04             	sub    $0x4,%esp
c0008e5e:	6a 12                	push   $0x12
c0008e60:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008e66:	50                   	push   %eax
c0008e67:	ff 75 dc             	pushl  -0x24(%ebp)
c0008e6a:	e8 8e d0 ff ff       	call   c0005efd <read>
c0008e6f:	83 c4 10             	add    $0x10,%esp
c0008e72:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008e75:	83 ec 08             	sub    $0x8,%esp
c0008e78:	8d 85 5a ff ff ff    	lea    -0xa6(%ebp),%eax
c0008e7e:	50                   	push   %eax
c0008e7f:	68 3b c0 00 c0       	push   $0xc000c03b
c0008e84:	e8 6e 0b 00 00       	call   c00099f7 <Printf>
c0008e89:	83 c4 10             	add    $0x10,%esp
c0008e8c:	83 ec 08             	sub    $0x8,%esp
c0008e8f:	6a 07                	push   $0x7
c0008e91:	8d 45 aa             	lea    -0x56(%ebp),%eax
c0008e94:	50                   	push   %eax
c0008e95:	e8 de cf ff ff       	call   c0005e78 <open>
c0008e9a:	83 c4 10             	add    $0x10,%esp
c0008e9d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0008ea0:	83 ec 08             	sub    $0x8,%esp
c0008ea3:	ff 75 dc             	pushl  -0x24(%ebp)
c0008ea6:	68 31 c0 00 c0       	push   $0xc000c031
c0008eab:	e8 47 0b 00 00       	call   c00099f7 <Printf>
c0008eb0:	83 c4 10             	add    $0x10,%esp
c0008eb3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0008eba:	c7 85 3c ff ff ff 49 	movl   $0x69772049,-0xc4(%ebp)
c0008ec1:	20 77 69 
c0008ec4:	c7 85 40 ff ff ff 6c 	movl   $0x73206c6c,-0xc0(%ebp)
c0008ecb:	6c 20 73 
c0008ece:	c7 85 44 ff ff ff 75 	movl   $0x65636375,-0xbc(%ebp)
c0008ed5:	63 63 65 
c0008ed8:	c7 85 48 ff ff ff 73 	movl   $0x61207373,-0xb8(%ebp)
c0008edf:	73 20 61 
c0008ee2:	c7 85 4c ff ff ff 74 	movl   $0x616c2074,-0xb4(%ebp)
c0008ee9:	20 6c 61 
c0008eec:	c7 85 50 ff ff ff 73 	movl   $0x2e7473,-0xb0(%ebp)
c0008ef3:	74 2e 00 
c0008ef6:	c7 85 54 ff ff ff 00 	movl   $0x0,-0xac(%ebp)
c0008efd:	00 00 00 
c0008f00:	66 c7 85 58 ff ff ff 	movw   $0x0,-0xa8(%ebp)
c0008f07:	00 00 
c0008f09:	83 ec 0c             	sub    $0xc,%esp
c0008f0c:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008f12:	50                   	push   %eax
c0008f13:	e8 ac 35 00 00       	call   c000c4c4 <Strlen>
c0008f18:	83 c4 10             	add    $0x10,%esp
c0008f1b:	83 ec 04             	sub    $0x4,%esp
c0008f1e:	50                   	push   %eax
c0008f1f:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008f25:	50                   	push   %eax
c0008f26:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008f29:	e8 43 d0 ff ff       	call   c0005f71 <write>
c0008f2e:	83 c4 10             	add    $0x10,%esp
c0008f31:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008f38:	eb 5c                	jmp    c0008f96 <TestFS+0x35c>
c0008f3a:	83 ec 04             	sub    $0x4,%esp
c0008f3d:	6a 1e                	push   $0x1e
c0008f3f:	6a 00                	push   $0x0
c0008f41:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008f47:	50                   	push   %eax
c0008f48:	e8 3e 35 00 00       	call   c000c48b <Memset>
c0008f4d:	83 c4 10             	add    $0x10,%esp
c0008f50:	83 ec 0c             	sub    $0xc,%esp
c0008f53:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008f59:	50                   	push   %eax
c0008f5a:	e8 65 35 00 00       	call   c000c4c4 <Strlen>
c0008f5f:	83 c4 10             	add    $0x10,%esp
c0008f62:	83 ec 04             	sub    $0x4,%esp
c0008f65:	50                   	push   %eax
c0008f66:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008f6c:	50                   	push   %eax
c0008f6d:	ff 75 d4             	pushl  -0x2c(%ebp)
c0008f70:	e8 88 cf ff ff       	call   c0005efd <read>
c0008f75:	83 c4 10             	add    $0x10,%esp
c0008f78:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008f7b:	83 ec 08             	sub    $0x8,%esp
c0008f7e:	8d 85 1e ff ff ff    	lea    -0xe2(%ebp),%eax
c0008f84:	50                   	push   %eax
c0008f85:	68 46 c0 00 c0       	push   $0xc000c046
c0008f8a:	e8 68 0a 00 00       	call   c00099f7 <Printf>
c0008f8f:	83 c4 10             	add    $0x10,%esp
c0008f92:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008f96:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008f9a:	7e 9e                	jle    c0008f3a <TestFS+0x300>
c0008f9c:	c7 85 0a ff ff ff 69 	movl   $0x74736e69,-0xf6(%ebp)
c0008fa3:	6e 73 74 
c0008fa6:	c7 85 0e ff ff ff 61 	movl   $0x2e6c6c61,-0xf2(%ebp)
c0008fad:	6c 6c 2e 
c0008fb0:	c7 85 12 ff ff ff 74 	movl   $0x726174,-0xee(%ebp)
c0008fb7:	61 72 00 
c0008fba:	c7 85 16 ff ff ff 00 	movl   $0x0,-0xea(%ebp)
c0008fc1:	00 00 00 
c0008fc4:	c7 85 1a ff ff ff 00 	movl   $0x0,-0xe6(%ebp)
c0008fcb:	00 00 00 
c0008fce:	83 ec 08             	sub    $0x8,%esp
c0008fd1:	6a 00                	push   $0x0
c0008fd3:	8d 85 0a ff ff ff    	lea    -0xf6(%ebp),%eax
c0008fd9:	50                   	push   %eax
c0008fda:	e8 99 ce ff ff       	call   c0005e78 <open>
c0008fdf:	83 c4 10             	add    $0x10,%esp
c0008fe2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008fe5:	83 ec 08             	sub    $0x8,%esp
c0008fe8:	ff 75 cc             	pushl  -0x34(%ebp)
c0008feb:	68 51 c0 00 c0       	push   $0xc000c051
c0008ff0:	e8 02 0a 00 00       	call   c00099f7 <Printf>
c0008ff5:	83 c4 10             	add    $0x10,%esp
c0008ff8:	83 ec 04             	sub    $0x4,%esp
c0008ffb:	6a 28                	push   $0x28
c0008ffd:	6a 00                	push   $0x0
c0008fff:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0009005:	50                   	push   %eax
c0009006:	e8 80 34 00 00       	call   c000c48b <Memset>
c000900b:	83 c4 10             	add    $0x10,%esp
c000900e:	83 ec 04             	sub    $0x4,%esp
c0009011:	6a 28                	push   $0x28
c0009013:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0009019:	50                   	push   %eax
c000901a:	ff 75 cc             	pushl  -0x34(%ebp)
c000901d:	e8 db ce ff ff       	call   c0005efd <read>
c0009022:	83 c4 10             	add    $0x10,%esp
c0009025:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009028:	83 ec 08             	sub    $0x8,%esp
c000902b:	8d 85 e2 fe ff ff    	lea    -0x11e(%ebp),%eax
c0009031:	50                   	push   %eax
c0009032:	68 5b c0 00 c0       	push   $0xc000c05b
c0009037:	e8 bb 09 00 00       	call   c00099f7 <Printf>
c000903c:	83 c4 10             	add    $0x10,%esp
c000903f:	90                   	nop
c0009040:	c9                   	leave  
c0009041:	c3                   	ret    

c0009042 <wait_exit>:
c0009042:	55                   	push   %ebp
c0009043:	89 e5                	mov    %esp,%ebp
c0009045:	83 ec 28             	sub    $0x28,%esp
c0009048:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c000904f:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0009056:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000905c:	83 ec 08             	sub    $0x8,%esp
c000905f:	6a 02                	push   $0x2
c0009061:	8d 45 de             	lea    -0x22(%ebp),%eax
c0009064:	50                   	push   %eax
c0009065:	e8 0e ce ff ff       	call   c0005e78 <open>
c000906a:	83 c4 10             	add    $0x10,%esp
c000906d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009070:	83 ec 08             	sub    $0x8,%esp
c0009073:	6a 02                	push   $0x2
c0009075:	8d 45 de             	lea    -0x22(%ebp),%eax
c0009078:	50                   	push   %eax
c0009079:	e8 fa cd ff ff       	call   c0005e78 <open>
c000907e:	83 c4 10             	add    $0x10,%esp
c0009081:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009084:	e8 21 d0 ff ff       	call   c00060aa <fork>
c0009089:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000908c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0009090:	7e 25                	jle    c00090b7 <wait_exit+0x75>
c0009092:	83 ec 0c             	sub    $0xc,%esp
c0009095:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0009098:	50                   	push   %eax
c0009099:	e8 99 cf ff ff       	call   c0006037 <wait>
c000909e:	83 c4 10             	add    $0x10,%esp
c00090a1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00090a4:	83 ec 08             	sub    $0x8,%esp
c00090a7:	50                   	push   %eax
c00090a8:	68 66 c0 00 c0       	push   $0xc000c066
c00090ad:	e8 45 09 00 00       	call   c00099f7 <Printf>
c00090b2:	83 c4 10             	add    $0x10,%esp
c00090b5:	eb fe                	jmp    c00090b5 <wait_exit+0x73>
c00090b7:	83 ec 0c             	sub    $0xc,%esp
c00090ba:	68 81 c0 00 c0       	push   $0xc000c081
c00090bf:	e8 33 09 00 00       	call   c00099f7 <Printf>
c00090c4:	83 c4 10             	add    $0x10,%esp
c00090c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00090ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00090d1:	8d 50 01             	lea    0x1(%eax),%edx
c00090d4:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00090d7:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c00090dc:	7f 02                	jg     c00090e0 <wait_exit+0x9e>
c00090de:	eb ee                	jmp    c00090ce <wait_exit+0x8c>
c00090e0:	90                   	nop
c00090e1:	83 ec 0c             	sub    $0xc,%esp
c00090e4:	68 8d c0 00 c0       	push   $0xc000c08d
c00090e9:	e8 09 09 00 00       	call   c00099f7 <Printf>
c00090ee:	83 c4 10             	add    $0x10,%esp
c00090f1:	83 ec 0c             	sub    $0xc,%esp
c00090f4:	6a 09                	push   $0x9
c00090f6:	e8 80 cf ff ff       	call   c000607b <exit>
c00090fb:	83 c4 10             	add    $0x10,%esp
c00090fe:	83 ec 0c             	sub    $0xc,%esp
c0009101:	68 9b c0 00 c0       	push   $0xc000c09b
c0009106:	e8 ec 08 00 00       	call   c00099f7 <Printf>
c000910b:	83 c4 10             	add    $0x10,%esp
c000910e:	eb fe                	jmp    c000910e <wait_exit+0xcc>

c0009110 <INIT_fork>:
c0009110:	55                   	push   %ebp
c0009111:	89 e5                	mov    %esp,%ebp
c0009113:	83 ec 78             	sub    $0x78,%esp
c0009116:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c000911d:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0009124:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000912a:	83 ec 08             	sub    $0x8,%esp
c000912d:	6a 02                	push   $0x2
c000912f:	8d 45 de             	lea    -0x22(%ebp),%eax
c0009132:	50                   	push   %eax
c0009133:	e8 40 cd ff ff       	call   c0005e78 <open>
c0009138:	83 c4 10             	add    $0x10,%esp
c000913b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000913e:	83 ec 08             	sub    $0x8,%esp
c0009141:	6a 02                	push   $0x2
c0009143:	8d 45 de             	lea    -0x22(%ebp),%eax
c0009146:	50                   	push   %eax
c0009147:	e8 2c cd ff ff       	call   c0005e78 <open>
c000914c:	83 c4 10             	add    $0x10,%esp
c000914f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009152:	c7 45 b6 49 4e 49 54 	movl   $0x54494e49,-0x4a(%ebp)
c0009159:	c7 45 ba 20 69 73 20 	movl   $0x20736920,-0x46(%ebp)
c0009160:	c7 45 be 72 75 6e 6e 	movl   $0x6e6e7572,-0x42(%ebp)
c0009167:	c7 45 c2 69 6e 67 0a 	movl   $0xa676e69,-0x3e(%ebp)
c000916e:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0009175:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c000917c:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0009183:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c000918a:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c0009191:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0009198:	83 ec 0c             	sub    $0xc,%esp
c000919b:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c000919e:	50                   	push   %eax
c000919f:	e8 53 08 00 00       	call   c00099f7 <Printf>
c00091a4:	83 c4 10             	add    $0x10,%esp
c00091a7:	83 ec 0c             	sub    $0xc,%esp
c00091aa:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091ad:	50                   	push   %eax
c00091ae:	e8 11 33 00 00       	call   c000c4c4 <Strlen>
c00091b3:	83 c4 10             	add    $0x10,%esp
c00091b6:	83 ec 04             	sub    $0x4,%esp
c00091b9:	50                   	push   %eax
c00091ba:	6a 00                	push   $0x0
c00091bc:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091bf:	50                   	push   %eax
c00091c0:	e8 c6 32 00 00       	call   c000c48b <Memset>
c00091c5:	83 c4 10             	add    $0x10,%esp
c00091c8:	83 ec 04             	sub    $0x4,%esp
c00091cb:	6a 28                	push   $0x28
c00091cd:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091d0:	50                   	push   %eax
c00091d1:	ff 75 f0             	pushl  -0x10(%ebp)
c00091d4:	e8 24 cd ff ff       	call   c0005efd <read>
c00091d9:	83 c4 10             	add    $0x10,%esp
c00091dc:	83 ec 0c             	sub    $0xc,%esp
c00091df:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00091e2:	50                   	push   %eax
c00091e3:	e8 0f 08 00 00       	call   c00099f7 <Printf>
c00091e8:	83 c4 10             	add    $0x10,%esp
c00091eb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00091f2:	e8 b3 ce ff ff       	call   c00060aa <fork>
c00091f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00091fa:	66 87 db             	xchg   %bx,%bx
c00091fd:	83 ec 0c             	sub    $0xc,%esp
c0009200:	6a 01                	push   $0x1
c0009202:	e8 bc 06 00 00       	call   c00098c3 <delay>
c0009207:	83 c4 10             	add    $0x10,%esp
c000920a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000920e:	0f 8e c5 00 00 00    	jle    c00092d9 <INIT_fork+0x1c9>
c0009214:	83 ec 0c             	sub    $0xc,%esp
c0009217:	68 a9 c0 00 c0       	push   $0xc000c0a9
c000921c:	e8 d6 07 00 00       	call   c00099f7 <Printf>
c0009221:	83 c4 10             	add    $0x10,%esp
c0009224:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0009228:	c7 45 8e 50 61 72 65 	movl   $0x65726150,-0x72(%ebp)
c000922f:	c7 45 92 6e 74 2e 4e 	movl   $0x4e2e746e,-0x6e(%ebp)
c0009236:	c7 45 96 69 63 65 20 	movl   $0x20656369,-0x6a(%ebp)
c000923d:	c7 45 9a 74 6f 20 6d 	movl   $0x6d206f74,-0x66(%ebp)
c0009244:	c7 45 9e 65 65 74 20 	movl   $0x20746565,-0x62(%ebp)
c000924b:	c7 45 a2 79 6f 75 21 	movl   $0x21756f79,-0x5e(%ebp)
c0009252:	c7 45 a6 0a 00 00 00 	movl   $0xa,-0x5a(%ebp)
c0009259:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0009260:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c0009267:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c000926e:	83 ec 0c             	sub    $0xc,%esp
c0009271:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009274:	50                   	push   %eax
c0009275:	e8 4a 32 00 00       	call   c000c4c4 <Strlen>
c000927a:	83 c4 10             	add    $0x10,%esp
c000927d:	83 ec 04             	sub    $0x4,%esp
c0009280:	50                   	push   %eax
c0009281:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009284:	50                   	push   %eax
c0009285:	ff 75 f4             	pushl  -0xc(%ebp)
c0009288:	e8 e4 cc ff ff       	call   c0005f71 <write>
c000928d:	83 c4 10             	add    $0x10,%esp
c0009290:	83 ec 0c             	sub    $0xc,%esp
c0009293:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009296:	50                   	push   %eax
c0009297:	e8 28 32 00 00       	call   c000c4c4 <Strlen>
c000929c:	83 c4 10             	add    $0x10,%esp
c000929f:	83 ec 04             	sub    $0x4,%esp
c00092a2:	50                   	push   %eax
c00092a3:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00092a6:	50                   	push   %eax
c00092a7:	ff 75 f4             	pushl  -0xc(%ebp)
c00092aa:	e8 c2 cc ff ff       	call   c0005f71 <write>
c00092af:	83 c4 10             	add    $0x10,%esp
c00092b2:	83 ec 0c             	sub    $0xc,%esp
c00092b5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00092b8:	50                   	push   %eax
c00092b9:	e8 06 32 00 00       	call   c000c4c4 <Strlen>
c00092be:	83 c4 10             	add    $0x10,%esp
c00092c1:	83 ec 04             	sub    $0x4,%esp
c00092c4:	50                   	push   %eax
c00092c5:	8d 45 8e             	lea    -0x72(%ebp),%eax
c00092c8:	50                   	push   %eax
c00092c9:	ff 75 f4             	pushl  -0xc(%ebp)
c00092cc:	e8 a0 cc ff ff       	call   c0005f71 <write>
c00092d1:	83 c4 10             	add    $0x10,%esp
c00092d4:	e9 c6 00 00 00       	jmp    c000939f <INIT_fork+0x28f>
c00092d9:	83 ec 0c             	sub    $0xc,%esp
c00092dc:	6a 01                	push   $0x1
c00092de:	e8 e0 05 00 00       	call   c00098c3 <delay>
c00092e3:	83 c4 10             	add    $0x10,%esp
c00092e6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00092ea:	83 45 ec 02          	addl   $0x2,-0x14(%ebp)
c00092ee:	c7 45 8e 43 68 69 6c 	movl   $0x6c696843,-0x72(%ebp)
c00092f5:	c7 45 92 64 2e 53 65 	movl   $0x65532e64,-0x6e(%ebp)
c00092fc:	c7 45 96 65 20 79 6f 	movl   $0x6f792065,-0x6a(%ebp)
c0009303:	c7 45 9a 75 20 61 67 	movl   $0x67612075,-0x66(%ebp)
c000930a:	c7 45 9e 61 69 6e 0a 	movl   $0xa6e6961,-0x62(%ebp)
c0009311:	c7 45 a2 00 00 00 00 	movl   $0x0,-0x5e(%ebp)
c0009318:	c7 45 a6 00 00 00 00 	movl   $0x0,-0x5a(%ebp)
c000931f:	c7 45 aa 00 00 00 00 	movl   $0x0,-0x56(%ebp)
c0009326:	c7 45 ae 00 00 00 00 	movl   $0x0,-0x52(%ebp)
c000932d:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)
c0009334:	66 87 db             	xchg   %bx,%bx
c0009337:	83 ec 0c             	sub    $0xc,%esp
c000933a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000933d:	50                   	push   %eax
c000933e:	e8 81 31 00 00       	call   c000c4c4 <Strlen>
c0009343:	83 c4 10             	add    $0x10,%esp
c0009346:	83 ec 04             	sub    $0x4,%esp
c0009349:	50                   	push   %eax
c000934a:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000934d:	50                   	push   %eax
c000934e:	ff 75 f4             	pushl  -0xc(%ebp)
c0009351:	e8 1b cc ff ff       	call   c0005f71 <write>
c0009356:	83 c4 10             	add    $0x10,%esp
c0009359:	83 ec 0c             	sub    $0xc,%esp
c000935c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000935f:	50                   	push   %eax
c0009360:	e8 5f 31 00 00       	call   c000c4c4 <Strlen>
c0009365:	83 c4 10             	add    $0x10,%esp
c0009368:	83 ec 04             	sub    $0x4,%esp
c000936b:	50                   	push   %eax
c000936c:	8d 45 8e             	lea    -0x72(%ebp),%eax
c000936f:	50                   	push   %eax
c0009370:	ff 75 f4             	pushl  -0xc(%ebp)
c0009373:	e8 f9 cb ff ff       	call   c0005f71 <write>
c0009378:	83 c4 10             	add    $0x10,%esp
c000937b:	83 ec 0c             	sub    $0xc,%esp
c000937e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009381:	50                   	push   %eax
c0009382:	e8 3d 31 00 00       	call   c000c4c4 <Strlen>
c0009387:	83 c4 10             	add    $0x10,%esp
c000938a:	83 ec 04             	sub    $0x4,%esp
c000938d:	50                   	push   %eax
c000938e:	8d 45 8e             	lea    -0x72(%ebp),%eax
c0009391:	50                   	push   %eax
c0009392:	ff 75 f4             	pushl  -0xc(%ebp)
c0009395:	e8 d7 cb ff ff       	call   c0005f71 <write>
c000939a:	83 c4 10             	add    $0x10,%esp
c000939d:	eb fe                	jmp    c000939d <INIT_fork+0x28d>
c000939f:	83 ec 04             	sub    $0x4,%esp
c00093a2:	6a 28                	push   $0x28
c00093a4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00093a7:	50                   	push   %eax
c00093a8:	ff 75 f0             	pushl  -0x10(%ebp)
c00093ab:	e8 4d cb ff ff       	call   c0005efd <read>
c00093b0:	83 c4 10             	add    $0x10,%esp
c00093b3:	83 ec 0c             	sub    $0xc,%esp
c00093b6:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00093b9:	50                   	push   %eax
c00093ba:	e8 38 06 00 00       	call   c00099f7 <Printf>
c00093bf:	83 c4 10             	add    $0x10,%esp
c00093c2:	83 ec 0c             	sub    $0xc,%esp
c00093c5:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00093c8:	50                   	push   %eax
c00093c9:	e8 29 06 00 00       	call   c00099f7 <Printf>
c00093ce:	83 c4 10             	add    $0x10,%esp
c00093d1:	83 ec 0c             	sub    $0xc,%esp
c00093d4:	8d 45 b6             	lea    -0x4a(%ebp),%eax
c00093d7:	50                   	push   %eax
c00093d8:	e8 1a 06 00 00       	call   c00099f7 <Printf>
c00093dd:	83 c4 10             	add    $0x10,%esp
c00093e0:	83 ec 0c             	sub    $0xc,%esp
c00093e3:	68 af c0 00 c0       	push   $0xc000c0af
c00093e8:	e8 23 09 00 00       	call   c0009d10 <spin>
c00093ed:	83 c4 10             	add    $0x10,%esp
c00093f0:	90                   	nop
c00093f1:	c9                   	leave  
c00093f2:	c3                   	ret    

c00093f3 <simple_shell>:
c00093f3:	55                   	push   %ebp
c00093f4:	89 e5                	mov    %esp,%ebp
c00093f6:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c00093fc:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0009403:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c000940a:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0009410:	83 ec 08             	sub    $0x8,%esp
c0009413:	6a 02                	push   $0x2
c0009415:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0009418:	50                   	push   %eax
c0009419:	e8 5a ca ff ff       	call   c0005e78 <open>
c000941e:	83 c4 10             	add    $0x10,%esp
c0009421:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009424:	83 ec 08             	sub    $0x8,%esp
c0009427:	6a 02                	push   $0x2
c0009429:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000942c:	50                   	push   %eax
c000942d:	e8 46 ca ff ff       	call   c0005e78 <open>
c0009432:	83 c4 10             	add    $0x10,%esp
c0009435:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009438:	83 ec 04             	sub    $0x4,%esp
c000943b:	68 80 00 00 00       	push   $0x80
c0009440:	6a 00                	push   $0x0
c0009442:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0009448:	50                   	push   %eax
c0009449:	e8 3d 30 00 00       	call   c000c48b <Memset>
c000944e:	83 c4 10             	add    $0x10,%esp
c0009451:	83 ec 04             	sub    $0x4,%esp
c0009454:	68 80 00 00 00       	push   $0x80
c0009459:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000945f:	50                   	push   %eax
c0009460:	ff 75 e0             	pushl  -0x20(%ebp)
c0009463:	e8 95 ca ff ff       	call   c0005efd <read>
c0009468:	83 c4 10             	add    $0x10,%esp
c000946b:	83 ec 08             	sub    $0x8,%esp
c000946e:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0009474:	50                   	push   %eax
c0009475:	68 b7 c0 00 c0       	push   $0xc000c0b7
c000947a:	e8 78 05 00 00       	call   c00099f7 <Printf>
c000947f:	83 c4 10             	add    $0x10,%esp
c0009482:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009489:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0009490:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0009496:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009499:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000949c:	0f b6 00             	movzbl (%eax),%eax
c000949f:	88 45 db             	mov    %al,-0x25(%ebp)
c00094a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094a5:	0f b6 00             	movzbl (%eax),%eax
c00094a8:	3c 20                	cmp    $0x20,%al
c00094aa:	74 1d                	je     c00094c9 <simple_shell+0xd6>
c00094ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094af:	0f b6 00             	movzbl (%eax),%eax
c00094b2:	84 c0                	test   %al,%al
c00094b4:	74 13                	je     c00094c9 <simple_shell+0xd6>
c00094b6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00094ba:	75 0d                	jne    c00094c9 <simple_shell+0xd6>
c00094bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00094c2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00094c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094cc:	0f b6 00             	movzbl (%eax),%eax
c00094cf:	3c 20                	cmp    $0x20,%al
c00094d1:	74 0a                	je     c00094dd <simple_shell+0xea>
c00094d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094d6:	0f b6 00             	movzbl (%eax),%eax
c00094d9:	84 c0                	test   %al,%al
c00094db:	75 26                	jne    c0009503 <simple_shell+0x110>
c00094dd:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00094e1:	75 20                	jne    c0009503 <simple_shell+0x110>
c00094e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00094e6:	8d 50 01             	lea    0x1(%eax),%edx
c00094e9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00094ec:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00094ef:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c00094f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094f9:	c6 00 00             	movb   $0x0,(%eax)
c00094fc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0009503:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0009507:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c000950b:	75 8c                	jne    c0009499 <simple_shell+0xa6>
c000950d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009510:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0009517:	00 00 00 00 
c000951b:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0009522:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0009528:	83 ec 08             	sub    $0x8,%esp
c000952b:	6a 02                	push   $0x2
c000952d:	50                   	push   %eax
c000952e:	e8 45 c9 ff ff       	call   c0005e78 <open>
c0009533:	83 c4 10             	add    $0x10,%esp
c0009536:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009539:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c000953d:	75 54                	jne    c0009593 <simple_shell+0x1a0>
c000953f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0009546:	eb 29                	jmp    c0009571 <simple_shell+0x17e>
c0009548:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c000954e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009551:	01 d0                	add    %edx,%eax
c0009553:	0f b6 00             	movzbl (%eax),%eax
c0009556:	0f be c0             	movsbl %al,%eax
c0009559:	83 ec 04             	sub    $0x4,%esp
c000955c:	50                   	push   %eax
c000955d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009560:	68 c6 c0 00 c0       	push   $0xc000c0c6
c0009565:	e8 8d 04 00 00       	call   c00099f7 <Printf>
c000956a:	83 c4 10             	add    $0x10,%esp
c000956d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0009571:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0009575:	7e d1                	jle    c0009548 <simple_shell+0x155>
c0009577:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c000957d:	83 ec 08             	sub    $0x8,%esp
c0009580:	50                   	push   %eax
c0009581:	68 cd c0 00 c0       	push   $0xc000c0cd
c0009586:	e8 6c 04 00 00       	call   c00099f7 <Printf>
c000958b:	83 c4 10             	add    $0x10,%esp
c000958e:	e9 a5 fe ff ff       	jmp    c0009438 <simple_shell+0x45>
c0009593:	e8 12 cb ff ff       	call   c00060aa <fork>
c0009598:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000959b:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c000959f:	7e 17                	jle    c00095b8 <simple_shell+0x1c5>
c00095a1:	83 ec 0c             	sub    $0xc,%esp
c00095a4:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00095aa:	50                   	push   %eax
c00095ab:	e8 87 ca ff ff       	call   c0006037 <wait>
c00095b0:	83 c4 10             	add    $0x10,%esp
c00095b3:	e9 80 fe ff ff       	jmp    c0009438 <simple_shell+0x45>
c00095b8:	83 ec 0c             	sub    $0xc,%esp
c00095bb:	68 d3 c0 00 c0       	push   $0xc000c0d3
c00095c0:	e8 32 04 00 00       	call   c00099f7 <Printf>
c00095c5:	83 c4 10             	add    $0x10,%esp
c00095c8:	83 ec 0c             	sub    $0xc,%esp
c00095cb:	ff 75 d0             	pushl  -0x30(%ebp)
c00095ce:	e8 12 ca ff ff       	call   c0005fe5 <close>
c00095d3:	83 c4 10             	add    $0x10,%esp
c00095d6:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00095dc:	83 ec 08             	sub    $0x8,%esp
c00095df:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c00095e5:	52                   	push   %edx
c00095e6:	50                   	push   %eax
c00095e7:	e8 c2 cb ff ff       	call   c00061ae <execv>
c00095ec:	83 c4 10             	add    $0x10,%esp
c00095ef:	eb fe                	jmp    c00095ef <simple_shell+0x1fc>

c00095f1 <test_split_str>:
c00095f1:	55                   	push   %ebp
c00095f2:	89 e5                	mov    %esp,%ebp
c00095f4:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c00095fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009601:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0009608:	c7 45 ec ef c0 00 c0 	movl   $0xc000c0ef,-0x14(%ebp)
c000960f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0009613:	75 1a                	jne    c000962f <test_split_str+0x3e>
c0009615:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009618:	0f b6 00             	movzbl (%eax),%eax
c000961b:	0f be c0             	movsbl %al,%eax
c000961e:	83 ec 08             	sub    $0x8,%esp
c0009621:	50                   	push   %eax
c0009622:	68 00 c1 00 c0       	push   $0xc000c100
c0009627:	e8 cb 03 00 00       	call   c00099f7 <Printf>
c000962c:	83 c4 10             	add    $0x10,%esp
c000962f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009632:	0f b6 00             	movzbl (%eax),%eax
c0009635:	3c 20                	cmp    $0x20,%al
c0009637:	75 0a                	jne    c0009643 <test_split_str+0x52>
c0009639:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000963c:	0f b6 00             	movzbl (%eax),%eax
c000963f:	84 c0                	test   %al,%al
c0009641:	74 13                	je     c0009656 <test_split_str+0x65>
c0009643:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009647:	75 0d                	jne    c0009656 <test_split_str+0x65>
c0009649:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000964c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000964f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0009656:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009659:	0f b6 00             	movzbl (%eax),%eax
c000965c:	3c 20                	cmp    $0x20,%al
c000965e:	74 0a                	je     c000966a <test_split_str+0x79>
c0009660:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009663:	0f b6 00             	movzbl (%eax),%eax
c0009666:	84 c0                	test   %al,%al
c0009668:	75 26                	jne    c0009690 <test_split_str+0x9f>
c000966a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c000966e:	75 20                	jne    c0009690 <test_split_str+0x9f>
c0009670:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009673:	8d 50 01             	lea    0x1(%eax),%edx
c0009676:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009679:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000967c:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0009683:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009686:	c6 00 00             	movb   $0x0,(%eax)
c0009689:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0009690:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0009694:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009697:	0f b6 00             	movzbl (%eax),%eax
c000969a:	84 c0                	test   %al,%al
c000969c:	0f 85 6d ff ff ff    	jne    c000960f <test_split_str+0x1e>
c00096a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00096a5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00096a8:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00096af:	83 ec 08             	sub    $0x8,%esp
c00096b2:	ff 75 f4             	pushl  -0xc(%ebp)
c00096b5:	68 09 c1 00 c0       	push   $0xc000c109
c00096ba:	e8 38 03 00 00       	call   c00099f7 <Printf>
c00096bf:	83 c4 10             	add    $0x10,%esp
c00096c2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00096c9:	eb 22                	jmp    c00096ed <test_split_str+0xfc>
c00096cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00096ce:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c00096d5:	83 ec 04             	sub    $0x4,%esp
c00096d8:	50                   	push   %eax
c00096d9:	ff 75 e4             	pushl  -0x1c(%ebp)
c00096dc:	68 20 c1 00 c0       	push   $0xc000c120
c00096e1:	e8 11 03 00 00       	call   c00099f7 <Printf>
c00096e6:	83 c4 10             	add    $0x10,%esp
c00096e9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00096ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00096f0:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c00096f3:	7e d6                	jle    c00096cb <test_split_str+0xda>
c00096f5:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c00096fb:	83 ec 08             	sub    $0x8,%esp
c00096fe:	68 2f c1 00 c0       	push   $0xc000c12f
c0009703:	50                   	push   %eax
c0009704:	e8 df 12 00 00       	call   c000a9e8 <strcmp>
c0009709:	83 c4 10             	add    $0x10,%esp
c000970c:	85 c0                	test   %eax,%eax
c000970e:	75 10                	jne    c0009720 <test_split_str+0x12f>
c0009710:	83 ec 0c             	sub    $0xc,%esp
c0009713:	68 34 c1 00 c0       	push   $0xc000c134
c0009718:	e8 da 02 00 00       	call   c00099f7 <Printf>
c000971d:	83 c4 10             	add    $0x10,%esp
c0009720:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0009726:	83 ec 08             	sub    $0x8,%esp
c0009729:	50                   	push   %eax
c000972a:	68 40 c1 00 c0       	push   $0xc000c140
c000972f:	e8 c3 02 00 00       	call   c00099f7 <Printf>
c0009734:	83 c4 10             	add    $0x10,%esp
c0009737:	83 ec 0c             	sub    $0xc,%esp
c000973a:	68 4e c1 00 c0       	push   $0xc000c14e
c000973f:	e8 b3 02 00 00       	call   c00099f7 <Printf>
c0009744:	83 c4 10             	add    $0x10,%esp
c0009747:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000974e:	eb 26                	jmp    c0009776 <test_split_str+0x185>
c0009750:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0009756:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0009759:	01 d0                	add    %edx,%eax
c000975b:	0f b6 00             	movzbl (%eax),%eax
c000975e:	0f be c0             	movsbl %al,%eax
c0009761:	83 ec 08             	sub    $0x8,%esp
c0009764:	50                   	push   %eax
c0009765:	68 5d c1 00 c0       	push   $0xc000c15d
c000976a:	e8 88 02 00 00       	call   c00099f7 <Printf>
c000976f:	83 c4 10             	add    $0x10,%esp
c0009772:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0009776:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c000977a:	7e d4                	jle    c0009750 <test_split_str+0x15f>
c000977c:	c9                   	leave  
c000977d:	c3                   	ret    

c000977e <test_shell>:
c000977e:	55                   	push   %ebp
c000977f:	89 e5                	mov    %esp,%ebp
c0009781:	83 ec 38             	sub    $0x38,%esp
c0009784:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c000978b:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c0009792:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0009798:	83 ec 08             	sub    $0x8,%esp
c000979b:	6a 02                	push   $0x2
c000979d:	8d 45 ea             	lea    -0x16(%ebp),%eax
c00097a0:	50                   	push   %eax
c00097a1:	e8 d2 c6 ff ff       	call   c0005e78 <open>
c00097a6:	83 c4 10             	add    $0x10,%esp
c00097a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00097ac:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c00097b3:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c00097ba:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c00097c1:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c00097c8:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c00097cf:	83 ec 0c             	sub    $0xc,%esp
c00097d2:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c00097d5:	50                   	push   %eax
c00097d6:	e8 c7 e5 ff ff       	call   c0007da2 <untar>
c00097db:	83 c4 10             	add    $0x10,%esp
c00097de:	e8 10 fc ff ff       	call   c00093f3 <simple_shell>
c00097e3:	90                   	nop
c00097e4:	c9                   	leave  
c00097e5:	c3                   	ret    

c00097e6 <test_exec>:
c00097e6:	55                   	push   %ebp
c00097e7:	89 e5                	mov    %esp,%ebp
c00097e9:	83 ec 38             	sub    $0x38,%esp
c00097ec:	83 ec 0c             	sub    $0xc,%esp
c00097ef:	68 97 bf 00 c0       	push   $0xc000bf97
c00097f4:	e8 93 7d ff ff       	call   c000158c <disp_str>
c00097f9:	83 c4 10             	add    $0x10,%esp
c00097fc:	83 ec 0c             	sub    $0xc,%esp
c00097ff:	68 99 bf 00 c0       	push   $0xc000bf99
c0009804:	e8 83 7d ff ff       	call   c000158c <disp_str>
c0009809:	83 c4 10             	add    $0x10,%esp
c000980c:	c7 45 ea 64 65 76 5f 	movl   $0x5f766564,-0x16(%ebp)
c0009813:	c7 45 ee 74 74 79 31 	movl   $0x31797474,-0x12(%ebp)
c000981a:	66 c7 45 f2 00 00    	movw   $0x0,-0xe(%ebp)
c0009820:	83 ec 08             	sub    $0x8,%esp
c0009823:	6a 02                	push   $0x2
c0009825:	8d 45 ea             	lea    -0x16(%ebp),%eax
c0009828:	50                   	push   %eax
c0009829:	e8 4a c6 ff ff       	call   c0005e78 <open>
c000982e:	83 c4 10             	add    $0x10,%esp
c0009831:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009834:	c7 45 d6 69 6e 73 74 	movl   $0x74736e69,-0x2a(%ebp)
c000983b:	c7 45 da 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x26(%ebp)
c0009842:	c7 45 de 74 61 72 00 	movl   $0x726174,-0x22(%ebp)
c0009849:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0009850:	c7 45 e6 00 00 00 00 	movl   $0x0,-0x1a(%ebp)
c0009857:	83 ec 0c             	sub    $0xc,%esp
c000985a:	8d 45 d6             	lea    -0x2a(%ebp),%eax
c000985d:	50                   	push   %eax
c000985e:	e8 3f e5 ff ff       	call   c0007da2 <untar>
c0009863:	83 c4 10             	add    $0x10,%esp
c0009866:	6a 00                	push   $0x0
c0009868:	68 66 c1 00 c0       	push   $0xc000c166
c000986d:	68 2f c1 00 c0       	push   $0xc000c12f
c0009872:	68 6c c1 00 c0       	push   $0xc000c16c
c0009877:	e8 97 cb ff ff       	call   c0006413 <execl>
c000987c:	83 c4 10             	add    $0x10,%esp
c000987f:	eb fe                	jmp    c000987f <test_exec+0x99>

c0009881 <INIT>:
c0009881:	55                   	push   %ebp
c0009882:	89 e5                	mov    %esp,%ebp
c0009884:	83 ec 08             	sub    $0x8,%esp
c0009887:	e8 f2 fe ff ff       	call   c000977e <test_shell>
c000988c:	eb fe                	jmp    c000988c <INIT+0xb>

c000988e <TestA>:
c000988e:	55                   	push   %ebp
c000988f:	89 e5                	mov    %esp,%ebp
c0009891:	83 ec 08             	sub    $0x8,%esp
c0009894:	83 ec 0c             	sub    $0xc,%esp
c0009897:	6a 05                	push   $0x5
c0009899:	e8 ba e8 ff ff       	call   c0008158 <disp_int>
c000989e:	83 c4 10             	add    $0x10,%esp
c00098a1:	83 ec 0c             	sub    $0xc,%esp
c00098a4:	68 8f bc 00 c0       	push   $0xc000bc8f
c00098a9:	e8 de 7c ff ff       	call   c000158c <disp_str>
c00098ae:	83 c4 10             	add    $0x10,%esp
c00098b1:	83 ec 0c             	sub    $0xc,%esp
c00098b4:	68 72 c1 00 c0       	push   $0xc000c172
c00098b9:	e8 ce 7c ff ff       	call   c000158c <disp_str>
c00098be:	83 c4 10             	add    $0x10,%esp
c00098c1:	eb fe                	jmp    c00098c1 <TestA+0x33>

c00098c3 <delay>:
c00098c3:	55                   	push   %ebp
c00098c4:	89 e5                	mov    %esp,%ebp
c00098c6:	83 ec 10             	sub    $0x10,%esp
c00098c9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00098d0:	eb 2a                	jmp    c00098fc <delay+0x39>
c00098d2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c00098d9:	eb 17                	jmp    c00098f2 <delay+0x2f>
c00098db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00098e2:	eb 04                	jmp    c00098e8 <delay+0x25>
c00098e4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00098e8:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00098ec:	7e f6                	jle    c00098e4 <delay+0x21>
c00098ee:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c00098f2:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c00098f6:	7e e3                	jle    c00098db <delay+0x18>
c00098f8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00098fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00098ff:	3b 45 08             	cmp    0x8(%ebp),%eax
c0009902:	7c ce                	jl     c00098d2 <delay+0xf>
c0009904:	90                   	nop
c0009905:	c9                   	leave  
c0009906:	c3                   	ret    

c0009907 <TestB>:
c0009907:	55                   	push   %ebp
c0009908:	89 e5                	mov    %esp,%ebp
c000990a:	83 ec 08             	sub    $0x8,%esp
c000990d:	83 ec 0c             	sub    $0xc,%esp
c0009910:	68 79 c1 00 c0       	push   $0xc000c179
c0009915:	e8 72 7c ff ff       	call   c000158c <disp_str>
c000991a:	83 c4 10             	add    $0x10,%esp
c000991d:	eb fe                	jmp    c000991d <TestB+0x16>

c000991f <TestC>:
c000991f:	55                   	push   %ebp
c0009920:	89 e5                	mov    %esp,%ebp
c0009922:	83 ec 18             	sub    $0x18,%esp
c0009925:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000992c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0009930:	77 1a                	ja     c000994c <TestC+0x2d>
c0009932:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0009939:	83 ec 08             	sub    $0x8,%esp
c000993c:	ff 75 f0             	pushl  -0x10(%ebp)
c000993f:	68 7c c1 00 c0       	push   $0xc000c17c
c0009944:	e8 ae 00 00 00       	call   c00099f7 <Printf>
c0009949:	83 c4 10             	add    $0x10,%esp
c000994c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009950:	eb da                	jmp    c000992c <TestC+0xd>

c0009952 <sys_get_ticks>:
c0009952:	55                   	push   %ebp
c0009953:	89 e5                	mov    %esp,%ebp
c0009955:	a1 e8 1e 01 c0       	mov    0xc0011ee8,%eax
c000995a:	8b 15 ec 1e 01 c0    	mov    0xc0011eec,%edx
c0009960:	5d                   	pop    %ebp
c0009961:	c3                   	ret    

c0009962 <sys_write>:
c0009962:	55                   	push   %ebp
c0009963:	89 e5                	mov    %esp,%ebp
c0009965:	83 ec 18             	sub    $0x18,%esp
c0009968:	8b 45 10             	mov    0x10(%ebp),%eax
c000996b:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009971:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009977:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c000997c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000997f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009982:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009985:	8b 45 08             	mov    0x8(%ebp),%eax
c0009988:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000998b:	eb 20                	jmp    c00099ad <sys_write+0x4b>
c000998d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009990:	0f b6 00             	movzbl (%eax),%eax
c0009993:	0f b6 c0             	movzbl %al,%eax
c0009996:	83 ec 08             	sub    $0x8,%esp
c0009999:	50                   	push   %eax
c000999a:	ff 75 ec             	pushl  -0x14(%ebp)
c000999d:	e8 57 b8 ff ff       	call   c00051f9 <out_char>
c00099a2:	83 c4 10             	add    $0x10,%esp
c00099a5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00099a9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c00099ad:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00099b1:	7f da                	jg     c000998d <sys_write+0x2b>
c00099b3:	90                   	nop
c00099b4:	c9                   	leave  
c00099b5:	c3                   	ret    

c00099b6 <milli_delay>:
c00099b6:	55                   	push   %ebp
c00099b7:	89 e5                	mov    %esp,%ebp
c00099b9:	83 ec 18             	sub    $0x18,%esp
c00099bc:	e8 47 0e 00 00       	call   c000a808 <get_ticks_ipc>
c00099c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00099c4:	90                   	nop
c00099c5:	e8 3e 0e 00 00       	call   c000a808 <get_ticks_ipc>
c00099ca:	2b 45 f4             	sub    -0xc(%ebp),%eax
c00099cd:	89 c1                	mov    %eax,%ecx
c00099cf:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c00099d4:	89 c8                	mov    %ecx,%eax
c00099d6:	f7 ea                	imul   %edx
c00099d8:	c1 fa 05             	sar    $0x5,%edx
c00099db:	89 c8                	mov    %ecx,%eax
c00099dd:	c1 f8 1f             	sar    $0x1f,%eax
c00099e0:	29 c2                	sub    %eax,%edx
c00099e2:	89 d0                	mov    %edx,%eax
c00099e4:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c00099ea:	39 45 08             	cmp    %eax,0x8(%ebp)
c00099ed:	77 d6                	ja     c00099c5 <milli_delay+0xf>
c00099ef:	90                   	nop
c00099f0:	c9                   	leave  
c00099f1:	c3                   	ret    

c00099f2 <TaskSys>:
c00099f2:	55                   	push   %ebp
c00099f3:	89 e5                	mov    %esp,%ebp
c00099f5:	eb fe                	jmp    c00099f5 <TaskSys+0x3>

c00099f7 <Printf>:
c00099f7:	55                   	push   %ebp
c00099f8:	89 e5                	mov    %esp,%ebp
c00099fa:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009a00:	83 ec 04             	sub    $0x4,%esp
c0009a03:	68 00 01 00 00       	push   $0x100
c0009a08:	6a 00                	push   $0x0
c0009a0a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009a10:	50                   	push   %eax
c0009a11:	e8 75 2a 00 00       	call   c000c48b <Memset>
c0009a16:	83 c4 10             	add    $0x10,%esp
c0009a19:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009a1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009a1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a22:	83 ec 04             	sub    $0x4,%esp
c0009a25:	ff 75 f4             	pushl  -0xc(%ebp)
c0009a28:	50                   	push   %eax
c0009a29:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009a2f:	50                   	push   %eax
c0009a30:	e8 20 00 00 00       	call   c0009a55 <vsprintf>
c0009a35:	83 c4 10             	add    $0x10,%esp
c0009a38:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a3b:	83 ec 04             	sub    $0x4,%esp
c0009a3e:	ff 75 f0             	pushl  -0x10(%ebp)
c0009a41:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009a47:	50                   	push   %eax
c0009a48:	6a 00                	push   $0x0
c0009a4a:	e8 22 c5 ff ff       	call   c0005f71 <write>
c0009a4f:	83 c4 10             	add    $0x10,%esp
c0009a52:	90                   	nop
c0009a53:	c9                   	leave  
c0009a54:	c3                   	ret    

c0009a55 <vsprintf>:
c0009a55:	55                   	push   %ebp
c0009a56:	89 e5                	mov    %esp,%ebp
c0009a58:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0009a5e:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009a64:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0009a6a:	83 ec 04             	sub    $0x4,%esp
c0009a6d:	6a 40                	push   $0x40
c0009a6f:	6a 00                	push   $0x0
c0009a71:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009a77:	50                   	push   %eax
c0009a78:	e8 0e 2a 00 00       	call   c000c48b <Memset>
c0009a7d:	83 c4 10             	add    $0x10,%esp
c0009a80:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a86:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009a8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a90:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009a93:	e9 53 01 00 00       	jmp    c0009beb <vsprintf+0x196>
c0009a98:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009a9b:	0f b6 00             	movzbl (%eax),%eax
c0009a9e:	3c 25                	cmp    $0x25,%al
c0009aa0:	74 16                	je     c0009ab8 <vsprintf+0x63>
c0009aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009aa5:	8d 50 01             	lea    0x1(%eax),%edx
c0009aa8:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009aab:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009aae:	0f b6 12             	movzbl (%edx),%edx
c0009ab1:	88 10                	mov    %dl,(%eax)
c0009ab3:	e9 2f 01 00 00       	jmp    c0009be7 <vsprintf+0x192>
c0009ab8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009abc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009abf:	0f b6 00             	movzbl (%eax),%eax
c0009ac2:	0f be c0             	movsbl %al,%eax
c0009ac5:	83 f8 64             	cmp    $0x64,%eax
c0009ac8:	74 26                	je     c0009af0 <vsprintf+0x9b>
c0009aca:	83 f8 64             	cmp    $0x64,%eax
c0009acd:	7f 0e                	jg     c0009add <vsprintf+0x88>
c0009acf:	83 f8 63             	cmp    $0x63,%eax
c0009ad2:	0f 84 f2 00 00 00    	je     c0009bca <vsprintf+0x175>
c0009ad8:	e9 0a 01 00 00       	jmp    c0009be7 <vsprintf+0x192>
c0009add:	83 f8 73             	cmp    $0x73,%eax
c0009ae0:	0f 84 b0 00 00 00    	je     c0009b96 <vsprintf+0x141>
c0009ae6:	83 f8 78             	cmp    $0x78,%eax
c0009ae9:	74 5d                	je     c0009b48 <vsprintf+0xf3>
c0009aeb:	e9 f7 00 00 00       	jmp    c0009be7 <vsprintf+0x192>
c0009af0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009af3:	8b 00                	mov    (%eax),%eax
c0009af5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009af8:	83 ec 04             	sub    $0x4,%esp
c0009afb:	6a 0a                	push   $0xa
c0009afd:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0009b03:	50                   	push   %eax
c0009b04:	ff 75 e8             	pushl  -0x18(%ebp)
c0009b07:	e8 53 0d 00 00       	call   c000a85f <itoa>
c0009b0c:	83 c4 10             	add    $0x10,%esp
c0009b0f:	83 ec 08             	sub    $0x8,%esp
c0009b12:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009b18:	50                   	push   %eax
c0009b19:	ff 75 f4             	pushl  -0xc(%ebp)
c0009b1c:	e8 89 29 00 00       	call   c000c4aa <Strcpy>
c0009b21:	83 c4 10             	add    $0x10,%esp
c0009b24:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009b28:	83 ec 0c             	sub    $0xc,%esp
c0009b2b:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009b31:	50                   	push   %eax
c0009b32:	e8 8d 29 00 00       	call   c000c4c4 <Strlen>
c0009b37:	83 c4 10             	add    $0x10,%esp
c0009b3a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009b3d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009b40:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009b43:	e9 9f 00 00 00       	jmp    c0009be7 <vsprintf+0x192>
c0009b48:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b4b:	8b 00                	mov    (%eax),%eax
c0009b4d:	83 ec 08             	sub    $0x8,%esp
c0009b50:	50                   	push   %eax
c0009b51:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009b57:	50                   	push   %eax
c0009b58:	e8 55 e5 ff ff       	call   c00080b2 <atoi>
c0009b5d:	83 c4 10             	add    $0x10,%esp
c0009b60:	83 ec 08             	sub    $0x8,%esp
c0009b63:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009b69:	50                   	push   %eax
c0009b6a:	ff 75 f4             	pushl  -0xc(%ebp)
c0009b6d:	e8 38 29 00 00       	call   c000c4aa <Strcpy>
c0009b72:	83 c4 10             	add    $0x10,%esp
c0009b75:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009b79:	83 ec 0c             	sub    $0xc,%esp
c0009b7c:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009b82:	50                   	push   %eax
c0009b83:	e8 3c 29 00 00       	call   c000c4c4 <Strlen>
c0009b88:	83 c4 10             	add    $0x10,%esp
c0009b8b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009b8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009b91:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009b94:	eb 51                	jmp    c0009be7 <vsprintf+0x192>
c0009b96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b99:	8b 00                	mov    (%eax),%eax
c0009b9b:	83 ec 08             	sub    $0x8,%esp
c0009b9e:	50                   	push   %eax
c0009b9f:	ff 75 f4             	pushl  -0xc(%ebp)
c0009ba2:	e8 03 29 00 00       	call   c000c4aa <Strcpy>
c0009ba7:	83 c4 10             	add    $0x10,%esp
c0009baa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bad:	8b 00                	mov    (%eax),%eax
c0009baf:	83 ec 0c             	sub    $0xc,%esp
c0009bb2:	50                   	push   %eax
c0009bb3:	e8 0c 29 00 00       	call   c000c4c4 <Strlen>
c0009bb8:	83 c4 10             	add    $0x10,%esp
c0009bbb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009bbe:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009bc2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009bc5:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009bc8:	eb 1d                	jmp    c0009be7 <vsprintf+0x192>
c0009bca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009bcd:	0f b6 10             	movzbl (%eax),%edx
c0009bd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009bd3:	88 10                	mov    %dl,(%eax)
c0009bd5:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009bd9:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009be0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009be3:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009be6:	90                   	nop
c0009be7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009beb:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009bee:	0f b6 00             	movzbl (%eax),%eax
c0009bf1:	84 c0                	test   %al,%al
c0009bf3:	0f 85 9f fe ff ff    	jne    c0009a98 <vsprintf+0x43>
c0009bf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009bfc:	2b 45 08             	sub    0x8(%ebp),%eax
c0009bff:	c9                   	leave  
c0009c00:	c3                   	ret    

c0009c01 <printx>:
c0009c01:	55                   	push   %ebp
c0009c02:	89 e5                	mov    %esp,%ebp
c0009c04:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009c0a:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009c0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009c10:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c13:	83 ec 04             	sub    $0x4,%esp
c0009c16:	ff 75 f4             	pushl  -0xc(%ebp)
c0009c19:	50                   	push   %eax
c0009c1a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009c20:	50                   	push   %eax
c0009c21:	e8 2f fe ff ff       	call   c0009a55 <vsprintf>
c0009c26:	83 c4 10             	add    $0x10,%esp
c0009c29:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c2c:	83 ec 08             	sub    $0x8,%esp
c0009c2f:	ff 75 f0             	pushl  -0x10(%ebp)
c0009c32:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009c38:	50                   	push   %eax
c0009c39:	e8 0a 8d ff ff       	call   c0002948 <write_debug>
c0009c3e:	83 c4 10             	add    $0x10,%esp
c0009c41:	90                   	nop
c0009c42:	c9                   	leave  
c0009c43:	c3                   	ret    

c0009c44 <sys_printx>:
c0009c44:	55                   	push   %ebp
c0009c45:	89 e5                	mov    %esp,%ebp
c0009c47:	83 ec 28             	sub    $0x28,%esp
c0009c4a:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009c4f:	85 c0                	test   %eax,%eax
c0009c51:	75 15                	jne    c0009c68 <sys_printx+0x24>
c0009c53:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c56:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009c5c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009c5f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009c66:	eb 10                	jmp    c0009c78 <sys_printx+0x34>
c0009c68:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009c6d:	85 c0                	test   %eax,%eax
c0009c6f:	74 07                	je     c0009c78 <sys_printx+0x34>
c0009c71:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009c78:	8b 55 08             	mov    0x8(%ebp),%edx
c0009c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c7e:	01 d0                	add    %edx,%eax
c0009c80:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009c83:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c86:	8b 80 30 01 00 00    	mov    0x130(%eax),%eax
c0009c8c:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009c92:	05 00 0e 01 c0       	add    $0xc0010e00,%eax
c0009c97:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009c9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009c9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ca0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ca3:	0f b6 00             	movzbl (%eax),%eax
c0009ca6:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0009ca9:	eb 3a                	jmp    c0009ce5 <sys_printx+0xa1>
c0009cab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cae:	0f b6 00             	movzbl (%eax),%eax
c0009cb1:	3c 3b                	cmp    $0x3b,%al
c0009cb3:	74 0a                	je     c0009cbf <sys_printx+0x7b>
c0009cb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cb8:	0f b6 00             	movzbl (%eax),%eax
c0009cbb:	3c 3a                	cmp    $0x3a,%al
c0009cbd:	75 06                	jne    c0009cc5 <sys_printx+0x81>
c0009cbf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009cc3:	eb 20                	jmp    c0009ce5 <sys_printx+0xa1>
c0009cc5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cc8:	0f b6 00             	movzbl (%eax),%eax
c0009ccb:	0f b6 c0             	movzbl %al,%eax
c0009cce:	83 ec 08             	sub    $0x8,%esp
c0009cd1:	50                   	push   %eax
c0009cd2:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009cd5:	e8 1f b5 ff ff       	call   c00051f9 <out_char>
c0009cda:	83 c4 10             	add    $0x10,%esp
c0009cdd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009ce1:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009ce5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009ce9:	7f c0                	jg     c0009cab <sys_printx+0x67>
c0009ceb:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009cef:	75 10                	jne    c0009d01 <sys_printx+0xbd>
c0009cf1:	a1 a4 07 01 c0       	mov    0xc00107a4,%eax
c0009cf6:	85 c0                	test   %eax,%eax
c0009cf8:	74 13                	je     c0009d0d <sys_printx+0xc9>
c0009cfa:	e8 bc 7a ff ff       	call   c00017bb <disable_int>
c0009cff:	eb 0c                	jmp    c0009d0d <sys_printx+0xc9>
c0009d01:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009d05:	75 06                	jne    c0009d0d <sys_printx+0xc9>
c0009d07:	e8 af 7a ff ff       	call   c00017bb <disable_int>
c0009d0c:	90                   	nop
c0009d0d:	90                   	nop
c0009d0e:	c9                   	leave  
c0009d0f:	c3                   	ret    

c0009d10 <spin>:
c0009d10:	55                   	push   %ebp
c0009d11:	89 e5                	mov    %esp,%ebp
c0009d13:	83 ec 08             	sub    $0x8,%esp
c0009d16:	83 ec 0c             	sub    $0xc,%esp
c0009d19:	ff 75 08             	pushl  0x8(%ebp)
c0009d1c:	e8 6b 78 ff ff       	call   c000158c <disp_str>
c0009d21:	83 c4 10             	add    $0x10,%esp
c0009d24:	83 ec 0c             	sub    $0xc,%esp
c0009d27:	68 8f bc 00 c0       	push   $0xc000bc8f
c0009d2c:	e8 5b 78 ff ff       	call   c000158c <disp_str>
c0009d31:	83 c4 10             	add    $0x10,%esp
c0009d34:	eb fe                	jmp    c0009d34 <spin+0x24>

c0009d36 <panic>:
c0009d36:	55                   	push   %ebp
c0009d37:	89 e5                	mov    %esp,%ebp
c0009d39:	83 ec 08             	sub    $0x8,%esp
c0009d3c:	83 ec 04             	sub    $0x4,%esp
c0009d3f:	ff 75 08             	pushl  0x8(%ebp)
c0009d42:	6a 3a                	push   $0x3a
c0009d44:	68 89 c1 00 c0       	push   $0xc000c189
c0009d49:	e8 b3 fe ff ff       	call   c0009c01 <printx>
c0009d4e:	83 c4 10             	add    $0x10,%esp
c0009d51:	90                   	nop
c0009d52:	c9                   	leave  
c0009d53:	c3                   	ret    

c0009d54 <assertion_failure>:
c0009d54:	55                   	push   %ebp
c0009d55:	89 e5                	mov    %esp,%ebp
c0009d57:	83 ec 08             	sub    $0x8,%esp
c0009d5a:	83 ec 08             	sub    $0x8,%esp
c0009d5d:	ff 75 14             	pushl  0x14(%ebp)
c0009d60:	ff 75 10             	pushl  0x10(%ebp)
c0009d63:	ff 75 0c             	pushl  0xc(%ebp)
c0009d66:	ff 75 08             	pushl  0x8(%ebp)
c0009d69:	6a 3b                	push   $0x3b
c0009d6b:	68 90 c1 00 c0       	push   $0xc000c190
c0009d70:	e8 8c fe ff ff       	call   c0009c01 <printx>
c0009d75:	83 c4 20             	add    $0x20,%esp
c0009d78:	83 ec 0c             	sub    $0xc,%esp
c0009d7b:	68 c3 c1 00 c0       	push   $0xc000c1c3
c0009d80:	e8 8b ff ff ff       	call   c0009d10 <spin>
c0009d85:	83 c4 10             	add    $0x10,%esp
c0009d88:	90                   	nop
c0009d89:	c9                   	leave  
c0009d8a:	c3                   	ret    

c0009d8b <dead_lock>:
c0009d8b:	55                   	push   %ebp
c0009d8c:	89 e5                	mov    %esp,%ebp
c0009d8e:	b8 00 00 00 00       	mov    $0x0,%eax
c0009d93:	5d                   	pop    %ebp
c0009d94:	c3                   	ret    

c0009d95 <sys_send_msg>:
c0009d95:	55                   	push   %ebp
c0009d96:	89 e5                	mov    %esp,%ebp
c0009d98:	83 ec 38             	sub    $0x38,%esp
c0009d9b:	83 ec 0c             	sub    $0xc,%esp
c0009d9e:	ff 75 0c             	pushl  0xc(%ebp)
c0009da1:	e8 e0 ad ff ff       	call   c0004b86 <pid2proc>
c0009da6:	83 c4 10             	add    $0x10,%esp
c0009da9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009dac:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009db0:	74 2c                	je     c0009dde <sys_send_msg+0x49>
c0009db2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009db5:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009dbb:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009dc0:	74 1c                	je     c0009dde <sys_send_msg+0x49>
c0009dc2:	68 0b 06 00 00       	push   $0x60b
c0009dc7:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009dcc:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009dd1:	68 e0 c1 00 c0       	push   $0xc000c1e0
c0009dd6:	e8 79 ff ff ff       	call   c0009d54 <assertion_failure>
c0009ddb:	83 c4 10             	add    $0x10,%esp
c0009dde:	8b 45 10             	mov    0x10(%ebp),%eax
c0009de1:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c0009de7:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c0009dec:	74 1c                	je     c0009e0a <sys_send_msg+0x75>
c0009dee:	68 0d 06 00 00       	push   $0x60d
c0009df3:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009df8:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009dfd:	68 08 c2 00 c0       	push   $0xc000c208
c0009e02:	e8 4d ff ff ff       	call   c0009d54 <assertion_failure>
c0009e07:	83 c4 10             	add    $0x10,%esp
c0009e0a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009e0e:	75 22                	jne    c0009e32 <sys_send_msg+0x9d>
c0009e10:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0009e14:	75 1c                	jne    c0009e32 <sys_send_msg+0x9d>
c0009e16:	68 10 06 00 00       	push   $0x610
c0009e1b:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009e20:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009e25:	68 2b c2 00 c0       	push   $0xc000c22b
c0009e2a:	e8 25 ff ff ff       	call   c0009d54 <assertion_failure>
c0009e2f:	83 c4 10             	add    $0x10,%esp
c0009e32:	83 ec 0c             	sub    $0xc,%esp
c0009e35:	ff 75 10             	pushl  0x10(%ebp)
c0009e38:	e8 bb ad ff ff       	call   c0004bf8 <proc2pid>
c0009e3d:	83 c4 10             	add    $0x10,%esp
c0009e40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009e43:	8b 45 10             	mov    0x10(%ebp),%eax
c0009e46:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009e4c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009e4f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009e56:	8b 45 08             	mov    0x8(%ebp),%eax
c0009e59:	83 ec 08             	sub    $0x8,%esp
c0009e5c:	6a 7c                	push   $0x7c
c0009e5e:	50                   	push   %eax
c0009e5f:	e8 fb d1 ff ff       	call   c000705f <alloc_virtual_memory>
c0009e64:	83 c4 10             	add    $0x10,%esp
c0009e67:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009e6a:	c7 45 d8 7c 00 00 00 	movl   $0x7c,-0x28(%ebp)
c0009e71:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009e74:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009e77:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009e7a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009e7d:	89 10                	mov    %edx,(%eax)
c0009e7f:	83 ec 08             	sub    $0x8,%esp
c0009e82:	ff 75 0c             	pushl  0xc(%ebp)
c0009e85:	ff 75 e8             	pushl  -0x18(%ebp)
c0009e88:	e8 fe fe ff ff       	call   c0009d8b <dead_lock>
c0009e8d:	83 c4 10             	add    $0x10,%esp
c0009e90:	83 f8 01             	cmp    $0x1,%eax
c0009e93:	75 10                	jne    c0009ea5 <sys_send_msg+0x110>
c0009e95:	83 ec 0c             	sub    $0xc,%esp
c0009e98:	68 3b c2 00 c0       	push   $0xc000c23b
c0009e9d:	e8 94 fe ff ff       	call   c0009d36 <panic>
c0009ea2:	83 c4 10             	add    $0x10,%esp
c0009ea5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ea8:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009eaf:	3c 02                	cmp    $0x2,%al
c0009eb1:	0f 85 99 01 00 00    	jne    c000a050 <sys_send_msg+0x2bb>
c0009eb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009eba:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009ec0:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0009ec3:	74 12                	je     c0009ed7 <sys_send_msg+0x142>
c0009ec5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ec8:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009ece:	83 f8 12             	cmp    $0x12,%eax
c0009ed1:	0f 85 79 01 00 00    	jne    c000a050 <sys_send_msg+0x2bb>
c0009ed7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009eda:	8b 80 78 02 00 00    	mov    0x278(%eax),%eax
c0009ee0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009ee3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ee6:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009eec:	83 ec 08             	sub    $0x8,%esp
c0009eef:	6a 7c                	push   $0x7c
c0009ef1:	50                   	push   %eax
c0009ef2:	e8 68 d1 ff ff       	call   c000705f <alloc_virtual_memory>
c0009ef7:	83 c4 10             	add    $0x10,%esp
c0009efa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009efd:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009f00:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009f03:	83 ec 04             	sub    $0x4,%esp
c0009f06:	ff 75 d8             	pushl  -0x28(%ebp)
c0009f09:	52                   	push   %edx
c0009f0a:	50                   	push   %eax
c0009f0b:	e8 5f de ff ff       	call   c0007d6f <Memcpy>
c0009f10:	83 c4 10             	add    $0x10,%esp
c0009f13:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f16:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009f1d:	00 00 00 
c0009f20:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f23:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009f2a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f2d:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009f34:	00 00 00 
c0009f37:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009f3a:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c0009f41:	00 00 00 
c0009f44:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009f47:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c0009f4e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009f51:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c0009f58:	00 00 00 
c0009f5b:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f5e:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c0009f65:	00 00 00 
c0009f68:	83 ec 0c             	sub    $0xc,%esp
c0009f6b:	ff 75 ec             	pushl  -0x14(%ebp)
c0009f6e:	e8 45 08 00 00       	call   c000a7b8 <unblock>
c0009f73:	83 c4 10             	add    $0x10,%esp
c0009f76:	8b 45 10             	mov    0x10(%ebp),%eax
c0009f79:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009f80:	84 c0                	test   %al,%al
c0009f82:	74 1c                	je     c0009fa0 <sys_send_msg+0x20b>
c0009f84:	68 41 06 00 00       	push   $0x641
c0009f89:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009f8e:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009f93:	68 46 c2 00 c0       	push   $0xc000c246
c0009f98:	e8 b7 fd ff ff       	call   c0009d54 <assertion_failure>
c0009f9d:	83 c4 10             	add    $0x10,%esp
c0009fa0:	8b 45 10             	mov    0x10(%ebp),%eax
c0009fa3:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009fa9:	83 f8 21             	cmp    $0x21,%eax
c0009fac:	74 1c                	je     c0009fca <sys_send_msg+0x235>
c0009fae:	68 42 06 00 00       	push   $0x642
c0009fb3:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009fb8:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009fbd:	68 5a c2 00 c0       	push   $0xc000c25a
c0009fc2:	e8 8d fd ff ff       	call   c0009d54 <assertion_failure>
c0009fc7:	83 c4 10             	add    $0x10,%esp
c0009fca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009fcd:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009fd3:	85 c0                	test   %eax,%eax
c0009fd5:	74 1c                	je     c0009ff3 <sys_send_msg+0x25e>
c0009fd7:	68 44 06 00 00       	push   $0x644
c0009fdc:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009fe1:	68 cf c1 00 c0       	push   $0xc000c1cf
c0009fe6:	68 77 c2 00 c0       	push   $0xc000c277
c0009feb:	e8 64 fd ff ff       	call   c0009d54 <assertion_failure>
c0009ff0:	83 c4 10             	add    $0x10,%esp
c0009ff3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ff6:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c0009ffd:	84 c0                	test   %al,%al
c0009fff:	74 1c                	je     c000a01d <sys_send_msg+0x288>
c000a001:	68 45 06 00 00       	push   $0x645
c000a006:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a00b:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a010:	68 8c c2 00 c0       	push   $0xc000c28c
c000a015:	e8 3a fd ff ff       	call   c0009d54 <assertion_failure>
c000a01a:	83 c4 10             	add    $0x10,%esp
c000a01d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a020:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a026:	83 f8 21             	cmp    $0x21,%eax
c000a029:	0f 84 45 01 00 00    	je     c000a174 <sys_send_msg+0x3df>
c000a02f:	68 46 06 00 00       	push   $0x646
c000a034:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a039:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a03e:	68 a4 c2 00 c0       	push   $0xc000c2a4
c000a043:	e8 0c fd ff ff       	call   c0009d54 <assertion_failure>
c000a048:	83 c4 10             	add    $0x10,%esp
c000a04b:	e9 24 01 00 00       	jmp    c000a174 <sys_send_msg+0x3df>
c000a050:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a057:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a05a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a05d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a060:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a066:	85 c0                	test   %eax,%eax
c000a068:	75 1b                	jne    c000a085 <sys_send_msg+0x2f0>
c000a06a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a06d:	8b 55 10             	mov    0x10(%ebp),%edx
c000a070:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000a076:	8b 45 10             	mov    0x10(%ebp),%eax
c000a079:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a080:	00 00 00 
c000a083:	eb 3f                	jmp    c000a0c4 <sys_send_msg+0x32f>
c000a085:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a088:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a08e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a091:	eb 12                	jmp    c000a0a5 <sys_send_msg+0x310>
c000a093:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a096:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a099:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a09c:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c000a0a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0a5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a0a9:	75 e8                	jne    c000a093 <sys_send_msg+0x2fe>
c000a0ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0ae:	8b 55 10             	mov    0x10(%ebp),%edx
c000a0b1:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000a0b7:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0ba:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a0c1:	00 00 00 
c000a0c4:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0c7:	8b 55 08             	mov    0x8(%ebp),%edx
c000a0ca:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c000a0d0:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0d3:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a0d6:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c000a0dc:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0df:	c6 80 48 02 00 00 01 	movb   $0x1,0x248(%eax)
c000a0e6:	8b 45 10             	mov    0x10(%ebp),%eax
c000a0e9:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a0f0:	3c 01                	cmp    $0x1,%al
c000a0f2:	74 1c                	je     c000a110 <sys_send_msg+0x37b>
c000a0f4:	68 67 06 00 00       	push   $0x667
c000a0f9:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a0fe:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a103:	68 c8 c2 00 c0       	push   $0xc000c2c8
c000a108:	e8 47 fc ff ff       	call   c0009d54 <assertion_failure>
c000a10d:	83 c4 10             	add    $0x10,%esp
c000a110:	8b 45 10             	mov    0x10(%ebp),%eax
c000a113:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a119:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000a11c:	74 1c                	je     c000a13a <sys_send_msg+0x3a5>
c000a11e:	68 68 06 00 00       	push   $0x668
c000a123:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a128:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a12d:	68 e4 c2 00 c0       	push   $0xc000c2e4
c000a132:	e8 1d fc ff ff       	call   c0009d54 <assertion_failure>
c000a137:	83 c4 10             	add    $0x10,%esp
c000a13a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a13d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a143:	39 45 08             	cmp    %eax,0x8(%ebp)
c000a146:	74 1c                	je     c000a164 <sys_send_msg+0x3cf>
c000a148:	68 69 06 00 00       	push   $0x669
c000a14d:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a152:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a157:	68 06 c3 00 c0       	push   $0xc000c306
c000a15c:	e8 f3 fb ff ff       	call   c0009d54 <assertion_failure>
c000a161:	83 c4 10             	add    $0x10,%esp
c000a164:	83 ec 0c             	sub    $0xc,%esp
c000a167:	ff 75 10             	pushl  0x10(%ebp)
c000a16a:	e8 0d 06 00 00       	call   c000a77c <block>
c000a16f:	83 c4 10             	add    $0x10,%esp
c000a172:	eb 01                	jmp    c000a175 <sys_send_msg+0x3e0>
c000a174:	90                   	nop
c000a175:	b8 00 00 00 00       	mov    $0x0,%eax
c000a17a:	c9                   	leave  
c000a17b:	c3                   	ret    

c000a17c <sys_receive_msg>:
c000a17c:	55                   	push   %ebp
c000a17d:	89 e5                	mov    %esp,%ebp
c000a17f:	83 ec 48             	sub    $0x48,%esp
c000a182:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a189:	83 ec 0c             	sub    $0xc,%esp
c000a18c:	ff 75 0c             	pushl  0xc(%ebp)
c000a18f:	e8 f2 a9 ff ff       	call   c0004b86 <pid2proc>
c000a194:	83 c4 10             	add    $0x10,%esp
c000a197:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a19a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c000a19e:	74 2c                	je     c000a1cc <sys_receive_msg+0x50>
c000a1a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a1a3:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000a1a9:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c000a1ae:	74 1c                	je     c000a1cc <sys_receive_msg+0x50>
c000a1b0:	68 7d 06 00 00       	push   $0x67d
c000a1b5:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a1ba:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a1bf:	68 08 c2 00 c0       	push   $0xc000c208
c000a1c4:	e8 8b fb ff ff       	call   c0009d54 <assertion_failure>
c000a1c9:	83 c4 10             	add    $0x10,%esp
c000a1cc:	8b 45 10             	mov    0x10(%ebp),%eax
c000a1cf:	8b 80 b0 02 00 00    	mov    0x2b0(%eax),%eax
c000a1d5:	3d e0 cd ab 99       	cmp    $0x99abcde0,%eax
c000a1da:	74 1c                	je     c000a1f8 <sys_receive_msg+0x7c>
c000a1dc:	68 7f 06 00 00       	push   $0x67f
c000a1e1:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a1e6:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a1eb:	68 e0 c1 00 c0       	push   $0xc000c1e0
c000a1f0:	e8 5f fb ff ff       	call   c0009d54 <assertion_failure>
c000a1f5:	83 c4 10             	add    $0x10,%esp
c000a1f8:	83 ec 0c             	sub    $0xc,%esp
c000a1fb:	ff 75 10             	pushl  0x10(%ebp)
c000a1fe:	e8 f5 a9 ff ff       	call   c0004bf8 <proc2pid>
c000a203:	83 c4 10             	add    $0x10,%esp
c000a206:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a209:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a210:	8b 45 10             	mov    0x10(%ebp),%eax
c000a213:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c000a219:	85 c0                	test   %eax,%eax
c000a21b:	0f 84 b5 00 00 00    	je     c000a2d6 <sys_receive_msg+0x15a>
c000a221:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a225:	74 0d                	je     c000a234 <sys_receive_msg+0xb8>
c000a227:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c000a22e:	0f 85 a2 00 00 00    	jne    c000a2d6 <sys_receive_msg+0x15a>
c000a234:	c7 45 dc 7c 00 00 00 	movl   $0x7c,-0x24(%ebp)
c000a23b:	83 ec 0c             	sub    $0xc,%esp
c000a23e:	ff 75 dc             	pushl  -0x24(%ebp)
c000a241:	e8 5e 87 ff ff       	call   c00029a4 <sys_malloc>
c000a246:	83 c4 10             	add    $0x10,%esp
c000a249:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a24c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000a24f:	83 ec 04             	sub    $0x4,%esp
c000a252:	50                   	push   %eax
c000a253:	6a 00                	push   $0x0
c000a255:	ff 75 d8             	pushl  -0x28(%ebp)
c000a258:	e8 2e 22 00 00       	call   c000c48b <Memset>
c000a25d:	83 c4 10             	add    $0x10,%esp
c000a260:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a263:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a269:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a26c:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c000a273:	8b 45 08             	mov    0x8(%ebp),%eax
c000a276:	83 ec 08             	sub    $0x8,%esp
c000a279:	ff 75 dc             	pushl  -0x24(%ebp)
c000a27c:	50                   	push   %eax
c000a27d:	e8 dd cd ff ff       	call   c000705f <alloc_virtual_memory>
c000a282:	83 c4 10             	add    $0x10,%esp
c000a285:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000a288:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000a28b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000a28e:	83 ec 04             	sub    $0x4,%esp
c000a291:	52                   	push   %edx
c000a292:	ff 75 d8             	pushl  -0x28(%ebp)
c000a295:	50                   	push   %eax
c000a296:	e8 d4 da ff ff       	call   c0007d6f <Memcpy>
c000a29b:	83 c4 10             	add    $0x10,%esp
c000a29e:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2a1:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a2a8:	00 00 00 
c000a2ab:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2ae:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a2b5:	00 00 00 
c000a2b8:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2bb:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a2c2:	00 00 00 
c000a2c5:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2c8:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a2cf:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000a2d6:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000a2da:	0f 84 96 03 00 00    	je     c000a676 <sys_receive_msg+0x4fa>
c000a2e0:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a2e4:	75 26                	jne    c000a30c <sys_receive_msg+0x190>
c000a2e6:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2e9:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a2ef:	85 c0                	test   %eax,%eax
c000a2f1:	0f 84 8a 00 00 00    	je     c000a381 <sys_receive_msg+0x205>
c000a2f7:	8b 45 10             	mov    0x10(%ebp),%eax
c000a2fa:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a300:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a303:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a30a:	eb 75                	jmp    c000a381 <sys_receive_msg+0x205>
c000a30c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a310:	78 6f                	js     c000a381 <sys_receive_msg+0x205>
c000a312:	83 7d 0c 07          	cmpl   $0x7,0xc(%ebp)
c000a316:	7f 69                	jg     c000a381 <sys_receive_msg+0x205>
c000a318:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a31b:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a322:	3c 01                	cmp    $0x1,%al
c000a324:	75 5b                	jne    c000a381 <sys_receive_msg+0x205>
c000a326:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a329:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a32f:	83 f8 12             	cmp    $0x12,%eax
c000a332:	74 0e                	je     c000a342 <sys_receive_msg+0x1c6>
c000a334:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a337:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a33d:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c000a340:	75 3f                	jne    c000a381 <sys_receive_msg+0x205>
c000a342:	8b 45 10             	mov    0x10(%ebp),%eax
c000a345:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a34b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a34e:	eb 2b                	jmp    c000a37b <sys_receive_msg+0x1ff>
c000a350:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a353:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a356:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a359:	8b 90 24 01 00 00    	mov    0x124(%eax),%edx
c000a35f:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a362:	39 c2                	cmp    %eax,%edx
c000a364:	75 09                	jne    c000a36f <sys_receive_msg+0x1f3>
c000a366:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000a36d:	eb 12                	jmp    c000a381 <sys_receive_msg+0x205>
c000a36f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a372:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c000a378:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a37b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a37f:	75 cf                	jne    c000a350 <sys_receive_msg+0x1d4>
c000a381:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000a385:	0f 85 21 02 00 00    	jne    c000a5ac <sys_receive_msg+0x430>
c000a38b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a38e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a391:	8b 45 08             	mov    0x8(%ebp),%eax
c000a394:	83 ec 08             	sub    $0x8,%esp
c000a397:	6a 7c                	push   $0x7c
c000a399:	50                   	push   %eax
c000a39a:	e8 c0 cc ff ff       	call   c000705f <alloc_virtual_memory>
c000a39f:	83 c4 10             	add    $0x10,%esp
c000a3a2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000a3a5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a3a8:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a3ae:	83 ec 08             	sub    $0x8,%esp
c000a3b1:	6a 7c                	push   $0x7c
c000a3b3:	50                   	push   %eax
c000a3b4:	e8 a6 cc ff ff       	call   c000705f <alloc_virtual_memory>
c000a3b9:	83 c4 10             	add    $0x10,%esp
c000a3bc:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a3bf:	83 ec 04             	sub    $0x4,%esp
c000a3c2:	6a 7c                	push   $0x7c
c000a3c4:	ff 75 c8             	pushl  -0x38(%ebp)
c000a3c7:	ff 75 cc             	pushl  -0x34(%ebp)
c000a3ca:	e8 a0 d9 ff ff       	call   c0007d6f <Memcpy>
c000a3cf:	83 c4 10             	add    $0x10,%esp
c000a3d2:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a3d5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000a3d8:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3db:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000a3e1:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000a3e4:	75 21                	jne    c000a407 <sys_receive_msg+0x28b>
c000a3e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a3e9:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a3ef:	8b 45 10             	mov    0x10(%ebp),%eax
c000a3f2:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000a3f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a3fb:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a402:	00 00 00 
c000a405:	eb 1f                	jmp    c000a426 <sys_receive_msg+0x2aa>
c000a407:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a40a:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000a410:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a413:	89 90 5c 02 00 00    	mov    %edx,0x25c(%eax)
c000a419:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a41c:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000a423:	00 00 00 
c000a426:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a429:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a430:	00 00 00 
c000a433:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a436:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a43d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a440:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a447:	00 00 00 
c000a44a:	8b 45 10             	mov    0x10(%ebp),%eax
c000a44d:	c7 80 4c 02 00 00 00 	movl   $0x0,0x24c(%eax)
c000a454:	00 00 00 
c000a457:	8b 45 10             	mov    0x10(%ebp),%eax
c000a45a:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a461:	00 00 00 
c000a464:	8b 45 10             	mov    0x10(%ebp),%eax
c000a467:	c7 80 50 02 00 00 21 	movl   $0x21,0x250(%eax)
c000a46e:	00 00 00 
c000a471:	83 ec 0c             	sub    $0xc,%esp
c000a474:	ff 75 d0             	pushl  -0x30(%ebp)
c000a477:	e8 3c 03 00 00       	call   c000a7b8 <unblock>
c000a47c:	83 c4 10             	add    $0x10,%esp
c000a47f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a482:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a488:	85 c0                	test   %eax,%eax
c000a48a:	74 1c                	je     c000a4a8 <sys_receive_msg+0x32c>
c000a48c:	68 e9 06 00 00       	push   $0x6e9
c000a491:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a496:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a49b:	68 1b c3 00 c0       	push   $0xc000c31b
c000a4a0:	e8 af f8 ff ff       	call   c0009d54 <assertion_failure>
c000a4a5:	83 c4 10             	add    $0x10,%esp
c000a4a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a4ab:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a4b2:	84 c0                	test   %al,%al
c000a4b4:	74 1c                	je     c000a4d2 <sys_receive_msg+0x356>
c000a4b6:	68 ea 06 00 00       	push   $0x6ea
c000a4bb:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a4c0:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a4c5:	68 33 c3 00 c0       	push   $0xc000c333
c000a4ca:	e8 85 f8 ff ff       	call   c0009d54 <assertion_failure>
c000a4cf:	83 c4 10             	add    $0x10,%esp
c000a4d2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a4d5:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a4db:	83 f8 21             	cmp    $0x21,%eax
c000a4de:	74 1c                	je     c000a4fc <sys_receive_msg+0x380>
c000a4e0:	68 eb 06 00 00       	push   $0x6eb
c000a4e5:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a4ea:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a4ef:	68 4c c3 00 c0       	push   $0xc000c34c
c000a4f4:	e8 5b f8 ff ff       	call   c0009d54 <assertion_failure>
c000a4f9:	83 c4 10             	add    $0x10,%esp
c000a4fc:	8b 45 10             	mov    0x10(%ebp),%eax
c000a4ff:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a505:	85 c0                	test   %eax,%eax
c000a507:	74 1c                	je     c000a525 <sys_receive_msg+0x3a9>
c000a509:	68 ed 06 00 00       	push   $0x6ed
c000a50e:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a513:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a518:	68 77 c2 00 c0       	push   $0xc000c277
c000a51d:	e8 32 f8 ff ff       	call   c0009d54 <assertion_failure>
c000a522:	83 c4 10             	add    $0x10,%esp
c000a525:	8b 45 10             	mov    0x10(%ebp),%eax
c000a528:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a52f:	84 c0                	test   %al,%al
c000a531:	74 1c                	je     c000a54f <sys_receive_msg+0x3d3>
c000a533:	68 ee 06 00 00       	push   $0x6ee
c000a538:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a53d:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a542:	68 8c c2 00 c0       	push   $0xc000c28c
c000a547:	e8 08 f8 ff ff       	call   c0009d54 <assertion_failure>
c000a54c:	83 c4 10             	add    $0x10,%esp
c000a54f:	8b 45 10             	mov    0x10(%ebp),%eax
c000a552:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a558:	83 f8 21             	cmp    $0x21,%eax
c000a55b:	74 1c                	je     c000a579 <sys_receive_msg+0x3fd>
c000a55d:	68 ef 06 00 00       	push   $0x6ef
c000a562:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a567:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a56c:	68 a4 c2 00 c0       	push   $0xc000c2a4
c000a571:	e8 de f7 ff ff       	call   c0009d54 <assertion_failure>
c000a576:	83 c4 10             	add    $0x10,%esp
c000a579:	8b 45 10             	mov    0x10(%ebp),%eax
c000a57c:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000a582:	83 f8 21             	cmp    $0x21,%eax
c000a585:	0f 84 e4 00 00 00    	je     c000a66f <sys_receive_msg+0x4f3>
c000a58b:	68 f0 06 00 00       	push   $0x6f0
c000a590:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a595:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a59a:	68 70 c3 00 c0       	push   $0xc000c370
c000a59f:	e8 b0 f7 ff ff       	call   c0009d54 <assertion_failure>
c000a5a4:	83 c4 10             	add    $0x10,%esp
c000a5a7:	e9 c3 00 00 00       	jmp    c000a66f <sys_receive_msg+0x4f3>
c000a5ac:	8b 45 10             	mov    0x10(%ebp),%eax
c000a5af:	c6 80 48 02 00 00 02 	movb   $0x2,0x248(%eax)
c000a5b6:	8b 45 10             	mov    0x10(%ebp),%eax
c000a5b9:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a5c0:	3c 02                	cmp    $0x2,%al
c000a5c2:	74 1c                	je     c000a5e0 <sys_receive_msg+0x464>
c000a5c4:	68 f5 06 00 00       	push   $0x6f5
c000a5c9:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a5ce:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a5d3:	68 8f c3 00 c0       	push   $0xc000c38f
c000a5d8:	e8 77 f7 ff ff       	call   c0009d54 <assertion_failure>
c000a5dd:	83 c4 10             	add    $0x10,%esp
c000a5e0:	8b 45 10             	mov    0x10(%ebp),%eax
c000a5e3:	8b 55 08             	mov    0x8(%ebp),%edx
c000a5e6:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c000a5ec:	8b 45 10             	mov    0x10(%ebp),%eax
c000a5ef:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a5f6:	3c 02                	cmp    $0x2,%al
c000a5f8:	74 1c                	je     c000a616 <sys_receive_msg+0x49a>
c000a5fa:	68 f7 06 00 00       	push   $0x6f7
c000a5ff:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a604:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a609:	68 8f c3 00 c0       	push   $0xc000c38f
c000a60e:	e8 41 f7 ff ff       	call   c0009d54 <assertion_failure>
c000a613:	83 c4 10             	add    $0x10,%esp
c000a616:	83 7d 0c 12          	cmpl   $0x12,0xc(%ebp)
c000a61a:	75 0f                	jne    c000a62b <sys_receive_msg+0x4af>
c000a61c:	8b 45 10             	mov    0x10(%ebp),%eax
c000a61f:	c7 80 54 02 00 00 12 	movl   $0x12,0x254(%eax)
c000a626:	00 00 00 
c000a629:	eb 0c                	jmp    c000a637 <sys_receive_msg+0x4bb>
c000a62b:	8b 45 10             	mov    0x10(%ebp),%eax
c000a62e:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a631:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c000a637:	8b 45 10             	mov    0x10(%ebp),%eax
c000a63a:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a641:	3c 02                	cmp    $0x2,%al
c000a643:	74 1c                	je     c000a661 <sys_receive_msg+0x4e5>
c000a645:	68 02 07 00 00       	push   $0x702
c000a64a:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a64f:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a654:	68 8f c3 00 c0       	push   $0xc000c38f
c000a659:	e8 f6 f6 ff ff       	call   c0009d54 <assertion_failure>
c000a65e:	83 c4 10             	add    $0x10,%esp
c000a661:	83 ec 0c             	sub    $0xc,%esp
c000a664:	ff 75 10             	pushl  0x10(%ebp)
c000a667:	e8 10 01 00 00       	call   c000a77c <block>
c000a66c:	83 c4 10             	add    $0x10,%esp
c000a66f:	b8 00 00 00 00       	mov    $0x0,%eax
c000a674:	eb 02                	jmp    c000a678 <sys_receive_msg+0x4fc>
c000a676:	90                   	nop
c000a677:	90                   	nop
c000a678:	c9                   	leave  
c000a679:	c3                   	ret    

c000a67a <disp_str_colour_debug>:
c000a67a:	55                   	push   %ebp
c000a67b:	89 e5                	mov    %esp,%ebp
c000a67d:	90                   	nop
c000a67e:	5d                   	pop    %ebp
c000a67f:	c3                   	ret    

c000a680 <send_rec>:
c000a680:	55                   	push   %ebp
c000a681:	89 e5                	mov    %esp,%ebp
c000a683:	83 ec 18             	sub    $0x18,%esp
c000a686:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a689:	83 ec 0c             	sub    $0xc,%esp
c000a68c:	50                   	push   %eax
c000a68d:	e8 94 ca ff ff       	call   c0007126 <get_physical_address>
c000a692:	83 c4 10             	add    $0x10,%esp
c000a695:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a698:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a69c:	74 28                	je     c000a6c6 <send_rec+0x46>
c000a69e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a6a2:	74 22                	je     c000a6c6 <send_rec+0x46>
c000a6a4:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a6a8:	74 1c                	je     c000a6c6 <send_rec+0x46>
c000a6aa:	68 22 07 00 00       	push   $0x722
c000a6af:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a6b4:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a6b9:	68 b0 c3 00 c0       	push   $0xc000c3b0
c000a6be:	e8 91 f6 ff ff       	call   c0009d54 <assertion_failure>
c000a6c3:	83 c4 10             	add    $0x10,%esp
c000a6c6:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a6ca:	75 12                	jne    c000a6de <send_rec+0x5e>
c000a6cc:	83 ec 04             	sub    $0x4,%esp
c000a6cf:	6a 7c                	push   $0x7c
c000a6d1:	6a 00                	push   $0x0
c000a6d3:	ff 75 0c             	pushl  0xc(%ebp)
c000a6d6:	e8 b0 1d 00 00       	call   c000c48b <Memset>
c000a6db:	83 c4 10             	add    $0x10,%esp
c000a6de:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000a6e2:	74 23                	je     c000a707 <send_rec+0x87>
c000a6e4:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000a6e8:	74 34                	je     c000a71e <send_rec+0x9e>
c000a6ea:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c000a6ee:	75 72                	jne    c000a762 <send_rec+0xe2>
c000a6f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6f3:	83 ec 08             	sub    $0x8,%esp
c000a6f6:	ff 75 10             	pushl  0x10(%ebp)
c000a6f9:	50                   	push   %eax
c000a6fa:	e8 69 82 ff ff       	call   c0002968 <send_msg>
c000a6ff:	83 c4 10             	add    $0x10,%esp
c000a702:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a705:	eb 6e                	jmp    c000a775 <send_rec+0xf5>
c000a707:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a70a:	83 ec 08             	sub    $0x8,%esp
c000a70d:	ff 75 10             	pushl  0x10(%ebp)
c000a710:	50                   	push   %eax
c000a711:	e8 78 82 ff ff       	call   c000298e <receive_msg>
c000a716:	83 c4 10             	add    $0x10,%esp
c000a719:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a71c:	eb 57                	jmp    c000a775 <send_rec+0xf5>
c000a71e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a721:	83 ec 08             	sub    $0x8,%esp
c000a724:	ff 75 10             	pushl  0x10(%ebp)
c000a727:	50                   	push   %eax
c000a728:	e8 3b 82 ff ff       	call   c0002968 <send_msg>
c000a72d:	83 c4 10             	add    $0x10,%esp
c000a730:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a733:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a737:	75 3b                	jne    c000a774 <send_rec+0xf4>
c000a739:	83 ec 04             	sub    $0x4,%esp
c000a73c:	6a 7c                	push   $0x7c
c000a73e:	6a 00                	push   $0x0
c000a740:	ff 75 0c             	pushl  0xc(%ebp)
c000a743:	e8 43 1d 00 00       	call   c000c48b <Memset>
c000a748:	83 c4 10             	add    $0x10,%esp
c000a74b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a74e:	83 ec 08             	sub    $0x8,%esp
c000a751:	ff 75 10             	pushl  0x10(%ebp)
c000a754:	50                   	push   %eax
c000a755:	e8 34 82 ff ff       	call   c000298e <receive_msg>
c000a75a:	83 c4 10             	add    $0x10,%esp
c000a75d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a760:	eb 12                	jmp    c000a774 <send_rec+0xf4>
c000a762:	83 ec 0c             	sub    $0xc,%esp
c000a765:	68 ec c3 00 c0       	push   $0xc000c3ec
c000a76a:	e8 c7 f5 ff ff       	call   c0009d36 <panic>
c000a76f:	83 c4 10             	add    $0x10,%esp
c000a772:	eb 01                	jmp    c000a775 <send_rec+0xf5>
c000a774:	90                   	nop
c000a775:	b8 00 00 00 00       	mov    $0x0,%eax
c000a77a:	c9                   	leave  
c000a77b:	c3                   	ret    

c000a77c <block>:
c000a77c:	55                   	push   %ebp
c000a77d:	89 e5                	mov    %esp,%ebp
c000a77f:	83 ec 08             	sub    $0x8,%esp
c000a782:	8b 45 08             	mov    0x8(%ebp),%eax
c000a785:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a78c:	84 c0                	test   %al,%al
c000a78e:	75 1c                	jne    c000a7ac <block+0x30>
c000a790:	68 51 07 00 00       	push   $0x751
c000a795:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a79a:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a79f:	68 01 c4 00 c0       	push   $0xc000c401
c000a7a4:	e8 ab f5 ff ff       	call   c0009d54 <assertion_failure>
c000a7a9:	83 c4 10             	add    $0x10,%esp
c000a7ac:	e8 60 a2 ff ff       	call   c0004a11 <schedule_process>
c000a7b1:	b8 00 00 00 00       	mov    $0x0,%eax
c000a7b6:	c9                   	leave  
c000a7b7:	c3                   	ret    

c000a7b8 <unblock>:
c000a7b8:	55                   	push   %ebp
c000a7b9:	89 e5                	mov    %esp,%ebp
c000a7bb:	83 ec 08             	sub    $0x8,%esp
c000a7be:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7c1:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a7c8:	84 c0                	test   %al,%al
c000a7ca:	74 1c                	je     c000a7e8 <unblock+0x30>
c000a7cc:	68 5a 07 00 00       	push   $0x75a
c000a7d1:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a7d6:	68 cf c1 00 c0       	push   $0xc000c1cf
c000a7db:	68 19 c4 00 c0       	push   $0xc000c419
c000a7e0:	e8 6f f5 ff ff       	call   c0009d54 <assertion_failure>
c000a7e5:	83 c4 10             	add    $0x10,%esp
c000a7e8:	8b 45 08             	mov    0x8(%ebp),%eax
c000a7eb:	05 00 01 00 00       	add    $0x100,%eax
c000a7f0:	83 ec 08             	sub    $0x8,%esp
c000a7f3:	50                   	push   %eax
c000a7f4:	68 ec 0d 01 c0       	push   $0xc0010dec
c000a7f9:	e8 52 0a 00 00       	call   c000b250 <appendToDoubleLinkList>
c000a7fe:	83 c4 10             	add    $0x10,%esp
c000a801:	b8 00 00 00 00       	mov    $0x0,%eax
c000a806:	c9                   	leave  
c000a807:	c3                   	ret    

c000a808 <get_ticks_ipc>:
c000a808:	55                   	push   %ebp
c000a809:	89 e5                	mov    %esp,%ebp
c000a80b:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000a811:	83 ec 04             	sub    $0x4,%esp
c000a814:	6a 7c                	push   $0x7c
c000a816:	6a 00                	push   $0x0
c000a818:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a81e:	50                   	push   %eax
c000a81f:	e8 67 1c 00 00       	call   c000c48b <Memset>
c000a824:	83 c4 10             	add    $0x10,%esp
c000a827:	c7 85 78 ff ff ff 01 	movl   $0x1,-0x88(%ebp)
c000a82e:	00 00 00 
c000a831:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000a838:	83 ec 04             	sub    $0x4,%esp
c000a83b:	6a 01                	push   $0x1
c000a83d:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000a843:	50                   	push   %eax
c000a844:	6a 03                	push   $0x3
c000a846:	e8 35 fe ff ff       	call   c000a680 <send_rec>
c000a84b:	83 c4 10             	add    $0x10,%esp
c000a84e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a851:	8b 85 7c ff ff ff    	mov    -0x84(%ebp),%eax
c000a857:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a85a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a85d:	c9                   	leave  
c000a85e:	c3                   	ret    

c000a85f <itoa>:
c000a85f:	55                   	push   %ebp
c000a860:	89 e5                	mov    %esp,%ebp
c000a862:	53                   	push   %ebx
c000a863:	83 ec 14             	sub    $0x14,%esp
c000a866:	8b 45 08             	mov    0x8(%ebp),%eax
c000a869:	99                   	cltd   
c000a86a:	f7 7d 10             	idivl  0x10(%ebp)
c000a86d:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a870:	8b 45 08             	mov    0x8(%ebp),%eax
c000a873:	99                   	cltd   
c000a874:	f7 7d 10             	idivl  0x10(%ebp)
c000a877:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a87a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a87e:	74 14                	je     c000a894 <itoa+0x35>
c000a880:	83 ec 04             	sub    $0x4,%esp
c000a883:	ff 75 10             	pushl  0x10(%ebp)
c000a886:	ff 75 0c             	pushl  0xc(%ebp)
c000a889:	ff 75 f0             	pushl  -0x10(%ebp)
c000a88c:	e8 ce ff ff ff       	call   c000a85f <itoa>
c000a891:	83 c4 10             	add    $0x10,%esp
c000a894:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a897:	8d 58 30             	lea    0x30(%eax),%ebx
c000a89a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a89d:	8b 00                	mov    (%eax),%eax
c000a89f:	8d 48 01             	lea    0x1(%eax),%ecx
c000a8a2:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a8a5:	89 0a                	mov    %ecx,(%edx)
c000a8a7:	89 da                	mov    %ebx,%edx
c000a8a9:	88 10                	mov    %dl,(%eax)
c000a8ab:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a8ae:	8b 00                	mov    (%eax),%eax
c000a8b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a8b3:	c9                   	leave  
c000a8b4:	c3                   	ret    

c000a8b5 <i2a>:
c000a8b5:	55                   	push   %ebp
c000a8b6:	89 e5                	mov    %esp,%ebp
c000a8b8:	53                   	push   %ebx
c000a8b9:	83 ec 14             	sub    $0x14,%esp
c000a8bc:	8b 45 08             	mov    0x8(%ebp),%eax
c000a8bf:	99                   	cltd   
c000a8c0:	f7 7d 0c             	idivl  0xc(%ebp)
c000a8c3:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000a8c6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a8c9:	99                   	cltd   
c000a8ca:	f7 7d 0c             	idivl  0xc(%ebp)
c000a8cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a8d0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000a8d4:	74 14                	je     c000a8ea <i2a+0x35>
c000a8d6:	83 ec 04             	sub    $0x4,%esp
c000a8d9:	ff 75 10             	pushl  0x10(%ebp)
c000a8dc:	ff 75 0c             	pushl  0xc(%ebp)
c000a8df:	ff 75 f0             	pushl  -0x10(%ebp)
c000a8e2:	e8 ce ff ff ff       	call   c000a8b5 <i2a>
c000a8e7:	83 c4 10             	add    $0x10,%esp
c000a8ea:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c000a8ee:	7f 0a                	jg     c000a8fa <i2a+0x45>
c000a8f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8f3:	83 c0 30             	add    $0x30,%eax
c000a8f6:	89 c3                	mov    %eax,%ebx
c000a8f8:	eb 08                	jmp    c000a902 <i2a+0x4d>
c000a8fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a8fd:	83 c0 37             	add    $0x37,%eax
c000a900:	89 c3                	mov    %eax,%ebx
c000a902:	8b 45 10             	mov    0x10(%ebp),%eax
c000a905:	8b 00                	mov    (%eax),%eax
c000a907:	8d 48 01             	lea    0x1(%eax),%ecx
c000a90a:	8b 55 10             	mov    0x10(%ebp),%edx
c000a90d:	89 0a                	mov    %ecx,(%edx)
c000a90f:	88 18                	mov    %bl,(%eax)
c000a911:	8b 45 10             	mov    0x10(%ebp),%eax
c000a914:	8b 00                	mov    (%eax),%eax
c000a916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000a919:	c9                   	leave  
c000a91a:	c3                   	ret    

c000a91b <inform_int>:
c000a91b:	55                   	push   %ebp
c000a91c:	89 e5                	mov    %esp,%ebp
c000a91e:	83 ec 18             	sub    $0x18,%esp
c000a921:	83 ec 0c             	sub    $0xc,%esp
c000a924:	ff 75 08             	pushl  0x8(%ebp)
c000a927:	e8 5a a2 ff ff       	call   c0004b86 <pid2proc>
c000a92c:	83 c4 10             	add    $0x10,%esp
c000a92f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a932:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a935:	0f b6 80 48 02 00 00 	movzbl 0x248(%eax),%eax
c000a93c:	0f be c0             	movsbl %al,%eax
c000a93f:	83 e0 02             	and    $0x2,%eax
c000a942:	85 c0                	test   %eax,%eax
c000a944:	0f 84 8e 00 00 00    	je     c000a9d8 <inform_int+0xbd>
c000a94a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a94d:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a953:	3d 13 02 00 00       	cmp    $0x213,%eax
c000a958:	74 0e                	je     c000a968 <inform_int+0x4d>
c000a95a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a95d:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000a963:	83 f8 12             	cmp    $0x12,%eax
c000a966:	75 7d                	jne    c000a9e5 <inform_int+0xca>
c000a968:	c7 45 f0 7c 00 00 00 	movl   $0x7c,-0x10(%ebp)
c000a96f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a972:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000a978:	83 ec 08             	sub    $0x8,%esp
c000a97b:	ff 75 f0             	pushl  -0x10(%ebp)
c000a97e:	50                   	push   %eax
c000a97f:	e8 db c6 ff ff       	call   c000705f <alloc_virtual_memory>
c000a984:	83 c4 10             	add    $0x10,%esp
c000a987:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a98a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a98d:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000a993:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a996:	c7 40 78 d5 07 00 00 	movl   $0x7d5,0x78(%eax)
c000a99d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a9a0:	c7 80 60 02 00 00 00 	movl   $0x0,0x260(%eax)
c000a9a7:	00 00 00 
c000a9aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a9ad:	c7 80 54 02 00 00 21 	movl   $0x21,0x254(%eax)
c000a9b4:	00 00 00 
c000a9b7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a9be:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a9c1:	c6 80 48 02 00 00 00 	movb   $0x0,0x248(%eax)
c000a9c8:	83 ec 0c             	sub    $0xc,%esp
c000a9cb:	ff 75 f4             	pushl  -0xc(%ebp)
c000a9ce:	e8 e5 fd ff ff       	call   c000a7b8 <unblock>
c000a9d3:	83 c4 10             	add    $0x10,%esp
c000a9d6:	eb 0d                	jmp    c000a9e5 <inform_int+0xca>
c000a9d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a9db:	c7 80 60 02 00 00 01 	movl   $0x1,0x260(%eax)
c000a9e2:	00 00 00 
c000a9e5:	90                   	nop
c000a9e6:	c9                   	leave  
c000a9e7:	c3                   	ret    

c000a9e8 <strcmp>:
c000a9e8:	55                   	push   %ebp
c000a9e9:	89 e5                	mov    %esp,%ebp
c000a9eb:	83 ec 10             	sub    $0x10,%esp
c000a9ee:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000a9f2:	74 06                	je     c000a9fa <strcmp+0x12>
c000a9f4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000a9f8:	75 08                	jne    c000aa02 <strcmp+0x1a>
c000a9fa:	8b 45 08             	mov    0x8(%ebp),%eax
c000a9fd:	2b 45 0c             	sub    0xc(%ebp),%eax
c000aa00:	eb 53                	jmp    c000aa55 <strcmp+0x6d>
c000aa02:	8b 45 08             	mov    0x8(%ebp),%eax
c000aa05:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000aa08:	8b 45 0c             	mov    0xc(%ebp),%eax
c000aa0b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000aa0e:	eb 18                	jmp    c000aa28 <strcmp+0x40>
c000aa10:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000aa13:	0f b6 10             	movzbl (%eax),%edx
c000aa16:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000aa19:	0f b6 00             	movzbl (%eax),%eax
c000aa1c:	38 c2                	cmp    %al,%dl
c000aa1e:	75 1e                	jne    c000aa3e <strcmp+0x56>
c000aa20:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000aa24:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000aa28:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000aa2b:	0f b6 00             	movzbl (%eax),%eax
c000aa2e:	84 c0                	test   %al,%al
c000aa30:	74 0d                	je     c000aa3f <strcmp+0x57>
c000aa32:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000aa35:	0f b6 00             	movzbl (%eax),%eax
c000aa38:	84 c0                	test   %al,%al
c000aa3a:	75 d4                	jne    c000aa10 <strcmp+0x28>
c000aa3c:	eb 01                	jmp    c000aa3f <strcmp+0x57>
c000aa3e:	90                   	nop
c000aa3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000aa42:	0f b6 00             	movzbl (%eax),%eax
c000aa45:	0f be d0             	movsbl %al,%edx
c000aa48:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000aa4b:	0f b6 00             	movzbl (%eax),%eax
c000aa4e:	0f be c0             	movsbl %al,%eax
c000aa51:	29 c2                	sub    %eax,%edx
c000aa53:	89 d0                	mov    %edx,%eax
c000aa55:	c9                   	leave  
c000aa56:	c3                   	ret    

c000aa57 <create_user_process_address_space>:
c000aa57:	55                   	push   %ebp
c000aa58:	89 e5                	mov    %esp,%ebp
c000aa5a:	83 ec 18             	sub    $0x18,%esp
c000aa5d:	83 ec 08             	sub    $0x8,%esp
c000aa60:	6a 00                	push   $0x0
c000aa62:	6a 01                	push   $0x1
c000aa64:	e8 4c c8 ff ff       	call   c00072b5 <alloc_memory>
c000aa69:	83 c4 10             	add    $0x10,%esp
c000aa6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000aa6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa72:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c000aa79:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c000aa80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000aa83:	05 ff 0f 00 00       	add    $0xfff,%eax
c000aa88:	c1 e8 0c             	shr    $0xc,%eax
c000aa8b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000aa8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000aa91:	83 c0 07             	add    $0x7,%eax
c000aa94:	c1 e8 03             	shr    $0x3,%eax
c000aa97:	89 c2                	mov    %eax,%edx
c000aa99:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aa9c:	89 50 04             	mov    %edx,0x4(%eax)
c000aa9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aaa2:	8b 40 04             	mov    0x4(%eax),%eax
c000aaa5:	05 ff 0f 00 00       	add    $0xfff,%eax
c000aaaa:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000aab0:	85 c0                	test   %eax,%eax
c000aab2:	0f 48 c2             	cmovs  %edx,%eax
c000aab5:	c1 f8 0c             	sar    $0xc,%eax
c000aab8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000aabb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aabe:	83 ec 08             	sub    $0x8,%esp
c000aac1:	6a 00                	push   $0x0
c000aac3:	50                   	push   %eax
c000aac4:	e8 ec c7 ff ff       	call   c00072b5 <alloc_memory>
c000aac9:	83 c4 10             	add    $0x10,%esp
c000aacc:	89 c2                	mov    %eax,%edx
c000aace:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aad1:	89 10                	mov    %edx,(%eax)
c000aad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aad6:	83 ec 0c             	sub    $0xc,%esp
c000aad9:	50                   	push   %eax
c000aada:	e8 1d c1 ff ff       	call   c0006bfc <init_bitmap>
c000aadf:	83 c4 10             	add    $0x10,%esp
c000aae2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000aae5:	c9                   	leave  
c000aae6:	c3                   	ret    

c000aae7 <user_process>:
c000aae7:	55                   	push   %ebp
c000aae8:	89 e5                	mov    %esp,%ebp
c000aaea:	83 ec 38             	sub    $0x38,%esp
c000aaed:	c7 45 f0 b2 0c 00 00 	movl   $0xcb2,-0x10(%ebp)
c000aaf4:	c7 45 ec ba 0c 00 00 	movl   $0xcba,-0x14(%ebp)
c000aafb:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
c000ab02:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c000ab06:	75 0e                	jne    c000ab16 <user_process+0x2f>
c000ab08:	66 c7 45 f6 48 00    	movw   $0x48,-0xa(%ebp)
c000ab0e:	66 c7 45 f4 50 00    	movw   $0x50,-0xc(%ebp)
c000ab14:	eb 0c                	jmp    c000ab22 <user_process+0x3b>
c000ab16:	66 c7 45 f6 59 00    	movw   $0x59,-0xa(%ebp)
c000ab1c:	66 c7 45 f4 61 00    	movw   $0x61,-0xc(%ebp)
c000ab22:	e8 70 6d ff ff       	call   c0001897 <get_running_thread_pcb>
c000ab27:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ab2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab2d:	05 00 10 00 00       	add    $0x1000,%eax
c000ab32:	89 c2                	mov    %eax,%edx
c000ab34:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab37:	89 10                	mov    %edx,(%eax)
c000ab39:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab3c:	8b 00                	mov    (%eax),%eax
c000ab3e:	83 e8 44             	sub    $0x44,%eax
c000ab41:	89 c2                	mov    %eax,%edx
c000ab43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab46:	89 10                	mov    %edx,(%eax)
c000ab48:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ab4b:	8b 00                	mov    (%eax),%eax
c000ab4d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ab50:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
c000ab54:	66 c7 45 dc 02 12    	movw   $0x1202,-0x24(%ebp)
c000ab5a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000ab5e:	66 89 45 da          	mov    %ax,-0x26(%ebp)
c000ab62:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000ab66:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
c000ab6a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c000ab6e:	66 89 45 d6          	mov    %ax,-0x2a(%ebp)
c000ab72:	66 c7 45 d4 38 00    	movw   $0x38,-0x2c(%ebp)
c000ab78:	0f b7 55 f4          	movzwl -0xc(%ebp),%edx
c000ab7c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab7f:	89 50 34             	mov    %edx,0x34(%eax)
c000ab82:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000ab86:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab89:	89 50 0c             	mov    %edx,0xc(%eax)
c000ab8c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000ab90:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab93:	89 50 04             	mov    %edx,0x4(%eax)
c000ab96:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000ab9a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ab9d:	89 50 08             	mov    %edx,0x8(%eax)
c000aba0:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
c000aba4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000aba7:	89 50 40             	mov    %edx,0x40(%eax)
c000abaa:	0f b7 55 d4          	movzwl -0x2c(%ebp),%edx
c000abae:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000abb1:	89 10                	mov    %edx,(%eax)
c000abb3:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000abb6:	8b 55 08             	mov    0x8(%ebp),%edx
c000abb9:	89 50 30             	mov    %edx,0x30(%eax)
c000abbc:	0f b7 55 dc          	movzwl -0x24(%ebp),%edx
c000abc0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000abc3:	89 50 38             	mov    %edx,0x38(%eax)
c000abc6:	83 ec 08             	sub    $0x8,%esp
c000abc9:	6a 01                	push   $0x1
c000abcb:	68 00 f0 ff bf       	push   $0xbffff000
c000abd0:	e8 2a c6 ff ff       	call   c00071ff <alloc_physical_memory>
c000abd5:	83 c4 10             	add    $0x10,%esp
c000abd8:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
c000abde:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000abe1:	89 50 3c             	mov    %edx,0x3c(%eax)
c000abe4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000abe7:	83 ec 0c             	sub    $0xc,%esp
c000abea:	50                   	push   %eax
c000abeb:	e8 7c 6b ff ff       	call   c000176c <restart>
c000abf0:	83 c4 10             	add    $0x10,%esp
c000abf3:	90                   	nop
c000abf4:	c9                   	leave  
c000abf5:	c3                   	ret    

c000abf6 <clone_pcb>:
c000abf6:	55                   	push   %ebp
c000abf7:	89 e5                	mov    %esp,%ebp
c000abf9:	83 ec 18             	sub    $0x18,%esp
c000abfc:	83 ec 08             	sub    $0x8,%esp
c000abff:	6a 00                	push   $0x0
c000ac01:	6a 01                	push   $0x1
c000ac03:	e8 ad c6 ff ff       	call   c00072b5 <alloc_memory>
c000ac08:	83 c4 10             	add    $0x10,%esp
c000ac0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ac0e:	83 ec 04             	sub    $0x4,%esp
c000ac11:	68 00 10 00 00       	push   $0x1000
c000ac16:	6a 00                	push   $0x0
c000ac18:	ff 75 f4             	pushl  -0xc(%ebp)
c000ac1b:	e8 6b 18 00 00       	call   c000c48b <Memset>
c000ac20:	83 c4 10             	add    $0x10,%esp
c000ac23:	83 ec 04             	sub    $0x4,%esp
c000ac26:	68 00 10 00 00       	push   $0x1000
c000ac2b:	ff 75 08             	pushl  0x8(%ebp)
c000ac2e:	ff 75 f4             	pushl  -0xc(%ebp)
c000ac31:	e8 39 d1 ff ff       	call   c0007d6f <Memcpy>
c000ac36:	83 c4 10             	add    $0x10,%esp
c000ac39:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000ac3e:	83 c0 01             	add    $0x1,%eax
c000ac41:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000ac46:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000ac4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac4f:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000ac55:	8b 45 08             	mov    0x8(%ebp),%eax
c000ac58:	8b 80 24 01 00 00    	mov    0x124(%eax),%eax
c000ac5e:	89 c2                	mov    %eax,%edx
c000ac60:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ac63:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000ac69:	83 ec 08             	sub    $0x8,%esp
c000ac6c:	6a 00                	push   $0x0
c000ac6e:	6a 01                	push   $0x1
c000ac70:	e8 40 c6 ff ff       	call   c00072b5 <alloc_memory>
c000ac75:	83 c4 10             	add    $0x10,%esp
c000ac78:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ac7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000ac7e:	05 00 0c 00 00       	add    $0xc00,%eax
c000ac83:	83 ec 04             	sub    $0x4,%esp
c000ac86:	68 00 04 00 00       	push   $0x400
c000ac8b:	68 00 fc ff ff       	push   $0xfffffc00
c000ac90:	50                   	push   %eax
c000ac91:	e8 d9 d0 ff ff       	call   c0007d6f <Memcpy>
c000ac96:	83 c4 10             	add    $0x10,%esp
c000ac99:	83 ec 0c             	sub    $0xc,%esp
c000ac9c:	ff 75 f0             	pushl  -0x10(%ebp)
c000ac9f:	e8 82 c4 ff ff       	call   c0007126 <get_physical_address>
c000aca4:	83 c4 10             	add    $0x10,%esp
c000aca7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000acaa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000acad:	05 fc 0f 00 00       	add    $0xffc,%eax
c000acb2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000acb5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000acb8:	83 c8 07             	or     $0x7,%eax
c000acbb:	89 c2                	mov    %eax,%edx
c000acbd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000acc0:	89 10                	mov    %edx,(%eax)
c000acc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acc5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000acc8:	89 50 08             	mov    %edx,0x8(%eax)
c000accb:	e8 87 fd ff ff       	call   c000aa57 <create_user_process_address_space>
c000acd0:	89 c2                	mov    %eax,%edx
c000acd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acd5:	89 50 0c             	mov    %edx,0xc(%eax)
c000acd8:	8b 45 08             	mov    0x8(%ebp),%eax
c000acdb:	8b 40 0c             	mov    0xc(%eax),%eax
c000acde:	89 c2                	mov    %eax,%edx
c000ace0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ace3:	8b 40 0c             	mov    0xc(%eax),%eax
c000ace6:	83 ec 04             	sub    $0x4,%esp
c000ace9:	6a 0c                	push   $0xc
c000aceb:	52                   	push   %edx
c000acec:	50                   	push   %eax
c000aced:	e8 7d d0 ff ff       	call   c0007d6f <Memcpy>
c000acf2:	83 c4 10             	add    $0x10,%esp
c000acf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000acf8:	c9                   	leave  
c000acf9:	c3                   	ret    

c000acfa <build_body_stack>:
c000acfa:	55                   	push   %ebp
c000acfb:	89 e5                	mov    %esp,%ebp
c000acfd:	83 ec 48             	sub    $0x48,%esp
c000ad00:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad03:	8b 40 0c             	mov    0xc(%eax),%eax
c000ad06:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ad09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ad0c:	8b 50 04             	mov    0x4(%eax),%edx
c000ad0f:	8b 00                	mov    (%eax),%eax
c000ad11:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000ad14:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000ad17:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000ad1a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ad1d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000ad20:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000ad23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000ad26:	8b 40 08             	mov    0x8(%eax),%eax
c000ad29:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000ad2c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000ad33:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000ad3a:	e8 cc cf ff ff       	call   c0007d0b <intr_disable>
c000ad3f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000ad42:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000ad49:	e9 c2 00 00 00       	jmp    c000ae10 <build_body_stack+0x116>
c000ad4e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000ad51:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000ad54:	01 d0                	add    %edx,%eax
c000ad56:	0f b6 00             	movzbl (%eax),%eax
c000ad59:	88 45 d3             	mov    %al,-0x2d(%ebp)
c000ad5c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000ad63:	e9 9a 00 00 00       	jmp    c000ae02 <build_body_stack+0x108>
c000ad68:	0f be 55 d3          	movsbl -0x2d(%ebp),%edx
c000ad6c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000ad6f:	89 c1                	mov    %eax,%ecx
c000ad71:	d3 fa                	sar    %cl,%edx
c000ad73:	89 d0                	mov    %edx,%eax
c000ad75:	83 e0 01             	and    $0x1,%eax
c000ad78:	85 c0                	test   %eax,%eax
c000ad7a:	75 06                	jne    c000ad82 <build_body_stack+0x88>
c000ad7c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000ad80:	eb 7c                	jmp    c000adfe <build_body_stack+0x104>
c000ad82:	8b 45 08             	mov    0x8(%ebp),%eax
c000ad85:	8b 40 08             	mov    0x8(%eax),%eax
c000ad88:	83 ec 0c             	sub    $0xc,%esp
c000ad8b:	50                   	push   %eax
c000ad8c:	e8 ea 6a ff ff       	call   c000187b <update_cr3>
c000ad91:	83 c4 10             	add    $0x10,%esp
c000ad94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ad97:	c1 e0 0c             	shl    $0xc,%eax
c000ad9a:	89 c2                	mov    %eax,%edx
c000ad9c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000ad9f:	01 d0                	add    %edx,%eax
c000ada1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000ada4:	8b 55 cc             	mov    -0x34(%ebp),%edx
c000ada7:	8b 45 10             	mov    0x10(%ebp),%eax
c000adaa:	83 ec 04             	sub    $0x4,%esp
c000adad:	68 00 10 00 00       	push   $0x1000
c000adb2:	52                   	push   %edx
c000adb3:	50                   	push   %eax
c000adb4:	e8 b6 cf ff ff       	call   c0007d6f <Memcpy>
c000adb9:	83 c4 10             	add    $0x10,%esp
c000adbc:	8b 45 0c             	mov    0xc(%ebp),%eax
c000adbf:	8b 40 08             	mov    0x8(%eax),%eax
c000adc2:	83 ec 0c             	sub    $0xc,%esp
c000adc5:	50                   	push   %eax
c000adc6:	e8 b0 6a ff ff       	call   c000187b <update_cr3>
c000adcb:	83 c4 10             	add    $0x10,%esp
c000adce:	83 ec 08             	sub    $0x8,%esp
c000add1:	ff 75 cc             	pushl  -0x34(%ebp)
c000add4:	6a 01                	push   $0x1
c000add6:	e8 3c c5 ff ff       	call   c0007317 <get_a_virtual_page>
c000addb:	83 c4 10             	add    $0x10,%esp
c000adde:	8b 55 10             	mov    0x10(%ebp),%edx
c000ade1:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000ade4:	83 ec 04             	sub    $0x4,%esp
c000ade7:	68 00 10 00 00       	push   $0x1000
c000adec:	52                   	push   %edx
c000aded:	50                   	push   %eax
c000adee:	e8 7c cf ff ff       	call   c0007d6f <Memcpy>
c000adf3:	83 c4 10             	add    $0x10,%esp
c000adf6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000adfa:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000adfe:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000ae02:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000ae06:	0f 8e 5c ff ff ff    	jle    c000ad68 <build_body_stack+0x6e>
c000ae0c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000ae10:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000ae13:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000ae16:	0f 87 32 ff ff ff    	ja     c000ad4e <build_body_stack+0x54>
c000ae1c:	83 ec 0c             	sub    $0xc,%esp
c000ae1f:	ff 75 d4             	pushl  -0x2c(%ebp)
c000ae22:	e8 0d cf ff ff       	call   c0007d34 <intr_set_status>
c000ae27:	83 c4 10             	add    $0x10,%esp
c000ae2a:	90                   	nop
c000ae2b:	c9                   	leave  
c000ae2c:	c3                   	ret    

c000ae2d <build_process_kernel_stack>:
c000ae2d:	55                   	push   %ebp
c000ae2e:	89 e5                	mov    %esp,%ebp
c000ae30:	83 ec 28             	sub    $0x28,%esp
c000ae33:	e8 d3 ce ff ff       	call   c0007d0b <intr_disable>
c000ae38:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000ae3b:	8b 45 08             	mov    0x8(%ebp),%eax
c000ae3e:	05 00 10 00 00       	add    $0x1000,%eax
c000ae43:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000ae46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae49:	8b 00                	mov    (%eax),%eax
c000ae4b:	83 f8 38             	cmp    $0x38,%eax
c000ae4e:	74 06                	je     c000ae56 <build_process_kernel_stack+0x29>
c000ae50:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000ae54:	eb f0                	jmp    c000ae46 <build_process_kernel_stack+0x19>
c000ae56:	90                   	nop
c000ae57:	8b 45 08             	mov    0x8(%ebp),%eax
c000ae5a:	05 00 10 00 00       	add    $0x1000,%eax
c000ae5f:	89 c2                	mov    %eax,%edx
c000ae61:	8b 45 08             	mov    0x8(%ebp),%eax
c000ae64:	89 50 04             	mov    %edx,0x4(%eax)
c000ae67:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae6a:	83 c0 2c             	add    $0x2c,%eax
c000ae6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000ae70:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae73:	83 e8 04             	sub    $0x4,%eax
c000ae76:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000ae79:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae7c:	83 e8 08             	sub    $0x8,%eax
c000ae7f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000ae82:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae85:	83 e8 0c             	sub    $0xc,%eax
c000ae88:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000ae8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae8e:	83 e8 10             	sub    $0x10,%eax
c000ae91:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000ae94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000ae97:	83 e8 14             	sub    $0x14,%eax
c000ae9a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000ae9d:	ba 63 17 00 c0       	mov    $0xc0001763,%edx
c000aea2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000aea5:	89 10                	mov    %edx,(%eax)
c000aea7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000aeaa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000aeb0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000aeb3:	8b 10                	mov    (%eax),%edx
c000aeb5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000aeb8:	89 10                	mov    %edx,(%eax)
c000aeba:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000aebd:	8b 10                	mov    (%eax),%edx
c000aebf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000aec2:	89 10                	mov    %edx,(%eax)
c000aec4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000aec7:	8b 10                	mov    (%eax),%edx
c000aec9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000aecc:	89 10                	mov    %edx,(%eax)
c000aece:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000aed1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000aed7:	8b 45 08             	mov    0x8(%ebp),%eax
c000aeda:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000aedd:	89 10                	mov    %edx,(%eax)
c000aedf:	83 ec 0c             	sub    $0xc,%esp
c000aee2:	ff 75 f0             	pushl  -0x10(%ebp)
c000aee5:	e8 4a ce ff ff       	call   c0007d34 <intr_set_status>
c000aeea:	83 c4 10             	add    $0x10,%esp
c000aeed:	90                   	nop
c000aeee:	c9                   	leave  
c000aeef:	c3                   	ret    

c000aef0 <fork_process>:
c000aef0:	55                   	push   %ebp
c000aef1:	89 e5                	mov    %esp,%ebp
c000aef3:	83 ec 18             	sub    $0x18,%esp
c000aef6:	8b 45 08             	mov    0x8(%ebp),%eax
c000aef9:	83 ec 0c             	sub    $0xc,%esp
c000aefc:	50                   	push   %eax
c000aefd:	e8 84 9c ff ff       	call   c0004b86 <pid2proc>
c000af02:	83 c4 10             	add    $0x10,%esp
c000af05:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000af08:	83 ec 0c             	sub    $0xc,%esp
c000af0b:	ff 75 f4             	pushl  -0xc(%ebp)
c000af0e:	e8 e3 fc ff ff       	call   c000abf6 <clone_pcb>
c000af13:	83 c4 10             	add    $0x10,%esp
c000af16:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000af19:	83 ec 08             	sub    $0x8,%esp
c000af1c:	6a 00                	push   $0x0
c000af1e:	6a 01                	push   $0x1
c000af20:	e8 90 c3 ff ff       	call   c00072b5 <alloc_memory>
c000af25:	83 c4 10             	add    $0x10,%esp
c000af28:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000af2b:	83 ec 04             	sub    $0x4,%esp
c000af2e:	ff 75 ec             	pushl  -0x14(%ebp)
c000af31:	ff 75 f0             	pushl  -0x10(%ebp)
c000af34:	ff 75 f4             	pushl  -0xc(%ebp)
c000af37:	e8 be fd ff ff       	call   c000acfa <build_body_stack>
c000af3c:	83 c4 10             	add    $0x10,%esp
c000af3f:	83 ec 0c             	sub    $0xc,%esp
c000af42:	ff 75 f0             	pushl  -0x10(%ebp)
c000af45:	e8 e3 fe ff ff       	call   c000ae2d <build_process_kernel_stack>
c000af4a:	83 c4 10             	add    $0x10,%esp
c000af4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af50:	05 00 01 00 00       	add    $0x100,%eax
c000af55:	83 ec 04             	sub    $0x4,%esp
c000af58:	6a 08                	push   $0x8
c000af5a:	6a 00                	push   $0x0
c000af5c:	50                   	push   %eax
c000af5d:	e8 29 15 00 00       	call   c000c48b <Memset>
c000af62:	83 c4 10             	add    $0x10,%esp
c000af65:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af68:	05 08 01 00 00       	add    $0x108,%eax
c000af6d:	83 ec 04             	sub    $0x4,%esp
c000af70:	6a 08                	push   $0x8
c000af72:	6a 00                	push   $0x0
c000af74:	50                   	push   %eax
c000af75:	e8 11 15 00 00       	call   c000c48b <Memset>
c000af7a:	83 c4 10             	add    $0x10,%esp
c000af7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af80:	05 08 01 00 00       	add    $0x108,%eax
c000af85:	83 ec 08             	sub    $0x8,%esp
c000af88:	50                   	push   %eax
c000af89:	68 04 1f 01 c0       	push   $0xc0011f04
c000af8e:	e8 bd 02 00 00       	call   c000b250 <appendToDoubleLinkList>
c000af93:	83 c4 10             	add    $0x10,%esp
c000af96:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000af99:	c9                   	leave  
c000af9a:	c3                   	ret    

c000af9b <process_execute>:
c000af9b:	55                   	push   %ebp
c000af9c:	89 e5                	mov    %esp,%ebp
c000af9e:	83 ec 28             	sub    $0x28,%esp
c000afa1:	e8 c0 04 00 00       	call   c000b466 <thread_init>
c000afa6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000afa9:	83 ec 0c             	sub    $0xc,%esp
c000afac:	ff 75 f4             	pushl  -0xc(%ebp)
c000afaf:	e8 5f 05 00 00       	call   c000b513 <thread_create>
c000afb4:	83 c4 10             	add    $0x10,%esp
c000afb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000afba:	05 34 01 00 00       	add    $0x134,%eax
c000afbf:	83 ec 08             	sub    $0x8,%esp
c000afc2:	ff 75 10             	pushl  0x10(%ebp)
c000afc5:	50                   	push   %eax
c000afc6:	e8 df 14 00 00       	call   c000c4aa <Strcpy>
c000afcb:	83 c4 10             	add    $0x10,%esp
c000afce:	83 ec 08             	sub    $0x8,%esp
c000afd1:	6a 00                	push   $0x0
c000afd3:	6a 01                	push   $0x1
c000afd5:	e8 db c2 ff ff       	call   c00072b5 <alloc_memory>
c000afda:	83 c4 10             	add    $0x10,%esp
c000afdd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000afe0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000afe3:	05 00 0c 00 00       	add    $0xc00,%eax
c000afe8:	83 ec 04             	sub    $0x4,%esp
c000afeb:	68 00 04 00 00       	push   $0x400
c000aff0:	68 00 fc ff ff       	push   $0xfffffc00
c000aff5:	50                   	push   %eax
c000aff6:	e8 74 cd ff ff       	call   c0007d6f <Memcpy>
c000affb:	83 c4 10             	add    $0x10,%esp
c000affe:	83 ec 0c             	sub    $0xc,%esp
c000b001:	ff 75 f0             	pushl  -0x10(%ebp)
c000b004:	e8 1d c1 ff ff       	call   c0007126 <get_physical_address>
c000b009:	83 c4 10             	add    $0x10,%esp
c000b00c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000b00f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b012:	05 fc 0f 00 00       	add    $0xffc,%eax
c000b017:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000b01a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000b01d:	83 c8 07             	or     $0x7,%eax
c000b020:	89 c2                	mov    %eax,%edx
c000b022:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000b025:	89 10                	mov    %edx,(%eax)
c000b027:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b02a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000b02d:	89 50 08             	mov    %edx,0x8(%eax)
c000b030:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b033:	83 c0 10             	add    $0x10,%eax
c000b036:	83 ec 0c             	sub    $0xc,%esp
c000b039:	50                   	push   %eax
c000b03a:	e8 12 c8 ff ff       	call   c0007851 <init_memory_block_desc>
c000b03f:	83 c4 10             	add    $0x10,%esp
c000b042:	e8 10 fa ff ff       	call   c000aa57 <create_user_process_address_space>
c000b047:	89 c2                	mov    %eax,%edx
c000b049:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b04c:	89 50 0c             	mov    %edx,0xc(%eax)
c000b04f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b052:	8b 00                	mov    (%eax),%eax
c000b054:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000b057:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b05a:	c7 40 10 e7 aa 00 c0 	movl   $0xc000aae7,0x10(%eax)
c000b061:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b064:	8b 55 08             	mov    0x8(%ebp),%edx
c000b067:	89 50 18             	mov    %edx,0x18(%eax)
c000b06a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b06d:	8b 55 0c             	mov    0xc(%ebp),%edx
c000b070:	89 50 1c             	mov    %edx,0x1c(%eax)
c000b073:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b076:	8b 55 14             	mov    0x14(%ebp),%edx
c000b079:	89 50 20             	mov    %edx,0x20(%eax)
c000b07c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000b07f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b082:	89 50 24             	mov    %edx,0x24(%eax)
c000b085:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b088:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000b08e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b091:	8b 10                	mov    (%eax),%edx
c000b093:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b096:	89 50 04             	mov    %edx,0x4(%eax)
c000b099:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b09c:	8b 50 04             	mov    0x4(%eax),%edx
c000b09f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b0a2:	89 50 08             	mov    %edx,0x8(%eax)
c000b0a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b0a8:	8b 50 08             	mov    0x8(%eax),%edx
c000b0ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b0ae:	89 50 0c             	mov    %edx,0xc(%eax)
c000b0b1:	83 ec 0c             	sub    $0xc,%esp
c000b0b4:	68 ec 0d 01 c0       	push   $0xc0010dec
c000b0b9:	e8 95 00 00 00       	call   c000b153 <isListEmpty>
c000b0be:	83 c4 10             	add    $0x10,%esp
c000b0c1:	e8 45 cc ff ff       	call   c0007d0b <intr_disable>
c000b0c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000b0c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b0cc:	05 00 01 00 00       	add    $0x100,%eax
c000b0d1:	83 ec 08             	sub    $0x8,%esp
c000b0d4:	50                   	push   %eax
c000b0d5:	68 ec 0d 01 c0       	push   $0xc0010dec
c000b0da:	e8 71 01 00 00       	call   c000b250 <appendToDoubleLinkList>
c000b0df:	83 c4 10             	add    $0x10,%esp
c000b0e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b0e5:	05 08 01 00 00       	add    $0x108,%eax
c000b0ea:	83 ec 08             	sub    $0x8,%esp
c000b0ed:	50                   	push   %eax
c000b0ee:	68 04 1f 01 c0       	push   $0xc0011f04
c000b0f3:	e8 58 01 00 00       	call   c000b250 <appendToDoubleLinkList>
c000b0f8:	83 c4 10             	add    $0x10,%esp
c000b0fb:	83 ec 0c             	sub    $0xc,%esp
c000b0fe:	ff 75 e0             	pushl  -0x20(%ebp)
c000b101:	e8 2e cc ff ff       	call   c0007d34 <intr_set_status>
c000b106:	83 c4 10             	add    $0x10,%esp
c000b109:	90                   	nop
c000b10a:	c9                   	leave  
c000b10b:	c3                   	ret    
c000b10c:	66 90                	xchg   %ax,%ax
c000b10e:	66 90                	xchg   %ax,%ax

c000b110 <switch_to>:
c000b110:	56                   	push   %esi
c000b111:	57                   	push   %edi
c000b112:	53                   	push   %ebx
c000b113:	55                   	push   %ebp
c000b114:	89 e5                	mov    %esp,%ebp
c000b116:	8b 45 14             	mov    0x14(%ebp),%eax
c000b119:	89 20                	mov    %esp,(%eax)
c000b11b:	8b 45 18             	mov    0x18(%ebp),%eax
c000b11e:	8b 20                	mov    (%eax),%esp
c000b120:	5d                   	pop    %ebp
c000b121:	5b                   	pop    %ebx
c000b122:	5f                   	pop    %edi
c000b123:	5e                   	pop    %esi
c000b124:	c3                   	ret    

c000b125 <initDoubleLinkList>:
c000b125:	55                   	push   %ebp
c000b126:	89 e5                	mov    %esp,%ebp
c000b128:	8b 45 08             	mov    0x8(%ebp),%eax
c000b12b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000b131:	8b 45 08             	mov    0x8(%ebp),%eax
c000b134:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000b13b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b13e:	8d 50 08             	lea    0x8(%eax),%edx
c000b141:	8b 45 08             	mov    0x8(%ebp),%eax
c000b144:	89 50 04             	mov    %edx,0x4(%eax)
c000b147:	8b 55 08             	mov    0x8(%ebp),%edx
c000b14a:	8b 45 08             	mov    0x8(%ebp),%eax
c000b14d:	89 50 08             	mov    %edx,0x8(%eax)
c000b150:	90                   	nop
c000b151:	5d                   	pop    %ebp
c000b152:	c3                   	ret    

c000b153 <isListEmpty>:
c000b153:	55                   	push   %ebp
c000b154:	89 e5                	mov    %esp,%ebp
c000b156:	8b 45 08             	mov    0x8(%ebp),%eax
c000b159:	8b 40 04             	mov    0x4(%eax),%eax
c000b15c:	8b 55 08             	mov    0x8(%ebp),%edx
c000b15f:	83 c2 08             	add    $0x8,%edx
c000b162:	39 d0                	cmp    %edx,%eax
c000b164:	75 07                	jne    c000b16d <isListEmpty+0x1a>
c000b166:	b8 01 00 00 00       	mov    $0x1,%eax
c000b16b:	eb 05                	jmp    c000b172 <isListEmpty+0x1f>
c000b16d:	b8 00 00 00 00       	mov    $0x0,%eax
c000b172:	5d                   	pop    %ebp
c000b173:	c3                   	ret    

c000b174 <findElementInList>:
c000b174:	55                   	push   %ebp
c000b175:	89 e5                	mov    %esp,%ebp
c000b177:	83 ec 28             	sub    $0x28,%esp
c000b17a:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000b17e:	75 19                	jne    c000b199 <findElementInList+0x25>
c000b180:	6a 60                	push   $0x60
c000b182:	68 31 c4 00 c0       	push   $0xc000c431
c000b187:	68 31 c4 00 c0       	push   $0xc000c431
c000b18c:	68 44 c4 00 c0       	push   $0xc000c444
c000b191:	e8 be eb ff ff       	call   c0009d54 <assertion_failure>
c000b196:	83 c4 10             	add    $0x10,%esp
c000b199:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000b19d:	75 19                	jne    c000b1b8 <findElementInList+0x44>
c000b19f:	6a 61                	push   $0x61
c000b1a1:	68 31 c4 00 c0       	push   $0xc000c431
c000b1a6:	68 31 c4 00 c0       	push   $0xc000c431
c000b1ab:	68 50 c4 00 c0       	push   $0xc000c450
c000b1b0:	e8 9f eb ff ff       	call   c0009d54 <assertion_failure>
c000b1b5:	83 c4 10             	add    $0x10,%esp
c000b1b8:	e8 4e cb ff ff       	call   c0007d0b <intr_disable>
c000b1bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000b1c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000b1c7:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1ca:	8b 40 08             	mov    0x8(%eax),%eax
c000b1cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000b1d0:	8b 45 08             	mov    0x8(%ebp),%eax
c000b1d3:	8b 40 04             	mov    0x4(%eax),%eax
c000b1d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b1d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b1dd:	75 07                	jne    c000b1e6 <findElementInList+0x72>
c000b1df:	b8 00 00 00 00       	mov    $0x0,%eax
c000b1e4:	eb 68                	jmp    c000b24e <findElementInList+0xda>
c000b1e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b1e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000b1ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000b1ef:	2b 45 f0             	sub    -0x10(%ebp),%eax
c000b1f2:	c1 f8 03             	sar    $0x3,%eax
c000b1f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000b1f8:	eb 36                	jmp    c000b230 <findElementInList+0xbc>
c000b1fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000b1fd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
c000b200:	75 07                	jne    c000b209 <findElementInList+0x95>
c000b202:	b8 01 00 00 00       	mov    $0x1,%eax
c000b207:	eb 45                	jmp    c000b24e <findElementInList+0xda>
c000b209:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b20d:	75 07                	jne    c000b216 <findElementInList+0xa2>
c000b20f:	b8 00 00 00 00       	mov    $0x0,%eax
c000b214:	eb 38                	jmp    c000b24e <findElementInList+0xda>
c000b216:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b219:	8b 40 04             	mov    0x4(%eax),%eax
c000b21c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b21f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000b223:	75 07                	jne    c000b22c <findElementInList+0xb8>
c000b225:	b8 00 00 00 00       	mov    $0x0,%eax
c000b22a:	eb 22                	jmp    c000b24e <findElementInList+0xda>
c000b22c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000b230:	8b 45 08             	mov    0x8(%ebp),%eax
c000b233:	83 c0 08             	add    $0x8,%eax
c000b236:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000b239:	75 bf                	jne    c000b1fa <findElementInList+0x86>
c000b23b:	83 ec 0c             	sub    $0xc,%esp
c000b23e:	ff 75 ec             	pushl  -0x14(%ebp)
c000b241:	e8 ee ca ff ff       	call   c0007d34 <intr_set_status>
c000b246:	83 c4 10             	add    $0x10,%esp
c000b249:	b8 00 00 00 00       	mov    $0x0,%eax
c000b24e:	c9                   	leave  
c000b24f:	c3                   	ret    

c000b250 <appendToDoubleLinkList>:
c000b250:	55                   	push   %ebp
c000b251:	89 e5                	mov    %esp,%ebp
c000b253:	83 ec 18             	sub    $0x18,%esp
c000b256:	83 ec 08             	sub    $0x8,%esp
c000b259:	ff 75 0c             	pushl  0xc(%ebp)
c000b25c:	ff 75 08             	pushl  0x8(%ebp)
c000b25f:	e8 10 ff ff ff       	call   c000b174 <findElementInList>
c000b264:	83 c4 10             	add    $0x10,%esp
c000b267:	3c 01                	cmp    $0x1,%al
c000b269:	0f 84 c2 00 00 00    	je     c000b331 <appendToDoubleLinkList+0xe1>
c000b26f:	e8 97 ca ff ff       	call   c0007d0b <intr_disable>
c000b274:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b277:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c000b27b:	75 1c                	jne    c000b299 <appendToDoubleLinkList+0x49>
c000b27d:	68 9e 00 00 00       	push   $0x9e
c000b282:	68 31 c4 00 c0       	push   $0xc000c431
c000b287:	68 31 c4 00 c0       	push   $0xc000c431
c000b28c:	68 44 c4 00 c0       	push   $0xc000c444
c000b291:	e8 be ea ff ff       	call   c0009d54 <assertion_failure>
c000b296:	83 c4 10             	add    $0x10,%esp
c000b299:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000b29d:	75 1c                	jne    c000b2bb <appendToDoubleLinkList+0x6b>
c000b29f:	68 9f 00 00 00       	push   $0x9f
c000b2a4:	68 31 c4 00 c0       	push   $0xc000c431
c000b2a9:	68 31 c4 00 c0       	push   $0xc000c431
c000b2ae:	68 50 c4 00 c0       	push   $0xc000c450
c000b2b3:	e8 9c ea ff ff       	call   c0009d54 <assertion_failure>
c000b2b8:	83 c4 10             	add    $0x10,%esp
c000b2bb:	83 ec 08             	sub    $0x8,%esp
c000b2be:	ff 75 0c             	pushl  0xc(%ebp)
c000b2c1:	ff 75 08             	pushl  0x8(%ebp)
c000b2c4:	e8 ab fe ff ff       	call   c000b174 <findElementInList>
c000b2c9:	83 c4 10             	add    $0x10,%esp
c000b2cc:	3c 01                	cmp    $0x1,%al
c000b2ce:	74 64                	je     c000b334 <appendToDoubleLinkList+0xe4>
c000b2d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b2d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b2d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b2d9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b2e3:	8b 50 04             	mov    0x4(%eax),%edx
c000b2e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b2e9:	89 10                	mov    %edx,(%eax)
c000b2eb:	8b 45 08             	mov    0x8(%ebp),%eax
c000b2ee:	8b 50 08             	mov    0x8(%eax),%edx
c000b2f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b2f4:	89 10                	mov    %edx,(%eax)
c000b2f6:	8b 45 08             	mov    0x8(%ebp),%eax
c000b2f9:	8b 40 08             	mov    0x8(%eax),%eax
c000b2fc:	85 c0                	test   %eax,%eax
c000b2fe:	74 0c                	je     c000b30c <appendToDoubleLinkList+0xbc>
c000b300:	8b 45 08             	mov    0x8(%ebp),%eax
c000b303:	8b 40 08             	mov    0x8(%eax),%eax
c000b306:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b309:	89 50 04             	mov    %edx,0x4(%eax)
c000b30c:	8b 45 08             	mov    0x8(%ebp),%eax
c000b30f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b312:	89 50 08             	mov    %edx,0x8(%eax)
c000b315:	8b 45 08             	mov    0x8(%ebp),%eax
c000b318:	8d 50 08             	lea    0x8(%eax),%edx
c000b31b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b31e:	89 50 04             	mov    %edx,0x4(%eax)
c000b321:	83 ec 0c             	sub    $0xc,%esp
c000b324:	ff 75 f4             	pushl  -0xc(%ebp)
c000b327:	e8 08 ca ff ff       	call   c0007d34 <intr_set_status>
c000b32c:	83 c4 10             	add    $0x10,%esp
c000b32f:	eb 04                	jmp    c000b335 <appendToDoubleLinkList+0xe5>
c000b331:	90                   	nop
c000b332:	eb 01                	jmp    c000b335 <appendToDoubleLinkList+0xe5>
c000b334:	90                   	nop
c000b335:	c9                   	leave  
c000b336:	c3                   	ret    

c000b337 <insertToDoubleLinkList>:
c000b337:	55                   	push   %ebp
c000b338:	89 e5                	mov    %esp,%ebp
c000b33a:	83 ec 18             	sub    $0x18,%esp
c000b33d:	83 ec 08             	sub    $0x8,%esp
c000b340:	ff 75 0c             	pushl  0xc(%ebp)
c000b343:	ff 75 08             	pushl  0x8(%ebp)
c000b346:	e8 29 fe ff ff       	call   c000b174 <findElementInList>
c000b34b:	83 c4 10             	add    $0x10,%esp
c000b34e:	3c 01                	cmp    $0x1,%al
c000b350:	74 65                	je     c000b3b7 <insertToDoubleLinkList+0x80>
c000b352:	e8 b4 c9 ff ff       	call   c0007d0b <intr_disable>
c000b357:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b35a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000b35d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b360:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b363:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b36a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b36d:	8b 50 04             	mov    0x4(%eax),%edx
c000b370:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b373:	89 10                	mov    %edx,(%eax)
c000b375:	8b 45 08             	mov    0x8(%ebp),%eax
c000b378:	8b 50 04             	mov    0x4(%eax),%edx
c000b37b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b37e:	89 50 04             	mov    %edx,0x4(%eax)
c000b381:	8b 45 08             	mov    0x8(%ebp),%eax
c000b384:	8b 40 04             	mov    0x4(%eax),%eax
c000b387:	85 c0                	test   %eax,%eax
c000b389:	74 0b                	je     c000b396 <insertToDoubleLinkList+0x5f>
c000b38b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b38e:	8b 40 04             	mov    0x4(%eax),%eax
c000b391:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b394:	89 10                	mov    %edx,(%eax)
c000b396:	8b 45 08             	mov    0x8(%ebp),%eax
c000b399:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000b39c:	89 50 04             	mov    %edx,0x4(%eax)
c000b39f:	8b 55 08             	mov    0x8(%ebp),%edx
c000b3a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b3a5:	89 10                	mov    %edx,(%eax)
c000b3a7:	83 ec 0c             	sub    $0xc,%esp
c000b3aa:	ff 75 f4             	pushl  -0xc(%ebp)
c000b3ad:	e8 82 c9 ff ff       	call   c0007d34 <intr_set_status>
c000b3b2:	83 c4 10             	add    $0x10,%esp
c000b3b5:	eb 01                	jmp    c000b3b8 <insertToDoubleLinkList+0x81>
c000b3b7:	90                   	nop
c000b3b8:	c9                   	leave  
c000b3b9:	c3                   	ret    

c000b3ba <popFromDoubleLinkList>:
c000b3ba:	55                   	push   %ebp
c000b3bb:	89 e5                	mov    %esp,%ebp
c000b3bd:	83 ec 18             	sub    $0x18,%esp
c000b3c0:	e8 46 c9 ff ff       	call   c0007d0b <intr_disable>
c000b3c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b3c8:	83 ec 0c             	sub    $0xc,%esp
c000b3cb:	ff 75 08             	pushl  0x8(%ebp)
c000b3ce:	e8 80 fd ff ff       	call   c000b153 <isListEmpty>
c000b3d3:	83 c4 10             	add    $0x10,%esp
c000b3d6:	3c 01                	cmp    $0x1,%al
c000b3d8:	75 07                	jne    c000b3e1 <popFromDoubleLinkList+0x27>
c000b3da:	b8 00 00 00 00       	mov    $0x0,%eax
c000b3df:	eb 6b                	jmp    c000b44c <popFromDoubleLinkList+0x92>
c000b3e1:	8b 45 08             	mov    0x8(%ebp),%eax
c000b3e4:	8b 40 08             	mov    0x8(%eax),%eax
c000b3e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b3ea:	8b 45 08             	mov    0x8(%ebp),%eax
c000b3ed:	8b 40 08             	mov    0x8(%eax),%eax
c000b3f0:	85 c0                	test   %eax,%eax
c000b3f2:	75 07                	jne    c000b3fb <popFromDoubleLinkList+0x41>
c000b3f4:	b8 00 00 00 00       	mov    $0x0,%eax
c000b3f9:	eb 51                	jmp    c000b44c <popFromDoubleLinkList+0x92>
c000b3fb:	8b 45 08             	mov    0x8(%ebp),%eax
c000b3fe:	8b 40 08             	mov    0x8(%eax),%eax
c000b401:	8b 00                	mov    (%eax),%eax
c000b403:	85 c0                	test   %eax,%eax
c000b405:	74 11                	je     c000b418 <popFromDoubleLinkList+0x5e>
c000b407:	8b 45 08             	mov    0x8(%ebp),%eax
c000b40a:	8b 40 08             	mov    0x8(%eax),%eax
c000b40d:	8b 00                	mov    (%eax),%eax
c000b40f:	8b 55 08             	mov    0x8(%ebp),%edx
c000b412:	83 c2 08             	add    $0x8,%edx
c000b415:	89 50 04             	mov    %edx,0x4(%eax)
c000b418:	8b 45 08             	mov    0x8(%ebp),%eax
c000b41b:	8b 40 08             	mov    0x8(%eax),%eax
c000b41e:	8b 10                	mov    (%eax),%edx
c000b420:	8b 45 08             	mov    0x8(%ebp),%eax
c000b423:	89 50 08             	mov    %edx,0x8(%eax)
c000b426:	83 ec 0c             	sub    $0xc,%esp
c000b429:	ff 75 f4             	pushl  -0xc(%ebp)
c000b42c:	e8 03 c9 ff ff       	call   c0007d34 <intr_set_status>
c000b431:	83 c4 10             	add    $0x10,%esp
c000b434:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b437:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000b43e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b441:	8b 50 04             	mov    0x4(%eax),%edx
c000b444:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b447:	89 10                	mov    %edx,(%eax)
c000b449:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b44c:	c9                   	leave  
c000b44d:	c3                   	ret    

c000b44e <kernel_thread>:
c000b44e:	55                   	push   %ebp
c000b44f:	89 e5                	mov    %esp,%ebp
c000b451:	83 ec 08             	sub    $0x8,%esp
c000b454:	fb                   	sti    
c000b455:	83 ec 0c             	sub    $0xc,%esp
c000b458:	ff 75 0c             	pushl  0xc(%ebp)
c000b45b:	8b 45 08             	mov    0x8(%ebp),%eax
c000b45e:	ff d0                	call   *%eax
c000b460:	83 c4 10             	add    $0x10,%esp
c000b463:	90                   	nop
c000b464:	c9                   	leave  
c000b465:	c3                   	ret    

c000b466 <thread_init>:
c000b466:	55                   	push   %ebp
c000b467:	89 e5                	mov    %esp,%ebp
c000b469:	83 ec 18             	sub    $0x18,%esp
c000b46c:	83 ec 08             	sub    $0x8,%esp
c000b46f:	6a 00                	push   $0x0
c000b471:	6a 01                	push   $0x1
c000b473:	e8 3d be ff ff       	call   c00072b5 <alloc_memory>
c000b478:	83 c4 10             	add    $0x10,%esp
c000b47b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b47e:	83 ec 04             	sub    $0x4,%esp
c000b481:	68 00 10 00 00       	push   $0x1000
c000b486:	6a 00                	push   $0x0
c000b488:	ff 75 f4             	pushl  -0xc(%ebp)
c000b48b:	e8 fb 0f 00 00       	call   c000c48b <Memset>
c000b490:	83 c4 10             	add    $0x10,%esp
c000b493:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b496:	05 00 10 00 00       	add    $0x1000,%eax
c000b49b:	89 c2                	mov    %eax,%edx
c000b49d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4a0:	89 10                	mov    %edx,(%eax)
c000b4a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4a5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000b4ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4af:	c7 80 64 02 00 00 ff 	movl   $0xffffffff,0x264(%eax)
c000b4b6:	ff ff ff 
c000b4b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4bc:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000b4c3:	00 00 00 
c000b4c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4c9:	8b 90 5c 02 00 00    	mov    0x25c(%eax),%edx
c000b4cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4d2:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000b4d8:	a1 90 07 01 c0       	mov    0xc0010790,%eax
c000b4dd:	83 c0 01             	add    $0x1,%eax
c000b4e0:	a3 90 07 01 c0       	mov    %eax,0xc0010790
c000b4e5:	8b 15 90 07 01 c0    	mov    0xc0010790,%edx
c000b4eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4ee:	89 90 24 01 00 00    	mov    %edx,0x124(%eax)
c000b4f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b4f7:	c7 80 28 01 00 00 0a 	movl   $0xa,0x128(%eax)
c000b4fe:	00 00 00 
c000b501:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b504:	c7 80 b0 02 00 00 e0 	movl   $0x99abcde0,0x2b0(%eax)
c000b50b:	cd ab 99 
c000b50e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b511:	c9                   	leave  
c000b512:	c3                   	ret    

c000b513 <thread_create>:
c000b513:	55                   	push   %ebp
c000b514:	89 e5                	mov    %esp,%ebp
c000b516:	83 ec 10             	sub    $0x10,%esp
c000b519:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000b520:	c7 45 f8 2c 00 00 00 	movl   $0x2c,-0x8(%ebp)
c000b527:	8b 45 08             	mov    0x8(%ebp),%eax
c000b52a:	8b 00                	mov    (%eax),%eax
c000b52c:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000b52f:	89 c2                	mov    %eax,%edx
c000b531:	8b 45 08             	mov    0x8(%ebp),%eax
c000b534:	89 10                	mov    %edx,(%eax)
c000b536:	8b 45 08             	mov    0x8(%ebp),%eax
c000b539:	8b 00                	mov    (%eax),%eax
c000b53b:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000b53e:	89 c2                	mov    %eax,%edx
c000b540:	8b 45 08             	mov    0x8(%ebp),%eax
c000b543:	89 10                	mov    %edx,(%eax)
c000b545:	90                   	nop
c000b546:	c9                   	leave  
c000b547:	c3                   	ret    

c000b548 <thread_start>:
c000b548:	55                   	push   %ebp
c000b549:	89 e5                	mov    %esp,%ebp
c000b54b:	83 ec 18             	sub    $0x18,%esp
c000b54e:	e8 13 ff ff ff       	call   c000b466 <thread_init>
c000b553:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000b556:	83 ec 0c             	sub    $0xc,%esp
c000b559:	ff 75 f4             	pushl  -0xc(%ebp)
c000b55c:	e8 b2 ff ff ff       	call   c000b513 <thread_create>
c000b561:	83 c4 10             	add    $0x10,%esp
c000b564:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b567:	05 34 01 00 00       	add    $0x134,%eax
c000b56c:	83 ec 08             	sub    $0x8,%esp
c000b56f:	ff 75 10             	pushl  0x10(%ebp)
c000b572:	50                   	push   %eax
c000b573:	e8 32 0f 00 00       	call   c000c4aa <Strcpy>
c000b578:	83 c4 10             	add    $0x10,%esp
c000b57b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b57e:	8b 00                	mov    (%eax),%eax
c000b580:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000b583:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b586:	c7 40 10 4e b4 00 c0 	movl   $0xc000b44e,0x10(%eax)
c000b58d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b590:	8b 55 08             	mov    0x8(%ebp),%edx
c000b593:	89 50 18             	mov    %edx,0x18(%eax)
c000b596:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b599:	8b 55 0c             	mov    0xc(%ebp),%edx
c000b59c:	89 50 1c             	mov    %edx,0x1c(%eax)
c000b59f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b5a2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000b5a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b5ab:	8b 10                	mov    (%eax),%edx
c000b5ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b5b0:	89 50 04             	mov    %edx,0x4(%eax)
c000b5b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b5b6:	8b 50 04             	mov    0x4(%eax),%edx
c000b5b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b5bc:	89 50 08             	mov    %edx,0x8(%eax)
c000b5bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b5c2:	8b 50 08             	mov    0x8(%eax),%edx
c000b5c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000b5c8:	89 50 0c             	mov    %edx,0xc(%eax)
c000b5cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b5ce:	05 00 01 00 00       	add    $0x100,%eax
c000b5d3:	83 ec 08             	sub    $0x8,%esp
c000b5d6:	50                   	push   %eax
c000b5d7:	68 ec 0d 01 c0       	push   $0xc0010dec
c000b5dc:	e8 6f fc ff ff       	call   c000b250 <appendToDoubleLinkList>
c000b5e1:	83 c4 10             	add    $0x10,%esp
c000b5e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000b5e7:	05 08 01 00 00       	add    $0x108,%eax
c000b5ec:	83 ec 08             	sub    $0x8,%esp
c000b5ef:	50                   	push   %eax
c000b5f0:	68 04 1f 01 c0       	push   $0xc0011f04
c000b5f5:	e8 56 fc ff ff       	call   c000b250 <appendToDoubleLinkList>
c000b5fa:	83 c4 10             	add    $0x10,%esp
c000b5fd:	90                   	nop
c000b5fe:	c9                   	leave  
c000b5ff:	c3                   	ret    
