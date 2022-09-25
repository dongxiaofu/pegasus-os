
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
c0001525:	e8 59 38 00 00       	call   c0004d83 <ReloadGDT>
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
c000154e:	e9 49 03 00 00       	jmp    c000189c <kernel_main>
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
c000156a:	e8 30 6b 00 00       	call   c000809f <test>
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
c0001661:	e8 52 65 00 00       	call   c0007bb8 <exception_handler>
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
c000168d:	e8 71 33 00 00       	call   c0004a03 <clock_handler>
c0001692:	fa                   	cli    
c0001693:	e9 e4 00 00 00       	jmp    c000177c <reenter_restore>

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
c00016c0:	e8 f8 41 00 00       	call   c00058bd <keyboard_handler>
c00016c5:	b0 f8                	mov    $0xf8,%al
c00016c7:	e6 21                	out    %al,$0x21
c00016c9:	fa                   	cli    
c00016ca:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c00016d1:	0f 85 a5 00 00 00    	jne    c000177c <reenter_restore>
c00016d7:	e9 a0 00 00 00       	jmp    c000177c <reenter_restore>

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
c0001707:	e8 33 0f 00 00       	call   c000263f <hd_handler>
c000170c:	b0 bf                	mov    $0xbf,%al
c000170e:	e6 a1                	out    %al,$0xa1
c0001710:	fa                   	cli    
c0001711:	83 3d 44 f7 00 c0 00 	cmpl   $0x0,0xc000f744
c0001718:	75 62                	jne    c000177c <reenter_restore>
c000171a:	eb 60                	jmp    c000177c <reenter_restore>

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
c000175d:	75 1d                	jne    c000177c <reenter_restore>
c000175f:	eb 1b                	jmp    c000177c <reenter_restore>

c0001761 <fork_restart>:
c0001761:	0f a9                	pop    %gs
c0001763:	0f a1                	pop    %fs
c0001765:	07                   	pop    %es
c0001766:	1f                   	pop    %ds
c0001767:	61                   	popa   
c0001768:	cf                   	iret   

c0001769 <restart>:
c0001769:	ff 0d 44 f7 00 c0    	decl   0xc000f744
c000176f:	89 e5                	mov    %esp,%ebp
c0001771:	8b 65 04             	mov    0x4(%ebp),%esp
c0001774:	0f a9                	pop    %gs
c0001776:	0f a1                	pop    %fs
c0001778:	07                   	pop    %es
c0001779:	1f                   	pop    %ds
c000177a:	61                   	popa   
c000177b:	cf                   	iret   

c000177c <reenter_restore>:
c000177c:	ff 0d 44 f7 00 c0    	decl   0xc000f744
c0001782:	0f a9                	pop    %gs
c0001784:	0f a1                	pop    %fs
c0001786:	07                   	pop    %es
c0001787:	1f                   	pop    %ds
c0001788:	61                   	popa   
c0001789:	cf                   	iret   

c000178a <in_byte>:
c000178a:	31 d2                	xor    %edx,%edx
c000178c:	8b 54 24 04          	mov    0x4(%esp),%edx
c0001790:	31 c0                	xor    %eax,%eax
c0001792:	ec                   	in     (%dx),%al
c0001793:	90                   	nop
c0001794:	90                   	nop
c0001795:	c3                   	ret    

c0001796 <out_byte>:
c0001796:	31 d2                	xor    %edx,%edx
c0001798:	31 c0                	xor    %eax,%eax
c000179a:	8b 54 24 04          	mov    0x4(%esp),%edx
c000179e:	8a 44 24 08          	mov    0x8(%esp),%al
c00017a2:	ee                   	out    %al,(%dx)
c00017a3:	90                   	nop
c00017a4:	90                   	nop
c00017a5:	c3                   	ret    

c00017a6 <in_byte2>:
c00017a6:	55                   	push   %ebp
c00017a7:	89 e5                	mov    %esp,%ebp
c00017a9:	52                   	push   %edx
c00017aa:	31 d2                	xor    %edx,%edx
c00017ac:	66 8b 55 08          	mov    0x8(%ebp),%dx
c00017b0:	31 c0                	xor    %eax,%eax
c00017b2:	ec                   	in     (%dx),%al
c00017b3:	90                   	nop
c00017b4:	90                   	nop
c00017b5:	5b                   	pop    %ebx
c00017b6:	5d                   	pop    %ebp
c00017b7:	c3                   	ret    

c00017b8 <disable_int>:
c00017b8:	fa                   	cli    
c00017b9:	c3                   	ret    

c00017ba <enable_int>:
c00017ba:	fb                   	sti    
c00017bb:	c3                   	ret    

c00017bc <check_tss_esp0>:
c00017bc:	55                   	push   %ebp
c00017bd:	89 e5                	mov    %esp,%ebp
c00017bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00017c2:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c00017c5:	83 c0 44             	add    $0x44,%eax
c00017c8:	8b 15 24 16 01 c0    	mov    0xc0011624,%edx
c00017ce:	39 d0                	cmp    %edx,%eax
c00017d0:	74 7c                	je     c000184e <check_tss_esp0.2>

c00017d2 <check_tss_esp0.1>:
c00017d2:	50                   	push   %eax
c00017d3:	52                   	push   %edx
c00017d4:	68 10 e0 00 c0       	push   $0xc000e010
c00017d9:	e8 ae fd ff ff       	call   c000158c <disp_str>
c00017de:	83 c4 04             	add    $0x4,%esp
c00017e1:	5a                   	pop    %edx
c00017e2:	58                   	pop    %eax
c00017e3:	52                   	push   %edx
c00017e4:	50                   	push   %eax
c00017e5:	53                   	push   %ebx
c00017e6:	e8 67 62 00 00       	call   c0007a52 <disp_int>
c00017eb:	83 c4 04             	add    $0x4,%esp
c00017ee:	58                   	pop    %eax
c00017ef:	5a                   	pop    %edx
c00017f0:	52                   	push   %edx
c00017f1:	50                   	push   %eax
c00017f2:	e8 5b 62 00 00       	call   c0007a52 <disp_int>
c00017f7:	58                   	pop    %eax
c00017f8:	5a                   	pop    %edx
c00017f9:	52                   	push   %edx
c00017fa:	50                   	push   %eax
c00017fb:	ff 35 44 f7 00 c0    	pushl  0xc000f744
c0001801:	e8 4c 62 00 00       	call   c0007a52 <disp_int>
c0001806:	83 c4 04             	add    $0x4,%esp
c0001809:	58                   	pop    %eax
c000180a:	5a                   	pop    %edx
c000180b:	52                   	push   %edx
c000180c:	50                   	push   %eax
c000180d:	ff 72 ec             	pushl  -0x14(%edx)
c0001810:	e8 3d 62 00 00       	call   c0007a52 <disp_int>
c0001815:	83 c4 04             	add    $0x4,%esp
c0001818:	58                   	pop    %eax
c0001819:	5a                   	pop    %edx
c000181a:	52                   	push   %edx
c000181b:	50                   	push   %eax
c000181c:	ff 70 ec             	pushl  -0x14(%eax)
c000181f:	e8 2e 62 00 00       	call   c0007a52 <disp_int>
c0001824:	83 c4 04             	add    $0x4,%esp
c0001827:	58                   	pop    %eax
c0001828:	5a                   	pop    %edx
c0001829:	52                   	push   %edx
c000182a:	50                   	push   %eax
c000182b:	ff 35 60 fb 00 c0    	pushl  0xc000fb60
c0001831:	e8 1c 62 00 00       	call   c0007a52 <disp_int>
c0001836:	83 c4 04             	add    $0x4,%esp
c0001839:	58                   	pop    %eax
c000183a:	5a                   	pop    %edx
c000183b:	52                   	push   %edx
c000183c:	50                   	push   %eax
c000183d:	68 00 f7 00 c0       	push   $0xc000f700
c0001842:	e8 0b 62 00 00       	call   c0007a52 <disp_int>
c0001847:	83 c4 04             	add    $0x4,%esp
c000184a:	58                   	pop    %eax
c000184b:	5a                   	pop    %edx
c000184c:	5d                   	pop    %ebp
c000184d:	c3                   	ret    

c000184e <check_tss_esp0.2>:
c000184e:	5d                   	pop    %ebp
c000184f:	c3                   	ret    

c0001850 <enable_8259A_casecade_irq>:
c0001850:	9c                   	pushf  
c0001851:	fa                   	cli    
c0001852:	e4 21                	in     $0x21,%al
c0001854:	24 fb                	and    $0xfb,%al
c0001856:	e6 21                	out    %al,$0x21
c0001858:	9d                   	popf   
c0001859:	c3                   	ret    

c000185a <disable_8259A_casecade_irq>:
c000185a:	9c                   	pushf  
c000185b:	fa                   	cli    
c000185c:	e4 21                	in     $0x21,%al
c000185e:	0c 04                	or     $0x4,%al
c0001860:	e6 21                	out    %al,$0x21
c0001862:	9c                   	pushf  
c0001863:	c3                   	ret    

c0001864 <enable_8259A_slave_winchester_irq>:
c0001864:	9c                   	pushf  
c0001865:	fa                   	cli    
c0001866:	e4 a1                	in     $0xa1,%al
c0001868:	24 bf                	and    $0xbf,%al
c000186a:	e6 a1                	out    %al,$0xa1
c000186c:	9d                   	popf   
c000186d:	c3                   	ret    

c000186e <disable_8259A_slave_winchester_irq>:
c000186e:	9c                   	pushf  
c000186f:	fa                   	cli    
c0001870:	e4 a1                	in     $0xa1,%al
c0001872:	0c 40                	or     $0x40,%al
c0001874:	e6 a1                	out    %al,$0xa1
c0001876:	9d                   	popf   
c0001877:	c3                   	ret    

c0001878 <update_cr3>:
c0001878:	55                   	push   %ebp
c0001879:	89 e5                	mov    %esp,%ebp
c000187b:	8b 45 08             	mov    0x8(%ebp),%eax
c000187e:	0f 22 d8             	mov    %eax,%cr3
c0001881:	89 ec                	mov    %ebp,%esp
c0001883:	5d                   	pop    %ebp
c0001884:	c3                   	ret    

c0001885 <update_tss>:
c0001885:	55                   	push   %ebp
c0001886:	89 e5                	mov    %esp,%ebp
c0001888:	8b 45 08             	mov    0x8(%ebp),%eax
c000188b:	a3 24 16 01 c0       	mov    %eax,0xc0011624
c0001890:	89 ec                	mov    %ebp,%esp
c0001892:	5d                   	pop    %ebp
c0001893:	c3                   	ret    

c0001894 <get_running_thread_pcb>:
c0001894:	89 e0                	mov    %esp,%eax
c0001896:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000189b:	c3                   	ret    

c000189c <kernel_main>:
c000189c:	55                   	push   %ebp
c000189d:	89 e5                	mov    %esp,%ebp
c000189f:	83 ec 08             	sub    $0x8,%esp
c00018a2:	e8 95 00 00 00       	call   c000193c <init>
c00018a7:	83 ec 04             	sub    $0x4,%esp
c00018aa:	68 40 a7 00 c0       	push   $0xc000a740
c00018af:	68 4a a7 00 c0       	push   $0xc000a74a
c00018b4:	68 8e 1a 00 c0       	push   $0xc0001a8e
c00018b9:	e8 7f 8a 00 00       	call   c000a33d <process_execute>
c00018be:	83 c4 10             	add    $0x10,%esp
c00018c1:	83 ec 04             	sub    $0x4,%esp
c00018c4:	68 57 a7 00 c0       	push   $0xc000a757
c00018c9:	68 5f a7 00 c0       	push   $0xc000a75f
c00018ce:	68 ba 57 00 c0       	push   $0xc00057ba
c00018d3:	e8 65 8a 00 00       	call   c000a33d <process_execute>
c00018d8:	83 c4 10             	add    $0x10,%esp
c00018db:	83 ec 04             	sub    $0x4,%esp
c00018de:	68 69 a7 00 c0       	push   $0xc000a769
c00018e3:	68 70 a7 00 c0       	push   $0xc000a770
c00018e8:	68 c3 1a 00 c0       	push   $0xc0001ac3
c00018ed:	e8 4b 8a 00 00       	call   c000a33d <process_execute>
c00018f2:	83 c4 10             	add    $0x10,%esp
c00018f5:	83 ec 04             	sub    $0x4,%esp
c00018f8:	68 79 a7 00 c0       	push   $0xc000a779
c00018fd:	68 81 a7 00 c0       	push   $0xc000a781
c0001902:	68 54 28 00 c0       	push   $0xc0002854
c0001907:	e8 31 8a 00 00       	call   c000a33d <process_execute>
c000190c:	83 c4 10             	add    $0x10,%esp
c000190f:	83 ec 04             	sub    $0x4,%esp
c0001912:	68 8a a7 00 c0       	push   $0xc000a78a
c0001917:	68 91 a7 00 c0       	push   $0xc000a791
c000191c:	68 b6 61 00 c0       	push   $0xc00061b6
c0001921:	e8 17 8a 00 00       	call   c000a33d <process_execute>
c0001926:	83 c4 10             	add    $0x10,%esp
c0001929:	83 ec 0c             	sub    $0xc,%esp
c000192c:	68 9a a7 00 c0       	push   $0xc000a79a
c0001931:	e8 56 fc ff ff       	call   c000158c <disp_str>
c0001936:	83 c4 10             	add    $0x10,%esp
c0001939:	fb                   	sti    
c000193a:	eb fe                	jmp    c000193a <kernel_main+0x9e>

c000193c <init>:
c000193c:	55                   	push   %ebp
c000193d:	89 e5                	mov    %esp,%ebp
c000193f:	83 ec 08             	sub    $0x8,%esp
c0001942:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0001949:	00 00 00 
c000194c:	c7 05 30 f7 00 c0 00 	movl   $0x0,0xc000f730
c0001953:	00 00 00 
c0001956:	83 ec 0c             	sub    $0xc,%esp
c0001959:	68 a4 a7 00 c0       	push   $0xc000a7a4
c000195e:	e8 29 fc ff ff       	call   c000158c <disp_str>
c0001963:	83 c4 10             	add    $0x10,%esp
c0001966:	e8 e9 67 00 00       	call   c0008154 <init_keyboard>
c000196b:	83 ec 0c             	sub    $0xc,%esp
c000196e:	68 00 00 00 02       	push   $0x2000000
c0001973:	e8 f8 5c 00 00       	call   c0007670 <init_memory>
c0001978:	83 c4 10             	add    $0x10,%esp
c000197b:	83 ec 0c             	sub    $0xc,%esp
c000197e:	68 8c fd 00 c0       	push   $0xc000fd8c
c0001983:	e8 0d 8b 00 00       	call   c000a495 <initDoubleLinkList>
c0001988:	83 c4 10             	add    $0x10,%esp
c000198b:	83 ec 0c             	sub    $0xc,%esp
c000198e:	68 d4 1e 01 c0       	push   $0xc0011ed4
c0001993:	e8 fd 8a 00 00       	call   c000a495 <initDoubleLinkList>
c0001998:	83 c4 10             	add    $0x10,%esp
c000199b:	90                   	nop
c000199c:	c9                   	leave  
c000199d:	c3                   	ret    

c000199e <kernel_thread_a>:
c000199e:	55                   	push   %ebp
c000199f:	89 e5                	mov    %esp,%ebp
c00019a1:	83 ec 18             	sub    $0x18,%esp
c00019a4:	83 ec 0c             	sub    $0xc,%esp
c00019a7:	ff 75 08             	pushl  0x8(%ebp)
c00019aa:	e8 dd fb ff ff       	call   c000158c <disp_str>
c00019af:	83 c4 10             	add    $0x10,%esp
c00019b2:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c00019b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00019ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00019c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00019c4:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c00019c9:	83 ec 0c             	sub    $0xc,%esp
c00019cc:	68 aa a7 00 c0       	push   $0xc000a7aa
c00019d1:	e8 b6 fb ff ff       	call   c000158c <disp_str>
c00019d6:	83 c4 10             	add    $0x10,%esp
c00019d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00019dc:	8d 50 01             	lea    0x1(%eax),%edx
c00019df:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00019e2:	83 ec 0c             	sub    $0xc,%esp
c00019e5:	50                   	push   %eax
c00019e6:	e8 67 60 00 00       	call   c0007a52 <disp_int>
c00019eb:	83 c4 10             	add    $0x10,%esp
c00019ee:	83 ec 0c             	sub    $0xc,%esp
c00019f1:	68 b3 a7 00 c0       	push   $0xc000a7b3
c00019f6:	e8 91 fb ff ff       	call   c000158c <disp_str>
c00019fb:	83 c4 10             	add    $0x10,%esp
c00019fe:	eb c1                	jmp    c00019c1 <kernel_thread_a+0x23>

c0001a00 <kernel_thread_b>:
c0001a00:	55                   	push   %ebp
c0001a01:	89 e5                	mov    %esp,%ebp
c0001a03:	83 ec 18             	sub    $0x18,%esp
c0001a06:	83 ec 0c             	sub    $0xc,%esp
c0001a09:	ff 75 08             	pushl  0x8(%ebp)
c0001a0c:	e8 7b fb ff ff       	call   c000158c <disp_str>
c0001a11:	83 c4 10             	add    $0x10,%esp
c0001a14:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c0001a19:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001a1c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a23:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001a26:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c0001a2b:	83 ec 0c             	sub    $0xc,%esp
c0001a2e:	68 b5 a7 00 c0       	push   $0xc000a7b5
c0001a33:	e8 54 fb ff ff       	call   c000158c <disp_str>
c0001a38:	83 c4 10             	add    $0x10,%esp
c0001a3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a3e:	8d 50 01             	lea    0x1(%eax),%edx
c0001a41:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0001a44:	83 ec 0c             	sub    $0xc,%esp
c0001a47:	50                   	push   %eax
c0001a48:	e8 05 60 00 00       	call   c0007a52 <disp_int>
c0001a4d:	83 c4 10             	add    $0x10,%esp
c0001a50:	83 ec 0c             	sub    $0xc,%esp
c0001a53:	68 b3 a7 00 c0       	push   $0xc000a7b3
c0001a58:	e8 2f fb ff ff       	call   c000158c <disp_str>
c0001a5d:	83 c4 10             	add    $0x10,%esp
c0001a60:	eb c1                	jmp    c0001a23 <kernel_thread_b+0x23>

c0001a62 <kernel_thread_c>:
c0001a62:	55                   	push   %ebp
c0001a63:	89 e5                	mov    %esp,%ebp
c0001a65:	83 ec 08             	sub    $0x8,%esp
c0001a68:	83 ec 0c             	sub    $0xc,%esp
c0001a6b:	ff 75 08             	pushl  0x8(%ebp)
c0001a6e:	e8 19 fb ff ff       	call   c000158c <disp_str>
c0001a73:	83 c4 10             	add    $0x10,%esp
c0001a76:	eb fe                	jmp    c0001a76 <kernel_thread_c+0x14>

c0001a78 <kernel_thread_d>:
c0001a78:	55                   	push   %ebp
c0001a79:	89 e5                	mov    %esp,%ebp
c0001a7b:	83 ec 08             	sub    $0x8,%esp
c0001a7e:	83 ec 0c             	sub    $0xc,%esp
c0001a81:	ff 75 08             	pushl  0x8(%ebp)
c0001a84:	e8 03 fb ff ff       	call   c000158c <disp_str>
c0001a89:	83 c4 10             	add    $0x10,%esp
c0001a8c:	eb fe                	jmp    c0001a8c <kernel_thread_d+0x14>

c0001a8e <user_proc_a>:
c0001a8e:	55                   	push   %ebp
c0001a8f:	89 e5                	mov    %esp,%ebp
c0001a91:	83 ec 08             	sub    $0x8,%esp
c0001a94:	83 ec 0c             	sub    $0xc,%esp
c0001a97:	68 be a7 00 c0       	push   $0xc000a7be
c0001a9c:	e8 eb fa ff ff       	call   c000158c <disp_str>
c0001aa1:	83 c4 10             	add    $0x10,%esp
c0001aa4:	e8 99 6b 00 00       	call   c0008642 <INIT_fork>
c0001aa9:	eb fe                	jmp    c0001aa9 <user_proc_a+0x1b>

c0001aab <user_proc_b>:
c0001aab:	55                   	push   %ebp
c0001aac:	89 e5                	mov    %esp,%ebp
c0001aae:	83 ec 08             	sub    $0x8,%esp
c0001ab1:	83 ec 0c             	sub    $0xc,%esp
c0001ab4:	68 d0 a7 00 c0       	push   $0xc000a7d0
c0001ab9:	e8 ce fa ff ff       	call   c000158c <disp_str>
c0001abe:	83 c4 10             	add    $0x10,%esp
c0001ac1:	eb fe                	jmp    c0001ac1 <user_proc_b+0x16>

c0001ac3 <TaskHD>:
c0001ac3:	55                   	push   %ebp
c0001ac4:	89 e5                	mov    %esp,%ebp
c0001ac6:	83 ec 18             	sub    $0x18,%esp
c0001ac9:	e8 c6 fd ff ff       	call   c0001894 <get_running_thread_pcb>
c0001ace:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001ad1:	e8 20 00 00 00       	call   c0001af6 <init_hd>
c0001ad6:	83 ec 0c             	sub    $0xc,%esp
c0001ad9:	6a 6c                	push   $0x6c
c0001adb:	e8 f9 53 00 00       	call   c0006ed9 <sys_malloc>
c0001ae0:	83 c4 10             	add    $0x10,%esp
c0001ae3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001ae6:	83 ec 0c             	sub    $0xc,%esp
c0001ae9:	ff 75 f0             	pushl  -0x10(%ebp)
c0001aec:	e8 1f 00 00 00       	call   c0001b10 <hd_handle>
c0001af1:	83 c4 10             	add    $0x10,%esp
c0001af4:	eb f0                	jmp    c0001ae6 <TaskHD+0x23>

c0001af6 <init_hd>:
c0001af6:	55                   	push   %ebp
c0001af7:	89 e5                	mov    %esp,%ebp
c0001af9:	83 ec 18             	sub    $0x18,%esp
c0001afc:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001b03:	e8 48 fd ff ff       	call   c0001850 <enable_8259A_casecade_irq>
c0001b08:	e8 57 fd ff ff       	call   c0001864 <enable_8259A_slave_winchester_irq>
c0001b0d:	90                   	nop
c0001b0e:	c9                   	leave  
c0001b0f:	c3                   	ret    

c0001b10 <hd_handle>:
c0001b10:	55                   	push   %ebp
c0001b11:	89 e5                	mov    %esp,%ebp
c0001b13:	83 ec 18             	sub    $0x18,%esp
c0001b16:	83 ec 04             	sub    $0x4,%esp
c0001b19:	6a 0e                	push   $0xe
c0001b1b:	ff 75 08             	pushl  0x8(%ebp)
c0001b1e:	6a 02                	push   $0x2
c0001b20:	e8 4e 7f 00 00       	call   c0009a73 <send_rec>
c0001b25:	83 c4 10             	add    $0x10,%esp
c0001b28:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b2b:	8b 40 68             	mov    0x68(%eax),%eax
c0001b2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001b31:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001b35:	0f 84 cc 00 00 00    	je     c0001c07 <hd_handle+0xf7>
c0001b3b:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b3e:	8b 00                	mov    (%eax),%eax
c0001b40:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b43:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b47:	74 2b                	je     c0001b74 <hd_handle+0x64>
c0001b49:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b4d:	74 25                	je     c0001b74 <hd_handle+0x64>
c0001b4f:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b53:	74 1f                	je     c0001b74 <hd_handle+0x64>
c0001b55:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001b59:	74 19                	je     c0001b74 <hd_handle+0x64>
c0001b5b:	6a 69                	push   $0x69
c0001b5d:	68 e4 a7 00 c0       	push   $0xc000a7e4
c0001b62:	68 e4 a7 00 c0       	push   $0xc000a7e4
c0001b67:	68 ec a7 00 c0       	push   $0xc000a7ec
c0001b6c:	e8 b7 76 00 00       	call   c0009228 <assertion_failure>
c0001b71:	83 c4 10             	add    $0x10,%esp
c0001b74:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b78:	74 23                	je     c0001b9d <hd_handle+0x8d>
c0001b7a:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b7e:	77 08                	ja     c0001b88 <hd_handle+0x78>
c0001b80:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b84:	74 10                	je     c0001b96 <hd_handle+0x86>
c0001b86:	eb 34                	jmp    c0001bbc <hd_handle+0xac>
c0001b88:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b8c:	74 0f                	je     c0001b9d <hd_handle+0x8d>
c0001b8e:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001b92:	74 19                	je     c0001bad <hd_handle+0x9d>
c0001b94:	eb 26                	jmp    c0001bbc <hd_handle+0xac>
c0001b96:	e8 1b 07 00 00       	call   c00022b6 <hd_open>
c0001b9b:	eb 30                	jmp    c0001bcd <hd_handle+0xbd>
c0001b9d:	83 ec 0c             	sub    $0xc,%esp
c0001ba0:	ff 75 08             	pushl  0x8(%ebp)
c0001ba3:	e8 38 08 00 00       	call   c00023e0 <hd_rdwt>
c0001ba8:	83 c4 10             	add    $0x10,%esp
c0001bab:	eb 20                	jmp    c0001bcd <hd_handle+0xbd>
c0001bad:	83 ec 0c             	sub    $0xc,%esp
c0001bb0:	6a 00                	push   $0x0
c0001bb2:	e8 4e 07 00 00       	call   c0002305 <get_hd_ioctl>
c0001bb7:	83 c4 10             	add    $0x10,%esp
c0001bba:	eb 11                	jmp    c0001bcd <hd_handle+0xbd>
c0001bbc:	83 ec 0c             	sub    $0xc,%esp
c0001bbf:	68 32 a8 00 c0       	push   $0xc000a832
c0001bc4:	e8 1b 76 00 00       	call   c00091e4 <spin>
c0001bc9:	83 c4 10             	add    $0x10,%esp
c0001bcc:	90                   	nop
c0001bcd:	83 ec 04             	sub    $0x4,%esp
c0001bd0:	6a 6c                	push   $0x6c
c0001bd2:	6a 00                	push   $0x0
c0001bd4:	ff 75 08             	pushl  0x8(%ebp)
c0001bd7:	e8 96 97 00 00       	call   c000b372 <Memset>
c0001bdc:	83 c4 10             	add    $0x10,%esp
c0001bdf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001be2:	c7 40 68 64 00 00 00 	movl   $0x64,0x68(%eax)
c0001be9:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bec:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001bf3:	83 ec 04             	sub    $0x4,%esp
c0001bf6:	6a 04                	push   $0x4
c0001bf8:	ff 75 08             	pushl  0x8(%ebp)
c0001bfb:	6a 01                	push   $0x1
c0001bfd:	e8 71 7e 00 00       	call   c0009a73 <send_rec>
c0001c02:	83 c4 10             	add    $0x10,%esp
c0001c05:	eb 01                	jmp    c0001c08 <hd_handle+0xf8>
c0001c07:	90                   	nop
c0001c08:	c9                   	leave  
c0001c09:	c3                   	ret    

c0001c0a <hd_cmd_out>:
c0001c0a:	55                   	push   %ebp
c0001c0b:	89 e5                	mov    %esp,%ebp
c0001c0d:	83 ec 08             	sub    $0x8,%esp
c0001c10:	83 ec 04             	sub    $0x4,%esp
c0001c13:	68 18 73 01 00       	push   $0x17318
c0001c18:	6a 00                	push   $0x0
c0001c1a:	68 80 00 00 00       	push   $0x80
c0001c1f:	e8 47 0a 00 00       	call   c000266b <waitfor>
c0001c24:	83 c4 10             	add    $0x10,%esp
c0001c27:	85 c0                	test   %eax,%eax
c0001c29:	75 10                	jne    c0001c3b <hd_cmd_out+0x31>
c0001c2b:	83 ec 0c             	sub    $0xc,%esp
c0001c2e:	68 44 a8 00 c0       	push   $0xc000a844
c0001c33:	e8 d2 75 00 00       	call   c000920a <panic>
c0001c38:	83 c4 10             	add    $0x10,%esp
c0001c3b:	83 ec 08             	sub    $0x8,%esp
c0001c3e:	6a 00                	push   $0x0
c0001c40:	68 f6 03 00 00       	push   $0x3f6
c0001c45:	e8 4c fb ff ff       	call   c0001796 <out_byte>
c0001c4a:	83 c4 10             	add    $0x10,%esp
c0001c4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c50:	0f b6 00             	movzbl (%eax),%eax
c0001c53:	0f b6 c0             	movzbl %al,%eax
c0001c56:	83 ec 08             	sub    $0x8,%esp
c0001c59:	50                   	push   %eax
c0001c5a:	68 f1 01 00 00       	push   $0x1f1
c0001c5f:	e8 32 fb ff ff       	call   c0001796 <out_byte>
c0001c64:	83 c4 10             	add    $0x10,%esp
c0001c67:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c6a:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001c6e:	0f b6 c0             	movzbl %al,%eax
c0001c71:	83 ec 08             	sub    $0x8,%esp
c0001c74:	50                   	push   %eax
c0001c75:	68 f2 01 00 00       	push   $0x1f2
c0001c7a:	e8 17 fb ff ff       	call   c0001796 <out_byte>
c0001c7f:	83 c4 10             	add    $0x10,%esp
c0001c82:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c85:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001c89:	0f b6 c0             	movzbl %al,%eax
c0001c8c:	83 ec 08             	sub    $0x8,%esp
c0001c8f:	50                   	push   %eax
c0001c90:	68 f3 01 00 00       	push   $0x1f3
c0001c95:	e8 fc fa ff ff       	call   c0001796 <out_byte>
c0001c9a:	83 c4 10             	add    $0x10,%esp
c0001c9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ca0:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001ca4:	0f b6 c0             	movzbl %al,%eax
c0001ca7:	83 ec 08             	sub    $0x8,%esp
c0001caa:	50                   	push   %eax
c0001cab:	68 f4 01 00 00       	push   $0x1f4
c0001cb0:	e8 e1 fa ff ff       	call   c0001796 <out_byte>
c0001cb5:	83 c4 10             	add    $0x10,%esp
c0001cb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cbb:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001cbf:	0f b6 c0             	movzbl %al,%eax
c0001cc2:	83 ec 08             	sub    $0x8,%esp
c0001cc5:	50                   	push   %eax
c0001cc6:	68 f5 01 00 00       	push   $0x1f5
c0001ccb:	e8 c6 fa ff ff       	call   c0001796 <out_byte>
c0001cd0:	83 c4 10             	add    $0x10,%esp
c0001cd3:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cd6:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001cda:	0f b6 c0             	movzbl %al,%eax
c0001cdd:	83 ec 08             	sub    $0x8,%esp
c0001ce0:	50                   	push   %eax
c0001ce1:	68 f6 01 00 00       	push   $0x1f6
c0001ce6:	e8 ab fa ff ff       	call   c0001796 <out_byte>
c0001ceb:	83 c4 10             	add    $0x10,%esp
c0001cee:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cf1:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001cf5:	0f b6 c0             	movzbl %al,%eax
c0001cf8:	83 ec 08             	sub    $0x8,%esp
c0001cfb:	50                   	push   %eax
c0001cfc:	68 f7 01 00 00       	push   $0x1f7
c0001d01:	e8 90 fa ff ff       	call   c0001796 <out_byte>
c0001d06:	83 c4 10             	add    $0x10,%esp
c0001d09:	90                   	nop
c0001d0a:	c9                   	leave  
c0001d0b:	c3                   	ret    

c0001d0c <hd_identify>:
c0001d0c:	55                   	push   %ebp
c0001d0d:	89 e5                	mov    %esp,%ebp
c0001d0f:	53                   	push   %ebx
c0001d10:	83 ec 24             	sub    $0x24,%esp
c0001d13:	89 e0                	mov    %esp,%eax
c0001d15:	89 c3                	mov    %eax,%ebx
c0001d17:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001d1b:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001d1f:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001d23:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001d27:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001d2b:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d2e:	c1 e0 04             	shl    $0x4,%eax
c0001d31:	83 c8 e0             	or     $0xffffffe0,%eax
c0001d34:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001d37:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001d3b:	83 ec 0c             	sub    $0xc,%esp
c0001d3e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001d41:	50                   	push   %eax
c0001d42:	e8 c3 fe ff ff       	call   c0001c0a <hd_cmd_out>
c0001d47:	83 c4 10             	add    $0x10,%esp
c0001d4a:	e8 40 06 00 00       	call   c000238f <interrupt_wait>
c0001d4f:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001d56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d59:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001d5c:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001d5f:	89 c2                	mov    %eax,%edx
c0001d61:	b8 10 00 00 00       	mov    $0x10,%eax
c0001d66:	83 e8 01             	sub    $0x1,%eax
c0001d69:	01 d0                	add    %edx,%eax
c0001d6b:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001d70:	ba 00 00 00 00       	mov    $0x0,%edx
c0001d75:	f7 f1                	div    %ecx
c0001d77:	6b c0 10             	imul   $0x10,%eax,%eax
c0001d7a:	29 c4                	sub    %eax,%esp
c0001d7c:	89 e0                	mov    %esp,%eax
c0001d7e:	83 c0 00             	add    $0x0,%eax
c0001d81:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001d84:	83 ec 04             	sub    $0x4,%esp
c0001d87:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d8a:	6a 00                	push   $0x0
c0001d8c:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d8f:	e8 de 95 00 00       	call   c000b372 <Memset>
c0001d94:	83 c4 10             	add    $0x10,%esp
c0001d97:	83 ec 04             	sub    $0x4,%esp
c0001d9a:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d9d:	ff 75 ec             	pushl  -0x14(%ebp)
c0001da0:	68 f0 01 00 00       	push   $0x1f0
c0001da5:	e8 1c 96 00 00       	call   c000b3c6 <read_port>
c0001daa:	83 c4 10             	add    $0x10,%esp
c0001dad:	83 ec 0c             	sub    $0xc,%esp
c0001db0:	ff 75 ec             	pushl  -0x14(%ebp)
c0001db3:	e8 0b 00 00 00       	call   c0001dc3 <print_hdinfo>
c0001db8:	83 c4 10             	add    $0x10,%esp
c0001dbb:	89 dc                	mov    %ebx,%esp
c0001dbd:	90                   	nop
c0001dbe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001dc1:	c9                   	leave  
c0001dc2:	c3                   	ret    

c0001dc3 <print_hdinfo>:
c0001dc3:	55                   	push   %ebp
c0001dc4:	89 e5                	mov    %esp,%ebp
c0001dc6:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001dcc:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001dd2:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001dd8:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001ddf:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001de6:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001ded:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001df4:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001dfb:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001e01:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001e07:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001e0e:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001e15:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001e1c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001e23:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001e2a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001e31:	e9 8f 00 00 00       	jmp    c0001ec5 <print_hdinfo+0x102>
c0001e36:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001e3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e40:	89 d0                	mov    %edx,%eax
c0001e42:	01 c0                	add    %eax,%eax
c0001e44:	01 d0                	add    %edx,%eax
c0001e46:	c1 e0 03             	shl    $0x3,%eax
c0001e49:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001e4c:	01 c8                	add    %ecx,%eax
c0001e4e:	83 e8 44             	sub    $0x44,%eax
c0001e51:	0f b7 00             	movzwl (%eax),%eax
c0001e54:	0f b7 c0             	movzwl %ax,%eax
c0001e57:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001e5a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e5d:	01 d0                	add    %edx,%eax
c0001e5f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001e62:	eb 30                	jmp    c0001e94 <print_hdinfo+0xd1>
c0001e64:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e67:	8d 50 01             	lea    0x1(%eax),%edx
c0001e6a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e6d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e70:	83 c2 01             	add    $0x1,%edx
c0001e73:	0f b6 00             	movzbl (%eax),%eax
c0001e76:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001e7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e7d:	8d 50 01             	lea    0x1(%eax),%edx
c0001e80:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e83:	0f b6 00             	movzbl (%eax),%eax
c0001e86:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001e89:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e8c:	01 ca                	add    %ecx,%edx
c0001e8e:	88 02                	mov    %al,(%edx)
c0001e90:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001e94:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e97:	89 d0                	mov    %edx,%eax
c0001e99:	01 c0                	add    %eax,%eax
c0001e9b:	01 d0                	add    %edx,%eax
c0001e9d:	c1 e0 03             	shl    $0x3,%eax
c0001ea0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001ea3:	01 c8                	add    %ecx,%eax
c0001ea5:	83 e8 42             	sub    $0x42,%eax
c0001ea8:	0f b7 00             	movzwl (%eax),%eax
c0001eab:	66 d1 e8             	shr    %ax
c0001eae:	0f b7 c0             	movzwl %ax,%eax
c0001eb1:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001eb4:	7c ae                	jl     c0001e64 <print_hdinfo+0xa1>
c0001eb6:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001eb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001ebc:	01 d0                	add    %edx,%eax
c0001ebe:	c6 00 00             	movb   $0x0,(%eax)
c0001ec1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001ec5:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001ec9:	0f 8e 67 ff ff ff    	jle    c0001e36 <print_hdinfo+0x73>
c0001ecf:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ed2:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001ed6:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001eda:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001ede:	66 c1 e8 08          	shr    $0x8,%ax
c0001ee2:	66 85 c0             	test   %ax,%ax
c0001ee5:	0f 95 c0             	setne  %al
c0001ee8:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001eeb:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001ef2:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001ef8:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001efc:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001f00:	75 15                	jne    c0001f17 <print_hdinfo+0x154>
c0001f02:	83 ec 08             	sub    $0x8,%esp
c0001f05:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001f08:	50                   	push   %eax
c0001f09:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f0c:	50                   	push   %eax
c0001f0d:	e8 7f 94 00 00       	call   c000b391 <Strcpy>
c0001f12:	83 c4 10             	add    $0x10,%esp
c0001f15:	eb 13                	jmp    c0001f2a <print_hdinfo+0x167>
c0001f17:	83 ec 08             	sub    $0x8,%esp
c0001f1a:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001f1d:	50                   	push   %eax
c0001f1e:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f21:	50                   	push   %eax
c0001f22:	e8 6a 94 00 00       	call   c000b391 <Strcpy>
c0001f27:	83 c4 10             	add    $0x10,%esp
c0001f2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f2d:	83 c0 7a             	add    $0x7a,%eax
c0001f30:	0f b7 00             	movzwl (%eax),%eax
c0001f33:	0f b7 d0             	movzwl %ax,%edx
c0001f36:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f39:	83 c0 78             	add    $0x78,%eax
c0001f3c:	0f b7 00             	movzwl (%eax),%eax
c0001f3f:	0f b7 c0             	movzwl %ax,%eax
c0001f42:	83 c0 10             	add    $0x10,%eax
c0001f45:	89 c1                	mov    %eax,%ecx
c0001f47:	d3 e2                	shl    %cl,%edx
c0001f49:	89 d0                	mov    %edx,%eax
c0001f4b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001f4e:	90                   	nop
c0001f4f:	c9                   	leave  
c0001f50:	c3                   	ret    

c0001f51 <print_dpt_entry>:
c0001f51:	55                   	push   %ebp
c0001f52:	89 e5                	mov    %esp,%ebp
c0001f54:	83 ec 08             	sub    $0x8,%esp
c0001f57:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f5a:	8b 40 08             	mov    0x8(%eax),%eax
c0001f5d:	83 ec 08             	sub    $0x8,%esp
c0001f60:	50                   	push   %eax
c0001f61:	68 4e a8 00 c0       	push   $0xc000a84e
c0001f66:	e8 49 6f 00 00       	call   c0008eb4 <Printf>
c0001f6b:	83 c4 10             	add    $0x10,%esp
c0001f6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f71:	8b 40 0c             	mov    0xc(%eax),%eax
c0001f74:	83 ec 08             	sub    $0x8,%esp
c0001f77:	50                   	push   %eax
c0001f78:	68 56 a8 00 c0       	push   $0xc000a856
c0001f7d:	e8 32 6f 00 00       	call   c0008eb4 <Printf>
c0001f82:	83 c4 10             	add    $0x10,%esp
c0001f85:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f88:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001f8c:	0f b6 c0             	movzbl %al,%eax
c0001f8f:	83 ec 08             	sub    $0x8,%esp
c0001f92:	50                   	push   %eax
c0001f93:	68 67 a8 00 c0       	push   $0xc000a867
c0001f98:	e8 17 6f 00 00       	call   c0008eb4 <Printf>
c0001f9d:	83 c4 10             	add    $0x10,%esp
c0001fa0:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fa3:	0f b6 00             	movzbl (%eax),%eax
c0001fa6:	0f b6 c0             	movzbl %al,%eax
c0001fa9:	83 ec 08             	sub    $0x8,%esp
c0001fac:	50                   	push   %eax
c0001fad:	68 75 a8 00 c0       	push   $0xc000a875
c0001fb2:	e8 fd 6e 00 00       	call   c0008eb4 <Printf>
c0001fb7:	83 c4 10             	add    $0x10,%esp
c0001fba:	90                   	nop
c0001fbb:	c9                   	leave  
c0001fbc:	c3                   	ret    

c0001fbd <get_partition_table>:
c0001fbd:	55                   	push   %ebp
c0001fbe:	89 e5                	mov    %esp,%ebp
c0001fc0:	53                   	push   %ebx
c0001fc1:	83 ec 24             	sub    $0x24,%esp
c0001fc4:	89 e0                	mov    %esp,%eax
c0001fc6:	89 c3                	mov    %eax,%ebx
c0001fc8:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001fcc:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001fd0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fd3:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001fd6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fd9:	c1 f8 08             	sar    $0x8,%eax
c0001fdc:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001fdf:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fe2:	c1 f8 10             	sar    $0x10,%eax
c0001fe5:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001fe8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001feb:	c1 f8 18             	sar    $0x18,%eax
c0001fee:	89 c2                	mov    %eax,%edx
c0001ff0:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ff3:	c1 e0 04             	shl    $0x4,%eax
c0001ff6:	09 d0                	or     %edx,%eax
c0001ff8:	83 c8 e0             	or     $0xffffffe0,%eax
c0001ffb:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0001ffe:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0002002:	83 ec 0c             	sub    $0xc,%esp
c0002005:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c0002008:	50                   	push   %eax
c0002009:	e8 fc fb ff ff       	call   c0001c0a <hd_cmd_out>
c000200e:	83 c4 10             	add    $0x10,%esp
c0002011:	e8 79 03 00 00       	call   c000238f <interrupt_wait>
c0002016:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c000201d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002020:	8d 50 ff             	lea    -0x1(%eax),%edx
c0002023:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0002026:	89 c2                	mov    %eax,%edx
c0002028:	b8 10 00 00 00       	mov    $0x10,%eax
c000202d:	83 e8 01             	sub    $0x1,%eax
c0002030:	01 d0                	add    %edx,%eax
c0002032:	b9 10 00 00 00       	mov    $0x10,%ecx
c0002037:	ba 00 00 00 00       	mov    $0x0,%edx
c000203c:	f7 f1                	div    %ecx
c000203e:	6b c0 10             	imul   $0x10,%eax,%eax
c0002041:	29 c4                	sub    %eax,%esp
c0002043:	89 e0                	mov    %esp,%eax
c0002045:	83 c0 00             	add    $0x0,%eax
c0002048:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000204b:	83 ec 04             	sub    $0x4,%esp
c000204e:	ff 75 f4             	pushl  -0xc(%ebp)
c0002051:	6a 00                	push   $0x0
c0002053:	ff 75 ec             	pushl  -0x14(%ebp)
c0002056:	e8 17 93 00 00       	call   c000b372 <Memset>
c000205b:	83 c4 10             	add    $0x10,%esp
c000205e:	83 ec 04             	sub    $0x4,%esp
c0002061:	ff 75 f4             	pushl  -0xc(%ebp)
c0002064:	ff 75 ec             	pushl  -0x14(%ebp)
c0002067:	68 f0 01 00 00       	push   $0x1f0
c000206c:	e8 55 93 00 00       	call   c000b3c6 <read_port>
c0002071:	83 c4 10             	add    $0x10,%esp
c0002074:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002077:	05 be 01 00 00       	add    $0x1be,%eax
c000207c:	83 ec 04             	sub    $0x4,%esp
c000207f:	6a 40                	push   $0x40
c0002081:	50                   	push   %eax
c0002082:	ff 75 10             	pushl  0x10(%ebp)
c0002085:	e8 ba 92 00 00       	call   c000b344 <Memcpy>
c000208a:	83 c4 10             	add    $0x10,%esp
c000208d:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0002094:	89 dc                	mov    %ebx,%esp
c0002096:	90                   	nop
c0002097:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000209a:	c9                   	leave  
c000209b:	c3                   	ret    

c000209c <partition>:
c000209c:	55                   	push   %ebp
c000209d:	89 e5                	mov    %esp,%ebp
c000209f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00020a5:	8b 45 0c             	mov    0xc(%ebp),%eax
c00020a8:	88 45 84             	mov    %al,-0x7c(%ebp)
c00020ab:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00020af:	7f 19                	jg     c00020ca <partition+0x2e>
c00020b1:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00020b4:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00020b9:	89 c8                	mov    %ecx,%eax
c00020bb:	f7 ea                	imul   %edx
c00020bd:	d1 fa                	sar    %edx
c00020bf:	89 c8                	mov    %ecx,%eax
c00020c1:	c1 f8 1f             	sar    $0x1f,%eax
c00020c4:	29 c2                	sub    %eax,%edx
c00020c6:	89 d0                	mov    %edx,%eax
c00020c8:	eb 11                	jmp    c00020db <partition+0x3f>
c00020ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00020cd:	83 e8 10             	sub    $0x10,%eax
c00020d0:	8d 50 3f             	lea    0x3f(%eax),%edx
c00020d3:	85 c0                	test   %eax,%eax
c00020d5:	0f 48 c2             	cmovs  %edx,%eax
c00020d8:	c1 f8 06             	sar    $0x6,%eax
c00020db:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00020de:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c00020e2:	0f 85 cc 00 00 00    	jne    c00021b4 <partition+0x118>
c00020e8:	83 ec 04             	sub    $0x4,%esp
c00020eb:	6a 40                	push   $0x40
c00020ed:	6a 00                	push   $0x0
c00020ef:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00020f2:	50                   	push   %eax
c00020f3:	e8 7a 92 00 00       	call   c000b372 <Memset>
c00020f8:	83 c4 10             	add    $0x10,%esp
c00020fb:	83 ec 04             	sub    $0x4,%esp
c00020fe:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002101:	50                   	push   %eax
c0002102:	6a 00                	push   $0x0
c0002104:	ff 75 e8             	pushl  -0x18(%ebp)
c0002107:	e8 b1 fe ff ff       	call   c0001fbd <get_partition_table>
c000210c:	83 c4 10             	add    $0x10,%esp
c000210f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002116:	e9 8a 00 00 00       	jmp    c00021a5 <partition+0x109>
c000211b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000211e:	83 c0 01             	add    $0x1,%eax
c0002121:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002124:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002127:	c1 e0 04             	shl    $0x4,%eax
c000212a:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000212d:	01 c8                	add    %ecx,%eax
c000212f:	83 e8 5c             	sub    $0x5c,%eax
c0002132:	8b 00                	mov    (%eax),%eax
c0002134:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0002137:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000213a:	c1 e1 03             	shl    $0x3,%ecx
c000213d:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002143:	01 ca                	add    %ecx,%edx
c0002145:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c000214b:	89 02                	mov    %eax,(%edx)
c000214d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002150:	c1 e0 04             	shl    $0x4,%eax
c0002153:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002156:	01 c8                	add    %ecx,%eax
c0002158:	83 e8 58             	sub    $0x58,%eax
c000215b:	8b 00                	mov    (%eax),%eax
c000215d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0002160:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002163:	c1 e1 03             	shl    $0x3,%ecx
c0002166:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000216c:	01 ca                	add    %ecx,%edx
c000216e:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0002174:	89 02                	mov    %eax,(%edx)
c0002176:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002179:	c1 e0 04             	shl    $0x4,%eax
c000217c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000217f:	01 c8                	add    %ecx,%eax
c0002181:	83 e8 60             	sub    $0x60,%eax
c0002184:	0f b6 00             	movzbl (%eax),%eax
c0002187:	3c 05                	cmp    $0x5,%al
c0002189:	75 16                	jne    c00021a1 <partition+0x105>
c000218b:	8b 55 08             	mov    0x8(%ebp),%edx
c000218e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002191:	01 d0                	add    %edx,%eax
c0002193:	83 ec 08             	sub    $0x8,%esp
c0002196:	6a 01                	push   $0x1
c0002198:	50                   	push   %eax
c0002199:	e8 fe fe ff ff       	call   c000209c <partition>
c000219e:	83 c4 10             	add    $0x10,%esp
c00021a1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00021a5:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c00021a9:	0f 8e 6c ff ff ff    	jle    c000211b <partition+0x7f>
c00021af:	e9 ff 00 00 00       	jmp    c00022b3 <partition+0x217>
c00021b4:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c00021b8:	0f 85 f5 00 00 00    	jne    c00022b3 <partition+0x217>
c00021be:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00021c1:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00021c6:	89 c8                	mov    %ecx,%eax
c00021c8:	f7 ea                	imul   %edx
c00021ca:	d1 fa                	sar    %edx
c00021cc:	89 c8                	mov    %ecx,%eax
c00021ce:	c1 f8 1f             	sar    $0x1f,%eax
c00021d1:	29 c2                	sub    %eax,%edx
c00021d3:	89 d0                	mov    %edx,%eax
c00021d5:	c1 e0 02             	shl    $0x2,%eax
c00021d8:	01 d0                	add    %edx,%eax
c00021da:	29 c1                	sub    %eax,%ecx
c00021dc:	89 c8                	mov    %ecx,%eax
c00021de:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00021e1:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00021e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00021e7:	c1 e2 03             	shl    $0x3,%edx
c00021ea:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00021f0:	01 d0                	add    %edx,%eax
c00021f2:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00021f7:	8b 00                	mov    (%eax),%eax
c00021f9:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00021fc:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00021ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002202:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002205:	83 e8 01             	sub    $0x1,%eax
c0002208:	c1 e0 04             	shl    $0x4,%eax
c000220b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000220e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002215:	e9 8c 00 00 00       	jmp    c00022a6 <partition+0x20a>
c000221a:	83 ec 04             	sub    $0x4,%esp
c000221d:	6a 40                	push   $0x40
c000221f:	6a 00                	push   $0x0
c0002221:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002224:	50                   	push   %eax
c0002225:	e8 48 91 00 00       	call   c000b372 <Memset>
c000222a:	83 c4 10             	add    $0x10,%esp
c000222d:	83 ec 04             	sub    $0x4,%esp
c0002230:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002233:	50                   	push   %eax
c0002234:	ff 75 f0             	pushl  -0x10(%ebp)
c0002237:	ff 75 e8             	pushl  -0x18(%ebp)
c000223a:	e8 7e fd ff ff       	call   c0001fbd <get_partition_table>
c000223f:	83 c4 10             	add    $0x10,%esp
c0002242:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002245:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002248:	01 d0                	add    %edx,%eax
c000224a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000224d:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0002250:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002253:	01 c2                	add    %eax,%edx
c0002255:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0002258:	8d 48 04             	lea    0x4(%eax),%ecx
c000225b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000225e:	c1 e1 03             	shl    $0x3,%ecx
c0002261:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002267:	01 c8                	add    %ecx,%eax
c0002269:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000226e:	89 10                	mov    %edx,(%eax)
c0002270:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002273:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0002276:	8d 4a 04             	lea    0x4(%edx),%ecx
c0002279:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000227c:	c1 e1 03             	shl    $0x3,%ecx
c000227f:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002285:	01 ca                	add    %ecx,%edx
c0002287:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c000228d:	89 02                	mov    %eax,(%edx)
c000228f:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0002293:	84 c0                	test   %al,%al
c0002295:	74 1b                	je     c00022b2 <partition+0x216>
c0002297:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000229a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000229d:	01 d0                	add    %edx,%eax
c000229f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00022a2:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00022a6:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c00022aa:	0f 8e 6a ff ff ff    	jle    c000221a <partition+0x17e>
c00022b0:	eb 01                	jmp    c00022b3 <partition+0x217>
c00022b2:	90                   	nop
c00022b3:	90                   	nop
c00022b4:	c9                   	leave  
c00022b5:	c3                   	ret    

c00022b6 <hd_open>:
c00022b6:	55                   	push   %ebp
c00022b7:	89 e5                	mov    %esp,%ebp
c00022b9:	83 ec 18             	sub    $0x18,%esp
c00022bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00022c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022c6:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022cc:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c00022d1:	8b 00                	mov    (%eax),%eax
c00022d3:	8d 50 01             	lea    0x1(%eax),%edx
c00022d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022d9:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022df:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c00022e4:	89 10                	mov    %edx,(%eax)
c00022e6:	83 ec 0c             	sub    $0xc,%esp
c00022e9:	6a 00                	push   $0x0
c00022eb:	e8 1c fa ff ff       	call   c0001d0c <hd_identify>
c00022f0:	83 c4 10             	add    $0x10,%esp
c00022f3:	83 ec 08             	sub    $0x8,%esp
c00022f6:	6a 00                	push   $0x0
c00022f8:	6a 00                	push   $0x0
c00022fa:	e8 9d fd ff ff       	call   c000209c <partition>
c00022ff:	83 c4 10             	add    $0x10,%esp
c0002302:	90                   	nop
c0002303:	c9                   	leave  
c0002304:	c3                   	ret    

c0002305 <get_hd_ioctl>:
c0002305:	55                   	push   %ebp
c0002306:	89 e5                	mov    %esp,%ebp
c0002308:	83 ec 10             	sub    $0x10,%esp
c000230b:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c000230f:	7f 19                	jg     c000232a <get_hd_ioctl+0x25>
c0002311:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002314:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002319:	89 c8                	mov    %ecx,%eax
c000231b:	f7 ea                	imul   %edx
c000231d:	d1 fa                	sar    %edx
c000231f:	89 c8                	mov    %ecx,%eax
c0002321:	c1 f8 1f             	sar    $0x1f,%eax
c0002324:	29 c2                	sub    %eax,%edx
c0002326:	89 d0                	mov    %edx,%eax
c0002328:	eb 11                	jmp    c000233b <get_hd_ioctl+0x36>
c000232a:	8b 45 08             	mov    0x8(%ebp),%eax
c000232d:	83 e8 10             	sub    $0x10,%eax
c0002330:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002333:	85 c0                	test   %eax,%eax
c0002335:	0f 48 c2             	cmovs  %edx,%eax
c0002338:	c1 f8 06             	sar    $0x6,%eax
c000233b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000233e:	8b 55 08             	mov    0x8(%ebp),%edx
c0002341:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0002344:	c1 e2 03             	shl    $0x3,%edx
c0002347:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000234d:	01 d0                	add    %edx,%eax
c000234f:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c0002354:	8b 00                	mov    (%eax),%eax
c0002356:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0002359:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000235c:	c9                   	leave  
c000235d:	c3                   	ret    

c000235e <wait_for>:
c000235e:	55                   	push   %ebp
c000235f:	89 e5                	mov    %esp,%ebp
c0002361:	83 ec 08             	sub    $0x8,%esp
c0002364:	83 ec 04             	sub    $0x4,%esp
c0002367:	68 20 4e 00 00       	push   $0x4e20
c000236c:	6a 08                	push   $0x8
c000236e:	6a 08                	push   $0x8
c0002370:	e8 f6 02 00 00       	call   c000266b <waitfor>
c0002375:	83 c4 10             	add    $0x10,%esp
c0002378:	85 c0                	test   %eax,%eax
c000237a:	75 10                	jne    c000238c <wait_for+0x2e>
c000237c:	83 ec 0c             	sub    $0xc,%esp
c000237f:	68 80 a8 00 c0       	push   $0xc000a880
c0002384:	e8 81 6e 00 00       	call   c000920a <panic>
c0002389:	83 c4 10             	add    $0x10,%esp
c000238c:	90                   	nop
c000238d:	c9                   	leave  
c000238e:	c3                   	ret    

c000238f <interrupt_wait>:
c000238f:	55                   	push   %ebp
c0002390:	89 e5                	mov    %esp,%ebp
c0002392:	83 ec 18             	sub    $0x18,%esp
c0002395:	83 ec 0c             	sub    $0xc,%esp
c0002398:	6a 6c                	push   $0x6c
c000239a:	e8 3a 4b 00 00       	call   c0006ed9 <sys_malloc>
c000239f:	83 c4 10             	add    $0x10,%esp
c00023a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00023a5:	83 ec 04             	sub    $0x4,%esp
c00023a8:	6a 6c                	push   $0x6c
c00023aa:	6a 00                	push   $0x0
c00023ac:	ff 75 f4             	pushl  -0xc(%ebp)
c00023af:	e8 be 8f 00 00       	call   c000b372 <Memset>
c00023b4:	83 c4 10             	add    $0x10,%esp
c00023b7:	83 ec 04             	sub    $0x4,%esp
c00023ba:	68 13 02 00 00       	push   $0x213
c00023bf:	ff 75 f4             	pushl  -0xc(%ebp)
c00023c2:	6a 02                	push   $0x2
c00023c4:	e8 aa 76 00 00       	call   c0009a73 <send_rec>
c00023c9:	83 c4 10             	add    $0x10,%esp
c00023cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023cf:	83 ec 08             	sub    $0x8,%esp
c00023d2:	6a 6c                	push   $0x6c
c00023d4:	50                   	push   %eax
c00023d5:	e8 de 4d 00 00       	call   c00071b8 <sys_free>
c00023da:	83 c4 10             	add    $0x10,%esp
c00023dd:	90                   	nop
c00023de:	c9                   	leave  
c00023df:	c3                   	ret    

c00023e0 <hd_rdwt>:
c00023e0:	55                   	push   %ebp
c00023e1:	89 e5                	mov    %esp,%ebp
c00023e3:	83 ec 48             	sub    $0x48,%esp
c00023e6:	8b 45 08             	mov    0x8(%ebp),%eax
c00023e9:	8b 40 18             	mov    0x18(%eax),%eax
c00023ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00023ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00023f2:	8b 40 14             	mov    0x14(%eax),%eax
c00023f5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00023f8:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00023fc:	7f 19                	jg     c0002417 <hd_rdwt+0x37>
c00023fe:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002401:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002406:	89 c8                	mov    %ecx,%eax
c0002408:	f7 ea                	imul   %edx
c000240a:	d1 fa                	sar    %edx
c000240c:	89 c8                	mov    %ecx,%eax
c000240e:	c1 f8 1f             	sar    $0x1f,%eax
c0002411:	29 c2                	sub    %eax,%edx
c0002413:	89 d0                	mov    %edx,%eax
c0002415:	eb 11                	jmp    c0002428 <hd_rdwt+0x48>
c0002417:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000241a:	83 e8 10             	sub    $0x10,%eax
c000241d:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002420:	85 c0                	test   %eax,%eax
c0002422:	0f 48 c2             	cmovs  %edx,%eax
c0002425:	c1 f8 06             	sar    $0x6,%eax
c0002428:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000242b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000242e:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002431:	89 d0                	mov    %edx,%eax
c0002433:	c1 f8 1f             	sar    $0x1f,%eax
c0002436:	c1 e8 1a             	shr    $0x1a,%eax
c0002439:	01 c2                	add    %eax,%edx
c000243b:	83 e2 3f             	and    $0x3f,%edx
c000243e:	29 c2                	sub    %eax,%edx
c0002440:	89 d0                	mov    %edx,%eax
c0002442:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002445:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002448:	c1 e8 09             	shr    $0x9,%eax
c000244b:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000244e:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002452:	7f 1a                	jg     c000246e <hd_rdwt+0x8e>
c0002454:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002457:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000245a:	c1 e2 03             	shl    $0x3,%edx
c000245d:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002463:	01 d0                	add    %edx,%eax
c0002465:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000246a:	8b 00                	mov    (%eax),%eax
c000246c:	eb 1b                	jmp    c0002489 <hd_rdwt+0xa9>
c000246e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002471:	8d 50 04             	lea    0x4(%eax),%edx
c0002474:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002477:	c1 e2 03             	shl    $0x3,%edx
c000247a:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002480:	01 d0                	add    %edx,%eax
c0002482:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002487:	8b 00                	mov    (%eax),%eax
c0002489:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000248c:	01 d0                	add    %edx,%eax
c000248e:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002491:	8b 45 08             	mov    0x8(%ebp),%eax
c0002494:	8b 40 0c             	mov    0xc(%eax),%eax
c0002497:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000249a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000249d:	05 ff 01 00 00       	add    $0x1ff,%eax
c00024a2:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00024a8:	85 c0                	test   %eax,%eax
c00024aa:	0f 48 c2             	cmovs  %edx,%eax
c00024ad:	c1 f8 09             	sar    $0x9,%eax
c00024b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00024b3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00024bc:	8b 40 10             	mov    0x10(%eax),%eax
c00024bf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00024c2:	8b 45 08             	mov    0x8(%ebp),%eax
c00024c5:	8b 00                	mov    (%eax),%eax
c00024c7:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00024ca:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024cd:	83 ec 08             	sub    $0x8,%esp
c00024d0:	50                   	push   %eax
c00024d1:	ff 75 d0             	pushl  -0x30(%ebp)
c00024d4:	e8 bf 48 00 00       	call   c0006d98 <alloc_virtual_memory>
c00024d9:	83 c4 10             	add    $0x10,%esp
c00024dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00024df:	8b 45 08             	mov    0x8(%ebp),%eax
c00024e2:	8b 40 68             	mov    0x68(%eax),%eax
c00024e5:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00024e8:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00024ec:	74 22                	je     c0002510 <hd_rdwt+0x130>
c00024ee:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00024f2:	74 1c                	je     c0002510 <hd_rdwt+0x130>
c00024f4:	68 a3 01 00 00       	push   $0x1a3
c00024f9:	68 e4 a7 00 c0       	push   $0xc000a7e4
c00024fe:	68 e4 a7 00 c0       	push   $0xc000a7e4
c0002503:	68 92 a8 00 c0       	push   $0xc000a892
c0002508:	e8 1b 6d 00 00       	call   c0009228 <assertion_failure>
c000250d:	83 c4 10             	add    $0x10,%esp
c0002510:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0002514:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0002517:	88 45 be             	mov    %al,-0x42(%ebp)
c000251a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000251d:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002520:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002523:	c1 f8 08             	sar    $0x8,%eax
c0002526:	88 45 c0             	mov    %al,-0x40(%ebp)
c0002529:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000252c:	c1 f8 10             	sar    $0x10,%eax
c000252f:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002532:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002535:	c1 f8 18             	sar    $0x18,%eax
c0002538:	83 e0 0f             	and    $0xf,%eax
c000253b:	83 c8 e0             	or     $0xffffffe0,%eax
c000253e:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002541:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002545:	75 07                	jne    c000254e <hd_rdwt+0x16e>
c0002547:	b8 20 00 00 00       	mov    $0x20,%eax
c000254c:	eb 05                	jmp    c0002553 <hd_rdwt+0x173>
c000254e:	b8 30 00 00 00       	mov    $0x30,%eax
c0002553:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0002556:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c000255a:	3c 20                	cmp    $0x20,%al
c000255c:	74 24                	je     c0002582 <hd_rdwt+0x1a2>
c000255e:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002562:	3c 30                	cmp    $0x30,%al
c0002564:	74 1c                	je     c0002582 <hd_rdwt+0x1a2>
c0002566:	68 b1 01 00 00       	push   $0x1b1
c000256b:	68 e4 a7 00 c0       	push   $0xc000a7e4
c0002570:	68 e4 a7 00 c0       	push   $0xc000a7e4
c0002575:	68 b0 a8 00 c0       	push   $0xc000a8b0
c000257a:	e8 a9 6c 00 00       	call   c0009228 <assertion_failure>
c000257f:	83 c4 10             	add    $0x10,%esp
c0002582:	83 ec 0c             	sub    $0xc,%esp
c0002585:	8d 45 bd             	lea    -0x43(%ebp),%eax
c0002588:	50                   	push   %eax
c0002589:	e8 7c f6 ff ff       	call   c0001c0a <hd_cmd_out>
c000258e:	83 c4 10             	add    $0x10,%esp
c0002591:	e9 9c 00 00 00       	jmp    c0002632 <hd_rdwt+0x252>
c0002596:	b8 00 02 00 00       	mov    $0x200,%eax
c000259b:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00025a2:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00025a6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00025a9:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00025ad:	75 51                	jne    c0002600 <hd_rdwt+0x220>
c00025af:	e8 aa fd ff ff       	call   c000235e <wait_for>
c00025b4:	e8 d6 fd ff ff       	call   c000238f <interrupt_wait>
c00025b9:	83 ec 04             	sub    $0x4,%esp
c00025bc:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025bf:	6a 00                	push   $0x0
c00025c1:	68 80 21 01 c0       	push   $0xc0012180
c00025c6:	e8 a7 8d 00 00       	call   c000b372 <Memset>
c00025cb:	83 c4 10             	add    $0x10,%esp
c00025ce:	83 ec 04             	sub    $0x4,%esp
c00025d1:	68 00 02 00 00       	push   $0x200
c00025d6:	68 80 21 01 c0       	push   $0xc0012180
c00025db:	68 f0 01 00 00       	push   $0x1f0
c00025e0:	e8 e1 8d 00 00       	call   c000b3c6 <read_port>
c00025e5:	83 c4 10             	add    $0x10,%esp
c00025e8:	83 ec 04             	sub    $0x4,%esp
c00025eb:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025ee:	68 80 21 01 c0       	push   $0xc0012180
c00025f3:	ff 75 f0             	pushl  -0x10(%ebp)
c00025f6:	e8 49 8d 00 00       	call   c000b344 <Memcpy>
c00025fb:	83 c4 10             	add    $0x10,%esp
c00025fe:	eb 26                	jmp    c0002626 <hd_rdwt+0x246>
c0002600:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002604:	75 20                	jne    c0002626 <hd_rdwt+0x246>
c0002606:	e8 53 fd ff ff       	call   c000235e <wait_for>
c000260b:	83 ec 04             	sub    $0x4,%esp
c000260e:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002611:	ff 75 f0             	pushl  -0x10(%ebp)
c0002614:	68 f0 01 00 00       	push   $0x1f0
c0002619:	e8 bc 8d 00 00       	call   c000b3da <write_port>
c000261e:	83 c4 10             	add    $0x10,%esp
c0002621:	e8 69 fd ff ff       	call   c000238f <interrupt_wait>
c0002626:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002629:	29 45 f4             	sub    %eax,-0xc(%ebp)
c000262c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000262f:	01 45 f0             	add    %eax,-0x10(%ebp)
c0002632:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002636:	0f 85 5a ff ff ff    	jne    c0002596 <hd_rdwt+0x1b6>
c000263c:	90                   	nop
c000263d:	c9                   	leave  
c000263e:	c3                   	ret    

c000263f <hd_handler>:
c000263f:	55                   	push   %ebp
c0002640:	89 e5                	mov    %esp,%ebp
c0002642:	83 ec 18             	sub    $0x18,%esp
c0002645:	83 ec 0c             	sub    $0xc,%esp
c0002648:	68 f7 01 00 00       	push   $0x1f7
c000264d:	e8 38 f1 ff ff       	call   c000178a <in_byte>
c0002652:	83 c4 10             	add    $0x10,%esp
c0002655:	0f b6 c0             	movzbl %al,%eax
c0002658:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000265b:	83 ec 0c             	sub    $0xc,%esp
c000265e:	6a 03                	push   $0x3
c0002660:	e8 9d 76 00 00       	call   c0009d02 <inform_int>
c0002665:	83 c4 10             	add    $0x10,%esp
c0002668:	90                   	nop
c0002669:	c9                   	leave  
c000266a:	c3                   	ret    

c000266b <waitfor>:
c000266b:	55                   	push   %ebp
c000266c:	89 e5                	mov    %esp,%ebp
c000266e:	83 ec 18             	sub    $0x18,%esp
c0002671:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002678:	eb 26                	jmp    c00026a0 <waitfor+0x35>
c000267a:	83 ec 0c             	sub    $0xc,%esp
c000267d:	68 f7 01 00 00       	push   $0x1f7
c0002682:	e8 03 f1 ff ff       	call   c000178a <in_byte>
c0002687:	83 c4 10             	add    $0x10,%esp
c000268a:	0f b6 c0             	movzbl %al,%eax
c000268d:	23 45 08             	and    0x8(%ebp),%eax
c0002690:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0002693:	75 07                	jne    c000269c <waitfor+0x31>
c0002695:	b8 01 00 00 00       	mov    $0x1,%eax
c000269a:	eb 11                	jmp    c00026ad <waitfor+0x42>
c000269c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00026a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026a3:	3b 45 10             	cmp    0x10(%ebp),%eax
c00026a6:	7c d2                	jl     c000267a <waitfor+0xf>
c00026a8:	b8 00 00 00 00       	mov    $0x0,%eax
c00026ad:	c9                   	leave  
c00026ae:	c3                   	ret    

c00026af <print_hd_info>:
c00026af:	55                   	push   %ebp
c00026b0:	89 e5                	mov    %esp,%ebp
c00026b2:	83 ec 18             	sub    $0x18,%esp
c00026b5:	83 ec 0c             	sub    $0xc,%esp
c00026b8:	68 e4 a8 00 c0       	push   $0xc000a8e4
c00026bd:	e8 f2 67 00 00       	call   c0008eb4 <Printf>
c00026c2:	83 c4 10             	add    $0x10,%esp
c00026c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00026cc:	eb 3b                	jmp    c0002709 <print_hd_info+0x5a>
c00026ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026d1:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00026d8:	85 c0                	test   %eax,%eax
c00026da:	74 28                	je     c0002704 <print_hd_info+0x55>
c00026dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026df:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00026e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026e9:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00026f0:	ff 75 f4             	pushl  -0xc(%ebp)
c00026f3:	52                   	push   %edx
c00026f4:	50                   	push   %eax
c00026f5:	68 01 a9 00 c0       	push   $0xc000a901
c00026fa:	e8 b5 67 00 00       	call   c0008eb4 <Printf>
c00026ff:	83 c4 10             	add    $0x10,%esp
c0002702:	eb 01                	jmp    c0002705 <print_hd_info+0x56>
c0002704:	90                   	nop
c0002705:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002709:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c000270d:	7e bf                	jle    c00026ce <print_hd_info+0x1f>
c000270f:	83 ec 0c             	sub    $0xc,%esp
c0002712:	68 19 a9 00 c0       	push   $0xc000a919
c0002717:	e8 98 67 00 00       	call   c0008eb4 <Printf>
c000271c:	83 c4 10             	add    $0x10,%esp
c000271f:	83 ec 0c             	sub    $0xc,%esp
c0002722:	68 34 a9 00 c0       	push   $0xc000a934
c0002727:	e8 88 67 00 00       	call   c0008eb4 <Printf>
c000272c:	83 c4 10             	add    $0x10,%esp
c000272f:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0002736:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000273d:	eb 44                	jmp    c0002783 <print_hd_info+0xd4>
c000273f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002742:	83 c0 04             	add    $0x4,%eax
c0002745:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c000274c:	85 c0                	test   %eax,%eax
c000274e:	74 2e                	je     c000277e <print_hd_info+0xcf>
c0002750:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002753:	83 c0 04             	add    $0x4,%eax
c0002756:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c000275d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002760:	83 c0 04             	add    $0x4,%eax
c0002763:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c000276a:	ff 75 f0             	pushl  -0x10(%ebp)
c000276d:	52                   	push   %edx
c000276e:	50                   	push   %eax
c000276f:	68 01 a9 00 c0       	push   $0xc000a901
c0002774:	e8 3b 67 00 00       	call   c0008eb4 <Printf>
c0002779:	83 c4 10             	add    $0x10,%esp
c000277c:	eb 01                	jmp    c000277f <print_hd_info+0xd0>
c000277e:	90                   	nop
c000277f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002783:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0002787:	7e b6                	jle    c000273f <print_hd_info+0x90>
c0002789:	83 ec 0c             	sub    $0xc,%esp
c000278c:	68 51 a9 00 c0       	push   $0xc000a951
c0002791:	e8 1e 67 00 00       	call   c0008eb4 <Printf>
c0002796:	83 c4 10             	add    $0x10,%esp
c0002799:	90                   	nop
c000279a:	c9                   	leave  
c000279b:	c3                   	ret    

c000279c <is_empty>:
c000279c:	55                   	push   %ebp
c000279d:	89 e5                	mov    %esp,%ebp
c000279f:	83 ec 10             	sub    $0x10,%esp
c00027a2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00027a9:	eb 1a                	jmp    c00027c5 <is_empty+0x29>
c00027ab:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00027ae:	8b 45 08             	mov    0x8(%ebp),%eax
c00027b1:	01 d0                	add    %edx,%eax
c00027b3:	0f b6 00             	movzbl (%eax),%eax
c00027b6:	84 c0                	test   %al,%al
c00027b8:	74 07                	je     c00027c1 <is_empty+0x25>
c00027ba:	b8 00 00 00 00       	mov    $0x0,%eax
c00027bf:	eb 11                	jmp    c00027d2 <is_empty+0x36>
c00027c1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00027c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00027c8:	3b 45 0c             	cmp    0xc(%ebp),%eax
c00027cb:	7c de                	jl     c00027ab <is_empty+0xf>
c00027cd:	b8 01 00 00 00       	mov    $0x1,%eax
c00027d2:	c9                   	leave  
c00027d3:	c3                   	ret    
c00027d4:	66 90                	xchg   %ax,%ax
c00027d6:	66 90                	xchg   %ax,%ax
c00027d8:	66 90                	xchg   %ax,%ax
c00027da:	66 90                	xchg   %ax,%ax
c00027dc:	66 90                	xchg   %ax,%ax
c00027de:	66 90                	xchg   %ax,%ax

c00027e0 <get_ticks>:
c00027e0:	b8 00 00 00 00       	mov    $0x0,%eax
c00027e5:	cd 90                	int    $0x90
c00027e7:	c3                   	ret    

c00027e8 <write2>:
c00027e8:	b8 01 00 00 00       	mov    $0x1,%eax
c00027ed:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c00027f1:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c00027f5:	cd 90                	int    $0x90
c00027f7:	c3                   	ret    

c00027f8 <write_debug>:
c00027f8:	b8 02 00 00 00       	mov    $0x2,%eax
c00027fd:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002801:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002805:	cd 90                	int    $0x90
c0002807:	c3                   	ret    

c0002808 <send_msg2>:
c0002808:	b8 03 00 00 00       	mov    $0x3,%eax
c000280d:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002811:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c0002815:	cd 90                	int    $0x90
c0002817:	c3                   	ret    

c0002818 <send_msg>:
c0002818:	55                   	push   %ebp
c0002819:	89 e5                	mov    %esp,%ebp
c000281b:	53                   	push   %ebx
c000281c:	51                   	push   %ecx
c000281d:	b8 03 00 00 00       	mov    $0x3,%eax
c0002822:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c0002825:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002828:	cd 90                	int    $0x90
c000282a:	59                   	pop    %ecx
c000282b:	5b                   	pop    %ebx
c000282c:	5d                   	pop    %ebp
c000282d:	c3                   	ret    

c000282e <receive_msg2>:
c000282e:	b8 04 00 00 00       	mov    $0x4,%eax
c0002833:	8b 5c 24 08          	mov    0x8(%esp),%ebx
c0002837:	8b 4c 24 04          	mov    0x4(%esp),%ecx
c000283b:	cd 90                	int    $0x90
c000283d:	c3                   	ret    

c000283e <receive_msg>:
c000283e:	55                   	push   %ebp
c000283f:	89 e5                	mov    %esp,%ebp
c0002841:	53                   	push   %ebx
c0002842:	51                   	push   %ecx
c0002843:	b8 04 00 00 00       	mov    $0x4,%eax
c0002848:	8b 5d 0c             	mov    0xc(%ebp),%ebx
c000284b:	8b 4d 08             	mov    0x8(%ebp),%ecx
c000284e:	cd 90                	int    $0x90
c0002850:	59                   	pop    %ecx
c0002851:	5b                   	pop    %ebx
c0002852:	5d                   	pop    %ebp
c0002853:	c3                   	ret    

c0002854 <task_fs>:
c0002854:	55                   	push   %ebp
c0002855:	89 e5                	mov    %esp,%ebp
c0002857:	83 ec 38             	sub    $0x38,%esp
c000285a:	e8 35 f0 ff ff       	call   c0001894 <get_running_thread_pcb>
c000285f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002862:	e8 87 08 00 00       	call   c00030ee <init_fs>
c0002867:	83 ec 0c             	sub    $0xc,%esp
c000286a:	6a 6c                	push   $0x6c
c000286c:	e8 68 46 00 00       	call   c0006ed9 <sys_malloc>
c0002871:	83 c4 10             	add    $0x10,%esp
c0002874:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002877:	83 ec 0c             	sub    $0xc,%esp
c000287a:	6a 6c                	push   $0x6c
c000287c:	e8 58 46 00 00       	call   c0006ed9 <sys_malloc>
c0002881:	83 c4 10             	add    $0x10,%esp
c0002884:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002887:	83 ec 04             	sub    $0x4,%esp
c000288a:	6a 6c                	push   $0x6c
c000288c:	6a 00                	push   $0x0
c000288e:	ff 75 f0             	pushl  -0x10(%ebp)
c0002891:	e8 dc 8a 00 00       	call   c000b372 <Memset>
c0002896:	83 c4 10             	add    $0x10,%esp
c0002899:	83 ec 04             	sub    $0x4,%esp
c000289c:	6a 0e                	push   $0xe
c000289e:	ff 75 f0             	pushl  -0x10(%ebp)
c00028a1:	6a 02                	push   $0x2
c00028a3:	e8 cb 71 00 00       	call   c0009a73 <send_rec>
c00028a8:	83 c4 10             	add    $0x10,%esp
c00028ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028ae:	8b 40 68             	mov    0x68(%eax),%eax
c00028b1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00028b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028b7:	8b 00                	mov    (%eax),%eax
c00028b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00028bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028bf:	8b 40 40             	mov    0x40(%eax),%eax
c00028c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00028c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028c8:	8b 40 58             	mov    0x58(%eax),%eax
c00028cb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00028ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00028d1:	8b 00                	mov    (%eax),%eax
c00028d3:	85 c0                	test   %eax,%eax
c00028d5:	75 07                	jne    c00028de <task_fs+0x8a>
c00028d7:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c00028de:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00028e5:	83 ec 0c             	sub    $0xc,%esp
c00028e8:	ff 75 e4             	pushl  -0x1c(%ebp)
c00028eb:	e8 37 21 00 00       	call   c0004a27 <pid2proc>
c00028f0:	83 c4 10             	add    $0x10,%esp
c00028f3:	a3 64 fb 00 c0       	mov    %eax,0xc000fb64
c00028f8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00028fc:	74 36                	je     c0002934 <task_fs+0xe0>
c00028fe:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c0002902:	74 30                	je     c0002934 <task_fs+0xe0>
c0002904:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c0002908:	74 2a                	je     c0002934 <task_fs+0xe0>
c000290a:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000290e:	74 24                	je     c0002934 <task_fs+0xe0>
c0002910:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c0002914:	74 1e                	je     c0002934 <task_fs+0xe0>
c0002916:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000291a:	74 18                	je     c0002934 <task_fs+0xe0>
c000291c:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0002923:	00 00 00 
c0002926:	83 ec 0c             	sub    $0xc,%esp
c0002929:	ff 75 e8             	pushl  -0x18(%ebp)
c000292c:	e8 21 51 00 00       	call   c0007a52 <disp_int>
c0002931:	83 c4 10             	add    $0x10,%esp
c0002934:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0002938:	74 37                	je     c0002971 <task_fs+0x11d>
c000293a:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c000293e:	74 31                	je     c0002971 <task_fs+0x11d>
c0002940:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c0002944:	74 2b                	je     c0002971 <task_fs+0x11d>
c0002946:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000294a:	74 25                	je     c0002971 <task_fs+0x11d>
c000294c:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c0002950:	74 1f                	je     c0002971 <task_fs+0x11d>
c0002952:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0002956:	74 19                	je     c0002971 <task_fs+0x11d>
c0002958:	6a 7c                	push   $0x7c
c000295a:	68 70 a9 00 c0       	push   $0xc000a970
c000295f:	68 70 a9 00 c0       	push   $0xc000a970
c0002964:	68 80 a9 00 c0       	push   $0xc000a980
c0002969:	e8 ba 68 00 00       	call   c0009228 <assertion_failure>
c000296e:	83 c4 10             	add    $0x10,%esp
c0002971:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c0002975:	74 2f                	je     c00029a6 <task_fs+0x152>
c0002977:	83 7d e8 06          	cmpl   $0x6,-0x18(%ebp)
c000297b:	7f 15                	jg     c0002992 <task_fs+0x13e>
c000297d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0002981:	0f 84 a5 00 00 00    	je     c0002a2c <task_fs+0x1d8>
c0002987:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c000298b:	74 64                	je     c00029f1 <task_fs+0x19d>
c000298d:	e9 88 00 00 00       	jmp    c0002a1a <task_fs+0x1c6>
c0002992:	83 7d e8 0a          	cmpl   $0xa,-0x18(%ebp)
c0002996:	74 46                	je     c00029de <task_fs+0x18a>
c0002998:	83 7d e8 66          	cmpl   $0x66,-0x18(%ebp)
c000299c:	74 63                	je     c0002a01 <task_fs+0x1ad>
c000299e:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00029a2:	74 3a                	je     c00029de <task_fs+0x18a>
c00029a4:	eb 74                	jmp    c0002a1a <task_fs+0x1c6>
c00029a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029a9:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c00029b0:	83 ec 0c             	sub    $0xc,%esp
c00029b3:	ff 75 f0             	pushl  -0x10(%ebp)
c00029b6:	e8 88 07 00 00       	call   c0003143 <do_open>
c00029bb:	83 c4 10             	add    $0x10,%esp
c00029be:	89 c2                	mov    %eax,%edx
c00029c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029c3:	89 50 40             	mov    %edx,0x40(%eax)
c00029c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00029c9:	8b 00                	mov    (%eax),%eax
c00029cb:	83 ec 04             	sub    $0x4,%esp
c00029ce:	50                   	push   %eax
c00029cf:	ff 75 f0             	pushl  -0x10(%ebp)
c00029d2:	6a 01                	push   $0x1
c00029d4:	e8 9a 70 00 00       	call   c0009a73 <send_rec>
c00029d9:	83 c4 10             	add    $0x10,%esp
c00029dc:	eb 4f                	jmp    c0002a2d <task_fs+0x1d9>
c00029de:	83 ec 0c             	sub    $0xc,%esp
c00029e1:	ff 75 f0             	pushl  -0x10(%ebp)
c00029e4:	e8 98 18 00 00       	call   c0004281 <do_rdwt>
c00029e9:	83 c4 10             	add    $0x10,%esp
c00029ec:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00029ef:	eb 3c                	jmp    c0002a2d <task_fs+0x1d9>
c00029f1:	83 ec 0c             	sub    $0xc,%esp
c00029f4:	ff 75 e0             	pushl  -0x20(%ebp)
c00029f7:	e8 a9 1d 00 00       	call   c00047a5 <do_close>
c00029fc:	83 c4 10             	add    $0x10,%esp
c00029ff:	eb 2c                	jmp    c0002a2d <task_fs+0x1d9>
c0002a01:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002a04:	8b 40 58             	mov    0x58(%eax),%eax
c0002a07:	83 ec 04             	sub    $0x4,%esp
c0002a0a:	50                   	push   %eax
c0002a0b:	ff 75 f0             	pushl  -0x10(%ebp)
c0002a0e:	6a 01                	push   $0x1
c0002a10:	e8 5e 70 00 00       	call   c0009a73 <send_rec>
c0002a15:	83 c4 10             	add    $0x10,%esp
c0002a18:	eb 13                	jmp    c0002a2d <task_fs+0x1d9>
c0002a1a:	83 ec 0c             	sub    $0xc,%esp
c0002a1d:	68 e3 a9 00 c0       	push   $0xc000a9e3
c0002a22:	e8 e3 67 00 00       	call   c000920a <panic>
c0002a27:	83 c4 10             	add    $0x10,%esp
c0002a2a:	eb 01                	jmp    c0002a2d <task_fs+0x1d9>
c0002a2c:	90                   	nop
c0002a2d:	e9 55 fe ff ff       	jmp    c0002887 <task_fs+0x33>

c0002a32 <rd_wt>:
c0002a32:	55                   	push   %ebp
c0002a33:	89 e5                	mov    %esp,%ebp
c0002a35:	83 ec 18             	sub    $0x18,%esp
c0002a38:	83 ec 0c             	sub    $0xc,%esp
c0002a3b:	6a 6c                	push   $0x6c
c0002a3d:	e8 97 44 00 00       	call   c0006ed9 <sys_malloc>
c0002a42:	83 c4 10             	add    $0x10,%esp
c0002a45:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002a48:	83 ec 04             	sub    $0x4,%esp
c0002a4b:	6a 6c                	push   $0x6c
c0002a4d:	6a 00                	push   $0x0
c0002a4f:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a52:	e8 1b 89 00 00       	call   c000b372 <Memset>
c0002a57:	83 c4 10             	add    $0x10,%esp
c0002a5a:	8b 55 18             	mov    0x18(%ebp),%edx
c0002a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a60:	89 50 68             	mov    %edx,0x68(%eax)
c0002a63:	8b 55 0c             	mov    0xc(%ebp),%edx
c0002a66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a69:	89 50 14             	mov    %edx,0x14(%eax)
c0002a6c:	8b 55 10             	mov    0x10(%ebp),%edx
c0002a6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a72:	89 50 10             	mov    %edx,0x10(%eax)
c0002a75:	8b 55 14             	mov    0x14(%ebp),%edx
c0002a78:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a7b:	89 50 0c             	mov    %edx,0xc(%eax)
c0002a7e:	8b 45 08             	mov    0x8(%ebp),%eax
c0002a81:	c1 e0 09             	shl    $0x9,%eax
c0002a84:	89 c2                	mov    %eax,%edx
c0002a86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002a89:	89 50 18             	mov    %edx,0x18(%eax)
c0002a8c:	83 7d 18 07          	cmpl   $0x7,0x18(%ebp)
c0002a90:	74 22                	je     c0002ab4 <rd_wt+0x82>
c0002a92:	83 7d 18 0a          	cmpl   $0xa,0x18(%ebp)
c0002a96:	74 1c                	je     c0002ab4 <rd_wt+0x82>
c0002a98:	68 a7 00 00 00       	push   $0xa7
c0002a9d:	68 70 a9 00 c0       	push   $0xc000a970
c0002aa2:	68 70 a9 00 c0       	push   $0xc000a970
c0002aa7:	68 f6 a9 00 c0       	push   $0xc000a9f6
c0002aac:	e8 77 67 00 00       	call   c0009228 <assertion_failure>
c0002ab1:	83 c4 10             	add    $0x10,%esp
c0002ab4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ab7:	8b 40 68             	mov    0x68(%eax),%eax
c0002aba:	83 f8 07             	cmp    $0x7,%eax
c0002abd:	74 27                	je     c0002ae6 <rd_wt+0xb4>
c0002abf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002ac2:	8b 40 68             	mov    0x68(%eax),%eax
c0002ac5:	83 f8 0a             	cmp    $0xa,%eax
c0002ac8:	74 1c                	je     c0002ae6 <rd_wt+0xb4>
c0002aca:	68 a8 00 00 00       	push   $0xa8
c0002acf:	68 70 a9 00 c0       	push   $0xc000a970
c0002ad4:	68 70 a9 00 c0       	push   $0xc000a970
c0002ad9:	68 14 aa 00 c0       	push   $0xc000aa14
c0002ade:	e8 45 67 00 00       	call   c0009228 <assertion_failure>
c0002ae3:	83 c4 10             	add    $0x10,%esp
c0002ae6:	83 ec 04             	sub    $0x4,%esp
c0002ae9:	6a 03                	push   $0x3
c0002aeb:	ff 75 f4             	pushl  -0xc(%ebp)
c0002aee:	6a 03                	push   $0x3
c0002af0:	e8 7e 6f 00 00       	call   c0009a73 <send_rec>
c0002af5:	83 c4 10             	add    $0x10,%esp
c0002af8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002afb:	83 ec 08             	sub    $0x8,%esp
c0002afe:	6a 6c                	push   $0x6c
c0002b00:	50                   	push   %eax
c0002b01:	e8 b2 46 00 00       	call   c00071b8 <sys_free>
c0002b06:	83 c4 10             	add    $0x10,%esp
c0002b09:	90                   	nop
c0002b0a:	c9                   	leave  
c0002b0b:	c3                   	ret    

c0002b0c <mkfs>:
c0002b0c:	55                   	push   %ebp
c0002b0d:	89 e5                	mov    %esp,%ebp
c0002b0f:	57                   	push   %edi
c0002b10:	81 ec d4 00 00 00    	sub    $0xd4,%esp
c0002b16:	83 ec 0c             	sub    $0xc,%esp
c0002b19:	68 00 80 00 00       	push   $0x8000
c0002b1e:	e8 b6 43 00 00       	call   c0006ed9 <sys_malloc>
c0002b23:	83 c4 10             	add    $0x10,%esp
c0002b26:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002b2b:	83 ec 0c             	sub    $0xc,%esp
c0002b2e:	6a 24                	push   $0x24
c0002b30:	e8 a4 43 00 00       	call   c0006ed9 <sys_malloc>
c0002b35:	83 c4 10             	add    $0x10,%esp
c0002b38:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002b3d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b42:	83 ec 0c             	sub    $0xc,%esp
c0002b45:	50                   	push   %eax
c0002b46:	e8 ba 42 00 00       	call   c0006e05 <get_physical_address>
c0002b4b:	83 c4 10             	add    $0x10,%esp
c0002b4e:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002b53:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002b58:	83 ec 0c             	sub    $0xc,%esp
c0002b5b:	50                   	push   %eax
c0002b5c:	e8 a4 42 00 00       	call   c0006e05 <get_physical_address>
c0002b61:	83 c4 10             	add    $0x10,%esp
c0002b64:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002b69:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b6e:	83 ec 04             	sub    $0x4,%esp
c0002b71:	68 00 02 00 00       	push   $0x200
c0002b76:	6a 00                	push   $0x0
c0002b78:	50                   	push   %eax
c0002b79:	e8 f4 87 00 00       	call   c000b372 <Memset>
c0002b7e:	83 c4 10             	add    $0x10,%esp
c0002b81:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002b86:	83 ec 0c             	sub    $0xc,%esp
c0002b89:	6a 0a                	push   $0xa
c0002b8b:	68 00 02 00 00       	push   $0x200
c0002b90:	50                   	push   %eax
c0002b91:	6a 20                	push   $0x20
c0002b93:	6a 00                	push   $0x0
c0002b95:	e8 98 fe ff ff       	call   c0002a32 <rd_wt>
c0002b9a:	83 c4 20             	add    $0x20,%esp
c0002b9d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ba2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002ba5:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002ba8:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0002baf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bb2:	c7 40 10 00 08 00 00 	movl   $0x800,0x10(%eax)
c0002bb9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bbc:	c7 40 08 00 08 00 00 	movl   $0x800,0x8(%eax)
c0002bc3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bc6:	c7 40 0c 00 01 00 00 	movl   $0x100,0xc(%eax)
c0002bcd:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bd0:	8b 40 04             	mov    0x4(%eax),%eax
c0002bd3:	8d 50 02             	lea    0x2(%eax),%edx
c0002bd6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002bd9:	8b 40 08             	mov    0x8(%eax),%eax
c0002bdc:	01 c2                	add    %eax,%edx
c0002bde:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002be1:	8b 40 0c             	mov    0xc(%eax),%eax
c0002be4:	01 c2                	add    %eax,%edx
c0002be6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002be9:	89 10                	mov    %edx,(%eax)
c0002beb:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c0002bf2:	b8 00 02 00 00       	mov    $0x200,%eax
c0002bf7:	2b 45 d8             	sub    -0x28(%ebp),%eax
c0002bfa:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0002c00:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002c03:	01 ca                	add    %ecx,%edx
c0002c05:	83 ec 04             	sub    $0x4,%esp
c0002c08:	50                   	push   %eax
c0002c09:	6a 80                	push   $0xffffff80
c0002c0b:	52                   	push   %edx
c0002c0c:	e8 61 87 00 00       	call   c000b372 <Memset>
c0002c11:	83 c4 10             	add    $0x10,%esp
c0002c14:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002c19:	83 ec 0c             	sub    $0xc,%esp
c0002c1c:	6a 0a                	push   $0xa
c0002c1e:	68 00 02 00 00       	push   $0x200
c0002c23:	50                   	push   %eax
c0002c24:	6a 20                	push   $0x20
c0002c26:	6a 01                	push   $0x1
c0002c28:	e8 05 fe ff ff       	call   c0002a32 <rd_wt>
c0002c2d:	83 c4 20             	add    $0x20,%esp
c0002c30:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002c33:	8b 10                	mov    (%eax),%edx
c0002c35:	89 55 98             	mov    %edx,-0x68(%ebp)
c0002c38:	8b 50 04             	mov    0x4(%eax),%edx
c0002c3b:	89 55 9c             	mov    %edx,-0x64(%ebp)
c0002c3e:	8b 50 08             	mov    0x8(%eax),%edx
c0002c41:	89 55 a0             	mov    %edx,-0x60(%ebp)
c0002c44:	8b 50 0c             	mov    0xc(%eax),%edx
c0002c47:	89 55 a4             	mov    %edx,-0x5c(%ebp)
c0002c4a:	8b 50 10             	mov    0x10(%eax),%edx
c0002c4d:	89 55 a8             	mov    %edx,-0x58(%ebp)
c0002c50:	8b 50 14             	mov    0x14(%eax),%edx
c0002c53:	89 55 ac             	mov    %edx,-0x54(%ebp)
c0002c56:	8b 50 18             	mov    0x18(%eax),%edx
c0002c59:	89 55 b0             	mov    %edx,-0x50(%ebp)
c0002c5c:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002c5f:	89 55 b4             	mov    %edx,-0x4c(%ebp)
c0002c62:	8b 40 20             	mov    0x20(%eax),%eax
c0002c65:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0002c68:	c6 45 d7 3f          	movb   $0x3f,-0x29(%ebp)
c0002c6c:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c0002c70:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c75:	83 ec 04             	sub    $0x4,%esp
c0002c78:	6a 01                	push   $0x1
c0002c7a:	52                   	push   %edx
c0002c7b:	50                   	push   %eax
c0002c7c:	e8 f1 86 00 00       	call   c000b372 <Memset>
c0002c81:	83 c4 10             	add    $0x10,%esp
c0002c84:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c89:	83 c0 01             	add    $0x1,%eax
c0002c8c:	83 ec 04             	sub    $0x4,%esp
c0002c8f:	68 ff 01 00 00       	push   $0x1ff
c0002c94:	6a 80                	push   $0xffffff80
c0002c96:	50                   	push   %eax
c0002c97:	e8 d6 86 00 00       	call   c000b372 <Memset>
c0002c9c:	83 c4 10             	add    $0x10,%esp
c0002c9f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002ca4:	83 ec 0c             	sub    $0xc,%esp
c0002ca7:	6a 0a                	push   $0xa
c0002ca9:	68 00 02 00 00       	push   $0x200
c0002cae:	50                   	push   %eax
c0002caf:	6a 20                	push   $0x20
c0002cb1:	6a 02                	push   $0x2
c0002cb3:	e8 7a fd ff ff       	call   c0002a32 <rd_wt>
c0002cb8:	83 c4 20             	add    $0x20,%esp
c0002cbb:	c7 45 d0 03 00 00 00 	movl   $0x3,-0x30(%ebp)
c0002cc2:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cc7:	83 ec 04             	sub    $0x4,%esp
c0002cca:	68 00 02 00 00       	push   $0x200
c0002ccf:	6a ff                	push   $0xffffffff
c0002cd1:	50                   	push   %eax
c0002cd2:	e8 9b 86 00 00       	call   c000b372 <Memset>
c0002cd7:	83 c4 10             	add    $0x10,%esp
c0002cda:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002cdf:	83 ec 0c             	sub    $0xc,%esp
c0002ce2:	6a 0a                	push   $0xa
c0002ce4:	68 00 02 00 00       	push   $0x200
c0002ce9:	50                   	push   %eax
c0002cea:	6a 20                	push   $0x20
c0002cec:	ff 75 d0             	pushl  -0x30(%ebp)
c0002cef:	e8 3e fd ff ff       	call   c0002a32 <rd_wt>
c0002cf4:	83 c4 20             	add    $0x20,%esp
c0002cf7:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002cfc:	83 ec 04             	sub    $0x4,%esp
c0002cff:	6a 01                	push   $0x1
c0002d01:	6a 01                	push   $0x1
c0002d03:	50                   	push   %eax
c0002d04:	e8 69 86 00 00       	call   c000b372 <Memset>
c0002d09:	83 c4 10             	add    $0x10,%esp
c0002d0c:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d11:	83 c0 01             	add    $0x1,%eax
c0002d14:	83 ec 04             	sub    $0x4,%esp
c0002d17:	68 ff 01 00 00       	push   $0x1ff
c0002d1c:	6a 00                	push   $0x0
c0002d1e:	50                   	push   %eax
c0002d1f:	e8 4e 86 00 00       	call   c000b372 <Memset>
c0002d24:	83 c4 10             	add    $0x10,%esp
c0002d27:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d2c:	89 c2                	mov    %eax,%edx
c0002d2e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0002d31:	83 c0 01             	add    $0x1,%eax
c0002d34:	83 ec 0c             	sub    $0xc,%esp
c0002d37:	6a 0a                	push   $0xa
c0002d39:	68 00 02 00 00       	push   $0x200
c0002d3e:	52                   	push   %edx
c0002d3f:	6a 20                	push   $0x20
c0002d41:	50                   	push   %eax
c0002d42:	e8 eb fc ff ff       	call   c0002a32 <rd_wt>
c0002d47:	83 c4 20             	add    $0x20,%esp
c0002d4a:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d4d:	83 e8 02             	sub    $0x2,%eax
c0002d50:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0002d53:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0002d5a:	eb 04                	jmp    c0002d60 <mkfs+0x254>
c0002d5c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0002d60:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0002d63:	83 c0 01             	add    $0x1,%eax
c0002d66:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0002d69:	7e f1                	jle    c0002d5c <mkfs+0x250>
c0002d6b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d70:	89 c2                	mov    %eax,%edx
c0002d72:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d75:	83 c0 03             	add    $0x3,%eax
c0002d78:	83 ec 0c             	sub    $0xc,%esp
c0002d7b:	6a 0a                	push   $0xa
c0002d7d:	68 00 02 00 00       	push   $0x200
c0002d82:	52                   	push   %edx
c0002d83:	6a 20                	push   $0x20
c0002d85:	50                   	push   %eax
c0002d86:	e8 a7 fc ff ff       	call   c0002a32 <rd_wt>
c0002d8b:	83 c4 20             	add    $0x20,%esp
c0002d8e:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002d93:	89 c2                	mov    %eax,%edx
c0002d95:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002d98:	83 c0 03             	add    $0x3,%eax
c0002d9b:	83 ec 0c             	sub    $0xc,%esp
c0002d9e:	6a 07                	push   $0x7
c0002da0:	68 00 02 00 00       	push   $0x200
c0002da5:	52                   	push   %edx
c0002da6:	6a 20                	push   $0x20
c0002da8:	50                   	push   %eax
c0002da9:	e8 84 fc ff ff       	call   c0002a32 <rd_wt>
c0002dae:	83 c4 20             	add    $0x20,%esp
c0002db1:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002db6:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002db9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dbc:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002dc2:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dc5:	c7 40 04 50 00 00 00 	movl   $0x50,0x4(%eax)
c0002dcc:	8b 55 98             	mov    -0x68(%ebp),%edx
c0002dcf:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dd2:	89 50 08             	mov    %edx,0x8(%eax)
c0002dd5:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dd8:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002ddf:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002de2:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)
c0002de9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002dec:	8b 10                	mov    (%eax),%edx
c0002dee:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0002df4:	8b 50 04             	mov    0x4(%eax),%edx
c0002df7:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0002dfd:	8b 50 08             	mov    0x8(%eax),%edx
c0002e00:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0002e06:	8b 50 0c             	mov    0xc(%eax),%edx
c0002e09:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0002e0f:	8b 50 10             	mov    0x10(%eax),%edx
c0002e12:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0002e18:	8b 50 14             	mov    0x14(%eax),%edx
c0002e1b:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0002e21:	8b 50 18             	mov    0x18(%eax),%edx
c0002e24:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0002e2a:	8b 50 1c             	mov    0x1c(%eax),%edx
c0002e2d:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0002e33:	8b 50 20             	mov    0x20(%eax),%edx
c0002e36:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0002e3c:	8b 40 24             	mov    0x24(%eax),%eax
c0002e3f:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0002e44:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0002e4b:	eb 4c                	jmp    c0002e99 <mkfs+0x38d>
c0002e4d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002e52:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0002e55:	83 c2 01             	add    $0x1,%edx
c0002e58:	c1 e2 05             	shl    $0x5,%edx
c0002e5b:	01 d0                	add    %edx,%eax
c0002e5d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002e60:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e63:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002e69:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e6c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c0002e73:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e76:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c0002e7d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
c0002e84:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002e87:	c1 e0 08             	shl    $0x8,%eax
c0002e8a:	0b 45 f0             	or     -0x10(%ebp),%eax
c0002e8d:	89 c2                	mov    %eax,%edx
c0002e8f:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002e92:	89 50 08             	mov    %edx,0x8(%eax)
c0002e95:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002e99:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
c0002e9d:	7e ae                	jle    c0002e4d <mkfs+0x341>
c0002e9f:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
c0002ea6:	8d 95 70 ff ff ff    	lea    -0x90(%ebp),%edx
c0002eac:	b8 00 00 00 00       	mov    $0x0,%eax
c0002eb1:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002eb6:	89 d7                	mov    %edx,%edi
c0002eb8:	f3 ab                	rep stos %eax,%es:(%edi)
c0002eba:	c7 85 70 ff ff ff 3c 	movl   $0xc000aa3c,-0x90(%ebp)
c0002ec1:	aa 00 c0 
c0002ec4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002ecb:	eb 54                	jmp    c0002f21 <mkfs+0x415>
c0002ecd:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002ed2:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002ed5:	83 c2 04             	add    $0x4,%edx
c0002ed8:	c1 e2 05             	shl    $0x5,%edx
c0002edb:	01 d0                	add    %edx,%eax
c0002edd:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0002ee0:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002ee3:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0002ee9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002eec:	c7 40 04 00 e8 08 00 	movl   $0x8e800,0x4(%eax)
c0002ef3:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002ef6:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0002ef9:	83 c2 01             	add    $0x1,%edx
c0002efc:	c1 e2 0b             	shl    $0xb,%edx
c0002eff:	01 c2                	add    %eax,%edx
c0002f01:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f04:	89 50 08             	mov    %edx,0x8(%eax)
c0002f07:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f0a:	c7 40 0c 00 08 00 00 	movl   $0x800,0xc(%eax)
c0002f11:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f14:	8d 50 05             	lea    0x5(%eax),%edx
c0002f17:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0002f1a:	89 50 10             	mov    %edx,0x10(%eax)
c0002f1d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0002f21:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002f24:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c0002f27:	7c a4                	jl     c0002ecd <mkfs+0x3c1>
c0002f29:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f2e:	89 c2                	mov    %eax,%edx
c0002f30:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002f33:	83 c0 03             	add    $0x3,%eax
c0002f36:	83 ec 0c             	sub    $0xc,%esp
c0002f39:	6a 0a                	push   $0xa
c0002f3b:	68 00 02 00 00       	push   $0x200
c0002f40:	52                   	push   %edx
c0002f41:	6a 20                	push   $0x20
c0002f43:	50                   	push   %eax
c0002f44:	e8 e9 fa ff ff       	call   c0002a32 <rd_wt>
c0002f49:	83 c4 20             	add    $0x20,%esp
c0002f4c:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0002f51:	89 c2                	mov    %eax,%edx
c0002f53:	8b 45 98             	mov    -0x68(%ebp),%eax
c0002f56:	83 ec 0c             	sub    $0xc,%esp
c0002f59:	6a 07                	push   $0x7
c0002f5b:	68 00 02 00 00       	push   $0x200
c0002f60:	52                   	push   %edx
c0002f61:	6a 20                	push   $0x20
c0002f63:	50                   	push   %eax
c0002f64:	e8 c9 fa ff ff       	call   c0002a32 <rd_wt>
c0002f69:	83 c4 20             	add    $0x20,%esp
c0002f6c:	c7 85 60 ff ff ff cc 	movl   $0xcc,-0xa0(%ebp)
c0002f73:	00 00 00 
c0002f76:	66 c7 85 5e ff ff ff 	movw   $0x2e,-0xa2(%ebp)
c0002f7d:	2e 00 
c0002f7f:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002f84:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0002f87:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002f8a:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
c0002f90:	83 ec 0c             	sub    $0xc,%esp
c0002f93:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002f99:	50                   	push   %eax
c0002f9a:	e8 0c 84 00 00       	call   c000b3ab <Strlen>
c0002f9f:	83 c4 10             	add    $0x10,%esp
c0002fa2:	89 c1                	mov    %eax,%ecx
c0002fa4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002fa7:	8d 50 04             	lea    0x4(%eax),%edx
c0002faa:	83 ec 04             	sub    $0x4,%esp
c0002fad:	51                   	push   %ecx
c0002fae:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002fb4:	50                   	push   %eax
c0002fb5:	52                   	push   %edx
c0002fb6:	e8 89 83 00 00       	call   c000b344 <Memcpy>
c0002fbb:	83 c4 10             	add    $0x10,%esp
c0002fbe:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002fc4:	b8 00 00 00 00       	mov    $0x0,%eax
c0002fc9:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002fce:	89 d7                	mov    %edx,%edi
c0002fd0:	f3 ab                	rep stos %eax,%es:(%edi)
c0002fd2:	c7 85 34 ff ff ff 48 	movl   $0xc000aa48,-0xcc(%ebp)
c0002fd9:	aa 00 c0 
c0002fdc:	c7 85 38 ff ff ff 51 	movl   $0xc000aa51,-0xc8(%ebp)
c0002fe3:	aa 00 c0 
c0002fe6:	c7 85 3c ff ff ff 5a 	movl   $0xc000aa5a,-0xc4(%ebp)
c0002fed:	aa 00 c0 
c0002ff0:	c7 45 bc 03 00 00 00 	movl   $0x3,-0x44(%ebp)
c0002ff7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0002ffe:	eb 49                	jmp    c0003049 <mkfs+0x53d>
c0003000:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003004:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003007:	8d 50 02             	lea    0x2(%eax),%edx
c000300a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000300d:	89 10                	mov    %edx,(%eax)
c000300f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003012:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0003019:	83 ec 0c             	sub    $0xc,%esp
c000301c:	50                   	push   %eax
c000301d:	e8 89 83 00 00       	call   c000b3ab <Strlen>
c0003022:	83 c4 10             	add    $0x10,%esp
c0003025:	89 c1                	mov    %eax,%ecx
c0003027:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000302a:	8b 84 85 34 ff ff ff 	mov    -0xcc(%ebp,%eax,4),%eax
c0003031:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003034:	83 c2 04             	add    $0x4,%edx
c0003037:	83 ec 04             	sub    $0x4,%esp
c000303a:	51                   	push   %ecx
c000303b:	50                   	push   %eax
c000303c:	52                   	push   %edx
c000303d:	e8 02 83 00 00       	call   c000b344 <Memcpy>
c0003042:	83 c4 10             	add    $0x10,%esp
c0003045:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003049:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000304c:	3b 45 bc             	cmp    -0x44(%ebp),%eax
c000304f:	7c af                	jl     c0003000 <mkfs+0x4f4>
c0003051:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003058:	eb 66                	jmp    c00030c0 <mkfs+0x5b4>
c000305a:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000305d:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c0003064:	83 ec 0c             	sub    $0xc,%esp
c0003067:	50                   	push   %eax
c0003068:	e8 3e 83 00 00       	call   c000b3ab <Strlen>
c000306d:	83 c4 10             	add    $0x10,%esp
c0003070:	85 c0                	test   %eax,%eax
c0003072:	74 47                	je     c00030bb <mkfs+0x5af>
c0003074:	83 45 e8 10          	addl   $0x10,-0x18(%ebp)
c0003078:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000307b:	8d 50 05             	lea    0x5(%eax),%edx
c000307e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003081:	89 10                	mov    %edx,(%eax)
c0003083:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003086:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c000308d:	83 ec 0c             	sub    $0xc,%esp
c0003090:	50                   	push   %eax
c0003091:	e8 15 83 00 00       	call   c000b3ab <Strlen>
c0003096:	83 c4 10             	add    $0x10,%esp
c0003099:	89 c1                	mov    %eax,%ecx
c000309b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000309e:	8b 84 85 70 ff ff ff 	mov    -0x90(%ebp,%eax,4),%eax
c00030a5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00030a8:	83 c2 04             	add    $0x4,%edx
c00030ab:	83 ec 04             	sub    $0x4,%esp
c00030ae:	51                   	push   %ecx
c00030af:	50                   	push   %eax
c00030b0:	52                   	push   %edx
c00030b1:	e8 8e 82 00 00       	call   c000b344 <Memcpy>
c00030b6:	83 c4 10             	add    $0x10,%esp
c00030b9:	eb 01                	jmp    c00030bc <mkfs+0x5b0>
c00030bb:	90                   	nop
c00030bc:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c00030c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00030c3:	3b 45 c0             	cmp    -0x40(%ebp),%eax
c00030c6:	7c 92                	jl     c000305a <mkfs+0x54e>
c00030c8:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00030cd:	89 c2                	mov    %eax,%edx
c00030cf:	8b 45 98             	mov    -0x68(%ebp),%eax
c00030d2:	83 ec 0c             	sub    $0xc,%esp
c00030d5:	6a 0a                	push   $0xa
c00030d7:	68 00 02 00 00       	push   $0x200
c00030dc:	52                   	push   %edx
c00030dd:	6a 20                	push   $0x20
c00030df:	50                   	push   %eax
c00030e0:	e8 4d f9 ff ff       	call   c0002a32 <rd_wt>
c00030e5:	83 c4 20             	add    $0x20,%esp
c00030e8:	90                   	nop
c00030e9:	8b 7d fc             	mov    -0x4(%ebp),%edi
c00030ec:	c9                   	leave  
c00030ed:	c3                   	ret    

c00030ee <init_fs>:
c00030ee:	55                   	push   %ebp
c00030ef:	89 e5                	mov    %esp,%ebp
c00030f1:	83 ec 18             	sub    $0x18,%esp
c00030f4:	83 ec 0c             	sub    $0xc,%esp
c00030f7:	6a 6c                	push   $0x6c
c00030f9:	e8 db 3d 00 00       	call   c0006ed9 <sys_malloc>
c00030fe:	83 c4 10             	add    $0x10,%esp
c0003101:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003104:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003107:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c000310e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003111:	c7 40 14 20 00 00 00 	movl   $0x20,0x14(%eax)
c0003118:	83 ec 04             	sub    $0x4,%esp
c000311b:	6a 03                	push   $0x3
c000311d:	ff 75 f4             	pushl  -0xc(%ebp)
c0003120:	6a 03                	push   $0x3
c0003122:	e8 4c 69 00 00       	call   c0009a73 <send_rec>
c0003127:	83 c4 10             	add    $0x10,%esp
c000312a:	e8 dd f9 ff ff       	call   c0002b0c <mkfs>
c000312f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003132:	83 ec 08             	sub    $0x8,%esp
c0003135:	6a 6c                	push   $0x6c
c0003137:	50                   	push   %eax
c0003138:	e8 7b 40 00 00       	call   c00071b8 <sys_free>
c000313d:	83 c4 10             	add    $0x10,%esp
c0003140:	90                   	nop
c0003141:	c9                   	leave  
c0003142:	c3                   	ret    

c0003143 <do_open>:
c0003143:	55                   	push   %ebp
c0003144:	89 e5                	mov    %esp,%ebp
c0003146:	83 ec 68             	sub    $0x68,%esp
c0003149:	83 ec 04             	sub    $0x4,%esp
c000314c:	6a 0c                	push   $0xc
c000314e:	6a 00                	push   $0x0
c0003150:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003153:	50                   	push   %eax
c0003154:	e8 19 82 00 00       	call   c000b372 <Memset>
c0003159:	83 c4 10             	add    $0x10,%esp
c000315c:	8b 45 08             	mov    0x8(%ebp),%eax
c000315f:	8b 40 34             	mov    0x34(%eax),%eax
c0003162:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003165:	83 ec 08             	sub    $0x8,%esp
c0003168:	6a 0c                	push   $0xc
c000316a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000316d:	e8 26 3c 00 00       	call   c0006d98 <alloc_virtual_memory>
c0003172:	83 c4 10             	add    $0x10,%esp
c0003175:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003178:	8b 45 08             	mov    0x8(%ebp),%eax
c000317b:	8b 40 30             	mov    0x30(%eax),%eax
c000317e:	89 c2                	mov    %eax,%edx
c0003180:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003183:	83 ec 04             	sub    $0x4,%esp
c0003186:	52                   	push   %edx
c0003187:	50                   	push   %eax
c0003188:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000318b:	50                   	push   %eax
c000318c:	e8 b3 81 00 00       	call   c000b344 <Memcpy>
c0003191:	83 c4 10             	add    $0x10,%esp
c0003194:	8b 45 08             	mov    0x8(%ebp),%eax
c0003197:	8b 40 30             	mov    0x30(%eax),%eax
c000319a:	c6 44 05 c4 00       	movb   $0x0,-0x3c(%ebp,%eax,1)
c000319f:	8b 45 08             	mov    0x8(%ebp),%eax
c00031a2:	8b 40 64             	mov    0x64(%eax),%eax
c00031a5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00031a8:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c00031af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00031b6:	eb 1f                	jmp    c00031d7 <do_open+0x94>
c00031b8:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c00031bd:	8b 55 f0             	mov    -0x10(%ebp),%edx
c00031c0:	83 c2 50             	add    $0x50,%edx
c00031c3:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00031c7:	85 c0                	test   %eax,%eax
c00031c9:	75 08                	jne    c00031d3 <do_open+0x90>
c00031cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00031ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00031d1:	eb 0a                	jmp    c00031dd <do_open+0x9a>
c00031d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00031d7:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c00031db:	7e db                	jle    c00031b8 <do_open+0x75>
c00031dd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
c00031e1:	75 1c                	jne    c00031ff <do_open+0xbc>
c00031e3:	68 bd 01 00 00       	push   $0x1bd
c00031e8:	68 70 a9 00 c0       	push   $0xc000a970
c00031ed:	68 70 a9 00 c0       	push   $0xc000a970
c00031f2:	68 63 aa 00 c0       	push   $0xc000aa63
c00031f7:	e8 2c 60 00 00       	call   c0009228 <assertion_failure>
c00031fc:	83 c4 10             	add    $0x10,%esp
c00031ff:	c7 45 ec ff ff ff ff 	movl   $0xffffffff,-0x14(%ebp)
c0003206:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000320d:	eb 1d                	jmp    c000322c <do_open+0xe9>
c000320f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003212:	c1 e0 04             	shl    $0x4,%eax
c0003215:	05 88 23 01 c0       	add    $0xc0012388,%eax
c000321a:	8b 00                	mov    (%eax),%eax
c000321c:	85 c0                	test   %eax,%eax
c000321e:	75 08                	jne    c0003228 <do_open+0xe5>
c0003220:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003223:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003226:	eb 0a                	jmp    c0003232 <do_open+0xef>
c0003228:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000322c:	83 7d e8 3f          	cmpl   $0x3f,-0x18(%ebp)
c0003230:	7e dd                	jle    c000320f <do_open+0xcc>
c0003232:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
c0003236:	75 1c                	jne    c0003254 <do_open+0x111>
c0003238:	68 c9 01 00 00       	push   $0x1c9
c000323d:	68 70 a9 00 c0       	push   $0xc000a970
c0003242:	68 70 a9 00 c0       	push   $0xc000a970
c0003247:	68 6b aa 00 c0       	push   $0xc000aa6b
c000324c:	e8 d7 5f 00 00       	call   c0009228 <assertion_failure>
c0003251:	83 c4 10             	add    $0x10,%esp
c0003254:	83 ec 0c             	sub    $0xc,%esp
c0003257:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c000325a:	50                   	push   %eax
c000325b:	e8 b2 00 00 00       	call   c0003312 <search_file>
c0003260:	83 c4 10             	add    $0x10,%esp
c0003263:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003266:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
c000326a:	75 2b                	jne    c0003297 <do_open+0x154>
c000326c:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0003270:	7e 10                	jle    c0003282 <do_open+0x13f>
c0003272:	83 ec 0c             	sub    $0xc,%esp
c0003275:	68 73 aa 00 c0       	push   $0xc000aa73
c000327a:	e8 8b 5f 00 00       	call   c000920a <panic>
c000327f:	83 c4 10             	add    $0x10,%esp
c0003282:	83 ec 08             	sub    $0x8,%esp
c0003285:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0003288:	50                   	push   %eax
c0003289:	8d 45 9c             	lea    -0x64(%ebp),%eax
c000328c:	50                   	push   %eax
c000328d:	e8 40 04 00 00       	call   c00036d2 <create_file>
c0003292:	83 c4 10             	add    $0x10,%esp
c0003295:	eb 22                	jmp    c00032b9 <do_open+0x176>
c0003297:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
c000329b:	75 07                	jne    c00032a4 <do_open+0x161>
c000329d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c00032a2:	eb 6c                	jmp    c0003310 <do_open+0x1cd>
c00032a4:	83 ec 08             	sub    $0x8,%esp
c00032a7:	ff 75 d8             	pushl  -0x28(%ebp)
c00032aa:	8d 45 9c             	lea    -0x64(%ebp),%eax
c00032ad:	50                   	push   %eax
c00032ae:	e8 5d 02 00 00       	call   c0003510 <get_inode>
c00032b3:	83 c4 10             	add    $0x10,%esp
c00032b6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00032b9:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c00032be:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00032c1:	c1 e2 04             	shl    $0x4,%edx
c00032c4:	8d 8a 80 23 01 c0    	lea    -0x3ffedc80(%edx),%ecx
c00032ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00032cd:	83 c2 50             	add    $0x50,%edx
c00032d0:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
c00032d4:	8b 45 ac             	mov    -0x54(%ebp),%eax
c00032d7:	8b 55 ec             	mov    -0x14(%ebp),%edx
c00032da:	c1 e2 04             	shl    $0x4,%edx
c00032dd:	81 c2 88 23 01 c0    	add    $0xc0012388,%edx
c00032e3:	89 02                	mov    %eax,(%edx)
c00032e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032e8:	c1 e0 04             	shl    $0x4,%eax
c00032eb:	05 84 23 01 c0       	add    $0xc0012384,%eax
c00032f0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c00032f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00032f9:	c1 e0 04             	shl    $0x4,%eax
c00032fc:	05 80 23 01 c0       	add    $0xc0012380,%eax
c0003301:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0003307:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000330a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000330d:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003310:	c9                   	leave  
c0003311:	c3                   	ret    

c0003312 <search_file>:
c0003312:	55                   	push   %ebp
c0003313:	89 e5                	mov    %esp,%ebp
c0003315:	83 ec 68             	sub    $0x68,%esp
c0003318:	83 ec 04             	sub    $0x4,%esp
c000331b:	6a 0c                	push   $0xc
c000331d:	6a 00                	push   $0x0
c000331f:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003322:	50                   	push   %eax
c0003323:	e8 4a 80 00 00       	call   c000b372 <Memset>
c0003328:	83 c4 10             	add    $0x10,%esp
c000332b:	83 ec 04             	sub    $0x4,%esp
c000332e:	6a 28                	push   $0x28
c0003330:	6a 00                	push   $0x0
c0003332:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003335:	50                   	push   %eax
c0003336:	e8 37 80 00 00       	call   c000b372 <Memset>
c000333b:	83 c4 10             	add    $0x10,%esp
c000333e:	83 ec 04             	sub    $0x4,%esp
c0003341:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003344:	50                   	push   %eax
c0003345:	ff 75 08             	pushl  0x8(%ebp)
c0003348:	8d 45 c0             	lea    -0x40(%ebp),%eax
c000334b:	50                   	push   %eax
c000334c:	e8 f3 00 00 00       	call   c0003444 <strip_path>
c0003351:	83 c4 10             	add    $0x10,%esp
c0003354:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003357:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
c000335b:	75 0a                	jne    c0003367 <search_file+0x55>
c000335d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003362:	e9 db 00 00 00       	jmp    c0003442 <search_file+0x130>
c0003367:	8b 45 9c             	mov    -0x64(%ebp),%eax
c000336a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000336d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0003370:	05 00 02 00 00       	add    $0x200,%eax
c0003375:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c000337b:	85 c0                	test   %eax,%eax
c000337d:	0f 48 c2             	cmovs  %edx,%eax
c0003380:	c1 f8 09             	sar    $0x9,%eax
c0003383:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003386:	8b 45 9c             	mov    -0x64(%ebp),%eax
c0003389:	c1 e8 04             	shr    $0x4,%eax
c000338c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000338f:	e8 63 14 00 00       	call   c00047f7 <get_super_block>
c0003394:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003397:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000339a:	8b 00                	mov    (%eax),%eax
c000339c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000339f:	c7 45 cc 20 00 00 00 	movl   $0x20,-0x34(%ebp)
c00033a6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00033ad:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00033b4:	eb 7b                	jmp    c0003431 <search_file+0x11f>
c00033b6:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00033bb:	89 c1                	mov    %eax,%ecx
c00033bd:	8b 55 d0             	mov    -0x30(%ebp),%edx
c00033c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00033c3:	01 d0                	add    %edx,%eax
c00033c5:	83 ec 0c             	sub    $0xc,%esp
c00033c8:	6a 07                	push   $0x7
c00033ca:	68 00 02 00 00       	push   $0x200
c00033cf:	51                   	push   %ecx
c00033d0:	ff 75 cc             	pushl  -0x34(%ebp)
c00033d3:	50                   	push   %eax
c00033d4:	e8 59 f6 ff ff       	call   c0002a32 <rd_wt>
c00033d9:	83 c4 20             	add    $0x20,%esp
c00033dc:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00033e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00033e4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00033eb:	eb 35                	jmp    c0003422 <search_file+0x110>
c00033ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00033f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00033f4:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c00033f7:	7f 33                	jg     c000342c <search_file+0x11a>
c00033f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00033fc:	83 c0 04             	add    $0x4,%eax
c00033ff:	83 ec 08             	sub    $0x8,%esp
c0003402:	50                   	push   %eax
c0003403:	8d 45 c0             	lea    -0x40(%ebp),%eax
c0003406:	50                   	push   %eax
c0003407:	e8 c3 69 00 00       	call   c0009dcf <strcmp>
c000340c:	83 c4 10             	add    $0x10,%esp
c000340f:	85 c0                	test   %eax,%eax
c0003411:	75 07                	jne    c000341a <search_file+0x108>
c0003413:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003416:	8b 00                	mov    (%eax),%eax
c0003418:	eb 28                	jmp    c0003442 <search_file+0x130>
c000341a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000341e:	83 45 ec 10          	addl   $0x10,-0x14(%ebp)
c0003422:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003425:	83 f8 1f             	cmp    $0x1f,%eax
c0003428:	76 c3                	jbe    c00033ed <search_file+0xdb>
c000342a:	eb 01                	jmp    c000342d <search_file+0x11b>
c000342c:	90                   	nop
c000342d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003431:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003434:	3b 45 dc             	cmp    -0x24(%ebp),%eax
c0003437:	0f 8c 79 ff ff ff    	jl     c00033b6 <search_file+0xa4>
c000343d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003442:	c9                   	leave  
c0003443:	c3                   	ret    

c0003444 <strip_path>:
c0003444:	55                   	push   %ebp
c0003445:	89 e5                	mov    %esp,%ebp
c0003447:	83 ec 10             	sub    $0x10,%esp
c000344a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000344e:	75 0a                	jne    c000345a <strip_path+0x16>
c0003450:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003455:	e9 b4 00 00 00       	jmp    c000350e <strip_path+0xca>
c000345a:	8b 45 08             	mov    0x8(%ebp),%eax
c000345d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0003460:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003463:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0003466:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003469:	0f b6 00             	movzbl (%eax),%eax
c000346c:	3c 2f                	cmp    $0x2f,%al
c000346e:	75 2d                	jne    c000349d <strip_path+0x59>
c0003470:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0003474:	eb 27                	jmp    c000349d <strip_path+0x59>
c0003476:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0003479:	0f b6 00             	movzbl (%eax),%eax
c000347c:	3c 2f                	cmp    $0x2f,%al
c000347e:	75 0a                	jne    c000348a <strip_path+0x46>
c0003480:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0003485:	e9 84 00 00 00       	jmp    c000350e <strip_path+0xca>
c000348a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000348d:	0f b6 10             	movzbl (%eax),%edx
c0003490:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0003493:	88 10                	mov    %dl,(%eax)
c0003495:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0003499:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c000349d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00034a0:	0f b6 00             	movzbl (%eax),%eax
c00034a3:	84 c0                	test   %al,%al
c00034a5:	75 cf                	jne    c0003476 <strip_path+0x32>
c00034a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00034aa:	c6 00 00             	movb   $0x0,(%eax)
c00034ad:	8b 45 10             	mov    0x10(%ebp),%eax
c00034b0:	8b 15 c0 31 01 c0    	mov    0xc00131c0,%edx
c00034b6:	89 10                	mov    %edx,(%eax)
c00034b8:	8b 15 c4 31 01 c0    	mov    0xc00131c4,%edx
c00034be:	89 50 04             	mov    %edx,0x4(%eax)
c00034c1:	8b 15 c8 31 01 c0    	mov    0xc00131c8,%edx
c00034c7:	89 50 08             	mov    %edx,0x8(%eax)
c00034ca:	8b 15 cc 31 01 c0    	mov    0xc00131cc,%edx
c00034d0:	89 50 0c             	mov    %edx,0xc(%eax)
c00034d3:	8b 15 d0 31 01 c0    	mov    0xc00131d0,%edx
c00034d9:	89 50 10             	mov    %edx,0x10(%eax)
c00034dc:	8b 15 d4 31 01 c0    	mov    0xc00131d4,%edx
c00034e2:	89 50 14             	mov    %edx,0x14(%eax)
c00034e5:	8b 15 d8 31 01 c0    	mov    0xc00131d8,%edx
c00034eb:	89 50 18             	mov    %edx,0x18(%eax)
c00034ee:	8b 15 dc 31 01 c0    	mov    0xc00131dc,%edx
c00034f4:	89 50 1c             	mov    %edx,0x1c(%eax)
c00034f7:	8b 15 e0 31 01 c0    	mov    0xc00131e0,%edx
c00034fd:	89 50 20             	mov    %edx,0x20(%eax)
c0003500:	8b 15 e4 31 01 c0    	mov    0xc00131e4,%edx
c0003506:	89 50 24             	mov    %edx,0x24(%eax)
c0003509:	b8 00 00 00 00       	mov    $0x0,%eax
c000350e:	c9                   	leave  
c000350f:	c3                   	ret    

c0003510 <get_inode>:
c0003510:	55                   	push   %ebp
c0003511:	89 e5                	mov    %esp,%ebp
c0003513:	56                   	push   %esi
c0003514:	53                   	push   %ebx
c0003515:	83 ec 20             	sub    $0x20,%esp
c0003518:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000351c:	75 0a                	jne    c0003528 <get_inode+0x18>
c000351e:	b8 00 00 00 00       	mov    $0x0,%eax
c0003523:	e9 a3 01 00 00       	jmp    c00036cb <get_inode+0x1bb>
c0003528:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000352f:	c7 45 f0 a0 27 01 c0 	movl   $0xc00127a0,-0x10(%ebp)
c0003536:	eb 69                	jmp    c00035a1 <get_inode+0x91>
c0003538:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000353b:	8b 40 24             	mov    0x24(%eax),%eax
c000353e:	85 c0                	test   %eax,%eax
c0003540:	7e 53                	jle    c0003595 <get_inode+0x85>
c0003542:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003545:	8b 40 10             	mov    0x10(%eax),%eax
c0003548:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000354b:	75 50                	jne    c000359d <get_inode+0x8d>
c000354d:	8b 45 08             	mov    0x8(%ebp),%eax
c0003550:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0003553:	8b 0a                	mov    (%edx),%ecx
c0003555:	89 08                	mov    %ecx,(%eax)
c0003557:	8b 4a 04             	mov    0x4(%edx),%ecx
c000355a:	89 48 04             	mov    %ecx,0x4(%eax)
c000355d:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003560:	89 48 08             	mov    %ecx,0x8(%eax)
c0003563:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0003566:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003569:	8b 4a 10             	mov    0x10(%edx),%ecx
c000356c:	89 48 10             	mov    %ecx,0x10(%eax)
c000356f:	8b 4a 14             	mov    0x14(%edx),%ecx
c0003572:	89 48 14             	mov    %ecx,0x14(%eax)
c0003575:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003578:	89 48 18             	mov    %ecx,0x18(%eax)
c000357b:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000357e:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0003581:	8b 4a 20             	mov    0x20(%edx),%ecx
c0003584:	89 48 20             	mov    %ecx,0x20(%eax)
c0003587:	8b 52 24             	mov    0x24(%edx),%edx
c000358a:	89 50 24             	mov    %edx,0x24(%eax)
c000358d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003590:	e9 36 01 00 00       	jmp    c00036cb <get_inode+0x1bb>
c0003595:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003598:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000359b:	eb 0d                	jmp    c00035aa <get_inode+0x9a>
c000359d:	83 45 f0 28          	addl   $0x28,-0x10(%ebp)
c00035a1:	81 7d f0 a0 31 01 c0 	cmpl   $0xc00131a0,-0x10(%ebp)
c00035a8:	76 8e                	jbe    c0003538 <get_inode+0x28>
c00035aa:	e8 48 12 00 00       	call   c00047f7 <get_super_block>
c00035af:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00035b2:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00035b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035bc:	8b 40 04             	mov    0x4(%eax),%eax
c00035bf:	8d 50 02             	lea    0x2(%eax),%edx
c00035c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00035c5:	8b 40 08             	mov    0x8(%eax),%eax
c00035c8:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
c00035cb:	8b 45 0c             	mov    0xc(%ebp),%eax
c00035ce:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00035d1:	b8 00 02 00 00       	mov    $0x200,%eax
c00035d6:	99                   	cltd   
c00035d7:	f7 7d e8             	idivl  -0x18(%ebp)
c00035da:	89 c6                	mov    %eax,%esi
c00035dc:	89 c8                	mov    %ecx,%eax
c00035de:	99                   	cltd   
c00035df:	f7 fe                	idiv   %esi
c00035e1:	01 d8                	add    %ebx,%eax
c00035e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00035e6:	c7 45 e0 20 00 00 00 	movl   $0x20,-0x20(%ebp)
c00035ed:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00035f2:	83 ec 0c             	sub    $0xc,%esp
c00035f5:	6a 07                	push   $0x7
c00035f7:	68 00 02 00 00       	push   $0x200
c00035fc:	50                   	push   %eax
c00035fd:	ff 75 e0             	pushl  -0x20(%ebp)
c0003600:	ff 75 e4             	pushl  -0x1c(%ebp)
c0003603:	e8 2a f4 ff ff       	call   c0002a32 <rd_wt>
c0003608:	83 c4 20             	add    $0x20,%esp
c000360b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000360e:	8d 48 ff             	lea    -0x1(%eax),%ecx
c0003611:	b8 00 02 00 00       	mov    $0x200,%eax
c0003616:	99                   	cltd   
c0003617:	f7 7d e8             	idivl  -0x18(%ebp)
c000361a:	89 c3                	mov    %eax,%ebx
c000361c:	89 c8                	mov    %ecx,%eax
c000361e:	99                   	cltd   
c000361f:	f7 fb                	idiv   %ebx
c0003621:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0003624:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000362a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000362d:	0f af 45 dc          	imul   -0x24(%ebp),%eax
c0003631:	01 d0                	add    %edx,%eax
c0003633:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003636:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003639:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000363c:	8b 0a                	mov    (%edx),%ecx
c000363e:	89 08                	mov    %ecx,(%eax)
c0003640:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003643:	89 48 04             	mov    %ecx,0x4(%eax)
c0003646:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003649:	89 48 08             	mov    %ecx,0x8(%eax)
c000364c:	8b 4a 0c             	mov    0xc(%edx),%ecx
c000364f:	89 48 0c             	mov    %ecx,0xc(%eax)
c0003652:	8b 4a 10             	mov    0x10(%edx),%ecx
c0003655:	89 48 10             	mov    %ecx,0x10(%eax)
c0003658:	8b 4a 14             	mov    0x14(%edx),%ecx
c000365b:	89 48 14             	mov    %ecx,0x14(%eax)
c000365e:	8b 4a 18             	mov    0x18(%edx),%ecx
c0003661:	89 48 18             	mov    %ecx,0x18(%eax)
c0003664:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c0003667:	89 48 1c             	mov    %ecx,0x1c(%eax)
c000366a:	8b 4a 20             	mov    0x20(%edx),%ecx
c000366d:	89 48 20             	mov    %ecx,0x20(%eax)
c0003670:	8b 52 24             	mov    0x24(%edx),%edx
c0003673:	89 50 24             	mov    %edx,0x24(%eax)
c0003676:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003679:	8b 55 0c             	mov    0xc(%ebp),%edx
c000367c:	89 50 10             	mov    %edx,0x10(%eax)
c000367f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003682:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003685:	89 50 20             	mov    %edx,0x20(%eax)
c0003688:	8b 45 08             	mov    0x8(%ebp),%eax
c000368b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000368e:	8b 0a                	mov    (%edx),%ecx
c0003690:	89 08                	mov    %ecx,(%eax)
c0003692:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003695:	89 48 04             	mov    %ecx,0x4(%eax)
c0003698:	8b 4a 08             	mov    0x8(%edx),%ecx
c000369b:	89 48 08             	mov    %ecx,0x8(%eax)
c000369e:	8b 4a 0c             	mov    0xc(%edx),%ecx
c00036a1:	89 48 0c             	mov    %ecx,0xc(%eax)
c00036a4:	8b 4a 10             	mov    0x10(%edx),%ecx
c00036a7:	89 48 10             	mov    %ecx,0x10(%eax)
c00036aa:	8b 4a 14             	mov    0x14(%edx),%ecx
c00036ad:	89 48 14             	mov    %ecx,0x14(%eax)
c00036b0:	8b 4a 18             	mov    0x18(%edx),%ecx
c00036b3:	89 48 18             	mov    %ecx,0x18(%eax)
c00036b6:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c00036b9:	89 48 1c             	mov    %ecx,0x1c(%eax)
c00036bc:	8b 4a 20             	mov    0x20(%edx),%ecx
c00036bf:	89 48 20             	mov    %ecx,0x20(%eax)
c00036c2:	8b 52 24             	mov    0x24(%edx),%edx
c00036c5:	89 50 24             	mov    %edx,0x24(%eax)
c00036c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00036cb:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00036ce:	5b                   	pop    %ebx
c00036cf:	5e                   	pop    %esi
c00036d0:	5d                   	pop    %ebp
c00036d1:	c3                   	ret    

c00036d2 <create_file>:
c00036d2:	55                   	push   %ebp
c00036d3:	89 e5                	mov    %esp,%ebp
c00036d5:	81 ec 98 00 00 00    	sub    $0x98,%esp
c00036db:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00036de:	50                   	push   %eax
c00036df:	ff 75 0c             	pushl  0xc(%ebp)
c00036e2:	8d 45 ac             	lea    -0x54(%ebp),%eax
c00036e5:	50                   	push   %eax
c00036e6:	e8 59 fd ff ff       	call   c0003444 <strip_path>
c00036eb:	83 c4 0c             	add    $0xc,%esp
c00036ee:	83 f8 ff             	cmp    $0xffffffff,%eax
c00036f1:	75 0a                	jne    c00036fd <create_file+0x2b>
c00036f3:	b8 00 00 00 00       	mov    $0x0,%eax
c00036f8:	e9 de 00 00 00       	jmp    c00037db <create_file+0x109>
c00036fd:	e8 db 00 00 00       	call   c00037dd <alloc_imap_bit>
c0003702:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003705:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003709:	75 0a                	jne    c0003715 <create_file+0x43>
c000370b:	b8 00 00 00 00       	mov    $0x0,%eax
c0003710:	e9 c6 00 00 00       	jmp    c00037db <create_file+0x109>
c0003715:	e8 dd 10 00 00       	call   c00047f7 <get_super_block>
c000371a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000371d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003720:	8b 40 10             	mov    0x10(%eax),%eax
c0003723:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003726:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003729:	83 ec 08             	sub    $0x8,%esp
c000372c:	50                   	push   %eax
c000372d:	ff 75 f4             	pushl  -0xc(%ebp)
c0003730:	e8 a5 01 00 00       	call   c00038da <alloc_smap_bit>
c0003735:	83 c4 10             	add    $0x10,%esp
c0003738:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000373b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000373f:	75 0a                	jne    c000374b <create_file+0x79>
c0003741:	b8 00 00 00 00       	mov    $0x0,%eax
c0003746:	e9 90 00 00 00       	jmp    c00037db <create_file+0x109>
c000374b:	83 ec 04             	sub    $0x4,%esp
c000374e:	ff 75 e8             	pushl  -0x18(%ebp)
c0003751:	ff 75 f4             	pushl  -0xc(%ebp)
c0003754:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0003757:	50                   	push   %eax
c0003758:	e8 1e 03 00 00       	call   c0003a7b <new_inode>
c000375d:	83 c4 10             	add    $0x10,%esp
c0003760:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003763:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0003767:	75 07                	jne    c0003770 <create_file+0x9e>
c0003769:	b8 00 00 00 00       	mov    $0x0,%eax
c000376e:	eb 6b                	jmp    c00037db <create_file+0x109>
c0003770:	ff 75 f4             	pushl  -0xc(%ebp)
c0003773:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0003776:	50                   	push   %eax
c0003777:	8d 45 b8             	lea    -0x48(%ebp),%eax
c000377a:	50                   	push   %eax
c000377b:	8d 85 74 ff ff ff    	lea    -0x8c(%ebp),%eax
c0003781:	50                   	push   %eax
c0003782:	e8 12 04 00 00       	call   c0003b99 <new_dir_entry>
c0003787:	83 c4 10             	add    $0x10,%esp
c000378a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000378d:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003791:	75 07                	jne    c000379a <create_file+0xc8>
c0003793:	b8 00 00 00 00       	mov    $0x0,%eax
c0003798:	eb 41                	jmp    c00037db <create_file+0x109>
c000379a:	8b 45 08             	mov    0x8(%ebp),%eax
c000379d:	8b 55 84             	mov    -0x7c(%ebp),%edx
c00037a0:	89 10                	mov    %edx,(%eax)
c00037a2:	8b 55 88             	mov    -0x78(%ebp),%edx
c00037a5:	89 50 04             	mov    %edx,0x4(%eax)
c00037a8:	8b 55 8c             	mov    -0x74(%ebp),%edx
c00037ab:	89 50 08             	mov    %edx,0x8(%eax)
c00037ae:	8b 55 90             	mov    -0x70(%ebp),%edx
c00037b1:	89 50 0c             	mov    %edx,0xc(%eax)
c00037b4:	8b 55 94             	mov    -0x6c(%ebp),%edx
c00037b7:	89 50 10             	mov    %edx,0x10(%eax)
c00037ba:	8b 55 98             	mov    -0x68(%ebp),%edx
c00037bd:	89 50 14             	mov    %edx,0x14(%eax)
c00037c0:	8b 55 9c             	mov    -0x64(%ebp),%edx
c00037c3:	89 50 18             	mov    %edx,0x18(%eax)
c00037c6:	8b 55 a0             	mov    -0x60(%ebp),%edx
c00037c9:	89 50 1c             	mov    %edx,0x1c(%eax)
c00037cc:	8b 55 a4             	mov    -0x5c(%ebp),%edx
c00037cf:	89 50 20             	mov    %edx,0x20(%eax)
c00037d2:	8b 55 a8             	mov    -0x58(%ebp),%edx
c00037d5:	89 50 24             	mov    %edx,0x24(%eax)
c00037d8:	8b 45 08             	mov    0x8(%ebp),%eax
c00037db:	c9                   	leave  
c00037dc:	c3                   	ret    

c00037dd <alloc_imap_bit>:
c00037dd:	55                   	push   %ebp
c00037de:	89 e5                	mov    %esp,%ebp
c00037e0:	53                   	push   %ebx
c00037e1:	83 ec 24             	sub    $0x24,%esp
c00037e4:	c7 45 ec 02 00 00 00 	movl   $0x2,-0x14(%ebp)
c00037eb:	c7 45 e8 20 00 00 00 	movl   $0x20,-0x18(%ebp)
c00037f2:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00037f7:	83 ec 0c             	sub    $0xc,%esp
c00037fa:	6a 07                	push   $0x7
c00037fc:	68 00 02 00 00       	push   $0x200
c0003801:	50                   	push   %eax
c0003802:	ff 75 e8             	pushl  -0x18(%ebp)
c0003805:	ff 75 ec             	pushl  -0x14(%ebp)
c0003808:	e8 25 f2 ff ff       	call   c0002a32 <rd_wt>
c000380d:	83 c4 20             	add    $0x20,%esp
c0003810:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003817:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000381e:	e9 a5 00 00 00       	jmp    c00038c8 <alloc_imap_bit+0xeb>
c0003823:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000382a:	e9 8b 00 00 00       	jmp    c00038ba <alloc_imap_bit+0xdd>
c000382f:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003835:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003838:	01 d0                	add    %edx,%eax
c000383a:	0f b6 00             	movzbl (%eax),%eax
c000383d:	0f be d0             	movsbl %al,%edx
c0003840:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003843:	89 c1                	mov    %eax,%ecx
c0003845:	d3 fa                	sar    %cl,%edx
c0003847:	89 d0                	mov    %edx,%eax
c0003849:	83 e0 01             	and    $0x1,%eax
c000384c:	85 c0                	test   %eax,%eax
c000384e:	74 06                	je     c0003856 <alloc_imap_bit+0x79>
c0003850:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003854:	eb 64                	jmp    c00038ba <alloc_imap_bit+0xdd>
c0003856:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000385c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000385f:	01 d0                	add    %edx,%eax
c0003861:	0f b6 18             	movzbl (%eax),%ebx
c0003864:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003867:	ba 01 00 00 00       	mov    $0x1,%edx
c000386c:	89 c1                	mov    %eax,%ecx
c000386e:	d3 e2                	shl    %cl,%edx
c0003870:	89 d0                	mov    %edx,%eax
c0003872:	89 c1                	mov    %eax,%ecx
c0003874:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000387a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000387d:	01 d0                	add    %edx,%eax
c000387f:	09 cb                	or     %ecx,%ebx
c0003881:	89 da                	mov    %ebx,%edx
c0003883:	88 10                	mov    %dl,(%eax)
c0003885:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003888:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c000388f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003892:	01 d0                	add    %edx,%eax
c0003894:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003897:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000389c:	83 ec 0c             	sub    $0xc,%esp
c000389f:	6a 0a                	push   $0xa
c00038a1:	68 00 02 00 00       	push   $0x200
c00038a6:	50                   	push   %eax
c00038a7:	ff 75 e8             	pushl  -0x18(%ebp)
c00038aa:	ff 75 ec             	pushl  -0x14(%ebp)
c00038ad:	e8 80 f1 ff ff       	call   c0002a32 <rd_wt>
c00038b2:	83 c4 20             	add    $0x20,%esp
c00038b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00038b8:	eb 1b                	jmp    c00038d5 <alloc_imap_bit+0xf8>
c00038ba:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
c00038be:	0f 8e 6b ff ff ff    	jle    c000382f <alloc_imap_bit+0x52>
c00038c4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00038c8:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
c00038cf:	0f 8e 4e ff ff ff    	jle    c0003823 <alloc_imap_bit+0x46>
c00038d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00038d8:	c9                   	leave  
c00038d9:	c3                   	ret    

c00038da <alloc_smap_bit>:
c00038da:	55                   	push   %ebp
c00038db:	89 e5                	mov    %esp,%ebp
c00038dd:	53                   	push   %ebx
c00038de:	83 ec 34             	sub    $0x34,%esp
c00038e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00038e5:	75 1c                	jne    c0003903 <alloc_smap_bit+0x29>
c00038e7:	68 f3 02 00 00       	push   $0x2f3
c00038ec:	68 70 a9 00 c0       	push   $0xc000a970
c00038f1:	68 70 a9 00 c0       	push   $0xc000a970
c00038f6:	68 80 aa 00 c0       	push   $0xc000aa80
c00038fb:	e8 28 59 00 00       	call   c0009228 <assertion_failure>
c0003900:	83 c4 10             	add    $0x10,%esp
c0003903:	e8 ef 0e 00 00       	call   c00047f7 <get_super_block>
c0003908:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000390b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000390e:	8b 40 08             	mov    0x8(%eax),%eax
c0003911:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0003914:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003917:	8b 40 04             	mov    0x4(%eax),%eax
c000391a:	83 c0 02             	add    $0x2,%eax
c000391d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0003920:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003927:	c7 45 d8 20 00 00 00 	movl   $0x20,-0x28(%ebp)
c000392e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003935:	e9 20 01 00 00       	jmp    c0003a5a <alloc_smap_bit+0x180>
c000393a:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000393d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003940:	01 d0                	add    %edx,%eax
c0003942:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003945:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000394a:	83 ec 0c             	sub    $0xc,%esp
c000394d:	6a 07                	push   $0x7
c000394f:	68 00 02 00 00       	push   $0x200
c0003954:	50                   	push   %eax
c0003955:	ff 75 d8             	pushl  -0x28(%ebp)
c0003958:	ff 75 d4             	pushl  -0x2c(%ebp)
c000395b:	e8 d2 f0 ff ff       	call   c0002a32 <rd_wt>
c0003960:	83 c4 20             	add    $0x20,%esp
c0003963:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000396a:	e9 b0 00 00 00       	jmp    c0003a1f <alloc_smap_bit+0x145>
c000396f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003976:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000397a:	0f 85 8c 00 00 00    	jne    c0003a0c <alloc_smap_bit+0x132>
c0003980:	eb 45                	jmp    c00039c7 <alloc_smap_bit+0xed>
c0003982:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003988:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000398b:	01 d0                	add    %edx,%eax
c000398d:	0f b6 00             	movzbl (%eax),%eax
c0003990:	0f be d0             	movsbl %al,%edx
c0003993:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003996:	89 c1                	mov    %eax,%ecx
c0003998:	d3 fa                	sar    %cl,%edx
c000399a:	89 d0                	mov    %edx,%eax
c000399c:	83 e0 01             	and    $0x1,%eax
c000399f:	85 c0                	test   %eax,%eax
c00039a1:	74 06                	je     c00039a9 <alloc_smap_bit+0xcf>
c00039a3:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c00039a7:	eb 1e                	jmp    c00039c7 <alloc_smap_bit+0xed>
c00039a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00039ac:	c1 e0 09             	shl    $0x9,%eax
c00039af:	89 c2                	mov    %eax,%edx
c00039b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039b4:	01 d0                	add    %edx,%eax
c00039b6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00039bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00039c0:	01 d0                	add    %edx,%eax
c00039c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00039c5:	eb 06                	jmp    c00039cd <alloc_smap_bit+0xf3>
c00039c7:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c00039cb:	7e b5                	jle    c0003982 <alloc_smap_bit+0xa8>
c00039cd:	eb 3d                	jmp    c0003a0c <alloc_smap_bit+0x132>
c00039cf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00039d3:	74 45                	je     c0003a1a <alloc_smap_bit+0x140>
c00039d5:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039db:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039de:	01 d0                	add    %edx,%eax
c00039e0:	0f b6 18             	movzbl (%eax),%ebx
c00039e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00039e6:	ba 01 00 00 00       	mov    $0x1,%edx
c00039eb:	89 c1                	mov    %eax,%ecx
c00039ed:	d3 e2                	shl    %cl,%edx
c00039ef:	89 d0                	mov    %edx,%eax
c00039f1:	89 c1                	mov    %eax,%ecx
c00039f3:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00039f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00039fc:	01 d0                	add    %edx,%eax
c00039fe:	09 cb                	or     %ecx,%ebx
c0003a00:	89 da                	mov    %ebx,%edx
c0003a02:	88 10                	mov    %dl,(%eax)
c0003a04:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0003a08:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003a0c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a10:	74 09                	je     c0003a1b <alloc_smap_bit+0x141>
c0003a12:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c0003a16:	7e b7                	jle    c00039cf <alloc_smap_bit+0xf5>
c0003a18:	eb 01                	jmp    c0003a1b <alloc_smap_bit+0x141>
c0003a1a:	90                   	nop
c0003a1b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003a1f:	81 7d ec ff 01 00 00 	cmpl   $0x1ff,-0x14(%ebp)
c0003a26:	0f 8e 43 ff ff ff    	jle    c000396f <alloc_smap_bit+0x95>
c0003a2c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003a30:	74 1e                	je     c0003a50 <alloc_smap_bit+0x176>
c0003a32:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003a37:	83 ec 0c             	sub    $0xc,%esp
c0003a3a:	6a 0a                	push   $0xa
c0003a3c:	68 00 02 00 00       	push   $0x200
c0003a41:	50                   	push   %eax
c0003a42:	ff 75 d8             	pushl  -0x28(%ebp)
c0003a45:	ff 75 d4             	pushl  -0x2c(%ebp)
c0003a48:	e8 e5 ef ff ff       	call   c0002a32 <rd_wt>
c0003a4d:	83 c4 20             	add    $0x20,%esp
c0003a50:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0003a54:	74 12                	je     c0003a68 <alloc_smap_bit+0x18e>
c0003a56:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0003a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003a5d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
c0003a60:	0f 8c d4 fe ff ff    	jl     c000393a <alloc_smap_bit+0x60>
c0003a66:	eb 01                	jmp    c0003a69 <alloc_smap_bit+0x18f>
c0003a68:	90                   	nop
c0003a69:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003a6c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0003a6f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0003a72:	8b 00                	mov    (%eax),%eax
c0003a74:	01 d0                	add    %edx,%eax
c0003a76:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0003a79:	c9                   	leave  
c0003a7a:	c3                   	ret    

c0003a7b <new_inode>:
c0003a7b:	55                   	push   %ebp
c0003a7c:	89 e5                	mov    %esp,%ebp
c0003a7e:	83 ec 38             	sub    $0x38,%esp
c0003a81:	83 ec 08             	sub    $0x8,%esp
c0003a84:	ff 75 0c             	pushl  0xc(%ebp)
c0003a87:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003a8a:	50                   	push   %eax
c0003a8b:	e8 80 fa ff ff       	call   c0003510 <get_inode>
c0003a90:	83 c4 10             	add    $0x10,%esp
c0003a93:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003a96:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0003a9a:	75 0a                	jne    c0003aa6 <new_inode+0x2b>
c0003a9c:	b8 00 00 00 00       	mov    $0x0,%eax
c0003aa1:	e9 f1 00 00 00       	jmp    c0003b97 <new_inode+0x11c>
c0003aa6:	8b 45 10             	mov    0x10(%ebp),%eax
c0003aa9:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003aac:	c7 45 d4 00 08 00 00 	movl   $0x800,-0x2c(%ebp)
c0003ab3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0003aba:	c7 45 c8 02 00 00 00 	movl   $0x2,-0x38(%ebp)
c0003ac1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ac4:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003ac7:	83 ec 0c             	sub    $0xc,%esp
c0003aca:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0003acd:	50                   	push   %eax
c0003ace:	e8 40 0b 00 00       	call   c0004613 <sync_inode>
c0003ad3:	83 c4 10             	add    $0x10,%esp
c0003ad6:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0003add:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003ae4:	eb 1d                	jmp    c0003b03 <new_inode+0x88>
c0003ae6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003ae9:	89 d0                	mov    %edx,%eax
c0003aeb:	c1 e0 02             	shl    $0x2,%eax
c0003aee:	01 d0                	add    %edx,%eax
c0003af0:	c1 e0 03             	shl    $0x3,%eax
c0003af3:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0003af8:	8b 00                	mov    (%eax),%eax
c0003afa:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0003afd:	74 0c                	je     c0003b0b <new_inode+0x90>
c0003aff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0003b03:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c0003b07:	7e dd                	jle    c0003ae6 <new_inode+0x6b>
c0003b09:	eb 01                	jmp    c0003b0c <new_inode+0x91>
c0003b0b:	90                   	nop
c0003b0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003b0f:	89 d0                	mov    %edx,%eax
c0003b11:	c1 e0 02             	shl    $0x2,%eax
c0003b14:	01 d0                	add    %edx,%eax
c0003b16:	c1 e0 03             	shl    $0x3,%eax
c0003b19:	05 a0 27 01 c0       	add    $0xc00127a0,%eax
c0003b1e:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003b21:	89 10                	mov    %edx,(%eax)
c0003b23:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003b26:	89 50 04             	mov    %edx,0x4(%eax)
c0003b29:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003b2c:	89 50 08             	mov    %edx,0x8(%eax)
c0003b2f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003b32:	89 50 0c             	mov    %edx,0xc(%eax)
c0003b35:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003b38:	89 50 10             	mov    %edx,0x10(%eax)
c0003b3b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003b3e:	89 50 14             	mov    %edx,0x14(%eax)
c0003b41:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003b44:	89 50 18             	mov    %edx,0x18(%eax)
c0003b47:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003b4a:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003b4d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003b50:	89 50 20             	mov    %edx,0x20(%eax)
c0003b53:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003b56:	89 50 24             	mov    %edx,0x24(%eax)
c0003b59:	8b 45 08             	mov    0x8(%ebp),%eax
c0003b5c:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0003b5f:	89 10                	mov    %edx,(%eax)
c0003b61:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003b64:	89 50 04             	mov    %edx,0x4(%eax)
c0003b67:	8b 55 d0             	mov    -0x30(%ebp),%edx
c0003b6a:	89 50 08             	mov    %edx,0x8(%eax)
c0003b6d:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0003b70:	89 50 0c             	mov    %edx,0xc(%eax)
c0003b73:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0003b76:	89 50 10             	mov    %edx,0x10(%eax)
c0003b79:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0003b7c:	89 50 14             	mov    %edx,0x14(%eax)
c0003b7f:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0003b82:	89 50 18             	mov    %edx,0x18(%eax)
c0003b85:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0003b88:	89 50 1c             	mov    %edx,0x1c(%eax)
c0003b8b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0003b8e:	89 50 20             	mov    %edx,0x20(%eax)
c0003b91:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0003b94:	89 50 24             	mov    %edx,0x24(%eax)
c0003b97:	c9                   	leave  
c0003b98:	c3                   	ret    

c0003b99 <new_dir_entry>:
c0003b99:	55                   	push   %ebp
c0003b9a:	89 e5                	mov    %esp,%ebp
c0003b9c:	83 ec 48             	sub    $0x48,%esp
c0003b9f:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
c0003ba6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003ba9:	8b 40 04             	mov    0x4(%eax),%eax
c0003bac:	99                   	cltd   
c0003bad:	f7 7d dc             	idivl  -0x24(%ebp)
c0003bb0:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0003bb3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003bb6:	8b 40 0c             	mov    0xc(%eax),%eax
c0003bb9:	99                   	cltd   
c0003bba:	f7 7d dc             	idivl  -0x24(%ebp)
c0003bbd:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0003bc0:	e8 32 0c 00 00       	call   c00047f7 <get_super_block>
c0003bc5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003bc8:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0003bcb:	8b 00                	mov    (%eax),%eax
c0003bcd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003bd0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003bd3:	8b 40 0c             	mov    0xc(%eax),%eax
c0003bd6:	05 00 02 00 00       	add    $0x200,%eax
c0003bdb:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003be1:	85 c0                	test   %eax,%eax
c0003be3:	0f 48 c2             	cmovs  %edx,%eax
c0003be6:	c1 f8 09             	sar    $0x9,%eax
c0003be9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003bec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0003bf3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0003bfa:	c7 45 c4 20 00 00 00 	movl   $0x20,-0x3c(%ebp)
c0003c01:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0003c08:	eb 7f                	jmp    c0003c89 <new_dir_entry+0xf0>
c0003c0a:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003c0f:	89 c1                	mov    %eax,%ecx
c0003c11:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003c14:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003c17:	01 d0                	add    %edx,%eax
c0003c19:	83 ec 0c             	sub    $0xc,%esp
c0003c1c:	6a 07                	push   $0x7
c0003c1e:	68 00 02 00 00       	push   $0x200
c0003c23:	51                   	push   %ecx
c0003c24:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003c27:	50                   	push   %eax
c0003c28:	e8 05 ee ff ff       	call   c0002a32 <rd_wt>
c0003c2d:	83 c4 20             	add    $0x20,%esp
c0003c30:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0003c35:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0003c38:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0003c3f:	eb 25                	jmp    c0003c66 <new_dir_entry+0xcd>
c0003c41:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0003c45:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003c48:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003c4b:	7f 29                	jg     c0003c76 <new_dir_entry+0xdd>
c0003c4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c50:	8b 00                	mov    (%eax),%eax
c0003c52:	85 c0                	test   %eax,%eax
c0003c54:	75 08                	jne    c0003c5e <new_dir_entry+0xc5>
c0003c56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003c59:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003c5c:	eb 19                	jmp    c0003c77 <new_dir_entry+0xde>
c0003c5e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0003c62:	83 45 f0 10          	addl   $0x10,-0x10(%ebp)
c0003c66:	b8 00 02 00 00       	mov    $0x200,%eax
c0003c6b:	99                   	cltd   
c0003c6c:	f7 7d dc             	idivl  -0x24(%ebp)
c0003c6f:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0003c72:	7c cd                	jl     c0003c41 <new_dir_entry+0xa8>
c0003c74:	eb 01                	jmp    c0003c77 <new_dir_entry+0xde>
c0003c76:	90                   	nop
c0003c77:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0003c7a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
c0003c7d:	7f 16                	jg     c0003c95 <new_dir_entry+0xfc>
c0003c7f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003c83:	75 10                	jne    c0003c95 <new_dir_entry+0xfc>
c0003c85:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0003c89:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003c8c:	3b 45 c8             	cmp    -0x38(%ebp),%eax
c0003c8f:	0f 8c 75 ff ff ff    	jl     c0003c0a <new_dir_entry+0x71>
c0003c95:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0003c98:	3b 45 d4             	cmp    -0x2c(%ebp),%eax
c0003c9b:	75 0a                	jne    c0003ca7 <new_dir_entry+0x10e>
c0003c9d:	b8 00 00 00 00       	mov    $0x0,%eax
c0003ca2:	e9 fc 00 00 00       	jmp    c0003da3 <new_dir_entry+0x20a>
c0003ca7:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0003cae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0003cb2:	75 1e                	jne    c0003cd2 <new_dir_entry+0x139>
c0003cb4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0003cb7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003cba:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cbd:	8b 50 04             	mov    0x4(%eax),%edx
c0003cc0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0003cc3:	01 c2                	add    %eax,%edx
c0003cc5:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003cc8:	89 50 04             	mov    %edx,0x4(%eax)
c0003ccb:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
c0003cd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003cd5:	8b 55 14             	mov    0x14(%ebp),%edx
c0003cd8:	89 10                	mov    %edx,(%eax)
c0003cda:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003cdd:	83 c0 04             	add    $0x4,%eax
c0003ce0:	83 ec 08             	sub    $0x8,%esp
c0003ce3:	ff 75 10             	pushl  0x10(%ebp)
c0003ce6:	50                   	push   %eax
c0003ce7:	e8 a5 76 00 00       	call   c000b391 <Strcpy>
c0003cec:	83 c4 10             	add    $0x10,%esp
c0003cef:	8b 45 08             	mov    0x8(%ebp),%eax
c0003cf2:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0003cf5:	8b 0a                	mov    (%edx),%ecx
c0003cf7:	89 08                	mov    %ecx,(%eax)
c0003cf9:	8b 4a 04             	mov    0x4(%edx),%ecx
c0003cfc:	89 48 04             	mov    %ecx,0x4(%eax)
c0003cff:	8b 4a 08             	mov    0x8(%edx),%ecx
c0003d02:	89 48 08             	mov    %ecx,0x8(%eax)
c0003d05:	8b 52 0c             	mov    0xc(%edx),%edx
c0003d08:	89 50 0c             	mov    %edx,0xc(%eax)
c0003d0b:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003d10:	89 c1                	mov    %eax,%ecx
c0003d12:	8b 55 cc             	mov    -0x34(%ebp),%edx
c0003d15:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0003d18:	01 d0                	add    %edx,%eax
c0003d1a:	83 ec 0c             	sub    $0xc,%esp
c0003d1d:	6a 0a                	push   $0xa
c0003d1f:	68 00 02 00 00       	push   $0x200
c0003d24:	51                   	push   %ecx
c0003d25:	ff 75 c4             	pushl  -0x3c(%ebp)
c0003d28:	50                   	push   %eax
c0003d29:	e8 04 ed ff ff       	call   c0002a32 <rd_wt>
c0003d2e:	83 c4 20             	add    $0x20,%esp
c0003d31:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
c0003d35:	74 69                	je     c0003da0 <new_dir_entry+0x207>
c0003d37:	8b 45 0c             	mov    0xc(%ebp),%eax
c0003d3a:	8b 10                	mov    (%eax),%edx
c0003d3c:	89 15 c0 31 01 c0    	mov    %edx,0xc00131c0
c0003d42:	8b 50 04             	mov    0x4(%eax),%edx
c0003d45:	89 15 c4 31 01 c0    	mov    %edx,0xc00131c4
c0003d4b:	8b 50 08             	mov    0x8(%eax),%edx
c0003d4e:	89 15 c8 31 01 c0    	mov    %edx,0xc00131c8
c0003d54:	8b 50 0c             	mov    0xc(%eax),%edx
c0003d57:	89 15 cc 31 01 c0    	mov    %edx,0xc00131cc
c0003d5d:	8b 50 10             	mov    0x10(%eax),%edx
c0003d60:	89 15 d0 31 01 c0    	mov    %edx,0xc00131d0
c0003d66:	8b 50 14             	mov    0x14(%eax),%edx
c0003d69:	89 15 d4 31 01 c0    	mov    %edx,0xc00131d4
c0003d6f:	8b 50 18             	mov    0x18(%eax),%edx
c0003d72:	89 15 d8 31 01 c0    	mov    %edx,0xc00131d8
c0003d78:	8b 50 1c             	mov    0x1c(%eax),%edx
c0003d7b:	89 15 dc 31 01 c0    	mov    %edx,0xc00131dc
c0003d81:	8b 50 20             	mov    0x20(%eax),%edx
c0003d84:	89 15 e0 31 01 c0    	mov    %edx,0xc00131e0
c0003d8a:	8b 40 24             	mov    0x24(%eax),%eax
c0003d8d:	a3 e4 31 01 c0       	mov    %eax,0xc00131e4
c0003d92:	83 ec 0c             	sub    $0xc,%esp
c0003d95:	ff 75 0c             	pushl  0xc(%ebp)
c0003d98:	e8 76 08 00 00       	call   c0004613 <sync_inode>
c0003d9d:	83 c4 10             	add    $0x10,%esp
c0003da0:	8b 45 08             	mov    0x8(%ebp),%eax
c0003da3:	c9                   	leave  
c0003da4:	c3                   	ret    

c0003da5 <do_unlink>:
c0003da5:	55                   	push   %ebp
c0003da6:	89 e5                	mov    %esp,%ebp
c0003da8:	53                   	push   %ebx
c0003da9:	81 ec a4 00 00 00    	sub    $0xa4,%esp
c0003daf:	83 ec 08             	sub    $0x8,%esp
c0003db2:	ff 75 08             	pushl  0x8(%ebp)
c0003db5:	68 95 aa 00 c0       	push   $0xc000aa95
c0003dba:	e8 10 60 00 00       	call   c0009dcf <strcmp>
c0003dbf:	83 c4 10             	add    $0x10,%esp
c0003dc2:	85 c0                	test   %eax,%eax
c0003dc4:	75 10                	jne    c0003dd6 <do_unlink+0x31>
c0003dc6:	83 ec 0c             	sub    $0xc,%esp
c0003dc9:	68 97 aa 00 c0       	push   $0xc000aa97
c0003dce:	e8 37 54 00 00       	call   c000920a <panic>
c0003dd3:	83 c4 10             	add    $0x10,%esp
c0003dd6:	83 ec 0c             	sub    $0xc,%esp
c0003dd9:	ff 75 08             	pushl  0x8(%ebp)
c0003ddc:	e8 31 f5 ff ff       	call   c0003312 <search_file>
c0003de1:	83 c4 10             	add    $0x10,%esp
c0003de4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003de7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003deb:	75 10                	jne    c0003dfd <do_unlink+0x58>
c0003ded:	83 ec 0c             	sub    $0xc,%esp
c0003df0:	68 b3 aa 00 c0       	push   $0xc000aab3
c0003df5:	e8 10 54 00 00       	call   c000920a <panic>
c0003dfa:	83 c4 10             	add    $0x10,%esp
c0003dfd:	83 ec 08             	sub    $0x8,%esp
c0003e00:	ff 75 d0             	pushl  -0x30(%ebp)
c0003e03:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0003e09:	50                   	push   %eax
c0003e0a:	e8 01 f7 ff ff       	call   c0003510 <get_inode>
c0003e0f:	83 c4 10             	add    $0x10,%esp
c0003e12:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0003e15:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0003e19:	75 10                	jne    c0003e2b <do_unlink+0x86>
c0003e1b:	83 ec 0c             	sub    $0xc,%esp
c0003e1e:	68 b3 aa 00 c0       	push   $0xc000aab3
c0003e23:	e8 e2 53 00 00       	call   c000920a <panic>
c0003e28:	83 c4 10             	add    $0x10,%esp
c0003e2b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003e2e:	85 c0                	test   %eax,%eax
c0003e30:	7e 10                	jle    c0003e42 <do_unlink+0x9d>
c0003e32:	83 ec 0c             	sub    $0xc,%esp
c0003e35:	68 cc aa 00 c0       	push   $0xc000aacc
c0003e3a:	e8 cb 53 00 00       	call   c000920a <panic>
c0003e3f:	83 c4 10             	add    $0x10,%esp
c0003e42:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c0003e48:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0003e4b:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003e4e:	8d 50 07             	lea    0x7(%eax),%edx
c0003e51:	85 c0                	test   %eax,%eax
c0003e53:	0f 48 c2             	cmovs  %edx,%eax
c0003e56:	c1 f8 03             	sar    $0x3,%eax
c0003e59:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0003e5c:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003e5f:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003e65:	85 c0                	test   %eax,%eax
c0003e67:	0f 48 c2             	cmovs  %edx,%eax
c0003e6a:	c1 f8 09             	sar    $0x9,%eax
c0003e6d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0003e70:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0003e73:	99                   	cltd   
c0003e74:	c1 ea 1d             	shr    $0x1d,%edx
c0003e77:	01 d0                	add    %edx,%eax
c0003e79:	83 e0 07             	and    $0x7,%eax
c0003e7c:	29 d0                	sub    %edx,%eax
c0003e7e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0003e81:	c7 45 b8 20 00 00 00 	movl   $0x20,-0x48(%ebp)
c0003e88:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003e8d:	89 c2                	mov    %eax,%edx
c0003e8f:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003e92:	83 c0 02             	add    $0x2,%eax
c0003e95:	83 ec 0c             	sub    $0xc,%esp
c0003e98:	6a 07                	push   $0x7
c0003e9a:	68 00 02 00 00       	push   $0x200
c0003e9f:	52                   	push   %edx
c0003ea0:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ea3:	50                   	push   %eax
c0003ea4:	e8 89 eb ff ff       	call   c0002a32 <rd_wt>
c0003ea9:	83 c4 20             	add    $0x20,%esp
c0003eac:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003eb2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003eb5:	01 d0                	add    %edx,%eax
c0003eb7:	0f b6 10             	movzbl (%eax),%edx
c0003eba:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0003ebd:	bb 01 00 00 00       	mov    $0x1,%ebx
c0003ec2:	89 c1                	mov    %eax,%ecx
c0003ec4:	d3 e3                	shl    %cl,%ebx
c0003ec6:	89 d8                	mov    %ebx,%eax
c0003ec8:	f7 d0                	not    %eax
c0003eca:	89 c3                	mov    %eax,%ebx
c0003ecc:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003ed2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0003ed5:	01 c8                	add    %ecx,%eax
c0003ed7:	21 da                	and    %ebx,%edx
c0003ed9:	88 10                	mov    %dl,(%eax)
c0003edb:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003ee0:	89 c2                	mov    %eax,%edx
c0003ee2:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0003ee5:	83 c0 02             	add    $0x2,%eax
c0003ee8:	83 ec 0c             	sub    $0xc,%esp
c0003eeb:	6a 0a                	push   $0xa
c0003eed:	68 00 02 00 00       	push   $0x200
c0003ef2:	52                   	push   %edx
c0003ef3:	ff 75 b8             	pushl  -0x48(%ebp)
c0003ef6:	50                   	push   %eax
c0003ef7:	e8 36 eb ff ff       	call   c0002a32 <rd_wt>
c0003efc:	83 c4 20             	add    $0x20,%esp
c0003eff:	e8 f3 08 00 00       	call   c00047f7 <get_super_block>
c0003f04:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0003f07:	8b 95 6c ff ff ff    	mov    -0x94(%ebp),%edx
c0003f0d:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003f10:	8b 00                	mov    (%eax),%eax
c0003f12:	29 c2                	sub    %eax,%edx
c0003f14:	89 d0                	mov    %edx,%eax
c0003f16:	83 c0 01             	add    $0x1,%eax
c0003f19:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0003f1c:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003f1f:	8d 50 07             	lea    0x7(%eax),%edx
c0003f22:	85 c0                	test   %eax,%eax
c0003f24:	0f 48 c2             	cmovs  %edx,%eax
c0003f27:	c1 f8 03             	sar    $0x3,%eax
c0003f2a:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0003f2d:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003f30:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c0003f36:	85 c0                	test   %eax,%eax
c0003f38:	0f 48 c2             	cmovs  %edx,%eax
c0003f3b:	c1 f8 09             	sar    $0x9,%eax
c0003f3e:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0003f41:	8b 45 b0             	mov    -0x50(%ebp),%eax
c0003f44:	99                   	cltd   
c0003f45:	c1 ea 1d             	shr    $0x1d,%edx
c0003f48:	01 d0                	add    %edx,%eax
c0003f4a:	83 e0 07             	and    $0x7,%eax
c0003f4d:	29 d0                	sub    %edx,%eax
c0003f4f:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0003f52:	b8 08 00 00 00       	mov    $0x8,%eax
c0003f57:	2b 45 a4             	sub    -0x5c(%ebp),%eax
c0003f5a:	8b 55 b0             	mov    -0x50(%ebp),%edx
c0003f5d:	29 c2                	sub    %eax,%edx
c0003f5f:	89 d0                	mov    %edx,%eax
c0003f61:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0003f64:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003f67:	8d 50 07             	lea    0x7(%eax),%edx
c0003f6a:	85 c0                	test   %eax,%eax
c0003f6c:	0f 48 c2             	cmovs  %edx,%eax
c0003f6f:	c1 f8 03             	sar    $0x3,%eax
c0003f72:	89 45 a0             	mov    %eax,-0x60(%ebp)
c0003f75:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003f7a:	89 c1                	mov    %eax,%ecx
c0003f7c:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0003f7f:	8b 40 04             	mov    0x4(%eax),%eax
c0003f82:	8d 50 02             	lea    0x2(%eax),%edx
c0003f85:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003f88:	01 d0                	add    %edx,%eax
c0003f8a:	83 ec 0c             	sub    $0xc,%esp
c0003f8d:	6a 07                	push   $0x7
c0003f8f:	68 00 02 00 00       	push   $0x200
c0003f94:	51                   	push   %ecx
c0003f95:	ff 75 b8             	pushl  -0x48(%ebp)
c0003f98:	50                   	push   %eax
c0003f99:	e8 94 ea ff ff       	call   c0002a32 <rd_wt>
c0003f9e:	83 c4 20             	add    $0x20,%esp
c0003fa1:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c0003fa7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003faa:	01 d0                	add    %edx,%eax
c0003fac:	0f b6 10             	movzbl (%eax),%edx
c0003faf:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0003fb2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c0003fb7:	89 c1                	mov    %eax,%ecx
c0003fb9:	d3 e3                	shl    %cl,%ebx
c0003fbb:	89 d8                	mov    %ebx,%eax
c0003fbd:	f7 d0                	not    %eax
c0003fbf:	89 c3                	mov    %eax,%ebx
c0003fc1:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c0003fc7:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0003fca:	01 c8                	add    %ecx,%eax
c0003fcc:	21 da                	and    %ebx,%edx
c0003fce:	88 10                	mov    %dl,(%eax)
c0003fd0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0003fd7:	8b 45 a8             	mov    -0x58(%ebp),%eax
c0003fda:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0003fdd:	eb 6b                	jmp    c000404a <do_unlink+0x2a5>
c0003fdf:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0003fe6:	75 4c                	jne    c0004034 <do_unlink+0x28f>
c0003fe8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0003fef:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0003ff4:	83 ec 0c             	sub    $0xc,%esp
c0003ff7:	6a 0a                	push   $0xa
c0003ff9:	68 00 02 00 00       	push   $0x200
c0003ffe:	50                   	push   %eax
c0003fff:	ff 75 b8             	pushl  -0x48(%ebp)
c0004002:	ff 75 ec             	pushl  -0x14(%ebp)
c0004005:	e8 28 ea ff ff       	call   c0002a32 <rd_wt>
c000400a:	83 c4 20             	add    $0x20,%esp
c000400d:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004012:	89 c1                	mov    %eax,%ecx
c0004014:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004017:	8d 50 01             	lea    0x1(%eax),%edx
c000401a:	89 55 ec             	mov    %edx,-0x14(%ebp)
c000401d:	83 ec 0c             	sub    $0xc,%esp
c0004020:	6a 07                	push   $0x7
c0004022:	68 00 02 00 00       	push   $0x200
c0004027:	51                   	push   %ecx
c0004028:	ff 75 b8             	pushl  -0x48(%ebp)
c000402b:	50                   	push   %eax
c000402c:	e8 01 ea ff ff       	call   c0002a32 <rd_wt>
c0004031:	83 c4 20             	add    $0x20,%esp
c0004034:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000403a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000403d:	01 d0                	add    %edx,%eax
c000403f:	c6 00 00             	movb   $0x0,(%eax)
c0004042:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0004046:	83 6d f4 08          	subl   $0x8,-0xc(%ebp)
c000404a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000404d:	3b 45 a0             	cmp    -0x60(%ebp),%eax
c0004050:	7c 8d                	jl     c0003fdf <do_unlink+0x23a>
c0004052:	81 7d f0 00 02 00 00 	cmpl   $0x200,-0x10(%ebp)
c0004059:	75 4c                	jne    c00040a7 <do_unlink+0x302>
c000405b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0004062:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004067:	83 ec 0c             	sub    $0xc,%esp
c000406a:	6a 0a                	push   $0xa
c000406c:	68 00 02 00 00       	push   $0x200
c0004071:	50                   	push   %eax
c0004072:	ff 75 b8             	pushl  -0x48(%ebp)
c0004075:	ff 75 ec             	pushl  -0x14(%ebp)
c0004078:	e8 b5 e9 ff ff       	call   c0002a32 <rd_wt>
c000407d:	83 c4 20             	add    $0x20,%esp
c0004080:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004085:	89 c1                	mov    %eax,%ecx
c0004087:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000408a:	8d 50 01             	lea    0x1(%eax),%edx
c000408d:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004090:	83 ec 0c             	sub    $0xc,%esp
c0004093:	6a 07                	push   $0x7
c0004095:	68 00 02 00 00       	push   $0x200
c000409a:	51                   	push   %ecx
c000409b:	ff 75 b8             	pushl  -0x48(%ebp)
c000409e:	50                   	push   %eax
c000409f:	e8 8e e9 ff ff       	call   c0002a32 <rd_wt>
c00040a4:	83 c4 20             	add    $0x20,%esp
c00040a7:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c00040ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00040b0:	01 d0                	add    %edx,%eax
c00040b2:	0f b6 10             	movzbl (%eax),%edx
c00040b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00040b8:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
c00040bd:	89 c1                	mov    %eax,%ecx
c00040bf:	d3 e3                	shl    %cl,%ebx
c00040c1:	89 d8                	mov    %ebx,%eax
c00040c3:	89 c3                	mov    %eax,%ebx
c00040c5:	8b 0d a4 31 01 c0    	mov    0xc00131a4,%ecx
c00040cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00040ce:	01 c8                	add    %ecx,%eax
c00040d0:	21 da                	and    %ebx,%edx
c00040d2:	88 10                	mov    %dl,(%eax)
c00040d4:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c00040d9:	83 ec 0c             	sub    $0xc,%esp
c00040dc:	6a 0a                	push   $0xa
c00040de:	68 00 02 00 00       	push   $0x200
c00040e3:	50                   	push   %eax
c00040e4:	ff 75 b8             	pushl  -0x48(%ebp)
c00040e7:	ff 75 ec             	pushl  -0x14(%ebp)
c00040ea:	e8 43 e9 ff ff       	call   c0002a32 <rd_wt>
c00040ef:	83 c4 20             	add    $0x20,%esp
c00040f2:	c7 85 6c ff ff ff 00 	movl   $0x0,-0x94(%ebp)
c00040f9:	00 00 00 
c00040fc:	c7 85 68 ff ff ff 00 	movl   $0x0,-0x98(%ebp)
c0004103:	00 00 00 
c0004106:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%ebp)
c000410d:	00 00 00 
c0004110:	83 ec 0c             	sub    $0xc,%esp
c0004113:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c0004119:	50                   	push   %eax
c000411a:	e8 f4 04 00 00       	call   c0004613 <sync_inode>
c000411f:	83 c4 10             	add    $0x10,%esp
c0004122:	83 ec 0c             	sub    $0xc,%esp
c0004125:	8d 85 64 ff ff ff    	lea    -0x9c(%ebp),%eax
c000412b:	50                   	push   %eax
c000412c:	e8 36 06 00 00       	call   c0004767 <put_inode>
c0004131:	83 c4 10             	add    $0x10,%esp
c0004134:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0004137:	8b 00                	mov    (%eax),%eax
c0004139:	89 45 9c             	mov    %eax,-0x64(%ebp)
c000413c:	c7 45 98 c0 31 01 c0 	movl   $0xc00131c0,-0x68(%ebp)
c0004143:	8b 45 98             	mov    -0x68(%ebp),%eax
c0004146:	8b 40 04             	mov    0x4(%eax),%eax
c0004149:	89 45 94             	mov    %eax,-0x6c(%ebp)
c000414c:	8b 45 98             	mov    -0x68(%ebp),%eax
c000414f:	8b 40 0c             	mov    0xc(%eax),%eax
c0004152:	89 45 90             	mov    %eax,-0x70(%ebp)
c0004155:	8b 45 94             	mov    -0x6c(%ebp),%eax
c0004158:	c1 e8 04             	shr    $0x4,%eax
c000415b:	89 45 8c             	mov    %eax,-0x74(%ebp)
c000415e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0004165:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000416c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0004173:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000417a:	e9 a5 00 00 00       	jmp    c0004224 <do_unlink+0x47f>
c000417f:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004184:	89 c1                	mov    %eax,%ecx
c0004186:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0004189:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000418c:	01 d0                	add    %edx,%eax
c000418e:	83 ec 0c             	sub    $0xc,%esp
c0004191:	6a 07                	push   $0x7
c0004193:	68 00 02 00 00       	push   $0x200
c0004198:	51                   	push   %ecx
c0004199:	ff 75 b8             	pushl  -0x48(%ebp)
c000419c:	50                   	push   %eax
c000419d:	e8 90 e8 ff ff       	call   c0002a32 <rd_wt>
c00041a2:	83 c4 20             	add    $0x20,%esp
c00041a5:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c00041aa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00041ad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c00041b4:	eb 51                	jmp    c0004207 <do_unlink+0x462>
c00041b6:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00041ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00041bd:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c00041c0:	7f 4f                	jg     c0004211 <do_unlink+0x46c>
c00041c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00041c5:	83 c0 10             	add    $0x10,%eax
c00041c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00041cb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00041ce:	83 c0 04             	add    $0x4,%eax
c00041d1:	83 ec 08             	sub    $0x8,%esp
c00041d4:	ff 75 08             	pushl  0x8(%ebp)
c00041d7:	50                   	push   %eax
c00041d8:	e8 f2 5b 00 00       	call   c0009dcf <strcmp>
c00041dd:	83 c4 10             	add    $0x10,%esp
c00041e0:	85 c0                	test   %eax,%eax
c00041e2:	75 1b                	jne    c00041ff <do_unlink+0x45a>
c00041e4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c00041eb:	83 ec 04             	sub    $0x4,%esp
c00041ee:	6a 10                	push   $0x10
c00041f0:	6a 00                	push   $0x0
c00041f2:	ff 75 d4             	pushl  -0x2c(%ebp)
c00041f5:	e8 78 71 00 00       	call   c000b372 <Memset>
c00041fa:	83 c4 10             	add    $0x10,%esp
c00041fd:	eb 13                	jmp    c0004212 <do_unlink+0x46d>
c00041ff:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
c0004203:	83 45 d4 10          	addl   $0x10,-0x2c(%ebp)
c0004207:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000420a:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000420d:	7c a7                	jl     c00041b6 <do_unlink+0x411>
c000420f:	eb 01                	jmp    c0004212 <do_unlink+0x46d>
c0004211:	90                   	nop
c0004212:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004215:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004218:	7f 16                	jg     c0004230 <do_unlink+0x48b>
c000421a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c000421e:	75 10                	jne    c0004230 <do_unlink+0x48b>
c0004220:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
c0004224:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0004227:	3b 45 90             	cmp    -0x70(%ebp),%eax
c000422a:	0f 8c 4f ff ff ff    	jl     c000417f <do_unlink+0x3da>
c0004230:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004233:	3b 45 8c             	cmp    -0x74(%ebp),%eax
c0004236:	75 17                	jne    c000424f <do_unlink+0x4aa>
c0004238:	8b 45 98             	mov    -0x68(%ebp),%eax
c000423b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000423e:	89 50 04             	mov    %edx,0x4(%eax)
c0004241:	83 ec 0c             	sub    $0xc,%esp
c0004244:	ff 75 98             	pushl  -0x68(%ebp)
c0004247:	e8 c7 03 00 00       	call   c0004613 <sync_inode>
c000424c:	83 c4 10             	add    $0x10,%esp
c000424f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004253:	74 26                	je     c000427b <do_unlink+0x4d6>
c0004255:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000425a:	89 c1                	mov    %eax,%ecx
c000425c:	8b 55 9c             	mov    -0x64(%ebp),%edx
c000425f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004262:	01 d0                	add    %edx,%eax
c0004264:	83 ec 0c             	sub    $0xc,%esp
c0004267:	6a 0a                	push   $0xa
c0004269:	68 00 02 00 00       	push   $0x200
c000426e:	51                   	push   %ecx
c000426f:	ff 75 b8             	pushl  -0x48(%ebp)
c0004272:	50                   	push   %eax
c0004273:	e8 ba e7 ff ff       	call   c0002a32 <rd_wt>
c0004278:	83 c4 20             	add    $0x20,%esp
c000427b:	90                   	nop
c000427c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000427f:	c9                   	leave  
c0004280:	c3                   	ret    

c0004281 <do_rdwt>:
c0004281:	55                   	push   %ebp
c0004282:	89 e5                	mov    %esp,%ebp
c0004284:	81 ec 98 00 00 00    	sub    $0x98,%esp
c000428a:	8b 45 08             	mov    0x8(%ebp),%eax
c000428d:	8b 40 68             	mov    0x68(%eax),%eax
c0004290:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004293:	8b 45 08             	mov    0x8(%ebp),%eax
c0004296:	8b 40 50             	mov    0x50(%eax),%eax
c0004299:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000429c:	8b 45 08             	mov    0x8(%ebp),%eax
c000429f:	8b 40 5c             	mov    0x5c(%eax),%eax
c00042a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00042a5:	8b 45 08             	mov    0x8(%ebp),%eax
c00042a8:	8b 00                	mov    (%eax),%eax
c00042aa:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00042ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00042b0:	8b 40 10             	mov    0x10(%eax),%eax
c00042b3:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00042b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00042b9:	8b 40 40             	mov    0x40(%eax),%eax
c00042bc:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00042bf:	83 ec 0c             	sub    $0xc,%esp
c00042c2:	ff 75 cc             	pushl  -0x34(%ebp)
c00042c5:	e8 5d 07 00 00       	call   c0004a27 <pid2proc>
c00042ca:	83 c4 10             	add    $0x10,%esp
c00042cd:	89 45 c0             	mov    %eax,-0x40(%ebp)
c00042d0:	8b 45 c0             	mov    -0x40(%ebp),%eax
c00042d3:	8b 55 c4             	mov    -0x3c(%ebp),%edx
c00042d6:	83 c2 50             	add    $0x50,%edx
c00042d9:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00042dd:	89 45 bc             	mov    %eax,-0x44(%ebp)
c00042e0:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00042e3:	8b 40 08             	mov    0x8(%eax),%eax
c00042e6:	89 45 b8             	mov    %eax,-0x48(%ebp)
c00042e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00042ec:	8b 00                	mov    (%eax),%eax
c00042ee:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00042f1:	83 ec 08             	sub    $0x8,%esp
c00042f4:	ff 75 b8             	pushl  -0x48(%ebp)
c00042f7:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c00042fd:	50                   	push   %eax
c00042fe:	e8 0d f2 ff ff       	call   c0003510 <get_inode>
c0004303:	83 c4 10             	add    $0x10,%esp
c0004306:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0004309:	83 7d b0 00          	cmpl   $0x0,-0x50(%ebp)
c000430d:	75 10                	jne    c000431f <do_rdwt+0x9e>
c000430f:	83 ec 0c             	sub    $0xc,%esp
c0004312:	68 04 ab 00 c0       	push   $0xc000ab04
c0004317:	e8 ee 4e 00 00       	call   c000920a <panic>
c000431c:	83 c4 10             	add    $0x10,%esp
c000431f:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c0004325:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0004328:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000432b:	8b 40 04             	mov    0x4(%eax),%eax
c000432e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004331:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c0004335:	74 22                	je     c0004359 <do_rdwt+0xd8>
c0004337:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000433b:	74 1c                	je     c0004359 <do_rdwt+0xd8>
c000433d:	68 9e 04 00 00       	push   $0x49e
c0004342:	68 70 a9 00 c0       	push   $0xc000a970
c0004347:	68 70 a9 00 c0       	push   $0xc000a970
c000434c:	68 14 ab 00 c0       	push   $0xc000ab14
c0004351:	e8 d2 4e 00 00       	call   c0009228 <assertion_failure>
c0004356:	83 c4 10             	add    $0x10,%esp
c0004359:	8b 85 68 ff ff ff    	mov    -0x98(%ebp),%eax
c000435f:	83 f8 01             	cmp    $0x1,%eax
c0004362:	0f 85 86 00 00 00    	jne    c00043ee <do_rdwt+0x16d>
c0004368:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c000436c:	75 09                	jne    c0004377 <do_rdwt+0xf6>
c000436e:	c7 45 f0 d2 07 00 00 	movl   $0x7d2,-0x10(%ebp)
c0004375:	eb 0d                	jmp    c0004384 <do_rdwt+0x103>
c0004377:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c000437b:	75 07                	jne    c0004384 <do_rdwt+0x103>
c000437d:	c7 45 f0 d3 07 00 00 	movl   $0x7d3,-0x10(%ebp)
c0004384:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0004387:	8b 45 08             	mov    0x8(%ebp),%eax
c000438a:	89 50 68             	mov    %edx,0x68(%eax)
c000438d:	8b 55 b4             	mov    -0x4c(%ebp),%edx
c0004390:	8b 45 08             	mov    0x8(%ebp),%eax
c0004393:	89 50 58             	mov    %edx,0x58(%eax)
c0004396:	83 ec 04             	sub    $0x4,%esp
c0004399:	6a 02                	push   $0x2
c000439b:	ff 75 08             	pushl  0x8(%ebp)
c000439e:	6a 03                	push   $0x3
c00043a0:	e8 ce 56 00 00       	call   c0009a73 <send_rec>
c00043a5:	83 c4 10             	add    $0x10,%esp
c00043a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00043ab:	8b 40 68             	mov    0x68(%eax),%eax
c00043ae:	83 f8 66             	cmp    $0x66,%eax
c00043b1:	75 13                	jne    c00043c6 <do_rdwt+0x145>
c00043b3:	83 ec 04             	sub    $0x4,%esp
c00043b6:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043b9:	ff 75 08             	pushl  0x8(%ebp)
c00043bc:	6a 01                	push   $0x1
c00043be:	e8 b0 56 00 00       	call   c0009a73 <send_rec>
c00043c3:	83 c4 10             	add    $0x10,%esp
c00043c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00043c9:	8b 40 68             	mov    0x68(%eax),%eax
c00043cc:	83 f8 65             	cmp    $0x65,%eax
c00043cf:	75 13                	jne    c00043e4 <do_rdwt+0x163>
c00043d1:	83 ec 04             	sub    $0x4,%esp
c00043d4:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043d7:	ff 75 08             	pushl  0x8(%ebp)
c00043da:	6a 01                	push   $0x1
c00043dc:	e8 92 56 00 00       	call   c0009a73 <send_rec>
c00043e1:	83 c4 10             	add    $0x10,%esp
c00043e4:	b8 00 00 00 00       	mov    $0x0,%eax
c00043e9:	e9 23 02 00 00       	jmp    c0004611 <do_rdwt+0x390>
c00043ee:	83 7d d8 0a          	cmpl   $0xa,-0x28(%ebp)
c00043f2:	75 18                	jne    c000440c <do_rdwt+0x18b>
c00043f4:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c00043fa:	c1 e0 09             	shl    $0x9,%eax
c00043fd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0004400:	75 0a                	jne    c000440c <do_rdwt+0x18b>
c0004402:	b8 00 00 00 00       	mov    $0x0,%eax
c0004407:	e9 05 02 00 00       	jmp    c0004611 <do_rdwt+0x390>
c000440c:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004410:	75 1b                	jne    c000442d <do_rdwt+0x1ac>
c0004412:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004419:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000441c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000441f:	01 d0                	add    %edx,%eax
c0004421:	39 45 ac             	cmp    %eax,-0x54(%ebp)
c0004424:	0f 4e 45 ac          	cmovle -0x54(%ebp),%eax
c0004428:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000442b:	eb 19                	jmp    c0004446 <do_rdwt+0x1c5>
c000442d:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004430:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0004433:	01 c2                	add    %eax,%edx
c0004435:	8b 85 74 ff ff ff    	mov    -0x8c(%ebp),%eax
c000443b:	c1 e0 09             	shl    $0x9,%eax
c000443e:	39 c2                	cmp    %eax,%edx
c0004440:	0f 4e c2             	cmovle %edx,%eax
c0004443:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004446:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004449:	99                   	cltd   
c000444a:	c1 ea 17             	shr    $0x17,%edx
c000444d:	01 d0                	add    %edx,%eax
c000444f:	25 ff 01 00 00       	and    $0x1ff,%eax
c0004454:	29 d0                	sub    %edx,%eax
c0004456:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004459:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000445f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004462:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004468:	85 c0                	test   %eax,%eax
c000446a:	0f 48 c1             	cmovs  %ecx,%eax
c000446d:	c1 f8 09             	sar    $0x9,%eax
c0004470:	01 d0                	add    %edx,%eax
c0004472:	89 45 a8             	mov    %eax,-0x58(%ebp)
c0004475:	8b 95 70 ff ff ff    	mov    -0x90(%ebp),%edx
c000447b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000447e:	8d 88 ff 01 00 00    	lea    0x1ff(%eax),%ecx
c0004484:	85 c0                	test   %eax,%eax
c0004486:	0f 48 c1             	cmovs  %ecx,%eax
c0004489:	c1 f8 09             	sar    $0x9,%eax
c000448c:	01 d0                	add    %edx,%eax
c000448e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
c0004491:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c0004494:	2b 45 a8             	sub    -0x58(%ebp),%eax
c0004497:	ba 00 00 10 00       	mov    $0x100000,%edx
c000449c:	39 d0                	cmp    %edx,%eax
c000449e:	7d 0b                	jge    c00044ab <do_rdwt+0x22a>
c00044a0:	8b 45 a4             	mov    -0x5c(%ebp),%eax
c00044a3:	2b 45 a8             	sub    -0x58(%ebp),%eax
c00044a6:	83 c0 01             	add    $0x1,%eax
c00044a9:	eb 05                	jmp    c00044b0 <do_rdwt+0x22f>
c00044ab:	b8 00 00 10 00       	mov    $0x100000,%eax
c00044b0:	89 45 a0             	mov    %eax,-0x60(%ebp)
c00044b3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00044b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00044c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00044c3:	8b 00                	mov    (%eax),%eax
c00044c5:	83 ec 0c             	sub    $0xc,%esp
c00044c8:	50                   	push   %eax
c00044c9:	e8 59 05 00 00       	call   c0004a27 <pid2proc>
c00044ce:	83 c4 10             	add    $0x10,%esp
c00044d1:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00044d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044d7:	83 ec 08             	sub    $0x8,%esp
c00044da:	50                   	push   %eax
c00044db:	ff 75 c8             	pushl  -0x38(%ebp)
c00044de:	e8 b5 28 00 00       	call   c0006d98 <alloc_virtual_memory>
c00044e3:	83 c4 10             	add    $0x10,%esp
c00044e6:	89 45 98             	mov    %eax,-0x68(%ebp)
c00044e9:	8b 45 a8             	mov    -0x58(%ebp),%eax
c00044ec:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00044ef:	e9 c5 00 00 00       	jmp    c00045b9 <do_rdwt+0x338>
c00044f4:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00044f7:	c1 e0 09             	shl    $0x9,%eax
c00044fa:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00044fd:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
c0004500:	0f 4e 45 e4          	cmovle -0x1c(%ebp),%eax
c0004504:	89 45 94             	mov    %eax,-0x6c(%ebp)
c0004507:	c7 45 90 20 00 00 00 	movl   $0x20,-0x70(%ebp)
c000450e:	83 7d d8 07          	cmpl   $0x7,-0x28(%ebp)
c0004512:	75 46                	jne    c000455a <do_rdwt+0x2d9>
c0004514:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004517:	c1 e0 09             	shl    $0x9,%eax
c000451a:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c0004520:	83 ec 0c             	sub    $0xc,%esp
c0004523:	6a 07                	push   $0x7
c0004525:	50                   	push   %eax
c0004526:	52                   	push   %edx
c0004527:	ff 75 90             	pushl  -0x70(%ebp)
c000452a:	ff 75 dc             	pushl  -0x24(%ebp)
c000452d:	e8 00 e5 ff ff       	call   c0002a32 <rd_wt>
c0004532:	83 c4 20             	add    $0x20,%esp
c0004535:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000453b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000453e:	01 d0                	add    %edx,%eax
c0004540:	8b 4d 98             	mov    -0x68(%ebp),%ecx
c0004543:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0004546:	01 ca                	add    %ecx,%edx
c0004548:	83 ec 04             	sub    $0x4,%esp
c000454b:	ff 75 94             	pushl  -0x6c(%ebp)
c000454e:	50                   	push   %eax
c000454f:	52                   	push   %edx
c0004550:	e8 ef 6d 00 00       	call   c000b344 <Memcpy>
c0004555:	83 c4 10             	add    $0x10,%esp
c0004558:	eb 46                	jmp    c00045a0 <do_rdwt+0x31f>
c000455a:	8b 55 98             	mov    -0x68(%ebp),%edx
c000455d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004560:	01 d0                	add    %edx,%eax
c0004562:	89 c1                	mov    %eax,%ecx
c0004564:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000456a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000456d:	01 d0                	add    %edx,%eax
c000456f:	83 ec 04             	sub    $0x4,%esp
c0004572:	ff 75 94             	pushl  -0x6c(%ebp)
c0004575:	51                   	push   %ecx
c0004576:	50                   	push   %eax
c0004577:	e8 c8 6d 00 00       	call   c000b344 <Memcpy>
c000457c:	83 c4 10             	add    $0x10,%esp
c000457f:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0004582:	c1 e0 09             	shl    $0x9,%eax
c0004585:	8b 15 84 27 01 c0    	mov    0xc0012784,%edx
c000458b:	83 ec 0c             	sub    $0xc,%esp
c000458e:	6a 0a                	push   $0xa
c0004590:	50                   	push   %eax
c0004591:	52                   	push   %edx
c0004592:	ff 75 90             	pushl  -0x70(%ebp)
c0004595:	ff 75 dc             	pushl  -0x24(%ebp)
c0004598:	e8 95 e4 ff ff       	call   c0002a32 <rd_wt>
c000459d:	83 c4 20             	add    $0x20,%esp
c00045a0:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00045a3:	29 45 e4             	sub    %eax,-0x1c(%ebp)
c00045a6:	8b 45 94             	mov    -0x6c(%ebp),%eax
c00045a9:	01 45 e0             	add    %eax,-0x20(%ebp)
c00045ac:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00045b3:	8b 45 a0             	mov    -0x60(%ebp),%eax
c00045b6:	01 45 dc             	add    %eax,-0x24(%ebp)
c00045b9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00045bc:	3b 45 a4             	cmp    -0x5c(%ebp),%eax
c00045bf:	7f 0a                	jg     c00045cb <do_rdwt+0x34a>
c00045c1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c00045c5:	0f 85 29 ff ff ff    	jne    c00044f4 <do_rdwt+0x273>
c00045cb:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00045ce:	8b 50 04             	mov    0x4(%eax),%edx
c00045d1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045d4:	01 c2                	add    %eax,%edx
c00045d6:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00045d9:	89 50 04             	mov    %edx,0x4(%eax)
c00045dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045df:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045e2:	01 c2                	add    %eax,%edx
c00045e4:	8b 85 6c ff ff ff    	mov    -0x94(%ebp),%eax
c00045ea:	39 c2                	cmp    %eax,%edx
c00045ec:	7e 20                	jle    c000460e <do_rdwt+0x38d>
c00045ee:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00045f1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00045f4:	01 d0                	add    %edx,%eax
c00045f6:	89 85 6c ff ff ff    	mov    %eax,-0x94(%ebp)
c00045fc:	83 ec 0c             	sub    $0xc,%esp
c00045ff:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
c0004605:	50                   	push   %eax
c0004606:	e8 08 00 00 00       	call   c0004613 <sync_inode>
c000460b:	83 c4 10             	add    $0x10,%esp
c000460e:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004611:	c9                   	leave  
c0004612:	c3                   	ret    

c0004613 <sync_inode>:
c0004613:	55                   	push   %ebp
c0004614:	89 e5                	mov    %esp,%ebp
c0004616:	53                   	push   %ebx
c0004617:	83 ec 34             	sub    $0x34,%esp
c000461a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004621:	eb 74                	jmp    c0004697 <sync_inode+0x84>
c0004623:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004626:	89 d0                	mov    %edx,%eax
c0004628:	c1 e0 02             	shl    $0x2,%eax
c000462b:	01 d0                	add    %edx,%eax
c000462d:	c1 e0 03             	shl    $0x3,%eax
c0004630:	05 b0 27 01 c0       	add    $0xc00127b0,%eax
c0004635:	8b 10                	mov    (%eax),%edx
c0004637:	8b 45 08             	mov    0x8(%ebp),%eax
c000463a:	8b 40 10             	mov    0x10(%eax),%eax
c000463d:	39 c2                	cmp    %eax,%edx
c000463f:	75 52                	jne    c0004693 <sync_inode+0x80>
c0004641:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0004644:	89 d0                	mov    %edx,%eax
c0004646:	c1 e0 02             	shl    $0x2,%eax
c0004649:	01 d0                	add    %edx,%eax
c000464b:	c1 e0 03             	shl    $0x3,%eax
c000464e:	8d 90 a0 27 01 c0    	lea    -0x3ffed860(%eax),%edx
c0004654:	8b 45 08             	mov    0x8(%ebp),%eax
c0004657:	8b 08                	mov    (%eax),%ecx
c0004659:	89 0a                	mov    %ecx,(%edx)
c000465b:	8b 48 04             	mov    0x4(%eax),%ecx
c000465e:	89 4a 04             	mov    %ecx,0x4(%edx)
c0004661:	8b 48 08             	mov    0x8(%eax),%ecx
c0004664:	89 4a 08             	mov    %ecx,0x8(%edx)
c0004667:	8b 48 0c             	mov    0xc(%eax),%ecx
c000466a:	89 4a 0c             	mov    %ecx,0xc(%edx)
c000466d:	8b 48 10             	mov    0x10(%eax),%ecx
c0004670:	89 4a 10             	mov    %ecx,0x10(%edx)
c0004673:	8b 48 14             	mov    0x14(%eax),%ecx
c0004676:	89 4a 14             	mov    %ecx,0x14(%edx)
c0004679:	8b 48 18             	mov    0x18(%eax),%ecx
c000467c:	89 4a 18             	mov    %ecx,0x18(%edx)
c000467f:	8b 48 1c             	mov    0x1c(%eax),%ecx
c0004682:	89 4a 1c             	mov    %ecx,0x1c(%edx)
c0004685:	8b 48 20             	mov    0x20(%eax),%ecx
c0004688:	89 4a 20             	mov    %ecx,0x20(%edx)
c000468b:	8b 40 24             	mov    0x24(%eax),%eax
c000468e:	89 42 24             	mov    %eax,0x24(%edx)
c0004691:	eb 0a                	jmp    c000469d <sync_inode+0x8a>
c0004693:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004697:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
c000469b:	7e 86                	jle    c0004623 <sync_inode+0x10>
c000469d:	c7 45 f0 20 00 00 00 	movl   $0x20,-0x10(%ebp)
c00046a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00046a7:	8b 40 10             	mov    0x10(%eax),%eax
c00046aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00046ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046b0:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00046b3:	b8 00 02 00 00       	mov    $0x200,%eax
c00046b8:	99                   	cltd   
c00046b9:	f7 7d f0             	idivl  -0x10(%ebp)
c00046bc:	89 c3                	mov    %eax,%ebx
c00046be:	89 c8                	mov    %ecx,%eax
c00046c0:	99                   	cltd   
c00046c1:	f7 fb                	idiv   %ebx
c00046c3:	89 55 e8             	mov    %edx,-0x18(%ebp)
c00046c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00046c9:	8d 48 ff             	lea    -0x1(%eax),%ecx
c00046cc:	b8 00 02 00 00       	mov    $0x200,%eax
c00046d1:	99                   	cltd   
c00046d2:	f7 7d f0             	idivl  -0x10(%ebp)
c00046d5:	89 c3                	mov    %eax,%ebx
c00046d7:	89 c8                	mov    %ecx,%eax
c00046d9:	99                   	cltd   
c00046da:	f7 fb                	idiv   %ebx
c00046dc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00046df:	8b 45 08             	mov    0x8(%ebp),%eax
c00046e2:	8b 40 20             	mov    0x20(%eax),%eax
c00046e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00046e8:	e8 0a 01 00 00       	call   c00047f7 <get_super_block>
c00046ed:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00046f0:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00046f3:	8b 40 04             	mov    0x4(%eax),%eax
c00046f6:	8d 50 02             	lea    0x2(%eax),%edx
c00046f9:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00046fc:	8b 40 08             	mov    0x8(%eax),%eax
c00046ff:	01 c2                	add    %eax,%edx
c0004701:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004704:	01 d0                	add    %edx,%eax
c0004706:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0004709:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c000470e:	83 ec 0c             	sub    $0xc,%esp
c0004711:	6a 07                	push   $0x7
c0004713:	68 00 02 00 00       	push   $0x200
c0004718:	50                   	push   %eax
c0004719:	ff 75 e0             	pushl  -0x20(%ebp)
c000471c:	ff 75 d8             	pushl  -0x28(%ebp)
c000471f:	e8 0e e3 ff ff       	call   c0002a32 <rd_wt>
c0004724:	83 c4 20             	add    $0x20,%esp
c0004727:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c000472c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000472f:	83 ec 04             	sub    $0x4,%esp
c0004732:	ff 75 f0             	pushl  -0x10(%ebp)
c0004735:	ff 75 08             	pushl  0x8(%ebp)
c0004738:	ff 75 d4             	pushl  -0x2c(%ebp)
c000473b:	e8 04 6c 00 00       	call   c000b344 <Memcpy>
c0004740:	83 c4 10             	add    $0x10,%esp
c0004743:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004748:	83 ec 0c             	sub    $0xc,%esp
c000474b:	6a 0a                	push   $0xa
c000474d:	68 00 02 00 00       	push   $0x200
c0004752:	50                   	push   %eax
c0004753:	ff 75 e0             	pushl  -0x20(%ebp)
c0004756:	ff 75 d8             	pushl  -0x28(%ebp)
c0004759:	e8 d4 e2 ff ff       	call   c0002a32 <rd_wt>
c000475e:	83 c4 20             	add    $0x20,%esp
c0004761:	90                   	nop
c0004762:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0004765:	c9                   	leave  
c0004766:	c3                   	ret    

c0004767 <put_inode>:
c0004767:	55                   	push   %ebp
c0004768:	89 e5                	mov    %esp,%ebp
c000476a:	83 ec 08             	sub    $0x8,%esp
c000476d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004770:	8b 40 24             	mov    0x24(%eax),%eax
c0004773:	85 c0                	test   %eax,%eax
c0004775:	7f 1c                	jg     c0004793 <put_inode+0x2c>
c0004777:	68 42 05 00 00       	push   $0x542
c000477c:	68 70 a9 00 c0       	push   $0xc000a970
c0004781:	68 70 a9 00 c0       	push   $0xc000a970
c0004786:	68 48 ab 00 c0       	push   $0xc000ab48
c000478b:	e8 98 4a 00 00       	call   c0009228 <assertion_failure>
c0004790:	83 c4 10             	add    $0x10,%esp
c0004793:	8b 45 08             	mov    0x8(%ebp),%eax
c0004796:	8b 40 24             	mov    0x24(%eax),%eax
c0004799:	8d 50 ff             	lea    -0x1(%eax),%edx
c000479c:	8b 45 08             	mov    0x8(%ebp),%eax
c000479f:	89 50 24             	mov    %edx,0x24(%eax)
c00047a2:	90                   	nop
c00047a3:	c9                   	leave  
c00047a4:	c3                   	ret    

c00047a5 <do_close>:
c00047a5:	55                   	push   %ebp
c00047a6:	89 e5                	mov    %esp,%ebp
c00047a8:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c00047ad:	8b 55 08             	mov    0x8(%ebp),%edx
c00047b0:	83 c2 50             	add    $0x50,%edx
c00047b3:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00047b7:	8b 50 0c             	mov    0xc(%eax),%edx
c00047ba:	83 ea 01             	sub    $0x1,%edx
c00047bd:	89 50 0c             	mov    %edx,0xc(%eax)
c00047c0:	8b 40 0c             	mov    0xc(%eax),%eax
c00047c3:	85 c0                	test   %eax,%eax
c00047c5:	75 16                	jne    c00047dd <do_close+0x38>
c00047c7:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c00047cc:	8b 55 08             	mov    0x8(%ebp),%edx
c00047cf:	83 c2 50             	add    $0x50,%edx
c00047d2:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
c00047d6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c00047dd:	a1 64 fb 00 c0       	mov    0xc000fb64,%eax
c00047e2:	8b 55 08             	mov    0x8(%ebp),%edx
c00047e5:	83 c2 50             	add    $0x50,%edx
c00047e8:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
c00047ef:	00 
c00047f0:	b8 00 00 00 00       	mov    $0x0,%eax
c00047f5:	5d                   	pop    %ebp
c00047f6:	c3                   	ret    

c00047f7 <get_super_block>:
c00047f7:	55                   	push   %ebp
c00047f8:	89 e5                	mov    %esp,%ebp
c00047fa:	83 ec 08             	sub    $0x8,%esp
c00047fd:	a1 84 27 01 c0       	mov    0xc0012784,%eax
c0004802:	83 ec 0c             	sub    $0xc,%esp
c0004805:	6a 07                	push   $0x7
c0004807:	68 00 02 00 00       	push   $0x200
c000480c:	50                   	push   %eax
c000480d:	6a 20                	push   $0x20
c000480f:	6a 01                	push   $0x1
c0004811:	e8 1c e2 ff ff       	call   c0002a32 <rd_wt>
c0004816:	83 c4 20             	add    $0x20,%esp
c0004819:	8b 15 a4 31 01 c0    	mov    0xc00131a4,%edx
c000481f:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0004824:	8b 0a                	mov    (%edx),%ecx
c0004826:	89 08                	mov    %ecx,(%eax)
c0004828:	8b 4a 04             	mov    0x4(%edx),%ecx
c000482b:	89 48 04             	mov    %ecx,0x4(%eax)
c000482e:	8b 4a 08             	mov    0x8(%edx),%ecx
c0004831:	89 48 08             	mov    %ecx,0x8(%eax)
c0004834:	8b 4a 0c             	mov    0xc(%edx),%ecx
c0004837:	89 48 0c             	mov    %ecx,0xc(%eax)
c000483a:	8b 4a 10             	mov    0x10(%edx),%ecx
c000483d:	89 48 10             	mov    %ecx,0x10(%eax)
c0004840:	8b 4a 14             	mov    0x14(%edx),%ecx
c0004843:	89 48 14             	mov    %ecx,0x14(%eax)
c0004846:	8b 4a 18             	mov    0x18(%edx),%ecx
c0004849:	89 48 18             	mov    %ecx,0x18(%eax)
c000484c:	8b 4a 1c             	mov    0x1c(%edx),%ecx
c000484f:	89 48 1c             	mov    %ecx,0x1c(%eax)
c0004852:	8b 52 20             	mov    0x20(%edx),%edx
c0004855:	89 50 20             	mov    %edx,0x20(%eax)
c0004858:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c000485d:	c9                   	leave  
c000485e:	c3                   	ret    

c000485f <check>:
c000485f:	55                   	push   %ebp
c0004860:	89 e5                	mov    %esp,%ebp
c0004862:	83 ec 18             	sub    $0x18,%esp
c0004865:	c7 45 f4 00 33 08 c0 	movl   $0xc0083300,-0xc(%ebp)
c000486c:	eb 59                	jmp    c00048c7 <check+0x68>
c000486e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004871:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0004877:	85 c0                	test   %eax,%eax
c0004879:	74 45                	je     c00048c0 <check+0x61>
c000487b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000487e:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0004884:	83 f8 01             	cmp    $0x1,%eax
c0004887:	74 37                	je     c00048c0 <check+0x61>
c0004889:	c7 05 40 f7 00 c0 02 	movl   $0x2802,0xc000f740
c0004890:	28 00 00 
c0004893:	83 ec 08             	sub    $0x8,%esp
c0004896:	6a 0a                	push   $0xa
c0004898:	68 57 ab 00 c0       	push   $0xc000ab57
c000489d:	e8 25 cd ff ff       	call   c00015c7 <disp_str_colour>
c00048a2:	83 c4 10             	add    $0x10,%esp
c00048a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00048a8:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00048af:	0f be c0             	movsbl %al,%eax
c00048b2:	83 ec 0c             	sub    $0xc,%esp
c00048b5:	50                   	push   %eax
c00048b6:	e8 97 31 00 00       	call   c0007a52 <disp_int>
c00048bb:	83 c4 10             	add    $0x10,%esp
c00048be:	eb fe                	jmp    c00048be <check+0x5f>
c00048c0:	81 45 f4 ac 02 00 00 	addl   $0x2ac,-0xc(%ebp)
c00048c7:	b8 58 38 08 c0       	mov    $0xc0083858,%eax
c00048cc:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00048cf:	72 9d                	jb     c000486e <check+0xf>
c00048d1:	90                   	nop
c00048d2:	c9                   	leave  
c00048d3:	c3                   	ret    

c00048d4 <schedule_process>:
c00048d4:	55                   	push   %ebp
c00048d5:	89 e5                	mov    %esp,%ebp
c00048d7:	83 ec 28             	sub    $0x28,%esp
c00048da:	e8 b5 cf ff ff       	call   c0001894 <get_running_thread_pcb>
c00048df:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00048e2:	83 ec 0c             	sub    $0xc,%esp
c00048e5:	68 8c fd 00 c0       	push   $0xc000fd8c
c00048ea:	e8 d4 5b 00 00       	call   c000a4c3 <isListEmpty>
c00048ef:	83 c4 10             	add    $0x10,%esp
c00048f2:	3c 01                	cmp    $0x1,%al
c00048f4:	75 08                	jne    c00048fe <schedule_process+0x2a>
c00048f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00048f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00048fc:	eb 4d                	jmp    c000494b <schedule_process+0x77>
c00048fe:	83 ec 0c             	sub    $0xc,%esp
c0004901:	68 8c fd 00 c0       	push   $0xc000fd8c
c0004906:	e8 5f 5c 00 00       	call   c000a56a <popFromDoubleLinkList>
c000490b:	83 c4 10             	add    $0x10,%esp
c000490e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004911:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004914:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004919:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000491c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0004920:	74 29                	je     c000494b <schedule_process+0x77>
c0004922:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004925:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004928:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000492b:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0004932:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004935:	05 30 01 00 00       	add    $0x130,%eax
c000493a:	83 ec 08             	sub    $0x8,%esp
c000493d:	68 5d ab 00 c0       	push   $0xc000ab5d
c0004942:	50                   	push   %eax
c0004943:	e8 87 54 00 00       	call   c0009dcf <strcmp>
c0004948:	83 c4 10             	add    $0x10,%esp
c000494b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000494e:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0004955:	84 c0                	test   %al,%al
c0004957:	75 19                	jne    c0004972 <schedule_process+0x9e>
c0004959:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000495c:	05 fc 00 00 00       	add    $0xfc,%eax
c0004961:	83 ec 08             	sub    $0x8,%esp
c0004964:	50                   	push   %eax
c0004965:	68 8c fd 00 c0       	push   $0xc000fd8c
c000496a:	e8 ba 5b 00 00       	call   c000a529 <insertToDoubleLinkList>
c000496f:	83 c4 10             	add    $0x10,%esp
c0004972:	c7 45 e4 00 00 10 00 	movl   $0x100000,-0x1c(%ebp)
c0004979:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000497c:	8b 40 04             	mov    0x4(%eax),%eax
c000497f:	85 c0                	test   %eax,%eax
c0004981:	74 28                	je     c00049ab <schedule_process+0xd7>
c0004983:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004986:	05 00 10 00 00       	add    $0x1000,%eax
c000498b:	83 ec 0c             	sub    $0xc,%esp
c000498e:	50                   	push   %eax
c000498f:	e8 f1 ce ff ff       	call   c0001885 <update_tss>
c0004994:	83 c4 10             	add    $0x10,%esp
c0004997:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000499a:	8b 40 04             	mov    0x4(%eax),%eax
c000499d:	83 ec 0c             	sub    $0xc,%esp
c00049a0:	50                   	push   %eax
c00049a1:	e8 d2 ce ff ff       	call   c0001878 <update_cr3>
c00049a6:	83 c4 10             	add    $0x10,%esp
c00049a9:	eb 0f                	jmp    c00049ba <schedule_process+0xe6>
c00049ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00049ae:	83 ec 0c             	sub    $0xc,%esp
c00049b1:	50                   	push   %eax
c00049b2:	e8 c1 ce ff ff       	call   c0001878 <update_cr3>
c00049b7:	83 c4 10             	add    $0x10,%esp
c00049ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049bd:	a3 60 fb 00 c0       	mov    %eax,0xc000fb60
c00049c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049c5:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00049cb:	83 f8 06             	cmp    $0x6,%eax
c00049ce:	75 1f                	jne    c00049ef <schedule_process+0x11b>
c00049d0:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c00049d7:	00 00 00 
c00049da:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049dd:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00049e3:	83 ec 0c             	sub    $0xc,%esp
c00049e6:	50                   	push   %eax
c00049e7:	e8 66 30 00 00       	call   c0007a52 <disp_int>
c00049ec:	83 c4 10             	add    $0x10,%esp
c00049ef:	83 ec 08             	sub    $0x8,%esp
c00049f2:	ff 75 f4             	pushl  -0xc(%ebp)
c00049f5:	ff 75 f0             	pushl  -0x10(%ebp)
c00049f8:	e8 83 5a 00 00       	call   c000a480 <switch_to>
c00049fd:	83 c4 10             	add    $0x10,%esp
c0004a00:	90                   	nop
c0004a01:	c9                   	leave  
c0004a02:	c3                   	ret    

c0004a03 <clock_handler>:
c0004a03:	55                   	push   %ebp
c0004a04:	89 e5                	mov    %esp,%ebp
c0004a06:	83 ec 08             	sub    $0x8,%esp
c0004a09:	a1 a0 16 01 c0       	mov    0xc00116a0,%eax
c0004a0e:	85 c0                	test   %eax,%eax
c0004a10:	74 0d                	je     c0004a1f <clock_handler+0x1c>
c0004a12:	83 ec 0c             	sub    $0xc,%esp
c0004a15:	6a 02                	push   $0x2
c0004a17:	e8 e6 52 00 00       	call   c0009d02 <inform_int>
c0004a1c:	83 c4 10             	add    $0x10,%esp
c0004a1f:	e8 b0 fe ff ff       	call   c00048d4 <schedule_process>
c0004a24:	90                   	nop
c0004a25:	c9                   	leave  
c0004a26:	c3                   	ret    

c0004a27 <pid2proc>:
c0004a27:	55                   	push   %ebp
c0004a28:	89 e5                	mov    %esp,%ebp
c0004a2a:	83 ec 20             	sub    $0x20,%esp
c0004a2d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0004a34:	a1 d4 1e 01 c0       	mov    0xc0011ed4,%eax
c0004a39:	8b 15 d8 1e 01 c0    	mov    0xc0011ed8,%edx
c0004a3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004a42:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004a45:	a1 dc 1e 01 c0       	mov    0xc0011edc,%eax
c0004a4a:	8b 15 e0 1e 01 c0    	mov    0xc0011ee0,%edx
c0004a50:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004a53:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004a56:	a1 d8 1e 01 c0       	mov    0xc0011ed8,%eax
c0004a5b:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004a5e:	eb 29                	jmp    c0004a89 <pid2proc+0x62>
c0004a60:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a63:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004a68:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a6b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a6e:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c0004a74:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a77:	39 c2                	cmp    %eax,%edx
c0004a79:	75 05                	jne    c0004a80 <pid2proc+0x59>
c0004a7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a7e:	eb 15                	jmp    c0004a95 <pid2proc+0x6e>
c0004a80:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a83:	8b 40 04             	mov    0x4(%eax),%eax
c0004a86:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004a89:	81 7d f8 dc 1e 01 c0 	cmpl   $0xc0011edc,-0x8(%ebp)
c0004a90:	75 ce                	jne    c0004a60 <pid2proc+0x39>
c0004a92:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a95:	c9                   	leave  
c0004a96:	c3                   	ret    

c0004a97 <proc2pid>:
c0004a97:	55                   	push   %ebp
c0004a98:	89 e5                	mov    %esp,%ebp
c0004a9a:	83 ec 10             	sub    $0x10,%esp
c0004a9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004aa0:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c0004aa6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004aa9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004aac:	c9                   	leave  
c0004aad:	c3                   	ret    

c0004aae <InitDescriptor>:
c0004aae:	55                   	push   %ebp
c0004aaf:	89 e5                	mov    %esp,%ebp
c0004ab1:	83 ec 04             	sub    $0x4,%esp
c0004ab4:	8b 45 14             	mov    0x14(%ebp),%eax
c0004ab7:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004abb:	8b 45 10             	mov    0x10(%ebp),%eax
c0004abe:	89 c2                	mov    %eax,%edx
c0004ac0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ac3:	66 89 10             	mov    %dx,(%eax)
c0004ac6:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ac9:	89 c2                	mov    %eax,%edx
c0004acb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ace:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004ad2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ad5:	c1 e8 10             	shr    $0x10,%eax
c0004ad8:	89 c2                	mov    %eax,%edx
c0004ada:	8b 45 08             	mov    0x8(%ebp),%eax
c0004add:	88 50 04             	mov    %dl,0x4(%eax)
c0004ae0:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004ae4:	89 c2                	mov    %eax,%edx
c0004ae6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ae9:	88 50 05             	mov    %dl,0x5(%eax)
c0004aec:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004af0:	66 c1 e8 08          	shr    $0x8,%ax
c0004af4:	c1 e0 04             	shl    $0x4,%eax
c0004af7:	89 c2                	mov    %eax,%edx
c0004af9:	8b 45 10             	mov    0x10(%ebp),%eax
c0004afc:	c1 e8 10             	shr    $0x10,%eax
c0004aff:	83 e0 0f             	and    $0xf,%eax
c0004b02:	09 c2                	or     %eax,%edx
c0004b04:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b07:	88 50 06             	mov    %dl,0x6(%eax)
c0004b0a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b0d:	c1 e8 18             	shr    $0x18,%eax
c0004b10:	89 c2                	mov    %eax,%edx
c0004b12:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b15:	88 50 07             	mov    %dl,0x7(%eax)
c0004b18:	90                   	nop
c0004b19:	c9                   	leave  
c0004b1a:	c3                   	ret    

c0004b1b <Seg2PhyAddr>:
c0004b1b:	55                   	push   %ebp
c0004b1c:	89 e5                	mov    %esp,%ebp
c0004b1e:	83 ec 10             	sub    $0x10,%esp
c0004b21:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b24:	c1 e8 03             	shr    $0x3,%eax
c0004b27:	8b 14 c5 64 f7 00 c0 	mov    -0x3fff089c(,%eax,8),%edx
c0004b2e:	8b 04 c5 60 f7 00 c0 	mov    -0x3fff08a0(,%eax,8),%eax
c0004b35:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b38:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004b3b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004b3f:	0f b7 c0             	movzwl %ax,%eax
c0004b42:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004b46:	0f b6 d2             	movzbl %dl,%edx
c0004b49:	c1 e2 10             	shl    $0x10,%edx
c0004b4c:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004b52:	09 d0                	or     %edx,%eax
c0004b54:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b57:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b5a:	c9                   	leave  
c0004b5b:	c3                   	ret    

c0004b5c <Seg2PhyAddrLDT>:
c0004b5c:	55                   	push   %ebp
c0004b5d:	89 e5                	mov    %esp,%ebp
c0004b5f:	83 ec 10             	sub    $0x10,%esp
c0004b62:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b65:	c1 e8 03             	shr    $0x3,%eax
c0004b68:	89 c2                	mov    %eax,%edx
c0004b6a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b6d:	83 c2 20             	add    $0x20,%edx
c0004b70:	8d 54 d0 0e          	lea    0xe(%eax,%edx,8),%edx
c0004b74:	8b 02                	mov    (%edx),%eax
c0004b76:	8b 52 04             	mov    0x4(%edx),%edx
c0004b79:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b7c:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004b7f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004b83:	0f b7 c0             	movzwl %ax,%eax
c0004b86:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004b8a:	0f b6 d2             	movzbl %dl,%edx
c0004b8d:	c1 e2 10             	shl    $0x10,%edx
c0004b90:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004b96:	09 d0                	or     %edx,%eax
c0004b98:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b9b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b9e:	c9                   	leave  
c0004b9f:	c3                   	ret    

c0004ba0 <VirAddr2PhyAddr>:
c0004ba0:	55                   	push   %ebp
c0004ba1:	89 e5                	mov    %esp,%ebp
c0004ba3:	83 ec 10             	sub    $0x10,%esp
c0004ba6:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004ba9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004bac:	01 d0                	add    %edx,%eax
c0004bae:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004bb1:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004bb4:	c9                   	leave  
c0004bb5:	c3                   	ret    

c0004bb6 <v2l>:
c0004bb6:	55                   	push   %ebp
c0004bb7:	89 e5                	mov    %esp,%ebp
c0004bb9:	83 ec 18             	sub    $0x18,%esp
c0004bbc:	83 ec 0c             	sub    $0xc,%esp
c0004bbf:	ff 75 08             	pushl  0x8(%ebp)
c0004bc2:	e8 60 fe ff ff       	call   c0004a27 <pid2proc>
c0004bc7:	83 c4 10             	add    $0x10,%esp
c0004bca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004bcd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004bd4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004bd7:	83 ec 08             	sub    $0x8,%esp
c0004bda:	ff 75 f4             	pushl  -0xc(%ebp)
c0004bdd:	50                   	push   %eax
c0004bde:	e8 79 ff ff ff       	call   c0004b5c <Seg2PhyAddrLDT>
c0004be3:	83 c4 10             	add    $0x10,%esp
c0004be6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004be9:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004bec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004bef:	01 d0                	add    %edx,%eax
c0004bf1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004bf4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004bf7:	c9                   	leave  
c0004bf8:	c3                   	ret    

c0004bf9 <init_propt>:
c0004bf9:	55                   	push   %ebp
c0004bfa:	89 e5                	mov    %esp,%ebp
c0004bfc:	83 ec 28             	sub    $0x28,%esp
c0004bff:	6a 0e                	push   $0xe
c0004c01:	6a 08                	push   $0x8
c0004c03:	68 6a 16 00 c0       	push   $0xc000166a
c0004c08:	6a 20                	push   $0x20
c0004c0a:	e8 18 01 00 00       	call   c0004d27 <InitInterruptDesc>
c0004c0f:	83 c4 10             	add    $0x10,%esp
c0004c12:	6a 0e                	push   $0xe
c0004c14:	6a 08                	push   $0x8
c0004c16:	68 98 16 00 c0       	push   $0xc0001698
c0004c1b:	6a 21                	push   $0x21
c0004c1d:	e8 05 01 00 00       	call   c0004d27 <InitInterruptDesc>
c0004c22:	83 c4 10             	add    $0x10,%esp
c0004c25:	6a 0e                	push   $0xe
c0004c27:	6a 08                	push   $0x8
c0004c29:	68 dc 16 00 c0       	push   $0xc00016dc
c0004c2e:	6a 2e                	push   $0x2e
c0004c30:	e8 f2 00 00 00       	call   c0004d27 <InitInterruptDesc>
c0004c35:	83 c4 10             	add    $0x10,%esp
c0004c38:	83 ec 04             	sub    $0x4,%esp
c0004c3b:	68 b0 0a 00 00       	push   $0xab0
c0004c40:	6a 00                	push   $0x0
c0004c42:	68 00 33 08 c0       	push   $0xc0083300
c0004c47:	e8 26 67 00 00       	call   c000b372 <Memset>
c0004c4c:	83 c4 10             	add    $0x10,%esp
c0004c4f:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004c56:	83 ec 04             	sub    $0x4,%esp
c0004c59:	ff 75 f4             	pushl  -0xc(%ebp)
c0004c5c:	6a 00                	push   $0x0
c0004c5e:	68 20 16 01 c0       	push   $0xc0011620
c0004c63:	e8 0a 67 00 00       	call   c000b372 <Memset>
c0004c68:	83 c4 10             	add    $0x10,%esp
c0004c6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c6e:	a3 88 16 01 c0       	mov    %eax,0xc0011688
c0004c73:	c7 05 28 16 01 c0 30 	movl   $0x30,0xc0011628
c0004c7a:	00 00 00 
c0004c7d:	83 ec 0c             	sub    $0xc,%esp
c0004c80:	6a 30                	push   $0x30
c0004c82:	e8 94 fe ff ff       	call   c0004b1b <Seg2PhyAddr>
c0004c87:	83 c4 10             	add    $0x10,%esp
c0004c8a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004c8d:	c7 45 ec 20 16 01 c0 	movl   $0xc0011620,-0x14(%ebp)
c0004c94:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004c9b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004c9e:	0f b7 d0             	movzwl %ax,%edx
c0004ca1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004ca4:	83 e8 01             	sub    $0x1,%eax
c0004ca7:	89 c1                	mov    %eax,%ecx
c0004ca9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004cac:	52                   	push   %edx
c0004cad:	51                   	push   %ecx
c0004cae:	50                   	push   %eax
c0004caf:	68 a0 f7 00 c0       	push   $0xc000f7a0
c0004cb4:	e8 f5 fd ff ff       	call   c0004aae <InitDescriptor>
c0004cb9:	83 c4 10             	add    $0x10,%esp
c0004cbc:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004cc3:	68 f2 00 00 00       	push   $0xf2
c0004cc8:	68 ff ff 00 00       	push   $0xffff
c0004ccd:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004cd0:	68 98 f7 00 c0       	push   $0xc000f798
c0004cd5:	e8 d4 fd ff ff       	call   c0004aae <InitDescriptor>
c0004cda:	83 c4 10             	add    $0x10,%esp
c0004cdd:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004ce4:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004ceb:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004cf2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004cf5:	0f b7 c0             	movzwl %ax,%eax
c0004cf8:	50                   	push   %eax
c0004cf9:	ff 75 d8             	pushl  -0x28(%ebp)
c0004cfc:	6a 00                	push   $0x0
c0004cfe:	68 a8 f7 00 c0       	push   $0xc000f7a8
c0004d03:	e8 a6 fd ff ff       	call   c0004aae <InitDescriptor>
c0004d08:	83 c4 10             	add    $0x10,%esp
c0004d0b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004d0e:	0f b7 c0             	movzwl %ax,%eax
c0004d11:	50                   	push   %eax
c0004d12:	ff 75 d8             	pushl  -0x28(%ebp)
c0004d15:	6a 00                	push   $0x0
c0004d17:	68 b0 f7 00 c0       	push   $0xc000f7b0
c0004d1c:	e8 8d fd ff ff       	call   c0004aae <InitDescriptor>
c0004d21:	83 c4 10             	add    $0x10,%esp
c0004d24:	90                   	nop
c0004d25:	c9                   	leave  
c0004d26:	c3                   	ret    

c0004d27 <InitInterruptDesc>:
c0004d27:	55                   	push   %ebp
c0004d28:	89 e5                	mov    %esp,%ebp
c0004d2a:	83 ec 10             	sub    $0x10,%esp
c0004d2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d30:	c1 e0 03             	shl    $0x3,%eax
c0004d33:	05 c0 16 01 c0       	add    $0xc00116c0,%eax
c0004d38:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004d3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d3e:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004d42:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004d45:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004d48:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004d4b:	89 c2                	mov    %eax,%edx
c0004d4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d50:	66 89 10             	mov    %dx,(%eax)
c0004d53:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d56:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004d5c:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004d5f:	c1 f8 10             	sar    $0x10,%eax
c0004d62:	89 c2                	mov    %eax,%edx
c0004d64:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d67:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004d6b:	8b 45 10             	mov    0x10(%ebp),%eax
c0004d6e:	c1 e0 04             	shl    $0x4,%eax
c0004d71:	89 c2                	mov    %eax,%edx
c0004d73:	8b 45 14             	mov    0x14(%ebp),%eax
c0004d76:	09 d0                	or     %edx,%eax
c0004d78:	89 c2                	mov    %eax,%edx
c0004d7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d7d:	88 50 05             	mov    %dl,0x5(%eax)
c0004d80:	90                   	nop
c0004d81:	c9                   	leave  
c0004d82:	c3                   	ret    

c0004d83 <ReloadGDT>:
c0004d83:	55                   	push   %ebp
c0004d84:	89 e5                	mov    %esp,%ebp
c0004d86:	83 ec 28             	sub    $0x28,%esp
c0004d89:	b8 a8 16 01 c0       	mov    $0xc00116a8,%eax
c0004d8e:	0f b7 00             	movzwl (%eax),%eax
c0004d91:	98                   	cwtl   
c0004d92:	ba aa 16 01 c0       	mov    $0xc00116aa,%edx
c0004d97:	8b 12                	mov    (%edx),%edx
c0004d99:	83 ec 04             	sub    $0x4,%esp
c0004d9c:	50                   	push   %eax
c0004d9d:	52                   	push   %edx
c0004d9e:	68 60 f7 00 c0       	push   $0xc000f760
c0004da3:	e8 9c 65 00 00       	call   c000b344 <Memcpy>
c0004da8:	83 c4 10             	add    $0x10,%esp
c0004dab:	c7 45 f0 a8 16 01 c0 	movl   $0xc00116a8,-0x10(%ebp)
c0004db2:	c7 45 ec aa 16 01 c0 	movl   $0xc00116aa,-0x14(%ebp)
c0004db9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004dbc:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004dc1:	ba 60 f7 00 c0       	mov    $0xc000f760,%edx
c0004dc6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004dc9:	89 10                	mov    %edx,(%eax)
c0004dcb:	c7 45 e8 28 f7 00 c0 	movl   $0xc000f728,-0x18(%ebp)
c0004dd2:	c7 45 e4 2a f7 00 c0 	movl   $0xc000f72a,-0x1c(%ebp)
c0004dd9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004ddc:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004de1:	ba c0 16 01 c0       	mov    $0xc00116c0,%edx
c0004de6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004de9:	89 10                	mov    %edx,(%eax)
c0004deb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004df2:	eb 04                	jmp    c0004df8 <ReloadGDT+0x75>
c0004df4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004df8:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004dff:	7e f3                	jle    c0004df4 <ReloadGDT+0x71>
c0004e01:	e8 24 31 00 00       	call   c0007f2a <init_internal_interrupt>
c0004e06:	e8 ee fd ff ff       	call   c0004bf9 <init_propt>
c0004e0b:	90                   	nop
c0004e0c:	c9                   	leave  
c0004e0d:	c3                   	ret    

c0004e0e <select_console>:
c0004e0e:	55                   	push   %ebp
c0004e0f:	89 e5                	mov    %esp,%ebp
c0004e11:	83 ec 18             	sub    $0x18,%esp
c0004e14:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e17:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004e1a:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c0004e1e:	77 27                	ja     c0004e47 <select_console+0x39>
c0004e20:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004e24:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004e2a:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0004e2f:	a3 20 f7 00 c0       	mov    %eax,0xc000f720
c0004e34:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0004e39:	83 ec 0c             	sub    $0xc,%esp
c0004e3c:	50                   	push   %eax
c0004e3d:	e8 08 00 00 00       	call   c0004e4a <flush>
c0004e42:	83 c4 10             	add    $0x10,%esp
c0004e45:	eb 01                	jmp    c0004e48 <select_console+0x3a>
c0004e47:	90                   	nop
c0004e48:	c9                   	leave  
c0004e49:	c3                   	ret    

c0004e4a <flush>:
c0004e4a:	55                   	push   %ebp
c0004e4b:	89 e5                	mov    %esp,%ebp
c0004e4d:	83 ec 08             	sub    $0x8,%esp
c0004e50:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e53:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e59:	8b 40 0c             	mov    0xc(%eax),%eax
c0004e5c:	83 ec 0c             	sub    $0xc,%esp
c0004e5f:	50                   	push   %eax
c0004e60:	e8 1e 00 00 00       	call   c0004e83 <set_cursor>
c0004e65:	83 c4 10             	add    $0x10,%esp
c0004e68:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e6b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e71:	8b 40 08             	mov    0x8(%eax),%eax
c0004e74:	83 ec 0c             	sub    $0xc,%esp
c0004e77:	50                   	push   %eax
c0004e78:	e8 64 00 00 00       	call   c0004ee1 <set_console_start_video_addr>
c0004e7d:	83 c4 10             	add    $0x10,%esp
c0004e80:	90                   	nop
c0004e81:	c9                   	leave  
c0004e82:	c3                   	ret    

c0004e83 <set_cursor>:
c0004e83:	55                   	push   %ebp
c0004e84:	89 e5                	mov    %esp,%ebp
c0004e86:	83 ec 08             	sub    $0x8,%esp
c0004e89:	83 ec 08             	sub    $0x8,%esp
c0004e8c:	6a 0e                	push   $0xe
c0004e8e:	68 d4 03 00 00       	push   $0x3d4
c0004e93:	e8 fe c8 ff ff       	call   c0001796 <out_byte>
c0004e98:	83 c4 10             	add    $0x10,%esp
c0004e9b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e9e:	c1 e8 08             	shr    $0x8,%eax
c0004ea1:	0f b7 c0             	movzwl %ax,%eax
c0004ea4:	83 ec 08             	sub    $0x8,%esp
c0004ea7:	50                   	push   %eax
c0004ea8:	68 d5 03 00 00       	push   $0x3d5
c0004ead:	e8 e4 c8 ff ff       	call   c0001796 <out_byte>
c0004eb2:	83 c4 10             	add    $0x10,%esp
c0004eb5:	83 ec 08             	sub    $0x8,%esp
c0004eb8:	6a 0f                	push   $0xf
c0004eba:	68 d4 03 00 00       	push   $0x3d4
c0004ebf:	e8 d2 c8 ff ff       	call   c0001796 <out_byte>
c0004ec4:	83 c4 10             	add    $0x10,%esp
c0004ec7:	8b 45 08             	mov    0x8(%ebp),%eax
c0004eca:	0f b7 c0             	movzwl %ax,%eax
c0004ecd:	83 ec 08             	sub    $0x8,%esp
c0004ed0:	50                   	push   %eax
c0004ed1:	68 d5 03 00 00       	push   $0x3d5
c0004ed6:	e8 bb c8 ff ff       	call   c0001796 <out_byte>
c0004edb:	83 c4 10             	add    $0x10,%esp
c0004ede:	90                   	nop
c0004edf:	c9                   	leave  
c0004ee0:	c3                   	ret    

c0004ee1 <set_console_start_video_addr>:
c0004ee1:	55                   	push   %ebp
c0004ee2:	89 e5                	mov    %esp,%ebp
c0004ee4:	83 ec 08             	sub    $0x8,%esp
c0004ee7:	83 ec 08             	sub    $0x8,%esp
c0004eea:	6a 0c                	push   $0xc
c0004eec:	68 d4 03 00 00       	push   $0x3d4
c0004ef1:	e8 a0 c8 ff ff       	call   c0001796 <out_byte>
c0004ef6:	83 c4 10             	add    $0x10,%esp
c0004ef9:	8b 45 08             	mov    0x8(%ebp),%eax
c0004efc:	c1 e8 08             	shr    $0x8,%eax
c0004eff:	0f b7 c0             	movzwl %ax,%eax
c0004f02:	83 ec 08             	sub    $0x8,%esp
c0004f05:	50                   	push   %eax
c0004f06:	68 d5 03 00 00       	push   $0x3d5
c0004f0b:	e8 86 c8 ff ff       	call   c0001796 <out_byte>
c0004f10:	83 c4 10             	add    $0x10,%esp
c0004f13:	83 ec 08             	sub    $0x8,%esp
c0004f16:	6a 0d                	push   $0xd
c0004f18:	68 d4 03 00 00       	push   $0x3d4
c0004f1d:	e8 74 c8 ff ff       	call   c0001796 <out_byte>
c0004f22:	83 c4 10             	add    $0x10,%esp
c0004f25:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f28:	0f b7 c0             	movzwl %ax,%eax
c0004f2b:	83 ec 08             	sub    $0x8,%esp
c0004f2e:	50                   	push   %eax
c0004f2f:	68 d5 03 00 00       	push   $0x3d5
c0004f34:	e8 5d c8 ff ff       	call   c0001796 <out_byte>
c0004f39:	83 c4 10             	add    $0x10,%esp
c0004f3c:	90                   	nop
c0004f3d:	c9                   	leave  
c0004f3e:	c3                   	ret    

c0004f3f <put_key>:
c0004f3f:	55                   	push   %ebp
c0004f40:	89 e5                	mov    %esp,%ebp
c0004f42:	83 ec 04             	sub    $0x4,%esp
c0004f45:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f48:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004f4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f4e:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f54:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004f59:	77 4d                	ja     c0004fa8 <put_key+0x69>
c0004f5b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f5e:	8b 00                	mov    (%eax),%eax
c0004f60:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004f64:	89 10                	mov    %edx,(%eax)
c0004f66:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f69:	8b 00                	mov    (%eax),%eax
c0004f6b:	8d 50 04             	lea    0x4(%eax),%edx
c0004f6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f71:	89 10                	mov    %edx,(%eax)
c0004f73:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f76:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f7c:	8d 50 01             	lea    0x1(%eax),%edx
c0004f7f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f82:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004f88:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f8b:	8b 00                	mov    (%eax),%eax
c0004f8d:	8b 55 08             	mov    0x8(%ebp),%edx
c0004f90:	83 c2 08             	add    $0x8,%edx
c0004f93:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004f99:	39 d0                	cmp    %edx,%eax
c0004f9b:	75 0b                	jne    c0004fa8 <put_key+0x69>
c0004f9d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa0:	8d 50 08             	lea    0x8(%eax),%edx
c0004fa3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa6:	89 10                	mov    %edx,(%eax)
c0004fa8:	90                   	nop
c0004fa9:	c9                   	leave  
c0004faa:	c3                   	ret    

c0004fab <scroll_up>:
c0004fab:	55                   	push   %ebp
c0004fac:	89 e5                	mov    %esp,%ebp
c0004fae:	83 ec 08             	sub    $0x8,%esp
c0004fb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fb4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fba:	8b 40 08             	mov    0x8(%eax),%eax
c0004fbd:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004fc0:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fc3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fc9:	8b 00                	mov    (%eax),%eax
c0004fcb:	39 c2                	cmp    %eax,%edx
c0004fcd:	76 1b                	jbe    c0004fea <scroll_up+0x3f>
c0004fcf:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fd2:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fd8:	8b 40 08             	mov    0x8(%eax),%eax
c0004fdb:	83 e8 50             	sub    $0x50,%eax
c0004fde:	83 ec 0c             	sub    $0xc,%esp
c0004fe1:	50                   	push   %eax
c0004fe2:	e8 fa fe ff ff       	call   c0004ee1 <set_console_start_video_addr>
c0004fe7:	83 c4 10             	add    $0x10,%esp
c0004fea:	90                   	nop
c0004feb:	c9                   	leave  
c0004fec:	c3                   	ret    

c0004fed <scroll_down>:
c0004fed:	55                   	push   %ebp
c0004fee:	89 e5                	mov    %esp,%ebp
c0004ff0:	83 ec 08             	sub    $0x8,%esp
c0004ff3:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ff6:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ffc:	8b 40 08             	mov    0x8(%eax),%eax
c0004fff:	8d 48 50             	lea    0x50(%eax),%ecx
c0005002:	8b 45 08             	mov    0x8(%ebp),%eax
c0005005:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000500b:	8b 10                	mov    (%eax),%edx
c000500d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005010:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005016:	8b 40 04             	mov    0x4(%eax),%eax
c0005019:	01 d0                	add    %edx,%eax
c000501b:	39 c1                	cmp    %eax,%ecx
c000501d:	73 36                	jae    c0005055 <scroll_down+0x68>
c000501f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005022:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005028:	8b 40 08             	mov    0x8(%eax),%eax
c000502b:	83 c0 50             	add    $0x50,%eax
c000502e:	83 ec 0c             	sub    $0xc,%esp
c0005031:	50                   	push   %eax
c0005032:	e8 aa fe ff ff       	call   c0004ee1 <set_console_start_video_addr>
c0005037:	83 c4 10             	add    $0x10,%esp
c000503a:	8b 45 08             	mov    0x8(%ebp),%eax
c000503d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005043:	8b 50 08             	mov    0x8(%eax),%edx
c0005046:	8b 45 08             	mov    0x8(%ebp),%eax
c0005049:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000504f:	83 c2 50             	add    $0x50,%edx
c0005052:	89 50 08             	mov    %edx,0x8(%eax)
c0005055:	90                   	nop
c0005056:	c9                   	leave  
c0005057:	c3                   	ret    

c0005058 <out_char>:
c0005058:	55                   	push   %ebp
c0005059:	89 e5                	mov    %esp,%ebp
c000505b:	83 ec 28             	sub    $0x28,%esp
c000505e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005061:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0005064:	8b 45 08             	mov    0x8(%ebp),%eax
c0005067:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000506d:	8b 40 0c             	mov    0xc(%eax),%eax
c0005070:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0005075:	01 c0                	add    %eax,%eax
c0005077:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000507a:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c000507e:	83 f8 08             	cmp    $0x8,%eax
c0005081:	0f 84 8d 00 00 00    	je     c0005114 <out_char+0xbc>
c0005087:	83 f8 0a             	cmp    $0xa,%eax
c000508a:	0f 85 c9 00 00 00    	jne    c0005159 <out_char+0x101>
c0005090:	8b 45 08             	mov    0x8(%ebp),%eax
c0005093:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005099:	8b 50 0c             	mov    0xc(%eax),%edx
c000509c:	8b 45 08             	mov    0x8(%ebp),%eax
c000509f:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050a5:	8b 08                	mov    (%eax),%ecx
c00050a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00050aa:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050b0:	8b 40 04             	mov    0x4(%eax),%eax
c00050b3:	01 c8                	add    %ecx,%eax
c00050b5:	83 e8 50             	sub    $0x50,%eax
c00050b8:	39 c2                	cmp    %eax,%edx
c00050ba:	0f 83 f4 00 00 00    	jae    c00051b4 <out_char+0x15c>
c00050c0:	8b 45 08             	mov    0x8(%ebp),%eax
c00050c3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050c9:	8b 08                	mov    (%eax),%ecx
c00050cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ce:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050d4:	8b 50 0c             	mov    0xc(%eax),%edx
c00050d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00050da:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050e0:	8b 00                	mov    (%eax),%eax
c00050e2:	29 c2                	sub    %eax,%edx
c00050e4:	89 d0                	mov    %edx,%eax
c00050e6:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c00050eb:	f7 e2                	mul    %edx
c00050ed:	89 d0                	mov    %edx,%eax
c00050ef:	c1 e8 06             	shr    $0x6,%eax
c00050f2:	8d 50 01             	lea    0x1(%eax),%edx
c00050f5:	89 d0                	mov    %edx,%eax
c00050f7:	c1 e0 02             	shl    $0x2,%eax
c00050fa:	01 d0                	add    %edx,%eax
c00050fc:	c1 e0 04             	shl    $0x4,%eax
c00050ff:	89 c2                	mov    %eax,%edx
c0005101:	8b 45 08             	mov    0x8(%ebp),%eax
c0005104:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000510a:	01 ca                	add    %ecx,%edx
c000510c:	89 50 0c             	mov    %edx,0xc(%eax)
c000510f:	e9 a0 00 00 00       	jmp    c00051b4 <out_char+0x15c>
c0005114:	8b 45 08             	mov    0x8(%ebp),%eax
c0005117:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000511d:	8b 50 0c             	mov    0xc(%eax),%edx
c0005120:	8b 45 08             	mov    0x8(%ebp),%eax
c0005123:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005129:	8b 00                	mov    (%eax),%eax
c000512b:	39 c2                	cmp    %eax,%edx
c000512d:	0f 86 84 00 00 00    	jbe    c00051b7 <out_char+0x15f>
c0005133:	8b 45 08             	mov    0x8(%ebp),%eax
c0005136:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000513c:	8b 50 0c             	mov    0xc(%eax),%edx
c000513f:	83 ea 01             	sub    $0x1,%edx
c0005142:	89 50 0c             	mov    %edx,0xc(%eax)
c0005145:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005148:	83 e8 02             	sub    $0x2,%eax
c000514b:	c6 00 20             	movb   $0x20,(%eax)
c000514e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005151:	83 e8 01             	sub    $0x1,%eax
c0005154:	c6 00 00             	movb   $0x0,(%eax)
c0005157:	eb 5e                	jmp    c00051b7 <out_char+0x15f>
c0005159:	8b 45 08             	mov    0x8(%ebp),%eax
c000515c:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005162:	8b 40 0c             	mov    0xc(%eax),%eax
c0005165:	8d 48 01             	lea    0x1(%eax),%ecx
c0005168:	8b 45 08             	mov    0x8(%ebp),%eax
c000516b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005171:	8b 10                	mov    (%eax),%edx
c0005173:	8b 45 08             	mov    0x8(%ebp),%eax
c0005176:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000517c:	8b 40 04             	mov    0x4(%eax),%eax
c000517f:	01 d0                	add    %edx,%eax
c0005181:	39 c1                	cmp    %eax,%ecx
c0005183:	73 35                	jae    c00051ba <out_char+0x162>
c0005185:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005188:	8d 50 01             	lea    0x1(%eax),%edx
c000518b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000518e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c0005192:	88 10                	mov    %dl,(%eax)
c0005194:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005197:	8d 50 01             	lea    0x1(%eax),%edx
c000519a:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000519d:	c6 00 0a             	movb   $0xa,(%eax)
c00051a0:	8b 45 08             	mov    0x8(%ebp),%eax
c00051a3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051a9:	8b 50 0c             	mov    0xc(%eax),%edx
c00051ac:	83 c2 01             	add    $0x1,%edx
c00051af:	89 50 0c             	mov    %edx,0xc(%eax)
c00051b2:	eb 06                	jmp    c00051ba <out_char+0x162>
c00051b4:	90                   	nop
c00051b5:	eb 14                	jmp    c00051cb <out_char+0x173>
c00051b7:	90                   	nop
c00051b8:	eb 11                	jmp    c00051cb <out_char+0x173>
c00051ba:	90                   	nop
c00051bb:	eb 0e                	jmp    c00051cb <out_char+0x173>
c00051bd:	83 ec 0c             	sub    $0xc,%esp
c00051c0:	ff 75 08             	pushl  0x8(%ebp)
c00051c3:	e8 25 fe ff ff       	call   c0004fed <scroll_down>
c00051c8:	83 c4 10             	add    $0x10,%esp
c00051cb:	8b 45 08             	mov    0x8(%ebp),%eax
c00051ce:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051d4:	8b 50 0c             	mov    0xc(%eax),%edx
c00051d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00051da:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051e0:	8b 40 08             	mov    0x8(%eax),%eax
c00051e3:	29 c2                	sub    %eax,%edx
c00051e5:	89 d0                	mov    %edx,%eax
c00051e7:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c00051ec:	77 cf                	ja     c00051bd <out_char+0x165>
c00051ee:	83 ec 0c             	sub    $0xc,%esp
c00051f1:	ff 75 08             	pushl  0x8(%ebp)
c00051f4:	e8 51 fc ff ff       	call   c0004e4a <flush>
c00051f9:	83 c4 10             	add    $0x10,%esp
c00051fc:	90                   	nop
c00051fd:	c9                   	leave  
c00051fe:	c3                   	ret    

c00051ff <tty_dev_read>:
c00051ff:	55                   	push   %ebp
c0005200:	89 e5                	mov    %esp,%ebp
c0005202:	83 ec 08             	sub    $0x8,%esp
c0005205:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c000520a:	39 45 08             	cmp    %eax,0x8(%ebp)
c000520d:	75 17                	jne    c0005226 <tty_dev_read+0x27>
c000520f:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005214:	85 c0                	test   %eax,%eax
c0005216:	7e 0e                	jle    c0005226 <tty_dev_read+0x27>
c0005218:	83 ec 0c             	sub    $0xc,%esp
c000521b:	ff 75 08             	pushl  0x8(%ebp)
c000521e:	e8 84 07 00 00       	call   c00059a7 <keyboard_read>
c0005223:	83 c4 10             	add    $0x10,%esp
c0005226:	90                   	nop
c0005227:	c9                   	leave  
c0005228:	c3                   	ret    

c0005229 <tty_dev_write>:
c0005229:	55                   	push   %ebp
c000522a:	89 e5                	mov    %esp,%ebp
c000522c:	83 ec 28             	sub    $0x28,%esp
c000522f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005232:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005238:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000523b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0005242:	e9 88 01 00 00       	jmp    c00053cf <tty_dev_write+0x1a6>
c0005247:	8b 45 08             	mov    0x8(%ebp),%eax
c000524a:	8b 40 04             	mov    0x4(%eax),%eax
c000524d:	8b 00                	mov    (%eax),%eax
c000524f:	88 45 e7             	mov    %al,-0x19(%ebp)
c0005252:	8b 45 08             	mov    0x8(%ebp),%eax
c0005255:	8b 40 04             	mov    0x4(%eax),%eax
c0005258:	8d 50 04             	lea    0x4(%eax),%edx
c000525b:	8b 45 08             	mov    0x8(%ebp),%eax
c000525e:	89 50 04             	mov    %edx,0x4(%eax)
c0005261:	8b 45 08             	mov    0x8(%ebp),%eax
c0005264:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000526a:	8d 50 ff             	lea    -0x1(%eax),%edx
c000526d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005270:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0005276:	8b 45 08             	mov    0x8(%ebp),%eax
c0005279:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000527f:	8d 50 01             	lea    0x1(%eax),%edx
c0005282:	8b 45 08             	mov    0x8(%ebp),%eax
c0005285:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c000528b:	8b 45 08             	mov    0x8(%ebp),%eax
c000528e:	8b 40 04             	mov    0x4(%eax),%eax
c0005291:	8b 55 08             	mov    0x8(%ebp),%edx
c0005294:	83 c2 08             	add    $0x8,%edx
c0005297:	81 c2 00 08 00 00    	add    $0x800,%edx
c000529d:	39 d0                	cmp    %edx,%eax
c000529f:	75 0c                	jne    c00052ad <tty_dev_write+0x84>
c00052a1:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a4:	8d 50 08             	lea    0x8(%eax),%edx
c00052a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00052aa:	89 50 04             	mov    %edx,0x4(%eax)
c00052ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00052b0:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00052b6:	85 c0                	test   %eax,%eax
c00052b8:	0f 84 11 01 00 00    	je     c00053cf <tty_dev_write+0x1a6>
c00052be:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052c2:	3c 20                	cmp    $0x20,%al
c00052c4:	76 08                	jbe    c00052ce <tty_dev_write+0xa5>
c00052c6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052ca:	3c 7e                	cmp    $0x7e,%al
c00052cc:	76 10                	jbe    c00052de <tty_dev_write+0xb5>
c00052ce:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052d2:	3c 20                	cmp    $0x20,%al
c00052d4:	74 08                	je     c00052de <tty_dev_write+0xb5>
c00052d6:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052da:	84 c0                	test   %al,%al
c00052dc:	75 58                	jne    c0005336 <tty_dev_write+0x10d>
c00052de:	8b 45 08             	mov    0x8(%ebp),%eax
c00052e1:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c00052e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00052ea:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00052f0:	01 d0                	add    %edx,%eax
c00052f2:	83 e8 01             	sub    $0x1,%eax
c00052f5:	89 c2                	mov    %eax,%edx
c00052f7:	83 ec 04             	sub    $0x4,%esp
c00052fa:	6a 01                	push   $0x1
c00052fc:	8d 45 e7             	lea    -0x19(%ebp),%eax
c00052ff:	50                   	push   %eax
c0005300:	52                   	push   %edx
c0005301:	e8 3e 60 00 00       	call   c000b344 <Memcpy>
c0005306:	83 c4 10             	add    $0x10,%esp
c0005309:	8b 45 08             	mov    0x8(%ebp),%eax
c000530c:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005312:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005315:	8b 45 08             	mov    0x8(%ebp),%eax
c0005318:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000531e:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005322:	0f b6 c0             	movzbl %al,%eax
c0005325:	83 ec 08             	sub    $0x8,%esp
c0005328:	50                   	push   %eax
c0005329:	ff 75 08             	pushl  0x8(%ebp)
c000532c:	e8 27 fd ff ff       	call   c0005058 <out_char>
c0005331:	83 c4 10             	add    $0x10,%esp
c0005334:	eb 7c                	jmp    c00053b2 <tty_dev_write+0x189>
c0005336:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000533a:	3c 08                	cmp    $0x8,%al
c000533c:	75 42                	jne    c0005380 <tty_dev_write+0x157>
c000533e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005341:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005347:	8d 50 01             	lea    0x1(%eax),%edx
c000534a:	8b 45 08             	mov    0x8(%ebp),%eax
c000534d:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005353:	8b 45 08             	mov    0x8(%ebp),%eax
c0005356:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000535c:	8d 50 fe             	lea    -0x2(%eax),%edx
c000535f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005362:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005368:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000536c:	0f b6 c0             	movzbl %al,%eax
c000536f:	83 ec 08             	sub    $0x8,%esp
c0005372:	50                   	push   %eax
c0005373:	ff 75 08             	pushl  0x8(%ebp)
c0005376:	e8 dd fc ff ff       	call   c0005058 <out_char>
c000537b:	83 c4 10             	add    $0x10,%esp
c000537e:	eb 32                	jmp    c00053b2 <tty_dev_write+0x189>
c0005380:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005384:	3c 0a                	cmp    $0xa,%al
c0005386:	75 2a                	jne    c00053b2 <tty_dev_write+0x189>
c0005388:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000538c:	0f b6 c0             	movzbl %al,%eax
c000538f:	83 ec 08             	sub    $0x8,%esp
c0005392:	50                   	push   %eax
c0005393:	ff 75 08             	pushl  0x8(%ebp)
c0005396:	e8 bd fc ff ff       	call   c0005058 <out_char>
c000539b:	83 c4 10             	add    $0x10,%esp
c000539e:	8b 45 08             	mov    0x8(%ebp),%eax
c00053a1:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c00053a8:	00 00 00 
c00053ab:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00053b2:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b5:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00053bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00053be:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00053c4:	39 c2                	cmp    %eax,%edx
c00053c6:	75 07                	jne    c00053cf <tty_dev_write+0x1a6>
c00053c8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00053cf:	8b 45 08             	mov    0x8(%ebp),%eax
c00053d2:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00053d8:	85 c0                	test   %eax,%eax
c00053da:	0f 85 67 fe ff ff    	jne    c0005247 <tty_dev_write+0x1e>
c00053e0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00053e4:	74 5c                	je     c0005442 <tty_dev_write+0x219>
c00053e6:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c00053ed:	83 ec 0c             	sub    $0xc,%esp
c00053f0:	ff 75 ec             	pushl  -0x14(%ebp)
c00053f3:	e8 e1 1a 00 00       	call   c0006ed9 <sys_malloc>
c00053f8:	83 c4 10             	add    $0x10,%esp
c00053fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00053fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005401:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c0005408:	8b 45 08             	mov    0x8(%ebp),%eax
c000540b:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005411:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005414:	89 50 50             	mov    %edx,0x50(%eax)
c0005417:	8b 45 08             	mov    0x8(%ebp),%eax
c000541a:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c0005420:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005423:	89 50 58             	mov    %edx,0x58(%eax)
c0005426:	8b 45 08             	mov    0x8(%ebp),%eax
c0005429:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000542f:	83 ec 04             	sub    $0x4,%esp
c0005432:	50                   	push   %eax
c0005433:	ff 75 e8             	pushl  -0x18(%ebp)
c0005436:	6a 01                	push   $0x1
c0005438:	e8 36 46 00 00       	call   c0009a73 <send_rec>
c000543d:	83 c4 10             	add    $0x10,%esp
c0005440:	eb 01                	jmp    c0005443 <tty_dev_write+0x21a>
c0005442:	90                   	nop
c0005443:	c9                   	leave  
c0005444:	c3                   	ret    

c0005445 <tty_do_read>:
c0005445:	55                   	push   %ebp
c0005446:	89 e5                	mov    %esp,%ebp
c0005448:	83 ec 08             	sub    $0x8,%esp
c000544b:	8b 45 08             	mov    0x8(%ebp),%eax
c000544e:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005455:	00 00 00 
c0005458:	8b 45 0c             	mov    0xc(%ebp),%eax
c000545b:	8b 50 58             	mov    0x58(%eax),%edx
c000545e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005461:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0005467:	8b 45 0c             	mov    0xc(%ebp),%eax
c000546a:	8b 00                	mov    (%eax),%eax
c000546c:	89 c2                	mov    %eax,%edx
c000546e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005471:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0005477:	8b 45 0c             	mov    0xc(%ebp),%eax
c000547a:	8b 50 50             	mov    0x50(%eax),%edx
c000547d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005480:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005486:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005489:	8b 50 50             	mov    0x50(%eax),%edx
c000548c:	8b 45 08             	mov    0x8(%ebp),%eax
c000548f:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005495:	8b 45 08             	mov    0x8(%ebp),%eax
c0005498:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c000549e:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054a1:	8b 40 10             	mov    0x10(%eax),%eax
c00054a4:	83 ec 08             	sub    $0x8,%esp
c00054a7:	52                   	push   %edx
c00054a8:	50                   	push   %eax
c00054a9:	e8 ea 18 00 00       	call   c0006d98 <alloc_virtual_memory>
c00054ae:	83 c4 10             	add    $0x10,%esp
c00054b1:	89 c2                	mov    %eax,%edx
c00054b3:	8b 45 08             	mov    0x8(%ebp),%eax
c00054b6:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00054bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00054bf:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00054c5:	83 f8 04             	cmp    $0x4,%eax
c00054c8:	74 1c                	je     c00054e6 <tty_do_read+0xa1>
c00054ca:	68 27 01 00 00       	push   $0x127
c00054cf:	68 65 ab 00 c0       	push   $0xc000ab65
c00054d4:	68 65 ab 00 c0       	push   $0xc000ab65
c00054d9:	68 6f ab 00 c0       	push   $0xc000ab6f
c00054de:	e8 45 3d 00 00       	call   c0009228 <assertion_failure>
c00054e3:	83 c4 10             	add    $0x10,%esp
c00054e6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054e9:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c00054f0:	8b 45 08             	mov    0x8(%ebp),%eax
c00054f3:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00054f9:	83 ec 04             	sub    $0x4,%esp
c00054fc:	50                   	push   %eax
c00054fd:	ff 75 0c             	pushl  0xc(%ebp)
c0005500:	6a 01                	push   $0x1
c0005502:	e8 6c 45 00 00       	call   c0009a73 <send_rec>
c0005507:	83 c4 10             	add    $0x10,%esp
c000550a:	90                   	nop
c000550b:	c9                   	leave  
c000550c:	c3                   	ret    

c000550d <tty_do_write>:
c000550d:	55                   	push   %ebp
c000550e:	89 e5                	mov    %esp,%ebp
c0005510:	53                   	push   %ebx
c0005511:	83 ec 24             	sub    $0x24,%esp
c0005514:	89 e0                	mov    %esp,%eax
c0005516:	89 c3                	mov    %eax,%ebx
c0005518:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000551f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005522:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005525:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005528:	89 c2                	mov    %eax,%edx
c000552a:	b8 10 00 00 00       	mov    $0x10,%eax
c000552f:	83 e8 01             	sub    $0x1,%eax
c0005532:	01 d0                	add    %edx,%eax
c0005534:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005539:	ba 00 00 00 00       	mov    $0x0,%edx
c000553e:	f7 f1                	div    %ecx
c0005540:	6b c0 10             	imul   $0x10,%eax,%eax
c0005543:	29 c4                	sub    %eax,%esp
c0005545:	89 e0                	mov    %esp,%eax
c0005547:	83 c0 00             	add    $0x0,%eax
c000554a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000554d:	83 ec 04             	sub    $0x4,%esp
c0005550:	ff 75 e8             	pushl  -0x18(%ebp)
c0005553:	6a 00                	push   $0x0
c0005555:	ff 75 e0             	pushl  -0x20(%ebp)
c0005558:	e8 15 5e 00 00       	call   c000b372 <Memset>
c000555d:	83 c4 10             	add    $0x10,%esp
c0005560:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005563:	8b 40 50             	mov    0x50(%eax),%eax
c0005566:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005569:	8b 45 08             	mov    0x8(%ebp),%eax
c000556c:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005573:	00 00 00 
c0005576:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005579:	8b 45 0c             	mov    0xc(%ebp),%eax
c000557c:	8b 40 10             	mov    0x10(%eax),%eax
c000557f:	83 ec 08             	sub    $0x8,%esp
c0005582:	52                   	push   %edx
c0005583:	50                   	push   %eax
c0005584:	e8 0f 18 00 00       	call   c0006d98 <alloc_virtual_memory>
c0005589:	83 c4 10             	add    $0x10,%esp
c000558c:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000558f:	eb 7e                	jmp    c000560f <tty_do_write+0x102>
c0005591:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005594:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005597:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c000559b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000559e:	8b 45 08             	mov    0x8(%ebp),%eax
c00055a1:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055a7:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00055aa:	01 d0                	add    %edx,%eax
c00055ac:	83 ec 04             	sub    $0x4,%esp
c00055af:	ff 75 f0             	pushl  -0x10(%ebp)
c00055b2:	50                   	push   %eax
c00055b3:	ff 75 e0             	pushl  -0x20(%ebp)
c00055b6:	e8 89 5d 00 00       	call   c000b344 <Memcpy>
c00055bb:	83 c4 10             	add    $0x10,%esp
c00055be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055c1:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00055c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00055c7:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055d0:	01 c2                	add    %eax,%edx
c00055d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00055d5:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00055db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00055e2:	eb 25                	jmp    c0005609 <tty_do_write+0xfc>
c00055e4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00055e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00055ea:	01 d0                	add    %edx,%eax
c00055ec:	0f b6 00             	movzbl (%eax),%eax
c00055ef:	0f b6 c0             	movzbl %al,%eax
c00055f2:	83 ec 08             	sub    $0x8,%esp
c00055f5:	50                   	push   %eax
c00055f6:	ff 75 08             	pushl  0x8(%ebp)
c00055f9:	e8 5a fa ff ff       	call   c0005058 <out_char>
c00055fe:	83 c4 10             	add    $0x10,%esp
c0005601:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005605:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005609:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000560d:	75 d5                	jne    c00055e4 <tty_do_write+0xd7>
c000560f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c0005613:	0f 85 78 ff ff ff    	jne    c0005591 <tty_do_write+0x84>
c0005619:	83 ec 0c             	sub    $0xc,%esp
c000561c:	6a 6c                	push   $0x6c
c000561e:	e8 b6 18 00 00       	call   c0006ed9 <sys_malloc>
c0005623:	83 c4 10             	add    $0x10,%esp
c0005626:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005629:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000562c:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0005633:	8b 45 08             	mov    0x8(%ebp),%eax
c0005636:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000563c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000563f:	89 50 48             	mov    %edx,0x48(%eax)
c0005642:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005645:	8b 00                	mov    (%eax),%eax
c0005647:	83 ec 04             	sub    $0x4,%esp
c000564a:	50                   	push   %eax
c000564b:	ff 75 d8             	pushl  -0x28(%ebp)
c000564e:	6a 01                	push   $0x1
c0005650:	e8 1e 44 00 00       	call   c0009a73 <send_rec>
c0005655:	83 c4 10             	add    $0x10,%esp
c0005658:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000565b:	83 ec 08             	sub    $0x8,%esp
c000565e:	6a 6c                	push   $0x6c
c0005660:	50                   	push   %eax
c0005661:	e8 52 1b 00 00       	call   c00071b8 <sys_free>
c0005666:	83 c4 10             	add    $0x10,%esp
c0005669:	89 dc                	mov    %ebx,%esp
c000566b:	90                   	nop
c000566c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000566f:	c9                   	leave  
c0005670:	c3                   	ret    

c0005671 <init_screen>:
c0005671:	55                   	push   %ebp
c0005672:	89 e5                	mov    %esp,%ebp
c0005674:	83 ec 10             	sub    $0x10,%esp
c0005677:	8b 45 08             	mov    0x8(%ebp),%eax
c000567a:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c000567f:	c1 f8 03             	sar    $0x3,%eax
c0005682:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005688:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000568b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000568e:	c1 e0 04             	shl    $0x4,%eax
c0005691:	8d 90 00 1f 01 c0    	lea    -0x3ffee100(%eax),%edx
c0005697:	8b 45 08             	mov    0x8(%ebp),%eax
c000569a:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c00056a0:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c00056a7:	8b 45 08             	mov    0x8(%ebp),%eax
c00056aa:	8b 88 24 08 00 00    	mov    0x824(%eax),%ecx
c00056b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00056b3:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c00056b8:	f7 e2                	mul    %edx
c00056ba:	89 d0                	mov    %edx,%eax
c00056bc:	d1 e8                	shr    %eax
c00056be:	89 41 04             	mov    %eax,0x4(%ecx)
c00056c1:	8b 45 08             	mov    0x8(%ebp),%eax
c00056c4:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056ca:	8b 50 04             	mov    0x4(%eax),%edx
c00056cd:	8b 45 08             	mov    0x8(%ebp),%eax
c00056d0:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056d6:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00056da:	89 10                	mov    %edx,(%eax)
c00056dc:	8b 45 08             	mov    0x8(%ebp),%eax
c00056df:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c00056e5:	8b 45 08             	mov    0x8(%ebp),%eax
c00056e8:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056ee:	8b 12                	mov    (%edx),%edx
c00056f0:	89 50 08             	mov    %edx,0x8(%eax)
c00056f3:	8b 55 08             	mov    0x8(%ebp),%edx
c00056f6:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c00056fc:	8b 40 08             	mov    0x8(%eax),%eax
c00056ff:	89 42 0c             	mov    %eax,0xc(%edx)
c0005702:	90                   	nop
c0005703:	c9                   	leave  
c0005704:	c3                   	ret    

c0005705 <init_tty>:
c0005705:	55                   	push   %ebp
c0005706:	89 e5                	mov    %esp,%ebp
c0005708:	83 ec 18             	sub    $0x18,%esp
c000570b:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c0005712:	e9 92 00 00 00       	jmp    c00057a9 <init_tty+0xa4>
c0005717:	83 ec 04             	sub    $0x4,%esp
c000571a:	68 28 08 00 00       	push   $0x828
c000571f:	6a 00                	push   $0x0
c0005721:	ff 75 f4             	pushl  -0xc(%ebp)
c0005724:	e8 49 5c 00 00       	call   c000b372 <Memset>
c0005729:	83 c4 10             	add    $0x10,%esp
c000572c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000572f:	8d 50 08             	lea    0x8(%eax),%edx
c0005732:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005735:	89 50 04             	mov    %edx,0x4(%eax)
c0005738:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000573b:	8b 50 04             	mov    0x4(%eax),%edx
c000573e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005741:	89 10                	mov    %edx,(%eax)
c0005743:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005746:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c000574d:	00 00 00 
c0005750:	83 ec 0c             	sub    $0xc,%esp
c0005753:	ff 75 f4             	pushl  -0xc(%ebp)
c0005756:	e8 16 ff ff ff       	call   c0005671 <init_screen>
c000575b:	83 c4 10             	add    $0x10,%esp
c000575e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005761:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0005766:	85 c0                	test   %eax,%eax
c0005768:	7e 38                	jle    c00057a2 <init_tty+0x9d>
c000576a:	83 ec 08             	sub    $0x8,%esp
c000576d:	6a 23                	push   $0x23
c000576f:	ff 75 f4             	pushl  -0xc(%ebp)
c0005772:	e8 e1 f8 ff ff       	call   c0005058 <out_char>
c0005777:	83 c4 10             	add    $0x10,%esp
c000577a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000577d:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c0005782:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0005787:	c1 f8 03             	sar    $0x3,%eax
c000578a:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005790:	0f b6 c0             	movzbl %al,%eax
c0005793:	83 ec 08             	sub    $0x8,%esp
c0005796:	50                   	push   %eax
c0005797:	ff 75 f4             	pushl  -0xc(%ebp)
c000579a:	e8 b9 f8 ff ff       	call   c0005058 <out_char>
c000579f:	83 c4 10             	add    $0x10,%esp
c00057a2:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c00057a9:	b8 18 16 01 c0       	mov    $0xc0011618,%eax
c00057ae:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00057b1:	0f 82 60 ff ff ff    	jb     c0005717 <init_tty+0x12>
c00057b7:	90                   	nop
c00057b8:	c9                   	leave  
c00057b9:	c3                   	ret    

c00057ba <TaskTTY>:
c00057ba:	55                   	push   %ebp
c00057bb:	89 e5                	mov    %esp,%ebp
c00057bd:	83 ec 28             	sub    $0x28,%esp
c00057c0:	e8 40 ff ff ff       	call   c0005705 <init_tty>
c00057c5:	83 ec 0c             	sub    $0xc,%esp
c00057c8:	6a 00                	push   $0x0
c00057ca:	e8 3f f6 ff ff       	call   c0004e0e <select_console>
c00057cf:	83 c4 10             	add    $0x10,%esp
c00057d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00057d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00057e0:	83 ec 0c             	sub    $0xc,%esp
c00057e3:	6a 6c                	push   $0x6c
c00057e5:	e8 ef 16 00 00       	call   c0006ed9 <sys_malloc>
c00057ea:	83 c4 10             	add    $0x10,%esp
c00057ed:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00057f0:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c00057f7:	eb 30                	jmp    c0005829 <TaskTTY+0x6f>
c00057f9:	83 ec 0c             	sub    $0xc,%esp
c00057fc:	ff 75 f4             	pushl  -0xc(%ebp)
c00057ff:	e8 fb f9 ff ff       	call   c00051ff <tty_dev_read>
c0005804:	83 c4 10             	add    $0x10,%esp
c0005807:	83 ec 0c             	sub    $0xc,%esp
c000580a:	ff 75 f4             	pushl  -0xc(%ebp)
c000580d:	e8 17 fa ff ff       	call   c0005229 <tty_dev_write>
c0005812:	83 c4 10             	add    $0x10,%esp
c0005815:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005818:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c000581e:	85 c0                	test   %eax,%eax
c0005820:	75 d7                	jne    c00057f9 <TaskTTY+0x3f>
c0005822:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005829:	b8 18 16 01 c0       	mov    $0xc0011618,%eax
c000582e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c0005831:	72 c6                	jb     c00057f9 <TaskTTY+0x3f>
c0005833:	83 ec 04             	sub    $0x4,%esp
c0005836:	6a 0e                	push   $0xe
c0005838:	ff 75 e8             	pushl  -0x18(%ebp)
c000583b:	6a 02                	push   $0x2
c000583d:	e8 31 42 00 00       	call   c0009a73 <send_rec>
c0005842:	83 c4 10             	add    $0x10,%esp
c0005845:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005848:	8b 40 68             	mov    0x68(%eax),%eax
c000584b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000584e:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005855:	74 28                	je     c000587f <TaskTTY+0xc5>
c0005857:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c000585e:	7f 0b                	jg     c000586b <TaskTTY+0xb1>
c0005860:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005867:	74 4e                	je     c00058b7 <TaskTTY+0xfd>
c0005869:	eb 4d                	jmp    c00058b8 <TaskTTY+0xfe>
c000586b:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c0005872:	74 21                	je     c0005895 <TaskTTY+0xdb>
c0005874:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c000587b:	74 2e                	je     c00058ab <TaskTTY+0xf1>
c000587d:	eb 39                	jmp    c00058b8 <TaskTTY+0xfe>
c000587f:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0005884:	83 ec 08             	sub    $0x8,%esp
c0005887:	ff 75 e8             	pushl  -0x18(%ebp)
c000588a:	50                   	push   %eax
c000588b:	e8 b5 fb ff ff       	call   c0005445 <tty_do_read>
c0005890:	83 c4 10             	add    $0x10,%esp
c0005893:	eb 23                	jmp    c00058b8 <TaskTTY+0xfe>
c0005895:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c000589a:	83 ec 08             	sub    $0x8,%esp
c000589d:	ff 75 e8             	pushl  -0x18(%ebp)
c00058a0:	50                   	push   %eax
c00058a1:	e8 67 fc ff ff       	call   c000550d <tty_do_write>
c00058a6:	83 c4 10             	add    $0x10,%esp
c00058a9:	eb 0d                	jmp    c00058b8 <TaskTTY+0xfe>
c00058ab:	c7 05 a0 16 01 c0 00 	movl   $0x0,0xc00116a0
c00058b2:	00 00 00 
c00058b5:	eb 01                	jmp    c00058b8 <TaskTTY+0xfe>
c00058b7:	90                   	nop
c00058b8:	e9 33 ff ff ff       	jmp    c00057f0 <TaskTTY+0x36>

c00058bd <keyboard_handler>:
c00058bd:	55                   	push   %ebp
c00058be:	89 e5                	mov    %esp,%ebp
c00058c0:	83 ec 18             	sub    $0x18,%esp
c00058c3:	c7 05 a0 16 01 c0 01 	movl   $0x1,0xc00116a0
c00058ca:	00 00 00 
c00058cd:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c00058d4:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00058d9:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00058de:	7f 5e                	jg     c000593e <keyboard_handler+0x81>
c00058e0:	e8 d3 be ff ff       	call   c00017b8 <disable_int>
c00058e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058e8:	0f b7 c0             	movzwl %ax,%eax
c00058eb:	83 ec 0c             	sub    $0xc,%esp
c00058ee:	50                   	push   %eax
c00058ef:	e8 96 be ff ff       	call   c000178a <in_byte>
c00058f4:	83 c4 10             	add    $0x10,%esp
c00058f7:	88 45 f3             	mov    %al,-0xd(%ebp)
c00058fa:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c00058ff:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c0005903:	88 10                	mov    %dl,(%eax)
c0005905:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c000590a:	83 c0 01             	add    $0x1,%eax
c000590d:	a3 80 fb 00 c0       	mov    %eax,0xc000fb80
c0005912:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005917:	83 c0 01             	add    $0x1,%eax
c000591a:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c000591f:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0005924:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c0005929:	39 d0                	cmp    %edx,%eax
c000592b:	72 0a                	jb     c0005937 <keyboard_handler+0x7a>
c000592d:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c0005934:	fb 00 c0 
c0005937:	e8 7e be ff ff       	call   c00017ba <enable_int>
c000593c:	eb 01                	jmp    c000593f <keyboard_handler+0x82>
c000593e:	90                   	nop
c000593f:	c9                   	leave  
c0005940:	c3                   	ret    

c0005941 <read_from_keyboard_buf>:
c0005941:	55                   	push   %ebp
c0005942:	89 e5                	mov    %esp,%ebp
c0005944:	83 ec 18             	sub    $0x18,%esp
c0005947:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c000594b:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005950:	85 c0                	test   %eax,%eax
c0005952:	7f 06                	jg     c000595a <read_from_keyboard_buf+0x19>
c0005954:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005958:	eb 4b                	jmp    c00059a5 <read_from_keyboard_buf+0x64>
c000595a:	e8 59 be ff ff       	call   c00017b8 <disable_int>
c000595f:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0005964:	0f b6 00             	movzbl (%eax),%eax
c0005967:	88 45 f7             	mov    %al,-0x9(%ebp)
c000596a:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c000596f:	83 c0 01             	add    $0x1,%eax
c0005972:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0005977:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c000597c:	83 e8 01             	sub    $0x1,%eax
c000597f:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c0005984:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0005989:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c000598e:	39 d0                	cmp    %edx,%eax
c0005990:	72 0a                	jb     c000599c <read_from_keyboard_buf+0x5b>
c0005992:	c7 05 84 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb84
c0005999:	fb 00 c0 
c000599c:	e8 19 be ff ff       	call   c00017ba <enable_int>
c00059a1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c00059a5:	c9                   	leave  
c00059a6:	c3                   	ret    

c00059a7 <keyboard_read>:
c00059a7:	55                   	push   %ebp
c00059a8:	89 e5                	mov    %esp,%ebp
c00059aa:	83 ec 28             	sub    $0x28,%esp
c00059ad:	90                   	nop
c00059ae:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00059b3:	85 c0                	test   %eax,%eax
c00059b5:	7e f7                	jle    c00059ae <keyboard_read+0x7>
c00059b7:	e8 85 ff ff ff       	call   c0005941 <read_from_keyboard_buf>
c00059bc:	88 45 ea             	mov    %al,-0x16(%ebp)
c00059bf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00059c6:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00059ca:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c00059ce:	75 5a                	jne    c0005a2a <keyboard_read+0x83>
c00059d0:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c00059d4:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c00059d8:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c00059dc:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c00059e0:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c00059e4:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c00059e8:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c00059ec:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00059f3:	eb 20                	jmp    c0005a15 <keyboard_read+0x6e>
c00059f5:	e8 47 ff ff ff       	call   c0005941 <read_from_keyboard_buf>
c00059fa:	89 c1                	mov    %eax,%ecx
c00059fc:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c00059ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0005a02:	01 d0                	add    %edx,%eax
c0005a04:	0f b6 00             	movzbl (%eax),%eax
c0005a07:	38 c1                	cmp    %al,%cl
c0005a09:	74 06                	je     c0005a11 <keyboard_read+0x6a>
c0005a0b:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005a0f:	eb 0a                	jmp    c0005a1b <keyboard_read+0x74>
c0005a11:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005a15:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005a19:	7e da                	jle    c00059f5 <keyboard_read+0x4e>
c0005a1b:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005a1f:	74 68                	je     c0005a89 <keyboard_read+0xe2>
c0005a21:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005a28:	eb 5f                	jmp    c0005a89 <keyboard_read+0xe2>
c0005a2a:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005a2e:	75 59                	jne    c0005a89 <keyboard_read+0xe2>
c0005a30:	e8 0c ff ff ff       	call   c0005941 <read_from_keyboard_buf>
c0005a35:	3c 2a                	cmp    $0x2a,%al
c0005a37:	75 1d                	jne    c0005a56 <keyboard_read+0xaf>
c0005a39:	e8 03 ff ff ff       	call   c0005941 <read_from_keyboard_buf>
c0005a3e:	3c e0                	cmp    $0xe0,%al
c0005a40:	75 14                	jne    c0005a56 <keyboard_read+0xaf>
c0005a42:	e8 fa fe ff ff       	call   c0005941 <read_from_keyboard_buf>
c0005a47:	3c 37                	cmp    $0x37,%al
c0005a49:	75 0b                	jne    c0005a56 <keyboard_read+0xaf>
c0005a4b:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005a52:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005a56:	e8 e6 fe ff ff       	call   c0005941 <read_from_keyboard_buf>
c0005a5b:	3c b7                	cmp    $0xb7,%al
c0005a5d:	75 1d                	jne    c0005a7c <keyboard_read+0xd5>
c0005a5f:	e8 dd fe ff ff       	call   c0005941 <read_from_keyboard_buf>
c0005a64:	3c e0                	cmp    $0xe0,%al
c0005a66:	75 14                	jne    c0005a7c <keyboard_read+0xd5>
c0005a68:	e8 d4 fe ff ff       	call   c0005941 <read_from_keyboard_buf>
c0005a6d:	3c aa                	cmp    $0xaa,%al
c0005a6f:	75 0b                	jne    c0005a7c <keyboard_read+0xd5>
c0005a71:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005a78:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005a7c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005a80:	75 07                	jne    c0005a89 <keyboard_read+0xe2>
c0005a82:	c6 05 24 f7 00 c0 01 	movb   $0x1,0xc000f724
c0005a89:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005a90:	0f 84 8d 00 00 00    	je     c0005b23 <keyboard_read+0x17c>
c0005a96:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005a9d:	0f 84 80 00 00 00    	je     c0005b23 <keyboard_read+0x17c>
c0005aa3:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005aa7:	0f 94 c2             	sete   %dl
c0005aaa:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005aae:	0f 94 c0             	sete   %al
c0005ab1:	09 d0                	or     %edx,%eax
c0005ab3:	84 c0                	test   %al,%al
c0005ab5:	74 07                	je     c0005abe <keyboard_read+0x117>
c0005ab7:	c6 05 a4 16 01 c0 01 	movb   $0x1,0xc00116a4
c0005abe:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005ac2:	f7 d0                	not    %eax
c0005ac4:	c0 e8 07             	shr    $0x7,%al
c0005ac7:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005aca:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005ace:	74 53                	je     c0005b23 <keyboard_read+0x17c>
c0005ad0:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005ad4:	74 4d                	je     c0005b23 <keyboard_read+0x17c>
c0005ad6:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005ada:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0005ae1:	3c 01                	cmp    $0x1,%al
c0005ae3:	75 04                	jne    c0005ae9 <keyboard_read+0x142>
c0005ae5:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005ae9:	0f b6 05 24 f7 00 c0 	movzbl 0xc000f724,%eax
c0005af0:	84 c0                	test   %al,%al
c0005af2:	74 04                	je     c0005af8 <keyboard_read+0x151>
c0005af4:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005af8:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005afc:	89 d0                	mov    %edx,%eax
c0005afe:	01 c0                	add    %eax,%eax
c0005b00:	01 c2                	add    %eax,%edx
c0005b02:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005b06:	01 d0                	add    %edx,%eax
c0005b08:	8b 04 85 00 e1 00 c0 	mov    -0x3fff1f00(,%eax,4),%eax
c0005b0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005b12:	83 ec 08             	sub    $0x8,%esp
c0005b15:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b18:	ff 75 08             	pushl  0x8(%ebp)
c0005b1b:	e8 1a 00 00 00       	call   c0005b3a <in_process>
c0005b20:	83 c4 10             	add    $0x10,%esp
c0005b23:	90                   	nop
c0005b24:	c9                   	leave  
c0005b25:	c3                   	ret    

c0005b26 <init_keyboard_handler>:
c0005b26:	55                   	push   %ebp
c0005b27:	89 e5                	mov    %esp,%ebp
c0005b29:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005b30:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005b37:	90                   	nop
c0005b38:	5d                   	pop    %ebp
c0005b39:	c3                   	ret    

c0005b3a <in_process>:
c0005b3a:	55                   	push   %ebp
c0005b3b:	89 e5                	mov    %esp,%ebp
c0005b3d:	83 ec 18             	sub    $0x18,%esp
c0005b40:	83 ec 04             	sub    $0x4,%esp
c0005b43:	6a 02                	push   $0x2
c0005b45:	6a 00                	push   $0x0
c0005b47:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005b4a:	50                   	push   %eax
c0005b4b:	e8 22 58 00 00       	call   c000b372 <Memset>
c0005b50:	83 c4 10             	add    $0x10,%esp
c0005b53:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b56:	25 00 01 00 00       	and    $0x100,%eax
c0005b5b:	85 c0                	test   %eax,%eax
c0005b5d:	75 28                	jne    c0005b87 <in_process+0x4d>
c0005b5f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b62:	0f b6 c0             	movzbl %al,%eax
c0005b65:	83 ec 08             	sub    $0x8,%esp
c0005b68:	50                   	push   %eax
c0005b69:	ff 75 08             	pushl  0x8(%ebp)
c0005b6c:	e8 ce f3 ff ff       	call   c0004f3f <put_key>
c0005b71:	83 c4 10             	add    $0x10,%esp
c0005b74:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005b7b:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005b82:	e9 42 01 00 00       	jmp    c0005cc9 <in_process+0x18f>
c0005b87:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0005b8e:	84 c0                	test   %al,%al
c0005b90:	0f 84 a9 00 00 00    	je     c0005c3f <in_process+0x105>
c0005b96:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005b9a:	0f 84 9f 00 00 00    	je     c0005c3f <in_process+0x105>
c0005ba0:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005ba4:	0f 84 95 00 00 00    	je     c0005c3f <in_process+0x105>
c0005baa:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005bb1:	74 64                	je     c0005c17 <in_process+0xdd>
c0005bb3:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005bba:	77 0b                	ja     c0005bc7 <in_process+0x8d>
c0005bbc:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005bc3:	74 64                	je     c0005c29 <in_process+0xef>
c0005bc5:	eb 73                	jmp    c0005c3a <in_process+0x100>
c0005bc7:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005bce:	74 0b                	je     c0005bdb <in_process+0xa1>
c0005bd0:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005bd7:	74 20                	je     c0005bf9 <in_process+0xbf>
c0005bd9:	eb 5f                	jmp    c0005c3a <in_process+0x100>
c0005bdb:	83 ec 0c             	sub    $0xc,%esp
c0005bde:	ff 75 08             	pushl  0x8(%ebp)
c0005be1:	e8 c5 f3 ff ff       	call   c0004fab <scroll_up>
c0005be6:	83 c4 10             	add    $0x10,%esp
c0005be9:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005bf0:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005bf7:	eb 41                	jmp    c0005c3a <in_process+0x100>
c0005bf9:	83 ec 0c             	sub    $0xc,%esp
c0005bfc:	ff 75 08             	pushl  0x8(%ebp)
c0005bff:	e8 e9 f3 ff ff       	call   c0004fed <scroll_down>
c0005c04:	83 c4 10             	add    $0x10,%esp
c0005c07:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005c0e:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005c15:	eb 23                	jmp    c0005c3a <in_process+0x100>
c0005c17:	83 ec 08             	sub    $0x8,%esp
c0005c1a:	6a 0a                	push   $0xa
c0005c1c:	ff 75 08             	pushl  0x8(%ebp)
c0005c1f:	e8 34 f4 ff ff       	call   c0005058 <out_char>
c0005c24:	83 c4 10             	add    $0x10,%esp
c0005c27:	eb 11                	jmp    c0005c3a <in_process+0x100>
c0005c29:	83 ec 08             	sub    $0x8,%esp
c0005c2c:	6a 08                	push   $0x8
c0005c2e:	ff 75 08             	pushl  0x8(%ebp)
c0005c31:	e8 22 f4 ff ff       	call   c0005058 <out_char>
c0005c36:	83 c4 10             	add    $0x10,%esp
c0005c39:	90                   	nop
c0005c3a:	e9 8a 00 00 00       	jmp    c0005cc9 <in_process+0x18f>
c0005c3f:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005c46:	74 55                	je     c0005c9d <in_process+0x163>
c0005c48:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005c4f:	77 14                	ja     c0005c65 <in_process+0x12b>
c0005c51:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005c58:	74 31                	je     c0005c8b <in_process+0x151>
c0005c5a:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005c61:	74 16                	je     c0005c79 <in_process+0x13f>
c0005c63:	eb 64                	jmp    c0005cc9 <in_process+0x18f>
c0005c65:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005c6c:	74 3e                	je     c0005cac <in_process+0x172>
c0005c6e:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005c75:	74 44                	je     c0005cbb <in_process+0x181>
c0005c77:	eb 50                	jmp    c0005cc9 <in_process+0x18f>
c0005c79:	83 ec 08             	sub    $0x8,%esp
c0005c7c:	6a 0a                	push   $0xa
c0005c7e:	ff 75 08             	pushl  0x8(%ebp)
c0005c81:	e8 b9 f2 ff ff       	call   c0004f3f <put_key>
c0005c86:	83 c4 10             	add    $0x10,%esp
c0005c89:	eb 3e                	jmp    c0005cc9 <in_process+0x18f>
c0005c8b:	83 ec 08             	sub    $0x8,%esp
c0005c8e:	6a 08                	push   $0x8
c0005c90:	ff 75 08             	pushl  0x8(%ebp)
c0005c93:	e8 a7 f2 ff ff       	call   c0004f3f <put_key>
c0005c98:	83 c4 10             	add    $0x10,%esp
c0005c9b:	eb 2c                	jmp    c0005cc9 <in_process+0x18f>
c0005c9d:	83 ec 0c             	sub    $0xc,%esp
c0005ca0:	6a 00                	push   $0x0
c0005ca2:	e8 67 f1 ff ff       	call   c0004e0e <select_console>
c0005ca7:	83 c4 10             	add    $0x10,%esp
c0005caa:	eb 1d                	jmp    c0005cc9 <in_process+0x18f>
c0005cac:	83 ec 0c             	sub    $0xc,%esp
c0005caf:	6a 01                	push   $0x1
c0005cb1:	e8 58 f1 ff ff       	call   c0004e0e <select_console>
c0005cb6:	83 c4 10             	add    $0x10,%esp
c0005cb9:	eb 0e                	jmp    c0005cc9 <in_process+0x18f>
c0005cbb:	83 ec 0c             	sub    $0xc,%esp
c0005cbe:	6a 02                	push   $0x2
c0005cc0:	e8 49 f1 ff ff       	call   c0004e0e <select_console>
c0005cc5:	83 c4 10             	add    $0x10,%esp
c0005cc8:	90                   	nop
c0005cc9:	90                   	nop
c0005cca:	c9                   	leave  
c0005ccb:	c3                   	ret    

c0005ccc <open>:
c0005ccc:	55                   	push   %ebp
c0005ccd:	89 e5                	mov    %esp,%ebp
c0005ccf:	83 ec 18             	sub    $0x18,%esp
c0005cd2:	83 ec 0c             	sub    $0xc,%esp
c0005cd5:	6a 6c                	push   $0x6c
c0005cd7:	e8 fd 11 00 00       	call   c0006ed9 <sys_malloc>
c0005cdc:	83 c4 10             	add    $0x10,%esp
c0005cdf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005ce2:	83 ec 04             	sub    $0x4,%esp
c0005ce5:	6a 6c                	push   $0x6c
c0005ce7:	6a 00                	push   $0x0
c0005ce9:	ff 75 f4             	pushl  -0xc(%ebp)
c0005cec:	e8 81 56 00 00       	call   c000b372 <Memset>
c0005cf1:	83 c4 10             	add    $0x10,%esp
c0005cf4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005cf7:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0005cfe:	83 ec 0c             	sub    $0xc,%esp
c0005d01:	ff 75 08             	pushl  0x8(%ebp)
c0005d04:	e8 fc 10 00 00       	call   c0006e05 <get_physical_address>
c0005d09:	83 c4 10             	add    $0x10,%esp
c0005d0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005d0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d12:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005d15:	89 50 34             	mov    %edx,0x34(%eax)
c0005d18:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005d1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d1e:	89 50 64             	mov    %edx,0x64(%eax)
c0005d21:	83 ec 0c             	sub    $0xc,%esp
c0005d24:	ff 75 08             	pushl  0x8(%ebp)
c0005d27:	e8 7f 56 00 00       	call   c000b3ab <Strlen>
c0005d2c:	83 c4 10             	add    $0x10,%esp
c0005d2f:	89 c2                	mov    %eax,%edx
c0005d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d34:	89 50 30             	mov    %edx,0x30(%eax)
c0005d37:	83 ec 04             	sub    $0x4,%esp
c0005d3a:	6a 04                	push   $0x4
c0005d3c:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d3f:	6a 03                	push   $0x3
c0005d41:	e8 2d 3d 00 00       	call   c0009a73 <send_rec>
c0005d46:	83 c4 10             	add    $0x10,%esp
c0005d49:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d4c:	8b 40 40             	mov    0x40(%eax),%eax
c0005d4f:	c9                   	leave  
c0005d50:	c3                   	ret    

c0005d51 <read>:
c0005d51:	55                   	push   %ebp
c0005d52:	89 e5                	mov    %esp,%ebp
c0005d54:	83 ec 18             	sub    $0x18,%esp
c0005d57:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005d5e:	83 ec 0c             	sub    $0xc,%esp
c0005d61:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d64:	e8 70 11 00 00       	call   c0006ed9 <sys_malloc>
c0005d69:	83 c4 10             	add    $0x10,%esp
c0005d6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005d6f:	83 ec 0c             	sub    $0xc,%esp
c0005d72:	ff 75 0c             	pushl  0xc(%ebp)
c0005d75:	e8 8b 10 00 00       	call   c0006e05 <get_physical_address>
c0005d7a:	83 c4 10             	add    $0x10,%esp
c0005d7d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005d80:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d83:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0005d8a:	8b 55 08             	mov    0x8(%ebp),%edx
c0005d8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d90:	89 50 40             	mov    %edx,0x40(%eax)
c0005d93:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d96:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005d99:	89 50 10             	mov    %edx,0x10(%eax)
c0005d9c:	8b 55 10             	mov    0x10(%ebp),%edx
c0005d9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005da2:	89 50 50             	mov    %edx,0x50(%eax)
c0005da5:	83 ec 04             	sub    $0x4,%esp
c0005da8:	6a 04                	push   $0x4
c0005daa:	ff 75 f0             	pushl  -0x10(%ebp)
c0005dad:	6a 03                	push   $0x3
c0005daf:	e8 bf 3c 00 00       	call   c0009a73 <send_rec>
c0005db4:	83 c4 10             	add    $0x10,%esp
c0005db7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005dba:	8b 40 50             	mov    0x50(%eax),%eax
c0005dbd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005dc0:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005dc3:	c9                   	leave  
c0005dc4:	c3                   	ret    

c0005dc5 <write>:
c0005dc5:	55                   	push   %ebp
c0005dc6:	89 e5                	mov    %esp,%ebp
c0005dc8:	83 ec 18             	sub    $0x18,%esp
c0005dcb:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005dd2:	83 ec 0c             	sub    $0xc,%esp
c0005dd5:	ff 75 f4             	pushl  -0xc(%ebp)
c0005dd8:	e8 fc 10 00 00       	call   c0006ed9 <sys_malloc>
c0005ddd:	83 c4 10             	add    $0x10,%esp
c0005de0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005de3:	83 ec 0c             	sub    $0xc,%esp
c0005de6:	ff 75 0c             	pushl  0xc(%ebp)
c0005de9:	e8 17 10 00 00       	call   c0006e05 <get_physical_address>
c0005dee:	83 c4 10             	add    $0x10,%esp
c0005df1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005df4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005df7:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0005dfe:	8b 55 08             	mov    0x8(%ebp),%edx
c0005e01:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e04:	89 50 40             	mov    %edx,0x40(%eax)
c0005e07:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e0a:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005e0d:	89 50 10             	mov    %edx,0x10(%eax)
c0005e10:	8b 55 10             	mov    0x10(%ebp),%edx
c0005e13:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e16:	89 50 50             	mov    %edx,0x50(%eax)
c0005e19:	83 ec 04             	sub    $0x4,%esp
c0005e1c:	6a 04                	push   $0x4
c0005e1e:	ff 75 f0             	pushl  -0x10(%ebp)
c0005e21:	6a 03                	push   $0x3
c0005e23:	e8 4b 3c 00 00       	call   c0009a73 <send_rec>
c0005e28:	83 c4 10             	add    $0x10,%esp
c0005e2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e2e:	8b 40 50             	mov    0x50(%eax),%eax
c0005e31:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005e34:	83 ec 08             	sub    $0x8,%esp
c0005e37:	ff 75 f4             	pushl  -0xc(%ebp)
c0005e3a:	ff 75 f0             	pushl  -0x10(%ebp)
c0005e3d:	e8 76 13 00 00       	call   c00071b8 <sys_free>
c0005e42:	83 c4 10             	add    $0x10,%esp
c0005e45:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e48:	c9                   	leave  
c0005e49:	c3                   	ret    

c0005e4a <close>:
c0005e4a:	55                   	push   %ebp
c0005e4b:	89 e5                	mov    %esp,%ebp
c0005e4d:	83 ec 78             	sub    $0x78,%esp
c0005e50:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005e57:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e5a:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005e5d:	83 ec 04             	sub    $0x4,%esp
c0005e60:	6a 04                	push   $0x4
c0005e62:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e65:	50                   	push   %eax
c0005e66:	6a 03                	push   $0x3
c0005e68:	e8 06 3c 00 00       	call   c0009a73 <send_rec>
c0005e6d:	83 c4 10             	add    $0x10,%esp
c0005e70:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005e73:	83 f8 65             	cmp    $0x65,%eax
c0005e76:	74 19                	je     c0005e91 <close+0x47>
c0005e78:	6a 13                	push   $0x13
c0005e7a:	68 87 ab 00 c0       	push   $0xc000ab87
c0005e7f:	68 87 ab 00 c0       	push   $0xc000ab87
c0005e84:	68 93 ab 00 c0       	push   $0xc000ab93
c0005e89:	e8 9a 33 00 00       	call   c0009228 <assertion_failure>
c0005e8e:	83 c4 10             	add    $0x10,%esp
c0005e91:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005e94:	c9                   	leave  
c0005e95:	c3                   	ret    

c0005e96 <wait>:
c0005e96:	55                   	push   %ebp
c0005e97:	89 e5                	mov    %esp,%ebp
c0005e99:	83 ec 78             	sub    $0x78,%esp
c0005e9c:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005ea3:	83 ec 04             	sub    $0x4,%esp
c0005ea6:	6a 05                	push   $0x5
c0005ea8:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005eab:	50                   	push   %eax
c0005eac:	6a 03                	push   $0x3
c0005eae:	e8 c0 3b 00 00       	call   c0009a73 <send_rec>
c0005eb3:	83 c4 10             	add    $0x10,%esp
c0005eb6:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005eb9:	89 c2                	mov    %eax,%edx
c0005ebb:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ebe:	89 10                	mov    %edx,(%eax)
c0005ec0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ec3:	83 f8 1d             	cmp    $0x1d,%eax
c0005ec6:	74 05                	je     c0005ecd <wait+0x37>
c0005ec8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ecb:	eb 05                	jmp    c0005ed2 <wait+0x3c>
c0005ecd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005ed2:	c9                   	leave  
c0005ed3:	c3                   	ret    

c0005ed4 <exit>:
c0005ed4:	55                   	push   %ebp
c0005ed5:	89 e5                	mov    %esp,%ebp
c0005ed7:	83 ec 78             	sub    $0x78,%esp
c0005eda:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005ee1:	8b 45 08             	mov    0x8(%ebp),%eax
c0005ee4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005ee7:	83 ec 04             	sub    $0x4,%esp
c0005eea:	6a 05                	push   $0x5
c0005eec:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005eef:	50                   	push   %eax
c0005ef0:	6a 03                	push   $0x3
c0005ef2:	e8 7c 3b 00 00       	call   c0009a73 <send_rec>
c0005ef7:	83 c4 10             	add    $0x10,%esp
c0005efa:	90                   	nop
c0005efb:	c9                   	leave  
c0005efc:	c3                   	ret    

c0005efd <fork>:
c0005efd:	55                   	push   %ebp
c0005efe:	89 e5                	mov    %esp,%ebp
c0005f00:	83 ec 78             	sub    $0x78,%esp
c0005f03:	83 ec 04             	sub    $0x4,%esp
c0005f06:	6a 6c                	push   $0x6c
c0005f08:	6a 00                	push   $0x0
c0005f0a:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f0d:	50                   	push   %eax
c0005f0e:	e8 5f 54 00 00       	call   c000b372 <Memset>
c0005f13:	83 c4 10             	add    $0x10,%esp
c0005f16:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005f1d:	83 ec 04             	sub    $0x4,%esp
c0005f20:	6a 05                	push   $0x5
c0005f22:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f25:	50                   	push   %eax
c0005f26:	6a 03                	push   $0x3
c0005f28:	e8 46 3b 00 00       	call   c0009a73 <send_rec>
c0005f2d:	83 c4 10             	add    $0x10,%esp
c0005f30:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005f37:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005f3a:	85 c0                	test   %eax,%eax
c0005f3c:	74 19                	je     c0005f57 <fork+0x5a>
c0005f3e:	6a 14                	push   $0x14
c0005f40:	68 ab ab 00 c0       	push   $0xc000abab
c0005f45:	68 ab ab 00 c0       	push   $0xc000abab
c0005f4a:	68 b6 ab 00 c0       	push   $0xc000abb6
c0005f4f:	e8 d4 32 00 00       	call   c0009228 <assertion_failure>
c0005f54:	83 c4 10             	add    $0x10,%esp
c0005f57:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f5a:	c9                   	leave  
c0005f5b:	c3                   	ret    

c0005f5c <getpid>:
c0005f5c:	55                   	push   %ebp
c0005f5d:	89 e5                	mov    %esp,%ebp
c0005f5f:	83 ec 78             	sub    $0x78,%esp
c0005f62:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005f69:	83 ec 04             	sub    $0x4,%esp
c0005f6c:	6a 03                	push   $0x3
c0005f6e:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f71:	50                   	push   %eax
c0005f72:	6a 03                	push   $0x3
c0005f74:	e8 fa 3a 00 00       	call   c0009a73 <send_rec>
c0005f79:	83 c4 10             	add    $0x10,%esp
c0005f7c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f7f:	c9                   	leave  
c0005f80:	c3                   	ret    

c0005f81 <exec>:
c0005f81:	55                   	push   %ebp
c0005f82:	89 e5                	mov    %esp,%ebp
c0005f84:	83 ec 78             	sub    $0x78,%esp
c0005f87:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005f8e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005f91:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005f94:	83 ec 0c             	sub    $0xc,%esp
c0005f97:	ff 75 08             	pushl  0x8(%ebp)
c0005f9a:	e8 0c 54 00 00       	call   c000b3ab <Strlen>
c0005f9f:	83 c4 10             	add    $0x10,%esp
c0005fa2:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005fa5:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0005fac:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0005fb3:	83 ec 04             	sub    $0x4,%esp
c0005fb6:	6a 05                	push   $0x5
c0005fb8:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005fbb:	50                   	push   %eax
c0005fbc:	6a 03                	push   $0x3
c0005fbe:	e8 b0 3a 00 00       	call   c0009a73 <send_rec>
c0005fc3:	83 c4 10             	add    $0x10,%esp
c0005fc6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005fc9:	83 f8 65             	cmp    $0x65,%eax
c0005fcc:	74 19                	je     c0005fe7 <exec+0x66>
c0005fce:	6a 19                	push   $0x19
c0005fd0:	68 c6 ab 00 c0       	push   $0xc000abc6
c0005fd5:	68 c6 ab 00 c0       	push   $0xc000abc6
c0005fda:	68 d1 ab 00 c0       	push   $0xc000abd1
c0005fdf:	e8 44 32 00 00       	call   c0009228 <assertion_failure>
c0005fe4:	83 c4 10             	add    $0x10,%esp
c0005fe7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005fea:	c9                   	leave  
c0005feb:	c3                   	ret    

c0005fec <execv>:
c0005fec:	55                   	push   %ebp
c0005fed:	89 e5                	mov    %esp,%ebp
c0005fef:	57                   	push   %edi
c0005ff0:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0005ff6:	83 ec 04             	sub    $0x4,%esp
c0005ff9:	68 00 80 00 00       	push   $0x8000
c0005ffe:	6a 00                	push   $0x0
c0006000:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006006:	50                   	push   %eax
c0006007:	e8 66 53 00 00       	call   c000b372 <Memset>
c000600c:	83 c4 10             	add    $0x10,%esp
c000600f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006012:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006015:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000601c:	eb 0d                	jmp    c000602b <execv+0x3f>
c000601e:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c0006022:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006025:	83 c0 04             	add    $0x4,%eax
c0006028:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000602b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000602e:	8b 00                	mov    (%eax),%eax
c0006030:	85 c0                	test   %eax,%eax
c0006032:	75 ea                	jne    c000601e <execv+0x32>
c0006034:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c000603a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000603d:	01 d0                	add    %edx,%eax
c000603f:	c6 00 00             	movb   $0x0,(%eax)
c0006042:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006045:	83 c0 04             	add    $0x4,%eax
c0006048:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000604b:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006051:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006054:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006057:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000605a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006061:	eb 64                	jmp    c00060c7 <execv+0xdb>
c0006063:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006069:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000606c:	01 c2                	add    %eax,%edx
c000606e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006071:	89 10                	mov    %edx,(%eax)
c0006073:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006076:	8b 00                	mov    (%eax),%eax
c0006078:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c000607e:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006081:	01 ca                	add    %ecx,%edx
c0006083:	83 ec 08             	sub    $0x8,%esp
c0006086:	50                   	push   %eax
c0006087:	52                   	push   %edx
c0006088:	e8 04 53 00 00       	call   c000b391 <Strcpy>
c000608d:	83 c4 10             	add    $0x10,%esp
c0006090:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006093:	8b 00                	mov    (%eax),%eax
c0006095:	83 ec 0c             	sub    $0xc,%esp
c0006098:	50                   	push   %eax
c0006099:	e8 0d 53 00 00       	call   c000b3ab <Strlen>
c000609e:	83 c4 10             	add    $0x10,%esp
c00060a1:	01 45 f0             	add    %eax,-0x10(%ebp)
c00060a4:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00060aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060ad:	01 d0                	add    %edx,%eax
c00060af:	c6 00 00             	movb   $0x0,(%eax)
c00060b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060b5:	83 c0 01             	add    $0x1,%eax
c00060b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00060bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c00060bf:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00060c3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00060c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00060ca:	8b 00                	mov    (%eax),%eax
c00060cc:	85 c0                	test   %eax,%eax
c00060ce:	75 93                	jne    c0006063 <execv+0x77>
c00060d0:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00060d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00060d9:	eb 04                	jmp    c00060df <execv+0xf3>
c00060db:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00060df:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00060e2:	8b 00                	mov    (%eax),%eax
c00060e4:	85 c0                	test   %eax,%eax
c00060e6:	75 f3                	jne    c00060db <execv+0xef>
c00060e8:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c00060ee:	b8 00 00 00 00       	mov    $0x0,%eax
c00060f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00060f8:	89 d7                	mov    %edx,%edi
c00060fa:	f3 ab                	rep stos %eax,%es:(%edi)
c00060fc:	c7 85 4c 7f ff ff e9 	movl   $0xc000abe9,-0x80b4(%ebp)
c0006103:	ab 00 c0 
c0006106:	c7 85 50 7f ff ff f0 	movl   $0xc000abf0,-0x80b0(%ebp)
c000610d:	ab 00 c0 
c0006110:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0006117:	00 00 00 
c000611a:	8b 45 08             	mov    0x8(%ebp),%eax
c000611d:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c0006123:	83 ec 0c             	sub    $0xc,%esp
c0006126:	ff 75 08             	pushl  0x8(%ebp)
c0006129:	e8 7d 52 00 00       	call   c000b3ab <Strlen>
c000612e:	83 c4 10             	add    $0x10,%esp
c0006131:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0006137:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000613d:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c0006143:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006146:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c000614c:	83 ec 04             	sub    $0x4,%esp
c000614f:	6a 05                	push   $0x5
c0006151:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0006157:	50                   	push   %eax
c0006158:	6a 03                	push   $0x3
c000615a:	e8 14 39 00 00       	call   c0009a73 <send_rec>
c000615f:	83 c4 10             	add    $0x10,%esp
c0006162:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0006168:	83 f8 65             	cmp    $0x65,%eax
c000616b:	74 19                	je     c0006186 <execv+0x19a>
c000616d:	6a 72                	push   $0x72
c000616f:	68 c6 ab 00 c0       	push   $0xc000abc6
c0006174:	68 c6 ab 00 c0       	push   $0xc000abc6
c0006179:	68 d1 ab 00 c0       	push   $0xc000abd1
c000617e:	e8 a5 30 00 00       	call   c0009228 <assertion_failure>
c0006183:	83 c4 10             	add    $0x10,%esp
c0006186:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c000618c:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000618f:	c9                   	leave  
c0006190:	c3                   	ret    

c0006191 <execl>:
c0006191:	55                   	push   %ebp
c0006192:	89 e5                	mov    %esp,%ebp
c0006194:	83 ec 18             	sub    $0x18,%esp
c0006197:	8d 45 0c             	lea    0xc(%ebp),%eax
c000619a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000619d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00061a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061a3:	83 ec 08             	sub    $0x8,%esp
c00061a6:	ff 75 f0             	pushl  -0x10(%ebp)
c00061a9:	ff 75 08             	pushl  0x8(%ebp)
c00061ac:	e8 3b fe ff ff       	call   c0005fec <execv>
c00061b1:	83 c4 10             	add    $0x10,%esp
c00061b4:	c9                   	leave  
c00061b5:	c3                   	ret    

c00061b6 <TaskMM>:
c00061b6:	55                   	push   %ebp
c00061b7:	89 e5                	mov    %esp,%ebp
c00061b9:	83 ec 28             	sub    $0x28,%esp
c00061bc:	83 ec 0c             	sub    $0xc,%esp
c00061bf:	68 f7 ab 00 c0       	push   $0xc000abf7
c00061c4:	e8 c3 b3 ff ff       	call   c000158c <disp_str>
c00061c9:	83 c4 10             	add    $0x10,%esp
c00061cc:	e8 c3 b6 ff ff       	call   c0001894 <get_running_thread_pcb>
c00061d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061d4:	83 ec 0c             	sub    $0xc,%esp
c00061d7:	68 fb ab 00 c0       	push   $0xc000abfb
c00061dc:	e8 ab b3 ff ff       	call   c000158c <disp_str>
c00061e1:	83 c4 10             	add    $0x10,%esp
c00061e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061e7:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00061ed:	83 ec 0c             	sub    $0xc,%esp
c00061f0:	50                   	push   %eax
c00061f1:	e8 5c 18 00 00       	call   c0007a52 <disp_int>
c00061f6:	83 c4 10             	add    $0x10,%esp
c00061f9:	83 ec 0c             	sub    $0xc,%esp
c00061fc:	68 fd ab 00 c0       	push   $0xc000abfd
c0006201:	e8 86 b3 ff ff       	call   c000158c <disp_str>
c0006206:	83 c4 10             	add    $0x10,%esp
c0006209:	83 ec 0c             	sub    $0xc,%esp
c000620c:	68 ff ab 00 c0       	push   $0xc000abff
c0006211:	e8 76 b3 ff ff       	call   c000158c <disp_str>
c0006216:	83 c4 10             	add    $0x10,%esp
c0006219:	83 ec 0c             	sub    $0xc,%esp
c000621c:	6a 6c                	push   $0x6c
c000621e:	e8 b6 0c 00 00       	call   c0006ed9 <sys_malloc>
c0006223:	83 c4 10             	add    $0x10,%esp
c0006226:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006229:	83 ec 0c             	sub    $0xc,%esp
c000622c:	6a 6c                	push   $0x6c
c000622e:	e8 a6 0c 00 00       	call   c0006ed9 <sys_malloc>
c0006233:	83 c4 10             	add    $0x10,%esp
c0006236:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006239:	83 ec 0c             	sub    $0xc,%esp
c000623c:	68 01 ac 00 c0       	push   $0xc000ac01
c0006241:	e8 46 b3 ff ff       	call   c000158c <disp_str>
c0006246:	83 c4 10             	add    $0x10,%esp
c0006249:	83 ec 04             	sub    $0x4,%esp
c000624c:	6a 0e                	push   $0xe
c000624e:	ff 75 ec             	pushl  -0x14(%ebp)
c0006251:	6a 02                	push   $0x2
c0006253:	e8 1b 38 00 00       	call   c0009a73 <send_rec>
c0006258:	83 c4 10             	add    $0x10,%esp
c000625b:	83 ec 0c             	sub    $0xc,%esp
c000625e:	68 10 ac 00 c0       	push   $0xc000ac10
c0006263:	e8 24 b3 ff ff       	call   c000158c <disp_str>
c0006268:	83 c4 10             	add    $0x10,%esp
c000626b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000626e:	8b 40 68             	mov    0x68(%eax),%eax
c0006271:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006274:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006277:	8b 00                	mov    (%eax),%eax
c0006279:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000627c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006283:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006286:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000628d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006290:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c0006297:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
c000629b:	74 4b                	je     c00062e8 <TaskMM+0x132>
c000629d:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
c00062a1:	7f 08                	jg     c00062ab <TaskMM+0xf5>
c00062a3:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
c00062a7:	74 28                	je     c00062d1 <TaskMM+0x11b>
c00062a9:	eb 6e                	jmp    c0006319 <TaskMM+0x163>
c00062ab:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
c00062af:	74 08                	je     c00062b9 <TaskMM+0x103>
c00062b1:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c00062b5:	74 4b                	je     c0006302 <TaskMM+0x14c>
c00062b7:	eb 60                	jmp    c0006319 <TaskMM+0x163>
c00062b9:	83 ec 0c             	sub    $0xc,%esp
c00062bc:	ff 75 ec             	pushl  -0x14(%ebp)
c00062bf:	e8 ec 03 00 00       	call   c00066b0 <do_fork>
c00062c4:	83 c4 10             	add    $0x10,%esp
c00062c7:	89 c2                	mov    %eax,%edx
c00062c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00062cc:	89 50 4c             	mov    %edx,0x4c(%eax)
c00062cf:	eb 59                	jmp    c000632a <TaskMM+0x174>
c00062d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062d8:	83 ec 0c             	sub    $0xc,%esp
c00062db:	ff 75 ec             	pushl  -0x14(%ebp)
c00062de:	e8 9c 00 00 00       	call   c000637f <do_exec>
c00062e3:	83 c4 10             	add    $0x10,%esp
c00062e6:	eb 42                	jmp    c000632a <TaskMM+0x174>
c00062e8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062ef:	83 ec 08             	sub    $0x8,%esp
c00062f2:	ff 75 dc             	pushl  -0x24(%ebp)
c00062f5:	ff 75 ec             	pushl  -0x14(%ebp)
c00062f8:	e8 1e 04 00 00       	call   c000671b <do_exit>
c00062fd:	83 c4 10             	add    $0x10,%esp
c0006300:	eb 28                	jmp    c000632a <TaskMM+0x174>
c0006302:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006309:	83 ec 0c             	sub    $0xc,%esp
c000630c:	ff 75 ec             	pushl  -0x14(%ebp)
c000630f:	e8 03 05 00 00       	call   c0006817 <do_wait>
c0006314:	83 c4 10             	add    $0x10,%esp
c0006317:	eb 11                	jmp    c000632a <TaskMM+0x174>
c0006319:	83 ec 0c             	sub    $0xc,%esp
c000631c:	68 25 ac 00 c0       	push   $0xc000ac25
c0006321:	e8 e4 2e 00 00       	call   c000920a <panic>
c0006326:	83 c4 10             	add    $0x10,%esp
c0006329:	90                   	nop
c000632a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000632e:	0f 84 05 ff ff ff    	je     c0006239 <TaskMM+0x83>
c0006334:	83 ec 04             	sub    $0x4,%esp
c0006337:	ff 75 e0             	pushl  -0x20(%ebp)
c000633a:	ff 75 e8             	pushl  -0x18(%ebp)
c000633d:	6a 01                	push   $0x1
c000633f:	e8 2f 37 00 00       	call   c0009a73 <send_rec>
c0006344:	83 c4 10             	add    $0x10,%esp
c0006347:	e9 ed fe ff ff       	jmp    c0006239 <TaskMM+0x83>

c000634c <alloc_mem>:
c000634c:	55                   	push   %ebp
c000634d:	89 e5                	mov    %esp,%ebp
c000634f:	83 ec 10             	sub    $0x10,%esp
c0006352:	8b 45 08             	mov    0x8(%ebp),%eax
c0006355:	83 e8 04             	sub    $0x4,%eax
c0006358:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c000635e:	05 00 00 a0 00       	add    $0xa00000,%eax
c0006363:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006366:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006369:	c9                   	leave  
c000636a:	c3                   	ret    

c000636b <do_exec2>:
c000636b:	55                   	push   %ebp
c000636c:	89 e5                	mov    %esp,%ebp
c000636e:	83 ec 10             	sub    $0x10,%esp
c0006371:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0006378:	b8 00 00 00 00       	mov    $0x0,%eax
c000637d:	c9                   	leave  
c000637e:	c3                   	ret    

c000637f <do_exec>:
c000637f:	55                   	push   %ebp
c0006380:	89 e5                	mov    %esp,%ebp
c0006382:	56                   	push   %esi
c0006383:	53                   	push   %ebx
c0006384:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c000638a:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c0006391:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0006398:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c000639e:	83 ec 08             	sub    $0x8,%esp
c00063a1:	6a 00                	push   $0x0
c00063a3:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c00063a6:	50                   	push   %eax
c00063a7:	e8 20 f9 ff ff       	call   c0005ccc <open>
c00063ac:	83 c4 10             	add    $0x10,%esp
c00063af:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00063b2:	8b 45 08             	mov    0x8(%ebp),%eax
c00063b5:	8b 00                	mov    (%eax),%eax
c00063b7:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00063ba:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c00063c1:	83 ec 04             	sub    $0x4,%esp
c00063c4:	6a 0c                	push   $0xc
c00063c6:	6a 00                	push   $0x0
c00063c8:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00063ce:	50                   	push   %eax
c00063cf:	e8 9e 4f 00 00       	call   c000b372 <Memset>
c00063d4:	83 c4 10             	add    $0x10,%esp
c00063d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00063da:	8b 40 30             	mov    0x30(%eax),%eax
c00063dd:	89 c6                	mov    %eax,%esi
c00063df:	8b 45 08             	mov    0x8(%ebp),%eax
c00063e2:	8b 40 34             	mov    0x34(%eax),%eax
c00063e5:	83 ec 08             	sub    $0x8,%esp
c00063e8:	50                   	push   %eax
c00063e9:	ff 75 d8             	pushl  -0x28(%ebp)
c00063ec:	e8 c5 e7 ff ff       	call   c0004bb6 <v2l>
c00063f1:	83 c4 10             	add    $0x10,%esp
c00063f4:	89 c3                	mov    %eax,%ebx
c00063f6:	83 ec 08             	sub    $0x8,%esp
c00063f9:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00063ff:	50                   	push   %eax
c0006400:	6a 05                	push   $0x5
c0006402:	e8 af e7 ff ff       	call   c0004bb6 <v2l>
c0006407:	83 c4 10             	add    $0x10,%esp
c000640a:	83 ec 04             	sub    $0x4,%esp
c000640d:	56                   	push   %esi
c000640e:	53                   	push   %ebx
c000640f:	50                   	push   %eax
c0006410:	e8 2f 4f 00 00       	call   c000b344 <Memcpy>
c0006415:	83 c4 10             	add    $0x10,%esp
c0006418:	83 ec 08             	sub    $0x8,%esp
c000641b:	6a 00                	push   $0x0
c000641d:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c0006423:	50                   	push   %eax
c0006424:	e8 a3 f8 ff ff       	call   c0005ccc <open>
c0006429:	83 c4 10             	add    $0x10,%esp
c000642c:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000642f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006436:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006439:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c000643f:	01 d0                	add    %edx,%eax
c0006441:	83 ec 04             	sub    $0x4,%esp
c0006444:	68 00 02 00 00       	push   $0x200
c0006449:	50                   	push   %eax
c000644a:	ff 75 d0             	pushl  -0x30(%ebp)
c000644d:	e8 ff f8 ff ff       	call   c0005d51 <read>
c0006452:	83 c4 10             	add    $0x10,%esp
c0006455:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006458:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000645b:	01 45 f4             	add    %eax,-0xc(%ebp)
c000645e:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0006462:	74 02                	je     c0006466 <do_exec+0xe7>
c0006464:	eb d0                	jmp    c0006436 <do_exec+0xb7>
c0006466:	90                   	nop
c0006467:	83 ec 0c             	sub    $0xc,%esp
c000646a:	ff 75 d0             	pushl  -0x30(%ebp)
c000646d:	e8 d8 f9 ff ff       	call   c0005e4a <close>
c0006472:	83 c4 10             	add    $0x10,%esp
c0006475:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c000647b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000647e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006485:	eb 72                	jmp    c00064f9 <do_exec+0x17a>
c0006487:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000648a:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c000648e:	0f b7 d0             	movzwl %ax,%edx
c0006491:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006494:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0006498:	0f b7 c0             	movzwl %ax,%eax
c000649b:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c000649f:	01 c2                	add    %eax,%edx
c00064a1:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00064a7:	01 d0                	add    %edx,%eax
c00064a9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00064ac:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064af:	8b 40 10             	mov    0x10(%eax),%eax
c00064b2:	89 c6                	mov    %eax,%esi
c00064b4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064b7:	8b 40 04             	mov    0x4(%eax),%eax
c00064ba:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00064c0:	01 d0                	add    %edx,%eax
c00064c2:	83 ec 08             	sub    $0x8,%esp
c00064c5:	50                   	push   %eax
c00064c6:	6a 05                	push   $0x5
c00064c8:	e8 e9 e6 ff ff       	call   c0004bb6 <v2l>
c00064cd:	83 c4 10             	add    $0x10,%esp
c00064d0:	89 c3                	mov    %eax,%ebx
c00064d2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064d5:	8b 40 08             	mov    0x8(%eax),%eax
c00064d8:	83 ec 08             	sub    $0x8,%esp
c00064db:	50                   	push   %eax
c00064dc:	ff 75 d8             	pushl  -0x28(%ebp)
c00064df:	e8 d2 e6 ff ff       	call   c0004bb6 <v2l>
c00064e4:	83 c4 10             	add    $0x10,%esp
c00064e7:	83 ec 04             	sub    $0x4,%esp
c00064ea:	56                   	push   %esi
c00064eb:	53                   	push   %ebx
c00064ec:	50                   	push   %eax
c00064ed:	e8 52 4e 00 00       	call   c000b344 <Memcpy>
c00064f2:	83 c4 10             	add    $0x10,%esp
c00064f5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00064f9:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00064fc:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c0006500:	0f b7 c0             	movzwl %ax,%eax
c0006503:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006506:	0f 8c 7b ff ff ff    	jl     c0006487 <do_exec+0x108>
c000650c:	8b 45 08             	mov    0x8(%ebp),%eax
c000650f:	8b 40 10             	mov    0x10(%eax),%eax
c0006512:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006515:	8b 45 08             	mov    0x8(%ebp),%eax
c0006518:	8b 40 1c             	mov    0x1c(%eax),%eax
c000651b:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000651e:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c0006525:	83 ec 08             	sub    $0x8,%esp
c0006528:	ff 75 c0             	pushl  -0x40(%ebp)
c000652b:	ff 75 d8             	pushl  -0x28(%ebp)
c000652e:	e8 83 e6 ff ff       	call   c0004bb6 <v2l>
c0006533:	83 c4 10             	add    $0x10,%esp
c0006536:	89 c3                	mov    %eax,%ebx
c0006538:	83 ec 08             	sub    $0x8,%esp
c000653b:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006541:	50                   	push   %eax
c0006542:	6a 05                	push   $0x5
c0006544:	e8 6d e6 ff ff       	call   c0004bb6 <v2l>
c0006549:	83 c4 10             	add    $0x10,%esp
c000654c:	83 ec 04             	sub    $0x4,%esp
c000654f:	ff 75 bc             	pushl  -0x44(%ebp)
c0006552:	53                   	push   %ebx
c0006553:	50                   	push   %eax
c0006554:	e8 eb 4d 00 00       	call   c000b344 <Memcpy>
c0006559:	83 c4 10             	add    $0x10,%esp
c000655c:	83 ec 08             	sub    $0x8,%esp
c000655f:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006565:	50                   	push   %eax
c0006566:	6a 05                	push   $0x5
c0006568:	e8 49 e6 ff ff       	call   c0004bb6 <v2l>
c000656d:	83 c4 10             	add    $0x10,%esp
c0006570:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0006573:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006576:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006579:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006580:	eb 08                	jmp    c000658a <do_exec+0x20b>
c0006582:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006586:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c000658a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000658d:	8b 00                	mov    (%eax),%eax
c000658f:	85 c0                	test   %eax,%eax
c0006591:	75 ef                	jne    c0006582 <do_exec+0x203>
c0006593:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006596:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0006599:	89 45 b0             	mov    %eax,-0x50(%ebp)
c000659c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00065a3:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00065a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00065ac:	eb 17                	jmp    c00065c5 <do_exec+0x246>
c00065ae:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00065b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065b5:	8b 10                	mov    (%eax),%edx
c00065b7:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00065ba:	01 c2                	add    %eax,%edx
c00065bc:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065bf:	89 10                	mov    %edx,(%eax)
c00065c1:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00065c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065c8:	8b 00                	mov    (%eax),%eax
c00065ca:	85 c0                	test   %eax,%eax
c00065cc:	75 e0                	jne    c00065ae <do_exec+0x22f>
c00065ce:	83 ec 08             	sub    $0x8,%esp
c00065d1:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00065d7:	50                   	push   %eax
c00065d8:	6a 05                	push   $0x5
c00065da:	e8 d7 e5 ff ff       	call   c0004bb6 <v2l>
c00065df:	83 c4 10             	add    $0x10,%esp
c00065e2:	89 c3                	mov    %eax,%ebx
c00065e4:	83 ec 08             	sub    $0x8,%esp
c00065e7:	ff 75 b8             	pushl  -0x48(%ebp)
c00065ea:	ff 75 d8             	pushl  -0x28(%ebp)
c00065ed:	e8 c4 e5 ff ff       	call   c0004bb6 <v2l>
c00065f2:	83 c4 10             	add    $0x10,%esp
c00065f5:	83 ec 04             	sub    $0x4,%esp
c00065f8:	ff 75 bc             	pushl  -0x44(%ebp)
c00065fb:	53                   	push   %ebx
c00065fc:	50                   	push   %eax
c00065fd:	e8 42 4d 00 00       	call   c000b344 <Memcpy>
c0006602:	83 c4 10             	add    $0x10,%esp
c0006605:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006608:	89 45 ac             	mov    %eax,-0x54(%ebp)
c000660b:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000660e:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006611:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006617:	81 c2 94 35 08 c0    	add    $0xc0083594,%edx
c000661d:	89 02                	mov    %eax,(%edx)
c000661f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006622:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006625:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c000662b:	81 c2 90 35 08 c0    	add    $0xc0083590,%edx
c0006631:	89 02                	mov    %eax,(%edx)
c0006633:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006636:	8b 40 18             	mov    0x18(%eax),%eax
c0006639:	89 c2                	mov    %eax,%edx
c000663b:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000663e:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006644:	05 98 35 08 c0       	add    $0xc0083598,%eax
c0006649:	89 10                	mov    %edx,(%eax)
c000664b:	8b 45 b8             	mov    -0x48(%ebp),%eax
c000664e:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006651:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006657:	81 c2 a4 35 08 c0    	add    $0xc00835a4,%edx
c000665d:	89 02                	mov    %eax,(%edx)
c000665f:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006662:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006668:	05 4c 35 08 c0       	add    $0xc008354c,%eax
c000666d:	c7 00 1d 00 00 00    	movl   $0x1d,(%eax)
c0006673:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c000667a:	00 00 00 
c000667d:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c0006684:	00 00 00 
c0006687:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c000668e:	00 00 00 
c0006691:	83 ec 04             	sub    $0x4,%esp
c0006694:	ff 75 d8             	pushl  -0x28(%ebp)
c0006697:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c000669d:	50                   	push   %eax
c000669e:	6a 01                	push   $0x1
c00066a0:	e8 ce 33 00 00       	call   c0009a73 <send_rec>
c00066a5:	83 c4 10             	add    $0x10,%esp
c00066a8:	90                   	nop
c00066a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00066ac:	5b                   	pop    %ebx
c00066ad:	5e                   	pop    %esi
c00066ae:	5d                   	pop    %ebp
c00066af:	c3                   	ret    

c00066b0 <do_fork>:
c00066b0:	55                   	push   %ebp
c00066b1:	89 e5                	mov    %esp,%ebp
c00066b3:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00066b9:	8b 45 08             	mov    0x8(%ebp),%eax
c00066bc:	8b 00                	mov    (%eax),%eax
c00066be:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00066c1:	83 ec 0c             	sub    $0xc,%esp
c00066c4:	ff 75 f4             	pushl  -0xc(%ebp)
c00066c7:	e8 9f 3b 00 00       	call   c000a26b <fork_process>
c00066cc:	83 c4 10             	add    $0x10,%esp
c00066cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00066d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066d5:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00066db:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00066de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066e1:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c00066e7:	8b 45 08             	mov    0x8(%ebp),%eax
c00066ea:	89 50 4c             	mov    %edx,0x4c(%eax)
c00066ed:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00066f4:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00066fb:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006702:	83 ec 04             	sub    $0x4,%esp
c0006705:	ff 75 ec             	pushl  -0x14(%ebp)
c0006708:	8d 45 80             	lea    -0x80(%ebp),%eax
c000670b:	50                   	push   %eax
c000670c:	6a 01                	push   $0x1
c000670e:	e8 60 33 00 00       	call   c0009a73 <send_rec>
c0006713:	83 c4 10             	add    $0x10,%esp
c0006716:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006719:	c9                   	leave  
c000671a:	c3                   	ret    

c000671b <do_exit>:
c000671b:	55                   	push   %ebp
c000671c:	89 e5                	mov    %esp,%ebp
c000671e:	83 ec 18             	sub    $0x18,%esp
c0006721:	8b 45 08             	mov    0x8(%ebp),%eax
c0006724:	8b 00                	mov    (%eax),%eax
c0006726:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006729:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000672c:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006732:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006737:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000673a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000673d:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0006743:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006746:	8b 45 08             	mov    0x8(%ebp),%eax
c0006749:	8b 40 44             	mov    0x44(%eax),%eax
c000674c:	89 c2                	mov    %eax,%edx
c000674e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006751:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c0006757:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000675a:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006760:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006765:	0f b6 00             	movzbl (%eax),%eax
c0006768:	3c 04                	cmp    $0x4,%al
c000676a:	75 21                	jne    c000678d <do_exit+0x72>
c000676c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000676f:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006775:	05 45 35 08 c0       	add    $0xc0083545,%eax
c000677a:	c6 00 fb             	movb   $0xfb,(%eax)
c000677d:	83 ec 0c             	sub    $0xc,%esp
c0006780:	ff 75 ec             	pushl  -0x14(%ebp)
c0006783:	e8 59 01 00 00       	call   c00068e1 <cleanup>
c0006788:	83 c4 10             	add    $0x10,%esp
c000678b:	eb 0a                	jmp    c0006797 <do_exit+0x7c>
c000678d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006790:	c6 80 44 02 00 00 03 	movb   $0x3,0x244(%eax)
c0006797:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c000679e:	eb 6e                	jmp    c000680e <do_exit+0xf3>
c00067a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067a3:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067a9:	05 60 35 08 c0       	add    $0xc0083560,%eax
c00067ae:	8b 00                	mov    (%eax),%eax
c00067b0:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00067b3:	75 55                	jne    c000680a <do_exit+0xef>
c00067b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067b8:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067be:	05 60 35 08 c0       	add    $0xc0083560,%eax
c00067c3:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00067c9:	0f b6 05 4d 45 08 c0 	movzbl 0xc008454d,%eax
c00067d0:	3c 04                	cmp    $0x4,%al
c00067d2:	75 36                	jne    c000680a <do_exit+0xef>
c00067d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067d7:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067dd:	05 45 35 08 c0       	add    $0xc0083545,%eax
c00067e2:	0f b6 00             	movzbl (%eax),%eax
c00067e5:	3c 03                	cmp    $0x3,%al
c00067e7:	75 21                	jne    c000680a <do_exit+0xef>
c00067e9:	c6 05 4d 45 08 c0 fb 	movb   $0xfb,0xc008454d
c00067f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067f3:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067f9:	05 00 33 08 c0       	add    $0xc0083300,%eax
c00067fe:	83 ec 0c             	sub    $0xc,%esp
c0006801:	50                   	push   %eax
c0006802:	e8 da 00 00 00       	call   c00068e1 <cleanup>
c0006807:	83 c4 10             	add    $0x10,%esp
c000680a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000680e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006812:	7e 8c                	jle    c00067a0 <do_exit+0x85>
c0006814:	90                   	nop
c0006815:	c9                   	leave  
c0006816:	c3                   	ret    

c0006817 <do_wait>:
c0006817:	55                   	push   %ebp
c0006818:	89 e5                	mov    %esp,%ebp
c000681a:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006820:	8b 45 08             	mov    0x8(%ebp),%eax
c0006823:	8b 00                	mov    (%eax),%eax
c0006825:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006828:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000682f:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
c0006836:	eb 5f                	jmp    c0006897 <do_wait+0x80>
c0006838:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000683b:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006841:	05 60 35 08 c0       	add    $0xc0083560,%eax
c0006846:	8b 00                	mov    (%eax),%eax
c0006848:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c000684b:	75 46                	jne    c0006893 <do_wait+0x7c>
c000684d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006851:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006854:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000685a:	05 45 35 08 c0       	add    $0xc0083545,%eax
c000685f:	0f b6 00             	movzbl (%eax),%eax
c0006862:	3c 03                	cmp    $0x3,%al
c0006864:	75 2d                	jne    c0006893 <do_wait+0x7c>
c0006866:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006869:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000686f:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006874:	c6 00 fb             	movb   $0xfb,(%eax)
c0006877:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000687a:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006880:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006885:	83 ec 0c             	sub    $0xc,%esp
c0006888:	50                   	push   %eax
c0006889:	e8 53 00 00 00       	call   c00068e1 <cleanup>
c000688e:	83 c4 10             	add    $0x10,%esp
c0006891:	eb 4c                	jmp    c00068df <do_wait+0xc8>
c0006893:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0006897:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c000689b:	7e 9b                	jle    c0006838 <do_wait+0x21>
c000689d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00068a1:	74 13                	je     c00068b6 <do_wait+0x9f>
c00068a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068a6:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00068ac:	05 45 35 08 c0       	add    $0xc0083545,%eax
c00068b1:	c6 00 04             	movb   $0x4,(%eax)
c00068b4:	eb 29                	jmp    c00068df <do_wait+0xc8>
c00068b6:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00068bd:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00068c4:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00068cb:	83 ec 04             	sub    $0x4,%esp
c00068ce:	ff 75 ec             	pushl  -0x14(%ebp)
c00068d1:	8d 45 80             	lea    -0x80(%ebp),%eax
c00068d4:	50                   	push   %eax
c00068d5:	6a 01                	push   $0x1
c00068d7:	e8 97 31 00 00       	call   c0009a73 <send_rec>
c00068dc:	83 c4 10             	add    $0x10,%esp
c00068df:	c9                   	leave  
c00068e0:	c3                   	ret    

c00068e1 <cleanup>:
c00068e1:	55                   	push   %ebp
c00068e2:	89 e5                	mov    %esp,%ebp
c00068e4:	83 ec 78             	sub    $0x78,%esp
c00068e7:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00068ee:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00068f5:	8b 45 08             	mov    0x8(%ebp),%eax
c00068f8:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c00068fe:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006901:	8b 45 08             	mov    0x8(%ebp),%eax
c0006904:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c000690a:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000690d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006910:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0006916:	83 ec 04             	sub    $0x4,%esp
c0006919:	50                   	push   %eax
c000691a:	8d 45 8c             	lea    -0x74(%ebp),%eax
c000691d:	50                   	push   %eax
c000691e:	6a 01                	push   $0x1
c0006920:	e8 4e 31 00 00       	call   c0009a73 <send_rec>
c0006925:	83 c4 10             	add    $0x10,%esp
c0006928:	8b 45 08             	mov    0x8(%ebp),%eax
c000692b:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c0006932:	90                   	nop
c0006933:	c9                   	leave  
c0006934:	c3                   	ret    

c0006935 <init_bitmap>:
c0006935:	55                   	push   %ebp
c0006936:	89 e5                	mov    %esp,%ebp
c0006938:	83 ec 08             	sub    $0x8,%esp
c000693b:	8b 45 08             	mov    0x8(%ebp),%eax
c000693e:	8b 50 04             	mov    0x4(%eax),%edx
c0006941:	8b 45 08             	mov    0x8(%ebp),%eax
c0006944:	8b 00                	mov    (%eax),%eax
c0006946:	83 ec 04             	sub    $0x4,%esp
c0006949:	52                   	push   %edx
c000694a:	6a 00                	push   $0x0
c000694c:	50                   	push   %eax
c000694d:	e8 20 4a 00 00       	call   c000b372 <Memset>
c0006952:	83 c4 10             	add    $0x10,%esp
c0006955:	90                   	nop
c0006956:	c9                   	leave  
c0006957:	c3                   	ret    

c0006958 <test_bit_val>:
c0006958:	55                   	push   %ebp
c0006959:	89 e5                	mov    %esp,%ebp
c000695b:	53                   	push   %ebx
c000695c:	83 ec 10             	sub    $0x10,%esp
c000695f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006962:	8d 50 07             	lea    0x7(%eax),%edx
c0006965:	85 c0                	test   %eax,%eax
c0006967:	0f 48 c2             	cmovs  %edx,%eax
c000696a:	c1 f8 03             	sar    $0x3,%eax
c000696d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006970:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006973:	99                   	cltd   
c0006974:	c1 ea 1d             	shr    $0x1d,%edx
c0006977:	01 d0                	add    %edx,%eax
c0006979:	83 e0 07             	and    $0x7,%eax
c000697c:	29 d0                	sub    %edx,%eax
c000697e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006981:	8b 45 08             	mov    0x8(%ebp),%eax
c0006984:	8b 10                	mov    (%eax),%edx
c0006986:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006989:	01 d0                	add    %edx,%eax
c000698b:	0f b6 00             	movzbl (%eax),%eax
c000698e:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006991:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c0006995:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006998:	bb 01 00 00 00       	mov    $0x1,%ebx
c000699d:	89 c1                	mov    %eax,%ecx
c000699f:	d3 e3                	shl    %cl,%ebx
c00069a1:	89 d8                	mov    %ebx,%eax
c00069a3:	21 c2                	and    %eax,%edx
c00069a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00069a8:	89 c1                	mov    %eax,%ecx
c00069aa:	d3 fa                	sar    %cl,%edx
c00069ac:	89 d0                	mov    %edx,%eax
c00069ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069b1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00069b5:	0f 9f c0             	setg   %al
c00069b8:	0f b6 c0             	movzbl %al,%eax
c00069bb:	83 c4 10             	add    $0x10,%esp
c00069be:	5b                   	pop    %ebx
c00069bf:	5d                   	pop    %ebp
c00069c0:	c3                   	ret    

c00069c1 <set_bit_val>:
c00069c1:	55                   	push   %ebp
c00069c2:	89 e5                	mov    %esp,%ebp
c00069c4:	83 ec 10             	sub    $0x10,%esp
c00069c7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069ca:	8d 50 07             	lea    0x7(%eax),%edx
c00069cd:	85 c0                	test   %eax,%eax
c00069cf:	0f 48 c2             	cmovs  %edx,%eax
c00069d2:	c1 f8 03             	sar    $0x3,%eax
c00069d5:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069d8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069db:	99                   	cltd   
c00069dc:	c1 ea 1d             	shr    $0x1d,%edx
c00069df:	01 d0                	add    %edx,%eax
c00069e1:	83 e0 07             	and    $0x7,%eax
c00069e4:	29 d0                	sub    %edx,%eax
c00069e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00069ec:	8b 10                	mov    (%eax),%edx
c00069ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00069f1:	01 d0                	add    %edx,%eax
c00069f3:	0f b6 00             	movzbl (%eax),%eax
c00069f6:	88 45 ff             	mov    %al,-0x1(%ebp)
c00069f9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c00069fd:	7e 13                	jle    c0006a12 <set_bit_val+0x51>
c00069ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a02:	ba 01 00 00 00       	mov    $0x1,%edx
c0006a07:	89 c1                	mov    %eax,%ecx
c0006a09:	d3 e2                	shl    %cl,%edx
c0006a0b:	89 d0                	mov    %edx,%eax
c0006a0d:	08 45 ff             	or     %al,-0x1(%ebp)
c0006a10:	eb 13                	jmp    c0006a25 <set_bit_val+0x64>
c0006a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a15:	ba 01 00 00 00       	mov    $0x1,%edx
c0006a1a:	89 c1                	mov    %eax,%ecx
c0006a1c:	d3 e2                	shl    %cl,%edx
c0006a1e:	89 d0                	mov    %edx,%eax
c0006a20:	f7 d0                	not    %eax
c0006a22:	20 45 ff             	and    %al,-0x1(%ebp)
c0006a25:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a28:	8b 10                	mov    (%eax),%edx
c0006a2a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a2d:	01 c2                	add    %eax,%edx
c0006a2f:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006a33:	88 02                	mov    %al,(%edx)
c0006a35:	b8 01 00 00 00       	mov    $0x1,%eax
c0006a3a:	c9                   	leave  
c0006a3b:	c3                   	ret    

c0006a3c <set_bits>:
c0006a3c:	55                   	push   %ebp
c0006a3d:	89 e5                	mov    %esp,%ebp
c0006a3f:	83 ec 10             	sub    $0x10,%esp
c0006a42:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006a49:	eb 1c                	jmp    c0006a67 <set_bits+0x2b>
c0006a4b:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a4e:	8d 50 01             	lea    0x1(%eax),%edx
c0006a51:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006a54:	ff 75 10             	pushl  0x10(%ebp)
c0006a57:	50                   	push   %eax
c0006a58:	ff 75 08             	pushl  0x8(%ebp)
c0006a5b:	e8 61 ff ff ff       	call   c00069c1 <set_bit_val>
c0006a60:	83 c4 0c             	add    $0xc,%esp
c0006a63:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006a67:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a6a:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006a6d:	7c dc                	jl     c0006a4b <set_bits+0xf>
c0006a6f:	b8 01 00 00 00       	mov    $0x1,%eax
c0006a74:	c9                   	leave  
c0006a75:	c3                   	ret    

c0006a76 <get_first_free_bit>:
c0006a76:	55                   	push   %ebp
c0006a77:	89 e5                	mov    %esp,%ebp
c0006a79:	83 ec 10             	sub    $0x10,%esp
c0006a7c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a7f:	8b 40 04             	mov    0x4(%eax),%eax
c0006a82:	c1 e0 03             	shl    $0x3,%eax
c0006a85:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a88:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a8b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006a8e:	eb 1b                	jmp    c0006aab <get_first_free_bit+0x35>
c0006a90:	ff 75 fc             	pushl  -0x4(%ebp)
c0006a93:	ff 75 08             	pushl  0x8(%ebp)
c0006a96:	e8 bd fe ff ff       	call   c0006958 <test_bit_val>
c0006a9b:	83 c4 08             	add    $0x8,%esp
c0006a9e:	85 c0                	test   %eax,%eax
c0006aa0:	75 05                	jne    c0006aa7 <get_first_free_bit+0x31>
c0006aa2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006aa5:	eb 11                	jmp    c0006ab8 <get_first_free_bit+0x42>
c0006aa7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006aab:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006aae:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006ab1:	7c dd                	jl     c0006a90 <get_first_free_bit+0x1a>
c0006ab3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006ab8:	c9                   	leave  
c0006ab9:	c3                   	ret    

c0006aba <get_bits>:
c0006aba:	55                   	push   %ebp
c0006abb:	89 e5                	mov    %esp,%ebp
c0006abd:	83 ec 20             	sub    $0x20,%esp
c0006ac0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006ac7:	ff 75 f0             	pushl  -0x10(%ebp)
c0006aca:	ff 75 08             	pushl  0x8(%ebp)
c0006acd:	e8 a4 ff ff ff       	call   c0006a76 <get_first_free_bit>
c0006ad2:	83 c4 08             	add    $0x8,%esp
c0006ad5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006ad8:	8b 45 08             	mov    0x8(%ebp),%eax
c0006adb:	8b 40 04             	mov    0x4(%eax),%eax
c0006ade:	c1 e0 03             	shl    $0x3,%eax
c0006ae1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ae4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ae7:	83 e8 01             	sub    $0x1,%eax
c0006aea:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006aed:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006af1:	75 08                	jne    c0006afb <get_bits+0x41>
c0006af3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006af6:	e9 85 00 00 00       	jmp    c0006b80 <get_bits+0xc6>
c0006afb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006afe:	83 c0 01             	add    $0x1,%eax
c0006b01:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b04:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b07:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b0a:	eb 58                	jmp    c0006b64 <get_bits+0xaa>
c0006b0c:	ff 75 f8             	pushl  -0x8(%ebp)
c0006b0f:	ff 75 08             	pushl  0x8(%ebp)
c0006b12:	e8 41 fe ff ff       	call   c0006958 <test_bit_val>
c0006b17:	83 c4 08             	add    $0x8,%esp
c0006b1a:	85 c0                	test   %eax,%eax
c0006b1c:	75 0a                	jne    c0006b28 <get_bits+0x6e>
c0006b1e:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006b22:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006b26:	eb 2b                	jmp    c0006b53 <get_bits+0x99>
c0006b28:	6a 00                	push   $0x0
c0006b2a:	ff 75 08             	pushl  0x8(%ebp)
c0006b2d:	e8 44 ff ff ff       	call   c0006a76 <get_first_free_bit>
c0006b32:	83 c4 08             	add    $0x8,%esp
c0006b35:	83 c0 01             	add    $0x1,%eax
c0006b38:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b3e:	83 c0 01             	add    $0x1,%eax
c0006b41:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b44:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b47:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b4a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b4d:	83 e8 01             	sub    $0x1,%eax
c0006b50:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b53:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b56:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006b59:	7c 09                	jl     c0006b64 <get_bits+0xaa>
c0006b5b:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006b62:	eb 0d                	jmp    c0006b71 <get_bits+0xb7>
c0006b64:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006b67:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006b6a:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006b6d:	85 c0                	test   %eax,%eax
c0006b6f:	7f 9b                	jg     c0006b0c <get_bits+0x52>
c0006b71:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b74:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006b77:	83 c0 01             	add    $0x1,%eax
c0006b7a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b7d:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b80:	c9                   	leave  
c0006b81:	c3                   	ret    

c0006b82 <get_a_page2>:
c0006b82:	55                   	push   %ebp
c0006b83:	89 e5                	mov    %esp,%ebp
c0006b85:	83 ec 18             	sub    $0x18,%esp
c0006b88:	83 ec 0c             	sub    $0xc,%esp
c0006b8b:	ff 75 0c             	pushl  0xc(%ebp)
c0006b8e:	e8 1e 00 00 00       	call   c0006bb1 <get_a_page>
c0006b93:	83 c4 10             	add    $0x10,%esp
c0006b96:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b99:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006b9c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006b9f:	83 ec 08             	sub    $0x8,%esp
c0006ba2:	52                   	push   %edx
c0006ba3:	50                   	push   %eax
c0006ba4:	e8 61 01 00 00       	call   c0006d0a <add_map_entry>
c0006ba9:	83 c4 10             	add    $0x10,%esp
c0006bac:	8b 45 08             	mov    0x8(%ebp),%eax
c0006baf:	c9                   	leave  
c0006bb0:	c3                   	ret    

c0006bb1 <get_a_page>:
c0006bb1:	55                   	push   %ebp
c0006bb2:	89 e5                	mov    %esp,%ebp
c0006bb4:	83 ec 20             	sub    $0x20,%esp
c0006bb7:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006bbb:	75 22                	jne    c0006bdf <get_a_page+0x2e>
c0006bbd:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0006bc2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006bc5:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c0006bca:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006bcd:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0006bd2:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006bd5:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0006bda:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bdd:	eb 20                	jmp    c0006bff <get_a_page+0x4e>
c0006bdf:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0006be4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006be7:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0006bec:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006bef:	a1 cc 1e 01 c0       	mov    0xc0011ecc,%eax
c0006bf4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006bf7:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0006bfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006bff:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006c02:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006c05:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c08:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006c0b:	6a 01                	push   $0x1
c0006c0d:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c10:	50                   	push   %eax
c0006c11:	e8 a4 fe ff ff       	call   c0006aba <get_bits>
c0006c16:	83 c4 08             	add    $0x8,%esp
c0006c19:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006c1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c1f:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006c22:	c1 e2 0c             	shl    $0xc,%edx
c0006c25:	01 d0                	add    %edx,%eax
c0006c27:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c2a:	6a 01                	push   $0x1
c0006c2c:	ff 75 fc             	pushl  -0x4(%ebp)
c0006c2f:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c32:	50                   	push   %eax
c0006c33:	e8 89 fd ff ff       	call   c00069c1 <set_bit_val>
c0006c38:	83 c4 0c             	add    $0xc,%esp
c0006c3b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c3e:	c9                   	leave  
c0006c3f:	c3                   	ret    

c0006c40 <get_virtual_address>:
c0006c40:	55                   	push   %ebp
c0006c41:	89 e5                	mov    %esp,%ebp
c0006c43:	83 ec 28             	sub    $0x28,%esp
c0006c46:	e8 49 ac ff ff       	call   c0001894 <get_running_thread_pcb>
c0006c4b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c4e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006c52:	75 1a                	jne    c0006c6e <get_virtual_address+0x2e>
c0006c54:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0006c59:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c5c:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0006c61:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c64:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0006c69:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c6c:	eb 18                	jmp    c0006c86 <get_virtual_address+0x46>
c0006c6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c71:	8b 40 08             	mov    0x8(%eax),%eax
c0006c74:	83 ec 04             	sub    $0x4,%esp
c0006c77:	6a 0c                	push   $0xc
c0006c79:	50                   	push   %eax
c0006c7a:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c7d:	50                   	push   %eax
c0006c7e:	e8 c1 46 00 00       	call   c000b344 <Memcpy>
c0006c83:	83 c4 10             	add    $0x10,%esp
c0006c86:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006c89:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006c8c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006c8f:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006c92:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c95:	83 ec 08             	sub    $0x8,%esp
c0006c98:	50                   	push   %eax
c0006c99:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006c9c:	50                   	push   %eax
c0006c9d:	e8 18 fe ff ff       	call   c0006aba <get_bits>
c0006ca2:	83 c4 10             	add    $0x10,%esp
c0006ca5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006ca8:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006cab:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006cae:	c1 e2 0c             	shl    $0xc,%edx
c0006cb1:	01 d0                	add    %edx,%eax
c0006cb3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006cb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cb9:	50                   	push   %eax
c0006cba:	6a 01                	push   $0x1
c0006cbc:	ff 75 f0             	pushl  -0x10(%ebp)
c0006cbf:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006cc2:	50                   	push   %eax
c0006cc3:	e8 74 fd ff ff       	call   c0006a3c <set_bits>
c0006cc8:	83 c4 10             	add    $0x10,%esp
c0006ccb:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006cce:	c9                   	leave  
c0006ccf:	c3                   	ret    

c0006cd0 <ptr_pde>:
c0006cd0:	55                   	push   %ebp
c0006cd1:	89 e5                	mov    %esp,%ebp
c0006cd3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cd6:	c1 e8 16             	shr    $0x16,%eax
c0006cd9:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006cde:	c1 e0 02             	shl    $0x2,%eax
c0006ce1:	5d                   	pop    %ebp
c0006ce2:	c3                   	ret    

c0006ce3 <ptr_pte>:
c0006ce3:	55                   	push   %ebp
c0006ce4:	89 e5                	mov    %esp,%ebp
c0006ce6:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ce9:	c1 e8 0a             	shr    $0xa,%eax
c0006cec:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006cf1:	89 c2                	mov    %eax,%edx
c0006cf3:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cf6:	c1 e8 0c             	shr    $0xc,%eax
c0006cf9:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006cfe:	c1 e0 02             	shl    $0x2,%eax
c0006d01:	01 d0                	add    %edx,%eax
c0006d03:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006d08:	5d                   	pop    %ebp
c0006d09:	c3                   	ret    

c0006d0a <add_map_entry>:
c0006d0a:	55                   	push   %ebp
c0006d0b:	89 e5                	mov    %esp,%ebp
c0006d0d:	83 ec 18             	sub    $0x18,%esp
c0006d10:	ff 75 08             	pushl  0x8(%ebp)
c0006d13:	e8 b8 ff ff ff       	call   c0006cd0 <ptr_pde>
c0006d18:	83 c4 04             	add    $0x4,%esp
c0006d1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d1e:	ff 75 08             	pushl  0x8(%ebp)
c0006d21:	e8 bd ff ff ff       	call   c0006ce3 <ptr_pte>
c0006d26:	83 c4 04             	add    $0x4,%esp
c0006d29:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d2f:	8b 00                	mov    (%eax),%eax
c0006d31:	83 e0 01             	and    $0x1,%eax
c0006d34:	85 c0                	test   %eax,%eax
c0006d36:	74 1b                	je     c0006d53 <add_map_entry+0x49>
c0006d38:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d3b:	8b 00                	mov    (%eax),%eax
c0006d3d:	83 e0 01             	and    $0x1,%eax
c0006d40:	85 c0                	test   %eax,%eax
c0006d42:	75 51                	jne    c0006d95 <add_map_entry+0x8b>
c0006d44:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d47:	83 c8 07             	or     $0x7,%eax
c0006d4a:	89 c2                	mov    %eax,%edx
c0006d4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d4f:	89 10                	mov    %edx,(%eax)
c0006d51:	eb 42                	jmp    c0006d95 <add_map_entry+0x8b>
c0006d53:	6a 00                	push   $0x0
c0006d55:	e8 57 fe ff ff       	call   c0006bb1 <get_a_page>
c0006d5a:	83 c4 04             	add    $0x4,%esp
c0006d5d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d60:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d63:	83 c8 07             	or     $0x7,%eax
c0006d66:	89 c2                	mov    %eax,%edx
c0006d68:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d6b:	89 10                	mov    %edx,(%eax)
c0006d6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d70:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006d75:	83 ec 04             	sub    $0x4,%esp
c0006d78:	68 00 10 00 00       	push   $0x1000
c0006d7d:	6a 00                	push   $0x0
c0006d7f:	50                   	push   %eax
c0006d80:	e8 ed 45 00 00       	call   c000b372 <Memset>
c0006d85:	83 c4 10             	add    $0x10,%esp
c0006d88:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d8b:	83 c8 07             	or     $0x7,%eax
c0006d8e:	89 c2                	mov    %eax,%edx
c0006d90:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d93:	89 10                	mov    %edx,(%eax)
c0006d95:	90                   	nop
c0006d96:	c9                   	leave  
c0006d97:	c3                   	ret    

c0006d98 <alloc_virtual_memory>:
c0006d98:	55                   	push   %ebp
c0006d99:	89 e5                	mov    %esp,%ebp
c0006d9b:	83 ec 18             	sub    $0x18,%esp
c0006d9e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006da1:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006da6:	c1 e8 0c             	shr    $0xc,%eax
c0006da9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006dac:	e8 e3 aa ff ff       	call   c0001894 <get_running_thread_pcb>
c0006db1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006db4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006db7:	8b 40 04             	mov    0x4(%eax),%eax
c0006dba:	85 c0                	test   %eax,%eax
c0006dbc:	75 09                	jne    c0006dc7 <alloc_virtual_memory+0x2f>
c0006dbe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006dc5:	eb 07                	jmp    c0006dce <alloc_virtual_memory+0x36>
c0006dc7:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006dce:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006dd1:	83 ec 08             	sub    $0x8,%esp
c0006dd4:	ff 75 f4             	pushl  -0xc(%ebp)
c0006dd7:	50                   	push   %eax
c0006dd8:	e8 63 fe ff ff       	call   c0006c40 <get_virtual_address>
c0006ddd:	83 c4 10             	add    $0x10,%esp
c0006de0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006de3:	83 ec 08             	sub    $0x8,%esp
c0006de6:	ff 75 08             	pushl  0x8(%ebp)
c0006de9:	ff 75 e8             	pushl  -0x18(%ebp)
c0006dec:	e8 19 ff ff ff       	call   c0006d0a <add_map_entry>
c0006df1:	83 c4 10             	add    $0x10,%esp
c0006df4:	8b 45 08             	mov    0x8(%ebp),%eax
c0006df7:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006dfc:	89 c2                	mov    %eax,%edx
c0006dfe:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006e01:	01 d0                	add    %edx,%eax
c0006e03:	c9                   	leave  
c0006e04:	c3                   	ret    

c0006e05 <get_physical_address>:
c0006e05:	55                   	push   %ebp
c0006e06:	89 e5                	mov    %esp,%ebp
c0006e08:	83 ec 10             	sub    $0x10,%esp
c0006e0b:	ff 75 08             	pushl  0x8(%ebp)
c0006e0e:	e8 d0 fe ff ff       	call   c0006ce3 <ptr_pte>
c0006e13:	83 c4 04             	add    $0x4,%esp
c0006e16:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e19:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e1c:	8b 00                	mov    (%eax),%eax
c0006e1e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e23:	89 c2                	mov    %eax,%edx
c0006e25:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e28:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e2d:	09 d0                	or     %edx,%eax
c0006e2f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e32:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e35:	c9                   	leave  
c0006e36:	c3                   	ret    

c0006e37 <alloc_memory>:
c0006e37:	55                   	push   %ebp
c0006e38:	89 e5                	mov    %esp,%ebp
c0006e3a:	83 ec 18             	sub    $0x18,%esp
c0006e3d:	83 ec 08             	sub    $0x8,%esp
c0006e40:	ff 75 0c             	pushl  0xc(%ebp)
c0006e43:	ff 75 08             	pushl  0x8(%ebp)
c0006e46:	e8 f5 fd ff ff       	call   c0006c40 <get_virtual_address>
c0006e4b:	83 c4 10             	add    $0x10,%esp
c0006e4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e51:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e54:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006e59:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e5c:	eb 29                	jmp    c0006e87 <alloc_memory+0x50>
c0006e5e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006e65:	83 ec 0c             	sub    $0xc,%esp
c0006e68:	ff 75 0c             	pushl  0xc(%ebp)
c0006e6b:	e8 41 fd ff ff       	call   c0006bb1 <get_a_page>
c0006e70:	83 c4 10             	add    $0x10,%esp
c0006e73:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e76:	83 ec 08             	sub    $0x8,%esp
c0006e79:	ff 75 ec             	pushl  -0x14(%ebp)
c0006e7c:	ff 75 f4             	pushl  -0xc(%ebp)
c0006e7f:	e8 86 fe ff ff       	call   c0006d0a <add_map_entry>
c0006e84:	83 c4 10             	add    $0x10,%esp
c0006e87:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e8a:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006e8d:	89 55 08             	mov    %edx,0x8(%ebp)
c0006e90:	85 c0                	test   %eax,%eax
c0006e92:	75 ca                	jne    c0006e5e <alloc_memory+0x27>
c0006e94:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e97:	c9                   	leave  
c0006e98:	c3                   	ret    

c0006e99 <get_a_virtual_page>:
c0006e99:	55                   	push   %ebp
c0006e9a:	89 e5                	mov    %esp,%ebp
c0006e9c:	83 ec 18             	sub    $0x18,%esp
c0006e9f:	ff 75 08             	pushl  0x8(%ebp)
c0006ea2:	e8 0a fd ff ff       	call   c0006bb1 <get_a_page>
c0006ea7:	83 c4 04             	add    $0x4,%esp
c0006eaa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006ead:	83 ec 08             	sub    $0x8,%esp
c0006eb0:	ff 75 f4             	pushl  -0xc(%ebp)
c0006eb3:	ff 75 0c             	pushl  0xc(%ebp)
c0006eb6:	e8 4f fe ff ff       	call   c0006d0a <add_map_entry>
c0006ebb:	83 c4 10             	add    $0x10,%esp
c0006ebe:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ec1:	c9                   	leave  
c0006ec2:	c3                   	ret    

c0006ec3 <block2arena>:
c0006ec3:	55                   	push   %ebp
c0006ec4:	89 e5                	mov    %esp,%ebp
c0006ec6:	83 ec 10             	sub    $0x10,%esp
c0006ec9:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ecc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006ed1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ed4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ed7:	c9                   	leave  
c0006ed8:	c3                   	ret    

c0006ed9 <sys_malloc>:
c0006ed9:	55                   	push   %ebp
c0006eda:	89 e5                	mov    %esp,%ebp
c0006edc:	83 ec 58             	sub    $0x58,%esp
c0006edf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006ee6:	e8 a9 a9 ff ff       	call   c0001894 <get_running_thread_pcb>
c0006eeb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006eee:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006ef1:	8b 40 04             	mov    0x4(%eax),%eax
c0006ef4:	85 c0                	test   %eax,%eax
c0006ef6:	75 10                	jne    c0006f08 <sys_malloc+0x2f>
c0006ef8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006eff:	c7 45 ec 00 32 08 c0 	movl   $0xc0083200,-0x14(%ebp)
c0006f06:	eb 10                	jmp    c0006f18 <sys_malloc+0x3f>
c0006f08:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006f0f:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f12:	83 c0 0c             	add    $0xc,%eax
c0006f15:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f18:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0006f1f:	76 50                	jbe    c0006f71 <sys_malloc+0x98>
c0006f21:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f24:	05 0b 10 00 00       	add    $0x100b,%eax
c0006f29:	c1 e8 0c             	shr    $0xc,%eax
c0006f2c:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006f2f:	83 ec 08             	sub    $0x8,%esp
c0006f32:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f35:	ff 75 d8             	pushl  -0x28(%ebp)
c0006f38:	e8 fa fe ff ff       	call   c0006e37 <alloc_memory>
c0006f3d:	83 c4 10             	add    $0x10,%esp
c0006f40:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006f43:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006f46:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006f49:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f4c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0006f52:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f55:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0006f5c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f5f:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0006f63:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f66:	83 c0 0c             	add    $0xc,%eax
c0006f69:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f6c:	e9 7a 01 00 00       	jmp    c00070eb <sys_malloc+0x212>
c0006f71:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006f78:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006f7f:	eb 26                	jmp    c0006fa7 <sys_malloc+0xce>
c0006f81:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006f84:	89 d0                	mov    %edx,%eax
c0006f86:	01 c0                	add    %eax,%eax
c0006f88:	01 d0                	add    %edx,%eax
c0006f8a:	c1 e0 03             	shl    $0x3,%eax
c0006f8d:	89 c2                	mov    %eax,%edx
c0006f8f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f92:	01 d0                	add    %edx,%eax
c0006f94:	8b 00                	mov    (%eax),%eax
c0006f96:	39 45 08             	cmp    %eax,0x8(%ebp)
c0006f99:	77 08                	ja     c0006fa3 <sys_malloc+0xca>
c0006f9b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006f9e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fa1:	eb 0a                	jmp    c0006fad <sys_malloc+0xd4>
c0006fa3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006fa7:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0006fab:	7e d4                	jle    c0006f81 <sys_malloc+0xa8>
c0006fad:	83 ec 08             	sub    $0x8,%esp
c0006fb0:	ff 75 f0             	pushl  -0x10(%ebp)
c0006fb3:	6a 01                	push   $0x1
c0006fb5:	e8 7d fe ff ff       	call   c0006e37 <alloc_memory>
c0006fba:	83 c4 10             	add    $0x10,%esp
c0006fbd:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006fc0:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006fc3:	89 d0                	mov    %edx,%eax
c0006fc5:	01 c0                	add    %eax,%eax
c0006fc7:	01 d0                	add    %edx,%eax
c0006fc9:	c1 e0 03             	shl    $0x3,%eax
c0006fcc:	89 c2                	mov    %eax,%edx
c0006fce:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006fd1:	01 d0                	add    %edx,%eax
c0006fd3:	83 ec 04             	sub    $0x4,%esp
c0006fd6:	6a 18                	push   $0x18
c0006fd8:	50                   	push   %eax
c0006fd9:	ff 75 cc             	pushl  -0x34(%ebp)
c0006fdc:	e8 63 43 00 00       	call   c000b344 <Memcpy>
c0006fe1:	83 c4 10             	add    $0x10,%esp
c0006fe4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006fe7:	89 d0                	mov    %edx,%eax
c0006fe9:	01 c0                	add    %eax,%eax
c0006feb:	01 d0                	add    %edx,%eax
c0006fed:	c1 e0 03             	shl    $0x3,%eax
c0006ff0:	89 c2                	mov    %eax,%edx
c0006ff2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ff5:	01 d0                	add    %edx,%eax
c0006ff7:	83 c0 08             	add    $0x8,%eax
c0006ffa:	83 ec 0c             	sub    $0xc,%esp
c0006ffd:	50                   	push   %eax
c0006ffe:	e8 c0 34 00 00       	call   c000a4c3 <isListEmpty>
c0007003:	83 c4 10             	add    $0x10,%esp
c0007006:	3c 01                	cmp    $0x1,%al
c0007008:	0f 85 91 00 00 00    	jne    c000709f <sys_malloc+0x1c6>
c000700e:	83 ec 08             	sub    $0x8,%esp
c0007011:	ff 75 f0             	pushl  -0x10(%ebp)
c0007014:	6a 01                	push   $0x1
c0007016:	e8 1c fe ff ff       	call   c0006e37 <alloc_memory>
c000701b:	83 c4 10             	add    $0x10,%esp
c000701e:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007021:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007024:	8b 00                	mov    (%eax),%eax
c0007026:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0007029:	c7 45 c0 0c 00 00 00 	movl   $0xc,-0x40(%ebp)
c0007030:	b8 00 10 00 00       	mov    $0x1000,%eax
c0007035:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0007038:	ba 00 00 00 00       	mov    $0x0,%edx
c000703d:	f7 75 c4             	divl   -0x3c(%ebp)
c0007040:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007043:	8b 55 c8             	mov    -0x38(%ebp),%edx
c0007046:	8b 45 c0             	mov    -0x40(%ebp),%eax
c0007049:	01 d0                	add    %edx,%eax
c000704b:	89 45 b8             	mov    %eax,-0x48(%ebp)
c000704e:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0007055:	eb 3b                	jmp    c0007092 <sys_malloc+0x1b9>
c0007057:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000705a:	0f af 45 c4          	imul   -0x3c(%ebp),%eax
c000705e:	89 c2                	mov    %eax,%edx
c0007060:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007063:	01 d0                	add    %edx,%eax
c0007065:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c0007068:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c000706b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000706e:	89 d0                	mov    %edx,%eax
c0007070:	01 c0                	add    %eax,%eax
c0007072:	01 d0                	add    %edx,%eax
c0007074:	c1 e0 03             	shl    $0x3,%eax
c0007077:	89 c2                	mov    %eax,%edx
c0007079:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000707c:	01 d0                	add    %edx,%eax
c000707e:	83 c0 08             	add    $0x8,%eax
c0007081:	83 ec 08             	sub    $0x8,%esp
c0007084:	51                   	push   %ecx
c0007085:	50                   	push   %eax
c0007086:	e8 59 34 00 00       	call   c000a4e4 <appendToDoubleLinkList>
c000708b:	83 c4 10             	add    $0x10,%esp
c000708e:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007092:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007095:	8d 50 ff             	lea    -0x1(%eax),%edx
c0007098:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000709b:	39 c2                	cmp    %eax,%edx
c000709d:	77 b8                	ja     c0007057 <sys_malloc+0x17e>
c000709f:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00070a2:	89 d0                	mov    %edx,%eax
c00070a4:	01 c0                	add    %eax,%eax
c00070a6:	01 d0                	add    %edx,%eax
c00070a8:	c1 e0 03             	shl    $0x3,%eax
c00070ab:	89 c2                	mov    %eax,%edx
c00070ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070b0:	01 d0                	add    %edx,%eax
c00070b2:	83 c0 08             	add    $0x8,%eax
c00070b5:	83 ec 0c             	sub    $0xc,%esp
c00070b8:	50                   	push   %eax
c00070b9:	e8 ac 34 00 00       	call   c000a56a <popFromDoubleLinkList>
c00070be:	83 c4 10             	add    $0x10,%esp
c00070c1:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00070c4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00070c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070ca:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00070cd:	83 ec 0c             	sub    $0xc,%esp
c00070d0:	50                   	push   %eax
c00070d1:	e8 ed fd ff ff       	call   c0006ec3 <block2arena>
c00070d6:	83 c4 10             	add    $0x10,%esp
c00070d9:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00070dc:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00070df:	8b 40 04             	mov    0x4(%eax),%eax
c00070e2:	8d 50 ff             	lea    -0x1(%eax),%edx
c00070e5:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00070e8:	89 50 04             	mov    %edx,0x4(%eax)
c00070eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00070ee:	c9                   	leave  
c00070ef:	c3                   	ret    

c00070f0 <remove_map_entry>:
c00070f0:	55                   	push   %ebp
c00070f1:	89 e5                	mov    %esp,%ebp
c00070f3:	83 ec 10             	sub    $0x10,%esp
c00070f6:	ff 75 08             	pushl  0x8(%ebp)
c00070f9:	e8 e5 fb ff ff       	call   c0006ce3 <ptr_pte>
c00070fe:	83 c4 04             	add    $0x4,%esp
c0007101:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007104:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007107:	8b 10                	mov    (%eax),%edx
c0007109:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000710c:	89 10                	mov    %edx,(%eax)
c000710e:	90                   	nop
c000710f:	c9                   	leave  
c0007110:	c3                   	ret    

c0007111 <free_a_page>:
c0007111:	55                   	push   %ebp
c0007112:	89 e5                	mov    %esp,%ebp
c0007114:	83 ec 20             	sub    $0x20,%esp
c0007117:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000711b:	75 21                	jne    c000713e <free_a_page+0x2d>
c000711d:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0007122:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007125:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c000712a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000712d:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0007132:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007135:	c7 45 fc 8c 16 01 c0 	movl   $0xc001168c,-0x4(%ebp)
c000713c:	eb 1f                	jmp    c000715d <free_a_page+0x4c>
c000713e:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0007143:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007146:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c000714b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000714e:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0007153:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007156:	c7 45 fc c4 1e 01 c0 	movl   $0xc0011ec4,-0x4(%ebp)
c000715d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007160:	c1 e8 0c             	shr    $0xc,%eax
c0007163:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0007166:	6a 00                	push   $0x0
c0007168:	ff 75 f8             	pushl  -0x8(%ebp)
c000716b:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c000716e:	50                   	push   %eax
c000716f:	e8 4d f8 ff ff       	call   c00069c1 <set_bit_val>
c0007174:	83 c4 0c             	add    $0xc,%esp
c0007177:	ff 75 08             	pushl  0x8(%ebp)
c000717a:	e8 86 fc ff ff       	call   c0006e05 <get_physical_address>
c000717f:	83 c4 04             	add    $0x4,%esp
c0007182:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007185:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007188:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000718e:	85 c0                	test   %eax,%eax
c0007190:	0f 48 c2             	cmovs  %edx,%eax
c0007193:	c1 f8 0c             	sar    $0xc,%eax
c0007196:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007199:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000719c:	6a 00                	push   $0x0
c000719e:	ff 75 f0             	pushl  -0x10(%ebp)
c00071a1:	50                   	push   %eax
c00071a2:	e8 1a f8 ff ff       	call   c00069c1 <set_bit_val>
c00071a7:	83 c4 0c             	add    $0xc,%esp
c00071aa:	ff 75 08             	pushl  0x8(%ebp)
c00071ad:	e8 3e ff ff ff       	call   c00070f0 <remove_map_entry>
c00071b2:	83 c4 04             	add    $0x4,%esp
c00071b5:	90                   	nop
c00071b6:	c9                   	leave  
c00071b7:	c3                   	ret    

c00071b8 <sys_free>:
c00071b8:	55                   	push   %ebp
c00071b9:	89 e5                	mov    %esp,%ebp
c00071bb:	83 ec 48             	sub    $0x48,%esp
c00071be:	e8 d1 a6 ff ff       	call   c0001894 <get_running_thread_pcb>
c00071c3:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00071c6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00071c9:	8b 40 04             	mov    0x4(%eax),%eax
c00071cc:	85 c0                	test   %eax,%eax
c00071ce:	75 09                	jne    c00071d9 <sys_free+0x21>
c00071d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00071d7:	eb 07                	jmp    c00071e0 <sys_free+0x28>
c00071d9:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00071e0:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c00071e7:	76 4d                	jbe    c0007236 <sys_free+0x7e>
c00071e9:	8b 45 08             	mov    0x8(%ebp),%eax
c00071ec:	83 e8 0c             	sub    $0xc,%eax
c00071ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00071f2:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c00071f6:	8b 45 0c             	mov    0xc(%ebp),%eax
c00071f9:	05 ff 0f 00 00       	add    $0xfff,%eax
c00071fe:	c1 e8 0c             	shr    $0xc,%eax
c0007201:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007204:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000720b:	eb 1c                	jmp    c0007229 <sys_free+0x71>
c000720d:	83 ec 08             	sub    $0x8,%esp
c0007210:	ff 75 f4             	pushl  -0xc(%ebp)
c0007213:	ff 75 f0             	pushl  -0x10(%ebp)
c0007216:	e8 f6 fe ff ff       	call   c0007111 <free_a_page>
c000721b:	83 c4 10             	add    $0x10,%esp
c000721e:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
c0007225:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007229:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000722c:	39 45 d8             	cmp    %eax,-0x28(%ebp)
c000722f:	77 dc                	ja     c000720d <sys_free+0x55>
c0007231:	e9 ef 00 00 00       	jmp    c0007325 <sys_free+0x16d>
c0007236:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000723d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007244:	eb 24                	jmp    c000726a <sys_free+0xb2>
c0007246:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007249:	89 d0                	mov    %edx,%eax
c000724b:	01 c0                	add    %eax,%eax
c000724d:	01 d0                	add    %edx,%eax
c000724f:	c1 e0 03             	shl    $0x3,%eax
c0007252:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0007257:	8b 00                	mov    (%eax),%eax
c0007259:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000725c:	77 08                	ja     c0007266 <sys_free+0xae>
c000725e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007261:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007264:	eb 0a                	jmp    c0007270 <sys_free+0xb8>
c0007266:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000726a:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c000726e:	7e d6                	jle    c0007246 <sys_free+0x8e>
c0007270:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007273:	89 d0                	mov    %edx,%eax
c0007275:	01 c0                	add    %eax,%eax
c0007277:	01 d0                	add    %edx,%eax
c0007279:	c1 e0 03             	shl    $0x3,%eax
c000727c:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0007281:	8b 10                	mov    (%eax),%edx
c0007283:	89 55 b8             	mov    %edx,-0x48(%ebp)
c0007286:	8b 50 04             	mov    0x4(%eax),%edx
c0007289:	89 55 bc             	mov    %edx,-0x44(%ebp)
c000728c:	8b 50 08             	mov    0x8(%eax),%edx
c000728f:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0007292:	8b 50 0c             	mov    0xc(%eax),%edx
c0007295:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c0007298:	8b 50 10             	mov    0x10(%eax),%edx
c000729b:	89 55 c8             	mov    %edx,-0x38(%ebp)
c000729e:	8b 40 14             	mov    0x14(%eax),%eax
c00072a1:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00072a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00072a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00072aa:	83 ec 0c             	sub    $0xc,%esp
c00072ad:	ff 75 d4             	pushl  -0x2c(%ebp)
c00072b0:	e8 0e fc ff ff       	call   c0006ec3 <block2arena>
c00072b5:	83 c4 10             	add    $0x10,%esp
c00072b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00072bb:	83 ec 08             	sub    $0x8,%esp
c00072be:	ff 75 d4             	pushl  -0x2c(%ebp)
c00072c1:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00072c4:	83 c0 08             	add    $0x8,%eax
c00072c7:	50                   	push   %eax
c00072c8:	e8 17 32 00 00       	call   c000a4e4 <appendToDoubleLinkList>
c00072cd:	83 c4 10             	add    $0x10,%esp
c00072d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00072d3:	8b 40 04             	mov    0x4(%eax),%eax
c00072d6:	8d 50 01             	lea    0x1(%eax),%edx
c00072d9:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00072dc:	89 50 04             	mov    %edx,0x4(%eax)
c00072df:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00072e2:	8b 50 04             	mov    0x4(%eax),%edx
c00072e5:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00072e8:	39 c2                	cmp    %eax,%edx
c00072ea:	75 39                	jne    c0007325 <sys_free+0x16d>
c00072ec:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00072f3:	eb 16                	jmp    c000730b <sys_free+0x153>
c00072f5:	83 ec 0c             	sub    $0xc,%esp
c00072f8:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00072fb:	83 c0 08             	add    $0x8,%eax
c00072fe:	50                   	push   %eax
c00072ff:	e8 66 32 00 00       	call   c000a56a <popFromDoubleLinkList>
c0007304:	83 c4 10             	add    $0x10,%esp
c0007307:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000730b:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000730e:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0007311:	7c e2                	jl     c00072f5 <sys_free+0x13d>
c0007313:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007316:	83 ec 08             	sub    $0x8,%esp
c0007319:	ff 75 f4             	pushl  -0xc(%ebp)
c000731c:	50                   	push   %eax
c000731d:	e8 ef fd ff ff       	call   c0007111 <free_a_page>
c0007322:	83 c4 10             	add    $0x10,%esp
c0007325:	90                   	nop
c0007326:	c9                   	leave  
c0007327:	c3                   	ret    

c0007328 <init_memory_block_desc>:
c0007328:	55                   	push   %ebp
c0007329:	89 e5                	mov    %esp,%ebp
c000732b:	83 ec 18             	sub    $0x18,%esp
c000732e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007335:	e9 b2 00 00 00       	jmp    c00073ec <init_memory_block_desc+0xc4>
c000733a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c000733e:	75 1b                	jne    c000735b <init_memory_block_desc+0x33>
c0007340:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007343:	89 d0                	mov    %edx,%eax
c0007345:	01 c0                	add    %eax,%eax
c0007347:	01 d0                	add    %edx,%eax
c0007349:	c1 e0 03             	shl    $0x3,%eax
c000734c:	89 c2                	mov    %eax,%edx
c000734e:	8b 45 08             	mov    0x8(%ebp),%eax
c0007351:	01 d0                	add    %edx,%eax
c0007353:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c0007359:	eb 2e                	jmp    c0007389 <init_memory_block_desc+0x61>
c000735b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000735e:	89 d0                	mov    %edx,%eax
c0007360:	01 c0                	add    %eax,%eax
c0007362:	01 d0                	add    %edx,%eax
c0007364:	c1 e0 03             	shl    $0x3,%eax
c0007367:	8d 50 e8             	lea    -0x18(%eax),%edx
c000736a:	8b 45 08             	mov    0x8(%ebp),%eax
c000736d:	01 d0                	add    %edx,%eax
c000736f:	8b 08                	mov    (%eax),%ecx
c0007371:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007374:	89 d0                	mov    %edx,%eax
c0007376:	01 c0                	add    %eax,%eax
c0007378:	01 d0                	add    %edx,%eax
c000737a:	c1 e0 03             	shl    $0x3,%eax
c000737d:	89 c2                	mov    %eax,%edx
c000737f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007382:	01 d0                	add    %edx,%eax
c0007384:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c0007387:	89 10                	mov    %edx,(%eax)
c0007389:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000738c:	89 d0                	mov    %edx,%eax
c000738e:	01 c0                	add    %eax,%eax
c0007390:	01 d0                	add    %edx,%eax
c0007392:	c1 e0 03             	shl    $0x3,%eax
c0007395:	89 c2                	mov    %eax,%edx
c0007397:	8b 45 08             	mov    0x8(%ebp),%eax
c000739a:	01 d0                	add    %edx,%eax
c000739c:	8b 00                	mov    (%eax),%eax
c000739e:	89 c1                	mov    %eax,%ecx
c00073a0:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c00073a5:	ba 00 00 00 00       	mov    $0x0,%edx
c00073aa:	f7 f1                	div    %ecx
c00073ac:	89 c1                	mov    %eax,%ecx
c00073ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00073b1:	89 d0                	mov    %edx,%eax
c00073b3:	01 c0                	add    %eax,%eax
c00073b5:	01 d0                	add    %edx,%eax
c00073b7:	c1 e0 03             	shl    $0x3,%eax
c00073ba:	89 c2                	mov    %eax,%edx
c00073bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00073bf:	01 d0                	add    %edx,%eax
c00073c1:	89 ca                	mov    %ecx,%edx
c00073c3:	89 50 04             	mov    %edx,0x4(%eax)
c00073c6:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00073c9:	89 d0                	mov    %edx,%eax
c00073cb:	01 c0                	add    %eax,%eax
c00073cd:	01 d0                	add    %edx,%eax
c00073cf:	c1 e0 03             	shl    $0x3,%eax
c00073d2:	89 c2                	mov    %eax,%edx
c00073d4:	8b 45 08             	mov    0x8(%ebp),%eax
c00073d7:	01 d0                	add    %edx,%eax
c00073d9:	83 c0 08             	add    $0x8,%eax
c00073dc:	83 ec 0c             	sub    $0xc,%esp
c00073df:	50                   	push   %eax
c00073e0:	e8 b0 30 00 00       	call   c000a495 <initDoubleLinkList>
c00073e5:	83 c4 10             	add    $0x10,%esp
c00073e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00073ec:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00073f0:	0f 8e 44 ff ff ff    	jle    c000733a <init_memory_block_desc+0x12>
c00073f6:	90                   	nop
c00073f7:	c9                   	leave  
c00073f8:	c3                   	ret    

c00073f9 <init_memory2>:
c00073f9:	55                   	push   %ebp
c00073fa:	89 e5                	mov    %esp,%ebp
c00073fc:	83 ec 38             	sub    $0x38,%esp
c00073ff:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c0007406:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c000740d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007410:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c0007415:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007418:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c000741d:	29 c2                	sub    %eax,%edx
c000741f:	89 d0                	mov    %edx,%eax
c0007421:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007424:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007427:	89 c2                	mov    %eax,%edx
c0007429:	c1 ea 1f             	shr    $0x1f,%edx
c000742c:	01 d0                	add    %edx,%eax
c000742e:	d1 f8                	sar    %eax
c0007430:	a3 98 16 01 c0       	mov    %eax,0xc0011698
c0007435:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000743a:	83 ec 0c             	sub    $0xc,%esp
c000743d:	50                   	push   %eax
c000743e:	e8 0f 06 00 00       	call   c0007a52 <disp_int>
c0007443:	83 c4 10             	add    $0x10,%esp
c0007446:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000744b:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000744e:	29 c2                	sub    %eax,%edx
c0007450:	89 d0                	mov    %edx,%eax
c0007452:	a3 d0 1e 01 c0       	mov    %eax,0xc0011ed0
c0007457:	83 ec 0c             	sub    $0xc,%esp
c000745a:	68 36 ac 00 c0       	push   $0xc000ac36
c000745f:	e8 28 a1 ff ff       	call   c000158c <disp_str>
c0007464:	83 c4 10             	add    $0x10,%esp
c0007467:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c000746c:	83 ec 0c             	sub    $0xc,%esp
c000746f:	50                   	push   %eax
c0007470:	e8 dd 05 00 00       	call   c0007a52 <disp_int>
c0007475:	83 c4 10             	add    $0x10,%esp
c0007478:	83 ec 0c             	sub    $0xc,%esp
c000747b:	68 36 ac 00 c0       	push   $0xc000ac36
c0007480:	e8 07 a1 ff ff       	call   c000158c <disp_str>
c0007485:	83 c4 10             	add    $0x10,%esp
c0007488:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000748d:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007492:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007498:	85 c0                	test   %eax,%eax
c000749a:	0f 48 c2             	cmovs  %edx,%eax
c000749d:	c1 f8 0c             	sar    $0xc,%eax
c00074a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00074a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074a6:	83 c0 07             	add    $0x7,%eax
c00074a9:	8d 50 07             	lea    0x7(%eax),%edx
c00074ac:	85 c0                	test   %eax,%eax
c00074ae:	0f 48 c2             	cmovs  %edx,%eax
c00074b1:	c1 f8 03             	sar    $0x3,%eax
c00074b4:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c00074b9:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00074be:	2d 00 00 00 40       	sub    $0x40000000,%eax
c00074c3:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c00074c8:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00074ce:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c00074d3:	83 ec 04             	sub    $0x4,%esp
c00074d6:	52                   	push   %edx
c00074d7:	6a 00                	push   $0x0
c00074d9:	50                   	push   %eax
c00074da:	e8 93 3e 00 00       	call   c000b372 <Memset>
c00074df:	83 c4 10             	add    $0x10,%esp
c00074e2:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c00074e7:	05 ff 0f 00 00       	add    $0xfff,%eax
c00074ec:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00074f2:	85 c0                	test   %eax,%eax
c00074f4:	0f 48 c2             	cmovs  %edx,%eax
c00074f7:	c1 f8 0c             	sar    $0xc,%eax
c00074fa:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00074fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007500:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007503:	ff 75 e8             	pushl  -0x18(%ebp)
c0007506:	6a 01                	push   $0x1
c0007508:	6a 00                	push   $0x0
c000750a:	68 8c 16 01 c0       	push   $0xc001168c
c000750f:	e8 28 f5 ff ff       	call   c0006a3c <set_bits>
c0007514:	83 c4 10             	add    $0x10,%esp
c0007517:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c000751c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007521:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007527:	85 c0                	test   %eax,%eax
c0007529:	0f 48 c2             	cmovs  %edx,%eax
c000752c:	c1 f8 0c             	sar    $0xc,%eax
c000752f:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007532:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007535:	83 c0 07             	add    $0x7,%eax
c0007538:	8d 50 07             	lea    0x7(%eax),%edx
c000753b:	85 c0                	test   %eax,%eax
c000753d:	0f 48 c2             	cmovs  %edx,%eax
c0007540:	c1 f8 03             	sar    $0x3,%eax
c0007543:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c0007548:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c000754d:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c0007553:	01 d0                	add    %edx,%eax
c0007555:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c000755a:	8b 15 c8 1e 01 c0    	mov    0xc0011ec8,%edx
c0007560:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0007565:	83 ec 04             	sub    $0x4,%esp
c0007568:	52                   	push   %edx
c0007569:	6a 00                	push   $0x0
c000756b:	50                   	push   %eax
c000756c:	e8 01 3e 00 00       	call   c000b372 <Memset>
c0007571:	83 c4 10             	add    $0x10,%esp
c0007574:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0007579:	05 ff 0f 00 00       	add    $0xfff,%eax
c000757e:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007584:	85 c0                	test   %eax,%eax
c0007586:	0f 48 c2             	cmovs  %edx,%eax
c0007589:	c1 f8 0c             	sar    $0xc,%eax
c000758c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000758f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007592:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007595:	ff 75 e8             	pushl  -0x18(%ebp)
c0007598:	6a 01                	push   $0x1
c000759a:	ff 75 e0             	pushl  -0x20(%ebp)
c000759d:	68 8c 16 01 c0       	push   $0xc001168c
c00075a2:	e8 95 f4 ff ff       	call   c0006a3c <set_bits>
c00075a7:	83 c4 10             	add    $0x10,%esp
c00075aa:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c00075b1:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00075b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00075b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00075ba:	83 c0 07             	add    $0x7,%eax
c00075bd:	8d 50 07             	lea    0x7(%eax),%edx
c00075c0:	85 c0                	test   %eax,%eax
c00075c2:	0f 48 c2             	cmovs  %edx,%eax
c00075c5:	c1 f8 03             	sar    $0x3,%eax
c00075c8:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c00075cd:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00075d2:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00075d8:	01 c2                	add    %eax,%edx
c00075da:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c00075df:	01 d0                	add    %edx,%eax
c00075e1:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c00075e6:	8b 15 38 f7 00 c0    	mov    0xc000f738,%edx
c00075ec:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c00075f1:	83 ec 04             	sub    $0x4,%esp
c00075f4:	52                   	push   %edx
c00075f5:	6a 00                	push   $0x0
c00075f7:	50                   	push   %eax
c00075f8:	e8 75 3d 00 00       	call   c000b372 <Memset>
c00075fd:	83 c4 10             	add    $0x10,%esp
c0007600:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007603:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007606:	01 d0                	add    %edx,%eax
c0007608:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000760b:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0007610:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007615:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000761b:	85 c0                	test   %eax,%eax
c000761d:	0f 48 c2             	cmovs  %edx,%eax
c0007620:	c1 f8 0c             	sar    $0xc,%eax
c0007623:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007626:	ff 75 e8             	pushl  -0x18(%ebp)
c0007629:	6a 01                	push   $0x1
c000762b:	ff 75 e0             	pushl  -0x20(%ebp)
c000762e:	68 8c 16 01 c0       	push   $0xc001168c
c0007633:	e8 04 f4 ff ff       	call   c0006a3c <set_bits>
c0007638:	83 c4 10             	add    $0x10,%esp
c000763b:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000763e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007641:	01 d0                	add    %edx,%eax
c0007643:	c1 e0 0c             	shl    $0xc,%eax
c0007646:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c000764b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000764e:	83 c0 02             	add    $0x2,%eax
c0007651:	c1 e0 0c             	shl    $0xc,%eax
c0007654:	89 c2                	mov    %eax,%edx
c0007656:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007659:	01 d0                	add    %edx,%eax
c000765b:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c0007660:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c0007667:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000766a:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000766d:	90                   	nop
c000766e:	c9                   	leave  
c000766f:	c3                   	ret    

c0007670 <init_memory>:
c0007670:	55                   	push   %ebp
c0007671:	89 e5                	mov    %esp,%ebp
c0007673:	83 ec 38             	sub    $0x38,%esp
c0007676:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c000767d:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007684:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c000768b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000768e:	05 00 00 10 00       	add    $0x100000,%eax
c0007693:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007696:	8b 45 08             	mov    0x8(%ebp),%eax
c0007699:	2b 45 e8             	sub    -0x18(%ebp),%eax
c000769c:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00076a2:	85 c0                	test   %eax,%eax
c00076a4:	0f 48 c2             	cmovs  %edx,%eax
c00076a7:	c1 f8 0c             	sar    $0xc,%eax
c00076aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00076ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00076b0:	89 c2                	mov    %eax,%edx
c00076b2:	c1 ea 1f             	shr    $0x1f,%edx
c00076b5:	01 d0                	add    %edx,%eax
c00076b7:	d1 f8                	sar    %eax
c00076b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00076bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00076bf:	2b 45 e0             	sub    -0x20(%ebp),%eax
c00076c2:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00076c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00076c8:	8d 50 07             	lea    0x7(%eax),%edx
c00076cb:	85 c0                	test   %eax,%eax
c00076cd:	0f 48 c2             	cmovs  %edx,%eax
c00076d0:	c1 f8 03             	sar    $0x3,%eax
c00076d3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00076d6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00076d9:	8d 50 07             	lea    0x7(%eax),%edx
c00076dc:	85 c0                	test   %eax,%eax
c00076de:	0f 48 c2             	cmovs  %edx,%eax
c00076e1:	c1 f8 03             	sar    $0x3,%eax
c00076e4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00076e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00076ea:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c00076ef:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00076f4:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00076f7:	c1 e2 0c             	shl    $0xc,%edx
c00076fa:	01 d0                	add    %edx,%eax
c00076fc:	a3 cc 1e 01 c0       	mov    %eax,0xc0011ecc
c0007701:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007704:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c0007709:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000770c:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c0007711:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0007716:	83 ec 04             	sub    $0x4,%esp
c0007719:	ff 75 d8             	pushl  -0x28(%ebp)
c000771c:	6a 00                	push   $0x0
c000771e:	50                   	push   %eax
c000771f:	e8 4e 3c 00 00       	call   c000b372 <Memset>
c0007724:	83 c4 10             	add    $0x10,%esp
c0007727:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000772a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000772d:	01 d0                	add    %edx,%eax
c000772f:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c0007734:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007737:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c000773c:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0007741:	83 ec 04             	sub    $0x4,%esp
c0007744:	ff 75 d4             	pushl  -0x2c(%ebp)
c0007747:	6a 00                	push   $0x0
c0007749:	50                   	push   %eax
c000774a:	e8 23 3c 00 00       	call   c000b372 <Memset>
c000774f:	83 c4 10             	add    $0x10,%esp
c0007752:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007755:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c000775a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000775d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007760:	01 c2                	add    %eax,%edx
c0007762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007765:	01 d0                	add    %edx,%eax
c0007767:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c000776c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000776f:	05 00 00 10 00       	add    $0x100000,%eax
c0007774:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c0007779:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c000777e:	83 ec 04             	sub    $0x4,%esp
c0007781:	ff 75 d8             	pushl  -0x28(%ebp)
c0007784:	6a 00                	push   $0x0
c0007786:	50                   	push   %eax
c0007787:	e8 e6 3b 00 00       	call   c000b372 <Memset>
c000778c:	83 c4 10             	add    $0x10,%esp
c000778f:	83 ec 0c             	sub    $0xc,%esp
c0007792:	68 00 32 08 c0       	push   $0xc0083200
c0007797:	e8 8c fb ff ff       	call   c0007328 <init_memory_block_desc>
c000779c:	83 c4 10             	add    $0x10,%esp
c000779f:	90                   	nop
c00077a0:	c9                   	leave  
c00077a1:	c3                   	ret    

c00077a2 <untar>:
c00077a2:	55                   	push   %ebp
c00077a3:	89 e5                	mov    %esp,%ebp
c00077a5:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c00077ab:	83 ec 08             	sub    $0x8,%esp
c00077ae:	6a 00                	push   $0x0
c00077b0:	ff 75 08             	pushl  0x8(%ebp)
c00077b3:	e8 14 e5 ff ff       	call   c0005ccc <open>
c00077b8:	83 c4 10             	add    $0x10,%esp
c00077bb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00077be:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00077c5:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c00077cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00077d3:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00077da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00077de:	7e 58                	jle    c0007838 <untar+0x96>
c00077e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00077e3:	05 ff 01 00 00       	add    $0x1ff,%eax
c00077e8:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00077ee:	85 c0                	test   %eax,%eax
c00077f0:	0f 48 c2             	cmovs  %edx,%eax
c00077f3:	c1 f8 09             	sar    $0x9,%eax
c00077f6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00077f9:	83 ec 04             	sub    $0x4,%esp
c00077fc:	68 00 20 00 00       	push   $0x2000
c0007801:	6a 00                	push   $0x0
c0007803:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007809:	50                   	push   %eax
c000780a:	e8 63 3b 00 00       	call   c000b372 <Memset>
c000780f:	83 c4 10             	add    $0x10,%esp
c0007812:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0007815:	c1 e0 09             	shl    $0x9,%eax
c0007818:	2b 45 f4             	sub    -0xc(%ebp),%eax
c000781b:	83 ec 04             	sub    $0x4,%esp
c000781e:	50                   	push   %eax
c000781f:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007825:	50                   	push   %eax
c0007826:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007829:	e8 23 e5 ff ff       	call   c0005d51 <read>
c000782e:	83 c4 10             	add    $0x10,%esp
c0007831:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0007838:	83 ec 04             	sub    $0x4,%esp
c000783b:	68 00 20 00 00       	push   $0x2000
c0007840:	6a 00                	push   $0x0
c0007842:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007848:	50                   	push   %eax
c0007849:	e8 24 3b 00 00       	call   c000b372 <Memset>
c000784e:	83 c4 10             	add    $0x10,%esp
c0007851:	83 ec 04             	sub    $0x4,%esp
c0007854:	68 00 02 00 00       	push   $0x200
c0007859:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000785f:	50                   	push   %eax
c0007860:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007863:	e8 e9 e4 ff ff       	call   c0005d51 <read>
c0007868:	83 c4 10             	add    $0x10,%esp
c000786b:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000786e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007872:	0f 84 1f 01 00 00    	je     c0007997 <untar+0x1f5>
c0007878:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000787b:	01 45 f4             	add    %eax,-0xc(%ebp)
c000787e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c0007885:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000788b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000788e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007891:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007894:	83 ec 08             	sub    $0x8,%esp
c0007897:	6a 07                	push   $0x7
c0007899:	ff 75 cc             	pushl  -0x34(%ebp)
c000789c:	e8 2b e4 ff ff       	call   c0005ccc <open>
c00078a1:	83 c4 10             	add    $0x10,%esp
c00078a4:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00078a7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00078ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00078b1:	83 c0 7c             	add    $0x7c,%eax
c00078b4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00078b7:	83 ec 0c             	sub    $0xc,%esp
c00078ba:	ff 75 cc             	pushl  -0x34(%ebp)
c00078bd:	e8 e9 3a 00 00       	call   c000b3ab <Strlen>
c00078c2:	83 c4 10             	add    $0x10,%esp
c00078c5:	85 c0                	test   %eax,%eax
c00078c7:	75 16                	jne    c00078df <untar+0x13d>
c00078c9:	83 ec 0c             	sub    $0xc,%esp
c00078cc:	ff 75 c4             	pushl  -0x3c(%ebp)
c00078cf:	e8 d7 3a 00 00       	call   c000b3ab <Strlen>
c00078d4:	83 c4 10             	add    $0x10,%esp
c00078d7:	85 c0                	test   %eax,%eax
c00078d9:	0f 84 bb 00 00 00    	je     c000799a <untar+0x1f8>
c00078df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00078e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078e5:	eb 1f                	jmp    c0007906 <untar+0x164>
c00078e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00078ea:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00078f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078f4:	0f b6 00             	movzbl (%eax),%eax
c00078f7:	0f be c0             	movsbl %al,%eax
c00078fa:	83 e8 30             	sub    $0x30,%eax
c00078fd:	01 d0                	add    %edx,%eax
c00078ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007902:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0007906:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007909:	0f b6 00             	movzbl (%eax),%eax
c000790c:	84 c0                	test   %al,%al
c000790e:	75 d7                	jne    c00078e7 <untar+0x145>
c0007910:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007913:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007916:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c000791d:	eb 5f                	jmp    c000797e <untar+0x1dc>
c000791f:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007922:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c0007925:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c0007929:	89 45 bc             	mov    %eax,-0x44(%ebp)
c000792c:	83 ec 04             	sub    $0x4,%esp
c000792f:	68 00 02 00 00       	push   $0x200
c0007934:	6a 00                	push   $0x0
c0007936:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000793c:	50                   	push   %eax
c000793d:	e8 30 3a 00 00       	call   c000b372 <Memset>
c0007942:	83 c4 10             	add    $0x10,%esp
c0007945:	83 ec 04             	sub    $0x4,%esp
c0007948:	ff 75 bc             	pushl  -0x44(%ebp)
c000794b:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007951:	50                   	push   %eax
c0007952:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007955:	e8 f7 e3 ff ff       	call   c0005d51 <read>
c000795a:	83 c4 10             	add    $0x10,%esp
c000795d:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007960:	83 ec 04             	sub    $0x4,%esp
c0007963:	ff 75 bc             	pushl  -0x44(%ebp)
c0007966:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000796c:	50                   	push   %eax
c000796d:	ff 75 c8             	pushl  -0x38(%ebp)
c0007970:	e8 50 e4 ff ff       	call   c0005dc5 <write>
c0007975:	83 c4 10             	add    $0x10,%esp
c0007978:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000797b:	29 45 e8             	sub    %eax,-0x18(%ebp)
c000797e:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007982:	75 9b                	jne    c000791f <untar+0x17d>
c0007984:	83 ec 0c             	sub    $0xc,%esp
c0007987:	ff 75 c8             	pushl  -0x38(%ebp)
c000798a:	e8 bb e4 ff ff       	call   c0005e4a <close>
c000798f:	83 c4 10             	add    $0x10,%esp
c0007992:	e9 43 fe ff ff       	jmp    c00077da <untar+0x38>
c0007997:	90                   	nop
c0007998:	eb 01                	jmp    c000799b <untar+0x1f9>
c000799a:	90                   	nop
c000799b:	83 ec 0c             	sub    $0xc,%esp
c000799e:	ff 75 e4             	pushl  -0x1c(%ebp)
c00079a1:	e8 a4 e4 ff ff       	call   c0005e4a <close>
c00079a6:	83 c4 10             	add    $0x10,%esp
c00079a9:	90                   	nop
c00079aa:	c9                   	leave  
c00079ab:	c3                   	ret    

c00079ac <atoi>:
c00079ac:	55                   	push   %ebp
c00079ad:	89 e5                	mov    %esp,%ebp
c00079af:	83 ec 10             	sub    $0x10,%esp
c00079b2:	8b 45 08             	mov    0x8(%ebp),%eax
c00079b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00079b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00079bb:	8d 50 01             	lea    0x1(%eax),%edx
c00079be:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00079c1:	c6 00 30             	movb   $0x30,(%eax)
c00079c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00079c7:	8d 50 01             	lea    0x1(%eax),%edx
c00079ca:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00079cd:	c6 00 78             	movb   $0x78,(%eax)
c00079d0:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c00079d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00079d8:	75 0e                	jne    c00079e8 <atoi+0x3c>
c00079da:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00079dd:	8d 50 01             	lea    0x1(%eax),%edx
c00079e0:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00079e3:	c6 00 30             	movb   $0x30,(%eax)
c00079e6:	eb 61                	jmp    c0007a49 <atoi+0x9d>
c00079e8:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c00079ef:	eb 52                	jmp    c0007a43 <atoi+0x97>
c00079f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00079f4:	8b 55 0c             	mov    0xc(%ebp),%edx
c00079f7:	89 c1                	mov    %eax,%ecx
c00079f9:	d3 fa                	sar    %cl,%edx
c00079fb:	89 d0                	mov    %edx,%eax
c00079fd:	83 e0 0f             	and    $0xf,%eax
c0007a00:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a03:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007a07:	75 06                	jne    c0007a0f <atoi+0x63>
c0007a09:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007a0d:	74 2f                	je     c0007a3e <atoi+0x92>
c0007a0f:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007a13:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007a17:	83 c0 30             	add    $0x30,%eax
c0007a1a:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a1d:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007a21:	7e 0a                	jle    c0007a2d <atoi+0x81>
c0007a23:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007a27:	83 c0 07             	add    $0x7,%eax
c0007a2a:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a30:	8d 50 01             	lea    0x1(%eax),%edx
c0007a33:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007a36:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007a3a:	88 10                	mov    %dl,(%eax)
c0007a3c:	eb 01                	jmp    c0007a3f <atoi+0x93>
c0007a3e:	90                   	nop
c0007a3f:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007a43:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007a47:	79 a8                	jns    c00079f1 <atoi+0x45>
c0007a49:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a4c:	c6 00 00             	movb   $0x0,(%eax)
c0007a4f:	90                   	nop
c0007a50:	c9                   	leave  
c0007a51:	c3                   	ret    

c0007a52 <disp_int>:
c0007a52:	55                   	push   %ebp
c0007a53:	89 e5                	mov    %esp,%ebp
c0007a55:	83 ec 18             	sub    $0x18,%esp
c0007a58:	ff 75 08             	pushl  0x8(%ebp)
c0007a5b:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007a5e:	50                   	push   %eax
c0007a5f:	e8 48 ff ff ff       	call   c00079ac <atoi>
c0007a64:	83 c4 08             	add    $0x8,%esp
c0007a67:	83 ec 08             	sub    $0x8,%esp
c0007a6a:	6a 0b                	push   $0xb
c0007a6c:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007a6f:	50                   	push   %eax
c0007a70:	e8 52 9b ff ff       	call   c00015c7 <disp_str_colour>
c0007a75:	83 c4 10             	add    $0x10,%esp
c0007a78:	90                   	nop
c0007a79:	c9                   	leave  
c0007a7a:	c3                   	ret    

c0007a7b <do_page_fault>:
c0007a7b:	55                   	push   %ebp
c0007a7c:	89 e5                	mov    %esp,%ebp
c0007a7e:	83 ec 28             	sub    $0x28,%esp
c0007a81:	0f 20 d0             	mov    %cr2,%eax
c0007a84:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007a87:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0007a8e:	00 00 00 
c0007a91:	83 ec 0c             	sub    $0xc,%esp
c0007a94:	68 40 ac 00 c0       	push   $0xc000ac40
c0007a99:	e8 ee 9a ff ff       	call   c000158c <disp_str>
c0007a9e:	83 c4 10             	add    $0x10,%esp
c0007aa1:	83 ec 0c             	sub    $0xc,%esp
c0007aa4:	68 4f ac 00 c0       	push   $0xc000ac4f
c0007aa9:	e8 de 9a ff ff       	call   c000158c <disp_str>
c0007aae:	83 c4 10             	add    $0x10,%esp
c0007ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ab4:	83 ec 0c             	sub    $0xc,%esp
c0007ab7:	50                   	push   %eax
c0007ab8:	e8 95 ff ff ff       	call   c0007a52 <disp_int>
c0007abd:	83 c4 10             	add    $0x10,%esp
c0007ac0:	83 ec 0c             	sub    $0xc,%esp
c0007ac3:	68 54 ac 00 c0       	push   $0xc000ac54
c0007ac8:	e8 bf 9a ff ff       	call   c000158c <disp_str>
c0007acd:	83 c4 10             	add    $0x10,%esp
c0007ad0:	83 ec 0c             	sub    $0xc,%esp
c0007ad3:	ff 75 f4             	pushl  -0xc(%ebp)
c0007ad6:	e8 f5 f1 ff ff       	call   c0006cd0 <ptr_pde>
c0007adb:	83 c4 10             	add    $0x10,%esp
c0007ade:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007ae1:	83 ec 0c             	sub    $0xc,%esp
c0007ae4:	ff 75 f4             	pushl  -0xc(%ebp)
c0007ae7:	e8 f7 f1 ff ff       	call   c0006ce3 <ptr_pte>
c0007aec:	83 c4 10             	add    $0x10,%esp
c0007aef:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007af2:	83 ec 0c             	sub    $0xc,%esp
c0007af5:	68 56 ac 00 c0       	push   $0xc000ac56
c0007afa:	e8 8d 9a ff ff       	call   c000158c <disp_str>
c0007aff:	83 c4 10             	add    $0x10,%esp
c0007b02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b05:	83 ec 0c             	sub    $0xc,%esp
c0007b08:	50                   	push   %eax
c0007b09:	e8 44 ff ff ff       	call   c0007a52 <disp_int>
c0007b0e:	83 c4 10             	add    $0x10,%esp
c0007b11:	83 ec 0c             	sub    $0xc,%esp
c0007b14:	68 5b ac 00 c0       	push   $0xc000ac5b
c0007b19:	e8 6e 9a ff ff       	call   c000158c <disp_str>
c0007b1e:	83 c4 10             	add    $0x10,%esp
c0007b21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b24:	8b 00                	mov    (%eax),%eax
c0007b26:	83 ec 0c             	sub    $0xc,%esp
c0007b29:	50                   	push   %eax
c0007b2a:	e8 23 ff ff ff       	call   c0007a52 <disp_int>
c0007b2f:	83 c4 10             	add    $0x10,%esp
c0007b32:	83 ec 0c             	sub    $0xc,%esp
c0007b35:	68 54 ac 00 c0       	push   $0xc000ac54
c0007b3a:	e8 4d 9a ff ff       	call   c000158c <disp_str>
c0007b3f:	83 c4 10             	add    $0x10,%esp
c0007b42:	83 ec 0c             	sub    $0xc,%esp
c0007b45:	68 64 ac 00 c0       	push   $0xc000ac64
c0007b4a:	e8 3d 9a ff ff       	call   c000158c <disp_str>
c0007b4f:	83 c4 10             	add    $0x10,%esp
c0007b52:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007b55:	83 ec 0c             	sub    $0xc,%esp
c0007b58:	50                   	push   %eax
c0007b59:	e8 f4 fe ff ff       	call   c0007a52 <disp_int>
c0007b5e:	83 c4 10             	add    $0x10,%esp
c0007b61:	83 ec 0c             	sub    $0xc,%esp
c0007b64:	68 69 ac 00 c0       	push   $0xc000ac69
c0007b69:	e8 1e 9a ff ff       	call   c000158c <disp_str>
c0007b6e:	83 c4 10             	add    $0x10,%esp
c0007b71:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007b74:	8b 00                	mov    (%eax),%eax
c0007b76:	83 ec 0c             	sub    $0xc,%esp
c0007b79:	50                   	push   %eax
c0007b7a:	e8 d3 fe ff ff       	call   c0007a52 <disp_int>
c0007b7f:	83 c4 10             	add    $0x10,%esp
c0007b82:	83 ec 0c             	sub    $0xc,%esp
c0007b85:	68 54 ac 00 c0       	push   $0xc000ac54
c0007b8a:	e8 fd 99 ff ff       	call   c000158c <disp_str>
c0007b8f:	83 c4 10             	add    $0x10,%esp
c0007b92:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007b99:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007b9c:	8b 00                	mov    (%eax),%eax
c0007b9e:	83 e0 01             	and    $0x1,%eax
c0007ba1:	85 c0                	test   %eax,%eax
c0007ba3:	74 09                	je     c0007bae <do_page_fault+0x133>
c0007ba5:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007bac:	eb 07                	jmp    c0007bb5 <do_page_fault+0x13a>
c0007bae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007bb5:	90                   	nop
c0007bb6:	c9                   	leave  
c0007bb7:	c3                   	ret    

c0007bb8 <exception_handler>:
c0007bb8:	55                   	push   %ebp
c0007bb9:	89 e5                	mov    %esp,%ebp
c0007bbb:	57                   	push   %edi
c0007bbc:	56                   	push   %esi
c0007bbd:	53                   	push   %ebx
c0007bbe:	83 ec 6c             	sub    $0x6c,%esp
c0007bc1:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007bc4:	bb e0 ae 00 c0       	mov    $0xc000aee0,%ebx
c0007bc9:	ba 13 00 00 00       	mov    $0x13,%edx
c0007bce:	89 c7                	mov    %eax,%edi
c0007bd0:	89 de                	mov    %ebx,%esi
c0007bd2:	89 d1                	mov    %edx,%ecx
c0007bd4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007bd6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007bdd:	eb 04                	jmp    c0007be3 <exception_handler+0x2b>
c0007bdf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007be3:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007bea:	7e f3                	jle    c0007bdf <exception_handler+0x27>
c0007bec:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0007bf3:	00 00 00 
c0007bf6:	83 ec 0c             	sub    $0xc,%esp
c0007bf9:	68 72 ac 00 c0       	push   $0xc000ac72
c0007bfe:	e8 89 99 ff ff       	call   c000158c <disp_str>
c0007c03:	83 c4 10             	add    $0x10,%esp
c0007c06:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007c0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c10:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0007c14:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007c17:	83 ec 0c             	sub    $0xc,%esp
c0007c1a:	ff 75 dc             	pushl  -0x24(%ebp)
c0007c1d:	e8 6a 99 ff ff       	call   c000158c <disp_str>
c0007c22:	83 c4 10             	add    $0x10,%esp
c0007c25:	83 ec 0c             	sub    $0xc,%esp
c0007c28:	68 80 ac 00 c0       	push   $0xc000ac80
c0007c2d:	e8 5a 99 ff ff       	call   c000158c <disp_str>
c0007c32:	83 c4 10             	add    $0x10,%esp
c0007c35:	83 ec 0c             	sub    $0xc,%esp
c0007c38:	68 83 ac 00 c0       	push   $0xc000ac83
c0007c3d:	e8 4a 99 ff ff       	call   c000158c <disp_str>
c0007c42:	83 c4 10             	add    $0x10,%esp
c0007c45:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c48:	83 ec 0c             	sub    $0xc,%esp
c0007c4b:	50                   	push   %eax
c0007c4c:	e8 01 fe ff ff       	call   c0007a52 <disp_int>
c0007c51:	83 c4 10             	add    $0x10,%esp
c0007c54:	83 ec 0c             	sub    $0xc,%esp
c0007c57:	68 80 ac 00 c0       	push   $0xc000ac80
c0007c5c:	e8 2b 99 ff ff       	call   c000158c <disp_str>
c0007c61:	83 c4 10             	add    $0x10,%esp
c0007c64:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007c68:	74 2f                	je     c0007c99 <exception_handler+0xe1>
c0007c6a:	83 ec 0c             	sub    $0xc,%esp
c0007c6d:	68 8b ac 00 c0       	push   $0xc000ac8b
c0007c72:	e8 15 99 ff ff       	call   c000158c <disp_str>
c0007c77:	83 c4 10             	add    $0x10,%esp
c0007c7a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007c7d:	83 ec 0c             	sub    $0xc,%esp
c0007c80:	50                   	push   %eax
c0007c81:	e8 cc fd ff ff       	call   c0007a52 <disp_int>
c0007c86:	83 c4 10             	add    $0x10,%esp
c0007c89:	83 ec 0c             	sub    $0xc,%esp
c0007c8c:	68 80 ac 00 c0       	push   $0xc000ac80
c0007c91:	e8 f6 98 ff ff       	call   c000158c <disp_str>
c0007c96:	83 c4 10             	add    $0x10,%esp
c0007c99:	83 ec 0c             	sub    $0xc,%esp
c0007c9c:	68 95 ac 00 c0       	push   $0xc000ac95
c0007ca1:	e8 e6 98 ff ff       	call   c000158c <disp_str>
c0007ca6:	83 c4 10             	add    $0x10,%esp
c0007ca9:	83 ec 0c             	sub    $0xc,%esp
c0007cac:	ff 75 14             	pushl  0x14(%ebp)
c0007caf:	e8 9e fd ff ff       	call   c0007a52 <disp_int>
c0007cb4:	83 c4 10             	add    $0x10,%esp
c0007cb7:	83 ec 0c             	sub    $0xc,%esp
c0007cba:	68 80 ac 00 c0       	push   $0xc000ac80
c0007cbf:	e8 c8 98 ff ff       	call   c000158c <disp_str>
c0007cc4:	83 c4 10             	add    $0x10,%esp
c0007cc7:	83 ec 0c             	sub    $0xc,%esp
c0007cca:	68 99 ac 00 c0       	push   $0xc000ac99
c0007ccf:	e8 b8 98 ff ff       	call   c000158c <disp_str>
c0007cd4:	83 c4 10             	add    $0x10,%esp
c0007cd7:	8b 45 10             	mov    0x10(%ebp),%eax
c0007cda:	83 ec 0c             	sub    $0xc,%esp
c0007cdd:	50                   	push   %eax
c0007cde:	e8 6f fd ff ff       	call   c0007a52 <disp_int>
c0007ce3:	83 c4 10             	add    $0x10,%esp
c0007ce6:	83 ec 0c             	sub    $0xc,%esp
c0007ce9:	68 80 ac 00 c0       	push   $0xc000ac80
c0007cee:	e8 99 98 ff ff       	call   c000158c <disp_str>
c0007cf3:	83 c4 10             	add    $0x10,%esp
c0007cf6:	83 ec 0c             	sub    $0xc,%esp
c0007cf9:	68 9e ac 00 c0       	push   $0xc000ac9e
c0007cfe:	e8 89 98 ff ff       	call   c000158c <disp_str>
c0007d03:	83 c4 10             	add    $0x10,%esp
c0007d06:	83 ec 0c             	sub    $0xc,%esp
c0007d09:	ff 75 18             	pushl  0x18(%ebp)
c0007d0c:	e8 41 fd ff ff       	call   c0007a52 <disp_int>
c0007d11:	83 c4 10             	add    $0x10,%esp
c0007d14:	83 ec 0c             	sub    $0xc,%esp
c0007d17:	68 80 ac 00 c0       	push   $0xc000ac80
c0007d1c:	e8 6b 98 ff ff       	call   c000158c <disp_str>
c0007d21:	83 c4 10             	add    $0x10,%esp
c0007d24:	83 ec 0c             	sub    $0xc,%esp
c0007d27:	68 a8 ac 00 c0       	push   $0xc000aca8
c0007d2c:	e8 5b 98 ff ff       	call   c000158c <disp_str>
c0007d31:	83 c4 10             	add    $0x10,%esp
c0007d34:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0007d38:	75 46                	jne    c0007d80 <exception_handler+0x1c8>
c0007d3a:	0f 20 d0             	mov    %cr2,%eax
c0007d3d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007d40:	83 ec 0c             	sub    $0xc,%esp
c0007d43:	68 c7 ac 00 c0       	push   $0xc000acc7
c0007d48:	e8 3f 98 ff ff       	call   c000158c <disp_str>
c0007d4d:	83 c4 10             	add    $0x10,%esp
c0007d50:	83 ec 0c             	sub    $0xc,%esp
c0007d53:	68 4f ac 00 c0       	push   $0xc000ac4f
c0007d58:	e8 2f 98 ff ff       	call   c000158c <disp_str>
c0007d5d:	83 c4 10             	add    $0x10,%esp
c0007d60:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007d63:	83 ec 0c             	sub    $0xc,%esp
c0007d66:	50                   	push   %eax
c0007d67:	e8 e6 fc ff ff       	call   c0007a52 <disp_int>
c0007d6c:	83 c4 10             	add    $0x10,%esp
c0007d6f:	83 ec 0c             	sub    $0xc,%esp
c0007d72:	68 54 ac 00 c0       	push   $0xc000ac54
c0007d77:	e8 10 98 ff ff       	call   c000158c <disp_str>
c0007d7c:	83 c4 10             	add    $0x10,%esp
c0007d7f:	90                   	nop
c0007d80:	90                   	nop
c0007d81:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007d84:	5b                   	pop    %ebx
c0007d85:	5e                   	pop    %esi
c0007d86:	5f                   	pop    %edi
c0007d87:	5d                   	pop    %ebp
c0007d88:	c3                   	ret    

c0007d89 <exception_handler2>:
c0007d89:	55                   	push   %ebp
c0007d8a:	89 e5                	mov    %esp,%ebp
c0007d8c:	57                   	push   %edi
c0007d8d:	56                   	push   %esi
c0007d8e:	53                   	push   %ebx
c0007d8f:	83 ec 6c             	sub    $0x6c,%esp
c0007d92:	8d 45 90             	lea    -0x70(%ebp),%eax
c0007d95:	bb e0 ae 00 c0       	mov    $0xc000aee0,%ebx
c0007d9a:	ba 13 00 00 00       	mov    $0x13,%edx
c0007d9f:	89 c7                	mov    %eax,%edi
c0007da1:	89 de                	mov    %ebx,%esi
c0007da3:	89 d1                	mov    %edx,%ecx
c0007da5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007da7:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007dae:	2e 00 00 
c0007db1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007db8:	eb 14                	jmp    c0007dce <exception_handler2+0x45>
c0007dba:	83 ec 0c             	sub    $0xc,%esp
c0007dbd:	68 2c af 00 c0       	push   $0xc000af2c
c0007dc2:	e8 c5 97 ff ff       	call   c000158c <disp_str>
c0007dc7:	83 c4 10             	add    $0x10,%esp
c0007dca:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007dce:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007dd5:	7e e3                	jle    c0007dba <exception_handler2+0x31>
c0007dd7:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007dde:	2e 00 00 
c0007de1:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007de8:	8b 45 08             	mov    0x8(%ebp),%eax
c0007deb:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0007def:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007df2:	83 ec 08             	sub    $0x8,%esp
c0007df5:	ff 75 e0             	pushl  -0x20(%ebp)
c0007df8:	ff 75 dc             	pushl  -0x24(%ebp)
c0007dfb:	e8 c7 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e00:	83 c4 10             	add    $0x10,%esp
c0007e03:	83 ec 0c             	sub    $0xc,%esp
c0007e06:	68 80 ac 00 c0       	push   $0xc000ac80
c0007e0b:	e8 7c 97 ff ff       	call   c000158c <disp_str>
c0007e10:	83 c4 10             	add    $0x10,%esp
c0007e13:	83 ec 08             	sub    $0x8,%esp
c0007e16:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e19:	68 83 ac 00 c0       	push   $0xc000ac83
c0007e1e:	e8 a4 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e23:	83 c4 10             	add    $0x10,%esp
c0007e26:	83 ec 0c             	sub    $0xc,%esp
c0007e29:	ff 75 08             	pushl  0x8(%ebp)
c0007e2c:	e8 21 fc ff ff       	call   c0007a52 <disp_int>
c0007e31:	83 c4 10             	add    $0x10,%esp
c0007e34:	83 ec 0c             	sub    $0xc,%esp
c0007e37:	68 80 ac 00 c0       	push   $0xc000ac80
c0007e3c:	e8 4b 97 ff ff       	call   c000158c <disp_str>
c0007e41:	83 c4 10             	add    $0x10,%esp
c0007e44:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007e48:	74 44                	je     c0007e8e <exception_handler2+0x105>
c0007e4a:	83 ec 08             	sub    $0x8,%esp
c0007e4d:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e50:	68 8b ac 00 c0       	push   $0xc000ac8b
c0007e55:	e8 6d 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e5a:	83 c4 10             	add    $0x10,%esp
c0007e5d:	83 ec 08             	sub    $0x8,%esp
c0007e60:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e63:	68 8b ac 00 c0       	push   $0xc000ac8b
c0007e68:	e8 5a 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e6d:	83 c4 10             	add    $0x10,%esp
c0007e70:	83 ec 0c             	sub    $0xc,%esp
c0007e73:	ff 75 0c             	pushl  0xc(%ebp)
c0007e76:	e8 d7 fb ff ff       	call   c0007a52 <disp_int>
c0007e7b:	83 c4 10             	add    $0x10,%esp
c0007e7e:	83 ec 0c             	sub    $0xc,%esp
c0007e81:	68 80 ac 00 c0       	push   $0xc000ac80
c0007e86:	e8 01 97 ff ff       	call   c000158c <disp_str>
c0007e8b:	83 c4 10             	add    $0x10,%esp
c0007e8e:	83 ec 08             	sub    $0x8,%esp
c0007e91:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e94:	68 95 ac 00 c0       	push   $0xc000ac95
c0007e99:	e8 29 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e9e:	83 c4 10             	add    $0x10,%esp
c0007ea1:	83 ec 0c             	sub    $0xc,%esp
c0007ea4:	ff 75 14             	pushl  0x14(%ebp)
c0007ea7:	e8 a6 fb ff ff       	call   c0007a52 <disp_int>
c0007eac:	83 c4 10             	add    $0x10,%esp
c0007eaf:	83 ec 0c             	sub    $0xc,%esp
c0007eb2:	68 80 ac 00 c0       	push   $0xc000ac80
c0007eb7:	e8 d0 96 ff ff       	call   c000158c <disp_str>
c0007ebc:	83 c4 10             	add    $0x10,%esp
c0007ebf:	83 ec 08             	sub    $0x8,%esp
c0007ec2:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ec5:	68 99 ac 00 c0       	push   $0xc000ac99
c0007eca:	e8 f8 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007ecf:	83 c4 10             	add    $0x10,%esp
c0007ed2:	83 ec 0c             	sub    $0xc,%esp
c0007ed5:	ff 75 10             	pushl  0x10(%ebp)
c0007ed8:	e8 75 fb ff ff       	call   c0007a52 <disp_int>
c0007edd:	83 c4 10             	add    $0x10,%esp
c0007ee0:	83 ec 0c             	sub    $0xc,%esp
c0007ee3:	68 80 ac 00 c0       	push   $0xc000ac80
c0007ee8:	e8 9f 96 ff ff       	call   c000158c <disp_str>
c0007eed:	83 c4 10             	add    $0x10,%esp
c0007ef0:	83 ec 08             	sub    $0x8,%esp
c0007ef3:	ff 75 e0             	pushl  -0x20(%ebp)
c0007ef6:	68 9e ac 00 c0       	push   $0xc000ac9e
c0007efb:	e8 c7 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007f00:	83 c4 10             	add    $0x10,%esp
c0007f03:	83 ec 0c             	sub    $0xc,%esp
c0007f06:	ff 75 18             	pushl  0x18(%ebp)
c0007f09:	e8 44 fb ff ff       	call   c0007a52 <disp_int>
c0007f0e:	83 c4 10             	add    $0x10,%esp
c0007f11:	83 ec 0c             	sub    $0xc,%esp
c0007f14:	68 80 ac 00 c0       	push   $0xc000ac80
c0007f19:	e8 6e 96 ff ff       	call   c000158c <disp_str>
c0007f1e:	83 c4 10             	add    $0x10,%esp
c0007f21:	90                   	nop
c0007f22:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007f25:	5b                   	pop    %ebx
c0007f26:	5e                   	pop    %esi
c0007f27:	5f                   	pop    %edi
c0007f28:	5d                   	pop    %ebp
c0007f29:	c3                   	ret    

c0007f2a <init_internal_interrupt>:
c0007f2a:	55                   	push   %ebp
c0007f2b:	89 e5                	mov    %esp,%ebp
c0007f2d:	83 ec 08             	sub    $0x8,%esp
c0007f30:	6a 0e                	push   $0xe
c0007f32:	6a 08                	push   $0x8
c0007f34:	68 03 16 00 c0       	push   $0xc0001603
c0007f39:	6a 00                	push   $0x0
c0007f3b:	e8 e7 cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007f40:	83 c4 10             	add    $0x10,%esp
c0007f43:	6a 0e                	push   $0xe
c0007f45:	6a 08                	push   $0x8
c0007f47:	68 09 16 00 c0       	push   $0xc0001609
c0007f4c:	6a 01                	push   $0x1
c0007f4e:	e8 d4 cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007f53:	83 c4 10             	add    $0x10,%esp
c0007f56:	6a 0e                	push   $0xe
c0007f58:	6a 08                	push   $0x8
c0007f5a:	68 0f 16 00 c0       	push   $0xc000160f
c0007f5f:	6a 02                	push   $0x2
c0007f61:	e8 c1 cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007f66:	83 c4 10             	add    $0x10,%esp
c0007f69:	6a 0e                	push   $0xe
c0007f6b:	6a 08                	push   $0x8
c0007f6d:	68 15 16 00 c0       	push   $0xc0001615
c0007f72:	6a 03                	push   $0x3
c0007f74:	e8 ae cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007f79:	83 c4 10             	add    $0x10,%esp
c0007f7c:	6a 0e                	push   $0xe
c0007f7e:	6a 08                	push   $0x8
c0007f80:	68 1b 16 00 c0       	push   $0xc000161b
c0007f85:	6a 04                	push   $0x4
c0007f87:	e8 9b cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007f8c:	83 c4 10             	add    $0x10,%esp
c0007f8f:	6a 0e                	push   $0xe
c0007f91:	6a 08                	push   $0x8
c0007f93:	68 21 16 00 c0       	push   $0xc0001621
c0007f98:	6a 05                	push   $0x5
c0007f9a:	e8 88 cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007f9f:	83 c4 10             	add    $0x10,%esp
c0007fa2:	6a 0e                	push   $0xe
c0007fa4:	6a 08                	push   $0x8
c0007fa6:	68 27 16 00 c0       	push   $0xc0001627
c0007fab:	6a 06                	push   $0x6
c0007fad:	e8 75 cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007fb2:	83 c4 10             	add    $0x10,%esp
c0007fb5:	6a 0e                	push   $0xe
c0007fb7:	6a 08                	push   $0x8
c0007fb9:	68 2d 16 00 c0       	push   $0xc000162d
c0007fbe:	6a 07                	push   $0x7
c0007fc0:	e8 62 cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007fc5:	83 c4 10             	add    $0x10,%esp
c0007fc8:	6a 0e                	push   $0xe
c0007fca:	6a 08                	push   $0x8
c0007fcc:	68 33 16 00 c0       	push   $0xc0001633
c0007fd1:	6a 08                	push   $0x8
c0007fd3:	e8 4f cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007fd8:	83 c4 10             	add    $0x10,%esp
c0007fdb:	6a 0e                	push   $0xe
c0007fdd:	6a 08                	push   $0x8
c0007fdf:	68 37 16 00 c0       	push   $0xc0001637
c0007fe4:	6a 09                	push   $0x9
c0007fe6:	e8 3c cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007feb:	83 c4 10             	add    $0x10,%esp
c0007fee:	6a 0e                	push   $0xe
c0007ff0:	6a 08                	push   $0x8
c0007ff2:	68 3d 16 00 c0       	push   $0xc000163d
c0007ff7:	6a 0a                	push   $0xa
c0007ff9:	e8 29 cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0007ffe:	83 c4 10             	add    $0x10,%esp
c0008001:	6a 0e                	push   $0xe
c0008003:	6a 08                	push   $0x8
c0008005:	68 41 16 00 c0       	push   $0xc0001641
c000800a:	6a 0b                	push   $0xb
c000800c:	e8 16 cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0008011:	83 c4 10             	add    $0x10,%esp
c0008014:	6a 0e                	push   $0xe
c0008016:	6a 08                	push   $0x8
c0008018:	68 45 16 00 c0       	push   $0xc0001645
c000801d:	6a 0c                	push   $0xc
c000801f:	e8 03 cd ff ff       	call   c0004d27 <InitInterruptDesc>
c0008024:	83 c4 10             	add    $0x10,%esp
c0008027:	6a 0e                	push   $0xe
c0008029:	6a 08                	push   $0x8
c000802b:	68 49 16 00 c0       	push   $0xc0001649
c0008030:	6a 0d                	push   $0xd
c0008032:	e8 f0 cc ff ff       	call   c0004d27 <InitInterruptDesc>
c0008037:	83 c4 10             	add    $0x10,%esp
c000803a:	6a 0e                	push   $0xe
c000803c:	6a 08                	push   $0x8
c000803e:	68 4d 16 00 c0       	push   $0xc000164d
c0008043:	6a 0e                	push   $0xe
c0008045:	e8 dd cc ff ff       	call   c0004d27 <InitInterruptDesc>
c000804a:	83 c4 10             	add    $0x10,%esp
c000804d:	6a 0e                	push   $0xe
c000804f:	6a 08                	push   $0x8
c0008051:	68 51 16 00 c0       	push   $0xc0001651
c0008056:	6a 10                	push   $0x10
c0008058:	e8 ca cc ff ff       	call   c0004d27 <InitInterruptDesc>
c000805d:	83 c4 10             	add    $0x10,%esp
c0008060:	6a 0e                	push   $0xe
c0008062:	6a 08                	push   $0x8
c0008064:	68 57 16 00 c0       	push   $0xc0001657
c0008069:	6a 11                	push   $0x11
c000806b:	e8 b7 cc ff ff       	call   c0004d27 <InitInterruptDesc>
c0008070:	83 c4 10             	add    $0x10,%esp
c0008073:	6a 0e                	push   $0xe
c0008075:	6a 08                	push   $0x8
c0008077:	68 5b 16 00 c0       	push   $0xc000165b
c000807c:	6a 12                	push   $0x12
c000807e:	e8 a4 cc ff ff       	call   c0004d27 <InitInterruptDesc>
c0008083:	83 c4 10             	add    $0x10,%esp
c0008086:	6a 0e                	push   $0xe
c0008088:	6a 0e                	push   $0xe
c000808a:	68 1c 17 00 c0       	push   $0xc000171c
c000808f:	68 90 00 00 00       	push   $0x90
c0008094:	e8 8e cc ff ff       	call   c0004d27 <InitInterruptDesc>
c0008099:	83 c4 10             	add    $0x10,%esp
c000809c:	90                   	nop
c000809d:	c9                   	leave  
c000809e:	c3                   	ret    

c000809f <test>:
c000809f:	55                   	push   %ebp
c00080a0:	89 e5                	mov    %esp,%ebp
c00080a2:	83 ec 08             	sub    $0x8,%esp
c00080a5:	83 ec 0c             	sub    $0xc,%esp
c00080a8:	68 2e af 00 c0       	push   $0xc000af2e
c00080ad:	e8 da 94 ff ff       	call   c000158c <disp_str>
c00080b2:	83 c4 10             	add    $0x10,%esp
c00080b5:	83 ec 0c             	sub    $0xc,%esp
c00080b8:	6a 06                	push   $0x6
c00080ba:	e8 93 f9 ff ff       	call   c0007a52 <disp_int>
c00080bf:	83 c4 10             	add    $0x10,%esp
c00080c2:	83 ec 0c             	sub    $0xc,%esp
c00080c5:	68 54 ac 00 c0       	push   $0xc000ac54
c00080ca:	e8 bd 94 ff ff       	call   c000158c <disp_str>
c00080cf:	83 c4 10             	add    $0x10,%esp
c00080d2:	90                   	nop
c00080d3:	c9                   	leave  
c00080d4:	c3                   	ret    

c00080d5 <disp_str_colour3>:
c00080d5:	55                   	push   %ebp
c00080d6:	89 e5                	mov    %esp,%ebp
c00080d8:	90                   	nop
c00080d9:	5d                   	pop    %ebp
c00080da:	c3                   	ret    

c00080db <spurious_irq>:
c00080db:	55                   	push   %ebp
c00080dc:	89 e5                	mov    %esp,%ebp
c00080de:	83 ec 08             	sub    $0x8,%esp
c00080e1:	83 ec 08             	sub    $0x8,%esp
c00080e4:	6a 0b                	push   $0xb
c00080e6:	68 30 af 00 c0       	push   $0xc000af30
c00080eb:	e8 d7 94 ff ff       	call   c00015c7 <disp_str_colour>
c00080f0:	83 c4 10             	add    $0x10,%esp
c00080f3:	83 ec 0c             	sub    $0xc,%esp
c00080f6:	ff 75 08             	pushl  0x8(%ebp)
c00080f9:	e8 54 f9 ff ff       	call   c0007a52 <disp_int>
c00080fe:	83 c4 10             	add    $0x10,%esp
c0008101:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008106:	83 c0 01             	add    $0x1,%eax
c0008109:	a3 c0 1e 01 c0       	mov    %eax,0xc0011ec0
c000810e:	83 ec 0c             	sub    $0xc,%esp
c0008111:	68 57 af 00 c0       	push   $0xc000af57
c0008116:	e8 71 94 ff ff       	call   c000158c <disp_str>
c000811b:	83 c4 10             	add    $0x10,%esp
c000811e:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008123:	83 ec 0c             	sub    $0xc,%esp
c0008126:	50                   	push   %eax
c0008127:	e8 26 f9 ff ff       	call   c0007a52 <disp_int>
c000812c:	83 c4 10             	add    $0x10,%esp
c000812f:	83 ec 0c             	sub    $0xc,%esp
c0008132:	68 59 af 00 c0       	push   $0xc000af59
c0008137:	e8 50 94 ff ff       	call   c000158c <disp_str>
c000813c:	83 c4 10             	add    $0x10,%esp
c000813f:	83 ec 08             	sub    $0x8,%esp
c0008142:	6a 0c                	push   $0xc
c0008144:	68 5c af 00 c0       	push   $0xc000af5c
c0008149:	e8 79 94 ff ff       	call   c00015c7 <disp_str_colour>
c000814e:	83 c4 10             	add    $0x10,%esp
c0008151:	90                   	nop
c0008152:	c9                   	leave  
c0008153:	c3                   	ret    

c0008154 <init_keyboard>:
c0008154:	55                   	push   %ebp
c0008155:	89 e5                	mov    %esp,%ebp
c0008157:	83 ec 18             	sub    $0x18,%esp
c000815a:	83 ec 04             	sub    $0x4,%esp
c000815d:	68 00 02 00 00       	push   $0x200
c0008162:	6a 00                	push   $0x0
c0008164:	68 8c fb 00 c0       	push   $0xc000fb8c
c0008169:	e8 04 32 00 00       	call   c000b372 <Memset>
c000816e:	83 c4 10             	add    $0x10,%esp
c0008171:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c0008178:	fb 00 c0 
c000817b:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0008180:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0008185:	c7 05 88 fb 00 c0 00 	movl   $0x0,0xc000fb88
c000818c:	00 00 00 
c000818f:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0008196:	00 00 00 
c0008199:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00081a0:	eb 04                	jmp    c00081a6 <init_keyboard+0x52>
c00081a2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00081a6:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00081ad:	7e f3                	jle    c00081a2 <init_keyboard+0x4e>
c00081af:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c00081b6:	00 00 00 
c00081b9:	e8 68 d9 ff ff       	call   c0005b26 <init_keyboard_handler>
c00081be:	90                   	nop
c00081bf:	c9                   	leave  
c00081c0:	c3                   	ret    

c00081c1 <init2>:
c00081c1:	55                   	push   %ebp
c00081c2:	89 e5                	mov    %esp,%ebp
c00081c4:	83 ec 08             	sub    $0x8,%esp
c00081c7:	83 ec 0c             	sub    $0xc,%esp
c00081ca:	68 81 af 00 c0       	push   $0xc000af81
c00081cf:	e8 b8 93 ff ff       	call   c000158c <disp_str>
c00081d4:	83 c4 10             	add    $0x10,%esp
c00081d7:	e8 78 ff ff ff       	call   c0008154 <init_keyboard>
c00081dc:	83 ec 0c             	sub    $0xc,%esp
c00081df:	68 00 00 00 02       	push   $0x2000000
c00081e4:	e8 87 f4 ff ff       	call   c0007670 <init_memory>
c00081e9:	83 c4 10             	add    $0x10,%esp
c00081ec:	90                   	nop
c00081ed:	c9                   	leave  
c00081ee:	c3                   	ret    

c00081ef <u_thread_a>:
c00081ef:	55                   	push   %ebp
c00081f0:	89 e5                	mov    %esp,%ebp
c00081f2:	83 ec 08             	sub    $0x8,%esp
c00081f5:	83 ec 0c             	sub    $0xc,%esp
c00081f8:	68 87 af 00 c0       	push   $0xc000af87
c00081fd:	e8 8a 93 ff ff       	call   c000158c <disp_str>
c0008202:	83 c4 10             	add    $0x10,%esp
c0008205:	eb fe                	jmp    c0008205 <u_thread_a+0x16>

c0008207 <kernel_main2>:
c0008207:	55                   	push   %ebp
c0008208:	89 e5                	mov    %esp,%ebp
c000820a:	57                   	push   %edi
c000820b:	56                   	push   %esi
c000820c:	53                   	push   %ebx
c000820d:	83 ec 3c             	sub    $0x3c,%esp
c0008210:	83 ec 0c             	sub    $0xc,%esp
c0008213:	68 95 af 00 c0       	push   $0xc000af95
c0008218:	e8 6f 93 ff ff       	call   c000158c <disp_str>
c000821d:	83 c4 10             	add    $0x10,%esp
c0008220:	e8 17 97 ff ff       	call   c000193c <init>
c0008225:	c7 05 c0 1e 01 c0 00 	movl   $0x0,0xc0011ec0
c000822c:	00 00 00 
c000822f:	c7 05 9c 16 01 c0 00 	movl   $0x0,0xc001169c
c0008236:	00 00 00 
c0008239:	c7 05 44 f7 00 c0 00 	movl   $0x0,0xc000f744
c0008240:	00 00 00 
c0008243:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c000824a:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008251:	e9 01 02 00 00       	jmp    c0008457 <kernel_main2+0x250>
c0008256:	83 ec 08             	sub    $0x8,%esp
c0008259:	6a 00                	push   $0x0
c000825b:	6a 01                	push   $0x1
c000825d:	e8 d5 eb ff ff       	call   c0006e37 <alloc_memory>
c0008262:	83 c4 10             	add    $0x10,%esp
c0008265:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0008268:	83 ec 04             	sub    $0x4,%esp
c000826b:	68 ac 02 00 00       	push   $0x2ac
c0008270:	6a 00                	push   $0x0
c0008272:	ff 75 d8             	pushl  -0x28(%ebp)
c0008275:	e8 f8 30 00 00       	call   c000b372 <Memset>
c000827a:	83 c4 10             	add    $0x10,%esp
c000827d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008280:	05 00 10 00 00       	add    $0x1000,%eax
c0008285:	89 c2                	mov    %eax,%edx
c0008287:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000828a:	89 10                	mov    %edx,(%eax)
c000828c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000828f:	66 c7 80 0c 01 00 00 	movw   $0x0,0x10c(%eax)
c0008296:	00 00 
c0008298:	8b 55 e0             	mov    -0x20(%ebp),%edx
c000829b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000829e:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c00082a4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082a7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c00082ae:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c00082b2:	7e 0f                	jle    c00082c3 <kernel_main2+0xbc>
c00082b4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082b7:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c00082be:	e9 90 01 00 00       	jmp    c0008453 <kernel_main2+0x24c>
c00082c3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082c6:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00082cd:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c00082d1:	7f 73                	jg     c0008346 <kernel_main2+0x13f>
c00082d3:	c7 45 e4 20 e0 00 c0 	movl   $0xc000e020,-0x1c(%ebp)
c00082da:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c00082e1:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c00082e8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082eb:	8b 00                	mov    (%eax),%eax
c00082ed:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c00082f0:	89 c2                	mov    %eax,%edx
c00082f2:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082f5:	89 10                	mov    %edx,(%eax)
c00082f7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082fa:	8b 00                	mov    (%eax),%eax
c00082fc:	2b 45 d0             	sub    -0x30(%ebp),%eax
c00082ff:	89 c2                	mov    %eax,%edx
c0008301:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008304:	89 10                	mov    %edx,(%eax)
c0008306:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008309:	8b 00                	mov    (%eax),%eax
c000830b:	89 45 cc             	mov    %eax,-0x34(%ebp)
c000830e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008311:	8b 50 14             	mov    0x14(%eax),%edx
c0008314:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008317:	89 50 24             	mov    %edx,0x24(%eax)
c000831a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000831d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0008323:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008326:	8b 10                	mov    (%eax),%edx
c0008328:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000832b:	89 50 04             	mov    %edx,0x4(%eax)
c000832e:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008331:	8b 50 04             	mov    0x4(%eax),%edx
c0008334:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008337:	89 50 08             	mov    %edx,0x8(%eax)
c000833a:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000833d:	8b 50 08             	mov    0x8(%eax),%edx
c0008340:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008343:	89 50 0c             	mov    %edx,0xc(%eax)
c0008346:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008349:	8b 55 d8             	mov    -0x28(%ebp),%edx
c000834c:	81 c2 30 01 00 00    	add    $0x130,%edx
c0008352:	83 ec 08             	sub    $0x8,%esp
c0008355:	50                   	push   %eax
c0008356:	52                   	push   %edx
c0008357:	e8 35 30 00 00       	call   c000b391 <Strcpy>
c000835c:	83 c4 10             	add    $0x10,%esp
c000835f:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008363:	83 c8 04             	or     $0x4,%eax
c0008366:	0f b6 c0             	movzbl %al,%eax
c0008369:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c000836d:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008371:	83 c8 0c             	or     $0xc,%eax
c0008374:	0f b6 c0             	movzbl %al,%eax
c0008377:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c000837b:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c000837f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008382:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c0008388:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000838c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000838f:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c0008395:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008399:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000839c:	89 90 6c 02 00 00    	mov    %edx,0x26c(%eax)
c00083a2:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00083a6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083a9:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c00083af:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00083b3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083b6:	89 90 a8 02 00 00    	mov    %edx,0x2a8(%eax)
c00083bc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083bf:	c7 80 68 02 00 00 39 	movl   $0x39,0x268(%eax)
c00083c6:	00 00 00 
c00083c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00083cc:	8b 50 14             	mov    0x14(%eax),%edx
c00083cf:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083d2:	89 90 98 02 00 00    	mov    %edx,0x298(%eax)
c00083d8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083db:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00083de:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00083e4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083e7:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00083ee:	00 00 00 
c00083f1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083f4:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c00083fb:	00 00 00 
c00083fe:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008401:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0008408:	00 00 00 
c000840b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000840e:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0008415:	00 00 00 
c0008418:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000841b:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0008422:	00 00 00 
c0008425:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008428:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c000842f:	00 00 00 
c0008432:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008435:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000843b:	8d 90 00 33 08 c0    	lea    -0x3ff7cd00(%eax),%edx
c0008441:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008444:	89 c3                	mov    %eax,%ebx
c0008446:	b8 ab 00 00 00       	mov    $0xab,%eax
c000844b:	89 d7                	mov    %edx,%edi
c000844d:	89 de                	mov    %ebx,%esi
c000844f:	89 c1                	mov    %eax,%ecx
c0008451:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008453:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008457:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c000845b:	0f 8e f5 fd ff ff    	jle    c0008256 <kernel_main2+0x4f>
c0008461:	c7 05 60 fb 00 c0 00 	movl   $0xc0083300,0xc000fb60
c0008468:	33 08 c0 
c000846b:	eb fe                	jmp    c000846b <kernel_main2+0x264>

c000846d <TestTTY>:
c000846d:	55                   	push   %ebp
c000846e:	89 e5                	mov    %esp,%ebp
c0008470:	83 ec 28             	sub    $0x28,%esp
c0008473:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c000847a:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008481:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008487:	83 ec 08             	sub    $0x8,%esp
c000848a:	6a 02                	push   $0x2
c000848c:	8d 45 de             	lea    -0x22(%ebp),%eax
c000848f:	50                   	push   %eax
c0008490:	e8 37 d8 ff ff       	call   c0005ccc <open>
c0008495:	83 c4 10             	add    $0x10,%esp
c0008498:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000849b:	83 ec 08             	sub    $0x8,%esp
c000849e:	6a 02                	push   $0x2
c00084a0:	8d 45 de             	lea    -0x22(%ebp),%eax
c00084a3:	50                   	push   %eax
c00084a4:	e8 23 d8 ff ff       	call   c0005ccc <open>
c00084a9:	83 c4 10             	add    $0x10,%esp
c00084ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00084af:	83 ec 0c             	sub    $0xc,%esp
c00084b2:	68 a1 af 00 c0       	push   $0xc000afa1
c00084b7:	e8 f8 09 00 00       	call   c0008eb4 <Printf>
c00084bc:	83 c4 10             	add    $0x10,%esp
c00084bf:	83 ec 0c             	sub    $0xc,%esp
c00084c2:	6a 0a                	push   $0xa
c00084c4:	e8 10 ea ff ff       	call   c0006ed9 <sys_malloc>
c00084c9:	83 c4 10             	add    $0x10,%esp
c00084cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00084cf:	83 ec 04             	sub    $0x4,%esp
c00084d2:	6a 0a                	push   $0xa
c00084d4:	6a 00                	push   $0x0
c00084d6:	ff 75 ec             	pushl  -0x14(%ebp)
c00084d9:	e8 94 2e 00 00       	call   c000b372 <Memset>
c00084de:	83 c4 10             	add    $0x10,%esp
c00084e1:	83 ec 04             	sub    $0x4,%esp
c00084e4:	6a 0a                	push   $0xa
c00084e6:	ff 75 ec             	pushl  -0x14(%ebp)
c00084e9:	ff 75 f0             	pushl  -0x10(%ebp)
c00084ec:	e8 60 d8 ff ff       	call   c0005d51 <read>
c00084f1:	83 c4 10             	add    $0x10,%esp
c00084f4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00084f7:	83 ec 08             	sub    $0x8,%esp
c00084fa:	ff 75 ec             	pushl  -0x14(%ebp)
c00084fd:	68 b3 af 00 c0       	push   $0xc000afb3
c0008502:	e8 ad 09 00 00       	call   c0008eb4 <Printf>
c0008507:	83 c4 10             	add    $0x10,%esp
c000850a:	eb c3                	jmp    c00084cf <TestTTY+0x62>

c000850c <TestFS>:
c000850c:	55                   	push   %ebp
c000850d:	89 e5                	mov    %esp,%ebp
c000850f:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c0008515:	83 ec 0c             	sub    $0xc,%esp
c0008518:	68 bd af 00 c0       	push   $0xc000afbd
c000851d:	e8 6a 90 ff ff       	call   c000158c <disp_str>
c0008522:	83 c4 10             	add    $0x10,%esp
c0008525:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c000852c:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008533:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008539:	83 ec 08             	sub    $0x8,%esp
c000853c:	6a 02                	push   $0x2
c000853e:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008541:	50                   	push   %eax
c0008542:	e8 85 d7 ff ff       	call   c0005ccc <open>
c0008547:	83 c4 10             	add    $0x10,%esp
c000854a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000854d:	83 ec 08             	sub    $0x8,%esp
c0008550:	6a 02                	push   $0x2
c0008552:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008555:	50                   	push   %eax
c0008556:	e8 71 d7 ff ff       	call   c0005ccc <open>
c000855b:	83 c4 10             	add    $0x10,%esp
c000855e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008561:	83 ec 0c             	sub    $0xc,%esp
c0008564:	68 a1 af 00 c0       	push   $0xc000afa1
c0008569:	e8 46 09 00 00       	call   c0008eb4 <Printf>
c000856e:	83 c4 10             	add    $0x10,%esp
c0008571:	90                   	nop
c0008572:	c9                   	leave  
c0008573:	c3                   	ret    

c0008574 <wait_exit>:
c0008574:	55                   	push   %ebp
c0008575:	89 e5                	mov    %esp,%ebp
c0008577:	83 ec 28             	sub    $0x28,%esp
c000857a:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008581:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008588:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000858e:	83 ec 08             	sub    $0x8,%esp
c0008591:	6a 02                	push   $0x2
c0008593:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008596:	50                   	push   %eax
c0008597:	e8 30 d7 ff ff       	call   c0005ccc <open>
c000859c:	83 c4 10             	add    $0x10,%esp
c000859f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00085a2:	83 ec 08             	sub    $0x8,%esp
c00085a5:	6a 02                	push   $0x2
c00085a7:	8d 45 de             	lea    -0x22(%ebp),%eax
c00085aa:	50                   	push   %eax
c00085ab:	e8 1c d7 ff ff       	call   c0005ccc <open>
c00085b0:	83 c4 10             	add    $0x10,%esp
c00085b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00085b6:	e8 42 d9 ff ff       	call   c0005efd <fork>
c00085bb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00085be:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00085c2:	7e 25                	jle    c00085e9 <wait_exit+0x75>
c00085c4:	83 ec 0c             	sub    $0xc,%esp
c00085c7:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00085ca:	50                   	push   %eax
c00085cb:	e8 c6 d8 ff ff       	call   c0005e96 <wait>
c00085d0:	83 c4 10             	add    $0x10,%esp
c00085d3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00085d6:	83 ec 08             	sub    $0x8,%esp
c00085d9:	50                   	push   %eax
c00085da:	68 c5 af 00 c0       	push   $0xc000afc5
c00085df:	e8 d0 08 00 00       	call   c0008eb4 <Printf>
c00085e4:	83 c4 10             	add    $0x10,%esp
c00085e7:	eb fe                	jmp    c00085e7 <wait_exit+0x73>
c00085e9:	83 ec 0c             	sub    $0xc,%esp
c00085ec:	68 e0 af 00 c0       	push   $0xc000afe0
c00085f1:	e8 be 08 00 00       	call   c0008eb4 <Printf>
c00085f6:	83 c4 10             	add    $0x10,%esp
c00085f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008600:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008603:	8d 50 01             	lea    0x1(%eax),%edx
c0008606:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008609:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c000860e:	7f 02                	jg     c0008612 <wait_exit+0x9e>
c0008610:	eb ee                	jmp    c0008600 <wait_exit+0x8c>
c0008612:	90                   	nop
c0008613:	83 ec 0c             	sub    $0xc,%esp
c0008616:	68 ec af 00 c0       	push   $0xc000afec
c000861b:	e8 94 08 00 00       	call   c0008eb4 <Printf>
c0008620:	83 c4 10             	add    $0x10,%esp
c0008623:	83 ec 0c             	sub    $0xc,%esp
c0008626:	6a 09                	push   $0x9
c0008628:	e8 a7 d8 ff ff       	call   c0005ed4 <exit>
c000862d:	83 c4 10             	add    $0x10,%esp
c0008630:	83 ec 0c             	sub    $0xc,%esp
c0008633:	68 fa af 00 c0       	push   $0xc000affa
c0008638:	e8 77 08 00 00       	call   c0008eb4 <Printf>
c000863d:	83 c4 10             	add    $0x10,%esp
c0008640:	eb fe                	jmp    c0008640 <wait_exit+0xcc>

c0008642 <INIT_fork>:
c0008642:	55                   	push   %ebp
c0008643:	89 e5                	mov    %esp,%ebp
c0008645:	53                   	push   %ebx
c0008646:	83 ec 74             	sub    $0x74,%esp
c0008649:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c0008650:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c0008657:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c000865d:	83 ec 08             	sub    $0x8,%esp
c0008660:	6a 02                	push   $0x2
c0008662:	8d 45 da             	lea    -0x26(%ebp),%eax
c0008665:	50                   	push   %eax
c0008666:	e8 61 d6 ff ff       	call   c0005ccc <open>
c000866b:	83 c4 10             	add    $0x10,%esp
c000866e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008671:	83 ec 08             	sub    $0x8,%esp
c0008674:	6a 02                	push   $0x2
c0008676:	8d 45 da             	lea    -0x26(%ebp),%eax
c0008679:	50                   	push   %eax
c000867a:	e8 4d d6 ff ff       	call   c0005ccc <open>
c000867f:	83 c4 10             	add    $0x10,%esp
c0008682:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008685:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c000868c:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c0008693:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c000869a:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c00086a1:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c00086a8:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c00086af:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c00086b6:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c00086bd:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c00086c4:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c00086cb:	83 ec 0c             	sub    $0xc,%esp
c00086ce:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086d1:	50                   	push   %eax
c00086d2:	e8 dd 07 00 00       	call   c0008eb4 <Printf>
c00086d7:	83 c4 10             	add    $0x10,%esp
c00086da:	83 ec 0c             	sub    $0xc,%esp
c00086dd:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086e0:	50                   	push   %eax
c00086e1:	e8 c5 2c 00 00       	call   c000b3ab <Strlen>
c00086e6:	83 c4 10             	add    $0x10,%esp
c00086e9:	83 ec 04             	sub    $0x4,%esp
c00086ec:	50                   	push   %eax
c00086ed:	6a 00                	push   $0x0
c00086ef:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086f2:	50                   	push   %eax
c00086f3:	e8 7a 2c 00 00       	call   c000b372 <Memset>
c00086f8:	83 c4 10             	add    $0x10,%esp
c00086fb:	83 ec 04             	sub    $0x4,%esp
c00086fe:	6a 28                	push   $0x28
c0008700:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008703:	50                   	push   %eax
c0008704:	ff 75 e8             	pushl  -0x18(%ebp)
c0008707:	e8 45 d6 ff ff       	call   c0005d51 <read>
c000870c:	83 c4 10             	add    $0x10,%esp
c000870f:	83 ec 0c             	sub    $0xc,%esp
c0008712:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008715:	50                   	push   %eax
c0008716:	e8 99 07 00 00       	call   c0008eb4 <Printf>
c000871b:	83 c4 10             	add    $0x10,%esp
c000871e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008725:	e8 d3 d7 ff ff       	call   c0005efd <fork>
c000872a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000872d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0008731:	0f 8e 81 00 00 00    	jle    c00087b8 <INIT_fork+0x176>
c0008737:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000873b:	c7 45 8a 50 61 72 65 	movl   $0x65726150,-0x76(%ebp)
c0008742:	c7 45 8e 6e 74 0a 00 	movl   $0xa746e,-0x72(%ebp)
c0008749:	8d 45 92             	lea    -0x6e(%ebp),%eax
c000874c:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008751:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008756:	89 18                	mov    %ebx,(%eax)
c0008758:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c000875c:	8d 50 04             	lea    0x4(%eax),%edx
c000875f:	83 e2 fc             	and    $0xfffffffc,%edx
c0008762:	29 d0                	sub    %edx,%eax
c0008764:	01 c1                	add    %eax,%ecx
c0008766:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008769:	83 e1 fc             	and    $0xfffffffc,%ecx
c000876c:	b8 00 00 00 00       	mov    $0x0,%eax
c0008771:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008774:	83 c0 04             	add    $0x4,%eax
c0008777:	39 c8                	cmp    %ecx,%eax
c0008779:	72 f6                	jb     c0008771 <INIT_fork+0x12f>
c000877b:	01 c2                	add    %eax,%edx
c000877d:	83 ec 0c             	sub    $0xc,%esp
c0008780:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008783:	50                   	push   %eax
c0008784:	e8 22 2c 00 00       	call   c000b3ab <Strlen>
c0008789:	83 c4 10             	add    $0x10,%esp
c000878c:	83 ec 04             	sub    $0x4,%esp
c000878f:	50                   	push   %eax
c0008790:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008793:	50                   	push   %eax
c0008794:	ff 75 ec             	pushl  -0x14(%ebp)
c0008797:	e8 29 d6 ff ff       	call   c0005dc5 <write>
c000879c:	83 c4 10             	add    $0x10,%esp
c000879f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00087a6:	eb 08                	jmp    c00087b0 <INIT_fork+0x16e>
c00087a8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00087ac:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00087b0:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c00087b4:	7e f2                	jle    c00087a8 <INIT_fork+0x166>
c00087b6:	eb 79                	jmp    c0008831 <INIT_fork+0x1ef>
c00087b8:	83 ec 0c             	sub    $0xc,%esp
c00087bb:	6a 0a                	push   $0xa
c00087bd:	e8 c1 05 00 00       	call   c0008d83 <delay>
c00087c2:	83 c4 10             	add    $0x10,%esp
c00087c5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00087c9:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c00087cd:	c7 45 8a 43 68 69 6c 	movl   $0x6c696843,-0x76(%ebp)
c00087d4:	c7 45 8e 64 0a 00 00 	movl   $0xa64,-0x72(%ebp)
c00087db:	8d 45 92             	lea    -0x6e(%ebp),%eax
c00087de:	b9 20 00 00 00       	mov    $0x20,%ecx
c00087e3:	bb 00 00 00 00       	mov    $0x0,%ebx
c00087e8:	89 18                	mov    %ebx,(%eax)
c00087ea:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c00087ee:	8d 50 04             	lea    0x4(%eax),%edx
c00087f1:	83 e2 fc             	and    $0xfffffffc,%edx
c00087f4:	29 d0                	sub    %edx,%eax
c00087f6:	01 c1                	add    %eax,%ecx
c00087f8:	83 e1 fc             	and    $0xfffffffc,%ecx
c00087fb:	83 e1 fc             	and    $0xfffffffc,%ecx
c00087fe:	b8 00 00 00 00       	mov    $0x0,%eax
c0008803:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008806:	83 c0 04             	add    $0x4,%eax
c0008809:	39 c8                	cmp    %ecx,%eax
c000880b:	72 f6                	jb     c0008803 <INIT_fork+0x1c1>
c000880d:	01 c2                	add    %eax,%edx
c000880f:	83 ec 0c             	sub    $0xc,%esp
c0008812:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008815:	50                   	push   %eax
c0008816:	e8 90 2b 00 00       	call   c000b3ab <Strlen>
c000881b:	83 c4 10             	add    $0x10,%esp
c000881e:	83 ec 04             	sub    $0x4,%esp
c0008821:	50                   	push   %eax
c0008822:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008825:	50                   	push   %eax
c0008826:	ff 75 ec             	pushl  -0x14(%ebp)
c0008829:	e8 97 d5 ff ff       	call   c0005dc5 <write>
c000882e:	83 c4 10             	add    $0x10,%esp
c0008831:	90                   	nop
c0008832:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0008835:	c9                   	leave  
c0008836:	c3                   	ret    

c0008837 <simple_shell>:
c0008837:	55                   	push   %ebp
c0008838:	89 e5                	mov    %esp,%ebp
c000883a:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c0008840:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c0008847:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c000884e:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c0008854:	83 ec 08             	sub    $0x8,%esp
c0008857:	6a 02                	push   $0x2
c0008859:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c000885c:	50                   	push   %eax
c000885d:	e8 6a d4 ff ff       	call   c0005ccc <open>
c0008862:	83 c4 10             	add    $0x10,%esp
c0008865:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0008868:	83 ec 08             	sub    $0x8,%esp
c000886b:	6a 02                	push   $0x2
c000886d:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c0008870:	50                   	push   %eax
c0008871:	e8 56 d4 ff ff       	call   c0005ccc <open>
c0008876:	83 c4 10             	add    $0x10,%esp
c0008879:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000887c:	83 ec 04             	sub    $0x4,%esp
c000887f:	68 80 00 00 00       	push   $0x80
c0008884:	6a 00                	push   $0x0
c0008886:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000888c:	50                   	push   %eax
c000888d:	e8 e0 2a 00 00       	call   c000b372 <Memset>
c0008892:	83 c4 10             	add    $0x10,%esp
c0008895:	83 ec 04             	sub    $0x4,%esp
c0008898:	68 80 00 00 00       	push   $0x80
c000889d:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00088a3:	50                   	push   %eax
c00088a4:	ff 75 e0             	pushl  -0x20(%ebp)
c00088a7:	e8 a5 d4 ff ff       	call   c0005d51 <read>
c00088ac:	83 c4 10             	add    $0x10,%esp
c00088af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00088b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00088bd:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00088c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00088c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088c9:	0f b6 00             	movzbl (%eax),%eax
c00088cc:	88 45 db             	mov    %al,-0x25(%ebp)
c00088cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088d2:	0f b6 00             	movzbl (%eax),%eax
c00088d5:	3c 20                	cmp    $0x20,%al
c00088d7:	74 1d                	je     c00088f6 <simple_shell+0xbf>
c00088d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088dc:	0f b6 00             	movzbl (%eax),%eax
c00088df:	84 c0                	test   %al,%al
c00088e1:	74 13                	je     c00088f6 <simple_shell+0xbf>
c00088e3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00088e7:	75 0d                	jne    c00088f6 <simple_shell+0xbf>
c00088e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088ec:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00088ef:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c00088f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00088f9:	0f b6 00             	movzbl (%eax),%eax
c00088fc:	3c 20                	cmp    $0x20,%al
c00088fe:	74 0a                	je     c000890a <simple_shell+0xd3>
c0008900:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008903:	0f b6 00             	movzbl (%eax),%eax
c0008906:	84 c0                	test   %al,%al
c0008908:	75 26                	jne    c0008930 <simple_shell+0xf9>
c000890a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c000890e:	75 20                	jne    c0008930 <simple_shell+0xf9>
c0008910:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008913:	8d 50 01             	lea    0x1(%eax),%edx
c0008916:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008919:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000891c:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c0008923:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008926:	c6 00 00             	movb   $0x0,(%eax)
c0008929:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008930:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008934:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c0008938:	75 8c                	jne    c00088c6 <simple_shell+0x8f>
c000893a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000893d:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c0008944:	00 00 00 00 
c0008948:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c000894f:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008955:	83 ec 08             	sub    $0x8,%esp
c0008958:	6a 02                	push   $0x2
c000895a:	50                   	push   %eax
c000895b:	e8 6c d3 ff ff       	call   c0005ccc <open>
c0008960:	83 c4 10             	add    $0x10,%esp
c0008963:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0008966:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c000896a:	75 54                	jne    c00089c0 <simple_shell+0x189>
c000896c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008973:	eb 29                	jmp    c000899e <simple_shell+0x167>
c0008975:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c000897b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000897e:	01 d0                	add    %edx,%eax
c0008980:	0f b6 00             	movzbl (%eax),%eax
c0008983:	0f be c0             	movsbl %al,%eax
c0008986:	83 ec 04             	sub    $0x4,%esp
c0008989:	50                   	push   %eax
c000898a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000898d:	68 08 b0 00 c0       	push   $0xc000b008
c0008992:	e8 1d 05 00 00       	call   c0008eb4 <Printf>
c0008997:	83 c4 10             	add    $0x10,%esp
c000899a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000899e:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c00089a2:	7e d1                	jle    c0008975 <simple_shell+0x13e>
c00089a4:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00089aa:	83 ec 08             	sub    $0x8,%esp
c00089ad:	50                   	push   %eax
c00089ae:	68 0f b0 00 c0       	push   $0xc000b00f
c00089b3:	e8 fc 04 00 00       	call   c0008eb4 <Printf>
c00089b8:	83 c4 10             	add    $0x10,%esp
c00089bb:	e9 bc fe ff ff       	jmp    c000887c <simple_shell+0x45>
c00089c0:	e8 38 d5 ff ff       	call   c0005efd <fork>
c00089c5:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00089c8:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c00089cc:	7e 17                	jle    c00089e5 <simple_shell+0x1ae>
c00089ce:	83 ec 0c             	sub    $0xc,%esp
c00089d1:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c00089d7:	50                   	push   %eax
c00089d8:	e8 b9 d4 ff ff       	call   c0005e96 <wait>
c00089dd:	83 c4 10             	add    $0x10,%esp
c00089e0:	e9 97 fe ff ff       	jmp    c000887c <simple_shell+0x45>
c00089e5:	83 ec 0c             	sub    $0xc,%esp
c00089e8:	ff 75 d0             	pushl  -0x30(%ebp)
c00089eb:	e8 5a d4 ff ff       	call   c0005e4a <close>
c00089f0:	83 c4 10             	add    $0x10,%esp
c00089f3:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00089f9:	83 ec 08             	sub    $0x8,%esp
c00089fc:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008a02:	52                   	push   %edx
c0008a03:	50                   	push   %eax
c0008a04:	e8 e3 d5 ff ff       	call   c0005fec <execv>
c0008a09:	83 c4 10             	add    $0x10,%esp
c0008a0c:	eb fe                	jmp    c0008a0c <simple_shell+0x1d5>

c0008a0e <test_split_str>:
c0008a0e:	55                   	push   %ebp
c0008a0f:	89 e5                	mov    %esp,%ebp
c0008a11:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008a17:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008a1e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008a25:	c7 45 ec 15 b0 00 c0 	movl   $0xc000b015,-0x14(%ebp)
c0008a2c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008a30:	75 1a                	jne    c0008a4c <test_split_str+0x3e>
c0008a32:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a35:	0f b6 00             	movzbl (%eax),%eax
c0008a38:	0f be c0             	movsbl %al,%eax
c0008a3b:	83 ec 08             	sub    $0x8,%esp
c0008a3e:	50                   	push   %eax
c0008a3f:	68 26 b0 00 c0       	push   $0xc000b026
c0008a44:	e8 6b 04 00 00       	call   c0008eb4 <Printf>
c0008a49:	83 c4 10             	add    $0x10,%esp
c0008a4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a4f:	0f b6 00             	movzbl (%eax),%eax
c0008a52:	3c 20                	cmp    $0x20,%al
c0008a54:	75 0a                	jne    c0008a60 <test_split_str+0x52>
c0008a56:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a59:	0f b6 00             	movzbl (%eax),%eax
c0008a5c:	84 c0                	test   %al,%al
c0008a5e:	74 13                	je     c0008a73 <test_split_str+0x65>
c0008a60:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008a64:	75 0d                	jne    c0008a73 <test_split_str+0x65>
c0008a66:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a69:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008a6c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008a73:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a76:	0f b6 00             	movzbl (%eax),%eax
c0008a79:	3c 20                	cmp    $0x20,%al
c0008a7b:	74 0a                	je     c0008a87 <test_split_str+0x79>
c0008a7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008a80:	0f b6 00             	movzbl (%eax),%eax
c0008a83:	84 c0                	test   %al,%al
c0008a85:	75 26                	jne    c0008aad <test_split_str+0x9f>
c0008a87:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008a8b:	75 20                	jne    c0008aad <test_split_str+0x9f>
c0008a8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008a90:	8d 50 01             	lea    0x1(%eax),%edx
c0008a93:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008a96:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008a99:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008aa0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008aa3:	c6 00 00             	movb   $0x0,(%eax)
c0008aa6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008aad:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008ab1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ab4:	0f b6 00             	movzbl (%eax),%eax
c0008ab7:	84 c0                	test   %al,%al
c0008ab9:	0f 85 6d ff ff ff    	jne    c0008a2c <test_split_str+0x1e>
c0008abf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008ac2:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008ac5:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008acc:	83 ec 08             	sub    $0x8,%esp
c0008acf:	ff 75 f4             	pushl  -0xc(%ebp)
c0008ad2:	68 2f b0 00 c0       	push   $0xc000b02f
c0008ad7:	e8 d8 03 00 00       	call   c0008eb4 <Printf>
c0008adc:	83 c4 10             	add    $0x10,%esp
c0008adf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008ae6:	eb 22                	jmp    c0008b0a <test_split_str+0xfc>
c0008ae8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008aeb:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008af2:	83 ec 04             	sub    $0x4,%esp
c0008af5:	50                   	push   %eax
c0008af6:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008af9:	68 46 b0 00 c0       	push   $0xc000b046
c0008afe:	e8 b1 03 00 00       	call   c0008eb4 <Printf>
c0008b03:	83 c4 10             	add    $0x10,%esp
c0008b06:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008b0a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008b0d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0008b10:	7e d6                	jle    c0008ae8 <test_split_str+0xda>
c0008b12:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008b18:	83 ec 08             	sub    $0x8,%esp
c0008b1b:	68 55 b0 00 c0       	push   $0xc000b055
c0008b20:	50                   	push   %eax
c0008b21:	e8 a9 12 00 00       	call   c0009dcf <strcmp>
c0008b26:	83 c4 10             	add    $0x10,%esp
c0008b29:	85 c0                	test   %eax,%eax
c0008b2b:	75 10                	jne    c0008b3d <test_split_str+0x12f>
c0008b2d:	83 ec 0c             	sub    $0xc,%esp
c0008b30:	68 5a b0 00 c0       	push   $0xc000b05a
c0008b35:	e8 7a 03 00 00       	call   c0008eb4 <Printf>
c0008b3a:	83 c4 10             	add    $0x10,%esp
c0008b3d:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008b43:	83 ec 08             	sub    $0x8,%esp
c0008b46:	50                   	push   %eax
c0008b47:	68 66 b0 00 c0       	push   $0xc000b066
c0008b4c:	e8 63 03 00 00       	call   c0008eb4 <Printf>
c0008b51:	83 c4 10             	add    $0x10,%esp
c0008b54:	83 ec 0c             	sub    $0xc,%esp
c0008b57:	68 74 b0 00 c0       	push   $0xc000b074
c0008b5c:	e8 53 03 00 00       	call   c0008eb4 <Printf>
c0008b61:	83 c4 10             	add    $0x10,%esp
c0008b64:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008b6b:	eb 26                	jmp    c0008b93 <test_split_str+0x185>
c0008b6d:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008b73:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008b76:	01 d0                	add    %edx,%eax
c0008b78:	0f b6 00             	movzbl (%eax),%eax
c0008b7b:	0f be c0             	movsbl %al,%eax
c0008b7e:	83 ec 08             	sub    $0x8,%esp
c0008b81:	50                   	push   %eax
c0008b82:	68 83 b0 00 c0       	push   $0xc000b083
c0008b87:	e8 28 03 00 00       	call   c0008eb4 <Printf>
c0008b8c:	83 c4 10             	add    $0x10,%esp
c0008b8f:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008b93:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0008b97:	7e d4                	jle    c0008b6d <test_split_str+0x15f>
c0008b99:	c9                   	leave  
c0008b9a:	c3                   	ret    

c0008b9b <test_shell>:
c0008b9b:	55                   	push   %ebp
c0008b9c:	89 e5                	mov    %esp,%ebp
c0008b9e:	83 ec 48             	sub    $0x48,%esp
c0008ba1:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c0008ba8:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0008baf:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0008bb5:	83 ec 08             	sub    $0x8,%esp
c0008bb8:	6a 02                	push   $0x2
c0008bba:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c0008bbd:	50                   	push   %eax
c0008bbe:	e8 09 d1 ff ff       	call   c0005ccc <open>
c0008bc3:	83 c4 10             	add    $0x10,%esp
c0008bc6:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008bc9:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0008bd0:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0008bd7:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0008bde:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008be5:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008bec:	83 ec 0c             	sub    $0xc,%esp
c0008bef:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0008bf2:	50                   	push   %eax
c0008bf3:	e8 aa eb ff ff       	call   c00077a2 <untar>
c0008bf8:	83 c4 10             	add    $0x10,%esp
c0008bfb:	e8 fd d2 ff ff       	call   c0005efd <fork>
c0008c00:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008c03:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008c07:	7e 25                	jle    c0008c2e <test_shell+0x93>
c0008c09:	83 ec 0c             	sub    $0xc,%esp
c0008c0c:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0008c0f:	50                   	push   %eax
c0008c10:	e8 81 d2 ff ff       	call   c0005e96 <wait>
c0008c15:	83 c4 10             	add    $0x10,%esp
c0008c18:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008c1b:	83 ec 08             	sub    $0x8,%esp
c0008c1e:	50                   	push   %eax
c0008c1f:	68 8c b0 00 c0       	push   $0xc000b08c
c0008c24:	e8 8b 02 00 00       	call   c0008eb4 <Printf>
c0008c29:	83 c4 10             	add    $0x10,%esp
c0008c2c:	eb 23                	jmp    c0008c51 <test_shell+0xb6>
c0008c2e:	83 ec 0c             	sub    $0xc,%esp
c0008c31:	68 9e b0 00 c0       	push   $0xc000b09e
c0008c36:	e8 79 02 00 00       	call   c0008eb4 <Printf>
c0008c3b:	83 c4 10             	add    $0x10,%esp
c0008c3e:	83 ec 0c             	sub    $0xc,%esp
c0008c41:	ff 75 f4             	pushl  -0xc(%ebp)
c0008c44:	e8 01 d2 ff ff       	call   c0005e4a <close>
c0008c49:	83 c4 10             	add    $0x10,%esp
c0008c4c:	e8 e6 fb ff ff       	call   c0008837 <simple_shell>
c0008c51:	83 ec 0c             	sub    $0xc,%esp
c0008c54:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0008c57:	50                   	push   %eax
c0008c58:	e8 39 d2 ff ff       	call   c0005e96 <wait>
c0008c5d:	83 c4 10             	add    $0x10,%esp
c0008c60:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008c63:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008c66:	83 ec 08             	sub    $0x8,%esp
c0008c69:	50                   	push   %eax
c0008c6a:	68 ac b0 00 c0       	push   $0xc000b0ac
c0008c6f:	e8 40 02 00 00       	call   c0008eb4 <Printf>
c0008c74:	83 c4 10             	add    $0x10,%esp
c0008c77:	eb d8                	jmp    c0008c51 <test_shell+0xb6>

c0008c79 <test_exec>:
c0008c79:	55                   	push   %ebp
c0008c7a:	89 e5                	mov    %esp,%ebp
c0008c7c:	83 ec 38             	sub    $0x38,%esp
c0008c7f:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008c86:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008c8d:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008c93:	83 ec 08             	sub    $0x8,%esp
c0008c96:	6a 02                	push   $0x2
c0008c98:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008c9b:	50                   	push   %eax
c0008c9c:	e8 2b d0 ff ff       	call   c0005ccc <open>
c0008ca1:	83 c4 10             	add    $0x10,%esp
c0008ca4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ca7:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0008cae:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0008cb5:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0008cbc:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008cc3:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0008cca:	83 ec 0c             	sub    $0xc,%esp
c0008ccd:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0008cd0:	50                   	push   %eax
c0008cd1:	e8 cc ea ff ff       	call   c00077a2 <untar>
c0008cd6:	83 c4 10             	add    $0x10,%esp
c0008cd9:	e8 1f d2 ff ff       	call   c0005efd <fork>
c0008cde:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008ce1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008ce5:	7e 25                	jle    c0008d0c <test_exec+0x93>
c0008ce7:	83 ec 0c             	sub    $0xc,%esp
c0008cea:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0008ced:	50                   	push   %eax
c0008cee:	e8 a3 d1 ff ff       	call   c0005e96 <wait>
c0008cf3:	83 c4 10             	add    $0x10,%esp
c0008cf6:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008cf9:	83 ec 08             	sub    $0x8,%esp
c0008cfc:	50                   	push   %eax
c0008cfd:	68 8c b0 00 c0       	push   $0xc000b08c
c0008d02:	e8 ad 01 00 00       	call   c0008eb4 <Printf>
c0008d07:	83 c4 10             	add    $0x10,%esp
c0008d0a:	eb 33                	jmp    c0008d3f <test_exec+0xc6>
c0008d0c:	83 ec 0c             	sub    $0xc,%esp
c0008d0f:	68 9e b0 00 c0       	push   $0xc000b09e
c0008d14:	e8 9b 01 00 00       	call   c0008eb4 <Printf>
c0008d19:	83 c4 10             	add    $0x10,%esp
c0008d1c:	83 ec 0c             	sub    $0xc,%esp
c0008d1f:	6a 00                	push   $0x0
c0008d21:	68 c7 b0 00 c0       	push   $0xc000b0c7
c0008d26:	68 cd b0 00 c0       	push   $0xc000b0cd
c0008d2b:	68 55 b0 00 c0       	push   $0xc000b055
c0008d30:	68 d3 b0 00 c0       	push   $0xc000b0d3
c0008d35:	e8 57 d4 ff ff       	call   c0006191 <execl>
c0008d3a:	83 c4 20             	add    $0x20,%esp
c0008d3d:	eb fe                	jmp    c0008d3d <test_exec+0xc4>
c0008d3f:	c9                   	leave  
c0008d40:	c3                   	ret    

c0008d41 <INIT>:
c0008d41:	55                   	push   %ebp
c0008d42:	89 e5                	mov    %esp,%ebp
c0008d44:	83 ec 08             	sub    $0x8,%esp
c0008d47:	e8 4f fe ff ff       	call   c0008b9b <test_shell>
c0008d4c:	eb fe                	jmp    c0008d4c <INIT+0xb>

c0008d4e <TestA>:
c0008d4e:	55                   	push   %ebp
c0008d4f:	89 e5                	mov    %esp,%ebp
c0008d51:	83 ec 08             	sub    $0x8,%esp
c0008d54:	83 ec 0c             	sub    $0xc,%esp
c0008d57:	6a 05                	push   $0x5
c0008d59:	e8 f4 ec ff ff       	call   c0007a52 <disp_int>
c0008d5e:	83 c4 10             	add    $0x10,%esp
c0008d61:	83 ec 0c             	sub    $0xc,%esp
c0008d64:	68 54 ac 00 c0       	push   $0xc000ac54
c0008d69:	e8 1e 88 ff ff       	call   c000158c <disp_str>
c0008d6e:	83 c4 10             	add    $0x10,%esp
c0008d71:	83 ec 0c             	sub    $0xc,%esp
c0008d74:	68 d9 b0 00 c0       	push   $0xc000b0d9
c0008d79:	e8 0e 88 ff ff       	call   c000158c <disp_str>
c0008d7e:	83 c4 10             	add    $0x10,%esp
c0008d81:	eb fe                	jmp    c0008d81 <TestA+0x33>

c0008d83 <delay>:
c0008d83:	55                   	push   %ebp
c0008d84:	89 e5                	mov    %esp,%ebp
c0008d86:	83 ec 10             	sub    $0x10,%esp
c0008d89:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008d90:	eb 2d                	jmp    c0008dbf <delay+0x3c>
c0008d92:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0008d99:	eb 1a                	jmp    c0008db5 <delay+0x32>
c0008d9b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008da2:	eb 04                	jmp    c0008da8 <delay+0x25>
c0008da4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008da8:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c0008daf:	7e f3                	jle    c0008da4 <delay+0x21>
c0008db1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008db5:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0008db9:	7e e0                	jle    c0008d9b <delay+0x18>
c0008dbb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008dbf:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008dc2:	3b 45 08             	cmp    0x8(%ebp),%eax
c0008dc5:	7c cb                	jl     c0008d92 <delay+0xf>
c0008dc7:	90                   	nop
c0008dc8:	c9                   	leave  
c0008dc9:	c3                   	ret    

c0008dca <TestB>:
c0008dca:	55                   	push   %ebp
c0008dcb:	89 e5                	mov    %esp,%ebp
c0008dcd:	83 ec 08             	sub    $0x8,%esp
c0008dd0:	83 ec 0c             	sub    $0xc,%esp
c0008dd3:	68 e0 b0 00 c0       	push   $0xc000b0e0
c0008dd8:	e8 af 87 ff ff       	call   c000158c <disp_str>
c0008ddd:	83 c4 10             	add    $0x10,%esp
c0008de0:	eb fe                	jmp    c0008de0 <TestB+0x16>

c0008de2 <TestC>:
c0008de2:	55                   	push   %ebp
c0008de3:	89 e5                	mov    %esp,%ebp
c0008de5:	83 ec 18             	sub    $0x18,%esp
c0008de8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008def:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008df3:	77 1a                	ja     c0008e0f <TestC+0x2d>
c0008df5:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0008dfc:	83 ec 08             	sub    $0x8,%esp
c0008dff:	ff 75 f0             	pushl  -0x10(%ebp)
c0008e02:	68 e3 b0 00 c0       	push   $0xc000b0e3
c0008e07:	e8 a8 00 00 00       	call   c0008eb4 <Printf>
c0008e0c:	83 c4 10             	add    $0x10,%esp
c0008e0f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008e13:	eb da                	jmp    c0008def <TestC+0xd>

c0008e15 <sys_get_ticks>:
c0008e15:	55                   	push   %ebp
c0008e16:	89 e5                	mov    %esp,%ebp
c0008e18:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008e1d:	5d                   	pop    %ebp
c0008e1e:	c3                   	ret    

c0008e1f <sys_write>:
c0008e1f:	55                   	push   %ebp
c0008e20:	89 e5                	mov    %esp,%ebp
c0008e22:	83 ec 18             	sub    $0x18,%esp
c0008e25:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e28:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0008e2e:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0008e34:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0008e39:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008e3c:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008e3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008e42:	8b 45 08             	mov    0x8(%ebp),%eax
c0008e45:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008e48:	eb 20                	jmp    c0008e6a <sys_write+0x4b>
c0008e4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008e4d:	0f b6 00             	movzbl (%eax),%eax
c0008e50:	0f b6 c0             	movzbl %al,%eax
c0008e53:	83 ec 08             	sub    $0x8,%esp
c0008e56:	50                   	push   %eax
c0008e57:	ff 75 ec             	pushl  -0x14(%ebp)
c0008e5a:	e8 f9 c1 ff ff       	call   c0005058 <out_char>
c0008e5f:	83 c4 10             	add    $0x10,%esp
c0008e62:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008e66:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0008e6a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008e6e:	7f da                	jg     c0008e4a <sys_write+0x2b>
c0008e70:	90                   	nop
c0008e71:	c9                   	leave  
c0008e72:	c3                   	ret    

c0008e73 <milli_delay>:
c0008e73:	55                   	push   %ebp
c0008e74:	89 e5                	mov    %esp,%ebp
c0008e76:	83 ec 18             	sub    $0x18,%esp
c0008e79:	e8 7d 0d 00 00       	call   c0009bfb <get_ticks_ipc>
c0008e7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008e81:	90                   	nop
c0008e82:	e8 74 0d 00 00       	call   c0009bfb <get_ticks_ipc>
c0008e87:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0008e8a:	89 c1                	mov    %eax,%ecx
c0008e8c:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0008e91:	89 c8                	mov    %ecx,%eax
c0008e93:	f7 ea                	imul   %edx
c0008e95:	c1 fa 05             	sar    $0x5,%edx
c0008e98:	89 c8                	mov    %ecx,%eax
c0008e9a:	c1 f8 1f             	sar    $0x1f,%eax
c0008e9d:	29 c2                	sub    %eax,%edx
c0008e9f:	89 d0                	mov    %edx,%eax
c0008ea1:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0008ea7:	39 45 08             	cmp    %eax,0x8(%ebp)
c0008eaa:	77 d6                	ja     c0008e82 <milli_delay+0xf>
c0008eac:	90                   	nop
c0008ead:	c9                   	leave  
c0008eae:	c3                   	ret    

c0008eaf <TaskSys>:
c0008eaf:	55                   	push   %ebp
c0008eb0:	89 e5                	mov    %esp,%ebp
c0008eb2:	eb fe                	jmp    c0008eb2 <TaskSys+0x3>

c0008eb4 <Printf>:
c0008eb4:	55                   	push   %ebp
c0008eb5:	89 e5                	mov    %esp,%ebp
c0008eb7:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008ebd:	83 ec 04             	sub    $0x4,%esp
c0008ec0:	68 00 01 00 00       	push   $0x100
c0008ec5:	6a 00                	push   $0x0
c0008ec7:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008ecd:	50                   	push   %eax
c0008ece:	e8 9f 24 00 00       	call   c000b372 <Memset>
c0008ed3:	83 c4 10             	add    $0x10,%esp
c0008ed6:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008ed9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008edc:	8b 45 08             	mov    0x8(%ebp),%eax
c0008edf:	83 ec 04             	sub    $0x4,%esp
c0008ee2:	ff 75 f4             	pushl  -0xc(%ebp)
c0008ee5:	50                   	push   %eax
c0008ee6:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008eec:	50                   	push   %eax
c0008eed:	e8 20 00 00 00       	call   c0008f12 <vsprintf>
c0008ef2:	83 c4 10             	add    $0x10,%esp
c0008ef5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008ef8:	83 ec 04             	sub    $0x4,%esp
c0008efb:	ff 75 f0             	pushl  -0x10(%ebp)
c0008efe:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008f04:	50                   	push   %eax
c0008f05:	6a 00                	push   $0x0
c0008f07:	e8 b9 ce ff ff       	call   c0005dc5 <write>
c0008f0c:	83 c4 10             	add    $0x10,%esp
c0008f0f:	90                   	nop
c0008f10:	c9                   	leave  
c0008f11:	c3                   	ret    

c0008f12 <vsprintf>:
c0008f12:	55                   	push   %ebp
c0008f13:	89 e5                	mov    %esp,%ebp
c0008f15:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0008f1b:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008f21:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0008f27:	83 ec 04             	sub    $0x4,%esp
c0008f2a:	6a 40                	push   $0x40
c0008f2c:	6a 00                	push   $0x0
c0008f2e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008f34:	50                   	push   %eax
c0008f35:	e8 38 24 00 00       	call   c000b372 <Memset>
c0008f3a:	83 c4 10             	add    $0x10,%esp
c0008f3d:	8b 45 10             	mov    0x10(%ebp),%eax
c0008f40:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f43:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008f4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f50:	e9 53 01 00 00       	jmp    c00090a8 <vsprintf+0x196>
c0008f55:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008f58:	0f b6 00             	movzbl (%eax),%eax
c0008f5b:	3c 25                	cmp    $0x25,%al
c0008f5d:	74 16                	je     c0008f75 <vsprintf+0x63>
c0008f5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008f62:	8d 50 01             	lea    0x1(%eax),%edx
c0008f65:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008f68:	8b 55 0c             	mov    0xc(%ebp),%edx
c0008f6b:	0f b6 12             	movzbl (%edx),%edx
c0008f6e:	88 10                	mov    %dl,(%eax)
c0008f70:	e9 2f 01 00 00       	jmp    c00090a4 <vsprintf+0x192>
c0008f75:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008f79:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008f7c:	0f b6 00             	movzbl (%eax),%eax
c0008f7f:	0f be c0             	movsbl %al,%eax
c0008f82:	83 f8 64             	cmp    $0x64,%eax
c0008f85:	74 26                	je     c0008fad <vsprintf+0x9b>
c0008f87:	83 f8 64             	cmp    $0x64,%eax
c0008f8a:	7f 0e                	jg     c0008f9a <vsprintf+0x88>
c0008f8c:	83 f8 63             	cmp    $0x63,%eax
c0008f8f:	0f 84 f2 00 00 00    	je     c0009087 <vsprintf+0x175>
c0008f95:	e9 0a 01 00 00       	jmp    c00090a4 <vsprintf+0x192>
c0008f9a:	83 f8 73             	cmp    $0x73,%eax
c0008f9d:	0f 84 b0 00 00 00    	je     c0009053 <vsprintf+0x141>
c0008fa3:	83 f8 78             	cmp    $0x78,%eax
c0008fa6:	74 5d                	je     c0009005 <vsprintf+0xf3>
c0008fa8:	e9 f7 00 00 00       	jmp    c00090a4 <vsprintf+0x192>
c0008fad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008fb0:	8b 00                	mov    (%eax),%eax
c0008fb2:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008fb5:	83 ec 04             	sub    $0x4,%esp
c0008fb8:	6a 0a                	push   $0xa
c0008fba:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c0008fc0:	50                   	push   %eax
c0008fc1:	ff 75 e8             	pushl  -0x18(%ebp)
c0008fc4:	e8 7d 0c 00 00       	call   c0009c46 <itoa>
c0008fc9:	83 c4 10             	add    $0x10,%esp
c0008fcc:	83 ec 08             	sub    $0x8,%esp
c0008fcf:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008fd5:	50                   	push   %eax
c0008fd6:	ff 75 f4             	pushl  -0xc(%ebp)
c0008fd9:	e8 b3 23 00 00       	call   c000b391 <Strcpy>
c0008fde:	83 c4 10             	add    $0x10,%esp
c0008fe1:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0008fe5:	83 ec 0c             	sub    $0xc,%esp
c0008fe8:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008fee:	50                   	push   %eax
c0008fef:	e8 b7 23 00 00       	call   c000b3ab <Strlen>
c0008ff4:	83 c4 10             	add    $0x10,%esp
c0008ff7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008ffa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ffd:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009000:	e9 9f 00 00 00       	jmp    c00090a4 <vsprintf+0x192>
c0009005:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009008:	8b 00                	mov    (%eax),%eax
c000900a:	83 ec 08             	sub    $0x8,%esp
c000900d:	50                   	push   %eax
c000900e:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009014:	50                   	push   %eax
c0009015:	e8 92 e9 ff ff       	call   c00079ac <atoi>
c000901a:	83 c4 10             	add    $0x10,%esp
c000901d:	83 ec 08             	sub    $0x8,%esp
c0009020:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009026:	50                   	push   %eax
c0009027:	ff 75 f4             	pushl  -0xc(%ebp)
c000902a:	e8 62 23 00 00       	call   c000b391 <Strcpy>
c000902f:	83 c4 10             	add    $0x10,%esp
c0009032:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009036:	83 ec 0c             	sub    $0xc,%esp
c0009039:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000903f:	50                   	push   %eax
c0009040:	e8 66 23 00 00       	call   c000b3ab <Strlen>
c0009045:	83 c4 10             	add    $0x10,%esp
c0009048:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000904b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000904e:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009051:	eb 51                	jmp    c00090a4 <vsprintf+0x192>
c0009053:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009056:	8b 00                	mov    (%eax),%eax
c0009058:	83 ec 08             	sub    $0x8,%esp
c000905b:	50                   	push   %eax
c000905c:	ff 75 f4             	pushl  -0xc(%ebp)
c000905f:	e8 2d 23 00 00       	call   c000b391 <Strcpy>
c0009064:	83 c4 10             	add    $0x10,%esp
c0009067:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000906a:	8b 00                	mov    (%eax),%eax
c000906c:	83 ec 0c             	sub    $0xc,%esp
c000906f:	50                   	push   %eax
c0009070:	e8 36 23 00 00       	call   c000b3ab <Strlen>
c0009075:	83 c4 10             	add    $0x10,%esp
c0009078:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000907b:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c000907f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009082:	01 45 f4             	add    %eax,-0xc(%ebp)
c0009085:	eb 1d                	jmp    c00090a4 <vsprintf+0x192>
c0009087:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000908a:	0f b6 10             	movzbl (%eax),%edx
c000908d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009090:	88 10                	mov    %dl,(%eax)
c0009092:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009096:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c000909d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00090a0:	01 45 f4             	add    %eax,-0xc(%ebp)
c00090a3:	90                   	nop
c00090a4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c00090a8:	8b 45 0c             	mov    0xc(%ebp),%eax
c00090ab:	0f b6 00             	movzbl (%eax),%eax
c00090ae:	84 c0                	test   %al,%al
c00090b0:	0f 85 9f fe ff ff    	jne    c0008f55 <vsprintf+0x43>
c00090b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00090b9:	2b 45 08             	sub    0x8(%ebp),%eax
c00090bc:	c9                   	leave  
c00090bd:	c3                   	ret    

c00090be <printx>:
c00090be:	55                   	push   %ebp
c00090bf:	89 e5                	mov    %esp,%ebp
c00090c1:	81 ec 18 01 00 00    	sub    $0x118,%esp
c00090c7:	8d 45 0c             	lea    0xc(%ebp),%eax
c00090ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00090cd:	8b 45 08             	mov    0x8(%ebp),%eax
c00090d0:	83 ec 04             	sub    $0x4,%esp
c00090d3:	ff 75 f4             	pushl  -0xc(%ebp)
c00090d6:	50                   	push   %eax
c00090d7:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00090dd:	50                   	push   %eax
c00090de:	e8 2f fe ff ff       	call   c0008f12 <vsprintf>
c00090e3:	83 c4 10             	add    $0x10,%esp
c00090e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00090e9:	83 ec 08             	sub    $0x8,%esp
c00090ec:	ff 75 f0             	pushl  -0x10(%ebp)
c00090ef:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c00090f5:	50                   	push   %eax
c00090f6:	e8 fd 96 ff ff       	call   c00027f8 <write_debug>
c00090fb:	83 c4 10             	add    $0x10,%esp
c00090fe:	90                   	nop
c00090ff:	c9                   	leave  
c0009100:	c3                   	ret    

c0009101 <sys_printx>:
c0009101:	55                   	push   %ebp
c0009102:	89 e5                	mov    %esp,%ebp
c0009104:	83 ec 28             	sub    $0x28,%esp
c0009107:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c000910c:	85 c0                	test   %eax,%eax
c000910e:	75 23                	jne    c0009133 <sys_printx+0x32>
c0009110:	8b 45 10             	mov    0x10(%ebp),%eax
c0009113:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c0009119:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000911c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000911f:	83 ec 08             	sub    $0x8,%esp
c0009122:	ff 75 10             	pushl  0x10(%ebp)
c0009125:	50                   	push   %eax
c0009126:	e8 31 ba ff ff       	call   c0004b5c <Seg2PhyAddrLDT>
c000912b:	83 c4 10             	add    $0x10,%esp
c000912e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009131:	eb 19                	jmp    c000914c <sys_printx+0x4b>
c0009133:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0009138:	85 c0                	test   %eax,%eax
c000913a:	74 10                	je     c000914c <sys_printx+0x4b>
c000913c:	83 ec 0c             	sub    $0xc,%esp
c000913f:	6a 30                	push   $0x30
c0009141:	e8 d5 b9 ff ff       	call   c0004b1b <Seg2PhyAddr>
c0009146:	83 c4 10             	add    $0x10,%esp
c0009149:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000914c:	8b 55 08             	mov    0x8(%ebp),%edx
c000914f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009152:	01 d0                	add    %edx,%eax
c0009154:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009157:	8b 45 10             	mov    0x10(%ebp),%eax
c000915a:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0009160:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0009166:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c000916b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000916e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009171:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009174:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009177:	0f b6 00             	movzbl (%eax),%eax
c000917a:	88 45 e3             	mov    %al,-0x1d(%ebp)
c000917d:	eb 3a                	jmp    c00091b9 <sys_printx+0xb8>
c000917f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009182:	0f b6 00             	movzbl (%eax),%eax
c0009185:	3c 3b                	cmp    $0x3b,%al
c0009187:	74 0a                	je     c0009193 <sys_printx+0x92>
c0009189:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000918c:	0f b6 00             	movzbl (%eax),%eax
c000918f:	3c 3a                	cmp    $0x3a,%al
c0009191:	75 06                	jne    c0009199 <sys_printx+0x98>
c0009193:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009197:	eb 20                	jmp    c00091b9 <sys_printx+0xb8>
c0009199:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000919c:	0f b6 00             	movzbl (%eax),%eax
c000919f:	0f b6 c0             	movzbl %al,%eax
c00091a2:	83 ec 08             	sub    $0x8,%esp
c00091a5:	50                   	push   %eax
c00091a6:	ff 75 e4             	pushl  -0x1c(%ebp)
c00091a9:	e8 aa be ff ff       	call   c0005058 <out_char>
c00091ae:	83 c4 10             	add    $0x10,%esp
c00091b1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00091b5:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c00091b9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00091bd:	7f c0                	jg     c000917f <sys_printx+0x7e>
c00091bf:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c00091c3:	75 10                	jne    c00091d5 <sys_printx+0xd4>
c00091c5:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c00091ca:	85 c0                	test   %eax,%eax
c00091cc:	74 13                	je     c00091e1 <sys_printx+0xe0>
c00091ce:	e8 e5 85 ff ff       	call   c00017b8 <disable_int>
c00091d3:	eb 0c                	jmp    c00091e1 <sys_printx+0xe0>
c00091d5:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c00091d9:	75 06                	jne    c00091e1 <sys_printx+0xe0>
c00091db:	e8 d8 85 ff ff       	call   c00017b8 <disable_int>
c00091e0:	90                   	nop
c00091e1:	90                   	nop
c00091e2:	c9                   	leave  
c00091e3:	c3                   	ret    

c00091e4 <spin>:
c00091e4:	55                   	push   %ebp
c00091e5:	89 e5                	mov    %esp,%ebp
c00091e7:	83 ec 08             	sub    $0x8,%esp
c00091ea:	83 ec 0c             	sub    $0xc,%esp
c00091ed:	ff 75 08             	pushl  0x8(%ebp)
c00091f0:	e8 97 83 ff ff       	call   c000158c <disp_str>
c00091f5:	83 c4 10             	add    $0x10,%esp
c00091f8:	83 ec 0c             	sub    $0xc,%esp
c00091fb:	68 54 ac 00 c0       	push   $0xc000ac54
c0009200:	e8 87 83 ff ff       	call   c000158c <disp_str>
c0009205:	83 c4 10             	add    $0x10,%esp
c0009208:	eb fe                	jmp    c0009208 <spin+0x24>

c000920a <panic>:
c000920a:	55                   	push   %ebp
c000920b:	89 e5                	mov    %esp,%ebp
c000920d:	83 ec 08             	sub    $0x8,%esp
c0009210:	83 ec 04             	sub    $0x4,%esp
c0009213:	ff 75 08             	pushl  0x8(%ebp)
c0009216:	6a 3a                	push   $0x3a
c0009218:	68 f0 b0 00 c0       	push   $0xc000b0f0
c000921d:	e8 9c fe ff ff       	call   c00090be <printx>
c0009222:	83 c4 10             	add    $0x10,%esp
c0009225:	90                   	nop
c0009226:	c9                   	leave  
c0009227:	c3                   	ret    

c0009228 <assertion_failure>:
c0009228:	55                   	push   %ebp
c0009229:	89 e5                	mov    %esp,%ebp
c000922b:	83 ec 08             	sub    $0x8,%esp
c000922e:	83 ec 08             	sub    $0x8,%esp
c0009231:	ff 75 14             	pushl  0x14(%ebp)
c0009234:	ff 75 10             	pushl  0x10(%ebp)
c0009237:	ff 75 0c             	pushl  0xc(%ebp)
c000923a:	ff 75 08             	pushl  0x8(%ebp)
c000923d:	6a 3b                	push   $0x3b
c000923f:	68 f8 b0 00 c0       	push   $0xc000b0f8
c0009244:	e8 75 fe ff ff       	call   c00090be <printx>
c0009249:	83 c4 20             	add    $0x20,%esp
c000924c:	83 ec 0c             	sub    $0xc,%esp
c000924f:	68 2b b1 00 c0       	push   $0xc000b12b
c0009254:	e8 8b ff ff ff       	call   c00091e4 <spin>
c0009259:	83 c4 10             	add    $0x10,%esp
c000925c:	90                   	nop
c000925d:	c9                   	leave  
c000925e:	c3                   	ret    

c000925f <dead_lock>:
c000925f:	55                   	push   %ebp
c0009260:	89 e5                	mov    %esp,%ebp
c0009262:	b8 00 00 00 00       	mov    $0x0,%eax
c0009267:	5d                   	pop    %ebp
c0009268:	c3                   	ret    

c0009269 <sys_send_msg>:
c0009269:	55                   	push   %ebp
c000926a:	89 e5                	mov    %esp,%ebp
c000926c:	83 ec 48             	sub    $0x48,%esp
c000926f:	83 ec 0c             	sub    $0xc,%esp
c0009272:	ff 75 0c             	pushl  0xc(%ebp)
c0009275:	e8 ad b7 ff ff       	call   c0004a27 <pid2proc>
c000927a:	83 c4 10             	add    $0x10,%esp
c000927d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009280:	83 ec 0c             	sub    $0xc,%esp
c0009283:	ff 75 10             	pushl  0x10(%ebp)
c0009286:	e8 0c b8 ff ff       	call   c0004a97 <proc2pid>
c000928b:	83 c4 10             	add    $0x10,%esp
c000928e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009291:	8b 45 10             	mov    0x10(%ebp),%eax
c0009294:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c000929a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000929d:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00092a4:	8b 45 08             	mov    0x8(%ebp),%eax
c00092a7:	83 ec 08             	sub    $0x8,%esp
c00092aa:	6a 6c                	push   $0x6c
c00092ac:	50                   	push   %eax
c00092ad:	e8 e6 da ff ff       	call   c0006d98 <alloc_virtual_memory>
c00092b2:	83 c4 10             	add    $0x10,%esp
c00092b5:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00092b8:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c00092bf:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00092c2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00092c5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00092c8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00092cb:	89 10                	mov    %edx,(%eax)
c00092cd:	83 ec 08             	sub    $0x8,%esp
c00092d0:	ff 75 0c             	pushl  0xc(%ebp)
c00092d3:	ff 75 e8             	pushl  -0x18(%ebp)
c00092d6:	e8 84 ff ff ff       	call   c000925f <dead_lock>
c00092db:	83 c4 10             	add    $0x10,%esp
c00092de:	83 f8 01             	cmp    $0x1,%eax
c00092e1:	75 10                	jne    c00092f3 <sys_send_msg+0x8a>
c00092e3:	83 ec 0c             	sub    $0xc,%esp
c00092e6:	68 37 b1 00 c0       	push   $0xc000b137
c00092eb:	e8 1a ff ff ff       	call   c000920a <panic>
c00092f0:	83 c4 10             	add    $0x10,%esp
c00092f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00092f6:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00092fd:	3c 02                	cmp    $0x2,%al
c00092ff:	0f 85 8a 01 00 00    	jne    c000948f <sys_send_msg+0x226>
c0009305:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009308:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000930e:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c0009311:	74 12                	je     c0009325 <sys_send_msg+0xbc>
c0009313:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009316:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000931c:	83 f8 0e             	cmp    $0xe,%eax
c000931f:	0f 85 6a 01 00 00    	jne    c000948f <sys_send_msg+0x226>
c0009325:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009328:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c000932e:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009331:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009334:	83 ec 08             	sub    $0x8,%esp
c0009337:	ff 75 ec             	pushl  -0x14(%ebp)
c000933a:	50                   	push   %eax
c000933b:	e8 1c b8 ff ff       	call   c0004b5c <Seg2PhyAddrLDT>
c0009340:	83 c4 10             	add    $0x10,%esp
c0009343:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009346:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009349:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c000934f:	83 ec 08             	sub    $0x8,%esp
c0009352:	6a 6c                	push   $0x6c
c0009354:	50                   	push   %eax
c0009355:	e8 3e da ff ff       	call   c0006d98 <alloc_virtual_memory>
c000935a:	83 c4 10             	add    $0x10,%esp
c000935d:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0009360:	8b 55 dc             	mov    -0x24(%ebp),%edx
c0009363:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0009366:	83 ec 04             	sub    $0x4,%esp
c0009369:	ff 75 d8             	pushl  -0x28(%ebp)
c000936c:	52                   	push   %edx
c000936d:	50                   	push   %eax
c000936e:	e8 d1 1f 00 00       	call   c000b344 <Memcpy>
c0009373:	83 c4 10             	add    $0x10,%esp
c0009376:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009379:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c0009380:	00 00 00 
c0009383:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009386:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c000938d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009390:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009397:	00 00 00 
c000939a:	8b 45 10             	mov    0x10(%ebp),%eax
c000939d:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c00093a4:	00 00 00 
c00093a7:	83 ec 0c             	sub    $0xc,%esp
c00093aa:	ff 75 ec             	pushl  -0x14(%ebp)
c00093ad:	e8 f9 07 00 00       	call   c0009bab <unblock>
c00093b2:	83 c4 10             	add    $0x10,%esp
c00093b5:	8b 45 10             	mov    0x10(%ebp),%eax
c00093b8:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00093bf:	84 c0                	test   %al,%al
c00093c1:	74 1c                	je     c00093df <sys_send_msg+0x176>
c00093c3:	68 89 05 00 00       	push   $0x589
c00093c8:	68 42 b1 00 c0       	push   $0xc000b142
c00093cd:	68 42 b1 00 c0       	push   $0xc000b142
c00093d2:	68 52 b1 00 c0       	push   $0xc000b152
c00093d7:	e8 4c fe ff ff       	call   c0009228 <assertion_failure>
c00093dc:	83 c4 10             	add    $0x10,%esp
c00093df:	8b 45 10             	mov    0x10(%ebp),%eax
c00093e2:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00093e8:	83 f8 1d             	cmp    $0x1d,%eax
c00093eb:	74 1c                	je     c0009409 <sys_send_msg+0x1a0>
c00093ed:	68 8a 05 00 00       	push   $0x58a
c00093f2:	68 42 b1 00 c0       	push   $0xc000b142
c00093f7:	68 42 b1 00 c0       	push   $0xc000b142
c00093fc:	68 66 b1 00 c0       	push   $0xc000b166
c0009401:	e8 22 fe ff ff       	call   c0009228 <assertion_failure>
c0009406:	83 c4 10             	add    $0x10,%esp
c0009409:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000940c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009412:	85 c0                	test   %eax,%eax
c0009414:	74 1c                	je     c0009432 <sys_send_msg+0x1c9>
c0009416:	68 8c 05 00 00       	push   $0x58c
c000941b:	68 42 b1 00 c0       	push   $0xc000b142
c0009420:	68 42 b1 00 c0       	push   $0xc000b142
c0009425:	68 83 b1 00 c0       	push   $0xc000b183
c000942a:	e8 f9 fd ff ff       	call   c0009228 <assertion_failure>
c000942f:	83 c4 10             	add    $0x10,%esp
c0009432:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009435:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000943c:	84 c0                	test   %al,%al
c000943e:	74 1c                	je     c000945c <sys_send_msg+0x1f3>
c0009440:	68 8d 05 00 00       	push   $0x58d
c0009445:	68 42 b1 00 c0       	push   $0xc000b142
c000944a:	68 42 b1 00 c0       	push   $0xc000b142
c000944f:	68 98 b1 00 c0       	push   $0xc000b198
c0009454:	e8 cf fd ff ff       	call   c0009228 <assertion_failure>
c0009459:	83 c4 10             	add    $0x10,%esp
c000945c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000945f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009465:	83 f8 1d             	cmp    $0x1d,%eax
c0009468:	0f 84 45 01 00 00    	je     c00095b3 <sys_send_msg+0x34a>
c000946e:	68 8e 05 00 00       	push   $0x58e
c0009473:	68 42 b1 00 c0       	push   $0xc000b142
c0009478:	68 42 b1 00 c0       	push   $0xc000b142
c000947d:	68 b0 b1 00 c0       	push   $0xc000b1b0
c0009482:	e8 a1 fd ff ff       	call   c0009228 <assertion_failure>
c0009487:	83 c4 10             	add    $0x10,%esp
c000948a:	e9 24 01 00 00       	jmp    c00095b3 <sys_send_msg+0x34a>
c000948f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009496:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009499:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000949c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000949f:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00094a5:	85 c0                	test   %eax,%eax
c00094a7:	75 1b                	jne    c00094c4 <sys_send_msg+0x25b>
c00094a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094ac:	8b 55 10             	mov    0x10(%ebp),%edx
c00094af:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c00094b5:	8b 45 10             	mov    0x10(%ebp),%eax
c00094b8:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00094bf:	00 00 00 
c00094c2:	eb 3f                	jmp    c0009503 <sys_send_msg+0x29a>
c00094c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094c7:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00094cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00094d0:	eb 12                	jmp    c00094e4 <sys_send_msg+0x27b>
c00094d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00094d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00094db:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00094e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00094e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00094e8:	75 e8                	jne    c00094d2 <sys_send_msg+0x269>
c00094ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00094ed:	8b 55 10             	mov    0x10(%ebp),%edx
c00094f0:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c00094f6:	8b 45 10             	mov    0x10(%ebp),%eax
c00094f9:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0009500:	00 00 00 
c0009503:	8b 45 10             	mov    0x10(%ebp),%eax
c0009506:	8b 55 08             	mov    0x8(%ebp),%edx
c0009509:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c000950f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009512:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009515:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c000951b:	8b 45 10             	mov    0x10(%ebp),%eax
c000951e:	c6 80 44 02 00 00 01 	movb   $0x1,0x244(%eax)
c0009525:	8b 45 10             	mov    0x10(%ebp),%eax
c0009528:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000952f:	3c 01                	cmp    $0x1,%al
c0009531:	74 1c                	je     c000954f <sys_send_msg+0x2e6>
c0009533:	68 af 05 00 00       	push   $0x5af
c0009538:	68 42 b1 00 c0       	push   $0xc000b142
c000953d:	68 42 b1 00 c0       	push   $0xc000b142
c0009542:	68 d4 b1 00 c0       	push   $0xc000b1d4
c0009547:	e8 dc fc ff ff       	call   c0009228 <assertion_failure>
c000954c:	83 c4 10             	add    $0x10,%esp
c000954f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009552:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009558:	39 45 0c             	cmp    %eax,0xc(%ebp)
c000955b:	74 1c                	je     c0009579 <sys_send_msg+0x310>
c000955d:	68 b0 05 00 00       	push   $0x5b0
c0009562:	68 42 b1 00 c0       	push   $0xc000b142
c0009567:	68 42 b1 00 c0       	push   $0xc000b142
c000956c:	68 f0 b1 00 c0       	push   $0xc000b1f0
c0009571:	e8 b2 fc ff ff       	call   c0009228 <assertion_failure>
c0009576:	83 c4 10             	add    $0x10,%esp
c0009579:	8b 45 10             	mov    0x10(%ebp),%eax
c000957c:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009582:	39 45 08             	cmp    %eax,0x8(%ebp)
c0009585:	74 1c                	je     c00095a3 <sys_send_msg+0x33a>
c0009587:	68 b1 05 00 00       	push   $0x5b1
c000958c:	68 42 b1 00 c0       	push   $0xc000b142
c0009591:	68 42 b1 00 c0       	push   $0xc000b142
c0009596:	68 12 b2 00 c0       	push   $0xc000b212
c000959b:	e8 88 fc ff ff       	call   c0009228 <assertion_failure>
c00095a0:	83 c4 10             	add    $0x10,%esp
c00095a3:	83 ec 0c             	sub    $0xc,%esp
c00095a6:	ff 75 10             	pushl  0x10(%ebp)
c00095a9:	e8 c1 05 00 00       	call   c0009b6f <block>
c00095ae:	83 c4 10             	add    $0x10,%esp
c00095b1:	eb 01                	jmp    c00095b4 <sys_send_msg+0x34b>
c00095b3:	90                   	nop
c00095b4:	b8 00 00 00 00       	mov    $0x0,%eax
c00095b9:	c9                   	leave  
c00095ba:	c3                   	ret    

c00095bb <sys_receive_msg>:
c00095bb:	55                   	push   %ebp
c00095bc:	89 e5                	mov    %esp,%ebp
c00095be:	83 ec 48             	sub    $0x48,%esp
c00095c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00095c8:	83 ec 0c             	sub    $0xc,%esp
c00095cb:	ff 75 0c             	pushl  0xc(%ebp)
c00095ce:	e8 54 b4 ff ff       	call   c0004a27 <pid2proc>
c00095d3:	83 c4 10             	add    $0x10,%esp
c00095d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00095d9:	83 ec 0c             	sub    $0xc,%esp
c00095dc:	ff 75 10             	pushl  0x10(%ebp)
c00095df:	e8 b3 b4 ff ff       	call   c0004a97 <proc2pid>
c00095e4:	83 c4 10             	add    $0x10,%esp
c00095e7:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00095ea:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c00095f1:	8b 45 10             	mov    0x10(%ebp),%eax
c00095f4:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c00095fa:	85 c0                	test   %eax,%eax
c00095fc:	0f 84 c7 00 00 00    	je     c00096c9 <sys_receive_msg+0x10e>
c0009602:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0009606:	74 0d                	je     c0009615 <sys_receive_msg+0x5a>
c0009608:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c000960f:	0f 85 b4 00 00 00    	jne    c00096c9 <sys_receive_msg+0x10e>
c0009615:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c000961c:	83 ec 0c             	sub    $0xc,%esp
c000961f:	ff 75 dc             	pushl  -0x24(%ebp)
c0009622:	e8 b2 d8 ff ff       	call   c0006ed9 <sys_malloc>
c0009627:	83 c4 10             	add    $0x10,%esp
c000962a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000962d:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0009630:	83 ec 04             	sub    $0x4,%esp
c0009633:	50                   	push   %eax
c0009634:	6a 00                	push   $0x0
c0009636:	ff 75 d8             	pushl  -0x28(%ebp)
c0009639:	e8 34 1d 00 00       	call   c000b372 <Memset>
c000963e:	83 c4 10             	add    $0x10,%esp
c0009641:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009644:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c000964a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000964d:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009654:	8b 45 08             	mov    0x8(%ebp),%eax
c0009657:	83 ec 08             	sub    $0x8,%esp
c000965a:	ff 75 dc             	pushl  -0x24(%ebp)
c000965d:	50                   	push   %eax
c000965e:	e8 35 d7 ff ff       	call   c0006d98 <alloc_virtual_memory>
c0009663:	83 c4 10             	add    $0x10,%esp
c0009666:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009669:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000966c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000966f:	83 ec 04             	sub    $0x4,%esp
c0009672:	52                   	push   %edx
c0009673:	ff 75 d8             	pushl  -0x28(%ebp)
c0009676:	50                   	push   %eax
c0009677:	e8 c8 1c 00 00       	call   c000b344 <Memcpy>
c000967c:	83 c4 10             	add    $0x10,%esp
c000967f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009682:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009689:	00 00 00 
c000968c:	8b 45 10             	mov    0x10(%ebp),%eax
c000968f:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009696:	00 00 00 
c0009699:	8b 45 10             	mov    0x10(%ebp),%eax
c000969c:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c00096a3:	00 00 00 
c00096a6:	8b 45 10             	mov    0x10(%ebp),%eax
c00096a9:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00096b0:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c00096b7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00096ba:	83 ec 08             	sub    $0x8,%esp
c00096bd:	ff 75 dc             	pushl  -0x24(%ebp)
c00096c0:	50                   	push   %eax
c00096c1:	e8 f2 da ff ff       	call   c00071b8 <sys_free>
c00096c6:	83 c4 10             	add    $0x10,%esp
c00096c9:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c00096cd:	0f 84 96 03 00 00    	je     c0009a69 <sys_receive_msg+0x4ae>
c00096d3:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c00096d7:	75 26                	jne    c00096ff <sys_receive_msg+0x144>
c00096d9:	8b 45 10             	mov    0x10(%ebp),%eax
c00096dc:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00096e2:	85 c0                	test   %eax,%eax
c00096e4:	0f 84 8a 00 00 00    	je     c0009774 <sys_receive_msg+0x1b9>
c00096ea:	8b 45 10             	mov    0x10(%ebp),%eax
c00096ed:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00096f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00096f6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00096fd:	eb 75                	jmp    c0009774 <sys_receive_msg+0x1b9>
c00096ff:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009703:	78 6f                	js     c0009774 <sys_receive_msg+0x1b9>
c0009705:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
c0009709:	7f 69                	jg     c0009774 <sys_receive_msg+0x1b9>
c000970b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000970e:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009715:	3c 01                	cmp    $0x1,%al
c0009717:	75 5b                	jne    c0009774 <sys_receive_msg+0x1b9>
c0009719:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000971c:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009722:	83 f8 0e             	cmp    $0xe,%eax
c0009725:	74 0e                	je     c0009735 <sys_receive_msg+0x17a>
c0009727:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000972a:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009730:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0009733:	75 3f                	jne    c0009774 <sys_receive_msg+0x1b9>
c0009735:	8b 45 10             	mov    0x10(%ebp),%eax
c0009738:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000973e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009741:	eb 2b                	jmp    c000976e <sys_receive_msg+0x1b3>
c0009743:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009746:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009749:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000974c:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c0009752:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009755:	39 c2                	cmp    %eax,%edx
c0009757:	75 09                	jne    c0009762 <sys_receive_msg+0x1a7>
c0009759:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009760:	eb 12                	jmp    c0009774 <sys_receive_msg+0x1b9>
c0009762:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009765:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000976b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000976e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009772:	75 cf                	jne    c0009743 <sys_receive_msg+0x188>
c0009774:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0009778:	0f 85 21 02 00 00    	jne    c000999f <sys_receive_msg+0x3e4>
c000977e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009781:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0009784:	8b 45 08             	mov    0x8(%ebp),%eax
c0009787:	83 ec 08             	sub    $0x8,%esp
c000978a:	6a 6c                	push   $0x6c
c000978c:	50                   	push   %eax
c000978d:	e8 06 d6 ff ff       	call   c0006d98 <alloc_virtual_memory>
c0009792:	83 c4 10             	add    $0x10,%esp
c0009795:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009798:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000979b:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00097a1:	83 ec 08             	sub    $0x8,%esp
c00097a4:	6a 6c                	push   $0x6c
c00097a6:	50                   	push   %eax
c00097a7:	e8 ec d5 ff ff       	call   c0006d98 <alloc_virtual_memory>
c00097ac:	83 c4 10             	add    $0x10,%esp
c00097af:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00097b2:	83 ec 04             	sub    $0x4,%esp
c00097b5:	6a 6c                	push   $0x6c
c00097b7:	ff 75 c8             	pushl  -0x38(%ebp)
c00097ba:	ff 75 cc             	pushl  -0x34(%ebp)
c00097bd:	e8 82 1b 00 00       	call   c000b344 <Memcpy>
c00097c2:	83 c4 10             	add    $0x10,%esp
c00097c5:	8b 45 cc             	mov    -0x34(%ebp),%eax
c00097c8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00097cb:	8b 45 10             	mov    0x10(%ebp),%eax
c00097ce:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00097d4:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00097d7:	75 21                	jne    c00097fa <sys_receive_msg+0x23f>
c00097d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097dc:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c00097e2:	8b 45 10             	mov    0x10(%ebp),%eax
c00097e5:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c00097eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097ee:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c00097f5:	00 00 00 
c00097f8:	eb 1f                	jmp    c0009819 <sys_receive_msg+0x25e>
c00097fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097fd:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c0009803:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009806:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c000980c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000980f:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0009816:	00 00 00 
c0009819:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000981c:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c0009823:	00 00 00 
c0009826:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009829:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0009830:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009833:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c000983a:	00 00 00 
c000983d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009840:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c0009847:	00 00 00 
c000984a:	8b 45 10             	mov    0x10(%ebp),%eax
c000984d:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009854:	00 00 00 
c0009857:	8b 45 10             	mov    0x10(%ebp),%eax
c000985a:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0009861:	00 00 00 
c0009864:	83 ec 0c             	sub    $0xc,%esp
c0009867:	ff 75 d0             	pushl  -0x30(%ebp)
c000986a:	e8 3c 03 00 00       	call   c0009bab <unblock>
c000986f:	83 c4 10             	add    $0x10,%esp
c0009872:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009875:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c000987b:	85 c0                	test   %eax,%eax
c000987d:	74 1c                	je     c000989b <sys_receive_msg+0x2e0>
c000987f:	68 28 06 00 00       	push   $0x628
c0009884:	68 42 b1 00 c0       	push   $0xc000b142
c0009889:	68 42 b1 00 c0       	push   $0xc000b142
c000988e:	68 27 b2 00 c0       	push   $0xc000b227
c0009893:	e8 90 f9 ff ff       	call   c0009228 <assertion_failure>
c0009898:	83 c4 10             	add    $0x10,%esp
c000989b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000989e:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00098a5:	84 c0                	test   %al,%al
c00098a7:	74 1c                	je     c00098c5 <sys_receive_msg+0x30a>
c00098a9:	68 29 06 00 00       	push   $0x629
c00098ae:	68 42 b1 00 c0       	push   $0xc000b142
c00098b3:	68 42 b1 00 c0       	push   $0xc000b142
c00098b8:	68 3f b2 00 c0       	push   $0xc000b23f
c00098bd:	e8 66 f9 ff ff       	call   c0009228 <assertion_failure>
c00098c2:	83 c4 10             	add    $0x10,%esp
c00098c5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00098c8:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00098ce:	83 f8 1d             	cmp    $0x1d,%eax
c00098d1:	74 1c                	je     c00098ef <sys_receive_msg+0x334>
c00098d3:	68 2a 06 00 00       	push   $0x62a
c00098d8:	68 42 b1 00 c0       	push   $0xc000b142
c00098dd:	68 42 b1 00 c0       	push   $0xc000b142
c00098e2:	68 58 b2 00 c0       	push   $0xc000b258
c00098e7:	e8 3c f9 ff ff       	call   c0009228 <assertion_failure>
c00098ec:	83 c4 10             	add    $0x10,%esp
c00098ef:	8b 45 10             	mov    0x10(%ebp),%eax
c00098f2:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00098f8:	85 c0                	test   %eax,%eax
c00098fa:	74 1c                	je     c0009918 <sys_receive_msg+0x35d>
c00098fc:	68 2c 06 00 00       	push   $0x62c
c0009901:	68 42 b1 00 c0       	push   $0xc000b142
c0009906:	68 42 b1 00 c0       	push   $0xc000b142
c000990b:	68 83 b1 00 c0       	push   $0xc000b183
c0009910:	e8 13 f9 ff ff       	call   c0009228 <assertion_failure>
c0009915:	83 c4 10             	add    $0x10,%esp
c0009918:	8b 45 10             	mov    0x10(%ebp),%eax
c000991b:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009922:	84 c0                	test   %al,%al
c0009924:	74 1c                	je     c0009942 <sys_receive_msg+0x387>
c0009926:	68 2d 06 00 00       	push   $0x62d
c000992b:	68 42 b1 00 c0       	push   $0xc000b142
c0009930:	68 42 b1 00 c0       	push   $0xc000b142
c0009935:	68 98 b1 00 c0       	push   $0xc000b198
c000993a:	e8 e9 f8 ff ff       	call   c0009228 <assertion_failure>
c000993f:	83 c4 10             	add    $0x10,%esp
c0009942:	8b 45 10             	mov    0x10(%ebp),%eax
c0009945:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c000994b:	83 f8 1d             	cmp    $0x1d,%eax
c000994e:	74 1c                	je     c000996c <sys_receive_msg+0x3b1>
c0009950:	68 2e 06 00 00       	push   $0x62e
c0009955:	68 42 b1 00 c0       	push   $0xc000b142
c000995a:	68 42 b1 00 c0       	push   $0xc000b142
c000995f:	68 b0 b1 00 c0       	push   $0xc000b1b0
c0009964:	e8 bf f8 ff ff       	call   c0009228 <assertion_failure>
c0009969:	83 c4 10             	add    $0x10,%esp
c000996c:	8b 45 10             	mov    0x10(%ebp),%eax
c000996f:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009975:	83 f8 1d             	cmp    $0x1d,%eax
c0009978:	0f 84 e4 00 00 00    	je     c0009a62 <sys_receive_msg+0x4a7>
c000997e:	68 2f 06 00 00       	push   $0x62f
c0009983:	68 42 b1 00 c0       	push   $0xc000b142
c0009988:	68 42 b1 00 c0       	push   $0xc000b142
c000998d:	68 7c b2 00 c0       	push   $0xc000b27c
c0009992:	e8 91 f8 ff ff       	call   c0009228 <assertion_failure>
c0009997:	83 c4 10             	add    $0x10,%esp
c000999a:	e9 c3 00 00 00       	jmp    c0009a62 <sys_receive_msg+0x4a7>
c000999f:	8b 45 10             	mov    0x10(%ebp),%eax
c00099a2:	c6 80 44 02 00 00 02 	movb   $0x2,0x244(%eax)
c00099a9:	8b 45 10             	mov    0x10(%ebp),%eax
c00099ac:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00099b3:	3c 02                	cmp    $0x2,%al
c00099b5:	74 1c                	je     c00099d3 <sys_receive_msg+0x418>
c00099b7:	68 34 06 00 00       	push   $0x634
c00099bc:	68 42 b1 00 c0       	push   $0xc000b142
c00099c1:	68 42 b1 00 c0       	push   $0xc000b142
c00099c6:	68 9b b2 00 c0       	push   $0xc000b29b
c00099cb:	e8 58 f8 ff ff       	call   c0009228 <assertion_failure>
c00099d0:	83 c4 10             	add    $0x10,%esp
c00099d3:	8b 45 10             	mov    0x10(%ebp),%eax
c00099d6:	8b 55 08             	mov    0x8(%ebp),%edx
c00099d9:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c00099df:	8b 45 10             	mov    0x10(%ebp),%eax
c00099e2:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00099e9:	3c 02                	cmp    $0x2,%al
c00099eb:	74 1c                	je     c0009a09 <sys_receive_msg+0x44e>
c00099ed:	68 36 06 00 00       	push   $0x636
c00099f2:	68 42 b1 00 c0       	push   $0xc000b142
c00099f7:	68 42 b1 00 c0       	push   $0xc000b142
c00099fc:	68 9b b2 00 c0       	push   $0xc000b29b
c0009a01:	e8 22 f8 ff ff       	call   c0009228 <assertion_failure>
c0009a06:	83 c4 10             	add    $0x10,%esp
c0009a09:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0009a0d:	75 0f                	jne    c0009a1e <sys_receive_msg+0x463>
c0009a0f:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a12:	c7 80 50 02 00 00 0e 	movl   $0xe,0x250(%eax)
c0009a19:	00 00 00 
c0009a1c:	eb 0c                	jmp    c0009a2a <sys_receive_msg+0x46f>
c0009a1e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a21:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009a24:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009a2a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a2d:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009a34:	3c 02                	cmp    $0x2,%al
c0009a36:	74 1c                	je     c0009a54 <sys_receive_msg+0x499>
c0009a38:	68 41 06 00 00       	push   $0x641
c0009a3d:	68 42 b1 00 c0       	push   $0xc000b142
c0009a42:	68 42 b1 00 c0       	push   $0xc000b142
c0009a47:	68 9b b2 00 c0       	push   $0xc000b29b
c0009a4c:	e8 d7 f7 ff ff       	call   c0009228 <assertion_failure>
c0009a51:	83 c4 10             	add    $0x10,%esp
c0009a54:	83 ec 0c             	sub    $0xc,%esp
c0009a57:	ff 75 10             	pushl  0x10(%ebp)
c0009a5a:	e8 10 01 00 00       	call   c0009b6f <block>
c0009a5f:	83 c4 10             	add    $0x10,%esp
c0009a62:	b8 00 00 00 00       	mov    $0x0,%eax
c0009a67:	eb 02                	jmp    c0009a6b <sys_receive_msg+0x4b0>
c0009a69:	90                   	nop
c0009a6a:	90                   	nop
c0009a6b:	c9                   	leave  
c0009a6c:	c3                   	ret    

c0009a6d <disp_str_colour_debug>:
c0009a6d:	55                   	push   %ebp
c0009a6e:	89 e5                	mov    %esp,%ebp
c0009a70:	90                   	nop
c0009a71:	5d                   	pop    %ebp
c0009a72:	c3                   	ret    

c0009a73 <send_rec>:
c0009a73:	55                   	push   %ebp
c0009a74:	89 e5                	mov    %esp,%ebp
c0009a76:	83 ec 18             	sub    $0x18,%esp
c0009a79:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009a7c:	83 ec 0c             	sub    $0xc,%esp
c0009a7f:	50                   	push   %eax
c0009a80:	e8 80 d3 ff ff       	call   c0006e05 <get_physical_address>
c0009a85:	83 c4 10             	add    $0x10,%esp
c0009a88:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009a8b:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009a8f:	74 28                	je     c0009ab9 <send_rec+0x46>
c0009a91:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009a95:	74 22                	je     c0009ab9 <send_rec+0x46>
c0009a97:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009a9b:	74 1c                	je     c0009ab9 <send_rec+0x46>
c0009a9d:	68 5f 06 00 00       	push   $0x65f
c0009aa2:	68 42 b1 00 c0       	push   $0xc000b142
c0009aa7:	68 42 b1 00 c0       	push   $0xc000b142
c0009aac:	68 bc b2 00 c0       	push   $0xc000b2bc
c0009ab1:	e8 72 f7 ff ff       	call   c0009228 <assertion_failure>
c0009ab6:	83 c4 10             	add    $0x10,%esp
c0009ab9:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009abd:	75 12                	jne    c0009ad1 <send_rec+0x5e>
c0009abf:	83 ec 04             	sub    $0x4,%esp
c0009ac2:	6a 6c                	push   $0x6c
c0009ac4:	6a 00                	push   $0x0
c0009ac6:	ff 75 0c             	pushl  0xc(%ebp)
c0009ac9:	e8 a4 18 00 00       	call   c000b372 <Memset>
c0009ace:	83 c4 10             	add    $0x10,%esp
c0009ad1:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009ad5:	74 23                	je     c0009afa <send_rec+0x87>
c0009ad7:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009adb:	74 34                	je     c0009b11 <send_rec+0x9e>
c0009add:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009ae1:	75 72                	jne    c0009b55 <send_rec+0xe2>
c0009ae3:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ae6:	83 ec 08             	sub    $0x8,%esp
c0009ae9:	ff 75 10             	pushl  0x10(%ebp)
c0009aec:	50                   	push   %eax
c0009aed:	e8 26 8d ff ff       	call   c0002818 <send_msg>
c0009af2:	83 c4 10             	add    $0x10,%esp
c0009af5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009af8:	eb 6e                	jmp    c0009b68 <send_rec+0xf5>
c0009afa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009afd:	83 ec 08             	sub    $0x8,%esp
c0009b00:	ff 75 10             	pushl  0x10(%ebp)
c0009b03:	50                   	push   %eax
c0009b04:	e8 35 8d ff ff       	call   c000283e <receive_msg>
c0009b09:	83 c4 10             	add    $0x10,%esp
c0009b0c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b0f:	eb 57                	jmp    c0009b68 <send_rec+0xf5>
c0009b11:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b14:	83 ec 08             	sub    $0x8,%esp
c0009b17:	ff 75 10             	pushl  0x10(%ebp)
c0009b1a:	50                   	push   %eax
c0009b1b:	e8 f8 8c ff ff       	call   c0002818 <send_msg>
c0009b20:	83 c4 10             	add    $0x10,%esp
c0009b23:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b26:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009b2a:	75 3b                	jne    c0009b67 <send_rec+0xf4>
c0009b2c:	83 ec 04             	sub    $0x4,%esp
c0009b2f:	6a 6c                	push   $0x6c
c0009b31:	6a 00                	push   $0x0
c0009b33:	ff 75 0c             	pushl  0xc(%ebp)
c0009b36:	e8 37 18 00 00       	call   c000b372 <Memset>
c0009b3b:	83 c4 10             	add    $0x10,%esp
c0009b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b41:	83 ec 08             	sub    $0x8,%esp
c0009b44:	ff 75 10             	pushl  0x10(%ebp)
c0009b47:	50                   	push   %eax
c0009b48:	e8 f1 8c ff ff       	call   c000283e <receive_msg>
c0009b4d:	83 c4 10             	add    $0x10,%esp
c0009b50:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b53:	eb 12                	jmp    c0009b67 <send_rec+0xf4>
c0009b55:	83 ec 0c             	sub    $0xc,%esp
c0009b58:	68 f8 b2 00 c0       	push   $0xc000b2f8
c0009b5d:	e8 a8 f6 ff ff       	call   c000920a <panic>
c0009b62:	83 c4 10             	add    $0x10,%esp
c0009b65:	eb 01                	jmp    c0009b68 <send_rec+0xf5>
c0009b67:	90                   	nop
c0009b68:	b8 00 00 00 00       	mov    $0x0,%eax
c0009b6d:	c9                   	leave  
c0009b6e:	c3                   	ret    

c0009b6f <block>:
c0009b6f:	55                   	push   %ebp
c0009b70:	89 e5                	mov    %esp,%ebp
c0009b72:	83 ec 08             	sub    $0x8,%esp
c0009b75:	8b 45 08             	mov    0x8(%ebp),%eax
c0009b78:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009b7f:	84 c0                	test   %al,%al
c0009b81:	75 1c                	jne    c0009b9f <block+0x30>
c0009b83:	68 8e 06 00 00       	push   $0x68e
c0009b88:	68 42 b1 00 c0       	push   $0xc000b142
c0009b8d:	68 42 b1 00 c0       	push   $0xc000b142
c0009b92:	68 0d b3 00 c0       	push   $0xc000b30d
c0009b97:	e8 8c f6 ff ff       	call   c0009228 <assertion_failure>
c0009b9c:	83 c4 10             	add    $0x10,%esp
c0009b9f:	e8 30 ad ff ff       	call   c00048d4 <schedule_process>
c0009ba4:	b8 00 00 00 00       	mov    $0x0,%eax
c0009ba9:	c9                   	leave  
c0009baa:	c3                   	ret    

c0009bab <unblock>:
c0009bab:	55                   	push   %ebp
c0009bac:	89 e5                	mov    %esp,%ebp
c0009bae:	83 ec 08             	sub    $0x8,%esp
c0009bb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0009bb4:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009bbb:	84 c0                	test   %al,%al
c0009bbd:	74 1c                	je     c0009bdb <unblock+0x30>
c0009bbf:	68 97 06 00 00       	push   $0x697
c0009bc4:	68 42 b1 00 c0       	push   $0xc000b142
c0009bc9:	68 42 b1 00 c0       	push   $0xc000b142
c0009bce:	68 25 b3 00 c0       	push   $0xc000b325
c0009bd3:	e8 50 f6 ff ff       	call   c0009228 <assertion_failure>
c0009bd8:	83 c4 10             	add    $0x10,%esp
c0009bdb:	8b 45 08             	mov    0x8(%ebp),%eax
c0009bde:	05 fc 00 00 00       	add    $0xfc,%eax
c0009be3:	83 ec 08             	sub    $0x8,%esp
c0009be6:	50                   	push   %eax
c0009be7:	68 8c fd 00 c0       	push   $0xc000fd8c
c0009bec:	e8 38 09 00 00       	call   c000a529 <insertToDoubleLinkList>
c0009bf1:	83 c4 10             	add    $0x10,%esp
c0009bf4:	b8 00 00 00 00       	mov    $0x0,%eax
c0009bf9:	c9                   	leave  
c0009bfa:	c3                   	ret    

c0009bfb <get_ticks_ipc>:
c0009bfb:	55                   	push   %ebp
c0009bfc:	89 e5                	mov    %esp,%ebp
c0009bfe:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0009c04:	83 ec 04             	sub    $0x4,%esp
c0009c07:	6a 6c                	push   $0x6c
c0009c09:	6a 00                	push   $0x0
c0009c0b:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009c0e:	50                   	push   %eax
c0009c0f:	e8 5e 17 00 00       	call   c000b372 <Memset>
c0009c14:	83 c4 10             	add    $0x10,%esp
c0009c17:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c0009c1e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009c25:	83 ec 04             	sub    $0x4,%esp
c0009c28:	6a 01                	push   $0x1
c0009c2a:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009c2d:	50                   	push   %eax
c0009c2e:	6a 03                	push   $0x3
c0009c30:	e8 3e fe ff ff       	call   c0009a73 <send_rec>
c0009c35:	83 c4 10             	add    $0x10,%esp
c0009c38:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009c3b:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0009c3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009c44:	c9                   	leave  
c0009c45:	c3                   	ret    

c0009c46 <itoa>:
c0009c46:	55                   	push   %ebp
c0009c47:	89 e5                	mov    %esp,%ebp
c0009c49:	53                   	push   %ebx
c0009c4a:	83 ec 14             	sub    $0x14,%esp
c0009c4d:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c50:	99                   	cltd   
c0009c51:	f7 7d 10             	idivl  0x10(%ebp)
c0009c54:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009c57:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c5a:	99                   	cltd   
c0009c5b:	f7 7d 10             	idivl  0x10(%ebp)
c0009c5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009c61:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009c65:	74 14                	je     c0009c7b <itoa+0x35>
c0009c67:	83 ec 04             	sub    $0x4,%esp
c0009c6a:	ff 75 10             	pushl  0x10(%ebp)
c0009c6d:	ff 75 0c             	pushl  0xc(%ebp)
c0009c70:	ff 75 f0             	pushl  -0x10(%ebp)
c0009c73:	e8 ce ff ff ff       	call   c0009c46 <itoa>
c0009c78:	83 c4 10             	add    $0x10,%esp
c0009c7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009c7e:	8d 58 30             	lea    0x30(%eax),%ebx
c0009c81:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009c84:	8b 00                	mov    (%eax),%eax
c0009c86:	8d 48 01             	lea    0x1(%eax),%ecx
c0009c89:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009c8c:	89 0a                	mov    %ecx,(%edx)
c0009c8e:	89 da                	mov    %ebx,%edx
c0009c90:	88 10                	mov    %dl,(%eax)
c0009c92:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009c95:	8b 00                	mov    (%eax),%eax
c0009c97:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009c9a:	c9                   	leave  
c0009c9b:	c3                   	ret    

c0009c9c <i2a>:
c0009c9c:	55                   	push   %ebp
c0009c9d:	89 e5                	mov    %esp,%ebp
c0009c9f:	53                   	push   %ebx
c0009ca0:	83 ec 14             	sub    $0x14,%esp
c0009ca3:	8b 45 08             	mov    0x8(%ebp),%eax
c0009ca6:	99                   	cltd   
c0009ca7:	f7 7d 0c             	idivl  0xc(%ebp)
c0009caa:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009cad:	8b 45 08             	mov    0x8(%ebp),%eax
c0009cb0:	99                   	cltd   
c0009cb1:	f7 7d 0c             	idivl  0xc(%ebp)
c0009cb4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009cb7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009cbb:	74 14                	je     c0009cd1 <i2a+0x35>
c0009cbd:	83 ec 04             	sub    $0x4,%esp
c0009cc0:	ff 75 10             	pushl  0x10(%ebp)
c0009cc3:	ff 75 0c             	pushl  0xc(%ebp)
c0009cc6:	ff 75 f0             	pushl  -0x10(%ebp)
c0009cc9:	e8 ce ff ff ff       	call   c0009c9c <i2a>
c0009cce:	83 c4 10             	add    $0x10,%esp
c0009cd1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009cd5:	7f 0a                	jg     c0009ce1 <i2a+0x45>
c0009cd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009cda:	83 c0 30             	add    $0x30,%eax
c0009cdd:	89 c3                	mov    %eax,%ebx
c0009cdf:	eb 08                	jmp    c0009ce9 <i2a+0x4d>
c0009ce1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ce4:	83 c0 37             	add    $0x37,%eax
c0009ce7:	89 c3                	mov    %eax,%ebx
c0009ce9:	8b 45 10             	mov    0x10(%ebp),%eax
c0009cec:	8b 00                	mov    (%eax),%eax
c0009cee:	8d 48 01             	lea    0x1(%eax),%ecx
c0009cf1:	8b 55 10             	mov    0x10(%ebp),%edx
c0009cf4:	89 0a                	mov    %ecx,(%edx)
c0009cf6:	88 18                	mov    %bl,(%eax)
c0009cf8:	8b 45 10             	mov    0x10(%ebp),%eax
c0009cfb:	8b 00                	mov    (%eax),%eax
c0009cfd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009d00:	c9                   	leave  
c0009d01:	c3                   	ret    

c0009d02 <inform_int>:
c0009d02:	55                   	push   %ebp
c0009d03:	89 e5                	mov    %esp,%ebp
c0009d05:	83 ec 18             	sub    $0x18,%esp
c0009d08:	83 ec 0c             	sub    $0xc,%esp
c0009d0b:	ff 75 08             	pushl  0x8(%ebp)
c0009d0e:	e8 14 ad ff ff       	call   c0004a27 <pid2proc>
c0009d13:	83 c4 10             	add    $0x10,%esp
c0009d16:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009d19:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d1c:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009d23:	0f be c0             	movsbl %al,%eax
c0009d26:	83 e0 02             	and    $0x2,%eax
c0009d29:	85 c0                	test   %eax,%eax
c0009d2b:	0f 84 8e 00 00 00    	je     c0009dbf <inform_int+0xbd>
c0009d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d34:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d3a:	3d 13 02 00 00       	cmp    $0x213,%eax
c0009d3f:	74 0e                	je     c0009d4f <inform_int+0x4d>
c0009d41:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d44:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009d4a:	83 f8 0e             	cmp    $0xe,%eax
c0009d4d:	75 7d                	jne    c0009dcc <inform_int+0xca>
c0009d4f:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c0009d56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d59:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009d5f:	83 ec 08             	sub    $0x8,%esp
c0009d62:	ff 75 f0             	pushl  -0x10(%ebp)
c0009d65:	50                   	push   %eax
c0009d66:	e8 2d d0 ff ff       	call   c0006d98 <alloc_virtual_memory>
c0009d6b:	83 c4 10             	add    $0x10,%esp
c0009d6e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009d71:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d74:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009d7a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009d7d:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009d84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d87:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009d8e:	00 00 00 
c0009d91:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d94:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009d9b:	00 00 00 
c0009d9e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009da5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009da8:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0009daf:	83 ec 0c             	sub    $0xc,%esp
c0009db2:	ff 75 f4             	pushl  -0xc(%ebp)
c0009db5:	e8 f1 fd ff ff       	call   c0009bab <unblock>
c0009dba:	83 c4 10             	add    $0x10,%esp
c0009dbd:	eb 0d                	jmp    c0009dcc <inform_int+0xca>
c0009dbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009dc2:	c7 80 5c 02 00 00 01 	movl   $0x1,0x25c(%eax)
c0009dc9:	00 00 00 
c0009dcc:	90                   	nop
c0009dcd:	c9                   	leave  
c0009dce:	c3                   	ret    

c0009dcf <strcmp>:
c0009dcf:	55                   	push   %ebp
c0009dd0:	89 e5                	mov    %esp,%ebp
c0009dd2:	83 ec 10             	sub    $0x10,%esp
c0009dd5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0009dd9:	74 06                	je     c0009de1 <strcmp+0x12>
c0009ddb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009ddf:	75 08                	jne    c0009de9 <strcmp+0x1a>
c0009de1:	8b 45 08             	mov    0x8(%ebp),%eax
c0009de4:	2b 45 0c             	sub    0xc(%ebp),%eax
c0009de7:	eb 53                	jmp    c0009e3c <strcmp+0x6d>
c0009de9:	8b 45 08             	mov    0x8(%ebp),%eax
c0009dec:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009def:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009df2:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009df5:	eb 18                	jmp    c0009e0f <strcmp+0x40>
c0009df7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009dfa:	0f b6 10             	movzbl (%eax),%edx
c0009dfd:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009e00:	0f b6 00             	movzbl (%eax),%eax
c0009e03:	38 c2                	cmp    %al,%dl
c0009e05:	75 1e                	jne    c0009e25 <strcmp+0x56>
c0009e07:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009e0b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009e0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009e12:	0f b6 00             	movzbl (%eax),%eax
c0009e15:	84 c0                	test   %al,%al
c0009e17:	74 0d                	je     c0009e26 <strcmp+0x57>
c0009e19:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009e1c:	0f b6 00             	movzbl (%eax),%eax
c0009e1f:	84 c0                	test   %al,%al
c0009e21:	75 d4                	jne    c0009df7 <strcmp+0x28>
c0009e23:	eb 01                	jmp    c0009e26 <strcmp+0x57>
c0009e25:	90                   	nop
c0009e26:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009e29:	0f b6 00             	movzbl (%eax),%eax
c0009e2c:	0f be d0             	movsbl %al,%edx
c0009e2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009e32:	0f b6 00             	movzbl (%eax),%eax
c0009e35:	0f be c0             	movsbl %al,%eax
c0009e38:	29 c2                	sub    %eax,%edx
c0009e3a:	89 d0                	mov    %edx,%eax
c0009e3c:	c9                   	leave  
c0009e3d:	c3                   	ret    

c0009e3e <create_user_process_address_space>:
c0009e3e:	55                   	push   %ebp
c0009e3f:	89 e5                	mov    %esp,%ebp
c0009e41:	83 ec 18             	sub    $0x18,%esp
c0009e44:	83 ec 08             	sub    $0x8,%esp
c0009e47:	6a 00                	push   $0x0
c0009e49:	6a 01                	push   $0x1
c0009e4b:	e8 e7 cf ff ff       	call   c0006e37 <alloc_memory>
c0009e50:	83 c4 10             	add    $0x10,%esp
c0009e53:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009e56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e59:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0009e60:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0009e67:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009e6a:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009e6f:	c1 e8 0c             	shr    $0xc,%eax
c0009e72:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009e75:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009e78:	83 c0 07             	add    $0x7,%eax
c0009e7b:	c1 e8 03             	shr    $0x3,%eax
c0009e7e:	89 c2                	mov    %eax,%edx
c0009e80:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e83:	89 50 04             	mov    %edx,0x4(%eax)
c0009e86:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e89:	8b 40 04             	mov    0x4(%eax),%eax
c0009e8c:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009e91:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009e97:	85 c0                	test   %eax,%eax
c0009e99:	0f 48 c2             	cmovs  %edx,%eax
c0009e9c:	c1 f8 0c             	sar    $0xc,%eax
c0009e9f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009ea2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009ea5:	83 ec 08             	sub    $0x8,%esp
c0009ea8:	6a 00                	push   $0x0
c0009eaa:	50                   	push   %eax
c0009eab:	e8 87 cf ff ff       	call   c0006e37 <alloc_memory>
c0009eb0:	83 c4 10             	add    $0x10,%esp
c0009eb3:	89 c2                	mov    %eax,%edx
c0009eb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009eb8:	89 10                	mov    %edx,(%eax)
c0009eba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ebd:	83 ec 0c             	sub    $0xc,%esp
c0009ec0:	50                   	push   %eax
c0009ec1:	e8 6f ca ff ff       	call   c0006935 <init_bitmap>
c0009ec6:	83 c4 10             	add    $0x10,%esp
c0009ec9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ecc:	c9                   	leave  
c0009ecd:	c3                   	ret    

c0009ece <user_process>:
c0009ece:	55                   	push   %ebp
c0009ecf:	89 e5                	mov    %esp,%ebp
c0009ed1:	83 ec 28             	sub    $0x28,%esp
c0009ed4:	e8 bb 79 ff ff       	call   c0001894 <get_running_thread_pcb>
c0009ed9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009edc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009edf:	05 00 10 00 00       	add    $0x1000,%eax
c0009ee4:	89 c2                	mov    %eax,%edx
c0009ee6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ee9:	89 10                	mov    %edx,(%eax)
c0009eeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009eee:	8b 00                	mov    (%eax),%eax
c0009ef0:	8d 90 f0 fe ff ff    	lea    -0x110(%eax),%edx
c0009ef6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ef9:	89 10                	mov    %edx,(%eax)
c0009efb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009efe:	8b 00                	mov    (%eax),%eax
c0009f00:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009f03:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
c0009f07:	66 c7 45 ec 02 12    	movw   $0x1202,-0x14(%ebp)
c0009f0d:	66 c7 45 ea 48 00    	movw   $0x48,-0x16(%ebp)
c0009f13:	66 c7 45 e8 50 00    	movw   $0x50,-0x18(%ebp)
c0009f19:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009f1d:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
c0009f21:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009f25:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
c0009f29:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009f2d:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
c0009f31:	66 c7 45 e0 38 00    	movw   $0x38,-0x20(%ebp)
c0009f37:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c0009f3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f3e:	89 50 34             	mov    %edx,0x34(%eax)
c0009f41:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009f45:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f48:	89 50 0c             	mov    %edx,0xc(%eax)
c0009f4b:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009f4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f52:	89 50 04             	mov    %edx,0x4(%eax)
c0009f55:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009f59:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f5c:	89 50 08             	mov    %edx,0x8(%eax)
c0009f5f:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009f63:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f66:	89 50 40             	mov    %edx,0x40(%eax)
c0009f69:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
c0009f6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f70:	89 10                	mov    %edx,(%eax)
c0009f72:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f75:	8b 55 08             	mov    0x8(%ebp),%edx
c0009f78:	89 50 30             	mov    %edx,0x30(%eax)
c0009f7b:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
c0009f7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f82:	89 50 38             	mov    %edx,0x38(%eax)
c0009f85:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009f88:	83 ec 0c             	sub    $0xc,%esp
c0009f8b:	50                   	push   %eax
c0009f8c:	e8 d8 77 ff ff       	call   c0001769 <restart>
c0009f91:	83 c4 10             	add    $0x10,%esp
c0009f94:	90                   	nop
c0009f95:	c9                   	leave  
c0009f96:	c3                   	ret    

c0009f97 <clone_pcb>:
c0009f97:	55                   	push   %ebp
c0009f98:	89 e5                	mov    %esp,%ebp
c0009f9a:	83 ec 18             	sub    $0x18,%esp
c0009f9d:	83 ec 08             	sub    $0x8,%esp
c0009fa0:	6a 00                	push   $0x0
c0009fa2:	6a 01                	push   $0x1
c0009fa4:	e8 8e ce ff ff       	call   c0006e37 <alloc_memory>
c0009fa9:	83 c4 10             	add    $0x10,%esp
c0009fac:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009faf:	83 ec 04             	sub    $0x4,%esp
c0009fb2:	68 ac 02 00 00       	push   $0x2ac
c0009fb7:	ff 75 08             	pushl  0x8(%ebp)
c0009fba:	ff 75 f4             	pushl  -0xc(%ebp)
c0009fbd:	e8 82 13 00 00       	call   c000b344 <Memcpy>
c0009fc2:	83 c4 10             	add    $0x10,%esp
c0009fc5:	a1 30 f7 00 c0       	mov    0xc000f730,%eax
c0009fca:	83 c0 01             	add    $0x1,%eax
c0009fcd:	a3 30 f7 00 c0       	mov    %eax,0xc000f730
c0009fd2:	8b 15 30 f7 00 c0    	mov    0xc000f730,%edx
c0009fd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fdb:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c0009fe1:	8b 45 08             	mov    0x8(%ebp),%eax
c0009fe4:	8b 90 60 02 00 00    	mov    0x260(%eax),%edx
c0009fea:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009fed:	89 90 60 02 00 00    	mov    %edx,0x260(%eax)
c0009ff3:	83 ec 08             	sub    $0x8,%esp
c0009ff6:	6a 00                	push   $0x0
c0009ff8:	6a 01                	push   $0x1
c0009ffa:	e8 38 ce ff ff       	call   c0006e37 <alloc_memory>
c0009fff:	83 c4 10             	add    $0x10,%esp
c000a002:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a005:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a008:	05 00 0c 00 00       	add    $0xc00,%eax
c000a00d:	83 ec 04             	sub    $0x4,%esp
c000a010:	68 00 04 00 00       	push   $0x400
c000a015:	68 00 fc ff ff       	push   $0xfffffc00
c000a01a:	50                   	push   %eax
c000a01b:	e8 24 13 00 00       	call   c000b344 <Memcpy>
c000a020:	83 c4 10             	add    $0x10,%esp
c000a023:	83 ec 0c             	sub    $0xc,%esp
c000a026:	ff 75 f0             	pushl  -0x10(%ebp)
c000a029:	e8 d7 cd ff ff       	call   c0006e05 <get_physical_address>
c000a02e:	83 c4 10             	add    $0x10,%esp
c000a031:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a034:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a037:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a03c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a03f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a042:	83 c8 07             	or     $0x7,%eax
c000a045:	89 c2                	mov    %eax,%edx
c000a047:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a04a:	89 10                	mov    %edx,(%eax)
c000a04c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a04f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a052:	89 50 04             	mov    %edx,0x4(%eax)
c000a055:	e8 e4 fd ff ff       	call   c0009e3e <create_user_process_address_space>
c000a05a:	89 c2                	mov    %eax,%edx
c000a05c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a05f:	89 50 08             	mov    %edx,0x8(%eax)
c000a062:	8b 45 08             	mov    0x8(%ebp),%eax
c000a065:	8b 40 08             	mov    0x8(%eax),%eax
c000a068:	89 c2                	mov    %eax,%edx
c000a06a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a06d:	8b 40 08             	mov    0x8(%eax),%eax
c000a070:	83 ec 04             	sub    $0x4,%esp
c000a073:	6a 0c                	push   $0xc
c000a075:	52                   	push   %edx
c000a076:	50                   	push   %eax
c000a077:	e8 c8 12 00 00       	call   c000b344 <Memcpy>
c000a07c:	83 c4 10             	add    $0x10,%esp
c000a07f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a082:	c9                   	leave  
c000a083:	c3                   	ret    

c000a084 <build_body_stack>:
c000a084:	55                   	push   %ebp
c000a085:	89 e5                	mov    %esp,%ebp
c000a087:	83 ec 38             	sub    $0x38,%esp
c000a08a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a08d:	8b 40 08             	mov    0x8(%eax),%eax
c000a090:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a093:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a096:	8b 50 04             	mov    0x4(%eax),%edx
c000a099:	8b 00                	mov    (%eax),%eax
c000a09b:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a09e:	89 55 cc             	mov    %edx,-0x34(%ebp)
c000a0a1:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a0a4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a0a7:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a0aa:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a0ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a0b0:	8b 40 08             	mov    0x8(%eax),%eax
c000a0b3:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a0b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a0bd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a0c4:	e8 ef 76 ff ff       	call   c00017b8 <disable_int>
c000a0c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a0d0:	e9 dd 00 00 00       	jmp    c000a1b2 <build_body_stack+0x12e>
c000a0d5:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a0d8:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a0db:	01 d0                	add    %edx,%eax
c000a0dd:	0f b6 00             	movzbl (%eax),%eax
c000a0e0:	88 45 d7             	mov    %al,-0x29(%ebp)
c000a0e3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a0ea:	e9 b5 00 00 00       	jmp    c000a1a4 <build_body_stack+0x120>
c000a0ef:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c000a0f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a0f6:	89 c1                	mov    %eax,%ecx
c000a0f8:	d3 fa                	sar    %cl,%edx
c000a0fa:	89 d0                	mov    %edx,%eax
c000a0fc:	83 e0 01             	and    $0x1,%eax
c000a0ff:	85 c0                	test   %eax,%eax
c000a101:	75 09                	jne    c000a10c <build_body_stack+0x88>
c000a103:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a107:	e9 94 00 00 00       	jmp    c000a1a0 <build_body_stack+0x11c>
c000a10c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a10f:	8b 40 04             	mov    0x4(%eax),%eax
c000a112:	83 ec 0c             	sub    $0xc,%esp
c000a115:	50                   	push   %eax
c000a116:	e8 5d 77 ff ff       	call   c0001878 <update_cr3>
c000a11b:	83 c4 10             	add    $0x10,%esp
c000a11e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a121:	c1 e0 0c             	shl    $0xc,%eax
c000a124:	89 c2                	mov    %eax,%edx
c000a126:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a129:	01 d0                	add    %edx,%eax
c000a12b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a12e:	81 7d d0 00 60 05 08 	cmpl   $0x8056000,-0x30(%ebp)
c000a135:	75 0f                	jne    c000a146 <build_body_stack+0xc2>
c000a137:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a13a:	83 ec 0c             	sub    $0xc,%esp
c000a13d:	50                   	push   %eax
c000a13e:	e8 0f d9 ff ff       	call   c0007a52 <disp_int>
c000a143:	83 c4 10             	add    $0x10,%esp
c000a146:	8b 55 d0             	mov    -0x30(%ebp),%edx
c000a149:	8b 45 10             	mov    0x10(%ebp),%eax
c000a14c:	83 ec 04             	sub    $0x4,%esp
c000a14f:	68 00 10 00 00       	push   $0x1000
c000a154:	52                   	push   %edx
c000a155:	50                   	push   %eax
c000a156:	e8 e9 11 00 00       	call   c000b344 <Memcpy>
c000a15b:	83 c4 10             	add    $0x10,%esp
c000a15e:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a161:	8b 40 04             	mov    0x4(%eax),%eax
c000a164:	83 ec 0c             	sub    $0xc,%esp
c000a167:	50                   	push   %eax
c000a168:	e8 0b 77 ff ff       	call   c0001878 <update_cr3>
c000a16d:	83 c4 10             	add    $0x10,%esp
c000a170:	83 ec 08             	sub    $0x8,%esp
c000a173:	ff 75 d0             	pushl  -0x30(%ebp)
c000a176:	6a 01                	push   $0x1
c000a178:	e8 1c cd ff ff       	call   c0006e99 <get_a_virtual_page>
c000a17d:	83 c4 10             	add    $0x10,%esp
c000a180:	8b 55 10             	mov    0x10(%ebp),%edx
c000a183:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a186:	83 ec 04             	sub    $0x4,%esp
c000a189:	68 00 10 00 00       	push   $0x1000
c000a18e:	52                   	push   %edx
c000a18f:	50                   	push   %eax
c000a190:	e8 af 11 00 00       	call   c000b344 <Memcpy>
c000a195:	83 c4 10             	add    $0x10,%esp
c000a198:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a19c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a1a0:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a1a4:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a1a8:	0f 8e 41 ff ff ff    	jle    c000a0ef <build_body_stack+0x6b>
c000a1ae:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a1b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a1b5:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a1b8:	0f 87 17 ff ff ff    	ja     c000a0d5 <build_body_stack+0x51>
c000a1be:	83 ec 0c             	sub    $0xc,%esp
c000a1c1:	68 3d b3 00 c0       	push   $0xc000b33d
c000a1c6:	e8 c1 73 ff ff       	call   c000158c <disp_str>
c000a1cb:	83 c4 10             	add    $0x10,%esp
c000a1ce:	83 ec 0c             	sub    $0xc,%esp
c000a1d1:	ff 75 f0             	pushl  -0x10(%ebp)
c000a1d4:	e8 79 d8 ff ff       	call   c0007a52 <disp_int>
c000a1d9:	83 c4 10             	add    $0x10,%esp
c000a1dc:	83 ec 0c             	sub    $0xc,%esp
c000a1df:	68 42 b3 00 c0       	push   $0xc000b342
c000a1e4:	e8 a3 73 ff ff       	call   c000158c <disp_str>
c000a1e9:	83 c4 10             	add    $0x10,%esp
c000a1ec:	e8 c9 75 ff ff       	call   c00017ba <enable_int>
c000a1f1:	90                   	nop
c000a1f2:	c9                   	leave  
c000a1f3:	c3                   	ret    

c000a1f4 <build_process_kernel_stack>:
c000a1f4:	55                   	push   %ebp
c000a1f5:	89 e5                	mov    %esp,%ebp
c000a1f7:	83 ec 20             	sub    $0x20,%esp
c000a1fa:	8b 45 08             	mov    0x8(%ebp),%eax
c000a1fd:	05 bc 0f 00 00       	add    $0xfbc,%eax
c000a202:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a205:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a208:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a20b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a20e:	83 e8 04             	sub    $0x4,%eax
c000a211:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a214:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a217:	83 e8 08             	sub    $0x8,%eax
c000a21a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a21d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a220:	83 e8 0c             	sub    $0xc,%eax
c000a223:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a226:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a229:	83 e8 10             	sub    $0x10,%eax
c000a22c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a22f:	ba 61 17 00 c0       	mov    $0xc0001761,%edx
c000a234:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a237:	89 10                	mov    %edx,(%eax)
c000a239:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a23c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a242:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a245:	8b 10                	mov    (%eax),%edx
c000a247:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a24a:	89 10                	mov    %edx,(%eax)
c000a24c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a24f:	8b 10                	mov    (%eax),%edx
c000a251:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a254:	89 10                	mov    %edx,(%eax)
c000a256:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a259:	8b 10                	mov    (%eax),%edx
c000a25b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a25e:	89 10                	mov    %edx,(%eax)
c000a260:	8b 45 08             	mov    0x8(%ebp),%eax
c000a263:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000a266:	89 10                	mov    %edx,(%eax)
c000a268:	90                   	nop
c000a269:	c9                   	leave  
c000a26a:	c3                   	ret    

c000a26b <fork_process>:
c000a26b:	55                   	push   %ebp
c000a26c:	89 e5                	mov    %esp,%ebp
c000a26e:	83 ec 18             	sub    $0x18,%esp
c000a271:	8b 45 08             	mov    0x8(%ebp),%eax
c000a274:	83 ec 0c             	sub    $0xc,%esp
c000a277:	50                   	push   %eax
c000a278:	e8 aa a7 ff ff       	call   c0004a27 <pid2proc>
c000a27d:	83 c4 10             	add    $0x10,%esp
c000a280:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a283:	83 ec 0c             	sub    $0xc,%esp
c000a286:	ff 75 f4             	pushl  -0xc(%ebp)
c000a289:	e8 09 fd ff ff       	call   c0009f97 <clone_pcb>
c000a28e:	83 c4 10             	add    $0x10,%esp
c000a291:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a294:	83 ec 08             	sub    $0x8,%esp
c000a297:	6a 00                	push   $0x0
c000a299:	6a 01                	push   $0x1
c000a29b:	e8 97 cb ff ff       	call   c0006e37 <alloc_memory>
c000a2a0:	83 c4 10             	add    $0x10,%esp
c000a2a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a2a6:	83 ec 04             	sub    $0x4,%esp
c000a2a9:	ff 75 ec             	pushl  -0x14(%ebp)
c000a2ac:	ff 75 f0             	pushl  -0x10(%ebp)
c000a2af:	ff 75 f4             	pushl  -0xc(%ebp)
c000a2b2:	e8 cd fd ff ff       	call   c000a084 <build_body_stack>
c000a2b7:	83 c4 10             	add    $0x10,%esp
c000a2ba:	83 ec 0c             	sub    $0xc,%esp
c000a2bd:	ff 75 f0             	pushl  -0x10(%ebp)
c000a2c0:	e8 2f ff ff ff       	call   c000a1f4 <build_process_kernel_stack>
c000a2c5:	83 c4 10             	add    $0x10,%esp
c000a2c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2cb:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000a2d2:	84 c0                	test   %al,%al
c000a2d4:	75 31                	jne    c000a307 <fork_process+0x9c>
c000a2d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2d9:	05 fc 00 00 00       	add    $0xfc,%eax
c000a2de:	83 ec 04             	sub    $0x4,%esp
c000a2e1:	6a 08                	push   $0x8
c000a2e3:	6a 00                	push   $0x0
c000a2e5:	50                   	push   %eax
c000a2e6:	e8 87 10 00 00       	call   c000b372 <Memset>
c000a2eb:	83 c4 10             	add    $0x10,%esp
c000a2ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2f1:	05 fc 00 00 00       	add    $0xfc,%eax
c000a2f6:	83 ec 08             	sub    $0x8,%esp
c000a2f9:	50                   	push   %eax
c000a2fa:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a2ff:	e8 e0 01 00 00       	call   c000a4e4 <appendToDoubleLinkList>
c000a304:	83 c4 10             	add    $0x10,%esp
c000a307:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a30a:	05 04 01 00 00       	add    $0x104,%eax
c000a30f:	83 ec 04             	sub    $0x4,%esp
c000a312:	6a 08                	push   $0x8
c000a314:	6a 00                	push   $0x0
c000a316:	50                   	push   %eax
c000a317:	e8 56 10 00 00       	call   c000b372 <Memset>
c000a31c:	83 c4 10             	add    $0x10,%esp
c000a31f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a322:	05 04 01 00 00       	add    $0x104,%eax
c000a327:	83 ec 08             	sub    $0x8,%esp
c000a32a:	50                   	push   %eax
c000a32b:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a330:	e8 af 01 00 00       	call   c000a4e4 <appendToDoubleLinkList>
c000a335:	83 c4 10             	add    $0x10,%esp
c000a338:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a33b:	c9                   	leave  
c000a33c:	c3                   	ret    

c000a33d <process_execute>:
c000a33d:	55                   	push   %ebp
c000a33e:	89 e5                	mov    %esp,%ebp
c000a340:	83 ec 28             	sub    $0x28,%esp
c000a343:	e8 8f 02 00 00       	call   c000a5d7 <thread_init>
c000a348:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a34b:	83 ec 0c             	sub    $0xc,%esp
c000a34e:	ff 75 f4             	pushl  -0xc(%ebp)
c000a351:	e8 e8 02 00 00       	call   c000a63e <thread_create>
c000a356:	83 c4 10             	add    $0x10,%esp
c000a359:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a35c:	05 30 01 00 00       	add    $0x130,%eax
c000a361:	83 ec 08             	sub    $0x8,%esp
c000a364:	ff 75 10             	pushl  0x10(%ebp)
c000a367:	50                   	push   %eax
c000a368:	e8 24 10 00 00       	call   c000b391 <Strcpy>
c000a36d:	83 c4 10             	add    $0x10,%esp
c000a370:	83 ec 08             	sub    $0x8,%esp
c000a373:	6a 00                	push   $0x0
c000a375:	6a 01                	push   $0x1
c000a377:	e8 bb ca ff ff       	call   c0006e37 <alloc_memory>
c000a37c:	83 c4 10             	add    $0x10,%esp
c000a37f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a382:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a385:	05 00 0c 00 00       	add    $0xc00,%eax
c000a38a:	83 ec 04             	sub    $0x4,%esp
c000a38d:	68 00 04 00 00       	push   $0x400
c000a392:	68 00 fc ff ff       	push   $0xfffffc00
c000a397:	50                   	push   %eax
c000a398:	e8 a7 0f 00 00       	call   c000b344 <Memcpy>
c000a39d:	83 c4 10             	add    $0x10,%esp
c000a3a0:	83 ec 0c             	sub    $0xc,%esp
c000a3a3:	ff 75 f0             	pushl  -0x10(%ebp)
c000a3a6:	e8 5a ca ff ff       	call   c0006e05 <get_physical_address>
c000a3ab:	83 c4 10             	add    $0x10,%esp
c000a3ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a3b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a3b4:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a3b9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a3bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a3bf:	83 c8 07             	or     $0x7,%eax
c000a3c2:	89 c2                	mov    %eax,%edx
c000a3c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a3c7:	89 10                	mov    %edx,(%eax)
c000a3c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3cc:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a3cf:	89 50 04             	mov    %edx,0x4(%eax)
c000a3d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3d5:	83 c0 0c             	add    $0xc,%eax
c000a3d8:	83 ec 0c             	sub    $0xc,%esp
c000a3db:	50                   	push   %eax
c000a3dc:	e8 47 cf ff ff       	call   c0007328 <init_memory_block_desc>
c000a3e1:	83 c4 10             	add    $0x10,%esp
c000a3e4:	e8 55 fa ff ff       	call   c0009e3e <create_user_process_address_space>
c000a3e9:	89 c2                	mov    %eax,%edx
c000a3eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3ee:	89 50 08             	mov    %edx,0x8(%eax)
c000a3f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3f4:	8b 00                	mov    (%eax),%eax
c000a3f6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a3f9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a3fc:	c7 40 10 ce 9e 00 c0 	movl   $0xc0009ece,0x10(%eax)
c000a403:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a406:	8b 55 08             	mov    0x8(%ebp),%edx
c000a409:	89 50 18             	mov    %edx,0x18(%eax)
c000a40c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a40f:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a412:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a415:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a418:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a41b:	89 50 20             	mov    %edx,0x20(%eax)
c000a41e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a421:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a427:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a42a:	8b 10                	mov    (%eax),%edx
c000a42c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a42f:	89 50 04             	mov    %edx,0x4(%eax)
c000a432:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a435:	8b 50 04             	mov    0x4(%eax),%edx
c000a438:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a43b:	89 50 08             	mov    %edx,0x8(%eax)
c000a43e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a441:	8b 50 08             	mov    0x8(%eax),%edx
c000a444:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a447:	89 50 0c             	mov    %edx,0xc(%eax)
c000a44a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a44d:	05 fc 00 00 00       	add    $0xfc,%eax
c000a452:	83 ec 08             	sub    $0x8,%esp
c000a455:	50                   	push   %eax
c000a456:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a45b:	e8 84 00 00 00       	call   c000a4e4 <appendToDoubleLinkList>
c000a460:	83 c4 10             	add    $0x10,%esp
c000a463:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a466:	05 04 01 00 00       	add    $0x104,%eax
c000a46b:	83 ec 08             	sub    $0x8,%esp
c000a46e:	50                   	push   %eax
c000a46f:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a474:	e8 6b 00 00 00       	call   c000a4e4 <appendToDoubleLinkList>
c000a479:	83 c4 10             	add    $0x10,%esp
c000a47c:	90                   	nop
c000a47d:	c9                   	leave  
c000a47e:	c3                   	ret    
c000a47f:	90                   	nop

c000a480 <switch_to>:
c000a480:	56                   	push   %esi
c000a481:	57                   	push   %edi
c000a482:	53                   	push   %ebx
c000a483:	55                   	push   %ebp
c000a484:	89 e5                	mov    %esp,%ebp
c000a486:	8b 45 14             	mov    0x14(%ebp),%eax
c000a489:	89 20                	mov    %esp,(%eax)
c000a48b:	8b 45 18             	mov    0x18(%ebp),%eax
c000a48e:	8b 20                	mov    (%eax),%esp
c000a490:	5d                   	pop    %ebp
c000a491:	5b                   	pop    %ebx
c000a492:	5f                   	pop    %edi
c000a493:	5e                   	pop    %esi
c000a494:	c3                   	ret    

c000a495 <initDoubleLinkList>:
c000a495:	55                   	push   %ebp
c000a496:	89 e5                	mov    %esp,%ebp
c000a498:	8b 45 08             	mov    0x8(%ebp),%eax
c000a49b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a4a1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4a4:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a4ab:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4ae:	8d 50 08             	lea    0x8(%eax),%edx
c000a4b1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4b4:	89 50 04             	mov    %edx,0x4(%eax)
c000a4b7:	8b 55 08             	mov    0x8(%ebp),%edx
c000a4ba:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4bd:	89 50 08             	mov    %edx,0x8(%eax)
c000a4c0:	90                   	nop
c000a4c1:	5d                   	pop    %ebp
c000a4c2:	c3                   	ret    

c000a4c3 <isListEmpty>:
c000a4c3:	55                   	push   %ebp
c000a4c4:	89 e5                	mov    %esp,%ebp
c000a4c6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4c9:	8b 40 04             	mov    0x4(%eax),%eax
c000a4cc:	8b 55 08             	mov    0x8(%ebp),%edx
c000a4cf:	83 c2 08             	add    $0x8,%edx
c000a4d2:	39 d0                	cmp    %edx,%eax
c000a4d4:	75 07                	jne    c000a4dd <isListEmpty+0x1a>
c000a4d6:	b8 01 00 00 00       	mov    $0x1,%eax
c000a4db:	eb 05                	jmp    c000a4e2 <isListEmpty+0x1f>
c000a4dd:	b8 00 00 00 00       	mov    $0x0,%eax
c000a4e2:	5d                   	pop    %ebp
c000a4e3:	c3                   	ret    

c000a4e4 <appendToDoubleLinkList>:
c000a4e4:	55                   	push   %ebp
c000a4e5:	89 e5                	mov    %esp,%ebp
c000a4e7:	83 ec 10             	sub    $0x10,%esp
c000a4ea:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a4ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a4f0:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4f3:	8b 50 08             	mov    0x8(%eax),%edx
c000a4f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a4f9:	89 10                	mov    %edx,(%eax)
c000a4fb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a4fe:	8b 40 08             	mov    0x8(%eax),%eax
c000a501:	85 c0                	test   %eax,%eax
c000a503:	74 0c                	je     c000a511 <appendToDoubleLinkList+0x2d>
c000a505:	8b 45 08             	mov    0x8(%ebp),%eax
c000a508:	8b 40 08             	mov    0x8(%eax),%eax
c000a50b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a50e:	89 50 04             	mov    %edx,0x4(%eax)
c000a511:	8b 45 08             	mov    0x8(%ebp),%eax
c000a514:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a517:	89 50 08             	mov    %edx,0x8(%eax)
c000a51a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a51d:	8d 50 08             	lea    0x8(%eax),%edx
c000a520:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a523:	89 50 04             	mov    %edx,0x4(%eax)
c000a526:	90                   	nop
c000a527:	c9                   	leave  
c000a528:	c3                   	ret    

c000a529 <insertToDoubleLinkList>:
c000a529:	55                   	push   %ebp
c000a52a:	89 e5                	mov    %esp,%ebp
c000a52c:	83 ec 10             	sub    $0x10,%esp
c000a52f:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a532:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a535:	8b 45 08             	mov    0x8(%ebp),%eax
c000a538:	8b 50 04             	mov    0x4(%eax),%edx
c000a53b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a53e:	89 50 04             	mov    %edx,0x4(%eax)
c000a541:	8b 45 08             	mov    0x8(%ebp),%eax
c000a544:	8b 40 04             	mov    0x4(%eax),%eax
c000a547:	85 c0                	test   %eax,%eax
c000a549:	74 0b                	je     c000a556 <insertToDoubleLinkList+0x2d>
c000a54b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a54e:	8b 40 04             	mov    0x4(%eax),%eax
c000a551:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a554:	89 10                	mov    %edx,(%eax)
c000a556:	8b 45 08             	mov    0x8(%ebp),%eax
c000a559:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a55c:	89 50 04             	mov    %edx,0x4(%eax)
c000a55f:	8b 55 08             	mov    0x8(%ebp),%edx
c000a562:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a565:	89 10                	mov    %edx,(%eax)
c000a567:	90                   	nop
c000a568:	c9                   	leave  
c000a569:	c3                   	ret    

c000a56a <popFromDoubleLinkList>:
c000a56a:	55                   	push   %ebp
c000a56b:	89 e5                	mov    %esp,%ebp
c000a56d:	83 ec 10             	sub    $0x10,%esp
c000a570:	ff 75 08             	pushl  0x8(%ebp)
c000a573:	e8 4b ff ff ff       	call   c000a4c3 <isListEmpty>
c000a578:	83 c4 04             	add    $0x4,%esp
c000a57b:	3c 01                	cmp    $0x1,%al
c000a57d:	75 07                	jne    c000a586 <popFromDoubleLinkList+0x1c>
c000a57f:	b8 00 00 00 00       	mov    $0x0,%eax
c000a584:	eb 37                	jmp    c000a5bd <popFromDoubleLinkList+0x53>
c000a586:	8b 45 08             	mov    0x8(%ebp),%eax
c000a589:	8b 40 08             	mov    0x8(%eax),%eax
c000a58c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a58f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a592:	8b 40 08             	mov    0x8(%eax),%eax
c000a595:	8b 00                	mov    (%eax),%eax
c000a597:	85 c0                	test   %eax,%eax
c000a599:	74 11                	je     c000a5ac <popFromDoubleLinkList+0x42>
c000a59b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a59e:	8b 40 08             	mov    0x8(%eax),%eax
c000a5a1:	8b 00                	mov    (%eax),%eax
c000a5a3:	8b 55 08             	mov    0x8(%ebp),%edx
c000a5a6:	83 c2 08             	add    $0x8,%edx
c000a5a9:	89 50 04             	mov    %edx,0x4(%eax)
c000a5ac:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5af:	8b 40 08             	mov    0x8(%eax),%eax
c000a5b2:	8b 10                	mov    (%eax),%edx
c000a5b4:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5b7:	89 50 08             	mov    %edx,0x8(%eax)
c000a5ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a5bd:	c9                   	leave  
c000a5be:	c3                   	ret    

c000a5bf <kernel_thread>:
c000a5bf:	55                   	push   %ebp
c000a5c0:	89 e5                	mov    %esp,%ebp
c000a5c2:	83 ec 08             	sub    $0x8,%esp
c000a5c5:	fb                   	sti    
c000a5c6:	83 ec 0c             	sub    $0xc,%esp
c000a5c9:	ff 75 0c             	pushl  0xc(%ebp)
c000a5cc:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5cf:	ff d0                	call   *%eax
c000a5d1:	83 c4 10             	add    $0x10,%esp
c000a5d4:	90                   	nop
c000a5d5:	c9                   	leave  
c000a5d6:	c3                   	ret    

c000a5d7 <thread_init>:
c000a5d7:	55                   	push   %ebp
c000a5d8:	89 e5                	mov    %esp,%ebp
c000a5da:	83 ec 18             	sub    $0x18,%esp
c000a5dd:	83 ec 08             	sub    $0x8,%esp
c000a5e0:	6a 00                	push   $0x0
c000a5e2:	6a 01                	push   $0x1
c000a5e4:	e8 4e c8 ff ff       	call   c0006e37 <alloc_memory>
c000a5e9:	83 c4 10             	add    $0x10,%esp
c000a5ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a5ef:	83 ec 04             	sub    $0x4,%esp
c000a5f2:	68 00 10 00 00       	push   $0x1000
c000a5f7:	6a 00                	push   $0x0
c000a5f9:	ff 75 f4             	pushl  -0xc(%ebp)
c000a5fc:	e8 71 0d 00 00       	call   c000b372 <Memset>
c000a601:	83 c4 10             	add    $0x10,%esp
c000a604:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a607:	05 00 10 00 00       	add    $0x1000,%eax
c000a60c:	89 c2                	mov    %eax,%edx
c000a60e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a611:	89 10                	mov    %edx,(%eax)
c000a613:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a616:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000a61d:	a1 30 f7 00 c0       	mov    0xc000f730,%eax
c000a622:	83 c0 01             	add    $0x1,%eax
c000a625:	a3 30 f7 00 c0       	mov    %eax,0xc000f730
c000a62a:	8b 15 30 f7 00 c0    	mov    0xc000f730,%edx
c000a630:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a633:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c000a639:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a63c:	c9                   	leave  
c000a63d:	c3                   	ret    

c000a63e <thread_create>:
c000a63e:	55                   	push   %ebp
c000a63f:	89 e5                	mov    %esp,%ebp
c000a641:	83 ec 10             	sub    $0x10,%esp
c000a644:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000a64b:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c000a652:	8b 45 08             	mov    0x8(%ebp),%eax
c000a655:	8b 00                	mov    (%eax),%eax
c000a657:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000a65a:	89 c2                	mov    %eax,%edx
c000a65c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a65f:	89 10                	mov    %edx,(%eax)
c000a661:	8b 45 08             	mov    0x8(%ebp),%eax
c000a664:	8b 00                	mov    (%eax),%eax
c000a666:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000a669:	89 c2                	mov    %eax,%edx
c000a66b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a66e:	89 10                	mov    %edx,(%eax)
c000a670:	90                   	nop
c000a671:	c9                   	leave  
c000a672:	c3                   	ret    

c000a673 <thread_start>:
c000a673:	55                   	push   %ebp
c000a674:	89 e5                	mov    %esp,%ebp
c000a676:	83 ec 18             	sub    $0x18,%esp
c000a679:	e8 59 ff ff ff       	call   c000a5d7 <thread_init>
c000a67e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a681:	83 ec 0c             	sub    $0xc,%esp
c000a684:	ff 75 f4             	pushl  -0xc(%ebp)
c000a687:	e8 b2 ff ff ff       	call   c000a63e <thread_create>
c000a68c:	83 c4 10             	add    $0x10,%esp
c000a68f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a692:	05 30 01 00 00       	add    $0x130,%eax
c000a697:	83 ec 08             	sub    $0x8,%esp
c000a69a:	ff 75 10             	pushl  0x10(%ebp)
c000a69d:	50                   	push   %eax
c000a69e:	e8 ee 0c 00 00       	call   c000b391 <Strcpy>
c000a6a3:	83 c4 10             	add    $0x10,%esp
c000a6a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6a9:	8b 00                	mov    (%eax),%eax
c000a6ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a6ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6b1:	c7 40 10 bf a5 00 c0 	movl   $0xc000a5bf,0x10(%eax)
c000a6b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6bb:	8b 55 08             	mov    0x8(%ebp),%edx
c000a6be:	89 50 18             	mov    %edx,0x18(%eax)
c000a6c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6c4:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a6c7:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a6ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6cd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a6d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6d6:	8b 10                	mov    (%eax),%edx
c000a6d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6db:	89 50 04             	mov    %edx,0x4(%eax)
c000a6de:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6e1:	8b 50 04             	mov    0x4(%eax),%edx
c000a6e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6e7:	89 50 08             	mov    %edx,0x8(%eax)
c000a6ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6ed:	8b 50 08             	mov    0x8(%eax),%edx
c000a6f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a6f3:	89 50 0c             	mov    %edx,0xc(%eax)
c000a6f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6f9:	05 fc 00 00 00       	add    $0xfc,%eax
c000a6fe:	83 ec 08             	sub    $0x8,%esp
c000a701:	50                   	push   %eax
c000a702:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a707:	e8 d8 fd ff ff       	call   c000a4e4 <appendToDoubleLinkList>
c000a70c:	83 c4 10             	add    $0x10,%esp
c000a70f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a712:	05 04 01 00 00       	add    $0x104,%eax
c000a717:	83 ec 08             	sub    $0x8,%esp
c000a71a:	50                   	push   %eax
c000a71b:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a720:	e8 bf fd ff ff       	call   c000a4e4 <appendToDoubleLinkList>
c000a725:	83 c4 10             	add    $0x10,%esp
c000a728:	90                   	nop
c000a729:	c9                   	leave  
c000a72a:	c3                   	ret    
