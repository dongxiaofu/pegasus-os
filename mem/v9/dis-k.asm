
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
c0001525:	e8 c2 37 00 00       	call   c0004cec <ReloadGDT>
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
c000156a:	e8 1c 6a 00 00       	call   c0007f8b <test>
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
c0001661:	e8 3e 64 00 00       	call   c0007aa4 <exception_handler>
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
c000168d:	e8 da 32 00 00       	call   c000496c <clock_handler>
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
c00016c0:	e8 61 41 00 00       	call   c0005826 <keyboard_handler>
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
c00017de:	e8 5b 61 00 00       	call   c000793e <disp_int>
c00017e3:	83 c4 04             	add    $0x4,%esp
c00017e6:	58                   	pop    %eax
c00017e7:	5a                   	pop    %edx
c00017e8:	52                   	push   %edx
c00017e9:	50                   	push   %eax
c00017ea:	e8 4f 61 00 00       	call   c000793e <disp_int>
c00017ef:	58                   	pop    %eax
c00017f0:	5a                   	pop    %edx
c00017f1:	52                   	push   %edx
c00017f2:	50                   	push   %eax
c00017f3:	ff 35 44 f7 00 c0    	pushl  0xc000f744
c00017f9:	e8 40 61 00 00       	call   c000793e <disp_int>
c00017fe:	83 c4 04             	add    $0x4,%esp
c0001801:	58                   	pop    %eax
c0001802:	5a                   	pop    %edx
c0001803:	52                   	push   %edx
c0001804:	50                   	push   %eax
c0001805:	ff 72 ec             	pushl  -0x14(%edx)
c0001808:	e8 31 61 00 00       	call   c000793e <disp_int>
c000180d:	83 c4 04             	add    $0x4,%esp
c0001810:	58                   	pop    %eax
c0001811:	5a                   	pop    %edx
c0001812:	52                   	push   %edx
c0001813:	50                   	push   %eax
c0001814:	ff 70 ec             	pushl  -0x14(%eax)
c0001817:	e8 22 61 00 00       	call   c000793e <disp_int>
c000181c:	83 c4 04             	add    $0x4,%esp
c000181f:	58                   	pop    %eax
c0001820:	5a                   	pop    %edx
c0001821:	52                   	push   %edx
c0001822:	50                   	push   %eax
c0001823:	ff 35 60 fb 00 c0    	pushl  0xc000fb60
c0001829:	e8 10 61 00 00       	call   c000793e <disp_int>
c000182e:	83 c4 04             	add    $0x4,%esp
c0001831:	58                   	pop    %eax
c0001832:	5a                   	pop    %edx
c0001833:	52                   	push   %edx
c0001834:	50                   	push   %eax
c0001835:	68 00 f7 00 c0       	push   $0xc000f700
c000183a:	e8 ff 60 00 00       	call   c000793e <disp_int>
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
c00018a2:	68 20 a6 00 c0       	push   $0xc000a620
c00018a7:	68 2a a6 00 c0       	push   $0xc000a62a
c00018ac:	68 86 1a 00 c0       	push   $0xc0001a86
c00018b1:	e8 12 89 00 00       	call   c000a1c8 <process_execute>
c00018b6:	83 c4 10             	add    $0x10,%esp
c00018b9:	83 ec 04             	sub    $0x4,%esp
c00018bc:	68 37 a6 00 c0       	push   $0xc000a637
c00018c1:	68 3f a6 00 c0       	push   $0xc000a63f
c00018c6:	68 23 57 00 c0       	push   $0xc0005723
c00018cb:	e8 f8 88 00 00       	call   c000a1c8 <process_execute>
c00018d0:	83 c4 10             	add    $0x10,%esp
c00018d3:	83 ec 04             	sub    $0x4,%esp
c00018d6:	68 49 a6 00 c0       	push   $0xc000a649
c00018db:	68 50 a6 00 c0       	push   $0xc000a650
c00018e0:	68 bb 1a 00 c0       	push   $0xc0001abb
c00018e5:	e8 de 88 00 00       	call   c000a1c8 <process_execute>
c00018ea:	83 c4 10             	add    $0x10,%esp
c00018ed:	83 ec 04             	sub    $0x4,%esp
c00018f0:	68 59 a6 00 c0       	push   $0xc000a659
c00018f5:	68 61 a6 00 c0       	push   $0xc000a661
c00018fa:	68 44 28 00 c0       	push   $0xc0002844
c00018ff:	e8 c4 88 00 00       	call   c000a1c8 <process_execute>
c0001904:	83 c4 10             	add    $0x10,%esp
c0001907:	83 ec 04             	sub    $0x4,%esp
c000190a:	68 6a a6 00 c0       	push   $0xc000a66a
c000190f:	68 71 a6 00 c0       	push   $0xc000a671
c0001914:	68 1f 61 00 c0       	push   $0xc000611f
c0001919:	e8 aa 88 00 00       	call   c000a1c8 <process_execute>
c000191e:	83 c4 10             	add    $0x10,%esp
c0001921:	83 ec 0c             	sub    $0xc,%esp
c0001924:	68 7a a6 00 c0       	push   $0xc000a67a
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
c0001951:	68 84 a6 00 c0       	push   $0xc000a684
c0001956:	e8 31 fc ff ff       	call   c000158c <disp_str>
c000195b:	83 c4 10             	add    $0x10,%esp
c000195e:	e8 dd 66 00 00       	call   c0008040 <init_keyboard>
c0001963:	83 ec 0c             	sub    $0xc,%esp
c0001966:	68 00 00 00 02       	push   $0x2000000
c000196b:	e8 ec 5b 00 00       	call   c000755c <init_memory>
c0001970:	83 c4 10             	add    $0x10,%esp
c0001973:	83 ec 0c             	sub    $0xc,%esp
c0001976:	68 8c fd 00 c0       	push   $0xc000fd8c
c000197b:	e8 a5 89 00 00       	call   c000a325 <initDoubleLinkList>
c0001980:	83 c4 10             	add    $0x10,%esp
c0001983:	83 ec 0c             	sub    $0xc,%esp
c0001986:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000198b:	e8 95 89 00 00       	call   c000a325 <initDoubleLinkList>
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
c00019c4:	68 8a a6 00 c0       	push   $0xc000a68a
c00019c9:	e8 be fb ff ff       	call   c000158c <disp_str>
c00019ce:	83 c4 10             	add    $0x10,%esp
c00019d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00019d4:	8d 50 01             	lea    0x1(%eax),%edx
c00019d7:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00019da:	83 ec 0c             	sub    $0xc,%esp
c00019dd:	50                   	push   %eax
c00019de:	e8 5b 5f 00 00       	call   c000793e <disp_int>
c00019e3:	83 c4 10             	add    $0x10,%esp
c00019e6:	83 ec 0c             	sub    $0xc,%esp
c00019e9:	68 93 a6 00 c0       	push   $0xc000a693
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
c0001a26:	68 95 a6 00 c0       	push   $0xc000a695
c0001a2b:	e8 5c fb ff ff       	call   c000158c <disp_str>
c0001a30:	83 c4 10             	add    $0x10,%esp
c0001a33:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a36:	8d 50 01             	lea    0x1(%eax),%edx
c0001a39:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0001a3c:	83 ec 0c             	sub    $0xc,%esp
c0001a3f:	50                   	push   %eax
c0001a40:	e8 f9 5e 00 00       	call   c000793e <disp_int>
c0001a45:	83 c4 10             	add    $0x10,%esp
c0001a48:	83 ec 0c             	sub    $0xc,%esp
c0001a4b:	68 93 a6 00 c0       	push   $0xc000a693
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
c0001a8f:	68 9e a6 00 c0       	push   $0xc000a69e
c0001a94:	e8 f3 fa ff ff       	call   c000158c <disp_str>
c0001a99:	83 c4 10             	add    $0x10,%esp
c0001a9c:	e8 b8 68 00 00       	call   c0008359 <TestTTY>
c0001aa1:	eb fe                	jmp    c0001aa1 <user_proc_a+0x1b>

c0001aa3 <user_proc_b>:
c0001aa3:	55                   	push   %ebp
c0001aa4:	89 e5                	mov    %esp,%ebp
c0001aa6:	83 ec 08             	sub    $0x8,%esp
c0001aa9:	83 ec 0c             	sub    $0xc,%esp
c0001aac:	68 b0 a6 00 c0       	push   $0xc000a6b0
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
c0001ad3:	e8 ed 52 00 00       	call   c0006dc5 <sys_malloc>
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
c0001b18:	e8 c5 7d 00 00       	call   c00098e2 <send_rec>
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
c0001b55:	68 c4 a6 00 c0       	push   $0xc000a6c4
c0001b5a:	68 c4 a6 00 c0       	push   $0xc000a6c4
c0001b5f:	68 cc a6 00 c0       	push   $0xc000a6cc
c0001b64:	e8 85 75 00 00       	call   c00090ee <assertion_failure>
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
c0001bb7:	68 12 a7 00 c0       	push   $0xc000a712
c0001bbc:	e8 e9 74 00 00       	call   c00090aa <spin>
c0001bc1:	83 c4 10             	add    $0x10,%esp
c0001bc4:	90                   	nop
c0001bc5:	83 ec 04             	sub    $0x4,%esp
c0001bc8:	6a 6c                	push   $0x6c
c0001bca:	6a 00                	push   $0x0
c0001bcc:	ff 75 08             	pushl  0x8(%ebp)
c0001bcf:	e8 5e 96 00 00       	call   c000b232 <Memset>
c0001bd4:	83 c4 10             	add    $0x10,%esp
c0001bd7:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bda:	c7 40 68 64 00 00 00 	movl   $0x64,0x68(%eax)
c0001be1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001be4:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001beb:	83 ec 04             	sub    $0x4,%esp
c0001bee:	6a 04                	push   $0x4
c0001bf0:	ff 75 08             	pushl  0x8(%ebp)
c0001bf3:	6a 01                	push   $0x1
c0001bf5:	e8 e8 7c 00 00       	call   c00098e2 <send_rec>
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
c0001c26:	68 24 a7 00 c0       	push   $0xc000a724
c0001c2b:	e8 a0 74 00 00       	call   c00090d0 <panic>
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
c0001d87:	e8 a6 94 00 00       	call   c000b232 <Memset>
c0001d8c:	83 c4 10             	add    $0x10,%esp
c0001d8f:	83 ec 04             	sub    $0x4,%esp
c0001d92:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d95:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d98:	68 f0 01 00 00       	push   $0x1f0
c0001d9d:	e8 e4 94 00 00       	call   c000b286 <read_port>
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
c0001f05:	e8 47 93 00 00       	call   c000b251 <Strcpy>
c0001f0a:	83 c4 10             	add    $0x10,%esp
c0001f0d:	eb 13                	jmp    c0001f22 <print_hdinfo+0x167>
c0001f0f:	83 ec 08             	sub    $0x8,%esp
c0001f12:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001f15:	50                   	push   %eax
c0001f16:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f19:	50                   	push   %eax
c0001f1a:	e8 32 93 00 00       	call   c000b251 <Strcpy>
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
c0001f59:	68 2e a7 00 c0       	push   $0xc000a72e
c0001f5e:	e8 17 6e 00 00       	call   c0008d7a <Printf>
c0001f63:	83 c4 10             	add    $0x10,%esp
c0001f66:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f69:	8b 40 0c             	mov    0xc(%eax),%eax
c0001f6c:	83 ec 08             	sub    $0x8,%esp
c0001f6f:	50                   	push   %eax
c0001f70:	68 36 a7 00 c0       	push   $0xc000a736
c0001f75:	e8 00 6e 00 00       	call   c0008d7a <Printf>
c0001f7a:	83 c4 10             	add    $0x10,%esp
c0001f7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f80:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001f84:	0f b6 c0             	movzbl %al,%eax
c0001f87:	83 ec 08             	sub    $0x8,%esp
c0001f8a:	50                   	push   %eax
c0001f8b:	68 47 a7 00 c0       	push   $0xc000a747
c0001f90:	e8 e5 6d 00 00       	call   c0008d7a <Printf>
c0001f95:	83 c4 10             	add    $0x10,%esp
c0001f98:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f9b:	0f b6 00             	movzbl (%eax),%eax
c0001f9e:	0f b6 c0             	movzbl %al,%eax
c0001fa1:	83 ec 08             	sub    $0x8,%esp
c0001fa4:	50                   	push   %eax
c0001fa5:	68 55 a7 00 c0       	push   $0xc000a755
c0001faa:	e8 cb 6d 00 00       	call   c0008d7a <Printf>
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
c000204e:	e8 df 91 00 00       	call   c000b232 <Memset>
c0002053:	83 c4 10             	add    $0x10,%esp
c0002056:	83 ec 04             	sub    $0x4,%esp
c0002059:	ff 75 f4             	pushl  -0xc(%ebp)
c000205c:	ff 75 ec             	pushl  -0x14(%ebp)
c000205f:	68 f0 01 00 00       	push   $0x1f0
c0002064:	e8 1d 92 00 00       	call   c000b286 <read_port>
c0002069:	83 c4 10             	add    $0x10,%esp
c000206c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000206f:	05 be 01 00 00       	add    $0x1be,%eax
c0002074:	83 ec 04             	sub    $0x4,%esp
c0002077:	6a 40                	push   $0x40
c0002079:	50                   	push   %eax
c000207a:	ff 75 10             	pushl  0x10(%ebp)
c000207d:	e8 82 91 00 00       	call   c000b204 <Memcpy>
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
c00020eb:	e8 42 91 00 00       	call   c000b232 <Memset>
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
c000221d:	e8 10 90 00 00       	call   c000b232 <Memset>
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
c0002377:	68 60 a7 00 c0       	push   $0xc000a760
c000237c:	e8 4f 6d 00 00       	call   c00090d0 <panic>
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
c0002392:	e8 2e 4a 00 00       	call   c0006dc5 <sys_malloc>
c0002397:	83 c4 10             	add    $0x10,%esp
c000239a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000239d:	83 ec 04             	sub    $0x4,%esp
c00023a0:	6a 6c                	push   $0x6c
c00023a2:	6a 00                	push   $0x0
c00023a4:	ff 75 f4             	pushl  -0xc(%ebp)
c00023a7:	e8 86 8e 00 00       	call   c000b232 <Memset>
c00023ac:	83 c4 10             	add    $0x10,%esp
c00023af:	83 ec 04             	sub    $0x4,%esp
c00023b2:	68 13 02 00 00       	push   $0x213
c00023b7:	ff 75 f4             	pushl  -0xc(%ebp)
c00023ba:	6a 02                	push   $0x2
c00023bc:	e8 21 75 00 00       	call   c00098e2 <send_rec>
c00023c1:	83 c4 10             	add    $0x10,%esp
c00023c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023c7:	83 ec 08             	sub    $0x8,%esp
c00023ca:	6a 6c                	push   $0x6c
c00023cc:	50                   	push   %eax
c00023cd:	e8 d2 4c 00 00       	call   c00070a4 <sys_free>
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
c00024cc:	e8 b3 47 00 00       	call   c0006c84 <alloc_virtual_memory>
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
c00024f1:	68 c4 a6 00 c0       	push   $0xc000a6c4
c00024f6:	68 c4 a6 00 c0       	push   $0xc000a6c4
c00024fb:	68 72 a7 00 c0       	push   $0xc000a772
c0002500:	e8 e9 6b 00 00       	call   c00090ee <assertion_failure>
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
c0002563:	68 c4 a6 00 c0       	push   $0xc000a6c4
c0002568:	68 c4 a6 00 c0       	push   $0xc000a6c4
c000256d:	68 90 a7 00 c0       	push   $0xc000a790
c0002572:	e8 77 6b 00 00       	call   c00090ee <assertion_failure>
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
c00025be:	e8 6f 8c 00 00       	call   c000b232 <Memset>
c00025c3:	83 c4 10             	add    $0x10,%esp
c00025c6:	83 ec 04             	sub    $0x4,%esp
c00025c9:	68 00 02 00 00       	push   $0x200
c00025ce:	68 80 21 01 c0       	push   $0xc0012180
c00025d3:	68 f0 01 00 00       	push   $0x1f0
c00025d8:	e8 a9 8c 00 00       	call   c000b286 <read_port>
c00025dd:	83 c4 10             	add    $0x10,%esp
c00025e0:	83 ec 04             	sub    $0x4,%esp
c00025e3:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025e6:	68 80 21 01 c0       	push   $0xc0012180
c00025eb:	ff 75 f0             	pushl  -0x10(%ebp)
c00025ee:	e8 11 8c 00 00       	call   c000b204 <Memcpy>
c00025f3:	83 c4 10             	add    $0x10,%esp
c00025f6:	eb 26                	jmp    c000261e <hd_rdwt+0x246>
c00025f8:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00025fc:	75 20                	jne    c000261e <hd_rdwt+0x246>
c00025fe:	e8 53 fd ff ff       	call   c0002356 <wait_for>
c0002603:	83 ec 04             	sub    $0x4,%esp
c0002606:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002609:	ff 75 f0             	pushl  -0x10(%ebp)
c000260c:	68 f0 01 00 00       	push   $0x1f0
c0002611:	e8 84 8c 00 00       	call   c000b29a <write_port>
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
c0002658:	e8 14 75 00 00       	call   c0009b71 <inform_int>
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
c00026b0:	68 c4 a7 00 c0       	push   $0xc000a7c4
c00026b5:	e8 c0 66 00 00       	call   c0008d7a <Printf>
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
c00026ed:	68 e1 a7 00 c0       	push   $0xc000a7e1
c00026f2:	e8 83 66 00 00       	call   c0008d7a <Printf>
c00026f7:	83 c4 10             	add    $0x10,%esp
c00026fa:	eb 01                	jmp    c00026fd <print_hd_info+0x56>
c00026fc:	90                   	nop
c00026fd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002701:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c0002705:	7e bf                	jle    c00026c6 <print_hd_info+0x1f>
c0002707:	83 ec 0c             	sub    $0xc,%esp
c000270a:	68 f9 a7 00 c0       	push   $0xc000a7f9
c000270f:	e8 66 66 00 00       	call   c0008d7a <Printf>
c0002714:	83 c4 10             	add    $0x10,%esp
c0002717:	83 ec 0c             	sub    $0xc,%esp
c000271a:	68 14 a8 00 c0       	push   $0xc000a814
c000271f:	e8 56 66 00 00       	call   c0008d7a <Printf>
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
c0002767:	68 e1 a7 00 c0       	push   $0xc000a7e1
c000276c:	e8 09 66 00 00       	call   c0008d7a <Printf>
c0002771:	83 c4 10             	add    $0x10,%esp
c0002774:	eb 01                	jmp    c0002777 <print_hd_info+0xd0>
c0002776:	90                   	nop
c0002777:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000277b:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c000277f:	7e b6                	jle    c0002737 <print_hd_info+0x90>
c0002781:	83 ec 0c             	sub    $0xc,%esp
c0002784:	68 31 a8 00 c0       	push   $0xc000a831
c0002789:	e8 ec 65 00 00       	call   c0008d7a <Printf>
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
c0002852:	83 ec 0c             	sub    $0xc,%esp
c0002855:	6a 6c                	push   $0x6c
c0002857:	e8 69 45 00 00       	call   c0006dc5 <sys_malloc>
c000285c:	83 c4 10             	add    $0x10,%esp
c000285f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002862:	83 ec 0c             	sub    $0xc,%esp
c0002865:	6a 6c                	push   $0x6c
c0002867:	e8 59 45 00 00       	call   c0006dc5 <sys_malloc>
c000286c:	83 c4 10             	add    $0x10,%esp
c000286f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002872:	83 ec 04             	sub    $0x4,%esp
c0002875:	6a 6c                	push   $0x6c
c0002877:	6a 00                	push   $0x0
c0002879:	ff 75 f0             	pushl  -0x10(%ebp)
c000287c:	e8 b1 89 00 00       	call   c000b232 <Memset>
c0002881:	83 c4 10             	add    $0x10,%esp
c0002884:	83 ec 04             	sub    $0x4,%esp
c0002887:	6a 0e                	push   $0xe
c0002889:	ff 75 f0             	pushl  -0x10(%ebp)
c000288c:	6a 02                	push   $0x2
c000288e:	e8 4f 70 00 00       	call   c00098e2 <send_rec>
c0002893:	83 c4 10             	add    $0x10,%esp
c0002896:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002899:	8b 40 68             	mov    0x68(%eax),%eax
c000289c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000289f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028a2:	8b 00                	mov    (%eax),%eax
c00028a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00028a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028aa:	8b 40 40             	mov    0x40(%eax),%eax
c00028ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00028b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028b3:	8b 40 58             	mov    0x58(%eax),%eax
c00028b6:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00028b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028bc:	8b 00                	mov    (%eax),%eax
c00028be:	85 c0                	test   %eax,%eax
c00028c0:	75 07                	jne    c00028c9 <task_fs+0x85>
c00028c2:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00028c9:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00028d0:	83 ec 0c             	sub    $0xc,%esp
c00028d3:	ff 75 e4             	pushl  -0x1c(%ebp)
c00028d6:	e8 b5 20 00 00       	call   c0004990 <pid2proc>
c00028db:	83 c4 10             	add    $0x10,%esp
c00028de:	a3 64 fb 00 c0       	mov    %eax,0xc000fb64
c00028e3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00028e7:	74 37                	je     c0002920 <task_fs+0xdc>
c00028e9:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c00028ed:	74 31                	je     c0002920 <task_fs+0xdc>
c00028ef:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c00028f3:	74 2b                	je     c0002920 <task_fs+0xdc>
c00028f5:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00028f9:	74 25                	je     c0002920 <task_fs+0xdc>
c00028fb:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c00028ff:	74 1f                	je     c0002920 <task_fs+0xdc>
c0002901:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0002905:	74 19                	je     c0002920 <task_fs+0xdc>
c0002907:	6a 76                	push   $0x76
c0002909:	68 50 a8 00 c0       	push   $0xc000a850
c000290e:	68 50 a8 00 c0       	push   $0xc000a850
c0002913:	68 60 a8 00 c0       	push   $0xc000a860
c0002918:	e8 d1 67 00 00       	call   c00090ee <assertion_failure>
c000291d:	83 c4 10             	add    $0x10,%esp
c0002920:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c0002924:	74 2f                	je     c0002955 <task_fs+0x111>
c0002926:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c000292a:	7f 15                	jg     c0002941 <task_fs+0xfd>
c000292c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0002930:	0f 84 a5 00 00 00    	je     c00029db <task_fs+0x197>
c0002936:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000293a:	74 64                	je     c00029a0 <task_fs+0x15c>
c000293c:	e9 88 00 00 00       	jmp    c00029c9 <task_fs+0x185>
c0002941:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c0002945:	74 46                	je     c000298d <task_fs+0x149>
c0002947:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c000294b:	74 63                	je     c00029b0 <task_fs+0x16c>
c000294d:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0002951:	74 3a                	je     c000298d <task_fs+0x149>
c0002953:	eb 74                	jmp    c00029c9 <task_fs+0x185>
c0002955:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002958:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000295f:	83 ec 0c             	sub    $0xc,%esp
c0002962:	ff 75 f0             	pushl  -0x10(%ebp)
c0002965:	e8 88 07 00 00       	call   c00030f2 <do_open>
c000296a:	83 c4 10             	add    $0x10,%esp
c000296d:	89 c2                	mov    %eax,%edx
c000296f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002972:	89 50 40             	mov    %edx,0x40(%eax)
c0002975:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002978:	8b 00                	mov    (%eax),%eax
c000297a:	83 ec 04             	sub    $0x4,%esp
c000297d:	50                   	push   %eax
c000297e:	ff 75 f0             	pushl  -0x10(%ebp)
c0002981:	6a 01                	push   $0x1
c0002983:	e8 5a 6f 00 00       	call   c00098e2 <send_rec>
c0002988:	83 c4 10             	add    $0x10,%esp
c000298b:	eb 4f                	jmp    c00029dc <task_fs+0x198>
c000298d:	83 ec 0c             	sub    $0xc,%esp
c0002990:	ff 75 f0             	pushl  -0x10(%ebp)
c0002993:	e8 98 18 00 00       	call   c0004230 <do_rdwt>
c0002998:	83 c4 10             	add    $0x10,%esp
c000299b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000299e:	eb 3c                	jmp    c00029dc <task_fs+0x198>
c00029a0:	83 ec 0c             	sub    $0xc,%esp
c00029a3:	ff 75 e0             	pushl  -0x20(%ebp)
c00029a6:	e8 a9 1d 00 00       	call   c0004754 <do_close>
c00029ab:	83 c4 10             	add    $0x10,%esp
c00029ae:	eb 2c                	jmp    c00029dc <task_fs+0x198>
c00029b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029b3:	8b 40 58             	mov    0x58(%eax),%eax
c00029b6:	83 ec 04             	sub    $0x4,%esp
c00029b9:	50                   	push   %eax
c00029ba:	ff 75 f0             	pushl  -0x10(%ebp)
c00029bd:	6a 01                	push   $0x1
c00029bf:	e8 1e 6f 00 00       	call   c00098e2 <send_rec>
c00029c4:	83 c4 10             	add    $0x10,%esp
c00029c7:	eb 13                	jmp    c00029dc <task_fs+0x198>
c00029c9:	83 ec 0c             	sub    $0xc,%esp
c00029cc:	68 c3 a8 00 c0       	push   $0xc000a8c3
c00029d1:	e8 fa 66 00 00       	call   c00090d0 <panic>
c00029d6:	83 c4 10             	add    $0x10,%esp
c00029d9:	eb 01                	jmp    c00029dc <task_fs+0x198>
c00029db:	90                   	nop
c00029dc:	e9 91 fe ff ff       	jmp    c0002872 <task_fs+0x2e>

c00029e1 <rd_wt>:
c00029e1:	55                   	push   %ebp
c00029e2:	89 e5                	mov    %esp,%ebp
c00029e4:	83 ec 18             	sub    $0x18,%esp
c00029e7:	83 ec 0c             	sub    $0xc,%esp
c00029ea:	6a 6c                	push   $0x6c
c00029ec:	e8 d4 43 00 00       	call   c0006dc5 <sys_malloc>
c00029f1:	83 c4 10             	add    $0x10,%esp
c00029f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00029f7:	83 ec 04             	sub    $0x4,%esp
c00029fa:	6a 6c                	push   $0x6c
c00029fc:	6a 00                	push   $0x0
c00029fe:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a01:	e8 2c 88 00 00       	call   c000b232 <Memset>
c0002a06:	83 c4 10             	add    $0x10,%esp
c0002a09:	8b 55 18             	mov    0x18(%ebp),%edx
c0002a0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a0f:	89 50 68             	mov    %edx,0x68(%eax)
c0002a12:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002a15:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a18:	89 50 14             	mov    %edx,0x14(%eax)
c0002a1b:	8b 55 10             	mov    0x10(%ebp),%edx
c0002a1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a21:	89 50 10             	mov    %edx,0x10(%eax)
c0002a24:	8b 55 14             	mov    0x14(%ebp),%edx
c0002a27:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a2a:	89 50 0c             	mov    %edx,0xc(%eax)
c0002a2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0002a30:	c1 e0 09             	shl    $0x9,%eax
c0002a33:	89 c2                	mov    %eax,%edx
c0002a35:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a38:	89 50 18             	mov    %edx,0x18(%eax)
c0002a3b:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002a3f:	74 22                	je     c0002a63 <rd_wt+0x82>
c0002a41:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002a45:	74 1c                	je     c0002a63 <rd_wt+0x82>
c0002a47:	68 a1 00 00 00       	push   $0xa1
c0002a4c:	68 50 a8 00 c0       	push   $0xc000a850
c0002a51:	68 50 a8 00 c0       	push   $0xc000a850
c0002a56:	68 d6 a8 00 c0       	push   $0xc000a8d6
c0002a5b:	e8 8e 66 00 00       	call   c00090ee <assertion_failure>
c0002a60:	83 c4 10             	add    $0x10,%esp
c0002a63:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a66:	8b 40 68             	mov    0x68(%eax),%eax
c0002a69:	83 f8 07             	cmp    $0x7,%eax
c0002a6c:	74 27                	je     c0002a95 <rd_wt+0xb4>
c0002a6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a71:	8b 40 68             	mov    0x68(%eax),%eax
c0002a74:	83 f8 0a             	cmp    $0xa,%eax
c0002a77:	74 1c                	je     c0002a95 <rd_wt+0xb4>
c0002a79:	68 a2 00 00 00       	push   $0xa2
c0002a7e:	68 50 a8 00 c0       	push   $0xc000a850
c0002a83:	68 50 a8 00 c0       	push   $0xc000a850
c0002a88:	68 f4 a8 00 c0       	push   $0xc000a8f4
c0002a8d:	e8 5c 66 00 00       	call   c00090ee <assertion_failure>
c0002a92:	83 c4 10             	add    $0x10,%esp
c0002a95:	83 ec 04             	sub    $0x4,%esp
c0002a98:	6a 03                	push   $0x3
c0002a9a:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a9d:	6a 03                	push   $0x3
c0002a9f:	e8 3e 6e 00 00       	call   c00098e2 <send_rec>
c0002aa4:	83 c4 10             	add    $0x10,%esp
c0002aa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002aaa:	83 ec 08             	sub    $0x8,%esp
c0002aad:	6a 6c                	push   $0x6c
c0002aaf:	50                   	push   %eax
c0002ab0:	e8 ef 45 00 00       	call   c00070a4 <sys_free>
c0002ab5:	83 c4 10             	add    $0x10,%esp
c0002ab8:	90                   	nop
c0002ab9:	c9                   	leave  
c0002aba:	c3                   	ret    

c0002abb <mkfs>:
c0002abb:	55                   	push   %ebp
c0002abc:	89 e5                	mov    %esp,%ebp
c0002abe:	57                   	push   %edi
c0002abf:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002ac5:	83 ec 0c             	sub    $0xc,%esp
c0002ac8:	68 00 80 00 00       	push   $0x8000
c0002acd:	e8 f3 42 00 00       	call   c0006dc5 <sys_malloc>
c0002ad2:	83 c4 10             	add    $0x10,%esp
c0002ad5:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002ada:	83 ec 0c             	sub    $0xc,%esp
c0002add:	6a 24                	push   $0x24
c0002adf:	e8 e1 42 00 00       	call   c0006dc5 <sys_malloc>
c0002ae4:	83 c4 10             	add    $0x10,%esp
c0002ae7:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002aec:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002af1:	83 ec 0c             	sub    $0xc,%esp
c0002af4:	50                   	push   %eax
c0002af5:	e8 f7 41 00 00       	call   c0006cf1 <get_physical_address>
c0002afa:	83 c4 10             	add    $0x10,%esp
c0002afd:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002b02:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002b07:	83 ec 0c             	sub    $0xc,%esp
c0002b0a:	50                   	push   %eax
c0002b0b:	e8 e1 41 00 00       	call   c0006cf1 <get_physical_address>
c0002b10:	83 c4 10             	add    $0x10,%esp
c0002b13:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002b18:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b1d:	83 ec 04             	sub    $0x4,%esp
c0002b20:	68 00 02 00 00       	push   $0x200
c0002b25:	6a 00                	push   $0x0
c0002b27:	50                   	push   %eax
c0002b28:	e8 05 87 00 00       	call   c000b232 <Memset>
c0002b2d:	83 c4 10             	add    $0x10,%esp
c0002b30:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002b35:	83 ec 0c             	sub    $0xc,%esp
c0002b38:	6a 0a                	push   $0xa
c0002b3a:	68 00 02 00 00       	push   $0x200
c0002b3f:	50                   	push   %eax
c0002b40:	6a 20                	push   $0x20
c0002b42:	6a 00                	push   $0x0
c0002b44:	e8 98 fe ff ff       	call   c00029e1 <rd_wt>
c0002b49:	83 c4 20             	add    $0x20,%esp
c0002b4c:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b51:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002b54:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b57:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002b5e:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b61:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002b68:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b6b:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002b72:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b75:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002b7c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b7f:	8b 40 04             	mov    0x4(%eax),%eax
c0002b82:	8d 50 02             	lea    0x2(%eax),%edx
c0002b85:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b88:	8b 40 08             	mov    0x8(%eax),%eax
c0002b8b:	01 c2                	add    %eax,%edx
c0002b8d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b90:	8b 40 0c             	mov    0xc(%eax),%eax
c0002b93:	01 c2                	add    %eax,%edx
c0002b95:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002b98:	89 10                	mov    %edx,(%eax)
c0002b9a:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002ba1:	b8 00 02 00 00       	mov    $0x200,%eax
c0002ba6:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002ba9:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002baf:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002bb2:	01 ca                	add    %ecx,%edx
c0002bb4:	83 ec 04             	sub    $0x4,%esp
c0002bb7:	50                   	push   %eax
c0002bb8:	6a 80                	push   $0xffffff80
c0002bba:	52                   	push   %edx
c0002bbb:	e8 72 86 00 00       	call   c000b232 <Memset>
c0002bc0:	83 c4 10             	add    $0x10,%esp
c0002bc3:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002bc8:	83 ec 0c             	sub    $0xc,%esp
c0002bcb:	6a 0a                	push   $0xa
c0002bcd:	68 00 02 00 00       	push   $0x200
c0002bd2:	50                   	push   %eax
c0002bd3:	6a 20                	push   $0x20
c0002bd5:	6a 01                	push   $0x1
c0002bd7:	e8 05 fe ff ff       	call   c00029e1 <rd_wt>
c0002bdc:	83 c4 20             	add    $0x20,%esp
c0002bdf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002be2:	8b 10                	mov    (%eax),%edx
c0002be4:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002be7:	8b 50 04             	mov    0x4(%eax),%edx
c0002bea:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002bed:	8b 50 08             	mov    0x8(%eax),%edx
c0002bf0:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002bf3:	8b 50 0c             	mov    0xc(%eax),%edx
c0002bf6:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002bf9:	8b 50 10             	mov    0x10(%eax),%edx
c0002bfc:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002bff:	8b 50 14             	mov    0x14(%eax),%edx
c0002c02:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002c05:	8b 50 18             	mov    0x18(%eax),%edx
c0002c08:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002c0b:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002c0e:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002c11:	8b 40 20             	mov    0x20(%eax),%eax
c0002c14:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002c17:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002c1b:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002c1f:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c24:	83 ec 04             	sub    $0x4,%esp
c0002c27:	6a 01                	push   $0x1
c0002c29:	52                   	push   %edx
c0002c2a:	50                   	push   %eax
c0002c2b:	e8 02 86 00 00       	call   c000b232 <Memset>
c0002c30:	83 c4 10             	add    $0x10,%esp
c0002c33:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c38:	83 c0 01             	add    $0x1,%eax
c0002c3b:	83 ec 04             	sub    $0x4,%esp
c0002c3e:	68 ff 01 00 00       	push   $0x1ff
c0002c43:	6a 80                	push   $0xffffff80
c0002c45:	50                   	push   %eax
c0002c46:	e8 e7 85 00 00       	call   c000b232 <Memset>
c0002c4b:	83 c4 10             	add    $0x10,%esp
c0002c4e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c53:	83 ec 0c             	sub    $0xc,%esp
c0002c56:	6a 0a                	push   $0xa
c0002c58:	68 00 02 00 00       	push   $0x200
c0002c5d:	50                   	push   %eax
c0002c5e:	6a 20                	push   $0x20
c0002c60:	6a 02                	push   $0x2
c0002c62:	e8 7a fd ff ff       	call   c00029e1 <rd_wt>
c0002c67:	83 c4 20             	add    $0x20,%esp
c0002c6a:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002c71:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c76:	83 ec 04             	sub    $0x4,%esp
c0002c79:	68 00 02 00 00       	push   $0x200
c0002c7e:	6a ff                	push   $0xffffffff
c0002c80:	50                   	push   %eax
c0002c81:	e8 ac 85 00 00       	call   c000b232 <Memset>
c0002c86:	83 c4 10             	add    $0x10,%esp
c0002c89:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c8e:	83 ec 0c             	sub    $0xc,%esp
c0002c91:	6a 0a                	push   $0xa
c0002c93:	68 00 02 00 00       	push   $0x200
c0002c98:	50                   	push   %eax
c0002c99:	6a 20                	push   $0x20
c0002c9b:	ff 75 d0             	pushl  -0x30(%ebp)
c0002c9e:	e8 3e fd ff ff       	call   c00029e1 <rd_wt>
c0002ca3:	83 c4 20             	add    $0x20,%esp
c0002ca6:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cab:	83 ec 04             	sub    $0x4,%esp
c0002cae:	6a 01                	push   $0x1
c0002cb0:	6a 01                	push   $0x1
c0002cb2:	50                   	push   %eax
c0002cb3:	e8 7a 85 00 00       	call   c000b232 <Memset>
c0002cb8:	83 c4 10             	add    $0x10,%esp
c0002cbb:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cc0:	83 c0 01             	add    $0x1,%eax
c0002cc3:	83 ec 04             	sub    $0x4,%esp
c0002cc6:	68 ff 01 00 00       	push   $0x1ff
c0002ccb:	6a 00                	push   $0x0
c0002ccd:	50                   	push   %eax
c0002cce:	e8 5f 85 00 00       	call   c000b232 <Memset>
c0002cd3:	83 c4 10             	add    $0x10,%esp
c0002cd6:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002cdb:	89 c2                	mov    %eax,%edx
c0002cdd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002ce0:	83 c0 01             	add    $0x1,%eax
c0002ce3:	83 ec 0c             	sub    $0xc,%esp
c0002ce6:	6a 0a                	push   $0xa
c0002ce8:	68 00 02 00 00       	push   $0x200
c0002ced:	52                   	push   %edx
c0002cee:	6a 20                	push   $0x20
c0002cf0:	50                   	push   %eax
c0002cf1:	e8 eb fc ff ff       	call   c00029e1 <rd_wt>
c0002cf6:	83 c4 20             	add    $0x20,%esp
c0002cf9:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002cfc:	83 e8 02             	sub    $0x2,%eax
c0002cff:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002d02:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002d09:	eb 04                	jmp    c0002d0f <mkfs+0x254>
c0002d0b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002d0f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002d12:	83 c0 01             	add    $0x1,%eax
c0002d15:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002d18:	7e f1                	jle    c0002d0b <mkfs+0x250>
c0002d1a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d1f:	89 c2                	mov    %eax,%edx
c0002d21:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d24:	83 c0 03             	add    $0x3,%eax
c0002d27:	83 ec 0c             	sub    $0xc,%esp
c0002d2a:	6a 0a                	push   $0xa
c0002d2c:	68 00 02 00 00       	push   $0x200
c0002d31:	52                   	push   %edx
c0002d32:	6a 20                	push   $0x20
c0002d34:	50                   	push   %eax
c0002d35:	e8 a7 fc ff ff       	call   c00029e1 <rd_wt>
c0002d3a:	83 c4 20             	add    $0x20,%esp
c0002d3d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d42:	89 c2                	mov    %eax,%edx
c0002d44:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d47:	83 c0 03             	add    $0x3,%eax
c0002d4a:	83 ec 0c             	sub    $0xc,%esp
c0002d4d:	6a 07                	push   $0x7
c0002d4f:	68 00 02 00 00       	push   $0x200
c0002d54:	52                   	push   %edx
c0002d55:	6a 20                	push   $0x20
c0002d57:	50                   	push   %eax
c0002d58:	e8 84 fc ff ff       	call   c00029e1 <rd_wt>
c0002d5d:	83 c4 20             	add    $0x20,%esp
c0002d60:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d65:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002d68:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d6b:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002d71:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d74:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002d7b:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002d7e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d81:	89 50 08             	mov    %edx,0x8(%eax)
c0002d84:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d87:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002d8e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d91:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002d98:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002d9b:	8b 10                	mov    (%eax),%edx
c0002d9d:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002da3:	8b 50 04             	mov    0x4(%eax),%edx
c0002da6:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002dac:	8b 50 08             	mov    0x8(%eax),%edx
c0002daf:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002db5:	8b 50 0c             	mov    0xc(%eax),%edx
c0002db8:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002dbe:	8b 50 10             	mov    0x10(%eax),%edx
c0002dc1:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002dc7:	8b 50 14             	mov    0x14(%eax),%edx
c0002dca:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002dd0:	8b 50 18             	mov    0x18(%eax),%edx
c0002dd3:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002dd9:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002ddc:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002de2:	8b 50 20             	mov    0x20(%eax),%edx
c0002de5:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002deb:	8b 40 24             	mov    0x24(%eax),%eax
c0002dee:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002df3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002dfa:	eb 4c                	jmp    c0002e48 <mkfs+0x38d>
c0002dfc:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e01:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002e04:	83 c2 01             	add    $0x1,%edx
c0002e07:	c1 e2 05             	shl    $0x5,%edx
c0002e0a:	01 d0                	add    %edx,%eax
c0002e0c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002e0f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e12:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002e18:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e1b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002e22:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e25:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002e2c:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002e33:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002e36:	c1 e0 08             	shl    $0x8,%eax
c0002e39:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002e3c:	89 c2                	mov    %eax,%edx
c0002e3e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e41:	89 50 08             	mov    %edx,0x8(%eax)
c0002e44:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002e48:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002e4c:	7e ae                	jle    c0002dfc <mkfs+0x341>
c0002e4e:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002e55:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002e5b:	b8 00 00 00 00       	mov    $0x0,%eax
c0002e60:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002e65:	89 d7                	mov    %edx,%edi
c0002e67:	f3 ab                	rep stos %eax,%es:(%edi)
c0002e69:	c7 85 70 ff ff ff 1c 	movl   $0xc000a91c,-0x90(%ebp)
c0002e70:	a9 00 c0 
c0002e73:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002e7a:	eb 54                	jmp    c0002ed0 <mkfs+0x415>
c0002e7c:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e81:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002e84:	83 c2 04             	add    $0x4,%edx
c0002e87:	c1 e2 05             	shl    $0x5,%edx
c0002e8a:	01 d0                	add    %edx,%eax
c0002e8c:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002e8f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e92:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002e98:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e9b:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002ea2:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002ea5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002ea8:	83 c2 01             	add    $0x1,%edx
c0002eab:	c1 e2 0b             	shl    $0xb,%edx
c0002eae:	01 c2                	add    %eax,%edx
c0002eb0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002eb3:	89 50 08             	mov    %edx,0x8(%eax)
c0002eb6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002eb9:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002ec0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ec3:	8d 50 05             	lea    0x5(%eax),%edx
c0002ec6:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ec9:	89 50 10             	mov    %edx,0x10(%eax)
c0002ecc:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002ed0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002ed3:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002ed6:	7c a4                	jl     c0002e7c <mkfs+0x3c1>
c0002ed8:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002edd:	89 c2                	mov    %eax,%edx
c0002edf:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002ee2:	83 c0 03             	add    $0x3,%eax
c0002ee5:	83 ec 0c             	sub    $0xc,%esp
c0002ee8:	6a 0a                	push   $0xa
c0002eea:	68 00 02 00 00       	push   $0x200
c0002eef:	52                   	push   %edx
c0002ef0:	6a 20                	push   $0x20
c0002ef2:	50                   	push   %eax
c0002ef3:	e8 e9 fa ff ff       	call   c00029e1 <rd_wt>
c0002ef8:	83 c4 20             	add    $0x20,%esp
c0002efb:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f00:	89 c2                	mov    %eax,%edx
c0002f02:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002f05:	83 ec 0c             	sub    $0xc,%esp
c0002f08:	6a 07                	push   $0x7
c0002f0a:	68 00 02 00 00       	push   $0x200
c0002f0f:	52                   	push   %edx
c0002f10:	6a 20                	push   $0x20
c0002f12:	50                   	push   %eax
c0002f13:	e8 c9 fa ff ff       	call   c00029e1 <rd_wt>
c0002f18:	83 c4 20             	add    $0x20,%esp
c0002f1b:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002f22:	00 00 00 
c0002f25:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002f2c:	2e 00 
c0002f2e:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002f33:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002f36:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f39:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002f3f:	83 ec 0c             	sub    $0xc,%esp
c0002f42:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002f48:	50                   	push   %eax
c0002f49:	e8 1d 83 00 00       	call   c000b26b <Strlen>
c0002f4e:	83 c4 10             	add    $0x10,%esp
c0002f51:	89 c1                	mov    %eax,%ecx
c0002f53:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f56:	8d 50 04             	lea    0x4(%eax),%edx
c0002f59:	83 ec 04             	sub    $0x4,%esp
c0002f5c:	51                   	push   %ecx
c0002f5d:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002f63:	50                   	push   %eax
c0002f64:	52                   	push   %edx
c0002f65:	e8 9a 82 00 00       	call   c000b204 <Memcpy>
c0002f6a:	83 c4 10             	add    $0x10,%esp
c0002f6d:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002f73:	b8 00 00 00 00       	mov    $0x0,%eax
c0002f78:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002f7d:	89 d7                	mov    %edx,%edi
c0002f7f:	f3 ab                	rep stos %eax,%es:(%edi)
c0002f81:	c7 85 34 ff ff ff 28 	movl   $0xc000a928,-0xcc(%ebp)
c0002f88:	a9 00 c0 
c0002f8b:	c7 85 38 ff ff ff 31 	movl   $0xc000a931,-0xc8(%ebp)
c0002f92:	a9 00 c0 
c0002f95:	c7 85 3c ff ff ff 3a 	movl   $0xc000a93a,-0xc4(%ebp)
c0002f9c:	a9 00 c0 
c0002f9f:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002fa6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002fad:	eb 49                	jmp    c0002ff8 <mkfs+0x53d>
c0002faf:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0002fb3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002fb6:	8d 50 02             	lea    0x2(%eax),%edx
c0002fb9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002fbc:	89 10                	mov    %edx,(%eax)
c0002fbe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002fc1:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002fc8:	83 ec 0c             	sub    $0xc,%esp
c0002fcb:	50                   	push   %eax
c0002fcc:	e8 9a 82 00 00       	call   c000b26b <Strlen>
c0002fd1:	83 c4 10             	add    $0x10,%esp
c0002fd4:	89 c1                	mov    %eax,%ecx
c0002fd6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002fd9:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0002fe0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002fe3:	83 c2 04             	add    $0x4,%edx
c0002fe6:	83 ec 04             	sub    $0x4,%esp
c0002fe9:	51                   	push   %ecx
c0002fea:	50                   	push   %eax
c0002feb:	52                   	push   %edx
c0002fec:	e8 13 82 00 00       	call   c000b204 <Memcpy>
c0002ff1:	83 c4 10             	add    $0x10,%esp
c0002ff4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0002ff8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002ffb:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c0002ffe:	7c af                	jl     c0002faf <mkfs+0x4f4>
c0003000:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003007:	eb 66                	jmp    c000306f <mkfs+0x5b4>
c0003009:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000300c:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003013:	83 ec 0c             	sub    $0xc,%esp
c0003016:	50                   	push   %eax
c0003017:	e8 4f 82 00 00       	call   c000b26b <Strlen>
c000301c:	83 c4 10             	add    $0x10,%esp
c000301f:	85 c0                	test   %eax,%eax
c0003021:	74 47                	je     c000306a <mkfs+0x5af>
c0003023:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003027:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000302a:	8d 50 05             	lea    0x5(%eax),%edx
c000302d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003030:	89 10                	mov    %edx,(%eax)
c0003032:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003035:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000303c:	83 ec 0c             	sub    $0xc,%esp
c000303f:	50                   	push   %eax
c0003040:	e8 26 82 00 00       	call   c000b26b <Strlen>
c0003045:	83 c4 10             	add    $0x10,%esp
c0003048:	89 c1                	mov    %eax,%ecx
c000304a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000304d:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003054:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003057:	83 c2 04             	add    $0x4,%edx
c000305a:	83 ec 04             	sub    $0x4,%esp
c000305d:	51                   	push   %ecx
c000305e:	50                   	push   %eax
c000305f:	52                   	push   %edx
c0003060:	e8 9f 81 00 00       	call   c000b204 <Memcpy>
c0003065:	83 c4 10             	add    $0x10,%esp
c0003068:	eb 01                	jmp    c000306b <mkfs+0x5b0>
c000306a:	90                   	nop
c000306b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000306f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003072:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0003075:	7c 92                	jl     c0003009 <mkfs+0x54e>
c0003077:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000307c:	89 c2                	mov    %eax,%edx
c000307e:	8b 45 98             	mov    -0x68(%ebp),%eax
c0003081:	83 ec 0c             	sub    $0xc,%esp
c0003084:	6a 0a                	push   $0xa
c0003086:	68 00 02 00 00       	push   $0x200
c000308b:	52                   	push   %edx
c000308c:	6a 20                	push   $0x20
c000308e:	50                   	push   %eax
c000308f:	e8 4d f9 ff ff       	call   c00029e1 <rd_wt>
c0003094:	83 c4 20             	add    $0x20,%esp
c0003097:	90                   	nop
c0003098:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000309b:	c9                   	leave  
c000309c:	c3                   	ret    

c000309d <init_fs>:
c000309d:	55                   	push   %ebp
c000309e:	89 e5                	mov    %esp,%ebp
c00030a0:	83 ec 18             	sub    $0x18,%esp
c00030a3:	83 ec 0c             	sub    $0xc,%esp
c00030a6:	6a 6c                	push   $0x6c
c00030a8:	e8 18 3d 00 00       	call   c0006dc5 <sys_malloc>
c00030ad:	83 c4 10             	add    $0x10,%esp
c00030b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00030b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030b6:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c00030bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030c0:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c00030c7:	83 ec 04             	sub    $0x4,%esp
c00030ca:	6a 03                	push   $0x3
c00030cc:	ff 75 f4             	pushl  -0xc(%ebp)
c00030cf:	6a 03                	push   $0x3
c00030d1:	e8 0c 68 00 00       	call   c00098e2 <send_rec>
c00030d6:	83 c4 10             	add    $0x10,%esp
c00030d9:	e8 dd f9 ff ff       	call   c0002abb <mkfs>
c00030de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00030e1:	83 ec 08             	sub    $0x8,%esp
c00030e4:	6a 6c                	push   $0x6c
c00030e6:	50                   	push   %eax
c00030e7:	e8 b8 3f 00 00       	call   c00070a4 <sys_free>
c00030ec:	83 c4 10             	add    $0x10,%esp
c00030ef:	90                   	nop
c00030f0:	c9                   	leave  
c00030f1:	c3                   	ret    

c00030f2 <do_open>:
c00030f2:	55                   	push   %ebp
c00030f3:	89 e5                	mov    %esp,%ebp
c00030f5:	83 ec 68             	sub    $0x68,%esp
c00030f8:	83 ec 04             	sub    $0x4,%esp
c00030fb:	6a 0c                	push   $0xc
c00030fd:	6a 00                	push   $0x0
c00030ff:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003102:	50                   	push   %eax
c0003103:	e8 2a 81 00 00       	call   c000b232 <Memset>
c0003108:	83 c4 10             	add    $0x10,%esp
c000310b:	8b 45 08             	mov    0x8(%ebp),%eax
c000310e:	8b 40 34             	mov    0x34(%eax),%eax
c0003111:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003114:	83 ec 08             	sub    $0x8,%esp
c0003117:	6a 0c                	push   $0xc
c0003119:	ff 75 e4             	pushl  -0x1c(%ebp)
c000311c:	e8 63 3b 00 00       	call   c0006c84 <alloc_virtual_memory>
c0003121:	83 c4 10             	add    $0x10,%esp
c0003124:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003127:	8b 45 08             	mov    0x8(%ebp),%eax
c000312a:	8b 40 30             	mov    0x30(%eax),%eax
c000312d:	89 c2                	mov    %eax,%edx
c000312f:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003132:	83 ec 04             	sub    $0x4,%esp
c0003135:	52                   	push   %edx
c0003136:	50                   	push   %eax
c0003137:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000313a:	50                   	push   %eax
c000313b:	e8 c4 80 00 00       	call   c000b204 <Memcpy>
c0003140:	83 c4 10             	add    $0x10,%esp
c0003143:	8b 45 08             	mov    0x8(%ebp),%eax
c0003146:	8b 40 30             	mov    0x30(%eax),%eax
c0003149:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c000314e:	8b 45 08             	mov    0x8(%ebp),%eax
c0003151:	8b 40 64             	mov    0x64(%eax),%eax
c0003154:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003157:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c000315e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003165:	eb 1f                	jmp    c0003186 <do_open+0x94>
c0003167:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000316c:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000316f:	83 c2 50             	add    $0x50,%edx
c0003172:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0003176:	85 c0                	test   %eax,%eax
c0003178:	75 08                	jne    c0003182 <do_open+0x90>
c000317a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000317d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003180:	eb 0a                	jmp    c000318c <do_open+0x9a>
c0003182:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003186:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c000318a:	7e db                	jle    c0003167 <do_open+0x75>
c000318c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c0003190:	75 1c                	jne    c00031ae <do_open+0xbc>
c0003192:	68 b7 01 00 00       	push   $0x1b7
c0003197:	68 50 a8 00 c0       	push   $0xc000a850
c000319c:	68 50 a8 00 c0       	push   $0xc000a850
c00031a1:	68 43 a9 00 c0       	push   $0xc000a943
c00031a6:	e8 43 5f 00 00       	call   c00090ee <assertion_failure>
c00031ab:	83 c4 10             	add    $0x10,%esp
c00031ae:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c00031b5:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00031bc:	eb 1d                	jmp    c00031db <do_open+0xe9>
c00031be:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00031c1:	c1 e0 04             	shl    $0x4,%eax
c00031c4:	05 88 23 01 c0       	add    $0xc0012388,%eax
c00031c9:	8b 00                	mov    (%eax),%eax
c00031cb:	85 c0                	test   %eax,%eax
c00031cd:	75 08                	jne    c00031d7 <do_open+0xe5>
c00031cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00031d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00031d5:	eb 0a                	jmp    c00031e1 <do_open+0xef>
c00031d7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00031db:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c00031df:	7e dd                	jle    c00031be <do_open+0xcc>
c00031e1:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c00031e5:	75 1c                	jne    c0003203 <do_open+0x111>
c00031e7:	68 c3 01 00 00       	push   $0x1c3
c00031ec:	68 50 a8 00 c0       	push   $0xc000a850
c00031f1:	68 50 a8 00 c0       	push   $0xc000a850
c00031f6:	68 4b a9 00 c0       	push   $0xc000a94b
c00031fb:	e8 ee 5e 00 00       	call   c00090ee <assertion_failure>
c0003200:	83 c4 10             	add    $0x10,%esp
c0003203:	83 ec 0c             	sub    $0xc,%esp
c0003206:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003209:	50                   	push   %eax
c000320a:	e8 b2 00 00 00       	call   c00032c1 <search_file>
c000320f:	83 c4 10             	add    $0x10,%esp
c0003212:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003215:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c0003219:	75 2b                	jne    c0003246 <do_open+0x154>
c000321b:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c000321f:	7e 10                	jle    c0003231 <do_open+0x13f>
c0003221:	83 ec 0c             	sub    $0xc,%esp
c0003224:	68 53 a9 00 c0       	push   $0xc000a953
c0003229:	e8 a2 5e 00 00       	call   c00090d0 <panic>
c000322e:	83 c4 10             	add    $0x10,%esp
c0003231:	83 ec 08             	sub    $0x8,%esp
c0003234:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003237:	50                   	push   %eax
c0003238:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000323b:	50                   	push   %eax
c000323c:	e8 40 04 00 00       	call   c0003681 <create_file>
c0003241:	83 c4 10             	add    $0x10,%esp
c0003244:	eb 22                	jmp    c0003268 <do_open+0x176>
c0003246:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c000324a:	75 07                	jne    c0003253 <do_open+0x161>
c000324c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003251:	eb 6c                	jmp    c00032bf <do_open+0x1cd>
c0003253:	83 ec 08             	sub    $0x8,%esp
c0003256:	ff 75 d8             	pushl  -0x28(%ebp)
c0003259:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000325c:	50                   	push   %eax
c000325d:	e8 5d 02 00 00       	call   c00034bf <get_inode>
c0003262:	83 c4 10             	add    $0x10,%esp
c0003265:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003268:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000326d:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003270:	c1 e2 04             	shl    $0x4,%edx
c0003273:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c0003279:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000327c:	83 c2 50             	add    $0x50,%edx
c000327f:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
c0003283:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003286:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003289:	c1 e2 04             	shl    $0x4,%edx
c000328c:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c0003292:	89 02                	mov    %eax,(%edx)
c0003294:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003297:	c1 e0 04             	shl    $0x4,%eax
c000329a:	05 84 23 01 c0       	add    $0xc0012384,%eax
c000329f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00032a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032a8:	c1 e0 04             	shl    $0x4,%eax
c00032ab:	05 80 23 01 c0       	add    $0xc0012380,%eax
c00032b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00032b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00032b9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00032bc:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00032bf:	c9                   	leave  
c00032c0:	c3                   	ret    

c00032c1 <search_file>:
c00032c1:	55                   	push   %ebp
c00032c2:	89 e5                	mov    %esp,%ebp
c00032c4:	83 ec 68             	sub    $0x68,%esp
c00032c7:	83 ec 04             	sub    $0x4,%esp
c00032ca:	6a 0c                	push   $0xc
c00032cc:	6a 00                	push   $0x0
c00032ce:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00032d1:	50                   	push   %eax
c00032d2:	e8 5b 7f 00 00       	call   c000b232 <Memset>
c00032d7:	83 c4 10             	add    $0x10,%esp
c00032da:	83 ec 04             	sub    $0x4,%esp
c00032dd:	6a 28                	push   $0x28
c00032df:	6a 00                	push   $0x0
c00032e1:	8d 45 98             	lea    -0x68(%ebp),%eax
c00032e4:	50                   	push   %eax
c00032e5:	e8 48 7f 00 00       	call   c000b232 <Memset>
c00032ea:	83 c4 10             	add    $0x10,%esp
c00032ed:	83 ec 04             	sub    $0x4,%esp
c00032f0:	8d 45 98             	lea    -0x68(%ebp),%eax
c00032f3:	50                   	push   %eax
c00032f4:	ff 75 08             	pushl  0x8(%ebp)
c00032f7:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00032fa:	50                   	push   %eax
c00032fb:	e8 f3 00 00 00       	call   c00033f3 <strip_path>
c0003300:	83 c4 10             	add    $0x10,%esp
c0003303:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003306:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c000330a:	75 0a                	jne    c0003316 <search_file+0x55>
c000330c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003311:	e9 db 00 00 00       	jmp    c00033f1 <search_file+0x130>
c0003316:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003319:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000331c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000331f:	05 00 02 00 00       	add    $0x200,%eax
c0003324:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000332a:	85 c0                	test   %eax,%eax
c000332c:	0f 48 c2             	cmovs  %edx,%eax
c000332f:	c1 f8 09             	sar    $0x9,%eax
c0003332:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003335:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003338:	c1 e8 04             	shr    $0x4,%eax
c000333b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000333e:	e8 63 14 00 00       	call   c00047a6 <get_super_block>
c0003343:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003346:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0003349:	8b 00                	mov    (%eax),%eax
c000334b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000334e:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c0003355:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000335c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003363:	eb 7b                	jmp    c00033e0 <search_file+0x11f>
c0003365:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000336a:	89 c1                	mov    %eax,%ecx
c000336c:	8b 55 d0             	mov    -0x30(%ebp),%edx
c000336f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003372:	01 d0                	add    %edx,%eax
c0003374:	83 ec 0c             	sub    $0xc,%esp
c0003377:	6a 07                	push   $0x7
c0003379:	68 00 02 00 00       	push   $0x200
c000337e:	51                   	push   %ecx
c000337f:	ff 75 cc             	pushl  -0x34(%ebp)
c0003382:	50                   	push   %eax
c0003383:	e8 59 f6 ff ff       	call   c00029e1 <rd_wt>
c0003388:	83 c4 20             	add    $0x20,%esp
c000338b:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003390:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003393:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000339a:	eb 35                	jmp    c00033d1 <search_file+0x110>
c000339c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00033a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00033a3:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00033a6:	7f 33                	jg     c00033db <search_file+0x11a>
c00033a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00033ab:	83 c0 04             	add    $0x4,%eax
c00033ae:	83 ec 08             	sub    $0x8,%esp
c00033b1:	50                   	push   %eax
c00033b2:	8d 45 c0             	lea    -0x40(%ebp),%eax
c00033b5:	50                   	push   %eax
c00033b6:	e8 83 68 00 00       	call   c0009c3e <strcmp>
c00033bb:	83 c4 10             	add    $0x10,%esp
c00033be:	85 c0                	test   %eax,%eax
c00033c0:	75 07                	jne    c00033c9 <search_file+0x108>
c00033c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00033c5:	8b 00                	mov    (%eax),%eax
c00033c7:	eb 28                	jmp    c00033f1 <search_file+0x130>
c00033c9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00033cd:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c00033d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00033d4:	83 f8 1f             	cmp    $0x1f,%eax
c00033d7:	76 c3                	jbe    c000339c <search_file+0xdb>
c00033d9:	eb 01                	jmp    c00033dc <search_file+0x11b>
c00033db:	90                   	nop
c00033dc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00033e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00033e3:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c00033e6:	0f 8c 79 ff ff ff    	jl     c0003365 <search_file+0xa4>
c00033ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00033f1:	c9                   	leave  
c00033f2:	c3                   	ret    

c00033f3 <strip_path>:
c00033f3:	55                   	push   %ebp
c00033f4:	89 e5                	mov    %esp,%ebp
c00033f6:	83 ec 10             	sub    $0x10,%esp
c00033f9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00033fd:	75 0a                	jne    c0003409 <strip_path+0x16>
c00033ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003404:	e9 b4 00 00 00       	jmp    c00034bd <strip_path+0xca>
c0003409:	8b 45 08             	mov    0x8(%ebp),%eax
c000340c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000340f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003412:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003415:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003418:	0f b6 00             	movzbl (%eax),%eax
c000341b:	3c 2f                	cmp    $0x2f,%al
c000341d:	75 2d                	jne    c000344c <strip_path+0x59>
c000341f:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003423:	eb 27                	jmp    c000344c <strip_path+0x59>
c0003425:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003428:	0f b6 00             	movzbl (%eax),%eax
c000342b:	3c 2f                	cmp    $0x2f,%al
c000342d:	75 0a                	jne    c0003439 <strip_path+0x46>
c000342f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003434:	e9 84 00 00 00       	jmp    c00034bd <strip_path+0xca>
c0003439:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000343c:	0f b6 10             	movzbl (%eax),%edx
c000343f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003442:	88 10                	mov    %dl,(%eax)
c0003444:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003448:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000344c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000344f:	0f b6 00             	movzbl (%eax),%eax
c0003452:	84 c0                	test   %al,%al
c0003454:	75 cf                	jne    c0003425 <strip_path+0x32>
c0003456:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003459:	c6 00 00             	movb   $0x0,(%eax)
c000345c:	8b 45 10             	mov    0x10(%ebp),%eax
c000345f:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c0003465:	89 10                	mov    %edx,(%eax)
c0003467:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c000346d:	89 50 04             	mov    %edx,0x4(%eax)
c0003470:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c0003476:	89 50 08             	mov    %edx,0x8(%eax)
c0003479:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c000347f:	89 50 0c             	mov    %edx,0xc(%eax)
c0003482:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c0003488:	89 50 10             	mov    %edx,0x10(%eax)
c000348b:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c0003491:	89 50 14             	mov    %edx,0x14(%eax)
c0003494:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c000349a:	89 50 18             	mov    %edx,0x18(%eax)
c000349d:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c00034a3:	89 50 1c             	mov    %edx,0x1c(%eax)
c00034a6:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c00034ac:	89 50 20             	mov    %edx,0x20(%eax)
c00034af:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c00034b5:	89 50 24             	mov    %edx,0x24(%eax)
c00034b8:	b8 00 00 00 00       	mov    $0x0,%eax
c00034bd:	c9                   	leave  
c00034be:	c3                   	ret    

c00034bf <get_inode>:
c00034bf:	55                   	push   %ebp
c00034c0:	89 e5                	mov    %esp,%ebp
c00034c2:	56                   	push   %esi
c00034c3:	53                   	push   %ebx
c00034c4:	83 ec 20             	sub    $0x20,%esp
c00034c7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00034cb:	75 0a                	jne    c00034d7 <get_inode+0x18>
c00034cd:	b8 00 00 00 00       	mov    $0x0,%eax
c00034d2:	e9 a3 01 00 00       	jmp    c000367a <get_inode+0x1bb>
c00034d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00034de:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c00034e5:	eb 69                	jmp    c0003550 <get_inode+0x91>
c00034e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034ea:	8b 40 24             	mov    0x24(%eax),%eax
c00034ed:	85 c0                	test   %eax,%eax
c00034ef:	7e 53                	jle    c0003544 <get_inode+0x85>
c00034f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00034f4:	8b 40 10             	mov    0x10(%eax),%eax
c00034f7:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00034fa:	75 50                	jne    c000354c <get_inode+0x8d>
c00034fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00034ff:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003502:	8b 0a                	mov    (%edx),%ecx
c0003504:	89 08                	mov    %ecx,(%eax)
c0003506:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003509:	89 48 04             	mov    %ecx,0x4(%eax)
c000350c:	8b 4a 08             	mov    0x8(%edx),%ecx
c000350f:	89 48 08             	mov    %ecx,0x8(%eax)
c0003512:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003515:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003518:	8b 4a 10             	mov    0x10(%edx),%ecx
c000351b:	89 48 10             	mov    %ecx,0x10(%eax)
c000351e:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003521:	89 48 14             	mov    %ecx,0x14(%eax)
c0003524:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003527:	89 48 18             	mov    %ecx,0x18(%eax)
c000352a:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000352d:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003530:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003533:	89 48 20             	mov    %ecx,0x20(%eax)
c0003536:	8b 52 24             	mov    0x24(%edx),%edx
c0003539:	89 50 24             	mov    %edx,0x24(%eax)
c000353c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000353f:	e9 36 01 00 00       	jmp    c000367a <get_inode+0x1bb>
c0003544:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003547:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000354a:	eb 0d                	jmp    c0003559 <get_inode+0x9a>
c000354c:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c0003550:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c0003557:	76 8e                	jbe    c00034e7 <get_inode+0x28>
c0003559:	e8 48 12 00 00       	call   c00047a6 <get_super_block>
c000355e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003561:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c0003568:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000356b:	8b 40 04             	mov    0x4(%eax),%eax
c000356e:	8d 50 02             	lea    0x2(%eax),%edx
c0003571:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003574:	8b 40 08             	mov    0x8(%eax),%eax
c0003577:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c000357a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000357d:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003580:	b8 00 02 00 00       	mov    $0x200,%eax
c0003585:	99                   	cltd   
c0003586:	f7 7d e8             	idivl  -0x18(%ebp)
c0003589:	89 c6                	mov    %eax,%esi
c000358b:	89 c8                	mov    %ecx,%eax
c000358d:	99                   	cltd   
c000358e:	f7 fe                	idiv   %esi
c0003590:	01 d8                	add    %ebx,%eax
c0003592:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003595:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c000359c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00035a1:	83 ec 0c             	sub    $0xc,%esp
c00035a4:	6a 07                	push   $0x7
c00035a6:	68 00 02 00 00       	push   $0x200
c00035ab:	50                   	push   %eax
c00035ac:	ff 75 e0             	pushl  -0x20(%ebp)
c00035af:	ff 75 e4             	pushl  -0x1c(%ebp)
c00035b2:	e8 2a f4 ff ff       	call   c00029e1 <rd_wt>
c00035b7:	83 c4 20             	add    $0x20,%esp
c00035ba:	8b 45 0c             	mov    0xc(%ebp),%eax
c00035bd:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00035c0:	b8 00 02 00 00       	mov    $0x200,%eax
c00035c5:	99                   	cltd   
c00035c6:	f7 7d e8             	idivl  -0x18(%ebp)
c00035c9:	89 c3                	mov    %eax,%ebx
c00035cb:	89 c8                	mov    %ecx,%eax
c00035cd:	99                   	cltd   
c00035ce:	f7 fb                	idiv   %ebx
c00035d0:	89 55 dc             	mov    %edx,-0x24(%ebp)
c00035d3:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00035d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00035dc:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c00035e0:	01 d0                	add    %edx,%eax
c00035e2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00035e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00035e8:	8b 55 d8             	mov    -0x28(%ebp),%edx
c00035eb:	8b 0a                	mov    (%edx),%ecx
c00035ed:	89 08                	mov    %ecx,(%eax)
c00035ef:	8b 4a 04             	mov    0x4(%edx),%ecx
c00035f2:	89 48 04             	mov    %ecx,0x4(%eax)
c00035f5:	8b 4a 08             	mov    0x8(%edx),%ecx
c00035f8:	89 48 08             	mov    %ecx,0x8(%eax)
c00035fb:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00035fe:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003601:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003604:	89 48 10             	mov    %ecx,0x10(%eax)
c0003607:	8b 4a 14             	mov    0x14(%edx),%ecx
c000360a:	89 48 14             	mov    %ecx,0x14(%eax)
c000360d:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003610:	89 48 18             	mov    %ecx,0x18(%eax)
c0003613:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003616:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003619:	8b 4a 20             	mov    0x20(%edx),%ecx
c000361c:	89 48 20             	mov    %ecx,0x20(%eax)
c000361f:	8b 52 24             	mov    0x24(%edx),%edx
c0003622:	89 50 24             	mov    %edx,0x24(%eax)
c0003625:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003628:	8b 55 0c             	mov    0xc(%ebp),%edx
c000362b:	89 50 10             	mov    %edx,0x10(%eax)
c000362e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003631:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003634:	89 50 20             	mov    %edx,0x20(%eax)
c0003637:	8b 45 08             	mov    0x8(%ebp),%eax
c000363a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000363d:	8b 0a                	mov    (%edx),%ecx
c000363f:	89 08                	mov    %ecx,(%eax)
c0003641:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003644:	89 48 04             	mov    %ecx,0x4(%eax)
c0003647:	8b 4a 08             	mov    0x8(%edx),%ecx
c000364a:	89 48 08             	mov    %ecx,0x8(%eax)
c000364d:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003650:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003653:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003656:	89 48 10             	mov    %ecx,0x10(%eax)
c0003659:	8b 4a 14             	mov    0x14(%edx),%ecx
c000365c:	89 48 14             	mov    %ecx,0x14(%eax)
c000365f:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003662:	89 48 18             	mov    %ecx,0x18(%eax)
c0003665:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003668:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000366b:	8b 4a 20             	mov    0x20(%edx),%ecx
c000366e:	89 48 20             	mov    %ecx,0x20(%eax)
c0003671:	8b 52 24             	mov    0x24(%edx),%edx
c0003674:	89 50 24             	mov    %edx,0x24(%eax)
c0003677:	8b 45 08             	mov    0x8(%ebp),%eax
c000367a:	8d 65 f8             	lea    -0x8(%ebp),%esp
c000367d:	5b                   	pop    %ebx
c000367e:	5e                   	pop    %esi
c000367f:	5d                   	pop    %ebp
c0003680:	c3                   	ret    

c0003681 <create_file>:
c0003681:	55                   	push   %ebp
c0003682:	89 e5                	mov    %esp,%ebp
c0003684:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000368a:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000368d:	50                   	push   %eax
c000368e:	ff 75 0c             	pushl  0xc(%ebp)
c0003691:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003694:	50                   	push   %eax
c0003695:	e8 59 fd ff ff       	call   c00033f3 <strip_path>
c000369a:	83 c4 0c             	add    $0xc,%esp
c000369d:	83 f8 ff             	cmp    $0xffffffff,%eax
c00036a0:	75 0a                	jne    c00036ac <create_file+0x2b>
c00036a2:	b8 00 00 00 00       	mov    $0x0,%eax
c00036a7:	e9 de 00 00 00       	jmp    c000378a <create_file+0x109>
c00036ac:	e8 db 00 00 00       	call   c000378c <alloc_imap_bit>
c00036b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00036b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00036b8:	75 0a                	jne    c00036c4 <create_file+0x43>
c00036ba:	b8 00 00 00 00       	mov    $0x0,%eax
c00036bf:	e9 c6 00 00 00       	jmp    c000378a <create_file+0x109>
c00036c4:	e8 dd 10 00 00       	call   c00047a6 <get_super_block>
c00036c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00036cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00036cf:	8b 40 10             	mov    0x10(%eax),%eax
c00036d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00036d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00036d8:	83 ec 08             	sub    $0x8,%esp
c00036db:	50                   	push   %eax
c00036dc:	ff 75 f4             	pushl  -0xc(%ebp)
c00036df:	e8 a5 01 00 00       	call   c0003889 <alloc_smap_bit>
c00036e4:	83 c4 10             	add    $0x10,%esp
c00036e7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00036ea:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00036ee:	75 0a                	jne    c00036fa <create_file+0x79>
c00036f0:	b8 00 00 00 00       	mov    $0x0,%eax
c00036f5:	e9 90 00 00 00       	jmp    c000378a <create_file+0x109>
c00036fa:	83 ec 04             	sub    $0x4,%esp
c00036fd:	ff 75 e8             	pushl  -0x18(%ebp)
c0003700:	ff 75 f4             	pushl  -0xc(%ebp)
c0003703:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003706:	50                   	push   %eax
c0003707:	e8 1e 03 00 00       	call   c0003a2a <new_inode>
c000370c:	83 c4 10             	add    $0x10,%esp
c000370f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003712:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003716:	75 07                	jne    c000371f <create_file+0x9e>
c0003718:	b8 00 00 00 00       	mov    $0x0,%eax
c000371d:	eb 6b                	jmp    c000378a <create_file+0x109>
c000371f:	ff 75 f4             	pushl  -0xc(%ebp)
c0003722:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003725:	50                   	push   %eax
c0003726:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0003729:	50                   	push   %eax
c000372a:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003730:	50                   	push   %eax
c0003731:	e8 12 04 00 00       	call   c0003b48 <new_dir_entry>
c0003736:	83 c4 10             	add    $0x10,%esp
c0003739:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000373c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003740:	75 07                	jne    c0003749 <create_file+0xc8>
c0003742:	b8 00 00 00 00       	mov    $0x0,%eax
c0003747:	eb 41                	jmp    c000378a <create_file+0x109>
c0003749:	8b 45 08             	mov    0x8(%ebp),%eax
c000374c:	8b 55 84             	mov    -0x7c(%ebp),%edx
c000374f:	89 10                	mov    %edx,(%eax)
c0003751:	8b 55 88             	mov    -0x78(%ebp),%edx
c0003754:	89 50 04             	mov    %edx,0x4(%eax)
c0003757:	8b 55 8c             	mov    -0x74(%ebp),%edx
c000375a:	89 50 08             	mov    %edx,0x8(%eax)
c000375d:	8b 55 90             	mov    -0x70(%ebp),%edx
c0003760:	89 50 0c             	mov    %edx,0xc(%eax)
c0003763:	8b 55 94             	mov    -0x6c(%ebp),%edx
c0003766:	89 50 10             	mov    %edx,0x10(%eax)
c0003769:	8b 55 98             	mov    -0x68(%ebp),%edx
c000376c:	89 50 14             	mov    %edx,0x14(%eax)
c000376f:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0003772:	89 50 18             	mov    %edx,0x18(%eax)
c0003775:	8b 55 a0             	mov    -0x60(%ebp),%edx
c0003778:	89 50 1c             	mov    %edx,0x1c(%eax)
c000377b:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c000377e:	89 50 20             	mov    %edx,0x20(%eax)
c0003781:	8b 55 a8             	mov    -0x58(%ebp),%edx
c0003784:	89 50 24             	mov    %edx,0x24(%eax)
c0003787:	8b 45 08             	mov    0x8(%ebp),%eax
c000378a:	c9                   	leave  
c000378b:	c3                   	ret    

c000378c <alloc_imap_bit>:
c000378c:	55                   	push   %ebp
c000378d:	89 e5                	mov    %esp,%ebp
c000378f:	53                   	push   %ebx
c0003790:	83 ec 24             	sub    $0x24,%esp
c0003793:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c000379a:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00037a1:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00037a6:	83 ec 0c             	sub    $0xc,%esp
c00037a9:	6a 07                	push   $0x7
c00037ab:	68 00 02 00 00       	push   $0x200
c00037b0:	50                   	push   %eax
c00037b1:	ff 75 e8             	pushl  -0x18(%ebp)
c00037b4:	ff 75 ec             	pushl  -0x14(%ebp)
c00037b7:	e8 25 f2 ff ff       	call   c00029e1 <rd_wt>
c00037bc:	83 c4 20             	add    $0x20,%esp
c00037bf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00037c6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00037cd:	e9 a5 00 00 00       	jmp    c0003877 <alloc_imap_bit+0xeb>
c00037d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00037d9:	e9 8b 00 00 00       	jmp    c0003869 <alloc_imap_bit+0xdd>
c00037de:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00037e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00037e7:	01 d0                	add    %edx,%eax
c00037e9:	0f b6 00             	movzbl (%eax),%eax
c00037ec:	0f be d0             	movsbl %al,%edx
c00037ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00037f2:	89 c1                	mov    %eax,%ecx
c00037f4:	d3 fa                	sar    %cl,%edx
c00037f6:	89 d0                	mov    %edx,%eax
c00037f8:	83 e0 01             	and    $0x1,%eax
c00037fb:	85 c0                	test   %eax,%eax
c00037fd:	74 06                	je     c0003805 <alloc_imap_bit+0x79>
c00037ff:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003803:	eb 64                	jmp    c0003869 <alloc_imap_bit+0xdd>
c0003805:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000380b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000380e:	01 d0                	add    %edx,%eax
c0003810:	0f b6 18             	movzbl (%eax),%ebx
c0003813:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003816:	ba 01 00 00 00       	mov    $0x1,%edx
c000381b:	89 c1                	mov    %eax,%ecx
c000381d:	d3 e2                	shl    %cl,%edx
c000381f:	89 d0                	mov    %edx,%eax
c0003821:	89 c1                	mov    %eax,%ecx
c0003823:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003829:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000382c:	01 d0                	add    %edx,%eax
c000382e:	09 cb                	or     %ecx,%ebx
c0003830:	89 da                	mov    %ebx,%edx
c0003832:	88 10                	mov    %dl,(%eax)
c0003834:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003837:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000383e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003841:	01 d0                	add    %edx,%eax
c0003843:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003846:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000384b:	83 ec 0c             	sub    $0xc,%esp
c000384e:	6a 0a                	push   $0xa
c0003850:	68 00 02 00 00       	push   $0x200
c0003855:	50                   	push   %eax
c0003856:	ff 75 e8             	pushl  -0x18(%ebp)
c0003859:	ff 75 ec             	pushl  -0x14(%ebp)
c000385c:	e8 80 f1 ff ff       	call   c00029e1 <rd_wt>
c0003861:	83 c4 20             	add    $0x20,%esp
c0003864:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003867:	eb 1b                	jmp    c0003884 <alloc_imap_bit+0xf8>
c0003869:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c000386d:	0f 8e 6b ff ff ff    	jle    c00037de <alloc_imap_bit+0x52>
c0003873:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003877:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c000387e:	0f 8e 4e ff ff ff    	jle    c00037d2 <alloc_imap_bit+0x46>
c0003884:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003887:	c9                   	leave  
c0003888:	c3                   	ret    

c0003889 <alloc_smap_bit>:
c0003889:	55                   	push   %ebp
c000388a:	89 e5                	mov    %esp,%ebp
c000388c:	53                   	push   %ebx
c000388d:	83 ec 34             	sub    $0x34,%esp
c0003890:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003894:	75 1c                	jne    c00038b2 <alloc_smap_bit+0x29>
c0003896:	68 ed 02 00 00       	push   $0x2ed
c000389b:	68 50 a8 00 c0       	push   $0xc000a850
c00038a0:	68 50 a8 00 c0       	push   $0xc000a850
c00038a5:	68 60 a9 00 c0       	push   $0xc000a960
c00038aa:	e8 3f 58 00 00       	call   c00090ee <assertion_failure>
c00038af:	83 c4 10             	add    $0x10,%esp
c00038b2:	e8 ef 0e 00 00       	call   c00047a6 <get_super_block>
c00038b7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00038ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00038bd:	8b 40 08             	mov    0x8(%eax),%eax
c00038c0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00038c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00038c6:	8b 40 04             	mov    0x4(%eax),%eax
c00038c9:	83 c0 02             	add    $0x2,%eax
c00038cc:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00038cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00038d6:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c00038dd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00038e4:	e9 20 01 00 00       	jmp    c0003a09 <alloc_smap_bit+0x180>
c00038e9:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00038ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00038ef:	01 d0                	add    %edx,%eax
c00038f1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00038f4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00038f9:	83 ec 0c             	sub    $0xc,%esp
c00038fc:	6a 07                	push   $0x7
c00038fe:	68 00 02 00 00       	push   $0x200
c0003903:	50                   	push   %eax
c0003904:	ff 75 d8             	pushl  -0x28(%ebp)
c0003907:	ff 75 d4             	pushl  -0x2c(%ebp)
c000390a:	e8 d2 f0 ff ff       	call   c00029e1 <rd_wt>
c000390f:	83 c4 20             	add    $0x20,%esp
c0003912:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003919:	e9 b0 00 00 00       	jmp    c00039ce <alloc_smap_bit+0x145>
c000391e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003925:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003929:	0f 85 8c 00 00 00    	jne    c00039bb <alloc_smap_bit+0x132>
c000392f:	eb 45                	jmp    c0003976 <alloc_smap_bit+0xed>
c0003931:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003937:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000393a:	01 d0                	add    %edx,%eax
c000393c:	0f b6 00             	movzbl (%eax),%eax
c000393f:	0f be d0             	movsbl %al,%edx
c0003942:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003945:	89 c1                	mov    %eax,%ecx
c0003947:	d3 fa                	sar    %cl,%edx
c0003949:	89 d0                	mov    %edx,%eax
c000394b:	83 e0 01             	and    $0x1,%eax
c000394e:	85 c0                	test   %eax,%eax
c0003950:	74 06                	je     c0003958 <alloc_smap_bit+0xcf>
c0003952:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003956:	eb 1e                	jmp    c0003976 <alloc_smap_bit+0xed>
c0003958:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000395b:	c1 e0 09             	shl    $0x9,%eax
c000395e:	89 c2                	mov    %eax,%edx
c0003960:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003963:	01 d0                	add    %edx,%eax
c0003965:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000396c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000396f:	01 d0                	add    %edx,%eax
c0003971:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003974:	eb 06                	jmp    c000397c <alloc_smap_bit+0xf3>
c0003976:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000397a:	7e b5                	jle    c0003931 <alloc_smap_bit+0xa8>
c000397c:	eb 3d                	jmp    c00039bb <alloc_smap_bit+0x132>
c000397e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003982:	74 45                	je     c00039c9 <alloc_smap_bit+0x140>
c0003984:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000398a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000398d:	01 d0                	add    %edx,%eax
c000398f:	0f b6 18             	movzbl (%eax),%ebx
c0003992:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003995:	ba 01 00 00 00       	mov    $0x1,%edx
c000399a:	89 c1                	mov    %eax,%ecx
c000399c:	d3 e2                	shl    %cl,%edx
c000399e:	89 d0                	mov    %edx,%eax
c00039a0:	89 c1                	mov    %eax,%ecx
c00039a2:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039ab:	01 d0                	add    %edx,%eax
c00039ad:	09 cb                	or     %ecx,%ebx
c00039af:	89 da                	mov    %ebx,%edx
c00039b1:	88 10                	mov    %dl,(%eax)
c00039b3:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00039b7:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00039bb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00039bf:	74 09                	je     c00039ca <alloc_smap_bit+0x141>
c00039c1:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00039c5:	7e b7                	jle    c000397e <alloc_smap_bit+0xf5>
c00039c7:	eb 01                	jmp    c00039ca <alloc_smap_bit+0x141>
c00039c9:	90                   	nop
c00039ca:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00039ce:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c00039d5:	0f 8e 43 ff ff ff    	jle    c000391e <alloc_smap_bit+0x95>
c00039db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00039df:	74 1e                	je     c00039ff <alloc_smap_bit+0x176>
c00039e1:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00039e6:	83 ec 0c             	sub    $0xc,%esp
c00039e9:	6a 0a                	push   $0xa
c00039eb:	68 00 02 00 00       	push   $0x200
c00039f0:	50                   	push   %eax
c00039f1:	ff 75 d8             	pushl  -0x28(%ebp)
c00039f4:	ff 75 d4             	pushl  -0x2c(%ebp)
c00039f7:	e8 e5 ef ff ff       	call   c00029e1 <rd_wt>
c00039fc:	83 c4 20             	add    $0x20,%esp
c00039ff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a03:	74 12                	je     c0003a17 <alloc_smap_bit+0x18e>
c0003a05:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003a09:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a0c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003a0f:	0f 8c d4 fe ff ff    	jl     c00038e9 <alloc_smap_bit+0x60>
c0003a15:	eb 01                	jmp    c0003a18 <alloc_smap_bit+0x18f>
c0003a17:	90                   	nop
c0003a18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a1b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003a1e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a21:	8b 00                	mov    (%eax),%eax
c0003a23:	01 d0                	add    %edx,%eax
c0003a25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003a28:	c9                   	leave  
c0003a29:	c3                   	ret    

c0003a2a <new_inode>:
c0003a2a:	55                   	push   %ebp
c0003a2b:	89 e5                	mov    %esp,%ebp
c0003a2d:	83 ec 38             	sub    $0x38,%esp
c0003a30:	83 ec 08             	sub    $0x8,%esp
c0003a33:	ff 75 0c             	pushl  0xc(%ebp)
c0003a36:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003a39:	50                   	push   %eax
c0003a3a:	e8 80 fa ff ff       	call   c00034bf <get_inode>
c0003a3f:	83 c4 10             	add    $0x10,%esp
c0003a42:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a45:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003a49:	75 0a                	jne    c0003a55 <new_inode+0x2b>
c0003a4b:	b8 00 00 00 00       	mov    $0x0,%eax
c0003a50:	e9 f1 00 00 00       	jmp    c0003b46 <new_inode+0x11c>
c0003a55:	8b 45 10             	mov    0x10(%ebp),%eax
c0003a58:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003a5b:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003a62:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003a69:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003a70:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003a73:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003a76:	83 ec 0c             	sub    $0xc,%esp
c0003a79:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003a7c:	50                   	push   %eax
c0003a7d:	e8 40 0b 00 00       	call   c00045c2 <sync_inode>
c0003a82:	83 c4 10             	add    $0x10,%esp
c0003a85:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003a8c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003a93:	eb 1d                	jmp    c0003ab2 <new_inode+0x88>
c0003a95:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003a98:	89 d0                	mov    %edx,%eax
c0003a9a:	c1 e0 02             	shl    $0x2,%eax
c0003a9d:	01 d0                	add    %edx,%eax
c0003a9f:	c1 e0 03             	shl    $0x3,%eax
c0003aa2:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003aa7:	8b 00                	mov    (%eax),%eax
c0003aa9:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003aac:	74 0c                	je     c0003aba <new_inode+0x90>
c0003aae:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003ab2:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003ab6:	7e dd                	jle    c0003a95 <new_inode+0x6b>
c0003ab8:	eb 01                	jmp    c0003abb <new_inode+0x91>
c0003aba:	90                   	nop
c0003abb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003abe:	89 d0                	mov    %edx,%eax
c0003ac0:	c1 e0 02             	shl    $0x2,%eax
c0003ac3:	01 d0                	add    %edx,%eax
c0003ac5:	c1 e0 03             	shl    $0x3,%eax
c0003ac8:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003acd:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003ad0:	89 10                	mov    %edx,(%eax)
c0003ad2:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003ad5:	89 50 04             	mov    %edx,0x4(%eax)
c0003ad8:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003adb:	89 50 08             	mov    %edx,0x8(%eax)
c0003ade:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003ae1:	89 50 0c             	mov    %edx,0xc(%eax)
c0003ae4:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003ae7:	89 50 10             	mov    %edx,0x10(%eax)
c0003aea:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003aed:	89 50 14             	mov    %edx,0x14(%eax)
c0003af0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003af3:	89 50 18             	mov    %edx,0x18(%eax)
c0003af6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003af9:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003afc:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003aff:	89 50 20             	mov    %edx,0x20(%eax)
c0003b02:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003b05:	89 50 24             	mov    %edx,0x24(%eax)
c0003b08:	8b 45 08             	mov    0x8(%ebp),%eax
c0003b0b:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003b0e:	89 10                	mov    %edx,(%eax)
c0003b10:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003b13:	89 50 04             	mov    %edx,0x4(%eax)
c0003b16:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003b19:	89 50 08             	mov    %edx,0x8(%eax)
c0003b1c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003b1f:	89 50 0c             	mov    %edx,0xc(%eax)
c0003b22:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003b25:	89 50 10             	mov    %edx,0x10(%eax)
c0003b28:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003b2b:	89 50 14             	mov    %edx,0x14(%eax)
c0003b2e:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003b31:	89 50 18             	mov    %edx,0x18(%eax)
c0003b34:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003b37:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003b3a:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003b3d:	89 50 20             	mov    %edx,0x20(%eax)
c0003b40:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003b43:	89 50 24             	mov    %edx,0x24(%eax)
c0003b46:	c9                   	leave  
c0003b47:	c3                   	ret    

c0003b48 <new_dir_entry>:
c0003b48:	55                   	push   %ebp
c0003b49:	89 e5                	mov    %esp,%ebp
c0003b4b:	83 ec 48             	sub    $0x48,%esp
c0003b4e:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003b55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b58:	8b 40 04             	mov    0x4(%eax),%eax
c0003b5b:	99                   	cltd   
c0003b5c:	f7 7d dc             	idivl  -0x24(%ebp)
c0003b5f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003b62:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b65:	8b 40 0c             	mov    0xc(%eax),%eax
c0003b68:	99                   	cltd   
c0003b69:	f7 7d dc             	idivl  -0x24(%ebp)
c0003b6c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003b6f:	e8 32 0c 00 00       	call   c00047a6 <get_super_block>
c0003b74:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003b77:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003b7a:	8b 00                	mov    (%eax),%eax
c0003b7c:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003b7f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003b82:	8b 40 0c             	mov    0xc(%eax),%eax
c0003b85:	05 00 02 00 00       	add    $0x200,%eax
c0003b8a:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003b90:	85 c0                	test   %eax,%eax
c0003b92:	0f 48 c2             	cmovs  %edx,%eax
c0003b95:	c1 f8 09             	sar    $0x9,%eax
c0003b98:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003b9b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003ba2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003ba9:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003bb0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003bb7:	eb 7f                	jmp    c0003c38 <new_dir_entry+0xf0>
c0003bb9:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003bbe:	89 c1                	mov    %eax,%ecx
c0003bc0:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003bc3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003bc6:	01 d0                	add    %edx,%eax
c0003bc8:	83 ec 0c             	sub    $0xc,%esp
c0003bcb:	6a 07                	push   $0x7
c0003bcd:	68 00 02 00 00       	push   $0x200
c0003bd2:	51                   	push   %ecx
c0003bd3:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003bd6:	50                   	push   %eax
c0003bd7:	e8 05 ee ff ff       	call   c00029e1 <rd_wt>
c0003bdc:	83 c4 20             	add    $0x20,%esp
c0003bdf:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003be4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003be7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003bee:	eb 25                	jmp    c0003c15 <new_dir_entry+0xcd>
c0003bf0:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003bf4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003bf7:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003bfa:	7f 29                	jg     c0003c25 <new_dir_entry+0xdd>
c0003bfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003bff:	8b 00                	mov    (%eax),%eax
c0003c01:	85 c0                	test   %eax,%eax
c0003c03:	75 08                	jne    c0003c0d <new_dir_entry+0xc5>
c0003c05:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c08:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003c0b:	eb 19                	jmp    c0003c26 <new_dir_entry+0xde>
c0003c0d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003c11:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003c15:	b8 00 02 00 00       	mov    $0x200,%eax
c0003c1a:	99                   	cltd   
c0003c1b:	f7 7d dc             	idivl  -0x24(%ebp)
c0003c1e:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003c21:	7c cd                	jl     c0003bf0 <new_dir_entry+0xa8>
c0003c23:	eb 01                	jmp    c0003c26 <new_dir_entry+0xde>
c0003c25:	90                   	nop
c0003c26:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003c29:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003c2c:	7f 16                	jg     c0003c44 <new_dir_entry+0xfc>
c0003c2e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003c32:	75 10                	jne    c0003c44 <new_dir_entry+0xfc>
c0003c34:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003c38:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003c3b:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003c3e:	0f 8c 75 ff ff ff    	jl     c0003bb9 <new_dir_entry+0x71>
c0003c44:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003c47:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003c4a:	75 0a                	jne    c0003c56 <new_dir_entry+0x10e>
c0003c4c:	b8 00 00 00 00       	mov    $0x0,%eax
c0003c51:	e9 fc 00 00 00       	jmp    c0003d52 <new_dir_entry+0x20a>
c0003c56:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003c5d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003c61:	75 1e                	jne    c0003c81 <new_dir_entry+0x139>
c0003c63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c66:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003c69:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c6c:	8b 50 04             	mov    0x4(%eax),%edx
c0003c6f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003c72:	01 c2                	add    %eax,%edx
c0003c74:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003c77:	89 50 04             	mov    %edx,0x4(%eax)
c0003c7a:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003c84:	8b 55 14             	mov    0x14(%ebp),%edx
c0003c87:	89 10                	mov    %edx,(%eax)
c0003c89:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003c8c:	83 c0 04             	add    $0x4,%eax
c0003c8f:	83 ec 08             	sub    $0x8,%esp
c0003c92:	ff 75 10             	pushl  0x10(%ebp)
c0003c95:	50                   	push   %eax
c0003c96:	e8 b6 75 00 00       	call   c000b251 <Strcpy>
c0003c9b:	83 c4 10             	add    $0x10,%esp
c0003c9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0003ca1:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003ca4:	8b 0a                	mov    (%edx),%ecx
c0003ca6:	89 08                	mov    %ecx,(%eax)
c0003ca8:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003cab:	89 48 04             	mov    %ecx,0x4(%eax)
c0003cae:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003cb1:	89 48 08             	mov    %ecx,0x8(%eax)
c0003cb4:	8b 52 0c             	mov    0xc(%edx),%edx
c0003cb7:	89 50 0c             	mov    %edx,0xc(%eax)
c0003cba:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003cbf:	89 c1                	mov    %eax,%ecx
c0003cc1:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003cc4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003cc7:	01 d0                	add    %edx,%eax
c0003cc9:	83 ec 0c             	sub    $0xc,%esp
c0003ccc:	6a 0a                	push   $0xa
c0003cce:	68 00 02 00 00       	push   $0x200
c0003cd3:	51                   	push   %ecx
c0003cd4:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003cd7:	50                   	push   %eax
c0003cd8:	e8 04 ed ff ff       	call   c00029e1 <rd_wt>
c0003cdd:	83 c4 20             	add    $0x20,%esp
c0003ce0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003ce4:	74 69                	je     c0003d4f <new_dir_entry+0x207>
c0003ce6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ce9:	8b 10                	mov    (%eax),%edx
c0003ceb:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003cf1:	8b 50 04             	mov    0x4(%eax),%edx
c0003cf4:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003cfa:	8b 50 08             	mov    0x8(%eax),%edx
c0003cfd:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003d03:	8b 50 0c             	mov    0xc(%eax),%edx
c0003d06:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003d0c:	8b 50 10             	mov    0x10(%eax),%edx
c0003d0f:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003d15:	8b 50 14             	mov    0x14(%eax),%edx
c0003d18:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003d1e:	8b 50 18             	mov    0x18(%eax),%edx
c0003d21:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003d27:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003d2a:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003d30:	8b 50 20             	mov    0x20(%eax),%edx
c0003d33:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003d39:	8b 40 24             	mov    0x24(%eax),%eax
c0003d3c:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003d41:	83 ec 0c             	sub    $0xc,%esp
c0003d44:	ff 75 0c             	pushl  0xc(%ebp)
c0003d47:	e8 76 08 00 00       	call   c00045c2 <sync_inode>
c0003d4c:	83 c4 10             	add    $0x10,%esp
c0003d4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0003d52:	c9                   	leave  
c0003d53:	c3                   	ret    

c0003d54 <do_unlink>:
c0003d54:	55                   	push   %ebp
c0003d55:	89 e5                	mov    %esp,%ebp
c0003d57:	53                   	push   %ebx
c0003d58:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003d5e:	83 ec 08             	sub    $0x8,%esp
c0003d61:	ff 75 08             	pushl  0x8(%ebp)
c0003d64:	68 75 a9 00 c0       	push   $0xc000a975
c0003d69:	e8 d0 5e 00 00       	call   c0009c3e <strcmp>
c0003d6e:	83 c4 10             	add    $0x10,%esp
c0003d71:	85 c0                	test   %eax,%eax
c0003d73:	75 10                	jne    c0003d85 <do_unlink+0x31>
c0003d75:	83 ec 0c             	sub    $0xc,%esp
c0003d78:	68 77 a9 00 c0       	push   $0xc000a977
c0003d7d:	e8 4e 53 00 00       	call   c00090d0 <panic>
c0003d82:	83 c4 10             	add    $0x10,%esp
c0003d85:	83 ec 0c             	sub    $0xc,%esp
c0003d88:	ff 75 08             	pushl  0x8(%ebp)
c0003d8b:	e8 31 f5 ff ff       	call   c00032c1 <search_file>
c0003d90:	83 c4 10             	add    $0x10,%esp
c0003d93:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003d96:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003d9a:	75 10                	jne    c0003dac <do_unlink+0x58>
c0003d9c:	83 ec 0c             	sub    $0xc,%esp
c0003d9f:	68 93 a9 00 c0       	push   $0xc000a993
c0003da4:	e8 27 53 00 00       	call   c00090d0 <panic>
c0003da9:	83 c4 10             	add    $0x10,%esp
c0003dac:	83 ec 08             	sub    $0x8,%esp
c0003daf:	ff 75 d0             	pushl  -0x30(%ebp)
c0003db2:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003db8:	50                   	push   %eax
c0003db9:	e8 01 f7 ff ff       	call   c00034bf <get_inode>
c0003dbe:	83 c4 10             	add    $0x10,%esp
c0003dc1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003dc4:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003dc8:	75 10                	jne    c0003dda <do_unlink+0x86>
c0003dca:	83 ec 0c             	sub    $0xc,%esp
c0003dcd:	68 93 a9 00 c0       	push   $0xc000a993
c0003dd2:	e8 f9 52 00 00       	call   c00090d0 <panic>
c0003dd7:	83 c4 10             	add    $0x10,%esp
c0003dda:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003ddd:	85 c0                	test   %eax,%eax
c0003ddf:	7e 10                	jle    c0003df1 <do_unlink+0x9d>
c0003de1:	83 ec 0c             	sub    $0xc,%esp
c0003de4:	68 ac a9 00 c0       	push   $0xc000a9ac
c0003de9:	e8 e2 52 00 00       	call   c00090d0 <panic>
c0003dee:	83 c4 10             	add    $0x10,%esp
c0003df1:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003df7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003dfa:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003dfd:	8d 50 07             	lea    0x7(%eax),%edx
c0003e00:	85 c0                	test   %eax,%eax
c0003e02:	0f 48 c2             	cmovs  %edx,%eax
c0003e05:	c1 f8 03             	sar    $0x3,%eax
c0003e08:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003e0b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003e0e:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003e14:	85 c0                	test   %eax,%eax
c0003e16:	0f 48 c2             	cmovs  %edx,%eax
c0003e19:	c1 f8 09             	sar    $0x9,%eax
c0003e1c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003e1f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003e22:	99                   	cltd   
c0003e23:	c1 ea 1d             	shr    $0x1d,%edx
c0003e26:	01 d0                	add    %edx,%eax
c0003e28:	83 e0 07             	and    $0x7,%eax
c0003e2b:	29 d0                	sub    %edx,%eax
c0003e2d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003e30:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003e37:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e3c:	89 c2                	mov    %eax,%edx
c0003e3e:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003e41:	83 c0 02             	add    $0x2,%eax
c0003e44:	83 ec 0c             	sub    $0xc,%esp
c0003e47:	6a 07                	push   $0x7
c0003e49:	68 00 02 00 00       	push   $0x200
c0003e4e:	52                   	push   %edx
c0003e4f:	ff 75 b8             	pushl  -0x48(%ebp)
c0003e52:	50                   	push   %eax
c0003e53:	e8 89 eb ff ff       	call   c00029e1 <rd_wt>
c0003e58:	83 c4 20             	add    $0x20,%esp
c0003e5b:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003e61:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003e64:	01 d0                	add    %edx,%eax
c0003e66:	0f b6 10             	movzbl (%eax),%edx
c0003e69:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003e6c:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003e71:	89 c1                	mov    %eax,%ecx
c0003e73:	d3 e3                	shl    %cl,%ebx
c0003e75:	89 d8                	mov    %ebx,%eax
c0003e77:	f7 d0                	not    %eax
c0003e79:	89 c3                	mov    %eax,%ebx
c0003e7b:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003e81:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003e84:	01 c8                	add    %ecx,%eax
c0003e86:	21 da                	and    %ebx,%edx
c0003e88:	88 10                	mov    %dl,(%eax)
c0003e8a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e8f:	89 c2                	mov    %eax,%edx
c0003e91:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003e94:	83 c0 02             	add    $0x2,%eax
c0003e97:	83 ec 0c             	sub    $0xc,%esp
c0003e9a:	6a 0a                	push   $0xa
c0003e9c:	68 00 02 00 00       	push   $0x200
c0003ea1:	52                   	push   %edx
c0003ea2:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ea5:	50                   	push   %eax
c0003ea6:	e8 36 eb ff ff       	call   c00029e1 <rd_wt>
c0003eab:	83 c4 20             	add    $0x20,%esp
c0003eae:	e8 f3 08 00 00       	call   c00047a6 <get_super_block>
c0003eb3:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003eb6:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003ebc:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003ebf:	8b 00                	mov    (%eax),%eax
c0003ec1:	29 c2                	sub    %eax,%edx
c0003ec3:	89 d0                	mov    %edx,%eax
c0003ec5:	83 c0 01             	add    $0x1,%eax
c0003ec8:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003ecb:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003ece:	8d 50 07             	lea    0x7(%eax),%edx
c0003ed1:	85 c0                	test   %eax,%eax
c0003ed3:	0f 48 c2             	cmovs  %edx,%eax
c0003ed6:	c1 f8 03             	sar    $0x3,%eax
c0003ed9:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003edc:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003edf:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003ee5:	85 c0                	test   %eax,%eax
c0003ee7:	0f 48 c2             	cmovs  %edx,%eax
c0003eea:	c1 f8 09             	sar    $0x9,%eax
c0003eed:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003ef0:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003ef3:	99                   	cltd   
c0003ef4:	c1 ea 1d             	shr    $0x1d,%edx
c0003ef7:	01 d0                	add    %edx,%eax
c0003ef9:	83 e0 07             	and    $0x7,%eax
c0003efc:	29 d0                	sub    %edx,%eax
c0003efe:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003f01:	b8 08 00 00 00       	mov    $0x8,%eax
c0003f06:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003f09:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003f0c:	29 c2                	sub    %eax,%edx
c0003f0e:	89 d0                	mov    %edx,%eax
c0003f10:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003f13:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f16:	8d 50 07             	lea    0x7(%eax),%edx
c0003f19:	85 c0                	test   %eax,%eax
c0003f1b:	0f 48 c2             	cmovs  %edx,%eax
c0003f1e:	c1 f8 03             	sar    $0x3,%eax
c0003f21:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003f24:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003f29:	89 c1                	mov    %eax,%ecx
c0003f2b:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003f2e:	8b 40 04             	mov    0x4(%eax),%eax
c0003f31:	8d 50 02             	lea    0x2(%eax),%edx
c0003f34:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003f37:	01 d0                	add    %edx,%eax
c0003f39:	83 ec 0c             	sub    $0xc,%esp
c0003f3c:	6a 07                	push   $0x7
c0003f3e:	68 00 02 00 00       	push   $0x200
c0003f43:	51                   	push   %ecx
c0003f44:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f47:	50                   	push   %eax
c0003f48:	e8 94 ea ff ff       	call   c00029e1 <rd_wt>
c0003f4d:	83 c4 20             	add    $0x20,%esp
c0003f50:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003f56:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003f59:	01 d0                	add    %edx,%eax
c0003f5b:	0f b6 10             	movzbl (%eax),%edx
c0003f5e:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003f61:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003f66:	89 c1                	mov    %eax,%ecx
c0003f68:	d3 e3                	shl    %cl,%ebx
c0003f6a:	89 d8                	mov    %ebx,%eax
c0003f6c:	f7 d0                	not    %eax
c0003f6e:	89 c3                	mov    %eax,%ebx
c0003f70:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003f76:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003f79:	01 c8                	add    %ecx,%eax
c0003f7b:	21 da                	and    %ebx,%edx
c0003f7d:	88 10                	mov    %dl,(%eax)
c0003f7f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003f86:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003f89:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003f8c:	eb 6b                	jmp    c0003ff9 <do_unlink+0x2a5>
c0003f8e:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003f95:	75 4c                	jne    c0003fe3 <do_unlink+0x28f>
c0003f97:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003f9e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003fa3:	83 ec 0c             	sub    $0xc,%esp
c0003fa6:	6a 0a                	push   $0xa
c0003fa8:	68 00 02 00 00       	push   $0x200
c0003fad:	50                   	push   %eax
c0003fae:	ff 75 b8             	pushl  -0x48(%ebp)
c0003fb1:	ff 75 ec             	pushl  -0x14(%ebp)
c0003fb4:	e8 28 ea ff ff       	call   c00029e1 <rd_wt>
c0003fb9:	83 c4 20             	add    $0x20,%esp
c0003fbc:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003fc1:	89 c1                	mov    %eax,%ecx
c0003fc3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003fc6:	8d 50 01             	lea    0x1(%eax),%edx
c0003fc9:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0003fcc:	83 ec 0c             	sub    $0xc,%esp
c0003fcf:	6a 07                	push   $0x7
c0003fd1:	68 00 02 00 00       	push   $0x200
c0003fd6:	51                   	push   %ecx
c0003fd7:	ff 75 b8             	pushl  -0x48(%ebp)
c0003fda:	50                   	push   %eax
c0003fdb:	e8 01 ea ff ff       	call   c00029e1 <rd_wt>
c0003fe0:	83 c4 20             	add    $0x20,%esp
c0003fe3:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003fe9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003fec:	01 d0                	add    %edx,%eax
c0003fee:	c6 00 00             	movb   $0x0,(%eax)
c0003ff1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003ff5:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c0003ff9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003ffc:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0003fff:	7c 8d                	jl     c0003f8e <do_unlink+0x23a>
c0004001:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0004008:	75 4c                	jne    c0004056 <do_unlink+0x302>
c000400a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004011:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004016:	83 ec 0c             	sub    $0xc,%esp
c0004019:	6a 0a                	push   $0xa
c000401b:	68 00 02 00 00       	push   $0x200
c0004020:	50                   	push   %eax
c0004021:	ff 75 b8             	pushl  -0x48(%ebp)
c0004024:	ff 75 ec             	pushl  -0x14(%ebp)
c0004027:	e8 b5 e9 ff ff       	call   c00029e1 <rd_wt>
c000402c:	83 c4 20             	add    $0x20,%esp
c000402f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004034:	89 c1                	mov    %eax,%ecx
c0004036:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004039:	8d 50 01             	lea    0x1(%eax),%edx
c000403c:	89 55 ec             	mov    %edx,-0x14(%ebp)
c000403f:	83 ec 0c             	sub    $0xc,%esp
c0004042:	6a 07                	push   $0x7
c0004044:	68 00 02 00 00       	push   $0x200
c0004049:	51                   	push   %ecx
c000404a:	ff 75 b8             	pushl  -0x48(%ebp)
c000404d:	50                   	push   %eax
c000404e:	e8 8e e9 ff ff       	call   c00029e1 <rd_wt>
c0004053:	83 c4 20             	add    $0x20,%esp
c0004056:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000405c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000405f:	01 d0                	add    %edx,%eax
c0004061:	0f b6 10             	movzbl (%eax),%edx
c0004064:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004067:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c000406c:	89 c1                	mov    %eax,%ecx
c000406e:	d3 e3                	shl    %cl,%ebx
c0004070:	89 d8                	mov    %ebx,%eax
c0004072:	89 c3                	mov    %eax,%ebx
c0004074:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c000407a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000407d:	01 c8                	add    %ecx,%eax
c000407f:	21 da                	and    %ebx,%edx
c0004081:	88 10                	mov    %dl,(%eax)
c0004083:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004088:	83 ec 0c             	sub    $0xc,%esp
c000408b:	6a 0a                	push   $0xa
c000408d:	68 00 02 00 00       	push   $0x200
c0004092:	50                   	push   %eax
c0004093:	ff 75 b8             	pushl  -0x48(%ebp)
c0004096:	ff 75 ec             	pushl  -0x14(%ebp)
c0004099:	e8 43 e9 ff ff       	call   c00029e1 <rd_wt>
c000409e:	83 c4 20             	add    $0x20,%esp
c00040a1:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c00040a8:	00 00 00 
c00040ab:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c00040b2:	00 00 00 
c00040b5:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c00040bc:	00 00 00 
c00040bf:	83 ec 0c             	sub    $0xc,%esp
c00040c2:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00040c8:	50                   	push   %eax
c00040c9:	e8 f4 04 00 00       	call   c00045c2 <sync_inode>
c00040ce:	83 c4 10             	add    $0x10,%esp
c00040d1:	83 ec 0c             	sub    $0xc,%esp
c00040d4:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c00040da:	50                   	push   %eax
c00040db:	e8 36 06 00 00       	call   c0004716 <put_inode>
c00040e0:	83 c4 10             	add    $0x10,%esp
c00040e3:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00040e6:	8b 00                	mov    (%eax),%eax
c00040e8:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00040eb:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c00040f2:	8b 45 98             	mov    -0x68(%ebp),%eax
c00040f5:	8b 40 04             	mov    0x4(%eax),%eax
c00040f8:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00040fb:	8b 45 98             	mov    -0x68(%ebp),%eax
c00040fe:	8b 40 0c             	mov    0xc(%eax),%eax
c0004101:	89 45 90             	mov    %eax,-0x70(%ebp)
c0004104:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004107:	c1 e8 04             	shr    $0x4,%eax
c000410a:	89 45 8c             	mov    %eax,-0x74(%ebp)
c000410d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004114:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000411b:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004122:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0004129:	e9 a5 00 00 00       	jmp    c00041d3 <do_unlink+0x47f>
c000412e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004133:	89 c1                	mov    %eax,%ecx
c0004135:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004138:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000413b:	01 d0                	add    %edx,%eax
c000413d:	83 ec 0c             	sub    $0xc,%esp
c0004140:	6a 07                	push   $0x7
c0004142:	68 00 02 00 00       	push   $0x200
c0004147:	51                   	push   %ecx
c0004148:	ff 75 b8             	pushl  -0x48(%ebp)
c000414b:	50                   	push   %eax
c000414c:	e8 90 e8 ff ff       	call   c00029e1 <rd_wt>
c0004151:	83 c4 20             	add    $0x20,%esp
c0004154:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0004159:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000415c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0004163:	eb 51                	jmp    c00041b6 <do_unlink+0x462>
c0004165:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0004169:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000416c:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c000416f:	7f 4f                	jg     c00041c0 <do_unlink+0x46c>
c0004171:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004174:	83 c0 10             	add    $0x10,%eax
c0004177:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000417a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000417d:	83 c0 04             	add    $0x4,%eax
c0004180:	83 ec 08             	sub    $0x8,%esp
c0004183:	ff 75 08             	pushl  0x8(%ebp)
c0004186:	50                   	push   %eax
c0004187:	e8 b2 5a 00 00       	call   c0009c3e <strcmp>
c000418c:	83 c4 10             	add    $0x10,%esp
c000418f:	85 c0                	test   %eax,%eax
c0004191:	75 1b                	jne    c00041ae <do_unlink+0x45a>
c0004193:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000419a:	83 ec 04             	sub    $0x4,%esp
c000419d:	6a 10                	push   $0x10
c000419f:	6a 00                	push   $0x0
c00041a1:	ff 75 d4             	pushl  -0x2c(%ebp)
c00041a4:	e8 89 70 00 00       	call   c000b232 <Memset>
c00041a9:	83 c4 10             	add    $0x10,%esp
c00041ac:	eb 13                	jmp    c00041c1 <do_unlink+0x46d>
c00041ae:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c00041b2:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c00041b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00041b9:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00041bc:	7c a7                	jl     c0004165 <do_unlink+0x411>
c00041be:	eb 01                	jmp    c00041c1 <do_unlink+0x46d>
c00041c0:	90                   	nop
c00041c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00041c4:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00041c7:	7f 16                	jg     c00041df <do_unlink+0x48b>
c00041c9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00041cd:	75 10                	jne    c00041df <do_unlink+0x48b>
c00041cf:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c00041d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00041d6:	3b 45 90             	cmp    -0x70(%ebp),%eax
c00041d9:	0f 8c 4f ff ff ff    	jl     c000412e <do_unlink+0x3da>
c00041df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00041e2:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00041e5:	75 17                	jne    c00041fe <do_unlink+0x4aa>
c00041e7:	8b 45 98             	mov    -0x68(%ebp),%eax
c00041ea:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00041ed:	89 50 04             	mov    %edx,0x4(%eax)
c00041f0:	83 ec 0c             	sub    $0xc,%esp
c00041f3:	ff 75 98             	pushl  -0x68(%ebp)
c00041f6:	e8 c7 03 00 00       	call   c00045c2 <sync_inode>
c00041fb:	83 c4 10             	add    $0x10,%esp
c00041fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004202:	74 26                	je     c000422a <do_unlink+0x4d6>
c0004204:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004209:	89 c1                	mov    %eax,%ecx
c000420b:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000420e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004211:	01 d0                	add    %edx,%eax
c0004213:	83 ec 0c             	sub    $0xc,%esp
c0004216:	6a 0a                	push   $0xa
c0004218:	68 00 02 00 00       	push   $0x200
c000421d:	51                   	push   %ecx
c000421e:	ff 75 b8             	pushl  -0x48(%ebp)
c0004221:	50                   	push   %eax
c0004222:	e8 ba e7 ff ff       	call   c00029e1 <rd_wt>
c0004227:	83 c4 20             	add    $0x20,%esp
c000422a:	90                   	nop
c000422b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000422e:	c9                   	leave  
c000422f:	c3                   	ret    

c0004230 <do_rdwt>:
c0004230:	55                   	push   %ebp
c0004231:	89 e5                	mov    %esp,%ebp
c0004233:	81 ec 98 00 00 00    	sub    $0x98,%esp
c0004239:	8b 45 08             	mov    0x8(%ebp),%eax
c000423c:	8b 40 68             	mov    0x68(%eax),%eax
c000423f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004242:	8b 45 08             	mov    0x8(%ebp),%eax
c0004245:	8b 40 50             	mov    0x50(%eax),%eax
c0004248:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000424b:	8b 45 08             	mov    0x8(%ebp),%eax
c000424e:	8b 40 5c             	mov    0x5c(%eax),%eax
c0004251:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0004254:	8b 45 08             	mov    0x8(%ebp),%eax
c0004257:	8b 00                	mov    (%eax),%eax
c0004259:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000425c:	8b 45 08             	mov    0x8(%ebp),%eax
c000425f:	8b 40 10             	mov    0x10(%eax),%eax
c0004262:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0004265:	8b 45 08             	mov    0x8(%ebp),%eax
c0004268:	8b 40 40             	mov    0x40(%eax),%eax
c000426b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000426e:	83 ec 0c             	sub    $0xc,%esp
c0004271:	ff 75 cc             	pushl  -0x34(%ebp)
c0004274:	e8 17 07 00 00       	call   c0004990 <pid2proc>
c0004279:	83 c4 10             	add    $0x10,%esp
c000427c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c000427f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0004282:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c0004285:	83 c2 50             	add    $0x50,%edx
c0004288:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c000428c:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000428f:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0004292:	8b 40 08             	mov    0x8(%eax),%eax
c0004295:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0004298:	8b 45 08             	mov    0x8(%ebp),%eax
c000429b:	8b 00                	mov    (%eax),%eax
c000429d:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00042a0:	83 ec 08             	sub    $0x8,%esp
c00042a3:	ff 75 b8             	pushl  -0x48(%ebp)
c00042a6:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00042ac:	50                   	push   %eax
c00042ad:	e8 0d f2 ff ff       	call   c00034bf <get_inode>
c00042b2:	83 c4 10             	add    $0x10,%esp
c00042b5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00042b8:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c00042bc:	75 10                	jne    c00042ce <do_rdwt+0x9e>
c00042be:	83 ec 0c             	sub    $0xc,%esp
c00042c1:	68 e4 a9 00 c0       	push   $0xc000a9e4
c00042c6:	e8 05 4e 00 00       	call   c00090d0 <panic>
c00042cb:	83 c4 10             	add    $0x10,%esp
c00042ce:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00042d4:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00042d7:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00042da:	8b 40 04             	mov    0x4(%eax),%eax
c00042dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00042e0:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c00042e4:	74 22                	je     c0004308 <do_rdwt+0xd8>
c00042e6:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c00042ea:	74 1c                	je     c0004308 <do_rdwt+0xd8>
c00042ec:	68 98 04 00 00       	push   $0x498
c00042f1:	68 50 a8 00 c0       	push   $0xc000a850
c00042f6:	68 50 a8 00 c0       	push   $0xc000a850
c00042fb:	68 f4 a9 00 c0       	push   $0xc000a9f4
c0004300:	e8 e9 4d 00 00       	call   c00090ee <assertion_failure>
c0004305:	83 c4 10             	add    $0x10,%esp
c0004308:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c000430e:	83 f8 01             	cmp    $0x1,%eax
c0004311:	0f 85 86 00 00 00    	jne    c000439d <do_rdwt+0x16d>
c0004317:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000431b:	75 09                	jne    c0004326 <do_rdwt+0xf6>
c000431d:	c7 45 f0 d2 07 00 00 	movl   $0x7d2,-0x10(%ebp)
c0004324:	eb 0d                	jmp    c0004333 <do_rdwt+0x103>
c0004326:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c000432a:	75 07                	jne    c0004333 <do_rdwt+0x103>
c000432c:	c7 45 f0 d3 07 00 00 	movl   $0x7d3,-0x10(%ebp)
c0004333:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004336:	8b 45 08             	mov    0x8(%ebp),%eax
c0004339:	89 50 68             	mov    %edx,0x68(%eax)
c000433c:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c000433f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004342:	89 50 58             	mov    %edx,0x58(%eax)
c0004345:	83 ec 04             	sub    $0x4,%esp
c0004348:	6a 02                	push   $0x2
c000434a:	ff 75 08             	pushl  0x8(%ebp)
c000434d:	6a 03                	push   $0x3
c000434f:	e8 8e 55 00 00       	call   c00098e2 <send_rec>
c0004354:	83 c4 10             	add    $0x10,%esp
c0004357:	8b 45 08             	mov    0x8(%ebp),%eax
c000435a:	8b 40 68             	mov    0x68(%eax),%eax
c000435d:	83 f8 66             	cmp    $0x66,%eax
c0004360:	75 13                	jne    c0004375 <do_rdwt+0x145>
c0004362:	83 ec 04             	sub    $0x4,%esp
c0004365:	ff 75 b4             	pushl  -0x4c(%ebp)
c0004368:	ff 75 08             	pushl  0x8(%ebp)
c000436b:	6a 01                	push   $0x1
c000436d:	e8 70 55 00 00       	call   c00098e2 <send_rec>
c0004372:	83 c4 10             	add    $0x10,%esp
c0004375:	8b 45 08             	mov    0x8(%ebp),%eax
c0004378:	8b 40 68             	mov    0x68(%eax),%eax
c000437b:	83 f8 65             	cmp    $0x65,%eax
c000437e:	75 13                	jne    c0004393 <do_rdwt+0x163>
c0004380:	83 ec 04             	sub    $0x4,%esp
c0004383:	ff 75 b4             	pushl  -0x4c(%ebp)
c0004386:	ff 75 08             	pushl  0x8(%ebp)
c0004389:	6a 01                	push   $0x1
c000438b:	e8 52 55 00 00       	call   c00098e2 <send_rec>
c0004390:	83 c4 10             	add    $0x10,%esp
c0004393:	b8 00 00 00 00       	mov    $0x0,%eax
c0004398:	e9 23 02 00 00       	jmp    c00045c0 <do_rdwt+0x390>
c000439d:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c00043a1:	75 18                	jne    c00043bb <do_rdwt+0x18b>
c00043a3:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00043a9:	c1 e0 09             	shl    $0x9,%eax
c00043ac:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00043af:	75 0a                	jne    c00043bb <do_rdwt+0x18b>
c00043b1:	b8 00 00 00 00       	mov    $0x0,%eax
c00043b6:	e9 05 02 00 00       	jmp    c00045c0 <do_rdwt+0x390>
c00043bb:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c00043bf:	75 1b                	jne    c00043dc <do_rdwt+0x1ac>
c00043c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00043c8:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00043cb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00043ce:	01 d0                	add    %edx,%eax
c00043d0:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c00043d3:	0f 4e 45 ac          	cmovle -0x54(%ebp),%eax
c00043d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00043da:	eb 19                	jmp    c00043f5 <do_rdwt+0x1c5>
c00043dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00043df:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00043e2:	01 c2                	add    %eax,%edx
c00043e4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00043ea:	c1 e0 09             	shl    $0x9,%eax
c00043ed:	39 c2                	cmp    %eax,%edx
c00043ef:	0f 4e c2             	cmovle %edx,%eax
c00043f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00043f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00043f8:	99                   	cltd   
c00043f9:	c1 ea 17             	shr    $0x17,%edx
c00043fc:	01 d0                	add    %edx,%eax
c00043fe:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004403:	29 d0                	sub    %edx,%eax
c0004405:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004408:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000440e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004411:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004417:	85 c0                	test   %eax,%eax
c0004419:	0f 48 c1             	cmovs  %ecx,%eax
c000441c:	c1 f8 09             	sar    $0x9,%eax
c000441f:	01 d0                	add    %edx,%eax
c0004421:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004424:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000442a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000442d:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004433:	85 c0                	test   %eax,%eax
c0004435:	0f 48 c1             	cmovs  %ecx,%eax
c0004438:	c1 f8 09             	sar    $0x9,%eax
c000443b:	01 d0                	add    %edx,%eax
c000443d:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004440:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004443:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004446:	ba 00 00 10 00       	mov    $0x100000,%edx
c000444b:	39 d0                	cmp    %edx,%eax
c000444d:	7d 0b                	jge    c000445a <do_rdwt+0x22a>
c000444f:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004452:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004455:	83 c0 01             	add    $0x1,%eax
c0004458:	eb 05                	jmp    c000445f <do_rdwt+0x22f>
c000445a:	b8 00 00 10 00       	mov    $0x100000,%eax
c000445f:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0004462:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004465:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0004468:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000446f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004472:	8b 00                	mov    (%eax),%eax
c0004474:	83 ec 0c             	sub    $0xc,%esp
c0004477:	50                   	push   %eax
c0004478:	e8 13 05 00 00       	call   c0004990 <pid2proc>
c000447d:	83 c4 10             	add    $0x10,%esp
c0004480:	89 45 9c             	mov    %eax,-0x64(%ebp)
c0004483:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004486:	83 ec 08             	sub    $0x8,%esp
c0004489:	50                   	push   %eax
c000448a:	ff 75 c8             	pushl  -0x38(%ebp)
c000448d:	e8 f2 27 00 00       	call   c0006c84 <alloc_virtual_memory>
c0004492:	83 c4 10             	add    $0x10,%esp
c0004495:	89 45 98             	mov    %eax,-0x68(%ebp)
c0004498:	8b 45 a8             	mov    -0x58(%ebp),%eax
c000449b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000449e:	e9 c5 00 00 00       	jmp    c0004568 <do_rdwt+0x338>
c00044a3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00044a6:	c1 e0 09             	shl    $0x9,%eax
c00044a9:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00044ac:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c00044af:	0f 4e 45 e4          	cmovle -0x1c(%ebp),%eax
c00044b3:	89 45 94             	mov    %eax,-0x6c(%ebp)
c00044b6:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c00044bd:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c00044c1:	75 46                	jne    c0004509 <do_rdwt+0x2d9>
c00044c3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00044c6:	c1 e0 09             	shl    $0x9,%eax
c00044c9:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c00044cf:	83 ec 0c             	sub    $0xc,%esp
c00044d2:	6a 07                	push   $0x7
c00044d4:	50                   	push   %eax
c00044d5:	52                   	push   %edx
c00044d6:	ff 75 90             	pushl  -0x70(%ebp)
c00044d9:	ff 75 dc             	pushl  -0x24(%ebp)
c00044dc:	e8 00 e5 ff ff       	call   c00029e1 <rd_wt>
c00044e1:	83 c4 20             	add    $0x20,%esp
c00044e4:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00044ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00044ed:	01 d0                	add    %edx,%eax
c00044ef:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c00044f2:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00044f5:	01 ca                	add    %ecx,%edx
c00044f7:	83 ec 04             	sub    $0x4,%esp
c00044fa:	ff 75 94             	pushl  -0x6c(%ebp)
c00044fd:	50                   	push   %eax
c00044fe:	52                   	push   %edx
c00044ff:	e8 00 6d 00 00       	call   c000b204 <Memcpy>
c0004504:	83 c4 10             	add    $0x10,%esp
c0004507:	eb 46                	jmp    c000454f <do_rdwt+0x31f>
c0004509:	8b 55 98             	mov    -0x68(%ebp),%edx
c000450c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000450f:	01 d0                	add    %edx,%eax
c0004511:	89 c1                	mov    %eax,%ecx
c0004513:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0004519:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000451c:	01 d0                	add    %edx,%eax
c000451e:	83 ec 04             	sub    $0x4,%esp
c0004521:	ff 75 94             	pushl  -0x6c(%ebp)
c0004524:	51                   	push   %ecx
c0004525:	50                   	push   %eax
c0004526:	e8 d9 6c 00 00       	call   c000b204 <Memcpy>
c000452b:	83 c4 10             	add    $0x10,%esp
c000452e:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004531:	c1 e0 09             	shl    $0x9,%eax
c0004534:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c000453a:	83 ec 0c             	sub    $0xc,%esp
c000453d:	6a 0a                	push   $0xa
c000453f:	50                   	push   %eax
c0004540:	52                   	push   %edx
c0004541:	ff 75 90             	pushl  -0x70(%ebp)
c0004544:	ff 75 dc             	pushl  -0x24(%ebp)
c0004547:	e8 95 e4 ff ff       	call   c00029e1 <rd_wt>
c000454c:	83 c4 20             	add    $0x20,%esp
c000454f:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004552:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c0004555:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004558:	01 45 e0             	add    %eax,-0x20(%ebp)
c000455b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004562:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004565:	01 45 dc             	add    %eax,-0x24(%ebp)
c0004568:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000456b:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c000456e:	7f 0a                	jg     c000457a <do_rdwt+0x34a>
c0004570:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0004574:	0f 85 29 ff ff ff    	jne    c00044a3 <do_rdwt+0x273>
c000457a:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000457d:	8b 50 04             	mov    0x4(%eax),%edx
c0004580:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004583:	01 c2                	add    %eax,%edx
c0004585:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0004588:	89 50 04             	mov    %edx,0x4(%eax)
c000458b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000458e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004591:	01 c2                	add    %eax,%edx
c0004593:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004599:	39 c2                	cmp    %eax,%edx
c000459b:	7e 20                	jle    c00045bd <do_rdwt+0x38d>
c000459d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045a0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045a3:	01 d0                	add    %edx,%eax
c00045a5:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00045ab:	83 ec 0c             	sub    $0xc,%esp
c00045ae:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00045b4:	50                   	push   %eax
c00045b5:	e8 08 00 00 00       	call   c00045c2 <sync_inode>
c00045ba:	83 c4 10             	add    $0x10,%esp
c00045bd:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00045c0:	c9                   	leave  
c00045c1:	c3                   	ret    

c00045c2 <sync_inode>:
c00045c2:	55                   	push   %ebp
c00045c3:	89 e5                	mov    %esp,%ebp
c00045c5:	53                   	push   %ebx
c00045c6:	83 ec 34             	sub    $0x34,%esp
c00045c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00045d0:	eb 74                	jmp    c0004646 <sync_inode+0x84>
c00045d2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045d5:	89 d0                	mov    %edx,%eax
c00045d7:	c1 e0 02             	shl    $0x2,%eax
c00045da:	01 d0                	add    %edx,%eax
c00045dc:	c1 e0 03             	shl    $0x3,%eax
c00045df:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c00045e4:	8b 10                	mov    (%eax),%edx
c00045e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00045e9:	8b 40 10             	mov    0x10(%eax),%eax
c00045ec:	39 c2                	cmp    %eax,%edx
c00045ee:	75 52                	jne    c0004642 <sync_inode+0x80>
c00045f0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045f3:	89 d0                	mov    %edx,%eax
c00045f5:	c1 e0 02             	shl    $0x2,%eax
c00045f8:	01 d0                	add    %edx,%eax
c00045fa:	c1 e0 03             	shl    $0x3,%eax
c00045fd:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c0004603:	8b 45 08             	mov    0x8(%ebp),%eax
c0004606:	8b 08                	mov    (%eax),%ecx
c0004608:	89 0a                	mov    %ecx,(%edx)
c000460a:	8b 48 04             	mov    0x4(%eax),%ecx
c000460d:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004610:	8b 48 08             	mov    0x8(%eax),%ecx
c0004613:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004616:	8b 48 0c             	mov    0xc(%eax),%ecx
c0004619:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000461c:	8b 48 10             	mov    0x10(%eax),%ecx
c000461f:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004622:	8b 48 14             	mov    0x14(%eax),%ecx
c0004625:	89 4a 14             	mov    %ecx,0x14(%edx)
c0004628:	8b 48 18             	mov    0x18(%eax),%ecx
c000462b:	89 4a 18             	mov    %ecx,0x18(%edx)
c000462e:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0004631:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004634:	8b 48 20             	mov    0x20(%eax),%ecx
c0004637:	89 4a 20             	mov    %ecx,0x20(%edx)
c000463a:	8b 40 24             	mov    0x24(%eax),%eax
c000463d:	89 42 24             	mov    %eax,0x24(%edx)
c0004640:	eb 0a                	jmp    c000464c <sync_inode+0x8a>
c0004642:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004646:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c000464a:	7e 86                	jle    c00045d2 <sync_inode+0x10>
c000464c:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c0004653:	8b 45 08             	mov    0x8(%ebp),%eax
c0004656:	8b 40 10             	mov    0x10(%eax),%eax
c0004659:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000465c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000465f:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0004662:	b8 00 02 00 00       	mov    $0x200,%eax
c0004667:	99                   	cltd   
c0004668:	f7 7d f0             	idivl  -0x10(%ebp)
c000466b:	89 c3                	mov    %eax,%ebx
c000466d:	89 c8                	mov    %ecx,%eax
c000466f:	99                   	cltd   
c0004670:	f7 fb                	idiv   %ebx
c0004672:	89 55 e8             	mov    %edx,-0x18(%ebp)
c0004675:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004678:	8d 48 ff             	lea    -0x1(%eax),%ecx
c000467b:	b8 00 02 00 00       	mov    $0x200,%eax
c0004680:	99                   	cltd   
c0004681:	f7 7d f0             	idivl  -0x10(%ebp)
c0004684:	89 c3                	mov    %eax,%ebx
c0004686:	89 c8                	mov    %ecx,%eax
c0004688:	99                   	cltd   
c0004689:	f7 fb                	idiv   %ebx
c000468b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000468e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004691:	8b 40 20             	mov    0x20(%eax),%eax
c0004694:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0004697:	e8 0a 01 00 00       	call   c00047a6 <get_super_block>
c000469c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000469f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00046a2:	8b 40 04             	mov    0x4(%eax),%eax
c00046a5:	8d 50 02             	lea    0x2(%eax),%edx
c00046a8:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00046ab:	8b 40 08             	mov    0x8(%eax),%eax
c00046ae:	01 c2                	add    %eax,%edx
c00046b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00046b3:	01 d0                	add    %edx,%eax
c00046b5:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00046b8:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00046bd:	83 ec 0c             	sub    $0xc,%esp
c00046c0:	6a 07                	push   $0x7
c00046c2:	68 00 02 00 00       	push   $0x200
c00046c7:	50                   	push   %eax
c00046c8:	ff 75 e0             	pushl  -0x20(%ebp)
c00046cb:	ff 75 d8             	pushl  -0x28(%ebp)
c00046ce:	e8 0e e3 ff ff       	call   c00029e1 <rd_wt>
c00046d3:	83 c4 20             	add    $0x20,%esp
c00046d6:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00046db:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00046de:	83 ec 04             	sub    $0x4,%esp
c00046e1:	ff 75 f0             	pushl  -0x10(%ebp)
c00046e4:	ff 75 08             	pushl  0x8(%ebp)
c00046e7:	ff 75 d4             	pushl  -0x2c(%ebp)
c00046ea:	e8 15 6b 00 00       	call   c000b204 <Memcpy>
c00046ef:	83 c4 10             	add    $0x10,%esp
c00046f2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00046f7:	83 ec 0c             	sub    $0xc,%esp
c00046fa:	6a 0a                	push   $0xa
c00046fc:	68 00 02 00 00       	push   $0x200
c0004701:	50                   	push   %eax
c0004702:	ff 75 e0             	pushl  -0x20(%ebp)
c0004705:	ff 75 d8             	pushl  -0x28(%ebp)
c0004708:	e8 d4 e2 ff ff       	call   c00029e1 <rd_wt>
c000470d:	83 c4 20             	add    $0x20,%esp
c0004710:	90                   	nop
c0004711:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004714:	c9                   	leave  
c0004715:	c3                   	ret    

c0004716 <put_inode>:
c0004716:	55                   	push   %ebp
c0004717:	89 e5                	mov    %esp,%ebp
c0004719:	83 ec 08             	sub    $0x8,%esp
c000471c:	8b 45 08             	mov    0x8(%ebp),%eax
c000471f:	8b 40 24             	mov    0x24(%eax),%eax
c0004722:	85 c0                	test   %eax,%eax
c0004724:	7f 1c                	jg     c0004742 <put_inode+0x2c>
c0004726:	68 3c 05 00 00       	push   $0x53c
c000472b:	68 50 a8 00 c0       	push   $0xc000a850
c0004730:	68 50 a8 00 c0       	push   $0xc000a850
c0004735:	68 28 aa 00 c0       	push   $0xc000aa28
c000473a:	e8 af 49 00 00       	call   c00090ee <assertion_failure>
c000473f:	83 c4 10             	add    $0x10,%esp
c0004742:	8b 45 08             	mov    0x8(%ebp),%eax
c0004745:	8b 40 24             	mov    0x24(%eax),%eax
c0004748:	8d 50 ff             	lea    -0x1(%eax),%edx
c000474b:	8b 45 08             	mov    0x8(%ebp),%eax
c000474e:	89 50 24             	mov    %edx,0x24(%eax)
c0004751:	90                   	nop
c0004752:	c9                   	leave  
c0004753:	c3                   	ret    

c0004754 <do_close>:
c0004754:	55                   	push   %ebp
c0004755:	89 e5                	mov    %esp,%ebp
c0004757:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000475c:	8b 55 08             	mov    0x8(%ebp),%edx
c000475f:	83 c2 50             	add    $0x50,%edx
c0004762:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0004766:	8b 50 0c             	mov    0xc(%eax),%edx
c0004769:	83 ea 01             	sub    $0x1,%edx
c000476c:	89 50 0c             	mov    %edx,0xc(%eax)
c000476f:	8b 40 0c             	mov    0xc(%eax),%eax
c0004772:	85 c0                	test   %eax,%eax
c0004774:	75 16                	jne    c000478c <do_close+0x38>
c0004776:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c000477b:	8b 55 08             	mov    0x8(%ebp),%edx
c000477e:	83 c2 50             	add    $0x50,%edx
c0004781:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c0004785:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c000478c:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c0004791:	8b 55 08             	mov    0x8(%ebp),%edx
c0004794:	83 c2 50             	add    $0x50,%edx
c0004797:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
c000479e:	00 
c000479f:	b8 00 00 00 00       	mov    $0x0,%eax
c00047a4:	5d                   	pop    %ebp
c00047a5:	c3                   	ret    

c00047a6 <get_super_block>:
c00047a6:	55                   	push   %ebp
c00047a7:	89 e5                	mov    %esp,%ebp
c00047a9:	83 ec 08             	sub    $0x8,%esp
c00047ac:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00047b1:	83 ec 0c             	sub    $0xc,%esp
c00047b4:	6a 07                	push   $0x7
c00047b6:	68 00 02 00 00       	push   $0x200
c00047bb:	50                   	push   %eax
c00047bc:	6a 20                	push   $0x20
c00047be:	6a 01                	push   $0x1
c00047c0:	e8 1c e2 ff ff       	call   c00029e1 <rd_wt>
c00047c5:	83 c4 20             	add    $0x20,%esp
c00047c8:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00047ce:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c00047d3:	8b 0a                	mov    (%edx),%ecx
c00047d5:	89 08                	mov    %ecx,(%eax)
c00047d7:	8b 4a 04             	mov    0x4(%edx),%ecx
c00047da:	89 48 04             	mov    %ecx,0x4(%eax)
c00047dd:	8b 4a 08             	mov    0x8(%edx),%ecx
c00047e0:	89 48 08             	mov    %ecx,0x8(%eax)
c00047e3:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00047e6:	89 48 0c             	mov    %ecx,0xc(%eax)
c00047e9:	8b 4a 10             	mov    0x10(%edx),%ecx
c00047ec:	89 48 10             	mov    %ecx,0x10(%eax)
c00047ef:	8b 4a 14             	mov    0x14(%edx),%ecx
c00047f2:	89 48 14             	mov    %ecx,0x14(%eax)
c00047f5:	8b 4a 18             	mov    0x18(%edx),%ecx
c00047f8:	89 48 18             	mov    %ecx,0x18(%eax)
c00047fb:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00047fe:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004801:	8b 52 20             	mov    0x20(%edx),%edx
c0004804:	89 50 20             	mov    %edx,0x20(%eax)
c0004807:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c000480c:	c9                   	leave  
c000480d:	c3                   	ret    

c000480e <check>:
c000480e:	55                   	push   %ebp
c000480f:	89 e5                	mov    %esp,%ebp
c0004811:	83 ec 18             	sub    $0x18,%esp
c0004814:	c7 45 f4 00 33 08 c0 	movl   $0xc0083300,-0xc(%ebp)
c000481b:	eb 59                	jmp    c0004876 <check+0x68>
c000481d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004820:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0004826:	85 c0                	test   %eax,%eax
c0004828:	74 45                	je     c000486f <check+0x61>
c000482a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000482d:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0004833:	83 f8 01             	cmp    $0x1,%eax
c0004836:	74 37                	je     c000486f <check+0x61>
c0004838:	c7 05 40 f7 00 c0 02 	movl   $0x2802,0xc000f740
c000483f:	28 00 00 
c0004842:	83 ec 08             	sub    $0x8,%esp
c0004845:	6a 0a                	push   $0xa
c0004847:	68 37 aa 00 c0       	push   $0xc000aa37
c000484c:	e8 76 cd ff ff       	call   c00015c7 <disp_str_colour>
c0004851:	83 c4 10             	add    $0x10,%esp
c0004854:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004857:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000485e:	0f be c0             	movsbl %al,%eax
c0004861:	83 ec 0c             	sub    $0xc,%esp
c0004864:	50                   	push   %eax
c0004865:	e8 d4 30 00 00       	call   c000793e <disp_int>
c000486a:	83 c4 10             	add    $0x10,%esp
c000486d:	eb fe                	jmp    c000486d <check+0x5f>
c000486f:	81 45 f4 ac 02 00 00 	addl   $0x2ac,-0xc(%ebp)
c0004876:	b8 58 38 08 c0       	mov    $0xc0083858,%eax
c000487b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000487e:	72 9d                	jb     c000481d <check+0xf>
c0004880:	90                   	nop
c0004881:	c9                   	leave  
c0004882:	c3                   	ret    

c0004883 <schedule_process>:
c0004883:	55                   	push   %ebp
c0004884:	89 e5                	mov    %esp,%ebp
c0004886:	83 ec 28             	sub    $0x28,%esp
c0004889:	e8 fe cf ff ff       	call   c000188c <get_running_thread_pcb>
c000488e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004891:	83 ec 0c             	sub    $0xc,%esp
c0004894:	68 8c fd 00 c0       	push   $0xc000fd8c
c0004899:	e8 b5 5a 00 00       	call   c000a353 <isListEmpty>
c000489e:	83 c4 10             	add    $0x10,%esp
c00048a1:	3c 01                	cmp    $0x1,%al
c00048a3:	75 08                	jne    c00048ad <schedule_process+0x2a>
c00048a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00048a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00048ab:	eb 34                	jmp    c00048e1 <schedule_process+0x5e>
c00048ad:	83 ec 0c             	sub    $0xc,%esp
c00048b0:	68 8c fd 00 c0       	push   $0xc000fd8c
c00048b5:	e8 40 5b 00 00       	call   c000a3fa <popFromDoubleLinkList>
c00048ba:	83 c4 10             	add    $0x10,%esp
c00048bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00048c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00048c3:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00048c8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00048cb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00048cf:	74 10                	je     c00048e1 <schedule_process+0x5e>
c00048d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00048d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00048d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00048da:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00048e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00048e4:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00048eb:	84 c0                	test   %al,%al
c00048ed:	75 19                	jne    c0004908 <schedule_process+0x85>
c00048ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00048f2:	05 fc 00 00 00       	add    $0xfc,%eax
c00048f7:	83 ec 08             	sub    $0x8,%esp
c00048fa:	50                   	push   %eax
c00048fb:	68 8c fd 00 c0       	push   $0xc000fd8c
c0004900:	e8 b4 5a 00 00       	call   c000a3b9 <insertToDoubleLinkList>
c0004905:	83 c4 10             	add    $0x10,%esp
c0004908:	c7 45 e4 00 00 10 00 	movl   $0x100000,-0x1c(%ebp)
c000490f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004912:	8b 40 04             	mov    0x4(%eax),%eax
c0004915:	85 c0                	test   %eax,%eax
c0004917:	74 28                	je     c0004941 <schedule_process+0xbe>
c0004919:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000491c:	05 00 10 00 00       	add    $0x1000,%eax
c0004921:	83 ec 0c             	sub    $0xc,%esp
c0004924:	50                   	push   %eax
c0004925:	e8 53 cf ff ff       	call   c000187d <update_tss>
c000492a:	83 c4 10             	add    $0x10,%esp
c000492d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004930:	8b 40 04             	mov    0x4(%eax),%eax
c0004933:	83 ec 0c             	sub    $0xc,%esp
c0004936:	50                   	push   %eax
c0004937:	e8 34 cf ff ff       	call   c0001870 <update_cr3>
c000493c:	83 c4 10             	add    $0x10,%esp
c000493f:	eb 0f                	jmp    c0004950 <schedule_process+0xcd>
c0004941:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004944:	83 ec 0c             	sub    $0xc,%esp
c0004947:	50                   	push   %eax
c0004948:	e8 23 cf ff ff       	call   c0001870 <update_cr3>
c000494d:	83 c4 10             	add    $0x10,%esp
c0004950:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004953:	a3 60 fb 00 c0       	mov    %eax,0xc000fb60
c0004958:	83 ec 08             	sub    $0x8,%esp
c000495b:	ff 75 f4             	pushl  -0xc(%ebp)
c000495e:	ff 75 f0             	pushl  -0x10(%ebp)
c0004961:	e8 aa 59 00 00       	call   c000a310 <switch_to>
c0004966:	83 c4 10             	add    $0x10,%esp
c0004969:	90                   	nop
c000496a:	c9                   	leave  
c000496b:	c3                   	ret    

c000496c <clock_handler>:
c000496c:	55                   	push   %ebp
c000496d:	89 e5                	mov    %esp,%ebp
c000496f:	83 ec 08             	sub    $0x8,%esp
c0004972:	a1 a0 16 01 c0       	mov    0xc00116a0,%eax
c0004977:	85 c0                	test   %eax,%eax
c0004979:	74 0d                	je     c0004988 <clock_handler+0x1c>
c000497b:	83 ec 0c             	sub    $0xc,%esp
c000497e:	6a 02                	push   $0x2
c0004980:	e8 ec 51 00 00       	call   c0009b71 <inform_int>
c0004985:	83 c4 10             	add    $0x10,%esp
c0004988:	e8 f6 fe ff ff       	call   c0004883 <schedule_process>
c000498d:	90                   	nop
c000498e:	c9                   	leave  
c000498f:	c3                   	ret    

c0004990 <pid2proc>:
c0004990:	55                   	push   %ebp
c0004991:	89 e5                	mov    %esp,%ebp
c0004993:	83 ec 20             	sub    $0x20,%esp
c0004996:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c000499d:	a1 d4 1e 01 c0       	mov    0xc0011ed4,%eax
c00049a2:	8b 15 d8 1e 01 c0    	mov    0xc0011ed8,%edx
c00049a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00049ab:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00049ae:	a1 dc 1e 01 c0       	mov    0xc0011edc,%eax
c00049b3:	8b 15 e0 1e 01 c0    	mov    0xc0011ee0,%edx
c00049b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00049bc:	89 55 ec             	mov    %edx,-0x14(%ebp)
c00049bf:	a1 d8 1e 01 c0       	mov    0xc0011ed8,%eax
c00049c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00049c7:	eb 29                	jmp    c00049f2 <pid2proc+0x62>
c00049c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00049cc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c00049d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00049d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049d7:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c00049dd:	8b 45 08             	mov    0x8(%ebp),%eax
c00049e0:	39 c2                	cmp    %eax,%edx
c00049e2:	75 05                	jne    c00049e9 <pid2proc+0x59>
c00049e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049e7:	eb 15                	jmp    c00049fe <pid2proc+0x6e>
c00049e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00049ec:	8b 40 04             	mov    0x4(%eax),%eax
c00049ef:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00049f2:	81 7d f8 dc 1e 01 c0 	cmpl   $0xc0011edc,-0x8(%ebp)
c00049f9:	75 ce                	jne    c00049c9 <pid2proc+0x39>
c00049fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00049fe:	c9                   	leave  
c00049ff:	c3                   	ret    

c0004a00 <proc2pid>:
c0004a00:	55                   	push   %ebp
c0004a01:	89 e5                	mov    %esp,%ebp
c0004a03:	83 ec 10             	sub    $0x10,%esp
c0004a06:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a09:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c0004a0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a12:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a15:	c9                   	leave  
c0004a16:	c3                   	ret    

c0004a17 <InitDescriptor>:
c0004a17:	55                   	push   %ebp
c0004a18:	89 e5                	mov    %esp,%ebp
c0004a1a:	83 ec 04             	sub    $0x4,%esp
c0004a1d:	8b 45 14             	mov    0x14(%ebp),%eax
c0004a20:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004a24:	8b 45 10             	mov    0x10(%ebp),%eax
c0004a27:	89 c2                	mov    %eax,%edx
c0004a29:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a2c:	66 89 10             	mov    %dx,(%eax)
c0004a2f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a32:	89 c2                	mov    %eax,%edx
c0004a34:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a37:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004a3b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a3e:	c1 e8 10             	shr    $0x10,%eax
c0004a41:	89 c2                	mov    %eax,%edx
c0004a43:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a46:	88 50 04             	mov    %dl,0x4(%eax)
c0004a49:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004a4d:	89 c2                	mov    %eax,%edx
c0004a4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a52:	88 50 05             	mov    %dl,0x5(%eax)
c0004a55:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004a59:	66 c1 e8 08          	shr    $0x8,%ax
c0004a5d:	c1 e0 04             	shl    $0x4,%eax
c0004a60:	89 c2                	mov    %eax,%edx
c0004a62:	8b 45 10             	mov    0x10(%ebp),%eax
c0004a65:	c1 e8 10             	shr    $0x10,%eax
c0004a68:	83 e0 0f             	and    $0xf,%eax
c0004a6b:	09 c2                	or     %eax,%edx
c0004a6d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a70:	88 50 06             	mov    %dl,0x6(%eax)
c0004a73:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004a76:	c1 e8 18             	shr    $0x18,%eax
c0004a79:	89 c2                	mov    %eax,%edx
c0004a7b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a7e:	88 50 07             	mov    %dl,0x7(%eax)
c0004a81:	90                   	nop
c0004a82:	c9                   	leave  
c0004a83:	c3                   	ret    

c0004a84 <Seg2PhyAddr>:
c0004a84:	55                   	push   %ebp
c0004a85:	89 e5                	mov    %esp,%ebp
c0004a87:	83 ec 10             	sub    $0x10,%esp
c0004a8a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a8d:	c1 e8 03             	shr    $0x3,%eax
c0004a90:	8b 14 c5 64 f7 00 c0 	mov    -0x3fff089c(,%eax,8),%edx
c0004a97:	8b 04 c5 60 f7 00 c0 	mov    -0x3fff08a0(,%eax,8),%eax
c0004a9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004aa1:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004aa4:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004aa8:	0f b7 c0             	movzwl %ax,%eax
c0004aab:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004aaf:	0f b6 d2             	movzbl %dl,%edx
c0004ab2:	c1 e2 10             	shl    $0x10,%edx
c0004ab5:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004abb:	09 d0                	or     %edx,%eax
c0004abd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004ac0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ac3:	c9                   	leave  
c0004ac4:	c3                   	ret    

c0004ac5 <Seg2PhyAddrLDT>:
c0004ac5:	55                   	push   %ebp
c0004ac6:	89 e5                	mov    %esp,%ebp
c0004ac8:	83 ec 10             	sub    $0x10,%esp
c0004acb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ace:	c1 e8 03             	shr    $0x3,%eax
c0004ad1:	89 c2                	mov    %eax,%edx
c0004ad3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ad6:	83 c2 20             	add    $0x20,%edx
c0004ad9:	8d 54 d0 0e          	lea    0xe(%eax,%edx,8),%edx
c0004add:	8b 02                	mov    (%edx),%eax
c0004adf:	8b 52 04             	mov    0x4(%edx),%edx
c0004ae2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004ae5:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004ae8:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004aec:	0f b7 c0             	movzwl %ax,%eax
c0004aef:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004af3:	0f b6 d2             	movzbl %dl,%edx
c0004af6:	c1 e2 10             	shl    $0x10,%edx
c0004af9:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004aff:	09 d0                	or     %edx,%eax
c0004b01:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b04:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b07:	c9                   	leave  
c0004b08:	c3                   	ret    

c0004b09 <VirAddr2PhyAddr>:
c0004b09:	55                   	push   %ebp
c0004b0a:	89 e5                	mov    %esp,%ebp
c0004b0c:	83 ec 10             	sub    $0x10,%esp
c0004b0f:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004b12:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b15:	01 d0                	add    %edx,%eax
c0004b17:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b1a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b1d:	c9                   	leave  
c0004b1e:	c3                   	ret    

c0004b1f <v2l>:
c0004b1f:	55                   	push   %ebp
c0004b20:	89 e5                	mov    %esp,%ebp
c0004b22:	83 ec 18             	sub    $0x18,%esp
c0004b25:	83 ec 0c             	sub    $0xc,%esp
c0004b28:	ff 75 08             	pushl  0x8(%ebp)
c0004b2b:	e8 60 fe ff ff       	call   c0004990 <pid2proc>
c0004b30:	83 c4 10             	add    $0x10,%esp
c0004b33:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b36:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004b3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004b40:	83 ec 08             	sub    $0x8,%esp
c0004b43:	ff 75 f4             	pushl  -0xc(%ebp)
c0004b46:	50                   	push   %eax
c0004b47:	e8 79 ff ff ff       	call   c0004ac5 <Seg2PhyAddrLDT>
c0004b4c:	83 c4 10             	add    $0x10,%esp
c0004b4f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004b52:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004b55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b58:	01 d0                	add    %edx,%eax
c0004b5a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004b5d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004b60:	c9                   	leave  
c0004b61:	c3                   	ret    

c0004b62 <init_propt>:
c0004b62:	55                   	push   %ebp
c0004b63:	89 e5                	mov    %esp,%ebp
c0004b65:	83 ec 28             	sub    $0x28,%esp
c0004b68:	6a 0e                	push   $0xe
c0004b6a:	6a 08                	push   $0x8
c0004b6c:	68 6a 16 00 c0       	push   $0xc000166a
c0004b71:	6a 20                	push   $0x20
c0004b73:	e8 18 01 00 00       	call   c0004c90 <InitInterruptDesc>
c0004b78:	83 c4 10             	add    $0x10,%esp
c0004b7b:	6a 0e                	push   $0xe
c0004b7d:	6a 08                	push   $0x8
c0004b7f:	68 98 16 00 c0       	push   $0xc0001698
c0004b84:	6a 21                	push   $0x21
c0004b86:	e8 05 01 00 00       	call   c0004c90 <InitInterruptDesc>
c0004b8b:	83 c4 10             	add    $0x10,%esp
c0004b8e:	6a 0e                	push   $0xe
c0004b90:	6a 08                	push   $0x8
c0004b92:	68 dc 16 00 c0       	push   $0xc00016dc
c0004b97:	6a 2e                	push   $0x2e
c0004b99:	e8 f2 00 00 00       	call   c0004c90 <InitInterruptDesc>
c0004b9e:	83 c4 10             	add    $0x10,%esp
c0004ba1:	83 ec 04             	sub    $0x4,%esp
c0004ba4:	68 b0 0a 00 00       	push   $0xab0
c0004ba9:	6a 00                	push   $0x0
c0004bab:	68 00 33 08 c0       	push   $0xc0083300
c0004bb0:	e8 7d 66 00 00       	call   c000b232 <Memset>
c0004bb5:	83 c4 10             	add    $0x10,%esp
c0004bb8:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004bbf:	83 ec 04             	sub    $0x4,%esp
c0004bc2:	ff 75 f4             	pushl  -0xc(%ebp)
c0004bc5:	6a 00                	push   $0x0
c0004bc7:	68 20 16 01 c0       	push   $0xc0011620
c0004bcc:	e8 61 66 00 00       	call   c000b232 <Memset>
c0004bd1:	83 c4 10             	add    $0x10,%esp
c0004bd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004bd7:	a3 88 16 01 c0       	mov    %eax,0xc0011688
c0004bdc:	c7 05 28 16 01 c0 30 	movl   $0x30,0xc0011628
c0004be3:	00 00 00 
c0004be6:	83 ec 0c             	sub    $0xc,%esp
c0004be9:	6a 30                	push   $0x30
c0004beb:	e8 94 fe ff ff       	call   c0004a84 <Seg2PhyAddr>
c0004bf0:	83 c4 10             	add    $0x10,%esp
c0004bf3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004bf6:	c7 45 ec 20 16 01 c0 	movl   $0xc0011620,-0x14(%ebp)
c0004bfd:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004c04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004c07:	0f b7 d0             	movzwl %ax,%edx
c0004c0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c0d:	83 e8 01             	sub    $0x1,%eax
c0004c10:	89 c1                	mov    %eax,%ecx
c0004c12:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004c15:	52                   	push   %edx
c0004c16:	51                   	push   %ecx
c0004c17:	50                   	push   %eax
c0004c18:	68 a0 f7 00 c0       	push   $0xc000f7a0
c0004c1d:	e8 f5 fd ff ff       	call   c0004a17 <InitDescriptor>
c0004c22:	83 c4 10             	add    $0x10,%esp
c0004c25:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004c2c:	68 f2 00 00 00       	push   $0xf2
c0004c31:	68 ff ff 00 00       	push   $0xffff
c0004c36:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004c39:	68 98 f7 00 c0       	push   $0xc000f798
c0004c3e:	e8 d4 fd ff ff       	call   c0004a17 <InitDescriptor>
c0004c43:	83 c4 10             	add    $0x10,%esp
c0004c46:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004c4d:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004c54:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004c5b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004c5e:	0f b7 c0             	movzwl %ax,%eax
c0004c61:	50                   	push   %eax
c0004c62:	ff 75 d8             	pushl  -0x28(%ebp)
c0004c65:	6a 00                	push   $0x0
c0004c67:	68 a8 f7 00 c0       	push   $0xc000f7a8
c0004c6c:	e8 a6 fd ff ff       	call   c0004a17 <InitDescriptor>
c0004c71:	83 c4 10             	add    $0x10,%esp
c0004c74:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004c77:	0f b7 c0             	movzwl %ax,%eax
c0004c7a:	50                   	push   %eax
c0004c7b:	ff 75 d8             	pushl  -0x28(%ebp)
c0004c7e:	6a 00                	push   $0x0
c0004c80:	68 b0 f7 00 c0       	push   $0xc000f7b0
c0004c85:	e8 8d fd ff ff       	call   c0004a17 <InitDescriptor>
c0004c8a:	83 c4 10             	add    $0x10,%esp
c0004c8d:	90                   	nop
c0004c8e:	c9                   	leave  
c0004c8f:	c3                   	ret    

c0004c90 <InitInterruptDesc>:
c0004c90:	55                   	push   %ebp
c0004c91:	89 e5                	mov    %esp,%ebp
c0004c93:	83 ec 10             	sub    $0x10,%esp
c0004c96:	8b 45 08             	mov    0x8(%ebp),%eax
c0004c99:	c1 e0 03             	shl    $0x3,%eax
c0004c9c:	05 c0 16 01 c0       	add    $0xc00116c0,%eax
c0004ca1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004ca4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ca7:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004cab:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004cae:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004cb1:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004cb4:	89 c2                	mov    %eax,%edx
c0004cb6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004cb9:	66 89 10             	mov    %dx,(%eax)
c0004cbc:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004cbf:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004cc5:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004cc8:	c1 f8 10             	sar    $0x10,%eax
c0004ccb:	89 c2                	mov    %eax,%edx
c0004ccd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004cd0:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004cd4:	8b 45 10             	mov    0x10(%ebp),%eax
c0004cd7:	c1 e0 04             	shl    $0x4,%eax
c0004cda:	89 c2                	mov    %eax,%edx
c0004cdc:	8b 45 14             	mov    0x14(%ebp),%eax
c0004cdf:	09 d0                	or     %edx,%eax
c0004ce1:	89 c2                	mov    %eax,%edx
c0004ce3:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004ce6:	88 50 05             	mov    %dl,0x5(%eax)
c0004ce9:	90                   	nop
c0004cea:	c9                   	leave  
c0004ceb:	c3                   	ret    

c0004cec <ReloadGDT>:
c0004cec:	55                   	push   %ebp
c0004ced:	89 e5                	mov    %esp,%ebp
c0004cef:	83 ec 28             	sub    $0x28,%esp
c0004cf2:	b8 a8 16 01 c0       	mov    $0xc00116a8,%eax
c0004cf7:	0f b7 00             	movzwl (%eax),%eax
c0004cfa:	98                   	cwtl   
c0004cfb:	ba aa 16 01 c0       	mov    $0xc00116aa,%edx
c0004d00:	8b 12                	mov    (%edx),%edx
c0004d02:	83 ec 04             	sub    $0x4,%esp
c0004d05:	50                   	push   %eax
c0004d06:	52                   	push   %edx
c0004d07:	68 60 f7 00 c0       	push   $0xc000f760
c0004d0c:	e8 f3 64 00 00       	call   c000b204 <Memcpy>
c0004d11:	83 c4 10             	add    $0x10,%esp
c0004d14:	c7 45 f0 a8 16 01 c0 	movl   $0xc00116a8,-0x10(%ebp)
c0004d1b:	c7 45 ec aa 16 01 c0 	movl   $0xc00116aa,-0x14(%ebp)
c0004d22:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004d25:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004d2a:	ba 60 f7 00 c0       	mov    $0xc000f760,%edx
c0004d2f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004d32:	89 10                	mov    %edx,(%eax)
c0004d34:	c7 45 e8 28 f7 00 c0 	movl   $0xc000f728,-0x18(%ebp)
c0004d3b:	c7 45 e4 2a f7 00 c0 	movl   $0xc000f72a,-0x1c(%ebp)
c0004d42:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004d45:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004d4a:	ba c0 16 01 c0       	mov    $0xc00116c0,%edx
c0004d4f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004d52:	89 10                	mov    %edx,(%eax)
c0004d54:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004d5b:	eb 04                	jmp    c0004d61 <ReloadGDT+0x75>
c0004d5d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004d61:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004d68:	7e f3                	jle    c0004d5d <ReloadGDT+0x71>
c0004d6a:	e8 a7 30 00 00       	call   c0007e16 <init_internal_interrupt>
c0004d6f:	e8 ee fd ff ff       	call   c0004b62 <init_propt>
c0004d74:	90                   	nop
c0004d75:	c9                   	leave  
c0004d76:	c3                   	ret    

c0004d77 <select_console>:
c0004d77:	55                   	push   %ebp
c0004d78:	89 e5                	mov    %esp,%ebp
c0004d7a:	83 ec 18             	sub    $0x18,%esp
c0004d7d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d80:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004d83:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c0004d87:	77 27                	ja     c0004db0 <select_console+0x39>
c0004d89:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004d8d:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004d93:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0004d98:	a3 20 f7 00 c0       	mov    %eax,0xc000f720
c0004d9d:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0004da2:	83 ec 0c             	sub    $0xc,%esp
c0004da5:	50                   	push   %eax
c0004da6:	e8 08 00 00 00       	call   c0004db3 <flush>
c0004dab:	83 c4 10             	add    $0x10,%esp
c0004dae:	eb 01                	jmp    c0004db1 <select_console+0x3a>
c0004db0:	90                   	nop
c0004db1:	c9                   	leave  
c0004db2:	c3                   	ret    

c0004db3 <flush>:
c0004db3:	55                   	push   %ebp
c0004db4:	89 e5                	mov    %esp,%ebp
c0004db6:	83 ec 08             	sub    $0x8,%esp
c0004db9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dbc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004dc2:	8b 40 0c             	mov    0xc(%eax),%eax
c0004dc5:	83 ec 0c             	sub    $0xc,%esp
c0004dc8:	50                   	push   %eax
c0004dc9:	e8 1e 00 00 00       	call   c0004dec <set_cursor>
c0004dce:	83 c4 10             	add    $0x10,%esp
c0004dd1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004dd4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004dda:	8b 40 08             	mov    0x8(%eax),%eax
c0004ddd:	83 ec 0c             	sub    $0xc,%esp
c0004de0:	50                   	push   %eax
c0004de1:	e8 64 00 00 00       	call   c0004e4a <set_console_start_video_addr>
c0004de6:	83 c4 10             	add    $0x10,%esp
c0004de9:	90                   	nop
c0004dea:	c9                   	leave  
c0004deb:	c3                   	ret    

c0004dec <set_cursor>:
c0004dec:	55                   	push   %ebp
c0004ded:	89 e5                	mov    %esp,%ebp
c0004def:	83 ec 08             	sub    $0x8,%esp
c0004df2:	83 ec 08             	sub    $0x8,%esp
c0004df5:	6a 0e                	push   $0xe
c0004df7:	68 d4 03 00 00       	push   $0x3d4
c0004dfc:	e8 8d c9 ff ff       	call   c000178e <out_byte>
c0004e01:	83 c4 10             	add    $0x10,%esp
c0004e04:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e07:	c1 e8 08             	shr    $0x8,%eax
c0004e0a:	0f b7 c0             	movzwl %ax,%eax
c0004e0d:	83 ec 08             	sub    $0x8,%esp
c0004e10:	50                   	push   %eax
c0004e11:	68 d5 03 00 00       	push   $0x3d5
c0004e16:	e8 73 c9 ff ff       	call   c000178e <out_byte>
c0004e1b:	83 c4 10             	add    $0x10,%esp
c0004e1e:	83 ec 08             	sub    $0x8,%esp
c0004e21:	6a 0f                	push   $0xf
c0004e23:	68 d4 03 00 00       	push   $0x3d4
c0004e28:	e8 61 c9 ff ff       	call   c000178e <out_byte>
c0004e2d:	83 c4 10             	add    $0x10,%esp
c0004e30:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e33:	0f b7 c0             	movzwl %ax,%eax
c0004e36:	83 ec 08             	sub    $0x8,%esp
c0004e39:	50                   	push   %eax
c0004e3a:	68 d5 03 00 00       	push   $0x3d5
c0004e3f:	e8 4a c9 ff ff       	call   c000178e <out_byte>
c0004e44:	83 c4 10             	add    $0x10,%esp
c0004e47:	90                   	nop
c0004e48:	c9                   	leave  
c0004e49:	c3                   	ret    

c0004e4a <set_console_start_video_addr>:
c0004e4a:	55                   	push   %ebp
c0004e4b:	89 e5                	mov    %esp,%ebp
c0004e4d:	83 ec 08             	sub    $0x8,%esp
c0004e50:	83 ec 08             	sub    $0x8,%esp
c0004e53:	6a 0c                	push   $0xc
c0004e55:	68 d4 03 00 00       	push   $0x3d4
c0004e5a:	e8 2f c9 ff ff       	call   c000178e <out_byte>
c0004e5f:	83 c4 10             	add    $0x10,%esp
c0004e62:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e65:	c1 e8 08             	shr    $0x8,%eax
c0004e68:	0f b7 c0             	movzwl %ax,%eax
c0004e6b:	83 ec 08             	sub    $0x8,%esp
c0004e6e:	50                   	push   %eax
c0004e6f:	68 d5 03 00 00       	push   $0x3d5
c0004e74:	e8 15 c9 ff ff       	call   c000178e <out_byte>
c0004e79:	83 c4 10             	add    $0x10,%esp
c0004e7c:	83 ec 08             	sub    $0x8,%esp
c0004e7f:	6a 0d                	push   $0xd
c0004e81:	68 d4 03 00 00       	push   $0x3d4
c0004e86:	e8 03 c9 ff ff       	call   c000178e <out_byte>
c0004e8b:	83 c4 10             	add    $0x10,%esp
c0004e8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e91:	0f b7 c0             	movzwl %ax,%eax
c0004e94:	83 ec 08             	sub    $0x8,%esp
c0004e97:	50                   	push   %eax
c0004e98:	68 d5 03 00 00       	push   $0x3d5
c0004e9d:	e8 ec c8 ff ff       	call   c000178e <out_byte>
c0004ea2:	83 c4 10             	add    $0x10,%esp
c0004ea5:	90                   	nop
c0004ea6:	c9                   	leave  
c0004ea7:	c3                   	ret    

c0004ea8 <put_key>:
c0004ea8:	55                   	push   %ebp
c0004ea9:	89 e5                	mov    %esp,%ebp
c0004eab:	83 ec 04             	sub    $0x4,%esp
c0004eae:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004eb1:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004eb4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eb7:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004ebd:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004ec2:	77 4d                	ja     c0004f11 <put_key+0x69>
c0004ec4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ec7:	8b 00                	mov    (%eax),%eax
c0004ec9:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004ecd:	89 10                	mov    %edx,(%eax)
c0004ecf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ed2:	8b 00                	mov    (%eax),%eax
c0004ed4:	8d 50 04             	lea    0x4(%eax),%edx
c0004ed7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eda:	89 10                	mov    %edx,(%eax)
c0004edc:	8b 45 08             	mov    0x8(%ebp),%eax
c0004edf:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004ee5:	8d 50 01             	lea    0x1(%eax),%edx
c0004ee8:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eeb:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004ef1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef4:	8b 00                	mov    (%eax),%eax
c0004ef6:	8b 55 08             	mov    0x8(%ebp),%edx
c0004ef9:	83 c2 08             	add    $0x8,%edx
c0004efc:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004f02:	39 d0                	cmp    %edx,%eax
c0004f04:	75 0b                	jne    c0004f11 <put_key+0x69>
c0004f06:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f09:	8d 50 08             	lea    0x8(%eax),%edx
c0004f0c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f0f:	89 10                	mov    %edx,(%eax)
c0004f11:	90                   	nop
c0004f12:	c9                   	leave  
c0004f13:	c3                   	ret    

c0004f14 <scroll_up>:
c0004f14:	55                   	push   %ebp
c0004f15:	89 e5                	mov    %esp,%ebp
c0004f17:	83 ec 08             	sub    $0x8,%esp
c0004f1a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f1d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f23:	8b 40 08             	mov    0x8(%eax),%eax
c0004f26:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004f29:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f2c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f32:	8b 00                	mov    (%eax),%eax
c0004f34:	39 c2                	cmp    %eax,%edx
c0004f36:	76 1b                	jbe    c0004f53 <scroll_up+0x3f>
c0004f38:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f3b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f41:	8b 40 08             	mov    0x8(%eax),%eax
c0004f44:	83 e8 50             	sub    $0x50,%eax
c0004f47:	83 ec 0c             	sub    $0xc,%esp
c0004f4a:	50                   	push   %eax
c0004f4b:	e8 fa fe ff ff       	call   c0004e4a <set_console_start_video_addr>
c0004f50:	83 c4 10             	add    $0x10,%esp
c0004f53:	90                   	nop
c0004f54:	c9                   	leave  
c0004f55:	c3                   	ret    

c0004f56 <scroll_down>:
c0004f56:	55                   	push   %ebp
c0004f57:	89 e5                	mov    %esp,%ebp
c0004f59:	83 ec 08             	sub    $0x8,%esp
c0004f5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f5f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f65:	8b 40 08             	mov    0x8(%eax),%eax
c0004f68:	8d 48 50             	lea    0x50(%eax),%ecx
c0004f6b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f6e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f74:	8b 10                	mov    (%eax),%edx
c0004f76:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f79:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f7f:	8b 40 04             	mov    0x4(%eax),%eax
c0004f82:	01 d0                	add    %edx,%eax
c0004f84:	39 c1                	cmp    %eax,%ecx
c0004f86:	73 36                	jae    c0004fbe <scroll_down+0x68>
c0004f88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f8b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004f91:	8b 40 08             	mov    0x8(%eax),%eax
c0004f94:	83 c0 50             	add    $0x50,%eax
c0004f97:	83 ec 0c             	sub    $0xc,%esp
c0004f9a:	50                   	push   %eax
c0004f9b:	e8 aa fe ff ff       	call   c0004e4a <set_console_start_video_addr>
c0004fa0:	83 c4 10             	add    $0x10,%esp
c0004fa3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fac:	8b 50 08             	mov    0x8(%eax),%edx
c0004faf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fb8:	83 c2 50             	add    $0x50,%edx
c0004fbb:	89 50 08             	mov    %edx,0x8(%eax)
c0004fbe:	90                   	nop
c0004fbf:	c9                   	leave  
c0004fc0:	c3                   	ret    

c0004fc1 <out_char>:
c0004fc1:	55                   	push   %ebp
c0004fc2:	89 e5                	mov    %esp,%ebp
c0004fc4:	83 ec 28             	sub    $0x28,%esp
c0004fc7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004fca:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0004fcd:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fd0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fd6:	8b 40 0c             	mov    0xc(%eax),%eax
c0004fd9:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0004fde:	01 c0                	add    %eax,%eax
c0004fe0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004fe3:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0004fe7:	83 f8 08             	cmp    $0x8,%eax
c0004fea:	0f 84 8d 00 00 00    	je     c000507d <out_char+0xbc>
c0004ff0:	83 f8 0a             	cmp    $0xa,%eax
c0004ff3:	0f 85 c9 00 00 00    	jne    c00050c2 <out_char+0x101>
c0004ff9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ffc:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005002:	8b 50 0c             	mov    0xc(%eax),%edx
c0005005:	8b 45 08             	mov    0x8(%ebp),%eax
c0005008:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000500e:	8b 08                	mov    (%eax),%ecx
c0005010:	8b 45 08             	mov    0x8(%ebp),%eax
c0005013:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005019:	8b 40 04             	mov    0x4(%eax),%eax
c000501c:	01 c8                	add    %ecx,%eax
c000501e:	83 e8 50             	sub    $0x50,%eax
c0005021:	39 c2                	cmp    %eax,%edx
c0005023:	0f 83 f4 00 00 00    	jae    c000511d <out_char+0x15c>
c0005029:	8b 45 08             	mov    0x8(%ebp),%eax
c000502c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005032:	8b 08                	mov    (%eax),%ecx
c0005034:	8b 45 08             	mov    0x8(%ebp),%eax
c0005037:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000503d:	8b 50 0c             	mov    0xc(%eax),%edx
c0005040:	8b 45 08             	mov    0x8(%ebp),%eax
c0005043:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005049:	8b 00                	mov    (%eax),%eax
c000504b:	29 c2                	sub    %eax,%edx
c000504d:	89 d0                	mov    %edx,%eax
c000504f:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c0005054:	f7 e2                	mul    %edx
c0005056:	89 d0                	mov    %edx,%eax
c0005058:	c1 e8 06             	shr    $0x6,%eax
c000505b:	8d 50 01             	lea    0x1(%eax),%edx
c000505e:	89 d0                	mov    %edx,%eax
c0005060:	c1 e0 02             	shl    $0x2,%eax
c0005063:	01 d0                	add    %edx,%eax
c0005065:	c1 e0 04             	shl    $0x4,%eax
c0005068:	89 c2                	mov    %eax,%edx
c000506a:	8b 45 08             	mov    0x8(%ebp),%eax
c000506d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005073:	01 ca                	add    %ecx,%edx
c0005075:	89 50 0c             	mov    %edx,0xc(%eax)
c0005078:	e9 a0 00 00 00       	jmp    c000511d <out_char+0x15c>
c000507d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005080:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005086:	8b 50 0c             	mov    0xc(%eax),%edx
c0005089:	8b 45 08             	mov    0x8(%ebp),%eax
c000508c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005092:	8b 00                	mov    (%eax),%eax
c0005094:	39 c2                	cmp    %eax,%edx
c0005096:	0f 86 84 00 00 00    	jbe    c0005120 <out_char+0x15f>
c000509c:	8b 45 08             	mov    0x8(%ebp),%eax
c000509f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050a5:	8b 50 0c             	mov    0xc(%eax),%edx
c00050a8:	83 ea 01             	sub    $0x1,%edx
c00050ab:	89 50 0c             	mov    %edx,0xc(%eax)
c00050ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00050b1:	83 e8 02             	sub    $0x2,%eax
c00050b4:	c6 00 20             	movb   $0x20,(%eax)
c00050b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00050ba:	83 e8 01             	sub    $0x1,%eax
c00050bd:	c6 00 00             	movb   $0x0,(%eax)
c00050c0:	eb 5e                	jmp    c0005120 <out_char+0x15f>
c00050c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00050c5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050cb:	8b 40 0c             	mov    0xc(%eax),%eax
c00050ce:	8d 48 01             	lea    0x1(%eax),%ecx
c00050d1:	8b 45 08             	mov    0x8(%ebp),%eax
c00050d4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050da:	8b 10                	mov    (%eax),%edx
c00050dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00050df:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050e5:	8b 40 04             	mov    0x4(%eax),%eax
c00050e8:	01 d0                	add    %edx,%eax
c00050ea:	39 c1                	cmp    %eax,%ecx
c00050ec:	73 35                	jae    c0005123 <out_char+0x162>
c00050ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00050f1:	8d 50 01             	lea    0x1(%eax),%edx
c00050f4:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00050f7:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c00050fb:	88 10                	mov    %dl,(%eax)
c00050fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005100:	8d 50 01             	lea    0x1(%eax),%edx
c0005103:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0005106:	c6 00 0a             	movb   $0xa,(%eax)
c0005109:	8b 45 08             	mov    0x8(%ebp),%eax
c000510c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005112:	8b 50 0c             	mov    0xc(%eax),%edx
c0005115:	83 c2 01             	add    $0x1,%edx
c0005118:	89 50 0c             	mov    %edx,0xc(%eax)
c000511b:	eb 06                	jmp    c0005123 <out_char+0x162>
c000511d:	90                   	nop
c000511e:	eb 14                	jmp    c0005134 <out_char+0x173>
c0005120:	90                   	nop
c0005121:	eb 11                	jmp    c0005134 <out_char+0x173>
c0005123:	90                   	nop
c0005124:	eb 0e                	jmp    c0005134 <out_char+0x173>
c0005126:	83 ec 0c             	sub    $0xc,%esp
c0005129:	ff 75 08             	pushl  0x8(%ebp)
c000512c:	e8 25 fe ff ff       	call   c0004f56 <scroll_down>
c0005131:	83 c4 10             	add    $0x10,%esp
c0005134:	8b 45 08             	mov    0x8(%ebp),%eax
c0005137:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000513d:	8b 50 0c             	mov    0xc(%eax),%edx
c0005140:	8b 45 08             	mov    0x8(%ebp),%eax
c0005143:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005149:	8b 40 08             	mov    0x8(%eax),%eax
c000514c:	29 c2                	sub    %eax,%edx
c000514e:	89 d0                	mov    %edx,%eax
c0005150:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c0005155:	77 cf                	ja     c0005126 <out_char+0x165>
c0005157:	83 ec 0c             	sub    $0xc,%esp
c000515a:	ff 75 08             	pushl  0x8(%ebp)
c000515d:	e8 51 fc ff ff       	call   c0004db3 <flush>
c0005162:	83 c4 10             	add    $0x10,%esp
c0005165:	90                   	nop
c0005166:	c9                   	leave  
c0005167:	c3                   	ret    

c0005168 <tty_dev_read>:
c0005168:	55                   	push   %ebp
c0005169:	89 e5                	mov    %esp,%ebp
c000516b:	83 ec 08             	sub    $0x8,%esp
c000516e:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0005173:	39 45 08             	cmp    %eax,0x8(%ebp)
c0005176:	75 17                	jne    c000518f <tty_dev_read+0x27>
c0005178:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c000517d:	85 c0                	test   %eax,%eax
c000517f:	7e 0e                	jle    c000518f <tty_dev_read+0x27>
c0005181:	83 ec 0c             	sub    $0xc,%esp
c0005184:	ff 75 08             	pushl  0x8(%ebp)
c0005187:	e8 84 07 00 00       	call   c0005910 <keyboard_read>
c000518c:	83 c4 10             	add    $0x10,%esp
c000518f:	90                   	nop
c0005190:	c9                   	leave  
c0005191:	c3                   	ret    

c0005192 <tty_dev_write>:
c0005192:	55                   	push   %ebp
c0005193:	89 e5                	mov    %esp,%ebp
c0005195:	83 ec 28             	sub    $0x28,%esp
c0005198:	8b 45 08             	mov    0x8(%ebp),%eax
c000519b:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00051a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00051a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00051ab:	e9 88 01 00 00       	jmp    c0005338 <tty_dev_write+0x1a6>
c00051b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00051b3:	8b 40 04             	mov    0x4(%eax),%eax
c00051b6:	8b 00                	mov    (%eax),%eax
c00051b8:	88 45 e7             	mov    %al,-0x19(%ebp)
c00051bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00051be:	8b 40 04             	mov    0x4(%eax),%eax
c00051c1:	8d 50 04             	lea    0x4(%eax),%edx
c00051c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00051c7:	89 50 04             	mov    %edx,0x4(%eax)
c00051ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00051cd:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00051d3:	8d 50 ff             	lea    -0x1(%eax),%edx
c00051d6:	8b 45 08             	mov    0x8(%ebp),%eax
c00051d9:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c00051df:	8b 45 08             	mov    0x8(%ebp),%eax
c00051e2:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00051e8:	8d 50 01             	lea    0x1(%eax),%edx
c00051eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00051ee:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00051f4:	8b 45 08             	mov    0x8(%ebp),%eax
c00051f7:	8b 40 04             	mov    0x4(%eax),%eax
c00051fa:	8b 55 08             	mov    0x8(%ebp),%edx
c00051fd:	83 c2 08             	add    $0x8,%edx
c0005200:	81 c2 00 08 00 00    	add    $0x800,%edx
c0005206:	39 d0                	cmp    %edx,%eax
c0005208:	75 0c                	jne    c0005216 <tty_dev_write+0x84>
c000520a:	8b 45 08             	mov    0x8(%ebp),%eax
c000520d:	8d 50 08             	lea    0x8(%eax),%edx
c0005210:	8b 45 08             	mov    0x8(%ebp),%eax
c0005213:	89 50 04             	mov    %edx,0x4(%eax)
c0005216:	8b 45 08             	mov    0x8(%ebp),%eax
c0005219:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000521f:	85 c0                	test   %eax,%eax
c0005221:	0f 84 11 01 00 00    	je     c0005338 <tty_dev_write+0x1a6>
c0005227:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000522b:	3c 20                	cmp    $0x20,%al
c000522d:	76 08                	jbe    c0005237 <tty_dev_write+0xa5>
c000522f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005233:	3c 7e                	cmp    $0x7e,%al
c0005235:	76 10                	jbe    c0005247 <tty_dev_write+0xb5>
c0005237:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000523b:	3c 20                	cmp    $0x20,%al
c000523d:	74 08                	je     c0005247 <tty_dev_write+0xb5>
c000523f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005243:	84 c0                	test   %al,%al
c0005245:	75 58                	jne    c000529f <tty_dev_write+0x10d>
c0005247:	8b 45 08             	mov    0x8(%ebp),%eax
c000524a:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c0005250:	8b 45 08             	mov    0x8(%ebp),%eax
c0005253:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005259:	01 d0                	add    %edx,%eax
c000525b:	83 e8 01             	sub    $0x1,%eax
c000525e:	89 c2                	mov    %eax,%edx
c0005260:	83 ec 04             	sub    $0x4,%esp
c0005263:	6a 01                	push   $0x1
c0005265:	8d 45 e7             	lea    -0x19(%ebp),%eax
c0005268:	50                   	push   %eax
c0005269:	52                   	push   %edx
c000526a:	e8 95 5f 00 00       	call   c000b204 <Memcpy>
c000526f:	83 c4 10             	add    $0x10,%esp
c0005272:	8b 45 08             	mov    0x8(%ebp),%eax
c0005275:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000527b:	8d 50 ff             	lea    -0x1(%eax),%edx
c000527e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005281:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005287:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000528b:	0f b6 c0             	movzbl %al,%eax
c000528e:	83 ec 08             	sub    $0x8,%esp
c0005291:	50                   	push   %eax
c0005292:	ff 75 08             	pushl  0x8(%ebp)
c0005295:	e8 27 fd ff ff       	call   c0004fc1 <out_char>
c000529a:	83 c4 10             	add    $0x10,%esp
c000529d:	eb 7c                	jmp    c000531b <tty_dev_write+0x189>
c000529f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052a3:	3c 08                	cmp    $0x8,%al
c00052a5:	75 42                	jne    c00052e9 <tty_dev_write+0x157>
c00052a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00052aa:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00052b0:	8d 50 01             	lea    0x1(%eax),%edx
c00052b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00052b6:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00052bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00052bf:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00052c5:	8d 50 fe             	lea    -0x2(%eax),%edx
c00052c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00052cb:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00052d1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052d5:	0f b6 c0             	movzbl %al,%eax
c00052d8:	83 ec 08             	sub    $0x8,%esp
c00052db:	50                   	push   %eax
c00052dc:	ff 75 08             	pushl  0x8(%ebp)
c00052df:	e8 dd fc ff ff       	call   c0004fc1 <out_char>
c00052e4:	83 c4 10             	add    $0x10,%esp
c00052e7:	eb 32                	jmp    c000531b <tty_dev_write+0x189>
c00052e9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052ed:	3c 0a                	cmp    $0xa,%al
c00052ef:	75 2a                	jne    c000531b <tty_dev_write+0x189>
c00052f1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052f5:	0f b6 c0             	movzbl %al,%eax
c00052f8:	83 ec 08             	sub    $0x8,%esp
c00052fb:	50                   	push   %eax
c00052fc:	ff 75 08             	pushl  0x8(%ebp)
c00052ff:	e8 bd fc ff ff       	call   c0004fc1 <out_char>
c0005304:	83 c4 10             	add    $0x10,%esp
c0005307:	8b 45 08             	mov    0x8(%ebp),%eax
c000530a:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c0005311:	00 00 00 
c0005314:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000531b:	8b 45 08             	mov    0x8(%ebp),%eax
c000531e:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005324:	8b 45 08             	mov    0x8(%ebp),%eax
c0005327:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c000532d:	39 c2                	cmp    %eax,%edx
c000532f:	75 07                	jne    c0005338 <tty_dev_write+0x1a6>
c0005331:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005338:	8b 45 08             	mov    0x8(%ebp),%eax
c000533b:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005341:	85 c0                	test   %eax,%eax
c0005343:	0f 85 67 fe ff ff    	jne    c00051b0 <tty_dev_write+0x1e>
c0005349:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000534d:	74 5c                	je     c00053ab <tty_dev_write+0x219>
c000534f:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c0005356:	83 ec 0c             	sub    $0xc,%esp
c0005359:	ff 75 ec             	pushl  -0x14(%ebp)
c000535c:	e8 64 1a 00 00       	call   c0006dc5 <sys_malloc>
c0005361:	83 c4 10             	add    $0x10,%esp
c0005364:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005367:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000536a:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c0005371:	8b 45 08             	mov    0x8(%ebp),%eax
c0005374:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000537a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000537d:	89 50 50             	mov    %edx,0x50(%eax)
c0005380:	8b 45 08             	mov    0x8(%ebp),%eax
c0005383:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c0005389:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000538c:	89 50 58             	mov    %edx,0x58(%eax)
c000538f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005392:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005398:	83 ec 04             	sub    $0x4,%esp
c000539b:	50                   	push   %eax
c000539c:	ff 75 e8             	pushl  -0x18(%ebp)
c000539f:	6a 01                	push   $0x1
c00053a1:	e8 3c 45 00 00       	call   c00098e2 <send_rec>
c00053a6:	83 c4 10             	add    $0x10,%esp
c00053a9:	eb 01                	jmp    c00053ac <tty_dev_write+0x21a>
c00053ab:	90                   	nop
c00053ac:	c9                   	leave  
c00053ad:	c3                   	ret    

c00053ae <tty_do_read>:
c00053ae:	55                   	push   %ebp
c00053af:	89 e5                	mov    %esp,%ebp
c00053b1:	83 ec 08             	sub    $0x8,%esp
c00053b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b7:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00053be:	00 00 00 
c00053c1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053c4:	8b 50 58             	mov    0x58(%eax),%edx
c00053c7:	8b 45 08             	mov    0x8(%ebp),%eax
c00053ca:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c00053d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053d3:	8b 00                	mov    (%eax),%eax
c00053d5:	89 c2                	mov    %eax,%edx
c00053d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00053da:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c00053e0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053e3:	8b 50 50             	mov    0x50(%eax),%edx
c00053e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00053e9:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c00053ef:	8b 45 0c             	mov    0xc(%ebp),%eax
c00053f2:	8b 50 50             	mov    0x50(%eax),%edx
c00053f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00053f8:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c00053fe:	8b 45 08             	mov    0x8(%ebp),%eax
c0005401:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c0005407:	8b 45 0c             	mov    0xc(%ebp),%eax
c000540a:	8b 40 10             	mov    0x10(%eax),%eax
c000540d:	83 ec 08             	sub    $0x8,%esp
c0005410:	52                   	push   %edx
c0005411:	50                   	push   %eax
c0005412:	e8 6d 18 00 00       	call   c0006c84 <alloc_virtual_memory>
c0005417:	83 c4 10             	add    $0x10,%esp
c000541a:	89 c2                	mov    %eax,%edx
c000541c:	8b 45 08             	mov    0x8(%ebp),%eax
c000541f:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c0005425:	8b 45 08             	mov    0x8(%ebp),%eax
c0005428:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000542e:	83 f8 04             	cmp    $0x4,%eax
c0005431:	74 1c                	je     c000544f <tty_do_read+0xa1>
c0005433:	68 27 01 00 00       	push   $0x127
c0005438:	68 3d aa 00 c0       	push   $0xc000aa3d
c000543d:	68 3d aa 00 c0       	push   $0xc000aa3d
c0005442:	68 47 aa 00 c0       	push   $0xc000aa47
c0005447:	e8 a2 3c 00 00       	call   c00090ee <assertion_failure>
c000544c:	83 c4 10             	add    $0x10,%esp
c000544f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005452:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c0005459:	8b 45 08             	mov    0x8(%ebp),%eax
c000545c:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c0005462:	83 ec 04             	sub    $0x4,%esp
c0005465:	50                   	push   %eax
c0005466:	ff 75 0c             	pushl  0xc(%ebp)
c0005469:	6a 01                	push   $0x1
c000546b:	e8 72 44 00 00       	call   c00098e2 <send_rec>
c0005470:	83 c4 10             	add    $0x10,%esp
c0005473:	90                   	nop
c0005474:	c9                   	leave  
c0005475:	c3                   	ret    

c0005476 <tty_do_write>:
c0005476:	55                   	push   %ebp
c0005477:	89 e5                	mov    %esp,%ebp
c0005479:	53                   	push   %ebx
c000547a:	83 ec 24             	sub    $0x24,%esp
c000547d:	89 e0                	mov    %esp,%eax
c000547f:	89 c3                	mov    %eax,%ebx
c0005481:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c0005488:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000548b:	8d 50 ff             	lea    -0x1(%eax),%edx
c000548e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005491:	89 c2                	mov    %eax,%edx
c0005493:	b8 10 00 00 00       	mov    $0x10,%eax
c0005498:	83 e8 01             	sub    $0x1,%eax
c000549b:	01 d0                	add    %edx,%eax
c000549d:	b9 10 00 00 00       	mov    $0x10,%ecx
c00054a2:	ba 00 00 00 00       	mov    $0x0,%edx
c00054a7:	f7 f1                	div    %ecx
c00054a9:	6b c0 10             	imul   $0x10,%eax,%eax
c00054ac:	29 c4                	sub    %eax,%esp
c00054ae:	89 e0                	mov    %esp,%eax
c00054b0:	83 c0 00             	add    $0x0,%eax
c00054b3:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00054b6:	83 ec 04             	sub    $0x4,%esp
c00054b9:	ff 75 e8             	pushl  -0x18(%ebp)
c00054bc:	6a 00                	push   $0x0
c00054be:	ff 75 e0             	pushl  -0x20(%ebp)
c00054c1:	e8 6c 5d 00 00       	call   c000b232 <Memset>
c00054c6:	83 c4 10             	add    $0x10,%esp
c00054c9:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054cc:	8b 40 50             	mov    0x50(%eax),%eax
c00054cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00054d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00054d5:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c00054dc:	00 00 00 
c00054df:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00054e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054e5:	8b 40 10             	mov    0x10(%eax),%eax
c00054e8:	83 ec 08             	sub    $0x8,%esp
c00054eb:	52                   	push   %edx
c00054ec:	50                   	push   %eax
c00054ed:	e8 92 17 00 00       	call   c0006c84 <alloc_virtual_memory>
c00054f2:	83 c4 10             	add    $0x10,%esp
c00054f5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00054f8:	eb 7e                	jmp    c0005578 <tty_do_write+0x102>
c00054fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00054fd:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005500:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005504:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005507:	8b 45 08             	mov    0x8(%ebp),%eax
c000550a:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005510:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0005513:	01 d0                	add    %edx,%eax
c0005515:	83 ec 04             	sub    $0x4,%esp
c0005518:	ff 75 f0             	pushl  -0x10(%ebp)
c000551b:	50                   	push   %eax
c000551c:	ff 75 e0             	pushl  -0x20(%ebp)
c000551f:	e8 e0 5c 00 00       	call   c000b204 <Memcpy>
c0005524:	83 c4 10             	add    $0x10,%esp
c0005527:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000552a:	29 45 ec             	sub    %eax,-0x14(%ebp)
c000552d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005530:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005536:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005539:	01 c2                	add    %eax,%edx
c000553b:	8b 45 08             	mov    0x8(%ebp),%eax
c000553e:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005544:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000554b:	eb 25                	jmp    c0005572 <tty_do_write+0xfc>
c000554d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0005550:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005553:	01 d0                	add    %edx,%eax
c0005555:	0f b6 00             	movzbl (%eax),%eax
c0005558:	0f b6 c0             	movzbl %al,%eax
c000555b:	83 ec 08             	sub    $0x8,%esp
c000555e:	50                   	push   %eax
c000555f:	ff 75 08             	pushl  0x8(%ebp)
c0005562:	e8 5a fa ff ff       	call   c0004fc1 <out_char>
c0005567:	83 c4 10             	add    $0x10,%esp
c000556a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000556e:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005572:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005576:	75 d5                	jne    c000554d <tty_do_write+0xd7>
c0005578:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000557c:	0f 85 78 ff ff ff    	jne    c00054fa <tty_do_write+0x84>
c0005582:	83 ec 0c             	sub    $0xc,%esp
c0005585:	6a 6c                	push   $0x6c
c0005587:	e8 39 18 00 00       	call   c0006dc5 <sys_malloc>
c000558c:	83 c4 10             	add    $0x10,%esp
c000558f:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005592:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005595:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000559c:	8b 45 08             	mov    0x8(%ebp),%eax
c000559f:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00055a8:	89 50 48             	mov    %edx,0x48(%eax)
c00055ab:	8b 45 0c             	mov    0xc(%ebp),%eax
c00055ae:	8b 00                	mov    (%eax),%eax
c00055b0:	83 ec 04             	sub    $0x4,%esp
c00055b3:	50                   	push   %eax
c00055b4:	ff 75 d8             	pushl  -0x28(%ebp)
c00055b7:	6a 01                	push   $0x1
c00055b9:	e8 24 43 00 00       	call   c00098e2 <send_rec>
c00055be:	83 c4 10             	add    $0x10,%esp
c00055c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00055c4:	83 ec 08             	sub    $0x8,%esp
c00055c7:	6a 6c                	push   $0x6c
c00055c9:	50                   	push   %eax
c00055ca:	e8 d5 1a 00 00       	call   c00070a4 <sys_free>
c00055cf:	83 c4 10             	add    $0x10,%esp
c00055d2:	89 dc                	mov    %ebx,%esp
c00055d4:	90                   	nop
c00055d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00055d8:	c9                   	leave  
c00055d9:	c3                   	ret    

c00055da <init_screen>:
c00055da:	55                   	push   %ebp
c00055db:	89 e5                	mov    %esp,%ebp
c00055dd:	83 ec 10             	sub    $0x10,%esp
c00055e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00055e3:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c00055e8:	c1 f8 03             	sar    $0x3,%eax
c00055eb:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c00055f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00055f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00055f7:	c1 e0 04             	shl    $0x4,%eax
c00055fa:	8d 90 00 1f 01 c0    	lea    -0x3ffee100(%eax),%edx
c0005600:	8b 45 08             	mov    0x8(%ebp),%eax
c0005603:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c0005609:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c0005610:	8b 45 08             	mov    0x8(%ebp),%eax
c0005613:	8b 88 24 08 00 00    	mov    0x824(%eax),%ecx
c0005619:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000561c:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c0005621:	f7 e2                	mul    %edx
c0005623:	89 d0                	mov    %edx,%eax
c0005625:	d1 e8                	shr    %eax
c0005627:	89 41 04             	mov    %eax,0x4(%ecx)
c000562a:	8b 45 08             	mov    0x8(%ebp),%eax
c000562d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005633:	8b 50 04             	mov    0x4(%eax),%edx
c0005636:	8b 45 08             	mov    0x8(%ebp),%eax
c0005639:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000563f:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c0005643:	89 10                	mov    %edx,(%eax)
c0005645:	8b 45 08             	mov    0x8(%ebp),%eax
c0005648:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c000564e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005651:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005657:	8b 12                	mov    (%edx),%edx
c0005659:	89 50 08             	mov    %edx,0x8(%eax)
c000565c:	8b 55 08             	mov    0x8(%ebp),%edx
c000565f:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c0005665:	8b 40 08             	mov    0x8(%eax),%eax
c0005668:	89 42 0c             	mov    %eax,0xc(%edx)
c000566b:	90                   	nop
c000566c:	c9                   	leave  
c000566d:	c3                   	ret    

c000566e <init_tty>:
c000566e:	55                   	push   %ebp
c000566f:	89 e5                	mov    %esp,%ebp
c0005671:	83 ec 18             	sub    $0x18,%esp
c0005674:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c000567b:	e9 92 00 00 00       	jmp    c0005712 <init_tty+0xa4>
c0005680:	83 ec 04             	sub    $0x4,%esp
c0005683:	68 28 08 00 00       	push   $0x828
c0005688:	6a 00                	push   $0x0
c000568a:	ff 75 f4             	pushl  -0xc(%ebp)
c000568d:	e8 a0 5b 00 00       	call   c000b232 <Memset>
c0005692:	83 c4 10             	add    $0x10,%esp
c0005695:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005698:	8d 50 08             	lea    0x8(%eax),%edx
c000569b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000569e:	89 50 04             	mov    %edx,0x4(%eax)
c00056a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00056a4:	8b 50 04             	mov    0x4(%eax),%edx
c00056a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00056aa:	89 10                	mov    %edx,(%eax)
c00056ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00056af:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c00056b6:	00 00 00 
c00056b9:	83 ec 0c             	sub    $0xc,%esp
c00056bc:	ff 75 f4             	pushl  -0xc(%ebp)
c00056bf:	e8 16 ff ff ff       	call   c00055da <init_screen>
c00056c4:	83 c4 10             	add    $0x10,%esp
c00056c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00056ca:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c00056cf:	85 c0                	test   %eax,%eax
c00056d1:	7e 38                	jle    c000570b <init_tty+0x9d>
c00056d3:	83 ec 08             	sub    $0x8,%esp
c00056d6:	6a 23                	push   $0x23
c00056d8:	ff 75 f4             	pushl  -0xc(%ebp)
c00056db:	e8 e1 f8 ff ff       	call   c0004fc1 <out_char>
c00056e0:	83 c4 10             	add    $0x10,%esp
c00056e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00056e6:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c00056eb:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c00056f0:	c1 f8 03             	sar    $0x3,%eax
c00056f3:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c00056f9:	0f b6 c0             	movzbl %al,%eax
c00056fc:	83 ec 08             	sub    $0x8,%esp
c00056ff:	50                   	push   %eax
c0005700:	ff 75 f4             	pushl  -0xc(%ebp)
c0005703:	e8 b9 f8 ff ff       	call   c0004fc1 <out_char>
c0005708:	83 c4 10             	add    $0x10,%esp
c000570b:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005712:	b8 18 16 01 c0       	mov    $0xc0011618,%eax
c0005717:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000571a:	0f 82 60 ff ff ff    	jb     c0005680 <init_tty+0x12>
c0005720:	90                   	nop
c0005721:	c9                   	leave  
c0005722:	c3                   	ret    

c0005723 <TaskTTY>:
c0005723:	55                   	push   %ebp
c0005724:	89 e5                	mov    %esp,%ebp
c0005726:	83 ec 28             	sub    $0x28,%esp
c0005729:	e8 40 ff ff ff       	call   c000566e <init_tty>
c000572e:	83 ec 0c             	sub    $0xc,%esp
c0005731:	6a 00                	push   $0x0
c0005733:	e8 3f f6 ff ff       	call   c0004d77 <select_console>
c0005738:	83 c4 10             	add    $0x10,%esp
c000573b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005742:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0005749:	83 ec 0c             	sub    $0xc,%esp
c000574c:	6a 6c                	push   $0x6c
c000574e:	e8 72 16 00 00       	call   c0006dc5 <sys_malloc>
c0005753:	83 c4 10             	add    $0x10,%esp
c0005756:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005759:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c0005760:	eb 30                	jmp    c0005792 <TaskTTY+0x6f>
c0005762:	83 ec 0c             	sub    $0xc,%esp
c0005765:	ff 75 f4             	pushl  -0xc(%ebp)
c0005768:	e8 fb f9 ff ff       	call   c0005168 <tty_dev_read>
c000576d:	83 c4 10             	add    $0x10,%esp
c0005770:	83 ec 0c             	sub    $0xc,%esp
c0005773:	ff 75 f4             	pushl  -0xc(%ebp)
c0005776:	e8 17 fa ff ff       	call   c0005192 <tty_dev_write>
c000577b:	83 c4 10             	add    $0x10,%esp
c000577e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005781:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005787:	85 c0                	test   %eax,%eax
c0005789:	75 d7                	jne    c0005762 <TaskTTY+0x3f>
c000578b:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005792:	b8 18 16 01 c0       	mov    $0xc0011618,%eax
c0005797:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000579a:	72 c6                	jb     c0005762 <TaskTTY+0x3f>
c000579c:	83 ec 04             	sub    $0x4,%esp
c000579f:	6a 0e                	push   $0xe
c00057a1:	ff 75 e8             	pushl  -0x18(%ebp)
c00057a4:	6a 02                	push   $0x2
c00057a6:	e8 37 41 00 00       	call   c00098e2 <send_rec>
c00057ab:	83 c4 10             	add    $0x10,%esp
c00057ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00057b1:	8b 40 68             	mov    0x68(%eax),%eax
c00057b4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00057b7:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c00057be:	74 28                	je     c00057e8 <TaskTTY+0xc5>
c00057c0:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c00057c7:	7f 0b                	jg     c00057d4 <TaskTTY+0xb1>
c00057c9:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c00057d0:	74 4e                	je     c0005820 <TaskTTY+0xfd>
c00057d2:	eb 4d                	jmp    c0005821 <TaskTTY+0xfe>
c00057d4:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c00057db:	74 21                	je     c00057fe <TaskTTY+0xdb>
c00057dd:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c00057e4:	74 2e                	je     c0005814 <TaskTTY+0xf1>
c00057e6:	eb 39                	jmp    c0005821 <TaskTTY+0xfe>
c00057e8:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c00057ed:	83 ec 08             	sub    $0x8,%esp
c00057f0:	ff 75 e8             	pushl  -0x18(%ebp)
c00057f3:	50                   	push   %eax
c00057f4:	e8 b5 fb ff ff       	call   c00053ae <tty_do_read>
c00057f9:	83 c4 10             	add    $0x10,%esp
c00057fc:	eb 23                	jmp    c0005821 <TaskTTY+0xfe>
c00057fe:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0005803:	83 ec 08             	sub    $0x8,%esp
c0005806:	ff 75 e8             	pushl  -0x18(%ebp)
c0005809:	50                   	push   %eax
c000580a:	e8 67 fc ff ff       	call   c0005476 <tty_do_write>
c000580f:	83 c4 10             	add    $0x10,%esp
c0005812:	eb 0d                	jmp    c0005821 <TaskTTY+0xfe>
c0005814:	c7 05 a0 16 01 c0 00 	movl   $0x0,0xc00116a0
c000581b:	00 00 00 
c000581e:	eb 01                	jmp    c0005821 <TaskTTY+0xfe>
c0005820:	90                   	nop
c0005821:	e9 33 ff ff ff       	jmp    c0005759 <TaskTTY+0x36>

c0005826 <keyboard_handler>:
c0005826:	55                   	push   %ebp
c0005827:	89 e5                	mov    %esp,%ebp
c0005829:	83 ec 18             	sub    $0x18,%esp
c000582c:	c7 05 a0 16 01 c0 01 	movl   $0x1,0xc00116a0
c0005833:	00 00 00 
c0005836:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c000583d:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005842:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0005847:	7f 5e                	jg     c00058a7 <keyboard_handler+0x81>
c0005849:	e8 62 bf ff ff       	call   c00017b0 <disable_int>
c000584e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005851:	0f b7 c0             	movzwl %ax,%eax
c0005854:	83 ec 0c             	sub    $0xc,%esp
c0005857:	50                   	push   %eax
c0005858:	e8 25 bf ff ff       	call   c0001782 <in_byte>
c000585d:	83 c4 10             	add    $0x10,%esp
c0005860:	88 45 f3             	mov    %al,-0xd(%ebp)
c0005863:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0005868:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c000586c:	88 10                	mov    %dl,(%eax)
c000586e:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0005873:	83 c0 01             	add    $0x1,%eax
c0005876:	a3 80 fb 00 c0       	mov    %eax,0xc000fb80
c000587b:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005880:	83 c0 01             	add    $0x1,%eax
c0005883:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c0005888:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c000588d:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c0005892:	39 d0                	cmp    %edx,%eax
c0005894:	72 0a                	jb     c00058a0 <keyboard_handler+0x7a>
c0005896:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c000589d:	fb 00 c0 
c00058a0:	e8 0d bf ff ff       	call   c00017b2 <enable_int>
c00058a5:	eb 01                	jmp    c00058a8 <keyboard_handler+0x82>
c00058a7:	90                   	nop
c00058a8:	c9                   	leave  
c00058a9:	c3                   	ret    

c00058aa <read_from_keyboard_buf>:
c00058aa:	55                   	push   %ebp
c00058ab:	89 e5                	mov    %esp,%ebp
c00058ad:	83 ec 18             	sub    $0x18,%esp
c00058b0:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c00058b4:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00058b9:	85 c0                	test   %eax,%eax
c00058bb:	7f 06                	jg     c00058c3 <read_from_keyboard_buf+0x19>
c00058bd:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c00058c1:	eb 4b                	jmp    c000590e <read_from_keyboard_buf+0x64>
c00058c3:	e8 e8 be ff ff       	call   c00017b0 <disable_int>
c00058c8:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c00058cd:	0f b6 00             	movzbl (%eax),%eax
c00058d0:	88 45 f7             	mov    %al,-0x9(%ebp)
c00058d3:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c00058d8:	83 c0 01             	add    $0x1,%eax
c00058db:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c00058e0:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00058e5:	83 e8 01             	sub    $0x1,%eax
c00058e8:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c00058ed:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c00058f2:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c00058f7:	39 d0                	cmp    %edx,%eax
c00058f9:	72 0a                	jb     c0005905 <read_from_keyboard_buf+0x5b>
c00058fb:	c7 05 84 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb84
c0005902:	fb 00 c0 
c0005905:	e8 a8 be ff ff       	call   c00017b2 <enable_int>
c000590a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c000590e:	c9                   	leave  
c000590f:	c3                   	ret    

c0005910 <keyboard_read>:
c0005910:	55                   	push   %ebp
c0005911:	89 e5                	mov    %esp,%ebp
c0005913:	83 ec 28             	sub    $0x28,%esp
c0005916:	90                   	nop
c0005917:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c000591c:	85 c0                	test   %eax,%eax
c000591e:	7e f7                	jle    c0005917 <keyboard_read+0x7>
c0005920:	e8 85 ff ff ff       	call   c00058aa <read_from_keyboard_buf>
c0005925:	88 45 ea             	mov    %al,-0x16(%ebp)
c0005928:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000592f:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005933:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c0005937:	75 5a                	jne    c0005993 <keyboard_read+0x83>
c0005939:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c000593d:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c0005941:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c0005945:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c0005949:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c000594d:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c0005951:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c0005955:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000595c:	eb 20                	jmp    c000597e <keyboard_read+0x6e>
c000595e:	e8 47 ff ff ff       	call   c00058aa <read_from_keyboard_buf>
c0005963:	89 c1                	mov    %eax,%ecx
c0005965:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c0005968:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000596b:	01 d0                	add    %edx,%eax
c000596d:	0f b6 00             	movzbl (%eax),%eax
c0005970:	38 c1                	cmp    %al,%cl
c0005972:	74 06                	je     c000597a <keyboard_read+0x6a>
c0005974:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005978:	eb 0a                	jmp    c0005984 <keyboard_read+0x74>
c000597a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000597e:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005982:	7e da                	jle    c000595e <keyboard_read+0x4e>
c0005984:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005988:	74 68                	je     c00059f2 <keyboard_read+0xe2>
c000598a:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005991:	eb 5f                	jmp    c00059f2 <keyboard_read+0xe2>
c0005993:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005997:	75 59                	jne    c00059f2 <keyboard_read+0xe2>
c0005999:	e8 0c ff ff ff       	call   c00058aa <read_from_keyboard_buf>
c000599e:	3c 2a                	cmp    $0x2a,%al
c00059a0:	75 1d                	jne    c00059bf <keyboard_read+0xaf>
c00059a2:	e8 03 ff ff ff       	call   c00058aa <read_from_keyboard_buf>
c00059a7:	3c e0                	cmp    $0xe0,%al
c00059a9:	75 14                	jne    c00059bf <keyboard_read+0xaf>
c00059ab:	e8 fa fe ff ff       	call   c00058aa <read_from_keyboard_buf>
c00059b0:	3c 37                	cmp    $0x37,%al
c00059b2:	75 0b                	jne    c00059bf <keyboard_read+0xaf>
c00059b4:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c00059bb:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c00059bf:	e8 e6 fe ff ff       	call   c00058aa <read_from_keyboard_buf>
c00059c4:	3c b7                	cmp    $0xb7,%al
c00059c6:	75 1d                	jne    c00059e5 <keyboard_read+0xd5>
c00059c8:	e8 dd fe ff ff       	call   c00058aa <read_from_keyboard_buf>
c00059cd:	3c e0                	cmp    $0xe0,%al
c00059cf:	75 14                	jne    c00059e5 <keyboard_read+0xd5>
c00059d1:	e8 d4 fe ff ff       	call   c00058aa <read_from_keyboard_buf>
c00059d6:	3c aa                	cmp    $0xaa,%al
c00059d8:	75 0b                	jne    c00059e5 <keyboard_read+0xd5>
c00059da:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c00059e1:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00059e5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00059e9:	75 07                	jne    c00059f2 <keyboard_read+0xe2>
c00059eb:	c6 05 24 f7 00 c0 01 	movb   $0x1,0xc000f724
c00059f2:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c00059f9:	0f 84 8d 00 00 00    	je     c0005a8c <keyboard_read+0x17c>
c00059ff:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005a06:	0f 84 80 00 00 00    	je     c0005a8c <keyboard_read+0x17c>
c0005a0c:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005a10:	0f 94 c2             	sete   %dl
c0005a13:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005a17:	0f 94 c0             	sete   %al
c0005a1a:	09 d0                	or     %edx,%eax
c0005a1c:	84 c0                	test   %al,%al
c0005a1e:	74 07                	je     c0005a27 <keyboard_read+0x117>
c0005a20:	c6 05 a4 16 01 c0 01 	movb   $0x1,0xc00116a4
c0005a27:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005a2b:	f7 d0                	not    %eax
c0005a2d:	c0 e8 07             	shr    $0x7,%al
c0005a30:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005a33:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005a37:	74 53                	je     c0005a8c <keyboard_read+0x17c>
c0005a39:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005a3d:	74 4d                	je     c0005a8c <keyboard_read+0x17c>
c0005a3f:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005a43:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0005a4a:	3c 01                	cmp    $0x1,%al
c0005a4c:	75 04                	jne    c0005a52 <keyboard_read+0x142>
c0005a4e:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005a52:	0f b6 05 24 f7 00 c0 	movzbl 0xc000f724,%eax
c0005a59:	84 c0                	test   %al,%al
c0005a5b:	74 04                	je     c0005a61 <keyboard_read+0x151>
c0005a5d:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005a61:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005a65:	89 d0                	mov    %edx,%eax
c0005a67:	01 c0                	add    %eax,%eax
c0005a69:	01 c2                	add    %eax,%edx
c0005a6b:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005a6f:	01 d0                	add    %edx,%eax
c0005a71:	8b 04 85 00 e1 00 c0 	mov    -0x3fff1f00(,%eax,4),%eax
c0005a78:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005a7b:	83 ec 08             	sub    $0x8,%esp
c0005a7e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005a81:	ff 75 08             	pushl  0x8(%ebp)
c0005a84:	e8 1a 00 00 00       	call   c0005aa3 <in_process>
c0005a89:	83 c4 10             	add    $0x10,%esp
c0005a8c:	90                   	nop
c0005a8d:	c9                   	leave  
c0005a8e:	c3                   	ret    

c0005a8f <init_keyboard_handler>:
c0005a8f:	55                   	push   %ebp
c0005a90:	89 e5                	mov    %esp,%ebp
c0005a92:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005a99:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005aa0:	90                   	nop
c0005aa1:	5d                   	pop    %ebp
c0005aa2:	c3                   	ret    

c0005aa3 <in_process>:
c0005aa3:	55                   	push   %ebp
c0005aa4:	89 e5                	mov    %esp,%ebp
c0005aa6:	83 ec 18             	sub    $0x18,%esp
c0005aa9:	83 ec 04             	sub    $0x4,%esp
c0005aac:	6a 02                	push   $0x2
c0005aae:	6a 00                	push   $0x0
c0005ab0:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005ab3:	50                   	push   %eax
c0005ab4:	e8 79 57 00 00       	call   c000b232 <Memset>
c0005ab9:	83 c4 10             	add    $0x10,%esp
c0005abc:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005abf:	25 00 01 00 00       	and    $0x100,%eax
c0005ac4:	85 c0                	test   %eax,%eax
c0005ac6:	75 28                	jne    c0005af0 <in_process+0x4d>
c0005ac8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005acb:	0f b6 c0             	movzbl %al,%eax
c0005ace:	83 ec 08             	sub    $0x8,%esp
c0005ad1:	50                   	push   %eax
c0005ad2:	ff 75 08             	pushl  0x8(%ebp)
c0005ad5:	e8 ce f3 ff ff       	call   c0004ea8 <put_key>
c0005ada:	83 c4 10             	add    $0x10,%esp
c0005add:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005ae4:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005aeb:	e9 42 01 00 00       	jmp    c0005c32 <in_process+0x18f>
c0005af0:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0005af7:	84 c0                	test   %al,%al
c0005af9:	0f 84 a9 00 00 00    	je     c0005ba8 <in_process+0x105>
c0005aff:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005b03:	0f 84 9f 00 00 00    	je     c0005ba8 <in_process+0x105>
c0005b09:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005b0d:	0f 84 95 00 00 00    	je     c0005ba8 <in_process+0x105>
c0005b13:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005b1a:	74 64                	je     c0005b80 <in_process+0xdd>
c0005b1c:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005b23:	77 0b                	ja     c0005b30 <in_process+0x8d>
c0005b25:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005b2c:	74 64                	je     c0005b92 <in_process+0xef>
c0005b2e:	eb 73                	jmp    c0005ba3 <in_process+0x100>
c0005b30:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005b37:	74 0b                	je     c0005b44 <in_process+0xa1>
c0005b39:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005b40:	74 20                	je     c0005b62 <in_process+0xbf>
c0005b42:	eb 5f                	jmp    c0005ba3 <in_process+0x100>
c0005b44:	83 ec 0c             	sub    $0xc,%esp
c0005b47:	ff 75 08             	pushl  0x8(%ebp)
c0005b4a:	e8 c5 f3 ff ff       	call   c0004f14 <scroll_up>
c0005b4f:	83 c4 10             	add    $0x10,%esp
c0005b52:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005b59:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005b60:	eb 41                	jmp    c0005ba3 <in_process+0x100>
c0005b62:	83 ec 0c             	sub    $0xc,%esp
c0005b65:	ff 75 08             	pushl  0x8(%ebp)
c0005b68:	e8 e9 f3 ff ff       	call   c0004f56 <scroll_down>
c0005b6d:	83 c4 10             	add    $0x10,%esp
c0005b70:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005b77:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005b7e:	eb 23                	jmp    c0005ba3 <in_process+0x100>
c0005b80:	83 ec 08             	sub    $0x8,%esp
c0005b83:	6a 0a                	push   $0xa
c0005b85:	ff 75 08             	pushl  0x8(%ebp)
c0005b88:	e8 34 f4 ff ff       	call   c0004fc1 <out_char>
c0005b8d:	83 c4 10             	add    $0x10,%esp
c0005b90:	eb 11                	jmp    c0005ba3 <in_process+0x100>
c0005b92:	83 ec 08             	sub    $0x8,%esp
c0005b95:	6a 08                	push   $0x8
c0005b97:	ff 75 08             	pushl  0x8(%ebp)
c0005b9a:	e8 22 f4 ff ff       	call   c0004fc1 <out_char>
c0005b9f:	83 c4 10             	add    $0x10,%esp
c0005ba2:	90                   	nop
c0005ba3:	e9 8a 00 00 00       	jmp    c0005c32 <in_process+0x18f>
c0005ba8:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005baf:	74 55                	je     c0005c06 <in_process+0x163>
c0005bb1:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005bb8:	77 14                	ja     c0005bce <in_process+0x12b>
c0005bba:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005bc1:	74 31                	je     c0005bf4 <in_process+0x151>
c0005bc3:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005bca:	74 16                	je     c0005be2 <in_process+0x13f>
c0005bcc:	eb 64                	jmp    c0005c32 <in_process+0x18f>
c0005bce:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005bd5:	74 3e                	je     c0005c15 <in_process+0x172>
c0005bd7:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005bde:	74 44                	je     c0005c24 <in_process+0x181>
c0005be0:	eb 50                	jmp    c0005c32 <in_process+0x18f>
c0005be2:	83 ec 08             	sub    $0x8,%esp
c0005be5:	6a 0a                	push   $0xa
c0005be7:	ff 75 08             	pushl  0x8(%ebp)
c0005bea:	e8 b9 f2 ff ff       	call   c0004ea8 <put_key>
c0005bef:	83 c4 10             	add    $0x10,%esp
c0005bf2:	eb 3e                	jmp    c0005c32 <in_process+0x18f>
c0005bf4:	83 ec 08             	sub    $0x8,%esp
c0005bf7:	6a 08                	push   $0x8
c0005bf9:	ff 75 08             	pushl  0x8(%ebp)
c0005bfc:	e8 a7 f2 ff ff       	call   c0004ea8 <put_key>
c0005c01:	83 c4 10             	add    $0x10,%esp
c0005c04:	eb 2c                	jmp    c0005c32 <in_process+0x18f>
c0005c06:	83 ec 0c             	sub    $0xc,%esp
c0005c09:	6a 00                	push   $0x0
c0005c0b:	e8 67 f1 ff ff       	call   c0004d77 <select_console>
c0005c10:	83 c4 10             	add    $0x10,%esp
c0005c13:	eb 1d                	jmp    c0005c32 <in_process+0x18f>
c0005c15:	83 ec 0c             	sub    $0xc,%esp
c0005c18:	6a 01                	push   $0x1
c0005c1a:	e8 58 f1 ff ff       	call   c0004d77 <select_console>
c0005c1f:	83 c4 10             	add    $0x10,%esp
c0005c22:	eb 0e                	jmp    c0005c32 <in_process+0x18f>
c0005c24:	83 ec 0c             	sub    $0xc,%esp
c0005c27:	6a 02                	push   $0x2
c0005c29:	e8 49 f1 ff ff       	call   c0004d77 <select_console>
c0005c2e:	83 c4 10             	add    $0x10,%esp
c0005c31:	90                   	nop
c0005c32:	90                   	nop
c0005c33:	c9                   	leave  
c0005c34:	c3                   	ret    

c0005c35 <open>:
c0005c35:	55                   	push   %ebp
c0005c36:	89 e5                	mov    %esp,%ebp
c0005c38:	83 ec 18             	sub    $0x18,%esp
c0005c3b:	83 ec 0c             	sub    $0xc,%esp
c0005c3e:	6a 6c                	push   $0x6c
c0005c40:	e8 80 11 00 00       	call   c0006dc5 <sys_malloc>
c0005c45:	83 c4 10             	add    $0x10,%esp
c0005c48:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005c4b:	83 ec 04             	sub    $0x4,%esp
c0005c4e:	6a 6c                	push   $0x6c
c0005c50:	6a 00                	push   $0x0
c0005c52:	ff 75 f4             	pushl  -0xc(%ebp)
c0005c55:	e8 d8 55 00 00       	call   c000b232 <Memset>
c0005c5a:	83 c4 10             	add    $0x10,%esp
c0005c5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c60:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0005c67:	83 ec 0c             	sub    $0xc,%esp
c0005c6a:	ff 75 08             	pushl  0x8(%ebp)
c0005c6d:	e8 7f 10 00 00       	call   c0006cf1 <get_physical_address>
c0005c72:	83 c4 10             	add    $0x10,%esp
c0005c75:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005c78:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c7b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005c7e:	89 50 34             	mov    %edx,0x34(%eax)
c0005c81:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005c84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c87:	89 50 64             	mov    %edx,0x64(%eax)
c0005c8a:	83 ec 0c             	sub    $0xc,%esp
c0005c8d:	ff 75 08             	pushl  0x8(%ebp)
c0005c90:	e8 d6 55 00 00       	call   c000b26b <Strlen>
c0005c95:	83 c4 10             	add    $0x10,%esp
c0005c98:	89 c2                	mov    %eax,%edx
c0005c9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005c9d:	89 50 30             	mov    %edx,0x30(%eax)
c0005ca0:	83 ec 04             	sub    $0x4,%esp
c0005ca3:	6a 04                	push   $0x4
c0005ca5:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ca8:	6a 03                	push   $0x3
c0005caa:	e8 33 3c 00 00       	call   c00098e2 <send_rec>
c0005caf:	83 c4 10             	add    $0x10,%esp
c0005cb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005cb5:	8b 40 40             	mov    0x40(%eax),%eax
c0005cb8:	c9                   	leave  
c0005cb9:	c3                   	ret    

c0005cba <read>:
c0005cba:	55                   	push   %ebp
c0005cbb:	89 e5                	mov    %esp,%ebp
c0005cbd:	83 ec 18             	sub    $0x18,%esp
c0005cc0:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005cc7:	83 ec 0c             	sub    $0xc,%esp
c0005cca:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ccd:	e8 f3 10 00 00       	call   c0006dc5 <sys_malloc>
c0005cd2:	83 c4 10             	add    $0x10,%esp
c0005cd5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005cd8:	83 ec 0c             	sub    $0xc,%esp
c0005cdb:	ff 75 0c             	pushl  0xc(%ebp)
c0005cde:	e8 0e 10 00 00       	call   c0006cf1 <get_physical_address>
c0005ce3:	83 c4 10             	add    $0x10,%esp
c0005ce6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005ce9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005cec:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0005cf3:	8b 55 08             	mov    0x8(%ebp),%edx
c0005cf6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005cf9:	89 50 40             	mov    %edx,0x40(%eax)
c0005cfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005cff:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005d02:	89 50 10             	mov    %edx,0x10(%eax)
c0005d05:	8b 55 10             	mov    0x10(%ebp),%edx
c0005d08:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d0b:	89 50 50             	mov    %edx,0x50(%eax)
c0005d0e:	83 ec 04             	sub    $0x4,%esp
c0005d11:	6a 04                	push   $0x4
c0005d13:	ff 75 f0             	pushl  -0x10(%ebp)
c0005d16:	6a 03                	push   $0x3
c0005d18:	e8 c5 3b 00 00       	call   c00098e2 <send_rec>
c0005d1d:	83 c4 10             	add    $0x10,%esp
c0005d20:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d23:	8b 40 50             	mov    0x50(%eax),%eax
c0005d26:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005d29:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005d2c:	c9                   	leave  
c0005d2d:	c3                   	ret    

c0005d2e <write>:
c0005d2e:	55                   	push   %ebp
c0005d2f:	89 e5                	mov    %esp,%ebp
c0005d31:	83 ec 18             	sub    $0x18,%esp
c0005d34:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005d3b:	83 ec 0c             	sub    $0xc,%esp
c0005d3e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d41:	e8 7f 10 00 00       	call   c0006dc5 <sys_malloc>
c0005d46:	83 c4 10             	add    $0x10,%esp
c0005d49:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005d4c:	83 ec 0c             	sub    $0xc,%esp
c0005d4f:	ff 75 0c             	pushl  0xc(%ebp)
c0005d52:	e8 9a 0f 00 00       	call   c0006cf1 <get_physical_address>
c0005d57:	83 c4 10             	add    $0x10,%esp
c0005d5a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005d5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d60:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0005d67:	8b 55 08             	mov    0x8(%ebp),%edx
c0005d6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d6d:	89 50 40             	mov    %edx,0x40(%eax)
c0005d70:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d73:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005d76:	89 50 10             	mov    %edx,0x10(%eax)
c0005d79:	8b 55 10             	mov    0x10(%ebp),%edx
c0005d7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d7f:	89 50 50             	mov    %edx,0x50(%eax)
c0005d82:	83 ec 04             	sub    $0x4,%esp
c0005d85:	6a 04                	push   $0x4
c0005d87:	ff 75 f0             	pushl  -0x10(%ebp)
c0005d8a:	6a 03                	push   $0x3
c0005d8c:	e8 51 3b 00 00       	call   c00098e2 <send_rec>
c0005d91:	83 c4 10             	add    $0x10,%esp
c0005d94:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d97:	8b 40 50             	mov    0x50(%eax),%eax
c0005d9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005d9d:	83 ec 08             	sub    $0x8,%esp
c0005da0:	ff 75 f4             	pushl  -0xc(%ebp)
c0005da3:	ff 75 f0             	pushl  -0x10(%ebp)
c0005da6:	e8 f9 12 00 00       	call   c00070a4 <sys_free>
c0005dab:	83 c4 10             	add    $0x10,%esp
c0005dae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005db1:	c9                   	leave  
c0005db2:	c3                   	ret    

c0005db3 <close>:
c0005db3:	55                   	push   %ebp
c0005db4:	89 e5                	mov    %esp,%ebp
c0005db6:	83 ec 78             	sub    $0x78,%esp
c0005db9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005dc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0005dc3:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005dc6:	83 ec 04             	sub    $0x4,%esp
c0005dc9:	6a 04                	push   $0x4
c0005dcb:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005dce:	50                   	push   %eax
c0005dcf:	6a 03                	push   $0x3
c0005dd1:	e8 0c 3b 00 00       	call   c00098e2 <send_rec>
c0005dd6:	83 c4 10             	add    $0x10,%esp
c0005dd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005ddc:	83 f8 65             	cmp    $0x65,%eax
c0005ddf:	74 19                	je     c0005dfa <close+0x47>
c0005de1:	6a 13                	push   $0x13
c0005de3:	68 5f aa 00 c0       	push   $0xc000aa5f
c0005de8:	68 5f aa 00 c0       	push   $0xc000aa5f
c0005ded:	68 6b aa 00 c0       	push   $0xc000aa6b
c0005df2:	e8 f7 32 00 00       	call   c00090ee <assertion_failure>
c0005df7:	83 c4 10             	add    $0x10,%esp
c0005dfa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005dfd:	c9                   	leave  
c0005dfe:	c3                   	ret    

c0005dff <wait>:
c0005dff:	55                   	push   %ebp
c0005e00:	89 e5                	mov    %esp,%ebp
c0005e02:	83 ec 78             	sub    $0x78,%esp
c0005e05:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005e0c:	83 ec 04             	sub    $0x4,%esp
c0005e0f:	6a 05                	push   $0x5
c0005e11:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e14:	50                   	push   %eax
c0005e15:	6a 03                	push   $0x3
c0005e17:	e8 c6 3a 00 00       	call   c00098e2 <send_rec>
c0005e1c:	83 c4 10             	add    $0x10,%esp
c0005e1f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005e22:	89 c2                	mov    %eax,%edx
c0005e24:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e27:	89 10                	mov    %edx,(%eax)
c0005e29:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005e2c:	83 f8 1d             	cmp    $0x1d,%eax
c0005e2f:	74 05                	je     c0005e36 <wait+0x37>
c0005e31:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005e34:	eb 05                	jmp    c0005e3b <wait+0x3c>
c0005e36:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005e3b:	c9                   	leave  
c0005e3c:	c3                   	ret    

c0005e3d <exit>:
c0005e3d:	55                   	push   %ebp
c0005e3e:	89 e5                	mov    %esp,%ebp
c0005e40:	83 ec 78             	sub    $0x78,%esp
c0005e43:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005e4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e4d:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005e50:	83 ec 04             	sub    $0x4,%esp
c0005e53:	6a 05                	push   $0x5
c0005e55:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e58:	50                   	push   %eax
c0005e59:	6a 03                	push   $0x3
c0005e5b:	e8 82 3a 00 00       	call   c00098e2 <send_rec>
c0005e60:	83 c4 10             	add    $0x10,%esp
c0005e63:	90                   	nop
c0005e64:	c9                   	leave  
c0005e65:	c3                   	ret    

c0005e66 <fork>:
c0005e66:	55                   	push   %ebp
c0005e67:	89 e5                	mov    %esp,%ebp
c0005e69:	83 ec 78             	sub    $0x78,%esp
c0005e6c:	83 ec 04             	sub    $0x4,%esp
c0005e6f:	6a 6c                	push   $0x6c
c0005e71:	6a 00                	push   $0x0
c0005e73:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e76:	50                   	push   %eax
c0005e77:	e8 b6 53 00 00       	call   c000b232 <Memset>
c0005e7c:	83 c4 10             	add    $0x10,%esp
c0005e7f:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005e86:	83 ec 04             	sub    $0x4,%esp
c0005e89:	6a 05                	push   $0x5
c0005e8b:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e8e:	50                   	push   %eax
c0005e8f:	6a 03                	push   $0x3
c0005e91:	e8 4c 3a 00 00       	call   c00098e2 <send_rec>
c0005e96:	83 c4 10             	add    $0x10,%esp
c0005e99:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005ea0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005ea3:	85 c0                	test   %eax,%eax
c0005ea5:	74 19                	je     c0005ec0 <fork+0x5a>
c0005ea7:	6a 14                	push   $0x14
c0005ea9:	68 83 aa 00 c0       	push   $0xc000aa83
c0005eae:	68 83 aa 00 c0       	push   $0xc000aa83
c0005eb3:	68 8e aa 00 c0       	push   $0xc000aa8e
c0005eb8:	e8 31 32 00 00       	call   c00090ee <assertion_failure>
c0005ebd:	83 c4 10             	add    $0x10,%esp
c0005ec0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ec3:	c9                   	leave  
c0005ec4:	c3                   	ret    

c0005ec5 <getpid>:
c0005ec5:	55                   	push   %ebp
c0005ec6:	89 e5                	mov    %esp,%ebp
c0005ec8:	83 ec 78             	sub    $0x78,%esp
c0005ecb:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005ed2:	83 ec 04             	sub    $0x4,%esp
c0005ed5:	6a 03                	push   $0x3
c0005ed7:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005eda:	50                   	push   %eax
c0005edb:	6a 03                	push   $0x3
c0005edd:	e8 00 3a 00 00       	call   c00098e2 <send_rec>
c0005ee2:	83 c4 10             	add    $0x10,%esp
c0005ee5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ee8:	c9                   	leave  
c0005ee9:	c3                   	ret    

c0005eea <exec>:
c0005eea:	55                   	push   %ebp
c0005eeb:	89 e5                	mov    %esp,%ebp
c0005eed:	83 ec 78             	sub    $0x78,%esp
c0005ef0:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005ef7:	8b 45 08             	mov    0x8(%ebp),%eax
c0005efa:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005efd:	83 ec 0c             	sub    $0xc,%esp
c0005f00:	ff 75 08             	pushl  0x8(%ebp)
c0005f03:	e8 63 53 00 00       	call   c000b26b <Strlen>
c0005f08:	83 c4 10             	add    $0x10,%esp
c0005f0b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005f0e:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0005f15:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0005f1c:	83 ec 04             	sub    $0x4,%esp
c0005f1f:	6a 05                	push   $0x5
c0005f21:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f24:	50                   	push   %eax
c0005f25:	6a 03                	push   $0x3
c0005f27:	e8 b6 39 00 00       	call   c00098e2 <send_rec>
c0005f2c:	83 c4 10             	add    $0x10,%esp
c0005f2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f32:	83 f8 65             	cmp    $0x65,%eax
c0005f35:	74 19                	je     c0005f50 <exec+0x66>
c0005f37:	6a 19                	push   $0x19
c0005f39:	68 9e aa 00 c0       	push   $0xc000aa9e
c0005f3e:	68 9e aa 00 c0       	push   $0xc000aa9e
c0005f43:	68 a9 aa 00 c0       	push   $0xc000aaa9
c0005f48:	e8 a1 31 00 00       	call   c00090ee <assertion_failure>
c0005f4d:	83 c4 10             	add    $0x10,%esp
c0005f50:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005f53:	c9                   	leave  
c0005f54:	c3                   	ret    

c0005f55 <execv>:
c0005f55:	55                   	push   %ebp
c0005f56:	89 e5                	mov    %esp,%ebp
c0005f58:	57                   	push   %edi
c0005f59:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0005f5f:	83 ec 04             	sub    $0x4,%esp
c0005f62:	68 00 80 00 00       	push   $0x8000
c0005f67:	6a 00                	push   $0x0
c0005f69:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005f6f:	50                   	push   %eax
c0005f70:	e8 bd 52 00 00       	call   c000b232 <Memset>
c0005f75:	83 c4 10             	add    $0x10,%esp
c0005f78:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005f7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005f7e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0005f85:	eb 0d                	jmp    c0005f94 <execv+0x3f>
c0005f87:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0005f8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005f8e:	83 c0 04             	add    $0x4,%eax
c0005f91:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005f94:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005f97:	8b 00                	mov    (%eax),%eax
c0005f99:	85 c0                	test   %eax,%eax
c0005f9b:	75 ea                	jne    c0005f87 <execv+0x32>
c0005f9d:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005fa3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fa6:	01 d0                	add    %edx,%eax
c0005fa8:	c6 00 00             	movb   $0x0,(%eax)
c0005fab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fae:	83 c0 04             	add    $0x4,%eax
c0005fb1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005fb4:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0005fba:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005fbd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005fc0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005fc3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0005fca:	eb 64                	jmp    c0006030 <execv+0xdb>
c0005fcc:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0005fd2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005fd5:	01 c2                	add    %eax,%edx
c0005fd7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005fda:	89 10                	mov    %edx,(%eax)
c0005fdc:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005fdf:	8b 00                	mov    (%eax),%eax
c0005fe1:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0005fe7:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005fea:	01 ca                	add    %ecx,%edx
c0005fec:	83 ec 08             	sub    $0x8,%esp
c0005fef:	50                   	push   %eax
c0005ff0:	52                   	push   %edx
c0005ff1:	e8 5b 52 00 00       	call   c000b251 <Strcpy>
c0005ff6:	83 c4 10             	add    $0x10,%esp
c0005ff9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005ffc:	8b 00                	mov    (%eax),%eax
c0005ffe:	83 ec 0c             	sub    $0xc,%esp
c0006001:	50                   	push   %eax
c0006002:	e8 64 52 00 00       	call   c000b26b <Strlen>
c0006007:	83 c4 10             	add    $0x10,%esp
c000600a:	01 45 f0             	add    %eax,-0x10(%ebp)
c000600d:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006013:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006016:	01 d0                	add    %edx,%eax
c0006018:	c6 00 00             	movb   $0x0,(%eax)
c000601b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000601e:	83 c0 01             	add    $0x1,%eax
c0006021:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006024:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c0006028:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000602c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006030:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006033:	8b 00                	mov    (%eax),%eax
c0006035:	85 c0                	test   %eax,%eax
c0006037:	75 93                	jne    c0005fcc <execv+0x77>
c0006039:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000603f:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006042:	eb 04                	jmp    c0006048 <execv+0xf3>
c0006044:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c0006048:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000604b:	8b 00                	mov    (%eax),%eax
c000604d:	85 c0                	test   %eax,%eax
c000604f:	75 f3                	jne    c0006044 <execv+0xef>
c0006051:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c0006057:	b8 00 00 00 00       	mov    $0x0,%eax
c000605c:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0006061:	89 d7                	mov    %edx,%edi
c0006063:	f3 ab                	rep stos %eax,%es:(%edi)
c0006065:	c7 85 4c 7f ff ff c1 	movl   $0xc000aac1,-0x80b4(%ebp)
c000606c:	aa 00 c0 
c000606f:	c7 85 50 7f ff ff c8 	movl   $0xc000aac8,-0x80b0(%ebp)
c0006076:	aa 00 c0 
c0006079:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0006080:	00 00 00 
c0006083:	8b 45 08             	mov    0x8(%ebp),%eax
c0006086:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c000608c:	83 ec 0c             	sub    $0xc,%esp
c000608f:	ff 75 08             	pushl  0x8(%ebp)
c0006092:	e8 d4 51 00 00       	call   c000b26b <Strlen>
c0006097:	83 c4 10             	add    $0x10,%esp
c000609a:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c00060a0:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00060a6:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c00060ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060af:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c00060b5:	83 ec 04             	sub    $0x4,%esp
c00060b8:	6a 05                	push   $0x5
c00060ba:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c00060c0:	50                   	push   %eax
c00060c1:	6a 03                	push   $0x3
c00060c3:	e8 1a 38 00 00       	call   c00098e2 <send_rec>
c00060c8:	83 c4 10             	add    $0x10,%esp
c00060cb:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c00060d1:	83 f8 65             	cmp    $0x65,%eax
c00060d4:	74 19                	je     c00060ef <execv+0x19a>
c00060d6:	6a 72                	push   $0x72
c00060d8:	68 9e aa 00 c0       	push   $0xc000aa9e
c00060dd:	68 9e aa 00 c0       	push   $0xc000aa9e
c00060e2:	68 a9 aa 00 c0       	push   $0xc000aaa9
c00060e7:	e8 02 30 00 00       	call   c00090ee <assertion_failure>
c00060ec:	83 c4 10             	add    $0x10,%esp
c00060ef:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c00060f5:	8b 7d fc             	mov    -0x4(%ebp),%edi
c00060f8:	c9                   	leave  
c00060f9:	c3                   	ret    

c00060fa <execl>:
c00060fa:	55                   	push   %ebp
c00060fb:	89 e5                	mov    %esp,%ebp
c00060fd:	83 ec 18             	sub    $0x18,%esp
c0006100:	8d 45 0c             	lea    0xc(%ebp),%eax
c0006103:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006106:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006109:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000610c:	83 ec 08             	sub    $0x8,%esp
c000610f:	ff 75 f0             	pushl  -0x10(%ebp)
c0006112:	ff 75 08             	pushl  0x8(%ebp)
c0006115:	e8 3b fe ff ff       	call   c0005f55 <execv>
c000611a:	83 c4 10             	add    $0x10,%esp
c000611d:	c9                   	leave  
c000611e:	c3                   	ret    

c000611f <TaskMM>:
c000611f:	55                   	push   %ebp
c0006120:	89 e5                	mov    %esp,%ebp
c0006122:	83 ec 28             	sub    $0x28,%esp
c0006125:	83 ec 0c             	sub    $0xc,%esp
c0006128:	6a 6c                	push   $0x6c
c000612a:	e8 96 0c 00 00       	call   c0006dc5 <sys_malloc>
c000612f:	83 c4 10             	add    $0x10,%esp
c0006132:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006135:	83 ec 0c             	sub    $0xc,%esp
c0006138:	6a 6c                	push   $0x6c
c000613a:	e8 86 0c 00 00       	call   c0006dc5 <sys_malloc>
c000613f:	83 c4 10             	add    $0x10,%esp
c0006142:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006145:	83 ec 04             	sub    $0x4,%esp
c0006148:	6a 0e                	push   $0xe
c000614a:	ff 75 f0             	pushl  -0x10(%ebp)
c000614d:	6a 02                	push   $0x2
c000614f:	e8 8e 37 00 00       	call   c00098e2 <send_rec>
c0006154:	83 c4 10             	add    $0x10,%esp
c0006157:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000615a:	8b 40 68             	mov    0x68(%eax),%eax
c000615d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006160:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006163:	8b 00                	mov    (%eax),%eax
c0006165:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006168:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000616f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006172:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0006179:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000617c:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c0006183:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c0006187:	74 4b                	je     c00061d4 <TaskMM+0xb5>
c0006189:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
c000618d:	7f 08                	jg     c0006197 <TaskMM+0x78>
c000618f:	83 7d e8 02          	cmpl   $0x2,-0x18(%ebp)
c0006193:	74 28                	je     c00061bd <TaskMM+0x9e>
c0006195:	eb 6e                	jmp    c0006205 <TaskMM+0xe6>
c0006197:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
c000619b:	74 08                	je     c00061a5 <TaskMM+0x86>
c000619d:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00061a1:	74 4b                	je     c00061ee <TaskMM+0xcf>
c00061a3:	eb 60                	jmp    c0006205 <TaskMM+0xe6>
c00061a5:	83 ec 0c             	sub    $0xc,%esp
c00061a8:	ff 75 f0             	pushl  -0x10(%ebp)
c00061ab:	e8 ec 03 00 00       	call   c000659c <do_fork>
c00061b0:	83 c4 10             	add    $0x10,%esp
c00061b3:	89 c2                	mov    %eax,%edx
c00061b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00061b8:	89 50 4c             	mov    %edx,0x4c(%eax)
c00061bb:	eb 59                	jmp    c0006216 <TaskMM+0xf7>
c00061bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00061c4:	83 ec 0c             	sub    $0xc,%esp
c00061c7:	ff 75 f0             	pushl  -0x10(%ebp)
c00061ca:	e8 9c 00 00 00       	call   c000626b <do_exec>
c00061cf:	83 c4 10             	add    $0x10,%esp
c00061d2:	eb 42                	jmp    c0006216 <TaskMM+0xf7>
c00061d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00061db:	83 ec 08             	sub    $0x8,%esp
c00061de:	ff 75 e0             	pushl  -0x20(%ebp)
c00061e1:	ff 75 f0             	pushl  -0x10(%ebp)
c00061e4:	e8 1e 04 00 00       	call   c0006607 <do_exit>
c00061e9:	83 c4 10             	add    $0x10,%esp
c00061ec:	eb 28                	jmp    c0006216 <TaskMM+0xf7>
c00061ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00061f5:	83 ec 0c             	sub    $0xc,%esp
c00061f8:	ff 75 f0             	pushl  -0x10(%ebp)
c00061fb:	e8 03 05 00 00       	call   c0006703 <do_wait>
c0006200:	83 c4 10             	add    $0x10,%esp
c0006203:	eb 11                	jmp    c0006216 <TaskMM+0xf7>
c0006205:	83 ec 0c             	sub    $0xc,%esp
c0006208:	68 cf aa 00 c0       	push   $0xc000aacf
c000620d:	e8 be 2e 00 00       	call   c00090d0 <panic>
c0006212:	83 c4 10             	add    $0x10,%esp
c0006215:	90                   	nop
c0006216:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000621a:	0f 84 25 ff ff ff    	je     c0006145 <TaskMM+0x26>
c0006220:	83 ec 04             	sub    $0x4,%esp
c0006223:	ff 75 e4             	pushl  -0x1c(%ebp)
c0006226:	ff 75 ec             	pushl  -0x14(%ebp)
c0006229:	6a 01                	push   $0x1
c000622b:	e8 b2 36 00 00       	call   c00098e2 <send_rec>
c0006230:	83 c4 10             	add    $0x10,%esp
c0006233:	e9 0d ff ff ff       	jmp    c0006145 <TaskMM+0x26>

c0006238 <alloc_mem>:
c0006238:	55                   	push   %ebp
c0006239:	89 e5                	mov    %esp,%ebp
c000623b:	83 ec 10             	sub    $0x10,%esp
c000623e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006241:	83 e8 04             	sub    $0x4,%eax
c0006244:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c000624a:	05 00 00 a0 00       	add    $0xa00000,%eax
c000624f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006252:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006255:	c9                   	leave  
c0006256:	c3                   	ret    

c0006257 <do_exec2>:
c0006257:	55                   	push   %ebp
c0006258:	89 e5                	mov    %esp,%ebp
c000625a:	83 ec 10             	sub    $0x10,%esp
c000625d:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0006264:	b8 00 00 00 00       	mov    $0x0,%eax
c0006269:	c9                   	leave  
c000626a:	c3                   	ret    

c000626b <do_exec>:
c000626b:	55                   	push   %ebp
c000626c:	89 e5                	mov    %esp,%ebp
c000626e:	56                   	push   %esi
c000626f:	53                   	push   %ebx
c0006270:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c0006276:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c000627d:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0006284:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c000628a:	83 ec 08             	sub    $0x8,%esp
c000628d:	6a 00                	push   $0x0
c000628f:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c0006292:	50                   	push   %eax
c0006293:	e8 9d f9 ff ff       	call   c0005c35 <open>
c0006298:	83 c4 10             	add    $0x10,%esp
c000629b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000629e:	8b 45 08             	mov    0x8(%ebp),%eax
c00062a1:	8b 00                	mov    (%eax),%eax
c00062a3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00062a6:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c00062ad:	83 ec 04             	sub    $0x4,%esp
c00062b0:	6a 0c                	push   $0xc
c00062b2:	6a 00                	push   $0x0
c00062b4:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00062ba:	50                   	push   %eax
c00062bb:	e8 72 4f 00 00       	call   c000b232 <Memset>
c00062c0:	83 c4 10             	add    $0x10,%esp
c00062c3:	8b 45 08             	mov    0x8(%ebp),%eax
c00062c6:	8b 40 30             	mov    0x30(%eax),%eax
c00062c9:	89 c6                	mov    %eax,%esi
c00062cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00062ce:	8b 40 34             	mov    0x34(%eax),%eax
c00062d1:	83 ec 08             	sub    $0x8,%esp
c00062d4:	50                   	push   %eax
c00062d5:	ff 75 d8             	pushl  -0x28(%ebp)
c00062d8:	e8 42 e8 ff ff       	call   c0004b1f <v2l>
c00062dd:	83 c4 10             	add    $0x10,%esp
c00062e0:	89 c3                	mov    %eax,%ebx
c00062e2:	83 ec 08             	sub    $0x8,%esp
c00062e5:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00062eb:	50                   	push   %eax
c00062ec:	6a 05                	push   $0x5
c00062ee:	e8 2c e8 ff ff       	call   c0004b1f <v2l>
c00062f3:	83 c4 10             	add    $0x10,%esp
c00062f6:	83 ec 04             	sub    $0x4,%esp
c00062f9:	56                   	push   %esi
c00062fa:	53                   	push   %ebx
c00062fb:	50                   	push   %eax
c00062fc:	e8 03 4f 00 00       	call   c000b204 <Memcpy>
c0006301:	83 c4 10             	add    $0x10,%esp
c0006304:	83 ec 08             	sub    $0x8,%esp
c0006307:	6a 00                	push   $0x0
c0006309:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000630f:	50                   	push   %eax
c0006310:	e8 20 f9 ff ff       	call   c0005c35 <open>
c0006315:	83 c4 10             	add    $0x10,%esp
c0006318:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000631b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006322:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006325:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c000632b:	01 d0                	add    %edx,%eax
c000632d:	83 ec 04             	sub    $0x4,%esp
c0006330:	68 00 02 00 00       	push   $0x200
c0006335:	50                   	push   %eax
c0006336:	ff 75 d0             	pushl  -0x30(%ebp)
c0006339:	e8 7c f9 ff ff       	call   c0005cba <read>
c000633e:	83 c4 10             	add    $0x10,%esp
c0006341:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006344:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006347:	01 45 f4             	add    %eax,-0xc(%ebp)
c000634a:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c000634e:	74 02                	je     c0006352 <do_exec+0xe7>
c0006350:	eb d0                	jmp    c0006322 <do_exec+0xb7>
c0006352:	90                   	nop
c0006353:	83 ec 0c             	sub    $0xc,%esp
c0006356:	ff 75 d0             	pushl  -0x30(%ebp)
c0006359:	e8 55 fa ff ff       	call   c0005db3 <close>
c000635e:	83 c4 10             	add    $0x10,%esp
c0006361:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0006367:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000636a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006371:	eb 72                	jmp    c00063e5 <do_exec+0x17a>
c0006373:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006376:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c000637a:	0f b7 d0             	movzwl %ax,%edx
c000637d:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006380:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0006384:	0f b7 c0             	movzwl %ax,%eax
c0006387:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c000638b:	01 c2                	add    %eax,%edx
c000638d:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0006393:	01 d0                	add    %edx,%eax
c0006395:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006398:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000639b:	8b 40 10             	mov    0x10(%eax),%eax
c000639e:	89 c6                	mov    %eax,%esi
c00063a0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00063a3:	8b 40 04             	mov    0x4(%eax),%eax
c00063a6:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00063ac:	01 d0                	add    %edx,%eax
c00063ae:	83 ec 08             	sub    $0x8,%esp
c00063b1:	50                   	push   %eax
c00063b2:	6a 05                	push   $0x5
c00063b4:	e8 66 e7 ff ff       	call   c0004b1f <v2l>
c00063b9:	83 c4 10             	add    $0x10,%esp
c00063bc:	89 c3                	mov    %eax,%ebx
c00063be:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00063c1:	8b 40 08             	mov    0x8(%eax),%eax
c00063c4:	83 ec 08             	sub    $0x8,%esp
c00063c7:	50                   	push   %eax
c00063c8:	ff 75 d8             	pushl  -0x28(%ebp)
c00063cb:	e8 4f e7 ff ff       	call   c0004b1f <v2l>
c00063d0:	83 c4 10             	add    $0x10,%esp
c00063d3:	83 ec 04             	sub    $0x4,%esp
c00063d6:	56                   	push   %esi
c00063d7:	53                   	push   %ebx
c00063d8:	50                   	push   %eax
c00063d9:	e8 26 4e 00 00       	call   c000b204 <Memcpy>
c00063de:	83 c4 10             	add    $0x10,%esp
c00063e1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00063e5:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00063e8:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c00063ec:	0f b7 c0             	movzwl %ax,%eax
c00063ef:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00063f2:	0f 8c 7b ff ff ff    	jl     c0006373 <do_exec+0x108>
c00063f8:	8b 45 08             	mov    0x8(%ebp),%eax
c00063fb:	8b 40 10             	mov    0x10(%eax),%eax
c00063fe:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006401:	8b 45 08             	mov    0x8(%ebp),%eax
c0006404:	8b 40 1c             	mov    0x1c(%eax),%eax
c0006407:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000640a:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c0006411:	83 ec 08             	sub    $0x8,%esp
c0006414:	ff 75 c0             	pushl  -0x40(%ebp)
c0006417:	ff 75 d8             	pushl  -0x28(%ebp)
c000641a:	e8 00 e7 ff ff       	call   c0004b1f <v2l>
c000641f:	83 c4 10             	add    $0x10,%esp
c0006422:	89 c3                	mov    %eax,%ebx
c0006424:	83 ec 08             	sub    $0x8,%esp
c0006427:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c000642d:	50                   	push   %eax
c000642e:	6a 05                	push   $0x5
c0006430:	e8 ea e6 ff ff       	call   c0004b1f <v2l>
c0006435:	83 c4 10             	add    $0x10,%esp
c0006438:	83 ec 04             	sub    $0x4,%esp
c000643b:	ff 75 bc             	pushl  -0x44(%ebp)
c000643e:	53                   	push   %ebx
c000643f:	50                   	push   %eax
c0006440:	e8 bf 4d 00 00       	call   c000b204 <Memcpy>
c0006445:	83 c4 10             	add    $0x10,%esp
c0006448:	83 ec 08             	sub    $0x8,%esp
c000644b:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006451:	50                   	push   %eax
c0006452:	6a 05                	push   $0x5
c0006454:	e8 c6 e6 ff ff       	call   c0004b1f <v2l>
c0006459:	83 c4 10             	add    $0x10,%esp
c000645c:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000645f:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006462:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006465:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000646c:	eb 08                	jmp    c0006476 <do_exec+0x20b>
c000646e:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006472:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0006476:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006479:	8b 00                	mov    (%eax),%eax
c000647b:	85 c0                	test   %eax,%eax
c000647d:	75 ef                	jne    c000646e <do_exec+0x203>
c000647f:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006482:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0006485:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006488:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000648f:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006495:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006498:	eb 17                	jmp    c00064b1 <do_exec+0x246>
c000649a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000649e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00064a1:	8b 10                	mov    (%eax),%edx
c00064a3:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00064a6:	01 c2                	add    %eax,%edx
c00064a8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00064ab:	89 10                	mov    %edx,(%eax)
c00064ad:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00064b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00064b4:	8b 00                	mov    (%eax),%eax
c00064b6:	85 c0                	test   %eax,%eax
c00064b8:	75 e0                	jne    c000649a <do_exec+0x22f>
c00064ba:	83 ec 08             	sub    $0x8,%esp
c00064bd:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00064c3:	50                   	push   %eax
c00064c4:	6a 05                	push   $0x5
c00064c6:	e8 54 e6 ff ff       	call   c0004b1f <v2l>
c00064cb:	83 c4 10             	add    $0x10,%esp
c00064ce:	89 c3                	mov    %eax,%ebx
c00064d0:	83 ec 08             	sub    $0x8,%esp
c00064d3:	ff 75 b8             	pushl  -0x48(%ebp)
c00064d6:	ff 75 d8             	pushl  -0x28(%ebp)
c00064d9:	e8 41 e6 ff ff       	call   c0004b1f <v2l>
c00064de:	83 c4 10             	add    $0x10,%esp
c00064e1:	83 ec 04             	sub    $0x4,%esp
c00064e4:	ff 75 bc             	pushl  -0x44(%ebp)
c00064e7:	53                   	push   %ebx
c00064e8:	50                   	push   %eax
c00064e9:	e8 16 4d 00 00       	call   c000b204 <Memcpy>
c00064ee:	83 c4 10             	add    $0x10,%esp
c00064f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00064f4:	89 45 ac             	mov    %eax,-0x54(%ebp)
c00064f7:	8b 45 b8             	mov    -0x48(%ebp),%eax
c00064fa:	8b 55 ac             	mov    -0x54(%ebp),%edx
c00064fd:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006503:	81 c2 94 35 08 c0    	add    $0xc0083594,%edx
c0006509:	89 02                	mov    %eax,(%edx)
c000650b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000650e:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006511:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006517:	81 c2 90 35 08 c0    	add    $0xc0083590,%edx
c000651d:	89 02                	mov    %eax,(%edx)
c000651f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006522:	8b 40 18             	mov    0x18(%eax),%eax
c0006525:	89 c2                	mov    %eax,%edx
c0006527:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000652a:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006530:	05 98 35 08 c0       	add    $0xc0083598,%eax
c0006535:	89 10                	mov    %edx,(%eax)
c0006537:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000653a:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000653d:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006543:	81 c2 a4 35 08 c0    	add    $0xc00835a4,%edx
c0006549:	89 02                	mov    %eax,(%edx)
c000654b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000654e:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006554:	05 4c 35 08 c0       	add    $0xc008354c,%eax
c0006559:	c7 00 1d 00 00 00    	movl   $0x1d,(%eax)
c000655f:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c0006566:	00 00 00 
c0006569:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c0006570:	00 00 00 
c0006573:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c000657a:	00 00 00 
c000657d:	83 ec 04             	sub    $0x4,%esp
c0006580:	ff 75 d8             	pushl  -0x28(%ebp)
c0006583:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c0006589:	50                   	push   %eax
c000658a:	6a 01                	push   $0x1
c000658c:	e8 51 33 00 00       	call   c00098e2 <send_rec>
c0006591:	83 c4 10             	add    $0x10,%esp
c0006594:	90                   	nop
c0006595:	8d 65 f8             	lea    -0x8(%ebp),%esp
c0006598:	5b                   	pop    %ebx
c0006599:	5e                   	pop    %esi
c000659a:	5d                   	pop    %ebp
c000659b:	c3                   	ret    

c000659c <do_fork>:
c000659c:	55                   	push   %ebp
c000659d:	89 e5                	mov    %esp,%ebp
c000659f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00065a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00065a8:	8b 00                	mov    (%eax),%eax
c00065aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00065ad:	83 ec 0c             	sub    $0xc,%esp
c00065b0:	ff 75 f4             	pushl  -0xc(%ebp)
c00065b3:	e8 3e 3b 00 00       	call   c000a0f6 <fork_process>
c00065b8:	83 c4 10             	add    $0x10,%esp
c00065bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00065be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065c1:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00065c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00065ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00065cd:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c00065d3:	8b 45 08             	mov    0x8(%ebp),%eax
c00065d6:	89 50 4c             	mov    %edx,0x4c(%eax)
c00065d9:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00065e0:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00065e7:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00065ee:	83 ec 04             	sub    $0x4,%esp
c00065f1:	ff 75 ec             	pushl  -0x14(%ebp)
c00065f4:	8d 45 80             	lea    -0x80(%ebp),%eax
c00065f7:	50                   	push   %eax
c00065f8:	6a 01                	push   $0x1
c00065fa:	e8 e3 32 00 00       	call   c00098e2 <send_rec>
c00065ff:	83 c4 10             	add    $0x10,%esp
c0006602:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006605:	c9                   	leave  
c0006606:	c3                   	ret    

c0006607 <do_exit>:
c0006607:	55                   	push   %ebp
c0006608:	89 e5                	mov    %esp,%ebp
c000660a:	83 ec 18             	sub    $0x18,%esp
c000660d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006610:	8b 00                	mov    (%eax),%eax
c0006612:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006615:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006618:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000661e:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006623:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006626:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006629:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c000662f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006632:	8b 45 08             	mov    0x8(%ebp),%eax
c0006635:	8b 40 44             	mov    0x44(%eax),%eax
c0006638:	89 c2                	mov    %eax,%edx
c000663a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000663d:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c0006643:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006646:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000664c:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006651:	0f b6 00             	movzbl (%eax),%eax
c0006654:	3c 04                	cmp    $0x4,%al
c0006656:	75 21                	jne    c0006679 <do_exit+0x72>
c0006658:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000665b:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006661:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006666:	c6 00 fb             	movb   $0xfb,(%eax)
c0006669:	83 ec 0c             	sub    $0xc,%esp
c000666c:	ff 75 ec             	pushl  -0x14(%ebp)
c000666f:	e8 59 01 00 00       	call   c00067cd <cleanup>
c0006674:	83 c4 10             	add    $0x10,%esp
c0006677:	eb 0a                	jmp    c0006683 <do_exit+0x7c>
c0006679:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000667c:	c6 80 44 02 00 00 03 	movb   $0x3,0x244(%eax)
c0006683:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c000668a:	eb 6e                	jmp    c00066fa <do_exit+0xf3>
c000668c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000668f:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006695:	05 60 35 08 c0       	add    $0xc0083560,%eax
c000669a:	8b 00                	mov    (%eax),%eax
c000669c:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000669f:	75 55                	jne    c00066f6 <do_exit+0xef>
c00066a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066a4:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00066aa:	05 60 35 08 c0       	add    $0xc0083560,%eax
c00066af:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00066b5:	0f b6 05 4d 45 08 c0 	movzbl 0xc008454d,%eax
c00066bc:	3c 04                	cmp    $0x4,%al
c00066be:	75 36                	jne    c00066f6 <do_exit+0xef>
c00066c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066c3:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00066c9:	05 45 35 08 c0       	add    $0xc0083545,%eax
c00066ce:	0f b6 00             	movzbl (%eax),%eax
c00066d1:	3c 03                	cmp    $0x3,%al
c00066d3:	75 21                	jne    c00066f6 <do_exit+0xef>
c00066d5:	c6 05 4d 45 08 c0 fb 	movb   $0xfb,0xc008454d
c00066dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00066df:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00066e5:	05 00 33 08 c0       	add    $0xc0083300,%eax
c00066ea:	83 ec 0c             	sub    $0xc,%esp
c00066ed:	50                   	push   %eax
c00066ee:	e8 da 00 00 00       	call   c00067cd <cleanup>
c00066f3:	83 c4 10             	add    $0x10,%esp
c00066f6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00066fa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00066fe:	7e 8c                	jle    c000668c <do_exit+0x85>
c0006700:	90                   	nop
c0006701:	c9                   	leave  
c0006702:	c3                   	ret    

c0006703 <do_wait>:
c0006703:	55                   	push   %ebp
c0006704:	89 e5                	mov    %esp,%ebp
c0006706:	81 ec 88 00 00 00    	sub    $0x88,%esp
c000670c:	8b 45 08             	mov    0x8(%ebp),%eax
c000670f:	8b 00                	mov    (%eax),%eax
c0006711:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006714:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000671b:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
c0006722:	eb 5f                	jmp    c0006783 <do_wait+0x80>
c0006724:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006727:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000672d:	05 60 35 08 c0       	add    $0xc0083560,%eax
c0006732:	8b 00                	mov    (%eax),%eax
c0006734:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006737:	75 46                	jne    c000677f <do_wait+0x7c>
c0006739:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000673d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006740:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006746:	05 45 35 08 c0       	add    $0xc0083545,%eax
c000674b:	0f b6 00             	movzbl (%eax),%eax
c000674e:	3c 03                	cmp    $0x3,%al
c0006750:	75 2d                	jne    c000677f <do_wait+0x7c>
c0006752:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006755:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000675b:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006760:	c6 00 fb             	movb   $0xfb,(%eax)
c0006763:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006766:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000676c:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006771:	83 ec 0c             	sub    $0xc,%esp
c0006774:	50                   	push   %eax
c0006775:	e8 53 00 00 00       	call   c00067cd <cleanup>
c000677a:	83 c4 10             	add    $0x10,%esp
c000677d:	eb 4c                	jmp    c00067cb <do_wait+0xc8>
c000677f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006783:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0006787:	7e 9b                	jle    c0006724 <do_wait+0x21>
c0006789:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000678d:	74 13                	je     c00067a2 <do_wait+0x9f>
c000678f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006792:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006798:	05 45 35 08 c0       	add    $0xc0083545,%eax
c000679d:	c6 00 04             	movb   $0x4,(%eax)
c00067a0:	eb 29                	jmp    c00067cb <do_wait+0xc8>
c00067a2:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00067a9:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00067b0:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00067b7:	83 ec 04             	sub    $0x4,%esp
c00067ba:	ff 75 ec             	pushl  -0x14(%ebp)
c00067bd:	8d 45 80             	lea    -0x80(%ebp),%eax
c00067c0:	50                   	push   %eax
c00067c1:	6a 01                	push   $0x1
c00067c3:	e8 1a 31 00 00       	call   c00098e2 <send_rec>
c00067c8:	83 c4 10             	add    $0x10,%esp
c00067cb:	c9                   	leave  
c00067cc:	c3                   	ret    

c00067cd <cleanup>:
c00067cd:	55                   	push   %ebp
c00067ce:	89 e5                	mov    %esp,%ebp
c00067d0:	83 ec 78             	sub    $0x78,%esp
c00067d3:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00067da:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00067e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00067e4:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00067ea:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00067ed:	8b 45 08             	mov    0x8(%ebp),%eax
c00067f0:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c00067f6:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00067f9:	8b 45 08             	mov    0x8(%ebp),%eax
c00067fc:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0006802:	83 ec 04             	sub    $0x4,%esp
c0006805:	50                   	push   %eax
c0006806:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006809:	50                   	push   %eax
c000680a:	6a 01                	push   $0x1
c000680c:	e8 d1 30 00 00       	call   c00098e2 <send_rec>
c0006811:	83 c4 10             	add    $0x10,%esp
c0006814:	8b 45 08             	mov    0x8(%ebp),%eax
c0006817:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c000681e:	90                   	nop
c000681f:	c9                   	leave  
c0006820:	c3                   	ret    

c0006821 <init_bitmap>:
c0006821:	55                   	push   %ebp
c0006822:	89 e5                	mov    %esp,%ebp
c0006824:	83 ec 08             	sub    $0x8,%esp
c0006827:	8b 45 08             	mov    0x8(%ebp),%eax
c000682a:	8b 50 04             	mov    0x4(%eax),%edx
c000682d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006830:	8b 00                	mov    (%eax),%eax
c0006832:	83 ec 04             	sub    $0x4,%esp
c0006835:	52                   	push   %edx
c0006836:	6a 00                	push   $0x0
c0006838:	50                   	push   %eax
c0006839:	e8 f4 49 00 00       	call   c000b232 <Memset>
c000683e:	83 c4 10             	add    $0x10,%esp
c0006841:	90                   	nop
c0006842:	c9                   	leave  
c0006843:	c3                   	ret    

c0006844 <test_bit_val>:
c0006844:	55                   	push   %ebp
c0006845:	89 e5                	mov    %esp,%ebp
c0006847:	53                   	push   %ebx
c0006848:	83 ec 10             	sub    $0x10,%esp
c000684b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000684e:	8d 50 07             	lea    0x7(%eax),%edx
c0006851:	85 c0                	test   %eax,%eax
c0006853:	0f 48 c2             	cmovs  %edx,%eax
c0006856:	c1 f8 03             	sar    $0x3,%eax
c0006859:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000685c:	8b 45 0c             	mov    0xc(%ebp),%eax
c000685f:	99                   	cltd   
c0006860:	c1 ea 1d             	shr    $0x1d,%edx
c0006863:	01 d0                	add    %edx,%eax
c0006865:	83 e0 07             	and    $0x7,%eax
c0006868:	29 d0                	sub    %edx,%eax
c000686a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000686d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006870:	8b 10                	mov    (%eax),%edx
c0006872:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006875:	01 d0                	add    %edx,%eax
c0006877:	0f b6 00             	movzbl (%eax),%eax
c000687a:	88 45 f3             	mov    %al,-0xd(%ebp)
c000687d:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006881:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006884:	bb 01 00 00 00       	mov    $0x1,%ebx
c0006889:	89 c1                	mov    %eax,%ecx
c000688b:	d3 e3                	shl    %cl,%ebx
c000688d:	89 d8                	mov    %ebx,%eax
c000688f:	21 c2                	and    %eax,%edx
c0006891:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006894:	89 c1                	mov    %eax,%ecx
c0006896:	d3 fa                	sar    %cl,%edx
c0006898:	89 d0                	mov    %edx,%eax
c000689a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000689d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00068a1:	0f 9f c0             	setg   %al
c00068a4:	0f b6 c0             	movzbl %al,%eax
c00068a7:	83 c4 10             	add    $0x10,%esp
c00068aa:	5b                   	pop    %ebx
c00068ab:	5d                   	pop    %ebp
c00068ac:	c3                   	ret    

c00068ad <set_bit_val>:
c00068ad:	55                   	push   %ebp
c00068ae:	89 e5                	mov    %esp,%ebp
c00068b0:	83 ec 10             	sub    $0x10,%esp
c00068b3:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068b6:	8d 50 07             	lea    0x7(%eax),%edx
c00068b9:	85 c0                	test   %eax,%eax
c00068bb:	0f 48 c2             	cmovs  %edx,%eax
c00068be:	c1 f8 03             	sar    $0x3,%eax
c00068c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00068c4:	8b 45 0c             	mov    0xc(%ebp),%eax
c00068c7:	99                   	cltd   
c00068c8:	c1 ea 1d             	shr    $0x1d,%edx
c00068cb:	01 d0                	add    %edx,%eax
c00068cd:	83 e0 07             	and    $0x7,%eax
c00068d0:	29 d0                	sub    %edx,%eax
c00068d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00068d5:	8b 45 08             	mov    0x8(%ebp),%eax
c00068d8:	8b 10                	mov    (%eax),%edx
c00068da:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00068dd:	01 d0                	add    %edx,%eax
c00068df:	0f b6 00             	movzbl (%eax),%eax
c00068e2:	88 45 ff             	mov    %al,-0x1(%ebp)
c00068e5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c00068e9:	7e 13                	jle    c00068fe <set_bit_val+0x51>
c00068eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00068ee:	ba 01 00 00 00       	mov    $0x1,%edx
c00068f3:	89 c1                	mov    %eax,%ecx
c00068f5:	d3 e2                	shl    %cl,%edx
c00068f7:	89 d0                	mov    %edx,%eax
c00068f9:	08 45 ff             	or     %al,-0x1(%ebp)
c00068fc:	eb 13                	jmp    c0006911 <set_bit_val+0x64>
c00068fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006901:	ba 01 00 00 00       	mov    $0x1,%edx
c0006906:	89 c1                	mov    %eax,%ecx
c0006908:	d3 e2                	shl    %cl,%edx
c000690a:	89 d0                	mov    %edx,%eax
c000690c:	f7 d0                	not    %eax
c000690e:	20 45 ff             	and    %al,-0x1(%ebp)
c0006911:	8b 45 08             	mov    0x8(%ebp),%eax
c0006914:	8b 10                	mov    (%eax),%edx
c0006916:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006919:	01 c2                	add    %eax,%edx
c000691b:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c000691f:	88 02                	mov    %al,(%edx)
c0006921:	b8 01 00 00 00       	mov    $0x1,%eax
c0006926:	c9                   	leave  
c0006927:	c3                   	ret    

c0006928 <set_bits>:
c0006928:	55                   	push   %ebp
c0006929:	89 e5                	mov    %esp,%ebp
c000692b:	83 ec 10             	sub    $0x10,%esp
c000692e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006935:	eb 1c                	jmp    c0006953 <set_bits+0x2b>
c0006937:	8b 45 0c             	mov    0xc(%ebp),%eax
c000693a:	8d 50 01             	lea    0x1(%eax),%edx
c000693d:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006940:	ff 75 10             	pushl  0x10(%ebp)
c0006943:	50                   	push   %eax
c0006944:	ff 75 08             	pushl  0x8(%ebp)
c0006947:	e8 61 ff ff ff       	call   c00068ad <set_bit_val>
c000694c:	83 c4 0c             	add    $0xc,%esp
c000694f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006953:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006956:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006959:	7c dc                	jl     c0006937 <set_bits+0xf>
c000695b:	b8 01 00 00 00       	mov    $0x1,%eax
c0006960:	c9                   	leave  
c0006961:	c3                   	ret    

c0006962 <get_first_free_bit>:
c0006962:	55                   	push   %ebp
c0006963:	89 e5                	mov    %esp,%ebp
c0006965:	83 ec 10             	sub    $0x10,%esp
c0006968:	8b 45 08             	mov    0x8(%ebp),%eax
c000696b:	8b 40 04             	mov    0x4(%eax),%eax
c000696e:	c1 e0 03             	shl    $0x3,%eax
c0006971:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006974:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006977:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000697a:	eb 1b                	jmp    c0006997 <get_first_free_bit+0x35>
c000697c:	ff 75 fc             	pushl  -0x4(%ebp)
c000697f:	ff 75 08             	pushl  0x8(%ebp)
c0006982:	e8 bd fe ff ff       	call   c0006844 <test_bit_val>
c0006987:	83 c4 08             	add    $0x8,%esp
c000698a:	85 c0                	test   %eax,%eax
c000698c:	75 05                	jne    c0006993 <get_first_free_bit+0x31>
c000698e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006991:	eb 11                	jmp    c00069a4 <get_first_free_bit+0x42>
c0006993:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006997:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000699a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c000699d:	7c dd                	jl     c000697c <get_first_free_bit+0x1a>
c000699f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00069a4:	c9                   	leave  
c00069a5:	c3                   	ret    

c00069a6 <get_bits>:
c00069a6:	55                   	push   %ebp
c00069a7:	89 e5                	mov    %esp,%ebp
c00069a9:	83 ec 20             	sub    $0x20,%esp
c00069ac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00069b3:	ff 75 f0             	pushl  -0x10(%ebp)
c00069b6:	ff 75 08             	pushl  0x8(%ebp)
c00069b9:	e8 a4 ff ff ff       	call   c0006962 <get_first_free_bit>
c00069be:	83 c4 08             	add    $0x8,%esp
c00069c1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00069c7:	8b 40 04             	mov    0x4(%eax),%eax
c00069ca:	c1 e0 03             	shl    $0x3,%eax
c00069cd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00069d0:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069d3:	83 e8 01             	sub    $0x1,%eax
c00069d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00069d9:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c00069dd:	75 08                	jne    c00069e7 <get_bits+0x41>
c00069df:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069e2:	e9 85 00 00 00       	jmp    c0006a6c <get_bits+0xc6>
c00069e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069ea:	83 c0 01             	add    $0x1,%eax
c00069ed:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00069f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069f6:	eb 58                	jmp    c0006a50 <get_bits+0xaa>
c00069f8:	ff 75 f8             	pushl  -0x8(%ebp)
c00069fb:	ff 75 08             	pushl  0x8(%ebp)
c00069fe:	e8 41 fe ff ff       	call   c0006844 <test_bit_val>
c0006a03:	83 c4 08             	add    $0x8,%esp
c0006a06:	85 c0                	test   %eax,%eax
c0006a08:	75 0a                	jne    c0006a14 <get_bits+0x6e>
c0006a0a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006a0e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006a12:	eb 2b                	jmp    c0006a3f <get_bits+0x99>
c0006a14:	6a 00                	push   $0x0
c0006a16:	ff 75 08             	pushl  0x8(%ebp)
c0006a19:	e8 44 ff ff ff       	call   c0006962 <get_first_free_bit>
c0006a1e:	83 c4 08             	add    $0x8,%esp
c0006a21:	83 c0 01             	add    $0x1,%eax
c0006a24:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006a27:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006a2a:	83 c0 01             	add    $0x1,%eax
c0006a2d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a30:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a33:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a36:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a39:	83 e8 01             	sub    $0x1,%eax
c0006a3c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a42:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006a45:	7c 09                	jl     c0006a50 <get_bits+0xaa>
c0006a47:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006a4e:	eb 0d                	jmp    c0006a5d <get_bits+0xb7>
c0006a50:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a53:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006a56:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006a59:	85 c0                	test   %eax,%eax
c0006a5b:	7f 9b                	jg     c00069f8 <get_bits+0x52>
c0006a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a60:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006a63:	83 c0 01             	add    $0x1,%eax
c0006a66:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a69:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a6c:	c9                   	leave  
c0006a6d:	c3                   	ret    

c0006a6e <get_a_page2>:
c0006a6e:	55                   	push   %ebp
c0006a6f:	89 e5                	mov    %esp,%ebp
c0006a71:	83 ec 18             	sub    $0x18,%esp
c0006a74:	83 ec 0c             	sub    $0xc,%esp
c0006a77:	ff 75 0c             	pushl  0xc(%ebp)
c0006a7a:	e8 1e 00 00 00       	call   c0006a9d <get_a_page>
c0006a7f:	83 c4 10             	add    $0x10,%esp
c0006a82:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006a85:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006a88:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a8b:	83 ec 08             	sub    $0x8,%esp
c0006a8e:	52                   	push   %edx
c0006a8f:	50                   	push   %eax
c0006a90:	e8 61 01 00 00       	call   c0006bf6 <add_map_entry>
c0006a95:	83 c4 10             	add    $0x10,%esp
c0006a98:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a9b:	c9                   	leave  
c0006a9c:	c3                   	ret    

c0006a9d <get_a_page>:
c0006a9d:	55                   	push   %ebp
c0006a9e:	89 e5                	mov    %esp,%ebp
c0006aa0:	83 ec 20             	sub    $0x20,%esp
c0006aa3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006aa7:	75 22                	jne    c0006acb <get_a_page+0x2e>
c0006aa9:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0006aae:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ab1:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c0006ab6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ab9:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0006abe:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ac1:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0006ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ac9:	eb 20                	jmp    c0006aeb <get_a_page+0x4e>
c0006acb:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0006ad0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ad3:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0006ad8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006adb:	a1 cc 1e 01 c0       	mov    0xc0011ecc,%eax
c0006ae0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ae3:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0006ae8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006aeb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006aee:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006af1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006af4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006af7:	6a 01                	push   $0x1
c0006af9:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006afc:	50                   	push   %eax
c0006afd:	e8 a4 fe ff ff       	call   c00069a6 <get_bits>
c0006b02:	83 c4 08             	add    $0x8,%esp
c0006b05:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b08:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006b0b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006b0e:	c1 e2 0c             	shl    $0xc,%edx
c0006b11:	01 d0                	add    %edx,%eax
c0006b13:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b16:	6a 01                	push   $0x1
c0006b18:	ff 75 fc             	pushl  -0x4(%ebp)
c0006b1b:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006b1e:	50                   	push   %eax
c0006b1f:	e8 89 fd ff ff       	call   c00068ad <set_bit_val>
c0006b24:	83 c4 0c             	add    $0xc,%esp
c0006b27:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b2a:	c9                   	leave  
c0006b2b:	c3                   	ret    

c0006b2c <get_virtual_address>:
c0006b2c:	55                   	push   %ebp
c0006b2d:	89 e5                	mov    %esp,%ebp
c0006b2f:	83 ec 28             	sub    $0x28,%esp
c0006b32:	e8 55 ad ff ff       	call   c000188c <get_running_thread_pcb>
c0006b37:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b3a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006b3e:	75 1a                	jne    c0006b5a <get_virtual_address+0x2e>
c0006b40:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0006b45:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006b48:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0006b4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006b50:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0006b55:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006b58:	eb 18                	jmp    c0006b72 <get_virtual_address+0x46>
c0006b5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b5d:	8b 40 08             	mov    0x8(%eax),%eax
c0006b60:	83 ec 04             	sub    $0x4,%esp
c0006b63:	6a 0c                	push   $0xc
c0006b65:	50                   	push   %eax
c0006b66:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006b69:	50                   	push   %eax
c0006b6a:	e8 95 46 00 00       	call   c000b204 <Memcpy>
c0006b6f:	83 c4 10             	add    $0x10,%esp
c0006b72:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006b75:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006b78:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006b7b:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006b7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b81:	83 ec 08             	sub    $0x8,%esp
c0006b84:	50                   	push   %eax
c0006b85:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006b88:	50                   	push   %eax
c0006b89:	e8 18 fe ff ff       	call   c00069a6 <get_bits>
c0006b8e:	83 c4 10             	add    $0x10,%esp
c0006b91:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006b94:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006b97:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006b9a:	c1 e2 0c             	shl    $0xc,%edx
c0006b9d:	01 d0                	add    %edx,%eax
c0006b9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ba2:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ba5:	50                   	push   %eax
c0006ba6:	6a 01                	push   $0x1
c0006ba8:	ff 75 f0             	pushl  -0x10(%ebp)
c0006bab:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006bae:	50                   	push   %eax
c0006baf:	e8 74 fd ff ff       	call   c0006928 <set_bits>
c0006bb4:	83 c4 10             	add    $0x10,%esp
c0006bb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006bba:	c9                   	leave  
c0006bbb:	c3                   	ret    

c0006bbc <ptr_pde>:
c0006bbc:	55                   	push   %ebp
c0006bbd:	89 e5                	mov    %esp,%ebp
c0006bbf:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bc2:	c1 e8 16             	shr    $0x16,%eax
c0006bc5:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006bca:	c1 e0 02             	shl    $0x2,%eax
c0006bcd:	5d                   	pop    %ebp
c0006bce:	c3                   	ret    

c0006bcf <ptr_pte>:
c0006bcf:	55                   	push   %ebp
c0006bd0:	89 e5                	mov    %esp,%ebp
c0006bd2:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bd5:	c1 e8 0a             	shr    $0xa,%eax
c0006bd8:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006bdd:	89 c2                	mov    %eax,%edx
c0006bdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0006be2:	c1 e8 0c             	shr    $0xc,%eax
c0006be5:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006bea:	c1 e0 02             	shl    $0x2,%eax
c0006bed:	01 d0                	add    %edx,%eax
c0006bef:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006bf4:	5d                   	pop    %ebp
c0006bf5:	c3                   	ret    

c0006bf6 <add_map_entry>:
c0006bf6:	55                   	push   %ebp
c0006bf7:	89 e5                	mov    %esp,%ebp
c0006bf9:	83 ec 18             	sub    $0x18,%esp
c0006bfc:	ff 75 08             	pushl  0x8(%ebp)
c0006bff:	e8 b8 ff ff ff       	call   c0006bbc <ptr_pde>
c0006c04:	83 c4 04             	add    $0x4,%esp
c0006c07:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c0a:	ff 75 08             	pushl  0x8(%ebp)
c0006c0d:	e8 bd ff ff ff       	call   c0006bcf <ptr_pte>
c0006c12:	83 c4 04             	add    $0x4,%esp
c0006c15:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c18:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c1b:	8b 00                	mov    (%eax),%eax
c0006c1d:	83 e0 01             	and    $0x1,%eax
c0006c20:	85 c0                	test   %eax,%eax
c0006c22:	74 1b                	je     c0006c3f <add_map_entry+0x49>
c0006c24:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c27:	8b 00                	mov    (%eax),%eax
c0006c29:	83 e0 01             	and    $0x1,%eax
c0006c2c:	85 c0                	test   %eax,%eax
c0006c2e:	75 51                	jne    c0006c81 <add_map_entry+0x8b>
c0006c30:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c33:	83 c8 07             	or     $0x7,%eax
c0006c36:	89 c2                	mov    %eax,%edx
c0006c38:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c3b:	89 10                	mov    %edx,(%eax)
c0006c3d:	eb 42                	jmp    c0006c81 <add_map_entry+0x8b>
c0006c3f:	6a 00                	push   $0x0
c0006c41:	e8 57 fe ff ff       	call   c0006a9d <get_a_page>
c0006c46:	83 c4 04             	add    $0x4,%esp
c0006c49:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006c4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006c4f:	83 c8 07             	or     $0x7,%eax
c0006c52:	89 c2                	mov    %eax,%edx
c0006c54:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c57:	89 10                	mov    %edx,(%eax)
c0006c59:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c5c:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006c61:	83 ec 04             	sub    $0x4,%esp
c0006c64:	68 00 10 00 00       	push   $0x1000
c0006c69:	6a 00                	push   $0x0
c0006c6b:	50                   	push   %eax
c0006c6c:	e8 c1 45 00 00       	call   c000b232 <Memset>
c0006c71:	83 c4 10             	add    $0x10,%esp
c0006c74:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c77:	83 c8 07             	or     $0x7,%eax
c0006c7a:	89 c2                	mov    %eax,%edx
c0006c7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c7f:	89 10                	mov    %edx,(%eax)
c0006c81:	90                   	nop
c0006c82:	c9                   	leave  
c0006c83:	c3                   	ret    

c0006c84 <alloc_virtual_memory>:
c0006c84:	55                   	push   %ebp
c0006c85:	89 e5                	mov    %esp,%ebp
c0006c87:	83 ec 18             	sub    $0x18,%esp
c0006c8a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006c8d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006c92:	c1 e8 0c             	shr    $0xc,%eax
c0006c95:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006c98:	e8 ef ab ff ff       	call   c000188c <get_running_thread_pcb>
c0006c9d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ca0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ca3:	8b 40 04             	mov    0x4(%eax),%eax
c0006ca6:	85 c0                	test   %eax,%eax
c0006ca8:	75 09                	jne    c0006cb3 <alloc_virtual_memory+0x2f>
c0006caa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006cb1:	eb 07                	jmp    c0006cba <alloc_virtual_memory+0x36>
c0006cb3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006cba:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006cbd:	83 ec 08             	sub    $0x8,%esp
c0006cc0:	ff 75 f4             	pushl  -0xc(%ebp)
c0006cc3:	50                   	push   %eax
c0006cc4:	e8 63 fe ff ff       	call   c0006b2c <get_virtual_address>
c0006cc9:	83 c4 10             	add    $0x10,%esp
c0006ccc:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ccf:	83 ec 08             	sub    $0x8,%esp
c0006cd2:	ff 75 08             	pushl  0x8(%ebp)
c0006cd5:	ff 75 e8             	pushl  -0x18(%ebp)
c0006cd8:	e8 19 ff ff ff       	call   c0006bf6 <add_map_entry>
c0006cdd:	83 c4 10             	add    $0x10,%esp
c0006ce0:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ce3:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006ce8:	89 c2                	mov    %eax,%edx
c0006cea:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006ced:	01 d0                	add    %edx,%eax
c0006cef:	c9                   	leave  
c0006cf0:	c3                   	ret    

c0006cf1 <get_physical_address>:
c0006cf1:	55                   	push   %ebp
c0006cf2:	89 e5                	mov    %esp,%ebp
c0006cf4:	83 ec 10             	sub    $0x10,%esp
c0006cf7:	ff 75 08             	pushl  0x8(%ebp)
c0006cfa:	e8 d0 fe ff ff       	call   c0006bcf <ptr_pte>
c0006cff:	83 c4 04             	add    $0x4,%esp
c0006d02:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006d05:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006d08:	8b 00                	mov    (%eax),%eax
c0006d0a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006d0f:	89 c2                	mov    %eax,%edx
c0006d11:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d14:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006d19:	09 d0                	or     %edx,%eax
c0006d1b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006d1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006d21:	c9                   	leave  
c0006d22:	c3                   	ret    

c0006d23 <alloc_memory>:
c0006d23:	55                   	push   %ebp
c0006d24:	89 e5                	mov    %esp,%ebp
c0006d26:	83 ec 18             	sub    $0x18,%esp
c0006d29:	83 ec 08             	sub    $0x8,%esp
c0006d2c:	ff 75 0c             	pushl  0xc(%ebp)
c0006d2f:	ff 75 08             	pushl  0x8(%ebp)
c0006d32:	e8 f5 fd ff ff       	call   c0006b2c <get_virtual_address>
c0006d37:	83 c4 10             	add    $0x10,%esp
c0006d3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d40:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006d45:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d48:	eb 29                	jmp    c0006d73 <alloc_memory+0x50>
c0006d4a:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006d51:	83 ec 0c             	sub    $0xc,%esp
c0006d54:	ff 75 0c             	pushl  0xc(%ebp)
c0006d57:	e8 41 fd ff ff       	call   c0006a9d <get_a_page>
c0006d5c:	83 c4 10             	add    $0x10,%esp
c0006d5f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d62:	83 ec 08             	sub    $0x8,%esp
c0006d65:	ff 75 ec             	pushl  -0x14(%ebp)
c0006d68:	ff 75 f4             	pushl  -0xc(%ebp)
c0006d6b:	e8 86 fe ff ff       	call   c0006bf6 <add_map_entry>
c0006d70:	83 c4 10             	add    $0x10,%esp
c0006d73:	8b 45 08             	mov    0x8(%ebp),%eax
c0006d76:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006d79:	89 55 08             	mov    %edx,0x8(%ebp)
c0006d7c:	85 c0                	test   %eax,%eax
c0006d7e:	75 ca                	jne    c0006d4a <alloc_memory+0x27>
c0006d80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d83:	c9                   	leave  
c0006d84:	c3                   	ret    

c0006d85 <get_a_virtual_page>:
c0006d85:	55                   	push   %ebp
c0006d86:	89 e5                	mov    %esp,%ebp
c0006d88:	83 ec 18             	sub    $0x18,%esp
c0006d8b:	ff 75 08             	pushl  0x8(%ebp)
c0006d8e:	e8 0a fd ff ff       	call   c0006a9d <get_a_page>
c0006d93:	83 c4 04             	add    $0x4,%esp
c0006d96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d99:	83 ec 08             	sub    $0x8,%esp
c0006d9c:	ff 75 f4             	pushl  -0xc(%ebp)
c0006d9f:	ff 75 0c             	pushl  0xc(%ebp)
c0006da2:	e8 4f fe ff ff       	call   c0006bf6 <add_map_entry>
c0006da7:	83 c4 10             	add    $0x10,%esp
c0006daa:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006dad:	c9                   	leave  
c0006dae:	c3                   	ret    

c0006daf <block2arena>:
c0006daf:	55                   	push   %ebp
c0006db0:	89 e5                	mov    %esp,%ebp
c0006db2:	83 ec 10             	sub    $0x10,%esp
c0006db5:	8b 45 08             	mov    0x8(%ebp),%eax
c0006db8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006dbd:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006dc0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006dc3:	c9                   	leave  
c0006dc4:	c3                   	ret    

c0006dc5 <sys_malloc>:
c0006dc5:	55                   	push   %ebp
c0006dc6:	89 e5                	mov    %esp,%ebp
c0006dc8:	83 ec 58             	sub    $0x58,%esp
c0006dcb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006dd2:	e8 b5 aa ff ff       	call   c000188c <get_running_thread_pcb>
c0006dd7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006dda:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006ddd:	8b 40 04             	mov    0x4(%eax),%eax
c0006de0:	85 c0                	test   %eax,%eax
c0006de2:	75 10                	jne    c0006df4 <sys_malloc+0x2f>
c0006de4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006deb:	c7 45 ec 00 32 08 c0 	movl   $0xc0083200,-0x14(%ebp)
c0006df2:	eb 10                	jmp    c0006e04 <sys_malloc+0x3f>
c0006df4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006dfb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006dfe:	83 c0 0c             	add    $0xc,%eax
c0006e01:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e04:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0006e0b:	76 50                	jbe    c0006e5d <sys_malloc+0x98>
c0006e0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e10:	05 0b 10 00 00       	add    $0x100b,%eax
c0006e15:	c1 e8 0c             	shr    $0xc,%eax
c0006e18:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006e1b:	83 ec 08             	sub    $0x8,%esp
c0006e1e:	ff 75 f0             	pushl  -0x10(%ebp)
c0006e21:	ff 75 d8             	pushl  -0x28(%ebp)
c0006e24:	e8 fa fe ff ff       	call   c0006d23 <alloc_memory>
c0006e29:	83 c4 10             	add    $0x10,%esp
c0006e2c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006e2f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006e32:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006e35:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e38:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0006e3e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e41:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0006e48:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e4b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0006e4f:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006e52:	83 c0 0c             	add    $0xc,%eax
c0006e55:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e58:	e9 7a 01 00 00       	jmp    c0006fd7 <sys_malloc+0x212>
c0006e5d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006e64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006e6b:	eb 26                	jmp    c0006e93 <sys_malloc+0xce>
c0006e6d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006e70:	89 d0                	mov    %edx,%eax
c0006e72:	01 c0                	add    %eax,%eax
c0006e74:	01 d0                	add    %edx,%eax
c0006e76:	c1 e0 03             	shl    $0x3,%eax
c0006e79:	89 c2                	mov    %eax,%edx
c0006e7b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006e7e:	01 d0                	add    %edx,%eax
c0006e80:	8b 00                	mov    (%eax),%eax
c0006e82:	39 45 08             	cmp    %eax,0x8(%ebp)
c0006e85:	77 08                	ja     c0006e8f <sys_malloc+0xca>
c0006e87:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006e8a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006e8d:	eb 0a                	jmp    c0006e99 <sys_malloc+0xd4>
c0006e8f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006e93:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0006e97:	7e d4                	jle    c0006e6d <sys_malloc+0xa8>
c0006e99:	83 ec 08             	sub    $0x8,%esp
c0006e9c:	ff 75 f0             	pushl  -0x10(%ebp)
c0006e9f:	6a 01                	push   $0x1
c0006ea1:	e8 7d fe ff ff       	call   c0006d23 <alloc_memory>
c0006ea6:	83 c4 10             	add    $0x10,%esp
c0006ea9:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006eac:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006eaf:	89 d0                	mov    %edx,%eax
c0006eb1:	01 c0                	add    %eax,%eax
c0006eb3:	01 d0                	add    %edx,%eax
c0006eb5:	c1 e0 03             	shl    $0x3,%eax
c0006eb8:	89 c2                	mov    %eax,%edx
c0006eba:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ebd:	01 d0                	add    %edx,%eax
c0006ebf:	83 ec 04             	sub    $0x4,%esp
c0006ec2:	6a 18                	push   $0x18
c0006ec4:	50                   	push   %eax
c0006ec5:	ff 75 cc             	pushl  -0x34(%ebp)
c0006ec8:	e8 37 43 00 00       	call   c000b204 <Memcpy>
c0006ecd:	83 c4 10             	add    $0x10,%esp
c0006ed0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006ed3:	89 d0                	mov    %edx,%eax
c0006ed5:	01 c0                	add    %eax,%eax
c0006ed7:	01 d0                	add    %edx,%eax
c0006ed9:	c1 e0 03             	shl    $0x3,%eax
c0006edc:	89 c2                	mov    %eax,%edx
c0006ede:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ee1:	01 d0                	add    %edx,%eax
c0006ee3:	83 c0 08             	add    $0x8,%eax
c0006ee6:	83 ec 0c             	sub    $0xc,%esp
c0006ee9:	50                   	push   %eax
c0006eea:	e8 64 34 00 00       	call   c000a353 <isListEmpty>
c0006eef:	83 c4 10             	add    $0x10,%esp
c0006ef2:	3c 01                	cmp    $0x1,%al
c0006ef4:	0f 85 91 00 00 00    	jne    c0006f8b <sys_malloc+0x1c6>
c0006efa:	83 ec 08             	sub    $0x8,%esp
c0006efd:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f00:	6a 01                	push   $0x1
c0006f02:	e8 1c fe ff ff       	call   c0006d23 <alloc_memory>
c0006f07:	83 c4 10             	add    $0x10,%esp
c0006f0a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006f0d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006f10:	8b 00                	mov    (%eax),%eax
c0006f12:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0006f15:	c7 45 c0 0c 00 00 00 	movl   $0xc,-0x40(%ebp)
c0006f1c:	b8 00 10 00 00       	mov    $0x1000,%eax
c0006f21:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0006f24:	ba 00 00 00 00       	mov    $0x0,%edx
c0006f29:	f7 75 c4             	divl   -0x3c(%ebp)
c0006f2c:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006f2f:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0006f32:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0006f35:	01 d0                	add    %edx,%eax
c0006f37:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0006f3a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0006f41:	eb 3b                	jmp    c0006f7e <sys_malloc+0x1b9>
c0006f43:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006f46:	0f af 45 c4          	imul   -0x3c(%ebp),%eax
c0006f4a:	89 c2                	mov    %eax,%edx
c0006f4c:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006f4f:	01 d0                	add    %edx,%eax
c0006f51:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006f54:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0006f57:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006f5a:	89 d0                	mov    %edx,%eax
c0006f5c:	01 c0                	add    %eax,%eax
c0006f5e:	01 d0                	add    %edx,%eax
c0006f60:	c1 e0 03             	shl    $0x3,%eax
c0006f63:	89 c2                	mov    %eax,%edx
c0006f65:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f68:	01 d0                	add    %edx,%eax
c0006f6a:	83 c0 08             	add    $0x8,%eax
c0006f6d:	83 ec 08             	sub    $0x8,%esp
c0006f70:	51                   	push   %ecx
c0006f71:	50                   	push   %eax
c0006f72:	e8 fd 33 00 00       	call   c000a374 <appendToDoubleLinkList>
c0006f77:	83 c4 10             	add    $0x10,%esp
c0006f7a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0006f7e:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0006f81:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006f84:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006f87:	39 c2                	cmp    %eax,%edx
c0006f89:	77 b8                	ja     c0006f43 <sys_malloc+0x17e>
c0006f8b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006f8e:	89 d0                	mov    %edx,%eax
c0006f90:	01 c0                	add    %eax,%eax
c0006f92:	01 d0                	add    %edx,%eax
c0006f94:	c1 e0 03             	shl    $0x3,%eax
c0006f97:	89 c2                	mov    %eax,%edx
c0006f99:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f9c:	01 d0                	add    %edx,%eax
c0006f9e:	83 c0 08             	add    $0x8,%eax
c0006fa1:	83 ec 0c             	sub    $0xc,%esp
c0006fa4:	50                   	push   %eax
c0006fa5:	e8 50 34 00 00       	call   c000a3fa <popFromDoubleLinkList>
c0006faa:	83 c4 10             	add    $0x10,%esp
c0006fad:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006fb0:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006fb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006fb6:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006fb9:	83 ec 0c             	sub    $0xc,%esp
c0006fbc:	50                   	push   %eax
c0006fbd:	e8 ed fd ff ff       	call   c0006daf <block2arena>
c0006fc2:	83 c4 10             	add    $0x10,%esp
c0006fc5:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006fc8:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006fcb:	8b 40 04             	mov    0x4(%eax),%eax
c0006fce:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006fd1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0006fd4:	89 50 04             	mov    %edx,0x4(%eax)
c0006fd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006fda:	c9                   	leave  
c0006fdb:	c3                   	ret    

c0006fdc <remove_map_entry>:
c0006fdc:	55                   	push   %ebp
c0006fdd:	89 e5                	mov    %esp,%ebp
c0006fdf:	83 ec 10             	sub    $0x10,%esp
c0006fe2:	ff 75 08             	pushl  0x8(%ebp)
c0006fe5:	e8 e5 fb ff ff       	call   c0006bcf <ptr_pte>
c0006fea:	83 c4 04             	add    $0x4,%esp
c0006fed:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ff0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ff3:	8b 10                	mov    (%eax),%edx
c0006ff5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ff8:	89 10                	mov    %edx,(%eax)
c0006ffa:	90                   	nop
c0006ffb:	c9                   	leave  
c0006ffc:	c3                   	ret    

c0006ffd <free_a_page>:
c0006ffd:	55                   	push   %ebp
c0006ffe:	89 e5                	mov    %esp,%ebp
c0007000:	83 ec 20             	sub    $0x20,%esp
c0007003:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007007:	75 21                	jne    c000702a <free_a_page+0x2d>
c0007009:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c000700e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007011:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0007016:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007019:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c000701e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007021:	c7 45 fc 8c 16 01 c0 	movl   $0xc001168c,-0x4(%ebp)
c0007028:	eb 1f                	jmp    c0007049 <free_a_page+0x4c>
c000702a:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c000702f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007032:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0007037:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000703a:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c000703f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007042:	c7 45 fc c4 1e 01 c0 	movl   $0xc0011ec4,-0x4(%ebp)
c0007049:	8b 45 08             	mov    0x8(%ebp),%eax
c000704c:	c1 e8 0c             	shr    $0xc,%eax
c000704f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007052:	6a 00                	push   $0x0
c0007054:	ff 75 f8             	pushl  -0x8(%ebp)
c0007057:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000705a:	50                   	push   %eax
c000705b:	e8 4d f8 ff ff       	call   c00068ad <set_bit_val>
c0007060:	83 c4 0c             	add    $0xc,%esp
c0007063:	ff 75 08             	pushl  0x8(%ebp)
c0007066:	e8 86 fc ff ff       	call   c0006cf1 <get_physical_address>
c000706b:	83 c4 04             	add    $0x4,%esp
c000706e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007071:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007074:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000707a:	85 c0                	test   %eax,%eax
c000707c:	0f 48 c2             	cmovs  %edx,%eax
c000707f:	c1 f8 0c             	sar    $0xc,%eax
c0007082:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007085:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007088:	6a 00                	push   $0x0
c000708a:	ff 75 f0             	pushl  -0x10(%ebp)
c000708d:	50                   	push   %eax
c000708e:	e8 1a f8 ff ff       	call   c00068ad <set_bit_val>
c0007093:	83 c4 0c             	add    $0xc,%esp
c0007096:	ff 75 08             	pushl  0x8(%ebp)
c0007099:	e8 3e ff ff ff       	call   c0006fdc <remove_map_entry>
c000709e:	83 c4 04             	add    $0x4,%esp
c00070a1:	90                   	nop
c00070a2:	c9                   	leave  
c00070a3:	c3                   	ret    

c00070a4 <sys_free>:
c00070a4:	55                   	push   %ebp
c00070a5:	89 e5                	mov    %esp,%ebp
c00070a7:	83 ec 48             	sub    $0x48,%esp
c00070aa:	e8 dd a7 ff ff       	call   c000188c <get_running_thread_pcb>
c00070af:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00070b2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00070b5:	8b 40 04             	mov    0x4(%eax),%eax
c00070b8:	85 c0                	test   %eax,%eax
c00070ba:	75 09                	jne    c00070c5 <sys_free+0x21>
c00070bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00070c3:	eb 07                	jmp    c00070cc <sys_free+0x28>
c00070c5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00070cc:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c00070d3:	76 4d                	jbe    c0007122 <sys_free+0x7e>
c00070d5:	8b 45 08             	mov    0x8(%ebp),%eax
c00070d8:	83 e8 0c             	sub    $0xc,%eax
c00070db:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00070de:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c00070e2:	8b 45 0c             	mov    0xc(%ebp),%eax
c00070e5:	05 ff 0f 00 00       	add    $0xfff,%eax
c00070ea:	c1 e8 0c             	shr    $0xc,%eax
c00070ed:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00070f0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00070f7:	eb 1c                	jmp    c0007115 <sys_free+0x71>
c00070f9:	83 ec 08             	sub    $0x8,%esp
c00070fc:	ff 75 f4             	pushl  -0xc(%ebp)
c00070ff:	ff 75 f0             	pushl  -0x10(%ebp)
c0007102:	e8 f6 fe ff ff       	call   c0006ffd <free_a_page>
c0007107:	83 c4 10             	add    $0x10,%esp
c000710a:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
c0007111:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007115:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007118:	39 45 d8             	cmp    %eax,-0x28(%ebp)
c000711b:	77 dc                	ja     c00070f9 <sys_free+0x55>
c000711d:	e9 ef 00 00 00       	jmp    c0007211 <sys_free+0x16d>
c0007122:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007129:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007130:	eb 24                	jmp    c0007156 <sys_free+0xb2>
c0007132:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007135:	89 d0                	mov    %edx,%eax
c0007137:	01 c0                	add    %eax,%eax
c0007139:	01 d0                	add    %edx,%eax
c000713b:	c1 e0 03             	shl    $0x3,%eax
c000713e:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0007143:	8b 00                	mov    (%eax),%eax
c0007145:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0007148:	77 08                	ja     c0007152 <sys_free+0xae>
c000714a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000714d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007150:	eb 0a                	jmp    c000715c <sys_free+0xb8>
c0007152:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007156:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c000715a:	7e d6                	jle    c0007132 <sys_free+0x8e>
c000715c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000715f:	89 d0                	mov    %edx,%eax
c0007161:	01 c0                	add    %eax,%eax
c0007163:	01 d0                	add    %edx,%eax
c0007165:	c1 e0 03             	shl    $0x3,%eax
c0007168:	05 00 32 08 c0       	add    $0xc0083200,%eax
c000716d:	8b 10                	mov    (%eax),%edx
c000716f:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0007172:	8b 50 04             	mov    0x4(%eax),%edx
c0007175:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0007178:	8b 50 08             	mov    0x8(%eax),%edx
c000717b:	89 55 c0             	mov    %edx,-0x40(%ebp)
c000717e:	8b 50 0c             	mov    0xc(%eax),%edx
c0007181:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0007184:	8b 50 10             	mov    0x10(%eax),%edx
c0007187:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000718a:	8b 40 14             	mov    0x14(%eax),%eax
c000718d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007190:	8b 45 08             	mov    0x8(%ebp),%eax
c0007193:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007196:	83 ec 0c             	sub    $0xc,%esp
c0007199:	ff 75 d4             	pushl  -0x2c(%ebp)
c000719c:	e8 0e fc ff ff       	call   c0006daf <block2arena>
c00071a1:	83 c4 10             	add    $0x10,%esp
c00071a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00071a7:	83 ec 08             	sub    $0x8,%esp
c00071aa:	ff 75 d4             	pushl  -0x2c(%ebp)
c00071ad:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00071b0:	83 c0 08             	add    $0x8,%eax
c00071b3:	50                   	push   %eax
c00071b4:	e8 bb 31 00 00       	call   c000a374 <appendToDoubleLinkList>
c00071b9:	83 c4 10             	add    $0x10,%esp
c00071bc:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071bf:	8b 40 04             	mov    0x4(%eax),%eax
c00071c2:	8d 50 01             	lea    0x1(%eax),%edx
c00071c5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071c8:	89 50 04             	mov    %edx,0x4(%eax)
c00071cb:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00071ce:	8b 50 04             	mov    0x4(%eax),%edx
c00071d1:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00071d4:	39 c2                	cmp    %eax,%edx
c00071d6:	75 39                	jne    c0007211 <sys_free+0x16d>
c00071d8:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00071df:	eb 16                	jmp    c00071f7 <sys_free+0x153>
c00071e1:	83 ec 0c             	sub    $0xc,%esp
c00071e4:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00071e7:	83 c0 08             	add    $0x8,%eax
c00071ea:	50                   	push   %eax
c00071eb:	e8 0a 32 00 00       	call   c000a3fa <popFromDoubleLinkList>
c00071f0:	83 c4 10             	add    $0x10,%esp
c00071f3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00071f7:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00071fa:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c00071fd:	7c e2                	jl     c00071e1 <sys_free+0x13d>
c00071ff:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007202:	83 ec 08             	sub    $0x8,%esp
c0007205:	ff 75 f4             	pushl  -0xc(%ebp)
c0007208:	50                   	push   %eax
c0007209:	e8 ef fd ff ff       	call   c0006ffd <free_a_page>
c000720e:	83 c4 10             	add    $0x10,%esp
c0007211:	90                   	nop
c0007212:	c9                   	leave  
c0007213:	c3                   	ret    

c0007214 <init_memory_block_desc>:
c0007214:	55                   	push   %ebp
c0007215:	89 e5                	mov    %esp,%ebp
c0007217:	83 ec 18             	sub    $0x18,%esp
c000721a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007221:	e9 b2 00 00 00       	jmp    c00072d8 <init_memory_block_desc+0xc4>
c0007226:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000722a:	75 1b                	jne    c0007247 <init_memory_block_desc+0x33>
c000722c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000722f:	89 d0                	mov    %edx,%eax
c0007231:	01 c0                	add    %eax,%eax
c0007233:	01 d0                	add    %edx,%eax
c0007235:	c1 e0 03             	shl    $0x3,%eax
c0007238:	89 c2                	mov    %eax,%edx
c000723a:	8b 45 08             	mov    0x8(%ebp),%eax
c000723d:	01 d0                	add    %edx,%eax
c000723f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0007245:	eb 2e                	jmp    c0007275 <init_memory_block_desc+0x61>
c0007247:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000724a:	89 d0                	mov    %edx,%eax
c000724c:	01 c0                	add    %eax,%eax
c000724e:	01 d0                	add    %edx,%eax
c0007250:	c1 e0 03             	shl    $0x3,%eax
c0007253:	8d 50 e8             	lea    -0x18(%eax),%edx
c0007256:	8b 45 08             	mov    0x8(%ebp),%eax
c0007259:	01 d0                	add    %edx,%eax
c000725b:	8b 08                	mov    (%eax),%ecx
c000725d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007260:	89 d0                	mov    %edx,%eax
c0007262:	01 c0                	add    %eax,%eax
c0007264:	01 d0                	add    %edx,%eax
c0007266:	c1 e0 03             	shl    $0x3,%eax
c0007269:	89 c2                	mov    %eax,%edx
c000726b:	8b 45 08             	mov    0x8(%ebp),%eax
c000726e:	01 d0                	add    %edx,%eax
c0007270:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007273:	89 10                	mov    %edx,(%eax)
c0007275:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007278:	89 d0                	mov    %edx,%eax
c000727a:	01 c0                	add    %eax,%eax
c000727c:	01 d0                	add    %edx,%eax
c000727e:	c1 e0 03             	shl    $0x3,%eax
c0007281:	89 c2                	mov    %eax,%edx
c0007283:	8b 45 08             	mov    0x8(%ebp),%eax
c0007286:	01 d0                	add    %edx,%eax
c0007288:	8b 00                	mov    (%eax),%eax
c000728a:	89 c1                	mov    %eax,%ecx
c000728c:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c0007291:	ba 00 00 00 00       	mov    $0x0,%edx
c0007296:	f7 f1                	div    %ecx
c0007298:	89 c1                	mov    %eax,%ecx
c000729a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000729d:	89 d0                	mov    %edx,%eax
c000729f:	01 c0                	add    %eax,%eax
c00072a1:	01 d0                	add    %edx,%eax
c00072a3:	c1 e0 03             	shl    $0x3,%eax
c00072a6:	89 c2                	mov    %eax,%edx
c00072a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00072ab:	01 d0                	add    %edx,%eax
c00072ad:	89 ca                	mov    %ecx,%edx
c00072af:	89 50 04             	mov    %edx,0x4(%eax)
c00072b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00072b5:	89 d0                	mov    %edx,%eax
c00072b7:	01 c0                	add    %eax,%eax
c00072b9:	01 d0                	add    %edx,%eax
c00072bb:	c1 e0 03             	shl    $0x3,%eax
c00072be:	89 c2                	mov    %eax,%edx
c00072c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00072c3:	01 d0                	add    %edx,%eax
c00072c5:	83 c0 08             	add    $0x8,%eax
c00072c8:	83 ec 0c             	sub    $0xc,%esp
c00072cb:	50                   	push   %eax
c00072cc:	e8 54 30 00 00       	call   c000a325 <initDoubleLinkList>
c00072d1:	83 c4 10             	add    $0x10,%esp
c00072d4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00072d8:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00072dc:	0f 8e 44 ff ff ff    	jle    c0007226 <init_memory_block_desc+0x12>
c00072e2:	90                   	nop
c00072e3:	c9                   	leave  
c00072e4:	c3                   	ret    

c00072e5 <init_memory2>:
c00072e5:	55                   	push   %ebp
c00072e6:	89 e5                	mov    %esp,%ebp
c00072e8:	83 ec 38             	sub    $0x38,%esp
c00072eb:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c00072f2:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c00072f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00072fc:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c0007301:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007304:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0007309:	29 c2                	sub    %eax,%edx
c000730b:	89 d0                	mov    %edx,%eax
c000730d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007310:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007313:	89 c2                	mov    %eax,%edx
c0007315:	c1 ea 1f             	shr    $0x1f,%edx
c0007318:	01 d0                	add    %edx,%eax
c000731a:	d1 f8                	sar    %eax
c000731c:	a3 98 16 01 c0       	mov    %eax,0xc0011698
c0007321:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0007326:	83 ec 0c             	sub    $0xc,%esp
c0007329:	50                   	push   %eax
c000732a:	e8 0f 06 00 00       	call   c000793e <disp_int>
c000732f:	83 c4 10             	add    $0x10,%esp
c0007332:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0007337:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000733a:	29 c2                	sub    %eax,%edx
c000733c:	89 d0                	mov    %edx,%eax
c000733e:	a3 d0 1e 01 c0       	mov    %eax,0xc0011ed0
c0007343:	83 ec 0c             	sub    $0xc,%esp
c0007346:	68 e0 aa 00 c0       	push   $0xc000aae0
c000734b:	e8 3c a2 ff ff       	call   c000158c <disp_str>
c0007350:	83 c4 10             	add    $0x10,%esp
c0007353:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0007358:	83 ec 0c             	sub    $0xc,%esp
c000735b:	50                   	push   %eax
c000735c:	e8 dd 05 00 00       	call   c000793e <disp_int>
c0007361:	83 c4 10             	add    $0x10,%esp
c0007364:	83 ec 0c             	sub    $0xc,%esp
c0007367:	68 e0 aa 00 c0       	push   $0xc000aae0
c000736c:	e8 1b a2 ff ff       	call   c000158c <disp_str>
c0007371:	83 c4 10             	add    $0x10,%esp
c0007374:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0007379:	05 ff 0f 00 00       	add    $0xfff,%eax
c000737e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007384:	85 c0                	test   %eax,%eax
c0007386:	0f 48 c2             	cmovs  %edx,%eax
c0007389:	c1 f8 0c             	sar    $0xc,%eax
c000738c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000738f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007392:	83 c0 07             	add    $0x7,%eax
c0007395:	8d 50 07             	lea    0x7(%eax),%edx
c0007398:	85 c0                	test   %eax,%eax
c000739a:	0f 48 c2             	cmovs  %edx,%eax
c000739d:	c1 f8 03             	sar    $0x3,%eax
c00073a0:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c00073a5:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00073aa:	2d 00 00 00 40       	sub    $0x40000000,%eax
c00073af:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c00073b4:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00073ba:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c00073bf:	83 ec 04             	sub    $0x4,%esp
c00073c2:	52                   	push   %edx
c00073c3:	6a 00                	push   $0x0
c00073c5:	50                   	push   %eax
c00073c6:	e8 67 3e 00 00       	call   c000b232 <Memset>
c00073cb:	83 c4 10             	add    $0x10,%esp
c00073ce:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c00073d3:	05 ff 0f 00 00       	add    $0xfff,%eax
c00073d8:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00073de:	85 c0                	test   %eax,%eax
c00073e0:	0f 48 c2             	cmovs  %edx,%eax
c00073e3:	c1 f8 0c             	sar    $0xc,%eax
c00073e6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00073e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00073ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00073ef:	ff 75 e8             	pushl  -0x18(%ebp)
c00073f2:	6a 01                	push   $0x1
c00073f4:	6a 00                	push   $0x0
c00073f6:	68 8c 16 01 c0       	push   $0xc001168c
c00073fb:	e8 28 f5 ff ff       	call   c0006928 <set_bits>
c0007400:	83 c4 10             	add    $0x10,%esp
c0007403:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0007408:	05 ff 0f 00 00       	add    $0xfff,%eax
c000740d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007413:	85 c0                	test   %eax,%eax
c0007415:	0f 48 c2             	cmovs  %edx,%eax
c0007418:	c1 f8 0c             	sar    $0xc,%eax
c000741b:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000741e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007421:	83 c0 07             	add    $0x7,%eax
c0007424:	8d 50 07             	lea    0x7(%eax),%edx
c0007427:	85 c0                	test   %eax,%eax
c0007429:	0f 48 c2             	cmovs  %edx,%eax
c000742c:	c1 f8 03             	sar    $0x3,%eax
c000742f:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c0007434:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0007439:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c000743f:	01 d0                	add    %edx,%eax
c0007441:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c0007446:	8b 15 c8 1e 01 c0    	mov    0xc0011ec8,%edx
c000744c:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0007451:	83 ec 04             	sub    $0x4,%esp
c0007454:	52                   	push   %edx
c0007455:	6a 00                	push   $0x0
c0007457:	50                   	push   %eax
c0007458:	e8 d5 3d 00 00       	call   c000b232 <Memset>
c000745d:	83 c4 10             	add    $0x10,%esp
c0007460:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0007465:	05 ff 0f 00 00       	add    $0xfff,%eax
c000746a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007470:	85 c0                	test   %eax,%eax
c0007472:	0f 48 c2             	cmovs  %edx,%eax
c0007475:	c1 f8 0c             	sar    $0xc,%eax
c0007478:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000747b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000747e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007481:	ff 75 e8             	pushl  -0x18(%ebp)
c0007484:	6a 01                	push   $0x1
c0007486:	ff 75 e0             	pushl  -0x20(%ebp)
c0007489:	68 8c 16 01 c0       	push   $0xc001168c
c000748e:	e8 95 f4 ff ff       	call   c0006928 <set_bits>
c0007493:	83 c4 10             	add    $0x10,%esp
c0007496:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c000749d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00074a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00074a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074a6:	83 c0 07             	add    $0x7,%eax
c00074a9:	8d 50 07             	lea    0x7(%eax),%edx
c00074ac:	85 c0                	test   %eax,%eax
c00074ae:	0f 48 c2             	cmovs  %edx,%eax
c00074b1:	c1 f8 03             	sar    $0x3,%eax
c00074b4:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c00074b9:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00074be:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00074c4:	01 c2                	add    %eax,%edx
c00074c6:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c00074cb:	01 d0                	add    %edx,%eax
c00074cd:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c00074d2:	8b 15 38 f7 00 c0    	mov    0xc000f738,%edx
c00074d8:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c00074dd:	83 ec 04             	sub    $0x4,%esp
c00074e0:	52                   	push   %edx
c00074e1:	6a 00                	push   $0x0
c00074e3:	50                   	push   %eax
c00074e4:	e8 49 3d 00 00       	call   c000b232 <Memset>
c00074e9:	83 c4 10             	add    $0x10,%esp
c00074ec:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c00074ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00074f2:	01 d0                	add    %edx,%eax
c00074f4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00074f7:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c00074fc:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007501:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007507:	85 c0                	test   %eax,%eax
c0007509:	0f 48 c2             	cmovs  %edx,%eax
c000750c:	c1 f8 0c             	sar    $0xc,%eax
c000750f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007512:	ff 75 e8             	pushl  -0x18(%ebp)
c0007515:	6a 01                	push   $0x1
c0007517:	ff 75 e0             	pushl  -0x20(%ebp)
c000751a:	68 8c 16 01 c0       	push   $0xc001168c
c000751f:	e8 04 f4 ff ff       	call   c0006928 <set_bits>
c0007524:	83 c4 10             	add    $0x10,%esp
c0007527:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000752a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000752d:	01 d0                	add    %edx,%eax
c000752f:	c1 e0 0c             	shl    $0xc,%eax
c0007532:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c0007537:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000753a:	83 c0 02             	add    $0x2,%eax
c000753d:	c1 e0 0c             	shl    $0xc,%eax
c0007540:	89 c2                	mov    %eax,%edx
c0007542:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007545:	01 d0                	add    %edx,%eax
c0007547:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c000754c:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007553:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007556:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007559:	90                   	nop
c000755a:	c9                   	leave  
c000755b:	c3                   	ret    

c000755c <init_memory>:
c000755c:	55                   	push   %ebp
c000755d:	89 e5                	mov    %esp,%ebp
c000755f:	83 ec 38             	sub    $0x38,%esp
c0007562:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0007569:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007570:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007577:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000757a:	05 00 00 10 00       	add    $0x100000,%eax
c000757f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007582:	8b 45 08             	mov    0x8(%ebp),%eax
c0007585:	2b 45 e8             	sub    -0x18(%ebp),%eax
c0007588:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000758e:	85 c0                	test   %eax,%eax
c0007590:	0f 48 c2             	cmovs  %edx,%eax
c0007593:	c1 f8 0c             	sar    $0xc,%eax
c0007596:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007599:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000759c:	89 c2                	mov    %eax,%edx
c000759e:	c1 ea 1f             	shr    $0x1f,%edx
c00075a1:	01 d0                	add    %edx,%eax
c00075a3:	d1 f8                	sar    %eax
c00075a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00075a8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00075ab:	2b 45 e0             	sub    -0x20(%ebp),%eax
c00075ae:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00075b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00075b4:	8d 50 07             	lea    0x7(%eax),%edx
c00075b7:	85 c0                	test   %eax,%eax
c00075b9:	0f 48 c2             	cmovs  %edx,%eax
c00075bc:	c1 f8 03             	sar    $0x3,%eax
c00075bf:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00075c2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00075c5:	8d 50 07             	lea    0x7(%eax),%edx
c00075c8:	85 c0                	test   %eax,%eax
c00075ca:	0f 48 c2             	cmovs  %edx,%eax
c00075cd:	c1 f8 03             	sar    $0x3,%eax
c00075d0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00075d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00075d6:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c00075db:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00075e0:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00075e3:	c1 e2 0c             	shl    $0xc,%edx
c00075e6:	01 d0                	add    %edx,%eax
c00075e8:	a3 cc 1e 01 c0       	mov    %eax,0xc0011ecc
c00075ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00075f0:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c00075f5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00075f8:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c00075fd:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0007602:	83 ec 04             	sub    $0x4,%esp
c0007605:	ff 75 d8             	pushl  -0x28(%ebp)
c0007608:	6a 00                	push   $0x0
c000760a:	50                   	push   %eax
c000760b:	e8 22 3c 00 00       	call   c000b232 <Memset>
c0007610:	83 c4 10             	add    $0x10,%esp
c0007613:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007616:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007619:	01 d0                	add    %edx,%eax
c000761b:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c0007620:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007623:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c0007628:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c000762d:	83 ec 04             	sub    $0x4,%esp
c0007630:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007633:	6a 00                	push   $0x0
c0007635:	50                   	push   %eax
c0007636:	e8 f7 3b 00 00       	call   c000b232 <Memset>
c000763b:	83 c4 10             	add    $0x10,%esp
c000763e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007641:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c0007646:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007649:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000764c:	01 c2                	add    %eax,%edx
c000764e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007651:	01 d0                	add    %edx,%eax
c0007653:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c0007658:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000765b:	05 00 00 10 00       	add    $0x100000,%eax
c0007660:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c0007665:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c000766a:	83 ec 04             	sub    $0x4,%esp
c000766d:	ff 75 d8             	pushl  -0x28(%ebp)
c0007670:	6a 00                	push   $0x0
c0007672:	50                   	push   %eax
c0007673:	e8 ba 3b 00 00       	call   c000b232 <Memset>
c0007678:	83 c4 10             	add    $0x10,%esp
c000767b:	83 ec 0c             	sub    $0xc,%esp
c000767e:	68 00 32 08 c0       	push   $0xc0083200
c0007683:	e8 8c fb ff ff       	call   c0007214 <init_memory_block_desc>
c0007688:	83 c4 10             	add    $0x10,%esp
c000768b:	90                   	nop
c000768c:	c9                   	leave  
c000768d:	c3                   	ret    

c000768e <untar>:
c000768e:	55                   	push   %ebp
c000768f:	89 e5                	mov    %esp,%ebp
c0007691:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c0007697:	83 ec 08             	sub    $0x8,%esp
c000769a:	6a 00                	push   $0x0
c000769c:	ff 75 08             	pushl  0x8(%ebp)
c000769f:	e8 91 e5 ff ff       	call   c0005c35 <open>
c00076a4:	83 c4 10             	add    $0x10,%esp
c00076a7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00076aa:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00076b1:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c00076b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00076bf:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00076c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00076ca:	7e 58                	jle    c0007724 <untar+0x96>
c00076cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00076cf:	05 ff 01 00 00       	add    $0x1ff,%eax
c00076d4:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00076da:	85 c0                	test   %eax,%eax
c00076dc:	0f 48 c2             	cmovs  %edx,%eax
c00076df:	c1 f8 09             	sar    $0x9,%eax
c00076e2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00076e5:	83 ec 04             	sub    $0x4,%esp
c00076e8:	68 00 20 00 00       	push   $0x2000
c00076ed:	6a 00                	push   $0x0
c00076ef:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c00076f5:	50                   	push   %eax
c00076f6:	e8 37 3b 00 00       	call   c000b232 <Memset>
c00076fb:	83 c4 10             	add    $0x10,%esp
c00076fe:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007701:	c1 e0 09             	shl    $0x9,%eax
c0007704:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007707:	83 ec 04             	sub    $0x4,%esp
c000770a:	50                   	push   %eax
c000770b:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007711:	50                   	push   %eax
c0007712:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007715:	e8 a0 e5 ff ff       	call   c0005cba <read>
c000771a:	83 c4 10             	add    $0x10,%esp
c000771d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007724:	83 ec 04             	sub    $0x4,%esp
c0007727:	68 00 20 00 00       	push   $0x2000
c000772c:	6a 00                	push   $0x0
c000772e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007734:	50                   	push   %eax
c0007735:	e8 f8 3a 00 00       	call   c000b232 <Memset>
c000773a:	83 c4 10             	add    $0x10,%esp
c000773d:	83 ec 04             	sub    $0x4,%esp
c0007740:	68 00 02 00 00       	push   $0x200
c0007745:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000774b:	50                   	push   %eax
c000774c:	ff 75 e4             	pushl  -0x1c(%ebp)
c000774f:	e8 66 e5 ff ff       	call   c0005cba <read>
c0007754:	83 c4 10             	add    $0x10,%esp
c0007757:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000775a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c000775e:	0f 84 1f 01 00 00    	je     c0007883 <untar+0x1f5>
c0007764:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007767:	01 45 f4             	add    %eax,-0xc(%ebp)
c000776a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007771:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007777:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000777a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000777d:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007780:	83 ec 08             	sub    $0x8,%esp
c0007783:	6a 07                	push   $0x7
c0007785:	ff 75 cc             	pushl  -0x34(%ebp)
c0007788:	e8 a8 e4 ff ff       	call   c0005c35 <open>
c000778d:	83 c4 10             	add    $0x10,%esp
c0007790:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007793:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000779a:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000779d:	83 c0 7c             	add    $0x7c,%eax
c00077a0:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00077a3:	83 ec 0c             	sub    $0xc,%esp
c00077a6:	ff 75 cc             	pushl  -0x34(%ebp)
c00077a9:	e8 bd 3a 00 00       	call   c000b26b <Strlen>
c00077ae:	83 c4 10             	add    $0x10,%esp
c00077b1:	85 c0                	test   %eax,%eax
c00077b3:	75 16                	jne    c00077cb <untar+0x13d>
c00077b5:	83 ec 0c             	sub    $0xc,%esp
c00077b8:	ff 75 c4             	pushl  -0x3c(%ebp)
c00077bb:	e8 ab 3a 00 00       	call   c000b26b <Strlen>
c00077c0:	83 c4 10             	add    $0x10,%esp
c00077c3:	85 c0                	test   %eax,%eax
c00077c5:	0f 84 bb 00 00 00    	je     c0007886 <untar+0x1f8>
c00077cb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00077ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00077d1:	eb 1f                	jmp    c00077f2 <untar+0x164>
c00077d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00077d6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00077dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077e0:	0f b6 00             	movzbl (%eax),%eax
c00077e3:	0f be c0             	movsbl %al,%eax
c00077e6:	83 e8 30             	sub    $0x30,%eax
c00077e9:	01 d0                	add    %edx,%eax
c00077eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00077ee:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00077f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00077f5:	0f b6 00             	movzbl (%eax),%eax
c00077f8:	84 c0                	test   %al,%al
c00077fa:	75 d7                	jne    c00077d3 <untar+0x145>
c00077fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00077ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007802:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c0007809:	eb 5f                	jmp    c000786a <untar+0x1dc>
c000780b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000780e:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0007811:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0007815:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007818:	83 ec 04             	sub    $0x4,%esp
c000781b:	68 00 02 00 00       	push   $0x200
c0007820:	6a 00                	push   $0x0
c0007822:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007828:	50                   	push   %eax
c0007829:	e8 04 3a 00 00       	call   c000b232 <Memset>
c000782e:	83 c4 10             	add    $0x10,%esp
c0007831:	83 ec 04             	sub    $0x4,%esp
c0007834:	ff 75 bc             	pushl  -0x44(%ebp)
c0007837:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000783d:	50                   	push   %eax
c000783e:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007841:	e8 74 e4 ff ff       	call   c0005cba <read>
c0007846:	83 c4 10             	add    $0x10,%esp
c0007849:	01 45 f4             	add    %eax,-0xc(%ebp)
c000784c:	83 ec 04             	sub    $0x4,%esp
c000784f:	ff 75 bc             	pushl  -0x44(%ebp)
c0007852:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007858:	50                   	push   %eax
c0007859:	ff 75 c8             	pushl  -0x38(%ebp)
c000785c:	e8 cd e4 ff ff       	call   c0005d2e <write>
c0007861:	83 c4 10             	add    $0x10,%esp
c0007864:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007867:	29 45 e8             	sub    %eax,-0x18(%ebp)
c000786a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000786e:	75 9b                	jne    c000780b <untar+0x17d>
c0007870:	83 ec 0c             	sub    $0xc,%esp
c0007873:	ff 75 c8             	pushl  -0x38(%ebp)
c0007876:	e8 38 e5 ff ff       	call   c0005db3 <close>
c000787b:	83 c4 10             	add    $0x10,%esp
c000787e:	e9 43 fe ff ff       	jmp    c00076c6 <untar+0x38>
c0007883:	90                   	nop
c0007884:	eb 01                	jmp    c0007887 <untar+0x1f9>
c0007886:	90                   	nop
c0007887:	83 ec 0c             	sub    $0xc,%esp
c000788a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000788d:	e8 21 e5 ff ff       	call   c0005db3 <close>
c0007892:	83 c4 10             	add    $0x10,%esp
c0007895:	90                   	nop
c0007896:	c9                   	leave  
c0007897:	c3                   	ret    

c0007898 <atoi>:
c0007898:	55                   	push   %ebp
c0007899:	89 e5                	mov    %esp,%ebp
c000789b:	83 ec 10             	sub    $0x10,%esp
c000789e:	8b 45 08             	mov    0x8(%ebp),%eax
c00078a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00078a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00078a7:	8d 50 01             	lea    0x1(%eax),%edx
c00078aa:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00078ad:	c6 00 30             	movb   $0x30,(%eax)
c00078b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00078b3:	8d 50 01             	lea    0x1(%eax),%edx
c00078b6:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00078b9:	c6 00 78             	movb   $0x78,(%eax)
c00078bc:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c00078c0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00078c4:	75 0e                	jne    c00078d4 <atoi+0x3c>
c00078c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00078c9:	8d 50 01             	lea    0x1(%eax),%edx
c00078cc:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00078cf:	c6 00 30             	movb   $0x30,(%eax)
c00078d2:	eb 61                	jmp    c0007935 <atoi+0x9d>
c00078d4:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c00078db:	eb 52                	jmp    c000792f <atoi+0x97>
c00078dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00078e0:	8b 55 0c             	mov    0xc(%ebp),%edx
c00078e3:	89 c1                	mov    %eax,%ecx
c00078e5:	d3 fa                	sar    %cl,%edx
c00078e7:	89 d0                	mov    %edx,%eax
c00078e9:	83 e0 0f             	and    $0xf,%eax
c00078ec:	88 45 fb             	mov    %al,-0x5(%ebp)
c00078ef:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c00078f3:	75 06                	jne    c00078fb <atoi+0x63>
c00078f5:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c00078f9:	74 2f                	je     c000792a <atoi+0x92>
c00078fb:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c00078ff:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007903:	83 c0 30             	add    $0x30,%eax
c0007906:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007909:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c000790d:	7e 0a                	jle    c0007919 <atoi+0x81>
c000790f:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007913:	83 c0 07             	add    $0x7,%eax
c0007916:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007919:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000791c:	8d 50 01             	lea    0x1(%eax),%edx
c000791f:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007922:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007926:	88 10                	mov    %dl,(%eax)
c0007928:	eb 01                	jmp    c000792b <atoi+0x93>
c000792a:	90                   	nop
c000792b:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c000792f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007933:	79 a8                	jns    c00078dd <atoi+0x45>
c0007935:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007938:	c6 00 00             	movb   $0x0,(%eax)
c000793b:	90                   	nop
c000793c:	c9                   	leave  
c000793d:	c3                   	ret    

c000793e <disp_int>:
c000793e:	55                   	push   %ebp
c000793f:	89 e5                	mov    %esp,%ebp
c0007941:	83 ec 18             	sub    $0x18,%esp
c0007944:	ff 75 08             	pushl  0x8(%ebp)
c0007947:	8d 45 ee             	lea    -0x12(%ebp),%eax
c000794a:	50                   	push   %eax
c000794b:	e8 48 ff ff ff       	call   c0007898 <atoi>
c0007950:	83 c4 08             	add    $0x8,%esp
c0007953:	83 ec 08             	sub    $0x8,%esp
c0007956:	6a 0b                	push   $0xb
c0007958:	8d 45 ee             	lea    -0x12(%ebp),%eax
c000795b:	50                   	push   %eax
c000795c:	e8 66 9c ff ff       	call   c00015c7 <disp_str_colour>
c0007961:	83 c4 10             	add    $0x10,%esp
c0007964:	90                   	nop
c0007965:	c9                   	leave  
c0007966:	c3                   	ret    

c0007967 <do_page_fault>:
c0007967:	55                   	push   %ebp
c0007968:	89 e5                	mov    %esp,%ebp
c000796a:	83 ec 28             	sub    $0x28,%esp
c000796d:	0f 20 d0             	mov    %cr2,%eax
c0007970:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007973:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c000797a:	00 00 00 
c000797d:	83 ec 0c             	sub    $0xc,%esp
c0007980:	68 00 ab 00 c0       	push   $0xc000ab00
c0007985:	e8 02 9c ff ff       	call   c000158c <disp_str>
c000798a:	83 c4 10             	add    $0x10,%esp
c000798d:	83 ec 0c             	sub    $0xc,%esp
c0007990:	68 0f ab 00 c0       	push   $0xc000ab0f
c0007995:	e8 f2 9b ff ff       	call   c000158c <disp_str>
c000799a:	83 c4 10             	add    $0x10,%esp
c000799d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00079a0:	83 ec 0c             	sub    $0xc,%esp
c00079a3:	50                   	push   %eax
c00079a4:	e8 95 ff ff ff       	call   c000793e <disp_int>
c00079a9:	83 c4 10             	add    $0x10,%esp
c00079ac:	83 ec 0c             	sub    $0xc,%esp
c00079af:	68 14 ab 00 c0       	push   $0xc000ab14
c00079b4:	e8 d3 9b ff ff       	call   c000158c <disp_str>
c00079b9:	83 c4 10             	add    $0x10,%esp
c00079bc:	83 ec 0c             	sub    $0xc,%esp
c00079bf:	ff 75 f4             	pushl  -0xc(%ebp)
c00079c2:	e8 f5 f1 ff ff       	call   c0006bbc <ptr_pde>
c00079c7:	83 c4 10             	add    $0x10,%esp
c00079ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00079cd:	83 ec 0c             	sub    $0xc,%esp
c00079d0:	ff 75 f4             	pushl  -0xc(%ebp)
c00079d3:	e8 f7 f1 ff ff       	call   c0006bcf <ptr_pte>
c00079d8:	83 c4 10             	add    $0x10,%esp
c00079db:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00079de:	83 ec 0c             	sub    $0xc,%esp
c00079e1:	68 16 ab 00 c0       	push   $0xc000ab16
c00079e6:	e8 a1 9b ff ff       	call   c000158c <disp_str>
c00079eb:	83 c4 10             	add    $0x10,%esp
c00079ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00079f1:	83 ec 0c             	sub    $0xc,%esp
c00079f4:	50                   	push   %eax
c00079f5:	e8 44 ff ff ff       	call   c000793e <disp_int>
c00079fa:	83 c4 10             	add    $0x10,%esp
c00079fd:	83 ec 0c             	sub    $0xc,%esp
c0007a00:	68 1b ab 00 c0       	push   $0xc000ab1b
c0007a05:	e8 82 9b ff ff       	call   c000158c <disp_str>
c0007a0a:	83 c4 10             	add    $0x10,%esp
c0007a0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007a10:	8b 00                	mov    (%eax),%eax
c0007a12:	83 ec 0c             	sub    $0xc,%esp
c0007a15:	50                   	push   %eax
c0007a16:	e8 23 ff ff ff       	call   c000793e <disp_int>
c0007a1b:	83 c4 10             	add    $0x10,%esp
c0007a1e:	83 ec 0c             	sub    $0xc,%esp
c0007a21:	68 14 ab 00 c0       	push   $0xc000ab14
c0007a26:	e8 61 9b ff ff       	call   c000158c <disp_str>
c0007a2b:	83 c4 10             	add    $0x10,%esp
c0007a2e:	83 ec 0c             	sub    $0xc,%esp
c0007a31:	68 24 ab 00 c0       	push   $0xc000ab24
c0007a36:	e8 51 9b ff ff       	call   c000158c <disp_str>
c0007a3b:	83 c4 10             	add    $0x10,%esp
c0007a3e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a41:	83 ec 0c             	sub    $0xc,%esp
c0007a44:	50                   	push   %eax
c0007a45:	e8 f4 fe ff ff       	call   c000793e <disp_int>
c0007a4a:	83 c4 10             	add    $0x10,%esp
c0007a4d:	83 ec 0c             	sub    $0xc,%esp
c0007a50:	68 29 ab 00 c0       	push   $0xc000ab29
c0007a55:	e8 32 9b ff ff       	call   c000158c <disp_str>
c0007a5a:	83 c4 10             	add    $0x10,%esp
c0007a5d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a60:	8b 00                	mov    (%eax),%eax
c0007a62:	83 ec 0c             	sub    $0xc,%esp
c0007a65:	50                   	push   %eax
c0007a66:	e8 d3 fe ff ff       	call   c000793e <disp_int>
c0007a6b:	83 c4 10             	add    $0x10,%esp
c0007a6e:	83 ec 0c             	sub    $0xc,%esp
c0007a71:	68 14 ab 00 c0       	push   $0xc000ab14
c0007a76:	e8 11 9b ff ff       	call   c000158c <disp_str>
c0007a7b:	83 c4 10             	add    $0x10,%esp
c0007a7e:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007a85:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007a88:	8b 00                	mov    (%eax),%eax
c0007a8a:	83 e0 01             	and    $0x1,%eax
c0007a8d:	85 c0                	test   %eax,%eax
c0007a8f:	74 09                	je     c0007a9a <do_page_fault+0x133>
c0007a91:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007a98:	eb 07                	jmp    c0007aa1 <do_page_fault+0x13a>
c0007a9a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007aa1:	90                   	nop
c0007aa2:	c9                   	leave  
c0007aa3:	c3                   	ret    

c0007aa4 <exception_handler>:
c0007aa4:	55                   	push   %ebp
c0007aa5:	89 e5                	mov    %esp,%ebp
c0007aa7:	57                   	push   %edi
c0007aa8:	56                   	push   %esi
c0007aa9:	53                   	push   %ebx
c0007aaa:	83 ec 6c             	sub    $0x6c,%esp
c0007aad:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007ab0:	bb a0 ad 00 c0       	mov    $0xc000ada0,%ebx
c0007ab5:	ba 13 00 00 00       	mov    $0x13,%edx
c0007aba:	89 c7                	mov    %eax,%edi
c0007abc:	89 de                	mov    %ebx,%esi
c0007abe:	89 d1                	mov    %edx,%ecx
c0007ac0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007ac2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007ac9:	eb 04                	jmp    c0007acf <exception_handler+0x2b>
c0007acb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007acf:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007ad6:	7e f3                	jle    c0007acb <exception_handler+0x27>
c0007ad8:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0007adf:	00 00 00 
c0007ae2:	83 ec 0c             	sub    $0xc,%esp
c0007ae5:	68 32 ab 00 c0       	push   $0xc000ab32
c0007aea:	e8 9d 9a ff ff       	call   c000158c <disp_str>
c0007aef:	83 c4 10             	add    $0x10,%esp
c0007af2:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007af9:	8b 45 08             	mov    0x8(%ebp),%eax
c0007afc:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0007b00:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007b03:	83 ec 0c             	sub    $0xc,%esp
c0007b06:	ff 75 dc             	pushl  -0x24(%ebp)
c0007b09:	e8 7e 9a ff ff       	call   c000158c <disp_str>
c0007b0e:	83 c4 10             	add    $0x10,%esp
c0007b11:	83 ec 0c             	sub    $0xc,%esp
c0007b14:	68 40 ab 00 c0       	push   $0xc000ab40
c0007b19:	e8 6e 9a ff ff       	call   c000158c <disp_str>
c0007b1e:	83 c4 10             	add    $0x10,%esp
c0007b21:	83 ec 0c             	sub    $0xc,%esp
c0007b24:	68 43 ab 00 c0       	push   $0xc000ab43
c0007b29:	e8 5e 9a ff ff       	call   c000158c <disp_str>
c0007b2e:	83 c4 10             	add    $0x10,%esp
c0007b31:	8b 45 08             	mov    0x8(%ebp),%eax
c0007b34:	83 ec 0c             	sub    $0xc,%esp
c0007b37:	50                   	push   %eax
c0007b38:	e8 01 fe ff ff       	call   c000793e <disp_int>
c0007b3d:	83 c4 10             	add    $0x10,%esp
c0007b40:	83 ec 0c             	sub    $0xc,%esp
c0007b43:	68 40 ab 00 c0       	push   $0xc000ab40
c0007b48:	e8 3f 9a ff ff       	call   c000158c <disp_str>
c0007b4d:	83 c4 10             	add    $0x10,%esp
c0007b50:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007b54:	74 2f                	je     c0007b85 <exception_handler+0xe1>
c0007b56:	83 ec 0c             	sub    $0xc,%esp
c0007b59:	68 4b ab 00 c0       	push   $0xc000ab4b
c0007b5e:	e8 29 9a ff ff       	call   c000158c <disp_str>
c0007b63:	83 c4 10             	add    $0x10,%esp
c0007b66:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007b69:	83 ec 0c             	sub    $0xc,%esp
c0007b6c:	50                   	push   %eax
c0007b6d:	e8 cc fd ff ff       	call   c000793e <disp_int>
c0007b72:	83 c4 10             	add    $0x10,%esp
c0007b75:	83 ec 0c             	sub    $0xc,%esp
c0007b78:	68 40 ab 00 c0       	push   $0xc000ab40
c0007b7d:	e8 0a 9a ff ff       	call   c000158c <disp_str>
c0007b82:	83 c4 10             	add    $0x10,%esp
c0007b85:	83 ec 0c             	sub    $0xc,%esp
c0007b88:	68 55 ab 00 c0       	push   $0xc000ab55
c0007b8d:	e8 fa 99 ff ff       	call   c000158c <disp_str>
c0007b92:	83 c4 10             	add    $0x10,%esp
c0007b95:	83 ec 0c             	sub    $0xc,%esp
c0007b98:	ff 75 14             	pushl  0x14(%ebp)
c0007b9b:	e8 9e fd ff ff       	call   c000793e <disp_int>
c0007ba0:	83 c4 10             	add    $0x10,%esp
c0007ba3:	83 ec 0c             	sub    $0xc,%esp
c0007ba6:	68 40 ab 00 c0       	push   $0xc000ab40
c0007bab:	e8 dc 99 ff ff       	call   c000158c <disp_str>
c0007bb0:	83 c4 10             	add    $0x10,%esp
c0007bb3:	83 ec 0c             	sub    $0xc,%esp
c0007bb6:	68 59 ab 00 c0       	push   $0xc000ab59
c0007bbb:	e8 cc 99 ff ff       	call   c000158c <disp_str>
c0007bc0:	83 c4 10             	add    $0x10,%esp
c0007bc3:	8b 45 10             	mov    0x10(%ebp),%eax
c0007bc6:	83 ec 0c             	sub    $0xc,%esp
c0007bc9:	50                   	push   %eax
c0007bca:	e8 6f fd ff ff       	call   c000793e <disp_int>
c0007bcf:	83 c4 10             	add    $0x10,%esp
c0007bd2:	83 ec 0c             	sub    $0xc,%esp
c0007bd5:	68 40 ab 00 c0       	push   $0xc000ab40
c0007bda:	e8 ad 99 ff ff       	call   c000158c <disp_str>
c0007bdf:	83 c4 10             	add    $0x10,%esp
c0007be2:	83 ec 0c             	sub    $0xc,%esp
c0007be5:	68 5e ab 00 c0       	push   $0xc000ab5e
c0007bea:	e8 9d 99 ff ff       	call   c000158c <disp_str>
c0007bef:	83 c4 10             	add    $0x10,%esp
c0007bf2:	83 ec 0c             	sub    $0xc,%esp
c0007bf5:	ff 75 18             	pushl  0x18(%ebp)
c0007bf8:	e8 41 fd ff ff       	call   c000793e <disp_int>
c0007bfd:	83 c4 10             	add    $0x10,%esp
c0007c00:	83 ec 0c             	sub    $0xc,%esp
c0007c03:	68 40 ab 00 c0       	push   $0xc000ab40
c0007c08:	e8 7f 99 ff ff       	call   c000158c <disp_str>
c0007c0d:	83 c4 10             	add    $0x10,%esp
c0007c10:	83 ec 0c             	sub    $0xc,%esp
c0007c13:	68 68 ab 00 c0       	push   $0xc000ab68
c0007c18:	e8 6f 99 ff ff       	call   c000158c <disp_str>
c0007c1d:	83 c4 10             	add    $0x10,%esp
c0007c20:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0007c24:	75 46                	jne    c0007c6c <exception_handler+0x1c8>
c0007c26:	0f 20 d0             	mov    %cr2,%eax
c0007c29:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007c2c:	83 ec 0c             	sub    $0xc,%esp
c0007c2f:	68 87 ab 00 c0       	push   $0xc000ab87
c0007c34:	e8 53 99 ff ff       	call   c000158c <disp_str>
c0007c39:	83 c4 10             	add    $0x10,%esp
c0007c3c:	83 ec 0c             	sub    $0xc,%esp
c0007c3f:	68 0f ab 00 c0       	push   $0xc000ab0f
c0007c44:	e8 43 99 ff ff       	call   c000158c <disp_str>
c0007c49:	83 c4 10             	add    $0x10,%esp
c0007c4c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007c4f:	83 ec 0c             	sub    $0xc,%esp
c0007c52:	50                   	push   %eax
c0007c53:	e8 e6 fc ff ff       	call   c000793e <disp_int>
c0007c58:	83 c4 10             	add    $0x10,%esp
c0007c5b:	83 ec 0c             	sub    $0xc,%esp
c0007c5e:	68 14 ab 00 c0       	push   $0xc000ab14
c0007c63:	e8 24 99 ff ff       	call   c000158c <disp_str>
c0007c68:	83 c4 10             	add    $0x10,%esp
c0007c6b:	90                   	nop
c0007c6c:	90                   	nop
c0007c6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007c70:	5b                   	pop    %ebx
c0007c71:	5e                   	pop    %esi
c0007c72:	5f                   	pop    %edi
c0007c73:	5d                   	pop    %ebp
c0007c74:	c3                   	ret    

c0007c75 <exception_handler2>:
c0007c75:	55                   	push   %ebp
c0007c76:	89 e5                	mov    %esp,%ebp
c0007c78:	57                   	push   %edi
c0007c79:	56                   	push   %esi
c0007c7a:	53                   	push   %ebx
c0007c7b:	83 ec 6c             	sub    $0x6c,%esp
c0007c7e:	8d 45 90             	lea    -0x70(%ebp),%eax
c0007c81:	bb a0 ad 00 c0       	mov    $0xc000ada0,%ebx
c0007c86:	ba 13 00 00 00       	mov    $0x13,%edx
c0007c8b:	89 c7                	mov    %eax,%edi
c0007c8d:	89 de                	mov    %ebx,%esi
c0007c8f:	89 d1                	mov    %edx,%ecx
c0007c91:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007c93:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007c9a:	2e 00 00 
c0007c9d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007ca4:	eb 14                	jmp    c0007cba <exception_handler2+0x45>
c0007ca6:	83 ec 0c             	sub    $0xc,%esp
c0007ca9:	68 ec ad 00 c0       	push   $0xc000adec
c0007cae:	e8 d9 98 ff ff       	call   c000158c <disp_str>
c0007cb3:	83 c4 10             	add    $0x10,%esp
c0007cb6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007cba:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007cc1:	7e e3                	jle    c0007ca6 <exception_handler2+0x31>
c0007cc3:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007cca:	2e 00 00 
c0007ccd:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007cd4:	8b 45 08             	mov    0x8(%ebp),%eax
c0007cd7:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0007cdb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007cde:	83 ec 08             	sub    $0x8,%esp
c0007ce1:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ce4:	ff 75 dc             	pushl  -0x24(%ebp)
c0007ce7:	e8 db 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007cec:	83 c4 10             	add    $0x10,%esp
c0007cef:	83 ec 0c             	sub    $0xc,%esp
c0007cf2:	68 40 ab 00 c0       	push   $0xc000ab40
c0007cf7:	e8 90 98 ff ff       	call   c000158c <disp_str>
c0007cfc:	83 c4 10             	add    $0x10,%esp
c0007cff:	83 ec 08             	sub    $0x8,%esp
c0007d02:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d05:	68 43 ab 00 c0       	push   $0xc000ab43
c0007d0a:	e8 b8 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007d0f:	83 c4 10             	add    $0x10,%esp
c0007d12:	83 ec 0c             	sub    $0xc,%esp
c0007d15:	ff 75 08             	pushl  0x8(%ebp)
c0007d18:	e8 21 fc ff ff       	call   c000793e <disp_int>
c0007d1d:	83 c4 10             	add    $0x10,%esp
c0007d20:	83 ec 0c             	sub    $0xc,%esp
c0007d23:	68 40 ab 00 c0       	push   $0xc000ab40
c0007d28:	e8 5f 98 ff ff       	call   c000158c <disp_str>
c0007d2d:	83 c4 10             	add    $0x10,%esp
c0007d30:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007d34:	74 44                	je     c0007d7a <exception_handler2+0x105>
c0007d36:	83 ec 08             	sub    $0x8,%esp
c0007d39:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d3c:	68 4b ab 00 c0       	push   $0xc000ab4b
c0007d41:	e8 81 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007d46:	83 c4 10             	add    $0x10,%esp
c0007d49:	83 ec 08             	sub    $0x8,%esp
c0007d4c:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d4f:	68 4b ab 00 c0       	push   $0xc000ab4b
c0007d54:	e8 6e 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007d59:	83 c4 10             	add    $0x10,%esp
c0007d5c:	83 ec 0c             	sub    $0xc,%esp
c0007d5f:	ff 75 0c             	pushl  0xc(%ebp)
c0007d62:	e8 d7 fb ff ff       	call   c000793e <disp_int>
c0007d67:	83 c4 10             	add    $0x10,%esp
c0007d6a:	83 ec 0c             	sub    $0xc,%esp
c0007d6d:	68 40 ab 00 c0       	push   $0xc000ab40
c0007d72:	e8 15 98 ff ff       	call   c000158c <disp_str>
c0007d77:	83 c4 10             	add    $0x10,%esp
c0007d7a:	83 ec 08             	sub    $0x8,%esp
c0007d7d:	ff 75 e0             	pushl  -0x20(%ebp)
c0007d80:	68 55 ab 00 c0       	push   $0xc000ab55
c0007d85:	e8 3d 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007d8a:	83 c4 10             	add    $0x10,%esp
c0007d8d:	83 ec 0c             	sub    $0xc,%esp
c0007d90:	ff 75 14             	pushl  0x14(%ebp)
c0007d93:	e8 a6 fb ff ff       	call   c000793e <disp_int>
c0007d98:	83 c4 10             	add    $0x10,%esp
c0007d9b:	83 ec 0c             	sub    $0xc,%esp
c0007d9e:	68 40 ab 00 c0       	push   $0xc000ab40
c0007da3:	e8 e4 97 ff ff       	call   c000158c <disp_str>
c0007da8:	83 c4 10             	add    $0x10,%esp
c0007dab:	83 ec 08             	sub    $0x8,%esp
c0007dae:	ff 75 e0             	pushl  -0x20(%ebp)
c0007db1:	68 59 ab 00 c0       	push   $0xc000ab59
c0007db6:	e8 0c 98 ff ff       	call   c00015c7 <disp_str_colour>
c0007dbb:	83 c4 10             	add    $0x10,%esp
c0007dbe:	83 ec 0c             	sub    $0xc,%esp
c0007dc1:	ff 75 10             	pushl  0x10(%ebp)
c0007dc4:	e8 75 fb ff ff       	call   c000793e <disp_int>
c0007dc9:	83 c4 10             	add    $0x10,%esp
c0007dcc:	83 ec 0c             	sub    $0xc,%esp
c0007dcf:	68 40 ab 00 c0       	push   $0xc000ab40
c0007dd4:	e8 b3 97 ff ff       	call   c000158c <disp_str>
c0007dd9:	83 c4 10             	add    $0x10,%esp
c0007ddc:	83 ec 08             	sub    $0x8,%esp
c0007ddf:	ff 75 e0             	pushl  -0x20(%ebp)
c0007de2:	68 5e ab 00 c0       	push   $0xc000ab5e
c0007de7:	e8 db 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007dec:	83 c4 10             	add    $0x10,%esp
c0007def:	83 ec 0c             	sub    $0xc,%esp
c0007df2:	ff 75 18             	pushl  0x18(%ebp)
c0007df5:	e8 44 fb ff ff       	call   c000793e <disp_int>
c0007dfa:	83 c4 10             	add    $0x10,%esp
c0007dfd:	83 ec 0c             	sub    $0xc,%esp
c0007e00:	68 40 ab 00 c0       	push   $0xc000ab40
c0007e05:	e8 82 97 ff ff       	call   c000158c <disp_str>
c0007e0a:	83 c4 10             	add    $0x10,%esp
c0007e0d:	90                   	nop
c0007e0e:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007e11:	5b                   	pop    %ebx
c0007e12:	5e                   	pop    %esi
c0007e13:	5f                   	pop    %edi
c0007e14:	5d                   	pop    %ebp
c0007e15:	c3                   	ret    

c0007e16 <init_internal_interrupt>:
c0007e16:	55                   	push   %ebp
c0007e17:	89 e5                	mov    %esp,%ebp
c0007e19:	83 ec 08             	sub    $0x8,%esp
c0007e1c:	6a 0e                	push   $0xe
c0007e1e:	6a 08                	push   $0x8
c0007e20:	68 03 16 00 c0       	push   $0xc0001603
c0007e25:	6a 00                	push   $0x0
c0007e27:	e8 64 ce ff ff       	call   c0004c90 <InitInterruptDesc>
c0007e2c:	83 c4 10             	add    $0x10,%esp
c0007e2f:	6a 0e                	push   $0xe
c0007e31:	6a 08                	push   $0x8
c0007e33:	68 09 16 00 c0       	push   $0xc0001609
c0007e38:	6a 01                	push   $0x1
c0007e3a:	e8 51 ce ff ff       	call   c0004c90 <InitInterruptDesc>
c0007e3f:	83 c4 10             	add    $0x10,%esp
c0007e42:	6a 0e                	push   $0xe
c0007e44:	6a 08                	push   $0x8
c0007e46:	68 0f 16 00 c0       	push   $0xc000160f
c0007e4b:	6a 02                	push   $0x2
c0007e4d:	e8 3e ce ff ff       	call   c0004c90 <InitInterruptDesc>
c0007e52:	83 c4 10             	add    $0x10,%esp
c0007e55:	6a 0e                	push   $0xe
c0007e57:	6a 08                	push   $0x8
c0007e59:	68 15 16 00 c0       	push   $0xc0001615
c0007e5e:	6a 03                	push   $0x3
c0007e60:	e8 2b ce ff ff       	call   c0004c90 <InitInterruptDesc>
c0007e65:	83 c4 10             	add    $0x10,%esp
c0007e68:	6a 0e                	push   $0xe
c0007e6a:	6a 08                	push   $0x8
c0007e6c:	68 1b 16 00 c0       	push   $0xc000161b
c0007e71:	6a 04                	push   $0x4
c0007e73:	e8 18 ce ff ff       	call   c0004c90 <InitInterruptDesc>
c0007e78:	83 c4 10             	add    $0x10,%esp
c0007e7b:	6a 0e                	push   $0xe
c0007e7d:	6a 08                	push   $0x8
c0007e7f:	68 21 16 00 c0       	push   $0xc0001621
c0007e84:	6a 05                	push   $0x5
c0007e86:	e8 05 ce ff ff       	call   c0004c90 <InitInterruptDesc>
c0007e8b:	83 c4 10             	add    $0x10,%esp
c0007e8e:	6a 0e                	push   $0xe
c0007e90:	6a 08                	push   $0x8
c0007e92:	68 27 16 00 c0       	push   $0xc0001627
c0007e97:	6a 06                	push   $0x6
c0007e99:	e8 f2 cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007e9e:	83 c4 10             	add    $0x10,%esp
c0007ea1:	6a 0e                	push   $0xe
c0007ea3:	6a 08                	push   $0x8
c0007ea5:	68 2d 16 00 c0       	push   $0xc000162d
c0007eaa:	6a 07                	push   $0x7
c0007eac:	e8 df cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007eb1:	83 c4 10             	add    $0x10,%esp
c0007eb4:	6a 0e                	push   $0xe
c0007eb6:	6a 08                	push   $0x8
c0007eb8:	68 33 16 00 c0       	push   $0xc0001633
c0007ebd:	6a 08                	push   $0x8
c0007ebf:	e8 cc cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007ec4:	83 c4 10             	add    $0x10,%esp
c0007ec7:	6a 0e                	push   $0xe
c0007ec9:	6a 08                	push   $0x8
c0007ecb:	68 37 16 00 c0       	push   $0xc0001637
c0007ed0:	6a 09                	push   $0x9
c0007ed2:	e8 b9 cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007ed7:	83 c4 10             	add    $0x10,%esp
c0007eda:	6a 0e                	push   $0xe
c0007edc:	6a 08                	push   $0x8
c0007ede:	68 3d 16 00 c0       	push   $0xc000163d
c0007ee3:	6a 0a                	push   $0xa
c0007ee5:	e8 a6 cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007eea:	83 c4 10             	add    $0x10,%esp
c0007eed:	6a 0e                	push   $0xe
c0007eef:	6a 08                	push   $0x8
c0007ef1:	68 41 16 00 c0       	push   $0xc0001641
c0007ef6:	6a 0b                	push   $0xb
c0007ef8:	e8 93 cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007efd:	83 c4 10             	add    $0x10,%esp
c0007f00:	6a 0e                	push   $0xe
c0007f02:	6a 08                	push   $0x8
c0007f04:	68 45 16 00 c0       	push   $0xc0001645
c0007f09:	6a 0c                	push   $0xc
c0007f0b:	e8 80 cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007f10:	83 c4 10             	add    $0x10,%esp
c0007f13:	6a 0e                	push   $0xe
c0007f15:	6a 08                	push   $0x8
c0007f17:	68 49 16 00 c0       	push   $0xc0001649
c0007f1c:	6a 0d                	push   $0xd
c0007f1e:	e8 6d cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007f23:	83 c4 10             	add    $0x10,%esp
c0007f26:	6a 0e                	push   $0xe
c0007f28:	6a 08                	push   $0x8
c0007f2a:	68 4d 16 00 c0       	push   $0xc000164d
c0007f2f:	6a 0e                	push   $0xe
c0007f31:	e8 5a cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007f36:	83 c4 10             	add    $0x10,%esp
c0007f39:	6a 0e                	push   $0xe
c0007f3b:	6a 08                	push   $0x8
c0007f3d:	68 51 16 00 c0       	push   $0xc0001651
c0007f42:	6a 10                	push   $0x10
c0007f44:	e8 47 cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007f49:	83 c4 10             	add    $0x10,%esp
c0007f4c:	6a 0e                	push   $0xe
c0007f4e:	6a 08                	push   $0x8
c0007f50:	68 57 16 00 c0       	push   $0xc0001657
c0007f55:	6a 11                	push   $0x11
c0007f57:	e8 34 cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007f5c:	83 c4 10             	add    $0x10,%esp
c0007f5f:	6a 0e                	push   $0xe
c0007f61:	6a 08                	push   $0x8
c0007f63:	68 5b 16 00 c0       	push   $0xc000165b
c0007f68:	6a 12                	push   $0x12
c0007f6a:	e8 21 cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007f6f:	83 c4 10             	add    $0x10,%esp
c0007f72:	6a 0e                	push   $0xe
c0007f74:	6a 0e                	push   $0xe
c0007f76:	68 1c 17 00 c0       	push   $0xc000171c
c0007f7b:	68 90 00 00 00       	push   $0x90
c0007f80:	e8 0b cd ff ff       	call   c0004c90 <InitInterruptDesc>
c0007f85:	83 c4 10             	add    $0x10,%esp
c0007f88:	90                   	nop
c0007f89:	c9                   	leave  
c0007f8a:	c3                   	ret    

c0007f8b <test>:
c0007f8b:	55                   	push   %ebp
c0007f8c:	89 e5                	mov    %esp,%ebp
c0007f8e:	83 ec 08             	sub    $0x8,%esp
c0007f91:	83 ec 0c             	sub    $0xc,%esp
c0007f94:	68 ee ad 00 c0       	push   $0xc000adee
c0007f99:	e8 ee 95 ff ff       	call   c000158c <disp_str>
c0007f9e:	83 c4 10             	add    $0x10,%esp
c0007fa1:	83 ec 0c             	sub    $0xc,%esp
c0007fa4:	6a 06                	push   $0x6
c0007fa6:	e8 93 f9 ff ff       	call   c000793e <disp_int>
c0007fab:	83 c4 10             	add    $0x10,%esp
c0007fae:	83 ec 0c             	sub    $0xc,%esp
c0007fb1:	68 14 ab 00 c0       	push   $0xc000ab14
c0007fb6:	e8 d1 95 ff ff       	call   c000158c <disp_str>
c0007fbb:	83 c4 10             	add    $0x10,%esp
c0007fbe:	90                   	nop
c0007fbf:	c9                   	leave  
c0007fc0:	c3                   	ret    

c0007fc1 <disp_str_colour3>:
c0007fc1:	55                   	push   %ebp
c0007fc2:	89 e5                	mov    %esp,%ebp
c0007fc4:	90                   	nop
c0007fc5:	5d                   	pop    %ebp
c0007fc6:	c3                   	ret    

c0007fc7 <spurious_irq>:
c0007fc7:	55                   	push   %ebp
c0007fc8:	89 e5                	mov    %esp,%ebp
c0007fca:	83 ec 08             	sub    $0x8,%esp
c0007fcd:	83 ec 08             	sub    $0x8,%esp
c0007fd0:	6a 0b                	push   $0xb
c0007fd2:	68 f0 ad 00 c0       	push   $0xc000adf0
c0007fd7:	e8 eb 95 ff ff       	call   c00015c7 <disp_str_colour>
c0007fdc:	83 c4 10             	add    $0x10,%esp
c0007fdf:	83 ec 0c             	sub    $0xc,%esp
c0007fe2:	ff 75 08             	pushl  0x8(%ebp)
c0007fe5:	e8 54 f9 ff ff       	call   c000793e <disp_int>
c0007fea:	83 c4 10             	add    $0x10,%esp
c0007fed:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0007ff2:	83 c0 01             	add    $0x1,%eax
c0007ff5:	a3 c0 1e 01 c0       	mov    %eax,0xc0011ec0
c0007ffa:	83 ec 0c             	sub    $0xc,%esp
c0007ffd:	68 17 ae 00 c0       	push   $0xc000ae17
c0008002:	e8 85 95 ff ff       	call   c000158c <disp_str>
c0008007:	83 c4 10             	add    $0x10,%esp
c000800a:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c000800f:	83 ec 0c             	sub    $0xc,%esp
c0008012:	50                   	push   %eax
c0008013:	e8 26 f9 ff ff       	call   c000793e <disp_int>
c0008018:	83 c4 10             	add    $0x10,%esp
c000801b:	83 ec 0c             	sub    $0xc,%esp
c000801e:	68 19 ae 00 c0       	push   $0xc000ae19
c0008023:	e8 64 95 ff ff       	call   c000158c <disp_str>
c0008028:	83 c4 10             	add    $0x10,%esp
c000802b:	83 ec 08             	sub    $0x8,%esp
c000802e:	6a 0c                	push   $0xc
c0008030:	68 1c ae 00 c0       	push   $0xc000ae1c
c0008035:	e8 8d 95 ff ff       	call   c00015c7 <disp_str_colour>
c000803a:	83 c4 10             	add    $0x10,%esp
c000803d:	90                   	nop
c000803e:	c9                   	leave  
c000803f:	c3                   	ret    

c0008040 <init_keyboard>:
c0008040:	55                   	push   %ebp
c0008041:	89 e5                	mov    %esp,%ebp
c0008043:	83 ec 18             	sub    $0x18,%esp
c0008046:	83 ec 04             	sub    $0x4,%esp
c0008049:	68 00 02 00 00       	push   $0x200
c000804e:	6a 00                	push   $0x0
c0008050:	68 8c fb 00 c0       	push   $0xc000fb8c
c0008055:	e8 d8 31 00 00       	call   c000b232 <Memset>
c000805a:	83 c4 10             	add    $0x10,%esp
c000805d:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c0008064:	fb 00 c0 
c0008067:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c000806c:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0008071:	c7 05 88 fb 00 c0 00 	movl   $0x0,0xc000fb88
c0008078:	00 00 00 
c000807b:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0008082:	00 00 00 
c0008085:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000808c:	eb 04                	jmp    c0008092 <init_keyboard+0x52>
c000808e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008092:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0008099:	7e f3                	jle    c000808e <init_keyboard+0x4e>
c000809b:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c00080a2:	00 00 00 
c00080a5:	e8 e5 d9 ff ff       	call   c0005a8f <init_keyboard_handler>
c00080aa:	90                   	nop
c00080ab:	c9                   	leave  
c00080ac:	c3                   	ret    

c00080ad <init2>:
c00080ad:	55                   	push   %ebp
c00080ae:	89 e5                	mov    %esp,%ebp
c00080b0:	83 ec 08             	sub    $0x8,%esp
c00080b3:	83 ec 0c             	sub    $0xc,%esp
c00080b6:	68 41 ae 00 c0       	push   $0xc000ae41
c00080bb:	e8 cc 94 ff ff       	call   c000158c <disp_str>
c00080c0:	83 c4 10             	add    $0x10,%esp
c00080c3:	e8 78 ff ff ff       	call   c0008040 <init_keyboard>
c00080c8:	83 ec 0c             	sub    $0xc,%esp
c00080cb:	68 00 00 00 02       	push   $0x2000000
c00080d0:	e8 87 f4 ff ff       	call   c000755c <init_memory>
c00080d5:	83 c4 10             	add    $0x10,%esp
c00080d8:	90                   	nop
c00080d9:	c9                   	leave  
c00080da:	c3                   	ret    

c00080db <u_thread_a>:
c00080db:	55                   	push   %ebp
c00080dc:	89 e5                	mov    %esp,%ebp
c00080de:	83 ec 08             	sub    $0x8,%esp
c00080e1:	83 ec 0c             	sub    $0xc,%esp
c00080e4:	68 47 ae 00 c0       	push   $0xc000ae47
c00080e9:	e8 9e 94 ff ff       	call   c000158c <disp_str>
c00080ee:	83 c4 10             	add    $0x10,%esp
c00080f1:	eb fe                	jmp    c00080f1 <u_thread_a+0x16>

c00080f3 <kernel_main2>:
c00080f3:	55                   	push   %ebp
c00080f4:	89 e5                	mov    %esp,%ebp
c00080f6:	57                   	push   %edi
c00080f7:	56                   	push   %esi
c00080f8:	53                   	push   %ebx
c00080f9:	83 ec 3c             	sub    $0x3c,%esp
c00080fc:	83 ec 0c             	sub    $0xc,%esp
c00080ff:	68 55 ae 00 c0       	push   $0xc000ae55
c0008104:	e8 83 94 ff ff       	call   c000158c <disp_str>
c0008109:	83 c4 10             	add    $0x10,%esp
c000810c:	e8 23 98 ff ff       	call   c0001934 <init>
c0008111:	c7 05 c0 1e 01 c0 00 	movl   $0x0,0xc0011ec0
c0008118:	00 00 00 
c000811b:	c7 05 9c 16 01 c0 00 	movl   $0x0,0xc001169c
c0008122:	00 00 00 
c0008125:	c7 05 44 f7 00 c0 00 	movl   $0x0,0xc000f744
c000812c:	00 00 00 
c000812f:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c0008136:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000813d:	e9 01 02 00 00       	jmp    c0008343 <kernel_main2+0x250>
c0008142:	83 ec 08             	sub    $0x8,%esp
c0008145:	6a 00                	push   $0x0
c0008147:	6a 01                	push   $0x1
c0008149:	e8 d5 eb ff ff       	call   c0006d23 <alloc_memory>
c000814e:	83 c4 10             	add    $0x10,%esp
c0008151:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008154:	83 ec 04             	sub    $0x4,%esp
c0008157:	68 ac 02 00 00       	push   $0x2ac
c000815c:	6a 00                	push   $0x0
c000815e:	ff 75 d8             	pushl  -0x28(%ebp)
c0008161:	e8 cc 30 00 00       	call   c000b232 <Memset>
c0008166:	83 c4 10             	add    $0x10,%esp
c0008169:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000816c:	05 00 10 00 00       	add    $0x1000,%eax
c0008171:	89 c2                	mov    %eax,%edx
c0008173:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008176:	89 10                	mov    %edx,(%eax)
c0008178:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000817b:	66 c7 80 0c 01 00 00 	movw   $0x0,0x10c(%eax)
c0008182:	00 00 
c0008184:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0008187:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000818a:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c0008190:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008193:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000819a:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000819e:	7e 0f                	jle    c00081af <kernel_main2+0xbc>
c00081a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081a3:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c00081aa:	e9 90 01 00 00       	jmp    c000833f <kernel_main2+0x24c>
c00081af:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081b2:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00081b9:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c00081bd:	7f 73                	jg     c0008232 <kernel_main2+0x13f>
c00081bf:	c7 45 e4 20 e0 00 c0 	movl   $0xc000e020,-0x1c(%ebp)
c00081c6:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c00081cd:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c00081d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081d7:	8b 00                	mov    (%eax),%eax
c00081d9:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c00081dc:	89 c2                	mov    %eax,%edx
c00081de:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081e1:	89 10                	mov    %edx,(%eax)
c00081e3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081e6:	8b 00                	mov    (%eax),%eax
c00081e8:	2b 45 d0             	sub    -0x30(%ebp),%eax
c00081eb:	89 c2                	mov    %eax,%edx
c00081ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081f0:	89 10                	mov    %edx,(%eax)
c00081f2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00081f5:	8b 00                	mov    (%eax),%eax
c00081f7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00081fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00081fd:	8b 50 14             	mov    0x14(%eax),%edx
c0008200:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008203:	89 50 24             	mov    %edx,0x24(%eax)
c0008206:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008209:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000820f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008212:	8b 10                	mov    (%eax),%edx
c0008214:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008217:	89 50 04             	mov    %edx,0x4(%eax)
c000821a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000821d:	8b 50 04             	mov    0x4(%eax),%edx
c0008220:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008223:	89 50 08             	mov    %edx,0x8(%eax)
c0008226:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008229:	8b 50 08             	mov    0x8(%eax),%edx
c000822c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000822f:	89 50 0c             	mov    %edx,0xc(%eax)
c0008232:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008235:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0008238:	81 c2 30 01 00 00    	add    $0x130,%edx
c000823e:	83 ec 08             	sub    $0x8,%esp
c0008241:	50                   	push   %eax
c0008242:	52                   	push   %edx
c0008243:	e8 09 30 00 00       	call   c000b251 <Strcpy>
c0008248:	83 c4 10             	add    $0x10,%esp
c000824b:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c000824f:	83 c8 04             	or     $0x4,%eax
c0008252:	0f b6 c0             	movzbl %al,%eax
c0008255:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c0008259:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c000825d:	83 c8 0c             	or     $0xc,%eax
c0008260:	0f b6 c0             	movzbl %al,%eax
c0008263:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c0008267:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c000826b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000826e:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008274:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008278:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000827b:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c0008281:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008285:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008288:	89 90 6c 02 00 00    	mov    %edx,0x26c(%eax)
c000828e:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008292:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008295:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c000829b:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000829f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082a2:	89 90 a8 02 00 00    	mov    %edx,0x2a8(%eax)
c00082a8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082ab:	c7 80 68 02 00 00 39 	movl   $0x39,0x268(%eax)
c00082b2:	00 00 00 
c00082b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00082b8:	8b 50 14             	mov    0x14(%eax),%edx
c00082bb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082be:	89 90 98 02 00 00    	mov    %edx,0x298(%eax)
c00082c4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082c7:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00082ca:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00082d0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082d3:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00082da:	00 00 00 
c00082dd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082e0:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c00082e7:	00 00 00 
c00082ea:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082ed:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00082f4:	00 00 00 
c00082f7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082fa:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0008301:	00 00 00 
c0008304:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008307:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c000830e:	00 00 00 
c0008311:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008314:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c000831b:	00 00 00 
c000831e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008321:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0008327:	8d 90 00 33 08 c0    	lea    -0x3ff7cd00(%eax),%edx
c000832d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008330:	89 c3                	mov    %eax,%ebx
c0008332:	b8 ab 00 00 00       	mov    $0xab,%eax
c0008337:	89 d7                	mov    %edx,%edi
c0008339:	89 de                	mov    %ebx,%esi
c000833b:	89 c1                	mov    %eax,%ecx
c000833d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c000833f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008343:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0008347:	0f 8e f5 fd ff ff    	jle    c0008142 <kernel_main2+0x4f>
c000834d:	c7 05 60 fb 00 c0 00 	movl   $0xc0083300,0xc000fb60
c0008354:	33 08 c0 
c0008357:	eb fe                	jmp    c0008357 <kernel_main2+0x264>

c0008359 <TestTTY>:
c0008359:	55                   	push   %ebp
c000835a:	89 e5                	mov    %esp,%ebp
c000835c:	83 ec 28             	sub    $0x28,%esp
c000835f:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008366:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c000836d:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008373:	83 ec 08             	sub    $0x8,%esp
c0008376:	6a 02                	push   $0x2
c0008378:	8d 45 de             	lea    -0x22(%ebp),%eax
c000837b:	50                   	push   %eax
c000837c:	e8 b4 d8 ff ff       	call   c0005c35 <open>
c0008381:	83 c4 10             	add    $0x10,%esp
c0008384:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008387:	83 ec 08             	sub    $0x8,%esp
c000838a:	6a 02                	push   $0x2
c000838c:	8d 45 de             	lea    -0x22(%ebp),%eax
c000838f:	50                   	push   %eax
c0008390:	e8 a0 d8 ff ff       	call   c0005c35 <open>
c0008395:	83 c4 10             	add    $0x10,%esp
c0008398:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000839b:	83 ec 0c             	sub    $0xc,%esp
c000839e:	68 61 ae 00 c0       	push   $0xc000ae61
c00083a3:	e8 d2 09 00 00       	call   c0008d7a <Printf>
c00083a8:	83 c4 10             	add    $0x10,%esp
c00083ab:	83 ec 0c             	sub    $0xc,%esp
c00083ae:	6a 0a                	push   $0xa
c00083b0:	e8 10 ea ff ff       	call   c0006dc5 <sys_malloc>
c00083b5:	83 c4 10             	add    $0x10,%esp
c00083b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00083bb:	83 ec 04             	sub    $0x4,%esp
c00083be:	6a 0a                	push   $0xa
c00083c0:	6a 00                	push   $0x0
c00083c2:	ff 75 ec             	pushl  -0x14(%ebp)
c00083c5:	e8 68 2e 00 00       	call   c000b232 <Memset>
c00083ca:	83 c4 10             	add    $0x10,%esp
c00083cd:	83 ec 04             	sub    $0x4,%esp
c00083d0:	6a 0a                	push   $0xa
c00083d2:	ff 75 ec             	pushl  -0x14(%ebp)
c00083d5:	ff 75 f0             	pushl  -0x10(%ebp)
c00083d8:	e8 dd d8 ff ff       	call   c0005cba <read>
c00083dd:	83 c4 10             	add    $0x10,%esp
c00083e0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00083e3:	83 ec 08             	sub    $0x8,%esp
c00083e6:	ff 75 ec             	pushl  -0x14(%ebp)
c00083e9:	68 73 ae 00 c0       	push   $0xc000ae73
c00083ee:	e8 87 09 00 00       	call   c0008d7a <Printf>
c00083f3:	83 c4 10             	add    $0x10,%esp
c00083f6:	eb c3                	jmp    c00083bb <TestTTY+0x62>

c00083f8 <TestFS>:
c00083f8:	55                   	push   %ebp
c00083f9:	89 e5                	mov    %esp,%ebp
c00083fb:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c0008401:	83 ec 0c             	sub    $0xc,%esp
c0008404:	68 7d ae 00 c0       	push   $0xc000ae7d
c0008409:	e8 7e 91 ff ff       	call   c000158c <disp_str>
c000840e:	83 c4 10             	add    $0x10,%esp
c0008411:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008418:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c000841f:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008425:	83 ec 08             	sub    $0x8,%esp
c0008428:	6a 02                	push   $0x2
c000842a:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c000842d:	50                   	push   %eax
c000842e:	e8 02 d8 ff ff       	call   c0005c35 <open>
c0008433:	83 c4 10             	add    $0x10,%esp
c0008436:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008439:	83 ec 08             	sub    $0x8,%esp
c000843c:	6a 02                	push   $0x2
c000843e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008441:	50                   	push   %eax
c0008442:	e8 ee d7 ff ff       	call   c0005c35 <open>
c0008447:	83 c4 10             	add    $0x10,%esp
c000844a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000844d:	83 ec 0c             	sub    $0xc,%esp
c0008450:	68 61 ae 00 c0       	push   $0xc000ae61
c0008455:	e8 20 09 00 00       	call   c0008d7a <Printf>
c000845a:	83 c4 10             	add    $0x10,%esp
c000845d:	90                   	nop
c000845e:	c9                   	leave  
c000845f:	c3                   	ret    

c0008460 <wait_exit>:
c0008460:	55                   	push   %ebp
c0008461:	89 e5                	mov    %esp,%ebp
c0008463:	83 ec 28             	sub    $0x28,%esp
c0008466:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c000846d:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008474:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000847a:	83 ec 08             	sub    $0x8,%esp
c000847d:	6a 02                	push   $0x2
c000847f:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008482:	50                   	push   %eax
c0008483:	e8 ad d7 ff ff       	call   c0005c35 <open>
c0008488:	83 c4 10             	add    $0x10,%esp
c000848b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000848e:	83 ec 08             	sub    $0x8,%esp
c0008491:	6a 02                	push   $0x2
c0008493:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008496:	50                   	push   %eax
c0008497:	e8 99 d7 ff ff       	call   c0005c35 <open>
c000849c:	83 c4 10             	add    $0x10,%esp
c000849f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00084a2:	e8 bf d9 ff ff       	call   c0005e66 <fork>
c00084a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00084aa:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00084ae:	7e 25                	jle    c00084d5 <wait_exit+0x75>
c00084b0:	83 ec 0c             	sub    $0xc,%esp
c00084b3:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00084b6:	50                   	push   %eax
c00084b7:	e8 43 d9 ff ff       	call   c0005dff <wait>
c00084bc:	83 c4 10             	add    $0x10,%esp
c00084bf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00084c2:	83 ec 08             	sub    $0x8,%esp
c00084c5:	50                   	push   %eax
c00084c6:	68 85 ae 00 c0       	push   $0xc000ae85
c00084cb:	e8 aa 08 00 00       	call   c0008d7a <Printf>
c00084d0:	83 c4 10             	add    $0x10,%esp
c00084d3:	eb fe                	jmp    c00084d3 <wait_exit+0x73>
c00084d5:	83 ec 0c             	sub    $0xc,%esp
c00084d8:	68 a0 ae 00 c0       	push   $0xc000aea0
c00084dd:	e8 98 08 00 00       	call   c0008d7a <Printf>
c00084e2:	83 c4 10             	add    $0x10,%esp
c00084e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00084ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00084ef:	8d 50 01             	lea    0x1(%eax),%edx
c00084f2:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00084f5:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c00084fa:	7f 02                	jg     c00084fe <wait_exit+0x9e>
c00084fc:	eb ee                	jmp    c00084ec <wait_exit+0x8c>
c00084fe:	90                   	nop
c00084ff:	83 ec 0c             	sub    $0xc,%esp
c0008502:	68 ac ae 00 c0       	push   $0xc000aeac
c0008507:	e8 6e 08 00 00       	call   c0008d7a <Printf>
c000850c:	83 c4 10             	add    $0x10,%esp
c000850f:	83 ec 0c             	sub    $0xc,%esp
c0008512:	6a 09                	push   $0x9
c0008514:	e8 24 d9 ff ff       	call   c0005e3d <exit>
c0008519:	83 c4 10             	add    $0x10,%esp
c000851c:	83 ec 0c             	sub    $0xc,%esp
c000851f:	68 ba ae 00 c0       	push   $0xc000aeba
c0008524:	e8 51 08 00 00       	call   c0008d7a <Printf>
c0008529:	83 c4 10             	add    $0x10,%esp
c000852c:	eb fe                	jmp    c000852c <wait_exit+0xcc>

c000852e <INIT_fork>:
c000852e:	55                   	push   %ebp
c000852f:	89 e5                	mov    %esp,%ebp
c0008531:	53                   	push   %ebx
c0008532:	83 ec 74             	sub    $0x74,%esp
c0008535:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c000853c:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c0008543:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c0008549:	83 ec 08             	sub    $0x8,%esp
c000854c:	6a 02                	push   $0x2
c000854e:	8d 45 da             	lea    -0x26(%ebp),%eax
c0008551:	50                   	push   %eax
c0008552:	e8 de d6 ff ff       	call   c0005c35 <open>
c0008557:	83 c4 10             	add    $0x10,%esp
c000855a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000855d:	83 ec 08             	sub    $0x8,%esp
c0008560:	6a 02                	push   $0x2
c0008562:	8d 45 da             	lea    -0x26(%ebp),%eax
c0008565:	50                   	push   %eax
c0008566:	e8 ca d6 ff ff       	call   c0005c35 <open>
c000856b:	83 c4 10             	add    $0x10,%esp
c000856e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008571:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c0008578:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c000857f:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c0008586:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c000858d:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c0008594:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c000859b:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c00085a2:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c00085a9:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c00085b0:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c00085b7:	83 ec 0c             	sub    $0xc,%esp
c00085ba:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00085bd:	50                   	push   %eax
c00085be:	e8 b7 07 00 00       	call   c0008d7a <Printf>
c00085c3:	83 c4 10             	add    $0x10,%esp
c00085c6:	83 ec 0c             	sub    $0xc,%esp
c00085c9:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00085cc:	50                   	push   %eax
c00085cd:	e8 99 2c 00 00       	call   c000b26b <Strlen>
c00085d2:	83 c4 10             	add    $0x10,%esp
c00085d5:	83 ec 04             	sub    $0x4,%esp
c00085d8:	50                   	push   %eax
c00085d9:	6a 00                	push   $0x0
c00085db:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00085de:	50                   	push   %eax
c00085df:	e8 4e 2c 00 00       	call   c000b232 <Memset>
c00085e4:	83 c4 10             	add    $0x10,%esp
c00085e7:	83 ec 04             	sub    $0x4,%esp
c00085ea:	6a 28                	push   $0x28
c00085ec:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00085ef:	50                   	push   %eax
c00085f0:	ff 75 e8             	pushl  -0x18(%ebp)
c00085f3:	e8 c2 d6 ff ff       	call   c0005cba <read>
c00085f8:	83 c4 10             	add    $0x10,%esp
c00085fb:	83 ec 0c             	sub    $0xc,%esp
c00085fe:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008601:	50                   	push   %eax
c0008602:	e8 73 07 00 00       	call   c0008d7a <Printf>
c0008607:	83 c4 10             	add    $0x10,%esp
c000860a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008611:	e8 50 d8 ff ff       	call   c0005e66 <fork>
c0008616:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008619:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c000861d:	7e 5f                	jle    c000867e <INIT_fork+0x150>
c000861f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008623:	c7 45 8a 50 61 72 65 	movl   $0x65726150,-0x76(%ebp)
c000862a:	c7 45 8e 6e 74 0a 00 	movl   $0xa746e,-0x72(%ebp)
c0008631:	8d 45 92             	lea    -0x6e(%ebp),%eax
c0008634:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008639:	bb 00 00 00 00       	mov    $0x0,%ebx
c000863e:	89 18                	mov    %ebx,(%eax)
c0008640:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008644:	8d 50 04             	lea    0x4(%eax),%edx
c0008647:	83 e2 fc             	and    $0xfffffffc,%edx
c000864a:	29 d0                	sub    %edx,%eax
c000864c:	01 c1                	add    %eax,%ecx
c000864e:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008651:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008654:	b8 00 00 00 00       	mov    $0x0,%eax
c0008659:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c000865c:	83 c0 04             	add    $0x4,%eax
c000865f:	39 c8                	cmp    %ecx,%eax
c0008661:	72 f6                	jb     c0008659 <INIT_fork+0x12b>
c0008663:	01 c2                	add    %eax,%edx
c0008665:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000866c:	eb 08                	jmp    c0008676 <INIT_fork+0x148>
c000866e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008672:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008676:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c000867a:	7e f2                	jle    c000866e <INIT_fork+0x140>
c000867c:	eb 79                	jmp    c00086f7 <INIT_fork+0x1c9>
c000867e:	83 ec 0c             	sub    $0xc,%esp
c0008681:	6a 0a                	push   $0xa
c0008683:	e8 c1 05 00 00       	call   c0008c49 <delay>
c0008688:	83 c4 10             	add    $0x10,%esp
c000868b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000868f:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c0008693:	c7 45 8a 43 68 69 6c 	movl   $0x6c696843,-0x76(%ebp)
c000869a:	c7 45 8e 64 0a 00 00 	movl   $0xa64,-0x72(%ebp)
c00086a1:	8d 45 92             	lea    -0x6e(%ebp),%eax
c00086a4:	b9 20 00 00 00       	mov    $0x20,%ecx
c00086a9:	bb 00 00 00 00       	mov    $0x0,%ebx
c00086ae:	89 18                	mov    %ebx,(%eax)
c00086b0:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c00086b4:	8d 50 04             	lea    0x4(%eax),%edx
c00086b7:	83 e2 fc             	and    $0xfffffffc,%edx
c00086ba:	29 d0                	sub    %edx,%eax
c00086bc:	01 c1                	add    %eax,%ecx
c00086be:	83 e1 fc             	and    $0xfffffffc,%ecx
c00086c1:	83 e1 fc             	and    $0xfffffffc,%ecx
c00086c4:	b8 00 00 00 00       	mov    $0x0,%eax
c00086c9:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c00086cc:	83 c0 04             	add    $0x4,%eax
c00086cf:	39 c8                	cmp    %ecx,%eax
c00086d1:	72 f6                	jb     c00086c9 <INIT_fork+0x19b>
c00086d3:	01 c2                	add    %eax,%edx
c00086d5:	83 ec 0c             	sub    $0xc,%esp
c00086d8:	8d 45 8a             	lea    -0x76(%ebp),%eax
c00086db:	50                   	push   %eax
c00086dc:	e8 8a 2b 00 00       	call   c000b26b <Strlen>
c00086e1:	83 c4 10             	add    $0x10,%esp
c00086e4:	83 ec 04             	sub    $0x4,%esp
c00086e7:	50                   	push   %eax
c00086e8:	8d 45 8a             	lea    -0x76(%ebp),%eax
c00086eb:	50                   	push   %eax
c00086ec:	ff 75 ec             	pushl  -0x14(%ebp)
c00086ef:	e8 3a d6 ff ff       	call   c0005d2e <write>
c00086f4:	83 c4 10             	add    $0x10,%esp
c00086f7:	90                   	nop
c00086f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00086fb:	c9                   	leave  
c00086fc:	c3                   	ret    

c00086fd <simple_shell>:
c00086fd:	55                   	push   %ebp
c00086fe:	89 e5                	mov    %esp,%ebp
c0008700:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008706:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c000870d:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c0008714:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c000871a:	83 ec 08             	sub    $0x8,%esp
c000871d:	6a 02                	push   $0x2
c000871f:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008722:	50                   	push   %eax
c0008723:	e8 0d d5 ff ff       	call   c0005c35 <open>
c0008728:	83 c4 10             	add    $0x10,%esp
c000872b:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000872e:	83 ec 08             	sub    $0x8,%esp
c0008731:	6a 02                	push   $0x2
c0008733:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008736:	50                   	push   %eax
c0008737:	e8 f9 d4 ff ff       	call   c0005c35 <open>
c000873c:	83 c4 10             	add    $0x10,%esp
c000873f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0008742:	83 ec 04             	sub    $0x4,%esp
c0008745:	68 80 00 00 00       	push   $0x80
c000874a:	6a 00                	push   $0x0
c000874c:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008752:	50                   	push   %eax
c0008753:	e8 da 2a 00 00       	call   c000b232 <Memset>
c0008758:	83 c4 10             	add    $0x10,%esp
c000875b:	83 ec 04             	sub    $0x4,%esp
c000875e:	68 80 00 00 00       	push   $0x80
c0008763:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008769:	50                   	push   %eax
c000876a:	ff 75 e0             	pushl  -0x20(%ebp)
c000876d:	e8 48 d5 ff ff       	call   c0005cba <read>
c0008772:	83 c4 10             	add    $0x10,%esp
c0008775:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000877c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008783:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c0008789:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000878c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000878f:	0f b6 00             	movzbl (%eax),%eax
c0008792:	88 45 db             	mov    %al,-0x25(%ebp)
c0008795:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008798:	0f b6 00             	movzbl (%eax),%eax
c000879b:	3c 20                	cmp    $0x20,%al
c000879d:	74 1d                	je     c00087bc <simple_shell+0xbf>
c000879f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00087a2:	0f b6 00             	movzbl (%eax),%eax
c00087a5:	84 c0                	test   %al,%al
c00087a7:	74 13                	je     c00087bc <simple_shell+0xbf>
c00087a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00087ad:	75 0d                	jne    c00087bc <simple_shell+0xbf>
c00087af:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00087b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00087b5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00087bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00087bf:	0f b6 00             	movzbl (%eax),%eax
c00087c2:	3c 20                	cmp    $0x20,%al
c00087c4:	74 0a                	je     c00087d0 <simple_shell+0xd3>
c00087c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00087c9:	0f b6 00             	movzbl (%eax),%eax
c00087cc:	84 c0                	test   %al,%al
c00087ce:	75 26                	jne    c00087f6 <simple_shell+0xf9>
c00087d0:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c00087d4:	75 20                	jne    c00087f6 <simple_shell+0xf9>
c00087d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00087d9:	8d 50 01             	lea    0x1(%eax),%edx
c00087dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00087df:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00087e2:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c00087e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00087ec:	c6 00 00             	movb   $0x0,(%eax)
c00087ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00087f6:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00087fa:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c00087fe:	75 8c                	jne    c000878c <simple_shell+0x8f>
c0008800:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008803:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c000880a:	00 00 00 00 
c000880e:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c0008815:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c000881b:	83 ec 08             	sub    $0x8,%esp
c000881e:	6a 02                	push   $0x2
c0008820:	50                   	push   %eax
c0008821:	e8 0f d4 ff ff       	call   c0005c35 <open>
c0008826:	83 c4 10             	add    $0x10,%esp
c0008829:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000882c:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0008830:	75 54                	jne    c0008886 <simple_shell+0x189>
c0008832:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008839:	eb 29                	jmp    c0008864 <simple_shell+0x167>
c000883b:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c0008841:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008844:	01 d0                	add    %edx,%eax
c0008846:	0f b6 00             	movzbl (%eax),%eax
c0008849:	0f be c0             	movsbl %al,%eax
c000884c:	83 ec 04             	sub    $0x4,%esp
c000884f:	50                   	push   %eax
c0008850:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008853:	68 c8 ae 00 c0       	push   $0xc000aec8
c0008858:	e8 1d 05 00 00       	call   c0008d7a <Printf>
c000885d:	83 c4 10             	add    $0x10,%esp
c0008860:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008864:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008868:	7e d1                	jle    c000883b <simple_shell+0x13e>
c000886a:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008870:	83 ec 08             	sub    $0x8,%esp
c0008873:	50                   	push   %eax
c0008874:	68 cf ae 00 c0       	push   $0xc000aecf
c0008879:	e8 fc 04 00 00       	call   c0008d7a <Printf>
c000887e:	83 c4 10             	add    $0x10,%esp
c0008881:	e9 bc fe ff ff       	jmp    c0008742 <simple_shell+0x45>
c0008886:	e8 db d5 ff ff       	call   c0005e66 <fork>
c000888b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000888e:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008892:	7e 17                	jle    c00088ab <simple_shell+0x1ae>
c0008894:	83 ec 0c             	sub    $0xc,%esp
c0008897:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c000889d:	50                   	push   %eax
c000889e:	e8 5c d5 ff ff       	call   c0005dff <wait>
c00088a3:	83 c4 10             	add    $0x10,%esp
c00088a6:	e9 97 fe ff ff       	jmp    c0008742 <simple_shell+0x45>
c00088ab:	83 ec 0c             	sub    $0xc,%esp
c00088ae:	ff 75 d0             	pushl  -0x30(%ebp)
c00088b1:	e8 fd d4 ff ff       	call   c0005db3 <close>
c00088b6:	83 c4 10             	add    $0x10,%esp
c00088b9:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00088bf:	83 ec 08             	sub    $0x8,%esp
c00088c2:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c00088c8:	52                   	push   %edx
c00088c9:	50                   	push   %eax
c00088ca:	e8 86 d6 ff ff       	call   c0005f55 <execv>
c00088cf:	83 c4 10             	add    $0x10,%esp
c00088d2:	eb fe                	jmp    c00088d2 <simple_shell+0x1d5>

c00088d4 <test_split_str>:
c00088d4:	55                   	push   %ebp
c00088d5:	89 e5                	mov    %esp,%ebp
c00088d7:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c00088dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00088e4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00088eb:	c7 45 ec d5 ae 00 c0 	movl   $0xc000aed5,-0x14(%ebp)
c00088f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00088f6:	75 1a                	jne    c0008912 <test_split_str+0x3e>
c00088f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088fb:	0f b6 00             	movzbl (%eax),%eax
c00088fe:	0f be c0             	movsbl %al,%eax
c0008901:	83 ec 08             	sub    $0x8,%esp
c0008904:	50                   	push   %eax
c0008905:	68 e6 ae 00 c0       	push   $0xc000aee6
c000890a:	e8 6b 04 00 00       	call   c0008d7a <Printf>
c000890f:	83 c4 10             	add    $0x10,%esp
c0008912:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008915:	0f b6 00             	movzbl (%eax),%eax
c0008918:	3c 20                	cmp    $0x20,%al
c000891a:	75 0a                	jne    c0008926 <test_split_str+0x52>
c000891c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000891f:	0f b6 00             	movzbl (%eax),%eax
c0008922:	84 c0                	test   %al,%al
c0008924:	74 13                	je     c0008939 <test_split_str+0x65>
c0008926:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000892a:	75 0d                	jne    c0008939 <test_split_str+0x65>
c000892c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000892f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008932:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008939:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000893c:	0f b6 00             	movzbl (%eax),%eax
c000893f:	3c 20                	cmp    $0x20,%al
c0008941:	74 0a                	je     c000894d <test_split_str+0x79>
c0008943:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008946:	0f b6 00             	movzbl (%eax),%eax
c0008949:	84 c0                	test   %al,%al
c000894b:	75 26                	jne    c0008973 <test_split_str+0x9f>
c000894d:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008951:	75 20                	jne    c0008973 <test_split_str+0x9f>
c0008953:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008956:	8d 50 01             	lea    0x1(%eax),%edx
c0008959:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000895c:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000895f:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008966:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008969:	c6 00 00             	movb   $0x0,(%eax)
c000896c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008973:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008977:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000897a:	0f b6 00             	movzbl (%eax),%eax
c000897d:	84 c0                	test   %al,%al
c000897f:	0f 85 6d ff ff ff    	jne    c00088f2 <test_split_str+0x1e>
c0008985:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008988:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000898b:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008992:	83 ec 08             	sub    $0x8,%esp
c0008995:	ff 75 f4             	pushl  -0xc(%ebp)
c0008998:	68 ef ae 00 c0       	push   $0xc000aeef
c000899d:	e8 d8 03 00 00       	call   c0008d7a <Printf>
c00089a2:	83 c4 10             	add    $0x10,%esp
c00089a5:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00089ac:	eb 22                	jmp    c00089d0 <test_split_str+0xfc>
c00089ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00089b1:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c00089b8:	83 ec 04             	sub    $0x4,%esp
c00089bb:	50                   	push   %eax
c00089bc:	ff 75 e4             	pushl  -0x1c(%ebp)
c00089bf:	68 06 af 00 c0       	push   $0xc000af06
c00089c4:	e8 b1 03 00 00       	call   c0008d7a <Printf>
c00089c9:	83 c4 10             	add    $0x10,%esp
c00089cc:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00089d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00089d3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c00089d6:	7e d6                	jle    c00089ae <test_split_str+0xda>
c00089d8:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c00089de:	83 ec 08             	sub    $0x8,%esp
c00089e1:	68 15 af 00 c0       	push   $0xc000af15
c00089e6:	50                   	push   %eax
c00089e7:	e8 52 12 00 00       	call   c0009c3e <strcmp>
c00089ec:	83 c4 10             	add    $0x10,%esp
c00089ef:	85 c0                	test   %eax,%eax
c00089f1:	75 10                	jne    c0008a03 <test_split_str+0x12f>
c00089f3:	83 ec 0c             	sub    $0xc,%esp
c00089f6:	68 1a af 00 c0       	push   $0xc000af1a
c00089fb:	e8 7a 03 00 00       	call   c0008d7a <Printf>
c0008a00:	83 c4 10             	add    $0x10,%esp
c0008a03:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008a09:	83 ec 08             	sub    $0x8,%esp
c0008a0c:	50                   	push   %eax
c0008a0d:	68 26 af 00 c0       	push   $0xc000af26
c0008a12:	e8 63 03 00 00       	call   c0008d7a <Printf>
c0008a17:	83 c4 10             	add    $0x10,%esp
c0008a1a:	83 ec 0c             	sub    $0xc,%esp
c0008a1d:	68 34 af 00 c0       	push   $0xc000af34
c0008a22:	e8 53 03 00 00       	call   c0008d7a <Printf>
c0008a27:	83 c4 10             	add    $0x10,%esp
c0008a2a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008a31:	eb 26                	jmp    c0008a59 <test_split_str+0x185>
c0008a33:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008a39:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008a3c:	01 d0                	add    %edx,%eax
c0008a3e:	0f b6 00             	movzbl (%eax),%eax
c0008a41:	0f be c0             	movsbl %al,%eax
c0008a44:	83 ec 08             	sub    $0x8,%esp
c0008a47:	50                   	push   %eax
c0008a48:	68 43 af 00 c0       	push   $0xc000af43
c0008a4d:	e8 28 03 00 00       	call   c0008d7a <Printf>
c0008a52:	83 c4 10             	add    $0x10,%esp
c0008a55:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008a59:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0008a5d:	7e d4                	jle    c0008a33 <test_split_str+0x15f>
c0008a5f:	c9                   	leave  
c0008a60:	c3                   	ret    

c0008a61 <test_shell>:
c0008a61:	55                   	push   %ebp
c0008a62:	89 e5                	mov    %esp,%ebp
c0008a64:	83 ec 48             	sub    $0x48,%esp
c0008a67:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c0008a6e:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0008a75:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0008a7b:	83 ec 08             	sub    $0x8,%esp
c0008a7e:	6a 02                	push   $0x2
c0008a80:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c0008a83:	50                   	push   %eax
c0008a84:	e8 ac d1 ff ff       	call   c0005c35 <open>
c0008a89:	83 c4 10             	add    $0x10,%esp
c0008a8c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008a8f:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0008a96:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0008a9d:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0008aa4:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008aab:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008ab2:	83 ec 0c             	sub    $0xc,%esp
c0008ab5:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0008ab8:	50                   	push   %eax
c0008ab9:	e8 d0 eb ff ff       	call   c000768e <untar>
c0008abe:	83 c4 10             	add    $0x10,%esp
c0008ac1:	e8 a0 d3 ff ff       	call   c0005e66 <fork>
c0008ac6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008ac9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008acd:	7e 25                	jle    c0008af4 <test_shell+0x93>
c0008acf:	83 ec 0c             	sub    $0xc,%esp
c0008ad2:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0008ad5:	50                   	push   %eax
c0008ad6:	e8 24 d3 ff ff       	call   c0005dff <wait>
c0008adb:	83 c4 10             	add    $0x10,%esp
c0008ade:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008ae1:	83 ec 08             	sub    $0x8,%esp
c0008ae4:	50                   	push   %eax
c0008ae5:	68 4c af 00 c0       	push   $0xc000af4c
c0008aea:	e8 8b 02 00 00       	call   c0008d7a <Printf>
c0008aef:	83 c4 10             	add    $0x10,%esp
c0008af2:	eb 23                	jmp    c0008b17 <test_shell+0xb6>
c0008af4:	83 ec 0c             	sub    $0xc,%esp
c0008af7:	68 5e af 00 c0       	push   $0xc000af5e
c0008afc:	e8 79 02 00 00       	call   c0008d7a <Printf>
c0008b01:	83 c4 10             	add    $0x10,%esp
c0008b04:	83 ec 0c             	sub    $0xc,%esp
c0008b07:	ff 75 f4             	pushl  -0xc(%ebp)
c0008b0a:	e8 a4 d2 ff ff       	call   c0005db3 <close>
c0008b0f:	83 c4 10             	add    $0x10,%esp
c0008b12:	e8 e6 fb ff ff       	call   c00086fd <simple_shell>
c0008b17:	83 ec 0c             	sub    $0xc,%esp
c0008b1a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0008b1d:	50                   	push   %eax
c0008b1e:	e8 dc d2 ff ff       	call   c0005dff <wait>
c0008b23:	83 c4 10             	add    $0x10,%esp
c0008b26:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008b29:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008b2c:	83 ec 08             	sub    $0x8,%esp
c0008b2f:	50                   	push   %eax
c0008b30:	68 6c af 00 c0       	push   $0xc000af6c
c0008b35:	e8 40 02 00 00       	call   c0008d7a <Printf>
c0008b3a:	83 c4 10             	add    $0x10,%esp
c0008b3d:	eb d8                	jmp    c0008b17 <test_shell+0xb6>

c0008b3f <test_exec>:
c0008b3f:	55                   	push   %ebp
c0008b40:	89 e5                	mov    %esp,%ebp
c0008b42:	83 ec 38             	sub    $0x38,%esp
c0008b45:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008b4c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008b53:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008b59:	83 ec 08             	sub    $0x8,%esp
c0008b5c:	6a 02                	push   $0x2
c0008b5e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008b61:	50                   	push   %eax
c0008b62:	e8 ce d0 ff ff       	call   c0005c35 <open>
c0008b67:	83 c4 10             	add    $0x10,%esp
c0008b6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008b6d:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0008b74:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0008b7b:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0008b82:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008b89:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0008b90:	83 ec 0c             	sub    $0xc,%esp
c0008b93:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0008b96:	50                   	push   %eax
c0008b97:	e8 f2 ea ff ff       	call   c000768e <untar>
c0008b9c:	83 c4 10             	add    $0x10,%esp
c0008b9f:	e8 c2 d2 ff ff       	call   c0005e66 <fork>
c0008ba4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008ba7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008bab:	7e 25                	jle    c0008bd2 <test_exec+0x93>
c0008bad:	83 ec 0c             	sub    $0xc,%esp
c0008bb0:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0008bb3:	50                   	push   %eax
c0008bb4:	e8 46 d2 ff ff       	call   c0005dff <wait>
c0008bb9:	83 c4 10             	add    $0x10,%esp
c0008bbc:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008bbf:	83 ec 08             	sub    $0x8,%esp
c0008bc2:	50                   	push   %eax
c0008bc3:	68 4c af 00 c0       	push   $0xc000af4c
c0008bc8:	e8 ad 01 00 00       	call   c0008d7a <Printf>
c0008bcd:	83 c4 10             	add    $0x10,%esp
c0008bd0:	eb 33                	jmp    c0008c05 <test_exec+0xc6>
c0008bd2:	83 ec 0c             	sub    $0xc,%esp
c0008bd5:	68 5e af 00 c0       	push   $0xc000af5e
c0008bda:	e8 9b 01 00 00       	call   c0008d7a <Printf>
c0008bdf:	83 c4 10             	add    $0x10,%esp
c0008be2:	83 ec 0c             	sub    $0xc,%esp
c0008be5:	6a 00                	push   $0x0
c0008be7:	68 87 af 00 c0       	push   $0xc000af87
c0008bec:	68 8d af 00 c0       	push   $0xc000af8d
c0008bf1:	68 15 af 00 c0       	push   $0xc000af15
c0008bf6:	68 93 af 00 c0       	push   $0xc000af93
c0008bfb:	e8 fa d4 ff ff       	call   c00060fa <execl>
c0008c00:	83 c4 20             	add    $0x20,%esp
c0008c03:	eb fe                	jmp    c0008c03 <test_exec+0xc4>
c0008c05:	c9                   	leave  
c0008c06:	c3                   	ret    

c0008c07 <INIT>:
c0008c07:	55                   	push   %ebp
c0008c08:	89 e5                	mov    %esp,%ebp
c0008c0a:	83 ec 08             	sub    $0x8,%esp
c0008c0d:	e8 4f fe ff ff       	call   c0008a61 <test_shell>
c0008c12:	eb fe                	jmp    c0008c12 <INIT+0xb>

c0008c14 <TestA>:
c0008c14:	55                   	push   %ebp
c0008c15:	89 e5                	mov    %esp,%ebp
c0008c17:	83 ec 08             	sub    $0x8,%esp
c0008c1a:	83 ec 0c             	sub    $0xc,%esp
c0008c1d:	6a 05                	push   $0x5
c0008c1f:	e8 1a ed ff ff       	call   c000793e <disp_int>
c0008c24:	83 c4 10             	add    $0x10,%esp
c0008c27:	83 ec 0c             	sub    $0xc,%esp
c0008c2a:	68 14 ab 00 c0       	push   $0xc000ab14
c0008c2f:	e8 58 89 ff ff       	call   c000158c <disp_str>
c0008c34:	83 c4 10             	add    $0x10,%esp
c0008c37:	83 ec 0c             	sub    $0xc,%esp
c0008c3a:	68 99 af 00 c0       	push   $0xc000af99
c0008c3f:	e8 48 89 ff ff       	call   c000158c <disp_str>
c0008c44:	83 c4 10             	add    $0x10,%esp
c0008c47:	eb fe                	jmp    c0008c47 <TestA+0x33>

c0008c49 <delay>:
c0008c49:	55                   	push   %ebp
c0008c4a:	89 e5                	mov    %esp,%ebp
c0008c4c:	83 ec 10             	sub    $0x10,%esp
c0008c4f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008c56:	eb 2d                	jmp    c0008c85 <delay+0x3c>
c0008c58:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0008c5f:	eb 1a                	jmp    c0008c7b <delay+0x32>
c0008c61:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008c68:	eb 04                	jmp    c0008c6e <delay+0x25>
c0008c6a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008c6e:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c0008c75:	7e f3                	jle    c0008c6a <delay+0x21>
c0008c77:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008c7b:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0008c7f:	7e e0                	jle    c0008c61 <delay+0x18>
c0008c81:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008c85:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008c88:	3b 45 08             	cmp    0x8(%ebp),%eax
c0008c8b:	7c cb                	jl     c0008c58 <delay+0xf>
c0008c8d:	90                   	nop
c0008c8e:	c9                   	leave  
c0008c8f:	c3                   	ret    

c0008c90 <TestB>:
c0008c90:	55                   	push   %ebp
c0008c91:	89 e5                	mov    %esp,%ebp
c0008c93:	83 ec 08             	sub    $0x8,%esp
c0008c96:	83 ec 0c             	sub    $0xc,%esp
c0008c99:	68 a0 af 00 c0       	push   $0xc000afa0
c0008c9e:	e8 e9 88 ff ff       	call   c000158c <disp_str>
c0008ca3:	83 c4 10             	add    $0x10,%esp
c0008ca6:	eb fe                	jmp    c0008ca6 <TestB+0x16>

c0008ca8 <TestC>:
c0008ca8:	55                   	push   %ebp
c0008ca9:	89 e5                	mov    %esp,%ebp
c0008cab:	83 ec 18             	sub    $0x18,%esp
c0008cae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008cb5:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008cb9:	77 1a                	ja     c0008cd5 <TestC+0x2d>
c0008cbb:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0008cc2:	83 ec 08             	sub    $0x8,%esp
c0008cc5:	ff 75 f0             	pushl  -0x10(%ebp)
c0008cc8:	68 a3 af 00 c0       	push   $0xc000afa3
c0008ccd:	e8 a8 00 00 00       	call   c0008d7a <Printf>
c0008cd2:	83 c4 10             	add    $0x10,%esp
c0008cd5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008cd9:	eb da                	jmp    c0008cb5 <TestC+0xd>

c0008cdb <sys_get_ticks>:
c0008cdb:	55                   	push   %ebp
c0008cdc:	89 e5                	mov    %esp,%ebp
c0008cde:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008ce3:	5d                   	pop    %ebp
c0008ce4:	c3                   	ret    

c0008ce5 <sys_write>:
c0008ce5:	55                   	push   %ebp
c0008ce6:	89 e5                	mov    %esp,%ebp
c0008ce8:	83 ec 18             	sub    $0x18,%esp
c0008ceb:	8b 45 10             	mov    0x10(%ebp),%eax
c0008cee:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0008cf4:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0008cfa:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0008cff:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008d02:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008d05:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008d08:	8b 45 08             	mov    0x8(%ebp),%eax
c0008d0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008d0e:	eb 20                	jmp    c0008d30 <sys_write+0x4b>
c0008d10:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008d13:	0f b6 00             	movzbl (%eax),%eax
c0008d16:	0f b6 c0             	movzbl %al,%eax
c0008d19:	83 ec 08             	sub    $0x8,%esp
c0008d1c:	50                   	push   %eax
c0008d1d:	ff 75 ec             	pushl  -0x14(%ebp)
c0008d20:	e8 9c c2 ff ff       	call   c0004fc1 <out_char>
c0008d25:	83 c4 10             	add    $0x10,%esp
c0008d28:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008d2c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0008d30:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008d34:	7f da                	jg     c0008d10 <sys_write+0x2b>
c0008d36:	90                   	nop
c0008d37:	c9                   	leave  
c0008d38:	c3                   	ret    

c0008d39 <milli_delay>:
c0008d39:	55                   	push   %ebp
c0008d3a:	89 e5                	mov    %esp,%ebp
c0008d3c:	83 ec 18             	sub    $0x18,%esp
c0008d3f:	e8 26 0d 00 00       	call   c0009a6a <get_ticks_ipc>
c0008d44:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008d47:	90                   	nop
c0008d48:	e8 1d 0d 00 00       	call   c0009a6a <get_ticks_ipc>
c0008d4d:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0008d50:	89 c1                	mov    %eax,%ecx
c0008d52:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0008d57:	89 c8                	mov    %ecx,%eax
c0008d59:	f7 ea                	imul   %edx
c0008d5b:	c1 fa 05             	sar    $0x5,%edx
c0008d5e:	89 c8                	mov    %ecx,%eax
c0008d60:	c1 f8 1f             	sar    $0x1f,%eax
c0008d63:	29 c2                	sub    %eax,%edx
c0008d65:	89 d0                	mov    %edx,%eax
c0008d67:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0008d6d:	39 45 08             	cmp    %eax,0x8(%ebp)
c0008d70:	77 d6                	ja     c0008d48 <milli_delay+0xf>
c0008d72:	90                   	nop
c0008d73:	c9                   	leave  
c0008d74:	c3                   	ret    

c0008d75 <TaskSys>:
c0008d75:	55                   	push   %ebp
c0008d76:	89 e5                	mov    %esp,%ebp
c0008d78:	eb fe                	jmp    c0008d78 <TaskSys+0x3>

c0008d7a <Printf>:
c0008d7a:	55                   	push   %ebp
c0008d7b:	89 e5                	mov    %esp,%ebp
c0008d7d:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008d83:	83 ec 04             	sub    $0x4,%esp
c0008d86:	68 00 01 00 00       	push   $0x100
c0008d8b:	6a 00                	push   $0x0
c0008d8d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008d93:	50                   	push   %eax
c0008d94:	e8 99 24 00 00       	call   c000b232 <Memset>
c0008d99:	83 c4 10             	add    $0x10,%esp
c0008d9c:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008d9f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008da2:	8b 45 08             	mov    0x8(%ebp),%eax
c0008da5:	83 ec 04             	sub    $0x4,%esp
c0008da8:	ff 75 f4             	pushl  -0xc(%ebp)
c0008dab:	50                   	push   %eax
c0008dac:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008db2:	50                   	push   %eax
c0008db3:	e8 20 00 00 00       	call   c0008dd8 <vsprintf>
c0008db8:	83 c4 10             	add    $0x10,%esp
c0008dbb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008dbe:	83 ec 04             	sub    $0x4,%esp
c0008dc1:	ff 75 f0             	pushl  -0x10(%ebp)
c0008dc4:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008dca:	50                   	push   %eax
c0008dcb:	6a 00                	push   $0x0
c0008dcd:	e8 5c cf ff ff       	call   c0005d2e <write>
c0008dd2:	83 c4 10             	add    $0x10,%esp
c0008dd5:	90                   	nop
c0008dd6:	c9                   	leave  
c0008dd7:	c3                   	ret    

c0008dd8 <vsprintf>:
c0008dd8:	55                   	push   %ebp
c0008dd9:	89 e5                	mov    %esp,%ebp
c0008ddb:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0008de1:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008de7:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0008ded:	83 ec 04             	sub    $0x4,%esp
c0008df0:	6a 40                	push   $0x40
c0008df2:	6a 00                	push   $0x0
c0008df4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008dfa:	50                   	push   %eax
c0008dfb:	e8 32 24 00 00       	call   c000b232 <Memset>
c0008e00:	83 c4 10             	add    $0x10,%esp
c0008e03:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e06:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008e09:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008e10:	8b 45 08             	mov    0x8(%ebp),%eax
c0008e13:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008e16:	e9 53 01 00 00       	jmp    c0008f6e <vsprintf+0x196>
c0008e1b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008e1e:	0f b6 00             	movzbl (%eax),%eax
c0008e21:	3c 25                	cmp    $0x25,%al
c0008e23:	74 16                	je     c0008e3b <vsprintf+0x63>
c0008e25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008e28:	8d 50 01             	lea    0x1(%eax),%edx
c0008e2b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008e2e:	8b 55 0c             	mov    0xc(%ebp),%edx
c0008e31:	0f b6 12             	movzbl (%edx),%edx
c0008e34:	88 10                	mov    %dl,(%eax)
c0008e36:	e9 2f 01 00 00       	jmp    c0008f6a <vsprintf+0x192>
c0008e3b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008e3f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008e42:	0f b6 00             	movzbl (%eax),%eax
c0008e45:	0f be c0             	movsbl %al,%eax
c0008e48:	83 f8 64             	cmp    $0x64,%eax
c0008e4b:	74 26                	je     c0008e73 <vsprintf+0x9b>
c0008e4d:	83 f8 64             	cmp    $0x64,%eax
c0008e50:	7f 0e                	jg     c0008e60 <vsprintf+0x88>
c0008e52:	83 f8 63             	cmp    $0x63,%eax
c0008e55:	0f 84 f2 00 00 00    	je     c0008f4d <vsprintf+0x175>
c0008e5b:	e9 0a 01 00 00       	jmp    c0008f6a <vsprintf+0x192>
c0008e60:	83 f8 73             	cmp    $0x73,%eax
c0008e63:	0f 84 b0 00 00 00    	je     c0008f19 <vsprintf+0x141>
c0008e69:	83 f8 78             	cmp    $0x78,%eax
c0008e6c:	74 5d                	je     c0008ecb <vsprintf+0xf3>
c0008e6e:	e9 f7 00 00 00       	jmp    c0008f6a <vsprintf+0x192>
c0008e73:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008e76:	8b 00                	mov    (%eax),%eax
c0008e78:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008e7b:	83 ec 04             	sub    $0x4,%esp
c0008e7e:	6a 0a                	push   $0xa
c0008e80:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0008e86:	50                   	push   %eax
c0008e87:	ff 75 e8             	pushl  -0x18(%ebp)
c0008e8a:	e8 26 0c 00 00       	call   c0009ab5 <itoa>
c0008e8f:	83 c4 10             	add    $0x10,%esp
c0008e92:	83 ec 08             	sub    $0x8,%esp
c0008e95:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008e9b:	50                   	push   %eax
c0008e9c:	ff 75 f4             	pushl  -0xc(%ebp)
c0008e9f:	e8 ad 23 00 00       	call   c000b251 <Strcpy>
c0008ea4:	83 c4 10             	add    $0x10,%esp
c0008ea7:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008eab:	83 ec 0c             	sub    $0xc,%esp
c0008eae:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008eb4:	50                   	push   %eax
c0008eb5:	e8 b1 23 00 00       	call   c000b26b <Strlen>
c0008eba:	83 c4 10             	add    $0x10,%esp
c0008ebd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008ec0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ec3:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008ec6:	e9 9f 00 00 00       	jmp    c0008f6a <vsprintf+0x192>
c0008ecb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008ece:	8b 00                	mov    (%eax),%eax
c0008ed0:	83 ec 08             	sub    $0x8,%esp
c0008ed3:	50                   	push   %eax
c0008ed4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008eda:	50                   	push   %eax
c0008edb:	e8 b8 e9 ff ff       	call   c0007898 <atoi>
c0008ee0:	83 c4 10             	add    $0x10,%esp
c0008ee3:	83 ec 08             	sub    $0x8,%esp
c0008ee6:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008eec:	50                   	push   %eax
c0008eed:	ff 75 f4             	pushl  -0xc(%ebp)
c0008ef0:	e8 5c 23 00 00       	call   c000b251 <Strcpy>
c0008ef5:	83 c4 10             	add    $0x10,%esp
c0008ef8:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008efc:	83 ec 0c             	sub    $0xc,%esp
c0008eff:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008f05:	50                   	push   %eax
c0008f06:	e8 60 23 00 00       	call   c000b26b <Strlen>
c0008f0b:	83 c4 10             	add    $0x10,%esp
c0008f0e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008f11:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f14:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008f17:	eb 51                	jmp    c0008f6a <vsprintf+0x192>
c0008f19:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f1c:	8b 00                	mov    (%eax),%eax
c0008f1e:	83 ec 08             	sub    $0x8,%esp
c0008f21:	50                   	push   %eax
c0008f22:	ff 75 f4             	pushl  -0xc(%ebp)
c0008f25:	e8 27 23 00 00       	call   c000b251 <Strcpy>
c0008f2a:	83 c4 10             	add    $0x10,%esp
c0008f2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f30:	8b 00                	mov    (%eax),%eax
c0008f32:	83 ec 0c             	sub    $0xc,%esp
c0008f35:	50                   	push   %eax
c0008f36:	e8 30 23 00 00       	call   c000b26b <Strlen>
c0008f3b:	83 c4 10             	add    $0x10,%esp
c0008f3e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008f41:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008f45:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f48:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008f4b:	eb 1d                	jmp    c0008f6a <vsprintf+0x192>
c0008f4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008f50:	0f b6 10             	movzbl (%eax),%edx
c0008f53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f56:	88 10                	mov    %dl,(%eax)
c0008f58:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008f5c:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0008f63:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008f66:	01 45 f4             	add    %eax,-0xc(%ebp)
c0008f69:	90                   	nop
c0008f6a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008f6e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008f71:	0f b6 00             	movzbl (%eax),%eax
c0008f74:	84 c0                	test   %al,%al
c0008f76:	0f 85 9f fe ff ff    	jne    c0008e1b <vsprintf+0x43>
c0008f7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f7f:	2b 45 08             	sub    0x8(%ebp),%eax
c0008f82:	c9                   	leave  
c0008f83:	c3                   	ret    

c0008f84 <printx>:
c0008f84:	55                   	push   %ebp
c0008f85:	89 e5                	mov    %esp,%ebp
c0008f87:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008f8d:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008f90:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f93:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f96:	83 ec 04             	sub    $0x4,%esp
c0008f99:	ff 75 f4             	pushl  -0xc(%ebp)
c0008f9c:	50                   	push   %eax
c0008f9d:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008fa3:	50                   	push   %eax
c0008fa4:	e8 2f fe ff ff       	call   c0008dd8 <vsprintf>
c0008fa9:	83 c4 10             	add    $0x10,%esp
c0008fac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008faf:	83 ec 08             	sub    $0x8,%esp
c0008fb2:	ff 75 f0             	pushl  -0x10(%ebp)
c0008fb5:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008fbb:	50                   	push   %eax
c0008fbc:	e8 27 98 ff ff       	call   c00027e8 <write_debug>
c0008fc1:	83 c4 10             	add    $0x10,%esp
c0008fc4:	90                   	nop
c0008fc5:	c9                   	leave  
c0008fc6:	c3                   	ret    

c0008fc7 <sys_printx>:
c0008fc7:	55                   	push   %ebp
c0008fc8:	89 e5                	mov    %esp,%ebp
c0008fca:	83 ec 28             	sub    $0x28,%esp
c0008fcd:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0008fd2:	85 c0                	test   %eax,%eax
c0008fd4:	75 23                	jne    c0008ff9 <sys_printx+0x32>
c0008fd6:	8b 45 10             	mov    0x10(%ebp),%eax
c0008fd9:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c0008fdf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008fe2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008fe5:	83 ec 08             	sub    $0x8,%esp
c0008fe8:	ff 75 10             	pushl  0x10(%ebp)
c0008feb:	50                   	push   %eax
c0008fec:	e8 d4 ba ff ff       	call   c0004ac5 <Seg2PhyAddrLDT>
c0008ff1:	83 c4 10             	add    $0x10,%esp
c0008ff4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ff7:	eb 19                	jmp    c0009012 <sys_printx+0x4b>
c0008ff9:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0008ffe:	85 c0                	test   %eax,%eax
c0009000:	74 10                	je     c0009012 <sys_printx+0x4b>
c0009002:	83 ec 0c             	sub    $0xc,%esp
c0009005:	6a 30                	push   $0x30
c0009007:	e8 78 ba ff ff       	call   c0004a84 <Seg2PhyAddr>
c000900c:	83 c4 10             	add    $0x10,%esp
c000900f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009012:	8b 55 08             	mov    0x8(%ebp),%edx
c0009015:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009018:	01 d0                	add    %edx,%eax
c000901a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000901d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009020:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0009026:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c000902c:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0009031:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009034:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009037:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000903a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000903d:	0f b6 00             	movzbl (%eax),%eax
c0009040:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0009043:	eb 3a                	jmp    c000907f <sys_printx+0xb8>
c0009045:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009048:	0f b6 00             	movzbl (%eax),%eax
c000904b:	3c 3b                	cmp    $0x3b,%al
c000904d:	74 0a                	je     c0009059 <sys_printx+0x92>
c000904f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009052:	0f b6 00             	movzbl (%eax),%eax
c0009055:	3c 3a                	cmp    $0x3a,%al
c0009057:	75 06                	jne    c000905f <sys_printx+0x98>
c0009059:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000905d:	eb 20                	jmp    c000907f <sys_printx+0xb8>
c000905f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009062:	0f b6 00             	movzbl (%eax),%eax
c0009065:	0f b6 c0             	movzbl %al,%eax
c0009068:	83 ec 08             	sub    $0x8,%esp
c000906b:	50                   	push   %eax
c000906c:	ff 75 e4             	pushl  -0x1c(%ebp)
c000906f:	e8 4d bf ff ff       	call   c0004fc1 <out_char>
c0009074:	83 c4 10             	add    $0x10,%esp
c0009077:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000907b:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c000907f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009083:	7f c0                	jg     c0009045 <sys_printx+0x7e>
c0009085:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c0009089:	75 10                	jne    c000909b <sys_printx+0xd4>
c000908b:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0009090:	85 c0                	test   %eax,%eax
c0009092:	74 13                	je     c00090a7 <sys_printx+0xe0>
c0009094:	e8 17 87 ff ff       	call   c00017b0 <disable_int>
c0009099:	eb 0c                	jmp    c00090a7 <sys_printx+0xe0>
c000909b:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c000909f:	75 06                	jne    c00090a7 <sys_printx+0xe0>
c00090a1:	e8 0a 87 ff ff       	call   c00017b0 <disable_int>
c00090a6:	90                   	nop
c00090a7:	90                   	nop
c00090a8:	c9                   	leave  
c00090a9:	c3                   	ret    

c00090aa <spin>:
c00090aa:	55                   	push   %ebp
c00090ab:	89 e5                	mov    %esp,%ebp
c00090ad:	83 ec 08             	sub    $0x8,%esp
c00090b0:	83 ec 0c             	sub    $0xc,%esp
c00090b3:	ff 75 08             	pushl  0x8(%ebp)
c00090b6:	e8 d1 84 ff ff       	call   c000158c <disp_str>
c00090bb:	83 c4 10             	add    $0x10,%esp
c00090be:	83 ec 0c             	sub    $0xc,%esp
c00090c1:	68 14 ab 00 c0       	push   $0xc000ab14
c00090c6:	e8 c1 84 ff ff       	call   c000158c <disp_str>
c00090cb:	83 c4 10             	add    $0x10,%esp
c00090ce:	eb fe                	jmp    c00090ce <spin+0x24>

c00090d0 <panic>:
c00090d0:	55                   	push   %ebp
c00090d1:	89 e5                	mov    %esp,%ebp
c00090d3:	83 ec 08             	sub    $0x8,%esp
c00090d6:	83 ec 04             	sub    $0x4,%esp
c00090d9:	ff 75 08             	pushl  0x8(%ebp)
c00090dc:	6a 3a                	push   $0x3a
c00090de:	68 b0 af 00 c0       	push   $0xc000afb0
c00090e3:	e8 9c fe ff ff       	call   c0008f84 <printx>
c00090e8:	83 c4 10             	add    $0x10,%esp
c00090eb:	90                   	nop
c00090ec:	c9                   	leave  
c00090ed:	c3                   	ret    

c00090ee <assertion_failure>:
c00090ee:	55                   	push   %ebp
c00090ef:	89 e5                	mov    %esp,%ebp
c00090f1:	83 ec 08             	sub    $0x8,%esp
c00090f4:	83 ec 08             	sub    $0x8,%esp
c00090f7:	ff 75 14             	pushl  0x14(%ebp)
c00090fa:	ff 75 10             	pushl  0x10(%ebp)
c00090fd:	ff 75 0c             	pushl  0xc(%ebp)
c0009100:	ff 75 08             	pushl  0x8(%ebp)
c0009103:	6a 3b                	push   $0x3b
c0009105:	68 b8 af 00 c0       	push   $0xc000afb8
c000910a:	e8 75 fe ff ff       	call   c0008f84 <printx>
c000910f:	83 c4 20             	add    $0x20,%esp
c0009112:	83 ec 0c             	sub    $0xc,%esp
c0009115:	68 eb af 00 c0       	push   $0xc000afeb
c000911a:	e8 8b ff ff ff       	call   c00090aa <spin>
c000911f:	83 c4 10             	add    $0x10,%esp
c0009122:	90                   	nop
c0009123:	c9                   	leave  
c0009124:	c3                   	ret    

c0009125 <dead_lock>:
c0009125:	55                   	push   %ebp
c0009126:	89 e5                	mov    %esp,%ebp
c0009128:	b8 00 00 00 00       	mov    $0x0,%eax
c000912d:	5d                   	pop    %ebp
c000912e:	c3                   	ret    

c000912f <sys_send_msg>:
c000912f:	55                   	push   %ebp
c0009130:	89 e5                	mov    %esp,%ebp
c0009132:	83 ec 48             	sub    $0x48,%esp
c0009135:	83 ec 0c             	sub    $0xc,%esp
c0009138:	ff 75 0c             	pushl  0xc(%ebp)
c000913b:	e8 50 b8 ff ff       	call   c0004990 <pid2proc>
c0009140:	83 c4 10             	add    $0x10,%esp
c0009143:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009146:	83 ec 0c             	sub    $0xc,%esp
c0009149:	ff 75 10             	pushl  0x10(%ebp)
c000914c:	e8 af b8 ff ff       	call   c0004a00 <proc2pid>
c0009151:	83 c4 10             	add    $0x10,%esp
c0009154:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009157:	8b 45 10             	mov    0x10(%ebp),%eax
c000915a:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c0009160:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009163:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000916a:	8b 45 08             	mov    0x8(%ebp),%eax
c000916d:	83 ec 08             	sub    $0x8,%esp
c0009170:	6a 6c                	push   $0x6c
c0009172:	50                   	push   %eax
c0009173:	e8 0c db ff ff       	call   c0006c84 <alloc_virtual_memory>
c0009178:	83 c4 10             	add    $0x10,%esp
c000917b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000917e:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c0009185:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009188:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000918b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000918e:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009191:	89 10                	mov    %edx,(%eax)
c0009193:	83 ec 08             	sub    $0x8,%esp
c0009196:	ff 75 0c             	pushl  0xc(%ebp)
c0009199:	ff 75 e8             	pushl  -0x18(%ebp)
c000919c:	e8 84 ff ff ff       	call   c0009125 <dead_lock>
c00091a1:	83 c4 10             	add    $0x10,%esp
c00091a4:	83 f8 01             	cmp    $0x1,%eax
c00091a7:	75 10                	jne    c00091b9 <sys_send_msg+0x8a>
c00091a9:	83 ec 0c             	sub    $0xc,%esp
c00091ac:	68 f7 af 00 c0       	push   $0xc000aff7
c00091b1:	e8 1a ff ff ff       	call   c00090d0 <panic>
c00091b6:	83 c4 10             	add    $0x10,%esp
c00091b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00091bc:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00091c3:	3c 02                	cmp    $0x2,%al
c00091c5:	0f 85 8a 01 00 00    	jne    c0009355 <sys_send_msg+0x226>
c00091cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00091ce:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00091d4:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c00091d7:	74 12                	je     c00091eb <sys_send_msg+0xbc>
c00091d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00091dc:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00091e2:	83 f8 0e             	cmp    $0xe,%eax
c00091e5:	0f 85 6a 01 00 00    	jne    c0009355 <sys_send_msg+0x226>
c00091eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00091ee:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c00091f4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00091f7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00091fa:	83 ec 08             	sub    $0x8,%esp
c00091fd:	ff 75 ec             	pushl  -0x14(%ebp)
c0009200:	50                   	push   %eax
c0009201:	e8 bf b8 ff ff       	call   c0004ac5 <Seg2PhyAddrLDT>
c0009206:	83 c4 10             	add    $0x10,%esp
c0009209:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000920c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000920f:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009215:	83 ec 08             	sub    $0x8,%esp
c0009218:	6a 6c                	push   $0x6c
c000921a:	50                   	push   %eax
c000921b:	e8 64 da ff ff       	call   c0006c84 <alloc_virtual_memory>
c0009220:	83 c4 10             	add    $0x10,%esp
c0009223:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009226:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009229:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000922c:	83 ec 04             	sub    $0x4,%esp
c000922f:	ff 75 d8             	pushl  -0x28(%ebp)
c0009232:	52                   	push   %edx
c0009233:	50                   	push   %eax
c0009234:	e8 cb 1f 00 00       	call   c000b204 <Memcpy>
c0009239:	83 c4 10             	add    $0x10,%esp
c000923c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000923f:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c0009246:	00 00 00 
c0009249:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000924c:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0009253:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009256:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c000925d:	00 00 00 
c0009260:	8b 45 10             	mov    0x10(%ebp),%eax
c0009263:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c000926a:	00 00 00 
c000926d:	83 ec 0c             	sub    $0xc,%esp
c0009270:	ff 75 ec             	pushl  -0x14(%ebp)
c0009273:	e8 a2 07 00 00       	call   c0009a1a <unblock>
c0009278:	83 c4 10             	add    $0x10,%esp
c000927b:	8b 45 10             	mov    0x10(%ebp),%eax
c000927e:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009285:	84 c0                	test   %al,%al
c0009287:	74 1c                	je     c00092a5 <sys_send_msg+0x176>
c0009289:	68 8a 05 00 00       	push   $0x58a
c000928e:	68 02 b0 00 c0       	push   $0xc000b002
c0009293:	68 02 b0 00 c0       	push   $0xc000b002
c0009298:	68 12 b0 00 c0       	push   $0xc000b012
c000929d:	e8 4c fe ff ff       	call   c00090ee <assertion_failure>
c00092a2:	83 c4 10             	add    $0x10,%esp
c00092a5:	8b 45 10             	mov    0x10(%ebp),%eax
c00092a8:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00092ae:	83 f8 1d             	cmp    $0x1d,%eax
c00092b1:	74 1c                	je     c00092cf <sys_send_msg+0x1a0>
c00092b3:	68 8b 05 00 00       	push   $0x58b
c00092b8:	68 02 b0 00 c0       	push   $0xc000b002
c00092bd:	68 02 b0 00 c0       	push   $0xc000b002
c00092c2:	68 26 b0 00 c0       	push   $0xc000b026
c00092c7:	e8 22 fe ff ff       	call   c00090ee <assertion_failure>
c00092cc:	83 c4 10             	add    $0x10,%esp
c00092cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092d2:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00092d8:	85 c0                	test   %eax,%eax
c00092da:	74 1c                	je     c00092f8 <sys_send_msg+0x1c9>
c00092dc:	68 8d 05 00 00       	push   $0x58d
c00092e1:	68 02 b0 00 c0       	push   $0xc000b002
c00092e6:	68 02 b0 00 c0       	push   $0xc000b002
c00092eb:	68 43 b0 00 c0       	push   $0xc000b043
c00092f0:	e8 f9 fd ff ff       	call   c00090ee <assertion_failure>
c00092f5:	83 c4 10             	add    $0x10,%esp
c00092f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092fb:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009302:	84 c0                	test   %al,%al
c0009304:	74 1c                	je     c0009322 <sys_send_msg+0x1f3>
c0009306:	68 8e 05 00 00       	push   $0x58e
c000930b:	68 02 b0 00 c0       	push   $0xc000b002
c0009310:	68 02 b0 00 c0       	push   $0xc000b002
c0009315:	68 58 b0 00 c0       	push   $0xc000b058
c000931a:	e8 cf fd ff ff       	call   c00090ee <assertion_failure>
c000931f:	83 c4 10             	add    $0x10,%esp
c0009322:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009325:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000932b:	83 f8 1d             	cmp    $0x1d,%eax
c000932e:	0f 84 45 01 00 00    	je     c0009479 <sys_send_msg+0x34a>
c0009334:	68 8f 05 00 00       	push   $0x58f
c0009339:	68 02 b0 00 c0       	push   $0xc000b002
c000933e:	68 02 b0 00 c0       	push   $0xc000b002
c0009343:	68 70 b0 00 c0       	push   $0xc000b070
c0009348:	e8 a1 fd ff ff       	call   c00090ee <assertion_failure>
c000934d:	83 c4 10             	add    $0x10,%esp
c0009350:	e9 24 01 00 00       	jmp    c0009479 <sys_send_msg+0x34a>
c0009355:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000935c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000935f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009362:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009365:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000936b:	85 c0                	test   %eax,%eax
c000936d:	75 1b                	jne    c000938a <sys_send_msg+0x25b>
c000936f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009372:	8b 55 10             	mov    0x10(%ebp),%edx
c0009375:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c000937b:	8b 45 10             	mov    0x10(%ebp),%eax
c000937e:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0009385:	00 00 00 
c0009388:	eb 3f                	jmp    c00093c9 <sys_send_msg+0x29a>
c000938a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000938d:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009393:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009396:	eb 12                	jmp    c00093aa <sys_send_msg+0x27b>
c0009398:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000939b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000939e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00093a1:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00093a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00093aa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00093ae:	75 e8                	jne    c0009398 <sys_send_msg+0x269>
c00093b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00093b3:	8b 55 10             	mov    0x10(%ebp),%edx
c00093b6:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c00093bc:	8b 45 10             	mov    0x10(%ebp),%eax
c00093bf:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00093c6:	00 00 00 
c00093c9:	8b 45 10             	mov    0x10(%ebp),%eax
c00093cc:	8b 55 08             	mov    0x8(%ebp),%edx
c00093cf:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c00093d5:	8b 45 10             	mov    0x10(%ebp),%eax
c00093d8:	8b 55 0c             	mov    0xc(%ebp),%edx
c00093db:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c00093e1:	8b 45 10             	mov    0x10(%ebp),%eax
c00093e4:	c6 80 44 02 00 00 01 	movb   $0x1,0x244(%eax)
c00093eb:	8b 45 10             	mov    0x10(%ebp),%eax
c00093ee:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00093f5:	3c 01                	cmp    $0x1,%al
c00093f7:	74 1c                	je     c0009415 <sys_send_msg+0x2e6>
c00093f9:	68 b0 05 00 00       	push   $0x5b0
c00093fe:	68 02 b0 00 c0       	push   $0xc000b002
c0009403:	68 02 b0 00 c0       	push   $0xc000b002
c0009408:	68 94 b0 00 c0       	push   $0xc000b094
c000940d:	e8 dc fc ff ff       	call   c00090ee <assertion_failure>
c0009412:	83 c4 10             	add    $0x10,%esp
c0009415:	8b 45 10             	mov    0x10(%ebp),%eax
c0009418:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000941e:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0009421:	74 1c                	je     c000943f <sys_send_msg+0x310>
c0009423:	68 b1 05 00 00       	push   $0x5b1
c0009428:	68 02 b0 00 c0       	push   $0xc000b002
c000942d:	68 02 b0 00 c0       	push   $0xc000b002
c0009432:	68 b0 b0 00 c0       	push   $0xc000b0b0
c0009437:	e8 b2 fc ff ff       	call   c00090ee <assertion_failure>
c000943c:	83 c4 10             	add    $0x10,%esp
c000943f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009442:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009448:	39 45 08             	cmp    %eax,0x8(%ebp)
c000944b:	74 1c                	je     c0009469 <sys_send_msg+0x33a>
c000944d:	68 b2 05 00 00       	push   $0x5b2
c0009452:	68 02 b0 00 c0       	push   $0xc000b002
c0009457:	68 02 b0 00 c0       	push   $0xc000b002
c000945c:	68 d2 b0 00 c0       	push   $0xc000b0d2
c0009461:	e8 88 fc ff ff       	call   c00090ee <assertion_failure>
c0009466:	83 c4 10             	add    $0x10,%esp
c0009469:	83 ec 0c             	sub    $0xc,%esp
c000946c:	ff 75 10             	pushl  0x10(%ebp)
c000946f:	e8 6a 05 00 00       	call   c00099de <block>
c0009474:	83 c4 10             	add    $0x10,%esp
c0009477:	eb 01                	jmp    c000947a <sys_send_msg+0x34b>
c0009479:	90                   	nop
c000947a:	b8 00 00 00 00       	mov    $0x0,%eax
c000947f:	c9                   	leave  
c0009480:	c3                   	ret    

c0009481 <sys_receive_msg>:
c0009481:	55                   	push   %ebp
c0009482:	89 e5                	mov    %esp,%ebp
c0009484:	83 ec 48             	sub    $0x48,%esp
c0009487:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000948e:	83 ec 0c             	sub    $0xc,%esp
c0009491:	ff 75 0c             	pushl  0xc(%ebp)
c0009494:	e8 f7 b4 ff ff       	call   c0004990 <pid2proc>
c0009499:	83 c4 10             	add    $0x10,%esp
c000949c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000949f:	83 ec 0c             	sub    $0xc,%esp
c00094a2:	ff 75 10             	pushl  0x10(%ebp)
c00094a5:	e8 56 b5 ff ff       	call   c0004a00 <proc2pid>
c00094aa:	83 c4 10             	add    $0x10,%esp
c00094ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00094b0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00094b7:	8b 45 10             	mov    0x10(%ebp),%eax
c00094ba:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c00094c0:	85 c0                	test   %eax,%eax
c00094c2:	0f 84 c7 00 00 00    	je     c000958f <sys_receive_msg+0x10e>
c00094c8:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c00094cc:	74 0d                	je     c00094db <sys_receive_msg+0x5a>
c00094ce:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c00094d5:	0f 85 b4 00 00 00    	jne    c000958f <sys_receive_msg+0x10e>
c00094db:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c00094e2:	83 ec 0c             	sub    $0xc,%esp
c00094e5:	ff 75 dc             	pushl  -0x24(%ebp)
c00094e8:	e8 d8 d8 ff ff       	call   c0006dc5 <sys_malloc>
c00094ed:	83 c4 10             	add    $0x10,%esp
c00094f0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00094f3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00094f6:	83 ec 04             	sub    $0x4,%esp
c00094f9:	50                   	push   %eax
c00094fa:	6a 00                	push   $0x0
c00094fc:	ff 75 d8             	pushl  -0x28(%ebp)
c00094ff:	e8 2e 1d 00 00       	call   c000b232 <Memset>
c0009504:	83 c4 10             	add    $0x10,%esp
c0009507:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000950a:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009510:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009513:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c000951a:	8b 45 08             	mov    0x8(%ebp),%eax
c000951d:	83 ec 08             	sub    $0x8,%esp
c0009520:	ff 75 dc             	pushl  -0x24(%ebp)
c0009523:	50                   	push   %eax
c0009524:	e8 5b d7 ff ff       	call   c0006c84 <alloc_virtual_memory>
c0009529:	83 c4 10             	add    $0x10,%esp
c000952c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000952f:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009532:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009535:	83 ec 04             	sub    $0x4,%esp
c0009538:	52                   	push   %edx
c0009539:	ff 75 d8             	pushl  -0x28(%ebp)
c000953c:	50                   	push   %eax
c000953d:	e8 c2 1c 00 00       	call   c000b204 <Memcpy>
c0009542:	83 c4 10             	add    $0x10,%esp
c0009545:	8b 45 10             	mov    0x10(%ebp),%eax
c0009548:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c000954f:	00 00 00 
c0009552:	8b 45 10             	mov    0x10(%ebp),%eax
c0009555:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c000955c:	00 00 00 
c000955f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009562:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0009569:	00 00 00 
c000956c:	8b 45 10             	mov    0x10(%ebp),%eax
c000956f:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0009576:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c000957d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009580:	83 ec 08             	sub    $0x8,%esp
c0009583:	ff 75 dc             	pushl  -0x24(%ebp)
c0009586:	50                   	push   %eax
c0009587:	e8 18 db ff ff       	call   c00070a4 <sys_free>
c000958c:	83 c4 10             	add    $0x10,%esp
c000958f:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009593:	0f 84 3f 03 00 00    	je     c00098d8 <sys_receive_msg+0x457>
c0009599:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c000959d:	75 26                	jne    c00095c5 <sys_receive_msg+0x144>
c000959f:	8b 45 10             	mov    0x10(%ebp),%eax
c00095a2:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00095a8:	85 c0                	test   %eax,%eax
c00095aa:	0f 84 8a 00 00 00    	je     c000963a <sys_receive_msg+0x1b9>
c00095b0:	8b 45 10             	mov    0x10(%ebp),%eax
c00095b3:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00095b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00095bc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00095c3:	eb 75                	jmp    c000963a <sys_receive_msg+0x1b9>
c00095c5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00095c9:	78 6f                	js     c000963a <sys_receive_msg+0x1b9>
c00095cb:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
c00095cf:	7f 69                	jg     c000963a <sys_receive_msg+0x1b9>
c00095d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00095d4:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00095db:	3c 01                	cmp    $0x1,%al
c00095dd:	75 5b                	jne    c000963a <sys_receive_msg+0x1b9>
c00095df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00095e2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00095e8:	83 f8 0e             	cmp    $0xe,%eax
c00095eb:	74 0e                	je     c00095fb <sys_receive_msg+0x17a>
c00095ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00095f0:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00095f6:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c00095f9:	75 3f                	jne    c000963a <sys_receive_msg+0x1b9>
c00095fb:	8b 45 10             	mov    0x10(%ebp),%eax
c00095fe:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009604:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009607:	eb 2b                	jmp    c0009634 <sys_receive_msg+0x1b3>
c0009609:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000960c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000960f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009612:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c0009618:	8b 45 0c             	mov    0xc(%ebp),%eax
c000961b:	39 c2                	cmp    %eax,%edx
c000961d:	75 09                	jne    c0009628 <sys_receive_msg+0x1a7>
c000961f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009626:	eb 12                	jmp    c000963a <sys_receive_msg+0x1b9>
c0009628:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000962b:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c0009631:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009634:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009638:	75 cf                	jne    c0009609 <sys_receive_msg+0x188>
c000963a:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c000963e:	0f 85 1e 02 00 00    	jne    c0009862 <sys_receive_msg+0x3e1>
c0009644:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009647:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000964a:	8b 45 08             	mov    0x8(%ebp),%eax
c000964d:	83 ec 08             	sub    $0x8,%esp
c0009650:	6a 6c                	push   $0x6c
c0009652:	50                   	push   %eax
c0009653:	e8 2c d6 ff ff       	call   c0006c84 <alloc_virtual_memory>
c0009658:	83 c4 10             	add    $0x10,%esp
c000965b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000965e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009661:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009667:	83 ec 08             	sub    $0x8,%esp
c000966a:	6a 6c                	push   $0x6c
c000966c:	50                   	push   %eax
c000966d:	e8 12 d6 ff ff       	call   c0006c84 <alloc_virtual_memory>
c0009672:	83 c4 10             	add    $0x10,%esp
c0009675:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009678:	83 ec 04             	sub    $0x4,%esp
c000967b:	6a 6c                	push   $0x6c
c000967d:	ff 75 c8             	pushl  -0x38(%ebp)
c0009680:	ff 75 cc             	pushl  -0x34(%ebp)
c0009683:	e8 7c 1b 00 00       	call   c000b204 <Memcpy>
c0009688:	83 c4 10             	add    $0x10,%esp
c000968b:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000968e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009691:	8b 45 10             	mov    0x10(%ebp),%eax
c0009694:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000969a:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c000969d:	75 21                	jne    c00096c0 <sys_receive_msg+0x23f>
c000969f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00096a2:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c00096a8:	8b 45 10             	mov    0x10(%ebp),%eax
c00096ab:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c00096b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00096b4:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00096bb:	00 00 00 
c00096be:	eb 1f                	jmp    c00096df <sys_receive_msg+0x25e>
c00096c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00096c3:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c00096c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00096cc:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c00096d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00096d5:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00096dc:	00 00 00 
c00096df:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00096e2:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c00096e9:	00 00 00 
c00096ec:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00096ef:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00096f6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00096f9:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0009700:	00 00 00 
c0009703:	8b 45 10             	mov    0x10(%ebp),%eax
c0009706:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c000970d:	00 00 00 
c0009710:	8b 45 10             	mov    0x10(%ebp),%eax
c0009713:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c000971a:	00 00 00 
c000971d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009720:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0009727:	00 00 00 
c000972a:	83 ec 0c             	sub    $0xc,%esp
c000972d:	ff 75 d0             	pushl  -0x30(%ebp)
c0009730:	e8 e5 02 00 00       	call   c0009a1a <unblock>
c0009735:	83 c4 10             	add    $0x10,%esp
c0009738:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000973b:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009741:	85 c0                	test   %eax,%eax
c0009743:	74 1c                	je     c0009761 <sys_receive_msg+0x2e0>
c0009745:	68 29 06 00 00       	push   $0x629
c000974a:	68 02 b0 00 c0       	push   $0xc000b002
c000974f:	68 02 b0 00 c0       	push   $0xc000b002
c0009754:	68 e7 b0 00 c0       	push   $0xc000b0e7
c0009759:	e8 90 f9 ff ff       	call   c00090ee <assertion_failure>
c000975e:	83 c4 10             	add    $0x10,%esp
c0009761:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009764:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000976b:	84 c0                	test   %al,%al
c000976d:	74 1c                	je     c000978b <sys_receive_msg+0x30a>
c000976f:	68 2a 06 00 00       	push   $0x62a
c0009774:	68 02 b0 00 c0       	push   $0xc000b002
c0009779:	68 02 b0 00 c0       	push   $0xc000b002
c000977e:	68 ff b0 00 c0       	push   $0xc000b0ff
c0009783:	e8 66 f9 ff ff       	call   c00090ee <assertion_failure>
c0009788:	83 c4 10             	add    $0x10,%esp
c000978b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000978e:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009794:	83 f8 1d             	cmp    $0x1d,%eax
c0009797:	74 1c                	je     c00097b5 <sys_receive_msg+0x334>
c0009799:	68 2b 06 00 00       	push   $0x62b
c000979e:	68 02 b0 00 c0       	push   $0xc000b002
c00097a3:	68 02 b0 00 c0       	push   $0xc000b002
c00097a8:	68 18 b1 00 c0       	push   $0xc000b118
c00097ad:	e8 3c f9 ff ff       	call   c00090ee <assertion_failure>
c00097b2:	83 c4 10             	add    $0x10,%esp
c00097b5:	8b 45 10             	mov    0x10(%ebp),%eax
c00097b8:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00097be:	85 c0                	test   %eax,%eax
c00097c0:	74 1c                	je     c00097de <sys_receive_msg+0x35d>
c00097c2:	68 2d 06 00 00       	push   $0x62d
c00097c7:	68 02 b0 00 c0       	push   $0xc000b002
c00097cc:	68 02 b0 00 c0       	push   $0xc000b002
c00097d1:	68 43 b0 00 c0       	push   $0xc000b043
c00097d6:	e8 13 f9 ff ff       	call   c00090ee <assertion_failure>
c00097db:	83 c4 10             	add    $0x10,%esp
c00097de:	8b 45 10             	mov    0x10(%ebp),%eax
c00097e1:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00097e8:	84 c0                	test   %al,%al
c00097ea:	74 1c                	je     c0009808 <sys_receive_msg+0x387>
c00097ec:	68 2e 06 00 00       	push   $0x62e
c00097f1:	68 02 b0 00 c0       	push   $0xc000b002
c00097f6:	68 02 b0 00 c0       	push   $0xc000b002
c00097fb:	68 58 b0 00 c0       	push   $0xc000b058
c0009800:	e8 e9 f8 ff ff       	call   c00090ee <assertion_failure>
c0009805:	83 c4 10             	add    $0x10,%esp
c0009808:	8b 45 10             	mov    0x10(%ebp),%eax
c000980b:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009811:	83 f8 1d             	cmp    $0x1d,%eax
c0009814:	74 1c                	je     c0009832 <sys_receive_msg+0x3b1>
c0009816:	68 2f 06 00 00       	push   $0x62f
c000981b:	68 02 b0 00 c0       	push   $0xc000b002
c0009820:	68 02 b0 00 c0       	push   $0xc000b002
c0009825:	68 70 b0 00 c0       	push   $0xc000b070
c000982a:	e8 bf f8 ff ff       	call   c00090ee <assertion_failure>
c000982f:	83 c4 10             	add    $0x10,%esp
c0009832:	8b 45 10             	mov    0x10(%ebp),%eax
c0009835:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000983b:	83 f8 1d             	cmp    $0x1d,%eax
c000983e:	0f 84 8d 00 00 00    	je     c00098d1 <sys_receive_msg+0x450>
c0009844:	68 30 06 00 00       	push   $0x630
c0009849:	68 02 b0 00 c0       	push   $0xc000b002
c000984e:	68 02 b0 00 c0       	push   $0xc000b002
c0009853:	68 3c b1 00 c0       	push   $0xc000b13c
c0009858:	e8 91 f8 ff ff       	call   c00090ee <assertion_failure>
c000985d:	83 c4 10             	add    $0x10,%esp
c0009860:	eb 6f                	jmp    c00098d1 <sys_receive_msg+0x450>
c0009862:	8b 45 10             	mov    0x10(%ebp),%eax
c0009865:	c6 80 44 02 00 00 02 	movb   $0x2,0x244(%eax)
c000986c:	8b 45 10             	mov    0x10(%ebp),%eax
c000986f:	8b 55 08             	mov    0x8(%ebp),%edx
c0009872:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0009878:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c000987c:	75 0f                	jne    c000988d <sys_receive_msg+0x40c>
c000987e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009881:	c7 80 50 02 00 00 0e 	movl   $0xe,0x250(%eax)
c0009888:	00 00 00 
c000988b:	eb 0c                	jmp    c0009899 <sys_receive_msg+0x418>
c000988d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009890:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009893:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009899:	8b 45 10             	mov    0x10(%ebp),%eax
c000989c:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00098a3:	3c 02                	cmp    $0x2,%al
c00098a5:	74 1c                	je     c00098c3 <sys_receive_msg+0x442>
c00098a7:	68 40 06 00 00       	push   $0x640
c00098ac:	68 02 b0 00 c0       	push   $0xc000b002
c00098b1:	68 02 b0 00 c0       	push   $0xc000b002
c00098b6:	68 5b b1 00 c0       	push   $0xc000b15b
c00098bb:	e8 2e f8 ff ff       	call   c00090ee <assertion_failure>
c00098c0:	83 c4 10             	add    $0x10,%esp
c00098c3:	83 ec 0c             	sub    $0xc,%esp
c00098c6:	ff 75 10             	pushl  0x10(%ebp)
c00098c9:	e8 10 01 00 00       	call   c00099de <block>
c00098ce:	83 c4 10             	add    $0x10,%esp
c00098d1:	b8 00 00 00 00       	mov    $0x0,%eax
c00098d6:	eb 02                	jmp    c00098da <sys_receive_msg+0x459>
c00098d8:	90                   	nop
c00098d9:	90                   	nop
c00098da:	c9                   	leave  
c00098db:	c3                   	ret    

c00098dc <disp_str_colour_debug>:
c00098dc:	55                   	push   %ebp
c00098dd:	89 e5                	mov    %esp,%ebp
c00098df:	90                   	nop
c00098e0:	5d                   	pop    %ebp
c00098e1:	c3                   	ret    

c00098e2 <send_rec>:
c00098e2:	55                   	push   %ebp
c00098e3:	89 e5                	mov    %esp,%ebp
c00098e5:	83 ec 18             	sub    $0x18,%esp
c00098e8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00098eb:	83 ec 0c             	sub    $0xc,%esp
c00098ee:	50                   	push   %eax
c00098ef:	e8 fd d3 ff ff       	call   c0006cf1 <get_physical_address>
c00098f4:	83 c4 10             	add    $0x10,%esp
c00098f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00098fa:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c00098fe:	74 28                	je     c0009928 <send_rec+0x46>
c0009900:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009904:	74 22                	je     c0009928 <send_rec+0x46>
c0009906:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000990a:	74 1c                	je     c0009928 <send_rec+0x46>
c000990c:	68 5e 06 00 00       	push   $0x65e
c0009911:	68 02 b0 00 c0       	push   $0xc000b002
c0009916:	68 02 b0 00 c0       	push   $0xc000b002
c000991b:	68 7c b1 00 c0       	push   $0xc000b17c
c0009920:	e8 c9 f7 ff ff       	call   c00090ee <assertion_failure>
c0009925:	83 c4 10             	add    $0x10,%esp
c0009928:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c000992c:	75 12                	jne    c0009940 <send_rec+0x5e>
c000992e:	83 ec 04             	sub    $0x4,%esp
c0009931:	6a 6c                	push   $0x6c
c0009933:	6a 00                	push   $0x0
c0009935:	ff 75 0c             	pushl  0xc(%ebp)
c0009938:	e8 f5 18 00 00       	call   c000b232 <Memset>
c000993d:	83 c4 10             	add    $0x10,%esp
c0009940:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009944:	74 23                	je     c0009969 <send_rec+0x87>
c0009946:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c000994a:	74 34                	je     c0009980 <send_rec+0x9e>
c000994c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009950:	75 72                	jne    c00099c4 <send_rec+0xe2>
c0009952:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009955:	83 ec 08             	sub    $0x8,%esp
c0009958:	ff 75 10             	pushl  0x10(%ebp)
c000995b:	50                   	push   %eax
c000995c:	e8 a7 8e ff ff       	call   c0002808 <send_msg>
c0009961:	83 c4 10             	add    $0x10,%esp
c0009964:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009967:	eb 6e                	jmp    c00099d7 <send_rec+0xf5>
c0009969:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000996c:	83 ec 08             	sub    $0x8,%esp
c000996f:	ff 75 10             	pushl  0x10(%ebp)
c0009972:	50                   	push   %eax
c0009973:	e8 b6 8e ff ff       	call   c000282e <receive_msg>
c0009978:	83 c4 10             	add    $0x10,%esp
c000997b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000997e:	eb 57                	jmp    c00099d7 <send_rec+0xf5>
c0009980:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009983:	83 ec 08             	sub    $0x8,%esp
c0009986:	ff 75 10             	pushl  0x10(%ebp)
c0009989:	50                   	push   %eax
c000998a:	e8 79 8e ff ff       	call   c0002808 <send_msg>
c000998f:	83 c4 10             	add    $0x10,%esp
c0009992:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009995:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009999:	75 3b                	jne    c00099d6 <send_rec+0xf4>
c000999b:	83 ec 04             	sub    $0x4,%esp
c000999e:	6a 6c                	push   $0x6c
c00099a0:	6a 00                	push   $0x0
c00099a2:	ff 75 0c             	pushl  0xc(%ebp)
c00099a5:	e8 88 18 00 00       	call   c000b232 <Memset>
c00099aa:	83 c4 10             	add    $0x10,%esp
c00099ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00099b0:	83 ec 08             	sub    $0x8,%esp
c00099b3:	ff 75 10             	pushl  0x10(%ebp)
c00099b6:	50                   	push   %eax
c00099b7:	e8 72 8e ff ff       	call   c000282e <receive_msg>
c00099bc:	83 c4 10             	add    $0x10,%esp
c00099bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00099c2:	eb 12                	jmp    c00099d6 <send_rec+0xf4>
c00099c4:	83 ec 0c             	sub    $0xc,%esp
c00099c7:	68 b8 b1 00 c0       	push   $0xc000b1b8
c00099cc:	e8 ff f6 ff ff       	call   c00090d0 <panic>
c00099d1:	83 c4 10             	add    $0x10,%esp
c00099d4:	eb 01                	jmp    c00099d7 <send_rec+0xf5>
c00099d6:	90                   	nop
c00099d7:	b8 00 00 00 00       	mov    $0x0,%eax
c00099dc:	c9                   	leave  
c00099dd:	c3                   	ret    

c00099de <block>:
c00099de:	55                   	push   %ebp
c00099df:	89 e5                	mov    %esp,%ebp
c00099e1:	83 ec 08             	sub    $0x8,%esp
c00099e4:	8b 45 08             	mov    0x8(%ebp),%eax
c00099e7:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00099ee:	84 c0                	test   %al,%al
c00099f0:	75 1c                	jne    c0009a0e <block+0x30>
c00099f2:	68 8d 06 00 00       	push   $0x68d
c00099f7:	68 02 b0 00 c0       	push   $0xc000b002
c00099fc:	68 02 b0 00 c0       	push   $0xc000b002
c0009a01:	68 cd b1 00 c0       	push   $0xc000b1cd
c0009a06:	e8 e3 f6 ff ff       	call   c00090ee <assertion_failure>
c0009a0b:	83 c4 10             	add    $0x10,%esp
c0009a0e:	e8 70 ae ff ff       	call   c0004883 <schedule_process>
c0009a13:	b8 00 00 00 00       	mov    $0x0,%eax
c0009a18:	c9                   	leave  
c0009a19:	c3                   	ret    

c0009a1a <unblock>:
c0009a1a:	55                   	push   %ebp
c0009a1b:	89 e5                	mov    %esp,%ebp
c0009a1d:	83 ec 08             	sub    $0x8,%esp
c0009a20:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a23:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009a2a:	84 c0                	test   %al,%al
c0009a2c:	74 1c                	je     c0009a4a <unblock+0x30>
c0009a2e:	68 96 06 00 00       	push   $0x696
c0009a33:	68 02 b0 00 c0       	push   $0xc000b002
c0009a38:	68 02 b0 00 c0       	push   $0xc000b002
c0009a3d:	68 e5 b1 00 c0       	push   $0xc000b1e5
c0009a42:	e8 a7 f6 ff ff       	call   c00090ee <assertion_failure>
c0009a47:	83 c4 10             	add    $0x10,%esp
c0009a4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0009a4d:	05 fc 00 00 00       	add    $0xfc,%eax
c0009a52:	83 ec 08             	sub    $0x8,%esp
c0009a55:	50                   	push   %eax
c0009a56:	68 8c fd 00 c0       	push   $0xc000fd8c
c0009a5b:	e8 59 09 00 00       	call   c000a3b9 <insertToDoubleLinkList>
c0009a60:	83 c4 10             	add    $0x10,%esp
c0009a63:	b8 00 00 00 00       	mov    $0x0,%eax
c0009a68:	c9                   	leave  
c0009a69:	c3                   	ret    

c0009a6a <get_ticks_ipc>:
c0009a6a:	55                   	push   %ebp
c0009a6b:	89 e5                	mov    %esp,%ebp
c0009a6d:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0009a73:	83 ec 04             	sub    $0x4,%esp
c0009a76:	6a 6c                	push   $0x6c
c0009a78:	6a 00                	push   $0x0
c0009a7a:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009a7d:	50                   	push   %eax
c0009a7e:	e8 af 17 00 00       	call   c000b232 <Memset>
c0009a83:	83 c4 10             	add    $0x10,%esp
c0009a86:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c0009a8d:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009a94:	83 ec 04             	sub    $0x4,%esp
c0009a97:	6a 01                	push   $0x1
c0009a99:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009a9c:	50                   	push   %eax
c0009a9d:	6a 03                	push   $0x3
c0009a9f:	e8 3e fe ff ff       	call   c00098e2 <send_rec>
c0009aa4:	83 c4 10             	add    $0x10,%esp
c0009aa7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009aaa:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0009aad:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ab0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ab3:	c9                   	leave  
c0009ab4:	c3                   	ret    

c0009ab5 <itoa>:
c0009ab5:	55                   	push   %ebp
c0009ab6:	89 e5                	mov    %esp,%ebp
c0009ab8:	53                   	push   %ebx
c0009ab9:	83 ec 14             	sub    $0x14,%esp
c0009abc:	8b 45 08             	mov    0x8(%ebp),%eax
c0009abf:	99                   	cltd   
c0009ac0:	f7 7d 10             	idivl  0x10(%ebp)
c0009ac3:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009ac6:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ac9:	99                   	cltd   
c0009aca:	f7 7d 10             	idivl  0x10(%ebp)
c0009acd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ad0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009ad4:	74 14                	je     c0009aea <itoa+0x35>
c0009ad6:	83 ec 04             	sub    $0x4,%esp
c0009ad9:	ff 75 10             	pushl  0x10(%ebp)
c0009adc:	ff 75 0c             	pushl  0xc(%ebp)
c0009adf:	ff 75 f0             	pushl  -0x10(%ebp)
c0009ae2:	e8 ce ff ff ff       	call   c0009ab5 <itoa>
c0009ae7:	83 c4 10             	add    $0x10,%esp
c0009aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009aed:	8d 58 30             	lea    0x30(%eax),%ebx
c0009af0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009af3:	8b 00                	mov    (%eax),%eax
c0009af5:	8d 48 01             	lea    0x1(%eax),%ecx
c0009af8:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009afb:	89 0a                	mov    %ecx,(%edx)
c0009afd:	89 da                	mov    %ebx,%edx
c0009aff:	88 10                	mov    %dl,(%eax)
c0009b01:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009b04:	8b 00                	mov    (%eax),%eax
c0009b06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009b09:	c9                   	leave  
c0009b0a:	c3                   	ret    

c0009b0b <i2a>:
c0009b0b:	55                   	push   %ebp
c0009b0c:	89 e5                	mov    %esp,%ebp
c0009b0e:	53                   	push   %ebx
c0009b0f:	83 ec 14             	sub    $0x14,%esp
c0009b12:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b15:	99                   	cltd   
c0009b16:	f7 7d 0c             	idivl  0xc(%ebp)
c0009b19:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009b1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b1f:	99                   	cltd   
c0009b20:	f7 7d 0c             	idivl  0xc(%ebp)
c0009b23:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b26:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009b2a:	74 14                	je     c0009b40 <i2a+0x35>
c0009b2c:	83 ec 04             	sub    $0x4,%esp
c0009b2f:	ff 75 10             	pushl  0x10(%ebp)
c0009b32:	ff 75 0c             	pushl  0xc(%ebp)
c0009b35:	ff 75 f0             	pushl  -0x10(%ebp)
c0009b38:	e8 ce ff ff ff       	call   c0009b0b <i2a>
c0009b3d:	83 c4 10             	add    $0x10,%esp
c0009b40:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009b44:	7f 0a                	jg     c0009b50 <i2a+0x45>
c0009b46:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b49:	83 c0 30             	add    $0x30,%eax
c0009b4c:	89 c3                	mov    %eax,%ebx
c0009b4e:	eb 08                	jmp    c0009b58 <i2a+0x4d>
c0009b50:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b53:	83 c0 37             	add    $0x37,%eax
c0009b56:	89 c3                	mov    %eax,%ebx
c0009b58:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b5b:	8b 00                	mov    (%eax),%eax
c0009b5d:	8d 48 01             	lea    0x1(%eax),%ecx
c0009b60:	8b 55 10             	mov    0x10(%ebp),%edx
c0009b63:	89 0a                	mov    %ecx,(%edx)
c0009b65:	88 18                	mov    %bl,(%eax)
c0009b67:	8b 45 10             	mov    0x10(%ebp),%eax
c0009b6a:	8b 00                	mov    (%eax),%eax
c0009b6c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009b6f:	c9                   	leave  
c0009b70:	c3                   	ret    

c0009b71 <inform_int>:
c0009b71:	55                   	push   %ebp
c0009b72:	89 e5                	mov    %esp,%ebp
c0009b74:	83 ec 18             	sub    $0x18,%esp
c0009b77:	83 ec 0c             	sub    $0xc,%esp
c0009b7a:	ff 75 08             	pushl  0x8(%ebp)
c0009b7d:	e8 0e ae ff ff       	call   c0004990 <pid2proc>
c0009b82:	83 c4 10             	add    $0x10,%esp
c0009b85:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009b88:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b8b:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009b92:	0f be c0             	movsbl %al,%eax
c0009b95:	83 e0 02             	and    $0x2,%eax
c0009b98:	85 c0                	test   %eax,%eax
c0009b9a:	0f 84 8e 00 00 00    	je     c0009c2e <inform_int+0xbd>
c0009ba0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ba3:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009ba9:	3d 13 02 00 00       	cmp    $0x213,%eax
c0009bae:	74 0e                	je     c0009bbe <inform_int+0x4d>
c0009bb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009bb3:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009bb9:	83 f8 0e             	cmp    $0xe,%eax
c0009bbc:	75 7d                	jne    c0009c3b <inform_int+0xca>
c0009bbe:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c0009bc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009bc8:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009bce:	83 ec 08             	sub    $0x8,%esp
c0009bd1:	ff 75 f0             	pushl  -0x10(%ebp)
c0009bd4:	50                   	push   %eax
c0009bd5:	e8 aa d0 ff ff       	call   c0006c84 <alloc_virtual_memory>
c0009bda:	83 c4 10             	add    $0x10,%esp
c0009bdd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009be0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009be3:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009be9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009bec:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009bf6:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009bfd:	00 00 00 
c0009c00:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c03:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009c0a:	00 00 00 
c0009c0d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009c14:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c17:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0009c1e:	83 ec 0c             	sub    $0xc,%esp
c0009c21:	ff 75 f4             	pushl  -0xc(%ebp)
c0009c24:	e8 f1 fd ff ff       	call   c0009a1a <unblock>
c0009c29:	83 c4 10             	add    $0x10,%esp
c0009c2c:	eb 0d                	jmp    c0009c3b <inform_int+0xca>
c0009c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c31:	c7 80 5c 02 00 00 01 	movl   $0x1,0x25c(%eax)
c0009c38:	00 00 00 
c0009c3b:	90                   	nop
c0009c3c:	c9                   	leave  
c0009c3d:	c3                   	ret    

c0009c3e <strcmp>:
c0009c3e:	55                   	push   %ebp
c0009c3f:	89 e5                	mov    %esp,%ebp
c0009c41:	83 ec 10             	sub    $0x10,%esp
c0009c44:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0009c48:	74 06                	je     c0009c50 <strcmp+0x12>
c0009c4a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009c4e:	75 08                	jne    c0009c58 <strcmp+0x1a>
c0009c50:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c53:	2b 45 0c             	sub    0xc(%ebp),%eax
c0009c56:	eb 53                	jmp    c0009cab <strcmp+0x6d>
c0009c58:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009c5e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009c61:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009c64:	eb 18                	jmp    c0009c7e <strcmp+0x40>
c0009c66:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009c69:	0f b6 10             	movzbl (%eax),%edx
c0009c6c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009c6f:	0f b6 00             	movzbl (%eax),%eax
c0009c72:	38 c2                	cmp    %al,%dl
c0009c74:	75 1e                	jne    c0009c94 <strcmp+0x56>
c0009c76:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009c7a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009c7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009c81:	0f b6 00             	movzbl (%eax),%eax
c0009c84:	84 c0                	test   %al,%al
c0009c86:	74 0d                	je     c0009c95 <strcmp+0x57>
c0009c88:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009c8b:	0f b6 00             	movzbl (%eax),%eax
c0009c8e:	84 c0                	test   %al,%al
c0009c90:	75 d4                	jne    c0009c66 <strcmp+0x28>
c0009c92:	eb 01                	jmp    c0009c95 <strcmp+0x57>
c0009c94:	90                   	nop
c0009c95:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009c98:	0f b6 00             	movzbl (%eax),%eax
c0009c9b:	0f be d0             	movsbl %al,%edx
c0009c9e:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009ca1:	0f b6 00             	movzbl (%eax),%eax
c0009ca4:	0f be c0             	movsbl %al,%eax
c0009ca7:	29 c2                	sub    %eax,%edx
c0009ca9:	89 d0                	mov    %edx,%eax
c0009cab:	c9                   	leave  
c0009cac:	c3                   	ret    

c0009cad <create_user_process_address_space>:
c0009cad:	55                   	push   %ebp
c0009cae:	89 e5                	mov    %esp,%ebp
c0009cb0:	83 ec 18             	sub    $0x18,%esp
c0009cb3:	83 ec 08             	sub    $0x8,%esp
c0009cb6:	6a 00                	push   $0x0
c0009cb8:	6a 01                	push   $0x1
c0009cba:	e8 64 d0 ff ff       	call   c0006d23 <alloc_memory>
c0009cbf:	83 c4 10             	add    $0x10,%esp
c0009cc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009cc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009cc8:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0009ccf:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0009cd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009cd9:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009cde:	c1 e8 0c             	shr    $0xc,%eax
c0009ce1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009ce4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ce7:	83 c0 07             	add    $0x7,%eax
c0009cea:	c1 e8 03             	shr    $0x3,%eax
c0009ced:	89 c2                	mov    %eax,%edx
c0009cef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009cf2:	89 50 04             	mov    %edx,0x4(%eax)
c0009cf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009cf8:	8b 40 04             	mov    0x4(%eax),%eax
c0009cfb:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009d00:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009d06:	85 c0                	test   %eax,%eax
c0009d08:	0f 48 c2             	cmovs  %edx,%eax
c0009d0b:	c1 f8 0c             	sar    $0xc,%eax
c0009d0e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009d11:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009d14:	83 ec 08             	sub    $0x8,%esp
c0009d17:	6a 00                	push   $0x0
c0009d19:	50                   	push   %eax
c0009d1a:	e8 04 d0 ff ff       	call   c0006d23 <alloc_memory>
c0009d1f:	83 c4 10             	add    $0x10,%esp
c0009d22:	89 c2                	mov    %eax,%edx
c0009d24:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d27:	89 10                	mov    %edx,(%eax)
c0009d29:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d2c:	83 ec 0c             	sub    $0xc,%esp
c0009d2f:	50                   	push   %eax
c0009d30:	e8 ec ca ff ff       	call   c0006821 <init_bitmap>
c0009d35:	83 c4 10             	add    $0x10,%esp
c0009d38:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d3b:	c9                   	leave  
c0009d3c:	c3                   	ret    

c0009d3d <user_process>:
c0009d3d:	55                   	push   %ebp
c0009d3e:	89 e5                	mov    %esp,%ebp
c0009d40:	83 ec 28             	sub    $0x28,%esp
c0009d43:	e8 44 7b ff ff       	call   c000188c <get_running_thread_pcb>
c0009d48:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009d4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d4e:	05 00 10 00 00       	add    $0x1000,%eax
c0009d53:	89 c2                	mov    %eax,%edx
c0009d55:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d58:	89 10                	mov    %edx,(%eax)
c0009d5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d5d:	8b 00                	mov    (%eax),%eax
c0009d5f:	8d 90 f0 fe ff ff    	lea    -0x110(%eax),%edx
c0009d65:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d68:	89 10                	mov    %edx,(%eax)
c0009d6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d6d:	8b 00                	mov    (%eax),%eax
c0009d6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009d72:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
c0009d76:	66 c7 45 ec 02 12    	movw   $0x1202,-0x14(%ebp)
c0009d7c:	66 c7 45 ea 48 00    	movw   $0x48,-0x16(%ebp)
c0009d82:	66 c7 45 e8 50 00    	movw   $0x50,-0x18(%ebp)
c0009d88:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009d8c:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
c0009d90:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009d94:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
c0009d98:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009d9c:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
c0009da0:	66 c7 45 e0 38 00    	movw   $0x38,-0x20(%ebp)
c0009da6:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c0009daa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009dad:	89 50 34             	mov    %edx,0x34(%eax)
c0009db0:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009db4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009db7:	89 50 0c             	mov    %edx,0xc(%eax)
c0009dba:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009dbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009dc1:	89 50 04             	mov    %edx,0x4(%eax)
c0009dc4:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009dc8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009dcb:	89 50 08             	mov    %edx,0x8(%eax)
c0009dce:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009dd2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009dd5:	89 50 40             	mov    %edx,0x40(%eax)
c0009dd8:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
c0009ddc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ddf:	89 10                	mov    %edx,(%eax)
c0009de1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009de4:	8b 55 08             	mov    0x8(%ebp),%edx
c0009de7:	89 50 30             	mov    %edx,0x30(%eax)
c0009dea:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
c0009dee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009df1:	89 50 38             	mov    %edx,0x38(%eax)
c0009df4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009df7:	83 ec 0c             	sub    $0xc,%esp
c0009dfa:	50                   	push   %eax
c0009dfb:	e8 61 79 ff ff       	call   c0001761 <restart>
c0009e00:	83 c4 10             	add    $0x10,%esp
c0009e03:	90                   	nop
c0009e04:	c9                   	leave  
c0009e05:	c3                   	ret    

c0009e06 <clone_pcb>:
c0009e06:	55                   	push   %ebp
c0009e07:	89 e5                	mov    %esp,%ebp
c0009e09:	83 ec 28             	sub    $0x28,%esp
c0009e0c:	83 ec 08             	sub    $0x8,%esp
c0009e0f:	6a 00                	push   $0x0
c0009e11:	6a 01                	push   $0x1
c0009e13:	e8 0b cf ff ff       	call   c0006d23 <alloc_memory>
c0009e18:	83 c4 10             	add    $0x10,%esp
c0009e1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009e1e:	83 ec 04             	sub    $0x4,%esp
c0009e21:	68 ac 02 00 00       	push   $0x2ac
c0009e26:	ff 75 08             	pushl  0x8(%ebp)
c0009e29:	ff 75 f4             	pushl  -0xc(%ebp)
c0009e2c:	e8 d3 13 00 00       	call   c000b204 <Memcpy>
c0009e31:	83 c4 10             	add    $0x10,%esp
c0009e34:	a1 30 f7 00 c0       	mov    0xc000f730,%eax
c0009e39:	83 c0 01             	add    $0x1,%eax
c0009e3c:	a3 30 f7 00 c0       	mov    %eax,0xc000f730
c0009e41:	8b 15 30 f7 00 c0    	mov    0xc000f730,%edx
c0009e47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e4a:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c0009e50:	8b 45 08             	mov    0x8(%ebp),%eax
c0009e53:	8b 90 60 02 00 00    	mov    0x260(%eax),%edx
c0009e59:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e5c:	89 90 60 02 00 00    	mov    %edx,0x260(%eax)
c0009e62:	8b 55 08             	mov    0x8(%ebp),%edx
c0009e65:	8b 45 08             	mov    0x8(%ebp),%eax
c0009e68:	8b 00                	mov    (%eax),%eax
c0009e6a:	29 c2                	sub    %eax,%edx
c0009e6c:	89 d0                	mov    %edx,%eax
c0009e6e:	05 00 c0 2a 00       	add    $0x2ac000,%eax
c0009e73:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009e76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e79:	2b 45 f0             	sub    -0x10(%ebp),%eax
c0009e7c:	05 00 c0 2a 00       	add    $0x2ac000,%eax
c0009e81:	89 c2                	mov    %eax,%edx
c0009e83:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e86:	89 10                	mov    %edx,(%eax)
c0009e88:	83 ec 08             	sub    $0x8,%esp
c0009e8b:	6a 00                	push   $0x0
c0009e8d:	6a 01                	push   $0x1
c0009e8f:	e8 8f ce ff ff       	call   c0006d23 <alloc_memory>
c0009e94:	83 c4 10             	add    $0x10,%esp
c0009e97:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009e9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e9d:	05 00 0c 00 00       	add    $0xc00,%eax
c0009ea2:	83 ec 04             	sub    $0x4,%esp
c0009ea5:	68 00 04 00 00       	push   $0x400
c0009eaa:	68 00 fc ff ff       	push   $0xfffffc00
c0009eaf:	50                   	push   %eax
c0009eb0:	e8 4f 13 00 00       	call   c000b204 <Memcpy>
c0009eb5:	83 c4 10             	add    $0x10,%esp
c0009eb8:	83 ec 0c             	sub    $0xc,%esp
c0009ebb:	ff 75 ec             	pushl  -0x14(%ebp)
c0009ebe:	e8 2e ce ff ff       	call   c0006cf1 <get_physical_address>
c0009ec3:	83 c4 10             	add    $0x10,%esp
c0009ec6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009ec9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ecc:	05 fc 0f 00 00       	add    $0xffc,%eax
c0009ed1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009ed4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009ed7:	83 c8 07             	or     $0x7,%eax
c0009eda:	89 c2                	mov    %eax,%edx
c0009edc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009edf:	89 10                	mov    %edx,(%eax)
c0009ee1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ee4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009ee7:	89 50 04             	mov    %edx,0x4(%eax)
c0009eea:	e8 be fd ff ff       	call   c0009cad <create_user_process_address_space>
c0009eef:	89 c2                	mov    %eax,%edx
c0009ef1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ef4:	89 50 08             	mov    %edx,0x8(%eax)
c0009ef7:	8b 45 08             	mov    0x8(%ebp),%eax
c0009efa:	8b 40 08             	mov    0x8(%eax),%eax
c0009efd:	89 c2                	mov    %eax,%edx
c0009eff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f02:	8b 40 08             	mov    0x8(%eax),%eax
c0009f05:	83 ec 04             	sub    $0x4,%esp
c0009f08:	6a 0c                	push   $0xc
c0009f0a:	52                   	push   %edx
c0009f0b:	50                   	push   %eax
c0009f0c:	e8 f3 12 00 00       	call   c000b204 <Memcpy>
c0009f11:	83 c4 10             	add    $0x10,%esp
c0009f14:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f17:	c9                   	leave  
c0009f18:	c3                   	ret    

c0009f19 <build_body_stack>:
c0009f19:	55                   	push   %ebp
c0009f1a:	89 e5                	mov    %esp,%ebp
c0009f1c:	83 ec 38             	sub    $0x38,%esp
c0009f1f:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f22:	8b 40 08             	mov    0x8(%eax),%eax
c0009f25:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009f28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009f2b:	8b 50 04             	mov    0x4(%eax),%edx
c0009f2e:	8b 00                	mov    (%eax),%eax
c0009f30:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009f33:	89 55 cc             	mov    %edx,-0x34(%ebp)
c0009f36:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0009f39:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009f3c:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009f3f:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009f42:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009f45:	8b 40 08             	mov    0x8(%eax),%eax
c0009f48:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009f4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009f52:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0009f59:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009f60:	e9 dd 00 00 00       	jmp    c000a042 <build_body_stack+0x129>
c0009f65:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0009f68:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0009f6b:	01 d0                	add    %edx,%eax
c0009f6d:	0f b6 00             	movzbl (%eax),%eax
c0009f70:	88 45 d7             	mov    %al,-0x29(%ebp)
c0009f73:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0009f7a:	e9 b5 00 00 00       	jmp    c000a034 <build_body_stack+0x11b>
c0009f7f:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0009f83:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009f86:	89 c1                	mov    %eax,%ecx
c0009f88:	d3 fa                	sar    %cl,%edx
c0009f8a:	89 d0                	mov    %edx,%eax
c0009f8c:	83 e0 01             	and    $0x1,%eax
c0009f8f:	85 c0                	test   %eax,%eax
c0009f91:	75 09                	jne    c0009f9c <build_body_stack+0x83>
c0009f93:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0009f97:	e9 94 00 00 00       	jmp    c000a030 <build_body_stack+0x117>
c0009f9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0009f9f:	8b 40 04             	mov    0x4(%eax),%eax
c0009fa2:	83 ec 0c             	sub    $0xc,%esp
c0009fa5:	50                   	push   %eax
c0009fa6:	e8 c5 78 ff ff       	call   c0001870 <update_cr3>
c0009fab:	83 c4 10             	add    $0x10,%esp
c0009fae:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fb1:	c1 e0 0c             	shl    $0xc,%eax
c0009fb4:	89 c2                	mov    %eax,%edx
c0009fb6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009fb9:	01 d0                	add    %edx,%eax
c0009fbb:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009fbe:	81 7d d0 00 60 05 08 	cmpl   $0x8056000,-0x30(%ebp)
c0009fc5:	75 0f                	jne    c0009fd6 <build_body_stack+0xbd>
c0009fc7:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009fca:	83 ec 0c             	sub    $0xc,%esp
c0009fcd:	50                   	push   %eax
c0009fce:	e8 6b d9 ff ff       	call   c000793e <disp_int>
c0009fd3:	83 c4 10             	add    $0x10,%esp
c0009fd6:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0009fd9:	8b 45 10             	mov    0x10(%ebp),%eax
c0009fdc:	83 ec 04             	sub    $0x4,%esp
c0009fdf:	68 00 10 00 00       	push   $0x1000
c0009fe4:	52                   	push   %edx
c0009fe5:	50                   	push   %eax
c0009fe6:	e8 19 12 00 00       	call   c000b204 <Memcpy>
c0009feb:	83 c4 10             	add    $0x10,%esp
c0009fee:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009ff1:	8b 40 04             	mov    0x4(%eax),%eax
c0009ff4:	83 ec 0c             	sub    $0xc,%esp
c0009ff7:	50                   	push   %eax
c0009ff8:	e8 73 78 ff ff       	call   c0001870 <update_cr3>
c0009ffd:	83 c4 10             	add    $0x10,%esp
c000a000:	83 ec 08             	sub    $0x8,%esp
c000a003:	ff 75 d0             	pushl  -0x30(%ebp)
c000a006:	6a 01                	push   $0x1
c000a008:	e8 78 cd ff ff       	call   c0006d85 <get_a_virtual_page>
c000a00d:	83 c4 10             	add    $0x10,%esp
c000a010:	8b 55 10             	mov    0x10(%ebp),%edx
c000a013:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a016:	83 ec 04             	sub    $0x4,%esp
c000a019:	68 00 10 00 00       	push   $0x1000
c000a01e:	52                   	push   %edx
c000a01f:	50                   	push   %eax
c000a020:	e8 df 11 00 00       	call   c000b204 <Memcpy>
c000a025:	83 c4 10             	add    $0x10,%esp
c000a028:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a02c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a030:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a034:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a038:	0f 8e 41 ff ff ff    	jle    c0009f7f <build_body_stack+0x66>
c000a03e:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a042:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a045:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a048:	0f 87 17 ff ff ff    	ja     c0009f65 <build_body_stack+0x4c>
c000a04e:	83 ec 0c             	sub    $0xc,%esp
c000a051:	68 fd b1 00 c0       	push   $0xc000b1fd
c000a056:	e8 31 75 ff ff       	call   c000158c <disp_str>
c000a05b:	83 c4 10             	add    $0x10,%esp
c000a05e:	83 ec 0c             	sub    $0xc,%esp
c000a061:	ff 75 f0             	pushl  -0x10(%ebp)
c000a064:	e8 d5 d8 ff ff       	call   c000793e <disp_int>
c000a069:	83 c4 10             	add    $0x10,%esp
c000a06c:	83 ec 0c             	sub    $0xc,%esp
c000a06f:	68 02 b2 00 c0       	push   $0xc000b202
c000a074:	e8 13 75 ff ff       	call   c000158c <disp_str>
c000a079:	83 c4 10             	add    $0x10,%esp
c000a07c:	90                   	nop
c000a07d:	c9                   	leave  
c000a07e:	c3                   	ret    

c000a07f <build_process_kernel_stack>:
c000a07f:	55                   	push   %ebp
c000a080:	89 e5                	mov    %esp,%ebp
c000a082:	83 ec 20             	sub    $0x20,%esp
c000a085:	8b 45 08             	mov    0x8(%ebp),%eax
c000a088:	05 50 0a 2a 00       	add    $0x2a0a50,%eax
c000a08d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a090:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a093:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a096:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a099:	83 e8 04             	sub    $0x4,%eax
c000a09c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a09f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a0a2:	83 e8 08             	sub    $0x8,%eax
c000a0a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a0a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a0ab:	83 e8 0c             	sub    $0xc,%eax
c000a0ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a0b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a0b4:	83 e8 10             	sub    $0x10,%eax
c000a0b7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a0ba:	ba 61 17 00 c0       	mov    $0xc0001761,%edx
c000a0bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a0c2:	89 10                	mov    %edx,(%eax)
c000a0c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a0c7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a0cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a0d0:	8b 10                	mov    (%eax),%edx
c000a0d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a0d5:	89 10                	mov    %edx,(%eax)
c000a0d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a0da:	8b 10                	mov    (%eax),%edx
c000a0dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0df:	89 10                	mov    %edx,(%eax)
c000a0e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0e4:	8b 10                	mov    (%eax),%edx
c000a0e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0e9:	89 10                	mov    %edx,(%eax)
c000a0eb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0ee:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a0f1:	89 10                	mov    %edx,(%eax)
c000a0f3:	90                   	nop
c000a0f4:	c9                   	leave  
c000a0f5:	c3                   	ret    

c000a0f6 <fork_process>:
c000a0f6:	55                   	push   %ebp
c000a0f7:	89 e5                	mov    %esp,%ebp
c000a0f9:	83 ec 18             	sub    $0x18,%esp
c000a0fc:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0ff:	83 ec 0c             	sub    $0xc,%esp
c000a102:	50                   	push   %eax
c000a103:	e8 88 a8 ff ff       	call   c0004990 <pid2proc>
c000a108:	83 c4 10             	add    $0x10,%esp
c000a10b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a10e:	83 ec 0c             	sub    $0xc,%esp
c000a111:	ff 75 f4             	pushl  -0xc(%ebp)
c000a114:	e8 ed fc ff ff       	call   c0009e06 <clone_pcb>
c000a119:	83 c4 10             	add    $0x10,%esp
c000a11c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a11f:	83 ec 08             	sub    $0x8,%esp
c000a122:	6a 00                	push   $0x0
c000a124:	6a 01                	push   $0x1
c000a126:	e8 f8 cb ff ff       	call   c0006d23 <alloc_memory>
c000a12b:	83 c4 10             	add    $0x10,%esp
c000a12e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a131:	83 ec 04             	sub    $0x4,%esp
c000a134:	ff 75 ec             	pushl  -0x14(%ebp)
c000a137:	ff 75 f0             	pushl  -0x10(%ebp)
c000a13a:	ff 75 f4             	pushl  -0xc(%ebp)
c000a13d:	e8 d7 fd ff ff       	call   c0009f19 <build_body_stack>
c000a142:	83 c4 10             	add    $0x10,%esp
c000a145:	83 ec 0c             	sub    $0xc,%esp
c000a148:	ff 75 f0             	pushl  -0x10(%ebp)
c000a14b:	e8 2f ff ff ff       	call   c000a07f <build_process_kernel_stack>
c000a150:	83 c4 10             	add    $0x10,%esp
c000a153:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a156:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000a15d:	84 c0                	test   %al,%al
c000a15f:	75 31                	jne    c000a192 <fork_process+0x9c>
c000a161:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a164:	05 fc 00 00 00       	add    $0xfc,%eax
c000a169:	83 ec 04             	sub    $0x4,%esp
c000a16c:	6a 08                	push   $0x8
c000a16e:	6a 00                	push   $0x0
c000a170:	50                   	push   %eax
c000a171:	e8 bc 10 00 00       	call   c000b232 <Memset>
c000a176:	83 c4 10             	add    $0x10,%esp
c000a179:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a17c:	05 fc 00 00 00       	add    $0xfc,%eax
c000a181:	83 ec 08             	sub    $0x8,%esp
c000a184:	50                   	push   %eax
c000a185:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a18a:	e8 e5 01 00 00       	call   c000a374 <appendToDoubleLinkList>
c000a18f:	83 c4 10             	add    $0x10,%esp
c000a192:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a195:	05 04 01 00 00       	add    $0x104,%eax
c000a19a:	83 ec 04             	sub    $0x4,%esp
c000a19d:	6a 08                	push   $0x8
c000a19f:	6a 00                	push   $0x0
c000a1a1:	50                   	push   %eax
c000a1a2:	e8 8b 10 00 00       	call   c000b232 <Memset>
c000a1a7:	83 c4 10             	add    $0x10,%esp
c000a1aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1ad:	05 04 01 00 00       	add    $0x104,%eax
c000a1b2:	83 ec 08             	sub    $0x8,%esp
c000a1b5:	50                   	push   %eax
c000a1b6:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a1bb:	e8 b4 01 00 00       	call   c000a374 <appendToDoubleLinkList>
c000a1c0:	83 c4 10             	add    $0x10,%esp
c000a1c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a1c6:	c9                   	leave  
c000a1c7:	c3                   	ret    

c000a1c8 <process_execute>:
c000a1c8:	55                   	push   %ebp
c000a1c9:	89 e5                	mov    %esp,%ebp
c000a1cb:	83 ec 28             	sub    $0x28,%esp
c000a1ce:	e8 c5 02 00 00       	call   c000a498 <thread_init>
c000a1d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a1d6:	83 ec 0c             	sub    $0xc,%esp
c000a1d9:	ff 75 f4             	pushl  -0xc(%ebp)
c000a1dc:	e8 35 03 00 00       	call   c000a516 <thread_create>
c000a1e1:	83 c4 10             	add    $0x10,%esp
c000a1e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a1e7:	05 30 01 00 00       	add    $0x130,%eax
c000a1ec:	83 ec 08             	sub    $0x8,%esp
c000a1ef:	ff 75 10             	pushl  0x10(%ebp)
c000a1f2:	50                   	push   %eax
c000a1f3:	e8 59 10 00 00       	call   c000b251 <Strcpy>
c000a1f8:	83 c4 10             	add    $0x10,%esp
c000a1fb:	83 ec 08             	sub    $0x8,%esp
c000a1fe:	6a 00                	push   $0x0
c000a200:	6a 01                	push   $0x1
c000a202:	e8 1c cb ff ff       	call   c0006d23 <alloc_memory>
c000a207:	83 c4 10             	add    $0x10,%esp
c000a20a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a20d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a210:	05 00 0c 00 00       	add    $0xc00,%eax
c000a215:	83 ec 04             	sub    $0x4,%esp
c000a218:	68 00 04 00 00       	push   $0x400
c000a21d:	68 00 fc ff ff       	push   $0xfffffc00
c000a222:	50                   	push   %eax
c000a223:	e8 dc 0f 00 00       	call   c000b204 <Memcpy>
c000a228:	83 c4 10             	add    $0x10,%esp
c000a22b:	83 ec 0c             	sub    $0xc,%esp
c000a22e:	ff 75 f0             	pushl  -0x10(%ebp)
c000a231:	e8 bb ca ff ff       	call   c0006cf1 <get_physical_address>
c000a236:	83 c4 10             	add    $0x10,%esp
c000a239:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a23c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a23f:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a244:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a247:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a24a:	83 c8 07             	or     $0x7,%eax
c000a24d:	89 c2                	mov    %eax,%edx
c000a24f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a252:	89 10                	mov    %edx,(%eax)
c000a254:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a257:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a25a:	89 50 04             	mov    %edx,0x4(%eax)
c000a25d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a260:	83 c0 0c             	add    $0xc,%eax
c000a263:	83 ec 0c             	sub    $0xc,%esp
c000a266:	50                   	push   %eax
c000a267:	e8 a8 cf ff ff       	call   c0007214 <init_memory_block_desc>
c000a26c:	83 c4 10             	add    $0x10,%esp
c000a26f:	e8 39 fa ff ff       	call   c0009cad <create_user_process_address_space>
c000a274:	89 c2                	mov    %eax,%edx
c000a276:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a279:	89 50 08             	mov    %edx,0x8(%eax)
c000a27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a27f:	8b 00                	mov    (%eax),%eax
c000a281:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a284:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a287:	c7 40 10 3d 9d 00 c0 	movl   $0xc0009d3d,0x10(%eax)
c000a28e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a291:	8b 55 08             	mov    0x8(%ebp),%edx
c000a294:	89 50 18             	mov    %edx,0x18(%eax)
c000a297:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a29a:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a29d:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a2a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a2a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a2a6:	89 50 20             	mov    %edx,0x20(%eax)
c000a2a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a2ac:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a2b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a2b5:	8b 10                	mov    (%eax),%edx
c000a2b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a2ba:	89 50 04             	mov    %edx,0x4(%eax)
c000a2bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a2c0:	8b 50 04             	mov    0x4(%eax),%edx
c000a2c3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a2c6:	89 50 08             	mov    %edx,0x8(%eax)
c000a2c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a2cc:	8b 50 08             	mov    0x8(%eax),%edx
c000a2cf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a2d2:	89 50 0c             	mov    %edx,0xc(%eax)
c000a2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2d8:	05 fc 00 00 00       	add    $0xfc,%eax
c000a2dd:	83 ec 08             	sub    $0x8,%esp
c000a2e0:	50                   	push   %eax
c000a2e1:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a2e6:	e8 89 00 00 00       	call   c000a374 <appendToDoubleLinkList>
c000a2eb:	83 c4 10             	add    $0x10,%esp
c000a2ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2f1:	05 04 01 00 00       	add    $0x104,%eax
c000a2f6:	83 ec 08             	sub    $0x8,%esp
c000a2f9:	50                   	push   %eax
c000a2fa:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a2ff:	e8 70 00 00 00       	call   c000a374 <appendToDoubleLinkList>
c000a304:	83 c4 10             	add    $0x10,%esp
c000a307:	90                   	nop
c000a308:	c9                   	leave  
c000a309:	c3                   	ret    
c000a30a:	66 90                	xchg   %ax,%ax
c000a30c:	66 90                	xchg   %ax,%ax
c000a30e:	66 90                	xchg   %ax,%ax

c000a310 <switch_to>:
c000a310:	56                   	push   %esi
c000a311:	57                   	push   %edi
c000a312:	53                   	push   %ebx
c000a313:	55                   	push   %ebp
c000a314:	89 e5                	mov    %esp,%ebp
c000a316:	8b 45 14             	mov    0x14(%ebp),%eax
c000a319:	89 20                	mov    %esp,(%eax)
c000a31b:	8b 45 18             	mov    0x18(%ebp),%eax
c000a31e:	8b 20                	mov    (%eax),%esp
c000a320:	5d                   	pop    %ebp
c000a321:	5b                   	pop    %ebx
c000a322:	5f                   	pop    %edi
c000a323:	5e                   	pop    %esi
c000a324:	c3                   	ret    

c000a325 <initDoubleLinkList>:
c000a325:	55                   	push   %ebp
c000a326:	89 e5                	mov    %esp,%ebp
c000a328:	8b 45 08             	mov    0x8(%ebp),%eax
c000a32b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a331:	8b 45 08             	mov    0x8(%ebp),%eax
c000a334:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a33b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a33e:	8d 50 08             	lea    0x8(%eax),%edx
c000a341:	8b 45 08             	mov    0x8(%ebp),%eax
c000a344:	89 50 04             	mov    %edx,0x4(%eax)
c000a347:	8b 55 08             	mov    0x8(%ebp),%edx
c000a34a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a34d:	89 50 08             	mov    %edx,0x8(%eax)
c000a350:	90                   	nop
c000a351:	5d                   	pop    %ebp
c000a352:	c3                   	ret    

c000a353 <isListEmpty>:
c000a353:	55                   	push   %ebp
c000a354:	89 e5                	mov    %esp,%ebp
c000a356:	8b 45 08             	mov    0x8(%ebp),%eax
c000a359:	8b 40 04             	mov    0x4(%eax),%eax
c000a35c:	8b 55 08             	mov    0x8(%ebp),%edx
c000a35f:	83 c2 08             	add    $0x8,%edx
c000a362:	39 d0                	cmp    %edx,%eax
c000a364:	75 07                	jne    c000a36d <isListEmpty+0x1a>
c000a366:	b8 01 00 00 00       	mov    $0x1,%eax
c000a36b:	eb 05                	jmp    c000a372 <isListEmpty+0x1f>
c000a36d:	b8 00 00 00 00       	mov    $0x0,%eax
c000a372:	5d                   	pop    %ebp
c000a373:	c3                   	ret    

c000a374 <appendToDoubleLinkList>:
c000a374:	55                   	push   %ebp
c000a375:	89 e5                	mov    %esp,%ebp
c000a377:	83 ec 10             	sub    $0x10,%esp
c000a37a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a37d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a380:	8b 45 08             	mov    0x8(%ebp),%eax
c000a383:	8b 50 08             	mov    0x8(%eax),%edx
c000a386:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a389:	89 10                	mov    %edx,(%eax)
c000a38b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a38e:	8b 40 08             	mov    0x8(%eax),%eax
c000a391:	85 c0                	test   %eax,%eax
c000a393:	74 0c                	je     c000a3a1 <appendToDoubleLinkList+0x2d>
c000a395:	8b 45 08             	mov    0x8(%ebp),%eax
c000a398:	8b 40 08             	mov    0x8(%eax),%eax
c000a39b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a39e:	89 50 04             	mov    %edx,0x4(%eax)
c000a3a1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a3a4:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a3a7:	89 50 08             	mov    %edx,0x8(%eax)
c000a3aa:	8b 45 08             	mov    0x8(%ebp),%eax
c000a3ad:	8d 50 08             	lea    0x8(%eax),%edx
c000a3b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a3b3:	89 50 04             	mov    %edx,0x4(%eax)
c000a3b6:	90                   	nop
c000a3b7:	c9                   	leave  
c000a3b8:	c3                   	ret    

c000a3b9 <insertToDoubleLinkList>:
c000a3b9:	55                   	push   %ebp
c000a3ba:	89 e5                	mov    %esp,%ebp
c000a3bc:	83 ec 10             	sub    $0x10,%esp
c000a3bf:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a3c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a3c5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a3c8:	8b 50 04             	mov    0x4(%eax),%edx
c000a3cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a3ce:	89 50 04             	mov    %edx,0x4(%eax)
c000a3d1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a3d4:	8b 40 04             	mov    0x4(%eax),%eax
c000a3d7:	85 c0                	test   %eax,%eax
c000a3d9:	74 0b                	je     c000a3e6 <insertToDoubleLinkList+0x2d>
c000a3db:	8b 45 08             	mov    0x8(%ebp),%eax
c000a3de:	8b 40 04             	mov    0x4(%eax),%eax
c000a3e1:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a3e4:	89 10                	mov    %edx,(%eax)
c000a3e6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a3e9:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a3ec:	89 50 04             	mov    %edx,0x4(%eax)
c000a3ef:	8b 55 08             	mov    0x8(%ebp),%edx
c000a3f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a3f5:	89 10                	mov    %edx,(%eax)
c000a3f7:	90                   	nop
c000a3f8:	c9                   	leave  
c000a3f9:	c3                   	ret    

c000a3fa <popFromDoubleLinkList>:
c000a3fa:	55                   	push   %ebp
c000a3fb:	89 e5                	mov    %esp,%ebp
c000a3fd:	83 ec 10             	sub    $0x10,%esp
c000a400:	ff 75 08             	pushl  0x8(%ebp)
c000a403:	e8 4b ff ff ff       	call   c000a353 <isListEmpty>
c000a408:	83 c4 04             	add    $0x4,%esp
c000a40b:	3c 01                	cmp    $0x1,%al
c000a40d:	75 07                	jne    c000a416 <popFromDoubleLinkList+0x1c>
c000a40f:	b8 00 00 00 00       	mov    $0x0,%eax
c000a414:	eb 37                	jmp    c000a44d <popFromDoubleLinkList+0x53>
c000a416:	8b 45 08             	mov    0x8(%ebp),%eax
c000a419:	8b 40 08             	mov    0x8(%eax),%eax
c000a41c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a41f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a422:	8b 40 08             	mov    0x8(%eax),%eax
c000a425:	8b 00                	mov    (%eax),%eax
c000a427:	85 c0                	test   %eax,%eax
c000a429:	74 11                	je     c000a43c <popFromDoubleLinkList+0x42>
c000a42b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a42e:	8b 40 08             	mov    0x8(%eax),%eax
c000a431:	8b 00                	mov    (%eax),%eax
c000a433:	8b 55 08             	mov    0x8(%ebp),%edx
c000a436:	83 c2 08             	add    $0x8,%edx
c000a439:	89 50 04             	mov    %edx,0x4(%eax)
c000a43c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a43f:	8b 40 08             	mov    0x8(%eax),%eax
c000a442:	8b 10                	mov    (%eax),%edx
c000a444:	8b 45 08             	mov    0x8(%ebp),%eax
c000a447:	89 50 08             	mov    %edx,0x8(%eax)
c000a44a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a44d:	c9                   	leave  
c000a44e:	c3                   	ret    

c000a44f <findElementInList>:
c000a44f:	55                   	push   %ebp
c000a450:	89 e5                	mov    %esp,%ebp
c000a452:	83 ec 10             	sub    $0x10,%esp
c000a455:	8b 45 10             	mov    0x10(%ebp),%eax
c000a458:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a45b:	eb 11                	jmp    c000a46e <findElementInList+0x1f>
c000a45d:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a460:	8b 45 08             	mov    0x8(%ebp),%eax
c000a463:	39 c2                	cmp    %eax,%edx
c000a465:	75 07                	jne    c000a46e <findElementInList+0x1f>
c000a467:	b8 01 00 00 00       	mov    $0x1,%eax
c000a46c:	eb 10                	jmp    c000a47e <findElementInList+0x2f>
c000a46e:	8d 45 0c             	lea    0xc(%ebp),%eax
c000a471:	83 c0 08             	add    $0x8,%eax
c000a474:	39 45 fc             	cmp    %eax,-0x4(%ebp)
c000a477:	75 e4                	jne    c000a45d <findElementInList+0xe>
c000a479:	b8 00 00 00 00       	mov    $0x0,%eax
c000a47e:	c9                   	leave  
c000a47f:	c3                   	ret    

c000a480 <kernel_thread>:
c000a480:	55                   	push   %ebp
c000a481:	89 e5                	mov    %esp,%ebp
c000a483:	83 ec 08             	sub    $0x8,%esp
c000a486:	fb                   	sti    
c000a487:	83 ec 0c             	sub    $0xc,%esp
c000a48a:	ff 75 0c             	pushl  0xc(%ebp)
c000a48d:	8b 45 08             	mov    0x8(%ebp),%eax
c000a490:	ff d0                	call   *%eax
c000a492:	83 c4 10             	add    $0x10,%esp
c000a495:	90                   	nop
c000a496:	c9                   	leave  
c000a497:	c3                   	ret    

c000a498 <thread_init>:
c000a498:	55                   	push   %ebp
c000a499:	89 e5                	mov    %esp,%ebp
c000a49b:	83 ec 18             	sub    $0x18,%esp
c000a49e:	83 ec 08             	sub    $0x8,%esp
c000a4a1:	6a 00                	push   $0x0
c000a4a3:	6a 01                	push   $0x1
c000a4a5:	e8 79 c8 ff ff       	call   c0006d23 <alloc_memory>
c000a4aa:	83 c4 10             	add    $0x10,%esp
c000a4ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a4b0:	83 ec 04             	sub    $0x4,%esp
c000a4b3:	68 00 10 00 00       	push   $0x1000
c000a4b8:	6a 00                	push   $0x0
c000a4ba:	ff 75 f4             	pushl  -0xc(%ebp)
c000a4bd:	e8 70 0d 00 00       	call   c000b232 <Memset>
c000a4c2:	83 c4 10             	add    $0x10,%esp
c000a4c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4c8:	05 00 10 00 00       	add    $0x1000,%eax
c000a4cd:	89 c2                	mov    %eax,%edx
c000a4cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4d2:	89 10                	mov    %edx,(%eax)
c000a4d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4d7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000a4de:	a1 30 f7 00 c0       	mov    0xc000f730,%eax
c000a4e3:	83 c0 01             	add    $0x1,%eax
c000a4e6:	a3 30 f7 00 c0       	mov    %eax,0xc000f730
c000a4eb:	8b 15 30 f7 00 c0    	mov    0xc000f730,%edx
c000a4f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4f4:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c000a4fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4fd:	c7 80 60 02 00 00 ff 	movl   $0xffffffff,0x260(%eax)
c000a504:	ff ff ff 
c000a507:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a50a:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c000a511:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a514:	c9                   	leave  
c000a515:	c3                   	ret    

c000a516 <thread_create>:
c000a516:	55                   	push   %ebp
c000a517:	89 e5                	mov    %esp,%ebp
c000a519:	83 ec 10             	sub    $0x10,%esp
c000a51c:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000a523:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c000a52a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a52d:	8b 00                	mov    (%eax),%eax
c000a52f:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000a532:	89 c2                	mov    %eax,%edx
c000a534:	8b 45 08             	mov    0x8(%ebp),%eax
c000a537:	89 10                	mov    %edx,(%eax)
c000a539:	8b 45 08             	mov    0x8(%ebp),%eax
c000a53c:	8b 00                	mov    (%eax),%eax
c000a53e:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000a541:	89 c2                	mov    %eax,%edx
c000a543:	8b 45 08             	mov    0x8(%ebp),%eax
c000a546:	89 10                	mov    %edx,(%eax)
c000a548:	90                   	nop
c000a549:	c9                   	leave  
c000a54a:	c3                   	ret    

c000a54b <thread_start>:
c000a54b:	55                   	push   %ebp
c000a54c:	89 e5                	mov    %esp,%ebp
c000a54e:	83 ec 18             	sub    $0x18,%esp
c000a551:	e8 42 ff ff ff       	call   c000a498 <thread_init>
c000a556:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a559:	83 ec 0c             	sub    $0xc,%esp
c000a55c:	ff 75 f4             	pushl  -0xc(%ebp)
c000a55f:	e8 b2 ff ff ff       	call   c000a516 <thread_create>
c000a564:	83 c4 10             	add    $0x10,%esp
c000a567:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a56a:	05 30 01 00 00       	add    $0x130,%eax
c000a56f:	83 ec 08             	sub    $0x8,%esp
c000a572:	ff 75 10             	pushl  0x10(%ebp)
c000a575:	50                   	push   %eax
c000a576:	e8 d6 0c 00 00       	call   c000b251 <Strcpy>
c000a57b:	83 c4 10             	add    $0x10,%esp
c000a57e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a581:	8b 00                	mov    (%eax),%eax
c000a583:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a586:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a589:	c7 40 10 80 a4 00 c0 	movl   $0xc000a480,0x10(%eax)
c000a590:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a593:	8b 55 08             	mov    0x8(%ebp),%edx
c000a596:	89 50 18             	mov    %edx,0x18(%eax)
c000a599:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a59c:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a59f:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a5a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5a5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a5ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5ae:	8b 10                	mov    (%eax),%edx
c000a5b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5b3:	89 50 04             	mov    %edx,0x4(%eax)
c000a5b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5b9:	8b 50 04             	mov    0x4(%eax),%edx
c000a5bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5bf:	89 50 08             	mov    %edx,0x8(%eax)
c000a5c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5c5:	8b 50 08             	mov    0x8(%eax),%edx
c000a5c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a5cb:	89 50 0c             	mov    %edx,0xc(%eax)
c000a5ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5d1:	05 fc 00 00 00       	add    $0xfc,%eax
c000a5d6:	83 ec 08             	sub    $0x8,%esp
c000a5d9:	50                   	push   %eax
c000a5da:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a5df:	e8 90 fd ff ff       	call   c000a374 <appendToDoubleLinkList>
c000a5e4:	83 c4 10             	add    $0x10,%esp
c000a5e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a5ea:	05 04 01 00 00       	add    $0x104,%eax
c000a5ef:	83 ec 08             	sub    $0x8,%esp
c000a5f2:	50                   	push   %eax
c000a5f3:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a5f8:	e8 77 fd ff ff       	call   c000a374 <appendToDoubleLinkList>
c000a5fd:	83 c4 10             	add    $0x10,%esp
c000a600:	90                   	nop
c000a601:	c9                   	leave  
c000a602:	c3                   	ret    
