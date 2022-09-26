
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
c0001525:	e8 54 38 00 00       	call   c0004d7e <ReloadGDT>
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
c000154e:	e9 4b 03 00 00       	jmp    c000189e <kernel_main>
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
c000156a:	e8 35 6b 00 00       	call   c00080a4 <test>
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
c0001661:	e8 57 65 00 00       	call   c0007bbd <exception_handler>
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
c000168d:	e8 6c 33 00 00       	call   c00049fe <clock_handler>
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
c00016c0:	e8 f3 41 00 00       	call   c00058b8 <keyboard_handler>
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
c0001707:	e8 35 0f 00 00       	call   c0002641 <hd_handler>
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
c00017e6:	e8 6c 62 00 00       	call   c0007a57 <disp_int>
c00017eb:	83 c4 04             	add    $0x4,%esp
c00017ee:	58                   	pop    %eax
c00017ef:	5a                   	pop    %edx
c00017f0:	52                   	push   %edx
c00017f1:	50                   	push   %eax
c00017f2:	e8 60 62 00 00       	call   c0007a57 <disp_int>
c00017f7:	58                   	pop    %eax
c00017f8:	5a                   	pop    %edx
c00017f9:	52                   	push   %edx
c00017fa:	50                   	push   %eax
c00017fb:	ff 35 44 f7 00 c0    	pushl  0xc000f744
c0001801:	e8 51 62 00 00       	call   c0007a57 <disp_int>
c0001806:	83 c4 04             	add    $0x4,%esp
c0001809:	58                   	pop    %eax
c000180a:	5a                   	pop    %edx
c000180b:	52                   	push   %edx
c000180c:	50                   	push   %eax
c000180d:	ff 72 ec             	pushl  -0x14(%edx)
c0001810:	e8 42 62 00 00       	call   c0007a57 <disp_int>
c0001815:	83 c4 04             	add    $0x4,%esp
c0001818:	58                   	pop    %eax
c0001819:	5a                   	pop    %edx
c000181a:	52                   	push   %edx
c000181b:	50                   	push   %eax
c000181c:	ff 70 ec             	pushl  -0x14(%eax)
c000181f:	e8 33 62 00 00       	call   c0007a57 <disp_int>
c0001824:	83 c4 04             	add    $0x4,%esp
c0001827:	58                   	pop    %eax
c0001828:	5a                   	pop    %edx
c0001829:	52                   	push   %edx
c000182a:	50                   	push   %eax
c000182b:	ff 35 60 fb 00 c0    	pushl  0xc000fb60
c0001831:	e8 21 62 00 00       	call   c0007a57 <disp_int>
c0001836:	83 c4 04             	add    $0x4,%esp
c0001839:	58                   	pop    %eax
c000183a:	5a                   	pop    %edx
c000183b:	52                   	push   %edx
c000183c:	50                   	push   %eax
c000183d:	68 00 f7 00 c0       	push   $0xc000f700
c0001842:	e8 10 62 00 00       	call   c0007a57 <disp_int>
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
c000188b:	8b 00                	mov    (%eax),%eax
c000188d:	a3 24 16 01 c0       	mov    %eax,0xc0011624
c0001892:	89 ec                	mov    %ebp,%esp
c0001894:	5d                   	pop    %ebp
c0001895:	c3                   	ret    

c0001896 <get_running_thread_pcb>:
c0001896:	89 e0                	mov    %esp,%eax
c0001898:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c000189d:	c3                   	ret    

c000189e <kernel_main>:
c000189e:	55                   	push   %ebp
c000189f:	89 e5                	mov    %esp,%ebp
c00018a1:	83 ec 08             	sub    $0x8,%esp
c00018a4:	e8 95 00 00 00       	call   c000193e <init>
c00018a9:	83 ec 04             	sub    $0x4,%esp
c00018ac:	68 c0 a7 00 c0       	push   $0xc000a7c0
c00018b1:	68 ca a7 00 c0       	push   $0xc000a7ca
c00018b6:	68 90 1a 00 c0       	push   $0xc0001a90
c00018bb:	e8 f2 8a 00 00       	call   c000a3b2 <process_execute>
c00018c0:	83 c4 10             	add    $0x10,%esp
c00018c3:	83 ec 04             	sub    $0x4,%esp
c00018c6:	68 d7 a7 00 c0       	push   $0xc000a7d7
c00018cb:	68 df a7 00 c0       	push   $0xc000a7df
c00018d0:	68 b5 57 00 c0       	push   $0xc00057b5
c00018d5:	e8 d8 8a 00 00       	call   c000a3b2 <process_execute>
c00018da:	83 c4 10             	add    $0x10,%esp
c00018dd:	83 ec 04             	sub    $0x4,%esp
c00018e0:	68 e9 a7 00 c0       	push   $0xc000a7e9
c00018e5:	68 f0 a7 00 c0       	push   $0xc000a7f0
c00018ea:	68 c5 1a 00 c0       	push   $0xc0001ac5
c00018ef:	e8 be 8a 00 00       	call   c000a3b2 <process_execute>
c00018f4:	83 c4 10             	add    $0x10,%esp
c00018f7:	83 ec 04             	sub    $0x4,%esp
c00018fa:	68 f9 a7 00 c0       	push   $0xc000a7f9
c00018ff:	68 01 a8 00 c0       	push   $0xc000a801
c0001904:	68 54 28 00 c0       	push   $0xc0002854
c0001909:	e8 a4 8a 00 00       	call   c000a3b2 <process_execute>
c000190e:	83 c4 10             	add    $0x10,%esp
c0001911:	83 ec 04             	sub    $0x4,%esp
c0001914:	68 0a a8 00 c0       	push   $0xc000a80a
c0001919:	68 11 a8 00 c0       	push   $0xc000a811
c000191e:	68 b1 61 00 c0       	push   $0xc00061b1
c0001923:	e8 8a 8a 00 00       	call   c000a3b2 <process_execute>
c0001928:	83 c4 10             	add    $0x10,%esp
c000192b:	83 ec 0c             	sub    $0xc,%esp
c000192e:	68 1a a8 00 c0       	push   $0xc000a81a
c0001933:	e8 54 fc ff ff       	call   c000158c <disp_str>
c0001938:	83 c4 10             	add    $0x10,%esp
c000193b:	fb                   	sti    
c000193c:	eb fe                	jmp    c000193c <kernel_main+0x9e>

c000193e <init>:
c000193e:	55                   	push   %ebp
c000193f:	89 e5                	mov    %esp,%ebp
c0001941:	83 ec 08             	sub    $0x8,%esp
c0001944:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c000194b:	00 00 00 
c000194e:	c7 05 30 f7 00 c0 00 	movl   $0x0,0xc000f730
c0001955:	00 00 00 
c0001958:	83 ec 0c             	sub    $0xc,%esp
c000195b:	68 24 a8 00 c0       	push   $0xc000a824
c0001960:	e8 27 fc ff ff       	call   c000158c <disp_str>
c0001965:	83 c4 10             	add    $0x10,%esp
c0001968:	e8 ec 67 00 00       	call   c0008159 <init_keyboard>
c000196d:	83 ec 0c             	sub    $0xc,%esp
c0001970:	68 00 00 00 02       	push   $0x2000000
c0001975:	e8 fb 5c 00 00       	call   c0007675 <init_memory>
c000197a:	83 c4 10             	add    $0x10,%esp
c000197d:	83 ec 0c             	sub    $0xc,%esp
c0001980:	68 8c fd 00 c0       	push   $0xc000fd8c
c0001985:	e8 8b 8b 00 00       	call   c000a515 <initDoubleLinkList>
c000198a:	83 c4 10             	add    $0x10,%esp
c000198d:	83 ec 0c             	sub    $0xc,%esp
c0001990:	68 d4 1e 01 c0       	push   $0xc0011ed4
c0001995:	e8 7b 8b 00 00       	call   c000a515 <initDoubleLinkList>
c000199a:	83 c4 10             	add    $0x10,%esp
c000199d:	90                   	nop
c000199e:	c9                   	leave  
c000199f:	c3                   	ret    

c00019a0 <kernel_thread_a>:
c00019a0:	55                   	push   %ebp
c00019a1:	89 e5                	mov    %esp,%ebp
c00019a3:	83 ec 18             	sub    $0x18,%esp
c00019a6:	83 ec 0c             	sub    $0xc,%esp
c00019a9:	ff 75 08             	pushl  0x8(%ebp)
c00019ac:	e8 db fb ff ff       	call   c000158c <disp_str>
c00019b1:	83 c4 10             	add    $0x10,%esp
c00019b4:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c00019b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00019bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00019c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00019c6:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c00019cb:	83 ec 0c             	sub    $0xc,%esp
c00019ce:	68 2a a8 00 c0       	push   $0xc000a82a
c00019d3:	e8 b4 fb ff ff       	call   c000158c <disp_str>
c00019d8:	83 c4 10             	add    $0x10,%esp
c00019db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00019de:	8d 50 01             	lea    0x1(%eax),%edx
c00019e1:	89 55 f4             	mov    %edx,-0xc(%ebp)
c00019e4:	83 ec 0c             	sub    $0xc,%esp
c00019e7:	50                   	push   %eax
c00019e8:	e8 6a 60 00 00       	call   c0007a57 <disp_int>
c00019ed:	83 c4 10             	add    $0x10,%esp
c00019f0:	83 ec 0c             	sub    $0xc,%esp
c00019f3:	68 33 a8 00 c0       	push   $0xc000a833
c00019f8:	e8 8f fb ff ff       	call   c000158c <disp_str>
c00019fd:	83 c4 10             	add    $0x10,%esp
c0001a00:	eb c1                	jmp    c00019c3 <kernel_thread_a+0x23>

c0001a02 <kernel_thread_b>:
c0001a02:	55                   	push   %ebp
c0001a03:	89 e5                	mov    %esp,%ebp
c0001a05:	83 ec 18             	sub    $0x18,%esp
c0001a08:	83 ec 0c             	sub    $0xc,%esp
c0001a0b:	ff 75 08             	pushl  0x8(%ebp)
c0001a0e:	e8 79 fb ff ff       	call   c000158c <disp_str>
c0001a13:	83 c4 10             	add    $0x10,%esp
c0001a16:	a1 40 f7 00 c0       	mov    0xc000f740,%eax
c0001a1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001a1e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001a25:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001a28:	a3 40 f7 00 c0       	mov    %eax,0xc000f740
c0001a2d:	83 ec 0c             	sub    $0xc,%esp
c0001a30:	68 35 a8 00 c0       	push   $0xc000a835
c0001a35:	e8 52 fb ff ff       	call   c000158c <disp_str>
c0001a3a:	83 c4 10             	add    $0x10,%esp
c0001a3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001a40:	8d 50 01             	lea    0x1(%eax),%edx
c0001a43:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0001a46:	83 ec 0c             	sub    $0xc,%esp
c0001a49:	50                   	push   %eax
c0001a4a:	e8 08 60 00 00       	call   c0007a57 <disp_int>
c0001a4f:	83 c4 10             	add    $0x10,%esp
c0001a52:	83 ec 0c             	sub    $0xc,%esp
c0001a55:	68 33 a8 00 c0       	push   $0xc000a833
c0001a5a:	e8 2d fb ff ff       	call   c000158c <disp_str>
c0001a5f:	83 c4 10             	add    $0x10,%esp
c0001a62:	eb c1                	jmp    c0001a25 <kernel_thread_b+0x23>

c0001a64 <kernel_thread_c>:
c0001a64:	55                   	push   %ebp
c0001a65:	89 e5                	mov    %esp,%ebp
c0001a67:	83 ec 08             	sub    $0x8,%esp
c0001a6a:	83 ec 0c             	sub    $0xc,%esp
c0001a6d:	ff 75 08             	pushl  0x8(%ebp)
c0001a70:	e8 17 fb ff ff       	call   c000158c <disp_str>
c0001a75:	83 c4 10             	add    $0x10,%esp
c0001a78:	eb fe                	jmp    c0001a78 <kernel_thread_c+0x14>

c0001a7a <kernel_thread_d>:
c0001a7a:	55                   	push   %ebp
c0001a7b:	89 e5                	mov    %esp,%ebp
c0001a7d:	83 ec 08             	sub    $0x8,%esp
c0001a80:	83 ec 0c             	sub    $0xc,%esp
c0001a83:	ff 75 08             	pushl  0x8(%ebp)
c0001a86:	e8 01 fb ff ff       	call   c000158c <disp_str>
c0001a8b:	83 c4 10             	add    $0x10,%esp
c0001a8e:	eb fe                	jmp    c0001a8e <kernel_thread_d+0x14>

c0001a90 <user_proc_a>:
c0001a90:	55                   	push   %ebp
c0001a91:	89 e5                	mov    %esp,%ebp
c0001a93:	83 ec 08             	sub    $0x8,%esp
c0001a96:	83 ec 0c             	sub    $0xc,%esp
c0001a99:	68 3e a8 00 c0       	push   $0xc000a83e
c0001a9e:	e8 e9 fa ff ff       	call   c000158c <disp_str>
c0001aa3:	83 c4 10             	add    $0x10,%esp
c0001aa6:	e8 9c 6b 00 00       	call   c0008647 <INIT_fork>
c0001aab:	eb fe                	jmp    c0001aab <user_proc_a+0x1b>

c0001aad <user_proc_b>:
c0001aad:	55                   	push   %ebp
c0001aae:	89 e5                	mov    %esp,%ebp
c0001ab0:	83 ec 08             	sub    $0x8,%esp
c0001ab3:	83 ec 0c             	sub    $0xc,%esp
c0001ab6:	68 50 a8 00 c0       	push   $0xc000a850
c0001abb:	e8 cc fa ff ff       	call   c000158c <disp_str>
c0001ac0:	83 c4 10             	add    $0x10,%esp
c0001ac3:	eb fe                	jmp    c0001ac3 <user_proc_b+0x16>

c0001ac5 <TaskHD>:
c0001ac5:	55                   	push   %ebp
c0001ac6:	89 e5                	mov    %esp,%ebp
c0001ac8:	83 ec 18             	sub    $0x18,%esp
c0001acb:	e8 c6 fd ff ff       	call   c0001896 <get_running_thread_pcb>
c0001ad0:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001ad3:	e8 20 00 00 00       	call   c0001af8 <init_hd>
c0001ad8:	83 ec 0c             	sub    $0xc,%esp
c0001adb:	6a 6c                	push   $0x6c
c0001add:	e8 fc 53 00 00       	call   c0006ede <sys_malloc>
c0001ae2:	83 c4 10             	add    $0x10,%esp
c0001ae5:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001ae8:	83 ec 0c             	sub    $0xc,%esp
c0001aeb:	ff 75 f0             	pushl  -0x10(%ebp)
c0001aee:	e8 1f 00 00 00       	call   c0001b12 <hd_handle>
c0001af3:	83 c4 10             	add    $0x10,%esp
c0001af6:	eb f0                	jmp    c0001ae8 <TaskHD+0x23>

c0001af8 <init_hd>:
c0001af8:	55                   	push   %ebp
c0001af9:	89 e5                	mov    %esp,%ebp
c0001afb:	83 ec 18             	sub    $0x18,%esp
c0001afe:	c7 45 f4 75 04 00 00 	movl   $0x475,-0xc(%ebp)
c0001b05:	e8 46 fd ff ff       	call   c0001850 <enable_8259A_casecade_irq>
c0001b0a:	e8 55 fd ff ff       	call   c0001864 <enable_8259A_slave_winchester_irq>
c0001b0f:	90                   	nop
c0001b10:	c9                   	leave  
c0001b11:	c3                   	ret    

c0001b12 <hd_handle>:
c0001b12:	55                   	push   %ebp
c0001b13:	89 e5                	mov    %esp,%ebp
c0001b15:	83 ec 18             	sub    $0x18,%esp
c0001b18:	83 ec 04             	sub    $0x4,%esp
c0001b1b:	6a 0e                	push   $0xe
c0001b1d:	ff 75 08             	pushl  0x8(%ebp)
c0001b20:	6a 02                	push   $0x2
c0001b22:	e8 b7 7f 00 00       	call   c0009ade <send_rec>
c0001b27:	83 c4 10             	add    $0x10,%esp
c0001b2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b2d:	8b 40 68             	mov    0x68(%eax),%eax
c0001b30:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0001b33:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0001b37:	0f 84 cc 00 00 00    	je     c0001c09 <hd_handle+0xf7>
c0001b3d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001b40:	8b 00                	mov    (%eax),%eax
c0001b42:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0001b45:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b49:	74 2b                	je     c0001b76 <hd_handle+0x64>
c0001b4b:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b4f:	74 25                	je     c0001b76 <hd_handle+0x64>
c0001b51:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b55:	74 1f                	je     c0001b76 <hd_handle+0x64>
c0001b57:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001b5b:	74 19                	je     c0001b76 <hd_handle+0x64>
c0001b5d:	6a 69                	push   $0x69
c0001b5f:	68 64 a8 00 c0       	push   $0xc000a864
c0001b64:	68 64 a8 00 c0       	push   $0xc000a864
c0001b69:	68 6c a8 00 c0       	push   $0xc000a86c
c0001b6e:	e8 20 77 00 00       	call   c0009293 <assertion_failure>
c0001b73:	83 c4 10             	add    $0x10,%esp
c0001b76:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b7a:	74 23                	je     c0001b9f <hd_handle+0x8d>
c0001b7c:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
c0001b80:	77 08                	ja     c0001b8a <hd_handle+0x78>
c0001b82:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
c0001b86:	74 10                	je     c0001b98 <hd_handle+0x86>
c0001b88:	eb 34                	jmp    c0001bbe <hd_handle+0xac>
c0001b8a:	83 7d f4 0a          	cmpl   $0xa,-0xc(%ebp)
c0001b8e:	74 0f                	je     c0001b9f <hd_handle+0x8d>
c0001b90:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
c0001b94:	74 19                	je     c0001baf <hd_handle+0x9d>
c0001b96:	eb 26                	jmp    c0001bbe <hd_handle+0xac>
c0001b98:	e8 1b 07 00 00       	call   c00022b8 <hd_open>
c0001b9d:	eb 30                	jmp    c0001bcf <hd_handle+0xbd>
c0001b9f:	83 ec 0c             	sub    $0xc,%esp
c0001ba2:	ff 75 08             	pushl  0x8(%ebp)
c0001ba5:	e8 38 08 00 00       	call   c00023e2 <hd_rdwt>
c0001baa:	83 c4 10             	add    $0x10,%esp
c0001bad:	eb 20                	jmp    c0001bcf <hd_handle+0xbd>
c0001baf:	83 ec 0c             	sub    $0xc,%esp
c0001bb2:	6a 00                	push   $0x0
c0001bb4:	e8 4e 07 00 00       	call   c0002307 <get_hd_ioctl>
c0001bb9:	83 c4 10             	add    $0x10,%esp
c0001bbc:	eb 11                	jmp    c0001bcf <hd_handle+0xbd>
c0001bbe:	83 ec 0c             	sub    $0xc,%esp
c0001bc1:	68 b2 a8 00 c0       	push   $0xc000a8b2
c0001bc6:	e8 84 76 00 00       	call   c000924f <spin>
c0001bcb:	83 c4 10             	add    $0x10,%esp
c0001bce:	90                   	nop
c0001bcf:	83 ec 04             	sub    $0x4,%esp
c0001bd2:	6a 6c                	push   $0x6c
c0001bd4:	6a 00                	push   $0x0
c0001bd6:	ff 75 08             	pushl  0x8(%ebp)
c0001bd9:	e8 14 98 00 00       	call   c000b3f2 <Memset>
c0001bde:	83 c4 10             	add    $0x10,%esp
c0001be1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001be4:	c7 40 68 64 00 00 00 	movl   $0x64,0x68(%eax)
c0001beb:	8b 45 08             	mov    0x8(%ebp),%eax
c0001bee:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
c0001bf5:	83 ec 04             	sub    $0x4,%esp
c0001bf8:	6a 04                	push   $0x4
c0001bfa:	ff 75 08             	pushl  0x8(%ebp)
c0001bfd:	6a 01                	push   $0x1
c0001bff:	e8 da 7e 00 00       	call   c0009ade <send_rec>
c0001c04:	83 c4 10             	add    $0x10,%esp
c0001c07:	eb 01                	jmp    c0001c0a <hd_handle+0xf8>
c0001c09:	90                   	nop
c0001c0a:	c9                   	leave  
c0001c0b:	c3                   	ret    

c0001c0c <hd_cmd_out>:
c0001c0c:	55                   	push   %ebp
c0001c0d:	89 e5                	mov    %esp,%ebp
c0001c0f:	83 ec 08             	sub    $0x8,%esp
c0001c12:	83 ec 04             	sub    $0x4,%esp
c0001c15:	68 18 73 01 00       	push   $0x17318
c0001c1a:	6a 00                	push   $0x0
c0001c1c:	68 80 00 00 00       	push   $0x80
c0001c21:	e8 47 0a 00 00       	call   c000266d <waitfor>
c0001c26:	83 c4 10             	add    $0x10,%esp
c0001c29:	85 c0                	test   %eax,%eax
c0001c2b:	75 10                	jne    c0001c3d <hd_cmd_out+0x31>
c0001c2d:	83 ec 0c             	sub    $0xc,%esp
c0001c30:	68 c4 a8 00 c0       	push   $0xc000a8c4
c0001c35:	e8 3b 76 00 00       	call   c0009275 <panic>
c0001c3a:	83 c4 10             	add    $0x10,%esp
c0001c3d:	83 ec 08             	sub    $0x8,%esp
c0001c40:	6a 00                	push   $0x0
c0001c42:	68 f6 03 00 00       	push   $0x3f6
c0001c47:	e8 4a fb ff ff       	call   c0001796 <out_byte>
c0001c4c:	83 c4 10             	add    $0x10,%esp
c0001c4f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c52:	0f b6 00             	movzbl (%eax),%eax
c0001c55:	0f b6 c0             	movzbl %al,%eax
c0001c58:	83 ec 08             	sub    $0x8,%esp
c0001c5b:	50                   	push   %eax
c0001c5c:	68 f1 01 00 00       	push   $0x1f1
c0001c61:	e8 30 fb ff ff       	call   c0001796 <out_byte>
c0001c66:	83 c4 10             	add    $0x10,%esp
c0001c69:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c6c:	0f b6 40 01          	movzbl 0x1(%eax),%eax
c0001c70:	0f b6 c0             	movzbl %al,%eax
c0001c73:	83 ec 08             	sub    $0x8,%esp
c0001c76:	50                   	push   %eax
c0001c77:	68 f2 01 00 00       	push   $0x1f2
c0001c7c:	e8 15 fb ff ff       	call   c0001796 <out_byte>
c0001c81:	83 c4 10             	add    $0x10,%esp
c0001c84:	8b 45 08             	mov    0x8(%ebp),%eax
c0001c87:	0f b6 40 02          	movzbl 0x2(%eax),%eax
c0001c8b:	0f b6 c0             	movzbl %al,%eax
c0001c8e:	83 ec 08             	sub    $0x8,%esp
c0001c91:	50                   	push   %eax
c0001c92:	68 f3 01 00 00       	push   $0x1f3
c0001c97:	e8 fa fa ff ff       	call   c0001796 <out_byte>
c0001c9c:	83 c4 10             	add    $0x10,%esp
c0001c9f:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ca2:	0f b6 40 03          	movzbl 0x3(%eax),%eax
c0001ca6:	0f b6 c0             	movzbl %al,%eax
c0001ca9:	83 ec 08             	sub    $0x8,%esp
c0001cac:	50                   	push   %eax
c0001cad:	68 f4 01 00 00       	push   $0x1f4
c0001cb2:	e8 df fa ff ff       	call   c0001796 <out_byte>
c0001cb7:	83 c4 10             	add    $0x10,%esp
c0001cba:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cbd:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001cc1:	0f b6 c0             	movzbl %al,%eax
c0001cc4:	83 ec 08             	sub    $0x8,%esp
c0001cc7:	50                   	push   %eax
c0001cc8:	68 f5 01 00 00       	push   $0x1f5
c0001ccd:	e8 c4 fa ff ff       	call   c0001796 <out_byte>
c0001cd2:	83 c4 10             	add    $0x10,%esp
c0001cd5:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cd8:	0f b6 40 05          	movzbl 0x5(%eax),%eax
c0001cdc:	0f b6 c0             	movzbl %al,%eax
c0001cdf:	83 ec 08             	sub    $0x8,%esp
c0001ce2:	50                   	push   %eax
c0001ce3:	68 f6 01 00 00       	push   $0x1f6
c0001ce8:	e8 a9 fa ff ff       	call   c0001796 <out_byte>
c0001ced:	83 c4 10             	add    $0x10,%esp
c0001cf0:	8b 45 08             	mov    0x8(%ebp),%eax
c0001cf3:	0f b6 40 06          	movzbl 0x6(%eax),%eax
c0001cf7:	0f b6 c0             	movzbl %al,%eax
c0001cfa:	83 ec 08             	sub    $0x8,%esp
c0001cfd:	50                   	push   %eax
c0001cfe:	68 f7 01 00 00       	push   $0x1f7
c0001d03:	e8 8e fa ff ff       	call   c0001796 <out_byte>
c0001d08:	83 c4 10             	add    $0x10,%esp
c0001d0b:	90                   	nop
c0001d0c:	c9                   	leave  
c0001d0d:	c3                   	ret    

c0001d0e <hd_identify>:
c0001d0e:	55                   	push   %ebp
c0001d0f:	89 e5                	mov    %esp,%ebp
c0001d11:	53                   	push   %ebx
c0001d12:	83 ec 24             	sub    $0x24,%esp
c0001d15:	89 e0                	mov    %esp,%eax
c0001d17:	89 c3                	mov    %eax,%ebx
c0001d19:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
c0001d1d:	c6 45 e6 01          	movb   $0x1,-0x1a(%ebp)
c0001d21:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
c0001d25:	c6 45 e8 00          	movb   $0x0,-0x18(%ebp)
c0001d29:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0001d2d:	8b 45 08             	mov    0x8(%ebp),%eax
c0001d30:	c1 e0 04             	shl    $0x4,%eax
c0001d33:	83 c8 e0             	or     $0xffffffe0,%eax
c0001d36:	88 45 ea             	mov    %al,-0x16(%ebp)
c0001d39:	c6 45 eb ec          	movb   $0xec,-0x15(%ebp)
c0001d3d:	83 ec 0c             	sub    $0xc,%esp
c0001d40:	8d 45 e5             	lea    -0x1b(%ebp),%eax
c0001d43:	50                   	push   %eax
c0001d44:	e8 c3 fe ff ff       	call   c0001c0c <hd_cmd_out>
c0001d49:	83 c4 10             	add    $0x10,%esp
c0001d4c:	e8 40 06 00 00       	call   c0002391 <interrupt_wait>
c0001d51:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c0001d58:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0001d5b:	8d 50 ff             	lea    -0x1(%eax),%edx
c0001d5e:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0001d61:	89 c2                	mov    %eax,%edx
c0001d63:	b8 10 00 00 00       	mov    $0x10,%eax
c0001d68:	83 e8 01             	sub    $0x1,%eax
c0001d6b:	01 d0                	add    %edx,%eax
c0001d6d:	b9 10 00 00 00       	mov    $0x10,%ecx
c0001d72:	ba 00 00 00 00       	mov    $0x0,%edx
c0001d77:	f7 f1                	div    %ecx
c0001d79:	6b c0 10             	imul   $0x10,%eax,%eax
c0001d7c:	29 c4                	sub    %eax,%esp
c0001d7e:	89 e0                	mov    %esp,%eax
c0001d80:	83 c0 00             	add    $0x0,%eax
c0001d83:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001d86:	83 ec 04             	sub    $0x4,%esp
c0001d89:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d8c:	6a 00                	push   $0x0
c0001d8e:	ff 75 ec             	pushl  -0x14(%ebp)
c0001d91:	e8 5c 96 00 00       	call   c000b3f2 <Memset>
c0001d96:	83 c4 10             	add    $0x10,%esp
c0001d99:	83 ec 04             	sub    $0x4,%esp
c0001d9c:	ff 75 f4             	pushl  -0xc(%ebp)
c0001d9f:	ff 75 ec             	pushl  -0x14(%ebp)
c0001da2:	68 f0 01 00 00       	push   $0x1f0
c0001da7:	e8 9a 96 00 00       	call   c000b446 <read_port>
c0001dac:	83 c4 10             	add    $0x10,%esp
c0001daf:	83 ec 0c             	sub    $0xc,%esp
c0001db2:	ff 75 ec             	pushl  -0x14(%ebp)
c0001db5:	e8 0b 00 00 00       	call   c0001dc5 <print_hdinfo>
c0001dba:	83 c4 10             	add    $0x10,%esp
c0001dbd:	89 dc                	mov    %ebx,%esp
c0001dbf:	90                   	nop
c0001dc0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0001dc3:	c9                   	leave  
c0001dc4:	c3                   	ret    

c0001dc5 <print_hdinfo>:
c0001dc5:	55                   	push   %ebp
c0001dc6:	89 e5                	mov    %esp,%ebp
c0001dc8:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0001dce:	66 c7 45 b4 0a 00    	movw   $0xa,-0x4c(%ebp)
c0001dd4:	66 c7 45 b6 14 00    	movw   $0x14,-0x4a(%ebp)
c0001dda:	c7 45 b8 53 65 72 69 	movl   $0x69726553,-0x48(%ebp)
c0001de1:	c7 45 bc 61 6c 20 4e 	movl   $0x4e206c61,-0x44(%ebp)
c0001de8:	c7 45 c0 75 6d 62 65 	movl   $0x65626d75,-0x40(%ebp)
c0001def:	c7 45 c4 72 00 00 00 	movl   $0x72,-0x3c(%ebp)
c0001df6:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0001dfd:	66 c7 45 cc 1b 00    	movw   $0x1b,-0x34(%ebp)
c0001e03:	66 c7 45 ce 28 00    	movw   $0x28,-0x32(%ebp)
c0001e09:	c7 45 d0 4d 6f 64 65 	movl   $0x65646f4d,-0x30(%ebp)
c0001e10:	c7 45 d4 6c 20 4e 75 	movl   $0x754e206c,-0x2c(%ebp)
c0001e17:	c7 45 d8 6d 62 65 72 	movl   $0x7265626d,-0x28(%ebp)
c0001e1e:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
c0001e25:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0001e2c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0001e33:	e9 8f 00 00 00       	jmp    c0001ec7 <print_hdinfo+0x102>
c0001e38:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0001e3f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e42:	89 d0                	mov    %edx,%eax
c0001e44:	01 c0                	add    %eax,%eax
c0001e46:	01 d0                	add    %edx,%eax
c0001e48:	c1 e0 03             	shl    $0x3,%eax
c0001e4b:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001e4e:	01 c8                	add    %ecx,%eax
c0001e50:	83 e8 44             	sub    $0x44,%eax
c0001e53:	0f b7 00             	movzwl (%eax),%eax
c0001e56:	0f b7 c0             	movzwl %ax,%eax
c0001e59:	8d 14 00             	lea    (%eax,%eax,1),%edx
c0001e5c:	8b 45 08             	mov    0x8(%ebp),%eax
c0001e5f:	01 d0                	add    %edx,%eax
c0001e61:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0001e64:	eb 30                	jmp    c0001e96 <print_hdinfo+0xd1>
c0001e66:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e69:	8d 50 01             	lea    0x1(%eax),%edx
c0001e6c:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e6f:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e72:	83 c2 01             	add    $0x1,%edx
c0001e75:	0f b6 00             	movzbl (%eax),%eax
c0001e78:	88 44 15 81          	mov    %al,-0x7f(%ebp,%edx,1)
c0001e7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0001e7f:	8d 50 01             	lea    0x1(%eax),%edx
c0001e82:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0001e85:	0f b6 00             	movzbl (%eax),%eax
c0001e88:	8d 4d 81             	lea    -0x7f(%ebp),%ecx
c0001e8b:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0001e8e:	01 ca                	add    %ecx,%edx
c0001e90:	88 02                	mov    %al,(%edx)
c0001e92:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0001e96:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0001e99:	89 d0                	mov    %edx,%eax
c0001e9b:	01 c0                	add    %eax,%eax
c0001e9d:	01 d0                	add    %edx,%eax
c0001e9f:	c1 e0 03             	shl    $0x3,%eax
c0001ea2:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0001ea5:	01 c8                	add    %ecx,%eax
c0001ea7:	83 e8 42             	sub    $0x42,%eax
c0001eaa:	0f b7 00             	movzwl (%eax),%eax
c0001ead:	66 d1 e8             	shr    %ax
c0001eb0:	0f b7 c0             	movzwl %ax,%eax
c0001eb3:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0001eb6:	7c ae                	jl     c0001e66 <print_hdinfo+0xa1>
c0001eb8:	8d 55 81             	lea    -0x7f(%ebp),%edx
c0001ebb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0001ebe:	01 d0                	add    %edx,%eax
c0001ec0:	c6 00 00             	movb   $0x0,(%eax)
c0001ec3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0001ec7:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c0001ecb:	0f 8e 67 ff ff ff    	jle    c0001e38 <print_hdinfo+0x73>
c0001ed1:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ed4:	0f b7 40 62          	movzwl 0x62(%eax),%eax
c0001ed8:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
c0001edc:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0001ee0:	66 c1 e8 08          	shr    $0x8,%ax
c0001ee4:	66 85 c0             	test   %ax,%ax
c0001ee7:	0f 95 c0             	setne  %al
c0001eea:	88 45 e9             	mov    %al,-0x17(%ebp)
c0001eed:	c7 45 ac 59 65 73 00 	movl   $0x736559,-0x54(%ebp)
c0001ef4:	66 c7 45 a9 4e 6f    	movw   $0x6f4e,-0x57(%ebp)
c0001efa:	c6 45 ab 00          	movb   $0x0,-0x55(%ebp)
c0001efe:	80 7d e9 01          	cmpb   $0x1,-0x17(%ebp)
c0001f02:	75 15                	jne    c0001f19 <print_hdinfo+0x154>
c0001f04:	83 ec 08             	sub    $0x8,%esp
c0001f07:	8d 45 ac             	lea    -0x54(%ebp),%eax
c0001f0a:	50                   	push   %eax
c0001f0b:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f0e:	50                   	push   %eax
c0001f0f:	e8 fd 94 00 00       	call   c000b411 <Strcpy>
c0001f14:	83 c4 10             	add    $0x10,%esp
c0001f17:	eb 13                	jmp    c0001f2c <print_hdinfo+0x167>
c0001f19:	83 ec 08             	sub    $0x8,%esp
c0001f1c:	8d 45 a9             	lea    -0x57(%ebp),%eax
c0001f1f:	50                   	push   %eax
c0001f20:	8d 45 b0             	lea    -0x50(%ebp),%eax
c0001f23:	50                   	push   %eax
c0001f24:	e8 e8 94 00 00       	call   c000b411 <Strcpy>
c0001f29:	83 c4 10             	add    $0x10,%esp
c0001f2c:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f2f:	83 c0 7a             	add    $0x7a,%eax
c0001f32:	0f b7 00             	movzwl (%eax),%eax
c0001f35:	0f b7 d0             	movzwl %ax,%edx
c0001f38:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f3b:	83 c0 78             	add    $0x78,%eax
c0001f3e:	0f b7 00             	movzwl (%eax),%eax
c0001f41:	0f b7 c0             	movzwl %ax,%eax
c0001f44:	83 c0 10             	add    $0x10,%eax
c0001f47:	89 c1                	mov    %eax,%ecx
c0001f49:	d3 e2                	shl    %cl,%edx
c0001f4b:	89 d0                	mov    %edx,%eax
c0001f4d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0001f50:	90                   	nop
c0001f51:	c9                   	leave  
c0001f52:	c3                   	ret    

c0001f53 <print_dpt_entry>:
c0001f53:	55                   	push   %ebp
c0001f54:	89 e5                	mov    %esp,%ebp
c0001f56:	83 ec 08             	sub    $0x8,%esp
c0001f59:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f5c:	8b 40 08             	mov    0x8(%eax),%eax
c0001f5f:	83 ec 08             	sub    $0x8,%esp
c0001f62:	50                   	push   %eax
c0001f63:	68 ce a8 00 c0       	push   $0xc000a8ce
c0001f68:	e8 b2 6f 00 00       	call   c0008f1f <Printf>
c0001f6d:	83 c4 10             	add    $0x10,%esp
c0001f70:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f73:	8b 40 0c             	mov    0xc(%eax),%eax
c0001f76:	83 ec 08             	sub    $0x8,%esp
c0001f79:	50                   	push   %eax
c0001f7a:	68 d6 a8 00 c0       	push   $0xc000a8d6
c0001f7f:	e8 9b 6f 00 00       	call   c0008f1f <Printf>
c0001f84:	83 c4 10             	add    $0x10,%esp
c0001f87:	8b 45 08             	mov    0x8(%ebp),%eax
c0001f8a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
c0001f8e:	0f b6 c0             	movzbl %al,%eax
c0001f91:	83 ec 08             	sub    $0x8,%esp
c0001f94:	50                   	push   %eax
c0001f95:	68 e7 a8 00 c0       	push   $0xc000a8e7
c0001f9a:	e8 80 6f 00 00       	call   c0008f1f <Printf>
c0001f9f:	83 c4 10             	add    $0x10,%esp
c0001fa2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001fa5:	0f b6 00             	movzbl (%eax),%eax
c0001fa8:	0f b6 c0             	movzbl %al,%eax
c0001fab:	83 ec 08             	sub    $0x8,%esp
c0001fae:	50                   	push   %eax
c0001faf:	68 f5 a8 00 c0       	push   $0xc000a8f5
c0001fb4:	e8 66 6f 00 00       	call   c0008f1f <Printf>
c0001fb9:	83 c4 10             	add    $0x10,%esp
c0001fbc:	90                   	nop
c0001fbd:	c9                   	leave  
c0001fbe:	c3                   	ret    

c0001fbf <get_partition_table>:
c0001fbf:	55                   	push   %ebp
c0001fc0:	89 e5                	mov    %esp,%ebp
c0001fc2:	53                   	push   %ebx
c0001fc3:	83 ec 24             	sub    $0x24,%esp
c0001fc6:	89 e0                	mov    %esp,%eax
c0001fc8:	89 c3                	mov    %eax,%ebx
c0001fca:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
c0001fce:	c6 45 e2 01          	movb   $0x1,-0x1e(%ebp)
c0001fd2:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fd5:	88 45 e3             	mov    %al,-0x1d(%ebp)
c0001fd8:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fdb:	c1 f8 08             	sar    $0x8,%eax
c0001fde:	88 45 e4             	mov    %al,-0x1c(%ebp)
c0001fe1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fe4:	c1 f8 10             	sar    $0x10,%eax
c0001fe7:	88 45 e5             	mov    %al,-0x1b(%ebp)
c0001fea:	8b 45 0c             	mov    0xc(%ebp),%eax
c0001fed:	c1 f8 18             	sar    $0x18,%eax
c0001ff0:	89 c2                	mov    %eax,%edx
c0001ff2:	8b 45 08             	mov    0x8(%ebp),%eax
c0001ff5:	c1 e0 04             	shl    $0x4,%eax
c0001ff8:	09 d0                	or     %edx,%eax
c0001ffa:	83 c8 e0             	or     $0xffffffe0,%eax
c0001ffd:	88 45 e6             	mov    %al,-0x1a(%ebp)
c0002000:	c6 45 e7 20          	movb   $0x20,-0x19(%ebp)
c0002004:	83 ec 0c             	sub    $0xc,%esp
c0002007:	8d 45 e1             	lea    -0x1f(%ebp),%eax
c000200a:	50                   	push   %eax
c000200b:	e8 fc fb ff ff       	call   c0001c0c <hd_cmd_out>
c0002010:	83 c4 10             	add    $0x10,%esp
c0002013:	e8 79 03 00 00       	call   c0002391 <interrupt_wait>
c0002018:	c7 45 f4 00 02 00 00 	movl   $0x200,-0xc(%ebp)
c000201f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002022:	8d 50 ff             	lea    -0x1(%eax),%edx
c0002025:	89 55 f0             	mov    %edx,-0x10(%ebp)
c0002028:	89 c2                	mov    %eax,%edx
c000202a:	b8 10 00 00 00       	mov    $0x10,%eax
c000202f:	83 e8 01             	sub    $0x1,%eax
c0002032:	01 d0                	add    %edx,%eax
c0002034:	b9 10 00 00 00       	mov    $0x10,%ecx
c0002039:	ba 00 00 00 00       	mov    $0x0,%edx
c000203e:	f7 f1                	div    %ecx
c0002040:	6b c0 10             	imul   $0x10,%eax,%eax
c0002043:	29 c4                	sub    %eax,%esp
c0002045:	89 e0                	mov    %esp,%eax
c0002047:	83 c0 00             	add    $0x0,%eax
c000204a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000204d:	83 ec 04             	sub    $0x4,%esp
c0002050:	ff 75 f4             	pushl  -0xc(%ebp)
c0002053:	6a 00                	push   $0x0
c0002055:	ff 75 ec             	pushl  -0x14(%ebp)
c0002058:	e8 95 93 00 00       	call   c000b3f2 <Memset>
c000205d:	83 c4 10             	add    $0x10,%esp
c0002060:	83 ec 04             	sub    $0x4,%esp
c0002063:	ff 75 f4             	pushl  -0xc(%ebp)
c0002066:	ff 75 ec             	pushl  -0x14(%ebp)
c0002069:	68 f0 01 00 00       	push   $0x1f0
c000206e:	e8 d3 93 00 00       	call   c000b446 <read_port>
c0002073:	83 c4 10             	add    $0x10,%esp
c0002076:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0002079:	05 be 01 00 00       	add    $0x1be,%eax
c000207e:	83 ec 04             	sub    $0x4,%esp
c0002081:	6a 40                	push   $0x40
c0002083:	50                   	push   %eax
c0002084:	ff 75 10             	pushl  0x10(%ebp)
c0002087:	e8 38 93 00 00       	call   c000b3c4 <Memcpy>
c000208c:	83 c4 10             	add    $0x10,%esp
c000208f:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
c0002096:	89 dc                	mov    %ebx,%esp
c0002098:	90                   	nop
c0002099:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000209c:	c9                   	leave  
c000209d:	c3                   	ret    

c000209e <partition>:
c000209e:	55                   	push   %ebp
c000209f:	89 e5                	mov    %esp,%ebp
c00020a1:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00020a7:	8b 45 0c             	mov    0xc(%ebp),%eax
c00020aa:	88 45 84             	mov    %al,-0x7c(%ebp)
c00020ad:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c00020b1:	7f 19                	jg     c00020cc <partition+0x2e>
c00020b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00020b6:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00020bb:	89 c8                	mov    %ecx,%eax
c00020bd:	f7 ea                	imul   %edx
c00020bf:	d1 fa                	sar    %edx
c00020c1:	89 c8                	mov    %ecx,%eax
c00020c3:	c1 f8 1f             	sar    $0x1f,%eax
c00020c6:	29 c2                	sub    %eax,%edx
c00020c8:	89 d0                	mov    %edx,%eax
c00020ca:	eb 11                	jmp    c00020dd <partition+0x3f>
c00020cc:	8b 45 08             	mov    0x8(%ebp),%eax
c00020cf:	83 e8 10             	sub    $0x10,%eax
c00020d2:	8d 50 3f             	lea    0x3f(%eax),%edx
c00020d5:	85 c0                	test   %eax,%eax
c00020d7:	0f 48 c2             	cmovs  %edx,%eax
c00020da:	c1 f8 06             	sar    $0x6,%eax
c00020dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00020e0:	80 7d 84 00          	cmpb   $0x0,-0x7c(%ebp)
c00020e4:	0f 85 cc 00 00 00    	jne    c00021b6 <partition+0x118>
c00020ea:	83 ec 04             	sub    $0x4,%esp
c00020ed:	6a 40                	push   $0x40
c00020ef:	6a 00                	push   $0x0
c00020f1:	8d 45 94             	lea    -0x6c(%ebp),%eax
c00020f4:	50                   	push   %eax
c00020f5:	e8 f8 92 00 00       	call   c000b3f2 <Memset>
c00020fa:	83 c4 10             	add    $0x10,%esp
c00020fd:	83 ec 04             	sub    $0x4,%esp
c0002100:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002103:	50                   	push   %eax
c0002104:	6a 00                	push   $0x0
c0002106:	ff 75 e8             	pushl  -0x18(%ebp)
c0002109:	e8 b1 fe ff ff       	call   c0001fbf <get_partition_table>
c000210e:	83 c4 10             	add    $0x10,%esp
c0002111:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0002118:	e9 8a 00 00 00       	jmp    c00021a7 <partition+0x109>
c000211d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002120:	83 c0 01             	add    $0x1,%eax
c0002123:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0002126:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002129:	c1 e0 04             	shl    $0x4,%eax
c000212c:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c000212f:	01 c8                	add    %ecx,%eax
c0002131:	83 e8 5c             	sub    $0x5c,%eax
c0002134:	8b 00                	mov    (%eax),%eax
c0002136:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0002139:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000213c:	c1 e1 03             	shl    $0x3,%ecx
c000213f:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002145:	01 ca                	add    %ecx,%edx
c0002147:	81 c2 44 1f 01 c0    	add    $0xc0011f44,%edx
c000214d:	89 02                	mov    %eax,(%edx)
c000214f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002152:	c1 e0 04             	shl    $0x4,%eax
c0002155:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002158:	01 c8                	add    %ecx,%eax
c000215a:	83 e8 58             	sub    $0x58,%eax
c000215d:	8b 00                	mov    (%eax),%eax
c000215f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
c0002162:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002165:	c1 e1 03             	shl    $0x3,%ecx
c0002168:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c000216e:	01 ca                	add    %ecx,%edx
c0002170:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c0002176:	89 02                	mov    %eax,(%edx)
c0002178:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000217b:	c1 e0 04             	shl    $0x4,%eax
c000217e:	8d 4d f8             	lea    -0x8(%ebp),%ecx
c0002181:	01 c8                	add    %ecx,%eax
c0002183:	83 e8 60             	sub    $0x60,%eax
c0002186:	0f b6 00             	movzbl (%eax),%eax
c0002189:	3c 05                	cmp    $0x5,%al
c000218b:	75 16                	jne    c00021a3 <partition+0x105>
c000218d:	8b 55 08             	mov    0x8(%ebp),%edx
c0002190:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002193:	01 d0                	add    %edx,%eax
c0002195:	83 ec 08             	sub    $0x8,%esp
c0002198:	6a 01                	push   $0x1
c000219a:	50                   	push   %eax
c000219b:	e8 fe fe ff ff       	call   c000209e <partition>
c00021a0:	83 c4 10             	add    $0x10,%esp
c00021a3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00021a7:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c00021ab:	0f 8e 6c ff ff ff    	jle    c000211d <partition+0x7f>
c00021b1:	e9 ff 00 00 00       	jmp    c00022b5 <partition+0x217>
c00021b6:	80 7d 84 01          	cmpb   $0x1,-0x7c(%ebp)
c00021ba:	0f 85 f5 00 00 00    	jne    c00022b5 <partition+0x217>
c00021c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
c00021c3:	ba 67 66 66 66       	mov    $0x66666667,%edx
c00021c8:	89 c8                	mov    %ecx,%eax
c00021ca:	f7 ea                	imul   %edx
c00021cc:	d1 fa                	sar    %edx
c00021ce:	89 c8                	mov    %ecx,%eax
c00021d0:	c1 f8 1f             	sar    $0x1f,%eax
c00021d3:	29 c2                	sub    %eax,%edx
c00021d5:	89 d0                	mov    %edx,%eax
c00021d7:	c1 e0 02             	shl    $0x2,%eax
c00021da:	01 d0                	add    %edx,%eax
c00021dc:	29 c1                	sub    %eax,%ecx
c00021de:	89 c8                	mov    %ecx,%eax
c00021e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00021e3:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00021e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00021e9:	c1 e2 03             	shl    $0x3,%edx
c00021ec:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00021f2:	01 d0                	add    %edx,%eax
c00021f4:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c00021f9:	8b 00                	mov    (%eax),%eax
c00021fb:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00021fe:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002201:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002204:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002207:	83 e8 01             	sub    $0x1,%eax
c000220a:	c1 e0 04             	shl    $0x4,%eax
c000220d:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0002210:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0002217:	e9 8c 00 00 00       	jmp    c00022a8 <partition+0x20a>
c000221c:	83 ec 04             	sub    $0x4,%esp
c000221f:	6a 40                	push   $0x40
c0002221:	6a 00                	push   $0x0
c0002223:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002226:	50                   	push   %eax
c0002227:	e8 c6 91 00 00       	call   c000b3f2 <Memset>
c000222c:	83 c4 10             	add    $0x10,%esp
c000222f:	83 ec 04             	sub    $0x4,%esp
c0002232:	8d 45 94             	lea    -0x6c(%ebp),%eax
c0002235:	50                   	push   %eax
c0002236:	ff 75 f0             	pushl  -0x10(%ebp)
c0002239:	ff 75 e8             	pushl  -0x18(%ebp)
c000223c:	e8 7e fd ff ff       	call   c0001fbf <get_partition_table>
c0002241:	83 c4 10             	add    $0x10,%esp
c0002244:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0002247:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000224a:	01 d0                	add    %edx,%eax
c000224c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c000224f:	8b 55 9c             	mov    -0x64(%ebp),%edx
c0002252:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002255:	01 c2                	add    %eax,%edx
c0002257:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000225a:	8d 48 04             	lea    0x4(%eax),%ecx
c000225d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002260:	c1 e1 03             	shl    $0x3,%ecx
c0002263:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002269:	01 c8                	add    %ecx,%eax
c000226b:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002270:	89 10                	mov    %edx,(%eax)
c0002272:	8b 45 a0             	mov    -0x60(%ebp),%eax
c0002275:	8b 55 d4             	mov    -0x2c(%ebp),%edx
c0002278:	8d 4a 04             	lea    0x4(%edx),%ecx
c000227b:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000227e:	c1 e1 03             	shl    $0x3,%ecx
c0002281:	69 d2 24 02 00 00    	imul   $0x224,%edx,%edx
c0002287:	01 ca                	add    %ecx,%edx
c0002289:	81 c2 48 1f 01 c0    	add    $0xc0011f48,%edx
c000228f:	89 02                	mov    %eax,(%edx)
c0002291:	0f b6 45 a8          	movzbl -0x58(%ebp),%eax
c0002295:	84 c0                	test   %al,%al
c0002297:	74 1b                	je     c00022b4 <partition+0x216>
c0002299:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000229c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000229f:	01 d0                	add    %edx,%eax
c00022a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00022a4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c00022a8:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
c00022ac:	0f 8e 6a ff ff ff    	jle    c000221c <partition+0x17e>
c00022b2:	eb 01                	jmp    c00022b5 <partition+0x217>
c00022b4:	90                   	nop
c00022b5:	90                   	nop
c00022b6:	c9                   	leave  
c00022b7:	c3                   	ret    

c00022b8 <hd_open>:
c00022b8:	55                   	push   %ebp
c00022b9:	89 e5                	mov    %esp,%ebp
c00022bb:	83 ec 18             	sub    $0x18,%esp
c00022be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00022c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022c8:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022ce:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c00022d3:	8b 00                	mov    (%eax),%eax
c00022d5:	8d 50 01             	lea    0x1(%eax),%edx
c00022d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00022db:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c00022e1:	05 40 1f 01 c0       	add    $0xc0011f40,%eax
c00022e6:	89 10                	mov    %edx,(%eax)
c00022e8:	83 ec 0c             	sub    $0xc,%esp
c00022eb:	6a 00                	push   $0x0
c00022ed:	e8 1c fa ff ff       	call   c0001d0e <hd_identify>
c00022f2:	83 c4 10             	add    $0x10,%esp
c00022f5:	83 ec 08             	sub    $0x8,%esp
c00022f8:	6a 00                	push   $0x0
c00022fa:	6a 00                	push   $0x0
c00022fc:	e8 9d fd ff ff       	call   c000209e <partition>
c0002301:	83 c4 10             	add    $0x10,%esp
c0002304:	90                   	nop
c0002305:	c9                   	leave  
c0002306:	c3                   	ret    

c0002307 <get_hd_ioctl>:
c0002307:	55                   	push   %ebp
c0002308:	89 e5                	mov    %esp,%ebp
c000230a:	83 ec 10             	sub    $0x10,%esp
c000230d:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
c0002311:	7f 19                	jg     c000232c <get_hd_ioctl+0x25>
c0002313:	8b 4d 08             	mov    0x8(%ebp),%ecx
c0002316:	ba 67 66 66 66       	mov    $0x66666667,%edx
c000231b:	89 c8                	mov    %ecx,%eax
c000231d:	f7 ea                	imul   %edx
c000231f:	d1 fa                	sar    %edx
c0002321:	89 c8                	mov    %ecx,%eax
c0002323:	c1 f8 1f             	sar    $0x1f,%eax
c0002326:	29 c2                	sub    %eax,%edx
c0002328:	89 d0                	mov    %edx,%eax
c000232a:	eb 11                	jmp    c000233d <get_hd_ioctl+0x36>
c000232c:	8b 45 08             	mov    0x8(%ebp),%eax
c000232f:	83 e8 10             	sub    $0x10,%eax
c0002332:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002335:	85 c0                	test   %eax,%eax
c0002337:	0f 48 c2             	cmovs  %edx,%eax
c000233a:	c1 f8 06             	sar    $0x6,%eax
c000233d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0002340:	8b 55 08             	mov    0x8(%ebp),%edx
c0002343:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0002346:	c1 e2 03             	shl    $0x3,%edx
c0002349:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c000234f:	01 d0                	add    %edx,%eax
c0002351:	05 48 1f 01 c0       	add    $0xc0011f48,%eax
c0002356:	8b 00                	mov    (%eax),%eax
c0002358:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000235b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000235e:	c9                   	leave  
c000235f:	c3                   	ret    

c0002360 <wait_for>:
c0002360:	55                   	push   %ebp
c0002361:	89 e5                	mov    %esp,%ebp
c0002363:	83 ec 08             	sub    $0x8,%esp
c0002366:	83 ec 04             	sub    $0x4,%esp
c0002369:	68 20 4e 00 00       	push   $0x4e20
c000236e:	6a 08                	push   $0x8
c0002370:	6a 08                	push   $0x8
c0002372:	e8 f6 02 00 00       	call   c000266d <waitfor>
c0002377:	83 c4 10             	add    $0x10,%esp
c000237a:	85 c0                	test   %eax,%eax
c000237c:	75 10                	jne    c000238e <wait_for+0x2e>
c000237e:	83 ec 0c             	sub    $0xc,%esp
c0002381:	68 00 a9 00 c0       	push   $0xc000a900
c0002386:	e8 ea 6e 00 00       	call   c0009275 <panic>
c000238b:	83 c4 10             	add    $0x10,%esp
c000238e:	90                   	nop
c000238f:	c9                   	leave  
c0002390:	c3                   	ret    

c0002391 <interrupt_wait>:
c0002391:	55                   	push   %ebp
c0002392:	89 e5                	mov    %esp,%ebp
c0002394:	83 ec 18             	sub    $0x18,%esp
c0002397:	83 ec 0c             	sub    $0xc,%esp
c000239a:	6a 6c                	push   $0x6c
c000239c:	e8 3d 4b 00 00       	call   c0006ede <sys_malloc>
c00023a1:	83 c4 10             	add    $0x10,%esp
c00023a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00023a7:	83 ec 04             	sub    $0x4,%esp
c00023aa:	6a 6c                	push   $0x6c
c00023ac:	6a 00                	push   $0x0
c00023ae:	ff 75 f4             	pushl  -0xc(%ebp)
c00023b1:	e8 3c 90 00 00       	call   c000b3f2 <Memset>
c00023b6:	83 c4 10             	add    $0x10,%esp
c00023b9:	83 ec 04             	sub    $0x4,%esp
c00023bc:	68 13 02 00 00       	push   $0x213
c00023c1:	ff 75 f4             	pushl  -0xc(%ebp)
c00023c4:	6a 02                	push   $0x2
c00023c6:	e8 13 77 00 00       	call   c0009ade <send_rec>
c00023cb:	83 c4 10             	add    $0x10,%esp
c00023ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00023d1:	83 ec 08             	sub    $0x8,%esp
c00023d4:	6a 6c                	push   $0x6c
c00023d6:	50                   	push   %eax
c00023d7:	e8 e1 4d 00 00       	call   c00071bd <sys_free>
c00023dc:	83 c4 10             	add    $0x10,%esp
c00023df:	90                   	nop
c00023e0:	c9                   	leave  
c00023e1:	c3                   	ret    

c00023e2 <hd_rdwt>:
c00023e2:	55                   	push   %ebp
c00023e3:	89 e5                	mov    %esp,%ebp
c00023e5:	83 ec 48             	sub    $0x48,%esp
c00023e8:	8b 45 08             	mov    0x8(%ebp),%eax
c00023eb:	8b 40 18             	mov    0x18(%eax),%eax
c00023ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00023f1:	8b 45 08             	mov    0x8(%ebp),%eax
c00023f4:	8b 40 14             	mov    0x14(%eax),%eax
c00023f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00023fa:	83 7d e8 09          	cmpl   $0x9,-0x18(%ebp)
c00023fe:	7f 19                	jg     c0002419 <hd_rdwt+0x37>
c0002400:	8b 4d e8             	mov    -0x18(%ebp),%ecx
c0002403:	ba 67 66 66 66       	mov    $0x66666667,%edx
c0002408:	89 c8                	mov    %ecx,%eax
c000240a:	f7 ea                	imul   %edx
c000240c:	d1 fa                	sar    %edx
c000240e:	89 c8                	mov    %ecx,%eax
c0002410:	c1 f8 1f             	sar    $0x1f,%eax
c0002413:	29 c2                	sub    %eax,%edx
c0002415:	89 d0                	mov    %edx,%eax
c0002417:	eb 11                	jmp    c000242a <hd_rdwt+0x48>
c0002419:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000241c:	83 e8 10             	sub    $0x10,%eax
c000241f:	8d 50 3f             	lea    0x3f(%eax),%edx
c0002422:	85 c0                	test   %eax,%eax
c0002424:	0f 48 c2             	cmovs  %edx,%eax
c0002427:	c1 f8 06             	sar    $0x6,%eax
c000242a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000242d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002430:	8d 50 f0             	lea    -0x10(%eax),%edx
c0002433:	89 d0                	mov    %edx,%eax
c0002435:	c1 f8 1f             	sar    $0x1f,%eax
c0002438:	c1 e8 1a             	shr    $0x1a,%eax
c000243b:	01 c2                	add    %eax,%edx
c000243d:	83 e2 3f             	and    $0x3f,%edx
c0002440:	29 c2                	sub    %eax,%edx
c0002442:	89 d0                	mov    %edx,%eax
c0002444:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0002447:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000244a:	c1 e8 09             	shr    $0x9,%eax
c000244d:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002450:	83 7d e8 08          	cmpl   $0x8,-0x18(%ebp)
c0002454:	7f 1a                	jg     c0002470 <hd_rdwt+0x8e>
c0002456:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0002459:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000245c:	c1 e2 03             	shl    $0x3,%edx
c000245f:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002465:	01 d0                	add    %edx,%eax
c0002467:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c000246c:	8b 00                	mov    (%eax),%eax
c000246e:	eb 1b                	jmp    c000248b <hd_rdwt+0xa9>
c0002470:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0002473:	8d 50 04             	lea    0x4(%eax),%edx
c0002476:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0002479:	c1 e2 03             	shl    $0x3,%edx
c000247c:	69 c0 24 02 00 00    	imul   $0x224,%eax,%eax
c0002482:	01 d0                	add    %edx,%eax
c0002484:	05 44 1f 01 c0       	add    $0xc0011f44,%eax
c0002489:	8b 00                	mov    (%eax),%eax
c000248b:	8b 55 dc             	mov    -0x24(%ebp),%edx
c000248e:	01 d0                	add    %edx,%eax
c0002490:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0002493:	8b 45 08             	mov    0x8(%ebp),%eax
c0002496:	8b 40 0c             	mov    0xc(%eax),%eax
c0002499:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000249c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000249f:	05 ff 01 00 00       	add    $0x1ff,%eax
c00024a4:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00024aa:	85 c0                	test   %eax,%eax
c00024ac:	0f 48 c2             	cmovs  %edx,%eax
c00024af:	c1 f8 09             	sar    $0x9,%eax
c00024b2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00024b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00024bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00024be:	8b 40 10             	mov    0x10(%eax),%eax
c00024c1:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00024c4:	8b 45 08             	mov    0x8(%ebp),%eax
c00024c7:	8b 00                	mov    (%eax),%eax
c00024c9:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00024cc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00024cf:	83 ec 08             	sub    $0x8,%esp
c00024d2:	50                   	push   %eax
c00024d3:	ff 75 d0             	pushl  -0x30(%ebp)
c00024d6:	e8 c2 48 00 00       	call   c0006d9d <alloc_virtual_memory>
c00024db:	83 c4 10             	add    $0x10,%esp
c00024de:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00024e1:	8b 45 08             	mov    0x8(%ebp),%eax
c00024e4:	8b 40 68             	mov    0x68(%eax),%eax
c00024e7:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00024ea:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00024ee:	74 22                	je     c0002512 <hd_rdwt+0x130>
c00024f0:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c00024f4:	74 1c                	je     c0002512 <hd_rdwt+0x130>
c00024f6:	68 a3 01 00 00       	push   $0x1a3
c00024fb:	68 64 a8 00 c0       	push   $0xc000a864
c0002500:	68 64 a8 00 c0       	push   $0xc000a864
c0002505:	68 12 a9 00 c0       	push   $0xc000a912
c000250a:	e8 84 6d 00 00       	call   c0009293 <assertion_failure>
c000250f:	83 c4 10             	add    $0x10,%esp
c0002512:	c6 45 bd 00          	movb   $0x0,-0x43(%ebp)
c0002516:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0002519:	88 45 be             	mov    %al,-0x42(%ebp)
c000251c:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000251f:	88 45 bf             	mov    %al,-0x41(%ebp)
c0002522:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002525:	c1 f8 08             	sar    $0x8,%eax
c0002528:	88 45 c0             	mov    %al,-0x40(%ebp)
c000252b:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000252e:	c1 f8 10             	sar    $0x10,%eax
c0002531:	88 45 c1             	mov    %al,-0x3f(%ebp)
c0002534:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0002537:	c1 f8 18             	sar    $0x18,%eax
c000253a:	83 e0 0f             	and    $0xf,%eax
c000253d:	83 c8 e0             	or     $0xffffffe0,%eax
c0002540:	88 45 c2             	mov    %al,-0x3e(%ebp)
c0002543:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c0002547:	75 07                	jne    c0002550 <hd_rdwt+0x16e>
c0002549:	b8 20 00 00 00       	mov    $0x20,%eax
c000254e:	eb 05                	jmp    c0002555 <hd_rdwt+0x173>
c0002550:	b8 30 00 00 00       	mov    $0x30,%eax
c0002555:	88 45 c3             	mov    %al,-0x3d(%ebp)
c0002558:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c000255c:	3c 20                	cmp    $0x20,%al
c000255e:	74 24                	je     c0002584 <hd_rdwt+0x1a2>
c0002560:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
c0002564:	3c 30                	cmp    $0x30,%al
c0002566:	74 1c                	je     c0002584 <hd_rdwt+0x1a2>
c0002568:	68 b1 01 00 00       	push   $0x1b1
c000256d:	68 64 a8 00 c0       	push   $0xc000a864
c0002572:	68 64 a8 00 c0       	push   $0xc000a864
c0002577:	68 30 a9 00 c0       	push   $0xc000a930
c000257c:	e8 12 6d 00 00       	call   c0009293 <assertion_failure>
c0002581:	83 c4 10             	add    $0x10,%esp
c0002584:	83 ec 0c             	sub    $0xc,%esp
c0002587:	8d 45 bd             	lea    -0x43(%ebp),%eax
c000258a:	50                   	push   %eax
c000258b:	e8 7c f6 ff ff       	call   c0001c0c <hd_cmd_out>
c0002590:	83 c4 10             	add    $0x10,%esp
c0002593:	e9 9c 00 00 00       	jmp    c0002634 <hd_rdwt+0x252>
c0002598:	b8 00 02 00 00       	mov    $0x200,%eax
c000259d:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
c00025a4:	0f 4e 45 f4          	cmovle -0xc(%ebp),%eax
c00025a8:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00025ab:	83 7d c8 07          	cmpl   $0x7,-0x38(%ebp)
c00025af:	75 51                	jne    c0002602 <hd_rdwt+0x220>
c00025b1:	e8 aa fd ff ff       	call   c0002360 <wait_for>
c00025b6:	e8 d6 fd ff ff       	call   c0002391 <interrupt_wait>
c00025bb:	83 ec 04             	sub    $0x4,%esp
c00025be:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025c1:	6a 00                	push   $0x0
c00025c3:	68 80 21 01 c0       	push   $0xc0012180
c00025c8:	e8 25 8e 00 00       	call   c000b3f2 <Memset>
c00025cd:	83 c4 10             	add    $0x10,%esp
c00025d0:	83 ec 04             	sub    $0x4,%esp
c00025d3:	68 00 02 00 00       	push   $0x200
c00025d8:	68 80 21 01 c0       	push   $0xc0012180
c00025dd:	68 f0 01 00 00       	push   $0x1f0
c00025e2:	e8 5f 8e 00 00       	call   c000b446 <read_port>
c00025e7:	83 c4 10             	add    $0x10,%esp
c00025ea:	83 ec 04             	sub    $0x4,%esp
c00025ed:	ff 75 c4             	pushl  -0x3c(%ebp)
c00025f0:	68 80 21 01 c0       	push   $0xc0012180
c00025f5:	ff 75 f0             	pushl  -0x10(%ebp)
c00025f8:	e8 c7 8d 00 00       	call   c000b3c4 <Memcpy>
c00025fd:	83 c4 10             	add    $0x10,%esp
c0002600:	eb 26                	jmp    c0002628 <hd_rdwt+0x246>
c0002602:	83 7d c8 0a          	cmpl   $0xa,-0x38(%ebp)
c0002606:	75 20                	jne    c0002628 <hd_rdwt+0x246>
c0002608:	e8 53 fd ff ff       	call   c0002360 <wait_for>
c000260d:	83 ec 04             	sub    $0x4,%esp
c0002610:	ff 75 c4             	pushl  -0x3c(%ebp)
c0002613:	ff 75 f0             	pushl  -0x10(%ebp)
c0002616:	68 f0 01 00 00       	push   $0x1f0
c000261b:	e8 3a 8e 00 00       	call   c000b45a <write_port>
c0002620:	83 c4 10             	add    $0x10,%esp
c0002623:	e8 69 fd ff ff       	call   c0002391 <interrupt_wait>
c0002628:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c000262b:	29 45 f4             	sub    %eax,-0xc(%ebp)
c000262e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0002631:	01 45 f0             	add    %eax,-0x10(%ebp)
c0002634:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0002638:	0f 85 5a ff ff ff    	jne    c0002598 <hd_rdwt+0x1b6>
c000263e:	90                   	nop
c000263f:	c9                   	leave  
c0002640:	c3                   	ret    

c0002641 <hd_handler>:
c0002641:	55                   	push   %ebp
c0002642:	89 e5                	mov    %esp,%ebp
c0002644:	83 ec 18             	sub    $0x18,%esp
c0002647:	83 ec 0c             	sub    $0xc,%esp
c000264a:	68 f7 01 00 00       	push   $0x1f7
c000264f:	e8 36 f1 ff ff       	call   c000178a <in_byte>
c0002654:	83 c4 10             	add    $0x10,%esp
c0002657:	0f b6 c0             	movzbl %al,%eax
c000265a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000265d:	83 ec 0c             	sub    $0xc,%esp
c0002660:	6a 03                	push   $0x3
c0002662:	e8 06 77 00 00       	call   c0009d6d <inform_int>
c0002667:	83 c4 10             	add    $0x10,%esp
c000266a:	90                   	nop
c000266b:	c9                   	leave  
c000266c:	c3                   	ret    

c000266d <waitfor>:
c000266d:	55                   	push   %ebp
c000266e:	89 e5                	mov    %esp,%ebp
c0002670:	83 ec 18             	sub    $0x18,%esp
c0002673:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000267a:	eb 26                	jmp    c00026a2 <waitfor+0x35>
c000267c:	83 ec 0c             	sub    $0xc,%esp
c000267f:	68 f7 01 00 00       	push   $0x1f7
c0002684:	e8 01 f1 ff ff       	call   c000178a <in_byte>
c0002689:	83 c4 10             	add    $0x10,%esp
c000268c:	0f b6 c0             	movzbl %al,%eax
c000268f:	23 45 08             	and    0x8(%ebp),%eax
c0002692:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0002695:	75 07                	jne    c000269e <waitfor+0x31>
c0002697:	b8 01 00 00 00       	mov    $0x1,%eax
c000269c:	eb 11                	jmp    c00026af <waitfor+0x42>
c000269e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00026a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026a5:	3b 45 10             	cmp    0x10(%ebp),%eax
c00026a8:	7c d2                	jl     c000267c <waitfor+0xf>
c00026aa:	b8 00 00 00 00       	mov    $0x0,%eax
c00026af:	c9                   	leave  
c00026b0:	c3                   	ret    

c00026b1 <print_hd_info>:
c00026b1:	55                   	push   %ebp
c00026b2:	89 e5                	mov    %esp,%ebp
c00026b4:	83 ec 18             	sub    $0x18,%esp
c00026b7:	83 ec 0c             	sub    $0xc,%esp
c00026ba:	68 64 a9 00 c0       	push   $0xc000a964
c00026bf:	e8 5b 68 00 00       	call   c0008f1f <Printf>
c00026c4:	83 c4 10             	add    $0x10,%esp
c00026c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00026ce:	eb 3b                	jmp    c000270b <print_hd_info+0x5a>
c00026d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026d3:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c00026da:	85 c0                	test   %eax,%eax
c00026dc:	74 28                	je     c0002706 <print_hd_info+0x55>
c00026de:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026e1:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c00026e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00026eb:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c00026f2:	ff 75 f4             	pushl  -0xc(%ebp)
c00026f5:	52                   	push   %edx
c00026f6:	50                   	push   %eax
c00026f7:	68 81 a9 00 c0       	push   $0xc000a981
c00026fc:	e8 1e 68 00 00       	call   c0008f1f <Printf>
c0002701:	83 c4 10             	add    $0x10,%esp
c0002704:	eb 01                	jmp    c0002707 <print_hd_info+0x56>
c0002706:	90                   	nop
c0002707:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000270b:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
c000270f:	7e bf                	jle    c00026d0 <print_hd_info+0x1f>
c0002711:	83 ec 0c             	sub    $0xc,%esp
c0002714:	68 99 a9 00 c0       	push   $0xc000a999
c0002719:	e8 01 68 00 00       	call   c0008f1f <Printf>
c000271e:	83 c4 10             	add    $0x10,%esp
c0002721:	83 ec 0c             	sub    $0xc,%esp
c0002724:	68 b4 a9 00 c0       	push   $0xc000a9b4
c0002729:	e8 f1 67 00 00       	call   c0008f1f <Printf>
c000272e:	83 c4 10             	add    $0x10,%esp
c0002731:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
c0002738:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000273f:	eb 44                	jmp    c0002785 <print_hd_info+0xd4>
c0002741:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002744:	83 c0 04             	add    $0x4,%eax
c0002747:	8b 04 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%eax
c000274e:	85 c0                	test   %eax,%eax
c0002750:	74 2e                	je     c0002780 <print_hd_info+0xcf>
c0002752:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002755:	83 c0 04             	add    $0x4,%eax
c0002758:	8b 14 c5 48 1f 01 c0 	mov    -0x3ffee0b8(,%eax,8),%edx
c000275f:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0002762:	83 c0 04             	add    $0x4,%eax
c0002765:	8b 04 c5 44 1f 01 c0 	mov    -0x3ffee0bc(,%eax,8),%eax
c000276c:	ff 75 f0             	pushl  -0x10(%ebp)
c000276f:	52                   	push   %edx
c0002770:	50                   	push   %eax
c0002771:	68 81 a9 00 c0       	push   $0xc000a981
c0002776:	e8 a4 67 00 00       	call   c0008f1f <Printf>
c000277b:	83 c4 10             	add    $0x10,%esp
c000277e:	eb 01                	jmp    c0002781 <print_hd_info+0xd0>
c0002780:	90                   	nop
c0002781:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0002785:	83 7d f0 3f          	cmpl   $0x3f,-0x10(%ebp)
c0002789:	7e b6                	jle    c0002741 <print_hd_info+0x90>
c000278b:	83 ec 0c             	sub    $0xc,%esp
c000278e:	68 d1 a9 00 c0       	push   $0xc000a9d1
c0002793:	e8 87 67 00 00       	call   c0008f1f <Printf>
c0002798:	83 c4 10             	add    $0x10,%esp
c000279b:	90                   	nop
c000279c:	c9                   	leave  
c000279d:	c3                   	ret    

c000279e <is_empty>:
c000279e:	55                   	push   %ebp
c000279f:	89 e5                	mov    %esp,%ebp
c00027a1:	83 ec 10             	sub    $0x10,%esp
c00027a4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c00027ab:	eb 1a                	jmp    c00027c7 <is_empty+0x29>
c00027ad:	8b 55 fc             	mov    -0x4(%ebp),%edx
c00027b0:	8b 45 08             	mov    0x8(%ebp),%eax
c00027b3:	01 d0                	add    %edx,%eax
c00027b5:	0f b6 00             	movzbl (%eax),%eax
c00027b8:	84 c0                	test   %al,%al
c00027ba:	74 07                	je     c00027c3 <is_empty+0x25>
c00027bc:	b8 00 00 00 00       	mov    $0x0,%eax
c00027c1:	eb 11                	jmp    c00027d4 <is_empty+0x36>
c00027c3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c00027c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00027ca:	3b 45 0c             	cmp    0xc(%ebp),%eax
c00027cd:	7c de                	jl     c00027ad <is_empty+0xf>
c00027cf:	b8 01 00 00 00       	mov    $0x1,%eax
c00027d4:	c9                   	leave  
c00027d5:	c3                   	ret    
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
c000285a:	e8 37 f0 ff ff       	call   c0001896 <get_running_thread_pcb>
c000285f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002862:	e8 87 08 00 00       	call   c00030ee <init_fs>
c0002867:	83 ec 0c             	sub    $0xc,%esp
c000286a:	6a 6c                	push   $0x6c
c000286c:	e8 6d 46 00 00       	call   c0006ede <sys_malloc>
c0002871:	83 c4 10             	add    $0x10,%esp
c0002874:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0002877:	83 ec 0c             	sub    $0xc,%esp
c000287a:	6a 6c                	push   $0x6c
c000287c:	e8 5d 46 00 00       	call   c0006ede <sys_malloc>
c0002881:	83 c4 10             	add    $0x10,%esp
c0002884:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0002887:	83 ec 04             	sub    $0x4,%esp
c000288a:	6a 6c                	push   $0x6c
c000288c:	6a 00                	push   $0x0
c000288e:	ff 75 f0             	pushl  -0x10(%ebp)
c0002891:	e8 5c 8b 00 00       	call   c000b3f2 <Memset>
c0002896:	83 c4 10             	add    $0x10,%esp
c0002899:	83 ec 04             	sub    $0x4,%esp
c000289c:	6a 0e                	push   $0xe
c000289e:	ff 75 f0             	pushl  -0x10(%ebp)
c00028a1:	6a 02                	push   $0x2
c00028a3:	e8 36 72 00 00       	call   c0009ade <send_rec>
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
c00028eb:	e8 32 21 00 00       	call   c0004a22 <pid2proc>
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
c000292c:	e8 26 51 00 00       	call   c0007a57 <disp_int>
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
c000295a:	68 f0 a9 00 c0       	push   $0xc000a9f0
c000295f:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0002964:	68 00 aa 00 c0       	push   $0xc000aa00
c0002969:	e8 25 69 00 00       	call   c0009293 <assertion_failure>
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
c00029d4:	e8 05 71 00 00       	call   c0009ade <send_rec>
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
c0002a10:	e8 c9 70 00 00       	call   c0009ade <send_rec>
c0002a15:	83 c4 10             	add    $0x10,%esp
c0002a18:	eb 13                	jmp    c0002a2d <task_fs+0x1d9>
c0002a1a:	83 ec 0c             	sub    $0xc,%esp
c0002a1d:	68 63 aa 00 c0       	push   $0xc000aa63
c0002a22:	e8 4e 68 00 00       	call   c0009275 <panic>
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
c0002a3d:	e8 9c 44 00 00       	call   c0006ede <sys_malloc>
c0002a42:	83 c4 10             	add    $0x10,%esp
c0002a45:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0002a48:	83 ec 04             	sub    $0x4,%esp
c0002a4b:	6a 6c                	push   $0x6c
c0002a4d:	6a 00                	push   $0x0
c0002a4f:	ff 75 f4             	pushl  -0xc(%ebp)
c0002a52:	e8 9b 89 00 00       	call   c000b3f2 <Memset>
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
c0002a9d:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0002aa2:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0002aa7:	68 76 aa 00 c0       	push   $0xc000aa76
c0002aac:	e8 e2 67 00 00       	call   c0009293 <assertion_failure>
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
c0002acf:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0002ad4:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0002ad9:	68 94 aa 00 c0       	push   $0xc000aa94
c0002ade:	e8 b0 67 00 00       	call   c0009293 <assertion_failure>
c0002ae3:	83 c4 10             	add    $0x10,%esp
c0002ae6:	83 ec 04             	sub    $0x4,%esp
c0002ae9:	6a 03                	push   $0x3
c0002aeb:	ff 75 f4             	pushl  -0xc(%ebp)
c0002aee:	6a 03                	push   $0x3
c0002af0:	e8 e9 6f 00 00       	call   c0009ade <send_rec>
c0002af5:	83 c4 10             	add    $0x10,%esp
c0002af8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0002afb:	83 ec 08             	sub    $0x8,%esp
c0002afe:	6a 6c                	push   $0x6c
c0002b00:	50                   	push   %eax
c0002b01:	e8 b7 46 00 00       	call   c00071bd <sys_free>
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
c0002b1e:	e8 bb 43 00 00       	call   c0006ede <sys_malloc>
c0002b23:	83 c4 10             	add    $0x10,%esp
c0002b26:	a3 a4 31 01 c0       	mov    %eax,0xc00131a4
c0002b2b:	83 ec 0c             	sub    $0xc,%esp
c0002b2e:	6a 24                	push   $0x24
c0002b30:	e8 a9 43 00 00       	call   c0006ede <sys_malloc>
c0002b35:	83 c4 10             	add    $0x10,%esp
c0002b38:	a3 a0 31 01 c0       	mov    %eax,0xc00131a0
c0002b3d:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b42:	83 ec 0c             	sub    $0xc,%esp
c0002b45:	50                   	push   %eax
c0002b46:	e8 bf 42 00 00       	call   c0006e0a <get_physical_address>
c0002b4b:	83 c4 10             	add    $0x10,%esp
c0002b4e:	a3 84 27 01 c0       	mov    %eax,0xc0012784
c0002b53:	a1 a0 31 01 c0       	mov    0xc00131a0,%eax
c0002b58:	83 ec 0c             	sub    $0xc,%esp
c0002b5b:	50                   	push   %eax
c0002b5c:	e8 a9 42 00 00       	call   c0006e0a <get_physical_address>
c0002b61:	83 c4 10             	add    $0x10,%esp
c0002b64:	a3 80 27 01 c0       	mov    %eax,0xc0012780
c0002b69:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002b6e:	83 ec 04             	sub    $0x4,%esp
c0002b71:	68 00 02 00 00       	push   $0x200
c0002b76:	6a 00                	push   $0x0
c0002b78:	50                   	push   %eax
c0002b79:	e8 74 88 00 00       	call   c000b3f2 <Memset>
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
c0002c0c:	e8 e1 87 00 00       	call   c000b3f2 <Memset>
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
c0002c7c:	e8 71 87 00 00       	call   c000b3f2 <Memset>
c0002c81:	83 c4 10             	add    $0x10,%esp
c0002c84:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002c89:	83 c0 01             	add    $0x1,%eax
c0002c8c:	83 ec 04             	sub    $0x4,%esp
c0002c8f:	68 ff 01 00 00       	push   $0x1ff
c0002c94:	6a 80                	push   $0xffffff80
c0002c96:	50                   	push   %eax
c0002c97:	e8 56 87 00 00       	call   c000b3f2 <Memset>
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
c0002cd2:	e8 1b 87 00 00       	call   c000b3f2 <Memset>
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
c0002d04:	e8 e9 86 00 00       	call   c000b3f2 <Memset>
c0002d09:	83 c4 10             	add    $0x10,%esp
c0002d0c:	a1 a4 31 01 c0       	mov    0xc00131a4,%eax
c0002d11:	83 c0 01             	add    $0x1,%eax
c0002d14:	83 ec 04             	sub    $0x4,%esp
c0002d17:	68 ff 01 00 00       	push   $0x1ff
c0002d1c:	6a 00                	push   $0x0
c0002d1e:	50                   	push   %eax
c0002d1f:	e8 ce 86 00 00       	call   c000b3f2 <Memset>
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
c0002eba:	c7 85 70 ff ff ff bc 	movl   $0xc000aabc,-0x90(%ebp)
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
c0002f9a:	e8 8c 84 00 00       	call   c000b42b <Strlen>
c0002f9f:	83 c4 10             	add    $0x10,%esp
c0002fa2:	89 c1                	mov    %eax,%ecx
c0002fa4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0002fa7:	8d 50 04             	lea    0x4(%eax),%edx
c0002faa:	83 ec 04             	sub    $0x4,%esp
c0002fad:	51                   	push   %ecx
c0002fae:	8d 85 5e ff ff ff    	lea    -0xa2(%ebp),%eax
c0002fb4:	50                   	push   %eax
c0002fb5:	52                   	push   %edx
c0002fb6:	e8 09 84 00 00       	call   c000b3c4 <Memcpy>
c0002fbb:	83 c4 10             	add    $0x10,%esp
c0002fbe:	8d 95 34 ff ff ff    	lea    -0xcc(%ebp),%edx
c0002fc4:	b8 00 00 00 00       	mov    $0x0,%eax
c0002fc9:	b9 0a 00 00 00       	mov    $0xa,%ecx
c0002fce:	89 d7                	mov    %edx,%edi
c0002fd0:	f3 ab                	rep stos %eax,%es:(%edi)
c0002fd2:	c7 85 34 ff ff ff c8 	movl   $0xc000aac8,-0xcc(%ebp)
c0002fd9:	aa 00 c0 
c0002fdc:	c7 85 38 ff ff ff d1 	movl   $0xc000aad1,-0xc8(%ebp)
c0002fe3:	aa 00 c0 
c0002fe6:	c7 85 3c ff ff ff da 	movl   $0xc000aada,-0xc4(%ebp)
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
c000301d:	e8 09 84 00 00       	call   c000b42b <Strlen>
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
c000303d:	e8 82 83 00 00       	call   c000b3c4 <Memcpy>
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
c0003068:	e8 be 83 00 00       	call   c000b42b <Strlen>
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
c0003091:	e8 95 83 00 00       	call   c000b42b <Strlen>
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
c00030b1:	e8 0e 83 00 00       	call   c000b3c4 <Memcpy>
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
c00030f9:	e8 e0 3d 00 00       	call   c0006ede <sys_malloc>
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
c0003122:	e8 b7 69 00 00       	call   c0009ade <send_rec>
c0003127:	83 c4 10             	add    $0x10,%esp
c000312a:	e8 dd f9 ff ff       	call   c0002b0c <mkfs>
c000312f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0003132:	83 ec 08             	sub    $0x8,%esp
c0003135:	6a 6c                	push   $0x6c
c0003137:	50                   	push   %eax
c0003138:	e8 80 40 00 00       	call   c00071bd <sys_free>
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
c0003154:	e8 99 82 00 00       	call   c000b3f2 <Memset>
c0003159:	83 c4 10             	add    $0x10,%esp
c000315c:	8b 45 08             	mov    0x8(%ebp),%eax
c000315f:	8b 40 34             	mov    0x34(%eax),%eax
c0003162:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0003165:	83 ec 08             	sub    $0x8,%esp
c0003168:	6a 0c                	push   $0xc
c000316a:	ff 75 e4             	pushl  -0x1c(%ebp)
c000316d:	e8 2b 3c 00 00       	call   c0006d9d <alloc_virtual_memory>
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
c000318c:	e8 33 82 00 00       	call   c000b3c4 <Memcpy>
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
c00031e8:	68 f0 a9 00 c0       	push   $0xc000a9f0
c00031ed:	68 f0 a9 00 c0       	push   $0xc000a9f0
c00031f2:	68 e3 aa 00 c0       	push   $0xc000aae3
c00031f7:	e8 97 60 00 00       	call   c0009293 <assertion_failure>
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
c000323d:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0003242:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0003247:	68 eb aa 00 c0       	push   $0xc000aaeb
c000324c:	e8 42 60 00 00       	call   c0009293 <assertion_failure>
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
c0003275:	68 f3 aa 00 c0       	push   $0xc000aaf3
c000327a:	e8 f6 5f 00 00       	call   c0009275 <panic>
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
c0003323:	e8 ca 80 00 00       	call   c000b3f2 <Memset>
c0003328:	83 c4 10             	add    $0x10,%esp
c000332b:	83 ec 04             	sub    $0x4,%esp
c000332e:	6a 28                	push   $0x28
c0003330:	6a 00                	push   $0x0
c0003332:	8d 45 98             	lea    -0x68(%ebp),%eax
c0003335:	50                   	push   %eax
c0003336:	e8 b7 80 00 00       	call   c000b3f2 <Memset>
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
c0003407:	e8 2e 6a 00 00       	call   c0009e3a <strcmp>
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
c00038ec:	68 f0 a9 00 c0       	push   $0xc000a9f0
c00038f1:	68 f0 a9 00 c0       	push   $0xc000a9f0
c00038f6:	68 00 ab 00 c0       	push   $0xc000ab00
c00038fb:	e8 93 59 00 00       	call   c0009293 <assertion_failure>
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
c0003ce7:	e8 25 77 00 00       	call   c000b411 <Strcpy>
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
c0003db5:	68 15 ab 00 c0       	push   $0xc000ab15
c0003dba:	e8 7b 60 00 00       	call   c0009e3a <strcmp>
c0003dbf:	83 c4 10             	add    $0x10,%esp
c0003dc2:	85 c0                	test   %eax,%eax
c0003dc4:	75 10                	jne    c0003dd6 <do_unlink+0x31>
c0003dc6:	83 ec 0c             	sub    $0xc,%esp
c0003dc9:	68 17 ab 00 c0       	push   $0xc000ab17
c0003dce:	e8 a2 54 00 00       	call   c0009275 <panic>
c0003dd3:	83 c4 10             	add    $0x10,%esp
c0003dd6:	83 ec 0c             	sub    $0xc,%esp
c0003dd9:	ff 75 08             	pushl  0x8(%ebp)
c0003ddc:	e8 31 f5 ff ff       	call   c0003312 <search_file>
c0003de1:	83 c4 10             	add    $0x10,%esp
c0003de4:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0003de7:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c0003deb:	75 10                	jne    c0003dfd <do_unlink+0x58>
c0003ded:	83 ec 0c             	sub    $0xc,%esp
c0003df0:	68 33 ab 00 c0       	push   $0xc000ab33
c0003df5:	e8 7b 54 00 00       	call   c0009275 <panic>
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
c0003e1e:	68 33 ab 00 c0       	push   $0xc000ab33
c0003e23:	e8 4d 54 00 00       	call   c0009275 <panic>
c0003e28:	83 c4 10             	add    $0x10,%esp
c0003e2b:	8b 45 88             	mov    -0x78(%ebp),%eax
c0003e2e:	85 c0                	test   %eax,%eax
c0003e30:	7e 10                	jle    c0003e42 <do_unlink+0x9d>
c0003e32:	83 ec 0c             	sub    $0xc,%esp
c0003e35:	68 4c ab 00 c0       	push   $0xc000ab4c
c0003e3a:	e8 36 54 00 00       	call   c0009275 <panic>
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
c00041d8:	e8 5d 5c 00 00       	call   c0009e3a <strcmp>
c00041dd:	83 c4 10             	add    $0x10,%esp
c00041e0:	85 c0                	test   %eax,%eax
c00041e2:	75 1b                	jne    c00041ff <do_unlink+0x45a>
c00041e4:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c00041eb:	83 ec 04             	sub    $0x4,%esp
c00041ee:	6a 10                	push   $0x10
c00041f0:	6a 00                	push   $0x0
c00041f2:	ff 75 d4             	pushl  -0x2c(%ebp)
c00041f5:	e8 f8 71 00 00       	call   c000b3f2 <Memset>
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
c00042c5:	e8 58 07 00 00       	call   c0004a22 <pid2proc>
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
c0004312:	68 84 ab 00 c0       	push   $0xc000ab84
c0004317:	e8 59 4f 00 00       	call   c0009275 <panic>
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
c0004342:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0004347:	68 f0 a9 00 c0       	push   $0xc000a9f0
c000434c:	68 94 ab 00 c0       	push   $0xc000ab94
c0004351:	e8 3d 4f 00 00       	call   c0009293 <assertion_failure>
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
c00043a0:	e8 39 57 00 00       	call   c0009ade <send_rec>
c00043a5:	83 c4 10             	add    $0x10,%esp
c00043a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00043ab:	8b 40 68             	mov    0x68(%eax),%eax
c00043ae:	83 f8 66             	cmp    $0x66,%eax
c00043b1:	75 13                	jne    c00043c6 <do_rdwt+0x145>
c00043b3:	83 ec 04             	sub    $0x4,%esp
c00043b6:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043b9:	ff 75 08             	pushl  0x8(%ebp)
c00043bc:	6a 01                	push   $0x1
c00043be:	e8 1b 57 00 00       	call   c0009ade <send_rec>
c00043c3:	83 c4 10             	add    $0x10,%esp
c00043c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00043c9:	8b 40 68             	mov    0x68(%eax),%eax
c00043cc:	83 f8 65             	cmp    $0x65,%eax
c00043cf:	75 13                	jne    c00043e4 <do_rdwt+0x163>
c00043d1:	83 ec 04             	sub    $0x4,%esp
c00043d4:	ff 75 b4             	pushl  -0x4c(%ebp)
c00043d7:	ff 75 08             	pushl  0x8(%ebp)
c00043da:	6a 01                	push   $0x1
c00043dc:	e8 fd 56 00 00       	call   c0009ade <send_rec>
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
c00044c9:	e8 54 05 00 00       	call   c0004a22 <pid2proc>
c00044ce:	83 c4 10             	add    $0x10,%esp
c00044d1:	89 45 9c             	mov    %eax,-0x64(%ebp)
c00044d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00044d7:	83 ec 08             	sub    $0x8,%esp
c00044da:	50                   	push   %eax
c00044db:	ff 75 c8             	pushl  -0x38(%ebp)
c00044de:	e8 ba 28 00 00       	call   c0006d9d <alloc_virtual_memory>
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
c0004550:	e8 6f 6e 00 00       	call   c000b3c4 <Memcpy>
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
c0004577:	e8 48 6e 00 00       	call   c000b3c4 <Memcpy>
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
c000473b:	e8 84 6c 00 00       	call   c000b3c4 <Memcpy>
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
c000477c:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0004781:	68 f0 a9 00 c0       	push   $0xc000a9f0
c0004786:	68 c8 ab 00 c0       	push   $0xc000abc8
c000478b:	e8 03 4b 00 00       	call   c0009293 <assertion_failure>
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
c0004898:	68 d7 ab 00 c0       	push   $0xc000abd7
c000489d:	e8 25 cd ff ff       	call   c00015c7 <disp_str_colour>
c00048a2:	83 c4 10             	add    $0x10,%esp
c00048a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00048a8:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00048af:	0f be c0             	movsbl %al,%eax
c00048b2:	83 ec 0c             	sub    $0xc,%esp
c00048b5:	50                   	push   %eax
c00048b6:	e8 9c 31 00 00       	call   c0007a57 <disp_int>
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
c00048da:	e8 b7 cf ff ff       	call   c0001896 <get_running_thread_pcb>
c00048df:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00048e2:	83 ec 0c             	sub    $0xc,%esp
c00048e5:	68 8c fd 00 c0       	push   $0xc000fd8c
c00048ea:	e8 54 5c 00 00       	call   c000a543 <isListEmpty>
c00048ef:	83 c4 10             	add    $0x10,%esp
c00048f2:	3c 01                	cmp    $0x1,%al
c00048f4:	75 08                	jne    c00048fe <schedule_process+0x2a>
c00048f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00048f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00048fc:	eb 4d                	jmp    c000494b <schedule_process+0x77>
c00048fe:	83 ec 0c             	sub    $0xc,%esp
c0004901:	68 8c fd 00 c0       	push   $0xc000fd8c
c0004906:	e8 df 5c 00 00       	call   c000a5ea <popFromDoubleLinkList>
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
c000493d:	68 dd ab 00 c0       	push   $0xc000abdd
c0004942:	50                   	push   %eax
c0004943:	e8 f2 54 00 00       	call   c0009e3a <strcmp>
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
c000496a:	e8 3a 5c 00 00       	call   c000a5a9 <insertToDoubleLinkList>
c000496f:	83 c4 10             	add    $0x10,%esp
c0004972:	c7 45 e4 00 00 10 00 	movl   $0x100000,-0x1c(%ebp)
c0004979:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000497c:	8b 40 04             	mov    0x4(%eax),%eax
c000497f:	85 c0                	test   %eax,%eax
c0004981:	74 23                	je     c00049a6 <schedule_process+0xd2>
c0004983:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004986:	83 ec 0c             	sub    $0xc,%esp
c0004989:	50                   	push   %eax
c000498a:	e8 f6 ce ff ff       	call   c0001885 <update_tss>
c000498f:	83 c4 10             	add    $0x10,%esp
c0004992:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004995:	8b 40 04             	mov    0x4(%eax),%eax
c0004998:	83 ec 0c             	sub    $0xc,%esp
c000499b:	50                   	push   %eax
c000499c:	e8 d7 ce ff ff       	call   c0001878 <update_cr3>
c00049a1:	83 c4 10             	add    $0x10,%esp
c00049a4:	eb 0f                	jmp    c00049b5 <schedule_process+0xe1>
c00049a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00049a9:	83 ec 0c             	sub    $0xc,%esp
c00049ac:	50                   	push   %eax
c00049ad:	e8 c6 ce ff ff       	call   c0001878 <update_cr3>
c00049b2:	83 c4 10             	add    $0x10,%esp
c00049b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049b8:	a3 60 fb 00 c0       	mov    %eax,0xc000fb60
c00049bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049c0:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00049c6:	83 f8 06             	cmp    $0x6,%eax
c00049c9:	75 1f                	jne    c00049ea <schedule_process+0x116>
c00049cb:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c00049d2:	00 00 00 
c00049d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00049d8:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00049de:	83 ec 0c             	sub    $0xc,%esp
c00049e1:	50                   	push   %eax
c00049e2:	e8 70 30 00 00       	call   c0007a57 <disp_int>
c00049e7:	83 c4 10             	add    $0x10,%esp
c00049ea:	83 ec 08             	sub    $0x8,%esp
c00049ed:	ff 75 f4             	pushl  -0xc(%ebp)
c00049f0:	ff 75 f0             	pushl  -0x10(%ebp)
c00049f3:	e8 08 5b 00 00       	call   c000a500 <switch_to>
c00049f8:	83 c4 10             	add    $0x10,%esp
c00049fb:	90                   	nop
c00049fc:	c9                   	leave  
c00049fd:	c3                   	ret    

c00049fe <clock_handler>:
c00049fe:	55                   	push   %ebp
c00049ff:	89 e5                	mov    %esp,%ebp
c0004a01:	83 ec 08             	sub    $0x8,%esp
c0004a04:	a1 a0 16 01 c0       	mov    0xc00116a0,%eax
c0004a09:	85 c0                	test   %eax,%eax
c0004a0b:	74 0d                	je     c0004a1a <clock_handler+0x1c>
c0004a0d:	83 ec 0c             	sub    $0xc,%esp
c0004a10:	6a 02                	push   $0x2
c0004a12:	e8 56 53 00 00       	call   c0009d6d <inform_int>
c0004a17:	83 c4 10             	add    $0x10,%esp
c0004a1a:	e8 b5 fe ff ff       	call   c00048d4 <schedule_process>
c0004a1f:	90                   	nop
c0004a20:	c9                   	leave  
c0004a21:	c3                   	ret    

c0004a22 <pid2proc>:
c0004a22:	55                   	push   %ebp
c0004a23:	89 e5                	mov    %esp,%ebp
c0004a25:	83 ec 20             	sub    $0x20,%esp
c0004a28:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0004a2f:	a1 d4 1e 01 c0       	mov    0xc0011ed4,%eax
c0004a34:	8b 15 d8 1e 01 c0    	mov    0xc0011ed8,%edx
c0004a3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004a3d:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0004a40:	a1 dc 1e 01 c0       	mov    0xc0011edc,%eax
c0004a45:	8b 15 e0 1e 01 c0    	mov    0xc0011ee0,%edx
c0004a4b:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004a4e:	89 55 ec             	mov    %edx,-0x14(%ebp)
c0004a51:	a1 d8 1e 01 c0       	mov    0xc0011ed8,%eax
c0004a56:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004a59:	eb 29                	jmp    c0004a84 <pid2proc+0x62>
c0004a5b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a5e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0004a63:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004a66:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a69:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c0004a6f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a72:	39 c2                	cmp    %eax,%edx
c0004a74:	75 05                	jne    c0004a7b <pid2proc+0x59>
c0004a76:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a79:	eb 15                	jmp    c0004a90 <pid2proc+0x6e>
c0004a7b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004a7e:	8b 40 04             	mov    0x4(%eax),%eax
c0004a81:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004a84:	81 7d f8 dc 1e 01 c0 	cmpl   $0xc0011edc,-0x8(%ebp)
c0004a8b:	75 ce                	jne    c0004a5b <pid2proc+0x39>
c0004a8d:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004a90:	c9                   	leave  
c0004a91:	c3                   	ret    

c0004a92 <proc2pid>:
c0004a92:	55                   	push   %ebp
c0004a93:	89 e5                	mov    %esp,%ebp
c0004a95:	83 ec 10             	sub    $0x10,%esp
c0004a98:	8b 45 08             	mov    0x8(%ebp),%eax
c0004a9b:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c0004aa1:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004aa4:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004aa7:	c9                   	leave  
c0004aa8:	c3                   	ret    

c0004aa9 <InitDescriptor>:
c0004aa9:	55                   	push   %ebp
c0004aaa:	89 e5                	mov    %esp,%ebp
c0004aac:	83 ec 04             	sub    $0x4,%esp
c0004aaf:	8b 45 14             	mov    0x14(%ebp),%eax
c0004ab2:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
c0004ab6:	8b 45 10             	mov    0x10(%ebp),%eax
c0004ab9:	89 c2                	mov    %eax,%edx
c0004abb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004abe:	66 89 10             	mov    %dx,(%eax)
c0004ac1:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ac4:	89 c2                	mov    %eax,%edx
c0004ac6:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ac9:	66 89 50 02          	mov    %dx,0x2(%eax)
c0004acd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004ad0:	c1 e8 10             	shr    $0x10,%eax
c0004ad3:	89 c2                	mov    %eax,%edx
c0004ad5:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ad8:	88 50 04             	mov    %dl,0x4(%eax)
c0004adb:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004adf:	89 c2                	mov    %eax,%edx
c0004ae1:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ae4:	88 50 05             	mov    %dl,0x5(%eax)
c0004ae7:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
c0004aeb:	66 c1 e8 08          	shr    $0x8,%ax
c0004aef:	c1 e0 04             	shl    $0x4,%eax
c0004af2:	89 c2                	mov    %eax,%edx
c0004af4:	8b 45 10             	mov    0x10(%ebp),%eax
c0004af7:	c1 e8 10             	shr    $0x10,%eax
c0004afa:	83 e0 0f             	and    $0xf,%eax
c0004afd:	09 c2                	or     %eax,%edx
c0004aff:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b02:	88 50 06             	mov    %dl,0x6(%eax)
c0004b05:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b08:	c1 e8 18             	shr    $0x18,%eax
c0004b0b:	89 c2                	mov    %eax,%edx
c0004b0d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b10:	88 50 07             	mov    %dl,0x7(%eax)
c0004b13:	90                   	nop
c0004b14:	c9                   	leave  
c0004b15:	c3                   	ret    

c0004b16 <Seg2PhyAddr>:
c0004b16:	55                   	push   %ebp
c0004b17:	89 e5                	mov    %esp,%ebp
c0004b19:	83 ec 10             	sub    $0x10,%esp
c0004b1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b1f:	c1 e8 03             	shr    $0x3,%eax
c0004b22:	8b 14 c5 64 f7 00 c0 	mov    -0x3fff089c(,%eax,8),%edx
c0004b29:	8b 04 c5 60 f7 00 c0 	mov    -0x3fff08a0(,%eax,8),%eax
c0004b30:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b33:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004b36:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004b3a:	0f b7 c0             	movzwl %ax,%eax
c0004b3d:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004b41:	0f b6 d2             	movzbl %dl,%edx
c0004b44:	c1 e2 10             	shl    $0x10,%edx
c0004b47:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004b4d:	09 d0                	or     %edx,%eax
c0004b4f:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b52:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b55:	c9                   	leave  
c0004b56:	c3                   	ret    

c0004b57 <Seg2PhyAddrLDT>:
c0004b57:	55                   	push   %ebp
c0004b58:	89 e5                	mov    %esp,%ebp
c0004b5a:	83 ec 10             	sub    $0x10,%esp
c0004b5d:	8b 45 08             	mov    0x8(%ebp),%eax
c0004b60:	c1 e8 03             	shr    $0x3,%eax
c0004b63:	89 c2                	mov    %eax,%edx
c0004b65:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004b68:	83 c2 20             	add    $0x20,%edx
c0004b6b:	8d 54 d0 0e          	lea    0xe(%eax,%edx,8),%edx
c0004b6f:	8b 02                	mov    (%edx),%eax
c0004b71:	8b 52 04             	mov    0x4(%edx),%edx
c0004b74:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004b77:	89 55 f8             	mov    %edx,-0x8(%ebp)
c0004b7a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
c0004b7e:	0f b7 c0             	movzwl %ax,%eax
c0004b81:	0f b6 55 f8          	movzbl -0x8(%ebp),%edx
c0004b85:	0f b6 d2             	movzbl %dl,%edx
c0004b88:	c1 e2 10             	shl    $0x10,%edx
c0004b8b:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
c0004b91:	09 d0                	or     %edx,%eax
c0004b93:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004b96:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004b99:	c9                   	leave  
c0004b9a:	c3                   	ret    

c0004b9b <VirAddr2PhyAddr>:
c0004b9b:	55                   	push   %ebp
c0004b9c:	89 e5                	mov    %esp,%ebp
c0004b9e:	83 ec 10             	sub    $0x10,%esp
c0004ba1:	8b 55 0c             	mov    0xc(%ebp),%edx
c0004ba4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ba7:	01 d0                	add    %edx,%eax
c0004ba9:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004bac:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004baf:	c9                   	leave  
c0004bb0:	c3                   	ret    

c0004bb1 <v2l>:
c0004bb1:	55                   	push   %ebp
c0004bb2:	89 e5                	mov    %esp,%ebp
c0004bb4:	83 ec 18             	sub    $0x18,%esp
c0004bb7:	83 ec 0c             	sub    $0xc,%esp
c0004bba:	ff 75 08             	pushl  0x8(%ebp)
c0004bbd:	e8 60 fe ff ff       	call   c0004a22 <pid2proc>
c0004bc2:	83 c4 10             	add    $0x10,%esp
c0004bc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0004bc8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0004bcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004bd2:	83 ec 08             	sub    $0x8,%esp
c0004bd5:	ff 75 f4             	pushl  -0xc(%ebp)
c0004bd8:	50                   	push   %eax
c0004bd9:	e8 79 ff ff ff       	call   c0004b57 <Seg2PhyAddrLDT>
c0004bde:	83 c4 10             	add    $0x10,%esp
c0004be1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0004be4:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0004be7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004bea:	01 d0                	add    %edx,%eax
c0004bec:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0004bef:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004bf2:	c9                   	leave  
c0004bf3:	c3                   	ret    

c0004bf4 <init_propt>:
c0004bf4:	55                   	push   %ebp
c0004bf5:	89 e5                	mov    %esp,%ebp
c0004bf7:	83 ec 28             	sub    $0x28,%esp
c0004bfa:	6a 0e                	push   $0xe
c0004bfc:	6a 08                	push   $0x8
c0004bfe:	68 6a 16 00 c0       	push   $0xc000166a
c0004c03:	6a 20                	push   $0x20
c0004c05:	e8 18 01 00 00       	call   c0004d22 <InitInterruptDesc>
c0004c0a:	83 c4 10             	add    $0x10,%esp
c0004c0d:	6a 0e                	push   $0xe
c0004c0f:	6a 08                	push   $0x8
c0004c11:	68 98 16 00 c0       	push   $0xc0001698
c0004c16:	6a 21                	push   $0x21
c0004c18:	e8 05 01 00 00       	call   c0004d22 <InitInterruptDesc>
c0004c1d:	83 c4 10             	add    $0x10,%esp
c0004c20:	6a 0e                	push   $0xe
c0004c22:	6a 08                	push   $0x8
c0004c24:	68 dc 16 00 c0       	push   $0xc00016dc
c0004c29:	6a 2e                	push   $0x2e
c0004c2b:	e8 f2 00 00 00       	call   c0004d22 <InitInterruptDesc>
c0004c30:	83 c4 10             	add    $0x10,%esp
c0004c33:	83 ec 04             	sub    $0x4,%esp
c0004c36:	68 b0 0a 00 00       	push   $0xab0
c0004c3b:	6a 00                	push   $0x0
c0004c3d:	68 00 33 08 c0       	push   $0xc0083300
c0004c42:	e8 ab 67 00 00       	call   c000b3f2 <Memset>
c0004c47:	83 c4 10             	add    $0x10,%esp
c0004c4a:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0004c51:	83 ec 04             	sub    $0x4,%esp
c0004c54:	ff 75 f4             	pushl  -0xc(%ebp)
c0004c57:	6a 00                	push   $0x0
c0004c59:	68 20 16 01 c0       	push   $0xc0011620
c0004c5e:	e8 8f 67 00 00       	call   c000b3f2 <Memset>
c0004c63:	83 c4 10             	add    $0x10,%esp
c0004c66:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c69:	a3 88 16 01 c0       	mov    %eax,0xc0011688
c0004c6e:	c7 05 28 16 01 c0 30 	movl   $0x30,0xc0011628
c0004c75:	00 00 00 
c0004c78:	83 ec 0c             	sub    $0xc,%esp
c0004c7b:	6a 30                	push   $0x30
c0004c7d:	e8 94 fe ff ff       	call   c0004b16 <Seg2PhyAddr>
c0004c82:	83 c4 10             	add    $0x10,%esp
c0004c85:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0004c88:	c7 45 ec 20 16 01 c0 	movl   $0xc0011620,-0x14(%ebp)
c0004c8f:	c7 45 e8 89 00 00 00 	movl   $0x89,-0x18(%ebp)
c0004c96:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004c99:	0f b7 d0             	movzwl %ax,%edx
c0004c9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0004c9f:	83 e8 01             	sub    $0x1,%eax
c0004ca2:	89 c1                	mov    %eax,%ecx
c0004ca4:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004ca7:	52                   	push   %edx
c0004ca8:	51                   	push   %ecx
c0004ca9:	50                   	push   %eax
c0004caa:	68 a0 f7 00 c0       	push   $0xc000f7a0
c0004caf:	e8 f5 fd ff ff       	call   c0004aa9 <InitDescriptor>
c0004cb4:	83 c4 10             	add    $0x10,%esp
c0004cb7:	c7 45 e4 00 80 0b c0 	movl   $0xc00b8000,-0x1c(%ebp)
c0004cbe:	68 f2 00 00 00       	push   $0xf2
c0004cc3:	68 ff ff 00 00       	push   $0xffff
c0004cc8:	ff 75 e4             	pushl  -0x1c(%ebp)
c0004ccb:	68 98 f7 00 c0       	push   $0xc000f798
c0004cd0:	e8 d4 fd ff ff       	call   c0004aa9 <InitDescriptor>
c0004cd5:	83 c4 10             	add    $0x10,%esp
c0004cd8:	c7 45 e0 b2 0c 00 00 	movl   $0xcb2,-0x20(%ebp)
c0004cdf:	c7 45 dc 9a 0c 00 00 	movl   $0xc9a,-0x24(%ebp)
c0004ce6:	c7 45 d8 ff ff ff ff 	movl   $0xffffffff,-0x28(%ebp)
c0004ced:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0004cf0:	0f b7 c0             	movzwl %ax,%eax
c0004cf3:	50                   	push   %eax
c0004cf4:	ff 75 d8             	pushl  -0x28(%ebp)
c0004cf7:	6a 00                	push   $0x0
c0004cf9:	68 a8 f7 00 c0       	push   $0xc000f7a8
c0004cfe:	e8 a6 fd ff ff       	call   c0004aa9 <InitDescriptor>
c0004d03:	83 c4 10             	add    $0x10,%esp
c0004d06:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0004d09:	0f b7 c0             	movzwl %ax,%eax
c0004d0c:	50                   	push   %eax
c0004d0d:	ff 75 d8             	pushl  -0x28(%ebp)
c0004d10:	6a 00                	push   $0x0
c0004d12:	68 b0 f7 00 c0       	push   $0xc000f7b0
c0004d17:	e8 8d fd ff ff       	call   c0004aa9 <InitDescriptor>
c0004d1c:	83 c4 10             	add    $0x10,%esp
c0004d1f:	90                   	nop
c0004d20:	c9                   	leave  
c0004d21:	c3                   	ret    

c0004d22 <InitInterruptDesc>:
c0004d22:	55                   	push   %ebp
c0004d23:	89 e5                	mov    %esp,%ebp
c0004d25:	83 ec 10             	sub    $0x10,%esp
c0004d28:	8b 45 08             	mov    0x8(%ebp),%eax
c0004d2b:	c1 e0 03             	shl    $0x3,%eax
c0004d2e:	05 c0 16 01 c0       	add    $0xc00116c0,%eax
c0004d33:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0004d36:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d39:	c6 40 04 00          	movb   $0x0,0x4(%eax)
c0004d3d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004d40:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0004d43:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004d46:	89 c2                	mov    %eax,%edx
c0004d48:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d4b:	66 89 10             	mov    %dx,(%eax)
c0004d4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d51:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
c0004d57:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0004d5a:	c1 f8 10             	sar    $0x10,%eax
c0004d5d:	89 c2                	mov    %eax,%edx
c0004d5f:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d62:	66 89 50 06          	mov    %dx,0x6(%eax)
c0004d66:	8b 45 10             	mov    0x10(%ebp),%eax
c0004d69:	c1 e0 04             	shl    $0x4,%eax
c0004d6c:	89 c2                	mov    %eax,%edx
c0004d6e:	8b 45 14             	mov    0x14(%ebp),%eax
c0004d71:	09 d0                	or     %edx,%eax
c0004d73:	89 c2                	mov    %eax,%edx
c0004d75:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0004d78:	88 50 05             	mov    %dl,0x5(%eax)
c0004d7b:	90                   	nop
c0004d7c:	c9                   	leave  
c0004d7d:	c3                   	ret    

c0004d7e <ReloadGDT>:
c0004d7e:	55                   	push   %ebp
c0004d7f:	89 e5                	mov    %esp,%ebp
c0004d81:	83 ec 28             	sub    $0x28,%esp
c0004d84:	b8 a8 16 01 c0       	mov    $0xc00116a8,%eax
c0004d89:	0f b7 00             	movzwl (%eax),%eax
c0004d8c:	98                   	cwtl   
c0004d8d:	ba aa 16 01 c0       	mov    $0xc00116aa,%edx
c0004d92:	8b 12                	mov    (%edx),%edx
c0004d94:	83 ec 04             	sub    $0x4,%esp
c0004d97:	50                   	push   %eax
c0004d98:	52                   	push   %edx
c0004d99:	68 60 f7 00 c0       	push   $0xc000f760
c0004d9e:	e8 21 66 00 00       	call   c000b3c4 <Memcpy>
c0004da3:	83 c4 10             	add    $0x10,%esp
c0004da6:	c7 45 f0 a8 16 01 c0 	movl   $0xc00116a8,-0x10(%ebp)
c0004dad:	c7 45 ec aa 16 01 c0 	movl   $0xc00116aa,-0x14(%ebp)
c0004db4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0004db7:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
c0004dbc:	ba 60 f7 00 c0       	mov    $0xc000f760,%edx
c0004dc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0004dc4:	89 10                	mov    %edx,(%eax)
c0004dc6:	c7 45 e8 28 f7 00 c0 	movl   $0xc000f728,-0x18(%ebp)
c0004dcd:	c7 45 e4 2a f7 00 c0 	movl   $0xc000f72a,-0x1c(%ebp)
c0004dd4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0004dd7:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
c0004ddc:	ba c0 16 01 c0       	mov    $0xc00116c0,%edx
c0004de1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0004de4:	89 10                	mov    %edx,(%eax)
c0004de6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0004ded:	eb 04                	jmp    c0004df3 <ReloadGDT+0x75>
c0004def:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0004df3:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c0004dfa:	7e f3                	jle    c0004def <ReloadGDT+0x71>
c0004dfc:	e8 2e 31 00 00       	call   c0007f2f <init_internal_interrupt>
c0004e01:	e8 ee fd ff ff       	call   c0004bf4 <init_propt>
c0004e06:	90                   	nop
c0004e07:	c9                   	leave  
c0004e08:	c3                   	ret    

c0004e09 <select_console>:
c0004e09:	55                   	push   %ebp
c0004e0a:	89 e5                	mov    %esp,%ebp
c0004e0c:	83 ec 18             	sub    $0x18,%esp
c0004e0f:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e12:	88 45 f4             	mov    %al,-0xc(%ebp)
c0004e15:	80 7d f4 02          	cmpb   $0x2,-0xc(%ebp)
c0004e19:	77 27                	ja     c0004e42 <select_console+0x39>
c0004e1b:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
c0004e1f:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0004e25:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0004e2a:	a3 20 f7 00 c0       	mov    %eax,0xc000f720
c0004e2f:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0004e34:	83 ec 0c             	sub    $0xc,%esp
c0004e37:	50                   	push   %eax
c0004e38:	e8 08 00 00 00       	call   c0004e45 <flush>
c0004e3d:	83 c4 10             	add    $0x10,%esp
c0004e40:	eb 01                	jmp    c0004e43 <select_console+0x3a>
c0004e42:	90                   	nop
c0004e43:	c9                   	leave  
c0004e44:	c3                   	ret    

c0004e45 <flush>:
c0004e45:	55                   	push   %ebp
c0004e46:	89 e5                	mov    %esp,%ebp
c0004e48:	83 ec 08             	sub    $0x8,%esp
c0004e4b:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e4e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e54:	8b 40 0c             	mov    0xc(%eax),%eax
c0004e57:	83 ec 0c             	sub    $0xc,%esp
c0004e5a:	50                   	push   %eax
c0004e5b:	e8 1e 00 00 00       	call   c0004e7e <set_cursor>
c0004e60:	83 c4 10             	add    $0x10,%esp
c0004e63:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e66:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004e6c:	8b 40 08             	mov    0x8(%eax),%eax
c0004e6f:	83 ec 0c             	sub    $0xc,%esp
c0004e72:	50                   	push   %eax
c0004e73:	e8 64 00 00 00       	call   c0004edc <set_console_start_video_addr>
c0004e78:	83 c4 10             	add    $0x10,%esp
c0004e7b:	90                   	nop
c0004e7c:	c9                   	leave  
c0004e7d:	c3                   	ret    

c0004e7e <set_cursor>:
c0004e7e:	55                   	push   %ebp
c0004e7f:	89 e5                	mov    %esp,%ebp
c0004e81:	83 ec 08             	sub    $0x8,%esp
c0004e84:	83 ec 08             	sub    $0x8,%esp
c0004e87:	6a 0e                	push   $0xe
c0004e89:	68 d4 03 00 00       	push   $0x3d4
c0004e8e:	e8 03 c9 ff ff       	call   c0001796 <out_byte>
c0004e93:	83 c4 10             	add    $0x10,%esp
c0004e96:	8b 45 08             	mov    0x8(%ebp),%eax
c0004e99:	c1 e8 08             	shr    $0x8,%eax
c0004e9c:	0f b7 c0             	movzwl %ax,%eax
c0004e9f:	83 ec 08             	sub    $0x8,%esp
c0004ea2:	50                   	push   %eax
c0004ea3:	68 d5 03 00 00       	push   $0x3d5
c0004ea8:	e8 e9 c8 ff ff       	call   c0001796 <out_byte>
c0004ead:	83 c4 10             	add    $0x10,%esp
c0004eb0:	83 ec 08             	sub    $0x8,%esp
c0004eb3:	6a 0f                	push   $0xf
c0004eb5:	68 d4 03 00 00       	push   $0x3d4
c0004eba:	e8 d7 c8 ff ff       	call   c0001796 <out_byte>
c0004ebf:	83 c4 10             	add    $0x10,%esp
c0004ec2:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ec5:	0f b7 c0             	movzwl %ax,%eax
c0004ec8:	83 ec 08             	sub    $0x8,%esp
c0004ecb:	50                   	push   %eax
c0004ecc:	68 d5 03 00 00       	push   $0x3d5
c0004ed1:	e8 c0 c8 ff ff       	call   c0001796 <out_byte>
c0004ed6:	83 c4 10             	add    $0x10,%esp
c0004ed9:	90                   	nop
c0004eda:	c9                   	leave  
c0004edb:	c3                   	ret    

c0004edc <set_console_start_video_addr>:
c0004edc:	55                   	push   %ebp
c0004edd:	89 e5                	mov    %esp,%ebp
c0004edf:	83 ec 08             	sub    $0x8,%esp
c0004ee2:	83 ec 08             	sub    $0x8,%esp
c0004ee5:	6a 0c                	push   $0xc
c0004ee7:	68 d4 03 00 00       	push   $0x3d4
c0004eec:	e8 a5 c8 ff ff       	call   c0001796 <out_byte>
c0004ef1:	83 c4 10             	add    $0x10,%esp
c0004ef4:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ef7:	c1 e8 08             	shr    $0x8,%eax
c0004efa:	0f b7 c0             	movzwl %ax,%eax
c0004efd:	83 ec 08             	sub    $0x8,%esp
c0004f00:	50                   	push   %eax
c0004f01:	68 d5 03 00 00       	push   $0x3d5
c0004f06:	e8 8b c8 ff ff       	call   c0001796 <out_byte>
c0004f0b:	83 c4 10             	add    $0x10,%esp
c0004f0e:	83 ec 08             	sub    $0x8,%esp
c0004f11:	6a 0d                	push   $0xd
c0004f13:	68 d4 03 00 00       	push   $0x3d4
c0004f18:	e8 79 c8 ff ff       	call   c0001796 <out_byte>
c0004f1d:	83 c4 10             	add    $0x10,%esp
c0004f20:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f23:	0f b7 c0             	movzwl %ax,%eax
c0004f26:	83 ec 08             	sub    $0x8,%esp
c0004f29:	50                   	push   %eax
c0004f2a:	68 d5 03 00 00       	push   $0x3d5
c0004f2f:	e8 62 c8 ff ff       	call   c0001796 <out_byte>
c0004f34:	83 c4 10             	add    $0x10,%esp
c0004f37:	90                   	nop
c0004f38:	c9                   	leave  
c0004f39:	c3                   	ret    

c0004f3a <put_key>:
c0004f3a:	55                   	push   %ebp
c0004f3b:	89 e5                	mov    %esp,%ebp
c0004f3d:	83 ec 04             	sub    $0x4,%esp
c0004f40:	8b 45 0c             	mov    0xc(%ebp),%eax
c0004f43:	88 45 fc             	mov    %al,-0x4(%ebp)
c0004f46:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f49:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f4f:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c0004f54:	77 4d                	ja     c0004fa3 <put_key+0x69>
c0004f56:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f59:	8b 00                	mov    (%eax),%eax
c0004f5b:	0f b6 55 fc          	movzbl -0x4(%ebp),%edx
c0004f5f:	89 10                	mov    %edx,(%eax)
c0004f61:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f64:	8b 00                	mov    (%eax),%eax
c0004f66:	8d 50 04             	lea    0x4(%eax),%edx
c0004f69:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f6c:	89 10                	mov    %edx,(%eax)
c0004f6e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f71:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0004f77:	8d 50 01             	lea    0x1(%eax),%edx
c0004f7a:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f7d:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0004f83:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f86:	8b 00                	mov    (%eax),%eax
c0004f88:	8b 55 08             	mov    0x8(%ebp),%edx
c0004f8b:	83 c2 08             	add    $0x8,%edx
c0004f8e:	81 c2 00 08 00 00    	add    $0x800,%edx
c0004f94:	39 d0                	cmp    %edx,%eax
c0004f96:	75 0b                	jne    c0004fa3 <put_key+0x69>
c0004f98:	8b 45 08             	mov    0x8(%ebp),%eax
c0004f9b:	8d 50 08             	lea    0x8(%eax),%edx
c0004f9e:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fa1:	89 10                	mov    %edx,(%eax)
c0004fa3:	90                   	nop
c0004fa4:	c9                   	leave  
c0004fa5:	c3                   	ret    

c0004fa6 <scroll_up>:
c0004fa6:	55                   	push   %ebp
c0004fa7:	89 e5                	mov    %esp,%ebp
c0004fa9:	83 ec 08             	sub    $0x8,%esp
c0004fac:	8b 45 08             	mov    0x8(%ebp),%eax
c0004faf:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fb5:	8b 40 08             	mov    0x8(%eax),%eax
c0004fb8:	8d 50 b0             	lea    -0x50(%eax),%edx
c0004fbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fbe:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fc4:	8b 00                	mov    (%eax),%eax
c0004fc6:	39 c2                	cmp    %eax,%edx
c0004fc8:	76 1b                	jbe    c0004fe5 <scroll_up+0x3f>
c0004fca:	8b 45 08             	mov    0x8(%ebp),%eax
c0004fcd:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004fd3:	8b 40 08             	mov    0x8(%eax),%eax
c0004fd6:	83 e8 50             	sub    $0x50,%eax
c0004fd9:	83 ec 0c             	sub    $0xc,%esp
c0004fdc:	50                   	push   %eax
c0004fdd:	e8 fa fe ff ff       	call   c0004edc <set_console_start_video_addr>
c0004fe2:	83 c4 10             	add    $0x10,%esp
c0004fe5:	90                   	nop
c0004fe6:	c9                   	leave  
c0004fe7:	c3                   	ret    

c0004fe8 <scroll_down>:
c0004fe8:	55                   	push   %ebp
c0004fe9:	89 e5                	mov    %esp,%ebp
c0004feb:	83 ec 08             	sub    $0x8,%esp
c0004fee:	8b 45 08             	mov    0x8(%ebp),%eax
c0004ff1:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0004ff7:	8b 40 08             	mov    0x8(%eax),%eax
c0004ffa:	8d 48 50             	lea    0x50(%eax),%ecx
c0004ffd:	8b 45 08             	mov    0x8(%ebp),%eax
c0005000:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005006:	8b 10                	mov    (%eax),%edx
c0005008:	8b 45 08             	mov    0x8(%ebp),%eax
c000500b:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005011:	8b 40 04             	mov    0x4(%eax),%eax
c0005014:	01 d0                	add    %edx,%eax
c0005016:	39 c1                	cmp    %eax,%ecx
c0005018:	73 36                	jae    c0005050 <scroll_down+0x68>
c000501a:	8b 45 08             	mov    0x8(%ebp),%eax
c000501d:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005023:	8b 40 08             	mov    0x8(%eax),%eax
c0005026:	83 c0 50             	add    $0x50,%eax
c0005029:	83 ec 0c             	sub    $0xc,%esp
c000502c:	50                   	push   %eax
c000502d:	e8 aa fe ff ff       	call   c0004edc <set_console_start_video_addr>
c0005032:	83 c4 10             	add    $0x10,%esp
c0005035:	8b 45 08             	mov    0x8(%ebp),%eax
c0005038:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000503e:	8b 50 08             	mov    0x8(%eax),%edx
c0005041:	8b 45 08             	mov    0x8(%ebp),%eax
c0005044:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000504a:	83 c2 50             	add    $0x50,%edx
c000504d:	89 50 08             	mov    %edx,0x8(%eax)
c0005050:	90                   	nop
c0005051:	c9                   	leave  
c0005052:	c3                   	ret    

c0005053 <out_char>:
c0005053:	55                   	push   %ebp
c0005054:	89 e5                	mov    %esp,%ebp
c0005056:	83 ec 28             	sub    $0x28,%esp
c0005059:	8b 45 0c             	mov    0xc(%ebp),%eax
c000505c:	88 45 e4             	mov    %al,-0x1c(%ebp)
c000505f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005062:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005068:	8b 40 0c             	mov    0xc(%eax),%eax
c000506b:	05 00 c0 05 60       	add    $0x6005c000,%eax
c0005070:	01 c0                	add    %eax,%eax
c0005072:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005075:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
c0005079:	83 f8 08             	cmp    $0x8,%eax
c000507c:	0f 84 8d 00 00 00    	je     c000510f <out_char+0xbc>
c0005082:	83 f8 0a             	cmp    $0xa,%eax
c0005085:	0f 85 c9 00 00 00    	jne    c0005154 <out_char+0x101>
c000508b:	8b 45 08             	mov    0x8(%ebp),%eax
c000508e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005094:	8b 50 0c             	mov    0xc(%eax),%edx
c0005097:	8b 45 08             	mov    0x8(%ebp),%eax
c000509a:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050a0:	8b 08                	mov    (%eax),%ecx
c00050a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00050a5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050ab:	8b 40 04             	mov    0x4(%eax),%eax
c00050ae:	01 c8                	add    %ecx,%eax
c00050b0:	83 e8 50             	sub    $0x50,%eax
c00050b3:	39 c2                	cmp    %eax,%edx
c00050b5:	0f 83 f4 00 00 00    	jae    c00051af <out_char+0x15c>
c00050bb:	8b 45 08             	mov    0x8(%ebp),%eax
c00050be:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050c4:	8b 08                	mov    (%eax),%ecx
c00050c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00050c9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050cf:	8b 50 0c             	mov    0xc(%eax),%edx
c00050d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00050d5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00050db:	8b 00                	mov    (%eax),%eax
c00050dd:	29 c2                	sub    %eax,%edx
c00050df:	89 d0                	mov    %edx,%eax
c00050e1:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
c00050e6:	f7 e2                	mul    %edx
c00050e8:	89 d0                	mov    %edx,%eax
c00050ea:	c1 e8 06             	shr    $0x6,%eax
c00050ed:	8d 50 01             	lea    0x1(%eax),%edx
c00050f0:	89 d0                	mov    %edx,%eax
c00050f2:	c1 e0 02             	shl    $0x2,%eax
c00050f5:	01 d0                	add    %edx,%eax
c00050f7:	c1 e0 04             	shl    $0x4,%eax
c00050fa:	89 c2                	mov    %eax,%edx
c00050fc:	8b 45 08             	mov    0x8(%ebp),%eax
c00050ff:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005105:	01 ca                	add    %ecx,%edx
c0005107:	89 50 0c             	mov    %edx,0xc(%eax)
c000510a:	e9 a0 00 00 00       	jmp    c00051af <out_char+0x15c>
c000510f:	8b 45 08             	mov    0x8(%ebp),%eax
c0005112:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005118:	8b 50 0c             	mov    0xc(%eax),%edx
c000511b:	8b 45 08             	mov    0x8(%ebp),%eax
c000511e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005124:	8b 00                	mov    (%eax),%eax
c0005126:	39 c2                	cmp    %eax,%edx
c0005128:	0f 86 84 00 00 00    	jbe    c00051b2 <out_char+0x15f>
c000512e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005131:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005137:	8b 50 0c             	mov    0xc(%eax),%edx
c000513a:	83 ea 01             	sub    $0x1,%edx
c000513d:	89 50 0c             	mov    %edx,0xc(%eax)
c0005140:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005143:	83 e8 02             	sub    $0x2,%eax
c0005146:	c6 00 20             	movb   $0x20,(%eax)
c0005149:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000514c:	83 e8 01             	sub    $0x1,%eax
c000514f:	c6 00 00             	movb   $0x0,(%eax)
c0005152:	eb 5e                	jmp    c00051b2 <out_char+0x15f>
c0005154:	8b 45 08             	mov    0x8(%ebp),%eax
c0005157:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000515d:	8b 40 0c             	mov    0xc(%eax),%eax
c0005160:	8d 48 01             	lea    0x1(%eax),%ecx
c0005163:	8b 45 08             	mov    0x8(%ebp),%eax
c0005166:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c000516c:	8b 10                	mov    (%eax),%edx
c000516e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005171:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c0005177:	8b 40 04             	mov    0x4(%eax),%eax
c000517a:	01 d0                	add    %edx,%eax
c000517c:	39 c1                	cmp    %eax,%ecx
c000517e:	73 35                	jae    c00051b5 <out_char+0x162>
c0005180:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005183:	8d 50 01             	lea    0x1(%eax),%edx
c0005186:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0005189:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
c000518d:	88 10                	mov    %dl,(%eax)
c000518f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005192:	8d 50 01             	lea    0x1(%eax),%edx
c0005195:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0005198:	c6 00 0a             	movb   $0xa,(%eax)
c000519b:	8b 45 08             	mov    0x8(%ebp),%eax
c000519e:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051a4:	8b 50 0c             	mov    0xc(%eax),%edx
c00051a7:	83 c2 01             	add    $0x1,%edx
c00051aa:	89 50 0c             	mov    %edx,0xc(%eax)
c00051ad:	eb 06                	jmp    c00051b5 <out_char+0x162>
c00051af:	90                   	nop
c00051b0:	eb 14                	jmp    c00051c6 <out_char+0x173>
c00051b2:	90                   	nop
c00051b3:	eb 11                	jmp    c00051c6 <out_char+0x173>
c00051b5:	90                   	nop
c00051b6:	eb 0e                	jmp    c00051c6 <out_char+0x173>
c00051b8:	83 ec 0c             	sub    $0xc,%esp
c00051bb:	ff 75 08             	pushl  0x8(%ebp)
c00051be:	e8 25 fe ff ff       	call   c0004fe8 <scroll_down>
c00051c3:	83 c4 10             	add    $0x10,%esp
c00051c6:	8b 45 08             	mov    0x8(%ebp),%eax
c00051c9:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051cf:	8b 50 0c             	mov    0xc(%eax),%edx
c00051d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00051d5:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00051db:	8b 40 08             	mov    0x8(%eax),%eax
c00051de:	29 c2                	sub    %eax,%edx
c00051e0:	89 d0                	mov    %edx,%eax
c00051e2:	3d d0 07 00 00       	cmp    $0x7d0,%eax
c00051e7:	77 cf                	ja     c00051b8 <out_char+0x165>
c00051e9:	83 ec 0c             	sub    $0xc,%esp
c00051ec:	ff 75 08             	pushl  0x8(%ebp)
c00051ef:	e8 51 fc ff ff       	call   c0004e45 <flush>
c00051f4:	83 c4 10             	add    $0x10,%esp
c00051f7:	90                   	nop
c00051f8:	c9                   	leave  
c00051f9:	c3                   	ret    

c00051fa <tty_dev_read>:
c00051fa:	55                   	push   %ebp
c00051fb:	89 e5                	mov    %esp,%ebp
c00051fd:	83 ec 08             	sub    $0x8,%esp
c0005200:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0005205:	39 45 08             	cmp    %eax,0x8(%ebp)
c0005208:	75 17                	jne    c0005221 <tty_dev_read+0x27>
c000520a:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c000520f:	85 c0                	test   %eax,%eax
c0005211:	7e 0e                	jle    c0005221 <tty_dev_read+0x27>
c0005213:	83 ec 0c             	sub    $0xc,%esp
c0005216:	ff 75 08             	pushl  0x8(%ebp)
c0005219:	e8 84 07 00 00       	call   c00059a2 <keyboard_read>
c000521e:	83 c4 10             	add    $0x10,%esp
c0005221:	90                   	nop
c0005222:	c9                   	leave  
c0005223:	c3                   	ret    

c0005224 <tty_dev_write>:
c0005224:	55                   	push   %ebp
c0005225:	89 e5                	mov    %esp,%ebp
c0005227:	83 ec 28             	sub    $0x28,%esp
c000522a:	8b 45 08             	mov    0x8(%ebp),%eax
c000522d:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005233:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005236:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000523d:	e9 88 01 00 00       	jmp    c00053ca <tty_dev_write+0x1a6>
c0005242:	8b 45 08             	mov    0x8(%ebp),%eax
c0005245:	8b 40 04             	mov    0x4(%eax),%eax
c0005248:	8b 00                	mov    (%eax),%eax
c000524a:	88 45 e7             	mov    %al,-0x19(%ebp)
c000524d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005250:	8b 40 04             	mov    0x4(%eax),%eax
c0005253:	8d 50 04             	lea    0x4(%eax),%edx
c0005256:	8b 45 08             	mov    0x8(%ebp),%eax
c0005259:	89 50 04             	mov    %edx,0x4(%eax)
c000525c:	8b 45 08             	mov    0x8(%ebp),%eax
c000525f:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005265:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005268:	8b 45 08             	mov    0x8(%ebp),%eax
c000526b:	89 90 08 08 00 00    	mov    %edx,0x808(%eax)
c0005271:	8b 45 08             	mov    0x8(%ebp),%eax
c0005274:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c000527a:	8d 50 01             	lea    0x1(%eax),%edx
c000527d:	8b 45 08             	mov    0x8(%ebp),%eax
c0005280:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005286:	8b 45 08             	mov    0x8(%ebp),%eax
c0005289:	8b 40 04             	mov    0x4(%eax),%eax
c000528c:	8b 55 08             	mov    0x8(%ebp),%edx
c000528f:	83 c2 08             	add    $0x8,%edx
c0005292:	81 c2 00 08 00 00    	add    $0x800,%edx
c0005298:	39 d0                	cmp    %edx,%eax
c000529a:	75 0c                	jne    c00052a8 <tty_dev_write+0x84>
c000529c:	8b 45 08             	mov    0x8(%ebp),%eax
c000529f:	8d 50 08             	lea    0x8(%eax),%edx
c00052a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00052a5:	89 50 04             	mov    %edx,0x4(%eax)
c00052a8:	8b 45 08             	mov    0x8(%ebp),%eax
c00052ab:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c00052b1:	85 c0                	test   %eax,%eax
c00052b3:	0f 84 11 01 00 00    	je     c00053ca <tty_dev_write+0x1a6>
c00052b9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052bd:	3c 20                	cmp    $0x20,%al
c00052bf:	76 08                	jbe    c00052c9 <tty_dev_write+0xa5>
c00052c1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052c5:	3c 7e                	cmp    $0x7e,%al
c00052c7:	76 10                	jbe    c00052d9 <tty_dev_write+0xb5>
c00052c9:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052cd:	3c 20                	cmp    $0x20,%al
c00052cf:	74 08                	je     c00052d9 <tty_dev_write+0xb5>
c00052d1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c00052d5:	84 c0                	test   %al,%al
c00052d7:	75 58                	jne    c0005331 <tty_dev_write+0x10d>
c00052d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00052dc:	8b 90 18 08 00 00    	mov    0x818(%eax),%edx
c00052e2:	8b 45 08             	mov    0x8(%ebp),%eax
c00052e5:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c00052eb:	01 d0                	add    %edx,%eax
c00052ed:	83 e8 01             	sub    $0x1,%eax
c00052f0:	89 c2                	mov    %eax,%edx
c00052f2:	83 ec 04             	sub    $0x4,%esp
c00052f5:	6a 01                	push   $0x1
c00052f7:	8d 45 e7             	lea    -0x19(%ebp),%eax
c00052fa:	50                   	push   %eax
c00052fb:	52                   	push   %edx
c00052fc:	e8 c3 60 00 00       	call   c000b3c4 <Memcpy>
c0005301:	83 c4 10             	add    $0x10,%esp
c0005304:	8b 45 08             	mov    0x8(%ebp),%eax
c0005307:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c000530d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005310:	8b 45 08             	mov    0x8(%ebp),%eax
c0005313:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005319:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000531d:	0f b6 c0             	movzbl %al,%eax
c0005320:	83 ec 08             	sub    $0x8,%esp
c0005323:	50                   	push   %eax
c0005324:	ff 75 08             	pushl  0x8(%ebp)
c0005327:	e8 27 fd ff ff       	call   c0005053 <out_char>
c000532c:	83 c4 10             	add    $0x10,%esp
c000532f:	eb 7c                	jmp    c00053ad <tty_dev_write+0x189>
c0005331:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005335:	3c 08                	cmp    $0x8,%al
c0005337:	75 42                	jne    c000537b <tty_dev_write+0x157>
c0005339:	8b 45 08             	mov    0x8(%ebp),%eax
c000533c:	8b 80 0c 08 00 00    	mov    0x80c(%eax),%eax
c0005342:	8d 50 01             	lea    0x1(%eax),%edx
c0005345:	8b 45 08             	mov    0x8(%ebp),%eax
c0005348:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c000534e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005351:	8b 80 10 08 00 00    	mov    0x810(%eax),%eax
c0005357:	8d 50 fe             	lea    -0x2(%eax),%edx
c000535a:	8b 45 08             	mov    0x8(%ebp),%eax
c000535d:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c0005363:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005367:	0f b6 c0             	movzbl %al,%eax
c000536a:	83 ec 08             	sub    $0x8,%esp
c000536d:	50                   	push   %eax
c000536e:	ff 75 08             	pushl  0x8(%ebp)
c0005371:	e8 dd fc ff ff       	call   c0005053 <out_char>
c0005376:	83 c4 10             	add    $0x10,%esp
c0005379:	eb 32                	jmp    c00053ad <tty_dev_write+0x189>
c000537b:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c000537f:	3c 0a                	cmp    $0xa,%al
c0005381:	75 2a                	jne    c00053ad <tty_dev_write+0x189>
c0005383:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
c0005387:	0f b6 c0             	movzbl %al,%eax
c000538a:	83 ec 08             	sub    $0x8,%esp
c000538d:	50                   	push   %eax
c000538e:	ff 75 08             	pushl  0x8(%ebp)
c0005391:	e8 bd fc ff ff       	call   c0005053 <out_char>
c0005396:	83 c4 10             	add    $0x10,%esp
c0005399:	8b 45 08             	mov    0x8(%ebp),%eax
c000539c:	c7 80 0c 08 00 00 00 	movl   $0x0,0x80c(%eax)
c00053a3:	00 00 00 
c00053a6:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00053ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b0:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00053b6:	8b 45 08             	mov    0x8(%ebp),%eax
c00053b9:	8b 80 14 08 00 00    	mov    0x814(%eax),%eax
c00053bf:	39 c2                	cmp    %eax,%edx
c00053c1:	75 07                	jne    c00053ca <tty_dev_write+0x1a6>
c00053c3:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00053ca:	8b 45 08             	mov    0x8(%ebp),%eax
c00053cd:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c00053d3:	85 c0                	test   %eax,%eax
c00053d5:	0f 85 67 fe ff ff    	jne    c0005242 <tty_dev_write+0x1e>
c00053db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00053df:	74 5c                	je     c000543d <tty_dev_write+0x219>
c00053e1:	c7 45 ec 6c 00 00 00 	movl   $0x6c,-0x14(%ebp)
c00053e8:	83 ec 0c             	sub    $0xc,%esp
c00053eb:	ff 75 ec             	pushl  -0x14(%ebp)
c00053ee:	e8 eb 1a 00 00       	call   c0006ede <sys_malloc>
c00053f3:	83 c4 10             	add    $0x10,%esp
c00053f6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00053f9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00053fc:	c7 40 68 66 00 00 00 	movl   $0x66,0x68(%eax)
c0005403:	8b 45 08             	mov    0x8(%ebp),%eax
c0005406:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c000540c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000540f:	89 50 50             	mov    %edx,0x50(%eax)
c0005412:	8b 45 08             	mov    0x8(%ebp),%eax
c0005415:	8b 90 20 08 00 00    	mov    0x820(%eax),%edx
c000541b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000541e:	89 50 58             	mov    %edx,0x58(%eax)
c0005421:	8b 45 08             	mov    0x8(%ebp),%eax
c0005424:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c000542a:	83 ec 04             	sub    $0x4,%esp
c000542d:	50                   	push   %eax
c000542e:	ff 75 e8             	pushl  -0x18(%ebp)
c0005431:	6a 01                	push   $0x1
c0005433:	e8 a6 46 00 00       	call   c0009ade <send_rec>
c0005438:	83 c4 10             	add    $0x10,%esp
c000543b:	eb 01                	jmp    c000543e <tty_dev_write+0x21a>
c000543d:	90                   	nop
c000543e:	c9                   	leave  
c000543f:	c3                   	ret    

c0005440 <tty_do_read>:
c0005440:	55                   	push   %ebp
c0005441:	89 e5                	mov    %esp,%ebp
c0005443:	83 ec 08             	sub    $0x8,%esp
c0005446:	8b 45 08             	mov    0x8(%ebp),%eax
c0005449:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c0005450:	00 00 00 
c0005453:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005456:	8b 50 58             	mov    0x58(%eax),%edx
c0005459:	8b 45 08             	mov    0x8(%ebp),%eax
c000545c:	89 90 20 08 00 00    	mov    %edx,0x820(%eax)
c0005462:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005465:	8b 00                	mov    (%eax),%eax
c0005467:	89 c2                	mov    %eax,%edx
c0005469:	8b 45 08             	mov    0x8(%ebp),%eax
c000546c:	89 90 1c 08 00 00    	mov    %edx,0x81c(%eax)
c0005472:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005475:	8b 50 50             	mov    0x50(%eax),%edx
c0005478:	8b 45 08             	mov    0x8(%ebp),%eax
c000547b:	89 90 0c 08 00 00    	mov    %edx,0x80c(%eax)
c0005481:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005484:	8b 50 50             	mov    0x50(%eax),%edx
c0005487:	8b 45 08             	mov    0x8(%ebp),%eax
c000548a:	89 90 14 08 00 00    	mov    %edx,0x814(%eax)
c0005490:	8b 45 08             	mov    0x8(%ebp),%eax
c0005493:	8b 90 0c 08 00 00    	mov    0x80c(%eax),%edx
c0005499:	8b 45 0c             	mov    0xc(%ebp),%eax
c000549c:	8b 40 10             	mov    0x10(%eax),%eax
c000549f:	83 ec 08             	sub    $0x8,%esp
c00054a2:	52                   	push   %edx
c00054a3:	50                   	push   %eax
c00054a4:	e8 f4 18 00 00       	call   c0006d9d <alloc_virtual_memory>
c00054a9:	83 c4 10             	add    $0x10,%esp
c00054ac:	89 c2                	mov    %eax,%edx
c00054ae:	8b 45 08             	mov    0x8(%ebp),%eax
c00054b1:	89 90 18 08 00 00    	mov    %edx,0x818(%eax)
c00054b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00054ba:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00054c0:	83 f8 04             	cmp    $0x4,%eax
c00054c3:	74 1c                	je     c00054e1 <tty_do_read+0xa1>
c00054c5:	68 27 01 00 00       	push   $0x127
c00054ca:	68 e5 ab 00 c0       	push   $0xc000abe5
c00054cf:	68 e5 ab 00 c0       	push   $0xc000abe5
c00054d4:	68 ef ab 00 c0       	push   $0xc000abef
c00054d9:	e8 b5 3d 00 00       	call   c0009293 <assertion_failure>
c00054de:	83 c4 10             	add    $0x10,%esp
c00054e1:	8b 45 0c             	mov    0xc(%ebp),%eax
c00054e4:	c7 40 68 67 00 00 00 	movl   $0x67,0x68(%eax)
c00054eb:	8b 45 08             	mov    0x8(%ebp),%eax
c00054ee:	8b 80 1c 08 00 00    	mov    0x81c(%eax),%eax
c00054f4:	83 ec 04             	sub    $0x4,%esp
c00054f7:	50                   	push   %eax
c00054f8:	ff 75 0c             	pushl  0xc(%ebp)
c00054fb:	6a 01                	push   $0x1
c00054fd:	e8 dc 45 00 00       	call   c0009ade <send_rec>
c0005502:	83 c4 10             	add    $0x10,%esp
c0005505:	90                   	nop
c0005506:	c9                   	leave  
c0005507:	c3                   	ret    

c0005508 <tty_do_write>:
c0005508:	55                   	push   %ebp
c0005509:	89 e5                	mov    %esp,%ebp
c000550b:	53                   	push   %ebx
c000550c:	83 ec 24             	sub    $0x24,%esp
c000550f:	89 e0                	mov    %esp,%eax
c0005511:	89 c3                	mov    %eax,%ebx
c0005513:	c7 45 e8 80 00 00 00 	movl   $0x80,-0x18(%ebp)
c000551a:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000551d:	8d 50 ff             	lea    -0x1(%eax),%edx
c0005520:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0005523:	89 c2                	mov    %eax,%edx
c0005525:	b8 10 00 00 00       	mov    $0x10,%eax
c000552a:	83 e8 01             	sub    $0x1,%eax
c000552d:	01 d0                	add    %edx,%eax
c000552f:	b9 10 00 00 00       	mov    $0x10,%ecx
c0005534:	ba 00 00 00 00       	mov    $0x0,%edx
c0005539:	f7 f1                	div    %ecx
c000553b:	6b c0 10             	imul   $0x10,%eax,%eax
c000553e:	29 c4                	sub    %eax,%esp
c0005540:	89 e0                	mov    %esp,%eax
c0005542:	83 c0 00             	add    $0x0,%eax
c0005545:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0005548:	83 ec 04             	sub    $0x4,%esp
c000554b:	ff 75 e8             	pushl  -0x18(%ebp)
c000554e:	6a 00                	push   $0x0
c0005550:	ff 75 e0             	pushl  -0x20(%ebp)
c0005553:	e8 9a 5e 00 00       	call   c000b3f2 <Memset>
c0005558:	83 c4 10             	add    $0x10,%esp
c000555b:	8b 45 0c             	mov    0xc(%ebp),%eax
c000555e:	8b 40 50             	mov    0x50(%eax),%eax
c0005561:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005564:	8b 45 08             	mov    0x8(%ebp),%eax
c0005567:	c7 80 10 08 00 00 00 	movl   $0x0,0x810(%eax)
c000556e:	00 00 00 
c0005571:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005574:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005577:	8b 40 10             	mov    0x10(%eax),%eax
c000557a:	83 ec 08             	sub    $0x8,%esp
c000557d:	52                   	push   %edx
c000557e:	50                   	push   %eax
c000557f:	e8 19 18 00 00       	call   c0006d9d <alloc_virtual_memory>
c0005584:	83 c4 10             	add    $0x10,%esp
c0005587:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000558a:	eb 7e                	jmp    c000560a <tty_do_write+0x102>
c000558c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000558f:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0005592:	0f 4e 45 ec          	cmovle -0x14(%ebp),%eax
c0005596:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005599:	8b 45 08             	mov    0x8(%ebp),%eax
c000559c:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055a2:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00055a5:	01 d0                	add    %edx,%eax
c00055a7:	83 ec 04             	sub    $0x4,%esp
c00055aa:	ff 75 f0             	pushl  -0x10(%ebp)
c00055ad:	50                   	push   %eax
c00055ae:	ff 75 e0             	pushl  -0x20(%ebp)
c00055b1:	e8 0e 5e 00 00       	call   c000b3c4 <Memcpy>
c00055b6:	83 c4 10             	add    $0x10,%esp
c00055b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055bc:	29 45 ec             	sub    %eax,-0x14(%ebp)
c00055bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00055c2:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c00055c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00055cb:	01 c2                	add    %eax,%edx
c00055cd:	8b 45 08             	mov    0x8(%ebp),%eax
c00055d0:	89 90 10 08 00 00    	mov    %edx,0x810(%eax)
c00055d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00055dd:	eb 25                	jmp    c0005604 <tty_do_write+0xfc>
c00055df:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00055e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00055e5:	01 d0                	add    %edx,%eax
c00055e7:	0f b6 00             	movzbl (%eax),%eax
c00055ea:	0f b6 c0             	movzbl %al,%eax
c00055ed:	83 ec 08             	sub    $0x8,%esp
c00055f0:	50                   	push   %eax
c00055f1:	ff 75 08             	pushl  0x8(%ebp)
c00055f4:	e8 5a fa ff ff       	call   c0005053 <out_char>
c00055f9:	83 c4 10             	add    $0x10,%esp
c00055fc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0005600:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
c0005604:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0005608:	75 d5                	jne    c00055df <tty_do_write+0xd7>
c000560a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c000560e:	0f 85 78 ff ff ff    	jne    c000558c <tty_do_write+0x84>
c0005614:	83 ec 0c             	sub    $0xc,%esp
c0005617:	6a 6c                	push   $0x6c
c0005619:	e8 c0 18 00 00       	call   c0006ede <sys_malloc>
c000561e:	83 c4 10             	add    $0x10,%esp
c0005621:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0005624:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005627:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c000562e:	8b 45 08             	mov    0x8(%ebp),%eax
c0005631:	8b 90 10 08 00 00    	mov    0x810(%eax),%edx
c0005637:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000563a:	89 50 48             	mov    %edx,0x48(%eax)
c000563d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005640:	8b 00                	mov    (%eax),%eax
c0005642:	83 ec 04             	sub    $0x4,%esp
c0005645:	50                   	push   %eax
c0005646:	ff 75 d8             	pushl  -0x28(%ebp)
c0005649:	6a 01                	push   $0x1
c000564b:	e8 8e 44 00 00       	call   c0009ade <send_rec>
c0005650:	83 c4 10             	add    $0x10,%esp
c0005653:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005656:	83 ec 08             	sub    $0x8,%esp
c0005659:	6a 6c                	push   $0x6c
c000565b:	50                   	push   %eax
c000565c:	e8 5c 1b 00 00       	call   c00071bd <sys_free>
c0005661:	83 c4 10             	add    $0x10,%esp
c0005664:	89 dc                	mov    %ebx,%esp
c0005666:	90                   	nop
c0005667:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c000566a:	c9                   	leave  
c000566b:	c3                   	ret    

c000566c <init_screen>:
c000566c:	55                   	push   %ebp
c000566d:	89 e5                	mov    %esp,%ebp
c000566f:	83 ec 10             	sub    $0x10,%esp
c0005672:	8b 45 08             	mov    0x8(%ebp),%eax
c0005675:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c000567a:	c1 f8 03             	sar    $0x3,%eax
c000567d:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c0005683:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0005686:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0005689:	c1 e0 04             	shl    $0x4,%eax
c000568c:	8d 90 00 1f 01 c0    	lea    -0x3ffee100(%eax),%edx
c0005692:	8b 45 08             	mov    0x8(%ebp),%eax
c0005695:	89 90 24 08 00 00    	mov    %edx,0x824(%eax)
c000569b:	c7 45 f8 ff 3f 00 00 	movl   $0x3fff,-0x8(%ebp)
c00056a2:	8b 45 08             	mov    0x8(%ebp),%eax
c00056a5:	8b 88 24 08 00 00    	mov    0x824(%eax),%ecx
c00056ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00056ae:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
c00056b3:	f7 e2                	mul    %edx
c00056b5:	89 d0                	mov    %edx,%eax
c00056b7:	d1 e8                	shr    %eax
c00056b9:	89 41 04             	mov    %eax,0x4(%ecx)
c00056bc:	8b 45 08             	mov    0x8(%ebp),%eax
c00056bf:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056c5:	8b 50 04             	mov    0x4(%eax),%edx
c00056c8:	8b 45 08             	mov    0x8(%ebp),%eax
c00056cb:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056d1:	0f af 55 fc          	imul   -0x4(%ebp),%edx
c00056d5:	89 10                	mov    %edx,(%eax)
c00056d7:	8b 45 08             	mov    0x8(%ebp),%eax
c00056da:	8b 90 24 08 00 00    	mov    0x824(%eax),%edx
c00056e0:	8b 45 08             	mov    0x8(%ebp),%eax
c00056e3:	8b 80 24 08 00 00    	mov    0x824(%eax),%eax
c00056e9:	8b 12                	mov    (%edx),%edx
c00056eb:	89 50 08             	mov    %edx,0x8(%eax)
c00056ee:	8b 55 08             	mov    0x8(%ebp),%edx
c00056f1:	8b 92 24 08 00 00    	mov    0x824(%edx),%edx
c00056f7:	8b 40 08             	mov    0x8(%eax),%eax
c00056fa:	89 42 0c             	mov    %eax,0xc(%edx)
c00056fd:	90                   	nop
c00056fe:	c9                   	leave  
c00056ff:	c3                   	ret    

c0005700 <init_tty>:
c0005700:	55                   	push   %ebp
c0005701:	89 e5                	mov    %esp,%ebp
c0005703:	83 ec 18             	sub    $0x18,%esp
c0005706:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c000570d:	e9 92 00 00 00       	jmp    c00057a4 <init_tty+0xa4>
c0005712:	83 ec 04             	sub    $0x4,%esp
c0005715:	68 28 08 00 00       	push   $0x828
c000571a:	6a 00                	push   $0x0
c000571c:	ff 75 f4             	pushl  -0xc(%ebp)
c000571f:	e8 ce 5c 00 00       	call   c000b3f2 <Memset>
c0005724:	83 c4 10             	add    $0x10,%esp
c0005727:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000572a:	8d 50 08             	lea    0x8(%eax),%edx
c000572d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005730:	89 50 04             	mov    %edx,0x4(%eax)
c0005733:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005736:	8b 50 04             	mov    0x4(%eax),%edx
c0005739:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000573c:	89 10                	mov    %edx,(%eax)
c000573e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005741:	c7 80 08 08 00 00 00 	movl   $0x0,0x808(%eax)
c0005748:	00 00 00 
c000574b:	83 ec 0c             	sub    $0xc,%esp
c000574e:	ff 75 f4             	pushl  -0xc(%ebp)
c0005751:	e8 16 ff ff ff       	call   c000566c <init_screen>
c0005756:	83 c4 10             	add    $0x10,%esp
c0005759:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000575c:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0005761:	85 c0                	test   %eax,%eax
c0005763:	7e 38                	jle    c000579d <init_tty+0x9d>
c0005765:	83 ec 08             	sub    $0x8,%esp
c0005768:	6a 23                	push   $0x23
c000576a:	ff 75 f4             	pushl  -0xc(%ebp)
c000576d:	e8 e1 f8 ff ff       	call   c0005053 <out_char>
c0005772:	83 c4 10             	add    $0x10,%esp
c0005775:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005778:	05 a8 8f 01 00       	add    $0x18fa8,%eax
c000577d:	2d a0 fd 00 c0       	sub    $0xc000fda0,%eax
c0005782:	c1 f8 03             	sar    $0x3,%eax
c0005785:	69 c0 cd a3 45 25    	imul   $0x2545a3cd,%eax,%eax
c000578b:	0f b6 c0             	movzbl %al,%eax
c000578e:	83 ec 08             	sub    $0x8,%esp
c0005791:	50                   	push   %eax
c0005792:	ff 75 f4             	pushl  -0xc(%ebp)
c0005795:	e8 b9 f8 ff ff       	call   c0005053 <out_char>
c000579a:	83 c4 10             	add    $0x10,%esp
c000579d:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c00057a4:	b8 18 16 01 c0       	mov    $0xc0011618,%eax
c00057a9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c00057ac:	0f 82 60 ff ff ff    	jb     c0005712 <init_tty+0x12>
c00057b2:	90                   	nop
c00057b3:	c9                   	leave  
c00057b4:	c3                   	ret    

c00057b5 <TaskTTY>:
c00057b5:	55                   	push   %ebp
c00057b6:	89 e5                	mov    %esp,%ebp
c00057b8:	83 ec 28             	sub    $0x28,%esp
c00057bb:	e8 40 ff ff ff       	call   c0005700 <init_tty>
c00057c0:	83 ec 0c             	sub    $0xc,%esp
c00057c3:	6a 00                	push   $0x0
c00057c5:	e8 3f f6 ff ff       	call   c0004e09 <select_console>
c00057ca:	83 c4 10             	add    $0x10,%esp
c00057cd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00057d4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c00057db:	83 ec 0c             	sub    $0xc,%esp
c00057de:	6a 6c                	push   $0x6c
c00057e0:	e8 f9 16 00 00       	call   c0006ede <sys_malloc>
c00057e5:	83 c4 10             	add    $0x10,%esp
c00057e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00057eb:	c7 45 f4 a0 fd 00 c0 	movl   $0xc000fda0,-0xc(%ebp)
c00057f2:	eb 30                	jmp    c0005824 <TaskTTY+0x6f>
c00057f4:	83 ec 0c             	sub    $0xc,%esp
c00057f7:	ff 75 f4             	pushl  -0xc(%ebp)
c00057fa:	e8 fb f9 ff ff       	call   c00051fa <tty_dev_read>
c00057ff:	83 c4 10             	add    $0x10,%esp
c0005802:	83 ec 0c             	sub    $0xc,%esp
c0005805:	ff 75 f4             	pushl  -0xc(%ebp)
c0005808:	e8 17 fa ff ff       	call   c0005224 <tty_dev_write>
c000580d:	83 c4 10             	add    $0x10,%esp
c0005810:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005813:	8b 80 08 08 00 00    	mov    0x808(%eax),%eax
c0005819:	85 c0                	test   %eax,%eax
c000581b:	75 d7                	jne    c00057f4 <TaskTTY+0x3f>
c000581d:	81 45 f4 28 08 00 00 	addl   $0x828,-0xc(%ebp)
c0005824:	b8 18 16 01 c0       	mov    $0xc0011618,%eax
c0005829:	39 45 f4             	cmp    %eax,-0xc(%ebp)
c000582c:	72 c6                	jb     c00057f4 <TaskTTY+0x3f>
c000582e:	83 ec 04             	sub    $0x4,%esp
c0005831:	6a 0e                	push   $0xe
c0005833:	ff 75 e8             	pushl  -0x18(%ebp)
c0005836:	6a 02                	push   $0x2
c0005838:	e8 a1 42 00 00       	call   c0009ade <send_rec>
c000583d:	83 c4 10             	add    $0x10,%esp
c0005840:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005843:	8b 40 68             	mov    0x68(%eax),%eax
c0005846:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0005849:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005850:	74 28                	je     c000587a <TaskTTY+0xc5>
c0005852:	81 7d e4 d2 07 00 00 	cmpl   $0x7d2,-0x1c(%ebp)
c0005859:	7f 0b                	jg     c0005866 <TaskTTY+0xb1>
c000585b:	81 7d e4 d1 07 00 00 	cmpl   $0x7d1,-0x1c(%ebp)
c0005862:	74 4e                	je     c00058b2 <TaskTTY+0xfd>
c0005864:	eb 4d                	jmp    c00058b3 <TaskTTY+0xfe>
c0005866:	81 7d e4 d3 07 00 00 	cmpl   $0x7d3,-0x1c(%ebp)
c000586d:	74 21                	je     c0005890 <TaskTTY+0xdb>
c000586f:	81 7d e4 d5 07 00 00 	cmpl   $0x7d5,-0x1c(%ebp)
c0005876:	74 2e                	je     c00058a6 <TaskTTY+0xf1>
c0005878:	eb 39                	jmp    c00058b3 <TaskTTY+0xfe>
c000587a:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c000587f:	83 ec 08             	sub    $0x8,%esp
c0005882:	ff 75 e8             	pushl  -0x18(%ebp)
c0005885:	50                   	push   %eax
c0005886:	e8 b5 fb ff ff       	call   c0005440 <tty_do_read>
c000588b:	83 c4 10             	add    $0x10,%esp
c000588e:	eb 23                	jmp    c00058b3 <TaskTTY+0xfe>
c0005890:	a1 20 f7 00 c0       	mov    0xc000f720,%eax
c0005895:	83 ec 08             	sub    $0x8,%esp
c0005898:	ff 75 e8             	pushl  -0x18(%ebp)
c000589b:	50                   	push   %eax
c000589c:	e8 67 fc ff ff       	call   c0005508 <tty_do_write>
c00058a1:	83 c4 10             	add    $0x10,%esp
c00058a4:	eb 0d                	jmp    c00058b3 <TaskTTY+0xfe>
c00058a6:	c7 05 a0 16 01 c0 00 	movl   $0x0,0xc00116a0
c00058ad:	00 00 00 
c00058b0:	eb 01                	jmp    c00058b3 <TaskTTY+0xfe>
c00058b2:	90                   	nop
c00058b3:	e9 33 ff ff ff       	jmp    c00057eb <TaskTTY+0x36>

c00058b8 <keyboard_handler>:
c00058b8:	55                   	push   %ebp
c00058b9:	89 e5                	mov    %esp,%ebp
c00058bb:	83 ec 18             	sub    $0x18,%esp
c00058be:	c7 05 a0 16 01 c0 01 	movl   $0x1,0xc00116a0
c00058c5:	00 00 00 
c00058c8:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)
c00058cf:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00058d4:	3d ff 01 00 00       	cmp    $0x1ff,%eax
c00058d9:	7f 5e                	jg     c0005939 <keyboard_handler+0x81>
c00058db:	e8 d8 be ff ff       	call   c00017b8 <disable_int>
c00058e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00058e3:	0f b7 c0             	movzwl %ax,%eax
c00058e6:	83 ec 0c             	sub    $0xc,%esp
c00058e9:	50                   	push   %eax
c00058ea:	e8 9b be ff ff       	call   c000178a <in_byte>
c00058ef:	83 c4 10             	add    $0x10,%esp
c00058f2:	88 45 f3             	mov    %al,-0xd(%ebp)
c00058f5:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c00058fa:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
c00058fe:	88 10                	mov    %dl,(%eax)
c0005900:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0005905:	83 c0 01             	add    $0x1,%eax
c0005908:	a3 80 fb 00 c0       	mov    %eax,0xc000fb80
c000590d:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005912:	83 c0 01             	add    $0x1,%eax
c0005915:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c000591a:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c000591f:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c0005924:	39 d0                	cmp    %edx,%eax
c0005926:	72 0a                	jb     c0005932 <keyboard_handler+0x7a>
c0005928:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c000592f:	fb 00 c0 
c0005932:	e8 83 be ff ff       	call   c00017ba <enable_int>
c0005937:	eb 01                	jmp    c000593a <keyboard_handler+0x82>
c0005939:	90                   	nop
c000593a:	c9                   	leave  
c000593b:	c3                   	ret    

c000593c <read_from_keyboard_buf>:
c000593c:	55                   	push   %ebp
c000593d:	89 e5                	mov    %esp,%ebp
c000593f:	83 ec 18             	sub    $0x18,%esp
c0005942:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
c0005946:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c000594b:	85 c0                	test   %eax,%eax
c000594d:	7f 06                	jg     c0005955 <read_from_keyboard_buf+0x19>
c000594f:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c0005953:	eb 4b                	jmp    c00059a0 <read_from_keyboard_buf+0x64>
c0005955:	e8 5e be ff ff       	call   c00017b8 <disable_int>
c000595a:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c000595f:	0f b6 00             	movzbl (%eax),%eax
c0005962:	88 45 f7             	mov    %al,-0x9(%ebp)
c0005965:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c000596a:	83 c0 01             	add    $0x1,%eax
c000596d:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c0005972:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c0005977:	83 e8 01             	sub    $0x1,%eax
c000597a:	a3 88 fb 00 c0       	mov    %eax,0xc000fb88
c000597f:	a1 84 fb 00 c0       	mov    0xc000fb84,%eax
c0005984:	ba 8c fd 00 c0       	mov    $0xc000fd8c,%edx
c0005989:	39 d0                	cmp    %edx,%eax
c000598b:	72 0a                	jb     c0005997 <read_from_keyboard_buf+0x5b>
c000598d:	c7 05 84 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb84
c0005994:	fb 00 c0 
c0005997:	e8 1e be ff ff       	call   c00017ba <enable_int>
c000599c:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
c00059a0:	c9                   	leave  
c00059a1:	c3                   	ret    

c00059a2 <keyboard_read>:
c00059a2:	55                   	push   %ebp
c00059a3:	89 e5                	mov    %esp,%ebp
c00059a5:	83 ec 28             	sub    $0x28,%esp
c00059a8:	90                   	nop
c00059a9:	a1 88 fb 00 c0       	mov    0xc000fb88,%eax
c00059ae:	85 c0                	test   %eax,%eax
c00059b0:	7e f7                	jle    c00059a9 <keyboard_read+0x7>
c00059b2:	e8 85 ff ff ff       	call   c000593c <read_from_keyboard_buf>
c00059b7:	88 45 ea             	mov    %al,-0x16(%ebp)
c00059ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00059c1:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c00059c5:	80 7d ea e1          	cmpb   $0xe1,-0x16(%ebp)
c00059c9:	75 5a                	jne    c0005a25 <keyboard_read+0x83>
c00059cb:	c6 45 e3 e1          	movb   $0xe1,-0x1d(%ebp)
c00059cf:	c6 45 e4 1d          	movb   $0x1d,-0x1c(%ebp)
c00059d3:	c6 45 e5 45          	movb   $0x45,-0x1b(%ebp)
c00059d7:	c6 45 e6 e1          	movb   $0xe1,-0x1a(%ebp)
c00059db:	c6 45 e7 9d          	movb   $0x9d,-0x19(%ebp)
c00059df:	c6 45 e8 c5          	movb   $0xc5,-0x18(%ebp)
c00059e3:	c6 45 f3 01          	movb   $0x1,-0xd(%ebp)
c00059e7:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c00059ee:	eb 20                	jmp    c0005a10 <keyboard_read+0x6e>
c00059f0:	e8 47 ff ff ff       	call   c000593c <read_from_keyboard_buf>
c00059f5:	89 c1                	mov    %eax,%ecx
c00059f7:	8d 55 e3             	lea    -0x1d(%ebp),%edx
c00059fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00059fd:	01 d0                	add    %edx,%eax
c00059ff:	0f b6 00             	movzbl (%eax),%eax
c0005a02:	38 c1                	cmp    %al,%cl
c0005a04:	74 06                	je     c0005a0c <keyboard_read+0x6a>
c0005a06:	c6 45 f3 00          	movb   $0x0,-0xd(%ebp)
c0005a0a:	eb 0a                	jmp    c0005a16 <keyboard_read+0x74>
c0005a0c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0005a10:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
c0005a14:	7e da                	jle    c00059f0 <keyboard_read+0x4e>
c0005a16:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
c0005a1a:	74 68                	je     c0005a84 <keyboard_read+0xe2>
c0005a1c:	c7 45 f4 80 01 00 00 	movl   $0x180,-0xc(%ebp)
c0005a23:	eb 5f                	jmp    c0005a84 <keyboard_read+0xe2>
c0005a25:	80 7d ea e0          	cmpb   $0xe0,-0x16(%ebp)
c0005a29:	75 59                	jne    c0005a84 <keyboard_read+0xe2>
c0005a2b:	e8 0c ff ff ff       	call   c000593c <read_from_keyboard_buf>
c0005a30:	3c 2a                	cmp    $0x2a,%al
c0005a32:	75 1d                	jne    c0005a51 <keyboard_read+0xaf>
c0005a34:	e8 03 ff ff ff       	call   c000593c <read_from_keyboard_buf>
c0005a39:	3c e0                	cmp    $0xe0,%al
c0005a3b:	75 14                	jne    c0005a51 <keyboard_read+0xaf>
c0005a3d:	e8 fa fe ff ff       	call   c000593c <read_from_keyboard_buf>
c0005a42:	3c 37                	cmp    $0x37,%al
c0005a44:	75 0b                	jne    c0005a51 <keyboard_read+0xaf>
c0005a46:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005a4d:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
c0005a51:	e8 e6 fe ff ff       	call   c000593c <read_from_keyboard_buf>
c0005a56:	3c b7                	cmp    $0xb7,%al
c0005a58:	75 1d                	jne    c0005a77 <keyboard_read+0xd5>
c0005a5a:	e8 dd fe ff ff       	call   c000593c <read_from_keyboard_buf>
c0005a5f:	3c e0                	cmp    $0xe0,%al
c0005a61:	75 14                	jne    c0005a77 <keyboard_read+0xd5>
c0005a63:	e8 d4 fe ff ff       	call   c000593c <read_from_keyboard_buf>
c0005a68:	3c aa                	cmp    $0xaa,%al
c0005a6a:	75 0b                	jne    c0005a77 <keyboard_read+0xd5>
c0005a6c:	c7 45 f4 81 01 00 00 	movl   $0x181,-0xc(%ebp)
c0005a73:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
c0005a77:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0005a7b:	75 07                	jne    c0005a84 <keyboard_read+0xe2>
c0005a7d:	c6 05 24 f7 00 c0 01 	movb   $0x1,0xc000f724
c0005a84:	81 7d f4 80 01 00 00 	cmpl   $0x180,-0xc(%ebp)
c0005a8b:	0f 84 8d 00 00 00    	je     c0005b1e <keyboard_read+0x17c>
c0005a91:	81 7d f4 81 01 00 00 	cmpl   $0x181,-0xc(%ebp)
c0005a98:	0f 84 80 00 00 00    	je     c0005b1e <keyboard_read+0x17c>
c0005a9e:	80 7d ea 36          	cmpb   $0x36,-0x16(%ebp)
c0005aa2:	0f 94 c2             	sete   %dl
c0005aa5:	80 7d ea 2a          	cmpb   $0x2a,-0x16(%ebp)
c0005aa9:	0f 94 c0             	sete   %al
c0005aac:	09 d0                	or     %edx,%eax
c0005aae:	84 c0                	test   %al,%al
c0005ab0:	74 07                	je     c0005ab9 <keyboard_read+0x117>
c0005ab2:	c6 05 a4 16 01 c0 01 	movb   $0x1,0xc00116a4
c0005ab9:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
c0005abd:	f7 d0                	not    %eax
c0005abf:	c0 e8 07             	shr    $0x7,%al
c0005ac2:	88 45 e9             	mov    %al,-0x17(%ebp)
c0005ac5:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
c0005ac9:	74 53                	je     c0005b1e <keyboard_read+0x17c>
c0005acb:	80 7d e9 00          	cmpb   $0x0,-0x17(%ebp)
c0005acf:	74 4d                	je     c0005b1e <keyboard_read+0x17c>
c0005ad1:	c6 45 eb 00          	movb   $0x0,-0x15(%ebp)
c0005ad5:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0005adc:	3c 01                	cmp    $0x1,%al
c0005ade:	75 04                	jne    c0005ae4 <keyboard_read+0x142>
c0005ae0:	c6 45 eb 01          	movb   $0x1,-0x15(%ebp)
c0005ae4:	0f b6 05 24 f7 00 c0 	movzbl 0xc000f724,%eax
c0005aeb:	84 c0                	test   %al,%al
c0005aed:	74 04                	je     c0005af3 <keyboard_read+0x151>
c0005aef:	c6 45 eb 02          	movb   $0x2,-0x15(%ebp)
c0005af3:	0f b6 55 ea          	movzbl -0x16(%ebp),%edx
c0005af7:	89 d0                	mov    %edx,%eax
c0005af9:	01 c0                	add    %eax,%eax
c0005afb:	01 c2                	add    %eax,%edx
c0005afd:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
c0005b01:	01 d0                	add    %edx,%eax
c0005b03:	8b 04 85 00 e1 00 c0 	mov    -0x3fff1f00(,%eax,4),%eax
c0005b0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005b0d:	83 ec 08             	sub    $0x8,%esp
c0005b10:	ff 75 f4             	pushl  -0xc(%ebp)
c0005b13:	ff 75 08             	pushl  0x8(%ebp)
c0005b16:	e8 1a 00 00 00       	call   c0005b35 <in_process>
c0005b1b:	83 c4 10             	add    $0x10,%esp
c0005b1e:	90                   	nop
c0005b1f:	c9                   	leave  
c0005b20:	c3                   	ret    

c0005b21 <init_keyboard_handler>:
c0005b21:	55                   	push   %ebp
c0005b22:	89 e5                	mov    %esp,%ebp
c0005b24:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005b2b:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005b32:	90                   	nop
c0005b33:	5d                   	pop    %ebp
c0005b34:	c3                   	ret    

c0005b35 <in_process>:
c0005b35:	55                   	push   %ebp
c0005b36:	89 e5                	mov    %esp,%ebp
c0005b38:	83 ec 18             	sub    $0x18,%esp
c0005b3b:	83 ec 04             	sub    $0x4,%esp
c0005b3e:	6a 02                	push   $0x2
c0005b40:	6a 00                	push   $0x0
c0005b42:	8d 45 f6             	lea    -0xa(%ebp),%eax
c0005b45:	50                   	push   %eax
c0005b46:	e8 a7 58 00 00       	call   c000b3f2 <Memset>
c0005b4b:	83 c4 10             	add    $0x10,%esp
c0005b4e:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b51:	25 00 01 00 00       	and    $0x100,%eax
c0005b56:	85 c0                	test   %eax,%eax
c0005b58:	75 28                	jne    c0005b82 <in_process+0x4d>
c0005b5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0005b5d:	0f b6 c0             	movzbl %al,%eax
c0005b60:	83 ec 08             	sub    $0x8,%esp
c0005b63:	50                   	push   %eax
c0005b64:	ff 75 08             	pushl  0x8(%ebp)
c0005b67:	e8 ce f3 ff ff       	call   c0004f3a <put_key>
c0005b6c:	83 c4 10             	add    $0x10,%esp
c0005b6f:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005b76:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005b7d:	e9 42 01 00 00       	jmp    c0005cc4 <in_process+0x18f>
c0005b82:	0f b6 05 a4 16 01 c0 	movzbl 0xc00116a4,%eax
c0005b89:	84 c0                	test   %al,%al
c0005b8b:	0f 84 a9 00 00 00    	je     c0005c3a <in_process+0x105>
c0005b91:	83 7d 0c 2a          	cmpl   $0x2a,0xc(%ebp)
c0005b95:	0f 84 9f 00 00 00    	je     c0005c3a <in_process+0x105>
c0005b9b:	83 7d 0c 36          	cmpl   $0x36,0xc(%ebp)
c0005b9f:	0f 84 95 00 00 00    	je     c0005c3a <in_process+0x105>
c0005ba5:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005bac:	74 64                	je     c0005c12 <in_process+0xdd>
c0005bae:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005bb5:	77 0b                	ja     c0005bc2 <in_process+0x8d>
c0005bb7:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005bbe:	74 64                	je     c0005c24 <in_process+0xef>
c0005bc0:	eb 73                	jmp    c0005c35 <in_process+0x100>
c0005bc2:	81 7d 0c 55 01 00 00 	cmpl   $0x155,0xc(%ebp)
c0005bc9:	74 0b                	je     c0005bd6 <in_process+0xa1>
c0005bcb:	81 7d 0c 68 01 00 00 	cmpl   $0x168,0xc(%ebp)
c0005bd2:	74 20                	je     c0005bf4 <in_process+0xbf>
c0005bd4:	eb 5f                	jmp    c0005c35 <in_process+0x100>
c0005bd6:	83 ec 0c             	sub    $0xc,%esp
c0005bd9:	ff 75 08             	pushl  0x8(%ebp)
c0005bdc:	e8 c5 f3 ff ff       	call   c0004fa6 <scroll_up>
c0005be1:	83 c4 10             	add    $0x10,%esp
c0005be4:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005beb:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005bf2:	eb 41                	jmp    c0005c35 <in_process+0x100>
c0005bf4:	83 ec 0c             	sub    $0xc,%esp
c0005bf7:	ff 75 08             	pushl  0x8(%ebp)
c0005bfa:	e8 e9 f3 ff ff       	call   c0004fe8 <scroll_down>
c0005bff:	83 c4 10             	add    $0x10,%esp
c0005c02:	c6 05 a4 16 01 c0 00 	movb   $0x0,0xc00116a4
c0005c09:	c6 05 24 f7 00 c0 00 	movb   $0x0,0xc000f724
c0005c10:	eb 23                	jmp    c0005c35 <in_process+0x100>
c0005c12:	83 ec 08             	sub    $0x8,%esp
c0005c15:	6a 0a                	push   $0xa
c0005c17:	ff 75 08             	pushl  0x8(%ebp)
c0005c1a:	e8 34 f4 ff ff       	call   c0005053 <out_char>
c0005c1f:	83 c4 10             	add    $0x10,%esp
c0005c22:	eb 11                	jmp    c0005c35 <in_process+0x100>
c0005c24:	83 ec 08             	sub    $0x8,%esp
c0005c27:	6a 08                	push   $0x8
c0005c29:	ff 75 08             	pushl  0x8(%ebp)
c0005c2c:	e8 22 f4 ff ff       	call   c0005053 <out_char>
c0005c31:	83 c4 10             	add    $0x10,%esp
c0005c34:	90                   	nop
c0005c35:	e9 8a 00 00 00       	jmp    c0005cc4 <in_process+0x18f>
c0005c3a:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005c41:	74 55                	je     c0005c98 <in_process+0x163>
c0005c43:	81 7d 0c 40 01 00 00 	cmpl   $0x140,0xc(%ebp)
c0005c4a:	77 14                	ja     c0005c60 <in_process+0x12b>
c0005c4c:	81 7d 0c 02 01 00 00 	cmpl   $0x102,0xc(%ebp)
c0005c53:	74 31                	je     c0005c86 <in_process+0x151>
c0005c55:	81 7d 0c 14 01 00 00 	cmpl   $0x114,0xc(%ebp)
c0005c5c:	74 16                	je     c0005c74 <in_process+0x13f>
c0005c5e:	eb 64                	jmp    c0005cc4 <in_process+0x18f>
c0005c60:	81 7d 0c 41 01 00 00 	cmpl   $0x141,0xc(%ebp)
c0005c67:	74 3e                	je     c0005ca7 <in_process+0x172>
c0005c69:	81 7d 0c 42 01 00 00 	cmpl   $0x142,0xc(%ebp)
c0005c70:	74 44                	je     c0005cb6 <in_process+0x181>
c0005c72:	eb 50                	jmp    c0005cc4 <in_process+0x18f>
c0005c74:	83 ec 08             	sub    $0x8,%esp
c0005c77:	6a 0a                	push   $0xa
c0005c79:	ff 75 08             	pushl  0x8(%ebp)
c0005c7c:	e8 b9 f2 ff ff       	call   c0004f3a <put_key>
c0005c81:	83 c4 10             	add    $0x10,%esp
c0005c84:	eb 3e                	jmp    c0005cc4 <in_process+0x18f>
c0005c86:	83 ec 08             	sub    $0x8,%esp
c0005c89:	6a 08                	push   $0x8
c0005c8b:	ff 75 08             	pushl  0x8(%ebp)
c0005c8e:	e8 a7 f2 ff ff       	call   c0004f3a <put_key>
c0005c93:	83 c4 10             	add    $0x10,%esp
c0005c96:	eb 2c                	jmp    c0005cc4 <in_process+0x18f>
c0005c98:	83 ec 0c             	sub    $0xc,%esp
c0005c9b:	6a 00                	push   $0x0
c0005c9d:	e8 67 f1 ff ff       	call   c0004e09 <select_console>
c0005ca2:	83 c4 10             	add    $0x10,%esp
c0005ca5:	eb 1d                	jmp    c0005cc4 <in_process+0x18f>
c0005ca7:	83 ec 0c             	sub    $0xc,%esp
c0005caa:	6a 01                	push   $0x1
c0005cac:	e8 58 f1 ff ff       	call   c0004e09 <select_console>
c0005cb1:	83 c4 10             	add    $0x10,%esp
c0005cb4:	eb 0e                	jmp    c0005cc4 <in_process+0x18f>
c0005cb6:	83 ec 0c             	sub    $0xc,%esp
c0005cb9:	6a 02                	push   $0x2
c0005cbb:	e8 49 f1 ff ff       	call   c0004e09 <select_console>
c0005cc0:	83 c4 10             	add    $0x10,%esp
c0005cc3:	90                   	nop
c0005cc4:	90                   	nop
c0005cc5:	c9                   	leave  
c0005cc6:	c3                   	ret    

c0005cc7 <open>:
c0005cc7:	55                   	push   %ebp
c0005cc8:	89 e5                	mov    %esp,%ebp
c0005cca:	83 ec 18             	sub    $0x18,%esp
c0005ccd:	83 ec 0c             	sub    $0xc,%esp
c0005cd0:	6a 6c                	push   $0x6c
c0005cd2:	e8 07 12 00 00       	call   c0006ede <sys_malloc>
c0005cd7:	83 c4 10             	add    $0x10,%esp
c0005cda:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0005cdd:	83 ec 04             	sub    $0x4,%esp
c0005ce0:	6a 6c                	push   $0x6c
c0005ce2:	6a 00                	push   $0x0
c0005ce4:	ff 75 f4             	pushl  -0xc(%ebp)
c0005ce7:	e8 06 57 00 00       	call   c000b3f2 <Memset>
c0005cec:	83 c4 10             	add    $0x10,%esp
c0005cef:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005cf2:	c7 40 68 06 00 00 00 	movl   $0x6,0x68(%eax)
c0005cf9:	83 ec 0c             	sub    $0xc,%esp
c0005cfc:	ff 75 08             	pushl  0x8(%ebp)
c0005cff:	e8 06 11 00 00       	call   c0006e0a <get_physical_address>
c0005d04:	83 c4 10             	add    $0x10,%esp
c0005d07:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005d0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d0d:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0005d10:	89 50 34             	mov    %edx,0x34(%eax)
c0005d13:	8b 55 0c             	mov    0xc(%ebp),%edx
c0005d16:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d19:	89 50 64             	mov    %edx,0x64(%eax)
c0005d1c:	83 ec 0c             	sub    $0xc,%esp
c0005d1f:	ff 75 08             	pushl  0x8(%ebp)
c0005d22:	e8 04 57 00 00       	call   c000b42b <Strlen>
c0005d27:	83 c4 10             	add    $0x10,%esp
c0005d2a:	89 c2                	mov    %eax,%edx
c0005d2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d2f:	89 50 30             	mov    %edx,0x30(%eax)
c0005d32:	83 ec 04             	sub    $0x4,%esp
c0005d35:	6a 04                	push   $0x4
c0005d37:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d3a:	6a 03                	push   $0x3
c0005d3c:	e8 9d 3d 00 00       	call   c0009ade <send_rec>
c0005d41:	83 c4 10             	add    $0x10,%esp
c0005d44:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005d47:	8b 40 40             	mov    0x40(%eax),%eax
c0005d4a:	c9                   	leave  
c0005d4b:	c3                   	ret    

c0005d4c <read>:
c0005d4c:	55                   	push   %ebp
c0005d4d:	89 e5                	mov    %esp,%ebp
c0005d4f:	83 ec 18             	sub    $0x18,%esp
c0005d52:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005d59:	83 ec 0c             	sub    $0xc,%esp
c0005d5c:	ff 75 f4             	pushl  -0xc(%ebp)
c0005d5f:	e8 7a 11 00 00       	call   c0006ede <sys_malloc>
c0005d64:	83 c4 10             	add    $0x10,%esp
c0005d67:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005d6a:	83 ec 0c             	sub    $0xc,%esp
c0005d6d:	ff 75 0c             	pushl  0xc(%ebp)
c0005d70:	e8 95 10 00 00       	call   c0006e0a <get_physical_address>
c0005d75:	83 c4 10             	add    $0x10,%esp
c0005d78:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005d7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d7e:	c7 40 68 07 00 00 00 	movl   $0x7,0x68(%eax)
c0005d85:	8b 55 08             	mov    0x8(%ebp),%edx
c0005d88:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d8b:	89 50 40             	mov    %edx,0x40(%eax)
c0005d8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d91:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005d94:	89 50 10             	mov    %edx,0x10(%eax)
c0005d97:	8b 55 10             	mov    0x10(%ebp),%edx
c0005d9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005d9d:	89 50 50             	mov    %edx,0x50(%eax)
c0005da0:	83 ec 04             	sub    $0x4,%esp
c0005da3:	6a 04                	push   $0x4
c0005da5:	ff 75 f0             	pushl  -0x10(%ebp)
c0005da8:	6a 03                	push   $0x3
c0005daa:	e8 2f 3d 00 00       	call   c0009ade <send_rec>
c0005daf:	83 c4 10             	add    $0x10,%esp
c0005db2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005db5:	8b 40 50             	mov    0x50(%eax),%eax
c0005db8:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005dbb:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005dbe:	c9                   	leave  
c0005dbf:	c3                   	ret    

c0005dc0 <write>:
c0005dc0:	55                   	push   %ebp
c0005dc1:	89 e5                	mov    %esp,%ebp
c0005dc3:	83 ec 18             	sub    $0x18,%esp
c0005dc6:	c7 45 f4 6c 00 00 00 	movl   $0x6c,-0xc(%ebp)
c0005dcd:	83 ec 0c             	sub    $0xc,%esp
c0005dd0:	ff 75 f4             	pushl  -0xc(%ebp)
c0005dd3:	e8 06 11 00 00       	call   c0006ede <sys_malloc>
c0005dd8:	83 c4 10             	add    $0x10,%esp
c0005ddb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0005dde:	83 ec 0c             	sub    $0xc,%esp
c0005de1:	ff 75 0c             	pushl  0xc(%ebp)
c0005de4:	e8 21 10 00 00       	call   c0006e0a <get_physical_address>
c0005de9:	83 c4 10             	add    $0x10,%esp
c0005dec:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0005def:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005df2:	c7 40 68 0a 00 00 00 	movl   $0xa,0x68(%eax)
c0005df9:	8b 55 08             	mov    0x8(%ebp),%edx
c0005dfc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005dff:	89 50 40             	mov    %edx,0x40(%eax)
c0005e02:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e05:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0005e08:	89 50 10             	mov    %edx,0x10(%eax)
c0005e0b:	8b 55 10             	mov    0x10(%ebp),%edx
c0005e0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e11:	89 50 50             	mov    %edx,0x50(%eax)
c0005e14:	83 ec 04             	sub    $0x4,%esp
c0005e17:	6a 04                	push   $0x4
c0005e19:	ff 75 f0             	pushl  -0x10(%ebp)
c0005e1c:	6a 03                	push   $0x3
c0005e1e:	e8 bb 3c 00 00       	call   c0009ade <send_rec>
c0005e23:	83 c4 10             	add    $0x10,%esp
c0005e26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0005e29:	8b 40 50             	mov    0x50(%eax),%eax
c0005e2c:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0005e2f:	83 ec 08             	sub    $0x8,%esp
c0005e32:	ff 75 f4             	pushl  -0xc(%ebp)
c0005e35:	ff 75 f0             	pushl  -0x10(%ebp)
c0005e38:	e8 80 13 00 00       	call   c00071bd <sys_free>
c0005e3d:	83 c4 10             	add    $0x10,%esp
c0005e40:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0005e43:	c9                   	leave  
c0005e44:	c3                   	ret    

c0005e45 <close>:
c0005e45:	55                   	push   %ebp
c0005e46:	89 e5                	mov    %esp,%ebp
c0005e48:	83 ec 78             	sub    $0x78,%esp
c0005e4b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0005e52:	8b 45 08             	mov    0x8(%ebp),%eax
c0005e55:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0005e58:	83 ec 04             	sub    $0x4,%esp
c0005e5b:	6a 04                	push   $0x4
c0005e5d:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005e60:	50                   	push   %eax
c0005e61:	6a 03                	push   $0x3
c0005e63:	e8 76 3c 00 00       	call   c0009ade <send_rec>
c0005e68:	83 c4 10             	add    $0x10,%esp
c0005e6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005e6e:	83 f8 65             	cmp    $0x65,%eax
c0005e71:	74 19                	je     c0005e8c <close+0x47>
c0005e73:	6a 13                	push   $0x13
c0005e75:	68 07 ac 00 c0       	push   $0xc000ac07
c0005e7a:	68 07 ac 00 c0       	push   $0xc000ac07
c0005e7f:	68 13 ac 00 c0       	push   $0xc000ac13
c0005e84:	e8 0a 34 00 00       	call   c0009293 <assertion_failure>
c0005e89:	83 c4 10             	add    $0x10,%esp
c0005e8c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005e8f:	c9                   	leave  
c0005e90:	c3                   	ret    

c0005e91 <wait>:
c0005e91:	55                   	push   %ebp
c0005e92:	89 e5                	mov    %esp,%ebp
c0005e94:	83 ec 78             	sub    $0x78,%esp
c0005e97:	c7 45 f4 09 00 00 00 	movl   $0x9,-0xc(%ebp)
c0005e9e:	83 ec 04             	sub    $0x4,%esp
c0005ea1:	6a 05                	push   $0x5
c0005ea3:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005ea6:	50                   	push   %eax
c0005ea7:	6a 03                	push   $0x3
c0005ea9:	e8 30 3c 00 00       	call   c0009ade <send_rec>
c0005eae:	83 c4 10             	add    $0x10,%esp
c0005eb1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0005eb4:	89 c2                	mov    %eax,%edx
c0005eb6:	8b 45 08             	mov    0x8(%ebp),%eax
c0005eb9:	89 10                	mov    %edx,(%eax)
c0005ebb:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ebe:	83 f8 1d             	cmp    $0x1d,%eax
c0005ec1:	74 05                	je     c0005ec8 <wait+0x37>
c0005ec3:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005ec6:	eb 05                	jmp    c0005ecd <wait+0x3c>
c0005ec8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0005ecd:	c9                   	leave  
c0005ece:	c3                   	ret    

c0005ecf <exit>:
c0005ecf:	55                   	push   %ebp
c0005ed0:	89 e5                	mov    %esp,%ebp
c0005ed2:	83 ec 78             	sub    $0x78,%esp
c0005ed5:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
c0005edc:	8b 45 08             	mov    0x8(%ebp),%eax
c0005edf:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0005ee2:	83 ec 04             	sub    $0x4,%esp
c0005ee5:	6a 05                	push   $0x5
c0005ee7:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005eea:	50                   	push   %eax
c0005eeb:	6a 03                	push   $0x3
c0005eed:	e8 ec 3b 00 00       	call   c0009ade <send_rec>
c0005ef2:	83 c4 10             	add    $0x10,%esp
c0005ef5:	90                   	nop
c0005ef6:	c9                   	leave  
c0005ef7:	c3                   	ret    

c0005ef8 <fork>:
c0005ef8:	55                   	push   %ebp
c0005ef9:	89 e5                	mov    %esp,%ebp
c0005efb:	83 ec 78             	sub    $0x78,%esp
c0005efe:	83 ec 04             	sub    $0x4,%esp
c0005f01:	6a 6c                	push   $0x6c
c0005f03:	6a 00                	push   $0x0
c0005f05:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f08:	50                   	push   %eax
c0005f09:	e8 e4 54 00 00       	call   c000b3f2 <Memset>
c0005f0e:	83 c4 10             	add    $0x10,%esp
c0005f11:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c0005f18:	83 ec 04             	sub    $0x4,%esp
c0005f1b:	6a 05                	push   $0x5
c0005f1d:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f20:	50                   	push   %eax
c0005f21:	6a 03                	push   $0x3
c0005f23:	e8 b6 3b 00 00       	call   c0009ade <send_rec>
c0005f28:	83 c4 10             	add    $0x10,%esp
c0005f2b:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c0005f32:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005f35:	85 c0                	test   %eax,%eax
c0005f37:	74 19                	je     c0005f52 <fork+0x5a>
c0005f39:	6a 14                	push   $0x14
c0005f3b:	68 2b ac 00 c0       	push   $0xc000ac2b
c0005f40:	68 2b ac 00 c0       	push   $0xc000ac2b
c0005f45:	68 36 ac 00 c0       	push   $0xc000ac36
c0005f4a:	e8 44 33 00 00       	call   c0009293 <assertion_failure>
c0005f4f:	83 c4 10             	add    $0x10,%esp
c0005f52:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f55:	c9                   	leave  
c0005f56:	c3                   	ret    

c0005f57 <getpid>:
c0005f57:	55                   	push   %ebp
c0005f58:	89 e5                	mov    %esp,%ebp
c0005f5a:	83 ec 78             	sub    $0x78,%esp
c0005f5d:	c7 45 f4 05 00 00 00 	movl   $0x5,-0xc(%ebp)
c0005f64:	83 ec 04             	sub    $0x4,%esp
c0005f67:	6a 03                	push   $0x3
c0005f69:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005f6c:	50                   	push   %eax
c0005f6d:	6a 03                	push   $0x3
c0005f6f:	e8 6a 3b 00 00       	call   c0009ade <send_rec>
c0005f74:	83 c4 10             	add    $0x10,%esp
c0005f77:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0005f7a:	c9                   	leave  
c0005f7b:	c3                   	ret    

c0005f7c <exec>:
c0005f7c:	55                   	push   %ebp
c0005f7d:	89 e5                	mov    %esp,%ebp
c0005f7f:	83 ec 78             	sub    $0x78,%esp
c0005f82:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
c0005f89:	8b 45 08             	mov    0x8(%ebp),%eax
c0005f8c:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0005f8f:	83 ec 0c             	sub    $0xc,%esp
c0005f92:	ff 75 08             	pushl  0x8(%ebp)
c0005f95:	e8 91 54 00 00       	call   c000b42b <Strlen>
c0005f9a:	83 c4 10             	add    $0x10,%esp
c0005f9d:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0005fa0:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%ebp)
c0005fa7:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
c0005fae:	83 ec 04             	sub    $0x4,%esp
c0005fb1:	6a 05                	push   $0x5
c0005fb3:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0005fb6:	50                   	push   %eax
c0005fb7:	6a 03                	push   $0x3
c0005fb9:	e8 20 3b 00 00       	call   c0009ade <send_rec>
c0005fbe:	83 c4 10             	add    $0x10,%esp
c0005fc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0005fc4:	83 f8 65             	cmp    $0x65,%eax
c0005fc7:	74 19                	je     c0005fe2 <exec+0x66>
c0005fc9:	6a 19                	push   $0x19
c0005fcb:	68 46 ac 00 c0       	push   $0xc000ac46
c0005fd0:	68 46 ac 00 c0       	push   $0xc000ac46
c0005fd5:	68 51 ac 00 c0       	push   $0xc000ac51
c0005fda:	e8 b4 32 00 00       	call   c0009293 <assertion_failure>
c0005fdf:	83 c4 10             	add    $0x10,%esp
c0005fe2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0005fe5:	c9                   	leave  
c0005fe6:	c3                   	ret    

c0005fe7 <execv>:
c0005fe7:	55                   	push   %ebp
c0005fe8:	89 e5                	mov    %esp,%ebp
c0005fea:	57                   	push   %edi
c0005feb:	81 ec b4 80 00 00    	sub    $0x80b4,%esp
c0005ff1:	83 ec 04             	sub    $0x4,%esp
c0005ff4:	68 00 80 00 00       	push   $0x8000
c0005ff9:	6a 00                	push   $0x0
c0005ffb:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006001:	50                   	push   %eax
c0006002:	e8 eb 53 00 00       	call   c000b3f2 <Memset>
c0006007:	83 c4 10             	add    $0x10,%esp
c000600a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000600d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006010:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006017:	eb 0d                	jmp    c0006026 <execv+0x3f>
c0006019:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
c000601d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006020:	83 c0 04             	add    $0x4,%eax
c0006023:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006026:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006029:	8b 00                	mov    (%eax),%eax
c000602b:	85 c0                	test   %eax,%eax
c000602d:	75 ea                	jne    c0006019 <execv+0x32>
c000602f:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006035:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006038:	01 d0                	add    %edx,%eax
c000603a:	c6 00 00             	movb   $0x0,(%eax)
c000603d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006040:	83 c0 04             	add    $0x4,%eax
c0006043:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006046:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c000604c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000604f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006052:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006055:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000605c:	eb 64                	jmp    c00060c2 <execv+0xdb>
c000605e:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c0006064:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006067:	01 c2                	add    %eax,%edx
c0006069:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000606c:	89 10                	mov    %edx,(%eax)
c000606e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006071:	8b 00                	mov    (%eax),%eax
c0006073:	8d 8d e0 7f ff ff    	lea    -0x8020(%ebp),%ecx
c0006079:	8b 55 f0             	mov    -0x10(%ebp),%edx
c000607c:	01 ca                	add    %ecx,%edx
c000607e:	83 ec 08             	sub    $0x8,%esp
c0006081:	50                   	push   %eax
c0006082:	52                   	push   %edx
c0006083:	e8 89 53 00 00       	call   c000b411 <Strcpy>
c0006088:	83 c4 10             	add    $0x10,%esp
c000608b:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000608e:	8b 00                	mov    (%eax),%eax
c0006090:	83 ec 0c             	sub    $0xc,%esp
c0006093:	50                   	push   %eax
c0006094:	e8 92 53 00 00       	call   c000b42b <Strlen>
c0006099:	83 c4 10             	add    $0x10,%esp
c000609c:	01 45 f0             	add    %eax,-0x10(%ebp)
c000609f:	8d 95 e0 7f ff ff    	lea    -0x8020(%ebp),%edx
c00060a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060a8:	01 d0                	add    %edx,%eax
c00060aa:	c6 00 00             	movb   $0x0,(%eax)
c00060ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00060b0:	83 c0 01             	add    $0x1,%eax
c00060b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00060b6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
c00060ba:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c00060be:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00060c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00060c5:	8b 00                	mov    (%eax),%eax
c00060c7:	85 c0                	test   %eax,%eax
c00060c9:	75 93                	jne    c000605e <execv+0x77>
c00060cb:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c00060d1:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00060d4:	eb 04                	jmp    c00060da <execv+0xf3>
c00060d6:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00060da:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00060dd:	8b 00                	mov    (%eax),%eax
c00060df:	85 c0                	test   %eax,%eax
c00060e1:	75 f3                	jne    c00060d6 <execv+0xef>
c00060e3:	8d 95 4c 7f ff ff    	lea    -0x80b4(%ebp),%edx
c00060e9:	b8 00 00 00 00       	mov    $0x0,%eax
c00060ee:	b9 0a 00 00 00       	mov    $0xa,%ecx
c00060f3:	89 d7                	mov    %edx,%edi
c00060f5:	f3 ab                	rep stos %eax,%es:(%edi)
c00060f7:	c7 85 4c 7f ff ff 69 	movl   $0xc000ac69,-0x80b4(%ebp)
c00060fe:	ac 00 c0 
c0006101:	c7 85 50 7f ff ff 70 	movl   $0xc000ac70,-0x80b0(%ebp)
c0006108:	ac 00 c0 
c000610b:	c7 85 dc 7f ff ff 02 	movl   $0x2,-0x8024(%ebp)
c0006112:	00 00 00 
c0006115:	8b 45 08             	mov    0x8(%ebp),%eax
c0006118:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
c000611e:	83 ec 0c             	sub    $0xc,%esp
c0006121:	ff 75 08             	pushl  0x8(%ebp)
c0006124:	e8 02 53 00 00       	call   c000b42b <Strlen>
c0006129:	83 c4 10             	add    $0x10,%esp
c000612c:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
c0006132:	8d 85 e0 7f ff ff    	lea    -0x8020(%ebp),%eax
c0006138:	89 85 84 7f ff ff    	mov    %eax,-0x807c(%ebp)
c000613e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006141:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
c0006147:	83 ec 04             	sub    $0x4,%esp
c000614a:	6a 05                	push   $0x5
c000614c:	8d 85 74 7f ff ff    	lea    -0x808c(%ebp),%eax
c0006152:	50                   	push   %eax
c0006153:	6a 03                	push   $0x3
c0006155:	e8 84 39 00 00       	call   c0009ade <send_rec>
c000615a:	83 c4 10             	add    $0x10,%esp
c000615d:	8b 85 dc 7f ff ff    	mov    -0x8024(%ebp),%eax
c0006163:	83 f8 65             	cmp    $0x65,%eax
c0006166:	74 19                	je     c0006181 <execv+0x19a>
c0006168:	6a 72                	push   $0x72
c000616a:	68 46 ac 00 c0       	push   $0xc000ac46
c000616f:	68 46 ac 00 c0       	push   $0xc000ac46
c0006174:	68 51 ac 00 c0       	push   $0xc000ac51
c0006179:	e8 15 31 00 00       	call   c0009293 <assertion_failure>
c000617e:	83 c4 10             	add    $0x10,%esp
c0006181:	8b 85 bc 7f ff ff    	mov    -0x8044(%ebp),%eax
c0006187:	8b 7d fc             	mov    -0x4(%ebp),%edi
c000618a:	c9                   	leave  
c000618b:	c3                   	ret    

c000618c <execl>:
c000618c:	55                   	push   %ebp
c000618d:	89 e5                	mov    %esp,%ebp
c000618f:	83 ec 18             	sub    $0x18,%esp
c0006192:	8d 45 0c             	lea    0xc(%ebp),%eax
c0006195:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006198:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000619b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000619e:	83 ec 08             	sub    $0x8,%esp
c00061a1:	ff 75 f0             	pushl  -0x10(%ebp)
c00061a4:	ff 75 08             	pushl  0x8(%ebp)
c00061a7:	e8 3b fe ff ff       	call   c0005fe7 <execv>
c00061ac:	83 c4 10             	add    $0x10,%esp
c00061af:	c9                   	leave  
c00061b0:	c3                   	ret    

c00061b1 <TaskMM>:
c00061b1:	55                   	push   %ebp
c00061b2:	89 e5                	mov    %esp,%ebp
c00061b4:	83 ec 28             	sub    $0x28,%esp
c00061b7:	83 ec 0c             	sub    $0xc,%esp
c00061ba:	68 77 ac 00 c0       	push   $0xc000ac77
c00061bf:	e8 c8 b3 ff ff       	call   c000158c <disp_str>
c00061c4:	83 c4 10             	add    $0x10,%esp
c00061c7:	e8 ca b6 ff ff       	call   c0001896 <get_running_thread_pcb>
c00061cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00061cf:	83 ec 0c             	sub    $0xc,%esp
c00061d2:	68 7b ac 00 c0       	push   $0xc000ac7b
c00061d7:	e8 b0 b3 ff ff       	call   c000158c <disp_str>
c00061dc:	83 c4 10             	add    $0x10,%esp
c00061df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00061e2:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00061e8:	83 ec 0c             	sub    $0xc,%esp
c00061eb:	50                   	push   %eax
c00061ec:	e8 66 18 00 00       	call   c0007a57 <disp_int>
c00061f1:	83 c4 10             	add    $0x10,%esp
c00061f4:	83 ec 0c             	sub    $0xc,%esp
c00061f7:	68 7d ac 00 c0       	push   $0xc000ac7d
c00061fc:	e8 8b b3 ff ff       	call   c000158c <disp_str>
c0006201:	83 c4 10             	add    $0x10,%esp
c0006204:	83 ec 0c             	sub    $0xc,%esp
c0006207:	68 7f ac 00 c0       	push   $0xc000ac7f
c000620c:	e8 7b b3 ff ff       	call   c000158c <disp_str>
c0006211:	83 c4 10             	add    $0x10,%esp
c0006214:	83 ec 0c             	sub    $0xc,%esp
c0006217:	6a 6c                	push   $0x6c
c0006219:	e8 c0 0c 00 00       	call   c0006ede <sys_malloc>
c000621e:	83 c4 10             	add    $0x10,%esp
c0006221:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006224:	83 ec 0c             	sub    $0xc,%esp
c0006227:	6a 6c                	push   $0x6c
c0006229:	e8 b0 0c 00 00       	call   c0006ede <sys_malloc>
c000622e:	83 c4 10             	add    $0x10,%esp
c0006231:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006234:	83 ec 0c             	sub    $0xc,%esp
c0006237:	68 81 ac 00 c0       	push   $0xc000ac81
c000623c:	e8 4b b3 ff ff       	call   c000158c <disp_str>
c0006241:	83 c4 10             	add    $0x10,%esp
c0006244:	83 ec 04             	sub    $0x4,%esp
c0006247:	6a 0e                	push   $0xe
c0006249:	ff 75 ec             	pushl  -0x14(%ebp)
c000624c:	6a 02                	push   $0x2
c000624e:	e8 8b 38 00 00       	call   c0009ade <send_rec>
c0006253:	83 c4 10             	add    $0x10,%esp
c0006256:	83 ec 0c             	sub    $0xc,%esp
c0006259:	68 90 ac 00 c0       	push   $0xc000ac90
c000625e:	e8 29 b3 ff ff       	call   c000158c <disp_str>
c0006263:	83 c4 10             	add    $0x10,%esp
c0006266:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006269:	8b 40 68             	mov    0x68(%eax),%eax
c000626c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000626f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006272:	8b 00                	mov    (%eax),%eax
c0006274:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006277:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c000627e:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006281:	c7 40 68 65 00 00 00 	movl   $0x65,0x68(%eax)
c0006288:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000628b:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
c0006292:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
c0006296:	74 4b                	je     c00062e3 <TaskMM+0x132>
c0006298:	83 7d e4 03          	cmpl   $0x3,-0x1c(%ebp)
c000629c:	7f 08                	jg     c00062a6 <TaskMM+0xf5>
c000629e:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
c00062a2:	74 28                	je     c00062cc <TaskMM+0x11b>
c00062a4:	eb 6e                	jmp    c0006314 <TaskMM+0x163>
c00062a6:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
c00062aa:	74 08                	je     c00062b4 <TaskMM+0x103>
c00062ac:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c00062b0:	74 4b                	je     c00062fd <TaskMM+0x14c>
c00062b2:	eb 60                	jmp    c0006314 <TaskMM+0x163>
c00062b4:	83 ec 0c             	sub    $0xc,%esp
c00062b7:	ff 75 ec             	pushl  -0x14(%ebp)
c00062ba:	e8 ec 03 00 00       	call   c00066ab <do_fork>
c00062bf:	83 c4 10             	add    $0x10,%esp
c00062c2:	89 c2                	mov    %eax,%edx
c00062c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00062c7:	89 50 4c             	mov    %edx,0x4c(%eax)
c00062ca:	eb 59                	jmp    c0006325 <TaskMM+0x174>
c00062cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062d3:	83 ec 0c             	sub    $0xc,%esp
c00062d6:	ff 75 ec             	pushl  -0x14(%ebp)
c00062d9:	e8 9c 00 00 00       	call   c000637a <do_exec>
c00062de:	83 c4 10             	add    $0x10,%esp
c00062e1:	eb 42                	jmp    c0006325 <TaskMM+0x174>
c00062e3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00062ea:	83 ec 08             	sub    $0x8,%esp
c00062ed:	ff 75 dc             	pushl  -0x24(%ebp)
c00062f0:	ff 75 ec             	pushl  -0x14(%ebp)
c00062f3:	e8 28 04 00 00       	call   c0006720 <do_exit>
c00062f8:	83 c4 10             	add    $0x10,%esp
c00062fb:	eb 28                	jmp    c0006325 <TaskMM+0x174>
c00062fd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006304:	83 ec 0c             	sub    $0xc,%esp
c0006307:	ff 75 ec             	pushl  -0x14(%ebp)
c000630a:	e8 0d 05 00 00       	call   c000681c <do_wait>
c000630f:	83 c4 10             	add    $0x10,%esp
c0006312:	eb 11                	jmp    c0006325 <TaskMM+0x174>
c0006314:	83 ec 0c             	sub    $0xc,%esp
c0006317:	68 a5 ac 00 c0       	push   $0xc000aca5
c000631c:	e8 54 2f 00 00       	call   c0009275 <panic>
c0006321:	83 c4 10             	add    $0x10,%esp
c0006324:	90                   	nop
c0006325:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006329:	0f 84 05 ff ff ff    	je     c0006234 <TaskMM+0x83>
c000632f:	83 ec 04             	sub    $0x4,%esp
c0006332:	ff 75 e0             	pushl  -0x20(%ebp)
c0006335:	ff 75 e8             	pushl  -0x18(%ebp)
c0006338:	6a 01                	push   $0x1
c000633a:	e8 9f 37 00 00       	call   c0009ade <send_rec>
c000633f:	83 c4 10             	add    $0x10,%esp
c0006342:	e9 ed fe ff ff       	jmp    c0006234 <TaskMM+0x83>

c0006347 <alloc_mem>:
c0006347:	55                   	push   %ebp
c0006348:	89 e5                	mov    %esp,%ebp
c000634a:	83 ec 10             	sub    $0x10,%esp
c000634d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006350:	83 e8 04             	sub    $0x4,%eax
c0006353:	69 c0 00 10 10 00    	imul   $0x101000,%eax,%eax
c0006359:	05 00 00 a0 00       	add    $0xa00000,%eax
c000635e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006361:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006364:	c9                   	leave  
c0006365:	c3                   	ret    

c0006366 <do_exec2>:
c0006366:	55                   	push   %ebp
c0006367:	89 e5                	mov    %esp,%ebp
c0006369:	83 ec 10             	sub    $0x10,%esp
c000636c:	c7 45 fc 05 00 00 00 	movl   $0x5,-0x4(%ebp)
c0006373:	b8 00 00 00 00       	mov    $0x0,%eax
c0006378:	c9                   	leave  
c0006379:	c3                   	ret    

c000637a <do_exec>:
c000637a:	55                   	push   %ebp
c000637b:	89 e5                	mov    %esp,%ebp
c000637d:	56                   	push   %esi
c000637e:	53                   	push   %ebx
c000637f:	81 ec 70 eb 02 00    	sub    $0x2eb70,%esp
c0006385:	c7 45 a2 64 65 76 5f 	movl   $0x5f766564,-0x5e(%ebp)
c000638c:	c7 45 a6 74 74 79 31 	movl   $0x31797474,-0x5a(%ebp)
c0006393:	66 c7 45 aa 00 00    	movw   $0x0,-0x56(%ebp)
c0006399:	83 ec 08             	sub    $0x8,%esp
c000639c:	6a 00                	push   $0x0
c000639e:	8d 45 a2             	lea    -0x5e(%ebp),%eax
c00063a1:	50                   	push   %eax
c00063a2:	e8 20 f9 ff ff       	call   c0005cc7 <open>
c00063a7:	83 c4 10             	add    $0x10,%esp
c00063aa:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00063ad:	8b 45 08             	mov    0x8(%ebp),%eax
c00063b0:	8b 00                	mov    (%eax),%eax
c00063b2:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00063b5:	c7 45 d4 90 43 02 00 	movl   $0x24390,-0x2c(%ebp)
c00063bc:	83 ec 04             	sub    $0x4,%esp
c00063bf:	6a 0c                	push   $0xc
c00063c1:	6a 00                	push   $0x0
c00063c3:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00063c9:	50                   	push   %eax
c00063ca:	e8 23 50 00 00       	call   c000b3f2 <Memset>
c00063cf:	83 c4 10             	add    $0x10,%esp
c00063d2:	8b 45 08             	mov    0x8(%ebp),%eax
c00063d5:	8b 40 30             	mov    0x30(%eax),%eax
c00063d8:	89 c6                	mov    %eax,%esi
c00063da:	8b 45 08             	mov    0x8(%ebp),%eax
c00063dd:	8b 40 34             	mov    0x34(%eax),%eax
c00063e0:	83 ec 08             	sub    $0x8,%esp
c00063e3:	50                   	push   %eax
c00063e4:	ff 75 d8             	pushl  -0x28(%ebp)
c00063e7:	e8 c5 e7 ff ff       	call   c0004bb1 <v2l>
c00063ec:	83 c4 10             	add    $0x10,%esp
c00063ef:	89 c3                	mov    %eax,%ebx
c00063f1:	83 ec 08             	sub    $0x8,%esp
c00063f4:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c00063fa:	50                   	push   %eax
c00063fb:	6a 05                	push   $0x5
c00063fd:	e8 af e7 ff ff       	call   c0004bb1 <v2l>
c0006402:	83 c4 10             	add    $0x10,%esp
c0006405:	83 ec 04             	sub    $0x4,%esp
c0006408:	56                   	push   %esi
c0006409:	53                   	push   %ebx
c000640a:	50                   	push   %eax
c000640b:	e8 b4 4f 00 00       	call   c000b3c4 <Memcpy>
c0006410:	83 c4 10             	add    $0x10,%esp
c0006413:	83 ec 08             	sub    $0x8,%esp
c0006416:	6a 00                	push   $0x0
c0006418:	8d 85 f6 94 fd ff    	lea    -0x26b0a(%ebp),%eax
c000641e:	50                   	push   %eax
c000641f:	e8 a3 f8 ff ff       	call   c0005cc7 <open>
c0006424:	83 c4 10             	add    $0x10,%esp
c0006427:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000642a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006431:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006434:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c000643a:	01 d0                	add    %edx,%eax
c000643c:	83 ec 04             	sub    $0x4,%esp
c000643f:	68 00 02 00 00       	push   $0x200
c0006444:	50                   	push   %eax
c0006445:	ff 75 d0             	pushl  -0x30(%ebp)
c0006448:	e8 ff f8 ff ff       	call   c0005d4c <read>
c000644d:	83 c4 10             	add    $0x10,%esp
c0006450:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006453:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0006456:	01 45 f4             	add    %eax,-0xc(%ebp)
c0006459:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c000645d:	74 02                	je     c0006461 <do_exec+0xe7>
c000645f:	eb d0                	jmp    c0006431 <do_exec+0xb7>
c0006461:	90                   	nop
c0006462:	83 ec 0c             	sub    $0xc,%esp
c0006465:	ff 75 d0             	pushl  -0x30(%ebp)
c0006468:	e8 d8 f9 ff ff       	call   c0005e45 <close>
c000646d:	83 c4 10             	add    $0x10,%esp
c0006470:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c0006476:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0006479:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006480:	eb 72                	jmp    c00064f4 <do_exec+0x17a>
c0006482:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006485:	0f b7 40 28          	movzwl 0x28(%eax),%eax
c0006489:	0f b7 d0             	movzwl %ax,%edx
c000648c:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000648f:	0f b7 40 2a          	movzwl 0x2a(%eax),%eax
c0006493:	0f b7 c0             	movzwl %ax,%eax
c0006496:	0f af 45 f0          	imul   -0x10(%ebp),%eax
c000649a:	01 c2                	add    %eax,%edx
c000649c:	8d 85 02 95 fd ff    	lea    -0x26afe(%ebp),%eax
c00064a2:	01 d0                	add    %edx,%eax
c00064a4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00064a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064aa:	8b 40 10             	mov    0x10(%eax),%eax
c00064ad:	89 c6                	mov    %eax,%esi
c00064af:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064b2:	8b 40 04             	mov    0x4(%eax),%eax
c00064b5:	8d 95 02 95 fd ff    	lea    -0x26afe(%ebp),%edx
c00064bb:	01 d0                	add    %edx,%eax
c00064bd:	83 ec 08             	sub    $0x8,%esp
c00064c0:	50                   	push   %eax
c00064c1:	6a 05                	push   $0x5
c00064c3:	e8 e9 e6 ff ff       	call   c0004bb1 <v2l>
c00064c8:	83 c4 10             	add    $0x10,%esp
c00064cb:	89 c3                	mov    %eax,%ebx
c00064cd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00064d0:	8b 40 08             	mov    0x8(%eax),%eax
c00064d3:	83 ec 08             	sub    $0x8,%esp
c00064d6:	50                   	push   %eax
c00064d7:	ff 75 d8             	pushl  -0x28(%ebp)
c00064da:	e8 d2 e6 ff ff       	call   c0004bb1 <v2l>
c00064df:	83 c4 10             	add    $0x10,%esp
c00064e2:	83 ec 04             	sub    $0x4,%esp
c00064e5:	56                   	push   %esi
c00064e6:	53                   	push   %ebx
c00064e7:	50                   	push   %eax
c00064e8:	e8 d7 4e 00 00       	call   c000b3c4 <Memcpy>
c00064ed:	83 c4 10             	add    $0x10,%esp
c00064f0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c00064f4:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00064f7:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
c00064fb:	0f b7 c0             	movzwl %ax,%eax
c00064fe:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0006501:	0f 8c 7b ff ff ff    	jl     c0006482 <do_exec+0x108>
c0006507:	8b 45 08             	mov    0x8(%ebp),%eax
c000650a:	8b 40 10             	mov    0x10(%eax),%eax
c000650d:	89 45 c0             	mov    %eax,-0x40(%ebp)
c0006510:	8b 45 08             	mov    0x8(%ebp),%eax
c0006513:	8b 40 1c             	mov    0x1c(%eax),%eax
c0006516:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0006519:	c7 45 b8 00 90 0f 00 	movl   $0xf9000,-0x48(%ebp)
c0006520:	83 ec 08             	sub    $0x8,%esp
c0006523:	ff 75 c0             	pushl  -0x40(%ebp)
c0006526:	ff 75 d8             	pushl  -0x28(%ebp)
c0006529:	e8 83 e6 ff ff       	call   c0004bb1 <v2l>
c000652e:	83 c4 10             	add    $0x10,%esp
c0006531:	89 c3                	mov    %eax,%ebx
c0006533:	83 ec 08             	sub    $0x8,%esp
c0006536:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c000653c:	50                   	push   %eax
c000653d:	6a 05                	push   $0x5
c000653f:	e8 6d e6 ff ff       	call   c0004bb1 <v2l>
c0006544:	83 c4 10             	add    $0x10,%esp
c0006547:	83 ec 04             	sub    $0x4,%esp
c000654a:	ff 75 bc             	pushl  -0x44(%ebp)
c000654d:	53                   	push   %ebx
c000654e:	50                   	push   %eax
c000654f:	e8 70 4e 00 00       	call   c000b3c4 <Memcpy>
c0006554:	83 c4 10             	add    $0x10,%esp
c0006557:	83 ec 08             	sub    $0x8,%esp
c000655a:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c0006560:	50                   	push   %eax
c0006561:	6a 05                	push   $0x5
c0006563:	e8 49 e6 ff ff       	call   c0004bb1 <v2l>
c0006568:	83 c4 10             	add    $0x10,%esp
c000656b:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000656e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c0006571:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006574:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000657b:	eb 08                	jmp    c0006585 <do_exec+0x20b>
c000657d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c0006581:	83 45 ec 04          	addl   $0x4,-0x14(%ebp)
c0006585:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006588:	8b 00                	mov    (%eax),%eax
c000658a:	85 c0                	test   %eax,%eax
c000658c:	75 ef                	jne    c000657d <do_exec+0x203>
c000658e:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006591:	2b 45 c0             	sub    -0x40(%ebp),%eax
c0006594:	89 45 b0             	mov    %eax,-0x50(%ebp)
c0006597:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c000659e:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00065a4:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00065a7:	eb 17                	jmp    c00065c0 <do_exec+0x246>
c00065a9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c00065ad:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065b0:	8b 10                	mov    (%eax),%edx
c00065b2:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00065b5:	01 c2                	add    %eax,%edx
c00065b7:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065ba:	89 10                	mov    %edx,(%eax)
c00065bc:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
c00065c0:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00065c3:	8b 00                	mov    (%eax),%eax
c00065c5:	85 c0                	test   %eax,%eax
c00065c7:	75 e0                	jne    c00065a9 <do_exec+0x22f>
c00065c9:	83 ec 08             	sub    $0x8,%esp
c00065cc:	8d 85 f6 14 fd ff    	lea    -0x2eb0a(%ebp),%eax
c00065d2:	50                   	push   %eax
c00065d3:	6a 05                	push   $0x5
c00065d5:	e8 d7 e5 ff ff       	call   c0004bb1 <v2l>
c00065da:	83 c4 10             	add    $0x10,%esp
c00065dd:	89 c3                	mov    %eax,%ebx
c00065df:	83 ec 08             	sub    $0x8,%esp
c00065e2:	ff 75 b8             	pushl  -0x48(%ebp)
c00065e5:	ff 75 d8             	pushl  -0x28(%ebp)
c00065e8:	e8 c4 e5 ff ff       	call   c0004bb1 <v2l>
c00065ed:	83 c4 10             	add    $0x10,%esp
c00065f0:	83 ec 04             	sub    $0x4,%esp
c00065f3:	ff 75 bc             	pushl  -0x44(%ebp)
c00065f6:	53                   	push   %ebx
c00065f7:	50                   	push   %eax
c00065f8:	e8 c7 4d 00 00       	call   c000b3c4 <Memcpy>
c00065fd:	83 c4 10             	add    $0x10,%esp
c0006600:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0006603:	89 45 ac             	mov    %eax,-0x54(%ebp)
c0006606:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006609:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000660c:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006612:	81 c2 94 35 08 c0    	add    $0xc0083594,%edx
c0006618:	89 02                	mov    %eax,(%edx)
c000661a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000661d:	8b 55 ac             	mov    -0x54(%ebp),%edx
c0006620:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006626:	81 c2 90 35 08 c0    	add    $0xc0083590,%edx
c000662c:	89 02                	mov    %eax,(%edx)
c000662e:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0006631:	8b 40 18             	mov    0x18(%eax),%eax
c0006634:	89 c2                	mov    %eax,%edx
c0006636:	8b 45 ac             	mov    -0x54(%ebp),%eax
c0006639:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000663f:	05 98 35 08 c0       	add    $0xc0083598,%eax
c0006644:	89 10                	mov    %edx,(%eax)
c0006646:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0006649:	8b 55 ac             	mov    -0x54(%ebp),%edx
c000664c:	69 d2 ac 02 00 00    	imul   $0x2ac,%edx,%edx
c0006652:	81 c2 a4 35 08 c0    	add    $0xc00835a4,%edx
c0006658:	89 02                	mov    %eax,(%edx)
c000665a:	8b 45 ac             	mov    -0x54(%ebp),%eax
c000665d:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006663:	05 4c 35 08 c0       	add    $0xc008354c,%eax
c0006668:	c7 00 1d 00 00 00    	movl   $0x1d,(%eax)
c000666e:	c7 85 f0 14 fd ff 65 	movl   $0x65,-0x2eb10(%ebp)
c0006675:	00 00 00 
c0006678:	c7 85 d0 14 fd ff 00 	movl   $0x0,-0x2eb30(%ebp)
c000667f:	00 00 00 
c0006682:	c7 85 d4 14 fd ff 00 	movl   $0x0,-0x2eb2c(%ebp)
c0006689:	00 00 00 
c000668c:	83 ec 04             	sub    $0x4,%esp
c000668f:	ff 75 d8             	pushl  -0x28(%ebp)
c0006692:	8d 85 88 14 fd ff    	lea    -0x2eb78(%ebp),%eax
c0006698:	50                   	push   %eax
c0006699:	6a 01                	push   $0x1
c000669b:	e8 3e 34 00 00       	call   c0009ade <send_rec>
c00066a0:	83 c4 10             	add    $0x10,%esp
c00066a3:	90                   	nop
c00066a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
c00066a7:	5b                   	pop    %ebx
c00066a8:	5e                   	pop    %esi
c00066a9:	5d                   	pop    %ebp
c00066aa:	c3                   	ret    

c00066ab <do_fork>:
c00066ab:	55                   	push   %ebp
c00066ac:	89 e5                	mov    %esp,%ebp
c00066ae:	81 ec 88 00 00 00    	sub    $0x88,%esp
c00066b4:	8b 45 08             	mov    0x8(%ebp),%eax
c00066b7:	8b 00                	mov    (%eax),%eax
c00066b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00066bc:	e8 f7 b0 ff ff       	call   c00017b8 <disable_int>
c00066c1:	83 ec 0c             	sub    $0xc,%esp
c00066c4:	ff 75 f4             	pushl  -0xc(%ebp)
c00066c7:	e8 14 3c 00 00       	call   c000a2e0 <fork_process>
c00066cc:	83 c4 10             	add    $0x10,%esp
c00066cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00066d2:	e8 e3 b0 ff ff       	call   c00017ba <enable_int>
c00066d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066da:	8b 80 20 01 00 00    	mov    0x120(%eax),%eax
c00066e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00066e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00066e6:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c00066ec:	8b 45 08             	mov    0x8(%ebp),%eax
c00066ef:	89 50 4c             	mov    %edx,0x4c(%eax)
c00066f2:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00066f9:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c0006700:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c0006707:	83 ec 04             	sub    $0x4,%esp
c000670a:	ff 75 ec             	pushl  -0x14(%ebp)
c000670d:	8d 45 80             	lea    -0x80(%ebp),%eax
c0006710:	50                   	push   %eax
c0006711:	6a 01                	push   $0x1
c0006713:	e8 c6 33 00 00       	call   c0009ade <send_rec>
c0006718:	83 c4 10             	add    $0x10,%esp
c000671b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000671e:	c9                   	leave  
c000671f:	c3                   	ret    

c0006720 <do_exit>:
c0006720:	55                   	push   %ebp
c0006721:	89 e5                	mov    %esp,%ebp
c0006723:	83 ec 18             	sub    $0x18,%esp
c0006726:	8b 45 08             	mov    0x8(%ebp),%eax
c0006729:	8b 00                	mov    (%eax),%eax
c000672b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000672e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006731:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006737:	05 00 33 08 c0       	add    $0xc0083300,%eax
c000673c:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000673f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006742:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0006748:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000674b:	8b 45 08             	mov    0x8(%ebp),%eax
c000674e:	8b 40 44             	mov    0x44(%eax),%eax
c0006751:	89 c2                	mov    %eax,%edx
c0006753:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006756:	89 90 64 02 00 00    	mov    %edx,0x264(%eax)
c000675c:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000675f:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006765:	05 45 35 08 c0       	add    $0xc0083545,%eax
c000676a:	0f b6 00             	movzbl (%eax),%eax
c000676d:	3c 04                	cmp    $0x4,%al
c000676f:	75 21                	jne    c0006792 <do_exit+0x72>
c0006771:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006774:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000677a:	05 45 35 08 c0       	add    $0xc0083545,%eax
c000677f:	c6 00 fb             	movb   $0xfb,(%eax)
c0006782:	83 ec 0c             	sub    $0xc,%esp
c0006785:	ff 75 ec             	pushl  -0x14(%ebp)
c0006788:	e8 59 01 00 00       	call   c00068e6 <cleanup>
c000678d:	83 c4 10             	add    $0x10,%esp
c0006790:	eb 0a                	jmp    c000679c <do_exit+0x7c>
c0006792:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006795:	c6 80 44 02 00 00 03 	movb   $0x3,0x244(%eax)
c000679c:	c7 45 f4 04 00 00 00 	movl   $0x4,-0xc(%ebp)
c00067a3:	eb 6e                	jmp    c0006813 <do_exit+0xf3>
c00067a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067a8:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067ae:	05 60 35 08 c0       	add    $0xc0083560,%eax
c00067b3:	8b 00                	mov    (%eax),%eax
c00067b5:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c00067b8:	75 55                	jne    c000680f <do_exit+0xef>
c00067ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067bd:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067c3:	05 60 35 08 c0       	add    $0xc0083560,%eax
c00067c8:	c7 00 06 00 00 00    	movl   $0x6,(%eax)
c00067ce:	0f b6 05 4d 45 08 c0 	movzbl 0xc008454d,%eax
c00067d5:	3c 04                	cmp    $0x4,%al
c00067d7:	75 36                	jne    c000680f <do_exit+0xef>
c00067d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067dc:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067e2:	05 45 35 08 c0       	add    $0xc0083545,%eax
c00067e7:	0f b6 00             	movzbl (%eax),%eax
c00067ea:	3c 03                	cmp    $0x3,%al
c00067ec:	75 21                	jne    c000680f <do_exit+0xef>
c00067ee:	c6 05 4d 45 08 c0 fb 	movb   $0xfb,0xc008454d
c00067f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00067f8:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00067fe:	05 00 33 08 c0       	add    $0xc0083300,%eax
c0006803:	83 ec 0c             	sub    $0xc,%esp
c0006806:	50                   	push   %eax
c0006807:	e8 da 00 00 00       	call   c00068e6 <cleanup>
c000680c:	83 c4 10             	add    $0x10,%esp
c000680f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006813:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0006817:	7e 8c                	jle    c00067a5 <do_exit+0x85>
c0006819:	90                   	nop
c000681a:	c9                   	leave  
c000681b:	c3                   	ret    

c000681c <do_wait>:
c000681c:	55                   	push   %ebp
c000681d:	89 e5                	mov    %esp,%ebp
c000681f:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0006825:	8b 45 08             	mov    0x8(%ebp),%eax
c0006828:	8b 00                	mov    (%eax),%eax
c000682a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000682d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006834:	c7 45 f0 04 00 00 00 	movl   $0x4,-0x10(%ebp)
c000683b:	eb 5f                	jmp    c000689c <do_wait+0x80>
c000683d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006840:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006846:	05 60 35 08 c0       	add    $0xc0083560,%eax
c000684b:	8b 00                	mov    (%eax),%eax
c000684d:	39 45 ec             	cmp    %eax,-0x14(%ebp)
c0006850:	75 46                	jne    c0006898 <do_wait+0x7c>
c0006852:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006856:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006859:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c000685f:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006864:	0f b6 00             	movzbl (%eax),%eax
c0006867:	3c 03                	cmp    $0x3,%al
c0006869:	75 2d                	jne    c0006898 <do_wait+0x7c>
c000686b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000686e:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006874:	05 45 35 08 c0       	add    $0xc0083545,%eax
c0006879:	c6 00 fb             	movb   $0xfb,(%eax)
c000687c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000687f:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0006885:	05 00 33 08 c0       	add    $0xc0083300,%eax
c000688a:	83 ec 0c             	sub    $0xc,%esp
c000688d:	50                   	push   %eax
c000688e:	e8 53 00 00 00       	call   c00068e6 <cleanup>
c0006893:	83 c4 10             	add    $0x10,%esp
c0006896:	eb 4c                	jmp    c00068e4 <do_wait+0xc8>
c0006898:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000689c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00068a0:	7e 9b                	jle    c000683d <do_wait+0x21>
c00068a2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00068a6:	74 13                	je     c00068bb <do_wait+0x9f>
c00068a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00068ab:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c00068b1:	05 45 35 08 c0       	add    $0xc0083545,%eax
c00068b6:	c6 00 04             	movb   $0x4,(%eax)
c00068b9:	eb 29                	jmp    c00068e4 <do_wait+0xc8>
c00068bb:	c7 45 e8 65 00 00 00 	movl   $0x65,-0x18(%ebp)
c00068c2:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
c00068c9:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
c00068d0:	83 ec 04             	sub    $0x4,%esp
c00068d3:	ff 75 ec             	pushl  -0x14(%ebp)
c00068d6:	8d 45 80             	lea    -0x80(%ebp),%eax
c00068d9:	50                   	push   %eax
c00068da:	6a 01                	push   $0x1
c00068dc:	e8 fd 31 00 00       	call   c0009ade <send_rec>
c00068e1:	83 c4 10             	add    $0x10,%esp
c00068e4:	c9                   	leave  
c00068e5:	c3                   	ret    

c00068e6 <cleanup>:
c00068e6:	55                   	push   %ebp
c00068e7:	89 e5                	mov    %esp,%ebp
c00068e9:	83 ec 78             	sub    $0x78,%esp
c00068ec:	c7 45 f4 65 00 00 00 	movl   $0x65,-0xc(%ebp)
c00068f3:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
c00068fa:	8b 45 08             	mov    0x8(%ebp),%eax
c00068fd:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c0006903:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006906:	8b 45 08             	mov    0x8(%ebp),%eax
c0006909:	8b 80 64 02 00 00    	mov    0x264(%eax),%eax
c000690f:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006912:	8b 45 08             	mov    0x8(%ebp),%eax
c0006915:	8b 80 60 02 00 00    	mov    0x260(%eax),%eax
c000691b:	83 ec 04             	sub    $0x4,%esp
c000691e:	50                   	push   %eax
c000691f:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0006922:	50                   	push   %eax
c0006923:	6a 01                	push   $0x1
c0006925:	e8 b4 31 00 00       	call   c0009ade <send_rec>
c000692a:	83 c4 10             	add    $0x10,%esp
c000692d:	8b 45 08             	mov    0x8(%ebp),%eax
c0006930:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c0006937:	90                   	nop
c0006938:	c9                   	leave  
c0006939:	c3                   	ret    

c000693a <init_bitmap>:
c000693a:	55                   	push   %ebp
c000693b:	89 e5                	mov    %esp,%ebp
c000693d:	83 ec 08             	sub    $0x8,%esp
c0006940:	8b 45 08             	mov    0x8(%ebp),%eax
c0006943:	8b 50 04             	mov    0x4(%eax),%edx
c0006946:	8b 45 08             	mov    0x8(%ebp),%eax
c0006949:	8b 00                	mov    (%eax),%eax
c000694b:	83 ec 04             	sub    $0x4,%esp
c000694e:	52                   	push   %edx
c000694f:	6a 00                	push   $0x0
c0006951:	50                   	push   %eax
c0006952:	e8 9b 4a 00 00       	call   c000b3f2 <Memset>
c0006957:	83 c4 10             	add    $0x10,%esp
c000695a:	90                   	nop
c000695b:	c9                   	leave  
c000695c:	c3                   	ret    

c000695d <test_bit_val>:
c000695d:	55                   	push   %ebp
c000695e:	89 e5                	mov    %esp,%ebp
c0006960:	53                   	push   %ebx
c0006961:	83 ec 10             	sub    $0x10,%esp
c0006964:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006967:	8d 50 07             	lea    0x7(%eax),%edx
c000696a:	85 c0                	test   %eax,%eax
c000696c:	0f 48 c2             	cmovs  %edx,%eax
c000696f:	c1 f8 03             	sar    $0x3,%eax
c0006972:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006975:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006978:	99                   	cltd   
c0006979:	c1 ea 1d             	shr    $0x1d,%edx
c000697c:	01 d0                	add    %edx,%eax
c000697e:	83 e0 07             	and    $0x7,%eax
c0006981:	29 d0                	sub    %edx,%eax
c0006983:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006986:	8b 45 08             	mov    0x8(%ebp),%eax
c0006989:	8b 10                	mov    (%eax),%edx
c000698b:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000698e:	01 d0                	add    %edx,%eax
c0006990:	0f b6 00             	movzbl (%eax),%eax
c0006993:	88 45 f3             	mov    %al,-0xd(%ebp)
c0006996:	0f be 55 f3          	movsbl -0xd(%ebp),%edx
c000699a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000699d:	bb 01 00 00 00       	mov    $0x1,%ebx
c00069a2:	89 c1                	mov    %eax,%ecx
c00069a4:	d3 e3                	shl    %cl,%ebx
c00069a6:	89 d8                	mov    %ebx,%eax
c00069a8:	21 c2                	and    %eax,%edx
c00069aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00069ad:	89 c1                	mov    %eax,%ecx
c00069af:	d3 fa                	sar    %cl,%edx
c00069b1:	89 d0                	mov    %edx,%eax
c00069b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00069b6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
c00069ba:	0f 9f c0             	setg   %al
c00069bd:	0f b6 c0             	movzbl %al,%eax
c00069c0:	83 c4 10             	add    $0x10,%esp
c00069c3:	5b                   	pop    %ebx
c00069c4:	5d                   	pop    %ebp
c00069c5:	c3                   	ret    

c00069c6 <set_bit_val>:
c00069c6:	55                   	push   %ebp
c00069c7:	89 e5                	mov    %esp,%ebp
c00069c9:	83 ec 10             	sub    $0x10,%esp
c00069cc:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069cf:	8d 50 07             	lea    0x7(%eax),%edx
c00069d2:	85 c0                	test   %eax,%eax
c00069d4:	0f 48 c2             	cmovs  %edx,%eax
c00069d7:	c1 f8 03             	sar    $0x3,%eax
c00069da:	89 45 f8             	mov    %eax,-0x8(%ebp)
c00069dd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00069e0:	99                   	cltd   
c00069e1:	c1 ea 1d             	shr    $0x1d,%edx
c00069e4:	01 d0                	add    %edx,%eax
c00069e6:	83 e0 07             	and    $0x7,%eax
c00069e9:	29 d0                	sub    %edx,%eax
c00069eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00069ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00069f1:	8b 10                	mov    (%eax),%edx
c00069f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
c00069f6:	01 d0                	add    %edx,%eax
c00069f8:	0f b6 00             	movzbl (%eax),%eax
c00069fb:	88 45 ff             	mov    %al,-0x1(%ebp)
c00069fe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
c0006a02:	7e 13                	jle    c0006a17 <set_bit_val+0x51>
c0006a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a07:	ba 01 00 00 00       	mov    $0x1,%edx
c0006a0c:	89 c1                	mov    %eax,%ecx
c0006a0e:	d3 e2                	shl    %cl,%edx
c0006a10:	89 d0                	mov    %edx,%eax
c0006a12:	08 45 ff             	or     %al,-0x1(%ebp)
c0006a15:	eb 13                	jmp    c0006a2a <set_bit_val+0x64>
c0006a17:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006a1a:	ba 01 00 00 00       	mov    $0x1,%edx
c0006a1f:	89 c1                	mov    %eax,%ecx
c0006a21:	d3 e2                	shl    %cl,%edx
c0006a23:	89 d0                	mov    %edx,%eax
c0006a25:	f7 d0                	not    %eax
c0006a27:	20 45 ff             	and    %al,-0x1(%ebp)
c0006a2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a2d:	8b 10                	mov    (%eax),%edx
c0006a2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006a32:	01 c2                	add    %eax,%edx
c0006a34:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
c0006a38:	88 02                	mov    %al,(%edx)
c0006a3a:	b8 01 00 00 00       	mov    $0x1,%eax
c0006a3f:	c9                   	leave  
c0006a40:	c3                   	ret    

c0006a41 <set_bits>:
c0006a41:	55                   	push   %ebp
c0006a42:	89 e5                	mov    %esp,%ebp
c0006a44:	83 ec 10             	sub    $0x10,%esp
c0006a47:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0006a4e:	eb 1c                	jmp    c0006a6c <set_bits+0x2b>
c0006a50:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a53:	8d 50 01             	lea    0x1(%eax),%edx
c0006a56:	89 55 0c             	mov    %edx,0xc(%ebp)
c0006a59:	ff 75 10             	pushl  0x10(%ebp)
c0006a5c:	50                   	push   %eax
c0006a5d:	ff 75 08             	pushl  0x8(%ebp)
c0006a60:	e8 61 ff ff ff       	call   c00069c6 <set_bit_val>
c0006a65:	83 c4 0c             	add    $0xc,%esp
c0006a68:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006a6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006a6f:	3b 45 14             	cmp    0x14(%ebp),%eax
c0006a72:	7c dc                	jl     c0006a50 <set_bits+0xf>
c0006a74:	b8 01 00 00 00       	mov    $0x1,%eax
c0006a79:	c9                   	leave  
c0006a7a:	c3                   	ret    

c0006a7b <get_first_free_bit>:
c0006a7b:	55                   	push   %ebp
c0006a7c:	89 e5                	mov    %esp,%ebp
c0006a7e:	83 ec 10             	sub    $0x10,%esp
c0006a81:	8b 45 08             	mov    0x8(%ebp),%eax
c0006a84:	8b 40 04             	mov    0x4(%eax),%eax
c0006a87:	c1 e0 03             	shl    $0x3,%eax
c0006a8a:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006a8d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006a90:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006a93:	eb 1b                	jmp    c0006ab0 <get_first_free_bit+0x35>
c0006a95:	ff 75 fc             	pushl  -0x4(%ebp)
c0006a98:	ff 75 08             	pushl  0x8(%ebp)
c0006a9b:	e8 bd fe ff ff       	call   c000695d <test_bit_val>
c0006aa0:	83 c4 08             	add    $0x8,%esp
c0006aa3:	85 c0                	test   %eax,%eax
c0006aa5:	75 05                	jne    c0006aac <get_first_free_bit+0x31>
c0006aa7:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006aaa:	eb 11                	jmp    c0006abd <get_first_free_bit+0x42>
c0006aac:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0006ab0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006ab3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
c0006ab6:	7c dd                	jl     c0006a95 <get_first_free_bit+0x1a>
c0006ab8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
c0006abd:	c9                   	leave  
c0006abe:	c3                   	ret    

c0006abf <get_bits>:
c0006abf:	55                   	push   %ebp
c0006ac0:	89 e5                	mov    %esp,%ebp
c0006ac2:	83 ec 20             	sub    $0x20,%esp
c0006ac5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006acc:	ff 75 f0             	pushl  -0x10(%ebp)
c0006acf:	ff 75 08             	pushl  0x8(%ebp)
c0006ad2:	e8 a4 ff ff ff       	call   c0006a7b <get_first_free_bit>
c0006ad7:	83 c4 08             	add    $0x8,%esp
c0006ada:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006add:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ae0:	8b 40 04             	mov    0x4(%eax),%eax
c0006ae3:	c1 e0 03             	shl    $0x3,%eax
c0006ae6:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006ae9:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006aec:	83 e8 01             	sub    $0x1,%eax
c0006aef:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006af2:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
c0006af6:	75 08                	jne    c0006b00 <get_bits+0x41>
c0006af8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006afb:	e9 85 00 00 00       	jmp    c0006b85 <get_bits+0xc6>
c0006b00:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b03:	83 c0 01             	add    $0x1,%eax
c0006b06:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b09:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b0f:	eb 58                	jmp    c0006b69 <get_bits+0xaa>
c0006b11:	ff 75 f8             	pushl  -0x8(%ebp)
c0006b14:	ff 75 08             	pushl  0x8(%ebp)
c0006b17:	e8 41 fe ff ff       	call   c000695d <test_bit_val>
c0006b1c:	83 c4 08             	add    $0x8,%esp
c0006b1f:	85 c0                	test   %eax,%eax
c0006b21:	75 0a                	jne    c0006b2d <get_bits+0x6e>
c0006b23:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0006b27:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0006b2b:	eb 2b                	jmp    c0006b58 <get_bits+0x99>
c0006b2d:	6a 00                	push   $0x0
c0006b2f:	ff 75 08             	pushl  0x8(%ebp)
c0006b32:	e8 44 ff ff ff       	call   c0006a7b <get_first_free_bit>
c0006b37:	83 c4 08             	add    $0x8,%esp
c0006b3a:	83 c0 01             	add    $0x1,%eax
c0006b3d:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006b40:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006b43:	83 c0 01             	add    $0x1,%eax
c0006b46:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b49:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b4f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006b52:	83 e8 01             	sub    $0x1,%eax
c0006b55:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006b58:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b5b:	3b 45 e8             	cmp    -0x18(%ebp),%eax
c0006b5e:	7c 09                	jl     c0006b69 <get_bits+0xaa>
c0006b60:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
c0006b67:	eb 0d                	jmp    c0006b76 <get_bits+0xb7>
c0006b69:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006b6c:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006b6f:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0006b72:	85 c0                	test   %eax,%eax
c0006b74:	7f 9b                	jg     c0006b11 <get_bits+0x52>
c0006b76:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006b79:	2b 45 0c             	sub    0xc(%ebp),%eax
c0006b7c:	83 c0 01             	add    $0x1,%eax
c0006b7f:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006b82:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006b85:	c9                   	leave  
c0006b86:	c3                   	ret    

c0006b87 <get_a_page2>:
c0006b87:	55                   	push   %ebp
c0006b88:	89 e5                	mov    %esp,%ebp
c0006b8a:	83 ec 18             	sub    $0x18,%esp
c0006b8d:	83 ec 0c             	sub    $0xc,%esp
c0006b90:	ff 75 0c             	pushl  0xc(%ebp)
c0006b93:	e8 1e 00 00 00       	call   c0006bb6 <get_a_page>
c0006b98:	83 c4 10             	add    $0x10,%esp
c0006b9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006b9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0006ba1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ba4:	83 ec 08             	sub    $0x8,%esp
c0006ba7:	52                   	push   %edx
c0006ba8:	50                   	push   %eax
c0006ba9:	e8 61 01 00 00       	call   c0006d0f <add_map_entry>
c0006bae:	83 c4 10             	add    $0x10,%esp
c0006bb1:	8b 45 08             	mov    0x8(%ebp),%eax
c0006bb4:	c9                   	leave  
c0006bb5:	c3                   	ret    

c0006bb6 <get_a_page>:
c0006bb6:	55                   	push   %ebp
c0006bb7:	89 e5                	mov    %esp,%ebp
c0006bb9:	83 ec 20             	sub    $0x20,%esp
c0006bbc:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0006bc0:	75 22                	jne    c0006be4 <get_a_page+0x2e>
c0006bc2:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c0006bc7:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006bca:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c0006bcf:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006bd2:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0006bd7:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006bda:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0006bdf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006be2:	eb 20                	jmp    c0006c04 <get_a_page+0x4e>
c0006be4:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0006be9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006bec:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c0006bf1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006bf4:	a1 cc 1e 01 c0       	mov    0xc0011ecc,%eax
c0006bf9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006bfc:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0006c01:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c04:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006c07:	8b 55 ec             	mov    -0x14(%ebp),%edx
c0006c0a:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c0d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
c0006c10:	6a 01                	push   $0x1
c0006c12:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c15:	50                   	push   %eax
c0006c16:	e8 a4 fe ff ff       	call   c0006abf <get_bits>
c0006c1b:	83 c4 08             	add    $0x8,%esp
c0006c1e:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006c21:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006c24:	8b 55 fc             	mov    -0x4(%ebp),%edx
c0006c27:	c1 e2 0c             	shl    $0xc,%edx
c0006c2a:	01 d0                	add    %edx,%eax
c0006c2c:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006c2f:	6a 01                	push   $0x1
c0006c31:	ff 75 fc             	pushl  -0x4(%ebp)
c0006c34:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c37:	50                   	push   %eax
c0006c38:	e8 89 fd ff ff       	call   c00069c6 <set_bit_val>
c0006c3d:	83 c4 0c             	add    $0xc,%esp
c0006c40:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006c43:	c9                   	leave  
c0006c44:	c3                   	ret    

c0006c45 <get_virtual_address>:
c0006c45:	55                   	push   %ebp
c0006c46:	89 e5                	mov    %esp,%ebp
c0006c48:	83 ec 28             	sub    $0x28,%esp
c0006c4b:	e8 46 ac ff ff       	call   c0001896 <get_running_thread_pcb>
c0006c50:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006c53:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0006c57:	75 1a                	jne    c0006c73 <get_virtual_address+0x2e>
c0006c59:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0006c5e:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0006c61:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0006c66:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0006c69:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0006c6e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006c71:	eb 18                	jmp    c0006c8b <get_virtual_address+0x46>
c0006c73:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006c76:	8b 40 08             	mov    0x8(%eax),%eax
c0006c79:	83 ec 04             	sub    $0x4,%esp
c0006c7c:	6a 0c                	push   $0xc
c0006c7e:	50                   	push   %eax
c0006c7f:	8d 45 e0             	lea    -0x20(%ebp),%eax
c0006c82:	50                   	push   %eax
c0006c83:	e8 3c 47 00 00       	call   c000b3c4 <Memcpy>
c0006c88:	83 c4 10             	add    $0x10,%esp
c0006c8b:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0006c8e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006c91:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006c94:	89 55 dc             	mov    %edx,-0x24(%ebp)
c0006c97:	8b 45 08             	mov    0x8(%ebp),%eax
c0006c9a:	83 ec 08             	sub    $0x8,%esp
c0006c9d:	50                   	push   %eax
c0006c9e:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006ca1:	50                   	push   %eax
c0006ca2:	e8 18 fe ff ff       	call   c0006abf <get_bits>
c0006ca7:	83 c4 10             	add    $0x10,%esp
c0006caa:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006cad:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006cb0:	8b 55 f0             	mov    -0x10(%ebp),%edx
c0006cb3:	c1 e2 0c             	shl    $0xc,%edx
c0006cb6:	01 d0                	add    %edx,%eax
c0006cb8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006cbb:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cbe:	50                   	push   %eax
c0006cbf:	6a 01                	push   $0x1
c0006cc1:	ff 75 f0             	pushl  -0x10(%ebp)
c0006cc4:	8d 45 d8             	lea    -0x28(%ebp),%eax
c0006cc7:	50                   	push   %eax
c0006cc8:	e8 74 fd ff ff       	call   c0006a41 <set_bits>
c0006ccd:	83 c4 10             	add    $0x10,%esp
c0006cd0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006cd3:	c9                   	leave  
c0006cd4:	c3                   	ret    

c0006cd5 <ptr_pde>:
c0006cd5:	55                   	push   %ebp
c0006cd6:	89 e5                	mov    %esp,%ebp
c0006cd8:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cdb:	c1 e8 16             	shr    $0x16,%eax
c0006cde:	05 00 fc ff 3f       	add    $0x3ffffc00,%eax
c0006ce3:	c1 e0 02             	shl    $0x2,%eax
c0006ce6:	5d                   	pop    %ebp
c0006ce7:	c3                   	ret    

c0006ce8 <ptr_pte>:
c0006ce8:	55                   	push   %ebp
c0006ce9:	89 e5                	mov    %esp,%ebp
c0006ceb:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cee:	c1 e8 0a             	shr    $0xa,%eax
c0006cf1:	25 00 f0 3f 00       	and    $0x3ff000,%eax
c0006cf6:	89 c2                	mov    %eax,%edx
c0006cf8:	8b 45 08             	mov    0x8(%ebp),%eax
c0006cfb:	c1 e8 0c             	shr    $0xc,%eax
c0006cfe:	25 ff 03 00 00       	and    $0x3ff,%eax
c0006d03:	c1 e0 02             	shl    $0x2,%eax
c0006d06:	01 d0                	add    %edx,%eax
c0006d08:	2d 00 00 40 00       	sub    $0x400000,%eax
c0006d0d:	5d                   	pop    %ebp
c0006d0e:	c3                   	ret    

c0006d0f <add_map_entry>:
c0006d0f:	55                   	push   %ebp
c0006d10:	89 e5                	mov    %esp,%ebp
c0006d12:	83 ec 18             	sub    $0x18,%esp
c0006d15:	ff 75 08             	pushl  0x8(%ebp)
c0006d18:	e8 b8 ff ff ff       	call   c0006cd5 <ptr_pde>
c0006d1d:	83 c4 04             	add    $0x4,%esp
c0006d20:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006d23:	ff 75 08             	pushl  0x8(%ebp)
c0006d26:	e8 bd ff ff ff       	call   c0006ce8 <ptr_pte>
c0006d2b:	83 c4 04             	add    $0x4,%esp
c0006d2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006d31:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d34:	8b 00                	mov    (%eax),%eax
c0006d36:	83 e0 01             	and    $0x1,%eax
c0006d39:	85 c0                	test   %eax,%eax
c0006d3b:	74 1b                	je     c0006d58 <add_map_entry+0x49>
c0006d3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d40:	8b 00                	mov    (%eax),%eax
c0006d42:	83 e0 01             	and    $0x1,%eax
c0006d45:	85 c0                	test   %eax,%eax
c0006d47:	75 51                	jne    c0006d9a <add_map_entry+0x8b>
c0006d49:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d4c:	83 c8 07             	or     $0x7,%eax
c0006d4f:	89 c2                	mov    %eax,%edx
c0006d51:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d54:	89 10                	mov    %edx,(%eax)
c0006d56:	eb 42                	jmp    c0006d9a <add_map_entry+0x8b>
c0006d58:	6a 00                	push   $0x0
c0006d5a:	e8 57 fe ff ff       	call   c0006bb6 <get_a_page>
c0006d5f:	83 c4 04             	add    $0x4,%esp
c0006d62:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006d65:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006d68:	83 c8 07             	or     $0x7,%eax
c0006d6b:	89 c2                	mov    %eax,%edx
c0006d6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0006d70:	89 10                	mov    %edx,(%eax)
c0006d72:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d75:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006d7a:	83 ec 04             	sub    $0x4,%esp
c0006d7d:	68 00 10 00 00       	push   $0x1000
c0006d82:	6a 00                	push   $0x0
c0006d84:	50                   	push   %eax
c0006d85:	e8 68 46 00 00       	call   c000b3f2 <Memset>
c0006d8a:	83 c4 10             	add    $0x10,%esp
c0006d8d:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006d90:	83 c8 07             	or     $0x7,%eax
c0006d93:	89 c2                	mov    %eax,%edx
c0006d95:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006d98:	89 10                	mov    %edx,(%eax)
c0006d9a:	90                   	nop
c0006d9b:	c9                   	leave  
c0006d9c:	c3                   	ret    

c0006d9d <alloc_virtual_memory>:
c0006d9d:	55                   	push   %ebp
c0006d9e:	89 e5                	mov    %esp,%ebp
c0006da0:	83 ec 18             	sub    $0x18,%esp
c0006da3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006da6:	05 ff 0f 00 00       	add    $0xfff,%eax
c0006dab:	c1 e8 0c             	shr    $0xc,%eax
c0006dae:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006db1:	e8 e0 aa ff ff       	call   c0001896 <get_running_thread_pcb>
c0006db6:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006db9:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006dbc:	8b 40 04             	mov    0x4(%eax),%eax
c0006dbf:	85 c0                	test   %eax,%eax
c0006dc1:	75 09                	jne    c0006dcc <alloc_virtual_memory+0x2f>
c0006dc3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006dca:	eb 07                	jmp    c0006dd3 <alloc_virtual_memory+0x36>
c0006dcc:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0006dd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006dd6:	83 ec 08             	sub    $0x8,%esp
c0006dd9:	ff 75 f4             	pushl  -0xc(%ebp)
c0006ddc:	50                   	push   %eax
c0006ddd:	e8 63 fe ff ff       	call   c0006c45 <get_virtual_address>
c0006de2:	83 c4 10             	add    $0x10,%esp
c0006de5:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006de8:	83 ec 08             	sub    $0x8,%esp
c0006deb:	ff 75 08             	pushl  0x8(%ebp)
c0006dee:	ff 75 e8             	pushl  -0x18(%ebp)
c0006df1:	e8 19 ff ff ff       	call   c0006d0f <add_map_entry>
c0006df6:	83 c4 10             	add    $0x10,%esp
c0006df9:	8b 45 08             	mov    0x8(%ebp),%eax
c0006dfc:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e01:	89 c2                	mov    %eax,%edx
c0006e03:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0006e06:	01 d0                	add    %edx,%eax
c0006e08:	c9                   	leave  
c0006e09:	c3                   	ret    

c0006e0a <get_physical_address>:
c0006e0a:	55                   	push   %ebp
c0006e0b:	89 e5                	mov    %esp,%ebp
c0006e0d:	83 ec 10             	sub    $0x10,%esp
c0006e10:	ff 75 08             	pushl  0x8(%ebp)
c0006e13:	e8 d0 fe ff ff       	call   c0006ce8 <ptr_pte>
c0006e18:	83 c4 04             	add    $0x4,%esp
c0006e1b:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006e1e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006e21:	8b 00                	mov    (%eax),%eax
c0006e23:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006e28:	89 c2                	mov    %eax,%edx
c0006e2a:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e2d:	25 ff 0f 00 00       	and    $0xfff,%eax
c0006e32:	09 d0                	or     %edx,%eax
c0006e34:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0006e37:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0006e3a:	c9                   	leave  
c0006e3b:	c3                   	ret    

c0006e3c <alloc_memory>:
c0006e3c:	55                   	push   %ebp
c0006e3d:	89 e5                	mov    %esp,%ebp
c0006e3f:	83 ec 18             	sub    $0x18,%esp
c0006e42:	83 ec 08             	sub    $0x8,%esp
c0006e45:	ff 75 0c             	pushl  0xc(%ebp)
c0006e48:	ff 75 08             	pushl  0x8(%ebp)
c0006e4b:	e8 f5 fd ff ff       	call   c0006c45 <get_virtual_address>
c0006e50:	83 c4 10             	add    $0x10,%esp
c0006e53:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0006e56:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e59:	2d 00 10 00 00       	sub    $0x1000,%eax
c0006e5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006e61:	eb 29                	jmp    c0006e8c <alloc_memory+0x50>
c0006e63:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
c0006e6a:	83 ec 0c             	sub    $0xc,%esp
c0006e6d:	ff 75 0c             	pushl  0xc(%ebp)
c0006e70:	e8 41 fd ff ff       	call   c0006bb6 <get_a_page>
c0006e75:	83 c4 10             	add    $0x10,%esp
c0006e78:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006e7b:	83 ec 08             	sub    $0x8,%esp
c0006e7e:	ff 75 ec             	pushl  -0x14(%ebp)
c0006e81:	ff 75 f4             	pushl  -0xc(%ebp)
c0006e84:	e8 86 fe ff ff       	call   c0006d0f <add_map_entry>
c0006e89:	83 c4 10             	add    $0x10,%esp
c0006e8c:	8b 45 08             	mov    0x8(%ebp),%eax
c0006e8f:	8d 50 ff             	lea    -0x1(%eax),%edx
c0006e92:	89 55 08             	mov    %edx,0x8(%ebp)
c0006e95:	85 c0                	test   %eax,%eax
c0006e97:	75 ca                	jne    c0006e63 <alloc_memory+0x27>
c0006e99:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0006e9c:	c9                   	leave  
c0006e9d:	c3                   	ret    

c0006e9e <get_a_virtual_page>:
c0006e9e:	55                   	push   %ebp
c0006e9f:	89 e5                	mov    %esp,%ebp
c0006ea1:	83 ec 18             	sub    $0x18,%esp
c0006ea4:	ff 75 08             	pushl  0x8(%ebp)
c0006ea7:	e8 0a fd ff ff       	call   c0006bb6 <get_a_page>
c0006eac:	83 c4 04             	add    $0x4,%esp
c0006eaf:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006eb2:	83 ec 08             	sub    $0x8,%esp
c0006eb5:	ff 75 f4             	pushl  -0xc(%ebp)
c0006eb8:	ff 75 0c             	pushl  0xc(%ebp)
c0006ebb:	e8 4f fe ff ff       	call   c0006d0f <add_map_entry>
c0006ec0:	83 c4 10             	add    $0x10,%esp
c0006ec3:	8b 45 0c             	mov    0xc(%ebp),%eax
c0006ec6:	c9                   	leave  
c0006ec7:	c3                   	ret    

c0006ec8 <block2arena>:
c0006ec8:	55                   	push   %ebp
c0006ec9:	89 e5                	mov    %esp,%ebp
c0006ecb:	83 ec 10             	sub    $0x10,%esp
c0006ece:	8b 45 08             	mov    0x8(%ebp),%eax
c0006ed1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
c0006ed6:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0006ed9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0006edc:	c9                   	leave  
c0006edd:	c3                   	ret    

c0006ede <sys_malloc>:
c0006ede:	55                   	push   %ebp
c0006edf:	89 e5                	mov    %esp,%ebp
c0006ee1:	83 ec 58             	sub    $0x58,%esp
c0006ee4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0006eeb:	e8 a6 a9 ff ff       	call   c0001896 <get_running_thread_pcb>
c0006ef0:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0006ef3:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006ef6:	8b 40 04             	mov    0x4(%eax),%eax
c0006ef9:	85 c0                	test   %eax,%eax
c0006efb:	75 10                	jne    c0006f0d <sys_malloc+0x2f>
c0006efd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0006f04:	c7 45 ec 00 32 08 c0 	movl   $0xc0083200,-0x14(%ebp)
c0006f0b:	eb 10                	jmp    c0006f1d <sys_malloc+0x3f>
c0006f0d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0006f14:	8b 45 dc             	mov    -0x24(%ebp),%eax
c0006f17:	83 c0 0c             	add    $0xc,%eax
c0006f1a:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0006f1d:	81 7d 08 00 04 00 00 	cmpl   $0x400,0x8(%ebp)
c0006f24:	76 50                	jbe    c0006f76 <sys_malloc+0x98>
c0006f26:	8b 45 08             	mov    0x8(%ebp),%eax
c0006f29:	05 0b 10 00 00       	add    $0x100b,%eax
c0006f2e:	c1 e8 0c             	shr    $0xc,%eax
c0006f31:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0006f34:	83 ec 08             	sub    $0x8,%esp
c0006f37:	ff 75 f0             	pushl  -0x10(%ebp)
c0006f3a:	ff 75 d8             	pushl  -0x28(%ebp)
c0006f3d:	e8 fa fe ff ff       	call   c0006e3c <alloc_memory>
c0006f42:	83 c4 10             	add    $0x10,%esp
c0006f45:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0006f48:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0006f4b:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0006f4e:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f51:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0006f57:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f5a:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
c0006f61:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f64:	c6 40 08 01          	movb   $0x1,0x8(%eax)
c0006f68:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0006f6b:	83 c0 0c             	add    $0xc,%eax
c0006f6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0006f71:	e9 7a 01 00 00       	jmp    c00070f0 <sys_malloc+0x212>
c0006f76:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0006f7d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0006f84:	eb 26                	jmp    c0006fac <sys_malloc+0xce>
c0006f86:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0006f89:	89 d0                	mov    %edx,%eax
c0006f8b:	01 c0                	add    %eax,%eax
c0006f8d:	01 d0                	add    %edx,%eax
c0006f8f:	c1 e0 03             	shl    $0x3,%eax
c0006f92:	89 c2                	mov    %eax,%edx
c0006f94:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006f97:	01 d0                	add    %edx,%eax
c0006f99:	8b 00                	mov    (%eax),%eax
c0006f9b:	39 45 08             	cmp    %eax,0x8(%ebp)
c0006f9e:	77 08                	ja     c0006fa8 <sys_malloc+0xca>
c0006fa0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0006fa3:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0006fa6:	eb 0a                	jmp    c0006fb2 <sys_malloc+0xd4>
c0006fa8:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0006fac:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0006fb0:	7e d4                	jle    c0006f86 <sys_malloc+0xa8>
c0006fb2:	83 ec 08             	sub    $0x8,%esp
c0006fb5:	ff 75 f0             	pushl  -0x10(%ebp)
c0006fb8:	6a 01                	push   $0x1
c0006fba:	e8 7d fe ff ff       	call   c0006e3c <alloc_memory>
c0006fbf:	83 c4 10             	add    $0x10,%esp
c0006fc2:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0006fc5:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006fc8:	89 d0                	mov    %edx,%eax
c0006fca:	01 c0                	add    %eax,%eax
c0006fcc:	01 d0                	add    %edx,%eax
c0006fce:	c1 e0 03             	shl    $0x3,%eax
c0006fd1:	89 c2                	mov    %eax,%edx
c0006fd3:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006fd6:	01 d0                	add    %edx,%eax
c0006fd8:	83 ec 04             	sub    $0x4,%esp
c0006fdb:	6a 18                	push   $0x18
c0006fdd:	50                   	push   %eax
c0006fde:	ff 75 cc             	pushl  -0x34(%ebp)
c0006fe1:	e8 de 43 00 00       	call   c000b3c4 <Memcpy>
c0006fe6:	83 c4 10             	add    $0x10,%esp
c0006fe9:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0006fec:	89 d0                	mov    %edx,%eax
c0006fee:	01 c0                	add    %eax,%eax
c0006ff0:	01 d0                	add    %edx,%eax
c0006ff2:	c1 e0 03             	shl    $0x3,%eax
c0006ff5:	89 c2                	mov    %eax,%edx
c0006ff7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0006ffa:	01 d0                	add    %edx,%eax
c0006ffc:	83 c0 08             	add    $0x8,%eax
c0006fff:	83 ec 0c             	sub    $0xc,%esp
c0007002:	50                   	push   %eax
c0007003:	e8 3b 35 00 00       	call   c000a543 <isListEmpty>
c0007008:	83 c4 10             	add    $0x10,%esp
c000700b:	3c 01                	cmp    $0x1,%al
c000700d:	0f 85 91 00 00 00    	jne    c00070a4 <sys_malloc+0x1c6>
c0007013:	83 ec 08             	sub    $0x8,%esp
c0007016:	ff 75 f0             	pushl  -0x10(%ebp)
c0007019:	6a 01                	push   $0x1
c000701b:	e8 1c fe ff ff       	call   c0006e3c <alloc_memory>
c0007020:	83 c4 10             	add    $0x10,%esp
c0007023:	89 45 c8             	mov    %eax,-0x38(%ebp)
c0007026:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0007029:	8b 00                	mov    (%eax),%eax
c000702b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c000702e:	c7 45 c0 0c 00 00 00 	movl   $0xc,-0x40(%ebp)
c0007035:	b8 00 10 00 00       	mov    $0x1000,%eax
c000703a:	2b 45 c0             	sub    -0x40(%ebp),%eax
c000703d:	ba 00 00 00 00       	mov    $0x0,%edx
c0007042:	f7 75 c4             	divl   -0x3c(%ebp)
c0007045:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007048:	8b 55 c8             	mov    -0x38(%ebp),%edx
c000704b:	8b 45 c0             	mov    -0x40(%ebp),%eax
c000704e:	01 d0                	add    %edx,%eax
c0007050:	89 45 b8             	mov    %eax,-0x48(%ebp)
c0007053:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000705a:	eb 3b                	jmp    c0007097 <sys_malloc+0x1b9>
c000705c:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000705f:	0f af 45 c4          	imul   -0x3c(%ebp),%eax
c0007063:	89 c2                	mov    %eax,%edx
c0007065:	8b 45 b8             	mov    -0x48(%ebp),%eax
c0007068:	01 d0                	add    %edx,%eax
c000706a:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c000706d:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
c0007070:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007073:	89 d0                	mov    %edx,%eax
c0007075:	01 c0                	add    %eax,%eax
c0007077:	01 d0                	add    %edx,%eax
c0007079:	c1 e0 03             	shl    $0x3,%eax
c000707c:	89 c2                	mov    %eax,%edx
c000707e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007081:	01 d0                	add    %edx,%eax
c0007083:	83 c0 08             	add    $0x8,%eax
c0007086:	83 ec 08             	sub    $0x8,%esp
c0007089:	51                   	push   %ecx
c000708a:	50                   	push   %eax
c000708b:	e8 d4 34 00 00       	call   c000a564 <appendToDoubleLinkList>
c0007090:	83 c4 10             	add    $0x10,%esp
c0007093:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007097:	8b 45 bc             	mov    -0x44(%ebp),%eax
c000709a:	8d 50 ff             	lea    -0x1(%eax),%edx
c000709d:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00070a0:	39 c2                	cmp    %eax,%edx
c00070a2:	77 b8                	ja     c000705c <sys_malloc+0x17e>
c00070a4:	8b 55 e8             	mov    -0x18(%ebp),%edx
c00070a7:	89 d0                	mov    %edx,%eax
c00070a9:	01 c0                	add    %eax,%eax
c00070ab:	01 d0                	add    %edx,%eax
c00070ad:	c1 e0 03             	shl    $0x3,%eax
c00070b0:	89 c2                	mov    %eax,%edx
c00070b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00070b5:	01 d0                	add    %edx,%eax
c00070b7:	83 c0 08             	add    $0x8,%eax
c00070ba:	83 ec 0c             	sub    $0xc,%esp
c00070bd:	50                   	push   %eax
c00070be:	e8 27 35 00 00       	call   c000a5ea <popFromDoubleLinkList>
c00070c3:	83 c4 10             	add    $0x10,%esp
c00070c6:	89 45 b4             	mov    %eax,-0x4c(%ebp)
c00070c9:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00070cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00070cf:	8b 45 b4             	mov    -0x4c(%ebp),%eax
c00070d2:	83 ec 0c             	sub    $0xc,%esp
c00070d5:	50                   	push   %eax
c00070d6:	e8 ed fd ff ff       	call   c0006ec8 <block2arena>
c00070db:	83 c4 10             	add    $0x10,%esp
c00070de:	89 45 b0             	mov    %eax,-0x50(%ebp)
c00070e1:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00070e4:	8b 40 04             	mov    0x4(%eax),%eax
c00070e7:	8d 50 ff             	lea    -0x1(%eax),%edx
c00070ea:	8b 45 b0             	mov    -0x50(%ebp),%eax
c00070ed:	89 50 04             	mov    %edx,0x4(%eax)
c00070f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00070f3:	c9                   	leave  
c00070f4:	c3                   	ret    

c00070f5 <remove_map_entry>:
c00070f5:	55                   	push   %ebp
c00070f6:	89 e5                	mov    %esp,%ebp
c00070f8:	83 ec 10             	sub    $0x10,%esp
c00070fb:	ff 75 08             	pushl  0x8(%ebp)
c00070fe:	e8 e5 fb ff ff       	call   c0006ce8 <ptr_pte>
c0007103:	83 c4 04             	add    $0x4,%esp
c0007106:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0007109:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000710c:	8b 10                	mov    (%eax),%edx
c000710e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007111:	89 10                	mov    %edx,(%eax)
c0007113:	90                   	nop
c0007114:	c9                   	leave  
c0007115:	c3                   	ret    

c0007116 <free_a_page>:
c0007116:	55                   	push   %ebp
c0007117:	89 e5                	mov    %esp,%ebp
c0007119:	83 ec 20             	sub    $0x20,%esp
c000711c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0007120:	75 21                	jne    c0007143 <free_a_page+0x2d>
c0007122:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0007127:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000712a:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c000712f:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007132:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0007137:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000713a:	c7 45 fc 8c 16 01 c0 	movl   $0xc001168c,-0x4(%ebp)
c0007141:	eb 1f                	jmp    c0007162 <free_a_page+0x4c>
c0007143:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0007148:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000714b:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0007150:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007153:	a1 3c f7 00 c0       	mov    0xc000f73c,%eax
c0007158:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000715b:	c7 45 fc c4 1e 01 c0 	movl   $0xc0011ec4,-0x4(%ebp)
c0007162:	8b 45 08             	mov    0x8(%ebp),%eax
c0007165:	c1 e8 0c             	shr    $0xc,%eax
c0007168:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000716b:	6a 00                	push   $0x0
c000716d:	ff 75 f8             	pushl  -0x8(%ebp)
c0007170:	8d 45 e4             	lea    -0x1c(%ebp),%eax
c0007173:	50                   	push   %eax
c0007174:	e8 4d f8 ff ff       	call   c00069c6 <set_bit_val>
c0007179:	83 c4 0c             	add    $0xc,%esp
c000717c:	ff 75 08             	pushl  0x8(%ebp)
c000717f:	e8 86 fc ff ff       	call   c0006e0a <get_physical_address>
c0007184:	83 c4 04             	add    $0x4,%esp
c0007187:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000718a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000718d:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007193:	85 c0                	test   %eax,%eax
c0007195:	0f 48 c2             	cmovs  %edx,%eax
c0007198:	c1 f8 0c             	sar    $0xc,%eax
c000719b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000719e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00071a1:	6a 00                	push   $0x0
c00071a3:	ff 75 f0             	pushl  -0x10(%ebp)
c00071a6:	50                   	push   %eax
c00071a7:	e8 1a f8 ff ff       	call   c00069c6 <set_bit_val>
c00071ac:	83 c4 0c             	add    $0xc,%esp
c00071af:	ff 75 08             	pushl  0x8(%ebp)
c00071b2:	e8 3e ff ff ff       	call   c00070f5 <remove_map_entry>
c00071b7:	83 c4 04             	add    $0x4,%esp
c00071ba:	90                   	nop
c00071bb:	c9                   	leave  
c00071bc:	c3                   	ret    

c00071bd <sys_free>:
c00071bd:	55                   	push   %ebp
c00071be:	89 e5                	mov    %esp,%ebp
c00071c0:	83 ec 48             	sub    $0x48,%esp
c00071c3:	e8 ce a6 ff ff       	call   c0001896 <get_running_thread_pcb>
c00071c8:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00071cb:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00071ce:	8b 40 04             	mov    0x4(%eax),%eax
c00071d1:	85 c0                	test   %eax,%eax
c00071d3:	75 09                	jne    c00071de <sys_free+0x21>
c00071d5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00071dc:	eb 07                	jmp    c00071e5 <sys_free+0x28>
c00071de:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00071e5:	81 7d 0c 00 04 00 00 	cmpl   $0x400,0xc(%ebp)
c00071ec:	76 4d                	jbe    c000723b <sys_free+0x7e>
c00071ee:	8b 45 08             	mov    0x8(%ebp),%eax
c00071f1:	83 e8 0c             	sub    $0xc,%eax
c00071f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00071f7:	83 45 0c 0c          	addl   $0xc,0xc(%ebp)
c00071fb:	8b 45 0c             	mov    0xc(%ebp),%eax
c00071fe:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007203:	c1 e8 0c             	shr    $0xc,%eax
c0007206:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007209:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0007210:	eb 1c                	jmp    c000722e <sys_free+0x71>
c0007212:	83 ec 08             	sub    $0x8,%esp
c0007215:	ff 75 f4             	pushl  -0xc(%ebp)
c0007218:	ff 75 f0             	pushl  -0x10(%ebp)
c000721b:	e8 f6 fe ff ff       	call   c0007116 <free_a_page>
c0007220:	83 c4 10             	add    $0x10,%esp
c0007223:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
c000722a:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000722e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007231:	39 45 d8             	cmp    %eax,-0x28(%ebp)
c0007234:	77 dc                	ja     c0007212 <sys_free+0x55>
c0007236:	e9 ef 00 00 00       	jmp    c000732a <sys_free+0x16d>
c000723b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c0007242:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007249:	eb 24                	jmp    c000726f <sys_free+0xb2>
c000724b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c000724e:	89 d0                	mov    %edx,%eax
c0007250:	01 c0                	add    %eax,%eax
c0007252:	01 d0                	add    %edx,%eax
c0007254:	c1 e0 03             	shl    $0x3,%eax
c0007257:	05 00 32 08 c0       	add    $0xc0083200,%eax
c000725c:	8b 00                	mov    (%eax),%eax
c000725e:	39 45 0c             	cmp    %eax,0xc(%ebp)
c0007261:	77 08                	ja     c000726b <sys_free+0xae>
c0007263:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007266:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007269:	eb 0a                	jmp    c0007275 <sys_free+0xb8>
c000726b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c000726f:	83 7d e4 09          	cmpl   $0x9,-0x1c(%ebp)
c0007273:	7e d6                	jle    c000724b <sys_free+0x8e>
c0007275:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0007278:	89 d0                	mov    %edx,%eax
c000727a:	01 c0                	add    %eax,%eax
c000727c:	01 d0                	add    %edx,%eax
c000727e:	c1 e0 03             	shl    $0x3,%eax
c0007281:	05 00 32 08 c0       	add    $0xc0083200,%eax
c0007286:	8b 10                	mov    (%eax),%edx
c0007288:	89 55 b8             	mov    %edx,-0x48(%ebp)
c000728b:	8b 50 04             	mov    0x4(%eax),%edx
c000728e:	89 55 bc             	mov    %edx,-0x44(%ebp)
c0007291:	8b 50 08             	mov    0x8(%eax),%edx
c0007294:	89 55 c0             	mov    %edx,-0x40(%ebp)
c0007297:	8b 50 0c             	mov    0xc(%eax),%edx
c000729a:	89 55 c4             	mov    %edx,-0x3c(%ebp)
c000729d:	8b 50 10             	mov    0x10(%eax),%edx
c00072a0:	89 55 c8             	mov    %edx,-0x38(%ebp)
c00072a3:	8b 40 14             	mov    0x14(%eax),%eax
c00072a6:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00072a9:	8b 45 08             	mov    0x8(%ebp),%eax
c00072ac:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00072af:	83 ec 0c             	sub    $0xc,%esp
c00072b2:	ff 75 d4             	pushl  -0x2c(%ebp)
c00072b5:	e8 0e fc ff ff       	call   c0006ec8 <block2arena>
c00072ba:	83 c4 10             	add    $0x10,%esp
c00072bd:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00072c0:	83 ec 08             	sub    $0x8,%esp
c00072c3:	ff 75 d4             	pushl  -0x2c(%ebp)
c00072c6:	8d 45 b8             	lea    -0x48(%ebp),%eax
c00072c9:	83 c0 08             	add    $0x8,%eax
c00072cc:	50                   	push   %eax
c00072cd:	e8 92 32 00 00       	call   c000a564 <appendToDoubleLinkList>
c00072d2:	83 c4 10             	add    $0x10,%esp
c00072d5:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00072d8:	8b 40 04             	mov    0x4(%eax),%eax
c00072db:	8d 50 01             	lea    0x1(%eax),%edx
c00072de:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00072e1:	89 50 04             	mov    %edx,0x4(%eax)
c00072e4:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00072e7:	8b 50 04             	mov    0x4(%eax),%edx
c00072ea:	8b 45 bc             	mov    -0x44(%ebp),%eax
c00072ed:	39 c2                	cmp    %eax,%edx
c00072ef:	75 39                	jne    c000732a <sys_free+0x16d>
c00072f1:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00072f8:	eb 16                	jmp    c0007310 <sys_free+0x153>
c00072fa:	83 ec 0c             	sub    $0xc,%esp
c00072fd:	8d 45 b8             	lea    -0x48(%ebp),%eax
c0007300:	83 c0 08             	add    $0x8,%eax
c0007303:	50                   	push   %eax
c0007304:	e8 e1 32 00 00       	call   c000a5ea <popFromDoubleLinkList>
c0007309:	83 c4 10             	add    $0x10,%esp
c000730c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0007310:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007313:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c0007316:	7c e2                	jl     c00072fa <sys_free+0x13d>
c0007318:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000731b:	83 ec 08             	sub    $0x8,%esp
c000731e:	ff 75 f4             	pushl  -0xc(%ebp)
c0007321:	50                   	push   %eax
c0007322:	e8 ef fd ff ff       	call   c0007116 <free_a_page>
c0007327:	83 c4 10             	add    $0x10,%esp
c000732a:	90                   	nop
c000732b:	c9                   	leave  
c000732c:	c3                   	ret    

c000732d <init_memory_block_desc>:
c000732d:	55                   	push   %ebp
c000732e:	89 e5                	mov    %esp,%ebp
c0007330:	83 ec 18             	sub    $0x18,%esp
c0007333:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000733a:	e9 b2 00 00 00       	jmp    c00073f1 <init_memory_block_desc+0xc4>
c000733f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007343:	75 1b                	jne    c0007360 <init_memory_block_desc+0x33>
c0007345:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007348:	89 d0                	mov    %edx,%eax
c000734a:	01 c0                	add    %eax,%eax
c000734c:	01 d0                	add    %edx,%eax
c000734e:	c1 e0 03             	shl    $0x3,%eax
c0007351:	89 c2                	mov    %eax,%edx
c0007353:	8b 45 08             	mov    0x8(%ebp),%eax
c0007356:	01 d0                	add    %edx,%eax
c0007358:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
c000735e:	eb 2e                	jmp    c000738e <init_memory_block_desc+0x61>
c0007360:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007363:	89 d0                	mov    %edx,%eax
c0007365:	01 c0                	add    %eax,%eax
c0007367:	01 d0                	add    %edx,%eax
c0007369:	c1 e0 03             	shl    $0x3,%eax
c000736c:	8d 50 e8             	lea    -0x18(%eax),%edx
c000736f:	8b 45 08             	mov    0x8(%ebp),%eax
c0007372:	01 d0                	add    %edx,%eax
c0007374:	8b 08                	mov    (%eax),%ecx
c0007376:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007379:	89 d0                	mov    %edx,%eax
c000737b:	01 c0                	add    %eax,%eax
c000737d:	01 d0                	add    %edx,%eax
c000737f:	c1 e0 03             	shl    $0x3,%eax
c0007382:	89 c2                	mov    %eax,%edx
c0007384:	8b 45 08             	mov    0x8(%ebp),%eax
c0007387:	01 d0                	add    %edx,%eax
c0007389:	8d 14 09             	lea    (%ecx,%ecx,1),%edx
c000738c:	89 10                	mov    %edx,(%eax)
c000738e:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007391:	89 d0                	mov    %edx,%eax
c0007393:	01 c0                	add    %eax,%eax
c0007395:	01 d0                	add    %edx,%eax
c0007397:	c1 e0 03             	shl    $0x3,%eax
c000739a:	89 c2                	mov    %eax,%edx
c000739c:	8b 45 08             	mov    0x8(%ebp),%eax
c000739f:	01 d0                	add    %edx,%eax
c00073a1:	8b 00                	mov    (%eax),%eax
c00073a3:	89 c1                	mov    %eax,%ecx
c00073a5:	b8 f4 0f 00 00       	mov    $0xff4,%eax
c00073aa:	ba 00 00 00 00       	mov    $0x0,%edx
c00073af:	f7 f1                	div    %ecx
c00073b1:	89 c1                	mov    %eax,%ecx
c00073b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00073b6:	89 d0                	mov    %edx,%eax
c00073b8:	01 c0                	add    %eax,%eax
c00073ba:	01 d0                	add    %edx,%eax
c00073bc:	c1 e0 03             	shl    $0x3,%eax
c00073bf:	89 c2                	mov    %eax,%edx
c00073c1:	8b 45 08             	mov    0x8(%ebp),%eax
c00073c4:	01 d0                	add    %edx,%eax
c00073c6:	89 ca                	mov    %ecx,%edx
c00073c8:	89 50 04             	mov    %edx,0x4(%eax)
c00073cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
c00073ce:	89 d0                	mov    %edx,%eax
c00073d0:	01 c0                	add    %eax,%eax
c00073d2:	01 d0                	add    %edx,%eax
c00073d4:	c1 e0 03             	shl    $0x3,%eax
c00073d7:	89 c2                	mov    %eax,%edx
c00073d9:	8b 45 08             	mov    0x8(%ebp),%eax
c00073dc:	01 d0                	add    %edx,%eax
c00073de:	83 c0 08             	add    $0x8,%eax
c00073e1:	83 ec 0c             	sub    $0xc,%esp
c00073e4:	50                   	push   %eax
c00073e5:	e8 2b 31 00 00       	call   c000a515 <initDoubleLinkList>
c00073ea:	83 c4 10             	add    $0x10,%esp
c00073ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00073f1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c00073f5:	0f 8e 44 ff ff ff    	jle    c000733f <init_memory_block_desc+0x12>
c00073fb:	90                   	nop
c00073fc:	c9                   	leave  
c00073fd:	c3                   	ret    

c00073fe <init_memory2>:
c00073fe:	55                   	push   %ebp
c00073ff:	89 e5                	mov    %esp,%ebp
c0007401:	83 ec 38             	sub    $0x38,%esp
c0007404:	c7 45 f4 00 00 00 02 	movl   $0x2000000,-0xc(%ebp)
c000740b:	c7 45 f0 00 20 10 00 	movl   $0x102000,-0x10(%ebp)
c0007412:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007415:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c000741a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000741d:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0007422:	29 c2                	sub    %eax,%edx
c0007424:	89 d0                	mov    %edx,%eax
c0007426:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007429:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000742c:	89 c2                	mov    %eax,%edx
c000742e:	c1 ea 1f             	shr    $0x1f,%edx
c0007431:	01 d0                	add    %edx,%eax
c0007433:	d1 f8                	sar    %eax
c0007435:	a3 98 16 01 c0       	mov    %eax,0xc0011698
c000743a:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c000743f:	83 ec 0c             	sub    $0xc,%esp
c0007442:	50                   	push   %eax
c0007443:	e8 0f 06 00 00       	call   c0007a57 <disp_int>
c0007448:	83 c4 10             	add    $0x10,%esp
c000744b:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0007450:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007453:	29 c2                	sub    %eax,%edx
c0007455:	89 d0                	mov    %edx,%eax
c0007457:	a3 d0 1e 01 c0       	mov    %eax,0xc0011ed0
c000745c:	83 ec 0c             	sub    $0xc,%esp
c000745f:	68 b6 ac 00 c0       	push   $0xc000acb6
c0007464:	e8 23 a1 ff ff       	call   c000158c <disp_str>
c0007469:	83 c4 10             	add    $0x10,%esp
c000746c:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0007471:	83 ec 0c             	sub    $0xc,%esp
c0007474:	50                   	push   %eax
c0007475:	e8 dd 05 00 00       	call   c0007a57 <disp_int>
c000747a:	83 c4 10             	add    $0x10,%esp
c000747d:	83 ec 0c             	sub    $0xc,%esp
c0007480:	68 b6 ac 00 c0       	push   $0xc000acb6
c0007485:	e8 02 a1 ff ff       	call   c000158c <disp_str>
c000748a:	83 c4 10             	add    $0x10,%esp
c000748d:	a1 98 16 01 c0       	mov    0xc0011698,%eax
c0007492:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007497:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000749d:	85 c0                	test   %eax,%eax
c000749f:	0f 48 c2             	cmovs  %edx,%eax
c00074a2:	c1 f8 0c             	sar    $0xc,%eax
c00074a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00074a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00074ab:	83 c0 07             	add    $0x7,%eax
c00074ae:	8d 50 07             	lea    0x7(%eax),%edx
c00074b1:	85 c0                	test   %eax,%eax
c00074b3:	0f 48 c2             	cmovs  %edx,%eax
c00074b6:	c1 f8 03             	sar    $0x3,%eax
c00074b9:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c00074be:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00074c3:	2d 00 00 00 40       	sub    $0x40000000,%eax
c00074c8:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c00074cd:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00074d3:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c00074d8:	83 ec 04             	sub    $0x4,%esp
c00074db:	52                   	push   %edx
c00074dc:	6a 00                	push   $0x0
c00074de:	50                   	push   %eax
c00074df:	e8 0e 3f 00 00       	call   c000b3f2 <Memset>
c00074e4:	83 c4 10             	add    $0x10,%esp
c00074e7:	a1 90 16 01 c0       	mov    0xc0011690,%eax
c00074ec:	05 ff 0f 00 00       	add    $0xfff,%eax
c00074f1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00074f7:	85 c0                	test   %eax,%eax
c00074f9:	0f 48 c2             	cmovs  %edx,%eax
c00074fc:	c1 f8 0c             	sar    $0xc,%eax
c00074ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007502:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007505:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0007508:	ff 75 e8             	pushl  -0x18(%ebp)
c000750b:	6a 01                	push   $0x1
c000750d:	6a 00                	push   $0x0
c000750f:	68 8c 16 01 c0       	push   $0xc001168c
c0007514:	e8 28 f5 ff ff       	call   c0006a41 <set_bits>
c0007519:	83 c4 10             	add    $0x10,%esp
c000751c:	a1 d0 1e 01 c0       	mov    0xc0011ed0,%eax
c0007521:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007526:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c000752c:	85 c0                	test   %eax,%eax
c000752e:	0f 48 c2             	cmovs  %edx,%eax
c0007531:	c1 f8 0c             	sar    $0xc,%eax
c0007534:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007537:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000753a:	83 c0 07             	add    $0x7,%eax
c000753d:	8d 50 07             	lea    0x7(%eax),%edx
c0007540:	85 c0                	test   %eax,%eax
c0007542:	0f 48 c2             	cmovs  %edx,%eax
c0007545:	c1 f8 03             	sar    $0x3,%eax
c0007548:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c000754d:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c0007552:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c0007558:	01 d0                	add    %edx,%eax
c000755a:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c000755f:	8b 15 c8 1e 01 c0    	mov    0xc0011ec8,%edx
c0007565:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c000756a:	83 ec 04             	sub    $0x4,%esp
c000756d:	52                   	push   %edx
c000756e:	6a 00                	push   $0x0
c0007570:	50                   	push   %eax
c0007571:	e8 7c 3e 00 00       	call   c000b3f2 <Memset>
c0007576:	83 c4 10             	add    $0x10,%esp
c0007579:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c000757e:	05 ff 0f 00 00       	add    $0xfff,%eax
c0007583:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007589:	85 c0                	test   %eax,%eax
c000758b:	0f 48 c2             	cmovs  %edx,%eax
c000758e:	c1 f8 0c             	sar    $0xc,%eax
c0007591:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0007594:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0007597:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000759a:	ff 75 e8             	pushl  -0x18(%ebp)
c000759d:	6a 01                	push   $0x1
c000759f:	ff 75 e0             	pushl  -0x20(%ebp)
c00075a2:	68 8c 16 01 c0       	push   $0xc001168c
c00075a7:	e8 95 f4 ff ff       	call   c0006a41 <set_bits>
c00075ac:	83 c4 10             	add    $0x10,%esp
c00075af:	c7 45 dc 00 00 10 00 	movl   $0x100000,-0x24(%ebp)
c00075b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00075b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00075bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00075bf:	83 c0 07             	add    $0x7,%eax
c00075c2:	8d 50 07             	lea    0x7(%eax),%edx
c00075c5:	85 c0                	test   %eax,%eax
c00075c7:	0f 48 c2             	cmovs  %edx,%eax
c00075ca:	c1 f8 03             	sar    $0x3,%eax
c00075cd:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c00075d2:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00075d7:	8b 15 90 16 01 c0    	mov    0xc0011690,%edx
c00075dd:	01 c2                	add    %eax,%edx
c00075df:	a1 c8 1e 01 c0       	mov    0xc0011ec8,%eax
c00075e4:	01 d0                	add    %edx,%eax
c00075e6:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c00075eb:	8b 15 38 f7 00 c0    	mov    0xc000f738,%edx
c00075f1:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c00075f6:	83 ec 04             	sub    $0x4,%esp
c00075f9:	52                   	push   %edx
c00075fa:	6a 00                	push   $0x0
c00075fc:	50                   	push   %eax
c00075fd:	e8 f0 3d 00 00       	call   c000b3f2 <Memset>
c0007602:	83 c4 10             	add    $0x10,%esp
c0007605:	8b 55 e4             	mov    -0x1c(%ebp),%edx
c0007608:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000760b:	01 d0                	add    %edx,%eax
c000760d:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0007610:	a1 38 f7 00 c0       	mov    0xc000f738,%eax
c0007615:	05 ff 0f 00 00       	add    $0xfff,%eax
c000761a:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0007620:	85 c0                	test   %eax,%eax
c0007622:	0f 48 c2             	cmovs  %edx,%eax
c0007625:	c1 f8 0c             	sar    $0xc,%eax
c0007628:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000762b:	ff 75 e8             	pushl  -0x18(%ebp)
c000762e:	6a 01                	push   $0x1
c0007630:	ff 75 e0             	pushl  -0x20(%ebp)
c0007633:	68 8c 16 01 c0       	push   $0xc001168c
c0007638:	e8 04 f4 ff ff       	call   c0006a41 <set_bits>
c000763d:	83 c4 10             	add    $0x10,%esp
c0007640:	8b 55 e0             	mov    -0x20(%ebp),%edx
c0007643:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007646:	01 d0                	add    %edx,%eax
c0007648:	c1 e0 0c             	shl    $0xc,%eax
c000764b:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c0007650:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007653:	83 c0 02             	add    $0x2,%eax
c0007656:	c1 e0 0c             	shl    $0xc,%eax
c0007659:	89 c2                	mov    %eax,%edx
c000765b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000765e:	01 d0                	add    %edx,%eax
c0007660:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c0007665:	c7 45 d8 05 00 00 00 	movl   $0x5,-0x28(%ebp)
c000766c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000766f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0007672:	90                   	nop
c0007673:	c9                   	leave  
c0007674:	c3                   	ret    

c0007675 <init_memory>:
c0007675:	55                   	push   %ebp
c0007676:	89 e5                	mov    %esp,%ebp
c0007678:	83 ec 38             	sub    $0x38,%esp
c000767b:	c7 45 f4 00 a0 09 c0 	movl   $0xc009a000,-0xc(%ebp)
c0007682:	c7 45 f0 00 00 10 c0 	movl   $0xc0100000,-0x10(%ebp)
c0007689:	c7 45 ec 00 00 10 00 	movl   $0x100000,-0x14(%ebp)
c0007690:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007693:	05 00 00 10 00       	add    $0x100000,%eax
c0007698:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000769b:	8b 45 08             	mov    0x8(%ebp),%eax
c000769e:	2b 45 e8             	sub    -0x18(%ebp),%eax
c00076a1:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c00076a7:	85 c0                	test   %eax,%eax
c00076a9:	0f 48 c2             	cmovs  %edx,%eax
c00076ac:	c1 f8 0c             	sar    $0xc,%eax
c00076af:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00076b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00076b5:	89 c2                	mov    %eax,%edx
c00076b7:	c1 ea 1f             	shr    $0x1f,%edx
c00076ba:	01 d0                	add    %edx,%eax
c00076bc:	d1 f8                	sar    %eax
c00076be:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00076c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00076c4:	2b 45 e0             	sub    -0x20(%ebp),%eax
c00076c7:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00076ca:	8b 45 e0             	mov    -0x20(%ebp),%eax
c00076cd:	8d 50 07             	lea    0x7(%eax),%edx
c00076d0:	85 c0                	test   %eax,%eax
c00076d2:	0f 48 c2             	cmovs  %edx,%eax
c00076d5:	c1 f8 03             	sar    $0x3,%eax
c00076d8:	89 45 d8             	mov    %eax,-0x28(%ebp)
c00076db:	8b 45 dc             	mov    -0x24(%ebp),%eax
c00076de:	8d 50 07             	lea    0x7(%eax),%edx
c00076e1:	85 c0                	test   %eax,%eax
c00076e3:	0f 48 c2             	cmovs  %edx,%eax
c00076e6:	c1 f8 03             	sar    $0x3,%eax
c00076e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00076ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00076ef:	a3 94 16 01 c0       	mov    %eax,0xc0011694
c00076f4:	a1 94 16 01 c0       	mov    0xc0011694,%eax
c00076f9:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00076fc:	c1 e2 0c             	shl    $0xc,%edx
c00076ff:	01 d0                	add    %edx,%eax
c0007701:	a3 cc 1e 01 c0       	mov    %eax,0xc0011ecc
c0007706:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007709:	a3 8c 16 01 c0       	mov    %eax,0xc001168c
c000770e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007711:	a3 90 16 01 c0       	mov    %eax,0xc0011690
c0007716:	a1 8c 16 01 c0       	mov    0xc001168c,%eax
c000771b:	83 ec 04             	sub    $0x4,%esp
c000771e:	ff 75 d8             	pushl  -0x28(%ebp)
c0007721:	6a 00                	push   $0x0
c0007723:	50                   	push   %eax
c0007724:	e8 c9 3c 00 00       	call   c000b3f2 <Memset>
c0007729:	83 c4 10             	add    $0x10,%esp
c000772c:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000772f:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007732:	01 d0                	add    %edx,%eax
c0007734:	a3 c4 1e 01 c0       	mov    %eax,0xc0011ec4
c0007739:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000773c:	a3 c8 1e 01 c0       	mov    %eax,0xc0011ec8
c0007741:	a1 c4 1e 01 c0       	mov    0xc0011ec4,%eax
c0007746:	83 ec 04             	sub    $0x4,%esp
c0007749:	ff 75 d4             	pushl  -0x2c(%ebp)
c000774c:	6a 00                	push   $0x0
c000774e:	50                   	push   %eax
c000774f:	e8 9e 3c 00 00       	call   c000b3f2 <Memset>
c0007754:	83 c4 10             	add    $0x10,%esp
c0007757:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000775a:	a3 38 f7 00 c0       	mov    %eax,0xc000f738
c000775f:	8b 55 f4             	mov    -0xc(%ebp),%edx
c0007762:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007765:	01 c2                	add    %eax,%edx
c0007767:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000776a:	01 d0                	add    %edx,%eax
c000776c:	a3 34 f7 00 c0       	mov    %eax,0xc000f734
c0007771:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007774:	05 00 00 10 00       	add    $0x100000,%eax
c0007779:	a3 3c f7 00 c0       	mov    %eax,0xc000f73c
c000777e:	a1 34 f7 00 c0       	mov    0xc000f734,%eax
c0007783:	83 ec 04             	sub    $0x4,%esp
c0007786:	ff 75 d8             	pushl  -0x28(%ebp)
c0007789:	6a 00                	push   $0x0
c000778b:	50                   	push   %eax
c000778c:	e8 61 3c 00 00       	call   c000b3f2 <Memset>
c0007791:	83 c4 10             	add    $0x10,%esp
c0007794:	83 ec 0c             	sub    $0xc,%esp
c0007797:	68 00 32 08 c0       	push   $0xc0083200
c000779c:	e8 8c fb ff ff       	call   c000732d <init_memory_block_desc>
c00077a1:	83 c4 10             	add    $0x10,%esp
c00077a4:	90                   	nop
c00077a5:	c9                   	leave  
c00077a6:	c3                   	ret    

c00077a7 <untar>:
c00077a7:	55                   	push   %ebp
c00077a8:	89 e5                	mov    %esp,%ebp
c00077aa:	81 ec 48 20 00 00    	sub    $0x2048,%esp
c00077b0:	83 ec 08             	sub    $0x8,%esp
c00077b3:	6a 00                	push   $0x0
c00077b5:	ff 75 08             	pushl  0x8(%ebp)
c00077b8:	e8 0a e5 ff ff       	call   c0005cc7 <open>
c00077bd:	83 c4 10             	add    $0x10,%esp
c00077c0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00077c3:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c00077ca:	c7 45 dc 00 20 00 00 	movl   $0x2000,-0x24(%ebp)
c00077d1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00077d8:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c00077df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c00077e3:	7e 58                	jle    c000783d <untar+0x96>
c00077e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00077e8:	05 ff 01 00 00       	add    $0x1ff,%eax
c00077ed:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
c00077f3:	85 c0                	test   %eax,%eax
c00077f5:	0f 48 c2             	cmovs  %edx,%eax
c00077f8:	c1 f8 09             	sar    $0x9,%eax
c00077fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00077fe:	83 ec 04             	sub    $0x4,%esp
c0007801:	68 00 20 00 00       	push   $0x2000
c0007806:	6a 00                	push   $0x0
c0007808:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000780e:	50                   	push   %eax
c000780f:	e8 de 3b 00 00       	call   c000b3f2 <Memset>
c0007814:	83 c4 10             	add    $0x10,%esp
c0007817:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c000781a:	c1 e0 09             	shl    $0x9,%eax
c000781d:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0007820:	83 ec 04             	sub    $0x4,%esp
c0007823:	50                   	push   %eax
c0007824:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000782a:	50                   	push   %eax
c000782b:	ff 75 e4             	pushl  -0x1c(%ebp)
c000782e:	e8 19 e5 ff ff       	call   c0005d4c <read>
c0007833:	83 c4 10             	add    $0x10,%esp
c0007836:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000783d:	83 ec 04             	sub    $0x4,%esp
c0007840:	68 00 20 00 00       	push   $0x2000
c0007845:	6a 00                	push   $0x0
c0007847:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c000784d:	50                   	push   %eax
c000784e:	e8 9f 3b 00 00       	call   c000b3f2 <Memset>
c0007853:	83 c4 10             	add    $0x10,%esp
c0007856:	83 ec 04             	sub    $0x4,%esp
c0007859:	68 00 02 00 00       	push   $0x200
c000785e:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007864:	50                   	push   %eax
c0007865:	ff 75 e4             	pushl  -0x1c(%ebp)
c0007868:	e8 df e4 ff ff       	call   c0005d4c <read>
c000786d:	83 c4 10             	add    $0x10,%esp
c0007870:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007873:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
c0007877:	0f 84 1f 01 00 00    	je     c000799c <untar+0x1f5>
c000787d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007880:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007883:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
c000788a:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007890:	89 45 d0             	mov    %eax,-0x30(%ebp)
c0007893:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0007896:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0007899:	83 ec 08             	sub    $0x8,%esp
c000789c:	6a 07                	push   $0x7
c000789e:	ff 75 cc             	pushl  -0x34(%ebp)
c00078a1:	e8 21 e4 ff ff       	call   c0005cc7 <open>
c00078a6:	83 c4 10             	add    $0x10,%esp
c00078a9:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00078ac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00078b3:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00078b6:	83 c0 7c             	add    $0x7c,%eax
c00078b9:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c00078bc:	83 ec 0c             	sub    $0xc,%esp
c00078bf:	ff 75 cc             	pushl  -0x34(%ebp)
c00078c2:	e8 64 3b 00 00       	call   c000b42b <Strlen>
c00078c7:	83 c4 10             	add    $0x10,%esp
c00078ca:	85 c0                	test   %eax,%eax
c00078cc:	75 16                	jne    c00078e4 <untar+0x13d>
c00078ce:	83 ec 0c             	sub    $0xc,%esp
c00078d1:	ff 75 c4             	pushl  -0x3c(%ebp)
c00078d4:	e8 52 3b 00 00       	call   c000b42b <Strlen>
c00078d9:	83 c4 10             	add    $0x10,%esp
c00078dc:	85 c0                	test   %eax,%eax
c00078de:	0f 84 bb 00 00 00    	je     c000799f <untar+0x1f8>
c00078e4:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c00078e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00078ea:	eb 1f                	jmp    c000790b <untar+0x164>
c00078ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00078ef:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
c00078f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00078f9:	0f b6 00             	movzbl (%eax),%eax
c00078fc:	0f be c0             	movsbl %al,%eax
c00078ff:	83 e8 30             	sub    $0x30,%eax
c0007902:	01 d0                	add    %edx,%eax
c0007904:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007907:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000790b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000790e:	0f b6 00             	movzbl (%eax),%eax
c0007911:	84 c0                	test   %al,%al
c0007913:	75 d7                	jne    c00078ec <untar+0x145>
c0007915:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007918:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000791b:	c7 45 c0 00 02 00 00 	movl   $0x200,-0x40(%ebp)
c0007922:	eb 5f                	jmp    c0007983 <untar+0x1dc>
c0007924:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0007927:	39 45 c0             	cmp    %eax,-0x40(%ebp)
c000792a:	0f 4e 45 c0          	cmovle -0x40(%ebp),%eax
c000792e:	89 45 bc             	mov    %eax,-0x44(%ebp)
c0007931:	83 ec 04             	sub    $0x4,%esp
c0007934:	68 00 02 00 00       	push   $0x200
c0007939:	6a 00                	push   $0x0
c000793b:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007941:	50                   	push   %eax
c0007942:	e8 ab 3a 00 00       	call   c000b3f2 <Memset>
c0007947:	83 c4 10             	add    $0x10,%esp
c000794a:	83 ec 04             	sub    $0x4,%esp
c000794d:	ff 75 bc             	pushl  -0x44(%ebp)
c0007950:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007956:	50                   	push   %eax
c0007957:	ff 75 e4             	pushl  -0x1c(%ebp)
c000795a:	e8 ed e3 ff ff       	call   c0005d4c <read>
c000795f:	83 c4 10             	add    $0x10,%esp
c0007962:	01 45 f4             	add    %eax,-0xc(%ebp)
c0007965:	83 ec 04             	sub    $0x4,%esp
c0007968:	ff 75 bc             	pushl  -0x44(%ebp)
c000796b:	8d 85 bc df ff ff    	lea    -0x2044(%ebp),%eax
c0007971:	50                   	push   %eax
c0007972:	ff 75 c8             	pushl  -0x38(%ebp)
c0007975:	e8 46 e4 ff ff       	call   c0005dc0 <write>
c000797a:	83 c4 10             	add    $0x10,%esp
c000797d:	8b 45 bc             	mov    -0x44(%ebp),%eax
c0007980:	29 45 e8             	sub    %eax,-0x18(%ebp)
c0007983:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c0007987:	75 9b                	jne    c0007924 <untar+0x17d>
c0007989:	83 ec 0c             	sub    $0xc,%esp
c000798c:	ff 75 c8             	pushl  -0x38(%ebp)
c000798f:	e8 b1 e4 ff ff       	call   c0005e45 <close>
c0007994:	83 c4 10             	add    $0x10,%esp
c0007997:	e9 43 fe ff ff       	jmp    c00077df <untar+0x38>
c000799c:	90                   	nop
c000799d:	eb 01                	jmp    c00079a0 <untar+0x1f9>
c000799f:	90                   	nop
c00079a0:	83 ec 0c             	sub    $0xc,%esp
c00079a3:	ff 75 e4             	pushl  -0x1c(%ebp)
c00079a6:	e8 9a e4 ff ff       	call   c0005e45 <close>
c00079ab:	83 c4 10             	add    $0x10,%esp
c00079ae:	90                   	nop
c00079af:	c9                   	leave  
c00079b0:	c3                   	ret    

c00079b1 <atoi>:
c00079b1:	55                   	push   %ebp
c00079b2:	89 e5                	mov    %esp,%ebp
c00079b4:	83 ec 10             	sub    $0x10,%esp
c00079b7:	8b 45 08             	mov    0x8(%ebp),%eax
c00079ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
c00079bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00079c0:	8d 50 01             	lea    0x1(%eax),%edx
c00079c3:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00079c6:	c6 00 30             	movb   $0x30,(%eax)
c00079c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00079cc:	8d 50 01             	lea    0x1(%eax),%edx
c00079cf:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00079d2:	c6 00 78             	movb   $0x78,(%eax)
c00079d5:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
c00079d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c00079dd:	75 0e                	jne    c00079ed <atoi+0x3c>
c00079df:	8b 45 fc             	mov    -0x4(%ebp),%eax
c00079e2:	8d 50 01             	lea    0x1(%eax),%edx
c00079e5:	89 55 fc             	mov    %edx,-0x4(%ebp)
c00079e8:	c6 00 30             	movb   $0x30,(%eax)
c00079eb:	eb 61                	jmp    c0007a4e <atoi+0x9d>
c00079ed:	c7 45 f4 1c 00 00 00 	movl   $0x1c,-0xc(%ebp)
c00079f4:	eb 52                	jmp    c0007a48 <atoi+0x97>
c00079f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00079f9:	8b 55 0c             	mov    0xc(%ebp),%edx
c00079fc:	89 c1                	mov    %eax,%ecx
c00079fe:	d3 fa                	sar    %cl,%edx
c0007a00:	89 d0                	mov    %edx,%eax
c0007a02:	83 e0 0f             	and    $0xf,%eax
c0007a05:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a08:	80 7d fa 00          	cmpb   $0x0,-0x6(%ebp)
c0007a0c:	75 06                	jne    c0007a14 <atoi+0x63>
c0007a0e:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
c0007a12:	74 2f                	je     c0007a43 <atoi+0x92>
c0007a14:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)
c0007a18:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007a1c:	83 c0 30             	add    $0x30,%eax
c0007a1f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a22:	80 7d fb 39          	cmpb   $0x39,-0x5(%ebp)
c0007a26:	7e 0a                	jle    c0007a32 <atoi+0x81>
c0007a28:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
c0007a2c:	83 c0 07             	add    $0x7,%eax
c0007a2f:	88 45 fb             	mov    %al,-0x5(%ebp)
c0007a32:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a35:	8d 50 01             	lea    0x1(%eax),%edx
c0007a38:	89 55 fc             	mov    %edx,-0x4(%ebp)
c0007a3b:	0f b6 55 fb          	movzbl -0x5(%ebp),%edx
c0007a3f:	88 10                	mov    %dl,(%eax)
c0007a41:	eb 01                	jmp    c0007a44 <atoi+0x93>
c0007a43:	90                   	nop
c0007a44:	83 6d f4 04          	subl   $0x4,-0xc(%ebp)
c0007a48:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0007a4c:	79 a8                	jns    c00079f6 <atoi+0x45>
c0007a4e:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0007a51:	c6 00 00             	movb   $0x0,(%eax)
c0007a54:	90                   	nop
c0007a55:	c9                   	leave  
c0007a56:	c3                   	ret    

c0007a57 <disp_int>:
c0007a57:	55                   	push   %ebp
c0007a58:	89 e5                	mov    %esp,%ebp
c0007a5a:	83 ec 18             	sub    $0x18,%esp
c0007a5d:	ff 75 08             	pushl  0x8(%ebp)
c0007a60:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007a63:	50                   	push   %eax
c0007a64:	e8 48 ff ff ff       	call   c00079b1 <atoi>
c0007a69:	83 c4 08             	add    $0x8,%esp
c0007a6c:	83 ec 08             	sub    $0x8,%esp
c0007a6f:	6a 0b                	push   $0xb
c0007a71:	8d 45 ee             	lea    -0x12(%ebp),%eax
c0007a74:	50                   	push   %eax
c0007a75:	e8 4d 9b ff ff       	call   c00015c7 <disp_str_colour>
c0007a7a:	83 c4 10             	add    $0x10,%esp
c0007a7d:	90                   	nop
c0007a7e:	c9                   	leave  
c0007a7f:	c3                   	ret    

c0007a80 <do_page_fault>:
c0007a80:	55                   	push   %ebp
c0007a81:	89 e5                	mov    %esp,%ebp
c0007a83:	83 ec 28             	sub    $0x28,%esp
c0007a86:	0f 20 d0             	mov    %cr2,%eax
c0007a89:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0007a8c:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0007a93:	00 00 00 
c0007a96:	83 ec 0c             	sub    $0xc,%esp
c0007a99:	68 c0 ac 00 c0       	push   $0xc000acc0
c0007a9e:	e8 e9 9a ff ff       	call   c000158c <disp_str>
c0007aa3:	83 c4 10             	add    $0x10,%esp
c0007aa6:	83 ec 0c             	sub    $0xc,%esp
c0007aa9:	68 cf ac 00 c0       	push   $0xc000accf
c0007aae:	e8 d9 9a ff ff       	call   c000158c <disp_str>
c0007ab3:	83 c4 10             	add    $0x10,%esp
c0007ab6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0007ab9:	83 ec 0c             	sub    $0xc,%esp
c0007abc:	50                   	push   %eax
c0007abd:	e8 95 ff ff ff       	call   c0007a57 <disp_int>
c0007ac2:	83 c4 10             	add    $0x10,%esp
c0007ac5:	83 ec 0c             	sub    $0xc,%esp
c0007ac8:	68 d4 ac 00 c0       	push   $0xc000acd4
c0007acd:	e8 ba 9a ff ff       	call   c000158c <disp_str>
c0007ad2:	83 c4 10             	add    $0x10,%esp
c0007ad5:	83 ec 0c             	sub    $0xc,%esp
c0007ad8:	ff 75 f4             	pushl  -0xc(%ebp)
c0007adb:	e8 f5 f1 ff ff       	call   c0006cd5 <ptr_pde>
c0007ae0:	83 c4 10             	add    $0x10,%esp
c0007ae3:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0007ae6:	83 ec 0c             	sub    $0xc,%esp
c0007ae9:	ff 75 f4             	pushl  -0xc(%ebp)
c0007aec:	e8 f7 f1 ff ff       	call   c0006ce8 <ptr_pte>
c0007af1:	83 c4 10             	add    $0x10,%esp
c0007af4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0007af7:	83 ec 0c             	sub    $0xc,%esp
c0007afa:	68 d6 ac 00 c0       	push   $0xc000acd6
c0007aff:	e8 88 9a ff ff       	call   c000158c <disp_str>
c0007b04:	83 c4 10             	add    $0x10,%esp
c0007b07:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b0a:	83 ec 0c             	sub    $0xc,%esp
c0007b0d:	50                   	push   %eax
c0007b0e:	e8 44 ff ff ff       	call   c0007a57 <disp_int>
c0007b13:	83 c4 10             	add    $0x10,%esp
c0007b16:	83 ec 0c             	sub    $0xc,%esp
c0007b19:	68 db ac 00 c0       	push   $0xc000acdb
c0007b1e:	e8 69 9a ff ff       	call   c000158c <disp_str>
c0007b23:	83 c4 10             	add    $0x10,%esp
c0007b26:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0007b29:	8b 00                	mov    (%eax),%eax
c0007b2b:	83 ec 0c             	sub    $0xc,%esp
c0007b2e:	50                   	push   %eax
c0007b2f:	e8 23 ff ff ff       	call   c0007a57 <disp_int>
c0007b34:	83 c4 10             	add    $0x10,%esp
c0007b37:	83 ec 0c             	sub    $0xc,%esp
c0007b3a:	68 d4 ac 00 c0       	push   $0xc000acd4
c0007b3f:	e8 48 9a ff ff       	call   c000158c <disp_str>
c0007b44:	83 c4 10             	add    $0x10,%esp
c0007b47:	83 ec 0c             	sub    $0xc,%esp
c0007b4a:	68 e4 ac 00 c0       	push   $0xc000ace4
c0007b4f:	e8 38 9a ff ff       	call   c000158c <disp_str>
c0007b54:	83 c4 10             	add    $0x10,%esp
c0007b57:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007b5a:	83 ec 0c             	sub    $0xc,%esp
c0007b5d:	50                   	push   %eax
c0007b5e:	e8 f4 fe ff ff       	call   c0007a57 <disp_int>
c0007b63:	83 c4 10             	add    $0x10,%esp
c0007b66:	83 ec 0c             	sub    $0xc,%esp
c0007b69:	68 e9 ac 00 c0       	push   $0xc000ace9
c0007b6e:	e8 19 9a ff ff       	call   c000158c <disp_str>
c0007b73:	83 c4 10             	add    $0x10,%esp
c0007b76:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007b79:	8b 00                	mov    (%eax),%eax
c0007b7b:	83 ec 0c             	sub    $0xc,%esp
c0007b7e:	50                   	push   %eax
c0007b7f:	e8 d3 fe ff ff       	call   c0007a57 <disp_int>
c0007b84:	83 c4 10             	add    $0x10,%esp
c0007b87:	83 ec 0c             	sub    $0xc,%esp
c0007b8a:	68 d4 ac 00 c0       	push   $0xc000acd4
c0007b8f:	e8 f8 99 ff ff       	call   c000158c <disp_str>
c0007b94:	83 c4 10             	add    $0x10,%esp
c0007b97:	c7 45 e8 00 00 10 00 	movl   $0x100000,-0x18(%ebp)
c0007b9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0007ba1:	8b 00                	mov    (%eax),%eax
c0007ba3:	83 e0 01             	and    $0x1,%eax
c0007ba6:	85 c0                	test   %eax,%eax
c0007ba8:	74 09                	je     c0007bb3 <do_page_fault+0x133>
c0007baa:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
c0007bb1:	eb 07                	jmp    c0007bba <do_page_fault+0x13a>
c0007bb3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007bba:	90                   	nop
c0007bbb:	c9                   	leave  
c0007bbc:	c3                   	ret    

c0007bbd <exception_handler>:
c0007bbd:	55                   	push   %ebp
c0007bbe:	89 e5                	mov    %esp,%ebp
c0007bc0:	57                   	push   %edi
c0007bc1:	56                   	push   %esi
c0007bc2:	53                   	push   %ebx
c0007bc3:	83 ec 6c             	sub    $0x6c,%esp
c0007bc6:	8d 45 8c             	lea    -0x74(%ebp),%eax
c0007bc9:	bb 60 af 00 c0       	mov    $0xc000af60,%ebx
c0007bce:	ba 13 00 00 00       	mov    $0x13,%edx
c0007bd3:	89 c7                	mov    %eax,%edi
c0007bd5:	89 de                	mov    %ebx,%esi
c0007bd7:	89 d1                	mov    %edx,%ecx
c0007bd9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007bdb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007be2:	eb 04                	jmp    c0007be8 <exception_handler+0x2b>
c0007be4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007be8:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007bef:	7e f3                	jle    c0007be4 <exception_handler+0x27>
c0007bf1:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c0007bf8:	00 00 00 
c0007bfb:	83 ec 0c             	sub    $0xc,%esp
c0007bfe:	68 f2 ac 00 c0       	push   $0xc000acf2
c0007c03:	e8 84 99 ff ff       	call   c000158c <disp_str>
c0007c08:	83 c4 10             	add    $0x10,%esp
c0007c0b:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007c12:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c15:	8b 44 85 8c          	mov    -0x74(%ebp,%eax,4),%eax
c0007c19:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007c1c:	83 ec 0c             	sub    $0xc,%esp
c0007c1f:	ff 75 dc             	pushl  -0x24(%ebp)
c0007c22:	e8 65 99 ff ff       	call   c000158c <disp_str>
c0007c27:	83 c4 10             	add    $0x10,%esp
c0007c2a:	83 ec 0c             	sub    $0xc,%esp
c0007c2d:	68 00 ad 00 c0       	push   $0xc000ad00
c0007c32:	e8 55 99 ff ff       	call   c000158c <disp_str>
c0007c37:	83 c4 10             	add    $0x10,%esp
c0007c3a:	83 ec 0c             	sub    $0xc,%esp
c0007c3d:	68 03 ad 00 c0       	push   $0xc000ad03
c0007c42:	e8 45 99 ff ff       	call   c000158c <disp_str>
c0007c47:	83 c4 10             	add    $0x10,%esp
c0007c4a:	8b 45 08             	mov    0x8(%ebp),%eax
c0007c4d:	83 ec 0c             	sub    $0xc,%esp
c0007c50:	50                   	push   %eax
c0007c51:	e8 01 fe ff ff       	call   c0007a57 <disp_int>
c0007c56:	83 c4 10             	add    $0x10,%esp
c0007c59:	83 ec 0c             	sub    $0xc,%esp
c0007c5c:	68 00 ad 00 c0       	push   $0xc000ad00
c0007c61:	e8 26 99 ff ff       	call   c000158c <disp_str>
c0007c66:	83 c4 10             	add    $0x10,%esp
c0007c69:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007c6d:	74 2f                	je     c0007c9e <exception_handler+0xe1>
c0007c6f:	83 ec 0c             	sub    $0xc,%esp
c0007c72:	68 0b ad 00 c0       	push   $0xc000ad0b
c0007c77:	e8 10 99 ff ff       	call   c000158c <disp_str>
c0007c7c:	83 c4 10             	add    $0x10,%esp
c0007c7f:	8b 45 0c             	mov    0xc(%ebp),%eax
c0007c82:	83 ec 0c             	sub    $0xc,%esp
c0007c85:	50                   	push   %eax
c0007c86:	e8 cc fd ff ff       	call   c0007a57 <disp_int>
c0007c8b:	83 c4 10             	add    $0x10,%esp
c0007c8e:	83 ec 0c             	sub    $0xc,%esp
c0007c91:	68 00 ad 00 c0       	push   $0xc000ad00
c0007c96:	e8 f1 98 ff ff       	call   c000158c <disp_str>
c0007c9b:	83 c4 10             	add    $0x10,%esp
c0007c9e:	83 ec 0c             	sub    $0xc,%esp
c0007ca1:	68 15 ad 00 c0       	push   $0xc000ad15
c0007ca6:	e8 e1 98 ff ff       	call   c000158c <disp_str>
c0007cab:	83 c4 10             	add    $0x10,%esp
c0007cae:	83 ec 0c             	sub    $0xc,%esp
c0007cb1:	ff 75 14             	pushl  0x14(%ebp)
c0007cb4:	e8 9e fd ff ff       	call   c0007a57 <disp_int>
c0007cb9:	83 c4 10             	add    $0x10,%esp
c0007cbc:	83 ec 0c             	sub    $0xc,%esp
c0007cbf:	68 00 ad 00 c0       	push   $0xc000ad00
c0007cc4:	e8 c3 98 ff ff       	call   c000158c <disp_str>
c0007cc9:	83 c4 10             	add    $0x10,%esp
c0007ccc:	83 ec 0c             	sub    $0xc,%esp
c0007ccf:	68 19 ad 00 c0       	push   $0xc000ad19
c0007cd4:	e8 b3 98 ff ff       	call   c000158c <disp_str>
c0007cd9:	83 c4 10             	add    $0x10,%esp
c0007cdc:	8b 45 10             	mov    0x10(%ebp),%eax
c0007cdf:	83 ec 0c             	sub    $0xc,%esp
c0007ce2:	50                   	push   %eax
c0007ce3:	e8 6f fd ff ff       	call   c0007a57 <disp_int>
c0007ce8:	83 c4 10             	add    $0x10,%esp
c0007ceb:	83 ec 0c             	sub    $0xc,%esp
c0007cee:	68 00 ad 00 c0       	push   $0xc000ad00
c0007cf3:	e8 94 98 ff ff       	call   c000158c <disp_str>
c0007cf8:	83 c4 10             	add    $0x10,%esp
c0007cfb:	83 ec 0c             	sub    $0xc,%esp
c0007cfe:	68 1e ad 00 c0       	push   $0xc000ad1e
c0007d03:	e8 84 98 ff ff       	call   c000158c <disp_str>
c0007d08:	83 c4 10             	add    $0x10,%esp
c0007d0b:	83 ec 0c             	sub    $0xc,%esp
c0007d0e:	ff 75 18             	pushl  0x18(%ebp)
c0007d11:	e8 41 fd ff ff       	call   c0007a57 <disp_int>
c0007d16:	83 c4 10             	add    $0x10,%esp
c0007d19:	83 ec 0c             	sub    $0xc,%esp
c0007d1c:	68 00 ad 00 c0       	push   $0xc000ad00
c0007d21:	e8 66 98 ff ff       	call   c000158c <disp_str>
c0007d26:	83 c4 10             	add    $0x10,%esp
c0007d29:	83 ec 0c             	sub    $0xc,%esp
c0007d2c:	68 28 ad 00 c0       	push   $0xc000ad28
c0007d31:	e8 56 98 ff ff       	call   c000158c <disp_str>
c0007d36:	83 c4 10             	add    $0x10,%esp
c0007d39:	83 7d 08 0e          	cmpl   $0xe,0x8(%ebp)
c0007d3d:	75 46                	jne    c0007d85 <exception_handler+0x1c8>
c0007d3f:	0f 20 d0             	mov    %cr2,%eax
c0007d42:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0007d45:	83 ec 0c             	sub    $0xc,%esp
c0007d48:	68 47 ad 00 c0       	push   $0xc000ad47
c0007d4d:	e8 3a 98 ff ff       	call   c000158c <disp_str>
c0007d52:	83 c4 10             	add    $0x10,%esp
c0007d55:	83 ec 0c             	sub    $0xc,%esp
c0007d58:	68 cf ac 00 c0       	push   $0xc000accf
c0007d5d:	e8 2a 98 ff ff       	call   c000158c <disp_str>
c0007d62:	83 c4 10             	add    $0x10,%esp
c0007d65:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0007d68:	83 ec 0c             	sub    $0xc,%esp
c0007d6b:	50                   	push   %eax
c0007d6c:	e8 e6 fc ff ff       	call   c0007a57 <disp_int>
c0007d71:	83 c4 10             	add    $0x10,%esp
c0007d74:	83 ec 0c             	sub    $0xc,%esp
c0007d77:	68 d4 ac 00 c0       	push   $0xc000acd4
c0007d7c:	e8 0b 98 ff ff       	call   c000158c <disp_str>
c0007d81:	83 c4 10             	add    $0x10,%esp
c0007d84:	90                   	nop
c0007d85:	90                   	nop
c0007d86:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007d89:	5b                   	pop    %ebx
c0007d8a:	5e                   	pop    %esi
c0007d8b:	5f                   	pop    %edi
c0007d8c:	5d                   	pop    %ebp
c0007d8d:	c3                   	ret    

c0007d8e <exception_handler2>:
c0007d8e:	55                   	push   %ebp
c0007d8f:	89 e5                	mov    %esp,%ebp
c0007d91:	57                   	push   %edi
c0007d92:	56                   	push   %esi
c0007d93:	53                   	push   %ebx
c0007d94:	83 ec 6c             	sub    $0x6c,%esp
c0007d97:	8d 45 90             	lea    -0x70(%ebp),%eax
c0007d9a:	bb 60 af 00 c0       	mov    $0xc000af60,%ebx
c0007d9f:	ba 13 00 00 00       	mov    $0x13,%edx
c0007da4:	89 c7                	mov    %eax,%edi
c0007da6:	89 de                	mov    %ebx,%esi
c0007da8:	89 d1                	mov    %edx,%ecx
c0007daa:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0007dac:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007db3:	2e 00 00 
c0007db6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0007dbd:	eb 14                	jmp    c0007dd3 <exception_handler2+0x45>
c0007dbf:	83 ec 0c             	sub    $0xc,%esp
c0007dc2:	68 ac af 00 c0       	push   $0xc000afac
c0007dc7:	e8 c0 97 ff ff       	call   c000158c <disp_str>
c0007dcc:	83 c4 10             	add    $0x10,%esp
c0007dcf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0007dd3:	81 7d e4 9f 0f 00 00 	cmpl   $0xf9f,-0x1c(%ebp)
c0007dda:	7e e3                	jle    c0007dbf <exception_handler2+0x31>
c0007ddc:	c7 05 40 f7 00 c0 6a 	movl   $0x2e6a,0xc000f740
c0007de3:	2e 00 00 
c0007de6:	c7 45 e0 0a 00 00 00 	movl   $0xa,-0x20(%ebp)
c0007ded:	8b 45 08             	mov    0x8(%ebp),%eax
c0007df0:	8b 44 85 90          	mov    -0x70(%ebp,%eax,4),%eax
c0007df4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0007df7:	83 ec 08             	sub    $0x8,%esp
c0007dfa:	ff 75 e0             	pushl  -0x20(%ebp)
c0007dfd:	ff 75 dc             	pushl  -0x24(%ebp)
c0007e00:	e8 c2 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e05:	83 c4 10             	add    $0x10,%esp
c0007e08:	83 ec 0c             	sub    $0xc,%esp
c0007e0b:	68 00 ad 00 c0       	push   $0xc000ad00
c0007e10:	e8 77 97 ff ff       	call   c000158c <disp_str>
c0007e15:	83 c4 10             	add    $0x10,%esp
c0007e18:	83 ec 08             	sub    $0x8,%esp
c0007e1b:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e1e:	68 03 ad 00 c0       	push   $0xc000ad03
c0007e23:	e8 9f 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e28:	83 c4 10             	add    $0x10,%esp
c0007e2b:	83 ec 0c             	sub    $0xc,%esp
c0007e2e:	ff 75 08             	pushl  0x8(%ebp)
c0007e31:	e8 21 fc ff ff       	call   c0007a57 <disp_int>
c0007e36:	83 c4 10             	add    $0x10,%esp
c0007e39:	83 ec 0c             	sub    $0xc,%esp
c0007e3c:	68 00 ad 00 c0       	push   $0xc000ad00
c0007e41:	e8 46 97 ff ff       	call   c000158c <disp_str>
c0007e46:	83 c4 10             	add    $0x10,%esp
c0007e49:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
c0007e4d:	74 44                	je     c0007e93 <exception_handler2+0x105>
c0007e4f:	83 ec 08             	sub    $0x8,%esp
c0007e52:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e55:	68 0b ad 00 c0       	push   $0xc000ad0b
c0007e5a:	e8 68 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e5f:	83 c4 10             	add    $0x10,%esp
c0007e62:	83 ec 08             	sub    $0x8,%esp
c0007e65:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e68:	68 0b ad 00 c0       	push   $0xc000ad0b
c0007e6d:	e8 55 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007e72:	83 c4 10             	add    $0x10,%esp
c0007e75:	83 ec 0c             	sub    $0xc,%esp
c0007e78:	ff 75 0c             	pushl  0xc(%ebp)
c0007e7b:	e8 d7 fb ff ff       	call   c0007a57 <disp_int>
c0007e80:	83 c4 10             	add    $0x10,%esp
c0007e83:	83 ec 0c             	sub    $0xc,%esp
c0007e86:	68 00 ad 00 c0       	push   $0xc000ad00
c0007e8b:	e8 fc 96 ff ff       	call   c000158c <disp_str>
c0007e90:	83 c4 10             	add    $0x10,%esp
c0007e93:	83 ec 08             	sub    $0x8,%esp
c0007e96:	ff 75 e0             	pushl  -0x20(%ebp)
c0007e99:	68 15 ad 00 c0       	push   $0xc000ad15
c0007e9e:	e8 24 97 ff ff       	call   c00015c7 <disp_str_colour>
c0007ea3:	83 c4 10             	add    $0x10,%esp
c0007ea6:	83 ec 0c             	sub    $0xc,%esp
c0007ea9:	ff 75 14             	pushl  0x14(%ebp)
c0007eac:	e8 a6 fb ff ff       	call   c0007a57 <disp_int>
c0007eb1:	83 c4 10             	add    $0x10,%esp
c0007eb4:	83 ec 0c             	sub    $0xc,%esp
c0007eb7:	68 00 ad 00 c0       	push   $0xc000ad00
c0007ebc:	e8 cb 96 ff ff       	call   c000158c <disp_str>
c0007ec1:	83 c4 10             	add    $0x10,%esp
c0007ec4:	83 ec 08             	sub    $0x8,%esp
c0007ec7:	ff 75 e0             	pushl  -0x20(%ebp)
c0007eca:	68 19 ad 00 c0       	push   $0xc000ad19
c0007ecf:	e8 f3 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007ed4:	83 c4 10             	add    $0x10,%esp
c0007ed7:	83 ec 0c             	sub    $0xc,%esp
c0007eda:	ff 75 10             	pushl  0x10(%ebp)
c0007edd:	e8 75 fb ff ff       	call   c0007a57 <disp_int>
c0007ee2:	83 c4 10             	add    $0x10,%esp
c0007ee5:	83 ec 0c             	sub    $0xc,%esp
c0007ee8:	68 00 ad 00 c0       	push   $0xc000ad00
c0007eed:	e8 9a 96 ff ff       	call   c000158c <disp_str>
c0007ef2:	83 c4 10             	add    $0x10,%esp
c0007ef5:	83 ec 08             	sub    $0x8,%esp
c0007ef8:	ff 75 e0             	pushl  -0x20(%ebp)
c0007efb:	68 1e ad 00 c0       	push   $0xc000ad1e
c0007f00:	e8 c2 96 ff ff       	call   c00015c7 <disp_str_colour>
c0007f05:	83 c4 10             	add    $0x10,%esp
c0007f08:	83 ec 0c             	sub    $0xc,%esp
c0007f0b:	ff 75 18             	pushl  0x18(%ebp)
c0007f0e:	e8 44 fb ff ff       	call   c0007a57 <disp_int>
c0007f13:	83 c4 10             	add    $0x10,%esp
c0007f16:	83 ec 0c             	sub    $0xc,%esp
c0007f19:	68 00 ad 00 c0       	push   $0xc000ad00
c0007f1e:	e8 69 96 ff ff       	call   c000158c <disp_str>
c0007f23:	83 c4 10             	add    $0x10,%esp
c0007f26:	90                   	nop
c0007f27:	8d 65 f4             	lea    -0xc(%ebp),%esp
c0007f2a:	5b                   	pop    %ebx
c0007f2b:	5e                   	pop    %esi
c0007f2c:	5f                   	pop    %edi
c0007f2d:	5d                   	pop    %ebp
c0007f2e:	c3                   	ret    

c0007f2f <init_internal_interrupt>:
c0007f2f:	55                   	push   %ebp
c0007f30:	89 e5                	mov    %esp,%ebp
c0007f32:	83 ec 08             	sub    $0x8,%esp
c0007f35:	6a 0e                	push   $0xe
c0007f37:	6a 08                	push   $0x8
c0007f39:	68 03 16 00 c0       	push   $0xc0001603
c0007f3e:	6a 00                	push   $0x0
c0007f40:	e8 dd cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007f45:	83 c4 10             	add    $0x10,%esp
c0007f48:	6a 0e                	push   $0xe
c0007f4a:	6a 08                	push   $0x8
c0007f4c:	68 09 16 00 c0       	push   $0xc0001609
c0007f51:	6a 01                	push   $0x1
c0007f53:	e8 ca cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007f58:	83 c4 10             	add    $0x10,%esp
c0007f5b:	6a 0e                	push   $0xe
c0007f5d:	6a 08                	push   $0x8
c0007f5f:	68 0f 16 00 c0       	push   $0xc000160f
c0007f64:	6a 02                	push   $0x2
c0007f66:	e8 b7 cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007f6b:	83 c4 10             	add    $0x10,%esp
c0007f6e:	6a 0e                	push   $0xe
c0007f70:	6a 08                	push   $0x8
c0007f72:	68 15 16 00 c0       	push   $0xc0001615
c0007f77:	6a 03                	push   $0x3
c0007f79:	e8 a4 cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007f7e:	83 c4 10             	add    $0x10,%esp
c0007f81:	6a 0e                	push   $0xe
c0007f83:	6a 08                	push   $0x8
c0007f85:	68 1b 16 00 c0       	push   $0xc000161b
c0007f8a:	6a 04                	push   $0x4
c0007f8c:	e8 91 cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007f91:	83 c4 10             	add    $0x10,%esp
c0007f94:	6a 0e                	push   $0xe
c0007f96:	6a 08                	push   $0x8
c0007f98:	68 21 16 00 c0       	push   $0xc0001621
c0007f9d:	6a 05                	push   $0x5
c0007f9f:	e8 7e cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007fa4:	83 c4 10             	add    $0x10,%esp
c0007fa7:	6a 0e                	push   $0xe
c0007fa9:	6a 08                	push   $0x8
c0007fab:	68 27 16 00 c0       	push   $0xc0001627
c0007fb0:	6a 06                	push   $0x6
c0007fb2:	e8 6b cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007fb7:	83 c4 10             	add    $0x10,%esp
c0007fba:	6a 0e                	push   $0xe
c0007fbc:	6a 08                	push   $0x8
c0007fbe:	68 2d 16 00 c0       	push   $0xc000162d
c0007fc3:	6a 07                	push   $0x7
c0007fc5:	e8 58 cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007fca:	83 c4 10             	add    $0x10,%esp
c0007fcd:	6a 0e                	push   $0xe
c0007fcf:	6a 08                	push   $0x8
c0007fd1:	68 33 16 00 c0       	push   $0xc0001633
c0007fd6:	6a 08                	push   $0x8
c0007fd8:	e8 45 cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007fdd:	83 c4 10             	add    $0x10,%esp
c0007fe0:	6a 0e                	push   $0xe
c0007fe2:	6a 08                	push   $0x8
c0007fe4:	68 37 16 00 c0       	push   $0xc0001637
c0007fe9:	6a 09                	push   $0x9
c0007feb:	e8 32 cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0007ff0:	83 c4 10             	add    $0x10,%esp
c0007ff3:	6a 0e                	push   $0xe
c0007ff5:	6a 08                	push   $0x8
c0007ff7:	68 3d 16 00 c0       	push   $0xc000163d
c0007ffc:	6a 0a                	push   $0xa
c0007ffe:	e8 1f cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0008003:	83 c4 10             	add    $0x10,%esp
c0008006:	6a 0e                	push   $0xe
c0008008:	6a 08                	push   $0x8
c000800a:	68 41 16 00 c0       	push   $0xc0001641
c000800f:	6a 0b                	push   $0xb
c0008011:	e8 0c cd ff ff       	call   c0004d22 <InitInterruptDesc>
c0008016:	83 c4 10             	add    $0x10,%esp
c0008019:	6a 0e                	push   $0xe
c000801b:	6a 08                	push   $0x8
c000801d:	68 45 16 00 c0       	push   $0xc0001645
c0008022:	6a 0c                	push   $0xc
c0008024:	e8 f9 cc ff ff       	call   c0004d22 <InitInterruptDesc>
c0008029:	83 c4 10             	add    $0x10,%esp
c000802c:	6a 0e                	push   $0xe
c000802e:	6a 08                	push   $0x8
c0008030:	68 49 16 00 c0       	push   $0xc0001649
c0008035:	6a 0d                	push   $0xd
c0008037:	e8 e6 cc ff ff       	call   c0004d22 <InitInterruptDesc>
c000803c:	83 c4 10             	add    $0x10,%esp
c000803f:	6a 0e                	push   $0xe
c0008041:	6a 08                	push   $0x8
c0008043:	68 4d 16 00 c0       	push   $0xc000164d
c0008048:	6a 0e                	push   $0xe
c000804a:	e8 d3 cc ff ff       	call   c0004d22 <InitInterruptDesc>
c000804f:	83 c4 10             	add    $0x10,%esp
c0008052:	6a 0e                	push   $0xe
c0008054:	6a 08                	push   $0x8
c0008056:	68 51 16 00 c0       	push   $0xc0001651
c000805b:	6a 10                	push   $0x10
c000805d:	e8 c0 cc ff ff       	call   c0004d22 <InitInterruptDesc>
c0008062:	83 c4 10             	add    $0x10,%esp
c0008065:	6a 0e                	push   $0xe
c0008067:	6a 08                	push   $0x8
c0008069:	68 57 16 00 c0       	push   $0xc0001657
c000806e:	6a 11                	push   $0x11
c0008070:	e8 ad cc ff ff       	call   c0004d22 <InitInterruptDesc>
c0008075:	83 c4 10             	add    $0x10,%esp
c0008078:	6a 0e                	push   $0xe
c000807a:	6a 08                	push   $0x8
c000807c:	68 5b 16 00 c0       	push   $0xc000165b
c0008081:	6a 12                	push   $0x12
c0008083:	e8 9a cc ff ff       	call   c0004d22 <InitInterruptDesc>
c0008088:	83 c4 10             	add    $0x10,%esp
c000808b:	6a 0e                	push   $0xe
c000808d:	6a 0e                	push   $0xe
c000808f:	68 1c 17 00 c0       	push   $0xc000171c
c0008094:	68 90 00 00 00       	push   $0x90
c0008099:	e8 84 cc ff ff       	call   c0004d22 <InitInterruptDesc>
c000809e:	83 c4 10             	add    $0x10,%esp
c00080a1:	90                   	nop
c00080a2:	c9                   	leave  
c00080a3:	c3                   	ret    

c00080a4 <test>:
c00080a4:	55                   	push   %ebp
c00080a5:	89 e5                	mov    %esp,%ebp
c00080a7:	83 ec 08             	sub    $0x8,%esp
c00080aa:	83 ec 0c             	sub    $0xc,%esp
c00080ad:	68 ae af 00 c0       	push   $0xc000afae
c00080b2:	e8 d5 94 ff ff       	call   c000158c <disp_str>
c00080b7:	83 c4 10             	add    $0x10,%esp
c00080ba:	83 ec 0c             	sub    $0xc,%esp
c00080bd:	6a 06                	push   $0x6
c00080bf:	e8 93 f9 ff ff       	call   c0007a57 <disp_int>
c00080c4:	83 c4 10             	add    $0x10,%esp
c00080c7:	83 ec 0c             	sub    $0xc,%esp
c00080ca:	68 d4 ac 00 c0       	push   $0xc000acd4
c00080cf:	e8 b8 94 ff ff       	call   c000158c <disp_str>
c00080d4:	83 c4 10             	add    $0x10,%esp
c00080d7:	90                   	nop
c00080d8:	c9                   	leave  
c00080d9:	c3                   	ret    

c00080da <disp_str_colour3>:
c00080da:	55                   	push   %ebp
c00080db:	89 e5                	mov    %esp,%ebp
c00080dd:	90                   	nop
c00080de:	5d                   	pop    %ebp
c00080df:	c3                   	ret    

c00080e0 <spurious_irq>:
c00080e0:	55                   	push   %ebp
c00080e1:	89 e5                	mov    %esp,%ebp
c00080e3:	83 ec 08             	sub    $0x8,%esp
c00080e6:	83 ec 08             	sub    $0x8,%esp
c00080e9:	6a 0b                	push   $0xb
c00080eb:	68 b0 af 00 c0       	push   $0xc000afb0
c00080f0:	e8 d2 94 ff ff       	call   c00015c7 <disp_str_colour>
c00080f5:	83 c4 10             	add    $0x10,%esp
c00080f8:	83 ec 0c             	sub    $0xc,%esp
c00080fb:	ff 75 08             	pushl  0x8(%ebp)
c00080fe:	e8 54 f9 ff ff       	call   c0007a57 <disp_int>
c0008103:	83 c4 10             	add    $0x10,%esp
c0008106:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c000810b:	83 c0 01             	add    $0x1,%eax
c000810e:	a3 c0 1e 01 c0       	mov    %eax,0xc0011ec0
c0008113:	83 ec 0c             	sub    $0xc,%esp
c0008116:	68 d7 af 00 c0       	push   $0xc000afd7
c000811b:	e8 6c 94 ff ff       	call   c000158c <disp_str>
c0008120:	83 c4 10             	add    $0x10,%esp
c0008123:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008128:	83 ec 0c             	sub    $0xc,%esp
c000812b:	50                   	push   %eax
c000812c:	e8 26 f9 ff ff       	call   c0007a57 <disp_int>
c0008131:	83 c4 10             	add    $0x10,%esp
c0008134:	83 ec 0c             	sub    $0xc,%esp
c0008137:	68 d9 af 00 c0       	push   $0xc000afd9
c000813c:	e8 4b 94 ff ff       	call   c000158c <disp_str>
c0008141:	83 c4 10             	add    $0x10,%esp
c0008144:	83 ec 08             	sub    $0x8,%esp
c0008147:	6a 0c                	push   $0xc
c0008149:	68 dc af 00 c0       	push   $0xc000afdc
c000814e:	e8 74 94 ff ff       	call   c00015c7 <disp_str_colour>
c0008153:	83 c4 10             	add    $0x10,%esp
c0008156:	90                   	nop
c0008157:	c9                   	leave  
c0008158:	c3                   	ret    

c0008159 <init_keyboard>:
c0008159:	55                   	push   %ebp
c000815a:	89 e5                	mov    %esp,%ebp
c000815c:	83 ec 18             	sub    $0x18,%esp
c000815f:	83 ec 04             	sub    $0x4,%esp
c0008162:	68 00 02 00 00       	push   $0x200
c0008167:	6a 00                	push   $0x0
c0008169:	68 8c fb 00 c0       	push   $0xc000fb8c
c000816e:	e8 7f 32 00 00       	call   c000b3f2 <Memset>
c0008173:	83 c4 10             	add    $0x10,%esp
c0008176:	c7 05 80 fb 00 c0 8c 	movl   $0xc000fb8c,0xc000fb80
c000817d:	fb 00 c0 
c0008180:	a1 80 fb 00 c0       	mov    0xc000fb80,%eax
c0008185:	a3 84 fb 00 c0       	mov    %eax,0xc000fb84
c000818a:	c7 05 88 fb 00 c0 00 	movl   $0x0,0xc000fb88
c0008191:	00 00 00 
c0008194:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c000819b:	00 00 00 
c000819e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c00081a5:	eb 04                	jmp    c00081ab <init_keyboard+0x52>
c00081a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00081ab:	81 7d f4 9f 0f 00 00 	cmpl   $0xf9f,-0xc(%ebp)
c00081b2:	7e f3                	jle    c00081a7 <init_keyboard+0x4e>
c00081b4:	c7 05 40 f7 00 c0 00 	movl   $0x0,0xc000f740
c00081bb:	00 00 00 
c00081be:	e8 5e d9 ff ff       	call   c0005b21 <init_keyboard_handler>
c00081c3:	90                   	nop
c00081c4:	c9                   	leave  
c00081c5:	c3                   	ret    

c00081c6 <init2>:
c00081c6:	55                   	push   %ebp
c00081c7:	89 e5                	mov    %esp,%ebp
c00081c9:	83 ec 08             	sub    $0x8,%esp
c00081cc:	83 ec 0c             	sub    $0xc,%esp
c00081cf:	68 01 b0 00 c0       	push   $0xc000b001
c00081d4:	e8 b3 93 ff ff       	call   c000158c <disp_str>
c00081d9:	83 c4 10             	add    $0x10,%esp
c00081dc:	e8 78 ff ff ff       	call   c0008159 <init_keyboard>
c00081e1:	83 ec 0c             	sub    $0xc,%esp
c00081e4:	68 00 00 00 02       	push   $0x2000000
c00081e9:	e8 87 f4 ff ff       	call   c0007675 <init_memory>
c00081ee:	83 c4 10             	add    $0x10,%esp
c00081f1:	90                   	nop
c00081f2:	c9                   	leave  
c00081f3:	c3                   	ret    

c00081f4 <u_thread_a>:
c00081f4:	55                   	push   %ebp
c00081f5:	89 e5                	mov    %esp,%ebp
c00081f7:	83 ec 08             	sub    $0x8,%esp
c00081fa:	83 ec 0c             	sub    $0xc,%esp
c00081fd:	68 07 b0 00 c0       	push   $0xc000b007
c0008202:	e8 85 93 ff ff       	call   c000158c <disp_str>
c0008207:	83 c4 10             	add    $0x10,%esp
c000820a:	eb fe                	jmp    c000820a <u_thread_a+0x16>

c000820c <kernel_main2>:
c000820c:	55                   	push   %ebp
c000820d:	89 e5                	mov    %esp,%ebp
c000820f:	57                   	push   %edi
c0008210:	56                   	push   %esi
c0008211:	53                   	push   %ebx
c0008212:	83 ec 3c             	sub    $0x3c,%esp
c0008215:	83 ec 0c             	sub    $0xc,%esp
c0008218:	68 15 b0 00 c0       	push   $0xc000b015
c000821d:	e8 6a 93 ff ff       	call   c000158c <disp_str>
c0008222:	83 c4 10             	add    $0x10,%esp
c0008225:	e8 14 97 ff ff       	call   c000193e <init>
c000822a:	c7 05 c0 1e 01 c0 00 	movl   $0x0,0xc0011ec0
c0008231:	00 00 00 
c0008234:	c7 05 9c 16 01 c0 00 	movl   $0x0,0xc001169c
c000823b:	00 00 00 
c000823e:	c7 05 44 f7 00 c0 00 	movl   $0x0,0xc000f744
c0008245:	00 00 00 
c0008248:	c7 45 dc 00 32 08 c0 	movl   $0xc0083200,-0x24(%ebp)
c000824f:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008256:	e9 01 02 00 00       	jmp    c000845c <kernel_main2+0x250>
c000825b:	83 ec 08             	sub    $0x8,%esp
c000825e:	6a 00                	push   $0x0
c0008260:	6a 01                	push   $0x1
c0008262:	e8 d5 eb ff ff       	call   c0006e3c <alloc_memory>
c0008267:	83 c4 10             	add    $0x10,%esp
c000826a:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000826d:	83 ec 04             	sub    $0x4,%esp
c0008270:	68 ac 02 00 00       	push   $0x2ac
c0008275:	6a 00                	push   $0x0
c0008277:	ff 75 d8             	pushl  -0x28(%ebp)
c000827a:	e8 73 31 00 00       	call   c000b3f2 <Memset>
c000827f:	83 c4 10             	add    $0x10,%esp
c0008282:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008285:	05 00 10 00 00       	add    $0x1000,%eax
c000828a:	89 c2                	mov    %eax,%edx
c000828c:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000828f:	89 10                	mov    %edx,(%eax)
c0008291:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008294:	66 c7 80 0c 01 00 00 	movw   $0x0,0x10c(%eax)
c000829b:	00 00 
c000829d:	8b 55 e0             	mov    -0x20(%ebp),%edx
c00082a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082a3:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c00082a9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082ac:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c00082b3:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c00082b7:	7e 0f                	jle    c00082c8 <kernel_main2+0xbc>
c00082b9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082bc:	c6 80 44 02 00 00 ff 	movb   $0xff,0x244(%eax)
c00082c3:	e9 90 01 00 00       	jmp    c0008458 <kernel_main2+0x24c>
c00082c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082cb:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00082d2:	83 7d e0 01          	cmpl   $0x1,-0x20(%ebp)
c00082d6:	7f 73                	jg     c000834b <kernel_main2+0x13f>
c00082d8:	c7 45 e4 20 e0 00 c0 	movl   $0xc000e020,-0x1c(%ebp)
c00082df:	c7 45 d4 44 00 00 00 	movl   $0x44,-0x2c(%ebp)
c00082e6:	c7 45 d0 28 00 00 00 	movl   $0x28,-0x30(%ebp)
c00082ed:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082f0:	8b 00                	mov    (%eax),%eax
c00082f2:	2b 45 d4             	sub    -0x2c(%ebp),%eax
c00082f5:	89 c2                	mov    %eax,%edx
c00082f7:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082fa:	89 10                	mov    %edx,(%eax)
c00082fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00082ff:	8b 00                	mov    (%eax),%eax
c0008301:	2b 45 d0             	sub    -0x30(%ebp),%eax
c0008304:	89 c2                	mov    %eax,%edx
c0008306:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008309:	89 10                	mov    %edx,(%eax)
c000830b:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000830e:	8b 00                	mov    (%eax),%eax
c0008310:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008313:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008316:	8b 50 14             	mov    0x14(%eax),%edx
c0008319:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000831c:	89 50 24             	mov    %edx,0x24(%eax)
c000831f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008322:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c0008328:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000832b:	8b 10                	mov    (%eax),%edx
c000832d:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008330:	89 50 04             	mov    %edx,0x4(%eax)
c0008333:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008336:	8b 50 04             	mov    0x4(%eax),%edx
c0008339:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000833c:	89 50 08             	mov    %edx,0x8(%eax)
c000833f:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008342:	8b 50 08             	mov    0x8(%eax),%edx
c0008345:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008348:	89 50 0c             	mov    %edx,0xc(%eax)
c000834b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000834e:	8b 55 d8             	mov    -0x28(%ebp),%edx
c0008351:	81 c2 30 01 00 00    	add    $0x130,%edx
c0008357:	83 ec 08             	sub    $0x8,%esp
c000835a:	50                   	push   %eax
c000835b:	52                   	push   %edx
c000835c:	e8 b0 30 00 00       	call   c000b411 <Strcpy>
c0008361:	83 c4 10             	add    $0x10,%esp
c0008364:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008368:	83 c8 04             	or     $0x4,%eax
c000836b:	0f b6 c0             	movzbl %al,%eax
c000836e:	66 89 45 c8          	mov    %ax,-0x38(%ebp)
c0008372:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
c0008376:	83 c8 0c             	or     $0xc,%eax
c0008379:	0f b6 c0             	movzbl %al,%eax
c000837c:	66 89 45 c6          	mov    %ax,-0x3a(%ebp)
c0008380:	0f b7 55 c8          	movzwl -0x38(%ebp),%edx
c0008384:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008387:	89 90 9c 02 00 00    	mov    %edx,0x29c(%eax)
c000838d:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c0008391:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008394:	89 90 74 02 00 00    	mov    %edx,0x274(%eax)
c000839a:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c000839e:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083a1:	89 90 6c 02 00 00    	mov    %edx,0x26c(%eax)
c00083a7:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00083ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083ae:	89 90 70 02 00 00    	mov    %edx,0x270(%eax)
c00083b4:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
c00083b8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083bb:	89 90 a8 02 00 00    	mov    %edx,0x2a8(%eax)
c00083c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083c4:	c7 80 68 02 00 00 39 	movl   $0x39,0x268(%eax)
c00083cb:	00 00 00 
c00083ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00083d1:	8b 50 14             	mov    0x14(%eax),%edx
c00083d4:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083d7:	89 90 98 02 00 00    	mov    %edx,0x298(%eax)
c00083dd:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083e0:	8b 55 c0             	mov    -0x40(%ebp),%edx
c00083e3:	89 90 a0 02 00 00    	mov    %edx,0x2a0(%eax)
c00083e9:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083ec:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00083f3:	00 00 00 
c00083f6:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00083f9:	c7 80 54 02 00 00 00 	movl   $0x0,0x254(%eax)
c0008400:	00 00 00 
c0008403:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008406:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000840d:	00 00 00 
c0008410:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008413:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c000841a:	00 00 00 
c000841d:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008420:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c0008427:	00 00 00 
c000842a:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000842d:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c0008434:	00 00 00 
c0008437:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000843a:	69 c0 ac 02 00 00    	imul   $0x2ac,%eax,%eax
c0008440:	8d 90 00 33 08 c0    	lea    -0x3ff7cd00(%eax),%edx
c0008446:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0008449:	89 c3                	mov    %eax,%ebx
c000844b:	b8 ab 00 00 00       	mov    $0xab,%eax
c0008450:	89 d7                	mov    %edx,%edi
c0008452:	89 de                	mov    %ebx,%esi
c0008454:	89 c1                	mov    %eax,%ecx
c0008456:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
c0008458:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c000845c:	83 7d e0 03          	cmpl   $0x3,-0x20(%ebp)
c0008460:	0f 8e f5 fd ff ff    	jle    c000825b <kernel_main2+0x4f>
c0008466:	c7 05 60 fb 00 c0 00 	movl   $0xc0083300,0xc000fb60
c000846d:	33 08 c0 
c0008470:	eb fe                	jmp    c0008470 <kernel_main2+0x264>

c0008472 <TestTTY>:
c0008472:	55                   	push   %ebp
c0008473:	89 e5                	mov    %esp,%ebp
c0008475:	83 ec 28             	sub    $0x28,%esp
c0008478:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c000847f:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c0008486:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c000848c:	83 ec 08             	sub    $0x8,%esp
c000848f:	6a 02                	push   $0x2
c0008491:	8d 45 de             	lea    -0x22(%ebp),%eax
c0008494:	50                   	push   %eax
c0008495:	e8 2d d8 ff ff       	call   c0005cc7 <open>
c000849a:	83 c4 10             	add    $0x10,%esp
c000849d:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00084a0:	83 ec 08             	sub    $0x8,%esp
c00084a3:	6a 02                	push   $0x2
c00084a5:	8d 45 de             	lea    -0x22(%ebp),%eax
c00084a8:	50                   	push   %eax
c00084a9:	e8 19 d8 ff ff       	call   c0005cc7 <open>
c00084ae:	83 c4 10             	add    $0x10,%esp
c00084b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00084b4:	83 ec 0c             	sub    $0xc,%esp
c00084b7:	68 21 b0 00 c0       	push   $0xc000b021
c00084bc:	e8 5e 0a 00 00       	call   c0008f1f <Printf>
c00084c1:	83 c4 10             	add    $0x10,%esp
c00084c4:	83 ec 0c             	sub    $0xc,%esp
c00084c7:	6a 0a                	push   $0xa
c00084c9:	e8 10 ea ff ff       	call   c0006ede <sys_malloc>
c00084ce:	83 c4 10             	add    $0x10,%esp
c00084d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00084d4:	83 ec 04             	sub    $0x4,%esp
c00084d7:	6a 0a                	push   $0xa
c00084d9:	6a 00                	push   $0x0
c00084db:	ff 75 ec             	pushl  -0x14(%ebp)
c00084de:	e8 0f 2f 00 00       	call   c000b3f2 <Memset>
c00084e3:	83 c4 10             	add    $0x10,%esp
c00084e6:	83 ec 04             	sub    $0x4,%esp
c00084e9:	6a 0a                	push   $0xa
c00084eb:	ff 75 ec             	pushl  -0x14(%ebp)
c00084ee:	ff 75 f0             	pushl  -0x10(%ebp)
c00084f1:	e8 56 d8 ff ff       	call   c0005d4c <read>
c00084f6:	83 c4 10             	add    $0x10,%esp
c00084f9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00084fc:	83 ec 08             	sub    $0x8,%esp
c00084ff:	ff 75 ec             	pushl  -0x14(%ebp)
c0008502:	68 33 b0 00 c0       	push   $0xc000b033
c0008507:	e8 13 0a 00 00       	call   c0008f1f <Printf>
c000850c:	83 c4 10             	add    $0x10,%esp
c000850f:	eb c3                	jmp    c00084d4 <TestTTY+0x62>

c0008511 <TestFS>:
c0008511:	55                   	push   %ebp
c0008512:	89 e5                	mov    %esp,%ebp
c0008514:	81 ec d8 02 00 00    	sub    $0x2d8,%esp
c000851a:	83 ec 0c             	sub    $0xc,%esp
c000851d:	68 3d b0 00 c0       	push   $0xc000b03d
c0008522:	e8 65 90 ff ff       	call   c000158c <disp_str>
c0008527:	83 c4 10             	add    $0x10,%esp
c000852a:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008531:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008538:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c000853e:	83 ec 08             	sub    $0x8,%esp
c0008541:	6a 02                	push   $0x2
c0008543:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008546:	50                   	push   %eax
c0008547:	e8 7b d7 ff ff       	call   c0005cc7 <open>
c000854c:	83 c4 10             	add    $0x10,%esp
c000854f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008552:	83 ec 08             	sub    $0x8,%esp
c0008555:	6a 02                	push   $0x2
c0008557:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c000855a:	50                   	push   %eax
c000855b:	e8 67 d7 ff ff       	call   c0005cc7 <open>
c0008560:	83 c4 10             	add    $0x10,%esp
c0008563:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008566:	83 ec 0c             	sub    $0xc,%esp
c0008569:	68 21 b0 00 c0       	push   $0xc000b021
c000856e:	e8 ac 09 00 00       	call   c0008f1f <Printf>
c0008573:	83 c4 10             	add    $0x10,%esp
c0008576:	90                   	nop
c0008577:	c9                   	leave  
c0008578:	c3                   	ret    

c0008579 <wait_exit>:
c0008579:	55                   	push   %ebp
c000857a:	89 e5                	mov    %esp,%ebp
c000857c:	83 ec 28             	sub    $0x28,%esp
c000857f:	c7 45 de 64 65 76 5f 	movl   $0x5f766564,-0x22(%ebp)
c0008586:	c7 45 e2 74 74 79 31 	movl   $0x31797474,-0x1e(%ebp)
c000858d:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
c0008593:	83 ec 08             	sub    $0x8,%esp
c0008596:	6a 02                	push   $0x2
c0008598:	8d 45 de             	lea    -0x22(%ebp),%eax
c000859b:	50                   	push   %eax
c000859c:	e8 26 d7 ff ff       	call   c0005cc7 <open>
c00085a1:	83 c4 10             	add    $0x10,%esp
c00085a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00085a7:	83 ec 08             	sub    $0x8,%esp
c00085aa:	6a 02                	push   $0x2
c00085ac:	8d 45 de             	lea    -0x22(%ebp),%eax
c00085af:	50                   	push   %eax
c00085b0:	e8 12 d7 ff ff       	call   c0005cc7 <open>
c00085b5:	83 c4 10             	add    $0x10,%esp
c00085b8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00085bb:	e8 38 d9 ff ff       	call   c0005ef8 <fork>
c00085c0:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00085c3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
c00085c7:	7e 25                	jle    c00085ee <wait_exit+0x75>
c00085c9:	83 ec 0c             	sub    $0xc,%esp
c00085cc:	8d 45 d8             	lea    -0x28(%ebp),%eax
c00085cf:	50                   	push   %eax
c00085d0:	e8 bc d8 ff ff       	call   c0005e91 <wait>
c00085d5:	83 c4 10             	add    $0x10,%esp
c00085d8:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00085db:	83 ec 08             	sub    $0x8,%esp
c00085de:	50                   	push   %eax
c00085df:	68 45 b0 00 c0       	push   $0xc000b045
c00085e4:	e8 36 09 00 00       	call   c0008f1f <Printf>
c00085e9:	83 c4 10             	add    $0x10,%esp
c00085ec:	eb fe                	jmp    c00085ec <wait_exit+0x73>
c00085ee:	83 ec 0c             	sub    $0xc,%esp
c00085f1:	68 60 b0 00 c0       	push   $0xc000b060
c00085f6:	e8 24 09 00 00       	call   c0008f1f <Printf>
c00085fb:	83 c4 10             	add    $0x10,%esp
c00085fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008605:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008608:	8d 50 01             	lea    0x1(%eax),%edx
c000860b:	89 55 f4             	mov    %edx,-0xc(%ebp)
c000860e:	3d 50 c3 00 00       	cmp    $0xc350,%eax
c0008613:	7f 02                	jg     c0008617 <wait_exit+0x9e>
c0008615:	eb ee                	jmp    c0008605 <wait_exit+0x8c>
c0008617:	90                   	nop
c0008618:	83 ec 0c             	sub    $0xc,%esp
c000861b:	68 6c b0 00 c0       	push   $0xc000b06c
c0008620:	e8 fa 08 00 00       	call   c0008f1f <Printf>
c0008625:	83 c4 10             	add    $0x10,%esp
c0008628:	83 ec 0c             	sub    $0xc,%esp
c000862b:	6a 09                	push   $0x9
c000862d:	e8 9d d8 ff ff       	call   c0005ecf <exit>
c0008632:	83 c4 10             	add    $0x10,%esp
c0008635:	83 ec 0c             	sub    $0xc,%esp
c0008638:	68 7a b0 00 c0       	push   $0xc000b07a
c000863d:	e8 dd 08 00 00       	call   c0008f1f <Printf>
c0008642:	83 c4 10             	add    $0x10,%esp
c0008645:	eb fe                	jmp    c0008645 <wait_exit+0xcc>

c0008647 <INIT_fork>:
c0008647:	55                   	push   %ebp
c0008648:	89 e5                	mov    %esp,%ebp
c000864a:	53                   	push   %ebx
c000864b:	83 ec 74             	sub    $0x74,%esp
c000864e:	c7 45 da 64 65 76 5f 	movl   $0x5f766564,-0x26(%ebp)
c0008655:	c7 45 de 74 74 79 31 	movl   $0x31797474,-0x22(%ebp)
c000865c:	66 c7 45 e2 00 00    	movw   $0x0,-0x1e(%ebp)
c0008662:	83 ec 08             	sub    $0x8,%esp
c0008665:	6a 02                	push   $0x2
c0008667:	8d 45 da             	lea    -0x26(%ebp),%eax
c000866a:	50                   	push   %eax
c000866b:	e8 57 d6 ff ff       	call   c0005cc7 <open>
c0008670:	83 c4 10             	add    $0x10,%esp
c0008673:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008676:	83 ec 08             	sub    $0x8,%esp
c0008679:	6a 02                	push   $0x2
c000867b:	8d 45 da             	lea    -0x26(%ebp),%eax
c000867e:	50                   	push   %eax
c000867f:	e8 43 d6 ff ff       	call   c0005cc7 <open>
c0008684:	83 c4 10             	add    $0x10,%esp
c0008687:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000868a:	c7 45 b2 49 4e 49 54 	movl   $0x54494e49,-0x4e(%ebp)
c0008691:	c7 45 b6 20 69 73 20 	movl   $0x20736920,-0x4a(%ebp)
c0008698:	c7 45 ba 72 75 6e 6e 	movl   $0x6e6e7572,-0x46(%ebp)
c000869f:	c7 45 be 69 6e 67 0a 	movl   $0xa676e69,-0x42(%ebp)
c00086a6:	c7 45 c2 00 00 00 00 	movl   $0x0,-0x3e(%ebp)
c00086ad:	c7 45 c6 00 00 00 00 	movl   $0x0,-0x3a(%ebp)
c00086b4:	c7 45 ca 00 00 00 00 	movl   $0x0,-0x36(%ebp)
c00086bb:	c7 45 ce 00 00 00 00 	movl   $0x0,-0x32(%ebp)
c00086c2:	c7 45 d2 00 00 00 00 	movl   $0x0,-0x2e(%ebp)
c00086c9:	c7 45 d6 00 00 00 00 	movl   $0x0,-0x2a(%ebp)
c00086d0:	83 ec 0c             	sub    $0xc,%esp
c00086d3:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086d6:	50                   	push   %eax
c00086d7:	e8 43 08 00 00       	call   c0008f1f <Printf>
c00086dc:	83 c4 10             	add    $0x10,%esp
c00086df:	83 ec 0c             	sub    $0xc,%esp
c00086e2:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086e5:	50                   	push   %eax
c00086e6:	e8 40 2d 00 00       	call   c000b42b <Strlen>
c00086eb:	83 c4 10             	add    $0x10,%esp
c00086ee:	83 ec 04             	sub    $0x4,%esp
c00086f1:	50                   	push   %eax
c00086f2:	6a 00                	push   $0x0
c00086f4:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c00086f7:	50                   	push   %eax
c00086f8:	e8 f5 2c 00 00       	call   c000b3f2 <Memset>
c00086fd:	83 c4 10             	add    $0x10,%esp
c0008700:	83 ec 04             	sub    $0x4,%esp
c0008703:	6a 28                	push   $0x28
c0008705:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c0008708:	50                   	push   %eax
c0008709:	ff 75 e8             	pushl  -0x18(%ebp)
c000870c:	e8 3b d6 ff ff       	call   c0005d4c <read>
c0008711:	83 c4 10             	add    $0x10,%esp
c0008714:	83 ec 0c             	sub    $0xc,%esp
c0008717:	8d 45 b2             	lea    -0x4e(%ebp),%eax
c000871a:	50                   	push   %eax
c000871b:	e8 ff 07 00 00       	call   c0008f1f <Printf>
c0008720:	83 c4 10             	add    $0x10,%esp
c0008723:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000872a:	e8 c9 d7 ff ff       	call   c0005ef8 <fork>
c000872f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0008732:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
c0008736:	0f 8e e7 00 00 00    	jle    c0008823 <INIT_fork+0x1dc>
c000873c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008740:	c7 45 8a 50 61 72 65 	movl   $0x65726150,-0x76(%ebp)
c0008747:	c7 45 8e 6e 74 0a 00 	movl   $0xa746e,-0x72(%ebp)
c000874e:	8d 45 92             	lea    -0x6e(%ebp),%eax
c0008751:	b9 20 00 00 00       	mov    $0x20,%ecx
c0008756:	bb 00 00 00 00       	mov    $0x0,%ebx
c000875b:	89 18                	mov    %ebx,(%eax)
c000875d:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008761:	8d 50 04             	lea    0x4(%eax),%edx
c0008764:	83 e2 fc             	and    $0xfffffffc,%edx
c0008767:	29 d0                	sub    %edx,%eax
c0008769:	01 c1                	add    %eax,%ecx
c000876b:	83 e1 fc             	and    $0xfffffffc,%ecx
c000876e:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008771:	b8 00 00 00 00       	mov    $0x0,%eax
c0008776:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008779:	83 c0 04             	add    $0x4,%eax
c000877c:	39 c8                	cmp    %ecx,%eax
c000877e:	72 f6                	jb     c0008776 <INIT_fork+0x12f>
c0008780:	01 c2                	add    %eax,%edx
c0008782:	83 ec 0c             	sub    $0xc,%esp
c0008785:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008788:	50                   	push   %eax
c0008789:	e8 9d 2c 00 00       	call   c000b42b <Strlen>
c000878e:	83 c4 10             	add    $0x10,%esp
c0008791:	83 ec 04             	sub    $0x4,%esp
c0008794:	50                   	push   %eax
c0008795:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008798:	50                   	push   %eax
c0008799:	ff 75 ec             	pushl  -0x14(%ebp)
c000879c:	e8 1f d6 ff ff       	call   c0005dc0 <write>
c00087a1:	83 c4 10             	add    $0x10,%esp
c00087a4:	83 ec 0c             	sub    $0xc,%esp
c00087a7:	8d 45 8a             	lea    -0x76(%ebp),%eax
c00087aa:	50                   	push   %eax
c00087ab:	e8 7b 2c 00 00       	call   c000b42b <Strlen>
c00087b0:	83 c4 10             	add    $0x10,%esp
c00087b3:	83 ec 04             	sub    $0x4,%esp
c00087b6:	50                   	push   %eax
c00087b7:	8d 45 8a             	lea    -0x76(%ebp),%eax
c00087ba:	50                   	push   %eax
c00087bb:	ff 75 ec             	pushl  -0x14(%ebp)
c00087be:	e8 fd d5 ff ff       	call   c0005dc0 <write>
c00087c3:	83 c4 10             	add    $0x10,%esp
c00087c6:	83 ec 0c             	sub    $0xc,%esp
c00087c9:	8d 45 8a             	lea    -0x76(%ebp),%eax
c00087cc:	50                   	push   %eax
c00087cd:	e8 59 2c 00 00       	call   c000b42b <Strlen>
c00087d2:	83 c4 10             	add    $0x10,%esp
c00087d5:	83 ec 04             	sub    $0x4,%esp
c00087d8:	50                   	push   %eax
c00087d9:	8d 45 8a             	lea    -0x76(%ebp),%eax
c00087dc:	50                   	push   %eax
c00087dd:	ff 75 ec             	pushl  -0x14(%ebp)
c00087e0:	e8 db d5 ff ff       	call   c0005dc0 <write>
c00087e5:	83 c4 10             	add    $0x10,%esp
c00087e8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c00087ef:	eb 2a                	jmp    c000881b <INIT_fork+0x1d4>
c00087f1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c00087f5:	83 ec 0c             	sub    $0xc,%esp
c00087f8:	8d 45 8a             	lea    -0x76(%ebp),%eax
c00087fb:	50                   	push   %eax
c00087fc:	e8 2a 2c 00 00       	call   c000b42b <Strlen>
c0008801:	83 c4 10             	add    $0x10,%esp
c0008804:	83 ec 04             	sub    $0x4,%esp
c0008807:	50                   	push   %eax
c0008808:	8d 45 8a             	lea    -0x76(%ebp),%eax
c000880b:	50                   	push   %eax
c000880c:	ff 75 ec             	pushl  -0x14(%ebp)
c000880f:	e8 ac d5 ff ff       	call   c0005dc0 <write>
c0008814:	83 c4 10             	add    $0x10,%esp
c0008817:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000881b:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
c000881f:	7e d0                	jle    c00087f1 <INIT_fork+0x1aa>
c0008821:	eb 79                	jmp    c000889c <INIT_fork+0x255>
c0008823:	83 ec 0c             	sub    $0xc,%esp
c0008826:	6a 0a                	push   $0xa
c0008828:	e8 c1 05 00 00       	call   c0008dee <delay>
c000882d:	83 c4 10             	add    $0x10,%esp
c0008830:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008834:	83 45 f4 02          	addl   $0x2,-0xc(%ebp)
c0008838:	c7 45 8a 43 68 69 6c 	movl   $0x6c696843,-0x76(%ebp)
c000883f:	c7 45 8e 64 0a 00 00 	movl   $0xa64,-0x72(%ebp)
c0008846:	8d 45 92             	lea    -0x6e(%ebp),%eax
c0008849:	b9 20 00 00 00       	mov    $0x20,%ecx
c000884e:	bb 00 00 00 00       	mov    $0x0,%ebx
c0008853:	89 18                	mov    %ebx,(%eax)
c0008855:	89 5c 08 fc          	mov    %ebx,-0x4(%eax,%ecx,1)
c0008859:	8d 50 04             	lea    0x4(%eax),%edx
c000885c:	83 e2 fc             	and    $0xfffffffc,%edx
c000885f:	29 d0                	sub    %edx,%eax
c0008861:	01 c1                	add    %eax,%ecx
c0008863:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008866:	83 e1 fc             	and    $0xfffffffc,%ecx
c0008869:	b8 00 00 00 00       	mov    $0x0,%eax
c000886e:	89 1c 02             	mov    %ebx,(%edx,%eax,1)
c0008871:	83 c0 04             	add    $0x4,%eax
c0008874:	39 c8                	cmp    %ecx,%eax
c0008876:	72 f6                	jb     c000886e <INIT_fork+0x227>
c0008878:	01 c2                	add    %eax,%edx
c000887a:	83 ec 0c             	sub    $0xc,%esp
c000887d:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008880:	50                   	push   %eax
c0008881:	e8 a5 2b 00 00       	call   c000b42b <Strlen>
c0008886:	83 c4 10             	add    $0x10,%esp
c0008889:	83 ec 04             	sub    $0x4,%esp
c000888c:	50                   	push   %eax
c000888d:	8d 45 8a             	lea    -0x76(%ebp),%eax
c0008890:	50                   	push   %eax
c0008891:	ff 75 ec             	pushl  -0x14(%ebp)
c0008894:	e8 27 d5 ff ff       	call   c0005dc0 <write>
c0008899:	83 c4 10             	add    $0x10,%esp
c000889c:	90                   	nop
c000889d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c00088a0:	c9                   	leave  
c00088a1:	c3                   	ret    

c00088a2 <simple_shell>:
c00088a2:	55                   	push   %ebp
c00088a3:	89 e5                	mov    %esp,%ebp
c00088a5:	81 ec f8 00 00 00    	sub    $0xf8,%esp
c00088ab:	c7 45 c2 64 65 76 5f 	movl   $0x5f766564,-0x3e(%ebp)
c00088b2:	c7 45 c6 74 74 79 31 	movl   $0x31797474,-0x3a(%ebp)
c00088b9:	66 c7 45 ca 00 00    	movw   $0x0,-0x36(%ebp)
c00088bf:	83 ec 08             	sub    $0x8,%esp
c00088c2:	6a 02                	push   $0x2
c00088c4:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c00088c7:	50                   	push   %eax
c00088c8:	e8 fa d3 ff ff       	call   c0005cc7 <open>
c00088cd:	83 c4 10             	add    $0x10,%esp
c00088d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
c00088d3:	83 ec 08             	sub    $0x8,%esp
c00088d6:	6a 02                	push   $0x2
c00088d8:	8d 45 c2             	lea    -0x3e(%ebp),%eax
c00088db:	50                   	push   %eax
c00088dc:	e8 e6 d3 ff ff       	call   c0005cc7 <open>
c00088e1:	83 c4 10             	add    $0x10,%esp
c00088e4:	89 45 dc             	mov    %eax,-0x24(%ebp)
c00088e7:	83 ec 04             	sub    $0x4,%esp
c00088ea:	68 80 00 00 00       	push   $0x80
c00088ef:	6a 00                	push   $0x0
c00088f1:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c00088f7:	50                   	push   %eax
c00088f8:	e8 f5 2a 00 00       	call   c000b3f2 <Memset>
c00088fd:	83 c4 10             	add    $0x10,%esp
c0008900:	83 ec 04             	sub    $0x4,%esp
c0008903:	68 80 00 00 00       	push   $0x80
c0008908:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000890e:	50                   	push   %eax
c000890f:	ff 75 e0             	pushl  -0x20(%ebp)
c0008912:	e8 35 d4 ff ff       	call   c0005d4c <read>
c0008917:	83 c4 10             	add    $0x10,%esp
c000891a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008921:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008928:	8d 85 42 ff ff ff    	lea    -0xbe(%ebp),%eax
c000892e:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008931:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008934:	0f b6 00             	movzbl (%eax),%eax
c0008937:	88 45 db             	mov    %al,-0x25(%ebp)
c000893a:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000893d:	0f b6 00             	movzbl (%eax),%eax
c0008940:	3c 20                	cmp    $0x20,%al
c0008942:	74 1d                	je     c0008961 <simple_shell+0xbf>
c0008944:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008947:	0f b6 00             	movzbl (%eax),%eax
c000894a:	84 c0                	test   %al,%al
c000894c:	74 13                	je     c0008961 <simple_shell+0xbf>
c000894e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008952:	75 0d                	jne    c0008961 <simple_shell+0xbf>
c0008954:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008957:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000895a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008961:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008964:	0f b6 00             	movzbl (%eax),%eax
c0008967:	3c 20                	cmp    $0x20,%al
c0008969:	74 0a                	je     c0008975 <simple_shell+0xd3>
c000896b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000896e:	0f b6 00             	movzbl (%eax),%eax
c0008971:	84 c0                	test   %al,%al
c0008973:	75 26                	jne    c000899b <simple_shell+0xf9>
c0008975:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008979:	75 20                	jne    c000899b <simple_shell+0xf9>
c000897b:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000897e:	8d 50 01             	lea    0x1(%eax),%edx
c0008981:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008984:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008987:	89 94 85 14 ff ff ff 	mov    %edx,-0xec(%ebp,%eax,4)
c000898e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008991:	c6 00 00             	movb   $0x0,(%eax)
c0008994:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000899b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000899f:	80 7d db 00          	cmpb   $0x0,-0x25(%ebp)
c00089a3:	75 8c                	jne    c0008931 <simple_shell+0x8f>
c00089a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00089a8:	c7 84 85 14 ff ff ff 	movl   $0x0,-0xec(%ebp,%eax,4)
c00089af:	00 00 00 00 
c00089b3:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
c00089ba:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c00089c0:	83 ec 08             	sub    $0x8,%esp
c00089c3:	6a 02                	push   $0x2
c00089c5:	50                   	push   %eax
c00089c6:	e8 fc d2 ff ff       	call   c0005cc7 <open>
c00089cb:	83 c4 10             	add    $0x10,%esp
c00089ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00089d1:	83 7d d0 ff          	cmpl   $0xffffffff,-0x30(%ebp)
c00089d5:	75 54                	jne    c0008a2b <simple_shell+0x189>
c00089d7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c00089de:	eb 29                	jmp    c0008a09 <simple_shell+0x167>
c00089e0:	8b 95 14 ff ff ff    	mov    -0xec(%ebp),%edx
c00089e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c00089e9:	01 d0                	add    %edx,%eax
c00089eb:	0f b6 00             	movzbl (%eax),%eax
c00089ee:	0f be c0             	movsbl %al,%eax
c00089f1:	83 ec 04             	sub    $0x4,%esp
c00089f4:	50                   	push   %eax
c00089f5:	ff 75 e4             	pushl  -0x1c(%ebp)
c00089f8:	68 88 b0 00 c0       	push   $0xc000b088
c00089fd:	e8 1d 05 00 00       	call   c0008f1f <Printf>
c0008a02:	83 c4 10             	add    $0x10,%esp
c0008a05:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008a09:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
c0008a0d:	7e d1                	jle    c00089e0 <simple_shell+0x13e>
c0008a0f:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008a15:	83 ec 08             	sub    $0x8,%esp
c0008a18:	50                   	push   %eax
c0008a19:	68 8f b0 00 c0       	push   $0xc000b08f
c0008a1e:	e8 fc 04 00 00       	call   c0008f1f <Printf>
c0008a23:	83 c4 10             	add    $0x10,%esp
c0008a26:	e9 bc fe ff ff       	jmp    c00088e7 <simple_shell+0x45>
c0008a2b:	e8 c8 d4 ff ff       	call   c0005ef8 <fork>
c0008a30:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0008a33:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
c0008a37:	7e 17                	jle    c0008a50 <simple_shell+0x1ae>
c0008a39:	83 ec 0c             	sub    $0xc,%esp
c0008a3c:	8d 85 3c ff ff ff    	lea    -0xc4(%ebp),%eax
c0008a42:	50                   	push   %eax
c0008a43:	e8 49 d4 ff ff       	call   c0005e91 <wait>
c0008a48:	83 c4 10             	add    $0x10,%esp
c0008a4b:	e9 97 fe ff ff       	jmp    c00088e7 <simple_shell+0x45>
c0008a50:	83 ec 0c             	sub    $0xc,%esp
c0008a53:	ff 75 d0             	pushl  -0x30(%ebp)
c0008a56:	e8 ea d3 ff ff       	call   c0005e45 <close>
c0008a5b:	83 c4 10             	add    $0x10,%esp
c0008a5e:	8b 85 14 ff ff ff    	mov    -0xec(%ebp),%eax
c0008a64:	83 ec 08             	sub    $0x8,%esp
c0008a67:	8d 95 14 ff ff ff    	lea    -0xec(%ebp),%edx
c0008a6d:	52                   	push   %edx
c0008a6e:	50                   	push   %eax
c0008a6f:	e8 73 d5 ff ff       	call   c0005fe7 <execv>
c0008a74:	83 c4 10             	add    $0x10,%esp
c0008a77:	eb fe                	jmp    c0008a77 <simple_shell+0x1d5>

c0008a79 <test_split_str>:
c0008a79:	55                   	push   %ebp
c0008a7a:	89 e5                	mov    %esp,%ebp
c0008a7c:	81 ec b8 01 00 00    	sub    $0x1b8,%esp
c0008a82:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008a89:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008a90:	c7 45 ec 95 b0 00 c0 	movl   $0xc000b095,-0x14(%ebp)
c0008a97:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008a9b:	75 1a                	jne    c0008ab7 <test_split_str+0x3e>
c0008a9d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008aa0:	0f b6 00             	movzbl (%eax),%eax
c0008aa3:	0f be c0             	movsbl %al,%eax
c0008aa6:	83 ec 08             	sub    $0x8,%esp
c0008aa9:	50                   	push   %eax
c0008aaa:	68 a6 b0 00 c0       	push   $0xc000b0a6
c0008aaf:	e8 6b 04 00 00       	call   c0008f1f <Printf>
c0008ab4:	83 c4 10             	add    $0x10,%esp
c0008ab7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008aba:	0f b6 00             	movzbl (%eax),%eax
c0008abd:	3c 20                	cmp    $0x20,%al
c0008abf:	75 0a                	jne    c0008acb <test_split_str+0x52>
c0008ac1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ac4:	0f b6 00             	movzbl (%eax),%eax
c0008ac7:	84 c0                	test   %al,%al
c0008ac9:	74 13                	je     c0008ade <test_split_str+0x65>
c0008acb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008acf:	75 0d                	jne    c0008ade <test_split_str+0x65>
c0008ad1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ad4:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0008ad7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
c0008ade:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008ae1:	0f b6 00             	movzbl (%eax),%eax
c0008ae4:	3c 20                	cmp    $0x20,%al
c0008ae6:	74 0a                	je     c0008af2 <test_split_str+0x79>
c0008ae8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008aeb:	0f b6 00             	movzbl (%eax),%eax
c0008aee:	84 c0                	test   %al,%al
c0008af0:	75 26                	jne    c0008b18 <test_split_str+0x9f>
c0008af2:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
c0008af6:	75 20                	jne    c0008b18 <test_split_str+0x9f>
c0008af8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008afb:	8d 50 01             	lea    0x1(%eax),%edx
c0008afe:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008b01:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008b04:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008b0b:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b0e:	c6 00 00             	movb   $0x0,(%eax)
c0008b11:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c0008b18:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c0008b1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0008b1f:	0f b6 00             	movzbl (%eax),%eax
c0008b22:	84 c0                	test   %al,%al
c0008b24:	0f 85 6d ff ff ff    	jne    c0008a97 <test_split_str+0x1e>
c0008b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008b2d:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0008b30:	89 94 85 50 fe ff ff 	mov    %edx,-0x1b0(%ebp,%eax,4)
c0008b37:	83 ec 08             	sub    $0x8,%esp
c0008b3a:	ff 75 f4             	pushl  -0xc(%ebp)
c0008b3d:	68 af b0 00 c0       	push   $0xc000b0af
c0008b42:	e8 d8 03 00 00       	call   c0008f1f <Printf>
c0008b47:	83 c4 10             	add    $0x10,%esp
c0008b4a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
c0008b51:	eb 22                	jmp    c0008b75 <test_split_str+0xfc>
c0008b53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008b56:	8b 84 85 50 fe ff ff 	mov    -0x1b0(%ebp,%eax,4),%eax
c0008b5d:	83 ec 04             	sub    $0x4,%esp
c0008b60:	50                   	push   %eax
c0008b61:	ff 75 e4             	pushl  -0x1c(%ebp)
c0008b64:	68 c6 b0 00 c0       	push   $0xc000b0c6
c0008b69:	e8 b1 03 00 00       	call   c0008f1f <Printf>
c0008b6e:	83 c4 10             	add    $0x10,%esp
c0008b71:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
c0008b75:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0008b78:	3b 45 f4             	cmp    -0xc(%ebp),%eax
c0008b7b:	7e d6                	jle    c0008b53 <test_split_str+0xda>
c0008b7d:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008b83:	83 ec 08             	sub    $0x8,%esp
c0008b86:	68 d5 b0 00 c0       	push   $0xc000b0d5
c0008b8b:	50                   	push   %eax
c0008b8c:	e8 a9 12 00 00       	call   c0009e3a <strcmp>
c0008b91:	83 c4 10             	add    $0x10,%esp
c0008b94:	85 c0                	test   %eax,%eax
c0008b96:	75 10                	jne    c0008ba8 <test_split_str+0x12f>
c0008b98:	83 ec 0c             	sub    $0xc,%esp
c0008b9b:	68 da b0 00 c0       	push   $0xc000b0da
c0008ba0:	e8 7a 03 00 00       	call   c0008f1f <Printf>
c0008ba5:	83 c4 10             	add    $0x10,%esp
c0008ba8:	8b 85 50 fe ff ff    	mov    -0x1b0(%ebp),%eax
c0008bae:	83 ec 08             	sub    $0x8,%esp
c0008bb1:	50                   	push   %eax
c0008bb2:	68 e6 b0 00 c0       	push   $0xc000b0e6
c0008bb7:	e8 63 03 00 00       	call   c0008f1f <Printf>
c0008bbc:	83 c4 10             	add    $0x10,%esp
c0008bbf:	83 ec 0c             	sub    $0xc,%esp
c0008bc2:	68 f4 b0 00 c0       	push   $0xc000b0f4
c0008bc7:	e8 53 03 00 00       	call   c0008f1f <Printf>
c0008bcc:	83 c4 10             	add    $0x10,%esp
c0008bcf:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c0008bd6:	eb 26                	jmp    c0008bfe <test_split_str+0x185>
c0008bd8:	8b 95 50 fe ff ff    	mov    -0x1b0(%ebp),%edx
c0008bde:	8b 45 e0             	mov    -0x20(%ebp),%eax
c0008be1:	01 d0                	add    %edx,%eax
c0008be3:	0f b6 00             	movzbl (%eax),%eax
c0008be6:	0f be c0             	movsbl %al,%eax
c0008be9:	83 ec 08             	sub    $0x8,%esp
c0008bec:	50                   	push   %eax
c0008bed:	68 03 b1 00 c0       	push   $0xc000b103
c0008bf2:	e8 28 03 00 00       	call   c0008f1f <Printf>
c0008bf7:	83 c4 10             	add    $0x10,%esp
c0008bfa:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
c0008bfe:	83 7d e0 05          	cmpl   $0x5,-0x20(%ebp)
c0008c02:	7e d4                	jle    c0008bd8 <test_split_str+0x15f>
c0008c04:	c9                   	leave  
c0008c05:	c3                   	ret    

c0008c06 <test_shell>:
c0008c06:	55                   	push   %ebp
c0008c07:	89 e5                	mov    %esp,%ebp
c0008c09:	83 ec 48             	sub    $0x48,%esp
c0008c0c:	c7 45 e2 64 65 76 5f 	movl   $0x5f766564,-0x1e(%ebp)
c0008c13:	c7 45 e6 74 74 79 31 	movl   $0x31797474,-0x1a(%ebp)
c0008c1a:	66 c7 45 ea 00 00    	movw   $0x0,-0x16(%ebp)
c0008c20:	83 ec 08             	sub    $0x8,%esp
c0008c23:	6a 02                	push   $0x2
c0008c25:	8d 45 e2             	lea    -0x1e(%ebp),%eax
c0008c28:	50                   	push   %eax
c0008c29:	e8 99 d0 ff ff       	call   c0005cc7 <open>
c0008c2e:	83 c4 10             	add    $0x10,%esp
c0008c31:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008c34:	c7 45 ce 69 6e 73 74 	movl   $0x74736e69,-0x32(%ebp)
c0008c3b:	c7 45 d2 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2e(%ebp)
c0008c42:	c7 45 d6 74 61 72 00 	movl   $0x726174,-0x2a(%ebp)
c0008c49:	c7 45 da 00 00 00 00 	movl   $0x0,-0x26(%ebp)
c0008c50:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008c57:	83 ec 0c             	sub    $0xc,%esp
c0008c5a:	8d 45 ce             	lea    -0x32(%ebp),%eax
c0008c5d:	50                   	push   %eax
c0008c5e:	e8 44 eb ff ff       	call   c00077a7 <untar>
c0008c63:	83 c4 10             	add    $0x10,%esp
c0008c66:	e8 8d d2 ff ff       	call   c0005ef8 <fork>
c0008c6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008c6e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008c72:	7e 25                	jle    c0008c99 <test_shell+0x93>
c0008c74:	83 ec 0c             	sub    $0xc,%esp
c0008c77:	8d 45 c8             	lea    -0x38(%ebp),%eax
c0008c7a:	50                   	push   %eax
c0008c7b:	e8 11 d2 ff ff       	call   c0005e91 <wait>
c0008c80:	83 c4 10             	add    $0x10,%esp
c0008c83:	8b 45 c8             	mov    -0x38(%ebp),%eax
c0008c86:	83 ec 08             	sub    $0x8,%esp
c0008c89:	50                   	push   %eax
c0008c8a:	68 0c b1 00 c0       	push   $0xc000b10c
c0008c8f:	e8 8b 02 00 00       	call   c0008f1f <Printf>
c0008c94:	83 c4 10             	add    $0x10,%esp
c0008c97:	eb 23                	jmp    c0008cbc <test_shell+0xb6>
c0008c99:	83 ec 0c             	sub    $0xc,%esp
c0008c9c:	68 1e b1 00 c0       	push   $0xc000b11e
c0008ca1:	e8 79 02 00 00       	call   c0008f1f <Printf>
c0008ca6:	83 c4 10             	add    $0x10,%esp
c0008ca9:	83 ec 0c             	sub    $0xc,%esp
c0008cac:	ff 75 f4             	pushl  -0xc(%ebp)
c0008caf:	e8 91 d1 ff ff       	call   c0005e45 <close>
c0008cb4:	83 c4 10             	add    $0x10,%esp
c0008cb7:	e8 e6 fb ff ff       	call   c00088a2 <simple_shell>
c0008cbc:	83 ec 0c             	sub    $0xc,%esp
c0008cbf:	8d 45 c4             	lea    -0x3c(%ebp),%eax
c0008cc2:	50                   	push   %eax
c0008cc3:	e8 c9 d1 ff ff       	call   c0005e91 <wait>
c0008cc8:	83 c4 10             	add    $0x10,%esp
c0008ccb:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008cce:	8b 45 c4             	mov    -0x3c(%ebp),%eax
c0008cd1:	83 ec 08             	sub    $0x8,%esp
c0008cd4:	50                   	push   %eax
c0008cd5:	68 2c b1 00 c0       	push   $0xc000b12c
c0008cda:	e8 40 02 00 00       	call   c0008f1f <Printf>
c0008cdf:	83 c4 10             	add    $0x10,%esp
c0008ce2:	eb d8                	jmp    c0008cbc <test_shell+0xb6>

c0008ce4 <test_exec>:
c0008ce4:	55                   	push   %ebp
c0008ce5:	89 e5                	mov    %esp,%ebp
c0008ce7:	83 ec 38             	sub    $0x38,%esp
c0008cea:	c7 45 e6 64 65 76 5f 	movl   $0x5f766564,-0x1a(%ebp)
c0008cf1:	c7 45 ea 74 74 79 31 	movl   $0x31797474,-0x16(%ebp)
c0008cf8:	66 c7 45 ee 00 00    	movw   $0x0,-0x12(%ebp)
c0008cfe:	83 ec 08             	sub    $0x8,%esp
c0008d01:	6a 02                	push   $0x2
c0008d03:	8d 45 e6             	lea    -0x1a(%ebp),%eax
c0008d06:	50                   	push   %eax
c0008d07:	e8 bb cf ff ff       	call   c0005cc7 <open>
c0008d0c:	83 c4 10             	add    $0x10,%esp
c0008d0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008d12:	c7 45 d2 69 6e 73 74 	movl   $0x74736e69,-0x2e(%ebp)
c0008d19:	c7 45 d6 61 6c 6c 2e 	movl   $0x2e6c6c61,-0x2a(%ebp)
c0008d20:	c7 45 da 74 61 72 00 	movl   $0x726174,-0x26(%ebp)
c0008d27:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
c0008d2e:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
c0008d35:	83 ec 0c             	sub    $0xc,%esp
c0008d38:	8d 45 d2             	lea    -0x2e(%ebp),%eax
c0008d3b:	50                   	push   %eax
c0008d3c:	e8 66 ea ff ff       	call   c00077a7 <untar>
c0008d41:	83 c4 10             	add    $0x10,%esp
c0008d44:	e8 af d1 ff ff       	call   c0005ef8 <fork>
c0008d49:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008d4c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0008d50:	7e 25                	jle    c0008d77 <test_exec+0x93>
c0008d52:	83 ec 0c             	sub    $0xc,%esp
c0008d55:	8d 45 cc             	lea    -0x34(%ebp),%eax
c0008d58:	50                   	push   %eax
c0008d59:	e8 33 d1 ff ff       	call   c0005e91 <wait>
c0008d5e:	83 c4 10             	add    $0x10,%esp
c0008d61:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0008d64:	83 ec 08             	sub    $0x8,%esp
c0008d67:	50                   	push   %eax
c0008d68:	68 0c b1 00 c0       	push   $0xc000b10c
c0008d6d:	e8 ad 01 00 00       	call   c0008f1f <Printf>
c0008d72:	83 c4 10             	add    $0x10,%esp
c0008d75:	eb 33                	jmp    c0008daa <test_exec+0xc6>
c0008d77:	83 ec 0c             	sub    $0xc,%esp
c0008d7a:	68 1e b1 00 c0       	push   $0xc000b11e
c0008d7f:	e8 9b 01 00 00       	call   c0008f1f <Printf>
c0008d84:	83 c4 10             	add    $0x10,%esp
c0008d87:	83 ec 0c             	sub    $0xc,%esp
c0008d8a:	6a 00                	push   $0x0
c0008d8c:	68 47 b1 00 c0       	push   $0xc000b147
c0008d91:	68 4d b1 00 c0       	push   $0xc000b14d
c0008d96:	68 d5 b0 00 c0       	push   $0xc000b0d5
c0008d9b:	68 53 b1 00 c0       	push   $0xc000b153
c0008da0:	e8 e7 d3 ff ff       	call   c000618c <execl>
c0008da5:	83 c4 20             	add    $0x20,%esp
c0008da8:	eb fe                	jmp    c0008da8 <test_exec+0xc4>
c0008daa:	c9                   	leave  
c0008dab:	c3                   	ret    

c0008dac <INIT>:
c0008dac:	55                   	push   %ebp
c0008dad:	89 e5                	mov    %esp,%ebp
c0008daf:	83 ec 08             	sub    $0x8,%esp
c0008db2:	e8 4f fe ff ff       	call   c0008c06 <test_shell>
c0008db7:	eb fe                	jmp    c0008db7 <INIT+0xb>

c0008db9 <TestA>:
c0008db9:	55                   	push   %ebp
c0008dba:	89 e5                	mov    %esp,%ebp
c0008dbc:	83 ec 08             	sub    $0x8,%esp
c0008dbf:	83 ec 0c             	sub    $0xc,%esp
c0008dc2:	6a 05                	push   $0x5
c0008dc4:	e8 8e ec ff ff       	call   c0007a57 <disp_int>
c0008dc9:	83 c4 10             	add    $0x10,%esp
c0008dcc:	83 ec 0c             	sub    $0xc,%esp
c0008dcf:	68 d4 ac 00 c0       	push   $0xc000acd4
c0008dd4:	e8 b3 87 ff ff       	call   c000158c <disp_str>
c0008dd9:	83 c4 10             	add    $0x10,%esp
c0008ddc:	83 ec 0c             	sub    $0xc,%esp
c0008ddf:	68 59 b1 00 c0       	push   $0xc000b159
c0008de4:	e8 a3 87 ff ff       	call   c000158c <disp_str>
c0008de9:	83 c4 10             	add    $0x10,%esp
c0008dec:	eb fe                	jmp    c0008dec <TestA+0x33>

c0008dee <delay>:
c0008dee:	55                   	push   %ebp
c0008def:	89 e5                	mov    %esp,%ebp
c0008df1:	83 ec 10             	sub    $0x10,%esp
c0008df4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
c0008dfb:	eb 2d                	jmp    c0008e2a <delay+0x3c>
c0008dfd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
c0008e04:	eb 1a                	jmp    c0008e20 <delay+0x32>
c0008e06:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008e0d:	eb 04                	jmp    c0008e13 <delay+0x25>
c0008e0f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008e13:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
c0008e1a:	7e f3                	jle    c0008e0f <delay+0x21>
c0008e1c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0008e20:	83 7d f8 09          	cmpl   $0x9,-0x8(%ebp)
c0008e24:	7e e0                	jle    c0008e06 <delay+0x18>
c0008e26:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0008e2a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0008e2d:	3b 45 08             	cmp    0x8(%ebp),%eax
c0008e30:	7c cb                	jl     c0008dfd <delay+0xf>
c0008e32:	90                   	nop
c0008e33:	c9                   	leave  
c0008e34:	c3                   	ret    

c0008e35 <TestB>:
c0008e35:	55                   	push   %ebp
c0008e36:	89 e5                	mov    %esp,%ebp
c0008e38:	83 ec 08             	sub    $0x8,%esp
c0008e3b:	83 ec 0c             	sub    $0xc,%esp
c0008e3e:	68 60 b1 00 c0       	push   $0xc000b160
c0008e43:	e8 44 87 ff ff       	call   c000158c <disp_str>
c0008e48:	83 c4 10             	add    $0x10,%esp
c0008e4b:	eb fe                	jmp    c0008e4b <TestB+0x16>

c0008e4d <TestC>:
c0008e4d:	55                   	push   %ebp
c0008e4e:	89 e5                	mov    %esp,%ebp
c0008e50:	83 ec 18             	sub    $0x18,%esp
c0008e53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0008e5a:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
c0008e5e:	77 1a                	ja     c0008e7a <TestC+0x2d>
c0008e60:	c7 45 f0 05 00 00 00 	movl   $0x5,-0x10(%ebp)
c0008e67:	83 ec 08             	sub    $0x8,%esp
c0008e6a:	ff 75 f0             	pushl  -0x10(%ebp)
c0008e6d:	68 63 b1 00 c0       	push   $0xc000b163
c0008e72:	e8 a8 00 00 00       	call   c0008f1f <Printf>
c0008e77:	83 c4 10             	add    $0x10,%esp
c0008e7a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c0008e7e:	eb da                	jmp    c0008e5a <TestC+0xd>

c0008e80 <sys_get_ticks>:
c0008e80:	55                   	push   %ebp
c0008e81:	89 e5                	mov    %esp,%ebp
c0008e83:	a1 c0 1e 01 c0       	mov    0xc0011ec0,%eax
c0008e88:	5d                   	pop    %ebp
c0008e89:	c3                   	ret    

c0008e8a <sys_write>:
c0008e8a:	55                   	push   %ebp
c0008e8b:	89 e5                	mov    %esp,%ebp
c0008e8d:	83 ec 18             	sub    $0x18,%esp
c0008e90:	8b 45 10             	mov    0x10(%ebp),%eax
c0008e93:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c0008e99:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c0008e9f:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c0008ea4:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0008ea7:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008eaa:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008ead:	8b 45 08             	mov    0x8(%ebp),%eax
c0008eb0:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008eb3:	eb 20                	jmp    c0008ed5 <sys_write+0x4b>
c0008eb5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0008eb8:	0f b6 00             	movzbl (%eax),%eax
c0008ebb:	0f b6 c0             	movzbl %al,%eax
c0008ebe:	83 ec 08             	sub    $0x8,%esp
c0008ec1:	50                   	push   %eax
c0008ec2:	ff 75 ec             	pushl  -0x14(%ebp)
c0008ec5:	e8 89 c1 ff ff       	call   c0005053 <out_char>
c0008eca:	83 c4 10             	add    $0x10,%esp
c0008ecd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0008ed1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
c0008ed5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
c0008ed9:	7f da                	jg     c0008eb5 <sys_write+0x2b>
c0008edb:	90                   	nop
c0008edc:	c9                   	leave  
c0008edd:	c3                   	ret    

c0008ede <milli_delay>:
c0008ede:	55                   	push   %ebp
c0008edf:	89 e5                	mov    %esp,%ebp
c0008ee1:	83 ec 18             	sub    $0x18,%esp
c0008ee4:	e8 7d 0d 00 00       	call   c0009c66 <get_ticks_ipc>
c0008ee9:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008eec:	90                   	nop
c0008eed:	e8 74 0d 00 00       	call   c0009c66 <get_ticks_ipc>
c0008ef2:	2b 45 f4             	sub    -0xc(%ebp),%eax
c0008ef5:	89 c1                	mov    %eax,%ecx
c0008ef7:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
c0008efc:	89 c8                	mov    %ecx,%eax
c0008efe:	f7 ea                	imul   %edx
c0008f00:	c1 fa 05             	sar    $0x5,%edx
c0008f03:	89 c8                	mov    %ecx,%eax
c0008f05:	c1 f8 1f             	sar    $0x1f,%eax
c0008f08:	29 c2                	sub    %eax,%edx
c0008f0a:	89 d0                	mov    %edx,%eax
c0008f0c:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
c0008f12:	39 45 08             	cmp    %eax,0x8(%ebp)
c0008f15:	77 d6                	ja     c0008eed <milli_delay+0xf>
c0008f17:	90                   	nop
c0008f18:	c9                   	leave  
c0008f19:	c3                   	ret    

c0008f1a <TaskSys>:
c0008f1a:	55                   	push   %ebp
c0008f1b:	89 e5                	mov    %esp,%ebp
c0008f1d:	eb fe                	jmp    c0008f1d <TaskSys+0x3>

c0008f1f <Printf>:
c0008f1f:	55                   	push   %ebp
c0008f20:	89 e5                	mov    %esp,%ebp
c0008f22:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0008f28:	83 ec 04             	sub    $0x4,%esp
c0008f2b:	68 00 01 00 00       	push   $0x100
c0008f30:	6a 00                	push   $0x0
c0008f32:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008f38:	50                   	push   %eax
c0008f39:	e8 b4 24 00 00       	call   c000b3f2 <Memset>
c0008f3e:	83 c4 10             	add    $0x10,%esp
c0008f41:	8d 45 0c             	lea    0xc(%ebp),%eax
c0008f44:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008f47:	8b 45 08             	mov    0x8(%ebp),%eax
c0008f4a:	83 ec 04             	sub    $0x4,%esp
c0008f4d:	ff 75 f4             	pushl  -0xc(%ebp)
c0008f50:	50                   	push   %eax
c0008f51:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008f57:	50                   	push   %eax
c0008f58:	e8 20 00 00 00       	call   c0008f7d <vsprintf>
c0008f5d:	83 c4 10             	add    $0x10,%esp
c0008f60:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008f63:	83 ec 04             	sub    $0x4,%esp
c0008f66:	ff 75 f0             	pushl  -0x10(%ebp)
c0008f69:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0008f6f:	50                   	push   %eax
c0008f70:	6a 00                	push   $0x0
c0008f72:	e8 49 ce ff ff       	call   c0005dc0 <write>
c0008f77:	83 c4 10             	add    $0x10,%esp
c0008f7a:	90                   	nop
c0008f7b:	c9                   	leave  
c0008f7c:	c3                   	ret    

c0008f7d <vsprintf>:
c0008f7d:	55                   	push   %ebp
c0008f7e:	89 e5                	mov    %esp,%ebp
c0008f80:	81 ec 68 02 00 00    	sub    $0x268,%esp
c0008f86:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0008f8c:	89 85 e4 fd ff ff    	mov    %eax,-0x21c(%ebp)
c0008f92:	83 ec 04             	sub    $0x4,%esp
c0008f95:	6a 40                	push   $0x40
c0008f97:	6a 00                	push   $0x0
c0008f99:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0008f9f:	50                   	push   %eax
c0008fa0:	e8 4d 24 00 00       	call   c000b3f2 <Memset>
c0008fa5:	83 c4 10             	add    $0x10,%esp
c0008fa8:	8b 45 10             	mov    0x10(%ebp),%eax
c0008fab:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0008fae:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0008fb5:	8b 45 08             	mov    0x8(%ebp),%eax
c0008fb8:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0008fbb:	e9 53 01 00 00       	jmp    c0009113 <vsprintf+0x196>
c0008fc0:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008fc3:	0f b6 00             	movzbl (%eax),%eax
c0008fc6:	3c 25                	cmp    $0x25,%al
c0008fc8:	74 16                	je     c0008fe0 <vsprintf+0x63>
c0008fca:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0008fcd:	8d 50 01             	lea    0x1(%eax),%edx
c0008fd0:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0008fd3:	8b 55 0c             	mov    0xc(%ebp),%edx
c0008fd6:	0f b6 12             	movzbl (%edx),%edx
c0008fd9:	88 10                	mov    %dl,(%eax)
c0008fdb:	e9 2f 01 00 00       	jmp    c000910f <vsprintf+0x192>
c0008fe0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0008fe4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0008fe7:	0f b6 00             	movzbl (%eax),%eax
c0008fea:	0f be c0             	movsbl %al,%eax
c0008fed:	83 f8 64             	cmp    $0x64,%eax
c0008ff0:	74 26                	je     c0009018 <vsprintf+0x9b>
c0008ff2:	83 f8 64             	cmp    $0x64,%eax
c0008ff5:	7f 0e                	jg     c0009005 <vsprintf+0x88>
c0008ff7:	83 f8 63             	cmp    $0x63,%eax
c0008ffa:	0f 84 f2 00 00 00    	je     c00090f2 <vsprintf+0x175>
c0009000:	e9 0a 01 00 00       	jmp    c000910f <vsprintf+0x192>
c0009005:	83 f8 73             	cmp    $0x73,%eax
c0009008:	0f 84 b0 00 00 00    	je     c00090be <vsprintf+0x141>
c000900e:	83 f8 78             	cmp    $0x78,%eax
c0009011:	74 5d                	je     c0009070 <vsprintf+0xf3>
c0009013:	e9 f7 00 00 00       	jmp    c000910f <vsprintf+0x192>
c0009018:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000901b:	8b 00                	mov    (%eax),%eax
c000901d:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009020:	83 ec 04             	sub    $0x4,%esp
c0009023:	6a 0a                	push   $0xa
c0009025:	8d 85 e4 fd ff ff    	lea    -0x21c(%ebp),%eax
c000902b:	50                   	push   %eax
c000902c:	ff 75 e8             	pushl  -0x18(%ebp)
c000902f:	e8 7d 0c 00 00       	call   c0009cb1 <itoa>
c0009034:	83 c4 10             	add    $0x10,%esp
c0009037:	83 ec 08             	sub    $0x8,%esp
c000903a:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009040:	50                   	push   %eax
c0009041:	ff 75 f4             	pushl  -0xc(%ebp)
c0009044:	e8 c8 23 00 00       	call   c000b411 <Strcpy>
c0009049:	83 c4 10             	add    $0x10,%esp
c000904c:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009050:	83 ec 0c             	sub    $0xc,%esp
c0009053:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
c0009059:	50                   	push   %eax
c000905a:	e8 cc 23 00 00       	call   c000b42b <Strlen>
c000905f:	83 c4 10             	add    $0x10,%esp
c0009062:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009065:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009068:	01 45 f4             	add    %eax,-0xc(%ebp)
c000906b:	e9 9f 00 00 00       	jmp    c000910f <vsprintf+0x192>
c0009070:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009073:	8b 00                	mov    (%eax),%eax
c0009075:	83 ec 08             	sub    $0x8,%esp
c0009078:	50                   	push   %eax
c0009079:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c000907f:	50                   	push   %eax
c0009080:	e8 2c e9 ff ff       	call   c00079b1 <atoi>
c0009085:	83 c4 10             	add    $0x10,%esp
c0009088:	83 ec 08             	sub    $0x8,%esp
c000908b:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c0009091:	50                   	push   %eax
c0009092:	ff 75 f4             	pushl  -0xc(%ebp)
c0009095:	e8 77 23 00 00       	call   c000b411 <Strcpy>
c000909a:	83 c4 10             	add    $0x10,%esp
c000909d:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00090a1:	83 ec 0c             	sub    $0xc,%esp
c00090a4:	8d 85 a4 fd ff ff    	lea    -0x25c(%ebp),%eax
c00090aa:	50                   	push   %eax
c00090ab:	e8 7b 23 00 00       	call   c000b42b <Strlen>
c00090b0:	83 c4 10             	add    $0x10,%esp
c00090b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00090b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00090b9:	01 45 f4             	add    %eax,-0xc(%ebp)
c00090bc:	eb 51                	jmp    c000910f <vsprintf+0x192>
c00090be:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090c1:	8b 00                	mov    (%eax),%eax
c00090c3:	83 ec 08             	sub    $0x8,%esp
c00090c6:	50                   	push   %eax
c00090c7:	ff 75 f4             	pushl  -0xc(%ebp)
c00090ca:	e8 42 23 00 00       	call   c000b411 <Strcpy>
c00090cf:	83 c4 10             	add    $0x10,%esp
c00090d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090d5:	8b 00                	mov    (%eax),%eax
c00090d7:	83 ec 0c             	sub    $0xc,%esp
c00090da:	50                   	push   %eax
c00090db:	e8 4b 23 00 00       	call   c000b42b <Strlen>
c00090e0:	83 c4 10             	add    $0x10,%esp
c00090e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00090e6:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c00090ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00090ed:	01 45 f4             	add    %eax,-0xc(%ebp)
c00090f0:	eb 1d                	jmp    c000910f <vsprintf+0x192>
c00090f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00090f5:	0f b6 10             	movzbl (%eax),%edx
c00090f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00090fb:	88 10                	mov    %dl,(%eax)
c00090fd:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
c0009101:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009108:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000910b:	01 45 f4             	add    %eax,-0xc(%ebp)
c000910e:	90                   	nop
c000910f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
c0009113:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009116:	0f b6 00             	movzbl (%eax),%eax
c0009119:	84 c0                	test   %al,%al
c000911b:	0f 85 9f fe ff ff    	jne    c0008fc0 <vsprintf+0x43>
c0009121:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009124:	2b 45 08             	sub    0x8(%ebp),%eax
c0009127:	c9                   	leave  
c0009128:	c3                   	ret    

c0009129 <printx>:
c0009129:	55                   	push   %ebp
c000912a:	89 e5                	mov    %esp,%ebp
c000912c:	81 ec 18 01 00 00    	sub    $0x118,%esp
c0009132:	8d 45 0c             	lea    0xc(%ebp),%eax
c0009135:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009138:	8b 45 08             	mov    0x8(%ebp),%eax
c000913b:	83 ec 04             	sub    $0x4,%esp
c000913e:	ff 75 f4             	pushl  -0xc(%ebp)
c0009141:	50                   	push   %eax
c0009142:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009148:	50                   	push   %eax
c0009149:	e8 2f fe ff ff       	call   c0008f7d <vsprintf>
c000914e:	83 c4 10             	add    $0x10,%esp
c0009151:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009154:	83 ec 08             	sub    $0x8,%esp
c0009157:	ff 75 f0             	pushl  -0x10(%ebp)
c000915a:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
c0009160:	50                   	push   %eax
c0009161:	e8 92 96 ff ff       	call   c00027f8 <write_debug>
c0009166:	83 c4 10             	add    $0x10,%esp
c0009169:	90                   	nop
c000916a:	c9                   	leave  
c000916b:	c3                   	ret    

c000916c <sys_printx>:
c000916c:	55                   	push   %ebp
c000916d:	89 e5                	mov    %esp,%ebp
c000916f:	83 ec 28             	sub    $0x28,%esp
c0009172:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0009177:	85 c0                	test   %eax,%eax
c0009179:	75 23                	jne    c000919e <sys_printx+0x32>
c000917b:	8b 45 10             	mov    0x10(%ebp),%eax
c000917e:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c0009184:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009187:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000918a:	83 ec 08             	sub    $0x8,%esp
c000918d:	ff 75 10             	pushl  0x10(%ebp)
c0009190:	50                   	push   %eax
c0009191:	e8 c1 b9 ff ff       	call   c0004b57 <Seg2PhyAddrLDT>
c0009196:	83 c4 10             	add    $0x10,%esp
c0009199:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000919c:	eb 19                	jmp    c00091b7 <sys_printx+0x4b>
c000919e:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c00091a3:	85 c0                	test   %eax,%eax
c00091a5:	74 10                	je     c00091b7 <sys_printx+0x4b>
c00091a7:	83 ec 0c             	sub    $0xc,%esp
c00091aa:	6a 30                	push   $0x30
c00091ac:	e8 65 b9 ff ff       	call   c0004b16 <Seg2PhyAddr>
c00091b1:	83 c4 10             	add    $0x10,%esp
c00091b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
c00091b7:	8b 55 08             	mov    0x8(%ebp),%edx
c00091ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
c00091bd:	01 d0                	add    %edx,%eax
c00091bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00091c2:	8b 45 10             	mov    0x10(%ebp),%eax
c00091c5:	8b 80 2c 01 00 00    	mov    0x12c(%eax),%eax
c00091cb:	69 c0 28 08 00 00    	imul   $0x828,%eax,%eax
c00091d1:	05 a0 fd 00 c0       	add    $0xc000fda0,%eax
c00091d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c00091d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
c00091dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00091df:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00091e2:	0f b6 00             	movzbl (%eax),%eax
c00091e5:	88 45 e3             	mov    %al,-0x1d(%ebp)
c00091e8:	eb 3a                	jmp    c0009224 <sys_printx+0xb8>
c00091ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00091ed:	0f b6 00             	movzbl (%eax),%eax
c00091f0:	3c 3b                	cmp    $0x3b,%al
c00091f2:	74 0a                	je     c00091fe <sys_printx+0x92>
c00091f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00091f7:	0f b6 00             	movzbl (%eax),%eax
c00091fa:	3c 3a                	cmp    $0x3a,%al
c00091fc:	75 06                	jne    c0009204 <sys_printx+0x98>
c00091fe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009202:	eb 20                	jmp    c0009224 <sys_printx+0xb8>
c0009204:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009207:	0f b6 00             	movzbl (%eax),%eax
c000920a:	0f b6 c0             	movzbl %al,%eax
c000920d:	83 ec 08             	sub    $0x8,%esp
c0009210:	50                   	push   %eax
c0009211:	ff 75 e4             	pushl  -0x1c(%ebp)
c0009214:	e8 3a be ff ff       	call   c0005053 <out_char>
c0009219:	83 c4 10             	add    $0x10,%esp
c000921c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c0009220:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
c0009224:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009228:	7f c0                	jg     c00091ea <sys_printx+0x7e>
c000922a:	80 7d e3 3b          	cmpb   $0x3b,-0x1d(%ebp)
c000922e:	75 10                	jne    c0009240 <sys_printx+0xd4>
c0009230:	a1 44 f7 00 c0       	mov    0xc000f744,%eax
c0009235:	85 c0                	test   %eax,%eax
c0009237:	74 13                	je     c000924c <sys_printx+0xe0>
c0009239:	e8 7a 85 ff ff       	call   c00017b8 <disable_int>
c000923e:	eb 0c                	jmp    c000924c <sys_printx+0xe0>
c0009240:	80 7d e3 3a          	cmpb   $0x3a,-0x1d(%ebp)
c0009244:	75 06                	jne    c000924c <sys_printx+0xe0>
c0009246:	e8 6d 85 ff ff       	call   c00017b8 <disable_int>
c000924b:	90                   	nop
c000924c:	90                   	nop
c000924d:	c9                   	leave  
c000924e:	c3                   	ret    

c000924f <spin>:
c000924f:	55                   	push   %ebp
c0009250:	89 e5                	mov    %esp,%ebp
c0009252:	83 ec 08             	sub    $0x8,%esp
c0009255:	83 ec 0c             	sub    $0xc,%esp
c0009258:	ff 75 08             	pushl  0x8(%ebp)
c000925b:	e8 2c 83 ff ff       	call   c000158c <disp_str>
c0009260:	83 c4 10             	add    $0x10,%esp
c0009263:	83 ec 0c             	sub    $0xc,%esp
c0009266:	68 d4 ac 00 c0       	push   $0xc000acd4
c000926b:	e8 1c 83 ff ff       	call   c000158c <disp_str>
c0009270:	83 c4 10             	add    $0x10,%esp
c0009273:	eb fe                	jmp    c0009273 <spin+0x24>

c0009275 <panic>:
c0009275:	55                   	push   %ebp
c0009276:	89 e5                	mov    %esp,%ebp
c0009278:	83 ec 08             	sub    $0x8,%esp
c000927b:	83 ec 04             	sub    $0x4,%esp
c000927e:	ff 75 08             	pushl  0x8(%ebp)
c0009281:	6a 3a                	push   $0x3a
c0009283:	68 70 b1 00 c0       	push   $0xc000b170
c0009288:	e8 9c fe ff ff       	call   c0009129 <printx>
c000928d:	83 c4 10             	add    $0x10,%esp
c0009290:	90                   	nop
c0009291:	c9                   	leave  
c0009292:	c3                   	ret    

c0009293 <assertion_failure>:
c0009293:	55                   	push   %ebp
c0009294:	89 e5                	mov    %esp,%ebp
c0009296:	83 ec 08             	sub    $0x8,%esp
c0009299:	83 ec 08             	sub    $0x8,%esp
c000929c:	ff 75 14             	pushl  0x14(%ebp)
c000929f:	ff 75 10             	pushl  0x10(%ebp)
c00092a2:	ff 75 0c             	pushl  0xc(%ebp)
c00092a5:	ff 75 08             	pushl  0x8(%ebp)
c00092a8:	6a 3b                	push   $0x3b
c00092aa:	68 78 b1 00 c0       	push   $0xc000b178
c00092af:	e8 75 fe ff ff       	call   c0009129 <printx>
c00092b4:	83 c4 20             	add    $0x20,%esp
c00092b7:	83 ec 0c             	sub    $0xc,%esp
c00092ba:	68 ab b1 00 c0       	push   $0xc000b1ab
c00092bf:	e8 8b ff ff ff       	call   c000924f <spin>
c00092c4:	83 c4 10             	add    $0x10,%esp
c00092c7:	90                   	nop
c00092c8:	c9                   	leave  
c00092c9:	c3                   	ret    

c00092ca <dead_lock>:
c00092ca:	55                   	push   %ebp
c00092cb:	89 e5                	mov    %esp,%ebp
c00092cd:	b8 00 00 00 00       	mov    $0x0,%eax
c00092d2:	5d                   	pop    %ebp
c00092d3:	c3                   	ret    

c00092d4 <sys_send_msg>:
c00092d4:	55                   	push   %ebp
c00092d5:	89 e5                	mov    %esp,%ebp
c00092d7:	83 ec 48             	sub    $0x48,%esp
c00092da:	83 ec 0c             	sub    $0xc,%esp
c00092dd:	ff 75 0c             	pushl  0xc(%ebp)
c00092e0:	e8 3d b7 ff ff       	call   c0004a22 <pid2proc>
c00092e5:	83 c4 10             	add    $0x10,%esp
c00092e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00092eb:	83 ec 0c             	sub    $0xc,%esp
c00092ee:	ff 75 10             	pushl  0x10(%ebp)
c00092f1:	e8 9c b7 ff ff       	call   c0004a92 <proc2pid>
c00092f6:	83 c4 10             	add    $0x10,%esp
c00092f9:	89 45 e8             	mov    %eax,-0x18(%ebp)
c00092fc:	8b 45 10             	mov    0x10(%ebp),%eax
c00092ff:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c0009305:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009308:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
c000930f:	8b 45 08             	mov    0x8(%ebp),%eax
c0009312:	83 ec 08             	sub    $0x8,%esp
c0009315:	6a 6c                	push   $0x6c
c0009317:	50                   	push   %eax
c0009318:	e8 80 da ff ff       	call   c0006d9d <alloc_virtual_memory>
c000931d:	83 c4 10             	add    $0x10,%esp
c0009320:	89 45 dc             	mov    %eax,-0x24(%ebp)
c0009323:	c7 45 d8 6c 00 00 00 	movl   $0x6c,-0x28(%ebp)
c000932a:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000932d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c0009330:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c0009333:	8b 55 e8             	mov    -0x18(%ebp),%edx
c0009336:	89 10                	mov    %edx,(%eax)
c0009338:	83 ec 08             	sub    $0x8,%esp
c000933b:	ff 75 0c             	pushl  0xc(%ebp)
c000933e:	ff 75 e8             	pushl  -0x18(%ebp)
c0009341:	e8 84 ff ff ff       	call   c00092ca <dead_lock>
c0009346:	83 c4 10             	add    $0x10,%esp
c0009349:	83 f8 01             	cmp    $0x1,%eax
c000934c:	75 10                	jne    c000935e <sys_send_msg+0x8a>
c000934e:	83 ec 0c             	sub    $0xc,%esp
c0009351:	68 b7 b1 00 c0       	push   $0xc000b1b7
c0009356:	e8 1a ff ff ff       	call   c0009275 <panic>
c000935b:	83 c4 10             	add    $0x10,%esp
c000935e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009361:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009368:	3c 02                	cmp    $0x2,%al
c000936a:	0f 85 8a 01 00 00    	jne    c00094fa <sys_send_msg+0x226>
c0009370:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009373:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009379:	39 45 e8             	cmp    %eax,-0x18(%ebp)
c000937c:	74 12                	je     c0009390 <sys_send_msg+0xbc>
c000937e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009381:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009387:	83 f8 0e             	cmp    $0xe,%eax
c000938a:	0f 85 6a 01 00 00    	jne    c00094fa <sys_send_msg+0x226>
c0009390:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009393:	8b 80 74 02 00 00    	mov    0x274(%eax),%eax
c0009399:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000939c:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000939f:	83 ec 08             	sub    $0x8,%esp
c00093a2:	ff 75 ec             	pushl  -0x14(%ebp)
c00093a5:	50                   	push   %eax
c00093a6:	e8 ac b7 ff ff       	call   c0004b57 <Seg2PhyAddrLDT>
c00093ab:	83 c4 10             	add    $0x10,%esp
c00093ae:	89 45 cc             	mov    %eax,-0x34(%ebp)
c00093b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093b4:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00093ba:	83 ec 08             	sub    $0x8,%esp
c00093bd:	6a 6c                	push   $0x6c
c00093bf:	50                   	push   %eax
c00093c0:	e8 d8 d9 ff ff       	call   c0006d9d <alloc_virtual_memory>
c00093c5:	83 c4 10             	add    $0x10,%esp
c00093c8:	89 45 c8             	mov    %eax,-0x38(%ebp)
c00093cb:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00093ce:	8b 45 c8             	mov    -0x38(%ebp),%eax
c00093d1:	83 ec 04             	sub    $0x4,%esp
c00093d4:	ff 75 d8             	pushl  -0x28(%ebp)
c00093d7:	52                   	push   %edx
c00093d8:	50                   	push   %eax
c00093d9:	e8 e6 1f 00 00       	call   c000b3c4 <Memcpy>
c00093de:	83 c4 10             	add    $0x10,%esp
c00093e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093e4:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c00093eb:	00 00 00 
c00093ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093f1:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c00093f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00093fb:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009402:	00 00 00 
c0009405:	8b 45 10             	mov    0x10(%ebp),%eax
c0009408:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c000940f:	00 00 00 
c0009412:	83 ec 0c             	sub    $0xc,%esp
c0009415:	ff 75 ec             	pushl  -0x14(%ebp)
c0009418:	e8 f9 07 00 00       	call   c0009c16 <unblock>
c000941d:	83 c4 10             	add    $0x10,%esp
c0009420:	8b 45 10             	mov    0x10(%ebp),%eax
c0009423:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000942a:	84 c0                	test   %al,%al
c000942c:	74 1c                	je     c000944a <sys_send_msg+0x176>
c000942e:	68 89 05 00 00       	push   $0x589
c0009433:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009438:	68 c2 b1 00 c0       	push   $0xc000b1c2
c000943d:	68 d2 b1 00 c0       	push   $0xc000b1d2
c0009442:	e8 4c fe ff ff       	call   c0009293 <assertion_failure>
c0009447:	83 c4 10             	add    $0x10,%esp
c000944a:	8b 45 10             	mov    0x10(%ebp),%eax
c000944d:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009453:	83 f8 1d             	cmp    $0x1d,%eax
c0009456:	74 1c                	je     c0009474 <sys_send_msg+0x1a0>
c0009458:	68 8a 05 00 00       	push   $0x58a
c000945d:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009462:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009467:	68 e6 b1 00 c0       	push   $0xc000b1e6
c000946c:	e8 22 fe ff ff       	call   c0009293 <assertion_failure>
c0009471:	83 c4 10             	add    $0x10,%esp
c0009474:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009477:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c000947d:	85 c0                	test   %eax,%eax
c000947f:	74 1c                	je     c000949d <sys_send_msg+0x1c9>
c0009481:	68 8c 05 00 00       	push   $0x58c
c0009486:	68 c2 b1 00 c0       	push   $0xc000b1c2
c000948b:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009490:	68 03 b2 00 c0       	push   $0xc000b203
c0009495:	e8 f9 fd ff ff       	call   c0009293 <assertion_failure>
c000949a:	83 c4 10             	add    $0x10,%esp
c000949d:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094a0:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c00094a7:	84 c0                	test   %al,%al
c00094a9:	74 1c                	je     c00094c7 <sys_send_msg+0x1f3>
c00094ab:	68 8d 05 00 00       	push   $0x58d
c00094b0:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00094b5:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00094ba:	68 18 b2 00 c0       	push   $0xc000b218
c00094bf:	e8 cf fd ff ff       	call   c0009293 <assertion_failure>
c00094c4:	83 c4 10             	add    $0x10,%esp
c00094c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
c00094ca:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00094d0:	83 f8 1d             	cmp    $0x1d,%eax
c00094d3:	0f 84 45 01 00 00    	je     c000961e <sys_send_msg+0x34a>
c00094d9:	68 8e 05 00 00       	push   $0x58e
c00094de:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00094e3:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00094e8:	68 30 b2 00 c0       	push   $0xc000b230
c00094ed:	e8 a1 fd ff ff       	call   c0009293 <assertion_failure>
c00094f2:	83 c4 10             	add    $0x10,%esp
c00094f5:	e9 24 01 00 00       	jmp    c000961e <sys_send_msg+0x34a>
c00094fa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009501:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009504:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009507:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000950a:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009510:	85 c0                	test   %eax,%eax
c0009512:	75 1b                	jne    c000952f <sys_send_msg+0x25b>
c0009514:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009517:	8b 55 10             	mov    0x10(%ebp),%edx
c000951a:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009520:	8b 45 10             	mov    0x10(%ebp),%eax
c0009523:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000952a:	00 00 00 
c000952d:	eb 3f                	jmp    c000956e <sys_send_msg+0x29a>
c000952f:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009532:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c0009538:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000953b:	eb 12                	jmp    c000954f <sys_send_msg+0x27b>
c000953d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009540:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009543:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009546:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c000954c:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000954f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009553:	75 e8                	jne    c000953d <sys_send_msg+0x269>
c0009555:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009558:	8b 55 10             	mov    0x10(%ebp),%edx
c000955b:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009561:	8b 45 10             	mov    0x10(%ebp),%eax
c0009564:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c000956b:	00 00 00 
c000956e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009571:	8b 55 08             	mov    0x8(%ebp),%edx
c0009574:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c000957a:	8b 45 10             	mov    0x10(%ebp),%eax
c000957d:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009580:	89 90 4c 02 00 00    	mov    %edx,0x24c(%eax)
c0009586:	8b 45 10             	mov    0x10(%ebp),%eax
c0009589:	c6 80 44 02 00 00 01 	movb   $0x1,0x244(%eax)
c0009590:	8b 45 10             	mov    0x10(%ebp),%eax
c0009593:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000959a:	3c 01                	cmp    $0x1,%al
c000959c:	74 1c                	je     c00095ba <sys_send_msg+0x2e6>
c000959e:	68 af 05 00 00       	push   $0x5af
c00095a3:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00095a8:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00095ad:	68 54 b2 00 c0       	push   $0xc000b254
c00095b2:	e8 dc fc ff ff       	call   c0009293 <assertion_failure>
c00095b7:	83 c4 10             	add    $0x10,%esp
c00095ba:	8b 45 10             	mov    0x10(%ebp),%eax
c00095bd:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00095c3:	39 45 0c             	cmp    %eax,0xc(%ebp)
c00095c6:	74 1c                	je     c00095e4 <sys_send_msg+0x310>
c00095c8:	68 b0 05 00 00       	push   $0x5b0
c00095cd:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00095d2:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00095d7:	68 70 b2 00 c0       	push   $0xc000b270
c00095dc:	e8 b2 fc ff ff       	call   c0009293 <assertion_failure>
c00095e1:	83 c4 10             	add    $0x10,%esp
c00095e4:	8b 45 10             	mov    0x10(%ebp),%eax
c00095e7:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00095ed:	39 45 08             	cmp    %eax,0x8(%ebp)
c00095f0:	74 1c                	je     c000960e <sys_send_msg+0x33a>
c00095f2:	68 b1 05 00 00       	push   $0x5b1
c00095f7:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00095fc:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009601:	68 92 b2 00 c0       	push   $0xc000b292
c0009606:	e8 88 fc ff ff       	call   c0009293 <assertion_failure>
c000960b:	83 c4 10             	add    $0x10,%esp
c000960e:	83 ec 0c             	sub    $0xc,%esp
c0009611:	ff 75 10             	pushl  0x10(%ebp)
c0009614:	e8 c1 05 00 00       	call   c0009bda <block>
c0009619:	83 c4 10             	add    $0x10,%esp
c000961c:	eb 01                	jmp    c000961f <sys_send_msg+0x34b>
c000961e:	90                   	nop
c000961f:	b8 00 00 00 00       	mov    $0x0,%eax
c0009624:	c9                   	leave  
c0009625:	c3                   	ret    

c0009626 <sys_receive_msg>:
c0009626:	55                   	push   %ebp
c0009627:	89 e5                	mov    %esp,%ebp
c0009629:	83 ec 48             	sub    $0x48,%esp
c000962c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c0009633:	83 ec 0c             	sub    $0xc,%esp
c0009636:	ff 75 0c             	pushl  0xc(%ebp)
c0009639:	e8 e4 b3 ff ff       	call   c0004a22 <pid2proc>
c000963e:	83 c4 10             	add    $0x10,%esp
c0009641:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c0009644:	83 ec 0c             	sub    $0xc,%esp
c0009647:	ff 75 10             	pushl  0x10(%ebp)
c000964a:	e8 43 b4 ff ff       	call   c0004a92 <proc2pid>
c000964f:	83 c4 10             	add    $0x10,%esp
c0009652:	89 45 e0             	mov    %eax,-0x20(%ebp)
c0009655:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000965c:	8b 45 10             	mov    0x10(%ebp),%eax
c000965f:	8b 80 5c 02 00 00    	mov    0x25c(%eax),%eax
c0009665:	85 c0                	test   %eax,%eax
c0009667:	0f 84 c7 00 00 00    	je     c0009734 <sys_receive_msg+0x10e>
c000966d:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0009671:	74 0d                	je     c0009680 <sys_receive_msg+0x5a>
c0009673:	81 7d 0c 13 02 00 00 	cmpl   $0x213,0xc(%ebp)
c000967a:	0f 85 b4 00 00 00    	jne    c0009734 <sys_receive_msg+0x10e>
c0009680:	c7 45 dc 6c 00 00 00 	movl   $0x6c,-0x24(%ebp)
c0009687:	83 ec 0c             	sub    $0xc,%esp
c000968a:	ff 75 dc             	pushl  -0x24(%ebp)
c000968d:	e8 4c d8 ff ff       	call   c0006ede <sys_malloc>
c0009692:	83 c4 10             	add    $0x10,%esp
c0009695:	89 45 d8             	mov    %eax,-0x28(%ebp)
c0009698:	8b 45 dc             	mov    -0x24(%ebp),%eax
c000969b:	83 ec 04             	sub    $0x4,%esp
c000969e:	50                   	push   %eax
c000969f:	6a 00                	push   $0x0
c00096a1:	ff 75 d8             	pushl  -0x28(%ebp)
c00096a4:	e8 49 1d 00 00       	call   c000b3f2 <Memset>
c00096a9:	83 c4 10             	add    $0x10,%esp
c00096ac:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00096af:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c00096b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
c00096b8:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c00096bf:	8b 45 08             	mov    0x8(%ebp),%eax
c00096c2:	83 ec 08             	sub    $0x8,%esp
c00096c5:	ff 75 dc             	pushl  -0x24(%ebp)
c00096c8:	50                   	push   %eax
c00096c9:	e8 cf d6 ff ff       	call   c0006d9d <alloc_virtual_memory>
c00096ce:	83 c4 10             	add    $0x10,%esp
c00096d1:	89 45 d4             	mov    %eax,-0x2c(%ebp)
c00096d4:	8b 55 dc             	mov    -0x24(%ebp),%edx
c00096d7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
c00096da:	83 ec 04             	sub    $0x4,%esp
c00096dd:	52                   	push   %edx
c00096de:	ff 75 d8             	pushl  -0x28(%ebp)
c00096e1:	50                   	push   %eax
c00096e2:	e8 dd 1c 00 00       	call   c000b3c4 <Memcpy>
c00096e7:	83 c4 10             	add    $0x10,%esp
c00096ea:	8b 45 10             	mov    0x10(%ebp),%eax
c00096ed:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c00096f4:	00 00 00 
c00096f7:	8b 45 10             	mov    0x10(%ebp),%eax
c00096fa:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009701:	00 00 00 
c0009704:	8b 45 10             	mov    0x10(%ebp),%eax
c0009707:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c000970e:	00 00 00 
c0009711:	8b 45 10             	mov    0x10(%ebp),%eax
c0009714:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c000971b:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
c0009722:	8b 45 d8             	mov    -0x28(%ebp),%eax
c0009725:	83 ec 08             	sub    $0x8,%esp
c0009728:	ff 75 dc             	pushl  -0x24(%ebp)
c000972b:	50                   	push   %eax
c000972c:	e8 8c da ff ff       	call   c00071bd <sys_free>
c0009731:	83 c4 10             	add    $0x10,%esp
c0009734:	83 7d e8 01          	cmpl   $0x1,-0x18(%ebp)
c0009738:	0f 84 96 03 00 00    	je     c0009ad4 <sys_receive_msg+0x4ae>
c000973e:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0009742:	75 26                	jne    c000976a <sys_receive_msg+0x144>
c0009744:	8b 45 10             	mov    0x10(%ebp),%eax
c0009747:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000974d:	85 c0                	test   %eax,%eax
c000974f:	0f 84 8a 00 00 00    	je     c00097df <sys_receive_msg+0x1b9>
c0009755:	8b 45 10             	mov    0x10(%ebp),%eax
c0009758:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000975e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009761:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c0009768:	eb 75                	jmp    c00097df <sys_receive_msg+0x1b9>
c000976a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c000976e:	78 6f                	js     c00097df <sys_receive_msg+0x1b9>
c0009770:	83 7d 0c 03          	cmpl   $0x3,0xc(%ebp)
c0009774:	7f 69                	jg     c00097df <sys_receive_msg+0x1b9>
c0009776:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009779:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009780:	3c 01                	cmp    $0x1,%al
c0009782:	75 5b                	jne    c00097df <sys_receive_msg+0x1b9>
c0009784:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009787:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000978d:	83 f8 0e             	cmp    $0xe,%eax
c0009790:	74 0e                	je     c00097a0 <sys_receive_msg+0x17a>
c0009792:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c0009795:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c000979b:	39 45 e0             	cmp    %eax,-0x20(%ebp)
c000979e:	75 3f                	jne    c00097df <sys_receive_msg+0x1b9>
c00097a0:	8b 45 10             	mov    0x10(%ebp),%eax
c00097a3:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c00097a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00097ac:	eb 2b                	jmp    c00097d9 <sys_receive_msg+0x1b3>
c00097ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
c00097b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097b7:	8b 90 20 01 00 00    	mov    0x120(%eax),%edx
c00097bd:	8b 45 0c             	mov    0xc(%ebp),%eax
c00097c0:	39 c2                	cmp    %eax,%edx
c00097c2:	75 09                	jne    c00097cd <sys_receive_msg+0x1a7>
c00097c4:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
c00097cb:	eb 12                	jmp    c00097df <sys_receive_msg+0x1b9>
c00097cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097d0:	8b 80 58 02 00 00    	mov    0x258(%eax),%eax
c00097d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
c00097d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c00097dd:	75 cf                	jne    c00097ae <sys_receive_msg+0x188>
c00097df:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
c00097e3:	0f 85 21 02 00 00    	jne    c0009a0a <sys_receive_msg+0x3e4>
c00097e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c00097ec:	89 45 d0             	mov    %eax,-0x30(%ebp)
c00097ef:	8b 45 08             	mov    0x8(%ebp),%eax
c00097f2:	83 ec 08             	sub    $0x8,%esp
c00097f5:	6a 6c                	push   $0x6c
c00097f7:	50                   	push   %eax
c00097f8:	e8 a0 d5 ff ff       	call   c0006d9d <alloc_virtual_memory>
c00097fd:	83 c4 10             	add    $0x10,%esp
c0009800:	89 45 cc             	mov    %eax,-0x34(%ebp)
c0009803:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009806:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c000980c:	83 ec 08             	sub    $0x8,%esp
c000980f:	6a 6c                	push   $0x6c
c0009811:	50                   	push   %eax
c0009812:	e8 86 d5 ff ff       	call   c0006d9d <alloc_virtual_memory>
c0009817:	83 c4 10             	add    $0x10,%esp
c000981a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000981d:	83 ec 04             	sub    $0x4,%esp
c0009820:	6a 6c                	push   $0x6c
c0009822:	ff 75 c8             	pushl  -0x38(%ebp)
c0009825:	ff 75 cc             	pushl  -0x34(%ebp)
c0009828:	e8 97 1b 00 00       	call   c000b3c4 <Memcpy>
c000982d:	83 c4 10             	add    $0x10,%esp
c0009830:	8b 45 cc             	mov    -0x34(%ebp),%eax
c0009833:	89 45 c4             	mov    %eax,-0x3c(%ebp)
c0009836:	8b 45 10             	mov    0x10(%ebp),%eax
c0009839:	8b 80 54 02 00 00    	mov    0x254(%eax),%eax
c000983f:	39 45 f0             	cmp    %eax,-0x10(%ebp)
c0009842:	75 21                	jne    c0009865 <sys_receive_msg+0x23f>
c0009844:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009847:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c000984d:	8b 45 10             	mov    0x10(%ebp),%eax
c0009850:	89 90 54 02 00 00    	mov    %edx,0x254(%eax)
c0009856:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009859:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0009860:	00 00 00 
c0009863:	eb 1f                	jmp    c0009884 <sys_receive_msg+0x25e>
c0009865:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009868:	8b 90 58 02 00 00    	mov    0x258(%eax),%edx
c000986e:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009871:	89 90 58 02 00 00    	mov    %edx,0x258(%eax)
c0009877:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000987a:	c7 80 58 02 00 00 00 	movl   $0x0,0x258(%eax)
c0009881:	00 00 00 
c0009884:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009887:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c000988e:	00 00 00 
c0009891:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009894:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c000989b:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000989e:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c00098a5:	00 00 00 
c00098a8:	8b 45 10             	mov    0x10(%ebp),%eax
c00098ab:	c7 80 48 02 00 00 00 	movl   $0x0,0x248(%eax)
c00098b2:	00 00 00 
c00098b5:	8b 45 10             	mov    0x10(%ebp),%eax
c00098b8:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c00098bf:	00 00 00 
c00098c2:	8b 45 10             	mov    0x10(%ebp),%eax
c00098c5:	c7 80 4c 02 00 00 1d 	movl   $0x1d,0x24c(%eax)
c00098cc:	00 00 00 
c00098cf:	83 ec 0c             	sub    $0xc,%esp
c00098d2:	ff 75 d0             	pushl  -0x30(%ebp)
c00098d5:	e8 3c 03 00 00       	call   c0009c16 <unblock>
c00098da:	83 c4 10             	add    $0x10,%esp
c00098dd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c00098e0:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c00098e6:	85 c0                	test   %eax,%eax
c00098e8:	74 1c                	je     c0009906 <sys_receive_msg+0x2e0>
c00098ea:	68 28 06 00 00       	push   $0x628
c00098ef:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00098f4:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00098f9:	68 a7 b2 00 c0       	push   $0xc000b2a7
c00098fe:	e8 90 f9 ff ff       	call   c0009293 <assertion_failure>
c0009903:	83 c4 10             	add    $0x10,%esp
c0009906:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009909:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009910:	84 c0                	test   %al,%al
c0009912:	74 1c                	je     c0009930 <sys_receive_msg+0x30a>
c0009914:	68 29 06 00 00       	push   $0x629
c0009919:	68 c2 b1 00 c0       	push   $0xc000b1c2
c000991e:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009923:	68 bf b2 00 c0       	push   $0xc000b2bf
c0009928:	e8 66 f9 ff ff       	call   c0009293 <assertion_failure>
c000992d:	83 c4 10             	add    $0x10,%esp
c0009930:	8b 45 d0             	mov    -0x30(%ebp),%eax
c0009933:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c0009939:	83 f8 1d             	cmp    $0x1d,%eax
c000993c:	74 1c                	je     c000995a <sys_receive_msg+0x334>
c000993e:	68 2a 06 00 00       	push   $0x62a
c0009943:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009948:	68 c2 b1 00 c0       	push   $0xc000b1c2
c000994d:	68 d8 b2 00 c0       	push   $0xc000b2d8
c0009952:	e8 3c f9 ff ff       	call   c0009293 <assertion_failure>
c0009957:	83 c4 10             	add    $0x10,%esp
c000995a:	8b 45 10             	mov    0x10(%ebp),%eax
c000995d:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009963:	85 c0                	test   %eax,%eax
c0009965:	74 1c                	je     c0009983 <sys_receive_msg+0x35d>
c0009967:	68 2c 06 00 00       	push   $0x62c
c000996c:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009971:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009976:	68 03 b2 00 c0       	push   $0xc000b203
c000997b:	e8 13 f9 ff ff       	call   c0009293 <assertion_failure>
c0009980:	83 c4 10             	add    $0x10,%esp
c0009983:	8b 45 10             	mov    0x10(%ebp),%eax
c0009986:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000998d:	84 c0                	test   %al,%al
c000998f:	74 1c                	je     c00099ad <sys_receive_msg+0x387>
c0009991:	68 2d 06 00 00       	push   $0x62d
c0009996:	68 c2 b1 00 c0       	push   $0xc000b1c2
c000999b:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00099a0:	68 18 b2 00 c0       	push   $0xc000b218
c00099a5:	e8 e9 f8 ff ff       	call   c0009293 <assertion_failure>
c00099aa:	83 c4 10             	add    $0x10,%esp
c00099ad:	8b 45 10             	mov    0x10(%ebp),%eax
c00099b0:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c00099b6:	83 f8 1d             	cmp    $0x1d,%eax
c00099b9:	74 1c                	je     c00099d7 <sys_receive_msg+0x3b1>
c00099bb:	68 2e 06 00 00       	push   $0x62e
c00099c0:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00099c5:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00099ca:	68 30 b2 00 c0       	push   $0xc000b230
c00099cf:	e8 bf f8 ff ff       	call   c0009293 <assertion_failure>
c00099d4:	83 c4 10             	add    $0x10,%esp
c00099d7:	8b 45 10             	mov    0x10(%ebp),%eax
c00099da:	8b 80 4c 02 00 00    	mov    0x24c(%eax),%eax
c00099e0:	83 f8 1d             	cmp    $0x1d,%eax
c00099e3:	0f 84 e4 00 00 00    	je     c0009acd <sys_receive_msg+0x4a7>
c00099e9:	68 2f 06 00 00       	push   $0x62f
c00099ee:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00099f3:	68 c2 b1 00 c0       	push   $0xc000b1c2
c00099f8:	68 fc b2 00 c0       	push   $0xc000b2fc
c00099fd:	e8 91 f8 ff ff       	call   c0009293 <assertion_failure>
c0009a02:	83 c4 10             	add    $0x10,%esp
c0009a05:	e9 c3 00 00 00       	jmp    c0009acd <sys_receive_msg+0x4a7>
c0009a0a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a0d:	c6 80 44 02 00 00 02 	movb   $0x2,0x244(%eax)
c0009a14:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a17:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009a1e:	3c 02                	cmp    $0x2,%al
c0009a20:	74 1c                	je     c0009a3e <sys_receive_msg+0x418>
c0009a22:	68 34 06 00 00       	push   $0x634
c0009a27:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009a2c:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009a31:	68 1b b3 00 c0       	push   $0xc000b31b
c0009a36:	e8 58 f8 ff ff       	call   c0009293 <assertion_failure>
c0009a3b:	83 c4 10             	add    $0x10,%esp
c0009a3e:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a41:	8b 55 08             	mov    0x8(%ebp),%edx
c0009a44:	89 90 48 02 00 00    	mov    %edx,0x248(%eax)
c0009a4a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a4d:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009a54:	3c 02                	cmp    $0x2,%al
c0009a56:	74 1c                	je     c0009a74 <sys_receive_msg+0x44e>
c0009a58:	68 36 06 00 00       	push   $0x636
c0009a5d:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009a62:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009a67:	68 1b b3 00 c0       	push   $0xc000b31b
c0009a6c:	e8 22 f8 ff ff       	call   c0009293 <assertion_failure>
c0009a71:	83 c4 10             	add    $0x10,%esp
c0009a74:	83 7d 0c 0e          	cmpl   $0xe,0xc(%ebp)
c0009a78:	75 0f                	jne    c0009a89 <sys_receive_msg+0x463>
c0009a7a:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a7d:	c7 80 50 02 00 00 0e 	movl   $0xe,0x250(%eax)
c0009a84:	00 00 00 
c0009a87:	eb 0c                	jmp    c0009a95 <sys_receive_msg+0x46f>
c0009a89:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a8c:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009a8f:	89 90 50 02 00 00    	mov    %edx,0x250(%eax)
c0009a95:	8b 45 10             	mov    0x10(%ebp),%eax
c0009a98:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009a9f:	3c 02                	cmp    $0x2,%al
c0009aa1:	74 1c                	je     c0009abf <sys_receive_msg+0x499>
c0009aa3:	68 41 06 00 00       	push   $0x641
c0009aa8:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009aad:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009ab2:	68 1b b3 00 c0       	push   $0xc000b31b
c0009ab7:	e8 d7 f7 ff ff       	call   c0009293 <assertion_failure>
c0009abc:	83 c4 10             	add    $0x10,%esp
c0009abf:	83 ec 0c             	sub    $0xc,%esp
c0009ac2:	ff 75 10             	pushl  0x10(%ebp)
c0009ac5:	e8 10 01 00 00       	call   c0009bda <block>
c0009aca:	83 c4 10             	add    $0x10,%esp
c0009acd:	b8 00 00 00 00       	mov    $0x0,%eax
c0009ad2:	eb 02                	jmp    c0009ad6 <sys_receive_msg+0x4b0>
c0009ad4:	90                   	nop
c0009ad5:	90                   	nop
c0009ad6:	c9                   	leave  
c0009ad7:	c3                   	ret    

c0009ad8 <disp_str_colour_debug>:
c0009ad8:	55                   	push   %ebp
c0009ad9:	89 e5                	mov    %esp,%ebp
c0009adb:	90                   	nop
c0009adc:	5d                   	pop    %ebp
c0009add:	c3                   	ret    

c0009ade <send_rec>:
c0009ade:	55                   	push   %ebp
c0009adf:	89 e5                	mov    %esp,%ebp
c0009ae1:	83 ec 18             	sub    $0x18,%esp
c0009ae4:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009ae7:	83 ec 0c             	sub    $0xc,%esp
c0009aea:	50                   	push   %eax
c0009aeb:	e8 1a d3 ff ff       	call   c0006e0a <get_physical_address>
c0009af0:	83 c4 10             	add    $0x10,%esp
c0009af3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009af6:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009afa:	74 28                	je     c0009b24 <send_rec+0x46>
c0009afc:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009b00:	74 22                	je     c0009b24 <send_rec+0x46>
c0009b02:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009b06:	74 1c                	je     c0009b24 <send_rec+0x46>
c0009b08:	68 5f 06 00 00       	push   $0x65f
c0009b0d:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009b12:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009b17:	68 3c b3 00 c0       	push   $0xc000b33c
c0009b1c:	e8 72 f7 ff ff       	call   c0009293 <assertion_failure>
c0009b21:	83 c4 10             	add    $0x10,%esp
c0009b24:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009b28:	75 12                	jne    c0009b3c <send_rec+0x5e>
c0009b2a:	83 ec 04             	sub    $0x4,%esp
c0009b2d:	6a 6c                	push   $0x6c
c0009b2f:	6a 00                	push   $0x0
c0009b31:	ff 75 0c             	pushl  0xc(%ebp)
c0009b34:	e8 b9 18 00 00       	call   c000b3f2 <Memset>
c0009b39:	83 c4 10             	add    $0x10,%esp
c0009b3c:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
c0009b40:	74 23                	je     c0009b65 <send_rec+0x87>
c0009b42:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
c0009b46:	74 34                	je     c0009b7c <send_rec+0x9e>
c0009b48:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
c0009b4c:	75 72                	jne    c0009bc0 <send_rec+0xe2>
c0009b4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b51:	83 ec 08             	sub    $0x8,%esp
c0009b54:	ff 75 10             	pushl  0x10(%ebp)
c0009b57:	50                   	push   %eax
c0009b58:	e8 bb 8c ff ff       	call   c0002818 <send_msg>
c0009b5d:	83 c4 10             	add    $0x10,%esp
c0009b60:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b63:	eb 6e                	jmp    c0009bd3 <send_rec+0xf5>
c0009b65:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b68:	83 ec 08             	sub    $0x8,%esp
c0009b6b:	ff 75 10             	pushl  0x10(%ebp)
c0009b6e:	50                   	push   %eax
c0009b6f:	e8 ca 8c ff ff       	call   c000283e <receive_msg>
c0009b74:	83 c4 10             	add    $0x10,%esp
c0009b77:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b7a:	eb 57                	jmp    c0009bd3 <send_rec+0xf5>
c0009b7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009b7f:	83 ec 08             	sub    $0x8,%esp
c0009b82:	ff 75 10             	pushl  0x10(%ebp)
c0009b85:	50                   	push   %eax
c0009b86:	e8 8d 8c ff ff       	call   c0002818 <send_msg>
c0009b8b:	83 c4 10             	add    $0x10,%esp
c0009b8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009b91:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009b95:	75 3b                	jne    c0009bd2 <send_rec+0xf4>
c0009b97:	83 ec 04             	sub    $0x4,%esp
c0009b9a:	6a 6c                	push   $0x6c
c0009b9c:	6a 00                	push   $0x0
c0009b9e:	ff 75 0c             	pushl  0xc(%ebp)
c0009ba1:	e8 4c 18 00 00       	call   c000b3f2 <Memset>
c0009ba6:	83 c4 10             	add    $0x10,%esp
c0009ba9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009bac:	83 ec 08             	sub    $0x8,%esp
c0009baf:	ff 75 10             	pushl  0x10(%ebp)
c0009bb2:	50                   	push   %eax
c0009bb3:	e8 86 8c ff ff       	call   c000283e <receive_msg>
c0009bb8:	83 c4 10             	add    $0x10,%esp
c0009bbb:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009bbe:	eb 12                	jmp    c0009bd2 <send_rec+0xf4>
c0009bc0:	83 ec 0c             	sub    $0xc,%esp
c0009bc3:	68 78 b3 00 c0       	push   $0xc000b378
c0009bc8:	e8 a8 f6 ff ff       	call   c0009275 <panic>
c0009bcd:	83 c4 10             	add    $0x10,%esp
c0009bd0:	eb 01                	jmp    c0009bd3 <send_rec+0xf5>
c0009bd2:	90                   	nop
c0009bd3:	b8 00 00 00 00       	mov    $0x0,%eax
c0009bd8:	c9                   	leave  
c0009bd9:	c3                   	ret    

c0009bda <block>:
c0009bda:	55                   	push   %ebp
c0009bdb:	89 e5                	mov    %esp,%ebp
c0009bdd:	83 ec 08             	sub    $0x8,%esp
c0009be0:	8b 45 08             	mov    0x8(%ebp),%eax
c0009be3:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009bea:	84 c0                	test   %al,%al
c0009bec:	75 1c                	jne    c0009c0a <block+0x30>
c0009bee:	68 8e 06 00 00       	push   $0x68e
c0009bf3:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009bf8:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009bfd:	68 8d b3 00 c0       	push   $0xc000b38d
c0009c02:	e8 8c f6 ff ff       	call   c0009293 <assertion_failure>
c0009c07:	83 c4 10             	add    $0x10,%esp
c0009c0a:	e8 c5 ac ff ff       	call   c00048d4 <schedule_process>
c0009c0f:	b8 00 00 00 00       	mov    $0x0,%eax
c0009c14:	c9                   	leave  
c0009c15:	c3                   	ret    

c0009c16 <unblock>:
c0009c16:	55                   	push   %ebp
c0009c17:	89 e5                	mov    %esp,%ebp
c0009c19:	83 ec 08             	sub    $0x8,%esp
c0009c1c:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c1f:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009c26:	84 c0                	test   %al,%al
c0009c28:	74 1c                	je     c0009c46 <unblock+0x30>
c0009c2a:	68 97 06 00 00       	push   $0x697
c0009c2f:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009c34:	68 c2 b1 00 c0       	push   $0xc000b1c2
c0009c39:	68 a5 b3 00 c0       	push   $0xc000b3a5
c0009c3e:	e8 50 f6 ff ff       	call   c0009293 <assertion_failure>
c0009c43:	83 c4 10             	add    $0x10,%esp
c0009c46:	8b 45 08             	mov    0x8(%ebp),%eax
c0009c49:	05 fc 00 00 00       	add    $0xfc,%eax
c0009c4e:	83 ec 08             	sub    $0x8,%esp
c0009c51:	50                   	push   %eax
c0009c52:	68 8c fd 00 c0       	push   $0xc000fd8c
c0009c57:	e8 4d 09 00 00       	call   c000a5a9 <insertToDoubleLinkList>
c0009c5c:	83 c4 10             	add    $0x10,%esp
c0009c5f:	b8 00 00 00 00       	mov    $0x0,%eax
c0009c64:	c9                   	leave  
c0009c65:	c3                   	ret    

c0009c66 <get_ticks_ipc>:
c0009c66:	55                   	push   %ebp
c0009c67:	89 e5                	mov    %esp,%ebp
c0009c69:	81 ec 88 00 00 00    	sub    $0x88,%esp
c0009c6f:	83 ec 04             	sub    $0x4,%esp
c0009c72:	6a 6c                	push   $0x6c
c0009c74:	6a 00                	push   $0x0
c0009c76:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009c79:	50                   	push   %eax
c0009c7a:	e8 73 17 00 00       	call   c000b3f2 <Memset>
c0009c7f:	83 c4 10             	add    $0x10,%esp
c0009c82:	c7 45 88 01 00 00 00 	movl   $0x1,-0x78(%ebp)
c0009c89:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
c0009c90:	83 ec 04             	sub    $0x4,%esp
c0009c93:	6a 01                	push   $0x1
c0009c95:	8d 45 84             	lea    -0x7c(%ebp),%eax
c0009c98:	50                   	push   %eax
c0009c99:	6a 03                	push   $0x3
c0009c9b:	e8 3e fe ff ff       	call   c0009ade <send_rec>
c0009ca0:	83 c4 10             	add    $0x10,%esp
c0009ca3:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009ca6:	8b 45 8c             	mov    -0x74(%ebp),%eax
c0009ca9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009cac:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009caf:	c9                   	leave  
c0009cb0:	c3                   	ret    

c0009cb1 <itoa>:
c0009cb1:	55                   	push   %ebp
c0009cb2:	89 e5                	mov    %esp,%ebp
c0009cb4:	53                   	push   %ebx
c0009cb5:	83 ec 14             	sub    $0x14,%esp
c0009cb8:	8b 45 08             	mov    0x8(%ebp),%eax
c0009cbb:	99                   	cltd   
c0009cbc:	f7 7d 10             	idivl  0x10(%ebp)
c0009cbf:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009cc2:	8b 45 08             	mov    0x8(%ebp),%eax
c0009cc5:	99                   	cltd   
c0009cc6:	f7 7d 10             	idivl  0x10(%ebp)
c0009cc9:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009ccc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009cd0:	74 14                	je     c0009ce6 <itoa+0x35>
c0009cd2:	83 ec 04             	sub    $0x4,%esp
c0009cd5:	ff 75 10             	pushl  0x10(%ebp)
c0009cd8:	ff 75 0c             	pushl  0xc(%ebp)
c0009cdb:	ff 75 f0             	pushl  -0x10(%ebp)
c0009cde:	e8 ce ff ff ff       	call   c0009cb1 <itoa>
c0009ce3:	83 c4 10             	add    $0x10,%esp
c0009ce6:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ce9:	8d 58 30             	lea    0x30(%eax),%ebx
c0009cec:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009cef:	8b 00                	mov    (%eax),%eax
c0009cf1:	8d 48 01             	lea    0x1(%eax),%ecx
c0009cf4:	8b 55 0c             	mov    0xc(%ebp),%edx
c0009cf7:	89 0a                	mov    %ecx,(%edx)
c0009cf9:	89 da                	mov    %ebx,%edx
c0009cfb:	88 10                	mov    %dl,(%eax)
c0009cfd:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009d00:	8b 00                	mov    (%eax),%eax
c0009d02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009d05:	c9                   	leave  
c0009d06:	c3                   	ret    

c0009d07 <i2a>:
c0009d07:	55                   	push   %ebp
c0009d08:	89 e5                	mov    %esp,%ebp
c0009d0a:	53                   	push   %ebx
c0009d0b:	83 ec 14             	sub    $0x14,%esp
c0009d0e:	8b 45 08             	mov    0x8(%ebp),%eax
c0009d11:	99                   	cltd   
c0009d12:	f7 7d 0c             	idivl  0xc(%ebp)
c0009d15:	89 55 f4             	mov    %edx,-0xc(%ebp)
c0009d18:	8b 45 08             	mov    0x8(%ebp),%eax
c0009d1b:	99                   	cltd   
c0009d1c:	f7 7d 0c             	idivl  0xc(%ebp)
c0009d1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009d22:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
c0009d26:	74 14                	je     c0009d3c <i2a+0x35>
c0009d28:	83 ec 04             	sub    $0x4,%esp
c0009d2b:	ff 75 10             	pushl  0x10(%ebp)
c0009d2e:	ff 75 0c             	pushl  0xc(%ebp)
c0009d31:	ff 75 f0             	pushl  -0x10(%ebp)
c0009d34:	e8 ce ff ff ff       	call   c0009d07 <i2a>
c0009d39:	83 c4 10             	add    $0x10,%esp
c0009d3c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
c0009d40:	7f 0a                	jg     c0009d4c <i2a+0x45>
c0009d42:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d45:	83 c0 30             	add    $0x30,%eax
c0009d48:	89 c3                	mov    %eax,%ebx
c0009d4a:	eb 08                	jmp    c0009d54 <i2a+0x4d>
c0009d4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d4f:	83 c0 37             	add    $0x37,%eax
c0009d52:	89 c3                	mov    %eax,%ebx
c0009d54:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d57:	8b 00                	mov    (%eax),%eax
c0009d59:	8d 48 01             	lea    0x1(%eax),%ecx
c0009d5c:	8b 55 10             	mov    0x10(%ebp),%edx
c0009d5f:	89 0a                	mov    %ecx,(%edx)
c0009d61:	88 18                	mov    %bl,(%eax)
c0009d63:	8b 45 10             	mov    0x10(%ebp),%eax
c0009d66:	8b 00                	mov    (%eax),%eax
c0009d68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
c0009d6b:	c9                   	leave  
c0009d6c:	c3                   	ret    

c0009d6d <inform_int>:
c0009d6d:	55                   	push   %ebp
c0009d6e:	89 e5                	mov    %esp,%ebp
c0009d70:	83 ec 18             	sub    $0x18,%esp
c0009d73:	83 ec 0c             	sub    $0xc,%esp
c0009d76:	ff 75 08             	pushl  0x8(%ebp)
c0009d79:	e8 a4 ac ff ff       	call   c0004a22 <pid2proc>
c0009d7e:	83 c4 10             	add    $0x10,%esp
c0009d81:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009d84:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d87:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c0009d8e:	0f be c0             	movsbl %al,%eax
c0009d91:	83 e0 02             	and    $0x2,%eax
c0009d94:	85 c0                	test   %eax,%eax
c0009d96:	0f 84 8e 00 00 00    	je     c0009e2a <inform_int+0xbd>
c0009d9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009d9f:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009da5:	3d 13 02 00 00       	cmp    $0x213,%eax
c0009daa:	74 0e                	je     c0009dba <inform_int+0x4d>
c0009dac:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009daf:	8b 80 50 02 00 00    	mov    0x250(%eax),%eax
c0009db5:	83 f8 0e             	cmp    $0xe,%eax
c0009db8:	75 7d                	jne    c0009e37 <inform_int+0xca>
c0009dba:	c7 45 f0 6c 00 00 00 	movl   $0x6c,-0x10(%ebp)
c0009dc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009dc4:	8b 80 48 02 00 00    	mov    0x248(%eax),%eax
c0009dca:	83 ec 08             	sub    $0x8,%esp
c0009dcd:	ff 75 f0             	pushl  -0x10(%ebp)
c0009dd0:	50                   	push   %eax
c0009dd1:	e8 c7 cf ff ff       	call   c0006d9d <alloc_virtual_memory>
c0009dd6:	83 c4 10             	add    $0x10,%esp
c0009dd9:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009ddc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ddf:	c7 00 13 02 00 00    	movl   $0x213,(%eax)
c0009de5:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009de8:	c7 40 68 d5 07 00 00 	movl   $0x7d5,0x68(%eax)
c0009def:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009df2:	c7 80 5c 02 00 00 00 	movl   $0x0,0x25c(%eax)
c0009df9:	00 00 00 
c0009dfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009dff:	c7 80 50 02 00 00 1d 	movl   $0x1d,0x250(%eax)
c0009e06:	00 00 00 
c0009e09:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c0009e10:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e13:	c6 80 44 02 00 00 00 	movb   $0x0,0x244(%eax)
c0009e1a:	83 ec 0c             	sub    $0xc,%esp
c0009e1d:	ff 75 f4             	pushl  -0xc(%ebp)
c0009e20:	e8 f1 fd ff ff       	call   c0009c16 <unblock>
c0009e25:	83 c4 10             	add    $0x10,%esp
c0009e28:	eb 0d                	jmp    c0009e37 <inform_int+0xca>
c0009e2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009e2d:	c7 80 5c 02 00 00 01 	movl   $0x1,0x25c(%eax)
c0009e34:	00 00 00 
c0009e37:	90                   	nop
c0009e38:	c9                   	leave  
c0009e39:	c3                   	ret    

c0009e3a <strcmp>:
c0009e3a:	55                   	push   %ebp
c0009e3b:	89 e5                	mov    %esp,%ebp
c0009e3d:	83 ec 10             	sub    $0x10,%esp
c0009e40:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
c0009e44:	74 06                	je     c0009e4c <strcmp+0x12>
c0009e46:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
c0009e4a:	75 08                	jne    c0009e54 <strcmp+0x1a>
c0009e4c:	8b 45 08             	mov    0x8(%ebp),%eax
c0009e4f:	2b 45 0c             	sub    0xc(%ebp),%eax
c0009e52:	eb 53                	jmp    c0009ea7 <strcmp+0x6d>
c0009e54:	8b 45 08             	mov    0x8(%ebp),%eax
c0009e57:	89 45 fc             	mov    %eax,-0x4(%ebp)
c0009e5a:	8b 45 0c             	mov    0xc(%ebp),%eax
c0009e5d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c0009e60:	eb 18                	jmp    c0009e7a <strcmp+0x40>
c0009e62:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009e65:	0f b6 10             	movzbl (%eax),%edx
c0009e68:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009e6b:	0f b6 00             	movzbl (%eax),%eax
c0009e6e:	38 c2                	cmp    %al,%dl
c0009e70:	75 1e                	jne    c0009e90 <strcmp+0x56>
c0009e72:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
c0009e76:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
c0009e7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009e7d:	0f b6 00             	movzbl (%eax),%eax
c0009e80:	84 c0                	test   %al,%al
c0009e82:	74 0d                	je     c0009e91 <strcmp+0x57>
c0009e84:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009e87:	0f b6 00             	movzbl (%eax),%eax
c0009e8a:	84 c0                	test   %al,%al
c0009e8c:	75 d4                	jne    c0009e62 <strcmp+0x28>
c0009e8e:	eb 01                	jmp    c0009e91 <strcmp+0x57>
c0009e90:	90                   	nop
c0009e91:	8b 45 fc             	mov    -0x4(%ebp),%eax
c0009e94:	0f b6 00             	movzbl (%eax),%eax
c0009e97:	0f be d0             	movsbl %al,%edx
c0009e9a:	8b 45 f8             	mov    -0x8(%ebp),%eax
c0009e9d:	0f b6 00             	movzbl (%eax),%eax
c0009ea0:	0f be c0             	movsbl %al,%eax
c0009ea3:	29 c2                	sub    %eax,%edx
c0009ea5:	89 d0                	mov    %edx,%eax
c0009ea7:	c9                   	leave  
c0009ea8:	c3                   	ret    

c0009ea9 <create_user_process_address_space>:
c0009ea9:	55                   	push   %ebp
c0009eaa:	89 e5                	mov    %esp,%ebp
c0009eac:	83 ec 18             	sub    $0x18,%esp
c0009eaf:	83 ec 08             	sub    $0x8,%esp
c0009eb2:	6a 00                	push   $0x0
c0009eb4:	6a 01                	push   $0x1
c0009eb6:	e8 81 cf ff ff       	call   c0006e3c <alloc_memory>
c0009ebb:	83 c4 10             	add    $0x10,%esp
c0009ebe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009ec1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ec4:	c7 40 08 00 80 04 08 	movl   $0x8048000,0x8(%eax)
c0009ecb:	c7 45 f0 00 80 fb b7 	movl   $0xb7fb8000,-0x10(%ebp)
c0009ed2:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ed5:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009eda:	c1 e8 0c             	shr    $0xc,%eax
c0009edd:	89 45 ec             	mov    %eax,-0x14(%ebp)
c0009ee0:	8b 45 ec             	mov    -0x14(%ebp),%eax
c0009ee3:	83 c0 07             	add    $0x7,%eax
c0009ee6:	c1 e8 03             	shr    $0x3,%eax
c0009ee9:	89 c2                	mov    %eax,%edx
c0009eeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009eee:	89 50 04             	mov    %edx,0x4(%eax)
c0009ef1:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009ef4:	8b 40 04             	mov    0x4(%eax),%eax
c0009ef7:	05 ff 0f 00 00       	add    $0xfff,%eax
c0009efc:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
c0009f02:	85 c0                	test   %eax,%eax
c0009f04:	0f 48 c2             	cmovs  %edx,%eax
c0009f07:	c1 f8 0c             	sar    $0xc,%eax
c0009f0a:	89 45 e8             	mov    %eax,-0x18(%ebp)
c0009f0d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c0009f10:	83 ec 08             	sub    $0x8,%esp
c0009f13:	6a 00                	push   $0x0
c0009f15:	50                   	push   %eax
c0009f16:	e8 21 cf ff ff       	call   c0006e3c <alloc_memory>
c0009f1b:	83 c4 10             	add    $0x10,%esp
c0009f1e:	89 c2                	mov    %eax,%edx
c0009f20:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f23:	89 10                	mov    %edx,(%eax)
c0009f25:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f28:	83 ec 0c             	sub    $0xc,%esp
c0009f2b:	50                   	push   %eax
c0009f2c:	e8 09 ca ff ff       	call   c000693a <init_bitmap>
c0009f31:	83 c4 10             	add    $0x10,%esp
c0009f34:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f37:	c9                   	leave  
c0009f38:	c3                   	ret    

c0009f39 <user_process>:
c0009f39:	55                   	push   %ebp
c0009f3a:	89 e5                	mov    %esp,%ebp
c0009f3c:	83 ec 28             	sub    $0x28,%esp
c0009f3f:	e8 52 79 ff ff       	call   c0001896 <get_running_thread_pcb>
c0009f44:	89 45 f4             	mov    %eax,-0xc(%ebp)
c0009f47:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f4a:	05 00 10 00 00       	add    $0x1000,%eax
c0009f4f:	89 c2                	mov    %eax,%edx
c0009f51:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f54:	89 10                	mov    %edx,(%eax)
c0009f56:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f59:	8b 00                	mov    (%eax),%eax
c0009f5b:	83 e8 44             	sub    $0x44,%eax
c0009f5e:	89 c2                	mov    %eax,%edx
c0009f60:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f63:	89 10                	mov    %edx,(%eax)
c0009f65:	8b 45 f4             	mov    -0xc(%ebp),%eax
c0009f68:	8b 00                	mov    (%eax),%eax
c0009f6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
c0009f6d:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
c0009f71:	66 c7 45 ec 02 12    	movw   $0x1202,-0x14(%ebp)
c0009f77:	66 c7 45 ea 48 00    	movw   $0x48,-0x16(%ebp)
c0009f7d:	66 c7 45 e8 50 00    	movw   $0x50,-0x18(%ebp)
c0009f83:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009f87:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
c0009f8b:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009f8f:	66 89 45 e4          	mov    %ax,-0x1c(%ebp)
c0009f93:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
c0009f97:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
c0009f9b:	66 c7 45 e0 38 00    	movw   $0x38,-0x20(%ebp)
c0009fa1:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
c0009fa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009fa8:	89 50 34             	mov    %edx,0x34(%eax)
c0009fab:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009faf:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009fb2:	89 50 0c             	mov    %edx,0xc(%eax)
c0009fb5:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009fb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009fbc:	89 50 04             	mov    %edx,0x4(%eax)
c0009fbf:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009fc3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009fc6:	89 50 08             	mov    %edx,0x8(%eax)
c0009fc9:	0f b7 55 e4          	movzwl -0x1c(%ebp),%edx
c0009fcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009fd0:	89 50 40             	mov    %edx,0x40(%eax)
c0009fd3:	0f b7 55 e0          	movzwl -0x20(%ebp),%edx
c0009fd7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009fda:	89 10                	mov    %edx,(%eax)
c0009fdc:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009fdf:	8b 55 08             	mov    0x8(%ebp),%edx
c0009fe2:	89 50 30             	mov    %edx,0x30(%eax)
c0009fe5:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
c0009fe9:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009fec:	89 50 38             	mov    %edx,0x38(%eax)
c0009fef:	8b 45 f0             	mov    -0x10(%ebp),%eax
c0009ff2:	83 ec 0c             	sub    $0xc,%esp
c0009ff5:	50                   	push   %eax
c0009ff6:	e8 6e 77 ff ff       	call   c0001769 <restart>
c0009ffb:	83 c4 10             	add    $0x10,%esp
c0009ffe:	90                   	nop
c0009fff:	c9                   	leave  
c000a000:	c3                   	ret    

c000a001 <clone_pcb>:
c000a001:	55                   	push   %ebp
c000a002:	89 e5                	mov    %esp,%ebp
c000a004:	83 ec 18             	sub    $0x18,%esp
c000a007:	83 ec 08             	sub    $0x8,%esp
c000a00a:	6a 00                	push   $0x0
c000a00c:	6a 01                	push   $0x1
c000a00e:	e8 29 ce ff ff       	call   c0006e3c <alloc_memory>
c000a013:	83 c4 10             	add    $0x10,%esp
c000a016:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a019:	83 ec 04             	sub    $0x4,%esp
c000a01c:	68 00 10 00 00       	push   $0x1000
c000a021:	6a 00                	push   $0x0
c000a023:	ff 75 f4             	pushl  -0xc(%ebp)
c000a026:	e8 c7 13 00 00       	call   c000b3f2 <Memset>
c000a02b:	83 c4 10             	add    $0x10,%esp
c000a02e:	83 ec 04             	sub    $0x4,%esp
c000a031:	68 00 10 00 00       	push   $0x1000
c000a036:	ff 75 08             	pushl  0x8(%ebp)
c000a039:	ff 75 f4             	pushl  -0xc(%ebp)
c000a03c:	e8 83 13 00 00       	call   c000b3c4 <Memcpy>
c000a041:	83 c4 10             	add    $0x10,%esp
c000a044:	a1 30 f7 00 c0       	mov    0xc000f730,%eax
c000a049:	83 c0 01             	add    $0x1,%eax
c000a04c:	a3 30 f7 00 c0       	mov    %eax,0xc000f730
c000a051:	8b 15 30 f7 00 c0    	mov    0xc000f730,%edx
c000a057:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a05a:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c000a060:	8b 45 08             	mov    0x8(%ebp),%eax
c000a063:	8b 90 60 02 00 00    	mov    0x260(%eax),%edx
c000a069:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a06c:	89 90 60 02 00 00    	mov    %edx,0x260(%eax)
c000a072:	83 ec 08             	sub    $0x8,%esp
c000a075:	6a 00                	push   $0x0
c000a077:	6a 01                	push   $0x1
c000a079:	e8 be cd ff ff       	call   c0006e3c <alloc_memory>
c000a07e:	83 c4 10             	add    $0x10,%esp
c000a081:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a084:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a087:	05 00 0c 00 00       	add    $0xc00,%eax
c000a08c:	83 ec 04             	sub    $0x4,%esp
c000a08f:	68 00 04 00 00       	push   $0x400
c000a094:	68 00 fc ff ff       	push   $0xfffffc00
c000a099:	50                   	push   %eax
c000a09a:	e8 25 13 00 00       	call   c000b3c4 <Memcpy>
c000a09f:	83 c4 10             	add    $0x10,%esp
c000a0a2:	83 ec 0c             	sub    $0xc,%esp
c000a0a5:	ff 75 f0             	pushl  -0x10(%ebp)
c000a0a8:	e8 5d cd ff ff       	call   c0006e0a <get_physical_address>
c000a0ad:	83 c4 10             	add    $0x10,%esp
c000a0b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a0b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a0b6:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a0bb:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a0be:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a0c1:	83 c8 07             	or     $0x7,%eax
c000a0c4:	89 c2                	mov    %eax,%edx
c000a0c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a0c9:	89 10                	mov    %edx,(%eax)
c000a0cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0ce:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a0d1:	89 50 04             	mov    %edx,0x4(%eax)
c000a0d4:	e8 d0 fd ff ff       	call   c0009ea9 <create_user_process_address_space>
c000a0d9:	89 c2                	mov    %eax,%edx
c000a0db:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0de:	89 50 08             	mov    %edx,0x8(%eax)
c000a0e1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a0e4:	8b 40 08             	mov    0x8(%eax),%eax
c000a0e7:	89 c2                	mov    %eax,%edx
c000a0e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a0ec:	8b 40 08             	mov    0x8(%eax),%eax
c000a0ef:	83 ec 04             	sub    $0x4,%esp
c000a0f2:	6a 0c                	push   $0xc
c000a0f4:	52                   	push   %edx
c000a0f5:	50                   	push   %eax
c000a0f6:	e8 c9 12 00 00       	call   c000b3c4 <Memcpy>
c000a0fb:	83 c4 10             	add    $0x10,%esp
c000a0fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a101:	c9                   	leave  
c000a102:	c3                   	ret    

c000a103 <build_body_stack>:
c000a103:	55                   	push   %ebp
c000a104:	89 e5                	mov    %esp,%ebp
c000a106:	83 ec 38             	sub    $0x38,%esp
c000a109:	8b 45 08             	mov    0x8(%ebp),%eax
c000a10c:	8b 40 08             	mov    0x8(%eax),%eax
c000a10f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a112:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a115:	8b 50 04             	mov    0x4(%eax),%edx
c000a118:	8b 00                	mov    (%eax),%eax
c000a11a:	89 45 c8             	mov    %eax,-0x38(%ebp)
c000a11d:	89 55 cc             	mov    %edx,-0x34(%ebp)
c000a120:	8b 45 c8             	mov    -0x38(%ebp),%eax
c000a123:	89 45 e0             	mov    %eax,-0x20(%ebp)
c000a126:	8b 45 cc             	mov    -0x34(%ebp),%eax
c000a129:	89 45 dc             	mov    %eax,-0x24(%ebp)
c000a12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a12f:	8b 40 08             	mov    0x8(%eax),%eax
c000a132:	89 45 d8             	mov    %eax,-0x28(%ebp)
c000a135:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
c000a13c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
c000a143:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
c000a14a:	e9 dd 00 00 00       	jmp    c000a22c <build_body_stack+0x129>
c000a14f:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a152:	8b 45 e0             	mov    -0x20(%ebp),%eax
c000a155:	01 d0                	add    %edx,%eax
c000a157:	0f b6 00             	movzbl (%eax),%eax
c000a15a:	88 45 d7             	mov    %al,-0x29(%ebp)
c000a15d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
c000a164:	e9 b5 00 00 00       	jmp    c000a21e <build_body_stack+0x11b>
c000a169:	0f be 55 d7          	movsbl -0x29(%ebp),%edx
c000a16d:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a170:	89 c1                	mov    %eax,%ecx
c000a172:	d3 fa                	sar    %cl,%edx
c000a174:	89 d0                	mov    %edx,%eax
c000a176:	83 e0 01             	and    $0x1,%eax
c000a179:	85 c0                	test   %eax,%eax
c000a17b:	75 09                	jne    c000a186 <build_body_stack+0x83>
c000a17d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a181:	e9 94 00 00 00       	jmp    c000a21a <build_body_stack+0x117>
c000a186:	8b 45 08             	mov    0x8(%ebp),%eax
c000a189:	8b 40 04             	mov    0x4(%eax),%eax
c000a18c:	83 ec 0c             	sub    $0xc,%esp
c000a18f:	50                   	push   %eax
c000a190:	e8 e3 76 ff ff       	call   c0001878 <update_cr3>
c000a195:	83 c4 10             	add    $0x10,%esp
c000a198:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a19b:	c1 e0 0c             	shl    $0xc,%eax
c000a19e:	89 c2                	mov    %eax,%edx
c000a1a0:	8b 45 d8             	mov    -0x28(%ebp),%eax
c000a1a3:	01 d0                	add    %edx,%eax
c000a1a5:	89 45 d0             	mov    %eax,-0x30(%ebp)
c000a1a8:	81 7d d0 00 60 05 08 	cmpl   $0x8056000,-0x30(%ebp)
c000a1af:	75 0f                	jne    c000a1c0 <build_body_stack+0xbd>
c000a1b1:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a1b4:	83 ec 0c             	sub    $0xc,%esp
c000a1b7:	50                   	push   %eax
c000a1b8:	e8 9a d8 ff ff       	call   c0007a57 <disp_int>
c000a1bd:	83 c4 10             	add    $0x10,%esp
c000a1c0:	8b 55 d0             	mov    -0x30(%ebp),%edx
c000a1c3:	8b 45 10             	mov    0x10(%ebp),%eax
c000a1c6:	83 ec 04             	sub    $0x4,%esp
c000a1c9:	68 00 10 00 00       	push   $0x1000
c000a1ce:	52                   	push   %edx
c000a1cf:	50                   	push   %eax
c000a1d0:	e8 ef 11 00 00       	call   c000b3c4 <Memcpy>
c000a1d5:	83 c4 10             	add    $0x10,%esp
c000a1d8:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a1db:	8b 40 04             	mov    0x4(%eax),%eax
c000a1de:	83 ec 0c             	sub    $0xc,%esp
c000a1e1:	50                   	push   %eax
c000a1e2:	e8 91 76 ff ff       	call   c0001878 <update_cr3>
c000a1e7:	83 c4 10             	add    $0x10,%esp
c000a1ea:	83 ec 08             	sub    $0x8,%esp
c000a1ed:	ff 75 d0             	pushl  -0x30(%ebp)
c000a1f0:	6a 01                	push   $0x1
c000a1f2:	e8 a7 cc ff ff       	call   c0006e9e <get_a_virtual_page>
c000a1f7:	83 c4 10             	add    $0x10,%esp
c000a1fa:	8b 55 10             	mov    0x10(%ebp),%edx
c000a1fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
c000a200:	83 ec 04             	sub    $0x4,%esp
c000a203:	68 00 10 00 00       	push   $0x1000
c000a208:	52                   	push   %edx
c000a209:	50                   	push   %eax
c000a20a:	e8 b5 11 00 00       	call   c000b3c4 <Memcpy>
c000a20f:	83 c4 10             	add    $0x10,%esp
c000a212:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
c000a216:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
c000a21a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
c000a21e:	83 7d e8 07          	cmpl   $0x7,-0x18(%ebp)
c000a222:	0f 8e 41 ff ff ff    	jle    c000a169 <build_body_stack+0x66>
c000a228:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
c000a22c:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a22f:	39 45 dc             	cmp    %eax,-0x24(%ebp)
c000a232:	0f 87 17 ff ff ff    	ja     c000a14f <build_body_stack+0x4c>
c000a238:	83 ec 0c             	sub    $0xc,%esp
c000a23b:	68 bd b3 00 c0       	push   $0xc000b3bd
c000a240:	e8 47 73 ff ff       	call   c000158c <disp_str>
c000a245:	83 c4 10             	add    $0x10,%esp
c000a248:	83 ec 0c             	sub    $0xc,%esp
c000a24b:	ff 75 f0             	pushl  -0x10(%ebp)
c000a24e:	e8 04 d8 ff ff       	call   c0007a57 <disp_int>
c000a253:	83 c4 10             	add    $0x10,%esp
c000a256:	83 ec 0c             	sub    $0xc,%esp
c000a259:	68 c2 b3 00 c0       	push   $0xc000b3c2
c000a25e:	e8 29 73 ff ff       	call   c000158c <disp_str>
c000a263:	83 c4 10             	add    $0x10,%esp
c000a266:	90                   	nop
c000a267:	c9                   	leave  
c000a268:	c3                   	ret    

c000a269 <build_process_kernel_stack>:
c000a269:	55                   	push   %ebp
c000a26a:	89 e5                	mov    %esp,%ebp
c000a26c:	83 ec 20             	sub    $0x20,%esp
c000a26f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a272:	05 bc 0f 00 00       	add    $0xfbc,%eax
c000a277:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a27a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a27d:	89 45 f8             	mov    %eax,-0x8(%ebp)
c000a280:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a283:	83 e8 04             	sub    $0x4,%eax
c000a286:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a289:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a28c:	83 e8 08             	sub    $0x8,%eax
c000a28f:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a292:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a295:	83 e8 0c             	sub    $0xc,%eax
c000a298:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a29b:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a29e:	83 e8 10             	sub    $0x10,%eax
c000a2a1:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a2a4:	ba 61 17 00 c0       	mov    $0xc0001761,%edx
c000a2a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
c000a2ac:	89 10                	mov    %edx,(%eax)
c000a2ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a2b1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a2b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a2ba:	8b 10                	mov    (%eax),%edx
c000a2bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a2bf:	89 10                	mov    %edx,(%eax)
c000a2c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a2c4:	8b 10                	mov    (%eax),%edx
c000a2c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2c9:	89 10                	mov    %edx,(%eax)
c000a2cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a2ce:	8b 10                	mov    (%eax),%edx
c000a2d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a2d3:	89 10                	mov    %edx,(%eax)
c000a2d5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a2d8:	8b 55 e8             	mov    -0x18(%ebp),%edx
c000a2db:	89 10                	mov    %edx,(%eax)
c000a2dd:	90                   	nop
c000a2de:	c9                   	leave  
c000a2df:	c3                   	ret    

c000a2e0 <fork_process>:
c000a2e0:	55                   	push   %ebp
c000a2e1:	89 e5                	mov    %esp,%ebp
c000a2e3:	83 ec 18             	sub    $0x18,%esp
c000a2e6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a2e9:	83 ec 0c             	sub    $0xc,%esp
c000a2ec:	50                   	push   %eax
c000a2ed:	e8 30 a7 ff ff       	call   c0004a22 <pid2proc>
c000a2f2:	83 c4 10             	add    $0x10,%esp
c000a2f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a2f8:	83 ec 0c             	sub    $0xc,%esp
c000a2fb:	ff 75 f4             	pushl  -0xc(%ebp)
c000a2fe:	e8 fe fc ff ff       	call   c000a001 <clone_pcb>
c000a303:	83 c4 10             	add    $0x10,%esp
c000a306:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a309:	83 ec 08             	sub    $0x8,%esp
c000a30c:	6a 00                	push   $0x0
c000a30e:	6a 01                	push   $0x1
c000a310:	e8 27 cb ff ff       	call   c0006e3c <alloc_memory>
c000a315:	83 c4 10             	add    $0x10,%esp
c000a318:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a31b:	83 ec 04             	sub    $0x4,%esp
c000a31e:	ff 75 ec             	pushl  -0x14(%ebp)
c000a321:	ff 75 f0             	pushl  -0x10(%ebp)
c000a324:	ff 75 f4             	pushl  -0xc(%ebp)
c000a327:	e8 d7 fd ff ff       	call   c000a103 <build_body_stack>
c000a32c:	83 c4 10             	add    $0x10,%esp
c000a32f:	83 ec 0c             	sub    $0xc,%esp
c000a332:	ff 75 f0             	pushl  -0x10(%ebp)
c000a335:	e8 2f ff ff ff       	call   c000a269 <build_process_kernel_stack>
c000a33a:	83 c4 10             	add    $0x10,%esp
c000a33d:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a340:	0f b6 80 44 02 00 00 	movzbl 0x244(%eax),%eax
c000a347:	84 c0                	test   %al,%al
c000a349:	75 31                	jne    c000a37c <fork_process+0x9c>
c000a34b:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a34e:	05 fc 00 00 00       	add    $0xfc,%eax
c000a353:	83 ec 04             	sub    $0x4,%esp
c000a356:	6a 08                	push   $0x8
c000a358:	6a 00                	push   $0x0
c000a35a:	50                   	push   %eax
c000a35b:	e8 92 10 00 00       	call   c000b3f2 <Memset>
c000a360:	83 c4 10             	add    $0x10,%esp
c000a363:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a366:	05 fc 00 00 00       	add    $0xfc,%eax
c000a36b:	83 ec 08             	sub    $0x8,%esp
c000a36e:	50                   	push   %eax
c000a36f:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a374:	e8 eb 01 00 00       	call   c000a564 <appendToDoubleLinkList>
c000a379:	83 c4 10             	add    $0x10,%esp
c000a37c:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a37f:	05 04 01 00 00       	add    $0x104,%eax
c000a384:	83 ec 04             	sub    $0x4,%esp
c000a387:	6a 08                	push   $0x8
c000a389:	6a 00                	push   $0x0
c000a38b:	50                   	push   %eax
c000a38c:	e8 61 10 00 00       	call   c000b3f2 <Memset>
c000a391:	83 c4 10             	add    $0x10,%esp
c000a394:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a397:	05 04 01 00 00       	add    $0x104,%eax
c000a39c:	83 ec 08             	sub    $0x8,%esp
c000a39f:	50                   	push   %eax
c000a3a0:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a3a5:	e8 ba 01 00 00       	call   c000a564 <appendToDoubleLinkList>
c000a3aa:	83 c4 10             	add    $0x10,%esp
c000a3ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a3b0:	c9                   	leave  
c000a3b1:	c3                   	ret    

c000a3b2 <process_execute>:
c000a3b2:	55                   	push   %ebp
c000a3b3:	89 e5                	mov    %esp,%ebp
c000a3b5:	83 ec 28             	sub    $0x28,%esp
c000a3b8:	e8 9a 02 00 00       	call   c000a657 <thread_init>
c000a3bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a3c0:	83 ec 0c             	sub    $0xc,%esp
c000a3c3:	ff 75 f4             	pushl  -0xc(%ebp)
c000a3c6:	e8 f3 02 00 00       	call   c000a6be <thread_create>
c000a3cb:	83 c4 10             	add    $0x10,%esp
c000a3ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a3d1:	05 30 01 00 00       	add    $0x130,%eax
c000a3d6:	83 ec 08             	sub    $0x8,%esp
c000a3d9:	ff 75 10             	pushl  0x10(%ebp)
c000a3dc:	50                   	push   %eax
c000a3dd:	e8 2f 10 00 00       	call   c000b411 <Strcpy>
c000a3e2:	83 c4 10             	add    $0x10,%esp
c000a3e5:	83 ec 08             	sub    $0x8,%esp
c000a3e8:	6a 00                	push   $0x0
c000a3ea:	6a 01                	push   $0x1
c000a3ec:	e8 4b ca ff ff       	call   c0006e3c <alloc_memory>
c000a3f1:	83 c4 10             	add    $0x10,%esp
c000a3f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a3f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a3fa:	05 00 0c 00 00       	add    $0xc00,%eax
c000a3ff:	83 ec 04             	sub    $0x4,%esp
c000a402:	68 00 04 00 00       	push   $0x400
c000a407:	68 00 fc ff ff       	push   $0xfffffc00
c000a40c:	50                   	push   %eax
c000a40d:	e8 b2 0f 00 00       	call   c000b3c4 <Memcpy>
c000a412:	83 c4 10             	add    $0x10,%esp
c000a415:	83 ec 0c             	sub    $0xc,%esp
c000a418:	ff 75 f0             	pushl  -0x10(%ebp)
c000a41b:	e8 ea c9 ff ff       	call   c0006e0a <get_physical_address>
c000a420:	83 c4 10             	add    $0x10,%esp
c000a423:	89 45 ec             	mov    %eax,-0x14(%ebp)
c000a426:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a429:	05 fc 0f 00 00       	add    $0xffc,%eax
c000a42e:	89 45 e8             	mov    %eax,-0x18(%ebp)
c000a431:	8b 45 ec             	mov    -0x14(%ebp),%eax
c000a434:	83 c8 07             	or     $0x7,%eax
c000a437:	89 c2                	mov    %eax,%edx
c000a439:	8b 45 e8             	mov    -0x18(%ebp),%eax
c000a43c:	89 10                	mov    %edx,(%eax)
c000a43e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a441:	8b 55 ec             	mov    -0x14(%ebp),%edx
c000a444:	89 50 04             	mov    %edx,0x4(%eax)
c000a447:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a44a:	83 c0 0c             	add    $0xc,%eax
c000a44d:	83 ec 0c             	sub    $0xc,%esp
c000a450:	50                   	push   %eax
c000a451:	e8 d7 ce ff ff       	call   c000732d <init_memory_block_desc>
c000a456:	83 c4 10             	add    $0x10,%esp
c000a459:	e8 4b fa ff ff       	call   c0009ea9 <create_user_process_address_space>
c000a45e:	89 c2                	mov    %eax,%edx
c000a460:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a463:	89 50 08             	mov    %edx,0x8(%eax)
c000a466:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a469:	8b 00                	mov    (%eax),%eax
c000a46b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
c000a46e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a471:	c7 40 10 39 9f 00 c0 	movl   $0xc0009f39,0x10(%eax)
c000a478:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a47b:	8b 55 08             	mov    0x8(%ebp),%edx
c000a47e:	89 50 18             	mov    %edx,0x18(%eax)
c000a481:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a484:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a487:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a48a:	8b 55 f4             	mov    -0xc(%ebp),%edx
c000a48d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a490:	89 50 20             	mov    %edx,0x20(%eax)
c000a493:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a496:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a49c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a49f:	8b 10                	mov    (%eax),%edx
c000a4a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a4a4:	89 50 04             	mov    %edx,0x4(%eax)
c000a4a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a4aa:	8b 50 04             	mov    0x4(%eax),%edx
c000a4ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a4b0:	89 50 08             	mov    %edx,0x8(%eax)
c000a4b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a4b6:	8b 50 08             	mov    0x8(%eax),%edx
c000a4b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
c000a4bc:	89 50 0c             	mov    %edx,0xc(%eax)
c000a4bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4c2:	05 fc 00 00 00       	add    $0xfc,%eax
c000a4c7:	83 ec 08             	sub    $0x8,%esp
c000a4ca:	50                   	push   %eax
c000a4cb:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a4d0:	e8 8f 00 00 00       	call   c000a564 <appendToDoubleLinkList>
c000a4d5:	83 c4 10             	add    $0x10,%esp
c000a4d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a4db:	05 04 01 00 00       	add    $0x104,%eax
c000a4e0:	83 ec 08             	sub    $0x8,%esp
c000a4e3:	50                   	push   %eax
c000a4e4:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a4e9:	e8 76 00 00 00       	call   c000a564 <appendToDoubleLinkList>
c000a4ee:	83 c4 10             	add    $0x10,%esp
c000a4f1:	90                   	nop
c000a4f2:	c9                   	leave  
c000a4f3:	c3                   	ret    
c000a4f4:	66 90                	xchg   %ax,%ax
c000a4f6:	66 90                	xchg   %ax,%ax
c000a4f8:	66 90                	xchg   %ax,%ax
c000a4fa:	66 90                	xchg   %ax,%ax
c000a4fc:	66 90                	xchg   %ax,%ax
c000a4fe:	66 90                	xchg   %ax,%ax

c000a500 <switch_to>:
c000a500:	56                   	push   %esi
c000a501:	57                   	push   %edi
c000a502:	53                   	push   %ebx
c000a503:	55                   	push   %ebp
c000a504:	89 e5                	mov    %esp,%ebp
c000a506:	8b 45 14             	mov    0x14(%ebp),%eax
c000a509:	89 20                	mov    %esp,(%eax)
c000a50b:	8b 45 18             	mov    0x18(%ebp),%eax
c000a50e:	8b 20                	mov    (%eax),%esp
c000a510:	5d                   	pop    %ebp
c000a511:	5b                   	pop    %ebx
c000a512:	5f                   	pop    %edi
c000a513:	5e                   	pop    %esi
c000a514:	c3                   	ret    

c000a515 <initDoubleLinkList>:
c000a515:	55                   	push   %ebp
c000a516:	89 e5                	mov    %esp,%ebp
c000a518:	8b 45 08             	mov    0x8(%ebp),%eax
c000a51b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a521:	8b 45 08             	mov    0x8(%ebp),%eax
c000a524:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
c000a52b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a52e:	8d 50 08             	lea    0x8(%eax),%edx
c000a531:	8b 45 08             	mov    0x8(%ebp),%eax
c000a534:	89 50 04             	mov    %edx,0x4(%eax)
c000a537:	8b 55 08             	mov    0x8(%ebp),%edx
c000a53a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a53d:	89 50 08             	mov    %edx,0x8(%eax)
c000a540:	90                   	nop
c000a541:	5d                   	pop    %ebp
c000a542:	c3                   	ret    

c000a543 <isListEmpty>:
c000a543:	55                   	push   %ebp
c000a544:	89 e5                	mov    %esp,%ebp
c000a546:	8b 45 08             	mov    0x8(%ebp),%eax
c000a549:	8b 40 04             	mov    0x4(%eax),%eax
c000a54c:	8b 55 08             	mov    0x8(%ebp),%edx
c000a54f:	83 c2 08             	add    $0x8,%edx
c000a552:	39 d0                	cmp    %edx,%eax
c000a554:	75 07                	jne    c000a55d <isListEmpty+0x1a>
c000a556:	b8 01 00 00 00       	mov    $0x1,%eax
c000a55b:	eb 05                	jmp    c000a562 <isListEmpty+0x1f>
c000a55d:	b8 00 00 00 00       	mov    $0x0,%eax
c000a562:	5d                   	pop    %ebp
c000a563:	c3                   	ret    

c000a564 <appendToDoubleLinkList>:
c000a564:	55                   	push   %ebp
c000a565:	89 e5                	mov    %esp,%ebp
c000a567:	83 ec 10             	sub    $0x10,%esp
c000a56a:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a56d:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a570:	8b 45 08             	mov    0x8(%ebp),%eax
c000a573:	8b 50 08             	mov    0x8(%eax),%edx
c000a576:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a579:	89 10                	mov    %edx,(%eax)
c000a57b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a57e:	8b 40 08             	mov    0x8(%eax),%eax
c000a581:	85 c0                	test   %eax,%eax
c000a583:	74 0c                	je     c000a591 <appendToDoubleLinkList+0x2d>
c000a585:	8b 45 08             	mov    0x8(%ebp),%eax
c000a588:	8b 40 08             	mov    0x8(%eax),%eax
c000a58b:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a58e:	89 50 04             	mov    %edx,0x4(%eax)
c000a591:	8b 45 08             	mov    0x8(%ebp),%eax
c000a594:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a597:	89 50 08             	mov    %edx,0x8(%eax)
c000a59a:	8b 45 08             	mov    0x8(%ebp),%eax
c000a59d:	8d 50 08             	lea    0x8(%eax),%edx
c000a5a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a5a3:	89 50 04             	mov    %edx,0x4(%eax)
c000a5a6:	90                   	nop
c000a5a7:	c9                   	leave  
c000a5a8:	c3                   	ret    

c000a5a9 <insertToDoubleLinkList>:
c000a5a9:	55                   	push   %ebp
c000a5aa:	89 e5                	mov    %esp,%ebp
c000a5ac:	83 ec 10             	sub    $0x10,%esp
c000a5af:	8b 45 0c             	mov    0xc(%ebp),%eax
c000a5b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a5b5:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5b8:	8b 50 04             	mov    0x4(%eax),%edx
c000a5bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a5be:	89 50 04             	mov    %edx,0x4(%eax)
c000a5c1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5c4:	8b 40 04             	mov    0x4(%eax),%eax
c000a5c7:	85 c0                	test   %eax,%eax
c000a5c9:	74 0b                	je     c000a5d6 <insertToDoubleLinkList+0x2d>
c000a5cb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5ce:	8b 40 04             	mov    0x4(%eax),%eax
c000a5d1:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a5d4:	89 10                	mov    %edx,(%eax)
c000a5d6:	8b 45 08             	mov    0x8(%ebp),%eax
c000a5d9:	8b 55 fc             	mov    -0x4(%ebp),%edx
c000a5dc:	89 50 04             	mov    %edx,0x4(%eax)
c000a5df:	8b 55 08             	mov    0x8(%ebp),%edx
c000a5e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a5e5:	89 10                	mov    %edx,(%eax)
c000a5e7:	90                   	nop
c000a5e8:	c9                   	leave  
c000a5e9:	c3                   	ret    

c000a5ea <popFromDoubleLinkList>:
c000a5ea:	55                   	push   %ebp
c000a5eb:	89 e5                	mov    %esp,%ebp
c000a5ed:	83 ec 10             	sub    $0x10,%esp
c000a5f0:	ff 75 08             	pushl  0x8(%ebp)
c000a5f3:	e8 4b ff ff ff       	call   c000a543 <isListEmpty>
c000a5f8:	83 c4 04             	add    $0x4,%esp
c000a5fb:	3c 01                	cmp    $0x1,%al
c000a5fd:	75 07                	jne    c000a606 <popFromDoubleLinkList+0x1c>
c000a5ff:	b8 00 00 00 00       	mov    $0x0,%eax
c000a604:	eb 37                	jmp    c000a63d <popFromDoubleLinkList+0x53>
c000a606:	8b 45 08             	mov    0x8(%ebp),%eax
c000a609:	8b 40 08             	mov    0x8(%eax),%eax
c000a60c:	89 45 fc             	mov    %eax,-0x4(%ebp)
c000a60f:	8b 45 08             	mov    0x8(%ebp),%eax
c000a612:	8b 40 08             	mov    0x8(%eax),%eax
c000a615:	8b 00                	mov    (%eax),%eax
c000a617:	85 c0                	test   %eax,%eax
c000a619:	74 11                	je     c000a62c <popFromDoubleLinkList+0x42>
c000a61b:	8b 45 08             	mov    0x8(%ebp),%eax
c000a61e:	8b 40 08             	mov    0x8(%eax),%eax
c000a621:	8b 00                	mov    (%eax),%eax
c000a623:	8b 55 08             	mov    0x8(%ebp),%edx
c000a626:	83 c2 08             	add    $0x8,%edx
c000a629:	89 50 04             	mov    %edx,0x4(%eax)
c000a62c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a62f:	8b 40 08             	mov    0x8(%eax),%eax
c000a632:	8b 10                	mov    (%eax),%edx
c000a634:	8b 45 08             	mov    0x8(%ebp),%eax
c000a637:	89 50 08             	mov    %edx,0x8(%eax)
c000a63a:	8b 45 fc             	mov    -0x4(%ebp),%eax
c000a63d:	c9                   	leave  
c000a63e:	c3                   	ret    

c000a63f <kernel_thread>:
c000a63f:	55                   	push   %ebp
c000a640:	89 e5                	mov    %esp,%ebp
c000a642:	83 ec 08             	sub    $0x8,%esp
c000a645:	fb                   	sti    
c000a646:	83 ec 0c             	sub    $0xc,%esp
c000a649:	ff 75 0c             	pushl  0xc(%ebp)
c000a64c:	8b 45 08             	mov    0x8(%ebp),%eax
c000a64f:	ff d0                	call   *%eax
c000a651:	83 c4 10             	add    $0x10,%esp
c000a654:	90                   	nop
c000a655:	c9                   	leave  
c000a656:	c3                   	ret    

c000a657 <thread_init>:
c000a657:	55                   	push   %ebp
c000a658:	89 e5                	mov    %esp,%ebp
c000a65a:	83 ec 18             	sub    $0x18,%esp
c000a65d:	83 ec 08             	sub    $0x8,%esp
c000a660:	6a 00                	push   $0x0
c000a662:	6a 01                	push   $0x1
c000a664:	e8 d3 c7 ff ff       	call   c0006e3c <alloc_memory>
c000a669:	83 c4 10             	add    $0x10,%esp
c000a66c:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a66f:	83 ec 04             	sub    $0x4,%esp
c000a672:	68 00 10 00 00       	push   $0x1000
c000a677:	6a 00                	push   $0x0
c000a679:	ff 75 f4             	pushl  -0xc(%ebp)
c000a67c:	e8 71 0d 00 00       	call   c000b3f2 <Memset>
c000a681:	83 c4 10             	add    $0x10,%esp
c000a684:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a687:	05 00 10 00 00       	add    $0x1000,%eax
c000a68c:	89 c2                	mov    %eax,%edx
c000a68e:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a691:	89 10                	mov    %edx,(%eax)
c000a693:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a696:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
c000a69d:	a1 30 f7 00 c0       	mov    0xc000f730,%eax
c000a6a2:	83 c0 01             	add    $0x1,%eax
c000a6a5:	a3 30 f7 00 c0       	mov    %eax,0xc000f730
c000a6aa:	8b 15 30 f7 00 c0    	mov    0xc000f730,%edx
c000a6b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6b3:	89 90 20 01 00 00    	mov    %edx,0x120(%eax)
c000a6b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a6bc:	c9                   	leave  
c000a6bd:	c3                   	ret    

c000a6be <thread_create>:
c000a6be:	55                   	push   %ebp
c000a6bf:	89 e5                	mov    %esp,%ebp
c000a6c1:	83 ec 10             	sub    $0x10,%esp
c000a6c4:	c7 45 fc 44 00 00 00 	movl   $0x44,-0x4(%ebp)
c000a6cb:	c7 45 f8 28 00 00 00 	movl   $0x28,-0x8(%ebp)
c000a6d2:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6d5:	8b 00                	mov    (%eax),%eax
c000a6d7:	2b 45 fc             	sub    -0x4(%ebp),%eax
c000a6da:	89 c2                	mov    %eax,%edx
c000a6dc:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6df:	89 10                	mov    %edx,(%eax)
c000a6e1:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6e4:	8b 00                	mov    (%eax),%eax
c000a6e6:	2b 45 f8             	sub    -0x8(%ebp),%eax
c000a6e9:	89 c2                	mov    %eax,%edx
c000a6eb:	8b 45 08             	mov    0x8(%ebp),%eax
c000a6ee:	89 10                	mov    %edx,(%eax)
c000a6f0:	90                   	nop
c000a6f1:	c9                   	leave  
c000a6f2:	c3                   	ret    

c000a6f3 <thread_start>:
c000a6f3:	55                   	push   %ebp
c000a6f4:	89 e5                	mov    %esp,%ebp
c000a6f6:	83 ec 18             	sub    $0x18,%esp
c000a6f9:	e8 59 ff ff ff       	call   c000a657 <thread_init>
c000a6fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
c000a701:	83 ec 0c             	sub    $0xc,%esp
c000a704:	ff 75 f4             	pushl  -0xc(%ebp)
c000a707:	e8 b2 ff ff ff       	call   c000a6be <thread_create>
c000a70c:	83 c4 10             	add    $0x10,%esp
c000a70f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a712:	05 30 01 00 00       	add    $0x130,%eax
c000a717:	83 ec 08             	sub    $0x8,%esp
c000a71a:	ff 75 10             	pushl  0x10(%ebp)
c000a71d:	50                   	push   %eax
c000a71e:	e8 ee 0c 00 00       	call   c000b411 <Strcpy>
c000a723:	83 c4 10             	add    $0x10,%esp
c000a726:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a729:	8b 00                	mov    (%eax),%eax
c000a72b:	89 45 f0             	mov    %eax,-0x10(%ebp)
c000a72e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a731:	c7 40 10 3f a6 00 c0 	movl   $0xc000a63f,0x10(%eax)
c000a738:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a73b:	8b 55 08             	mov    0x8(%ebp),%edx
c000a73e:	89 50 18             	mov    %edx,0x18(%eax)
c000a741:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a744:	8b 55 0c             	mov    0xc(%ebp),%edx
c000a747:	89 50 1c             	mov    %edx,0x1c(%eax)
c000a74a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a74d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
c000a753:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a756:	8b 10                	mov    (%eax),%edx
c000a758:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a75b:	89 50 04             	mov    %edx,0x4(%eax)
c000a75e:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a761:	8b 50 04             	mov    0x4(%eax),%edx
c000a764:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a767:	89 50 08             	mov    %edx,0x8(%eax)
c000a76a:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a76d:	8b 50 08             	mov    0x8(%eax),%edx
c000a770:	8b 45 f0             	mov    -0x10(%ebp),%eax
c000a773:	89 50 0c             	mov    %edx,0xc(%eax)
c000a776:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a779:	05 fc 00 00 00       	add    $0xfc,%eax
c000a77e:	83 ec 08             	sub    $0x8,%esp
c000a781:	50                   	push   %eax
c000a782:	68 8c fd 00 c0       	push   $0xc000fd8c
c000a787:	e8 d8 fd ff ff       	call   c000a564 <appendToDoubleLinkList>
c000a78c:	83 c4 10             	add    $0x10,%esp
c000a78f:	8b 45 f4             	mov    -0xc(%ebp),%eax
c000a792:	05 04 01 00 00       	add    $0x104,%eax
c000a797:	83 ec 08             	sub    $0x8,%esp
c000a79a:	50                   	push   %eax
c000a79b:	68 d4 1e 01 c0       	push   $0xc0011ed4
c000a7a0:	e8 bf fd ff ff       	call   c000a564 <appendToDoubleLinkList>
c000a7a5:	83 c4 10             	add    $0x10,%esp
c000a7a8:	90                   	nop
c000a7a9:	c9                   	leave  
c000a7aa:	c3                   	ret    
