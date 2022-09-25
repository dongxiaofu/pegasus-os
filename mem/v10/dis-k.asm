
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
c0001525:	e8 73 37 00 00       	call   c0004c9d <ReloadGDT>
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
c000156a:	e8 1f 6a 00 00       	call   c0007f8e <test>
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
c0001661:	e8 41 64 00 00       	call   c0007aa7 <exception_handler>
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
c000168d:	e8 a1 32 00 00       	call   c0004933 <clock_handler>
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
c00016c0:	e8 d4 40 00 00       	call   c0005799 <keyboard_handler>
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
c0001707:	e8 11 0f 00 00       	call   c000261d <hd_handler>
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
c00017de:	e8 5e 61 00 00       	call   c0007941 <disp_int>
c00017e3:	83 c4 04             	add    $0x4,%esp
c00017e6:	58                   	pop    %eax
c00017e7:	5a                   	pop    %edx
c00017e8:	52                   	push   %edx
c00017e9:	50                   	push   %eax
c00017ea:	e8 52 61 00 00       	call   c0007941 <disp_int>
c00017ef:	58                   	pop    %eax
c00017f0:	5a                   	pop    %edx
c00017f1:	52                   	push   %edx
c00017f2:	50                   	push   %eax
c00017f3:	ff 35 44 f7 00 c0    	pushl  0xc000f744
c00017f9:	e8 43 61 00 00       	call   c0007941 <disp_int>
c00017fe:	83 c4 04             	add    $0x4,%esp
c0001801:	58                   	pop    %eax
c0001802:	5a                   	pop    %edx
c0001803:	52                   	push   %edx
c0001804:	50                   	push   %eax
c0001805:	ff 72 ec             	pushl  -0x14(%edx)
c0001808:	e8 34 61 00 00       	call   c0007941 <disp_int>
c000180d:	83 c4 04             	add    $0x4,%esp
c0001810:	58                   	pop    %eax
c0001811:	5a                   	pop    %edx
c0001812:	52                   	push   %edx
c0001813:	50                   	push   %eax
c0001814:	ff 70 ec             	pushl  -0x14(%eax)
c0001817:	e8 25 61 00 00       	call   c0007941 <disp_int>
c000181c:	83 c4 04             	add    $0x4,%esp
c000181f:	58                   	pop    %eax
c0001820:	5a                   	pop    %edx
c0001821:	52                   	push   %edx
c0001822:	50                   	push   %eax
c0001823:	ff 35 60 fb 00 c0    	pushl  0xc000fb60
c0001829:	e8 13 61 00 00       	call   c0007941 <disp_int>
c000182e:	83 c4 04             	add    $0x4,%esp
c0001831:	58                   	pop    %eax
c0001832:	5a                   	pop    %edx
c0001833:	52                   	push   %edx
c0001834:	50                   	push   %eax
c0001835:	68 00 f7 00 c0       	push   $0xc000f700
c000183a:	e8 02 61 00 00       	call   c0007941 <disp_int>
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
c000189a:	e8 7b 00 00 00       	call   c000191a <init>
c000189f:	83 ec 04             	sub    $0x4,%esp
c00018a2:	68 c0 a2 00 c0       	push   $0xc000a2c0
c00018a7:	68 ca a2 00 c0       	push   $0xc000a2ca
c00018ac:	68 6c 1a 00 c0       	push   $0xc0001a6c
c00018b1:	e8 02 86 00 00       	call   c0009eb8 <process_execute>
c00018b6:	83 c4 10             	add    $0x10,%esp
c00018b9:	83 ec 04             	sub    $0x4,%esp
c00018bc:	68 d7 a2 00 c0       	push   $0xc000a2d7
c00018c1:	68 df a2 00 c0       	push   $0xc000a2df
c00018c6:	68 96 56 00 c0       	push   $0xc0005696
c00018cb:	e8 e8 85 00 00       	call   c0009eb8 <process_execute>
c00018d0:	83 c4 10             	add    $0x10,%esp
c00018d3:	83 ec 04             	sub    $0x4,%esp
c00018d6:	68 e9 a2 00 c0       	push   $0xc000a2e9
c00018db:	68 f0 a2 00 c0       	push   $0xc000a2f0
c00018e0:	68 a1 1a 00 c0       	push   $0xc0001aa1
c00018e5:	e8 ce 85 00 00       	call   c0009eb8 <process_execute>
c00018ea:	83 c4 10             	add    $0x10,%esp
c00018ed:	83 ec 04             	sub    $0x4,%esp
c00018f0:	68 f9 a2 00 c0       	push   $0xc000a2f9
c00018f5:	68 01 a3 00 c0       	push   $0xc000a301
c00018fa:	68 34 28 00 c0       	push   $0xc0002834
c00018ff:	e8 b4 85 00 00       	call   c0009eb8 <process_execute>
c0001904:	83 c4 10             	add    $0x10,%esp
c0001907:	83 ec 0c             	sub    $0xc,%esp
c000190a:	68 0a a3 00 c0       	push   $0xc000a30a
c000190f:	e8 78 fc ff ff       	call   c000158c <disp_str>
c0001914:	83 c4 10             	add    $0x10,%esp
c0001917:	fb                   	sti    
c0001918:	eb fe                	jmp    c0001918 <kernel_main+0x84>

c000191a <init>:
c000191a:	55                   	push   %ebp
c000191b:	89 e5                	mov    %esp,%ebp
c000191d:	83 ec 08             	sub    $0x8,%esp
c0001920:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0001927:	00 00 00 
c000192a:	c7 05 30 f7 00 c0 00 	movl   $0x0,0xc000f730
c0001931:	00 00 00 
c0001934:	83 ec 0c             	sub    $0xc,%esp
c0001937:	68 14 a3 00 c0       	push   $0xc000a314
c000193c:	e8 4b fc ff ff       	call   c000158c <disp_str>
c0001941:	83 c4 10             	add    $0x10,%esp
c0001944:	e8 fa 66 00 00       	call   c0008043 <init_keyboard>
c0001949:	83 ec 0c             	sub    $0xc,%esp
c000194c:	68 00 00 00 02       	push   $0x2000000
c0001951:	e8 09 5c 00 00       	call   c000755f <init_memory>
c0001956:	83 c4 10             	add    $0x10,%esp
c0001959:	83 ec 0c             	sub    $0xc,%esp
c000195c:	68 8c fd 00 c0       	push   $0xc000fd8c
c0001961:	e8 af 86 00 00       	call   c000a015 <initDoubleLinkList>
c0001966:	83 c4 10             	add    $0x10,%esp
c0001969:	83 ec 0c             	sub    $0xc,%esp
c000196c:	68 d4 1e 01 c0       	push   $0xc0011ed4
c0001971:	e8 9f 86 00 00       	call   c000a015 <initDoubleLinkList>
c0001976:	83 c4 10             	add    $0x10,%esp
c0001979:	90                   	nop
c000197a:	c9                   	leave  
c000197b:	c3                   	ret    

c000197c <kernel_thread_a>:
c000197c:	55                   	push   %ebp
c000197d:	89 e5                	mov    %esp,%ebp
c000197f:	83 ec 18             	sub    $0x18,%esp
c0001982:	83 ec 0c             	sub    $0xc,%esp
c0001985:	ff 75 08             	pushl  0x8(%ebp)
c0001988:	e8 ff fb ff ff       	call   c000158c <disp_str>
c000198d:	83 c4 10             	add    $0x10,%esp
c0001990:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c0001995:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001998:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000199f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00019a2:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c00019a7:	83 ec 0c             	sub    $0xc,%esp
c00019aa:	68 1a a3 00 c0       	push   $0xc000a31a
c00019af:	e8 d8 fb ff ff       	call   c000158c <disp_str>
c00019b4:	83 c4 10             	add    $0x10,%esp
c00019b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00019ba:	8d 50 01             	lea    0x1(%eax),%edx
c00019bd:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00019c0:	83 ec 0c             	sub    $0xc,%esp
c00019c3:	50                   	push   %eax
c00019c4:	e8 78 5f 00 00       	call   c0007941 <disp_int>
c00019c9:	83 c4 10             	add    $0x10,%esp
c00019cc:	83 ec 0c             	sub    $0xc,%esp
c00019cf:	68 23 a3 00 c0       	push   $0xc000a323
c00019d4:	e8 b3 fb ff ff       	call   c000158c <disp_str>
c00019d9:	83 c4 10             	add    $0x10,%esp
c00019dc:	eb c1                	jmp    c000199f <kernel_thread_a+0x23>

c00019de <kernel_thread_b>:
c00019de:	55                   	push   %ebp
c00019df:	89 e5                	mov    %esp,%ebp
c00019e1:	83 ec 18             	sub    $0x18,%esp
c00019e4:	83 ec 0c             	sub    $0xc,%esp
c00019e7:	ff 75 08             	pushl  0x8(%ebp)
c00019ea:	e8 9d fb ff ff       	call   c000158c <disp_str>
c00019ef:	83 c4 10             	add    $0x10,%esp
c00019f2:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c00019f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00019fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a01:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001a04:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c0001a09:	83 ec 0c             	sub    $0xc,%esp
c0001a0c:	68 25 a3 00 c0       	push   $0xc000a325
c0001a11:	e8 76 fb ff ff       	call   c000158c <disp_str>
c0001a16:	83 c4 10             	add    $0x10,%esp
c0001a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a1c:	8d 50 01             	lea    0x1(%eax),%edx
c0001a1f:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0001a22:	83 ec 0c             	sub    $0xc,%esp
c0001a25:	50                   	push   %eax
c0001a26:	e8 16 5f 00 00       	call   c0007941 <disp_int>
c0001a2b:	83 c4 10             	add    $0x10,%esp
c0001a2e:	83 ec 0c             	sub    $0xc,%esp
c0001a31:	68 23 a3 00 c0       	push   $0xc000a323
c0001a36:	e8 51 fb ff ff       	call   c000158c <disp_str>
c0001a3b:	83 c4 10             	add    $0x10,%esp
c0001a3e:	eb c1                	jmp    c0001a01 <kernel_thread_b+0x23>

c0001a40 <kernel_thread_c>:
c0001a40:	55                   	push   %ebp
c0001a41:	89 e5                	mov    %esp,%ebp
c0001a43:	83 ec 08             	sub    $0x8,%esp
c0001a46:	83 ec 0c             	sub    $0xc,%esp
c0001a49:	ff 75 08             	pushl  0x8(%ebp)
c0001a4c:	e8 3b fb ff ff       	call   c000158c <disp_str>
c0001a51:	83 c4 10             	add    $0x10,%esp
c0001a54:	eb fe                	jmp    c0001a54 <kernel_thread_c+0x14>

c0001a56 <kernel_thread_d>:
c0001a56:	55                   	push   %ebp
c0001a57:	89 e5                	mov    %esp,%ebp
c0001a59:	83 ec 08             	sub    $0x8,%esp
c0001a5c:	83 ec 0c             	sub    $0xc,%esp
c0001a5f:	ff 75 08             	pushl  0x8(%ebp)
c0001a62:	e8 25 fb ff ff       	call   c000158c <disp_str>
c0001a67:	83 c4 10             	add    $0x10,%esp
c0001a6a:	eb fe                	jmp    c0001a6a <kernel_thread_d+0x14>

c0001a6c <user_proc_a>:
c0001a6c:	55                   	push   %ebp
c0001a6d:	89 e5                	mov    %esp,%ebp
c0001a6f:	83 ec 08             	sub    $0x8,%esp
c0001a72:	83 ec 0c             	sub    $0xc,%esp
c0001a75:	68 2e a3 00 c0       	push   $0xc000a32e
c0001a7a:	e8 0d fb ff ff       	call   c000158c <disp_str>
c0001a7f:	83 c4 10             	add    $0x10,%esp
c0001a82:	e8 d5 68 00 00       	call   c000835c <TestFS>
c0001a87:	eb fe                	jmp    c0001a87 <user_proc_a+0x1b>

c0001a89 <user_proc_b>:
c0001a89:	55                   	push   %ebp
c0001a8a:	89 e5                	mov    %esp,%ebp
c0001a8c:	83 ec 08             	sub    $0x8,%esp
c0001a8f:	83 ec 0c             	sub    $0xc,%esp
c0001a92:	68 40 a3 00 c0       	push   $0xc000a340
c0001a97:	e8 f0 fa ff ff       	call   c000158c <disp_str>
c0001a9c:	83 c4 10             	add    $0x10,%esp
c0001a9f:	eb fe                	jmp    c0001a9f <user_proc_b+0x16>

c0001aa1 <TaskHD>:
c0001aa1:	55                   	push   %ebp
c0001aa2:	89 e5                	mov    %esp,%ebp
c0001aa4:	83 ec 18             	sub    $0x18,%esp
c0001aa7:	e8 e0 fd ff ff       	call   c000188c <get_running_thread_pcb>
c0001aac:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001aaf:	e8 20 00 00 00       	call   c0001ad4 <init_hd>
c0001ab4:	83 ec 0c             	sub    $0xc,%esp
c0001ab7:	6a 6c                	push   $0x6c
c0001ab9:	e8 0a 53 00 00       	call   c0006dc8 <sys_malloc>
c0001abe:	83 c4 10             	add    $0x10,%esp
c0001ac1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001ac4:	83 ec 0c             	sub    $0xc,%esp
c0001ac7:	ff 75 f0             	pushl  -0x10(%ebp)
c0001aca:	e8 1f 00 00 00       	call   c0001aee <hd_handle>
c0001acf:	83 c4 10             	add    $0x10,%esp
c0001ad2:	eb f0                	jmp    c0001ac4 <TaskHD+0x23>

c0001ad4 <init_hd>:
c0001ad4:	55                   	push   %ebp
c0001ad5:	89 e5                	mov    %esp,%ebp
c0001ad7:	83 ec 18             	sub    $0x18,%esp
c0001ada:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001ae1:	e8 62 fd ff ff       	call   c0001848 <enable_8259A_casecade_irq>
c0001ae6:	e8 71 fd ff ff       	call   c000185c <enable_8259A_slave_winchester_irq>
c0001aeb:	90                   	nop
c0001aec:	c9                   	leave  
c0001aed:	c3                   	ret    

c0001aee <hd_handle>:
c0001aee:	55                   	push   %ebp
c0001aef:	89 e5                	mov    %esp,%ebp
c0001af1:	83 ec 18             	sub    $0x18,%esp
c0001af4:	83 ec 04             	sub    $0x4,%esp
c0001af7:	6a 0e                	push   $0xe
c0001af9:	ff 75 08             	pushl  0x8(%ebp)
c0001afc:	6a 02                	push   $0x2
c0001afe:	e8 91 7e 00 00       	call   c0009994 <send_rec>
c0001b03:	83 c4 10             	add    $0x10,%esp
c0001b06:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b09:	8b 40 68             	mov    0x68(%eax),%eax
c0001b0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001b0f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001b13:	0f 84 cc 00 00 00    	je     c0001be5 <hd_handle+0xf7>
c0001b19:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b1c:	8b 00                	mov    (%eax),%eax
c0001b1e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b21:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b25:	74 2b                	je     c0001b52 <hd_handle+0x64>
c0001b27:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b2b:	74 25                	je     c0001b52 <hd_handle+0x64>
c0001b2d:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b31:	74 1f                	je     c0001b52 <hd_handle+0x64>
c0001b33:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001b37:	74 19                	je     c0001b52 <hd_handle+0x64>
c0001b39:	6a 69                	push   $0x69
c0001b3b:	68 54 a3 00 c0       	push   $0xc000a354
c0001b40:	68 54 a3 00 c0       	push   $0xc000a354
c0001b45:	68 5c a3 00 c0       	push   $0xc000a35c
c0001b4a:	e8 24 76 00 00       	call   c0009173 <assertion_failure>
c0001b4f:	83 c4 10             	add    $0x10,%esp
c0001b52:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b56:	74 23                	je     c0001b7b <hd_handle+0x8d>
c0001b58:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b5c:	77 08                	ja     c0001b66 <hd_handle+0x78>
c0001b5e:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b62:	74 10                	je     c0001b74 <hd_handle+0x86>
c0001b64:	eb 34                	jmp    c0001b9a <hd_handle+0xac>
c0001b66:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b6a:	74 0f                	je     c0001b7b <hd_handle+0x8d>
c0001b6c:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001b70:	74 19                	je     c0001b8b <hd_handle+0x9d>
c0001b72:	eb 26                	jmp    c0001b9a <hd_handle+0xac>
c0001b74:	e8 1b 07 00 00       	call   c0002294 <hd_open>
c0001b79:	eb 30                	jmp    c0001bab <hd_handle+0xbd>
c0001b7b:	83 ec 0c             	sub    $0xc,%esp
c0001b7e:	ff 75 08             	pushl  0x8(%ebp)
c0001b81:	e8 38 08 00 00       	call   c00023be <hd_rdwt>
c0001b86:	83 c4 10             	add    $0x10,%esp
c0001b89:	eb 20                	jmp    c0001bab <hd_handle+0xbd>
c0001b8b:	83 ec 0c             	sub    $0xc,%esp
c0001b8e:	6a 00                	push   $0x0
c0001b90:	e8 4e 07 00 00       	call   c00022e3 <get_hd_ioctl>
c0001b95:	83 c4 10             	add    $0x10,%esp
c0001b98:	eb 11                	jmp    c0001bab <hd_handle+0xbd>
c0001b9a:	83 ec 0c             	sub    $0xc,%esp
c0001b9d:	68 a2 a3 00 c0       	push   $0xc000a3a2
c0001ba2:	e8 88 75 00 00       	call   c000912f <spin>
c0001ba7:	83 c4 10             	add    $0x10,%esp
c0001baa:	90                   	nop
c0001bab:	83 ec 04             	sub    $0x4,%esp
c0001bae:	6a 6c                	push   $0x6c
c0001bb0:	6a 00                	push   $0x0
c0001bb2:	ff 75 08             	pushl  0x8(%ebp)
c0001bb5:	e8 e9 92 00 00       	call   c000aea3 <Memset>
c0001bba:	83 c4 10             	add    $0x10,%esp
c0001bbd:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bc0:	c7 40 68 64 00 00 00 	movl   $0x64,0x68(%eax)
c0001bc7:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bca:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001bd1:	83 ec 04             	sub    $0x4,%esp
c0001bd4:	6a 04                	push   $0x4
c0001bd6:	ff 75 08             	pushl  0x8(%ebp)
c0001bd9:	6a 01                	push   $0x1
c0001bdb:	e8 b4 7d 00 00       	call   c0009994 <send_rec>
c0001be0:	83 c4 10             	add    $0x10,%esp
c0001be3:	eb 01                	jmp    c0001be6 <hd_handle+0xf8>
c0001be5:	90                   	nop
c0001be6:	c9                   	leave  
c0001be7:	c3                   	ret    

c0001be8 <hd_cmd_out>:
c0001be8:	55                   	push   %ebp
c0001be9:	89 e5                	mov    %esp,%ebp
c0001beb:	83 ec 08             	sub    $0x8,%esp
c0001bee:	83 ec 04             	sub    $0x4,%esp
c0001bf1:	68 18 73 01 00       	push   $0x17318
c0001bf6:	6a 00                	push   $0x0
c0001bf8:	68 80 00 00 00       	push   $0x80
c0001bfd:	e8 47 0a 00 00       	call   c0002649 <waitfor>
c0001c02:	83 c4 10             	add    $0x10,%esp
c0001c05:	85 c0                	test   %eax,%eax
c0001c07:	75 10                	jne    c0001c19 <hd_cmd_out+0x31>
c0001c09:	83 ec 0c             	sub    $0xc,%esp
c0001c0c:	68 b4 a3 00 c0       	push   $0xc000a3b4
c0001c11:	e8 3f 75 00 00       	call   c0009155 <panic>
c0001c16:	83 c4 10             	add    $0x10,%esp
c0001c19:	83 ec 08             	sub    $0x8,%esp
c0001c1c:	6a 00                	push   $0x0
c0001c1e:	68 f6 03 00 00       	push   $0x3f6
c0001c23:	e8 66 fb ff ff       	call   c000178e <out_byte>
c0001c28:	83 c4 10             	add    $0x10,%esp
c0001c2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c2e:	0f b6 00             	movzbl (%eax),%eax
c0001c31:	0f b6 c0             	movzbl %al,%eax
c0001c34:	83 ec 08             	sub    $0x8,%esp
c0001c37:	50                   	push   %eax
c0001c38:	68 f1 01 00 00       	push   $0x1f1
c0001c3d:	e8 4c fb ff ff       	call   c000178e <out_byte>
c0001c42:	83 c4 10             	add    $0x10,%esp
c0001c45:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c48:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001c4c:	0f b6 c0             	movzbl %al,%eax
c0001c4f:	83 ec 08             	sub    $0x8,%esp
c0001c52:	50                   	push   %eax
c0001c53:	68 f2 01 00 00       	push   $0x1f2
c0001c58:	e8 31 fb ff ff       	call   c000178e <out_byte>
c0001c5d:	83 c4 10             	add    $0x10,%esp
c0001c60:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c63:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001c67:	0f b6 c0             	movzbl %al,%eax
c0001c6a:	83 ec 08             	sub    $0x8,%esp
c0001c6d:	50                   	push   %eax
c0001c6e:	68 f3 01 00 00       	push   $0x1f3
c0001c73:	e8 16 fb ff ff       	call   c000178e <out_byte>
c0001c78:	83 c4 10             	add    $0x10,%esp
c0001c7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c7e:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001c82:	0f b6 c0             	movzbl %al,%eax
c0001c85:	83 ec 08             	sub    $0x8,%esp
c0001c88:	50                   	push   %eax
c0001c89:	68 f4 01 00 00       	push   $0x1f4
c0001c8e:	e8 fb fa ff ff       	call   c000178e <out_byte>
c0001c93:	83 c4 10             	add    $0x10,%esp
c0001c96:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c99:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001c9d:	0f b6 c0             	movzbl %al,%eax
c0001ca0:	83 ec 08             	sub    $0x8,%esp
c0001ca3:	50                   	push   %eax
c0001ca4:	68 f5 01 00 00       	push   $0x1f5
c0001ca9:	e8 e0 fa ff ff       	call   c000178e <out_byte>
c0001cae:	83 c4 10             	add    $0x10,%esp
c0001cb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cb4:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001cb8:	0f b6 c0             	movzbl %al,%eax
c0001cbb:	83 ec 08             	sub    $0x8,%esp
c0001cbe:	50                   	push   %eax
c0001cbf:	68 f6 01 00 00       	push   $0x1f6
c0001cc4:	e8 c5 fa ff ff       	call   c000178e <out_byte>
c0001cc9:	83 c4 10             	add    $0x10,%esp
c0001ccc:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ccf:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001cd3:	0f b6 c0             	movzbl %al,%eax
c0001cd6:	83 ec 08             	sub    $0x8,%esp
c0001cd9:	50                   	push   %eax
c0001cda:	68 f7 01 00 00       	push   $0x1f7
c0001cdf:	e8 aa fa ff ff       	call   c000178e <out_byte>
c0001ce4:	83 c4 10             	add    $0x10,%esp
c0001ce7:	90                   	nop
c0001ce8:	c9                   	leave  
c0001ce9:	c3                   	ret    

c0001cea <hd_identify>:
c0001cea:	55                   	push   %ebp
c0001ceb:	89 e5                	mov    %esp,%ebp
c0001ced:	53                   	push   %ebx
c0001cee:	83 ec 24             	sub    $0x24,%esp
c0001cf1:	89 e0                	mov    %esp,%eax
c0001cf3:	89 c3                	mov    %eax,%ebx
c0001cf5:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001cf9:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001cfd:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001d01:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001d05:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001d09:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d0c:	c1 e0 04             	shl    $0x4,%eax
c0001d0f:	83 c8 e0             	or     $0xffffffe0,%eax
c0001d12:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001d15:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001d19:	83 ec 0c             	sub    $0xc,%esp
c0001d1c:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001d1f:	50                   	push   %eax
c0001d20:	e8 c3 fe ff ff       	call   c0001be8 <hd_cmd_out>
c0001d25:	83 c4 10             	add    $0x10,%esp
c0001d28:	e8 40 06 00 00       	call   c000236d <interrupt_wait>
c0001d2d:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001d34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d37:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001d3a:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001d3d:	89 c2                	mov    %eax,%edx
c0001d3f:	b8 10 00 00 00       	mov    $0x10,%eax
c0001d44:	83 e8 01             	sub    $0x1,%eax
c0001d47:	01 d0                	add    %edx,%eax
c0001d49:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001d4e:	ba 00 00 00 00       	mov    $0x0,%edx
c0001d53:	f7 f1                	div    %ecx
c0001d55:	6b c0 10             	imul   $0x10,%eax,%eax
c0001d58:	29 c4                	sub    %eax,%esp
c0001d5a:	89 e0                	mov    %esp,%eax
c0001d5c:	83 c0 00             	add    $0x0,%eax
c0001d5f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001d62:	83 ec 04             	sub    $0x4,%esp
c0001d65:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d68:	6a 00                	push   $0x0
c0001d6a:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d6d:	e8 31 91 00 00       	call   c000aea3 <Memset>
c0001d72:	83 c4 10             	add    $0x10,%esp
c0001d75:	83 ec 04             	sub    $0x4,%esp
c0001d78:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d7b:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d7e:	68 f0 01 00 00       	push   $0x1f0
c0001d83:	e8 6f 91 00 00       	call   c000aef7 <read_port>
c0001d88:	83 c4 10             	add    $0x10,%esp
c0001d8b:	83 ec 0c             	sub    $0xc,%esp
c0001d8e:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d91:	e8 0b 00 00 00       	call   c0001da1 <print_hdinfo>
c0001d96:	83 c4 10             	add    $0x10,%esp
c0001d99:	89 dc                	mov    %ebx,%esp
c0001d9b:	90                   	nop
c0001d9c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001d9f:	c9                   	leave  
c0001da0:	c3                   	ret    

c0001da1 <print_hdinfo>:
c0001da1:	55                   	push   %ebp
c0001da2:	89 e5                	mov    %esp,%ebp
c0001da4:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001daa:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001db0:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001db6:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001dbd:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001dc4:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001dcb:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001dd2:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001dd9:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001ddf:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001de5:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001dec:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001df3:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001dfa:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001e01:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001e08:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001e0f:	e9 8f 00 00 00       	jmp    c0001ea3 <print_hdinfo+0x102>
c0001e14:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001e1b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e1e:	89 d0                	mov    %edx,%eax
c0001e20:	01 c0                	add    %eax,%eax
c0001e22:	01 d0                	add    %edx,%eax
c0001e24:	c1 e0 03             	shl    $0x3,%eax
c0001e27:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001e2a:	01 c8                	add    %ecx,%eax
c0001e2c:	83 e8 44             	sub    $0x44,%eax
c0001e2f:	0f b7 00             	movzwl (%eax),%eax
c0001e32:	0f b7 c0             	movzwl %ax,%eax
c0001e35:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001e38:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e3b:	01 d0                	add    %edx,%eax
c0001e3d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001e40:	eb 30                	jmp    c0001e72 <print_hdinfo+0xd1>
c0001e42:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e45:	8d 50 01             	lea    0x1(%eax),%edx
c0001e48:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e4b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e4e:	83 c2 01             	add    $0x1,%edx
c0001e51:	0f b6 00             	movzbl (%eax),%eax
c0001e54:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001e58:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e5b:	8d 50 01             	lea    0x1(%eax),%edx
c0001e5e:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e61:	0f b6 00             	movzbl (%eax),%eax
c0001e64:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001e67:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e6a:	01 ca                	add    %ecx,%edx
c0001e6c:	88 02                	mov    %al,(%edx)
c0001e6e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001e72:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e75:	89 d0                	mov    %edx,%eax
c0001e77:	01 c0                	add    %eax,%eax
c0001e79:	01 d0                	add    %edx,%eax
c0001e7b:	c1 e0 03             	shl    $0x3,%eax
c0001e7e:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001e81:	01 c8                	add    %ecx,%eax
c0001e83:	83 e8 42             	sub    $0x42,%eax
c0001e86:	0f b7 00             	movzwl (%eax),%eax
c0001e89:	66 d1 e8             	shr    %ax
c0001e8c:	0f b7 c0             	movzwl %ax,%eax
c0001e8f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001e92:	7c ae                	jl     c0001e42 <print_hdinfo+0xa1>
c0001e94:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001e97:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001e9a:	01 d0                	add    %edx,%eax
c0001e9c:	c6 00 00             	movb   $0x0,(%eax)
c0001e9f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001ea3:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001ea7:	0f 8e 67 ff ff ff    	jle    c0001e14 <print_hdinfo+0x73>
c0001ead:	8b 45 08             	mov    0x8(%ebp),%eax
c0001eb0:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001eb4:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001eb8:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001ebc:	66 c1 e8 08          	shr    $0x8,%ax
c0001ec0:	66 85 c0             	test   %ax,%ax
c0001ec3:	0f 95 c0             	setne  %al
c0001ec6:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001ec9:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001ed0:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001ed6:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001eda:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001ede:	75 15                	jne    c0001ef5 <print_hdinfo+0x154>
c0001ee0:	83 ec 08             	sub    $0x8,%esp
c0001ee3:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001ee6:	50                   	push   %eax
c0001ee7:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001eea:	50                   	push   %eax
c0001eeb:	e8 d2 8f 00 00       	call   c000aec2 <Strcpy>
c0001ef0:	83 c4 10             	add    $0x10,%esp
c0001ef3:	eb 13                	jmp    c0001f08 <print_hdinfo+0x167>
c0001ef5:	83 ec 08             	sub    $0x8,%esp
c0001ef8:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001efb:	50                   	push   %eax
c0001efc:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001eff:	50                   	push   %eax
c0001f00:	e8 bd 8f 00 00       	call   c000aec2 <Strcpy>
c0001f05:	83 c4 10             	add    $0x10,%esp
c0001f08:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f0b:	83 c0 7a             	add    $0x7a,%eax
c0001f0e:	0f b7 00             	movzwl (%eax),%eax
c0001f11:	0f b7 d0             	movzwl %ax,%edx
c0001f14:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f17:	83 c0 78             	add    $0x78,%eax
c0001f1a:	0f b7 00             	movzwl (%eax),%eax
c0001f1d:	0f b7 c0             	movzwl %ax,%eax
c0001f20:	83 c0 10             	add    $0x10,%eax
c0001f23:	89 c1                	mov    %eax,%ecx
c0001f25:	d3 e2                	shl    %cl,%edx
c0001f27:	89 d0                	mov    %edx,%eax
c0001f29:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001f2c:	90                   	nop
c0001f2d:	c9                   	leave  
c0001f2e:	c3                   	ret    

c0001f2f <print_dpt_entry>:
c0001f2f:	55                   	push   %ebp
c0001f30:	89 e5                	mov    %esp,%ebp
c0001f32:	83 ec 08             	sub    $0x8,%esp
c0001f35:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f38:	8b 40 08             	mov    0x8(%eax),%eax
c0001f3b:	83 ec 08             	sub    $0x8,%esp
c0001f3e:	50                   	push   %eax
c0001f3f:	68 be a3 00 c0       	push   $0xc000a3be
c0001f44:	e8 b6 6e 00 00       	call   c0008dff <Printf>
c0001f49:	83 c4 10             	add    $0x10,%esp
c0001f4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f4f:	8b 40 0c             	mov    0xc(%eax),%eax
c0001f52:	83 ec 08             	sub    $0x8,%esp
c0001f55:	50                   	push   %eax
c0001f56:	68 c6 a3 00 c0       	push   $0xc000a3c6
c0001f5b:	e8 9f 6e 00 00       	call   c0008dff <Printf>
c0001f60:	83 c4 10             	add    $0x10,%esp
c0001f63:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f66:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001f6a:	0f b6 c0             	movzbl %al,%eax
c0001f6d:	83 ec 08             	sub    $0x8,%esp
c0001f70:	50                   	push   %eax
c0001f71:	68 d7 a3 00 c0       	push   $0xc000a3d7
c0001f76:	e8 84 6e 00 00       	call   c0008dff <Printf>
c0001f7b:	83 c4 10             	add    $0x10,%esp
c0001f7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f81:	0f b6 00             	movzbl (%eax),%eax
c0001f84:	0f b6 c0             	movzbl %al,%eax
c0001f87:	83 ec 08             	sub    $0x8,%esp
c0001f8a:	50                   	push   %eax
c0001f8b:	68 e5 a3 00 c0       	push   $0xc000a3e5
c0001f90:	e8 6a 6e 00 00       	call   c0008dff <Printf>
c0001f95:	83 c4 10             	add    $0x10,%esp
c0001f98:	90                   	nop
c0001f99:	c9                   	leave  
c0001f9a:	c3                   	ret    

c0001f9b <get_partition_table>:
c0001f9b:	55                   	push   %ebp
c0001f9c:	89 e5                	mov    %esp,%ebp
c0001f9e:	53                   	push   %ebx
c0001f9f:	83 ec 24             	sub    $0x24,%esp
c0001fa2:	89 e0                	mov    %esp,%eax
c0001fa4:	89 c3                	mov    %eax,%ebx
c0001fa6:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001faa:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001fae:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fb1:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001fb4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fb7:	c1 f8 08             	sar    $0x8,%eax
c0001fba:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001fbd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fc0:	c1 f8 10             	sar    $0x10,%eax
c0001fc3:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001fc6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fc9:	c1 f8 18             	sar    $0x18,%eax
c0001fcc:	89 c2                	mov    %eax,%edx
c0001fce:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fd1:	c1 e0 04             	shl    $0x4,%eax
c0001fd4:	09 d0                	or     %edx,%eax
c0001fd6:	83 c8 e0             	or     $0xffffffe0,%eax
c0001fd9:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001fdc:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0001fe0:	83 ec 0c             	sub    $0xc,%esp
c0001fe3:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0001fe6:	50                   	push   %eax
c0001fe7:	e8 fc fb ff ff       	call   c0001be8 <hd_cmd_out>
c0001fec:	83 c4 10             	add    $0x10,%esp
c0001fef:	e8 79 03 00 00       	call   c000236d <interrupt_wait>
c0001ff4:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001ffb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001ffe:	8d 50 ff             	lea    -0x1(%eax),%edx
c0002001:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0002004:	89 c2                	mov    %eax,%edx
c0002006:	b8 10 00 00 00       	mov    $0x10,%eax
c000200b:	83 e8 01             	sub    $0x1,%eax
c000200e:	01 d0                	add    %edx,%eax
c0002010:	b9 10 00 00 00       	mov    $0x10,%ecx
c0002015:	ba 00 00 00 00       	mov    $0x0,%edx
c000201a:	f7 f1                	div    %ecx
c000201c:	6b c0 10             	imul   $0x10,%eax,%eax
c000201f:	29 c4                	sub    %eax,%esp
c0002021:	89 e0                	mov    %esp,%eax
c0002023:	83 c0 00             	add    $0x0,%eax
c0002026:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002029:	83 ec 04             	sub    $0x4,%esp
c000202c:	ff 75 f4             	pushl  -0xc(%ebp)
c000202f:	6a 00                	push   $0x0
c0002031:	ff 75 ec             	pushl  -0x14(%ebp)
c0002034:	e8 6a 8e 00 00       	call   c000aea3 <Memset>
c0002039:	83 c4 10             	add    $0x10,%esp
c000203c:	83 ec 04             	sub    $0x4,%esp
c000203f:	ff 75 f4             	pushl  -0xc(%ebp)
c0002042:	ff 75 ec             	pushl  -0x14(%ebp)
c0002045:	68 f0 01 00 00       	push   $0x1f0
c000204a:	e8 a8 8e 00 00       	call   c000aef7 <read_port>
c000204f:	83 c4 10             	add    $0x10,%esp
c0002052:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002055:	05 be 01 00 00       	add    $0x1be,%eax
c000205a:	83 ec 04             	sub    $0x4,%esp
c000205d:	6a 40                	push   $0x40
c000205f:	50                   	push   %eax
c0002060:	ff 75 10             	pushl  0x10(%ebp)
c0002063:	e8 0d 8e 00 00       	call   c000ae75 <Memcpy>
c0002068:	83 c4 10             	add    $0x10,%esp
c000206b:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0002072:	89 dc                	mov    %ebx,%esp
c0002074:	90                   	nop
c0002075:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0002078:	c9                   	leave  
c0002079:	c3                   	ret    

c000207a <partition>:
c000207a:	55                   	push   %ebp
c000207b:	89 e5                	mov    %esp,%ebp
c000207d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0002083:	8b 45 0c             	mov    0xc(%ebp),%eax
c0002086:	88 45 84             	mov    %al,-0x7c(%ebp)
c0002089:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c000208d:	7f 19                	jg     c00020a8 <partition+0x2e>
c000208f:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002092:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002097:	89 c8                	mov    %ecx,%eax
c0002099:	f7 ea                	imul   %edx
c000209b:	d1 fa                	sar    %edx
c000209d:	89 c8                	mov    %ecx,%eax
c000209f:	c1 f8 1f             	sar    $0x1f,%eax
c00020a2:	29 c2                	sub    %eax,%edx
c00020a4:	89 d0                	mov    %edx,%eax
c00020a6:	eb 11                	jmp    c00020b9 <partition+0x3f>
c00020a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00020ab:	83 e8 10             	sub    $0x10,%eax
c00020ae:	8d 50 3f             	lea    0x3f(%eax),%edx
c00020b1:	85 c0                	test   %eax,%eax
c00020b3:	0f 48 c2             	cmovs  %edx,%eax
c00020b6:	c1 f8 06             	sar    $0x6,%eax
c00020b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00020bc:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c00020c0:	0f 85 cc 00 00 00    	jne    c0002192 <partition+0x118>
c00020c6:	83 ec 04             	sub    $0x4,%esp
c00020c9:	6a 40                	push   $0x40
c00020cb:	6a 00                	push   $0x0
c00020cd:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00020d0:	50                   	push   %eax
c00020d1:	e8 cd 8d 00 00       	call   c000aea3 <Memset>
c00020d6:	83 c4 10             	add    $0x10,%esp
c00020d9:	83 ec 04             	sub    $0x4,%esp
c00020dc:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00020df:	50                   	push   %eax
c00020e0:	6a 00                	push   $0x0
c00020e2:	ff 75 e8             	pushl  -0x18(%ebp)
c00020e5:	e8 b1 fe ff ff       	call   c0001f9b <get_partition_table>
c00020ea:	83 c4 10             	add    $0x10,%esp
c00020ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00020f4:	e9 8a 00 00 00       	jmp    c0002183 <partition+0x109>
c00020f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00020fc:	83 c0 01             	add    $0x1,%eax
c00020ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002102:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002105:	c1 e0 04             	shl    $0x4,%eax
c0002108:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000210b:	01 c8                	add    %ecx,%eax
c000210d:	83 e8 5c             	sub    $0x5c,%eax
c0002110:	8b 00                	mov    (%eax),%eax
c0002112:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0002115:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002118:	c1 e1 03             	shl    $0x3,%ecx
c000211b:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002121:	01 ca                	add    %ecx,%edx
c0002123:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c0002129:	89 02                	mov    %eax,(%edx)
c000212b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000212e:	c1 e0 04             	shl    $0x4,%eax
c0002131:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002134:	01 c8                	add    %ecx,%eax
c0002136:	83 e8 58             	sub    $0x58,%eax
c0002139:	8b 00                	mov    (%eax),%eax
c000213b:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c000213e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002141:	c1 e1 03             	shl    $0x3,%ecx
c0002144:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000214a:	01 ca                	add    %ecx,%edx
c000214c:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0002152:	89 02                	mov    %eax,(%edx)
c0002154:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002157:	c1 e0 04             	shl    $0x4,%eax
c000215a:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000215d:	01 c8                	add    %ecx,%eax
c000215f:	83 e8 60             	sub    $0x60,%eax
c0002162:	0f b6 00             	movzbl (%eax),%eax
c0002165:	3c 05                	cmp    $0x5,%al
c0002167:	75 16                	jne    c000217f <partition+0x105>
c0002169:	8b 55 08             	mov    0x8(%ebp),%edx
c000216c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000216f:	01 d0                	add    %edx,%eax
c0002171:	83 ec 08             	sub    $0x8,%esp
c0002174:	6a 01                	push   $0x1
c0002176:	50                   	push   %eax
c0002177:	e8 fe fe ff ff       	call   c000207a <partition>
c000217c:	83 c4 10             	add    $0x10,%esp
c000217f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002183:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002187:	0f 8e 6c ff ff ff    	jle    c00020f9 <partition+0x7f>
c000218d:	e9 ff 00 00 00       	jmp    c0002291 <partition+0x217>
c0002192:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c0002196:	0f 85 f5 00 00 00    	jne    c0002291 <partition+0x217>
c000219c:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000219f:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00021a4:	89 c8                	mov    %ecx,%eax
c00021a6:	f7 ea                	imul   %edx
c00021a8:	d1 fa                	sar    %edx
c00021aa:	89 c8                	mov    %ecx,%eax
c00021ac:	c1 f8 1f             	sar    $0x1f,%eax
c00021af:	29 c2                	sub    %eax,%edx
c00021b1:	89 d0                	mov    %edx,%eax
c00021b3:	c1 e0 02             	shl    $0x2,%eax
c00021b6:	01 d0                	add    %edx,%eax
c00021b8:	29 c1                	sub    %eax,%ecx
c00021ba:	89 c8                	mov    %ecx,%eax
c00021bc:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00021bf:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00021c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00021c5:	c1 e2 03             	shl    $0x3,%edx
c00021c8:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00021ce:	01 d0                	add    %edx,%eax
c00021d0:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00021d5:	8b 00                	mov    (%eax),%eax
c00021d7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00021da:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00021dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00021e0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00021e3:	83 e8 01             	sub    $0x1,%eax
c00021e6:	c1 e0 04             	shl    $0x4,%eax
c00021e9:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00021ec:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00021f3:	e9 8c 00 00 00       	jmp    c0002284 <partition+0x20a>
c00021f8:	83 ec 04             	sub    $0x4,%esp
c00021fb:	6a 40                	push   $0x40
c00021fd:	6a 00                	push   $0x0
c00021ff:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002202:	50                   	push   %eax
c0002203:	e8 9b 8c 00 00       	call   c000aea3 <Memset>
c0002208:	83 c4 10             	add    $0x10,%esp
c000220b:	83 ec 04             	sub    $0x4,%esp
c000220e:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002211:	50                   	push   %eax
c0002212:	ff 75 f0             	pushl  -0x10(%ebp)
c0002215:	ff 75 e8             	pushl  -0x18(%ebp)
c0002218:	e8 7e fd ff ff       	call   c0001f9b <get_partition_table>
c000221d:	83 c4 10             	add    $0x10,%esp
c0002220:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002223:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002226:	01 d0                	add    %edx,%eax
c0002228:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000222b:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000222e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002231:	01 c2                	add    %eax,%edx
c0002233:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0002236:	8d 48 04             	lea    0x4(%eax),%ecx
c0002239:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000223c:	c1 e1 03             	shl    $0x3,%ecx
c000223f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002245:	01 c8                	add    %ecx,%eax
c0002247:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000224c:	89 10                	mov    %edx,(%eax)
c000224e:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002251:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0002254:	8d 4a 04             	lea    0x4(%edx),%ecx
c0002257:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000225a:	c1 e1 03             	shl    $0x3,%ecx
c000225d:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002263:	01 ca                	add    %ecx,%edx
c0002265:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c000226b:	89 02                	mov    %eax,(%edx)
c000226d:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0002271:	84 c0                	test   %al,%al
c0002273:	74 1b                	je     c0002290 <partition+0x216>
c0002275:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0002278:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000227b:	01 d0                	add    %edx,%eax
c000227d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002280:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002284:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c0002288:	0f 8e 6a ff ff ff    	jle    c00021f8 <partition+0x17e>
c000228e:	eb 01                	jmp    c0002291 <partition+0x217>
c0002290:	90                   	nop
c0002291:	90                   	nop
c0002292:	c9                   	leave  
c0002293:	c3                   	ret    

c0002294 <hd_open>:
c0002294:	55                   	push   %ebp
c0002295:	89 e5                	mov    %esp,%ebp
c0002297:	83 ec 18             	sub    $0x18,%esp
c000229a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00022a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022a4:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022aa:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c00022af:	8b 00                	mov    (%eax),%eax
c00022b1:	8d 50 01             	lea    0x1(%eax),%edx
c00022b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022b7:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022bd:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c00022c2:	89 10                	mov    %edx,(%eax)
c00022c4:	83 ec 0c             	sub    $0xc,%esp
c00022c7:	6a 00                	push   $0x0
c00022c9:	e8 1c fa ff ff       	call   c0001cea <hd_identify>
c00022ce:	83 c4 10             	add    $0x10,%esp
c00022d1:	83 ec 08             	sub    $0x8,%esp
c00022d4:	6a 00                	push   $0x0
c00022d6:	6a 00                	push   $0x0
c00022d8:	e8 9d fd ff ff       	call   c000207a <partition>
c00022dd:	83 c4 10             	add    $0x10,%esp
c00022e0:	90                   	nop
c00022e1:	c9                   	leave  
c00022e2:	c3                   	ret    

c00022e3 <get_hd_ioctl>:
c00022e3:	55                   	push   %ebp
c00022e4:	89 e5                	mov    %esp,%ebp
c00022e6:	83 ec 10             	sub    $0x10,%esp
c00022e9:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00022ed:	7f 19                	jg     c0002308 <get_hd_ioctl+0x25>
c00022ef:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00022f2:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00022f7:	89 c8                	mov    %ecx,%eax
c00022f9:	f7 ea                	imul   %edx
c00022fb:	d1 fa                	sar    %edx
c00022fd:	89 c8                	mov    %ecx,%eax
c00022ff:	c1 f8 1f             	sar    $0x1f,%eax
c0002302:	29 c2                	sub    %eax,%edx
c0002304:	89 d0                	mov    %edx,%eax
c0002306:	eb 11                	jmp    c0002319 <get_hd_ioctl+0x36>
c0002308:	8b 45 08             	mov    0x8(%ebp),%eax
c000230b:	83 e8 10             	sub    $0x10,%eax
c000230e:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002311:	85 c0                	test   %eax,%eax
c0002313:	0f 48 c2             	cmovs  %edx,%eax
c0002316:	c1 f8 06             	sar    $0x6,%eax
c0002319:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000231c:	8b 55 08             	mov    0x8(%ebp),%edx
c000231f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0002322:	c1 e2 03             	shl    $0x3,%edx
c0002325:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000232b:	01 d0                	add    %edx,%eax
c000232d:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c0002332:	8b 00                	mov    (%eax),%eax
c0002334:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0002337:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000233a:	c9                   	leave  
c000233b:	c3                   	ret    

c000233c <wait_for>:
c000233c:	55                   	push   %ebp
c000233d:	89 e5                	mov    %esp,%ebp
c000233f:	83 ec 08             	sub    $0x8,%esp
c0002342:	83 ec 04             	sub    $0x4,%esp
c0002345:	68 20 4e 00 00       	push   $0x4e20
c000234a:	6a 08                	push   $0x8
c000234c:	6a 08                	push   $0x8
c000234e:	e8 f6 02 00 00       	call   c0002649 <waitfor>
c0002353:	83 c4 10             	add    $0x10,%esp
c0002356:	85 c0                	test   %eax,%eax
c0002358:	75 10                	jne    c000236a <wait_for+0x2e>
c000235a:	83 ec 0c             	sub    $0xc,%esp
c000235d:	68 f0 a3 00 c0       	push   $0xc000a3f0
c0002362:	e8 ee 6d 00 00       	call   c0009155 <panic>
c0002367:	83 c4 10             	add    $0x10,%esp
c000236a:	90                   	nop
c000236b:	c9                   	leave  
c000236c:	c3                   	ret    

c000236d <interrupt_wait>:
c000236d:	55                   	push   %ebp
c000236e:	89 e5                	mov    %esp,%ebp
c0002370:	83 ec 18             	sub    $0x18,%esp
c0002373:	83 ec 0c             	sub    $0xc,%esp
c0002376:	6a 6c                	push   $0x6c
c0002378:	e8 4b 4a 00 00       	call   c0006dc8 <sys_malloc>
c000237d:	83 c4 10             	add    $0x10,%esp
c0002380:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002383:	83 ec 04             	sub    $0x4,%esp
c0002386:	6a 6c                	push   $0x6c
c0002388:	6a 00                	push   $0x0
c000238a:	ff 75 f4             	pushl  -0xc(%ebp)
c000238d:	e8 11 8b 00 00       	call   c000aea3 <Memset>
c0002392:	83 c4 10             	add    $0x10,%esp
c0002395:	83 ec 04             	sub    $0x4,%esp
c0002398:	68 13 02 00 00       	push   $0x213
c000239d:	ff 75 f4             	pushl  -0xc(%ebp)
c00023a0:	6a 02                	push   $0x2
c00023a2:	e8 ed 75 00 00       	call   c0009994 <send_rec>
c00023a7:	83 c4 10             	add    $0x10,%esp
c00023aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023ad:	83 ec 08             	sub    $0x8,%esp
c00023b0:	6a 6c                	push   $0x6c
c00023b2:	50                   	push   %eax
c00023b3:	e8 ef 4c 00 00       	call   c00070a7 <sys_free>
c00023b8:	83 c4 10             	add    $0x10,%esp
c00023bb:	90                   	nop
c00023bc:	c9                   	leave  
c00023bd:	c3                   	ret    

c00023be <hd_rdwt>:
c00023be:	55                   	push   %ebp
c00023bf:	89 e5                	mov    %esp,%ebp
c00023c1:	83 ec 48             	sub    $0x48,%esp
c00023c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00023c7:	8b 40 18             	mov    0x18(%eax),%eax
c00023ca:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00023cd:	8b 45 08             	mov    0x8(%ebp),%eax
c00023d0:	8b 40 14             	mov    0x14(%eax),%eax
c00023d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00023d6:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00023da:	7f 19                	jg     c00023f5 <hd_rdwt+0x37>
c00023dc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c00023df:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00023e4:	89 c8                	mov    %ecx,%eax
c00023e6:	f7 ea                	imul   %edx
c00023e8:	d1 fa                	sar    %edx
c00023ea:	89 c8                	mov    %ecx,%eax
c00023ec:	c1 f8 1f             	sar    $0x1f,%eax
c00023ef:	29 c2                	sub    %eax,%edx
c00023f1:	89 d0                	mov    %edx,%eax
c00023f3:	eb 11                	jmp    c0002406 <hd_rdwt+0x48>
c00023f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00023f8:	83 e8 10             	sub    $0x10,%eax
c00023fb:	8d 50 3f             	lea    0x3f(%eax),%edx
c00023fe:	85 c0                	test   %eax,%eax
c0002400:	0f 48 c2             	cmovs  %edx,%eax
c0002403:	c1 f8 06             	sar    $0x6,%eax
c0002406:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002409:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000240c:	8d 50 f0             	lea    -0x10(%eax),%edx
c000240f:	89 d0                	mov    %edx,%eax
c0002411:	c1 f8 1f             	sar    $0x1f,%eax
c0002414:	c1 e8 1a             	shr    $0x1a,%eax
c0002417:	01 c2                	add    %eax,%edx
c0002419:	83 e2 3f             	and    $0x3f,%edx
c000241c:	29 c2                	sub    %eax,%edx
c000241e:	89 d0                	mov    %edx,%eax
c0002420:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002423:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002426:	c1 e8 09             	shr    $0x9,%eax
c0002429:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000242c:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002430:	7f 1a                	jg     c000244c <hd_rdwt+0x8e>
c0002432:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002435:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002438:	c1 e2 03             	shl    $0x3,%edx
c000243b:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002441:	01 d0                	add    %edx,%eax
c0002443:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002448:	8b 00                	mov    (%eax),%eax
c000244a:	eb 1b                	jmp    c0002467 <hd_rdwt+0xa9>
c000244c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000244f:	8d 50 04             	lea    0x4(%eax),%edx
c0002452:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002455:	c1 e2 03             	shl    $0x3,%edx
c0002458:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000245e:	01 d0                	add    %edx,%eax
c0002460:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002465:	8b 00                	mov    (%eax),%eax
c0002467:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000246a:	01 d0                	add    %edx,%eax
c000246c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000246f:	8b 45 08             	mov    0x8(%ebp),%eax
c0002472:	8b 40 0c             	mov    0xc(%eax),%eax
c0002475:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002478:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000247b:	05 ff 01 00 00       	add    $0x1ff,%eax
c0002480:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0002486:	85 c0                	test   %eax,%eax
c0002488:	0f 48 c2             	cmovs  %edx,%eax
c000248b:	c1 f8 09             	sar    $0x9,%eax
c000248e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0002491:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0002494:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002497:	8b 45 08             	mov    0x8(%ebp),%eax
c000249a:	8b 40 10             	mov    0x10(%eax),%eax
c000249d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00024a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00024a3:	8b 00                	mov    (%eax),%eax
c00024a5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00024a8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024ab:	83 ec 08             	sub    $0x8,%esp
c00024ae:	50                   	push   %eax
c00024af:	ff 75 d0             	pushl  -0x30(%ebp)
c00024b2:	e8 d0 47 00 00       	call   c0006c87 <alloc_virtual_memory>
c00024b7:	83 c4 10             	add    $0x10,%esp
c00024ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00024bd:	8b 45 08             	mov    0x8(%ebp),%eax
c00024c0:	8b 40 68             	mov    0x68(%eax),%eax
c00024c3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00024c6:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00024ca:	74 22                	je     c00024ee <hd_rdwt+0x130>
c00024cc:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00024d0:	74 1c                	je     c00024ee <hd_rdwt+0x130>
c00024d2:	68 a3 01 00 00       	push   $0x1a3
c00024d7:	68 54 a3 00 c0       	push   $0xc000a354
c00024dc:	68 54 a3 00 c0       	push   $0xc000a354
c00024e1:	68 02 a4 00 c0       	push   $0xc000a402
c00024e6:	e8 88 6c 00 00       	call   c0009173 <assertion_failure>
c00024eb:	83 c4 10             	add    $0x10,%esp
c00024ee:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c00024f2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00024f5:	88 45 be             	mov    %al,-0x42(%ebp)
c00024f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00024fb:	88 45 bf             	mov    %al,-0x41(%ebp)
c00024fe:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002501:	c1 f8 08             	sar    $0x8,%eax
c0002504:	88 45 c0             	mov    %al,-0x40(%ebp)
c0002507:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000250a:	c1 f8 10             	sar    $0x10,%eax
c000250d:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002510:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002513:	c1 f8 18             	sar    $0x18,%eax
c0002516:	83 e0 0f             	and    $0xf,%eax
c0002519:	83 c8 e0             	or     $0xffffffe0,%eax
c000251c:	88 45 c2             	mov    %al,-0x3e(%ebp)
c000251f:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002523:	75 07                	jne    c000252c <hd_rdwt+0x16e>
c0002525:	b8 20 00 00 00       	mov    $0x20,%eax
c000252a:	eb 05                	jmp    c0002531 <hd_rdwt+0x173>
c000252c:	b8 30 00 00 00       	mov    $0x30,%eax
c0002531:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0002534:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002538:	3c 20                	cmp    $0x20,%al
c000253a:	74 24                	je     c0002560 <hd_rdwt+0x1a2>
c000253c:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002540:	3c 30                	cmp    $0x30,%al
c0002542:	74 1c                	je     c0002560 <hd_rdwt+0x1a2>
c0002544:	68 b1 01 00 00       	push   $0x1b1
c0002549:	68 54 a3 00 c0       	push   $0xc000a354
c000254e:	68 54 a3 00 c0       	push   $0xc000a354
c0002553:	68 20 a4 00 c0       	push   $0xc000a420
c0002558:	e8 16 6c 00 00       	call   c0009173 <assertion_failure>
c000255d:	83 c4 10             	add    $0x10,%esp
c0002560:	83 ec 0c             	sub    $0xc,%esp
c0002563:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0002566:	50                   	push   %eax
c0002567:	e8 7c f6 ff ff       	call   c0001be8 <hd_cmd_out>
c000256c:	83 c4 10             	add    $0x10,%esp
c000256f:	e9 9c 00 00 00       	jmp    c0002610 <hd_rdwt+0x252>
c0002574:	b8 00 02 00 00       	mov    $0x200,%eax
c0002579:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c0002580:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c0002584:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0002587:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c000258b:	75 51                	jne    c00025de <hd_rdwt+0x220>
c000258d:	e8 aa fd ff ff       	call   c000233c <wait_for>
c0002592:	e8 d6 fd ff ff       	call   c000236d <interrupt_wait>
c0002597:	83 ec 04             	sub    $0x4,%esp
c000259a:	ff 75 c4             	pushl  -0x3c(%ebp)
c000259d:	6a 00                	push   $0x0
c000259f:	68 80 21 01 c0       	push   $0xc0012180
c00025a4:	e8 fa 88 00 00       	call   c000aea3 <Memset>
c00025a9:	83 c4 10             	add    $0x10,%esp
c00025ac:	83 ec 04             	sub    $0x4,%esp
c00025af:	68 00 02 00 00       	push   $0x200
c00025b4:	68 80 21 01 c0       	push   $0xc0012180
c00025b9:	68 f0 01 00 00       	push   $0x1f0
c00025be:	e8 34 89 00 00       	call   c000aef7 <read_port>
c00025c3:	83 c4 10             	add    $0x10,%esp
c00025c6:	83 ec 04             	sub    $0x4,%esp
c00025c9:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025cc:	68 80 21 01 c0       	push   $0xc0012180
c00025d1:	ff 75 f0             	pushl  -0x10(%ebp)
c00025d4:	e8 9c 88 00 00       	call   c000ae75 <Memcpy>
c00025d9:	83 c4 10             	add    $0x10,%esp
c00025dc:	eb 26                	jmp    c0002604 <hd_rdwt+0x246>
c00025de:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00025e2:	75 20                	jne    c0002604 <hd_rdwt+0x246>
c00025e4:	e8 53 fd ff ff       	call   c000233c <wait_for>
c00025e9:	83 ec 04             	sub    $0x4,%esp
c00025ec:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025ef:	ff 75 f0             	pushl  -0x10(%ebp)
c00025f2:	68 f0 01 00 00       	push   $0x1f0
c00025f7:	e8 0f 89 00 00       	call   c000af0b <write_port>
c00025fc:	83 c4 10             	add    $0x10,%esp
c00025ff:	e8 69 fd ff ff       	call   c000236d <interrupt_wait>
c0002604:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002607:	29 45 f4             	sub    %eax,-0xc(%ebp)
c000260a:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000260d:	01 45 f0             	add    %eax,-0x10(%ebp)
c0002610:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002614:	0f 85 5a ff ff ff    	jne    c0002574 <hd_rdwt+0x1b6>
c000261a:	90                   	nop
c000261b:	c9                   	leave  
c000261c:	c3                   	ret    

c000261d <hd_handler>:
c000261d:	55                   	push   %ebp
c000261e:	89 e5                	mov    %esp,%ebp
c0002620:	83 ec 18             	sub    $0x18,%esp
c0002623:	83 ec 0c             	sub    $0xc,%esp
c0002626:	68 f7 01 00 00       	push   $0x1f7
c000262b:	e8 52 f1 ff ff       	call   c0001782 <in_byte>
c0002630:	83 c4 10             	add    $0x10,%esp
c0002633:	0f b6 c0             	movzbl %al,%eax
c0002636:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002639:	83 ec 0c             	sub    $0xc,%esp
c000263c:	6a 03                	push   $0x3
c000263e:	e8 e0 75 00 00       	call   c0009c23 <inform_int>
c0002643:	83 c4 10             	add    $0x10,%esp
c0002646:	90                   	nop
c0002647:	c9                   	leave  
c0002648:	c3                   	ret    

c0002649 <waitfor>:
c0002649:	55                   	push   %ebp
c000264a:	89 e5                	mov    %esp,%ebp
c000264c:	83 ec 18             	sub    $0x18,%esp
c000264f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002656:	eb 26                	jmp    c000267e <waitfor+0x35>
c0002658:	83 ec 0c             	sub    $0xc,%esp
c000265b:	68 f7 01 00 00       	push   $0x1f7
c0002660:	e8 1d f1 ff ff       	call   c0001782 <in_byte>
c0002665:	83 c4 10             	add    $0x10,%esp
c0002668:	0f b6 c0             	movzbl %al,%eax
c000266b:	23 45 08             	and    0x8(%ebp),%eax
c000266e:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0002671:	75 07                	jne    c000267a <waitfor+0x31>
c0002673:	b8 01 00 00 00       	mov    $0x1,%eax
c0002678:	eb 11                	jmp    c000268b <waitfor+0x42>
c000267a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000267e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002681:	3b 45 10             	cmp    0x10(%ebp),%eax
c0002684:	7c d2                	jl     c0002658 <waitfor+0xf>
c0002686:	b8 00 00 00 00       	mov    $0x0,%eax
c000268b:	c9                   	leave  
c000268c:	c3                   	ret    

c000268d <print_hd_info>:
c000268d:	55                   	push   %ebp
c000268e:	89 e5                	mov    %esp,%ebp
c0002690:	83 ec 18             	sub    $0x18,%esp
c0002693:	83 ec 0c             	sub    $0xc,%esp
c0002696:	68 54 a4 00 c0       	push   $0xc000a454
c000269b:	e8 5f 67 00 00       	call   c0008dff <Printf>
c00026a0:	83 c4 10             	add    $0x10,%esp
c00026a3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00026aa:	eb 3b                	jmp    c00026e7 <print_hd_info+0x5a>
c00026ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026af:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00026b6:	85 c0                	test   %eax,%eax
c00026b8:	74 28                	je     c00026e2 <print_hd_info+0x55>
c00026ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026bd:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00026c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026c7:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00026ce:	ff 75 f4             	pushl  -0xc(%ebp)
c00026d1:	52                   	push   %edx
c00026d2:	50                   	push   %eax
c00026d3:	68 71 a4 00 c0       	push   $0xc000a471
c00026d8:	e8 22 67 00 00       	call   c0008dff <Printf>
c00026dd:	83 c4 10             	add    $0x10,%esp
c00026e0:	eb 01                	jmp    c00026e3 <print_hd_info+0x56>
c00026e2:	90                   	nop
c00026e3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00026e7:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c00026eb:	7e bf                	jle    c00026ac <print_hd_info+0x1f>
c00026ed:	83 ec 0c             	sub    $0xc,%esp
c00026f0:	68 89 a4 00 c0       	push   $0xc000a489
c00026f5:	e8 05 67 00 00       	call   c0008dff <Printf>
c00026fa:	83 c4 10             	add    $0x10,%esp
c00026fd:	83 ec 0c             	sub    $0xc,%esp
c0002700:	68 a4 a4 00 c0       	push   $0xc000a4a4
c0002705:	e8 f5 66 00 00       	call   c0008dff <Printf>
c000270a:	83 c4 10             	add    $0x10,%esp
c000270d:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0002714:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000271b:	eb 44                	jmp    c0002761 <print_hd_info+0xd4>
c000271d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002720:	83 c0 04             	add    $0x4,%eax
c0002723:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c000272a:	85 c0                	test   %eax,%eax
c000272c:	74 2e                	je     c000275c <print_hd_info+0xcf>
c000272e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002731:	83 c0 04             	add    $0x4,%eax
c0002734:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c000273b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000273e:	83 c0 04             	add    $0x4,%eax
c0002741:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c0002748:	ff 75 f0             	pushl  -0x10(%ebp)
c000274b:	52                   	push   %edx
c000274c:	50                   	push   %eax
c000274d:	68 71 a4 00 c0       	push   $0xc000a471
c0002752:	e8 a8 66 00 00       	call   c0008dff <Printf>
c0002757:	83 c4 10             	add    $0x10,%esp
c000275a:	eb 01                	jmp    c000275d <print_hd_info+0xd0>
c000275c:	90                   	nop
c000275d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002761:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0002765:	7e b6                	jle    c000271d <print_hd_info+0x90>
c0002767:	83 ec 0c             	sub    $0xc,%esp
c000276a:	68 c1 a4 00 c0       	push   $0xc000a4c1
c000276f:	e8 8b 66 00 00       	call   c0008dff <Printf>
c0002774:	83 c4 10             	add    $0x10,%esp
c0002777:	90                   	nop
c0002778:	c9                   	leave  
c0002779:	c3                   	ret    

c000277a <is_empty>:
c000277a:	55                   	push   %ebp
c000277b:	89 e5                	mov    %esp,%ebp
c000277d:	83 ec 10             	sub    $0x10,%esp
c0002780:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0002787:	eb 1a                	jmp    c00027a3 <is_empty+0x29>
c0002789:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000278c:	8b 45 08             	mov    0x8(%ebp),%eax
c000278f:	01 d0                	add    %edx,%eax
c0002791:	0f b6 00             	movzbl (%eax),%eax
c0002794:	84 c0                	test   %al,%al
c0002796:	74 07                	je     c000279f <is_empty+0x25>
c0002798:	b8 00 00 00 00       	mov    $0x0,%eax
c000279d:	eb 11                	jmp    c00027b0 <is_empty+0x36>
c000279f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00027a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00027a6:	3b 45 0c             	cmp    0xc(%ebp),%eax
c00027a9:	7c de                	jl     c0002789 <is_empty+0xf>
c00027ab:	b8 01 00 00 00       	mov    $0x1,%eax
c00027b0:	c9                   	leave  
c00027b1:	c3                   	ret    
c00027b2:	66 90                	xchg   %ax,%ax
c00027b4:	66 90                	xchg   %ax,%ax
c00027b6:	66 90                	xchg   %ax,%ax
c00027b8:	66 90                	xchg   %ax,%ax
c00027ba:	66 90                	xchg   %ax,%ax
c00027bc:	66 90                	xchg   %ax,%ax
c00027be:	66 90                	xchg   %ax,%ax

c00027c0 <get_ticks>:
c00027c0:	b8 00 00 00 00       	mov    $0x0,%eax
c00027c5:	cd 90                	int    $0x90
c00027c7:	c3                   	ret    

c00027c8 <write2>:
c00027c8:	b8 01 00 00 00       	mov    $0x1,%eax
c00027cd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00027d1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00027d5:	cd 90                	int    $0x90
c00027d7:	c3                   	ret    

c00027d8 <write_debug>:
c00027d8:	b8 02 00 00 00       	mov    $0x2,%eax
c00027dd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00027e1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00027e5:	cd 90                	int    $0x90
c00027e7:	c3                   	ret    

c00027e8 <send_msg2>:
c00027e8:	b8 03 00 00 00       	mov    $0x3,%eax
c00027ed:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00027f1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00027f5:	cd 90                	int    $0x90
c00027f7:	c3                   	ret    

c00027f8 <send_msg>:
c00027f8:	55                   	push   %ebp
c00027f9:	89 e5                	mov    %esp,%ebp
c00027fb:	53                   	push   %ebx
c00027fc:	51                   	push   %ecx
c00027fd:	b8 03 00 00 00       	mov    $0x3,%eax
c0002802:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002805:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002808:	cd 90                	int    $0x90
c000280a:	59                   	pop    %ecx
c000280b:	5b                   	pop    %ebx
c000280c:	5d                   	pop    %ebp
c000280d:	c3                   	ret    

c000280e <receive_msg2>:
c000280e:	b8 04 00 00 00       	mov    $0x4,%eax
c0002813:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002817:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000281b:	cd 90                	int    $0x90
c000281d:	c3                   	ret    

c000281e <receive_msg>:
c000281e:	55                   	push   %ebp
c000281f:	89 e5                	mov    %esp,%ebp
c0002821:	53                   	push   %ebx
c0002822:	51                   	push   %ecx
c0002823:	b8 04 00 00 00       	mov    $0x4,%eax
c0002828:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000282b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000282e:	cd 90                	int    $0x90
c0002830:	59                   	pop    %ecx
c0002831:	5b                   	pop    %ebx
c0002832:	5d                   	pop    %ebp
c0002833:	c3                   	ret    

c0002834 <task_fs>:
c0002834:	55                   	push   %ebp
c0002835:	89 e5                	mov    %esp,%ebp
c0002837:	83 ec 38             	sub    $0x38,%esp
c000283a:	e8 4d f0 ff ff       	call   c000188c <get_running_thread_pcb>
c000283f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002842:	e8 44 08 00 00       	call   c000308b <init_fs>
c0002847:	83 ec 0c             	sub    $0xc,%esp
c000284a:	6a 6c                	push   $0x6c
c000284c:	e8 77 45 00 00       	call   c0006dc8 <sys_malloc>
c0002851:	83 c4 10             	add    $0x10,%esp
c0002854:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002857:	83 ec 0c             	sub    $0xc,%esp
c000285a:	6a 6c                	push   $0x6c
c000285c:	e8 67 45 00 00       	call   c0006dc8 <sys_malloc>
c0002861:	83 c4 10             	add    $0x10,%esp
c0002864:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002867:	83 ec 04             	sub    $0x4,%esp
c000286a:	6a 6c                	push   $0x6c
c000286c:	6a 00                	push   $0x0
c000286e:	ff 75 e8             	pushl  -0x18(%ebp)
c0002871:	e8 2d 86 00 00       	call   c000aea3 <Memset>
c0002876:	83 c4 10             	add    $0x10,%esp
c0002879:	83 ec 04             	sub    $0x4,%esp
c000287c:	6a 0e                	push   $0xe
c000287e:	ff 75 e8             	pushl  -0x18(%ebp)
c0002881:	6a 02                	push   $0x2
c0002883:	e8 0c 71 00 00       	call   c0009994 <send_rec>
c0002888:	83 c4 10             	add    $0x10,%esp
c000288b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000288e:	8b 40 68             	mov    0x68(%eax),%eax
c0002891:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002894:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002897:	8b 00                	mov    (%eax),%eax
c0002899:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000289c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000289f:	8b 40 40             	mov    0x40(%eax),%eax
c00028a2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00028a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00028a8:	8b 40 58             	mov    0x58(%eax),%eax
c00028ab:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00028ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00028b1:	8b 00                	mov    (%eax),%eax
c00028b3:	85 c0                	test   %eax,%eax
c00028b5:	75 07                	jne    c00028be <task_fs+0x8a>
c00028b7:	c7 45 d0 05 00 00 00 	movl   $0x5,-0x30(%ebp)
c00028be:	83 ec 0c             	sub    $0xc,%esp
c00028c1:	ff 75 dc             	pushl  -0x24(%ebp)
c00028c4:	e8 78 20 00 00       	call   c0004941 <pid2proc>
c00028c9:	83 c4 10             	add    $0x10,%esp
c00028cc:	a3 64 fb 00 c0       	mov    %eax,0xc000fb64
c00028d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00028d8:	83 7d e0 06          	cmpl   $0x6,-0x20(%ebp)
c00028dc:	74 2e                	je     c000290c <task_fs+0xd8>
c00028de:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c00028e2:	74 28                	je     c000290c <task_fs+0xd8>
c00028e4:	83 7d e0 0a          	cmpl   $0xa,-0x20(%ebp)
c00028e8:	74 22                	je     c000290c <task_fs+0xd8>
c00028ea:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c00028ee:	74 1c                	je     c000290c <task_fs+0xd8>
c00028f0:	68 8f 00 00 00       	push   $0x8f
c00028f5:	68 e0 a4 00 c0       	push   $0xc000a4e0
c00028fa:	68 e0 a4 00 c0       	push   $0xc000a4e0
c00028ff:	68 f0 a4 00 c0       	push   $0xc000a4f0
c0002904:	e8 6a 68 00 00       	call   c0009173 <assertion_failure>
c0002909:	83 c4 10             	add    $0x10,%esp
c000290c:	83 7d e0 06          	cmpl   $0x6,-0x20(%ebp)
c0002910:	74 1c                	je     c000292e <task_fs+0xfa>
c0002912:	83 7d e0 06          	cmpl   $0x6,-0x20(%ebp)
c0002916:	7f 08                	jg     c0002920 <task_fs+0xec>
c0002918:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c000291c:	74 3b                	je     c0002959 <task_fs+0x125>
c000291e:	eb 49                	jmp    c0002969 <task_fs+0x135>
c0002920:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
c0002924:	74 20                	je     c0002946 <task_fs+0x112>
c0002926:	83 7d e0 0a          	cmpl   $0xa,-0x20(%ebp)
c000292a:	74 1a                	je     c0002946 <task_fs+0x112>
c000292c:	eb 3b                	jmp    c0002969 <task_fs+0x135>
c000292e:	83 ec 0c             	sub    $0xc,%esp
c0002931:	ff 75 e8             	pushl  -0x18(%ebp)
c0002934:	e8 a7 07 00 00       	call   c00030e0 <do_open>
c0002939:	83 c4 10             	add    $0x10,%esp
c000293c:	89 c2                	mov    %eax,%edx
c000293e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002941:	89 50 40             	mov    %edx,0x40(%eax)
c0002944:	eb 34                	jmp    c000297a <task_fs+0x146>
c0002946:	83 ec 0c             	sub    $0xc,%esp
c0002949:	ff 75 e8             	pushl  -0x18(%ebp)
c000294c:	e8 cd 18 00 00       	call   c000421e <do_rdwt>
c0002951:	83 c4 10             	add    $0x10,%esp
c0002954:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002957:	eb 21                	jmp    c000297a <task_fs+0x146>
c0002959:	83 ec 0c             	sub    $0xc,%esp
c000295c:	ff 75 d8             	pushl  -0x28(%ebp)
c000295f:	e8 9e 1d 00 00       	call   c0004702 <do_close>
c0002964:	83 c4 10             	add    $0x10,%esp
c0002967:	eb 11                	jmp    c000297a <task_fs+0x146>
c0002969:	83 ec 0c             	sub    $0xc,%esp
c000296c:	68 2f a5 00 c0       	push   $0xc000a52f
c0002971:	e8 df 67 00 00       	call   c0009155 <panic>
c0002976:	83 c4 10             	add    $0x10,%esp
c0002979:	90                   	nop
c000297a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000297d:	8b 40 68             	mov    0x68(%eax),%eax
c0002980:	83 f8 67             	cmp    $0x67,%eax
c0002983:	74 38                	je     c00029bd <task_fs+0x189>
c0002985:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002988:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000298b:	83 7d e0 66          	cmpl   $0x66,-0x20(%ebp)
c000298f:	75 06                	jne    c0002997 <task_fs+0x163>
c0002991:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0002994:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002997:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000299a:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00029a1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00029a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00029a7:	89 50 50             	mov    %edx,0x50(%eax)
c00029aa:	83 ec 04             	sub    $0x4,%esp
c00029ad:	ff 75 f0             	pushl  -0x10(%ebp)
c00029b0:	ff 75 e4             	pushl  -0x1c(%ebp)
c00029b3:	6a 01                	push   $0x1
c00029b5:	e8 da 6f 00 00       	call   c0009994 <send_rec>
c00029ba:	83 c4 10             	add    $0x10,%esp
c00029bd:	a1 00 f7 00 c0       	mov    0xc000f700,%eax
c00029c2:	83 c0 01             	add    $0x1,%eax
c00029c5:	a3 00 f7 00 c0       	mov    %eax,0xc000f700
c00029ca:	e9 98 fe ff ff       	jmp    c0002867 <task_fs+0x33>

c00029cf <rd_wt>:
c00029cf:	55                   	push   %ebp
c00029d0:	89 e5                	mov    %esp,%ebp
c00029d2:	83 ec 18             	sub    $0x18,%esp
c00029d5:	83 ec 0c             	sub    $0xc,%esp
c00029d8:	6a 6c                	push   $0x6c
c00029da:	e8 e9 43 00 00       	call   c0006dc8 <sys_malloc>
c00029df:	83 c4 10             	add    $0x10,%esp
c00029e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00029e5:	83 ec 04             	sub    $0x4,%esp
c00029e8:	6a 6c                	push   $0x6c
c00029ea:	6a 00                	push   $0x0
c00029ec:	ff 75 f4             	pushl  -0xc(%ebp)
c00029ef:	e8 af 84 00 00       	call   c000aea3 <Memset>
c00029f4:	83 c4 10             	add    $0x10,%esp
c00029f7:	8b 55 18             	mov    0x18(%ebp),%edx
c00029fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00029fd:	89 50 68             	mov    %edx,0x68(%eax)
c0002a00:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002a03:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a06:	89 50 14             	mov    %edx,0x14(%eax)
c0002a09:	8b 55 10             	mov    0x10(%ebp),%edx
c0002a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a0f:	89 50 10             	mov    %edx,0x10(%eax)
c0002a12:	8b 55 14             	mov    0x14(%ebp),%edx
c0002a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a18:	89 50 0c             	mov    %edx,0xc(%eax)
c0002a1b:	8b 45 08             	mov    0x8(%ebp),%eax
c0002a1e:	c1 e0 09             	shl    $0x9,%eax
c0002a21:	89 c2                	mov    %eax,%edx
c0002a23:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a26:	89 50 18             	mov    %edx,0x18(%eax)
c0002a29:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002a2d:	74 22                	je     c0002a51 <rd_wt+0x82>
c0002a2f:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002a33:	74 1c                	je     c0002a51 <rd_wt+0x82>
c0002a35:	68 db 00 00 00       	push   $0xdb
c0002a3a:	68 e0 a4 00 c0       	push   $0xc000a4e0
c0002a3f:	68 e0 a4 00 c0       	push   $0xc000a4e0
c0002a44:	68 42 a5 00 c0       	push   $0xc000a542
c0002a49:	e8 25 67 00 00       	call   c0009173 <assertion_failure>
c0002a4e:	83 c4 10             	add    $0x10,%esp
c0002a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a54:	8b 40 68             	mov    0x68(%eax),%eax
c0002a57:	83 f8 07             	cmp    $0x7,%eax
c0002a5a:	74 27                	je     c0002a83 <rd_wt+0xb4>
c0002a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a5f:	8b 40 68             	mov    0x68(%eax),%eax
c0002a62:	83 f8 0a             	cmp    $0xa,%eax
c0002a65:	74 1c                	je     c0002a83 <rd_wt+0xb4>
c0002a67:	68 dc 00 00 00       	push   $0xdc
c0002a6c:	68 e0 a4 00 c0       	push   $0xc000a4e0
c0002a71:	68 e0 a4 00 c0       	push   $0xc000a4e0
c0002a76:	68 60 a5 00 c0       	push   $0xc000a560
c0002a7b:	e8 f3 66 00 00       	call   c0009173 <assertion_failure>
c0002a80:	83 c4 10             	add    $0x10,%esp
c0002a83:	83 ec 04             	sub    $0x4,%esp
c0002a86:	6a 03                	push   $0x3
c0002a88:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a8b:	6a 03                	push   $0x3
c0002a8d:	e8 02 6f 00 00       	call   c0009994 <send_rec>
c0002a92:	83 c4 10             	add    $0x10,%esp
c0002a95:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a98:	83 ec 08             	sub    $0x8,%esp
c0002a9b:	6a 6c                	push   $0x6c
c0002a9d:	50                   	push   %eax
c0002a9e:	e8 04 46 00 00       	call   c00070a7 <sys_free>
c0002aa3:	83 c4 10             	add    $0x10,%esp
c0002aa6:	90                   	nop
c0002aa7:	c9                   	leave  
c0002aa8:	c3                   	ret    

c0002aa9 <mkfs>:
c0002aa9:	55                   	push   %ebp
c0002aaa:	89 e5                	mov    %esp,%ebp
c0002aac:	57                   	push   %edi
c0002aad:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002ab3:	83 ec 0c             	sub    $0xc,%esp
c0002ab6:	68 00 80 00 00       	push   $0x8000
c0002abb:	e8 08 43 00 00       	call   c0006dc8 <sys_malloc>
c0002ac0:	83 c4 10             	add    $0x10,%esp
c0002ac3:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002ac8:	83 ec 0c             	sub    $0xc,%esp
c0002acb:	6a 24                	push   $0x24
c0002acd:	e8 f6 42 00 00       	call   c0006dc8 <sys_malloc>
c0002ad2:	83 c4 10             	add    $0x10,%esp
c0002ad5:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002ada:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002adf:	83 ec 0c             	sub    $0xc,%esp
c0002ae2:	50                   	push   %eax
c0002ae3:	e8 0c 42 00 00       	call   c0006cf4 <get_physical_address>
c0002ae8:	83 c4 10             	add    $0x10,%esp
c0002aeb:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002af0:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002af5:	83 ec 0c             	sub    $0xc,%esp
c0002af8:	50                   	push   %eax
c0002af9:	e8 f6 41 00 00       	call   c0006cf4 <get_physical_address>
c0002afe:	83 c4 10             	add    $0x10,%esp
c0002b01:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002b06:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b0b:	83 ec 04             	sub    $0x4,%esp
c0002b0e:	68 00 02 00 00       	push   $0x200
c0002b13:	6a 00                	push   $0x0
c0002b15:	50                   	push   %eax
c0002b16:	e8 88 83 00 00       	call   c000aea3 <Memset>
c0002b1b:	83 c4 10             	add    $0x10,%esp
c0002b1e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002b23:	83 ec 0c             	sub    $0xc,%esp
c0002b26:	6a 0a                	push   $0xa
c0002b28:	68 00 02 00 00       	push   $0x200
c0002b2d:	50                   	push   %eax
c0002b2e:	6a 20                	push   $0x20
c0002b30:	6a 00                	push   $0x0
c0002b32:	e8 98 fe ff ff       	call   c00029cf <rd_wt>
c0002b37:	83 c4 20             	add    $0x20,%esp
c0002b3a:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b3f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002b42:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b45:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002b4c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b4f:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002b56:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b59:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002b60:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b63:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002b6a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b6d:	8b 40 04             	mov    0x4(%eax),%eax
c0002b70:	8d 50 02             	lea    0x2(%eax),%edx
c0002b73:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b76:	8b 40 08             	mov    0x8(%eax),%eax
c0002b79:	01 c2                	add    %eax,%edx
c0002b7b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b7e:	8b 40 0c             	mov    0xc(%eax),%eax
c0002b81:	01 c2                	add    %eax,%edx
c0002b83:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b86:	89 10                	mov    %edx,(%eax)
c0002b88:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002b8f:	b8 00 02 00 00       	mov    $0x200,%eax
c0002b94:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002b97:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002b9d:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002ba0:	01 ca                	add    %ecx,%edx
c0002ba2:	83 ec 04             	sub    $0x4,%esp
c0002ba5:	50                   	push   %eax
c0002ba6:	6a 80                	push   $0xffffff80
c0002ba8:	52                   	push   %edx
c0002ba9:	e8 f5 82 00 00       	call   c000aea3 <Memset>
c0002bae:	83 c4 10             	add    $0x10,%esp
c0002bb1:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002bb6:	83 ec 0c             	sub    $0xc,%esp
c0002bb9:	6a 0a                	push   $0xa
c0002bbb:	68 00 02 00 00       	push   $0x200
c0002bc0:	50                   	push   %eax
c0002bc1:	6a 20                	push   $0x20
c0002bc3:	6a 01                	push   $0x1
c0002bc5:	e8 05 fe ff ff       	call   c00029cf <rd_wt>
c0002bca:	83 c4 20             	add    $0x20,%esp
c0002bcd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bd0:	8b 10                	mov    (%eax),%edx
c0002bd2:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002bd5:	8b 50 04             	mov    0x4(%eax),%edx
c0002bd8:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002bdb:	8b 50 08             	mov    0x8(%eax),%edx
c0002bde:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002be1:	8b 50 0c             	mov    0xc(%eax),%edx
c0002be4:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002be7:	8b 50 10             	mov    0x10(%eax),%edx
c0002bea:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002bed:	8b 50 14             	mov    0x14(%eax),%edx
c0002bf0:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002bf3:	8b 50 18             	mov    0x18(%eax),%edx
c0002bf6:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002bf9:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002bfc:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002bff:	8b 40 20             	mov    0x20(%eax),%eax
c0002c02:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002c05:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002c09:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002c0d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c12:	83 ec 04             	sub    $0x4,%esp
c0002c15:	6a 01                	push   $0x1
c0002c17:	52                   	push   %edx
c0002c18:	50                   	push   %eax
c0002c19:	e8 85 82 00 00       	call   c000aea3 <Memset>
c0002c1e:	83 c4 10             	add    $0x10,%esp
c0002c21:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c26:	83 c0 01             	add    $0x1,%eax
c0002c29:	83 ec 04             	sub    $0x4,%esp
c0002c2c:	68 ff 01 00 00       	push   $0x1ff
c0002c31:	6a 80                	push   $0xffffff80
c0002c33:	50                   	push   %eax
c0002c34:	e8 6a 82 00 00       	call   c000aea3 <Memset>
c0002c39:	83 c4 10             	add    $0x10,%esp
c0002c3c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c41:	83 ec 0c             	sub    $0xc,%esp
c0002c44:	6a 0a                	push   $0xa
c0002c46:	68 00 02 00 00       	push   $0x200
c0002c4b:	50                   	push   %eax
c0002c4c:	6a 20                	push   $0x20
c0002c4e:	6a 02                	push   $0x2
c0002c50:	e8 7a fd ff ff       	call   c00029cf <rd_wt>
c0002c55:	83 c4 20             	add    $0x20,%esp
c0002c58:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002c5f:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c64:	83 ec 04             	sub    $0x4,%esp
c0002c67:	68 00 02 00 00       	push   $0x200
c0002c6c:	6a ff                	push   $0xffffffff
c0002c6e:	50                   	push   %eax
c0002c6f:	e8 2f 82 00 00       	call   c000aea3 <Memset>
c0002c74:	83 c4 10             	add    $0x10,%esp
c0002c77:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c7c:	83 ec 0c             	sub    $0xc,%esp
c0002c7f:	6a 0a                	push   $0xa
c0002c81:	68 00 02 00 00       	push   $0x200
c0002c86:	50                   	push   %eax
c0002c87:	6a 20                	push   $0x20
c0002c89:	ff 75 d0             	pushl  -0x30(%ebp)
c0002c8c:	e8 3e fd ff ff       	call   c00029cf <rd_wt>
c0002c91:	83 c4 20             	add    $0x20,%esp
c0002c94:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c99:	83 ec 04             	sub    $0x4,%esp
c0002c9c:	6a 01                	push   $0x1
c0002c9e:	6a 01                	push   $0x1
c0002ca0:	50                   	push   %eax
c0002ca1:	e8 fd 81 00 00       	call   c000aea3 <Memset>
c0002ca6:	83 c4 10             	add    $0x10,%esp
c0002ca9:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cae:	83 c0 01             	add    $0x1,%eax
c0002cb1:	83 ec 04             	sub    $0x4,%esp
c0002cb4:	68 ff 01 00 00       	push   $0x1ff
c0002cb9:	6a 00                	push   $0x0
c0002cbb:	50                   	push   %eax
c0002cbc:	e8 e2 81 00 00       	call   c000aea3 <Memset>
c0002cc1:	83 c4 10             	add    $0x10,%esp
c0002cc4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002cc9:	89 c2                	mov    %eax,%edx
c0002ccb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002cce:	83 c0 01             	add    $0x1,%eax
c0002cd1:	83 ec 0c             	sub    $0xc,%esp
c0002cd4:	6a 0a                	push   $0xa
c0002cd6:	68 00 02 00 00       	push   $0x200
c0002cdb:	52                   	push   %edx
c0002cdc:	6a 20                	push   $0x20
c0002cde:	50                   	push   %eax
c0002cdf:	e8 eb fc ff ff       	call   c00029cf <rd_wt>
c0002ce4:	83 c4 20             	add    $0x20,%esp
c0002ce7:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002cea:	83 e8 02             	sub    $0x2,%eax
c0002ced:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002cf0:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002cf7:	eb 04                	jmp    c0002cfd <mkfs+0x254>
c0002cf9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002cfd:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002d00:	83 c0 01             	add    $0x1,%eax
c0002d03:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002d06:	7e f1                	jle    c0002cf9 <mkfs+0x250>
c0002d08:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d0d:	89 c2                	mov    %eax,%edx
c0002d0f:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d12:	83 c0 03             	add    $0x3,%eax
c0002d15:	83 ec 0c             	sub    $0xc,%esp
c0002d18:	6a 0a                	push   $0xa
c0002d1a:	68 00 02 00 00       	push   $0x200
c0002d1f:	52                   	push   %edx
c0002d20:	6a 20                	push   $0x20
c0002d22:	50                   	push   %eax
c0002d23:	e8 a7 fc ff ff       	call   c00029cf <rd_wt>
c0002d28:	83 c4 20             	add    $0x20,%esp
c0002d2b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d30:	89 c2                	mov    %eax,%edx
c0002d32:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d35:	83 c0 03             	add    $0x3,%eax
c0002d38:	83 ec 0c             	sub    $0xc,%esp
c0002d3b:	6a 07                	push   $0x7
c0002d3d:	68 00 02 00 00       	push   $0x200
c0002d42:	52                   	push   %edx
c0002d43:	6a 20                	push   $0x20
c0002d45:	50                   	push   %eax
c0002d46:	e8 84 fc ff ff       	call   c00029cf <rd_wt>
c0002d4b:	83 c4 20             	add    $0x20,%esp
c0002d4e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d53:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002d56:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d59:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002d5f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d62:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002d69:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002d6c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d6f:	89 50 08             	mov    %edx,0x8(%eax)
c0002d72:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d75:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002d7c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d7f:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002d86:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d89:	8b 10                	mov    (%eax),%edx
c0002d8b:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002d91:	8b 50 04             	mov    0x4(%eax),%edx
c0002d94:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002d9a:	8b 50 08             	mov    0x8(%eax),%edx
c0002d9d:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002da3:	8b 50 0c             	mov    0xc(%eax),%edx
c0002da6:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002dac:	8b 50 10             	mov    0x10(%eax),%edx
c0002daf:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002db5:	8b 50 14             	mov    0x14(%eax),%edx
c0002db8:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002dbe:	8b 50 18             	mov    0x18(%eax),%edx
c0002dc1:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002dc7:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002dca:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002dd0:	8b 50 20             	mov    0x20(%eax),%edx
c0002dd3:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002dd9:	8b 40 24             	mov    0x24(%eax),%eax
c0002ddc:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002de1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002de8:	eb 4c                	jmp    c0002e36 <mkfs+0x38d>
c0002dea:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002def:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002df2:	83 c2 01             	add    $0x1,%edx
c0002df5:	c1 e2 05             	shl    $0x5,%edx
c0002df8:	01 d0                	add    %edx,%eax
c0002dfa:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002dfd:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e00:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002e06:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e09:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002e10:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e13:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002e1a:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002e21:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002e24:	c1 e0 08             	shl    $0x8,%eax
c0002e27:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002e2a:	89 c2                	mov    %eax,%edx
c0002e2c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e2f:	89 50 08             	mov    %edx,0x8(%eax)
c0002e32:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002e36:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002e3a:	7e ae                	jle    c0002dea <mkfs+0x341>
c0002e3c:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002e43:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002e49:	b8 00 00 00 00       	mov    $0x0,%eax
c0002e4e:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002e53:	89 d7                	mov    %edx,%edi
c0002e55:	f3 ab                	rep stos %eax,%es:(%edi)
c0002e57:	c7 85 70 ff ff ff 88 	movl   $0xc000a588,-0x90(%ebp)
c0002e5e:	a5 00 c0 
c0002e61:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002e68:	eb 54                	jmp    c0002ebe <mkfs+0x415>
c0002e6a:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e6f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002e72:	83 c2 04             	add    $0x4,%edx
c0002e75:	c1 e2 05             	shl    $0x5,%edx
c0002e78:	01 d0                	add    %edx,%eax
c0002e7a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002e7d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e80:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002e86:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e89:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002e90:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002e93:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002e96:	83 c2 01             	add    $0x1,%edx
c0002e99:	c1 e2 0b             	shl    $0xb,%edx
c0002e9c:	01 c2                	add    %eax,%edx
c0002e9e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ea1:	89 50 08             	mov    %edx,0x8(%eax)
c0002ea4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ea7:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002eae:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002eb1:	8d 50 05             	lea    0x5(%eax),%edx
c0002eb4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002eb7:	89 50 10             	mov    %edx,0x10(%eax)
c0002eba:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002ebe:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ec1:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002ec4:	7c a4                	jl     c0002e6a <mkfs+0x3c1>
c0002ec6:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ecb:	89 c2                	mov    %eax,%edx
c0002ecd:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002ed0:	83 c0 03             	add    $0x3,%eax
c0002ed3:	83 ec 0c             	sub    $0xc,%esp
c0002ed6:	6a 0a                	push   $0xa
c0002ed8:	68 00 02 00 00       	push   $0x200
c0002edd:	52                   	push   %edx
c0002ede:	6a 20                	push   $0x20
c0002ee0:	50                   	push   %eax
c0002ee1:	e8 e9 fa ff ff       	call   c00029cf <rd_wt>
c0002ee6:	83 c4 20             	add    $0x20,%esp
c0002ee9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002eee:	89 c2                	mov    %eax,%edx
c0002ef0:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002ef3:	83 ec 0c             	sub    $0xc,%esp
c0002ef6:	6a 07                	push   $0x7
c0002ef8:	68 00 02 00 00       	push   $0x200
c0002efd:	52                   	push   %edx
c0002efe:	6a 20                	push   $0x20
c0002f00:	50                   	push   %eax
c0002f01:	e8 c9 fa ff ff       	call   c00029cf <rd_wt>
c0002f06:	83 c4 20             	add    $0x20,%esp
c0002f09:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002f10:	00 00 00 
c0002f13:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002f1a:	2e 00 
c0002f1c:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002f21:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002f24:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f27:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002f2d:	83 ec 0c             	sub    $0xc,%esp
c0002f30:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002f36:	50                   	push   %eax
c0002f37:	e8 a0 7f 00 00       	call   c000aedc <Strlen>
c0002f3c:	83 c4 10             	add    $0x10,%esp
c0002f3f:	89 c1                	mov    %eax,%ecx
c0002f41:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f44:	8d 50 04             	lea    0x4(%eax),%edx
c0002f47:	83 ec 04             	sub    $0x4,%esp
c0002f4a:	51                   	push   %ecx
c0002f4b:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002f51:	50                   	push   %eax
c0002f52:	52                   	push   %edx
c0002f53:	e8 1d 7f 00 00       	call   c000ae75 <Memcpy>
c0002f58:	83 c4 10             	add    $0x10,%esp
c0002f5b:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002f61:	b8 00 00 00 00       	mov    $0x0,%eax
c0002f66:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002f6b:	89 d7                	mov    %edx,%edi
c0002f6d:	f3 ab                	rep stos %eax,%es:(%edi)
c0002f6f:	c7 85 34 ff ff ff 94 	movl   $0xc000a594,-0xcc(%ebp)
c0002f76:	a5 00 c0 
c0002f79:	c7 85 38 ff ff ff 9d 	movl   $0xc000a59d,-0xc8(%ebp)
c0002f80:	a5 00 c0 
c0002f83:	c7 85 3c ff ff ff a6 	movl   $0xc000a5a6,-0xc4(%ebp)
c0002f8a:	a5 00 c0 
c0002f8d:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002f94:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002f9b:	eb 49                	jmp    c0002fe6 <mkfs+0x53d>
c0002f9d:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002fa1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002fa4:	8d 50 02             	lea    0x2(%eax),%edx
c0002fa7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002faa:	89 10                	mov    %edx,(%eax)
c0002fac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002faf:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002fb6:	83 ec 0c             	sub    $0xc,%esp
c0002fb9:	50                   	push   %eax
c0002fba:	e8 1d 7f 00 00       	call   c000aedc <Strlen>
c0002fbf:	83 c4 10             	add    $0x10,%esp
c0002fc2:	89 c1                	mov    %eax,%ecx
c0002fc4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002fc7:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002fce:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002fd1:	83 c2 04             	add    $0x4,%edx
c0002fd4:	83 ec 04             	sub    $0x4,%esp
c0002fd7:	51                   	push   %ecx
c0002fd8:	50                   	push   %eax
c0002fd9:	52                   	push   %edx
c0002fda:	e8 96 7e 00 00       	call   c000ae75 <Memcpy>
c0002fdf:	83 c4 10             	add    $0x10,%esp
c0002fe2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002fe6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002fe9:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0002fec:	7c af                	jl     c0002f9d <mkfs+0x4f4>
c0002fee:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0002ff5:	eb 66                	jmp    c000305d <mkfs+0x5b4>
c0002ff7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002ffa:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003001:	83 ec 0c             	sub    $0xc,%esp
c0003004:	50                   	push   %eax
c0003005:	e8 d2 7e 00 00       	call   c000aedc <Strlen>
c000300a:	83 c4 10             	add    $0x10,%esp
c000300d:	85 c0                	test   %eax,%eax
c000300f:	74 47                	je     c0003058 <mkfs+0x5af>
c0003011:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003015:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003018:	8d 50 05             	lea    0x5(%eax),%edx
c000301b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000301e:	89 10                	mov    %edx,(%eax)
c0003020:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003023:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000302a:	83 ec 0c             	sub    $0xc,%esp
c000302d:	50                   	push   %eax
c000302e:	e8 a9 7e 00 00       	call   c000aedc <Strlen>
c0003033:	83 c4 10             	add    $0x10,%esp
c0003036:	89 c1                	mov    %eax,%ecx
c0003038:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000303b:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003042:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003045:	83 c2 04             	add    $0x4,%edx
c0003048:	83 ec 04             	sub    $0x4,%esp
c000304b:	51                   	push   %ecx
c000304c:	50                   	push   %eax
c000304d:	52                   	push   %edx
c000304e:	e8 22 7e 00 00       	call   c000ae75 <Memcpy>
c0003053:	83 c4 10             	add    $0x10,%esp
c0003056:	eb 01                	jmp    c0003059 <mkfs+0x5b0>
c0003058:	90                   	nop
c0003059:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000305d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003060:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0003063:	7c 92                	jl     c0002ff7 <mkfs+0x54e>
c0003065:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000306a:	89 c2                	mov    %eax,%edx
c000306c:	8b 45 98             	mov    -0x68(%ebp),%eax
c000306f:	83 ec 0c             	sub    $0xc,%esp
c0003072:	6a 0a                	push   $0xa
c0003074:	68 00 02 00 00       	push   $0x200
c0003079:	52                   	push   %edx
c000307a:	6a 20                	push   $0x20
c000307c:	50                   	push   %eax
c000307d:	e8 4d f9 ff ff       	call   c00029cf <rd_wt>
c0003082:	83 c4 20             	add    $0x20,%esp
c0003085:	90                   	nop
c0003086:	8b 7d fc             	mov    -0x4(%ebp),%edi
c0003089:	c9                   	leave  
c000308a:	c3                   	ret    

c000308b <init_fs>:
c000308b:	55                   	push   %ebp
c000308c:	89 e5                	mov    %esp,%ebp
c000308e:	83 ec 18             	sub    $0x18,%esp
c0003091:	83 ec 0c             	sub    $0xc,%esp
c0003094:	6a 6c                	push   $0x6c
c0003096:	e8 2d 3d 00 00       	call   c0006dc8 <sys_malloc>
c000309b:	83 c4 10             	add    $0x10,%esp
c000309e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00030a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030a4:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c00030ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030ae:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c00030b5:	83 ec 04             	sub    $0x4,%esp
c00030b8:	6a 03                	push   $0x3
c00030ba:	ff 75 f4             	pushl  -0xc(%ebp)
c00030bd:	6a 03                	push   $0x3
c00030bf:	e8 d0 68 00 00       	call   c0009994 <send_rec>
c00030c4:	83 c4 10             	add    $0x10,%esp
c00030c7:	e8 dd f9 ff ff       	call   c0002aa9 <mkfs>
c00030cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030cf:	83 ec 08             	sub    $0x8,%esp
c00030d2:	6a 6c                	push   $0x6c
c00030d4:	50                   	push   %eax
c00030d5:	e8 cd 3f 00 00       	call   c00070a7 <sys_free>
c00030da:	83 c4 10             	add    $0x10,%esp
c00030dd:	90                   	nop
c00030de:	c9                   	leave  
c00030df:	c3                   	ret    

c00030e0 <do_open>:
c00030e0:	55                   	push   %ebp
c00030e1:	89 e5                	mov    %esp,%ebp
c00030e3:	83 ec 68             	sub    $0x68,%esp
c00030e6:	83 ec 04             	sub    $0x4,%esp
c00030e9:	6a 0c                	push   $0xc
c00030eb:	6a 00                	push   $0x0
c00030ed:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00030f0:	50                   	push   %eax
c00030f1:	e8 ad 7d 00 00       	call   c000aea3 <Memset>
c00030f6:	83 c4 10             	add    $0x10,%esp
c00030f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00030fc:	8b 40 34             	mov    0x34(%eax),%eax
c00030ff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003102:	83 ec 08             	sub    $0x8,%esp
c0003105:	6a 0c                	push   $0xc
c0003107:	ff 75 e4             	pushl  -0x1c(%ebp)
c000310a:	e8 78 3b 00 00       	call   c0006c87 <alloc_virtual_memory>
c000310f:	83 c4 10             	add    $0x10,%esp
c0003112:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003115:	8b 45 08             	mov    0x8(%ebp),%eax
c0003118:	8b 40 30             	mov    0x30(%eax),%eax
c000311b:	89 c2                	mov    %eax,%edx
c000311d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003120:	83 ec 04             	sub    $0x4,%esp
c0003123:	52                   	push   %edx
c0003124:	50                   	push   %eax
c0003125:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003128:	50                   	push   %eax
c0003129:	e8 47 7d 00 00       	call   c000ae75 <Memcpy>
c000312e:	83 c4 10             	add    $0x10,%esp
c0003131:	8b 45 08             	mov    0x8(%ebp),%eax
c0003134:	8b 40 30             	mov    0x30(%eax),%eax
c0003137:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c000313c:	8b 45 08             	mov    0x8(%ebp),%eax
c000313f:	8b 40 64             	mov    0x64(%eax),%eax
c0003142:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003145:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c000314c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003153:	eb 1f                	jmp    c0003174 <do_open+0x94>
c0003155:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000315a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000315d:	83 c2 50             	add    $0x50,%edx
c0003160:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0003164:	85 c0                	test   %eax,%eax
c0003166:	75 08                	jne    c0003170 <do_open+0x90>
c0003168:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000316b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000316e:	eb 0a                	jmp    c000317a <do_open+0x9a>
c0003170:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003174:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0003178:	7e db                	jle    c0003155 <do_open+0x75>
c000317a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c000317e:	75 1c                	jne    c000319c <do_open+0xbc>
c0003180:	68 f1 01 00 00       	push   $0x1f1
c0003185:	68 e0 a4 00 c0       	push   $0xc000a4e0
c000318a:	68 e0 a4 00 c0       	push   $0xc000a4e0
c000318f:	68 af a5 00 c0       	push   $0xc000a5af
c0003194:	e8 da 5f 00 00       	call   c0009173 <assertion_failure>
c0003199:	83 c4 10             	add    $0x10,%esp
c000319c:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c00031a3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00031aa:	eb 1d                	jmp    c00031c9 <do_open+0xe9>
c00031ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00031af:	c1 e0 04             	shl    $0x4,%eax
c00031b2:	05 88 23 01 c0       	add    $0xc0012388,%eax
c00031b7:	8b 00                	mov    (%eax),%eax
c00031b9:	85 c0                	test   %eax,%eax
c00031bb:	75 08                	jne    c00031c5 <do_open+0xe5>
c00031bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00031c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00031c3:	eb 0a                	jmp    c00031cf <do_open+0xef>
c00031c5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00031c9:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c00031cd:	7e dd                	jle    c00031ac <do_open+0xcc>
c00031cf:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c00031d3:	75 1c                	jne    c00031f1 <do_open+0x111>
c00031d5:	68 fd 01 00 00       	push   $0x1fd
c00031da:	68 e0 a4 00 c0       	push   $0xc000a4e0
c00031df:	68 e0 a4 00 c0       	push   $0xc000a4e0
c00031e4:	68 b7 a5 00 c0       	push   $0xc000a5b7
c00031e9:	e8 85 5f 00 00       	call   c0009173 <assertion_failure>
c00031ee:	83 c4 10             	add    $0x10,%esp
c00031f1:	83 ec 0c             	sub    $0xc,%esp
c00031f4:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c00031f7:	50                   	push   %eax
c00031f8:	e8 b2 00 00 00       	call   c00032af <search_file>
c00031fd:	83 c4 10             	add    $0x10,%esp
c0003200:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003203:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0003207:	75 2b                	jne    c0003234 <do_open+0x154>
c0003209:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c000320d:	7e 10                	jle    c000321f <do_open+0x13f>
c000320f:	83 ec 0c             	sub    $0xc,%esp
c0003212:	68 bf a5 00 c0       	push   $0xc000a5bf
c0003217:	e8 39 5f 00 00       	call   c0009155 <panic>
c000321c:	83 c4 10             	add    $0x10,%esp
c000321f:	83 ec 08             	sub    $0x8,%esp
c0003222:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003225:	50                   	push   %eax
c0003226:	8d 45 9c             	lea    -0x64(%ebp),%eax
c0003229:	50                   	push   %eax
c000322a:	e8 40 04 00 00       	call   c000366f <create_file>
c000322f:	83 c4 10             	add    $0x10,%esp
c0003232:	eb 22                	jmp    c0003256 <do_open+0x176>
c0003234:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c0003238:	75 07                	jne    c0003241 <do_open+0x161>
c000323a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c000323f:	eb 6c                	jmp    c00032ad <do_open+0x1cd>
c0003241:	83 ec 08             	sub    $0x8,%esp
c0003244:	ff 75 d8             	pushl  -0x28(%ebp)
c0003247:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000324a:	50                   	push   %eax
c000324b:	e8 5d 02 00 00       	call   c00034ad <get_inode>
c0003250:	83 c4 10             	add    $0x10,%esp
c0003253:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003256:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000325b:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000325e:	c1 e2 04             	shl    $0x4,%edx
c0003261:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c0003267:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000326a:	83 c2 50             	add    $0x50,%edx
c000326d:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
c0003271:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003274:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003277:	c1 e2 04             	shl    $0x4,%edx
c000327a:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c0003280:	89 02                	mov    %eax,(%edx)
c0003282:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003285:	c1 e0 04             	shl    $0x4,%eax
c0003288:	05 84 23 01 c0       	add    $0xc0012384,%eax
c000328d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003293:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003296:	c1 e0 04             	shl    $0x4,%eax
c0003299:	05 80 23 01 c0       	add    $0xc0012380,%eax
c000329e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00032a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032a7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00032aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00032ad:	c9                   	leave  
c00032ae:	c3                   	ret    

c00032af <search_file>:
c00032af:	55                   	push   %ebp
c00032b0:	89 e5                	mov    %esp,%ebp
c00032b2:	83 ec 68             	sub    $0x68,%esp
c00032b5:	83 ec 04             	sub    $0x4,%esp
c00032b8:	6a 0c                	push   $0xc
c00032ba:	6a 00                	push   $0x0
c00032bc:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00032bf:	50                   	push   %eax
c00032c0:	e8 de 7b 00 00       	call   c000aea3 <Memset>
c00032c5:	83 c4 10             	add    $0x10,%esp
c00032c8:	83 ec 04             	sub    $0x4,%esp
c00032cb:	6a 28                	push   $0x28
c00032cd:	6a 00                	push   $0x0
c00032cf:	8d 45 98             	lea    -0x68(%ebp),%eax
c00032d2:	50                   	push   %eax
c00032d3:	e8 cb 7b 00 00       	call   c000aea3 <Memset>
c00032d8:	83 c4 10             	add    $0x10,%esp
c00032db:	83 ec 04             	sub    $0x4,%esp
c00032de:	8d 45 98             	lea    -0x68(%ebp),%eax
c00032e1:	50                   	push   %eax
c00032e2:	ff 75 08             	pushl  0x8(%ebp)
c00032e5:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00032e8:	50                   	push   %eax
c00032e9:	e8 f3 00 00 00       	call   c00033e1 <strip_path>
c00032ee:	83 c4 10             	add    $0x10,%esp
c00032f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00032f4:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c00032f8:	75 0a                	jne    c0003304 <search_file+0x55>
c00032fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00032ff:	e9 db 00 00 00       	jmp    c00033df <search_file+0x130>
c0003304:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003307:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000330a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000330d:	05 00 02 00 00       	add    $0x200,%eax
c0003312:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003318:	85 c0                	test   %eax,%eax
c000331a:	0f 48 c2             	cmovs  %edx,%eax
c000331d:	c1 f8 09             	sar    $0x9,%eax
c0003320:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003323:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003326:	c1 e8 04             	shr    $0x4,%eax
c0003329:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000332c:	e8 23 14 00 00       	call   c0004754 <get_super_block>
c0003331:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003334:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003337:	8b 00                	mov    (%eax),%eax
c0003339:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000333c:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0003343:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000334a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003351:	eb 7b                	jmp    c00033ce <search_file+0x11f>
c0003353:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003358:	89 c1                	mov    %eax,%ecx
c000335a:	8b 55 d0             	mov    -0x30(%ebp),%edx
c000335d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003360:	01 d0                	add    %edx,%eax
c0003362:	83 ec 0c             	sub    $0xc,%esp
c0003365:	6a 07                	push   $0x7
c0003367:	68 00 02 00 00       	push   $0x200
c000336c:	51                   	push   %ecx
c000336d:	ff 75 cc             	pushl  -0x34(%ebp)
c0003370:	50                   	push   %eax
c0003371:	e8 59 f6 ff ff       	call   c00029cf <rd_wt>
c0003376:	83 c4 20             	add    $0x20,%esp
c0003379:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000337e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003381:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003388:	eb 35                	jmp    c00033bf <search_file+0x110>
c000338a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000338e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003391:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003394:	7f 33                	jg     c00033c9 <search_file+0x11a>
c0003396:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003399:	83 c0 04             	add    $0x4,%eax
c000339c:	83 ec 08             	sub    $0x8,%esp
c000339f:	50                   	push   %eax
c00033a0:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00033a3:	50                   	push   %eax
c00033a4:	e8 47 69 00 00       	call   c0009cf0 <strcmp>
c00033a9:	83 c4 10             	add    $0x10,%esp
c00033ac:	85 c0                	test   %eax,%eax
c00033ae:	75 07                	jne    c00033b7 <search_file+0x108>
c00033b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00033b3:	8b 00                	mov    (%eax),%eax
c00033b5:	eb 28                	jmp    c00033df <search_file+0x130>
c00033b7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00033bb:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c00033bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00033c2:	83 f8 1f             	cmp    $0x1f,%eax
c00033c5:	76 c3                	jbe    c000338a <search_file+0xdb>
c00033c7:	eb 01                	jmp    c00033ca <search_file+0x11b>
c00033c9:	90                   	nop
c00033ca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00033ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00033d1:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c00033d4:	0f 8c 79 ff ff ff    	jl     c0003353 <search_file+0xa4>
c00033da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00033df:	c9                   	leave  
c00033e0:	c3                   	ret    

c00033e1 <strip_path>:
c00033e1:	55                   	push   %ebp
c00033e2:	89 e5                	mov    %esp,%ebp
c00033e4:	83 ec 10             	sub    $0x10,%esp
c00033e7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00033eb:	75 0a                	jne    c00033f7 <strip_path+0x16>
c00033ed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00033f2:	e9 b4 00 00 00       	jmp    c00034ab <strip_path+0xca>
c00033f7:	8b 45 08             	mov    0x8(%ebp),%eax
c00033fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00033fd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003400:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003403:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003406:	0f b6 00             	movzbl (%eax),%eax
c0003409:	3c 2f                	cmp    $0x2f,%al
c000340b:	75 2d                	jne    c000343a <strip_path+0x59>
c000340d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003411:	eb 27                	jmp    c000343a <strip_path+0x59>
c0003413:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003416:	0f b6 00             	movzbl (%eax),%eax
c0003419:	3c 2f                	cmp    $0x2f,%al
c000341b:	75 0a                	jne    c0003427 <strip_path+0x46>
c000341d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003422:	e9 84 00 00 00       	jmp    c00034ab <strip_path+0xca>
c0003427:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000342a:	0f b6 10             	movzbl (%eax),%edx
c000342d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003430:	88 10                	mov    %dl,(%eax)
c0003432:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003436:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000343a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000343d:	0f b6 00             	movzbl (%eax),%eax
c0003440:	84 c0                	test   %al,%al
c0003442:	75 cf                	jne    c0003413 <strip_path+0x32>
c0003444:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003447:	c6 00 00             	movb   $0x0,(%eax)
c000344a:	8b 45 10             	mov    0x10(%ebp),%eax
c000344d:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c0003453:	89 10                	mov    %edx,(%eax)
c0003455:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c000345b:	89 50 04             	mov    %edx,0x4(%eax)
c000345e:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c0003464:	89 50 08             	mov    %edx,0x8(%eax)
c0003467:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c000346d:	89 50 0c             	mov    %edx,0xc(%eax)
c0003470:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c0003476:	89 50 10             	mov    %edx,0x10(%eax)
c0003479:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c000347f:	89 50 14             	mov    %edx,0x14(%eax)
c0003482:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c0003488:	89 50 18             	mov    %edx,0x18(%eax)
c000348b:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c0003491:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003494:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c000349a:	89 50 20             	mov    %edx,0x20(%eax)
c000349d:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c00034a3:	89 50 24             	mov    %edx,0x24(%eax)
c00034a6:	b8 00 00 00 00       	mov    $0x0,%eax
c00034ab:	c9                   	leave  
c00034ac:	c3                   	ret    

c00034ad <get_inode>:
c00034ad:	55                   	push   %ebp
c00034ae:	89 e5                	mov    %esp,%ebp
c00034b0:	56                   	push   %esi
c00034b1:	53                   	push   %ebx
c00034b2:	83 ec 20             	sub    $0x20,%esp
c00034b5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00034b9:	75 0a                	jne    c00034c5 <get_inode+0x18>
c00034bb:	b8 00 00 00 00       	mov    $0x0,%eax
c00034c0:	e9 a3 01 00 00       	jmp    c0003668 <get_inode+0x1bb>
c00034c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00034cc:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c00034d3:	eb 69                	jmp    c000353e <get_inode+0x91>
c00034d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034d8:	8b 40 24             	mov    0x24(%eax),%eax
c00034db:	85 c0                	test   %eax,%eax
c00034dd:	7e 53                	jle    c0003532 <get_inode+0x85>
c00034df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034e2:	8b 40 10             	mov    0x10(%eax),%eax
c00034e5:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00034e8:	75 50                	jne    c000353a <get_inode+0x8d>
c00034ea:	8b 45 08             	mov    0x8(%ebp),%eax
c00034ed:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00034f0:	8b 0a                	mov    (%edx),%ecx
c00034f2:	89 08                	mov    %ecx,(%eax)
c00034f4:	8b 4a 04             	mov    0x4(%edx),%ecx
c00034f7:	89 48 04             	mov    %ecx,0x4(%eax)
c00034fa:	8b 4a 08             	mov    0x8(%edx),%ecx
c00034fd:	89 48 08             	mov    %ecx,0x8(%eax)
c0003500:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003503:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003506:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003509:	89 48 10             	mov    %ecx,0x10(%eax)
c000350c:	8b 4a 14             	mov    0x14(%edx),%ecx
c000350f:	89 48 14             	mov    %ecx,0x14(%eax)
c0003512:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003515:	89 48 18             	mov    %ecx,0x18(%eax)
c0003518:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000351b:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000351e:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003521:	89 48 20             	mov    %ecx,0x20(%eax)
c0003524:	8b 52 24             	mov    0x24(%edx),%edx
c0003527:	89 50 24             	mov    %edx,0x24(%eax)
c000352a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000352d:	e9 36 01 00 00       	jmp    c0003668 <get_inode+0x1bb>
c0003532:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003535:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003538:	eb 0d                	jmp    c0003547 <get_inode+0x9a>
c000353a:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c000353e:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c0003545:	76 8e                	jbe    c00034d5 <get_inode+0x28>
c0003547:	e8 08 12 00 00       	call   c0004754 <get_super_block>
c000354c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000354f:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003556:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003559:	8b 40 04             	mov    0x4(%eax),%eax
c000355c:	8d 50 02             	lea    0x2(%eax),%edx
c000355f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003562:	8b 40 08             	mov    0x8(%eax),%eax
c0003565:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c0003568:	8b 45 0c             	mov    0xc(%ebp),%eax
c000356b:	8d 48 ff             	lea    -0x1(%eax),%ecx
c000356e:	b8 00 02 00 00       	mov    $0x200,%eax
c0003573:	99                   	cltd   
c0003574:	f7 7d e8             	idivl  -0x18(%ebp)
c0003577:	89 c6                	mov    %eax,%esi
c0003579:	89 c8                	mov    %ecx,%eax
c000357b:	99                   	cltd   
c000357c:	f7 fe                	idiv   %esi
c000357e:	01 d8                	add    %ebx,%eax
c0003580:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003583:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c000358a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000358f:	83 ec 0c             	sub    $0xc,%esp
c0003592:	6a 07                	push   $0x7
c0003594:	68 00 02 00 00       	push   $0x200
c0003599:	50                   	push   %eax
c000359a:	ff 75 e0             	pushl  -0x20(%ebp)
c000359d:	ff 75 e4             	pushl  -0x1c(%ebp)
c00035a0:	e8 2a f4 ff ff       	call   c00029cf <rd_wt>
c00035a5:	83 c4 20             	add    $0x20,%esp
c00035a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00035ab:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00035ae:	b8 00 02 00 00       	mov    $0x200,%eax
c00035b3:	99                   	cltd   
c00035b4:	f7 7d e8             	idivl  -0x18(%ebp)
c00035b7:	89 c3                	mov    %eax,%ebx
c00035b9:	89 c8                	mov    %ecx,%eax
c00035bb:	99                   	cltd   
c00035bc:	f7 fb                	idiv   %ebx
c00035be:	89 55 dc             	mov    %edx,-0x24(%ebp)
c00035c1:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00035c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00035ca:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c00035ce:	01 d0                	add    %edx,%eax
c00035d0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00035d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00035d6:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00035d9:	8b 0a                	mov    (%edx),%ecx
c00035db:	89 08                	mov    %ecx,(%eax)
c00035dd:	8b 4a 04             	mov    0x4(%edx),%ecx
c00035e0:	89 48 04             	mov    %ecx,0x4(%eax)
c00035e3:	8b 4a 08             	mov    0x8(%edx),%ecx
c00035e6:	89 48 08             	mov    %ecx,0x8(%eax)
c00035e9:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00035ec:	89 48 0c             	mov    %ecx,0xc(%eax)
c00035ef:	8b 4a 10             	mov    0x10(%edx),%ecx
c00035f2:	89 48 10             	mov    %ecx,0x10(%eax)
c00035f5:	8b 4a 14             	mov    0x14(%edx),%ecx
c00035f8:	89 48 14             	mov    %ecx,0x14(%eax)
c00035fb:	8b 4a 18             	mov    0x18(%edx),%ecx
c00035fe:	89 48 18             	mov    %ecx,0x18(%eax)
c0003601:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003604:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003607:	8b 4a 20             	mov    0x20(%edx),%ecx
c000360a:	89 48 20             	mov    %ecx,0x20(%eax)
c000360d:	8b 52 24             	mov    0x24(%edx),%edx
c0003610:	89 50 24             	mov    %edx,0x24(%eax)
c0003613:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003616:	8b 55 0c             	mov    0xc(%ebp),%edx
c0003619:	89 50 10             	mov    %edx,0x10(%eax)
c000361c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000361f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003622:	89 50 20             	mov    %edx,0x20(%eax)
c0003625:	8b 45 08             	mov    0x8(%ebp),%eax
c0003628:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000362b:	8b 0a                	mov    (%edx),%ecx
c000362d:	89 08                	mov    %ecx,(%eax)
c000362f:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003632:	89 48 04             	mov    %ecx,0x4(%eax)
c0003635:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003638:	89 48 08             	mov    %ecx,0x8(%eax)
c000363b:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000363e:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003641:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003644:	89 48 10             	mov    %ecx,0x10(%eax)
c0003647:	8b 4a 14             	mov    0x14(%edx),%ecx
c000364a:	89 48 14             	mov    %ecx,0x14(%eax)
c000364d:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003650:	89 48 18             	mov    %ecx,0x18(%eax)
c0003653:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003656:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003659:	8b 4a 20             	mov    0x20(%edx),%ecx
c000365c:	89 48 20             	mov    %ecx,0x20(%eax)
c000365f:	8b 52 24             	mov    0x24(%edx),%edx
c0003662:	89 50 24             	mov    %edx,0x24(%eax)
c0003665:	8b 45 08             	mov    0x8(%ebp),%eax
c0003668:	8d 65 f8             	lea    -0x8(%ebp),%esp
c000366b:	5b                   	pop    %ebx
c000366c:	5e                   	pop    %esi
c000366d:	5d                   	pop    %ebp
c000366e:	c3                   	ret    

c000366f <create_file>:
c000366f:	55                   	push   %ebp
c0003670:	89 e5                	mov    %esp,%ebp
c0003672:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0003678:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000367b:	50                   	push   %eax
c000367c:	ff 75 0c             	pushl  0xc(%ebp)
c000367f:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003682:	50                   	push   %eax
c0003683:	e8 59 fd ff ff       	call   c00033e1 <strip_path>
c0003688:	83 c4 0c             	add    $0xc,%esp
c000368b:	83 f8 ff             	cmp    $0xffffffff,%eax
c000368e:	75 0a                	jne    c000369a <create_file+0x2b>
c0003690:	b8 00 00 00 00       	mov    $0x0,%eax
c0003695:	e9 de 00 00 00       	jmp    c0003778 <create_file+0x109>
c000369a:	e8 db 00 00 00       	call   c000377a <alloc_imap_bit>
c000369f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00036a2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00036a6:	75 0a                	jne    c00036b2 <create_file+0x43>
c00036a8:	b8 00 00 00 00       	mov    $0x0,%eax
c00036ad:	e9 c6 00 00 00       	jmp    c0003778 <create_file+0x109>
c00036b2:	e8 9d 10 00 00       	call   c0004754 <get_super_block>
c00036b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00036ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036bd:	8b 40 10             	mov    0x10(%eax),%eax
c00036c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00036c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036c6:	83 ec 08             	sub    $0x8,%esp
c00036c9:	50                   	push   %eax
c00036ca:	ff 75 f4             	pushl  -0xc(%ebp)
c00036cd:	e8 a5 01 00 00       	call   c0003877 <alloc_smap_bit>
c00036d2:	83 c4 10             	add    $0x10,%esp
c00036d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00036d8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00036dc:	75 0a                	jne    c00036e8 <create_file+0x79>
c00036de:	b8 00 00 00 00       	mov    $0x0,%eax
c00036e3:	e9 90 00 00 00       	jmp    c0003778 <create_file+0x109>
c00036e8:	83 ec 04             	sub    $0x4,%esp
c00036eb:	ff 75 e8             	pushl  -0x18(%ebp)
c00036ee:	ff 75 f4             	pushl  -0xc(%ebp)
c00036f1:	8d 45 84             	lea    -0x7c(%ebp),%eax
c00036f4:	50                   	push   %eax
c00036f5:	e8 1e 03 00 00       	call   c0003a18 <new_inode>
c00036fa:	83 c4 10             	add    $0x10,%esp
c00036fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003700:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003704:	75 07                	jne    c000370d <create_file+0x9e>
c0003706:	b8 00 00 00 00       	mov    $0x0,%eax
c000370b:	eb 6b                	jmp    c0003778 <create_file+0x109>
c000370d:	ff 75 f4             	pushl  -0xc(%ebp)
c0003710:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003713:	50                   	push   %eax
c0003714:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003717:	50                   	push   %eax
c0003718:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c000371e:	50                   	push   %eax
c000371f:	e8 12 04 00 00       	call   c0003b36 <new_dir_entry>
c0003724:	83 c4 10             	add    $0x10,%esp
c0003727:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000372a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c000372e:	75 07                	jne    c0003737 <create_file+0xc8>
c0003730:	b8 00 00 00 00       	mov    $0x0,%eax
c0003735:	eb 41                	jmp    c0003778 <create_file+0x109>
c0003737:	8b 45 08             	mov    0x8(%ebp),%eax
c000373a:	8b 55 84             	mov    -0x7c(%ebp),%edx
c000373d:	89 10                	mov    %edx,(%eax)
c000373f:	8b 55 88             	mov    -0x78(%ebp),%edx
c0003742:	89 50 04             	mov    %edx,0x4(%eax)
c0003745:	8b 55 8c             	mov    -0x74(%ebp),%edx
c0003748:	89 50 08             	mov    %edx,0x8(%eax)
c000374b:	8b 55 90             	mov    -0x70(%ebp),%edx
c000374e:	89 50 0c             	mov    %edx,0xc(%eax)
c0003751:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0003754:	89 50 10             	mov    %edx,0x10(%eax)
c0003757:	8b 55 98             	mov    -0x68(%ebp),%edx
c000375a:	89 50 14             	mov    %edx,0x14(%eax)
c000375d:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003760:	89 50 18             	mov    %edx,0x18(%eax)
c0003763:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0003766:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003769:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c000376c:	89 50 20             	mov    %edx,0x20(%eax)
c000376f:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003772:	89 50 24             	mov    %edx,0x24(%eax)
c0003775:	8b 45 08             	mov    0x8(%ebp),%eax
c0003778:	c9                   	leave  
c0003779:	c3                   	ret    

c000377a <alloc_imap_bit>:
c000377a:	55                   	push   %ebp
c000377b:	89 e5                	mov    %esp,%ebp
c000377d:	53                   	push   %ebx
c000377e:	83 ec 24             	sub    $0x24,%esp
c0003781:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c0003788:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c000378f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003794:	83 ec 0c             	sub    $0xc,%esp
c0003797:	6a 07                	push   $0x7
c0003799:	68 00 02 00 00       	push   $0x200
c000379e:	50                   	push   %eax
c000379f:	ff 75 e8             	pushl  -0x18(%ebp)
c00037a2:	ff 75 ec             	pushl  -0x14(%ebp)
c00037a5:	e8 25 f2 ff ff       	call   c00029cf <rd_wt>
c00037aa:	83 c4 20             	add    $0x20,%esp
c00037ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00037b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00037bb:	e9 a5 00 00 00       	jmp    c0003865 <alloc_imap_bit+0xeb>
c00037c0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00037c7:	e9 8b 00 00 00       	jmp    c0003857 <alloc_imap_bit+0xdd>
c00037cc:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00037d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037d5:	01 d0                	add    %edx,%eax
c00037d7:	0f b6 00             	movzbl (%eax),%eax
c00037da:	0f be d0             	movsbl %al,%edx
c00037dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00037e0:	89 c1                	mov    %eax,%ecx
c00037e2:	d3 fa                	sar    %cl,%edx
c00037e4:	89 d0                	mov    %edx,%eax
c00037e6:	83 e0 01             	and    $0x1,%eax
c00037e9:	85 c0                	test   %eax,%eax
c00037eb:	74 06                	je     c00037f3 <alloc_imap_bit+0x79>
c00037ed:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00037f1:	eb 64                	jmp    c0003857 <alloc_imap_bit+0xdd>
c00037f3:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00037f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037fc:	01 d0                	add    %edx,%eax
c00037fe:	0f b6 18             	movzbl (%eax),%ebx
c0003801:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003804:	ba 01 00 00 00       	mov    $0x1,%edx
c0003809:	89 c1                	mov    %eax,%ecx
c000380b:	d3 e2                	shl    %cl,%edx
c000380d:	89 d0                	mov    %edx,%eax
c000380f:	89 c1                	mov    %eax,%ecx
c0003811:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003817:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000381a:	01 d0                	add    %edx,%eax
c000381c:	09 cb                	or     %ecx,%ebx
c000381e:	89 da                	mov    %ebx,%edx
c0003820:	88 10                	mov    %dl,(%eax)
c0003822:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003825:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000382c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000382f:	01 d0                	add    %edx,%eax
c0003831:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003834:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003839:	83 ec 0c             	sub    $0xc,%esp
c000383c:	6a 0a                	push   $0xa
c000383e:	68 00 02 00 00       	push   $0x200
c0003843:	50                   	push   %eax
c0003844:	ff 75 e8             	pushl  -0x18(%ebp)
c0003847:	ff 75 ec             	pushl  -0x14(%ebp)
c000384a:	e8 80 f1 ff ff       	call   c00029cf <rd_wt>
c000384f:	83 c4 20             	add    $0x20,%esp
c0003852:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003855:	eb 1b                	jmp    c0003872 <alloc_imap_bit+0xf8>
c0003857:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c000385b:	0f 8e 6b ff ff ff    	jle    c00037cc <alloc_imap_bit+0x52>
c0003861:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003865:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c000386c:	0f 8e 4e ff ff ff    	jle    c00037c0 <alloc_imap_bit+0x46>
c0003872:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003875:	c9                   	leave  
c0003876:	c3                   	ret    

c0003877 <alloc_smap_bit>:
c0003877:	55                   	push   %ebp
c0003878:	89 e5                	mov    %esp,%ebp
c000387a:	53                   	push   %ebx
c000387b:	83 ec 34             	sub    $0x34,%esp
c000387e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003882:	75 1c                	jne    c00038a0 <alloc_smap_bit+0x29>
c0003884:	68 27 03 00 00       	push   $0x327
c0003889:	68 e0 a4 00 c0       	push   $0xc000a4e0
c000388e:	68 e0 a4 00 c0       	push   $0xc000a4e0
c0003893:	68 cc a5 00 c0       	push   $0xc000a5cc
c0003898:	e8 d6 58 00 00       	call   c0009173 <assertion_failure>
c000389d:	83 c4 10             	add    $0x10,%esp
c00038a0:	e8 af 0e 00 00       	call   c0004754 <get_super_block>
c00038a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00038a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00038ab:	8b 40 08             	mov    0x8(%eax),%eax
c00038ae:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00038b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00038b4:	8b 40 04             	mov    0x4(%eax),%eax
c00038b7:	83 c0 02             	add    $0x2,%eax
c00038ba:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00038bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00038c4:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00038cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00038d2:	e9 20 01 00 00       	jmp    c00039f7 <alloc_smap_bit+0x180>
c00038d7:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00038da:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00038dd:	01 d0                	add    %edx,%eax
c00038df:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00038e2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00038e7:	83 ec 0c             	sub    $0xc,%esp
c00038ea:	6a 07                	push   $0x7
c00038ec:	68 00 02 00 00       	push   $0x200
c00038f1:	50                   	push   %eax
c00038f2:	ff 75 d8             	pushl  -0x28(%ebp)
c00038f5:	ff 75 d4             	pushl  -0x2c(%ebp)
c00038f8:	e8 d2 f0 ff ff       	call   c00029cf <rd_wt>
c00038fd:	83 c4 20             	add    $0x20,%esp
c0003900:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003907:	e9 b0 00 00 00       	jmp    c00039bc <alloc_smap_bit+0x145>
c000390c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003913:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003917:	0f 85 8c 00 00 00    	jne    c00039a9 <alloc_smap_bit+0x132>
c000391d:	eb 45                	jmp    c0003964 <alloc_smap_bit+0xed>
c000391f:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003925:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003928:	01 d0                	add    %edx,%eax
c000392a:	0f b6 00             	movzbl (%eax),%eax
c000392d:	0f be d0             	movsbl %al,%edx
c0003930:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003933:	89 c1                	mov    %eax,%ecx
c0003935:	d3 fa                	sar    %cl,%edx
c0003937:	89 d0                	mov    %edx,%eax
c0003939:	83 e0 01             	and    $0x1,%eax
c000393c:	85 c0                	test   %eax,%eax
c000393e:	74 06                	je     c0003946 <alloc_smap_bit+0xcf>
c0003940:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003944:	eb 1e                	jmp    c0003964 <alloc_smap_bit+0xed>
c0003946:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003949:	c1 e0 09             	shl    $0x9,%eax
c000394c:	89 c2                	mov    %eax,%edx
c000394e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003951:	01 d0                	add    %edx,%eax
c0003953:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000395a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000395d:	01 d0                	add    %edx,%eax
c000395f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003962:	eb 06                	jmp    c000396a <alloc_smap_bit+0xf3>
c0003964:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003968:	7e b5                	jle    c000391f <alloc_smap_bit+0xa8>
c000396a:	eb 3d                	jmp    c00039a9 <alloc_smap_bit+0x132>
c000396c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003970:	74 45                	je     c00039b7 <alloc_smap_bit+0x140>
c0003972:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003978:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000397b:	01 d0                	add    %edx,%eax
c000397d:	0f b6 18             	movzbl (%eax),%ebx
c0003980:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003983:	ba 01 00 00 00       	mov    $0x1,%edx
c0003988:	89 c1                	mov    %eax,%ecx
c000398a:	d3 e2                	shl    %cl,%edx
c000398c:	89 d0                	mov    %edx,%eax
c000398e:	89 c1                	mov    %eax,%ecx
c0003990:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003996:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003999:	01 d0                	add    %edx,%eax
c000399b:	09 cb                	or     %ecx,%ebx
c000399d:	89 da                	mov    %ebx,%edx
c000399f:	88 10                	mov    %dl,(%eax)
c00039a1:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00039a5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00039a9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00039ad:	74 09                	je     c00039b8 <alloc_smap_bit+0x141>
c00039af:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00039b3:	7e b7                	jle    c000396c <alloc_smap_bit+0xf5>
c00039b5:	eb 01                	jmp    c00039b8 <alloc_smap_bit+0x141>
c00039b7:	90                   	nop
c00039b8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00039bc:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c00039c3:	0f 8e 43 ff ff ff    	jle    c000390c <alloc_smap_bit+0x95>
c00039c9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00039cd:	74 1e                	je     c00039ed <alloc_smap_bit+0x176>
c00039cf:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00039d4:	83 ec 0c             	sub    $0xc,%esp
c00039d7:	6a 0a                	push   $0xa
c00039d9:	68 00 02 00 00       	push   $0x200
c00039de:	50                   	push   %eax
c00039df:	ff 75 d8             	pushl  -0x28(%ebp)
c00039e2:	ff 75 d4             	pushl  -0x2c(%ebp)
c00039e5:	e8 e5 ef ff ff       	call   c00029cf <rd_wt>
c00039ea:	83 c4 20             	add    $0x20,%esp
c00039ed:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00039f1:	74 12                	je     c0003a05 <alloc_smap_bit+0x18e>
c00039f3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00039f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039fa:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c00039fd:	0f 8c d4 fe ff ff    	jl     c00038d7 <alloc_smap_bit+0x60>
c0003a03:	eb 01                	jmp    c0003a06 <alloc_smap_bit+0x18f>
c0003a05:	90                   	nop
c0003a06:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a09:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003a0c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a0f:	8b 00                	mov    (%eax),%eax
c0003a11:	01 d0                	add    %edx,%eax
c0003a13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003a16:	c9                   	leave  
c0003a17:	c3                   	ret    

c0003a18 <new_inode>:
c0003a18:	55                   	push   %ebp
c0003a19:	89 e5                	mov    %esp,%ebp
c0003a1b:	83 ec 38             	sub    $0x38,%esp
c0003a1e:	83 ec 08             	sub    $0x8,%esp
c0003a21:	ff 75 0c             	pushl  0xc(%ebp)
c0003a24:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003a27:	50                   	push   %eax
c0003a28:	e8 80 fa ff ff       	call   c00034ad <get_inode>
c0003a2d:	83 c4 10             	add    $0x10,%esp
c0003a30:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a33:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003a37:	75 0a                	jne    c0003a43 <new_inode+0x2b>
c0003a39:	b8 00 00 00 00       	mov    $0x0,%eax
c0003a3e:	e9 f1 00 00 00       	jmp    c0003b34 <new_inode+0x11c>
c0003a43:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a46:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003a49:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003a50:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003a57:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003a5e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a61:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003a64:	83 ec 0c             	sub    $0xc,%esp
c0003a67:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003a6a:	50                   	push   %eax
c0003a6b:	e8 00 0b 00 00       	call   c0004570 <sync_inode>
c0003a70:	83 c4 10             	add    $0x10,%esp
c0003a73:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003a7a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003a81:	eb 1d                	jmp    c0003aa0 <new_inode+0x88>
c0003a83:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003a86:	89 d0                	mov    %edx,%eax
c0003a88:	c1 e0 02             	shl    $0x2,%eax
c0003a8b:	01 d0                	add    %edx,%eax
c0003a8d:	c1 e0 03             	shl    $0x3,%eax
c0003a90:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003a95:	8b 00                	mov    (%eax),%eax
c0003a97:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003a9a:	74 0c                	je     c0003aa8 <new_inode+0x90>
c0003a9c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003aa0:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003aa4:	7e dd                	jle    c0003a83 <new_inode+0x6b>
c0003aa6:	eb 01                	jmp    c0003aa9 <new_inode+0x91>
c0003aa8:	90                   	nop
c0003aa9:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003aac:	89 d0                	mov    %edx,%eax
c0003aae:	c1 e0 02             	shl    $0x2,%eax
c0003ab1:	01 d0                	add    %edx,%eax
c0003ab3:	c1 e0 03             	shl    $0x3,%eax
c0003ab6:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003abb:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003abe:	89 10                	mov    %edx,(%eax)
c0003ac0:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003ac3:	89 50 04             	mov    %edx,0x4(%eax)
c0003ac6:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003ac9:	89 50 08             	mov    %edx,0x8(%eax)
c0003acc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003acf:	89 50 0c             	mov    %edx,0xc(%eax)
c0003ad2:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003ad5:	89 50 10             	mov    %edx,0x10(%eax)
c0003ad8:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003adb:	89 50 14             	mov    %edx,0x14(%eax)
c0003ade:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003ae1:	89 50 18             	mov    %edx,0x18(%eax)
c0003ae4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003ae7:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003aea:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003aed:	89 50 20             	mov    %edx,0x20(%eax)
c0003af0:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003af3:	89 50 24             	mov    %edx,0x24(%eax)
c0003af6:	8b 45 08             	mov    0x8(%ebp),%eax
c0003af9:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003afc:	89 10                	mov    %edx,(%eax)
c0003afe:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003b01:	89 50 04             	mov    %edx,0x4(%eax)
c0003b04:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003b07:	89 50 08             	mov    %edx,0x8(%eax)
c0003b0a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003b0d:	89 50 0c             	mov    %edx,0xc(%eax)
c0003b10:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003b13:	89 50 10             	mov    %edx,0x10(%eax)
c0003b16:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003b19:	89 50 14             	mov    %edx,0x14(%eax)
c0003b1c:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003b1f:	89 50 18             	mov    %edx,0x18(%eax)
c0003b22:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003b25:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003b28:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003b2b:	89 50 20             	mov    %edx,0x20(%eax)
c0003b2e:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003b31:	89 50 24             	mov    %edx,0x24(%eax)
c0003b34:	c9                   	leave  
c0003b35:	c3                   	ret    

c0003b36 <new_dir_entry>:
c0003b36:	55                   	push   %ebp
c0003b37:	89 e5                	mov    %esp,%ebp
c0003b39:	83 ec 48             	sub    $0x48,%esp
c0003b3c:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003b43:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b46:	8b 40 04             	mov    0x4(%eax),%eax
c0003b49:	99                   	cltd   
c0003b4a:	f7 7d dc             	idivl  -0x24(%ebp)
c0003b4d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003b50:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b53:	8b 40 0c             	mov    0xc(%eax),%eax
c0003b56:	99                   	cltd   
c0003b57:	f7 7d dc             	idivl  -0x24(%ebp)
c0003b5a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003b5d:	e8 f2 0b 00 00       	call   c0004754 <get_super_block>
c0003b62:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003b65:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003b68:	8b 00                	mov    (%eax),%eax
c0003b6a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003b6d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b70:	8b 40 0c             	mov    0xc(%eax),%eax
c0003b73:	05 00 02 00 00       	add    $0x200,%eax
c0003b78:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003b7e:	85 c0                	test   %eax,%eax
c0003b80:	0f 48 c2             	cmovs  %edx,%eax
c0003b83:	c1 f8 09             	sar    $0x9,%eax
c0003b86:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003b89:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003b90:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003b97:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003b9e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003ba5:	eb 7f                	jmp    c0003c26 <new_dir_entry+0xf0>
c0003ba7:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003bac:	89 c1                	mov    %eax,%ecx
c0003bae:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003bb1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003bb4:	01 d0                	add    %edx,%eax
c0003bb6:	83 ec 0c             	sub    $0xc,%esp
c0003bb9:	6a 07                	push   $0x7
c0003bbb:	68 00 02 00 00       	push   $0x200
c0003bc0:	51                   	push   %ecx
c0003bc1:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003bc4:	50                   	push   %eax
c0003bc5:	e8 05 ee ff ff       	call   c00029cf <rd_wt>
c0003bca:	83 c4 20             	add    $0x20,%esp
c0003bcd:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003bd2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003bd5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003bdc:	eb 25                	jmp    c0003c03 <new_dir_entry+0xcd>
c0003bde:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003be2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003be5:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003be8:	7f 29                	jg     c0003c13 <new_dir_entry+0xdd>
c0003bea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003bed:	8b 00                	mov    (%eax),%eax
c0003bef:	85 c0                	test   %eax,%eax
c0003bf1:	75 08                	jne    c0003bfb <new_dir_entry+0xc5>
c0003bf3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003bf6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003bf9:	eb 19                	jmp    c0003c14 <new_dir_entry+0xde>
c0003bfb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003bff:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003c03:	b8 00 02 00 00       	mov    $0x200,%eax
c0003c08:	99                   	cltd   
c0003c09:	f7 7d dc             	idivl  -0x24(%ebp)
c0003c0c:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003c0f:	7c cd                	jl     c0003bde <new_dir_entry+0xa8>
c0003c11:	eb 01                	jmp    c0003c14 <new_dir_entry+0xde>
c0003c13:	90                   	nop
c0003c14:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003c17:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003c1a:	7f 16                	jg     c0003c32 <new_dir_entry+0xfc>
c0003c1c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003c20:	75 10                	jne    c0003c32 <new_dir_entry+0xfc>
c0003c22:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003c26:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003c29:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003c2c:	0f 8c 75 ff ff ff    	jl     c0003ba7 <new_dir_entry+0x71>
c0003c32:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003c35:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003c38:	75 0a                	jne    c0003c44 <new_dir_entry+0x10e>
c0003c3a:	b8 00 00 00 00       	mov    $0x0,%eax
c0003c3f:	e9 fc 00 00 00       	jmp    c0003d40 <new_dir_entry+0x20a>
c0003c44:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003c4b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003c4f:	75 1e                	jne    c0003c6f <new_dir_entry+0x139>
c0003c51:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c54:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003c57:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c5a:	8b 50 04             	mov    0x4(%eax),%edx
c0003c5d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003c60:	01 c2                	add    %eax,%edx
c0003c62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c65:	89 50 04             	mov    %edx,0x4(%eax)
c0003c68:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003c6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003c72:	8b 55 14             	mov    0x14(%ebp),%edx
c0003c75:	89 10                	mov    %edx,(%eax)
c0003c77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003c7a:	83 c0 04             	add    $0x4,%eax
c0003c7d:	83 ec 08             	sub    $0x8,%esp
c0003c80:	ff 75 10             	pushl  0x10(%ebp)
c0003c83:	50                   	push   %eax
c0003c84:	e8 39 72 00 00       	call   c000aec2 <Strcpy>
c0003c89:	83 c4 10             	add    $0x10,%esp
c0003c8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0003c8f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003c92:	8b 0a                	mov    (%edx),%ecx
c0003c94:	89 08                	mov    %ecx,(%eax)
c0003c96:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003c99:	89 48 04             	mov    %ecx,0x4(%eax)
c0003c9c:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003c9f:	89 48 08             	mov    %ecx,0x8(%eax)
c0003ca2:	8b 52 0c             	mov    0xc(%edx),%edx
c0003ca5:	89 50 0c             	mov    %edx,0xc(%eax)
c0003ca8:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003cad:	89 c1                	mov    %eax,%ecx
c0003caf:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003cb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003cb5:	01 d0                	add    %edx,%eax
c0003cb7:	83 ec 0c             	sub    $0xc,%esp
c0003cba:	6a 0a                	push   $0xa
c0003cbc:	68 00 02 00 00       	push   $0x200
c0003cc1:	51                   	push   %ecx
c0003cc2:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003cc5:	50                   	push   %eax
c0003cc6:	e8 04 ed ff ff       	call   c00029cf <rd_wt>
c0003ccb:	83 c4 20             	add    $0x20,%esp
c0003cce:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003cd2:	74 69                	je     c0003d3d <new_dir_entry+0x207>
c0003cd4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cd7:	8b 10                	mov    (%eax),%edx
c0003cd9:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003cdf:	8b 50 04             	mov    0x4(%eax),%edx
c0003ce2:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003ce8:	8b 50 08             	mov    0x8(%eax),%edx
c0003ceb:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003cf1:	8b 50 0c             	mov    0xc(%eax),%edx
c0003cf4:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003cfa:	8b 50 10             	mov    0x10(%eax),%edx
c0003cfd:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003d03:	8b 50 14             	mov    0x14(%eax),%edx
c0003d06:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003d0c:	8b 50 18             	mov    0x18(%eax),%edx
c0003d0f:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003d15:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003d18:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003d1e:	8b 50 20             	mov    0x20(%eax),%edx
c0003d21:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003d27:	8b 40 24             	mov    0x24(%eax),%eax
c0003d2a:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003d2f:	83 ec 0c             	sub    $0xc,%esp
c0003d32:	ff 75 0c             	pushl  0xc(%ebp)
c0003d35:	e8 36 08 00 00       	call   c0004570 <sync_inode>
c0003d3a:	83 c4 10             	add    $0x10,%esp
c0003d3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003d40:	c9                   	leave  
c0003d41:	c3                   	ret    

c0003d42 <do_unlink>:
c0003d42:	55                   	push   %ebp
c0003d43:	89 e5                	mov    %esp,%ebp
c0003d45:	53                   	push   %ebx
c0003d46:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003d4c:	83 ec 08             	sub    $0x8,%esp
c0003d4f:	ff 75 08             	pushl  0x8(%ebp)
c0003d52:	68 e1 a5 00 c0       	push   $0xc000a5e1
c0003d57:	e8 94 5f 00 00       	call   c0009cf0 <strcmp>
c0003d5c:	83 c4 10             	add    $0x10,%esp
c0003d5f:	85 c0                	test   %eax,%eax
c0003d61:	75 10                	jne    c0003d73 <do_unlink+0x31>
c0003d63:	83 ec 0c             	sub    $0xc,%esp
c0003d66:	68 e3 a5 00 c0       	push   $0xc000a5e3
c0003d6b:	e8 e5 53 00 00       	call   c0009155 <panic>
c0003d70:	83 c4 10             	add    $0x10,%esp
c0003d73:	83 ec 0c             	sub    $0xc,%esp
c0003d76:	ff 75 08             	pushl  0x8(%ebp)
c0003d79:	e8 31 f5 ff ff       	call   c00032af <search_file>
c0003d7e:	83 c4 10             	add    $0x10,%esp
c0003d81:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003d84:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003d88:	75 10                	jne    c0003d9a <do_unlink+0x58>
c0003d8a:	83 ec 0c             	sub    $0xc,%esp
c0003d8d:	68 ff a5 00 c0       	push   $0xc000a5ff
c0003d92:	e8 be 53 00 00       	call   c0009155 <panic>
c0003d97:	83 c4 10             	add    $0x10,%esp
c0003d9a:	83 ec 08             	sub    $0x8,%esp
c0003d9d:	ff 75 d0             	pushl  -0x30(%ebp)
c0003da0:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003da6:	50                   	push   %eax
c0003da7:	e8 01 f7 ff ff       	call   c00034ad <get_inode>
c0003dac:	83 c4 10             	add    $0x10,%esp
c0003daf:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003db2:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003db6:	75 10                	jne    c0003dc8 <do_unlink+0x86>
c0003db8:	83 ec 0c             	sub    $0xc,%esp
c0003dbb:	68 ff a5 00 c0       	push   $0xc000a5ff
c0003dc0:	e8 90 53 00 00       	call   c0009155 <panic>
c0003dc5:	83 c4 10             	add    $0x10,%esp
c0003dc8:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003dcb:	85 c0                	test   %eax,%eax
c0003dcd:	7e 10                	jle    c0003ddf <do_unlink+0x9d>
c0003dcf:	83 ec 0c             	sub    $0xc,%esp
c0003dd2:	68 18 a6 00 c0       	push   $0xc000a618
c0003dd7:	e8 79 53 00 00       	call   c0009155 <panic>
c0003ddc:	83 c4 10             	add    $0x10,%esp
c0003ddf:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003de5:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003de8:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003deb:	8d 50 07             	lea    0x7(%eax),%edx
c0003dee:	85 c0                	test   %eax,%eax
c0003df0:	0f 48 c2             	cmovs  %edx,%eax
c0003df3:	c1 f8 03             	sar    $0x3,%eax
c0003df6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003df9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003dfc:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003e02:	85 c0                	test   %eax,%eax
c0003e04:	0f 48 c2             	cmovs  %edx,%eax
c0003e07:	c1 f8 09             	sar    $0x9,%eax
c0003e0a:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003e0d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003e10:	99                   	cltd   
c0003e11:	c1 ea 1d             	shr    $0x1d,%edx
c0003e14:	01 d0                	add    %edx,%eax
c0003e16:	83 e0 07             	and    $0x7,%eax
c0003e19:	29 d0                	sub    %edx,%eax
c0003e1b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003e1e:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003e25:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e2a:	89 c2                	mov    %eax,%edx
c0003e2c:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003e2f:	83 c0 02             	add    $0x2,%eax
c0003e32:	83 ec 0c             	sub    $0xc,%esp
c0003e35:	6a 07                	push   $0x7
c0003e37:	68 00 02 00 00       	push   $0x200
c0003e3c:	52                   	push   %edx
c0003e3d:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e40:	50                   	push   %eax
c0003e41:	e8 89 eb ff ff       	call   c00029cf <rd_wt>
c0003e46:	83 c4 20             	add    $0x20,%esp
c0003e49:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003e4f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003e52:	01 d0                	add    %edx,%eax
c0003e54:	0f b6 10             	movzbl (%eax),%edx
c0003e57:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003e5a:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003e5f:	89 c1                	mov    %eax,%ecx
c0003e61:	d3 e3                	shl    %cl,%ebx
c0003e63:	89 d8                	mov    %ebx,%eax
c0003e65:	f7 d0                	not    %eax
c0003e67:	89 c3                	mov    %eax,%ebx
c0003e69:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003e6f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003e72:	01 c8                	add    %ecx,%eax
c0003e74:	21 da                	and    %ebx,%edx
c0003e76:	88 10                	mov    %dl,(%eax)
c0003e78:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e7d:	89 c2                	mov    %eax,%edx
c0003e7f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003e82:	83 c0 02             	add    $0x2,%eax
c0003e85:	83 ec 0c             	sub    $0xc,%esp
c0003e88:	6a 0a                	push   $0xa
c0003e8a:	68 00 02 00 00       	push   $0x200
c0003e8f:	52                   	push   %edx
c0003e90:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e93:	50                   	push   %eax
c0003e94:	e8 36 eb ff ff       	call   c00029cf <rd_wt>
c0003e99:	83 c4 20             	add    $0x20,%esp
c0003e9c:	e8 b3 08 00 00       	call   c0004754 <get_super_block>
c0003ea1:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003ea4:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003eaa:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003ead:	8b 00                	mov    (%eax),%eax
c0003eaf:	29 c2                	sub    %eax,%edx
c0003eb1:	89 d0                	mov    %edx,%eax
c0003eb3:	83 c0 01             	add    $0x1,%eax
c0003eb6:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003eb9:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003ebc:	8d 50 07             	lea    0x7(%eax),%edx
c0003ebf:	85 c0                	test   %eax,%eax
c0003ec1:	0f 48 c2             	cmovs  %edx,%eax
c0003ec4:	c1 f8 03             	sar    $0x3,%eax
c0003ec7:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003eca:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003ecd:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003ed3:	85 c0                	test   %eax,%eax
c0003ed5:	0f 48 c2             	cmovs  %edx,%eax
c0003ed8:	c1 f8 09             	sar    $0x9,%eax
c0003edb:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003ede:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003ee1:	99                   	cltd   
c0003ee2:	c1 ea 1d             	shr    $0x1d,%edx
c0003ee5:	01 d0                	add    %edx,%eax
c0003ee7:	83 e0 07             	and    $0x7,%eax
c0003eea:	29 d0                	sub    %edx,%eax
c0003eec:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003eef:	b8 08 00 00 00       	mov    $0x8,%eax
c0003ef4:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003ef7:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003efa:	29 c2                	sub    %eax,%edx
c0003efc:	89 d0                	mov    %edx,%eax
c0003efe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003f01:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f04:	8d 50 07             	lea    0x7(%eax),%edx
c0003f07:	85 c0                	test   %eax,%eax
c0003f09:	0f 48 c2             	cmovs  %edx,%eax
c0003f0c:	c1 f8 03             	sar    $0x3,%eax
c0003f0f:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003f12:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003f17:	89 c1                	mov    %eax,%ecx
c0003f19:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003f1c:	8b 40 04             	mov    0x4(%eax),%eax
c0003f1f:	8d 50 02             	lea    0x2(%eax),%edx
c0003f22:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003f25:	01 d0                	add    %edx,%eax
c0003f27:	83 ec 0c             	sub    $0xc,%esp
c0003f2a:	6a 07                	push   $0x7
c0003f2c:	68 00 02 00 00       	push   $0x200
c0003f31:	51                   	push   %ecx
c0003f32:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f35:	50                   	push   %eax
c0003f36:	e8 94 ea ff ff       	call   c00029cf <rd_wt>
c0003f3b:	83 c4 20             	add    $0x20,%esp
c0003f3e:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003f44:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003f47:	01 d0                	add    %edx,%eax
c0003f49:	0f b6 10             	movzbl (%eax),%edx
c0003f4c:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003f4f:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003f54:	89 c1                	mov    %eax,%ecx
c0003f56:	d3 e3                	shl    %cl,%ebx
c0003f58:	89 d8                	mov    %ebx,%eax
c0003f5a:	f7 d0                	not    %eax
c0003f5c:	89 c3                	mov    %eax,%ebx
c0003f5e:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003f64:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003f67:	01 c8                	add    %ecx,%eax
c0003f69:	21 da                	and    %ebx,%edx
c0003f6b:	88 10                	mov    %dl,(%eax)
c0003f6d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003f74:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003f77:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003f7a:	eb 6b                	jmp    c0003fe7 <do_unlink+0x2a5>
c0003f7c:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003f83:	75 4c                	jne    c0003fd1 <do_unlink+0x28f>
c0003f85:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003f8c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003f91:	83 ec 0c             	sub    $0xc,%esp
c0003f94:	6a 0a                	push   $0xa
c0003f96:	68 00 02 00 00       	push   $0x200
c0003f9b:	50                   	push   %eax
c0003f9c:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f9f:	ff 75 ec             	pushl  -0x14(%ebp)
c0003fa2:	e8 28 ea ff ff       	call   c00029cf <rd_wt>
c0003fa7:	83 c4 20             	add    $0x20,%esp
c0003faa:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003faf:	89 c1                	mov    %eax,%ecx
c0003fb1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003fb4:	8d 50 01             	lea    0x1(%eax),%edx
c0003fb7:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003fba:	83 ec 0c             	sub    $0xc,%esp
c0003fbd:	6a 07                	push   $0x7
c0003fbf:	68 00 02 00 00       	push   $0x200
c0003fc4:	51                   	push   %ecx
c0003fc5:	ff 75 b8             	pushl  -0x48(%ebp)
c0003fc8:	50                   	push   %eax
c0003fc9:	e8 01 ea ff ff       	call   c00029cf <rd_wt>
c0003fce:	83 c4 20             	add    $0x20,%esp
c0003fd1:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003fd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003fda:	01 d0                	add    %edx,%eax
c0003fdc:	c6 00 00             	movb   $0x0,(%eax)
c0003fdf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003fe3:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0003fe7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003fea:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0003fed:	7c 8d                	jl     c0003f7c <do_unlink+0x23a>
c0003fef:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003ff6:	75 4c                	jne    c0004044 <do_unlink+0x302>
c0003ff8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003fff:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004004:	83 ec 0c             	sub    $0xc,%esp
c0004007:	6a 0a                	push   $0xa
c0004009:	68 00 02 00 00       	push   $0x200
c000400e:	50                   	push   %eax
c000400f:	ff 75 b8             	pushl  -0x48(%ebp)
c0004012:	ff 75 ec             	pushl  -0x14(%ebp)
c0004015:	e8 b5 e9 ff ff       	call   c00029cf <rd_wt>
c000401a:	83 c4 20             	add    $0x20,%esp
c000401d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004022:	89 c1                	mov    %eax,%ecx
c0004024:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004027:	8d 50 01             	lea    0x1(%eax),%edx
c000402a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c000402d:	83 ec 0c             	sub    $0xc,%esp
c0004030:	6a 07                	push   $0x7
c0004032:	68 00 02 00 00       	push   $0x200
c0004037:	51                   	push   %ecx
c0004038:	ff 75 b8             	pushl  -0x48(%ebp)
c000403b:	50                   	push   %eax
c000403c:	e8 8e e9 ff ff       	call   c00029cf <rd_wt>
c0004041:	83 c4 20             	add    $0x20,%esp
c0004044:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000404a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000404d:	01 d0                	add    %edx,%eax
c000404f:	0f b6 10             	movzbl (%eax),%edx
c0004052:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004055:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c000405a:	89 c1                	mov    %eax,%ecx
c000405c:	d3 e3                	shl    %cl,%ebx
c000405e:	89 d8                	mov    %ebx,%eax
c0004060:	89 c3                	mov    %eax,%ebx
c0004062:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0004068:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000406b:	01 c8                	add    %ecx,%eax
c000406d:	21 da                	and    %ebx,%edx
c000406f:	88 10                	mov    %dl,(%eax)
c0004071:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004076:	83 ec 0c             	sub    $0xc,%esp
c0004079:	6a 0a                	push   $0xa
c000407b:	68 00 02 00 00       	push   $0x200
c0004080:	50                   	push   %eax
c0004081:	ff 75 b8             	pushl  -0x48(%ebp)
c0004084:	ff 75 ec             	pushl  -0x14(%ebp)
c0004087:	e8 43 e9 ff ff       	call   c00029cf <rd_wt>
c000408c:	83 c4 20             	add    $0x20,%esp
c000408f:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c0004096:	00 00 00 
c0004099:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c00040a0:	00 00 00 
c00040a3:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c00040aa:	00 00 00 
c00040ad:	83 ec 0c             	sub    $0xc,%esp
c00040b0:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00040b6:	50                   	push   %eax
c00040b7:	e8 b4 04 00 00       	call   c0004570 <sync_inode>
c00040bc:	83 c4 10             	add    $0x10,%esp
c00040bf:	83 ec 0c             	sub    $0xc,%esp
c00040c2:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00040c8:	50                   	push   %eax
c00040c9:	e8 f6 05 00 00       	call   c00046c4 <put_inode>
c00040ce:	83 c4 10             	add    $0x10,%esp
c00040d1:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00040d4:	8b 00                	mov    (%eax),%eax
c00040d6:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00040d9:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c00040e0:	8b 45 98             	mov    -0x68(%ebp),%eax
c00040e3:	8b 40 04             	mov    0x4(%eax),%eax
c00040e6:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00040e9:	8b 45 98             	mov    -0x68(%ebp),%eax
c00040ec:	8b 40 0c             	mov    0xc(%eax),%eax
c00040ef:	89 45 90             	mov    %eax,-0x70(%ebp)
c00040f2:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00040f5:	c1 e8 04             	shr    $0x4,%eax
c00040f8:	89 45 8c             	mov    %eax,-0x74(%ebp)
c00040fb:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004102:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0004109:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004110:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0004117:	e9 a5 00 00 00       	jmp    c00041c1 <do_unlink+0x47f>
c000411c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004121:	89 c1                	mov    %eax,%ecx
c0004123:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004126:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004129:	01 d0                	add    %edx,%eax
c000412b:	83 ec 0c             	sub    $0xc,%esp
c000412e:	6a 07                	push   $0x7
c0004130:	68 00 02 00 00       	push   $0x200
c0004135:	51                   	push   %ecx
c0004136:	ff 75 b8             	pushl  -0x48(%ebp)
c0004139:	50                   	push   %eax
c000413a:	e8 90 e8 ff ff       	call   c00029cf <rd_wt>
c000413f:	83 c4 20             	add    $0x20,%esp
c0004142:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0004147:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000414a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0004151:	eb 51                	jmp    c00041a4 <do_unlink+0x462>
c0004153:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0004157:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000415a:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c000415d:	7f 4f                	jg     c00041ae <do_unlink+0x46c>
c000415f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004162:	83 c0 10             	add    $0x10,%eax
c0004165:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004168:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000416b:	83 c0 04             	add    $0x4,%eax
c000416e:	83 ec 08             	sub    $0x8,%esp
c0004171:	ff 75 08             	pushl  0x8(%ebp)
c0004174:	50                   	push   %eax
c0004175:	e8 76 5b 00 00       	call   c0009cf0 <strcmp>
c000417a:	83 c4 10             	add    $0x10,%esp
c000417d:	85 c0                	test   %eax,%eax
c000417f:	75 1b                	jne    c000419c <do_unlink+0x45a>
c0004181:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0004188:	83 ec 04             	sub    $0x4,%esp
c000418b:	6a 10                	push   $0x10
c000418d:	6a 00                	push   $0x0
c000418f:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004192:	e8 0c 6d 00 00       	call   c000aea3 <Memset>
c0004197:	83 c4 10             	add    $0x10,%esp
c000419a:	eb 13                	jmp    c00041af <do_unlink+0x46d>
c000419c:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c00041a0:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c00041a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00041a7:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00041aa:	7c a7                	jl     c0004153 <do_unlink+0x411>
c00041ac:	eb 01                	jmp    c00041af <do_unlink+0x46d>
c00041ae:	90                   	nop
c00041af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00041b2:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00041b5:	7f 16                	jg     c00041cd <do_unlink+0x48b>
c00041b7:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00041bb:	75 10                	jne    c00041cd <do_unlink+0x48b>
c00041bd:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c00041c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00041c4:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00041c7:	0f 8c 4f ff ff ff    	jl     c000411c <do_unlink+0x3da>
c00041cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00041d0:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00041d3:	75 17                	jne    c00041ec <do_unlink+0x4aa>
c00041d5:	8b 45 98             	mov    -0x68(%ebp),%eax
c00041d8:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00041db:	89 50 04             	mov    %edx,0x4(%eax)
c00041de:	83 ec 0c             	sub    $0xc,%esp
c00041e1:	ff 75 98             	pushl  -0x68(%ebp)
c00041e4:	e8 87 03 00 00       	call   c0004570 <sync_inode>
c00041e9:	83 c4 10             	add    $0x10,%esp
c00041ec:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00041f0:	74 26                	je     c0004218 <do_unlink+0x4d6>
c00041f2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00041f7:	89 c1                	mov    %eax,%ecx
c00041f9:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00041fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00041ff:	01 d0                	add    %edx,%eax
c0004201:	83 ec 0c             	sub    $0xc,%esp
c0004204:	6a 0a                	push   $0xa
c0004206:	68 00 02 00 00       	push   $0x200
c000420b:	51                   	push   %ecx
c000420c:	ff 75 b8             	pushl  -0x48(%ebp)
c000420f:	50                   	push   %eax
c0004210:	e8 ba e7 ff ff       	call   c00029cf <rd_wt>
c0004215:	83 c4 20             	add    $0x20,%esp
c0004218:	90                   	nop
c0004219:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000421c:	c9                   	leave  
c000421d:	c3                   	ret    

c000421e <do_rdwt>:
c000421e:	55                   	push   %ebp
c000421f:	89 e5                	mov    %esp,%ebp
c0004221:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0004227:	8b 45 08             	mov    0x8(%ebp),%eax
c000422a:	8b 40 68             	mov    0x68(%eax),%eax
c000422d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004230:	8b 45 08             	mov    0x8(%ebp),%eax
c0004233:	8b 40 50             	mov    0x50(%eax),%eax
c0004236:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0004239:	8b 45 08             	mov    0x8(%ebp),%eax
c000423c:	8b 40 5c             	mov    0x5c(%eax),%eax
c000423f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004242:	8b 45 08             	mov    0x8(%ebp),%eax
c0004245:	8b 00                	mov    (%eax),%eax
c0004247:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000424a:	8b 45 08             	mov    0x8(%ebp),%eax
c000424d:	8b 40 10             	mov    0x10(%eax),%eax
c0004250:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004253:	8b 45 08             	mov    0x8(%ebp),%eax
c0004256:	8b 40 40             	mov    0x40(%eax),%eax
c0004259:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000425c:	83 ec 0c             	sub    $0xc,%esp
c000425f:	ff 75 cc             	pushl  -0x34(%ebp)
c0004262:	e8 da 06 00 00       	call   c0004941 <pid2proc>
c0004267:	83 c4 10             	add    $0x10,%esp
c000426a:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000426d:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004270:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0004273:	83 c2 50             	add    $0x50,%edx
c0004276:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c000427a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000427d:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0004280:	8b 40 08             	mov    0x8(%eax),%eax
c0004283:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0004286:	8b 45 08             	mov    0x8(%ebp),%eax
c0004289:	8b 00                	mov    (%eax),%eax
c000428b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000428e:	83 ec 08             	sub    $0x8,%esp
c0004291:	ff 75 b8             	pushl  -0x48(%ebp)
c0004294:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c000429a:	50                   	push   %eax
c000429b:	e8 0d f2 ff ff       	call   c00034ad <get_inode>
c00042a0:	83 c4 10             	add    $0x10,%esp
c00042a3:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00042a6:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c00042aa:	75 10                	jne    c00042bc <do_rdwt+0x9e>
c00042ac:	83 ec 0c             	sub    $0xc,%esp
c00042af:	68 50 a6 00 c0       	push   $0xc000a650
c00042b4:	e8 9c 4e 00 00       	call   c0009155 <panic>
c00042b9:	83 c4 10             	add    $0x10,%esp
c00042bc:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00042c2:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00042c5:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00042c8:	8b 40 04             	mov    0x4(%eax),%eax
c00042cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00042ce:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c00042d2:	74 22                	je     c00042f6 <do_rdwt+0xd8>
c00042d4:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c00042d8:	74 1c                	je     c00042f6 <do_rdwt+0xd8>
c00042da:	68 d4 04 00 00       	push   $0x4d4
c00042df:	68 e0 a4 00 c0       	push   $0xc000a4e0
c00042e4:	68 e0 a4 00 c0       	push   $0xc000a4e0
c00042e9:	68 60 a6 00 c0       	push   $0xc000a660
c00042ee:	e8 80 4e 00 00       	call   c0009173 <assertion_failure>
c00042f3:	83 c4 10             	add    $0x10,%esp
c00042f6:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c00042fc:	83 f8 01             	cmp    $0x1,%eax
c00042ff:	75 4a                	jne    c000434b <do_rdwt+0x12d>
c0004301:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004305:	75 09                	jne    c0004310 <do_rdwt+0xf2>
c0004307:	c7 45 f0 d2 07 00 00 	movl   $0x7d2,-0x10(%ebp)
c000430e:	eb 0d                	jmp    c000431d <do_rdwt+0xff>
c0004310:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004314:	75 07                	jne    c000431d <do_rdwt+0xff>
c0004316:	c7 45 f0 d3 07 00 00 	movl   $0x7d3,-0x10(%ebp)
c000431d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004320:	8b 45 08             	mov    0x8(%ebp),%eax
c0004323:	89 50 68             	mov    %edx,0x68(%eax)
c0004326:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0004329:	8b 45 08             	mov    0x8(%ebp),%eax
c000432c:	89 50 58             	mov    %edx,0x58(%eax)
c000432f:	83 ec 04             	sub    $0x4,%esp
c0004332:	6a 02                	push   $0x2
c0004334:	ff 75 08             	pushl  0x8(%ebp)
c0004337:	6a 03                	push   $0x3
c0004339:	e8 56 56 00 00       	call   c0009994 <send_rec>
c000433e:	83 c4 10             	add    $0x10,%esp
c0004341:	b8 00 00 00 00       	mov    $0x0,%eax
c0004346:	e9 23 02 00 00       	jmp    c000456e <do_rdwt+0x350>
c000434b:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c000434f:	75 18                	jne    c0004369 <do_rdwt+0x14b>
c0004351:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0004357:	c1 e0 09             	shl    $0x9,%eax
c000435a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000435d:	75 0a                	jne    c0004369 <do_rdwt+0x14b>
c000435f:	b8 00 00 00 00       	mov    $0x0,%eax
c0004364:	e9 05 02 00 00       	jmp    c000456e <do_rdwt+0x350>
c0004369:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000436d:	75 1b                	jne    c000438a <do_rdwt+0x16c>
c000436f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004376:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004379:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000437c:	01 d0                	add    %edx,%eax
c000437e:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004381:	0f 4e 45 ac          	cmovle -0x54(%ebp),%eax
c0004385:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004388:	eb 19                	jmp    c00043a3 <do_rdwt+0x185>
c000438a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000438d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004390:	01 c2                	add    %eax,%edx
c0004392:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0004398:	c1 e0 09             	shl    $0x9,%eax
c000439b:	39 c2                	cmp    %eax,%edx
c000439d:	0f 4e c2             	cmovle %edx,%eax
c00043a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00043a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00043a6:	99                   	cltd   
c00043a7:	c1 ea 17             	shr    $0x17,%edx
c00043aa:	01 d0                	add    %edx,%eax
c00043ac:	25 ff 01 00 00       	and    $0x1ff,%eax
c00043b1:	29 d0                	sub    %edx,%eax
c00043b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00043b6:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c00043bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00043bf:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00043c5:	85 c0                	test   %eax,%eax
c00043c7:	0f 48 c1             	cmovs  %ecx,%eax
c00043ca:	c1 f8 09             	sar    $0x9,%eax
c00043cd:	01 d0                	add    %edx,%eax
c00043cf:	89 45 a8             	mov    %eax,-0x58(%ebp)
c00043d2:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c00043d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00043db:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c00043e1:	85 c0                	test   %eax,%eax
c00043e3:	0f 48 c1             	cmovs  %ecx,%eax
c00043e6:	c1 f8 09             	sar    $0x9,%eax
c00043e9:	01 d0                	add    %edx,%eax
c00043eb:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c00043ee:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00043f1:	2b 45 a8             	sub    -0x58(%ebp),%eax
c00043f4:	ba 00 00 10 00       	mov    $0x100000,%edx
c00043f9:	39 d0                	cmp    %edx,%eax
c00043fb:	7d 0b                	jge    c0004408 <do_rdwt+0x1ea>
c00043fd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004400:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004403:	83 c0 01             	add    $0x1,%eax
c0004406:	eb 05                	jmp    c000440d <do_rdwt+0x1ef>
c0004408:	b8 00 00 10 00       	mov    $0x100000,%eax
c000440d:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004410:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004413:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004416:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000441d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004420:	8b 00                	mov    (%eax),%eax
c0004422:	83 ec 0c             	sub    $0xc,%esp
c0004425:	50                   	push   %eax
c0004426:	e8 16 05 00 00       	call   c0004941 <pid2proc>
c000442b:	83 c4 10             	add    $0x10,%esp
c000442e:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004431:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004434:	83 ec 08             	sub    $0x8,%esp
c0004437:	50                   	push   %eax
c0004438:	ff 75 c8             	pushl  -0x38(%ebp)
c000443b:	e8 47 28 00 00       	call   c0006c87 <alloc_virtual_memory>
c0004440:	83 c4 10             	add    $0x10,%esp
c0004443:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004446:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0004449:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000444c:	e9 c5 00 00 00       	jmp    c0004516 <do_rdwt+0x2f8>
c0004451:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004454:	c1 e0 09             	shl    $0x9,%eax
c0004457:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000445a:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c000445d:	0f 4e 45 e4          	cmovle -0x1c(%ebp),%eax
c0004461:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004464:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c000446b:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000446f:	75 46                	jne    c00044b7 <do_rdwt+0x299>
c0004471:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004474:	c1 e0 09             	shl    $0x9,%eax
c0004477:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c000447d:	83 ec 0c             	sub    $0xc,%esp
c0004480:	6a 07                	push   $0x7
c0004482:	50                   	push   %eax
c0004483:	52                   	push   %edx
c0004484:	ff 75 90             	pushl  -0x70(%ebp)
c0004487:	ff 75 dc             	pushl  -0x24(%ebp)
c000448a:	e8 40 e5 ff ff       	call   c00029cf <rd_wt>
c000448f:	83 c4 20             	add    $0x20,%esp
c0004492:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004498:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000449b:	01 d0                	add    %edx,%eax
c000449d:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c00044a0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00044a3:	01 ca                	add    %ecx,%edx
c00044a5:	83 ec 04             	sub    $0x4,%esp
c00044a8:	ff 75 94             	pushl  -0x6c(%ebp)
c00044ab:	50                   	push   %eax
c00044ac:	52                   	push   %edx
c00044ad:	e8 c3 69 00 00       	call   c000ae75 <Memcpy>
c00044b2:	83 c4 10             	add    $0x10,%esp
c00044b5:	eb 46                	jmp    c00044fd <do_rdwt+0x2df>
c00044b7:	8b 55 98             	mov    -0x68(%ebp),%edx
c00044ba:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00044bd:	01 d0                	add    %edx,%eax
c00044bf:	89 c1                	mov    %eax,%ecx
c00044c1:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00044c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00044ca:	01 d0                	add    %edx,%eax
c00044cc:	83 ec 04             	sub    $0x4,%esp
c00044cf:	ff 75 94             	pushl  -0x6c(%ebp)
c00044d2:	51                   	push   %ecx
c00044d3:	50                   	push   %eax
c00044d4:	e8 9c 69 00 00       	call   c000ae75 <Memcpy>
c00044d9:	83 c4 10             	add    $0x10,%esp
c00044dc:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00044df:	c1 e0 09             	shl    $0x9,%eax
c00044e2:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00044e8:	83 ec 0c             	sub    $0xc,%esp
c00044eb:	6a 0a                	push   $0xa
c00044ed:	50                   	push   %eax
c00044ee:	52                   	push   %edx
c00044ef:	ff 75 90             	pushl  -0x70(%ebp)
c00044f2:	ff 75 dc             	pushl  -0x24(%ebp)
c00044f5:	e8 d5 e4 ff ff       	call   c00029cf <rd_wt>
c00044fa:	83 c4 20             	add    $0x20,%esp
c00044fd:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004500:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c0004503:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004506:	01 45 e0             	add    %eax,-0x20(%ebp)
c0004509:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004510:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004513:	01 45 dc             	add    %eax,-0x24(%ebp)
c0004516:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004519:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c000451c:	7f 0a                	jg     c0004528 <do_rdwt+0x30a>
c000451e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0004522:	0f 85 29 ff ff ff    	jne    c0004451 <do_rdwt+0x233>
c0004528:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000452b:	8b 50 04             	mov    0x4(%eax),%edx
c000452e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004531:	01 c2                	add    %eax,%edx
c0004533:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0004536:	89 50 04             	mov    %edx,0x4(%eax)
c0004539:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000453c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000453f:	01 c2                	add    %eax,%edx
c0004541:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004547:	39 c2                	cmp    %eax,%edx
c0004549:	7e 20                	jle    c000456b <do_rdwt+0x34d>
c000454b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000454e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004551:	01 d0                	add    %edx,%eax
c0004553:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c0004559:	83 ec 0c             	sub    $0xc,%esp
c000455c:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0004562:	50                   	push   %eax
c0004563:	e8 08 00 00 00       	call   c0004570 <sync_inode>
c0004568:	83 c4 10             	add    $0x10,%esp
c000456b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000456e:	c9                   	leave  
c000456f:	c3                   	ret    

c0004570 <sync_inode>:
c0004570:	55                   	push   %ebp
c0004571:	89 e5                	mov    %esp,%ebp
c0004573:	53                   	push   %ebx
c0004574:	83 ec 34             	sub    $0x34,%esp
c0004577:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000457e:	eb 74                	jmp    c00045f4 <sync_inode+0x84>
c0004580:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004583:	89 d0                	mov    %edx,%eax
c0004585:	c1 e0 02             	shl    $0x2,%eax
c0004588:	01 d0                	add    %edx,%eax
c000458a:	c1 e0 03             	shl    $0x3,%eax
c000458d:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0004592:	8b 10                	mov    (%eax),%edx
c0004594:	8b 45 08             	mov    0x8(%ebp),%eax
c0004597:	8b 40 10             	mov    0x10(%eax),%eax
c000459a:	39 c2                	cmp    %eax,%edx
c000459c:	75 52                	jne    c00045f0 <sync_inode+0x80>
c000459e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045a1:	89 d0                	mov    %edx,%eax
c00045a3:	c1 e0 02             	shl    $0x2,%eax
c00045a6:	01 d0                	add    %edx,%eax
c00045a8:	c1 e0 03             	shl    $0x3,%eax
c00045ab:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c00045b1:	8b 45 08             	mov    0x8(%ebp),%eax
c00045b4:	8b 08                	mov    (%eax),%ecx
c00045b6:	89 0a                	mov    %ecx,(%edx)
c00045b8:	8b 48 04             	mov    0x4(%eax),%ecx
c00045bb:	89 4a 04             	mov    %ecx,0x4(%edx)
c00045be:	8b 48 08             	mov    0x8(%eax),%ecx
c00045c1:	89 4a 08             	mov    %ecx,0x8(%edx)
c00045c4:	8b 48 0c             	mov    0xc(%eax),%ecx
c00045c7:	89 4a 0c             	mov    %ecx,0xc(%edx)
c00045ca:	8b 48 10             	mov    0x10(%eax),%ecx
c00045cd:	89 4a 10             	mov    %ecx,0x10(%edx)
c00045d0:	8b 48 14             	mov    0x14(%eax),%ecx
c00045d3:	89 4a 14             	mov    %ecx,0x14(%edx)
c00045d6:	8b 48 18             	mov    0x18(%eax),%ecx
c00045d9:	89 4a 18             	mov    %ecx,0x18(%edx)
c00045dc:	8b 48 1c             	mov    0x1c(%eax),%ecx
c00045df:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c00045e2:	8b 48 20             	mov    0x20(%eax),%ecx
c00045e5:	89 4a 20             	mov    %ecx,0x20(%edx)
c00045e8:	8b 40 24             	mov    0x24(%eax),%eax
c00045eb:	89 42 24             	mov    %eax,0x24(%edx)
c00045ee:	eb 0a                	jmp    c00045fa <sync_inode+0x8a>
c00045f0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00045f4:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c00045f8:	7e 86                	jle    c0004580 <sync_inode+0x10>
c00045fa:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0004601:	8b 45 08             	mov    0x8(%ebp),%eax
c0004604:	8b 40 10             	mov    0x10(%eax),%eax
c0004607:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000460a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000460d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004610:	b8 00 02 00 00       	mov    $0x200,%eax
c0004615:	99                   	cltd   
c0004616:	f7 7d f0             	idivl  -0x10(%ebp)
c0004619:	89 c3                	mov    %eax,%ebx
c000461b:	89 c8                	mov    %ecx,%eax
c000461d:	99                   	cltd   
c000461e:	f7 fb                	idiv   %ebx
c0004620:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004623:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004626:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004629:	b8 00 02 00 00       	mov    $0x200,%eax
c000462e:	99                   	cltd   
c000462f:	f7 7d f0             	idivl  -0x10(%ebp)
c0004632:	89 c3                	mov    %eax,%ebx
c0004634:	89 c8                	mov    %ecx,%eax
c0004636:	99                   	cltd   
c0004637:	f7 fb                	idiv   %ebx
c0004639:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000463c:	8b 45 08             	mov    0x8(%ebp),%eax
c000463f:	8b 40 20             	mov    0x20(%eax),%eax
c0004642:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004645:	e8 0a 01 00 00       	call   c0004754 <get_super_block>
c000464a:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000464d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004650:	8b 40 04             	mov    0x4(%eax),%eax
c0004653:	8d 50 02             	lea    0x2(%eax),%edx
c0004656:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004659:	8b 40 08             	mov    0x8(%eax),%eax
c000465c:	01 c2                	add    %eax,%edx
c000465e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004661:	01 d0                	add    %edx,%eax
c0004663:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004666:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000466b:	83 ec 0c             	sub    $0xc,%esp
c000466e:	6a 07                	push   $0x7
c0004670:	68 00 02 00 00       	push   $0x200
c0004675:	50                   	push   %eax
c0004676:	ff 75 e0             	pushl  -0x20(%ebp)
c0004679:	ff 75 d8             	pushl  -0x28(%ebp)
c000467c:	e8 4e e3 ff ff       	call   c00029cf <rd_wt>
c0004681:	83 c4 20             	add    $0x20,%esp
c0004684:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0004689:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000468c:	83 ec 04             	sub    $0x4,%esp
c000468f:	ff 75 f0             	pushl  -0x10(%ebp)
c0004692:	ff 75 08             	pushl  0x8(%ebp)
c0004695:	ff 75 d4             	pushl  -0x2c(%ebp)
c0004698:	e8 d8 67 00 00       	call   c000ae75 <Memcpy>
c000469d:	83 c4 10             	add    $0x10,%esp
c00046a0:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00046a5:	83 ec 0c             	sub    $0xc,%esp
c00046a8:	6a 0a                	push   $0xa
c00046aa:	68 00 02 00 00       	push   $0x200
c00046af:	50                   	push   %eax
c00046b0:	ff 75 e0             	pushl  -0x20(%ebp)
c00046b3:	ff 75 d8             	pushl  -0x28(%ebp)
c00046b6:	e8 14 e3 ff ff       	call   c00029cf <rd_wt>
c00046bb:	83 c4 20             	add    $0x20,%esp
c00046be:	90                   	nop
c00046bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00046c2:	c9                   	leave  
c00046c3:	c3                   	ret    

c00046c4 <put_inode>:
c00046c4:	55                   	push   %ebp
c00046c5:	89 e5                	mov    %esp,%ebp
c00046c7:	83 ec 08             	sub    $0x8,%esp
c00046ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00046cd:	8b 40 24             	mov    0x24(%eax),%eax
c00046d0:	85 c0                	test   %eax,%eax
c00046d2:	7f 1c                	jg     c00046f0 <put_inode+0x2c>
c00046d4:	68 75 05 00 00       	push   $0x575
c00046d9:	68 e0 a4 00 c0       	push   $0xc000a4e0
c00046de:	68 e0 a4 00 c0       	push   $0xc000a4e0
c00046e3:	68 94 a6 00 c0       	push   $0xc000a694
c00046e8:	e8 86 4a 00 00       	call   c0009173 <assertion_failure>
c00046ed:	83 c4 10             	add    $0x10,%esp
c00046f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00046f3:	8b 40 24             	mov    0x24(%eax),%eax
c00046f6:	8d 50 ff             	lea    -0x1(%eax),%edx
c00046f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00046fc:	89 50 24             	mov    %edx,0x24(%eax)
c00046ff:	90                   	nop
c0004700:	c9                   	leave  
c0004701:	c3                   	ret    

c0004702 <do_close>:
c0004702:	55                   	push   %ebp
c0004703:	89 e5                	mov    %esp,%ebp
c0004705:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000470a:	8b 55 08             	mov    0x8(%ebp),%edx
c000470d:	83 c2 50             	add    $0x50,%edx
c0004710:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0004714:	8b 50 0c             	mov    0xc(%eax),%edx
c0004717:	83 ea 01             	sub    $0x1,%edx
c000471a:	89 50 0c             	mov    %edx,0xc(%eax)
c000471d:	8b 40 0c             	mov    0xc(%eax),%eax
c0004720:	85 c0                	test   %eax,%eax
c0004722:	75 16                	jne    c000473a <do_close+0x38>
c0004724:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c0004729:	8b 55 08             	mov    0x8(%ebp),%edx
c000472c:	83 c2 50             	add    $0x50,%edx
c000472f:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0004733:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000473a:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000473f:	8b 55 08             	mov    0x8(%ebp),%edx
c0004742:	83 c2 50             	add    $0x50,%edx
c0004745:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
c000474c:	00 
c000474d:	b8 00 00 00 00       	mov    $0x0,%eax
c0004752:	5d                   	pop    %ebp
c0004753:	c3                   	ret    

c0004754 <get_super_block>:
c0004754:	55                   	push   %ebp
c0004755:	89 e5                	mov    %esp,%ebp
c0004757:	83 ec 08             	sub    $0x8,%esp
c000475a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000475f:	83 ec 0c             	sub    $0xc,%esp
c0004762:	6a 07                	push   $0x7
c0004764:	68 00 02 00 00       	push   $0x200
c0004769:	50                   	push   %eax
c000476a:	6a 20                	push   $0x20
c000476c:	6a 01                	push   $0x1
c000476e:	e8 5c e2 ff ff       	call   c00029cf <rd_wt>
c0004773:	83 c4 20             	add    $0x20,%esp
c0004776:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000477c:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0004781:	8b 0a                	mov    (%edx),%ecx
c0004783:	89 08                	mov    %ecx,(%eax)
c0004785:	8b 4a 04             	mov    0x4(%edx),%ecx
c0004788:	89 48 04             	mov    %ecx,0x4(%eax)
c000478b:	8b 4a 08             	mov    0x8(%edx),%ecx
c000478e:	89 48 08             	mov    %ecx,0x8(%eax)
c0004791:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0004794:	89 48 0c             	mov    %ecx,0xc(%eax)
c0004797:	8b 4a 10             	mov    0x10(%edx),%ecx
c000479a:	89 48 10             	mov    %ecx,0x10(%eax)
c000479d:	8b 4a 14             	mov    0x14(%edx),%ecx
c00047a0:	89 48 14             	mov    %ecx,0x14(%eax)
c00047a3:	8b 4a 18             	mov    0x18(%edx),%ecx
c00047a6:	89 48 18             	mov    %ecx,0x18(%eax)
c00047a9:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00047ac:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00047af:	8b 52 20             	mov    0x20(%edx),%edx
c00047b2:	89 50 20             	mov    %edx,0x20(%eax)
c00047b5:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00047ba:	c9                   	leave  
c00047bb:	c3                   	ret    

c00047bc <check>:
c00047bc:	55                   	push   %ebp
c00047bd:	89 e5                	mov    %esp,%ebp
c00047bf:	83 ec 18             	sub    $0x18,%esp
c00047c2:	c7 45 f4 00 33 08 c0 	movl   $0xc0083300,-0xc(%ebp)
c00047c9:	eb 59                	jmp    c0004824 <check+0x68>
c00047cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00047ce:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c00047d4:	85 c0                	test   %eax,%eax
c00047d6:	74 45                	je     c000481d <check+0x61>
c00047d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00047db:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c00047e1:	83 f8 01             	cmp    $0x1,%eax
c00047e4:	74 37                	je     c000481d <check+0x61>
c00047e6:	c7 05 40 f7 00 c0 02 	movl   $0x2802,0xc000f740
c00047ed:	28 00 00 
c00047f0:	83 ec 08             	sub    $0x8,%esp
c00047f3:	6a 0a                	push   $0xa
c00047f5:	68 a3 a6 00 c0       	push   $0xc000a6a3
c00047fa:	e8 c8 cd ff ff       	call   c00015c7 <disp_str_colour>
c00047ff:	83 c4 10             	add    $0x10,%esp
c0004802:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004805:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000480c:	0f be c0             	movsbl %al,%eax
c000480f:	83 ec 0c             	sub    $0xc,%esp
c0004812:	50                   	push   %eax
c0004813:	e8 29 31 00 00       	call   c0007941 <disp_int>
c0004818:	83 c4 10             	add    $0x10,%esp
c000481b:	eb fe                	jmp    c000481b <check+0x5f>
c000481d:	81 45 f4 ac 02 00 00 	addl   $0x2ac,-0xc(%ebp)
c0004824:	b8 58 38 08 c0       	mov    $0xc0083858,%eax
c0004829:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000482c:	72 9d                	jb     c00047cb <check+0xf>
c000482e:	90                   	nop
c000482f:	c9                   	leave  
c0004830:	c3                   	ret    

c0004831 <schedule_process>:
c0004831:	55                   	push   %ebp
c0004832:	89 e5                	mov    %esp,%ebp
c0004834:	83 ec 28             	sub    $0x28,%esp
c0004837:	e8 50 d0 ff ff       	call   c000188c <get_running_thread_pcb>
c000483c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000483f:	83 ec 0c             	sub    $0xc,%esp
c0004842:	68 8c fd 00 c0       	push   $0xc000fd8c
c0004847:	e8 f7 57 00 00       	call   c000a043 <isListEmpty>
c000484c:	83 c4 10             	add    $0x10,%esp
c000484f:	3c 01                	cmp    $0x1,%al
c0004851:	75 08                	jne    c000485b <schedule_process+0x2a>
c0004853:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004856:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004859:	eb 4d                	jmp    c00048a8 <schedule_process+0x77>
c000485b:	83 ec 0c             	sub    $0xc,%esp
c000485e:	68 8c fd 00 c0       	push   $0xc000fd8c
c0004863:	e8 82 58 00 00       	call   c000a0ea <popFromDoubleLinkList>
c0004868:	83 c4 10             	add    $0x10,%esp
c000486b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000486e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004871:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004876:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004879:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000487d:	74 29                	je     c00048a8 <schedule_process+0x77>
c000487f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004882:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004885:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004888:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c000488f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004892:	05 30 01 00 00       	add    $0x130,%eax
c0004897:	83 ec 08             	sub    $0x8,%esp
c000489a:	68 a9 a6 00 c0       	push   $0xc000a6a9
c000489f:	50                   	push   %eax
c00048a0:	e8 4b 54 00 00       	call   c0009cf0 <strcmp>
c00048a5:	83 c4 10             	add    $0x10,%esp
c00048a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00048ab:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00048b2:	84 c0                	test   %al,%al
c00048b4:	75 19                	jne    c00048cf <schedule_process+0x9e>
c00048b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00048b9:	05 fc 00 00 00       	add    $0xfc,%eax
c00048be:	83 ec 08             	sub    $0x8,%esp
c00048c1:	50                   	push   %eax
c00048c2:	68 8c fd 00 c0       	push   $0xc000fd8c
c00048c7:	e8 dd 57 00 00       	call   c000a0a9 <insertToDoubleLinkList>
c00048cc:	83 c4 10             	add    $0x10,%esp
c00048cf:	c7 45 e4 00 00 10 00 	movl   $0x100000,-0x1c(%ebp)
c00048d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00048d9:	8b 40 04             	mov    0x4(%eax),%eax
c00048dc:	85 c0                	test   %eax,%eax
c00048de:	74 28                	je     c0004908 <schedule_process+0xd7>
c00048e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00048e3:	05 00 10 00 00       	add    $0x1000,%eax
c00048e8:	83 ec 0c             	sub    $0xc,%esp
c00048eb:	50                   	push   %eax
c00048ec:	e8 8c cf ff ff       	call   c000187d <update_tss>
c00048f1:	83 c4 10             	add    $0x10,%esp
c00048f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00048f7:	8b 40 04             	mov    0x4(%eax),%eax
c00048fa:	83 ec 0c             	sub    $0xc,%esp
c00048fd:	50                   	push   %eax
c00048fe:	e8 6d cf ff ff       	call   c0001870 <update_cr3>
c0004903:	83 c4 10             	add    $0x10,%esp
c0004906:	eb 0f                	jmp    c0004917 <schedule_process+0xe6>
c0004908:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000490b:	83 ec 0c             	sub    $0xc,%esp
c000490e:	50                   	push   %eax
c000490f:	e8 5c cf ff ff       	call   c0001870 <update_cr3>
c0004914:	83 c4 10             	add    $0x10,%esp
c0004917:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000491a:	a3 60 fb 00 c0       	mov    %eax,0xc000fb60
c000491f:	83 ec 08             	sub    $0x8,%esp
c0004922:	ff 75 f4             	pushl  -0xc(%ebp)
c0004925:	ff 75 f0             	pushl  -0x10(%ebp)
c0004928:	e8 d3 56 00 00       	call   c000a000 <switch_to>
c000492d:	83 c4 10             	add    $0x10,%esp
c0004930:	90                   	nop
c0004931:	c9                   	leave  
c0004932:	c3                   	ret    

c0004933 <clock_handler>:
c0004933:	55                   	push   %ebp
c0004934:	89 e5                	mov    %esp,%ebp
c0004936:	83 ec 08             	sub    $0x8,%esp
c0004939:	e8 f3 fe ff ff       	call   c0004831 <schedule_process>
c000493e:	90                   	nop
c000493f:	c9                   	leave  
c0004940:	c3                   	ret    

c0004941 <pid2proc>:
c0004941:	55                   	push   %ebp
c0004942:	89 e5                	mov    %esp,%ebp
c0004944:	83 ec 20             	sub    $0x20,%esp
c0004947:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000494e:	a1 d4 1e 01 c0       	mov    0xc0011ed4,%eax
c0004953:	8b 15 d8 1e 01 c0    	mov    0xc0011ed8,%edx
c0004959:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000495c:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000495f:	a1 dc 1e 01 c0       	mov    0xc0011edc,%eax
c0004964:	8b 15 e0 1e 01 c0    	mov    0xc0011ee0,%edx
c000496a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000496d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004970:	a1 d8 1e 01 c0       	mov    0xc0011ed8,%eax
c0004975:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004978:	eb 29                	jmp    c00049a3 <pid2proc+0x62>
c000497a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000497d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004982:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004985:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004988:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c000498e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004991:	39 c2                	cmp    %eax,%edx
c0004993:	75 05                	jne    c000499a <pid2proc+0x59>
c0004995:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004998:	eb 15                	jmp    c00049af <pid2proc+0x6e>
c000499a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000499d:	8b 40 04             	mov    0x4(%eax),%eax
c00049a0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00049a3:	81 7d f8 dc 1e 01 c0 	cmpl   $0xc0011edc,-0x8(%ebp)
c00049aa:	75 ce                	jne    c000497a <pid2proc+0x39>
c00049ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049af:	c9                   	leave  
c00049b0:	c3                   	ret    

c00049b1 <proc2pid>:
c00049b1:	55                   	push   %ebp
c00049b2:	89 e5                	mov    %esp,%ebp
c00049b4:	83 ec 10             	sub    $0x10,%esp
c00049b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00049ba:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00049c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00049c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049c6:	c9                   	leave  
c00049c7:	c3                   	ret    

c00049c8 <InitDescriptor>:
c00049c8:	55                   	push   %ebp
c00049c9:	89 e5                	mov    %esp,%ebp
c00049cb:	83 ec 04             	sub    $0x4,%esp
c00049ce:	8b 45 14             	mov    0x14(%ebp),%eax
c00049d1:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c00049d5:	8b 45 10             	mov    0x10(%ebp),%eax
c00049d8:	89 c2                	mov    %eax,%edx
c00049da:	8b 45 08             	mov    0x8(%ebp),%eax
c00049dd:	66 89 10             	mov    %dx,(%eax)
c00049e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00049e3:	89 c2                	mov    %eax,%edx
c00049e5:	8b 45 08             	mov    0x8(%ebp),%eax
c00049e8:	66 89 50 02          	mov    %dx,0x2(%eax)
c00049ec:	8b 45 0c             	mov    0xc(%ebp),%eax
c00049ef:	c1 e8 10             	shr    $0x10,%eax
c00049f2:	89 c2                	mov    %eax,%edx
c00049f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00049f7:	88 50 04             	mov    %dl,0x4(%eax)
c00049fa:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c00049fe:	89 c2                	mov    %eax,%edx
c0004a00:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a03:	88 50 05             	mov    %dl,0x5(%eax)
c0004a06:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004a0a:	66 c1 e8 08          	shr    $0x8,%ax
c0004a0e:	c1 e0 04             	shl    $0x4,%eax
c0004a11:	89 c2                	mov    %eax,%edx
c0004a13:	8b 45 10             	mov    0x10(%ebp),%eax
c0004a16:	c1 e8 10             	shr    $0x10,%eax
c0004a19:	83 e0 0f             	and    $0xf,%eax
c0004a1c:	09 c2                	or     %eax,%edx
c0004a1e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a21:	88 50 06             	mov    %dl,0x6(%eax)
c0004a24:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a27:	c1 e8 18             	shr    $0x18,%eax
c0004a2a:	89 c2                	mov    %eax,%edx
c0004a2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a2f:	88 50 07             	mov    %dl,0x7(%eax)
c0004a32:	90                   	nop
c0004a33:	c9                   	leave  
c0004a34:	c3                   	ret    

c0004a35 <Seg2PhyAddr>:
c0004a35:	55                   	push   %ebp
c0004a36:	89 e5                	mov    %esp,%ebp
c0004a38:	83 ec 10             	sub    $0x10,%esp
c0004a3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a3e:	c1 e8 03             	shr    $0x3,%eax
c0004a41:	8b 14 c5 64 f7 00 c0 	mov    -0x3fff089c(,%eax,8),%edx
c0004a48:	8b 04 c5 60 f7 00 c0 	mov    -0x3fff08a0(,%eax,8),%eax
c0004a4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a52:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004a55:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004a59:	0f b7 c0             	movzwl %ax,%eax
c0004a5c:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004a60:	0f b6 d2             	movzbl %dl,%edx
c0004a63:	c1 e2 10             	shl    $0x10,%edx
c0004a66:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004a6c:	09 d0                	or     %edx,%eax
c0004a6e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a71:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a74:	c9                   	leave  
c0004a75:	c3                   	ret    

c0004a76 <Seg2PhyAddrLDT>:
c0004a76:	55                   	push   %ebp
c0004a77:	89 e5                	mov    %esp,%ebp
c0004a79:	83 ec 10             	sub    $0x10,%esp
c0004a7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a7f:	c1 e8 03             	shr    $0x3,%eax
c0004a82:	89 c2                	mov    %eax,%edx
c0004a84:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a87:	83 c2 20             	add    $0x20,%edx
c0004a8a:	8d 54 d0 0e          	lea    0xe(%eax,%edx,8),%edx
c0004a8e:	8b 02                	mov    (%edx),%eax
c0004a90:	8b 52 04             	mov    0x4(%edx),%edx
c0004a93:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004a96:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004a99:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004a9d:	0f b7 c0             	movzwl %ax,%eax
c0004aa0:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004aa4:	0f b6 d2             	movzbl %dl,%edx
c0004aa7:	c1 e2 10             	shl    $0x10,%edx
c0004aaa:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004ab0:	09 d0                	or     %edx,%eax
c0004ab2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004ab5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ab8:	c9                   	leave  
c0004ab9:	c3                   	ret    

c0004aba <VirAddr2PhyAddr>:
c0004aba:	55                   	push   %ebp
c0004abb:	89 e5                	mov    %esp,%ebp
c0004abd:	83 ec 10             	sub    $0x10,%esp
c0004ac0:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004ac3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ac6:	01 d0                	add    %edx,%eax
c0004ac8:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004acb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ace:	c9                   	leave  
c0004acf:	c3                   	ret    

c0004ad0 <v2l>:
c0004ad0:	55                   	push   %ebp
c0004ad1:	89 e5                	mov    %esp,%ebp
c0004ad3:	83 ec 18             	sub    $0x18,%esp
c0004ad6:	83 ec 0c             	sub    $0xc,%esp
c0004ad9:	ff 75 08             	pushl  0x8(%ebp)
c0004adc:	e8 60 fe ff ff       	call   c0004941 <pid2proc>
c0004ae1:	83 c4 10             	add    $0x10,%esp
c0004ae4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004ae7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004aee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004af1:	83 ec 08             	sub    $0x8,%esp
c0004af4:	ff 75 f4             	pushl  -0xc(%ebp)
c0004af7:	50                   	push   %eax
c0004af8:	e8 79 ff ff ff       	call   c0004a76 <Seg2PhyAddrLDT>
c0004afd:	83 c4 10             	add    $0x10,%esp
c0004b00:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004b03:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004b06:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b09:	01 d0                	add    %edx,%eax
c0004b0b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004b0e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b11:	c9                   	leave  
c0004b12:	c3                   	ret    

c0004b13 <init_propt>:
c0004b13:	55                   	push   %ebp
c0004b14:	89 e5                	mov    %esp,%ebp
c0004b16:	83 ec 28             	sub    $0x28,%esp
c0004b19:	6a 0e                	push   $0xe
c0004b1b:	6a 08                	push   $0x8
c0004b1d:	68 6a 16 00 c0       	push   $0xc000166a
c0004b22:	6a 20                	push   $0x20
c0004b24:	e8 18 01 00 00       	call   c0004c41 <InitInterruptDesc>
c0004b29:	83 c4 10             	add    $0x10,%esp
c0004b2c:	6a 0e                	push   $0xe
c0004b2e:	6a 08                	push   $0x8
c0004b30:	68 98 16 00 c0       	push   $0xc0001698
c0004b35:	6a 21                	push   $0x21
c0004b37:	e8 05 01 00 00       	call   c0004c41 <InitInterruptDesc>
c0004b3c:	83 c4 10             	add    $0x10,%esp
c0004b3f:	6a 0e                	push   $0xe
c0004b41:	6a 08                	push   $0x8
c0004b43:	68 dc 16 00 c0       	push   $0xc00016dc
c0004b48:	6a 2e                	push   $0x2e
c0004b4a:	e8 f2 00 00 00       	call   c0004c41 <InitInterruptDesc>
c0004b4f:	83 c4 10             	add    $0x10,%esp
c0004b52:	83 ec 04             	sub    $0x4,%esp
c0004b55:	68 b0 0a 00 00       	push   $0xab0
c0004b5a:	6a 00                	push   $0x0
c0004b5c:	68 00 33 08 c0       	push   $0xc0083300
c0004b61:	e8 3d 63 00 00       	call   c000aea3 <Memset>
c0004b66:	83 c4 10             	add    $0x10,%esp
c0004b69:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004b70:	83 ec 04             	sub    $0x4,%esp
c0004b73:	ff 75 f4             	pushl  -0xc(%ebp)
c0004b76:	6a 00                	push   $0x0
c0004b78:	68 20 16 01 c0       	push   $0xc0011620
c0004b7d:	e8 21 63 00 00       	call   c000aea3 <Memset>
c0004b82:	83 c4 10             	add    $0x10,%esp
c0004b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004b88:	a3 88 16 01 c0       	mov    %eax,0xc0011688
c0004b8d:	c7 05 28 16 01 c0 30 	movl   $0x30,0xc0011628
c0004b94:	00 00 00 
c0004b97:	83 ec 0c             	sub    $0xc,%esp
c0004b9a:	6a 30                	push   $0x30
c0004b9c:	e8 94 fe ff ff       	call   c0004a35 <Seg2PhyAddr>
c0004ba1:	83 c4 10             	add    $0x10,%esp
c0004ba4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004ba7:	c7 45 ec 20 16 01 c0 	movl   $0xc0011620,-0x14(%ebp)
c0004bae:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004bb5:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004bb8:	0f b7 d0             	movzwl %ax,%edx
c0004bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004bbe:	83 e8 01             	sub    $0x1,%eax
c0004bc1:	89 c1                	mov    %eax,%ecx
c0004bc3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004bc6:	52                   	push   %edx
c0004bc7:	51                   	push   %ecx
c0004bc8:	50                   	push   %eax
c0004bc9:	68 a0 f7 00 c0       	push   $0xc000f7a0
c0004bce:	e8 f5 fd ff ff       	call   c00049c8 <InitDescriptor>
c0004bd3:	83 c4 10             	add    $0x10,%esp
c0004bd6:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004bdd:	68 f2 00 00 00       	push   $0xf2
c0004be2:	68 ff ff 00 00       	push   $0xffff
c0004be7:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004bea:	68 98 f7 00 c0       	push   $0xc000f798
c0004bef:	e8 d4 fd ff ff       	call   c00049c8 <InitDescriptor>
c0004bf4:	83 c4 10             	add    $0x10,%esp
c0004bf7:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004bfe:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004c05:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004c0c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004c0f:	0f b7 c0             	movzwl %ax,%eax
c0004c12:	50                   	push   %eax
c0004c13:	ff 75 d8             	pushl  -0x28(%ebp)
c0004c16:	6a 00                	push   $0x0
c0004c18:	68 a8 f7 00 c0       	push   $0xc000f7a8
c0004c1d:	e8 a6 fd ff ff       	call   c00049c8 <InitDescriptor>
c0004c22:	83 c4 10             	add    $0x10,%esp
c0004c25:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004c28:	0f b7 c0             	movzwl %ax,%eax
c0004c2b:	50                   	push   %eax
c0004c2c:	ff 75 d8             	pushl  -0x28(%ebp)
c0004c2f:	6a 00                	push   $0x0
c0004c31:	68 b0 f7 00 c0       	push   $0xc000f7b0
c0004c36:	e8 8d fd ff ff       	call   c00049c8 <InitDescriptor>
c0004c3b:	83 c4 10             	add    $0x10,%esp
c0004c3e:	90                   	nop
c0004c3f:	c9                   	leave  
c0004c40:	c3                   	ret    

c0004c41 <InitInterruptDesc>:
c0004c41:	55                   	push   %ebp
c0004c42:	89 e5                	mov    %esp,%ebp
c0004c44:	83 ec 10             	sub    $0x10,%esp
c0004c47:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c4a:	c1 e0 03             	shl    $0x3,%eax
c0004c4d:	05 c0 16 01 c0       	add    $0xc00116c0,%eax
c0004c52:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004c55:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c58:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004c5c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004c5f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004c62:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004c65:	89 c2                	mov    %eax,%edx
c0004c67:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c6a:	66 89 10             	mov    %dx,(%eax)
c0004c6d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c70:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004c76:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004c79:	c1 f8 10             	sar    $0x10,%eax
c0004c7c:	89 c2                	mov    %eax,%edx
c0004c7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c81:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004c85:	8b 45 10             	mov    0x10(%ebp),%eax
c0004c88:	c1 e0 04             	shl    $0x4,%eax
c0004c8b:	89 c2                	mov    %eax,%edx
c0004c8d:	8b 45 14             	mov    0x14(%ebp),%eax
c0004c90:	09 d0                	or     %edx,%eax
c0004c92:	89 c2                	mov    %eax,%edx
c0004c94:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004c97:	88 50 05             	mov    %dl,0x5(%eax)
c0004c9a:	90                   	nop
c0004c9b:	c9                   	leave  
c0004c9c:	c3                   	ret    

c0004c9d <ReloadGDT>:
c0004c9d:	55                   	push   %ebp
c0004c9e:	89 e5                	mov    %esp,%ebp
c0004ca0:	83 ec 28             	sub    $0x28,%esp
c0004ca3:	b8 a8 16 01 c0       	mov    $0xc00116a8,%eax
c0004ca8:	0f b7 00             	movzwl (%eax),%eax
c0004cab:	98                   	cwtl   
c0004cac:	ba aa 16 01 c0       	mov    $0xc00116aa,%edx
c0004cb1:	8b 12                	mov    (%edx),%edx
c0004cb3:	83 ec 04             	sub    $0x4,%esp
c0004cb6:	50                   	push   %eax
c0004cb7:	52                   	push   %edx
c0004cb8:	68 60 f7 00 c0       	push   $0xc000f760
c0004cbd:	e8 b3 61 00 00       	call   c000ae75 <Memcpy>
c0004cc2:	83 c4 10             	add    $0x10,%esp
c0004cc5:	c7 45 f0 a8 16 01 c0 	movl   $0xc00116a8,-0x10(%ebp)
c0004ccc:	c7 45 ec aa 16 01 c0 	movl   $0xc00116aa,-0x14(%ebp)
c0004cd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004cd6:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004cdb:	ba 60 f7 00 c0       	mov    $0xc000f760,%edx
c0004ce0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004ce3:	89 10                	mov    %edx,(%eax)
c0004ce5:	c7 45 e8 28 f7 00 c0 	movl   $0xc000f728,-0x18(%ebp)
c0004cec:	c7 45 e4 2a f7 00 c0 	movl   $0xc000f72a,-0x1c(%ebp)
c0004cf3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004cf6:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004cfb:	ba c0 16 01 c0       	mov    $0xc00116c0,%edx
c0004d00:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004d03:	89 10                	mov    %edx,(%eax)
c0004d05:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004d0c:	eb 04                	jmp    c0004d12 <ReloadGDT+0x75>
c0004d0e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004d12:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004d19:	7e f3                	jle    c0004d0e <ReloadGDT+0x71>
c0004d1b:	e8 f9 30 00 00       	call   c0007e19 <init_internal_interrupt>
c0004d20:	e8 ee fd ff ff       	call   c0004b13 <init_propt>
c0004d25:	90                   	nop
c0004d26:	c9                   	leave  
c0004d27:	c3                   	ret    

c0004d28 <select_console>:
c0004d28:	55                   	push   %ebp
c0004d29:	89 e5                	mov    %esp,%ebp
c0004d2b:	83 ec 18             	sub    $0x18,%esp
c0004d2e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d31:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004d34:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c0004d38:	77 27                	ja     c0004d61 <select_console+0x39>
c0004d3a:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004d3e:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0004d44:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0004d49:	a3 20 f7 00 c0       	mov    %eax,0xc000f720
c0004d4e:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0004d53:	83 ec 0c             	sub    $0xc,%esp
c0004d56:	50                   	push   %eax
c0004d57:	e8 08 00 00 00       	call   c0004d64 <flush>
c0004d5c:	83 c4 10             	add    $0x10,%esp
c0004d5f:	eb 01                	jmp    c0004d62 <select_console+0x3a>
c0004d61:	90                   	nop
c0004d62:	c9                   	leave  
c0004d63:	c3                   	ret    

c0004d64 <flush>:
c0004d64:	55                   	push   %ebp
c0004d65:	89 e5                	mov    %esp,%ebp
c0004d67:	83 ec 08             	sub    $0x8,%esp
c0004d6a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d6d:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d73:	8b 40 0c             	mov    0xc(%eax),%eax
c0004d76:	83 ec 0c             	sub    $0xc,%esp
c0004d79:	50                   	push   %eax
c0004d7a:	e8 1e 00 00 00       	call   c0004d9d <set_cursor>
c0004d7f:	83 c4 10             	add    $0x10,%esp
c0004d82:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d85:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004d8b:	8b 40 08             	mov    0x8(%eax),%eax
c0004d8e:	83 ec 0c             	sub    $0xc,%esp
c0004d91:	50                   	push   %eax
c0004d92:	e8 64 00 00 00       	call   c0004dfb <set_console_start_video_addr>
c0004d97:	83 c4 10             	add    $0x10,%esp
c0004d9a:	90                   	nop
c0004d9b:	c9                   	leave  
c0004d9c:	c3                   	ret    

c0004d9d <set_cursor>:
c0004d9d:	55                   	push   %ebp
c0004d9e:	89 e5                	mov    %esp,%ebp
c0004da0:	83 ec 08             	sub    $0x8,%esp
c0004da3:	83 ec 08             	sub    $0x8,%esp
c0004da6:	6a 0e                	push   $0xe
c0004da8:	68 d4 03 00 00       	push   $0x3d4
c0004dad:	e8 dc c9 ff ff       	call   c000178e <out_byte>
c0004db2:	83 c4 10             	add    $0x10,%esp
c0004db5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004db8:	c1 e8 08             	shr    $0x8,%eax
c0004dbb:	0f b7 c0             	movzwl %ax,%eax
c0004dbe:	83 ec 08             	sub    $0x8,%esp
c0004dc1:	50                   	push   %eax
c0004dc2:	68 d5 03 00 00       	push   $0x3d5
c0004dc7:	e8 c2 c9 ff ff       	call   c000178e <out_byte>
c0004dcc:	83 c4 10             	add    $0x10,%esp
c0004dcf:	83 ec 08             	sub    $0x8,%esp
c0004dd2:	6a 0f                	push   $0xf
c0004dd4:	68 d4 03 00 00       	push   $0x3d4
c0004dd9:	e8 b0 c9 ff ff       	call   c000178e <out_byte>
c0004dde:	83 c4 10             	add    $0x10,%esp
c0004de1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004de4:	0f b7 c0             	movzwl %ax,%eax
c0004de7:	83 ec 08             	sub    $0x8,%esp
c0004dea:	50                   	push   %eax
c0004deb:	68 d5 03 00 00       	push   $0x3d5
c0004df0:	e8 99 c9 ff ff       	call   c000178e <out_byte>
c0004df5:	83 c4 10             	add    $0x10,%esp
c0004df8:	90                   	nop
c0004df9:	c9                   	leave  
c0004dfa:	c3                   	ret    

c0004dfb <set_console_start_video_addr>:
c0004dfb:	55                   	push   %ebp
c0004dfc:	89 e5                	mov    %esp,%ebp
c0004dfe:	83 ec 08             	sub    $0x8,%esp
c0004e01:	83 ec 08             	sub    $0x8,%esp
c0004e04:	6a 0c                	push   $0xc
c0004e06:	68 d4 03 00 00       	push   $0x3d4
c0004e0b:	e8 7e c9 ff ff       	call   c000178e <out_byte>
c0004e10:	83 c4 10             	add    $0x10,%esp
c0004e13:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e16:	c1 e8 08             	shr    $0x8,%eax
c0004e19:	0f b7 c0             	movzwl %ax,%eax
c0004e1c:	83 ec 08             	sub    $0x8,%esp
c0004e1f:	50                   	push   %eax
c0004e20:	68 d5 03 00 00       	push   $0x3d5
c0004e25:	e8 64 c9 ff ff       	call   c000178e <out_byte>
c0004e2a:	83 c4 10             	add    $0x10,%esp
c0004e2d:	83 ec 08             	sub    $0x8,%esp
c0004e30:	6a 0d                	push   $0xd
c0004e32:	68 d4 03 00 00       	push   $0x3d4
c0004e37:	e8 52 c9 ff ff       	call   c000178e <out_byte>
c0004e3c:	83 c4 10             	add    $0x10,%esp
c0004e3f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e42:	0f b7 c0             	movzwl %ax,%eax
c0004e45:	83 ec 08             	sub    $0x8,%esp
c0004e48:	50                   	push   %eax
c0004e49:	68 d5 03 00 00       	push   $0x3d5
c0004e4e:	e8 3b c9 ff ff       	call   c000178e <out_byte>
c0004e53:	83 c4 10             	add    $0x10,%esp
c0004e56:	90                   	nop
c0004e57:	c9                   	leave  
c0004e58:	c3                   	ret    

c0004e59 <put_key>:
c0004e59:	55                   	push   %ebp
c0004e5a:	89 e5                	mov    %esp,%ebp
c0004e5c:	83 ec 04             	sub    $0x4,%esp
c0004e5f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004e62:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004e65:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e68:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004e6e:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004e73:	77 62                	ja     c0004ed7 <put_key+0x7e>
c0004e75:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e78:	8b 00                	mov    (%eax),%eax
c0004e7a:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004e7e:	89 10                	mov    %edx,(%eax)
c0004e80:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e83:	8b 00                	mov    (%eax),%eax
c0004e85:	8d 50 04             	lea    0x4(%eax),%edx
c0004e88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e8b:	89 10                	mov    %edx,(%eax)
c0004e8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e90:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004e96:	8d 50 01             	lea    0x1(%eax),%edx
c0004e99:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e9c:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004ea2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ea5:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0004eab:	8d 50 01             	lea    0x1(%eax),%edx
c0004eae:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eb1:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0004eb7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eba:	8b 00                	mov    (%eax),%eax
c0004ebc:	8b 55 08             	mov    0x8(%ebp),%edx
c0004ebf:	83 c2 08             	add    $0x8,%edx
c0004ec2:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004ec8:	39 d0                	cmp    %edx,%eax
c0004eca:	75 0b                	jne    c0004ed7 <put_key+0x7e>
c0004ecc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ecf:	8d 50 08             	lea    0x8(%eax),%edx
c0004ed2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ed5:	89 10                	mov    %edx,(%eax)
c0004ed7:	90                   	nop
c0004ed8:	c9                   	leave  
c0004ed9:	c3                   	ret    

c0004eda <scroll_up>:
c0004eda:	55                   	push   %ebp
c0004edb:	89 e5                	mov    %esp,%ebp
c0004edd:	83 ec 08             	sub    $0x8,%esp
c0004ee0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ee3:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ee9:	8b 40 08             	mov    0x8(%eax),%eax
c0004eec:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004eef:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef2:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ef8:	8b 00                	mov    (%eax),%eax
c0004efa:	39 c2                	cmp    %eax,%edx
c0004efc:	76 1b                	jbe    c0004f19 <scroll_up+0x3f>
c0004efe:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f01:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f07:	8b 40 08             	mov    0x8(%eax),%eax
c0004f0a:	83 e8 50             	sub    $0x50,%eax
c0004f0d:	83 ec 0c             	sub    $0xc,%esp
c0004f10:	50                   	push   %eax
c0004f11:	e8 e5 fe ff ff       	call   c0004dfb <set_console_start_video_addr>
c0004f16:	83 c4 10             	add    $0x10,%esp
c0004f19:	90                   	nop
c0004f1a:	c9                   	leave  
c0004f1b:	c3                   	ret    

c0004f1c <scroll_down>:
c0004f1c:	55                   	push   %ebp
c0004f1d:	89 e5                	mov    %esp,%ebp
c0004f1f:	83 ec 08             	sub    $0x8,%esp
c0004f22:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f25:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f2b:	8b 40 08             	mov    0x8(%eax),%eax
c0004f2e:	8d 48 50             	lea    0x50(%eax),%ecx
c0004f31:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f34:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f3a:	8b 10                	mov    (%eax),%edx
c0004f3c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f3f:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f45:	8b 40 04             	mov    0x4(%eax),%eax
c0004f48:	01 d0                	add    %edx,%eax
c0004f4a:	39 c1                	cmp    %eax,%ecx
c0004f4c:	73 36                	jae    c0004f84 <scroll_down+0x68>
c0004f4e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f51:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f57:	8b 40 08             	mov    0x8(%eax),%eax
c0004f5a:	83 c0 50             	add    $0x50,%eax
c0004f5d:	83 ec 0c             	sub    $0xc,%esp
c0004f60:	50                   	push   %eax
c0004f61:	e8 95 fe ff ff       	call   c0004dfb <set_console_start_video_addr>
c0004f66:	83 c4 10             	add    $0x10,%esp
c0004f69:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f6c:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f72:	8b 50 08             	mov    0x8(%eax),%edx
c0004f75:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f78:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f7e:	83 c2 50             	add    $0x50,%edx
c0004f81:	89 50 08             	mov    %edx,0x8(%eax)
c0004f84:	90                   	nop
c0004f85:	c9                   	leave  
c0004f86:	c3                   	ret    

c0004f87 <out_char>:
c0004f87:	55                   	push   %ebp
c0004f88:	89 e5                	mov    %esp,%ebp
c0004f8a:	83 ec 28             	sub    $0x28,%esp
c0004f8d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f90:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004f93:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f96:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004f9c:	8b 40 0c             	mov    0xc(%eax),%eax
c0004f9f:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0004fa4:	01 c0                	add    %eax,%eax
c0004fa6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004fa9:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0004fad:	83 f8 08             	cmp    $0x8,%eax
c0004fb0:	0f 84 8d 00 00 00    	je     c0005043 <out_char+0xbc>
c0004fb6:	83 f8 0a             	cmp    $0xa,%eax
c0004fb9:	0f 85 c9 00 00 00    	jne    c0005088 <out_char+0x101>
c0004fbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fc2:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004fc8:	8b 50 0c             	mov    0xc(%eax),%edx
c0004fcb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fce:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004fd4:	8b 08                	mov    (%eax),%ecx
c0004fd6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fd9:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004fdf:	8b 40 04             	mov    0x4(%eax),%eax
c0004fe2:	01 c8                	add    %ecx,%eax
c0004fe4:	83 e8 50             	sub    $0x50,%eax
c0004fe7:	39 c2                	cmp    %eax,%edx
c0004fe9:	0f 83 f4 00 00 00    	jae    c00050e3 <out_char+0x15c>
c0004fef:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ff2:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0004ff8:	8b 08                	mov    (%eax),%ecx
c0004ffa:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ffd:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005003:	8b 50 0c             	mov    0xc(%eax),%edx
c0005006:	8b 45 08             	mov    0x8(%ebp),%eax
c0005009:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000500f:	8b 00                	mov    (%eax),%eax
c0005011:	29 c2                	sub    %eax,%edx
c0005013:	89 d0                	mov    %edx,%eax
c0005015:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c000501a:	f7 e2                	mul    %edx
c000501c:	89 d0                	mov    %edx,%eax
c000501e:	c1 e8 06             	shr    $0x6,%eax
c0005021:	8d 50 01             	lea    0x1(%eax),%edx
c0005024:	89 d0                	mov    %edx,%eax
c0005026:	c1 e0 02             	shl    $0x2,%eax
c0005029:	01 d0                	add    %edx,%eax
c000502b:	c1 e0 04             	shl    $0x4,%eax
c000502e:	89 c2                	mov    %eax,%edx
c0005030:	8b 45 08             	mov    0x8(%ebp),%eax
c0005033:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005039:	01 ca                	add    %ecx,%edx
c000503b:	89 50 0c             	mov    %edx,0xc(%eax)
c000503e:	e9 a0 00 00 00       	jmp    c00050e3 <out_char+0x15c>
c0005043:	8b 45 08             	mov    0x8(%ebp),%eax
c0005046:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000504c:	8b 50 0c             	mov    0xc(%eax),%edx
c000504f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005052:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005058:	8b 00                	mov    (%eax),%eax
c000505a:	39 c2                	cmp    %eax,%edx
c000505c:	0f 86 84 00 00 00    	jbe    c00050e6 <out_char+0x15f>
c0005062:	8b 45 08             	mov    0x8(%ebp),%eax
c0005065:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000506b:	8b 50 0c             	mov    0xc(%eax),%edx
c000506e:	83 ea 01             	sub    $0x1,%edx
c0005071:	89 50 0c             	mov    %edx,0xc(%eax)
c0005074:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005077:	83 e8 02             	sub    $0x2,%eax
c000507a:	c6 00 20             	movb   $0x20,(%eax)
c000507d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005080:	83 e8 01             	sub    $0x1,%eax
c0005083:	c6 00 00             	movb   $0x0,(%eax)
c0005086:	eb 5e                	jmp    c00050e6 <out_char+0x15f>
c0005088:	8b 45 08             	mov    0x8(%ebp),%eax
c000508b:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005091:	8b 40 0c             	mov    0xc(%eax),%eax
c0005094:	8d 48 01             	lea    0x1(%eax),%ecx
c0005097:	8b 45 08             	mov    0x8(%ebp),%eax
c000509a:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00050a0:	8b 10                	mov    (%eax),%edx
c00050a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00050a5:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00050ab:	8b 40 04             	mov    0x4(%eax),%eax
c00050ae:	01 d0                	add    %edx,%eax
c00050b0:	39 c1                	cmp    %eax,%ecx
c00050b2:	73 35                	jae    c00050e9 <out_char+0x162>
c00050b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00050b7:	8d 50 01             	lea    0x1(%eax),%edx
c00050ba:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00050bd:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c00050c1:	88 10                	mov    %dl,(%eax)
c00050c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00050c6:	8d 50 01             	lea    0x1(%eax),%edx
c00050c9:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00050cc:	c6 00 0a             	movb   $0xa,(%eax)
c00050cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00050d2:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00050d8:	8b 50 0c             	mov    0xc(%eax),%edx
c00050db:	83 c2 01             	add    $0x1,%edx
c00050de:	89 50 0c             	mov    %edx,0xc(%eax)
c00050e1:	eb 06                	jmp    c00050e9 <out_char+0x162>
c00050e3:	90                   	nop
c00050e4:	eb 14                	jmp    c00050fa <out_char+0x173>
c00050e6:	90                   	nop
c00050e7:	eb 11                	jmp    c00050fa <out_char+0x173>
c00050e9:	90                   	nop
c00050ea:	eb 0e                	jmp    c00050fa <out_char+0x173>
c00050ec:	83 ec 0c             	sub    $0xc,%esp
c00050ef:	ff 75 08             	pushl  0x8(%ebp)
c00050f2:	e8 25 fe ff ff       	call   c0004f1c <scroll_down>
c00050f7:	83 c4 10             	add    $0x10,%esp
c00050fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00050fd:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c0005103:	8b 50 0c             	mov    0xc(%eax),%edx
c0005106:	8b 45 08             	mov    0x8(%ebp),%eax
c0005109:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c000510f:	8b 40 08             	mov    0x8(%eax),%eax
c0005112:	29 c2                	sub    %eax,%edx
c0005114:	89 d0                	mov    %edx,%eax
c0005116:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c000511b:	77 cf                	ja     c00050ec <out_char+0x165>
c000511d:	83 ec 0c             	sub    $0xc,%esp
c0005120:	ff 75 08             	pushl  0x8(%ebp)
c0005123:	e8 3c fc ff ff       	call   c0004d64 <flush>
c0005128:	83 c4 10             	add    $0x10,%esp
c000512b:	90                   	nop
c000512c:	c9                   	leave  
c000512d:	c3                   	ret    

c000512e <tty_dev_read>:
c000512e:	55                   	push   %ebp
c000512f:	89 e5                	mov    %esp,%ebp
c0005131:	83 ec 08             	sub    $0x8,%esp
c0005134:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0005139:	39 45 08             	cmp    %eax,0x8(%ebp)
c000513c:	75 17                	jne    c0005155 <tty_dev_read+0x27>
c000513e:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005143:	85 c0                	test   %eax,%eax
c0005145:	7e 0e                	jle    c0005155 <tty_dev_read+0x27>
c0005147:	83 ec 0c             	sub    $0xc,%esp
c000514a:	ff 75 08             	pushl  0x8(%ebp)
c000514d:	e8 46 07 00 00       	call   c0005898 <keyboard_read>
c0005152:	83 c4 10             	add    $0x10,%esp
c0005155:	90                   	nop
c0005156:	c9                   	leave  
c0005157:	c3                   	ret    

c0005158 <tty_dev_write>:
c0005158:	55                   	push   %ebp
c0005159:	89 e5                	mov    %esp,%ebp
c000515b:	83 ec 18             	sub    $0x18,%esp
c000515e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005161:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005167:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000516a:	e9 f3 01 00 00       	jmp    c0005362 <tty_dev_write+0x20a>
c000516f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005172:	8b 40 04             	mov    0x4(%eax),%eax
c0005175:	8b 00                	mov    (%eax),%eax
c0005177:	88 45 eb             	mov    %al,-0x15(%ebp)
c000517a:	8b 45 08             	mov    0x8(%ebp),%eax
c000517d:	8b 40 04             	mov    0x4(%eax),%eax
c0005180:	8d 50 04             	lea    0x4(%eax),%edx
c0005183:	8b 45 08             	mov    0x8(%ebp),%eax
c0005186:	89 50 04             	mov    %edx,0x4(%eax)
c0005189:	8b 45 08             	mov    0x8(%ebp),%eax
c000518c:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005192:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005195:	8b 45 08             	mov    0x8(%ebp),%eax
c0005198:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c000519e:	8b 45 08             	mov    0x8(%ebp),%eax
c00051a1:	8b 40 04             	mov    0x4(%eax),%eax
c00051a4:	8b 55 08             	mov    0x8(%ebp),%edx
c00051a7:	83 c2 08             	add    $0x8,%edx
c00051aa:	81 c2 00 08 00 00    	add    $0x800,%edx
c00051b0:	39 d0                	cmp    %edx,%eax
c00051b2:	75 0c                	jne    c00051c0 <tty_dev_write+0x68>
c00051b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00051b7:	8d 50 08             	lea    0x8(%eax),%edx
c00051ba:	8b 45 08             	mov    0x8(%ebp),%eax
c00051bd:	89 50 04             	mov    %edx,0x4(%eax)
c00051c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00051c3:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00051c9:	85 c0                	test   %eax,%eax
c00051cb:	0f 84 91 01 00 00    	je     c0005362 <tty_dev_write+0x20a>
c00051d1:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00051d5:	3c 20                	cmp    $0x20,%al
c00051d7:	76 08                	jbe    c00051e1 <tty_dev_write+0x89>
c00051d9:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00051dd:	3c 7e                	cmp    $0x7e,%al
c00051df:	76 10                	jbe    c00051f1 <tty_dev_write+0x99>
c00051e1:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00051e5:	3c 20                	cmp    $0x20,%al
c00051e7:	74 08                	je     c00051f1 <tty_dev_write+0x99>
c00051e9:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00051ed:	84 c0                	test   %al,%al
c00051ef:	75 6d                	jne    c000525e <tty_dev_write+0x106>
c00051f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00051f4:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
c00051fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00051fd:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005203:	01 d0                	add    %edx,%eax
c0005205:	89 c2                	mov    %eax,%edx
c0005207:	83 ec 04             	sub    $0x4,%esp
c000520a:	6a 01                	push   $0x1
c000520c:	8d 45 eb             	lea    -0x15(%ebp),%eax
c000520f:	50                   	push   %eax
c0005210:	52                   	push   %edx
c0005211:	e8 5f 5c 00 00       	call   c000ae75 <Memcpy>
c0005216:	83 c4 10             	add    $0x10,%esp
c0005219:	8b 45 08             	mov    0x8(%ebp),%eax
c000521c:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005222:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005225:	8b 45 08             	mov    0x8(%ebp),%eax
c0005228:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000522e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005231:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005237:	8d 50 01             	lea    0x1(%eax),%edx
c000523a:	8b 45 08             	mov    0x8(%ebp),%eax
c000523d:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005243:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005247:	0f b6 c0             	movzbl %al,%eax
c000524a:	83 ec 08             	sub    $0x8,%esp
c000524d:	50                   	push   %eax
c000524e:	ff 75 08             	pushl  0x8(%ebp)
c0005251:	e8 31 fd ff ff       	call   c0004f87 <out_char>
c0005256:	83 c4 10             	add    $0x10,%esp
c0005259:	e9 04 01 00 00       	jmp    c0005362 <tty_dev_write+0x20a>
c000525e:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005262:	3c 08                	cmp    $0x8,%al
c0005264:	75 45                	jne    c00052ab <tty_dev_write+0x153>
c0005266:	8b 45 08             	mov    0x8(%ebp),%eax
c0005269:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000526f:	8d 50 01             	lea    0x1(%eax),%edx
c0005272:	8b 45 08             	mov    0x8(%ebp),%eax
c0005275:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000527b:	8b 45 08             	mov    0x8(%ebp),%eax
c000527e:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005284:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005287:	8b 45 08             	mov    0x8(%ebp),%eax
c000528a:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005290:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005294:	0f b6 c0             	movzbl %al,%eax
c0005297:	83 ec 08             	sub    $0x8,%esp
c000529a:	50                   	push   %eax
c000529b:	ff 75 08             	pushl  0x8(%ebp)
c000529e:	e8 e4 fc ff ff       	call   c0004f87 <out_char>
c00052a3:	83 c4 10             	add    $0x10,%esp
c00052a6:	e9 b7 00 00 00       	jmp    c0005362 <tty_dev_write+0x20a>
c00052ab:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00052af:	3c 0a                	cmp    $0xa,%al
c00052b1:	74 14                	je     c00052c7 <tty_dev_write+0x16f>
c00052b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00052b6:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00052bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00052bf:	39 c2                	cmp    %eax,%edx
c00052c1:	0f 85 9b 00 00 00    	jne    c0005362 <tty_dev_write+0x20a>
c00052c7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00052cb:	0f b6 c0             	movzbl %al,%eax
c00052ce:	83 ec 08             	sub    $0x8,%esp
c00052d1:	50                   	push   %eax
c00052d2:	ff 75 08             	pushl  0x8(%ebp)
c00052d5:	e8 ad fc ff ff       	call   c0004f87 <out_char>
c00052da:	83 c4 10             	add    $0x10,%esp
c00052dd:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c00052e4:	83 ec 0c             	sub    $0xc,%esp
c00052e7:	ff 75 f0             	pushl  -0x10(%ebp)
c00052ea:	e8 d9 1a 00 00       	call   c0006dc8 <sys_malloc>
c00052ef:	83 c4 10             	add    $0x10,%esp
c00052f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00052f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00052f8:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c00052ff:	8b 45 08             	mov    0x8(%ebp),%eax
c0005302:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005308:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000530b:	89 50 50             	mov    %edx,0x50(%eax)
c000530e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005311:	8b 90 1c 08 00 00    	mov    0x81c(%eax),%edx
c0005317:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000531a:	89 50 58             	mov    %edx,0x58(%eax)
c000531d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005320:	8b 90 14 08 00 00    	mov    0x814(%eax),%edx
c0005326:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005329:	89 50 10             	mov    %edx,0x10(%eax)
c000532c:	8b 45 08             	mov    0x8(%ebp),%eax
c000532f:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0005336:	00 00 00 
c0005339:	8b 45 08             	mov    0x8(%ebp),%eax
c000533c:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005343:	00 00 00 
c0005346:	8b 45 08             	mov    0x8(%ebp),%eax
c0005349:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c000534f:	83 ec 04             	sub    $0x4,%esp
c0005352:	50                   	push   %eax
c0005353:	ff 75 ec             	pushl  -0x14(%ebp)
c0005356:	6a 01                	push   $0x1
c0005358:	e8 37 46 00 00       	call   c0009994 <send_rec>
c000535d:	83 c4 10             	add    $0x10,%esp
c0005360:	eb 11                	jmp    c0005373 <tty_dev_write+0x21b>
c0005362:	8b 45 08             	mov    0x8(%ebp),%eax
c0005365:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000536b:	85 c0                	test   %eax,%eax
c000536d:	0f 85 fc fd ff ff    	jne    c000516f <tty_dev_write+0x17>
c0005373:	c9                   	leave  
c0005374:	c3                   	ret    

c0005375 <tty_do_read>:
c0005375:	55                   	push   %ebp
c0005376:	89 e5                	mov    %esp,%ebp
c0005378:	83 ec 08             	sub    $0x8,%esp
c000537b:	8b 45 08             	mov    0x8(%ebp),%eax
c000537e:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005385:	00 00 00 
c0005388:	8b 45 0c             	mov    0xc(%ebp),%eax
c000538b:	8b 50 58             	mov    0x58(%eax),%edx
c000538e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005391:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0005397:	8b 45 0c             	mov    0xc(%ebp),%eax
c000539a:	8b 00                	mov    (%eax),%eax
c000539c:	89 c2                	mov    %eax,%edx
c000539e:	8b 45 08             	mov    0x8(%ebp),%eax
c00053a1:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00053a7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053aa:	8b 50 50             	mov    0x50(%eax),%edx
c00053ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b0:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00053b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b9:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c00053bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053c2:	8b 40 10             	mov    0x10(%eax),%eax
c00053c5:	83 ec 08             	sub    $0x8,%esp
c00053c8:	52                   	push   %edx
c00053c9:	50                   	push   %eax
c00053ca:	e8 b8 18 00 00       	call   c0006c87 <alloc_virtual_memory>
c00053cf:	83 c4 10             	add    $0x10,%esp
c00053d2:	89 c2                	mov    %eax,%edx
c00053d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00053d7:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c00053dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053e0:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c00053e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00053ea:	8b 80 18 08 00 00    	mov    0x818(%eax),%eax
c00053f0:	83 ec 04             	sub    $0x4,%esp
c00053f3:	50                   	push   %eax
c00053f4:	ff 75 0c             	pushl  0xc(%ebp)
c00053f7:	6a 01                	push   $0x1
c00053f9:	e8 96 45 00 00       	call   c0009994 <send_rec>
c00053fe:	83 c4 10             	add    $0x10,%esp
c0005401:	90                   	nop
c0005402:	c9                   	leave  
c0005403:	c3                   	ret    

c0005404 <tty_do_write>:
c0005404:	55                   	push   %ebp
c0005405:	89 e5                	mov    %esp,%ebp
c0005407:	53                   	push   %ebx
c0005408:	83 ec 24             	sub    $0x24,%esp
c000540b:	89 e0                	mov    %esp,%eax
c000540d:	89 c3                	mov    %eax,%ebx
c000540f:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c0005416:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005419:	8d 50 ff             	lea    -0x1(%eax),%edx
c000541c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c000541f:	89 c2                	mov    %eax,%edx
c0005421:	b8 10 00 00 00       	mov    $0x10,%eax
c0005426:	83 e8 01             	sub    $0x1,%eax
c0005429:	01 d0                	add    %edx,%eax
c000542b:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005430:	ba 00 00 00 00       	mov    $0x0,%edx
c0005435:	f7 f1                	div    %ecx
c0005437:	6b c0 10             	imul   $0x10,%eax,%eax
c000543a:	29 c4                	sub    %eax,%esp
c000543c:	89 e0                	mov    %esp,%eax
c000543e:	83 c0 00             	add    $0x0,%eax
c0005441:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005444:	83 ec 04             	sub    $0x4,%esp
c0005447:	ff 75 e8             	pushl  -0x18(%ebp)
c000544a:	6a 00                	push   $0x0
c000544c:	ff 75 e0             	pushl  -0x20(%ebp)
c000544f:	e8 4f 5a 00 00       	call   c000aea3 <Memset>
c0005454:	83 c4 10             	add    $0x10,%esp
c0005457:	8b 45 0c             	mov    0xc(%ebp),%eax
c000545a:	8b 40 50             	mov    0x50(%eax),%eax
c000545d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005460:	8b 45 08             	mov    0x8(%ebp),%eax
c0005463:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000546a:	00 00 00 
c000546d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005470:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005473:	8b 40 10             	mov    0x10(%eax),%eax
c0005476:	83 ec 08             	sub    $0x8,%esp
c0005479:	52                   	push   %edx
c000547a:	50                   	push   %eax
c000547b:	e8 07 18 00 00       	call   c0006c87 <alloc_virtual_memory>
c0005480:	83 c4 10             	add    $0x10,%esp
c0005483:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0005486:	eb 7e                	jmp    c0005506 <tty_do_write+0x102>
c0005488:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000548b:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000548e:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005492:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005495:	8b 45 08             	mov    0x8(%ebp),%eax
c0005498:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000549e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00054a1:	01 d0                	add    %edx,%eax
c00054a3:	83 ec 04             	sub    $0x4,%esp
c00054a6:	ff 75 f0             	pushl  -0x10(%ebp)
c00054a9:	50                   	push   %eax
c00054aa:	ff 75 e0             	pushl  -0x20(%ebp)
c00054ad:	e8 c3 59 00 00       	call   c000ae75 <Memcpy>
c00054b2:	83 c4 10             	add    $0x10,%esp
c00054b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00054b8:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00054bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00054be:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00054c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00054c7:	01 c2                	add    %eax,%edx
c00054c9:	8b 45 08             	mov    0x8(%ebp),%eax
c00054cc:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00054d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00054d9:	eb 25                	jmp    c0005500 <tty_do_write+0xfc>
c00054db:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00054de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00054e1:	01 d0                	add    %edx,%eax
c00054e3:	0f b6 00             	movzbl (%eax),%eax
c00054e6:	0f b6 c0             	movzbl %al,%eax
c00054e9:	83 ec 08             	sub    $0x8,%esp
c00054ec:	50                   	push   %eax
c00054ed:	ff 75 08             	pushl  0x8(%ebp)
c00054f0:	e8 92 fa ff ff       	call   c0004f87 <out_char>
c00054f5:	83 c4 10             	add    $0x10,%esp
c00054f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00054fc:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005500:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005504:	75 d5                	jne    c00054db <tty_do_write+0xd7>
c0005506:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000550a:	0f 85 78 ff ff ff    	jne    c0005488 <tty_do_write+0x84>
c0005510:	83 ec 0c             	sub    $0xc,%esp
c0005513:	6a 6c                	push   $0x6c
c0005515:	e8 ae 18 00 00       	call   c0006dc8 <sys_malloc>
c000551a:	83 c4 10             	add    $0x10,%esp
c000551d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005520:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005523:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000552a:	8b 45 08             	mov    0x8(%ebp),%eax
c000552d:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005533:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005536:	89 50 48             	mov    %edx,0x48(%eax)
c0005539:	8b 45 0c             	mov    0xc(%ebp),%eax
c000553c:	8b 00                	mov    (%eax),%eax
c000553e:	83 ec 04             	sub    $0x4,%esp
c0005541:	50                   	push   %eax
c0005542:	ff 75 d8             	pushl  -0x28(%ebp)
c0005545:	6a 01                	push   $0x1
c0005547:	e8 48 44 00 00       	call   c0009994 <send_rec>
c000554c:	83 c4 10             	add    $0x10,%esp
c000554f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005552:	83 ec 08             	sub    $0x8,%esp
c0005555:	6a 6c                	push   $0x6c
c0005557:	50                   	push   %eax
c0005558:	e8 4a 1b 00 00       	call   c00070a7 <sys_free>
c000555d:	83 c4 10             	add    $0x10,%esp
c0005560:	89 dc                	mov    %ebx,%esp
c0005562:	90                   	nop
c0005563:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0005566:	c9                   	leave  
c0005567:	c3                   	ret    

c0005568 <init_screen>:
c0005568:	55                   	push   %ebp
c0005569:	89 e5                	mov    %esp,%ebp
c000556b:	83 ec 10             	sub    $0x10,%esp
c000556e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005571:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0005576:	c1 f8 02             	sar    $0x2,%eax
c0005579:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c000557f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005582:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005585:	c1 e0 04             	shl    $0x4,%eax
c0005588:	8d 90 00 1f 01 c0    	lea    -0x3ffee100(%eax),%edx
c000558e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005591:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0005597:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c000559e:	8b 45 08             	mov    0x8(%ebp),%eax
c00055a1:	8b 88 20 08 00 00    	mov    0x820(%eax),%ecx
c00055a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00055aa:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c00055af:	f7 e2                	mul    %edx
c00055b1:	89 d0                	mov    %edx,%eax
c00055b3:	d1 e8                	shr    %eax
c00055b5:	89 41 04             	mov    %eax,0x4(%ecx)
c00055b8:	8b 45 08             	mov    0x8(%ebp),%eax
c00055bb:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00055c1:	8b 50 04             	mov    0x4(%eax),%edx
c00055c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00055c7:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00055cd:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00055d1:	89 10                	mov    %edx,(%eax)
c00055d3:	8b 45 08             	mov    0x8(%ebp),%eax
c00055d6:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c00055dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00055df:	8b 80 20 08 00 00    	mov    0x820(%eax),%eax
c00055e5:	8b 12                	mov    (%edx),%edx
c00055e7:	89 50 08             	mov    %edx,0x8(%eax)
c00055ea:	8b 55 08             	mov    0x8(%ebp),%edx
c00055ed:	8b 92 20 08 00 00    	mov    0x820(%edx),%edx
c00055f3:	8b 40 08             	mov    0x8(%eax),%eax
c00055f6:	89 42 0c             	mov    %eax,0xc(%edx)
c00055f9:	90                   	nop
c00055fa:	c9                   	leave  
c00055fb:	c3                   	ret    

c00055fc <init_tty>:
c00055fc:	55                   	push   %ebp
c00055fd:	89 e5                	mov    %esp,%ebp
c00055ff:	83 ec 18             	sub    $0x18,%esp
c0005602:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c0005609:	eb 7a                	jmp    c0005685 <init_tty+0x89>
c000560b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000560e:	8d 50 08             	lea    0x8(%eax),%edx
c0005611:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005614:	89 50 04             	mov    %edx,0x4(%eax)
c0005617:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000561a:	8b 50 04             	mov    0x4(%eax),%edx
c000561d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005620:	89 10                	mov    %edx,(%eax)
c0005622:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005625:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c000562c:	00 00 00 
c000562f:	ff 75 f4             	pushl  -0xc(%ebp)
c0005632:	e8 31 ff ff ff       	call   c0005568 <init_screen>
c0005637:	83 c4 04             	add    $0x4,%esp
c000563a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000563d:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0005642:	85 c0                	test   %eax,%eax
c0005644:	7e 38                	jle    c000567e <init_tty+0x82>
c0005646:	83 ec 08             	sub    $0x8,%esp
c0005649:	6a 23                	push   $0x23
c000564b:	ff 75 f4             	pushl  -0xc(%ebp)
c000564e:	e8 34 f9 ff ff       	call   c0004f87 <out_char>
c0005653:	83 c4 10             	add    $0x10,%esp
c0005656:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005659:	05 e4 8e 01 00       	add    $0x18ee4,%eax
c000565e:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0005663:	c1 f8 02             	sar    $0x2,%eax
c0005666:	69 c0 39 2c f6 73    	imul   $0x73f62c39,%eax,%eax
c000566c:	0f b6 c0             	movzbl %al,%eax
c000566f:	83 ec 08             	sub    $0x8,%esp
c0005672:	50                   	push   %eax
c0005673:	ff 75 f4             	pushl  -0xc(%ebp)
c0005676:	e8 0c f9 ff ff       	call   c0004f87 <out_char>
c000567b:	83 c4 10             	add    $0x10,%esp
c000567e:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c0005685:	b8 0c 16 01 c0       	mov    $0xc001160c,%eax
c000568a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000568d:	0f 82 78 ff ff ff    	jb     c000560b <init_tty+0xf>
c0005693:	90                   	nop
c0005694:	c9                   	leave  
c0005695:	c3                   	ret    

c0005696 <TaskTTY>:
c0005696:	55                   	push   %ebp
c0005697:	89 e5                	mov    %esp,%ebp
c0005699:	83 ec 28             	sub    $0x28,%esp
c000569c:	e8 5b ff ff ff       	call   c00055fc <init_tty>
c00056a1:	83 ec 0c             	sub    $0xc,%esp
c00056a4:	6a 01                	push   $0x1
c00056a6:	e8 7d f6 ff ff       	call   c0004d28 <select_console>
c00056ab:	83 c4 10             	add    $0x10,%esp
c00056ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00056b5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00056bc:	83 ec 0c             	sub    $0xc,%esp
c00056bf:	6a 6c                	push   $0x6c
c00056c1:	e8 02 17 00 00       	call   c0006dc8 <sys_malloc>
c00056c6:	83 c4 10             	add    $0x10,%esp
c00056c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00056cc:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c00056d3:	eb 30                	jmp    c0005705 <TaskTTY+0x6f>
c00056d5:	83 ec 0c             	sub    $0xc,%esp
c00056d8:	ff 75 f4             	pushl  -0xc(%ebp)
c00056db:	e8 4e fa ff ff       	call   c000512e <tty_dev_read>
c00056e0:	83 c4 10             	add    $0x10,%esp
c00056e3:	83 ec 0c             	sub    $0xc,%esp
c00056e6:	ff 75 f4             	pushl  -0xc(%ebp)
c00056e9:	e8 6a fa ff ff       	call   c0005158 <tty_dev_write>
c00056ee:	83 c4 10             	add    $0x10,%esp
c00056f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00056f4:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00056fa:	85 c0                	test   %eax,%eax
c00056fc:	75 d7                	jne    c00056d5 <TaskTTY+0x3f>
c00056fe:	81 45 f4 24 08 00 00 	addl   $0x824,-0xc(%ebp)
c0005705:	b8 0c 16 01 c0       	mov    $0xc001160c,%eax
c000570a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000570d:	72 c6                	jb     c00056d5 <TaskTTY+0x3f>
c000570f:	83 ec 04             	sub    $0x4,%esp
c0005712:	6a 0e                	push   $0xe
c0005714:	ff 75 e8             	pushl  -0x18(%ebp)
c0005717:	6a 02                	push   $0x2
c0005719:	e8 76 42 00 00       	call   c0009994 <send_rec>
c000571e:	83 c4 10             	add    $0x10,%esp
c0005721:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005724:	8b 40 68             	mov    0x68(%eax),%eax
c0005727:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000572a:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005731:	74 28                	je     c000575b <TaskTTY+0xc5>
c0005733:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c000573a:	7f 0b                	jg     c0005747 <TaskTTY+0xb1>
c000573c:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005743:	74 4e                	je     c0005793 <TaskTTY+0xfd>
c0005745:	eb 4d                	jmp    c0005794 <TaskTTY+0xfe>
c0005747:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c000574e:	74 21                	je     c0005771 <TaskTTY+0xdb>
c0005750:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0005757:	74 2e                	je     c0005787 <TaskTTY+0xf1>
c0005759:	eb 39                	jmp    c0005794 <TaskTTY+0xfe>
c000575b:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0005760:	83 ec 08             	sub    $0x8,%esp
c0005763:	ff 75 e8             	pushl  -0x18(%ebp)
c0005766:	50                   	push   %eax
c0005767:	e8 09 fc ff ff       	call   c0005375 <tty_do_read>
c000576c:	83 c4 10             	add    $0x10,%esp
c000576f:	eb 23                	jmp    c0005794 <TaskTTY+0xfe>
c0005771:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0005776:	83 ec 08             	sub    $0x8,%esp
c0005779:	ff 75 e8             	pushl  -0x18(%ebp)
c000577c:	50                   	push   %eax
c000577d:	e8 82 fc ff ff       	call   c0005404 <tty_do_write>
c0005782:	83 c4 10             	add    $0x10,%esp
c0005785:	eb 0d                	jmp    c0005794 <TaskTTY+0xfe>
c0005787:	c7 05 a0 16 01 c0 00 	movl   $0x0,0xc00116a0
c000578e:	00 00 00 
c0005791:	eb 01                	jmp    c0005794 <TaskTTY+0xfe>
c0005793:	90                   	nop
c0005794:	e9 33 ff ff ff       	jmp    c00056cc <TaskTTY+0x36>

c0005799 <keyboard_handler>:
c0005799:	55                   	push   %ebp
c000579a:	89 e5                	mov    %esp,%ebp
c000579c:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00057a2:	c7 05 a0 16 01 c0 01 	movl   $0x1,0xc00116a0
c00057a9:	00 00 00 
c00057ac:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c00057b3:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00057b8:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00057bd:	7f 76                	jg     c0005835 <keyboard_handler+0x9c>
c00057bf:	e8 ec bf ff ff       	call   c00017b0 <disable_int>
c00057c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00057c7:	0f b7 c0             	movzwl %ax,%eax
c00057ca:	83 ec 0c             	sub    $0xc,%esp
c00057cd:	50                   	push   %eax
c00057ce:	e8 af bf ff ff       	call   c0001782 <in_byte>
c00057d3:	83 c4 10             	add    $0x10,%esp
c00057d6:	88 45 f3             	mov    %al,-0xd(%ebp)
c00057d9:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c00057de:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c00057e2:	88 10                	mov    %dl,(%eax)
c00057e4:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c00057e9:	83 c0 01             	add    $0x1,%eax
c00057ec:	a3 80 fb 00 c0       	mov    %eax,0xc000fb80
c00057f1:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00057f6:	83 c0 01             	add    $0x1,%eax
c00057f9:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c00057fe:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0005803:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c0005808:	39 d0                	cmp    %edx,%eax
c000580a:	72 0a                	jb     c0005816 <keyboard_handler+0x7d>
c000580c:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c0005813:	fb 00 c0 
c0005816:	e8 97 bf ff ff       	call   c00017b2 <enable_int>
c000581b:	c7 45 ec 66 00 00 00 	movl   $0x66,-0x14(%ebp)
c0005822:	83 ec 04             	sub    $0x4,%esp
c0005825:	6a 02                	push   $0x2
c0005827:	8d 45 84             	lea    -0x7c(%ebp),%eax
c000582a:	50                   	push   %eax
c000582b:	6a 01                	push   $0x1
c000582d:	e8 62 41 00 00       	call   c0009994 <send_rec>
c0005832:	83 c4 10             	add    $0x10,%esp
c0005835:	90                   	nop
c0005836:	c9                   	leave  
c0005837:	c3                   	ret    

c0005838 <read_from_keyboard_buf>:
c0005838:	55                   	push   %ebp
c0005839:	89 e5                	mov    %esp,%ebp
c000583b:	83 ec 18             	sub    $0x18,%esp
c000583e:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0005842:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005847:	85 c0                	test   %eax,%eax
c0005849:	7e 47                	jle    c0005892 <read_from_keyboard_buf+0x5a>
c000584b:	e8 60 bf ff ff       	call   c00017b0 <disable_int>
c0005850:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0005855:	0f b6 00             	movzbl (%eax),%eax
c0005858:	88 45 f7             	mov    %al,-0x9(%ebp)
c000585b:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0005860:	83 c0 01             	add    $0x1,%eax
c0005863:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0005868:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c000586d:	83 e8 01             	sub    $0x1,%eax
c0005870:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c0005875:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c000587a:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c000587f:	39 d0                	cmp    %edx,%eax
c0005881:	72 0a                	jb     c000588d <read_from_keyboard_buf+0x55>
c0005883:	c7 05 84 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb84
c000588a:	fb 00 c0 
c000588d:	e8 20 bf ff ff       	call   c00017b2 <enable_int>
c0005892:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005896:	c9                   	leave  
c0005897:	c3                   	ret    

c0005898 <keyboard_read>:
c0005898:	55                   	push   %ebp
c0005899:	89 e5                	mov    %esp,%ebp
c000589b:	83 ec 28             	sub    $0x28,%esp
c000589e:	90                   	nop
c000589f:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00058a4:	85 c0                	test   %eax,%eax
c00058a6:	7e f7                	jle    c000589f <keyboard_read+0x7>
c00058a8:	e8 8b ff ff ff       	call   c0005838 <read_from_keyboard_buf>
c00058ad:	88 45 ea             	mov    %al,-0x16(%ebp)
c00058b0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00058b7:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00058bb:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c00058bf:	75 5a                	jne    c000591b <keyboard_read+0x83>
c00058c1:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c00058c5:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c00058c9:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c00058cd:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c00058d1:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c00058d5:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c00058d9:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c00058dd:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00058e4:	eb 20                	jmp    c0005906 <keyboard_read+0x6e>
c00058e6:	e8 4d ff ff ff       	call   c0005838 <read_from_keyboard_buf>
c00058eb:	89 c1                	mov    %eax,%ecx
c00058ed:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c00058f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00058f3:	01 d0                	add    %edx,%eax
c00058f5:	0f b6 00             	movzbl (%eax),%eax
c00058f8:	38 c1                	cmp    %al,%cl
c00058fa:	74 06                	je     c0005902 <keyboard_read+0x6a>
c00058fc:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005900:	eb 0a                	jmp    c000590c <keyboard_read+0x74>
c0005902:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005906:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c000590a:	7e da                	jle    c00058e6 <keyboard_read+0x4e>
c000590c:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005910:	74 68                	je     c000597a <keyboard_read+0xe2>
c0005912:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005919:	eb 5f                	jmp    c000597a <keyboard_read+0xe2>
c000591b:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c000591f:	75 59                	jne    c000597a <keyboard_read+0xe2>
c0005921:	e8 12 ff ff ff       	call   c0005838 <read_from_keyboard_buf>
c0005926:	3c 2a                	cmp    $0x2a,%al
c0005928:	75 1d                	jne    c0005947 <keyboard_read+0xaf>
c000592a:	e8 09 ff ff ff       	call   c0005838 <read_from_keyboard_buf>
c000592f:	3c e0                	cmp    $0xe0,%al
c0005931:	75 14                	jne    c0005947 <keyboard_read+0xaf>
c0005933:	e8 00 ff ff ff       	call   c0005838 <read_from_keyboard_buf>
c0005938:	3c 37                	cmp    $0x37,%al
c000593a:	75 0b                	jne    c0005947 <keyboard_read+0xaf>
c000593c:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005943:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005947:	e8 ec fe ff ff       	call   c0005838 <read_from_keyboard_buf>
c000594c:	3c b7                	cmp    $0xb7,%al
c000594e:	75 1d                	jne    c000596d <keyboard_read+0xd5>
c0005950:	e8 e3 fe ff ff       	call   c0005838 <read_from_keyboard_buf>
c0005955:	3c e0                	cmp    $0xe0,%al
c0005957:	75 14                	jne    c000596d <keyboard_read+0xd5>
c0005959:	e8 da fe ff ff       	call   c0005838 <read_from_keyboard_buf>
c000595e:	3c aa                	cmp    $0xaa,%al
c0005960:	75 0b                	jne    c000596d <keyboard_read+0xd5>
c0005962:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005969:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c000596d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005971:	75 07                	jne    c000597a <keyboard_read+0xe2>
c0005973:	c6 05 24 f7 00 c0 01 	movb   $0x1,0xc000f724
c000597a:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005981:	0f 84 8d 00 00 00    	je     c0005a14 <keyboard_read+0x17c>
c0005987:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c000598e:	0f 84 80 00 00 00    	je     c0005a14 <keyboard_read+0x17c>
c0005994:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005998:	0f 94 c2             	sete   %dl
c000599b:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c000599f:	0f 94 c0             	sete   %al
c00059a2:	09 d0                	or     %edx,%eax
c00059a4:	84 c0                	test   %al,%al
c00059a6:	74 07                	je     c00059af <keyboard_read+0x117>
c00059a8:	c6 05 a4 16 01 c0 01 	movb   $0x1,0xc00116a4
c00059af:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c00059b3:	f7 d0                	not    %eax
c00059b5:	c0 e8 07             	shr    $0x7,%al
c00059b8:	88 45 e9             	mov    %al,-0x17(%ebp)
c00059bb:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c00059bf:	74 53                	je     c0005a14 <keyboard_read+0x17c>
c00059c1:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c00059c5:	74 4d                	je     c0005a14 <keyboard_read+0x17c>
c00059c7:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c00059cb:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c00059d2:	3c 01                	cmp    $0x1,%al
c00059d4:	75 04                	jne    c00059da <keyboard_read+0x142>
c00059d6:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c00059da:	0f b6 05 24 f7 00 c0 	movzbl 0xc000f724,%eax
c00059e1:	84 c0                	test   %al,%al
c00059e3:	74 04                	je     c00059e9 <keyboard_read+0x151>
c00059e5:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c00059e9:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c00059ed:	89 d0                	mov    %edx,%eax
c00059ef:	01 c0                	add    %eax,%eax
c00059f1:	01 c2                	add    %eax,%edx
c00059f3:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c00059f7:	01 d0                	add    %edx,%eax
c00059f9:	8b 04 85 00 e1 00 c0 	mov    -0x3fff1f00(,%eax,4),%eax
c0005a00:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005a03:	83 ec 08             	sub    $0x8,%esp
c0005a06:	ff 75 f4             	pushl  -0xc(%ebp)
c0005a09:	ff 75 08             	pushl  0x8(%ebp)
c0005a0c:	e8 1a 00 00 00       	call   c0005a2b <in_process>
c0005a11:	83 c4 10             	add    $0x10,%esp
c0005a14:	90                   	nop
c0005a15:	c9                   	leave  
c0005a16:	c3                   	ret    

c0005a17 <init_keyboard_handler>:
c0005a17:	55                   	push   %ebp
c0005a18:	89 e5                	mov    %esp,%ebp
c0005a1a:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005a21:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005a28:	90                   	nop
c0005a29:	5d                   	pop    %ebp
c0005a2a:	c3                   	ret    

c0005a2b <in_process>:
c0005a2b:	55                   	push   %ebp
c0005a2c:	89 e5                	mov    %esp,%ebp
c0005a2e:	83 ec 18             	sub    $0x18,%esp
c0005a31:	83 ec 04             	sub    $0x4,%esp
c0005a34:	6a 02                	push   $0x2
c0005a36:	6a 00                	push   $0x0
c0005a38:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005a3b:	50                   	push   %eax
c0005a3c:	e8 62 54 00 00       	call   c000aea3 <Memset>
c0005a41:	83 c4 10             	add    $0x10,%esp
c0005a44:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a47:	25 00 01 00 00       	and    $0x100,%eax
c0005a4c:	85 c0                	test   %eax,%eax
c0005a4e:	75 28                	jne    c0005a78 <in_process+0x4d>
c0005a50:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005a53:	0f b6 c0             	movzbl %al,%eax
c0005a56:	83 ec 08             	sub    $0x8,%esp
c0005a59:	50                   	push   %eax
c0005a5a:	ff 75 08             	pushl  0x8(%ebp)
c0005a5d:	e8 f7 f3 ff ff       	call   c0004e59 <put_key>
c0005a62:	83 c4 10             	add    $0x10,%esp
c0005a65:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005a6c:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005a73:	e9 42 01 00 00       	jmp    c0005bba <in_process+0x18f>
c0005a78:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0005a7f:	84 c0                	test   %al,%al
c0005a81:	0f 84 a9 00 00 00    	je     c0005b30 <in_process+0x105>
c0005a87:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005a8b:	0f 84 9f 00 00 00    	je     c0005b30 <in_process+0x105>
c0005a91:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005a95:	0f 84 95 00 00 00    	je     c0005b30 <in_process+0x105>
c0005a9b:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005aa2:	74 64                	je     c0005b08 <in_process+0xdd>
c0005aa4:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005aab:	77 0b                	ja     c0005ab8 <in_process+0x8d>
c0005aad:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005ab4:	74 64                	je     c0005b1a <in_process+0xef>
c0005ab6:	eb 73                	jmp    c0005b2b <in_process+0x100>
c0005ab8:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005abf:	74 0b                	je     c0005acc <in_process+0xa1>
c0005ac1:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005ac8:	74 20                	je     c0005aea <in_process+0xbf>
c0005aca:	eb 5f                	jmp    c0005b2b <in_process+0x100>
c0005acc:	83 ec 0c             	sub    $0xc,%esp
c0005acf:	ff 75 08             	pushl  0x8(%ebp)
c0005ad2:	e8 03 f4 ff ff       	call   c0004eda <scroll_up>
c0005ad7:	83 c4 10             	add    $0x10,%esp
c0005ada:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005ae1:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005ae8:	eb 41                	jmp    c0005b2b <in_process+0x100>
c0005aea:	83 ec 0c             	sub    $0xc,%esp
c0005aed:	ff 75 08             	pushl  0x8(%ebp)
c0005af0:	e8 27 f4 ff ff       	call   c0004f1c <scroll_down>
c0005af5:	83 c4 10             	add    $0x10,%esp
c0005af8:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005aff:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005b06:	eb 23                	jmp    c0005b2b <in_process+0x100>
c0005b08:	83 ec 08             	sub    $0x8,%esp
c0005b0b:	6a 0a                	push   $0xa
c0005b0d:	ff 75 08             	pushl  0x8(%ebp)
c0005b10:	e8 72 f4 ff ff       	call   c0004f87 <out_char>
c0005b15:	83 c4 10             	add    $0x10,%esp
c0005b18:	eb 11                	jmp    c0005b2b <in_process+0x100>
c0005b1a:	83 ec 08             	sub    $0x8,%esp
c0005b1d:	6a 08                	push   $0x8
c0005b1f:	ff 75 08             	pushl  0x8(%ebp)
c0005b22:	e8 60 f4 ff ff       	call   c0004f87 <out_char>
c0005b27:	83 c4 10             	add    $0x10,%esp
c0005b2a:	90                   	nop
c0005b2b:	e9 8a 00 00 00       	jmp    c0005bba <in_process+0x18f>
c0005b30:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005b37:	74 55                	je     c0005b8e <in_process+0x163>
c0005b39:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005b40:	77 14                	ja     c0005b56 <in_process+0x12b>
c0005b42:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005b49:	74 31                	je     c0005b7c <in_process+0x151>
c0005b4b:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005b52:	74 16                	je     c0005b6a <in_process+0x13f>
c0005b54:	eb 64                	jmp    c0005bba <in_process+0x18f>
c0005b56:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005b5d:	74 3e                	je     c0005b9d <in_process+0x172>
c0005b5f:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005b66:	74 44                	je     c0005bac <in_process+0x181>
c0005b68:	eb 50                	jmp    c0005bba <in_process+0x18f>
c0005b6a:	83 ec 08             	sub    $0x8,%esp
c0005b6d:	6a 0a                	push   $0xa
c0005b6f:	ff 75 08             	pushl  0x8(%ebp)
c0005b72:	e8 e2 f2 ff ff       	call   c0004e59 <put_key>
c0005b77:	83 c4 10             	add    $0x10,%esp
c0005b7a:	eb 3e                	jmp    c0005bba <in_process+0x18f>
c0005b7c:	83 ec 08             	sub    $0x8,%esp
c0005b7f:	6a 08                	push   $0x8
c0005b81:	ff 75 08             	pushl  0x8(%ebp)
c0005b84:	e8 d0 f2 ff ff       	call   c0004e59 <put_key>
c0005b89:	83 c4 10             	add    $0x10,%esp
c0005b8c:	eb 2c                	jmp    c0005bba <in_process+0x18f>
c0005b8e:	83 ec 0c             	sub    $0xc,%esp
c0005b91:	6a 00                	push   $0x0
c0005b93:	e8 90 f1 ff ff       	call   c0004d28 <select_console>
c0005b98:	83 c4 10             	add    $0x10,%esp
c0005b9b:	eb 1d                	jmp    c0005bba <in_process+0x18f>
c0005b9d:	83 ec 0c             	sub    $0xc,%esp
c0005ba0:	6a 01                	push   $0x1
c0005ba2:	e8 81 f1 ff ff       	call   c0004d28 <select_console>
c0005ba7:	83 c4 10             	add    $0x10,%esp
c0005baa:	eb 0e                	jmp    c0005bba <in_process+0x18f>
c0005bac:	83 ec 0c             	sub    $0xc,%esp
c0005baf:	6a 02                	push   $0x2
c0005bb1:	e8 72 f1 ff ff       	call   c0004d28 <select_console>
c0005bb6:	83 c4 10             	add    $0x10,%esp
c0005bb9:	90                   	nop
c0005bba:	90                   	nop
c0005bbb:	c9                   	leave  
c0005bbc:	c3                   	ret    

c0005bbd <open>:
c0005bbd:	55                   	push   %ebp
c0005bbe:	89 e5                	mov    %esp,%ebp
c0005bc0:	83 ec 18             	sub    $0x18,%esp
c0005bc3:	83 ec 0c             	sub    $0xc,%esp
c0005bc6:	6a 6c                	push   $0x6c
c0005bc8:	e8 fb 11 00 00       	call   c0006dc8 <sys_malloc>
c0005bcd:	83 c4 10             	add    $0x10,%esp
c0005bd0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005bd3:	83 ec 04             	sub    $0x4,%esp
c0005bd6:	6a 6c                	push   $0x6c
c0005bd8:	6a 00                	push   $0x0
c0005bda:	ff 75 f4             	pushl  -0xc(%ebp)
c0005bdd:	e8 c1 52 00 00       	call   c000aea3 <Memset>
c0005be2:	83 c4 10             	add    $0x10,%esp
c0005be5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005be8:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0005bef:	83 ec 0c             	sub    $0xc,%esp
c0005bf2:	ff 75 08             	pushl  0x8(%ebp)
c0005bf5:	e8 fa 10 00 00       	call   c0006cf4 <get_physical_address>
c0005bfa:	83 c4 10             	add    $0x10,%esp
c0005bfd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005c00:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c03:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005c06:	89 50 34             	mov    %edx,0x34(%eax)
c0005c09:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005c0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c0f:	89 50 64             	mov    %edx,0x64(%eax)
c0005c12:	83 ec 0c             	sub    $0xc,%esp
c0005c15:	ff 75 08             	pushl  0x8(%ebp)
c0005c18:	e8 bf 52 00 00       	call   c000aedc <Strlen>
c0005c1d:	83 c4 10             	add    $0x10,%esp
c0005c20:	89 c2                	mov    %eax,%edx
c0005c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c25:	89 50 30             	mov    %edx,0x30(%eax)
c0005c28:	83 ec 04             	sub    $0x4,%esp
c0005c2b:	6a 04                	push   $0x4
c0005c2d:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c30:	6a 03                	push   $0x3
c0005c32:	e8 5d 3d 00 00       	call   c0009994 <send_rec>
c0005c37:	83 c4 10             	add    $0x10,%esp
c0005c3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c3d:	8b 40 40             	mov    0x40(%eax),%eax
c0005c40:	c9                   	leave  
c0005c41:	c3                   	ret    

c0005c42 <read>:
c0005c42:	55                   	push   %ebp
c0005c43:	89 e5                	mov    %esp,%ebp
c0005c45:	83 ec 18             	sub    $0x18,%esp
c0005c48:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005c4f:	83 ec 0c             	sub    $0xc,%esp
c0005c52:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c55:	e8 6e 11 00 00       	call   c0006dc8 <sys_malloc>
c0005c5a:	83 c4 10             	add    $0x10,%esp
c0005c5d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005c60:	83 ec 0c             	sub    $0xc,%esp
c0005c63:	ff 75 0c             	pushl  0xc(%ebp)
c0005c66:	e8 89 10 00 00       	call   c0006cf4 <get_physical_address>
c0005c6b:	83 c4 10             	add    $0x10,%esp
c0005c6e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005c71:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c74:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0005c7b:	8b 55 08             	mov    0x8(%ebp),%edx
c0005c7e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c81:	89 50 40             	mov    %edx,0x40(%eax)
c0005c84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c87:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005c8a:	89 50 10             	mov    %edx,0x10(%eax)
c0005c8d:	8b 55 10             	mov    0x10(%ebp),%edx
c0005c90:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005c93:	89 50 50             	mov    %edx,0x50(%eax)
c0005c96:	83 ec 04             	sub    $0x4,%esp
c0005c99:	6a 04                	push   $0x4
c0005c9b:	ff 75 f0             	pushl  -0x10(%ebp)
c0005c9e:	6a 03                	push   $0x3
c0005ca0:	e8 ef 3c 00 00       	call   c0009994 <send_rec>
c0005ca5:	83 c4 10             	add    $0x10,%esp
c0005ca8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005cab:	8b 40 50             	mov    0x50(%eax),%eax
c0005cae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005cb1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005cb4:	c9                   	leave  
c0005cb5:	c3                   	ret    

c0005cb6 <write>:
c0005cb6:	55                   	push   %ebp
c0005cb7:	89 e5                	mov    %esp,%ebp
c0005cb9:	83 ec 18             	sub    $0x18,%esp
c0005cbc:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005cc3:	83 ec 0c             	sub    $0xc,%esp
c0005cc6:	ff 75 f4             	pushl  -0xc(%ebp)
c0005cc9:	e8 fa 10 00 00       	call   c0006dc8 <sys_malloc>
c0005cce:	83 c4 10             	add    $0x10,%esp
c0005cd1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005cd4:	83 ec 0c             	sub    $0xc,%esp
c0005cd7:	ff 75 0c             	pushl  0xc(%ebp)
c0005cda:	e8 15 10 00 00       	call   c0006cf4 <get_physical_address>
c0005cdf:	83 c4 10             	add    $0x10,%esp
c0005ce2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005ce5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005ce8:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0005cef:	8b 55 08             	mov    0x8(%ebp),%edx
c0005cf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005cf5:	89 50 40             	mov    %edx,0x40(%eax)
c0005cf8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005cfb:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005cfe:	89 50 10             	mov    %edx,0x10(%eax)
c0005d01:	8b 55 10             	mov    0x10(%ebp),%edx
c0005d04:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d07:	89 50 50             	mov    %edx,0x50(%eax)
c0005d0a:	83 ec 04             	sub    $0x4,%esp
c0005d0d:	6a 04                	push   $0x4
c0005d0f:	ff 75 f0             	pushl  -0x10(%ebp)
c0005d12:	6a 03                	push   $0x3
c0005d14:	e8 7b 3c 00 00       	call   c0009994 <send_rec>
c0005d19:	83 c4 10             	add    $0x10,%esp
c0005d1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d1f:	8b 40 50             	mov    0x50(%eax),%eax
c0005d22:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005d25:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005d28:	c9                   	leave  
c0005d29:	c3                   	ret    

c0005d2a <close>:
c0005d2a:	55                   	push   %ebp
c0005d2b:	89 e5                	mov    %esp,%ebp
c0005d2d:	83 ec 78             	sub    $0x78,%esp
c0005d30:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005d37:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d3a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005d3d:	83 ec 04             	sub    $0x4,%esp
c0005d40:	6a 04                	push   $0x4
c0005d42:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005d45:	50                   	push   %eax
c0005d46:	6a 03                	push   $0x3
c0005d48:	e8 47 3c 00 00       	call   c0009994 <send_rec>
c0005d4d:	83 c4 10             	add    $0x10,%esp
c0005d50:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d53:	83 f8 65             	cmp    $0x65,%eax
c0005d56:	74 19                	je     c0005d71 <close+0x47>
c0005d58:	6a 13                	push   $0x13
c0005d5a:	68 b1 a6 00 c0       	push   $0xc000a6b1
c0005d5f:	68 b1 a6 00 c0       	push   $0xc000a6b1
c0005d64:	68 bd a6 00 c0       	push   $0xc000a6bd
c0005d69:	e8 05 34 00 00       	call   c0009173 <assertion_failure>
c0005d6e:	83 c4 10             	add    $0x10,%esp
c0005d71:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005d74:	c9                   	leave  
c0005d75:	c3                   	ret    

c0005d76 <wait>:
c0005d76:	55                   	push   %ebp
c0005d77:	89 e5                	mov    %esp,%ebp
c0005d79:	83 ec 78             	sub    $0x78,%esp
c0005d7c:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005d83:	83 ec 04             	sub    $0x4,%esp
c0005d86:	6a 05                	push   $0x5
c0005d88:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005d8b:	50                   	push   %eax
c0005d8c:	6a 03                	push   $0x3
c0005d8e:	e8 01 3c 00 00       	call   c0009994 <send_rec>
c0005d93:	83 c4 10             	add    $0x10,%esp
c0005d96:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005d99:	89 c2                	mov    %eax,%edx
c0005d9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0005d9e:	89 10                	mov    %edx,(%eax)
c0005da0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005da3:	83 f8 1d             	cmp    $0x1d,%eax
c0005da6:	74 05                	je     c0005dad <wait+0x37>
c0005da8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005dab:	eb 05                	jmp    c0005db2 <wait+0x3c>
c0005dad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005db2:	c9                   	leave  
c0005db3:	c3                   	ret    

c0005db4 <exit>:
c0005db4:	55                   	push   %ebp
c0005db5:	89 e5                	mov    %esp,%ebp
c0005db7:	83 ec 78             	sub    $0x78,%esp
c0005dba:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005dc1:	8b 45 08             	mov    0x8(%ebp),%eax
c0005dc4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005dc7:	83 ec 04             	sub    $0x4,%esp
c0005dca:	6a 05                	push   $0x5
c0005dcc:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005dcf:	50                   	push   %eax
c0005dd0:	6a 03                	push   $0x3
c0005dd2:	e8 bd 3b 00 00       	call   c0009994 <send_rec>
c0005dd7:	83 c4 10             	add    $0x10,%esp
c0005dda:	90                   	nop
c0005ddb:	c9                   	leave  
c0005ddc:	c3                   	ret    

c0005ddd <fork>:
c0005ddd:	55                   	push   %ebp
c0005dde:	89 e5                	mov    %esp,%ebp
c0005de0:	83 ec 78             	sub    $0x78,%esp
c0005de3:	83 ec 04             	sub    $0x4,%esp
c0005de6:	6a 6c                	push   $0x6c
c0005de8:	6a 00                	push   $0x0
c0005dea:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005ded:	50                   	push   %eax
c0005dee:	e8 b0 50 00 00       	call   c000aea3 <Memset>
c0005df3:	83 c4 10             	add    $0x10,%esp
c0005df6:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005dfd:	83 ec 04             	sub    $0x4,%esp
c0005e00:	6a 05                	push   $0x5
c0005e02:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e05:	50                   	push   %eax
c0005e06:	6a 03                	push   $0x3
c0005e08:	e8 87 3b 00 00       	call   c0009994 <send_rec>
c0005e0d:	83 c4 10             	add    $0x10,%esp
c0005e10:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005e17:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005e1a:	85 c0                	test   %eax,%eax
c0005e1c:	74 19                	je     c0005e37 <fork+0x5a>
c0005e1e:	6a 14                	push   $0x14
c0005e20:	68 d5 a6 00 c0       	push   $0xc000a6d5
c0005e25:	68 d5 a6 00 c0       	push   $0xc000a6d5
c0005e2a:	68 e0 a6 00 c0       	push   $0xc000a6e0
c0005e2f:	e8 3f 33 00 00       	call   c0009173 <assertion_failure>
c0005e34:	83 c4 10             	add    $0x10,%esp
c0005e37:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005e3a:	c9                   	leave  
c0005e3b:	c3                   	ret    

c0005e3c <getpid>:
c0005e3c:	55                   	push   %ebp
c0005e3d:	89 e5                	mov    %esp,%ebp
c0005e3f:	83 ec 78             	sub    $0x78,%esp
c0005e42:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005e49:	83 ec 04             	sub    $0x4,%esp
c0005e4c:	6a 03                	push   $0x3
c0005e4e:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e51:	50                   	push   %eax
c0005e52:	6a 03                	push   $0x3
c0005e54:	e8 3b 3b 00 00       	call   c0009994 <send_rec>
c0005e59:	83 c4 10             	add    $0x10,%esp
c0005e5c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005e5f:	c9                   	leave  
c0005e60:	c3                   	ret    

c0005e61 <exec>:
c0005e61:	55                   	push   %ebp
c0005e62:	89 e5                	mov    %esp,%ebp
c0005e64:	83 ec 78             	sub    $0x78,%esp
c0005e67:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005e6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e71:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005e74:	83 ec 0c             	sub    $0xc,%esp
c0005e77:	ff 75 08             	pushl  0x8(%ebp)
c0005e7a:	e8 5d 50 00 00       	call   c000aedc <Strlen>
c0005e7f:	83 c4 10             	add    $0x10,%esp
c0005e82:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005e85:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0005e8c:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0005e93:	83 ec 04             	sub    $0x4,%esp
c0005e96:	6a 05                	push   $0x5
c0005e98:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e9b:	50                   	push   %eax
c0005e9c:	6a 03                	push   $0x3
c0005e9e:	e8 f1 3a 00 00       	call   c0009994 <send_rec>
c0005ea3:	83 c4 10             	add    $0x10,%esp
c0005ea6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ea9:	83 f8 65             	cmp    $0x65,%eax
c0005eac:	74 19                	je     c0005ec7 <exec+0x66>
c0005eae:	6a 19                	push   $0x19
c0005eb0:	68 f0 a6 00 c0       	push   $0xc000a6f0
c0005eb5:	68 f0 a6 00 c0       	push   $0xc000a6f0
c0005eba:	68 fb a6 00 c0       	push   $0xc000a6fb
c0005ebf:	e8 af 32 00 00       	call   c0009173 <assertion_failure>
c0005ec4:	83 c4 10             	add    $0x10,%esp
c0005ec7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005eca:	c9                   	leave  
c0005ecb:	c3                   	ret    

c0005ecc <execv>:
c0005ecc:	55                   	push   %ebp
c0005ecd:	89 e5                	mov    %esp,%ebp
c0005ecf:	57                   	push   %edi
c0005ed0:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0005ed6:	83 ec 04             	sub    $0x4,%esp
c0005ed9:	68 00 80 00 00       	push   $0x8000
c0005ede:	6a 00                	push   $0x0
c0005ee0:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005ee6:	50                   	push   %eax
c0005ee7:	e8 b7 4f 00 00       	call   c000aea3 <Memset>
c0005eec:	83 c4 10             	add    $0x10,%esp
c0005eef:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005ef2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005ef5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005efc:	eb 0d                	jmp    c0005f0b <execv+0x3f>
c0005efe:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0005f02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f05:	83 c0 04             	add    $0x4,%eax
c0005f08:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f0e:	8b 00                	mov    (%eax),%eax
c0005f10:	85 c0                	test   %eax,%eax
c0005f12:	75 ea                	jne    c0005efe <execv+0x32>
c0005f14:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005f1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f1d:	01 d0                	add    %edx,%eax
c0005f1f:	c6 00 00             	movb   $0x0,(%eax)
c0005f22:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f25:	83 c0 04             	add    $0x4,%eax
c0005f28:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f2b:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005f31:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005f34:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005f37:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005f3a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005f41:	eb 64                	jmp    c0005fa7 <execv+0xdb>
c0005f43:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005f49:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f4c:	01 c2                	add    %eax,%edx
c0005f4e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005f51:	89 10                	mov    %edx,(%eax)
c0005f53:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005f56:	8b 00                	mov    (%eax),%eax
c0005f58:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0005f5e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005f61:	01 ca                	add    %ecx,%edx
c0005f63:	83 ec 08             	sub    $0x8,%esp
c0005f66:	50                   	push   %eax
c0005f67:	52                   	push   %edx
c0005f68:	e8 55 4f 00 00       	call   c000aec2 <Strcpy>
c0005f6d:	83 c4 10             	add    $0x10,%esp
c0005f70:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005f73:	8b 00                	mov    (%eax),%eax
c0005f75:	83 ec 0c             	sub    $0xc,%esp
c0005f78:	50                   	push   %eax
c0005f79:	e8 5e 4f 00 00       	call   c000aedc <Strlen>
c0005f7e:	83 c4 10             	add    $0x10,%esp
c0005f81:	01 45 f0             	add    %eax,-0x10(%ebp)
c0005f84:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005f8a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f8d:	01 d0                	add    %edx,%eax
c0005f8f:	c6 00 00             	movb   $0x0,(%eax)
c0005f92:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f95:	83 c0 01             	add    $0x1,%eax
c0005f98:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f9b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0005f9f:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0005fa3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0005fa7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005faa:	8b 00                	mov    (%eax),%eax
c0005fac:	85 c0                	test   %eax,%eax
c0005fae:	75 93                	jne    c0005f43 <execv+0x77>
c0005fb0:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005fb6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005fb9:	eb 04                	jmp    c0005fbf <execv+0xf3>
c0005fbb:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0005fbf:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0005fc2:	8b 00                	mov    (%eax),%eax
c0005fc4:	85 c0                	test   %eax,%eax
c0005fc6:	75 f3                	jne    c0005fbb <execv+0xef>
c0005fc8:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c0005fce:	b8 00 00 00 00       	mov    $0x0,%eax
c0005fd3:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0005fd8:	89 d7                	mov    %edx,%edi
c0005fda:	f3 ab                	rep stos %eax,%es:(%edi)
c0005fdc:	c7 85 4c 7f ff ff 13 	movl   $0xc000a713,-0x80b4(%ebp)
c0005fe3:	a7 00 c0 
c0005fe6:	c7 85 50 7f ff ff 1a 	movl   $0xc000a71a,-0x80b0(%ebp)
c0005fed:	a7 00 c0 
c0005ff0:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0005ff7:	00 00 00 
c0005ffa:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ffd:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c0006003:	83 ec 0c             	sub    $0xc,%esp
c0006006:	ff 75 08             	pushl  0x8(%ebp)
c0006009:	e8 ce 4e 00 00       	call   c000aedc <Strlen>
c000600e:	83 c4 10             	add    $0x10,%esp
c0006011:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0006017:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000601d:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0006023:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006026:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c000602c:	83 ec 04             	sub    $0x4,%esp
c000602f:	6a 05                	push   $0x5
c0006031:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0006037:	50                   	push   %eax
c0006038:	6a 03                	push   $0x3
c000603a:	e8 55 39 00 00       	call   c0009994 <send_rec>
c000603f:	83 c4 10             	add    $0x10,%esp
c0006042:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0006048:	83 f8 65             	cmp    $0x65,%eax
c000604b:	74 19                	je     c0006066 <execv+0x19a>
c000604d:	6a 72                	push   $0x72
c000604f:	68 f0 a6 00 c0       	push   $0xc000a6f0
c0006054:	68 f0 a6 00 c0       	push   $0xc000a6f0
c0006059:	68 fb a6 00 c0       	push   $0xc000a6fb
c000605e:	e8 10 31 00 00       	call   c0009173 <assertion_failure>
c0006063:	83 c4 10             	add    $0x10,%esp
c0006066:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c000606c:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000606f:	c9                   	leave  
c0006070:	c3                   	ret    

c0006071 <execl>:
c0006071:	55                   	push   %ebp
c0006072:	89 e5                	mov    %esp,%ebp
c0006074:	83 ec 18             	sub    $0x18,%esp
c0006077:	8d 45 0c             	lea    0xc(%ebp),%eax
c000607a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000607d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006080:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006083:	83 ec 08             	sub    $0x8,%esp
c0006086:	ff 75 f0             	pushl  -0x10(%ebp)
c0006089:	ff 75 08             	pushl  0x8(%ebp)
c000608c:	e8 3b fe ff ff       	call   c0005ecc <execv>
c0006091:	83 c4 10             	add    $0x10,%esp
c0006094:	c9                   	leave  
c0006095:	c3                   	ret    

c0006096 <TaskMM>:
c0006096:	55                   	push   %ebp
c0006097:	89 e5                	mov    %esp,%ebp
c0006099:	eb fe                	jmp    c0006099 <TaskMM+0x3>

c000609b <alloc_mem>:
c000609b:	55                   	push   %ebp
c000609c:	89 e5                	mov    %esp,%ebp
c000609e:	83 ec 10             	sub    $0x10,%esp
c00060a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00060a4:	83 e8 04             	sub    $0x4,%eax
c00060a7:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c00060ad:	05 00 00 a0 00       	add    $0xa00000,%eax
c00060b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00060b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00060b8:	c9                   	leave  
c00060b9:	c3                   	ret    

c00060ba <do_exec2>:
c00060ba:	55                   	push   %ebp
c00060bb:	89 e5                	mov    %esp,%ebp
c00060bd:	83 ec 10             	sub    $0x10,%esp
c00060c0:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c00060c7:	b8 00 00 00 00       	mov    $0x0,%eax
c00060cc:	c9                   	leave  
c00060cd:	c3                   	ret    

c00060ce <do_exec>:
c00060ce:	55                   	push   %ebp
c00060cf:	89 e5                	mov    %esp,%ebp
c00060d1:	56                   	push   %esi
c00060d2:	53                   	push   %ebx
c00060d3:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c00060d9:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c00060e0:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c00060e7:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c00060ed:	83 ec 08             	sub    $0x8,%esp
c00060f0:	6a 00                	push   $0x0
c00060f2:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c00060f5:	50                   	push   %eax
c00060f6:	e8 c2 fa ff ff       	call   c0005bbd <open>
c00060fb:	83 c4 10             	add    $0x10,%esp
c00060fe:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006101:	8b 45 08             	mov    0x8(%ebp),%eax
c0006104:	8b 00                	mov    (%eax),%eax
c0006106:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006109:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c0006110:	83 ec 04             	sub    $0x4,%esp
c0006113:	6a 0c                	push   $0xc
c0006115:	6a 00                	push   $0x0
c0006117:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000611d:	50                   	push   %eax
c000611e:	e8 80 4d 00 00       	call   c000aea3 <Memset>
c0006123:	83 c4 10             	add    $0x10,%esp
c0006126:	8b 45 08             	mov    0x8(%ebp),%eax
c0006129:	8b 40 30             	mov    0x30(%eax),%eax
c000612c:	89 c6                	mov    %eax,%esi
c000612e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006131:	8b 40 34             	mov    0x34(%eax),%eax
c0006134:	83 ec 08             	sub    $0x8,%esp
c0006137:	50                   	push   %eax
c0006138:	ff 75 d8             	pushl  -0x28(%ebp)
c000613b:	e8 90 e9 ff ff       	call   c0004ad0 <v2l>
c0006140:	83 c4 10             	add    $0x10,%esp
c0006143:	89 c3                	mov    %eax,%ebx
c0006145:	83 ec 08             	sub    $0x8,%esp
c0006148:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000614e:	50                   	push   %eax
c000614f:	6a 05                	push   $0x5
c0006151:	e8 7a e9 ff ff       	call   c0004ad0 <v2l>
c0006156:	83 c4 10             	add    $0x10,%esp
c0006159:	83 ec 04             	sub    $0x4,%esp
c000615c:	56                   	push   %esi
c000615d:	53                   	push   %ebx
c000615e:	50                   	push   %eax
c000615f:	e8 11 4d 00 00       	call   c000ae75 <Memcpy>
c0006164:	83 c4 10             	add    $0x10,%esp
c0006167:	83 ec 08             	sub    $0x8,%esp
c000616a:	6a 00                	push   $0x0
c000616c:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006172:	50                   	push   %eax
c0006173:	e8 45 fa ff ff       	call   c0005bbd <open>
c0006178:	83 c4 10             	add    $0x10,%esp
c000617b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000617e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006185:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006188:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c000618e:	01 d0                	add    %edx,%eax
c0006190:	83 ec 04             	sub    $0x4,%esp
c0006193:	68 00 02 00 00       	push   $0x200
c0006198:	50                   	push   %eax
c0006199:	ff 75 d0             	pushl  -0x30(%ebp)
c000619c:	e8 a1 fa ff ff       	call   c0005c42 <read>
c00061a1:	83 c4 10             	add    $0x10,%esp
c00061a4:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00061a7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00061aa:	01 45 f4             	add    %eax,-0xc(%ebp)
c00061ad:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00061b1:	74 02                	je     c00061b5 <do_exec+0xe7>
c00061b3:	eb d0                	jmp    c0006185 <do_exec+0xb7>
c00061b5:	90                   	nop
c00061b6:	83 ec 0c             	sub    $0xc,%esp
c00061b9:	ff 75 d0             	pushl  -0x30(%ebp)
c00061bc:	e8 69 fb ff ff       	call   c0005d2a <close>
c00061c1:	83 c4 10             	add    $0x10,%esp
c00061c4:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00061ca:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00061cd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00061d4:	eb 72                	jmp    c0006248 <do_exec+0x17a>
c00061d6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00061d9:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c00061dd:	0f b7 d0             	movzwl %ax,%edx
c00061e0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00061e3:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c00061e7:	0f b7 c0             	movzwl %ax,%eax
c00061ea:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c00061ee:	01 c2                	add    %eax,%edx
c00061f0:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00061f6:	01 d0                	add    %edx,%eax
c00061f8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00061fb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00061fe:	8b 40 10             	mov    0x10(%eax),%eax
c0006201:	89 c6                	mov    %eax,%esi
c0006203:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006206:	8b 40 04             	mov    0x4(%eax),%eax
c0006209:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c000620f:	01 d0                	add    %edx,%eax
c0006211:	83 ec 08             	sub    $0x8,%esp
c0006214:	50                   	push   %eax
c0006215:	6a 05                	push   $0x5
c0006217:	e8 b4 e8 ff ff       	call   c0004ad0 <v2l>
c000621c:	83 c4 10             	add    $0x10,%esp
c000621f:	89 c3                	mov    %eax,%ebx
c0006221:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0006224:	8b 40 08             	mov    0x8(%eax),%eax
c0006227:	83 ec 08             	sub    $0x8,%esp
c000622a:	50                   	push   %eax
c000622b:	ff 75 d8             	pushl  -0x28(%ebp)
c000622e:	e8 9d e8 ff ff       	call   c0004ad0 <v2l>
c0006233:	83 c4 10             	add    $0x10,%esp
c0006236:	83 ec 04             	sub    $0x4,%esp
c0006239:	56                   	push   %esi
c000623a:	53                   	push   %ebx
c000623b:	50                   	push   %eax
c000623c:	e8 34 4c 00 00       	call   c000ae75 <Memcpy>
c0006241:	83 c4 10             	add    $0x10,%esp
c0006244:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006248:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000624b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c000624f:	0f b7 c0             	movzwl %ax,%eax
c0006252:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006255:	0f 8c 7b ff ff ff    	jl     c00061d6 <do_exec+0x108>
c000625b:	8b 45 08             	mov    0x8(%ebp),%eax
c000625e:	8b 40 10             	mov    0x10(%eax),%eax
c0006261:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006264:	8b 45 08             	mov    0x8(%ebp),%eax
c0006267:	8b 40 1c             	mov    0x1c(%eax),%eax
c000626a:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000626d:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c0006274:	83 ec 08             	sub    $0x8,%esp
c0006277:	ff 75 c0             	pushl  -0x40(%ebp)
c000627a:	ff 75 d8             	pushl  -0x28(%ebp)
c000627d:	e8 4e e8 ff ff       	call   c0004ad0 <v2l>
c0006282:	83 c4 10             	add    $0x10,%esp
c0006285:	89 c3                	mov    %eax,%ebx
c0006287:	83 ec 08             	sub    $0x8,%esp
c000628a:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006290:	50                   	push   %eax
c0006291:	6a 05                	push   $0x5
c0006293:	e8 38 e8 ff ff       	call   c0004ad0 <v2l>
c0006298:	83 c4 10             	add    $0x10,%esp
c000629b:	83 ec 04             	sub    $0x4,%esp
c000629e:	ff 75 bc             	pushl  -0x44(%ebp)
c00062a1:	53                   	push   %ebx
c00062a2:	50                   	push   %eax
c00062a3:	e8 cd 4b 00 00       	call   c000ae75 <Memcpy>
c00062a8:	83 c4 10             	add    $0x10,%esp
c00062ab:	83 ec 08             	sub    $0x8,%esp
c00062ae:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00062b4:	50                   	push   %eax
c00062b5:	6a 05                	push   $0x5
c00062b7:	e8 14 e8 ff ff       	call   c0004ad0 <v2l>
c00062bc:	83 c4 10             	add    $0x10,%esp
c00062bf:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00062c2:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00062c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00062c8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00062cf:	eb 08                	jmp    c00062d9 <do_exec+0x20b>
c00062d1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00062d5:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00062d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00062dc:	8b 00                	mov    (%eax),%eax
c00062de:	85 c0                	test   %eax,%eax
c00062e0:	75 ef                	jne    c00062d1 <do_exec+0x203>
c00062e2:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00062e5:	2b 45 c0             	sub    -0x40(%ebp),%eax
c00062e8:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00062eb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00062f2:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00062f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00062fb:	eb 17                	jmp    c0006314 <do_exec+0x246>
c00062fd:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006301:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006304:	8b 10                	mov    (%eax),%edx
c0006306:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006309:	01 c2                	add    %eax,%edx
c000630b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000630e:	89 10                	mov    %edx,(%eax)
c0006310:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0006314:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006317:	8b 00                	mov    (%eax),%eax
c0006319:	85 c0                	test   %eax,%eax
c000631b:	75 e0                	jne    c00062fd <do_exec+0x22f>
c000631d:	83 ec 08             	sub    $0x8,%esp
c0006320:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006326:	50                   	push   %eax
c0006327:	6a 05                	push   $0x5
c0006329:	e8 a2 e7 ff ff       	call   c0004ad0 <v2l>
c000632e:	83 c4 10             	add    $0x10,%esp
c0006331:	89 c3                	mov    %eax,%ebx
c0006333:	83 ec 08             	sub    $0x8,%esp
c0006336:	ff 75 b8             	pushl  -0x48(%ebp)
c0006339:	ff 75 d8             	pushl  -0x28(%ebp)
c000633c:	e8 8f e7 ff ff       	call   c0004ad0 <v2l>
c0006341:	83 c4 10             	add    $0x10,%esp
c0006344:	83 ec 04             	sub    $0x4,%esp
c0006347:	ff 75 bc             	pushl  -0x44(%ebp)
c000634a:	53                   	push   %ebx
c000634b:	50                   	push   %eax
c000634c:	e8 24 4b 00 00       	call   c000ae75 <Memcpy>
c0006351:	83 c4 10             	add    $0x10,%esp
c0006354:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006357:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000635a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000635d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006360:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006366:	81 c2 94 35 08 c0    	add    $0xc0083594,%edx
c000636c:	89 02                	mov    %eax,(%edx)
c000636e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006371:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006374:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c000637a:	81 c2 90 35 08 c0    	add    $0xc0083590,%edx
c0006380:	89 02                	mov    %eax,(%edx)
c0006382:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006385:	8b 40 18             	mov    0x18(%eax),%eax
c0006388:	89 c2                	mov    %eax,%edx
c000638a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000638d:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006393:	05 98 35 08 c0       	add    $0xc0083598,%eax
c0006398:	89 10                	mov    %edx,(%eax)
c000639a:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000639d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00063a0:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c00063a6:	81 c2 a4 35 08 c0    	add    $0xc00835a4,%edx
c00063ac:	89 02                	mov    %eax,(%edx)
c00063ae:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00063b1:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00063b7:	05 4c 35 08 c0       	add    $0xc008354c,%eax
c00063bc:	c7 00 1d 00 00 00    	movl   $0x1d,(%eax)
c00063c2:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c00063c9:	00 00 00 
c00063cc:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c00063d3:	00 00 00 
c00063d6:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c00063dd:	00 00 00 
c00063e0:	83 ec 04             	sub    $0x4,%esp
c00063e3:	ff 75 d8             	pushl  -0x28(%ebp)
c00063e6:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c00063ec:	50                   	push   %eax
c00063ed:	6a 01                	push   $0x1
c00063ef:	e8 a0 35 00 00       	call   c0009994 <send_rec>
c00063f4:	83 c4 10             	add    $0x10,%esp
c00063f7:	90                   	nop
c00063f8:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00063fb:	5b                   	pop    %ebx
c00063fc:	5e                   	pop    %esi
c00063fd:	5d                   	pop    %ebp
c00063fe:	c3                   	ret    

c00063ff <do_fork>:
c00063ff:	55                   	push   %ebp
c0006400:	89 e5                	mov    %esp,%ebp
c0006402:	57                   	push   %edi
c0006403:	56                   	push   %esi
c0006404:	53                   	push   %ebx
c0006405:	81 ec ac 00 00 00    	sub    $0xac,%esp
c000640b:	c7 45 e4 b0 3d 08 c0 	movl   $0xc0083db0,-0x1c(%ebp)
c0006412:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006419:	c7 45 dc 04 00 00 00 	movl   $0x4,-0x24(%ebp)
c0006420:	eb 21                	jmp    c0006443 <do_fork+0x44>
c0006422:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006425:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000642c:	3c ff                	cmp    $0xff,%al
c000642e:	75 08                	jne    c0006438 <do_fork+0x39>
c0006430:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006433:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006436:	eb 11                	jmp    c0006449 <do_fork+0x4a>
c0006438:	81 45 e4 ac 02 00 00 	addl   $0x2ac,-0x1c(%ebp)
c000643f:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0006443:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
c0006447:	7e d9                	jle    c0006422 <do_fork+0x23>
c0006449:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000644d:	7f 19                	jg     c0006468 <do_fork+0x69>
c000644f:	6a 25                	push   $0x25
c0006451:	68 24 a7 00 c0       	push   $0xc000a724
c0006456:	68 24 a7 00 c0       	push   $0xc000a724
c000645b:	68 34 a7 00 c0       	push   $0xc000a734
c0006460:	e8 0e 2d 00 00       	call   c0009173 <assertion_failure>
c0006465:	83 c4 10             	add    $0x10,%esp
c0006468:	8b 45 08             	mov    0x8(%ebp),%eax
c000646b:	8b 00                	mov    (%eax),%eax
c000646d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006470:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006473:	0f b7 80 0c 01 00 00 	movzwl 0x10c(%eax),%eax
c000647a:	0f b7 c0             	movzwl %ax,%eax
c000647d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006480:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006483:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0006486:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c000648c:	8d 8a 00 33 08 c0    	lea    -0x3ff7cd00(%edx),%ecx
c0006492:	89 c2                	mov    %eax,%edx
c0006494:	89 cb                	mov    %ecx,%ebx
c0006496:	b8 ab 00 00 00       	mov    $0xab,%eax
c000649b:	89 d7                	mov    %edx,%edi
c000649d:	89 de                	mov    %ebx,%esi
c000649f:	89 c1                	mov    %eax,%ecx
c00064a1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c00064a3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00064a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00064a9:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c00064af:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00064b2:	89 c2                	mov    %eax,%edx
c00064b4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00064b7:	66 89 90 0c 01 00 00 	mov    %dx,0x10c(%eax)
c00064be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00064c1:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00064c4:	89 90 60 02 00 00    	mov    %edx,0x260(%eax)
c00064ca:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00064cd:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00064d3:	05 00 01 00 00       	add    $0x100,%eax
c00064d8:	05 00 33 08 c0       	add    $0xc0083300,%eax
c00064dd:	83 c0 0e             	add    $0xe,%eax
c00064e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00064e3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00064e6:	0f b6 40 07          	movzbl 0x7(%eax),%eax
c00064ea:	0f b6 c0             	movzbl %al,%eax
c00064ed:	c1 e0 18             	shl    $0x18,%eax
c00064f0:	89 c2                	mov    %eax,%edx
c00064f2:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00064f5:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c00064f9:	0f b6 c0             	movzbl %al,%eax
c00064fc:	c1 e0 10             	shl    $0x10,%eax
c00064ff:	01 c2                	add    %eax,%edx
c0006501:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006504:	0f b7 40 02          	movzwl 0x2(%eax),%eax
c0006508:	0f b7 c0             	movzwl %ax,%eax
c000650b:	01 d0                	add    %edx,%eax
c000650d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006510:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006513:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0006517:	0f b6 c0             	movzbl %al,%eax
c000651a:	25 00 00 0f 00       	and    $0xf0000,%eax
c000651f:	89 c2                	mov    %eax,%edx
c0006521:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006524:	0f b7 00             	movzwl (%eax),%eax
c0006527:	0f b7 c0             	movzwl %ax,%eax
c000652a:	01 d0                	add    %edx,%eax
c000652c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000652f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006532:	83 c0 01             	add    $0x1,%eax
c0006535:	c1 e0 0c             	shl    $0xc,%eax
c0006538:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000653b:	83 ec 08             	sub    $0x8,%esp
c000653e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0006541:	ff 75 e0             	pushl  -0x20(%ebp)
c0006544:	e8 52 fb ff ff       	call   c000609b <alloc_mem>
c0006549:	83 c4 10             	add    $0x10,%esp
c000654c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000654f:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0006552:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006555:	83 ec 04             	sub    $0x4,%esp
c0006558:	ff 75 c4             	pushl  -0x3c(%ebp)
c000655b:	52                   	push   %edx
c000655c:	50                   	push   %eax
c000655d:	e8 13 49 00 00       	call   c000ae75 <Memcpy>
c0006562:	83 c4 10             	add    $0x10,%esp
c0006565:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c000656c:	c7 45 b8 fa 0c 00 00 	movl   $0xcfa,-0x48(%ebp)
c0006573:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006576:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000657c:	05 00 01 00 00       	add    $0x100,%eax
c0006581:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006586:	83 c0 0e             	add    $0xe,%eax
c0006589:	ff 75 b8             	pushl  -0x48(%ebp)
c000658c:	ff 75 c8             	pushl  -0x38(%ebp)
c000658f:	ff 75 c0             	pushl  -0x40(%ebp)
c0006592:	50                   	push   %eax
c0006593:	e8 30 e4 ff ff       	call   c00049c8 <InitDescriptor>
c0006598:	83 c4 10             	add    $0x10,%esp
c000659b:	c7 45 b4 f2 0c 00 00 	movl   $0xcf2,-0x4c(%ebp)
c00065a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065a5:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00065ab:	05 08 01 00 00       	add    $0x108,%eax
c00065b0:	05 00 33 08 c0       	add    $0xc0083300,%eax
c00065b5:	83 c0 0e             	add    $0xe,%eax
c00065b8:	ff 75 b4             	pushl  -0x4c(%ebp)
c00065bb:	ff 75 c8             	pushl  -0x38(%ebp)
c00065be:	ff 75 c0             	pushl  -0x40(%ebp)
c00065c1:	50                   	push   %eax
c00065c2:	e8 01 e4 ff ff       	call   c00049c8 <InitDescriptor>
c00065c7:	83 c4 10             	add    $0x10,%esp
c00065ca:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00065cd:	8b 45 08             	mov    0x8(%ebp),%eax
c00065d0:	89 50 4c             	mov    %edx,0x4c(%eax)
c00065d3:	c7 45 b0 65 00 00 00 	movl   $0x65,-0x50(%ebp)
c00065da:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
c00065e1:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%ebp)
c00065e8:	83 ec 04             	sub    $0x4,%esp
c00065eb:	ff 75 e0             	pushl  -0x20(%ebp)
c00065ee:	8d 85 48 ff ff ff    	lea    -0xb8(%ebp),%eax
c00065f4:	50                   	push   %eax
c00065f5:	6a 01                	push   $0x1
c00065f7:	e8 98 33 00 00       	call   c0009994 <send_rec>
c00065fc:	83 c4 10             	add    $0x10,%esp
c00065ff:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006602:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0006605:	5b                   	pop    %ebx
c0006606:	5e                   	pop    %esi
c0006607:	5f                   	pop    %edi
c0006608:	5d                   	pop    %ebp
c0006609:	c3                   	ret    

c000660a <do_exit>:
c000660a:	55                   	push   %ebp
c000660b:	89 e5                	mov    %esp,%ebp
c000660d:	83 ec 18             	sub    $0x18,%esp
c0006610:	8b 45 08             	mov    0x8(%ebp),%eax
c0006613:	8b 00                	mov    (%eax),%eax
c0006615:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006618:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000661b:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006621:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006626:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006629:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000662c:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0006632:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006635:	8b 45 08             	mov    0x8(%ebp),%eax
c0006638:	8b 40 44             	mov    0x44(%eax),%eax
c000663b:	89 c2                	mov    %eax,%edx
c000663d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006640:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c0006646:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006649:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000664f:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006654:	0f b6 00             	movzbl (%eax),%eax
c0006657:	3c 04                	cmp    $0x4,%al
c0006659:	75 21                	jne    c000667c <do_exit+0x72>
c000665b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000665e:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006664:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006669:	c6 00 fb             	movb   $0xfb,(%eax)
c000666c:	83 ec 0c             	sub    $0xc,%esp
c000666f:	ff 75 ec             	pushl  -0x14(%ebp)
c0006672:	e8 59 01 00 00       	call   c00067d0 <cleanup>
c0006677:	83 c4 10             	add    $0x10,%esp
c000667a:	eb 0a                	jmp    c0006686 <do_exit+0x7c>
c000667c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000667f:	c6 80 44 02 00 00 03 	movb   $0x3,0x244(%eax)
c0006686:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c000668d:	eb 6e                	jmp    c00066fd <do_exit+0xf3>
c000668f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006692:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006698:	05 60 35 08 c0       	add    $0xc0083560,%eax
c000669d:	8b 00                	mov    (%eax),%eax
c000669f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00066a2:	75 55                	jne    c00066f9 <do_exit+0xef>
c00066a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066a7:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00066ad:	05 60 35 08 c0       	add    $0xc0083560,%eax
c00066b2:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00066b8:	0f b6 05 4d 45 08 c0 	movzbl 0xc008454d,%eax
c00066bf:	3c 04                	cmp    $0x4,%al
c00066c1:	75 36                	jne    c00066f9 <do_exit+0xef>
c00066c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066c6:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00066cc:	05 45 35 08 c0       	add    $0xc0083545,%eax
c00066d1:	0f b6 00             	movzbl (%eax),%eax
c00066d4:	3c 03                	cmp    $0x3,%al
c00066d6:	75 21                	jne    c00066f9 <do_exit+0xef>
c00066d8:	c6 05 4d 45 08 c0 fb 	movb   $0xfb,0xc008454d
c00066df:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066e2:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00066e8:	05 00 33 08 c0       	add    $0xc0083300,%eax
c00066ed:	83 ec 0c             	sub    $0xc,%esp
c00066f0:	50                   	push   %eax
c00066f1:	e8 da 00 00 00       	call   c00067d0 <cleanup>
c00066f6:	83 c4 10             	add    $0x10,%esp
c00066f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00066fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006701:	7e 8c                	jle    c000668f <do_exit+0x85>
c0006703:	90                   	nop
c0006704:	c9                   	leave  
c0006705:	c3                   	ret    

c0006706 <do_wait>:
c0006706:	55                   	push   %ebp
c0006707:	89 e5                	mov    %esp,%ebp
c0006709:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000670f:	8b 45 08             	mov    0x8(%ebp),%eax
c0006712:	8b 00                	mov    (%eax),%eax
c0006714:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006717:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000671e:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
c0006725:	eb 5f                	jmp    c0006786 <do_wait+0x80>
c0006727:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000672a:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006730:	05 60 35 08 c0       	add    $0xc0083560,%eax
c0006735:	8b 00                	mov    (%eax),%eax
c0006737:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000673a:	75 46                	jne    c0006782 <do_wait+0x7c>
c000673c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006740:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006743:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006749:	05 45 35 08 c0       	add    $0xc0083545,%eax
c000674e:	0f b6 00             	movzbl (%eax),%eax
c0006751:	3c 03                	cmp    $0x3,%al
c0006753:	75 2d                	jne    c0006782 <do_wait+0x7c>
c0006755:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006758:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000675e:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006763:	c6 00 fb             	movb   $0xfb,(%eax)
c0006766:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006769:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000676f:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006774:	83 ec 0c             	sub    $0xc,%esp
c0006777:	50                   	push   %eax
c0006778:	e8 53 00 00 00       	call   c00067d0 <cleanup>
c000677d:	83 c4 10             	add    $0x10,%esp
c0006780:	eb 4c                	jmp    c00067ce <do_wait+0xc8>
c0006782:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006786:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000678a:	7e 9b                	jle    c0006727 <do_wait+0x21>
c000678c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006790:	74 13                	je     c00067a5 <do_wait+0x9f>
c0006792:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006795:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000679b:	05 45 35 08 c0       	add    $0xc0083545,%eax
c00067a0:	c6 00 04             	movb   $0x4,(%eax)
c00067a3:	eb 29                	jmp    c00067ce <do_wait+0xc8>
c00067a5:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00067ac:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00067b3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00067ba:	83 ec 04             	sub    $0x4,%esp
c00067bd:	ff 75 ec             	pushl  -0x14(%ebp)
c00067c0:	8d 45 80             	lea    -0x80(%ebp),%eax
c00067c3:	50                   	push   %eax
c00067c4:	6a 01                	push   $0x1
c00067c6:	e8 c9 31 00 00       	call   c0009994 <send_rec>
c00067cb:	83 c4 10             	add    $0x10,%esp
c00067ce:	c9                   	leave  
c00067cf:	c3                   	ret    

c00067d0 <cleanup>:
c00067d0:	55                   	push   %ebp
c00067d1:	89 e5                	mov    %esp,%ebp
c00067d3:	83 ec 78             	sub    $0x78,%esp
c00067d6:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00067dd:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00067e4:	8b 45 08             	mov    0x8(%ebp),%eax
c00067e7:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00067ed:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00067f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00067f3:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c00067f9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00067fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00067ff:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0006805:	83 ec 04             	sub    $0x4,%esp
c0006808:	50                   	push   %eax
c0006809:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000680c:	50                   	push   %eax
c000680d:	6a 01                	push   $0x1
c000680f:	e8 80 31 00 00       	call   c0009994 <send_rec>
c0006814:	83 c4 10             	add    $0x10,%esp
c0006817:	8b 45 08             	mov    0x8(%ebp),%eax
c000681a:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c0006821:	90                   	nop
c0006822:	c9                   	leave  
c0006823:	c3                   	ret    

c0006824 <init_bitmap>:
c0006824:	55                   	push   %ebp
c0006825:	89 e5                	mov    %esp,%ebp
c0006827:	83 ec 08             	sub    $0x8,%esp
c000682a:	8b 45 08             	mov    0x8(%ebp),%eax
c000682d:	8b 50 04             	mov    0x4(%eax),%edx
c0006830:	8b 45 08             	mov    0x8(%ebp),%eax
c0006833:	8b 00                	mov    (%eax),%eax
c0006835:	83 ec 04             	sub    $0x4,%esp
c0006838:	52                   	push   %edx
c0006839:	6a 00                	push   $0x0
c000683b:	50                   	push   %eax
c000683c:	e8 62 46 00 00       	call   c000aea3 <Memset>
c0006841:	83 c4 10             	add    $0x10,%esp
c0006844:	90                   	nop
c0006845:	c9                   	leave  
c0006846:	c3                   	ret    

c0006847 <test_bit_val>:
c0006847:	55                   	push   %ebp
c0006848:	89 e5                	mov    %esp,%ebp
c000684a:	53                   	push   %ebx
c000684b:	83 ec 10             	sub    $0x10,%esp
c000684e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006851:	8d 50 07             	lea    0x7(%eax),%edx
c0006854:	85 c0                	test   %eax,%eax
c0006856:	0f 48 c2             	cmovs  %edx,%eax
c0006859:	c1 f8 03             	sar    $0x3,%eax
c000685c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000685f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006862:	99                   	cltd   
c0006863:	c1 ea 1d             	shr    $0x1d,%edx
c0006866:	01 d0                	add    %edx,%eax
c0006868:	83 e0 07             	and    $0x7,%eax
c000686b:	29 d0                	sub    %edx,%eax
c000686d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006870:	8b 45 08             	mov    0x8(%ebp),%eax
c0006873:	8b 10                	mov    (%eax),%edx
c0006875:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006878:	01 d0                	add    %edx,%eax
c000687a:	0f b6 00             	movzbl (%eax),%eax
c000687d:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006880:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006884:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006887:	bb 01 00 00 00       	mov    $0x1,%ebx
c000688c:	89 c1                	mov    %eax,%ecx
c000688e:	d3 e3                	shl    %cl,%ebx
c0006890:	89 d8                	mov    %ebx,%eax
c0006892:	21 c2                	and    %eax,%edx
c0006894:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006897:	89 c1                	mov    %eax,%ecx
c0006899:	d3 fa                	sar    %cl,%edx
c000689b:	89 d0                	mov    %edx,%eax
c000689d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00068a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00068a4:	0f 9f c0             	setg   %al
c00068a7:	0f b6 c0             	movzbl %al,%eax
c00068aa:	83 c4 10             	add    $0x10,%esp
c00068ad:	5b                   	pop    %ebx
c00068ae:	5d                   	pop    %ebp
c00068af:	c3                   	ret    

c00068b0 <set_bit_val>:
c00068b0:	55                   	push   %ebp
c00068b1:	89 e5                	mov    %esp,%ebp
c00068b3:	83 ec 10             	sub    $0x10,%esp
c00068b6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068b9:	8d 50 07             	lea    0x7(%eax),%edx
c00068bc:	85 c0                	test   %eax,%eax
c00068be:	0f 48 c2             	cmovs  %edx,%eax
c00068c1:	c1 f8 03             	sar    $0x3,%eax
c00068c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00068c7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068ca:	99                   	cltd   
c00068cb:	c1 ea 1d             	shr    $0x1d,%edx
c00068ce:	01 d0                	add    %edx,%eax
c00068d0:	83 e0 07             	and    $0x7,%eax
c00068d3:	29 d0                	sub    %edx,%eax
c00068d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00068d8:	8b 45 08             	mov    0x8(%ebp),%eax
c00068db:	8b 10                	mov    (%eax),%edx
c00068dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00068e0:	01 d0                	add    %edx,%eax
c00068e2:	0f b6 00             	movzbl (%eax),%eax
c00068e5:	88 45 ff             	mov    %al,-0x1(%ebp)
c00068e8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c00068ec:	7e 13                	jle    c0006901 <set_bit_val+0x51>
c00068ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00068f1:	ba 01 00 00 00       	mov    $0x1,%edx
c00068f6:	89 c1                	mov    %eax,%ecx
c00068f8:	d3 e2                	shl    %cl,%edx
c00068fa:	89 d0                	mov    %edx,%eax
c00068fc:	08 45 ff             	or     %al,-0x1(%ebp)
c00068ff:	eb 13                	jmp    c0006914 <set_bit_val+0x64>
c0006901:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006904:	ba 01 00 00 00       	mov    $0x1,%edx
c0006909:	89 c1                	mov    %eax,%ecx
c000690b:	d3 e2                	shl    %cl,%edx
c000690d:	89 d0                	mov    %edx,%eax
c000690f:	f7 d0                	not    %eax
c0006911:	20 45 ff             	and    %al,-0x1(%ebp)
c0006914:	8b 45 08             	mov    0x8(%ebp),%eax
c0006917:	8b 10                	mov    (%eax),%edx
c0006919:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000691c:	01 c2                	add    %eax,%edx
c000691e:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006922:	88 02                	mov    %al,(%edx)
c0006924:	b8 01 00 00 00       	mov    $0x1,%eax
c0006929:	c9                   	leave  
c000692a:	c3                   	ret    

c000692b <set_bits>:
c000692b:	55                   	push   %ebp
c000692c:	89 e5                	mov    %esp,%ebp
c000692e:	83 ec 10             	sub    $0x10,%esp
c0006931:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006938:	eb 1c                	jmp    c0006956 <set_bits+0x2b>
c000693a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000693d:	8d 50 01             	lea    0x1(%eax),%edx
c0006940:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006943:	ff 75 10             	pushl  0x10(%ebp)
c0006946:	50                   	push   %eax
c0006947:	ff 75 08             	pushl  0x8(%ebp)
c000694a:	e8 61 ff ff ff       	call   c00068b0 <set_bit_val>
c000694f:	83 c4 0c             	add    $0xc,%esp
c0006952:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006956:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006959:	3b 45 14             	cmp    0x14(%ebp),%eax
c000695c:	7c dc                	jl     c000693a <set_bits+0xf>
c000695e:	b8 01 00 00 00       	mov    $0x1,%eax
c0006963:	c9                   	leave  
c0006964:	c3                   	ret    

c0006965 <get_first_free_bit>:
c0006965:	55                   	push   %ebp
c0006966:	89 e5                	mov    %esp,%ebp
c0006968:	83 ec 10             	sub    $0x10,%esp
c000696b:	8b 45 08             	mov    0x8(%ebp),%eax
c000696e:	8b 40 04             	mov    0x4(%eax),%eax
c0006971:	c1 e0 03             	shl    $0x3,%eax
c0006974:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006977:	8b 45 0c             	mov    0xc(%ebp),%eax
c000697a:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000697d:	eb 1b                	jmp    c000699a <get_first_free_bit+0x35>
c000697f:	ff 75 fc             	pushl  -0x4(%ebp)
c0006982:	ff 75 08             	pushl  0x8(%ebp)
c0006985:	e8 bd fe ff ff       	call   c0006847 <test_bit_val>
c000698a:	83 c4 08             	add    $0x8,%esp
c000698d:	85 c0                	test   %eax,%eax
c000698f:	75 05                	jne    c0006996 <get_first_free_bit+0x31>
c0006991:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006994:	eb 11                	jmp    c00069a7 <get_first_free_bit+0x42>
c0006996:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c000699a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000699d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c00069a0:	7c dd                	jl     c000697f <get_first_free_bit+0x1a>
c00069a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00069a7:	c9                   	leave  
c00069a8:	c3                   	ret    

c00069a9 <get_bits>:
c00069a9:	55                   	push   %ebp
c00069aa:	89 e5                	mov    %esp,%ebp
c00069ac:	83 ec 20             	sub    $0x20,%esp
c00069af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00069b6:	ff 75 f0             	pushl  -0x10(%ebp)
c00069b9:	ff 75 08             	pushl  0x8(%ebp)
c00069bc:	e8 a4 ff ff ff       	call   c0006965 <get_first_free_bit>
c00069c1:	83 c4 08             	add    $0x8,%esp
c00069c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00069ca:	8b 40 04             	mov    0x4(%eax),%eax
c00069cd:	c1 e0 03             	shl    $0x3,%eax
c00069d0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00069d3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069d6:	83 e8 01             	sub    $0x1,%eax
c00069d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00069dc:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c00069e0:	75 08                	jne    c00069ea <get_bits+0x41>
c00069e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069e5:	e9 85 00 00 00       	jmp    c0006a6f <get_bits+0xc6>
c00069ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069ed:	83 c0 01             	add    $0x1,%eax
c00069f0:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069f9:	eb 58                	jmp    c0006a53 <get_bits+0xaa>
c00069fb:	ff 75 f8             	pushl  -0x8(%ebp)
c00069fe:	ff 75 08             	pushl  0x8(%ebp)
c0006a01:	e8 41 fe ff ff       	call   c0006847 <test_bit_val>
c0006a06:	83 c4 08             	add    $0x8,%esp
c0006a09:	85 c0                	test   %eax,%eax
c0006a0b:	75 0a                	jne    c0006a17 <get_bits+0x6e>
c0006a0d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006a11:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006a15:	eb 2b                	jmp    c0006a42 <get_bits+0x99>
c0006a17:	6a 00                	push   $0x0
c0006a19:	ff 75 08             	pushl  0x8(%ebp)
c0006a1c:	e8 44 ff ff ff       	call   c0006965 <get_first_free_bit>
c0006a21:	83 c4 08             	add    $0x8,%esp
c0006a24:	83 c0 01             	add    $0x1,%eax
c0006a27:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a2d:	83 c0 01             	add    $0x1,%eax
c0006a30:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a33:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a36:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a39:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a3c:	83 e8 01             	sub    $0x1,%eax
c0006a3f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a45:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006a48:	7c 09                	jl     c0006a53 <get_bits+0xaa>
c0006a4a:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006a51:	eb 0d                	jmp    c0006a60 <get_bits+0xb7>
c0006a53:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a56:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006a59:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006a5c:	85 c0                	test   %eax,%eax
c0006a5e:	7f 9b                	jg     c00069fb <get_bits+0x52>
c0006a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a63:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006a66:	83 c0 01             	add    $0x1,%eax
c0006a69:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a6c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a6f:	c9                   	leave  
c0006a70:	c3                   	ret    

c0006a71 <get_a_page2>:
c0006a71:	55                   	push   %ebp
c0006a72:	89 e5                	mov    %esp,%ebp
c0006a74:	83 ec 18             	sub    $0x18,%esp
c0006a77:	83 ec 0c             	sub    $0xc,%esp
c0006a7a:	ff 75 0c             	pushl  0xc(%ebp)
c0006a7d:	e8 1e 00 00 00       	call   c0006aa0 <get_a_page>
c0006a82:	83 c4 10             	add    $0x10,%esp
c0006a85:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a88:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006a8b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a8e:	83 ec 08             	sub    $0x8,%esp
c0006a91:	52                   	push   %edx
c0006a92:	50                   	push   %eax
c0006a93:	e8 61 01 00 00       	call   c0006bf9 <add_map_entry>
c0006a98:	83 c4 10             	add    $0x10,%esp
c0006a9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a9e:	c9                   	leave  
c0006a9f:	c3                   	ret    

c0006aa0 <get_a_page>:
c0006aa0:	55                   	push   %ebp
c0006aa1:	89 e5                	mov    %esp,%ebp
c0006aa3:	83 ec 20             	sub    $0x20,%esp
c0006aa6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006aaa:	75 22                	jne    c0006ace <get_a_page+0x2e>
c0006aac:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0006ab1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ab4:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c0006ab9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006abc:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0006ac1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ac4:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0006ac9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006acc:	eb 20                	jmp    c0006aee <get_a_page+0x4e>
c0006ace:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0006ad3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ad6:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0006adb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ade:	a1 cc 1e 01 c0       	mov    0xc0011ecc,%eax
c0006ae3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ae6:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0006aeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006aee:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006af1:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006af4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006af7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006afa:	6a 01                	push   $0x1
c0006afc:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006aff:	50                   	push   %eax
c0006b00:	e8 a4 fe ff ff       	call   c00069a9 <get_bits>
c0006b05:	83 c4 08             	add    $0x8,%esp
c0006b08:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b0e:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006b11:	c1 e2 0c             	shl    $0xc,%edx
c0006b14:	01 d0                	add    %edx,%eax
c0006b16:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b19:	6a 01                	push   $0x1
c0006b1b:	ff 75 fc             	pushl  -0x4(%ebp)
c0006b1e:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006b21:	50                   	push   %eax
c0006b22:	e8 89 fd ff ff       	call   c00068b0 <set_bit_val>
c0006b27:	83 c4 0c             	add    $0xc,%esp
c0006b2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b2d:	c9                   	leave  
c0006b2e:	c3                   	ret    

c0006b2f <get_virtual_address>:
c0006b2f:	55                   	push   %ebp
c0006b30:	89 e5                	mov    %esp,%ebp
c0006b32:	83 ec 28             	sub    $0x28,%esp
c0006b35:	e8 52 ad ff ff       	call   c000188c <get_running_thread_pcb>
c0006b3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b3d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006b41:	75 1a                	jne    c0006b5d <get_virtual_address+0x2e>
c0006b43:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0006b48:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006b4b:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0006b50:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006b53:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0006b58:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b5b:	eb 18                	jmp    c0006b75 <get_virtual_address+0x46>
c0006b5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b60:	8b 40 08             	mov    0x8(%eax),%eax
c0006b63:	83 ec 04             	sub    $0x4,%esp
c0006b66:	6a 0c                	push   $0xc
c0006b68:	50                   	push   %eax
c0006b69:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006b6c:	50                   	push   %eax
c0006b6d:	e8 03 43 00 00       	call   c000ae75 <Memcpy>
c0006b72:	83 c4 10             	add    $0x10,%esp
c0006b75:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006b78:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006b7b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006b7e:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006b81:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b84:	83 ec 08             	sub    $0x8,%esp
c0006b87:	50                   	push   %eax
c0006b88:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006b8b:	50                   	push   %eax
c0006b8c:	e8 18 fe ff ff       	call   c00069a9 <get_bits>
c0006b91:	83 c4 10             	add    $0x10,%esp
c0006b94:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006b97:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b9a:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006b9d:	c1 e2 0c             	shl    $0xc,%edx
c0006ba0:	01 d0                	add    %edx,%eax
c0006ba2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ba5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ba8:	50                   	push   %eax
c0006ba9:	6a 01                	push   $0x1
c0006bab:	ff 75 f0             	pushl  -0x10(%ebp)
c0006bae:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006bb1:	50                   	push   %eax
c0006bb2:	e8 74 fd ff ff       	call   c000692b <set_bits>
c0006bb7:	83 c4 10             	add    $0x10,%esp
c0006bba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006bbd:	c9                   	leave  
c0006bbe:	c3                   	ret    

c0006bbf <ptr_pde>:
c0006bbf:	55                   	push   %ebp
c0006bc0:	89 e5                	mov    %esp,%ebp
c0006bc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bc5:	c1 e8 16             	shr    $0x16,%eax
c0006bc8:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006bcd:	c1 e0 02             	shl    $0x2,%eax
c0006bd0:	5d                   	pop    %ebp
c0006bd1:	c3                   	ret    

c0006bd2 <ptr_pte>:
c0006bd2:	55                   	push   %ebp
c0006bd3:	89 e5                	mov    %esp,%ebp
c0006bd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bd8:	c1 e8 0a             	shr    $0xa,%eax
c0006bdb:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006be0:	89 c2                	mov    %eax,%edx
c0006be2:	8b 45 08             	mov    0x8(%ebp),%eax
c0006be5:	c1 e8 0c             	shr    $0xc,%eax
c0006be8:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006bed:	c1 e0 02             	shl    $0x2,%eax
c0006bf0:	01 d0                	add    %edx,%eax
c0006bf2:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006bf7:	5d                   	pop    %ebp
c0006bf8:	c3                   	ret    

c0006bf9 <add_map_entry>:
c0006bf9:	55                   	push   %ebp
c0006bfa:	89 e5                	mov    %esp,%ebp
c0006bfc:	83 ec 18             	sub    $0x18,%esp
c0006bff:	ff 75 08             	pushl  0x8(%ebp)
c0006c02:	e8 b8 ff ff ff       	call   c0006bbf <ptr_pde>
c0006c07:	83 c4 04             	add    $0x4,%esp
c0006c0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c0d:	ff 75 08             	pushl  0x8(%ebp)
c0006c10:	e8 bd ff ff ff       	call   c0006bd2 <ptr_pte>
c0006c15:	83 c4 04             	add    $0x4,%esp
c0006c18:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c1e:	8b 00                	mov    (%eax),%eax
c0006c20:	83 e0 01             	and    $0x1,%eax
c0006c23:	85 c0                	test   %eax,%eax
c0006c25:	74 1b                	je     c0006c42 <add_map_entry+0x49>
c0006c27:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c2a:	8b 00                	mov    (%eax),%eax
c0006c2c:	83 e0 01             	and    $0x1,%eax
c0006c2f:	85 c0                	test   %eax,%eax
c0006c31:	75 51                	jne    c0006c84 <add_map_entry+0x8b>
c0006c33:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c36:	83 c8 07             	or     $0x7,%eax
c0006c39:	89 c2                	mov    %eax,%edx
c0006c3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c3e:	89 10                	mov    %edx,(%eax)
c0006c40:	eb 42                	jmp    c0006c84 <add_map_entry+0x8b>
c0006c42:	6a 00                	push   $0x0
c0006c44:	e8 57 fe ff ff       	call   c0006aa0 <get_a_page>
c0006c49:	83 c4 04             	add    $0x4,%esp
c0006c4c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c52:	83 c8 07             	or     $0x7,%eax
c0006c55:	89 c2                	mov    %eax,%edx
c0006c57:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c5a:	89 10                	mov    %edx,(%eax)
c0006c5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c5f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006c64:	83 ec 04             	sub    $0x4,%esp
c0006c67:	68 00 10 00 00       	push   $0x1000
c0006c6c:	6a 00                	push   $0x0
c0006c6e:	50                   	push   %eax
c0006c6f:	e8 2f 42 00 00       	call   c000aea3 <Memset>
c0006c74:	83 c4 10             	add    $0x10,%esp
c0006c77:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c7a:	83 c8 07             	or     $0x7,%eax
c0006c7d:	89 c2                	mov    %eax,%edx
c0006c7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c82:	89 10                	mov    %edx,(%eax)
c0006c84:	90                   	nop
c0006c85:	c9                   	leave  
c0006c86:	c3                   	ret    

c0006c87 <alloc_virtual_memory>:
c0006c87:	55                   	push   %ebp
c0006c88:	89 e5                	mov    %esp,%ebp
c0006c8a:	83 ec 18             	sub    $0x18,%esp
c0006c8d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c90:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006c95:	c1 e8 0c             	shr    $0xc,%eax
c0006c98:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c9b:	e8 ec ab ff ff       	call   c000188c <get_running_thread_pcb>
c0006ca0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ca3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ca6:	8b 40 04             	mov    0x4(%eax),%eax
c0006ca9:	85 c0                	test   %eax,%eax
c0006cab:	75 09                	jne    c0006cb6 <alloc_virtual_memory+0x2f>
c0006cad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006cb4:	eb 07                	jmp    c0006cbd <alloc_virtual_memory+0x36>
c0006cb6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006cbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006cc0:	83 ec 08             	sub    $0x8,%esp
c0006cc3:	ff 75 f4             	pushl  -0xc(%ebp)
c0006cc6:	50                   	push   %eax
c0006cc7:	e8 63 fe ff ff       	call   c0006b2f <get_virtual_address>
c0006ccc:	83 c4 10             	add    $0x10,%esp
c0006ccf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006cd2:	83 ec 08             	sub    $0x8,%esp
c0006cd5:	ff 75 08             	pushl  0x8(%ebp)
c0006cd8:	ff 75 e8             	pushl  -0x18(%ebp)
c0006cdb:	e8 19 ff ff ff       	call   c0006bf9 <add_map_entry>
c0006ce0:	83 c4 10             	add    $0x10,%esp
c0006ce3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ce6:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006ceb:	89 c2                	mov    %eax,%edx
c0006ced:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006cf0:	01 d0                	add    %edx,%eax
c0006cf2:	c9                   	leave  
c0006cf3:	c3                   	ret    

c0006cf4 <get_physical_address>:
c0006cf4:	55                   	push   %ebp
c0006cf5:	89 e5                	mov    %esp,%ebp
c0006cf7:	83 ec 10             	sub    $0x10,%esp
c0006cfa:	ff 75 08             	pushl  0x8(%ebp)
c0006cfd:	e8 d0 fe ff ff       	call   c0006bd2 <ptr_pte>
c0006d02:	83 c4 04             	add    $0x4,%esp
c0006d05:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006d08:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d0b:	8b 00                	mov    (%eax),%eax
c0006d0d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006d12:	89 c2                	mov    %eax,%edx
c0006d14:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d17:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006d1c:	09 d0                	or     %edx,%eax
c0006d1e:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d21:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006d24:	c9                   	leave  
c0006d25:	c3                   	ret    

c0006d26 <alloc_memory>:
c0006d26:	55                   	push   %ebp
c0006d27:	89 e5                	mov    %esp,%ebp
c0006d29:	83 ec 18             	sub    $0x18,%esp
c0006d2c:	83 ec 08             	sub    $0x8,%esp
c0006d2f:	ff 75 0c             	pushl  0xc(%ebp)
c0006d32:	ff 75 08             	pushl  0x8(%ebp)
c0006d35:	e8 f5 fd ff ff       	call   c0006b2f <get_virtual_address>
c0006d3a:	83 c4 10             	add    $0x10,%esp
c0006d3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d40:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d43:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006d48:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d4b:	eb 29                	jmp    c0006d76 <alloc_memory+0x50>
c0006d4d:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006d54:	83 ec 0c             	sub    $0xc,%esp
c0006d57:	ff 75 0c             	pushl  0xc(%ebp)
c0006d5a:	e8 41 fd ff ff       	call   c0006aa0 <get_a_page>
c0006d5f:	83 c4 10             	add    $0x10,%esp
c0006d62:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d65:	83 ec 08             	sub    $0x8,%esp
c0006d68:	ff 75 ec             	pushl  -0x14(%ebp)
c0006d6b:	ff 75 f4             	pushl  -0xc(%ebp)
c0006d6e:	e8 86 fe ff ff       	call   c0006bf9 <add_map_entry>
c0006d73:	83 c4 10             	add    $0x10,%esp
c0006d76:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d79:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006d7c:	89 55 08             	mov    %edx,0x8(%ebp)
c0006d7f:	85 c0                	test   %eax,%eax
c0006d81:	75 ca                	jne    c0006d4d <alloc_memory+0x27>
c0006d83:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d86:	c9                   	leave  
c0006d87:	c3                   	ret    

c0006d88 <get_a_virtual_page>:
c0006d88:	55                   	push   %ebp
c0006d89:	89 e5                	mov    %esp,%ebp
c0006d8b:	83 ec 18             	sub    $0x18,%esp
c0006d8e:	ff 75 08             	pushl  0x8(%ebp)
c0006d91:	e8 0a fd ff ff       	call   c0006aa0 <get_a_page>
c0006d96:	83 c4 04             	add    $0x4,%esp
c0006d99:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d9c:	83 ec 08             	sub    $0x8,%esp
c0006d9f:	ff 75 f4             	pushl  -0xc(%ebp)
c0006da2:	ff 75 0c             	pushl  0xc(%ebp)
c0006da5:	e8 4f fe ff ff       	call   c0006bf9 <add_map_entry>
c0006daa:	83 c4 10             	add    $0x10,%esp
c0006dad:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006db0:	c9                   	leave  
c0006db1:	c3                   	ret    

c0006db2 <block2arena>:
c0006db2:	55                   	push   %ebp
c0006db3:	89 e5                	mov    %esp,%ebp
c0006db5:	83 ec 10             	sub    $0x10,%esp
c0006db8:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dbb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006dc0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006dc3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006dc6:	c9                   	leave  
c0006dc7:	c3                   	ret    

c0006dc8 <sys_malloc>:
c0006dc8:	55                   	push   %ebp
c0006dc9:	89 e5                	mov    %esp,%ebp
c0006dcb:	83 ec 58             	sub    $0x58,%esp
c0006dce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006dd5:	e8 b2 aa ff ff       	call   c000188c <get_running_thread_pcb>
c0006dda:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006ddd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006de0:	8b 40 04             	mov    0x4(%eax),%eax
c0006de3:	85 c0                	test   %eax,%eax
c0006de5:	75 10                	jne    c0006df7 <sys_malloc+0x2f>
c0006de7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006dee:	c7 45 ec 00 32 08 c0 	movl   $0xc0083200,-0x14(%ebp)
c0006df5:	eb 10                	jmp    c0006e07 <sys_malloc+0x3f>
c0006df7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006dfe:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006e01:	83 c0 0c             	add    $0xc,%eax
c0006e04:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e07:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0006e0e:	76 50                	jbe    c0006e60 <sys_malloc+0x98>
c0006e10:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e13:	05 0b 10 00 00       	add    $0x100b,%eax
c0006e18:	c1 e8 0c             	shr    $0xc,%eax
c0006e1b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006e1e:	83 ec 08             	sub    $0x8,%esp
c0006e21:	ff 75 f0             	pushl  -0x10(%ebp)
c0006e24:	ff 75 d8             	pushl  -0x28(%ebp)
c0006e27:	e8 fa fe ff ff       	call   c0006d26 <alloc_memory>
c0006e2c:	83 c4 10             	add    $0x10,%esp
c0006e2f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006e32:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006e35:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006e38:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e3b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0006e41:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e44:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0006e4b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e4e:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0006e52:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e55:	83 c0 0c             	add    $0xc,%eax
c0006e58:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e5b:	e9 7a 01 00 00       	jmp    c0006fda <sys_malloc+0x212>
c0006e60:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006e67:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006e6e:	eb 26                	jmp    c0006e96 <sys_malloc+0xce>
c0006e70:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006e73:	89 d0                	mov    %edx,%eax
c0006e75:	01 c0                	add    %eax,%eax
c0006e77:	01 d0                	add    %edx,%eax
c0006e79:	c1 e0 03             	shl    $0x3,%eax
c0006e7c:	89 c2                	mov    %eax,%edx
c0006e7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e81:	01 d0                	add    %edx,%eax
c0006e83:	8b 00                	mov    (%eax),%eax
c0006e85:	39 45 08             	cmp    %eax,0x8(%ebp)
c0006e88:	77 08                	ja     c0006e92 <sys_malloc+0xca>
c0006e8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006e8d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e90:	eb 0a                	jmp    c0006e9c <sys_malloc+0xd4>
c0006e92:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006e96:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0006e9a:	7e d4                	jle    c0006e70 <sys_malloc+0xa8>
c0006e9c:	83 ec 08             	sub    $0x8,%esp
c0006e9f:	ff 75 f0             	pushl  -0x10(%ebp)
c0006ea2:	6a 01                	push   $0x1
c0006ea4:	e8 7d fe ff ff       	call   c0006d26 <alloc_memory>
c0006ea9:	83 c4 10             	add    $0x10,%esp
c0006eac:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006eaf:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006eb2:	89 d0                	mov    %edx,%eax
c0006eb4:	01 c0                	add    %eax,%eax
c0006eb6:	01 d0                	add    %edx,%eax
c0006eb8:	c1 e0 03             	shl    $0x3,%eax
c0006ebb:	89 c2                	mov    %eax,%edx
c0006ebd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ec0:	01 d0                	add    %edx,%eax
c0006ec2:	83 ec 04             	sub    $0x4,%esp
c0006ec5:	6a 18                	push   $0x18
c0006ec7:	50                   	push   %eax
c0006ec8:	ff 75 cc             	pushl  -0x34(%ebp)
c0006ecb:	e8 a5 3f 00 00       	call   c000ae75 <Memcpy>
c0006ed0:	83 c4 10             	add    $0x10,%esp
c0006ed3:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006ed6:	89 d0                	mov    %edx,%eax
c0006ed8:	01 c0                	add    %eax,%eax
c0006eda:	01 d0                	add    %edx,%eax
c0006edc:	c1 e0 03             	shl    $0x3,%eax
c0006edf:	89 c2                	mov    %eax,%edx
c0006ee1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ee4:	01 d0                	add    %edx,%eax
c0006ee6:	83 c0 08             	add    $0x8,%eax
c0006ee9:	83 ec 0c             	sub    $0xc,%esp
c0006eec:	50                   	push   %eax
c0006eed:	e8 51 31 00 00       	call   c000a043 <isListEmpty>
c0006ef2:	83 c4 10             	add    $0x10,%esp
c0006ef5:	3c 01                	cmp    $0x1,%al
c0006ef7:	0f 85 91 00 00 00    	jne    c0006f8e <sys_malloc+0x1c6>
c0006efd:	83 ec 08             	sub    $0x8,%esp
c0006f00:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f03:	6a 01                	push   $0x1
c0006f05:	e8 1c fe ff ff       	call   c0006d26 <alloc_memory>
c0006f0a:	83 c4 10             	add    $0x10,%esp
c0006f0d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006f10:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006f13:	8b 00                	mov    (%eax),%eax
c0006f15:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006f18:	c7 45 c0 0c 00 00 00 	movl   $0xc,-0x40(%ebp)
c0006f1f:	b8 00 10 00 00       	mov    $0x1000,%eax
c0006f24:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0006f27:	ba 00 00 00 00       	mov    $0x0,%edx
c0006f2c:	f7 75 c4             	divl   -0x3c(%ebp)
c0006f2f:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006f32:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0006f35:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006f38:	01 d0                	add    %edx,%eax
c0006f3a:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0006f3d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006f44:	eb 3b                	jmp    c0006f81 <sys_malloc+0x1b9>
c0006f46:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006f49:	0f af 45 c4          	imul   -0x3c(%ebp),%eax
c0006f4d:	89 c2                	mov    %eax,%edx
c0006f4f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006f52:	01 d0                	add    %edx,%eax
c0006f54:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006f57:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0006f5a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006f5d:	89 d0                	mov    %edx,%eax
c0006f5f:	01 c0                	add    %eax,%eax
c0006f61:	01 d0                	add    %edx,%eax
c0006f63:	c1 e0 03             	shl    $0x3,%eax
c0006f66:	89 c2                	mov    %eax,%edx
c0006f68:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f6b:	01 d0                	add    %edx,%eax
c0006f6d:	83 c0 08             	add    $0x8,%eax
c0006f70:	83 ec 08             	sub    $0x8,%esp
c0006f73:	51                   	push   %ecx
c0006f74:	50                   	push   %eax
c0006f75:	e8 ea 30 00 00       	call   c000a064 <appendToDoubleLinkList>
c0006f7a:	83 c4 10             	add    $0x10,%esp
c0006f7d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0006f81:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0006f84:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006f87:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006f8a:	39 c2                	cmp    %eax,%edx
c0006f8c:	77 b8                	ja     c0006f46 <sys_malloc+0x17e>
c0006f8e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006f91:	89 d0                	mov    %edx,%eax
c0006f93:	01 c0                	add    %eax,%eax
c0006f95:	01 d0                	add    %edx,%eax
c0006f97:	c1 e0 03             	shl    $0x3,%eax
c0006f9a:	89 c2                	mov    %eax,%edx
c0006f9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f9f:	01 d0                	add    %edx,%eax
c0006fa1:	83 c0 08             	add    $0x8,%eax
c0006fa4:	83 ec 0c             	sub    $0xc,%esp
c0006fa7:	50                   	push   %eax
c0006fa8:	e8 3d 31 00 00       	call   c000a0ea <popFromDoubleLinkList>
c0006fad:	83 c4 10             	add    $0x10,%esp
c0006fb0:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006fb3:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006fb6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006fb9:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006fbc:	83 ec 0c             	sub    $0xc,%esp
c0006fbf:	50                   	push   %eax
c0006fc0:	e8 ed fd ff ff       	call   c0006db2 <block2arena>
c0006fc5:	83 c4 10             	add    $0x10,%esp
c0006fc8:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006fcb:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006fce:	8b 40 04             	mov    0x4(%eax),%eax
c0006fd1:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006fd4:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006fd7:	89 50 04             	mov    %edx,0x4(%eax)
c0006fda:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006fdd:	c9                   	leave  
c0006fde:	c3                   	ret    

c0006fdf <remove_map_entry>:
c0006fdf:	55                   	push   %ebp
c0006fe0:	89 e5                	mov    %esp,%ebp
c0006fe2:	83 ec 10             	sub    $0x10,%esp
c0006fe5:	ff 75 08             	pushl  0x8(%ebp)
c0006fe8:	e8 e5 fb ff ff       	call   c0006bd2 <ptr_pte>
c0006fed:	83 c4 04             	add    $0x4,%esp
c0006ff0:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ff3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ff6:	8b 10                	mov    (%eax),%edx
c0006ff8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ffb:	89 10                	mov    %edx,(%eax)
c0006ffd:	90                   	nop
c0006ffe:	c9                   	leave  
c0006fff:	c3                   	ret    

c0007000 <free_a_page>:
c0007000:	55                   	push   %ebp
c0007001:	89 e5                	mov    %esp,%ebp
c0007003:	83 ec 20             	sub    $0x20,%esp
c0007006:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000700a:	75 21                	jne    c000702d <free_a_page+0x2d>
c000700c:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0007011:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007014:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0007019:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000701c:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0007021:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007024:	c7 45 fc 8c 16 01 c0 	movl   $0xc001168c,-0x4(%ebp)
c000702b:	eb 1f                	jmp    c000704c <free_a_page+0x4c>
c000702d:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0007032:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007035:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c000703a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000703d:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0007042:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007045:	c7 45 fc c4 1e 01 c0 	movl   $0xc0011ec4,-0x4(%ebp)
c000704c:	8b 45 08             	mov    0x8(%ebp),%eax
c000704f:	c1 e8 0c             	shr    $0xc,%eax
c0007052:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007055:	6a 00                	push   $0x0
c0007057:	ff 75 f8             	pushl  -0x8(%ebp)
c000705a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000705d:	50                   	push   %eax
c000705e:	e8 4d f8 ff ff       	call   c00068b0 <set_bit_val>
c0007063:	83 c4 0c             	add    $0xc,%esp
c0007066:	ff 75 08             	pushl  0x8(%ebp)
c0007069:	e8 86 fc ff ff       	call   c0006cf4 <get_physical_address>
c000706e:	83 c4 04             	add    $0x4,%esp
c0007071:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007074:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007077:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000707d:	85 c0                	test   %eax,%eax
c000707f:	0f 48 c2             	cmovs  %edx,%eax
c0007082:	c1 f8 0c             	sar    $0xc,%eax
c0007085:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007088:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000708b:	6a 00                	push   $0x0
c000708d:	ff 75 f0             	pushl  -0x10(%ebp)
c0007090:	50                   	push   %eax
c0007091:	e8 1a f8 ff ff       	call   c00068b0 <set_bit_val>
c0007096:	83 c4 0c             	add    $0xc,%esp
c0007099:	ff 75 08             	pushl  0x8(%ebp)
c000709c:	e8 3e ff ff ff       	call   c0006fdf <remove_map_entry>
c00070a1:	83 c4 04             	add    $0x4,%esp
c00070a4:	90                   	nop
c00070a5:	c9                   	leave  
c00070a6:	c3                   	ret    

c00070a7 <sys_free>:
c00070a7:	55                   	push   %ebp
c00070a8:	89 e5                	mov    %esp,%ebp
c00070aa:	83 ec 48             	sub    $0x48,%esp
c00070ad:	e8 da a7 ff ff       	call   c000188c <get_running_thread_pcb>
c00070b2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00070b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00070b8:	8b 40 04             	mov    0x4(%eax),%eax
c00070bb:	85 c0                	test   %eax,%eax
c00070bd:	75 09                	jne    c00070c8 <sys_free+0x21>
c00070bf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00070c6:	eb 07                	jmp    c00070cf <sys_free+0x28>
c00070c8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00070cf:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c00070d6:	76 4d                	jbe    c0007125 <sys_free+0x7e>
c00070d8:	8b 45 08             	mov    0x8(%ebp),%eax
c00070db:	83 e8 0c             	sub    $0xc,%eax
c00070de:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070e1:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c00070e5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070e8:	05 ff 0f 00 00       	add    $0xfff,%eax
c00070ed:	c1 e8 0c             	shr    $0xc,%eax
c00070f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00070f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00070fa:	eb 1c                	jmp    c0007118 <sys_free+0x71>
c00070fc:	83 ec 08             	sub    $0x8,%esp
c00070ff:	ff 75 f4             	pushl  -0xc(%ebp)
c0007102:	ff 75 f0             	pushl  -0x10(%ebp)
c0007105:	e8 f6 fe ff ff       	call   c0007000 <free_a_page>
c000710a:	83 c4 10             	add    $0x10,%esp
c000710d:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
c0007114:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007118:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000711b:	39 45 d8             	cmp    %eax,-0x28(%ebp)
c000711e:	77 dc                	ja     c00070fc <sys_free+0x55>
c0007120:	e9 ef 00 00 00       	jmp    c0007214 <sys_free+0x16d>
c0007125:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000712c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007133:	eb 24                	jmp    c0007159 <sys_free+0xb2>
c0007135:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007138:	89 d0                	mov    %edx,%eax
c000713a:	01 c0                	add    %eax,%eax
c000713c:	01 d0                	add    %edx,%eax
c000713e:	c1 e0 03             	shl    $0x3,%eax
c0007141:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0007146:	8b 00                	mov    (%eax),%eax
c0007148:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000714b:	77 08                	ja     c0007155 <sys_free+0xae>
c000714d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007150:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007153:	eb 0a                	jmp    c000715f <sys_free+0xb8>
c0007155:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007159:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c000715d:	7e d6                	jle    c0007135 <sys_free+0x8e>
c000715f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007162:	89 d0                	mov    %edx,%eax
c0007164:	01 c0                	add    %eax,%eax
c0007166:	01 d0                	add    %edx,%eax
c0007168:	c1 e0 03             	shl    $0x3,%eax
c000716b:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0007170:	8b 10                	mov    (%eax),%edx
c0007172:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0007175:	8b 50 04             	mov    0x4(%eax),%edx
c0007178:	89 55 bc             	mov    %edx,-0x44(%ebp)
c000717b:	8b 50 08             	mov    0x8(%eax),%edx
c000717e:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0007181:	8b 50 0c             	mov    0xc(%eax),%edx
c0007184:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0007187:	8b 50 10             	mov    0x10(%eax),%edx
c000718a:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000718d:	8b 40 14             	mov    0x14(%eax),%eax
c0007190:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007193:	8b 45 08             	mov    0x8(%ebp),%eax
c0007196:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007199:	83 ec 0c             	sub    $0xc,%esp
c000719c:	ff 75 d4             	pushl  -0x2c(%ebp)
c000719f:	e8 0e fc ff ff       	call   c0006db2 <block2arena>
c00071a4:	83 c4 10             	add    $0x10,%esp
c00071a7:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00071aa:	83 ec 08             	sub    $0x8,%esp
c00071ad:	ff 75 d4             	pushl  -0x2c(%ebp)
c00071b0:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00071b3:	83 c0 08             	add    $0x8,%eax
c00071b6:	50                   	push   %eax
c00071b7:	e8 a8 2e 00 00       	call   c000a064 <appendToDoubleLinkList>
c00071bc:	83 c4 10             	add    $0x10,%esp
c00071bf:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071c2:	8b 40 04             	mov    0x4(%eax),%eax
c00071c5:	8d 50 01             	lea    0x1(%eax),%edx
c00071c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071cb:	89 50 04             	mov    %edx,0x4(%eax)
c00071ce:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071d1:	8b 50 04             	mov    0x4(%eax),%edx
c00071d4:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00071d7:	39 c2                	cmp    %eax,%edx
c00071d9:	75 39                	jne    c0007214 <sys_free+0x16d>
c00071db:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00071e2:	eb 16                	jmp    c00071fa <sys_free+0x153>
c00071e4:	83 ec 0c             	sub    $0xc,%esp
c00071e7:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00071ea:	83 c0 08             	add    $0x8,%eax
c00071ed:	50                   	push   %eax
c00071ee:	e8 f7 2e 00 00       	call   c000a0ea <popFromDoubleLinkList>
c00071f3:	83 c4 10             	add    $0x10,%esp
c00071f6:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00071fa:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00071fd:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0007200:	7c e2                	jl     c00071e4 <sys_free+0x13d>
c0007202:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007205:	83 ec 08             	sub    $0x8,%esp
c0007208:	ff 75 f4             	pushl  -0xc(%ebp)
c000720b:	50                   	push   %eax
c000720c:	e8 ef fd ff ff       	call   c0007000 <free_a_page>
c0007211:	83 c4 10             	add    $0x10,%esp
c0007214:	90                   	nop
c0007215:	c9                   	leave  
c0007216:	c3                   	ret    

c0007217 <init_memory_block_desc>:
c0007217:	55                   	push   %ebp
c0007218:	89 e5                	mov    %esp,%ebp
c000721a:	83 ec 18             	sub    $0x18,%esp
c000721d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007224:	e9 b2 00 00 00       	jmp    c00072db <init_memory_block_desc+0xc4>
c0007229:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000722d:	75 1b                	jne    c000724a <init_memory_block_desc+0x33>
c000722f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007232:	89 d0                	mov    %edx,%eax
c0007234:	01 c0                	add    %eax,%eax
c0007236:	01 d0                	add    %edx,%eax
c0007238:	c1 e0 03             	shl    $0x3,%eax
c000723b:	89 c2                	mov    %eax,%edx
c000723d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007240:	01 d0                	add    %edx,%eax
c0007242:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0007248:	eb 2e                	jmp    c0007278 <init_memory_block_desc+0x61>
c000724a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000724d:	89 d0                	mov    %edx,%eax
c000724f:	01 c0                	add    %eax,%eax
c0007251:	01 d0                	add    %edx,%eax
c0007253:	c1 e0 03             	shl    $0x3,%eax
c0007256:	8d 50 e8             	lea    -0x18(%eax),%edx
c0007259:	8b 45 08             	mov    0x8(%ebp),%eax
c000725c:	01 d0                	add    %edx,%eax
c000725e:	8b 08                	mov    (%eax),%ecx
c0007260:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007263:	89 d0                	mov    %edx,%eax
c0007265:	01 c0                	add    %eax,%eax
c0007267:	01 d0                	add    %edx,%eax
c0007269:	c1 e0 03             	shl    $0x3,%eax
c000726c:	89 c2                	mov    %eax,%edx
c000726e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007271:	01 d0                	add    %edx,%eax
c0007273:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007276:	89 10                	mov    %edx,(%eax)
c0007278:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000727b:	89 d0                	mov    %edx,%eax
c000727d:	01 c0                	add    %eax,%eax
c000727f:	01 d0                	add    %edx,%eax
c0007281:	c1 e0 03             	shl    $0x3,%eax
c0007284:	89 c2                	mov    %eax,%edx
c0007286:	8b 45 08             	mov    0x8(%ebp),%eax
c0007289:	01 d0                	add    %edx,%eax
c000728b:	8b 00                	mov    (%eax),%eax
c000728d:	89 c1                	mov    %eax,%ecx
c000728f:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0007294:	ba 00 00 00 00       	mov    $0x0,%edx
c0007299:	f7 f1                	div    %ecx
c000729b:	89 c1                	mov    %eax,%ecx
c000729d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00072a0:	89 d0                	mov    %edx,%eax
c00072a2:	01 c0                	add    %eax,%eax
c00072a4:	01 d0                	add    %edx,%eax
c00072a6:	c1 e0 03             	shl    $0x3,%eax
c00072a9:	89 c2                	mov    %eax,%edx
c00072ab:	8b 45 08             	mov    0x8(%ebp),%eax
c00072ae:	01 d0                	add    %edx,%eax
c00072b0:	89 ca                	mov    %ecx,%edx
c00072b2:	89 50 04             	mov    %edx,0x4(%eax)
c00072b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00072b8:	89 d0                	mov    %edx,%eax
c00072ba:	01 c0                	add    %eax,%eax
c00072bc:	01 d0                	add    %edx,%eax
c00072be:	c1 e0 03             	shl    $0x3,%eax
c00072c1:	89 c2                	mov    %eax,%edx
c00072c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00072c6:	01 d0                	add    %edx,%eax
c00072c8:	83 c0 08             	add    $0x8,%eax
c00072cb:	83 ec 0c             	sub    $0xc,%esp
c00072ce:	50                   	push   %eax
c00072cf:	e8 41 2d 00 00       	call   c000a015 <initDoubleLinkList>
c00072d4:	83 c4 10             	add    $0x10,%esp
c00072d7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00072db:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00072df:	0f 8e 44 ff ff ff    	jle    c0007229 <init_memory_block_desc+0x12>
c00072e5:	90                   	nop
c00072e6:	c9                   	leave  
c00072e7:	c3                   	ret    

c00072e8 <init_memory2>:
c00072e8:	55                   	push   %ebp
c00072e9:	89 e5                	mov    %esp,%ebp
c00072eb:	83 ec 38             	sub    $0x38,%esp
c00072ee:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00072f5:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00072fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00072ff:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c0007304:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007307:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c000730c:	29 c2                	sub    %eax,%edx
c000730e:	89 d0                	mov    %edx,%eax
c0007310:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007313:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007316:	89 c2                	mov    %eax,%edx
c0007318:	c1 ea 1f             	shr    $0x1f,%edx
c000731b:	01 d0                	add    %edx,%eax
c000731d:	d1 f8                	sar    %eax
c000731f:	a3 98 16 01 c0       	mov    %eax,0xc0011698
c0007324:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0007329:	83 ec 0c             	sub    $0xc,%esp
c000732c:	50                   	push   %eax
c000732d:	e8 0f 06 00 00       	call   c0007941 <disp_int>
c0007332:	83 c4 10             	add    $0x10,%esp
c0007335:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000733a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000733d:	29 c2                	sub    %eax,%edx
c000733f:	89 d0                	mov    %edx,%eax
c0007341:	a3 d0 1e 01 c0       	mov    %eax,0xc0011ed0
c0007346:	83 ec 0c             	sub    $0xc,%esp
c0007349:	68 5b a7 00 c0       	push   $0xc000a75b
c000734e:	e8 39 a2 ff ff       	call   c000158c <disp_str>
c0007353:	83 c4 10             	add    $0x10,%esp
c0007356:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c000735b:	83 ec 0c             	sub    $0xc,%esp
c000735e:	50                   	push   %eax
c000735f:	e8 dd 05 00 00       	call   c0007941 <disp_int>
c0007364:	83 c4 10             	add    $0x10,%esp
c0007367:	83 ec 0c             	sub    $0xc,%esp
c000736a:	68 5b a7 00 c0       	push   $0xc000a75b
c000736f:	e8 18 a2 ff ff       	call   c000158c <disp_str>
c0007374:	83 c4 10             	add    $0x10,%esp
c0007377:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000737c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007381:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007387:	85 c0                	test   %eax,%eax
c0007389:	0f 48 c2             	cmovs  %edx,%eax
c000738c:	c1 f8 0c             	sar    $0xc,%eax
c000738f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007392:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007395:	83 c0 07             	add    $0x7,%eax
c0007398:	8d 50 07             	lea    0x7(%eax),%edx
c000739b:	85 c0                	test   %eax,%eax
c000739d:	0f 48 c2             	cmovs  %edx,%eax
c00073a0:	c1 f8 03             	sar    $0x3,%eax
c00073a3:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c00073a8:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00073ad:	2d 00 00 00 40       	sub    $0x40000000,%eax
c00073b2:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c00073b7:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00073bd:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c00073c2:	83 ec 04             	sub    $0x4,%esp
c00073c5:	52                   	push   %edx
c00073c6:	6a 00                	push   $0x0
c00073c8:	50                   	push   %eax
c00073c9:	e8 d5 3a 00 00       	call   c000aea3 <Memset>
c00073ce:	83 c4 10             	add    $0x10,%esp
c00073d1:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c00073d6:	05 ff 0f 00 00       	add    $0xfff,%eax
c00073db:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00073e1:	85 c0                	test   %eax,%eax
c00073e3:	0f 48 c2             	cmovs  %edx,%eax
c00073e6:	c1 f8 0c             	sar    $0xc,%eax
c00073e9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00073ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00073ef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00073f2:	ff 75 e8             	pushl  -0x18(%ebp)
c00073f5:	6a 01                	push   $0x1
c00073f7:	6a 00                	push   $0x0
c00073f9:	68 8c 16 01 c0       	push   $0xc001168c
c00073fe:	e8 28 f5 ff ff       	call   c000692b <set_bits>
c0007403:	83 c4 10             	add    $0x10,%esp
c0007406:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c000740b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007410:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007416:	85 c0                	test   %eax,%eax
c0007418:	0f 48 c2             	cmovs  %edx,%eax
c000741b:	c1 f8 0c             	sar    $0xc,%eax
c000741e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007421:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007424:	83 c0 07             	add    $0x7,%eax
c0007427:	8d 50 07             	lea    0x7(%eax),%edx
c000742a:	85 c0                	test   %eax,%eax
c000742c:	0f 48 c2             	cmovs  %edx,%eax
c000742f:	c1 f8 03             	sar    $0x3,%eax
c0007432:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c0007437:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c000743c:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c0007442:	01 d0                	add    %edx,%eax
c0007444:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c0007449:	8b 15 c8 1e 01 c0    	mov    0xc0011ec8,%edx
c000744f:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0007454:	83 ec 04             	sub    $0x4,%esp
c0007457:	52                   	push   %edx
c0007458:	6a 00                	push   $0x0
c000745a:	50                   	push   %eax
c000745b:	e8 43 3a 00 00       	call   c000aea3 <Memset>
c0007460:	83 c4 10             	add    $0x10,%esp
c0007463:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0007468:	05 ff 0f 00 00       	add    $0xfff,%eax
c000746d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007473:	85 c0                	test   %eax,%eax
c0007475:	0f 48 c2             	cmovs  %edx,%eax
c0007478:	c1 f8 0c             	sar    $0xc,%eax
c000747b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000747e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007481:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007484:	ff 75 e8             	pushl  -0x18(%ebp)
c0007487:	6a 01                	push   $0x1
c0007489:	ff 75 e0             	pushl  -0x20(%ebp)
c000748c:	68 8c 16 01 c0       	push   $0xc001168c
c0007491:	e8 95 f4 ff ff       	call   c000692b <set_bits>
c0007496:	83 c4 10             	add    $0x10,%esp
c0007499:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c00074a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00074a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00074a6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074a9:	83 c0 07             	add    $0x7,%eax
c00074ac:	8d 50 07             	lea    0x7(%eax),%edx
c00074af:	85 c0                	test   %eax,%eax
c00074b1:	0f 48 c2             	cmovs  %edx,%eax
c00074b4:	c1 f8 03             	sar    $0x3,%eax
c00074b7:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c00074bc:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00074c1:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00074c7:	01 c2                	add    %eax,%edx
c00074c9:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c00074ce:	01 d0                	add    %edx,%eax
c00074d0:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c00074d5:	8b 15 38 f7 00 c0    	mov    0xc000f738,%edx
c00074db:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c00074e0:	83 ec 04             	sub    $0x4,%esp
c00074e3:	52                   	push   %edx
c00074e4:	6a 00                	push   $0x0
c00074e6:	50                   	push   %eax
c00074e7:	e8 b7 39 00 00       	call   c000aea3 <Memset>
c00074ec:	83 c4 10             	add    $0x10,%esp
c00074ef:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00074f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00074f5:	01 d0                	add    %edx,%eax
c00074f7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00074fa:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c00074ff:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007504:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000750a:	85 c0                	test   %eax,%eax
c000750c:	0f 48 c2             	cmovs  %edx,%eax
c000750f:	c1 f8 0c             	sar    $0xc,%eax
c0007512:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007515:	ff 75 e8             	pushl  -0x18(%ebp)
c0007518:	6a 01                	push   $0x1
c000751a:	ff 75 e0             	pushl  -0x20(%ebp)
c000751d:	68 8c 16 01 c0       	push   $0xc001168c
c0007522:	e8 04 f4 ff ff       	call   c000692b <set_bits>
c0007527:	83 c4 10             	add    $0x10,%esp
c000752a:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000752d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007530:	01 d0                	add    %edx,%eax
c0007532:	c1 e0 0c             	shl    $0xc,%eax
c0007535:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c000753a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000753d:	83 c0 02             	add    $0x2,%eax
c0007540:	c1 e0 0c             	shl    $0xc,%eax
c0007543:	89 c2                	mov    %eax,%edx
c0007545:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007548:	01 d0                	add    %edx,%eax
c000754a:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c000754f:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007556:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007559:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000755c:	90                   	nop
c000755d:	c9                   	leave  
c000755e:	c3                   	ret    

c000755f <init_memory>:
c000755f:	55                   	push   %ebp
c0007560:	89 e5                	mov    %esp,%ebp
c0007562:	83 ec 38             	sub    $0x38,%esp
c0007565:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c000756c:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007573:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c000757a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000757d:	05 00 00 10 00       	add    $0x100000,%eax
c0007582:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007585:	8b 45 08             	mov    0x8(%ebp),%eax
c0007588:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000758b:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007591:	85 c0                	test   %eax,%eax
c0007593:	0f 48 c2             	cmovs  %edx,%eax
c0007596:	c1 f8 0c             	sar    $0xc,%eax
c0007599:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000759c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000759f:	89 c2                	mov    %eax,%edx
c00075a1:	c1 ea 1f             	shr    $0x1f,%edx
c00075a4:	01 d0                	add    %edx,%eax
c00075a6:	d1 f8                	sar    %eax
c00075a8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00075ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00075ae:	2b 45 e0             	sub    -0x20(%ebp),%eax
c00075b1:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00075b4:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00075b7:	8d 50 07             	lea    0x7(%eax),%edx
c00075ba:	85 c0                	test   %eax,%eax
c00075bc:	0f 48 c2             	cmovs  %edx,%eax
c00075bf:	c1 f8 03             	sar    $0x3,%eax
c00075c2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00075c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00075c8:	8d 50 07             	lea    0x7(%eax),%edx
c00075cb:	85 c0                	test   %eax,%eax
c00075cd:	0f 48 c2             	cmovs  %edx,%eax
c00075d0:	c1 f8 03             	sar    $0x3,%eax
c00075d3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00075d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00075d9:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c00075de:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00075e3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00075e6:	c1 e2 0c             	shl    $0xc,%edx
c00075e9:	01 d0                	add    %edx,%eax
c00075eb:	a3 cc 1e 01 c0       	mov    %eax,0xc0011ecc
c00075f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00075f3:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c00075f8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00075fb:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c0007600:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0007605:	83 ec 04             	sub    $0x4,%esp
c0007608:	ff 75 d8             	pushl  -0x28(%ebp)
c000760b:	6a 00                	push   $0x0
c000760d:	50                   	push   %eax
c000760e:	e8 90 38 00 00       	call   c000aea3 <Memset>
c0007613:	83 c4 10             	add    $0x10,%esp
c0007616:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007619:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000761c:	01 d0                	add    %edx,%eax
c000761e:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c0007623:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007626:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c000762b:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0007630:	83 ec 04             	sub    $0x4,%esp
c0007633:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007636:	6a 00                	push   $0x0
c0007638:	50                   	push   %eax
c0007639:	e8 65 38 00 00       	call   c000aea3 <Memset>
c000763e:	83 c4 10             	add    $0x10,%esp
c0007641:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007644:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c0007649:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000764c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000764f:	01 c2                	add    %eax,%edx
c0007651:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007654:	01 d0                	add    %edx,%eax
c0007656:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c000765b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000765e:	05 00 00 10 00       	add    $0x100000,%eax
c0007663:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c0007668:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c000766d:	83 ec 04             	sub    $0x4,%esp
c0007670:	ff 75 d8             	pushl  -0x28(%ebp)
c0007673:	6a 00                	push   $0x0
c0007675:	50                   	push   %eax
c0007676:	e8 28 38 00 00       	call   c000aea3 <Memset>
c000767b:	83 c4 10             	add    $0x10,%esp
c000767e:	83 ec 0c             	sub    $0xc,%esp
c0007681:	68 00 32 08 c0       	push   $0xc0083200
c0007686:	e8 8c fb ff ff       	call   c0007217 <init_memory_block_desc>
c000768b:	83 c4 10             	add    $0x10,%esp
c000768e:	90                   	nop
c000768f:	c9                   	leave  
c0007690:	c3                   	ret    

c0007691 <untar>:
c0007691:	55                   	push   %ebp
c0007692:	89 e5                	mov    %esp,%ebp
c0007694:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c000769a:	83 ec 08             	sub    $0x8,%esp
c000769d:	6a 00                	push   $0x0
c000769f:	ff 75 08             	pushl  0x8(%ebp)
c00076a2:	e8 16 e5 ff ff       	call   c0005bbd <open>
c00076a7:	83 c4 10             	add    $0x10,%esp
c00076aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00076ad:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00076b4:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c00076bb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00076c2:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00076c9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00076cd:	7e 58                	jle    c0007727 <untar+0x96>
c00076cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00076d2:	05 ff 01 00 00       	add    $0x1ff,%eax
c00076d7:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00076dd:	85 c0                	test   %eax,%eax
c00076df:	0f 48 c2             	cmovs  %edx,%eax
c00076e2:	c1 f8 09             	sar    $0x9,%eax
c00076e5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00076e8:	83 ec 04             	sub    $0x4,%esp
c00076eb:	68 00 20 00 00       	push   $0x2000
c00076f0:	6a 00                	push   $0x0
c00076f2:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00076f8:	50                   	push   %eax
c00076f9:	e8 a5 37 00 00       	call   c000aea3 <Memset>
c00076fe:	83 c4 10             	add    $0x10,%esp
c0007701:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007704:	c1 e0 09             	shl    $0x9,%eax
c0007707:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000770a:	83 ec 04             	sub    $0x4,%esp
c000770d:	50                   	push   %eax
c000770e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007714:	50                   	push   %eax
c0007715:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007718:	e8 25 e5 ff ff       	call   c0005c42 <read>
c000771d:	83 c4 10             	add    $0x10,%esp
c0007720:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007727:	83 ec 04             	sub    $0x4,%esp
c000772a:	68 00 20 00 00       	push   $0x2000
c000772f:	6a 00                	push   $0x0
c0007731:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007737:	50                   	push   %eax
c0007738:	e8 66 37 00 00       	call   c000aea3 <Memset>
c000773d:	83 c4 10             	add    $0x10,%esp
c0007740:	83 ec 04             	sub    $0x4,%esp
c0007743:	68 00 02 00 00       	push   $0x200
c0007748:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000774e:	50                   	push   %eax
c000774f:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007752:	e8 eb e4 ff ff       	call   c0005c42 <read>
c0007757:	83 c4 10             	add    $0x10,%esp
c000775a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000775d:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007761:	0f 84 1f 01 00 00    	je     c0007886 <untar+0x1f5>
c0007767:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000776a:	01 45 f4             	add    %eax,-0xc(%ebp)
c000776d:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007774:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000777a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000777d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007780:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007783:	83 ec 08             	sub    $0x8,%esp
c0007786:	6a 07                	push   $0x7
c0007788:	ff 75 cc             	pushl  -0x34(%ebp)
c000778b:	e8 2d e4 ff ff       	call   c0005bbd <open>
c0007790:	83 c4 10             	add    $0x10,%esp
c0007793:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007796:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000779d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00077a0:	83 c0 7c             	add    $0x7c,%eax
c00077a3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00077a6:	83 ec 0c             	sub    $0xc,%esp
c00077a9:	ff 75 cc             	pushl  -0x34(%ebp)
c00077ac:	e8 2b 37 00 00       	call   c000aedc <Strlen>
c00077b1:	83 c4 10             	add    $0x10,%esp
c00077b4:	85 c0                	test   %eax,%eax
c00077b6:	75 16                	jne    c00077ce <untar+0x13d>
c00077b8:	83 ec 0c             	sub    $0xc,%esp
c00077bb:	ff 75 c4             	pushl  -0x3c(%ebp)
c00077be:	e8 19 37 00 00       	call   c000aedc <Strlen>
c00077c3:	83 c4 10             	add    $0x10,%esp
c00077c6:	85 c0                	test   %eax,%eax
c00077c8:	0f 84 bb 00 00 00    	je     c0007889 <untar+0x1f8>
c00077ce:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00077d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00077d4:	eb 1f                	jmp    c00077f5 <untar+0x164>
c00077d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00077d9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00077e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077e3:	0f b6 00             	movzbl (%eax),%eax
c00077e6:	0f be c0             	movsbl %al,%eax
c00077e9:	83 e8 30             	sub    $0x30,%eax
c00077ec:	01 d0                	add    %edx,%eax
c00077ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00077f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00077f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077f8:	0f b6 00             	movzbl (%eax),%eax
c00077fb:	84 c0                	test   %al,%al
c00077fd:	75 d7                	jne    c00077d6 <untar+0x145>
c00077ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007802:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007805:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c000780c:	eb 5f                	jmp    c000786d <untar+0x1dc>
c000780e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007811:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0007814:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0007818:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000781b:	83 ec 04             	sub    $0x4,%esp
c000781e:	68 00 02 00 00       	push   $0x200
c0007823:	6a 00                	push   $0x0
c0007825:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000782b:	50                   	push   %eax
c000782c:	e8 72 36 00 00       	call   c000aea3 <Memset>
c0007831:	83 c4 10             	add    $0x10,%esp
c0007834:	83 ec 04             	sub    $0x4,%esp
c0007837:	ff 75 bc             	pushl  -0x44(%ebp)
c000783a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007840:	50                   	push   %eax
c0007841:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007844:	e8 f9 e3 ff ff       	call   c0005c42 <read>
c0007849:	83 c4 10             	add    $0x10,%esp
c000784c:	01 45 f4             	add    %eax,-0xc(%ebp)
c000784f:	83 ec 04             	sub    $0x4,%esp
c0007852:	ff 75 bc             	pushl  -0x44(%ebp)
c0007855:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000785b:	50                   	push   %eax
c000785c:	ff 75 c8             	pushl  -0x38(%ebp)
c000785f:	e8 52 e4 ff ff       	call   c0005cb6 <write>
c0007864:	83 c4 10             	add    $0x10,%esp
c0007867:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000786a:	29 45 e8             	sub    %eax,-0x18(%ebp)
c000786d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007871:	75 9b                	jne    c000780e <untar+0x17d>
c0007873:	83 ec 0c             	sub    $0xc,%esp
c0007876:	ff 75 c8             	pushl  -0x38(%ebp)
c0007879:	e8 ac e4 ff ff       	call   c0005d2a <close>
c000787e:	83 c4 10             	add    $0x10,%esp
c0007881:	e9 43 fe ff ff       	jmp    c00076c9 <untar+0x38>
c0007886:	90                   	nop
c0007887:	eb 01                	jmp    c000788a <untar+0x1f9>
c0007889:	90                   	nop
c000788a:	83 ec 0c             	sub    $0xc,%esp
c000788d:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007890:	e8 95 e4 ff ff       	call   c0005d2a <close>
c0007895:	83 c4 10             	add    $0x10,%esp
c0007898:	90                   	nop
c0007899:	c9                   	leave  
c000789a:	c3                   	ret    

c000789b <atoi>:
c000789b:	55                   	push   %ebp
c000789c:	89 e5                	mov    %esp,%ebp
c000789e:	83 ec 10             	sub    $0x10,%esp
c00078a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00078a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00078a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00078aa:	8d 50 01             	lea    0x1(%eax),%edx
c00078ad:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00078b0:	c6 00 30             	movb   $0x30,(%eax)
c00078b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00078b6:	8d 50 01             	lea    0x1(%eax),%edx
c00078b9:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00078bc:	c6 00 78             	movb   $0x78,(%eax)
c00078bf:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c00078c3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00078c7:	75 0e                	jne    c00078d7 <atoi+0x3c>
c00078c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00078cc:	8d 50 01             	lea    0x1(%eax),%edx
c00078cf:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00078d2:	c6 00 30             	movb   $0x30,(%eax)
c00078d5:	eb 61                	jmp    c0007938 <atoi+0x9d>
c00078d7:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c00078de:	eb 52                	jmp    c0007932 <atoi+0x97>
c00078e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00078e3:	8b 55 0c             	mov    0xc(%ebp),%edx
c00078e6:	89 c1                	mov    %eax,%ecx
c00078e8:	d3 fa                	sar    %cl,%edx
c00078ea:	89 d0                	mov    %edx,%eax
c00078ec:	83 e0 0f             	and    $0xf,%eax
c00078ef:	88 45 fb             	mov    %al,-0x5(%ebp)
c00078f2:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c00078f6:	75 06                	jne    c00078fe <atoi+0x63>
c00078f8:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c00078fc:	74 2f                	je     c000792d <atoi+0x92>
c00078fe:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007902:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007906:	83 c0 30             	add    $0x30,%eax
c0007909:	88 45 fb             	mov    %al,-0x5(%ebp)
c000790c:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007910:	7e 0a                	jle    c000791c <atoi+0x81>
c0007912:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007916:	83 c0 07             	add    $0x7,%eax
c0007919:	88 45 fb             	mov    %al,-0x5(%ebp)
c000791c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000791f:	8d 50 01             	lea    0x1(%eax),%edx
c0007922:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007925:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007929:	88 10                	mov    %dl,(%eax)
c000792b:	eb 01                	jmp    c000792e <atoi+0x93>
c000792d:	90                   	nop
c000792e:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007932:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007936:	79 a8                	jns    c00078e0 <atoi+0x45>
c0007938:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000793b:	c6 00 00             	movb   $0x0,(%eax)
c000793e:	90                   	nop
c000793f:	c9                   	leave  
c0007940:	c3                   	ret    

c0007941 <disp_int>:
c0007941:	55                   	push   %ebp
c0007942:	89 e5                	mov    %esp,%ebp
c0007944:	83 ec 18             	sub    $0x18,%esp
c0007947:	ff 75 08             	pushl  0x8(%ebp)
c000794a:	8d 45 ee             	lea    -0x12(%ebp),%eax
c000794d:	50                   	push   %eax
c000794e:	e8 48 ff ff ff       	call   c000789b <atoi>
c0007953:	83 c4 08             	add    $0x8,%esp
c0007956:	83 ec 08             	sub    $0x8,%esp
c0007959:	6a 0b                	push   $0xb
c000795b:	8d 45 ee             	lea    -0x12(%ebp),%eax
c000795e:	50                   	push   %eax
c000795f:	e8 63 9c ff ff       	call   c00015c7 <disp_str_colour>
c0007964:	83 c4 10             	add    $0x10,%esp
c0007967:	90                   	nop
c0007968:	c9                   	leave  
c0007969:	c3                   	ret    

c000796a <do_page_fault>:
c000796a:	55                   	push   %ebp
c000796b:	89 e5                	mov    %esp,%ebp
c000796d:	83 ec 28             	sub    $0x28,%esp
c0007970:	0f 20 d0             	mov    %cr2,%eax
c0007973:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007976:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c000797d:	00 00 00 
c0007980:	83 ec 0c             	sub    $0xc,%esp
c0007983:	68 60 a7 00 c0       	push   $0xc000a760
c0007988:	e8 ff 9b ff ff       	call   c000158c <disp_str>
c000798d:	83 c4 10             	add    $0x10,%esp
c0007990:	83 ec 0c             	sub    $0xc,%esp
c0007993:	68 6f a7 00 c0       	push   $0xc000a76f
c0007998:	e8 ef 9b ff ff       	call   c000158c <disp_str>
c000799d:	83 c4 10             	add    $0x10,%esp
c00079a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00079a3:	83 ec 0c             	sub    $0xc,%esp
c00079a6:	50                   	push   %eax
c00079a7:	e8 95 ff ff ff       	call   c0007941 <disp_int>
c00079ac:	83 c4 10             	add    $0x10,%esp
c00079af:	83 ec 0c             	sub    $0xc,%esp
c00079b2:	68 74 a7 00 c0       	push   $0xc000a774
c00079b7:	e8 d0 9b ff ff       	call   c000158c <disp_str>
c00079bc:	83 c4 10             	add    $0x10,%esp
c00079bf:	83 ec 0c             	sub    $0xc,%esp
c00079c2:	ff 75 f4             	pushl  -0xc(%ebp)
c00079c5:	e8 f5 f1 ff ff       	call   c0006bbf <ptr_pde>
c00079ca:	83 c4 10             	add    $0x10,%esp
c00079cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00079d0:	83 ec 0c             	sub    $0xc,%esp
c00079d3:	ff 75 f4             	pushl  -0xc(%ebp)
c00079d6:	e8 f7 f1 ff ff       	call   c0006bd2 <ptr_pte>
c00079db:	83 c4 10             	add    $0x10,%esp
c00079de:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00079e1:	83 ec 0c             	sub    $0xc,%esp
c00079e4:	68 76 a7 00 c0       	push   $0xc000a776
c00079e9:	e8 9e 9b ff ff       	call   c000158c <disp_str>
c00079ee:	83 c4 10             	add    $0x10,%esp
c00079f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00079f4:	83 ec 0c             	sub    $0xc,%esp
c00079f7:	50                   	push   %eax
c00079f8:	e8 44 ff ff ff       	call   c0007941 <disp_int>
c00079fd:	83 c4 10             	add    $0x10,%esp
c0007a00:	83 ec 0c             	sub    $0xc,%esp
c0007a03:	68 7b a7 00 c0       	push   $0xc000a77b
c0007a08:	e8 7f 9b ff ff       	call   c000158c <disp_str>
c0007a0d:	83 c4 10             	add    $0x10,%esp
c0007a10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007a13:	8b 00                	mov    (%eax),%eax
c0007a15:	83 ec 0c             	sub    $0xc,%esp
c0007a18:	50                   	push   %eax
c0007a19:	e8 23 ff ff ff       	call   c0007941 <disp_int>
c0007a1e:	83 c4 10             	add    $0x10,%esp
c0007a21:	83 ec 0c             	sub    $0xc,%esp
c0007a24:	68 74 a7 00 c0       	push   $0xc000a774
c0007a29:	e8 5e 9b ff ff       	call   c000158c <disp_str>
c0007a2e:	83 c4 10             	add    $0x10,%esp
c0007a31:	83 ec 0c             	sub    $0xc,%esp
c0007a34:	68 84 a7 00 c0       	push   $0xc000a784
c0007a39:	e8 4e 9b ff ff       	call   c000158c <disp_str>
c0007a3e:	83 c4 10             	add    $0x10,%esp
c0007a41:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a44:	83 ec 0c             	sub    $0xc,%esp
c0007a47:	50                   	push   %eax
c0007a48:	e8 f4 fe ff ff       	call   c0007941 <disp_int>
c0007a4d:	83 c4 10             	add    $0x10,%esp
c0007a50:	83 ec 0c             	sub    $0xc,%esp
c0007a53:	68 89 a7 00 c0       	push   $0xc000a789
c0007a58:	e8 2f 9b ff ff       	call   c000158c <disp_str>
c0007a5d:	83 c4 10             	add    $0x10,%esp
c0007a60:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a63:	8b 00                	mov    (%eax),%eax
c0007a65:	83 ec 0c             	sub    $0xc,%esp
c0007a68:	50                   	push   %eax
c0007a69:	e8 d3 fe ff ff       	call   c0007941 <disp_int>
c0007a6e:	83 c4 10             	add    $0x10,%esp
c0007a71:	83 ec 0c             	sub    $0xc,%esp
c0007a74:	68 74 a7 00 c0       	push   $0xc000a774
c0007a79:	e8 0e 9b ff ff       	call   c000158c <disp_str>
c0007a7e:	83 c4 10             	add    $0x10,%esp
c0007a81:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007a88:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a8b:	8b 00                	mov    (%eax),%eax
c0007a8d:	83 e0 01             	and    $0x1,%eax
c0007a90:	85 c0                	test   %eax,%eax
c0007a92:	74 09                	je     c0007a9d <do_page_fault+0x133>
c0007a94:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007a9b:	eb 07                	jmp    c0007aa4 <do_page_fault+0x13a>
c0007a9d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007aa4:	90                   	nop
c0007aa5:	c9                   	leave  
c0007aa6:	c3                   	ret    

c0007aa7 <exception_handler>:
c0007aa7:	55                   	push   %ebp
c0007aa8:	89 e5                	mov    %esp,%ebp
c0007aaa:	57                   	push   %edi
c0007aab:	56                   	push   %esi
c0007aac:	53                   	push   %ebx
c0007aad:	83 ec 6c             	sub    $0x6c,%esp
c0007ab0:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007ab3:	bb 00 aa 00 c0       	mov    $0xc000aa00,%ebx
c0007ab8:	ba 13 00 00 00       	mov    $0x13,%edx
c0007abd:	89 c7                	mov    %eax,%edi
c0007abf:	89 de                	mov    %ebx,%esi
c0007ac1:	89 d1                	mov    %edx,%ecx
c0007ac3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007ac5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007acc:	eb 04                	jmp    c0007ad2 <exception_handler+0x2b>
c0007ace:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007ad2:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007ad9:	7e f3                	jle    c0007ace <exception_handler+0x27>
c0007adb:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0007ae2:	00 00 00 
c0007ae5:	83 ec 0c             	sub    $0xc,%esp
c0007ae8:	68 92 a7 00 c0       	push   $0xc000a792
c0007aed:	e8 9a 9a ff ff       	call   c000158c <disp_str>
c0007af2:	83 c4 10             	add    $0x10,%esp
c0007af5:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007afc:	8b 45 08             	mov    0x8(%ebp),%eax
c0007aff:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0007b03:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007b06:	83 ec 0c             	sub    $0xc,%esp
c0007b09:	ff 75 dc             	pushl  -0x24(%ebp)
c0007b0c:	e8 7b 9a ff ff       	call   c000158c <disp_str>
c0007b11:	83 c4 10             	add    $0x10,%esp
c0007b14:	83 ec 0c             	sub    $0xc,%esp
c0007b17:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007b1c:	e8 6b 9a ff ff       	call   c000158c <disp_str>
c0007b21:	83 c4 10             	add    $0x10,%esp
c0007b24:	83 ec 0c             	sub    $0xc,%esp
c0007b27:	68 a3 a7 00 c0       	push   $0xc000a7a3
c0007b2c:	e8 5b 9a ff ff       	call   c000158c <disp_str>
c0007b31:	83 c4 10             	add    $0x10,%esp
c0007b34:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b37:	83 ec 0c             	sub    $0xc,%esp
c0007b3a:	50                   	push   %eax
c0007b3b:	e8 01 fe ff ff       	call   c0007941 <disp_int>
c0007b40:	83 c4 10             	add    $0x10,%esp
c0007b43:	83 ec 0c             	sub    $0xc,%esp
c0007b46:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007b4b:	e8 3c 9a ff ff       	call   c000158c <disp_str>
c0007b50:	83 c4 10             	add    $0x10,%esp
c0007b53:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007b57:	74 2f                	je     c0007b88 <exception_handler+0xe1>
c0007b59:	83 ec 0c             	sub    $0xc,%esp
c0007b5c:	68 ab a7 00 c0       	push   $0xc000a7ab
c0007b61:	e8 26 9a ff ff       	call   c000158c <disp_str>
c0007b66:	83 c4 10             	add    $0x10,%esp
c0007b69:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007b6c:	83 ec 0c             	sub    $0xc,%esp
c0007b6f:	50                   	push   %eax
c0007b70:	e8 cc fd ff ff       	call   c0007941 <disp_int>
c0007b75:	83 c4 10             	add    $0x10,%esp
c0007b78:	83 ec 0c             	sub    $0xc,%esp
c0007b7b:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007b80:	e8 07 9a ff ff       	call   c000158c <disp_str>
c0007b85:	83 c4 10             	add    $0x10,%esp
c0007b88:	83 ec 0c             	sub    $0xc,%esp
c0007b8b:	68 b5 a7 00 c0       	push   $0xc000a7b5
c0007b90:	e8 f7 99 ff ff       	call   c000158c <disp_str>
c0007b95:	83 c4 10             	add    $0x10,%esp
c0007b98:	83 ec 0c             	sub    $0xc,%esp
c0007b9b:	ff 75 14             	pushl  0x14(%ebp)
c0007b9e:	e8 9e fd ff ff       	call   c0007941 <disp_int>
c0007ba3:	83 c4 10             	add    $0x10,%esp
c0007ba6:	83 ec 0c             	sub    $0xc,%esp
c0007ba9:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007bae:	e8 d9 99 ff ff       	call   c000158c <disp_str>
c0007bb3:	83 c4 10             	add    $0x10,%esp
c0007bb6:	83 ec 0c             	sub    $0xc,%esp
c0007bb9:	68 b9 a7 00 c0       	push   $0xc000a7b9
c0007bbe:	e8 c9 99 ff ff       	call   c000158c <disp_str>
c0007bc3:	83 c4 10             	add    $0x10,%esp
c0007bc6:	8b 45 10             	mov    0x10(%ebp),%eax
c0007bc9:	83 ec 0c             	sub    $0xc,%esp
c0007bcc:	50                   	push   %eax
c0007bcd:	e8 6f fd ff ff       	call   c0007941 <disp_int>
c0007bd2:	83 c4 10             	add    $0x10,%esp
c0007bd5:	83 ec 0c             	sub    $0xc,%esp
c0007bd8:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007bdd:	e8 aa 99 ff ff       	call   c000158c <disp_str>
c0007be2:	83 c4 10             	add    $0x10,%esp
c0007be5:	83 ec 0c             	sub    $0xc,%esp
c0007be8:	68 be a7 00 c0       	push   $0xc000a7be
c0007bed:	e8 9a 99 ff ff       	call   c000158c <disp_str>
c0007bf2:	83 c4 10             	add    $0x10,%esp
c0007bf5:	83 ec 0c             	sub    $0xc,%esp
c0007bf8:	ff 75 18             	pushl  0x18(%ebp)
c0007bfb:	e8 41 fd ff ff       	call   c0007941 <disp_int>
c0007c00:	83 c4 10             	add    $0x10,%esp
c0007c03:	83 ec 0c             	sub    $0xc,%esp
c0007c06:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007c0b:	e8 7c 99 ff ff       	call   c000158c <disp_str>
c0007c10:	83 c4 10             	add    $0x10,%esp
c0007c13:	83 ec 0c             	sub    $0xc,%esp
c0007c16:	68 c8 a7 00 c0       	push   $0xc000a7c8
c0007c1b:	e8 6c 99 ff ff       	call   c000158c <disp_str>
c0007c20:	83 c4 10             	add    $0x10,%esp
c0007c23:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0007c27:	75 46                	jne    c0007c6f <exception_handler+0x1c8>
c0007c29:	0f 20 d0             	mov    %cr2,%eax
c0007c2c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007c2f:	83 ec 0c             	sub    $0xc,%esp
c0007c32:	68 e7 a7 00 c0       	push   $0xc000a7e7
c0007c37:	e8 50 99 ff ff       	call   c000158c <disp_str>
c0007c3c:	83 c4 10             	add    $0x10,%esp
c0007c3f:	83 ec 0c             	sub    $0xc,%esp
c0007c42:	68 6f a7 00 c0       	push   $0xc000a76f
c0007c47:	e8 40 99 ff ff       	call   c000158c <disp_str>
c0007c4c:	83 c4 10             	add    $0x10,%esp
c0007c4f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007c52:	83 ec 0c             	sub    $0xc,%esp
c0007c55:	50                   	push   %eax
c0007c56:	e8 e6 fc ff ff       	call   c0007941 <disp_int>
c0007c5b:	83 c4 10             	add    $0x10,%esp
c0007c5e:	83 ec 0c             	sub    $0xc,%esp
c0007c61:	68 74 a7 00 c0       	push   $0xc000a774
c0007c66:	e8 21 99 ff ff       	call   c000158c <disp_str>
c0007c6b:	83 c4 10             	add    $0x10,%esp
c0007c6e:	90                   	nop
c0007c6f:	90                   	nop
c0007c70:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007c73:	5b                   	pop    %ebx
c0007c74:	5e                   	pop    %esi
c0007c75:	5f                   	pop    %edi
c0007c76:	5d                   	pop    %ebp
c0007c77:	c3                   	ret    

c0007c78 <exception_handler2>:
c0007c78:	55                   	push   %ebp
c0007c79:	89 e5                	mov    %esp,%ebp
c0007c7b:	57                   	push   %edi
c0007c7c:	56                   	push   %esi
c0007c7d:	53                   	push   %ebx
c0007c7e:	83 ec 6c             	sub    $0x6c,%esp
c0007c81:	8d 45 90             	lea    -0x70(%ebp),%eax
c0007c84:	bb 00 aa 00 c0       	mov    $0xc000aa00,%ebx
c0007c89:	ba 13 00 00 00       	mov    $0x13,%edx
c0007c8e:	89 c7                	mov    %eax,%edi
c0007c90:	89 de                	mov    %ebx,%esi
c0007c92:	89 d1                	mov    %edx,%ecx
c0007c94:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007c96:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007c9d:	2e 00 00 
c0007ca0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007ca7:	eb 14                	jmp    c0007cbd <exception_handler2+0x45>
c0007ca9:	83 ec 0c             	sub    $0xc,%esp
c0007cac:	68 4c aa 00 c0       	push   $0xc000aa4c
c0007cb1:	e8 d6 98 ff ff       	call   c000158c <disp_str>
c0007cb6:	83 c4 10             	add    $0x10,%esp
c0007cb9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007cbd:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007cc4:	7e e3                	jle    c0007ca9 <exception_handler2+0x31>
c0007cc6:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007ccd:	2e 00 00 
c0007cd0:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007cd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0007cda:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0007cde:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007ce1:	83 ec 08             	sub    $0x8,%esp
c0007ce4:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ce7:	ff 75 dc             	pushl  -0x24(%ebp)
c0007cea:	e8 d8 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007cef:	83 c4 10             	add    $0x10,%esp
c0007cf2:	83 ec 0c             	sub    $0xc,%esp
c0007cf5:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007cfa:	e8 8d 98 ff ff       	call   c000158c <disp_str>
c0007cff:	83 c4 10             	add    $0x10,%esp
c0007d02:	83 ec 08             	sub    $0x8,%esp
c0007d05:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d08:	68 a3 a7 00 c0       	push   $0xc000a7a3
c0007d0d:	e8 b5 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007d12:	83 c4 10             	add    $0x10,%esp
c0007d15:	83 ec 0c             	sub    $0xc,%esp
c0007d18:	ff 75 08             	pushl  0x8(%ebp)
c0007d1b:	e8 21 fc ff ff       	call   c0007941 <disp_int>
c0007d20:	83 c4 10             	add    $0x10,%esp
c0007d23:	83 ec 0c             	sub    $0xc,%esp
c0007d26:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007d2b:	e8 5c 98 ff ff       	call   c000158c <disp_str>
c0007d30:	83 c4 10             	add    $0x10,%esp
c0007d33:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007d37:	74 44                	je     c0007d7d <exception_handler2+0x105>
c0007d39:	83 ec 08             	sub    $0x8,%esp
c0007d3c:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d3f:	68 ab a7 00 c0       	push   $0xc000a7ab
c0007d44:	e8 7e 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007d49:	83 c4 10             	add    $0x10,%esp
c0007d4c:	83 ec 08             	sub    $0x8,%esp
c0007d4f:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d52:	68 ab a7 00 c0       	push   $0xc000a7ab
c0007d57:	e8 6b 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007d5c:	83 c4 10             	add    $0x10,%esp
c0007d5f:	83 ec 0c             	sub    $0xc,%esp
c0007d62:	ff 75 0c             	pushl  0xc(%ebp)
c0007d65:	e8 d7 fb ff ff       	call   c0007941 <disp_int>
c0007d6a:	83 c4 10             	add    $0x10,%esp
c0007d6d:	83 ec 0c             	sub    $0xc,%esp
c0007d70:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007d75:	e8 12 98 ff ff       	call   c000158c <disp_str>
c0007d7a:	83 c4 10             	add    $0x10,%esp
c0007d7d:	83 ec 08             	sub    $0x8,%esp
c0007d80:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d83:	68 b5 a7 00 c0       	push   $0xc000a7b5
c0007d88:	e8 3a 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007d8d:	83 c4 10             	add    $0x10,%esp
c0007d90:	83 ec 0c             	sub    $0xc,%esp
c0007d93:	ff 75 14             	pushl  0x14(%ebp)
c0007d96:	e8 a6 fb ff ff       	call   c0007941 <disp_int>
c0007d9b:	83 c4 10             	add    $0x10,%esp
c0007d9e:	83 ec 0c             	sub    $0xc,%esp
c0007da1:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007da6:	e8 e1 97 ff ff       	call   c000158c <disp_str>
c0007dab:	83 c4 10             	add    $0x10,%esp
c0007dae:	83 ec 08             	sub    $0x8,%esp
c0007db1:	ff 75 e0             	pushl  -0x20(%ebp)
c0007db4:	68 b9 a7 00 c0       	push   $0xc000a7b9
c0007db9:	e8 09 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007dbe:	83 c4 10             	add    $0x10,%esp
c0007dc1:	83 ec 0c             	sub    $0xc,%esp
c0007dc4:	ff 75 10             	pushl  0x10(%ebp)
c0007dc7:	e8 75 fb ff ff       	call   c0007941 <disp_int>
c0007dcc:	83 c4 10             	add    $0x10,%esp
c0007dcf:	83 ec 0c             	sub    $0xc,%esp
c0007dd2:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007dd7:	e8 b0 97 ff ff       	call   c000158c <disp_str>
c0007ddc:	83 c4 10             	add    $0x10,%esp
c0007ddf:	83 ec 08             	sub    $0x8,%esp
c0007de2:	ff 75 e0             	pushl  -0x20(%ebp)
c0007de5:	68 be a7 00 c0       	push   $0xc000a7be
c0007dea:	e8 d8 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007def:	83 c4 10             	add    $0x10,%esp
c0007df2:	83 ec 0c             	sub    $0xc,%esp
c0007df5:	ff 75 18             	pushl  0x18(%ebp)
c0007df8:	e8 44 fb ff ff       	call   c0007941 <disp_int>
c0007dfd:	83 c4 10             	add    $0x10,%esp
c0007e00:	83 ec 0c             	sub    $0xc,%esp
c0007e03:	68 a0 a7 00 c0       	push   $0xc000a7a0
c0007e08:	e8 7f 97 ff ff       	call   c000158c <disp_str>
c0007e0d:	83 c4 10             	add    $0x10,%esp
c0007e10:	90                   	nop
c0007e11:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007e14:	5b                   	pop    %ebx
c0007e15:	5e                   	pop    %esi
c0007e16:	5f                   	pop    %edi
c0007e17:	5d                   	pop    %ebp
c0007e18:	c3                   	ret    

c0007e19 <init_internal_interrupt>:
c0007e19:	55                   	push   %ebp
c0007e1a:	89 e5                	mov    %esp,%ebp
c0007e1c:	83 ec 08             	sub    $0x8,%esp
c0007e1f:	6a 0e                	push   $0xe
c0007e21:	6a 08                	push   $0x8
c0007e23:	68 03 16 00 c0       	push   $0xc0001603
c0007e28:	6a 00                	push   $0x0
c0007e2a:	e8 12 ce ff ff       	call   c0004c41 <InitInterruptDesc>
c0007e2f:	83 c4 10             	add    $0x10,%esp
c0007e32:	6a 0e                	push   $0xe
c0007e34:	6a 08                	push   $0x8
c0007e36:	68 09 16 00 c0       	push   $0xc0001609
c0007e3b:	6a 01                	push   $0x1
c0007e3d:	e8 ff cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007e42:	83 c4 10             	add    $0x10,%esp
c0007e45:	6a 0e                	push   $0xe
c0007e47:	6a 08                	push   $0x8
c0007e49:	68 0f 16 00 c0       	push   $0xc000160f
c0007e4e:	6a 02                	push   $0x2
c0007e50:	e8 ec cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007e55:	83 c4 10             	add    $0x10,%esp
c0007e58:	6a 0e                	push   $0xe
c0007e5a:	6a 08                	push   $0x8
c0007e5c:	68 15 16 00 c0       	push   $0xc0001615
c0007e61:	6a 03                	push   $0x3
c0007e63:	e8 d9 cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007e68:	83 c4 10             	add    $0x10,%esp
c0007e6b:	6a 0e                	push   $0xe
c0007e6d:	6a 08                	push   $0x8
c0007e6f:	68 1b 16 00 c0       	push   $0xc000161b
c0007e74:	6a 04                	push   $0x4
c0007e76:	e8 c6 cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007e7b:	83 c4 10             	add    $0x10,%esp
c0007e7e:	6a 0e                	push   $0xe
c0007e80:	6a 08                	push   $0x8
c0007e82:	68 21 16 00 c0       	push   $0xc0001621
c0007e87:	6a 05                	push   $0x5
c0007e89:	e8 b3 cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007e8e:	83 c4 10             	add    $0x10,%esp
c0007e91:	6a 0e                	push   $0xe
c0007e93:	6a 08                	push   $0x8
c0007e95:	68 27 16 00 c0       	push   $0xc0001627
c0007e9a:	6a 06                	push   $0x6
c0007e9c:	e8 a0 cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007ea1:	83 c4 10             	add    $0x10,%esp
c0007ea4:	6a 0e                	push   $0xe
c0007ea6:	6a 08                	push   $0x8
c0007ea8:	68 2d 16 00 c0       	push   $0xc000162d
c0007ead:	6a 07                	push   $0x7
c0007eaf:	e8 8d cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007eb4:	83 c4 10             	add    $0x10,%esp
c0007eb7:	6a 0e                	push   $0xe
c0007eb9:	6a 08                	push   $0x8
c0007ebb:	68 33 16 00 c0       	push   $0xc0001633
c0007ec0:	6a 08                	push   $0x8
c0007ec2:	e8 7a cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007ec7:	83 c4 10             	add    $0x10,%esp
c0007eca:	6a 0e                	push   $0xe
c0007ecc:	6a 08                	push   $0x8
c0007ece:	68 37 16 00 c0       	push   $0xc0001637
c0007ed3:	6a 09                	push   $0x9
c0007ed5:	e8 67 cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007eda:	83 c4 10             	add    $0x10,%esp
c0007edd:	6a 0e                	push   $0xe
c0007edf:	6a 08                	push   $0x8
c0007ee1:	68 3d 16 00 c0       	push   $0xc000163d
c0007ee6:	6a 0a                	push   $0xa
c0007ee8:	e8 54 cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007eed:	83 c4 10             	add    $0x10,%esp
c0007ef0:	6a 0e                	push   $0xe
c0007ef2:	6a 08                	push   $0x8
c0007ef4:	68 41 16 00 c0       	push   $0xc0001641
c0007ef9:	6a 0b                	push   $0xb
c0007efb:	e8 41 cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007f00:	83 c4 10             	add    $0x10,%esp
c0007f03:	6a 0e                	push   $0xe
c0007f05:	6a 08                	push   $0x8
c0007f07:	68 45 16 00 c0       	push   $0xc0001645
c0007f0c:	6a 0c                	push   $0xc
c0007f0e:	e8 2e cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007f13:	83 c4 10             	add    $0x10,%esp
c0007f16:	6a 0e                	push   $0xe
c0007f18:	6a 08                	push   $0x8
c0007f1a:	68 49 16 00 c0       	push   $0xc0001649
c0007f1f:	6a 0d                	push   $0xd
c0007f21:	e8 1b cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007f26:	83 c4 10             	add    $0x10,%esp
c0007f29:	6a 0e                	push   $0xe
c0007f2b:	6a 08                	push   $0x8
c0007f2d:	68 4d 16 00 c0       	push   $0xc000164d
c0007f32:	6a 0e                	push   $0xe
c0007f34:	e8 08 cd ff ff       	call   c0004c41 <InitInterruptDesc>
c0007f39:	83 c4 10             	add    $0x10,%esp
c0007f3c:	6a 0e                	push   $0xe
c0007f3e:	6a 08                	push   $0x8
c0007f40:	68 51 16 00 c0       	push   $0xc0001651
c0007f45:	6a 10                	push   $0x10
c0007f47:	e8 f5 cc ff ff       	call   c0004c41 <InitInterruptDesc>
c0007f4c:	83 c4 10             	add    $0x10,%esp
c0007f4f:	6a 0e                	push   $0xe
c0007f51:	6a 08                	push   $0x8
c0007f53:	68 57 16 00 c0       	push   $0xc0001657
c0007f58:	6a 11                	push   $0x11
c0007f5a:	e8 e2 cc ff ff       	call   c0004c41 <InitInterruptDesc>
c0007f5f:	83 c4 10             	add    $0x10,%esp
c0007f62:	6a 0e                	push   $0xe
c0007f64:	6a 08                	push   $0x8
c0007f66:	68 5b 16 00 c0       	push   $0xc000165b
c0007f6b:	6a 12                	push   $0x12
c0007f6d:	e8 cf cc ff ff       	call   c0004c41 <InitInterruptDesc>
c0007f72:	83 c4 10             	add    $0x10,%esp
c0007f75:	6a 0e                	push   $0xe
c0007f77:	6a 0e                	push   $0xe
c0007f79:	68 1c 17 00 c0       	push   $0xc000171c
c0007f7e:	68 90 00 00 00       	push   $0x90
c0007f83:	e8 b9 cc ff ff       	call   c0004c41 <InitInterruptDesc>
c0007f88:	83 c4 10             	add    $0x10,%esp
c0007f8b:	90                   	nop
c0007f8c:	c9                   	leave  
c0007f8d:	c3                   	ret    

c0007f8e <test>:
c0007f8e:	55                   	push   %ebp
c0007f8f:	89 e5                	mov    %esp,%ebp
c0007f91:	83 ec 08             	sub    $0x8,%esp
c0007f94:	83 ec 0c             	sub    $0xc,%esp
c0007f97:	68 4e aa 00 c0       	push   $0xc000aa4e
c0007f9c:	e8 eb 95 ff ff       	call   c000158c <disp_str>
c0007fa1:	83 c4 10             	add    $0x10,%esp
c0007fa4:	83 ec 0c             	sub    $0xc,%esp
c0007fa7:	6a 06                	push   $0x6
c0007fa9:	e8 93 f9 ff ff       	call   c0007941 <disp_int>
c0007fae:	83 c4 10             	add    $0x10,%esp
c0007fb1:	83 ec 0c             	sub    $0xc,%esp
c0007fb4:	68 74 a7 00 c0       	push   $0xc000a774
c0007fb9:	e8 ce 95 ff ff       	call   c000158c <disp_str>
c0007fbe:	83 c4 10             	add    $0x10,%esp
c0007fc1:	90                   	nop
c0007fc2:	c9                   	leave  
c0007fc3:	c3                   	ret    

c0007fc4 <disp_str_colour3>:
c0007fc4:	55                   	push   %ebp
c0007fc5:	89 e5                	mov    %esp,%ebp
c0007fc7:	90                   	nop
c0007fc8:	5d                   	pop    %ebp
c0007fc9:	c3                   	ret    

c0007fca <spurious_irq>:
c0007fca:	55                   	push   %ebp
c0007fcb:	89 e5                	mov    %esp,%ebp
c0007fcd:	83 ec 08             	sub    $0x8,%esp
c0007fd0:	83 ec 08             	sub    $0x8,%esp
c0007fd3:	6a 0b                	push   $0xb
c0007fd5:	68 50 aa 00 c0       	push   $0xc000aa50
c0007fda:	e8 e8 95 ff ff       	call   c00015c7 <disp_str_colour>
c0007fdf:	83 c4 10             	add    $0x10,%esp
c0007fe2:	83 ec 0c             	sub    $0xc,%esp
c0007fe5:	ff 75 08             	pushl  0x8(%ebp)
c0007fe8:	e8 54 f9 ff ff       	call   c0007941 <disp_int>
c0007fed:	83 c4 10             	add    $0x10,%esp
c0007ff0:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0007ff5:	83 c0 01             	add    $0x1,%eax
c0007ff8:	a3 c0 1e 01 c0       	mov    %eax,0xc0011ec0
c0007ffd:	83 ec 0c             	sub    $0xc,%esp
c0008000:	68 77 aa 00 c0       	push   $0xc000aa77
c0008005:	e8 82 95 ff ff       	call   c000158c <disp_str>
c000800a:	83 c4 10             	add    $0x10,%esp
c000800d:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008012:	83 ec 0c             	sub    $0xc,%esp
c0008015:	50                   	push   %eax
c0008016:	e8 26 f9 ff ff       	call   c0007941 <disp_int>
c000801b:	83 c4 10             	add    $0x10,%esp
c000801e:	83 ec 0c             	sub    $0xc,%esp
c0008021:	68 79 aa 00 c0       	push   $0xc000aa79
c0008026:	e8 61 95 ff ff       	call   c000158c <disp_str>
c000802b:	83 c4 10             	add    $0x10,%esp
c000802e:	83 ec 08             	sub    $0x8,%esp
c0008031:	6a 0c                	push   $0xc
c0008033:	68 7c aa 00 c0       	push   $0xc000aa7c
c0008038:	e8 8a 95 ff ff       	call   c00015c7 <disp_str_colour>
c000803d:	83 c4 10             	add    $0x10,%esp
c0008040:	90                   	nop
c0008041:	c9                   	leave  
c0008042:	c3                   	ret    

c0008043 <init_keyboard>:
c0008043:	55                   	push   %ebp
c0008044:	89 e5                	mov    %esp,%ebp
c0008046:	83 ec 18             	sub    $0x18,%esp
c0008049:	83 ec 04             	sub    $0x4,%esp
c000804c:	68 00 02 00 00       	push   $0x200
c0008051:	6a 00                	push   $0x0
c0008053:	68 8c fb 00 c0       	push   $0xc000fb8c
c0008058:	e8 46 2e 00 00       	call   c000aea3 <Memset>
c000805d:	83 c4 10             	add    $0x10,%esp
c0008060:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c0008067:	fb 00 c0 
c000806a:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c000806f:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0008074:	c7 05 88 fb 00 c0 00 	movl   $0x0,0xc000fb88
c000807b:	00 00 00 
c000807e:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0008085:	00 00 00 
c0008088:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000808f:	eb 04                	jmp    c0008095 <init_keyboard+0x52>
c0008091:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008095:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c000809c:	7e f3                	jle    c0008091 <init_keyboard+0x4e>
c000809e:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c00080a5:	00 00 00 
c00080a8:	e8 6a d9 ff ff       	call   c0005a17 <init_keyboard_handler>
c00080ad:	90                   	nop
c00080ae:	c9                   	leave  
c00080af:	c3                   	ret    

c00080b0 <init2>:
c00080b0:	55                   	push   %ebp
c00080b1:	89 e5                	mov    %esp,%ebp
c00080b3:	83 ec 08             	sub    $0x8,%esp
c00080b6:	83 ec 0c             	sub    $0xc,%esp
c00080b9:	68 a1 aa 00 c0       	push   $0xc000aaa1
c00080be:	e8 c9 94 ff ff       	call   c000158c <disp_str>
c00080c3:	83 c4 10             	add    $0x10,%esp
c00080c6:	e8 78 ff ff ff       	call   c0008043 <init_keyboard>
c00080cb:	83 ec 0c             	sub    $0xc,%esp
c00080ce:	68 00 00 00 02       	push   $0x2000000
c00080d3:	e8 87 f4 ff ff       	call   c000755f <init_memory>
c00080d8:	83 c4 10             	add    $0x10,%esp
c00080db:	90                   	nop
c00080dc:	c9                   	leave  
c00080dd:	c3                   	ret    

c00080de <u_thread_a>:
c00080de:	55                   	push   %ebp
c00080df:	89 e5                	mov    %esp,%ebp
c00080e1:	83 ec 08             	sub    $0x8,%esp
c00080e4:	83 ec 0c             	sub    $0xc,%esp
c00080e7:	68 a7 aa 00 c0       	push   $0xc000aaa7
c00080ec:	e8 9b 94 ff ff       	call   c000158c <disp_str>
c00080f1:	83 c4 10             	add    $0x10,%esp
c00080f4:	eb fe                	jmp    c00080f4 <u_thread_a+0x16>

c00080f6 <kernel_main2>:
c00080f6:	55                   	push   %ebp
c00080f7:	89 e5                	mov    %esp,%ebp
c00080f9:	57                   	push   %edi
c00080fa:	56                   	push   %esi
c00080fb:	53                   	push   %ebx
c00080fc:	83 ec 3c             	sub    $0x3c,%esp
c00080ff:	83 ec 0c             	sub    $0xc,%esp
c0008102:	68 b5 aa 00 c0       	push   $0xc000aab5
c0008107:	e8 80 94 ff ff       	call   c000158c <disp_str>
c000810c:	83 c4 10             	add    $0x10,%esp
c000810f:	e8 06 98 ff ff       	call   c000191a <init>
c0008114:	c7 05 c0 1e 01 c0 00 	movl   $0x0,0xc0011ec0
c000811b:	00 00 00 
c000811e:	c7 05 9c 16 01 c0 00 	movl   $0x0,0xc001169c
c0008125:	00 00 00 
c0008128:	c7 05 44 f7 00 c0 00 	movl   $0x0,0xc000f744
c000812f:	00 00 00 
c0008132:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c0008139:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008140:	e9 01 02 00 00       	jmp    c0008346 <kernel_main2+0x250>
c0008145:	83 ec 08             	sub    $0x8,%esp
c0008148:	6a 00                	push   $0x0
c000814a:	6a 01                	push   $0x1
c000814c:	e8 d5 eb ff ff       	call   c0006d26 <alloc_memory>
c0008151:	83 c4 10             	add    $0x10,%esp
c0008154:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008157:	83 ec 04             	sub    $0x4,%esp
c000815a:	68 ac 02 00 00       	push   $0x2ac
c000815f:	6a 00                	push   $0x0
c0008161:	ff 75 d8             	pushl  -0x28(%ebp)
c0008164:	e8 3a 2d 00 00       	call   c000aea3 <Memset>
c0008169:	83 c4 10             	add    $0x10,%esp
c000816c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000816f:	05 00 10 00 00       	add    $0x1000,%eax
c0008174:	89 c2                	mov    %eax,%edx
c0008176:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008179:	89 10                	mov    %edx,(%eax)
c000817b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000817e:	66 c7 80 0c 01 00 00 	movw   $0x0,0x10c(%eax)
c0008185:	00 00 
c0008187:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000818a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000818d:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c0008193:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008196:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000819d:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c00081a1:	7e 0f                	jle    c00081b2 <kernel_main2+0xbc>
c00081a3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081a6:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c00081ad:	e9 90 01 00 00       	jmp    c0008342 <kernel_main2+0x24c>
c00081b2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081b5:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00081bc:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c00081c0:	7f 73                	jg     c0008235 <kernel_main2+0x13f>
c00081c2:	c7 45 e4 20 e0 00 c0 	movl   $0xc000e020,-0x1c(%ebp)
c00081c9:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c00081d0:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c00081d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081da:	8b 00                	mov    (%eax),%eax
c00081dc:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c00081df:	89 c2                	mov    %eax,%edx
c00081e1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081e4:	89 10                	mov    %edx,(%eax)
c00081e6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081e9:	8b 00                	mov    (%eax),%eax
c00081eb:	2b 45 d0             	sub    -0x30(%ebp),%eax
c00081ee:	89 c2                	mov    %eax,%edx
c00081f0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081f3:	89 10                	mov    %edx,(%eax)
c00081f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081f8:	8b 00                	mov    (%eax),%eax
c00081fa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00081fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008200:	8b 50 14             	mov    0x14(%eax),%edx
c0008203:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008206:	89 50 24             	mov    %edx,0x24(%eax)
c0008209:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000820c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0008212:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008215:	8b 10                	mov    (%eax),%edx
c0008217:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000821a:	89 50 04             	mov    %edx,0x4(%eax)
c000821d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008220:	8b 50 04             	mov    0x4(%eax),%edx
c0008223:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008226:	89 50 08             	mov    %edx,0x8(%eax)
c0008229:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000822c:	8b 50 08             	mov    0x8(%eax),%edx
c000822f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008232:	89 50 0c             	mov    %edx,0xc(%eax)
c0008235:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008238:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000823b:	81 c2 30 01 00 00    	add    $0x130,%edx
c0008241:	83 ec 08             	sub    $0x8,%esp
c0008244:	50                   	push   %eax
c0008245:	52                   	push   %edx
c0008246:	e8 77 2c 00 00       	call   c000aec2 <Strcpy>
c000824b:	83 c4 10             	add    $0x10,%esp
c000824e:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008252:	83 c8 04             	or     $0x4,%eax
c0008255:	0f b6 c0             	movzbl %al,%eax
c0008258:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c000825c:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008260:	83 c8 0c             	or     $0xc,%eax
c0008263:	0f b6 c0             	movzbl %al,%eax
c0008266:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c000826a:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c000826e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008271:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008277:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000827b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000827e:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c0008284:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008288:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000828b:	89 90 6c 02 00 00    	mov    %edx,0x26c(%eax)
c0008291:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008295:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008298:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c000829e:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00082a2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082a5:	89 90 a8 02 00 00    	mov    %edx,0x2a8(%eax)
c00082ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082ae:	c7 80 68 02 00 00 39 	movl   $0x39,0x268(%eax)
c00082b5:	00 00 00 
c00082b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00082bb:	8b 50 14             	mov    0x14(%eax),%edx
c00082be:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082c1:	89 90 98 02 00 00    	mov    %edx,0x298(%eax)
c00082c7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082ca:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00082cd:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00082d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082d6:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00082dd:	00 00 00 
c00082e0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082e3:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c00082ea:	00 00 00 
c00082ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082f0:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00082f7:	00 00 00 
c00082fa:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082fd:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0008304:	00 00 00 
c0008307:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000830a:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0008311:	00 00 00 
c0008314:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008317:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c000831e:	00 00 00 
c0008321:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008324:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000832a:	8d 90 00 33 08 c0    	lea    -0x3ff7cd00(%eax),%edx
c0008330:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008333:	89 c3                	mov    %eax,%ebx
c0008335:	b8 ab 00 00 00       	mov    $0xab,%eax
c000833a:	89 d7                	mov    %edx,%edi
c000833c:	89 de                	mov    %ebx,%esi
c000833e:	89 c1                	mov    %eax,%ecx
c0008340:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008342:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008346:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000834a:	0f 8e f5 fd ff ff    	jle    c0008145 <kernel_main2+0x4f>
c0008350:	c7 05 60 fb 00 c0 00 	movl   $0xc0083300,0xc000fb60
c0008357:	33 08 c0 
c000835a:	eb fe                	jmp    c000835a <kernel_main2+0x264>

c000835c <TestFS>:
c000835c:	55                   	push   %ebp
c000835d:	89 e5                	mov    %esp,%ebp
c000835f:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c0008365:	83 ec 0c             	sub    $0xc,%esp
c0008368:	68 c1 aa 00 c0       	push   $0xc000aac1
c000836d:	e8 1a 92 ff ff       	call   c000158c <disp_str>
c0008372:	83 c4 10             	add    $0x10,%esp
c0008375:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c000837c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008383:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008389:	83 ec 08             	sub    $0x8,%esp
c000838c:	6a 02                	push   $0x2
c000838e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008391:	50                   	push   %eax
c0008392:	e8 26 d8 ff ff       	call   c0005bbd <open>
c0008397:	83 c4 10             	add    $0x10,%esp
c000839a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000839d:	83 ec 08             	sub    $0x8,%esp
c00083a0:	6a 02                	push   $0x2
c00083a2:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c00083a5:	50                   	push   %eax
c00083a6:	e8 12 d8 ff ff       	call   c0005bbd <open>
c00083ab:	83 c4 10             	add    $0x10,%esp
c00083ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00083b1:	83 ec 0c             	sub    $0xc,%esp
c00083b4:	68 c9 aa 00 c0       	push   $0xc000aac9
c00083b9:	e8 41 0a 00 00       	call   c0008dff <Printf>
c00083be:	83 c4 10             	add    $0x10,%esp
c00083c1:	90                   	nop
c00083c2:	c9                   	leave  
c00083c3:	c3                   	ret    

c00083c4 <wait_exit>:
c00083c4:	55                   	push   %ebp
c00083c5:	89 e5                	mov    %esp,%ebp
c00083c7:	83 ec 28             	sub    $0x28,%esp
c00083ca:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c00083d1:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c00083d8:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c00083de:	83 ec 08             	sub    $0x8,%esp
c00083e1:	6a 02                	push   $0x2
c00083e3:	8d 45 de             	lea    -0x22(%ebp),%eax
c00083e6:	50                   	push   %eax
c00083e7:	e8 d1 d7 ff ff       	call   c0005bbd <open>
c00083ec:	83 c4 10             	add    $0x10,%esp
c00083ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00083f2:	83 ec 08             	sub    $0x8,%esp
c00083f5:	6a 02                	push   $0x2
c00083f7:	8d 45 de             	lea    -0x22(%ebp),%eax
c00083fa:	50                   	push   %eax
c00083fb:	e8 bd d7 ff ff       	call   c0005bbd <open>
c0008400:	83 c4 10             	add    $0x10,%esp
c0008403:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008406:	e8 d2 d9 ff ff       	call   c0005ddd <fork>
c000840b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000840e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0008412:	7e 25                	jle    c0008439 <wait_exit+0x75>
c0008414:	83 ec 0c             	sub    $0xc,%esp
c0008417:	8d 45 d8             	lea    -0x28(%ebp),%eax
c000841a:	50                   	push   %eax
c000841b:	e8 56 d9 ff ff       	call   c0005d76 <wait>
c0008420:	83 c4 10             	add    $0x10,%esp
c0008423:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008426:	83 ec 08             	sub    $0x8,%esp
c0008429:	50                   	push   %eax
c000842a:	68 db aa 00 c0       	push   $0xc000aadb
c000842f:	e8 cb 09 00 00       	call   c0008dff <Printf>
c0008434:	83 c4 10             	add    $0x10,%esp
c0008437:	eb fe                	jmp    c0008437 <wait_exit+0x73>
c0008439:	83 ec 0c             	sub    $0xc,%esp
c000843c:	68 f6 aa 00 c0       	push   $0xc000aaf6
c0008441:	e8 b9 09 00 00       	call   c0008dff <Printf>
c0008446:	83 c4 10             	add    $0x10,%esp
c0008449:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008450:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008453:	8d 50 01             	lea    0x1(%eax),%edx
c0008456:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008459:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c000845e:	7f 02                	jg     c0008462 <wait_exit+0x9e>
c0008460:	eb ee                	jmp    c0008450 <wait_exit+0x8c>
c0008462:	90                   	nop
c0008463:	83 ec 0c             	sub    $0xc,%esp
c0008466:	68 02 ab 00 c0       	push   $0xc000ab02
c000846b:	e8 8f 09 00 00       	call   c0008dff <Printf>
c0008470:	83 c4 10             	add    $0x10,%esp
c0008473:	83 ec 0c             	sub    $0xc,%esp
c0008476:	6a 09                	push   $0x9
c0008478:	e8 37 d9 ff ff       	call   c0005db4 <exit>
c000847d:	83 c4 10             	add    $0x10,%esp
c0008480:	83 ec 0c             	sub    $0xc,%esp
c0008483:	68 10 ab 00 c0       	push   $0xc000ab10
c0008488:	e8 72 09 00 00       	call   c0008dff <Printf>
c000848d:	83 c4 10             	add    $0x10,%esp
c0008490:	eb fe                	jmp    c0008490 <wait_exit+0xcc>

c0008492 <INIT_fork>:
c0008492:	55                   	push   %ebp
c0008493:	89 e5                	mov    %esp,%ebp
c0008495:	53                   	push   %ebx
c0008496:	81 ec 84 00 00 00    	sub    $0x84,%esp
c000849c:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c00084a3:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c00084aa:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c00084b0:	83 ec 08             	sub    $0x8,%esp
c00084b3:	6a 02                	push   $0x2
c00084b5:	8d 45 da             	lea    -0x26(%ebp),%eax
c00084b8:	50                   	push   %eax
c00084b9:	e8 ff d6 ff ff       	call   c0005bbd <open>
c00084be:	83 c4 10             	add    $0x10,%esp
c00084c1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00084c4:	83 ec 08             	sub    $0x8,%esp
c00084c7:	6a 02                	push   $0x2
c00084c9:	8d 45 da             	lea    -0x26(%ebp),%eax
c00084cc:	50                   	push   %eax
c00084cd:	e8 eb d6 ff ff       	call   c0005bbd <open>
c00084d2:	83 c4 10             	add    $0x10,%esp
c00084d5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00084d8:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c00084df:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c00084e6:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c00084ed:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c00084f4:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c00084fb:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c0008502:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c0008509:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c0008510:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c0008517:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c000851e:	83 ec 0c             	sub    $0xc,%esp
c0008521:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008524:	50                   	push   %eax
c0008525:	e8 b2 29 00 00       	call   c000aedc <Strlen>
c000852a:	83 c4 10             	add    $0x10,%esp
c000852d:	83 ec 04             	sub    $0x4,%esp
c0008530:	50                   	push   %eax
c0008531:	6a 00                	push   $0x0
c0008533:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008536:	50                   	push   %eax
c0008537:	e8 67 29 00 00       	call   c000aea3 <Memset>
c000853c:	83 c4 10             	add    $0x10,%esp
c000853f:	83 ec 04             	sub    $0x4,%esp
c0008542:	6a 28                	push   $0x28
c0008544:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008547:	50                   	push   %eax
c0008548:	ff 75 e8             	pushl  -0x18(%ebp)
c000854b:	e8 f2 d6 ff ff       	call   c0005c42 <read>
c0008550:	83 c4 10             	add    $0x10,%esp
c0008553:	83 ec 04             	sub    $0x4,%esp
c0008556:	6a 28                	push   $0x28
c0008558:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c000855b:	50                   	push   %eax
c000855c:	ff 75 ec             	pushl  -0x14(%ebp)
c000855f:	e8 52 d7 ff ff       	call   c0005cb6 <write>
c0008564:	83 c4 10             	add    $0x10,%esp
c0008567:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000856e:	e8 6a d8 ff ff       	call   c0005ddd <fork>
c0008573:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008576:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c000857a:	0f 8e dd 00 00 00    	jle    c000865d <INIT_fork+0x1cb>
c0008580:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008584:	c7 85 7f ff ff ff 50 	movl   $0x65726150,-0x81(%ebp)
c000858b:	61 72 65 
c000858e:	c7 45 83 6e 74 0a 00 	movl   $0xa746e,-0x7d(%ebp)
c0008595:	8d 45 87             	lea    -0x79(%ebp),%eax
c0008598:	b9 20 00 00 00       	mov    $0x20,%ecx
c000859d:	bb 00 00 00 00       	mov    $0x0,%ebx
c00085a2:	89 18                	mov    %ebx,(%eax)
c00085a4:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c00085a8:	8d 50 04             	lea    0x4(%eax),%edx
c00085ab:	83 e2 fc             	and    $0xfffffffc,%edx
c00085ae:	29 d0                	sub    %edx,%eax
c00085b0:	01 c1                	add    %eax,%ecx
c00085b2:	83 e1 fc             	and    $0xfffffffc,%ecx
c00085b5:	83 e1 fc             	and    $0xfffffffc,%ecx
c00085b8:	b8 00 00 00 00       	mov    $0x0,%eax
c00085bd:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c00085c0:	83 c0 04             	add    $0x4,%eax
c00085c3:	39 c8                	cmp    %ecx,%eax
c00085c5:	72 f6                	jb     c00085bd <INIT_fork+0x12b>
c00085c7:	01 c2                	add    %eax,%edx
c00085c9:	83 ec 0c             	sub    $0xc,%esp
c00085cc:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00085d2:	50                   	push   %eax
c00085d3:	e8 04 29 00 00       	call   c000aedc <Strlen>
c00085d8:	83 c4 10             	add    $0x10,%esp
c00085db:	83 ec 04             	sub    $0x4,%esp
c00085de:	50                   	push   %eax
c00085df:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00085e5:	50                   	push   %eax
c00085e6:	ff 75 ec             	pushl  -0x14(%ebp)
c00085e9:	e8 c8 d6 ff ff       	call   c0005cb6 <write>
c00085ee:	83 c4 10             	add    $0x10,%esp
c00085f1:	83 ec 0c             	sub    $0xc,%esp
c00085f4:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00085fa:	50                   	push   %eax
c00085fb:	e8 dc 28 00 00       	call   c000aedc <Strlen>
c0008600:	83 c4 10             	add    $0x10,%esp
c0008603:	83 ec 04             	sub    $0x4,%esp
c0008606:	50                   	push   %eax
c0008607:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c000860d:	50                   	push   %eax
c000860e:	ff 75 ec             	pushl  -0x14(%ebp)
c0008611:	e8 a0 d6 ff ff       	call   c0005cb6 <write>
c0008616:	83 c4 10             	add    $0x10,%esp
c0008619:	83 ec 0c             	sub    $0xc,%esp
c000861c:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008622:	50                   	push   %eax
c0008623:	e8 b4 28 00 00       	call   c000aedc <Strlen>
c0008628:	83 c4 10             	add    $0x10,%esp
c000862b:	83 ec 04             	sub    $0x4,%esp
c000862e:	50                   	push   %eax
c000862f:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008635:	50                   	push   %eax
c0008636:	ff 75 ec             	pushl  -0x14(%ebp)
c0008639:	e8 78 d6 ff ff       	call   c0005cb6 <write>
c000863e:	83 c4 10             	add    $0x10,%esp
c0008641:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008648:	eb 08                	jmp    c0008652 <INIT_fork+0x1c0>
c000864a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000864e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008652:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c0008656:	7e f2                	jle    c000864a <INIT_fork+0x1b8>
c0008658:	e9 0f 01 00 00       	jmp    c000876c <INIT_fork+0x2da>
c000865d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008661:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c0008665:	c7 85 7f ff ff ff 43 	movl   $0x6c696843,-0x81(%ebp)
c000866c:	68 69 6c 
c000866f:	c7 45 83 64 0a 00 00 	movl   $0xa64,-0x7d(%ebp)
c0008676:	8d 45 87             	lea    -0x79(%ebp),%eax
c0008679:	b9 20 00 00 00       	mov    $0x20,%ecx
c000867e:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008683:	89 18                	mov    %ebx,(%eax)
c0008685:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008689:	8d 50 04             	lea    0x4(%eax),%edx
c000868c:	83 e2 fc             	and    $0xfffffffc,%edx
c000868f:	29 d0                	sub    %edx,%eax
c0008691:	01 c1                	add    %eax,%ecx
c0008693:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008696:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008699:	b8 00 00 00 00       	mov    $0x0,%eax
c000869e:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c00086a1:	83 c0 04             	add    $0x4,%eax
c00086a4:	39 c8                	cmp    %ecx,%eax
c00086a6:	72 f6                	jb     c000869e <INIT_fork+0x20c>
c00086a8:	01 c2                	add    %eax,%edx
c00086aa:	83 ec 0c             	sub    $0xc,%esp
c00086ad:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00086b3:	50                   	push   %eax
c00086b4:	e8 23 28 00 00       	call   c000aedc <Strlen>
c00086b9:	83 c4 10             	add    $0x10,%esp
c00086bc:	83 ec 04             	sub    $0x4,%esp
c00086bf:	50                   	push   %eax
c00086c0:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00086c6:	50                   	push   %eax
c00086c7:	ff 75 ec             	pushl  -0x14(%ebp)
c00086ca:	e8 e7 d5 ff ff       	call   c0005cb6 <write>
c00086cf:	83 c4 10             	add    $0x10,%esp
c00086d2:	83 ec 0c             	sub    $0xc,%esp
c00086d5:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00086db:	50                   	push   %eax
c00086dc:	e8 fb 27 00 00       	call   c000aedc <Strlen>
c00086e1:	83 c4 10             	add    $0x10,%esp
c00086e4:	83 ec 04             	sub    $0x4,%esp
c00086e7:	50                   	push   %eax
c00086e8:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c00086ee:	50                   	push   %eax
c00086ef:	ff 75 ec             	pushl  -0x14(%ebp)
c00086f2:	e8 bf d5 ff ff       	call   c0005cb6 <write>
c00086f7:	83 c4 10             	add    $0x10,%esp
c00086fa:	83 ec 0c             	sub    $0xc,%esp
c00086fd:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008703:	50                   	push   %eax
c0008704:	e8 d3 27 00 00       	call   c000aedc <Strlen>
c0008709:	83 c4 10             	add    $0x10,%esp
c000870c:	83 ec 04             	sub    $0x4,%esp
c000870f:	50                   	push   %eax
c0008710:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
c0008716:	50                   	push   %eax
c0008717:	ff 75 ec             	pushl  -0x14(%ebp)
c000871a:	e8 97 d5 ff ff       	call   c0005cb6 <write>
c000871f:	83 c4 10             	add    $0x10,%esp
c0008722:	c7 45 a7 43 68 69 6c 	movl   $0x6c696843,-0x59(%ebp)
c0008729:	c7 45 ab 64 20 6a 20 	movl   $0x206a2064,-0x55(%ebp)
c0008730:	66 c7 45 af 3d 20    	movw   $0x203d,-0x51(%ebp)
c0008736:	c6 45 b1 00          	movb   $0x0,-0x4f(%ebp)
c000873a:	83 ec 0c             	sub    $0xc,%esp
c000873d:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0008740:	50                   	push   %eax
c0008741:	e8 96 27 00 00       	call   c000aedc <Strlen>
c0008746:	83 c4 10             	add    $0x10,%esp
c0008749:	83 ec 04             	sub    $0x4,%esp
c000874c:	50                   	push   %eax
c000874d:	8d 45 a7             	lea    -0x59(%ebp),%eax
c0008750:	50                   	push   %eax
c0008751:	ff 75 ec             	pushl  -0x14(%ebp)
c0008754:	e8 5d d5 ff ff       	call   c0005cb6 <write>
c0008759:	83 c4 10             	add    $0x10,%esp
c000875c:	83 ec 0c             	sub    $0xc,%esp
c000875f:	68 1e ab 00 c0       	push   $0xc000ab1e
c0008764:	e8 c6 09 00 00       	call   c000912f <spin>
c0008769:	83 c4 10             	add    $0x10,%esp
c000876c:	83 ec 0c             	sub    $0xc,%esp
c000876f:	68 25 ab 00 c0       	push   $0xc000ab25
c0008774:	e8 b6 09 00 00       	call   c000912f <spin>
c0008779:	83 c4 10             	add    $0x10,%esp
c000877c:	90                   	nop
c000877d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0008780:	c9                   	leave  
c0008781:	c3                   	ret    

c0008782 <simple_shell>:
c0008782:	55                   	push   %ebp
c0008783:	89 e5                	mov    %esp,%ebp
c0008785:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c000878b:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008792:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008799:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c000879f:	83 ec 08             	sub    $0x8,%esp
c00087a2:	6a 02                	push   $0x2
c00087a4:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c00087a7:	50                   	push   %eax
c00087a8:	e8 10 d4 ff ff       	call   c0005bbd <open>
c00087ad:	83 c4 10             	add    $0x10,%esp
c00087b0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00087b3:	83 ec 08             	sub    $0x8,%esp
c00087b6:	6a 02                	push   $0x2
c00087b8:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c00087bb:	50                   	push   %eax
c00087bc:	e8 fc d3 ff ff       	call   c0005bbd <open>
c00087c1:	83 c4 10             	add    $0x10,%esp
c00087c4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00087c7:	83 ec 04             	sub    $0x4,%esp
c00087ca:	68 80 00 00 00       	push   $0x80
c00087cf:	6a 00                	push   $0x0
c00087d1:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00087d7:	50                   	push   %eax
c00087d8:	e8 c6 26 00 00       	call   c000aea3 <Memset>
c00087dd:	83 c4 10             	add    $0x10,%esp
c00087e0:	83 ec 04             	sub    $0x4,%esp
c00087e3:	68 80 00 00 00       	push   $0x80
c00087e8:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00087ee:	50                   	push   %eax
c00087ef:	ff 75 e0             	pushl  -0x20(%ebp)
c00087f2:	e8 4b d4 ff ff       	call   c0005c42 <read>
c00087f7:	83 c4 10             	add    $0x10,%esp
c00087fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008801:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008808:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000880e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008811:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008814:	0f b6 00             	movzbl (%eax),%eax
c0008817:	88 45 db             	mov    %al,-0x25(%ebp)
c000881a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000881d:	0f b6 00             	movzbl (%eax),%eax
c0008820:	3c 20                	cmp    $0x20,%al
c0008822:	74 1d                	je     c0008841 <simple_shell+0xbf>
c0008824:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008827:	0f b6 00             	movzbl (%eax),%eax
c000882a:	84 c0                	test   %al,%al
c000882c:	74 13                	je     c0008841 <simple_shell+0xbf>
c000882e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008832:	75 0d                	jne    c0008841 <simple_shell+0xbf>
c0008834:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008837:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000883a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008841:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008844:	0f b6 00             	movzbl (%eax),%eax
c0008847:	3c 20                	cmp    $0x20,%al
c0008849:	74 0a                	je     c0008855 <simple_shell+0xd3>
c000884b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000884e:	0f b6 00             	movzbl (%eax),%eax
c0008851:	84 c0                	test   %al,%al
c0008853:	75 26                	jne    c000887b <simple_shell+0xf9>
c0008855:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008859:	75 20                	jne    c000887b <simple_shell+0xf9>
c000885b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000885e:	8d 50 01             	lea    0x1(%eax),%edx
c0008861:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008864:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008867:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c000886e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008871:	c6 00 00             	movb   $0x0,(%eax)
c0008874:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000887b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000887f:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008883:	75 8c                	jne    c0008811 <simple_shell+0x8f>
c0008885:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008888:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c000888f:	00 00 00 00 
c0008893:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c000889a:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00088a0:	83 ec 08             	sub    $0x8,%esp
c00088a3:	6a 02                	push   $0x2
c00088a5:	50                   	push   %eax
c00088a6:	e8 12 d3 ff ff       	call   c0005bbd <open>
c00088ab:	83 c4 10             	add    $0x10,%esp
c00088ae:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00088b1:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c00088b5:	75 54                	jne    c000890b <simple_shell+0x189>
c00088b7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00088be:	eb 29                	jmp    c00088e9 <simple_shell+0x167>
c00088c0:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c00088c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00088c9:	01 d0                	add    %edx,%eax
c00088cb:	0f b6 00             	movzbl (%eax),%eax
c00088ce:	0f be c0             	movsbl %al,%eax
c00088d1:	83 ec 04             	sub    $0x4,%esp
c00088d4:	50                   	push   %eax
c00088d5:	ff 75 e4             	pushl  -0x1c(%ebp)
c00088d8:	68 2d ab 00 c0       	push   $0xc000ab2d
c00088dd:	e8 1d 05 00 00       	call   c0008dff <Printf>
c00088e2:	83 c4 10             	add    $0x10,%esp
c00088e5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00088e9:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c00088ed:	7e d1                	jle    c00088c0 <simple_shell+0x13e>
c00088ef:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00088f5:	83 ec 08             	sub    $0x8,%esp
c00088f8:	50                   	push   %eax
c00088f9:	68 34 ab 00 c0       	push   $0xc000ab34
c00088fe:	e8 fc 04 00 00       	call   c0008dff <Printf>
c0008903:	83 c4 10             	add    $0x10,%esp
c0008906:	e9 bc fe ff ff       	jmp    c00087c7 <simple_shell+0x45>
c000890b:	e8 cd d4 ff ff       	call   c0005ddd <fork>
c0008910:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008913:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008917:	7e 17                	jle    c0008930 <simple_shell+0x1ae>
c0008919:	83 ec 0c             	sub    $0xc,%esp
c000891c:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008922:	50                   	push   %eax
c0008923:	e8 4e d4 ff ff       	call   c0005d76 <wait>
c0008928:	83 c4 10             	add    $0x10,%esp
c000892b:	e9 97 fe ff ff       	jmp    c00087c7 <simple_shell+0x45>
c0008930:	83 ec 0c             	sub    $0xc,%esp
c0008933:	ff 75 d0             	pushl  -0x30(%ebp)
c0008936:	e8 ef d3 ff ff       	call   c0005d2a <close>
c000893b:	83 c4 10             	add    $0x10,%esp
c000893e:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008944:	83 ec 08             	sub    $0x8,%esp
c0008947:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c000894d:	52                   	push   %edx
c000894e:	50                   	push   %eax
c000894f:	e8 78 d5 ff ff       	call   c0005ecc <execv>
c0008954:	83 c4 10             	add    $0x10,%esp
c0008957:	eb fe                	jmp    c0008957 <simple_shell+0x1d5>

c0008959 <test_split_str>:
c0008959:	55                   	push   %ebp
c000895a:	89 e5                	mov    %esp,%ebp
c000895c:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008962:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008969:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008970:	c7 45 ec 3a ab 00 c0 	movl   $0xc000ab3a,-0x14(%ebp)
c0008977:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000897b:	75 1a                	jne    c0008997 <test_split_str+0x3e>
c000897d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008980:	0f b6 00             	movzbl (%eax),%eax
c0008983:	0f be c0             	movsbl %al,%eax
c0008986:	83 ec 08             	sub    $0x8,%esp
c0008989:	50                   	push   %eax
c000898a:	68 4b ab 00 c0       	push   $0xc000ab4b
c000898f:	e8 6b 04 00 00       	call   c0008dff <Printf>
c0008994:	83 c4 10             	add    $0x10,%esp
c0008997:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000899a:	0f b6 00             	movzbl (%eax),%eax
c000899d:	3c 20                	cmp    $0x20,%al
c000899f:	75 0a                	jne    c00089ab <test_split_str+0x52>
c00089a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089a4:	0f b6 00             	movzbl (%eax),%eax
c00089a7:	84 c0                	test   %al,%al
c00089a9:	74 13                	je     c00089be <test_split_str+0x65>
c00089ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00089af:	75 0d                	jne    c00089be <test_split_str+0x65>
c00089b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00089b7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00089be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089c1:	0f b6 00             	movzbl (%eax),%eax
c00089c4:	3c 20                	cmp    $0x20,%al
c00089c6:	74 0a                	je     c00089d2 <test_split_str+0x79>
c00089c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089cb:	0f b6 00             	movzbl (%eax),%eax
c00089ce:	84 c0                	test   %al,%al
c00089d0:	75 26                	jne    c00089f8 <test_split_str+0x9f>
c00089d2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00089d6:	75 20                	jne    c00089f8 <test_split_str+0x9f>
c00089d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00089db:	8d 50 01             	lea    0x1(%eax),%edx
c00089de:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00089e1:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00089e4:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c00089eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089ee:	c6 00 00             	movb   $0x0,(%eax)
c00089f1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00089f8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00089fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00089ff:	0f b6 00             	movzbl (%eax),%eax
c0008a02:	84 c0                	test   %al,%al
c0008a04:	0f 85 6d ff ff ff    	jne    c0008977 <test_split_str+0x1e>
c0008a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a0d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008a10:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008a17:	83 ec 08             	sub    $0x8,%esp
c0008a1a:	ff 75 f4             	pushl  -0xc(%ebp)
c0008a1d:	68 54 ab 00 c0       	push   $0xc000ab54
c0008a22:	e8 d8 03 00 00       	call   c0008dff <Printf>
c0008a27:	83 c4 10             	add    $0x10,%esp
c0008a2a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008a31:	eb 22                	jmp    c0008a55 <test_split_str+0xfc>
c0008a33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008a36:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008a3d:	83 ec 04             	sub    $0x4,%esp
c0008a40:	50                   	push   %eax
c0008a41:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008a44:	68 6b ab 00 c0       	push   $0xc000ab6b
c0008a49:	e8 b1 03 00 00       	call   c0008dff <Printf>
c0008a4e:	83 c4 10             	add    $0x10,%esp
c0008a51:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008a55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008a58:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0008a5b:	7e d6                	jle    c0008a33 <test_split_str+0xda>
c0008a5d:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008a63:	83 ec 08             	sub    $0x8,%esp
c0008a66:	68 7a ab 00 c0       	push   $0xc000ab7a
c0008a6b:	50                   	push   %eax
c0008a6c:	e8 7f 12 00 00       	call   c0009cf0 <strcmp>
c0008a71:	83 c4 10             	add    $0x10,%esp
c0008a74:	85 c0                	test   %eax,%eax
c0008a76:	75 10                	jne    c0008a88 <test_split_str+0x12f>
c0008a78:	83 ec 0c             	sub    $0xc,%esp
c0008a7b:	68 7f ab 00 c0       	push   $0xc000ab7f
c0008a80:	e8 7a 03 00 00       	call   c0008dff <Printf>
c0008a85:	83 c4 10             	add    $0x10,%esp
c0008a88:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008a8e:	83 ec 08             	sub    $0x8,%esp
c0008a91:	50                   	push   %eax
c0008a92:	68 8b ab 00 c0       	push   $0xc000ab8b
c0008a97:	e8 63 03 00 00       	call   c0008dff <Printf>
c0008a9c:	83 c4 10             	add    $0x10,%esp
c0008a9f:	83 ec 0c             	sub    $0xc,%esp
c0008aa2:	68 99 ab 00 c0       	push   $0xc000ab99
c0008aa7:	e8 53 03 00 00       	call   c0008dff <Printf>
c0008aac:	83 c4 10             	add    $0x10,%esp
c0008aaf:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008ab6:	eb 26                	jmp    c0008ade <test_split_str+0x185>
c0008ab8:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008abe:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008ac1:	01 d0                	add    %edx,%eax
c0008ac3:	0f b6 00             	movzbl (%eax),%eax
c0008ac6:	0f be c0             	movsbl %al,%eax
c0008ac9:	83 ec 08             	sub    $0x8,%esp
c0008acc:	50                   	push   %eax
c0008acd:	68 a8 ab 00 c0       	push   $0xc000aba8
c0008ad2:	e8 28 03 00 00       	call   c0008dff <Printf>
c0008ad7:	83 c4 10             	add    $0x10,%esp
c0008ada:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008ade:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0008ae2:	7e d4                	jle    c0008ab8 <test_split_str+0x15f>
c0008ae4:	c9                   	leave  
c0008ae5:	c3                   	ret    

c0008ae6 <test_shell>:
c0008ae6:	55                   	push   %ebp
c0008ae7:	89 e5                	mov    %esp,%ebp
c0008ae9:	83 ec 48             	sub    $0x48,%esp
c0008aec:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c0008af3:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0008afa:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0008b00:	83 ec 08             	sub    $0x8,%esp
c0008b03:	6a 02                	push   $0x2
c0008b05:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c0008b08:	50                   	push   %eax
c0008b09:	e8 af d0 ff ff       	call   c0005bbd <open>
c0008b0e:	83 c4 10             	add    $0x10,%esp
c0008b11:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008b14:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0008b1b:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0008b22:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0008b29:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008b30:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008b37:	83 ec 0c             	sub    $0xc,%esp
c0008b3a:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0008b3d:	50                   	push   %eax
c0008b3e:	e8 4e eb ff ff       	call   c0007691 <untar>
c0008b43:	83 c4 10             	add    $0x10,%esp
c0008b46:	e8 92 d2 ff ff       	call   c0005ddd <fork>
c0008b4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008b4e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008b52:	7e 25                	jle    c0008b79 <test_shell+0x93>
c0008b54:	83 ec 0c             	sub    $0xc,%esp
c0008b57:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0008b5a:	50                   	push   %eax
c0008b5b:	e8 16 d2 ff ff       	call   c0005d76 <wait>
c0008b60:	83 c4 10             	add    $0x10,%esp
c0008b63:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008b66:	83 ec 08             	sub    $0x8,%esp
c0008b69:	50                   	push   %eax
c0008b6a:	68 b1 ab 00 c0       	push   $0xc000abb1
c0008b6f:	e8 8b 02 00 00       	call   c0008dff <Printf>
c0008b74:	83 c4 10             	add    $0x10,%esp
c0008b77:	eb 23                	jmp    c0008b9c <test_shell+0xb6>
c0008b79:	83 ec 0c             	sub    $0xc,%esp
c0008b7c:	68 c3 ab 00 c0       	push   $0xc000abc3
c0008b81:	e8 79 02 00 00       	call   c0008dff <Printf>
c0008b86:	83 c4 10             	add    $0x10,%esp
c0008b89:	83 ec 0c             	sub    $0xc,%esp
c0008b8c:	ff 75 f4             	pushl  -0xc(%ebp)
c0008b8f:	e8 96 d1 ff ff       	call   c0005d2a <close>
c0008b94:	83 c4 10             	add    $0x10,%esp
c0008b97:	e8 e6 fb ff ff       	call   c0008782 <simple_shell>
c0008b9c:	83 ec 0c             	sub    $0xc,%esp
c0008b9f:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0008ba2:	50                   	push   %eax
c0008ba3:	e8 ce d1 ff ff       	call   c0005d76 <wait>
c0008ba8:	83 c4 10             	add    $0x10,%esp
c0008bab:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008bae:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008bb1:	83 ec 08             	sub    $0x8,%esp
c0008bb4:	50                   	push   %eax
c0008bb5:	68 d1 ab 00 c0       	push   $0xc000abd1
c0008bba:	e8 40 02 00 00       	call   c0008dff <Printf>
c0008bbf:	83 c4 10             	add    $0x10,%esp
c0008bc2:	eb d8                	jmp    c0008b9c <test_shell+0xb6>

c0008bc4 <test_exec>:
c0008bc4:	55                   	push   %ebp
c0008bc5:	89 e5                	mov    %esp,%ebp
c0008bc7:	83 ec 38             	sub    $0x38,%esp
c0008bca:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008bd1:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008bd8:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008bde:	83 ec 08             	sub    $0x8,%esp
c0008be1:	6a 02                	push   $0x2
c0008be3:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008be6:	50                   	push   %eax
c0008be7:	e8 d1 cf ff ff       	call   c0005bbd <open>
c0008bec:	83 c4 10             	add    $0x10,%esp
c0008bef:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008bf2:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0008bf9:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0008c00:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0008c07:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008c0e:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0008c15:	83 ec 0c             	sub    $0xc,%esp
c0008c18:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0008c1b:	50                   	push   %eax
c0008c1c:	e8 70 ea ff ff       	call   c0007691 <untar>
c0008c21:	83 c4 10             	add    $0x10,%esp
c0008c24:	e8 b4 d1 ff ff       	call   c0005ddd <fork>
c0008c29:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008c2c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008c30:	7e 25                	jle    c0008c57 <test_exec+0x93>
c0008c32:	83 ec 0c             	sub    $0xc,%esp
c0008c35:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0008c38:	50                   	push   %eax
c0008c39:	e8 38 d1 ff ff       	call   c0005d76 <wait>
c0008c3e:	83 c4 10             	add    $0x10,%esp
c0008c41:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008c44:	83 ec 08             	sub    $0x8,%esp
c0008c47:	50                   	push   %eax
c0008c48:	68 b1 ab 00 c0       	push   $0xc000abb1
c0008c4d:	e8 ad 01 00 00       	call   c0008dff <Printf>
c0008c52:	83 c4 10             	add    $0x10,%esp
c0008c55:	eb 33                	jmp    c0008c8a <test_exec+0xc6>
c0008c57:	83 ec 0c             	sub    $0xc,%esp
c0008c5a:	68 c3 ab 00 c0       	push   $0xc000abc3
c0008c5f:	e8 9b 01 00 00       	call   c0008dff <Printf>
c0008c64:	83 c4 10             	add    $0x10,%esp
c0008c67:	83 ec 0c             	sub    $0xc,%esp
c0008c6a:	6a 00                	push   $0x0
c0008c6c:	68 ec ab 00 c0       	push   $0xc000abec
c0008c71:	68 f2 ab 00 c0       	push   $0xc000abf2
c0008c76:	68 7a ab 00 c0       	push   $0xc000ab7a
c0008c7b:	68 f8 ab 00 c0       	push   $0xc000abf8
c0008c80:	e8 ec d3 ff ff       	call   c0006071 <execl>
c0008c85:	83 c4 20             	add    $0x20,%esp
c0008c88:	eb fe                	jmp    c0008c88 <test_exec+0xc4>
c0008c8a:	c9                   	leave  
c0008c8b:	c3                   	ret    

c0008c8c <INIT>:
c0008c8c:	55                   	push   %ebp
c0008c8d:	89 e5                	mov    %esp,%ebp
c0008c8f:	83 ec 08             	sub    $0x8,%esp
c0008c92:	e8 4f fe ff ff       	call   c0008ae6 <test_shell>
c0008c97:	eb fe                	jmp    c0008c97 <INIT+0xb>

c0008c99 <TestA>:
c0008c99:	55                   	push   %ebp
c0008c9a:	89 e5                	mov    %esp,%ebp
c0008c9c:	83 ec 08             	sub    $0x8,%esp
c0008c9f:	83 ec 0c             	sub    $0xc,%esp
c0008ca2:	6a 05                	push   $0x5
c0008ca4:	e8 98 ec ff ff       	call   c0007941 <disp_int>
c0008ca9:	83 c4 10             	add    $0x10,%esp
c0008cac:	83 ec 0c             	sub    $0xc,%esp
c0008caf:	68 74 a7 00 c0       	push   $0xc000a774
c0008cb4:	e8 d3 88 ff ff       	call   c000158c <disp_str>
c0008cb9:	83 c4 10             	add    $0x10,%esp
c0008cbc:	83 ec 0c             	sub    $0xc,%esp
c0008cbf:	68 fe ab 00 c0       	push   $0xc000abfe
c0008cc4:	e8 c3 88 ff ff       	call   c000158c <disp_str>
c0008cc9:	83 c4 10             	add    $0x10,%esp
c0008ccc:	eb fe                	jmp    c0008ccc <TestA+0x33>

c0008cce <delay>:
c0008cce:	55                   	push   %ebp
c0008ccf:	89 e5                	mov    %esp,%ebp
c0008cd1:	83 ec 10             	sub    $0x10,%esp
c0008cd4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008cdb:	eb 2d                	jmp    c0008d0a <delay+0x3c>
c0008cdd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0008ce4:	eb 1a                	jmp    c0008d00 <delay+0x32>
c0008ce6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008ced:	eb 04                	jmp    c0008cf3 <delay+0x25>
c0008cef:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008cf3:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c0008cfa:	7e f3                	jle    c0008cef <delay+0x21>
c0008cfc:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008d00:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0008d04:	7e e0                	jle    c0008ce6 <delay+0x18>
c0008d06:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008d0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008d0d:	3b 45 08             	cmp    0x8(%ebp),%eax
c0008d10:	7c cb                	jl     c0008cdd <delay+0xf>
c0008d12:	90                   	nop
c0008d13:	c9                   	leave  
c0008d14:	c3                   	ret    

c0008d15 <TestB>:
c0008d15:	55                   	push   %ebp
c0008d16:	89 e5                	mov    %esp,%ebp
c0008d18:	83 ec 08             	sub    $0x8,%esp
c0008d1b:	83 ec 0c             	sub    $0xc,%esp
c0008d1e:	68 05 ac 00 c0       	push   $0xc000ac05
c0008d23:	e8 64 88 ff ff       	call   c000158c <disp_str>
c0008d28:	83 c4 10             	add    $0x10,%esp
c0008d2b:	eb fe                	jmp    c0008d2b <TestB+0x16>

c0008d2d <TestC>:
c0008d2d:	55                   	push   %ebp
c0008d2e:	89 e5                	mov    %esp,%ebp
c0008d30:	83 ec 18             	sub    $0x18,%esp
c0008d33:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008d3a:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008d3e:	77 1a                	ja     c0008d5a <TestC+0x2d>
c0008d40:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0008d47:	83 ec 08             	sub    $0x8,%esp
c0008d4a:	ff 75 f0             	pushl  -0x10(%ebp)
c0008d4d:	68 08 ac 00 c0       	push   $0xc000ac08
c0008d52:	e8 a8 00 00 00       	call   c0008dff <Printf>
c0008d57:	83 c4 10             	add    $0x10,%esp
c0008d5a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008d5e:	eb da                	jmp    c0008d3a <TestC+0xd>

c0008d60 <sys_get_ticks>:
c0008d60:	55                   	push   %ebp
c0008d61:	89 e5                	mov    %esp,%ebp
c0008d63:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008d68:	5d                   	pop    %ebp
c0008d69:	c3                   	ret    

c0008d6a <sys_write>:
c0008d6a:	55                   	push   %ebp
c0008d6b:	89 e5                	mov    %esp,%ebp
c0008d6d:	83 ec 18             	sub    $0x18,%esp
c0008d70:	8b 45 10             	mov    0x10(%ebp),%eax
c0008d73:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0008d79:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c0008d7f:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0008d84:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008d87:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008d8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008d8d:	8b 45 08             	mov    0x8(%ebp),%eax
c0008d90:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008d93:	eb 20                	jmp    c0008db5 <sys_write+0x4b>
c0008d95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008d98:	0f b6 00             	movzbl (%eax),%eax
c0008d9b:	0f b6 c0             	movzbl %al,%eax
c0008d9e:	83 ec 08             	sub    $0x8,%esp
c0008da1:	50                   	push   %eax
c0008da2:	ff 75 ec             	pushl  -0x14(%ebp)
c0008da5:	e8 dd c1 ff ff       	call   c0004f87 <out_char>
c0008daa:	83 c4 10             	add    $0x10,%esp
c0008dad:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008db1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0008db5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008db9:	7f da                	jg     c0008d95 <sys_write+0x2b>
c0008dbb:	90                   	nop
c0008dbc:	c9                   	leave  
c0008dbd:	c3                   	ret    

c0008dbe <milli_delay>:
c0008dbe:	55                   	push   %ebp
c0008dbf:	89 e5                	mov    %esp,%ebp
c0008dc1:	83 ec 18             	sub    $0x18,%esp
c0008dc4:	e8 53 0d 00 00       	call   c0009b1c <get_ticks_ipc>
c0008dc9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008dcc:	90                   	nop
c0008dcd:	e8 4a 0d 00 00       	call   c0009b1c <get_ticks_ipc>
c0008dd2:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0008dd5:	89 c1                	mov    %eax,%ecx
c0008dd7:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0008ddc:	89 c8                	mov    %ecx,%eax
c0008dde:	f7 ea                	imul   %edx
c0008de0:	c1 fa 05             	sar    $0x5,%edx
c0008de3:	89 c8                	mov    %ecx,%eax
c0008de5:	c1 f8 1f             	sar    $0x1f,%eax
c0008de8:	29 c2                	sub    %eax,%edx
c0008dea:	89 d0                	mov    %edx,%eax
c0008dec:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0008df2:	39 45 08             	cmp    %eax,0x8(%ebp)
c0008df5:	77 d6                	ja     c0008dcd <milli_delay+0xf>
c0008df7:	90                   	nop
c0008df8:	c9                   	leave  
c0008df9:	c3                   	ret    

c0008dfa <TaskSys>:
c0008dfa:	55                   	push   %ebp
c0008dfb:	89 e5                	mov    %esp,%ebp
c0008dfd:	eb fe                	jmp    c0008dfd <TaskSys+0x3>

c0008dff <Printf>:
c0008dff:	55                   	push   %ebp
c0008e00:	89 e5                	mov    %esp,%ebp
c0008e02:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008e08:	83 ec 04             	sub    $0x4,%esp
c0008e0b:	68 00 01 00 00       	push   $0x100
c0008e10:	6a 00                	push   $0x0
c0008e12:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008e18:	50                   	push   %eax
c0008e19:	e8 85 20 00 00       	call   c000aea3 <Memset>
c0008e1e:	83 c4 10             	add    $0x10,%esp
c0008e21:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008e24:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008e27:	8b 45 08             	mov    0x8(%ebp),%eax
c0008e2a:	83 ec 04             	sub    $0x4,%esp
c0008e2d:	ff 75 f4             	pushl  -0xc(%ebp)
c0008e30:	50                   	push   %eax
c0008e31:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008e37:	50                   	push   %eax
c0008e38:	e8 20 00 00 00       	call   c0008e5d <vsprintf>
c0008e3d:	83 c4 10             	add    $0x10,%esp
c0008e40:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008e43:	83 ec 04             	sub    $0x4,%esp
c0008e46:	ff 75 f0             	pushl  -0x10(%ebp)
c0008e49:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008e4f:	50                   	push   %eax
c0008e50:	6a 00                	push   $0x0
c0008e52:	e8 5f ce ff ff       	call   c0005cb6 <write>
c0008e57:	83 c4 10             	add    $0x10,%esp
c0008e5a:	90                   	nop
c0008e5b:	c9                   	leave  
c0008e5c:	c3                   	ret    

c0008e5d <vsprintf>:
c0008e5d:	55                   	push   %ebp
c0008e5e:	89 e5                	mov    %esp,%ebp
c0008e60:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0008e66:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008e6c:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0008e72:	83 ec 04             	sub    $0x4,%esp
c0008e75:	6a 40                	push   $0x40
c0008e77:	6a 00                	push   $0x0
c0008e79:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008e7f:	50                   	push   %eax
c0008e80:	e8 1e 20 00 00       	call   c000aea3 <Memset>
c0008e85:	83 c4 10             	add    $0x10,%esp
c0008e88:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008e8e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008e95:	8b 45 08             	mov    0x8(%ebp),%eax
c0008e98:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008e9b:	e9 53 01 00 00       	jmp    c0008ff3 <vsprintf+0x196>
c0008ea0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008ea3:	0f b6 00             	movzbl (%eax),%eax
c0008ea6:	3c 25                	cmp    $0x25,%al
c0008ea8:	74 16                	je     c0008ec0 <vsprintf+0x63>
c0008eaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ead:	8d 50 01             	lea    0x1(%eax),%edx
c0008eb0:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008eb3:	8b 55 0c             	mov    0xc(%ebp),%edx
c0008eb6:	0f b6 12             	movzbl (%edx),%edx
c0008eb9:	88 10                	mov    %dl,(%eax)
c0008ebb:	e9 2f 01 00 00       	jmp    c0008fef <vsprintf+0x192>
c0008ec0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008ec4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008ec7:	0f b6 00             	movzbl (%eax),%eax
c0008eca:	0f be c0             	movsbl %al,%eax
c0008ecd:	83 f8 64             	cmp    $0x64,%eax
c0008ed0:	74 26                	je     c0008ef8 <vsprintf+0x9b>
c0008ed2:	83 f8 64             	cmp    $0x64,%eax
c0008ed5:	7f 0e                	jg     c0008ee5 <vsprintf+0x88>
c0008ed7:	83 f8 63             	cmp    $0x63,%eax
c0008eda:	0f 84 f2 00 00 00    	je     c0008fd2 <vsprintf+0x175>
c0008ee0:	e9 0a 01 00 00       	jmp    c0008fef <vsprintf+0x192>
c0008ee5:	83 f8 73             	cmp    $0x73,%eax
c0008ee8:	0f 84 b0 00 00 00    	je     c0008f9e <vsprintf+0x141>
c0008eee:	83 f8 78             	cmp    $0x78,%eax
c0008ef1:	74 5d                	je     c0008f50 <vsprintf+0xf3>
c0008ef3:	e9 f7 00 00 00       	jmp    c0008fef <vsprintf+0x192>
c0008ef8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008efb:	8b 00                	mov    (%eax),%eax
c0008efd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008f00:	83 ec 04             	sub    $0x4,%esp
c0008f03:	6a 0a                	push   $0xa
c0008f05:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0008f0b:	50                   	push   %eax
c0008f0c:	ff 75 e8             	pushl  -0x18(%ebp)
c0008f0f:	e8 53 0c 00 00       	call   c0009b67 <itoa>
c0008f14:	83 c4 10             	add    $0x10,%esp
c0008f17:	83 ec 08             	sub    $0x8,%esp
c0008f1a:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008f20:	50                   	push   %eax
c0008f21:	ff 75 f4             	pushl  -0xc(%ebp)
c0008f24:	e8 99 1f 00 00       	call   c000aec2 <Strcpy>
c0008f29:	83 c4 10             	add    $0x10,%esp
c0008f2c:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008f30:	83 ec 0c             	sub    $0xc,%esp
c0008f33:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008f39:	50                   	push   %eax
c0008f3a:	e8 9d 1f 00 00       	call   c000aedc <Strlen>
c0008f3f:	83 c4 10             	add    $0x10,%esp
c0008f42:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008f45:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f48:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008f4b:	e9 9f 00 00 00       	jmp    c0008fef <vsprintf+0x192>
c0008f50:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f53:	8b 00                	mov    (%eax),%eax
c0008f55:	83 ec 08             	sub    $0x8,%esp
c0008f58:	50                   	push   %eax
c0008f59:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008f5f:	50                   	push   %eax
c0008f60:	e8 36 e9 ff ff       	call   c000789b <atoi>
c0008f65:	83 c4 10             	add    $0x10,%esp
c0008f68:	83 ec 08             	sub    $0x8,%esp
c0008f6b:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008f71:	50                   	push   %eax
c0008f72:	ff 75 f4             	pushl  -0xc(%ebp)
c0008f75:	e8 48 1f 00 00       	call   c000aec2 <Strcpy>
c0008f7a:	83 c4 10             	add    $0x10,%esp
c0008f7d:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008f81:	83 ec 0c             	sub    $0xc,%esp
c0008f84:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008f8a:	50                   	push   %eax
c0008f8b:	e8 4c 1f 00 00       	call   c000aedc <Strlen>
c0008f90:	83 c4 10             	add    $0x10,%esp
c0008f93:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008f96:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f99:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008f9c:	eb 51                	jmp    c0008fef <vsprintf+0x192>
c0008f9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008fa1:	8b 00                	mov    (%eax),%eax
c0008fa3:	83 ec 08             	sub    $0x8,%esp
c0008fa6:	50                   	push   %eax
c0008fa7:	ff 75 f4             	pushl  -0xc(%ebp)
c0008faa:	e8 13 1f 00 00       	call   c000aec2 <Strcpy>
c0008faf:	83 c4 10             	add    $0x10,%esp
c0008fb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008fb5:	8b 00                	mov    (%eax),%eax
c0008fb7:	83 ec 0c             	sub    $0xc,%esp
c0008fba:	50                   	push   %eax
c0008fbb:	e8 1c 1f 00 00       	call   c000aedc <Strlen>
c0008fc0:	83 c4 10             	add    $0x10,%esp
c0008fc3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008fc6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008fca:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fcd:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008fd0:	eb 1d                	jmp    c0008fef <vsprintf+0x192>
c0008fd2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008fd5:	0f b6 10             	movzbl (%eax),%edx
c0008fd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008fdb:	88 10                	mov    %dl,(%eax)
c0008fdd:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008fe1:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0008fe8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008feb:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008fee:	90                   	nop
c0008fef:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008ff3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008ff6:	0f b6 00             	movzbl (%eax),%eax
c0008ff9:	84 c0                	test   %al,%al
c0008ffb:	0f 85 9f fe ff ff    	jne    c0008ea0 <vsprintf+0x43>
c0009001:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009004:	2b 45 08             	sub    0x8(%ebp),%eax
c0009007:	c9                   	leave  
c0009008:	c3                   	ret    

c0009009 <printx>:
c0009009:	55                   	push   %ebp
c000900a:	89 e5                	mov    %esp,%ebp
c000900c:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009012:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009015:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009018:	8b 45 08             	mov    0x8(%ebp),%eax
c000901b:	83 ec 04             	sub    $0x4,%esp
c000901e:	ff 75 f4             	pushl  -0xc(%ebp)
c0009021:	50                   	push   %eax
c0009022:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009028:	50                   	push   %eax
c0009029:	e8 2f fe ff ff       	call   c0008e5d <vsprintf>
c000902e:	83 c4 10             	add    $0x10,%esp
c0009031:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009034:	83 ec 08             	sub    $0x8,%esp
c0009037:	ff 75 f0             	pushl  -0x10(%ebp)
c000903a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009040:	50                   	push   %eax
c0009041:	e8 92 97 ff ff       	call   c00027d8 <write_debug>
c0009046:	83 c4 10             	add    $0x10,%esp
c0009049:	90                   	nop
c000904a:	c9                   	leave  
c000904b:	c3                   	ret    

c000904c <sys_printx>:
c000904c:	55                   	push   %ebp
c000904d:	89 e5                	mov    %esp,%ebp
c000904f:	83 ec 28             	sub    $0x28,%esp
c0009052:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0009057:	85 c0                	test   %eax,%eax
c0009059:	75 23                	jne    c000907e <sys_printx+0x32>
c000905b:	8b 45 10             	mov    0x10(%ebp),%eax
c000905e:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c0009064:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009067:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000906a:	83 ec 08             	sub    $0x8,%esp
c000906d:	ff 75 10             	pushl  0x10(%ebp)
c0009070:	50                   	push   %eax
c0009071:	e8 00 ba ff ff       	call   c0004a76 <Seg2PhyAddrLDT>
c0009076:	83 c4 10             	add    $0x10,%esp
c0009079:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000907c:	eb 19                	jmp    c0009097 <sys_printx+0x4b>
c000907e:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0009083:	85 c0                	test   %eax,%eax
c0009085:	74 10                	je     c0009097 <sys_printx+0x4b>
c0009087:	83 ec 0c             	sub    $0xc,%esp
c000908a:	6a 30                	push   $0x30
c000908c:	e8 a4 b9 ff ff       	call   c0004a35 <Seg2PhyAddr>
c0009091:	83 c4 10             	add    $0x10,%esp
c0009094:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009097:	8b 55 08             	mov    0x8(%ebp),%edx
c000909a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000909d:	01 d0                	add    %edx,%eax
c000909f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00090a2:	8b 45 10             	mov    0x10(%ebp),%eax
c00090a5:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c00090ab:	69 c0 24 08 00 00    	imul   $0x824,%eax,%eax
c00090b1:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c00090b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00090b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00090bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00090bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090c2:	0f b6 00             	movzbl (%eax),%eax
c00090c5:	88 45 e3             	mov    %al,-0x1d(%ebp)
c00090c8:	eb 3a                	jmp    c0009104 <sys_printx+0xb8>
c00090ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090cd:	0f b6 00             	movzbl (%eax),%eax
c00090d0:	3c 3b                	cmp    $0x3b,%al
c00090d2:	74 0a                	je     c00090de <sys_printx+0x92>
c00090d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090d7:	0f b6 00             	movzbl (%eax),%eax
c00090da:	3c 3a                	cmp    $0x3a,%al
c00090dc:	75 06                	jne    c00090e4 <sys_printx+0x98>
c00090de:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00090e2:	eb 20                	jmp    c0009104 <sys_printx+0xb8>
c00090e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090e7:	0f b6 00             	movzbl (%eax),%eax
c00090ea:	0f b6 c0             	movzbl %al,%eax
c00090ed:	83 ec 08             	sub    $0x8,%esp
c00090f0:	50                   	push   %eax
c00090f1:	ff 75 e4             	pushl  -0x1c(%ebp)
c00090f4:	e8 8e be ff ff       	call   c0004f87 <out_char>
c00090f9:	83 c4 10             	add    $0x10,%esp
c00090fc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009100:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009104:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009108:	7f c0                	jg     c00090ca <sys_printx+0x7e>
c000910a:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c000910e:	75 10                	jne    c0009120 <sys_printx+0xd4>
c0009110:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0009115:	85 c0                	test   %eax,%eax
c0009117:	74 13                	je     c000912c <sys_printx+0xe0>
c0009119:	e8 92 86 ff ff       	call   c00017b0 <disable_int>
c000911e:	eb 0c                	jmp    c000912c <sys_printx+0xe0>
c0009120:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009124:	75 06                	jne    c000912c <sys_printx+0xe0>
c0009126:	e8 85 86 ff ff       	call   c00017b0 <disable_int>
c000912b:	90                   	nop
c000912c:	90                   	nop
c000912d:	c9                   	leave  
c000912e:	c3                   	ret    

c000912f <spin>:
c000912f:	55                   	push   %ebp
c0009130:	89 e5                	mov    %esp,%ebp
c0009132:	83 ec 08             	sub    $0x8,%esp
c0009135:	83 ec 0c             	sub    $0xc,%esp
c0009138:	ff 75 08             	pushl  0x8(%ebp)
c000913b:	e8 4c 84 ff ff       	call   c000158c <disp_str>
c0009140:	83 c4 10             	add    $0x10,%esp
c0009143:	83 ec 0c             	sub    $0xc,%esp
c0009146:	68 74 a7 00 c0       	push   $0xc000a774
c000914b:	e8 3c 84 ff ff       	call   c000158c <disp_str>
c0009150:	83 c4 10             	add    $0x10,%esp
c0009153:	eb fe                	jmp    c0009153 <spin+0x24>

c0009155 <panic>:
c0009155:	55                   	push   %ebp
c0009156:	89 e5                	mov    %esp,%ebp
c0009158:	83 ec 08             	sub    $0x8,%esp
c000915b:	83 ec 04             	sub    $0x4,%esp
c000915e:	ff 75 08             	pushl  0x8(%ebp)
c0009161:	6a 3a                	push   $0x3a
c0009163:	68 15 ac 00 c0       	push   $0xc000ac15
c0009168:	e8 9c fe ff ff       	call   c0009009 <printx>
c000916d:	83 c4 10             	add    $0x10,%esp
c0009170:	90                   	nop
c0009171:	c9                   	leave  
c0009172:	c3                   	ret    

c0009173 <assertion_failure>:
c0009173:	55                   	push   %ebp
c0009174:	89 e5                	mov    %esp,%ebp
c0009176:	83 ec 08             	sub    $0x8,%esp
c0009179:	83 ec 08             	sub    $0x8,%esp
c000917c:	ff 75 14             	pushl  0x14(%ebp)
c000917f:	ff 75 10             	pushl  0x10(%ebp)
c0009182:	ff 75 0c             	pushl  0xc(%ebp)
c0009185:	ff 75 08             	pushl  0x8(%ebp)
c0009188:	6a 3b                	push   $0x3b
c000918a:	68 1c ac 00 c0       	push   $0xc000ac1c
c000918f:	e8 75 fe ff ff       	call   c0009009 <printx>
c0009194:	83 c4 20             	add    $0x20,%esp
c0009197:	83 ec 0c             	sub    $0xc,%esp
c000919a:	68 4f ac 00 c0       	push   $0xc000ac4f
c000919f:	e8 8b ff ff ff       	call   c000912f <spin>
c00091a4:	83 c4 10             	add    $0x10,%esp
c00091a7:	90                   	nop
c00091a8:	c9                   	leave  
c00091a9:	c3                   	ret    

c00091aa <dead_lock>:
c00091aa:	55                   	push   %ebp
c00091ab:	89 e5                	mov    %esp,%ebp
c00091ad:	b8 00 00 00 00       	mov    $0x0,%eax
c00091b2:	5d                   	pop    %ebp
c00091b3:	c3                   	ret    

c00091b4 <sys_send_msg>:
c00091b4:	55                   	push   %ebp
c00091b5:	89 e5                	mov    %esp,%ebp
c00091b7:	83 ec 48             	sub    $0x48,%esp
c00091ba:	83 ec 0c             	sub    $0xc,%esp
c00091bd:	ff 75 0c             	pushl  0xc(%ebp)
c00091c0:	e8 7c b7 ff ff       	call   c0004941 <pid2proc>
c00091c5:	83 c4 10             	add    $0x10,%esp
c00091c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00091cb:	83 ec 0c             	sub    $0xc,%esp
c00091ce:	ff 75 10             	pushl  0x10(%ebp)
c00091d1:	e8 db b7 ff ff       	call   c00049b1 <proc2pid>
c00091d6:	83 c4 10             	add    $0x10,%esp
c00091d9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00091dc:	8b 45 10             	mov    0x10(%ebp),%eax
c00091df:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c00091e5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00091e8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00091ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00091f2:	83 ec 08             	sub    $0x8,%esp
c00091f5:	6a 6c                	push   $0x6c
c00091f7:	50                   	push   %eax
c00091f8:	e8 8a da ff ff       	call   c0006c87 <alloc_virtual_memory>
c00091fd:	83 c4 10             	add    $0x10,%esp
c0009200:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009203:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c000920a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000920d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009210:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009213:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009216:	89 10                	mov    %edx,(%eax)
c0009218:	83 ec 08             	sub    $0x8,%esp
c000921b:	ff 75 0c             	pushl  0xc(%ebp)
c000921e:	ff 75 e8             	pushl  -0x18(%ebp)
c0009221:	e8 84 ff ff ff       	call   c00091aa <dead_lock>
c0009226:	83 c4 10             	add    $0x10,%esp
c0009229:	83 f8 01             	cmp    $0x1,%eax
c000922c:	75 10                	jne    c000923e <sys_send_msg+0x8a>
c000922e:	83 ec 0c             	sub    $0xc,%esp
c0009231:	68 5b ac 00 c0       	push   $0xc000ac5b
c0009236:	e8 1a ff ff ff       	call   c0009155 <panic>
c000923b:	83 c4 10             	add    $0x10,%esp
c000923e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009241:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009248:	3c 02                	cmp    $0x2,%al
c000924a:	0f 85 8a 01 00 00    	jne    c00093da <sys_send_msg+0x226>
c0009250:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009253:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009259:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000925c:	74 12                	je     c0009270 <sys_send_msg+0xbc>
c000925e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009261:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009267:	83 f8 0e             	cmp    $0xe,%eax
c000926a:	0f 85 6a 01 00 00    	jne    c00093da <sys_send_msg+0x226>
c0009270:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009273:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c0009279:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000927c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000927f:	83 ec 08             	sub    $0x8,%esp
c0009282:	ff 75 ec             	pushl  -0x14(%ebp)
c0009285:	50                   	push   %eax
c0009286:	e8 eb b7 ff ff       	call   c0004a76 <Seg2PhyAddrLDT>
c000928b:	83 c4 10             	add    $0x10,%esp
c000928e:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009291:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009294:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c000929a:	83 ec 08             	sub    $0x8,%esp
c000929d:	6a 6c                	push   $0x6c
c000929f:	50                   	push   %eax
c00092a0:	e8 e2 d9 ff ff       	call   c0006c87 <alloc_virtual_memory>
c00092a5:	83 c4 10             	add    $0x10,%esp
c00092a8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00092ab:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00092ae:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00092b1:	83 ec 04             	sub    $0x4,%esp
c00092b4:	ff 75 d8             	pushl  -0x28(%ebp)
c00092b7:	52                   	push   %edx
c00092b8:	50                   	push   %eax
c00092b9:	e8 b7 1b 00 00       	call   c000ae75 <Memcpy>
c00092be:	83 c4 10             	add    $0x10,%esp
c00092c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092c4:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c00092cb:	00 00 00 
c00092ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092d1:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00092d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092db:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c00092e2:	00 00 00 
c00092e5:	8b 45 10             	mov    0x10(%ebp),%eax
c00092e8:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c00092ef:	00 00 00 
c00092f2:	83 ec 0c             	sub    $0xc,%esp
c00092f5:	ff 75 ec             	pushl  -0x14(%ebp)
c00092f8:	e8 cf 07 00 00       	call   c0009acc <unblock>
c00092fd:	83 c4 10             	add    $0x10,%esp
c0009300:	8b 45 10             	mov    0x10(%ebp),%eax
c0009303:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000930a:	84 c0                	test   %al,%al
c000930c:	74 1c                	je     c000932a <sys_send_msg+0x176>
c000930e:	68 87 05 00 00       	push   $0x587
c0009313:	68 66 ac 00 c0       	push   $0xc000ac66
c0009318:	68 66 ac 00 c0       	push   $0xc000ac66
c000931d:	68 76 ac 00 c0       	push   $0xc000ac76
c0009322:	e8 4c fe ff ff       	call   c0009173 <assertion_failure>
c0009327:	83 c4 10             	add    $0x10,%esp
c000932a:	8b 45 10             	mov    0x10(%ebp),%eax
c000932d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009333:	83 f8 1d             	cmp    $0x1d,%eax
c0009336:	74 1c                	je     c0009354 <sys_send_msg+0x1a0>
c0009338:	68 88 05 00 00       	push   $0x588
c000933d:	68 66 ac 00 c0       	push   $0xc000ac66
c0009342:	68 66 ac 00 c0       	push   $0xc000ac66
c0009347:	68 8a ac 00 c0       	push   $0xc000ac8a
c000934c:	e8 22 fe ff ff       	call   c0009173 <assertion_failure>
c0009351:	83 c4 10             	add    $0x10,%esp
c0009354:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009357:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c000935d:	85 c0                	test   %eax,%eax
c000935f:	74 1c                	je     c000937d <sys_send_msg+0x1c9>
c0009361:	68 8a 05 00 00       	push   $0x58a
c0009366:	68 66 ac 00 c0       	push   $0xc000ac66
c000936b:	68 66 ac 00 c0       	push   $0xc000ac66
c0009370:	68 a7 ac 00 c0       	push   $0xc000aca7
c0009375:	e8 f9 fd ff ff       	call   c0009173 <assertion_failure>
c000937a:	83 c4 10             	add    $0x10,%esp
c000937d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009380:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009387:	84 c0                	test   %al,%al
c0009389:	74 1c                	je     c00093a7 <sys_send_msg+0x1f3>
c000938b:	68 8b 05 00 00       	push   $0x58b
c0009390:	68 66 ac 00 c0       	push   $0xc000ac66
c0009395:	68 66 ac 00 c0       	push   $0xc000ac66
c000939a:	68 bc ac 00 c0       	push   $0xc000acbc
c000939f:	e8 cf fd ff ff       	call   c0009173 <assertion_failure>
c00093a4:	83 c4 10             	add    $0x10,%esp
c00093a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093aa:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00093b0:	83 f8 1d             	cmp    $0x1d,%eax
c00093b3:	0f 84 45 01 00 00    	je     c00094fe <sys_send_msg+0x34a>
c00093b9:	68 8c 05 00 00       	push   $0x58c
c00093be:	68 66 ac 00 c0       	push   $0xc000ac66
c00093c3:	68 66 ac 00 c0       	push   $0xc000ac66
c00093c8:	68 d4 ac 00 c0       	push   $0xc000acd4
c00093cd:	e8 a1 fd ff ff       	call   c0009173 <assertion_failure>
c00093d2:	83 c4 10             	add    $0x10,%esp
c00093d5:	e9 24 01 00 00       	jmp    c00094fe <sys_send_msg+0x34a>
c00093da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00093e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093e4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00093e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093ea:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00093f0:	85 c0                	test   %eax,%eax
c00093f2:	75 1b                	jne    c000940f <sys_send_msg+0x25b>
c00093f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093f7:	8b 55 10             	mov    0x10(%ebp),%edx
c00093fa:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009400:	8b 45 10             	mov    0x10(%ebp),%eax
c0009403:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000940a:	00 00 00 
c000940d:	eb 3f                	jmp    c000944e <sys_send_msg+0x29a>
c000940f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009412:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009418:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000941b:	eb 12                	jmp    c000942f <sys_send_msg+0x27b>
c000941d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009420:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009423:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009426:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000942c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000942f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009433:	75 e8                	jne    c000941d <sys_send_msg+0x269>
c0009435:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009438:	8b 55 10             	mov    0x10(%ebp),%edx
c000943b:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009441:	8b 45 10             	mov    0x10(%ebp),%eax
c0009444:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000944b:	00 00 00 
c000944e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009451:	8b 55 08             	mov    0x8(%ebp),%edx
c0009454:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c000945a:	8b 45 10             	mov    0x10(%ebp),%eax
c000945d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009460:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009466:	8b 45 10             	mov    0x10(%ebp),%eax
c0009469:	c6 80 44 02 00 00 01 	movb   $0x1,0x244(%eax)
c0009470:	8b 45 10             	mov    0x10(%ebp),%eax
c0009473:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000947a:	3c 01                	cmp    $0x1,%al
c000947c:	74 1c                	je     c000949a <sys_send_msg+0x2e6>
c000947e:	68 ad 05 00 00       	push   $0x5ad
c0009483:	68 66 ac 00 c0       	push   $0xc000ac66
c0009488:	68 66 ac 00 c0       	push   $0xc000ac66
c000948d:	68 f8 ac 00 c0       	push   $0xc000acf8
c0009492:	e8 dc fc ff ff       	call   c0009173 <assertion_failure>
c0009497:	83 c4 10             	add    $0x10,%esp
c000949a:	8b 45 10             	mov    0x10(%ebp),%eax
c000949d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00094a3:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00094a6:	74 1c                	je     c00094c4 <sys_send_msg+0x310>
c00094a8:	68 ae 05 00 00       	push   $0x5ae
c00094ad:	68 66 ac 00 c0       	push   $0xc000ac66
c00094b2:	68 66 ac 00 c0       	push   $0xc000ac66
c00094b7:	68 14 ad 00 c0       	push   $0xc000ad14
c00094bc:	e8 b2 fc ff ff       	call   c0009173 <assertion_failure>
c00094c1:	83 c4 10             	add    $0x10,%esp
c00094c4:	8b 45 10             	mov    0x10(%ebp),%eax
c00094c7:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00094cd:	39 45 08             	cmp    %eax,0x8(%ebp)
c00094d0:	74 1c                	je     c00094ee <sys_send_msg+0x33a>
c00094d2:	68 af 05 00 00       	push   $0x5af
c00094d7:	68 66 ac 00 c0       	push   $0xc000ac66
c00094dc:	68 66 ac 00 c0       	push   $0xc000ac66
c00094e1:	68 36 ad 00 c0       	push   $0xc000ad36
c00094e6:	e8 88 fc ff ff       	call   c0009173 <assertion_failure>
c00094eb:	83 c4 10             	add    $0x10,%esp
c00094ee:	83 ec 0c             	sub    $0xc,%esp
c00094f1:	ff 75 10             	pushl  0x10(%ebp)
c00094f4:	e8 97 05 00 00       	call   c0009a90 <block>
c00094f9:	83 c4 10             	add    $0x10,%esp
c00094fc:	eb 01                	jmp    c00094ff <sys_send_msg+0x34b>
c00094fe:	90                   	nop
c00094ff:	b8 00 00 00 00       	mov    $0x0,%eax
c0009504:	c9                   	leave  
c0009505:	c3                   	ret    

c0009506 <sys_receive_msg>:
c0009506:	55                   	push   %ebp
c0009507:	89 e5                	mov    %esp,%ebp
c0009509:	83 ec 48             	sub    $0x48,%esp
c000950c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009513:	83 ec 0c             	sub    $0xc,%esp
c0009516:	ff 75 0c             	pushl  0xc(%ebp)
c0009519:	e8 23 b4 ff ff       	call   c0004941 <pid2proc>
c000951e:	83 c4 10             	add    $0x10,%esp
c0009521:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009524:	83 ec 0c             	sub    $0xc,%esp
c0009527:	ff 75 10             	pushl  0x10(%ebp)
c000952a:	e8 82 b4 ff ff       	call   c00049b1 <proc2pid>
c000952f:	83 c4 10             	add    $0x10,%esp
c0009532:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009535:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000953c:	8b 45 10             	mov    0x10(%ebp),%eax
c000953f:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009545:	85 c0                	test   %eax,%eax
c0009547:	0f 84 c7 00 00 00    	je     c0009614 <sys_receive_msg+0x10e>
c000954d:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0009551:	74 0d                	je     c0009560 <sys_receive_msg+0x5a>
c0009553:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c000955a:	0f 85 b4 00 00 00    	jne    c0009614 <sys_receive_msg+0x10e>
c0009560:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c0009567:	83 ec 0c             	sub    $0xc,%esp
c000956a:	ff 75 dc             	pushl  -0x24(%ebp)
c000956d:	e8 56 d8 ff ff       	call   c0006dc8 <sys_malloc>
c0009572:	83 c4 10             	add    $0x10,%esp
c0009575:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009578:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000957b:	83 ec 04             	sub    $0x4,%esp
c000957e:	50                   	push   %eax
c000957f:	6a 00                	push   $0x0
c0009581:	ff 75 d8             	pushl  -0x28(%ebp)
c0009584:	e8 1a 19 00 00       	call   c000aea3 <Memset>
c0009589:	83 c4 10             	add    $0x10,%esp
c000958c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000958f:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009595:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009598:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000959f:	8b 45 08             	mov    0x8(%ebp),%eax
c00095a2:	83 ec 08             	sub    $0x8,%esp
c00095a5:	ff 75 dc             	pushl  -0x24(%ebp)
c00095a8:	50                   	push   %eax
c00095a9:	e8 d9 d6 ff ff       	call   c0006c87 <alloc_virtual_memory>
c00095ae:	83 c4 10             	add    $0x10,%esp
c00095b1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00095b4:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00095b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00095ba:	83 ec 04             	sub    $0x4,%esp
c00095bd:	52                   	push   %edx
c00095be:	ff 75 d8             	pushl  -0x28(%ebp)
c00095c1:	50                   	push   %eax
c00095c2:	e8 ae 18 00 00       	call   c000ae75 <Memcpy>
c00095c7:	83 c4 10             	add    $0x10,%esp
c00095ca:	8b 45 10             	mov    0x10(%ebp),%eax
c00095cd:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00095d4:	00 00 00 
c00095d7:	8b 45 10             	mov    0x10(%ebp),%eax
c00095da:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c00095e1:	00 00 00 
c00095e4:	8b 45 10             	mov    0x10(%ebp),%eax
c00095e7:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c00095ee:	00 00 00 
c00095f1:	8b 45 10             	mov    0x10(%ebp),%eax
c00095f4:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00095fb:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0009602:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009605:	83 ec 08             	sub    $0x8,%esp
c0009608:	ff 75 dc             	pushl  -0x24(%ebp)
c000960b:	50                   	push   %eax
c000960c:	e8 96 da ff ff       	call   c00070a7 <sys_free>
c0009611:	83 c4 10             	add    $0x10,%esp
c0009614:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009618:	0f 84 6c 03 00 00    	je     c000998a <sys_receive_msg+0x484>
c000961e:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0009622:	75 26                	jne    c000964a <sys_receive_msg+0x144>
c0009624:	8b 45 10             	mov    0x10(%ebp),%eax
c0009627:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000962d:	85 c0                	test   %eax,%eax
c000962f:	0f 84 8a 00 00 00    	je     c00096bf <sys_receive_msg+0x1b9>
c0009635:	8b 45 10             	mov    0x10(%ebp),%eax
c0009638:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000963e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009641:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009648:	eb 75                	jmp    c00096bf <sys_receive_msg+0x1b9>
c000964a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000964e:	78 6f                	js     c00096bf <sys_receive_msg+0x1b9>
c0009650:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
c0009654:	7f 69                	jg     c00096bf <sys_receive_msg+0x1b9>
c0009656:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009659:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009660:	3c 01                	cmp    $0x1,%al
c0009662:	75 5b                	jne    c00096bf <sys_receive_msg+0x1b9>
c0009664:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009667:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000966d:	83 f8 0e             	cmp    $0xe,%eax
c0009670:	74 0e                	je     c0009680 <sys_receive_msg+0x17a>
c0009672:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009675:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000967b:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c000967e:	75 3f                	jne    c00096bf <sys_receive_msg+0x1b9>
c0009680:	8b 45 10             	mov    0x10(%ebp),%eax
c0009683:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009689:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000968c:	eb 2b                	jmp    c00096b9 <sys_receive_msg+0x1b3>
c000968e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009691:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009694:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009697:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c000969d:	8b 45 0c             	mov    0xc(%ebp),%eax
c00096a0:	39 c2                	cmp    %eax,%edx
c00096a2:	75 09                	jne    c00096ad <sys_receive_msg+0x1a7>
c00096a4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00096ab:	eb 12                	jmp    c00096bf <sys_receive_msg+0x1b9>
c00096ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00096b0:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00096b6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00096b9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00096bd:	75 cf                	jne    c000968e <sys_receive_msg+0x188>
c00096bf:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c00096c3:	0f 85 4b 02 00 00    	jne    c0009914 <sys_receive_msg+0x40e>
c00096c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00096cc:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00096cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00096d2:	83 ec 08             	sub    $0x8,%esp
c00096d5:	6a 6c                	push   $0x6c
c00096d7:	50                   	push   %eax
c00096d8:	e8 aa d5 ff ff       	call   c0006c87 <alloc_virtual_memory>
c00096dd:	83 c4 10             	add    $0x10,%esp
c00096e0:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00096e3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00096e6:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00096ec:	83 ec 08             	sub    $0x8,%esp
c00096ef:	6a 6c                	push   $0x6c
c00096f1:	50                   	push   %eax
c00096f2:	e8 90 d5 ff ff       	call   c0006c87 <alloc_virtual_memory>
c00096f7:	83 c4 10             	add    $0x10,%esp
c00096fa:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00096fd:	83 ec 04             	sub    $0x4,%esp
c0009700:	6a 6c                	push   $0x6c
c0009702:	ff 75 c8             	pushl  -0x38(%ebp)
c0009705:	ff 75 cc             	pushl  -0x34(%ebp)
c0009708:	e8 68 17 00 00       	call   c000ae75 <Memcpy>
c000970d:	83 c4 10             	add    $0x10,%esp
c0009710:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009713:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009716:	83 7d 0c 04          	cmpl   $0x4,0xc(%ebp)
c000971a:	75 27                	jne    c0009743 <sys_receive_msg+0x23d>
c000971c:	8b 45 08             	mov    0x8(%ebp),%eax
c000971f:	8b 40 68             	mov    0x68(%eax),%eax
c0009722:	83 f8 06             	cmp    $0x6,%eax
c0009725:	74 1c                	je     c0009743 <sys_receive_msg+0x23d>
c0009727:	68 0e 06 00 00       	push   $0x60e
c000972c:	68 66 ac 00 c0       	push   $0xc000ac66
c0009731:	68 66 ac 00 c0       	push   $0xc000ac66
c0009736:	68 4b ad 00 c0       	push   $0xc000ad4b
c000973b:	e8 33 fa ff ff       	call   c0009173 <assertion_failure>
c0009740:	83 c4 10             	add    $0x10,%esp
c0009743:	8b 45 10             	mov    0x10(%ebp),%eax
c0009746:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000974c:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000974f:	75 21                	jne    c0009772 <sys_receive_msg+0x26c>
c0009751:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009754:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c000975a:	8b 45 10             	mov    0x10(%ebp),%eax
c000975d:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009763:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009766:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000976d:	00 00 00 
c0009770:	eb 1f                	jmp    c0009791 <sys_receive_msg+0x28b>
c0009772:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009775:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c000977b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000977e:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009784:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009787:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000978e:	00 00 00 
c0009791:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009794:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c000979b:	00 00 00 
c000979e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00097a1:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00097a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00097ab:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c00097b2:	00 00 00 
c00097b5:	8b 45 10             	mov    0x10(%ebp),%eax
c00097b8:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c00097bf:	00 00 00 
c00097c2:	8b 45 10             	mov    0x10(%ebp),%eax
c00097c5:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c00097cc:	00 00 00 
c00097cf:	8b 45 10             	mov    0x10(%ebp),%eax
c00097d2:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c00097d9:	00 00 00 
c00097dc:	83 ec 0c             	sub    $0xc,%esp
c00097df:	ff 75 d0             	pushl  -0x30(%ebp)
c00097e2:	e8 e5 02 00 00       	call   c0009acc <unblock>
c00097e7:	83 c4 10             	add    $0x10,%esp
c00097ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00097ed:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00097f3:	85 c0                	test   %eax,%eax
c00097f5:	74 1c                	je     c0009813 <sys_receive_msg+0x30d>
c00097f7:	68 2b 06 00 00       	push   $0x62b
c00097fc:	68 66 ac 00 c0       	push   $0xc000ac66
c0009801:	68 66 ac 00 c0       	push   $0xc000ac66
c0009806:	68 5d ad 00 c0       	push   $0xc000ad5d
c000980b:	e8 63 f9 ff ff       	call   c0009173 <assertion_failure>
c0009810:	83 c4 10             	add    $0x10,%esp
c0009813:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009816:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000981d:	84 c0                	test   %al,%al
c000981f:	74 1c                	je     c000983d <sys_receive_msg+0x337>
c0009821:	68 2c 06 00 00       	push   $0x62c
c0009826:	68 66 ac 00 c0       	push   $0xc000ac66
c000982b:	68 66 ac 00 c0       	push   $0xc000ac66
c0009830:	68 75 ad 00 c0       	push   $0xc000ad75
c0009835:	e8 39 f9 ff ff       	call   c0009173 <assertion_failure>
c000983a:	83 c4 10             	add    $0x10,%esp
c000983d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009840:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009846:	83 f8 1d             	cmp    $0x1d,%eax
c0009849:	74 1c                	je     c0009867 <sys_receive_msg+0x361>
c000984b:	68 2d 06 00 00       	push   $0x62d
c0009850:	68 66 ac 00 c0       	push   $0xc000ac66
c0009855:	68 66 ac 00 c0       	push   $0xc000ac66
c000985a:	68 90 ad 00 c0       	push   $0xc000ad90
c000985f:	e8 0f f9 ff ff       	call   c0009173 <assertion_failure>
c0009864:	83 c4 10             	add    $0x10,%esp
c0009867:	8b 45 10             	mov    0x10(%ebp),%eax
c000986a:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009870:	85 c0                	test   %eax,%eax
c0009872:	74 1c                	je     c0009890 <sys_receive_msg+0x38a>
c0009874:	68 2f 06 00 00       	push   $0x62f
c0009879:	68 66 ac 00 c0       	push   $0xc000ac66
c000987e:	68 66 ac 00 c0       	push   $0xc000ac66
c0009883:	68 a7 ac 00 c0       	push   $0xc000aca7
c0009888:	e8 e6 f8 ff ff       	call   c0009173 <assertion_failure>
c000988d:	83 c4 10             	add    $0x10,%esp
c0009890:	8b 45 10             	mov    0x10(%ebp),%eax
c0009893:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000989a:	84 c0                	test   %al,%al
c000989c:	74 1c                	je     c00098ba <sys_receive_msg+0x3b4>
c000989e:	68 30 06 00 00       	push   $0x630
c00098a3:	68 66 ac 00 c0       	push   $0xc000ac66
c00098a8:	68 66 ac 00 c0       	push   $0xc000ac66
c00098ad:	68 bc ac 00 c0       	push   $0xc000acbc
c00098b2:	e8 bc f8 ff ff       	call   c0009173 <assertion_failure>
c00098b7:	83 c4 10             	add    $0x10,%esp
c00098ba:	8b 45 10             	mov    0x10(%ebp),%eax
c00098bd:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00098c3:	83 f8 1d             	cmp    $0x1d,%eax
c00098c6:	74 1c                	je     c00098e4 <sys_receive_msg+0x3de>
c00098c8:	68 31 06 00 00       	push   $0x631
c00098cd:	68 66 ac 00 c0       	push   $0xc000ac66
c00098d2:	68 66 ac 00 c0       	push   $0xc000ac66
c00098d7:	68 d4 ac 00 c0       	push   $0xc000acd4
c00098dc:	e8 92 f8 ff ff       	call   c0009173 <assertion_failure>
c00098e1:	83 c4 10             	add    $0x10,%esp
c00098e4:	8b 45 10             	mov    0x10(%ebp),%eax
c00098e7:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00098ed:	83 f8 1d             	cmp    $0x1d,%eax
c00098f0:	0f 84 8d 00 00 00    	je     c0009983 <sys_receive_msg+0x47d>
c00098f6:	68 32 06 00 00       	push   $0x632
c00098fb:	68 66 ac 00 c0       	push   $0xc000ac66
c0009900:	68 66 ac 00 c0       	push   $0xc000ac66
c0009905:	68 b4 ad 00 c0       	push   $0xc000adb4
c000990a:	e8 64 f8 ff ff       	call   c0009173 <assertion_failure>
c000990f:	83 c4 10             	add    $0x10,%esp
c0009912:	eb 6f                	jmp    c0009983 <sys_receive_msg+0x47d>
c0009914:	8b 45 10             	mov    0x10(%ebp),%eax
c0009917:	c6 80 44 02 00 00 02 	movb   $0x2,0x244(%eax)
c000991e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009921:	8b 55 08             	mov    0x8(%ebp),%edx
c0009924:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c000992a:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c000992e:	75 0f                	jne    c000993f <sys_receive_msg+0x439>
c0009930:	8b 45 10             	mov    0x10(%ebp),%eax
c0009933:	c7 80 50 02 00 00 0e 	movl   $0xe,0x250(%eax)
c000993a:	00 00 00 
c000993d:	eb 0c                	jmp    c000994b <sys_receive_msg+0x445>
c000993f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009942:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009945:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c000994b:	8b 45 10             	mov    0x10(%ebp),%eax
c000994e:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009955:	3c 02                	cmp    $0x2,%al
c0009957:	74 1c                	je     c0009975 <sys_receive_msg+0x46f>
c0009959:	68 42 06 00 00       	push   $0x642
c000995e:	68 66 ac 00 c0       	push   $0xc000ac66
c0009963:	68 66 ac 00 c0       	push   $0xc000ac66
c0009968:	68 d3 ad 00 c0       	push   $0xc000add3
c000996d:	e8 01 f8 ff ff       	call   c0009173 <assertion_failure>
c0009972:	83 c4 10             	add    $0x10,%esp
c0009975:	83 ec 0c             	sub    $0xc,%esp
c0009978:	ff 75 10             	pushl  0x10(%ebp)
c000997b:	e8 10 01 00 00       	call   c0009a90 <block>
c0009980:	83 c4 10             	add    $0x10,%esp
c0009983:	b8 00 00 00 00       	mov    $0x0,%eax
c0009988:	eb 02                	jmp    c000998c <sys_receive_msg+0x486>
c000998a:	90                   	nop
c000998b:	90                   	nop
c000998c:	c9                   	leave  
c000998d:	c3                   	ret    

c000998e <disp_str_colour_debug>:
c000998e:	55                   	push   %ebp
c000998f:	89 e5                	mov    %esp,%ebp
c0009991:	90                   	nop
c0009992:	5d                   	pop    %ebp
c0009993:	c3                   	ret    

c0009994 <send_rec>:
c0009994:	55                   	push   %ebp
c0009995:	89 e5                	mov    %esp,%ebp
c0009997:	83 ec 18             	sub    $0x18,%esp
c000999a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000999d:	83 ec 0c             	sub    $0xc,%esp
c00099a0:	50                   	push   %eax
c00099a1:	e8 4e d3 ff ff       	call   c0006cf4 <get_physical_address>
c00099a6:	83 c4 10             	add    $0x10,%esp
c00099a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00099ac:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c00099b0:	74 28                	je     c00099da <send_rec+0x46>
c00099b2:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c00099b6:	74 22                	je     c00099da <send_rec+0x46>
c00099b8:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c00099bc:	74 1c                	je     c00099da <send_rec+0x46>
c00099be:	68 60 06 00 00       	push   $0x660
c00099c3:	68 66 ac 00 c0       	push   $0xc000ac66
c00099c8:	68 66 ac 00 c0       	push   $0xc000ac66
c00099cd:	68 f4 ad 00 c0       	push   $0xc000adf4
c00099d2:	e8 9c f7 ff ff       	call   c0009173 <assertion_failure>
c00099d7:	83 c4 10             	add    $0x10,%esp
c00099da:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c00099de:	75 12                	jne    c00099f2 <send_rec+0x5e>
c00099e0:	83 ec 04             	sub    $0x4,%esp
c00099e3:	6a 6c                	push   $0x6c
c00099e5:	6a 00                	push   $0x0
c00099e7:	ff 75 0c             	pushl  0xc(%ebp)
c00099ea:	e8 b4 14 00 00       	call   c000aea3 <Memset>
c00099ef:	83 c4 10             	add    $0x10,%esp
c00099f2:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c00099f6:	74 23                	je     c0009a1b <send_rec+0x87>
c00099f8:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c00099fc:	74 34                	je     c0009a32 <send_rec+0x9e>
c00099fe:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009a02:	75 72                	jne    c0009a76 <send_rec+0xe2>
c0009a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a07:	83 ec 08             	sub    $0x8,%esp
c0009a0a:	ff 75 10             	pushl  0x10(%ebp)
c0009a0d:	50                   	push   %eax
c0009a0e:	e8 e5 8d ff ff       	call   c00027f8 <send_msg>
c0009a13:	83 c4 10             	add    $0x10,%esp
c0009a16:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a19:	eb 6e                	jmp    c0009a89 <send_rec+0xf5>
c0009a1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a1e:	83 ec 08             	sub    $0x8,%esp
c0009a21:	ff 75 10             	pushl  0x10(%ebp)
c0009a24:	50                   	push   %eax
c0009a25:	e8 f4 8d ff ff       	call   c000281e <receive_msg>
c0009a2a:	83 c4 10             	add    $0x10,%esp
c0009a2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a30:	eb 57                	jmp    c0009a89 <send_rec+0xf5>
c0009a32:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a35:	83 ec 08             	sub    $0x8,%esp
c0009a38:	ff 75 10             	pushl  0x10(%ebp)
c0009a3b:	50                   	push   %eax
c0009a3c:	e8 b7 8d ff ff       	call   c00027f8 <send_msg>
c0009a41:	83 c4 10             	add    $0x10,%esp
c0009a44:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a47:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009a4b:	75 3b                	jne    c0009a88 <send_rec+0xf4>
c0009a4d:	83 ec 04             	sub    $0x4,%esp
c0009a50:	6a 6c                	push   $0x6c
c0009a52:	6a 00                	push   $0x0
c0009a54:	ff 75 0c             	pushl  0xc(%ebp)
c0009a57:	e8 47 14 00 00       	call   c000aea3 <Memset>
c0009a5c:	83 c4 10             	add    $0x10,%esp
c0009a5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009a62:	83 ec 08             	sub    $0x8,%esp
c0009a65:	ff 75 10             	pushl  0x10(%ebp)
c0009a68:	50                   	push   %eax
c0009a69:	e8 b0 8d ff ff       	call   c000281e <receive_msg>
c0009a6e:	83 c4 10             	add    $0x10,%esp
c0009a71:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009a74:	eb 12                	jmp    c0009a88 <send_rec+0xf4>
c0009a76:	83 ec 0c             	sub    $0xc,%esp
c0009a79:	68 30 ae 00 c0       	push   $0xc000ae30
c0009a7e:	e8 d2 f6 ff ff       	call   c0009155 <panic>
c0009a83:	83 c4 10             	add    $0x10,%esp
c0009a86:	eb 01                	jmp    c0009a89 <send_rec+0xf5>
c0009a88:	90                   	nop
c0009a89:	b8 00 00 00 00       	mov    $0x0,%eax
c0009a8e:	c9                   	leave  
c0009a8f:	c3                   	ret    

c0009a90 <block>:
c0009a90:	55                   	push   %ebp
c0009a91:	89 e5                	mov    %esp,%ebp
c0009a93:	83 ec 08             	sub    $0x8,%esp
c0009a96:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a99:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009aa0:	84 c0                	test   %al,%al
c0009aa2:	75 1c                	jne    c0009ac0 <block+0x30>
c0009aa4:	68 8f 06 00 00       	push   $0x68f
c0009aa9:	68 66 ac 00 c0       	push   $0xc000ac66
c0009aae:	68 66 ac 00 c0       	push   $0xc000ac66
c0009ab3:	68 45 ae 00 c0       	push   $0xc000ae45
c0009ab8:	e8 b6 f6 ff ff       	call   c0009173 <assertion_failure>
c0009abd:	83 c4 10             	add    $0x10,%esp
c0009ac0:	e8 6c ad ff ff       	call   c0004831 <schedule_process>
c0009ac5:	b8 00 00 00 00       	mov    $0x0,%eax
c0009aca:	c9                   	leave  
c0009acb:	c3                   	ret    

c0009acc <unblock>:
c0009acc:	55                   	push   %ebp
c0009acd:	89 e5                	mov    %esp,%ebp
c0009acf:	83 ec 08             	sub    $0x8,%esp
c0009ad2:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ad5:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009adc:	84 c0                	test   %al,%al
c0009ade:	74 1c                	je     c0009afc <unblock+0x30>
c0009ae0:	68 98 06 00 00       	push   $0x698
c0009ae5:	68 66 ac 00 c0       	push   $0xc000ac66
c0009aea:	68 66 ac 00 c0       	push   $0xc000ac66
c0009aef:	68 5d ae 00 c0       	push   $0xc000ae5d
c0009af4:	e8 7a f6 ff ff       	call   c0009173 <assertion_failure>
c0009af9:	83 c4 10             	add    $0x10,%esp
c0009afc:	8b 45 08             	mov    0x8(%ebp),%eax
c0009aff:	05 fc 00 00 00       	add    $0xfc,%eax
c0009b04:	83 ec 08             	sub    $0x8,%esp
c0009b07:	50                   	push   %eax
c0009b08:	68 8c fd 00 c0       	push   $0xc000fd8c
c0009b0d:	e8 97 05 00 00       	call   c000a0a9 <insertToDoubleLinkList>
c0009b12:	83 c4 10             	add    $0x10,%esp
c0009b15:	b8 00 00 00 00       	mov    $0x0,%eax
c0009b1a:	c9                   	leave  
c0009b1b:	c3                   	ret    

c0009b1c <get_ticks_ipc>:
c0009b1c:	55                   	push   %ebp
c0009b1d:	89 e5                	mov    %esp,%ebp
c0009b1f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0009b25:	83 ec 04             	sub    $0x4,%esp
c0009b28:	6a 6c                	push   $0x6c
c0009b2a:	6a 00                	push   $0x0
c0009b2c:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009b2f:	50                   	push   %eax
c0009b30:	e8 6e 13 00 00       	call   c000aea3 <Memset>
c0009b35:	83 c4 10             	add    $0x10,%esp
c0009b38:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c0009b3f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009b46:	83 ec 04             	sub    $0x4,%esp
c0009b49:	6a 01                	push   $0x1
c0009b4b:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009b4e:	50                   	push   %eax
c0009b4f:	6a 03                	push   $0x3
c0009b51:	e8 3e fe ff ff       	call   c0009994 <send_rec>
c0009b56:	83 c4 10             	add    $0x10,%esp
c0009b59:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009b5c:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0009b5f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b62:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009b65:	c9                   	leave  
c0009b66:	c3                   	ret    

c0009b67 <itoa>:
c0009b67:	55                   	push   %ebp
c0009b68:	89 e5                	mov    %esp,%ebp
c0009b6a:	53                   	push   %ebx
c0009b6b:	83 ec 14             	sub    $0x14,%esp
c0009b6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b71:	99                   	cltd   
c0009b72:	f7 7d 10             	idivl  0x10(%ebp)
c0009b75:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009b78:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b7b:	99                   	cltd   
c0009b7c:	f7 7d 10             	idivl  0x10(%ebp)
c0009b7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b82:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009b86:	74 14                	je     c0009b9c <itoa+0x35>
c0009b88:	83 ec 04             	sub    $0x4,%esp
c0009b8b:	ff 75 10             	pushl  0x10(%ebp)
c0009b8e:	ff 75 0c             	pushl  0xc(%ebp)
c0009b91:	ff 75 f0             	pushl  -0x10(%ebp)
c0009b94:	e8 ce ff ff ff       	call   c0009b67 <itoa>
c0009b99:	83 c4 10             	add    $0x10,%esp
c0009b9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b9f:	8d 58 30             	lea    0x30(%eax),%ebx
c0009ba2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009ba5:	8b 00                	mov    (%eax),%eax
c0009ba7:	8d 48 01             	lea    0x1(%eax),%ecx
c0009baa:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009bad:	89 0a                	mov    %ecx,(%edx)
c0009baf:	89 da                	mov    %ebx,%edx
c0009bb1:	88 10                	mov    %dl,(%eax)
c0009bb3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009bb6:	8b 00                	mov    (%eax),%eax
c0009bb8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009bbb:	c9                   	leave  
c0009bbc:	c3                   	ret    

c0009bbd <i2a>:
c0009bbd:	55                   	push   %ebp
c0009bbe:	89 e5                	mov    %esp,%ebp
c0009bc0:	53                   	push   %ebx
c0009bc1:	83 ec 14             	sub    $0x14,%esp
c0009bc4:	8b 45 08             	mov    0x8(%ebp),%eax
c0009bc7:	99                   	cltd   
c0009bc8:	f7 7d 0c             	idivl  0xc(%ebp)
c0009bcb:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009bce:	8b 45 08             	mov    0x8(%ebp),%eax
c0009bd1:	99                   	cltd   
c0009bd2:	f7 7d 0c             	idivl  0xc(%ebp)
c0009bd5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009bd8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009bdc:	74 14                	je     c0009bf2 <i2a+0x35>
c0009bde:	83 ec 04             	sub    $0x4,%esp
c0009be1:	ff 75 10             	pushl  0x10(%ebp)
c0009be4:	ff 75 0c             	pushl  0xc(%ebp)
c0009be7:	ff 75 f0             	pushl  -0x10(%ebp)
c0009bea:	e8 ce ff ff ff       	call   c0009bbd <i2a>
c0009bef:	83 c4 10             	add    $0x10,%esp
c0009bf2:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009bf6:	7f 0a                	jg     c0009c02 <i2a+0x45>
c0009bf8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009bfb:	83 c0 30             	add    $0x30,%eax
c0009bfe:	89 c3                	mov    %eax,%ebx
c0009c00:	eb 08                	jmp    c0009c0a <i2a+0x4d>
c0009c02:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c05:	83 c0 37             	add    $0x37,%eax
c0009c08:	89 c3                	mov    %eax,%ebx
c0009c0a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c0d:	8b 00                	mov    (%eax),%eax
c0009c0f:	8d 48 01             	lea    0x1(%eax),%ecx
c0009c12:	8b 55 10             	mov    0x10(%ebp),%edx
c0009c15:	89 0a                	mov    %ecx,(%edx)
c0009c17:	88 18                	mov    %bl,(%eax)
c0009c19:	8b 45 10             	mov    0x10(%ebp),%eax
c0009c1c:	8b 00                	mov    (%eax),%eax
c0009c1e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009c21:	c9                   	leave  
c0009c22:	c3                   	ret    

c0009c23 <inform_int>:
c0009c23:	55                   	push   %ebp
c0009c24:	89 e5                	mov    %esp,%ebp
c0009c26:	83 ec 18             	sub    $0x18,%esp
c0009c29:	83 ec 0c             	sub    $0xc,%esp
c0009c2c:	ff 75 08             	pushl  0x8(%ebp)
c0009c2f:	e8 0d ad ff ff       	call   c0004941 <pid2proc>
c0009c34:	83 c4 10             	add    $0x10,%esp
c0009c37:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009c3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c3d:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009c44:	0f be c0             	movsbl %al,%eax
c0009c47:	83 e0 02             	and    $0x2,%eax
c0009c4a:	85 c0                	test   %eax,%eax
c0009c4c:	0f 84 8e 00 00 00    	je     c0009ce0 <inform_int+0xbd>
c0009c52:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c55:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009c5b:	3d 13 02 00 00       	cmp    $0x213,%eax
c0009c60:	74 0e                	je     c0009c70 <inform_int+0x4d>
c0009c62:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c65:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009c6b:	83 f8 0e             	cmp    $0xe,%eax
c0009c6e:	75 7d                	jne    c0009ced <inform_int+0xca>
c0009c70:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c0009c77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c7a:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009c80:	83 ec 08             	sub    $0x8,%esp
c0009c83:	ff 75 f0             	pushl  -0x10(%ebp)
c0009c86:	50                   	push   %eax
c0009c87:	e8 fb cf ff ff       	call   c0006c87 <alloc_virtual_memory>
c0009c8c:	83 c4 10             	add    $0x10,%esp
c0009c8f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009c92:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009c95:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009c9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009c9e:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009ca5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ca8:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009caf:	00 00 00 
c0009cb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009cb5:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009cbc:	00 00 00 
c0009cbf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009cc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009cc9:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0009cd0:	83 ec 0c             	sub    $0xc,%esp
c0009cd3:	ff 75 f4             	pushl  -0xc(%ebp)
c0009cd6:	e8 f1 fd ff ff       	call   c0009acc <unblock>
c0009cdb:	83 c4 10             	add    $0x10,%esp
c0009cde:	eb 0d                	jmp    c0009ced <inform_int+0xca>
c0009ce0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ce3:	c7 80 5c 02 00 00 01 	movl   $0x1,0x25c(%eax)
c0009cea:	00 00 00 
c0009ced:	90                   	nop
c0009cee:	c9                   	leave  
c0009cef:	c3                   	ret    

c0009cf0 <strcmp>:
c0009cf0:	55                   	push   %ebp
c0009cf1:	89 e5                	mov    %esp,%ebp
c0009cf3:	83 ec 10             	sub    $0x10,%esp
c0009cf6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0009cfa:	74 06                	je     c0009d02 <strcmp+0x12>
c0009cfc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009d00:	75 08                	jne    c0009d0a <strcmp+0x1a>
c0009d02:	8b 45 08             	mov    0x8(%ebp),%eax
c0009d05:	2b 45 0c             	sub    0xc(%ebp),%eax
c0009d08:	eb 53                	jmp    c0009d5d <strcmp+0x6d>
c0009d0a:	8b 45 08             	mov    0x8(%ebp),%eax
c0009d0d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009d10:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009d13:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009d16:	eb 18                	jmp    c0009d30 <strcmp+0x40>
c0009d18:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009d1b:	0f b6 10             	movzbl (%eax),%edx
c0009d1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009d21:	0f b6 00             	movzbl (%eax),%eax
c0009d24:	38 c2                	cmp    %al,%dl
c0009d26:	75 1e                	jne    c0009d46 <strcmp+0x56>
c0009d28:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009d2c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009d30:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009d33:	0f b6 00             	movzbl (%eax),%eax
c0009d36:	84 c0                	test   %al,%al
c0009d38:	74 0d                	je     c0009d47 <strcmp+0x57>
c0009d3a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009d3d:	0f b6 00             	movzbl (%eax),%eax
c0009d40:	84 c0                	test   %al,%al
c0009d42:	75 d4                	jne    c0009d18 <strcmp+0x28>
c0009d44:	eb 01                	jmp    c0009d47 <strcmp+0x57>
c0009d46:	90                   	nop
c0009d47:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009d4a:	0f b6 00             	movzbl (%eax),%eax
c0009d4d:	0f be d0             	movsbl %al,%edx
c0009d50:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009d53:	0f b6 00             	movzbl (%eax),%eax
c0009d56:	0f be c0             	movsbl %al,%eax
c0009d59:	29 c2                	sub    %eax,%edx
c0009d5b:	89 d0                	mov    %edx,%eax
c0009d5d:	c9                   	leave  
c0009d5e:	c3                   	ret    

c0009d5f <create_user_process_address_space>:
c0009d5f:	55                   	push   %ebp
c0009d60:	89 e5                	mov    %esp,%ebp
c0009d62:	83 ec 18             	sub    $0x18,%esp
c0009d65:	83 ec 08             	sub    $0x8,%esp
c0009d68:	6a 00                	push   $0x0
c0009d6a:	6a 01                	push   $0x1
c0009d6c:	e8 b5 cf ff ff       	call   c0006d26 <alloc_memory>
c0009d71:	83 c4 10             	add    $0x10,%esp
c0009d74:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009d77:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d7a:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0009d81:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0009d88:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009d8b:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009d90:	c1 e8 0c             	shr    $0xc,%eax
c0009d93:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009d96:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d99:	83 c0 07             	add    $0x7,%eax
c0009d9c:	c1 e8 03             	shr    $0x3,%eax
c0009d9f:	89 c2                	mov    %eax,%edx
c0009da1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009da4:	89 50 04             	mov    %edx,0x4(%eax)
c0009da7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009daa:	8b 40 04             	mov    0x4(%eax),%eax
c0009dad:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009db2:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009db8:	85 c0                	test   %eax,%eax
c0009dba:	0f 48 c2             	cmovs  %edx,%eax
c0009dbd:	c1 f8 0c             	sar    $0xc,%eax
c0009dc0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009dc3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009dc6:	83 ec 08             	sub    $0x8,%esp
c0009dc9:	6a 00                	push   $0x0
c0009dcb:	50                   	push   %eax
c0009dcc:	e8 55 cf ff ff       	call   c0006d26 <alloc_memory>
c0009dd1:	83 c4 10             	add    $0x10,%esp
c0009dd4:	89 c2                	mov    %eax,%edx
c0009dd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009dd9:	89 10                	mov    %edx,(%eax)
c0009ddb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009dde:	83 ec 0c             	sub    $0xc,%esp
c0009de1:	50                   	push   %eax
c0009de2:	e8 3d ca ff ff       	call   c0006824 <init_bitmap>
c0009de7:	83 c4 10             	add    $0x10,%esp
c0009dea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ded:	c9                   	leave  
c0009dee:	c3                   	ret    

c0009def <user_process>:
c0009def:	55                   	push   %ebp
c0009df0:	89 e5                	mov    %esp,%ebp
c0009df2:	83 ec 28             	sub    $0x28,%esp
c0009df5:	e8 92 7a ff ff       	call   c000188c <get_running_thread_pcb>
c0009dfa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009dfd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e00:	05 00 10 00 00       	add    $0x1000,%eax
c0009e05:	89 c2                	mov    %eax,%edx
c0009e07:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e0a:	89 10                	mov    %edx,(%eax)
c0009e0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e0f:	8b 00                	mov    (%eax),%eax
c0009e11:	8d 90 f0 fe ff ff    	lea    -0x110(%eax),%edx
c0009e17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e1a:	89 10                	mov    %edx,(%eax)
c0009e1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e1f:	8b 00                	mov    (%eax),%eax
c0009e21:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009e24:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
c0009e28:	66 c7 45 ec 02 12    	movw   $0x1202,-0x14(%ebp)
c0009e2e:	66 c7 45 ea 48 00    	movw   $0x48,-0x16(%ebp)
c0009e34:	66 c7 45 e8 50 00    	movw   $0x50,-0x18(%ebp)
c0009e3a:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009e3e:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
c0009e42:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009e46:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
c0009e4a:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009e4e:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
c0009e52:	66 c7 45 e0 38 00    	movw   $0x38,-0x20(%ebp)
c0009e58:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c0009e5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e5f:	89 50 34             	mov    %edx,0x34(%eax)
c0009e62:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009e66:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e69:	89 50 0c             	mov    %edx,0xc(%eax)
c0009e6c:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009e70:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e73:	89 50 04             	mov    %edx,0x4(%eax)
c0009e76:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009e7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e7d:	89 50 08             	mov    %edx,0x8(%eax)
c0009e80:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009e84:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e87:	89 50 40             	mov    %edx,0x40(%eax)
c0009e8a:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
c0009e8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e91:	89 10                	mov    %edx,(%eax)
c0009e93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e96:	8b 55 08             	mov    0x8(%ebp),%edx
c0009e99:	89 50 30             	mov    %edx,0x30(%eax)
c0009e9c:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
c0009ea0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ea3:	89 50 38             	mov    %edx,0x38(%eax)
c0009ea6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ea9:	83 ec 0c             	sub    $0xc,%esp
c0009eac:	50                   	push   %eax
c0009ead:	e8 af 78 ff ff       	call   c0001761 <restart>
c0009eb2:	83 c4 10             	add    $0x10,%esp
c0009eb5:	90                   	nop
c0009eb6:	c9                   	leave  
c0009eb7:	c3                   	ret    

c0009eb8 <process_execute>:
c0009eb8:	55                   	push   %ebp
c0009eb9:	89 e5                	mov    %esp,%ebp
c0009ebb:	83 ec 28             	sub    $0x28,%esp
c0009ebe:	e8 94 02 00 00       	call   c000a157 <thread_init>
c0009ec3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009ec6:	83 ec 0c             	sub    $0xc,%esp
c0009ec9:	ff 75 f4             	pushl  -0xc(%ebp)
c0009ecc:	e8 ed 02 00 00       	call   c000a1be <thread_create>
c0009ed1:	83 c4 10             	add    $0x10,%esp
c0009ed4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ed7:	05 30 01 00 00       	add    $0x130,%eax
c0009edc:	83 ec 08             	sub    $0x8,%esp
c0009edf:	ff 75 10             	pushl  0x10(%ebp)
c0009ee2:	50                   	push   %eax
c0009ee3:	e8 da 0f 00 00       	call   c000aec2 <Strcpy>
c0009ee8:	83 c4 10             	add    $0x10,%esp
c0009eeb:	83 ec 08             	sub    $0x8,%esp
c0009eee:	6a 00                	push   $0x0
c0009ef0:	6a 01                	push   $0x1
c0009ef2:	e8 2f ce ff ff       	call   c0006d26 <alloc_memory>
c0009ef7:	83 c4 10             	add    $0x10,%esp
c0009efa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009efd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f00:	05 00 0c 00 00       	add    $0xc00,%eax
c0009f05:	83 ec 04             	sub    $0x4,%esp
c0009f08:	68 00 04 00 00       	push   $0x400
c0009f0d:	68 00 fc ff ff       	push   $0xfffffc00
c0009f12:	50                   	push   %eax
c0009f13:	e8 5d 0f 00 00       	call   c000ae75 <Memcpy>
c0009f18:	83 c4 10             	add    $0x10,%esp
c0009f1b:	83 ec 0c             	sub    $0xc,%esp
c0009f1e:	ff 75 f0             	pushl  -0x10(%ebp)
c0009f21:	e8 ce cd ff ff       	call   c0006cf4 <get_physical_address>
c0009f26:	83 c4 10             	add    $0x10,%esp
c0009f29:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009f2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f2f:	05 fc 0f 00 00       	add    $0xffc,%eax
c0009f34:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009f37:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009f3a:	83 c8 07             	or     $0x7,%eax
c0009f3d:	89 c2                	mov    %eax,%edx
c0009f3f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009f42:	89 10                	mov    %edx,(%eax)
c0009f44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f47:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0009f4a:	89 50 04             	mov    %edx,0x4(%eax)
c0009f4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f50:	83 c0 0c             	add    $0xc,%eax
c0009f53:	83 ec 0c             	sub    $0xc,%esp
c0009f56:	50                   	push   %eax
c0009f57:	e8 bb d2 ff ff       	call   c0007217 <init_memory_block_desc>
c0009f5c:	83 c4 10             	add    $0x10,%esp
c0009f5f:	e8 fb fd ff ff       	call   c0009d5f <create_user_process_address_space>
c0009f64:	89 c2                	mov    %eax,%edx
c0009f66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f69:	89 50 08             	mov    %edx,0x8(%eax)
c0009f6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f6f:	8b 00                	mov    (%eax),%eax
c0009f71:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009f74:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009f77:	c7 40 10 ef 9d 00 c0 	movl   $0xc0009def,0x10(%eax)
c0009f7e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009f81:	8b 55 08             	mov    0x8(%ebp),%edx
c0009f84:	89 50 18             	mov    %edx,0x18(%eax)
c0009f87:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009f8a:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009f8d:	89 50 1c             	mov    %edx,0x1c(%eax)
c0009f90:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0009f93:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009f96:	89 50 20             	mov    %edx,0x20(%eax)
c0009f99:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009f9c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0009fa2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009fa5:	8b 10                	mov    (%eax),%edx
c0009fa7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009faa:	89 50 04             	mov    %edx,0x4(%eax)
c0009fad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009fb0:	8b 50 04             	mov    0x4(%eax),%edx
c0009fb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009fb6:	89 50 08             	mov    %edx,0x8(%eax)
c0009fb9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009fbc:	8b 50 08             	mov    0x8(%eax),%edx
c0009fbf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009fc2:	89 50 0c             	mov    %edx,0xc(%eax)
c0009fc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fc8:	05 fc 00 00 00       	add    $0xfc,%eax
c0009fcd:	83 ec 08             	sub    $0x8,%esp
c0009fd0:	50                   	push   %eax
c0009fd1:	68 8c fd 00 c0       	push   $0xc000fd8c
c0009fd6:	e8 89 00 00 00       	call   c000a064 <appendToDoubleLinkList>
c0009fdb:	83 c4 10             	add    $0x10,%esp
c0009fde:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fe1:	05 04 01 00 00       	add    $0x104,%eax
c0009fe6:	83 ec 08             	sub    $0x8,%esp
c0009fe9:	50                   	push   %eax
c0009fea:	68 d4 1e 01 c0       	push   $0xc0011ed4
c0009fef:	e8 70 00 00 00       	call   c000a064 <appendToDoubleLinkList>
c0009ff4:	83 c4 10             	add    $0x10,%esp
c0009ff7:	90                   	nop
c0009ff8:	c9                   	leave  
c0009ff9:	c3                   	ret    
c0009ffa:	66 90                	xchg   %ax,%ax
c0009ffc:	66 90                	xchg   %ax,%ax
c0009ffe:	66 90                	xchg   %ax,%ax

c000a000 <switch_to>:
c000a000:	56                   	push   %esi
c000a001:	57                   	push   %edi
c000a002:	53                   	push   %ebx
c000a003:	55                   	push   %ebp
c000a004:	89 e5                	mov    %esp,%ebp
c000a006:	8b 45 14             	mov    0x14(%ebp),%eax
c000a009:	89 20                	mov    %esp,(%eax)
c000a00b:	8b 45 18             	mov    0x18(%ebp),%eax
c000a00e:	8b 20                	mov    (%eax),%esp
c000a010:	5d                   	pop    %ebp
c000a011:	5b                   	pop    %ebx
c000a012:	5f                   	pop    %edi
c000a013:	5e                   	pop    %esi
c000a014:	c3                   	ret    

c000a015 <initDoubleLinkList>:
c000a015:	55                   	push   %ebp
c000a016:	89 e5                	mov    %esp,%ebp
c000a018:	8b 45 08             	mov    0x8(%ebp),%eax
c000a01b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a021:	8b 45 08             	mov    0x8(%ebp),%eax
c000a024:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a02b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a02e:	8d 50 08             	lea    0x8(%eax),%edx
c000a031:	8b 45 08             	mov    0x8(%ebp),%eax
c000a034:	89 50 04             	mov    %edx,0x4(%eax)
c000a037:	8b 55 08             	mov    0x8(%ebp),%edx
c000a03a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a03d:	89 50 08             	mov    %edx,0x8(%eax)
c000a040:	90                   	nop
c000a041:	5d                   	pop    %ebp
c000a042:	c3                   	ret    

c000a043 <isListEmpty>:
c000a043:	55                   	push   %ebp
c000a044:	89 e5                	mov    %esp,%ebp
c000a046:	8b 45 08             	mov    0x8(%ebp),%eax
c000a049:	8b 40 04             	mov    0x4(%eax),%eax
c000a04c:	8b 55 08             	mov    0x8(%ebp),%edx
c000a04f:	83 c2 08             	add    $0x8,%edx
c000a052:	39 d0                	cmp    %edx,%eax
c000a054:	75 07                	jne    c000a05d <isListEmpty+0x1a>
c000a056:	b8 01 00 00 00       	mov    $0x1,%eax
c000a05b:	eb 05                	jmp    c000a062 <isListEmpty+0x1f>
c000a05d:	b8 00 00 00 00       	mov    $0x0,%eax
c000a062:	5d                   	pop    %ebp
c000a063:	c3                   	ret    

c000a064 <appendToDoubleLinkList>:
c000a064:	55                   	push   %ebp
c000a065:	89 e5                	mov    %esp,%ebp
c000a067:	83 ec 10             	sub    $0x10,%esp
c000a06a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a06d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a070:	8b 45 08             	mov    0x8(%ebp),%eax
c000a073:	8b 50 08             	mov    0x8(%eax),%edx
c000a076:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a079:	89 10                	mov    %edx,(%eax)
c000a07b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a07e:	8b 40 08             	mov    0x8(%eax),%eax
c000a081:	85 c0                	test   %eax,%eax
c000a083:	74 0c                	je     c000a091 <appendToDoubleLinkList+0x2d>
c000a085:	8b 45 08             	mov    0x8(%ebp),%eax
c000a088:	8b 40 08             	mov    0x8(%eax),%eax
c000a08b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a08e:	89 50 04             	mov    %edx,0x4(%eax)
c000a091:	8b 45 08             	mov    0x8(%ebp),%eax
c000a094:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a097:	89 50 08             	mov    %edx,0x8(%eax)
c000a09a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a09d:	8d 50 08             	lea    0x8(%eax),%edx
c000a0a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a0a3:	89 50 04             	mov    %edx,0x4(%eax)
c000a0a6:	90                   	nop
c000a0a7:	c9                   	leave  
c000a0a8:	c3                   	ret    

c000a0a9 <insertToDoubleLinkList>:
c000a0a9:	55                   	push   %ebp
c000a0aa:	89 e5                	mov    %esp,%ebp
c000a0ac:	83 ec 10             	sub    $0x10,%esp
c000a0af:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a0b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a0b5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0b8:	8b 50 04             	mov    0x4(%eax),%edx
c000a0bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a0be:	89 50 04             	mov    %edx,0x4(%eax)
c000a0c1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0c4:	8b 40 04             	mov    0x4(%eax),%eax
c000a0c7:	85 c0                	test   %eax,%eax
c000a0c9:	74 0b                	je     c000a0d6 <insertToDoubleLinkList+0x2d>
c000a0cb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0ce:	8b 40 04             	mov    0x4(%eax),%eax
c000a0d1:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a0d4:	89 10                	mov    %edx,(%eax)
c000a0d6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0d9:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a0dc:	89 50 04             	mov    %edx,0x4(%eax)
c000a0df:	8b 55 08             	mov    0x8(%ebp),%edx
c000a0e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a0e5:	89 10                	mov    %edx,(%eax)
c000a0e7:	90                   	nop
c000a0e8:	c9                   	leave  
c000a0e9:	c3                   	ret    

c000a0ea <popFromDoubleLinkList>:
c000a0ea:	55                   	push   %ebp
c000a0eb:	89 e5                	mov    %esp,%ebp
c000a0ed:	83 ec 10             	sub    $0x10,%esp
c000a0f0:	ff 75 08             	pushl  0x8(%ebp)
c000a0f3:	e8 4b ff ff ff       	call   c000a043 <isListEmpty>
c000a0f8:	83 c4 04             	add    $0x4,%esp
c000a0fb:	3c 01                	cmp    $0x1,%al
c000a0fd:	75 07                	jne    c000a106 <popFromDoubleLinkList+0x1c>
c000a0ff:	b8 00 00 00 00       	mov    $0x0,%eax
c000a104:	eb 37                	jmp    c000a13d <popFromDoubleLinkList+0x53>
c000a106:	8b 45 08             	mov    0x8(%ebp),%eax
c000a109:	8b 40 08             	mov    0x8(%eax),%eax
c000a10c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a10f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a112:	8b 40 08             	mov    0x8(%eax),%eax
c000a115:	8b 00                	mov    (%eax),%eax
c000a117:	85 c0                	test   %eax,%eax
c000a119:	74 11                	je     c000a12c <popFromDoubleLinkList+0x42>
c000a11b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a11e:	8b 40 08             	mov    0x8(%eax),%eax
c000a121:	8b 00                	mov    (%eax),%eax
c000a123:	8b 55 08             	mov    0x8(%ebp),%edx
c000a126:	83 c2 08             	add    $0x8,%edx
c000a129:	89 50 04             	mov    %edx,0x4(%eax)
c000a12c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a12f:	8b 40 08             	mov    0x8(%eax),%eax
c000a132:	8b 10                	mov    (%eax),%edx
c000a134:	8b 45 08             	mov    0x8(%ebp),%eax
c000a137:	89 50 08             	mov    %edx,0x8(%eax)
c000a13a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a13d:	c9                   	leave  
c000a13e:	c3                   	ret    

c000a13f <kernel_thread>:
c000a13f:	55                   	push   %ebp
c000a140:	89 e5                	mov    %esp,%ebp
c000a142:	83 ec 08             	sub    $0x8,%esp
c000a145:	fb                   	sti    
c000a146:	83 ec 0c             	sub    $0xc,%esp
c000a149:	ff 75 0c             	pushl  0xc(%ebp)
c000a14c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a14f:	ff d0                	call   *%eax
c000a151:	83 c4 10             	add    $0x10,%esp
c000a154:	90                   	nop
c000a155:	c9                   	leave  
c000a156:	c3                   	ret    

c000a157 <thread_init>:
c000a157:	55                   	push   %ebp
c000a158:	89 e5                	mov    %esp,%ebp
c000a15a:	83 ec 18             	sub    $0x18,%esp
c000a15d:	83 ec 08             	sub    $0x8,%esp
c000a160:	6a 00                	push   $0x0
c000a162:	6a 01                	push   $0x1
c000a164:	e8 bd cb ff ff       	call   c0006d26 <alloc_memory>
c000a169:	83 c4 10             	add    $0x10,%esp
c000a16c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a16f:	83 ec 04             	sub    $0x4,%esp
c000a172:	68 00 10 00 00       	push   $0x1000
c000a177:	6a 00                	push   $0x0
c000a179:	ff 75 f4             	pushl  -0xc(%ebp)
c000a17c:	e8 22 0d 00 00       	call   c000aea3 <Memset>
c000a181:	83 c4 10             	add    $0x10,%esp
c000a184:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a187:	05 00 10 00 00       	add    $0x1000,%eax
c000a18c:	89 c2                	mov    %eax,%edx
c000a18e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a191:	89 10                	mov    %edx,(%eax)
c000a193:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a196:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000a19d:	a1 30 f7 00 c0       	mov    0xc000f730,%eax
c000a1a2:	83 c0 01             	add    $0x1,%eax
c000a1a5:	a3 30 f7 00 c0       	mov    %eax,0xc000f730
c000a1aa:	8b 15 30 f7 00 c0    	mov    0xc000f730,%edx
c000a1b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1b3:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c000a1b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1bc:	c9                   	leave  
c000a1bd:	c3                   	ret    

c000a1be <thread_create>:
c000a1be:	55                   	push   %ebp
c000a1bf:	89 e5                	mov    %esp,%ebp
c000a1c1:	83 ec 10             	sub    $0x10,%esp
c000a1c4:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000a1cb:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c000a1d2:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1d5:	8b 00                	mov    (%eax),%eax
c000a1d7:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000a1da:	89 c2                	mov    %eax,%edx
c000a1dc:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1df:	89 10                	mov    %edx,(%eax)
c000a1e1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1e4:	8b 00                	mov    (%eax),%eax
c000a1e6:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000a1e9:	89 c2                	mov    %eax,%edx
c000a1eb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1ee:	89 10                	mov    %edx,(%eax)
c000a1f0:	90                   	nop
c000a1f1:	c9                   	leave  
c000a1f2:	c3                   	ret    

c000a1f3 <thread_start>:
c000a1f3:	55                   	push   %ebp
c000a1f4:	89 e5                	mov    %esp,%ebp
c000a1f6:	83 ec 18             	sub    $0x18,%esp
c000a1f9:	e8 59 ff ff ff       	call   c000a157 <thread_init>
c000a1fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a201:	83 ec 0c             	sub    $0xc,%esp
c000a204:	ff 75 f4             	pushl  -0xc(%ebp)
c000a207:	e8 b2 ff ff ff       	call   c000a1be <thread_create>
c000a20c:	83 c4 10             	add    $0x10,%esp
c000a20f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a212:	05 30 01 00 00       	add    $0x130,%eax
c000a217:	83 ec 08             	sub    $0x8,%esp
c000a21a:	ff 75 10             	pushl  0x10(%ebp)
c000a21d:	50                   	push   %eax
c000a21e:	e8 9f 0c 00 00       	call   c000aec2 <Strcpy>
c000a223:	83 c4 10             	add    $0x10,%esp
c000a226:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a229:	8b 00                	mov    (%eax),%eax
c000a22b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a22e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a231:	c7 40 10 3f a1 00 c0 	movl   $0xc000a13f,0x10(%eax)
c000a238:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a23b:	8b 55 08             	mov    0x8(%ebp),%edx
c000a23e:	89 50 18             	mov    %edx,0x18(%eax)
c000a241:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a244:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a247:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a24d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a253:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a256:	8b 10                	mov    (%eax),%edx
c000a258:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a25b:	89 50 04             	mov    %edx,0x4(%eax)
c000a25e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a261:	8b 50 04             	mov    0x4(%eax),%edx
c000a264:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a267:	89 50 08             	mov    %edx,0x8(%eax)
c000a26a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a26d:	8b 50 08             	mov    0x8(%eax),%edx
c000a270:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a273:	89 50 0c             	mov    %edx,0xc(%eax)
c000a276:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a279:	05 fc 00 00 00       	add    $0xfc,%eax
c000a27e:	83 ec 08             	sub    $0x8,%esp
c000a281:	50                   	push   %eax
c000a282:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a287:	e8 d8 fd ff ff       	call   c000a064 <appendToDoubleLinkList>
c000a28c:	83 c4 10             	add    $0x10,%esp
c000a28f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a292:	05 04 01 00 00       	add    $0x104,%eax
c000a297:	83 ec 08             	sub    $0x8,%esp
c000a29a:	50                   	push   %eax
c000a29b:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a2a0:	e8 bf fd ff ff       	call   c000a064 <appendToDoubleLinkList>
c000a2a5:	83 c4 10             	add    $0x10,%esp
c000a2a8:	90                   	nop
c000a2a9:	c9                   	leave  
c000a2aa:	c3                   	ret    
