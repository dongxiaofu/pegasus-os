
kernel.bin:     file format elf32-i386


Disassembly of section .text:

c0001500 <_start>:
c0001500:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0001507:	00 00 00 
c000150a:	b4 0b                	mov    $0xb,%ah
c000150c:	b0 4c                	mov    $0x4c,%al
c000150e:	65 66 a3 d0 0c 00 00 	mov    %ax,%gs:0xcd0
c0001515:	66 c7 05 40 f7 00 c0 	movw   $0x0,0xc000f740
c000151c:	00 00 
c000151e:	0f 01 05 a8 16 01 c0 	sgdtl  0xc00116a8
c0001525:	e8 49 38 00 00       	call   c0004d73 <ReloadGDT>
c000152a:	0f 01 15 a8 16 01 c0 	lgdtl  0xc00116a8
c0001531:	0f 01 1d 28 f7 00 c0 	lidtl  0xc000f728
c0001538:	0f a8                	push   %gs
c000153a:	0f a9                	pop    %gs
c000153c:	ea 43 15 00 c0 08 00 	ljmp   $0x8,$0xc0001543

c0001543 <csinit>:
c0001543:	31 c0                	xor    %eax,%eax
c0001545:	66 b8 40 00          	mov    $0x40,%ax
c0001549:	0f 00 d8             	ltr    %ax
c000154c:	31 c0                	xor    %eax,%eax
c000154e:	e9 41 03 00 00       	jmp    c0001894 <kernel_main>
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
c000156a:	e8 20 6b 00 00       	call   c000808f <test>
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
c0001594:	8b 3d 40 f7 00 c0    	mov    0xc000f740,%edi

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
c00015bd:	89 3d 40 f7 00 c0    	mov    %edi,0xc000f740
c00015c3:	89 ec                	mov    %ebp,%esp
c00015c5:	5d                   	pop    %ebp
c00015c6:	c3                   	ret    

c00015c7 <disp_str_colour>:
c00015c7:	55                   	push   %ebp
c00015c8:	89 e5                	mov    %esp,%ebp
c00015ca:	8b 75 08             	mov    0x8(%ebp),%esi
c00015cd:	8a 65 0c             	mov    0xc(%ebp),%ah
c00015d0:	8b 3d 40 f7 00 c0    	mov    0xc000f740,%edi

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
c00015f9:	89 3d 40 f7 00 c0    	mov    %edi,0xc000f740
c00015ff:	89 ec                	mov    %ebp,%esp
c0001601:	5d                   	pop    %ebp
c0001602:	c3                   	ret    

c0001603 <divide_zero_fault>:
c0001603:	6a ff                	push   $0xffffffff
c0001605:	6a 00                	push   $0x0
c0001607:	eb 58                	jmp    c0001661 <exception>

c0001609 <single_step_fault>:
c0001609:	6a ff                	push   $0xffffffff
c000160b:	6a 01                	push   $0x1
c000160d:	eb 52                	jmp    c0001661 <exception>

c000160f <non_maskable_interrupt>:
c000160f:	6a ff                	push   $0xffffffff
c0001611:	6a 02                	push   $0x2
c0001613:	eb 4c                	jmp    c0001661 <exception>

c0001615 <breakpoint_trap>:
c0001615:	6a ff                	push   $0xffffffff
c0001617:	6a 03                	push   $0x3
c0001619:	eb 46                	jmp    c0001661 <exception>

c000161b <overflow_trap>:
c000161b:	6a ff                	push   $0xffffffff
c000161d:	6a 04                	push   $0x4
c000161f:	eb 40                	jmp    c0001661 <exception>

c0001621 <bound_range_exceeded_fault>:
c0001621:	6a ff                	push   $0xffffffff
c0001623:	6a 05                	push   $0x5
c0001625:	eb 3a                	jmp    c0001661 <exception>

c0001627 <invalid_opcode_fault>:
c0001627:	6a ff                	push   $0xffffffff
c0001629:	6a 06                	push   $0x6
c000162b:	eb 34                	jmp    c0001661 <exception>

c000162d <coprocessor_not_available_fault>:
c000162d:	6a ff                	push   $0xffffffff
c000162f:	6a 07                	push   $0x7
c0001631:	eb 2e                	jmp    c0001661 <exception>

c0001633 <double_fault_exception_abort>:
c0001633:	6a 08                	push   $0x8
c0001635:	eb 2a                	jmp    c0001661 <exception>

c0001637 <coprocessor_segment_overrun>:
c0001637:	6a ff                	push   $0xffffffff
c0001639:	6a 09                	push   $0x9
c000163b:	eb 24                	jmp    c0001661 <exception>

c000163d <invalid_task_state_segment_fault>:
c000163d:	6a 0a                	push   $0xa
c000163f:	eb 20                	jmp    c0001661 <exception>

c0001641 <segment_not_present_fault>:
c0001641:	6a 0b                	push   $0xb
c0001643:	eb 1c                	jmp    c0001661 <exception>

c0001645 <stack_exception_fault>:
c0001645:	6a 0c                	push   $0xc
c0001647:	eb 18                	jmp    c0001661 <exception>

c0001649 <general_protection_exception_fault>:
c0001649:	6a 0d                	push   $0xd
c000164b:	eb 14                	jmp    c0001661 <exception>

c000164d <page_fault>:
c000164d:	6a 0e                	push   $0xe
c000164f:	eb 10                	jmp    c0001661 <exception>

c0001651 <coprocessor_error_fault>:
c0001651:	6a ff                	push   $0xffffffff
c0001653:	6a 10                	push   $0x10
c0001655:	eb 0a                	jmp    c0001661 <exception>

c0001657 <align_check_fault>:
c0001657:	6a 11                	push   $0x11
c0001659:	eb 06                	jmp    c0001661 <exception>

c000165b <simd_float_exception_fault>:
c000165b:	6a ff                	push   $0xffffffff
c000165d:	6a 12                	push   $0x12
c000165f:	eb 00                	jmp    c0001661 <exception>

c0001661 <exception>:
c0001661:	e8 42 65 00 00       	call   c0007ba8 <exception_handler>
c0001666:	83 c4 08             	add    $0x8,%esp
c0001669:	f4                   	hlt    

c000166a <hwint0>:
c000166a:	60                   	pusha  
c000166b:	1e                   	push   %ds
c000166c:	06                   	push   %es
c000166d:	0f a0                	push   %fs
c000166f:	0f a8                	push   %gs
c0001671:	66 8c d2             	mov    %ss,%dx
c0001674:	8e da                	mov    %edx,%ds
c0001676:	8e c2                	mov    %edx,%es
c0001678:	8e e2                	mov    %edx,%fs
c000167a:	b0 20                	mov    $0x20,%al
c000167c:	e6 20                	out    %al,$0x20
c000167e:	ff 05 44 f7 00 c0    	incl   0xc000f744
c0001684:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c000168b:	75 00                	jne    c000168d <hwint0.1>

c000168d <hwint0.1>:
c000168d:	e8 61 33 00 00       	call   c00049f3 <clock_handler>
c0001692:	fa                   	cli    
c0001693:	e9 dc 00 00 00       	jmp    c0001774 <reenter_restore>

c0001698 <hwint1>:
c0001698:	60                   	pusha  
c0001699:	1e                   	push   %ds
c000169a:	06                   	push   %es
c000169b:	0f a0                	push   %fs
c000169d:	0f a8                	push   %gs
c000169f:	66 8c d2             	mov    %ss,%dx
c00016a2:	8e da                	mov    %edx,%ds
c00016a4:	8e c2                	mov    %edx,%es
c00016a6:	8e e2                	mov    %edx,%fs
c00016a8:	b0 fa                	mov    $0xfa,%al
c00016aa:	e6 21                	out    %al,$0x21
c00016ac:	b0 20                	mov    $0x20,%al
c00016ae:	e6 20                	out    %al,$0x20
c00016b0:	ff 05 44 f7 00 c0    	incl   0xc000f744
c00016b6:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c00016bd:	75 00                	jne    c00016bf <hwint1.1>

c00016bf <hwint1.1>:
c00016bf:	fb                   	sti    
c00016c0:	e8 e8 41 00 00       	call   c00058ad <keyboard_handler>
c00016c5:	b0 f8                	mov    $0xf8,%al
c00016c7:	e6 21                	out    %al,$0x21
c00016c9:	fa                   	cli    
c00016ca:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c00016d1:	0f 85 9d 00 00 00    	jne    c0001774 <reenter_restore>
c00016d7:	e9 98 00 00 00       	jmp    c0001774 <reenter_restore>

c00016dc <hwint14>:
c00016dc:	60                   	pusha  
c00016dd:	1e                   	push   %ds
c00016de:	06                   	push   %es
c00016df:	0f a0                	push   %fs
c00016e1:	0f a8                	push   %gs
c00016e3:	66 8c d2             	mov    %ss,%dx
c00016e6:	8e da                	mov    %edx,%ds
c00016e8:	8e c2                	mov    %edx,%es
c00016ea:	8e e2                	mov    %edx,%fs
c00016ec:	b0 ff                	mov    $0xff,%al
c00016ee:	e6 a1                	out    %al,$0xa1
c00016f0:	b0 20                	mov    $0x20,%al
c00016f2:	e6 20                	out    %al,$0x20
c00016f4:	90                   	nop
c00016f5:	e6 a0                	out    %al,$0xa0
c00016f7:	ff 05 44 f7 00 c0    	incl   0xc000f744
c00016fd:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c0001704:	75 00                	jne    c0001706 <hwint14.1>

c0001706 <hwint14.1>:
c0001706:	fb                   	sti    
c0001707:	e8 2b 0f 00 00       	call   c0002637 <hd_handler>
c000170c:	b0 bf                	mov    $0xbf,%al
c000170e:	e6 a1                	out    %al,$0xa1
c0001710:	fa                   	cli    
c0001711:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c0001718:	75 5a                	jne    c0001774 <reenter_restore>
c000171a:	eb 58                	jmp    c0001774 <reenter_restore>

c000171c <sys_call>:
c000171c:	60                   	pusha  
c000171d:	1e                   	push   %ds
c000171e:	06                   	push   %es
c000171f:	0f a0                	push   %fs
c0001721:	0f a8                	push   %gs
c0001723:	89 e6                	mov    %esp,%esi
c0001725:	66 8c d2             	mov    %ss,%dx
c0001728:	8e da                	mov    %edx,%ds
c000172a:	8e c2                	mov    %edx,%es
c000172c:	8e e2                	mov    %edx,%fs
c000172e:	ff 05 44 f7 00 c0    	incl   0xc000f744
c0001734:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c000173b:	75 00                	jne    c000173d <sys_call.1>

c000173d <sys_call.1>:
c000173d:	fb                   	sti    
c000173e:	56                   	push   %esi
c000173f:	ff 35 60 fb 00 c0    	pushl  0xc000fb60
c0001745:	53                   	push   %ebx
c0001746:	51                   	push   %ecx
c0001747:	ff 14 85 ec e0 00 c0 	call   *-0x3fff1f14(,%eax,4)
c000174e:	83 c4 0c             	add    $0xc,%esp
c0001751:	5e                   	pop    %esi
c0001752:	89 46 2c             	mov    %eax,0x2c(%esi)
c0001755:	fa                   	cli    
c0001756:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c000175d:	75 15                	jne    c0001774 <reenter_restore>
c000175f:	eb 13                	jmp    c0001774 <reenter_restore>

c0001761 <restart>:
c0001761:	ff 0d 44 f7 00 c0    	decl   0xc000f744
c0001767:	89 e5                	mov    %esp,%ebp
c0001769:	8b 65 04             	mov    0x4(%ebp),%esp
c000176c:	0f a9                	pop    %gs
c000176e:	0f a1                	pop    %fs
c0001770:	07                   	pop    %es
c0001771:	1f                   	pop    %ds
c0001772:	61                   	popa   
c0001773:	cf                   	iret   

c0001774 <reenter_restore>:
c0001774:	ff 0d 44 f7 00 c0    	decl   0xc000f744
c000177a:	0f a9                	pop    %gs
c000177c:	0f a1                	pop    %fs
c000177e:	07                   	pop    %es
c000177f:	1f                   	pop    %ds
c0001780:	61                   	popa   
c0001781:	cf                   	iret   

c0001782 <in_byte>:
c0001782:	31 d2                	xor    %edx,%edx
c0001784:	8b 54 24 04          	mov    0x4(%esp),%edx
c0001788:	31 c0                	xor    %eax,%eax
c000178a:	ec                   	in     (%dx),%al
c000178b:	90                   	nop
c000178c:	90                   	nop
c000178d:	c3                   	ret    

c000178e <out_byte>:
c000178e:	31 d2                	xor    %edx,%edx
c0001790:	31 c0                	xor    %eax,%eax
c0001792:	8b 54 24 04          	mov    0x4(%esp),%edx
c0001796:	8a 44 24 08          	mov    0x8(%esp),%al
c000179a:	ee                   	out    %al,(%dx)
c000179b:	90                   	nop
c000179c:	90                   	nop
c000179d:	c3                   	ret    

c000179e <in_byte2>:
c000179e:	55                   	push   %ebp
c000179f:	89 e5                	mov    %esp,%ebp
c00017a1:	52                   	push   %edx
c00017a2:	31 d2                	xor    %edx,%edx
c00017a4:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017a8:	31 c0                	xor    %eax,%eax
c00017aa:	ec                   	in     (%dx),%al
c00017ab:	90                   	nop
c00017ac:	90                   	nop
c00017ad:	5b                   	pop    %ebx
c00017ae:	5d                   	pop    %ebp
c00017af:	c3                   	ret    

c00017b0 <disable_int>:
c00017b0:	fa                   	cli    
c00017b1:	c3                   	ret    

c00017b2 <enable_int>:
c00017b2:	fb                   	sti    
c00017b3:	c3                   	ret    

c00017b4 <check_tss_esp0>:
c00017b4:	55                   	push   %ebp
c00017b5:	89 e5                	mov    %esp,%ebp
c00017b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00017ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00017bd:	83 c0 44             	add    $0x44,%eax
c00017c0:	8b 15 24 16 01 c0    	mov    0xc0011624,%edx
c00017c6:	39 d0                	cmp    %edx,%eax
c00017c8:	74 7c                	je     c0001846 <check_tss_esp0.2>

c00017ca <check_tss_esp0.1>:
c00017ca:	50                   	push   %eax
c00017cb:	52                   	push   %edx
c00017cc:	68 10 e0 00 c0       	push   $0xc000e010
c00017d1:	e8 b6 fd ff ff       	call   c000158c <disp_str>
c00017d6:	83 c4 04             	add    $0x4,%esp
c00017d9:	5a                   	pop    %edx
c00017da:	58                   	pop    %eax
c00017db:	52                   	push   %edx
c00017dc:	50                   	push   %eax
c00017dd:	53                   	push   %ebx
c00017de:	e8 5f 62 00 00       	call   c0007a42 <disp_int>
c00017e3:	83 c4 04             	add    $0x4,%esp
c00017e6:	58                   	pop    %eax
c00017e7:	5a                   	pop    %edx
c00017e8:	52                   	push   %edx
c00017e9:	50                   	push   %eax
c00017ea:	e8 53 62 00 00       	call   c0007a42 <disp_int>
c00017ef:	58                   	pop    %eax
c00017f0:	5a                   	pop    %edx
c00017f1:	52                   	push   %edx
c00017f2:	50                   	push   %eax
c00017f3:	ff 35 44 f7 00 c0    	pushl  0xc000f744
c00017f9:	e8 44 62 00 00       	call   c0007a42 <disp_int>
c00017fe:	83 c4 04             	add    $0x4,%esp
c0001801:	58                   	pop    %eax
c0001802:	5a                   	pop    %edx
c0001803:	52                   	push   %edx
c0001804:	50                   	push   %eax
c0001805:	ff 72 ec             	pushl  -0x14(%edx)
c0001808:	e8 35 62 00 00       	call   c0007a42 <disp_int>
c000180d:	83 c4 04             	add    $0x4,%esp
c0001810:	58                   	pop    %eax
c0001811:	5a                   	pop    %edx
c0001812:	52                   	push   %edx
c0001813:	50                   	push   %eax
c0001814:	ff 70 ec             	pushl  -0x14(%eax)
c0001817:	e8 26 62 00 00       	call   c0007a42 <disp_int>
c000181c:	83 c4 04             	add    $0x4,%esp
c000181f:	58                   	pop    %eax
c0001820:	5a                   	pop    %edx
c0001821:	52                   	push   %edx
c0001822:	50                   	push   %eax
c0001823:	ff 35 60 fb 00 c0    	pushl  0xc000fb60
c0001829:	e8 14 62 00 00       	call   c0007a42 <disp_int>
c000182e:	83 c4 04             	add    $0x4,%esp
c0001831:	58                   	pop    %eax
c0001832:	5a                   	pop    %edx
c0001833:	52                   	push   %edx
c0001834:	50                   	push   %eax
c0001835:	68 00 f7 00 c0       	push   $0xc000f700
c000183a:	e8 03 62 00 00       	call   c0007a42 <disp_int>
c000183f:	83 c4 04             	add    $0x4,%esp
c0001842:	58                   	pop    %eax
c0001843:	5a                   	pop    %edx
c0001844:	5d                   	pop    %ebp
c0001845:	c3                   	ret    

c0001846 <check_tss_esp0.2>:
c0001846:	5d                   	pop    %ebp
c0001847:	c3                   	ret    

c0001848 <enable_8259A_casecade_irq>:
c0001848:	9c                   	pushf  
c0001849:	fa                   	cli    
c000184a:	e4 21                	in     $0x21,%al
c000184c:	24 fb                	and    $0xfb,%al
c000184e:	e6 21                	out    %al,$0x21
c0001850:	9d                   	popf   
c0001851:	c3                   	ret    

c0001852 <disable_8259A_casecade_irq>:
c0001852:	9c                   	pushf  
c0001853:	fa                   	cli    
c0001854:	e4 21                	in     $0x21,%al
c0001856:	0c 04                	or     $0x4,%al
c0001858:	e6 21                	out    %al,$0x21
c000185a:	9c                   	pushf  
c000185b:	c3                   	ret    

c000185c <enable_8259A_slave_winchester_irq>:
c000185c:	9c                   	pushf  
c000185d:	fa                   	cli    
c000185e:	e4 a1                	in     $0xa1,%al
c0001860:	24 bf                	and    $0xbf,%al
c0001862:	e6 a1                	out    %al,$0xa1
c0001864:	9d                   	popf   
c0001865:	c3                   	ret    

c0001866 <disable_8259A_slave_winchester_irq>:
c0001866:	9c                   	pushf  
c0001867:	fa                   	cli    
c0001868:	e4 a1                	in     $0xa1,%al
c000186a:	0c 40                	or     $0x40,%al
c000186c:	e6 a1                	out    %al,$0xa1
c000186e:	9d                   	popf   
c000186f:	c3                   	ret    

c0001870 <update_cr3>:
c0001870:	55                   	push   %ebp
c0001871:	89 e5                	mov    %esp,%ebp
c0001873:	8b 45 08             	mov    0x8(%ebp),%eax
c0001876:	0f 22 d8             	mov    %eax,%cr3
c0001879:	89 ec                	mov    %ebp,%esp
c000187b:	5d                   	pop    %ebp
c000187c:	c3                   	ret    

c000187d <update_tss>:
c000187d:	55                   	push   %ebp
c000187e:	89 e5                	mov    %esp,%ebp
c0001880:	8b 45 08             	mov    0x8(%ebp),%eax
c0001883:	a3 24 16 01 c0       	mov    %eax,0xc0011624
c0001888:	89 ec                	mov    %ebp,%esp
c000188a:	5d                   	pop    %ebp
c000188b:	c3                   	ret    

c000188c <get_running_thread_pcb>:
c000188c:	89 e0                	mov    %esp,%eax
c000188e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0001893:	c3                   	ret    

c0001894 <kernel_main>:
c0001894:	55                   	push   %ebp
c0001895:	89 e5                	mov    %esp,%ebp
c0001897:	83 ec 08             	sub    $0x8,%esp
c000189a:	e8 95 00 00 00       	call   c0001934 <init>
c000189f:	83 ec 04             	sub    $0x4,%esp
c00018a2:	68 20 a7 00 c0       	push   $0xc000a720
c00018a7:	68 2a a7 00 c0       	push   $0xc000a72a
c00018ac:	68 86 1a 00 c0       	push   $0xc0001a86
c00018b1:	e8 77 8a 00 00       	call   c000a32d <process_execute>
c00018b6:	83 c4 10             	add    $0x10,%esp
c00018b9:	83 ec 04             	sub    $0x4,%esp
c00018bc:	68 37 a7 00 c0       	push   $0xc000a737
c00018c1:	68 3f a7 00 c0       	push   $0xc000a73f
c00018c6:	68 aa 57 00 c0       	push   $0xc00057aa
c00018cb:	e8 5d 8a 00 00       	call   c000a32d <process_execute>
c00018d0:	83 c4 10             	add    $0x10,%esp
c00018d3:	83 ec 04             	sub    $0x4,%esp
c00018d6:	68 49 a7 00 c0       	push   $0xc000a749
c00018db:	68 50 a7 00 c0       	push   $0xc000a750
c00018e0:	68 bb 1a 00 c0       	push   $0xc0001abb
c00018e5:	e8 43 8a 00 00       	call   c000a32d <process_execute>
c00018ea:	83 c4 10             	add    $0x10,%esp
c00018ed:	83 ec 04             	sub    $0x4,%esp
c00018f0:	68 59 a7 00 c0       	push   $0xc000a759
c00018f5:	68 61 a7 00 c0       	push   $0xc000a761
c00018fa:	68 44 28 00 c0       	push   $0xc0002844
c00018ff:	e8 29 8a 00 00       	call   c000a32d <process_execute>
c0001904:	83 c4 10             	add    $0x10,%esp
c0001907:	83 ec 04             	sub    $0x4,%esp
c000190a:	68 6a a7 00 c0       	push   $0xc000a76a
c000190f:	68 71 a7 00 c0       	push   $0xc000a771
c0001914:	68 a6 61 00 c0       	push   $0xc00061a6
c0001919:	e8 0f 8a 00 00       	call   c000a32d <process_execute>
c000191e:	83 c4 10             	add    $0x10,%esp
c0001921:	83 ec 0c             	sub    $0xc,%esp
c0001924:	68 7a a7 00 c0       	push   $0xc000a77a
c0001929:	e8 5e fc ff ff       	call   c000158c <disp_str>
c000192e:	83 c4 10             	add    $0x10,%esp
c0001931:	fb                   	sti    
c0001932:	eb fe                	jmp    c0001932 <kernel_main+0x9e>

c0001934 <init>:
c0001934:	55                   	push   %ebp
c0001935:	89 e5                	mov    %esp,%ebp
c0001937:	83 ec 08             	sub    $0x8,%esp
c000193a:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0001941:	00 00 00 
c0001944:	c7 05 30 f7 00 c0 00 	movl   $0x0,0xc000f730
c000194b:	00 00 00 
c000194e:	83 ec 0c             	sub    $0xc,%esp
c0001951:	68 84 a7 00 c0       	push   $0xc000a784
c0001956:	e8 31 fc ff ff       	call   c000158c <disp_str>
c000195b:	83 c4 10             	add    $0x10,%esp
c000195e:	e8 e1 67 00 00       	call   c0008144 <init_keyboard>
c0001963:	83 ec 0c             	sub    $0xc,%esp
c0001966:	68 00 00 00 02       	push   $0x2000000
c000196b:	e8 f0 5c 00 00       	call   c0007660 <init_memory>
c0001970:	83 c4 10             	add    $0x10,%esp
c0001973:	83 ec 0c             	sub    $0xc,%esp
c0001976:	68 8c fd 00 c0       	push   $0xc000fd8c
c000197b:	e8 05 8b 00 00       	call   c000a485 <initDoubleLinkList>
c0001980:	83 c4 10             	add    $0x10,%esp
c0001983:	83 ec 0c             	sub    $0xc,%esp
c0001986:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000198b:	e8 f5 8a 00 00       	call   c000a485 <initDoubleLinkList>
c0001990:	83 c4 10             	add    $0x10,%esp
c0001993:	90                   	nop
c0001994:	c9                   	leave  
c0001995:	c3                   	ret    

c0001996 <kernel_thread_a>:
c0001996:	55                   	push   %ebp
c0001997:	89 e5                	mov    %esp,%ebp
c0001999:	83 ec 18             	sub    $0x18,%esp
c000199c:	83 ec 0c             	sub    $0xc,%esp
c000199f:	ff 75 08             	pushl  0x8(%ebp)
c00019a2:	e8 e5 fb ff ff       	call   c000158c <disp_str>
c00019a7:	83 c4 10             	add    $0x10,%esp
c00019aa:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c00019af:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00019b2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00019b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00019bc:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c00019c1:	83 ec 0c             	sub    $0xc,%esp
c00019c4:	68 8a a7 00 c0       	push   $0xc000a78a
c00019c9:	e8 be fb ff ff       	call   c000158c <disp_str>
c00019ce:	83 c4 10             	add    $0x10,%esp
c00019d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00019d4:	8d 50 01             	lea    0x1(%eax),%edx
c00019d7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00019da:	83 ec 0c             	sub    $0xc,%esp
c00019dd:	50                   	push   %eax
c00019de:	e8 5f 60 00 00       	call   c0007a42 <disp_int>
c00019e3:	83 c4 10             	add    $0x10,%esp
c00019e6:	83 ec 0c             	sub    $0xc,%esp
c00019e9:	68 93 a7 00 c0       	push   $0xc000a793
c00019ee:	e8 99 fb ff ff       	call   c000158c <disp_str>
c00019f3:	83 c4 10             	add    $0x10,%esp
c00019f6:	eb c1                	jmp    c00019b9 <kernel_thread_a+0x23>

c00019f8 <kernel_thread_b>:
c00019f8:	55                   	push   %ebp
c00019f9:	89 e5                	mov    %esp,%ebp
c00019fb:	83 ec 18             	sub    $0x18,%esp
c00019fe:	83 ec 0c             	sub    $0xc,%esp
c0001a01:	ff 75 08             	pushl  0x8(%ebp)
c0001a04:	e8 83 fb ff ff       	call   c000158c <disp_str>
c0001a09:	83 c4 10             	add    $0x10,%esp
c0001a0c:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c0001a11:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001a14:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001a1e:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c0001a23:	83 ec 0c             	sub    $0xc,%esp
c0001a26:	68 95 a7 00 c0       	push   $0xc000a795
c0001a2b:	e8 5c fb ff ff       	call   c000158c <disp_str>
c0001a30:	83 c4 10             	add    $0x10,%esp
c0001a33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a36:	8d 50 01             	lea    0x1(%eax),%edx
c0001a39:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0001a3c:	83 ec 0c             	sub    $0xc,%esp
c0001a3f:	50                   	push   %eax
c0001a40:	e8 fd 5f 00 00       	call   c0007a42 <disp_int>
c0001a45:	83 c4 10             	add    $0x10,%esp
c0001a48:	83 ec 0c             	sub    $0xc,%esp
c0001a4b:	68 93 a7 00 c0       	push   $0xc000a793
c0001a50:	e8 37 fb ff ff       	call   c000158c <disp_str>
c0001a55:	83 c4 10             	add    $0x10,%esp
c0001a58:	eb c1                	jmp    c0001a1b <kernel_thread_b+0x23>

c0001a5a <kernel_thread_c>:
c0001a5a:	55                   	push   %ebp
c0001a5b:	89 e5                	mov    %esp,%ebp
c0001a5d:	83 ec 08             	sub    $0x8,%esp
c0001a60:	83 ec 0c             	sub    $0xc,%esp
c0001a63:	ff 75 08             	pushl  0x8(%ebp)
c0001a66:	e8 21 fb ff ff       	call   c000158c <disp_str>
c0001a6b:	83 c4 10             	add    $0x10,%esp
c0001a6e:	eb fe                	jmp    c0001a6e <kernel_thread_c+0x14>

c0001a70 <kernel_thread_d>:
c0001a70:	55                   	push   %ebp
c0001a71:	89 e5                	mov    %esp,%ebp
c0001a73:	83 ec 08             	sub    $0x8,%esp
c0001a76:	83 ec 0c             	sub    $0xc,%esp
c0001a79:	ff 75 08             	pushl  0x8(%ebp)
c0001a7c:	e8 0b fb ff ff       	call   c000158c <disp_str>
c0001a81:	83 c4 10             	add    $0x10,%esp
c0001a84:	eb fe                	jmp    c0001a84 <kernel_thread_d+0x14>

c0001a86 <user_proc_a>:
c0001a86:	55                   	push   %ebp
c0001a87:	89 e5                	mov    %esp,%ebp
c0001a89:	83 ec 08             	sub    $0x8,%esp
c0001a8c:	83 ec 0c             	sub    $0xc,%esp
c0001a8f:	68 9e a7 00 c0       	push   $0xc000a79e
c0001a94:	e8 f3 fa ff ff       	call   c000158c <disp_str>
c0001a99:	83 c4 10             	add    $0x10,%esp
c0001a9c:	e8 91 6b 00 00       	call   c0008632 <INIT_fork>
c0001aa1:	eb fe                	jmp    c0001aa1 <user_proc_a+0x1b>

c0001aa3 <user_proc_b>:
c0001aa3:	55                   	push   %ebp
c0001aa4:	89 e5                	mov    %esp,%ebp
c0001aa6:	83 ec 08             	sub    $0x8,%esp
c0001aa9:	83 ec 0c             	sub    $0xc,%esp
c0001aac:	68 b0 a7 00 c0       	push   $0xc000a7b0
c0001ab1:	e8 d6 fa ff ff       	call   c000158c <disp_str>
c0001ab6:	83 c4 10             	add    $0x10,%esp
c0001ab9:	eb fe                	jmp    c0001ab9 <user_proc_b+0x16>

c0001abb <TaskHD>:
c0001abb:	55                   	push   %ebp
c0001abc:	89 e5                	mov    %esp,%ebp
c0001abe:	83 ec 18             	sub    $0x18,%esp
c0001ac1:	e8 c6 fd ff ff       	call   c000188c <get_running_thread_pcb>
c0001ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001ac9:	e8 20 00 00 00       	call   c0001aee <init_hd>
c0001ace:	83 ec 0c             	sub    $0xc,%esp
c0001ad1:	6a 6c                	push   $0x6c
c0001ad3:	e8 f1 53 00 00       	call   c0006ec9 <sys_malloc>
c0001ad8:	83 c4 10             	add    $0x10,%esp
c0001adb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001ade:	83 ec 0c             	sub    $0xc,%esp
c0001ae1:	ff 75 f0             	pushl  -0x10(%ebp)
c0001ae4:	e8 1f 00 00 00       	call   c0001b08 <hd_handle>
c0001ae9:	83 c4 10             	add    $0x10,%esp
c0001aec:	eb f0                	jmp    c0001ade <TaskHD+0x23>

c0001aee <init_hd>:
c0001aee:	55                   	push   %ebp
c0001aef:	89 e5                	mov    %esp,%ebp
c0001af1:	83 ec 18             	sub    $0x18,%esp
c0001af4:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001afb:	e8 48 fd ff ff       	call   c0001848 <enable_8259A_casecade_irq>
c0001b00:	e8 57 fd ff ff       	call   c000185c <enable_8259A_slave_winchester_irq>
c0001b05:	90                   	nop
c0001b06:	c9                   	leave  
c0001b07:	c3                   	ret    

c0001b08 <hd_handle>:
c0001b08:	55                   	push   %ebp
c0001b09:	89 e5                	mov    %esp,%ebp
c0001b0b:	83 ec 18             	sub    $0x18,%esp
c0001b0e:	83 ec 04             	sub    $0x4,%esp
c0001b11:	6a 0e                	push   $0xe
c0001b13:	ff 75 08             	pushl  0x8(%ebp)
c0001b16:	6a 02                	push   $0x2
c0001b18:	e8 46 7f 00 00       	call   c0009a63 <send_rec>
c0001b1d:	83 c4 10             	add    $0x10,%esp
c0001b20:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b23:	8b 40 68             	mov    0x68(%eax),%eax
c0001b26:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001b29:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001b2d:	0f 84 cc 00 00 00    	je     c0001bff <hd_handle+0xf7>
c0001b33:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b36:	8b 00                	mov    (%eax),%eax
c0001b38:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b3b:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b3f:	74 2b                	je     c0001b6c <hd_handle+0x64>
c0001b41:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b45:	74 25                	je     c0001b6c <hd_handle+0x64>
c0001b47:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b4b:	74 1f                	je     c0001b6c <hd_handle+0x64>
c0001b4d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001b51:	74 19                	je     c0001b6c <hd_handle+0x64>
c0001b53:	6a 69                	push   $0x69
c0001b55:	68 c4 a7 00 c0       	push   $0xc000a7c4
c0001b5a:	68 c4 a7 00 c0       	push   $0xc000a7c4
c0001b5f:	68 cc a7 00 c0       	push   $0xc000a7cc
c0001b64:	e8 af 76 00 00       	call   c0009218 <assertion_failure>
c0001b69:	83 c4 10             	add    $0x10,%esp
c0001b6c:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b70:	74 23                	je     c0001b95 <hd_handle+0x8d>
c0001b72:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b76:	77 08                	ja     c0001b80 <hd_handle+0x78>
c0001b78:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b7c:	74 10                	je     c0001b8e <hd_handle+0x86>
c0001b7e:	eb 34                	jmp    c0001bb4 <hd_handle+0xac>
c0001b80:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b84:	74 0f                	je     c0001b95 <hd_handle+0x8d>
c0001b86:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001b8a:	74 19                	je     c0001ba5 <hd_handle+0x9d>
c0001b8c:	eb 26                	jmp    c0001bb4 <hd_handle+0xac>
c0001b8e:	e8 1b 07 00 00       	call   c00022ae <hd_open>
c0001b93:	eb 30                	jmp    c0001bc5 <hd_handle+0xbd>
c0001b95:	83 ec 0c             	sub    $0xc,%esp
c0001b98:	ff 75 08             	pushl  0x8(%ebp)
c0001b9b:	e8 38 08 00 00       	call   c00023d8 <hd_rdwt>
c0001ba0:	83 c4 10             	add    $0x10,%esp
c0001ba3:	eb 20                	jmp    c0001bc5 <hd_handle+0xbd>
c0001ba5:	83 ec 0c             	sub    $0xc,%esp
c0001ba8:	6a 00                	push   $0x0
c0001baa:	e8 4e 07 00 00       	call   c00022fd <get_hd_ioctl>
c0001baf:	83 c4 10             	add    $0x10,%esp
c0001bb2:	eb 11                	jmp    c0001bc5 <hd_handle+0xbd>
c0001bb4:	83 ec 0c             	sub    $0xc,%esp
c0001bb7:	68 12 a8 00 c0       	push   $0xc000a812
c0001bbc:	e8 13 76 00 00       	call   c00091d4 <spin>
c0001bc1:	83 c4 10             	add    $0x10,%esp
c0001bc4:	90                   	nop
c0001bc5:	83 ec 04             	sub    $0x4,%esp
c0001bc8:	6a 6c                	push   $0x6c
c0001bca:	6a 00                	push   $0x0
c0001bcc:	ff 75 08             	pushl  0x8(%ebp)
c0001bcf:	e8 7e 97 00 00       	call   c000b352 <Memset>
c0001bd4:	83 c4 10             	add    $0x10,%esp
c0001bd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bda:	c7 40 68 64 00 00 00 	movl   $0x64,0x68(%eax)
c0001be1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001be4:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001beb:	83 ec 04             	sub    $0x4,%esp
c0001bee:	6a 04                	push   $0x4
c0001bf0:	ff 75 08             	pushl  0x8(%ebp)
c0001bf3:	6a 01                	push   $0x1
c0001bf5:	e8 69 7e 00 00       	call   c0009a63 <send_rec>
c0001bfa:	83 c4 10             	add    $0x10,%esp
c0001bfd:	eb 01                	jmp    c0001c00 <hd_handle+0xf8>
c0001bff:	90                   	nop
c0001c00:	c9                   	leave  
c0001c01:	c3                   	ret    

c0001c02 <hd_cmd_out>:
c0001c02:	55                   	push   %ebp
c0001c03:	89 e5                	mov    %esp,%ebp
c0001c05:	83 ec 08             	sub    $0x8,%esp
c0001c08:	83 ec 04             	sub    $0x4,%esp
c0001c0b:	68 18 73 01 00       	push   $0x17318
c0001c10:	6a 00                	push   $0x0
c0001c12:	68 80 00 00 00       	push   $0x80
c0001c17:	e8 47 0a 00 00       	call   c0002663 <waitfor>
c0001c1c:	83 c4 10             	add    $0x10,%esp
c0001c1f:	85 c0                	test   %eax,%eax
c0001c21:	75 10                	jne    c0001c33 <hd_cmd_out+0x31>
c0001c23:	83 ec 0c             	sub    $0xc,%esp
c0001c26:	68 24 a8 00 c0       	push   $0xc000a824
c0001c2b:	e8 ca 75 00 00       	call   c00091fa <panic>
c0001c30:	83 c4 10             	add    $0x10,%esp
c0001c33:	83 ec 08             	sub    $0x8,%esp
c0001c36:	6a 00                	push   $0x0
c0001c38:	68 f6 03 00 00       	push   $0x3f6
c0001c3d:	e8 4c fb ff ff       	call   c000178e <out_byte>
c0001c42:	83 c4 10             	add    $0x10,%esp
c0001c45:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c48:	0f b6 00             	movzbl (%eax),%eax
c0001c4b:	0f b6 c0             	movzbl %al,%eax
c0001c4e:	83 ec 08             	sub    $0x8,%esp
c0001c51:	50                   	push   %eax
c0001c52:	68 f1 01 00 00       	push   $0x1f1
c0001c57:	e8 32 fb ff ff       	call   c000178e <out_byte>
c0001c5c:	83 c4 10             	add    $0x10,%esp
c0001c5f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c62:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001c66:	0f b6 c0             	movzbl %al,%eax
c0001c69:	83 ec 08             	sub    $0x8,%esp
c0001c6c:	50                   	push   %eax
c0001c6d:	68 f2 01 00 00       	push   $0x1f2
c0001c72:	e8 17 fb ff ff       	call   c000178e <out_byte>
c0001c77:	83 c4 10             	add    $0x10,%esp
c0001c7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c7d:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001c81:	0f b6 c0             	movzbl %al,%eax
c0001c84:	83 ec 08             	sub    $0x8,%esp
c0001c87:	50                   	push   %eax
c0001c88:	68 f3 01 00 00       	push   $0x1f3
c0001c8d:	e8 fc fa ff ff       	call   c000178e <out_byte>
c0001c92:	83 c4 10             	add    $0x10,%esp
c0001c95:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c98:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001c9c:	0f b6 c0             	movzbl %al,%eax
c0001c9f:	83 ec 08             	sub    $0x8,%esp
c0001ca2:	50                   	push   %eax
c0001ca3:	68 f4 01 00 00       	push   $0x1f4
c0001ca8:	e8 e1 fa ff ff       	call   c000178e <out_byte>
c0001cad:	83 c4 10             	add    $0x10,%esp
c0001cb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cb3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001cb7:	0f b6 c0             	movzbl %al,%eax
c0001cba:	83 ec 08             	sub    $0x8,%esp
c0001cbd:	50                   	push   %eax
c0001cbe:	68 f5 01 00 00       	push   $0x1f5
c0001cc3:	e8 c6 fa ff ff       	call   c000178e <out_byte>
c0001cc8:	83 c4 10             	add    $0x10,%esp
c0001ccb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cce:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001cd2:	0f b6 c0             	movzbl %al,%eax
c0001cd5:	83 ec 08             	sub    $0x8,%esp
c0001cd8:	50                   	push   %eax
c0001cd9:	68 f6 01 00 00       	push   $0x1f6
c0001cde:	e8 ab fa ff ff       	call   c000178e <out_byte>
c0001ce3:	83 c4 10             	add    $0x10,%esp
c0001ce6:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ce9:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001ced:	0f b6 c0             	movzbl %al,%eax
c0001cf0:	83 ec 08             	sub    $0x8,%esp
c0001cf3:	50                   	push   %eax
c0001cf4:	68 f7 01 00 00       	push   $0x1f7
c0001cf9:	e8 90 fa ff ff       	call   c000178e <out_byte>
c0001cfe:	83 c4 10             	add    $0x10,%esp
c0001d01:	90                   	nop
c0001d02:	c9                   	leave  
c0001d03:	c3                   	ret    

c0001d04 <hd_identify>:
c0001d04:	55                   	push   %ebp
c0001d05:	89 e5                	mov    %esp,%ebp
c0001d07:	53                   	push   %ebx
c0001d08:	83 ec 24             	sub    $0x24,%esp
c0001d0b:	89 e0                	mov    %esp,%eax
c0001d0d:	89 c3                	mov    %eax,%ebx
c0001d0f:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001d13:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001d17:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001d1b:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001d1f:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001d23:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d26:	c1 e0 04             	shl    $0x4,%eax
c0001d29:	83 c8 e0             	or     $0xffffffe0,%eax
c0001d2c:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001d2f:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001d33:	83 ec 0c             	sub    $0xc,%esp
c0001d36:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001d39:	50                   	push   %eax
c0001d3a:	e8 c3 fe ff ff       	call   c0001c02 <hd_cmd_out>
c0001d3f:	83 c4 10             	add    $0x10,%esp
c0001d42:	e8 40 06 00 00       	call   c0002387 <interrupt_wait>
c0001d47:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001d4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d51:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001d54:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001d57:	89 c2                	mov    %eax,%edx
c0001d59:	b8 10 00 00 00       	mov    $0x10,%eax
c0001d5e:	83 e8 01             	sub    $0x1,%eax
c0001d61:	01 d0                	add    %edx,%eax
c0001d63:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001d68:	ba 00 00 00 00       	mov    $0x0,%edx
c0001d6d:	f7 f1                	div    %ecx
c0001d6f:	6b c0 10             	imul   $0x10,%eax,%eax
c0001d72:	29 c4                	sub    %eax,%esp
c0001d74:	89 e0                	mov    %esp,%eax
c0001d76:	83 c0 00             	add    $0x0,%eax
c0001d79:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001d7c:	83 ec 04             	sub    $0x4,%esp
c0001d7f:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d82:	6a 00                	push   $0x0
c0001d84:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d87:	e8 c6 95 00 00       	call   c000b352 <Memset>
c0001d8c:	83 c4 10             	add    $0x10,%esp
c0001d8f:	83 ec 04             	sub    $0x4,%esp
c0001d92:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d95:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d98:	68 f0 01 00 00       	push   $0x1f0
c0001d9d:	e8 04 96 00 00       	call   c000b3a6 <read_port>
c0001da2:	83 c4 10             	add    $0x10,%esp
c0001da5:	83 ec 0c             	sub    $0xc,%esp
c0001da8:	ff 75 ec             	pushl  -0x14(%ebp)
c0001dab:	e8 0b 00 00 00       	call   c0001dbb <print_hdinfo>
c0001db0:	83 c4 10             	add    $0x10,%esp
c0001db3:	89 dc                	mov    %ebx,%esp
c0001db5:	90                   	nop
c0001db6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001db9:	c9                   	leave  
c0001dba:	c3                   	ret    

c0001dbb <print_hdinfo>:
c0001dbb:	55                   	push   %ebp
c0001dbc:	89 e5                	mov    %esp,%ebp
c0001dbe:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001dc4:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001dca:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001dd0:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001dd7:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001dde:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001de5:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001dec:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001df3:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001df9:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001dff:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001e06:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001e0d:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001e14:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001e1b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001e22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001e29:	e9 8f 00 00 00       	jmp    c0001ebd <print_hdinfo+0x102>
c0001e2e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001e35:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e38:	89 d0                	mov    %edx,%eax
c0001e3a:	01 c0                	add    %eax,%eax
c0001e3c:	01 d0                	add    %edx,%eax
c0001e3e:	c1 e0 03             	shl    $0x3,%eax
c0001e41:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001e44:	01 c8                	add    %ecx,%eax
c0001e46:	83 e8 44             	sub    $0x44,%eax
c0001e49:	0f b7 00             	movzwl (%eax),%eax
c0001e4c:	0f b7 c0             	movzwl %ax,%eax
c0001e4f:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001e52:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e55:	01 d0                	add    %edx,%eax
c0001e57:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001e5a:	eb 30                	jmp    c0001e8c <print_hdinfo+0xd1>
c0001e5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e5f:	8d 50 01             	lea    0x1(%eax),%edx
c0001e62:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e65:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e68:	83 c2 01             	add    $0x1,%edx
c0001e6b:	0f b6 00             	movzbl (%eax),%eax
c0001e6e:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001e72:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e75:	8d 50 01             	lea    0x1(%eax),%edx
c0001e78:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e7b:	0f b6 00             	movzbl (%eax),%eax
c0001e7e:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001e81:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e84:	01 ca                	add    %ecx,%edx
c0001e86:	88 02                	mov    %al,(%edx)
c0001e88:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001e8c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e8f:	89 d0                	mov    %edx,%eax
c0001e91:	01 c0                	add    %eax,%eax
c0001e93:	01 d0                	add    %edx,%eax
c0001e95:	c1 e0 03             	shl    $0x3,%eax
c0001e98:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001e9b:	01 c8                	add    %ecx,%eax
c0001e9d:	83 e8 42             	sub    $0x42,%eax
c0001ea0:	0f b7 00             	movzwl (%eax),%eax
c0001ea3:	66 d1 e8             	shr    %ax
c0001ea6:	0f b7 c0             	movzwl %ax,%eax
c0001ea9:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001eac:	7c ae                	jl     c0001e5c <print_hdinfo+0xa1>
c0001eae:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001eb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001eb4:	01 d0                	add    %edx,%eax
c0001eb6:	c6 00 00             	movb   $0x0,(%eax)
c0001eb9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001ebd:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001ec1:	0f 8e 67 ff ff ff    	jle    c0001e2e <print_hdinfo+0x73>
c0001ec7:	8b 45 08             	mov    0x8(%ebp),%eax
c0001eca:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001ece:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001ed2:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001ed6:	66 c1 e8 08          	shr    $0x8,%ax
c0001eda:	66 85 c0             	test   %ax,%ax
c0001edd:	0f 95 c0             	setne  %al
c0001ee0:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001ee3:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001eea:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001ef0:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001ef4:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001ef8:	75 15                	jne    c0001f0f <print_hdinfo+0x154>
c0001efa:	83 ec 08             	sub    $0x8,%esp
c0001efd:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001f00:	50                   	push   %eax
c0001f01:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f04:	50                   	push   %eax
c0001f05:	e8 67 94 00 00       	call   c000b371 <Strcpy>
c0001f0a:	83 c4 10             	add    $0x10,%esp
c0001f0d:	eb 13                	jmp    c0001f22 <print_hdinfo+0x167>
c0001f0f:	83 ec 08             	sub    $0x8,%esp
c0001f12:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001f15:	50                   	push   %eax
c0001f16:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f19:	50                   	push   %eax
c0001f1a:	e8 52 94 00 00       	call   c000b371 <Strcpy>
c0001f1f:	83 c4 10             	add    $0x10,%esp
c0001f22:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f25:	83 c0 7a             	add    $0x7a,%eax
c0001f28:	0f b7 00             	movzwl (%eax),%eax
c0001f2b:	0f b7 d0             	movzwl %ax,%edx
c0001f2e:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f31:	83 c0 78             	add    $0x78,%eax
c0001f34:	0f b7 00             	movzwl (%eax),%eax
c0001f37:	0f b7 c0             	movzwl %ax,%eax
c0001f3a:	83 c0 10             	add    $0x10,%eax
c0001f3d:	89 c1                	mov    %eax,%ecx
c0001f3f:	d3 e2                	shl    %cl,%edx
c0001f41:	89 d0                	mov    %edx,%eax
c0001f43:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001f46:	90                   	nop
c0001f47:	c9                   	leave  
c0001f48:	c3                   	ret    

c0001f49 <print_dpt_entry>:
c0001f49:	55                   	push   %ebp
c0001f4a:	89 e5                	mov    %esp,%ebp
c0001f4c:	83 ec 08             	sub    $0x8,%esp
c0001f4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f52:	8b 40 08             	mov    0x8(%eax),%eax
c0001f55:	83 ec 08             	sub    $0x8,%esp
c0001f58:	50                   	push   %eax
c0001f59:	68 2e a8 00 c0       	push   $0xc000a82e
c0001f5e:	e8 41 6f 00 00       	call   c0008ea4 <Printf>
c0001f63:	83 c4 10             	add    $0x10,%esp
c0001f66:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f69:	8b 40 0c             	mov    0xc(%eax),%eax
c0001f6c:	83 ec 08             	sub    $0x8,%esp
c0001f6f:	50                   	push   %eax
c0001f70:	68 36 a8 00 c0       	push   $0xc000a836
c0001f75:	e8 2a 6f 00 00       	call   c0008ea4 <Printf>
c0001f7a:	83 c4 10             	add    $0x10,%esp
c0001f7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f80:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001f84:	0f b6 c0             	movzbl %al,%eax
c0001f87:	83 ec 08             	sub    $0x8,%esp
c0001f8a:	50                   	push   %eax
c0001f8b:	68 47 a8 00 c0       	push   $0xc000a847
c0001f90:	e8 0f 6f 00 00       	call   c0008ea4 <Printf>
c0001f95:	83 c4 10             	add    $0x10,%esp
c0001f98:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f9b:	0f b6 00             	movzbl (%eax),%eax
c0001f9e:	0f b6 c0             	movzbl %al,%eax
c0001fa1:	83 ec 08             	sub    $0x8,%esp
c0001fa4:	50                   	push   %eax
c0001fa5:	68 55 a8 00 c0       	push   $0xc000a855
c0001faa:	e8 f5 6e 00 00       	call   c0008ea4 <Printf>
c0001faf:	83 c4 10             	add    $0x10,%esp
c0001fb2:	90                   	nop
c0001fb3:	c9                   	leave  
c0001fb4:	c3                   	ret    

c0001fb5 <get_partition_table>:
c0001fb5:	55                   	push   %ebp
c0001fb6:	89 e5                	mov    %esp,%ebp
c0001fb8:	53                   	push   %ebx
c0001fb9:	83 ec 24             	sub    $0x24,%esp
c0001fbc:	89 e0                	mov    %esp,%eax
c0001fbe:	89 c3                	mov    %eax,%ebx
c0001fc0:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001fc4:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001fc8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fcb:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001fce:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fd1:	c1 f8 08             	sar    $0x8,%eax
c0001fd4:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001fd7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fda:	c1 f8 10             	sar    $0x10,%eax
c0001fdd:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001fe0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fe3:	c1 f8 18             	sar    $0x18,%eax
c0001fe6:	89 c2                	mov    %eax,%edx
c0001fe8:	8b 45 08             	mov    0x8(%ebp),%eax
c0001feb:	c1 e0 04             	shl    $0x4,%eax
c0001fee:	09 d0                	or     %edx,%eax
c0001ff0:	83 c8 e0             	or     $0xffffffe0,%eax
c0001ff3:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001ff6:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0001ffa:	83 ec 0c             	sub    $0xc,%esp
c0001ffd:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0002000:	50                   	push   %eax
c0002001:	e8 fc fb ff ff       	call   c0001c02 <hd_cmd_out>
c0002006:	83 c4 10             	add    $0x10,%esp
c0002009:	e8 79 03 00 00       	call   c0002387 <interrupt_wait>
c000200e:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0002015:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002018:	8d 50 ff             	lea    -0x1(%eax),%edx
c000201b:	89 55 f0             	mov    %edx,-0x10(%ebp)
c000201e:	89 c2                	mov    %eax,%edx
c0002020:	b8 10 00 00 00       	mov    $0x10,%eax
c0002025:	83 e8 01             	sub    $0x1,%eax
c0002028:	01 d0                	add    %edx,%eax
c000202a:	b9 10 00 00 00       	mov    $0x10,%ecx
c000202f:	ba 00 00 00 00       	mov    $0x0,%edx
c0002034:	f7 f1                	div    %ecx
c0002036:	6b c0 10             	imul   $0x10,%eax,%eax
c0002039:	29 c4                	sub    %eax,%esp
c000203b:	89 e0                	mov    %esp,%eax
c000203d:	83 c0 00             	add    $0x0,%eax
c0002040:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002043:	83 ec 04             	sub    $0x4,%esp
c0002046:	ff 75 f4             	pushl  -0xc(%ebp)
c0002049:	6a 00                	push   $0x0
c000204b:	ff 75 ec             	pushl  -0x14(%ebp)
c000204e:	e8 ff 92 00 00       	call   c000b352 <Memset>
c0002053:	83 c4 10             	add    $0x10,%esp
c0002056:	83 ec 04             	sub    $0x4,%esp
c0002059:	ff 75 f4             	pushl  -0xc(%ebp)
c000205c:	ff 75 ec             	pushl  -0x14(%ebp)
c000205f:	68 f0 01 00 00       	push   $0x1f0
c0002064:	e8 3d 93 00 00       	call   c000b3a6 <read_port>
c0002069:	83 c4 10             	add    $0x10,%esp
c000206c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000206f:	05 be 01 00 00       	add    $0x1be,%eax
c0002074:	83 ec 04             	sub    $0x4,%esp
c0002077:	6a 40                	push   $0x40
c0002079:	50                   	push   %eax
c000207a:	ff 75 10             	pushl  0x10(%ebp)
c000207d:	e8 a2 92 00 00       	call   c000b324 <Memcpy>
c0002082:	83 c4 10             	add    $0x10,%esp
c0002085:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c000208c:	89 dc                	mov    %ebx,%esp
c000208e:	90                   	nop
c000208f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0002092:	c9                   	leave  
c0002093:	c3                   	ret    

c0002094 <partition>:
c0002094:	55                   	push   %ebp
c0002095:	89 e5                	mov    %esp,%ebp
c0002097:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000209d:	8b 45 0c             	mov    0xc(%ebp),%eax
c00020a0:	88 45 84             	mov    %al,-0x7c(%ebp)
c00020a3:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00020a7:	7f 19                	jg     c00020c2 <partition+0x2e>
c00020a9:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00020ac:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00020b1:	89 c8                	mov    %ecx,%eax
c00020b3:	f7 ea                	imul   %edx
c00020b5:	d1 fa                	sar    %edx
c00020b7:	89 c8                	mov    %ecx,%eax
c00020b9:	c1 f8 1f             	sar    $0x1f,%eax
c00020bc:	29 c2                	sub    %eax,%edx
c00020be:	89 d0                	mov    %edx,%eax
c00020c0:	eb 11                	jmp    c00020d3 <partition+0x3f>
c00020c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00020c5:	83 e8 10             	sub    $0x10,%eax
c00020c8:	8d 50 3f             	lea    0x3f(%eax),%edx
c00020cb:	85 c0                	test   %eax,%eax
c00020cd:	0f 48 c2             	cmovs  %edx,%eax
c00020d0:	c1 f8 06             	sar    $0x6,%eax
c00020d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00020d6:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c00020da:	0f 85 cc 00 00 00    	jne    c00021ac <partition+0x118>
c00020e0:	83 ec 04             	sub    $0x4,%esp
c00020e3:	6a 40                	push   $0x40
c00020e5:	6a 00                	push   $0x0
c00020e7:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00020ea:	50                   	push   %eax
c00020eb:	e8 62 92 00 00       	call   c000b352 <Memset>
c00020f0:	83 c4 10             	add    $0x10,%esp
c00020f3:	83 ec 04             	sub    $0x4,%esp
c00020f6:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00020f9:	50                   	push   %eax
c00020fa:	6a 00                	push   $0x0
c00020fc:	ff 75 e8             	pushl  -0x18(%ebp)
c00020ff:	e8 b1 fe ff ff       	call   c0001fb5 <get_partition_table>
c0002104:	83 c4 10             	add    $0x10,%esp
c0002107:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000210e:	e9 8a 00 00 00       	jmp    c000219d <partition+0x109>
c0002113:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002116:	83 c0 01             	add    $0x1,%eax
c0002119:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000211c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000211f:	c1 e0 04             	shl    $0x4,%eax
c0002122:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002125:	01 c8                	add    %ecx,%eax
c0002127:	83 e8 5c             	sub    $0x5c,%eax
c000212a:	8b 00                	mov    (%eax),%eax
c000212c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c000212f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002132:	c1 e1 03             	shl    $0x3,%ecx
c0002135:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000213b:	01 ca                	add    %ecx,%edx
c000213d:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c0002143:	89 02                	mov    %eax,(%edx)
c0002145:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002148:	c1 e0 04             	shl    $0x4,%eax
c000214b:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000214e:	01 c8                	add    %ecx,%eax
c0002150:	83 e8 58             	sub    $0x58,%eax
c0002153:	8b 00                	mov    (%eax),%eax
c0002155:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0002158:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000215b:	c1 e1 03             	shl    $0x3,%ecx
c000215e:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002164:	01 ca                	add    %ecx,%edx
c0002166:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c000216c:	89 02                	mov    %eax,(%edx)
c000216e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002171:	c1 e0 04             	shl    $0x4,%eax
c0002174:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002177:	01 c8                	add    %ecx,%eax
c0002179:	83 e8 60             	sub    $0x60,%eax
c000217c:	0f b6 00             	movzbl (%eax),%eax
c000217f:	3c 05                	cmp    $0x5,%al
c0002181:	75 16                	jne    c0002199 <partition+0x105>
c0002183:	8b 55 08             	mov    0x8(%ebp),%edx
c0002186:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002189:	01 d0                	add    %edx,%eax
c000218b:	83 ec 08             	sub    $0x8,%esp
c000218e:	6a 01                	push   $0x1
c0002190:	50                   	push   %eax
c0002191:	e8 fe fe ff ff       	call   c0002094 <partition>
c0002196:	83 c4 10             	add    $0x10,%esp
c0002199:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000219d:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c00021a1:	0f 8e 6c ff ff ff    	jle    c0002113 <partition+0x7f>
c00021a7:	e9 ff 00 00 00       	jmp    c00022ab <partition+0x217>
c00021ac:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c00021b0:	0f 85 f5 00 00 00    	jne    c00022ab <partition+0x217>
c00021b6:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00021b9:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00021be:	89 c8                	mov    %ecx,%eax
c00021c0:	f7 ea                	imul   %edx
c00021c2:	d1 fa                	sar    %edx
c00021c4:	89 c8                	mov    %ecx,%eax
c00021c6:	c1 f8 1f             	sar    $0x1f,%eax
c00021c9:	29 c2                	sub    %eax,%edx
c00021cb:	89 d0                	mov    %edx,%eax
c00021cd:	c1 e0 02             	shl    $0x2,%eax
c00021d0:	01 d0                	add    %edx,%eax
c00021d2:	29 c1                	sub    %eax,%ecx
c00021d4:	89 c8                	mov    %ecx,%eax
c00021d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00021d9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00021dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00021df:	c1 e2 03             	shl    $0x3,%edx
c00021e2:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00021e8:	01 d0                	add    %edx,%eax
c00021ea:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00021ef:	8b 00                	mov    (%eax),%eax
c00021f1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00021f4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00021f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00021fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00021fd:	83 e8 01             	sub    $0x1,%eax
c0002200:	c1 e0 04             	shl    $0x4,%eax
c0002203:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002206:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000220d:	e9 8c 00 00 00       	jmp    c000229e <partition+0x20a>
c0002212:	83 ec 04             	sub    $0x4,%esp
c0002215:	6a 40                	push   $0x40
c0002217:	6a 00                	push   $0x0
c0002219:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000221c:	50                   	push   %eax
c000221d:	e8 30 91 00 00       	call   c000b352 <Memset>
c0002222:	83 c4 10             	add    $0x10,%esp
c0002225:	83 ec 04             	sub    $0x4,%esp
c0002228:	8d 45 94             	lea    -0x6c(%ebp),%eax
c000222b:	50                   	push   %eax
c000222c:	ff 75 f0             	pushl  -0x10(%ebp)
c000222f:	ff 75 e8             	pushl  -0x18(%ebp)
c0002232:	e8 7e fd ff ff       	call   c0001fb5 <get_partition_table>
c0002237:	83 c4 10             	add    $0x10,%esp
c000223a:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000223d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002240:	01 d0                	add    %edx,%eax
c0002242:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0002245:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0002248:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000224b:	01 c2                	add    %eax,%edx
c000224d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0002250:	8d 48 04             	lea    0x4(%eax),%ecx
c0002253:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002256:	c1 e1 03             	shl    $0x3,%ecx
c0002259:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000225f:	01 c8                	add    %ecx,%eax
c0002261:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002266:	89 10                	mov    %edx,(%eax)
c0002268:	8b 45 a0             	mov    -0x60(%ebp),%eax
c000226b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c000226e:	8d 4a 04             	lea    0x4(%edx),%ecx
c0002271:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002274:	c1 e1 03             	shl    $0x3,%ecx
c0002277:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000227d:	01 ca                	add    %ecx,%edx
c000227f:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0002285:	89 02                	mov    %eax,(%edx)
c0002287:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c000228b:	84 c0                	test   %al,%al
c000228d:	74 1b                	je     c00022aa <partition+0x216>
c000228f:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0002292:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002295:	01 d0                	add    %edx,%eax
c0002297:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000229a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000229e:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c00022a2:	0f 8e 6a ff ff ff    	jle    c0002212 <partition+0x17e>
c00022a8:	eb 01                	jmp    c00022ab <partition+0x217>
c00022aa:	90                   	nop
c00022ab:	90                   	nop
c00022ac:	c9                   	leave  
c00022ad:	c3                   	ret    

c00022ae <hd_open>:
c00022ae:	55                   	push   %ebp
c00022af:	89 e5                	mov    %esp,%ebp
c00022b1:	83 ec 18             	sub    $0x18,%esp
c00022b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00022bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022be:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022c4:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c00022c9:	8b 00                	mov    (%eax),%eax
c00022cb:	8d 50 01             	lea    0x1(%eax),%edx
c00022ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022d1:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022d7:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c00022dc:	89 10                	mov    %edx,(%eax)
c00022de:	83 ec 0c             	sub    $0xc,%esp
c00022e1:	6a 00                	push   $0x0
c00022e3:	e8 1c fa ff ff       	call   c0001d04 <hd_identify>
c00022e8:	83 c4 10             	add    $0x10,%esp
c00022eb:	83 ec 08             	sub    $0x8,%esp
c00022ee:	6a 00                	push   $0x0
c00022f0:	6a 00                	push   $0x0
c00022f2:	e8 9d fd ff ff       	call   c0002094 <partition>
c00022f7:	83 c4 10             	add    $0x10,%esp
c00022fa:	90                   	nop
c00022fb:	c9                   	leave  
c00022fc:	c3                   	ret    

c00022fd <get_hd_ioctl>:
c00022fd:	55                   	push   %ebp
c00022fe:	89 e5                	mov    %esp,%ebp
c0002300:	83 ec 10             	sub    $0x10,%esp
c0002303:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0002307:	7f 19                	jg     c0002322 <get_hd_ioctl+0x25>
c0002309:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000230c:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002311:	89 c8                	mov    %ecx,%eax
c0002313:	f7 ea                	imul   %edx
c0002315:	d1 fa                	sar    %edx
c0002317:	89 c8                	mov    %ecx,%eax
c0002319:	c1 f8 1f             	sar    $0x1f,%eax
c000231c:	29 c2                	sub    %eax,%edx
c000231e:	89 d0                	mov    %edx,%eax
c0002320:	eb 11                	jmp    c0002333 <get_hd_ioctl+0x36>
c0002322:	8b 45 08             	mov    0x8(%ebp),%eax
c0002325:	83 e8 10             	sub    $0x10,%eax
c0002328:	8d 50 3f             	lea    0x3f(%eax),%edx
c000232b:	85 c0                	test   %eax,%eax
c000232d:	0f 48 c2             	cmovs  %edx,%eax
c0002330:	c1 f8 06             	sar    $0x6,%eax
c0002333:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0002336:	8b 55 08             	mov    0x8(%ebp),%edx
c0002339:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000233c:	c1 e2 03             	shl    $0x3,%edx
c000233f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002345:	01 d0                	add    %edx,%eax
c0002347:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c000234c:	8b 00                	mov    (%eax),%eax
c000234e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0002351:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0002354:	c9                   	leave  
c0002355:	c3                   	ret    

c0002356 <wait_for>:
c0002356:	55                   	push   %ebp
c0002357:	89 e5                	mov    %esp,%ebp
c0002359:	83 ec 08             	sub    $0x8,%esp
c000235c:	83 ec 04             	sub    $0x4,%esp
c000235f:	68 20 4e 00 00       	push   $0x4e20
c0002364:	6a 08                	push   $0x8
c0002366:	6a 08                	push   $0x8
c0002368:	e8 f6 02 00 00       	call   c0002663 <waitfor>
c000236d:	83 c4 10             	add    $0x10,%esp
c0002370:	85 c0                	test   %eax,%eax
c0002372:	75 10                	jne    c0002384 <wait_for+0x2e>
c0002374:	83 ec 0c             	sub    $0xc,%esp
c0002377:	68 60 a8 00 c0       	push   $0xc000a860
c000237c:	e8 79 6e 00 00       	call   c00091fa <panic>
c0002381:	83 c4 10             	add    $0x10,%esp
c0002384:	90                   	nop
c0002385:	c9                   	leave  
c0002386:	c3                   	ret    

c0002387 <interrupt_wait>:
c0002387:	55                   	push   %ebp
c0002388:	89 e5                	mov    %esp,%ebp
c000238a:	83 ec 18             	sub    $0x18,%esp
c000238d:	83 ec 0c             	sub    $0xc,%esp
c0002390:	6a 6c                	push   $0x6c
c0002392:	e8 32 4b 00 00       	call   c0006ec9 <sys_malloc>
c0002397:	83 c4 10             	add    $0x10,%esp
c000239a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000239d:	83 ec 04             	sub    $0x4,%esp
c00023a0:	6a 6c                	push   $0x6c
c00023a2:	6a 00                	push   $0x0
c00023a4:	ff 75 f4             	pushl  -0xc(%ebp)
c00023a7:	e8 a6 8f 00 00       	call   c000b352 <Memset>
c00023ac:	83 c4 10             	add    $0x10,%esp
c00023af:	83 ec 04             	sub    $0x4,%esp
c00023b2:	68 13 02 00 00       	push   $0x213
c00023b7:	ff 75 f4             	pushl  -0xc(%ebp)
c00023ba:	6a 02                	push   $0x2
c00023bc:	e8 a2 76 00 00       	call   c0009a63 <send_rec>
c00023c1:	83 c4 10             	add    $0x10,%esp
c00023c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023c7:	83 ec 08             	sub    $0x8,%esp
c00023ca:	6a 6c                	push   $0x6c
c00023cc:	50                   	push   %eax
c00023cd:	e8 d6 4d 00 00       	call   c00071a8 <sys_free>
c00023d2:	83 c4 10             	add    $0x10,%esp
c00023d5:	90                   	nop
c00023d6:	c9                   	leave  
c00023d7:	c3                   	ret    

c00023d8 <hd_rdwt>:
c00023d8:	55                   	push   %ebp
c00023d9:	89 e5                	mov    %esp,%ebp
c00023db:	83 ec 48             	sub    $0x48,%esp
c00023de:	8b 45 08             	mov    0x8(%ebp),%eax
c00023e1:	8b 40 18             	mov    0x18(%eax),%eax
c00023e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00023e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00023ea:	8b 40 14             	mov    0x14(%eax),%eax
c00023ed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00023f0:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00023f4:	7f 19                	jg     c000240f <hd_rdwt+0x37>
c00023f6:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c00023f9:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00023fe:	89 c8                	mov    %ecx,%eax
c0002400:	f7 ea                	imul   %edx
c0002402:	d1 fa                	sar    %edx
c0002404:	89 c8                	mov    %ecx,%eax
c0002406:	c1 f8 1f             	sar    $0x1f,%eax
c0002409:	29 c2                	sub    %eax,%edx
c000240b:	89 d0                	mov    %edx,%eax
c000240d:	eb 11                	jmp    c0002420 <hd_rdwt+0x48>
c000240f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002412:	83 e8 10             	sub    $0x10,%eax
c0002415:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002418:	85 c0                	test   %eax,%eax
c000241a:	0f 48 c2             	cmovs  %edx,%eax
c000241d:	c1 f8 06             	sar    $0x6,%eax
c0002420:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002423:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002426:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002429:	89 d0                	mov    %edx,%eax
c000242b:	c1 f8 1f             	sar    $0x1f,%eax
c000242e:	c1 e8 1a             	shr    $0x1a,%eax
c0002431:	01 c2                	add    %eax,%edx
c0002433:	83 e2 3f             	and    $0x3f,%edx
c0002436:	29 c2                	sub    %eax,%edx
c0002438:	89 d0                	mov    %edx,%eax
c000243a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000243d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002440:	c1 e8 09             	shr    $0x9,%eax
c0002443:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002446:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c000244a:	7f 1a                	jg     c0002466 <hd_rdwt+0x8e>
c000244c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000244f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002452:	c1 e2 03             	shl    $0x3,%edx
c0002455:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000245b:	01 d0                	add    %edx,%eax
c000245d:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002462:	8b 00                	mov    (%eax),%eax
c0002464:	eb 1b                	jmp    c0002481 <hd_rdwt+0xa9>
c0002466:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002469:	8d 50 04             	lea    0x4(%eax),%edx
c000246c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000246f:	c1 e2 03             	shl    $0x3,%edx
c0002472:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002478:	01 d0                	add    %edx,%eax
c000247a:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000247f:	8b 00                	mov    (%eax),%eax
c0002481:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0002484:	01 d0                	add    %edx,%eax
c0002486:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002489:	8b 45 08             	mov    0x8(%ebp),%eax
c000248c:	8b 40 0c             	mov    0xc(%eax),%eax
c000248f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002492:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0002495:	05 ff 01 00 00       	add    $0x1ff,%eax
c000249a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00024a0:	85 c0                	test   %eax,%eax
c00024a2:	0f 48 c2             	cmovs  %edx,%eax
c00024a5:	c1 f8 09             	sar    $0x9,%eax
c00024a8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00024ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00024b4:	8b 40 10             	mov    0x10(%eax),%eax
c00024b7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00024ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00024bd:	8b 00                	mov    (%eax),%eax
c00024bf:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00024c2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024c5:	83 ec 08             	sub    $0x8,%esp
c00024c8:	50                   	push   %eax
c00024c9:	ff 75 d0             	pushl  -0x30(%ebp)
c00024cc:	e8 b7 48 00 00       	call   c0006d88 <alloc_virtual_memory>
c00024d1:	83 c4 10             	add    $0x10,%esp
c00024d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00024d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00024da:	8b 40 68             	mov    0x68(%eax),%eax
c00024dd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00024e0:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00024e4:	74 22                	je     c0002508 <hd_rdwt+0x130>
c00024e6:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00024ea:	74 1c                	je     c0002508 <hd_rdwt+0x130>
c00024ec:	68 a3 01 00 00       	push   $0x1a3
c00024f1:	68 c4 a7 00 c0       	push   $0xc000a7c4
c00024f6:	68 c4 a7 00 c0       	push   $0xc000a7c4
c00024fb:	68 72 a8 00 c0       	push   $0xc000a872
c0002500:	e8 13 6d 00 00       	call   c0009218 <assertion_failure>
c0002505:	83 c4 10             	add    $0x10,%esp
c0002508:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c000250c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000250f:	88 45 be             	mov    %al,-0x42(%ebp)
c0002512:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002515:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002518:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000251b:	c1 f8 08             	sar    $0x8,%eax
c000251e:	88 45 c0             	mov    %al,-0x40(%ebp)
c0002521:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002524:	c1 f8 10             	sar    $0x10,%eax
c0002527:	88 45 c1             	mov    %al,-0x3f(%ebp)
c000252a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000252d:	c1 f8 18             	sar    $0x18,%eax
c0002530:	83 e0 0f             	and    $0xf,%eax
c0002533:	83 c8 e0             	or     $0xffffffe0,%eax
c0002536:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002539:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000253d:	75 07                	jne    c0002546 <hd_rdwt+0x16e>
c000253f:	b8 20 00 00 00       	mov    $0x20,%eax
c0002544:	eb 05                	jmp    c000254b <hd_rdwt+0x173>
c0002546:	b8 30 00 00 00       	mov    $0x30,%eax
c000254b:	88 45 c3             	mov    %al,-0x3d(%ebp)
c000254e:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002552:	3c 20                	cmp    $0x20,%al
c0002554:	74 24                	je     c000257a <hd_rdwt+0x1a2>
c0002556:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c000255a:	3c 30                	cmp    $0x30,%al
c000255c:	74 1c                	je     c000257a <hd_rdwt+0x1a2>
c000255e:	68 b1 01 00 00       	push   $0x1b1
c0002563:	68 c4 a7 00 c0       	push   $0xc000a7c4
c0002568:	68 c4 a7 00 c0       	push   $0xc000a7c4
c000256d:	68 90 a8 00 c0       	push   $0xc000a890
c0002572:	e8 a1 6c 00 00       	call   c0009218 <assertion_failure>
c0002577:	83 c4 10             	add    $0x10,%esp
c000257a:	83 ec 0c             	sub    $0xc,%esp
c000257d:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0002580:	50                   	push   %eax
c0002581:	e8 7c f6 ff ff       	call   c0001c02 <hd_cmd_out>
c0002586:	83 c4 10             	add    $0x10,%esp
c0002589:	e9 9c 00 00 00       	jmp    c000262a <hd_rdwt+0x252>
c000258e:	b8 00 02 00 00       	mov    $0x200,%eax
c0002593:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c000259a:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c000259e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00025a1:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00025a5:	75 51                	jne    c00025f8 <hd_rdwt+0x220>
c00025a7:	e8 aa fd ff ff       	call   c0002356 <wait_for>
c00025ac:	e8 d6 fd ff ff       	call   c0002387 <interrupt_wait>
c00025b1:	83 ec 04             	sub    $0x4,%esp
c00025b4:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025b7:	6a 00                	push   $0x0
c00025b9:	68 80 21 01 c0       	push   $0xc0012180
c00025be:	e8 8f 8d 00 00       	call   c000b352 <Memset>
c00025c3:	83 c4 10             	add    $0x10,%esp
c00025c6:	83 ec 04             	sub    $0x4,%esp
c00025c9:	68 00 02 00 00       	push   $0x200
c00025ce:	68 80 21 01 c0       	push   $0xc0012180
c00025d3:	68 f0 01 00 00       	push   $0x1f0
c00025d8:	e8 c9 8d 00 00       	call   c000b3a6 <read_port>
c00025dd:	83 c4 10             	add    $0x10,%esp
c00025e0:	83 ec 04             	sub    $0x4,%esp
c00025e3:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025e6:	68 80 21 01 c0       	push   $0xc0012180
c00025eb:	ff 75 f0             	pushl  -0x10(%ebp)
c00025ee:	e8 31 8d 00 00       	call   c000b324 <Memcpy>
c00025f3:	83 c4 10             	add    $0x10,%esp
c00025f6:	eb 26                	jmp    c000261e <hd_rdwt+0x246>
c00025f8:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00025fc:	75 20                	jne    c000261e <hd_rdwt+0x246>
c00025fe:	e8 53 fd ff ff       	call   c0002356 <wait_for>
c0002603:	83 ec 04             	sub    $0x4,%esp
c0002606:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002609:	ff 75 f0             	pushl  -0x10(%ebp)
c000260c:	68 f0 01 00 00       	push   $0x1f0
c0002611:	e8 a4 8d 00 00       	call   c000b3ba <write_port>
c0002616:	83 c4 10             	add    $0x10,%esp
c0002619:	e8 69 fd ff ff       	call   c0002387 <interrupt_wait>
c000261e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002621:	29 45 f4             	sub    %eax,-0xc(%ebp)
c0002624:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002627:	01 45 f0             	add    %eax,-0x10(%ebp)
c000262a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000262e:	0f 85 5a ff ff ff    	jne    c000258e <hd_rdwt+0x1b6>
c0002634:	90                   	nop
c0002635:	c9                   	leave  
c0002636:	c3                   	ret    

c0002637 <hd_handler>:
c0002637:	55                   	push   %ebp
c0002638:	89 e5                	mov    %esp,%ebp
c000263a:	83 ec 18             	sub    $0x18,%esp
c000263d:	83 ec 0c             	sub    $0xc,%esp
c0002640:	68 f7 01 00 00       	push   $0x1f7
c0002645:	e8 38 f1 ff ff       	call   c0001782 <in_byte>
c000264a:	83 c4 10             	add    $0x10,%esp
c000264d:	0f b6 c0             	movzbl %al,%eax
c0002650:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002653:	83 ec 0c             	sub    $0xc,%esp
c0002656:	6a 03                	push   $0x3
c0002658:	e8 95 76 00 00       	call   c0009cf2 <inform_int>
c000265d:	83 c4 10             	add    $0x10,%esp
c0002660:	90                   	nop
c0002661:	c9                   	leave  
c0002662:	c3                   	ret    

c0002663 <waitfor>:
c0002663:	55                   	push   %ebp
c0002664:	89 e5                	mov    %esp,%ebp
c0002666:	83 ec 18             	sub    $0x18,%esp
c0002669:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002670:	eb 26                	jmp    c0002698 <waitfor+0x35>
c0002672:	83 ec 0c             	sub    $0xc,%esp
c0002675:	68 f7 01 00 00       	push   $0x1f7
c000267a:	e8 03 f1 ff ff       	call   c0001782 <in_byte>
c000267f:	83 c4 10             	add    $0x10,%esp
c0002682:	0f b6 c0             	movzbl %al,%eax
c0002685:	23 45 08             	and    0x8(%ebp),%eax
c0002688:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000268b:	75 07                	jne    c0002694 <waitfor+0x31>
c000268d:	b8 01 00 00 00       	mov    $0x1,%eax
c0002692:	eb 11                	jmp    c00026a5 <waitfor+0x42>
c0002694:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002698:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000269b:	3b 45 10             	cmp    0x10(%ebp),%eax
c000269e:	7c d2                	jl     c0002672 <waitfor+0xf>
c00026a0:	b8 00 00 00 00       	mov    $0x0,%eax
c00026a5:	c9                   	leave  
c00026a6:	c3                   	ret    

c00026a7 <print_hd_info>:
c00026a7:	55                   	push   %ebp
c00026a8:	89 e5                	mov    %esp,%ebp
c00026aa:	83 ec 18             	sub    $0x18,%esp
c00026ad:	83 ec 0c             	sub    $0xc,%esp
c00026b0:	68 c4 a8 00 c0       	push   $0xc000a8c4
c00026b5:	e8 ea 67 00 00       	call   c0008ea4 <Printf>
c00026ba:	83 c4 10             	add    $0x10,%esp
c00026bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00026c4:	eb 3b                	jmp    c0002701 <print_hd_info+0x5a>
c00026c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026c9:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00026d0:	85 c0                	test   %eax,%eax
c00026d2:	74 28                	je     c00026fc <print_hd_info+0x55>
c00026d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026d7:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00026de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026e1:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00026e8:	ff 75 f4             	pushl  -0xc(%ebp)
c00026eb:	52                   	push   %edx
c00026ec:	50                   	push   %eax
c00026ed:	68 e1 a8 00 c0       	push   $0xc000a8e1
c00026f2:	e8 ad 67 00 00       	call   c0008ea4 <Printf>
c00026f7:	83 c4 10             	add    $0x10,%esp
c00026fa:	eb 01                	jmp    c00026fd <print_hd_info+0x56>
c00026fc:	90                   	nop
c00026fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002701:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002705:	7e bf                	jle    c00026c6 <print_hd_info+0x1f>
c0002707:	83 ec 0c             	sub    $0xc,%esp
c000270a:	68 f9 a8 00 c0       	push   $0xc000a8f9
c000270f:	e8 90 67 00 00       	call   c0008ea4 <Printf>
c0002714:	83 c4 10             	add    $0x10,%esp
c0002717:	83 ec 0c             	sub    $0xc,%esp
c000271a:	68 14 a9 00 c0       	push   $0xc000a914
c000271f:	e8 80 67 00 00       	call   c0008ea4 <Printf>
c0002724:	83 c4 10             	add    $0x10,%esp
c0002727:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c000272e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002735:	eb 44                	jmp    c000277b <print_hd_info+0xd4>
c0002737:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000273a:	83 c0 04             	add    $0x4,%eax
c000273d:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c0002744:	85 c0                	test   %eax,%eax
c0002746:	74 2e                	je     c0002776 <print_hd_info+0xcf>
c0002748:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000274b:	83 c0 04             	add    $0x4,%eax
c000274e:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c0002755:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002758:	83 c0 04             	add    $0x4,%eax
c000275b:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c0002762:	ff 75 f0             	pushl  -0x10(%ebp)
c0002765:	52                   	push   %edx
c0002766:	50                   	push   %eax
c0002767:	68 e1 a8 00 c0       	push   $0xc000a8e1
c000276c:	e8 33 67 00 00       	call   c0008ea4 <Printf>
c0002771:	83 c4 10             	add    $0x10,%esp
c0002774:	eb 01                	jmp    c0002777 <print_hd_info+0xd0>
c0002776:	90                   	nop
c0002777:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000277b:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c000277f:	7e b6                	jle    c0002737 <print_hd_info+0x90>
c0002781:	83 ec 0c             	sub    $0xc,%esp
c0002784:	68 31 a9 00 c0       	push   $0xc000a931
c0002789:	e8 16 67 00 00       	call   c0008ea4 <Printf>
c000278e:	83 c4 10             	add    $0x10,%esp
c0002791:	90                   	nop
c0002792:	c9                   	leave  
c0002793:	c3                   	ret    

c0002794 <is_empty>:
c0002794:	55                   	push   %ebp
c0002795:	89 e5                	mov    %esp,%ebp
c0002797:	83 ec 10             	sub    $0x10,%esp
c000279a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00027a1:	eb 1a                	jmp    c00027bd <is_empty+0x29>
c00027a3:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00027a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00027a9:	01 d0                	add    %edx,%eax
c00027ab:	0f b6 00             	movzbl (%eax),%eax
c00027ae:	84 c0                	test   %al,%al
c00027b0:	74 07                	je     c00027b9 <is_empty+0x25>
c00027b2:	b8 00 00 00 00       	mov    $0x0,%eax
c00027b7:	eb 11                	jmp    c00027ca <is_empty+0x36>
c00027b9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00027bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00027c0:	3b 45 0c             	cmp    0xc(%ebp),%eax
c00027c3:	7c de                	jl     c00027a3 <is_empty+0xf>
c00027c5:	b8 01 00 00 00       	mov    $0x1,%eax
c00027ca:	c9                   	leave  
c00027cb:	c3                   	ret    
c00027cc:	66 90                	xchg   %ax,%ax
c00027ce:	66 90                	xchg   %ax,%ax

c00027d0 <get_ticks>:
c00027d0:	b8 00 00 00 00       	mov    $0x0,%eax
c00027d5:	cd 90                	int    $0x90
c00027d7:	c3                   	ret    

c00027d8 <write2>:
c00027d8:	b8 01 00 00 00       	mov    $0x1,%eax
c00027dd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00027e1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00027e5:	cd 90                	int    $0x90
c00027e7:	c3                   	ret    

c00027e8 <write_debug>:
c00027e8:	b8 02 00 00 00       	mov    $0x2,%eax
c00027ed:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00027f1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00027f5:	cd 90                	int    $0x90
c00027f7:	c3                   	ret    

c00027f8 <send_msg2>:
c00027f8:	b8 03 00 00 00       	mov    $0x3,%eax
c00027fd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002801:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002805:	cd 90                	int    $0x90
c0002807:	c3                   	ret    

c0002808 <send_msg>:
c0002808:	55                   	push   %ebp
c0002809:	89 e5                	mov    %esp,%ebp
c000280b:	53                   	push   %ebx
c000280c:	51                   	push   %ecx
c000280d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002812:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002815:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002818:	cd 90                	int    $0x90
c000281a:	59                   	pop    %ecx
c000281b:	5b                   	pop    %ebx
c000281c:	5d                   	pop    %ebp
c000281d:	c3                   	ret    

c000281e <receive_msg2>:
c000281e:	b8 04 00 00 00       	mov    $0x4,%eax
c0002823:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002827:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000282b:	cd 90                	int    $0x90
c000282d:	c3                   	ret    

c000282e <receive_msg>:
c000282e:	55                   	push   %ebp
c000282f:	89 e5                	mov    %esp,%ebp
c0002831:	53                   	push   %ebx
c0002832:	51                   	push   %ecx
c0002833:	b8 04 00 00 00       	mov    $0x4,%eax
c0002838:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000283b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000283e:	cd 90                	int    $0x90
c0002840:	59                   	pop    %ecx
c0002841:	5b                   	pop    %ebx
c0002842:	5d                   	pop    %ebp
c0002843:	c3                   	ret    

c0002844 <task_fs>:
c0002844:	55                   	push   %ebp
c0002845:	89 e5                	mov    %esp,%ebp
c0002847:	83 ec 38             	sub    $0x38,%esp
c000284a:	e8 3d f0 ff ff       	call   c000188c <get_running_thread_pcb>
c000284f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002852:	e8 87 08 00 00       	call   c00030de <init_fs>
c0002857:	83 ec 0c             	sub    $0xc,%esp
c000285a:	6a 6c                	push   $0x6c
c000285c:	e8 68 46 00 00       	call   c0006ec9 <sys_malloc>
c0002861:	83 c4 10             	add    $0x10,%esp
c0002864:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002867:	83 ec 0c             	sub    $0xc,%esp
c000286a:	6a 6c                	push   $0x6c
c000286c:	e8 58 46 00 00       	call   c0006ec9 <sys_malloc>
c0002871:	83 c4 10             	add    $0x10,%esp
c0002874:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002877:	83 ec 04             	sub    $0x4,%esp
c000287a:	6a 6c                	push   $0x6c
c000287c:	6a 00                	push   $0x0
c000287e:	ff 75 f0             	pushl  -0x10(%ebp)
c0002881:	e8 cc 8a 00 00       	call   c000b352 <Memset>
c0002886:	83 c4 10             	add    $0x10,%esp
c0002889:	83 ec 04             	sub    $0x4,%esp
c000288c:	6a 0e                	push   $0xe
c000288e:	ff 75 f0             	pushl  -0x10(%ebp)
c0002891:	6a 02                	push   $0x2
c0002893:	e8 cb 71 00 00       	call   c0009a63 <send_rec>
c0002898:	83 c4 10             	add    $0x10,%esp
c000289b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000289e:	8b 40 68             	mov    0x68(%eax),%eax
c00028a1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00028a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028a7:	8b 00                	mov    (%eax),%eax
c00028a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00028ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028af:	8b 40 40             	mov    0x40(%eax),%eax
c00028b2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00028b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028b8:	8b 40 58             	mov    0x58(%eax),%eax
c00028bb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00028be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028c1:	8b 00                	mov    (%eax),%eax
c00028c3:	85 c0                	test   %eax,%eax
c00028c5:	75 07                	jne    c00028ce <task_fs+0x8a>
c00028c7:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00028ce:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00028d5:	83 ec 0c             	sub    $0xc,%esp
c00028d8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00028db:	e8 37 21 00 00       	call   c0004a17 <pid2proc>
c00028e0:	83 c4 10             	add    $0x10,%esp
c00028e3:	a3 64 fb 00 c0       	mov    %eax,0xc000fb64
c00028e8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00028ec:	74 36                	je     c0002924 <task_fs+0xe0>
c00028ee:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c00028f2:	74 30                	je     c0002924 <task_fs+0xe0>
c00028f4:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c00028f8:	74 2a                	je     c0002924 <task_fs+0xe0>
c00028fa:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00028fe:	74 24                	je     c0002924 <task_fs+0xe0>
c0002900:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c0002904:	74 1e                	je     c0002924 <task_fs+0xe0>
c0002906:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000290a:	74 18                	je     c0002924 <task_fs+0xe0>
c000290c:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0002913:	00 00 00 
c0002916:	83 ec 0c             	sub    $0xc,%esp
c0002919:	ff 75 e8             	pushl  -0x18(%ebp)
c000291c:	e8 21 51 00 00       	call   c0007a42 <disp_int>
c0002921:	83 c4 10             	add    $0x10,%esp
c0002924:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0002928:	74 37                	je     c0002961 <task_fs+0x11d>
c000292a:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c000292e:	74 31                	je     c0002961 <task_fs+0x11d>
c0002930:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c0002934:	74 2b                	je     c0002961 <task_fs+0x11d>
c0002936:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000293a:	74 25                	je     c0002961 <task_fs+0x11d>
c000293c:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c0002940:	74 1f                	je     c0002961 <task_fs+0x11d>
c0002942:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0002946:	74 19                	je     c0002961 <task_fs+0x11d>
c0002948:	6a 7c                	push   $0x7c
c000294a:	68 50 a9 00 c0       	push   $0xc000a950
c000294f:	68 50 a9 00 c0       	push   $0xc000a950
c0002954:	68 60 a9 00 c0       	push   $0xc000a960
c0002959:	e8 ba 68 00 00       	call   c0009218 <assertion_failure>
c000295e:	83 c4 10             	add    $0x10,%esp
c0002961:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c0002965:	74 2f                	je     c0002996 <task_fs+0x152>
c0002967:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c000296b:	7f 15                	jg     c0002982 <task_fs+0x13e>
c000296d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0002971:	0f 84 a5 00 00 00    	je     c0002a1c <task_fs+0x1d8>
c0002977:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000297b:	74 64                	je     c00029e1 <task_fs+0x19d>
c000297d:	e9 88 00 00 00       	jmp    c0002a0a <task_fs+0x1c6>
c0002982:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c0002986:	74 46                	je     c00029ce <task_fs+0x18a>
c0002988:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c000298c:	74 63                	je     c00029f1 <task_fs+0x1ad>
c000298e:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0002992:	74 3a                	je     c00029ce <task_fs+0x18a>
c0002994:	eb 74                	jmp    c0002a0a <task_fs+0x1c6>
c0002996:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002999:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00029a0:	83 ec 0c             	sub    $0xc,%esp
c00029a3:	ff 75 f0             	pushl  -0x10(%ebp)
c00029a6:	e8 88 07 00 00       	call   c0003133 <do_open>
c00029ab:	83 c4 10             	add    $0x10,%esp
c00029ae:	89 c2                	mov    %eax,%edx
c00029b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029b3:	89 50 40             	mov    %edx,0x40(%eax)
c00029b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029b9:	8b 00                	mov    (%eax),%eax
c00029bb:	83 ec 04             	sub    $0x4,%esp
c00029be:	50                   	push   %eax
c00029bf:	ff 75 f0             	pushl  -0x10(%ebp)
c00029c2:	6a 01                	push   $0x1
c00029c4:	e8 9a 70 00 00       	call   c0009a63 <send_rec>
c00029c9:	83 c4 10             	add    $0x10,%esp
c00029cc:	eb 4f                	jmp    c0002a1d <task_fs+0x1d9>
c00029ce:	83 ec 0c             	sub    $0xc,%esp
c00029d1:	ff 75 f0             	pushl  -0x10(%ebp)
c00029d4:	e8 98 18 00 00       	call   c0004271 <do_rdwt>
c00029d9:	83 c4 10             	add    $0x10,%esp
c00029dc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00029df:	eb 3c                	jmp    c0002a1d <task_fs+0x1d9>
c00029e1:	83 ec 0c             	sub    $0xc,%esp
c00029e4:	ff 75 e0             	pushl  -0x20(%ebp)
c00029e7:	e8 a9 1d 00 00       	call   c0004795 <do_close>
c00029ec:	83 c4 10             	add    $0x10,%esp
c00029ef:	eb 2c                	jmp    c0002a1d <task_fs+0x1d9>
c00029f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029f4:	8b 40 58             	mov    0x58(%eax),%eax
c00029f7:	83 ec 04             	sub    $0x4,%esp
c00029fa:	50                   	push   %eax
c00029fb:	ff 75 f0             	pushl  -0x10(%ebp)
c00029fe:	6a 01                	push   $0x1
c0002a00:	e8 5e 70 00 00       	call   c0009a63 <send_rec>
c0002a05:	83 c4 10             	add    $0x10,%esp
c0002a08:	eb 13                	jmp    c0002a1d <task_fs+0x1d9>
c0002a0a:	83 ec 0c             	sub    $0xc,%esp
c0002a0d:	68 c3 a9 00 c0       	push   $0xc000a9c3
c0002a12:	e8 e3 67 00 00       	call   c00091fa <panic>
c0002a17:	83 c4 10             	add    $0x10,%esp
c0002a1a:	eb 01                	jmp    c0002a1d <task_fs+0x1d9>
c0002a1c:	90                   	nop
c0002a1d:	e9 55 fe ff ff       	jmp    c0002877 <task_fs+0x33>

c0002a22 <rd_wt>:
c0002a22:	55                   	push   %ebp
c0002a23:	89 e5                	mov    %esp,%ebp
c0002a25:	83 ec 18             	sub    $0x18,%esp
c0002a28:	83 ec 0c             	sub    $0xc,%esp
c0002a2b:	6a 6c                	push   $0x6c
c0002a2d:	e8 97 44 00 00       	call   c0006ec9 <sys_malloc>
c0002a32:	83 c4 10             	add    $0x10,%esp
c0002a35:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002a38:	83 ec 04             	sub    $0x4,%esp
c0002a3b:	6a 6c                	push   $0x6c
c0002a3d:	6a 00                	push   $0x0
c0002a3f:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a42:	e8 0b 89 00 00       	call   c000b352 <Memset>
c0002a47:	83 c4 10             	add    $0x10,%esp
c0002a4a:	8b 55 18             	mov    0x18(%ebp),%edx
c0002a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a50:	89 50 68             	mov    %edx,0x68(%eax)
c0002a53:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002a56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a59:	89 50 14             	mov    %edx,0x14(%eax)
c0002a5c:	8b 55 10             	mov    0x10(%ebp),%edx
c0002a5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a62:	89 50 10             	mov    %edx,0x10(%eax)
c0002a65:	8b 55 14             	mov    0x14(%ebp),%edx
c0002a68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a6b:	89 50 0c             	mov    %edx,0xc(%eax)
c0002a6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0002a71:	c1 e0 09             	shl    $0x9,%eax
c0002a74:	89 c2                	mov    %eax,%edx
c0002a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a79:	89 50 18             	mov    %edx,0x18(%eax)
c0002a7c:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002a80:	74 22                	je     c0002aa4 <rd_wt+0x82>
c0002a82:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002a86:	74 1c                	je     c0002aa4 <rd_wt+0x82>
c0002a88:	68 a7 00 00 00       	push   $0xa7
c0002a8d:	68 50 a9 00 c0       	push   $0xc000a950
c0002a92:	68 50 a9 00 c0       	push   $0xc000a950
c0002a97:	68 d6 a9 00 c0       	push   $0xc000a9d6
c0002a9c:	e8 77 67 00 00       	call   c0009218 <assertion_failure>
c0002aa1:	83 c4 10             	add    $0x10,%esp
c0002aa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002aa7:	8b 40 68             	mov    0x68(%eax),%eax
c0002aaa:	83 f8 07             	cmp    $0x7,%eax
c0002aad:	74 27                	je     c0002ad6 <rd_wt+0xb4>
c0002aaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ab2:	8b 40 68             	mov    0x68(%eax),%eax
c0002ab5:	83 f8 0a             	cmp    $0xa,%eax
c0002ab8:	74 1c                	je     c0002ad6 <rd_wt+0xb4>
c0002aba:	68 a8 00 00 00       	push   $0xa8
c0002abf:	68 50 a9 00 c0       	push   $0xc000a950
c0002ac4:	68 50 a9 00 c0       	push   $0xc000a950
c0002ac9:	68 f4 a9 00 c0       	push   $0xc000a9f4
c0002ace:	e8 45 67 00 00       	call   c0009218 <assertion_failure>
c0002ad3:	83 c4 10             	add    $0x10,%esp
c0002ad6:	83 ec 04             	sub    $0x4,%esp
c0002ad9:	6a 03                	push   $0x3
c0002adb:	ff 75 f4             	pushl  -0xc(%ebp)
c0002ade:	6a 03                	push   $0x3
c0002ae0:	e8 7e 6f 00 00       	call   c0009a63 <send_rec>
c0002ae5:	83 c4 10             	add    $0x10,%esp
c0002ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002aeb:	83 ec 08             	sub    $0x8,%esp
c0002aee:	6a 6c                	push   $0x6c
c0002af0:	50                   	push   %eax
c0002af1:	e8 b2 46 00 00       	call   c00071a8 <sys_free>
c0002af6:	83 c4 10             	add    $0x10,%esp
c0002af9:	90                   	nop
c0002afa:	c9                   	leave  
c0002afb:	c3                   	ret    

c0002afc <mkfs>:
c0002afc:	55                   	push   %ebp
c0002afd:	89 e5                	mov    %esp,%ebp
c0002aff:	57                   	push   %edi
c0002b00:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002b06:	83 ec 0c             	sub    $0xc,%esp
c0002b09:	68 00 80 00 00       	push   $0x8000
c0002b0e:	e8 b6 43 00 00       	call   c0006ec9 <sys_malloc>
c0002b13:	83 c4 10             	add    $0x10,%esp
c0002b16:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002b1b:	83 ec 0c             	sub    $0xc,%esp
c0002b1e:	6a 24                	push   $0x24
c0002b20:	e8 a4 43 00 00       	call   c0006ec9 <sys_malloc>
c0002b25:	83 c4 10             	add    $0x10,%esp
c0002b28:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002b2d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b32:	83 ec 0c             	sub    $0xc,%esp
c0002b35:	50                   	push   %eax
c0002b36:	e8 ba 42 00 00       	call   c0006df5 <get_physical_address>
c0002b3b:	83 c4 10             	add    $0x10,%esp
c0002b3e:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002b43:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002b48:	83 ec 0c             	sub    $0xc,%esp
c0002b4b:	50                   	push   %eax
c0002b4c:	e8 a4 42 00 00       	call   c0006df5 <get_physical_address>
c0002b51:	83 c4 10             	add    $0x10,%esp
c0002b54:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002b59:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b5e:	83 ec 04             	sub    $0x4,%esp
c0002b61:	68 00 02 00 00       	push   $0x200
c0002b66:	6a 00                	push   $0x0
c0002b68:	50                   	push   %eax
c0002b69:	e8 e4 87 00 00       	call   c000b352 <Memset>
c0002b6e:	83 c4 10             	add    $0x10,%esp
c0002b71:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002b76:	83 ec 0c             	sub    $0xc,%esp
c0002b79:	6a 0a                	push   $0xa
c0002b7b:	68 00 02 00 00       	push   $0x200
c0002b80:	50                   	push   %eax
c0002b81:	6a 20                	push   $0x20
c0002b83:	6a 00                	push   $0x0
c0002b85:	e8 98 fe ff ff       	call   c0002a22 <rd_wt>
c0002b8a:	83 c4 20             	add    $0x20,%esp
c0002b8d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b92:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002b95:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b98:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002b9f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002ba2:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002ba9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bac:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002bb3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bb6:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002bbd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bc0:	8b 40 04             	mov    0x4(%eax),%eax
c0002bc3:	8d 50 02             	lea    0x2(%eax),%edx
c0002bc6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bc9:	8b 40 08             	mov    0x8(%eax),%eax
c0002bcc:	01 c2                	add    %eax,%edx
c0002bce:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bd1:	8b 40 0c             	mov    0xc(%eax),%eax
c0002bd4:	01 c2                	add    %eax,%edx
c0002bd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bd9:	89 10                	mov    %edx,(%eax)
c0002bdb:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002be2:	b8 00 02 00 00       	mov    $0x200,%eax
c0002be7:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002bea:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002bf0:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002bf3:	01 ca                	add    %ecx,%edx
c0002bf5:	83 ec 04             	sub    $0x4,%esp
c0002bf8:	50                   	push   %eax
c0002bf9:	6a 80                	push   $0xffffff80
c0002bfb:	52                   	push   %edx
c0002bfc:	e8 51 87 00 00       	call   c000b352 <Memset>
c0002c01:	83 c4 10             	add    $0x10,%esp
c0002c04:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c09:	83 ec 0c             	sub    $0xc,%esp
c0002c0c:	6a 0a                	push   $0xa
c0002c0e:	68 00 02 00 00       	push   $0x200
c0002c13:	50                   	push   %eax
c0002c14:	6a 20                	push   $0x20
c0002c16:	6a 01                	push   $0x1
c0002c18:	e8 05 fe ff ff       	call   c0002a22 <rd_wt>
c0002c1d:	83 c4 20             	add    $0x20,%esp
c0002c20:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002c23:	8b 10                	mov    (%eax),%edx
c0002c25:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002c28:	8b 50 04             	mov    0x4(%eax),%edx
c0002c2b:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002c2e:	8b 50 08             	mov    0x8(%eax),%edx
c0002c31:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002c34:	8b 50 0c             	mov    0xc(%eax),%edx
c0002c37:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002c3a:	8b 50 10             	mov    0x10(%eax),%edx
c0002c3d:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002c40:	8b 50 14             	mov    0x14(%eax),%edx
c0002c43:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002c46:	8b 50 18             	mov    0x18(%eax),%edx
c0002c49:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002c4c:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002c4f:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002c52:	8b 40 20             	mov    0x20(%eax),%eax
c0002c55:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002c58:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002c5c:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002c60:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c65:	83 ec 04             	sub    $0x4,%esp
c0002c68:	6a 01                	push   $0x1
c0002c6a:	52                   	push   %edx
c0002c6b:	50                   	push   %eax
c0002c6c:	e8 e1 86 00 00       	call   c000b352 <Memset>
c0002c71:	83 c4 10             	add    $0x10,%esp
c0002c74:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c79:	83 c0 01             	add    $0x1,%eax
c0002c7c:	83 ec 04             	sub    $0x4,%esp
c0002c7f:	68 ff 01 00 00       	push   $0x1ff
c0002c84:	6a 80                	push   $0xffffff80
c0002c86:	50                   	push   %eax
c0002c87:	e8 c6 86 00 00       	call   c000b352 <Memset>
c0002c8c:	83 c4 10             	add    $0x10,%esp
c0002c8f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c94:	83 ec 0c             	sub    $0xc,%esp
c0002c97:	6a 0a                	push   $0xa
c0002c99:	68 00 02 00 00       	push   $0x200
c0002c9e:	50                   	push   %eax
c0002c9f:	6a 20                	push   $0x20
c0002ca1:	6a 02                	push   $0x2
c0002ca3:	e8 7a fd ff ff       	call   c0002a22 <rd_wt>
c0002ca8:	83 c4 20             	add    $0x20,%esp
c0002cab:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002cb2:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cb7:	83 ec 04             	sub    $0x4,%esp
c0002cba:	68 00 02 00 00       	push   $0x200
c0002cbf:	6a ff                	push   $0xffffffff
c0002cc1:	50                   	push   %eax
c0002cc2:	e8 8b 86 00 00       	call   c000b352 <Memset>
c0002cc7:	83 c4 10             	add    $0x10,%esp
c0002cca:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ccf:	83 ec 0c             	sub    $0xc,%esp
c0002cd2:	6a 0a                	push   $0xa
c0002cd4:	68 00 02 00 00       	push   $0x200
c0002cd9:	50                   	push   %eax
c0002cda:	6a 20                	push   $0x20
c0002cdc:	ff 75 d0             	pushl  -0x30(%ebp)
c0002cdf:	e8 3e fd ff ff       	call   c0002a22 <rd_wt>
c0002ce4:	83 c4 20             	add    $0x20,%esp
c0002ce7:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cec:	83 ec 04             	sub    $0x4,%esp
c0002cef:	6a 01                	push   $0x1
c0002cf1:	6a 01                	push   $0x1
c0002cf3:	50                   	push   %eax
c0002cf4:	e8 59 86 00 00       	call   c000b352 <Memset>
c0002cf9:	83 c4 10             	add    $0x10,%esp
c0002cfc:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d01:	83 c0 01             	add    $0x1,%eax
c0002d04:	83 ec 04             	sub    $0x4,%esp
c0002d07:	68 ff 01 00 00       	push   $0x1ff
c0002d0c:	6a 00                	push   $0x0
c0002d0e:	50                   	push   %eax
c0002d0f:	e8 3e 86 00 00       	call   c000b352 <Memset>
c0002d14:	83 c4 10             	add    $0x10,%esp
c0002d17:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d1c:	89 c2                	mov    %eax,%edx
c0002d1e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002d21:	83 c0 01             	add    $0x1,%eax
c0002d24:	83 ec 0c             	sub    $0xc,%esp
c0002d27:	6a 0a                	push   $0xa
c0002d29:	68 00 02 00 00       	push   $0x200
c0002d2e:	52                   	push   %edx
c0002d2f:	6a 20                	push   $0x20
c0002d31:	50                   	push   %eax
c0002d32:	e8 eb fc ff ff       	call   c0002a22 <rd_wt>
c0002d37:	83 c4 20             	add    $0x20,%esp
c0002d3a:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d3d:	83 e8 02             	sub    $0x2,%eax
c0002d40:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002d43:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002d4a:	eb 04                	jmp    c0002d50 <mkfs+0x254>
c0002d4c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002d50:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002d53:	83 c0 01             	add    $0x1,%eax
c0002d56:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002d59:	7e f1                	jle    c0002d4c <mkfs+0x250>
c0002d5b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d60:	89 c2                	mov    %eax,%edx
c0002d62:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d65:	83 c0 03             	add    $0x3,%eax
c0002d68:	83 ec 0c             	sub    $0xc,%esp
c0002d6b:	6a 0a                	push   $0xa
c0002d6d:	68 00 02 00 00       	push   $0x200
c0002d72:	52                   	push   %edx
c0002d73:	6a 20                	push   $0x20
c0002d75:	50                   	push   %eax
c0002d76:	e8 a7 fc ff ff       	call   c0002a22 <rd_wt>
c0002d7b:	83 c4 20             	add    $0x20,%esp
c0002d7e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d83:	89 c2                	mov    %eax,%edx
c0002d85:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d88:	83 c0 03             	add    $0x3,%eax
c0002d8b:	83 ec 0c             	sub    $0xc,%esp
c0002d8e:	6a 07                	push   $0x7
c0002d90:	68 00 02 00 00       	push   $0x200
c0002d95:	52                   	push   %edx
c0002d96:	6a 20                	push   $0x20
c0002d98:	50                   	push   %eax
c0002d99:	e8 84 fc ff ff       	call   c0002a22 <rd_wt>
c0002d9e:	83 c4 20             	add    $0x20,%esp
c0002da1:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002da6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002da9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dac:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002db2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002db5:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002dbc:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002dbf:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dc2:	89 50 08             	mov    %edx,0x8(%eax)
c0002dc5:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dc8:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002dcf:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dd2:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002dd9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ddc:	8b 10                	mov    (%eax),%edx
c0002dde:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002de4:	8b 50 04             	mov    0x4(%eax),%edx
c0002de7:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002ded:	8b 50 08             	mov    0x8(%eax),%edx
c0002df0:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002df6:	8b 50 0c             	mov    0xc(%eax),%edx
c0002df9:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002dff:	8b 50 10             	mov    0x10(%eax),%edx
c0002e02:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002e08:	8b 50 14             	mov    0x14(%eax),%edx
c0002e0b:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002e11:	8b 50 18             	mov    0x18(%eax),%edx
c0002e14:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002e1a:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002e1d:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002e23:	8b 50 20             	mov    0x20(%eax),%edx
c0002e26:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002e2c:	8b 40 24             	mov    0x24(%eax),%eax
c0002e2f:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002e34:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002e3b:	eb 4c                	jmp    c0002e89 <mkfs+0x38d>
c0002e3d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e42:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002e45:	83 c2 01             	add    $0x1,%edx
c0002e48:	c1 e2 05             	shl    $0x5,%edx
c0002e4b:	01 d0                	add    %edx,%eax
c0002e4d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002e50:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e53:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002e59:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e5c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002e63:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e66:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002e6d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002e74:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002e77:	c1 e0 08             	shl    $0x8,%eax
c0002e7a:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002e7d:	89 c2                	mov    %eax,%edx
c0002e7f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e82:	89 50 08             	mov    %edx,0x8(%eax)
c0002e85:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002e89:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002e8d:	7e ae                	jle    c0002e3d <mkfs+0x341>
c0002e8f:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002e96:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002e9c:	b8 00 00 00 00       	mov    $0x0,%eax
c0002ea1:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002ea6:	89 d7                	mov    %edx,%edi
c0002ea8:	f3 ab                	rep stos %eax,%es:(%edi)
c0002eaa:	c7 85 70 ff ff ff 1c 	movl   $0xc000aa1c,-0x90(%ebp)
c0002eb1:	aa 00 c0 
c0002eb4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002ebb:	eb 54                	jmp    c0002f11 <mkfs+0x415>
c0002ebd:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ec2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002ec5:	83 c2 04             	add    $0x4,%edx
c0002ec8:	c1 e2 05             	shl    $0x5,%edx
c0002ecb:	01 d0                	add    %edx,%eax
c0002ecd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002ed0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ed3:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002ed9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002edc:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002ee3:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002ee6:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002ee9:	83 c2 01             	add    $0x1,%edx
c0002eec:	c1 e2 0b             	shl    $0xb,%edx
c0002eef:	01 c2                	add    %eax,%edx
c0002ef1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ef4:	89 50 08             	mov    %edx,0x8(%eax)
c0002ef7:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002efa:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002f01:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f04:	8d 50 05             	lea    0x5(%eax),%edx
c0002f07:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f0a:	89 50 10             	mov    %edx,0x10(%eax)
c0002f0d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002f11:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f14:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002f17:	7c a4                	jl     c0002ebd <mkfs+0x3c1>
c0002f19:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f1e:	89 c2                	mov    %eax,%edx
c0002f20:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002f23:	83 c0 03             	add    $0x3,%eax
c0002f26:	83 ec 0c             	sub    $0xc,%esp
c0002f29:	6a 0a                	push   $0xa
c0002f2b:	68 00 02 00 00       	push   $0x200
c0002f30:	52                   	push   %edx
c0002f31:	6a 20                	push   $0x20
c0002f33:	50                   	push   %eax
c0002f34:	e8 e9 fa ff ff       	call   c0002a22 <rd_wt>
c0002f39:	83 c4 20             	add    $0x20,%esp
c0002f3c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f41:	89 c2                	mov    %eax,%edx
c0002f43:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002f46:	83 ec 0c             	sub    $0xc,%esp
c0002f49:	6a 07                	push   $0x7
c0002f4b:	68 00 02 00 00       	push   $0x200
c0002f50:	52                   	push   %edx
c0002f51:	6a 20                	push   $0x20
c0002f53:	50                   	push   %eax
c0002f54:	e8 c9 fa ff ff       	call   c0002a22 <rd_wt>
c0002f59:	83 c4 20             	add    $0x20,%esp
c0002f5c:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002f63:	00 00 00 
c0002f66:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002f6d:	2e 00 
c0002f6f:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002f74:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002f77:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f7a:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002f80:	83 ec 0c             	sub    $0xc,%esp
c0002f83:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002f89:	50                   	push   %eax
c0002f8a:	e8 fc 83 00 00       	call   c000b38b <Strlen>
c0002f8f:	83 c4 10             	add    $0x10,%esp
c0002f92:	89 c1                	mov    %eax,%ecx
c0002f94:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f97:	8d 50 04             	lea    0x4(%eax),%edx
c0002f9a:	83 ec 04             	sub    $0x4,%esp
c0002f9d:	51                   	push   %ecx
c0002f9e:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002fa4:	50                   	push   %eax
c0002fa5:	52                   	push   %edx
c0002fa6:	e8 79 83 00 00       	call   c000b324 <Memcpy>
c0002fab:	83 c4 10             	add    $0x10,%esp
c0002fae:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002fb4:	b8 00 00 00 00       	mov    $0x0,%eax
c0002fb9:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002fbe:	89 d7                	mov    %edx,%edi
c0002fc0:	f3 ab                	rep stos %eax,%es:(%edi)
c0002fc2:	c7 85 34 ff ff ff 28 	movl   $0xc000aa28,-0xcc(%ebp)
c0002fc9:	aa 00 c0 
c0002fcc:	c7 85 38 ff ff ff 31 	movl   $0xc000aa31,-0xc8(%ebp)
c0002fd3:	aa 00 c0 
c0002fd6:	c7 85 3c ff ff ff 3a 	movl   $0xc000aa3a,-0xc4(%ebp)
c0002fdd:	aa 00 c0 
c0002fe0:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002fe7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002fee:	eb 49                	jmp    c0003039 <mkfs+0x53d>
c0002ff0:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002ff4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002ff7:	8d 50 02             	lea    0x2(%eax),%edx
c0002ffa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002ffd:	89 10                	mov    %edx,(%eax)
c0002fff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003002:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0003009:	83 ec 0c             	sub    $0xc,%esp
c000300c:	50                   	push   %eax
c000300d:	e8 79 83 00 00       	call   c000b38b <Strlen>
c0003012:	83 c4 10             	add    $0x10,%esp
c0003015:	89 c1                	mov    %eax,%ecx
c0003017:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000301a:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0003021:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003024:	83 c2 04             	add    $0x4,%edx
c0003027:	83 ec 04             	sub    $0x4,%esp
c000302a:	51                   	push   %ecx
c000302b:	50                   	push   %eax
c000302c:	52                   	push   %edx
c000302d:	e8 f2 82 00 00       	call   c000b324 <Memcpy>
c0003032:	83 c4 10             	add    $0x10,%esp
c0003035:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003039:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000303c:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c000303f:	7c af                	jl     c0002ff0 <mkfs+0x4f4>
c0003041:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003048:	eb 66                	jmp    c00030b0 <mkfs+0x5b4>
c000304a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000304d:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003054:	83 ec 0c             	sub    $0xc,%esp
c0003057:	50                   	push   %eax
c0003058:	e8 2e 83 00 00       	call   c000b38b <Strlen>
c000305d:	83 c4 10             	add    $0x10,%esp
c0003060:	85 c0                	test   %eax,%eax
c0003062:	74 47                	je     c00030ab <mkfs+0x5af>
c0003064:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003068:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000306b:	8d 50 05             	lea    0x5(%eax),%edx
c000306e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003071:	89 10                	mov    %edx,(%eax)
c0003073:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003076:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000307d:	83 ec 0c             	sub    $0xc,%esp
c0003080:	50                   	push   %eax
c0003081:	e8 05 83 00 00       	call   c000b38b <Strlen>
c0003086:	83 c4 10             	add    $0x10,%esp
c0003089:	89 c1                	mov    %eax,%ecx
c000308b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000308e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003095:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003098:	83 c2 04             	add    $0x4,%edx
c000309b:	83 ec 04             	sub    $0x4,%esp
c000309e:	51                   	push   %ecx
c000309f:	50                   	push   %eax
c00030a0:	52                   	push   %edx
c00030a1:	e8 7e 82 00 00       	call   c000b324 <Memcpy>
c00030a6:	83 c4 10             	add    $0x10,%esp
c00030a9:	eb 01                	jmp    c00030ac <mkfs+0x5b0>
c00030ab:	90                   	nop
c00030ac:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00030b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00030b3:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c00030b6:	7c 92                	jl     c000304a <mkfs+0x54e>
c00030b8:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00030bd:	89 c2                	mov    %eax,%edx
c00030bf:	8b 45 98             	mov    -0x68(%ebp),%eax
c00030c2:	83 ec 0c             	sub    $0xc,%esp
c00030c5:	6a 0a                	push   $0xa
c00030c7:	68 00 02 00 00       	push   $0x200
c00030cc:	52                   	push   %edx
c00030cd:	6a 20                	push   $0x20
c00030cf:	50                   	push   %eax
c00030d0:	e8 4d f9 ff ff       	call   c0002a22 <rd_wt>
c00030d5:	83 c4 20             	add    $0x20,%esp
c00030d8:	90                   	nop
c00030d9:	8b 7d fc             	mov    -0x4(%ebp),%edi
c00030dc:	c9                   	leave  
c00030dd:	c3                   	ret    

c00030de <init_fs>:
c00030de:	55                   	push   %ebp
c00030df:	89 e5                	mov    %esp,%ebp
c00030e1:	83 ec 18             	sub    $0x18,%esp
c00030e4:	83 ec 0c             	sub    $0xc,%esp
c00030e7:	6a 6c                	push   $0x6c
c00030e9:	e8 db 3d 00 00       	call   c0006ec9 <sys_malloc>
c00030ee:	83 c4 10             	add    $0x10,%esp
c00030f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00030f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030f7:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c00030fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003101:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0003108:	83 ec 04             	sub    $0x4,%esp
c000310b:	6a 03                	push   $0x3
c000310d:	ff 75 f4             	pushl  -0xc(%ebp)
c0003110:	6a 03                	push   $0x3
c0003112:	e8 4c 69 00 00       	call   c0009a63 <send_rec>
c0003117:	83 c4 10             	add    $0x10,%esp
c000311a:	e8 dd f9 ff ff       	call   c0002afc <mkfs>
c000311f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003122:	83 ec 08             	sub    $0x8,%esp
c0003125:	6a 6c                	push   $0x6c
c0003127:	50                   	push   %eax
c0003128:	e8 7b 40 00 00       	call   c00071a8 <sys_free>
c000312d:	83 c4 10             	add    $0x10,%esp
c0003130:	90                   	nop
c0003131:	c9                   	leave  
c0003132:	c3                   	ret    

c0003133 <do_open>:
c0003133:	55                   	push   %ebp
c0003134:	89 e5                	mov    %esp,%ebp
c0003136:	83 ec 68             	sub    $0x68,%esp
c0003139:	83 ec 04             	sub    $0x4,%esp
c000313c:	6a 0c                	push   $0xc
c000313e:	6a 00                	push   $0x0
c0003140:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003143:	50                   	push   %eax
c0003144:	e8 09 82 00 00       	call   c000b352 <Memset>
c0003149:	83 c4 10             	add    $0x10,%esp
c000314c:	8b 45 08             	mov    0x8(%ebp),%eax
c000314f:	8b 40 34             	mov    0x34(%eax),%eax
c0003152:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003155:	83 ec 08             	sub    $0x8,%esp
c0003158:	6a 0c                	push   $0xc
c000315a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000315d:	e8 26 3c 00 00       	call   c0006d88 <alloc_virtual_memory>
c0003162:	83 c4 10             	add    $0x10,%esp
c0003165:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003168:	8b 45 08             	mov    0x8(%ebp),%eax
c000316b:	8b 40 30             	mov    0x30(%eax),%eax
c000316e:	89 c2                	mov    %eax,%edx
c0003170:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003173:	83 ec 04             	sub    $0x4,%esp
c0003176:	52                   	push   %edx
c0003177:	50                   	push   %eax
c0003178:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000317b:	50                   	push   %eax
c000317c:	e8 a3 81 00 00       	call   c000b324 <Memcpy>
c0003181:	83 c4 10             	add    $0x10,%esp
c0003184:	8b 45 08             	mov    0x8(%ebp),%eax
c0003187:	8b 40 30             	mov    0x30(%eax),%eax
c000318a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c000318f:	8b 45 08             	mov    0x8(%ebp),%eax
c0003192:	8b 40 64             	mov    0x64(%eax),%eax
c0003195:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003198:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c000319f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00031a6:	eb 1f                	jmp    c00031c7 <do_open+0x94>
c00031a8:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c00031ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00031b0:	83 c2 50             	add    $0x50,%edx
c00031b3:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00031b7:	85 c0                	test   %eax,%eax
c00031b9:	75 08                	jne    c00031c3 <do_open+0x90>
c00031bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00031be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00031c1:	eb 0a                	jmp    c00031cd <do_open+0x9a>
c00031c3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00031c7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00031cb:	7e db                	jle    c00031a8 <do_open+0x75>
c00031cd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c00031d1:	75 1c                	jne    c00031ef <do_open+0xbc>
c00031d3:	68 bd 01 00 00       	push   $0x1bd
c00031d8:	68 50 a9 00 c0       	push   $0xc000a950
c00031dd:	68 50 a9 00 c0       	push   $0xc000a950
c00031e2:	68 43 aa 00 c0       	push   $0xc000aa43
c00031e7:	e8 2c 60 00 00       	call   c0009218 <assertion_failure>
c00031ec:	83 c4 10             	add    $0x10,%esp
c00031ef:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c00031f6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00031fd:	eb 1d                	jmp    c000321c <do_open+0xe9>
c00031ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003202:	c1 e0 04             	shl    $0x4,%eax
c0003205:	05 88 23 01 c0       	add    $0xc0012388,%eax
c000320a:	8b 00                	mov    (%eax),%eax
c000320c:	85 c0                	test   %eax,%eax
c000320e:	75 08                	jne    c0003218 <do_open+0xe5>
c0003210:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003213:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003216:	eb 0a                	jmp    c0003222 <do_open+0xef>
c0003218:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000321c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0003220:	7e dd                	jle    c00031ff <do_open+0xcc>
c0003222:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0003226:	75 1c                	jne    c0003244 <do_open+0x111>
c0003228:	68 c9 01 00 00       	push   $0x1c9
c000322d:	68 50 a9 00 c0       	push   $0xc000a950
c0003232:	68 50 a9 00 c0       	push   $0xc000a950
c0003237:	68 4b aa 00 c0       	push   $0xc000aa4b
c000323c:	e8 d7 5f 00 00       	call   c0009218 <assertion_failure>
c0003241:	83 c4 10             	add    $0x10,%esp
c0003244:	83 ec 0c             	sub    $0xc,%esp
c0003247:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000324a:	50                   	push   %eax
c000324b:	e8 b2 00 00 00       	call   c0003302 <search_file>
c0003250:	83 c4 10             	add    $0x10,%esp
c0003253:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003256:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000325a:	75 2b                	jne    c0003287 <do_open+0x154>
c000325c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0003260:	7e 10                	jle    c0003272 <do_open+0x13f>
c0003262:	83 ec 0c             	sub    $0xc,%esp
c0003265:	68 53 aa 00 c0       	push   $0xc000aa53
c000326a:	e8 8b 5f 00 00       	call   c00091fa <panic>
c000326f:	83 c4 10             	add    $0x10,%esp
c0003272:	83 ec 08             	sub    $0x8,%esp
c0003275:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003278:	50                   	push   %eax
c0003279:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000327c:	50                   	push   %eax
c000327d:	e8 40 04 00 00       	call   c00036c2 <create_file>
c0003282:	83 c4 10             	add    $0x10,%esp
c0003285:	eb 22                	jmp    c00032a9 <do_open+0x176>
c0003287:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c000328b:	75 07                	jne    c0003294 <do_open+0x161>
c000328d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003292:	eb 6c                	jmp    c0003300 <do_open+0x1cd>
c0003294:	83 ec 08             	sub    $0x8,%esp
c0003297:	ff 75 d8             	pushl  -0x28(%ebp)
c000329a:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000329d:	50                   	push   %eax
c000329e:	e8 5d 02 00 00       	call   c0003500 <get_inode>
c00032a3:	83 c4 10             	add    $0x10,%esp
c00032a6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00032a9:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c00032ae:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00032b1:	c1 e2 04             	shl    $0x4,%edx
c00032b4:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c00032ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00032bd:	83 c2 50             	add    $0x50,%edx
c00032c0:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
c00032c4:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00032c7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00032ca:	c1 e2 04             	shl    $0x4,%edx
c00032cd:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c00032d3:	89 02                	mov    %eax,(%edx)
c00032d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032d8:	c1 e0 04             	shl    $0x4,%eax
c00032db:	05 84 23 01 c0       	add    $0xc0012384,%eax
c00032e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00032e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032e9:	c1 e0 04             	shl    $0x4,%eax
c00032ec:	05 80 23 01 c0       	add    $0xc0012380,%eax
c00032f1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00032f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032fa:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00032fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003300:	c9                   	leave  
c0003301:	c3                   	ret    

c0003302 <search_file>:
c0003302:	55                   	push   %ebp
c0003303:	89 e5                	mov    %esp,%ebp
c0003305:	83 ec 68             	sub    $0x68,%esp
c0003308:	83 ec 04             	sub    $0x4,%esp
c000330b:	6a 0c                	push   $0xc
c000330d:	6a 00                	push   $0x0
c000330f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003312:	50                   	push   %eax
c0003313:	e8 3a 80 00 00       	call   c000b352 <Memset>
c0003318:	83 c4 10             	add    $0x10,%esp
c000331b:	83 ec 04             	sub    $0x4,%esp
c000331e:	6a 28                	push   $0x28
c0003320:	6a 00                	push   $0x0
c0003322:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003325:	50                   	push   %eax
c0003326:	e8 27 80 00 00       	call   c000b352 <Memset>
c000332b:	83 c4 10             	add    $0x10,%esp
c000332e:	83 ec 04             	sub    $0x4,%esp
c0003331:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003334:	50                   	push   %eax
c0003335:	ff 75 08             	pushl  0x8(%ebp)
c0003338:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000333b:	50                   	push   %eax
c000333c:	e8 f3 00 00 00       	call   c0003434 <strip_path>
c0003341:	83 c4 10             	add    $0x10,%esp
c0003344:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003347:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c000334b:	75 0a                	jne    c0003357 <search_file+0x55>
c000334d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003352:	e9 db 00 00 00       	jmp    c0003432 <search_file+0x130>
c0003357:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000335a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000335d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003360:	05 00 02 00 00       	add    $0x200,%eax
c0003365:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000336b:	85 c0                	test   %eax,%eax
c000336d:	0f 48 c2             	cmovs  %edx,%eax
c0003370:	c1 f8 09             	sar    $0x9,%eax
c0003373:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003376:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003379:	c1 e8 04             	shr    $0x4,%eax
c000337c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000337f:	e8 63 14 00 00       	call   c00047e7 <get_super_block>
c0003384:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003387:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000338a:	8b 00                	mov    (%eax),%eax
c000338c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000338f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0003396:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000339d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00033a4:	eb 7b                	jmp    c0003421 <search_file+0x11f>
c00033a6:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00033ab:	89 c1                	mov    %eax,%ecx
c00033ad:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00033b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00033b3:	01 d0                	add    %edx,%eax
c00033b5:	83 ec 0c             	sub    $0xc,%esp
c00033b8:	6a 07                	push   $0x7
c00033ba:	68 00 02 00 00       	push   $0x200
c00033bf:	51                   	push   %ecx
c00033c0:	ff 75 cc             	pushl  -0x34(%ebp)
c00033c3:	50                   	push   %eax
c00033c4:	e8 59 f6 ff ff       	call   c0002a22 <rd_wt>
c00033c9:	83 c4 20             	add    $0x20,%esp
c00033cc:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00033d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00033d4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00033db:	eb 35                	jmp    c0003412 <search_file+0x110>
c00033dd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00033e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00033e4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00033e7:	7f 33                	jg     c000341c <search_file+0x11a>
c00033e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00033ec:	83 c0 04             	add    $0x4,%eax
c00033ef:	83 ec 08             	sub    $0x8,%esp
c00033f2:	50                   	push   %eax
c00033f3:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00033f6:	50                   	push   %eax
c00033f7:	e8 c3 69 00 00       	call   c0009dbf <strcmp>
c00033fc:	83 c4 10             	add    $0x10,%esp
c00033ff:	85 c0                	test   %eax,%eax
c0003401:	75 07                	jne    c000340a <search_file+0x108>
c0003403:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003406:	8b 00                	mov    (%eax),%eax
c0003408:	eb 28                	jmp    c0003432 <search_file+0x130>
c000340a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000340e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0003412:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003415:	83 f8 1f             	cmp    $0x1f,%eax
c0003418:	76 c3                	jbe    c00033dd <search_file+0xdb>
c000341a:	eb 01                	jmp    c000341d <search_file+0x11b>
c000341c:	90                   	nop
c000341d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003421:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003424:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0003427:	0f 8c 79 ff ff ff    	jl     c00033a6 <search_file+0xa4>
c000342d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003432:	c9                   	leave  
c0003433:	c3                   	ret    

c0003434 <strip_path>:
c0003434:	55                   	push   %ebp
c0003435:	89 e5                	mov    %esp,%ebp
c0003437:	83 ec 10             	sub    $0x10,%esp
c000343a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000343e:	75 0a                	jne    c000344a <strip_path+0x16>
c0003440:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003445:	e9 b4 00 00 00       	jmp    c00034fe <strip_path+0xca>
c000344a:	8b 45 08             	mov    0x8(%ebp),%eax
c000344d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003450:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003453:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003456:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003459:	0f b6 00             	movzbl (%eax),%eax
c000345c:	3c 2f                	cmp    $0x2f,%al
c000345e:	75 2d                	jne    c000348d <strip_path+0x59>
c0003460:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003464:	eb 27                	jmp    c000348d <strip_path+0x59>
c0003466:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003469:	0f b6 00             	movzbl (%eax),%eax
c000346c:	3c 2f                	cmp    $0x2f,%al
c000346e:	75 0a                	jne    c000347a <strip_path+0x46>
c0003470:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003475:	e9 84 00 00 00       	jmp    c00034fe <strip_path+0xca>
c000347a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000347d:	0f b6 10             	movzbl (%eax),%edx
c0003480:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003483:	88 10                	mov    %dl,(%eax)
c0003485:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003489:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000348d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003490:	0f b6 00             	movzbl (%eax),%eax
c0003493:	84 c0                	test   %al,%al
c0003495:	75 cf                	jne    c0003466 <strip_path+0x32>
c0003497:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000349a:	c6 00 00             	movb   $0x0,(%eax)
c000349d:	8b 45 10             	mov    0x10(%ebp),%eax
c00034a0:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c00034a6:	89 10                	mov    %edx,(%eax)
c00034a8:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00034ae:	89 50 04             	mov    %edx,0x4(%eax)
c00034b1:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c00034b7:	89 50 08             	mov    %edx,0x8(%eax)
c00034ba:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c00034c0:	89 50 0c             	mov    %edx,0xc(%eax)
c00034c3:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c00034c9:	89 50 10             	mov    %edx,0x10(%eax)
c00034cc:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c00034d2:	89 50 14             	mov    %edx,0x14(%eax)
c00034d5:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c00034db:	89 50 18             	mov    %edx,0x18(%eax)
c00034de:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c00034e4:	89 50 1c             	mov    %edx,0x1c(%eax)
c00034e7:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c00034ed:	89 50 20             	mov    %edx,0x20(%eax)
c00034f0:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c00034f6:	89 50 24             	mov    %edx,0x24(%eax)
c00034f9:	b8 00 00 00 00       	mov    $0x0,%eax
c00034fe:	c9                   	leave  
c00034ff:	c3                   	ret    

c0003500 <get_inode>:
c0003500:	55                   	push   %ebp
c0003501:	89 e5                	mov    %esp,%ebp
c0003503:	56                   	push   %esi
c0003504:	53                   	push   %ebx
c0003505:	83 ec 20             	sub    $0x20,%esp
c0003508:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000350c:	75 0a                	jne    c0003518 <get_inode+0x18>
c000350e:	b8 00 00 00 00       	mov    $0x0,%eax
c0003513:	e9 a3 01 00 00       	jmp    c00036bb <get_inode+0x1bb>
c0003518:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000351f:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c0003526:	eb 69                	jmp    c0003591 <get_inode+0x91>
c0003528:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000352b:	8b 40 24             	mov    0x24(%eax),%eax
c000352e:	85 c0                	test   %eax,%eax
c0003530:	7e 53                	jle    c0003585 <get_inode+0x85>
c0003532:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003535:	8b 40 10             	mov    0x10(%eax),%eax
c0003538:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000353b:	75 50                	jne    c000358d <get_inode+0x8d>
c000353d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003540:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003543:	8b 0a                	mov    (%edx),%ecx
c0003545:	89 08                	mov    %ecx,(%eax)
c0003547:	8b 4a 04             	mov    0x4(%edx),%ecx
c000354a:	89 48 04             	mov    %ecx,0x4(%eax)
c000354d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003550:	89 48 08             	mov    %ecx,0x8(%eax)
c0003553:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003556:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003559:	8b 4a 10             	mov    0x10(%edx),%ecx
c000355c:	89 48 10             	mov    %ecx,0x10(%eax)
c000355f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003562:	89 48 14             	mov    %ecx,0x14(%eax)
c0003565:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003568:	89 48 18             	mov    %ecx,0x18(%eax)
c000356b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000356e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003571:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003574:	89 48 20             	mov    %ecx,0x20(%eax)
c0003577:	8b 52 24             	mov    0x24(%edx),%edx
c000357a:	89 50 24             	mov    %edx,0x24(%eax)
c000357d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003580:	e9 36 01 00 00       	jmp    c00036bb <get_inode+0x1bb>
c0003585:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003588:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000358b:	eb 0d                	jmp    c000359a <get_inode+0x9a>
c000358d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003591:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c0003598:	76 8e                	jbe    c0003528 <get_inode+0x28>
c000359a:	e8 48 12 00 00       	call   c00047e7 <get_super_block>
c000359f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00035a2:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00035a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035ac:	8b 40 04             	mov    0x4(%eax),%eax
c00035af:	8d 50 02             	lea    0x2(%eax),%edx
c00035b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035b5:	8b 40 08             	mov    0x8(%eax),%eax
c00035b8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c00035bb:	8b 45 0c             	mov    0xc(%ebp),%eax
c00035be:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00035c1:	b8 00 02 00 00       	mov    $0x200,%eax
c00035c6:	99                   	cltd   
c00035c7:	f7 7d e8             	idivl  -0x18(%ebp)
c00035ca:	89 c6                	mov    %eax,%esi
c00035cc:	89 c8                	mov    %ecx,%eax
c00035ce:	99                   	cltd   
c00035cf:	f7 fe                	idiv   %esi
c00035d1:	01 d8                	add    %ebx,%eax
c00035d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00035d6:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c00035dd:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00035e2:	83 ec 0c             	sub    $0xc,%esp
c00035e5:	6a 07                	push   $0x7
c00035e7:	68 00 02 00 00       	push   $0x200
c00035ec:	50                   	push   %eax
c00035ed:	ff 75 e0             	pushl  -0x20(%ebp)
c00035f0:	ff 75 e4             	pushl  -0x1c(%ebp)
c00035f3:	e8 2a f4 ff ff       	call   c0002a22 <rd_wt>
c00035f8:	83 c4 20             	add    $0x20,%esp
c00035fb:	8b 45 0c             	mov    0xc(%ebp),%eax
c00035fe:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003601:	b8 00 02 00 00       	mov    $0x200,%eax
c0003606:	99                   	cltd   
c0003607:	f7 7d e8             	idivl  -0x18(%ebp)
c000360a:	89 c3                	mov    %eax,%ebx
c000360c:	89 c8                	mov    %ecx,%eax
c000360e:	99                   	cltd   
c000360f:	f7 fb                	idiv   %ebx
c0003611:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0003614:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000361a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000361d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0003621:	01 d0                	add    %edx,%eax
c0003623:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003626:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003629:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000362c:	8b 0a                	mov    (%edx),%ecx
c000362e:	89 08                	mov    %ecx,(%eax)
c0003630:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003633:	89 48 04             	mov    %ecx,0x4(%eax)
c0003636:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003639:	89 48 08             	mov    %ecx,0x8(%eax)
c000363c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000363f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003642:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003645:	89 48 10             	mov    %ecx,0x10(%eax)
c0003648:	8b 4a 14             	mov    0x14(%edx),%ecx
c000364b:	89 48 14             	mov    %ecx,0x14(%eax)
c000364e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003651:	89 48 18             	mov    %ecx,0x18(%eax)
c0003654:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003657:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000365a:	8b 4a 20             	mov    0x20(%edx),%ecx
c000365d:	89 48 20             	mov    %ecx,0x20(%eax)
c0003660:	8b 52 24             	mov    0x24(%edx),%edx
c0003663:	89 50 24             	mov    %edx,0x24(%eax)
c0003666:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003669:	8b 55 0c             	mov    0xc(%ebp),%edx
c000366c:	89 50 10             	mov    %edx,0x10(%eax)
c000366f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003672:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003675:	89 50 20             	mov    %edx,0x20(%eax)
c0003678:	8b 45 08             	mov    0x8(%ebp),%eax
c000367b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000367e:	8b 0a                	mov    (%edx),%ecx
c0003680:	89 08                	mov    %ecx,(%eax)
c0003682:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003685:	89 48 04             	mov    %ecx,0x4(%eax)
c0003688:	8b 4a 08             	mov    0x8(%edx),%ecx
c000368b:	89 48 08             	mov    %ecx,0x8(%eax)
c000368e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003691:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003694:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003697:	89 48 10             	mov    %ecx,0x10(%eax)
c000369a:	8b 4a 14             	mov    0x14(%edx),%ecx
c000369d:	89 48 14             	mov    %ecx,0x14(%eax)
c00036a0:	8b 4a 18             	mov    0x18(%edx),%ecx
c00036a3:	89 48 18             	mov    %ecx,0x18(%eax)
c00036a6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00036a9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00036ac:	8b 4a 20             	mov    0x20(%edx),%ecx
c00036af:	89 48 20             	mov    %ecx,0x20(%eax)
c00036b2:	8b 52 24             	mov    0x24(%edx),%edx
c00036b5:	89 50 24             	mov    %edx,0x24(%eax)
c00036b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00036bb:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00036be:	5b                   	pop    %ebx
c00036bf:	5e                   	pop    %esi
c00036c0:	5d                   	pop    %ebp
c00036c1:	c3                   	ret    

c00036c2 <create_file>:
c00036c2:	55                   	push   %ebp
c00036c3:	89 e5                	mov    %esp,%ebp
c00036c5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00036cb:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00036ce:	50                   	push   %eax
c00036cf:	ff 75 0c             	pushl  0xc(%ebp)
c00036d2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00036d5:	50                   	push   %eax
c00036d6:	e8 59 fd ff ff       	call   c0003434 <strip_path>
c00036db:	83 c4 0c             	add    $0xc,%esp
c00036de:	83 f8 ff             	cmp    $0xffffffff,%eax
c00036e1:	75 0a                	jne    c00036ed <create_file+0x2b>
c00036e3:	b8 00 00 00 00       	mov    $0x0,%eax
c00036e8:	e9 de 00 00 00       	jmp    c00037cb <create_file+0x109>
c00036ed:	e8 db 00 00 00       	call   c00037cd <alloc_imap_bit>
c00036f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00036f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00036f9:	75 0a                	jne    c0003705 <create_file+0x43>
c00036fb:	b8 00 00 00 00       	mov    $0x0,%eax
c0003700:	e9 c6 00 00 00       	jmp    c00037cb <create_file+0x109>
c0003705:	e8 dd 10 00 00       	call   c00047e7 <get_super_block>
c000370a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000370d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003710:	8b 40 10             	mov    0x10(%eax),%eax
c0003713:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003716:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003719:	83 ec 08             	sub    $0x8,%esp
c000371c:	50                   	push   %eax
c000371d:	ff 75 f4             	pushl  -0xc(%ebp)
c0003720:	e8 a5 01 00 00       	call   c00038ca <alloc_smap_bit>
c0003725:	83 c4 10             	add    $0x10,%esp
c0003728:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000372b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000372f:	75 0a                	jne    c000373b <create_file+0x79>
c0003731:	b8 00 00 00 00       	mov    $0x0,%eax
c0003736:	e9 90 00 00 00       	jmp    c00037cb <create_file+0x109>
c000373b:	83 ec 04             	sub    $0x4,%esp
c000373e:	ff 75 e8             	pushl  -0x18(%ebp)
c0003741:	ff 75 f4             	pushl  -0xc(%ebp)
c0003744:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003747:	50                   	push   %eax
c0003748:	e8 1e 03 00 00       	call   c0003a6b <new_inode>
c000374d:	83 c4 10             	add    $0x10,%esp
c0003750:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003753:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003757:	75 07                	jne    c0003760 <create_file+0x9e>
c0003759:	b8 00 00 00 00       	mov    $0x0,%eax
c000375e:	eb 6b                	jmp    c00037cb <create_file+0x109>
c0003760:	ff 75 f4             	pushl  -0xc(%ebp)
c0003763:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003766:	50                   	push   %eax
c0003767:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000376a:	50                   	push   %eax
c000376b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003771:	50                   	push   %eax
c0003772:	e8 12 04 00 00       	call   c0003b89 <new_dir_entry>
c0003777:	83 c4 10             	add    $0x10,%esp
c000377a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000377d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003781:	75 07                	jne    c000378a <create_file+0xc8>
c0003783:	b8 00 00 00 00       	mov    $0x0,%eax
c0003788:	eb 41                	jmp    c00037cb <create_file+0x109>
c000378a:	8b 45 08             	mov    0x8(%ebp),%eax
c000378d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c0003790:	89 10                	mov    %edx,(%eax)
c0003792:	8b 55 88             	mov    -0x78(%ebp),%edx
c0003795:	89 50 04             	mov    %edx,0x4(%eax)
c0003798:	8b 55 8c             	mov    -0x74(%ebp),%edx
c000379b:	89 50 08             	mov    %edx,0x8(%eax)
c000379e:	8b 55 90             	mov    -0x70(%ebp),%edx
c00037a1:	89 50 0c             	mov    %edx,0xc(%eax)
c00037a4:	8b 55 94             	mov    -0x6c(%ebp),%edx
c00037a7:	89 50 10             	mov    %edx,0x10(%eax)
c00037aa:	8b 55 98             	mov    -0x68(%ebp),%edx
c00037ad:	89 50 14             	mov    %edx,0x14(%eax)
c00037b0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00037b3:	89 50 18             	mov    %edx,0x18(%eax)
c00037b6:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00037b9:	89 50 1c             	mov    %edx,0x1c(%eax)
c00037bc:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c00037bf:	89 50 20             	mov    %edx,0x20(%eax)
c00037c2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c00037c5:	89 50 24             	mov    %edx,0x24(%eax)
c00037c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00037cb:	c9                   	leave  
c00037cc:	c3                   	ret    

c00037cd <alloc_imap_bit>:
c00037cd:	55                   	push   %ebp
c00037ce:	89 e5                	mov    %esp,%ebp
c00037d0:	53                   	push   %ebx
c00037d1:	83 ec 24             	sub    $0x24,%esp
c00037d4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00037db:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00037e2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00037e7:	83 ec 0c             	sub    $0xc,%esp
c00037ea:	6a 07                	push   $0x7
c00037ec:	68 00 02 00 00       	push   $0x200
c00037f1:	50                   	push   %eax
c00037f2:	ff 75 e8             	pushl  -0x18(%ebp)
c00037f5:	ff 75 ec             	pushl  -0x14(%ebp)
c00037f8:	e8 25 f2 ff ff       	call   c0002a22 <rd_wt>
c00037fd:	83 c4 20             	add    $0x20,%esp
c0003800:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003807:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000380e:	e9 a5 00 00 00       	jmp    c00038b8 <alloc_imap_bit+0xeb>
c0003813:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000381a:	e9 8b 00 00 00       	jmp    c00038aa <alloc_imap_bit+0xdd>
c000381f:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003825:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003828:	01 d0                	add    %edx,%eax
c000382a:	0f b6 00             	movzbl (%eax),%eax
c000382d:	0f be d0             	movsbl %al,%edx
c0003830:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003833:	89 c1                	mov    %eax,%ecx
c0003835:	d3 fa                	sar    %cl,%edx
c0003837:	89 d0                	mov    %edx,%eax
c0003839:	83 e0 01             	and    $0x1,%eax
c000383c:	85 c0                	test   %eax,%eax
c000383e:	74 06                	je     c0003846 <alloc_imap_bit+0x79>
c0003840:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003844:	eb 64                	jmp    c00038aa <alloc_imap_bit+0xdd>
c0003846:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000384c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000384f:	01 d0                	add    %edx,%eax
c0003851:	0f b6 18             	movzbl (%eax),%ebx
c0003854:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003857:	ba 01 00 00 00       	mov    $0x1,%edx
c000385c:	89 c1                	mov    %eax,%ecx
c000385e:	d3 e2                	shl    %cl,%edx
c0003860:	89 d0                	mov    %edx,%eax
c0003862:	89 c1                	mov    %eax,%ecx
c0003864:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000386a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000386d:	01 d0                	add    %edx,%eax
c000386f:	09 cb                	or     %ecx,%ebx
c0003871:	89 da                	mov    %ebx,%edx
c0003873:	88 10                	mov    %dl,(%eax)
c0003875:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003878:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000387f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003882:	01 d0                	add    %edx,%eax
c0003884:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003887:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000388c:	83 ec 0c             	sub    $0xc,%esp
c000388f:	6a 0a                	push   $0xa
c0003891:	68 00 02 00 00       	push   $0x200
c0003896:	50                   	push   %eax
c0003897:	ff 75 e8             	pushl  -0x18(%ebp)
c000389a:	ff 75 ec             	pushl  -0x14(%ebp)
c000389d:	e8 80 f1 ff ff       	call   c0002a22 <rd_wt>
c00038a2:	83 c4 20             	add    $0x20,%esp
c00038a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00038a8:	eb 1b                	jmp    c00038c5 <alloc_imap_bit+0xf8>
c00038aa:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c00038ae:	0f 8e 6b ff ff ff    	jle    c000381f <alloc_imap_bit+0x52>
c00038b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00038b8:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c00038bf:	0f 8e 4e ff ff ff    	jle    c0003813 <alloc_imap_bit+0x46>
c00038c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00038c8:	c9                   	leave  
c00038c9:	c3                   	ret    

c00038ca <alloc_smap_bit>:
c00038ca:	55                   	push   %ebp
c00038cb:	89 e5                	mov    %esp,%ebp
c00038cd:	53                   	push   %ebx
c00038ce:	83 ec 34             	sub    $0x34,%esp
c00038d1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00038d5:	75 1c                	jne    c00038f3 <alloc_smap_bit+0x29>
c00038d7:	68 f3 02 00 00       	push   $0x2f3
c00038dc:	68 50 a9 00 c0       	push   $0xc000a950
c00038e1:	68 50 a9 00 c0       	push   $0xc000a950
c00038e6:	68 60 aa 00 c0       	push   $0xc000aa60
c00038eb:	e8 28 59 00 00       	call   c0009218 <assertion_failure>
c00038f0:	83 c4 10             	add    $0x10,%esp
c00038f3:	e8 ef 0e 00 00       	call   c00047e7 <get_super_block>
c00038f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00038fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00038fe:	8b 40 08             	mov    0x8(%eax),%eax
c0003901:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003904:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003907:	8b 40 04             	mov    0x4(%eax),%eax
c000390a:	83 c0 02             	add    $0x2,%eax
c000390d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003917:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c000391e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003925:	e9 20 01 00 00       	jmp    c0003a4a <alloc_smap_bit+0x180>
c000392a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000392d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003930:	01 d0                	add    %edx,%eax
c0003932:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003935:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000393a:	83 ec 0c             	sub    $0xc,%esp
c000393d:	6a 07                	push   $0x7
c000393f:	68 00 02 00 00       	push   $0x200
c0003944:	50                   	push   %eax
c0003945:	ff 75 d8             	pushl  -0x28(%ebp)
c0003948:	ff 75 d4             	pushl  -0x2c(%ebp)
c000394b:	e8 d2 f0 ff ff       	call   c0002a22 <rd_wt>
c0003950:	83 c4 20             	add    $0x20,%esp
c0003953:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000395a:	e9 b0 00 00 00       	jmp    c0003a0f <alloc_smap_bit+0x145>
c000395f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003966:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000396a:	0f 85 8c 00 00 00    	jne    c00039fc <alloc_smap_bit+0x132>
c0003970:	eb 45                	jmp    c00039b7 <alloc_smap_bit+0xed>
c0003972:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003978:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000397b:	01 d0                	add    %edx,%eax
c000397d:	0f b6 00             	movzbl (%eax),%eax
c0003980:	0f be d0             	movsbl %al,%edx
c0003983:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003986:	89 c1                	mov    %eax,%ecx
c0003988:	d3 fa                	sar    %cl,%edx
c000398a:	89 d0                	mov    %edx,%eax
c000398c:	83 e0 01             	and    $0x1,%eax
c000398f:	85 c0                	test   %eax,%eax
c0003991:	74 06                	je     c0003999 <alloc_smap_bit+0xcf>
c0003993:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003997:	eb 1e                	jmp    c00039b7 <alloc_smap_bit+0xed>
c0003999:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000399c:	c1 e0 09             	shl    $0x9,%eax
c000399f:	89 c2                	mov    %eax,%edx
c00039a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039a4:	01 d0                	add    %edx,%eax
c00039a6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00039ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00039b0:	01 d0                	add    %edx,%eax
c00039b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00039b5:	eb 06                	jmp    c00039bd <alloc_smap_bit+0xf3>
c00039b7:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00039bb:	7e b5                	jle    c0003972 <alloc_smap_bit+0xa8>
c00039bd:	eb 3d                	jmp    c00039fc <alloc_smap_bit+0x132>
c00039bf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00039c3:	74 45                	je     c0003a0a <alloc_smap_bit+0x140>
c00039c5:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039ce:	01 d0                	add    %edx,%eax
c00039d0:	0f b6 18             	movzbl (%eax),%ebx
c00039d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00039d6:	ba 01 00 00 00       	mov    $0x1,%edx
c00039db:	89 c1                	mov    %eax,%ecx
c00039dd:	d3 e2                	shl    %cl,%edx
c00039df:	89 d0                	mov    %edx,%eax
c00039e1:	89 c1                	mov    %eax,%ecx
c00039e3:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039ec:	01 d0                	add    %edx,%eax
c00039ee:	09 cb                	or     %ecx,%ebx
c00039f0:	89 da                	mov    %ebx,%edx
c00039f2:	88 10                	mov    %dl,(%eax)
c00039f4:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00039f8:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00039fc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a00:	74 09                	je     c0003a0b <alloc_smap_bit+0x141>
c0003a02:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003a06:	7e b7                	jle    c00039bf <alloc_smap_bit+0xf5>
c0003a08:	eb 01                	jmp    c0003a0b <alloc_smap_bit+0x141>
c0003a0a:	90                   	nop
c0003a0b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003a0f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003a16:	0f 8e 43 ff ff ff    	jle    c000395f <alloc_smap_bit+0x95>
c0003a1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003a20:	74 1e                	je     c0003a40 <alloc_smap_bit+0x176>
c0003a22:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003a27:	83 ec 0c             	sub    $0xc,%esp
c0003a2a:	6a 0a                	push   $0xa
c0003a2c:	68 00 02 00 00       	push   $0x200
c0003a31:	50                   	push   %eax
c0003a32:	ff 75 d8             	pushl  -0x28(%ebp)
c0003a35:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003a38:	e8 e5 ef ff ff       	call   c0002a22 <rd_wt>
c0003a3d:	83 c4 20             	add    $0x20,%esp
c0003a40:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a44:	74 12                	je     c0003a58 <alloc_smap_bit+0x18e>
c0003a46:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003a4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a4d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003a50:	0f 8c d4 fe ff ff    	jl     c000392a <alloc_smap_bit+0x60>
c0003a56:	eb 01                	jmp    c0003a59 <alloc_smap_bit+0x18f>
c0003a58:	90                   	nop
c0003a59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a5c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003a5f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a62:	8b 00                	mov    (%eax),%eax
c0003a64:	01 d0                	add    %edx,%eax
c0003a66:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003a69:	c9                   	leave  
c0003a6a:	c3                   	ret    

c0003a6b <new_inode>:
c0003a6b:	55                   	push   %ebp
c0003a6c:	89 e5                	mov    %esp,%ebp
c0003a6e:	83 ec 38             	sub    $0x38,%esp
c0003a71:	83 ec 08             	sub    $0x8,%esp
c0003a74:	ff 75 0c             	pushl  0xc(%ebp)
c0003a77:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003a7a:	50                   	push   %eax
c0003a7b:	e8 80 fa ff ff       	call   c0003500 <get_inode>
c0003a80:	83 c4 10             	add    $0x10,%esp
c0003a83:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a86:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003a8a:	75 0a                	jne    c0003a96 <new_inode+0x2b>
c0003a8c:	b8 00 00 00 00       	mov    $0x0,%eax
c0003a91:	e9 f1 00 00 00       	jmp    c0003b87 <new_inode+0x11c>
c0003a96:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a99:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003a9c:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003aa3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003aaa:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003ab1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ab4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003ab7:	83 ec 0c             	sub    $0xc,%esp
c0003aba:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003abd:	50                   	push   %eax
c0003abe:	e8 40 0b 00 00       	call   c0004603 <sync_inode>
c0003ac3:	83 c4 10             	add    $0x10,%esp
c0003ac6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003acd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003ad4:	eb 1d                	jmp    c0003af3 <new_inode+0x88>
c0003ad6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003ad9:	89 d0                	mov    %edx,%eax
c0003adb:	c1 e0 02             	shl    $0x2,%eax
c0003ade:	01 d0                	add    %edx,%eax
c0003ae0:	c1 e0 03             	shl    $0x3,%eax
c0003ae3:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003ae8:	8b 00                	mov    (%eax),%eax
c0003aea:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003aed:	74 0c                	je     c0003afb <new_inode+0x90>
c0003aef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003af3:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003af7:	7e dd                	jle    c0003ad6 <new_inode+0x6b>
c0003af9:	eb 01                	jmp    c0003afc <new_inode+0x91>
c0003afb:	90                   	nop
c0003afc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003aff:	89 d0                	mov    %edx,%eax
c0003b01:	c1 e0 02             	shl    $0x2,%eax
c0003b04:	01 d0                	add    %edx,%eax
c0003b06:	c1 e0 03             	shl    $0x3,%eax
c0003b09:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003b0e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003b11:	89 10                	mov    %edx,(%eax)
c0003b13:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003b16:	89 50 04             	mov    %edx,0x4(%eax)
c0003b19:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003b1c:	89 50 08             	mov    %edx,0x8(%eax)
c0003b1f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003b22:	89 50 0c             	mov    %edx,0xc(%eax)
c0003b25:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003b28:	89 50 10             	mov    %edx,0x10(%eax)
c0003b2b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003b2e:	89 50 14             	mov    %edx,0x14(%eax)
c0003b31:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003b34:	89 50 18             	mov    %edx,0x18(%eax)
c0003b37:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003b3a:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003b3d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003b40:	89 50 20             	mov    %edx,0x20(%eax)
c0003b43:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003b46:	89 50 24             	mov    %edx,0x24(%eax)
c0003b49:	8b 45 08             	mov    0x8(%ebp),%eax
c0003b4c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003b4f:	89 10                	mov    %edx,(%eax)
c0003b51:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003b54:	89 50 04             	mov    %edx,0x4(%eax)
c0003b57:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003b5a:	89 50 08             	mov    %edx,0x8(%eax)
c0003b5d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003b60:	89 50 0c             	mov    %edx,0xc(%eax)
c0003b63:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003b66:	89 50 10             	mov    %edx,0x10(%eax)
c0003b69:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003b6c:	89 50 14             	mov    %edx,0x14(%eax)
c0003b6f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003b72:	89 50 18             	mov    %edx,0x18(%eax)
c0003b75:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003b78:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003b7b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003b7e:	89 50 20             	mov    %edx,0x20(%eax)
c0003b81:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003b84:	89 50 24             	mov    %edx,0x24(%eax)
c0003b87:	c9                   	leave  
c0003b88:	c3                   	ret    

c0003b89 <new_dir_entry>:
c0003b89:	55                   	push   %ebp
c0003b8a:	89 e5                	mov    %esp,%ebp
c0003b8c:	83 ec 48             	sub    $0x48,%esp
c0003b8f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003b96:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b99:	8b 40 04             	mov    0x4(%eax),%eax
c0003b9c:	99                   	cltd   
c0003b9d:	f7 7d dc             	idivl  -0x24(%ebp)
c0003ba0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003ba3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ba6:	8b 40 0c             	mov    0xc(%eax),%eax
c0003ba9:	99                   	cltd   
c0003baa:	f7 7d dc             	idivl  -0x24(%ebp)
c0003bad:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003bb0:	e8 32 0c 00 00       	call   c00047e7 <get_super_block>
c0003bb5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003bb8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003bbb:	8b 00                	mov    (%eax),%eax
c0003bbd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003bc0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003bc3:	8b 40 0c             	mov    0xc(%eax),%eax
c0003bc6:	05 00 02 00 00       	add    $0x200,%eax
c0003bcb:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003bd1:	85 c0                	test   %eax,%eax
c0003bd3:	0f 48 c2             	cmovs  %edx,%eax
c0003bd6:	c1 f8 09             	sar    $0x9,%eax
c0003bd9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003bdc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003be3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003bea:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003bf1:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003bf8:	eb 7f                	jmp    c0003c79 <new_dir_entry+0xf0>
c0003bfa:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003bff:	89 c1                	mov    %eax,%ecx
c0003c01:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003c04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003c07:	01 d0                	add    %edx,%eax
c0003c09:	83 ec 0c             	sub    $0xc,%esp
c0003c0c:	6a 07                	push   $0x7
c0003c0e:	68 00 02 00 00       	push   $0x200
c0003c13:	51                   	push   %ecx
c0003c14:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003c17:	50                   	push   %eax
c0003c18:	e8 05 ee ff ff       	call   c0002a22 <rd_wt>
c0003c1d:	83 c4 20             	add    $0x20,%esp
c0003c20:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003c25:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003c28:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003c2f:	eb 25                	jmp    c0003c56 <new_dir_entry+0xcd>
c0003c31:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003c35:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003c38:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003c3b:	7f 29                	jg     c0003c66 <new_dir_entry+0xdd>
c0003c3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c40:	8b 00                	mov    (%eax),%eax
c0003c42:	85 c0                	test   %eax,%eax
c0003c44:	75 08                	jne    c0003c4e <new_dir_entry+0xc5>
c0003c46:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c49:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003c4c:	eb 19                	jmp    c0003c67 <new_dir_entry+0xde>
c0003c4e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003c52:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003c56:	b8 00 02 00 00       	mov    $0x200,%eax
c0003c5b:	99                   	cltd   
c0003c5c:	f7 7d dc             	idivl  -0x24(%ebp)
c0003c5f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003c62:	7c cd                	jl     c0003c31 <new_dir_entry+0xa8>
c0003c64:	eb 01                	jmp    c0003c67 <new_dir_entry+0xde>
c0003c66:	90                   	nop
c0003c67:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003c6a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003c6d:	7f 16                	jg     c0003c85 <new_dir_entry+0xfc>
c0003c6f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003c73:	75 10                	jne    c0003c85 <new_dir_entry+0xfc>
c0003c75:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003c79:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003c7c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003c7f:	0f 8c 75 ff ff ff    	jl     c0003bfa <new_dir_entry+0x71>
c0003c85:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003c88:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003c8b:	75 0a                	jne    c0003c97 <new_dir_entry+0x10e>
c0003c8d:	b8 00 00 00 00       	mov    $0x0,%eax
c0003c92:	e9 fc 00 00 00       	jmp    c0003d93 <new_dir_entry+0x20a>
c0003c97:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003c9e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003ca2:	75 1e                	jne    c0003cc2 <new_dir_entry+0x139>
c0003ca4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003ca7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003caa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cad:	8b 50 04             	mov    0x4(%eax),%edx
c0003cb0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003cb3:	01 c2                	add    %eax,%edx
c0003cb5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cb8:	89 50 04             	mov    %edx,0x4(%eax)
c0003cbb:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003cc5:	8b 55 14             	mov    0x14(%ebp),%edx
c0003cc8:	89 10                	mov    %edx,(%eax)
c0003cca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003ccd:	83 c0 04             	add    $0x4,%eax
c0003cd0:	83 ec 08             	sub    $0x8,%esp
c0003cd3:	ff 75 10             	pushl  0x10(%ebp)
c0003cd6:	50                   	push   %eax
c0003cd7:	e8 95 76 00 00       	call   c000b371 <Strcpy>
c0003cdc:	83 c4 10             	add    $0x10,%esp
c0003cdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ce2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003ce5:	8b 0a                	mov    (%edx),%ecx
c0003ce7:	89 08                	mov    %ecx,(%eax)
c0003ce9:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003cec:	89 48 04             	mov    %ecx,0x4(%eax)
c0003cef:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003cf2:	89 48 08             	mov    %ecx,0x8(%eax)
c0003cf5:	8b 52 0c             	mov    0xc(%edx),%edx
c0003cf8:	89 50 0c             	mov    %edx,0xc(%eax)
c0003cfb:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003d00:	89 c1                	mov    %eax,%ecx
c0003d02:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003d05:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003d08:	01 d0                	add    %edx,%eax
c0003d0a:	83 ec 0c             	sub    $0xc,%esp
c0003d0d:	6a 0a                	push   $0xa
c0003d0f:	68 00 02 00 00       	push   $0x200
c0003d14:	51                   	push   %ecx
c0003d15:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003d18:	50                   	push   %eax
c0003d19:	e8 04 ed ff ff       	call   c0002a22 <rd_wt>
c0003d1e:	83 c4 20             	add    $0x20,%esp
c0003d21:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003d25:	74 69                	je     c0003d90 <new_dir_entry+0x207>
c0003d27:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d2a:	8b 10                	mov    (%eax),%edx
c0003d2c:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003d32:	8b 50 04             	mov    0x4(%eax),%edx
c0003d35:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003d3b:	8b 50 08             	mov    0x8(%eax),%edx
c0003d3e:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003d44:	8b 50 0c             	mov    0xc(%eax),%edx
c0003d47:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003d4d:	8b 50 10             	mov    0x10(%eax),%edx
c0003d50:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003d56:	8b 50 14             	mov    0x14(%eax),%edx
c0003d59:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003d5f:	8b 50 18             	mov    0x18(%eax),%edx
c0003d62:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003d68:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003d6b:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003d71:	8b 50 20             	mov    0x20(%eax),%edx
c0003d74:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003d7a:	8b 40 24             	mov    0x24(%eax),%eax
c0003d7d:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003d82:	83 ec 0c             	sub    $0xc,%esp
c0003d85:	ff 75 0c             	pushl  0xc(%ebp)
c0003d88:	e8 76 08 00 00       	call   c0004603 <sync_inode>
c0003d8d:	83 c4 10             	add    $0x10,%esp
c0003d90:	8b 45 08             	mov    0x8(%ebp),%eax
c0003d93:	c9                   	leave  
c0003d94:	c3                   	ret    

c0003d95 <do_unlink>:
c0003d95:	55                   	push   %ebp
c0003d96:	89 e5                	mov    %esp,%ebp
c0003d98:	53                   	push   %ebx
c0003d99:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003d9f:	83 ec 08             	sub    $0x8,%esp
c0003da2:	ff 75 08             	pushl  0x8(%ebp)
c0003da5:	68 75 aa 00 c0       	push   $0xc000aa75
c0003daa:	e8 10 60 00 00       	call   c0009dbf <strcmp>
c0003daf:	83 c4 10             	add    $0x10,%esp
c0003db2:	85 c0                	test   %eax,%eax
c0003db4:	75 10                	jne    c0003dc6 <do_unlink+0x31>
c0003db6:	83 ec 0c             	sub    $0xc,%esp
c0003db9:	68 77 aa 00 c0       	push   $0xc000aa77
c0003dbe:	e8 37 54 00 00       	call   c00091fa <panic>
c0003dc3:	83 c4 10             	add    $0x10,%esp
c0003dc6:	83 ec 0c             	sub    $0xc,%esp
c0003dc9:	ff 75 08             	pushl  0x8(%ebp)
c0003dcc:	e8 31 f5 ff ff       	call   c0003302 <search_file>
c0003dd1:	83 c4 10             	add    $0x10,%esp
c0003dd4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003dd7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003ddb:	75 10                	jne    c0003ded <do_unlink+0x58>
c0003ddd:	83 ec 0c             	sub    $0xc,%esp
c0003de0:	68 93 aa 00 c0       	push   $0xc000aa93
c0003de5:	e8 10 54 00 00       	call   c00091fa <panic>
c0003dea:	83 c4 10             	add    $0x10,%esp
c0003ded:	83 ec 08             	sub    $0x8,%esp
c0003df0:	ff 75 d0             	pushl  -0x30(%ebp)
c0003df3:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003df9:	50                   	push   %eax
c0003dfa:	e8 01 f7 ff ff       	call   c0003500 <get_inode>
c0003dff:	83 c4 10             	add    $0x10,%esp
c0003e02:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003e05:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003e09:	75 10                	jne    c0003e1b <do_unlink+0x86>
c0003e0b:	83 ec 0c             	sub    $0xc,%esp
c0003e0e:	68 93 aa 00 c0       	push   $0xc000aa93
c0003e13:	e8 e2 53 00 00       	call   c00091fa <panic>
c0003e18:	83 c4 10             	add    $0x10,%esp
c0003e1b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003e1e:	85 c0                	test   %eax,%eax
c0003e20:	7e 10                	jle    c0003e32 <do_unlink+0x9d>
c0003e22:	83 ec 0c             	sub    $0xc,%esp
c0003e25:	68 ac aa 00 c0       	push   $0xc000aaac
c0003e2a:	e8 cb 53 00 00       	call   c00091fa <panic>
c0003e2f:	83 c4 10             	add    $0x10,%esp
c0003e32:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003e38:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003e3b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003e3e:	8d 50 07             	lea    0x7(%eax),%edx
c0003e41:	85 c0                	test   %eax,%eax
c0003e43:	0f 48 c2             	cmovs  %edx,%eax
c0003e46:	c1 f8 03             	sar    $0x3,%eax
c0003e49:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003e4c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003e4f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003e55:	85 c0                	test   %eax,%eax
c0003e57:	0f 48 c2             	cmovs  %edx,%eax
c0003e5a:	c1 f8 09             	sar    $0x9,%eax
c0003e5d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003e60:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003e63:	99                   	cltd   
c0003e64:	c1 ea 1d             	shr    $0x1d,%edx
c0003e67:	01 d0                	add    %edx,%eax
c0003e69:	83 e0 07             	and    $0x7,%eax
c0003e6c:	29 d0                	sub    %edx,%eax
c0003e6e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003e71:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003e78:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e7d:	89 c2                	mov    %eax,%edx
c0003e7f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003e82:	83 c0 02             	add    $0x2,%eax
c0003e85:	83 ec 0c             	sub    $0xc,%esp
c0003e88:	6a 07                	push   $0x7
c0003e8a:	68 00 02 00 00       	push   $0x200
c0003e8f:	52                   	push   %edx
c0003e90:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e93:	50                   	push   %eax
c0003e94:	e8 89 eb ff ff       	call   c0002a22 <rd_wt>
c0003e99:	83 c4 20             	add    $0x20,%esp
c0003e9c:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003ea2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003ea5:	01 d0                	add    %edx,%eax
c0003ea7:	0f b6 10             	movzbl (%eax),%edx
c0003eaa:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003ead:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003eb2:	89 c1                	mov    %eax,%ecx
c0003eb4:	d3 e3                	shl    %cl,%ebx
c0003eb6:	89 d8                	mov    %ebx,%eax
c0003eb8:	f7 d0                	not    %eax
c0003eba:	89 c3                	mov    %eax,%ebx
c0003ebc:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003ec2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003ec5:	01 c8                	add    %ecx,%eax
c0003ec7:	21 da                	and    %ebx,%edx
c0003ec9:	88 10                	mov    %dl,(%eax)
c0003ecb:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003ed0:	89 c2                	mov    %eax,%edx
c0003ed2:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003ed5:	83 c0 02             	add    $0x2,%eax
c0003ed8:	83 ec 0c             	sub    $0xc,%esp
c0003edb:	6a 0a                	push   $0xa
c0003edd:	68 00 02 00 00       	push   $0x200
c0003ee2:	52                   	push   %edx
c0003ee3:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ee6:	50                   	push   %eax
c0003ee7:	e8 36 eb ff ff       	call   c0002a22 <rd_wt>
c0003eec:	83 c4 20             	add    $0x20,%esp
c0003eef:	e8 f3 08 00 00       	call   c00047e7 <get_super_block>
c0003ef4:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003ef7:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003efd:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003f00:	8b 00                	mov    (%eax),%eax
c0003f02:	29 c2                	sub    %eax,%edx
c0003f04:	89 d0                	mov    %edx,%eax
c0003f06:	83 c0 01             	add    $0x1,%eax
c0003f09:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003f0c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003f0f:	8d 50 07             	lea    0x7(%eax),%edx
c0003f12:	85 c0                	test   %eax,%eax
c0003f14:	0f 48 c2             	cmovs  %edx,%eax
c0003f17:	c1 f8 03             	sar    $0x3,%eax
c0003f1a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003f1d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003f20:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003f26:	85 c0                	test   %eax,%eax
c0003f28:	0f 48 c2             	cmovs  %edx,%eax
c0003f2b:	c1 f8 09             	sar    $0x9,%eax
c0003f2e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003f31:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003f34:	99                   	cltd   
c0003f35:	c1 ea 1d             	shr    $0x1d,%edx
c0003f38:	01 d0                	add    %edx,%eax
c0003f3a:	83 e0 07             	and    $0x7,%eax
c0003f3d:	29 d0                	sub    %edx,%eax
c0003f3f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003f42:	b8 08 00 00 00       	mov    $0x8,%eax
c0003f47:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003f4a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003f4d:	29 c2                	sub    %eax,%edx
c0003f4f:	89 d0                	mov    %edx,%eax
c0003f51:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003f54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f57:	8d 50 07             	lea    0x7(%eax),%edx
c0003f5a:	85 c0                	test   %eax,%eax
c0003f5c:	0f 48 c2             	cmovs  %edx,%eax
c0003f5f:	c1 f8 03             	sar    $0x3,%eax
c0003f62:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003f65:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003f6a:	89 c1                	mov    %eax,%ecx
c0003f6c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003f6f:	8b 40 04             	mov    0x4(%eax),%eax
c0003f72:	8d 50 02             	lea    0x2(%eax),%edx
c0003f75:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003f78:	01 d0                	add    %edx,%eax
c0003f7a:	83 ec 0c             	sub    $0xc,%esp
c0003f7d:	6a 07                	push   $0x7
c0003f7f:	68 00 02 00 00       	push   $0x200
c0003f84:	51                   	push   %ecx
c0003f85:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f88:	50                   	push   %eax
c0003f89:	e8 94 ea ff ff       	call   c0002a22 <rd_wt>
c0003f8e:	83 c4 20             	add    $0x20,%esp
c0003f91:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003f97:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003f9a:	01 d0                	add    %edx,%eax
c0003f9c:	0f b6 10             	movzbl (%eax),%edx
c0003f9f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003fa2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003fa7:	89 c1                	mov    %eax,%ecx
c0003fa9:	d3 e3                	shl    %cl,%ebx
c0003fab:	89 d8                	mov    %ebx,%eax
c0003fad:	f7 d0                	not    %eax
c0003faf:	89 c3                	mov    %eax,%ebx
c0003fb1:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003fb7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003fba:	01 c8                	add    %ecx,%eax
c0003fbc:	21 da                	and    %ebx,%edx
c0003fbe:	88 10                	mov    %dl,(%eax)
c0003fc0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003fc7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003fca:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003fcd:	eb 6b                	jmp    c000403a <do_unlink+0x2a5>
c0003fcf:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003fd6:	75 4c                	jne    c0004024 <do_unlink+0x28f>
c0003fd8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003fdf:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003fe4:	83 ec 0c             	sub    $0xc,%esp
c0003fe7:	6a 0a                	push   $0xa
c0003fe9:	68 00 02 00 00       	push   $0x200
c0003fee:	50                   	push   %eax
c0003fef:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ff2:	ff 75 ec             	pushl  -0x14(%ebp)
c0003ff5:	e8 28 ea ff ff       	call   c0002a22 <rd_wt>
c0003ffa:	83 c4 20             	add    $0x20,%esp
c0003ffd:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004002:	89 c1                	mov    %eax,%ecx
c0004004:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004007:	8d 50 01             	lea    0x1(%eax),%edx
c000400a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c000400d:	83 ec 0c             	sub    $0xc,%esp
c0004010:	6a 07                	push   $0x7
c0004012:	68 00 02 00 00       	push   $0x200
c0004017:	51                   	push   %ecx
c0004018:	ff 75 b8             	pushl  -0x48(%ebp)
c000401b:	50                   	push   %eax
c000401c:	e8 01 ea ff ff       	call   c0002a22 <rd_wt>
c0004021:	83 c4 20             	add    $0x20,%esp
c0004024:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000402a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000402d:	01 d0                	add    %edx,%eax
c000402f:	c6 00 00             	movb   $0x0,(%eax)
c0004032:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0004036:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c000403a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000403d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0004040:	7c 8d                	jl     c0003fcf <do_unlink+0x23a>
c0004042:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0004049:	75 4c                	jne    c0004097 <do_unlink+0x302>
c000404b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004052:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004057:	83 ec 0c             	sub    $0xc,%esp
c000405a:	6a 0a                	push   $0xa
c000405c:	68 00 02 00 00       	push   $0x200
c0004061:	50                   	push   %eax
c0004062:	ff 75 b8             	pushl  -0x48(%ebp)
c0004065:	ff 75 ec             	pushl  -0x14(%ebp)
c0004068:	e8 b5 e9 ff ff       	call   c0002a22 <rd_wt>
c000406d:	83 c4 20             	add    $0x20,%esp
c0004070:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004075:	89 c1                	mov    %eax,%ecx
c0004077:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000407a:	8d 50 01             	lea    0x1(%eax),%edx
c000407d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004080:	83 ec 0c             	sub    $0xc,%esp
c0004083:	6a 07                	push   $0x7
c0004085:	68 00 02 00 00       	push   $0x200
c000408a:	51                   	push   %ecx
c000408b:	ff 75 b8             	pushl  -0x48(%ebp)
c000408e:	50                   	push   %eax
c000408f:	e8 8e e9 ff ff       	call   c0002a22 <rd_wt>
c0004094:	83 c4 20             	add    $0x20,%esp
c0004097:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000409d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00040a0:	01 d0                	add    %edx,%eax
c00040a2:	0f b6 10             	movzbl (%eax),%edx
c00040a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00040a8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c00040ad:	89 c1                	mov    %eax,%ecx
c00040af:	d3 e3                	shl    %cl,%ebx
c00040b1:	89 d8                	mov    %ebx,%eax
c00040b3:	89 c3                	mov    %eax,%ebx
c00040b5:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c00040bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00040be:	01 c8                	add    %ecx,%eax
c00040c0:	21 da                	and    %ebx,%edx
c00040c2:	88 10                	mov    %dl,(%eax)
c00040c4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00040c9:	83 ec 0c             	sub    $0xc,%esp
c00040cc:	6a 0a                	push   $0xa
c00040ce:	68 00 02 00 00       	push   $0x200
c00040d3:	50                   	push   %eax
c00040d4:	ff 75 b8             	pushl  -0x48(%ebp)
c00040d7:	ff 75 ec             	pushl  -0x14(%ebp)
c00040da:	e8 43 e9 ff ff       	call   c0002a22 <rd_wt>
c00040df:	83 c4 20             	add    $0x20,%esp
c00040e2:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c00040e9:	00 00 00 
c00040ec:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c00040f3:	00 00 00 
c00040f6:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c00040fd:	00 00 00 
c0004100:	83 ec 0c             	sub    $0xc,%esp
c0004103:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0004109:	50                   	push   %eax
c000410a:	e8 f4 04 00 00       	call   c0004603 <sync_inode>
c000410f:	83 c4 10             	add    $0x10,%esp
c0004112:	83 ec 0c             	sub    $0xc,%esp
c0004115:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000411b:	50                   	push   %eax
c000411c:	e8 36 06 00 00       	call   c0004757 <put_inode>
c0004121:	83 c4 10             	add    $0x10,%esp
c0004124:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004127:	8b 00                	mov    (%eax),%eax
c0004129:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000412c:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c0004133:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004136:	8b 40 04             	mov    0x4(%eax),%eax
c0004139:	89 45 94             	mov    %eax,-0x6c(%ebp)
c000413c:	8b 45 98             	mov    -0x68(%ebp),%eax
c000413f:	8b 40 0c             	mov    0xc(%eax),%eax
c0004142:	89 45 90             	mov    %eax,-0x70(%ebp)
c0004145:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004148:	c1 e8 04             	shr    $0x4,%eax
c000414b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c000414e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004155:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000415c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004163:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000416a:	e9 a5 00 00 00       	jmp    c0004214 <do_unlink+0x47f>
c000416f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004174:	89 c1                	mov    %eax,%ecx
c0004176:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004179:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000417c:	01 d0                	add    %edx,%eax
c000417e:	83 ec 0c             	sub    $0xc,%esp
c0004181:	6a 07                	push   $0x7
c0004183:	68 00 02 00 00       	push   $0x200
c0004188:	51                   	push   %ecx
c0004189:	ff 75 b8             	pushl  -0x48(%ebp)
c000418c:	50                   	push   %eax
c000418d:	e8 90 e8 ff ff       	call   c0002a22 <rd_wt>
c0004192:	83 c4 20             	add    $0x20,%esp
c0004195:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000419a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000419d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00041a4:	eb 51                	jmp    c00041f7 <do_unlink+0x462>
c00041a6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00041aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00041ad:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00041b0:	7f 4f                	jg     c0004201 <do_unlink+0x46c>
c00041b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00041b5:	83 c0 10             	add    $0x10,%eax
c00041b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00041bb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00041be:	83 c0 04             	add    $0x4,%eax
c00041c1:	83 ec 08             	sub    $0x8,%esp
c00041c4:	ff 75 08             	pushl  0x8(%ebp)
c00041c7:	50                   	push   %eax
c00041c8:	e8 f2 5b 00 00       	call   c0009dbf <strcmp>
c00041cd:	83 c4 10             	add    $0x10,%esp
c00041d0:	85 c0                	test   %eax,%eax
c00041d2:	75 1b                	jne    c00041ef <do_unlink+0x45a>
c00041d4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c00041db:	83 ec 04             	sub    $0x4,%esp
c00041de:	6a 10                	push   $0x10
c00041e0:	6a 00                	push   $0x0
c00041e2:	ff 75 d4             	pushl  -0x2c(%ebp)
c00041e5:	e8 68 71 00 00       	call   c000b352 <Memset>
c00041ea:	83 c4 10             	add    $0x10,%esp
c00041ed:	eb 13                	jmp    c0004202 <do_unlink+0x46d>
c00041ef:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c00041f3:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c00041f7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00041fa:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00041fd:	7c a7                	jl     c00041a6 <do_unlink+0x411>
c00041ff:	eb 01                	jmp    c0004202 <do_unlink+0x46d>
c0004201:	90                   	nop
c0004202:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004205:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004208:	7f 16                	jg     c0004220 <do_unlink+0x48b>
c000420a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000420e:	75 10                	jne    c0004220 <do_unlink+0x48b>
c0004210:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0004214:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004217:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000421a:	0f 8c 4f ff ff ff    	jl     c000416f <do_unlink+0x3da>
c0004220:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004223:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004226:	75 17                	jne    c000423f <do_unlink+0x4aa>
c0004228:	8b 45 98             	mov    -0x68(%ebp),%eax
c000422b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000422e:	89 50 04             	mov    %edx,0x4(%eax)
c0004231:	83 ec 0c             	sub    $0xc,%esp
c0004234:	ff 75 98             	pushl  -0x68(%ebp)
c0004237:	e8 c7 03 00 00       	call   c0004603 <sync_inode>
c000423c:	83 c4 10             	add    $0x10,%esp
c000423f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004243:	74 26                	je     c000426b <do_unlink+0x4d6>
c0004245:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000424a:	89 c1                	mov    %eax,%ecx
c000424c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000424f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004252:	01 d0                	add    %edx,%eax
c0004254:	83 ec 0c             	sub    $0xc,%esp
c0004257:	6a 0a                	push   $0xa
c0004259:	68 00 02 00 00       	push   $0x200
c000425e:	51                   	push   %ecx
c000425f:	ff 75 b8             	pushl  -0x48(%ebp)
c0004262:	50                   	push   %eax
c0004263:	e8 ba e7 ff ff       	call   c0002a22 <rd_wt>
c0004268:	83 c4 20             	add    $0x20,%esp
c000426b:	90                   	nop
c000426c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000426f:	c9                   	leave  
c0004270:	c3                   	ret    

c0004271 <do_rdwt>:
c0004271:	55                   	push   %ebp
c0004272:	89 e5                	mov    %esp,%ebp
c0004274:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000427a:	8b 45 08             	mov    0x8(%ebp),%eax
c000427d:	8b 40 68             	mov    0x68(%eax),%eax
c0004280:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004283:	8b 45 08             	mov    0x8(%ebp),%eax
c0004286:	8b 40 50             	mov    0x50(%eax),%eax
c0004289:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000428c:	8b 45 08             	mov    0x8(%ebp),%eax
c000428f:	8b 40 5c             	mov    0x5c(%eax),%eax
c0004292:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004295:	8b 45 08             	mov    0x8(%ebp),%eax
c0004298:	8b 00                	mov    (%eax),%eax
c000429a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000429d:	8b 45 08             	mov    0x8(%ebp),%eax
c00042a0:	8b 40 10             	mov    0x10(%eax),%eax
c00042a3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00042a6:	8b 45 08             	mov    0x8(%ebp),%eax
c00042a9:	8b 40 40             	mov    0x40(%eax),%eax
c00042ac:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00042af:	83 ec 0c             	sub    $0xc,%esp
c00042b2:	ff 75 cc             	pushl  -0x34(%ebp)
c00042b5:	e8 5d 07 00 00       	call   c0004a17 <pid2proc>
c00042ba:	83 c4 10             	add    $0x10,%esp
c00042bd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00042c0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00042c3:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c00042c6:	83 c2 50             	add    $0x50,%edx
c00042c9:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00042cd:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00042d0:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00042d3:	8b 40 08             	mov    0x8(%eax),%eax
c00042d6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00042d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00042dc:	8b 00                	mov    (%eax),%eax
c00042de:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00042e1:	83 ec 08             	sub    $0x8,%esp
c00042e4:	ff 75 b8             	pushl  -0x48(%ebp)
c00042e7:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00042ed:	50                   	push   %eax
c00042ee:	e8 0d f2 ff ff       	call   c0003500 <get_inode>
c00042f3:	83 c4 10             	add    $0x10,%esp
c00042f6:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00042f9:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c00042fd:	75 10                	jne    c000430f <do_rdwt+0x9e>
c00042ff:	83 ec 0c             	sub    $0xc,%esp
c0004302:	68 e4 aa 00 c0       	push   $0xc000aae4
c0004307:	e8 ee 4e 00 00       	call   c00091fa <panic>
c000430c:	83 c4 10             	add    $0x10,%esp
c000430f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004315:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0004318:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000431b:	8b 40 04             	mov    0x4(%eax),%eax
c000431e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004321:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004325:	74 22                	je     c0004349 <do_rdwt+0xd8>
c0004327:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000432b:	74 1c                	je     c0004349 <do_rdwt+0xd8>
c000432d:	68 9e 04 00 00       	push   $0x49e
c0004332:	68 50 a9 00 c0       	push   $0xc000a950
c0004337:	68 50 a9 00 c0       	push   $0xc000a950
c000433c:	68 f4 aa 00 c0       	push   $0xc000aaf4
c0004341:	e8 d2 4e 00 00       	call   c0009218 <assertion_failure>
c0004346:	83 c4 10             	add    $0x10,%esp
c0004349:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c000434f:	83 f8 01             	cmp    $0x1,%eax
c0004352:	0f 85 86 00 00 00    	jne    c00043de <do_rdwt+0x16d>
c0004358:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000435c:	75 09                	jne    c0004367 <do_rdwt+0xf6>
c000435e:	c7 45 f0 d2 07 00 00 	movl   $0x7d2,-0x10(%ebp)
c0004365:	eb 0d                	jmp    c0004374 <do_rdwt+0x103>
c0004367:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c000436b:	75 07                	jne    c0004374 <do_rdwt+0x103>
c000436d:	c7 45 f0 d3 07 00 00 	movl   $0x7d3,-0x10(%ebp)
c0004374:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004377:	8b 45 08             	mov    0x8(%ebp),%eax
c000437a:	89 50 68             	mov    %edx,0x68(%eax)
c000437d:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0004380:	8b 45 08             	mov    0x8(%ebp),%eax
c0004383:	89 50 58             	mov    %edx,0x58(%eax)
c0004386:	83 ec 04             	sub    $0x4,%esp
c0004389:	6a 02                	push   $0x2
c000438b:	ff 75 08             	pushl  0x8(%ebp)
c000438e:	6a 03                	push   $0x3
c0004390:	e8 ce 56 00 00       	call   c0009a63 <send_rec>
c0004395:	83 c4 10             	add    $0x10,%esp
c0004398:	8b 45 08             	mov    0x8(%ebp),%eax
c000439b:	8b 40 68             	mov    0x68(%eax),%eax
c000439e:	83 f8 66             	cmp    $0x66,%eax
c00043a1:	75 13                	jne    c00043b6 <do_rdwt+0x145>
c00043a3:	83 ec 04             	sub    $0x4,%esp
c00043a6:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043a9:	ff 75 08             	pushl  0x8(%ebp)
c00043ac:	6a 01                	push   $0x1
c00043ae:	e8 b0 56 00 00       	call   c0009a63 <send_rec>
c00043b3:	83 c4 10             	add    $0x10,%esp
c00043b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00043b9:	8b 40 68             	mov    0x68(%eax),%eax
c00043bc:	83 f8 65             	cmp    $0x65,%eax
c00043bf:	75 13                	jne    c00043d4 <do_rdwt+0x163>
c00043c1:	83 ec 04             	sub    $0x4,%esp
c00043c4:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043c7:	ff 75 08             	pushl  0x8(%ebp)
c00043ca:	6a 01                	push   $0x1
c00043cc:	e8 92 56 00 00       	call   c0009a63 <send_rec>
c00043d1:	83 c4 10             	add    $0x10,%esp
c00043d4:	b8 00 00 00 00       	mov    $0x0,%eax
c00043d9:	e9 23 02 00 00       	jmp    c0004601 <do_rdwt+0x390>
c00043de:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c00043e2:	75 18                	jne    c00043fc <do_rdwt+0x18b>
c00043e4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00043ea:	c1 e0 09             	shl    $0x9,%eax
c00043ed:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00043f0:	75 0a                	jne    c00043fc <do_rdwt+0x18b>
c00043f2:	b8 00 00 00 00       	mov    $0x0,%eax
c00043f7:	e9 05 02 00 00       	jmp    c0004601 <do_rdwt+0x390>
c00043fc:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004400:	75 1b                	jne    c000441d <do_rdwt+0x1ac>
c0004402:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004409:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000440c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000440f:	01 d0                	add    %edx,%eax
c0004411:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004414:	0f 4e 45 ac          	cmovle -0x54(%ebp),%eax
c0004418:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000441b:	eb 19                	jmp    c0004436 <do_rdwt+0x1c5>
c000441d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004420:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004423:	01 c2                	add    %eax,%edx
c0004425:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000442b:	c1 e0 09             	shl    $0x9,%eax
c000442e:	39 c2                	cmp    %eax,%edx
c0004430:	0f 4e c2             	cmovle %edx,%eax
c0004433:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004436:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004439:	99                   	cltd   
c000443a:	c1 ea 17             	shr    $0x17,%edx
c000443d:	01 d0                	add    %edx,%eax
c000443f:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004444:	29 d0                	sub    %edx,%eax
c0004446:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004449:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000444f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004452:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004458:	85 c0                	test   %eax,%eax
c000445a:	0f 48 c1             	cmovs  %ecx,%eax
c000445d:	c1 f8 09             	sar    $0x9,%eax
c0004460:	01 d0                	add    %edx,%eax
c0004462:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004465:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000446b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000446e:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004474:	85 c0                	test   %eax,%eax
c0004476:	0f 48 c1             	cmovs  %ecx,%eax
c0004479:	c1 f8 09             	sar    $0x9,%eax
c000447c:	01 d0                	add    %edx,%eax
c000447e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004481:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004484:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004487:	ba 00 00 10 00       	mov    $0x100000,%edx
c000448c:	39 d0                	cmp    %edx,%eax
c000448e:	7d 0b                	jge    c000449b <do_rdwt+0x22a>
c0004490:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004493:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004496:	83 c0 01             	add    $0x1,%eax
c0004499:	eb 05                	jmp    c00044a0 <do_rdwt+0x22f>
c000449b:	b8 00 00 10 00       	mov    $0x100000,%eax
c00044a0:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00044a3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00044a9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00044b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00044b3:	8b 00                	mov    (%eax),%eax
c00044b5:	83 ec 0c             	sub    $0xc,%esp
c00044b8:	50                   	push   %eax
c00044b9:	e8 59 05 00 00       	call   c0004a17 <pid2proc>
c00044be:	83 c4 10             	add    $0x10,%esp
c00044c1:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00044c4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044c7:	83 ec 08             	sub    $0x8,%esp
c00044ca:	50                   	push   %eax
c00044cb:	ff 75 c8             	pushl  -0x38(%ebp)
c00044ce:	e8 b5 28 00 00       	call   c0006d88 <alloc_virtual_memory>
c00044d3:	83 c4 10             	add    $0x10,%esp
c00044d6:	89 45 98             	mov    %eax,-0x68(%ebp)
c00044d9:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00044dc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00044df:	e9 c5 00 00 00       	jmp    c00045a9 <do_rdwt+0x338>
c00044e4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00044e7:	c1 e0 09             	shl    $0x9,%eax
c00044ea:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00044ed:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c00044f0:	0f 4e 45 e4          	cmovle -0x1c(%ebp),%eax
c00044f4:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00044f7:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c00044fe:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004502:	75 46                	jne    c000454a <do_rdwt+0x2d9>
c0004504:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004507:	c1 e0 09             	shl    $0x9,%eax
c000450a:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c0004510:	83 ec 0c             	sub    $0xc,%esp
c0004513:	6a 07                	push   $0x7
c0004515:	50                   	push   %eax
c0004516:	52                   	push   %edx
c0004517:	ff 75 90             	pushl  -0x70(%ebp)
c000451a:	ff 75 dc             	pushl  -0x24(%ebp)
c000451d:	e8 00 e5 ff ff       	call   c0002a22 <rd_wt>
c0004522:	83 c4 20             	add    $0x20,%esp
c0004525:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000452b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000452e:	01 d0                	add    %edx,%eax
c0004530:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0004533:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0004536:	01 ca                	add    %ecx,%edx
c0004538:	83 ec 04             	sub    $0x4,%esp
c000453b:	ff 75 94             	pushl  -0x6c(%ebp)
c000453e:	50                   	push   %eax
c000453f:	52                   	push   %edx
c0004540:	e8 df 6d 00 00       	call   c000b324 <Memcpy>
c0004545:	83 c4 10             	add    $0x10,%esp
c0004548:	eb 46                	jmp    c0004590 <do_rdwt+0x31f>
c000454a:	8b 55 98             	mov    -0x68(%ebp),%edx
c000454d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004550:	01 d0                	add    %edx,%eax
c0004552:	89 c1                	mov    %eax,%ecx
c0004554:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000455a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000455d:	01 d0                	add    %edx,%eax
c000455f:	83 ec 04             	sub    $0x4,%esp
c0004562:	ff 75 94             	pushl  -0x6c(%ebp)
c0004565:	51                   	push   %ecx
c0004566:	50                   	push   %eax
c0004567:	e8 b8 6d 00 00       	call   c000b324 <Memcpy>
c000456c:	83 c4 10             	add    $0x10,%esp
c000456f:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004572:	c1 e0 09             	shl    $0x9,%eax
c0004575:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c000457b:	83 ec 0c             	sub    $0xc,%esp
c000457e:	6a 0a                	push   $0xa
c0004580:	50                   	push   %eax
c0004581:	52                   	push   %edx
c0004582:	ff 75 90             	pushl  -0x70(%ebp)
c0004585:	ff 75 dc             	pushl  -0x24(%ebp)
c0004588:	e8 95 e4 ff ff       	call   c0002a22 <rd_wt>
c000458d:	83 c4 20             	add    $0x20,%esp
c0004590:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004593:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c0004596:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004599:	01 45 e0             	add    %eax,-0x20(%ebp)
c000459c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00045a3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00045a6:	01 45 dc             	add    %eax,-0x24(%ebp)
c00045a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00045ac:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c00045af:	7f 0a                	jg     c00045bb <do_rdwt+0x34a>
c00045b1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00045b5:	0f 85 29 ff ff ff    	jne    c00044e4 <do_rdwt+0x273>
c00045bb:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00045be:	8b 50 04             	mov    0x4(%eax),%edx
c00045c1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045c4:	01 c2                	add    %eax,%edx
c00045c6:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00045c9:	89 50 04             	mov    %edx,0x4(%eax)
c00045cc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045d2:	01 c2                	add    %eax,%edx
c00045d4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00045da:	39 c2                	cmp    %eax,%edx
c00045dc:	7e 20                	jle    c00045fe <do_rdwt+0x38d>
c00045de:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045e1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045e4:	01 d0                	add    %edx,%eax
c00045e6:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00045ec:	83 ec 0c             	sub    $0xc,%esp
c00045ef:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00045f5:	50                   	push   %eax
c00045f6:	e8 08 00 00 00       	call   c0004603 <sync_inode>
c00045fb:	83 c4 10             	add    $0x10,%esp
c00045fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004601:	c9                   	leave  
c0004602:	c3                   	ret    

c0004603 <sync_inode>:
c0004603:	55                   	push   %ebp
c0004604:	89 e5                	mov    %esp,%ebp
c0004606:	53                   	push   %ebx
c0004607:	83 ec 34             	sub    $0x34,%esp
c000460a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004611:	eb 74                	jmp    c0004687 <sync_inode+0x84>
c0004613:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004616:	89 d0                	mov    %edx,%eax
c0004618:	c1 e0 02             	shl    $0x2,%eax
c000461b:	01 d0                	add    %edx,%eax
c000461d:	c1 e0 03             	shl    $0x3,%eax
c0004620:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0004625:	8b 10                	mov    (%eax),%edx
c0004627:	8b 45 08             	mov    0x8(%ebp),%eax
c000462a:	8b 40 10             	mov    0x10(%eax),%eax
c000462d:	39 c2                	cmp    %eax,%edx
c000462f:	75 52                	jne    c0004683 <sync_inode+0x80>
c0004631:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004634:	89 d0                	mov    %edx,%eax
c0004636:	c1 e0 02             	shl    $0x2,%eax
c0004639:	01 d0                	add    %edx,%eax
c000463b:	c1 e0 03             	shl    $0x3,%eax
c000463e:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c0004644:	8b 45 08             	mov    0x8(%ebp),%eax
c0004647:	8b 08                	mov    (%eax),%ecx
c0004649:	89 0a                	mov    %ecx,(%edx)
c000464b:	8b 48 04             	mov    0x4(%eax),%ecx
c000464e:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004651:	8b 48 08             	mov    0x8(%eax),%ecx
c0004654:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004657:	8b 48 0c             	mov    0xc(%eax),%ecx
c000465a:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000465d:	8b 48 10             	mov    0x10(%eax),%ecx
c0004660:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004663:	8b 48 14             	mov    0x14(%eax),%ecx
c0004666:	89 4a 14             	mov    %ecx,0x14(%edx)
c0004669:	8b 48 18             	mov    0x18(%eax),%ecx
c000466c:	89 4a 18             	mov    %ecx,0x18(%edx)
c000466f:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0004672:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004675:	8b 48 20             	mov    0x20(%eax),%ecx
c0004678:	89 4a 20             	mov    %ecx,0x20(%edx)
c000467b:	8b 40 24             	mov    0x24(%eax),%eax
c000467e:	89 42 24             	mov    %eax,0x24(%edx)
c0004681:	eb 0a                	jmp    c000468d <sync_inode+0x8a>
c0004683:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004687:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c000468b:	7e 86                	jle    c0004613 <sync_inode+0x10>
c000468d:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0004694:	8b 45 08             	mov    0x8(%ebp),%eax
c0004697:	8b 40 10             	mov    0x10(%eax),%eax
c000469a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000469d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046a0:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00046a3:	b8 00 02 00 00       	mov    $0x200,%eax
c00046a8:	99                   	cltd   
c00046a9:	f7 7d f0             	idivl  -0x10(%ebp)
c00046ac:	89 c3                	mov    %eax,%ebx
c00046ae:	89 c8                	mov    %ecx,%eax
c00046b0:	99                   	cltd   
c00046b1:	f7 fb                	idiv   %ebx
c00046b3:	89 55 e8             	mov    %edx,-0x18(%ebp)
c00046b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046b9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00046bc:	b8 00 02 00 00       	mov    $0x200,%eax
c00046c1:	99                   	cltd   
c00046c2:	f7 7d f0             	idivl  -0x10(%ebp)
c00046c5:	89 c3                	mov    %eax,%ebx
c00046c7:	89 c8                	mov    %ecx,%eax
c00046c9:	99                   	cltd   
c00046ca:	f7 fb                	idiv   %ebx
c00046cc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00046cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00046d2:	8b 40 20             	mov    0x20(%eax),%eax
c00046d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00046d8:	e8 0a 01 00 00       	call   c00047e7 <get_super_block>
c00046dd:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00046e0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00046e3:	8b 40 04             	mov    0x4(%eax),%eax
c00046e6:	8d 50 02             	lea    0x2(%eax),%edx
c00046e9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00046ec:	8b 40 08             	mov    0x8(%eax),%eax
c00046ef:	01 c2                	add    %eax,%edx
c00046f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00046f4:	01 d0                	add    %edx,%eax
c00046f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00046f9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00046fe:	83 ec 0c             	sub    $0xc,%esp
c0004701:	6a 07                	push   $0x7
c0004703:	68 00 02 00 00       	push   $0x200
c0004708:	50                   	push   %eax
c0004709:	ff 75 e0             	pushl  -0x20(%ebp)
c000470c:	ff 75 d8             	pushl  -0x28(%ebp)
c000470f:	e8 0e e3 ff ff       	call   c0002a22 <rd_wt>
c0004714:	83 c4 20             	add    $0x20,%esp
c0004717:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000471c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000471f:	83 ec 04             	sub    $0x4,%esp
c0004722:	ff 75 f0             	pushl  -0x10(%ebp)
c0004725:	ff 75 08             	pushl  0x8(%ebp)
c0004728:	ff 75 d4             	pushl  -0x2c(%ebp)
c000472b:	e8 f4 6b 00 00       	call   c000b324 <Memcpy>
c0004730:	83 c4 10             	add    $0x10,%esp
c0004733:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004738:	83 ec 0c             	sub    $0xc,%esp
c000473b:	6a 0a                	push   $0xa
c000473d:	68 00 02 00 00       	push   $0x200
c0004742:	50                   	push   %eax
c0004743:	ff 75 e0             	pushl  -0x20(%ebp)
c0004746:	ff 75 d8             	pushl  -0x28(%ebp)
c0004749:	e8 d4 e2 ff ff       	call   c0002a22 <rd_wt>
c000474e:	83 c4 20             	add    $0x20,%esp
c0004751:	90                   	nop
c0004752:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004755:	c9                   	leave  
c0004756:	c3                   	ret    

c0004757 <put_inode>:
c0004757:	55                   	push   %ebp
c0004758:	89 e5                	mov    %esp,%ebp
c000475a:	83 ec 08             	sub    $0x8,%esp
c000475d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004760:	8b 40 24             	mov    0x24(%eax),%eax
c0004763:	85 c0                	test   %eax,%eax
c0004765:	7f 1c                	jg     c0004783 <put_inode+0x2c>
c0004767:	68 42 05 00 00       	push   $0x542
c000476c:	68 50 a9 00 c0       	push   $0xc000a950
c0004771:	68 50 a9 00 c0       	push   $0xc000a950
c0004776:	68 28 ab 00 c0       	push   $0xc000ab28
c000477b:	e8 98 4a 00 00       	call   c0009218 <assertion_failure>
c0004780:	83 c4 10             	add    $0x10,%esp
c0004783:	8b 45 08             	mov    0x8(%ebp),%eax
c0004786:	8b 40 24             	mov    0x24(%eax),%eax
c0004789:	8d 50 ff             	lea    -0x1(%eax),%edx
c000478c:	8b 45 08             	mov    0x8(%ebp),%eax
c000478f:	89 50 24             	mov    %edx,0x24(%eax)
c0004792:	90                   	nop
c0004793:	c9                   	leave  
c0004794:	c3                   	ret    

c0004795 <do_close>:
c0004795:	55                   	push   %ebp
c0004796:	89 e5                	mov    %esp,%ebp
c0004798:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000479d:	8b 55 08             	mov    0x8(%ebp),%edx
c00047a0:	83 c2 50             	add    $0x50,%edx
c00047a3:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00047a7:	8b 50 0c             	mov    0xc(%eax),%edx
c00047aa:	83 ea 01             	sub    $0x1,%edx
c00047ad:	89 50 0c             	mov    %edx,0xc(%eax)
c00047b0:	8b 40 0c             	mov    0xc(%eax),%eax
c00047b3:	85 c0                	test   %eax,%eax
c00047b5:	75 16                	jne    c00047cd <do_close+0x38>
c00047b7:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c00047bc:	8b 55 08             	mov    0x8(%ebp),%edx
c00047bf:	83 c2 50             	add    $0x50,%edx
c00047c2:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00047c6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00047cd:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c00047d2:	8b 55 08             	mov    0x8(%ebp),%edx
c00047d5:	83 c2 50             	add    $0x50,%edx
c00047d8:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
c00047df:	00 
c00047e0:	b8 00 00 00 00       	mov    $0x0,%eax
c00047e5:	5d                   	pop    %ebp
c00047e6:	c3                   	ret    

c00047e7 <get_super_block>:
c00047e7:	55                   	push   %ebp
c00047e8:	89 e5                	mov    %esp,%ebp
c00047ea:	83 ec 08             	sub    $0x8,%esp
c00047ed:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00047f2:	83 ec 0c             	sub    $0xc,%esp
c00047f5:	6a 07                	push   $0x7
c00047f7:	68 00 02 00 00       	push   $0x200
c00047fc:	50                   	push   %eax
c00047fd:	6a 20                	push   $0x20
c00047ff:	6a 01                	push   $0x1
c0004801:	e8 1c e2 ff ff       	call   c0002a22 <rd_wt>
c0004806:	83 c4 20             	add    $0x20,%esp
c0004809:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000480f:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0004814:	8b 0a                	mov    (%edx),%ecx
c0004816:	89 08                	mov    %ecx,(%eax)
c0004818:	8b 4a 04             	mov    0x4(%edx),%ecx
c000481b:	89 48 04             	mov    %ecx,0x4(%eax)
c000481e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0004821:	89 48 08             	mov    %ecx,0x8(%eax)
c0004824:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0004827:	89 48 0c             	mov    %ecx,0xc(%eax)
c000482a:	8b 4a 10             	mov    0x10(%edx),%ecx
c000482d:	89 48 10             	mov    %ecx,0x10(%eax)
c0004830:	8b 4a 14             	mov    0x14(%edx),%ecx
c0004833:	89 48 14             	mov    %ecx,0x14(%eax)
c0004836:	8b 4a 18             	mov    0x18(%edx),%ecx
c0004839:	89 48 18             	mov    %ecx,0x18(%eax)
c000483c:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000483f:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004842:	8b 52 20             	mov    0x20(%edx),%edx
c0004845:	89 50 20             	mov    %edx,0x20(%eax)
c0004848:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c000484d:	c9                   	leave  
c000484e:	c3                   	ret    

c000484f <check>:
c000484f:	55                   	push   %ebp
c0004850:	89 e5                	mov    %esp,%ebp
c0004852:	83 ec 18             	sub    $0x18,%esp
c0004855:	c7 45 f4 00 33 08 c0 	movl   $0xc0083300,-0xc(%ebp)
c000485c:	eb 59                	jmp    c00048b7 <check+0x68>
c000485e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004861:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0004867:	85 c0                	test   %eax,%eax
c0004869:	74 45                	je     c00048b0 <check+0x61>
c000486b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000486e:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0004874:	83 f8 01             	cmp    $0x1,%eax
c0004877:	74 37                	je     c00048b0 <check+0x61>
c0004879:	c7 05 40 f7 00 c0 02 	movl   $0x2802,0xc000f740
c0004880:	28 00 00 
c0004883:	83 ec 08             	sub    $0x8,%esp
c0004886:	6a 0a                	push   $0xa
c0004888:	68 37 ab 00 c0       	push   $0xc000ab37
c000488d:	e8 35 cd ff ff       	call   c00015c7 <disp_str_colour>
c0004892:	83 c4 10             	add    $0x10,%esp
c0004895:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004898:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000489f:	0f be c0             	movsbl %al,%eax
c00048a2:	83 ec 0c             	sub    $0xc,%esp
c00048a5:	50                   	push   %eax
c00048a6:	e8 97 31 00 00       	call   c0007a42 <disp_int>
c00048ab:	83 c4 10             	add    $0x10,%esp
c00048ae:	eb fe                	jmp    c00048ae <check+0x5f>
c00048b0:	81 45 f4 ac 02 00 00 	addl   $0x2ac,-0xc(%ebp)
c00048b7:	b8 58 38 08 c0       	mov    $0xc0083858,%eax
c00048bc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00048bf:	72 9d                	jb     c000485e <check+0xf>
c00048c1:	90                   	nop
c00048c2:	c9                   	leave  
c00048c3:	c3                   	ret    

c00048c4 <schedule_process>:
c00048c4:	55                   	push   %ebp
c00048c5:	89 e5                	mov    %esp,%ebp
c00048c7:	83 ec 28             	sub    $0x28,%esp
c00048ca:	e8 bd cf ff ff       	call   c000188c <get_running_thread_pcb>
c00048cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00048d2:	83 ec 0c             	sub    $0xc,%esp
c00048d5:	68 8c fd 00 c0       	push   $0xc000fd8c
c00048da:	e8 d4 5b 00 00       	call   c000a4b3 <isListEmpty>
c00048df:	83 c4 10             	add    $0x10,%esp
c00048e2:	3c 01                	cmp    $0x1,%al
c00048e4:	75 08                	jne    c00048ee <schedule_process+0x2a>
c00048e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00048e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00048ec:	eb 4d                	jmp    c000493b <schedule_process+0x77>
c00048ee:	83 ec 0c             	sub    $0xc,%esp
c00048f1:	68 8c fd 00 c0       	push   $0xc000fd8c
c00048f6:	e8 5f 5c 00 00       	call   c000a55a <popFromDoubleLinkList>
c00048fb:	83 c4 10             	add    $0x10,%esp
c00048fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004901:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004904:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004909:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000490c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004910:	74 29                	je     c000493b <schedule_process+0x77>
c0004912:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004915:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004918:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000491b:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0004922:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004925:	05 30 01 00 00       	add    $0x130,%eax
c000492a:	83 ec 08             	sub    $0x8,%esp
c000492d:	68 3d ab 00 c0       	push   $0xc000ab3d
c0004932:	50                   	push   %eax
c0004933:	e8 87 54 00 00       	call   c0009dbf <strcmp>
c0004938:	83 c4 10             	add    $0x10,%esp
c000493b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000493e:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0004945:	84 c0                	test   %al,%al
c0004947:	75 19                	jne    c0004962 <schedule_process+0x9e>
c0004949:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000494c:	05 fc 00 00 00       	add    $0xfc,%eax
c0004951:	83 ec 08             	sub    $0x8,%esp
c0004954:	50                   	push   %eax
c0004955:	68 8c fd 00 c0       	push   $0xc000fd8c
c000495a:	e8 ba 5b 00 00       	call   c000a519 <insertToDoubleLinkList>
c000495f:	83 c4 10             	add    $0x10,%esp
c0004962:	c7 45 e4 00 00 10 00 	movl   $0x100000,-0x1c(%ebp)
c0004969:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000496c:	8b 40 04             	mov    0x4(%eax),%eax
c000496f:	85 c0                	test   %eax,%eax
c0004971:	74 28                	je     c000499b <schedule_process+0xd7>
c0004973:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004976:	05 00 10 00 00       	add    $0x1000,%eax
c000497b:	83 ec 0c             	sub    $0xc,%esp
c000497e:	50                   	push   %eax
c000497f:	e8 f9 ce ff ff       	call   c000187d <update_tss>
c0004984:	83 c4 10             	add    $0x10,%esp
c0004987:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000498a:	8b 40 04             	mov    0x4(%eax),%eax
c000498d:	83 ec 0c             	sub    $0xc,%esp
c0004990:	50                   	push   %eax
c0004991:	e8 da ce ff ff       	call   c0001870 <update_cr3>
c0004996:	83 c4 10             	add    $0x10,%esp
c0004999:	eb 0f                	jmp    c00049aa <schedule_process+0xe6>
c000499b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000499e:	83 ec 0c             	sub    $0xc,%esp
c00049a1:	50                   	push   %eax
c00049a2:	e8 c9 ce ff ff       	call   c0001870 <update_cr3>
c00049a7:	83 c4 10             	add    $0x10,%esp
c00049aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049ad:	a3 60 fb 00 c0       	mov    %eax,0xc000fb60
c00049b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049b5:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00049bb:	83 f8 06             	cmp    $0x6,%eax
c00049be:	75 1f                	jne    c00049df <schedule_process+0x11b>
c00049c0:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c00049c7:	00 00 00 
c00049ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049cd:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00049d3:	83 ec 0c             	sub    $0xc,%esp
c00049d6:	50                   	push   %eax
c00049d7:	e8 b0 cb ff ff       	call   c000158c <disp_str>
c00049dc:	83 c4 10             	add    $0x10,%esp
c00049df:	83 ec 08             	sub    $0x8,%esp
c00049e2:	ff 75 f4             	pushl  -0xc(%ebp)
c00049e5:	ff 75 f0             	pushl  -0x10(%ebp)
c00049e8:	e8 83 5a 00 00       	call   c000a470 <switch_to>
c00049ed:	83 c4 10             	add    $0x10,%esp
c00049f0:	90                   	nop
c00049f1:	c9                   	leave  
c00049f2:	c3                   	ret    

c00049f3 <clock_handler>:
c00049f3:	55                   	push   %ebp
c00049f4:	89 e5                	mov    %esp,%ebp
c00049f6:	83 ec 08             	sub    $0x8,%esp
c00049f9:	a1 a0 16 01 c0       	mov    0xc00116a0,%eax
c00049fe:	85 c0                	test   %eax,%eax
c0004a00:	74 0d                	je     c0004a0f <clock_handler+0x1c>
c0004a02:	83 ec 0c             	sub    $0xc,%esp
c0004a05:	6a 02                	push   $0x2
c0004a07:	e8 e6 52 00 00       	call   c0009cf2 <inform_int>
c0004a0c:	83 c4 10             	add    $0x10,%esp
c0004a0f:	e8 b0 fe ff ff       	call   c00048c4 <schedule_process>
c0004a14:	90                   	nop
c0004a15:	c9                   	leave  
c0004a16:	c3                   	ret    

c0004a17 <pid2proc>:
c0004a17:	55                   	push   %ebp
c0004a18:	89 e5                	mov    %esp,%ebp
c0004a1a:	83 ec 20             	sub    $0x20,%esp
c0004a1d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0004a24:	a1 d4 1e 01 c0       	mov    0xc0011ed4,%eax
c0004a29:	8b 15 d8 1e 01 c0    	mov    0xc0011ed8,%edx
c0004a2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004a32:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004a35:	a1 dc 1e 01 c0       	mov    0xc0011edc,%eax
c0004a3a:	8b 15 e0 1e 01 c0    	mov    0xc0011ee0,%edx
c0004a40:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004a43:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004a46:	a1 d8 1e 01 c0       	mov    0xc0011ed8,%eax
c0004a4b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004a4e:	eb 29                	jmp    c0004a79 <pid2proc+0x62>
c0004a50:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a53:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004a58:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a5e:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c0004a64:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a67:	39 c2                	cmp    %eax,%edx
c0004a69:	75 05                	jne    c0004a70 <pid2proc+0x59>
c0004a6b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a6e:	eb 15                	jmp    c0004a85 <pid2proc+0x6e>
c0004a70:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a73:	8b 40 04             	mov    0x4(%eax),%eax
c0004a76:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004a79:	81 7d f8 dc 1e 01 c0 	cmpl   $0xc0011edc,-0x8(%ebp)
c0004a80:	75 ce                	jne    c0004a50 <pid2proc+0x39>
c0004a82:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a85:	c9                   	leave  
c0004a86:	c3                   	ret    

c0004a87 <proc2pid>:
c0004a87:	55                   	push   %ebp
c0004a88:	89 e5                	mov    %esp,%ebp
c0004a8a:	83 ec 10             	sub    $0x10,%esp
c0004a8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a90:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c0004a96:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a99:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a9c:	c9                   	leave  
c0004a9d:	c3                   	ret    

c0004a9e <InitDescriptor>:
c0004a9e:	55                   	push   %ebp
c0004a9f:	89 e5                	mov    %esp,%ebp
c0004aa1:	83 ec 04             	sub    $0x4,%esp
c0004aa4:	8b 45 14             	mov    0x14(%ebp),%eax
c0004aa7:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004aab:	8b 45 10             	mov    0x10(%ebp),%eax
c0004aae:	89 c2                	mov    %eax,%edx
c0004ab0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ab3:	66 89 10             	mov    %dx,(%eax)
c0004ab6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ab9:	89 c2                	mov    %eax,%edx
c0004abb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004abe:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004ac2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ac5:	c1 e8 10             	shr    $0x10,%eax
c0004ac8:	89 c2                	mov    %eax,%edx
c0004aca:	8b 45 08             	mov    0x8(%ebp),%eax
c0004acd:	88 50 04             	mov    %dl,0x4(%eax)
c0004ad0:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004ad4:	89 c2                	mov    %eax,%edx
c0004ad6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ad9:	88 50 05             	mov    %dl,0x5(%eax)
c0004adc:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004ae0:	66 c1 e8 08          	shr    $0x8,%ax
c0004ae4:	c1 e0 04             	shl    $0x4,%eax
c0004ae7:	89 c2                	mov    %eax,%edx
c0004ae9:	8b 45 10             	mov    0x10(%ebp),%eax
c0004aec:	c1 e8 10             	shr    $0x10,%eax
c0004aef:	83 e0 0f             	and    $0xf,%eax
c0004af2:	09 c2                	or     %eax,%edx
c0004af4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004af7:	88 50 06             	mov    %dl,0x6(%eax)
c0004afa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004afd:	c1 e8 18             	shr    $0x18,%eax
c0004b00:	89 c2                	mov    %eax,%edx
c0004b02:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b05:	88 50 07             	mov    %dl,0x7(%eax)
c0004b08:	90                   	nop
c0004b09:	c9                   	leave  
c0004b0a:	c3                   	ret    

c0004b0b <Seg2PhyAddr>:
c0004b0b:	55                   	push   %ebp
c0004b0c:	89 e5                	mov    %esp,%ebp
c0004b0e:	83 ec 10             	sub    $0x10,%esp
c0004b11:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b14:	c1 e8 03             	shr    $0x3,%eax
c0004b17:	8b 14 c5 64 f7 00 c0 	mov    -0x3fff089c(,%eax,8),%edx
c0004b1e:	8b 04 c5 60 f7 00 c0 	mov    -0x3fff08a0(,%eax,8),%eax
c0004b25:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b28:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004b2b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004b2f:	0f b7 c0             	movzwl %ax,%eax
c0004b32:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004b36:	0f b6 d2             	movzbl %dl,%edx
c0004b39:	c1 e2 10             	shl    $0x10,%edx
c0004b3c:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004b42:	09 d0                	or     %edx,%eax
c0004b44:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b47:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b4a:	c9                   	leave  
c0004b4b:	c3                   	ret    

c0004b4c <Seg2PhyAddrLDT>:
c0004b4c:	55                   	push   %ebp
c0004b4d:	89 e5                	mov    %esp,%ebp
c0004b4f:	83 ec 10             	sub    $0x10,%esp
c0004b52:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b55:	c1 e8 03             	shr    $0x3,%eax
c0004b58:	89 c2                	mov    %eax,%edx
c0004b5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b5d:	83 c2 20             	add    $0x20,%edx
c0004b60:	8d 54 d0 0e          	lea    0xe(%eax,%edx,8),%edx
c0004b64:	8b 02                	mov    (%edx),%eax
c0004b66:	8b 52 04             	mov    0x4(%edx),%edx
c0004b69:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b6c:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004b6f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004b73:	0f b7 c0             	movzwl %ax,%eax
c0004b76:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004b7a:	0f b6 d2             	movzbl %dl,%edx
c0004b7d:	c1 e2 10             	shl    $0x10,%edx
c0004b80:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004b86:	09 d0                	or     %edx,%eax
c0004b88:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b8e:	c9                   	leave  
c0004b8f:	c3                   	ret    

c0004b90 <VirAddr2PhyAddr>:
c0004b90:	55                   	push   %ebp
c0004b91:	89 e5                	mov    %esp,%ebp
c0004b93:	83 ec 10             	sub    $0x10,%esp
c0004b96:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004b99:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b9c:	01 d0                	add    %edx,%eax
c0004b9e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004ba1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ba4:	c9                   	leave  
c0004ba5:	c3                   	ret    

c0004ba6 <v2l>:
c0004ba6:	55                   	push   %ebp
c0004ba7:	89 e5                	mov    %esp,%ebp
c0004ba9:	83 ec 18             	sub    $0x18,%esp
c0004bac:	83 ec 0c             	sub    $0xc,%esp
c0004baf:	ff 75 08             	pushl  0x8(%ebp)
c0004bb2:	e8 60 fe ff ff       	call   c0004a17 <pid2proc>
c0004bb7:	83 c4 10             	add    $0x10,%esp
c0004bba:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004bbd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004bc7:	83 ec 08             	sub    $0x8,%esp
c0004bca:	ff 75 f4             	pushl  -0xc(%ebp)
c0004bcd:	50                   	push   %eax
c0004bce:	e8 79 ff ff ff       	call   c0004b4c <Seg2PhyAddrLDT>
c0004bd3:	83 c4 10             	add    $0x10,%esp
c0004bd6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004bd9:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004bdc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004bdf:	01 d0                	add    %edx,%eax
c0004be1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004be4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004be7:	c9                   	leave  
c0004be8:	c3                   	ret    

c0004be9 <init_propt>:
c0004be9:	55                   	push   %ebp
c0004bea:	89 e5                	mov    %esp,%ebp
c0004bec:	83 ec 28             	sub    $0x28,%esp
c0004bef:	6a 0e                	push   $0xe
c0004bf1:	6a 08                	push   $0x8
c0004bf3:	68 6a 16 00 c0       	push   $0xc000166a
c0004bf8:	6a 20                	push   $0x20
c0004bfa:	e8 18 01 00 00       	call   c0004d17 <InitInterruptDesc>
c0004bff:	83 c4 10             	add    $0x10,%esp
c0004c02:	6a 0e                	push   $0xe
c0004c04:	6a 08                	push   $0x8
c0004c06:	68 98 16 00 c0       	push   $0xc0001698
c0004c0b:	6a 21                	push   $0x21
c0004c0d:	e8 05 01 00 00       	call   c0004d17 <InitInterruptDesc>
c0004c12:	83 c4 10             	add    $0x10,%esp
c0004c15:	6a 0e                	push   $0xe
c0004c17:	6a 08                	push   $0x8
c0004c19:	68 dc 16 00 c0       	push   $0xc00016dc
c0004c1e:	6a 2e                	push   $0x2e
c0004c20:	e8 f2 00 00 00       	call   c0004d17 <InitInterruptDesc>
c0004c25:	83 c4 10             	add    $0x10,%esp
c0004c28:	83 ec 04             	sub    $0x4,%esp
c0004c2b:	68 b0 0a 00 00       	push   $0xab0
c0004c30:	6a 00                	push   $0x0
c0004c32:	68 00 33 08 c0       	push   $0xc0083300
c0004c37:	e8 16 67 00 00       	call   c000b352 <Memset>
c0004c3c:	83 c4 10             	add    $0x10,%esp
c0004c3f:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004c46:	83 ec 04             	sub    $0x4,%esp
c0004c49:	ff 75 f4             	pushl  -0xc(%ebp)
c0004c4c:	6a 00                	push   $0x0
c0004c4e:	68 20 16 01 c0       	push   $0xc0011620
c0004c53:	e8 fa 66 00 00       	call   c000b352 <Memset>
c0004c58:	83 c4 10             	add    $0x10,%esp
c0004c5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c5e:	a3 88 16 01 c0       	mov    %eax,0xc0011688
c0004c63:	c7 05 28 16 01 c0 30 	movl   $0x30,0xc0011628
c0004c6a:	00 00 00 
c0004c6d:	83 ec 0c             	sub    $0xc,%esp
c0004c70:	6a 30                	push   $0x30
c0004c72:	e8 94 fe ff ff       	call   c0004b0b <Seg2PhyAddr>
c0004c77:	83 c4 10             	add    $0x10,%esp
c0004c7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004c7d:	c7 45 ec 20 16 01 c0 	movl   $0xc0011620,-0x14(%ebp)
c0004c84:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004c8b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004c8e:	0f b7 d0             	movzwl %ax,%edx
c0004c91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c94:	83 e8 01             	sub    $0x1,%eax
c0004c97:	89 c1                	mov    %eax,%ecx
c0004c99:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004c9c:	52                   	push   %edx
c0004c9d:	51                   	push   %ecx
c0004c9e:	50                   	push   %eax
c0004c9f:	68 a0 f7 00 c0       	push   $0xc000f7a0
c0004ca4:	e8 f5 fd ff ff       	call   c0004a9e <InitDescriptor>
c0004ca9:	83 c4 10             	add    $0x10,%esp
c0004cac:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004cb3:	68 f2 00 00 00       	push   $0xf2
c0004cb8:	68 ff ff 00 00       	push   $0xffff
c0004cbd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004cc0:	68 98 f7 00 c0       	push   $0xc000f798
c0004cc5:	e8 d4 fd ff ff       	call   c0004a9e <InitDescriptor>
c0004cca:	83 c4 10             	add    $0x10,%esp
c0004ccd:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004cd4:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004cdb:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004ce2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004ce5:	0f b7 c0             	movzwl %ax,%eax
c0004ce8:	50                   	push   %eax
c0004ce9:	ff 75 d8             	pushl  -0x28(%ebp)
c0004cec:	6a 00                	push   $0x0
c0004cee:	68 a8 f7 00 c0       	push   $0xc000f7a8
c0004cf3:	e8 a6 fd ff ff       	call   c0004a9e <InitDescriptor>
c0004cf8:	83 c4 10             	add    $0x10,%esp
c0004cfb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004cfe:	0f b7 c0             	movzwl %ax,%eax
c0004d01:	50                   	push   %eax
c0004d02:	ff 75 d8             	pushl  -0x28(%ebp)
c0004d05:	6a 00                	push   $0x0
c0004d07:	68 b0 f7 00 c0       	push   $0xc000f7b0
c0004d0c:	e8 8d fd ff ff       	call   c0004a9e <InitDescriptor>
c0004d11:	83 c4 10             	add    $0x10,%esp
c0004d14:	90                   	nop
c0004d15:	c9                   	leave  
c0004d16:	c3                   	ret    

c0004d17 <InitInterruptDesc>:
c0004d17:	55                   	push   %ebp
c0004d18:	89 e5                	mov    %esp,%ebp
c0004d1a:	83 ec 10             	sub    $0x10,%esp
c0004d1d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d20:	c1 e0 03             	shl    $0x3,%eax
c0004d23:	05 c0 16 01 c0       	add    $0xc00116c0,%eax
c0004d28:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004d2b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d2e:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004d32:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004d35:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004d38:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004d3b:	89 c2                	mov    %eax,%edx
c0004d3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d40:	66 89 10             	mov    %dx,(%eax)
c0004d43:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d46:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004d4c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004d4f:	c1 f8 10             	sar    $0x10,%eax
c0004d52:	89 c2                	mov    %eax,%edx
c0004d54:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d57:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004d5b:	8b 45 10             	mov    0x10(%ebp),%eax
c0004d5e:	c1 e0 04             	shl    $0x4,%eax
c0004d61:	89 c2                	mov    %eax,%edx
c0004d63:	8b 45 14             	mov    0x14(%ebp),%eax
c0004d66:	09 d0                	or     %edx,%eax
c0004d68:	89 c2                	mov    %eax,%edx
c0004d6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d6d:	88 50 05             	mov    %dl,0x5(%eax)
c0004d70:	90                   	nop
c0004d71:	c9                   	leave  
c0004d72:	c3                   	ret    

c0004d73 <ReloadGDT>:
c0004d73:	55                   	push   %ebp
c0004d74:	89 e5                	mov    %esp,%ebp
c0004d76:	83 ec 28             	sub    $0x28,%esp
c0004d79:	b8 a8 16 01 c0       	mov    $0xc00116a8,%eax
c0004d7e:	0f b7 00             	movzwl (%eax),%eax
c0004d81:	98                   	cwtl   
c0004d82:	ba aa 16 01 c0       	mov    $0xc00116aa,%edx
c0004d87:	8b 12                	mov    (%edx),%edx
c0004d89:	83 ec 04             	sub    $0x4,%esp
c0004d8c:	50                   	push   %eax
c0004d8d:	52                   	push   %edx
c0004d8e:	68 60 f7 00 c0       	push   $0xc000f760
c0004d93:	e8 8c 65 00 00       	call   c000b324 <Memcpy>
c0004d98:	83 c4 10             	add    $0x10,%esp
c0004d9b:	c7 45 f0 a8 16 01 c0 	movl   $0xc00116a8,-0x10(%ebp)
c0004da2:	c7 45 ec aa 16 01 c0 	movl   $0xc00116aa,-0x14(%ebp)
c0004da9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004dac:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004db1:	ba 60 f7 00 c0       	mov    $0xc000f760,%edx
c0004db6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004db9:	89 10                	mov    %edx,(%eax)
c0004dbb:	c7 45 e8 28 f7 00 c0 	movl   $0xc000f728,-0x18(%ebp)
c0004dc2:	c7 45 e4 2a f7 00 c0 	movl   $0xc000f72a,-0x1c(%ebp)
c0004dc9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004dcc:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004dd1:	ba c0 16 01 c0       	mov    $0xc00116c0,%edx
c0004dd6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004dd9:	89 10                	mov    %edx,(%eax)
c0004ddb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004de2:	eb 04                	jmp    c0004de8 <ReloadGDT+0x75>
c0004de4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004de8:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004def:	7e f3                	jle    c0004de4 <ReloadGDT+0x71>
c0004df1:	e8 24 31 00 00       	call   c0007f1a <init_internal_interrupt>
c0004df6:	e8 ee fd ff ff       	call   c0004be9 <init_propt>
c0004dfb:	90                   	nop
c0004dfc:	c9                   	leave  
c0004dfd:	c3                   	ret    

c0004dfe <select_console>:
c0004dfe:	55                   	push   %ebp
c0004dff:	89 e5                	mov    %esp,%ebp
c0004e01:	83 ec 18             	sub    $0x18,%esp
c0004e04:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e07:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004e0a:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c0004e0e:	77 27                	ja     c0004e37 <select_console+0x39>
c0004e10:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004e14:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004e1a:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0004e1f:	a3 20 f7 00 c0       	mov    %eax,0xc000f720
c0004e24:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0004e29:	83 ec 0c             	sub    $0xc,%esp
c0004e2c:	50                   	push   %eax
c0004e2d:	e8 08 00 00 00       	call   c0004e3a <flush>
c0004e32:	83 c4 10             	add    $0x10,%esp
c0004e35:	eb 01                	jmp    c0004e38 <select_console+0x3a>
c0004e37:	90                   	nop
c0004e38:	c9                   	leave  
c0004e39:	c3                   	ret    

c0004e3a <flush>:
c0004e3a:	55                   	push   %ebp
c0004e3b:	89 e5                	mov    %esp,%ebp
c0004e3d:	83 ec 08             	sub    $0x8,%esp
c0004e40:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e43:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e49:	8b 40 0c             	mov    0xc(%eax),%eax
c0004e4c:	83 ec 0c             	sub    $0xc,%esp
c0004e4f:	50                   	push   %eax
c0004e50:	e8 1e 00 00 00       	call   c0004e73 <set_cursor>
c0004e55:	83 c4 10             	add    $0x10,%esp
c0004e58:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e5b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e61:	8b 40 08             	mov    0x8(%eax),%eax
c0004e64:	83 ec 0c             	sub    $0xc,%esp
c0004e67:	50                   	push   %eax
c0004e68:	e8 64 00 00 00       	call   c0004ed1 <set_console_start_video_addr>
c0004e6d:	83 c4 10             	add    $0x10,%esp
c0004e70:	90                   	nop
c0004e71:	c9                   	leave  
c0004e72:	c3                   	ret    

c0004e73 <set_cursor>:
c0004e73:	55                   	push   %ebp
c0004e74:	89 e5                	mov    %esp,%ebp
c0004e76:	83 ec 08             	sub    $0x8,%esp
c0004e79:	83 ec 08             	sub    $0x8,%esp
c0004e7c:	6a 0e                	push   $0xe
c0004e7e:	68 d4 03 00 00       	push   $0x3d4
c0004e83:	e8 06 c9 ff ff       	call   c000178e <out_byte>
c0004e88:	83 c4 10             	add    $0x10,%esp
c0004e8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e8e:	c1 e8 08             	shr    $0x8,%eax
c0004e91:	0f b7 c0             	movzwl %ax,%eax
c0004e94:	83 ec 08             	sub    $0x8,%esp
c0004e97:	50                   	push   %eax
c0004e98:	68 d5 03 00 00       	push   $0x3d5
c0004e9d:	e8 ec c8 ff ff       	call   c000178e <out_byte>
c0004ea2:	83 c4 10             	add    $0x10,%esp
c0004ea5:	83 ec 08             	sub    $0x8,%esp
c0004ea8:	6a 0f                	push   $0xf
c0004eaa:	68 d4 03 00 00       	push   $0x3d4
c0004eaf:	e8 da c8 ff ff       	call   c000178e <out_byte>
c0004eb4:	83 c4 10             	add    $0x10,%esp
c0004eb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eba:	0f b7 c0             	movzwl %ax,%eax
c0004ebd:	83 ec 08             	sub    $0x8,%esp
c0004ec0:	50                   	push   %eax
c0004ec1:	68 d5 03 00 00       	push   $0x3d5
c0004ec6:	e8 c3 c8 ff ff       	call   c000178e <out_byte>
c0004ecb:	83 c4 10             	add    $0x10,%esp
c0004ece:	90                   	nop
c0004ecf:	c9                   	leave  
c0004ed0:	c3                   	ret    

c0004ed1 <set_console_start_video_addr>:
c0004ed1:	55                   	push   %ebp
c0004ed2:	89 e5                	mov    %esp,%ebp
c0004ed4:	83 ec 08             	sub    $0x8,%esp
c0004ed7:	83 ec 08             	sub    $0x8,%esp
c0004eda:	6a 0c                	push   $0xc
c0004edc:	68 d4 03 00 00       	push   $0x3d4
c0004ee1:	e8 a8 c8 ff ff       	call   c000178e <out_byte>
c0004ee6:	83 c4 10             	add    $0x10,%esp
c0004ee9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eec:	c1 e8 08             	shr    $0x8,%eax
c0004eef:	0f b7 c0             	movzwl %ax,%eax
c0004ef2:	83 ec 08             	sub    $0x8,%esp
c0004ef5:	50                   	push   %eax
c0004ef6:	68 d5 03 00 00       	push   $0x3d5
c0004efb:	e8 8e c8 ff ff       	call   c000178e <out_byte>
c0004f00:	83 c4 10             	add    $0x10,%esp
c0004f03:	83 ec 08             	sub    $0x8,%esp
c0004f06:	6a 0d                	push   $0xd
c0004f08:	68 d4 03 00 00       	push   $0x3d4
c0004f0d:	e8 7c c8 ff ff       	call   c000178e <out_byte>
c0004f12:	83 c4 10             	add    $0x10,%esp
c0004f15:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f18:	0f b7 c0             	movzwl %ax,%eax
c0004f1b:	83 ec 08             	sub    $0x8,%esp
c0004f1e:	50                   	push   %eax
c0004f1f:	68 d5 03 00 00       	push   $0x3d5
c0004f24:	e8 65 c8 ff ff       	call   c000178e <out_byte>
c0004f29:	83 c4 10             	add    $0x10,%esp
c0004f2c:	90                   	nop
c0004f2d:	c9                   	leave  
c0004f2e:	c3                   	ret    

c0004f2f <put_key>:
c0004f2f:	55                   	push   %ebp
c0004f30:	89 e5                	mov    %esp,%ebp
c0004f32:	83 ec 04             	sub    $0x4,%esp
c0004f35:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f38:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004f3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f3e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f44:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004f49:	77 4d                	ja     c0004f98 <put_key+0x69>
c0004f4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f4e:	8b 00                	mov    (%eax),%eax
c0004f50:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004f54:	89 10                	mov    %edx,(%eax)
c0004f56:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f59:	8b 00                	mov    (%eax),%eax
c0004f5b:	8d 50 04             	lea    0x4(%eax),%edx
c0004f5e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f61:	89 10                	mov    %edx,(%eax)
c0004f63:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f66:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f6c:	8d 50 01             	lea    0x1(%eax),%edx
c0004f6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f72:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004f78:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f7b:	8b 00                	mov    (%eax),%eax
c0004f7d:	8b 55 08             	mov    0x8(%ebp),%edx
c0004f80:	83 c2 08             	add    $0x8,%edx
c0004f83:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004f89:	39 d0                	cmp    %edx,%eax
c0004f8b:	75 0b                	jne    c0004f98 <put_key+0x69>
c0004f8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f90:	8d 50 08             	lea    0x8(%eax),%edx
c0004f93:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f96:	89 10                	mov    %edx,(%eax)
c0004f98:	90                   	nop
c0004f99:	c9                   	leave  
c0004f9a:	c3                   	ret    

c0004f9b <scroll_up>:
c0004f9b:	55                   	push   %ebp
c0004f9c:	89 e5                	mov    %esp,%ebp
c0004f9e:	83 ec 08             	sub    $0x8,%esp
c0004fa1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004faa:	8b 40 08             	mov    0x8(%eax),%eax
c0004fad:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004fb0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fb9:	8b 00                	mov    (%eax),%eax
c0004fbb:	39 c2                	cmp    %eax,%edx
c0004fbd:	76 1b                	jbe    c0004fda <scroll_up+0x3f>
c0004fbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fc2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fc8:	8b 40 08             	mov    0x8(%eax),%eax
c0004fcb:	83 e8 50             	sub    $0x50,%eax
c0004fce:	83 ec 0c             	sub    $0xc,%esp
c0004fd1:	50                   	push   %eax
c0004fd2:	e8 fa fe ff ff       	call   c0004ed1 <set_console_start_video_addr>
c0004fd7:	83 c4 10             	add    $0x10,%esp
c0004fda:	90                   	nop
c0004fdb:	c9                   	leave  
c0004fdc:	c3                   	ret    

c0004fdd <scroll_down>:
c0004fdd:	55                   	push   %ebp
c0004fde:	89 e5                	mov    %esp,%ebp
c0004fe0:	83 ec 08             	sub    $0x8,%esp
c0004fe3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fe6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fec:	8b 40 08             	mov    0x8(%eax),%eax
c0004fef:	8d 48 50             	lea    0x50(%eax),%ecx
c0004ff2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ff5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ffb:	8b 10                	mov    (%eax),%edx
c0004ffd:	8b 45 08             	mov    0x8(%ebp),%eax
c0005000:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005006:	8b 40 04             	mov    0x4(%eax),%eax
c0005009:	01 d0                	add    %edx,%eax
c000500b:	39 c1                	cmp    %eax,%ecx
c000500d:	73 36                	jae    c0005045 <scroll_down+0x68>
c000500f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005012:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005018:	8b 40 08             	mov    0x8(%eax),%eax
c000501b:	83 c0 50             	add    $0x50,%eax
c000501e:	83 ec 0c             	sub    $0xc,%esp
c0005021:	50                   	push   %eax
c0005022:	e8 aa fe ff ff       	call   c0004ed1 <set_console_start_video_addr>
c0005027:	83 c4 10             	add    $0x10,%esp
c000502a:	8b 45 08             	mov    0x8(%ebp),%eax
c000502d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005033:	8b 50 08             	mov    0x8(%eax),%edx
c0005036:	8b 45 08             	mov    0x8(%ebp),%eax
c0005039:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000503f:	83 c2 50             	add    $0x50,%edx
c0005042:	89 50 08             	mov    %edx,0x8(%eax)
c0005045:	90                   	nop
c0005046:	c9                   	leave  
c0005047:	c3                   	ret    

c0005048 <out_char>:
c0005048:	55                   	push   %ebp
c0005049:	89 e5                	mov    %esp,%ebp
c000504b:	83 ec 28             	sub    $0x28,%esp
c000504e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005051:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0005054:	8b 45 08             	mov    0x8(%ebp),%eax
c0005057:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000505d:	8b 40 0c             	mov    0xc(%eax),%eax
c0005060:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0005065:	01 c0                	add    %eax,%eax
c0005067:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000506a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c000506e:	83 f8 08             	cmp    $0x8,%eax
c0005071:	0f 84 8d 00 00 00    	je     c0005104 <out_char+0xbc>
c0005077:	83 f8 0a             	cmp    $0xa,%eax
c000507a:	0f 85 c9 00 00 00    	jne    c0005149 <out_char+0x101>
c0005080:	8b 45 08             	mov    0x8(%ebp),%eax
c0005083:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005089:	8b 50 0c             	mov    0xc(%eax),%edx
c000508c:	8b 45 08             	mov    0x8(%ebp),%eax
c000508f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005095:	8b 08                	mov    (%eax),%ecx
c0005097:	8b 45 08             	mov    0x8(%ebp),%eax
c000509a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050a0:	8b 40 04             	mov    0x4(%eax),%eax
c00050a3:	01 c8                	add    %ecx,%eax
c00050a5:	83 e8 50             	sub    $0x50,%eax
c00050a8:	39 c2                	cmp    %eax,%edx
c00050aa:	0f 83 f4 00 00 00    	jae    c00051a4 <out_char+0x15c>
c00050b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00050b3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050b9:	8b 08                	mov    (%eax),%ecx
c00050bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00050be:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050c4:	8b 50 0c             	mov    0xc(%eax),%edx
c00050c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050d0:	8b 00                	mov    (%eax),%eax
c00050d2:	29 c2                	sub    %eax,%edx
c00050d4:	89 d0                	mov    %edx,%eax
c00050d6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c00050db:	f7 e2                	mul    %edx
c00050dd:	89 d0                	mov    %edx,%eax
c00050df:	c1 e8 06             	shr    $0x6,%eax
c00050e2:	8d 50 01             	lea    0x1(%eax),%edx
c00050e5:	89 d0                	mov    %edx,%eax
c00050e7:	c1 e0 02             	shl    $0x2,%eax
c00050ea:	01 d0                	add    %edx,%eax
c00050ec:	c1 e0 04             	shl    $0x4,%eax
c00050ef:	89 c2                	mov    %eax,%edx
c00050f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00050f4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050fa:	01 ca                	add    %ecx,%edx
c00050fc:	89 50 0c             	mov    %edx,0xc(%eax)
c00050ff:	e9 a0 00 00 00       	jmp    c00051a4 <out_char+0x15c>
c0005104:	8b 45 08             	mov    0x8(%ebp),%eax
c0005107:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000510d:	8b 50 0c             	mov    0xc(%eax),%edx
c0005110:	8b 45 08             	mov    0x8(%ebp),%eax
c0005113:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005119:	8b 00                	mov    (%eax),%eax
c000511b:	39 c2                	cmp    %eax,%edx
c000511d:	0f 86 84 00 00 00    	jbe    c00051a7 <out_char+0x15f>
c0005123:	8b 45 08             	mov    0x8(%ebp),%eax
c0005126:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000512c:	8b 50 0c             	mov    0xc(%eax),%edx
c000512f:	83 ea 01             	sub    $0x1,%edx
c0005132:	89 50 0c             	mov    %edx,0xc(%eax)
c0005135:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005138:	83 e8 02             	sub    $0x2,%eax
c000513b:	c6 00 20             	movb   $0x20,(%eax)
c000513e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005141:	83 e8 01             	sub    $0x1,%eax
c0005144:	c6 00 00             	movb   $0x0,(%eax)
c0005147:	eb 5e                	jmp    c00051a7 <out_char+0x15f>
c0005149:	8b 45 08             	mov    0x8(%ebp),%eax
c000514c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005152:	8b 40 0c             	mov    0xc(%eax),%eax
c0005155:	8d 48 01             	lea    0x1(%eax),%ecx
c0005158:	8b 45 08             	mov    0x8(%ebp),%eax
c000515b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005161:	8b 10                	mov    (%eax),%edx
c0005163:	8b 45 08             	mov    0x8(%ebp),%eax
c0005166:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000516c:	8b 40 04             	mov    0x4(%eax),%eax
c000516f:	01 d0                	add    %edx,%eax
c0005171:	39 c1                	cmp    %eax,%ecx
c0005173:	73 35                	jae    c00051aa <out_char+0x162>
c0005175:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005178:	8d 50 01             	lea    0x1(%eax),%edx
c000517b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000517e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0005182:	88 10                	mov    %dl,(%eax)
c0005184:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005187:	8d 50 01             	lea    0x1(%eax),%edx
c000518a:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000518d:	c6 00 0a             	movb   $0xa,(%eax)
c0005190:	8b 45 08             	mov    0x8(%ebp),%eax
c0005193:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005199:	8b 50 0c             	mov    0xc(%eax),%edx
c000519c:	83 c2 01             	add    $0x1,%edx
c000519f:	89 50 0c             	mov    %edx,0xc(%eax)
c00051a2:	eb 06                	jmp    c00051aa <out_char+0x162>
c00051a4:	90                   	nop
c00051a5:	eb 14                	jmp    c00051bb <out_char+0x173>
c00051a7:	90                   	nop
c00051a8:	eb 11                	jmp    c00051bb <out_char+0x173>
c00051aa:	90                   	nop
c00051ab:	eb 0e                	jmp    c00051bb <out_char+0x173>
c00051ad:	83 ec 0c             	sub    $0xc,%esp
c00051b0:	ff 75 08             	pushl  0x8(%ebp)
c00051b3:	e8 25 fe ff ff       	call   c0004fdd <scroll_down>
c00051b8:	83 c4 10             	add    $0x10,%esp
c00051bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00051be:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051c4:	8b 50 0c             	mov    0xc(%eax),%edx
c00051c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00051ca:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051d0:	8b 40 08             	mov    0x8(%eax),%eax
c00051d3:	29 c2                	sub    %eax,%edx
c00051d5:	89 d0                	mov    %edx,%eax
c00051d7:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c00051dc:	77 cf                	ja     c00051ad <out_char+0x165>
c00051de:	83 ec 0c             	sub    $0xc,%esp
c00051e1:	ff 75 08             	pushl  0x8(%ebp)
c00051e4:	e8 51 fc ff ff       	call   c0004e3a <flush>
c00051e9:	83 c4 10             	add    $0x10,%esp
c00051ec:	90                   	nop
c00051ed:	c9                   	leave  
c00051ee:	c3                   	ret    

c00051ef <tty_dev_read>:
c00051ef:	55                   	push   %ebp
c00051f0:	89 e5                	mov    %esp,%ebp
c00051f2:	83 ec 08             	sub    $0x8,%esp
c00051f5:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c00051fa:	39 45 08             	cmp    %eax,0x8(%ebp)
c00051fd:	75 17                	jne    c0005216 <tty_dev_read+0x27>
c00051ff:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005204:	85 c0                	test   %eax,%eax
c0005206:	7e 0e                	jle    c0005216 <tty_dev_read+0x27>
c0005208:	83 ec 0c             	sub    $0xc,%esp
c000520b:	ff 75 08             	pushl  0x8(%ebp)
c000520e:	e8 84 07 00 00       	call   c0005997 <keyboard_read>
c0005213:	83 c4 10             	add    $0x10,%esp
c0005216:	90                   	nop
c0005217:	c9                   	leave  
c0005218:	c3                   	ret    

c0005219 <tty_dev_write>:
c0005219:	55                   	push   %ebp
c000521a:	89 e5                	mov    %esp,%ebp
c000521c:	83 ec 28             	sub    $0x28,%esp
c000521f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005222:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005228:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000522b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005232:	e9 88 01 00 00       	jmp    c00053bf <tty_dev_write+0x1a6>
c0005237:	8b 45 08             	mov    0x8(%ebp),%eax
c000523a:	8b 40 04             	mov    0x4(%eax),%eax
c000523d:	8b 00                	mov    (%eax),%eax
c000523f:	88 45 e7             	mov    %al,-0x19(%ebp)
c0005242:	8b 45 08             	mov    0x8(%ebp),%eax
c0005245:	8b 40 04             	mov    0x4(%eax),%eax
c0005248:	8d 50 04             	lea    0x4(%eax),%edx
c000524b:	8b 45 08             	mov    0x8(%ebp),%eax
c000524e:	89 50 04             	mov    %edx,0x4(%eax)
c0005251:	8b 45 08             	mov    0x8(%ebp),%eax
c0005254:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000525a:	8d 50 ff             	lea    -0x1(%eax),%edx
c000525d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005260:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0005266:	8b 45 08             	mov    0x8(%ebp),%eax
c0005269:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000526f:	8d 50 01             	lea    0x1(%eax),%edx
c0005272:	8b 45 08             	mov    0x8(%ebp),%eax
c0005275:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000527b:	8b 45 08             	mov    0x8(%ebp),%eax
c000527e:	8b 40 04             	mov    0x4(%eax),%eax
c0005281:	8b 55 08             	mov    0x8(%ebp),%edx
c0005284:	83 c2 08             	add    $0x8,%edx
c0005287:	81 c2 00 08 00 00    	add    $0x800,%edx
c000528d:	39 d0                	cmp    %edx,%eax
c000528f:	75 0c                	jne    c000529d <tty_dev_write+0x84>
c0005291:	8b 45 08             	mov    0x8(%ebp),%eax
c0005294:	8d 50 08             	lea    0x8(%eax),%edx
c0005297:	8b 45 08             	mov    0x8(%ebp),%eax
c000529a:	89 50 04             	mov    %edx,0x4(%eax)
c000529d:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a0:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00052a6:	85 c0                	test   %eax,%eax
c00052a8:	0f 84 11 01 00 00    	je     c00053bf <tty_dev_write+0x1a6>
c00052ae:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052b2:	3c 20                	cmp    $0x20,%al
c00052b4:	76 08                	jbe    c00052be <tty_dev_write+0xa5>
c00052b6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052ba:	3c 7e                	cmp    $0x7e,%al
c00052bc:	76 10                	jbe    c00052ce <tty_dev_write+0xb5>
c00052be:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052c2:	3c 20                	cmp    $0x20,%al
c00052c4:	74 08                	je     c00052ce <tty_dev_write+0xb5>
c00052c6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052ca:	84 c0                	test   %al,%al
c00052cc:	75 58                	jne    c0005326 <tty_dev_write+0x10d>
c00052ce:	8b 45 08             	mov    0x8(%ebp),%eax
c00052d1:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c00052d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00052da:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00052e0:	01 d0                	add    %edx,%eax
c00052e2:	83 e8 01             	sub    $0x1,%eax
c00052e5:	89 c2                	mov    %eax,%edx
c00052e7:	83 ec 04             	sub    $0x4,%esp
c00052ea:	6a 01                	push   $0x1
c00052ec:	8d 45 e7             	lea    -0x19(%ebp),%eax
c00052ef:	50                   	push   %eax
c00052f0:	52                   	push   %edx
c00052f1:	e8 2e 60 00 00       	call   c000b324 <Memcpy>
c00052f6:	83 c4 10             	add    $0x10,%esp
c00052f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00052fc:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005302:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005305:	8b 45 08             	mov    0x8(%ebp),%eax
c0005308:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000530e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005312:	0f b6 c0             	movzbl %al,%eax
c0005315:	83 ec 08             	sub    $0x8,%esp
c0005318:	50                   	push   %eax
c0005319:	ff 75 08             	pushl  0x8(%ebp)
c000531c:	e8 27 fd ff ff       	call   c0005048 <out_char>
c0005321:	83 c4 10             	add    $0x10,%esp
c0005324:	eb 7c                	jmp    c00053a2 <tty_dev_write+0x189>
c0005326:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000532a:	3c 08                	cmp    $0x8,%al
c000532c:	75 42                	jne    c0005370 <tty_dev_write+0x157>
c000532e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005331:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005337:	8d 50 01             	lea    0x1(%eax),%edx
c000533a:	8b 45 08             	mov    0x8(%ebp),%eax
c000533d:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005343:	8b 45 08             	mov    0x8(%ebp),%eax
c0005346:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000534c:	8d 50 fe             	lea    -0x2(%eax),%edx
c000534f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005352:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005358:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000535c:	0f b6 c0             	movzbl %al,%eax
c000535f:	83 ec 08             	sub    $0x8,%esp
c0005362:	50                   	push   %eax
c0005363:	ff 75 08             	pushl  0x8(%ebp)
c0005366:	e8 dd fc ff ff       	call   c0005048 <out_char>
c000536b:	83 c4 10             	add    $0x10,%esp
c000536e:	eb 32                	jmp    c00053a2 <tty_dev_write+0x189>
c0005370:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005374:	3c 0a                	cmp    $0xa,%al
c0005376:	75 2a                	jne    c00053a2 <tty_dev_write+0x189>
c0005378:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000537c:	0f b6 c0             	movzbl %al,%eax
c000537f:	83 ec 08             	sub    $0x8,%esp
c0005382:	50                   	push   %eax
c0005383:	ff 75 08             	pushl  0x8(%ebp)
c0005386:	e8 bd fc ff ff       	call   c0005048 <out_char>
c000538b:	83 c4 10             	add    $0x10,%esp
c000538e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005391:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0005398:	00 00 00 
c000539b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00053a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00053a5:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00053ab:	8b 45 08             	mov    0x8(%ebp),%eax
c00053ae:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00053b4:	39 c2                	cmp    %eax,%edx
c00053b6:	75 07                	jne    c00053bf <tty_dev_write+0x1a6>
c00053b8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00053bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00053c2:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00053c8:	85 c0                	test   %eax,%eax
c00053ca:	0f 85 67 fe ff ff    	jne    c0005237 <tty_dev_write+0x1e>
c00053d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00053d4:	74 5c                	je     c0005432 <tty_dev_write+0x219>
c00053d6:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c00053dd:	83 ec 0c             	sub    $0xc,%esp
c00053e0:	ff 75 ec             	pushl  -0x14(%ebp)
c00053e3:	e8 e1 1a 00 00       	call   c0006ec9 <sys_malloc>
c00053e8:	83 c4 10             	add    $0x10,%esp
c00053eb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00053ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00053f1:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c00053f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00053fb:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005401:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005404:	89 50 50             	mov    %edx,0x50(%eax)
c0005407:	8b 45 08             	mov    0x8(%ebp),%eax
c000540a:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c0005410:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005413:	89 50 58             	mov    %edx,0x58(%eax)
c0005416:	8b 45 08             	mov    0x8(%ebp),%eax
c0005419:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000541f:	83 ec 04             	sub    $0x4,%esp
c0005422:	50                   	push   %eax
c0005423:	ff 75 e8             	pushl  -0x18(%ebp)
c0005426:	6a 01                	push   $0x1
c0005428:	e8 36 46 00 00       	call   c0009a63 <send_rec>
c000542d:	83 c4 10             	add    $0x10,%esp
c0005430:	eb 01                	jmp    c0005433 <tty_dev_write+0x21a>
c0005432:	90                   	nop
c0005433:	c9                   	leave  
c0005434:	c3                   	ret    

c0005435 <tty_do_read>:
c0005435:	55                   	push   %ebp
c0005436:	89 e5                	mov    %esp,%ebp
c0005438:	83 ec 08             	sub    $0x8,%esp
c000543b:	8b 45 08             	mov    0x8(%ebp),%eax
c000543e:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005445:	00 00 00 
c0005448:	8b 45 0c             	mov    0xc(%ebp),%eax
c000544b:	8b 50 58             	mov    0x58(%eax),%edx
c000544e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005451:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0005457:	8b 45 0c             	mov    0xc(%ebp),%eax
c000545a:	8b 00                	mov    (%eax),%eax
c000545c:	89 c2                	mov    %eax,%edx
c000545e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005461:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0005467:	8b 45 0c             	mov    0xc(%ebp),%eax
c000546a:	8b 50 50             	mov    0x50(%eax),%edx
c000546d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005470:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005476:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005479:	8b 50 50             	mov    0x50(%eax),%edx
c000547c:	8b 45 08             	mov    0x8(%ebp),%eax
c000547f:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005485:	8b 45 08             	mov    0x8(%ebp),%eax
c0005488:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c000548e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005491:	8b 40 10             	mov    0x10(%eax),%eax
c0005494:	83 ec 08             	sub    $0x8,%esp
c0005497:	52                   	push   %edx
c0005498:	50                   	push   %eax
c0005499:	e8 ea 18 00 00       	call   c0006d88 <alloc_virtual_memory>
c000549e:	83 c4 10             	add    $0x10,%esp
c00054a1:	89 c2                	mov    %eax,%edx
c00054a3:	8b 45 08             	mov    0x8(%ebp),%eax
c00054a6:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00054ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00054af:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00054b5:	83 f8 04             	cmp    $0x4,%eax
c00054b8:	74 1c                	je     c00054d6 <tty_do_read+0xa1>
c00054ba:	68 27 01 00 00       	push   $0x127
c00054bf:	68 45 ab 00 c0       	push   $0xc000ab45
c00054c4:	68 45 ab 00 c0       	push   $0xc000ab45
c00054c9:	68 4f ab 00 c0       	push   $0xc000ab4f
c00054ce:	e8 45 3d 00 00       	call   c0009218 <assertion_failure>
c00054d3:	83 c4 10             	add    $0x10,%esp
c00054d6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054d9:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c00054e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00054e3:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00054e9:	83 ec 04             	sub    $0x4,%esp
c00054ec:	50                   	push   %eax
c00054ed:	ff 75 0c             	pushl  0xc(%ebp)
c00054f0:	6a 01                	push   $0x1
c00054f2:	e8 6c 45 00 00       	call   c0009a63 <send_rec>
c00054f7:	83 c4 10             	add    $0x10,%esp
c00054fa:	90                   	nop
c00054fb:	c9                   	leave  
c00054fc:	c3                   	ret    

c00054fd <tty_do_write>:
c00054fd:	55                   	push   %ebp
c00054fe:	89 e5                	mov    %esp,%ebp
c0005500:	53                   	push   %ebx
c0005501:	83 ec 24             	sub    $0x24,%esp
c0005504:	89 e0                	mov    %esp,%eax
c0005506:	89 c3                	mov    %eax,%ebx
c0005508:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000550f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005512:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005515:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005518:	89 c2                	mov    %eax,%edx
c000551a:	b8 10 00 00 00       	mov    $0x10,%eax
c000551f:	83 e8 01             	sub    $0x1,%eax
c0005522:	01 d0                	add    %edx,%eax
c0005524:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005529:	ba 00 00 00 00       	mov    $0x0,%edx
c000552e:	f7 f1                	div    %ecx
c0005530:	6b c0 10             	imul   $0x10,%eax,%eax
c0005533:	29 c4                	sub    %eax,%esp
c0005535:	89 e0                	mov    %esp,%eax
c0005537:	83 c0 00             	add    $0x0,%eax
c000553a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000553d:	83 ec 04             	sub    $0x4,%esp
c0005540:	ff 75 e8             	pushl  -0x18(%ebp)
c0005543:	6a 00                	push   $0x0
c0005545:	ff 75 e0             	pushl  -0x20(%ebp)
c0005548:	e8 05 5e 00 00       	call   c000b352 <Memset>
c000554d:	83 c4 10             	add    $0x10,%esp
c0005550:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005553:	8b 40 50             	mov    0x50(%eax),%eax
c0005556:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005559:	8b 45 08             	mov    0x8(%ebp),%eax
c000555c:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005563:	00 00 00 
c0005566:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005569:	8b 45 0c             	mov    0xc(%ebp),%eax
c000556c:	8b 40 10             	mov    0x10(%eax),%eax
c000556f:	83 ec 08             	sub    $0x8,%esp
c0005572:	52                   	push   %edx
c0005573:	50                   	push   %eax
c0005574:	e8 0f 18 00 00       	call   c0006d88 <alloc_virtual_memory>
c0005579:	83 c4 10             	add    $0x10,%esp
c000557c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000557f:	eb 7e                	jmp    c00055ff <tty_do_write+0x102>
c0005581:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005584:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005587:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c000558b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000558e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005591:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005597:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000559a:	01 d0                	add    %edx,%eax
c000559c:	83 ec 04             	sub    $0x4,%esp
c000559f:	ff 75 f0             	pushl  -0x10(%ebp)
c00055a2:	50                   	push   %eax
c00055a3:	ff 75 e0             	pushl  -0x20(%ebp)
c00055a6:	e8 79 5d 00 00       	call   c000b324 <Memcpy>
c00055ab:	83 c4 10             	add    $0x10,%esp
c00055ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055b1:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00055b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00055b7:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055c0:	01 c2                	add    %eax,%edx
c00055c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00055c5:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00055cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00055d2:	eb 25                	jmp    c00055f9 <tty_do_write+0xfc>
c00055d4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00055d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00055da:	01 d0                	add    %edx,%eax
c00055dc:	0f b6 00             	movzbl (%eax),%eax
c00055df:	0f b6 c0             	movzbl %al,%eax
c00055e2:	83 ec 08             	sub    $0x8,%esp
c00055e5:	50                   	push   %eax
c00055e6:	ff 75 08             	pushl  0x8(%ebp)
c00055e9:	e8 5a fa ff ff       	call   c0005048 <out_char>
c00055ee:	83 c4 10             	add    $0x10,%esp
c00055f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00055f5:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c00055f9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00055fd:	75 d5                	jne    c00055d4 <tty_do_write+0xd7>
c00055ff:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005603:	0f 85 78 ff ff ff    	jne    c0005581 <tty_do_write+0x84>
c0005609:	83 ec 0c             	sub    $0xc,%esp
c000560c:	6a 6c                	push   $0x6c
c000560e:	e8 b6 18 00 00       	call   c0006ec9 <sys_malloc>
c0005613:	83 c4 10             	add    $0x10,%esp
c0005616:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005619:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000561c:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0005623:	8b 45 08             	mov    0x8(%ebp),%eax
c0005626:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000562c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000562f:	89 50 48             	mov    %edx,0x48(%eax)
c0005632:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005635:	8b 00                	mov    (%eax),%eax
c0005637:	83 ec 04             	sub    $0x4,%esp
c000563a:	50                   	push   %eax
c000563b:	ff 75 d8             	pushl  -0x28(%ebp)
c000563e:	6a 01                	push   $0x1
c0005640:	e8 1e 44 00 00       	call   c0009a63 <send_rec>
c0005645:	83 c4 10             	add    $0x10,%esp
c0005648:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000564b:	83 ec 08             	sub    $0x8,%esp
c000564e:	6a 6c                	push   $0x6c
c0005650:	50                   	push   %eax
c0005651:	e8 52 1b 00 00       	call   c00071a8 <sys_free>
c0005656:	83 c4 10             	add    $0x10,%esp
c0005659:	89 dc                	mov    %ebx,%esp
c000565b:	90                   	nop
c000565c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000565f:	c9                   	leave  
c0005660:	c3                   	ret    

c0005661 <init_screen>:
c0005661:	55                   	push   %ebp
c0005662:	89 e5                	mov    %esp,%ebp
c0005664:	83 ec 10             	sub    $0x10,%esp
c0005667:	8b 45 08             	mov    0x8(%ebp),%eax
c000566a:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c000566f:	c1 f8 03             	sar    $0x3,%eax
c0005672:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005678:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000567b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000567e:	c1 e0 04             	shl    $0x4,%eax
c0005681:	8d 90 00 1f 01 c0    	lea    -0x3ffee100(%eax),%edx
c0005687:	8b 45 08             	mov    0x8(%ebp),%eax
c000568a:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c0005690:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0005697:	8b 45 08             	mov    0x8(%ebp),%eax
c000569a:	8b 88 24 08 00 00    	mov    0x824(%eax),%ecx
c00056a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00056a3:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c00056a8:	f7 e2                	mul    %edx
c00056aa:	89 d0                	mov    %edx,%eax
c00056ac:	d1 e8                	shr    %eax
c00056ae:	89 41 04             	mov    %eax,0x4(%ecx)
c00056b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00056b4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056ba:	8b 50 04             	mov    0x4(%eax),%edx
c00056bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00056c0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056c6:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00056ca:	89 10                	mov    %edx,(%eax)
c00056cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00056cf:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c00056d5:	8b 45 08             	mov    0x8(%ebp),%eax
c00056d8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056de:	8b 12                	mov    (%edx),%edx
c00056e0:	89 50 08             	mov    %edx,0x8(%eax)
c00056e3:	8b 55 08             	mov    0x8(%ebp),%edx
c00056e6:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c00056ec:	8b 40 08             	mov    0x8(%eax),%eax
c00056ef:	89 42 0c             	mov    %eax,0xc(%edx)
c00056f2:	90                   	nop
c00056f3:	c9                   	leave  
c00056f4:	c3                   	ret    

c00056f5 <init_tty>:
c00056f5:	55                   	push   %ebp
c00056f6:	89 e5                	mov    %esp,%ebp
c00056f8:	83 ec 18             	sub    $0x18,%esp
c00056fb:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c0005702:	e9 92 00 00 00       	jmp    c0005799 <init_tty+0xa4>
c0005707:	83 ec 04             	sub    $0x4,%esp
c000570a:	68 28 08 00 00       	push   $0x828
c000570f:	6a 00                	push   $0x0
c0005711:	ff 75 f4             	pushl  -0xc(%ebp)
c0005714:	e8 39 5c 00 00       	call   c000b352 <Memset>
c0005719:	83 c4 10             	add    $0x10,%esp
c000571c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000571f:	8d 50 08             	lea    0x8(%eax),%edx
c0005722:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005725:	89 50 04             	mov    %edx,0x4(%eax)
c0005728:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000572b:	8b 50 04             	mov    0x4(%eax),%edx
c000572e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005731:	89 10                	mov    %edx,(%eax)
c0005733:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005736:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c000573d:	00 00 00 
c0005740:	83 ec 0c             	sub    $0xc,%esp
c0005743:	ff 75 f4             	pushl  -0xc(%ebp)
c0005746:	e8 16 ff ff ff       	call   c0005661 <init_screen>
c000574b:	83 c4 10             	add    $0x10,%esp
c000574e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005751:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0005756:	85 c0                	test   %eax,%eax
c0005758:	7e 38                	jle    c0005792 <init_tty+0x9d>
c000575a:	83 ec 08             	sub    $0x8,%esp
c000575d:	6a 23                	push   $0x23
c000575f:	ff 75 f4             	pushl  -0xc(%ebp)
c0005762:	e8 e1 f8 ff ff       	call   c0005048 <out_char>
c0005767:	83 c4 10             	add    $0x10,%esp
c000576a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000576d:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005772:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0005777:	c1 f8 03             	sar    $0x3,%eax
c000577a:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005780:	0f b6 c0             	movzbl %al,%eax
c0005783:	83 ec 08             	sub    $0x8,%esp
c0005786:	50                   	push   %eax
c0005787:	ff 75 f4             	pushl  -0xc(%ebp)
c000578a:	e8 b9 f8 ff ff       	call   c0005048 <out_char>
c000578f:	83 c4 10             	add    $0x10,%esp
c0005792:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005799:	b8 18 16 01 c0       	mov    $0xc0011618,%eax
c000579e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00057a1:	0f 82 60 ff ff ff    	jb     c0005707 <init_tty+0x12>
c00057a7:	90                   	nop
c00057a8:	c9                   	leave  
c00057a9:	c3                   	ret    

c00057aa <TaskTTY>:
c00057aa:	55                   	push   %ebp
c00057ab:	89 e5                	mov    %esp,%ebp
c00057ad:	83 ec 28             	sub    $0x28,%esp
c00057b0:	e8 40 ff ff ff       	call   c00056f5 <init_tty>
c00057b5:	83 ec 0c             	sub    $0xc,%esp
c00057b8:	6a 00                	push   $0x0
c00057ba:	e8 3f f6 ff ff       	call   c0004dfe <select_console>
c00057bf:	83 c4 10             	add    $0x10,%esp
c00057c2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00057c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00057d0:	83 ec 0c             	sub    $0xc,%esp
c00057d3:	6a 6c                	push   $0x6c
c00057d5:	e8 ef 16 00 00       	call   c0006ec9 <sys_malloc>
c00057da:	83 c4 10             	add    $0x10,%esp
c00057dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00057e0:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c00057e7:	eb 30                	jmp    c0005819 <TaskTTY+0x6f>
c00057e9:	83 ec 0c             	sub    $0xc,%esp
c00057ec:	ff 75 f4             	pushl  -0xc(%ebp)
c00057ef:	e8 fb f9 ff ff       	call   c00051ef <tty_dev_read>
c00057f4:	83 c4 10             	add    $0x10,%esp
c00057f7:	83 ec 0c             	sub    $0xc,%esp
c00057fa:	ff 75 f4             	pushl  -0xc(%ebp)
c00057fd:	e8 17 fa ff ff       	call   c0005219 <tty_dev_write>
c0005802:	83 c4 10             	add    $0x10,%esp
c0005805:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005808:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000580e:	85 c0                	test   %eax,%eax
c0005810:	75 d7                	jne    c00057e9 <TaskTTY+0x3f>
c0005812:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005819:	b8 18 16 01 c0       	mov    $0xc0011618,%eax
c000581e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005821:	72 c6                	jb     c00057e9 <TaskTTY+0x3f>
c0005823:	83 ec 04             	sub    $0x4,%esp
c0005826:	6a 0e                	push   $0xe
c0005828:	ff 75 e8             	pushl  -0x18(%ebp)
c000582b:	6a 02                	push   $0x2
c000582d:	e8 31 42 00 00       	call   c0009a63 <send_rec>
c0005832:	83 c4 10             	add    $0x10,%esp
c0005835:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005838:	8b 40 68             	mov    0x68(%eax),%eax
c000583b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000583e:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005845:	74 28                	je     c000586f <TaskTTY+0xc5>
c0005847:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c000584e:	7f 0b                	jg     c000585b <TaskTTY+0xb1>
c0005850:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005857:	74 4e                	je     c00058a7 <TaskTTY+0xfd>
c0005859:	eb 4d                	jmp    c00058a8 <TaskTTY+0xfe>
c000585b:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005862:	74 21                	je     c0005885 <TaskTTY+0xdb>
c0005864:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c000586b:	74 2e                	je     c000589b <TaskTTY+0xf1>
c000586d:	eb 39                	jmp    c00058a8 <TaskTTY+0xfe>
c000586f:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0005874:	83 ec 08             	sub    $0x8,%esp
c0005877:	ff 75 e8             	pushl  -0x18(%ebp)
c000587a:	50                   	push   %eax
c000587b:	e8 b5 fb ff ff       	call   c0005435 <tty_do_read>
c0005880:	83 c4 10             	add    $0x10,%esp
c0005883:	eb 23                	jmp    c00058a8 <TaskTTY+0xfe>
c0005885:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c000588a:	83 ec 08             	sub    $0x8,%esp
c000588d:	ff 75 e8             	pushl  -0x18(%ebp)
c0005890:	50                   	push   %eax
c0005891:	e8 67 fc ff ff       	call   c00054fd <tty_do_write>
c0005896:	83 c4 10             	add    $0x10,%esp
c0005899:	eb 0d                	jmp    c00058a8 <TaskTTY+0xfe>
c000589b:	c7 05 a0 16 01 c0 00 	movl   $0x0,0xc00116a0
c00058a2:	00 00 00 
c00058a5:	eb 01                	jmp    c00058a8 <TaskTTY+0xfe>
c00058a7:	90                   	nop
c00058a8:	e9 33 ff ff ff       	jmp    c00057e0 <TaskTTY+0x36>

c00058ad <keyboard_handler>:
c00058ad:	55                   	push   %ebp
c00058ae:	89 e5                	mov    %esp,%ebp
c00058b0:	83 ec 18             	sub    $0x18,%esp
c00058b3:	c7 05 a0 16 01 c0 01 	movl   $0x1,0xc00116a0
c00058ba:	00 00 00 
c00058bd:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c00058c4:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00058c9:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00058ce:	7f 5e                	jg     c000592e <keyboard_handler+0x81>
c00058d0:	e8 db be ff ff       	call   c00017b0 <disable_int>
c00058d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058d8:	0f b7 c0             	movzwl %ax,%eax
c00058db:	83 ec 0c             	sub    $0xc,%esp
c00058de:	50                   	push   %eax
c00058df:	e8 9e be ff ff       	call   c0001782 <in_byte>
c00058e4:	83 c4 10             	add    $0x10,%esp
c00058e7:	88 45 f3             	mov    %al,-0xd(%ebp)
c00058ea:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c00058ef:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c00058f3:	88 10                	mov    %dl,(%eax)
c00058f5:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c00058fa:	83 c0 01             	add    $0x1,%eax
c00058fd:	a3 80 fb 00 c0       	mov    %eax,0xc000fb80
c0005902:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005907:	83 c0 01             	add    $0x1,%eax
c000590a:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c000590f:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0005914:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c0005919:	39 d0                	cmp    %edx,%eax
c000591b:	72 0a                	jb     c0005927 <keyboard_handler+0x7a>
c000591d:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c0005924:	fb 00 c0 
c0005927:	e8 86 be ff ff       	call   c00017b2 <enable_int>
c000592c:	eb 01                	jmp    c000592f <keyboard_handler+0x82>
c000592e:	90                   	nop
c000592f:	c9                   	leave  
c0005930:	c3                   	ret    

c0005931 <read_from_keyboard_buf>:
c0005931:	55                   	push   %ebp
c0005932:	89 e5                	mov    %esp,%ebp
c0005934:	83 ec 18             	sub    $0x18,%esp
c0005937:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c000593b:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005940:	85 c0                	test   %eax,%eax
c0005942:	7f 06                	jg     c000594a <read_from_keyboard_buf+0x19>
c0005944:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005948:	eb 4b                	jmp    c0005995 <read_from_keyboard_buf+0x64>
c000594a:	e8 61 be ff ff       	call   c00017b0 <disable_int>
c000594f:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0005954:	0f b6 00             	movzbl (%eax),%eax
c0005957:	88 45 f7             	mov    %al,-0x9(%ebp)
c000595a:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c000595f:	83 c0 01             	add    $0x1,%eax
c0005962:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0005967:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c000596c:	83 e8 01             	sub    $0x1,%eax
c000596f:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c0005974:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0005979:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c000597e:	39 d0                	cmp    %edx,%eax
c0005980:	72 0a                	jb     c000598c <read_from_keyboard_buf+0x5b>
c0005982:	c7 05 84 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb84
c0005989:	fb 00 c0 
c000598c:	e8 21 be ff ff       	call   c00017b2 <enable_int>
c0005991:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005995:	c9                   	leave  
c0005996:	c3                   	ret    

c0005997 <keyboard_read>:
c0005997:	55                   	push   %ebp
c0005998:	89 e5                	mov    %esp,%ebp
c000599a:	83 ec 28             	sub    $0x28,%esp
c000599d:	90                   	nop
c000599e:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00059a3:	85 c0                	test   %eax,%eax
c00059a5:	7e f7                	jle    c000599e <keyboard_read+0x7>
c00059a7:	e8 85 ff ff ff       	call   c0005931 <read_from_keyboard_buf>
c00059ac:	88 45 ea             	mov    %al,-0x16(%ebp)
c00059af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00059b6:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00059ba:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c00059be:	75 5a                	jne    c0005a1a <keyboard_read+0x83>
c00059c0:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c00059c4:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c00059c8:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c00059cc:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c00059d0:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c00059d4:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c00059d8:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c00059dc:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00059e3:	eb 20                	jmp    c0005a05 <keyboard_read+0x6e>
c00059e5:	e8 47 ff ff ff       	call   c0005931 <read_from_keyboard_buf>
c00059ea:	89 c1                	mov    %eax,%ecx
c00059ec:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c00059ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00059f2:	01 d0                	add    %edx,%eax
c00059f4:	0f b6 00             	movzbl (%eax),%eax
c00059f7:	38 c1                	cmp    %al,%cl
c00059f9:	74 06                	je     c0005a01 <keyboard_read+0x6a>
c00059fb:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c00059ff:	eb 0a                	jmp    c0005a0b <keyboard_read+0x74>
c0005a01:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005a05:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005a09:	7e da                	jle    c00059e5 <keyboard_read+0x4e>
c0005a0b:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005a0f:	74 68                	je     c0005a79 <keyboard_read+0xe2>
c0005a11:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005a18:	eb 5f                	jmp    c0005a79 <keyboard_read+0xe2>
c0005a1a:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005a1e:	75 59                	jne    c0005a79 <keyboard_read+0xe2>
c0005a20:	e8 0c ff ff ff       	call   c0005931 <read_from_keyboard_buf>
c0005a25:	3c 2a                	cmp    $0x2a,%al
c0005a27:	75 1d                	jne    c0005a46 <keyboard_read+0xaf>
c0005a29:	e8 03 ff ff ff       	call   c0005931 <read_from_keyboard_buf>
c0005a2e:	3c e0                	cmp    $0xe0,%al
c0005a30:	75 14                	jne    c0005a46 <keyboard_read+0xaf>
c0005a32:	e8 fa fe ff ff       	call   c0005931 <read_from_keyboard_buf>
c0005a37:	3c 37                	cmp    $0x37,%al
c0005a39:	75 0b                	jne    c0005a46 <keyboard_read+0xaf>
c0005a3b:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005a42:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005a46:	e8 e6 fe ff ff       	call   c0005931 <read_from_keyboard_buf>
c0005a4b:	3c b7                	cmp    $0xb7,%al
c0005a4d:	75 1d                	jne    c0005a6c <keyboard_read+0xd5>
c0005a4f:	e8 dd fe ff ff       	call   c0005931 <read_from_keyboard_buf>
c0005a54:	3c e0                	cmp    $0xe0,%al
c0005a56:	75 14                	jne    c0005a6c <keyboard_read+0xd5>
c0005a58:	e8 d4 fe ff ff       	call   c0005931 <read_from_keyboard_buf>
c0005a5d:	3c aa                	cmp    $0xaa,%al
c0005a5f:	75 0b                	jne    c0005a6c <keyboard_read+0xd5>
c0005a61:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005a68:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005a6c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005a70:	75 07                	jne    c0005a79 <keyboard_read+0xe2>
c0005a72:	c6 05 24 f7 00 c0 01 	movb   $0x1,0xc000f724
c0005a79:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005a80:	0f 84 8d 00 00 00    	je     c0005b13 <keyboard_read+0x17c>
c0005a86:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005a8d:	0f 84 80 00 00 00    	je     c0005b13 <keyboard_read+0x17c>
c0005a93:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005a97:	0f 94 c2             	sete   %dl
c0005a9a:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005a9e:	0f 94 c0             	sete   %al
c0005aa1:	09 d0                	or     %edx,%eax
c0005aa3:	84 c0                	test   %al,%al
c0005aa5:	74 07                	je     c0005aae <keyboard_read+0x117>
c0005aa7:	c6 05 a4 16 01 c0 01 	movb   $0x1,0xc00116a4
c0005aae:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005ab2:	f7 d0                	not    %eax
c0005ab4:	c0 e8 07             	shr    $0x7,%al
c0005ab7:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005aba:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005abe:	74 53                	je     c0005b13 <keyboard_read+0x17c>
c0005ac0:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005ac4:	74 4d                	je     c0005b13 <keyboard_read+0x17c>
c0005ac6:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005aca:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0005ad1:	3c 01                	cmp    $0x1,%al
c0005ad3:	75 04                	jne    c0005ad9 <keyboard_read+0x142>
c0005ad5:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005ad9:	0f b6 05 24 f7 00 c0 	movzbl 0xc000f724,%eax
c0005ae0:	84 c0                	test   %al,%al
c0005ae2:	74 04                	je     c0005ae8 <keyboard_read+0x151>
c0005ae4:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005ae8:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005aec:	89 d0                	mov    %edx,%eax
c0005aee:	01 c0                	add    %eax,%eax
c0005af0:	01 c2                	add    %eax,%edx
c0005af2:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005af6:	01 d0                	add    %edx,%eax
c0005af8:	8b 04 85 00 e1 00 c0 	mov    -0x3fff1f00(,%eax,4),%eax
c0005aff:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005b02:	83 ec 08             	sub    $0x8,%esp
c0005b05:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b08:	ff 75 08             	pushl  0x8(%ebp)
c0005b0b:	e8 1a 00 00 00       	call   c0005b2a <in_process>
c0005b10:	83 c4 10             	add    $0x10,%esp
c0005b13:	90                   	nop
c0005b14:	c9                   	leave  
c0005b15:	c3                   	ret    

c0005b16 <init_keyboard_handler>:
c0005b16:	55                   	push   %ebp
c0005b17:	89 e5                	mov    %esp,%ebp
c0005b19:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005b20:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005b27:	90                   	nop
c0005b28:	5d                   	pop    %ebp
c0005b29:	c3                   	ret    

c0005b2a <in_process>:
c0005b2a:	55                   	push   %ebp
c0005b2b:	89 e5                	mov    %esp,%ebp
c0005b2d:	83 ec 18             	sub    $0x18,%esp
c0005b30:	83 ec 04             	sub    $0x4,%esp
c0005b33:	6a 02                	push   $0x2
c0005b35:	6a 00                	push   $0x0
c0005b37:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005b3a:	50                   	push   %eax
c0005b3b:	e8 12 58 00 00       	call   c000b352 <Memset>
c0005b40:	83 c4 10             	add    $0x10,%esp
c0005b43:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b46:	25 00 01 00 00       	and    $0x100,%eax
c0005b4b:	85 c0                	test   %eax,%eax
c0005b4d:	75 28                	jne    c0005b77 <in_process+0x4d>
c0005b4f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b52:	0f b6 c0             	movzbl %al,%eax
c0005b55:	83 ec 08             	sub    $0x8,%esp
c0005b58:	50                   	push   %eax
c0005b59:	ff 75 08             	pushl  0x8(%ebp)
c0005b5c:	e8 ce f3 ff ff       	call   c0004f2f <put_key>
c0005b61:	83 c4 10             	add    $0x10,%esp
c0005b64:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005b6b:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005b72:	e9 42 01 00 00       	jmp    c0005cb9 <in_process+0x18f>
c0005b77:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0005b7e:	84 c0                	test   %al,%al
c0005b80:	0f 84 a9 00 00 00    	je     c0005c2f <in_process+0x105>
c0005b86:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005b8a:	0f 84 9f 00 00 00    	je     c0005c2f <in_process+0x105>
c0005b90:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005b94:	0f 84 95 00 00 00    	je     c0005c2f <in_process+0x105>
c0005b9a:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005ba1:	74 64                	je     c0005c07 <in_process+0xdd>
c0005ba3:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005baa:	77 0b                	ja     c0005bb7 <in_process+0x8d>
c0005bac:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005bb3:	74 64                	je     c0005c19 <in_process+0xef>
c0005bb5:	eb 73                	jmp    c0005c2a <in_process+0x100>
c0005bb7:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005bbe:	74 0b                	je     c0005bcb <in_process+0xa1>
c0005bc0:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005bc7:	74 20                	je     c0005be9 <in_process+0xbf>
c0005bc9:	eb 5f                	jmp    c0005c2a <in_process+0x100>
c0005bcb:	83 ec 0c             	sub    $0xc,%esp
c0005bce:	ff 75 08             	pushl  0x8(%ebp)
c0005bd1:	e8 c5 f3 ff ff       	call   c0004f9b <scroll_up>
c0005bd6:	83 c4 10             	add    $0x10,%esp
c0005bd9:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005be0:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005be7:	eb 41                	jmp    c0005c2a <in_process+0x100>
c0005be9:	83 ec 0c             	sub    $0xc,%esp
c0005bec:	ff 75 08             	pushl  0x8(%ebp)
c0005bef:	e8 e9 f3 ff ff       	call   c0004fdd <scroll_down>
c0005bf4:	83 c4 10             	add    $0x10,%esp
c0005bf7:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005bfe:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005c05:	eb 23                	jmp    c0005c2a <in_process+0x100>
c0005c07:	83 ec 08             	sub    $0x8,%esp
c0005c0a:	6a 0a                	push   $0xa
c0005c0c:	ff 75 08             	pushl  0x8(%ebp)
c0005c0f:	e8 34 f4 ff ff       	call   c0005048 <out_char>
c0005c14:	83 c4 10             	add    $0x10,%esp
c0005c17:	eb 11                	jmp    c0005c2a <in_process+0x100>
c0005c19:	83 ec 08             	sub    $0x8,%esp
c0005c1c:	6a 08                	push   $0x8
c0005c1e:	ff 75 08             	pushl  0x8(%ebp)
c0005c21:	e8 22 f4 ff ff       	call   c0005048 <out_char>
c0005c26:	83 c4 10             	add    $0x10,%esp
c0005c29:	90                   	nop
c0005c2a:	e9 8a 00 00 00       	jmp    c0005cb9 <in_process+0x18f>
c0005c2f:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005c36:	74 55                	je     c0005c8d <in_process+0x163>
c0005c38:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005c3f:	77 14                	ja     c0005c55 <in_process+0x12b>
c0005c41:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005c48:	74 31                	je     c0005c7b <in_process+0x151>
c0005c4a:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005c51:	74 16                	je     c0005c69 <in_process+0x13f>
c0005c53:	eb 64                	jmp    c0005cb9 <in_process+0x18f>
c0005c55:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005c5c:	74 3e                	je     c0005c9c <in_process+0x172>
c0005c5e:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005c65:	74 44                	je     c0005cab <in_process+0x181>
c0005c67:	eb 50                	jmp    c0005cb9 <in_process+0x18f>
c0005c69:	83 ec 08             	sub    $0x8,%esp
c0005c6c:	6a 0a                	push   $0xa
c0005c6e:	ff 75 08             	pushl  0x8(%ebp)
c0005c71:	e8 b9 f2 ff ff       	call   c0004f2f <put_key>
c0005c76:	83 c4 10             	add    $0x10,%esp
c0005c79:	eb 3e                	jmp    c0005cb9 <in_process+0x18f>
c0005c7b:	83 ec 08             	sub    $0x8,%esp
c0005c7e:	6a 08                	push   $0x8
c0005c80:	ff 75 08             	pushl  0x8(%ebp)
c0005c83:	e8 a7 f2 ff ff       	call   c0004f2f <put_key>
c0005c88:	83 c4 10             	add    $0x10,%esp
c0005c8b:	eb 2c                	jmp    c0005cb9 <in_process+0x18f>
c0005c8d:	83 ec 0c             	sub    $0xc,%esp
c0005c90:	6a 00                	push   $0x0
c0005c92:	e8 67 f1 ff ff       	call   c0004dfe <select_console>
c0005c97:	83 c4 10             	add    $0x10,%esp
c0005c9a:	eb 1d                	jmp    c0005cb9 <in_process+0x18f>
c0005c9c:	83 ec 0c             	sub    $0xc,%esp
c0005c9f:	6a 01                	push   $0x1
c0005ca1:	e8 58 f1 ff ff       	call   c0004dfe <select_console>
c0005ca6:	83 c4 10             	add    $0x10,%esp
c0005ca9:	eb 0e                	jmp    c0005cb9 <in_process+0x18f>
c0005cab:	83 ec 0c             	sub    $0xc,%esp
c0005cae:	6a 02                	push   $0x2
c0005cb0:	e8 49 f1 ff ff       	call   c0004dfe <select_console>
c0005cb5:	83 c4 10             	add    $0x10,%esp
c0005cb8:	90                   	nop
c0005cb9:	90                   	nop
c0005cba:	c9                   	leave  
c0005cbb:	c3                   	ret    

c0005cbc <open>:
c0005cbc:	55                   	push   %ebp
c0005cbd:	89 e5                	mov    %esp,%ebp
c0005cbf:	83 ec 18             	sub    $0x18,%esp
c0005cc2:	83 ec 0c             	sub    $0xc,%esp
c0005cc5:	6a 6c                	push   $0x6c
c0005cc7:	e8 fd 11 00 00       	call   c0006ec9 <sys_malloc>
c0005ccc:	83 c4 10             	add    $0x10,%esp
c0005ccf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005cd2:	83 ec 04             	sub    $0x4,%esp
c0005cd5:	6a 6c                	push   $0x6c
c0005cd7:	6a 00                	push   $0x0
c0005cd9:	ff 75 f4             	pushl  -0xc(%ebp)
c0005cdc:	e8 71 56 00 00       	call   c000b352 <Memset>
c0005ce1:	83 c4 10             	add    $0x10,%esp
c0005ce4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ce7:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0005cee:	83 ec 0c             	sub    $0xc,%esp
c0005cf1:	ff 75 08             	pushl  0x8(%ebp)
c0005cf4:	e8 fc 10 00 00       	call   c0006df5 <get_physical_address>
c0005cf9:	83 c4 10             	add    $0x10,%esp
c0005cfc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005cff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d02:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005d05:	89 50 34             	mov    %edx,0x34(%eax)
c0005d08:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005d0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d0e:	89 50 64             	mov    %edx,0x64(%eax)
c0005d11:	83 ec 0c             	sub    $0xc,%esp
c0005d14:	ff 75 08             	pushl  0x8(%ebp)
c0005d17:	e8 6f 56 00 00       	call   c000b38b <Strlen>
c0005d1c:	83 c4 10             	add    $0x10,%esp
c0005d1f:	89 c2                	mov    %eax,%edx
c0005d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d24:	89 50 30             	mov    %edx,0x30(%eax)
c0005d27:	83 ec 04             	sub    $0x4,%esp
c0005d2a:	6a 04                	push   $0x4
c0005d2c:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d2f:	6a 03                	push   $0x3
c0005d31:	e8 2d 3d 00 00       	call   c0009a63 <send_rec>
c0005d36:	83 c4 10             	add    $0x10,%esp
c0005d39:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d3c:	8b 40 40             	mov    0x40(%eax),%eax
c0005d3f:	c9                   	leave  
c0005d40:	c3                   	ret    

c0005d41 <read>:
c0005d41:	55                   	push   %ebp
c0005d42:	89 e5                	mov    %esp,%ebp
c0005d44:	83 ec 18             	sub    $0x18,%esp
c0005d47:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005d4e:	83 ec 0c             	sub    $0xc,%esp
c0005d51:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d54:	e8 70 11 00 00       	call   c0006ec9 <sys_malloc>
c0005d59:	83 c4 10             	add    $0x10,%esp
c0005d5c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005d5f:	83 ec 0c             	sub    $0xc,%esp
c0005d62:	ff 75 0c             	pushl  0xc(%ebp)
c0005d65:	e8 8b 10 00 00       	call   c0006df5 <get_physical_address>
c0005d6a:	83 c4 10             	add    $0x10,%esp
c0005d6d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005d70:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d73:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0005d7a:	8b 55 08             	mov    0x8(%ebp),%edx
c0005d7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d80:	89 50 40             	mov    %edx,0x40(%eax)
c0005d83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d86:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005d89:	89 50 10             	mov    %edx,0x10(%eax)
c0005d8c:	8b 55 10             	mov    0x10(%ebp),%edx
c0005d8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d92:	89 50 50             	mov    %edx,0x50(%eax)
c0005d95:	83 ec 04             	sub    $0x4,%esp
c0005d98:	6a 04                	push   $0x4
c0005d9a:	ff 75 f0             	pushl  -0x10(%ebp)
c0005d9d:	6a 03                	push   $0x3
c0005d9f:	e8 bf 3c 00 00       	call   c0009a63 <send_rec>
c0005da4:	83 c4 10             	add    $0x10,%esp
c0005da7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005daa:	8b 40 50             	mov    0x50(%eax),%eax
c0005dad:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005db0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005db3:	c9                   	leave  
c0005db4:	c3                   	ret    

c0005db5 <write>:
c0005db5:	55                   	push   %ebp
c0005db6:	89 e5                	mov    %esp,%ebp
c0005db8:	83 ec 18             	sub    $0x18,%esp
c0005dbb:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005dc2:	83 ec 0c             	sub    $0xc,%esp
c0005dc5:	ff 75 f4             	pushl  -0xc(%ebp)
c0005dc8:	e8 fc 10 00 00       	call   c0006ec9 <sys_malloc>
c0005dcd:	83 c4 10             	add    $0x10,%esp
c0005dd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005dd3:	83 ec 0c             	sub    $0xc,%esp
c0005dd6:	ff 75 0c             	pushl  0xc(%ebp)
c0005dd9:	e8 17 10 00 00       	call   c0006df5 <get_physical_address>
c0005dde:	83 c4 10             	add    $0x10,%esp
c0005de1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005de4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005de7:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0005dee:	8b 55 08             	mov    0x8(%ebp),%edx
c0005df1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005df4:	89 50 40             	mov    %edx,0x40(%eax)
c0005df7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005dfa:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005dfd:	89 50 10             	mov    %edx,0x10(%eax)
c0005e00:	8b 55 10             	mov    0x10(%ebp),%edx
c0005e03:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e06:	89 50 50             	mov    %edx,0x50(%eax)
c0005e09:	83 ec 04             	sub    $0x4,%esp
c0005e0c:	6a 04                	push   $0x4
c0005e0e:	ff 75 f0             	pushl  -0x10(%ebp)
c0005e11:	6a 03                	push   $0x3
c0005e13:	e8 4b 3c 00 00       	call   c0009a63 <send_rec>
c0005e18:	83 c4 10             	add    $0x10,%esp
c0005e1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e1e:	8b 40 50             	mov    0x50(%eax),%eax
c0005e21:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005e24:	83 ec 08             	sub    $0x8,%esp
c0005e27:	ff 75 f4             	pushl  -0xc(%ebp)
c0005e2a:	ff 75 f0             	pushl  -0x10(%ebp)
c0005e2d:	e8 76 13 00 00       	call   c00071a8 <sys_free>
c0005e32:	83 c4 10             	add    $0x10,%esp
c0005e35:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e38:	c9                   	leave  
c0005e39:	c3                   	ret    

c0005e3a <close>:
c0005e3a:	55                   	push   %ebp
c0005e3b:	89 e5                	mov    %esp,%ebp
c0005e3d:	83 ec 78             	sub    $0x78,%esp
c0005e40:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005e47:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e4a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005e4d:	83 ec 04             	sub    $0x4,%esp
c0005e50:	6a 04                	push   $0x4
c0005e52:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e55:	50                   	push   %eax
c0005e56:	6a 03                	push   $0x3
c0005e58:	e8 06 3c 00 00       	call   c0009a63 <send_rec>
c0005e5d:	83 c4 10             	add    $0x10,%esp
c0005e60:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005e63:	83 f8 65             	cmp    $0x65,%eax
c0005e66:	74 19                	je     c0005e81 <close+0x47>
c0005e68:	6a 13                	push   $0x13
c0005e6a:	68 67 ab 00 c0       	push   $0xc000ab67
c0005e6f:	68 67 ab 00 c0       	push   $0xc000ab67
c0005e74:	68 73 ab 00 c0       	push   $0xc000ab73
c0005e79:	e8 9a 33 00 00       	call   c0009218 <assertion_failure>
c0005e7e:	83 c4 10             	add    $0x10,%esp
c0005e81:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005e84:	c9                   	leave  
c0005e85:	c3                   	ret    

c0005e86 <wait>:
c0005e86:	55                   	push   %ebp
c0005e87:	89 e5                	mov    %esp,%ebp
c0005e89:	83 ec 78             	sub    $0x78,%esp
c0005e8c:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005e93:	83 ec 04             	sub    $0x4,%esp
c0005e96:	6a 05                	push   $0x5
c0005e98:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e9b:	50                   	push   %eax
c0005e9c:	6a 03                	push   $0x3
c0005e9e:	e8 c0 3b 00 00       	call   c0009a63 <send_rec>
c0005ea3:	83 c4 10             	add    $0x10,%esp
c0005ea6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005ea9:	89 c2                	mov    %eax,%edx
c0005eab:	8b 45 08             	mov    0x8(%ebp),%eax
c0005eae:	89 10                	mov    %edx,(%eax)
c0005eb0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005eb3:	83 f8 1d             	cmp    $0x1d,%eax
c0005eb6:	74 05                	je     c0005ebd <wait+0x37>
c0005eb8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ebb:	eb 05                	jmp    c0005ec2 <wait+0x3c>
c0005ebd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005ec2:	c9                   	leave  
c0005ec3:	c3                   	ret    

c0005ec4 <exit>:
c0005ec4:	55                   	push   %ebp
c0005ec5:	89 e5                	mov    %esp,%ebp
c0005ec7:	83 ec 78             	sub    $0x78,%esp
c0005eca:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005ed1:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ed4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005ed7:	83 ec 04             	sub    $0x4,%esp
c0005eda:	6a 05                	push   $0x5
c0005edc:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005edf:	50                   	push   %eax
c0005ee0:	6a 03                	push   $0x3
c0005ee2:	e8 7c 3b 00 00       	call   c0009a63 <send_rec>
c0005ee7:	83 c4 10             	add    $0x10,%esp
c0005eea:	90                   	nop
c0005eeb:	c9                   	leave  
c0005eec:	c3                   	ret    

c0005eed <fork>:
c0005eed:	55                   	push   %ebp
c0005eee:	89 e5                	mov    %esp,%ebp
c0005ef0:	83 ec 78             	sub    $0x78,%esp
c0005ef3:	83 ec 04             	sub    $0x4,%esp
c0005ef6:	6a 6c                	push   $0x6c
c0005ef8:	6a 00                	push   $0x0
c0005efa:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005efd:	50                   	push   %eax
c0005efe:	e8 4f 54 00 00       	call   c000b352 <Memset>
c0005f03:	83 c4 10             	add    $0x10,%esp
c0005f06:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005f0d:	83 ec 04             	sub    $0x4,%esp
c0005f10:	6a 05                	push   $0x5
c0005f12:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f15:	50                   	push   %eax
c0005f16:	6a 03                	push   $0x3
c0005f18:	e8 46 3b 00 00       	call   c0009a63 <send_rec>
c0005f1d:	83 c4 10             	add    $0x10,%esp
c0005f20:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005f27:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005f2a:	85 c0                	test   %eax,%eax
c0005f2c:	74 19                	je     c0005f47 <fork+0x5a>
c0005f2e:	6a 14                	push   $0x14
c0005f30:	68 8b ab 00 c0       	push   $0xc000ab8b
c0005f35:	68 8b ab 00 c0       	push   $0xc000ab8b
c0005f3a:	68 96 ab 00 c0       	push   $0xc000ab96
c0005f3f:	e8 d4 32 00 00       	call   c0009218 <assertion_failure>
c0005f44:	83 c4 10             	add    $0x10,%esp
c0005f47:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f4a:	c9                   	leave  
c0005f4b:	c3                   	ret    

c0005f4c <getpid>:
c0005f4c:	55                   	push   %ebp
c0005f4d:	89 e5                	mov    %esp,%ebp
c0005f4f:	83 ec 78             	sub    $0x78,%esp
c0005f52:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005f59:	83 ec 04             	sub    $0x4,%esp
c0005f5c:	6a 03                	push   $0x3
c0005f5e:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f61:	50                   	push   %eax
c0005f62:	6a 03                	push   $0x3
c0005f64:	e8 fa 3a 00 00       	call   c0009a63 <send_rec>
c0005f69:	83 c4 10             	add    $0x10,%esp
c0005f6c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f6f:	c9                   	leave  
c0005f70:	c3                   	ret    

c0005f71 <exec>:
c0005f71:	55                   	push   %ebp
c0005f72:	89 e5                	mov    %esp,%ebp
c0005f74:	83 ec 78             	sub    $0x78,%esp
c0005f77:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005f7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005f81:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005f84:	83 ec 0c             	sub    $0xc,%esp
c0005f87:	ff 75 08             	pushl  0x8(%ebp)
c0005f8a:	e8 fc 53 00 00       	call   c000b38b <Strlen>
c0005f8f:	83 c4 10             	add    $0x10,%esp
c0005f92:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005f95:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0005f9c:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0005fa3:	83 ec 04             	sub    $0x4,%esp
c0005fa6:	6a 05                	push   $0x5
c0005fa8:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005fab:	50                   	push   %eax
c0005fac:	6a 03                	push   $0x3
c0005fae:	e8 b0 3a 00 00       	call   c0009a63 <send_rec>
c0005fb3:	83 c4 10             	add    $0x10,%esp
c0005fb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005fb9:	83 f8 65             	cmp    $0x65,%eax
c0005fbc:	74 19                	je     c0005fd7 <exec+0x66>
c0005fbe:	6a 19                	push   $0x19
c0005fc0:	68 a6 ab 00 c0       	push   $0xc000aba6
c0005fc5:	68 a6 ab 00 c0       	push   $0xc000aba6
c0005fca:	68 b1 ab 00 c0       	push   $0xc000abb1
c0005fcf:	e8 44 32 00 00       	call   c0009218 <assertion_failure>
c0005fd4:	83 c4 10             	add    $0x10,%esp
c0005fd7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005fda:	c9                   	leave  
c0005fdb:	c3                   	ret    

c0005fdc <execv>:
c0005fdc:	55                   	push   %ebp
c0005fdd:	89 e5                	mov    %esp,%ebp
c0005fdf:	57                   	push   %edi
c0005fe0:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0005fe6:	83 ec 04             	sub    $0x4,%esp
c0005fe9:	68 00 80 00 00       	push   $0x8000
c0005fee:	6a 00                	push   $0x0
c0005ff0:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005ff6:	50                   	push   %eax
c0005ff7:	e8 56 53 00 00       	call   c000b352 <Memset>
c0005ffc:	83 c4 10             	add    $0x10,%esp
c0005fff:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006002:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006005:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000600c:	eb 0d                	jmp    c000601b <execv+0x3f>
c000600e:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0006012:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006015:	83 c0 04             	add    $0x4,%eax
c0006018:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000601b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000601e:	8b 00                	mov    (%eax),%eax
c0006020:	85 c0                	test   %eax,%eax
c0006022:	75 ea                	jne    c000600e <execv+0x32>
c0006024:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c000602a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000602d:	01 d0                	add    %edx,%eax
c000602f:	c6 00 00             	movb   $0x0,(%eax)
c0006032:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006035:	83 c0 04             	add    $0x4,%eax
c0006038:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000603b:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006041:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006044:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006047:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000604a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006051:	eb 64                	jmp    c00060b7 <execv+0xdb>
c0006053:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006059:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000605c:	01 c2                	add    %eax,%edx
c000605e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006061:	89 10                	mov    %edx,(%eax)
c0006063:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006066:	8b 00                	mov    (%eax),%eax
c0006068:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c000606e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006071:	01 ca                	add    %ecx,%edx
c0006073:	83 ec 08             	sub    $0x8,%esp
c0006076:	50                   	push   %eax
c0006077:	52                   	push   %edx
c0006078:	e8 f4 52 00 00       	call   c000b371 <Strcpy>
c000607d:	83 c4 10             	add    $0x10,%esp
c0006080:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006083:	8b 00                	mov    (%eax),%eax
c0006085:	83 ec 0c             	sub    $0xc,%esp
c0006088:	50                   	push   %eax
c0006089:	e8 fd 52 00 00       	call   c000b38b <Strlen>
c000608e:	83 c4 10             	add    $0x10,%esp
c0006091:	01 45 f0             	add    %eax,-0x10(%ebp)
c0006094:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c000609a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000609d:	01 d0                	add    %edx,%eax
c000609f:	c6 00 00             	movb   $0x0,(%eax)
c00060a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060a5:	83 c0 01             	add    $0x1,%eax
c00060a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00060ab:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c00060af:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00060b3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00060b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00060ba:	8b 00                	mov    (%eax),%eax
c00060bc:	85 c0                	test   %eax,%eax
c00060be:	75 93                	jne    c0006053 <execv+0x77>
c00060c0:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00060c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00060c9:	eb 04                	jmp    c00060cf <execv+0xf3>
c00060cb:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00060cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00060d2:	8b 00                	mov    (%eax),%eax
c00060d4:	85 c0                	test   %eax,%eax
c00060d6:	75 f3                	jne    c00060cb <execv+0xef>
c00060d8:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c00060de:	b8 00 00 00 00       	mov    $0x0,%eax
c00060e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00060e8:	89 d7                	mov    %edx,%edi
c00060ea:	f3 ab                	rep stos %eax,%es:(%edi)
c00060ec:	c7 85 4c 7f ff ff c9 	movl   $0xc000abc9,-0x80b4(%ebp)
c00060f3:	ab 00 c0 
c00060f6:	c7 85 50 7f ff ff d0 	movl   $0xc000abd0,-0x80b0(%ebp)
c00060fd:	ab 00 c0 
c0006100:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0006107:	00 00 00 
c000610a:	8b 45 08             	mov    0x8(%ebp),%eax
c000610d:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c0006113:	83 ec 0c             	sub    $0xc,%esp
c0006116:	ff 75 08             	pushl  0x8(%ebp)
c0006119:	e8 6d 52 00 00       	call   c000b38b <Strlen>
c000611e:	83 c4 10             	add    $0x10,%esp
c0006121:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0006127:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000612d:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0006133:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006136:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c000613c:	83 ec 04             	sub    $0x4,%esp
c000613f:	6a 05                	push   $0x5
c0006141:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0006147:	50                   	push   %eax
c0006148:	6a 03                	push   $0x3
c000614a:	e8 14 39 00 00       	call   c0009a63 <send_rec>
c000614f:	83 c4 10             	add    $0x10,%esp
c0006152:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0006158:	83 f8 65             	cmp    $0x65,%eax
c000615b:	74 19                	je     c0006176 <execv+0x19a>
c000615d:	6a 72                	push   $0x72
c000615f:	68 a6 ab 00 c0       	push   $0xc000aba6
c0006164:	68 a6 ab 00 c0       	push   $0xc000aba6
c0006169:	68 b1 ab 00 c0       	push   $0xc000abb1
c000616e:	e8 a5 30 00 00       	call   c0009218 <assertion_failure>
c0006173:	83 c4 10             	add    $0x10,%esp
c0006176:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c000617c:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000617f:	c9                   	leave  
c0006180:	c3                   	ret    

c0006181 <execl>:
c0006181:	55                   	push   %ebp
c0006182:	89 e5                	mov    %esp,%ebp
c0006184:	83 ec 18             	sub    $0x18,%esp
c0006187:	8d 45 0c             	lea    0xc(%ebp),%eax
c000618a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000618d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006190:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006193:	83 ec 08             	sub    $0x8,%esp
c0006196:	ff 75 f0             	pushl  -0x10(%ebp)
c0006199:	ff 75 08             	pushl  0x8(%ebp)
c000619c:	e8 3b fe ff ff       	call   c0005fdc <execv>
c00061a1:	83 c4 10             	add    $0x10,%esp
c00061a4:	c9                   	leave  
c00061a5:	c3                   	ret    

c00061a6 <TaskMM>:
c00061a6:	55                   	push   %ebp
c00061a7:	89 e5                	mov    %esp,%ebp
c00061a9:	83 ec 28             	sub    $0x28,%esp
c00061ac:	83 ec 0c             	sub    $0xc,%esp
c00061af:	68 d7 ab 00 c0       	push   $0xc000abd7
c00061b4:	e8 d3 b3 ff ff       	call   c000158c <disp_str>
c00061b9:	83 c4 10             	add    $0x10,%esp
c00061bc:	e8 cb b6 ff ff       	call   c000188c <get_running_thread_pcb>
c00061c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061c4:	83 ec 0c             	sub    $0xc,%esp
c00061c7:	68 db ab 00 c0       	push   $0xc000abdb
c00061cc:	e8 bb b3 ff ff       	call   c000158c <disp_str>
c00061d1:	83 c4 10             	add    $0x10,%esp
c00061d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061d7:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00061dd:	83 ec 0c             	sub    $0xc,%esp
c00061e0:	50                   	push   %eax
c00061e1:	e8 5c 18 00 00       	call   c0007a42 <disp_int>
c00061e6:	83 c4 10             	add    $0x10,%esp
c00061e9:	83 ec 0c             	sub    $0xc,%esp
c00061ec:	68 dd ab 00 c0       	push   $0xc000abdd
c00061f1:	e8 96 b3 ff ff       	call   c000158c <disp_str>
c00061f6:	83 c4 10             	add    $0x10,%esp
c00061f9:	83 ec 0c             	sub    $0xc,%esp
c00061fc:	68 df ab 00 c0       	push   $0xc000abdf
c0006201:	e8 86 b3 ff ff       	call   c000158c <disp_str>
c0006206:	83 c4 10             	add    $0x10,%esp
c0006209:	83 ec 0c             	sub    $0xc,%esp
c000620c:	6a 6c                	push   $0x6c
c000620e:	e8 b6 0c 00 00       	call   c0006ec9 <sys_malloc>
c0006213:	83 c4 10             	add    $0x10,%esp
c0006216:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006219:	83 ec 0c             	sub    $0xc,%esp
c000621c:	6a 6c                	push   $0x6c
c000621e:	e8 a6 0c 00 00       	call   c0006ec9 <sys_malloc>
c0006223:	83 c4 10             	add    $0x10,%esp
c0006226:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006229:	83 ec 0c             	sub    $0xc,%esp
c000622c:	68 e1 ab 00 c0       	push   $0xc000abe1
c0006231:	e8 56 b3 ff ff       	call   c000158c <disp_str>
c0006236:	83 c4 10             	add    $0x10,%esp
c0006239:	83 ec 04             	sub    $0x4,%esp
c000623c:	6a 0e                	push   $0xe
c000623e:	ff 75 ec             	pushl  -0x14(%ebp)
c0006241:	6a 02                	push   $0x2
c0006243:	e8 1b 38 00 00       	call   c0009a63 <send_rec>
c0006248:	83 c4 10             	add    $0x10,%esp
c000624b:	83 ec 0c             	sub    $0xc,%esp
c000624e:	68 f0 ab 00 c0       	push   $0xc000abf0
c0006253:	e8 34 b3 ff ff       	call   c000158c <disp_str>
c0006258:	83 c4 10             	add    $0x10,%esp
c000625b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000625e:	8b 40 68             	mov    0x68(%eax),%eax
c0006261:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006264:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006267:	8b 00                	mov    (%eax),%eax
c0006269:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000626c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006273:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006276:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000627d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006280:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c0006287:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
c000628b:	74 4b                	je     c00062d8 <TaskMM+0x132>
c000628d:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
c0006291:	7f 08                	jg     c000629b <TaskMM+0xf5>
c0006293:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
c0006297:	74 28                	je     c00062c1 <TaskMM+0x11b>
c0006299:	eb 6e                	jmp    c0006309 <TaskMM+0x163>
c000629b:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
c000629f:	74 08                	je     c00062a9 <TaskMM+0x103>
c00062a1:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c00062a5:	74 4b                	je     c00062f2 <TaskMM+0x14c>
c00062a7:	eb 60                	jmp    c0006309 <TaskMM+0x163>
c00062a9:	83 ec 0c             	sub    $0xc,%esp
c00062ac:	ff 75 ec             	pushl  -0x14(%ebp)
c00062af:	e8 ec 03 00 00       	call   c00066a0 <do_fork>
c00062b4:	83 c4 10             	add    $0x10,%esp
c00062b7:	89 c2                	mov    %eax,%edx
c00062b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00062bc:	89 50 4c             	mov    %edx,0x4c(%eax)
c00062bf:	eb 59                	jmp    c000631a <TaskMM+0x174>
c00062c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062c8:	83 ec 0c             	sub    $0xc,%esp
c00062cb:	ff 75 ec             	pushl  -0x14(%ebp)
c00062ce:	e8 9c 00 00 00       	call   c000636f <do_exec>
c00062d3:	83 c4 10             	add    $0x10,%esp
c00062d6:	eb 42                	jmp    c000631a <TaskMM+0x174>
c00062d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062df:	83 ec 08             	sub    $0x8,%esp
c00062e2:	ff 75 dc             	pushl  -0x24(%ebp)
c00062e5:	ff 75 ec             	pushl  -0x14(%ebp)
c00062e8:	e8 1e 04 00 00       	call   c000670b <do_exit>
c00062ed:	83 c4 10             	add    $0x10,%esp
c00062f0:	eb 28                	jmp    c000631a <TaskMM+0x174>
c00062f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062f9:	83 ec 0c             	sub    $0xc,%esp
c00062fc:	ff 75 ec             	pushl  -0x14(%ebp)
c00062ff:	e8 03 05 00 00       	call   c0006807 <do_wait>
c0006304:	83 c4 10             	add    $0x10,%esp
c0006307:	eb 11                	jmp    c000631a <TaskMM+0x174>
c0006309:	83 ec 0c             	sub    $0xc,%esp
c000630c:	68 05 ac 00 c0       	push   $0xc000ac05
c0006311:	e8 e4 2e 00 00       	call   c00091fa <panic>
c0006316:	83 c4 10             	add    $0x10,%esp
c0006319:	90                   	nop
c000631a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000631e:	0f 84 05 ff ff ff    	je     c0006229 <TaskMM+0x83>
c0006324:	83 ec 04             	sub    $0x4,%esp
c0006327:	ff 75 e0             	pushl  -0x20(%ebp)
c000632a:	ff 75 e8             	pushl  -0x18(%ebp)
c000632d:	6a 01                	push   $0x1
c000632f:	e8 2f 37 00 00       	call   c0009a63 <send_rec>
c0006334:	83 c4 10             	add    $0x10,%esp
c0006337:	e9 ed fe ff ff       	jmp    c0006229 <TaskMM+0x83>

c000633c <alloc_mem>:
c000633c:	55                   	push   %ebp
c000633d:	89 e5                	mov    %esp,%ebp
c000633f:	83 ec 10             	sub    $0x10,%esp
c0006342:	8b 45 08             	mov    0x8(%ebp),%eax
c0006345:	83 e8 04             	sub    $0x4,%eax
c0006348:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c000634e:	05 00 00 a0 00       	add    $0xa00000,%eax
c0006353:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006356:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006359:	c9                   	leave  
c000635a:	c3                   	ret    

c000635b <do_exec2>:
c000635b:	55                   	push   %ebp
c000635c:	89 e5                	mov    %esp,%ebp
c000635e:	83 ec 10             	sub    $0x10,%esp
c0006361:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0006368:	b8 00 00 00 00       	mov    $0x0,%eax
c000636d:	c9                   	leave  
c000636e:	c3                   	ret    

c000636f <do_exec>:
c000636f:	55                   	push   %ebp
c0006370:	89 e5                	mov    %esp,%ebp
c0006372:	56                   	push   %esi
c0006373:	53                   	push   %ebx
c0006374:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c000637a:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c0006381:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0006388:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c000638e:	83 ec 08             	sub    $0x8,%esp
c0006391:	6a 00                	push   $0x0
c0006393:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c0006396:	50                   	push   %eax
c0006397:	e8 20 f9 ff ff       	call   c0005cbc <open>
c000639c:	83 c4 10             	add    $0x10,%esp
c000639f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00063a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00063a5:	8b 00                	mov    (%eax),%eax
c00063a7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00063aa:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c00063b1:	83 ec 04             	sub    $0x4,%esp
c00063b4:	6a 0c                	push   $0xc
c00063b6:	6a 00                	push   $0x0
c00063b8:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00063be:	50                   	push   %eax
c00063bf:	e8 8e 4f 00 00       	call   c000b352 <Memset>
c00063c4:	83 c4 10             	add    $0x10,%esp
c00063c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00063ca:	8b 40 30             	mov    0x30(%eax),%eax
c00063cd:	89 c6                	mov    %eax,%esi
c00063cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00063d2:	8b 40 34             	mov    0x34(%eax),%eax
c00063d5:	83 ec 08             	sub    $0x8,%esp
c00063d8:	50                   	push   %eax
c00063d9:	ff 75 d8             	pushl  -0x28(%ebp)
c00063dc:	e8 c5 e7 ff ff       	call   c0004ba6 <v2l>
c00063e1:	83 c4 10             	add    $0x10,%esp
c00063e4:	89 c3                	mov    %eax,%ebx
c00063e6:	83 ec 08             	sub    $0x8,%esp
c00063e9:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00063ef:	50                   	push   %eax
c00063f0:	6a 05                	push   $0x5
c00063f2:	e8 af e7 ff ff       	call   c0004ba6 <v2l>
c00063f7:	83 c4 10             	add    $0x10,%esp
c00063fa:	83 ec 04             	sub    $0x4,%esp
c00063fd:	56                   	push   %esi
c00063fe:	53                   	push   %ebx
c00063ff:	50                   	push   %eax
c0006400:	e8 1f 4f 00 00       	call   c000b324 <Memcpy>
c0006405:	83 c4 10             	add    $0x10,%esp
c0006408:	83 ec 08             	sub    $0x8,%esp
c000640b:	6a 00                	push   $0x0
c000640d:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006413:	50                   	push   %eax
c0006414:	e8 a3 f8 ff ff       	call   c0005cbc <open>
c0006419:	83 c4 10             	add    $0x10,%esp
c000641c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000641f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006426:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006429:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c000642f:	01 d0                	add    %edx,%eax
c0006431:	83 ec 04             	sub    $0x4,%esp
c0006434:	68 00 02 00 00       	push   $0x200
c0006439:	50                   	push   %eax
c000643a:	ff 75 d0             	pushl  -0x30(%ebp)
c000643d:	e8 ff f8 ff ff       	call   c0005d41 <read>
c0006442:	83 c4 10             	add    $0x10,%esp
c0006445:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006448:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000644b:	01 45 f4             	add    %eax,-0xc(%ebp)
c000644e:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0006452:	74 02                	je     c0006456 <do_exec+0xe7>
c0006454:	eb d0                	jmp    c0006426 <do_exec+0xb7>
c0006456:	90                   	nop
c0006457:	83 ec 0c             	sub    $0xc,%esp
c000645a:	ff 75 d0             	pushl  -0x30(%ebp)
c000645d:	e8 d8 f9 ff ff       	call   c0005e3a <close>
c0006462:	83 c4 10             	add    $0x10,%esp
c0006465:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c000646b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000646e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006475:	eb 72                	jmp    c00064e9 <do_exec+0x17a>
c0006477:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000647a:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c000647e:	0f b7 d0             	movzwl %ax,%edx
c0006481:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006484:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0006488:	0f b7 c0             	movzwl %ax,%eax
c000648b:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c000648f:	01 c2                	add    %eax,%edx
c0006491:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0006497:	01 d0                	add    %edx,%eax
c0006499:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000649c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000649f:	8b 40 10             	mov    0x10(%eax),%eax
c00064a2:	89 c6                	mov    %eax,%esi
c00064a4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064a7:	8b 40 04             	mov    0x4(%eax),%eax
c00064aa:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00064b0:	01 d0                	add    %edx,%eax
c00064b2:	83 ec 08             	sub    $0x8,%esp
c00064b5:	50                   	push   %eax
c00064b6:	6a 05                	push   $0x5
c00064b8:	e8 e9 e6 ff ff       	call   c0004ba6 <v2l>
c00064bd:	83 c4 10             	add    $0x10,%esp
c00064c0:	89 c3                	mov    %eax,%ebx
c00064c2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064c5:	8b 40 08             	mov    0x8(%eax),%eax
c00064c8:	83 ec 08             	sub    $0x8,%esp
c00064cb:	50                   	push   %eax
c00064cc:	ff 75 d8             	pushl  -0x28(%ebp)
c00064cf:	e8 d2 e6 ff ff       	call   c0004ba6 <v2l>
c00064d4:	83 c4 10             	add    $0x10,%esp
c00064d7:	83 ec 04             	sub    $0x4,%esp
c00064da:	56                   	push   %esi
c00064db:	53                   	push   %ebx
c00064dc:	50                   	push   %eax
c00064dd:	e8 42 4e 00 00       	call   c000b324 <Memcpy>
c00064e2:	83 c4 10             	add    $0x10,%esp
c00064e5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00064e9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00064ec:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c00064f0:	0f b7 c0             	movzwl %ax,%eax
c00064f3:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00064f6:	0f 8c 7b ff ff ff    	jl     c0006477 <do_exec+0x108>
c00064fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00064ff:	8b 40 10             	mov    0x10(%eax),%eax
c0006502:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006505:	8b 45 08             	mov    0x8(%ebp),%eax
c0006508:	8b 40 1c             	mov    0x1c(%eax),%eax
c000650b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000650e:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c0006515:	83 ec 08             	sub    $0x8,%esp
c0006518:	ff 75 c0             	pushl  -0x40(%ebp)
c000651b:	ff 75 d8             	pushl  -0x28(%ebp)
c000651e:	e8 83 e6 ff ff       	call   c0004ba6 <v2l>
c0006523:	83 c4 10             	add    $0x10,%esp
c0006526:	89 c3                	mov    %eax,%ebx
c0006528:	83 ec 08             	sub    $0x8,%esp
c000652b:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006531:	50                   	push   %eax
c0006532:	6a 05                	push   $0x5
c0006534:	e8 6d e6 ff ff       	call   c0004ba6 <v2l>
c0006539:	83 c4 10             	add    $0x10,%esp
c000653c:	83 ec 04             	sub    $0x4,%esp
c000653f:	ff 75 bc             	pushl  -0x44(%ebp)
c0006542:	53                   	push   %ebx
c0006543:	50                   	push   %eax
c0006544:	e8 db 4d 00 00       	call   c000b324 <Memcpy>
c0006549:	83 c4 10             	add    $0x10,%esp
c000654c:	83 ec 08             	sub    $0x8,%esp
c000654f:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006555:	50                   	push   %eax
c0006556:	6a 05                	push   $0x5
c0006558:	e8 49 e6 ff ff       	call   c0004ba6 <v2l>
c000655d:	83 c4 10             	add    $0x10,%esp
c0006560:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006563:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006566:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006569:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006570:	eb 08                	jmp    c000657a <do_exec+0x20b>
c0006572:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006576:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000657a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000657d:	8b 00                	mov    (%eax),%eax
c000657f:	85 c0                	test   %eax,%eax
c0006581:	75 ef                	jne    c0006572 <do_exec+0x203>
c0006583:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006586:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0006589:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000658c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006593:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006599:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000659c:	eb 17                	jmp    c00065b5 <do_exec+0x246>
c000659e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00065a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065a5:	8b 10                	mov    (%eax),%edx
c00065a7:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00065aa:	01 c2                	add    %eax,%edx
c00065ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065af:	89 10                	mov    %edx,(%eax)
c00065b1:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00065b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065b8:	8b 00                	mov    (%eax),%eax
c00065ba:	85 c0                	test   %eax,%eax
c00065bc:	75 e0                	jne    c000659e <do_exec+0x22f>
c00065be:	83 ec 08             	sub    $0x8,%esp
c00065c1:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00065c7:	50                   	push   %eax
c00065c8:	6a 05                	push   $0x5
c00065ca:	e8 d7 e5 ff ff       	call   c0004ba6 <v2l>
c00065cf:	83 c4 10             	add    $0x10,%esp
c00065d2:	89 c3                	mov    %eax,%ebx
c00065d4:	83 ec 08             	sub    $0x8,%esp
c00065d7:	ff 75 b8             	pushl  -0x48(%ebp)
c00065da:	ff 75 d8             	pushl  -0x28(%ebp)
c00065dd:	e8 c4 e5 ff ff       	call   c0004ba6 <v2l>
c00065e2:	83 c4 10             	add    $0x10,%esp
c00065e5:	83 ec 04             	sub    $0x4,%esp
c00065e8:	ff 75 bc             	pushl  -0x44(%ebp)
c00065eb:	53                   	push   %ebx
c00065ec:	50                   	push   %eax
c00065ed:	e8 32 4d 00 00       	call   c000b324 <Memcpy>
c00065f2:	83 c4 10             	add    $0x10,%esp
c00065f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00065f8:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00065fb:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00065fe:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006601:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006607:	81 c2 94 35 08 c0    	add    $0xc0083594,%edx
c000660d:	89 02                	mov    %eax,(%edx)
c000660f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006612:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006615:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c000661b:	81 c2 90 35 08 c0    	add    $0xc0083590,%edx
c0006621:	89 02                	mov    %eax,(%edx)
c0006623:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006626:	8b 40 18             	mov    0x18(%eax),%eax
c0006629:	89 c2                	mov    %eax,%edx
c000662b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000662e:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006634:	05 98 35 08 c0       	add    $0xc0083598,%eax
c0006639:	89 10                	mov    %edx,(%eax)
c000663b:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000663e:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006641:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006647:	81 c2 a4 35 08 c0    	add    $0xc00835a4,%edx
c000664d:	89 02                	mov    %eax,(%edx)
c000664f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006652:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006658:	05 4c 35 08 c0       	add    $0xc008354c,%eax
c000665d:	c7 00 1d 00 00 00    	movl   $0x1d,(%eax)
c0006663:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c000666a:	00 00 00 
c000666d:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c0006674:	00 00 00 
c0006677:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c000667e:	00 00 00 
c0006681:	83 ec 04             	sub    $0x4,%esp
c0006684:	ff 75 d8             	pushl  -0x28(%ebp)
c0006687:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c000668d:	50                   	push   %eax
c000668e:	6a 01                	push   $0x1
c0006690:	e8 ce 33 00 00       	call   c0009a63 <send_rec>
c0006695:	83 c4 10             	add    $0x10,%esp
c0006698:	90                   	nop
c0006699:	8d 65 f8             	lea    -0x8(%ebp),%esp
c000669c:	5b                   	pop    %ebx
c000669d:	5e                   	pop    %esi
c000669e:	5d                   	pop    %ebp
c000669f:	c3                   	ret    

c00066a0 <do_fork>:
c00066a0:	55                   	push   %ebp
c00066a1:	89 e5                	mov    %esp,%ebp
c00066a3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00066a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00066ac:	8b 00                	mov    (%eax),%eax
c00066ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00066b1:	83 ec 0c             	sub    $0xc,%esp
c00066b4:	ff 75 f4             	pushl  -0xc(%ebp)
c00066b7:	e8 9f 3b 00 00       	call   c000a25b <fork_process>
c00066bc:	83 c4 10             	add    $0x10,%esp
c00066bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00066c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066c5:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00066cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00066ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066d1:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c00066d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00066da:	89 50 4c             	mov    %edx,0x4c(%eax)
c00066dd:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00066e4:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00066eb:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00066f2:	83 ec 04             	sub    $0x4,%esp
c00066f5:	ff 75 ec             	pushl  -0x14(%ebp)
c00066f8:	8d 45 80             	lea    -0x80(%ebp),%eax
c00066fb:	50                   	push   %eax
c00066fc:	6a 01                	push   $0x1
c00066fe:	e8 60 33 00 00       	call   c0009a63 <send_rec>
c0006703:	83 c4 10             	add    $0x10,%esp
c0006706:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006709:	c9                   	leave  
c000670a:	c3                   	ret    

c000670b <do_exit>:
c000670b:	55                   	push   %ebp
c000670c:	89 e5                	mov    %esp,%ebp
c000670e:	83 ec 18             	sub    $0x18,%esp
c0006711:	8b 45 08             	mov    0x8(%ebp),%eax
c0006714:	8b 00                	mov    (%eax),%eax
c0006716:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006719:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000671c:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006722:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006727:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000672a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000672d:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0006733:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006736:	8b 45 08             	mov    0x8(%ebp),%eax
c0006739:	8b 40 44             	mov    0x44(%eax),%eax
c000673c:	89 c2                	mov    %eax,%edx
c000673e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006741:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c0006747:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000674a:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006750:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006755:	0f b6 00             	movzbl (%eax),%eax
c0006758:	3c 04                	cmp    $0x4,%al
c000675a:	75 21                	jne    c000677d <do_exit+0x72>
c000675c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000675f:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006765:	05 45 35 08 c0       	add    $0xc0083545,%eax
c000676a:	c6 00 fb             	movb   $0xfb,(%eax)
c000676d:	83 ec 0c             	sub    $0xc,%esp
c0006770:	ff 75 ec             	pushl  -0x14(%ebp)
c0006773:	e8 59 01 00 00       	call   c00068d1 <cleanup>
c0006778:	83 c4 10             	add    $0x10,%esp
c000677b:	eb 0a                	jmp    c0006787 <do_exit+0x7c>
c000677d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006780:	c6 80 44 02 00 00 03 	movb   $0x3,0x244(%eax)
c0006787:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c000678e:	eb 6e                	jmp    c00067fe <do_exit+0xf3>
c0006790:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006793:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006799:	05 60 35 08 c0       	add    $0xc0083560,%eax
c000679e:	8b 00                	mov    (%eax),%eax
c00067a0:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00067a3:	75 55                	jne    c00067fa <do_exit+0xef>
c00067a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067a8:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067ae:	05 60 35 08 c0       	add    $0xc0083560,%eax
c00067b3:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00067b9:	0f b6 05 4d 45 08 c0 	movzbl 0xc008454d,%eax
c00067c0:	3c 04                	cmp    $0x4,%al
c00067c2:	75 36                	jne    c00067fa <do_exit+0xef>
c00067c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067c7:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067cd:	05 45 35 08 c0       	add    $0xc0083545,%eax
c00067d2:	0f b6 00             	movzbl (%eax),%eax
c00067d5:	3c 03                	cmp    $0x3,%al
c00067d7:	75 21                	jne    c00067fa <do_exit+0xef>
c00067d9:	c6 05 4d 45 08 c0 fb 	movb   $0xfb,0xc008454d
c00067e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067e3:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067e9:	05 00 33 08 c0       	add    $0xc0083300,%eax
c00067ee:	83 ec 0c             	sub    $0xc,%esp
c00067f1:	50                   	push   %eax
c00067f2:	e8 da 00 00 00       	call   c00068d1 <cleanup>
c00067f7:	83 c4 10             	add    $0x10,%esp
c00067fa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00067fe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006802:	7e 8c                	jle    c0006790 <do_exit+0x85>
c0006804:	90                   	nop
c0006805:	c9                   	leave  
c0006806:	c3                   	ret    

c0006807 <do_wait>:
c0006807:	55                   	push   %ebp
c0006808:	89 e5                	mov    %esp,%ebp
c000680a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006810:	8b 45 08             	mov    0x8(%ebp),%eax
c0006813:	8b 00                	mov    (%eax),%eax
c0006815:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006818:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000681f:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
c0006826:	eb 5f                	jmp    c0006887 <do_wait+0x80>
c0006828:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000682b:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006831:	05 60 35 08 c0       	add    $0xc0083560,%eax
c0006836:	8b 00                	mov    (%eax),%eax
c0006838:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000683b:	75 46                	jne    c0006883 <do_wait+0x7c>
c000683d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006841:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006844:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000684a:	05 45 35 08 c0       	add    $0xc0083545,%eax
c000684f:	0f b6 00             	movzbl (%eax),%eax
c0006852:	3c 03                	cmp    $0x3,%al
c0006854:	75 2d                	jne    c0006883 <do_wait+0x7c>
c0006856:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006859:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000685f:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006864:	c6 00 fb             	movb   $0xfb,(%eax)
c0006867:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000686a:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006870:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006875:	83 ec 0c             	sub    $0xc,%esp
c0006878:	50                   	push   %eax
c0006879:	e8 53 00 00 00       	call   c00068d1 <cleanup>
c000687e:	83 c4 10             	add    $0x10,%esp
c0006881:	eb 4c                	jmp    c00068cf <do_wait+0xc8>
c0006883:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006887:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000688b:	7e 9b                	jle    c0006828 <do_wait+0x21>
c000688d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006891:	74 13                	je     c00068a6 <do_wait+0x9f>
c0006893:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006896:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000689c:	05 45 35 08 c0       	add    $0xc0083545,%eax
c00068a1:	c6 00 04             	movb   $0x4,(%eax)
c00068a4:	eb 29                	jmp    c00068cf <do_wait+0xc8>
c00068a6:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00068ad:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00068b4:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00068bb:	83 ec 04             	sub    $0x4,%esp
c00068be:	ff 75 ec             	pushl  -0x14(%ebp)
c00068c1:	8d 45 80             	lea    -0x80(%ebp),%eax
c00068c4:	50                   	push   %eax
c00068c5:	6a 01                	push   $0x1
c00068c7:	e8 97 31 00 00       	call   c0009a63 <send_rec>
c00068cc:	83 c4 10             	add    $0x10,%esp
c00068cf:	c9                   	leave  
c00068d0:	c3                   	ret    

c00068d1 <cleanup>:
c00068d1:	55                   	push   %ebp
c00068d2:	89 e5                	mov    %esp,%ebp
c00068d4:	83 ec 78             	sub    $0x78,%esp
c00068d7:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00068de:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00068e5:	8b 45 08             	mov    0x8(%ebp),%eax
c00068e8:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00068ee:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00068f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00068f4:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c00068fa:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00068fd:	8b 45 08             	mov    0x8(%ebp),%eax
c0006900:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0006906:	83 ec 04             	sub    $0x4,%esp
c0006909:	50                   	push   %eax
c000690a:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000690d:	50                   	push   %eax
c000690e:	6a 01                	push   $0x1
c0006910:	e8 4e 31 00 00       	call   c0009a63 <send_rec>
c0006915:	83 c4 10             	add    $0x10,%esp
c0006918:	8b 45 08             	mov    0x8(%ebp),%eax
c000691b:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c0006922:	90                   	nop
c0006923:	c9                   	leave  
c0006924:	c3                   	ret    

c0006925 <init_bitmap>:
c0006925:	55                   	push   %ebp
c0006926:	89 e5                	mov    %esp,%ebp
c0006928:	83 ec 08             	sub    $0x8,%esp
c000692b:	8b 45 08             	mov    0x8(%ebp),%eax
c000692e:	8b 50 04             	mov    0x4(%eax),%edx
c0006931:	8b 45 08             	mov    0x8(%ebp),%eax
c0006934:	8b 00                	mov    (%eax),%eax
c0006936:	83 ec 04             	sub    $0x4,%esp
c0006939:	52                   	push   %edx
c000693a:	6a 00                	push   $0x0
c000693c:	50                   	push   %eax
c000693d:	e8 10 4a 00 00       	call   c000b352 <Memset>
c0006942:	83 c4 10             	add    $0x10,%esp
c0006945:	90                   	nop
c0006946:	c9                   	leave  
c0006947:	c3                   	ret    

c0006948 <test_bit_val>:
c0006948:	55                   	push   %ebp
c0006949:	89 e5                	mov    %esp,%ebp
c000694b:	53                   	push   %ebx
c000694c:	83 ec 10             	sub    $0x10,%esp
c000694f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006952:	8d 50 07             	lea    0x7(%eax),%edx
c0006955:	85 c0                	test   %eax,%eax
c0006957:	0f 48 c2             	cmovs  %edx,%eax
c000695a:	c1 f8 03             	sar    $0x3,%eax
c000695d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006960:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006963:	99                   	cltd   
c0006964:	c1 ea 1d             	shr    $0x1d,%edx
c0006967:	01 d0                	add    %edx,%eax
c0006969:	83 e0 07             	and    $0x7,%eax
c000696c:	29 d0                	sub    %edx,%eax
c000696e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006971:	8b 45 08             	mov    0x8(%ebp),%eax
c0006974:	8b 10                	mov    (%eax),%edx
c0006976:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006979:	01 d0                	add    %edx,%eax
c000697b:	0f b6 00             	movzbl (%eax),%eax
c000697e:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006981:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006985:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006988:	bb 01 00 00 00       	mov    $0x1,%ebx
c000698d:	89 c1                	mov    %eax,%ecx
c000698f:	d3 e3                	shl    %cl,%ebx
c0006991:	89 d8                	mov    %ebx,%eax
c0006993:	21 c2                	and    %eax,%edx
c0006995:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006998:	89 c1                	mov    %eax,%ecx
c000699a:	d3 fa                	sar    %cl,%edx
c000699c:	89 d0                	mov    %edx,%eax
c000699e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069a1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00069a5:	0f 9f c0             	setg   %al
c00069a8:	0f b6 c0             	movzbl %al,%eax
c00069ab:	83 c4 10             	add    $0x10,%esp
c00069ae:	5b                   	pop    %ebx
c00069af:	5d                   	pop    %ebp
c00069b0:	c3                   	ret    

c00069b1 <set_bit_val>:
c00069b1:	55                   	push   %ebp
c00069b2:	89 e5                	mov    %esp,%ebp
c00069b4:	83 ec 10             	sub    $0x10,%esp
c00069b7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069ba:	8d 50 07             	lea    0x7(%eax),%edx
c00069bd:	85 c0                	test   %eax,%eax
c00069bf:	0f 48 c2             	cmovs  %edx,%eax
c00069c2:	c1 f8 03             	sar    $0x3,%eax
c00069c5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069c8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069cb:	99                   	cltd   
c00069cc:	c1 ea 1d             	shr    $0x1d,%edx
c00069cf:	01 d0                	add    %edx,%eax
c00069d1:	83 e0 07             	and    $0x7,%eax
c00069d4:	29 d0                	sub    %edx,%eax
c00069d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00069dc:	8b 10                	mov    (%eax),%edx
c00069de:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00069e1:	01 d0                	add    %edx,%eax
c00069e3:	0f b6 00             	movzbl (%eax),%eax
c00069e6:	88 45 ff             	mov    %al,-0x1(%ebp)
c00069e9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c00069ed:	7e 13                	jle    c0006a02 <set_bit_val+0x51>
c00069ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00069f2:	ba 01 00 00 00       	mov    $0x1,%edx
c00069f7:	89 c1                	mov    %eax,%ecx
c00069f9:	d3 e2                	shl    %cl,%edx
c00069fb:	89 d0                	mov    %edx,%eax
c00069fd:	08 45 ff             	or     %al,-0x1(%ebp)
c0006a00:	eb 13                	jmp    c0006a15 <set_bit_val+0x64>
c0006a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a05:	ba 01 00 00 00       	mov    $0x1,%edx
c0006a0a:	89 c1                	mov    %eax,%ecx
c0006a0c:	d3 e2                	shl    %cl,%edx
c0006a0e:	89 d0                	mov    %edx,%eax
c0006a10:	f7 d0                	not    %eax
c0006a12:	20 45 ff             	and    %al,-0x1(%ebp)
c0006a15:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a18:	8b 10                	mov    (%eax),%edx
c0006a1a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a1d:	01 c2                	add    %eax,%edx
c0006a1f:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006a23:	88 02                	mov    %al,(%edx)
c0006a25:	b8 01 00 00 00       	mov    $0x1,%eax
c0006a2a:	c9                   	leave  
c0006a2b:	c3                   	ret    

c0006a2c <set_bits>:
c0006a2c:	55                   	push   %ebp
c0006a2d:	89 e5                	mov    %esp,%ebp
c0006a2f:	83 ec 10             	sub    $0x10,%esp
c0006a32:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006a39:	eb 1c                	jmp    c0006a57 <set_bits+0x2b>
c0006a3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a3e:	8d 50 01             	lea    0x1(%eax),%edx
c0006a41:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006a44:	ff 75 10             	pushl  0x10(%ebp)
c0006a47:	50                   	push   %eax
c0006a48:	ff 75 08             	pushl  0x8(%ebp)
c0006a4b:	e8 61 ff ff ff       	call   c00069b1 <set_bit_val>
c0006a50:	83 c4 0c             	add    $0xc,%esp
c0006a53:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006a57:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a5a:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006a5d:	7c dc                	jl     c0006a3b <set_bits+0xf>
c0006a5f:	b8 01 00 00 00       	mov    $0x1,%eax
c0006a64:	c9                   	leave  
c0006a65:	c3                   	ret    

c0006a66 <get_first_free_bit>:
c0006a66:	55                   	push   %ebp
c0006a67:	89 e5                	mov    %esp,%ebp
c0006a69:	83 ec 10             	sub    $0x10,%esp
c0006a6c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a6f:	8b 40 04             	mov    0x4(%eax),%eax
c0006a72:	c1 e0 03             	shl    $0x3,%eax
c0006a75:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a78:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a7b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006a7e:	eb 1b                	jmp    c0006a9b <get_first_free_bit+0x35>
c0006a80:	ff 75 fc             	pushl  -0x4(%ebp)
c0006a83:	ff 75 08             	pushl  0x8(%ebp)
c0006a86:	e8 bd fe ff ff       	call   c0006948 <test_bit_val>
c0006a8b:	83 c4 08             	add    $0x8,%esp
c0006a8e:	85 c0                	test   %eax,%eax
c0006a90:	75 05                	jne    c0006a97 <get_first_free_bit+0x31>
c0006a92:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a95:	eb 11                	jmp    c0006aa8 <get_first_free_bit+0x42>
c0006a97:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006a9b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a9e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006aa1:	7c dd                	jl     c0006a80 <get_first_free_bit+0x1a>
c0006aa3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006aa8:	c9                   	leave  
c0006aa9:	c3                   	ret    

c0006aaa <get_bits>:
c0006aaa:	55                   	push   %ebp
c0006aab:	89 e5                	mov    %esp,%ebp
c0006aad:	83 ec 20             	sub    $0x20,%esp
c0006ab0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006ab7:	ff 75 f0             	pushl  -0x10(%ebp)
c0006aba:	ff 75 08             	pushl  0x8(%ebp)
c0006abd:	e8 a4 ff ff ff       	call   c0006a66 <get_first_free_bit>
c0006ac2:	83 c4 08             	add    $0x8,%esp
c0006ac5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ac8:	8b 45 08             	mov    0x8(%ebp),%eax
c0006acb:	8b 40 04             	mov    0x4(%eax),%eax
c0006ace:	c1 e0 03             	shl    $0x3,%eax
c0006ad1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ad4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ad7:	83 e8 01             	sub    $0x1,%eax
c0006ada:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006add:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006ae1:	75 08                	jne    c0006aeb <get_bits+0x41>
c0006ae3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ae6:	e9 85 00 00 00       	jmp    c0006b70 <get_bits+0xc6>
c0006aeb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006aee:	83 c0 01             	add    $0x1,%eax
c0006af1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006af4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006afa:	eb 58                	jmp    c0006b54 <get_bits+0xaa>
c0006afc:	ff 75 f8             	pushl  -0x8(%ebp)
c0006aff:	ff 75 08             	pushl  0x8(%ebp)
c0006b02:	e8 41 fe ff ff       	call   c0006948 <test_bit_val>
c0006b07:	83 c4 08             	add    $0x8,%esp
c0006b0a:	85 c0                	test   %eax,%eax
c0006b0c:	75 0a                	jne    c0006b18 <get_bits+0x6e>
c0006b0e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006b12:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006b16:	eb 2b                	jmp    c0006b43 <get_bits+0x99>
c0006b18:	6a 00                	push   $0x0
c0006b1a:	ff 75 08             	pushl  0x8(%ebp)
c0006b1d:	e8 44 ff ff ff       	call   c0006a66 <get_first_free_bit>
c0006b22:	83 c4 08             	add    $0x8,%esp
c0006b25:	83 c0 01             	add    $0x1,%eax
c0006b28:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b2b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b2e:	83 c0 01             	add    $0x1,%eax
c0006b31:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b34:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b37:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b3a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b3d:	83 e8 01             	sub    $0x1,%eax
c0006b40:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b43:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b46:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006b49:	7c 09                	jl     c0006b54 <get_bits+0xaa>
c0006b4b:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006b52:	eb 0d                	jmp    c0006b61 <get_bits+0xb7>
c0006b54:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006b57:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006b5a:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006b5d:	85 c0                	test   %eax,%eax
c0006b5f:	7f 9b                	jg     c0006afc <get_bits+0x52>
c0006b61:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b64:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006b67:	83 c0 01             	add    $0x1,%eax
c0006b6a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b6d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b70:	c9                   	leave  
c0006b71:	c3                   	ret    

c0006b72 <get_a_page2>:
c0006b72:	55                   	push   %ebp
c0006b73:	89 e5                	mov    %esp,%ebp
c0006b75:	83 ec 18             	sub    $0x18,%esp
c0006b78:	83 ec 0c             	sub    $0xc,%esp
c0006b7b:	ff 75 0c             	pushl  0xc(%ebp)
c0006b7e:	e8 1e 00 00 00       	call   c0006ba1 <get_a_page>
c0006b83:	83 c4 10             	add    $0x10,%esp
c0006b86:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b89:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006b8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b8f:	83 ec 08             	sub    $0x8,%esp
c0006b92:	52                   	push   %edx
c0006b93:	50                   	push   %eax
c0006b94:	e8 61 01 00 00       	call   c0006cfa <add_map_entry>
c0006b99:	83 c4 10             	add    $0x10,%esp
c0006b9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b9f:	c9                   	leave  
c0006ba0:	c3                   	ret    

c0006ba1 <get_a_page>:
c0006ba1:	55                   	push   %ebp
c0006ba2:	89 e5                	mov    %esp,%ebp
c0006ba4:	83 ec 20             	sub    $0x20,%esp
c0006ba7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006bab:	75 22                	jne    c0006bcf <get_a_page+0x2e>
c0006bad:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0006bb2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006bb5:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c0006bba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006bbd:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0006bc2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006bc5:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0006bca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bcd:	eb 20                	jmp    c0006bef <get_a_page+0x4e>
c0006bcf:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0006bd4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006bd7:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0006bdc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006bdf:	a1 cc 1e 01 c0       	mov    0xc0011ecc,%eax
c0006be4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006be7:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0006bec:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006bf2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006bf5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006bf8:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006bfb:	6a 01                	push   $0x1
c0006bfd:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c00:	50                   	push   %eax
c0006c01:	e8 a4 fe ff ff       	call   c0006aaa <get_bits>
c0006c06:	83 c4 08             	add    $0x8,%esp
c0006c09:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006c0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c0f:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006c12:	c1 e2 0c             	shl    $0xc,%edx
c0006c15:	01 d0                	add    %edx,%eax
c0006c17:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c1a:	6a 01                	push   $0x1
c0006c1c:	ff 75 fc             	pushl  -0x4(%ebp)
c0006c1f:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c22:	50                   	push   %eax
c0006c23:	e8 89 fd ff ff       	call   c00069b1 <set_bit_val>
c0006c28:	83 c4 0c             	add    $0xc,%esp
c0006c2b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c2e:	c9                   	leave  
c0006c2f:	c3                   	ret    

c0006c30 <get_virtual_address>:
c0006c30:	55                   	push   %ebp
c0006c31:	89 e5                	mov    %esp,%ebp
c0006c33:	83 ec 28             	sub    $0x28,%esp
c0006c36:	e8 51 ac ff ff       	call   c000188c <get_running_thread_pcb>
c0006c3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c3e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006c42:	75 1a                	jne    c0006c5e <get_virtual_address+0x2e>
c0006c44:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0006c49:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c4c:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0006c51:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c54:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0006c59:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c5c:	eb 18                	jmp    c0006c76 <get_virtual_address+0x46>
c0006c5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c61:	8b 40 08             	mov    0x8(%eax),%eax
c0006c64:	83 ec 04             	sub    $0x4,%esp
c0006c67:	6a 0c                	push   $0xc
c0006c69:	50                   	push   %eax
c0006c6a:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c6d:	50                   	push   %eax
c0006c6e:	e8 b1 46 00 00       	call   c000b324 <Memcpy>
c0006c73:	83 c4 10             	add    $0x10,%esp
c0006c76:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006c79:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006c7c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006c7f:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006c82:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c85:	83 ec 08             	sub    $0x8,%esp
c0006c88:	50                   	push   %eax
c0006c89:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006c8c:	50                   	push   %eax
c0006c8d:	e8 18 fe ff ff       	call   c0006aaa <get_bits>
c0006c92:	83 c4 10             	add    $0x10,%esp
c0006c95:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c98:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006c9b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006c9e:	c1 e2 0c             	shl    $0xc,%edx
c0006ca1:	01 d0                	add    %edx,%eax
c0006ca3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ca6:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ca9:	50                   	push   %eax
c0006caa:	6a 01                	push   $0x1
c0006cac:	ff 75 f0             	pushl  -0x10(%ebp)
c0006caf:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006cb2:	50                   	push   %eax
c0006cb3:	e8 74 fd ff ff       	call   c0006a2c <set_bits>
c0006cb8:	83 c4 10             	add    $0x10,%esp
c0006cbb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006cbe:	c9                   	leave  
c0006cbf:	c3                   	ret    

c0006cc0 <ptr_pde>:
c0006cc0:	55                   	push   %ebp
c0006cc1:	89 e5                	mov    %esp,%ebp
c0006cc3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cc6:	c1 e8 16             	shr    $0x16,%eax
c0006cc9:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006cce:	c1 e0 02             	shl    $0x2,%eax
c0006cd1:	5d                   	pop    %ebp
c0006cd2:	c3                   	ret    

c0006cd3 <ptr_pte>:
c0006cd3:	55                   	push   %ebp
c0006cd4:	89 e5                	mov    %esp,%ebp
c0006cd6:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cd9:	c1 e8 0a             	shr    $0xa,%eax
c0006cdc:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006ce1:	89 c2                	mov    %eax,%edx
c0006ce3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ce6:	c1 e8 0c             	shr    $0xc,%eax
c0006ce9:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006cee:	c1 e0 02             	shl    $0x2,%eax
c0006cf1:	01 d0                	add    %edx,%eax
c0006cf3:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006cf8:	5d                   	pop    %ebp
c0006cf9:	c3                   	ret    

c0006cfa <add_map_entry>:
c0006cfa:	55                   	push   %ebp
c0006cfb:	89 e5                	mov    %esp,%ebp
c0006cfd:	83 ec 18             	sub    $0x18,%esp
c0006d00:	ff 75 08             	pushl  0x8(%ebp)
c0006d03:	e8 b8 ff ff ff       	call   c0006cc0 <ptr_pde>
c0006d08:	83 c4 04             	add    $0x4,%esp
c0006d0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d0e:	ff 75 08             	pushl  0x8(%ebp)
c0006d11:	e8 bd ff ff ff       	call   c0006cd3 <ptr_pte>
c0006d16:	83 c4 04             	add    $0x4,%esp
c0006d19:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d1f:	8b 00                	mov    (%eax),%eax
c0006d21:	83 e0 01             	and    $0x1,%eax
c0006d24:	85 c0                	test   %eax,%eax
c0006d26:	74 1b                	je     c0006d43 <add_map_entry+0x49>
c0006d28:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d2b:	8b 00                	mov    (%eax),%eax
c0006d2d:	83 e0 01             	and    $0x1,%eax
c0006d30:	85 c0                	test   %eax,%eax
c0006d32:	75 51                	jne    c0006d85 <add_map_entry+0x8b>
c0006d34:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d37:	83 c8 07             	or     $0x7,%eax
c0006d3a:	89 c2                	mov    %eax,%edx
c0006d3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d3f:	89 10                	mov    %edx,(%eax)
c0006d41:	eb 42                	jmp    c0006d85 <add_map_entry+0x8b>
c0006d43:	6a 00                	push   $0x0
c0006d45:	e8 57 fe ff ff       	call   c0006ba1 <get_a_page>
c0006d4a:	83 c4 04             	add    $0x4,%esp
c0006d4d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d50:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d53:	83 c8 07             	or     $0x7,%eax
c0006d56:	89 c2                	mov    %eax,%edx
c0006d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d5b:	89 10                	mov    %edx,(%eax)
c0006d5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d60:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006d65:	83 ec 04             	sub    $0x4,%esp
c0006d68:	68 00 10 00 00       	push   $0x1000
c0006d6d:	6a 00                	push   $0x0
c0006d6f:	50                   	push   %eax
c0006d70:	e8 dd 45 00 00       	call   c000b352 <Memset>
c0006d75:	83 c4 10             	add    $0x10,%esp
c0006d78:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d7b:	83 c8 07             	or     $0x7,%eax
c0006d7e:	89 c2                	mov    %eax,%edx
c0006d80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d83:	89 10                	mov    %edx,(%eax)
c0006d85:	90                   	nop
c0006d86:	c9                   	leave  
c0006d87:	c3                   	ret    

c0006d88 <alloc_virtual_memory>:
c0006d88:	55                   	push   %ebp
c0006d89:	89 e5                	mov    %esp,%ebp
c0006d8b:	83 ec 18             	sub    $0x18,%esp
c0006d8e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d91:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006d96:	c1 e8 0c             	shr    $0xc,%eax
c0006d99:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d9c:	e8 eb aa ff ff       	call   c000188c <get_running_thread_pcb>
c0006da1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006da4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006da7:	8b 40 04             	mov    0x4(%eax),%eax
c0006daa:	85 c0                	test   %eax,%eax
c0006dac:	75 09                	jne    c0006db7 <alloc_virtual_memory+0x2f>
c0006dae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006db5:	eb 07                	jmp    c0006dbe <alloc_virtual_memory+0x36>
c0006db7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006dbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006dc1:	83 ec 08             	sub    $0x8,%esp
c0006dc4:	ff 75 f4             	pushl  -0xc(%ebp)
c0006dc7:	50                   	push   %eax
c0006dc8:	e8 63 fe ff ff       	call   c0006c30 <get_virtual_address>
c0006dcd:	83 c4 10             	add    $0x10,%esp
c0006dd0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006dd3:	83 ec 08             	sub    $0x8,%esp
c0006dd6:	ff 75 08             	pushl  0x8(%ebp)
c0006dd9:	ff 75 e8             	pushl  -0x18(%ebp)
c0006ddc:	e8 19 ff ff ff       	call   c0006cfa <add_map_entry>
c0006de1:	83 c4 10             	add    $0x10,%esp
c0006de4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006de7:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006dec:	89 c2                	mov    %eax,%edx
c0006dee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006df1:	01 d0                	add    %edx,%eax
c0006df3:	c9                   	leave  
c0006df4:	c3                   	ret    

c0006df5 <get_physical_address>:
c0006df5:	55                   	push   %ebp
c0006df6:	89 e5                	mov    %esp,%ebp
c0006df8:	83 ec 10             	sub    $0x10,%esp
c0006dfb:	ff 75 08             	pushl  0x8(%ebp)
c0006dfe:	e8 d0 fe ff ff       	call   c0006cd3 <ptr_pte>
c0006e03:	83 c4 04             	add    $0x4,%esp
c0006e06:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e09:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e0c:	8b 00                	mov    (%eax),%eax
c0006e0e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e13:	89 c2                	mov    %eax,%edx
c0006e15:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e18:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e1d:	09 d0                	or     %edx,%eax
c0006e1f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e22:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e25:	c9                   	leave  
c0006e26:	c3                   	ret    

c0006e27 <alloc_memory>:
c0006e27:	55                   	push   %ebp
c0006e28:	89 e5                	mov    %esp,%ebp
c0006e2a:	83 ec 18             	sub    $0x18,%esp
c0006e2d:	83 ec 08             	sub    $0x8,%esp
c0006e30:	ff 75 0c             	pushl  0xc(%ebp)
c0006e33:	ff 75 08             	pushl  0x8(%ebp)
c0006e36:	e8 f5 fd ff ff       	call   c0006c30 <get_virtual_address>
c0006e3b:	83 c4 10             	add    $0x10,%esp
c0006e3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e44:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006e49:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e4c:	eb 29                	jmp    c0006e77 <alloc_memory+0x50>
c0006e4e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006e55:	83 ec 0c             	sub    $0xc,%esp
c0006e58:	ff 75 0c             	pushl  0xc(%ebp)
c0006e5b:	e8 41 fd ff ff       	call   c0006ba1 <get_a_page>
c0006e60:	83 c4 10             	add    $0x10,%esp
c0006e63:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e66:	83 ec 08             	sub    $0x8,%esp
c0006e69:	ff 75 ec             	pushl  -0x14(%ebp)
c0006e6c:	ff 75 f4             	pushl  -0xc(%ebp)
c0006e6f:	e8 86 fe ff ff       	call   c0006cfa <add_map_entry>
c0006e74:	83 c4 10             	add    $0x10,%esp
c0006e77:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e7a:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006e7d:	89 55 08             	mov    %edx,0x8(%ebp)
c0006e80:	85 c0                	test   %eax,%eax
c0006e82:	75 ca                	jne    c0006e4e <alloc_memory+0x27>
c0006e84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e87:	c9                   	leave  
c0006e88:	c3                   	ret    

c0006e89 <get_a_virtual_page>:
c0006e89:	55                   	push   %ebp
c0006e8a:	89 e5                	mov    %esp,%ebp
c0006e8c:	83 ec 18             	sub    $0x18,%esp
c0006e8f:	ff 75 08             	pushl  0x8(%ebp)
c0006e92:	e8 0a fd ff ff       	call   c0006ba1 <get_a_page>
c0006e97:	83 c4 04             	add    $0x4,%esp
c0006e9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e9d:	83 ec 08             	sub    $0x8,%esp
c0006ea0:	ff 75 f4             	pushl  -0xc(%ebp)
c0006ea3:	ff 75 0c             	pushl  0xc(%ebp)
c0006ea6:	e8 4f fe ff ff       	call   c0006cfa <add_map_entry>
c0006eab:	83 c4 10             	add    $0x10,%esp
c0006eae:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006eb1:	c9                   	leave  
c0006eb2:	c3                   	ret    

c0006eb3 <block2arena>:
c0006eb3:	55                   	push   %ebp
c0006eb4:	89 e5                	mov    %esp,%ebp
c0006eb6:	83 ec 10             	sub    $0x10,%esp
c0006eb9:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ebc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006ec1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ec4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ec7:	c9                   	leave  
c0006ec8:	c3                   	ret    

c0006ec9 <sys_malloc>:
c0006ec9:	55                   	push   %ebp
c0006eca:	89 e5                	mov    %esp,%ebp
c0006ecc:	83 ec 58             	sub    $0x58,%esp
c0006ecf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006ed6:	e8 b1 a9 ff ff       	call   c000188c <get_running_thread_pcb>
c0006edb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006ede:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006ee1:	8b 40 04             	mov    0x4(%eax),%eax
c0006ee4:	85 c0                	test   %eax,%eax
c0006ee6:	75 10                	jne    c0006ef8 <sys_malloc+0x2f>
c0006ee8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006eef:	c7 45 ec 00 32 08 c0 	movl   $0xc0083200,-0x14(%ebp)
c0006ef6:	eb 10                	jmp    c0006f08 <sys_malloc+0x3f>
c0006ef8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006eff:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f02:	83 c0 0c             	add    $0xc,%eax
c0006f05:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f08:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0006f0f:	76 50                	jbe    c0006f61 <sys_malloc+0x98>
c0006f11:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f14:	05 0b 10 00 00       	add    $0x100b,%eax
c0006f19:	c1 e8 0c             	shr    $0xc,%eax
c0006f1c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006f1f:	83 ec 08             	sub    $0x8,%esp
c0006f22:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f25:	ff 75 d8             	pushl  -0x28(%ebp)
c0006f28:	e8 fa fe ff ff       	call   c0006e27 <alloc_memory>
c0006f2d:	83 c4 10             	add    $0x10,%esp
c0006f30:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006f33:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006f36:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006f39:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f3c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0006f42:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f45:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0006f4c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f4f:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0006f53:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f56:	83 c0 0c             	add    $0xc,%eax
c0006f59:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f5c:	e9 7a 01 00 00       	jmp    c00070db <sys_malloc+0x212>
c0006f61:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006f68:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006f6f:	eb 26                	jmp    c0006f97 <sys_malloc+0xce>
c0006f71:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006f74:	89 d0                	mov    %edx,%eax
c0006f76:	01 c0                	add    %eax,%eax
c0006f78:	01 d0                	add    %edx,%eax
c0006f7a:	c1 e0 03             	shl    $0x3,%eax
c0006f7d:	89 c2                	mov    %eax,%edx
c0006f7f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f82:	01 d0                	add    %edx,%eax
c0006f84:	8b 00                	mov    (%eax),%eax
c0006f86:	39 45 08             	cmp    %eax,0x8(%ebp)
c0006f89:	77 08                	ja     c0006f93 <sys_malloc+0xca>
c0006f8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006f8e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006f91:	eb 0a                	jmp    c0006f9d <sys_malloc+0xd4>
c0006f93:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006f97:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0006f9b:	7e d4                	jle    c0006f71 <sys_malloc+0xa8>
c0006f9d:	83 ec 08             	sub    $0x8,%esp
c0006fa0:	ff 75 f0             	pushl  -0x10(%ebp)
c0006fa3:	6a 01                	push   $0x1
c0006fa5:	e8 7d fe ff ff       	call   c0006e27 <alloc_memory>
c0006faa:	83 c4 10             	add    $0x10,%esp
c0006fad:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006fb0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006fb3:	89 d0                	mov    %edx,%eax
c0006fb5:	01 c0                	add    %eax,%eax
c0006fb7:	01 d0                	add    %edx,%eax
c0006fb9:	c1 e0 03             	shl    $0x3,%eax
c0006fbc:	89 c2                	mov    %eax,%edx
c0006fbe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006fc1:	01 d0                	add    %edx,%eax
c0006fc3:	83 ec 04             	sub    $0x4,%esp
c0006fc6:	6a 18                	push   $0x18
c0006fc8:	50                   	push   %eax
c0006fc9:	ff 75 cc             	pushl  -0x34(%ebp)
c0006fcc:	e8 53 43 00 00       	call   c000b324 <Memcpy>
c0006fd1:	83 c4 10             	add    $0x10,%esp
c0006fd4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006fd7:	89 d0                	mov    %edx,%eax
c0006fd9:	01 c0                	add    %eax,%eax
c0006fdb:	01 d0                	add    %edx,%eax
c0006fdd:	c1 e0 03             	shl    $0x3,%eax
c0006fe0:	89 c2                	mov    %eax,%edx
c0006fe2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006fe5:	01 d0                	add    %edx,%eax
c0006fe7:	83 c0 08             	add    $0x8,%eax
c0006fea:	83 ec 0c             	sub    $0xc,%esp
c0006fed:	50                   	push   %eax
c0006fee:	e8 c0 34 00 00       	call   c000a4b3 <isListEmpty>
c0006ff3:	83 c4 10             	add    $0x10,%esp
c0006ff6:	3c 01                	cmp    $0x1,%al
c0006ff8:	0f 85 91 00 00 00    	jne    c000708f <sys_malloc+0x1c6>
c0006ffe:	83 ec 08             	sub    $0x8,%esp
c0007001:	ff 75 f0             	pushl  -0x10(%ebp)
c0007004:	6a 01                	push   $0x1
c0007006:	e8 1c fe ff ff       	call   c0006e27 <alloc_memory>
c000700b:	83 c4 10             	add    $0x10,%esp
c000700e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007011:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007014:	8b 00                	mov    (%eax),%eax
c0007016:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007019:	c7 45 c0 0c 00 00 00 	movl   $0xc,-0x40(%ebp)
c0007020:	b8 00 10 00 00       	mov    $0x1000,%eax
c0007025:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0007028:	ba 00 00 00 00       	mov    $0x0,%edx
c000702d:	f7 75 c4             	divl   -0x3c(%ebp)
c0007030:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007033:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0007036:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007039:	01 d0                	add    %edx,%eax
c000703b:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000703e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007045:	eb 3b                	jmp    c0007082 <sys_malloc+0x1b9>
c0007047:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000704a:	0f af 45 c4          	imul   -0x3c(%ebp),%eax
c000704e:	89 c2                	mov    %eax,%edx
c0007050:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007053:	01 d0                	add    %edx,%eax
c0007055:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0007058:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c000705b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000705e:	89 d0                	mov    %edx,%eax
c0007060:	01 c0                	add    %eax,%eax
c0007062:	01 d0                	add    %edx,%eax
c0007064:	c1 e0 03             	shl    $0x3,%eax
c0007067:	89 c2                	mov    %eax,%edx
c0007069:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000706c:	01 d0                	add    %edx,%eax
c000706e:	83 c0 08             	add    $0x8,%eax
c0007071:	83 ec 08             	sub    $0x8,%esp
c0007074:	51                   	push   %ecx
c0007075:	50                   	push   %eax
c0007076:	e8 59 34 00 00       	call   c000a4d4 <appendToDoubleLinkList>
c000707b:	83 c4 10             	add    $0x10,%esp
c000707e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007082:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007085:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007088:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000708b:	39 c2                	cmp    %eax,%edx
c000708d:	77 b8                	ja     c0007047 <sys_malloc+0x17e>
c000708f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007092:	89 d0                	mov    %edx,%eax
c0007094:	01 c0                	add    %eax,%eax
c0007096:	01 d0                	add    %edx,%eax
c0007098:	c1 e0 03             	shl    $0x3,%eax
c000709b:	89 c2                	mov    %eax,%edx
c000709d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070a0:	01 d0                	add    %edx,%eax
c00070a2:	83 c0 08             	add    $0x8,%eax
c00070a5:	83 ec 0c             	sub    $0xc,%esp
c00070a8:	50                   	push   %eax
c00070a9:	e8 ac 34 00 00       	call   c000a55a <popFromDoubleLinkList>
c00070ae:	83 c4 10             	add    $0x10,%esp
c00070b1:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00070b4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00070b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070ba:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00070bd:	83 ec 0c             	sub    $0xc,%esp
c00070c0:	50                   	push   %eax
c00070c1:	e8 ed fd ff ff       	call   c0006eb3 <block2arena>
c00070c6:	83 c4 10             	add    $0x10,%esp
c00070c9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00070cc:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00070cf:	8b 40 04             	mov    0x4(%eax),%eax
c00070d2:	8d 50 ff             	lea    -0x1(%eax),%edx
c00070d5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00070d8:	89 50 04             	mov    %edx,0x4(%eax)
c00070db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00070de:	c9                   	leave  
c00070df:	c3                   	ret    

c00070e0 <remove_map_entry>:
c00070e0:	55                   	push   %ebp
c00070e1:	89 e5                	mov    %esp,%ebp
c00070e3:	83 ec 10             	sub    $0x10,%esp
c00070e6:	ff 75 08             	pushl  0x8(%ebp)
c00070e9:	e8 e5 fb ff ff       	call   c0006cd3 <ptr_pte>
c00070ee:	83 c4 04             	add    $0x4,%esp
c00070f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00070f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00070f7:	8b 10                	mov    (%eax),%edx
c00070f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00070fc:	89 10                	mov    %edx,(%eax)
c00070fe:	90                   	nop
c00070ff:	c9                   	leave  
c0007100:	c3                   	ret    

c0007101 <free_a_page>:
c0007101:	55                   	push   %ebp
c0007102:	89 e5                	mov    %esp,%ebp
c0007104:	83 ec 20             	sub    $0x20,%esp
c0007107:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000710b:	75 21                	jne    c000712e <free_a_page+0x2d>
c000710d:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0007112:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007115:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c000711a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000711d:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0007122:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007125:	c7 45 fc 8c 16 01 c0 	movl   $0xc001168c,-0x4(%ebp)
c000712c:	eb 1f                	jmp    c000714d <free_a_page+0x4c>
c000712e:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0007133:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007136:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c000713b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000713e:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0007143:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007146:	c7 45 fc c4 1e 01 c0 	movl   $0xc0011ec4,-0x4(%ebp)
c000714d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007150:	c1 e8 0c             	shr    $0xc,%eax
c0007153:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007156:	6a 00                	push   $0x0
c0007158:	ff 75 f8             	pushl  -0x8(%ebp)
c000715b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000715e:	50                   	push   %eax
c000715f:	e8 4d f8 ff ff       	call   c00069b1 <set_bit_val>
c0007164:	83 c4 0c             	add    $0xc,%esp
c0007167:	ff 75 08             	pushl  0x8(%ebp)
c000716a:	e8 86 fc ff ff       	call   c0006df5 <get_physical_address>
c000716f:	83 c4 04             	add    $0x4,%esp
c0007172:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007175:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007178:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000717e:	85 c0                	test   %eax,%eax
c0007180:	0f 48 c2             	cmovs  %edx,%eax
c0007183:	c1 f8 0c             	sar    $0xc,%eax
c0007186:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007189:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000718c:	6a 00                	push   $0x0
c000718e:	ff 75 f0             	pushl  -0x10(%ebp)
c0007191:	50                   	push   %eax
c0007192:	e8 1a f8 ff ff       	call   c00069b1 <set_bit_val>
c0007197:	83 c4 0c             	add    $0xc,%esp
c000719a:	ff 75 08             	pushl  0x8(%ebp)
c000719d:	e8 3e ff ff ff       	call   c00070e0 <remove_map_entry>
c00071a2:	83 c4 04             	add    $0x4,%esp
c00071a5:	90                   	nop
c00071a6:	c9                   	leave  
c00071a7:	c3                   	ret    

c00071a8 <sys_free>:
c00071a8:	55                   	push   %ebp
c00071a9:	89 e5                	mov    %esp,%ebp
c00071ab:	83 ec 48             	sub    $0x48,%esp
c00071ae:	e8 d9 a6 ff ff       	call   c000188c <get_running_thread_pcb>
c00071b3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00071b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00071b9:	8b 40 04             	mov    0x4(%eax),%eax
c00071bc:	85 c0                	test   %eax,%eax
c00071be:	75 09                	jne    c00071c9 <sys_free+0x21>
c00071c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00071c7:	eb 07                	jmp    c00071d0 <sys_free+0x28>
c00071c9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00071d0:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c00071d7:	76 4d                	jbe    c0007226 <sys_free+0x7e>
c00071d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00071dc:	83 e8 0c             	sub    $0xc,%eax
c00071df:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00071e2:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c00071e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00071e9:	05 ff 0f 00 00       	add    $0xfff,%eax
c00071ee:	c1 e8 0c             	shr    $0xc,%eax
c00071f1:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00071f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00071fb:	eb 1c                	jmp    c0007219 <sys_free+0x71>
c00071fd:	83 ec 08             	sub    $0x8,%esp
c0007200:	ff 75 f4             	pushl  -0xc(%ebp)
c0007203:	ff 75 f0             	pushl  -0x10(%ebp)
c0007206:	e8 f6 fe ff ff       	call   c0007101 <free_a_page>
c000720b:	83 c4 10             	add    $0x10,%esp
c000720e:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
c0007215:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007219:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000721c:	39 45 d8             	cmp    %eax,-0x28(%ebp)
c000721f:	77 dc                	ja     c00071fd <sys_free+0x55>
c0007221:	e9 ef 00 00 00       	jmp    c0007315 <sys_free+0x16d>
c0007226:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000722d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007234:	eb 24                	jmp    c000725a <sys_free+0xb2>
c0007236:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007239:	89 d0                	mov    %edx,%eax
c000723b:	01 c0                	add    %eax,%eax
c000723d:	01 d0                	add    %edx,%eax
c000723f:	c1 e0 03             	shl    $0x3,%eax
c0007242:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0007247:	8b 00                	mov    (%eax),%eax
c0007249:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000724c:	77 08                	ja     c0007256 <sys_free+0xae>
c000724e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007251:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007254:	eb 0a                	jmp    c0007260 <sys_free+0xb8>
c0007256:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000725a:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c000725e:	7e d6                	jle    c0007236 <sys_free+0x8e>
c0007260:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007263:	89 d0                	mov    %edx,%eax
c0007265:	01 c0                	add    %eax,%eax
c0007267:	01 d0                	add    %edx,%eax
c0007269:	c1 e0 03             	shl    $0x3,%eax
c000726c:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0007271:	8b 10                	mov    (%eax),%edx
c0007273:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0007276:	8b 50 04             	mov    0x4(%eax),%edx
c0007279:	89 55 bc             	mov    %edx,-0x44(%ebp)
c000727c:	8b 50 08             	mov    0x8(%eax),%edx
c000727f:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0007282:	8b 50 0c             	mov    0xc(%eax),%edx
c0007285:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0007288:	8b 50 10             	mov    0x10(%eax),%edx
c000728b:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000728e:	8b 40 14             	mov    0x14(%eax),%eax
c0007291:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007294:	8b 45 08             	mov    0x8(%ebp),%eax
c0007297:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000729a:	83 ec 0c             	sub    $0xc,%esp
c000729d:	ff 75 d4             	pushl  -0x2c(%ebp)
c00072a0:	e8 0e fc ff ff       	call   c0006eb3 <block2arena>
c00072a5:	83 c4 10             	add    $0x10,%esp
c00072a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00072ab:	83 ec 08             	sub    $0x8,%esp
c00072ae:	ff 75 d4             	pushl  -0x2c(%ebp)
c00072b1:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00072b4:	83 c0 08             	add    $0x8,%eax
c00072b7:	50                   	push   %eax
c00072b8:	e8 17 32 00 00       	call   c000a4d4 <appendToDoubleLinkList>
c00072bd:	83 c4 10             	add    $0x10,%esp
c00072c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00072c3:	8b 40 04             	mov    0x4(%eax),%eax
c00072c6:	8d 50 01             	lea    0x1(%eax),%edx
c00072c9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00072cc:	89 50 04             	mov    %edx,0x4(%eax)
c00072cf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00072d2:	8b 50 04             	mov    0x4(%eax),%edx
c00072d5:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00072d8:	39 c2                	cmp    %eax,%edx
c00072da:	75 39                	jne    c0007315 <sys_free+0x16d>
c00072dc:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00072e3:	eb 16                	jmp    c00072fb <sys_free+0x153>
c00072e5:	83 ec 0c             	sub    $0xc,%esp
c00072e8:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00072eb:	83 c0 08             	add    $0x8,%eax
c00072ee:	50                   	push   %eax
c00072ef:	e8 66 32 00 00       	call   c000a55a <popFromDoubleLinkList>
c00072f4:	83 c4 10             	add    $0x10,%esp
c00072f7:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00072fb:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00072fe:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0007301:	7c e2                	jl     c00072e5 <sys_free+0x13d>
c0007303:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007306:	83 ec 08             	sub    $0x8,%esp
c0007309:	ff 75 f4             	pushl  -0xc(%ebp)
c000730c:	50                   	push   %eax
c000730d:	e8 ef fd ff ff       	call   c0007101 <free_a_page>
c0007312:	83 c4 10             	add    $0x10,%esp
c0007315:	90                   	nop
c0007316:	c9                   	leave  
c0007317:	c3                   	ret    

c0007318 <init_memory_block_desc>:
c0007318:	55                   	push   %ebp
c0007319:	89 e5                	mov    %esp,%ebp
c000731b:	83 ec 18             	sub    $0x18,%esp
c000731e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007325:	e9 b2 00 00 00       	jmp    c00073dc <init_memory_block_desc+0xc4>
c000732a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000732e:	75 1b                	jne    c000734b <init_memory_block_desc+0x33>
c0007330:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007333:	89 d0                	mov    %edx,%eax
c0007335:	01 c0                	add    %eax,%eax
c0007337:	01 d0                	add    %edx,%eax
c0007339:	c1 e0 03             	shl    $0x3,%eax
c000733c:	89 c2                	mov    %eax,%edx
c000733e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007341:	01 d0                	add    %edx,%eax
c0007343:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0007349:	eb 2e                	jmp    c0007379 <init_memory_block_desc+0x61>
c000734b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000734e:	89 d0                	mov    %edx,%eax
c0007350:	01 c0                	add    %eax,%eax
c0007352:	01 d0                	add    %edx,%eax
c0007354:	c1 e0 03             	shl    $0x3,%eax
c0007357:	8d 50 e8             	lea    -0x18(%eax),%edx
c000735a:	8b 45 08             	mov    0x8(%ebp),%eax
c000735d:	01 d0                	add    %edx,%eax
c000735f:	8b 08                	mov    (%eax),%ecx
c0007361:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007364:	89 d0                	mov    %edx,%eax
c0007366:	01 c0                	add    %eax,%eax
c0007368:	01 d0                	add    %edx,%eax
c000736a:	c1 e0 03             	shl    $0x3,%eax
c000736d:	89 c2                	mov    %eax,%edx
c000736f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007372:	01 d0                	add    %edx,%eax
c0007374:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007377:	89 10                	mov    %edx,(%eax)
c0007379:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000737c:	89 d0                	mov    %edx,%eax
c000737e:	01 c0                	add    %eax,%eax
c0007380:	01 d0                	add    %edx,%eax
c0007382:	c1 e0 03             	shl    $0x3,%eax
c0007385:	89 c2                	mov    %eax,%edx
c0007387:	8b 45 08             	mov    0x8(%ebp),%eax
c000738a:	01 d0                	add    %edx,%eax
c000738c:	8b 00                	mov    (%eax),%eax
c000738e:	89 c1                	mov    %eax,%ecx
c0007390:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0007395:	ba 00 00 00 00       	mov    $0x0,%edx
c000739a:	f7 f1                	div    %ecx
c000739c:	89 c1                	mov    %eax,%ecx
c000739e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00073a1:	89 d0                	mov    %edx,%eax
c00073a3:	01 c0                	add    %eax,%eax
c00073a5:	01 d0                	add    %edx,%eax
c00073a7:	c1 e0 03             	shl    $0x3,%eax
c00073aa:	89 c2                	mov    %eax,%edx
c00073ac:	8b 45 08             	mov    0x8(%ebp),%eax
c00073af:	01 d0                	add    %edx,%eax
c00073b1:	89 ca                	mov    %ecx,%edx
c00073b3:	89 50 04             	mov    %edx,0x4(%eax)
c00073b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00073b9:	89 d0                	mov    %edx,%eax
c00073bb:	01 c0                	add    %eax,%eax
c00073bd:	01 d0                	add    %edx,%eax
c00073bf:	c1 e0 03             	shl    $0x3,%eax
c00073c2:	89 c2                	mov    %eax,%edx
c00073c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00073c7:	01 d0                	add    %edx,%eax
c00073c9:	83 c0 08             	add    $0x8,%eax
c00073cc:	83 ec 0c             	sub    $0xc,%esp
c00073cf:	50                   	push   %eax
c00073d0:	e8 b0 30 00 00       	call   c000a485 <initDoubleLinkList>
c00073d5:	83 c4 10             	add    $0x10,%esp
c00073d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00073dc:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00073e0:	0f 8e 44 ff ff ff    	jle    c000732a <init_memory_block_desc+0x12>
c00073e6:	90                   	nop
c00073e7:	c9                   	leave  
c00073e8:	c3                   	ret    

c00073e9 <init_memory2>:
c00073e9:	55                   	push   %ebp
c00073ea:	89 e5                	mov    %esp,%ebp
c00073ec:	83 ec 38             	sub    $0x38,%esp
c00073ef:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00073f6:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00073fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007400:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c0007405:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007408:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c000740d:	29 c2                	sub    %eax,%edx
c000740f:	89 d0                	mov    %edx,%eax
c0007411:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007414:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007417:	89 c2                	mov    %eax,%edx
c0007419:	c1 ea 1f             	shr    $0x1f,%edx
c000741c:	01 d0                	add    %edx,%eax
c000741e:	d1 f8                	sar    %eax
c0007420:	a3 98 16 01 c0       	mov    %eax,0xc0011698
c0007425:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000742a:	83 ec 0c             	sub    $0xc,%esp
c000742d:	50                   	push   %eax
c000742e:	e8 0f 06 00 00       	call   c0007a42 <disp_int>
c0007433:	83 c4 10             	add    $0x10,%esp
c0007436:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000743b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000743e:	29 c2                	sub    %eax,%edx
c0007440:	89 d0                	mov    %edx,%eax
c0007442:	a3 d0 1e 01 c0       	mov    %eax,0xc0011ed0
c0007447:	83 ec 0c             	sub    $0xc,%esp
c000744a:	68 16 ac 00 c0       	push   $0xc000ac16
c000744f:	e8 38 a1 ff ff       	call   c000158c <disp_str>
c0007454:	83 c4 10             	add    $0x10,%esp
c0007457:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c000745c:	83 ec 0c             	sub    $0xc,%esp
c000745f:	50                   	push   %eax
c0007460:	e8 dd 05 00 00       	call   c0007a42 <disp_int>
c0007465:	83 c4 10             	add    $0x10,%esp
c0007468:	83 ec 0c             	sub    $0xc,%esp
c000746b:	68 16 ac 00 c0       	push   $0xc000ac16
c0007470:	e8 17 a1 ff ff       	call   c000158c <disp_str>
c0007475:	83 c4 10             	add    $0x10,%esp
c0007478:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000747d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007482:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007488:	85 c0                	test   %eax,%eax
c000748a:	0f 48 c2             	cmovs  %edx,%eax
c000748d:	c1 f8 0c             	sar    $0xc,%eax
c0007490:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007493:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007496:	83 c0 07             	add    $0x7,%eax
c0007499:	8d 50 07             	lea    0x7(%eax),%edx
c000749c:	85 c0                	test   %eax,%eax
c000749e:	0f 48 c2             	cmovs  %edx,%eax
c00074a1:	c1 f8 03             	sar    $0x3,%eax
c00074a4:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c00074a9:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00074ae:	2d 00 00 00 40       	sub    $0x40000000,%eax
c00074b3:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c00074b8:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00074be:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c00074c3:	83 ec 04             	sub    $0x4,%esp
c00074c6:	52                   	push   %edx
c00074c7:	6a 00                	push   $0x0
c00074c9:	50                   	push   %eax
c00074ca:	e8 83 3e 00 00       	call   c000b352 <Memset>
c00074cf:	83 c4 10             	add    $0x10,%esp
c00074d2:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c00074d7:	05 ff 0f 00 00       	add    $0xfff,%eax
c00074dc:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00074e2:	85 c0                	test   %eax,%eax
c00074e4:	0f 48 c2             	cmovs  %edx,%eax
c00074e7:	c1 f8 0c             	sar    $0xc,%eax
c00074ea:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00074ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00074f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00074f3:	ff 75 e8             	pushl  -0x18(%ebp)
c00074f6:	6a 01                	push   $0x1
c00074f8:	6a 00                	push   $0x0
c00074fa:	68 8c 16 01 c0       	push   $0xc001168c
c00074ff:	e8 28 f5 ff ff       	call   c0006a2c <set_bits>
c0007504:	83 c4 10             	add    $0x10,%esp
c0007507:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c000750c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007511:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007517:	85 c0                	test   %eax,%eax
c0007519:	0f 48 c2             	cmovs  %edx,%eax
c000751c:	c1 f8 0c             	sar    $0xc,%eax
c000751f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007522:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007525:	83 c0 07             	add    $0x7,%eax
c0007528:	8d 50 07             	lea    0x7(%eax),%edx
c000752b:	85 c0                	test   %eax,%eax
c000752d:	0f 48 c2             	cmovs  %edx,%eax
c0007530:	c1 f8 03             	sar    $0x3,%eax
c0007533:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c0007538:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c000753d:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c0007543:	01 d0                	add    %edx,%eax
c0007545:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c000754a:	8b 15 c8 1e 01 c0    	mov    0xc0011ec8,%edx
c0007550:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0007555:	83 ec 04             	sub    $0x4,%esp
c0007558:	52                   	push   %edx
c0007559:	6a 00                	push   $0x0
c000755b:	50                   	push   %eax
c000755c:	e8 f1 3d 00 00       	call   c000b352 <Memset>
c0007561:	83 c4 10             	add    $0x10,%esp
c0007564:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0007569:	05 ff 0f 00 00       	add    $0xfff,%eax
c000756e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007574:	85 c0                	test   %eax,%eax
c0007576:	0f 48 c2             	cmovs  %edx,%eax
c0007579:	c1 f8 0c             	sar    $0xc,%eax
c000757c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000757f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007582:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007585:	ff 75 e8             	pushl  -0x18(%ebp)
c0007588:	6a 01                	push   $0x1
c000758a:	ff 75 e0             	pushl  -0x20(%ebp)
c000758d:	68 8c 16 01 c0       	push   $0xc001168c
c0007592:	e8 95 f4 ff ff       	call   c0006a2c <set_bits>
c0007597:	83 c4 10             	add    $0x10,%esp
c000759a:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c00075a1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00075a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00075a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00075aa:	83 c0 07             	add    $0x7,%eax
c00075ad:	8d 50 07             	lea    0x7(%eax),%edx
c00075b0:	85 c0                	test   %eax,%eax
c00075b2:	0f 48 c2             	cmovs  %edx,%eax
c00075b5:	c1 f8 03             	sar    $0x3,%eax
c00075b8:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c00075bd:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00075c2:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00075c8:	01 c2                	add    %eax,%edx
c00075ca:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c00075cf:	01 d0                	add    %edx,%eax
c00075d1:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c00075d6:	8b 15 38 f7 00 c0    	mov    0xc000f738,%edx
c00075dc:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c00075e1:	83 ec 04             	sub    $0x4,%esp
c00075e4:	52                   	push   %edx
c00075e5:	6a 00                	push   $0x0
c00075e7:	50                   	push   %eax
c00075e8:	e8 65 3d 00 00       	call   c000b352 <Memset>
c00075ed:	83 c4 10             	add    $0x10,%esp
c00075f0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00075f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00075f6:	01 d0                	add    %edx,%eax
c00075f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00075fb:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0007600:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007605:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000760b:	85 c0                	test   %eax,%eax
c000760d:	0f 48 c2             	cmovs  %edx,%eax
c0007610:	c1 f8 0c             	sar    $0xc,%eax
c0007613:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007616:	ff 75 e8             	pushl  -0x18(%ebp)
c0007619:	6a 01                	push   $0x1
c000761b:	ff 75 e0             	pushl  -0x20(%ebp)
c000761e:	68 8c 16 01 c0       	push   $0xc001168c
c0007623:	e8 04 f4 ff ff       	call   c0006a2c <set_bits>
c0007628:	83 c4 10             	add    $0x10,%esp
c000762b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000762e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007631:	01 d0                	add    %edx,%eax
c0007633:	c1 e0 0c             	shl    $0xc,%eax
c0007636:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c000763b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000763e:	83 c0 02             	add    $0x2,%eax
c0007641:	c1 e0 0c             	shl    $0xc,%eax
c0007644:	89 c2                	mov    %eax,%edx
c0007646:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007649:	01 d0                	add    %edx,%eax
c000764b:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c0007650:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007657:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000765a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000765d:	90                   	nop
c000765e:	c9                   	leave  
c000765f:	c3                   	ret    

c0007660 <init_memory>:
c0007660:	55                   	push   %ebp
c0007661:	89 e5                	mov    %esp,%ebp
c0007663:	83 ec 38             	sub    $0x38,%esp
c0007666:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c000766d:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007674:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c000767b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000767e:	05 00 00 10 00       	add    $0x100000,%eax
c0007683:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007686:	8b 45 08             	mov    0x8(%ebp),%eax
c0007689:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000768c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007692:	85 c0                	test   %eax,%eax
c0007694:	0f 48 c2             	cmovs  %edx,%eax
c0007697:	c1 f8 0c             	sar    $0xc,%eax
c000769a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000769d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00076a0:	89 c2                	mov    %eax,%edx
c00076a2:	c1 ea 1f             	shr    $0x1f,%edx
c00076a5:	01 d0                	add    %edx,%eax
c00076a7:	d1 f8                	sar    %eax
c00076a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00076ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00076af:	2b 45 e0             	sub    -0x20(%ebp),%eax
c00076b2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00076b5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00076b8:	8d 50 07             	lea    0x7(%eax),%edx
c00076bb:	85 c0                	test   %eax,%eax
c00076bd:	0f 48 c2             	cmovs  %edx,%eax
c00076c0:	c1 f8 03             	sar    $0x3,%eax
c00076c3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00076c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00076c9:	8d 50 07             	lea    0x7(%eax),%edx
c00076cc:	85 c0                	test   %eax,%eax
c00076ce:	0f 48 c2             	cmovs  %edx,%eax
c00076d1:	c1 f8 03             	sar    $0x3,%eax
c00076d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00076d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00076da:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c00076df:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00076e4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00076e7:	c1 e2 0c             	shl    $0xc,%edx
c00076ea:	01 d0                	add    %edx,%eax
c00076ec:	a3 cc 1e 01 c0       	mov    %eax,0xc0011ecc
c00076f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00076f4:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c00076f9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00076fc:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c0007701:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0007706:	83 ec 04             	sub    $0x4,%esp
c0007709:	ff 75 d8             	pushl  -0x28(%ebp)
c000770c:	6a 00                	push   $0x0
c000770e:	50                   	push   %eax
c000770f:	e8 3e 3c 00 00       	call   c000b352 <Memset>
c0007714:	83 c4 10             	add    $0x10,%esp
c0007717:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000771a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000771d:	01 d0                	add    %edx,%eax
c000771f:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c0007724:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007727:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c000772c:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0007731:	83 ec 04             	sub    $0x4,%esp
c0007734:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007737:	6a 00                	push   $0x0
c0007739:	50                   	push   %eax
c000773a:	e8 13 3c 00 00       	call   c000b352 <Memset>
c000773f:	83 c4 10             	add    $0x10,%esp
c0007742:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007745:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c000774a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000774d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007750:	01 c2                	add    %eax,%edx
c0007752:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007755:	01 d0                	add    %edx,%eax
c0007757:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c000775c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000775f:	05 00 00 10 00       	add    $0x100000,%eax
c0007764:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c0007769:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c000776e:	83 ec 04             	sub    $0x4,%esp
c0007771:	ff 75 d8             	pushl  -0x28(%ebp)
c0007774:	6a 00                	push   $0x0
c0007776:	50                   	push   %eax
c0007777:	e8 d6 3b 00 00       	call   c000b352 <Memset>
c000777c:	83 c4 10             	add    $0x10,%esp
c000777f:	83 ec 0c             	sub    $0xc,%esp
c0007782:	68 00 32 08 c0       	push   $0xc0083200
c0007787:	e8 8c fb ff ff       	call   c0007318 <init_memory_block_desc>
c000778c:	83 c4 10             	add    $0x10,%esp
c000778f:	90                   	nop
c0007790:	c9                   	leave  
c0007791:	c3                   	ret    

c0007792 <untar>:
c0007792:	55                   	push   %ebp
c0007793:	89 e5                	mov    %esp,%ebp
c0007795:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c000779b:	83 ec 08             	sub    $0x8,%esp
c000779e:	6a 00                	push   $0x0
c00077a0:	ff 75 08             	pushl  0x8(%ebp)
c00077a3:	e8 14 e5 ff ff       	call   c0005cbc <open>
c00077a8:	83 c4 10             	add    $0x10,%esp
c00077ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00077ae:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00077b5:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c00077bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00077c3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00077ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00077ce:	7e 58                	jle    c0007828 <untar+0x96>
c00077d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00077d3:	05 ff 01 00 00       	add    $0x1ff,%eax
c00077d8:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00077de:	85 c0                	test   %eax,%eax
c00077e0:	0f 48 c2             	cmovs  %edx,%eax
c00077e3:	c1 f8 09             	sar    $0x9,%eax
c00077e6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00077e9:	83 ec 04             	sub    $0x4,%esp
c00077ec:	68 00 20 00 00       	push   $0x2000
c00077f1:	6a 00                	push   $0x0
c00077f3:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00077f9:	50                   	push   %eax
c00077fa:	e8 53 3b 00 00       	call   c000b352 <Memset>
c00077ff:	83 c4 10             	add    $0x10,%esp
c0007802:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007805:	c1 e0 09             	shl    $0x9,%eax
c0007808:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000780b:	83 ec 04             	sub    $0x4,%esp
c000780e:	50                   	push   %eax
c000780f:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007815:	50                   	push   %eax
c0007816:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007819:	e8 23 e5 ff ff       	call   c0005d41 <read>
c000781e:	83 c4 10             	add    $0x10,%esp
c0007821:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007828:	83 ec 04             	sub    $0x4,%esp
c000782b:	68 00 20 00 00       	push   $0x2000
c0007830:	6a 00                	push   $0x0
c0007832:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007838:	50                   	push   %eax
c0007839:	e8 14 3b 00 00       	call   c000b352 <Memset>
c000783e:	83 c4 10             	add    $0x10,%esp
c0007841:	83 ec 04             	sub    $0x4,%esp
c0007844:	68 00 02 00 00       	push   $0x200
c0007849:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000784f:	50                   	push   %eax
c0007850:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007853:	e8 e9 e4 ff ff       	call   c0005d41 <read>
c0007858:	83 c4 10             	add    $0x10,%esp
c000785b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000785e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007862:	0f 84 1f 01 00 00    	je     c0007987 <untar+0x1f5>
c0007868:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000786b:	01 45 f4             	add    %eax,-0xc(%ebp)
c000786e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007875:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000787b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000787e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007881:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007884:	83 ec 08             	sub    $0x8,%esp
c0007887:	6a 07                	push   $0x7
c0007889:	ff 75 cc             	pushl  -0x34(%ebp)
c000788c:	e8 2b e4 ff ff       	call   c0005cbc <open>
c0007891:	83 c4 10             	add    $0x10,%esp
c0007894:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007897:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000789e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00078a1:	83 c0 7c             	add    $0x7c,%eax
c00078a4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00078a7:	83 ec 0c             	sub    $0xc,%esp
c00078aa:	ff 75 cc             	pushl  -0x34(%ebp)
c00078ad:	e8 d9 3a 00 00       	call   c000b38b <Strlen>
c00078b2:	83 c4 10             	add    $0x10,%esp
c00078b5:	85 c0                	test   %eax,%eax
c00078b7:	75 16                	jne    c00078cf <untar+0x13d>
c00078b9:	83 ec 0c             	sub    $0xc,%esp
c00078bc:	ff 75 c4             	pushl  -0x3c(%ebp)
c00078bf:	e8 c7 3a 00 00       	call   c000b38b <Strlen>
c00078c4:	83 c4 10             	add    $0x10,%esp
c00078c7:	85 c0                	test   %eax,%eax
c00078c9:	0f 84 bb 00 00 00    	je     c000798a <untar+0x1f8>
c00078cf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00078d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078d5:	eb 1f                	jmp    c00078f6 <untar+0x164>
c00078d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00078da:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00078e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078e4:	0f b6 00             	movzbl (%eax),%eax
c00078e7:	0f be c0             	movsbl %al,%eax
c00078ea:	83 e8 30             	sub    $0x30,%eax
c00078ed:	01 d0                	add    %edx,%eax
c00078ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00078f2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00078f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078f9:	0f b6 00             	movzbl (%eax),%eax
c00078fc:	84 c0                	test   %al,%al
c00078fe:	75 d7                	jne    c00078d7 <untar+0x145>
c0007900:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007903:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007906:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c000790d:	eb 5f                	jmp    c000796e <untar+0x1dc>
c000790f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007912:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0007915:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0007919:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000791c:	83 ec 04             	sub    $0x4,%esp
c000791f:	68 00 02 00 00       	push   $0x200
c0007924:	6a 00                	push   $0x0
c0007926:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000792c:	50                   	push   %eax
c000792d:	e8 20 3a 00 00       	call   c000b352 <Memset>
c0007932:	83 c4 10             	add    $0x10,%esp
c0007935:	83 ec 04             	sub    $0x4,%esp
c0007938:	ff 75 bc             	pushl  -0x44(%ebp)
c000793b:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007941:	50                   	push   %eax
c0007942:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007945:	e8 f7 e3 ff ff       	call   c0005d41 <read>
c000794a:	83 c4 10             	add    $0x10,%esp
c000794d:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007950:	83 ec 04             	sub    $0x4,%esp
c0007953:	ff 75 bc             	pushl  -0x44(%ebp)
c0007956:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000795c:	50                   	push   %eax
c000795d:	ff 75 c8             	pushl  -0x38(%ebp)
c0007960:	e8 50 e4 ff ff       	call   c0005db5 <write>
c0007965:	83 c4 10             	add    $0x10,%esp
c0007968:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000796b:	29 45 e8             	sub    %eax,-0x18(%ebp)
c000796e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007972:	75 9b                	jne    c000790f <untar+0x17d>
c0007974:	83 ec 0c             	sub    $0xc,%esp
c0007977:	ff 75 c8             	pushl  -0x38(%ebp)
c000797a:	e8 bb e4 ff ff       	call   c0005e3a <close>
c000797f:	83 c4 10             	add    $0x10,%esp
c0007982:	e9 43 fe ff ff       	jmp    c00077ca <untar+0x38>
c0007987:	90                   	nop
c0007988:	eb 01                	jmp    c000798b <untar+0x1f9>
c000798a:	90                   	nop
c000798b:	83 ec 0c             	sub    $0xc,%esp
c000798e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007991:	e8 a4 e4 ff ff       	call   c0005e3a <close>
c0007996:	83 c4 10             	add    $0x10,%esp
c0007999:	90                   	nop
c000799a:	c9                   	leave  
c000799b:	c3                   	ret    

c000799c <atoi>:
c000799c:	55                   	push   %ebp
c000799d:	89 e5                	mov    %esp,%ebp
c000799f:	83 ec 10             	sub    $0x10,%esp
c00079a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00079a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00079a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00079ab:	8d 50 01             	lea    0x1(%eax),%edx
c00079ae:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00079b1:	c6 00 30             	movb   $0x30,(%eax)
c00079b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00079b7:	8d 50 01             	lea    0x1(%eax),%edx
c00079ba:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00079bd:	c6 00 78             	movb   $0x78,(%eax)
c00079c0:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c00079c4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00079c8:	75 0e                	jne    c00079d8 <atoi+0x3c>
c00079ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00079cd:	8d 50 01             	lea    0x1(%eax),%edx
c00079d0:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00079d3:	c6 00 30             	movb   $0x30,(%eax)
c00079d6:	eb 61                	jmp    c0007a39 <atoi+0x9d>
c00079d8:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c00079df:	eb 52                	jmp    c0007a33 <atoi+0x97>
c00079e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00079e4:	8b 55 0c             	mov    0xc(%ebp),%edx
c00079e7:	89 c1                	mov    %eax,%ecx
c00079e9:	d3 fa                	sar    %cl,%edx
c00079eb:	89 d0                	mov    %edx,%eax
c00079ed:	83 e0 0f             	and    $0xf,%eax
c00079f0:	88 45 fb             	mov    %al,-0x5(%ebp)
c00079f3:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c00079f7:	75 06                	jne    c00079ff <atoi+0x63>
c00079f9:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c00079fd:	74 2f                	je     c0007a2e <atoi+0x92>
c00079ff:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007a03:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007a07:	83 c0 30             	add    $0x30,%eax
c0007a0a:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a0d:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007a11:	7e 0a                	jle    c0007a1d <atoi+0x81>
c0007a13:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007a17:	83 c0 07             	add    $0x7,%eax
c0007a1a:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a20:	8d 50 01             	lea    0x1(%eax),%edx
c0007a23:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007a26:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007a2a:	88 10                	mov    %dl,(%eax)
c0007a2c:	eb 01                	jmp    c0007a2f <atoi+0x93>
c0007a2e:	90                   	nop
c0007a2f:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007a33:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007a37:	79 a8                	jns    c00079e1 <atoi+0x45>
c0007a39:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a3c:	c6 00 00             	movb   $0x0,(%eax)
c0007a3f:	90                   	nop
c0007a40:	c9                   	leave  
c0007a41:	c3                   	ret    

c0007a42 <disp_int>:
c0007a42:	55                   	push   %ebp
c0007a43:	89 e5                	mov    %esp,%ebp
c0007a45:	83 ec 18             	sub    $0x18,%esp
c0007a48:	ff 75 08             	pushl  0x8(%ebp)
c0007a4b:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007a4e:	50                   	push   %eax
c0007a4f:	e8 48 ff ff ff       	call   c000799c <atoi>
c0007a54:	83 c4 08             	add    $0x8,%esp
c0007a57:	83 ec 08             	sub    $0x8,%esp
c0007a5a:	6a 0b                	push   $0xb
c0007a5c:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007a5f:	50                   	push   %eax
c0007a60:	e8 62 9b ff ff       	call   c00015c7 <disp_str_colour>
c0007a65:	83 c4 10             	add    $0x10,%esp
c0007a68:	90                   	nop
c0007a69:	c9                   	leave  
c0007a6a:	c3                   	ret    

c0007a6b <do_page_fault>:
c0007a6b:	55                   	push   %ebp
c0007a6c:	89 e5                	mov    %esp,%ebp
c0007a6e:	83 ec 28             	sub    $0x28,%esp
c0007a71:	0f 20 d0             	mov    %cr2,%eax
c0007a74:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007a77:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0007a7e:	00 00 00 
c0007a81:	83 ec 0c             	sub    $0xc,%esp
c0007a84:	68 20 ac 00 c0       	push   $0xc000ac20
c0007a89:	e8 fe 9a ff ff       	call   c000158c <disp_str>
c0007a8e:	83 c4 10             	add    $0x10,%esp
c0007a91:	83 ec 0c             	sub    $0xc,%esp
c0007a94:	68 2f ac 00 c0       	push   $0xc000ac2f
c0007a99:	e8 ee 9a ff ff       	call   c000158c <disp_str>
c0007a9e:	83 c4 10             	add    $0x10,%esp
c0007aa1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007aa4:	83 ec 0c             	sub    $0xc,%esp
c0007aa7:	50                   	push   %eax
c0007aa8:	e8 95 ff ff ff       	call   c0007a42 <disp_int>
c0007aad:	83 c4 10             	add    $0x10,%esp
c0007ab0:	83 ec 0c             	sub    $0xc,%esp
c0007ab3:	68 34 ac 00 c0       	push   $0xc000ac34
c0007ab8:	e8 cf 9a ff ff       	call   c000158c <disp_str>
c0007abd:	83 c4 10             	add    $0x10,%esp
c0007ac0:	83 ec 0c             	sub    $0xc,%esp
c0007ac3:	ff 75 f4             	pushl  -0xc(%ebp)
c0007ac6:	e8 f5 f1 ff ff       	call   c0006cc0 <ptr_pde>
c0007acb:	83 c4 10             	add    $0x10,%esp
c0007ace:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007ad1:	83 ec 0c             	sub    $0xc,%esp
c0007ad4:	ff 75 f4             	pushl  -0xc(%ebp)
c0007ad7:	e8 f7 f1 ff ff       	call   c0006cd3 <ptr_pte>
c0007adc:	83 c4 10             	add    $0x10,%esp
c0007adf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007ae2:	83 ec 0c             	sub    $0xc,%esp
c0007ae5:	68 36 ac 00 c0       	push   $0xc000ac36
c0007aea:	e8 9d 9a ff ff       	call   c000158c <disp_str>
c0007aef:	83 c4 10             	add    $0x10,%esp
c0007af2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007af5:	83 ec 0c             	sub    $0xc,%esp
c0007af8:	50                   	push   %eax
c0007af9:	e8 44 ff ff ff       	call   c0007a42 <disp_int>
c0007afe:	83 c4 10             	add    $0x10,%esp
c0007b01:	83 ec 0c             	sub    $0xc,%esp
c0007b04:	68 3b ac 00 c0       	push   $0xc000ac3b
c0007b09:	e8 7e 9a ff ff       	call   c000158c <disp_str>
c0007b0e:	83 c4 10             	add    $0x10,%esp
c0007b11:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b14:	8b 00                	mov    (%eax),%eax
c0007b16:	83 ec 0c             	sub    $0xc,%esp
c0007b19:	50                   	push   %eax
c0007b1a:	e8 23 ff ff ff       	call   c0007a42 <disp_int>
c0007b1f:	83 c4 10             	add    $0x10,%esp
c0007b22:	83 ec 0c             	sub    $0xc,%esp
c0007b25:	68 34 ac 00 c0       	push   $0xc000ac34
c0007b2a:	e8 5d 9a ff ff       	call   c000158c <disp_str>
c0007b2f:	83 c4 10             	add    $0x10,%esp
c0007b32:	83 ec 0c             	sub    $0xc,%esp
c0007b35:	68 44 ac 00 c0       	push   $0xc000ac44
c0007b3a:	e8 4d 9a ff ff       	call   c000158c <disp_str>
c0007b3f:	83 c4 10             	add    $0x10,%esp
c0007b42:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007b45:	83 ec 0c             	sub    $0xc,%esp
c0007b48:	50                   	push   %eax
c0007b49:	e8 f4 fe ff ff       	call   c0007a42 <disp_int>
c0007b4e:	83 c4 10             	add    $0x10,%esp
c0007b51:	83 ec 0c             	sub    $0xc,%esp
c0007b54:	68 49 ac 00 c0       	push   $0xc000ac49
c0007b59:	e8 2e 9a ff ff       	call   c000158c <disp_str>
c0007b5e:	83 c4 10             	add    $0x10,%esp
c0007b61:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007b64:	8b 00                	mov    (%eax),%eax
c0007b66:	83 ec 0c             	sub    $0xc,%esp
c0007b69:	50                   	push   %eax
c0007b6a:	e8 d3 fe ff ff       	call   c0007a42 <disp_int>
c0007b6f:	83 c4 10             	add    $0x10,%esp
c0007b72:	83 ec 0c             	sub    $0xc,%esp
c0007b75:	68 34 ac 00 c0       	push   $0xc000ac34
c0007b7a:	e8 0d 9a ff ff       	call   c000158c <disp_str>
c0007b7f:	83 c4 10             	add    $0x10,%esp
c0007b82:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007b89:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007b8c:	8b 00                	mov    (%eax),%eax
c0007b8e:	83 e0 01             	and    $0x1,%eax
c0007b91:	85 c0                	test   %eax,%eax
c0007b93:	74 09                	je     c0007b9e <do_page_fault+0x133>
c0007b95:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007b9c:	eb 07                	jmp    c0007ba5 <do_page_fault+0x13a>
c0007b9e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007ba5:	90                   	nop
c0007ba6:	c9                   	leave  
c0007ba7:	c3                   	ret    

c0007ba8 <exception_handler>:
c0007ba8:	55                   	push   %ebp
c0007ba9:	89 e5                	mov    %esp,%ebp
c0007bab:	57                   	push   %edi
c0007bac:	56                   	push   %esi
c0007bad:	53                   	push   %ebx
c0007bae:	83 ec 6c             	sub    $0x6c,%esp
c0007bb1:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007bb4:	bb c0 ae 00 c0       	mov    $0xc000aec0,%ebx
c0007bb9:	ba 13 00 00 00       	mov    $0x13,%edx
c0007bbe:	89 c7                	mov    %eax,%edi
c0007bc0:	89 de                	mov    %ebx,%esi
c0007bc2:	89 d1                	mov    %edx,%ecx
c0007bc4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007bc6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007bcd:	eb 04                	jmp    c0007bd3 <exception_handler+0x2b>
c0007bcf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007bd3:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007bda:	7e f3                	jle    c0007bcf <exception_handler+0x27>
c0007bdc:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0007be3:	00 00 00 
c0007be6:	83 ec 0c             	sub    $0xc,%esp
c0007be9:	68 52 ac 00 c0       	push   $0xc000ac52
c0007bee:	e8 99 99 ff ff       	call   c000158c <disp_str>
c0007bf3:	83 c4 10             	add    $0x10,%esp
c0007bf6:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007bfd:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c00:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0007c04:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007c07:	83 ec 0c             	sub    $0xc,%esp
c0007c0a:	ff 75 dc             	pushl  -0x24(%ebp)
c0007c0d:	e8 7a 99 ff ff       	call   c000158c <disp_str>
c0007c12:	83 c4 10             	add    $0x10,%esp
c0007c15:	83 ec 0c             	sub    $0xc,%esp
c0007c18:	68 60 ac 00 c0       	push   $0xc000ac60
c0007c1d:	e8 6a 99 ff ff       	call   c000158c <disp_str>
c0007c22:	83 c4 10             	add    $0x10,%esp
c0007c25:	83 ec 0c             	sub    $0xc,%esp
c0007c28:	68 63 ac 00 c0       	push   $0xc000ac63
c0007c2d:	e8 5a 99 ff ff       	call   c000158c <disp_str>
c0007c32:	83 c4 10             	add    $0x10,%esp
c0007c35:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c38:	83 ec 0c             	sub    $0xc,%esp
c0007c3b:	50                   	push   %eax
c0007c3c:	e8 01 fe ff ff       	call   c0007a42 <disp_int>
c0007c41:	83 c4 10             	add    $0x10,%esp
c0007c44:	83 ec 0c             	sub    $0xc,%esp
c0007c47:	68 60 ac 00 c0       	push   $0xc000ac60
c0007c4c:	e8 3b 99 ff ff       	call   c000158c <disp_str>
c0007c51:	83 c4 10             	add    $0x10,%esp
c0007c54:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007c58:	74 2f                	je     c0007c89 <exception_handler+0xe1>
c0007c5a:	83 ec 0c             	sub    $0xc,%esp
c0007c5d:	68 6b ac 00 c0       	push   $0xc000ac6b
c0007c62:	e8 25 99 ff ff       	call   c000158c <disp_str>
c0007c67:	83 c4 10             	add    $0x10,%esp
c0007c6a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007c6d:	83 ec 0c             	sub    $0xc,%esp
c0007c70:	50                   	push   %eax
c0007c71:	e8 cc fd ff ff       	call   c0007a42 <disp_int>
c0007c76:	83 c4 10             	add    $0x10,%esp
c0007c79:	83 ec 0c             	sub    $0xc,%esp
c0007c7c:	68 60 ac 00 c0       	push   $0xc000ac60
c0007c81:	e8 06 99 ff ff       	call   c000158c <disp_str>
c0007c86:	83 c4 10             	add    $0x10,%esp
c0007c89:	83 ec 0c             	sub    $0xc,%esp
c0007c8c:	68 75 ac 00 c0       	push   $0xc000ac75
c0007c91:	e8 f6 98 ff ff       	call   c000158c <disp_str>
c0007c96:	83 c4 10             	add    $0x10,%esp
c0007c99:	83 ec 0c             	sub    $0xc,%esp
c0007c9c:	ff 75 14             	pushl  0x14(%ebp)
c0007c9f:	e8 9e fd ff ff       	call   c0007a42 <disp_int>
c0007ca4:	83 c4 10             	add    $0x10,%esp
c0007ca7:	83 ec 0c             	sub    $0xc,%esp
c0007caa:	68 60 ac 00 c0       	push   $0xc000ac60
c0007caf:	e8 d8 98 ff ff       	call   c000158c <disp_str>
c0007cb4:	83 c4 10             	add    $0x10,%esp
c0007cb7:	83 ec 0c             	sub    $0xc,%esp
c0007cba:	68 79 ac 00 c0       	push   $0xc000ac79
c0007cbf:	e8 c8 98 ff ff       	call   c000158c <disp_str>
c0007cc4:	83 c4 10             	add    $0x10,%esp
c0007cc7:	8b 45 10             	mov    0x10(%ebp),%eax
c0007cca:	83 ec 0c             	sub    $0xc,%esp
c0007ccd:	50                   	push   %eax
c0007cce:	e8 6f fd ff ff       	call   c0007a42 <disp_int>
c0007cd3:	83 c4 10             	add    $0x10,%esp
c0007cd6:	83 ec 0c             	sub    $0xc,%esp
c0007cd9:	68 60 ac 00 c0       	push   $0xc000ac60
c0007cde:	e8 a9 98 ff ff       	call   c000158c <disp_str>
c0007ce3:	83 c4 10             	add    $0x10,%esp
c0007ce6:	83 ec 0c             	sub    $0xc,%esp
c0007ce9:	68 7e ac 00 c0       	push   $0xc000ac7e
c0007cee:	e8 99 98 ff ff       	call   c000158c <disp_str>
c0007cf3:	83 c4 10             	add    $0x10,%esp
c0007cf6:	83 ec 0c             	sub    $0xc,%esp
c0007cf9:	ff 75 18             	pushl  0x18(%ebp)
c0007cfc:	e8 41 fd ff ff       	call   c0007a42 <disp_int>
c0007d01:	83 c4 10             	add    $0x10,%esp
c0007d04:	83 ec 0c             	sub    $0xc,%esp
c0007d07:	68 60 ac 00 c0       	push   $0xc000ac60
c0007d0c:	e8 7b 98 ff ff       	call   c000158c <disp_str>
c0007d11:	83 c4 10             	add    $0x10,%esp
c0007d14:	83 ec 0c             	sub    $0xc,%esp
c0007d17:	68 88 ac 00 c0       	push   $0xc000ac88
c0007d1c:	e8 6b 98 ff ff       	call   c000158c <disp_str>
c0007d21:	83 c4 10             	add    $0x10,%esp
c0007d24:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0007d28:	75 46                	jne    c0007d70 <exception_handler+0x1c8>
c0007d2a:	0f 20 d0             	mov    %cr2,%eax
c0007d2d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007d30:	83 ec 0c             	sub    $0xc,%esp
c0007d33:	68 a7 ac 00 c0       	push   $0xc000aca7
c0007d38:	e8 4f 98 ff ff       	call   c000158c <disp_str>
c0007d3d:	83 c4 10             	add    $0x10,%esp
c0007d40:	83 ec 0c             	sub    $0xc,%esp
c0007d43:	68 2f ac 00 c0       	push   $0xc000ac2f
c0007d48:	e8 3f 98 ff ff       	call   c000158c <disp_str>
c0007d4d:	83 c4 10             	add    $0x10,%esp
c0007d50:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007d53:	83 ec 0c             	sub    $0xc,%esp
c0007d56:	50                   	push   %eax
c0007d57:	e8 e6 fc ff ff       	call   c0007a42 <disp_int>
c0007d5c:	83 c4 10             	add    $0x10,%esp
c0007d5f:	83 ec 0c             	sub    $0xc,%esp
c0007d62:	68 34 ac 00 c0       	push   $0xc000ac34
c0007d67:	e8 20 98 ff ff       	call   c000158c <disp_str>
c0007d6c:	83 c4 10             	add    $0x10,%esp
c0007d6f:	90                   	nop
c0007d70:	90                   	nop
c0007d71:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007d74:	5b                   	pop    %ebx
c0007d75:	5e                   	pop    %esi
c0007d76:	5f                   	pop    %edi
c0007d77:	5d                   	pop    %ebp
c0007d78:	c3                   	ret    

c0007d79 <exception_handler2>:
c0007d79:	55                   	push   %ebp
c0007d7a:	89 e5                	mov    %esp,%ebp
c0007d7c:	57                   	push   %edi
c0007d7d:	56                   	push   %esi
c0007d7e:	53                   	push   %ebx
c0007d7f:	83 ec 6c             	sub    $0x6c,%esp
c0007d82:	8d 45 90             	lea    -0x70(%ebp),%eax
c0007d85:	bb c0 ae 00 c0       	mov    $0xc000aec0,%ebx
c0007d8a:	ba 13 00 00 00       	mov    $0x13,%edx
c0007d8f:	89 c7                	mov    %eax,%edi
c0007d91:	89 de                	mov    %ebx,%esi
c0007d93:	89 d1                	mov    %edx,%ecx
c0007d95:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007d97:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007d9e:	2e 00 00 
c0007da1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007da8:	eb 14                	jmp    c0007dbe <exception_handler2+0x45>
c0007daa:	83 ec 0c             	sub    $0xc,%esp
c0007dad:	68 0c af 00 c0       	push   $0xc000af0c
c0007db2:	e8 d5 97 ff ff       	call   c000158c <disp_str>
c0007db7:	83 c4 10             	add    $0x10,%esp
c0007dba:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007dbe:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007dc5:	7e e3                	jle    c0007daa <exception_handler2+0x31>
c0007dc7:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007dce:	2e 00 00 
c0007dd1:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007dd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0007ddb:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0007ddf:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007de2:	83 ec 08             	sub    $0x8,%esp
c0007de5:	ff 75 e0             	pushl  -0x20(%ebp)
c0007de8:	ff 75 dc             	pushl  -0x24(%ebp)
c0007deb:	e8 d7 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007df0:	83 c4 10             	add    $0x10,%esp
c0007df3:	83 ec 0c             	sub    $0xc,%esp
c0007df6:	68 60 ac 00 c0       	push   $0xc000ac60
c0007dfb:	e8 8c 97 ff ff       	call   c000158c <disp_str>
c0007e00:	83 c4 10             	add    $0x10,%esp
c0007e03:	83 ec 08             	sub    $0x8,%esp
c0007e06:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e09:	68 63 ac 00 c0       	push   $0xc000ac63
c0007e0e:	e8 b4 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e13:	83 c4 10             	add    $0x10,%esp
c0007e16:	83 ec 0c             	sub    $0xc,%esp
c0007e19:	ff 75 08             	pushl  0x8(%ebp)
c0007e1c:	e8 21 fc ff ff       	call   c0007a42 <disp_int>
c0007e21:	83 c4 10             	add    $0x10,%esp
c0007e24:	83 ec 0c             	sub    $0xc,%esp
c0007e27:	68 60 ac 00 c0       	push   $0xc000ac60
c0007e2c:	e8 5b 97 ff ff       	call   c000158c <disp_str>
c0007e31:	83 c4 10             	add    $0x10,%esp
c0007e34:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007e38:	74 44                	je     c0007e7e <exception_handler2+0x105>
c0007e3a:	83 ec 08             	sub    $0x8,%esp
c0007e3d:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e40:	68 6b ac 00 c0       	push   $0xc000ac6b
c0007e45:	e8 7d 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e4a:	83 c4 10             	add    $0x10,%esp
c0007e4d:	83 ec 08             	sub    $0x8,%esp
c0007e50:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e53:	68 6b ac 00 c0       	push   $0xc000ac6b
c0007e58:	e8 6a 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e5d:	83 c4 10             	add    $0x10,%esp
c0007e60:	83 ec 0c             	sub    $0xc,%esp
c0007e63:	ff 75 0c             	pushl  0xc(%ebp)
c0007e66:	e8 d7 fb ff ff       	call   c0007a42 <disp_int>
c0007e6b:	83 c4 10             	add    $0x10,%esp
c0007e6e:	83 ec 0c             	sub    $0xc,%esp
c0007e71:	68 60 ac 00 c0       	push   $0xc000ac60
c0007e76:	e8 11 97 ff ff       	call   c000158c <disp_str>
c0007e7b:	83 c4 10             	add    $0x10,%esp
c0007e7e:	83 ec 08             	sub    $0x8,%esp
c0007e81:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e84:	68 75 ac 00 c0       	push   $0xc000ac75
c0007e89:	e8 39 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e8e:	83 c4 10             	add    $0x10,%esp
c0007e91:	83 ec 0c             	sub    $0xc,%esp
c0007e94:	ff 75 14             	pushl  0x14(%ebp)
c0007e97:	e8 a6 fb ff ff       	call   c0007a42 <disp_int>
c0007e9c:	83 c4 10             	add    $0x10,%esp
c0007e9f:	83 ec 0c             	sub    $0xc,%esp
c0007ea2:	68 60 ac 00 c0       	push   $0xc000ac60
c0007ea7:	e8 e0 96 ff ff       	call   c000158c <disp_str>
c0007eac:	83 c4 10             	add    $0x10,%esp
c0007eaf:	83 ec 08             	sub    $0x8,%esp
c0007eb2:	ff 75 e0             	pushl  -0x20(%ebp)
c0007eb5:	68 79 ac 00 c0       	push   $0xc000ac79
c0007eba:	e8 08 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007ebf:	83 c4 10             	add    $0x10,%esp
c0007ec2:	83 ec 0c             	sub    $0xc,%esp
c0007ec5:	ff 75 10             	pushl  0x10(%ebp)
c0007ec8:	e8 75 fb ff ff       	call   c0007a42 <disp_int>
c0007ecd:	83 c4 10             	add    $0x10,%esp
c0007ed0:	83 ec 0c             	sub    $0xc,%esp
c0007ed3:	68 60 ac 00 c0       	push   $0xc000ac60
c0007ed8:	e8 af 96 ff ff       	call   c000158c <disp_str>
c0007edd:	83 c4 10             	add    $0x10,%esp
c0007ee0:	83 ec 08             	sub    $0x8,%esp
c0007ee3:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ee6:	68 7e ac 00 c0       	push   $0xc000ac7e
c0007eeb:	e8 d7 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007ef0:	83 c4 10             	add    $0x10,%esp
c0007ef3:	83 ec 0c             	sub    $0xc,%esp
c0007ef6:	ff 75 18             	pushl  0x18(%ebp)
c0007ef9:	e8 44 fb ff ff       	call   c0007a42 <disp_int>
c0007efe:	83 c4 10             	add    $0x10,%esp
c0007f01:	83 ec 0c             	sub    $0xc,%esp
c0007f04:	68 60 ac 00 c0       	push   $0xc000ac60
c0007f09:	e8 7e 96 ff ff       	call   c000158c <disp_str>
c0007f0e:	83 c4 10             	add    $0x10,%esp
c0007f11:	90                   	nop
c0007f12:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007f15:	5b                   	pop    %ebx
c0007f16:	5e                   	pop    %esi
c0007f17:	5f                   	pop    %edi
c0007f18:	5d                   	pop    %ebp
c0007f19:	c3                   	ret    

c0007f1a <init_internal_interrupt>:
c0007f1a:	55                   	push   %ebp
c0007f1b:	89 e5                	mov    %esp,%ebp
c0007f1d:	83 ec 08             	sub    $0x8,%esp
c0007f20:	6a 0e                	push   $0xe
c0007f22:	6a 08                	push   $0x8
c0007f24:	68 03 16 00 c0       	push   $0xc0001603
c0007f29:	6a 00                	push   $0x0
c0007f2b:	e8 e7 cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007f30:	83 c4 10             	add    $0x10,%esp
c0007f33:	6a 0e                	push   $0xe
c0007f35:	6a 08                	push   $0x8
c0007f37:	68 09 16 00 c0       	push   $0xc0001609
c0007f3c:	6a 01                	push   $0x1
c0007f3e:	e8 d4 cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007f43:	83 c4 10             	add    $0x10,%esp
c0007f46:	6a 0e                	push   $0xe
c0007f48:	6a 08                	push   $0x8
c0007f4a:	68 0f 16 00 c0       	push   $0xc000160f
c0007f4f:	6a 02                	push   $0x2
c0007f51:	e8 c1 cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007f56:	83 c4 10             	add    $0x10,%esp
c0007f59:	6a 0e                	push   $0xe
c0007f5b:	6a 08                	push   $0x8
c0007f5d:	68 15 16 00 c0       	push   $0xc0001615
c0007f62:	6a 03                	push   $0x3
c0007f64:	e8 ae cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007f69:	83 c4 10             	add    $0x10,%esp
c0007f6c:	6a 0e                	push   $0xe
c0007f6e:	6a 08                	push   $0x8
c0007f70:	68 1b 16 00 c0       	push   $0xc000161b
c0007f75:	6a 04                	push   $0x4
c0007f77:	e8 9b cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007f7c:	83 c4 10             	add    $0x10,%esp
c0007f7f:	6a 0e                	push   $0xe
c0007f81:	6a 08                	push   $0x8
c0007f83:	68 21 16 00 c0       	push   $0xc0001621
c0007f88:	6a 05                	push   $0x5
c0007f8a:	e8 88 cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007f8f:	83 c4 10             	add    $0x10,%esp
c0007f92:	6a 0e                	push   $0xe
c0007f94:	6a 08                	push   $0x8
c0007f96:	68 27 16 00 c0       	push   $0xc0001627
c0007f9b:	6a 06                	push   $0x6
c0007f9d:	e8 75 cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007fa2:	83 c4 10             	add    $0x10,%esp
c0007fa5:	6a 0e                	push   $0xe
c0007fa7:	6a 08                	push   $0x8
c0007fa9:	68 2d 16 00 c0       	push   $0xc000162d
c0007fae:	6a 07                	push   $0x7
c0007fb0:	e8 62 cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007fb5:	83 c4 10             	add    $0x10,%esp
c0007fb8:	6a 0e                	push   $0xe
c0007fba:	6a 08                	push   $0x8
c0007fbc:	68 33 16 00 c0       	push   $0xc0001633
c0007fc1:	6a 08                	push   $0x8
c0007fc3:	e8 4f cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007fc8:	83 c4 10             	add    $0x10,%esp
c0007fcb:	6a 0e                	push   $0xe
c0007fcd:	6a 08                	push   $0x8
c0007fcf:	68 37 16 00 c0       	push   $0xc0001637
c0007fd4:	6a 09                	push   $0x9
c0007fd6:	e8 3c cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007fdb:	83 c4 10             	add    $0x10,%esp
c0007fde:	6a 0e                	push   $0xe
c0007fe0:	6a 08                	push   $0x8
c0007fe2:	68 3d 16 00 c0       	push   $0xc000163d
c0007fe7:	6a 0a                	push   $0xa
c0007fe9:	e8 29 cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0007fee:	83 c4 10             	add    $0x10,%esp
c0007ff1:	6a 0e                	push   $0xe
c0007ff3:	6a 08                	push   $0x8
c0007ff5:	68 41 16 00 c0       	push   $0xc0001641
c0007ffa:	6a 0b                	push   $0xb
c0007ffc:	e8 16 cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0008001:	83 c4 10             	add    $0x10,%esp
c0008004:	6a 0e                	push   $0xe
c0008006:	6a 08                	push   $0x8
c0008008:	68 45 16 00 c0       	push   $0xc0001645
c000800d:	6a 0c                	push   $0xc
c000800f:	e8 03 cd ff ff       	call   c0004d17 <InitInterruptDesc>
c0008014:	83 c4 10             	add    $0x10,%esp
c0008017:	6a 0e                	push   $0xe
c0008019:	6a 08                	push   $0x8
c000801b:	68 49 16 00 c0       	push   $0xc0001649
c0008020:	6a 0d                	push   $0xd
c0008022:	e8 f0 cc ff ff       	call   c0004d17 <InitInterruptDesc>
c0008027:	83 c4 10             	add    $0x10,%esp
c000802a:	6a 0e                	push   $0xe
c000802c:	6a 08                	push   $0x8
c000802e:	68 4d 16 00 c0       	push   $0xc000164d
c0008033:	6a 0e                	push   $0xe
c0008035:	e8 dd cc ff ff       	call   c0004d17 <InitInterruptDesc>
c000803a:	83 c4 10             	add    $0x10,%esp
c000803d:	6a 0e                	push   $0xe
c000803f:	6a 08                	push   $0x8
c0008041:	68 51 16 00 c0       	push   $0xc0001651
c0008046:	6a 10                	push   $0x10
c0008048:	e8 ca cc ff ff       	call   c0004d17 <InitInterruptDesc>
c000804d:	83 c4 10             	add    $0x10,%esp
c0008050:	6a 0e                	push   $0xe
c0008052:	6a 08                	push   $0x8
c0008054:	68 57 16 00 c0       	push   $0xc0001657
c0008059:	6a 11                	push   $0x11
c000805b:	e8 b7 cc ff ff       	call   c0004d17 <InitInterruptDesc>
c0008060:	83 c4 10             	add    $0x10,%esp
c0008063:	6a 0e                	push   $0xe
c0008065:	6a 08                	push   $0x8
c0008067:	68 5b 16 00 c0       	push   $0xc000165b
c000806c:	6a 12                	push   $0x12
c000806e:	e8 a4 cc ff ff       	call   c0004d17 <InitInterruptDesc>
c0008073:	83 c4 10             	add    $0x10,%esp
c0008076:	6a 0e                	push   $0xe
c0008078:	6a 0e                	push   $0xe
c000807a:	68 1c 17 00 c0       	push   $0xc000171c
c000807f:	68 90 00 00 00       	push   $0x90
c0008084:	e8 8e cc ff ff       	call   c0004d17 <InitInterruptDesc>
c0008089:	83 c4 10             	add    $0x10,%esp
c000808c:	90                   	nop
c000808d:	c9                   	leave  
c000808e:	c3                   	ret    

c000808f <test>:
c000808f:	55                   	push   %ebp
c0008090:	89 e5                	mov    %esp,%ebp
c0008092:	83 ec 08             	sub    $0x8,%esp
c0008095:	83 ec 0c             	sub    $0xc,%esp
c0008098:	68 0e af 00 c0       	push   $0xc000af0e
c000809d:	e8 ea 94 ff ff       	call   c000158c <disp_str>
c00080a2:	83 c4 10             	add    $0x10,%esp
c00080a5:	83 ec 0c             	sub    $0xc,%esp
c00080a8:	6a 06                	push   $0x6
c00080aa:	e8 93 f9 ff ff       	call   c0007a42 <disp_int>
c00080af:	83 c4 10             	add    $0x10,%esp
c00080b2:	83 ec 0c             	sub    $0xc,%esp
c00080b5:	68 34 ac 00 c0       	push   $0xc000ac34
c00080ba:	e8 cd 94 ff ff       	call   c000158c <disp_str>
c00080bf:	83 c4 10             	add    $0x10,%esp
c00080c2:	90                   	nop
c00080c3:	c9                   	leave  
c00080c4:	c3                   	ret    

c00080c5 <disp_str_colour3>:
c00080c5:	55                   	push   %ebp
c00080c6:	89 e5                	mov    %esp,%ebp
c00080c8:	90                   	nop
c00080c9:	5d                   	pop    %ebp
c00080ca:	c3                   	ret    

c00080cb <spurious_irq>:
c00080cb:	55                   	push   %ebp
c00080cc:	89 e5                	mov    %esp,%ebp
c00080ce:	83 ec 08             	sub    $0x8,%esp
c00080d1:	83 ec 08             	sub    $0x8,%esp
c00080d4:	6a 0b                	push   $0xb
c00080d6:	68 10 af 00 c0       	push   $0xc000af10
c00080db:	e8 e7 94 ff ff       	call   c00015c7 <disp_str_colour>
c00080e0:	83 c4 10             	add    $0x10,%esp
c00080e3:	83 ec 0c             	sub    $0xc,%esp
c00080e6:	ff 75 08             	pushl  0x8(%ebp)
c00080e9:	e8 54 f9 ff ff       	call   c0007a42 <disp_int>
c00080ee:	83 c4 10             	add    $0x10,%esp
c00080f1:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c00080f6:	83 c0 01             	add    $0x1,%eax
c00080f9:	a3 c0 1e 01 c0       	mov    %eax,0xc0011ec0
c00080fe:	83 ec 0c             	sub    $0xc,%esp
c0008101:	68 37 af 00 c0       	push   $0xc000af37
c0008106:	e8 81 94 ff ff       	call   c000158c <disp_str>
c000810b:	83 c4 10             	add    $0x10,%esp
c000810e:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008113:	83 ec 0c             	sub    $0xc,%esp
c0008116:	50                   	push   %eax
c0008117:	e8 26 f9 ff ff       	call   c0007a42 <disp_int>
c000811c:	83 c4 10             	add    $0x10,%esp
c000811f:	83 ec 0c             	sub    $0xc,%esp
c0008122:	68 39 af 00 c0       	push   $0xc000af39
c0008127:	e8 60 94 ff ff       	call   c000158c <disp_str>
c000812c:	83 c4 10             	add    $0x10,%esp
c000812f:	83 ec 08             	sub    $0x8,%esp
c0008132:	6a 0c                	push   $0xc
c0008134:	68 3c af 00 c0       	push   $0xc000af3c
c0008139:	e8 89 94 ff ff       	call   c00015c7 <disp_str_colour>
c000813e:	83 c4 10             	add    $0x10,%esp
c0008141:	90                   	nop
c0008142:	c9                   	leave  
c0008143:	c3                   	ret    

c0008144 <init_keyboard>:
c0008144:	55                   	push   %ebp
c0008145:	89 e5                	mov    %esp,%ebp
c0008147:	83 ec 18             	sub    $0x18,%esp
c000814a:	83 ec 04             	sub    $0x4,%esp
c000814d:	68 00 02 00 00       	push   $0x200
c0008152:	6a 00                	push   $0x0
c0008154:	68 8c fb 00 c0       	push   $0xc000fb8c
c0008159:	e8 f4 31 00 00       	call   c000b352 <Memset>
c000815e:	83 c4 10             	add    $0x10,%esp
c0008161:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c0008168:	fb 00 c0 
c000816b:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0008170:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0008175:	c7 05 88 fb 00 c0 00 	movl   $0x0,0xc000fb88
c000817c:	00 00 00 
c000817f:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0008186:	00 00 00 
c0008189:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008190:	eb 04                	jmp    c0008196 <init_keyboard+0x52>
c0008192:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008196:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c000819d:	7e f3                	jle    c0008192 <init_keyboard+0x4e>
c000819f:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c00081a6:	00 00 00 
c00081a9:	e8 68 d9 ff ff       	call   c0005b16 <init_keyboard_handler>
c00081ae:	90                   	nop
c00081af:	c9                   	leave  
c00081b0:	c3                   	ret    

c00081b1 <init2>:
c00081b1:	55                   	push   %ebp
c00081b2:	89 e5                	mov    %esp,%ebp
c00081b4:	83 ec 08             	sub    $0x8,%esp
c00081b7:	83 ec 0c             	sub    $0xc,%esp
c00081ba:	68 61 af 00 c0       	push   $0xc000af61
c00081bf:	e8 c8 93 ff ff       	call   c000158c <disp_str>
c00081c4:	83 c4 10             	add    $0x10,%esp
c00081c7:	e8 78 ff ff ff       	call   c0008144 <init_keyboard>
c00081cc:	83 ec 0c             	sub    $0xc,%esp
c00081cf:	68 00 00 00 02       	push   $0x2000000
c00081d4:	e8 87 f4 ff ff       	call   c0007660 <init_memory>
c00081d9:	83 c4 10             	add    $0x10,%esp
c00081dc:	90                   	nop
c00081dd:	c9                   	leave  
c00081de:	c3                   	ret    

c00081df <u_thread_a>:
c00081df:	55                   	push   %ebp
c00081e0:	89 e5                	mov    %esp,%ebp
c00081e2:	83 ec 08             	sub    $0x8,%esp
c00081e5:	83 ec 0c             	sub    $0xc,%esp
c00081e8:	68 67 af 00 c0       	push   $0xc000af67
c00081ed:	e8 9a 93 ff ff       	call   c000158c <disp_str>
c00081f2:	83 c4 10             	add    $0x10,%esp
c00081f5:	eb fe                	jmp    c00081f5 <u_thread_a+0x16>

c00081f7 <kernel_main2>:
c00081f7:	55                   	push   %ebp
c00081f8:	89 e5                	mov    %esp,%ebp
c00081fa:	57                   	push   %edi
c00081fb:	56                   	push   %esi
c00081fc:	53                   	push   %ebx
c00081fd:	83 ec 3c             	sub    $0x3c,%esp
c0008200:	83 ec 0c             	sub    $0xc,%esp
c0008203:	68 75 af 00 c0       	push   $0xc000af75
c0008208:	e8 7f 93 ff ff       	call   c000158c <disp_str>
c000820d:	83 c4 10             	add    $0x10,%esp
c0008210:	e8 1f 97 ff ff       	call   c0001934 <init>
c0008215:	c7 05 c0 1e 01 c0 00 	movl   $0x0,0xc0011ec0
c000821c:	00 00 00 
c000821f:	c7 05 9c 16 01 c0 00 	movl   $0x0,0xc001169c
c0008226:	00 00 00 
c0008229:	c7 05 44 f7 00 c0 00 	movl   $0x0,0xc000f744
c0008230:	00 00 00 
c0008233:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c000823a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008241:	e9 01 02 00 00       	jmp    c0008447 <kernel_main2+0x250>
c0008246:	83 ec 08             	sub    $0x8,%esp
c0008249:	6a 00                	push   $0x0
c000824b:	6a 01                	push   $0x1
c000824d:	e8 d5 eb ff ff       	call   c0006e27 <alloc_memory>
c0008252:	83 c4 10             	add    $0x10,%esp
c0008255:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008258:	83 ec 04             	sub    $0x4,%esp
c000825b:	68 ac 02 00 00       	push   $0x2ac
c0008260:	6a 00                	push   $0x0
c0008262:	ff 75 d8             	pushl  -0x28(%ebp)
c0008265:	e8 e8 30 00 00       	call   c000b352 <Memset>
c000826a:	83 c4 10             	add    $0x10,%esp
c000826d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008270:	05 00 10 00 00       	add    $0x1000,%eax
c0008275:	89 c2                	mov    %eax,%edx
c0008277:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000827a:	89 10                	mov    %edx,(%eax)
c000827c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000827f:	66 c7 80 0c 01 00 00 	movw   $0x0,0x10c(%eax)
c0008286:	00 00 
c0008288:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000828b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000828e:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c0008294:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008297:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000829e:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c00082a2:	7e 0f                	jle    c00082b3 <kernel_main2+0xbc>
c00082a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082a7:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c00082ae:	e9 90 01 00 00       	jmp    c0008443 <kernel_main2+0x24c>
c00082b3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082b6:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00082bd:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c00082c1:	7f 73                	jg     c0008336 <kernel_main2+0x13f>
c00082c3:	c7 45 e4 20 e0 00 c0 	movl   $0xc000e020,-0x1c(%ebp)
c00082ca:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c00082d1:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c00082d8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082db:	8b 00                	mov    (%eax),%eax
c00082dd:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c00082e0:	89 c2                	mov    %eax,%edx
c00082e2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082e5:	89 10                	mov    %edx,(%eax)
c00082e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082ea:	8b 00                	mov    (%eax),%eax
c00082ec:	2b 45 d0             	sub    -0x30(%ebp),%eax
c00082ef:	89 c2                	mov    %eax,%edx
c00082f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082f4:	89 10                	mov    %edx,(%eax)
c00082f6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082f9:	8b 00                	mov    (%eax),%eax
c00082fb:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00082fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008301:	8b 50 14             	mov    0x14(%eax),%edx
c0008304:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008307:	89 50 24             	mov    %edx,0x24(%eax)
c000830a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000830d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0008313:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008316:	8b 10                	mov    (%eax),%edx
c0008318:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000831b:	89 50 04             	mov    %edx,0x4(%eax)
c000831e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008321:	8b 50 04             	mov    0x4(%eax),%edx
c0008324:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008327:	89 50 08             	mov    %edx,0x8(%eax)
c000832a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000832d:	8b 50 08             	mov    0x8(%eax),%edx
c0008330:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008333:	89 50 0c             	mov    %edx,0xc(%eax)
c0008336:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008339:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000833c:	81 c2 30 01 00 00    	add    $0x130,%edx
c0008342:	83 ec 08             	sub    $0x8,%esp
c0008345:	50                   	push   %eax
c0008346:	52                   	push   %edx
c0008347:	e8 25 30 00 00       	call   c000b371 <Strcpy>
c000834c:	83 c4 10             	add    $0x10,%esp
c000834f:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008353:	83 c8 04             	or     $0x4,%eax
c0008356:	0f b6 c0             	movzbl %al,%eax
c0008359:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c000835d:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008361:	83 c8 0c             	or     $0xc,%eax
c0008364:	0f b6 c0             	movzbl %al,%eax
c0008367:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c000836b:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c000836f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008372:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008378:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000837c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000837f:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c0008385:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008389:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000838c:	89 90 6c 02 00 00    	mov    %edx,0x26c(%eax)
c0008392:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008396:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008399:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c000839f:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00083a3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083a6:	89 90 a8 02 00 00    	mov    %edx,0x2a8(%eax)
c00083ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083af:	c7 80 68 02 00 00 39 	movl   $0x39,0x268(%eax)
c00083b6:	00 00 00 
c00083b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00083bc:	8b 50 14             	mov    0x14(%eax),%edx
c00083bf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083c2:	89 90 98 02 00 00    	mov    %edx,0x298(%eax)
c00083c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083cb:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00083ce:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00083d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083d7:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00083de:	00 00 00 
c00083e1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083e4:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c00083eb:	00 00 00 
c00083ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083f1:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00083f8:	00 00 00 
c00083fb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083fe:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0008405:	00 00 00 
c0008408:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000840b:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0008412:	00 00 00 
c0008415:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008418:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c000841f:	00 00 00 
c0008422:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008425:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000842b:	8d 90 00 33 08 c0    	lea    -0x3ff7cd00(%eax),%edx
c0008431:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008434:	89 c3                	mov    %eax,%ebx
c0008436:	b8 ab 00 00 00       	mov    $0xab,%eax
c000843b:	89 d7                	mov    %edx,%edi
c000843d:	89 de                	mov    %ebx,%esi
c000843f:	89 c1                	mov    %eax,%ecx
c0008441:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008443:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008447:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000844b:	0f 8e f5 fd ff ff    	jle    c0008246 <kernel_main2+0x4f>
c0008451:	c7 05 60 fb 00 c0 00 	movl   $0xc0083300,0xc000fb60
c0008458:	33 08 c0 
c000845b:	eb fe                	jmp    c000845b <kernel_main2+0x264>

c000845d <TestTTY>:
c000845d:	55                   	push   %ebp
c000845e:	89 e5                	mov    %esp,%ebp
c0008460:	83 ec 28             	sub    $0x28,%esp
c0008463:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c000846a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008471:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008477:	83 ec 08             	sub    $0x8,%esp
c000847a:	6a 02                	push   $0x2
c000847c:	8d 45 de             	lea    -0x22(%ebp),%eax
c000847f:	50                   	push   %eax
c0008480:	e8 37 d8 ff ff       	call   c0005cbc <open>
c0008485:	83 c4 10             	add    $0x10,%esp
c0008488:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000848b:	83 ec 08             	sub    $0x8,%esp
c000848e:	6a 02                	push   $0x2
c0008490:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008493:	50                   	push   %eax
c0008494:	e8 23 d8 ff ff       	call   c0005cbc <open>
c0008499:	83 c4 10             	add    $0x10,%esp
c000849c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000849f:	83 ec 0c             	sub    $0xc,%esp
c00084a2:	68 81 af 00 c0       	push   $0xc000af81
c00084a7:	e8 f8 09 00 00       	call   c0008ea4 <Printf>
c00084ac:	83 c4 10             	add    $0x10,%esp
c00084af:	83 ec 0c             	sub    $0xc,%esp
c00084b2:	6a 0a                	push   $0xa
c00084b4:	e8 10 ea ff ff       	call   c0006ec9 <sys_malloc>
c00084b9:	83 c4 10             	add    $0x10,%esp
c00084bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00084bf:	83 ec 04             	sub    $0x4,%esp
c00084c2:	6a 0a                	push   $0xa
c00084c4:	6a 00                	push   $0x0
c00084c6:	ff 75 ec             	pushl  -0x14(%ebp)
c00084c9:	e8 84 2e 00 00       	call   c000b352 <Memset>
c00084ce:	83 c4 10             	add    $0x10,%esp
c00084d1:	83 ec 04             	sub    $0x4,%esp
c00084d4:	6a 0a                	push   $0xa
c00084d6:	ff 75 ec             	pushl  -0x14(%ebp)
c00084d9:	ff 75 f0             	pushl  -0x10(%ebp)
c00084dc:	e8 60 d8 ff ff       	call   c0005d41 <read>
c00084e1:	83 c4 10             	add    $0x10,%esp
c00084e4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00084e7:	83 ec 08             	sub    $0x8,%esp
c00084ea:	ff 75 ec             	pushl  -0x14(%ebp)
c00084ed:	68 93 af 00 c0       	push   $0xc000af93
c00084f2:	e8 ad 09 00 00       	call   c0008ea4 <Printf>
c00084f7:	83 c4 10             	add    $0x10,%esp
c00084fa:	eb c3                	jmp    c00084bf <TestTTY+0x62>

c00084fc <TestFS>:
c00084fc:	55                   	push   %ebp
c00084fd:	89 e5                	mov    %esp,%ebp
c00084ff:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c0008505:	83 ec 0c             	sub    $0xc,%esp
c0008508:	68 9d af 00 c0       	push   $0xc000af9d
c000850d:	e8 7a 90 ff ff       	call   c000158c <disp_str>
c0008512:	83 c4 10             	add    $0x10,%esp
c0008515:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c000851c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008523:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008529:	83 ec 08             	sub    $0x8,%esp
c000852c:	6a 02                	push   $0x2
c000852e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008531:	50                   	push   %eax
c0008532:	e8 85 d7 ff ff       	call   c0005cbc <open>
c0008537:	83 c4 10             	add    $0x10,%esp
c000853a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000853d:	83 ec 08             	sub    $0x8,%esp
c0008540:	6a 02                	push   $0x2
c0008542:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008545:	50                   	push   %eax
c0008546:	e8 71 d7 ff ff       	call   c0005cbc <open>
c000854b:	83 c4 10             	add    $0x10,%esp
c000854e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008551:	83 ec 0c             	sub    $0xc,%esp
c0008554:	68 81 af 00 c0       	push   $0xc000af81
c0008559:	e8 46 09 00 00       	call   c0008ea4 <Printf>
c000855e:	83 c4 10             	add    $0x10,%esp
c0008561:	90                   	nop
c0008562:	c9                   	leave  
c0008563:	c3                   	ret    

c0008564 <wait_exit>:
c0008564:	55                   	push   %ebp
c0008565:	89 e5                	mov    %esp,%ebp
c0008567:	83 ec 28             	sub    $0x28,%esp
c000856a:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008571:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008578:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000857e:	83 ec 08             	sub    $0x8,%esp
c0008581:	6a 02                	push   $0x2
c0008583:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008586:	50                   	push   %eax
c0008587:	e8 30 d7 ff ff       	call   c0005cbc <open>
c000858c:	83 c4 10             	add    $0x10,%esp
c000858f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008592:	83 ec 08             	sub    $0x8,%esp
c0008595:	6a 02                	push   $0x2
c0008597:	8d 45 de             	lea    -0x22(%ebp),%eax
c000859a:	50                   	push   %eax
c000859b:	e8 1c d7 ff ff       	call   c0005cbc <open>
c00085a0:	83 c4 10             	add    $0x10,%esp
c00085a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00085a6:	e8 42 d9 ff ff       	call   c0005eed <fork>
c00085ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00085ae:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00085b2:	7e 25                	jle    c00085d9 <wait_exit+0x75>
c00085b4:	83 ec 0c             	sub    $0xc,%esp
c00085b7:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00085ba:	50                   	push   %eax
c00085bb:	e8 c6 d8 ff ff       	call   c0005e86 <wait>
c00085c0:	83 c4 10             	add    $0x10,%esp
c00085c3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00085c6:	83 ec 08             	sub    $0x8,%esp
c00085c9:	50                   	push   %eax
c00085ca:	68 a5 af 00 c0       	push   $0xc000afa5
c00085cf:	e8 d0 08 00 00       	call   c0008ea4 <Printf>
c00085d4:	83 c4 10             	add    $0x10,%esp
c00085d7:	eb fe                	jmp    c00085d7 <wait_exit+0x73>
c00085d9:	83 ec 0c             	sub    $0xc,%esp
c00085dc:	68 c0 af 00 c0       	push   $0xc000afc0
c00085e1:	e8 be 08 00 00       	call   c0008ea4 <Printf>
c00085e6:	83 c4 10             	add    $0x10,%esp
c00085e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00085f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00085f3:	8d 50 01             	lea    0x1(%eax),%edx
c00085f6:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00085f9:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c00085fe:	7f 02                	jg     c0008602 <wait_exit+0x9e>
c0008600:	eb ee                	jmp    c00085f0 <wait_exit+0x8c>
c0008602:	90                   	nop
c0008603:	83 ec 0c             	sub    $0xc,%esp
c0008606:	68 cc af 00 c0       	push   $0xc000afcc
c000860b:	e8 94 08 00 00       	call   c0008ea4 <Printf>
c0008610:	83 c4 10             	add    $0x10,%esp
c0008613:	83 ec 0c             	sub    $0xc,%esp
c0008616:	6a 09                	push   $0x9
c0008618:	e8 a7 d8 ff ff       	call   c0005ec4 <exit>
c000861d:	83 c4 10             	add    $0x10,%esp
c0008620:	83 ec 0c             	sub    $0xc,%esp
c0008623:	68 da af 00 c0       	push   $0xc000afda
c0008628:	e8 77 08 00 00       	call   c0008ea4 <Printf>
c000862d:	83 c4 10             	add    $0x10,%esp
c0008630:	eb fe                	jmp    c0008630 <wait_exit+0xcc>

c0008632 <INIT_fork>:
c0008632:	55                   	push   %ebp
c0008633:	89 e5                	mov    %esp,%ebp
c0008635:	53                   	push   %ebx
c0008636:	83 ec 74             	sub    $0x74,%esp
c0008639:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c0008640:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c0008647:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c000864d:	83 ec 08             	sub    $0x8,%esp
c0008650:	6a 02                	push   $0x2
c0008652:	8d 45 da             	lea    -0x26(%ebp),%eax
c0008655:	50                   	push   %eax
c0008656:	e8 61 d6 ff ff       	call   c0005cbc <open>
c000865b:	83 c4 10             	add    $0x10,%esp
c000865e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008661:	83 ec 08             	sub    $0x8,%esp
c0008664:	6a 02                	push   $0x2
c0008666:	8d 45 da             	lea    -0x26(%ebp),%eax
c0008669:	50                   	push   %eax
c000866a:	e8 4d d6 ff ff       	call   c0005cbc <open>
c000866f:	83 c4 10             	add    $0x10,%esp
c0008672:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008675:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c000867c:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c0008683:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c000868a:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c0008691:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c0008698:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c000869f:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c00086a6:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c00086ad:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c00086b4:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c00086bb:	83 ec 0c             	sub    $0xc,%esp
c00086be:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086c1:	50                   	push   %eax
c00086c2:	e8 dd 07 00 00       	call   c0008ea4 <Printf>
c00086c7:	83 c4 10             	add    $0x10,%esp
c00086ca:	83 ec 0c             	sub    $0xc,%esp
c00086cd:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086d0:	50                   	push   %eax
c00086d1:	e8 b5 2c 00 00       	call   c000b38b <Strlen>
c00086d6:	83 c4 10             	add    $0x10,%esp
c00086d9:	83 ec 04             	sub    $0x4,%esp
c00086dc:	50                   	push   %eax
c00086dd:	6a 00                	push   $0x0
c00086df:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086e2:	50                   	push   %eax
c00086e3:	e8 6a 2c 00 00       	call   c000b352 <Memset>
c00086e8:	83 c4 10             	add    $0x10,%esp
c00086eb:	83 ec 04             	sub    $0x4,%esp
c00086ee:	6a 28                	push   $0x28
c00086f0:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086f3:	50                   	push   %eax
c00086f4:	ff 75 e8             	pushl  -0x18(%ebp)
c00086f7:	e8 45 d6 ff ff       	call   c0005d41 <read>
c00086fc:	83 c4 10             	add    $0x10,%esp
c00086ff:	83 ec 0c             	sub    $0xc,%esp
c0008702:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008705:	50                   	push   %eax
c0008706:	e8 99 07 00 00       	call   c0008ea4 <Printf>
c000870b:	83 c4 10             	add    $0x10,%esp
c000870e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008715:	e8 d3 d7 ff ff       	call   c0005eed <fork>
c000871a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000871d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0008721:	0f 8e 81 00 00 00    	jle    c00087a8 <INIT_fork+0x176>
c0008727:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000872b:	c7 45 8a 50 61 72 65 	movl   $0x65726150,-0x76(%ebp)
c0008732:	c7 45 8e 6e 74 0a 00 	movl   $0xa746e,-0x72(%ebp)
c0008739:	8d 45 92             	lea    -0x6e(%ebp),%eax
c000873c:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008741:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008746:	89 18                	mov    %ebx,(%eax)
c0008748:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c000874c:	8d 50 04             	lea    0x4(%eax),%edx
c000874f:	83 e2 fc             	and    $0xfffffffc,%edx
c0008752:	29 d0                	sub    %edx,%eax
c0008754:	01 c1                	add    %eax,%ecx
c0008756:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008759:	83 e1 fc             	and    $0xfffffffc,%ecx
c000875c:	b8 00 00 00 00       	mov    $0x0,%eax
c0008761:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008764:	83 c0 04             	add    $0x4,%eax
c0008767:	39 c8                	cmp    %ecx,%eax
c0008769:	72 f6                	jb     c0008761 <INIT_fork+0x12f>
c000876b:	01 c2                	add    %eax,%edx
c000876d:	83 ec 0c             	sub    $0xc,%esp
c0008770:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008773:	50                   	push   %eax
c0008774:	e8 12 2c 00 00       	call   c000b38b <Strlen>
c0008779:	83 c4 10             	add    $0x10,%esp
c000877c:	83 ec 04             	sub    $0x4,%esp
c000877f:	50                   	push   %eax
c0008780:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008783:	50                   	push   %eax
c0008784:	ff 75 ec             	pushl  -0x14(%ebp)
c0008787:	e8 29 d6 ff ff       	call   c0005db5 <write>
c000878c:	83 c4 10             	add    $0x10,%esp
c000878f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008796:	eb 08                	jmp    c00087a0 <INIT_fork+0x16e>
c0008798:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000879c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00087a0:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c00087a4:	7e f2                	jle    c0008798 <INIT_fork+0x166>
c00087a6:	eb 79                	jmp    c0008821 <INIT_fork+0x1ef>
c00087a8:	83 ec 0c             	sub    $0xc,%esp
c00087ab:	6a 0a                	push   $0xa
c00087ad:	e8 c1 05 00 00       	call   c0008d73 <delay>
c00087b2:	83 c4 10             	add    $0x10,%esp
c00087b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00087b9:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c00087bd:	c7 45 8a 43 68 69 6c 	movl   $0x6c696843,-0x76(%ebp)
c00087c4:	c7 45 8e 64 0a 00 00 	movl   $0xa64,-0x72(%ebp)
c00087cb:	8d 45 92             	lea    -0x6e(%ebp),%eax
c00087ce:	b9 20 00 00 00       	mov    $0x20,%ecx
c00087d3:	bb 00 00 00 00       	mov    $0x0,%ebx
c00087d8:	89 18                	mov    %ebx,(%eax)
c00087da:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c00087de:	8d 50 04             	lea    0x4(%eax),%edx
c00087e1:	83 e2 fc             	and    $0xfffffffc,%edx
c00087e4:	29 d0                	sub    %edx,%eax
c00087e6:	01 c1                	add    %eax,%ecx
c00087e8:	83 e1 fc             	and    $0xfffffffc,%ecx
c00087eb:	83 e1 fc             	and    $0xfffffffc,%ecx
c00087ee:	b8 00 00 00 00       	mov    $0x0,%eax
c00087f3:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c00087f6:	83 c0 04             	add    $0x4,%eax
c00087f9:	39 c8                	cmp    %ecx,%eax
c00087fb:	72 f6                	jb     c00087f3 <INIT_fork+0x1c1>
c00087fd:	01 c2                	add    %eax,%edx
c00087ff:	83 ec 0c             	sub    $0xc,%esp
c0008802:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008805:	50                   	push   %eax
c0008806:	e8 80 2b 00 00       	call   c000b38b <Strlen>
c000880b:	83 c4 10             	add    $0x10,%esp
c000880e:	83 ec 04             	sub    $0x4,%esp
c0008811:	50                   	push   %eax
c0008812:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008815:	50                   	push   %eax
c0008816:	ff 75 ec             	pushl  -0x14(%ebp)
c0008819:	e8 97 d5 ff ff       	call   c0005db5 <write>
c000881e:	83 c4 10             	add    $0x10,%esp
c0008821:	90                   	nop
c0008822:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0008825:	c9                   	leave  
c0008826:	c3                   	ret    

c0008827 <simple_shell>:
c0008827:	55                   	push   %ebp
c0008828:	89 e5                	mov    %esp,%ebp
c000882a:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008830:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008837:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c000883e:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008844:	83 ec 08             	sub    $0x8,%esp
c0008847:	6a 02                	push   $0x2
c0008849:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000884c:	50                   	push   %eax
c000884d:	e8 6a d4 ff ff       	call   c0005cbc <open>
c0008852:	83 c4 10             	add    $0x10,%esp
c0008855:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008858:	83 ec 08             	sub    $0x8,%esp
c000885b:	6a 02                	push   $0x2
c000885d:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008860:	50                   	push   %eax
c0008861:	e8 56 d4 ff ff       	call   c0005cbc <open>
c0008866:	83 c4 10             	add    $0x10,%esp
c0008869:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000886c:	83 ec 04             	sub    $0x4,%esp
c000886f:	68 80 00 00 00       	push   $0x80
c0008874:	6a 00                	push   $0x0
c0008876:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000887c:	50                   	push   %eax
c000887d:	e8 d0 2a 00 00       	call   c000b352 <Memset>
c0008882:	83 c4 10             	add    $0x10,%esp
c0008885:	83 ec 04             	sub    $0x4,%esp
c0008888:	68 80 00 00 00       	push   $0x80
c000888d:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008893:	50                   	push   %eax
c0008894:	ff 75 e0             	pushl  -0x20(%ebp)
c0008897:	e8 a5 d4 ff ff       	call   c0005d41 <read>
c000889c:	83 c4 10             	add    $0x10,%esp
c000889f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00088a6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00088ad:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00088b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00088b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088b9:	0f b6 00             	movzbl (%eax),%eax
c00088bc:	88 45 db             	mov    %al,-0x25(%ebp)
c00088bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088c2:	0f b6 00             	movzbl (%eax),%eax
c00088c5:	3c 20                	cmp    $0x20,%al
c00088c7:	74 1d                	je     c00088e6 <simple_shell+0xbf>
c00088c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088cc:	0f b6 00             	movzbl (%eax),%eax
c00088cf:	84 c0                	test   %al,%al
c00088d1:	74 13                	je     c00088e6 <simple_shell+0xbf>
c00088d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00088d7:	75 0d                	jne    c00088e6 <simple_shell+0xbf>
c00088d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088dc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00088df:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00088e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088e9:	0f b6 00             	movzbl (%eax),%eax
c00088ec:	3c 20                	cmp    $0x20,%al
c00088ee:	74 0a                	je     c00088fa <simple_shell+0xd3>
c00088f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088f3:	0f b6 00             	movzbl (%eax),%eax
c00088f6:	84 c0                	test   %al,%al
c00088f8:	75 26                	jne    c0008920 <simple_shell+0xf9>
c00088fa:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00088fe:	75 20                	jne    c0008920 <simple_shell+0xf9>
c0008900:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008903:	8d 50 01             	lea    0x1(%eax),%edx
c0008906:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008909:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000890c:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008913:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008916:	c6 00 00             	movb   $0x0,(%eax)
c0008919:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008920:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008924:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008928:	75 8c                	jne    c00088b6 <simple_shell+0x8f>
c000892a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000892d:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008934:	00 00 00 00 
c0008938:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c000893f:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008945:	83 ec 08             	sub    $0x8,%esp
c0008948:	6a 02                	push   $0x2
c000894a:	50                   	push   %eax
c000894b:	e8 6c d3 ff ff       	call   c0005cbc <open>
c0008950:	83 c4 10             	add    $0x10,%esp
c0008953:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008956:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c000895a:	75 54                	jne    c00089b0 <simple_shell+0x189>
c000895c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008963:	eb 29                	jmp    c000898e <simple_shell+0x167>
c0008965:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c000896b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000896e:	01 d0                	add    %edx,%eax
c0008970:	0f b6 00             	movzbl (%eax),%eax
c0008973:	0f be c0             	movsbl %al,%eax
c0008976:	83 ec 04             	sub    $0x4,%esp
c0008979:	50                   	push   %eax
c000897a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000897d:	68 e8 af 00 c0       	push   $0xc000afe8
c0008982:	e8 1d 05 00 00       	call   c0008ea4 <Printf>
c0008987:	83 c4 10             	add    $0x10,%esp
c000898a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000898e:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008992:	7e d1                	jle    c0008965 <simple_shell+0x13e>
c0008994:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c000899a:	83 ec 08             	sub    $0x8,%esp
c000899d:	50                   	push   %eax
c000899e:	68 ef af 00 c0       	push   $0xc000afef
c00089a3:	e8 fc 04 00 00       	call   c0008ea4 <Printf>
c00089a8:	83 c4 10             	add    $0x10,%esp
c00089ab:	e9 bc fe ff ff       	jmp    c000886c <simple_shell+0x45>
c00089b0:	e8 38 d5 ff ff       	call   c0005eed <fork>
c00089b5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00089b8:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00089bc:	7e 17                	jle    c00089d5 <simple_shell+0x1ae>
c00089be:	83 ec 0c             	sub    $0xc,%esp
c00089c1:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00089c7:	50                   	push   %eax
c00089c8:	e8 b9 d4 ff ff       	call   c0005e86 <wait>
c00089cd:	83 c4 10             	add    $0x10,%esp
c00089d0:	e9 97 fe ff ff       	jmp    c000886c <simple_shell+0x45>
c00089d5:	83 ec 0c             	sub    $0xc,%esp
c00089d8:	ff 75 d0             	pushl  -0x30(%ebp)
c00089db:	e8 5a d4 ff ff       	call   c0005e3a <close>
c00089e0:	83 c4 10             	add    $0x10,%esp
c00089e3:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00089e9:	83 ec 08             	sub    $0x8,%esp
c00089ec:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c00089f2:	52                   	push   %edx
c00089f3:	50                   	push   %eax
c00089f4:	e8 e3 d5 ff ff       	call   c0005fdc <execv>
c00089f9:	83 c4 10             	add    $0x10,%esp
c00089fc:	eb fe                	jmp    c00089fc <simple_shell+0x1d5>

c00089fe <test_split_str>:
c00089fe:	55                   	push   %ebp
c00089ff:	89 e5                	mov    %esp,%ebp
c0008a01:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008a07:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008a0e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008a15:	c7 45 ec f5 af 00 c0 	movl   $0xc000aff5,-0x14(%ebp)
c0008a1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008a20:	75 1a                	jne    c0008a3c <test_split_str+0x3e>
c0008a22:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a25:	0f b6 00             	movzbl (%eax),%eax
c0008a28:	0f be c0             	movsbl %al,%eax
c0008a2b:	83 ec 08             	sub    $0x8,%esp
c0008a2e:	50                   	push   %eax
c0008a2f:	68 06 b0 00 c0       	push   $0xc000b006
c0008a34:	e8 6b 04 00 00       	call   c0008ea4 <Printf>
c0008a39:	83 c4 10             	add    $0x10,%esp
c0008a3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a3f:	0f b6 00             	movzbl (%eax),%eax
c0008a42:	3c 20                	cmp    $0x20,%al
c0008a44:	75 0a                	jne    c0008a50 <test_split_str+0x52>
c0008a46:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a49:	0f b6 00             	movzbl (%eax),%eax
c0008a4c:	84 c0                	test   %al,%al
c0008a4e:	74 13                	je     c0008a63 <test_split_str+0x65>
c0008a50:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008a54:	75 0d                	jne    c0008a63 <test_split_str+0x65>
c0008a56:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a59:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008a5c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008a63:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a66:	0f b6 00             	movzbl (%eax),%eax
c0008a69:	3c 20                	cmp    $0x20,%al
c0008a6b:	74 0a                	je     c0008a77 <test_split_str+0x79>
c0008a6d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a70:	0f b6 00             	movzbl (%eax),%eax
c0008a73:	84 c0                	test   %al,%al
c0008a75:	75 26                	jne    c0008a9d <test_split_str+0x9f>
c0008a77:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008a7b:	75 20                	jne    c0008a9d <test_split_str+0x9f>
c0008a7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a80:	8d 50 01             	lea    0x1(%eax),%edx
c0008a83:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008a86:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008a89:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008a90:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a93:	c6 00 00             	movb   $0x0,(%eax)
c0008a96:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008a9d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008aa1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008aa4:	0f b6 00             	movzbl (%eax),%eax
c0008aa7:	84 c0                	test   %al,%al
c0008aa9:	0f 85 6d ff ff ff    	jne    c0008a1c <test_split_str+0x1e>
c0008aaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ab2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008ab5:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008abc:	83 ec 08             	sub    $0x8,%esp
c0008abf:	ff 75 f4             	pushl  -0xc(%ebp)
c0008ac2:	68 0f b0 00 c0       	push   $0xc000b00f
c0008ac7:	e8 d8 03 00 00       	call   c0008ea4 <Printf>
c0008acc:	83 c4 10             	add    $0x10,%esp
c0008acf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008ad6:	eb 22                	jmp    c0008afa <test_split_str+0xfc>
c0008ad8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008adb:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008ae2:	83 ec 04             	sub    $0x4,%esp
c0008ae5:	50                   	push   %eax
c0008ae6:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008ae9:	68 26 b0 00 c0       	push   $0xc000b026
c0008aee:	e8 b1 03 00 00       	call   c0008ea4 <Printf>
c0008af3:	83 c4 10             	add    $0x10,%esp
c0008af6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008afa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008afd:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0008b00:	7e d6                	jle    c0008ad8 <test_split_str+0xda>
c0008b02:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008b08:	83 ec 08             	sub    $0x8,%esp
c0008b0b:	68 35 b0 00 c0       	push   $0xc000b035
c0008b10:	50                   	push   %eax
c0008b11:	e8 a9 12 00 00       	call   c0009dbf <strcmp>
c0008b16:	83 c4 10             	add    $0x10,%esp
c0008b19:	85 c0                	test   %eax,%eax
c0008b1b:	75 10                	jne    c0008b2d <test_split_str+0x12f>
c0008b1d:	83 ec 0c             	sub    $0xc,%esp
c0008b20:	68 3a b0 00 c0       	push   $0xc000b03a
c0008b25:	e8 7a 03 00 00       	call   c0008ea4 <Printf>
c0008b2a:	83 c4 10             	add    $0x10,%esp
c0008b2d:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008b33:	83 ec 08             	sub    $0x8,%esp
c0008b36:	50                   	push   %eax
c0008b37:	68 46 b0 00 c0       	push   $0xc000b046
c0008b3c:	e8 63 03 00 00       	call   c0008ea4 <Printf>
c0008b41:	83 c4 10             	add    $0x10,%esp
c0008b44:	83 ec 0c             	sub    $0xc,%esp
c0008b47:	68 54 b0 00 c0       	push   $0xc000b054
c0008b4c:	e8 53 03 00 00       	call   c0008ea4 <Printf>
c0008b51:	83 c4 10             	add    $0x10,%esp
c0008b54:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008b5b:	eb 26                	jmp    c0008b83 <test_split_str+0x185>
c0008b5d:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008b63:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008b66:	01 d0                	add    %edx,%eax
c0008b68:	0f b6 00             	movzbl (%eax),%eax
c0008b6b:	0f be c0             	movsbl %al,%eax
c0008b6e:	83 ec 08             	sub    $0x8,%esp
c0008b71:	50                   	push   %eax
c0008b72:	68 63 b0 00 c0       	push   $0xc000b063
c0008b77:	e8 28 03 00 00       	call   c0008ea4 <Printf>
c0008b7c:	83 c4 10             	add    $0x10,%esp
c0008b7f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008b83:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0008b87:	7e d4                	jle    c0008b5d <test_split_str+0x15f>
c0008b89:	c9                   	leave  
c0008b8a:	c3                   	ret    

c0008b8b <test_shell>:
c0008b8b:	55                   	push   %ebp
c0008b8c:	89 e5                	mov    %esp,%ebp
c0008b8e:	83 ec 48             	sub    $0x48,%esp
c0008b91:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c0008b98:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0008b9f:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0008ba5:	83 ec 08             	sub    $0x8,%esp
c0008ba8:	6a 02                	push   $0x2
c0008baa:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c0008bad:	50                   	push   %eax
c0008bae:	e8 09 d1 ff ff       	call   c0005cbc <open>
c0008bb3:	83 c4 10             	add    $0x10,%esp
c0008bb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008bb9:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0008bc0:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0008bc7:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0008bce:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008bd5:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008bdc:	83 ec 0c             	sub    $0xc,%esp
c0008bdf:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0008be2:	50                   	push   %eax
c0008be3:	e8 aa eb ff ff       	call   c0007792 <untar>
c0008be8:	83 c4 10             	add    $0x10,%esp
c0008beb:	e8 fd d2 ff ff       	call   c0005eed <fork>
c0008bf0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008bf3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008bf7:	7e 25                	jle    c0008c1e <test_shell+0x93>
c0008bf9:	83 ec 0c             	sub    $0xc,%esp
c0008bfc:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0008bff:	50                   	push   %eax
c0008c00:	e8 81 d2 ff ff       	call   c0005e86 <wait>
c0008c05:	83 c4 10             	add    $0x10,%esp
c0008c08:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008c0b:	83 ec 08             	sub    $0x8,%esp
c0008c0e:	50                   	push   %eax
c0008c0f:	68 6c b0 00 c0       	push   $0xc000b06c
c0008c14:	e8 8b 02 00 00       	call   c0008ea4 <Printf>
c0008c19:	83 c4 10             	add    $0x10,%esp
c0008c1c:	eb 23                	jmp    c0008c41 <test_shell+0xb6>
c0008c1e:	83 ec 0c             	sub    $0xc,%esp
c0008c21:	68 7e b0 00 c0       	push   $0xc000b07e
c0008c26:	e8 79 02 00 00       	call   c0008ea4 <Printf>
c0008c2b:	83 c4 10             	add    $0x10,%esp
c0008c2e:	83 ec 0c             	sub    $0xc,%esp
c0008c31:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c34:	e8 01 d2 ff ff       	call   c0005e3a <close>
c0008c39:	83 c4 10             	add    $0x10,%esp
c0008c3c:	e8 e6 fb ff ff       	call   c0008827 <simple_shell>
c0008c41:	83 ec 0c             	sub    $0xc,%esp
c0008c44:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0008c47:	50                   	push   %eax
c0008c48:	e8 39 d2 ff ff       	call   c0005e86 <wait>
c0008c4d:	83 c4 10             	add    $0x10,%esp
c0008c50:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008c53:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008c56:	83 ec 08             	sub    $0x8,%esp
c0008c59:	50                   	push   %eax
c0008c5a:	68 8c b0 00 c0       	push   $0xc000b08c
c0008c5f:	e8 40 02 00 00       	call   c0008ea4 <Printf>
c0008c64:	83 c4 10             	add    $0x10,%esp
c0008c67:	eb d8                	jmp    c0008c41 <test_shell+0xb6>

c0008c69 <test_exec>:
c0008c69:	55                   	push   %ebp
c0008c6a:	89 e5                	mov    %esp,%ebp
c0008c6c:	83 ec 38             	sub    $0x38,%esp
c0008c6f:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008c76:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008c7d:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008c83:	83 ec 08             	sub    $0x8,%esp
c0008c86:	6a 02                	push   $0x2
c0008c88:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008c8b:	50                   	push   %eax
c0008c8c:	e8 2b d0 ff ff       	call   c0005cbc <open>
c0008c91:	83 c4 10             	add    $0x10,%esp
c0008c94:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008c97:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0008c9e:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0008ca5:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0008cac:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008cb3:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0008cba:	83 ec 0c             	sub    $0xc,%esp
c0008cbd:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0008cc0:	50                   	push   %eax
c0008cc1:	e8 cc ea ff ff       	call   c0007792 <untar>
c0008cc6:	83 c4 10             	add    $0x10,%esp
c0008cc9:	e8 1f d2 ff ff       	call   c0005eed <fork>
c0008cce:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008cd1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008cd5:	7e 25                	jle    c0008cfc <test_exec+0x93>
c0008cd7:	83 ec 0c             	sub    $0xc,%esp
c0008cda:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0008cdd:	50                   	push   %eax
c0008cde:	e8 a3 d1 ff ff       	call   c0005e86 <wait>
c0008ce3:	83 c4 10             	add    $0x10,%esp
c0008ce6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008ce9:	83 ec 08             	sub    $0x8,%esp
c0008cec:	50                   	push   %eax
c0008ced:	68 6c b0 00 c0       	push   $0xc000b06c
c0008cf2:	e8 ad 01 00 00       	call   c0008ea4 <Printf>
c0008cf7:	83 c4 10             	add    $0x10,%esp
c0008cfa:	eb 33                	jmp    c0008d2f <test_exec+0xc6>
c0008cfc:	83 ec 0c             	sub    $0xc,%esp
c0008cff:	68 7e b0 00 c0       	push   $0xc000b07e
c0008d04:	e8 9b 01 00 00       	call   c0008ea4 <Printf>
c0008d09:	83 c4 10             	add    $0x10,%esp
c0008d0c:	83 ec 0c             	sub    $0xc,%esp
c0008d0f:	6a 00                	push   $0x0
c0008d11:	68 a7 b0 00 c0       	push   $0xc000b0a7
c0008d16:	68 ad b0 00 c0       	push   $0xc000b0ad
c0008d1b:	68 35 b0 00 c0       	push   $0xc000b035
c0008d20:	68 b3 b0 00 c0       	push   $0xc000b0b3
c0008d25:	e8 57 d4 ff ff       	call   c0006181 <execl>
c0008d2a:	83 c4 20             	add    $0x20,%esp
c0008d2d:	eb fe                	jmp    c0008d2d <test_exec+0xc4>
c0008d2f:	c9                   	leave  
c0008d30:	c3                   	ret    

c0008d31 <INIT>:
c0008d31:	55                   	push   %ebp
c0008d32:	89 e5                	mov    %esp,%ebp
c0008d34:	83 ec 08             	sub    $0x8,%esp
c0008d37:	e8 4f fe ff ff       	call   c0008b8b <test_shell>
c0008d3c:	eb fe                	jmp    c0008d3c <INIT+0xb>

c0008d3e <TestA>:
c0008d3e:	55                   	push   %ebp
c0008d3f:	89 e5                	mov    %esp,%ebp
c0008d41:	83 ec 08             	sub    $0x8,%esp
c0008d44:	83 ec 0c             	sub    $0xc,%esp
c0008d47:	6a 05                	push   $0x5
c0008d49:	e8 f4 ec ff ff       	call   c0007a42 <disp_int>
c0008d4e:	83 c4 10             	add    $0x10,%esp
c0008d51:	83 ec 0c             	sub    $0xc,%esp
c0008d54:	68 34 ac 00 c0       	push   $0xc000ac34
c0008d59:	e8 2e 88 ff ff       	call   c000158c <disp_str>
c0008d5e:	83 c4 10             	add    $0x10,%esp
c0008d61:	83 ec 0c             	sub    $0xc,%esp
c0008d64:	68 b9 b0 00 c0       	push   $0xc000b0b9
c0008d69:	e8 1e 88 ff ff       	call   c000158c <disp_str>
c0008d6e:	83 c4 10             	add    $0x10,%esp
c0008d71:	eb fe                	jmp    c0008d71 <TestA+0x33>

c0008d73 <delay>:
c0008d73:	55                   	push   %ebp
c0008d74:	89 e5                	mov    %esp,%ebp
c0008d76:	83 ec 10             	sub    $0x10,%esp
c0008d79:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008d80:	eb 2d                	jmp    c0008daf <delay+0x3c>
c0008d82:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0008d89:	eb 1a                	jmp    c0008da5 <delay+0x32>
c0008d8b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008d92:	eb 04                	jmp    c0008d98 <delay+0x25>
c0008d94:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008d98:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c0008d9f:	7e f3                	jle    c0008d94 <delay+0x21>
c0008da1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008da5:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0008da9:	7e e0                	jle    c0008d8b <delay+0x18>
c0008dab:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008daf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008db2:	3b 45 08             	cmp    0x8(%ebp),%eax
c0008db5:	7c cb                	jl     c0008d82 <delay+0xf>
c0008db7:	90                   	nop
c0008db8:	c9                   	leave  
c0008db9:	c3                   	ret    

c0008dba <TestB>:
c0008dba:	55                   	push   %ebp
c0008dbb:	89 e5                	mov    %esp,%ebp
c0008dbd:	83 ec 08             	sub    $0x8,%esp
c0008dc0:	83 ec 0c             	sub    $0xc,%esp
c0008dc3:	68 c0 b0 00 c0       	push   $0xc000b0c0
c0008dc8:	e8 bf 87 ff ff       	call   c000158c <disp_str>
c0008dcd:	83 c4 10             	add    $0x10,%esp
c0008dd0:	eb fe                	jmp    c0008dd0 <TestB+0x16>

c0008dd2 <TestC>:
c0008dd2:	55                   	push   %ebp
c0008dd3:	89 e5                	mov    %esp,%ebp
c0008dd5:	83 ec 18             	sub    $0x18,%esp
c0008dd8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008ddf:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008de3:	77 1a                	ja     c0008dff <TestC+0x2d>
c0008de5:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0008dec:	83 ec 08             	sub    $0x8,%esp
c0008def:	ff 75 f0             	pushl  -0x10(%ebp)
c0008df2:	68 c3 b0 00 c0       	push   $0xc000b0c3
c0008df7:	e8 a8 00 00 00       	call   c0008ea4 <Printf>
c0008dfc:	83 c4 10             	add    $0x10,%esp
c0008dff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008e03:	eb da                	jmp    c0008ddf <TestC+0xd>

c0008e05 <sys_get_ticks>:
c0008e05:	55                   	push   %ebp
c0008e06:	89 e5                	mov    %esp,%ebp
c0008e08:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008e0d:	5d                   	pop    %ebp
c0008e0e:	c3                   	ret    

c0008e0f <sys_write>:
c0008e0f:	55                   	push   %ebp
c0008e10:	89 e5                	mov    %esp,%ebp
c0008e12:	83 ec 18             	sub    $0x18,%esp
c0008e15:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e18:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0008e1e:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0008e24:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0008e29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e2c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008e2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008e32:	8b 45 08             	mov    0x8(%ebp),%eax
c0008e35:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008e38:	eb 20                	jmp    c0008e5a <sys_write+0x4b>
c0008e3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008e3d:	0f b6 00             	movzbl (%eax),%eax
c0008e40:	0f b6 c0             	movzbl %al,%eax
c0008e43:	83 ec 08             	sub    $0x8,%esp
c0008e46:	50                   	push   %eax
c0008e47:	ff 75 ec             	pushl  -0x14(%ebp)
c0008e4a:	e8 f9 c1 ff ff       	call   c0005048 <out_char>
c0008e4f:	83 c4 10             	add    $0x10,%esp
c0008e52:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008e56:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0008e5a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008e5e:	7f da                	jg     c0008e3a <sys_write+0x2b>
c0008e60:	90                   	nop
c0008e61:	c9                   	leave  
c0008e62:	c3                   	ret    

c0008e63 <milli_delay>:
c0008e63:	55                   	push   %ebp
c0008e64:	89 e5                	mov    %esp,%ebp
c0008e66:	83 ec 18             	sub    $0x18,%esp
c0008e69:	e8 7d 0d 00 00       	call   c0009beb <get_ticks_ipc>
c0008e6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008e71:	90                   	nop
c0008e72:	e8 74 0d 00 00       	call   c0009beb <get_ticks_ipc>
c0008e77:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0008e7a:	89 c1                	mov    %eax,%ecx
c0008e7c:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0008e81:	89 c8                	mov    %ecx,%eax
c0008e83:	f7 ea                	imul   %edx
c0008e85:	c1 fa 05             	sar    $0x5,%edx
c0008e88:	89 c8                	mov    %ecx,%eax
c0008e8a:	c1 f8 1f             	sar    $0x1f,%eax
c0008e8d:	29 c2                	sub    %eax,%edx
c0008e8f:	89 d0                	mov    %edx,%eax
c0008e91:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0008e97:	39 45 08             	cmp    %eax,0x8(%ebp)
c0008e9a:	77 d6                	ja     c0008e72 <milli_delay+0xf>
c0008e9c:	90                   	nop
c0008e9d:	c9                   	leave  
c0008e9e:	c3                   	ret    

c0008e9f <TaskSys>:
c0008e9f:	55                   	push   %ebp
c0008ea0:	89 e5                	mov    %esp,%ebp
c0008ea2:	eb fe                	jmp    c0008ea2 <TaskSys+0x3>

c0008ea4 <Printf>:
c0008ea4:	55                   	push   %ebp
c0008ea5:	89 e5                	mov    %esp,%ebp
c0008ea7:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008ead:	83 ec 04             	sub    $0x4,%esp
c0008eb0:	68 00 01 00 00       	push   $0x100
c0008eb5:	6a 00                	push   $0x0
c0008eb7:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008ebd:	50                   	push   %eax
c0008ebe:	e8 8f 24 00 00       	call   c000b352 <Memset>
c0008ec3:	83 c4 10             	add    $0x10,%esp
c0008ec6:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008ec9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ecc:	8b 45 08             	mov    0x8(%ebp),%eax
c0008ecf:	83 ec 04             	sub    $0x4,%esp
c0008ed2:	ff 75 f4             	pushl  -0xc(%ebp)
c0008ed5:	50                   	push   %eax
c0008ed6:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008edc:	50                   	push   %eax
c0008edd:	e8 20 00 00 00       	call   c0008f02 <vsprintf>
c0008ee2:	83 c4 10             	add    $0x10,%esp
c0008ee5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008ee8:	83 ec 04             	sub    $0x4,%esp
c0008eeb:	ff 75 f0             	pushl  -0x10(%ebp)
c0008eee:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008ef4:	50                   	push   %eax
c0008ef5:	6a 00                	push   $0x0
c0008ef7:	e8 b9 ce ff ff       	call   c0005db5 <write>
c0008efc:	83 c4 10             	add    $0x10,%esp
c0008eff:	90                   	nop
c0008f00:	c9                   	leave  
c0008f01:	c3                   	ret    

c0008f02 <vsprintf>:
c0008f02:	55                   	push   %ebp
c0008f03:	89 e5                	mov    %esp,%ebp
c0008f05:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0008f0b:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008f11:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0008f17:	83 ec 04             	sub    $0x4,%esp
c0008f1a:	6a 40                	push   $0x40
c0008f1c:	6a 00                	push   $0x0
c0008f1e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008f24:	50                   	push   %eax
c0008f25:	e8 28 24 00 00       	call   c000b352 <Memset>
c0008f2a:	83 c4 10             	add    $0x10,%esp
c0008f2d:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f30:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f33:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008f3a:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f3d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f40:	e9 53 01 00 00       	jmp    c0009098 <vsprintf+0x196>
c0008f45:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008f48:	0f b6 00             	movzbl (%eax),%eax
c0008f4b:	3c 25                	cmp    $0x25,%al
c0008f4d:	74 16                	je     c0008f65 <vsprintf+0x63>
c0008f4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f52:	8d 50 01             	lea    0x1(%eax),%edx
c0008f55:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008f58:	8b 55 0c             	mov    0xc(%ebp),%edx
c0008f5b:	0f b6 12             	movzbl (%edx),%edx
c0008f5e:	88 10                	mov    %dl,(%eax)
c0008f60:	e9 2f 01 00 00       	jmp    c0009094 <vsprintf+0x192>
c0008f65:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008f69:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008f6c:	0f b6 00             	movzbl (%eax),%eax
c0008f6f:	0f be c0             	movsbl %al,%eax
c0008f72:	83 f8 64             	cmp    $0x64,%eax
c0008f75:	74 26                	je     c0008f9d <vsprintf+0x9b>
c0008f77:	83 f8 64             	cmp    $0x64,%eax
c0008f7a:	7f 0e                	jg     c0008f8a <vsprintf+0x88>
c0008f7c:	83 f8 63             	cmp    $0x63,%eax
c0008f7f:	0f 84 f2 00 00 00    	je     c0009077 <vsprintf+0x175>
c0008f85:	e9 0a 01 00 00       	jmp    c0009094 <vsprintf+0x192>
c0008f8a:	83 f8 73             	cmp    $0x73,%eax
c0008f8d:	0f 84 b0 00 00 00    	je     c0009043 <vsprintf+0x141>
c0008f93:	83 f8 78             	cmp    $0x78,%eax
c0008f96:	74 5d                	je     c0008ff5 <vsprintf+0xf3>
c0008f98:	e9 f7 00 00 00       	jmp    c0009094 <vsprintf+0x192>
c0008f9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008fa0:	8b 00                	mov    (%eax),%eax
c0008fa2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008fa5:	83 ec 04             	sub    $0x4,%esp
c0008fa8:	6a 0a                	push   $0xa
c0008faa:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0008fb0:	50                   	push   %eax
c0008fb1:	ff 75 e8             	pushl  -0x18(%ebp)
c0008fb4:	e8 7d 0c 00 00       	call   c0009c36 <itoa>
c0008fb9:	83 c4 10             	add    $0x10,%esp
c0008fbc:	83 ec 08             	sub    $0x8,%esp
c0008fbf:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008fc5:	50                   	push   %eax
c0008fc6:	ff 75 f4             	pushl  -0xc(%ebp)
c0008fc9:	e8 a3 23 00 00       	call   c000b371 <Strcpy>
c0008fce:	83 c4 10             	add    $0x10,%esp
c0008fd1:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008fd5:	83 ec 0c             	sub    $0xc,%esp
c0008fd8:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008fde:	50                   	push   %eax
c0008fdf:	e8 a7 23 00 00       	call   c000b38b <Strlen>
c0008fe4:	83 c4 10             	add    $0x10,%esp
c0008fe7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008fea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fed:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008ff0:	e9 9f 00 00 00       	jmp    c0009094 <vsprintf+0x192>
c0008ff5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008ff8:	8b 00                	mov    (%eax),%eax
c0008ffa:	83 ec 08             	sub    $0x8,%esp
c0008ffd:	50                   	push   %eax
c0008ffe:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009004:	50                   	push   %eax
c0009005:	e8 92 e9 ff ff       	call   c000799c <atoi>
c000900a:	83 c4 10             	add    $0x10,%esp
c000900d:	83 ec 08             	sub    $0x8,%esp
c0009010:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009016:	50                   	push   %eax
c0009017:	ff 75 f4             	pushl  -0xc(%ebp)
c000901a:	e8 52 23 00 00       	call   c000b371 <Strcpy>
c000901f:	83 c4 10             	add    $0x10,%esp
c0009022:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009026:	83 ec 0c             	sub    $0xc,%esp
c0009029:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000902f:	50                   	push   %eax
c0009030:	e8 56 23 00 00       	call   c000b38b <Strlen>
c0009035:	83 c4 10             	add    $0x10,%esp
c0009038:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000903b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000903e:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009041:	eb 51                	jmp    c0009094 <vsprintf+0x192>
c0009043:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009046:	8b 00                	mov    (%eax),%eax
c0009048:	83 ec 08             	sub    $0x8,%esp
c000904b:	50                   	push   %eax
c000904c:	ff 75 f4             	pushl  -0xc(%ebp)
c000904f:	e8 1d 23 00 00       	call   c000b371 <Strcpy>
c0009054:	83 c4 10             	add    $0x10,%esp
c0009057:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000905a:	8b 00                	mov    (%eax),%eax
c000905c:	83 ec 0c             	sub    $0xc,%esp
c000905f:	50                   	push   %eax
c0009060:	e8 26 23 00 00       	call   c000b38b <Strlen>
c0009065:	83 c4 10             	add    $0x10,%esp
c0009068:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000906b:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000906f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009072:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009075:	eb 1d                	jmp    c0009094 <vsprintf+0x192>
c0009077:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000907a:	0f b6 10             	movzbl (%eax),%edx
c000907d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009080:	88 10                	mov    %dl,(%eax)
c0009082:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009086:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000908d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009090:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009093:	90                   	nop
c0009094:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009098:	8b 45 0c             	mov    0xc(%ebp),%eax
c000909b:	0f b6 00             	movzbl (%eax),%eax
c000909e:	84 c0                	test   %al,%al
c00090a0:	0f 85 9f fe ff ff    	jne    c0008f45 <vsprintf+0x43>
c00090a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00090a9:	2b 45 08             	sub    0x8(%ebp),%eax
c00090ac:	c9                   	leave  
c00090ad:	c3                   	ret    

c00090ae <printx>:
c00090ae:	55                   	push   %ebp
c00090af:	89 e5                	mov    %esp,%ebp
c00090b1:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00090b7:	8d 45 0c             	lea    0xc(%ebp),%eax
c00090ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00090bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00090c0:	83 ec 04             	sub    $0x4,%esp
c00090c3:	ff 75 f4             	pushl  -0xc(%ebp)
c00090c6:	50                   	push   %eax
c00090c7:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00090cd:	50                   	push   %eax
c00090ce:	e8 2f fe ff ff       	call   c0008f02 <vsprintf>
c00090d3:	83 c4 10             	add    $0x10,%esp
c00090d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00090d9:	83 ec 08             	sub    $0x8,%esp
c00090dc:	ff 75 f0             	pushl  -0x10(%ebp)
c00090df:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00090e5:	50                   	push   %eax
c00090e6:	e8 fd 96 ff ff       	call   c00027e8 <write_debug>
c00090eb:	83 c4 10             	add    $0x10,%esp
c00090ee:	90                   	nop
c00090ef:	c9                   	leave  
c00090f0:	c3                   	ret    

c00090f1 <sys_printx>:
c00090f1:	55                   	push   %ebp
c00090f2:	89 e5                	mov    %esp,%ebp
c00090f4:	83 ec 28             	sub    $0x28,%esp
c00090f7:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c00090fc:	85 c0                	test   %eax,%eax
c00090fe:	75 23                	jne    c0009123 <sys_printx+0x32>
c0009100:	8b 45 10             	mov    0x10(%ebp),%eax
c0009103:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c0009109:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000910c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000910f:	83 ec 08             	sub    $0x8,%esp
c0009112:	ff 75 10             	pushl  0x10(%ebp)
c0009115:	50                   	push   %eax
c0009116:	e8 31 ba ff ff       	call   c0004b4c <Seg2PhyAddrLDT>
c000911b:	83 c4 10             	add    $0x10,%esp
c000911e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009121:	eb 19                	jmp    c000913c <sys_printx+0x4b>
c0009123:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0009128:	85 c0                	test   %eax,%eax
c000912a:	74 10                	je     c000913c <sys_printx+0x4b>
c000912c:	83 ec 0c             	sub    $0xc,%esp
c000912f:	6a 30                	push   $0x30
c0009131:	e8 d5 b9 ff ff       	call   c0004b0b <Seg2PhyAddr>
c0009136:	83 c4 10             	add    $0x10,%esp
c0009139:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000913c:	8b 55 08             	mov    0x8(%ebp),%edx
c000913f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009142:	01 d0                	add    %edx,%eax
c0009144:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009147:	8b 45 10             	mov    0x10(%ebp),%eax
c000914a:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0009150:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009156:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c000915b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000915e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009161:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009164:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009167:	0f b6 00             	movzbl (%eax),%eax
c000916a:	88 45 e3             	mov    %al,-0x1d(%ebp)
c000916d:	eb 3a                	jmp    c00091a9 <sys_printx+0xb8>
c000916f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009172:	0f b6 00             	movzbl (%eax),%eax
c0009175:	3c 3b                	cmp    $0x3b,%al
c0009177:	74 0a                	je     c0009183 <sys_printx+0x92>
c0009179:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000917c:	0f b6 00             	movzbl (%eax),%eax
c000917f:	3c 3a                	cmp    $0x3a,%al
c0009181:	75 06                	jne    c0009189 <sys_printx+0x98>
c0009183:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009187:	eb 20                	jmp    c00091a9 <sys_printx+0xb8>
c0009189:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000918c:	0f b6 00             	movzbl (%eax),%eax
c000918f:	0f b6 c0             	movzbl %al,%eax
c0009192:	83 ec 08             	sub    $0x8,%esp
c0009195:	50                   	push   %eax
c0009196:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009199:	e8 aa be ff ff       	call   c0005048 <out_char>
c000919e:	83 c4 10             	add    $0x10,%esp
c00091a1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00091a5:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00091a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00091ad:	7f c0                	jg     c000916f <sys_printx+0x7e>
c00091af:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c00091b3:	75 10                	jne    c00091c5 <sys_printx+0xd4>
c00091b5:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c00091ba:	85 c0                	test   %eax,%eax
c00091bc:	74 13                	je     c00091d1 <sys_printx+0xe0>
c00091be:	e8 ed 85 ff ff       	call   c00017b0 <disable_int>
c00091c3:	eb 0c                	jmp    c00091d1 <sys_printx+0xe0>
c00091c5:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c00091c9:	75 06                	jne    c00091d1 <sys_printx+0xe0>
c00091cb:	e8 e0 85 ff ff       	call   c00017b0 <disable_int>
c00091d0:	90                   	nop
c00091d1:	90                   	nop
c00091d2:	c9                   	leave  
c00091d3:	c3                   	ret    

c00091d4 <spin>:
c00091d4:	55                   	push   %ebp
c00091d5:	89 e5                	mov    %esp,%ebp
c00091d7:	83 ec 08             	sub    $0x8,%esp
c00091da:	83 ec 0c             	sub    $0xc,%esp
c00091dd:	ff 75 08             	pushl  0x8(%ebp)
c00091e0:	e8 a7 83 ff ff       	call   c000158c <disp_str>
c00091e5:	83 c4 10             	add    $0x10,%esp
c00091e8:	83 ec 0c             	sub    $0xc,%esp
c00091eb:	68 34 ac 00 c0       	push   $0xc000ac34
c00091f0:	e8 97 83 ff ff       	call   c000158c <disp_str>
c00091f5:	83 c4 10             	add    $0x10,%esp
c00091f8:	eb fe                	jmp    c00091f8 <spin+0x24>

c00091fa <panic>:
c00091fa:	55                   	push   %ebp
c00091fb:	89 e5                	mov    %esp,%ebp
c00091fd:	83 ec 08             	sub    $0x8,%esp
c0009200:	83 ec 04             	sub    $0x4,%esp
c0009203:	ff 75 08             	pushl  0x8(%ebp)
c0009206:	6a 3a                	push   $0x3a
c0009208:	68 d0 b0 00 c0       	push   $0xc000b0d0
c000920d:	e8 9c fe ff ff       	call   c00090ae <printx>
c0009212:	83 c4 10             	add    $0x10,%esp
c0009215:	90                   	nop
c0009216:	c9                   	leave  
c0009217:	c3                   	ret    

c0009218 <assertion_failure>:
c0009218:	55                   	push   %ebp
c0009219:	89 e5                	mov    %esp,%ebp
c000921b:	83 ec 08             	sub    $0x8,%esp
c000921e:	83 ec 08             	sub    $0x8,%esp
c0009221:	ff 75 14             	pushl  0x14(%ebp)
c0009224:	ff 75 10             	pushl  0x10(%ebp)
c0009227:	ff 75 0c             	pushl  0xc(%ebp)
c000922a:	ff 75 08             	pushl  0x8(%ebp)
c000922d:	6a 3b                	push   $0x3b
c000922f:	68 d8 b0 00 c0       	push   $0xc000b0d8
c0009234:	e8 75 fe ff ff       	call   c00090ae <printx>
c0009239:	83 c4 20             	add    $0x20,%esp
c000923c:	83 ec 0c             	sub    $0xc,%esp
c000923f:	68 0b b1 00 c0       	push   $0xc000b10b
c0009244:	e8 8b ff ff ff       	call   c00091d4 <spin>
c0009249:	83 c4 10             	add    $0x10,%esp
c000924c:	90                   	nop
c000924d:	c9                   	leave  
c000924e:	c3                   	ret    

c000924f <dead_lock>:
c000924f:	55                   	push   %ebp
c0009250:	89 e5                	mov    %esp,%ebp
c0009252:	b8 00 00 00 00       	mov    $0x0,%eax
c0009257:	5d                   	pop    %ebp
c0009258:	c3                   	ret    

c0009259 <sys_send_msg>:
c0009259:	55                   	push   %ebp
c000925a:	89 e5                	mov    %esp,%ebp
c000925c:	83 ec 48             	sub    $0x48,%esp
c000925f:	83 ec 0c             	sub    $0xc,%esp
c0009262:	ff 75 0c             	pushl  0xc(%ebp)
c0009265:	e8 ad b7 ff ff       	call   c0004a17 <pid2proc>
c000926a:	83 c4 10             	add    $0x10,%esp
c000926d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009270:	83 ec 0c             	sub    $0xc,%esp
c0009273:	ff 75 10             	pushl  0x10(%ebp)
c0009276:	e8 0c b8 ff ff       	call   c0004a87 <proc2pid>
c000927b:	83 c4 10             	add    $0x10,%esp
c000927e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009281:	8b 45 10             	mov    0x10(%ebp),%eax
c0009284:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c000928a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000928d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0009294:	8b 45 08             	mov    0x8(%ebp),%eax
c0009297:	83 ec 08             	sub    $0x8,%esp
c000929a:	6a 6c                	push   $0x6c
c000929c:	50                   	push   %eax
c000929d:	e8 e6 da ff ff       	call   c0006d88 <alloc_virtual_memory>
c00092a2:	83 c4 10             	add    $0x10,%esp
c00092a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00092a8:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c00092af:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00092b2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00092b5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00092b8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00092bb:	89 10                	mov    %edx,(%eax)
c00092bd:	83 ec 08             	sub    $0x8,%esp
c00092c0:	ff 75 0c             	pushl  0xc(%ebp)
c00092c3:	ff 75 e8             	pushl  -0x18(%ebp)
c00092c6:	e8 84 ff ff ff       	call   c000924f <dead_lock>
c00092cb:	83 c4 10             	add    $0x10,%esp
c00092ce:	83 f8 01             	cmp    $0x1,%eax
c00092d1:	75 10                	jne    c00092e3 <sys_send_msg+0x8a>
c00092d3:	83 ec 0c             	sub    $0xc,%esp
c00092d6:	68 17 b1 00 c0       	push   $0xc000b117
c00092db:	e8 1a ff ff ff       	call   c00091fa <panic>
c00092e0:	83 c4 10             	add    $0x10,%esp
c00092e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092e6:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00092ed:	3c 02                	cmp    $0x2,%al
c00092ef:	0f 85 8a 01 00 00    	jne    c000947f <sys_send_msg+0x226>
c00092f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092f8:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00092fe:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0009301:	74 12                	je     c0009315 <sys_send_msg+0xbc>
c0009303:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009306:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000930c:	83 f8 0e             	cmp    $0xe,%eax
c000930f:	0f 85 6a 01 00 00    	jne    c000947f <sys_send_msg+0x226>
c0009315:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009318:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c000931e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009321:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009324:	83 ec 08             	sub    $0x8,%esp
c0009327:	ff 75 ec             	pushl  -0x14(%ebp)
c000932a:	50                   	push   %eax
c000932b:	e8 1c b8 ff ff       	call   c0004b4c <Seg2PhyAddrLDT>
c0009330:	83 c4 10             	add    $0x10,%esp
c0009333:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009336:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009339:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c000933f:	83 ec 08             	sub    $0x8,%esp
c0009342:	6a 6c                	push   $0x6c
c0009344:	50                   	push   %eax
c0009345:	e8 3e da ff ff       	call   c0006d88 <alloc_virtual_memory>
c000934a:	83 c4 10             	add    $0x10,%esp
c000934d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009350:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009353:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0009356:	83 ec 04             	sub    $0x4,%esp
c0009359:	ff 75 d8             	pushl  -0x28(%ebp)
c000935c:	52                   	push   %edx
c000935d:	50                   	push   %eax
c000935e:	e8 c1 1f 00 00       	call   c000b324 <Memcpy>
c0009363:	83 c4 10             	add    $0x10,%esp
c0009366:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009369:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c0009370:	00 00 00 
c0009373:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009376:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c000937d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009380:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009387:	00 00 00 
c000938a:	8b 45 10             	mov    0x10(%ebp),%eax
c000938d:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0009394:	00 00 00 
c0009397:	83 ec 0c             	sub    $0xc,%esp
c000939a:	ff 75 ec             	pushl  -0x14(%ebp)
c000939d:	e8 f9 07 00 00       	call   c0009b9b <unblock>
c00093a2:	83 c4 10             	add    $0x10,%esp
c00093a5:	8b 45 10             	mov    0x10(%ebp),%eax
c00093a8:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00093af:	84 c0                	test   %al,%al
c00093b1:	74 1c                	je     c00093cf <sys_send_msg+0x176>
c00093b3:	68 89 05 00 00       	push   $0x589
c00093b8:	68 22 b1 00 c0       	push   $0xc000b122
c00093bd:	68 22 b1 00 c0       	push   $0xc000b122
c00093c2:	68 32 b1 00 c0       	push   $0xc000b132
c00093c7:	e8 4c fe ff ff       	call   c0009218 <assertion_failure>
c00093cc:	83 c4 10             	add    $0x10,%esp
c00093cf:	8b 45 10             	mov    0x10(%ebp),%eax
c00093d2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00093d8:	83 f8 1d             	cmp    $0x1d,%eax
c00093db:	74 1c                	je     c00093f9 <sys_send_msg+0x1a0>
c00093dd:	68 8a 05 00 00       	push   $0x58a
c00093e2:	68 22 b1 00 c0       	push   $0xc000b122
c00093e7:	68 22 b1 00 c0       	push   $0xc000b122
c00093ec:	68 46 b1 00 c0       	push   $0xc000b146
c00093f1:	e8 22 fe ff ff       	call   c0009218 <assertion_failure>
c00093f6:	83 c4 10             	add    $0x10,%esp
c00093f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093fc:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009402:	85 c0                	test   %eax,%eax
c0009404:	74 1c                	je     c0009422 <sys_send_msg+0x1c9>
c0009406:	68 8c 05 00 00       	push   $0x58c
c000940b:	68 22 b1 00 c0       	push   $0xc000b122
c0009410:	68 22 b1 00 c0       	push   $0xc000b122
c0009415:	68 63 b1 00 c0       	push   $0xc000b163
c000941a:	e8 f9 fd ff ff       	call   c0009218 <assertion_failure>
c000941f:	83 c4 10             	add    $0x10,%esp
c0009422:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009425:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000942c:	84 c0                	test   %al,%al
c000942e:	74 1c                	je     c000944c <sys_send_msg+0x1f3>
c0009430:	68 8d 05 00 00       	push   $0x58d
c0009435:	68 22 b1 00 c0       	push   $0xc000b122
c000943a:	68 22 b1 00 c0       	push   $0xc000b122
c000943f:	68 78 b1 00 c0       	push   $0xc000b178
c0009444:	e8 cf fd ff ff       	call   c0009218 <assertion_failure>
c0009449:	83 c4 10             	add    $0x10,%esp
c000944c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000944f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009455:	83 f8 1d             	cmp    $0x1d,%eax
c0009458:	0f 84 45 01 00 00    	je     c00095a3 <sys_send_msg+0x34a>
c000945e:	68 8e 05 00 00       	push   $0x58e
c0009463:	68 22 b1 00 c0       	push   $0xc000b122
c0009468:	68 22 b1 00 c0       	push   $0xc000b122
c000946d:	68 90 b1 00 c0       	push   $0xc000b190
c0009472:	e8 a1 fd ff ff       	call   c0009218 <assertion_failure>
c0009477:	83 c4 10             	add    $0x10,%esp
c000947a:	e9 24 01 00 00       	jmp    c00095a3 <sys_send_msg+0x34a>
c000947f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009486:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009489:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000948c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000948f:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009495:	85 c0                	test   %eax,%eax
c0009497:	75 1b                	jne    c00094b4 <sys_send_msg+0x25b>
c0009499:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000949c:	8b 55 10             	mov    0x10(%ebp),%edx
c000949f:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c00094a5:	8b 45 10             	mov    0x10(%ebp),%eax
c00094a8:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00094af:	00 00 00 
c00094b2:	eb 3f                	jmp    c00094f3 <sys_send_msg+0x29a>
c00094b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094b7:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00094bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00094c0:	eb 12                	jmp    c00094d4 <sys_send_msg+0x27b>
c00094c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00094c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094cb:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00094d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00094d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00094d8:	75 e8                	jne    c00094c2 <sys_send_msg+0x269>
c00094da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00094dd:	8b 55 10             	mov    0x10(%ebp),%edx
c00094e0:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c00094e6:	8b 45 10             	mov    0x10(%ebp),%eax
c00094e9:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00094f0:	00 00 00 
c00094f3:	8b 45 10             	mov    0x10(%ebp),%eax
c00094f6:	8b 55 08             	mov    0x8(%ebp),%edx
c00094f9:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c00094ff:	8b 45 10             	mov    0x10(%ebp),%eax
c0009502:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009505:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c000950b:	8b 45 10             	mov    0x10(%ebp),%eax
c000950e:	c6 80 44 02 00 00 01 	movb   $0x1,0x244(%eax)
c0009515:	8b 45 10             	mov    0x10(%ebp),%eax
c0009518:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000951f:	3c 01                	cmp    $0x1,%al
c0009521:	74 1c                	je     c000953f <sys_send_msg+0x2e6>
c0009523:	68 af 05 00 00       	push   $0x5af
c0009528:	68 22 b1 00 c0       	push   $0xc000b122
c000952d:	68 22 b1 00 c0       	push   $0xc000b122
c0009532:	68 b4 b1 00 c0       	push   $0xc000b1b4
c0009537:	e8 dc fc ff ff       	call   c0009218 <assertion_failure>
c000953c:	83 c4 10             	add    $0x10,%esp
c000953f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009542:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009548:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000954b:	74 1c                	je     c0009569 <sys_send_msg+0x310>
c000954d:	68 b0 05 00 00       	push   $0x5b0
c0009552:	68 22 b1 00 c0       	push   $0xc000b122
c0009557:	68 22 b1 00 c0       	push   $0xc000b122
c000955c:	68 d0 b1 00 c0       	push   $0xc000b1d0
c0009561:	e8 b2 fc ff ff       	call   c0009218 <assertion_failure>
c0009566:	83 c4 10             	add    $0x10,%esp
c0009569:	8b 45 10             	mov    0x10(%ebp),%eax
c000956c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009572:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009575:	74 1c                	je     c0009593 <sys_send_msg+0x33a>
c0009577:	68 b1 05 00 00       	push   $0x5b1
c000957c:	68 22 b1 00 c0       	push   $0xc000b122
c0009581:	68 22 b1 00 c0       	push   $0xc000b122
c0009586:	68 f2 b1 00 c0       	push   $0xc000b1f2
c000958b:	e8 88 fc ff ff       	call   c0009218 <assertion_failure>
c0009590:	83 c4 10             	add    $0x10,%esp
c0009593:	83 ec 0c             	sub    $0xc,%esp
c0009596:	ff 75 10             	pushl  0x10(%ebp)
c0009599:	e8 c1 05 00 00       	call   c0009b5f <block>
c000959e:	83 c4 10             	add    $0x10,%esp
c00095a1:	eb 01                	jmp    c00095a4 <sys_send_msg+0x34b>
c00095a3:	90                   	nop
c00095a4:	b8 00 00 00 00       	mov    $0x0,%eax
c00095a9:	c9                   	leave  
c00095aa:	c3                   	ret    

c00095ab <sys_receive_msg>:
c00095ab:	55                   	push   %ebp
c00095ac:	89 e5                	mov    %esp,%ebp
c00095ae:	83 ec 48             	sub    $0x48,%esp
c00095b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00095b8:	83 ec 0c             	sub    $0xc,%esp
c00095bb:	ff 75 0c             	pushl  0xc(%ebp)
c00095be:	e8 54 b4 ff ff       	call   c0004a17 <pid2proc>
c00095c3:	83 c4 10             	add    $0x10,%esp
c00095c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00095c9:	83 ec 0c             	sub    $0xc,%esp
c00095cc:	ff 75 10             	pushl  0x10(%ebp)
c00095cf:	e8 b3 b4 ff ff       	call   c0004a87 <proc2pid>
c00095d4:	83 c4 10             	add    $0x10,%esp
c00095d7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00095da:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00095e1:	8b 45 10             	mov    0x10(%ebp),%eax
c00095e4:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c00095ea:	85 c0                	test   %eax,%eax
c00095ec:	0f 84 c7 00 00 00    	je     c00096b9 <sys_receive_msg+0x10e>
c00095f2:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c00095f6:	74 0d                	je     c0009605 <sys_receive_msg+0x5a>
c00095f8:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c00095ff:	0f 85 b4 00 00 00    	jne    c00096b9 <sys_receive_msg+0x10e>
c0009605:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c000960c:	83 ec 0c             	sub    $0xc,%esp
c000960f:	ff 75 dc             	pushl  -0x24(%ebp)
c0009612:	e8 b2 d8 ff ff       	call   c0006ec9 <sys_malloc>
c0009617:	83 c4 10             	add    $0x10,%esp
c000961a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000961d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009620:	83 ec 04             	sub    $0x4,%esp
c0009623:	50                   	push   %eax
c0009624:	6a 00                	push   $0x0
c0009626:	ff 75 d8             	pushl  -0x28(%ebp)
c0009629:	e8 24 1d 00 00       	call   c000b352 <Memset>
c000962e:	83 c4 10             	add    $0x10,%esp
c0009631:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009634:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000963a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000963d:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009644:	8b 45 08             	mov    0x8(%ebp),%eax
c0009647:	83 ec 08             	sub    $0x8,%esp
c000964a:	ff 75 dc             	pushl  -0x24(%ebp)
c000964d:	50                   	push   %eax
c000964e:	e8 35 d7 ff ff       	call   c0006d88 <alloc_virtual_memory>
c0009653:	83 c4 10             	add    $0x10,%esp
c0009656:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009659:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000965c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000965f:	83 ec 04             	sub    $0x4,%esp
c0009662:	52                   	push   %edx
c0009663:	ff 75 d8             	pushl  -0x28(%ebp)
c0009666:	50                   	push   %eax
c0009667:	e8 b8 1c 00 00       	call   c000b324 <Memcpy>
c000966c:	83 c4 10             	add    $0x10,%esp
c000966f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009672:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009679:	00 00 00 
c000967c:	8b 45 10             	mov    0x10(%ebp),%eax
c000967f:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009686:	00 00 00 
c0009689:	8b 45 10             	mov    0x10(%ebp),%eax
c000968c:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0009693:	00 00 00 
c0009696:	8b 45 10             	mov    0x10(%ebp),%eax
c0009699:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00096a0:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c00096a7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00096aa:	83 ec 08             	sub    $0x8,%esp
c00096ad:	ff 75 dc             	pushl  -0x24(%ebp)
c00096b0:	50                   	push   %eax
c00096b1:	e8 f2 da ff ff       	call   c00071a8 <sys_free>
c00096b6:	83 c4 10             	add    $0x10,%esp
c00096b9:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c00096bd:	0f 84 96 03 00 00    	je     c0009a59 <sys_receive_msg+0x4ae>
c00096c3:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c00096c7:	75 26                	jne    c00096ef <sys_receive_msg+0x144>
c00096c9:	8b 45 10             	mov    0x10(%ebp),%eax
c00096cc:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00096d2:	85 c0                	test   %eax,%eax
c00096d4:	0f 84 8a 00 00 00    	je     c0009764 <sys_receive_msg+0x1b9>
c00096da:	8b 45 10             	mov    0x10(%ebp),%eax
c00096dd:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00096e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00096e6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00096ed:	eb 75                	jmp    c0009764 <sys_receive_msg+0x1b9>
c00096ef:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00096f3:	78 6f                	js     c0009764 <sys_receive_msg+0x1b9>
c00096f5:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
c00096f9:	7f 69                	jg     c0009764 <sys_receive_msg+0x1b9>
c00096fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00096fe:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009705:	3c 01                	cmp    $0x1,%al
c0009707:	75 5b                	jne    c0009764 <sys_receive_msg+0x1b9>
c0009709:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000970c:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009712:	83 f8 0e             	cmp    $0xe,%eax
c0009715:	74 0e                	je     c0009725 <sys_receive_msg+0x17a>
c0009717:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000971a:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009720:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009723:	75 3f                	jne    c0009764 <sys_receive_msg+0x1b9>
c0009725:	8b 45 10             	mov    0x10(%ebp),%eax
c0009728:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000972e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009731:	eb 2b                	jmp    c000975e <sys_receive_msg+0x1b3>
c0009733:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009736:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009739:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000973c:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c0009742:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009745:	39 c2                	cmp    %eax,%edx
c0009747:	75 09                	jne    c0009752 <sys_receive_msg+0x1a7>
c0009749:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009750:	eb 12                	jmp    c0009764 <sys_receive_msg+0x1b9>
c0009752:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009755:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000975b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000975e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009762:	75 cf                	jne    c0009733 <sys_receive_msg+0x188>
c0009764:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009768:	0f 85 21 02 00 00    	jne    c000998f <sys_receive_msg+0x3e4>
c000976e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009771:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009774:	8b 45 08             	mov    0x8(%ebp),%eax
c0009777:	83 ec 08             	sub    $0x8,%esp
c000977a:	6a 6c                	push   $0x6c
c000977c:	50                   	push   %eax
c000977d:	e8 06 d6 ff ff       	call   c0006d88 <alloc_virtual_memory>
c0009782:	83 c4 10             	add    $0x10,%esp
c0009785:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009788:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000978b:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009791:	83 ec 08             	sub    $0x8,%esp
c0009794:	6a 6c                	push   $0x6c
c0009796:	50                   	push   %eax
c0009797:	e8 ec d5 ff ff       	call   c0006d88 <alloc_virtual_memory>
c000979c:	83 c4 10             	add    $0x10,%esp
c000979f:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00097a2:	83 ec 04             	sub    $0x4,%esp
c00097a5:	6a 6c                	push   $0x6c
c00097a7:	ff 75 c8             	pushl  -0x38(%ebp)
c00097aa:	ff 75 cc             	pushl  -0x34(%ebp)
c00097ad:	e8 72 1b 00 00       	call   c000b324 <Memcpy>
c00097b2:	83 c4 10             	add    $0x10,%esp
c00097b5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00097b8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00097bb:	8b 45 10             	mov    0x10(%ebp),%eax
c00097be:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00097c4:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00097c7:	75 21                	jne    c00097ea <sys_receive_msg+0x23f>
c00097c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097cc:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c00097d2:	8b 45 10             	mov    0x10(%ebp),%eax
c00097d5:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c00097db:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097de:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00097e5:	00 00 00 
c00097e8:	eb 1f                	jmp    c0009809 <sys_receive_msg+0x25e>
c00097ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097ed:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c00097f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00097f6:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c00097fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097ff:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0009806:	00 00 00 
c0009809:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000980c:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c0009813:	00 00 00 
c0009816:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009819:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0009820:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009823:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c000982a:	00 00 00 
c000982d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009830:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c0009837:	00 00 00 
c000983a:	8b 45 10             	mov    0x10(%ebp),%eax
c000983d:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009844:	00 00 00 
c0009847:	8b 45 10             	mov    0x10(%ebp),%eax
c000984a:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0009851:	00 00 00 
c0009854:	83 ec 0c             	sub    $0xc,%esp
c0009857:	ff 75 d0             	pushl  -0x30(%ebp)
c000985a:	e8 3c 03 00 00       	call   c0009b9b <unblock>
c000985f:	83 c4 10             	add    $0x10,%esp
c0009862:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009865:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c000986b:	85 c0                	test   %eax,%eax
c000986d:	74 1c                	je     c000988b <sys_receive_msg+0x2e0>
c000986f:	68 28 06 00 00       	push   $0x628
c0009874:	68 22 b1 00 c0       	push   $0xc000b122
c0009879:	68 22 b1 00 c0       	push   $0xc000b122
c000987e:	68 07 b2 00 c0       	push   $0xc000b207
c0009883:	e8 90 f9 ff ff       	call   c0009218 <assertion_failure>
c0009888:	83 c4 10             	add    $0x10,%esp
c000988b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000988e:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009895:	84 c0                	test   %al,%al
c0009897:	74 1c                	je     c00098b5 <sys_receive_msg+0x30a>
c0009899:	68 29 06 00 00       	push   $0x629
c000989e:	68 22 b1 00 c0       	push   $0xc000b122
c00098a3:	68 22 b1 00 c0       	push   $0xc000b122
c00098a8:	68 1f b2 00 c0       	push   $0xc000b21f
c00098ad:	e8 66 f9 ff ff       	call   c0009218 <assertion_failure>
c00098b2:	83 c4 10             	add    $0x10,%esp
c00098b5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00098b8:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00098be:	83 f8 1d             	cmp    $0x1d,%eax
c00098c1:	74 1c                	je     c00098df <sys_receive_msg+0x334>
c00098c3:	68 2a 06 00 00       	push   $0x62a
c00098c8:	68 22 b1 00 c0       	push   $0xc000b122
c00098cd:	68 22 b1 00 c0       	push   $0xc000b122
c00098d2:	68 38 b2 00 c0       	push   $0xc000b238
c00098d7:	e8 3c f9 ff ff       	call   c0009218 <assertion_failure>
c00098dc:	83 c4 10             	add    $0x10,%esp
c00098df:	8b 45 10             	mov    0x10(%ebp),%eax
c00098e2:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00098e8:	85 c0                	test   %eax,%eax
c00098ea:	74 1c                	je     c0009908 <sys_receive_msg+0x35d>
c00098ec:	68 2c 06 00 00       	push   $0x62c
c00098f1:	68 22 b1 00 c0       	push   $0xc000b122
c00098f6:	68 22 b1 00 c0       	push   $0xc000b122
c00098fb:	68 63 b1 00 c0       	push   $0xc000b163
c0009900:	e8 13 f9 ff ff       	call   c0009218 <assertion_failure>
c0009905:	83 c4 10             	add    $0x10,%esp
c0009908:	8b 45 10             	mov    0x10(%ebp),%eax
c000990b:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009912:	84 c0                	test   %al,%al
c0009914:	74 1c                	je     c0009932 <sys_receive_msg+0x387>
c0009916:	68 2d 06 00 00       	push   $0x62d
c000991b:	68 22 b1 00 c0       	push   $0xc000b122
c0009920:	68 22 b1 00 c0       	push   $0xc000b122
c0009925:	68 78 b1 00 c0       	push   $0xc000b178
c000992a:	e8 e9 f8 ff ff       	call   c0009218 <assertion_failure>
c000992f:	83 c4 10             	add    $0x10,%esp
c0009932:	8b 45 10             	mov    0x10(%ebp),%eax
c0009935:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000993b:	83 f8 1d             	cmp    $0x1d,%eax
c000993e:	74 1c                	je     c000995c <sys_receive_msg+0x3b1>
c0009940:	68 2e 06 00 00       	push   $0x62e
c0009945:	68 22 b1 00 c0       	push   $0xc000b122
c000994a:	68 22 b1 00 c0       	push   $0xc000b122
c000994f:	68 90 b1 00 c0       	push   $0xc000b190
c0009954:	e8 bf f8 ff ff       	call   c0009218 <assertion_failure>
c0009959:	83 c4 10             	add    $0x10,%esp
c000995c:	8b 45 10             	mov    0x10(%ebp),%eax
c000995f:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009965:	83 f8 1d             	cmp    $0x1d,%eax
c0009968:	0f 84 e4 00 00 00    	je     c0009a52 <sys_receive_msg+0x4a7>
c000996e:	68 2f 06 00 00       	push   $0x62f
c0009973:	68 22 b1 00 c0       	push   $0xc000b122
c0009978:	68 22 b1 00 c0       	push   $0xc000b122
c000997d:	68 5c b2 00 c0       	push   $0xc000b25c
c0009982:	e8 91 f8 ff ff       	call   c0009218 <assertion_failure>
c0009987:	83 c4 10             	add    $0x10,%esp
c000998a:	e9 c3 00 00 00       	jmp    c0009a52 <sys_receive_msg+0x4a7>
c000998f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009992:	c6 80 44 02 00 00 02 	movb   $0x2,0x244(%eax)
c0009999:	8b 45 10             	mov    0x10(%ebp),%eax
c000999c:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00099a3:	3c 02                	cmp    $0x2,%al
c00099a5:	74 1c                	je     c00099c3 <sys_receive_msg+0x418>
c00099a7:	68 34 06 00 00       	push   $0x634
c00099ac:	68 22 b1 00 c0       	push   $0xc000b122
c00099b1:	68 22 b1 00 c0       	push   $0xc000b122
c00099b6:	68 7b b2 00 c0       	push   $0xc000b27b
c00099bb:	e8 58 f8 ff ff       	call   c0009218 <assertion_failure>
c00099c0:	83 c4 10             	add    $0x10,%esp
c00099c3:	8b 45 10             	mov    0x10(%ebp),%eax
c00099c6:	8b 55 08             	mov    0x8(%ebp),%edx
c00099c9:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c00099cf:	8b 45 10             	mov    0x10(%ebp),%eax
c00099d2:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00099d9:	3c 02                	cmp    $0x2,%al
c00099db:	74 1c                	je     c00099f9 <sys_receive_msg+0x44e>
c00099dd:	68 36 06 00 00       	push   $0x636
c00099e2:	68 22 b1 00 c0       	push   $0xc000b122
c00099e7:	68 22 b1 00 c0       	push   $0xc000b122
c00099ec:	68 7b b2 00 c0       	push   $0xc000b27b
c00099f1:	e8 22 f8 ff ff       	call   c0009218 <assertion_failure>
c00099f6:	83 c4 10             	add    $0x10,%esp
c00099f9:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c00099fd:	75 0f                	jne    c0009a0e <sys_receive_msg+0x463>
c00099ff:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a02:	c7 80 50 02 00 00 0e 	movl   $0xe,0x250(%eax)
c0009a09:	00 00 00 
c0009a0c:	eb 0c                	jmp    c0009a1a <sys_receive_msg+0x46f>
c0009a0e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a11:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009a14:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009a1a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a1d:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009a24:	3c 02                	cmp    $0x2,%al
c0009a26:	74 1c                	je     c0009a44 <sys_receive_msg+0x499>
c0009a28:	68 41 06 00 00       	push   $0x641
c0009a2d:	68 22 b1 00 c0       	push   $0xc000b122
c0009a32:	68 22 b1 00 c0       	push   $0xc000b122
c0009a37:	68 7b b2 00 c0       	push   $0xc000b27b
c0009a3c:	e8 d7 f7 ff ff       	call   c0009218 <assertion_failure>
c0009a41:	83 c4 10             	add    $0x10,%esp
c0009a44:	83 ec 0c             	sub    $0xc,%esp
c0009a47:	ff 75 10             	pushl  0x10(%ebp)
c0009a4a:	e8 10 01 00 00       	call   c0009b5f <block>
c0009a4f:	83 c4 10             	add    $0x10,%esp
c0009a52:	b8 00 00 00 00       	mov    $0x0,%eax
c0009a57:	eb 02                	jmp    c0009a5b <sys_receive_msg+0x4b0>
c0009a59:	90                   	nop
c0009a5a:	90                   	nop
c0009a5b:	c9                   	leave  
c0009a5c:	c3                   	ret    

c0009a5d <disp_str_colour_debug>:
c0009a5d:	55                   	push   %ebp
c0009a5e:	89 e5                	mov    %esp,%ebp
c0009a60:	90                   	nop
c0009a61:	5d                   	pop    %ebp
c0009a62:	c3                   	ret    

c0009a63 <send_rec>:
c0009a63:	55                   	push   %ebp
c0009a64:	89 e5                	mov    %esp,%ebp
c0009a66:	83 ec 18             	sub    $0x18,%esp
c0009a69:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009a6c:	83 ec 0c             	sub    $0xc,%esp
c0009a6f:	50                   	push   %eax
c0009a70:	e8 80 d3 ff ff       	call   c0006df5 <get_physical_address>
c0009a75:	83 c4 10             	add    $0x10,%esp
c0009a78:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009a7b:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009a7f:	74 28                	je     c0009aa9 <send_rec+0x46>
c0009a81:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009a85:	74 22                	je     c0009aa9 <send_rec+0x46>
c0009a87:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009a8b:	74 1c                	je     c0009aa9 <send_rec+0x46>
c0009a8d:	68 5f 06 00 00       	push   $0x65f
c0009a92:	68 22 b1 00 c0       	push   $0xc000b122
c0009a97:	68 22 b1 00 c0       	push   $0xc000b122
c0009a9c:	68 9c b2 00 c0       	push   $0xc000b29c
c0009aa1:	e8 72 f7 ff ff       	call   c0009218 <assertion_failure>
c0009aa6:	83 c4 10             	add    $0x10,%esp
c0009aa9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009aad:	75 12                	jne    c0009ac1 <send_rec+0x5e>
c0009aaf:	83 ec 04             	sub    $0x4,%esp
c0009ab2:	6a 6c                	push   $0x6c
c0009ab4:	6a 00                	push   $0x0
c0009ab6:	ff 75 0c             	pushl  0xc(%ebp)
c0009ab9:	e8 94 18 00 00       	call   c000b352 <Memset>
c0009abe:	83 c4 10             	add    $0x10,%esp
c0009ac1:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009ac5:	74 23                	je     c0009aea <send_rec+0x87>
c0009ac7:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009acb:	74 34                	je     c0009b01 <send_rec+0x9e>
c0009acd:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009ad1:	75 72                	jne    c0009b45 <send_rec+0xe2>
c0009ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ad6:	83 ec 08             	sub    $0x8,%esp
c0009ad9:	ff 75 10             	pushl  0x10(%ebp)
c0009adc:	50                   	push   %eax
c0009add:	e8 26 8d ff ff       	call   c0002808 <send_msg>
c0009ae2:	83 c4 10             	add    $0x10,%esp
c0009ae5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ae8:	eb 6e                	jmp    c0009b58 <send_rec+0xf5>
c0009aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009aed:	83 ec 08             	sub    $0x8,%esp
c0009af0:	ff 75 10             	pushl  0x10(%ebp)
c0009af3:	50                   	push   %eax
c0009af4:	e8 35 8d ff ff       	call   c000282e <receive_msg>
c0009af9:	83 c4 10             	add    $0x10,%esp
c0009afc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009aff:	eb 57                	jmp    c0009b58 <send_rec+0xf5>
c0009b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b04:	83 ec 08             	sub    $0x8,%esp
c0009b07:	ff 75 10             	pushl  0x10(%ebp)
c0009b0a:	50                   	push   %eax
c0009b0b:	e8 f8 8c ff ff       	call   c0002808 <send_msg>
c0009b10:	83 c4 10             	add    $0x10,%esp
c0009b13:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b16:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009b1a:	75 3b                	jne    c0009b57 <send_rec+0xf4>
c0009b1c:	83 ec 04             	sub    $0x4,%esp
c0009b1f:	6a 6c                	push   $0x6c
c0009b21:	6a 00                	push   $0x0
c0009b23:	ff 75 0c             	pushl  0xc(%ebp)
c0009b26:	e8 27 18 00 00       	call   c000b352 <Memset>
c0009b2b:	83 c4 10             	add    $0x10,%esp
c0009b2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b31:	83 ec 08             	sub    $0x8,%esp
c0009b34:	ff 75 10             	pushl  0x10(%ebp)
c0009b37:	50                   	push   %eax
c0009b38:	e8 f1 8c ff ff       	call   c000282e <receive_msg>
c0009b3d:	83 c4 10             	add    $0x10,%esp
c0009b40:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b43:	eb 12                	jmp    c0009b57 <send_rec+0xf4>
c0009b45:	83 ec 0c             	sub    $0xc,%esp
c0009b48:	68 d8 b2 00 c0       	push   $0xc000b2d8
c0009b4d:	e8 a8 f6 ff ff       	call   c00091fa <panic>
c0009b52:	83 c4 10             	add    $0x10,%esp
c0009b55:	eb 01                	jmp    c0009b58 <send_rec+0xf5>
c0009b57:	90                   	nop
c0009b58:	b8 00 00 00 00       	mov    $0x0,%eax
c0009b5d:	c9                   	leave  
c0009b5e:	c3                   	ret    

c0009b5f <block>:
c0009b5f:	55                   	push   %ebp
c0009b60:	89 e5                	mov    %esp,%ebp
c0009b62:	83 ec 08             	sub    $0x8,%esp
c0009b65:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b68:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009b6f:	84 c0                	test   %al,%al
c0009b71:	75 1c                	jne    c0009b8f <block+0x30>
c0009b73:	68 8e 06 00 00       	push   $0x68e
c0009b78:	68 22 b1 00 c0       	push   $0xc000b122
c0009b7d:	68 22 b1 00 c0       	push   $0xc000b122
c0009b82:	68 ed b2 00 c0       	push   $0xc000b2ed
c0009b87:	e8 8c f6 ff ff       	call   c0009218 <assertion_failure>
c0009b8c:	83 c4 10             	add    $0x10,%esp
c0009b8f:	e8 30 ad ff ff       	call   c00048c4 <schedule_process>
c0009b94:	b8 00 00 00 00       	mov    $0x0,%eax
c0009b99:	c9                   	leave  
c0009b9a:	c3                   	ret    

c0009b9b <unblock>:
c0009b9b:	55                   	push   %ebp
c0009b9c:	89 e5                	mov    %esp,%ebp
c0009b9e:	83 ec 08             	sub    $0x8,%esp
c0009ba1:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ba4:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009bab:	84 c0                	test   %al,%al
c0009bad:	74 1c                	je     c0009bcb <unblock+0x30>
c0009baf:	68 97 06 00 00       	push   $0x697
c0009bb4:	68 22 b1 00 c0       	push   $0xc000b122
c0009bb9:	68 22 b1 00 c0       	push   $0xc000b122
c0009bbe:	68 05 b3 00 c0       	push   $0xc000b305
c0009bc3:	e8 50 f6 ff ff       	call   c0009218 <assertion_failure>
c0009bc8:	83 c4 10             	add    $0x10,%esp
c0009bcb:	8b 45 08             	mov    0x8(%ebp),%eax
c0009bce:	05 fc 00 00 00       	add    $0xfc,%eax
c0009bd3:	83 ec 08             	sub    $0x8,%esp
c0009bd6:	50                   	push   %eax
c0009bd7:	68 8c fd 00 c0       	push   $0xc000fd8c
c0009bdc:	e8 38 09 00 00       	call   c000a519 <insertToDoubleLinkList>
c0009be1:	83 c4 10             	add    $0x10,%esp
c0009be4:	b8 00 00 00 00       	mov    $0x0,%eax
c0009be9:	c9                   	leave  
c0009bea:	c3                   	ret    

c0009beb <get_ticks_ipc>:
c0009beb:	55                   	push   %ebp
c0009bec:	89 e5                	mov    %esp,%ebp
c0009bee:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0009bf4:	83 ec 04             	sub    $0x4,%esp
c0009bf7:	6a 6c                	push   $0x6c
c0009bf9:	6a 00                	push   $0x0
c0009bfb:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009bfe:	50                   	push   %eax
c0009bff:	e8 4e 17 00 00       	call   c000b352 <Memset>
c0009c04:	83 c4 10             	add    $0x10,%esp
c0009c07:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c0009c0e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009c15:	83 ec 04             	sub    $0x4,%esp
c0009c18:	6a 01                	push   $0x1
c0009c1a:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009c1d:	50                   	push   %eax
c0009c1e:	6a 03                	push   $0x3
c0009c20:	e8 3e fe ff ff       	call   c0009a63 <send_rec>
c0009c25:	83 c4 10             	add    $0x10,%esp
c0009c28:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009c2b:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0009c2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c31:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c34:	c9                   	leave  
c0009c35:	c3                   	ret    

c0009c36 <itoa>:
c0009c36:	55                   	push   %ebp
c0009c37:	89 e5                	mov    %esp,%ebp
c0009c39:	53                   	push   %ebx
c0009c3a:	83 ec 14             	sub    $0x14,%esp
c0009c3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c40:	99                   	cltd   
c0009c41:	f7 7d 10             	idivl  0x10(%ebp)
c0009c44:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009c47:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c4a:	99                   	cltd   
c0009c4b:	f7 7d 10             	idivl  0x10(%ebp)
c0009c4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c51:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009c55:	74 14                	je     c0009c6b <itoa+0x35>
c0009c57:	83 ec 04             	sub    $0x4,%esp
c0009c5a:	ff 75 10             	pushl  0x10(%ebp)
c0009c5d:	ff 75 0c             	pushl  0xc(%ebp)
c0009c60:	ff 75 f0             	pushl  -0x10(%ebp)
c0009c63:	e8 ce ff ff ff       	call   c0009c36 <itoa>
c0009c68:	83 c4 10             	add    $0x10,%esp
c0009c6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c6e:	8d 58 30             	lea    0x30(%eax),%ebx
c0009c71:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009c74:	8b 00                	mov    (%eax),%eax
c0009c76:	8d 48 01             	lea    0x1(%eax),%ecx
c0009c79:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009c7c:	89 0a                	mov    %ecx,(%edx)
c0009c7e:	89 da                	mov    %ebx,%edx
c0009c80:	88 10                	mov    %dl,(%eax)
c0009c82:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009c85:	8b 00                	mov    (%eax),%eax
c0009c87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009c8a:	c9                   	leave  
c0009c8b:	c3                   	ret    

c0009c8c <i2a>:
c0009c8c:	55                   	push   %ebp
c0009c8d:	89 e5                	mov    %esp,%ebp
c0009c8f:	53                   	push   %ebx
c0009c90:	83 ec 14             	sub    $0x14,%esp
c0009c93:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c96:	99                   	cltd   
c0009c97:	f7 7d 0c             	idivl  0xc(%ebp)
c0009c9a:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009c9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ca0:	99                   	cltd   
c0009ca1:	f7 7d 0c             	idivl  0xc(%ebp)
c0009ca4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ca7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009cab:	74 14                	je     c0009cc1 <i2a+0x35>
c0009cad:	83 ec 04             	sub    $0x4,%esp
c0009cb0:	ff 75 10             	pushl  0x10(%ebp)
c0009cb3:	ff 75 0c             	pushl  0xc(%ebp)
c0009cb6:	ff 75 f0             	pushl  -0x10(%ebp)
c0009cb9:	e8 ce ff ff ff       	call   c0009c8c <i2a>
c0009cbe:	83 c4 10             	add    $0x10,%esp
c0009cc1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009cc5:	7f 0a                	jg     c0009cd1 <i2a+0x45>
c0009cc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009cca:	83 c0 30             	add    $0x30,%eax
c0009ccd:	89 c3                	mov    %eax,%ebx
c0009ccf:	eb 08                	jmp    c0009cd9 <i2a+0x4d>
c0009cd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009cd4:	83 c0 37             	add    $0x37,%eax
c0009cd7:	89 c3                	mov    %eax,%ebx
c0009cd9:	8b 45 10             	mov    0x10(%ebp),%eax
c0009cdc:	8b 00                	mov    (%eax),%eax
c0009cde:	8d 48 01             	lea    0x1(%eax),%ecx
c0009ce1:	8b 55 10             	mov    0x10(%ebp),%edx
c0009ce4:	89 0a                	mov    %ecx,(%edx)
c0009ce6:	88 18                	mov    %bl,(%eax)
c0009ce8:	8b 45 10             	mov    0x10(%ebp),%eax
c0009ceb:	8b 00                	mov    (%eax),%eax
c0009ced:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009cf0:	c9                   	leave  
c0009cf1:	c3                   	ret    

c0009cf2 <inform_int>:
c0009cf2:	55                   	push   %ebp
c0009cf3:	89 e5                	mov    %esp,%ebp
c0009cf5:	83 ec 18             	sub    $0x18,%esp
c0009cf8:	83 ec 0c             	sub    $0xc,%esp
c0009cfb:	ff 75 08             	pushl  0x8(%ebp)
c0009cfe:	e8 14 ad ff ff       	call   c0004a17 <pid2proc>
c0009d03:	83 c4 10             	add    $0x10,%esp
c0009d06:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009d09:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d0c:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009d13:	0f be c0             	movsbl %al,%eax
c0009d16:	83 e0 02             	and    $0x2,%eax
c0009d19:	85 c0                	test   %eax,%eax
c0009d1b:	0f 84 8e 00 00 00    	je     c0009daf <inform_int+0xbd>
c0009d21:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d24:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d2a:	3d 13 02 00 00       	cmp    $0x213,%eax
c0009d2f:	74 0e                	je     c0009d3f <inform_int+0x4d>
c0009d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d34:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d3a:	83 f8 0e             	cmp    $0xe,%eax
c0009d3d:	75 7d                	jne    c0009dbc <inform_int+0xca>
c0009d3f:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c0009d46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d49:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009d4f:	83 ec 08             	sub    $0x8,%esp
c0009d52:	ff 75 f0             	pushl  -0x10(%ebp)
c0009d55:	50                   	push   %eax
c0009d56:	e8 2d d0 ff ff       	call   c0006d88 <alloc_virtual_memory>
c0009d5b:	83 c4 10             	add    $0x10,%esp
c0009d5e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009d61:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d64:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009d6a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d6d:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009d74:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d77:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009d7e:	00 00 00 
c0009d81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d84:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009d8b:	00 00 00 
c0009d8e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009d95:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d98:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0009d9f:	83 ec 0c             	sub    $0xc,%esp
c0009da2:	ff 75 f4             	pushl  -0xc(%ebp)
c0009da5:	e8 f1 fd ff ff       	call   c0009b9b <unblock>
c0009daa:	83 c4 10             	add    $0x10,%esp
c0009dad:	eb 0d                	jmp    c0009dbc <inform_int+0xca>
c0009daf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009db2:	c7 80 5c 02 00 00 01 	movl   $0x1,0x25c(%eax)
c0009db9:	00 00 00 
c0009dbc:	90                   	nop
c0009dbd:	c9                   	leave  
c0009dbe:	c3                   	ret    

c0009dbf <strcmp>:
c0009dbf:	55                   	push   %ebp
c0009dc0:	89 e5                	mov    %esp,%ebp
c0009dc2:	83 ec 10             	sub    $0x10,%esp
c0009dc5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0009dc9:	74 06                	je     c0009dd1 <strcmp+0x12>
c0009dcb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009dcf:	75 08                	jne    c0009dd9 <strcmp+0x1a>
c0009dd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0009dd4:	2b 45 0c             	sub    0xc(%ebp),%eax
c0009dd7:	eb 53                	jmp    c0009e2c <strcmp+0x6d>
c0009dd9:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ddc:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009ddf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009de2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009de5:	eb 18                	jmp    c0009dff <strcmp+0x40>
c0009de7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009dea:	0f b6 10             	movzbl (%eax),%edx
c0009ded:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009df0:	0f b6 00             	movzbl (%eax),%eax
c0009df3:	38 c2                	cmp    %al,%dl
c0009df5:	75 1e                	jne    c0009e15 <strcmp+0x56>
c0009df7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009dfb:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009dff:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009e02:	0f b6 00             	movzbl (%eax),%eax
c0009e05:	84 c0                	test   %al,%al
c0009e07:	74 0d                	je     c0009e16 <strcmp+0x57>
c0009e09:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009e0c:	0f b6 00             	movzbl (%eax),%eax
c0009e0f:	84 c0                	test   %al,%al
c0009e11:	75 d4                	jne    c0009de7 <strcmp+0x28>
c0009e13:	eb 01                	jmp    c0009e16 <strcmp+0x57>
c0009e15:	90                   	nop
c0009e16:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009e19:	0f b6 00             	movzbl (%eax),%eax
c0009e1c:	0f be d0             	movsbl %al,%edx
c0009e1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009e22:	0f b6 00             	movzbl (%eax),%eax
c0009e25:	0f be c0             	movsbl %al,%eax
c0009e28:	29 c2                	sub    %eax,%edx
c0009e2a:	89 d0                	mov    %edx,%eax
c0009e2c:	c9                   	leave  
c0009e2d:	c3                   	ret    

c0009e2e <create_user_process_address_space>:
c0009e2e:	55                   	push   %ebp
c0009e2f:	89 e5                	mov    %esp,%ebp
c0009e31:	83 ec 18             	sub    $0x18,%esp
c0009e34:	83 ec 08             	sub    $0x8,%esp
c0009e37:	6a 00                	push   $0x0
c0009e39:	6a 01                	push   $0x1
c0009e3b:	e8 e7 cf ff ff       	call   c0006e27 <alloc_memory>
c0009e40:	83 c4 10             	add    $0x10,%esp
c0009e43:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009e46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e49:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0009e50:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0009e57:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e5a:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009e5f:	c1 e8 0c             	shr    $0xc,%eax
c0009e62:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009e65:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e68:	83 c0 07             	add    $0x7,%eax
c0009e6b:	c1 e8 03             	shr    $0x3,%eax
c0009e6e:	89 c2                	mov    %eax,%edx
c0009e70:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e73:	89 50 04             	mov    %edx,0x4(%eax)
c0009e76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e79:	8b 40 04             	mov    0x4(%eax),%eax
c0009e7c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009e81:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009e87:	85 c0                	test   %eax,%eax
c0009e89:	0f 48 c2             	cmovs  %edx,%eax
c0009e8c:	c1 f8 0c             	sar    $0xc,%eax
c0009e8f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009e92:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009e95:	83 ec 08             	sub    $0x8,%esp
c0009e98:	6a 00                	push   $0x0
c0009e9a:	50                   	push   %eax
c0009e9b:	e8 87 cf ff ff       	call   c0006e27 <alloc_memory>
c0009ea0:	83 c4 10             	add    $0x10,%esp
c0009ea3:	89 c2                	mov    %eax,%edx
c0009ea5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ea8:	89 10                	mov    %edx,(%eax)
c0009eaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ead:	83 ec 0c             	sub    $0xc,%esp
c0009eb0:	50                   	push   %eax
c0009eb1:	e8 6f ca ff ff       	call   c0006925 <init_bitmap>
c0009eb6:	83 c4 10             	add    $0x10,%esp
c0009eb9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ebc:	c9                   	leave  
c0009ebd:	c3                   	ret    

c0009ebe <user_process>:
c0009ebe:	55                   	push   %ebp
c0009ebf:	89 e5                	mov    %esp,%ebp
c0009ec1:	83 ec 28             	sub    $0x28,%esp
c0009ec4:	e8 c3 79 ff ff       	call   c000188c <get_running_thread_pcb>
c0009ec9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009ecc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ecf:	05 00 10 00 00       	add    $0x1000,%eax
c0009ed4:	89 c2                	mov    %eax,%edx
c0009ed6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ed9:	89 10                	mov    %edx,(%eax)
c0009edb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ede:	8b 00                	mov    (%eax),%eax
c0009ee0:	8d 90 f0 fe ff ff    	lea    -0x110(%eax),%edx
c0009ee6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ee9:	89 10                	mov    %edx,(%eax)
c0009eeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009eee:	8b 00                	mov    (%eax),%eax
c0009ef0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ef3:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
c0009ef7:	66 c7 45 ec 02 12    	movw   $0x1202,-0x14(%ebp)
c0009efd:	66 c7 45 ea 48 00    	movw   $0x48,-0x16(%ebp)
c0009f03:	66 c7 45 e8 50 00    	movw   $0x50,-0x18(%ebp)
c0009f09:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009f0d:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
c0009f11:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009f15:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
c0009f19:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009f1d:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
c0009f21:	66 c7 45 e0 38 00    	movw   $0x38,-0x20(%ebp)
c0009f27:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c0009f2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f2e:	89 50 34             	mov    %edx,0x34(%eax)
c0009f31:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009f35:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f38:	89 50 0c             	mov    %edx,0xc(%eax)
c0009f3b:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009f3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f42:	89 50 04             	mov    %edx,0x4(%eax)
c0009f45:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009f49:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f4c:	89 50 08             	mov    %edx,0x8(%eax)
c0009f4f:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009f53:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f56:	89 50 40             	mov    %edx,0x40(%eax)
c0009f59:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
c0009f5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f60:	89 10                	mov    %edx,(%eax)
c0009f62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f65:	8b 55 08             	mov    0x8(%ebp),%edx
c0009f68:	89 50 30             	mov    %edx,0x30(%eax)
c0009f6b:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
c0009f6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f72:	89 50 38             	mov    %edx,0x38(%eax)
c0009f75:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f78:	83 ec 0c             	sub    $0xc,%esp
c0009f7b:	50                   	push   %eax
c0009f7c:	e8 e0 77 ff ff       	call   c0001761 <restart>
c0009f81:	83 c4 10             	add    $0x10,%esp
c0009f84:	90                   	nop
c0009f85:	c9                   	leave  
c0009f86:	c3                   	ret    

c0009f87 <clone_pcb>:
c0009f87:	55                   	push   %ebp
c0009f88:	89 e5                	mov    %esp,%ebp
c0009f8a:	83 ec 18             	sub    $0x18,%esp
c0009f8d:	83 ec 08             	sub    $0x8,%esp
c0009f90:	6a 00                	push   $0x0
c0009f92:	6a 01                	push   $0x1
c0009f94:	e8 8e ce ff ff       	call   c0006e27 <alloc_memory>
c0009f99:	83 c4 10             	add    $0x10,%esp
c0009f9c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009f9f:	83 ec 04             	sub    $0x4,%esp
c0009fa2:	68 ac 02 00 00       	push   $0x2ac
c0009fa7:	ff 75 08             	pushl  0x8(%ebp)
c0009faa:	ff 75 f4             	pushl  -0xc(%ebp)
c0009fad:	e8 72 13 00 00       	call   c000b324 <Memcpy>
c0009fb2:	83 c4 10             	add    $0x10,%esp
c0009fb5:	a1 30 f7 00 c0       	mov    0xc000f730,%eax
c0009fba:	83 c0 01             	add    $0x1,%eax
c0009fbd:	a3 30 f7 00 c0       	mov    %eax,0xc000f730
c0009fc2:	8b 15 30 f7 00 c0    	mov    0xc000f730,%edx
c0009fc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fcb:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c0009fd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fd4:	8b 90 60 02 00 00    	mov    0x260(%eax),%edx
c0009fda:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fdd:	89 90 60 02 00 00    	mov    %edx,0x260(%eax)
c0009fe3:	83 ec 08             	sub    $0x8,%esp
c0009fe6:	6a 00                	push   $0x0
c0009fe8:	6a 01                	push   $0x1
c0009fea:	e8 38 ce ff ff       	call   c0006e27 <alloc_memory>
c0009fef:	83 c4 10             	add    $0x10,%esp
c0009ff2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ff5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ff8:	05 00 0c 00 00       	add    $0xc00,%eax
c0009ffd:	83 ec 04             	sub    $0x4,%esp
c000a000:	68 00 04 00 00       	push   $0x400
c000a005:	68 00 fc ff ff       	push   $0xfffffc00
c000a00a:	50                   	push   %eax
c000a00b:	e8 14 13 00 00       	call   c000b324 <Memcpy>
c000a010:	83 c4 10             	add    $0x10,%esp
c000a013:	83 ec 0c             	sub    $0xc,%esp
c000a016:	ff 75 f0             	pushl  -0x10(%ebp)
c000a019:	e8 d7 cd ff ff       	call   c0006df5 <get_physical_address>
c000a01e:	83 c4 10             	add    $0x10,%esp
c000a021:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a024:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a027:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a02c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a02f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a032:	83 c8 07             	or     $0x7,%eax
c000a035:	89 c2                	mov    %eax,%edx
c000a037:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a03a:	89 10                	mov    %edx,(%eax)
c000a03c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a03f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a042:	89 50 04             	mov    %edx,0x4(%eax)
c000a045:	e8 e4 fd ff ff       	call   c0009e2e <create_user_process_address_space>
c000a04a:	89 c2                	mov    %eax,%edx
c000a04c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a04f:	89 50 08             	mov    %edx,0x8(%eax)
c000a052:	8b 45 08             	mov    0x8(%ebp),%eax
c000a055:	8b 40 08             	mov    0x8(%eax),%eax
c000a058:	89 c2                	mov    %eax,%edx
c000a05a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a05d:	8b 40 08             	mov    0x8(%eax),%eax
c000a060:	83 ec 04             	sub    $0x4,%esp
c000a063:	6a 0c                	push   $0xc
c000a065:	52                   	push   %edx
c000a066:	50                   	push   %eax
c000a067:	e8 b8 12 00 00       	call   c000b324 <Memcpy>
c000a06c:	83 c4 10             	add    $0x10,%esp
c000a06f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a072:	c9                   	leave  
c000a073:	c3                   	ret    

c000a074 <build_body_stack>:
c000a074:	55                   	push   %ebp
c000a075:	89 e5                	mov    %esp,%ebp
c000a077:	83 ec 38             	sub    $0x38,%esp
c000a07a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a07d:	8b 40 08             	mov    0x8(%eax),%eax
c000a080:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a083:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a086:	8b 50 04             	mov    0x4(%eax),%edx
c000a089:	8b 00                	mov    (%eax),%eax
c000a08b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a08e:	89 55 cc             	mov    %edx,-0x34(%ebp)
c000a091:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a094:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a097:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a09a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a09d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a0a0:	8b 40 08             	mov    0x8(%eax),%eax
c000a0a3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a0a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a0ad:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a0b4:	e8 f7 76 ff ff       	call   c00017b0 <disable_int>
c000a0b9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a0c0:	e9 dd 00 00 00       	jmp    c000a1a2 <build_body_stack+0x12e>
c000a0c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a0c8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a0cb:	01 d0                	add    %edx,%eax
c000a0cd:	0f b6 00             	movzbl (%eax),%eax
c000a0d0:	88 45 d7             	mov    %al,-0x29(%ebp)
c000a0d3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a0da:	e9 b5 00 00 00       	jmp    c000a194 <build_body_stack+0x120>
c000a0df:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c000a0e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a0e6:	89 c1                	mov    %eax,%ecx
c000a0e8:	d3 fa                	sar    %cl,%edx
c000a0ea:	89 d0                	mov    %edx,%eax
c000a0ec:	83 e0 01             	and    $0x1,%eax
c000a0ef:	85 c0                	test   %eax,%eax
c000a0f1:	75 09                	jne    c000a0fc <build_body_stack+0x88>
c000a0f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a0f7:	e9 94 00 00 00       	jmp    c000a190 <build_body_stack+0x11c>
c000a0fc:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0ff:	8b 40 04             	mov    0x4(%eax),%eax
c000a102:	83 ec 0c             	sub    $0xc,%esp
c000a105:	50                   	push   %eax
c000a106:	e8 65 77 ff ff       	call   c0001870 <update_cr3>
c000a10b:	83 c4 10             	add    $0x10,%esp
c000a10e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a111:	c1 e0 0c             	shl    $0xc,%eax
c000a114:	89 c2                	mov    %eax,%edx
c000a116:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a119:	01 d0                	add    %edx,%eax
c000a11b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a11e:	81 7d d0 00 60 05 08 	cmpl   $0x8056000,-0x30(%ebp)
c000a125:	75 0f                	jne    c000a136 <build_body_stack+0xc2>
c000a127:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a12a:	83 ec 0c             	sub    $0xc,%esp
c000a12d:	50                   	push   %eax
c000a12e:	e8 0f d9 ff ff       	call   c0007a42 <disp_int>
c000a133:	83 c4 10             	add    $0x10,%esp
c000a136:	8b 55 d0             	mov    -0x30(%ebp),%edx
c000a139:	8b 45 10             	mov    0x10(%ebp),%eax
c000a13c:	83 ec 04             	sub    $0x4,%esp
c000a13f:	68 00 10 00 00       	push   $0x1000
c000a144:	52                   	push   %edx
c000a145:	50                   	push   %eax
c000a146:	e8 d9 11 00 00       	call   c000b324 <Memcpy>
c000a14b:	83 c4 10             	add    $0x10,%esp
c000a14e:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a151:	8b 40 04             	mov    0x4(%eax),%eax
c000a154:	83 ec 0c             	sub    $0xc,%esp
c000a157:	50                   	push   %eax
c000a158:	e8 13 77 ff ff       	call   c0001870 <update_cr3>
c000a15d:	83 c4 10             	add    $0x10,%esp
c000a160:	83 ec 08             	sub    $0x8,%esp
c000a163:	ff 75 d0             	pushl  -0x30(%ebp)
c000a166:	6a 01                	push   $0x1
c000a168:	e8 1c cd ff ff       	call   c0006e89 <get_a_virtual_page>
c000a16d:	83 c4 10             	add    $0x10,%esp
c000a170:	8b 55 10             	mov    0x10(%ebp),%edx
c000a173:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a176:	83 ec 04             	sub    $0x4,%esp
c000a179:	68 00 10 00 00       	push   $0x1000
c000a17e:	52                   	push   %edx
c000a17f:	50                   	push   %eax
c000a180:	e8 9f 11 00 00       	call   c000b324 <Memcpy>
c000a185:	83 c4 10             	add    $0x10,%esp
c000a188:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a18c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a190:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a194:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a198:	0f 8e 41 ff ff ff    	jle    c000a0df <build_body_stack+0x6b>
c000a19e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a1a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a1a5:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a1a8:	0f 87 17 ff ff ff    	ja     c000a0c5 <build_body_stack+0x51>
c000a1ae:	83 ec 0c             	sub    $0xc,%esp
c000a1b1:	68 1d b3 00 c0       	push   $0xc000b31d
c000a1b6:	e8 d1 73 ff ff       	call   c000158c <disp_str>
c000a1bb:	83 c4 10             	add    $0x10,%esp
c000a1be:	83 ec 0c             	sub    $0xc,%esp
c000a1c1:	ff 75 f0             	pushl  -0x10(%ebp)
c000a1c4:	e8 79 d8 ff ff       	call   c0007a42 <disp_int>
c000a1c9:	83 c4 10             	add    $0x10,%esp
c000a1cc:	83 ec 0c             	sub    $0xc,%esp
c000a1cf:	68 22 b3 00 c0       	push   $0xc000b322
c000a1d4:	e8 b3 73 ff ff       	call   c000158c <disp_str>
c000a1d9:	83 c4 10             	add    $0x10,%esp
c000a1dc:	e8 d1 75 ff ff       	call   c00017b2 <enable_int>
c000a1e1:	90                   	nop
c000a1e2:	c9                   	leave  
c000a1e3:	c3                   	ret    

c000a1e4 <build_process_kernel_stack>:
c000a1e4:	55                   	push   %ebp
c000a1e5:	89 e5                	mov    %esp,%ebp
c000a1e7:	83 ec 20             	sub    $0x20,%esp
c000a1ea:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1ed:	05 bc 0f 00 00       	add    $0xfbc,%eax
c000a1f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a1f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a1f8:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a1fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a1fe:	83 e8 04             	sub    $0x4,%eax
c000a201:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a204:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a207:	83 e8 08             	sub    $0x8,%eax
c000a20a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a20d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a210:	83 e8 0c             	sub    $0xc,%eax
c000a213:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a216:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a219:	83 e8 10             	sub    $0x10,%eax
c000a21c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a21f:	ba 61 17 00 c0       	mov    $0xc0001761,%edx
c000a224:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a227:	89 10                	mov    %edx,(%eax)
c000a229:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a22c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a232:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a235:	8b 10                	mov    (%eax),%edx
c000a237:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a23a:	89 10                	mov    %edx,(%eax)
c000a23c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a23f:	8b 10                	mov    (%eax),%edx
c000a241:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a244:	89 10                	mov    %edx,(%eax)
c000a246:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a249:	8b 10                	mov    (%eax),%edx
c000a24b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a24e:	89 10                	mov    %edx,(%eax)
c000a250:	8b 45 08             	mov    0x8(%ebp),%eax
c000a253:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a256:	89 10                	mov    %edx,(%eax)
c000a258:	90                   	nop
c000a259:	c9                   	leave  
c000a25a:	c3                   	ret    

c000a25b <fork_process>:
c000a25b:	55                   	push   %ebp
c000a25c:	89 e5                	mov    %esp,%ebp
c000a25e:	83 ec 18             	sub    $0x18,%esp
c000a261:	8b 45 08             	mov    0x8(%ebp),%eax
c000a264:	83 ec 0c             	sub    $0xc,%esp
c000a267:	50                   	push   %eax
c000a268:	e8 aa a7 ff ff       	call   c0004a17 <pid2proc>
c000a26d:	83 c4 10             	add    $0x10,%esp
c000a270:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a273:	83 ec 0c             	sub    $0xc,%esp
c000a276:	ff 75 f4             	pushl  -0xc(%ebp)
c000a279:	e8 09 fd ff ff       	call   c0009f87 <clone_pcb>
c000a27e:	83 c4 10             	add    $0x10,%esp
c000a281:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a284:	83 ec 08             	sub    $0x8,%esp
c000a287:	6a 00                	push   $0x0
c000a289:	6a 01                	push   $0x1
c000a28b:	e8 97 cb ff ff       	call   c0006e27 <alloc_memory>
c000a290:	83 c4 10             	add    $0x10,%esp
c000a293:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a296:	83 ec 04             	sub    $0x4,%esp
c000a299:	ff 75 ec             	pushl  -0x14(%ebp)
c000a29c:	ff 75 f0             	pushl  -0x10(%ebp)
c000a29f:	ff 75 f4             	pushl  -0xc(%ebp)
c000a2a2:	e8 cd fd ff ff       	call   c000a074 <build_body_stack>
c000a2a7:	83 c4 10             	add    $0x10,%esp
c000a2aa:	83 ec 0c             	sub    $0xc,%esp
c000a2ad:	ff 75 f0             	pushl  -0x10(%ebp)
c000a2b0:	e8 2f ff ff ff       	call   c000a1e4 <build_process_kernel_stack>
c000a2b5:	83 c4 10             	add    $0x10,%esp
c000a2b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2bb:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000a2c2:	84 c0                	test   %al,%al
c000a2c4:	75 31                	jne    c000a2f7 <fork_process+0x9c>
c000a2c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2c9:	05 fc 00 00 00       	add    $0xfc,%eax
c000a2ce:	83 ec 04             	sub    $0x4,%esp
c000a2d1:	6a 08                	push   $0x8
c000a2d3:	6a 00                	push   $0x0
c000a2d5:	50                   	push   %eax
c000a2d6:	e8 77 10 00 00       	call   c000b352 <Memset>
c000a2db:	83 c4 10             	add    $0x10,%esp
c000a2de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2e1:	05 fc 00 00 00       	add    $0xfc,%eax
c000a2e6:	83 ec 08             	sub    $0x8,%esp
c000a2e9:	50                   	push   %eax
c000a2ea:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a2ef:	e8 e0 01 00 00       	call   c000a4d4 <appendToDoubleLinkList>
c000a2f4:	83 c4 10             	add    $0x10,%esp
c000a2f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2fa:	05 04 01 00 00       	add    $0x104,%eax
c000a2ff:	83 ec 04             	sub    $0x4,%esp
c000a302:	6a 08                	push   $0x8
c000a304:	6a 00                	push   $0x0
c000a306:	50                   	push   %eax
c000a307:	e8 46 10 00 00       	call   c000b352 <Memset>
c000a30c:	83 c4 10             	add    $0x10,%esp
c000a30f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a312:	05 04 01 00 00       	add    $0x104,%eax
c000a317:	83 ec 08             	sub    $0x8,%esp
c000a31a:	50                   	push   %eax
c000a31b:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a320:	e8 af 01 00 00       	call   c000a4d4 <appendToDoubleLinkList>
c000a325:	83 c4 10             	add    $0x10,%esp
c000a328:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a32b:	c9                   	leave  
c000a32c:	c3                   	ret    

c000a32d <process_execute>:
c000a32d:	55                   	push   %ebp
c000a32e:	89 e5                	mov    %esp,%ebp
c000a330:	83 ec 28             	sub    $0x28,%esp
c000a333:	e8 8f 02 00 00       	call   c000a5c7 <thread_init>
c000a338:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a33b:	83 ec 0c             	sub    $0xc,%esp
c000a33e:	ff 75 f4             	pushl  -0xc(%ebp)
c000a341:	e8 e8 02 00 00       	call   c000a62e <thread_create>
c000a346:	83 c4 10             	add    $0x10,%esp
c000a349:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a34c:	05 30 01 00 00       	add    $0x130,%eax
c000a351:	83 ec 08             	sub    $0x8,%esp
c000a354:	ff 75 10             	pushl  0x10(%ebp)
c000a357:	50                   	push   %eax
c000a358:	e8 14 10 00 00       	call   c000b371 <Strcpy>
c000a35d:	83 c4 10             	add    $0x10,%esp
c000a360:	83 ec 08             	sub    $0x8,%esp
c000a363:	6a 00                	push   $0x0
c000a365:	6a 01                	push   $0x1
c000a367:	e8 bb ca ff ff       	call   c0006e27 <alloc_memory>
c000a36c:	83 c4 10             	add    $0x10,%esp
c000a36f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a372:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a375:	05 00 0c 00 00       	add    $0xc00,%eax
c000a37a:	83 ec 04             	sub    $0x4,%esp
c000a37d:	68 00 04 00 00       	push   $0x400
c000a382:	68 00 fc ff ff       	push   $0xfffffc00
c000a387:	50                   	push   %eax
c000a388:	e8 97 0f 00 00       	call   c000b324 <Memcpy>
c000a38d:	83 c4 10             	add    $0x10,%esp
c000a390:	83 ec 0c             	sub    $0xc,%esp
c000a393:	ff 75 f0             	pushl  -0x10(%ebp)
c000a396:	e8 5a ca ff ff       	call   c0006df5 <get_physical_address>
c000a39b:	83 c4 10             	add    $0x10,%esp
c000a39e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a3a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a3a4:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a3a9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a3ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a3af:	83 c8 07             	or     $0x7,%eax
c000a3b2:	89 c2                	mov    %eax,%edx
c000a3b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a3b7:	89 10                	mov    %edx,(%eax)
c000a3b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3bc:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a3bf:	89 50 04             	mov    %edx,0x4(%eax)
c000a3c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3c5:	83 c0 0c             	add    $0xc,%eax
c000a3c8:	83 ec 0c             	sub    $0xc,%esp
c000a3cb:	50                   	push   %eax
c000a3cc:	e8 47 cf ff ff       	call   c0007318 <init_memory_block_desc>
c000a3d1:	83 c4 10             	add    $0x10,%esp
c000a3d4:	e8 55 fa ff ff       	call   c0009e2e <create_user_process_address_space>
c000a3d9:	89 c2                	mov    %eax,%edx
c000a3db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3de:	89 50 08             	mov    %edx,0x8(%eax)
c000a3e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3e4:	8b 00                	mov    (%eax),%eax
c000a3e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a3e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a3ec:	c7 40 10 be 9e 00 c0 	movl   $0xc0009ebe,0x10(%eax)
c000a3f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a3f6:	8b 55 08             	mov    0x8(%ebp),%edx
c000a3f9:	89 50 18             	mov    %edx,0x18(%eax)
c000a3fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a3ff:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a402:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a405:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a408:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a40b:	89 50 20             	mov    %edx,0x20(%eax)
c000a40e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a411:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a417:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a41a:	8b 10                	mov    (%eax),%edx
c000a41c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a41f:	89 50 04             	mov    %edx,0x4(%eax)
c000a422:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a425:	8b 50 04             	mov    0x4(%eax),%edx
c000a428:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a42b:	89 50 08             	mov    %edx,0x8(%eax)
c000a42e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a431:	8b 50 08             	mov    0x8(%eax),%edx
c000a434:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a437:	89 50 0c             	mov    %edx,0xc(%eax)
c000a43a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a43d:	05 fc 00 00 00       	add    $0xfc,%eax
c000a442:	83 ec 08             	sub    $0x8,%esp
c000a445:	50                   	push   %eax
c000a446:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a44b:	e8 84 00 00 00       	call   c000a4d4 <appendToDoubleLinkList>
c000a450:	83 c4 10             	add    $0x10,%esp
c000a453:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a456:	05 04 01 00 00       	add    $0x104,%eax
c000a45b:	83 ec 08             	sub    $0x8,%esp
c000a45e:	50                   	push   %eax
c000a45f:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a464:	e8 6b 00 00 00       	call   c000a4d4 <appendToDoubleLinkList>
c000a469:	83 c4 10             	add    $0x10,%esp
c000a46c:	90                   	nop
c000a46d:	c9                   	leave  
c000a46e:	c3                   	ret    
c000a46f:	90                   	nop

c000a470 <switch_to>:
c000a470:	56                   	push   %esi
c000a471:	57                   	push   %edi
c000a472:	53                   	push   %ebx
c000a473:	55                   	push   %ebp
c000a474:	89 e5                	mov    %esp,%ebp
c000a476:	8b 45 14             	mov    0x14(%ebp),%eax
c000a479:	89 20                	mov    %esp,(%eax)
c000a47b:	8b 45 18             	mov    0x18(%ebp),%eax
c000a47e:	8b 20                	mov    (%eax),%esp
c000a480:	5d                   	pop    %ebp
c000a481:	5b                   	pop    %ebx
c000a482:	5f                   	pop    %edi
c000a483:	5e                   	pop    %esi
c000a484:	c3                   	ret    

c000a485 <initDoubleLinkList>:
c000a485:	55                   	push   %ebp
c000a486:	89 e5                	mov    %esp,%ebp
c000a488:	8b 45 08             	mov    0x8(%ebp),%eax
c000a48b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a491:	8b 45 08             	mov    0x8(%ebp),%eax
c000a494:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a49b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a49e:	8d 50 08             	lea    0x8(%eax),%edx
c000a4a1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4a4:	89 50 04             	mov    %edx,0x4(%eax)
c000a4a7:	8b 55 08             	mov    0x8(%ebp),%edx
c000a4aa:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4ad:	89 50 08             	mov    %edx,0x8(%eax)
c000a4b0:	90                   	nop
c000a4b1:	5d                   	pop    %ebp
c000a4b2:	c3                   	ret    

c000a4b3 <isListEmpty>:
c000a4b3:	55                   	push   %ebp
c000a4b4:	89 e5                	mov    %esp,%ebp
c000a4b6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4b9:	8b 40 04             	mov    0x4(%eax),%eax
c000a4bc:	8b 55 08             	mov    0x8(%ebp),%edx
c000a4bf:	83 c2 08             	add    $0x8,%edx
c000a4c2:	39 d0                	cmp    %edx,%eax
c000a4c4:	75 07                	jne    c000a4cd <isListEmpty+0x1a>
c000a4c6:	b8 01 00 00 00       	mov    $0x1,%eax
c000a4cb:	eb 05                	jmp    c000a4d2 <isListEmpty+0x1f>
c000a4cd:	b8 00 00 00 00       	mov    $0x0,%eax
c000a4d2:	5d                   	pop    %ebp
c000a4d3:	c3                   	ret    

c000a4d4 <appendToDoubleLinkList>:
c000a4d4:	55                   	push   %ebp
c000a4d5:	89 e5                	mov    %esp,%ebp
c000a4d7:	83 ec 10             	sub    $0x10,%esp
c000a4da:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a4dd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a4e0:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4e3:	8b 50 08             	mov    0x8(%eax),%edx
c000a4e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a4e9:	89 10                	mov    %edx,(%eax)
c000a4eb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4ee:	8b 40 08             	mov    0x8(%eax),%eax
c000a4f1:	85 c0                	test   %eax,%eax
c000a4f3:	74 0c                	je     c000a501 <appendToDoubleLinkList+0x2d>
c000a4f5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4f8:	8b 40 08             	mov    0x8(%eax),%eax
c000a4fb:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a4fe:	89 50 04             	mov    %edx,0x4(%eax)
c000a501:	8b 45 08             	mov    0x8(%ebp),%eax
c000a504:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a507:	89 50 08             	mov    %edx,0x8(%eax)
c000a50a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a50d:	8d 50 08             	lea    0x8(%eax),%edx
c000a510:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a513:	89 50 04             	mov    %edx,0x4(%eax)
c000a516:	90                   	nop
c000a517:	c9                   	leave  
c000a518:	c3                   	ret    

c000a519 <insertToDoubleLinkList>:
c000a519:	55                   	push   %ebp
c000a51a:	89 e5                	mov    %esp,%ebp
c000a51c:	83 ec 10             	sub    $0x10,%esp
c000a51f:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a522:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a525:	8b 45 08             	mov    0x8(%ebp),%eax
c000a528:	8b 50 04             	mov    0x4(%eax),%edx
c000a52b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a52e:	89 50 04             	mov    %edx,0x4(%eax)
c000a531:	8b 45 08             	mov    0x8(%ebp),%eax
c000a534:	8b 40 04             	mov    0x4(%eax),%eax
c000a537:	85 c0                	test   %eax,%eax
c000a539:	74 0b                	je     c000a546 <insertToDoubleLinkList+0x2d>
c000a53b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a53e:	8b 40 04             	mov    0x4(%eax),%eax
c000a541:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a544:	89 10                	mov    %edx,(%eax)
c000a546:	8b 45 08             	mov    0x8(%ebp),%eax
c000a549:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a54c:	89 50 04             	mov    %edx,0x4(%eax)
c000a54f:	8b 55 08             	mov    0x8(%ebp),%edx
c000a552:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a555:	89 10                	mov    %edx,(%eax)
c000a557:	90                   	nop
c000a558:	c9                   	leave  
c000a559:	c3                   	ret    

c000a55a <popFromDoubleLinkList>:
c000a55a:	55                   	push   %ebp
c000a55b:	89 e5                	mov    %esp,%ebp
c000a55d:	83 ec 10             	sub    $0x10,%esp
c000a560:	ff 75 08             	pushl  0x8(%ebp)
c000a563:	e8 4b ff ff ff       	call   c000a4b3 <isListEmpty>
c000a568:	83 c4 04             	add    $0x4,%esp
c000a56b:	3c 01                	cmp    $0x1,%al
c000a56d:	75 07                	jne    c000a576 <popFromDoubleLinkList+0x1c>
c000a56f:	b8 00 00 00 00       	mov    $0x0,%eax
c000a574:	eb 37                	jmp    c000a5ad <popFromDoubleLinkList+0x53>
c000a576:	8b 45 08             	mov    0x8(%ebp),%eax
c000a579:	8b 40 08             	mov    0x8(%eax),%eax
c000a57c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a57f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a582:	8b 40 08             	mov    0x8(%eax),%eax
c000a585:	8b 00                	mov    (%eax),%eax
c000a587:	85 c0                	test   %eax,%eax
c000a589:	74 11                	je     c000a59c <popFromDoubleLinkList+0x42>
c000a58b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a58e:	8b 40 08             	mov    0x8(%eax),%eax
c000a591:	8b 00                	mov    (%eax),%eax
c000a593:	8b 55 08             	mov    0x8(%ebp),%edx
c000a596:	83 c2 08             	add    $0x8,%edx
c000a599:	89 50 04             	mov    %edx,0x4(%eax)
c000a59c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a59f:	8b 40 08             	mov    0x8(%eax),%eax
c000a5a2:	8b 10                	mov    (%eax),%edx
c000a5a4:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5a7:	89 50 08             	mov    %edx,0x8(%eax)
c000a5aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a5ad:	c9                   	leave  
c000a5ae:	c3                   	ret    

c000a5af <kernel_thread>:
c000a5af:	55                   	push   %ebp
c000a5b0:	89 e5                	mov    %esp,%ebp
c000a5b2:	83 ec 08             	sub    $0x8,%esp
c000a5b5:	fb                   	sti    
c000a5b6:	83 ec 0c             	sub    $0xc,%esp
c000a5b9:	ff 75 0c             	pushl  0xc(%ebp)
c000a5bc:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5bf:	ff d0                	call   *%eax
c000a5c1:	83 c4 10             	add    $0x10,%esp
c000a5c4:	90                   	nop
c000a5c5:	c9                   	leave  
c000a5c6:	c3                   	ret    

c000a5c7 <thread_init>:
c000a5c7:	55                   	push   %ebp
c000a5c8:	89 e5                	mov    %esp,%ebp
c000a5ca:	83 ec 18             	sub    $0x18,%esp
c000a5cd:	83 ec 08             	sub    $0x8,%esp
c000a5d0:	6a 00                	push   $0x0
c000a5d2:	6a 01                	push   $0x1
c000a5d4:	e8 4e c8 ff ff       	call   c0006e27 <alloc_memory>
c000a5d9:	83 c4 10             	add    $0x10,%esp
c000a5dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a5df:	83 ec 04             	sub    $0x4,%esp
c000a5e2:	68 00 10 00 00       	push   $0x1000
c000a5e7:	6a 00                	push   $0x0
c000a5e9:	ff 75 f4             	pushl  -0xc(%ebp)
c000a5ec:	e8 61 0d 00 00       	call   c000b352 <Memset>
c000a5f1:	83 c4 10             	add    $0x10,%esp
c000a5f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5f7:	05 00 10 00 00       	add    $0x1000,%eax
c000a5fc:	89 c2                	mov    %eax,%edx
c000a5fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a601:	89 10                	mov    %edx,(%eax)
c000a603:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a606:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000a60d:	a1 30 f7 00 c0       	mov    0xc000f730,%eax
c000a612:	83 c0 01             	add    $0x1,%eax
c000a615:	a3 30 f7 00 c0       	mov    %eax,0xc000f730
c000a61a:	8b 15 30 f7 00 c0    	mov    0xc000f730,%edx
c000a620:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a623:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c000a629:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a62c:	c9                   	leave  
c000a62d:	c3                   	ret    

c000a62e <thread_create>:
c000a62e:	55                   	push   %ebp
c000a62f:	89 e5                	mov    %esp,%ebp
c000a631:	83 ec 10             	sub    $0x10,%esp
c000a634:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000a63b:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c000a642:	8b 45 08             	mov    0x8(%ebp),%eax
c000a645:	8b 00                	mov    (%eax),%eax
c000a647:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000a64a:	89 c2                	mov    %eax,%edx
c000a64c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a64f:	89 10                	mov    %edx,(%eax)
c000a651:	8b 45 08             	mov    0x8(%ebp),%eax
c000a654:	8b 00                	mov    (%eax),%eax
c000a656:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000a659:	89 c2                	mov    %eax,%edx
c000a65b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a65e:	89 10                	mov    %edx,(%eax)
c000a660:	90                   	nop
c000a661:	c9                   	leave  
c000a662:	c3                   	ret    

c000a663 <thread_start>:
c000a663:	55                   	push   %ebp
c000a664:	89 e5                	mov    %esp,%ebp
c000a666:	83 ec 18             	sub    $0x18,%esp
c000a669:	e8 59 ff ff ff       	call   c000a5c7 <thread_init>
c000a66e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a671:	83 ec 0c             	sub    $0xc,%esp
c000a674:	ff 75 f4             	pushl  -0xc(%ebp)
c000a677:	e8 b2 ff ff ff       	call   c000a62e <thread_create>
c000a67c:	83 c4 10             	add    $0x10,%esp
c000a67f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a682:	05 30 01 00 00       	add    $0x130,%eax
c000a687:	83 ec 08             	sub    $0x8,%esp
c000a68a:	ff 75 10             	pushl  0x10(%ebp)
c000a68d:	50                   	push   %eax
c000a68e:	e8 de 0c 00 00       	call   c000b371 <Strcpy>
c000a693:	83 c4 10             	add    $0x10,%esp
c000a696:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a699:	8b 00                	mov    (%eax),%eax
c000a69b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a69e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6a1:	c7 40 10 af a5 00 c0 	movl   $0xc000a5af,0x10(%eax)
c000a6a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6ab:	8b 55 08             	mov    0x8(%ebp),%edx
c000a6ae:	89 50 18             	mov    %edx,0x18(%eax)
c000a6b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6b4:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a6b7:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a6ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6bd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a6c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6c6:	8b 10                	mov    (%eax),%edx
c000a6c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6cb:	89 50 04             	mov    %edx,0x4(%eax)
c000a6ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6d1:	8b 50 04             	mov    0x4(%eax),%edx
c000a6d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6d7:	89 50 08             	mov    %edx,0x8(%eax)
c000a6da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6dd:	8b 50 08             	mov    0x8(%eax),%edx
c000a6e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6e3:	89 50 0c             	mov    %edx,0xc(%eax)
c000a6e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6e9:	05 fc 00 00 00       	add    $0xfc,%eax
c000a6ee:	83 ec 08             	sub    $0x8,%esp
c000a6f1:	50                   	push   %eax
c000a6f2:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a6f7:	e8 d8 fd ff ff       	call   c000a4d4 <appendToDoubleLinkList>
c000a6fc:	83 c4 10             	add    $0x10,%esp
c000a6ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a702:	05 04 01 00 00       	add    $0x104,%eax
c000a707:	83 ec 08             	sub    $0x8,%esp
c000a70a:	50                   	push   %eax
c000a70b:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a710:	e8 bf fd ff ff       	call   c000a4d4 <appendToDoubleLinkList>
c000a715:	83 c4 10             	add    $0x10,%esp
c000a718:	90                   	nop
c000a719:	c9                   	leave  
c000a71a:	c3                   	ret    
